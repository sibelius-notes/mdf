---
title: "PMATH 434: Set Theory"
prof: "Andrew Zucker"
subjects: "PMATH"
---

## Sources and References

**Primary textbook** — Thomas Jech, *Set Theory*, 3rd ed., Springer, 2003.
**Supplementary texts** — Kenneth Kunen, *Set Theory*, 2nd ed., College Publications, 2011; Azriel Lévy, *Basic Set Theory*, Springer, 1979.
**Online resources** — Timothy Chow, *A Beginner's Guide to Forcing*, AMS, 2008; Itay Neeman, UCLA Set Theory notes; Asger Törnquist, Copenhagen set theory notes; Yiannis Moschovakis, *Notes on Set Theory*, Springer.

---

# Chapter 1: Axioms of Set Theory (ZFC)

Set theory serves as a universal foundation for mathematics. Every mathematical object — numbers, functions, topological spaces, groups — can be encoded as a set, and all of mathematics can in principle be derived from a small list of axioms about sets. The standard axiom system is **Zermelo–Fraenkel set theory with the Axiom of Choice**, abbreviated **ZFC**. It was assembled in its modern form during the first three decades of the twentieth century, with contributions from Ernst Zermelo (1908), Abraham Fraenkel, Thoralf Skolem, and John von Neumann.

The language of ZFC is first-order logic with a single binary predicate \(\in\) (membership). All variables range over sets. There are no "urelements" (non-set atoms) in the standard formulation. We write \(x \in y\) to mean "x is an element of y."

## The Axioms of ZFC

### Extensionality

<div class="axiom">
<strong>Axiom of Extensionality.</strong> Two sets are equal if and only if they have the same elements:
\[ \forall x \, \forall y \, \bigl( x = y \leftrightarrow \forall z\,(z \in x \leftrightarrow z \in y) \bigr). \]
</div>

This axiom makes sets purely extensional objects: a set is determined entirely by its members, not by how it is described or constructed.

### Empty Set and Pairing

<div class="axiom">
<strong>Axiom of Empty Set.</strong> There exists a set with no elements:
\[ \exists x \, \forall y \, (y \notin x). \]
</div>

By Extensionality, this set is unique; we denote it \(\emptyset\).

<div class="axiom">
<strong>Axiom of Pairing.</strong> For any sets \(a\) and \(b\), there exists a set \(\{a, b\}\) whose elements are exactly \(a\) and \(b\):
\[ \forall a \, \forall b \, \exists c \, \forall x \, (x \in c \leftrightarrow x = a \lor x = b). \]
</div>

Taking \(a = b\) yields the singleton \(\{a\}\).

### Union and Power Set

<div class="axiom">
<strong>Axiom of Union.</strong> For any set \(F\), there exists a set \(\bigcup F\) consisting of all elements of elements of \(F\):
\[ \forall F \, \exists A \, \forall x \, \bigl(x \in A \leftrightarrow \exists y\,(x \in y \land y \in F)\bigr). \]
</div>

<div class="axiom">
<strong>Axiom of Power Set.</strong> For any set \(X\), there exists the set \(\mathcal{P}(X)\) of all subsets of \(X\):
\[ \forall X \, \exists P \, \forall u \, \bigl(u \in P \leftrightarrow u \subseteq X\bigr). \]
</div>

### Separation (Comprehension Schema)

<div class="axiom">
<strong>Axiom Schema of Separation.</strong> For any set \(X\) and any formula \(\varphi(x)\) (with parameters), there exists the set of all elements of \(X\) satisfying \(\varphi\):
\[ \forall X \, \exists Y \, \forall x \, \bigl(x \in Y \leftrightarrow x \in X \land \varphi(x)\bigr). \]
</div>

This is a schema — one axiom for each formula \(\varphi\). It avoids Russell's paradox: we cannot form \(\{x : x \notin x\}\) without already having a set \(X\) to draw elements from.

<div class="remark">
<strong>Russell's Paradox.</strong> Define \(R = \{x : x \notin x\}\). Then \(R \in R \leftrightarrow R \notin R\), a contradiction. Separation prevents this: we can only form \(\{x \in X : x \notin x\}\), which is a subset of \(X\) and does not lead to a paradox.
</div>

### Replacement (Fraenkel's Axiom Schema)

<div class="axiom">
<strong>Axiom Schema of Replacement.</strong> If \(\varphi(x, y)\) defines a class-function (i.e., for every \(x\) there is at most one \(y\) with \(\varphi(x,y)\)), then the image of any set under this function is a set:
\[ \forall A \, \bigl[\forall x \in A \, \exists! y \, \varphi(x,y)\bigr] \to \exists B \, \forall x \in A \, \exists y \in B \, \varphi(x,y). \]
</div>

Replacement is strictly stronger than Separation and is needed to construct, for example, the set \(\{\omega, \mathcal{P}(\omega), \mathcal{P}(\mathcal{P}(\omega)), \ldots\}\).

### Infinity

<div class="axiom">
<strong>Axiom of Infinity.</strong> There exists an inductive set:
\[ \exists X \, \bigl(\emptyset \in X \land \forall y \in X \, (y \cup \{y\} \in X)\bigr). \]
</div>

The smallest inductive set is \(\omega = \{0, 1, 2, \ldots\}\) where \(0 = \emptyset\), \(1 = \{\emptyset\}\), \(2 = \{\emptyset, \{\emptyset\}\}\), etc. — the von Neumann natural numbers.

### Regularity (Foundation)

<div class="axiom">
<strong>Axiom of Regularity (Foundation).</strong> Every non-empty set has an \(\in\)-minimal element:
\[ \forall x \, \bigl(x \neq \emptyset \to \exists y \in x \, (y \cap x = \emptyset)\bigr). \]
</div>

Regularity forbids infinite descending \(\in\)-chains and, in particular, \(x \in x\). It implies the universe of sets is well-founded and stratified into the **von Neumann hierarchy** \(V = \bigcup_\alpha V_\alpha\).

### Axiom of Choice

<div class="axiom">
<strong>Axiom of Choice (AC).</strong> For every set \(X\) of non-empty pairwise disjoint sets, there is a set \(C\) (a <em>choice set</em>) that contains exactly one element from each member of \(X\):
\[ \forall X \, \bigl[\emptyset \notin X \to \exists f : X \to \bigcup X, \, \forall A \in X \, (f(A) \in A)\bigr]. \]
</div>

AC is independent of ZF (Zermelo–Fraenkel without choice), as shown by Cohen. It is equivalent to Zorn's Lemma, the Well-Ordering Theorem, and Tychonoff's Theorem for Hausdorff spaces.

## Classes and the Cumulative Hierarchy

In ZFC, everything is a set, but it is useful to speak of **proper classes** — collections too large to be sets (like the class of all sets, \(V\), or the class of all ordinals, \(\mathbf{Ord}\)). These are formal abbreviations for formulas.

<div class="definition">
The <strong>von Neumann hierarchy</strong> is defined by transfinite recursion:
<ul>
  <li>\(V_0 = \emptyset\)</li>
  <li>\(V_{\alpha+1} = \mathcal{P}(V_\alpha)\)</li>
  <li>\(V_\lambda = \bigcup_{\alpha < \lambda} V_\alpha\) for limit ordinals \(\lambda\)</li>
</ul>
The <strong>rank</strong> of a set \(x\) is the least \(\alpha\) such that \(x \in V_{\alpha+1}\). The universe is \(V = \bigcup_\alpha V_\alpha\).
</div>

<div class="theorem">
(ZFC) Every set has a rank. Equivalently, \(V = \bigcup_{\alpha \in \mathbf{Ord}} V_\alpha\).
</div>

<div class="proof">
This follows from the Axiom of Regularity by \(\in\)-induction: if every element of \(x\) has a rank, then \(x \in V_{\sup\{\text{rank}(y)+1 : y \in x\}+1}\).
</div>

---

# Chapter 2: Ordinal Numbers

Ordinals are the backbone of transfinite mathematics. They generalize the natural numbers to the infinite, providing canonical representatives for well-ordered sets and a framework for transfinite induction and recursion.

## Well-Orderings and Order Types

<div class="definition">
A <strong>well-ordering</strong> of a set \(A\) is a linear (total) order \(<\) on \(A\) such that every non-empty subset of \(A\) has a least element. A <strong>well-ordered set</strong> is a pair \((A, <)\) where \(<\) is a well-ordering.
</div>

<div class="definition">
Two well-ordered sets \((A, <_A)\) and \((B, <_B)\) are <strong>isomorphic</strong> (written \((A,<_A) \cong (B,<_B)\)) if there exists an order-preserving bijection between them.
</div>

<div class="theorem">
Any two well-ordered sets are comparable: one is isomorphic to an initial segment of the other, or they are isomorphic to each other.
</div>

## Von Neumann Ordinals

<div class="definition">
A set \(\alpha\) is an <strong>ordinal</strong> if it is transitive (\(x \in \alpha \Rightarrow x \subseteq \alpha\)) and well-ordered by \(\in\). Equivalently, \(\alpha\) is an ordinal if every element of \(\alpha\) is also a subset of \(\alpha\) and \(\alpha\) is linearly ordered by \(\in\).
</div>

The key insight of von Neumann's definition is that each ordinal <em>is</em> the set of all smaller ordinals: \(\alpha = \{\beta : \beta < \alpha\}\).

<div class="example">
<ul>
  <li>\(0 = \emptyset\)</li>
  <li>\(1 = \{0\} = \{\emptyset\}\)</li>
  <li>\(2 = \{0,1\} = \{\emptyset, \{\emptyset\}\}\)</li>
  <li>\(\omega = \{0, 1, 2, 3, \ldots\}\) — the first infinite ordinal</li>
  <li>\(\omega + 1 = \omega \cup \{\omega\} = \{0, 1, 2, \ldots, \omega\}\)</li>
  <li>\(\omega \cdot 2 = \omega + \omega\), \(\omega^2\), \(\omega^\omega\), \(\epsilon_0 = \omega^{\omega^{\omega^{\cdots}}}\) — the first fixed point of \(\alpha \mapsto \omega^\alpha\)</li>
</ul>
</div>

### Successor and Limit Ordinals

<div class="definition">
An ordinal \(\alpha\) is a <strong>successor ordinal</strong> if \(\alpha = \beta + 1 = \beta \cup \{\beta\}\) for some ordinal \(\beta\). It is a <strong>limit ordinal</strong> if \(\alpha \neq 0\) and \(\alpha\) is not a successor; equivalently, \(\alpha = \sup_{\beta < \alpha} \beta = \bigcup \alpha\).
</div>

The ordinals \(0, \omega, \omega \cdot 2, \omega^2, \ldots\) are limit ordinals (with \(0\) sometimes treated separately). Every natural number \(n \geq 1\) is a successor ordinal.

## Transfinite Induction and Recursion

<div class="theorem">
<strong>Transfinite Induction.</strong> Let \(\Phi(\alpha)\) be a property of ordinals. If \(\Phi(0)\) holds, and whenever \(\Phi(\beta)\) holds for all \(\beta < \alpha\) then \(\Phi(\alpha)\) holds, then \(\Phi(\alpha)\) holds for all ordinals \(\alpha\).
</div>

<div class="theorem">
<strong>Transfinite Recursion.</strong> Let \(G\) be a class function. Then there exists a unique class function \(F\) on \(\mathbf{Ord}\) such that \(F(\alpha) = G(F \restriction \alpha)\) for all ordinals \(\alpha\).
</div>

This theorem justifies defining functions by recursion over the ordinals, such as the von Neumann hierarchy, ordinal arithmetic, and the constructible universe.

## Ordinal Arithmetic

Ordinal arithmetic is defined by transfinite recursion and differs from cardinal arithmetic in being non-commutative.

<div class="definition">
<ul>
  <li><strong>Addition:</strong> \(\alpha + 0 = \alpha\); \(\alpha + (\beta+1) = (\alpha + \beta) + 1\); \(\alpha + \lambda = \sup_{\beta < \lambda}(\alpha + \beta)\) for limit \(\lambda\).</li>
  <li><strong>Multiplication:</strong> \(\alpha \cdot 0 = 0\); \(\alpha \cdot (\beta+1) = \alpha \cdot \beta + \alpha\); \(\alpha \cdot \lambda = \sup_{\beta < \lambda}(\alpha \cdot \beta)\).</li>
  <li><strong>Exponentiation:</strong> \(\alpha^0 = 1\); \(\alpha^{\beta+1} = \alpha^\beta \cdot \alpha\); \(\alpha^\lambda = \sup_{\beta < \lambda} \alpha^\beta\).</li>
</ul>
</div>

<div class="remark">
Ordinal addition and multiplication are associative but not commutative. For example, \(1 + \omega = \omega \neq \omega + 1\) and \(2 \cdot \omega = \omega \neq \omega \cdot 2 = \omega + \omega\). The right-hand side governs "how many copies of \(\alpha\)" appear, while the left-hand side shifts the type.
</div>

### Cantor Normal Form

