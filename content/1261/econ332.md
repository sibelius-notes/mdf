---
title: "ECON 332: International Finance"
prof: "Barb Bloemhof"
subjects: "ECON"
---

## Sources and References

**Primary textbook** — Feenstra, Robert C. and Alan M. Taylor. *International Economics*, 5th ed. Worth Publishers, 2021. (Any edition 2015–2025 acceptable.)

**Supplementary texts** — Krugman, Paul R., Maurice Obstfeld, and Marc J. Melitz. *International Economics: Theory and Policy*, 12th ed. Pearson, 2018; Obstfeld, Maurice and Kenneth Rogoff. *Foundations of International Macroeconomics*. MIT Press, 1996; Dornbusch, Rudiger. "Expectations and Exchange Rate Dynamics." *Journal of Political Economy* 84 (1976): 1161–76.

**Key papers** — Mundell (1963) on capital mobility and stabilization policy; Fleming (1962); Dornbusch (1976) overshooting model; Obstfeld & Rogoff (1995) intertemporal approach; Calvo & Reinhart (2002) "Fear of Floating"; Rogoff (2002) "Purchasing Power Parity Puzzle"; Rey (2015) "Dilemma not Trilemma."

**Online resources** — MIT OCW 14.54 and 14.581; IMF World Economic Outlook databases; Federal Reserve H.10 exchange rate data; BIS Triennial Central Bank Survey on FX markets; BIS Working Papers on international banking.

---

# Chapter 1: The Foreign Exchange Market

## 1.1 Exchange Rate Basics

The foreign exchange (forex) market is the world's largest financial market — daily turnover exceeded $7.5 trillion in 2022 according to the BIS Triennial Survey. It is a decentralized, over-the-counter market operating around the clock across time zones.

<div class="definition">
<strong>Nominal Exchange Rate:</strong> The price of one currency in terms of another. We denote the exchange rate \( E_{d/f} \) as units of domestic currency per unit of foreign currency (the "price" of foreign currency in domestic currency terms). Example: if \( E_{CAD/USD} = 1.37 \), one US dollar buys 1.37 Canadian dollars.
</div>

Convention matters: if \( E \) rises (more domestic currency per unit of foreign), the domestic currency has *depreciated*. If \( E \) falls, the domestic currency has *appreciated*.

<div class="definition">
<strong>Real Exchange Rate (RER):</strong> \[ q = E \cdot \frac{P^*}{P} \] where \( P^* \) is the foreign price level and \( P \) is the domestic price level, both measured in their own currencies. The RER measures the relative price of the foreign consumption basket in terms of the domestic basket. A rise in \( q \) is a real depreciation (foreign goods become more expensive relative to domestic goods).
</div>

## 1.2 The Spot and Forward Markets

The forex market has several segments:

- **Spot market:** Exchange of currencies for immediate delivery (typically T+2)
- **Forward market:** Agreement today to exchange currencies at a specified rate on a future date; eliminates exchange rate uncertainty for commercial transactions
- **Swap market:** Simultaneous spot and forward transaction; widely used by banks for liquidity management
- **Derivatives:** Currency futures and options traded on exchanges

The *forward premium* on foreign currency is:

\[ fp = \frac{F - E}{E} \]

where \( F \) is the forward rate and \( E \) is the spot rate. A positive forward premium means the foreign currency is trading at a premium — expected to appreciate, or equivalently, the domestic interest rate exceeds the foreign rate.

## 1.3 Covered Interest Parity (CIP)

Covered interest parity is a no-arbitrage condition that links the spot rate, forward rate, and interest rates in two countries. It states:

\[ (1 + i) = \frac{(1 + i^*)F}{E} \]

Or in approximate form:

\[ i \approx i^* + \frac{F - E}{E} = i^* + fp \]

CIP is essentially an accounting identity enforced by arbitrage between the spot market, forward market, and money markets. It holds very tightly (within a few basis points) in normal times for major currency pairs, though it broke down during the 2008–2009 financial crisis due to balance sheet constraints at banks.

## 1.4 Uncovered Interest Parity (UIP)

If investors are risk-neutral and have rational expectations, they are indifferent between holding domestic and foreign currency assets when:

\[ i = i^* + \frac{E^e - E}{E} \]

where \( E^e \) is the expected future spot rate. This is *uncovered interest parity* (UIP): the domestic interest rate equals the foreign rate plus the expected rate of depreciation.

