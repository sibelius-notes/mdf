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

## Prologue: The Story of Set Theory

### I. Cantor's Paradise

In the 1870s, Georg Cantor set out to understand the structure of the real line — specifically, whether different infinite subsets of \(\mathbb{R}\) could have genuinely different sizes. What he discovered was not just a theorem about the reals but a wholly new mathematical universe. By 1874 he had shown that the real numbers are uncountable, meaning no list can exhaust them; by 1891 he had proved his diagonal argument, establishing that the power set of any set strictly exceeds it in size. Cantor defined "sets" naively: a set is any collection of objects we can think of as a whole. He called this the "paradise" of the infinite, and David Hilbert would later declare that no one should be able to expel mathematicians from this paradise. The theory developed rapidly — transfinite ordinals, cardinal arithmetic, the continuum hypothesis — building an intricate edifice on this naive foundation.

### II. Russell's Paradox and the Crisis of Foundations

In 1901, Bertrand Russell discovered a fatal crack in Cantor's paradise. Consider the collection \(R = \{x : x \notin x\}\) — the set of all sets that do not contain themselves. Does \(R\) contain itself? If \(R \in R\), then by definition \(R \notin R\). If \(R \notin R\), then by definition \(R \in R\). Either way, we have a contradiction. The paradox is not a marginal puzzle: it shows that unrestricted set formation — the principle that any property defines a set — is simply inconsistent. Similar paradoxes followed: Burali-Forti's paradox showed that the collection of all ordinals cannot be a set, and Cantor himself found the paradox of the set of all sets. Frege, who had just finished a grand logicist program to build arithmetic from pure logic, received Russell's letter and wrote in response that the foundations of his edifice had been shaken. The paradise needed walls.

### III. Zermelo and Fraenkel: Building the Walls

Ernst Zermelo responded in 1908 with the first axiomatic system for set theory. Rather than allowing any collection to be a set, Zermelo restricted set-formation: new sets can only be carved out of existing sets (Separation), or assembled from existing sets by explicit construction rules (Pairing, Union, Power Set, Infinity). The key insight was that Russell's paradox requires forming a set from nothing — and Zermelo's axioms prevent this. Abraham Fraenkel and Thoralf Skolem later strengthened Zermelo's system by adding the Replacement schema, which allows the image of any definable function on a set to itself be a set. The resulting system — Zermelo–Fraenkel set theory with the Axiom of Choice, abbreviated **ZFC** — became the universally adopted foundation. It was strong enough to formalize all of ordinary mathematics, yet specific enough to be consistent (as far as anyone can tell).

### IV. Independence: Gödel, Cohen, and the Undecidable

The axiomatic cure raised a new question: which mathematical statements are actually *decided* by ZFC? Kurt Gödel showed in 1938 that the Axiom of Choice and the Generalized Continuum Hypothesis are both *consistent* with ZFC — he constructed the **constructible universe** \(L\), a minimal inner model in which both hold. This showed ZFC cannot *disprove* CH. Then in 1963, Paul Cohen invented an entirely new technique — **forcing** — to show that CH is also *unprovable* from ZFC. By adding "generic" reals to a model of ZFC, Cohen built extensions where \(2^{\aleph_0}\) takes any prescribed value. Together, Gödel and Cohen showed that CH is *independent* of ZFC: it can neither be proved nor disproved. This was not an anomaly. Hundreds of natural mathematical statements — Suslin's hypothesis, the existence of Whitehead groups, the behavior of cardinal arithmetic at singular cardinals — turned out to be similarly independent. Set theory was revealed not as a fixed truth but as a landscape of possible mathematical universes, with ZFC marking the shared terrain and the independence results charting the regions where different choices lead to different worlds. This course explores that landscape.

---

# Chapter 1: Axioms of Set Theory (ZFC)

Set theory serves as a universal foundation for mathematics. Every mathematical object — numbers, functions, topological spaces, groups — can be encoded as a set, and all of mathematics can in principle be derived from a small list of axioms about sets. The standard axiom system is **Zermelo–Fraenkel set theory with the Axiom of Choice**, abbreviated **ZFC**. It was assembled in its modern form during the first three decades of the twentieth century, with contributions from Ernst Zermelo (1908), Abraham Fraenkel, Thoralf Skolem, and John von Neumann.

The language of ZFC is first-order logic with a single binary predicate \(\in\) (membership). All variables range over sets. There are no "urelements" (non-set atoms) in the standard formulation. We write \(x \in y\) to mean "x is an element of y."

## The Axioms of ZFC

### Extensionality

Two sets are purely *extensional* objects — they are determined entirely by what they contain, not by how they are described or named. A list and the same list in a different order are the same set; a set defined by one formula and the same set defined by another formula are identical. This is the most fundamental structural principle of set theory, making sets radically different from intensional objects like properties or concepts.

<div class="axiom">
<strong>Axiom of Extensionality.</strong> Two sets are equal if and only if they have the same elements:

\[
\forall x \, \forall y \, \bigl( x = y \leftrightarrow \forall z\,(z \in x \leftrightarrow z \in y) \bigr).
\]
</div>

This axiom makes sets purely extensional objects: a set is determined entirely by its members, not by how it is described or constructed.

### Empty Set and Pairing

We need a starting point — a set that exists without requiring any prior set to carve it from. The empty set \(\emptyset\) is this ground floor. From it, via Pairing and Union, we can construct any finite set. Without an empty set axiom, we could not even begin: the existential quantifier in all other axioms would be vacuously true in the empty model.

<div class="axiom">
<strong>Axiom of Empty Set.</strong> There exists a set with no elements:

\[
\exists x \, \forall y \, (y \notin x).
\]
</div>

By Extensionality, this set is unique; we denote it \(\emptyset\).

<div class="axiom">
<strong>Axiom of Pairing.</strong> For any sets \(a\) and \(b\), there exists a set \(\{a, b\}\) whose elements are exactly \(a\) and \(b\):

\[
\forall a \, \forall b \, \exists c \, \forall x \, (x \in c \leftrightarrow x = a \lor x = b).
\]
</div>

Taking \(a = b\) yields the singleton \(\{a\}\).

### Union and Power Set

Union lets us "flatten" a collection of sets: from the family \(\{\{1,2\}, \{2,3\}\}\) we form \(\{1,2,3\}\). This is essential for constructing infinite sets by taking limits along a sequence of approximations. Power Set is the engine of cardinality growth: starting from \(\omega\), a single application gives \(\mathcal{P}(\omega)\), which by Cantor's theorem is strictly larger. Iterating produces a hierarchy of ever-larger infinities that far outpaces any constructive procedure.

<div class="axiom">
<strong>Axiom of Union.</strong> For any set \(F\), there exists a set \(\bigcup F\) consisting of all elements of elements of \(F\):

\[
\forall F \, \exists A \, \forall x \, \bigl(x \in A \leftrightarrow \exists y\,(x \in y \land y \in F)\bigr).
\]
</div>

<div class="axiom">
<strong>Axiom of Power Set.</strong> For any set \(X\), there exists the set \(\mathcal{P}(X)\) of all subsets of \(X\):

\[
\forall X \, \exists P \, \forall u \, \bigl(u \in P \leftrightarrow u \subseteq X\bigr).
\]
</div>

<div class="remark">
The Power Set axiom is what allows us to "jump" to higher cardinalities. Starting from \(\omega\), we get \(\mathcal{P}(\omega)\), then \(\mathcal{P}(\mathcal{P}(\omega))\), and so on — each step producing a set strictly larger than the previous. This is how the hierarchy of infinite cardinalities \(\aleph_0 < 2^{\aleph_0} < 2^{2^{\aleph_0}} < \cdots\) arises within ZFC.
</div>

### Separation (Comprehension Schema)

Separation is Zermelo's direct response to Russell's paradox. Rather than allowing any property to define a set outright, Separation only permits us to *filter* an existing set. We cannot form \(\{x : \varphi(x)\}\) from nothing — we can only form \(\{x \in X : \varphi(x)\}\) from a set \(X\) we already possess. This single restriction defuses all the classical paradoxes.

<div class="axiom">
<strong>Axiom Schema of Separation.</strong> For any set \(X\) and any formula \(\varphi(x)\) (with parameters), there exists the set of all elements of \(X\) satisfying \(\varphi\):

\[
\forall X \, \exists Y \, \forall x \, \bigl(x \in Y \leftrightarrow x \in X \land \varphi(x)\bigr).
\]
</div>

This is a schema — one axiom for each formula \(\varphi\). It avoids Russell's paradox: we cannot form \(\{x : x \notin x\}\) without already having a set \(X\) to draw elements from.

<div class="remark">
<strong>Russell's Paradox.</strong> Define \(R = \{x : x \notin x\}\). Then \(R \in R \leftrightarrow R \notin R\), a contradiction. Separation prevents this: we can only form \(\{x \in X : x \notin x\}\), which is a subset of \(X\) and does not lead to a paradox.
</div>

<div class="example">
<strong>Separation in action: the even natural numbers.</strong> We want to form the set \(E = \{n \in \omega : n \text{ is even}\}\). The formula \(\varphi(n)\) is \(\exists m \in \omega \, (n = m + m)\), which asserts \(n\) is twice some natural number. By Separation applied to the set \(\omega\) and the formula \(\varphi\):

\[
E = \{n \in \omega : \exists m \in \omega \, (n = m + m)\} = \{0, 2, 4, 6, \ldots\}.
\]
This is a perfectly legitimate set in ZFC. Notice that we never tried to form a set of "all even numbers" out of nothing — we always worked *inside* the pre-existing set \(\omega\). The Russell paradox would require us to form \(R = \{x : x \notin x\}\) where \(x\) ranges over all sets — but no such universal set exists in ZFC. The moment we restrict to \(\{x \in X : x \notin x\}\) for any fixed set \(X\), we merely get a subset of \(X\), and the argument \(R \in R \leftrightarrow R \notin R\) no longer fires: the resulting set is simply \(X \setminus \{x \in X : x \in x\}\), a perfectly harmless set.
</div>

### Replacement (Fraenkel's Axiom Schema)

Fraenkel observed that Zermelo's original axioms could not form the set \(\{\omega, \mathcal{P}(\omega), \mathcal{P}(\mathcal{P}(\omega)), \ldots\}\) — an infinite "tower" built by iterating the power set operation starting from \(\omega\). The problem is that such a set requires applying a function (\(x \mapsto \mathcal{P}(x)\)) to the set \(\omega\) and collecting all the resulting values. Separation alone cannot do this: it can only filter what is already there. Replacement adds the power to *define new sets by applying functions to existing sets*, as long as the function is definable by a formula.

<div class="axiom">
<strong>Axiom Schema of Replacement.</strong> If \(\varphi(x, y)\) defines a class-function (i.e., for every \(x\) there is at most one \(y\) with \(\varphi(x,y)\)), then the image of any set under this function is a set:

\[
\forall A \, \bigl[\forall x \in A \, \exists! y \, \varphi(x,y)\bigr] \to \exists B \, \forall x \in A \, \exists y \in B \, \varphi(x,y).
\]
</div>

Replacement is strictly stronger than Separation and is needed to construct, for example, the set \(\{\omega, \mathcal{P}(\omega), \mathcal{P}(\mathcal{P}(\omega)), \ldots\}\).

<div class="example">
<strong>Replacement building the tower of power sets.</strong> Define \(f: \omega \to V\) by \(f(0) = \omega\) and \(f(n+1) = \mathcal{P}(f(n))\). The formula \(\varphi(n, y)\) expressing "\(y = f(n)\)" is definable by a transfinite recursion expressible in ZFC. By Replacement applied to the set \(\omega\), the image \(\{f(n) : n \in \omega\} = \{\omega, \mathcal{P}(\omega), \mathcal{P}(\mathcal{P}(\omega)), \ldots\}\) is a set. Its union \(V_{\omega + \omega} = \bigcup_{n \in \omega} f(n)\) is then also a set by Union. Without Replacement, \(V_{\omega+\omega}\) is not constructible from the other axioms.
</div>

### Infinity

<div class="axiom">
<strong>Axiom of Infinity.</strong> There exists an inductive set:

\[
\exists X \, \bigl(\emptyset \in X \land \forall y \in X \, (y \cup \{y\} \in X)\bigr).
\]
</div>

The smallest inductive set is \(\omega = \{0, 1, 2, \ldots\}\) where \(0 = \emptyset\), \(1 = \{\emptyset\}\), \(2 = \{\emptyset, \{\emptyset\}\}\), etc. — the von Neumann natural numbers.

### Regularity (Foundation)

<div class="axiom">
<strong>Axiom of Regularity (Foundation).</strong> Every non-empty set has an \(\in\)-minimal element:

\[
\forall x \, \bigl(x \neq \emptyset \to \exists y \in x \, (y \cap x = \emptyset)\bigr).
\]
</div>

Regularity forbids infinite descending \(\in\)-chains and, in particular, \(x \in x\). It implies the universe of sets is well-founded and stratified into the **von Neumann hierarchy** \(V = \bigcup_\alpha V_\alpha\).

### Axiom of Choice

<div class="axiom">
<strong>Axiom of Choice (AC).</strong> For every set \(X\) of non-empty pairwise disjoint sets, there is a set \(C\) (a <em>choice set</em>) that contains exactly one element from each member of \(X\):

\[
\forall X \, \bigl[\emptyset \notin X \to \exists f : X \to \bigcup X, \, \forall A \in X \, (f(A) \in A)\bigr].
\]
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

Think of ordinals as measuring *positions* rather than sizes: first, second, third, and then, after all finite positions are exhausted, a new position \(\omega\) that comes after all of them — followed by \(\omega+1\), \(\omega+2\), and eventually \(\omega \cdot 2\), \(\omega^2\), \(\omega^\omega\), and so on. The ordinals form an absolute backbone for all of set theory: every well-ordered set is isomorphic to a unique ordinal, so ordinals are the canonical "names" for the order-types of well-ordered sets.

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

<div class="example">
<strong>Non-commutativity of ordinal addition: \(\omega + 1 \neq 1 + \omega\).</strong>

By definition, \(1 + \omega = \sup_{n < \omega}(1 + n) = \sup_{n < \omega}(n+1) = \omega\). The sequence \(1+0, 1+1, 1+2, \ldots = 1, 2, 3, \ldots\) has supremum \(\omega\). So \(1 + \omega = \omega\).

On the other hand, \(\omega + 1 = \omega \cup \{\omega\} = \{0, 1, 2, \ldots, \omega\}\), the first ordinal beyond \(\omega\). Its order type is \(\omega + 1\): it has a last element (namely \(\omega\)), while \(\omega\) does not. So \(\omega + 1 \neq \omega = 1 + \omega\).

Intuitively: \(1 + \omega\) means "place a single point before an \(\omega\)-sequence" — but that single point gets absorbed into the sequence, giving an \(\omega\)-sequence again. But \(\omega + 1\) means "place a single point *after* an \(\omega\)-sequence" — this adds a genuine last element, changing the order type.
</div>

<div class="example">
<strong>Ordinal multiplication: \(\omega^2 = \omega \cdot \omega\) as a limit.</strong>

By definition, \(\omega \cdot \omega = \sup_{n < \omega} \omega \cdot n\). The sequence is:

\[
\omega \cdot 0 = 0, \quad \omega \cdot 1 = \omega, \quad \omega \cdot 2 = \omega + \omega, \quad \omega \cdot 3 = \omega + \omega + \omega, \quad \ldots
\]
The supremum is \(\omega^2 = \omega \cdot \omega\), whose elements are all ordinals of the form \(\omega \cdot m + k\) for \(m, k < \omega\). This is the order type of \(\omega \times \omega\) under the lexicographic order. Each "row" \(\{m\} \times \omega\) is an \(\omega\)-sequence, and there are \(\omega\) many rows — giving \(\omega^2\) in total.
</div>

<div class="example">
<strong>The ordinal \(\omega^\omega\) and the fixed point \(\varepsilon_0\).</strong>

The ordinal \(\omega^\omega = \sup_{n < \omega} \omega^n\) is the order type of all finite sequences of natural numbers ordered lexicographically. Above \(\omega^\omega\) comes \(\omega^{\omega^\omega}\), and iterating gives a sequence \(\omega^\omega, \omega^{\omega^\omega}, \ldots\) whose supremum is \(\varepsilon_0 = \omega^{\omega^{\omega^{\cdots}}}\), the first ordinal \(\alpha\) satisfying \(\omega^\alpha = \alpha\). Every countable ordinal can be uniquely written in Cantor Normal Form (described below), and \(\varepsilon_0\) is the "boundary" of that form — all ordinals below it have normal form with base \(\omega\), while \(\varepsilon_0\) itself is a fixed point.
</div>

### Cantor Normal Form

<div class="theorem">
<strong>Cantor Normal Form.</strong> Every ordinal \(\alpha > 0\) can be written uniquely as

\[
\alpha = \omega^{\beta_1} \cdot k_1 + \omega^{\beta_2} \cdot k_2 + \cdots + \omega^{\beta_n} \cdot k_n
\]
where \(\beta_1 > \beta_2 > \cdots > \beta_n \geq 0\) are ordinals and \(k_1, \ldots, k_n \geq 1\) are natural numbers.
</div>

<div class="remark">
The Cantor Normal Form is the analogue of base-\(\omega\) expansion for ordinals. For ordinals \(\alpha < \varepsilon_0\), all the exponents \(\beta_i\) are themselves less than \(\alpha\), so the Normal Form is "genuinely finite" — it is a finite tree of natural numbers. The ordinal \(\varepsilon_0\) is the least ordinal whose Normal Form involves exponents as large as itself, making it the natural boundary of the induction.

Bridge remark: Cantor Normal Form will reappear in the proof of termination for Goodstein sequences and in the study of ordinal notations used in proof theory. In PCF theory (Chapter 21), a similar decomposition governs the generators of \(\mathrm{pcf}(A)\).
</div>

---