<div class="theorem">
<strong>Cantor Normal Form.</strong> Every ordinal \(\alpha > 0\) can be written uniquely as
\[ \alpha = \omega^{\beta_1} \cdot k_1 + \omega^{\beta_2} \cdot k_2 + \cdots + \omega^{\beta_n} \cdot k_n \]
where \(\beta_1 > \beta_2 > \cdots > \beta_n \geq 0\) are ordinals and \(k_1, \ldots, k_n \geq 1\) are natural numbers.
</div>

---

# Chapter 3: Cardinal Numbers

While ordinals measure the <em>type</em> of a well-ordering, cardinals measure <em>size</em>. Two sets have the same cardinality if there is a bijection between them, regardless of any ordering.

## Cardinality and the Schröder–Bernstein Theorem

<div class="definition">
Two sets \(A\) and \(B\) are <strong>equinumerous</strong> (written \(|A| = |B|\) or \(A \sim B\)) if there exists a bijection \(f: A \to B\). We write \(|A| \leq |B|\) if there is an injection \(A \hookrightarrow B\).
</div>

<div class="theorem">
<strong>Schröder–Bernstein Theorem.</strong> If \(|A| \leq |B|\) and \(|B| \leq |A|\), then \(|A| = |B|\).
</div>

<div class="proof">
Suppose \(f: A \hookrightarrow B\) and \(g: B \hookrightarrow A\) are injections. Define \(C_0 = A \setminus g(B)\) and \(C_{n+1} = g(f(C_n))\). Let \(C = \bigcup_n C_n\). Define \(h: A \to B\) by \(h(x) = f(x)\) if \(x \in C\), and \(h(x) = g^{-1}(x)\) if \(x \notin C\). One verifies that \(h\) is well-defined and is a bijection.
</div>

## Infinite Cardinals and Alephs

<div class="definition">
A <strong>cardinal</strong> is an ordinal \(\kappa\) such that \(|\kappa| \neq |\alpha|\) for all \(\alpha < \kappa\). Equivalently (under AC), a cardinal is an ordinal that is not in bijection with any smaller ordinal.
</div>

The infinite cardinals are the alephs: \(\aleph_0 = \omega\), \(\aleph_1 = \omega_1\), \(\aleph_2 = \omega_2\), and so on. We also write \(\omega_\alpha\) for the \(\alpha\)-th infinite cardinal.

<div class="definition">
<ul>
  <li>\(\aleph_{\alpha+1} = \omega_{\alpha+1}\) is the least cardinal greater than \(\aleph_\alpha\).</li>
  <li>\(\aleph_\lambda = \bigcup_{\alpha < \lambda} \aleph_\alpha\) for limit ordinals \(\lambda\).</li>
</ul>
</div>

### Cantor's Theorem

<div class="theorem">
<strong>Cantor's Theorem.</strong> For any set \(X\), \(|X| < |\mathcal{P}(X)|\).
</div>

<div class="proof">
The map \(x \mapsto \{x\}\) is an injection \(X \to \mathcal{P}(X)\), so \(|X| \leq |\mathcal{P}(X)|\). Suppose for contradiction that \(f: X \to \mathcal{P}(X)\) is a surjection. Define \(D = \{x \in X : x \notin f(x)\}\). Since \(f\) is surjective, \(D = f(d)\) for some \(d \in X\). Then \(d \in D \leftrightarrow d \notin f(d) = D\), a contradiction.
</div>

### Cardinal Arithmetic

<div class="definition">
For cardinals \(\kappa\) and \(\lambda\):
<ul>
  <li>\(\kappa + \lambda = |\kappa \sqcup \lambda|\) (disjoint union)</li>
  <li>\(\kappa \cdot \lambda = |\kappa \times \lambda|\) (Cartesian product)</li>
  <li>\(\kappa^\lambda = |\kappa^\lambda|\) (set of all functions \(\lambda \to \kappa\))</li>
</ul>
</div>

<div class="theorem">
For infinite cardinals \(\kappa\), \(\kappa + \kappa = \kappa \cdot \kappa = \kappa\). More generally, if \(\kappa\) is an infinite cardinal and \(\lambda \leq \kappa\), then \(\kappa + \lambda = \kappa \cdot \lambda = \kappa\).
</div>

<div class="proof">
The key step is showing \(\kappa \cdot \kappa = \kappa\) for all infinite \(\kappa\), proved by well-ordering \(\kappa \times \kappa\) by the canonical pair ordering and applying transfinite induction.
</div>

### Cofinality

<div class="definition">
The <strong>cofinality</strong> \(\mathrm{cf}(\alpha)\) of a limit ordinal \(\alpha\) is the least ordinal \(\delta\) such that there exists an unbounded (cofinal) function \(f: \delta \to \alpha\). A cardinal \(\kappa\) is <strong>regular</strong> if \(\mathrm{cf}(\kappa) = \kappa\), and <strong>singular</strong> otherwise.
</div>

<div class="example">
<ul>
  <li>\(\mathrm{cf}(\omega) = \omega\) — \(\omega\) is regular.</li>
  <li>\(\mathrm{cf}(\omega_1) = \omega_1\) — \(\omega_1\) is regular.</li>
  <li>\(\mathrm{cf}(\aleph_\omega) = \omega\) — \(\aleph_\omega\) is singular (it is the supremum of the sequence \(\aleph_0, \aleph_1, \aleph_2, \ldots\)).</li>
</ul>
</div>

<div class="theorem">
<strong>König's Theorem.</strong> For any cardinals \(\kappa_i < \lambda_i\) (for \(i \in I\)):
\[ \sum_{i \in I} \kappa_i < \prod_{i \in I} \lambda_i. \]
In particular, \(\kappa < \kappa^{\mathrm{cf}(\kappa)}\) for any infinite cardinal \(\kappa\).
</div>

König's Theorem immediately implies \(2^{\aleph_0} \neq \aleph_\omega\), since \(\mathrm{cf}(\aleph_\omega) = \omega\) and \(2^{\aleph_0} = (2^{\aleph_0})^{\aleph_0} \geq \aleph_\omega^{\aleph_0} > \aleph_\omega\).

---

# Chapter 4: Real Numbers

Set theory provides a rigorous construction of the real number system from the natural numbers. The key cardinality result is that \(|\mathbb{R}| = |\mathcal{P}(\omega)| = 2^{\aleph_0}\), the cardinality of the continuum.

## The Continuum

<div class="definition">
The <strong>continuum</strong> is the cardinality \(\mathfrak{c} = 2^{\aleph_0} = |\mathbb{R}|\).
</div>

<div class="theorem">
\(|\mathbb{R}| = |\mathcal{P}(\omega)| = 2^{\aleph_0}\). Moreover, \(|\mathbb{R}^n| = |\mathbb{R}|\) for all \(n \geq 1\), and \(|\mathbb{R}^\omega| = |\mathbb{R}|\).
</div>

The **Continuum Hypothesis (CH)** asserts that \(2^{\aleph_0} = \aleph_1\), i.e., there is no set of reals with cardinality strictly between \(\aleph_0\) and \(\mathfrak{c}\). The **Generalized Continuum Hypothesis (GCH)** asserts \(2^{\aleph_\alpha} = \aleph_{\alpha+1}\) for all \(\alpha\).

## Cardinality of the Cantor Set and Descriptive Set Theory Preview

The Cantor set \(C \subseteq [0,1]\) has \(|C| = 2^{\aleph_0} = \mathfrak{c}\). Every closed subset of \(\mathbb{R}\) is either countable or of size \(\mathfrak{c}\) — this is the **Cantor–Bendixson theorem**. Chapter 11 will develop the descriptive set-theoretic hierarchy that extends this analysis.

---

# Chapter 5: The Axiom of Choice and Cardinal Arithmetic

## Equivalents of the Axiom of Choice

<div class="theorem">
The following are equivalent over ZF:
<ol>
  <li>The Axiom of Choice.</li>
  <li><strong>Zorn's Lemma:</strong> Every partially ordered set in which every chain has an upper bound has a maximal element.</li>
  <li><strong>Well-Ordering Theorem:</strong> Every set can be well-ordered.</li>
  <li><strong>Tychonoff's Theorem:</strong> Any product of compact Hausdorff spaces is compact.</li>
  <li>Every vector space has a basis (Hamel basis).</li>
  <li>Every surjection has a right inverse.</li>
</ol>
</div>

<div class="proof">
(Sketch) AC \(\Rightarrow\) Well-Ordering: Use AC to repeatedly pick the least element not yet ordered. Well-Ordering \(\Rightarrow\) Zorn: Given a chain-complete poset, well-order it and apply transfinite recursion to climb to a maximal element. Zorn \(\Rightarrow\) AC: Given a family of non-empty sets, form the poset of partial choice functions ordered by extension; a maximal element is a total choice function.
</div>

## Cardinal Exponentiation and the GCH

Under GCH, all infinite cardinal arithmetic reduces to simple rules:

<div class="theorem">
Assume GCH. For infinite cardinals \(\kappa \leq \lambda\):
\[ \kappa^\lambda = \begin{cases} \lambda^+ & \text{if } \kappa \leq \mathrm{cf}(\lambda), \\ \lambda & \text{if } \mathrm{cf}(\lambda) < \kappa \leq \lambda. \end{cases} \]
</div>

Without GCH, cardinal exponentiation is much harder to determine and is the subject of **Shelah's pcf theory**.

## Singular Cardinal Hypothesis

<div class="definition">
The <strong>Singular Cardinal Hypothesis (SCH)</strong> states: for every singular cardinal \(\kappa\), if \(2^{\mathrm{cf}(\kappa)} < \kappa\), then \(\kappa^{\mathrm{cf}(\kappa)} = \kappa^+\).
</div>

SCH follows from GCH and holds in many canonical inner models. Its failure (which requires large cardinal hypotheses) was demonstrated by Silver, Magidor, and others.

---

# Chapter 6: The Axiom of Regularity

The Axiom of Regularity (Foundation) asserts that every non-empty set has an \(\in\)-minimal element. This has deep structural consequences.

## Well-Foundedness

<div class="theorem">
The following are equivalent over ZF \(-\) Foundation + \(\forall x\,(x \notin x)\):
<ol>
  <li>The Axiom of Regularity.</li>
  <li>There is no infinite descending \(\in\)-chain \(x_0 \ni x_1 \ni x_2 \ni \cdots\)</li>
  <li>The cumulative hierarchy \(V = \bigcup_\alpha V_\alpha\) covers all sets.</li>
</ol>
</div>

## Consequences

<div class="remark">
<strong>Anti-Foundation Axiom (AFA).</strong> Peter Aczel studied set theories in which Regularity is replaced by the Anti-Foundation Axiom, allowing sets such as \(x = \{x\}\). Such "non-well-founded" set theory is useful in computer science (process algebras, coinductive definitions) but is not the standard mathematical universe.
</div>

<div class="theorem">
(ZF + Foundation) The class \(\mathbf{Ord}\) of all ordinals is well-ordered by \(\in\), and every set \(x\) has a well-defined <em>rank</em> in the cumulative hierarchy.
</div>

In ordinary mathematics, Regularity is often used implicitly: for instance, to show that \(\in\)-induction is valid on the universe.

---

# Chapter 7: Filters, Ultrafilters, and Boolean Algebras

Filters and ultrafilters are central to model theory, topology, and large cardinal theory. They provide the mechanism for the ultrapower construction of measurable cardinals and Cohen's forcing via Boolean-valued models.

## Filters

<div class="definition">
Let \(I\) be a non-empty set. A <strong>filter</strong> on \(I\) is a non-empty family \(\mathcal{F} \subseteq \mathcal{P}(I)\) such that:
<ol>
  <li>\(I \in \mathcal{F}\) and \(\emptyset \notin \mathcal{F}\),</li>
  <li>If \(A \in \mathcal{F}\) and \(A \subseteq B\), then \(B \in \mathcal{F}\) (upward closure),</li>
  <li>If \(A, B \in \mathcal{F}\), then \(A \cap B \in \mathcal{F}\) (finite intersection property).</li>
</ol>
A <strong>ultrafilter</strong> is a filter \(\mathcal{U}\) such that for every \(A \subseteq I\), either \(A \in \mathcal{U}\) or \(I \setminus A \in \mathcal{U}\).
</div>

<div class="definition">
A filter \(\mathcal{F}\) on \(I\) is <strong>\(\kappa\)-complete</strong> if it is closed under intersections of fewer than \(\kappa\) sets: for any family \(\{A_\alpha : \alpha < \lambda\} \subseteq \mathcal{F}\) with \(\lambda < \kappa\), we have \(\bigcap_\alpha A_\alpha \in \mathcal{F}\).
</div>

<div class="example">
The <strong>Fréchet filter</strong> on \(\omega\) is \(\mathcal{F} = \{A \subseteq \omega : \omega \setminus A \text{ is finite}\}\) (the cofinite filter). It is \(\aleph_0\)-complete but not \(\aleph_1\)-complete.
</div>

## Ultrafilters and the Ultrapower

<div class="theorem">
(AC) Every filter can be extended to an ultrafilter. In particular, every set carries a non-principal ultrafilter.
</div>

