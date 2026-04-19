---
title: "ECON 436: Advanced International Trade"
prof: "Horatiu Rus"
subjects: "ECON"
---

## Sources and References

**Primary textbooks (choose one)** — Feenstra, Robert C. and Alan M. Taylor. *International Trade*, any edition. Pearson/Addison-Wesley; Krugman, Paul R., Maurice Obstfeld, and Marc J. Melitz. *International Economics: Theory and Policy*, any edition. Pearson/Addison-Wesley.

**Advanced textbooks** — Feenstra, Robert C. *Advanced International Trade: Theory and Evidence*. Princeton University Press, 2004/2016 (available via UW Library); Helpman, Elhanan. *Understanding Global Trade*. Harvard University Press, 2011; Helpman, Elhanan and Paul Krugman. *Market Structure and Foreign Trade*. MIT Press, 1987.

**Seminal papers** — Dornbusch, Fischer and Samuelson (1977); Bernhofen and Brown (2004); Costinot and Donaldson (2012); Davis and Weinstein (2001); Trefler (1993); Krugman (1979); Ethier (1982); Brander (1981); Antweiler and Trefler (2002); Melitz (2003); Anderson and van Wincoop (2004); Grossman and Helpman (1994); Goldberg and Maggi (1999); Trefler (2004); Broda, Limao and Weinstein (2008); Autor, Dorn and Hanson (2013); Helpman, Itskhoki and Redding (2010); Goldberg and Pavcnik (2007); Copeland and Taylor (2005); Antweiler, Copeland and Taylor (2001).

**Online resources** — NBER International Trade and Investment program (nber.org); Feenstra's trade data (cid.econ.ucdavis.edu); Princeton's trade theory lecture notes; Costinot and Rodriguez-Clare NBER Handbook chapter on "Trade Theory with Numbers."

---

# Chapter 1: International Trade Stylized Facts and Gains from Trade

## 1.1 Key Stylized Facts About World Trade

Before engaging with trade models, it is useful to establish the empirical regularities that any successful theory must account for.

**Volume and composition:**
- World merchandise exports exceeded \$23 trillion in 2022. Manufactures dominate (~70%), followed by fuels (~12%) and agricultural products (~9%).
- Trade has grown faster than output for most of the post-war period, a phenomenon called *trade deepening*. The ratio of world trade to GDP roughly tripled between 1960 and 2010.
- **Intra-industry trade** is large among high-income countries: the United States simultaneously exports and imports automobiles, chemicals, and machinery. The Grubel-Lloyd index for manufactured goods among OECD members is typically above 0.5.

**Trading partners and gravity:**
- Most trade occurs between countries that are geographically proximate and economically large — the *gravity* pattern. Bilateral trade is approximately proportional to \( GDP_i \times GDP_j / dist_{ij} \).
- Despite falling transport costs, distance still substantially reduces trade, suggesting that trade costs include information, regulatory, and cultural components beyond just freight.

**Firms and trade:**
- Export participation is rare even in manufacturing. In most countries, fewer than 20% of manufacturing plants export. Exporters are larger, more productive, and pay higher wages than non-exporters within the same industry.
- Export volumes are highly concentrated: the top 1% of exporters often account for over 80% of total exports.

**Factor content:**
- The Leontief Paradox (1953) established that US exports were labor-intensive relative to imports, contrary to the H-O prediction for the world's most capital-abundant country. Subsequent work (Trefler 1993) showed that technology differences must be incorporated to reconcile the data with the Heckscher-Ohlin-Vanek framework.

## 1.2 The Gains from Trade: Conceptual Framework

A central question in international economics: how much does trade benefit countries? Can these gains be measured?

**Types of gains:**
1. **Comparative advantage (specialization) gains:** Countries produce more of what they do relatively well
2. **Scale economy gains:** Access to larger markets allows firms to exploit increasing returns
3. **Variety gains:** Consumers access a wider range of products (Krugman 1979, Melitz 2003)
4. **Productivity gains:** Competition from imports and access to imported intermediates raises productivity
5. **Knowledge spillovers:** Technology transfer through trade in intermediate goods and FDI

**The revealed preference approach:** Bernhofen and Brown (2004) provide a particularly clean test of gains from trade that requires minimal theoretical assumptions — a revealed preference argument directly showing that autarky is interior to the free-trade budget set.

---

# Chapter 2: The Ricardian Model

## 2.1 The Classic Ricardian Framework

The Ricardian model attributes comparative advantage to differences in labor productivity across countries. With \( n \) goods indexed \( j = 1, \ldots, n \) and two countries (Home and Foreign), let \( a_j \) and \( a^*_j \) denote unit labor requirements (labor per unit of output) at Home and Foreign respectively.

Home has a comparative advantage in good \( j \) relative to good \( k \) if:

\[
\frac{a_j}{a_k} < \frac{a^*_j}{a^*_k}
\]

With two goods and two countries, this determines complete specialization: Home produces the good with the lower relative unit labor requirement. The gains from trade are positive whenever the two autarky relative prices differ.

## 2.2 Dornbusch, Fischer and Samuelson (1977) — Continuum-of-Goods Model

The seminal contribution of Dornbusch, Fischer and Samuelson (DFS 1977) extended the Ricardian model from a finite number of goods to a **continuum of goods**, indexed by \( z \in [0,1] \) with comparative advantage ordering. The key innovation is that the margin of specialization and the wage ratio are jointly determined in equilibrium.

**Setup:** Index goods so that \( A(z) = a(z)/a^*(z) \) is decreasing in \( z \) — Home has the strongest comparative advantage in goods near \( z = 0 \) and the weakest near \( z = 1 \). Let \( \omega = w/w^* \) be the Home-to-Foreign wage ratio.

**Specialization:** Home produces good \( z \) if its unit labor cost is lower:

\[
w \cdot a(z) < w^* \cdot a^*(z) \implies \omega < A(z)
\]

Since \( A(z) \) is decreasing, there exists a cutoff \( \tilde{z} \) such that:
- Home produces \( z \in [0, \tilde{z}] \) (low-\( z \) goods, comparative advantage goods)
- Foreign produces \( z \in (\tilde{z}, 1] \)

The cutoff is defined by \( \omega = A(\tilde{z}) \), the indifference condition for good \( \tilde{z} \).

**Wage determination:** A second relationship links wages to the share of world income spent on Home goods. If \( b(z) \) is the expenditure share on good \( z \) (summing to 1), and \( L, L^* \) are labor endowments:

\[
\omega = \frac{wL}{w^*L^*} \cdot \frac{\int_{\tilde{z}}^1 b(z)dz}{\int_0^{\tilde{z}} b(z)dz}
\]

This second relationship (the trade balance condition, or BB schedule) is increasing in \( \tilde{z} \): more Home goods in the production basket → higher Home wages needed to balance trade.