<div class="remark">
<strong>UIP and exchange rate determination:</strong> Given expectations \( E^e \) and the foreign interest rate \( i^* \), UIP pins down the current spot rate as a decreasing function of the domestic interest rate — higher domestic rates attract capital inflows, appreciate the spot rate, creating the expected future depreciation needed to satisfy UIP.
</div>

Empirically, UIP is systematically violated — the "forward premium puzzle." High interest rate currencies tend to appreciate rather than depreciate (the *carry trade* is profitable on average). Explanations include risk premia, peso problems, and departure from rational expectations.

## 1.5 Triangular Arbitrage and Cross-Rates

In an efficient market, cross-rates must be consistent to prevent triangular arbitrage. If \( E_{USD/EUR} = 1.10 \), \( E_{CAD/EUR} = 1.48 \), then the implied cross-rate is \( E_{CAD/USD} = 1.48/1.10 = 1.345 \). Any deviation from this relationship is eliminated by arbitrage within milliseconds in modern electronic markets.

---

# Chapter 2: Exchange Rate Determination — Short Run

## 2.1 The Asset Market Approach

Modern exchange rate theory treats the exchange rate as the relative price of two assets (currencies). Like stock prices, exchange rates are forward-looking: they depend on expectations of future fundamentals (money supply, output, interest rates). This asset market approach is the foundation of all modern exchange rate models.

## 2.2 The Money Market and the Interest Rate

In each country, the nominal interest rate is determined by money market equilibrium:

\[ \frac{M^s}{P} = L(i, Y) \]

where \( M^s \) is the money supply, \( P \) the price level, \( i \) the interest rate, and \( Y \) real income. Money demand \( L \) is increasing in \( Y \) (more transactions demand) and decreasing in \( i \) (higher opportunity cost of holding money).

Solving for the interest rate as a function of real money balances and income:

\[ i = i\!\left(\frac{M}{P}, Y\right), \quad \frac{\partial i}{\partial (M/P)} < 0, \quad \frac{\partial i}{\partial Y} > 0 \]

## 2.3 Short-Run Equilibrium in the Forex Market

Combining the UIP condition with money market equilibria in both countries yields short-run exchange rate determination. The key diagram is:

- **Horizontal axis:** Exchange rate \( E \)
- **Vertical axis:** Interest rate
- **Domestic returns schedule:** Horizontal line at \( i \)
- **Foreign currency returns schedule:** Downward sloping in \( E \) (as \( E \) rises, UIP requires expected future appreciation, so the return on foreign assets in domestic terms rises for any given \( i^* \) and \( E^e \))

Equilibrium is where: \( i = i^* + (E^e - E)/E \)

**Comparative statics:**

| Shock | Effect on \( E \) (short run) |
|---|---|
| \( M^s \uparrow \) | \( i \downarrow \) → \( E \uparrow \) (depreciation) |
| \( Y \uparrow \) | \( i \uparrow \) → \( E \downarrow \) (appreciation) |
| \( i^* \uparrow \) | Foreign returns \( \uparrow \) → \( E \uparrow \) (depreciation) |
| \( E^e \uparrow \) | Expected depreciation \( \uparrow \) → \( E \uparrow \) (depreciation) |

## 2.4 Dornbusch Overshooting Model

The Dornbusch (1976) model reconciles two empirical observations: (1) exchange rates are highly volatile in the short run, and (2) in the long run, exchange rates move roughly in line with relative prices (PPP). The key assumption is **short-run price stickiness** combined with long-run price flexibility.

**Setup:**
- Money market clears instantaneously (financial markets flexible)
- Goods market clears slowly (prices sticky in short run)
- Long run: PPP holds

**Mechanism after a permanent money supply increase:**

1. **Impact (short run, prices fixed):** \( M \uparrow \) at fixed \( P \) → real money supply \( (M/P) \uparrow \) → \( i \downarrow \). For UIP to hold with \( i < i^* \), the market expects future appreciation. This requires current spot rate to *overshoot* the long-run level.

2. **Transition:** As time passes, the price level gradually rises (prices slowly adjust). Real money supply \( M/P \) returns toward its original level. Interest rate rises back toward \( i^* \). Exchange rate slowly appreciates back toward the new (higher) long-run PPP level.

3. **Long run:** \( P \) has risen proportionally to \( M \). Real money supply, interest rate, and real exchange rate are all back to pre-shock values. The nominal exchange rate is permanently higher (proportionally to the money increase), consistent with long-run PPP.

<div class="theorem">
<strong>Dornbusch Overshooting:</strong> When prices are sticky, a permanent increase in the money supply causes the exchange rate to depreciate in the short run by <em>more</em> than the long-run equilibrium amount. The short-run depreciation exceeds the long-run PPP-implied depreciation by exactly the amount needed to generate the expected appreciation consistent with the reduced domestic interest rate.
</div>