<div class="definition">
Given a structure \(M\) and an ultrafilter \(\mathcal{U}\) on a set \(I\), the <strong>ultrapower</strong> \(M^I/\mathcal{U}\) consists of equivalence classes of functions \(f: I \to M\) under \(f \sim g \iff \{i \in I : f(i) = g(i)\} \in \mathcal{U}\), with operations defined pointwise.
</div>

<div class="theorem">
<strong>Łoś's Theorem.</strong> Let \(M\) be a first-order structure and \(\mathcal{U}\) an ultrafilter on \(I\). For any first-order formula \(\varphi(x_1,\ldots,x_n)\) and functions \(f_1, \ldots, f_n: I \to M\):
\[ M^I/\mathcal{U} \models \varphi([f_1],\ldots,[f_n]) \iff \{i \in I : M \models \varphi(f_1(i),\ldots,f_n(i))\} \in \mathcal{U}. \]
</div>

This theorem is fundamental: the ultrapower satisfies the same first-order sentences as \(M\), and is used to construct elementary extensions and measurable cardinals.

## Boolean Algebras

<div class="definition">
A <strong>Boolean algebra</strong> is a set \(B\) with operations \(\land, \lor, \lnot\) and constants \(0, 1\) satisfying the usual Boolean laws. A <strong>complete Boolean algebra</strong> is one where every subset has a supremum and infimum.
</div>

Complete Boolean algebras provide the algebraic foundation for forcing: a generic filter over a complete Boolean algebra \(\mathbb{B}\) gives rise to a generic extension \(V^\mathbb{B}\).

---

# Chapter 8: Stationary Sets

Stationary sets form one of the most powerful tools in combinatorial set theory. They arise naturally in the analysis of uncountable cardinals and feature prominently in results about cardinal arithmetic, partition relations, and inner models.

## Club Sets

<div class="definition">
Let \(\kappa\) be an uncountable regular cardinal and \(C \subseteq \kappa\). We say \(C\) is <strong>closed unbounded</strong> (or a <strong>club</strong>) in \(\kappa\) if:
<ul>
  <li><strong>Unbounded:</strong> \(\sup C = \kappa\) (i.e., for every \(\alpha < \kappa\) there exists \(\gamma \in C\) with \(\gamma > \alpha\)),</li>
  <li><strong>Closed:</strong> For every limit ordinal \(\alpha < \kappa\), if \(C \cap \alpha\) is unbounded in \(\alpha\), then \(\alpha \in C\).</li>
</ul>
</div>

<div class="example">
<ul>
  <li>The set of all limit ordinals below \(\omega_1\) is a club in \(\omega_1\).</li>
  <li>For any increasing function \(f: \omega_1 \to \omega_1\), the set of fixed points \(\{\alpha < \omega_1 : f(\alpha) = \alpha\}\) is a club.</li>
  <li>The intersection of two clubs is again a club.</li>
</ul>
</div>

<div class="theorem">
The collection of all clubs in \(\kappa\) is closed under intersections: if \(C_1, C_2\) are clubs, so is \(C_1 \cap C_2\). More generally, the intersection of fewer than \(\kappa\) clubs is a club.
</div>

<div class="proof">
Let \(C_1, C_2\) be clubs. Their intersection \(C_1 \cap C_2\) is unbounded: given \(\alpha_0 < \kappa\), alternately pick elements of \(C_1\) and \(C_2\) above each other, forming a sequence \(\alpha_0 < \beta_0 < \alpha_1 < \beta_1 < \cdots\) with \(\beta_n \in C_1\) and \(\alpha_{n+1} \in C_2\). Their common limit \(\gamma = \sup_n \alpha_n = \sup_n \beta_n\) lies in both \(C_1\) and \(C_2\). For more than 2 clubs of size \(< \kappa\), use the diagonalization argument.
</div>

### The Club Filter

<div class="definition">
The <strong>club filter</strong> on a regular uncountable cardinal \(\kappa\) is the filter \(\mathcal{F}_\kappa\) generated by all club subsets of \(\kappa\):
\[ \mathcal{F}_\kappa = \{A \subseteq \kappa : C \subseteq A \text{ for some club } C \subseteq \kappa\}. \]
</div>

<div class="theorem">
The club filter \(\mathcal{F}_\kappa\) is \(\kappa\)-complete (closed under intersections of fewer than \(\kappa\) sets) but is not an ultrafilter (it is not a prime filter).
</div>

## Stationary Sets

<div class="definition">
A set \(S \subseteq \kappa\) is <strong>stationary</strong> if it intersects every club: for every club \(C \subseteq \kappa\), \(S \cap C \neq \emptyset\). Equivalently, \(S\) is stationary iff \(S \notin \mathcal{I}_\kappa\) where \(\mathcal{I}_\kappa = \{A \subseteq \kappa : \kappa \setminus A \in \mathcal{F}_\kappa\}\) is the non-stationary ideal.
</div>

<div class="example">
<ul>
  <li>Every club is stationary.</li>
  <li>The set \(\{\alpha < \omega_1 : \alpha \text{ is a successor ordinal}\}\) is stationary in \(\omega_1\).</li>
  <li>The set \(\{\alpha < \omega_1 : \mathrm{cf}(\alpha) = \omega\}\) is a club (it is all limit ordinals \(< \omega_1\), since all limit ordinals \(< \omega_1\) have cofinality \(\omega\)).</li>
  <li>For a regular cardinal \(\kappa > \omega_1\), the set \(E^\kappa_\omega = \{\alpha < \kappa : \mathrm{cf}(\alpha) = \omega\}\) is stationary in \(\kappa\) but contains no club.</li>
</ul>
</div>

## The Pressing-Down (Fodor) Lemma