**Equilibrium:** The intersection of the \( A(\tilde{z}) \) schedule (decreasing) and the BB schedule (increasing) jointly determines \( (\omega^*, \tilde{z}^*) \) — the equilibrium wage ratio and margin of specialization.

<div class="theorem">
<strong>DFS (1977) Key Results:</strong>
<ul>
<li>Equilibrium involves complete specialization — each country produces a <em>range</em> of goods with no overlap</li>
<li>A larger country (higher \( L \)) achieves a higher real wage (higher \( \omega \)) and a smaller share of goods produced</li>
<li>Gains from trade are strictly positive whenever countries differ in productivity</li>
<li>The model generates a smooth wage response to trade barriers: higher transport costs narrow the range of traded goods and compress wage differences</li>
</ul>
</div>

**Significance:** DFS (1977) became the workhorse model of comparative advantage theory. Its continuous-good structure eliminates the unrealistic knife-edge specialization of the 2×2 model and provides a tractable framework for comparative statics. Eaton and Kortum (2002) built their influential quantitative trade model on a stochastic version of the DFS framework.

## 2.3 Bernhofen and Brown (2004) — A Direct Test of Comparative Advantage

Empirically testing the gains from trade is difficult because we never observe the same country in both autarky and free trade. Japan's forced opening to trade after 1858 (due to US Commodore Perry's "Black Ships") provides a unique natural experiment.

**The revealed-preference test:** Bernhofen and Brown (2004) use the classical revealed-preference inequality. Let \( p^a \) be autarky prices and \( p^t \) be free-trade prices (world prices). Let \( q^a \) be the autarky consumption bundle and \( q^t \) be the free-trade bundle. By revealed preference:

\[
p^a \cdot q^a \geq p^a \cdot q^t
\]

(The autarky bundle was affordable at autarky prices but the trade bundle was preferred under trade.) This implies:

\[
p^a \cdot q^a \geq p^a \cdot q^t
\]

Now, under trade with no tariffs, the trade budget constraint at world prices is:

\[
p^t \cdot q^t = p^t \cdot y^t
\]

Using the identity that the trade balance is zero and manipulating, the *gains from trade* can be expressed without observing the trade equilibrium consumption bundle, only Japan's autarky prices and the vector of net imports under trade.

**Main result:** Using detailed price and trade data for Japan around 1858, Bernhofen and Brown estimate that Japan's welfare under autarky would have been 8–9% of GDP below the free-trade level. This is a lower bound on the gains from trade and represents compelling empirical evidence for Ricardian gains that is remarkably robust to modeling assumptions.

<div class="remark">
<strong>Why this paper matters:</strong> Most empirical tests of trade theory require specifying a structural model and estimating parameters. Bernhofen and Brown's revealed-preference approach provides evidence for the gains from trade with minimal theoretical assumptions — essentially requiring only price data and the axiom of revealed preference. It is among the cleanest empirical exercises in international economics.
</div>

## 2.4 Costinot and Donaldson (2012) — Quantitative Ricardian Trade

Costinot and Donaldson (2012) revisit Ricardian comparative advantage in a modern quantitative framework, using agricultural production data to test predictions about which crops countries specialize in.

**The Eaton-Kortum (2002) framework:** Rather than specifying deterministic productivity differences, Eaton and Kortum (2002) assume that each country \( i \)'s efficiency at producing good \( j \) is drawn from a Fréchet distribution with mean \( T_i \) (overall technological capability) and shape parameter \( \theta \) (the degree of heterogeneity — higher \( \theta \) implies less heterogeneity). The probability that country \( i \) is the lowest-cost supplier to country \( n \) for good \( j \) yields:

\[
\frac{X_{ni}}{X_n} = \frac{T_i (d_{ni} w_i)^{-\theta}}{\sum_k T_k (d_{nk} w_k)^{-\theta}}
\]

where \( X_{ni} \) is country \( n \)'s imports from \( i \), \( X_n \) is total spending, \( d_{ni} \) is the bilateral trade cost, and \( w_i \) is country \( i \)'s wage. This is the *gravity equation* derived from Ricardian foundations.

**Costinot and Donaldson's application:** Using FAO data on potential crop yields across countries and crops (agronomic data on what a given plot of land could produce of each crop), they construct a measure of comparative advantage that is determined purely by geography and climate — not by endogenous trade policies or firm behavior. They test whether the Ricardian model's prediction (countries produce more of crops in which they have higher relative productivity) holds in the data.

**Finding:** The model explains a substantial fraction of the cross-country, cross-crop variation in agricultural production, with quantitative estimates suggesting large potential welfare gains from further trade integration in agriculture.

**Significance:** Costinot and Donaldson (2012) represents a successful application of the "new quantitative trade theory" to rigorously test Ricardian mechanisms using micro data on comparative advantage.

---

# Chapter 3: The Specific Factors Model

## 3.1 From Two Factors to Three

The specific factors model (Jones 1971, Samuelson 1971) bridges the Ricardian model (one factor) and the H-O model (two mobile factors) by assuming one factor is mobile (labor) and others are sector-specific (capital in manufacturing, land in agriculture).

**Setup:** Two sectors \( M \) (manufacturing) and \( A \) (agriculture). Three factors: labor \( L \) (mobile), capital \( K \) (specific to \( M \)), land \( T \) (specific to \( A \)). Production functions:

\[
Q_M = F(K, L_M), \quad Q_A = G(T, L_A), \quad L_M + L_A = \bar{L}
\]

Labor market clearing:

\[
P_M \cdot F_{L_M}(K, L_M) = w = P_A \cdot G_{L_A}(T, L_A)
\]

This condition equates the value of marginal product of labor across sectors.

## 3.2 Factor Returns and Trade

In a diagram with \( L_M \) on the horizontal axis, the labor market equilibrium is found at the intersection of the downward-sloping \( P_M \cdot MPL_M \) schedule and the "mirror" \( P_A \cdot MPL_A \) schedule.

When \( P_M \) rises (manufacturing price increases due to trade opening):
- \( P_M \cdot MPL_M \) shifts up
- Labor moves to manufacturing: \( L_M \uparrow, L_A \downarrow \)
- The wage rises but by less than \( P_M \): \( P_M \uparrow > w \uparrow \) → real wage in terms of manufacturing falls
- Capital owners (manufacturing-specific): marginal product of capital rises + price rises → unambiguous real gain
- Land owners (agriculture-specific): marginal product of land falls (less labor) + \( P_M \) rose (imported good more expensive) → unambiguous real loss

<div class="theorem">
<strong>Specific Factors Distributional Result:</strong> A rise in the relative price of the manufacturing good unambiguously raises the real return to capital (the factor specific to manufacturing) and unambiguously lowers the real return to land (the factor specific to agriculture). The effect on the mobile factor (labor) is ambiguous and depends on the relative importance of the two goods in workers' consumption baskets.
</div>