Formally, if the long-run equilibrium exchange rate is \( \bar{E} \) and the adjustment speed of prices is \( \theta \), the short-run overshooting is:

\[ E_0 - \bar{E} = -\frac{1}{\theta \lambda}(M/P - \overline{M/P}) \]

where \( \lambda \) is the interest semi-elasticity of money demand. Slower price adjustment (smaller \( \theta \)) implies greater overshooting.

**Policy implications:** The Dornbusch model explains why exchange rates are much more volatile than underlying macroeconomic fundamentals — even a predictable, fundamental change in the money supply causes an outsized short-run exchange rate response due to price stickiness.

---

# Chapter 3: Exchange Rate Determination — Long Run

## 3.1 Purchasing Power Parity (PPP)

The long-run anchor for exchange rates is the *law of one price* and its aggregate extension, PPP.

<div class="theorem">
<strong>Law of One Price:</strong> In competitive markets with no transportation costs or trade barriers, identical goods must sell for the same price in all locations when expressed in a common currency: \( P_i = E \cdot P^*_i \).
</div>

<div class="theorem">
<strong>Absolute PPP:</strong> The exchange rate equals the ratio of overall price levels: \[ E = \frac{P}{P^*} \]
</div>

<div class="theorem">
<strong>Relative PPP:</strong> The rate of change of the exchange rate equals the difference in inflation rates: \[ \frac{\Delta E}{E} = \pi - \pi^* \] where \( \pi \) and \( \pi^* \) are domestic and foreign inflation rates.
</div>

**Evidence:** Absolute PPP performs poorly in the short run — the "Penn effect" shows that rich countries have systematically higher price levels (the Balassa-Samuelson effect, explained below). Relative PPP holds better over long horizons (5–10 years) and for high-inflation episodes.

## 3.2 The Balassa-Samuelson Effect

The Balassa-Samuelson hypothesis explains persistent deviations from PPP across countries with different income levels:

- **Traded goods:** Productivity differences exist, and prices converge internationally (law of one price holds)
- **Non-traded goods (services):** Productivity is more similar across countries, but wages are equalized within countries (mobile labor)

In a richer, more productive country:
1. High productivity in traded goods → high wages
2. High wages bid up the price of non-traded goods (haircuts, restaurants)
3. Overall price level is higher than in poorer countries, even after converting at market exchange rates

This implies that real exchange rates for richer countries are systematically overvalued relative to PPP — the "Penn effect" — and that fast-growing emerging markets (e.g., China) should see their real exchange rates appreciate over time.

## 3.3 The Monetary Model of Exchange Rates

The long-run monetary model combines PPP with money market equilibrium in both countries:

Domestic: \( P = M/L(i, Y) \)
Foreign: \( P^* = M^*/L(i^*, Y^*) \)
PPP: \( E = P/P^* \)

Combining:

\[ E = \frac{M}{M^*} \cdot \frac{L(i^*, Y^*)}{L(i, Y)} \]

**Predictions:**
- A 10% increase in the domestic money supply relative to foreign → 10% long-run depreciation (money neutrality)
- Higher domestic real income → lower domestic price level (more money demand) → appreciation
- Higher domestic interest rate → higher inflation expectations → depreciation (via Fisher effect)

## 3.4 The Fisher Effect and Real Interest Rates

The Fisher equation links nominal interest rates to real rates and expected inflation:

\[ i = r + \pi^e \]

where \( r \) is the real interest rate and \( \pi^e \) is expected inflation. The *real interest parity* condition (combining UIP with relative PPP) states that real interest rates are equalized across countries:

\[ r = r^* \]

This follows because UIP gives \( i - i^* = \Delta E^e/E \) and relative PPP gives \( \Delta E^e/E = \pi^e - \pi^{e*} \), so \( (i - \pi^e) = (i^* - \pi^{e*}) \), i.e., \( r = r^* \).

**Evidence:** Real interest rate parity holds loosely over long horizons but is violated in the short run due to exchange rate risk premia and deviations from PPP.

---

# Chapter 4: The Balance of Payments

## 4.1 Structure of the Balance of Payments

The balance of payments (BOP) is a double-entry accounting record of all economic transactions between domestic residents and the rest of the world over a given period (typically a year or quarter).

