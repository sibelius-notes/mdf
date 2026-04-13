---
title: "COMM 101: Introduction to Financial Markets"
prof: "Peter Blake"
subjects: "COMM"
---

## Sources and References

**Primary textbook** — Ross, Westerfield, Jordan, Roberts, *Fundamentals of Corporate Finance*, 11th Canadian ed. (McGraw-Hill Ryerson).
**Supplementary texts** — Bodie et al. *Investments* (Canadian ed.); John C. Hull *Options, Futures, and Other Derivatives*; Burton Malkiel *A Random Walk Down Wall Street*.
**Online resources** — MIT OCW 15.401 Finance Theory I; Canadian Securities Institute open materials.

# Chapter 1: The Role of Finance and Financial Markets

Finance studies how individuals, firms, and governments allocate scarce resources across time under uncertainty. Every financial decision ultimately reduces to three questions: what real assets should we invest in, how should we finance them, and how should we manage the day-to-day cash flows they produce? In a modern economy these decisions are mediated by **financial markets**, the institutional machinery that moves savings from households with surplus capital to firms and governments that need it.

## Why Markets Exist

Without markets, a household wanting to save for retirement would have to lend directly to a firm it trusts, and a firm wanting to build a factory would have to find savers one at a time. The search costs, monitoring costs, and risk of such bilateral arrangements would be crushing. Markets solve this by **pooling**, **diversifying**, and **standardizing** claims. A Canadian saver can buy a share of Royal Bank or a Government of Canada bond through a brokerage account in seconds, and a firm can raise hundreds of millions through a single syndicated issue. The intermediaries — banks, insurance companies, pension funds, mutual funds — transform illiquid, risky, long-dated investments into the liquid, safer, short-dated claims savers prefer.

## Primary vs Secondary Markets

In a **primary market**, new securities are issued directly by the firm or government in exchange for cash. In a **secondary market**, previously issued securities change hands between investors; the firm receives no new money, but secondary trading is what makes primary issues possible in the first place — nobody would buy a bond or share if they could not sell it again. The Toronto Stock Exchange, TSX Venture, Canadian Securities Exchange, and the over-the-counter bond desks of the big six banks together form the core of Canada's secondary markets.

## Money Markets vs Capital Markets

The **money market** deals in short-term debt with maturities under one year — Government of Canada treasury bills, bankers' acceptances, commercial paper, and repurchase agreements. The **capital market** deals in longer-term claims, including bonds with maturities out to thirty years and equity, which is perpetual. Money markets are about liquidity and parking cash; capital markets are about financing real investment.

## The Goal of the Financial Manager

Textbook finance takes as given that the corporate financial manager should maximize the current market value of the firm's existing shares. This is not the same as maximizing short-term profit, market share, or earnings per share. Share value reflects expectations of all future cash flows, discounted for time and risk. A decision that boosts next quarter's earnings by cutting research will reduce share value if investors see it as mortgaging the future. This single criterion — maximize shareholder wealth, subject to legal and ethical constraints — organizes every topic that follows in the course: discounting (Chapters 2–3), capital raising (Chapters 4–6), performance evaluation (Chapters 7–9), and portfolio construction (Chapters 10–12).

# Chapter 2: Time Value of Money — Single Cash Flows

A dollar today is worth more than a dollar tomorrow because today's dollar can be invested to earn interest, because future dollars are uncertain, and because most people would rather consume sooner than later. The **time value of money** (TVM) machinery converts cash flows at different dates into comparable quantities so that decisions can be made coherently.

## Future Value and Compounding

If you invest \( PV \) dollars at rate \( r \) per period for \( n \) periods, the **future value** is

\[ FV_n = PV \cdot (1 + r)^n \]

This is **compound interest**: the interest earned in period one itself earns interest in period two, and so on. By contrast, **simple interest** pays \( PV \cdot r \) each period on the original principal only, giving \( FV_n = PV \cdot (1 + r \cdot n) \). Simple interest is used in some money-market quoting conventions, but compound interest is the correct framework for any multi-period analysis.