## 3.3 Short-Run vs. Long-Run Distributional Effects

The specific factors model is best interpreted as a *short-run* model: in the short run, capital and land cannot move between sectors. In the long run, capital is mobile and the H-O Stolper-Samuelson results apply. This distinction is important for understanding the political economy of trade policy:
- In the short run, sector-specific interests (manufacturers, farmers) dominate political battles over trade
- In the long run, the distributional conflict is across factors (capital vs. labor), not across industries

---

# Chapter 4: The Heckscher-Ohlin-Samuelson Model

## 4.1 The 2×2×2 H-O Framework

The Heckscher-Ohlin model (H-O, 1919/1933) explains trade by differences in factor endowments. Two countries, two goods, two factors (capital and labor). Both countries have the same technology; comparative advantage arises from differences in relative factor abundance.

**Key results in summary:**

| Result | Statement |
|---|---|
| Heckscher-Ohlin Theorem | Capital-abundant country exports capital-intensive good |
| Factor Price Equalization | Free trade equalizes factor prices across countries |
| Stolper-Samuelson | Price increase for good \( i \) raises real return to factor used intensively in \( i \) |
| Rybczynski | Factor endowment increase expands output of the intensive-in-that-factor good |

## 4.2 The Heckscher-Ohlin-Vanek (HOV) Framework

The HOV model extends H-O to many countries, goods, and factors. Instead of predicting which goods are traded, it predicts the *factor content of trade*:

<div class="theorem">
<strong>HOV Theorem:</strong> Let \( F_{ik} \) be the factor content of country \( k \)'s net exports (the factor inputs embodied in exports minus those in imports). Then:

\[
F_{ik} = V_{ik} - s_k V_{iw}
\]

where \( V_{ik} \) is country \( k \)'s endowment of factor \( i \), \( s_k \) is country \( k \)'s share of world GDP, and \( V_{iw} \) is the world endowment of factor \( i \). A capital-abundant country (\( V_{Kk} > s_k V_{Kw} \)) should export capital services.
</div>

## 4.3 Davis and Weinstein (2001) — Testing HOV with OECD Data

