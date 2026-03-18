---
title: "PMATH 450"
prof: "Stephen New"
---

# PMATH 450: Lebesgue Integration and Fourier Analysis

These notes cover PMATH 450 (Spring 2018), taught by Prof. Stephen New. The course develops the Lebesgue theory of integration on the real line, culminating in the <span>&#92;(L^p&#92;)</span> spaces, Hilbert space theory, and Fourier analysis. The primary source is Prof. New's own typed lecture notes; Chapter 5 on Fourier series draws from Calvin Kent's student notes, since Prof. New deferred that material to the textbook (*Real Analysis* by Bruckner, Bruckner, and Thomson, §§15.1–15.5, 15.11).

---

# Chapter 1: Lebesgue Measure

The Lebesgue theory begins by assigning a "size" — a measure — to subsets of <span>&#92;(&#92;mathbb{R}&#92;)</span> in a way that extends the familiar notion of length for intervals, is countably additive, and is well-behaved under limits. The classical **Jordan content** fails for countable sets; the Lebesgue measure fixes this by allowing countably infinite covers.

## Jordan Outer Content and Content

**1.1 Definition.** When <span>&#92;(I&#92;)</span> is a bounded interval <span>&#92;((a,b)&#92;)</span>, <span>&#92;([a,b)&#92;)</span>, <span>&#92;((a,b]&#92;)</span>, or <span>&#92;([a,b]&#92;)</span> with <span>&#92;(a \leq b&#92;)</span>, we define <span>&#92;(|I| = b - a&#92;)</span>. For unbounded intervals we set <span>&#92;(|I| = \infty&#92;)</span>.

**1.2 Definition.** For a bounded set <span>&#92;(A \subseteq &#92;mathbb{R}&#92;)</span>, the **Jordan outer content** of <span>&#92;(A&#92;)</span> is
<span>&#92;[
  c^*(A) = \inf\!\left\{ \sum_{k=1}^{n} |I_k| \;\middle|\; n \in \mathbb{Z}^+,\, \text{each } I_k \text{ is a bounded open interval, and } A \subseteq \bigcup_{k=1}^{n} I_k \right\}.
&#92;]</span>
This is the infimum of total lengths of *finite* open covers.

**1.3 Theorem** (Properties of Jordan Outer Content). Let <span>&#92;(A, B \subseteq &#92;mathbb{R}&#92;)</span> be bounded.
1. *(Translation)* <span>&#92;(c^*(a+A) = c^*(A)&#92;)</span> for any <span>&#92;(a \in &#92;mathbb{R}&#92;)</span>.
2. *(Scaling)* <span>&#92;(c^*(rA) = |r|\,c^*(A)&#92;)</span> for <span>&#92;(r \neq 0&#92;)</span>.
3. *(Inclusion)* If <span>&#92;(A \subseteq B&#92;)</span> then <span>&#92;(c^*(A) \leq c^*(B)&#92;)</span>.
4. If <span>&#92;(A&#92;)</span> is finite then <span>&#92;(c^*(A) = 0&#92;)</span>.
5. If <span>&#92;(I&#92;)</span> is a bounded interval then <span>&#92;(c^*(I) = |I|&#92;)</span>.
6. *(Subadditivity)* <span>&#92;(c^*(A \cup B) \leq c^*(A) + c^*(B)&#92;)</span>.
7. <span>&#92;(c^*(\bar{A}) = c^*(A)&#92;)</span>.

**1.5 Definition.** A bounded set <span>&#92;(A \subseteq &#92;mathbb{R}&#92;)</span> has **Jordan content** when <span>&#92;(c^*(A) = |I| - c^*(I \setminus A)&#92;)</span> for any interval <span>&#92;(I \supseteq A&#92;)</span>, and in that case we write <span>&#92;(c(A) = c^*(A)&#92;)</span>. Geometrically, this says the outer content from outside equals the "inner content" from inside.

**1.6 Exercise.** Show that <span>&#92;(&#92;mathbb{Q} \cap [0,1]&#92;)</span> does *not* have a well-defined Jordan content (outer content is 1, but any finite cover of the rationals leaves gaps).

**1.7 Theorem** (Properties of Content). A bounded set <span>&#92;(A&#92;)</span> has Jordan content if and only if <span>&#92;(c^*(A^0) = 0&#92;)</span>, where <span>&#92;(A^0&#92;)</span> denotes the boundary of <span>&#92;(A&#92;)</span>. Unions, intersections, and differences of sets with content again have content. Every bounded interval has content.

## Lebesgue Outer Measure

**1.8 Definition.** For any <span>&#92;(A \subseteq &#92;mathbb{R}&#92;)</span> (not necessarily bounded), the **Lebesgue outer measure** of <span>&#92;(A&#92;)</span> is
<span>&#92;[
  &#92;lambda^*(A) = \inf\!\left\{ \sum_{n=1}^{&#92;infty} |I_n| \;\middle|\; \text{each } I_n \text{ is a bounded open interval and } A \subseteq \bigcup_{n=1}^{&#92;infty} I_n \right\}.
&#92;]</span>
The key difference from Jordan content: we allow *countably infinite* covers.

**1.9 Theorem** (Properties of Outer Measure). Let <span>&#92;(A, B \subseteq &#92;mathbb{R}&#92;)</span>.
1. *(Translation)* <span>&#92;(&#92;lambda^*(a+A) = &#92;lambda^*(A)&#92;)</span>.
2. *(Scaling)* <span>&#92;(&#92;lambda^*(rA) = |r|\,&#92;lambda^*(A)&#92;)</span> for <span>&#92;(r \neq 0&#92;)</span>.
3. *(Inclusion)* <span>&#92;(A \subseteq B \Rightarrow &#92;lambda^*(A) \leq &#92;lambda^*(B)&#92;)</span>.
4. If <span>&#92;(A&#92;)</span> is finite or countable then <span>&#92;(&#92;lambda^*(A) = 0&#92;)</span>.
5. If <span>&#92;(I&#92;)</span> is an interval then <span>&#92;(&#92;lambda^*(I) = |I|&#92;)</span>.
6. *(Countable subadditivity)* <span>&#92;(&#92;lambda^*\!\left(&#92;bigcup_{n=1}^&#92;infty A_n\right) \leq \sum_{n=1}^&#92;infty &#92;lambda^*(A_n)&#92;)</span>.

*Proof sketch for (4):* Given <span>&#92;(A = \{a_1, a_2, \ldots\}&#92;)</span> countable and <span>&#92;(\varepsilon > 0&#92;)</span>, cover each <span>&#92;(a_n&#92;)</span> by an interval of length <span>&#92;(\varepsilon/2^n&#92;)</span>. Then <span>&#92;(&#92;lambda^*(A) \leq \sum &#92;varepsilon/2^n = &#92;varepsilon&#92;)</span>; since <span>&#92;(\varepsilon&#92;)</span> was arbitrary, <span>&#92;(&#92;lambda^*(A) = 0&#92;)</span>.

*Proof sketch for (5):* One shows <span>&#92;(&#92;lambda^*(I) \leq |I|&#92;)</span> by taking <span>&#92;(I_1 = (a-&#92;varepsilon, b+&#92;varepsilon)&#92;)</span>. For the lower bound, given any countable open cover of a compact subinterval <span>&#92;(K = [a+&#92;varepsilon, b-&#92;varepsilon] \subset I&#92;)</span>, extract a finite subcover and chain the overlapping intervals to show the total length is at least <span>&#92;(b-a-2&#92;varepsilon&#92;)</span>.

## Lebesgue Measurability

**1.10 Definition.** A set <span>&#92;(A \subseteq &#92;mathbb{R}&#92;)</span> is **Lebesgue measurable** when for every <span>&#92;(X \subseteq &#92;mathbb{R}&#92;)</span>,
<span>&#92;[
  &#92;lambda^*(X) = &#92;lambda^*(X \cap A) + &#92;lambda^*(X \setminus A).
&#92;]</span>
This is Carathéodory's criterion: <span>&#92;(A&#92;)</span> measurably splits every set. We let <span>&#92;(&#92;mathcal{M}&#92;)</span> denote the collection of all measurable subsets of <span>&#92;(&#92;mathbb{R}&#92;)</span>, and for measurable <span>&#92;(A&#92;)</span> we write <span>&#92;(&#92;lambda(A) = &#92;lambda^*(A)&#92;)</span>.

**1.11 Note.** Since <span>&#92;(X = (X \cap A) \cup (X \setminus A)&#92;)</span>, subadditivity gives <span>&#92;(&#92;lambda^*(X) \leq &#92;lambda^*(X \cap A) + &#92;lambda^*(X \setminus A)&#92;)</span> automatically. So measurability requires only the reverse inequality.