<div class="example">
<strong>Example.</strong> Lechuan deposits <em>CAD</em> 1,000 at 5 percent compounded annually for ten years. The future value is \( 1000 \cdot (1.05)^{10} \approx 1628.89 \). At simple interest the same account would hold only <em>CAD</em> 1,500.
</div>

## Present Value and Discounting

Rearranging the compounding formula gives the **present value** of a single future cash flow:

\[ PV = \frac{FV_n}{(1 + r)^n} \]

The rate \( r \) used here is called a **discount rate** when we move backward in time. Discounting is the central operation of finance. Every valuation model — bond pricing, stock pricing, project appraisal, option pricing — is at bottom a weighted sum of discounted cash flows, where the weights are probabilities and the discount rates reflect time and risk.

## Solving for Rate or Time

The single-cash-flow equation has four variables; given any three, the fourth follows. Solving for \( r \) gives the compound growth rate required to turn \( PV \) into \( FV \) over \( n \) periods:

\[ r = \left(\frac{FV_n}{PV}\right)^{1/n} - 1 \]

Solving for \( n \) gives the number of periods required to reach a target, which underlies rules such as the **Rule of 72**: at rate \( r \), a sum roughly doubles in \( 72/r \) periods (with \( r \) expressed as a percent). At 8 percent, doubling takes about nine years.

## Why the Rate Matters Most

Small differences in the discount rate compound into large differences in value over long horizons. A perpetual stream worth \( 100/0.04 = 2500 \) at 4 percent is worth only \( 100/0.06 \approx 1667 \) at 6 percent — a one-third drop from a two-percentage-point move. This sensitivity is why interest-rate forecasts dominate fixed-income markets and why equity valuations fell sharply when central banks raised policy rates in 2022–2023.

# Chapter 3: Time Value of Money — Annuities and Perpetuities

Most real cash-flow streams are not single lumps but sequences: mortgage payments, bond coupons, pension contributions, lease payments. When the cash flows are equal and evenly spaced, closed-form formulas replace term-by-term discounting.

## Ordinary Annuities

An **ordinary annuity** pays \( C \) at the end of each of \( n \) periods. Its present value is

\[ PV = C \cdot \frac{1 - (1 + r)^{-n}}{r} \]

and its future value is

\[ FV = C \cdot \frac{(1 + r)^n - 1}{r} \]

An **annuity due** shifts each payment to the beginning of the period and is worth \( (1 + r) \) times the corresponding ordinary annuity.

<div class="example">
<strong>Example — mortgage payment.</strong> A <em>CAD</em> 400,000 mortgage amortized over 25 years at 5 percent (monthly compounding, \( r = 0.05/12 \), \( n = 300 \)) requires monthly payments of roughly <em>CAD</em> 2,338, found by solving the annuity PV formula for \( C \).
</div>

## Perpetuities and Growing Perpetuities

A **perpetuity** pays \( C \) forever. Although there are infinitely many cash flows, the geometric series collapses to

\[ PV = \frac{C}{r} \]

A **growing perpetuity** pays \( C \) one period from now and grows at constant rate \( g < r \) thereafter:

\[ PV = \frac{C}{r - g} \]

This is the **Gordon growth model**, and it is the seed of the dividend discount model used for stock valuation in Chapter 10. A **growing annuity** applies the same logic over a finite horizon.

## Nominal vs Effective Rates

Rates in Canada are usually quoted as **annual percentage rates** (APR) with a stated compounding frequency. The **effective annual rate** (EAR) translates such a quote into the single rate that, compounded once a year, produces the same year-end balance:

\[ EAR = \left(1 + \frac{APR}{m}\right)^{m} - 1 \]

where \( m \) is the number of compounding periods per year. A credit card quoting 18 percent APR compounded monthly has an EAR of about 19.56 percent; the gap widens with higher rates and more frequent compounding. In the continuous-compounding limit \( EAR = e^{APR} - 1 \). Canadian mortgages are unusual: by law they are quoted with semi-annual compounding rather than monthly, so a 5 percent posted rate has an EAR of about 5.0625 percent and a monthly-equivalent rate of roughly 0.4124 percent.

# Chapter 4: Corporations and the Capital Structure