The HOV theorem performs notoriously poorly in its most basic form. Trefler (1995) showed that the sign prediction (whether a country is a net exporter of a factor's services) is correct only about 50% of the time — no better than a coin flip. Davis and Weinstein (2001) ask whether a more realistic version of HOV, allowing for:
1. **Technology differences** across countries (countries use different input coefficients, violating the identical technology assumption)
2. **Non-traded goods** (affecting the relationship between endowments and trade)
3. **Trade costs** (Armington preferences allowing bilateral trade imbalances)

...can reconcile HOV with the data.

**Data:** OECD input-output tables for 10 countries and a rest-of-the-world aggregate, covering 34 industries and multiple factors.

**Main result:** Once technology differences and trade costs are accounted for, the HOV model performs *much* better. The sign prediction improves from ~50% to ~70–80%, and the slope of the factor content of trade on predicted factor content approaches unity.

<div class="remark">
<strong>Interpretation:</strong> Davis and Weinstein (2001) rehabilitates the factor proportions framework by showing that its failures are largely due to unrealistic maintained assumptions (identical technology, costless trade) rather than a fundamental failure of the endowments-driven theory of trade. Technology differences and trade costs both matter substantially.
</div>

## 4.4 Trefler (1993) — Technology Differences and the HOV Model

Trefler (1993) addressed the "mystery of the missing trade" — the finding that actual factor content of trade is far smaller than the HOV model predicts. The basic HOV model predicts that rich, capital-abundant countries export large quantities of capital services, but actual trade is much more balanced.

**Trefler's solution:** Introduce factor-augmenting technology differences. Country \( k \) has labor efficiency \( \delta_{Lk} \) and capital efficiency \( \delta_{Kk} \). Once these are estimated, the "effective" factor content of trade matches the HOV prediction remarkably well.

**Key finding:** Factor productivity differences are enormous — the "effective" labor endowment of a poor country, after adjusting for lower labor efficiency, is close to what the HOV model requires. The model's failure was an artifact of measuring factor endowments in physical rather than efficiency units.

## 4.5 Extensions and Empirical Tests

**Leontief Paradox revisited:** Leontief (1953) found that US exports were labor-intensive. Resolution: the United States is abundant in *human capital* (skilled labor), and exports human-capital-intensive goods. Once the measurement of factor content accounts for human capital, the paradox largely disappears.

**Multi-factor models:** The H-O model works better with more factors. Schott (2003) showed that the US trades up within product categories as it faces competition from lower-wage countries, consistent with moving to more skill- and capital-intensive varieties of each product.

---

# Chapter 5: Extensions and Empirical Tests of the H-O Model

## 5.1 Empirical Performance of H-O Predictions

Despite its theoretical elegance, the simple H-O model faces several empirical challenges:
- The Leontief Paradox (discussed above)
- Missing trade (Trefler 1995): actual trade volumes are far smaller than predicted
- Factor price equalization fails: wage differences between rich and poor countries are enormous and persist despite substantial trade integration

**Reconciling the model with evidence requires** at minimum: technology differences, multiple factors (including human capital), trade costs, and non-homothetic preferences.

## 5.2 Harrigan (1997) — Technology and the Neoclassical Model

Harrigan (1997) estimates a Rybczynski-type production function that allows both factor endowments *and* total factor productivity to determine specialization. Using OECD data, he finds that technology differences are quantitatively as important as factor endowments in explaining cross-country specialization patterns.

## 5.3 The Factor Content of Trade in Practice

Modern empirical work on the factor content of trade (Katz and Murphy 1992, Borjas, Freeman and Katz 1997) estimates the impact of trade on relative labor demand within countries. This "factor content" approach decomposes changes in relative factor returns into:
1. Changes due to goods price changes (Stolper-Samuelson effects)
2. Changes in technology (biased technical change)

The debate over whether rising wage inequality in the United States since the 1980s is due to trade (Stolper-Samuelson) or skill-biased technical change remains active, though the consensus view favors technical change as the primary driver, with trade playing a contributing role — especially after China's WTO accession in 2001 (see Chapter 12 on the China shock).

---

# Chapter 6: Increasing Returns, Imperfect Competition, and Trade

## 6.1 Why Standard Comparative Advantage Is Not Enough

The Ricardo and H-O models predict that trade flows reflect comparative advantage — inter-industry specialization. But the largest component of trade among high-income countries is *intra-industry trade*: the simultaneous export and import of similar products (automobiles, chemicals, electronics). This requires models with:
- Economies of scale (internal or external)
- Product differentiation
- Imperfect competition

## 6.2 Ethier (1982) — Increasing Returns and International Trade

Ethier (1982) formalized the idea that international specialization in *intermediate inputs* under increasing returns generates gains from trade analogous to Adam Smith's division of labor. With more varieties of specialized intermediate inputs available through trade (due to the expanded "market"), final good producers face lower costs even if their own production function has constant returns.

**Key insight:** Gains from international trade can arise from greater specialization in intermediate goods — not just final goods. This provides a microfoundation for production-side gains from trade that are distinct from consumer variety gains.

Ethier also formalized the concept of *intra-industry trade in intermediates*, where countries simultaneously export and import varieties of the same intermediate good. This is now understood as a description of global value chains.

## 6.3 Krugman (1979) — Monopolistic Competition and Trade

Paul Krugman's 1979 model launched the "New Trade Theory" and eventually contributed to his 2008 Nobel Prize. The model has three building blocks:

**Preferences:** Consumers love variety. Utility over a continuum of differentiated goods with elasticity of substitution \( \sigma \):

\[
U = \left[\int_0^n c(i)^{(\sigma-1)/\sigma} di\right]^{\sigma/(\sigma-1)}, \quad \sigma > 1
\]

More varieties \( n \) directly raises utility (love of variety). This is the Dixit-Stiglitz aggregator.

**Technology:** Each variety requires a fixed cost \( F \) and constant marginal cost \( c \). Total labor input to produce quantity \( x \) of a variety: \( l = F + cx \). Average cost is decreasing in \( x \) (internal economies of scale).

**Equilibrium:** Each firm faces demand with elasticity \( \sigma \), sets price as a markup over marginal cost:

\[
p = \frac{\sigma}{\sigma - 1} \cdot wc
\]

Free entry drives profits to zero, determining the equilibrium firm size:

\[
\pi = (p - wc)x - wF = 0 \implies x^* = \frac{F(\sigma-1)}{c} \cdot \frac{1}{\sigma - 1} \cdot \frac{\sigma}{1}
\]

More precisely, zero profits require: \( \frac{wF}{(\sigma-1)/\sigma} = \frac{wF \sigma}{\sigma - 1} \), which pins down \( x^* = F(\sigma-1)/c \).

**Trade:** When two identical countries integrate:
- The total market doubles
- The equilibrium number of firms in each country stays the same (scale and profits unchanged), but each country now accesses varieties from both countries
- Total varieties available to consumers: \( n_{world} = 2n_{autarky} \)
- Each firm produces the same quantity as under autarky (same equilibrium scale)
- Consumer welfare rises because of access to more varieties

<div class="theorem">
<strong>Krugman (1979) Gains from Trade:</strong> Even between two <em>identical</em> countries, free trade raises welfare by expanding the range of available varieties. The mechanism is not comparative advantage but love of variety combined with economies of scale. Trade allows each country to specialize in <em>different</em> varieties, exploiting scale economies while accessing the full range of varieties through imports.
</div>

**Implications:**
- Predicts substantial intra-industry trade (countries import and export different varieties of the same product)
- Gains from trade exist even without comparative advantage
- Larger countries have more varieties — a theory of the "home market effect" (large countries export differentiated goods)

## 6.4 Brander (1981) — Intra-Industry Trade in Identical Products

Brander (1981) shows that intra-industry trade can arise even with homogeneous goods if oligopolistic firms engage in Cournot competition across markets. With segmented markets and identical goods, two firms from different countries simultaneously export to each other's home market — a phenomenon called *reciprocal dumping*.

**Mechanism:** Under Cournot competition, each firm treats the other's output as fixed and sets quantity to maximize profit. Even though marginal costs are equal and goods are identical, each firm finds it profitable to "invade" the rival's market because:
1. The rival sets quantity assuming the domestic firm takes a share of the home market
2. This creates an unexploited profit opportunity for the foreign firm
3. In equilibrium, both firms export to each other's market

**Welfare implications:** Reciprocal dumping increases competition (consumer surplus rises), but wastes resources on two-way shipment of identical goods (transport costs). Net welfare effect is ambiguous.

## 6.5 Antweiler and Trefler (2002) — Increasing Returns in Trade Data

Antweiler and Trefler (2002) ask whether increasing returns are important in explaining actual trade patterns. They test whether industry-level scale economies predict export specialization beyond what factor proportions alone can explain.

**Finding:** Industries with stronger evidence of increasing returns (larger average establishment size relative to market) are indeed traded more intensively among similar countries. This supports the Krugman framework that scale economies drive intra-industry trade between similar countries, while factor proportions drive inter-industry trade between dissimilar countries.

---

# Chapter 7: Trade Policy — Instruments, Theory, and Political Economy

## 7.1 Trade Policy under Perfect Competition

Recall from introductory trade theory:

**Small country tariff:** For a price-taking economy, a specific tariff \( t \) raises the domestic price from \( P^* \) to \( P^* + t \), generating producer surplus gains, consumer surplus losses, and government tariff revenue. The net welfare effect is negative:

\[
\Delta W = \underbrace{\frac{1}{2} t^2 \cdot S'(P^*)}_{\text{production distortion}} - \underbrace{\frac{1}{2} t^2 \cdot |D'(P^*)|}_{\text{consumption distortion}} < 0
\]

(both triangles are losses from the same tariff wedge, so the sum is unambiguously negative)

**Optimal tariff (large country):** The terms-of-trade argument. A large country can improve its terms of trade (lower world price of its import) by restricting trade:

\[
t^* = \frac{1}{\epsilon^*}
\]

where \( \epsilon^* \) is the foreign export supply elasticity. This is a terms-of-trade argument for the optimal tariff — but it only applies to countries with market power in world markets, and retaliatory tariffs erase the gain.

## 7.2 Broda, Limao and Weinstein (2008) — Optimal Tariffs and Market Power

Broda, Limao and Weinstein (2008) provide empirical evidence that countries with market power in particular goods do set higher tariffs on those goods. Using detailed import data and inverse demand elasticities, they find:

**Main finding:** Countries systematically set tariffs that are increasing in their market power (inverse export supply elasticity). The pattern is consistent with the optimal tariff argument — not a random or purely political determination of trade policy. For countries outside the WTO (which could not be disciplined by retaliation and reciprocity commitments), the estimated tariff premium attributable to market power is economically large (~10–13 percentage points above counterfactual).

**Policy implication:** The WTO's reciprocity norms (binding tariff concessions in exchange for partners' concessions) discipline exactly this kind of market power exploitation, providing a deeper justification for the GATT/WTO framework beyond simple coordination.

## 7.3 Trade Policy under Imperfect Competition

When domestic industries are imperfectly competitive (oligopolies), the case for free trade is less clear-cut. *Strategic trade policy* — export subsidies or import protection that shifts profits from foreign to domestic oligopolists — can raise national welfare.