**1.12 Theorem** (Properties of Measure). The collection <span>&#92;(&#92;mathcal{M}&#92;)</span> is a **<span>&#92;(&#92;sigma&#92;)</span>-algebra** and the Lebesgue measure <span>&#92;(&#92;lambda : &#92;mathcal{M} \to [0,&#92;infty]&#92;)</span> satisfies:
1. <span>&#92;(&#92;emptyset&#92;)</span> and <span>&#92;(&#92;mathbb{R}&#92;)</span> are measurable.
2. If <span>&#92;(&#92;lambda^*(A) = 0&#92;)</span> then <span>&#92;(A&#92;)</span> is measurable (null sets are measurable).
3. Complements of measurable sets are measurable.
4. Finite unions, intersections, and differences of measurable sets are measurable.
5. Every interval is measurable.
6. Countable unions and intersections of measurable sets are measurable.
7. *(Countable additivity)* If <span>&#92;(A_1, A_2, \ldots&#92;)</span> are measurable and disjoint, then <span>&#92;(&#92;lambda\!\left(&#92;bigcup_{k=1}^&#92;infty A_k\right) = \sum_{k=1}^&#92;infty &#92;lambda(A_k)&#92;)</span>.

*Key step in the proof of (4):* To show <span>&#92;(A \cup B&#92;)</span> is measurable, write for any <span>&#92;(X&#92;)</span>:
<span>&#92;[
  &#92;lambda^*(X) = &#92;lambda^*(X \cap A) + &#92;lambda^*((X \setminus A) \cap B) + &#92;lambda^*(X \setminus (A \cup B)) \geq &#92;lambda^*(X \cap (A \cup B)) + &#92;lambda^*(X \setminus (A \cup B)),
&#92;]</span>
using subadditivity for the last step since <span>&#92;((X \cap A) \cup ((X \setminus A) \cap B) = X \cap (A \cup B)&#92;)</span>.

**1.13 Corollary** (Continuity of Measure). Let <span>&#92;(A_1, A_2, \ldots&#92;)</span> be measurable.
1. If <span>&#92;(A_1 \subseteq A_2 \subseteq \cdots&#92;)</span> (increasing), then <span>&#92;(&#92;lambda\!\left(&#92;bigcup_{n=1}^&#92;infty A_n\right) = &#92;lim_{n&#92;to&#92;infty} &#92;lambda(A_n)&#92;)</span>.
2. If <span>&#92;(A_1 \supseteq A_2 \supseteq \cdots&#92;)</span> (decreasing) and <span>&#92;(&#92;lambda(A_m) < &#92;infty&#92;)</span> for some <span>&#92;(m&#92;)</span>, then <span>&#92;(&#92;lambda\!\left(&#92;bigcap_{n=1}^&#92;infty A_n\right) = &#92;lim_{n&#92;to&#92;infty} &#92;lambda(A_n)&#92;)</span>.

**1.14 Theorem.** All open sets and all closed sets in <span>&#92;(&#92;mathbb{R}&#92;)</span> are measurable. Moreover, every nonempty open set is a countable disjoint union of open intervals, so <span>&#92;(&#92;lambda(U) = \sum_k |I_k|&#92;)</span> for connected components <span>&#92;(I_k&#92;)</span>.

**1.15 Corollary.** <span>&#92;(&#92;lambda^*(A) = \inf\{&#92;lambda(U) \mid U \supseteq A,\, U &#92;text{ open}\}&#92;)</span>.

## Non-measurable Sets and Cantor Sets

**1.17 Theorem.** <span>&#92;(|&#92;mathcal{M}| = 2^{2^{&#92;aleph_0}}&#92;)</span> — the set of all measurable sets is strictly larger in cardinality than the set of Borel sets (which has cardinality <span>&#92;(2^{&#92;aleph_0}&#92;)</span>).

*Proof.* The standard Cantor set <span>&#92;(C&#92;)</span> has <span>&#92;(&#92;lambda(C) = 0&#92;)</span>, so every subset of <span>&#92;(C&#92;)</span> is measurable. Since <span>&#92;(|C| = 2^{&#92;aleph_0}&#92;)</span>, the number of subsets of <span>&#92;(C&#92;)</span> is <span>&#92;(2^{2^{&#92;aleph_0}}&#92;)</span>.

**1.18 Theorem.** There exists a **non-measurable** subset of <span>&#92;(&#92;mathbb{R}&#92;)</span>.

*Proof* (Vitali). Define an equivalence relation on <span>&#92;([0,1]&#92;)</span> by <span>&#92;(x \sim y \Leftrightarrow y - x \in &#92;mathbb{Q}&#92;)</span>. Using the Axiom of Choice, select one element from each equivalence class to form <span>&#92;(A \subseteq [0,1]&#92;)</span>. Enumerate <span>&#92;(&#92;mathbb{Q} \cap [0,2] = \{a_1, a_2, \ldots\}&#92;)</span> and let <span>&#92;(A_k = a_k + A&#92;)</span>. One checks the <span>&#92;(A_k&#92;)</span> are pairwise disjoint and <span>&#92;([1,2] \subseteq \bigcup_k A_k \subseteq [0,3]&#92;)</span>. If <span>&#92;(A&#92;)</span> were measurable, countable additivity would give <span>&#92;\(\sum_k &#92;lambda(A_k) = \sum_k &#92;lambda(A)\)</span> equal to either 0 or <span>&#92;\(\infty\)</span>, contradicting <span>&#92;(1 \leq &#92;lambda\!\left(\bigcup_k A_k\right) \leq 3&#92;)</span>.

## σ-Algebras and Borel Sets

**1.19 Notation.** We write <span>&#92;(&#92;mathcal{G}&#92;)</span> for the open sets and <span>&#92;(&#92;mathcal{F}&#92;)</span> for the closed sets. For a collection <span>&#92;(&#92;mathcal{C}&#92;)</span> of subsets, <span>&#92;(&#92;mathcal{C}_&#92;sigma&#92;)</span> denotes countable unions of sets from <span>&#92;(&#92;mathcal{C}&#92;)</span>, and <span>&#92;(&#92;mathcal{C}_&#92;delta&#92;)</span> denotes countable intersections.

**1.20 Definition.** A **<span>&#92;(&#92;sigma&#92;)</span>-algebra** in <span>&#92;(&#92;mathbb{R}&#92;)</span> is a collection <span>&#92;(&#92;mathcal{C}&#92;)</span> of subsets of <span>&#92;(&#92;mathbb{R}&#92;)</span> such that: (1) <span>&#92;(&#92;emptyset \in &#92;mathcal{C}&#92;)</span>; (2) <span>&#92;(A \in &#92;mathcal{C} \Rightarrow A^c \in &#92;mathcal{C}&#92;)</span>; (3) countable unions of sets in <span>&#92;(&#92;mathcal{C}&#92;)</span> lie in <span>&#92;(&#92;mathcal{C}&#92;)</span>.

**1.23 Definition.** The **Borel <span>&#92;(&#92;sigma&#92;)</span>-algebra** <span>&#92;(&#92;mathcal{B}&#92;)</span> is the smallest <span>&#92;(&#92;sigma&#92;)</span>-algebra containing all open sets. Elements of <span>&#92;(&#92;mathcal{B}&#92;)</span> are called **Borel sets**; they include <span>&#92;(&#92;mathcal{G},&#92; &#92;mathcal{G}_&#92;delta,&#92; &#92;mathcal{G}_{&#92;delta&#92;sigma},\ldots&#92;)</span> and <span>&#92;(&#92;mathcal{F},&#92; &#92;mathcal{F}_&#92;sigma,&#92; &#92;mathcal{F}_{&#92;sigma&#92;delta},\ldots&#92;)</span>.