<div class="theorem">
<strong>Pressing-Down Lemma (Fodor's Lemma).</strong> Let \(\kappa\) be an uncountable regular cardinal. If \(S \subseteq \kappa\) is stationary and \(f: S \to \kappa\) is a <em>regressive</em> function (i.e., \(f(\alpha) < \alpha\) for all \(\alpha \in S\), \(\alpha > 0\)), then there exists \(\gamma < \kappa\) such that \(f^{-1}(\gamma) = \{\alpha \in S : f(\alpha) = \gamma\}\) is stationary.
</strong>
</div>

<div class="proof">
Suppose for contradiction that for every \(\gamma < \kappa\), the set \(f^{-1}(\gamma)\) is non-stationary. Then for each \(\gamma < \kappa\), there is a club \(C_\gamma \subseteq \kappa \setminus f^{-1}(\gamma)\). Let \(C = \bigcap_{\gamma < \kappa} C_\gamma\). Since \(\kappa\) is regular, this intersection of \(\kappa\)-many clubs is itself a club (note: for \(\omega_1\) this is an \(\omega_1\)-intersection; we need \(\kappa\)-completeness of the club filter). Now pick \(\alpha \in S \cap C\) (non-empty since \(S\) is stationary). Let \(\gamma = f(\alpha) < \alpha\). Then \(\alpha \in C \subseteq C_\gamma \subseteq \kappa \setminus f^{-1}(\gamma)\), so \(f(\alpha) \neq \gamma\), a contradiction.

More carefully, we handle the \(\kappa = \omega_1\) case by induction: assume all fibers are non-stationary. Then for each \(\gamma < \kappa\), pick a club \(C_\gamma\) disjoint from \(f^{-1}(\gamma)\). By transfinite induction, build a "diagonal intersection": the set \(\Delta_{\gamma < \kappa} C_\gamma = \{\alpha < \kappa : \alpha \in C_\gamma \text{ for all } \gamma < \alpha\}\) is a club. Any \(\alpha\) in \(S \cap \Delta C_\gamma\) satisfies \(\alpha \in C_{f(\alpha)}\) (since \(f(\alpha) < \alpha\)), but \(C_{f(\alpha)} \cap f^{-1}(f(\alpha)) = \emptyset\), meaning \(\alpha \notin f^{-1}(f(\alpha))\), i.e., \(f(\alpha) \neq f(\alpha)\), contradiction.
</div>

<div class="remark">
Fodor's Lemma has numerous applications:
<ul>
  <li>It implies the <strong>Silver Dichotomy</strong>: any stationary subset of \(\omega_1\) either contains a club or is partitioned into \(\omega_1\) disjoint stationary sets.</li>
  <li>It is used to prove that the club filter on \(\omega_1\) is normal.</li>
  <li>It underlies the proof of the <strong>Solovay Splitting Theorem</strong>: any stationary subset of \(\kappa\) can be split into \(\kappa\) disjoint stationary subsets.</li>
</ul>
</div>

## Normal Filters and Normality

<div class="definition">
A filter \(\mathcal{F}\) on \(\kappa\) is <strong>normal</strong> if it is \(\kappa\)-complete and closed under diagonal intersections: if \(A_\alpha \in \mathcal{F}\) for each \(\alpha < \kappa\), then
\[ \Delta_{\alpha < \kappa} A_\alpha = \{\xi < \kappa : \xi \in A_\alpha \text{ for all } \alpha < \xi\} \in \mathcal{F}. \]
</div>

<div class="theorem">
The club filter on \(\kappa\) is a normal, \(\kappa\)-complete filter.
</div>

---

# Chapter 9: Combinatorial Set Theory

Combinatorial set theory studies partition properties, trees, and combinatorial principles that hold (or consistently fail) at various uncountable cardinals.

## Ramsey Theory: Partition Calculus

<div class="definition">
The <strong>partition symbol</strong> \(\kappa \to (\lambda)^n_m\) means: for every coloring \(f: [\kappa]^n \to m\) (coloring \(n\)-element subsets of \(\kappa\) with \(m\) colors), there exists a <em>homogeneous</em> set \(H \subseteq \kappa\) of size \(\lambda\) (all \(n\)-element subsets of \(H\) have the same color).
</div>

<div class="theorem">
<strong>Ramsey's Theorem.</strong> \(\omega \to (\omega)^n_k\) for all finite \(n, k\). That is, any finite coloring of \(n\)-element subsets of \(\omega\) has an infinite homogeneous set.
</div>

<div class="theorem">
<strong>Erdős–Rado Theorem.</strong> \(\beth_n^+ \to (\aleph_1)^{n+1}_2\), where \(\beth_0 = \aleph_0\) and \(\beth_{n+1} = 2^{\beth_n}\). In particular, \((2^{\aleph_0})^+ \to (\aleph_1)^2_2\).
</div>

## Trees

<div class="definition">
A <strong>tree</strong> is a partially ordered set \((T, <_T)\) such that for each \(t \in T\), the set of predecessors \(\{s \in T : s <_T t\}\) is well-ordered by \(<_T\). The <strong>height</strong> of \(t\) is the order type of its predecessors. The \(\alpha\)-th <strong>level</strong> of \(T\) is \(T_\alpha = \{t \in T : \text{ht}(t) = \alpha\}\). A <strong>branch</strong> is a maximal linearly ordered subset of \(T\).
</div>

<div class="definition">
An <strong>Aronszajn tree</strong> is an \(\omega_1\)-tree (height \(\omega_1\), every level countable) with no uncountable branch. A <strong>Suslin tree</strong> is an \(\omega_1\)-tree with no uncountable antichain and no uncountable branch.
</div>

<div class="theorem">
<strong>König's Infinity Lemma.</strong> Every finitely branching infinite tree has an infinite branch.
</div>

<div class="theorem">
Aronszajn trees exist in ZFC. (An explicit construction uses a careful transfinite recursion to build an \(\omega_1\)-tree whose branches all terminate before reaching height \(\omega_1\).)
</div>

The existence of a Suslin tree is independent of ZFC: it follows from the **Diamond Principle** \(\Diamond\) (which holds in Gödel's \(L\)) but is refuted by **Martin's Axiom** plus \(\neg\)CH.

## The Diamond Principle

<div class="definition">
The <strong>Diamond Principle</strong> \(\Diamond = \Diamond(\omega_1)\) asserts: there exists a sequence \(\langle A_\alpha : \alpha < \omega_1 \rangle\) with \(A_\alpha \subseteq \alpha\) such that for every \(A \subseteq \omega_1\), the set \(\{\alpha < \omega_1 : A \cap \alpha = A_\alpha\}\) is stationary.
</div>

<div class="theorem">
\(\Diamond\) implies CH. \(\Diamond\) holds in \(L\) (Gödel's constructible universe). \(\Diamond\) implies the existence of a Suslin tree.
</div>

## Martin's Axiom

<div class="definition">
<strong>Martin's Axiom</strong> \(\mathsf{MA}(\kappa)\) states: for every ccc partial order \(\mathbb{P}\) and any family \(\mathcal{D}\) of \(\leq \kappa\) dense subsets of \(\mathbb{P}\), there exists a \(\mathcal{D}\)-generic filter. \(\mathsf{MA} = \mathsf{MA}(\aleph_1)\) is the strongest natural form, and \(\mathsf{MA}(\omega) = \mathsf{ZFC}\).
</div>

\(\mathsf{MA} + \neg\mathsf{CH}\) is consistent with ZFC (proved by Solovay and Tennenbaum). Under \(\mathsf{MA} + \neg\mathsf{CH}\), all Aronszajn trees are special (contain no Suslin subtree), and \(2^{\aleph_0}\) can be any regular cardinal.

---

# Chapter 10: Measurable Cardinals

Large cardinal axioms assert the existence of cardinals with strong combinatorial or model-theoretic properties. They form a natural hierarchy extending beyond ZFC and serve as consistency strength benchmarks.

## Measurable Cardinals via Ultrafilters

<div class="definition">
A cardinal \(\kappa\) is <strong>measurable</strong> if there exists a non-principal \(\kappa\)-complete ultrafilter on \(\kappa\). Equivalently, \(\kappa\) is measurable if there is a two-valued measure \(\mu: \mathcal{P}(\kappa) \to \{0,1\}\) that is \(\kappa\)-additive (additive for fewer than \(\kappa\) disjoint sets), assigns 0 to singletons, and assigns 1 to \(\kappa\).
</div>

<div class="remark">
The definition via measures is the historical origin: Ulam (1930) asked which cardinals admit a \(\sigma\)-additive probability measure on all subsets vanishing on singletons. The answer: such a cardinal, if it exists, must be a measurable cardinal in the above sense.
</div>

<div class="theorem">
Every measurable cardinal is inaccessible (hence much larger than anything provably existing in ZFC).
</div>

<div class="proof">
Let \(\kappa\) be measurable with witnessing ultrafilter \(\mathcal{U}\). Suppose \(\kappa = \lambda^+\) for some cardinal \(\lambda < \kappa\). Write \(\kappa = \bigcup_{\alpha < \lambda} A_\alpha\) as a union of \(\lambda < \kappa\) sets each of size \(\lambda\). Since \(\mathcal{U}\) is \(\kappa\)-complete, it is also \(\lambda^+\)-complete; taking the \(\lambda\)-fold intersection of complements, we get a contradiction. For strong limit: if \(2^\lambda < \kappa\) for all \(\lambda < \kappa$, this follows from the fact that every set of size \(< \kappa\) is measure 0.
</div>

## The Ultrapower Construction and Scott's Theorem

Given a measurable cardinal \(\kappa\) with a \(\kappa\)-complete ultrafilter \(\mathcal{U}\), we form the ultrapower \(\text{Ult}(V, \mathcal{U})\):

<div class="definition">
The <strong>ultrapower of the universe</strong> \(\text{Ult}(V, \mathcal{U})\) consists of equivalence classes of functions \(f: \kappa \to V\) under \(f \sim g \iff \{\alpha < \kappa : f(\alpha) = g(\alpha)\} \in \mathcal{U}\). By Łoś's Theorem, \(\text{Ult}(V, \mathcal{U})\) is an elementary extension of \(V\) (modulo the necessary modifications for proper class models).
</div>

The **canonical embedding** \(j: V \to \text{Ult}(V,\mathcal{U})\) defined by \(j(x) = [c_x]_\mathcal{U}\) (constant function) is an elementary embedding. This embedding is non-trivial: \(j(\kappa) > \kappa\). The least ordinal moved by \(j\) is the **critical point** of \(j\), which equals \(\kappa\).

<div class="theorem">
<strong>Scott's Theorem (1961).</strong> If there exists a measurable cardinal, then \(V \neq L\). That is, the constructible universe does not contain all sets if a measurable cardinal exists.
</div>

<div class="proof">
Let \(\kappa\) be measurable with ultrafilter \(\mathcal{U}\) and let \(j: V \to M = \text{Ult}(V,\mathcal{U})\) be the ultrapower embedding. The key is that \(j\) is non-trivial and \(\kappa\)-complete implies \(j\) moves no ordinal below \(\kappa\). By a result in the theory of \(L\), if \(V = L\) then \(j\) would restrict to an embedding of \(L\) into itself, but Kunen showed this leads to a contradiction with the existence of a non-trivial measurable cardinal in \(L\). More precisely: Gödel showed \(L\) satisfies GCH; in particular, there exists in \(L\) a well-ordering of \(\mathcal{P}(\kappa)\) of order type \(\kappa^+\). But in the presence of a measurable cardinal, one can show that \(\mathcal{P}(\kappa)\) in \(V\) is not constructible, i.e., \(\mathcal{P}(\kappa)^V \neq \mathcal{P}(\kappa)^L\) (since a normal measure on \(\kappa\) is not in \(L\)).
</div>

## 0-Sharp (\(0^\#\))

Scott's theorem initiates a fundamental dichotomy: either \(V = L\) (no large cardinals of measurable strength) or \(V \neq L\) (large cardinals exist). The canonical witness for \(V \neq L\) at the measurable cardinal level is **\(0^\#\)** (zero-sharp):

<div class="definition">
\(0^\#\) (zero-sharp) is, if it exists, the theory of the structure \((L, \in, \alpha)_{\alpha \in \text{On}}\) — i.e., a certain well-defined real number (or equivalently, a set of natural numbers) encoding indiscernibles for \(L\). Its existence is equivalent to: the existence of uncountably many Silver indiscernibles for \(L\).
</div>

<div class="theorem">
<strong>Jensen's Covering Theorem.</strong> If \(0^\#\) does not exist, then for every uncountable set \(X\) of ordinals, there exists \(Y \in L\) with \(X \subseteq Y\) and \(|Y| = |X|\). In other words, \(L\) "covers" \(V\).
</div>

---

# Chapter 11: Borel and Analytic Sets

Descriptive set theory studies the definability and structural properties of subsets of Polish spaces (complete separable metric spaces), chief among them \(\mathbb{R}\) and \(\omega^\omega\) (Baire space).

## The Borel Hierarchy

<div class="definition">
The <strong>Borel sets</strong> of a topological space \(X\) are the sets in the smallest \(\sigma\)-algebra containing the open sets. They are stratified into the Borel hierarchy:
<ul>
  <li>\(\mathbf{\Sigma}^0_1\) = open sets</li>
  <li>\(\mathbf{\Pi}^0_1\) = closed sets</li>
  <li>\(\mathbf{\Sigma}^0_{\alpha+1}\) = countable unions of \(\mathbf{\Pi}^0_\alpha\) sets</li>
  <li>\(\mathbf{\Pi}^0_{\alpha+1}\) = complements of \(\mathbf{\Sigma}^0_{\alpha+1}\) sets</li>
  <li>\(\mathbf{\Delta}^0_\alpha = \mathbf{\Sigma}^0_\alpha \cap \mathbf{\Pi}^0_\alpha\)</li>
</ul>
The Borel hierarchy has height \(\omega_1\).
</div>

## Analytic and Coanalytic Sets

<div class="definition">
A subset \(A\) of a Polish space \(X\) is <strong>analytic</strong> (\(\mathbf{\Sigma}^1_1\)) if it is the continuous image of a Borel subset of another Polish space. Equivalently, \(A\) is a projection of a closed set in \(X \times \omega^\omega\). The complement of an analytic set is <strong>coanalytic</strong> (\(\mathbf{\Pi}^1_1\)).
</div>

<div class="theorem">
<strong>Suslin's Theorem.</strong> A subset of a Polish space is Borel if and only if it is both analytic and coanalytic.
</div>

<div class="theorem">
<strong>Lusin Separation Theorem.</strong> If \(A\) and \(B\) are disjoint analytic sets in a Polish space, then there is a Borel set \(C\) with \(A \subseteq C\) and \(B \cap C = \emptyset\).
</div>

## The Perfect Set Property and the Cantor–Bendixson Theorem

<div class="definition">
A set \(A \subseteq \mathbb{R}\) has the <strong>perfect set property</strong> if it is either countable or contains a perfect subset (a non-empty closed set with no isolated points). Perfect sets have cardinality \(\mathfrak{c}\).
</div>

<div class="theorem">
<strong>Cantor–Bendixson.</strong> Every closed set \(F \subseteq \mathbb{R}\) is a union \(F = P \cup C\) where \(P\) is perfect (possibly empty) and \(C\) is countable.
</div>

<div class="theorem">
Every analytic set has the perfect set property. In particular, every uncountable analytic set contains a perfect subset, hence has cardinality \(2^{\aleph_0}\).
</div>

<div class="remark">
The perfect set property for analytic sets, together with the Baire property and Lebesgue measurability, are the three "regularity properties" that analytic sets all enjoy. The Projective Hierarchy extends beyond analytic sets:
<ul>
  <li>\(\mathbf{\Sigma}^1_2\) (projections of coanalytic) = PCA sets</li>
  <li>\(\mathbf{\Pi}^1_2\) = CPCA sets</li>
</ul>
Whether higher projective sets enjoy regularity properties depends on large cardinal axioms (e.g., projective determinacy).
</div>

---

# Chapter 12: Models of Set Theory

To understand the independence of CH and other statements, we must understand what it means for a set or class to be a model of ZFC, and how to build new models from existing ones.

## Structures and Satisfaction

<div class="definition">
A <strong>model</strong> of ZFC is a pair \((M, E)\) where \(M\) is a class (or set) and \(E \subseteq M \times M\) is a binary relation satisfying all the ZFC axioms when the quantifiers are restricted to \(M\) and \(\in\) is interpreted by \(E\). We write \(M \models \varphi\) for "\(\varphi\) is true in \(M\)."
</div>

<div class="definition">
A model \((M, E)\) is <strong>well-founded</strong> if \(E\) is well-founded. By the <strong>Mostowski Collapse Lemma</strong>, every well-founded extensional structure is isomorphic to a unique transitive structure \((\bar{M}, \in)\) called its <strong>transitive collapse</strong>.
</div>

## Relativization and Absoluteness

<div class="definition">
For a formula \(\varphi\) and a class \(M\), the <strong>relativization</strong> \(\varphi^M\) is obtained by restricting all quantifiers to \(M\). A formula \(\varphi\) is <strong>absolute</strong> for a class \(M\) (or between \(M\) and \(V\)) if \(\varphi^M \leftrightarrow \varphi\).
</div>

<div class="definition">
A formula is \(\Delta_0\) if all quantifiers are bounded (\(\forall x \in y\) and \(\exists x \in y\)). All \(\Delta_0\) formulas are absolute for transitive models. \(\Sigma_1\) formulas are upward absolute (if true in \(M\) they are true in any extension), while \(\Pi_1\) formulas are downward absolute.
</div>

## Elementary Substructures and the Löwenheim–Skolem Theorem

<div class="definition">
\(M\) is an <strong>elementary substructure</strong> of \(N\) (written \(M \prec N\)) if \(M \subseteq N\) and for every formula \(\varphi(\vec{x})\) and \(\vec{a} \in M\): \(M \models \varphi(\vec{a}) \iff N \models \varphi(\vec{a})\).
</div>

<div class="theorem">
<strong>Downward Löwenheim–Skolem–Tarski.</strong> Let \((M, \in)\) be a model of ZFC and \(A \subseteq M\) with \(|A| \leq \kappa\). Then there is an elementary substructure \(N \prec M\) with \(A \subseteq N\) and \(|N| = \kappa\).
</div>

### Reflection Principle

The Reflection Principle is a fundamental metatheorem of ZFC, showing that any finite list of axioms is "reflected" down to a set-sized structure within \(V\).

<div class="theorem">
<strong>Reflection Principle.</strong> For any formula \(\varphi(x_1, \ldots, x_n)\) and any ordinal \(\alpha\), there exists an ordinal \(\beta > \alpha\) such that for all \(a_1, \ldots, a_n \in V_\beta\):
\[ V \models \varphi(a_1, \ldots, a_n) \iff V_\beta \models \varphi(a_1, \ldots, a_n). \]
</div>

<div class="proof">
The proof proceeds by induction on the complexity of \(\varphi\). The key case is the existential quantifier: if \(\varphi = \exists x \, \psi(x, \vec{a})\) and \(V \models \exists x \, \psi(x, \vec{a})\), then pick a witness \(b\). By induction there is a \(\beta\) large enough that the witness \(b\) and all witnesses for subformulas land in \(V_\beta\). A rank argument using the replacement axiom ensures we can find a single \(\beta\) that works simultaneously for all \(a_1, \ldots, a_n \in V_\beta\).
</div>

<div class="remark">
The Reflection Principle has several consequences:
<ul>
  <li>ZFC cannot prove its own consistency (Gödel's incompleteness), but ZFC does prove each finite fragment of ZFC is consistent (by reflecting to a \(V_\beta\)).</li>
  <li>It implies that \(\mathbf{Ord}\) is "indescribable" from below: any property true of \(V\) is true of some \(V_\alpha\).</li>
  <li>It provides an internal justification for inaccessible cardinals: the reflection of "all of ZFC" to a \(V_\kappa\) gives a \(\kappa\) that looks like a strong inaccessible.</li>
</ul>
</div>

---

# Chapter 13: Constructible Sets (L)

Gödel's constructible universe \(L\) is the smallest inner model of ZFC. Working in \(L\) allows proofs of the consistency of GCH and AC relative to ZF.

## Definition of the Constructible Universe

<div class="definition">
The <strong>definable power set</strong> of a set \(M\) is:
\[ \mathrm{Def}(M) = \{A \subseteq M : A = \{x \in M : M \models \varphi(x, a_1, \ldots, a_n)\} \text{ for some formula } \varphi \text{ and parameters } a_1, \ldots, a_n \in M\}. \]
The <strong>constructible hierarchy</strong> \(L\) is defined by:
<ul>
  <li>\(L_0 = \emptyset\)</li>
  <li>\(L_{\alpha+1} = \mathrm{Def}(L_\alpha)\)</li>
  <li>\(L_\lambda = \bigcup_{\alpha < \lambda} L_\alpha\) for limit ordinals \(\lambda\)</li>
</ul>
The <strong>constructible universe</strong> is \(L = \bigcup_{\alpha \in \mathbf{Ord}} L_\alpha\).
</div>

<div class="remark">
Each \(L_\alpha\) is a transitive set and \(L_\alpha \subseteq V_\alpha\). The key difference from the cumulative hierarchy is that \(L_{\alpha+1}\) adds only the sets <em>definable</em> over \(L_\alpha\), not all subsets.
</div>

## Properties of L

<div class="theorem">
\((L, \in)\) is a model of ZFC. Moreover, \(L\) is an <strong>inner model</strong>: \(L\) is a transitive proper class containing all ordinals.
</div>

<div class="theorem">
<strong>Condensation Lemma.</strong> If \(M \prec (L_\alpha, \in)\) for some ordinal \(\alpha\), then the Mostowski collapse of \(M\) is \(L_\beta\) for some \(\beta \leq \alpha\).
</div>

The Condensation Lemma is the key to proving GCH in \(L\):

<div class="theorem">
<strong>Gödel's Theorem.</strong> \(L \models \mathsf{GCH}\). That is, in \(L\), for every infinite cardinal \(\kappa\), \(2^\kappa = \kappa^+\).
</div>

<div class="proof">
(Sketch) We show \(L \models 2^{\aleph_\alpha} = \aleph_{\alpha+1}\). Every subset of \(\aleph_\alpha\) in \(L\) is an element of some \(L_\beta\) with \(\beta < \aleph_{\alpha+1}\) (by the Condensation Lemma: any \(M \prec L_\beta\) of size \(\aleph_\alpha\) collapses to an \(L_\gamma\) with \(\gamma \leq \aleph_{\alpha+1}\)). Each \(L_\beta\) for \(\beta < \aleph_{\alpha+1}\) has \(|L_\beta| \leq \aleph_\alpha\) (by an inductive calculation). So \(|\mathcal{P}(\aleph_\alpha)^L| \leq |\aleph_{\alpha+1}| \cdot \aleph_\alpha = \aleph_{\alpha+1}\). Since \(\mathcal{P}(\aleph_\alpha)\) in \(L\) has size at least \(\aleph_{\alpha+1}\) (by Cantor's theorem), we get equality.
</div>

<div class="theorem">
\(L \models \mathsf{AC}\). Specifically, in \(L\), every set has a canonical well-ordering definable in \(L\) (the canonical well-ordering of \(L\) orders elements of \(L_{\alpha+1} \setminus L_\alpha\) by the Gödel pairing of their defining formulas and parameters).
</div>

## Ordinal Definable Sets (OD) and HOD

Beyond \(L\), there are other important inner models defined by definability conditions.

<div class="definition">
A set \(x\) is <strong>ordinal definable</strong> (written \(x \in \mathbf{OD}\)) if there exist a formula \(\varphi\) and ordinals \(\alpha_1, \ldots, \alpha_n\) such that \(x = \{y : V \models \varphi(y, \alpha_1, \ldots, \alpha_n)\}\). The class \(\mathbf{OD}\) of all ordinal-definable sets is a definable class.
</div>

<div class="definition">
The class \(\mathbf{HOD}\) (hereditarily ordinal definable sets) consists of all sets \(x\) such that every element of the transitive closure of \(x\) is ordinal definable:
\[ \mathbf{HOD} = \{x \in \mathbf{OD} : \mathrm{tc}(\{x\}) \subseteq \mathbf{OD}\}. \]
</div>

<div class="theorem">
\(\mathbf{HOD}\) is an inner model of ZFC. It satisfies the Axiom of Choice (since OD sets can be canonically well-ordered using their defining formulas and ordinal parameters). Moreover, \(L \subseteq \mathbf{HOD} \subseteq V\).
</div>

<div class="theorem">
\(\mathbf{HOD}\) is a model of ZF. Furthermore, \(\mathbf{HOD} \models \mathsf{AC}\).
</div>

<div class="proof">
The key point for AC in HOD is that every set in HOD has an ordinal-definable well-ordering: enumerate the defining formulas and parameters by ordinals, and order elements of an HOD set \(x\) by the least ordinal pair \((\varphi, \vec{\alpha})\) that defines them.
</div>

<div class="remark">
The relationship between HOD and the universe \(V\) is subtle. It is consistent that \(\mathbf{HOD} = L\), \(\mathbf{HOD} = V\), or \(\mathbf{HOD}\) is strictly between \(L\) and \(V\). Under large cardinal axioms (projective determinacy), HOD has a rich structure.
</div>

## Jensen's Fine Structure Theory

Jensen developed a systematic "fine structure" analysis of \(L\), introducing the Jense hierarchy \(J_\alpha\) (a variant of \(L_\alpha\)) and the **\(\Sigma_n\) projecta** and **master codes**. This machinery yields the combinatorial principles:

- **\(\Diamond(\kappa)\)**: There exists a \(\Diamond\)-sequence at \(\kappa\) (holds for all regular uncountable \(\kappa\) in \(L\)).
- **\(\square_\kappa\)**: There exists a coherent sequence of clubs (a global square). Also holds in \(L\).

These principles have major consequences: \(\Diamond \Rightarrow\) Suslin tree exists; \(\square_\kappa\) has implications for cardinal arithmetic and the structure of singular cardinals.

---

# Chapter 14: Forcing and the Independence of CH

Forcing, invented by Paul Cohen in 1963, is the technique for proving that mathematical statements are unprovable from ZFC. It works by constructing new models of set theory — "generic extensions" — by adjoining new sets to an existing model.

## The Basic Setup

Let \(M\) be a countable transitive model of ZFC (a **ground model**). A **partial order** (or **forcing notion**) is a set \(\mathbb{P} = (P, \leq)\) with a maximum element \(\mathbf{1}\). Elements of \(\mathbb{P}\) are **conditions**; we think of stronger conditions as providing more information.

<div class="definition">
Two conditions \(p, q \in \mathbb{P}\) are <strong>compatible</strong> if there exists \(r \leq p, q$; otherwise they are <strong>incompatible</strong> (written \(p \perp q\)). An <strong>antichain</strong> is a set of pairwise incompatible conditions. \(\mathbb{P}\) satisfies the <strong>countable chain condition (ccc)</strong> if every antichain is countable.
</div>

<div class="definition">
A set \(D \subseteq \mathbb{P}\) is <strong>dense</strong> if for every \(p \in \mathbb{P}\) there exists \(q \leq p\) with \(q \in D\). A filter \(G \subseteq \mathbb{P}\) is <strong>\(M\)-generic</strong> (or simply <strong>generic</strong>) if it meets every dense set that is an element of \(M\): for every \(D \in M\) that is dense in \(\mathbb{P}\), \(G \cap D \neq \emptyset\).
</div>

<div class="theorem">
<strong>Rasiowa–Sikorski Lemma.</strong> For any countable family \(\{D_n\}_{n \in \omega}\) of dense subsets of \(\mathbb{P}\) and any \(p \in \mathbb{P}\), there exists a filter \(G\) with \(p \in G\) meeting all \(D_n\).
</div>

Since \(M\) is countable, \(M\) contains only countably many dense sets, so a generic filter \(G \notin M\) always exists (the generic filter is chosen "outside" \(M\)).

## Names and the Generic Extension

<div class="definition">
A <strong>\(\mathbb{P}\)-name</strong> is a set \(\tau\) of pairs \((\sigma, p)\) where \(\sigma\) is a \(\mathbb{P}\)-name and \(p \in \mathbb{P}\), defined by \(\in\)-recursion. The <strong>generic extension</strong> \(M[G]\) is \(\{\tau_G : \tau \in M\}\) where the <strong>evaluation</strong> \(\tau_G\) is defined recursively: \(\tau_G = \{\sigma_G : \exists p \in G, (\sigma, p) \in \tau\}\).
</div>

<div class="theorem">
\(M[G]\) is a transitive model of ZFC. Moreover:
<ol>
  <li>\(M \subseteq M[G]\) and \(G \in M[G]\).</li>
  <li>\(M[G]\) has the same ordinals as \(M\).</li>
  <li>\(M[G]\) is the smallest transitive model of ZFC containing \(M\) and \(G\).</li>
</ol>
</div>

## The Forcing Relation

<div class="definition">
The <strong>forcing relation</strong> \(p \Vdash \varphi\) (read "\(p\) forces \(\varphi\)") is defined in \(M\) for conditions \(p \in \mathbb{P}\) and formulas \(\varphi\) with \(\mathbb{P}\)-names as parameters:
<ul>
  <li>\(p \Vdash \tau \in \sigma\) iff for some \((\rho, q) \in \sigma\) with \(p \leq q\), \(p \Vdash \tau = \rho\).</li>
  <li>\(p \Vdash \varphi \land \psi\) iff \(p \Vdash \varphi\) and \(p \Vdash \psi\).</li>
  <li>\(p \Vdash \lnot\varphi\) iff no extension \(q \leq p\) forces \(\varphi\).</li>
  <li>\(p \Vdash \exists x \, \varphi(x)\) iff for some name \(\tau\) and some \(q \leq p\), \(q \Vdash \varphi(\tau)\).</li>
</ul>
</div>

<div class="theorem">
<strong>Truth Lemma (Forcing Theorem).</strong> For any formula \(\varphi\) with \(\mathbb{P}\)-names as parameters and any \(M\)-generic \(G\):
\[ M[G] \models \varphi(\tau^G_1, \ldots, \tau^G_n) \iff \exists p \in G, \, p \Vdash \varphi(\tau_1, \ldots, \tau_n). \]
Moreover, the forcing relation \(\Vdash\) is definable in \(M\).
</div>

## Cohen Forcing and the Independence of CH

Cohen's original forcing adds \(\aleph_2\) (in \(M\)) many new subsets of \(\omega\), making \(2^{\aleph_0} \geq \aleph_2\) in the extension.

<div class="definition">
<strong>Cohen forcing</strong> \(\mathrm{Add}(\omega, \aleph_2)\) consists of all partial functions \(p: \aleph_2 \times \omega \to 2\) with finite domain, ordered by \(p \leq q\) iff \(p \supseteq q\) (i.e., \(p\) extends \(q\) as a function). The generic filter \(G\) determines a total function \(\bigcup G: \aleph_2 \times \omega \to 2\), i.e., a family of \(\aleph_2\) many subsets of \(\omega\).
</div>

<div class="theorem">
<strong>Cohen's Independence of CH (1963).</strong> If ZFC is consistent, then so is ZFC \(+ \lnot\mathsf{CH}\). In fact, ZFC \(+ 2^{\aleph_0} \geq \aleph_2\) is consistent.
</div>

<div class="proof">
(Sketch) Let \(M\) be a countable transitive model of ZFC + GCH. Let \(\mathbb{P} = \mathrm{Add}(\omega, \aleph_2^M)\). One verifies:

1. <strong>\(\mathbb{P}\) is ccc:</strong> Any antichain in \(\mathbb{P}\) is countable. (Two conditions sharing the same finite domain part are compatible.)

2. <strong>Cardinals are preserved:</strong> Since \(\mathbb{P}\) is ccc, all cardinals and cofinalities of \(M\) are preserved in \(M[G]\). In particular, \(\aleph_1^{M[G]} = \aleph_1^M\) and \(\aleph_2^{M[G]} = \aleph_2^M\).

3. <strong>\(2^{\aleph_0} \geq \aleph_2\) in \(M[G]\):</strong> For each \(\alpha < \aleph_2^M\), the generic adds a new real \(r_\alpha = \{n \in \omega : G(\alpha, n) = 1\}\). These are distinct reals (they differ on the dense set of conditions forcing distinctness). So \(|{\{r_\alpha : \alpha < \aleph_2^M\}}| = \aleph_2\) in \(M[G]\).

Therefore \(M[G] \models \lnot\mathsf{CH}\).
</div>

## Preserving Cardinals: ccc Forcing

<div class="theorem">
If \(\mathbb{P}\) is ccc, then for any \(M\)-generic \(G\), \(M[G]\) has the same cardinals and cofinalities as \(M\).
</div>

<div class="proof">
Suppose \(\kappa\) is a cardinal in \(M\). If \(\kappa\) were collapsed in \(M[G]\), there would be a surjection \(f: \lambda \to \kappa\) in \(M[G]\) for some \(\lambda < \kappa\). By the Forcing Theorem, some \(p\) forces this; by ccc, we can find a "name" for such a surjection using only countably many antichains, allowing us to reconstruct an injection in \(M\), contradicting \(\kappa\)'s cardinality in \(M\).
</div>

## Boolean-Valued Models

An alternative approach to forcing uses Boolean-valued models, which avoids the need for a countable ground model.

<div class="definition">
Let \(\mathbb{B}\) be a complete Boolean algebra. The <strong>Boolean-valued universe</strong> \(V^\mathbb{B}\) consists of all \(\mathbb{B}\)-valued sets (defined by \(\in\)-recursion analogously to \(\mathbb{P}\)-names). For each formula \(\varphi\), one defines a <strong>Boolean value</strong> \(\|\varphi\| \in \mathbb{B}\) such that the standard axioms of ZFC all have Boolean value \(\mathbf{1}_\mathbb{B}\).
</div>

<div class="theorem">
For any complete Boolean algebra \(\mathbb{B}\), \(V^\mathbb{B} \models \mathsf{ZFC}\) in the sense that all ZFC axioms have Boolean value \(\mathbf{1}\). Moreover, if \(G\) is a generic ultrafilter over \(\mathbb{B}\) then the quotient \(V^\mathbb{B}/G \cong M[G]\).
</div>

## Other Independence Results

Forcing is used to establish the independence of many statements:

- **Suslin's Hypothesis (SH)**: Consistent with ZFC (MA + ¬CH implies SH) and its negation is consistent (follows from \(\Diamond\), which holds in \(L\)).
- **Souslin's Problem**: The question whether every dense, complete linear order without endpoints satisfying ccc is isomorphic to \(\mathbb{R}\). Independent of ZFC.
- **Whitehead Problem**: Is every Whitehead group free? Shelah showed it is independent of ZFC.
- **The proper forcing axiom (PFA)**: A strong strengthening of MA, consistent relative to a supercompact cardinal.

---

# Chapter 17: Large Cardinals

Large cardinal axioms assert the existence of cardinals with properties so strong that their existence cannot be proved (or even shown consistent) in ZFC alone. They form a natural well-ordered hierarchy of consistency strength, calibrating the "strength" of mathematical theories.

## Inaccessible Cardinals

<div class="definition">
An uncountable cardinal \(\kappa\) is <strong>strongly inaccessible</strong> if:
<ol>
  <li>\(\kappa\) is regular: \(\mathrm{cf}(\kappa) = \kappa\),</li>
  <li>\(\kappa\) is a strong limit: for all \(\lambda < \kappa\), \(2^\lambda < \kappa\).</li>
</ol>
A cardinal is <strong>weakly inaccessible</strong> if it is regular and a weak limit (i.e., \(\lambda < \kappa \Rightarrow \lambda^+ < \kappa\), i.e., no predecessor).
</div>

<div class="theorem">
If \(\kappa\) is strongly inaccessible, then \(V_\kappa \models \mathsf{ZFC}\). In particular, the existence of an inaccessible cardinal implies the consistency of ZFC, so by Gödel's incompleteness theorem, ZFC cannot prove the existence of an inaccessible cardinal.
</div>

<div class="proof">
\(V_\kappa\) is a transitive model of ZFC: regularity ensures replacement holds (images under class-functions don't exceed \(\kappa\)), and the strong limit property ensures power set is well-behaved. The axiom of infinity holds since \(\omega < \kappa\).
</div>

## Mahlo Cardinals

<div class="definition">
An inaccessible cardinal \(\kappa\) is a <strong>Mahlo cardinal</strong> if the set of inaccessible cardinals below \(\kappa\) is stationary in \(\kappa\).
</div>

<div class="theorem">
Every Mahlo cardinal \(\kappa\) has \(\kappa\) many inaccessible cardinals below it, and in fact \(V_\kappa \models \text{"there are proper class many inaccessibles."}\)
</div>

<div class="remark">
The Mahlo cardinals form a hierarchy within themselves: 0-Mahlo = inaccessible, 1-Mahlo = Mahlo, \(\alpha\)-Mahlo for each ordinal \(\alpha\), and hyper-Mahlo, etc. Each level is strictly stronger than the previous.
</div>

## Weakly Compact Cardinals

<div class="definition">
An uncountable cardinal \(\kappa\) is <strong>weakly compact</strong> if for every coloring \(f: [\kappa]^2 \to 2\) there is a homogeneous set of size \(\kappa\). Equivalently, \(\kappa \to (\kappa)^2_2\) in the partition calculus.
</div>

<div class="theorem">
The following are equivalent for an inaccessible cardinal \(\kappa\):
<ol>
  <li>\(\kappa\) is weakly compact.</li>
  <li>\(\kappa\) has the tree property: every \(\kappa\)-tree has a branch of length \(\kappa\).</li>
  <li>\(\kappa\) is \(\Pi^1_1\)-indescribable: for any \(R \subseteq V_\kappa\) and any \(\Pi^1_1\)-sentence \(\varphi\), if \((V_\kappa, \in, R) \models \varphi\), then there exists \(\alpha < \kappa\) with \((V_\alpha, \in, R \cap V_\alpha) \models \varphi\).</li>
  <li>There exists a \(\kappa\)-complete ultrafilter on each set of cardinality \(\kappa\) (the "extension property").</li>
</ol>
</div>

<div class="remark">
The "weakly compact" name comes from logic: a cardinal \(\kappa\) is weakly compact if and only if the infinitary logic \(L_{\kappa,\kappa}\) has the weak compactness property (any set of \(< \kappa\) sentences that is finitely satisfiable is satisfiable).
</div>

## Measurable Cardinals (Revisited)

<div class="theorem">
Every measurable cardinal is weakly compact, hence Mahlo, hence inaccessible. The hierarchy is:
\[ \text{inaccessible} \subset \text{Mahlo} \subset \text{weakly compact} \subset \text{measurable}. \]
</div>

<div class="theorem">
<strong>Ulam's Theorem.</strong> The least measurable cardinal (if it exists) is not the least weakly compact cardinal.
</div>

## Ramsey and Erdős Cardinals

<div class="definition">
A cardinal \(\kappa\) is an <strong>Erdős cardinal</strong> \(\eta(\alpha)\) if \(\kappa \to (\alpha)^{<\omega}_2\) (for every coloring of finite subsets of \(\kappa\) with 2 colors, there is a homogeneous set of order type \(\alpha\)). The cardinal \(\eta(\omega)\) is the least cardinal such that \(\eta(\omega) \to (\omega)^{<\omega}_2\).
</div>

<div class="theorem">
The existence of \(\eta(\omega_1)\) implies \(0^\#\) exists, hence \(V \neq L\).
</div>

## Supercompact Cardinals

<div class="definition">
A cardinal \(\kappa\) is <strong>\(\lambda\)-supercompact</strong> for \(\lambda \geq \kappa\) if there exists an elementary embedding \(j: V \to M\) with critical point \(\kappa\) such that \(j(\kappa) > \lambda\) and \(M^\lambda \subseteq M\) (all \(\lambda\)-sequences from \(M\) are in \(M\)). \(\kappa\) is <strong>supercompact</strong> if it is \(\lambda\)-supercompact for all \(\lambda \geq \kappa\).
</div>

<div class="theorem">
Supercompact cardinals are much stronger than measurable: every supercompact cardinal is a limit of measurable cardinals (and in fact of Woodin cardinals, weakly compact cardinals, etc.). Their existence implies, among other things, the consistency of PFA.
</div>

## Woodin Cardinals

<div class="definition">
An uncountable cardinal \(\delta\) is a <strong>Woodin cardinal</strong> if for every function \(f: \delta \to \delta\), there exists a cardinal \(\kappa < \delta\) that is closed under \(f\) and there is an elementary embedding \(j: V \to M\) with critical point \(\kappa\), \(j(f)(\kappa) = f(\kappa)\), and \(V_{j(f)(\kappa)} \subseteq M\).
</div>

<div class="theorem">
The existence of infinitely many Woodin cardinals implies the consistency of all \(\mathbf{\Sigma}^1_2\) statements that are consistent, and more: it implies <strong>Projective Determinacy (PD)</strong>, which asserts that all projective sets of reals are determined (every infinite two-player game on natural numbers where the winning condition is projective is determined).
</div>

## The Large Cardinal Hierarchy

The following schematic shows the hierarchy of large cardinals in increasing order of consistency strength:

| Level | Large Cardinal |
|-------|---------------|
| 1 | Inaccessible (\(V_\kappa \models \mathsf{ZFC}\)) |
| 2 | Mahlo (stationary many inaccessibles below) |
| 3 | Weakly Compact (\(\kappa \to (\kappa)^2_2\)) |
| 4 | Measurable (non-trivial \(\kappa\)-complete ultrafilter) |
| 5 | Strong (elementary embedding with critical point \(\kappa\)) |
| 6 | Woodin (for every function, many witnesses below \(\delta\)) |
| 7 | Supercompact (\(M^\lambda \subseteq M\)) |
| 8 | Extendible (\(V_{\kappa+\eta} \prec V_{j(\kappa)+\eta}\)) |
| 9 | Huge (\(M^{j(\kappa)} \subseteq M\)) |
| 10 | Rank-into-rank (\(j: V_\lambda \to V_\lambda\)) |

Each level is strictly stronger in consistency strength than all previous levels. At the top, Kunen showed (in ZFC) that there is no elementary embedding \(j: V \to V\) (Kunen's Inconsistency), placing an absolute upper bound on the large cardinal hierarchy.

## Determinacy and Inner Model Theory

<div class="theorem">
<strong>Projective Determinacy.</strong> Assume infinitely many Woodin cardinals. Then every projective set of reals is determined: for any projective set \(A \subseteq \omega^\omega\), the game \(G_A\) (where two players alternate playing natural numbers and player I wins iff the resulting sequence is in \(A\)) is determined (one player has a winning strategy).
</div>

<div class="theorem">
<strong>Martin–Steel Theorem.</strong> If there exist \(n\) Woodin cardinals with a measurable above them, then all \(\mathbf{\Sigma}^1_{n+1}\) games are determined.
</div>

The inner model program seeks to construct, for each large cardinal notion, a canonical model \(L[\vec{E}]\) (built from an extender sequence \(\vec{E}\)) that contains and in some sense "explains" that large cardinal. The program has been carried out through Woodin cardinals and is one of the central programs in contemporary set theory.

---

## Summary and Interconnections

The major themes of graduate set theory are deeply intertwined:

**Foundations and Axiomatics** (Chapters 1, 6): ZFC provides a rigorous but rich foundation. Regularity stratifies the universe into the cumulative hierarchy.

**Ordinals and Cardinals** (Chapters 2, 3): The backbone of transfinite mathematics. Ordinals measure order types; cardinals measure sizes. Cofinality and König's theorem govern cardinal arithmetic.

**Combinatorics** (Chapters 8, 9): Stationary sets, the club filter, Fodor's Lemma, and the Diamond and Square principles are the central tools of infinitary combinatorics. They interact with forcing (which can add or destroy stationary sets) and large cardinals (which impose reflection principles that limit combinatorial pathology).

**Descriptive Set Theory** (Chapters 4, 11): The structure of subsets of the reals is governed by the Borel hierarchy and the projective hierarchy. Definability interacts with large cardinals: under projective determinacy (a consequence of Woodin cardinals), all projective sets enjoy regularity properties.

**Inner Models** (Chapter 13): \(L\) is the canonical inner model. HOD is the definability-based inner model. The inner model program extends these to accommodate large cardinals.

**Forcing** (Chapter 14): Forcing constructs outer models, proving independence results. Cohen's forcing adds new reals, making \(\neg\)CH consistent. The interaction of forcing with stationary sets (preserving or collapsing them) and large cardinals is a central technical concern.

**Large Cardinals** (Chapters 10, 17): They calibrate consistency strength and impose structure on \(V\). They imply \(V \neq L\) and yield regularity properties for definable sets of reals. The large cardinal hierarchy is linearly ordered by consistency strength, a deep empirical fact about mathematics.

The independence results of Gödel (GCH consistent) and Cohen (CH independent), together with the large cardinal program, show that ZFC is both a powerful and genuinely incomplete foundation for mathematics — a theme that continues to drive research in set theory.

---

## Appendix: Key Formulas and Results Reference

| Result | Statement |
|--------|-----------|
| Cantor's Theorem | \(\vert X \vert < \vert \mathcal{P}(X) \vert\) for any set \(X\) |
| Schröder–Bernstein | \(\vert A \vert \leq \vert B \vert\) and \(\vert B \vert \leq \vert A \vert\) implies \(\vert A \vert = \vert B \vert\) |
| König's Theorem | \(\sum_i \kappa_i < \prod_i \lambda_i\) when \(\kappa_i < \lambda_i\) |
| Fodor's Lemma | Regressive function on stationary set has stationary fiber |
| Łoś's Theorem | Ultrapower satisfies same first-order sentences |
| Condensation Lemma | Elementary substructures of \(L_\alpha\) collapse to some \(L_\beta\) |
| Reflection Principle | Every formula true in \(V\) reflects to some \(V_\alpha\) |
| Forcing Theorem | \(M[G] \models \varphi\) iff some \(p \in G\) forces \(\varphi\) |
| Scott's Theorem | Measurable cardinal implies \(V \neq L\) |
| GCH in L | \(L \models 2^{\aleph_\alpha} = \aleph_{\alpha+1}\) |

# Chapter 18: Forcing Axioms

Forcing axioms arise from a simple but powerful idea: rather than adding a single generic object to the universe, we want a principle that guarantees the existence of generic filters for *many* forcings simultaneously. They are thus "axioms of richness," asserting that the universe is in some sense saturated. The study of forcing axioms reveals deep connections between combinatorics, topology, and large cardinal strength.

## Section 18.1: Martin's Axiom

**Motivation.** Recall the Baire Category Theorem: if \(X\) is a compact Hausdorff space and \(\{D_n : n \in \omega\}\) is a countable family of dense open sets, then \(\bigcap_n D_n \neq \emptyset\). Martin's Axiom (MA) generalizes this from countably many dense sets to fewer than \(2^{\aleph_0}\) many, while restricting to a class of forcing notions called *ccc* (the countable chain condition).

<div class="definition">
<strong>Definition (Martin's Axiom).</strong> A partial order \(\mathbb{P}\) satisfies the <em>countable chain condition</em> (ccc) if every antichain in \(\mathbb{P}\) is countable. <strong>Martin's Axiom</strong> (\(\text{MA}\)) states: for every ccc partial order \(\mathbb{P}\) and every family \(\mathcal{D}\) of fewer than \(2^{\aleph_0}\) dense subsets of \(\mathbb{P}\), there exists a filter \(G \subseteq \mathbb{P}\) meeting every member of \(\mathcal{D}\).
</div>

Note that MA at \(\aleph_0\) (i.e., when \(|\mathcal{D}| \leq \aleph_0\)) is provable in ZFC — this is the content of the Rasiowa–Sikorski lemma. The axiom becomes interesting and independent when we demand this for families of size \(\aleph_1, \aleph_2, \ldots\) up to \(2^{\aleph_0}\). We write \(\text{MA}_\kappa\) for the statement restricted to \(|\mathcal{D}| \leq \kappa\); then MA is \(\text{MA}_{<2^{\aleph_0}}\).

<div class="theorem">
<strong>Theorem (Consequences of MA).</strong>
<ol>
<li>Under MA + ¬CH, every set of reals of cardinality less than \(2^{\aleph_0}\) has Lebesgue measure zero and is meager.</li>
<li>MA implies Suslin's Hypothesis: there is no Suslin line.</li>
<li>MA implies that any product of ccc topological spaces is ccc (a generalization of Knaster's lemma).</li>
<li>MA + ¬CH is consistent relative to ZFC.</li>
</ol>
</div>

<div class="proof">
<strong>Proof sketch of (4).</strong> Starting from a model of ZFC + GCH, one performs an iterated ccc forcing of length \(\aleph_2\) using finite support iteration. At each stage, one codes a ccc forcing to meet a given family of dense sets. The ccc is preserved at limit stages because the finite support iteration of ccc forcings is ccc. The resulting model satisfies \(2^{\aleph_0} = \aleph_2\) and MA. The consistency of ¬CH is then immediate since \(\aleph_2 > \aleph_1\).
</div>

<div class="remark">
<strong>Remark.</strong> MA alone does not fix the value of \(2^{\aleph_0}\); it is consistent with MA that \(2^{\aleph_0}\) is any regular cardinal above \(\aleph_1\). The axiom says nothing about the size of the continuum — only that it is not \(\aleph_1\) (since \(\text{MA}_{\aleph_1}\) contradicts CH).
</div>

## Section 18.2: The Proper Forcing Axiom

MA can be seen as a forcing axiom for ccc forcings. The natural question is: can we extend it to larger classes? The answer requires restricting to forcings that preserve stationary sets in a controlled way.

<div class="definition">
<strong>Definition (Proper forcing).</strong> A forcing \(\mathbb{P}\) is <em>proper</em> if for every uncountable regular cardinal \(\theta\), every countable elementary submodel \(M \prec H(\theta)\) with \(\mathbb{P} \in M\), and every \(p \in \mathbb{P} \cap M\), there exists a condition \(q \leq p\) that is <em>\((M, \mathbb{P})\)-generic</em>: for every dense \(D \in M\), the set \(D \cap M\) is predense below \(q\).
</div>

Every ccc forcing is proper, and so is every countably closed forcing. Proper forcings do not collapse \(\aleph_1\), making them the natural setting for extending MA.

<div class="definition">
<strong>Definition (PFA).</strong> The <em>Proper Forcing Axiom</em> (PFA) states: for every proper partial order \(\mathbb{P}\) and every family \(\mathcal{D}\) of at most \(\aleph_1\) dense subsets of \(\mathbb{P}\), there exists a filter \(G\) meeting every member of \(\mathcal{D}\).
</div>

<div class="theorem">
<strong>Theorem (Baumgartner).</strong> PFA implies that all \(\aleph_1\)-dense sets of reals are order-isomorphic. (A set \(X \subseteq \mathbb{R}\) is \(\aleph_1\)<em>-dense</em> if every open interval meets \(X\) in exactly \(\aleph_1\) points.)
</div>

<div class="theorem">
<strong>Theorem.</strong> PFA implies \(2^{\aleph_0} = \aleph_2\).
</div>

<div class="proof">
<strong>Proof sketch.</strong> Under PFA, one applies the axiom to a proper forcing that shoots an \(\omega_1\)-club through a stationary set. Combined with structural consequences about \(P_{\aleph_1}(\aleph_2)\) and the fact that PFA implies \(\aleph_2^{\aleph_0} = \aleph_2\), one deduces \(2^{\aleph_0} = \aleph_2\). The argument uses the fact that PFA settles the value of the continuum in a way MA does not.
</div>

PFA is consistent relative to the existence of a supercompact cardinal, via an iteration due to Baumgartner.

## Section 18.3: Martin's Maximum

Martin's Maximum is the strongest possible forcing axiom in a precise sense.

<div class="definition">
<strong>Definition (MM).</strong> A forcing \(\mathbb{P}\) is <em>stationary-set-preserving</em> (SSP) if forcing with \(\mathbb{P}\) preserves every stationary subset of \(\omega_1\). <strong>Martin's Maximum</strong> (MM) states: for every SSP partial order \(\mathbb{P}\) and every family \(\mathcal{D}\) of at most \(\aleph_1\) dense subsets, there exists a filter meeting every member of \(\mathcal{D}\).
</div>

Every proper forcing is SSP, so MM implies PFA. Foreman, Magidor, and Shelah proved that MM is consistent relative to a supercompact cardinal (1988), and Woodin showed that a supercompact cardinal directly implies MM after a suitable forcing.

<div class="theorem">
<strong>Theorem (Woodin).</strong> If there exists a supercompact cardinal, then MM holds in a forcing extension.
</div>

<div class="theorem">
<strong>Theorem.</strong> MM implies \(2^{\aleph_0} = \aleph_2\).
</div>

MM is "maximal" in the sense that no forcing axiom for a strictly larger class of forcings is consistent: if \(\mathbb{P}\) does not preserve all stationary subsets of \(\omega_1\), then the forcing axiom for \(\{\mathbb{P}\}\) and \(\aleph_1\) many dense sets is already inconsistent.

## Section 18.4: Comparison Table

| Axiom | Class of forcings | Implies \(2^{\aleph_0} = \aleph_2\)? | Consistency strength |
|-------|------------------|--------------------------------------|---------------------|
| MA | ccc | No (any regular \(> \aleph_1\) possible) | ZFC |
| PFA | Proper | Yes | Supercompact cardinal |
| MM | Stationary-set-preserving | Yes | Supercompact cardinal |

<div class="remark">
<strong>Remark.</strong> Despite having the same consistency strength at the level of "supercompact cardinal," PFA and MM have different structural consequences. MM, being stronger, decides more combinatorial questions, including Shelah's \(\aleph_2\)-saturation of the nonstationary ideal on \(\omega_1\).
</div>

---

# Chapter 19: Determinacy and Descriptive Set Theory

Descriptive set theory studies definable sets of reals — those arising through explicit operations starting from open sets. The projective hierarchy organizes these sets by complexity, and the theory of games provides an unexpected tool for their analysis.

## Section 19.1: The Projective Hierarchy

<div class="definition">
<strong>Definition (Analytic and projective sets).</strong>
<ul>
<li>A set \(A \subseteq \mathbb{R}\) is <em>analytic</em> (\(\Sigma^1_1\)) if it is a continuous image of a Borel set (equivalently, a Borel image of \(\mathbb{N}^\mathbb{N}\)).</li>
<li>A set is <em>coanalytic</em> (\(\Pi^1_1\)) if its complement is analytic.</li>
<li>For \(n \geq 1\): \(\Sigma^1_{n+1}\) is the class of continuous images of \(\Pi^1_n\) sets; \(\Pi^1_{n+1}\) is the class of complements of \(\Sigma^1_{n+1}\) sets; \(\Delta^1_n = \Sigma^1_n \cap \Pi^1_n\).</li>
</ul>
The union \(\bigcup_n \Sigma^1_n\) is the class of <em>projective</em> sets.
</div>

<div class="theorem">
<strong>Theorem (Suslin).</strong> \(\Delta^1_1\) = the class of Borel sets.
</div>

This elegant characterization shows that Borel sets are precisely those that are both analytic and coanalytic. Every analytic set is Lebesgue measurable, has the Baire property, and has the perfect set property (Suslin, Luzin). The situation for \(\Sigma^1_2\) and beyond is undecidable in ZFC alone.

<div class="theorem">
<strong>Theorem (Luzin Separation).</strong> If \(A\) and \(B\) are disjoint analytic sets, then there exists a Borel set \(C\) with \(A \subseteq C\) and \(C \cap B = \emptyset\).
</div>

## Section 19.2: Games and Determinacy

<div class="definition">
<strong>Definition (Gale–Stewart Game).</strong> Given \(A \subseteq \omega^\omega\), the <em>Gale–Stewart game</em> \(G(A)\) is played as follows: Players I and II alternate choosing natural numbers \(x_0, x_1, x_2, \ldots\), producing an infinite sequence \(x = (x_0, x_1, \ldots) \in \omega^\omega\). Player I wins if \(x \in A\); Player II wins otherwise. A <em>strategy</em> for a player is a function from finite sequences to \(\omega\). A game is <em>determined</em> if one of the players has a winning strategy.
</div>

<div class="definition">
<strong>Definition (AD and Borel Determinacy).</strong> The <em>Axiom of Determinacy</em> (AD) states that every game \(G(A)\) for \(A \subseteq \omega^\omega\) is determined. <em>Borel Determinacy</em> (BD) is the restriction to Borel sets \(A\).
</div>

<div class="theorem">
<strong>Theorem (Martin, 1975).</strong> Every Borel game is determined. More precisely, if \(A \subseteq \omega^\omega\) is Borel, then \(G(A)\) is determined.
</div>

<div class="proof">
<strong>Proof idea.</strong> Martin uses a transfinite "unraveling" argument. For an open set, Player I wins by playing into the open set at the first opportunity, or Player II wins by avoiding it — this is easy. For a set \(A\) at Borel rank \(\alpha\), one constructs an auxiliary game whose payoff set is simpler and whose winning strategies correspond to those for \(G(A)\). This requires the full power set axiom and transfinite induction up to \(\omega_1\).
</div>

Borel Determinacy is provable in ZFC. The axiom AD, however, contradicts the Axiom of Choice.

## Section 19.3: Projective Determinacy

<div class="definition">
<strong>Definition (PD).</strong> <em>Projective Determinacy</em> (PD) states that \(G(A)\) is determined for every projective set \(A \subseteq \omega^\omega\).
</div>

While AD is inconsistent with AC (since AC implies the existence of a non-determined game), PD is consistent with ZFC.

<div class="theorem">
<strong>Theorem (Martin–Steel, 1989).</strong> If there exist infinitely many Woodin cardinals, then PD holds.
</div>

<div class="theorem">
<strong>Theorem (Consequences of PD).</strong> Assuming PD:
<ol>
<li>Every projective set is Lebesgue measurable.</li>
<li>Every projective set has the Baire property.</li>
<li>Every projective set has the perfect set property (hence is either countable or has cardinality \(2^{\aleph_0}\)).</li>
<li>The projective hierarchy does not collapse: \(\Sigma^1_n \neq \Pi^1_n\) for all \(n \geq 1\).</li>
</ol>
</div>

Thus, under PD, the projective sets behave as well as the Borel sets — they are measurable and structured. Without large cardinals, the behavior of \(\Sigma^1_2\) sets is already undecidable.

## Section 19.4: The Full Axiom of Determinacy

<div class="theorem">
<strong>Theorem (Consequences of AD).</strong> Assuming AD (in the context where AC fails):
<ol>
<li>Every set of reals is Lebesgue measurable and has the Baire property.</li>
<li>\(\aleph_1\) is a measurable cardinal.</li>
<li>AD implies DC (Dependent Choice) but not full AC.</li>
<li>The club filter on \(\omega_1\) is an ultrafilter.</li>
</ol>
</div>

<div class="remark">
<strong>Remark.</strong> AD is studied primarily in \(L(\mathbb{R})\), the smallest model of ZF containing all reals. Woodin proved that if there are infinitely many Woodin cardinals with a measurable above them all, then AD holds in \(L(\mathbb{R})\). This is the precise large-cardinal equivalence for AD: \(\text{AD}^{L(\mathbb{R})}\) is equiconsistent with the existence of infinitely many Woodin cardinals.
</div>

---

# Chapter 20: Cardinal Characteristics of the Continuum

## Section 20.1: Motivation

We know that \(2^{\aleph_0}\) can be many things — \(\aleph_1\), \(\aleph_2\), \(\aleph_{\omega_1}\), and so on. But beyond asking what \(2^{\aleph_0}\) equals, we can ask finer questions: how complex is the combinatorial structure of \(\mathbb{R}\)? Cardinal characteristics of the continuum are cardinal numbers, definable from the reals, that measure specific aspects of this complexity. Each lies between \(\aleph_1\) and \(2^{\aleph_0}\) inclusive, and they can be separated from each other by forcing.

## Section 20.2: Characteristics of Baire Space

We work in \(\omega^\omega\), ordered by eventual domination: \(f \leq^* g\) iff \(f(n) \leq g(n)\) for all but finitely many \(n\).

<div class="definition">
<strong>Definition.</strong>
<ul>
<li>The <em>bounding number</em> \(\mathfrak{b}\) is the smallest cardinality of a family \(\mathcal{F} \subseteq \omega^\omega\) that is <em>unbounded</em>: no single \(g \in \omega^\omega\) satisfies \(f \leq^* g\) for all \(f \in \mathcal{F}\).</li>
<li>The <em>dominating number</em> \(\mathfrak{d}\) is the smallest cardinality of a <em>dominating</em> family \(\mathcal{F}\): for every \(g \in \omega^\omega\), there exists \(f \in \mathcal{F}\) with \(g \leq^* f\).</li>
<li>The <em>splitting number</em> \(\mathfrak{s}\) is the smallest cardinality of a family \(\mathcal{S} \subseteq [\omega]^\omega\) such that for every \(A \in [\omega]^\omega\), some \(S \in \mathcal{S}\) splits \(A\): both \(A \cap S\) and \(A \setminus S\) are infinite.</li>
<li>The <em>reaping number</em> \(\mathfrak{r}\) is the smallest cardinality of a family \(\mathcal{R} \subseteq [\omega]^\omega\) such that no single \(A \in [\omega]^\omega\) splits every member of \(\mathcal{R}\).</li>
</ul>
</div>

One can show \(\aleph_1 \leq \mathfrak{b} \leq \mathfrak{d} \leq 2^{\aleph_0}\) and \(\mathfrak{b} \leq \mathfrak{s}\) in ZFC.

<div class="definition">
<strong>Definition (\(\mathfrak{p}\) and \(\mathfrak{t}\)).</strong>
<ul>
<li>A family \(\mathcal{F} \subseteq [\omega]^\omega\) has the <em>strong finite intersection property</em> (sfip) if every finite subfamily has infinite intersection.</li>
<li>A <em>pseudo-intersection</em> of \(\mathcal{F}\) is an \(A \in [\omega]^\omega\) with \(A \subseteq^* F\) for all \(F \in \mathcal{F}\).</li>
<li>\(\mathfrak{p}\) is the smallest cardinality of a family with sfip but no pseudo-intersection.</li>
<li>A <em>tower</em> is a \(\subseteq^*\)-decreasing sequence in \([\omega]^\omega\) with no pseudo-intersection. \(\mathfrak{t}\) is the smallest length of a tower.</li>
</ul>
</div>

<div class="theorem">
<strong>Theorem.</strong> \(\aleph_1 \leq \mathfrak{p} \leq \mathfrak{t} \leq \mathfrak{b}\) in ZFC. Moreover (Malliaris–Shelah, 2016), \(\mathfrak{p} = \mathfrak{t}\).
</div>

<div class="proof">
<strong>Proof sketch (\(\mathfrak{p} \leq \mathfrak{t}\)).</strong> Every tower is a family with sfip but no pseudo-intersection (since the tower itself witnesses the failure). Thus the minimum tower length is at least the minimum size of an sfip family with no pseudo-intersection, giving \(\mathfrak{p} \leq \mathfrak{t}\). The equality \(\mathfrak{p} = \mathfrak{t}\), proved by Malliaris and Shelah using model-theoretic methods involving Keisler's order, resolved a decades-old open problem.
</div>

## Section 20.3: Characteristics of the Null and Meager Ideals

Let \(\mathcal{N}\) be the ideal of Lebesgue null sets and \(\mathcal{M}\) the ideal of meager sets on \(\mathbb{R}\).

<div class="definition">
<strong>Definition (Cichoń characteristics).</strong> For an ideal \(\mathcal{I}\) on a set \(X\):
<ul>
<li>\(\text{add}(\mathcal{I})\): smallest number of sets in \(\mathcal{I}\) whose union is not in \(\mathcal{I}\).</li>
<li>\(\text{cov}(\mathcal{I})\): smallest number of sets in \(\mathcal{I}\) whose union is all of \(X\).</li>
<li>\(\text{non}(\mathcal{I})\): smallest cardinality of a set not in \(\mathcal{I}\).</li>
<li>\(\text{cof}(\mathcal{I})\): cofinality of \(\mathcal{I}\) under \(\subseteq\) (smallest cardinality of a cofinal subfamily).</li>
</ul>
These give four characteristics each for \(\mathcal{N}\) and \(\mathcal{M}\), plus \(\mathfrak{b}\) and \(\mathfrak{d}\), making ten in total in the Cichoń diagram.
</div>

## Section 20.4: The Cichoń Diagram

The ten characteristics are related by the following inequalities, all provable in ZFC:

\[
\begin{array}{ccccc}
\text{add}(\mathcal{N}) & \leq & \text{cov}(\mathcal{N}) & \leq & \text{non}(\mathcal{M}) \\
\downarrow & & & & \downarrow \\
\mathfrak{b} & & & & \mathfrak{d} \\
\downarrow & & & & \downarrow \\
\text{add}(\mathcal{M}) & \leq & \text{cov}(\mathcal{M}) & \leq & \text{non}(\mathcal{N}) \\
\end{array}
\qquad \leq \quad \text{cof}(\mathcal{N}) \leq 2^{\aleph_0}
\]

More precisely, with \(\aleph_1\) on the left and \(2^{\aleph_0}\) on the right, all arrows go left-to-right or top-to-bottom, and in every model of ZFC all displayed inequalities hold. A key result is that \(\text{add}(\mathcal{M}) = \min(\mathfrak{b}, \text{cov}(\mathcal{M}))\) and \(\text{cof}(\mathcal{M}) = \max(\mathfrak{d}, \text{non}(\mathcal{M}))\).

<div class="theorem">
<strong>Theorem (Consistency of separations).</strong> By forcing, one can produce models where:
<ul>
<li>\(\mathfrak{b} < \mathfrak{d}\) (e.g., using a finite support iteration of Hechler forcing).</li>
<li>\(\text{cov}(\mathcal{N}) < \text{non}(\mathcal{N})\) (random real forcing).</li>
<li>All ten characteristics are pairwise distinct (Goldstern–Kellner–Shelah).</li>
</ul>
</div>

<div class="remark">
<strong>Remark.</strong> The Cichoń diagram is complete in the sense that no further ZFC inequalities between the ten characteristics hold — every arrangement consistent with the diagram is realizable. This was fully established through a long series of results, culminating in work by Goldstern, Kellner, Mejía, and Shelah on "many" simultaneously different characteristics.
</div>

---

# Chapter 21: PCF Theory and Singular Cardinal Arithmetic

## Section 21.1: Motivation — Silver's Theorem and Beyond

Cardinal arithmetic is wildly undecidable for regular cardinals: by Easton's theorem, \(2^{\aleph_\alpha}\) can be almost anything for regular \(\aleph_\alpha\). But singular cardinals are different. A remarkable theorem of Silver shows that GCH cannot first fail at a singular cardinal of uncountable cofinality.

<div class="theorem">
<strong>Theorem (Silver, 1974).</strong> If \(\kappa\) is a singular cardinal of uncountable cofinality, and \(2^\lambda = \lambda^+\) for all infinite cardinals \(\lambda < \kappa\), then \(2^\kappa = \kappa^+\).
</div>

The analogous result for cofinality \(\omega\) is false: Magidor showed that starting from a supercompact cardinal, GCH can fail at \(\aleph_\omega\). But even then, how large can \(2^{\aleph_\omega}\) be?

## Section 21.2: Shelah's Bound

<div class="theorem">
<strong>Theorem (Shelah).</strong> If \(2^{\aleph_n} < \aleph_\omega\) for all \(n < \omega\), then \(2^{\aleph_\omega} < \aleph_{\omega_4}\). In particular, \(2^{\aleph_\omega} < \aleph_{\omega_4}\) is provable in ZFC (given GCH below \(\aleph_\omega\)).
</div>

This is a ZFC result — no large cardinals. It shows that even though \(2^{\aleph_\omega}\) can exceed \(\aleph_{\omega+1}\), it cannot be arbitrarily large: it is bounded below \(\aleph_{\omega_4}\). The proof uses Shelah's PCF theory.

## Section 21.3: PCF Theory

Let \(A\) be a set of regular cardinals with \(|A| < \min(A)\). The key object is the product \(\prod A = \prod_{\lambda \in A} \lambda\) ordered by eventual domination: \(f <^* g\) iff \(f(\lambda) < g(\lambda)\) for all but finitely many (or more generally, all but boundedly many) \(\lambda \in A\).

<div class="definition">
<strong>Definition (\(\text{pcf}(A)\)).</strong> The <em>PCF</em> (possible cofinalities) of \(A\) is
\[
\text{pcf}(A) = \left\{ \text{cf}\!\left(\prod A / D\right) : D \text{ is an ultrafilter on } A \right\}.
\]
</div>

Thus \(\text{pcf}(A)\) is the set of all regular cardinals that appear as the cofinality of some ultrapower of \(\prod A\).

<div class="theorem">
<strong>Theorem (Basic PCF facts).</strong>
<ol>
<li>\(\min(A) \leq \text{pcf}(A) \subseteq \left[\min(A), \max\text{pcf}(A)\right]\) and \(\max\text{pcf}(A) = \text{cf}(\prod A, <^*)\).</li>
<li>\(|\text{pcf}(A)| \leq 2^{|A|}\).</li>
<li>For each \(\lambda \in \text{pcf}(A)\), there is a <em>generator</em> \(B_\lambda \subseteq A\) such that \(\lambda \in \text{pcf}(B_\lambda)\) and \(\lambda \notin \text{pcf}(B_\lambda \setminus \{b\})\) for all \(b \in B_\lambda\). The generators \(\{B_\lambda : \lambda \in \text{pcf}(A)\}\) form a basis for \(\text{pcf}(A)\).</li>
</ol>
</div>

<div class="theorem">
<strong>Theorem (Shelah's compactness).</strong> If \(\lambda \in \text{pcf}(A)\) and \(B \subseteq A\) is such that \(\text{pcf}(B) \not\ni \lambda\) for every finite \(B' \subsetneq B\), then \(\lambda \in \text{pcf}(B)\). In other words, if \(\lambda\) is in \(\text{pcf}\) of a set, it is "witnessed compactly."
</div>

The key open question is whether \(|\text{pcf}(\{\aleph_1, \ldots, \aleph_\omega\})| \leq \aleph_4\). Shelah conjectures this is provable in ZFC; it follows from his bound on \(2^{\aleph_\omega}\).

## Section 21.4: The Galvin–Hajnal Theorem and SCH

<div class="theorem">
<strong>Theorem (Galvin–Hajnal).</strong> Let \(\kappa\) be a singular cardinal of uncountable cofinality. If \(2^\lambda < \kappa\) for all \(\lambda < \kappa\), then \(\kappa^{\text{cf}(\kappa)} < \aleph_{(|\kappa|^+)^+}\).
</div>

This bounds cardinal exponentiation at singular cardinals of uncountable cofinality in terms of smaller cardinals, generalizing Silver's theorem.

<div class="definition">
<strong>Definition (SCH).</strong> The <em>Singular Cardinal Hypothesis</em> (SCH) states: for every singular cardinal \(\kappa\), if \(2^{\text{cf}(\kappa)} < \kappa\), then \(\kappa^{\text{cf}(\kappa)} = \kappa^+\).
</div>

SCH follows from GCH, and also from the existence of large cardinals in certain senses. However:

<div class="theorem">
<strong>Theorem (Magidor).</strong> Starting from a supercompact cardinal, it is consistent that SCH fails at \(\aleph_\omega\): specifically, one can have \(2^{\aleph_n} = \aleph_{n+1}\) for all \(n\) but \(2^{\aleph_\omega} = \aleph_{\omega+2}\).
</div>

<div class="theorem">
<strong>Theorem (Shelah–Woodin).</strong> If SCH fails, then there exist inner models with large cardinals. More precisely, the failure of SCH at any singular cardinal implies the existence of inner models with measurable cardinals of high Mitchell order.
</div>

<div class="remark">
<strong>Remark.</strong> PCF theory thus reveals a deep structure in singular cardinal arithmetic. Unlike regular cardinals, singular cardinals are subject to ZFC constraints — they cannot behave arbitrarily. Shelah's machinery of pcf generators and scales (exact upper bounds in \(\prod A\)) provides the technical backbone of all modern work on singular cardinal combinatorics, including recent results on the consistency strength of the failure of SCH at accessible cardinals.
</div>