**The Brander-Spencer (1985) argument:** If two oligopolistic firms (one domestic, one foreign) compete in a third market, a domestic export subsidy shifts the profit-shifting equilibrium in favor of the domestic firm. The government can, in effect, pre-commit the domestic firm to a more aggressive Cournot strategy, shifting equilibrium output and profits toward the domestic firm.

**Limitations:**
1. Requires detailed information about demand and cost parameters
2. Subject to retaliation
3. If the domestic firm also serves the home market (as in most industries), a production subsidy may be welfare-decreasing (it intensifies competition in the home market)

The strategic trade policy literature ultimately led to skepticism about activist industrial policy based on these arguments.

## 7.4 Trefler (2004) — The Long and Short of the Canada-U.S. FTA

The Canada-U.S. Free Trade Agreement (FTA), which took effect in 1989, provides one of the cleanest natural experiments for evaluating the effects of trade liberalization. Daniel Trefler (2004) exploits the variation in pre-FTA tariff rates across Canadian industries (and the asymmetric reductions on each side) to estimate the causal effects of the FTA.

**Empirical strategy:** Using difference-in-differences: compare industries facing large tariff reductions (treatment) to those facing small reductions (control), before and after the FTA.

**Main findings:**
1. **Short-run labor adjustment costs were real:** Industries facing the largest Canadian tariff cuts saw employment decline by 12% and exit of low-productivity plants. These short-run costs were concentrated and visible.
2. **Long-run productivity gains were substantial:** Manufacturing labor productivity in the most-affected Canadian industries rose by 14% over 8 years. Plant-level productivity increased through scale effects and selection — only efficient plants survived.
3. **The US market integration created scale effects:** Canadian firms serving the larger integrated North American market could operate at more efficient scales.
4. **Net welfare assessment:** The long-run productivity gains substantially outweigh the transition costs, though the distributional effects (workers in affected industries bearing most of the cost) are significant.

<div class="remark">
<strong>Key contribution:</strong> Trefler (2004) is methodologically exemplary — it identifies causal effects of a specific, well-defined trade policy change on plant-level outcomes, connecting the theoretical predictions of the specific factors model (short-run distributional costs) and the Melitz model (long-run productivity gains through selection) to real data.
</div>

---

# Chapter 8: WTO, Trade Agreements, and the Political Economy of Trade

## 8.1 Why Do Trade Agreements Exist?

If free trade maximizes aggregate welfare, why don't countries simply unilaterally liberalize? The answer lies in the *terms-of-trade externality*:

- Each country's tariff affects world prices (if it has market power)
- Unilateral tariff-setting ignores the cost imposed on trading partners
- The Nash equilibrium (each country optimizes independently) involves inefficiently high tariffs
- A mutually beneficial agreement to reduce tariffs simultaneously eliminates this externality

**Bagwell and Staiger (1999)** formalized this: the GATT/WTO's core principles of *reciprocity* (mutual tariff concessions) and *non-discrimination* (most-favored-nation treatment) are precisely the institutions needed to allow governments to escape from the terms-of-trade prisoners' dilemma.

## 8.2 The GATT/WTO Framework

The General Agreement on Tariffs and Trade (GATT, 1947) and its successor the World Trade Organization (WTO, 1995) provide:
- **MFN (Most Favored Nation):** Each member must offer the lowest tariff it charges to any trading partner to all WTO members
- **National treatment:** Once goods enter, they must be treated the same as domestic goods
- **Binding tariff commitments:** Countries agree to ceilings on tariff rates (bindings), providing predictability
- **Dispute settlement:** Formal mechanism for resolving trade conflicts
- **Reciprocity:** Tariff concessions are exchanged on a roughly balanced basis

Eight rounds of negotiations under GATT reduced average tariffs on manufactured goods from ~40% in 1947 to below 4% by the 1990s.

## 8.3 Grossman and Helpman (1994) — "Protection for Sale"

The most influential political economy model of trade policy. Grossman and Helpman (GH 1994) model a government that maximizes a weighted sum of campaign contributions from organized lobbies and aggregate social welfare.

**Setup:** Sectors are indexed \( i = 1, \ldots, N \). Each sector may be politically organized (\( I_i = 1 \)) or not (\( I_i = 0 \)). Organized sectors offer a *contribution schedule* \( C_i(\tau_i) \) — the contribution is contingent on the trade policy chosen. The government takes the contribution schedules as given and maximizes:

\[
V_G = \sum_{i \in \text{organized}} C_i(\tau_i) + a \cdot W(\tau)
\]

where \( W(\tau) \) is aggregate social welfare and \( a \) is the weight on social welfare (relative to contributions).

**Equilibrium tariff formula:** The equilibrium tariff in sector \( i \) is:

\[
\frac{\tau_i - 1}{\tau_i} = -\frac{I_i - a_L}{a_L + a} \cdot \frac{z_i}{e_i}
\]

where \( a_L \) is the fraction of voters organized into lobbying groups, \( z_i = M_i/(D_i - S_i) \) is import penetration (inverse), and \( e_i \) is the import demand elasticity.

<div class="theorem">
<strong>Grossman-Helpman (1994) Predictions:</strong>
<ul>
<li>Sectors with organized lobbies (\( I_i = 1 \)) receive <em>higher</em> protection than unorganized sectors</li>
<li>Sectors with <em>lower</em> import penetration receive higher protection (more to lose from import competition, easier to organize)</li>
<li>Sectors with <em>less elastic</em> import demand receive higher protection (tariffs less distorting)</li>
<li>When the government weights social welfare more heavily (higher \( a \)), all tariffs are lower</li>
</ul>
</div>

## 8.4 Goldberg and Maggi (1999) — Empirical Test of Protection for Sale

Goldberg and Maggi (1999) test the Grossman-Helpman model using US non-tariff barrier data. They construct measures of lobby organization (whether sectors have active PACs) and test whether the GH tariff formula fits the cross-sectional pattern of protection.

**Finding:** The GH model's predictions receive strong empirical support. Sectors with organized lobbies and lower import penetration have significantly higher protection. The estimated weight on social welfare (the \( a \) parameter) is very high — the government places substantially more weight on aggregate welfare than on contributions. This is consistent with a competitive democracy where large welfare losses would be punished at the ballot box.

**Limitation:** The model treats political organization as exogenous. In reality, industries invest in organization precisely because protection is available. Later work (Bombardini 2008) endogenizes lobby organization.

---

# Chapter 9: Heterogeneous Firms, Productivity, and the Gravity Equation

## 9.1 Why Firms Matter for Trade

Earlier trade models (Ricardian, H-O, Krugman) treated industries as monolithic entities. But firm-level data reveals enormous heterogeneity within industries:
- Distributions of firm size are highly skewed (log-normal or Pareto)
- Only a small fraction of firms export: ~18% in the United States, lower in smaller economies
- Exporters are substantially larger (3–5×), more productive (30–50% higher TFP), and pay higher wages than non-exporters