# Chapter 3: Cardinal Numbers

While ordinals measure the <em>type</em> of a well-ordering, cardinals measure <em>size</em>. Two sets have the same cardinality if there is a bijection between them, regardless of any ordering.

Cardinals are the answer to the question "how many elements does this set have?" For finite sets, the answer is a natural number. For infinite sets, the answer is one of the *alephs* \(\aleph_0, \aleph_1, \aleph_2, \ldots\) — a new hierarchy of infinite quantities that Cantor first discovered and that set theory now systematically studies.

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

<div class="example">
<strong>Worked application: \(|(0,1)| = |[0,1]|\).</strong>

We construct explicit injections in both directions and apply Schröder–Bernstein.

*Injection \(f: (0,1) \hookrightarrow [0,1]\)*: Simply take \(f(x) = x\). This is an injection from the open interval into the closed interval.

*Injection \(g: [0,1] \hookrightarrow (0,1)\)*: We need to send \([0,1]\) injectively into \((0,1)\). Define \(g(x) = \frac{1}{4} + \frac{x}{2}\). Then \(g\) maps \([0,1]\) bijectively onto \([\frac{1}{4}, \frac{3}{4}] \subset (0,1)\). In particular \(g\) is an injection from \([0,1]\) into \((0,1)\).

By Schröder–Bernstein, \(|(0,1)| = |[0,1]|\). Concretely, the bijection \(h\) constructed in the proof sends the "problematic" points \(\{0, 1, g(0), g(1), g(g(0)), g(g(1)), \ldots\} = \{0, 1, 1/4, 3/4, 3/8, 5/8, \ldots\}\) via \(f\) (i.e., \(h(x) = x\) on this countable set) and all other points via \(g^{-1}\) (i.e., \(h(x) = 2x - 1/2\) off this set). The result is a genuine bijection \([0,1] \to (0,1)\).
</div>

<div class="remark">
The Schröder–Bernstein theorem is noteworthy for not requiring the Axiom of Choice. The proof is constructive: given the two injections, we build the bijection by explicit partition. This contrasts with the comparability of cardinals (any two sets can be compared in size), which *does* require AC. Bridge remark: Schröder–Bernstein will reappear in Chapter 17 when we compare the sizes of large cardinal ultrafilters and their ultrapowers.
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

<div class="example">
<strong>The cardinality of \(\mathbb{R}\).</strong>

We claim \(|\mathbb{R}| = |\mathcal{P}(\omega)| = 2^{\aleph_0}\).

*Step 1: \(|\mathbb{R}| = |(0,1)|\)*. The map \(x \mapsto \frac{1}{\pi}\arctan(x) + \frac{1}{2}\) is a bijection \(\mathbb{R} \to (0,1)\).

*Step 2: \(|(0,1)| = |\mathcal{P}(\omega)|\)*. Every real in \((0,1)\) has a binary expansion \(0.b_0 b_1 b_2 \ldots\) with \(b_i \in \{0,1\}\). Ignoring the ambiguity at dyadic rationals (which form a countable set), this gives a bijection between \((0,1)\) and \(2^\omega = \{f : \omega \to 2\}\). And \(|2^\omega| = |\mathcal{P}(\omega)|\) via \(f \leftrightarrow \{n : f(n) = 1\}\).

*Step 3: \(|\mathbb{R}^2| = |\mathbb{R}|\)*. We need an injection \(\mathbb{R}^2 \hookrightarrow \mathbb{R}\). Given two reals \(x = 0.a_0 a_1 a_2 \ldots\) and \(y = 0.b_0 b_1 b_2 \ldots\) in \((0,1)\), interleave their binary expansions to get \(0.a_0 b_0 a_1 b_1 a_2 b_2 \ldots \in (0,1)\). This is an injection \((0,1)^2 \hookrightarrow (0,1)\), and the reverse injection is trivial (embed via first coordinate). By Schröder–Bernstein, \(|(0,1)^2| = |(0,1)|\), so \(|\mathbb{R}^2| = |\mathbb{R}|\). By induction, \(|\mathbb{R}^n| = |\mathbb{R}|\) for all finite \(n\), and even \(|\mathbb{R}^\omega| = |\mathbb{R}|\) since \((2^{\aleph_0})^{\aleph_0} = 2^{\aleph_0 \cdot \aleph_0} = 2^{\aleph_0}\).
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

\[
\sum_{i \in I} \kappa_i < \prod_{i \in I} \lambda_i.
\]
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

\[
\kappa^\lambda = \begin{cases} \lambda^+ & \text{if } \kappa \leq \mathrm{cf}(\lambda), \\ \lambda & \text{if } \mathrm{cf}(\lambda) < \kappa \leq \lambda. \end{cases}
\]
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

\[
M^I/\mathcal{U} \models \varphi([f_1],\ldots,[f_n]) \iff \{i \in I : M \models \varphi(f_1(i),\ldots,f_n(i))\} \in \mathcal{U}.
\]
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

\[
\mathcal{F}_\kappa = \{A \subseteq \kappa : C \subseteq A \text{ for some club } C \subseteq \kappa\}.
\]
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

\[
\Delta_{\alpha < \kappa} A_\alpha = \{\xi < \kappa : \xi \in A_\alpha \text{ for all } \alpha < \xi\} \in \mathcal{F}.
\]
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
Let \(\kappa\) be measurable with witnessing ultrafilter \(\mathcal{U}\). Suppose \(\kappa = \lambda^+\) for some cardinal \(\lambda < \kappa\). Write \(\kappa = \bigcup_{\alpha < \lambda} A_\alpha\) as a union of \(\lambda < \kappa\) sets each of size \(\lambda\). Since \(\mathcal{U}\) is \(\kappa\)-complete, it is also \(\lambda^+\)-complete; taking the \(\lambda\)-fold intersection of complements, we get a contradiction. For strong limit: if \(2^\lambda < \kappa\) for all \(\lambda < \kappa\), this follows from the fact that every set of size \(< \kappa\) is measure 0.
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

\[
V \models \varphi(a_1, \ldots, a_n) \iff V_\beta \models \varphi(a_1, \ldots, a_n).
\]
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

\[
\mathrm{Def}(M) = \{A \subseteq M : A = \{x \in M : M \models \varphi(x, a_1, \ldots, a_n)\} \text{ for some formula } \varphi \text{ and parameters } a_1, \ldots, a_n \in M\}.
\]
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

\[
\mathbf{HOD} = \{x \in \mathbf{OD} : \mathrm{tc}(\{x\}) \subseteq \mathbf{OD}\}.
\]
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

## Intuitive Introduction to Forcing

Cohen's method of forcing is the most powerful technique in modern set theory, and it deserves an extended intuitive preparation before the technical machinery. The basic question is: how do we build a model of ZFC in which \(2^{\aleph_0} = \aleph_2\), given that we are living inside some existing model \(M\) where perhaps \(2^{\aleph_0} = \aleph_1\)?

We cannot simply "add" new real numbers to \(M\) from inside \(M\) — if the new reals existed in \(M\), they would already be there. Instead, Cohen's idea is to reason *about* a hypothetical extension \(M[G]\) from within \(M\), by specifying what properties the new object \(G\) should have, without actually constructing \(G\).

Think of forcing conditions as *finite approximations* to the new object we want to add. A **forcing poset** \(\mathbb{P}\) consists of these approximations, ordered so that stronger conditions (lower in the order) provide more information. A **generic filter** \(G\) is a coherent collection of conditions — one from each "dense" set of conditions in \(\mathbb{P}\) — whose union describes the new object completely.

The key insight is: \(G\) need not exist in \(M\). If \(M\) is countable, then \(\mathbb{P}\) has countably many dense sets (as elements of \(M\)), and by a combinatorial argument (Rasiowa–Sikorski), a filter meeting all of them exists — but lives *outside* \(M\). We adjoin \(G\) to \(M\) to form \(M[G]\), and the **forcing relation** \(p \Vdash \varphi\) (defined inside \(M\)) tells us exactly which sentences will be true in \(M[G]\): \(\varphi\) holds in \(M[G]\) if and only if some condition \(p\) in \(G\) forces \(\varphi\).

<div class="example">
<strong>Adding a Cohen real.</strong> The simplest forcing is Cohen forcing to add a single new real. The forcing poset is:

\[
\mathbb{P} = (2^{<\omega}, \supseteq)
\]
consisting of all finite binary strings \(s: n \to 2\) (for \(n \in \omega\)), ordered by reverse extension: \(s \leq t\) (i.e., \(s\) is stronger) if and only if \(s \supseteq t\) as functions. Intuitively, longer strings provide more information.

A generic filter \(G\) picks one finite string from each dense set. The *dense* sets ensure that:
- For each \(n \in \omega\), some string in \(G\) has length \(> n\) (so \(\bigcup G\) is a total function \(\omega \to 2\)).
- For each condition \(s \in \mathbb{P}\) and each \(k \in \{0,1\}\), there is a condition in \(G\) extending \(s^\frown k\) (so \(\bigcup G\) genuinely branches).

The new real is \(g = \bigcup G \in 2^\omega\). This \(g\) is not in the ground model \(M\): for each real \(r \in M \cap 2^\omega\), the set \(D_r = \{s \in \mathbb{P} : s \not\subseteq r\}\) is dense (since any finite approximation can be extended to disagree with \(r\) somewhere), so \(G\) meets \(D_r\), meaning \(g \neq r\). The generic real \(g\) is thus genuinely new — not just a re-description of something already in \(M\).

This forcing does not collapse cardinals (it is ccc: any antichain in \(2^{<\omega}\) is countable, since two compatible strings can always be extended to a common string). The extension \(M[G]\) satisfies all the same cardinal arithmetic as \(M\), but now contains a new real \(g \notin M\).
</div>

## The Basic Setup

Let \(M\) be a countable transitive model of ZFC (a **ground model**). A **partial order** (or **forcing notion**) is a set \(\mathbb{P} = (P, \leq)\) with a maximum element \(\mathbf{1}\). Elements of \(\mathbb{P}\) are **conditions**; we think of stronger conditions as providing more information.

<div class="definition">
Two conditions \(p, q \in \mathbb{P}\) are <strong>compatible</strong> if there exists \(r \leq p, q\); otherwise they are <strong>incompatible</strong> (written \(p \perp q\)). An <strong>antichain</strong> is a set of pairwise incompatible conditions. \(\mathbb{P}\) satisfies the <strong>countable chain condition (ccc)</strong> if every antichain is countable.
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

\[
M[G] \models \varphi(\tau^G_1, \ldots, \tau^G_n) \iff \exists p \in G, \, p \Vdash \varphi(\tau_1, \ldots, \tau_n).
\]
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

Large cardinal axioms extend the ZFC axioms *upward* — they assert the existence of very large sets whose existence cannot be proved in ZFC but whose consistency we nonetheless believe (based on the coherence of the resulting theory and its fruitful consequences). Each large cardinal axiom is a bet on the richness of the set-theoretic universe, and the remarkable empirical fact is that all such axioms studied so far are linearly ordered by consistency strength: for any two large cardinal axioms \(\Phi\) and \(\Psi\), either ZFC + \(\Phi\) proves the consistency of ZFC + \(\Psi\), or vice versa.

## Inaccessible Cardinals

<div class="definition">
An uncountable cardinal \(\kappa\) is <strong>strongly inaccessible</strong> if:
<ol>
  <li>\(\kappa\) is regular: \(\mathrm{cf}(\kappa) = \kappa\),</li>
  <li>\(\kappa\) is a strong limit: for all \(\lambda < \kappa\), \(2^\lambda < \kappa\).</li>
</ol>
A cardinal is <strong>weakly inaccessible</strong> if it is regular and a weak limit (i.e., \(\lambda < \kappa \Rightarrow \lambda^+ < \kappa\), i.e., no predecessor).
</div>

Inaccessible cardinals are significant because they are precisely the cardinals \(\kappa\) such that \(V_\kappa\) is a model of ZFC. In this sense, they are "ZFC-absolute" — they look like the entire set-theoretic universe from within their own level.

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

\[
\text{inaccessible} \subset \text{Mahlo} \subset \text{weakly compact} \subset \text{measurable}.
\]
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

<div class="remark">
<strong>The large cardinal hierarchy as a spectrum.</strong> The following diagram places the major large cardinal notions in order of consistency strength, from weakest to strongest:

\[
\text{inaccessible} \prec \text{Mahlo} \prec \text{weakly compact} \prec \text{measurable} \prec \text{Woodin} \prec \text{supercompact}
\]

Each "\(\prec\)" means "strictly weaker in consistency strength." Woodin cardinals sit between measurable and supercompact in a deep sense: they are strong enough to imply projective determinacy (which requires infinitely many Woodin cardinals) but not strong enough to imply the existence of a supercompact. Above supercompact in the hierarchy come extendible, huge, and rank-into-rank cardinals — with Kunen's Inconsistency placing an absolute upper bound by showing there is no elementary embedding \(j: V \to V\) in ZFC.
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

<div class="remark">
<strong>Intuition via Baire Category.</strong> MA(\(\aleph_1\)) says that all ccc posets of size \(\leq \aleph_1\) behave like the poset of open dense sets in a Baire space: if we intersect fewer than \(2^{\aleph_0}\) many "dense open conditions," we still find a common point. This is a generalized completeness assertion: the universe is rich enough that no \(< 2^{\aleph_0}\)-bounded conspiracy of conditions can prevent the existence of a generic filter. It is a consistency result that lives naturally in the ZFC + \(2^{\aleph_0} > \aleph_1\) world — indeed, MA implies \(\neg\)CH.
</div>

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

<div class="example">
<strong>Worked computation under GCH: \(\mathrm{pcf}(\{\aleph_1, \aleph_2, \aleph_3\})\).</strong>

Let \(A = \{\aleph_1, \aleph_2, \aleph_3\}\). We want to determine the possible cofinalities of \(\prod A / D\) as \(D\) ranges over ultrafilters on \(A\).

Since \(A\) is a finite set of three elements, the ultrafilters on \(A\) are exactly the three principal ultrafilters \(D_1, D_2, D_3\) concentrated on \(\aleph_1, \aleph_2, \aleph_3\) respectively. (There are no non-principal ultrafilters on a finite set.)

For a principal ultrafilter \(D_i\) concentrated on \(\aleph_i\):

\[
\prod A / D_i \cong \aleph_i
\]
since every function \(f \in \prod A\) is identified with its value \(f(\aleph_i)\), giving a structure of order type \(\aleph_i\).

Therefore \(\mathrm{cf}(\prod A / D_i) = \mathrm{cf}(\aleph_i)\). Under GCH, all \(\aleph_i\) for \(i \geq 1\) are regular (since \(\aleph_i = \omega_i\) and successor cardinals are regular), so:

\[
\mathrm{pcf}(\{\aleph_1, \aleph_2, \aleph_3\}) = \{\aleph_1, \aleph_2, \aleph_3\} \subseteq [\aleph_1, \aleph_3] \subseteq [\aleph_1, \aleph_4].
\]

In the general infinite case, for \(A = \{\aleph_1, \aleph_2, \ldots, \aleph_n, \ldots\}_{n < \omega}\) (the first \(\omega\) uncountable cardinals), the ultrafilters on this countable set include non-principal ones, and the pcf can extend up to \(\aleph_{\omega_4}\) — this is the content of Shelah's theorem. The pcf generators for this larger set are the subsets \(B_\lambda \subseteq A\) that "generate" each possible cofinality \(\lambda\), and their existence is guaranteed by the pcf structure theorem.
</div>

<div class="example">
<strong>Tracing Shelah's bound: why \(\aleph_\omega^{\aleph_0} < \aleph_{\omega_4}\) under \(2^{\aleph_n} < \aleph_\omega\).</strong>

Assume \(2^{\aleph_n} < \aleph_\omega\) for all \(n < \omega\) (i.e., GCH holds cofinally below \(\aleph_\omega\)). We want to bound \(\aleph_\omega^{\aleph_0}\).

*Step 1: Represent the product.* We have \(\aleph_\omega^{\aleph_0} = |\prod_{n < \omega} \aleph_\omega|  \leq |\prod_{n < \omega} \aleph_{n+1}|\) (since \(\aleph_\omega = \sup_{n} \aleph_n\) and replacing each factor by a larger cardinal). The key object is \(\prod_{n<\omega} \aleph_{n+1}\) with the eventual domination order.

*Step 2: PCF bound.* By Shelah's pcf theorem, the exact upper bound of this product (the maximum possible cofinality of \(\prod_{n<\omega} \aleph_{n+1} / D\) over all ultrafilters \(D\)) equals the true cofinality of the product. Shelah shows this true cofinality is in \(\mathrm{pcf}(\{\aleph_1, \aleph_2, \ldots\})\).

*Step 3: The \(\aleph_{\omega_4}\) bound.* Using the pcf generators \(B_\lambda\) for the set \(\{\aleph_n : n \geq 1\}\), Shelah proves that \(\max(\mathrm{pcf}(\{\aleph_n : n \geq 1\})) < \aleph_{\omega_4}\). The argument uses a covering argument: if some \(\lambda \geq \aleph_{\omega_4}\) were in \(\mathrm{pcf}\), one could derive a contradiction with the assumption \(2^{\aleph_n} < \aleph_\omega\) for all \(n\) via the pcf structure theorem and König's theorem applied to cofinalities.

The conclusion is \(\aleph_\omega^{\aleph_0} \leq \max(\mathrm{pcf}(\{\aleph_n\})) < \aleph_{\omega_4}\), which is Shelah's celebrated bound — a ZFC theorem with no large cardinal hypotheses.
</div>

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

---

# Appendix A: Timeline of Set Theory

The following chronological table traces the development of set theory from its origins to modern research frontiers.

