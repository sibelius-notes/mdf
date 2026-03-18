---
title: "PMATH 450"
prof: "Stephen New"
---

# PMATH 450: Lebesgue Integration and Fourier Analysis

These notes cover PMATH 450 (Spring 2018), taught by Prof. Stephen New. The course develops the Lebesgue theory of integration on the real line, culminating in the \(L^p\) spaces, Hilbert space theory, and Fourier analysis. The primary source is Prof. New's own typed lecture notes; Chapter 5 on Fourier series draws from Calvin Kent's student notes, since Prof. New deferred that material to the textbook (*Real Analysis* by Bruckner, Bruckner, and Thomson, §§15.1–15.5, 15.11).

---

# Chapter 1: Lebesgue Measure

The Lebesgue theory begins by assigning a "size" — a measure — to subsets of \(\mathbb{R}\) in a way that extends the familiar notion of length for intervals, is countably additive, and is well-behaved under limits. The classical **Jordan content** fails for countable sets; the Lebesgue measure fixes this by allowing countably infinite covers.

## Jordan Outer Content and Content

**1.1 Definition.** When \(I\) is a bounded interval \((a,b)\), \([a,b)\), \((a,b]\), or \([a,b]\) with \(a \leq b\), we define \(|I| = b - a\). For unbounded intervals we set \(|I| = \infty\).

**1.2 Definition.** For a bounded set \(A \subseteq \mathbb{R}\), the **Jordan outer content** of \(A\) is
\[
  c^*(A) = \inf\!\left\{ \sum_{k=1}^{n} |I_k| \;\middle|\; n \in \mathbb{Z}^+,\, \text{each } I_k \text{ is a bounded open interval, and } A \subseteq \bigcup_{k=1}^{n} I_k \right\}.
\]
This is the infimum of total lengths of *finite* open covers.

**1.3 Theorem** (Properties of Jordan Outer Content). Let \(A, B \subseteq \mathbb{R}\) be bounded.
1. *(Translation)* \(c^*(a+A) = c^*(A)\) for any \(a \in \mathbb{R}\).
2. *(Scaling)* \(c^*(rA) = |r|\,c^*(A)\) for \(r \neq 0\).
3. *(Inclusion)* If \(A \subseteq B\) then \(c^*(A) \leq c^*(B)\).
4. If \(A\) is finite then \(c^*(A) = 0\).
5. If \(I\) is a bounded interval then \(c^*(I) = |I|\).
6. *(Subadditivity)* \(c^*(A \cup B) \leq c^*(A) + c^*(B)\).
7. \(c^*(\bar{A}) = c^*(A)\).

**1.5 Definition.** A bounded set \(A \subseteq \mathbb{R}\) has **Jordan content** when \(c^*(A) = |I| - c^*(I \setminus A)\) for any interval \(I \supseteq A\), and in that case we write \(c(A) = c^*(A)\). Geometrically, this says the outer content from outside equals the "inner content" from inside.

**1.6 Exercise.** Show that \(\mathbb{Q} \cap [0,1]\) does *not* have a well-defined Jordan content (outer content is 1, but any finite cover of the rationals leaves gaps).

**1.7 Theorem** (Properties of Content). A bounded set \(A\) has Jordan content if and only if \(c^*(A^0) = 0\), where \(A^0\) denotes the boundary of \(A\). Unions, intersections, and differences of sets with content again have content. Every bounded interval has content.

## Lebesgue Outer Measure

**1.8 Definition.** For any \(A \subseteq \mathbb{R}\) (not necessarily bounded), the **Lebesgue outer measure** of \(A\) is
\[
  \lambda^*(A) = \inf\!\left\{ \sum_{n=1}^{\infty} |I_n| \;\middle|\; \text{each } I_n \text{ is a bounded open interval and } A \subseteq \bigcup_{n=1}^{\infty} I_n \right\}.
\]
The key difference from Jordan content: we allow *countably infinite* covers.

**1.9 Theorem** (Properties of Outer Measure). Let \(A, B \subseteq \mathbb{R}\).
1. *(Translation)* \(\lambda^*(a+A) = \lambda^*(A)\).
2. *(Scaling)* \(\lambda^*(rA) = |r|\,\lambda^*(A)\) for \(r \neq 0\).
3. *(Inclusion)* \(A \subseteq B \Rightarrow \lambda^*(A) \leq \lambda^*(B)\).
4. If \(A\) is finite or countable then \(\lambda^*(A) = 0\).
5. If \(I\) is an interval then \(\lambda^*(I) = |I|\).
6. *(Countable subadditivity)* \(\lambda^*\!\left(\bigcup_{n=1}^\infty A_n\right) \leq \sum_{n=1}^\infty \lambda^*(A_n)\).

*Proof sketch for (4):* Given \(A = \{a_1, a_2, \ldots\}\) countable and \(\varepsilon > 0\), cover each \(a_n\) by an interval of length \(\varepsilon/2^n\). Then \(\lambda^*(A) \leq \sum \varepsilon/2^n = \varepsilon\); since \(\varepsilon\) was arbitrary, \(\lambda^*(A) = 0\).

*Proof sketch for (5):* One shows \(\lambda^*(I) \leq |I|\) by taking \(I_1 = (a-\varepsilon, b+\varepsilon)\). For the lower bound, given any countable open cover of a compact subinterval \(K = [a+\varepsilon, b-\varepsilon] \subset I\), extract a finite subcover and chain the overlapping intervals to show the total length is at least \(b-a-2\varepsilon\).

## Lebesgue Measurability

**1.10 Definition.** A set \(A \subseteq \mathbb{R}\) is **Lebesgue measurable** when for every \(X \subseteq \mathbb{R}\),
\[
  \lambda^*(X) = \lambda^*(X \cap A) + \lambda^*(X \setminus A).
\]
This is Carathéodory's criterion: \(A\) measurably splits every set. We let \(\mathcal{M}\) denote the collection of all measurable subsets of \(\mathbb{R}\), and for measurable \(A\) we write \(\lambda(A) = \lambda^*(A)\).