These facts cannot be explained by industry-level models. They require a theory of *heterogeneous firms*.

## 9.2 Melitz (2003) — Firms, Trade, and Industry Productivity

Marc Melitz's 2003 paper is one of the most-cited in economics. It provides a general equilibrium theory of firm-level trade with heterogeneous productivity, explaining the stylized facts about exporters and generating new predictions about the aggregate productivity effects of trade liberalization.

**Setup:**

*Preferences:* Dixit-Stiglitz CES utility over a continuum of differentiated varieties:

\[
U = \left[\int c(\omega)^{(\sigma-1)/\sigma} d\omega\right]^{\sigma/(\sigma-1)}
\]

*Technology:* Firms differ in productivity \( \varphi \), which is drawn upon entry from distribution \( g(\varphi) \) (Pareto is the natural parametric choice). A firm with productivity \( \varphi \) and labor input \( l \) produces:

\[
q = \varphi \cdot l - f
\]

where \( f \) is a fixed production cost (per period). Variable costs are lower for high-\( \varphi \) firms, giving them a natural advantage.

*Market structure:* Monopolistic competition — each firm produces a unique variety, faces a downward-sloping demand, and sets prices as a markup over marginal cost. The markup is identical across firms (a feature of Dixit-Stiglitz):

\[
p(\varphi) = \frac{w}{\rho \varphi}, \quad \rho = \frac{\sigma-1}{\sigma}
\]

Higher-\( \varphi \) firms charge lower prices, sell more, and earn higher revenues. Revenue and profit for a domestic-only firm:

\[
r(\varphi) = R P^{\sigma-1} (p(\varphi))^{1-\sigma}, \quad \pi(\varphi) = \frac{r(\varphi)}{\sigma} - w f
\]

**Zero-cutoff profit condition:** There is a productivity cutoff \( \varphi^* \) below which firms cannot cover their fixed costs and exit. Only firms with \( \varphi \geq \varphi^* \) survive:

\[
\pi(\varphi^*) = 0 \implies \varphi^* = \varphi^*(w, R, P)
\]

**Exporting:** Serving a foreign market requires paying both a variable trade cost (iceberg cost \( \tau > 1 \): ship \( \tau \) units to deliver 1) and a fixed export cost \( f_x > f \). Export profits:

\[
\pi_x(\varphi) = \frac{r_x(\varphi)}{\sigma} - w f_x
\]

An exporting cutoff \( \varphi^*_x > \varphi^* \) exists such that only the most productive firms find exporting profitable:

\[
\pi_x(\varphi^*_x) = 0
\]

This generates the prediction that exporters are a selected subset of large, productive firms.

**Free entry condition:** Potential entrants pay an entry cost \( f_e \) to draw their productivity. The expected discounted profit stream must equal the entry cost in equilibrium, determining the mass of entrants.

**General equilibrium:** The mass of surviving firms, the productivity cutoffs \( \varphi^*, \varphi^*_x \), the wage, and the price index all adjust simultaneously in equilibrium.

<div class="theorem">
<strong>Melitz (2003) Key Predictions:</strong>
<ul>
<li><em>Self-selection</em>: Only high-productivity firms export. Exporters are larger and more productive than non-exporters.</li>
<li><em>Reallocation</em>: Trade liberalization raises \( \varphi^* \) (weakest firms exit) and \( \varphi^*_x \) (only very productive firms export). Resources flow from low-productivity to high-productivity firms.</li>
<li><em>Aggregate productivity</em>: The average productivity of surviving firms rises. This is a within-industry productivity gain from trade distinct from the inter-industry gains of comparative advantage.</li>
<li><em>Firm-level dynamics</em>: Within-firm productivity does not need to change. The aggregate productivity gain is entirely from reallocation.</li>
</ul>
</div>

**Welfare and gains from trade:** Arkolakis, Costinot and Rodriguez-Clare (2012) show that in a broad class of models — including Melitz — the welfare gains from trade can be summarized by just two statistics: the share of expenditure on domestic goods \( \lambda \) and the trade elasticity \( \theta \):

\[
\frac{dW}{W} = -\frac{1}{\theta} d\ln\lambda
\]

This "sufficient statistics" result shows that despite the rich within-model dynamics, the same formula for welfare gains applies across many different micro structures.

## 9.3 Bernard, Redding and Schott (2007) — Comparative Advantage and Heterogeneous Firms

Bernard, Redding and Schott (2007) extend the Melitz model to incorporate comparative advantage (factor endowment differences à la H-O). The model predicts:
- In sectors where a country has comparative advantage, more firms enter, average productivity is higher, and more firms export
- Trade liberalization raises exit in import-competing sectors and entry in export sectors, amplifying the comparative advantage pattern

## 9.4 Anderson and van Wincoop (2004) — Gravity Models and Multilateral Resistance

The gravity equation is the most successful empirical regularity in international economics:

\[
X_{ij} = A \cdot \frac{Y_i Y_j}{d_{ij}^\delta}
\]

where \( X_{ij} \) is exports from \( i \) to \( j \), \( Y_i, Y_j \) are GDPs, \( d_{ij} \) is distance, and \( A, \delta \) are parameters. Anderson (1979) and Anderson and van Wincoop (2003, 2004) provide theoretical foundations and a crucial correction.

**The "border puzzle":** McCallum (1995) found that Canadian provinces trade 22 times more with each other than with US states of comparable size and distance — a huge border effect. This seemed implausibly large.

**Multilateral Resistance:** Anderson and van Wincoop show that the standard gravity equation was misspecified. Trade between two countries depends not just on their bilateral trade costs but on those costs *relative to their trade costs with all other partners* — called *multilateral resistance*:

\[
X_{ij} = \frac{Y_i Y_j}{Y^W} \left(\frac{t_{ij}}{\Pi_i P_j}\right)^{1-\sigma}
\]

where \( \Pi_i \) and \( P_j \) are *outward* and *inward* multilateral resistance terms:

\[
\Pi_i^{1-\sigma} = \sum_j \left(\frac{t_{ij}}{P_j}\right)^{1-\sigma} \theta_j, \quad P_j^{1-\sigma} = \sum_i \left(\frac{t_{ij}}{\Pi_i}\right)^{1-\sigma} \theta_i
\]

**Border puzzle resolution:** Once multilateral resistance is properly accounted for (using country fixed effects in estimation), the border effect falls from 22x to a more reasonable 1.5–2x. The border reduces trade by roughly 30%, reflecting real trade costs beyond just distance.

<div class="remark">
<strong>Policy relevance:</strong> The Anderson-van Wincoop framework shows that reducing bilateral trade costs (e.g., through a free trade agreement) has spillover effects on trade with third parties through the multilateral resistance terms. A bilateral trade agreement may divert trade from efficient third-country suppliers.
</div>