**1.25 Theorem.** Every Borel set is Lebesgue measurable (<span>&#92;(&#92;mathcal{B} \subseteq &#92;mathcal{M}&#92;)</span>), since <span>&#92;(&#92;mathcal{M}&#92;)</span> is itself a <span>&#92;(&#92;sigma&#92;)</span>-algebra containing all open sets.

**1.27 Theorem.** A set <span>&#92;(A \subseteq &#92;mathbb{R}&#92;)</span> is measurable if and only if any of the following equivalent conditions holds:
- For every <span>&#92;(&#92;varepsilon > 0&#92;)</span> there is an open set <span>&#92;(U \supseteq A&#92;)</span> with <span>&#92;(&#92;lambda(U \setminus A) < &#92;varepsilon&#92;)</span>.
- There is a <span>&#92;(G_&#92;delta&#92;)</span> set <span>&#92;(B \supseteq A&#92;)</span> with <span>&#92;(&#92;lambda(B \setminus A) = 0&#92;)</span>.
- For every <span>&#92;(&#92;varepsilon > 0&#92;)</span> there is a closed set <span>&#92;(K \subseteq A&#92;)</span> with <span>&#92;(&#92;lambda(A \setminus K) < &#92;varepsilon&#92;)</span>.
- There is an <span>&#92;(F_&#92;sigma&#92;)</span> set <span>&#92;(C \subseteq A&#92;)</span> with <span>&#92;(&#92;lambda(A \setminus C) = 0&#92;)</span>.

## Density, Category, and the Baire Category Theorem

**1.29 Definition.** A set <span>&#92;(A \subseteq &#92;mathbb{R}&#92;)</span> is **dense** when <span>&#92;(\bar{A} = &#92;mathbb{R}&#92;)</span>, and **nowhere dense** when every open interval contains a sub-interval disjoint from <span>&#92;(A&#92;)</span> (equivalently, <span>&#92;(\overline{A}^{\,&#92;circ} = &#92;emptyset&#92;)</span>).

**1.32 Definition.** A set is **first category** (or *meagre*) if it is a countable union of nowhere dense sets; **second category** otherwise; **residual** if its complement is first category.

**1.33 Example.** Every countable set is first category (each singleton is nowhere dense), so <span>&#92;(&#92;mathbb{Q}&#92;)</span> is first category and <span>&#92;(&#92;mathbb{Q}^c&#92;)</span> is residual.

**1.36 Theorem** (Baire Category Theorem). *(1)* Every first-category set has empty interior. *(2)* Every residual set is dense. *(3)* A countable intersection of dense open sets is dense.

*Proof sketch:* If <span>&#92;(A = \bigcup_{k=1}^&#92;infty C_k&#92;)</span> with each <span>&#92;(C_k&#92;)</span> nowhere dense, suppose <span>&#92;(A&#92;)</span> has nonempty interior and choose a closed interval <span>&#92;(I_0 \subseteq A&#92;)</span>. Inductively choose nested closed intervals <span>&#92;(I_0 \supseteq I_1 \supseteq I_2 \supseteq \cdots&#92;)</span> with <span>&#92;(I_k \cap C_k = &#92;emptyset&#92;)</span>. By the nested interval theorem, <span>&#92;(\bigcap I_k \neq &#92;emptyset&#92;)</span>; but any point in the intersection lies in <span>&#92;(I_0 \subseteq A&#92;)</span> yet in no <span>&#92;(C_k&#92;)</span> — contradiction.

**1.40 Remark.** Three notions of "smallness" — *countable*, *measure zero*, *first category* — share the properties that subsets and countable unions of small sets are small, and small sets have empty interior. Yet no containment holds between them in general.

**1.41 Theorem.** Every subset of <span>&#92;(&#92;mathbb{R}&#92;)</span> is the disjoint union of a set of measure zero and a set of first category.

*Proof.* Let <span>&#92;(Q = \{a_1, a_2, \ldots\}&#92;)</span>. For <span>&#92;(k \in &#92;mathbb{Z}^+&#92;)</span>, let <span>&#92;(U_k = \bigcup_{\ell=1}^&#92;infty \left(a_\ell - &#92;frac{1}{2^{k+\ell}}, a_\ell + &#92;frac{1}{2^{k+\ell}}\right)&#92;)</span>, so <span>&#92;(&#92;lambda(U_k) \leq 1/2^{k-1}&#92;)</span>. Let <span>&#92;(B = \bigcap_{k=1}^&#92;infty U_k&#92;)</span>; then <span>&#92;(B&#92;)</span> is residual (countable intersection of dense open sets) yet <span>&#92;(&#92;lambda(B) = 0&#92;)</span>. For any <span>&#92;(A&#92;)</span>, write <span>&#92;(A = (A \cap B) \cup (A \cap B^c)&#92;)</span>: the first part has measure zero and the second is first category (subset of <span>&#92;(B^c&#92;)</span>, which is first category).

---

# Chapter 2: Lebesgue Integration

Having defined measurable sets, we now define integration for measurable functions. The strategy is: first integrate non-negative simple functions (finite linear combinations of characteristic functions), then non-negative measurable functions (as a supremum over simple functions), and finally general measurable functions (by splitting into positive and negative parts).

## Setup: Riemann Integration and Its Limitations

**2.2–2.3 Definitions.** A **step function** on <span>&#92;([a,b]&#92;)</span> is <span>&#92;(s = \sum_{k=1}^n c_k &#92;\chi_{I_k}&#92;)</span> where the <span>&#92;(I_k&#92;)</span> partition <span>&#92;([a,b]&#92;)</span> into intervals; its integral is <span>&#92;(\int_a^b s = \sum c_k |I_k|&#92;)</span>. A bounded function <span>&#92;(f: [a,b] \to &#92;mathbb{R}&#92;)</span> is **Riemann integrable** when the upper and lower Riemann integrals agree: <span>&#92;(U(f) = L(f)&#92;)</span>.

**2.6 Theorem** (Lebesgue's criterion for Riemann integrability). A bounded function <span>&#92;(f: [a,b] \to &#92;mathbb{R}&#92;)</span> is Riemann integrable if and only if the set of its discontinuities has measure zero.

**2.8 Example.** The Dirichlet function <span>&#92;(f = &#92;\chi_{&#92;\mathbb{Q} \cap [0,1]}&#92;)</span> is discontinuous everywhere and hence *not* Riemann integrable.

**2.11–2.14 Examples** (Cantor function). Given a Cantor set <span>&#92;(C = [0,1] \setminus U&#92;)</span>, the corresponding **Cantor function** <span>&#92;(f: [0,1] \to [0,1]&#92;)</span> is continuous and non-decreasing with <span>&#92;(f' = 0&#92;)</span> a.e. on <span>&#92;(U&#92;)</span>. When <span>&#92;(C&#92;)</span> is the standard Cantor set, the homeomorphism <span>&#92;(g(x) = x + f(x)&#92;)</span> sends a set of measure zero (<span>&#92;(C&#92;)</span>) to a set of measure one, illustrating that continuous images of measurable sets need not be measurable.

## Measurable Functions

**2.15 Definition.** The **extended reals** are <span>&#92;([-&#92;infty, &#92;infty] = &#92;mathbb{R} \cup \{-&#92;infty, &#92;infty\}&#92;)</span> with the natural topology (open balls around <span>&#92;(\pm&#92;infty&#92;)</span> being half-lines).

**2.16 Definition.** A function <span>&#92;(f: A \subseteq &#92;mathbb{R} \to [-&#92;infty, &#92;infty]&#92;)</span> is **measurable** when <span>&#92;(f^{-1}(U)&#92;)</span> is measurable for every open set <span>&#92;(U \subseteq [-&#92;infty, &#92;infty]&#92;)</span>. (In particular, the domain <span>&#92;(A&#92;)</span> must be measurable.)

**2.18 Theorem.** For measurable <span>&#92;(A&#92;)</span> and <span>&#92;(f: A \to [-&#92;infty,&#92;infty]&#92;)</span>, the following are equivalent:
<span>&#92;[
f &#92;\text{ is measurable} &#92;iff f^{-1}(a,&#92;infty] &#92;\text{ is measurable for all } a \in &#92;mathbb{R} &#92;iff f^{-1}[a,&#92;infty] &#92;\text{ is measurable for all } a \in &#92;mathbb{R}.
&#92;]</span>

**2.19 Theorem.** Characteristic functions, continuous functions, and monotone functions are measurable.

**2.20 Definition.** For <span>&#92;(f: A \to [-&#92;infty,&#92;infty]&#92;)</span>, define the positive and negative parts:
<span>&#92;[
f^+ = &#92;max(f, 0), &#92;quad f^- = &#92;max(-f, 0).
&#92;]</span>
Then <span>&#92;(f = f^+ - f^-&#92;)</span> and <span>&#92;(|f| = f^+ + f^-&#92;)</span>.

**2.21 Theorem.** If <span>&#92;(f, g&#92;)</span> are measurable and <span>&#92;(c \in &#92;mathbb{R}&#92;)</span>, then <span>&#92;(cf,&#92; f+g,&#92; fg,&#92; |f|,&#92; f^+,&#92; f^-&#92;)</span> are all measurable wherever defined.

**2.22 Theorem.** If <span>&#92;(f_n&#92;)</span> are measurable, then <span>&#92;(&#92;sup_n f_n&#92;)</span>, <span>&#92;(&#92;inf_n f_n&#92;)</span>, <span>&#92;(&#92;limsup_{n&#92;to&#92;infty} f_n&#92;)</span>, and <span>&#92;(&#92;liminf_{n&#92;to&#92;infty} f_n&#92;)</span> are all measurable.

**2.23 Definition.** We say a property holds **almost everywhere** (a.e.) in <span>&#92;(A&#92;)</span> when it holds outside a set of measure zero.

## The Lebesgue Integral

**2.25 Definition.** A **simple function** on measurable <span>&#92;(A&#92;)</span> is <span>&#92;(s = \sum_{k=1}^n c_k &#92;\chi_{A_k}&#92;)</span>, where the <span>&#92;(A_k&#92;)</span> are disjoint measurable sets partitioning <span>&#92;(A&#92;)</span>.

**2.26 Definition.** For a non-negative simple function <span>&#92;(s = \sum_{k=1}^n c_k &#92;\chi_{A_k}&#92;)</span>, the **Lebesgue integral** is
<span>&#92;[
&#92;\int_A s \,d&#92;lambda = \sum_{k=1}^n c_k &#92;\lambda(A_k).
&#92;]</span>

**2.29 Definition.** For a non-negative measurable function <span>&#92;(f: A \to [0,&#92;infty]&#92;)</span>, the **Lebesgue integral** is
<span>&#92;[
&#92;\int_A f \,d&#92;lambda = &#92;\sup\!\left\{ &#92;\int_A s \;\middle|\; s &#92;\text{ is a non-negative simple function with } s \leq f \right\}.
&#92;]</span>

**2.28 Note.** Any non-negative measurable <span>&#92;(f&#92;)</span> can be approximated from below by an increasing sequence of simple functions: set <span>&#92;(s_n(x) = (k-1)/2^n&#92;)</span> when <span>&#92;((k-1)/2^n \leq f(x) < k/2^n&#92;)</span> for <span>&#92;(k \leq n \cdot 2^n&#92;)</span>, and <span>&#92;(s_n(x) = n&#92;)</span> when <span>&#92;(f(x) \geq n&#92;)</span>. Then <span>&#92;(s_n \nearrow f&#92;)</span>.

### The Fundamental Convergence Theorems

**2.31 Theorem** (Fatou's Lemma). If <span>&#92;(f_n: A \to [0,&#92;infty]&#92;)</span> are non-negative measurable, then
<span>&#92;[
&#92;\int_A &#92;\liminf_{n&#92;to&#92;infty} f_n \leq &#92;\liminf_{n&#92;to&#92;infty} &#92;\int_A f_n.
&#92;]</span>

*Proof.* It suffices to show that for any non-negative simple <span>&#92;(s \leq &#92;\liminf f_n&#92;)</span>, we have <span>&#92;\(\int_A s \leq &#92;\liminf \int_A f_n\)</span>. Write <span>&#92;(s = \sum_k a_k &#92;\chi_{A_k}&#92;)</span>. For any <span>&#92;(0 \leq r < 1&#92;)</span>, the sets <span>&#92;(B_{k,n} = \{x \in A_k : f_\ell(x) \geq r a_k &#92;\ \forall \ell \geq n\}&#92;)</span> increase to <span>&#92;(A_k&#92;)</span>. Thus <span>&#92;(\int_A f_n \geq \sum_k r a_k &#92;\lambda(B_{k,n}) \to r \int_A s&#92;)</span>. Since <span>&#92;(r < 1&#92;)</span> was arbitrary, the result follows.

**2.33 Theorem** (Lebesgue's Monotone Convergence Theorem). If <span>&#92;(f_n: A \to [0,&#92;infty]&#92;)</span> are non-negative measurable with <span>&#92;(f_n(x) \nearrow f(x)&#92;)</span> for all <span>&#92;(x \in A&#92;)</span>, then
<span>&#92;[
&#92;\int_A f = &#92;\lim_{n&#92;to&#92;infty} &#92;\int_A f_n.
&#92;]</span>

**2.35 Corollary.** For non-negative measurable <span>&#92;(f_n&#92;)</span>,
<span>&#92;[
&#92;\int_A \sum_{n=1}^&#92;infty f_n = \sum_{n=1}^&#92;infty &#92;\int_A f_n.
&#92;]</span>

**2.38 Definition.** For measurable <span>&#92;(f: A \to [-&#92;infty,&#92;infty]&#92;)</span>, we say <span>&#92;(f&#92;)</span> is **(Lebesgue) integrable** when both <span>&#92;(\int_A f^+&#92;)</span> and <span>&#92;(\int_A f^-&#92;)</span> are finite, and define
<span>&#92;[
&#92;\int_A f = &#92;\int_A f^+ - &#92;\int_A f^-.
&#92;]</span>
Equivalently, <span>&#92;(f&#92;)</span> is integrable if and only if <span>&#92;(|f|&#92;)</span> is integrable.

**2.41 Theorem** (Lebesgue's Dominated Convergence Theorem). Let <span>&#92;(f_n: A \to [-&#92;infty,&#92;infty]&#92;)</span> be measurable, and suppose <span>&#92;(f(x) = &#92;lim_{n&#92;to&#92;infty} f_n(x)&#92;)</span> exists for all <span>&#92;(x \in A&#92;)</span>. If there is an integrable function <span>&#92;(g: A \to [0,&#92;infty]&#92;)</span> with <span>&#92;(|f_n(x)| \leq g(x)&#92;)</span> for all <span>&#92;(n&#92;)</span> and <span>&#92;(x&#92;)</span>, then
<span>&#92;[
&#92;\lim_{n&#92;to&#92;infty} &#92;\int_A f_n = &#92;\int_A f.
&#92;]</span>

*Proof.* Apply Fatou's Lemma to <span>&#92;(g + f_n \geq 0&#92;)</span> to get <span>&#92;(&#92;\liminf \int f_n \geq \int f&#92;)</span>, and to <span>&#92;(g - f_n \geq 0&#92;)</span> to get <span>&#92;(&#92;\limsup \int f_n \leq \int f&#92;)</span>.

---

# Chapter 3: The <span>&#92;(L^p&#92;)</span> Spaces

This chapter develops the normed vector spaces <span>&#92;(L^p(A)&#92;)</span> of equivalence classes of measurable functions whose <span>&#92;(p&#92;)</span>th power is integrable, and proves they are **Banach spaces** (complete normed spaces). The case <span>&#92;(p = 2&#92;)</span> yields a Hilbert space.

## Topological Preliminaries

**3.1–3.4 Definitions.** Recall the hierarchy: an **inner product** on a real vector space <span>&#92;(V&#92;)</span> is a positive-definite symmetric bilinear form <span>&#92;(&#92;langle x, y &#92;\rangle&#92;)</span>; it induces a **norm** <span>&#92;(\|x\| = &#92;\sqrt{&#92;\langle x,x&#92;\rangle}&#92;)</span>; a norm induces a **metric** <span>&#92;(d(x,y) = \|x-y\|&#92;)</span>; and a metric induces a **topology** (open sets as unions of open balls).

**3.5 Note** (Cauchy–Schwarz). Every inner product satisfies <span>&#92;(&#92;\langle x, y &#92;\rangle \leq \|x\|\|y\|&#92;)</span> and the **polarization identity** <span>&#92;\(&#92;\langle x, y &#92;\rangle = &#92;\tfrac{1}{4}(&#92;|x+y&#92;|^2 - &#92;|x-y&#92;|^2)\)</span>.

**3.10 Definition.** A metric space is **complete** if every Cauchy sequence converges. A complete normed space is a **Banach space**; a complete inner-product space is a **Hilbert space**.

## The <span>&#92;(\ell^p&#92;)</span> and <span>&#92;(L^p&#92;)</span> Spaces

**3.12 Definition.** For sequences <span>&#92;(x = (x_1, x_2, \ldots) \in &#92;mathbb{R}^&#92;omega&#92;)</span> and <span>&#92;(1 \leq p < &#92;infty&#92;)</span>, define
<span>&#92;[
\|x\|_p = \left(\sum_{k=1}^&#92;infty |x_k|^p\right)^{1/p}, &#92;quad \|x\|_&#92;infty = \sup_k |x_k|,
&#92;]</span>
and let <span>&#92;(&#92;\ell^p = \{x : \|x\|_p < &#92;infty\}&#92;)</span>, <span>&#92;(&#92;\ell^&#92;infty = \{x : \|x\|_&#92;infty < &#92;infty\}&#92;)</span>.

**3.13 Definition.** For measurable <span>&#92;(A \subseteq &#92;mathbb{R}&#92;)</span>, define
<span>&#92;[
\|f\|_p = \left(&#92;\int_A |f|^p\right)^{1/p}, &#92;quad \|f\|_&#92;infty = &#92;\inf\{a \geq 0 : &#92;\lambda(\{|f| > a\}) = 0\},
&#92;]</span>
and let <span>&#92;(L^p(A) = \{f \in &#92;\mathcal{M}(A) : \|f\|_p < &#92;infty\}/{\sim}&#92;)</span> where <span>&#92;(f \sim g \Leftrightarrow f = g&#92;)</span> a.e. (We identify functions equal almost everywhere so that <span>&#92;\(\|f\|_p = 0 \Rightarrow f = 0\)</span> in <span>&#92;\(L^p\)</span>.)

**3.15 Lemma.** If <span>&#92;(f&#92;)</span> is measurable, then <span>&#92;(\{|f| > \|f\|_&#92;infty\}&#92;)</span> has measure zero (the essential supremum is achieved a.e.).

## Hölder's and Minkowski's Inequalities

**3.16 Definition.** We say <span>&#92;(p, q \in [1,&#92;infty]&#92;)</span> are **conjugate** when <span>&#92;(1/p + 1/q = 1&#92;)</span> (with convention <span>&#92;(1/&#92;infty = 0&#92;)</span>).

**3.17 Lemma** (Young's Inequality). For <span>&#92;(p, q \in (1,&#92;infty)&#92;)</span> conjugate and <span>&#92;(a, b \geq 0&#92;)</span>,
<span>&#92;[
ab \leq &#92;\frac{a^p}{p} + &#92;\frac{b^q}{q}.
&#92;]</span>
*Proof.* The area argument: the area of the rectangle <span>&#92;([0,a] \times [0,b]&#92;)</span> is at most the area under <span>&#92;(y = x^{p-1}&#92;)</span> plus the area to its left, giving <span>&#92;(ab \leq \int_0^a x^{p-1}dx + \int_0^b y^{q-1}dy = a^p/p + b^q/q&#92;)</span>.

**3.18 Theorem** (Hölder's Inequality). Let <span>&#92;(1/p + 1/q = 1&#92;)</span>.
- If <span>&#92;(x \in &#92;\ell^p&#92;)</span> and <span>&#92;(y \in &#92;\ell^q&#92;)</span>, then <span>&#92;(xy \in &#92;\ell^1&#92;)</span> with <span>&#92;\(\|xy\|_1 \leq \|x\|_p\|y\|_q\)</span>.
- If <span>&#92;(f \in L^p(A)&#92;)</span> and <span>&#92;(g \in L^q(A)&#92;)</span>, then <span>&#92;(fg \in L^1(A)&#92;)</span> with <span>&#92;\(\|fg\|_1 \leq \|f\|_p\|g\|_q\)</span>.

*Proof.* Apply Young's inequality termwise/pointwise with <span>&#92;(a = |x_k|/\|x\|_p&#92;)</span>, <span>&#92;(b = |y_k|/\|y\|_q&#92;)</span>, then sum.

**3.19 Theorem** (Minkowski's Inequality). For <span>&#92;(p \in [1,&#92;infty]&#92;)</span>:
- If <span>&#92;(x, y \in &#92;\ell^p&#92;)</span> then <span>&#92;\(\|x+y\|_p \leq \|x\|_p + \|y\|_p\)</span>.
- If <span>&#92;(f, g \in L^p(A)&#92;)</span> then <span>&#92;\(\|f+g\|_p \leq \|f\|_p + \|g\|_p\)</span>.

*Proof for <span>&#92;(p \in (1,&#92;infty)&#92;)</span>:* Write <span>&#92;(&#92;|f+g&#92;|^p = &#92;|f+g&#92;| \cdot &#92;|f+g&#92;|^{p-1} \leq (&#92;|f&#92;| + &#92;|g&#92;|)&#92;|f+g&#92;|^{p-1}&#92;)</span>, integrate and apply Hölder to each term, then divide both sides by <span>&#92;\(\|f+g\|_p^{p-1}\)</span>.

**3.21 Theorem.** <span>&#92;(&#92;\ell^p&#92;)</span> and <span>&#92;(L^p(A)&#92;)</span> are **normed linear spaces** with their <span>&#92;(p&#92;)</span>-norms.

## Completeness of <span>&#92;(L^p&#92;)</span>

**3.22 Theorem** (Riesz–Fischer). For <span>&#92;(p \in [1,&#92;infty]&#92;)</span>, the spaces <span>&#92;(&#92;\ell^p&#92;)</span> and <span>&#92;(L^p(A)&#92;)</span> are **complete** (Banach spaces).

*Proof for <span>&#92;(L^p&#92;)</span>, <span>&#92;(p < &#92;infty&#92;)</span>:* Given a Cauchy sequence <span>&#92;(\{f_n\}&#92;)</span>, extract a subsequence <span>&#92;(\{f_{n_k}\}&#92;)</span> with <span>&#92;\(\|f_{n_{k+1}} - f_{n_k}\|_p \leq 1/2^k\)</span>. Define <span>&#92;(g_\ell = \sum_{k=1}^\ell |f_{n_{k+1}} - f_{n_k}|&#92;)</span>. By Minkowski, <span>&#92;\(\|g_\ell\|_p \leq 1\)</span>, and by Fatou, <span>&#92;\(\|g\|_p \leq 1\)</span> where <span>&#92;(g = \lim g_\ell&#92;)</span>. So <span>&#92;(g < &#92;infty&#92;)</span> a.e., meaning the telescoping series converges a.e. to some limit <span>&#92;(f&#92;)</span>. One then uses Fatou again to show <span>&#92;\(\|f - f_m\|_p \to 0\)</span>.

For <span>&#92;(L^&#92;infty&#92;)</span>: A Cauchy sequence in <span>&#92;(L^&#92;infty&#92;)</span> converges uniformly outside a null set, and one defines the limit pointwise off that null set.

## Containment and Separability

**3.23 Theorem.** Let <span>&#92;(1 \leq p < q \leq &#92;infty&#92;)</span>.
1. <span>&#92;(&#92;\ell^p \subseteq &#92;\ell^q&#92;)</span>.
2. If <span>&#92;(&#92;lambda(A) < &#92;infty&#92;)</span>, then <span>&#92;(L^q(A) \subseteq L^p(A)&#92;)</span>, with <span>&#92;\(\|f\|_p \leq \|f\|_q &#92;\lambda(A)^{1/p - 1/q}\)</span>.

The containment <span>&#92;(L^q \subseteq L^p&#92;)</span> on finite measure spaces means higher integrability implies lower: an <span>&#92;(L^2&#92;)</span> function is automatically in <span>&#92;(L^1&#92;)</span> on a bounded domain.

**3.24 Theorem.** For <span>&#92;(1 \leq p < q < r \leq &#92;infty&#92;)</span>: <span>&#92;(L^p \cap L^r \subseteq L^q \subseteq L^p + L^r&#92;)</span>.

**3.25 Theorem.** For <span>&#92;(1 \leq p < &#92;infty&#92;)</span>, <span>&#92;(&#92;\ell^p&#92;)</span> and <span>&#92;(L^p[a,b]&#92;)</span> are **separable** (have a countable dense subset), while <span>&#92;(&#92;\ell^&#92;infty&#92;)</span> and <span>&#92;(L^&#92;infty[a,b]&#92;)</span> are not.

The separability of <span>&#92;(L^p[a,b]&#92;)</span> for <span>&#92;(p < &#92;infty&#92;)</span> follows because: step functions with rational coefficients on rational-endpoint intervals are dense in the step functions, which are dense in <span>&#92;(L^p&#92;)</span>.

---

# Chapter 4: Hilbert Spaces

A **Hilbert space** is a complete inner-product space. The additional structure of an inner product — beyond what a Banach space provides — allows a rich geometry: orthogonal projections, orthonormal bases, and Parseval's identity. The chief example is <span>&#92;(L^2(A)&#92;)</span>.

## Inner Products over <span>&#92;\(\mathbb{R}\)</span> and <span>&#92;\(\mathbb{C}\)</span>

**4.1 Definition.** Let <span>&#92;(&#92;mathbb{F} = &#92;mathbb{R}&#92;)</span> or <span>&#92;(&#92;mathbb{C}&#92;)</span>. An **inner product** on a vector space <span>&#92;(W&#92;)</span> over <span>&#92;(&#92;mathbb{F}&#92;)</span> is a map <span>&#92;(&#92;langle &#92;cdot, &#92;cdot &#92;\rangle : W \times W \to &#92;mathbb{F}&#92;)</span> satisfying:
1. *(Sesquilinearity)* <span>&#92;(&#92;\langle u+v, w&#92;\rangle = &#92;\langle u,w&#92;\rangle + &#92;\langle v,w&#92;\rangle&#92;)</span>, <span>&#92;(&#92;\langle tu, v&#92;\rangle = t&#92;\langle u,v&#92;\rangle&#92;)</span>, <span>&#92;(&#92;\langle u, tv&#92;\rangle = &#92;\bar{t}&#92;\langle u,v&#92;\rangle&#92;)</span>.
2. *(Conjugate symmetry)* <span>&#92;(&#92;\langle u,v&#92;\rangle = &#92;\overline{&#92;\langle v,u&#92;\rangle}&#92;)</span>.
3. *(Positive definiteness)* <span>&#92;(&#92;\langle u,u&#92;\rangle \geq 0&#92;)</span> with equality iff <span>&#92;(u = 0&#92;)</span>.

**4.4 Theorem.** Setting <span>&#92;(\|u\| = &#92;\sqrt{&#92;\langle u,u&#92;\rangle}&#92;)</span> gives a norm on <span>&#92;(W&#92;)</span>, and the following key identities hold:
- **Parallelogram law**: <span>&#92;\(\|u+v\|^2 + \|u-v\|^2 = 2\|u\|^2 + 2\|v\|^2\)</span>.
- **Polarization identity** (over <span>&#92;\(\mathbb{R}\)</span>): <span>&#92;\(&#92;\langle u,v&#92;\rangle = &#92;\tfrac{1}{4}(&#92;|u+v&#92;|^2 - &#92;|u-v&#92;|^2)\)</span>.
- **Pythagoras**: <span>&#92;\(&#92;\langle u,v&#92;\rangle = 0 \Rightarrow \|u+v\|^2 = \|u\|^2 + \|v\|^2\)</span>.
- **Cauchy–Schwarz**: <span>&#92;\(|&#92;\langle u,v&#92;\rangle| \leq \|u\|\|v\|\)</span>, with equality iff <span>&#92;(\{u,v\}&#92;)</span> is linearly dependent.
- **Triangle inequality**: <span>&#92;\(\|u+v\| \leq \|u\| + \|v\|\)</span>.

## Orthogonality and Gram–Schmidt

**4.6 Definition.** A subset <span>&#92;(A \subseteq W&#92;)</span> is **orthogonal** if <span>&#92;(&#92;\langle u,v&#92;\rangle = 0&#92;)</span> for distinct <span>&#92;(u,v \in A&#92;)</span>, and **orthonormal** if additionally <span>&#92;\(\|u\| = 1\)</span> for all <span>&#92;(u \in A&#92;)</span>.

**4.7 Theorem.** An orthogonal set of nonzero vectors is linearly independent. If <span>&#92;(\{u_1,\ldots,u_n\}&#92;)</span> is orthogonal and <span>&#92;(x \in &#92;\operatorname{span}\{u_1,\ldots,u_n\}&#92;)</span>, then
<span>&#92;[
x = \sum_{k=1}^n &#92;\frac{&#92;\langle x, u_k&#92;\rangle}{&#92;|u_k&#92;|^2} u_k.
&#92;]</span>

**4.8 Theorem** (Gram–Schmidt). Given a countable ordered basis <span>&#92;(\{u_1, u_2, \ldots\}&#92;)</span> for an inner product space, define <span>&#92;(v_1 = u_1&#92;)</span> and
<span>&#92;[
v_n = u_n - \sum_{k=1}^{n-1} &#92;\frac{&#92;\langle u_n, v_k&#92;\rangle}{&#92;|v_k&#92;|^2} v_k &#92;quad (n \geq 2).
&#92;]</span>
Then <span>&#92;(\{v_1, v_2, \ldots\}&#92;)</span> is an orthogonal basis with <span>&#92;(&#92;\operatorname{span}\{v_1,\ldots,v_n\} = &#92;\operatorname{span}\{u_1,\ldots,u_n\}&#92;)</span> for all <span>&#92;(n&#92;)</span>.

## The Projection Theorem

A key failure of Gram–Schmidt in infinite dimensions: in a non-complete inner product space, a closed subspace need not have orthogonal complement giving a direct sum decomposition. Completeness (the Hilbert space assumption) is essential.

**4.27 Theorem** (Closest Point / Projection). Let <span>&#92;(H&#92;)</span> be a Hilbert space and <span>&#92;(S \subseteq H&#92;)</span> be **closed** and **convex**. Then for every <span>&#92;(a \in H&#92;)</span> there exists a **unique** <span>&#92;(b \in S&#92;)</span> minimizing <span>&#92;\(\|b - a\|\)</span>.

*Proof.* Let <span>&#92;(d = &#92;\inf_{x \in S} \|x - a\|&#92;)</span> and choose <span>&#92;(x_n \in S&#92;)</span> with <span>&#92;\(\|x_n - a\| \to d\)</span>. The parallelogram law gives
<span>&#92;[
\|x_k - x_\ell\|^2 = 2\|x_k-a\|^2 + 2\|x_\ell - a\|^2 - 4&#92;&#92;\left&#92;|&#92;\frac{x_k+x_\ell}{2} - a&#92;&#92;\right&#92;|^2 \leq 2\|x_k-a\|^2 + 2\|x_\ell-a\|^2 - 4d^2,
&#92;]</span>
which goes to zero, so <span>&#92;(\{x_n\}&#92;)</span> is Cauchy. Completeness gives the limit <span>&#92;(b = &#92;\lim x_n \in S&#92;)</span> (closed). Uniqueness follows similarly via the parallelogram law.

**4.28 Corollary** (Orthogonal Decomposition). Let <span>&#92;(H&#92;)</span> be a Hilbert space and <span>&#92;(U \subseteq H&#92;)</span> a **closed subspace**. Then:
1. For every <span>&#92;(w \in H&#92;)</span> there exists a unique nearest point <span>&#92;(u \in U&#92;)</span>.
2. <span>&#92;(H = U \oplus U^\perp&#92;)</span>: every <span>&#92;(w \in H&#92;)</span> writes uniquely as <span>&#92;(w = u + v&#92;)</span> with <span>&#92;(u \in U&#92;)</span>, <span>&#92;(v \in U^\perp = \{v : &#92;\langle v, u&#92;\rangle = 0 &#92;\ \forall u \in U\}&#92;)</span>.

*Proof.* The unique nearest point <span>&#92;(u&#92;)</span> is found by the projection theorem (U is convex and closed). Setting <span>&#92;(v = w - u&#92;)</span>, one shows <span>&#92;(v \in U^\perp&#92;)</span>: if not, there exists <span>&#92;(u_0 \in U&#92;)</span> with <span>&#92;\(&#92;\langle v, u_0&#92;\rangle > 0\)</span>, and then <span>&#92;\(\|w - (u + tu_0)\|^2 = \|v\|^2 - 2t&#92;\langle v,u_0&#92;\rangle + t^2\|u_0\|^2 < \|v\|^2\)</span> for small <span>&#92;(t > 0&#92;)</span>, contradicting minimality.

We write <span>&#92;(u = &#92;\operatorname{proj}_U(w)&#92;)</span> and <span>&#92;(v = &#92;\operatorname{proj}_{U^\perp}(w)&#92;)</span>.

**Remark.** In a non-complete inner product space (e.g., sequences with finitely many nonzero terms, with the <span>&#92;\(\ell^2\)</span> inner product), a closed subspace need not satisfy <span>&#92;(W = U \oplus U^\perp&#92;)</span>. Completeness is essential.

## Hilbert Bases and Parseval's Identity

**Definition.** A **Hilbert basis** (or **complete orthonormal system**) for a separable Hilbert space <span>&#92;(H&#92;)</span> is a maximal orthonormal set <span>&#92;(&#92;\mathcal{U} = \{u_1, u_2, \ldots\}&#92;)</span>.

By Zorn's lemma, every inner product space has a maximal orthonormal set. In a Hilbert space, maximality is equivalent to density of the span.

**4.29 Theorem.** Let <span>&#92;(H&#92;)</span> be a separable Hilbert space with countable orthonormal set <span>&#92;(&#92;\mathcal{U} = \{u_1, u_2, \ldots\}&#92;)</span>. The following are equivalent:
1. <span>&#92;(&#92;\mathcal{U}&#92;)</span> is maximal (Hilbert basis).
2. <span>&#92;(&#92;\operatorname{span}&#92;\mathcal{U}&#92;)</span> is dense in <span>&#92;(H&#92;)</span>.
3. For all <span>&#92;(x \in H&#92;)</span>: <span>&#92;\(x = \sum_{k=1}^&#92;infty &#92;\langle x, u_k&#92;\rangle u_k&#92;)</span> (convergence in <span>&#92;(H&#92;)</span>).
4. **Parseval's identity**: For all <span>&#92;(x \in H&#92;)</span>: <span>&#92;\(\|x\|^2 = \sum_{k=1}^&#92;infty |&#92;\langle x, u_k&#92;\rangle|^2\)</span>.
5. For all <span>&#92;(x, y \in H&#92;)</span>: <span>&#92;\(&#92;\langle x, y&#92;\rangle = \sum_{k=1}^&#92;infty &#92;\langle x, u_k&#92;\rangle &#92;\overline{&#92;\langle y, u_k&#92;\rangle}\)</span>.

*Note: (4) implies* **Bessel's inequality**: <span>&#92;\(\|x\|^2 \geq \sum_{k=1}^n |&#92;\langle x,u_k&#92;\rangle|^2\)</span> *for any finite orthonormal set.*

**4.30 Theorem.** Every separable Hilbert space over <span>&#92;(&#92;\mathbb{F}&#92;)</span> is isometrically isomorphic to <span>&#92;(&#92;\ell^2(&#92;\mathbb{F})&#92;)</span> via the map <span>&#92;(x &#92;\mapsto (&#92;\langle x, u_1&#92;\rangle, &#92;\langle x, u_2&#92;\rangle, \ldots)&#92;)</span>.

---

# Chapter 5: Fourier Analysis

*These notes draw from Calvin Kent's student notes (Lectures 31–36), as Prof. New deferred Fourier series to §§15.1–15.5 and 15.11 of the textbook.*

The central question of Fourier analysis is: *can every* <span>&#92;(L^2&#92;)</span> *function be expressed as a series of sines and cosines?* The answer is yes, and the tools developed here — the Dirichlet kernel, Fejér kernel, and convolution — also address pointwise and uniform convergence.

## Periodic Functions and Trigonometric Polynomials

A **<span>&#92;(2&#92;\pi&#92;)</span>-periodic function** <span>&#92;(f: &#92;mathbb{R} \to &#92;mathbb{C}&#92;)</span> is determined by its values on <span>&#92;([-&#92;\pi, &#92;\pi)&#92;)</span>, or equivalently on the circle <span>&#92;(&#92;\mathbb{T} = &#92;mathbb{R}/2&#92;\pi&#92;\mathbb{Z}&#92;)</span>. We write <span>&#92;(L^p(&#92;\mathbb{T})&#92;)</span> or <span>&#92;(L^p[-&#92;\pi,&#92;\pi]&#92;)</span> for the corresponding <span>&#92;(L^p&#92;)</span> space.

**Definition 31.1** (Real trigonometric polynomial). A function of the form
<span>&#92;[
f(x) = a_0 + \sum_{n=1}^m a_n &#92;\cos nx + \sum_{n=1}^m b_n &#92;\sin nx.
&#92;]</span>

**Definition 33.1** (Complex trigonometric polynomial). A function of the form <span>&#92;(f(x) = \sum_{n=-\ell}^\ell c_n e^{inx}&#92;)</span>, where
<span>&#92;[
e^{inx} = &#92;\cos nx + i&#92;\sin nx, &#92;quad &#92;\cos nx = &#92;\frac{e^{inx}+e^{-inx}}{2}, &#92;quad &#92;\sin nx = &#92;\frac{e^{inx}-e^{-inx}}{2i}.
&#92;]</span>

**Remark 31.2.** By the **Stone–Weierstrass theorem**, the trigonometric polynomials are dense in <span>&#92;(C(&#92;\mathbb{T})&#92;)</span> (continuous <span>&#92;(2&#92;\pi&#92;)</span>-periodic functions) in the sup norm, and hence also in <span>&#92;(L^p(&#92;\mathbb{T})&#92;)</span> for all <span>&#92;(1 \leq p < &#92;infty&#92;)</span>.

## Fourier Series in <span>&#92;(L^2&#92;)</span>

The set <span>&#92;(\{1, &#92;\cos nx, &#92;\sin nx : n \in &#92;\mathbb{Z}^+\}&#92;)</span> is orthogonal in <span>&#92;(L^2[-&#92;\pi,&#92;\pi]&#92;)</span>, with
<span>&#92;[
&#92;|1&#92;|_2^2 = 2&#92;\pi, &#92;quad &#92;|&#92;\cos nx&#92;|_2^2 = &#92;|&#92;\sin nx&#92;|_2^2 = &#92;\pi.
&#92;]</span>
Normalizing, <span>&#92;(&#92;\left\{&#92;\frac{1}{&#92;\sqrt{2&#92;\pi}},&#92; &#92;\frac{1}{&#92;\sqrt{&#92;\pi}}&#92;\cos nx,&#92; &#92;\frac{1}{&#92;\sqrt{&#92;\pi}}&#92;\sin nx&#92;\right\}&#92;)</span> is an orthonormal set whose span is dense (the trigonometric polynomials are dense), so it is a **Hilbert basis** for <span>&#92;(L^2[-&#92;\pi,&#92;\pi]&#92;)</span>.

By Parseval's identity / the Hilbert basis theorem, every <span>&#92;(f \in L^2[-&#92;\pi,&#92;\pi]&#92;)</span> satisfies
<span>&#92;[
f(x) = a_0 + \sum_{n=1}^&#92;infty (a_n &#92;\cos nx + b_n &#92;\sin nx) &#92;quad \text{in } L^2,
&#92;]</span>
where the **Fourier coefficients** are
<span>&#92;[
a_0 = &#92;\frac{1}{2&#92;\pi}&#92;\int_{-&#92;\pi}^&#92;\pi f(x)&#92;,dx, &#92;quad a_n = &#92;\frac{1}{&#92;\pi}&#92;\int_{-&#92;\pi}^&#92;\pi f(x)&#92;\cos nx&#92;,dx, &#92;quad b_n = &#92;\frac{1}{&#92;\pi}&#92;\int_{-&#92;\pi}^&#92;\pi f(x)&#92;\sin nx&#92;,dx.
&#92;]</span>

In **complex notation**, the set <span>&#92;(\{e^{inx}/&#92;\sqrt{2&#92;\pi} : n \in &#92;\mathbb{Z}\}&#92;)</span> is a Hilbert basis for <span>&#92;(L^2(&#92;\mathbb{T},&#92;\mathbb{C})&#92;)</span>, and
<span>&#92;[
f(x) = \sum_{n=-&#92;infty}^&#92;infty c_n e^{inx} &#92;quad \text{in } L^2(&#92;\mathbb{T}), &#92;quad \text{where} &#92;quad c_n = &#92;\hat{f}(n) = &#92;\frac{1}{2&#92;\pi}&#92;\int_{-&#92;\pi}^&#92;\pi f(t)e^{-int}&#92;,dt.
&#92;]</span>

## Partial Sums and the Dirichlet Kernel

**Notation 34.2.** The **<span>&#92;(\ell&#92;)</span>-th partial sum** of the Fourier series of <span>&#92;(f \in L^1(&#92;\mathbb{T})&#92;)</span> is
<span>&#92;[
S_\ell(f)(x) = \sum_{n=-\ell}^\ell c_n e^{inx}.
&#92;]</span>
Computing explicitly:
<span>&#92;[
S_\ell(f)(x) = &#92;\frac{1}{&#92;\pi}&#92;\int_{-&#92;\pi}^&#92;\pi f(t)&#92;D_\ell(x-t)&#92;,dt,
&#92;]</span>
where the **Dirichlet kernel** is
<span>&#92;[
D_\ell(u) = &#92;\frac{1}{2}\sum_{n=-\ell}^\ell e^{inu} = &#92;\begin{cases} &#92;\dfrac{&#92;\sin((\ell+&#92;\frac{1}{2})u)}{2&#92;\sin(&#92;\frac{u}{2})} & u \neq 0, &#92;&#92; \ell + &#92;\frac{1}{2} & u = 0. &#92;\end{cases}
&#92;]</span>
Properties: <span>&#92;(D_\ell&#92;)</span> is real-valued, even, <span>&#92;(2&#92;\pi&#92;)</span>-periodic, and <span>&#92;\(\int_{-&#92;\pi}^&#92;\pi D_\ell(u)&#92;,du = &#92;\pi\)</span>.

## Cesàro Means and the Fejér Kernel

The partial sums <span>&#92;(S_\ell(f)&#92;)</span> need not converge pointwise for <span>&#92;(f \in L^1&#92;)</span>. **Cesàro summation** is more robust:

**Notation 34.2.** The **<span>&#92;(m&#92;)</span>-th Cesàro mean** is
<span>&#92;[
&#92;\sigma_m(f)(x) = &#92;\frac{1}{m+1}\sum_{\ell=0}^m S_\ell(f)(x) = &#92;\frac{1}{&#92;\pi}&#92;\int_{-&#92;\pi}^&#92;\pi f(t)&#92;K_m(x-t)&#92;,dt,
&#92;]</span>
where the **Fejér kernel** is
<span>&#92;[
K_m(u) = &#92;\frac{1}{m+1}\sum_{\ell=0}^m D_\ell(u) = &#92;\begin{cases} &#92;\dfrac{1}{2(m+1)}&#92;\cdot&#92;\dfrac{&#92;\sin^2(&#92;\frac{(m+1)u}{2})}{&#92;\sin^2(&#92;\frac{u}{2})} & u \neq 0, &#92;&#92; &#92;\dfrac{m+1}{2} & u = 0. &#92;\end{cases}
&#92;]</span>

Properties of <span>&#92;(K_m&#92;)</span>:
- Real-valued, even, <span>&#92;(2&#92;\pi&#92;)</span>-periodic, and **non-negative** (unlike <span>&#92;(D_\ell&#92;)</span>).
- <span>&#92;\(\int_{-&#92;\pi}^&#92;\pi K_m(u)&#92;,du = &#92;\pi\)</span>.
- <span>&#92;\(&#92;\max K_m = K_m(0) = (m+1)/2\)</span>.
- For fixed <span>&#92;(&#92;\delta > 0&#92;)</span>: <span>&#92;\(K_m(u) \leq &#92;\frac{&#92;\pi^2}{2(m+1)&#92;\sin^2(&#92;\delta/2)}\)</span> for <span>&#92;(|u| \geq &#92;\delta&#92;)</span>, so <span>&#92;(K_m \to 0&#92;)</span> uniformly away from 0.

The convolution can also be written as <span>&#92;\(&#92;\sigma_m(f)(x) = &#92;\frac{1}{&#92;\pi}\int_{-&#92;\pi}^&#92;\pi f(x+t)K_m(t)&#92;,dt\)</span>.

## The Riemann–Lebesgue Lemma

**Theorem 35.1** (Riemann–Lebesgue Lemma). If <span>&#92;(f \in L^1(&#92;\mathbb{T})&#92;)</span>, then <span>&#92;\(&#92;\lim_{n \to &#92;\infty} c_n(f) = 0\)</span>.

*Proof.* Given <span>&#92;(&#92;\varepsilon > 0&#92;)</span>, choose a trigonometric polynomial <span>&#92;(g = \sum_{n=-\ell}^\ell a_n e^{inx}&#92;)</span> with <span>&#92;\(\|f-g\|_1 < 2&#92;\pi&#92;\varepsilon\)</span>. For <span>&#92;(|n| > \ell&#92;)</span>, <span>&#92;\(c_n(g) = 0\)</span>, so
<span>&#92;[
|c_n(f)| = |c_n(f-g)| \leq &#92;\frac{1}{2&#92;\pi}\|f-g\|_1 < &#92;\varepsilon. &#92;\qquad&#92;\square
&#92;]</span>

## Fejér's Theorem

**Theorem 35.2** (Fejér). Let <span>&#92;(f \in L^1(&#92;\mathbb{T})&#92;)</span> and <span>&#92;(a \in &#92;\mathbb{T}&#92;)</span>. Suppose the one-sided limits <span>&#92;(f(a^+) = &#92;\lim_{t \to 0^+} f(a+t)&#92;)</span> and <span>&#92;(f(a^-) = &#92;\lim_{t \to 0^+} f(a-t)&#92;)</span> both exist in <span>&#92;(&#92;\mathbb{C}&#92;)</span>. Then
<span>&#92;[
&#92;\lim_{m \to &#92;infty} &#92;\sigma_m(f)(a) = &#92;\frac{f(a^+) + f(a^-)}{2}.
&#92;]</span>
Moreover, if <span>&#92;(f&#92;)</span> is continuous on a closed interval <span>&#92;(I&#92;)</span>, the convergence is **uniform** on <span>&#92;(I&#92;)</span>.

*Proof sketch.* Write
<span>&#92;[
&#92;\sigma_m(f)(a) - &#92;\frac{f(a^+)+f(a^-)}{2} = &#92;\frac{1}{&#92;\pi}&#92;\int_0^&#92;\pi [(f(a+t)+f(a-t)) - (f(a^+)+f(a^-))]K_m(t)&#92;,dt.
&#92;]</span>
Split at <span>&#92;(\delta&#92;)</span>: the integral over <span>&#92;([0,\delta]&#92;)</span> is small by continuity of the one-sided limits (so the integrand is at most <span>&#92;(\varepsilon&#92;)</span>), using <span>&#92;\(\int_0^&#92;\pi K_m = &#92;\pi/2\)</span>. The integral over <span>&#92;([\delta,&#92;\pi]&#92;)</span> is small because <span>&#92;(K_m(t) \leq &#92;\pi^2/(2(m+1)&#92;\sin^2(&#92;\delta/2))&#92;)</span> decays as <span>&#92;(m \to &#92;\infty&#92;)</span>.

**Corollary 35.4.** If <span>&#92;(f \in L^1(&#92;\mathbb{T})&#92;)</span> is continuous at <span>&#92;(a&#92;)</span>, then <span>&#92;\(&#92;\sigma_m(f)(a) \to f(a)\)</span>. If <span>&#92;(f&#92;)</span> is continuous everywhere, then <span>&#92;\(&#92;\sigma_m(f) \to f&#92;)</span> uniformly.

## Applications of Fourier Series

### Forced Damped Oscillator

Consider the ODE <span>&#92;(y'' + 2y' + 10y = g(t)&#92;)</span> where <span>&#92;(g&#92;)</span> is a <span>&#92;(2&#92;\pi&#92;)</span>-periodic even function (a "triangle wave"). The homogeneous solution <span>&#92;(y_h = e^{-t}(A&#92;\cos 3t + B&#92;\sin 3t) \to 0&#92;)</span> as <span>&#92;(t \to &#92;infty&#92;)</span>. For each Fourier mode <span>&#92;(&#92;\cos nt&#92;)</span>, a particular solution is
<span>&#92;[
y_n = A_n &#92;\cos nt + B_n &#92;\sin nt, &#92;quad A_n = &#92;\frac{10-n^2}{(10-n^2)^2+4n^2}, &#92;quad B_n = &#92;\frac{2n}{(10-n^2)^2+4n^2}.
&#92;]</span>
The Fourier series of the triangle wave has <span>&#92;(a_n = 4/(&#92;\pi n^2)&#92;)</span> for odd <span>&#92;(n&#92;)</span> (and 0 for even <span>&#92;(n&#92;)</span>), so the general solution is
<span>&#92;[
y = e^{-t}(A&#92;\cos 3t + B&#92;\sin 3t) + \sum_{n=1}^&#92;infty &#92;\frac{4}{&#92;\pi n^2}(A_n &#92;\cos nt + B_n &#92;\sin nt).
&#92;]</span>

### Vibrating String

The wave equation <span>&#92;\(u_{tt} = c^2 u_{xx}\)</span> on <span>&#92;\([0,&#92;\pi]\)</span> with fixed endpoints <span>&#92;\(u(0,t) = u(&#92;\pi,t) = 0\)</span> and initial data <span>&#92;\(u(x,0) = g(x)\)</span>, <span>&#92;\(u_t(x,0) = h(x)\)</span> is solved by separation of variables. The eigenvalue problem <span>&#92;\(X'' = -n^2 X\)</span>, <span>&#92;\(X(0) = X(&#92;\pi) = 0\)</span> has solutions <span>&#92;\(X_n(x) = &#92;\sin nx\)</span>, and the general solution is
<span>&#92;[
u(x,t) = \sum_{n=1}^&#92;infty &#92;\sin(nx)(A_n &#92;\cos nct + B_n &#92;\sin nct),
&#92;]</span>
where <span>&#92;(A_n&#92;)</span> are the Fourier sine coefficients of <span>&#92;(g&#92;)</span> and <span>&#92;(ncB_n&#92;)</span> are those of <span>&#92;(h&#92;)</span>.