**1.11 Note.** Since \(X = (X \cap A) \cup (X \setminus A)\), subadditivity gives \(\lambda^*(X) \leq \lambda^*(X \cap A) + \lambda^*(X \setminus A)\) automatically. So measurability requires only the reverse inequality.

**1.12 Theorem** (Properties of Measure). The collection \(\mathcal{M}\) is a **\(\sigma\)-algebra** and the Lebesgue measure \(\lambda : \mathcal{M} \to [0,\infty]\) satisfies:
1. \(\emptyset\) and \(\mathbb{R}\) are measurable.
2. If \(\lambda^*(A) = 0\) then \(A\) is measurable (null sets are measurable).
3. Complements of measurable sets are measurable.
4. Finite unions, intersections, and differences of measurable sets are measurable.
5. Every interval is measurable.
6. Countable unions and intersections of measurable sets are measurable.
7. *(Countable additivity)* If \(A_1, A_2, \ldots\) are measurable and disjoint, then \(\lambda\!\left(\bigcup_{k=1}^\infty A_k\right) = \sum_{k=1}^\infty \lambda(A_k)\).

*Key step in the proof of (4):* To show \(A \cup B\) is measurable, write for any \(X\):
\[
  \lambda^*(X) = \lambda^*(X \cap A) + \lambda^*((X \setminus A) \cap B) + \lambda^*(X \setminus (A \cup B)) \geq \lambda^*(X \cap (A \cup B)) + \lambda^*(X \setminus (A \cup B)),
\]
using subadditivity for the last step since \((X \cap A) \cup ((X \setminus A) \cap B) = X \cap (A \cup B)\).

**1.13 Corollary** (Continuity of Measure). Let \(A_1, A_2, \ldots\) be measurable.
1. If \(A_1 \subseteq A_2 \subseteq \cdots\) (increasing), then \(\lambda\!\left(\bigcup_{n=1}^\infty A_n\right) = \lim_{n\to\infty} \lambda(A_n)\).
2. If \(A_1 \supseteq A_2 \supseteq \cdots\) (decreasing) and \(\lambda(A_m) < \infty\) for some \(m\), then \(\lambda\!\left(\bigcap_{n=1}^\infty A_n\right) = \lim_{n\to\infty} \lambda(A_n)\).

**1.14 Theorem.** All open sets and all closed sets in \(\mathbb{R}\) are measurable. Moreover, every nonempty open set is a countable disjoint union of open intervals, so \(\lambda(U) = \sum_k |I_k|\) for connected components \(I_k\).

**1.15 Corollary.** \(\lambda^*(A) = \inf\{\lambda(U) \mid U \supseteq A,\, U \text{ open}\}\).

## Non-measurable Sets and Cantor Sets