Firms must choose a legal form and a way to raise money. These two choices shape who bears risk, who controls decisions, and how profits are taxed.

## Forms of Business Organization

A **sole proprietorship** is owned by one person who bears unlimited personal liability for business debts; it is simple and cheap but hard to scale. A **partnership** extends the same logic to multiple owners, with the same unlimited-liability problem unless organized as a limited partnership. A **corporation** is a separate legal person: it can own property, sue and be sued, issue contracts, and raise capital by selling shares. Shareholders enjoy **limited liability** — their maximum loss is their investment — and ownership interests are freely transferable, making it feasible to raise large sums from many small investors. The price of this structure is **double taxation**: corporate profits are taxed at the firm level, and dividends are taxed again at the shareholder level, though Canada's dividend tax credit partially offsets this at the personal level.

## Agency Problems

Separating ownership from management creates an **agency problem**: professional managers may act in their own interest rather than shareholders'. Governance mechanisms — boards of directors, executive compensation tied to stock, takeover threats, institutional investor activism, and securities regulation by provincial commissions such as the Ontario Securities Commission — exist to align incentives, though imperfectly.

## Raising Capital

Corporations raise long-term capital from two basic sources. **Debt** — bank loans, notes, bonds — is contractual: the firm promises fixed payments of interest and principal, interest is tax-deductible, and debt-holders have priority in bankruptcy but no upside beyond their promised payments. **Equity** — common and preferred shares — is residual: shareholders receive whatever is left after debt-holders are paid and the firm has no legal obligation to pay dividends, but shareholders capture all upside beyond the debt claims.

The mix of debt and equity is the **capital structure**. More debt adds a tax shield (because interest is deductible) and disciplines managers, but also raises the risk of **financial distress** — the costs of bankruptcy, lost customers, panicked suppliers, and fire-sale asset disposals. The classical Modigliani-Miller theorem says that without taxes, bankruptcy costs, or information frictions, capital structure is irrelevant; real-world trade-offs are what make the question interesting.

## Going Public

A private firm that has grown beyond what founders and venture investors can finance may conduct an **initial public offering** (IPO). An investment dealer (underwriter) acts as intermediary, valuing the firm, drafting a prospectus, marketing to institutional investors, and typically agreeing to buy the issue from the firm at a set price — a **firm-commitment** underwriting — then reselling to the public at a small markup called the gross spread. Once public, the firm can return to the market with **seasoned equity offerings**, rights issues, or bond issues, tapping capital markets far more cheaply than any private firm could.

# Chapter 5: Debt Markets and Bond Valuation

Debt securities are contracts specifying when and how much will be repaid. They range from overnight repo to 30-year Government of Canada bonds, and together they dwarf equity markets in size.

## Structure of a Bond

A typical bond has a **face value** (or par value) of 1,000, a **coupon rate** that determines periodic interest payments, and a **maturity date** on which the face value is repaid. A 5 percent semi-annual coupon bond with five years to maturity pays 25 every six months plus 1,000 at the end. Bonds may also carry features such as callability, convertibility, or sinking-fund provisions.

## Bond Pricing

A bond's price is the present value of its promised cash flows, discounted at the **yield to maturity** (YTM) — the single rate that equates price and cash flows. For an annual-coupon bond:

\[ P = \sum_{t=1}^{n} \frac{C}{(1 + y)^t} + \frac{F}{(1 + y)^n} \]

The coupon stream is an annuity; the face value is a single cash flow. If the coupon rate exceeds the YTM, the bond trades at a **premium** (above par); if it is lower, at a **discount**; if equal, at par.

<div class="example">
<strong>Example.</strong> A bond paying 5 percent annual coupons on <em>CAD</em> 1,000 face, maturing in three years, priced to yield 6 percent, is worth roughly \( 50/1.06 + 50/1.06^2 + 1050/1.06^3 \approx 973.27 \) — a discount bond because yields rose above the coupon.
</div>

## Interest-Rate Risk

Bond prices move inversely to yields. Longer-maturity and lower-coupon bonds are more sensitive to yield changes; this sensitivity is summarized by **duration**. When the Bank of Canada raises its overnight rate, bond prices across the yield curve tend to fall, with long bonds hit hardest.