<div class="definition">
<strong>Current Account (CA):</strong> Records:
<ul>
<li><em>Trade balance</em>: exports minus imports of goods</li>
<li><em>Services balance</em>: exports minus imports of services (tourism, financial services, royalties)</li>
<li><em>Primary income</em>: net income from foreign investments (wages of cross-border workers, investment income)</li>
<li><em>Secondary income</em>: net transfers (remittances, foreign aid, pension payments)</li>
</ul>
A <strong>current account surplus</strong> means the country is a net exporter of goods, services, and income — it is accumulating claims on the rest of the world.
</div>

<div class="definition">
<strong>Capital Account:</strong> Records relatively small transfers of capital (debt forgiveness, migrants' assets). In most countries this is a minor account.
</div>

<div class="definition">
<strong>Financial Account (FA):</strong> Records cross-border transactions in financial assets:
<ul>
<li><em>Foreign direct investment (FDI)</em>: ownership of 10%+ of a foreign enterprise</li>
<li><em>Portfolio investment</em>: equities and debt securities held for returns, not control</li>
<li><em>Other investment</em>: bank loans, trade credit</li>
<li><em>Reserve assets</em>: changes in the central bank's holdings of foreign reserves</li>
</ul>
</div>

**Accounting identity:** By double-entry bookkeeping, the BOP always sums to zero:

\[ CA + KA + FA = 0 \]

or equivalently (ignoring the tiny capital account):

\[ CA + FA = 0 \]

A current account deficit (\( CA < 0 \)) must be financed by a net capital inflow (\( FA > 0 \)) — the country is borrowing from the rest of the world (or drawing down its reserves).

## 4.2 The Intertemporal Approach to the Current Account

The intertemporal approach (Obstfeld and Rogoff 1995) treats the current account as the outcome of forward-looking saving and investment decisions:

\[ CA = S - I \]

where \( S \) is national saving and \( I \) is domestic investment. A current account deficit arises when domestic investment exceeds domestic saving — the country is borrowing from abroad to finance more investment than it can fund domestically, or to smooth consumption in the face of a temporary income shock.

**Key predictions:**
- A *temporary* decline in output raises the current account deficit (households smooth consumption, saving falls)
- A *permanent* decline in output reduces both saving and investment proportionally → smaller current account response
- An investment boom (e.g., a positive productivity shock) worsens the current account

## 4.3 Absorption Approach

The current account equals output minus domestic absorption:

\[ CA = Y - A = Y - (C + I + G) \]

where \( A = C + I + G \) is domestic absorption. This links the current account to domestic expenditure decisions. Policy implications:

- To reduce a current account deficit, a country must either increase output or reduce domestic absorption (fiscal consolidation, private sector deleveraging)
- Exchange rate depreciation improves the trade balance by switching expenditure toward domestic goods — but the *J-curve* suggests the trade balance initially worsens (import bills rise before export volumes respond) before improving

## 4.4 The J-Curve

After a currency depreciation:
1. **Short run (prices sticky):** Import volumes unchanged but import prices rise (imports more expensive in domestic currency). Trade balance worsens (higher import bill).
2. **Medium run (volumes adjust):** Domestic consumers shift away from imports; foreign consumers increase purchases of now-cheaper domestic exports. Trade balance improves.

The net result traces a "J" shape over time — initial deterioration followed by improvement.

**Marshall-Lerner condition:** Currency depreciation improves the trade balance if and only if the sum of domestic import demand and foreign import demand elasticities exceeds one: \( |\epsilon_M| + |\epsilon_X| > 1 \). Empirical estimates suggest this condition holds in the long run but often fails in the short run.

---

# Chapter 5: Fixed Exchange Rates and Currency Crises

## 5.1 Managing a Fixed Exchange Rate

Under a fixed exchange rate regime, the central bank commits to maintaining \( E \) at a target level \( \bar{E} \) by buying or selling foreign reserves at that price.

**Mechanism:** If demand for domestic currency falls (supply of domestic currency rises):
- \( E \) tends to rise (depreciation pressure)
- Central bank buys domestic currency and sells foreign reserves to maintain \( E = \bar{E} \)
- Domestic money supply contracts (sterilization can offset this temporarily)

**Reserve constraint:** The central bank can maintain the peg only as long as it has sufficient reserves. Once reserves are exhausted, the peg must be abandoned.

## 5.2 The Money Supply Under a Fixed Rate

The central bank's balance sheet identity:

\[ M = \mu \cdot (D + F) \]

where \( D \) is domestic credit (claims on government and banks), \( F \) is foreign reserves (at domestic currency value), and \( \mu \) is the money multiplier.

Under a fixed rate, the central bank cannot independently control the money supply. If the domestic credit component grows faster than money demand (e.g., due to deficit monetization), reserves must fall to keep the money supply consistent with the exchange rate peg. This is the root cause of first-generation currency crises.

## 5.3 First-Generation Currency Crisis Model (Krugman 1979)

Krugman's model shows that a fixed rate cannot survive if the government persistently runs budget deficits monetized by the central bank:

1. Domestic credit grows at a constant rate (to finance deficits)
2. Money demand is stable → reserves must fall at the same rate
3. Before reserves reach zero, speculators launch a *speculative attack* — they sell the domestic currency en masse, exhausting reserves in one step
4. The timing of the attack is determined by the "shadow floating rate" — the exchange rate that would prevail if the peg were abandoned

<div class="theorem">
<strong>First-Generation Crisis:</strong> A speculative attack occurs at the moment the shadow floating exchange rate equals the fixed rate. This happens <em>before</em> reserves are naturally exhausted, because rational speculators anticipate the eventual collapse and act preemptively.
</div>

## 5.4 Second-Generation Currency Crisis Models

Second-generation models (Obstfeld 1994, 1996) feature *multiple equilibria* driven by self-fulfilling expectations:

- There exists a range of reserve levels where the peg can be maintained if investors believe it will be — but would collapse if investors attack
- Sunspot events (news, contagion from other crises) can shift beliefs and trigger an attack even when fundamentals are sound

This framework better explains crises where economic fundamentals did not clearly require devaluation, such as the 1992 ERM crisis (UK, Italy) and the 1994 Mexican peso crisis.

## 5.5 Third-Generation Currency Crisis Models: Balance Sheet Effects

Asian financial crises of 1997–98 highlighted a different mechanism: *balance sheet vulnerabilities*:

- Banks and firms had borrowed in foreign currency (\( \$ \)) but earned revenues in domestic currency
- Currency depreciation → domestic-currency value of foreign debt soars → insolvency
- Insolvency → bank runs → credit crunch → output collapse

This balance-sheet channel creates a *vicious cycle*: depreciation causes insolvency, insolvency causes capital flight, capital flight causes further depreciation.

---

# Chapter 6: Open Economy Macroeconomics — The Mundell-Fleming Model

## 6.1 Model Setup

The Mundell-Fleming (MF) model extends the closed-economy IS-LM model to an open economy with perfect capital mobility. It is the workhorse model for short-run macroeconomic policy analysis in open economies.

**Key assumption:** Perfect capital mobility — interest rates are equalized internationally via capital flows. Any deviation from \( i = i^* \) triggers instantaneous capital flows that eliminate the gap.

**Model equations:**

IS curve (goods market):
\[ Y = C(Y-T) + I(i) + G + NX(E, Y, Y^*) \]

LM curve (money market):
\[ \frac{M}{P} = L(i, Y) \]

Balance of payments (capital flow):
\[ i = i^* \quad \text{(with perfect capital mobility)} \]

## 6.2 Mundell-Fleming Under Flexible Exchange Rates

Under flexible exchange rates, the exchange rate adjusts to ensure \( BP = 0 \) (balance of payments equilibrium).

**Monetary policy expansion (\( M \uparrow \)):**
1. LM shifts right → at \( i = i^* \), \( Y \) tends to rise
2. But higher \( Y \) would require \( i > i^* \) (via LM) — instead, capital outflows depreciate \( E \)
3. Depreciation raises NX → IS shifts right
4. New equilibrium: higher \( Y \), same \( i = i^* \), depreciated \( E \)

\( \Rightarrow \) **Monetary policy is fully effective** under flexible exchange rates.

**Fiscal policy expansion (\( G \uparrow \)):**
1. IS shifts right → at \( i = i^* \), \( Y \) tends to rise
2. Higher income raises money demand → \( i \) tends to rise above \( i^* \)
3. Capital inflows appreciate \( E \)
4. Appreciation reduces NX → IS shifts back to original position
5. New equilibrium: unchanged \( Y \), same \( i = i^* \), appreciated \( E \)

\( \Rightarrow \) **Fiscal policy is fully ineffective** (complete crowding out via exchange rate) under flexible exchange rates with perfect capital mobility.

## 6.3 Mundell-Fleming Under Fixed Exchange Rates

Under fixed exchange rates, the central bank maintains \( E = \bar{E} \) by adjusting the money supply endogenously.

**Monetary policy expansion (\( M \uparrow \)):**
1. LM shifts right → \( i \) tends to fall below \( i^* \)
2. Capital outflows → central bank sells reserves, buys domestic currency
3. Money supply contracts back to original level
4. No change in \( Y \)

\( \Rightarrow \) **Monetary policy is fully ineffective** under fixed exchange rates (sterilization impossible in the long run).

**Fiscal policy expansion (\( G \uparrow \)):**
1. IS shifts right → \( i \) tends to rise above \( i^* \)
2. Capital inflows → central bank buys reserves, sells domestic currency
3. Money supply expands → LM shifts right
4. Higher \( Y \) at unchanged \( i = i^* \)

\( \Rightarrow \) **Fiscal policy is fully effective** under fixed exchange rates (no crowding out because the money supply accommodates).

<div class="theorem">
<strong>Mundell-Fleming Summary:</strong>
<table>
<tr><th>Policy</th><th>Flexible \( E \)</th><th>Fixed \( E \)</th></tr>
<tr><td>Monetary expansion</td><td>Effective (depreciation raises NX)</td><td>Ineffective (reserves offsetting)</td></tr>
<tr><td>Fiscal expansion</td><td>Ineffective (appreciation crowds out NX)</td><td>Effective (money supply accommodates)</td></tr>
</table>
</div>

## 6.4 The Impossible Trinity (Trilemma)

The MF model embeds a fundamental constraint:

<div class="theorem">
<strong>The Impossible Trinity:</strong> A country cannot simultaneously maintain (1) free capital mobility, (2) a fixed exchange rate, and (3) an independent monetary policy. Any two of these objectives can be achieved, but not all three.
</div>

**Evidence across regimes:**
- **Bretton Woods (1944–1971):** Fixed exchange rates + monetary independence → capital controls (sacrificed capital mobility)
- **European Monetary Union:** Free capital mobility + fixed rates (common currency) → no independent monetary policy (sacrificed monetary independence)
- **Post-1971 US, UK, Canada:** Free capital mobility + independent monetary policy → floating exchange rates (sacrificed fixed rates)

Hélène Rey (2015) has argued that even flexible exchange rates do not restore full monetary independence when global financial cycles are driven by US monetary policy. This suggests the trilemma may in practice be a *dilemma* for financially integrated economies.

---

# Chapter 7: International Capital Flows and Financial Crises

## 7.1 Patterns of International Capital Flows

Capital flows across borders take many forms:
- **Foreign Direct Investment (FDI):** Long-term ownership stake in enterprises; historically relatively stable
- **Portfolio equity and bond flows:** More volatile; driven by return differentials and risk appetite
- **Bank lending:** Cross-border syndicated loans; highly procyclical
- **Derivatives:** Currency and interest rate derivatives for hedging and speculation

**Lucas Paradox:** Standard theory predicts capital should flow from rich (capital-abundant, low return) to poor (capital-scarce, high return) countries. In practice, capital often flows the opposite direction. Explanations include institutional quality differences, sovereign risk, and the role of the dollar as global reserve currency.

## 7.2 Sudden Stops and Financial Contagion

A *sudden stop* (Calvo 1998) is an abrupt and large reversal of capital inflows, forcing the affected country to rapidly adjust its current account. The mechanism:

1. Capital inflows sustain domestic absorption above income
2. An external shock (rising global interest rates, a crisis elsewhere) triggers a risk re-assessment
3. Investors simultaneously withdraw capital
4. The current account must improve instantly — but only through a sharp contraction of domestic absorption (recession) and/or a large currency depreciation

**Financial contagion** occurs when a crisis in one country spreads to others through:
- **Trade linkages:** Countries sharing export markets
- **Financial linkages:** Common creditors who liquidate positions broadly
- **Confidence channel:** Loss of investor confidence in an entire asset class (e.g., "emerging markets")

## 7.3 The 1997–98 Asian Financial Crisis

The Asian crisis illustrates third-generation (balance sheet) crisis dynamics:

**Pre-crisis:** Large capital inflows to Thailand, Indonesia, South Korea, Malaysia → credit boom, current account deficits, currency pegged to USD.

**Trigger (July 1997):** Thailand exhausts reserves defending the baht peg. Baht floats and depreciates sharply.

**Contagion:** Crisis spreads across the region as investors withdraw from all "Asian emerging markets."

**Balance sheet channel:** Banks and corporations had borrowed in USD but earned in local currency. Devaluations of 30–70% caused insolvency throughout the banking system, producing severe recessions.

**IMF response:** High-conditionality loans requiring fiscal consolidation, high interest rates to defend currencies (controversial — critics argued this worsened recessions).

## 7.4 The 2008–2009 Global Financial Crisis

The global financial crisis originated in the US subprime mortgage market and spread globally through financial linkages:

1. US housing bubble inflated by loose monetary policy, financial innovation (mortgage-backed securities, CDOs), and weak regulation
2. Bubble collapse → write-downs at US banks and European banks holding US securities
3. Interbank lending freezes → Lehman Brothers fails (September 2008)
4. Dollar appreciation (flight to safety) → additional losses for borrowers outside the US
5. Global trade collapse (trade finance dried up) → synchronized recession in all major economies

**International dimension:** The crisis highlighted the *global banking glut* (Shin 2012) — European banks had intermediated large flows through US dollar wholesale funding markets, transmitting the US financial shock globally.

## 7.5 Reserve Accumulation and "Bretton Woods II"

Following the Asian crisis, many emerging market economies (especially in East Asia) dramatically increased their foreign reserve holdings as self-insurance against sudden stops. China, for example, accumulated reserves exceeding $4 trillion at peak.

Dooley, Folkerts-Landau, and Garber (2003) argued this represented a new "Bretton Woods II" — emerging markets deliberately undervalued their currencies (accumulating reserves) to sustain export-led growth strategies, while the United States provided the global reserve currency and absorbed global demand.

---

# Chapter 8: Exchange Rate Regimes — Choices and Consequences

## 8.1 The Spectrum of Exchange Rate Regimes

Exchange rate regimes range from fully flexible to hard pegs:

1. **Free float:** Central bank does not intervene; exchange rate determined by market
2. **Managed float ("dirty float"):** Central bank intervenes occasionally to smooth volatility but does not commit to a target
3. **Crawling peg:** Exchange rate adjusted gradually at a pre-announced rate (often to offset inflation differentials)
4. **Fixed peg:** Exchange rate fixed to another currency; central bank maintains peg with reserves
5. **Currency board:** Monetary base 100% backed by foreign reserves; legally binding commitment
6. **Dollarization/monetary union:** Country adopts another currency (dollarization) or shares a common currency (Eurozone)

## 8.2 Optimal Currency Area (OCA) Theory

When should countries form a monetary union (or use a common peg)? Mundell (1961) proposed the *optimal currency area* criteria:

<div class="definition">
<strong>Optimal Currency Area (OCA):</strong> A group of countries that would benefit from using a common currency (fixed exchange rate among themselves, no independent monetary policy) because:
<ul>
<li><em>Factor mobility</em>: Labor and capital can freely move between countries in response to asymmetric shocks</li>
<li><em>Wage/price flexibility</em>: Real adjustment can occur without nominal exchange rate changes</li>
<li><em>Trade integration</em>: High bilateral trade makes the benefits of a common currency (eliminating exchange rate uncertainty) large</li>
<li><em>Symmetric shocks</em>: Business cycles are synchronized, reducing the cost of losing monetary policy independence</li>
<li><em>Fiscal transfers</em>: Federal fiscal mechanisms can cushion asymmetric shocks</li>
</ul>
</div>

**The Eurozone as a test case:** The Eurozone's creation in 1999 was debated precisely on OCA grounds — European labor mobility is lower than in the United States, and European countries have asymmetric business cycles. The 2010–2012 European sovereign debt crisis confirmed these concerns: countries like Greece and Spain could not devalue to restore competitiveness, and lacked US-style federal fiscal transfers.

## 8.3 Fear of Floating

Calvo and Reinhart (2002) documented that many countries that officially claim to float their exchange rates in practice intervene heavily to limit volatility — "fear of floating." Reasons include:

- **Balance sheet effects:** Dollar-denominated liabilities make depreciation harmful
- **Inflation credibility:** In countries with high inflation history, depreciation quickly passes through to prices
- **Trade disruption:** High exchange rate volatility hurts exporters who cannot hedge

## 8.4 Pros and Cons of Fixed vs. Flexible Exchange Rates

**Arguments for fixed rates:**
- Reduces exchange rate uncertainty, lowering transaction costs and promoting trade
- Provides a nominal anchor for monetary policy (anti-inflation credibility)
- Prevents "beggar thy neighbor" competitive depreciations

**Arguments for flexible rates:**
- Allows monetary policy autonomy (responding to domestic shocks)
- Automatic stabilizer: exchange rate depreciates in response to negative demand shocks, boosting exports
- No need to maintain large reserve stocks

---

# Chapter 9: Monetary Policy in Open Economies

## 9.1 The Taylor Rule and Exchange Rate Dynamics

Central banks in advanced economies typically follow inflation-targeting frameworks. The Taylor rule describes the interest rate response to inflation and output gaps:

\[ i = i^* + \phi_\pi (\pi - \pi^{target}) + \phi_Y (Y - Y^{potential}) \]

In an open economy, exchange rate movements transmit through to import prices and inflation, creating additional channels for monetary policy:

1. **Demand channel:** \( i \uparrow \) → \( E \downarrow \) (appreciation) → \( NX \downarrow \) → \( Y \downarrow \)
2. **Price channel (exchange rate pass-through):** \( E \downarrow \) (appreciation) → imported goods cheaper → inflation \( \downarrow \)

**Exchange rate pass-through:** The degree to which exchange rate changes translate into import prices depends on pricing behavior (local currency pricing vs. producer currency pricing) and market competition. Pass-through is typically incomplete in the short run (around 30–60% for advanced economies) and more complete in the long run.

## 9.2 International Monetary Policy Spillovers

Monetary policy in large countries creates spillovers for the rest of the world:

- **US monetary tightening:** Higher US interest rates → capital outflows from emerging markets → EM currency depreciation and financial tightening
- **Quantitative easing:** US QE → lower US rates → capital flows to EM → EM currency appreciation, asset price inflation → concerns about overheating and financial stability

These spillovers create coordination challenges. Raghuram Rajan (former RBI governor) argued that advanced economy central banks should internalize spillover effects in their policy decisions.

## 9.3 The Global Financial Cycle

Rey (2015) documented a global financial cycle — a common factor in capital flows, asset prices, and credit growth across countries — strongly driven by US monetary policy. When the Fed tightens, the global financial cycle tightens, reducing risk appetite and capital flows to all countries, including those with floating exchange rates.

This suggests that the traditional trilemma may be effectively a *dilemma*: with free capital flows, even floating exchange rate countries are significantly constrained in their monetary policy autonomy by the global financial cycle. The policy implication is that capital flow management (capital controls) may be needed to restore monetary policy independence.

## 9.4 Unconventional Monetary Policy and International Effects

After the 2008 crisis, central banks in major economies deployed unconventional monetary policies:
- **Quantitative easing (QE):** Large-scale asset purchases to lower long-term interest rates
- **Forward guidance:** Commitments about future policy rates to manage expectations
- **Negative interest rates:** Used by ECB, Bank of Japan, Swiss National Bank

These policies created large international spillovers through exchange rate channels and global portfolio rebalancing.

---

# Chapter 10: Current Issues in International Finance

## 10.1 Global Imbalances

Persistent global current account imbalances have been a central concern of international macroeconomics since the 1990s:

- United States: persistent and large current account deficits (3–6% of GDP) since the mid-1980s
- China, Germany, Japan, oil exporters: persistent surpluses

The *savings glut hypothesis* (Bernanke 2005) argues that excess savings in emerging markets and oil-exporting countries flowed into US assets, keeping US interest rates low, inflating the housing bubble, and worsening the US current account.

The *twin deficits hypothesis* argues that US fiscal deficits (especially post-2001) drive current account deficits by reducing national saving.

## 10.2 The Dollar as Global Reserve Currency

The US dollar remains the dominant international reserve currency, invoicing currency, and safe-haven asset. "Exorbitant privilege" (Valéry Giscard d'Estaing's phrase) refers to the benefits the United States derives from this status:
- Lower borrowing costs (demand for dollar assets keeps yields low)
- Seigniorage from dollar held abroad
- Ability to borrow in own currency (no "original sin")

The stability of dollar dominance despite the United States' large current account deficits reflects the lack of a credible alternative (the euro and renminbi face institutional or convertibility constraints).

## 10.3 Cryptocurrency and International Finance

Cryptocurrencies like Bitcoin were proposed as alternatives to fiat currencies for international transactions. In practice, their extreme volatility has limited their use as a medium of exchange or store of value for mainstream transactions. *Stablecoins* (pegged to dollars or other assets) are more relevant for cross-border payments. Central Bank Digital Currencies (CBDCs) are being explored by many countries as digital alternatives to cash.

## 10.4 Climate Change and International Finance

Climate change creates new dimensions for international finance:
- **Transition risk:** Stranded assets in fossil fuel industries as carbon regulation tightens
- **Physical risk:** Financial losses from extreme weather events, sea-level rise
- **Green capital flows:** Financing the transition to low-carbon energy systems requires massive cross-border capital mobilization

The IMF, World Bank, and private financial regulators are integrating climate risk into financial stability frameworks, creating new considerations for exchange rates and capital flows.