**1.17 Theorem.** \(|\mathcal{M}| = 2^{2^{\aleph_0}}\) — the set of all measurable sets is strictly larger in cardinality than the set of Borel sets (which has cardinality \(2^{\aleph_0}\).

*Proof.* The standard Cantor set \(C\) has \(\lambda(C) = 0\), so every subset of \(C\) is measurable. Since \(|C| = 2^{\aleph_0}\), the number of subsets of \(C\) is \(2^{2^{\aleph_0}}\).

**1.18 Theorem.** There exists a **non-measurable** subset of \(\mathbb{R}\).

*Proof* (Vitali). Define an equivalence relation on \([0,1]\) by \(x \sim y \Leftrightarrow y - x \in \mathbb{Q}\). Using the Axiom of Choice, select one element from each equivalence class to form \(A \subseteq [0,1]\). Enumerate \(\mathbb{Q} \cap [0,2] = \{a_1, a_2, \ldots\}\) and let \(A_k = a_k + A\). One checks the \(A_k\) are pairwise disjoint and \([1,2] \subseteq \bigcup_k A_k \subseteq [0,3]\). If \(A\) were measurable, countable additivity would give \(\sum_k \lambda(A_k) = \sum_k \lambda(A)\) equal to either 0 or \(\infty\), contradicting \(1 \leq \lambda\!\left(\bigcup_k A_k\right) \leq 3\).

## σ-Algebras and Borel Sets

**1.19 Notation.** We write \(\mathcal{G}\) for the open sets and \(\mathcal{F}\) for the closed sets. For a collection \(\mathcal{C}\) of subsets, \(\mathcal{C}_\sigma\) denotes countable unions of sets from \(\mathcal{C}\), and \(\mathcal{C}_\delta\) denotes countable intersections.

**1.20 Definition.** A **\(\sigma\)-algebra** in \(\mathbb{R}\) is a collection \(\mathcal{C}\) of subsets of \(\mathbb{R}\) such that: (1) \(\emptyset \in \mathcal{C}\); (2) \(A \in \mathcal{C} \Rightarrow A^c \in \mathcal{C}\); (3) countable unions of sets in \(\mathcal{C}\) lie in \(\mathcal{C}\).

**1.23 Definition.** The **Borel \(\sigma\)-algebra** \(\mathcal{B}\) is the smallest \(\sigma\)-algebra containing all open sets. Elements of \(\mathcal{B}\) are called **Borel sets**; they include \(\mathcal{G},\ \mathcal{G}_\delta,\ \mathcal{G}_{\delta\sigma},\ldots\) and \(\mathcal{F},\ \mathcal{F}_\sigma,\ \mathcal{F}_{\sigma\delta},\ldots\).

**1.25 Theorem.** Every Borel set is Lebesgue measurable (\(\mathcal{B} \subseteq \mathcal{M}\), since \(\mathcal{M}\) is itself a \(\sigma\)-algebra containing all open sets.

**1.27 Theorem.** A set \(A \subseteq \mathbb{R}\) is measurable if and only if any of the following equivalent conditions holds:
- For every \(\varepsilon > 0\) there is an open set \(U \supseteq A\) with \(\lambda(U \setminus A) < \varepsilon\).
- There is a \(G_\delta\) set \(B \supseteq A\) with \(\lambda(B \setminus A) = 0\).
- For every \(\varepsilon > 0\) there is a closed set \(K \subseteq A\) with \(\lambda(A \setminus K) < \varepsilon\).
- There is an \(F_\sigma\) set \(C \subseteq A\) with \(\lambda(A \setminus C) = 0\).

## Density, Category, and the Baire Category Theorem

**1.29 Definition.** A set \(A \subseteq \mathbb{R}\) is **dense** when \(\bar{A} = \mathbb{R}\), and **nowhere dense** when every open interval contains a sub-interval disjoint from \(A\) (equivalently, \(\overline{A}^{\,\circ} = \emptyset\).

**1.32 Definition.** A set is **first category** (or *meagre*) if it is a countable union of nowhere dense sets; **second category** otherwise; **residual** if its complement is first category.

**1.33 Example.** Every countable set is first category (each singleton is nowhere dense), so \(\mathbb{Q}\) is first category and \(\mathbb{Q}^c\) is residual.

**1.36 Theorem** (Baire Category Theorem). *(1)* Every first-category set has empty interior. *(2)* Every residual set is dense. *(3)* A countable intersection of dense open sets is dense.

*Proof sketch:* If \(A = \bigcup_{k=1}^\infty C_k\) with each \(C_k\) nowhere dense, suppose \(A\) has nonempty interior and choose a closed interval \(I_0 \subseteq A\). Inductively choose nested closed intervals \(I_0 \supseteq I_1 \supseteq I_2 \supseteq \cdots\) with \(I_k \cap C_k = \emptyset\). By the nested interval theorem, \(\bigcap I_k \neq \emptyset\); but any point in the intersection lies in \(I_0 \subseteq A\) yet in no \(C_k\) — contradiction.

**1.40 Remark.** Three notions of "smallness" — *countable*, *measure zero*, *first category* — share the properties that subsets and countable unions of small sets are small, and small sets have empty interior. Yet no containment holds between them in general.

**1.41 Theorem.** Every subset of \(\mathbb{R}\) is the disjoint union of a set of measure zero and a set of first category.

*Proof.* Let \(Q = \{a_1, a_2, \ldots\}\). For \(k \in \mathbb{Z}^+\), let \(U_k = \bigcup_{\ell=1}^\infty \left(a_\ell - \frac{1}{2^{k+\ell}}, a_\ell + \frac{1}{2^{k+\ell}}\right)\), so \(\lambda(U_k) \leq 1/2^{k-1}\). Let \(B = \bigcap_{k=1}^\infty U_k\); then \(B\) is residual (countable intersection of dense open sets) yet \(\lambda(B) = 0\). For any \(A\), write \(A = (A \cap B) \cup (A \cap B^c)\): the first part has measure zero and the second is first category (subset of \(B^c\), which is first category).

---

# Chapter 2: Lebesgue Integration

Having defined measurable sets, we now define integration for measurable functions. The strategy is: first integrate non-negative simple functions (finite linear combinations of characteristic functions), then non-negative measurable functions (as a supremum over simple functions), and finally general measurable functions (by splitting into positive and negative parts).

## Setup: Riemann Integration and Its Limitations

**2.2–2.3 Definitions.** A **step function** on \([a,b]\) is \(s = \sum_{k=1}^n c_k \chi_{I_k}\) where the \(I_k\) partition \([a,b]\) into intervals; its integral is \(\int_a^b s = \sum c_k |I_k|\). A bounded function \(f: [a,b] \to \mathbb{R}\) is **Riemann integrable** when the upper and lower Riemann integrals agree: \(U(f) = L(f)\).

**2.6 Theorem** (Lebesgue's criterion for Riemann integrability). A bounded function \(f: [a,b] \to \mathbb{R}\) is Riemann integrable if and only if the set of its discontinuities has measure zero.

**2.8 Example.** The Dirichlet function \(f = \chi_{\mathbb{Q} \cap [0,1]}\) is discontinuous everywhere and hence *not* Riemann integrable.

**2.11–2.14 Examples** (Cantor function). Given a Cantor set \(C = [0,1] \setminus U\), the corresponding **Cantor function** \(f: [0,1] \to [0,1]\) is continuous and non-decreasing with \(f' = 0\) a.e. on \(U\). When \(C\) is the standard Cantor set, the homeomorphism \(g(x) = x + f(x)\) sends a set of measure zero (\(C\) to a set of measure one, illustrating that continuous images of measurable sets need not be measurable.

## Measurable Functions

**2.15 Definition.** The **extended reals** are \([-\infty, \infty] = \mathbb{R} \cup \{-\infty, \infty\}\) with the natural topology (open balls around \(\pm\infty\) being half-lines).

**2.16 Definition.** A function \(f: A \subseteq \mathbb{R} \to [-\infty, \infty]\) is **measurable** when \(f^{-1}(U)\) is measurable for every open set \(U \subseteq [-\infty, \infty]\). (In particular, the domain \(A\) must be measurable.)

**2.18 Theorem.** For measurable \(A\) and \(f: A \to [-\infty,\infty]\), the following are equivalent:
\[
f \text{ is measurable} \iff f^{-1}(a,\infty] \text{ is measurable for all } a \in \mathbb{R} \iff f^{-1}[a,\infty] \text{ is measurable for all } a \in \mathbb{R}.
\]

**2.19 Theorem.** Characteristic functions, continuous functions, and monotone functions are measurable.

**2.20 Definition.** For \(f: A \to [-\infty,\infty]\), define the positive and negative parts:
\[
f^+ = \max(f, 0), \quad f^- = \max(-f, 0).
\]
Then \(f = f^+ - f^-\) and \(|f| = f^+ + f^-\).

**2.21 Theorem.** If \(f, g\) are measurable and \(c \in \mathbb{R}\), then \(cf,\ f+g,\ fg,\ |f|,\ f^+,\ f^-\) are all measurable wherever defined.

**2.22 Theorem.** If \(f_n\) are measurable, then \(\sup_n f_n\), \(\inf_n f_n\), \(\limsup_{n\to\infty} f_n\), and \(\liminf_{n\to\infty} f_n\) are all measurable.

**2.23 Definition.** We say a property holds **almost everywhere** (a.e.) in \(A\) when it holds outside a set of measure zero.

## The Lebesgue Integral

**2.25 Definition.** A **simple function** on measurable \(A\) is \(s = \sum_{k=1}^n c_k \chi_{A_k}\), where the \(A_k\) are disjoint measurable sets partitioning \(A\).

**2.26 Definition.** For a non-negative simple function \(s = \sum_{k=1}^n c_k \chi_{A_k}\), the **Lebesgue integral** is
\[
\int_A s \,d\lambda = \sum_{k=1}^n c_k \lambda(A_k).
\]

**2.29 Definition.** For a non-negative measurable function \(f: A \to [0,\infty]\), the **Lebesgue integral** is
\[
\int_A f \,d\lambda = \sup\!\left\{ \int_A s \;\middle|\; s \text{ is a non-negative simple function with } s \leq f \right\}.
\]

**2.28 Note.** Any non-negative measurable \(f\) can be approximated from below by an increasing sequence of simple functions: set \(s_n(x) = (k-1)/2^n\) when \((k-1)/2^n \leq f(x) < k/2^n\) for \(k \leq n \cdot 2^n\), and \(s_n(x) = n\) when \(f(x) \geq n\). Then \(s_n \nearrow f\).

### The Fundamental Convergence Theorems

**2.31 Theorem** (Fatou's Lemma). If \(f_n: A \to [0,\infty]\) are non-negative measurable, then
\[
\int_A \liminf_{n\to\infty} f_n \leq \liminf_{n\to\infty} \int_A f_n.
\]

*Proof.* It suffices to show that for any non-negative simple \(s \leq \liminf f_n\), we have \(\int_A s \leq \liminf \int_A f_n\). Write \(s = \sum_k a_k \chi_{A_k}\). For any \(0 \leq r < 1\), the sets \(B_{k,n} = \{x \in A_k : f_\ell(x) \geq r a_k \\ \forall \ell \geq n\}\) increase to \(A_k\). Thus \(\int_A f_n \geq \sum_k r a_k \lambda(B_{k,n}) \to r \int_A s\). Since \(r < 1\) was arbitrary, the result follows.

**2.33 Theorem** (Lebesgue's Monotone Convergence Theorem). If \(f_n: A \to [0,\infty]\) are non-negative measurable with \(f_n(x) \nearrow f(x)\) for all \(x \in A\), then
\[
\int_A f = \lim_{n\to\infty} \int_A f_n.
\]

**2.35 Corollary.** For non-negative measurable \(f_n\),
\[
\int_A \sum_{n=1}^\infty f_n = \sum_{n=1}^\infty \int_A f_n.
\]

**2.38 Definition.** For measurable \(f: A \to [-\infty,\infty]\), we say \(f\) is **(Lebesgue) integrable** when both \(\int_A f^+\) and \(\int_A f^-\) are finite, and define
\[
\int_A f = \int_A f^+ - \int_A f^-.
\]
Equivalently, \(f\) is integrable if and only if \(|f|\) is integrable.

**2.41 Theorem** (Lebesgue's Dominated Convergence Theorem). Let \(f_n: A \to [-\infty,\infty]\) be measurable, and suppose \(f(x) = \lim_{n\to\infty} f_n(x)\) exists for all \(x \in A\). If there is an integrable function \(g: A \to [0,\infty]\) with \(|f_n(x)| \leq g(x)\) for all \(n\) and \(x\), then
\[
\lim_{n\to\infty} \int_A f_n = \int_A f.
\]

*Proof.* Apply Fatou's Lemma to \(g + f_n \geq 0\) to get \(\liminf \int f_n \geq \int f\), and to \(g - f_n \geq 0\) to get \(\limsup \int f_n \leq \int f\).

---

# Chapter 3: The \(L^p\) Spaces

This chapter develops the normed vector spaces \(L^p(A)\) of equivalence classes of measurable functions whose \(p\)th power is integrable, and proves they are **Banach spaces** (complete normed spaces). The case \(p = 2\) yields a Hilbert space.

## Topological Preliminaries

**3.1–3.4 Definitions.** Recall the hierarchy: an **inner product** on a real vector space \(V\) is a positive-definite symmetric bilinear form \(\langle x, y \rangle\); it induces a **norm** \(\|x\| = \sqrt{\langle x,x\rangle}\); a norm induces a **metric** \(d(x,y) = \|x-y\|\); and a metric induces a **topology** (open sets as unions of open balls).

**3.5 Note** (Cauchy–Schwarz). Every inner product satisfies \(\langle x, y \rangle \leq \|x\|\|y\|\) and the **polarization identity** \(\langle x, y \rangle = \tfrac{1}{4}(\|x+y\|^2 - \|x-y\|^2)\).

**3.10 Definition.** A metric space is **complete** if every Cauchy sequence converges. A complete normed space is a **Banach space**; a complete inner-product space is a **Hilbert space**.

## The \(\ell^p\) and \(L^p\) Spaces

**3.12 Definition.** For sequences \(x = (x_1, x_2, \ldots) \in \mathbb{R}^\omega\) and \(1 \leq p < \infty\), define
\[
\|x\|_p = \left(\sum_{k=1}^\infty |x_k|^p\right)^{1/p}, \quad \|x\|_\infty = \sup_k |x_k|,
\]
and let \(\ell^p = \{x : \|x\|_p < \infty\}\), \(\ell^\infty = \{x : \|x\|_\infty < \infty\}\).

**3.13 Definition.** For measurable \(A \subseteq \mathbb{R}\), define
\[
\|f\|_p = \left(\int_A |f|^p\right)^{1/p}, \quad \|f\|_\infty = \inf\{a \geq 0 : \lambda(\{|f| > a\}) = 0\},
\]
and let \(L^p(A) = \{f \in \mathcal{M}(A) : \|f\|_p < \infty\}/{\sim}\) where \(f \sim g \Leftrightarrow f = g\) a.e. (We identify functions equal almost everywhere so that \(\|f\|_p = 0 \Rightarrow f = 0\) in \(L^p\).)

**3.15 Lemma.** If \(f\) is measurable, then \(\{|f| > \|f\|_\infty\}\) has measure zero (the essential supremum is achieved a.e.).

## Hölder's and Minkowski's Inequalities

**3.16 Definition.** We say \(p, q \in [1,\infty]\) are **conjugate** when \(1/p + 1/q = 1\) (with convention \(1/\infty = 0\).

**3.17 Lemma** (Young's Inequality). For \(p, q \in (1,\infty)\) conjugate and \(a, b \geq 0\),
\[
ab \leq \frac{a^p}{p} + \frac{b^q}{q}.
\]
*Proof.* The area argument: the area of the rectangle \([0,a] \times [0,b]\) is at most the area under \(y = x^{p-1}\) plus the area to its left, giving \(ab \leq \int_0^a x^{p-1}dx + \int_0^b y^{q-1}dy = a^p/p + b^q/q\).

**3.18 Theorem** (Hölder's Inequality). Let \(1/p + 1/q = 1\).
- If \(x \in \ell^p\) and \(y \in \ell^q\), then \(xy \in \ell^1\) with \(\|xy\|_1 \leq \|x\|_p\|y\|_q\).
- If \(f \in L^p(A)\) and \(g \in L^q(A)\), then \(fg \in L^1(A)\) with \(\|fg\|_1 \leq \|f\|_p\|g\|_q\).

*Proof.* Apply Young's inequality termwise/pointwise with \(a = |x_k|/\|x\|_p\), \(b = |y_k|/\|y\|_q\), then sum.

**3.19 Theorem** (Minkowski's Inequality). For \(p \in [1,\infty]\):
- If \(x, y \in \ell^p\) then \(\|x+y\|_p \leq \|x\|_p + \|y\|_p\).
- If \(f, g \in L^p(A)\) then \(\|f+g\|_p \leq \|f\|_p + \|g\|_p\).

*Proof for \(p \in (1,\infty)\):* Write \(\|f+g\|^p = \|f+g\| \cdot \|f+g\|^{p-1} \leq (\|f\| + \|g\|)\|f+g\|^{p-1}\), integrate and apply Hölder to each term, then divide both sides by \(\|f+g\|_p^{p-1}\).

**3.21 Theorem.** \(\ell^p\) and \(L^p(A)\) are **normed linear spaces** with their \(p\)-norms.

## Completeness of \(L^p\)

**3.22 Theorem** (Riesz–Fischer). For \(p \in [1,\infty]\), the spaces \(\ell^p\) and \(L^p(A)\) are **complete** (Banach spaces).

*Proof for \(L^p\), \(p < \infty\):* Given a Cauchy sequence \(\{f_n\}\), extract a subsequence \(\{f_{n_k}\}\) with \(\|f_{n_{k+1}} - f_{n_k}\|_p \leq 1/2^k\). Define \(g_\ell = \sum_{k=1}^\ell |f_{n_{k+1}} - f_{n_k}|\). By Minkowski, \(\|g_\ell\|_p \leq 1\), and by Fatou, \(\|g\|_p \leq 1\) where \(g = \lim g_\ell\). So \(g < \infty\) a.e., meaning the telescoping series converges a.e. to some limit \(f\). One then uses Fatou again to show \(\|f - f_m\|_p \to 0\).

For \(L^\infty\): A Cauchy sequence in \(L^\infty\) converges uniformly outside a null set, and one defines the limit pointwise off that null set.

## Containment and Separability

**3.23 Theorem.** Let \(1 \leq p < q \leq \infty\).
1. \(\ell^p \subseteq \ell^q\).
2. If \(\lambda(A) < \infty\), then \(L^q(A) \subseteq L^p(A)\), with \(\|f\|_p \leq \|f\|_q \lambda(A)^{1/p - 1/q}\).

The containment \(L^q \subseteq L^p\) on finite measure spaces means higher integrability implies lower: an \(L^2\) function is automatically in \(L^1\) on a bounded domain.

**3.24 Theorem.** For \(1 \leq p < q < r \leq \infty\): \(L^p \cap L^r \subseteq L^q \subseteq L^p + L^r\).

**3.25 Theorem.** For \(1 \leq p < \infty\), \(\ell^p\) and \(L^p[a,b]\) are **separable** (have a countable dense subset), while \(\ell^\infty\) and \(L^\infty[a,b]\) are not.

The separability of \(L^p[a,b]\) for \(p < \infty\) follows because: step functions with rational coefficients on rational-endpoint intervals are dense in the step functions, which are dense in \(L^p\).

---

# Chapter 4: Hilbert Spaces

A **Hilbert space** is a complete inner-product space. The additional structure of an inner product — beyond what a Banach space provides — allows a rich geometry: orthogonal projections, orthonormal bases, and Parseval's identity. The chief example is \(L^2(A)\).

## Inner Products over \(\mathbb{R}\) and \(\mathbb{C}\)

**4.1 Definition.** Let \(\mathbb{F} = \mathbb{R}\) or \(\mathbb{C}\). An **inner product** on a vector space \(W\) over \(\mathbb{F}\) is a map \(\langle \cdot, \cdot \rangle : W \times W \to \mathbb{F}\) satisfying:
1. *(Sesquilinearity)* \(\langle u+v, w\rangle = \langle u,w\rangle + \langle v,w\rangle\), \(\langle tu, v\rangle = t\langle u,v\rangle\), \(\langle u, tv\rangle = \bar{t}\langle u,v\rangle\).
2. *(Conjugate symmetry)* \(\langle u,v\rangle = \overline{\langle v,u\rangle}\).
3. *(Positive definiteness)* \(\langle u,u\rangle \geq 0\) with equality iff \(u = 0\).

**4.4 Theorem.** Setting \(\|u\| = \sqrt{\langle u,u\rangle}\) gives a norm on \(W\), and the following key identities hold:
- **Parallelogram law**: \(\|u+v\|^2 + \|u-v\|^2 = 2\|u\|^2 + 2\|v\|^2\).
- **Polarization identity** (over \(\mathbb{R}\): \(\langle u,v\rangle = \tfrac{1}{4}(\|u+v\|^2 - \|u-v\|^2)\).
- **Pythagoras**: \(\langle u,v\rangle = 0 \Rightarrow \|u+v\|^2 = \|u\|^2 + \|v\|^2\).
- **Cauchy–Schwarz**: \(|\langle u,v\rangle| \leq \|u\|\|v\|\), with equality iff \(\{u,v\}\) is linearly dependent.
- **Triangle inequality**: \(\|u+v\| \leq \|u\| + \|v\|\).

## Orthogonality and Gram–Schmidt

**4.6 Definition.** A subset \(A \subseteq W\) is **orthogonal** if \(\langle u,v\rangle = 0\) for distinct \(u,v \in A\), and **orthonormal** if additionally \(\|u\| = 1\) for all \(u \in A\).

**4.7 Theorem.** An orthogonal set of nonzero vectors is linearly independent. If \(\{u_1,\ldots,u_n\}\) is orthogonal and \(x \in \operatorname{span}\{u_1,\ldots,u_n\}\), then
\[
x = \sum_{k=1}^n \frac{\langle x, u_k\rangle}{\|u_k\|^2} u_k.
\]

**4.8 Theorem** (Gram–Schmidt). Given a countable ordered basis \(\{u_1, u_2, \ldots\}\) for an inner product space, define \(v_1 = u_1\) and
\[
v_n = u_n - \sum_{k=1}^{n-1} \frac{\langle u_n, v_k\rangle}{\|v_k\|^2} v_k \quad (n \geq 2).
\]
Then \(\{v_1, v_2, \ldots\}\) is an orthogonal basis with \(\operatorname{span}\{v_1,\ldots,v_n\} = \operatorname{span}\{u_1,\ldots,u_n\}\) for all \(n\).

## The Projection Theorem

A key failure of Gram–Schmidt in infinite dimensions: in a non-complete inner product space, a closed subspace need not have orthogonal complement giving a direct sum decomposition. Completeness (the Hilbert space assumption) is essential.

**4.27 Theorem** (Closest Point / Projection). Let \(H\) be a Hilbert space and \(S \subseteq H\) be **closed** and **convex**. Then for every \(a \in H\) there exists a **unique** \(b \in S\) minimizing \(\|b - a\|\).

*Proof.* Let \(d = \inf_{x \in S} \|x - a\|\) and choose \(x_n \in S\) with \(\|x_n - a\| \to d\). The parallelogram law gives
\[
\|x_k - x_\ell\|^2 = 2\|x_k-a\|^2 + 2\|x_\ell - a\|^2 - 4\left\|\frac{x_k+x_\ell}{2} - a\right\|^2 \leq 2\|x_k-a\|^2 + 2\|x_\ell-a\|^2 - 4d^2,
\]
which goes to zero, so \(\{x_n\}\) is Cauchy. Completeness gives the limit \(b = \lim x_n \in S\) (closed). Uniqueness follows similarly via the parallelogram law.

**4.28 Corollary** (Orthogonal Decomposition). Let \(H\) be a Hilbert space and \(U \subseteq H\) a **closed subspace**. Then:
1. For every \(w \in H\) there exists a unique nearest point \(u \in U\).
2. \(H = U \oplus U^\perp\): every \(w \in H\) writes uniquely as \(w = u + v\) with \(u \in U\), \(v \in U^\perp = \{v : \langle v, u\rangle = 0 \\ \forall u \in U\}\).

*Proof.* The unique nearest point \(u\) is found by the projection theorem (U is convex and closed). Setting \(v = w - u\), one shows \(v \in U^\perp\): if not, there exists \(u_0 \in U\) with \(\langle v, u_0\rangle > 0\), and then \(\|w - (u + tu_0)\|^2 = \|v\|^2 - 2t\langle v,u_0\rangle + t^2\|u_0\|^2 < \|v\|^2\) for small \(t > 0\), contradicting minimality.

We write \(u = \operatorname{proj}_U(w)\) and \(v = \operatorname{proj}_{U^\perp}(w)\).

**Remark.** In a non-complete inner product space (e.g., sequences with finitely many nonzero terms, with the \(\ell^2\) inner product), a closed subspace need not satisfy \(W = U \oplus U^\perp\). Completeness is essential.

## Hilbert Bases and Parseval's Identity

**Definition.** A **Hilbert basis** (or **complete orthonormal system**) for a separable Hilbert space \(H\) is a maximal orthonormal set \(\mathcal{U} = \{u_1, u_2, \ldots\}\).

By Zorn's lemma, every inner product space has a maximal orthonormal set. In a Hilbert space, maximality is equivalent to density of the span.

**4.29 Theorem.** Let \(H\) be a separable Hilbert space with countable orthonormal set \(\mathcal{U} = \{u_1, u_2, \ldots\}\). The following are equivalent:
1. \(\mathcal{U}\) is maximal (Hilbert basis).
2. \(\operatorname{span}\mathcal{U}\) is dense in \(H\).
3. For all \(x \in H\): \(x = \sum_{k=1}^\infty \langle x, u_k\rangle u_k\) (convergence in \(H\).
4. **Parseval's identity**: For all \(x \in H\): \(\|x\|^2 = \sum_{k=1}^\infty |\langle x, u_k\rangle|^2\).
5. For all \(x, y \in H\): \(\langle x, y\rangle = \sum_{k=1}^\infty \langle x, u_k\rangle \overline{\langle y, u_k\rangle}\).

*Note: (4) implies* **Bessel's inequality**: \(\|x\|^2 \geq \sum_{k=1}^n |\langle x,u_k\rangle|^2\) *for any finite orthonormal set.*

**4.30 Theorem.** Every separable Hilbert space over \(\mathbb{F}\) is isometrically isomorphic to \(\ell^2(\mathbb{F})\) via the map \(x \mapsto (\langle x, u_1\rangle, \langle x, u_2\rangle, \ldots)\).

---

# Chapter 5: Fourier Analysis

*These notes draw from Calvin Kent's student notes (Lectures 31–36), as Prof. New deferred Fourier series to §§15.1–15.5 and 15.11 of the textbook.*

The central question of Fourier analysis is: *can every* \(L^2\) *function be expressed as a series of sines and cosines?* The answer is yes, and the tools developed here — the Dirichlet kernel, Fejér kernel, and convolution — also address pointwise and uniform convergence.

## Periodic Functions and Trigonometric Polynomials

A **\(2\pi\)-periodic function** \(f: \mathbb{R} \to \mathbb{C}\) is determined by its values on \([-\pi, \pi)\), or equivalently on the circle \(\mathbb{T} = \mathbb{R}/2\pi\mathbb{Z}\). We write \(L^p(\mathbb{T})\) or \(L^p[-\pi,\pi]\) for the corresponding \(L^p\) space.

**Definition 31.1** (Real trigonometric polynomial). A function of the form
\[
f(x) = a_0 + \sum_{n=1}^m a_n \cos nx + \sum_{n=1}^m b_n \sin nx.
\]

**Definition 33.1** (Complex trigonometric polynomial). A function of the form \(f(x) = \sum_{n=-\ell}^\ell c_n e^{inx}\), where
\[
e^{inx} = \cos nx + i\sin nx, \quad \cos nx = \frac{e^{inx}+e^{-inx}}{2}, \quad \sin nx = \frac{e^{inx}-e^{-inx}}{2i}.
\]

**Remark 31.2.** By the **Stone–Weierstrass theorem**, the trigonometric polynomials are dense in \(C(\mathbb{T})\) (continuous \(2\pi\)-periodic functions) in the sup norm, and hence also in \(L^p(\mathbb{T})\) for all \(1 \leq p < \infty\).

## Fourier Series in \(L^2\)

The set \(\{1, \cos nx, \sin nx : n \in \mathbb{Z}^+\}\) is orthogonal in \(L^2[-\pi,\pi]\), with
\[
\|1\|_2^2 = 2\pi, \quad \|\cos nx\|_2^2 = \|\sin nx\|_2^2 = \pi.
\]
Normalizing, \(\left\{\frac{1}{\sqrt{2\pi}},\ \frac{1}{\sqrt{\pi}}\cos nx,\ \frac{1}{\sqrt{\pi}}\sin nx\right\}\) is an orthonormal set whose span is dense (the trigonometric polynomials are dense), so it is a **Hilbert basis** for \(L^2[-\pi,\pi]\).

By Parseval's identity / the Hilbert basis theorem, every \(f \in L^2[-\pi,\pi]\) satisfies
\[
f(x) = a_0 + \sum_{n=1}^\infty (a_n \cos nx + b_n \sin nx) \quad \text{in } L^2,
\]
where the **Fourier coefficients** are
\[
a_0 = \frac{1}{2\pi}\int_{-\pi}^\pi f(x)\,dx, \quad a_n = \frac{1}{\pi}\int_{-\pi}^\pi f(x)\cos nx\,dx, \quad b_n = \frac{1}{\pi}\int_{-\pi}^\pi f(x)\sin nx\,dx.
\]

In **complex notation**, the set \(\{e^{inx}/\sqrt{2\pi} : n \in \mathbb{Z}\}\) is a Hilbert basis for \(L^2(\mathbb{T},\mathbb{C})\), and
\[
f(x) = \sum_{n=-\infty}^\infty c_n e^{inx} \quad \text{in } L^2(\mathbb{T}), \quad \text{where} \quad c_n = \hat{f}(n) = \frac{1}{2\pi}\int_{-\pi}^\pi f(t)e^{-int}\,dt.
\]

## Partial Sums and the Dirichlet Kernel

**Notation 34.2.** The **\(\ell\)-th partial sum** of the Fourier series of \(f \in L^1(\mathbb{T})\) is
\[
S_\ell(f)(x) = \sum_{n=-\ell}^\ell c_n e^{inx}.
\]
Computing explicitly:
\[
S_\ell(f)(x) = \frac{1}{\pi}\int_{-\pi}^\pi f(t)\D_\ell(x-t)\,dt,
\]
where the **Dirichlet kernel** is
\[
D_\ell(u) = \frac{1}{2}\sum_{n=-\ell}^\ell e^{inu} = \begin{cases} \dfrac{\sin((\ell+\frac{1}{2})u)}{2\sin(\frac{u}{2})} & u \neq 0, \\ \ell + \frac{1}{2} & u = 0. \end{cases}
\]
Properties: \(D_\ell\) is real-valued, even, \(2\pi\)-periodic, and \(\int_{-\pi}^\pi D_\ell(u)\,du = \pi\).

## Cesàro Means and the Fejér Kernel

The partial sums \(S_\ell(f)\) need not converge pointwise for \(f \in L^1\). **Cesàro summation** is more robust:

**Notation 34.2.** The **\(m\)-th Cesàro mean** is
\[
\sigma_m(f)(x) = \frac{1}{m+1}\sum_{\ell=0}^m S_\ell(f)(x) = \frac{1}{\pi}\int_{-\pi}^\pi f(t)\K_m(x-t)\,dt,
\]
where the **Fejér kernel** is
\[
K_m(u) = \frac{1}{m+1}\sum_{\ell=0}^m D_\ell(u) = \begin{cases} \dfrac{1}{2(m+1)}\cdot\dfrac{\sin^2(\frac{(m+1)u}{2})}{\sin^2(\frac{u}{2})} & u \neq 0, \\ \dfrac{m+1}{2} & u = 0. \end{cases}
\]

Properties of \(K_m\):
- Real-valued, even, \(2\pi\)-periodic, and **non-negative** (unlike \(D_\ell\).
- \(\int_{-\pi}^\pi K_m(u)\,du = \pi\).
- \(\max K_m = K_m(0) = (m+1)/2\).
- For fixed \(\delta > 0\): \(K_m(u) \leq \frac{\pi^2}{2(m+1)\sin^2(\delta/2)}\) for \(|u| \geq \delta\), so \(K_m \to 0\) uniformly away from 0.

The convolution can also be written as \(\sigma_m(f)(x) = \frac{1}{\pi}\int_{-\pi}^\pi f(x+t)K_m(t)\,dt\).

## The Riemann–Lebesgue Lemma

**Theorem 35.1** (Riemann–Lebesgue Lemma). If \(f \in L^1(\mathbb{T})\), then \(\lim_{n \to \infty} c_n(f) = 0\).

*Proof.* Given \(\varepsilon > 0\), choose a trigonometric polynomial \(g = \sum_{n=-\ell}^\ell a_n e^{inx}\) with \(\|f-g\|_1 < 2\pi\varepsilon\). For \(|n| > \ell\), \(c_n(g) = 0\), so
\[
|c_n(f)| = |c_n(f-g)| \leq \frac{1}{2\pi}\|f-g\|_1 < \varepsilon. \qquad\square
\]

## Fejér's Theorem

**Theorem 35.2** (Fejér). Let \(f \in L^1(\mathbb{T})\) and \(a \in \mathbb{T}\). Suppose the one-sided limits \(f(a^+) = \lim_{t \to 0^+} f(a+t)\) and \(f(a^-) = \lim_{t \to 0^+} f(a-t)\) both exist in \(\mathbb{C}\). Then
\[
\lim_{m \to \infty} \sigma_m(f)(a) = \frac{f(a^+) + f(a^-)}{2}.
\]
Moreover, if \(f\) is continuous on a closed interval \(I\), the convergence is **uniform** on \(I\).

*Proof sketch.* Write
\[
\sigma_m(f)(a) - \frac{f(a^+)+f(a^-)}{2} = \frac{1}{\pi}\int_0^\pi [(f(a+t)+f(a-t)) - (f(a^+)+f(a^-))]K_m(t)\,dt.
\]
Split at \(\delta\): the integral over \([0,\delta]\) is small by continuity of the one-sided limits (so the integrand is at most \(\varepsilon\), using \(\int_0^\pi K_m = \pi/2\). The integral over \([\delta,\pi]\) is small because \(K_m(t) \leq \pi^2/(2(m+1)\sin^2(\delta/2))\) decays as \(m \to \infty\).

**Corollary 35.4.** If \(f \in L^1(\mathbb{T})\) is continuous at \(a\), then \(\sigma_m(f)(a) \to f(a)\). If \(f\) is continuous everywhere, then \(\sigma_m(f) \to f\) uniformly.

## Applications of Fourier Series

### Forced Damped Oscillator

Consider the ODE \(y'' + 2y' + 10y = g(t)\) where \(g\) is a \(2\pi\)-periodic even function (a "triangle wave"). The homogeneous solution \(y_h = e^{-t}(A\cos 3t + B\sin 3t) \to 0\) as \(t \to \infty\). For each Fourier mode \(\cos nt\), a particular solution is
\[
y_n = A_n \cos nt + B_n \sin nt, \quad A_n = \frac{10-n^2}{(10-n^2)^2+4n^2}, \quad B_n = \frac{2n}{(10-n^2)^2+4n^2}.
\]
The Fourier series of the triangle wave has \(a_n = 4/(\pi n^2)\) for odd \(n\) (and 0 for even \(n\), so the general solution is
\[
y = e^{-t}(A\cos 3t + B\sin 3t) + \sum_{n=1}^\infty \frac{4}{\pi n^2}(A_n \cos nt + B_n \sin nt).
\]

### Vibrating String

The wave equation \(u_{tt} = c^2 u_{xx}\) on \([0,\pi]\) with fixed endpoints \(u(0,t) = u(\pi,t) = 0\) and initial data \(u(x,0) = g(x)\), \(u_t(x,0) = h(x)\) is solved by separation of variables. The eigenvalue problem \(X'' = -n^2 X\), \(X(0) = X(\pi) = 0\) has solutions \(X_n(x) = \sin nx\), and the general solution is
\[
u(x,t) = \sum_{n=1}^\infty \sin(nx)(A_n \cos nct + B_n \sin nct),
\]
where \(A_n\) are the Fourier sine coefficients of \(g\) and \(ncB_n\) are those of \(h\).