---

# Chapter 10: Political Economy of Trade Policy

## 10.1 Collective Action and Trade Policy

Mancur Olson's collective action theory explains why producer interests dominate trade policy despite consumers being a much larger group:
- Producers in any industry are few in number, easy to organize, and have high per-capita stakes
- Consumers are numerous, dispersed, and have low per-capita stakes in any specific trade policy
- Information asymmetries: consumers don't notice the consumer surplus losses from tariffs as clearly as workers notice job losses

This explains the systematic bias toward protection in democratic societies.

## 10.2 Review: Grossman-Helpman and Goldberg-Maggi

(Full details in Chapter 8. Summary here for reference.)

GH (1994) provides the formal model: organized industries offer contributions contingent on policy; government maximizes a weighted objective. Equilibrium tariffs are higher for organized industries with lower import penetration and lower price elasticity.

Goldberg and Maggi (1999) test this with US NTB data, finding strong support for the cross-sectional predictions with an estimated government welfare weight suggesting that aggregate welfare matters substantially.

## 10.3 Other Political Economy Considerations

**Median voter models:** In a Heckscher-Ohlin world, the median voter's factor endowment relative to the national average determines their trade policy preference. If the median voter is endowed with the scarce factor (labor in a capital-abundant country), they would vote for tariffs on labor-intensive imports. Dutt and Mitra (2002) find empirical support for this using cross-country data on inequality and protection.

**Regime type and trade:** Democracies may have systematically different trade policies than autocracies. While lobbying pressure may favor protection in both, electoral accountability can cut in either direction — voters benefit from lower prices (pro-free trade) but also from employment protection (pro-tariff).

---

# Chapter 11: Distributional Effects of Trade

## 11.1 Trade and Inequality: Theoretical Framework

Standard Stolper-Samuelson reasoning predicts that trade between capital-abundant and labor-abundant countries redistributes income from labor to capital in the capital-abundant country. This provides a theoretical link from trade globalization to rising wage inequality in rich countries.

But isolating trade's contribution to inequality from other factors (skill-biased technical change, labor market institutions, bargaining power) is empirically challenging. The debate has intensified since the 2013 "China shock" paper.

## 11.2 Autor, Dorn and Hanson (2013) — The China Shock

David Autor, David Dorn and Gordon Hanson (ADH 2013) provide compelling evidence that rising Chinese import competition caused significant and persistent labor market disruption in affected US regions.

**Empirical strategy:** The United States contains hundreds of *commuting zones* (local labor markets) that differ in their exposure to Chinese import competition, depending on their pre-existing industry composition. ADH construct a *China shock exposure* measure:

\[
\Delta IPW_{uit} = \sum_j \frac{L_{ijt}}{L_{ujt}} \cdot \frac{\Delta M_{ucjt}}{L_{it}}
\]

where \( \Delta M_{ucjt} \) is the change in US imports from China in industry \( j \), \( L_{ijt}/L_{ujt} \) is the local labor market's employment share in industry \( j \), and \( L_{it} \) is total local employment. The instrument uses other high-income countries' imports from China (which respond to Chinese supply-side shocks rather than US demand shocks) as an instrument for the US exposure measure.

**Main findings:**
1. Commuting zones more exposed to Chinese import competition experienced significantly larger declines in manufacturing employment
2. The employment effects were **persistent** — contrary to models assuming smooth factor reallocation, workers did not quickly move to other industries or regions
3. Wages fell and government transfer payments (disability, unemployment, welfare) rose substantially in affected areas
4. The adjustment costs were highly localized — concentrated in specific towns and regions dependent on manufacturing

<div class="remark">
<strong>Why ADH (2013) is influential:</strong> Standard trade models with flexible factor markets predict that displaced workers move to other sectors, with temporary transitional costs. ADH found that the adjustment was slow, incomplete, and socially costly — challenging not just the theoretical predictions but also the policy consensus that free trade's benefits clearly outweigh its costs in practice. The paper influenced policy debates about trade adjustment assistance and contributed to the political backlash against globalization in the 2010s.
</div>

**Critiques and responses:**
- Autor, Dorn and Hanson (2016) ("Untangling Trade and Technology") confirm the results are not due to skill-biased technical change affecting the same industries as import competition
- Acemoglu et al. (2016) find even larger employment effects accounting for upstream-downstream linkages
- Counter-evidence: Caliendo et al. (2019) find that general equilibrium effects through goods and factor markets partially offset the local-area negative effects, but transition costs remain large

## 11.3 Helpman, Itskhoki and Redding (2010) — Trade, Inequality, and Unemployment

Standard trade models (including Melitz 2003) assume full employment and symmetric workers. Helpman, Itskhoki and Redding (HIR 2010) build a model where workers are heterogeneous in ability and firms face search-and-matching frictions in labor markets. This generates endogenous unemployment and a distribution of wages.

**Key mechanisms:**
1. Trade liberalization causes high-productivity firms to expand (they benefit from exporting)
2. High-productivity firms are matched with high-ability workers (complementarity)
3. This raises wage inequality: workers at high-productivity exporters gain, workers at low-productivity non-exporters face worse outcomes (their firms shrink or exit)

**Results:** Trade liberalization unambiguously raises wage inequality *within* the same sector, even in a country with comparative advantage in that sector. This is consistent with the empirical finding that both rich and poor countries saw rising within-industry wage inequality during the globalization wave of the 1990s-2000s.

## 11.4 Goldberg and Pavcnik (2007) — Distributional Effects in Developing Countries

Goldberg and Pavcnik (2007) survey the evidence on how globalization affects wages and inequality in *developing* countries. Standard H-O theory predicts that trade liberalization in labor-abundant developing countries should reduce inequality (raising wages of unskilled labor). The evidence is more nuanced:

**Key findings from the survey:**
1. **Inequality rose in many liberalizing developing countries** in the 1980s-90s, contrary to Stolper-Samuelson predictions
2. **Within-industry wage premia for skilled workers rose**: possibly due to skill-biased technology embodied in imported capital goods, or firm-level selection (most productive firms, paying skill premia, expand under trade)
3. **Trade liberalization was associated with falling informality in some countries** but rising informality in others, depending on labor market institutions
4. **Adjustment costs are heterogeneous**: workers in import-competing industries in developing countries also face significant costs

<div class="remark">
<strong>Theoretical reconciliation:</strong> The Stolper-Samuelson theorem applies under assumptions (two factors, two goods, identical technology, perfect competition) that are violated in practice. With many factors, skill-biased technical change embedded in imported capital goods, and firm-level heterogeneity, trade can raise inequality even in labor-abundant countries. HIR (2010) provide one such mechanism.
</div>

---

# Chapter 12: Trade and the Environment

## 12.1 Conceptual Framework: Scale, Composition, and Technique Effects