## The Money Market

Short-term debt instruments — **Government of Canada treasury bills** (issued weekly at discount), **bankers' acceptances** (short-term corporate drafts guaranteed by a bank), **commercial paper**, and **guaranteed investment certificates** (GICs) — form the money market. Yields here are closely tied to the Bank of Canada's policy rate and serve as the benchmark for floating-rate loans.

## Credit Ratings

Rating agencies — DBRS Morningstar, Moody's, S&P — grade issuers on default risk. Investment-grade ratings run from AAA to BBB; anything lower is **speculative grade** or high-yield. Higher credit risk earns a **credit spread** over equivalent government bonds. Credit spreads widen in recessions and during financial stress, as they did dramatically in 2008 and again in March 2020, and they are among the most useful leading indicators of economic distress.

# Chapter 6: Equity Markets and Stock Trading

Equity represents residual ownership of a corporation. Unlike debt, equity has no maturity and no promised payments; shareholders are entitled to whatever is left after all other claims are satisfied and to a vote in major corporate decisions.

## Common and Preferred Shares

**Common shares** carry voting rights and variable dividends. **Preferred shares** pay a fixed dividend, rank ahead of common in liquidation, and typically do not vote; they behave much like perpetual bonds whose coupons happen to be called dividends. Some preferreds are cumulative (missed dividends must be made up), retractable, or convertible into common shares.

## Canadian Exchanges

The **Toronto Stock Exchange** (TSX) lists about 1,500 senior issuers and is the main venue for Canadian blue chips — banks, pipelines, railroads, insurers, mining and energy companies. The **TSX Venture Exchange** lists smaller, earlier-stage firms, and the **Canadian Securities Exchange** hosts many cannabis and technology issuers. Together with alternative trading systems such as Alpha and NEO, these venues form a fragmented but interlinked market supervised by provincial securities commissions and the Canadian Investment Regulatory Organization (CIRO, the successor to IIROC).

## Order Types and Execution

A **market order** buys or sells immediately at the best available price. A **limit order** specifies a maximum buy price or minimum sell price; it may or may not execute. A **stop order** activates a market order once the price crosses a trigger and is typically used to cap losses. The **bid** is the highest price buyers offer, the **ask** is the lowest price sellers accept, and the **bid-ask spread** is the implicit cost of trading — usually a few basis points on liquid TSX names and much more on small caps. Most trading now routes through electronic order books matched by price-time priority.

## Short Selling and Margin

Investors can buy on **margin**, borrowing part of the purchase price from a broker. They can also **sell short**, borrowing shares from another investor and selling them in the hope of buying back cheaper later. Short selling provides liquidity and helps bring prices toward fundamentals, but is risky because losses are unbounded. Canadian regulators require margin accounts and have rules around naked shorting and failures to deliver.

## From Price to Value

A share's price is set by supply and demand in the secondary market, but finance theory holds that in equilibrium the price equals the present value of expected future dividends. The **constant-growth dividend discount model** is a direct application of the growing perpetuity formula from Chapter 3:

\[ P_0 = \frac{D_1}{r - g} \]

where \( D_1 \) is next year's dividend, \( r \) the required return on equity, and \( g \) the long-run dividend growth rate. For firms that reinvest most earnings, analysts use free-cash-flow or relative-valuation models instead, but the logic is the same — price is discounted future cash.

# Chapter 7: Market Indexes and Informational Efficiency

To talk about "the market" coherently, analysts need summary measures. Indexes aggregate many stocks into one number, and efficiency theory describes how prices relate to information.

## Canadian and US Indexes

The **S&P/TSX Composite Index** covers about 250 of the largest Canadian-listed companies weighted by float-adjusted market capitalization; it is heavily tilted toward financials, energy, and materials, reflecting the structure of the Canadian economy. The narrower **S&P/TSX 60** focuses on the 60 largest names.

In the United States, the **S&P 500** tracks 500 large-cap firms on a market-cap weighting; it is the most-watched equity benchmark in the world. The **Dow Jones Industrial Average** uses a price-weighting of 30 stocks — a historical artifact that makes it a poor portfolio proxy but a familiar headline number. The **NASDAQ Composite** is dominated by technology firms. Global indexes such as MSCI World and MSCI Emerging Markets aggregate across countries.