| Year | Event |
|------|-------|
| 1874 | Cantor proves the reals are uncountable (first uncountability proof, using a nested interval argument) |
| 1878 | Cantor conjectures the Continuum Hypothesis in a letter to Dedekind |
| 1879–1884 | Cantor develops transfinite ordinals and cardinals in a series of papers |
| 1891 | Cantor's diagonal argument; proves \(\vert X\vert < \vert \mathcal{P}(X)\vert \) for any set \(X\) |
| 1895–1897 | Cantor publishes the *Beiträge*, his systematic treatment of cardinals and ordinals |
| 1897 | Burali-Forti paradox: the collection of all ordinals is not a set |
| 1899 | Cantor discovers the paradox of the set of all sets (in correspondence with Dedekind) |
| 1900 | Hilbert lists the Continuum Hypothesis as the first of his 23 problems |
| 1901 | Russell's paradox: \(R = \{x : x \notin x\}\) leads to contradiction |
| 1903 | Russell publishes *The Principles of Mathematics*; paradox becomes widely known |
| 1905 | König attempts to prove \(2^{\aleph_0} \neq \aleph_\omega\); error found by Zermelo |
| 1906 | Schröder–Bernstein theorem proved independently by Bernstein and Schröder |
| 1908 | Zermelo publishes the first axiomatization of set theory (Z); proves Well-Ordering Theorem using AC |
| 1910–1913 | Whitehead and Russell publish *Principia Mathematica*; type theory as alternative foundation |
| 1914 | Hausdorff introduces partially ordered sets, study of order types |
| 1922 | Fraenkel adds Replacement schema to Zermelo's axioms (ZF) |
| 1922 | Skolem argues for first-order formulation; notes Löwenheim–Skolem theorem |
| 1923 | von Neumann introduces ordinals as sets; the "von Neumann ordinals" |
| 1925 | von Neumann proves the Well-Ordering Theorem using only ZF + AC |
| 1930 | Zermelo publishes revised axioms including Regularity |
| 1930 | Ulam asks the measure problem: which cardinals admit \(\sigma\)-additive measures on all subsets? |
| 1935 | Gödel introduces the constructible universe \(L\) |
| 1938 | Gödel proves \(\mathsf{Con}(\mathsf{ZF}) \Rightarrow \mathsf{Con}(\mathsf{ZFC} + \mathsf{GCH})\) using \(L\) |
| 1939 | Gödel proves AC holds in \(L\) |
| 1943 | Gödel conjectures independence of CH from ZFC |
| 1950 | Erdős and Rado develop infinite Ramsey theory; partition calculus |
| 1953 | Kleene introduces the arithmetical and analytical hierarchies (descriptive set theory) |
| 1957 | Scott shows measurable cardinals imply \(V \neq L\) |
| 1961 | Hanf and Scott develop large cardinal theory; Hanf numbers |
| 1963 | Cohen invents forcing; proves \(\mathsf{Con}(\mathsf{ZFC}) \Rightarrow \mathsf{Con}(\mathsf{ZFC} + \lnot\mathsf{CH})\) |
| 1963 | Cohen proves independence of AC from ZF (using forcing and symmetric models) |
| 1964 | Lévy and Solovay: forcing preserves measurability if the forcing is small |
| 1965 | Solovay proves every \(\Sigma^1_2\) set of reals is Lebesgue measurable if a measurable cardinal exists |
| 1967 | Jensen's fine structure theory of \(L\); introduction of \(\Diamond\) and \(\square\) |
| 1967 | Solovay and Tennenbaum prove consistency of Suslin's Hypothesis via iterated forcing |
| 1970 | Easton's theorem: \(2^\kappa\) can be almost anything for regular \(\kappa\) |
| 1971 | Jensen proves \(\Diamond\) holds in \(L\); Suslin trees exist in \(L\) |
| 1971 | Silver proves GCH cannot first fail at a singular of uncountable cofinality |
| 1974 | Martin's Axiom + ¬CH is proved consistent (Solovay–Tennenbaum) |
| 1975 | Martin proves Borel Determinacy in ZFC |
| 1976 | Silver proves \(0^\#\) exists iff there are uncountably many Silver indiscernibles |
| 1978 | Magidor proves SCH can fail at \(\aleph_\omega\) from supercompact |
| 1980 | Foreman, Magidor, Shelah prove consistency of Martin's Maximum (MM) |
| 1984 | Shelah introduces PCF theory; bounds \(\aleph_\omega^{\aleph_0} < \aleph_{\omega_4}\) |
| 1985 | Shelah's *Cardinal Arithmetic* develops the full pcf machinery |
| 1987 | Woodin introduces Woodin cardinals |
| 1988 | Martin–Steel theorem: infinitely many Woodin cardinals imply Projective Determinacy |
| 1988 | Foreman–Magidor–Shelah: Martin's Maximum consistent from supercompact |
| 1992 | Shelah–Woodin: failure of SCH implies large cardinal strength |
| 1994 | Woodin: \(\text{AD}^{L(\mathbb{R})}\) equiconsistent with infinitely many Woodin cardinals |
| 1999 | Woodin announces \(\Omega\)-logic and the case for \(V = \text{Ultimate-}L\) |
| 2000 | Shelah: many ZFC non-equivalent combinatorial principles at \(\aleph_1\) |
| 2003 | Viale proves the singular compactness theorem for SCH |
| 2005 | Goldstern–Shelah: many separation results in the Cichoń diagram |
| 2010 | Magidor–Shelah: structure of pcf under failure of SCH |
| 2013 | Malliaris–Shelah prove \(\mathfrak{p} = \mathfrak{t}\) using Keisler's order |
| 2014 | Goldstern–Kellner–Mejía–Shelah: all Cichoń characteristics consistently distinct |
| 2016 | Woodin's Ultimate-\(L\) program: conjecture that a canonical inner model satisfying GCH exists at the level of supercompact cardinals |
| 2017 | Asperó–Schindler: Martin's Maximum\(^{++}\) implies Woodin's axiom \((*)\) |
| 2020 | Recent advances in descriptive inner model theory: connection between HOD and canonical models under determinacy |
| 2024 | Active research: inner model theory at the supercompact level, fine structure beyond Woodin cardinals, Ultimate-\(L\) program |

---

# Appendix B: Problem Sets

The following problems are organized by topic and difficulty. Problems in Part A and B are accessible after Chapters 1–5. Problems in Part C require the forcing machinery of Chapter 14. Problems in Part D are research-adjacent and require the full course.

## Part A: ZFC and Ordinal Arithmetic (5 problems)

<div class="example">
<strong>Problem A1.</strong> (Separation and Russell's Paradox) Let \(X\) be any set. Show that the set \(R_X = \{x \in X : x \notin x\}\) exists by Separation. Prove that \(R_X \notin X\). Conclude that there is no "universal set" (a set containing all sets) in ZFC.
</div>

<div class="example">
<strong>Problem A2.</strong> (Ordinal arithmetic) Compute the following ordinals in Cantor Normal Form. Justify each step from the definition of ordinal arithmetic:
<ol>
<li>\(\omega \cdot 3 + \omega^2 \cdot 2 + 1\) (write in decreasing exponent order)</li>
<li>\((\omega + 1) \cdot \omega\) — show this equals \(\omega^2\)</li>
<li>\(\omega^\omega + \omega^3 \cdot 5 + \omega \cdot 7 + 3\)</li>
</ol>
For (2): use the definition of multiplication \(\alpha \cdot \lambda = \sup_{\beta < \lambda} \alpha \cdot \beta\) and compute \((\omega+1) \cdot n\) for each \(n \in \omega\), then take the supremum.
</div>

<div class="example">
<strong>Problem A3.</strong> (Transfinite induction) Prove that ordinal addition is associative: \((\alpha + \beta) + \gamma = \alpha + (\beta + \gamma)\) for all ordinals \(\alpha, \beta, \gamma\). (Hint: fix \(\alpha, \beta\) and induct on \(\gamma\), handling the cases \(\gamma = 0\), \(\gamma\) successor, and \(\gamma\) limit separately.)
</div>

<div class="example">
<strong>Problem A4.</strong> (von Neumann hierarchy) Show that for all ordinals \(\alpha\):
<ol>
<li>\(|V_\alpha| = \beth_\alpha\), where \(\beth_0 = \aleph_0\), \(\beth_{\alpha+1} = 2^{\beth_\alpha}\), and \(\beth_\lambda = \sup_{\alpha < \lambda} \beth_\alpha\) for limit \(\lambda\).</li>
<li>\(V_\omega\) is a model of all ZFC axioms except Infinity.</li>
<li>If \(\kappa\) is strongly inaccessible, then \(|V_\kappa| = \kappa\).</li>
</ol>
</div>

<div class="example">
<strong>Problem A5.</strong> (Replacement) Let \(f: \omega \to \omega\) be defined by \(f(n) = n^2\). Using the Replacement schema, show that \(\{n^2 : n \in \omega\} = \{0, 1, 4, 9, 16, \ldots\}\) is a set. Then use Union to form the set of all perfect squares as a subset of \(\omega\), and verify this is the same as the set produced by Separation with the formula \(\varphi(m) = \exists n \in \omega \, (m = n \cdot n)\).
</div>

## Part B: Cardinals and the Continuum Hypothesis (5 problems)

<div class="example">
<strong>Problem B1.</strong> (Cardinality computations) Prove the following, constructing explicit bijections or applying Schröder–Bernstein where appropriate:
<ol>
<li>\(|\mathbb{Q}| = \aleph_0\)</li>
<li>\(|\mathbb{R} \setminus \mathbb{Q}| = 2^{\aleph_0}\)</li>
<li>\(|\mathcal{P}(\mathbb{N})| = |\mathbb{R}|\)</li>
<li>The set of all continuous functions \(f: \mathbb{R} \to \mathbb{R}\) has cardinality \(2^{\aleph_0}\)</li>
</ol>
</div>

<div class="example">
<strong>Problem B2.</strong> (König's Theorem applications) Use König's Theorem to prove:
<ol>
<li>\(2^{\aleph_0} \neq \aleph_\omega\)</li>
<li>\(\aleph_\omega^{\aleph_0} > \aleph_\omega\)</li>
<li>For any infinite cardinal \(\kappa\), \(\kappa^{\mathrm{cf}(\kappa)} > \kappa\). (This shows the continuum function is "discontinuous" at singular cardinals.)</li>
</ol>
</div>

<div class="example">
<strong>Problem B3.</strong> (GCH consequences) Assume GCH. Show:
<ol>
<li>\(\aleph_{\omega}^{\aleph_1} = \aleph_{\omega+1}\) (Hint: \(\mathrm{cf}(\aleph_\omega) = \omega < \aleph_1\), so use the GCH cardinal exponentiation formula.)</li>
<li>For any infinite cardinal \(\kappa\) and \(\lambda \leq \kappa\): \(\kappa^\lambda = \kappa^+\) if \(\lambda\) is cofinal in \(\kappa\), and \(\kappa^\lambda = \kappa\) otherwise.</li>
<li>Under GCH, the cardinal characteristics of the continuum all equal \(\aleph_1\): \(\mathfrak{b} = \mathfrak{d} = \mathfrak{p} = \mathfrak{t} = \aleph_1\).</li>
</ol>
</div>

<div class="example">
<strong>Problem B4.</strong> (Cofinality and singular cardinals) 
<ol>
<li>Prove that \(\mathrm{cf}(\aleph_{\omega_1}) = \omega_1\). Is \(\aleph_{\omega_1}\) regular or singular?</li>
<li>Show that for any limit cardinal \(\kappa\), \(\mathrm{cf}(\kappa) \leq \kappa\).</li>
<li>Prove that if \(\kappa\) is a singular cardinal, then \(\kappa\) is not measurable. (Hint: a measurable cardinal must be regular.)</li>
</ol>
</div>

<div class="example">
<strong>Problem B5.</strong> (Consistency strength) 
<ol>
<li>Show that CH is equivalent to: every uncountable subset of \(\mathbb{R}\) has cardinality \(\mathfrak{c}\). (Hint: use the Cantor–Bendixson theorem and properties of closed sets.)</li>
<li>Show that MA implies \(\neg\)CH. (Hint: under MA, apply MA to the poset of finite partial functions \(2^{<\aleph_1} \to 2\); derive that \(2^{\aleph_0} \geq \aleph_2\).)</li>
<li>State (without proof) why the existence of an inaccessible cardinal implies \(\mathrm{Con}(\mathsf{ZFC})\), and why this means ZFC alone cannot prove the existence of an inaccessible.</li>
</ol>
</div>

## Part C: Forcing and Generic Extensions (5 problems)

<div class="example">
<strong>Problem C1.</strong> (Cohen forcing basics) Let \(\mathbb{P} = (2^{<\omega}, \supseteq)\) be Cohen forcing.
<ol>
<li>Show that \(\mathbb{P}\) is ccc: any antichain in \(\mathbb{P}\) is countable.</li>
<li>For each \(n \in \omega\), show that the set \(D_n = \{s \in 2^{<\omega} : |s| > n\}\) is dense in \(\mathbb{P}\).</li>
<li>For each \(t \in 2^{<\omega}\), show that \(E_t = \{s \in 2^{<\omega} : s \supseteq t\}\) is dense in \(\mathbb{P}\).</li>
<li>If \(G\) is an \(M\)-generic filter over \(\mathbb{P}\), show that \(g = \bigcup G\) is a total function \(\omega \to 2\).</li>
<li>Show that \(g \notin M\).</li>
</ol>
</div>

<div class="example">
<strong>Problem C2.</strong> (Forcing relation) Let \(\mathbb{P}\) be any partial order and \(M\) a ground model. Prove:
<ol>
<li>If \(p \Vdash \varphi\) and \(q \leq p\), then \(q \Vdash \varphi\). (Monotonicity)</li>
<li>No condition forces both \(\varphi\) and \(\lnot \varphi\). (Consistency)</li>
<li>For every formula \(\varphi\) with names as parameters, the set \(\{p \in \mathbb{P} : p \Vdash \varphi \text{ or } p \Vdash \lnot\varphi\}\) is dense. (Decidability)</li>
</ol>
</div>

<div class="example">
<strong>Problem C3.</strong> (Cardinal preservation) Let \(M\) be a ground model and \(\mathbb{P}\) a ccc forcing notion.
<ol>
<li>Show that if \(\kappa\) is a regular cardinal in \(M\) and \(f: \omega \to \kappa\) is in \(M[G]\), then \(f \in M\). (Hint: use ccc to "predict" \(f\) from a name with countably many possibilities.)</li>
<li>Conclude that ccc forcings do not collapse \(\omega_1\).</li>
<li>Show that \(\omega_1^{M[G]} = \omega_1^M\) for any ccc forcing \(\mathbb{P}\).</li>
</ol>
</div>

<div class="example">
<strong>Problem C4.</strong> (Adding \(\aleph_2\) Cohen reals) Let \(M\) be a countable transitive model of ZFC + GCH, and let \(\mathbb{P} = \mathrm{Add}(\omega, \aleph_2^M)\) be Cohen forcing.
<ol>
<li>Show that for each \(\alpha < \aleph_2^M\), the set \(r_\alpha = \{n \in \omega : G(\alpha, n) = 1\}\) is a real in \(M[G]\).</li>
<li>Show that the map \(\alpha \mapsto r_\alpha\) is injective in \(M[G]\). (Hint: for \(\alpha \neq \beta\), show the set of conditions where \(r_\alpha\) and \(r_\beta\) differ is dense.)</li>
<li>Conclude that \(M[G] \models 2^{\aleph_0} \geq \aleph_2\).</li>
<li>Since \(\mathbb{P}\) is ccc, we have \(\aleph_2^{M[G]} = \aleph_2^M\), so \(M[G] \models 2^{\aleph_0} \geq \aleph_2 = \aleph_2^{M[G]}\), giving \(\neg\mathsf{CH}\) in \(M[G]\).</li>
</ol>
</div>

<div class="example">
<strong>Problem C5.</strong> (Collapsing cardinals) Let \(\mathbb{P} = \mathrm{Col}(\omega, \omega_1)\) be the Lévy collapse: conditions are finite partial functions \(p: \omega \to \omega_1\), ordered by extension.
<ol>
<li>Show that \(\mathbb{P}\) is not ccc. (Hint: find an uncountable antichain.)</li>
<li>Show that if \(G\) is \(M\)-generic over \(\mathbb{P}\), then \(\bigcup G: \omega \to \omega_1^M\) is a surjection, hence \(\omega_1^M\) is countable in \(M[G]\).</li>
<li>Conclude that \(\omega_1^{M[G]} < \omega_1^M\): the forcing collapses \(\omega_1\).</li>
<li>Explain why this does not contradict the ZFC theorem "\(\omega_1\) is uncountable": the statement "\(\omega_1^M\) is uncountable" is a statement about \(M\), while \(M[G]\) sees additional countable sequences not in \(M\).</li>
</ol>
</div>

## Part D: Large Cardinals — Challenge Problems (5 problems)

<div class="example">
<strong>Problem D1.</strong> (Inaccessibles and \(V_\kappa\)) Let \(\kappa\) be a strongly inaccessible cardinal.
<ol>
<li>Verify that \(V_\kappa\) satisfies each of the ZFC axioms when quantifiers are restricted to \(V_\kappa\). Be explicit about which properties of \(\kappa\) are used for each axiom.</li>
<li>Show that the statement "\(\kappa\) is inaccessible" is a \(\Pi_1\) statement (it can be expressed as a universal statement about sets of rank less than \(\kappa\)), and use this to argue that any elementary embedding \(j: V \to M\) with critical point \(\lambda\) satisfies \(j(\kappa)\) is inaccessible in \(M\).</li>
</ol>
</div>

<div class="example">
<strong>Problem D2.</strong> (Measurable cardinals and \(0^\#\)) Suppose \(\kappa\) is measurable with ultrafilter \(\mathcal{U}\).
<ol>
<li>Using Łoś's Theorem, show that the ultrapower \(j: V \to \mathrm{Ult}(V, \mathcal{U})\) is a well-defined elementary embedding.</li>
<li>Show that the critical point of \(j\) is exactly \(\kappa\): that is, \(j(\alpha) = \alpha\) for all \(\alpha < \kappa\), and \(j(\kappa) > \kappa\).</li>
<li>Show that \(j(\kappa)\) is inaccessible in \(\mathrm{Ult}(V, \mathcal{U})\), hence measurable cardinals are limits of inaccessible cardinals.</li>
</ol>
</div>

<div class="example">
<strong>Problem D3.</strong> (Woodin cardinals and stationary tower forcing) State (without full proof) the definition of a Woodin cardinal. Then:
<ol>
<li>Show that every Woodin cardinal is a limit of measurable cardinals. (Hint: for each function \(f: \delta \to \delta\), find a measurable \(\kappa < \delta\) closed under \(f\).)</li>
<li>Explain the key step of Martin–Steel: why the existence of infinitely many Woodin cardinals implies all projective sets are determined. (Sketch the "generic absoluteness" argument.)</li>
</ol>
</div>

<div class="example">
<strong>Problem D4.</strong> (PCF and singular cardinals) Assume \(2^{\aleph_n} < \aleph_\omega\) for all \(n < \omega\).
<ol>
<li>Show that \(\mathrm{cf}(\aleph_\omega^{\aleph_0}) > \aleph_\omega\) using König's theorem. (This shows \(\aleph_\omega^{\aleph_0} \neq \aleph_\omega\).)</li>
<li>Using the definition of \(\mathrm{pcf}(A)\) for \(A = \{\aleph_1, \aleph_2, \ldots\}\), explain why \(\aleph_\omega^{\aleph_0} \leq \max(\mathrm{pcf}(A))\).</li>
<li>State Shelah's theorem that \(\max(\mathrm{pcf}(\{\aleph_n : 1 \leq n < \omega\})) < \aleph_{\omega_4}\), and explain the role of the pcf generators in this bound.</li>
</ol>
</div>

<div class="example">
<strong>Problem D5.</strong> (Ultimate-L and the future of set theory) This problem asks for mathematical literacy rather than formal proof.
<ol>
<li>State Gödel's program: he hoped that large cardinal axioms would eventually decide CH. Explain why the independence of CH from ZFC + measurable cardinal (shown by Cohen's method) complicated this program.</li>
<li>Woodin's \(\Omega\)-logic is a semantic notion of logical consequence that is invariant under set-forcing. State (informally) the conjecture that \(\mathsf{CH}\) is \(\Omega\)-provable from large cardinal axioms, and what this would mean philosophically.</li>
<li>State the conjecture (Asperó–Schindler 2017, partially resolved) that Martin's Maximum\(^{++}\) is equivalent to Woodin's axiom \((*)\), and explain what this suggests about the "right" value of \(2^{\aleph_0}\) from the perspective of forcing axioms.</li>
</ol>
</div>

---

# Chapter 22: Ordinal and Cardinal Arithmetic — Deep Dives

This chapter consolidates and extends the arithmetic introduced in Chapters 2 and 3, providing additional worked examples, proofs of key structural theorems, and connections to the later forcing and large-cardinal material.

## Section 22.1: Non-Commutativity of Ordinal Multiplication

Ordinal multiplication, like ordinal addition, fails to commute in general. The failure is perhaps even more striking than for addition: whereas \(1 + \omega = \omega\) says "prepending a single point is absorbed into an \(\omega\)-sequence," the failure \(2 \cdot \omega \neq \omega \cdot 2\) says something deeper about the structure of infinite repeated concatenations.

<div class="example">
<strong>Worked example: \(\omega \cdot 2\) versus \(2 \cdot \omega\).</strong>

Recall the definition: \(\alpha \cdot \beta\) is defined by transfinite recursion on \(\beta\):

\[
\alpha \cdot 0 = 0, \quad \alpha \cdot (\beta + 1) = \alpha \cdot \beta + \alpha, \quad \alpha \cdot \lambda = \sup_{\xi < \lambda} \alpha \cdot \xi \text{ for limit } \lambda.
\]

*Computing \(\omega \cdot 2\)*:

\[
\omega \cdot 2 = \omega \cdot (1 + 1) = \omega \cdot 1 + \omega = \omega + \omega.
\]
Concretely, \(\omega \cdot 2 = \omega + \omega = \{0, 1, 2, \ldots, \omega, \omega+1, \omega+2, \ldots\}\). This is the order type of two disjoint copies of \(\omega\) placed one after the other: the first copy \(\{0, 1, 2, \ldots\}\) followed by a second copy \(\{\omega, \omega+1, \omega+2, \ldots\}\). It has no largest element and is a limit ordinal.

*Computing \(2 \cdot \omega\)*:

\[
2 \cdot \omega = \sup_{n < \omega} 2 \cdot n.
\]
Now \(2 \cdot n = n + n = 2n\) (a finite even number), so the sequence is \(0, 2, 4, 6, \ldots\). The supremum is \(\omega\). Thus \(2 \cdot \omega = \omega\).

*Summary*:

\[
\omega \cdot 2 = \omega + \omega \neq \omega = 2 \cdot \omega.
\]

*Intuition*: \(\omega \cdot 2\) means "two copies of \(\omega\)" — a genuine \(\omega + \omega\). But \(2 \cdot \omega\) means "\(\omega\) copies of 2" — and \(\omega\) pairs \(\{0,1\}, \{2,3\}, \{4,5\}, \ldots\) placed end-to-end produce an order of type \(\omega\), not \(\omega \cdot 2\). In general, \(\alpha \cdot \beta\) is the order type of \(\beta\) disjoint copies of \(\alpha\) placed in sequence; since we take the \(\beta\)-many copies in the \(\beta\)-order, it is the \(\beta\)-fold concatenation of \(\alpha\). The key asymmetry is that multiplication is "left-repeated addition": \(\omega \cdot n\) means \(n\) copies of \(\omega\), while \(n \cdot \omega\) means \(\omega\) copies of the \(n\)-element ordinal — which is just \(\omega\) itself.
</div>

<div class="example">
<strong>General pattern: \(\alpha \cdot \omega = \omega\) whenever \(\alpha\) is finite and nonzero.</strong>

For any \(n \geq 1\):

\[
n \cdot \omega = \sup_{k < \omega} n \cdot k = \sup_{k < \omega} nk = \omega,
\]
since the finite products \(n \cdot 0, n \cdot 1, n \cdot 2, \ldots = 0, n, 2n, \ldots\) are cofinal in \(\omega\). Thus "any finite positive ordinal times \(\omega\) equals \(\omega\)." By contrast, \(\omega \cdot n = \omega + \omega + \cdots + \omega\) (\(n\) times), which grows without bound as \(n \to \omega\). This illustrates why the left factor governs the "block size" and the right factor governs the "number of blocks."
</div>

## Section 22.2: The Diagonal Argument and \(2^{\aleph_0} > \aleph_0\)

Cantor's diagonal argument is the most elegant proof in all of mathematics. It deserves a fully explicit presentation.

<div class="theorem">
<strong>Cantor's Diagonal Theorem.</strong> \(2^{\aleph_0} > \aleph_0\). Equivalently, the set \(2^\omega = \{f : \omega \to \{0,1\}\}\) of all infinite binary sequences is uncountable.
</div>

<div class="proof">
Suppose for contradiction that \(2^\omega\) is countable: enumerate it as \(f_0, f_1, f_2, \ldots\) Define the **diagonal sequence** \(d: \omega \to \{0,1\}\) by

\[
d(n) = 1 - f_n(n).
\]
That is, \(d\) disagrees with \(f_n\) at position \(n\) for every \(n\). Then \(d \in 2^\omega\), but \(d \neq f_n\) for any \(n\) (since \(d(n) \neq f_n(n)\)). This contradicts the assumption that \(f_0, f_1, f_2, \ldots\) is an enumeration of all of \(2^\omega\). Therefore \(2^\omega\) is uncountable.
</div>

<div class="example">
<strong>Explicit diagonal: the first few rows.</strong>

Imagine the following (hypothetical) list of binary sequences:

\[
\begin{array}{c|cccccc}
n & 0 & 1 & 2 & 3 & 4 & \cdots \\ \hline
f_0 & \mathbf{0} & 1 & 1 & 0 & 1 & \cdots \\
f_1 & 1 & \mathbf{1} & 0 & 1 & 0 & \cdots \\
f_2 & 0 & 0 & \mathbf{1} & 1 & 1 & \cdots \\
f_3 & 1 & 1 & 0 & \mathbf{0} & 0 & \cdots \\
f_4 & 0 & 1 & 1 & 1 & \mathbf{1} & \cdots \\
\vdots & & & & & & \ddots
\end{array}
\]
The diagonal entries (bolded) are \(f_0(0) = 0, f_1(1) = 1, f_2(2) = 1, f_3(3) = 0, f_4(4) = 1, \ldots\) The diagonal sequence \(d\) flips each: \(d = 1, 0, 0, 1, 0, \ldots\) This sequence \(d\) differs from every \(f_n\) in the list, showing the list was incomplete.
</div>

<div class="remark">
The same argument shows \(|\mathbb{R}| > \aleph_0\) directly, by working with decimal expansions (with care about non-uniqueness at terminating decimals). The identification \(|\mathbb{R}| = 2^{\aleph_0} = |\mathcal{P}(\omega)|\) (via binary expansions and the bijection \(f \leftrightarrow \{n : f(n) = 1\}\)) then gives \(|\mathbb{R}| > \aleph_0 = |\mathbb{N}|\). Bridge remark: the diagonal argument is the prototype for the proof of Cantor's theorem (\(|X| < |\mathcal{P}(X)|\)) and for Gödel's diagonal lemma in incompleteness theory. It reappears in forcing as the argument that a Cohen real \(g \notin M\): for each \(r \in M\), the set \(D_r = \{s \in 2^{<\omega} : s \text{ disagrees with } r \text{ somewhere}\}\) is dense, so \(g \neq r\).
</div>

## Section 22.3: Ordinal Exponentiation and \(\varepsilon_0\)

<div class="example">
<strong>\(\omega^\omega\) as the smallest ordinal exceeding all finite towers.</strong>

By definition, \(\omega^\omega = \sup_{n < \omega} \omega^n\). We compute the first few values:

\[
\omega^0 = 1, \quad \omega^1 = \omega, \quad \omega^2 = \omega \cdot \omega, \quad \omega^3 = \omega^2 \cdot \omega, \quad \ldots
\]
Each \(\omega^n\) is a limit ordinal strictly greater than all \(\omega^k\) for \(k < n\). The ordinal \(\omega^\omega\) is then the supremum of the sequence \(1, \omega, \omega^2, \omega^3, \ldots\) — the smallest ordinal greater than each \(\omega^n\).

To visualize: \(\omega^n\) is the order type of \(n\)-tuples of natural numbers under the lexicographic order. So \(\omega^2\) consists of all pairs \((a, b)\) ordered lexicographically, \(\omega^3\) consists of all triples, etc. The ordinal \(\omega^\omega\) consists of all finite sequences of natural numbers, ordered lexicographically: first by length, then lexicographically within each length class. Every countable ordinal below \(\omega^\omega\) has a Cantor Normal Form using only finitely many \(\omega^n\) terms — \(\omega^\omega\) is the first ordinal whose normal form requires arbitrarily large exponents.
</div>

<div class="example">
<strong>The fixed point \(\varepsilon_0 = \omega^{\omega^{\omega^{\cdots}}}\).</strong>

Define a sequence \(\alpha_0 = \omega\) and \(\alpha_{n+1} = \omega^{\alpha_n}\):

\[
\alpha_0 = \omega, \quad \alpha_1 = \omega^\omega, \quad \alpha_2 = \omega^{\omega^\omega}, \quad \alpha_3 = \omega^{\omega^{\omega^\omega}}, \quad \ldots
\]
Set \(\varepsilon_0 = \sup_{n < \omega} \alpha_n\). Then:

\[
\omega^{\varepsilon_0} = \omega^{\sup_n \alpha_n} = \sup_n \omega^{\alpha_n} = \sup_n \alpha_{n+1} = \varepsilon_0.
\]
So \(\varepsilon_0\) is a fixed point of \(\alpha \mapsto \omega^\alpha\): it satisfies \(\omega^{\varepsilon_0} = \varepsilon_0\). It is the *least* such fixed point, since any fixed point \(\beta\) of \(\alpha \mapsto \omega^\alpha\) must satisfy \(\beta \geq \omega^0 = 1\), \(\beta = \omega^\beta \geq \omega\), \(\beta = \omega^\beta \geq \omega^\omega\), etc., giving \(\beta \geq \varepsilon_0\) by induction.

In proof theory, \(\varepsilon_0\) is the "proof-theoretic ordinal" of Peano Arithmetic: transfinite induction up to \(\varepsilon_0\) is exactly what PA cannot prove, but ZFC can. This gives a precise measure of the strength of first-order arithmetic relative to set theory.
</div>

## Section 22.4: The Hartogs Number and Well-Orderability

<div class="definition">
The <strong>Hartogs number</strong> \(\aleph(X)\) of a set \(X\) is the least ordinal \(\alpha\) such that there is no injection \(\alpha \hookrightarrow X\). Equivalently, \(\aleph(X)\) is the least ordinal that cannot be embedded into \(X\).
</div>

<div class="theorem">
For any set \(X\), \(\aleph(X)\) is a cardinal (the least cardinal not embeddable into \(X\)), and \(\aleph(X)\) exists without assuming AC.
</div>

<div class="proof">
The set \(\{\alpha \in \mathbf{Ord} : \exists \text{ injection } \alpha \hookrightarrow X\}\) is a set by Replacement (the injections live in \(\mathcal{P}(X \times X)\)), and is an initial segment of the ordinals, hence is an ordinal \(\alpha_0\). Set \(\aleph(X) = \alpha_0\).
</div>

<div class="example">
\(\aleph(\omega) = \omega_1\): the least ordinal not embeddable into \(\omega\) is \(\omega_1\) (the first uncountable ordinal). More generally, \(\aleph(\aleph_\alpha) = \aleph_{\alpha+1}\) under AC. Without AC, the Hartogs number provides a canonical successor operation that bypasses the need for well-ordering.
</div>

<div class="remark">
The Hartogs number is critical in the development of cardinals without AC. Under AC, every set is well-orderable and \(|X| = \aleph(X)\) iff \(X\) is an infinite cardinal. Without AC, there may be sets of incomparable cardinalities, but the Hartogs number always gives a strictly larger set. This is used in the proof of the Schröder–Bernstein theorem from trichotomy: if cardinals are linearly ordered, then every infinite cardinal has a definite successor. Bridge remark: Hartogs numbers appear in the forcing context when working in symmetric models — models where AC may fail. In such models, the Hartogs number of the set of added reals can be collapsed, producing strange cardinals.
</div>

---

# Chapter 23: Set-Theoretic Topology and the Real Line

The real line is the primary testing ground for set-theoretic questions. Many combinatorial principles — CH, MA, PFA — have beautiful and surprising consequences for the topology of \(\mathbb{R}\) and related spaces. This chapter explores those connections.

## Section 23.1: Suslin's Problem

Suslin's Problem asks whether every complete dense linear order without endpoints that satisfies the **countable chain condition** (every family of disjoint open intervals is countable) must be isomorphic to \(\mathbb{R}\). The real line itself satisfies all these hypotheses — but are there "Suslin lines" that look locally like \(\mathbb{R}\) but are not \(\mathbb{R}\)?

<div class="definition">
A <strong>Suslin line</strong> is a complete dense linear order without endpoints that satisfies the ccc but is not separable (i.e., has no countable dense subset). Equivalently, it satisfies all the hypotheses of the characterization of \(\mathbb{R}\) by Cantor except for separability.
</div>

<div class="theorem">
The existence of a Suslin line is independent of ZFC:
<ul>
<li>A Suslin line exists if and only if a Suslin tree exists.</li>
<li>Suslin trees exist in Gödel's \(L\) (indeed, \(\Diamond \Rightarrow\) Suslin tree).</li>
<li>Martin's Axiom + \(\neg\)CH implies there are no Suslin lines (Solovay–Tennenbaum, 1971).</li>
</ul>
</div>

<div class="proof">
(Sketch of the equivalence) Given a Suslin tree \(T\), form the set of maximal branches of \(T\) with the lexicographic order — this is a Suslin line. Conversely, given a Suslin line \(L\), form a tree whose nodes are closed intervals of \(L\) ordered by reverse inclusion — this is a Suslin tree. The ccc of \(L\) ensures the tree has no uncountable antichain.
</div>

<div class="remark">
The independence of Suslin's Problem was the first natural topological question shown to be independent of ZFC by forcing. It motivated the development of iterated forcing (Solovay–Tennenbaum) and is a touchstone example for the interaction between combinatorial set theory and topology. Bridge remark: The same methods (iterated ccc forcing) were later used to prove the consistency of MA + ¬CH, which in turn implies many topological regularity properties.
</div>

## Section 23.2: The Baire Category Theorem and Cardinal Characteristics

The Baire Category Theorem states that in a complete metric space, any countable intersection of dense open sets is dense. Cardinal characteristics of the continuum measure how far this result can be extended.

<div class="theorem">
<strong>Baire Category Theorem.</strong> Let \(X\) be a complete metric space (or compact Hausdorff space). If \(\{U_n : n < \omega\}\) is a countable family of dense open sets, then \(\bigcap_n U_n\) is dense.
</div>

<div class="remark">
Martin's Axiom extends this: under MA, if \(\{D_\alpha : \alpha < \kappa\}\) is a family of fewer than \(2^{\aleph_0}\) dense open sets in a compact space satisfying ccc, then \(\bigcap_\alpha D_\alpha\) is nonempty. This is precisely why MA implies that every set of reals of size \(< 2^{\aleph_0}\) is meager (it is contained in the complement of a family of fewer than \(2^{\aleph_0}\) dense open sets).

The cardinal \(\text{cov}(\mathcal{M})\) (covering number of the meager ideal) measures the minimum number of meager sets needed to cover \(\mathbb{R}\). Under ZFC alone, \(\aleph_1 \leq \text{cov}(\mathcal{M}) \leq 2^{\aleph_0}\), and MA implies \(\text{cov}(\mathcal{M}) = 2^{\aleph_0}\). This is one face of the Cichoń diagram.
</div>

## Section 23.3: Measure Theory and the Null Ideal

<div class="definition">
The <strong>Lebesgue null ideal</strong> \(\mathcal{N}\) on \(\mathbb{R}\) consists of all sets of Lebesgue measure zero. The four Cichoń characteristics of \(\mathcal{N}\) are:
<ul>
<li>\(\text{add}(\mathcal{N})\): the least \(\kappa\) such that \(\kappa\) null sets can cover a non-null set.</li>
<li>\(\text{cov}(\mathcal{N})\): the least \(\kappa\) such that \(\kappa\) null sets cover \(\mathbb{R}\).</li>
<li>\(\text{non}(\mathcal{N})\): the least cardinality of a non-null set (i.e., the least size of a set of positive outer measure).</li>
<li>\(\text{cof}(\mathcal{N})\): the cofinality of \(\mathcal{N}\) (the least size of a cofinal subfamily).</li>
</ul>
</div>

<div class="example">
<strong>Random real forcing and the null ideal.</strong> Let \(\mathbb{B}\) be the measure algebra (Borel sets modulo null sets, with the Boolean operations), ordered by \(B \leq C\) iff \(B \subseteq C\) up to a null set. This is the "random real forcing." Adding a single random real \(r\) over a ground model \(M\) produces a real that avoids every null Borel set coded in \(M\): for every Borel null set \(N \in M\), the condition "\(r \notin N\)" is forced. This is the set-theoretic explanation of why a "randomly chosen" real has measure-theoretic regularity properties. In terms of the Cichoń diagram, iterating random real forcing \(\aleph_2\) times (with countable support) produces a model where \(\text{cov}(\mathcal{N}) = \aleph_2 = 2^{\aleph_0}\) while \(\text{non}(\mathcal{N}) = \aleph_1\).
</div>

## Section 23.4: The Continuum Hypothesis and Topology

<div class="theorem">
Under CH, every separable metrizable space of size \(\leq \aleph_1 = \mathfrak{c}\) is homeomorphic to a subspace of the Cantor set \(2^\omega\). (This follows from the universality of the Cantor set for separable metrizable spaces combined with CH giving \(\aleph_1 = \mathfrak{c}\).)
</div>

<div class="theorem">
Under MA + \(\neg\)CH: there exist two sets of reals \(A, B \subseteq \mathbb{R}\), each of cardinality \(\aleph_1 < \mathfrak{c}\), whose union is not a measure-zero set. This fails under CH.
</div>

<div class="remark">
These results illustrate how the value of \(2^{\aleph_0}\) affects the topological structure of \(\mathbb{R}\). Under CH, the real line is "thin": every uncountable set is as large as possible. Under MA + \(\neg\)CH, there is a rich spectrum of intermediate cardinalities, and topological properties become more nuanced.
</div>

---

# Chapter 24: Inner Models and the Fine Structure of L

## Section 24.1: The Condensation Lemma — Full Proof

The Condensation Lemma is the key tool for proving GCH in \(L\). We give a more detailed presentation than in Chapter 13.

<div class="theorem">
<strong>Condensation Lemma.</strong> Let \(\alpha\) be an ordinal and \(M \prec (L_\alpha, \in)\) an elementary substructure. Let \(\pi: M \to \bar{M}\) be the Mostowski collapse. Then \(\bar{M} = L_\beta\) for some \(\beta \leq \alpha\).
</div>

<div class="proof">
Since \(\pi\) is the Mostowski collapse, \(\bar{M}\) is a transitive set and \(\pi\) is an isomorphism \((M, \in) \cong (\bar{M}, \in)\). The key observation is that \(\bar{M}\) is a transitive model of "\(V = L\)" (relativized to \(\bar{M}\)), because \(M \prec L_\alpha\) and \(L_\alpha\) satisfies "\(V = L\)." Since \(\bar{M}\) is transitive and satisfies "\(V = L\)," every element of \(\bar{M}\) is constructible, so \(\bar{M} \subseteq L\). Moreover, \(\bar{M}\) is closed under the constructibility operations, so it is an initial segment of the constructible hierarchy: if \(\beta = \mathbf{Ord} \cap \bar{M}\) (the ordinals of \(\bar{M}\)), then \(\bar{M} = L_\beta\).
</div>

<div class="remark">
The Condensation Lemma is what makes \(L\) so canonical. It says that any "internal view" of \(L\) that is consistent with first-order logic must itself be a level of \(L\). This is the set-theoretic analogue of the statement that any elementary substructure of a well-founded model is again well-founded — but much stronger. Bridge remark: the failure of condensation in forcing extensions (i.e., \(V[G] \not\models V = L\) typically) is precisely why forcing can produce models of \(\neg\)GCH. In a forcing extension, the Mostowski collapse of an elementary substructure need not land in \(L\), so the argument breaks down.
</div>

## Section 24.2: The Global Square \(\square_\kappa\)

<div class="definition">
Let \(\kappa\) be an uncountable cardinal. The <strong>square principle \(\square_\kappa\)</strong> asserts: there exists a sequence \(\langle C_\alpha : \alpha \in \text{Lim}(\kappa^+) \rangle\) (where \(\text{Lim}(\kappa^+)\) is the set of limit ordinals below \(\kappa^+\)) such that:
<ol>
<li>Each \(C_\alpha\) is a club in \(\alpha\).</li>
<li>If \(\text{cf}(\alpha) < \kappa\), then \(|C_\alpha| < \kappa\).</li>
<li>Coherence: if \(\beta\) is a limit point of \(C_\alpha\), then \(C_\beta = C_\alpha \cap \beta\).</li>
</ol>
Such a sequence is called a <strong>\(\square_\kappa\)-sequence</strong>.
</div>

<div class="theorem">
\(\square_\kappa\) holds in \(L\) for every regular uncountable cardinal \(\kappa\). Moreover, \(\square_\kappa\) implies that there is no Kurepa tree at \(\kappa^+\).
</div>

<div class="theorem">
The failure of \(\square_\kappa\) has large cardinal strength: if \(\square_\kappa\) fails for some regular \(\kappa\), then there exist inner models with measurable cardinals.
</div>

<div class="remark">
\(\square_\kappa\) is a "coherence" principle that imposes global order on the combinatorics of \(\kappa^+\). Its failure is closely tied to the reflection properties of large cardinals: supercompact cardinals imply the failure of many instances of \(\square\), and forcing axioms like PFA are inconsistent with \(\square_{\aleph_1}\). The interaction between \(\square\), forcing axioms, and inner models is a central theme of contemporary set theory. Bridge remark: \(\square_\kappa\) will appear again in Chapter 25 in the context of the Mitchell order and inner model theory.
</div>

## Section 24.3: Core Model Theory (Overview)

The **core model** \(K\) (or **Dodd–Jensen core model**) is a canonical inner model that extends \(L\) to accommodate measurable cardinals and beyond.

<div class="definition">
The <strong>core model</strong> \(K\) is (informally) the largest canonical inner model that does not contain too many large cardinals. More precisely, \(K\) is constructed from an **extender sequence** — a coherent system of ultrafilters encoding the large cardinal structure below some threshold.
</div>

The core model has several key properties:
<ul>
<li>\(L \subseteq K \subseteq V\).</li>
<li>\(K\) satisfies GCH.</li>
<li>Covering theorem: if there is no inner model with a measurable cardinal, then for every uncountable set \(X\) of ordinals, there exists \(Y \in K\) with \(X \subseteq Y\) and \(|Y| = |X|\).</li>
<li>The \(\square_\kappa\) holds in \(K\) for all uncountable \(\kappa\).</li>
</ul>

<div class="remark">
Core model theory is a technical and active area of research. The goal is to construct, for each level of the large cardinal hierarchy, a canonical inner model that "explains" that level. This has been achieved through measurable cardinals (Mitchell), strong cardinals (Steel), Woodin cardinals (Steel–Woodin), and is being extended toward supercompact cardinals (the "Ultimate-\(L\)" program of Woodin). Each step requires increasingly sophisticated fine structure theory and extender technology.
</div>

---

# Chapter 25: Advanced Forcing Techniques

## Section 25.1: Iterated Forcing

Single forcing extensions are powerful, but many independence results require adding many generic objects simultaneously or sequentially. Iterated forcing formalizes the process of forcing repeatedly.

<div class="definition">
A <strong>two-step forcing iteration</strong> is a pair \((\mathbb{P}, \dot{\mathbb{Q}})\) where \(\mathbb{P}\) is a forcing notion and \(\dot{\mathbb{Q}}\) is a \(\mathbb{P}\)-name for a forcing notion. The iteration \(\mathbb{P} * \dot{\mathbb{Q}}\) consists of pairs \((p, \dot{q})\) with \(p \in \mathbb{P}\) and \(\dot{q}\) a \(\mathbb{P}\)-name for a condition in \(\dot{\mathbb{Q}}\), ordered by \((p, \dot{q}) \leq (p', \dot{q}')\) iff \(p \leq p'\) and \(p \Vdash_{\mathbb{P}} \dot{q} \leq \dot{q}'\).
</div>

<div class="theorem">
If \(G * H\) is \(M\)-generic for \(\mathbb{P} * \dot{\mathbb{Q}}\), then \(G\) is \(M\)-generic for \(\mathbb{P}\) and \(H\) is \(M[G]\)-generic for \(\dot{\mathbb{Q}}^G\), and \(M[G * H] = M[G][H]\).
</div>

<div class="definition">
A <strong>finite support iteration</strong> of length \(\alpha\) is a sequence \(\langle \mathbb{P}_\beta, \dot{\mathbb{Q}}_\beta : \beta < \alpha \rangle\) where each \(\mathbb{P}_\beta\) is defined as the inverse limit of the previous stages, and conditions are functions \(p: \alpha \to V\) with finite support (finitely many non-trivial coordinates).
</div>

<div class="theorem">
<strong>Finite support iterations preserve the ccc:</strong> if each \(\dot{\mathbb{Q}}_\beta\) is forced to be ccc, then the finite support iteration of length \(\alpha\) is also ccc.
</div>

<div class="proof">
(Sketch) Suppose \(\{p_\gamma : \gamma < \omega_1\}\) is an antichain in the iteration \(\mathbb{P}_\alpha\). Since each condition has finite support, and there are only countably many possible finite sets of coordinates, by the \(\Delta\)-system lemma there is an uncountable subfamily \(A\) of conditions whose supports form a \(\Delta\)-system with root \(r\). By the ccc of each iterand, one can find compatible conditions in \(A\), contradicting the antichain property.
</div>

<div class="example">
<strong>Building a model of MA + \(\neg\)CH.</strong> Start from a model \(M\) of ZFC + GCH. Perform a finite support iteration of length \(\aleph_2^M\), at each stage adding a generic filter for a ccc poset coding one of the \(\aleph_2\) many dense sets we need to meet. The result is a model where every ccc poset with \(\aleph_1\) many dense subsets has a generic filter — that is, MA holds. Since we performed \(\aleph_2\) many stages of adding Cohen reals (at the appropriate stages), \(2^{\aleph_0} = \aleph_2\) in the extension. So MA + \(\neg\)CH holds in \(M[G]\).
</div>

## Section 25.2: Proper Forcing in Detail

<div class="definition">
A forcing notion \(\mathbb{P}\) is <strong>proper</strong> if for every sufficiently large regular cardinal \(\theta\) and every countable elementary submodel \(M \prec H(\theta)\) with \(\mathbb{P} \in M\), every condition \(p \in \mathbb{P} \cap M\) has an extension \(q \leq p\) that is \((M, \mathbb{P})\)-generic: for every dense \(D \in M\), the set \(D \cap M\) is predense below \(q\).
</div>

<div class="remark">
The definition says: a proper forcing lets us extend any condition to one that is "compatible with all the demands coming from \(M\)." Proper forcings do not collapse \(\omega_1\): the \((M, \mathbb{P})\)-generic condition ensures that the filter \(G\) will meet all dense sets in \(M\), preserving all the "small" structure of \(M\) at \(\omega_1\).

Every ccc forcing is proper (trivially), and every countably closed forcing (\(\omega\)-closed: any countable descending chain has a lower bound) is proper. The class of proper forcings is closed under countable support iterations (by Shelah's theorem), making it the natural setting for long iterations without collapsing \(\omega_1\).
</div>

<div class="example">
<strong>Sacks forcing is proper.</strong> Sacks forcing \(\mathbb{S}\) consists of all perfect trees \(T \subseteq 2^{<\omega}\) (every node has two extensions), ordered by inclusion (smaller tree = stronger condition). A generic filter \(G\) over \(\mathbb{S}\) determines a real \(r = \bigcap_{T \in G} [T]\) (the unique branch through all trees in \(G\)). Sacks forcing is proper: given a countable model \(M \prec H(\theta)\) and a Sacks condition \(T \in M\), one can construct a "fusion sequence" (a decreasing sequence of trees in \(M\) whose intersection is a perfect tree that is \((M, \mathbb{S})\)-generic). The resulting real \(r\) is a **Sacks real** or **minimal real**: it generates no intermediate degrees — any real definable from \(r\) over \(M\) is either already in \(M\) or computes \(r\).
</div>

## Section 25.3: Forcing and Stationary Sets

<div class="definition">
A forcing notion \(\mathbb{P}\) <strong>preserves stationary subsets of \(\omega_1\)</strong> if whenever \(S \subseteq \omega_1\) is stationary in the ground model, \(S\) remains stationary in any generic extension \(M[G]\).
</div>

<div class="theorem">
Any proper forcing preserves stationary subsets of \(\omega_1\). In particular, adding Cohen reals, random reals, and Sacks reals all preserve stationarity.
</div>

<div class="example">
<strong>Lévy collapse destroys stationarity.</strong> Let \(\mathbb{P} = \text{Col}(\omega, \omega_1)\) be the Lévy collapse, which collapses \(\omega_1\) to be countable. In the extension \(M[G]\), the former \(\omega_1\) is countable, so every subset of \(\omega_1^M\) becomes countable in \(M[G]\) — in particular, a set that was stationary in \(\omega_1^M\) is no longer stationary (since \(\omega_1^M\) is no longer uncountable). This is a non-proper forcing: the Lévy collapse collapses \(\omega_1\), which is the prototypical violation of properness.
</div>

<div class="theorem">
<strong>Shelah's theorem.</strong> A forcing notion \(\mathbb{P}\) is proper if and only if it does not destroy stationarity of any subset of \([\lambda]^\omega\) for any uncountable \(\lambda\).
</div>

## Section 25.4: Large Cardinals and Forcing

<div class="theorem">
<strong>Lévy–Solovay Theorem.</strong> Let \(\kappa\) be a measurable cardinal and \(\mathbb{P}\) a forcing notion with \(|\mathbb{P}| < \kappa\). Then \(\kappa\) remains measurable in any generic extension \(M[G]\). More generally, any large cardinal property expressible by an elementary embedding \(j: V \to M\) with critical point \(\kappa\) is preserved by small forcing.
</div>

<div class="proof">
(Sketch) Let \(\mathcal{U}\) be a \(\kappa\)-complete ultrafilter on \(\kappa\) in the ground model \(M\). Since \(|\mathbb{P}| < \kappa\) and \(\mathcal{U}\) is \(\kappa\)-complete, the filter \(\mathcal{U}\) generates a \(\kappa\)-complete ultrafilter in \(M[G]\): for any name \(\dot{A}\) for a subset of \(\kappa\), the set \(\{p \in G : p \Vdash \check{\alpha} \in \dot{A}\}\) is determined by the ultrafilter condition. The \(\kappa\)-completeness uses \(|\mathbb{P}| < \kappa\).
</div>

<div class="remark">
The Lévy–Solovay theorem shows that "small" forcing cannot create or destroy large cardinals. To change the large cardinal structure, one needs forcings of size at least \(\kappa\). For example, to make \(\kappa\) non-measurable, one must force with a poset of size \(\geq \kappa\) — such as the Lévy collapse \(\text{Col}(\omega, \kappa)\), which makes \(\kappa\) countable. This is the starting point for Solovay's model: collapsing an inaccessible to \(\omega_1\) gives a model where all sets of reals are Lebesgue measurable (since the former inaccessible "looks measurable" from the perspective of reals).
</div>

---

# Chapter 26: Descriptive Set Theory — Advanced Topics

## Section 26.1: Uniformization and the Axiom of Choice

<div class="definition">
A set \(P \subseteq X \times Y\) is <strong>uniformized</strong> if there exists a function \(f: \text{proj}_X(P) \to Y\) such that the graph of \(f\) is a subset of \(P\) (i.e., \((x, f(x)) \in P\) for all \(x \in \text{proj}_X(P)\)). The <strong>uniformization problem</strong> asks: for which classes of sets does uniformization hold?
</div>

<div class="theorem">
<strong>Kondo's Uniformization Theorem.</strong> Every coanalytic (\(\Pi^1_1\)) set \(P \subseteq X \times Y\) can be uniformized by a coanalytic function. More precisely, there exists a \(\Pi^1_1\) function \(f\) such that \(\text{graph}(f) \subseteq P\) and \(\text{dom}(f) = \text{proj}_X(P)\).
</div>

<div class="remark">
The uniformization theorem is a descriptive-set-theoretic form of the Axiom of Choice: rather than asserting the existence of an arbitrary choice function, it asserts the existence of a "definable" choice function. Under PD (Projective Determinacy), the uniformization theorem extends through all levels of the projective hierarchy: every \(\Pi^1_{2n+1}\) set can be uniformized by a \(\Pi^1_{2n+1}\) function, and every \(\Sigma^1_{2n}\) set can be uniformized by a \(\Sigma^1_{2n}\) function (for \(n \geq 1\)).
</div>

## Section 26.2: The Perfect Set Theorem for Analytic Sets

<div class="theorem">
<strong>Perfect Set Theorem (Suslin, 1917).</strong> Every uncountable analytic set contains a perfect subset (a nonempty closed set with no isolated points) and hence has cardinality \(2^{\aleph_0}\).
</div>

<div class="proof">
Let \(A = p[T]\) be an analytic set represented as the projection of a tree \(T \subseteq \omega^{<\omega} \times \omega^{<\omega}\). Suppose \(A\) is uncountable. We build a perfect set \(P \subseteq A\) by a Cantor-scheme argument: we construct a binary tree of finite conditions \((s_\sigma)_{\sigma \in 2^{<\omega}}\) in \(T\) such that \(s_{\sigma^\frown 0}\) and \(s_{\sigma^\frown 1}\) project to distinct elements of \(A\). The closure of the set of all projections of infinite branches through the \(s_\sigma\) is the desired perfect set. The construction uses the fact that \(T\) has uncountably many branches (since \(A\) is uncountable) and Koenig's Lemma–type arguments for splitting.
</div>

<div class="remark">
The Perfect Set Theorem implies, under ZFC alone, that every analytic set satisfies CH "locally": it is either countable or has the full cardinality of the continuum. There is no analytic set of size \(\aleph_1\) when \(\aleph_1 < 2^{\aleph_0}\). This is a partial vindication of CH for definable sets — even if CH fails globally, it holds for all projections of Borel sets. Bridge remark: Under PD, the same holds for all projective sets: every projective set is either countable or contains a perfect subset.
</div>

## Section 26.3: Wadge Degrees

<div class="definition">
For \(A, B \subseteq \omega^\omega\), we say \(A\) is <strong>Wadge reducible</strong> to \(B\) (written \(A \leq_W B\)) if there exists a continuous function \(f: \omega^\omega \to \omega^\omega\) such that \(A = f^{-1}(B)\). The <strong>Wadge degree</strong> of \(A\) is its equivalence class under mutual Wadge reducibility.
</div>

<div class="theorem">
<strong>Wadge's Lemma.</strong> Assuming AD, for any two sets \(A, B \subseteq \omega^\omega\), either \(A \leq_W B\) or \(\omega^\omega \setminus B \leq_W A\). In other words, Wadge degrees are linearly pre-ordered under AD.
</div>

<div class="theorem">
<strong>Martin–Monk Theorem.</strong> Assuming AD, the Wadge hierarchy is well-founded and of length \(\theta\) (the supremum of all ordinals onto which \(\mathbb{R}\) can be surjected).
</div>

<div class="remark">
The Wadge hierarchy is an extremely refined complexity hierarchy for subsets of \(\omega^\omega\), going far beyond the Borel and projective hierarchies. Under ZFC + AD (which is consistent), every set of reals has a precise location in this hierarchy. The Wadge degrees provide a canonical "ruler" for the complexity of definable sets of reals, and their structure is deeply connected to the combinatorics of ordinals up to \(\theta\).
</div>

---

# Chapter 27: The Set-Theoretic Multiverse

## Section 27.1: The Multiverse View of Set Theory

Traditional set theory takes a "universist" view: there is one true universe \(V\) of all sets, and the axioms of ZFC plus large cardinals describe it. But the profusion of independence results — CH, GCH, Suslin's hypothesis, the Whitehead problem, and hundreds more — has led some set theorists to advocate for a "multiverse" view.

The **set-theoretic multiverse** is the collection of all possible universes of set theory — all models of ZFC, all forcing extensions, all inner models, and all their combinations. Rather than asking "what is true?" we ask "what is true in which universes?" and study the structure of the multiverse itself.

<div class="definition">
A <strong>set-theoretic multiverse</strong> is a collection \(\mathcal{M}\) of models of ZFC closed under certain operations:
<ul>
<li>Forcing extensions: if \(M \in \mathcal{M}\) and \(G\) is \(M\)-generic for some \(\mathbb{P} \in M\), then \(M[G] \in \mathcal{M}\).</li>
<li>Inner models: if \(M \in \mathcal{M}\), then \(L^M\) (the constructible universe as computed in \(M\)) is in \(\mathcal{M}\).</li>
<li>Ground models: if \(M[G] \in \mathcal{M}\) for some generic \(G\), then \(M \in \mathcal{M}\).</li>
</ul>
</div>

## Section 27.2: Hamkins's Multiverse Axioms

Joel David Hamkins proposed a formal theory of the set-theoretic multiverse, characterized by "multiverse axioms" describing the richness and variety of the multiverse. Key axioms include:

<ul>
<li><strong>Well-foundedness mirage:</strong> Every universe appears ill-founded from the perspective of some other universe.</li>
<li><strong>Forcing extension axiom:</strong> For every universe \(M\) and every forcing \(\mathbb{P} \in M\), there is a forcing extension \(M[G] \in \mathcal{M}\).</li>
<li><strong>Ground model axiom:</strong> Every universe is a forcing extension of some inner model.</li>
<li><strong>Countability:</strong> Every universe appears countable from the perspective of some larger universe.</li>
</ul>

<div class="remark">
The multiverse view is philosophically heterodox: it denies that there is a unique "correct" universe of set theory. Hamkins argues that our intuitions about "the" universe of sets are actually intuitions about the multiverse — we naturally reason about forcing extensions and inner models, and the "truth" is spread across all universes. Critics (including Woodin) argue that the Ultimate-\(L\) program will eventually produce a canonical universe satisfying all natural mathematical principles, restoring the universist picture at a higher level of generality.
</div>

## Section 27.3: Woodin's \(\Omega\)-Logic and the Search for New Axioms

<div class="definition">
A sentence \(\varphi\) is <strong>\(\Omega\)-provable</strong> from a theory \(T\) (written \(T \vdash_\Omega \varphi\)) if for every complete Boolean algebra \(\mathbb{B}\) and every countable transitive model \(M\) of \(T\), we have \(V^\mathbb{B} \models \varphi\) (i.e., \(\varphi\) holds in every generic extension). \(\Omega\)-logic is thus the "forcing-invariant" fragment of set-theoretic reasoning.
</div>

<div class="theorem">
Under the existence of a proper class of Woodin cardinals:
<ol>
<li>The set of \(\Omega\)-provable sentences is recursively enumerable (has an explicit enumeration).</li>
<li>Every \(\Sigma^2_1\) sentence that is \(\Omega\)-consistent is \(\Omega\)-provable from ZFC + large cardinals.</li>
<li>CH is \(\Omega\)-independent of ZFC: both CH and \(\neg\)CH are \(\Omega\)-consistent.</li>
</ol>
</div>

<div class="remark">
Woodin's \(\Omega\)-conjecture asserts that \(\Omega\)-logic is complete for \(\Sigma^2_1\) sentences under large cardinal axioms: every \(\Sigma^2_1\) sentence is either \(\Omega\)-provable or \(\Omega\)-refutable. If true, this would mean that large cardinal axioms completely determine the theory of \(H(\omega_2)\) (the collection of sets hereditarily of size \(\leq \aleph_1\)), a major step toward resolving CH. The conjecture remains open but has profound implications for the foundations of set theory.
</div>

---

# Appendix C: Hints and Selected Solutions to Problem Sets

## Part A Hints

**A1.** For the second part, assume \(R_X \in X\). Then ask: is \(R_X \in R_X\)?  If \(R_X \in R_X\), then by definition of \(R_X\) (as \(\{x \in X : x \notin x\}\)), we get \(R_X \notin R_X\) — contradiction. If \(R_X \notin R_X\), then \(R_X \in X\) and \(R_X \notin R_X\), so by definition \(R_X \in R_X\) — contradiction. Either way contradicts the assumption, so \(R_X \notin X\).

**A2.** For part (2): compute \((\omega+1) \cdot n\) by induction. \((\omega+1) \cdot 1 = \omega + 1\). \((\omega+1) \cdot 2 = (\omega+1) \cdot 1 + (\omega+1) = \omega + 1 + \omega + 1 = \omega \cdot 2 + 1\) (since \(1 + \omega = \omega\)). In general, \((\omega+1) \cdot n = \omega \cdot n + 1\). Then \((\omega+1) \cdot \omega = \sup_{n < \omega} (\omega \cdot n + 1) = \sup_{n < \omega} \omega \cdot n = \omega^2\), since \(\omega \cdot n + 1 < \omega \cdot (n+1)\) and \(\sup_n \omega \cdot n = \omega^2\).

**A3.** The base cases \(\gamma = 0\): \((\alpha + \beta) + 0 = \alpha + \beta = \alpha + (\beta + 0)\). Successor: \((\alpha + \beta) + (\gamma + 1) = ((\alpha + \beta) + \gamma) + 1 = (\alpha + (\beta + \gamma)) + 1 = \alpha + ((\beta + \gamma) + 1) = \alpha + (\beta + (\gamma + 1))\). Limit: \((\alpha + \beta) + \lambda = \sup_{\xi < \lambda} ((\alpha + \beta) + \xi) = \sup_{\xi < \lambda} (\alpha + (\beta + \xi)) = \alpha + \sup_{\xi < \lambda} (\beta + \xi) = \alpha + (\beta + \lambda)\).

**A4.** For (1): use induction. \(|V_0| = |\emptyset| = 0 = \beth_0\)... wait, \(\beth_0 = \aleph_0\) and \(|V_\omega| = \aleph_0\). Adjust: \(|V_n| = n\) for finite \(n\), \(|V_\omega| = \aleph_0 = \beth_0\), \(|V_{\omega+1}| = |\mathcal{P}(V_\omega)| = 2^{\aleph_0} = \beth_1\), etc. So \(|V_{\omega+\alpha}| = \beth_\alpha\) for all \(\alpha \geq 0\).

**A5.** Replacement gives \(\text{Im}(f) = \{n^2 : n \in \omega\}\) as a set. Separation with \(\varphi(m) = \exists n \in \omega\,(m = n \cdot n)\) applied to \(\omega\) gives \(\{m \in \omega : \exists n \in \omega\,(m = n \cdot n)\}\). These are the same set: a natural number \(m\) is in the image of \(n \mapsto n^2\) iff there exists \(n\) with \(m = n^2\), i.e., iff \(m\) is a perfect square.

## Part B Hints

**B1.** For (3): use the binary expansion bijection \(\mathcal{P}(\mathbb{N}) \to [0,1]\) via \(A \mapsto \sum_{n \in A} 2^{-(n+1)}\). This is not quite a bijection (dyadic rationals have two representations), but the set of exceptions is countable, so Schröder–Bernstein applies. For (4): a continuous function is determined by its values on \(\mathbb{Q}\), giving an injection \(C(\mathbb{R}, \mathbb{R}) \hookrightarrow \mathbb{R}^\mathbb{Q}\). Since \(|\mathbb{R}^\mathbb{Q}| = (2^{\aleph_0})^{\aleph_0} = 2^{\aleph_0}\) and the constant functions give an injection \(\mathbb{R} \hookrightarrow C(\mathbb{R},\mathbb{R})\), Schröder–Bernstein gives \(|C(\mathbb{R},\mathbb{R})| = 2^{\aleph_0}\).

**B2.** For (1): König's theorem says \(\sum_{n < \omega} \aleph_n < \prod_{n < \omega} \aleph_{n+1}\), i.e., \(\aleph_\omega < \aleph_\omega^{\aleph_0}\) (a weaker form). For the specific claim that \(2^{\aleph_0} \neq \aleph_\omega\): suppose \(2^{\aleph_0} = \aleph_\omega\). Then \(2^{\aleph_0} = \aleph_\omega\), but \(\text{cf}(\aleph_\omega) = \omega\), so by König, \(\aleph_\omega^{\text{cf}(\aleph_\omega)} = \aleph_\omega^\omega > \aleph_\omega\). But \(\aleph_\omega^\omega = (2^{\aleph_0})^\omega = 2^{\aleph_0 \cdot \omega} = 2^{\aleph_0} = \aleph_\omega\), contradiction.

**B3.** For (1): by the GCH exponentiation formula, since \(\text{cf}(\aleph_\omega) = \omega \leq \aleph_1\), we are in the case \(\text{cf}(\lambda) \leq \kappa \leq \lambda\) with \(\kappa = \aleph_1\) and \(\lambda = \aleph_\omega\). Wait — the formula gives \(\kappa^\lambda = \lambda^+\) if \(\kappa \leq \text{cf}(\lambda)\) and \(\kappa^\lambda = \lambda\) if \(\text{cf}(\lambda) < \kappa \leq \lambda\). Here \(\aleph_\omega^{\aleph_1}\): \(\kappa = \aleph_\omega\), \(\lambda = \aleph_1\). Since \(\lambda = \aleph_1 < \aleph_\omega = \kappa\), this falls under the case of exponentiating a larger cardinal to a smaller one. Under GCH: \(\kappa^\lambda = \kappa^+\) if \(\text{cf}(\kappa) \leq \lambda\), i.e., \(\omega \leq \aleph_1\) — true. So \(\aleph_\omega^{\aleph_1} = \aleph_{\omega+1}\). ✓

## Part C Hints

**C1.** For (1) (ccc): any antichain in \(2^{<\omega}\) consists of pairwise incompatible strings. Two strings are incompatible iff neither extends the other. Any antichain of binary strings is countable because: map each string \(s\) of length \(n\) to the interval \([0.\underbrace{s}_n, 0.\underbrace{s}_n + 2^{-n})\) in \([0,1]\). Pairwise incompatible strings map to disjoint intervals, and \([0,1]\) contains only countably many disjoint sub-intervals (since \(\mathbb{R}\) is second-countable). For (5) (\(g \notin M\)): for each \(r \in M \cap 2^\omega\), the set \(D_r = \{s \in 2^{<\omega} : \exists n\,(s(n) \neq r(n))\}\) is dense (any string can be extended to disagree with \(r\) somewhere). Since \(G\) is \(M\)-generic, \(G \cap D_r \neq \emptyset\), so \(g = \bigcup G\) disagrees with \(r\). Since this holds for all \(r \in M\), \(g \notin M\).

**C2.** For (1): if \(p \Vdash \varphi\) and \(q \leq p\), then any generic \(G\) containing \(q\) also contains \(p\) (since \(G\) is upward closed under \(\geq\)). Since \(p \in G\) and \(p \Vdash \varphi\), the Truth Lemma gives \(M[G] \models \varphi\). Since \(G\) was arbitrary, \(q \Vdash \varphi\). For (3): given \(\varphi\), the set \(\{p : p \Vdash \varphi \text{ or } p \Vdash \neg\varphi\}\) is dense because: if \(p\) does not force \(\neg\varphi\), then there exists \(q \leq p\) forcing \(\varphi\) (by definition of forcing for negation).

## Part D Hints

**D1.** For (1): for each ZFC axiom, identify which property of \(\kappa\) is needed. Infinity: \(\omega \in V_\kappa\) since \(\kappa > \omega\). Replacement: if \(\varphi\) defines a function on a set \(x \in V_\kappa\), the image has rank \(\leq \sup_{y \in x} (\text{rank}(\varphi(y))+1)\); regularity of \(\kappa\) ensures this sup is \(< \kappa\) since it is the union of \(|x| < \kappa\) many ordinals each \(< \kappa\). Power set: for \(x \in V_\kappa\), \(\mathcal{P}(x) \in V_\kappa\) because \(|\mathcal{P}(x)| = 2^{|x|} < \kappa\) (strong limit property).

**D2.** For (2): \(j(\alpha) = \alpha\) for \(\alpha < \kappa\) because the equivalence class of the constant function \(c_\alpha: \kappa \to \{\alpha\}\) satisfies \([c_\alpha] = j(\alpha)\), and \([c_\alpha]\) computes to \(\alpha\) by Łoś's theorem and the fact that \(\alpha < \kappa\). For \(j(\kappa) > \kappa\): consider the equivalence class \([\text{id}]\) where \(\text{id}: \kappa \to \kappa\) is the identity. By Łoś, \([\text{id}] < j(\kappa) = [c_\kappa]\)... actually \(j(\kappa)\) is the equivalence class of the constant function \(c_\kappa\), and \([\text{id}] < [c_\kappa]\) because \(\{\alpha < \kappa : \text{id}(\alpha) < \kappa\} = \kappa \in \mathcal{U}\). Moreover \(\kappa = [\hat{\kappa}]\) where \(\hat{\kappa}\) is the constant-\(\kappa\) function. The actual critical point calculation uses the fact that \(j(\kappa) = [\text{id}_\kappa]\) in many standard ultrapower constructions, giving \(j(\kappa) > \kappa\).

---

# Appendix D: Notation and Conventions

The following table collects the principal notation used throughout these notes.

| Symbol | Meaning |
|--------|---------|
| \(\in\) | Set membership |
| \(\subseteq\) | Subset (not necessarily proper) |
| \(\subsetneq\) | Proper subset |
| \(\emptyset\) | Empty set |
| \(\mathcal{P}(X)\) | Power set of \(X\) |
| \(\bigcup X\) | Union of all elements of \(X\) |
| \(\bigcap X\) | Intersection of all elements of \(X\) (for \(X \neq \emptyset\)) |
| \(\omega\) | The first infinite ordinal (= set of natural numbers) |
| \(\omega_\alpha, \aleph_\alpha\) | The \(\alpha\)-th infinite cardinal |
| \(\mathbf{Ord}\) | The proper class of all ordinals |
| \(\mathbf{Card}\) | The proper class of all cardinals |
| \(V_\alpha\) | The \(\alpha\)-th level of the von Neumann hierarchy |
| \(L_\alpha\) | The \(\alpha\)-th level of the constructible hierarchy |
| \(\text{cf}(\alpha)\) | Cofinality of the ordinal/cardinal \(\alpha\) |
| \(\vert X\vert \) | Cardinality of \(X\) |
| \(\kappa^+\) | Successor cardinal of \(\kappa\) |
| \(\beth_\alpha\) | The \(\alpha\)-th beth number (\(\beth_0 = \aleph_0\), \(\beth_{\alpha+1} = 2^{\beth_\alpha}\)) |
| \(\mathfrak{c}\) | Cardinality of the continuum \(= 2^{\aleph_0}\) |
| \(\mathfrak{b}, \mathfrak{d}, \mathfrak{p}, \mathfrak{t}, \mathfrak{s}, \mathfrak{r}\) | Cardinal characteristics of the continuum |
| \(\Diamond\) | Diamond principle (Jensen) |
| \(\square_\kappa\) | Square principle at \(\kappa\) (Jensen) |
| \(p \Vdash \varphi\) | Condition \(p\) forces formula \(\varphi\) |
| \(M[G]\) | Generic extension of \(M\) by \(G\) |
| \(\text{Ult}(V, \mathcal{U})\) | Ultrapower of \(V\) by ultrafilter \(\mathcal{U}\) |
| \(j: V \to M\) | Elementary embedding (large cardinal embedding) |
| \(\text{crit}(j)\) | Critical point of elementary embedding \(j\) |
| \(\text{pcf}(A)\) | Set of possible cofinalities of products of sets in \(A\) |
| \(\Sigma^1_n, \Pi^1_n, \Delta^1_n\) | Levels of the projective hierarchy |
| \(\mathbf{\Sigma}^0_\alpha, \mathbf{\Pi}^0_\alpha\) | Levels of the Borel hierarchy |
| AD | Axiom of Determinacy |
| PD | Projective Determinacy |
| CH | Continuum Hypothesis (\(2^{\aleph_0} = \aleph_1\)) |
| GCH | Generalized Continuum Hypothesis |
| SCH | Singular Cardinal Hypothesis |
| MA | Martin's Axiom |
| PFA | Proper Forcing Axiom |
| MM | Martin's Maximum |

---

# Appendix E: Index of Major Theorems

The following index lists the major theorems, lemmas, and definitions of these notes by name and section.

| Theorem / Lemma | Section | Statement (brief) |
|-----------------|---------|-------------------|
| Extensionality Axiom | Ch.1 | Sets equal iff same members |
| Separation Schema | Ch.1 | \(\{x \in X : \varphi(x)\}\) is a set |
| Replacement Schema | Ch.1 | Image of set under class-function is a set |
| Russell's Paradox | Ch.1 | \(R = \{x:x\notin x\}\) is contradictory |
| Von Neumann Hierarchy | Ch.1 | \(V = \bigcup_\alpha V_\alpha\) covers all sets |
| Transfinite Induction | Ch.2 | Induction over all ordinals |
| Transfinite Recursion | Ch.2 | Definitions by recursion over ordinals |
| Cantor Normal Form | Ch.2 | Unique base-\(\omega\) expansion for ordinals |
| Schröder–Bernstein | Ch.3 | Two injections imply bijection |
| Cantor's Theorem | Ch.3 | \(\vert X\vert < \vert \mathcal{P}(X)\vert \) for all \(X\) |
| Cantor Diagonal Argument | Ch.3 | \(2^\omega\) is uncountable |
| König's Theorem | Ch.3 | \(\sum \kappa_i < \prod \lambda_i\) when \(\kappa_i < \lambda_i\) |
| Zorn's Lemma | Ch.5 | Equivalent to AC: maximal elements exist |
| Well-Ordering Theorem | Ch.5 | Equivalent to AC: every set well-orderable |
| Cantor–Bendixson | Ch.11 | Every closed set = perfect + countable |
| Perfect Set Theorem | Ch.11, Ch.26 | Uncountable analytic sets contain perfect subsets |
| Suslin's Theorem | Ch.11, Ch.19 | \(\Delta^1_1\) = Borel sets |
| Mostowski Collapse | Ch.12 | Well-founded extensional structure collapses to transitive set |
| Reflection Principle | Ch.12 | Every formula reflects to some \(V_\alpha\) |
| Löwenheim–Skolem | Ch.12 | Every ZFC model has countable elementary substructure |
| Condensation Lemma | Ch.13, Ch.24 | Elementary substructures of \(L_\alpha\) collapse to \(L_\beta\) |
| GCH in L | Ch.13 | \(L \models 2^{\aleph_\kappa} = \aleph_{\kappa+1}\) |
| Forcing Theorem | Ch.14 | \(M[G]\models\varphi\) iff some \(p\in G\) forces \(\varphi\) |
| Rasiowa–Sikorski | Ch.14 | Generic filters exist for countably many dense sets |
| Cohen's Theorem | Ch.14 | CH is independent of ZFC |
| ccc Preservation | Ch.14, Ch.25 | ccc forcings preserve all cardinals |
| Lévy–Solovay | Ch.25 | Small forcing preserves large cardinals |
| Łoś's Theorem | Ch.7 | Ultrapower elementarily extends base structure |
| Scott's Theorem | Ch.10 | Measurable cardinal implies \(V \neq L\) |
| Jensen's Covering | Ch.10 | If no \(0^\#\), then \(L\) covers \(V\) |
| Fodor's Lemma | Ch.8 | Regressive function on stationary set has stationary fiber |
| Solovay Splitting | Ch.8 | Every stationary set splits into \(\kappa\) stationary parts |
| Martin–Steel | Ch.17, Ch.19 | \(\infty\) Woodin cardinals \(\Rightarrow\) PD |
| Silver's Theorem | Ch.21 | GCH cannot first fail at a singular of uncountable cofinality |
| Shelah's Bound | Ch.21 | \(\aleph_\omega^{\aleph_0} < \aleph_{\omega_4}\) |
| Malliaris–Shelah | Ch.20 | \(\mathfrak{p} = \mathfrak{t}\) |
| Borel Determinacy | Ch.19 | Every Borel game is determined (Martin, ZFC) |
| Kondo Uniformization | Ch.26 | Every \(\Pi^1_1\) set uniformizable by a \(\Pi^1_1\) function |
| Wadge's Lemma | Ch.26 | Under AD, Wadge degrees are linearly ordered |

---

# Chapter 28: Model-Theoretic Tools in Set Theory

Set theory and model theory are deeply intertwined. The tools of model theory — elementary embeddings, compactness, Löwenheim–Skolem — both motivate and are used in set-theoretic arguments. This chapter collects the principal model-theoretic ideas used throughout these notes and develops them further.

## Section 28.1: Elementarity and the Tarski–Vaught Test

<div class="definition">
Let \((M, \in)\) and \((N, \in)\) be structures for the language of set theory. A function \(j: M \to N\) is an <strong>elementary embedding</strong> if for every formula \(\varphi(x_1, \ldots, x_n)\) and every \(a_1, \ldots, a_n \in M\):

\[
M \models \varphi(a_1, \ldots, a_n) \iff N \models \varphi(j(a_1), \ldots, j(a_n)).
\]
We write \(j: M \prec N\) to indicate that \(j\) is an elementary embedding.
</div>

<div class="theorem">
<strong>Tarski–Vaught Test.</strong> A substructure \(M \subseteq N\) (in the sense of the language of set theory) is an elementary substructure \(M \prec N\) if and only if: for every formula \(\varphi(x, y_1, \ldots, y_n)\) and \(a_1, \ldots, a_n \in M\), if \(N \models \exists x\, \varphi(x, a_1, \ldots, a_n)\), then there exists \(b \in M\) with \(N \models \varphi(b, a_1, \ldots, a_n)\).
</div>

<div class="proof">
(\(\Rightarrow\)) If \(M \prec N\) and \(N \models \exists x\,\varphi(x,\vec{a})\) for \(\vec{a} \in M\), then \(M \models \exists x\,\varphi(x,\vec{a})\) (by elementarity), so there exists \(b \in M\) with \(M \models \varphi(b,\vec{a})\), hence \(N \models \varphi(b,\vec{a})\). (\(\Leftarrow\)) Induction on the complexity of \(\varphi\). The only non-trivial case is the existential quantifier, which is handled exactly by the Tarski–Vaught condition.
</div>

<div class="example">
<strong>Elementary chains.</strong> Suppose \(M_0 \prec M_1 \prec M_2 \prec \cdots\) is an elementary chain of transitive models of ZFC. Then the union \(M_\omega = \bigcup_{n < \omega} M_n\) is also a model of ZFC, and \(M_n \prec M_\omega\) for each \(n\). This is the **Elementary Chain Lemma** and is used, for example, to build "long" forcing iterations: at limit stages, take the union of the elementary chain of ground models and intermediate extensions.
</div>

## Section 28.2: The Compactness Theorem and Its Set-Theoretic Uses

<div class="theorem">
<strong>Compactness Theorem.</strong> A first-order theory \(T\) has a model if and only if every finite subset of \(T\) has a model.
</div>

<div class="example">
<strong>Non-standard models of arithmetic.</strong> Let \(T = \text{PA} \cup \{c > n : n \in \omega\}\), where \(c\) is a new constant and each "\(c > n\)" is a sentence asserting \(c\) exceeds the \(n\)-th numeral. Every finite subset of \(T\) has a model (take the standard natural numbers and interpret \(c\) as a sufficiently large number). By Compactness, \(T\) has a model — a non-standard model of arithmetic containing an element \(c\) larger than every standard natural number. This is the prototypical application of Compactness: by adding infinitely many sentences forcing a new element to exist, we produce a "non-standard" object that cannot exist in the intended structure.

The same trick is used in set theory: add sentences asserting the existence of a transitive model of ZFC containing a specific sequence of large cardinals, and use compactness to deduce the existence of such a model. This is the basis of the "reflection argument" for large cardinals.
</div>

<div class="example">
<strong>Compactness and large cardinals.</strong> Let \(T = \text{ZFC} \cup \{\text{"there exists an inaccessible cardinal"}\} \cup \{\text{"}\kappa\text{ is not inaccessible"} : \kappa < \alpha\}\) for each ordinal \(\alpha\). If each finite subset of \(T\) has a model, then by Compactness, \(T\) has a model — a model of ZFC with an inaccessible cardinal above all "small" ordinals, giving a model with a "very large" inaccessible. This shows that if inaccessibles exist, there are "many" of them (in various non-standard models). The same argument, applied more carefully, gives models with arbitrarily large inaccessibles from a single one.
</div>

## Section 28.3: Löwenheim–Skolem and Skolem's Paradox

<div class="theorem">
<strong>Upward Löwenheim–Skolem.</strong> If a theory \(T\) has an infinite model, then for every cardinal \(\kappa \geq |T| + \aleph_0\), \(T\) has a model of size \(\kappa\).
</div>

<div class="theorem">
<strong>Downward Löwenheim–Skolem.</strong> If \(M\) is a model of a theory \(T\) of size \(\kappa\) and \(A \subseteq M\) with \(|A| \leq \lambda \leq \kappa\), then there exists an elementary substructure \(N \prec M\) with \(A \subseteq N\) and \(|N| = \lambda\).
</div>

<div class="remark">
<strong>Skolem's Paradox.</strong> By the Downward Löwenheim–Skolem theorem applied to ZFC, there exists a countable transitive model \(M\) of ZFC. But ZFC proves the existence of uncountable sets (e.g., \(\mathbb{R}\)). So \(M \models \text{"}\mathbb{R}\text{ is uncountable"}\). Yet \(M\) itself is countable from the outside — \(M\) contains only countably many elements!

The resolution: "uncountable" is a relative notion. \(M \models \text{"}\mathbb{R}\text{ is uncountable"}\) means there is no bijection \(\omega \to \mathbb{R}^M\) in \(M\). But from outside \(M\), we can see that \(M\) is countable — we just cannot "see" any bijection \(\omega \to \mathbb{R}^M\) that is an element of \(M\). The bijection exists in \(V\), but not in \(M\), so \(M\) correctly (from its own perspective) sees \(\mathbb{R}^M\) as uncountable.

This is the foundational insight behind forcing: a Cohen generic real \(g\) is "new" relative to \(M\) because \(g \notin M\), even though from outside \(M\) (i.e., from \(V\)), \(g\) is just another element of \(2^\omega\). The model \(M[G]\) "knows about" \(g\) and is therefore a larger universe.
</div>

## Section 28.4: Ehrenfeucht–Mostowski Models and Indiscernibles

<div class="definition">
Let \(M\) be a structure and \(I \subseteq M\) an ordered set. A sequence \((a_i)_{i \in I}\) of elements of \(M\) is a <strong>set of indiscernibles</strong> for \(M\) if for any formula \(\varphi(x_1, \ldots, x_n)\) and any two increasing sequences \(i_1 < \cdots < i_n\) and \(j_1 < \cdots < j_n\) from \(I\):

\[
M \models \varphi(a_{i_1}, \ldots, a_{i_n}) \iff M \models \varphi(a_{j_1}, \ldots, a_{j_n}).
\]
</div>

<div class="theorem">
<strong>Ehrenfeucht–Mostowski Theorem.</strong> Let \(T\) be a theory with an infinite model and \(I\) any linearly ordered set. Then there is a model of \(T\) that contains a set of indiscernibles of order type \(I\).
</div>

<div class="example">
<strong>Silver indiscernibles and \(0^\#\).</strong> In the theory of \(L\), the **Silver indiscernibles** are an uncountable set \(I \subset \mathbf{Ord}\) such that: for any formula \(\varphi(x_1, \ldots, x_n)\) and increasing sequences from \(I\), \(L \models \varphi(a_{i_1}, \ldots, a_{i_n})\) iff \(L \models \varphi(a_{j_1}, \ldots, a_{j_n})\). The existence of Silver indiscernibles for \(L\) is equivalent to the existence of \(0^\#\) (zero-sharp). The set of formulas true of increasing indiscernibles in \(L\) is the complete theory of the Silver indiscernibles, encoded as a real — this is \(0^\#\). Its existence implies \(V \neq L\) (since \(L\) cannot define its own indiscernibles).
</div>

---

# Chapter 29: Applications of Set Theory in Mathematics

## Section 29.1: Algebra — Whitehead Groups and Shelah's Theorem

<div class="definition">
An abelian group \(A\) is a <strong>Whitehead group</strong> if \(\text{Ext}^1(A, \mathbb{Z}) = 0\), i.e., every short exact sequence \(0 \to \mathbb{Z} \to B \to A \to 0\) splits. Free abelian groups are Whitehead. The **Whitehead Problem** asks: is every Whitehead group free?
</div>

<div class="theorem">
<strong>Shelah (1974).</strong> The Whitehead Problem is independent of ZFC:
<ul>
<li>Assuming V = L (or just \(\Diamond\)), every Whitehead group of cardinality \(\aleph_1\) is free.</li>
<li>Assuming MA + \(\neg\)CH, there exists a non-free Whitehead group of cardinality \(\aleph_1\).</li>
</ul>
</div>

<div class="remark">
Shelah's theorem was the first algebraic statement shown to be independent of ZFC, and it remains one of the most striking applications of set-theoretic methods to "classical" mathematics. The proof under MA uses the fact that MA provides generic filters for the right posets; the proof under \(\Diamond\) uses \(\Diamond\)-sequences to build a free resolution. This showed that the Axiom of Choice and its refinements (like \(\Diamond\)) are not just foundational abstractions — they have concrete algebraic consequences.
</div>

## Section 29.2: Analysis — The Banach–Tarski Paradox

<div class="theorem">
<strong>Banach–Tarski Paradox.</strong> There exists a decomposition of the unit ball \(B^3 \subset \mathbb{R}^3\) into finitely many pieces that can be reassembled (using rotations and translations) into two copies of \(B^3\).
</div>

<div class="proof">
(Outline) The proof uses the Axiom of Choice to pick representatives from orbits under a free group action on the sphere \(S^2\). The free group \(F_2 = \langle a, b \rangle\) acts on \(S^2\) by rotations (choosing \(a\) and \(b\) to generate a free group of rotations), partitioning \(S^2\) into orbits. Use AC to pick one representative from each orbit. The Hausdorff paradox (the precursor to Banach–Tarski) shows \(S^2\) can be decomposed into four pieces \(A, B, C, D\) with \(A \cup B \cup C \equiv B \cup C\) and \(A \equiv D\). This gives the decomposition of the sphere, and the ball follows.
</div>

<div class="remark">
The Banach–Tarski paradox shows that the Axiom of Choice implies the existence of non-measurable sets in \(\mathbb{R}^3\) — indeed, the pieces of the Banach–Tarski decomposition cannot all be Lebesgue measurable. Solovay's theorem (1970) shows that in a model where all sets of reals are Lebesgue measurable (built by collapsing an inaccessible), the Banach–Tarski paradox fails. More precisely, DC (Dependent Choice) is consistent with "all sets of reals are measurable," but full AC is not. This illustrates the trade-off between the Axiom of Choice and measurability.
</div>

## Section 29.3: Topology — The Normal Moore Space Conjecture

<div class="definition">
A topological space \(X\) is <strong>normal</strong> if any two disjoint closed sets can be separated by disjoint open sets. It is a <strong>Moore space</strong> if it has a development: a sequence of open covers \(\mathcal{G}_n\) such that for each \(x \in X\) and open \(U \ni x\), there exists \(n\) with \(\{G \in \mathcal{G}_n : x \in G\} \subseteq U\).
</div>

The **Normal Moore Space Conjecture (NMSC)** asserts that every normal Moore space is metrizable. It was a major open problem in topology from the 1930s to the 1980s.

<div class="theorem">
The Normal Moore Space Conjecture is independent of ZFC:
<ul>
<li>Under MA + \(\neg\)CH, every separable normal Moore space is metrizable (a partial result).</li>
<li>Under certain forcing extensions (adding \(\aleph_2\) many Cohen reals to a model with a measurable cardinal), NMSC holds.</li>
<li>Under \(V = L\), there exist non-metrizable normal Moore spaces (constructed using a \(\Diamond^+\)-sequence).</li>
</ul>
</div>

<div class="remark">
The proof that NMSC is consistent (Nyikos, 1980) requires the consistency of a measurable cardinal — the first topological theorem to have such a strong large cardinal requirement. This was a major advance in the application of set theory to topology and demonstrated that large cardinal axioms can have concrete topological consequences. The proof uses a forcing extension that adds many reals while preserving the measurable cardinal structure.
</div>

## Section 29.4: Analysis — Every Set of Reals is Measurable (Solovay's Model)

<div class="theorem">
<strong>Solovay's Theorem (1970).</strong> Assume the existence of an inaccessible cardinal \(\kappa\). Then there is a model of ZF + DC in which every set of reals is Lebesgue measurable, has the Baire property, and has the perfect set property.
</div>

<div class="proof">
(Sketch) Start from a model \(M\) with an inaccessible \(\kappa\). Perform the Lévy collapse \(\text{Col}(\omega, {<}\kappa)\): conditions are finite partial functions assigning to each ordinal \(\alpha < \kappa\) a countable ordinal, ordered by extension. This forces \(\kappa\) to become \(\omega_1\) in the extension \(M[G]\). Now pass to the submodel \(N = L(\mathbb{R})^{M[G]}\) (the smallest model of ZF containing \(\mathbb{R}^{M[G]}\)). In \(N\): every set of reals is definable from a real and an ordinal, and the collapse of \(\kappa\) ensures every such set is measurable (using the fact that the Lévy collapse is "homogeneous" — the generic behaves symmetrically over the ground model, allowing a measure-theoretic averaging argument).
</div>

<div class="remark">
Solovay's model shows that the non-measurable sets produced by AC (like the Vitali set and the Banach–Tarski pieces) are not provably necessary — they can be eliminated by working in ZF + DC with a different choice of axioms. The inaccessible cardinal is known to be necessary: Shelah showed that the consistency of "every set of reals is measurable" (over ZF + DC) implies the consistency of an inaccessible cardinal. This is one of the deepest consistency strength calibrations in descriptive set theory: the "correct" axioms for analysis (measurability of all sets of reals) require exactly an inaccessible cardinal.
</div>

---

# Chapter 30: Open Problems and Current Research Frontiers

## Section 30.1: The Inner Model Problem

The central open problem in inner model theory is:

**The Inner Model Problem for a Supercompact Cardinal:** Construct a canonical inner model \(L[\vec{E}]\) that contains a supercompact cardinal, satisfies GCH, and has a fine structure theory analogous to Jensen's fine structure for \(L\).

This is Woodin's "Ultimate-\(L\)" program. The conjecture is:

<div class="definition">
<strong>Woodin's Ultimate-\(L\) Conjecture.</strong> There exists a canonical inner model \(L_{\text{ult}}\) (\text{Ultimate-}L) satisfying:
<ol>
<li>\(L_{\text{ult}} \models\) GCH.</li>
<li>\(L_{\text{ult}}\) contains a supercompact cardinal.</li>
<li>\(V = L_{\text{ult}}\) is \(\Omega\)-consistent with all large cardinal axioms (i.e., forcing over \(L_{\text{ult}}\) cannot produce large cardinals inconsistent with those already present).</li>
<li>If \(V = L_{\text{ult}}\), then CH holds.</li>
</ol>
</div>

If the Ultimate-\(L\) conjecture is correct, it would resolve CH in favor of GCH — the universe of sets, at its canonical core, satisfies the Continuum Hypothesis. Woodin believes this program is on the verge of completion (as of 2020s), though the full construction remains incomplete.

## Section 30.2: The \(\mathfrak{p} = \mathfrak{t}\) Theorem and Keisler's Order

The theorem \(\mathfrak{p} = \mathfrak{t}\) (Malliaris–Shelah, 2016) was proved using an unexpected tool: **Keisler's order**, a pre-order on theories based on the saturation of their ultrapowers.

<div class="definition">
<strong>Keisler's Order.</strong> For complete theories \(T_1\) and \(T_2\), we say \(T_1 \leq_K T_2\) (in Keisler's order) if for every regular ultrafilter \(\mathcal{D}\) on \(\omega\) and every pair of models \(M_1 \models T_1\), \(M_2 \models T_2\), if \(M_2^\omega/\mathcal{D}\) is \(\aleph_1\)-saturated then so is \(M_1^\omega/\mathcal{D}\).
</div>

The proof of \(\mathfrak{p} = \mathfrak{t}\) goes: the equality is equivalent to saying that certain ultrafilters (called "OK" ultrafilters) are exactly the regular ultrafilters. This equivalence is proved by analyzing the Keisler order position of the theory of dense linear orders, which is the minimum theory in Keisler's order. The deep model theory of ultrafilters — specifically, the distinction between "good" and "OK" ultrafilters — turns out to capture exactly the combinatorial distinction between \(\mathfrak{p}\) and \(\mathfrak{t}\).

## Section 30.3: The Cichoń Maximum

<div class="definition">
The <strong>Cichoń maximum</strong> is the model in which all four characteristics of the null ideal and all four of the meager ideal are pairwise distinct (and the Cichoń diagram is "saturated" with no unexpected equalities).
</div>

<div class="theorem">
<strong>Goldstern–Kellner–Mejía–Shelah (2017).</strong> It is consistent that all ten characteristics in the Cichoń diagram are pairwise distinct:

\[
\aleph_1 < \text{add}(\mathcal{N}) < \text{cov}(\mathcal{N}) < \mathfrak{b} < \text{non}(\mathcal{M}) < \text{cov}(\mathcal{M}) < \mathfrak{d} < \text{non}(\mathcal{N}) < \text{cof}(\mathcal{N}) < 2^{\aleph_0}.
\]
</div>

<div class="proof">
(Outline) The proof uses a sophisticated finite support iteration using three different types of reals — Cohen reals, random reals, and Hechler reals — at different stages of the iteration, combined with careful tracking of which forcing adds which reals and how these affect the cardinal characteristics. The key technical innovation is the use of "creature forcing" (a flexible framework for adding reals with prescribed combinatorial properties) to control all ten characteristics simultaneously.
</div>

## Section 30.4: The HOD Conjecture

<div class="definition">
The <strong>HOD Conjecture</strong> (Woodin) asserts: assuming the existence of an extendible cardinal, there is a supercompact cardinal \(\kappa\) such that \(V_\kappa \subseteq \text{HOD}\). Equivalently, every set of rank \(< \kappa\) is ordinal definable.
</div>

If the HOD Conjecture holds, then HOD and \(V\) are "close" near the supercompact cardinal, and many set-theoretic questions become decidable. The conjecture would imply that assuming large cardinals, the set-theoretic universe converges toward a canonical form — contrary to the multiverse view.

Woodin has announced a proof of the HOD Conjecture from appropriate large cardinal hypotheses (as of early 2020s), but the details remain under verification by the community.

## Section 30.5: Cardinal Arithmetic at Singular Cardinals

<div class="remark">
Despite Shelah's PCF theory, many questions about singular cardinal arithmetic remain open:
<ul>
<li>Can \(\text{pp}(\aleph_\omega) = \aleph_{\omega_1}\)? (pp = pseudopower; consistent upper bounds of \(\aleph_{\omega_4}\) are known, but the true maximum is unclear.)</li>
<li>Is it consistent that \(\aleph_\omega^{\aleph_0} = \aleph_{\omega+1}\) (i.e., GCH holds at \(\aleph_\omega\)) together with the failure of SCH at some other singular cardinal?</li>
<li>What is the exact consistency strength of the failure of SCH at \(\aleph_{\omega_1}\)?</li>
</ul>
These questions are at the frontier of PCF theory and large cardinal theory, requiring both sophisticated forcing techniques and inner model theory.
</div>

---

# Final Remarks: The Unity of Set Theory

We close with a reflection on the remarkable unity of the material covered in this course. What appears at first glance to be a collection of unrelated topics — ordinals, cardinals, forcing, large cardinals, descriptive set theory — is in fact a tightly woven tapestry.

The **ordinal hierarchy** (Chapter 2) provides the backbone along which everything else is built. The **cumulative hierarchy** \(V = \bigcup_\alpha V_\alpha\) (Chapter 1) gives a stratification of all mathematical objects. The **cardinal hierarchy** (Chapter 3) measures the sizes of these levels and leads immediately to the central problem of the course: what is the relationship between \(\aleph_1\) and \(2^{\aleph_0}\)?

**Forcing** (Chapter 14) answers: both \(\aleph_1 = 2^{\aleph_0}\) (under GCH) and \(\aleph_2 = 2^{\aleph_0}\) (Cohen's model) are consistent. But forcing is not just a tool for independence results — it is a universe-building machine, producing new models with rich properties.

**Large cardinals** (Chapters 10, 17) provide the consistency strength backbone: they are what makes forcing extensions "rich" in a controlled way, and they imply structural regularity properties (like determinacy for projective sets) that ZFC alone cannot provide.

**Descriptive set theory** (Chapters 11, 19, 26) makes this regularity concrete: under large cardinal axioms, all projective sets of reals are measurable, have the Baire property, and are determined. These are the precise mathematical consequences of placing the universe "high" in the large cardinal hierarchy.

**Inner models** (Chapter 13, 24) provide the "skeleton": canonical minimal models that satisfy GCH and contain exactly as many large cardinals as prescribed. The **core model** program seeks to build, for each large cardinal, a canonical inner model that "explains" it — just as \(L\) explains the universe without large cardinals.

The **forcing axioms** (Chapter 18) represent another extreme: rather than restricting to minimal models, they assert that the universe is as "generic" as possible — as rich as if many generic objects had been added. MA, PFA, and MM push the universe toward a canonical "maximal" form, in opposition to the canonical "minimal" form of \(L\).

The deep conjecture of Woodin's Ultimate-\(L\) program is that these two extremes converge: the "correct" universe satisfies both "enough large cardinals" and "GCH" — and therefore resolves all outstanding questions including CH. Whether this vision is realized will be the defining question of set theory in the coming decades.

This course has given you the tools to understand — and perhaps contribute to — this profound inquiry into the nature of mathematical infinity.

\[
\star \quad \star \quad \star
\]

---

# Appendix F: Glossary of Key Terms

The following definitions provide quick reference for the major concepts introduced throughout the course.

**Absolute formula.** A formula \(\varphi\) is absolute for a transitive model \(M\) if \(\varphi\) holds in \(M\) exactly when it holds in \(V\). All \(\Delta_0\) formulas are absolute; \(\Sigma_1\) formulas are upward absolute; \(\Pi_1\) formulas are downward absolute.

**Aleph numbers.** The alephs \(\aleph_0, \aleph_1, \aleph_2, \ldots\) are the infinite cardinals in increasing order. \(\aleph_0 = \omega\) is the smallest infinite cardinal; \(\aleph_{\alpha+1} = \omega_{\alpha+1}\) is the successor of \(\aleph_\alpha\); for limit \(\lambda\), \(\aleph_\lambda = \sup_{\alpha < \lambda} \aleph_\alpha\).

**Antichain.** In a partial order, a set of pairwise incompatible elements. The countable chain condition (ccc) requires every antichain to be countable.

**Beth numbers.** The beths \(\beth_0 = \aleph_0\), \(\beth_{\alpha+1} = 2^{\beth_\alpha}\), and \(\beth_\lambda = \sup_{\alpha < \lambda} \beth_\alpha\) for limit \(\lambda\). Under GCH, \(\beth_\alpha = \aleph_\alpha\) for all \(\alpha\).

**Cardinal.** An ordinal \(\kappa\) not in bijection with any smaller ordinal. Every infinite cardinal is a limit ordinal. The finite cardinals are the natural numbers.

**Closed unbounded (club).** A subset \(C\) of a regular uncountable cardinal \(\kappa\) that is unbounded in \(\kappa\) and closed under limits below \(\kappa\).

**Cofinality.** The cofinality \(\text{cf}(\alpha)\) of a limit ordinal \(\alpha\) is the least ordinal \(\delta\) such that there is an unbounded function \(f: \delta \to \alpha\). A cardinal \(\kappa\) is regular if \(\text{cf}(\kappa) = \kappa\).

**Condition.** An element of a forcing poset. Conditions represent "finite approximations" to the generic object being added. Stronger conditions (lower in the order) provide more information.

**Constructible universe (\(L\)).** The smallest inner model of ZFC, defined by \(L = \bigcup_\alpha L_\alpha\) where \(L_0 = \emptyset\), \(L_{\alpha+1} = \text{Def}(L_\alpha)\) (definable subsets of \(L_\alpha\)), and \(L_\lambda = \bigcup_{\alpha < \lambda} L_\alpha\) for limits. \(L \models \text{GCH}\).

**Dense set.** In a forcing poset, a set \(D\) such that every condition has an extension in \(D\).

**Elementary embedding.** A map \(j: M \to N\) preserving all first-order formulas. An elementary embedding is a "truth-preserving" map between models. Large cardinals are characterized by the existence of non-trivial elementary embeddings.

**Filter (on a poset).** A non-empty upward-closed set closed under finite meets (greatest lower bounds). A generic filter meets every dense set in the ground model.

**Forcing.** Cohen's technique for building new models of ZFC by adjoining a generic object \(G\) to a ground model \(M\), producing \(M[G]\). The forcing relation \(p \Vdash \varphi\) encodes what is "forced" to be true in \(M[G]\).

**Generic filter.** An \(M\)-generic filter for a poset \(\mathbb{P}\) is a filter \(G \subseteq \mathbb{P}\) meeting every dense set that is an element of \(M\).

**HOD.** Hereditarily ordinal definable sets: the inner model of all sets whose entire transitive closure consists of ordinal-definable sets. \(L \subseteq \text{HOD} \subseteq V\), and \(\text{HOD} \models \text{AC}\).

**Inaccessible cardinal.** An uncountable regular strong limit cardinal \(\kappa\): \(\text{cf}(\kappa) = \kappa\) and \(2^\lambda < \kappa\) for all \(\lambda < \kappa\). The level \(V_\kappa\) of the cumulative hierarchy satisfies all of ZFC.

**Inner model.** A transitive class \(M\) containing all ordinals and satisfying ZFC (with quantifiers restricted to \(M\)). Inner models include \(L\), \(\text{HOD}\), and models \(L[\vec{E}]\) built from extender sequences.

**Large cardinal.** A cardinal whose existence cannot be proved in ZFC but whose consistency is generally assumed. Large cardinals form a well-ordered hierarchy by consistency strength: inaccessible, Mahlo, weakly compact, measurable, strong, Woodin, supercompact, extendible, huge, rank-into-rank.

**Measurable cardinal.** A cardinal \(\kappa\) admitting a non-principal \(\kappa\)-complete ultrafilter. Equivalently, there is an elementary embedding \(j: V \to M\) with critical point \(\kappa\). Measurable cardinals imply \(V \neq L\) (Scott's theorem).

**Ordinal.** A transitive set well-ordered by membership. The ordinals are \(0 = \emptyset\), \(1 = \{0\}\), \(2 = \{0,1\}\), \(\ldots, \omega, \omega+1, \ldots, \omega \cdot 2, \ldots, \omega^\omega, \ldots\). Each ordinal is the set of all smaller ordinals.

**PCF (possible cofinalities).** For a set \(A\) of regular cardinals with \(|A| < \min(A)\), \(\text{pcf}(A) = \{\text{cf}(\prod A / D) : D\text{ is an ultrafilter on }A\}\). PCF theory governs singular cardinal arithmetic.

**Projective determinacy (PD).** The assertion that every two-player game on \(\omega\) with a projective winning condition is determined (one player has a winning strategy). Follows from infinitely many Woodin cardinals; implies all projective sets are measurable and have the Baire property.

**Rank.** The rank of a set \(x\) is the least ordinal \(\alpha\) with \(x \in V_{\alpha+1}\). Every set has a rank by the Axiom of Regularity.

**Regular cardinal.** A cardinal \(\kappa\) with \(\text{cf}(\kappa) = \kappa\). Successor cardinals are always regular (under AC); limit cardinals may or may not be.

**Stationary set.** A subset \(S\) of a regular uncountable cardinal \(\kappa\) that intersects every club in \(\kappa\). The club filter on \(\kappa\) is dual to the non-stationary ideal.

**Transitive set.** A set \(M\) such that every element of an element of \(M\) is itself an element of \(M\): \(x \in y \in M \Rightarrow x \in M\). Transitive sets are the natural "building blocks" for models of set theory.

**Ultrafilter.** A maximal filter; equivalently, a filter \(\mathcal{U}\) on a set \(I\) such that for every \(A \subseteq I\), either \(A \in \mathcal{U}\) or \(I \setminus A \in \mathcal{U}\). Non-principal ultrafilters (whose existence requires AC) are the foundation of ultrapower constructions.

**Well-ordering.** A linear order in which every non-empty subset has a least element. The ordinals are canonical representatives for well-order types. By the Well-Ordering Theorem (equivalent to AC), every set can be well-ordered.

**Woodin cardinal.** An uncountable cardinal \(\delta\) such that for every function \(f: \delta \to \delta\), there is a cardinal \(\kappa < \delta\) closed under \(f\) and an elementary embedding \(j: V \to M\) with critical point \(\kappa\) and \(V_{j(f)(\kappa)} \subseteq M\). Infinitely many Woodin cardinals imply projective determinacy.

**ZFC.** Zermelo–Fraenkel set theory with the Axiom of Choice. The standard foundation for mathematics, consisting of the axioms of Extensionality, Empty Set, Pairing, Union, Power Set, Separation, Replacement, Infinity, Regularity, and Choice. All of ordinary mathematics can be formalized within ZFC.

---

*These notes cover the material of PMATH 434 (Set Theory) at the University of Waterloo. The primary reference is Jech's* Set Theory *(3rd ed., Springer, 2003). For forcing, see Kunen's* Set Theory *or Chow's* A Beginner's Guide to Forcing. *For large cardinals, see Kanamori's* The Higher Infinite *(2nd ed., Springer, 2003).*