The environmental effects of trade can be decomposed into three channels (Grossman and Krueger 1991):

1. **Scale effect:** Trade raises income and output → more production → more pollution (negative)
2. **Composition effect:** Trade changes the industrial structure → if dirty industries concentrate in countries with lax environmental regulation (the "pollution haven" hypothesis), trade increases pollution in those countries but reduces it in countries with strict regulation
3. **Technique effect:** Trade raises income → higher demand for environmental quality → stricter regulation → cleaner production techniques (positive)

The net environmental effect of trade depends on the relative magnitudes of these three effects.

## 12.2 Antweiler, Copeland and Taylor (2001) — Is Free Trade Good for the Environment?

Antweiler, Copeland and Taylor (ACT 2001) test whether trade is beneficial or harmful to the environment using data on SO\(_2\) concentrations across 43 countries.

**Empirical framework:** They decompose the change in pollution into scale, composition, and technique effects using a structural econometric model. The key identifying variation comes from cross-country differences in capital-labor ratios (which drive comparative advantage and thus composition effects) and income levels (which drive technique effects via environmental demand).

**Main findings:**
1. **Scale effect is negative** (more output → more pollution) but relatively small
2. **Technique effect is positive and large**: higher income → cleaner technology
3. **Composition effect depends on factor endowments**: capital-abundant countries (which tend to have dirtier industries) see composition shift toward dirty industries with trade
4. **Net effect:** On balance, trade appears to be *slightly beneficial* for the environment — the technique effect dominates. A 1% increase in trade openness is associated with a ~1% reduction in SO\(_2\) concentrations, once income effects are controlled for.

<div class="remark">
<strong>Caveat on pollution havens:</strong> ACT find some composition-effect evidence consistent with pollution havens (dirty industries moving to capital-abundant countries), but the effect is not large enough to overturn the positive technique effect. More recent work with more disaggregated data (Levinson 2009) supports a similar conclusion.
</div>

## 12.3 Copeland and Taylor (2005) — Free Trade and Global Warming (Kyoto Protocol)

Copeland and Taylor (2005) apply their theoretical framework to carbon emissions and the Kyoto Protocol specifically.

**Theoretical setup:** In a model where pollution is a global public bad (unlike local pollutants like SO\(_2\)), trade can shift carbon emissions across countries without reducing global emissions. If dirty industries move from regulated (Kyoto) to unregulated (non-Kyoto) countries due to trade, *carbon leakage* occurs — global emissions may even rise.

**Key theoretical results:**
1. If environmental standards are determined endogenously by income (richer countries demand stricter standards), trade can *reduce* global emissions by raising global income (via efficiency gains) and thus global environmental demand.
2. But if standards are set exogenously (as under Kyoto, where only Annex I countries have binding targets), trade creates composition effects that shift dirty production to non-Annex I countries.
3. **Kyoto as a trade policy:** Copeland and Taylor show that Kyoto's asymmetric coverage (binding targets for rich countries, none for developing countries) has the structure of a *comparative advantage intervention* — rich-country climate policy is equivalent to imposing a tax on carbon-intensive production that shifts it to developing countries. The environmental effectiveness depends on whether the induced "carbon leakage" is large.

**Carbon leakage estimates:** Empirical estimates of carbon leakage (the fraction of emission reductions in regulated countries that is offset by increased emissions in unregulated countries) range from 5% to 20%, suggesting that trade-induced composition effects are real but not large enough to fully undermine climate policy.

## 12.4 The "Pollution Haven" Hypothesis: Evidence

The pollution haven hypothesis — that lax environmental regulation attracts dirty industries — has been extensively tested. The balance of evidence (Levinson and Taylor 2008, using industry-level data and tariff instruments) finds:
- Industries facing stricter environmental regulation *do* see relatively higher imports from less-regulated countries
- But the effect is quantitatively modest — trade costs and market access still dominate location decisions far more than environmental compliance costs

The interaction between trade policy and environmental policy is increasingly important as carbon border adjustment mechanisms (like the EU's Carbon Border Adjustment Mechanism, launched 2023) attempt to level the playing field between regulated and unregulated producers.

---

# Chapter 13: Synthesis — From Classic Theory to the Frontier

## 13.1 The Progression of Trade Theory

The field of international trade theory has evolved through several generations:

**First generation (1817–1950s):** Comparative advantage (Ricardo, H-O). Explains inter-industry trade based on technological and factor endowment differences. Predictions for factor prices (FPE, Stolper-Samuelson) and output (Rybczynski). Empirical performance limited without accounting for technology differences and trade costs.

**Second generation (1979–1990s):** New Trade Theory (Krugman 1979, Helpman and Krugman 1985). Explains intra-industry trade through economies of scale and product differentiation. Monopolistic competition framework. Explains home market effects, trade between similar countries.

**Third generation (2003–present):** New New Trade Theory (Melitz 2003). Heterogeneous firms, firm-level selection, reallocation effects. Connects to firm-level empirics. Quantitative models combining gravity with theoretical structure (Eaton-Kortum 2002, Arkolakis-Costinot-Rodriguez-Clare 2012).

## 13.2 Quantitative Trade Models

The frontier of trade research uses *quantitative trade models* — general equilibrium frameworks that:
1. Are grounded in microeconomic theory (utility maximization, profit maximization)
2. Can be calibrated to observed trade flows and input-output tables
3. Can perform counterfactual analysis: "What would welfare be if country X adopted policy Y?"

Key results: Arkolakis, Costinot and Rodriguez-Clare (2012) show that across a wide class of models (Armington, Eaton-Kortum, Krugman, Melitz), welfare gains from trade can be expressed as:

\[
\hat{W} = \hat{\lambda}_{ii}^{-1/\theta}
\]

where \( \hat{\lambda}_{ii} \) is the change in the domestic expenditure share and \( \theta \) is the trade elasticity. This elegant result unifies many apparently different models and shows that their aggregate welfare implications are identical conditional on the domestic trade share.

## 13.3 Remaining Challenges

Despite remarkable progress, significant challenges remain:

1. **Trade and labor market adjustment:** ADH (2013) and related work show that labor market frictions make adjustment far more costly than frictionless models predict. Incorporating realistic labor market dynamics into quantitative trade models is an active research area.

2. **Services trade:** Services now account for 25% of world trade by value and growing. Services trade is less well-understood than goods trade, partly because services are harder to measure.

3. **Global value chains:** The fragmentation of production across countries (with the same good crossing borders multiple times as an intermediate) complicates the measurement of trade and the assignment of comparative advantage.

4. **Trade and inequality:** The distributional effects of trade remain politically contentious and theoretically complex. Models with heterogeneous workers, search frictions, and geographic immobility are needed to explain observed adjustment patterns.

5. **Trade and the environment:** Integrating trade theory with environmental economics is increasingly important, especially for climate policy.