## Price-Weighted vs Value-Weighted

In a **price-weighted** index such as the Dow, a 10 percent move in a high-priced stock matters more than the same percentage move in a low-priced stock regardless of the firms' sizes. In a **value-weighted** index, each firm's influence equals its share of total market capitalization; this is the weighting a passive buy-and-hold investor would experience, which is why almost all modern benchmarks are value-weighted.

## The Efficient-Markets Hypothesis

Eugene Fama's **efficient-markets hypothesis** (EMH) says that security prices at any moment fully reflect all available information. The hypothesis is usually split into three forms:

- **Weak-form efficiency**: prices reflect all information contained in past prices and volumes, so technical trading rules cannot earn excess returns.
- **Semi-strong-form efficiency**: prices reflect all publicly available information, so fundamental analysis of published financials cannot beat the market on a risk-adjusted basis.
- **Strong-form efficiency**: prices reflect all information, public and private, so not even insiders can systematically profit.

Decades of evidence support weak form strongly, semi-strong form broadly but with documented anomalies (momentum, value, size, quality), and reject strong form — insiders do earn abnormal returns, which is why insider trading is illegal.

## Implications

If markets are at least semi-strong efficient, the average investor cannot expect to beat a passive benchmark after fees. This is the intellectual foundation for **index investing** (Chapter 11). Active managers can still add value through tax management, personalized risk control, and exploiting niche inefficiencies, but the default prior is that a low-cost index fund is hard to beat — a message delivered most forcefully in Malkiel's *A Random Walk Down Wall Street*.

# Chapter 8: Reading Financial Statements

To form an investment opinion you must read the firm's three main reports: the balance sheet, the income statement, and the cash flow statement. Canadian public companies file under IFRS; private firms often use ASPE. The structure is similar enough that the same habits of reading apply.

## The Balance Sheet

The **balance sheet** is a snapshot at one date of what the firm owns and owes. It obeys the identity

\[ \text{Assets} = \text{Liabilities} + \text{Shareholders' Equity} \]

**Assets** are split into current (cash, receivables, inventory, prepaids — expected to convert to cash within a year) and non-current (property, plant and equipment, intangibles, goodwill, long-term investments). **Liabilities** are similarly split into current (payables, short-term debt, current portion of long-term debt) and long-term. **Shareholders' equity** is the residual — share capital raised plus retained earnings minus treasury shares and accumulated other comprehensive income.

Balance-sheet numbers are historical costs for many items, not market values. A factory bought in 1985 may be on the books at a fraction of its replacement cost; brand value and human capital rarely appear at all. Investors must read the notes.

## The Income Statement

The **income statement** reports performance over a period, typically a quarter or year. A simplified structure:

Revenue minus cost of goods sold equals gross profit; gross profit minus operating expenses (selling, general, and administrative costs plus depreciation and amortization) equals **operating income** (EBIT); EBIT minus interest expense equals pretax income; pretax income minus income tax equals **net income**.

Net income is divided by the weighted-average number of shares to give **earnings per share** (EPS), the most-quoted headline number on earnings day. But EPS is accrual-based: it includes non-cash items like depreciation and recognizes revenue when earned rather than when collected. Two firms with identical cash profiles can report very different EPS.

## The Cash Flow Statement

The **cash flow statement** reconciles net income to the actual change in cash, split into three sections:

**Operating activities** start from net income, add back non-cash items, and adjust for changes in working capital. **Investing activities** cover capital expenditures, acquisitions, and asset sales. **Financing activities** cover debt issuance and repayment, share issuance and buybacks, and dividends.

A healthy firm generates more cash from operations than it consumes in investing, leaving **free cash flow** to service debt, buy back shares, or pay dividends. A firm whose earnings look strong but whose operating cash flow is persistently weak — often because receivables or inventories are ballooning — is waving a red flag.

## Reading with a Critical Eye

Accounting is a language, not a truth serum. Managers have discretion over revenue recognition, inventory methods, depreciation schedules, impairment tests, and pension assumptions. The notes to the statements, the management discussion and analysis (MD&A), and the auditor's report exist so that readers can judge how much trust to place in the headline numbers.

# Chapter 9: Ratio Analysis for Investment Decisions

Raw financial statements are hard to compare across firms of different sizes and across time. **Ratios** standardize the numbers and reveal patterns. No single ratio tells the whole story; the art is in combining several and comparing to industry peers and historical trends.

## Liquidity Ratios

**Liquidity ratios** measure short-term solvency — the firm's ability to meet obligations as they fall due. The **current ratio** is current assets divided by current liabilities; values above 1 indicate more current assets than current liabilities. The **quick ratio** (or acid test) excludes inventory: \( (\text{current assets} - \text{inventory}) / \text{current liabilities} \), since inventory may be hard to convert quickly in a crunch.

## Solvency / Leverage Ratios

**Solvency ratios** measure long-term financial health. The **debt-to-equity ratio** is total debt over shareholders' equity; the **debt ratio** is total debt over total assets. The **interest coverage ratio**, or times-interest-earned, is EBIT divided by interest expense — it tells you how much of a cushion the firm has before interest payments eat up all operating profit. Coverage below 2 is a warning sign for most industries.

## Profitability Ratios

**Profitability ratios** relate earnings to revenues or capital invested. **Gross margin** is gross profit over revenue; **operating margin** is operating income over revenue; **net margin** is net income over revenue. **Return on assets** (ROA) is net income over total assets, measuring how efficiently the firm uses its asset base. **Return on equity** (ROE) is net income over shareholders' equity, the bottom-line return to owners.

The **DuPont decomposition** unpacks ROE into three drivers:

\[ ROE = \frac{\text{Net Income}}{\text{Sales}} \cdot \frac{\text{Sales}}{\text{Assets}} \cdot \frac{\text{Assets}}{\text{Equity}} \]

— profit margin, asset turnover, and equity multiplier (leverage). Two firms can reach the same ROE through very different mixes: a supermarket (thin margin, high turnover, modest leverage) and a luxury brand (fat margin, slow turnover, low leverage).

## Efficiency Ratios

**Efficiency** or **activity ratios** show how well the firm uses its assets. **Inventory turnover** is cost of goods sold over average inventory; **days sales in inventory** is 365 divided by turnover. **Receivables turnover** and **days sales outstanding** (DSO) do the same for accounts receivable. A rising DSO without a clear business reason often foreshadows bad debts.

## Market-Value Ratios

**Market-value ratios** combine accounting numbers with the share price. The **price-to-earnings ratio** (P/E) is price per share divided by earnings per share — the price investors pay for a dollar of current earnings. The **price-to-book ratio** (P/B) is price over book value per share. **Dividend yield** is the annual dividend divided by price.

<div class="example">
<strong>Example.</strong> Royal Bank trading at <em>CAD</em> 130 with EPS of <em>CAD</em> 11 has a P/E of about 11.8. A growth stock trading at <em>CAD</em> 200 with EPS of <em>CAD</em> 4 has a P/E of 50 — investors are pricing in much faster earnings growth.
</div>

Ratios become meaningful only in context: compared to competitors, to the firm's own history, and to industry norms. A P/E of 25 is cheap for a software firm and expensive for a utility.

# Chapter 10: Stock-Picking Theories — Fundamental vs Technical, Value vs Growth

Investors who choose individual stocks draw on a few broad schools of thought. The schools disagree about what information matters and how price relates to value, but each has a coherent internal logic and some empirical support.

## Fundamental Analysis

**Fundamental analysis** estimates intrinsic value from the firm's economic reality — revenues, margins, growth prospects, capital structure, industry position, management quality — and compares it to market price. Tools include dividend discount models, discounted free-cash-flow valuation, and comparative multiples like P/E, EV/EBITDA, and P/B. Fundamental analysis is the approach taken by Benjamin Graham, Warren Buffett, and most long-horizon investors. It assumes prices may deviate from value in the short run but converge over time.

## Technical Analysis

**Technical analysis** ignores the underlying business and looks only at price and volume patterns — trends, support and resistance levels, moving averages, head-and-shoulders formations, relative strength indices. Technicians argue that all relevant information is already in the tape, and that recognizable patterns recur because human psychology is stable. Academic evidence on pure technical rules is mixed: weak-form efficiency says simple chart rules shouldn't work, yet momentum — buying recent winners — is one of the most robust anomalies in the data.

## The Efficient-Markets Challenge

Malkiel's *A Random Walk Down Wall Street* argues that stock prices, though not literally random, are close enough to random that neither fundamental nor technical analysis reliably beats a low-cost index fund after fees and taxes. The empirical record of active managers is brutal: in most years a majority of active Canadian and US equity funds underperform their benchmarks, and persistence in outperformance is weak.

## Value vs Growth Investing

**Value investing** seeks stocks trading at low multiples of earnings, book value, or cash flow — companies that are out of favour but fundamentally sound. Its intellectual foundation is Graham and Dodd's *Security Analysis*, and its modern statistical face is the Fama-French value factor (HML), showing that high book-to-market stocks have historically outperformed low book-to-market stocks on a risk-adjusted basis, though the premium has narrowed in recent decades.

**Growth investing** buys firms expected to expand earnings rapidly — typically technology and consumer brands — and is willing to pay high multiples for that future. The approach is associated with investors like Philip Fisher and, in another register, Peter Lynch's "buy what you know" philosophy. Growth portfolios historically have been more volatile and more sensitive to discount-rate changes.

## Quantitative and Factor Investing

A more recent tradition treats stock picking as a statistical exercise: build portfolios on characteristics — size, value, momentum, quality, low volatility — shown to have historically delivered excess returns. This **factor investing** or **smart beta** approach now underlies many ETFs. It is a compromise between pure indexing and traditional active management: systematic rules replace human discretion, and fees stay low.

# Chapter 11: Mutual Funds and Exchange-Traded Funds

Most Canadians invest in equities and bonds indirectly, through pooled vehicles that offer diversification, professional management, and daily liquidity.

## Mutual Fund Mechanics

A **mutual fund** pools money from many investors and buys a portfolio according to its stated strategy. Units are created and redeemed at the end of each trading day at **net asset value** (NAV) — the portfolio's total market value divided by units outstanding. There is no intraday trading; you get that day's closing price whenever you put the order in.

Mutual funds in Canada are regulated by provincial securities commissions and must publish a **Fund Facts** disclosure document describing the strategy, risks, past performance, and fees. The fund's **management expense ratio** (MER) — the sum of management fees, operating costs, and taxes as a percentage of assets — is deducted from fund assets continuously, so reported returns are already net of the MER but not of sales loads or advisor fees.

## Fees and Their Consequences

Canadian mutual funds have historically carried among the highest MERs in the developed world, with actively managed equity funds often charging 2 percent or more. Two percent a year sounds small, but compounded over thirty years it consumes a huge fraction of terminal wealth.

<div class="example">
<strong>Example.</strong> <em>CAD</em> 10,000 compounded at 8 percent for 30 years grows to about <em>CAD</em> 100,627. At 6 percent (after a 2 percent MER) it grows to only <em>CAD</em> 57,435 — fees have eaten roughly 43 percent of the gross return.
</div>

## Active vs Passive

**Active funds** try to beat a benchmark through security selection or market timing. **Passive funds** or **index funds** simply replicate a benchmark — the S&P/TSX Composite, the S&P 500, a global bond index — at minimal cost. The case for passive rests on efficient markets and on fee arithmetic: before fees, the average dollar in active management must, by arithmetic, earn the market return; after fees, it must underperform.

## Exchange-Traded Funds

An **ETF** is a pooled fund whose units trade intraday on an exchange like a stock. Most ETFs are index trackers with very low MERs (some under 10 basis points for broad Canadian or US equity). Authorized participants arbitrage any gap between ETF price and NAV by creating or redeeming baskets of the underlying securities, keeping the price close to fair value. ETFs offer intraday liquidity, tax efficiency, and transparency; they have become the default vehicle for both individual investors building long-term portfolios and institutions implementing factor tilts or hedges.

Canadian investors can hold mutual funds and ETFs in registered accounts such as the **RRSP** (tax-deferred), the **TFSA** (tax-free on growth), the **RESP** (for education), and the **FHSA** (for a first home), each with its own contribution limits and tax treatment. Choosing the right account is often more important than choosing the right fund.

## Other Pooled Vehicles

**Segregated funds** are insurance-wrapped mutual funds with guarantees on principal or death benefit, sold by life insurers. **Closed-end funds** issue a fixed number of shares that trade at prices that may drift from NAV. **Hedge funds** and **alternative mutual funds** use leverage, short selling, and derivatives; they are suitable only for investors who understand the risks and fees involved.

# Chapter 12: Options — Basics and Simple Strategies

Options are derivative contracts whose value depends on an underlying asset. They let investors shape payoff profiles in ways no combination of cash, stock, and bonds can.

## Calls and Puts

A **call option** gives the holder the right, but not the obligation, to **buy** the underlying at a fixed **strike price** \( K \) on or before the expiration date. A **put option** gives the right to **sell** at \( K \). **European** options can be exercised only at expiration; **American** options can be exercised at any time. The option's **premium** is the price paid upfront to the writer.

## Payoff Diagrams

At expiration, a long call is worth

\[ C_T = \max(S_T - K, 0) \]

where \( S_T \) is the underlying price at expiration. A long put is worth \( \max(K - S_T, 0) \). Plotted against \( S_T \), these give the famous hockey-stick diagrams: a call pays off linearly once \( S_T \) exceeds \( K \) and nothing otherwise, while a put pays off as \( S_T \) falls below \( K \). Short positions mirror these: the writer of a call faces unlimited loss if the stock rockets, and the writer of a put faces loss equal to the strike price minus zero if the stock collapses.

## Determinants of Option Value

Before expiration, an option is worth more than its **intrinsic value** (payoff if exercised today) because of **time value** — the chance that the underlying will move favourably before expiry. The five classical drivers in the Black-Scholes framework are the underlying price, the strike, time to expiration, the risk-free rate, and the volatility of the underlying. Higher volatility raises option values because options truncate losses; upside is unlimited but downside is capped at the premium.

## Covered Calls

A **covered call** is a long stock position combined with writing a call at a strike above the current price. The investor collects the premium immediately, sacrificing upside above the strike.

<div class="example">
<strong>Example.</strong> Lechuan owns 100 shares bought at <em>CAD</em> 50 and writes one one-month call struck at <em>CAD</em> 55 for a premium of <em>CAD</em> 1. If the stock ends at <em>CAD</em> 52, the option expires worthless and Lechuan keeps the <em>CAD</em> 100 premium plus the <em>CAD</em> 2 paper gain. If the stock ends at <em>CAD</em> 60, the shares are called away at 55; Lechuan realizes <em>CAD</em> 5 of stock gain plus the <em>CAD</em> 1 premium, for <em>CAD</em> 6 per share — but misses the extra <em>CAD</em> 5 of upside.
</div>

Covered calls are popular among income-oriented investors on high-dividend stocks; a whole family of covered-call ETFs now exists on the TSX.

## Protective Puts

A **protective put** is a long stock position combined with buying a put at or near the current price. The put acts as insurance: below the strike, losses on the stock are offset by gains on the put. The cost is the premium, which is the cost of the insurance. Protective puts are an intuitive hedge for investors who want equity exposure but cannot stomach the downside — for example, in the year before retirement.

## Why Options Matter

Beyond speculation, options are used to hedge currency, commodity, and interest-rate exposures, to shape employee compensation, and to embed optionality in bonds and other securities. Hull's textbook develops the full machinery — binomial trees, Black-Scholes, delta hedging, exotic structures — but at the introductory level the key lessons are that options are rights not obligations, that their value is bounded below by intrinsic value and above by the underlying price, that volatility is as important as direction, and that simple strategies like covered calls and protective puts let investors tune their risk without abandoning their view. With options added to the toolkit from the earlier chapters — time value of money, bonds, stocks, indexes, statements, ratios, and pooled vehicles — a Canadian retail investor has in principle everything needed to construct and evaluate a disciplined portfolio.
