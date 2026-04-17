---
title: "PMATH 433: Model Theory"
prof: "Rahim Moosa"
subjects: "PMATH"
---

## Sources and References

**Primary textbook** — David Marker, *Model Theory: An Introduction*, Graduate Texts in Mathematics 217, Springer, 2002.

**Supplementary texts** — Wilfrid Hodges, *A Shorter Model Theory*, Cambridge, 1997; Bruno Poizat, *A Course in Model Theory*, Springer, 2000; Katrin Tent and Martin Ziegler, *A Course in Model Theory*, Cambridge, 2012.

**Online resources** — MIT OCW model theory notes; Dave Marker's supplementary lecture notes (math.uic.edu); Pillay's notes on stability theory.

---

> **Course revision note.** This Winter 2025 offering is a revised version of PMATH 433 that focuses exclusively on Model Theory, covering the subject in greater depth than before (Quantifier Elimination, Algebraically Closed and Real Closed Fields, Types and Saturation, Omitting Types, Interpretations and Imaginaries, Strongly Minimal Sets, the Zilber Trichotomy, and Stability Theory). The Set Theory component (ZFC axioms, ordinals, cardinals, cardinal arithmetic) that appeared in earlier offerings has been removed and is no longer part of this course. If you need that material, it is covered in full in the [Fall 2020 offering of PMATH 433/733: Set Theory and Model Theory](/1209/pmath433/).

---

## Historical Preface: The Origins of Model Theory

Before diving into the technical machinery, it is worth pausing to appreciate where model theory came from and why it became one of the deepest branches of mathematical logic. Model theory is not simply formal logic applied mechanically to algebra — it is a living subject whose development has been shaped by deep problems in mathematics and surprising interactions between syntax and structure.

**Löwenheim and Skolem (1915–1920).** The first landmark result is the Löwenheim–Skolem theorem. Leopold Löwenheim showed in 1915 that if a first-order sentence has any model at all, it has a countable model. Thoralf Skolem strengthened and generalised this in 1920 to the Downward Löwenheim–Skolem theorem: any first-order theory with an infinite model has a model of every infinite cardinal. This was profoundly disturbing — it meant that even the theory of the real numbers, which we think of as "uncountable," has a countable model (from the outside). This is the so-called **Skolem paradox**: set theory, which proves the existence of uncountable sets, has a countable model. The paradox dissolves when one realises that "uncountable" is a relative notion inside a model — what the model sees as uncountable may be countable from the outside — but the philosophical shock drove early model-theoretic thinking about what first-order logic can and cannot express.

**Gödel's Completeness Theorem (1930).** Kurt Gödel's 1930 doctoral thesis established the completeness theorem for first-order logic: a sentence is provable from a set of axioms if and only if it holds in every model of those axioms. This gave syntactic proof theory and semantic model theory their fundamental connection. Combined with Gödel's later incompleteness theorems (1931), it became clear that for any sufficiently strong theory, there are true sentences that cannot be proved — the formal system is inherently incomplete. This duality between what can be proved and what is true in models is a recurring theme throughout this course.

**Tarski and the Method of Quantifier Elimination (1930s–1950s).** Alfred Tarski's greatest contribution to model theory was the method of quantifier elimination and its applications. In the 1930s he showed that the theory of real closed fields admits QE, which meant that every first-order property of real numbers is decidable — there is an algorithm to determine whether any given statement about the reals is true. This was a remarkable result: the first-order theory of \( (\mathbb{R}, +, \cdot, <) \) is decidable, even though arithmetic \( (\mathbb{N}, +, \cdot) \) is not. Tarski also established QE for algebraically closed fields, giving the model-theoretic proof of the Chevalley theorem. His 1948 monograph *A Decision Method for Elementary Algebra and Geometry* was the founding document of real algebraic geometry from a logical viewpoint.

**Abraham Robinson and Non-Standard Analysis (1960s).** Abraham Robinson showed in the 1960s that the compactness theorem of first-order logic could be used to construct "non-standard" models of the reals containing infinitesimals. In his framework, an infinitesimal is a positive real number smaller than every standard positive rational — impossible in the standard reals, but realised in a non-standard model. Robinson's non-standard analysis gave a rigorous foundation for Leibniz's original intuitions and led to new proofs of classical theorems. More broadly, Robinson demonstrated that model-theoretic methods — particularly the study of elementary extensions and saturation — have direct applications to classical analysis and algebra.

**Morley's Categoricity Theorem (1965).** The most significant single result motivating modern model theory is Morley's categoricity theorem: if a countable complete theory is categorical in one uncountable cardinal (i.e., has exactly one model of that cardinality up to isomorphism), then it is categorical in every uncountable cardinal. This result, proved by Michael Morley in his 1963 dissertation (published 1965), is beautiful and surprising. Morley's proof introduced two key tools: **Morley rank** (an ordinal-valued measure of definable set complexity) and **totally transcendental theories** (what we now call \(\omega\)-stable theories). The theorem showed that categoricity is a profound structural property, not an accident of cardinality.

**Shelah's Classification Theory (1970s).** Saharon Shelah took Morley's work and generalised it into a sweeping **classification theory** for first-order theories. Shelah's fundamental insight was that theories can be classified according to how "many" models they have: a theory is either **classifiable** (with a well-behaved structure theory and few models in each cardinality) or **unclassifiable** (wild, with many models). The dividing lines are the **stability hierarchy**: \(\omega\)-stable \( \subset \) superstable \( \subset \) stable \( \subset \) NIP \( \subset \) NSOP. Shelah's 1978 book *Classification Theory* is one of the most ambitious and technically demanding works in all of mathematics, and it transformed model theory from a branch of logic into a discipline with its own deep results and methods.

**Geometric Model Theory and Hrushovski's Refutation (1980s–1993).** The program initiated by Zilber, Hrushovski, Pillay and others brought model theory into direct contact with algebraic geometry, number theory, and combinatorics. The central conjecture driving this program was the **Zilber trichotomy**: every strongly minimal set has a pregeometry that is either trivial (disintegrated), locally modular (group-like), or field-like (interpreting an algebraically closed field). This conjecture, if true, would have said that the only "source of complexity" in a strongly minimal set is an interpretable algebraically closed field. In 1993, Ehud Hrushovski refuted the conjecture in full generality by constructing **new** strongly minimal sets that are not disintegrated, not locally modular, and yet do not interpret any algebraically closed field. His construction, now called the **Hrushovski amalgamation** or **Fraïssé–Hrushovski construction**, starts with a class of finite structures equipped with a predimension function \(\delta(G) = |V(G)| - |E(G)|\), takes a specific limit structure, and shows the resulting theory is strongly minimal with "exotic" geometry. The trichotomy, however, was subsequently proved in the more restricted setting of strongly minimal sets definable in differentially closed fields (Hrushovski–Sokolović, Pillay–Ziegler), and in the algebraic setting it remains the conceptual cornerstone. The applications of model theory to the Mordell–Lang conjecture and the André–Oort conjecture are among the deepest achievements of contemporary mathematics. This course covers the foundations of this program.

---

# Chapter 1: Quantifier Elimination

## 1.1 The Concept of Quantifier Elimination

One of the central themes of model theory is the analysis of definable sets — those subsets of a structure that can be described by first-order formulas. In general, a formula may involve alternating blocks of quantifiers, making the definable sets difficult to analyse directly. **Quantifier elimination** (QE) is the property of a theory that says every formula is equivalent (modulo the theory) to one with no quantifiers at all. When a theory has QE, the definable sets in any model are precisely those described by quantifier-free conditions, which are typically far simpler.

Formally, a complete theory \( T \) in a language \( \mathcal{L} \) **admits quantifier elimination** if for every \( \mathcal{L} \)-formula \( \varphi(\bar{x}) \) there exists a quantifier-free \( \mathcal{L} \)-formula \( \psi(\bar{x}) \) such that \( T \models \varphi(\bar{x}) \leftrightarrow \psi(\bar{x}) \). The same terminology applies to a theory that is not yet complete, with the understanding that the equivalence holds in all models.

The practical power of quantifier elimination is enormous. Once we know that a theory has QE, we can:

- Describe the definable sets explicitly (they are Boolean combinations of atomic formulas);
- Prove completeness of the theory from a single model comparison;
- Derive o-minimality, strong minimality, and other tameness conditions automatically;
- Transfer algebraic results between structures of different characteristics via the Lefschetz principle.

A key observation is that QE for a theory \( T \) is equivalent to the statement that every definable set is a projection of a quantifier-free definable set. This connects QE to elimination of imaginaries and the study of algebraic geometry over model-theoretically tame fields.

## 1.2 The Test for Quantifier Elimination

Rather than eliminating quantifiers formula by formula, there is a clean criterion due to Shoenfield that reduces QE to a back-and-forth argument between substructures.

<div class="theorem">
<strong>Theorem (Test for QE).</strong> Let \( T \) be an \( \mathcal{L} \)-theory. Then \( T \) admits quantifier elimination if and only if the following holds: for any two models \( M, N \models T \), any common substructure \( A \subseteq M \) and \( A \subseteq N \), and any element \( b \in M \), there exists an element \( c \in N \) such that \( (A, b) \) and \( (A, c) \) satisfy the same quantifier-free \( \mathcal{L} \)-sentences (i.e., they are quantifier-free elementarily equivalent over \( A \)).
</div>

The proof proceeds by induction on formula complexity. The forward direction is clear: if every formula is equivalent to a quantifier-free one, then quantifier-free agreement implies full elementary agreement. For the converse, one uses the criterion to amalgamate types and show that every type over a substructure is determined by its quantifier-free part.

A streamlined variant, useful in practice, requires only checking the criterion for **existential formulas**: \( T \) has QE if and only if for any \( M, N \models T \) with a common substructure \( A \), any existential sentence true in \( M \) with parameters from \( A \) is also true in \( N \). This connects QE to **model completeness**: a theory is model complete if and only if every formula is equivalent to an existential formula, so QE is strictly stronger than model completeness.

<div class="remark">
Model completeness is equivalent to the statement that every embedding between models is an elementary embedding. Quantifier elimination implies model completeness, but not conversely: the theory of real closed fields (as a theory in the ring language) is model complete but admits QE only in the expanded language with a predicate for the ordering.
</div>

## 1.3 QE for Dense Linear Orders Without Endpoints

The archetypal example of quantifier elimination is the theory **DLO** of dense linear orders without endpoints. The language is \( \mathcal{L} = \{<\} \), and the theory consists of the axioms saying \( < \) is a strict total order, the order is dense (between any two elements there is a third), and there are no endpoints (no minimum or maximum element). The prototypical model is \( (\mathbb{Q}, <) \).

<div class="theorem">
<strong>Theorem (Cantor).</strong> DLO admits quantifier elimination. Consequently, DLO is complete.
</div>

<div class="proof">
We apply the test for QE. Let \( M, N \models \mathrm{DLO} \), let \( A \) be a common substructure (a finite linearly ordered set), and let \( b \in M \). The quantifier-free type of \( b \) over \( A \) is determined by where \( b \) sits relative to the finitely many elements of \( A \): either \( b \) is below all of them, above all of them, or strictly between two consecutive elements \( a_i < a_{i+1} \). In each case, the density and no-endpoints axioms guarantee that \( N \) contains an element \( c \) with the same relative position. Hence the test is satisfied and DLO has QE.

Completeness follows because any two models of DLO satisfy the same quantifier-free sentences (there are no constant symbols, so quantifier-free sentences are Boolean combinations of atomic sentences of the form \( x < x \), all of which have fixed truth values), and since every sentence is equivalent to a quantifier-free one, DLO is complete.
</div>

As a consequence, every definable subset of \( \mathbb{Q} \) (with parameters) in the language \( \{<\} \) is a finite Boolean combination of intervals and points. This is the simplest instance of **o-minimality**, which we develop further in Chapter 3.

## 1.4 QE for Algebraically Closed Fields

Let \( \mathrm{ACF}_p \) denote the theory of algebraically closed fields of characteristic \( p \) (where \( p = 0 \) or \( p \) is a prime), formulated in the language \( \mathcal{L}_{\mathrm{rings}} = \{+, \cdot, -, 0, 1\} \).

<div class="theorem">
<strong>Theorem (Tarski, Chevalley).</strong> \( \mathrm{ACF}_p \) admits quantifier elimination for each \( p \).
</div>

The proof uses the test for QE. Let \( M, N \models \mathrm{ACF}_p \), let \( A \) be a common subring (automatically an integral domain since it embeds in a field), and let \( b \in M \). The quantifier-free type of \( b \) over \( A \) is determined by the minimal polynomial of \( b \) over the fraction field \( K \) of \( A \) (if \( b \) is algebraic) or the fact that \( b \) is transcendental over \( K \) (if not). In the algebraic case, \( N \) contains a root of the same irreducible polynomial because \( N \) is algebraically closed. In the transcendental case, \( N \) contains a transcendental over \( K \) because algebraically closed fields have infinite transcendence degree over any finitely generated subfield. Thus the test is satisfied.

The geometric content is the **Chevalley–Tarski theorem**: the image of a constructible set under a polynomial map is constructible. A constructible set is a finite Boolean combination of Zariski-closed sets; the theorem says constructible sets are exactly the quantifier-free definable sets, and their projections (which correspond to existential quantification) are again constructible.

<div class="example">
<strong>Worked QE in ACF: eliminating the square-root quantifier.</strong> Consider the formula

\[
\varphi(x) \;=\; \exists y\,(y \cdot y = x)
\]
in the language \( \mathcal{L}_{\mathrm{rings}} \). This formula asks: "does \( x \) have a square root?" Over an algebraically closed field \( K \), <em>every</em> element has a square root (since \( K \) is algebraically closed and \( y^2 - x = 0 \) always has a solution). Therefore, \( \mathrm{ACF}_p \models \varphi(x) \leftrightarrow (x = x) \), i.e., the formula is equivalent to the trivially true quantifier-free formula \( x = x \).

More carefully: the QE procedure for ACF works as follows. We wish to eliminate the existential quantifier in \( \exists y\,(y^2 - x = 0) \). The resultant of \( y^2 - x \) (viewed as a polynomial in \( y \) with coefficients in \( K[x] \)) with itself has degree \( 0 \) as a polynomial in \( x \) — it is the discriminant \( \Delta = 4x \). But since we are in an algebraically closed field, the condition \( \Delta \neq 0 \) (i.e., \( x \neq 0 \)) is not a necessary condition for the existence of a root: \( y^2 = 0 \) has the root \( y = 0 \). So in ACF, we get \( \exists y\,(y^2 = x) \) is equivalent to \( \top \) (always true).

Compare this with what happens in RCF: in \( \mathbb{R} \), the formula \( \exists y\,(y^2 = x) \) is equivalent to \( x \geq 0 \). The QE for RCF produces a quantifier-free formula in the ordered ring language. This contrast illustrates why the choice of language matters for QE.
</div>

<div class="example">
<strong>Chevalley's theorem via projection: the parabola.</strong> Consider the algebraic curve \( C = \{(x, y) \in K^2 : y^2 = x\} \) in an algebraically closed field \( K \). The projection to the first coordinate is

\[
\pi(C) = \{x \in K : \exists y\,(y^2 = x)\}.
\]
By QE for ACF (as computed above), this is equivalent to \( x = x \), i.e., \( \pi(C) = K^1 \). So the image of the parabola under projection to the \( x \)-axis is the whole affine line — a constructible set (in fact, a Zariski-closed set).

For a more interesting example, consider the curve \( C' = \{(x, y) : xy = 1\} \) (the hyperbola). The projection \( \pi(C') = \{x : \exists y\,(xy = 1)\} \) is the set of nonzero elements, which is \( K \setminus \{0\} \). This is an open constructible set (complement of a point), confirming that projections of constructible sets are constructible but need not be closed.

These are the first instances of Chevalley's theorem, which in full generality states: if \( f : X \to Y \) is a morphism of algebraic varieties over an algebraically closed field, then the image of a constructible set is constructible. The model-theoretic proof reduces to the observation that constructible sets are the quantifier-free definable sets in ACF, morphisms correspond to existential quantification, and QE guarantees the result.
</div>

## 1.5 QE for Real Closed Fields

The theory **RCF** of real closed fields is formulated in the language \( \mathcal{L}_{\mathrm{or}} = \{+, \cdot, -, 0, 1, <\} \). A real closed field is an ordered field in which every positive element has a square root and every odd-degree polynomial has a root.

<div class="theorem">
<strong>Theorem (Tarski).</strong> RCF admits quantifier elimination.
</div>

The proof is more involved than the ACF case and relies on **Sturm's theorem** for counting real roots of polynomials in an interval. The key step is eliminating a single existential quantifier: given a quantifier-free formula \( \varphi(x, \bar{a}) \) defining a semi-algebraic set in the variable \( x \) (with parameters \( \bar{a} \)), one shows that \( \exists x\, \varphi(x, \bar{a}) \) is equivalent to a quantifier-free condition on \( \bar{a} \). Tarski's original proof was effective (giving an explicit algorithm) but extremely slow; later work by Collins and by Basu–Pollack–Roy gives polynomial-space algorithms for quantifier elimination in RCF.

---

# Chapter 2: Algebraically Closed Fields

## 2.1 The Theory ACF_p

Fix a prime \( p \) or let \( p = 0 \). The **theory of algebraically closed fields of characteristic \( p \)**, denoted \( \mathrm{ACF}_p \), is axiomatised in \( \mathcal{L}_{\mathrm{rings}} \) by:

- The field axioms;
- If \( p > 0 \): the sentence \( \underbrace{1 + \cdots + 1}_{p} = 0 \); if \( p = 0 \): \( \underbrace{1 + \cdots + 1}_{n} \neq 0 \) for each \( n \geq 1 \);
- For each \( n \geq 1 \): every monic polynomial of degree \( n \) has a root.

The models of \( \mathrm{ACF}_0 \) include \( \mathbb{C} \), \( \overline{\mathbb{Q}} \), and \( \overline{\mathbb{Q}(t)} \). The models of \( \mathrm{ACF}_p \) (for \( p \) prime) include the algebraic closure \( \overline{\mathbb{F}_p} \) and \( \overline{\mathbb{F}_p(t)} \).

<div class="definition">
Two algebraically closed fields are <strong>elementarily equivalent</strong> if and only if they have the same characteristic. Within a fixed characteristic, \( \mathrm{ACF}_p \) is a complete theory, meaning any two algebraically closed fields of the same characteristic satisfy exactly the same first-order sentences.
</div>

<div class="theorem">
<strong>Theorem (Completeness of ACF_p).</strong> For each \( p \), the theory \( \mathrm{ACF}_p \) is complete.
</div>

<div class="proof">
By the Vaught test: \( \mathrm{ACF}_p \) is \( \kappa \)-categorical for every uncountable \( \kappa \) (since algebraically closed fields of the same uncountable cardinality and characteristic are isomorphic — they have the same transcendence degree). The theory has no finite models. Therefore by Vaught's test, \( \mathrm{ACF}_p \) is complete.
</div>

## 2.2 Model Completeness and QE

Having established completeness, we noted in Chapter 1 that \( \mathrm{ACF}_p \) admits quantifier elimination. Let us draw out some immediate consequences.

<div class="theorem">
<strong>Corollary.</strong> \( \mathrm{ACF}_p \) is model complete: every embedding between models of \( \mathrm{ACF}_p \) is an elementary embedding.
</div>

This means: if \( K \subseteq L \) are algebraically closed fields of the same characteristic, then for any formula \( \varphi(\bar{a}) \) with parameters \( \bar{a} \in K \), we have \( K \models \varphi(\bar{a}) \) if and only if \( L \models \varphi(\bar{a}) \). In algebraic terms, first-order properties of elements in \( K \) are absolute between \( K \) and any algebraically closed extension.

Since the quantifier-free definable sets in \( \mathrm{ACF}_p \) are exactly the constructible sets (Boolean combinations of Zariski-closed sets), QE says:

<div class="theorem">
<strong>Theorem (Chevalley).</strong> The projection of a constructible set is constructible. Equivalently, constructible sets are closed under quantification.
</div>

This is the model-theoretic proof of Chevalley's theorem: given a constructible set \( C \subseteq K^{n+1} \), the projection \( \pi(C) = \{a \in K^n : \exists b\, (a, b) \in C\} \) corresponds to an existential formula, which by QE is equivalent to a quantifier-free (hence constructible) formula.

## 2.3 Strongly Minimal Theory

<div class="definition">
A complete theory \( T \) is <strong>strongly minimal</strong> if in every model \( M \models T \), every definable subset of \( M \) (in one variable, with parameters) is either finite or cofinite.
</div>

<div class="theorem">
<strong>Theorem.</strong> \( \mathrm{ACF}_p \) is strongly minimal.
</div>

<div class="proof">
By QE, every definable subset of an algebraically closed field \( K \) in one variable is a Boolean combination of sets of the form \( \{a \in K : f(a) = 0\} \) for polynomials \( f \). Each such set is either finite (if \( f \neq 0 \)) or all of \( K \) (if \( f = 0 \)). Boolean combinations of finite and cofinite sets are again finite or cofinite.
</div>

Strong minimality is the algebraic-geometric content of Hilbert's Nullstellensatz: every nonzero polynomial over an algebraically closed field has finitely many roots.

## 2.4 Applications: Nullstellensatz and Transfer Principles

**Hilbert's Nullstellensatz.** The classical Nullstellensatz states: if \( f_1, \ldots, f_m \) are polynomials in \( \mathbb{C}\left[x_1, \ldots, x_n\right] \) with no common zero in \( \mathbb{C}^n \), then \( 1 \in (f_1, \ldots, f_m) \) (the ideal they generate). The model-theoretic proof uses the completeness and model completeness of \( \mathrm{ACF}_0 \): the system \( f_1 = \cdots = f_m = 0 \) has no solution in \( \mathbb{C} \) if and only if it has no solution in any algebraically closed field of characteristic 0, which by compactness is equivalent to the existence of a Nullstellensatz certificate.

**Lefschetz Principle.** A first-order sentence \( \sigma \) in the ring language is true in some (equivalently, all) algebraically closed fields of characteristic 0 if and only if it is true in some (equivalently, all) algebraically closed fields of sufficiently large characteristic. More precisely:

<div class="theorem">
<strong>Theorem (Lefschetz Principle).</strong> If \( \sigma \) holds in \( \mathrm{ACF}_0 \), then there exists \( N \) such that \( \sigma \) holds in \( \mathrm{ACF}_p \) for all primes \( p > N \). Conversely, if \( \sigma \) holds in \( \mathrm{ACF}_p \) for infinitely many primes \( p \), then \( \sigma \) holds in \( \mathrm{ACF}_0 \).
</div>

<div class="proof">
The theory \( \mathrm{ACF}_0 = \bigcap_p \mathrm{ACF}_p \) (informally) in the sense that \( \mathrm{ACF}_0 = \{\sigma : \mathrm{ACF}_p \models \sigma\ \text{for all sufficiently large}\ p\} \). By compactness, \( \sigma \in \mathrm{ACF}_0 \) means \( \neg\sigma \) is inconsistent with \( \mathrm{ACF}_0 \), so the negation is already inconsistent with finitely many characteristic-\( p \) axioms, giving the bound \( N \). The converse uses the fact that \( \mathrm{ACF}_0 \) is complete.
</div>

<div class="example">
The Ax–Grothendieck theorem: any injective polynomial map \( f : \mathbb{C}^n \to \mathbb{C}^n \) is surjective. Over finite fields this is trivially true (by counting). By the Lefschetz principle, it transfers to fields of characteristic 0. This is a model-theoretic proof of a non-trivial algebraic fact.
</div>

<div class="example">
<strong>Worked Lefschetz transfer: every element is a square.</strong> Consider the sentence

\[
\sigma \;=\; \forall x\, \exists y\, (y^2 = x).
\]
This says "every element has a square root." We claim \(\sigma \in \mathrm{ACF}_0\) and use the Lefschetz principle to transfer it.

<em>Step 1: Verify \(\sigma\) holds in \(\mathrm{ACF}_0\).</em> The sentence \(\sigma\) holds in \(\mathbb{C}\). For any \(x \in \mathbb{C}\), write \(x = re^{i\theta}\) with \(r \geq 0\); then \(y = \sqrt{r}\,e^{i\theta/2}\) satisfies \(y^2 = x\). More algebraically: in any algebraically closed field \(K\), the polynomial \(f(y) = y^2 - x\) has degree 2 and therefore has a root in \(K\) (since \(K\) is algebraically closed). So \(\sigma\) is a \emph{consequence} of the algebraically closed field axioms. In fact \(\mathrm{ACF}_p \models \sigma\) for every characteristic \(p\).

<em>Step 2: Lefschetz transfer from char 0 to char p.</em> Since \(\mathrm{ACF}_0 \models \sigma\), the Lefschetz principle gives: there exists \(N\) such that \(\mathrm{ACF}_p \models \sigma\) for all primes \(p > N\). In this case \(N = 1\) (the sentence holds in all characteristics), but the principle applies generally. Concretely: \(\sigma\) holds in \(\overline{\mathbb{F}_p}\) for every prime \(p\), because \(\overline{\mathbb{F}_p}\) is algebraically closed.

<em>Step 3: A less trivial example — the Chevalley–Warning theorem via Lefschetz.</em> The sentence "every degree-\(d\) homogeneous polynomial in \(n > d\) variables has a non-trivial zero" is first-order expressible (for fixed \(d, n\)) and true in \(\mathrm{ACF}_0\) (Chevalley's theorem for algebraically closed fields). By the Lefschetz principle, it holds in \(\mathrm{ACF}_p\) for all large enough \(p\). This is a model-theoretic route to the Chevalley–Warning theorem in characteristic \(p\).

<em>Remark on the converse direction.</em> The sentence "\(\mathrm{char}(K) \neq 2\) implies every element is a square" is false over \(\overline{\mathbb{F}_2}\) since char 2... wait, \(\overline{\mathbb{F}_2}\) is algebraically closed, so it does satisfy \(\sigma\). A truly characteristic-sensitive example: "\(1 + 1 \neq 0\)" is true in \(\mathrm{ACF}_0\) but false in \(\mathrm{ACF}_2\). The Lefschetz principle handles this: \(1 + 1 \neq 0\) is in \(\mathrm{ACF}_0\) but not in \(\mathrm{ACF}_p\) for \(p = 2\), so the bound is \(N = 2\) — the sentence transfers from \(\mathrm{ACF}_0\) to \(\mathrm{ACF}_p\) for all primes \(p > 2\).
</div>

## 2.5 Definable Sets and Algebraic Geometry

The definable sets in a model of \( \mathrm{ACF}_p \) are exactly the **constructible sets** in the sense of algebraic geometry: finite Boolean combinations of Zariski-closed sets. This identification is the bridge between model theory and algebraic geometry.

Under this correspondence:
- Atomic formulas correspond to algebraic hypersurfaces \( \{f = 0\} \);
- Existential formulas correspond to projections of constructible sets (constructible by Chevalley);
- Universal formulas correspond to complements of images of constructible sets (coconstructible);
- Elementary equivalence of algebraically closed fields reduces to characteristic agreement.

The richness of this bridge is exploited in geometric model theory, where one studies definable sets in ACF in the spirit of algebraic geometry, proving analogues of dimension theory, irreducibility, and intersection theory from first principles.

---

# Chapter 3: Real Closed Fields

## 3.1 The Theory RCF

A field \( R \) is **real closed** if it is formally real (no sum of squares equals \( -1 \)) and has no proper algebraic extension that is formally real. Equivalently, \( R \) is a real closed field if and only if:

- \( R \) is totally ordered by \( a \leq b \iff b - a \) is a sum of squares;
- Every positive element has a square root in \( R \);
- Every odd-degree polynomial over \( R \) has a root in \( R \).

The prototypical real closed field is \( (\mathbb{R}, +, \cdot, <) \). Others include the real algebraic numbers \( \mathbb{R}_{\mathrm{alg}} \) and the field of Puiseux series \( \bigcup_n \mathbb{R}((t^{1/n})) \).

The theory **RCF** is axiomatised in \( \mathcal{L}_{\mathrm{or}} = \{+, \cdot, -, 0, 1, <\} \) by the ordered field axioms together with:
- Every positive element is a square;
- Every odd-degree polynomial has a root.

<div class="theorem">
<strong>Theorem.</strong> RCF is complete.
</div>

<div class="proof">
Any two real closed fields of cardinality \( \aleph_1 \) that are elementarily equivalent in the countable sublanguage are isomorphic (they are both \( \eta_1 \)-orderings of cardinality \( \aleph_1 \)). Alternatively, completeness follows from Tarski's QE theorem together with the observation that every quantifier-free sentence in the language \( \mathcal{L}_{\mathrm{or}} \) is decided by the ordered field axioms.
</div>

## 3.2 Tarski's Theorem and QE for RCF

The landmark result of Alfred Tarski from the 1940s (published in full in 1951) is:

<div class="theorem">
<strong>Theorem (Tarski).</strong> RCF admits quantifier elimination in the language \( \mathcal{L}_{\mathrm{or}} \).
</div>

The proof proceeds by induction on quantifier depth, reducing to the elimination of a single existential quantifier over a quantifier-free formula. The key algebraic tool is **Sturm's theorem**: given a polynomial \( f(x) \) and an interval \( (a, b) \), the Sturm sequence of \( f \) determines the number of distinct real roots of \( f \) in \( (a, b) \). This allows one to express the condition \( \exists x\, \varphi(x, \bar{a}) \) (where \( \varphi \) is a conjunction of polynomial inequalities and equalities in \( x \)) as a quantifier-free condition on \( \bar{a} \) by checking sign conditions on discriminants and leading coefficients.

<div class="example">
The formula \( \exists x\, (x^2 + bx + c = 0) \) (asserting a real root of a quadratic) is equivalent to the quantifier-free formula \( b^2 - 4c \geq 0 \). This is the simplest case of Tarski's procedure.
</div>

<div class="theorem">
<strong>Corollary (Tarski Transfer Principle).</strong> A first-order sentence \( \sigma \) in the language of ordered fields \( \mathcal{L}_{\mathrm{or}} \) is true in \( \mathbb{R} \) if and only if it is true in every real closed field. Equivalently, \( \mathbb{R} \) and every real closed field satisfy exactly the same first-order sentences in \( \mathcal{L}_{\mathrm{or}} \).
</div>

<div class="proof">
This follows immediately from the completeness of RCF established above. Since RCF is complete, any two models satisfy the same sentences. The real field \( \mathbb{R} \) is a model of RCF, so every sentence true in \( \mathbb{R} \) is in the complete theory RCF, and hence true in every real closed field.
</div>

<div class="example">
<strong>Using the Tarski Transfer Principle.</strong> The intermediate value theorem says: if \( f \) is a polynomial and \( f(a) < 0 < f(b) \), then \( f \) has a root in \( (a, b) \). This is a first-order statement in \( \mathcal{L}_{\mathrm{or}} \) (for each fixed degree). Since it is true in \( \mathbb{R} \), it is true in every real closed field — including the field of real algebraic numbers \( \mathbb{R}_{\mathrm{alg}} \) and the field of Puiseux series. One does not need to reprove this from scratch in each field; the transfer principle does it for free.

Similarly, the Tarski transfer principle implies that the Archimedean property (every real number is bounded by some integer) is <em>not</em> a first-order sentence: it is true in \( \mathbb{R} \) but false in the non-Archimedean real closed field \( \mathbb{R}((t^{1/\infty})) \) of Puiseux series (where \( t \) is smaller than every positive rational). This is consistent because the Archimedean property is not expressible in \( \mathcal{L}_{\mathrm{or}} \).
</div>

As consequences of QE:
- Every definable set in \( \mathbb{R} \) (in one variable) is a finite union of points and open intervals — this is the content of o-minimality;
- The theory of the real field is decidable (there is an algorithm to determine the truth of any first-order sentence about real numbers);
- The first-order theory of \( \mathbb{R} \) and the first-order theory of \( \mathbb{R}_{\mathrm{alg}} \) coincide.

## 3.3 O-Minimality

<div class="definition">
An ordered structure \( (M, <, \ldots) \) is <strong>o-minimal</strong> if every definable subset of \( M \) (in one free variable, with parameters) is a finite union of points and open intervals (possibly with endpoints \( \pm \infty \)).
</div>

RCF is the canonical example of an o-minimal theory.

<div class="theorem">
<strong>Theorem (Monotonicity Theorem).</strong> If \( (M, <, \ldots) \) is o-minimal and \( f : M \to M \) is definable, then there is a finite partition of \( M \) into intervals on each of which \( f \) is either constant, strictly monotone increasing, or strictly monotone decreasing.
</div>

The power of o-minimality is that it yields a robust notion of **topological tameness**: o-minimal structures have well-behaved notions of dimension, they satisfy the Jordan curve theorem, and their definable sets have finitely many connected components.

## 3.4 Cell Decomposition

The most powerful structural result for o-minimal theories is the **cell decomposition theorem**, which describes the geometry of definable sets in multiple variables.

<div class="definition">
A <strong>cell</strong> in \( M^n \) is defined inductively. A cell in \( M^1 \) is either a point \( \{a\} \) or an open interval \( (a, b) \). A cell in \( M^{n+1} \) is either a <strong>graph cell</strong> \( \{(x, f(x)) : x \in C\} \) for a continuous definable function \( f \) on a cell \( C \subseteq M^n \), or a <strong>band cell</strong> \( \{(x, y) : x \in C,\ f(x) < y < g(x)\} \) (or variants with \( \pm\infty \) bounds) for definable continuous functions \( f < g \) on \( C \).
</div>

<div class="theorem">
<strong>Theorem (Cell Decomposition).</strong> Let \( (M, <, \ldots) \) be o-minimal. For any definable set \( X \subseteq M^n \), there exists a finite partition of \( M^n \) into cells such that \( X \) is a union of some of these cells.
</div>

Cell decomposition implies that every definable set in an o-minimal structure has a well-defined **dimension** (the maximum dimension of a cell in any cell decomposition of the set), and this dimension is well-behaved (invariant under definable bijections, subadditive under products, etc.).

<div class="example">
<strong>Worked cell decomposition in \( \mathbb{R}^2 \).</strong> Consider the semialgebraic set

\[
S = \{(x, y) \in \mathbb{R}^2 : x^2 + y^2 < 1,\; y > 0\}
\]
— the open upper semicircle (the upper half of the open unit disk). We produce a cell decomposition of \( \mathbb{R}^2 \) in which \( S \) is a union of cells.

<strong>Step 1: Decompose the \( x \)-axis.</strong> The natural partition of the \( x \)-coordinate is determined by the points where the semicircle has boundary singularities or where the defining polynomials change sign. The relevant \( x \)-values are \( -1 \) and \( 1 \) (where \( x^2 + y^2 = 1 \) meets the \( x \)-axis). So partition \( \mathbb{R} \) into the cells:

\[
C_1 = (-\infty, -1), \quad C_2 = \{-1\}, \quad C_3 = (-1, 1), \quad C_4 = \{1\}, \quad C_5 = (1, +\infty).
\]

<strong>Step 2: Decompose \( \mathbb{R}^2 \) above each \( x \)-cell.</strong>

- <em>Above \( C_1 \) and \( C_5 \)</em> (where \( |x| > 1 \)): The polynomial \( x^2 + y^2 - 1 > 0 \) for all \( y \), so \( S \) contributes nothing here. We decompose into the single band cell \( \{(x, y) : x \in C_j\} \) (the whole vertical strip), or we can do a finer decomposition, but since \( y > 0 \) adds a further split, we decompose as: \( \{y < 0\} \), \( \{y = 0\} \), \( \{y > 0\} \) (all disjoint from \( S \) since \( x^2 + y^2 \geq 1 \) there).

- <em>Above \( C_2 = \{-1\} \)</em> and \( C_4 = \{1\} \)**: On \( x = \pm 1 \), we have \( x^2 + y^2 < 1 \) only if \( y^2 < 0 \), impossible. So \( S \) contributes nothing above \( x = \pm 1 \). The fibers are decomposed into \( \{y < 0\} \cup \{y = 0\} \cup \{y > 0\} \), none of which are in \( S \).

- <em>Above \( C_3 = (-1, 1) \)</em>: For each \( x \in (-1,1) \), let \( h(x) = \sqrt{1 - x^2} > 0 \). The constraint \( x^2 + y^2 < 1 \) becomes \( -h(x) < y < h(x) \), and we further need \( y > 0 \). So the fiber \( S_x = \{y : (x,y) \in S\} = (0, h(x)) \). We decompose the fiber \( \mathbb{R} \) above \( x \in C_3 \) into the cells:

\[
(-\infty, -h(x)), \quad \{-h(x)\}, \quad (-h(x), 0), \quad \{0\}, \quad (0, h(x)), \quad \{h(x)\}, \quad (h(x), +\infty).
\]
The cell \( \{(x, y) : x \in C_3, 0 < y < h(x)\} \) is exactly the set \( S \). It is a band cell defined by the two continuous definable functions \( f(x) = 0 \) and \( g(x) = \sqrt{1-x^2} \) on the base cell \( C_3 \).

<strong>Conclusion.</strong> The set \( S \) is a single 2-dimensional band cell:

\[
S = \{(x, y) : x \in (-1, 1),\; 0 < y < \sqrt{1 - x^2}\}.
\]
Its dimension is 2 (as a 2-dimensional band cell). This is the cell decomposition of \( S \), and it confirms that \( S \) is a semialgebraic set with a well-defined topological structure (a 2-manifold with boundary, homeomorphic to an open half-disk).
</div>

<div class="remark">
The cell decomposition theorem is constructive in RCF: given a semialgebraic set defined by explicit polynomials, one can effectively compute a cell decomposition using Tarski's QE procedure. The cells produced are themselves semialgebraic, and each cell is definably homeomorphic to an open cube \( (0,1)^k \) for some \( k \leq n \). This provides the model-theoretic foundation for the topology of semialgebraic sets, developed further in the work of Bochnak–Coste–Roy on real algebraic geometry.
</div>

## 3.5 Semi-Algebraic Sets and the Real Nullstellensatz

A **semi-algebraic set** is a subset of \( \mathbb{R}^n \) defined by a finite Boolean combination of polynomial inequalities \( f(x_1, \ldots, x_n) > 0 \) and equalities \( g(x_1, \ldots, x_n) = 0 \). By QE for RCF, semi-algebraic sets are exactly the definable sets in \( (\mathbb{R}, +, \cdot, <) \).

<div class="theorem">
<strong>Theorem (Tarski–Seidenberg).</strong> The projection of a semi-algebraic set is semi-algebraic.
</div>

This is the real analogue of Chevalley's theorem and follows immediately from QE for RCF, since the projection corresponds to an existential quantifier.

**The Real Nullstellensatz.** In contrast to the complex Nullstellensatz, the ideal-theoretic description of real varieties requires accounting for the ordered structure:

<div class="theorem">
<strong>Theorem (Real Nullstellensatz).</strong> A polynomial \( f \in \mathbb{R}\left[x_1, \ldots, x_n\right] \) vanishes on the real zero set \( V_{\mathbb{R}}(f_1, \ldots, f_m) \) if and only if there exist \( g_i \in \mathbb{R}\left[x_1, \ldots, x_n\right] \) and a sum-of-squares polynomial \( s \) such that \[ f^{2k} + s = \sum_i g_i f_i \] for some integer \( k \geq 0 \).
</div>

---

# Chapter 4: Types and Saturation

## 4.1 What Are Types? A Motivating Perspective

In algebra, we often want to know whether two elements are "indistinguishable" by the ambient theory: are \( \sqrt{2} \) and \( \sqrt{3} \) interchangeable in some sense? In the rationals \( \mathbb{Q} \), both are "transcendental" from the perspective of \( \mathbb{Q} \) — more precisely, both satisfy the same polynomial (none with rational coefficients), so they agree on every quantifier-free formula over \( \mathbb{Q} \). But from the perspective of \( \mathbb{R} \), they are distinguishable: \( x < 1.5 \) is true of \( \sqrt{2} \approx 1.414 \) but false of \( \sqrt{3} \approx 1.732 \). The collection of all formulas that hold of an element, over a fixed set of parameters, is its **type** — a complete description of its first-order properties from the perspective of that parameter set.

Types are the central objects of study in model theory. They generalise the notion of "element" from a single structure to the space of all possible behaviours that an element could have. Just as algebraic geometry studies the spectrum of prime ideals rather than individual points, model theory studies the space of types rather than individual elements. This viewpoint, systematised through the Stone topology on the type space, is what gives model theory its power: one can study properties of definable sets by studying the topological properties of the space of types over a parameter set.

## 4.2 Complete Types

Let \( T \) be a complete theory, \( M \models T \), and \( A \subseteq M \). A **complete \( n \)-type over \( A \)** is a maximal consistent set of \( \mathcal{L}(A) \)-formulas in the free variables \( x_1, \ldots, x_n \). Informally, it is a complete description of how an \( n \)-tuple of elements should behave.

<div class="definition">
Let \( \bar{b} \in M^n \). The <strong>type of \( \bar{b} \) over \( A \)</strong> in \( M \) is

\[
\mathrm{tp}^M(\bar{b}/A) = \{\varphi(\bar{x}) \in \mathcal{L}(A) : M \models \varphi(\bar{b})\}.
\]
This is always a complete \( n \)-type over \( A \). We say \( M \) <strong>realises</strong> the type \( p \) if there exists \( \bar{b} \in M^n \) with \( \mathrm{tp}^M(\bar{b}/A) = p \).
</div>

The **type space** \( S_n(A) \) (or \( S_n^T(A) \)) is the set of all complete \( n \)-types over \( A \) consistent with \( T \). We equip \( S_n(A) \) with the **Stone topology**: a basis of open sets is given by \( [\varphi] = \{p \in S_n(A) : \varphi \in p\} \) as \( \varphi \) ranges over \( \mathcal{L}(A) \)-formulas. Under this topology, \( S_n(A) \) is a **Stone space** — compact, Hausdorff, and totally disconnected.

The relationship between types and definable sets is fundamental: a formula \( \varphi(\bar{x}) \) defines a clopen subset of \( S_n(A) \), namely \( [\varphi] \). Conversely, every clopen set in \( S_n(A) \) is of this form. Thus, the topology on the type space encodes exactly the definable predicates.

<div class="example">
<strong>Computing \( \mathrm{tp}(\sqrt{2}/\mathbb{Q}) \) in \( \mathbb{R} \models \mathrm{RCF} \).</strong> We work in the real closed field \( \mathbb{R} \) with parameters from \( \mathbb{Q} \). What is the complete \( 1 \)-type of \( \sqrt{2} \) over \( \mathbb{Q} \)?

The type \( p = \mathrm{tp}(\sqrt{2}/\mathbb{Q}) \) contains every formula \( \varphi(x) \) with coefficients in \( \mathbb{Q} \) such that \( \mathbb{R} \models \varphi(\sqrt{2}) \). Let us enumerate the key formulas:

1. <em>The minimal polynomial</em>: \( x^2 - 2 = 0 \) — but wait, is this in the type? Yes: \( (\sqrt{2})^2 = 2 \), so \( x^2 - 2 = 0 \in p \).

2. <em>Ordering information</em>: Since RCF has QE and the language includes \( < \), the type also contains all ordering formulas satisfied by \( \sqrt{2} \). Specifically:
   - \( x > 0 \) (since \( \sqrt{2} > 0 \));
   - \( x > 1 \) (since \( \sqrt{2} > 1 \));
   - \( x < 2 \) (since \( \sqrt{2} < 2 \));
   - More precisely, for every \( q \in \mathbb{Q} \), the formula \( x > q \) is in \( p \) iff \( q < \sqrt{2} \), and \( x < q \) is in \( p \) iff \( q > \sqrt{2} \).

3. <em>The type is determined by the cut</em>: Since \( \sqrt{2} \) is algebraic over \( \mathbb{Q} \) with minimal polynomial \( x^2 - 2 \), its type is completely determined by the conjunction:

\[
p \ni x^2 - 2 = 0 \;\wedge\; x > 0.
\]
This formula (together with the RCF axioms) implies every other formula in \( p \). Why? Because \( x^2 = 2 \) and \( x > 0 \) uniquely determine the "algebraic behaviour" of \( x \) in any real closed field: by the completeness of RCF and QE, any two elements satisfying \( x^2 = 2 \wedge x > 0 \) in models of RCF realise the same complete type over \( \mathbb{Q} \).

4. <em>Comparison with \( \sqrt{3} \)</em>: The element \( \sqrt{3} \) has type \( p' = \mathrm{tp}(\sqrt{3}/\mathbb{Q}) \), which contains \( x^2 - 3 = 0 \wedge x > 0 \). Since \( x^2 - 2 = 0 \) and \( x^2 - 3 = 0 \) cannot both be in a type (they imply \( 2 = 3 \)), we have \( p \neq p' \). The two types are distinct elements of \( S_1(\mathbb{Q}) \) in the theory RCF.

<em>General principle</em>: In RCF, the type \( \mathrm{tp}(a/\mathbb{Q}) \) for an algebraic \( a > 0 \) is isolated by its minimal polynomial together with the condition \( x > 0 \) (or \( x < 0 \)). For a transcendental element \( a \), the type is not isolated — it contains no single formula that "pins down" \( a \) uniquely — and it is determined by the Dedekind cut of \( a \) in \( \mathbb{Q} \), which is an infinite set of formulas.
</div>

<div class="example">
<strong>Types and automorphisms in ACF: \( \mathrm{tp}(i/\mathbb{Q}) = \mathrm{tp}(-i/\mathbb{Q}) \) in \( \mathbb{C} \).</strong> The previous example showed that in RCF, \( \mathrm{tp}(\sqrt{2}/\mathbb{Q}) \neq \mathrm{tp}(-\sqrt{2}/\mathbb{Q}) \) because the formula \( x > 0 \) distinguishes them. This raises the question: are there cases where conjugate elements <em>do</em> have the same type?

Work in the theory \( \mathrm{ACF}_0 \), with the monster model \( \mathbb{C} \). Consider the imaginary unit \( i = \sqrt{-1} \in \mathbb{C} \) and its conjugate \( -i \). Both satisfy the same minimal polynomial \( x^2 + 1 = 0 \) over \( \mathbb{Q} \). In the language \( \mathcal{L}_{\mathrm{rings}} = \{+, \cdot, -, 0, 1\} \) — which does <em>not</em> include an ordering — we claim:

\[
\mathrm{tp}(i/\mathbb{Q}) = \mathrm{tp}(-i/\mathbb{Q}) \quad \text{in } \mathbb{C} \models \mathrm{ACF}_0.
\]

<em>Proof via automorphism.</em> Complex conjugation \( \sigma : \mathbb{C} \to \mathbb{C} \), defined by \( \sigma(a + bi) = a - bi \), is an automorphism of the field \( \mathbb{C} \) that fixes \( \mathbb{Q} \) pointwise and sends \( i \mapsto -i \). Since \( \sigma \) is an automorphism fixing the parameter set \( \mathbb{Q} \), it preserves the truth of every \( \mathcal{L}_{\mathrm{rings}}(\mathbb{Q}) \)-formula: for any formula \( \varphi(x) \) with coefficients in \( \mathbb{Q} \),

\[
\mathbb{C} \models \varphi(i) \iff \mathbb{C} \models \varphi(\sigma(i)) = \varphi(-i).
\]
Therefore, \( i \) and \( -i \) satisfy exactly the same formulas over \( \mathbb{Q} \) in \( \mathbb{C} \), which means \( \mathrm{tp}(i/\mathbb{Q}) = \mathrm{tp}(-i/\mathbb{Q}) \).

<em>What does this type look like?</em> The type \( p = \mathrm{tp}(i/\mathbb{Q}) \) contains:
- The minimal polynomial: \( x^2 + 1 = 0 \);
- The negation of every linear polynomial: \( x \neq q \) for all \( q \in \mathbb{Q} \);
- More generally, \( f(x) \neq 0 \) for every \( f \in \mathbb{Q}[x] \) that does not have \( i \) as a root (i.e., every polynomial of which \( i \) is not a root).

The type \( p \) is <em>isolated</em> by the formula \( x^2 + 1 = 0 \) (together with the fact that in ACF, a monic irreducible polynomial has a unique type of root, up to field automorphism). Indeed, any two roots of \( x^2 + 1 \) in an algebraically closed field of characteristic 0 are conjugate under the field automorphism group over \( \mathbb{Q} \), confirming they have the same type.

<em>Contrast with RCF.</em> The reason \( \mathrm{tp}(\sqrt{2}/\mathbb{Q}) \neq \mathrm{tp}(-\sqrt{2}/\mathbb{Q}) \) in \( \mathbb{R} \models \mathrm{RCF} \) is that RCF has the formula \( x > 0 \) in its language, which distinguishes \( \sqrt{2} > 0 \) from \( -\sqrt{2} < 0 \). There is no automorphism of \( \mathbb{R} \) fixing \( \mathbb{Q} \) and sending \( \sqrt{2} \) to \( -\sqrt{2} \), because any field automorphism of \( \mathbb{R} \) must preserve the ordering (positive elements are exactly squares), and \( \sqrt{2} > 0 \) while \( -\sqrt{2} < 0 \). In fact, \( \mathrm{Aut}(\mathbb{R}/\mathbb{Q}) = \{1\} \) — the only automorphism of \( \mathbb{R} \) fixing \( \mathbb{Q} \) is the identity. By contrast, \( \mathrm{Aut}(\mathbb{C}/\mathbb{Q}) \) is enormous (of cardinality \( 2^{2^{\aleph_0}} \)), and complex conjugation is just one of its elements.

<em>General lesson.</em> In model theory, two elements \( a, b \) in a model \( M \) have the same type over \( A \) if and only if there is an automorphism \( \sigma \in \mathrm{Aut}(M/A) \) with \( \sigma(a) = b \) — but only when \( M \) is sufficiently saturated (homogeneous). In general, type equality implies the existence of such an automorphism in a saturated elementary extension, even if not in \( M \) itself. This connects the study of types to the Galois theory of first-order logic: the type space \( S_1(A) \) is a quotient of the "absolute Galois group" of \( A \) in the monster model.
</div>

## 4.3 Realising and Omitting Types

A type \( p(\bar{x}) \in S_n(A) \) is **realised** in \( M \supseteq A \) if some tuple in \( M \) has type \( p \) over \( A \). Since \( p \) is consistent with \( T \), any sufficiently saturated model realises \( p \). But not every type needs to be realised in every model.

<div class="definition">
A type \( p \in S_n(A) \) is <strong>isolated</strong> (or <strong>principal</strong>) if there exists a formula \( \varphi \in p \) such that \( T \cup \{\varphi(\bar{a}) : \bar{a} \in A\} \models \psi \) for every \( \psi \in p \); that is, the formula \( \varphi \) generates \( p \) in the sense that \( T \models \varphi(\bar{x}) \to \psi(\bar{x}) \) for all \( \psi \in p \).
</div>

Isolated types are always realised in any model containing \( A \) (by a standard argument using the defining formula). Non-isolated types, by contrast, can sometimes be omitted.

<div class="theorem">
<strong>Omitting Types Theorem.</strong> Let \( T \) be a complete theory in a countable language, and let \( \{p_n\}_{n < \omega} \) be a countable collection of non-isolated types over \( \emptyset \) (or over a finite parameter set). Then there exists a countable model \( M \models T \) that omits every \( p_n \).
</div>

The proof uses a Henkin construction with a back-and-forth bookkeeping that ensures, at each stage, that the type being constructed is not forced to extend any \( p_n \). The non-isolation hypothesis is essential: an isolated type cannot be omitted in any model.

## 4.4 Saturated and Homogeneous Models

<div class="definition">
A model \( M \models T \) is <strong>\( \kappa \)-saturated</strong> if for every set \( A \subseteq M \) with \( |A| < \kappa \), every type \( p \in S_n(A) \) is realised in \( M \). It is <strong>saturated</strong> if it is \( |M| \)-saturated.
</div>

Saturated models are the model-theoretic analogue of algebraically closed fields or other universal objects: they contain all possible types over small parameter sets.

<div class="theorem">
<strong>Theorem.</strong> If \( T \) is a complete theory and \( \kappa > |T| \) is a cardinal such that \( \kappa^{<\kappa} = \kappa \) (e.g., \( \kappa \) is a strongly inaccessible cardinal, or \( \kappa = \lambda^+ \) for any \( \lambda \geq |T| \)), then \( T \) has a saturated model of cardinality \( \kappa \).
</div>

<div class="example">
<strong>A saturated model of ACF\(_0\).</strong> The theory \( \mathrm{ACF}_0 \) has saturated models of every uncountable cardinal. A concrete construction is as follows. Start with \( \mathbb{Q} \). Adjoin a transcendental \( t_1 \) to get \( \mathbb{Q}(t_1) \). Then take the algebraic closure \( \overline{\mathbb{Q}(t_1)} \). Now adjoin another transcendental \( t_2 \) over \( \overline{\mathbb{Q}(t_1)} \), giving \( \overline{\mathbb{Q}(t_1)}(t_2) \), and then take algebraic closure. Continue transfinitely: at each ordinal step \( \alpha \), adjoin a transcendental \( t_\alpha \) and take algebraic closure. The union \( K = \bigcup_\alpha \overline{\mathbb{Q}(t_1, \ldots, t_\alpha)} \) over a long enough well-ordered sequence is an algebraically closed field.

For \( K \) to be \( \kappa \)-saturated, one needs to ensure that for every set \( A \subseteq K \) of size \( < \kappa \), every 1-type over \( A \) is realised in \( K \). The 1-types over \( A \) in \( \mathrm{ACF}_0 \) are:
- For each irreducible polynomial \( m(x) \) over the fraction field of \( A \): the type "be a root of \( m \)" (an isolated type, already realised since \( K \) is algebraically closed);
- The type "be transcendental over the fraction field of \( A \)" (realised as long as the transcendence degree of \( K \) over \( \mathbb{Q} \) exceeds \( |A| \)).

So for \( K \) to be \( \omega_1 \)-saturated (saturated for countable parameter sets), we need the transcendence degree of \( K \) to be uncountable. The field \( \overline{\mathbb{Q}(t_1, t_2, \ldots, t_n, \ldots)_{\omega_1}} \) — the algebraic closure of \( \mathbb{Q} \) with \( \omega_1 \)-many algebraically independent transcendentals adjoined — is \( \omega_1 \)-saturated.
</div>

<div class="definition">
A model \( M \models T \) is <strong>\( \kappa \)-homogeneous</strong> if for any two tuples \( \bar{a}, \bar{b} \in M^{<\kappa} \) with \( \mathrm{tp}(\bar{a}) = \mathrm{tp}(\bar{b}) \), every extension of \( \bar{a} \) to \( \bar{a} c \) has a matching extension: there exists \( d \in M \) with \( \mathrm{tp}(\bar{a} c) = \mathrm{tp}(\bar{b} d) \).
</div>

Saturated models are homogeneous of the same cardinal. Homogeneity is the "structural richness" version of saturation: every automorphism between small elementary substructures extends to an automorphism of the whole model.

## 4.5 The Monster Model

In modern model theory it is extremely convenient to work inside a single large saturated model, called the **monster model**.

<div class="definition">
Let \( T \) be a complete theory. A <strong>monster model</strong> \( \mathbb{M} \) for \( T \) is a model that is \( \kappa \)-saturated and \( \kappa \)-homogeneous for some strongly inaccessible cardinal \( \kappa \) larger than any set we will ever care about. We fix \( \mathbb{M} \) once and for all and work within it: all models of \( T \) that appear in arguments are assumed to be small elementary submodels of \( \mathbb{M} \), and all parameter sets are subsets of \( \mathbb{M} \) of size less than \( \kappa \).
</div>

Inside the monster model:
- Every complete type over a small set is realised;
- Any two tuples with the same type are conjugate under an automorphism of \( \mathbb{M} \);
- Definable sets have canonical representatives.

The monster model is not a set-theoretically innocent object — its existence requires strong set-theoretic hypotheses (or a convention about universes) — but its use is heuristically and technically invaluable. In practice, one either assumes the existence of sufficiently saturated models or works in a Grothendieck-universe framework.

## 4.6 A Worked Computation: Types in DLO

Understanding the type space of a concrete theory from scratch is an indispensable skill. The theory DLO of dense linear orders without endpoints is ideal for this, because its simplicity makes the type space completely explicit while still illustrating all the key phenomena: isolated versus non-isolated types, the growth of type spaces with parameters, and the connection between types and cuts.

**Types over \(\emptyset\) in DLO.** The type space \(S_1(\emptyset)\) consists of all complete 1-types over the empty parameter set. Since DLO is complete (Cantor's theorem) and has no constant symbols, every element of every model satisfies the same quantifier-free sentences over \(\emptyset\) (there are none that are non-trivially satisfiable). By QE, every formula is equivalent to a quantifier-free one, and every quantifier-free formula in one variable over \(\emptyset\) is a Boolean combination of tautologies (since there are no constants to compare against). The result is that there is exactly one complete 1-type over \(\emptyset\):

<div class="example">
<strong>Claim: \(\lvert S_1(\emptyset)\rvert = 1\) in DLO.</strong>

<em>Proof.</em> Let \(M = (\mathbb{Q}, <)\) and \(N = (\mathbb{Q}, <)\), and let \(a \in M\), \(b \in N\) be arbitrary. We claim \(\mathrm{tp}(a/\emptyset) = \mathrm{tp}(b/\emptyset)\). By QE, it suffices to check that \(a\) and \(b\) satisfy the same quantifier-free formulas over \(\emptyset\). But quantifier-free formulas in one free variable \(x\) with no parameters are built from atomic formulas \(x < x\) (always false), \(x = x\) (always true), and their Boolean combinations. None of these depends on the value of \(x\). Therefore, every quantifier-free formula over \(\emptyset\) in one variable is either always true or always false, and \(a, b\) agree on all of them.

Since DLO has QE, this agreement on quantifier-free formulas gives \(\mathrm{tp}(a/\emptyset) = \mathrm{tp}(b/\emptyset)\). There is exactly one complete 1-type over \(\emptyset\). This reflects the fact that DLO is complete and has no constants: the theory cannot distinguish between any two elements when no parameters are given.
</div>

**Types over one parameter.** Suppose we add a single parameter \(a\) to DLO. The type space \(S_1(\{a\})\) now consists of all complete 1-types of a new element \(x\) over the parameter set \(\{a\}\). The only atomic formulas available (over the parameter \(a\)) are \(x < a\), \(x = a\), and \(a < x\). By QE, every complete type is determined by which of these three cases holds:

<div class="example">
<strong>Claim: \(\lvert S_1(\{a\})\rvert = 3\) in DLO.</strong>

The three types are:

\[
p_{<a}(x) = \{x < a\} \cup \{\text{all consequences}\}, \quad p_{=a}(x) = \{x = a\}, \quad p_{>a}(x) = \{a < x\} \cup \{\text{all consequences}\}.
\]

Each is consistent: \(p_{<a}\) is realised by any element less than \(a\) (which exists by the no-minimum axiom), \(p_{=a}\) is realised by \(a\) itself, and \(p_{>a}\) is realised by any element greater than \(a\).

Each is complete: by QE, the formula \(x < a\) (together with the DLO axioms) decides every formula in one variable \(x\) over \(\{a\}\). Indeed, any formula \(\varphi(x, a)\) is equivalent modulo DLO to a Boolean combination of \(x < a\), \(x = a\), and \(x > a\), and if we know which case \(x\) falls into, the truth value of every such Boolean combination is determined.

<em>Which types are isolated?</em> All three types are isolated:
- \(p_{=a}\) is isolated by the formula \(x = a\) (which decides all formulas over \(\{a\}\)).
- \(p_{<a}\) is isolated by \(x < a\) — this single formula, together with DLO, implies every formula in \(p_{<a}\). Why? Any formula true of all elements less than \(a\) in any model of DLO is implied by \(x < a\) alone.
- Similarly, \(p_{>a}\) is isolated by \(a < x\).

So every type in \(S_1(\{a\})\) is isolated, which is consistent with the fact that the prime model of DLO over \(\{a\}\) (i.e., the smallest elementary extension of the one-element structure \(\{a\}\)) realises all types — and indeed \((\mathbb{Q}, <)\) with a named element \(a\) realises all three types.
</div>

**Types over two ordered parameters.** Now add two parameters \(a < b\) (so the parameter set \(A = \{a, b\}\) comes with the relation \(a < b\)). The complete 1-types over \(A\) are determined by how \(x\) compares to both \(a\) and \(b\):

<div class="example">
<strong>Claim: \(\lvert S_1(\{a, b\})\rvert = 5\) in DLO (when \(a < b\)).</strong>

The five types correspond to the five "intervals" (or points) determined by \(a\) and \(b\):

\[
p_1: x < a, \quad p_2: x = a, \quad p_3: a < x < b, \quad p_4: x = b, \quad p_5: b < x.
\]

Each is realised in \((\mathbb{Q}, <)\) by a suitable rational: \(p_1\) by any \(q < a\), \(p_2\) by \(a\), \(p_3\) by any \(q\) with \(a < q < b\) (which exists by density), \(p_4\) by \(b\), and \(p_5\) by any \(q > b\).

Each is isolated by the conjunction of the atomic formulas describing its interval. For example, \(p_3\) is isolated by \(a < x \wedge x < b\). All five types are complete by QE.

<em>Pattern for \(n\) parameters.</em> In general, given an ordered parameter set \(a_1 < a_2 < \cdots < a_n\), the type space \(S_1(\{a_1, \ldots, a_n\})\) has exactly \(2n + 1\) elements:

\[
x < a_1,\; x = a_1,\; a_1 < x < a_2,\; x = a_2,\; \ldots,\; a_{n-1} < x < a_n,\; x = a_n,\; a_n < x.
\]
This exponential-in-parameters growth \(2n+1\) is characteristic of o-minimal theories, where the type space over \(n\) parameters is always finite (in one variable).
</div>

**Isolation and principality in DLO.** In DLO, every type over a finite parameter set is isolated. This is because DLO has QE: every type is determined by a single quantifier-free formula (the one describing the "interval" or "point" the element lies in). The situation changes for infinite parameter sets: over a countably infinite dense order \(A\), the Dedekind cuts in \(A\) that are not filled by elements of \(A\) give non-isolated types (the type of any element filling such a cut cannot be isolated by a single formula over \(A\)).

<div class="remark">
The contrast between finite and infinite parameter sets in DLO illustrates a fundamental principle: a theory \(T\) is \(\omega\)-categorical (has a unique countable model up to isomorphism) if and only if \(\lvert S_n(\emptyset)\rvert\) is finite for every \(n\). For DLO: \(\lvert S_1(\emptyset)\rvert = 1\), \(\lvert S_2(\emptyset)\rvert = 2\) (the two complete 2-types are "first coordinate less than second" and "first coordinate greater than second"), \(\lvert S_3(\emptyset)\rvert = 6\) (the six orderings of three elements), and in general \(\lvert S_n(\emptyset)\rvert = n!\). Since these are all finite, DLO is \(\omega\)-categorical, and \((\mathbb{Q}, <)\) is the unique countable dense linear order without endpoints up to isomorphism — this is Cantor's theorem.
</div>

## 4.7 Isolation and Principal Types: A Closer Look

The concept of isolation is central to the omitting types theorem and to the distinction between prime and saturated models. This section develops the definition more carefully and illustrates it with a computation in ACF.

<div class="definition">
Let \(T\) be a complete theory and \(A\) a set of parameters. A complete type \(p(\bar{x}) \in S_n(A)\) is <strong>isolated</strong> (equivalently, <strong>principal</strong>) if there exists a single formula \(\varphi(\bar{x}) \in p\) such that

\[
T \cup \mathrm{Diag}_{\mathrm{el}}(A) \models \varphi(\bar{x}) \to \psi(\bar{x})
\]
for every \(\psi \in p\). In other words, \(\varphi\) alone (together with the theory and the elementary diagram of \(A\)) generates the entire type. The formula \(\varphi\) is called a <strong>complete formula</strong> or <strong>isolating formula</strong> for \(p\).
</div>

The significance of isolation is twofold: first, isolated types are always realised in any model containing \(A\) (one cannot omit them); second, non-isolated types are precisely those that the omitting types theorem allows one to omit.

<div class="example">
<strong>Every type over an algebraically closed set in ACF is isolated.</strong>

Let \(T = \mathrm{ACF}_0\) and let \(K\) be an algebraically closed subset of a model — that is, \(K\) is itself a model of \(\mathrm{ACF}_0\). We claim every complete 1-type \(p \in S_1(K)\) is isolated.

The complete 1-types over \(K\) in \(\mathrm{ACF}_0\) are of two kinds:
\begin{enumerate}
\item \emph{Algebraic types.} For each irreducible polynomial \(f(x) \in K[x]\), there is a type \(p_f = \{f(x) = 0\} \cup \{\text{consequences}\}\). This type is isolated by the formula \(f(x) = 0\): since \(K\) is algebraically closed and \(f\) is irreducible over \(K\), the roots of \(f\) in any algebraically closed extension of \(K\) all have the same complete type over \(K\) (they are conjugate under the Galois group). Thus \(f(x) = 0\) determines every formula in \(p_f\), and \(p_f\) is isolated.

\item \emph{The generic (transcendental) type.} There is a unique type \(p_{\mathrm{gen}}\) containing the formulas \(\{f(x) \neq 0 : f \in K[x],\, f \neq 0\}\) — the type of a transcendental element over \(K\). Is this type isolated?
\end{enumerate}

For case (2): the type \(p_{\mathrm{gen}}\) is isolated if there is a single formula \(\varphi(x)\) over \(K\) such that \(\mathrm{ACF}_0 \cup \mathrm{Diag}_{\mathrm{el}}(K) \models \varphi(x) \to \psi(x)\) for every \(\psi \in p_{\mathrm{gen}}\). Consider the formula \(\varphi(x) = \top\) (trivially true). This does not work — \(\top\) does not imply \(f(x) \neq 0\) for any specific \(f\). The type \(p_{\mathrm{gen}}\) is \emph{not} isolated if \(K\) is infinite: no single formula over \(K\) implies "transcendental over \(K\)."

However, the key point is that \(K\) is an algebraically closed \emph{field}, so it is already a model of \(\mathrm{ACF}_0\). The theory \(\mathrm{ACF}_0\) is \(\omega\)-stable, and in an \(\omega\)-stable theory, every type over a \emph{model} is stationary (has a unique non-forking extension). For types over a model \(M \models T\), isolation in the sense of "generated by a single formula" is replaced by stationarity. The generic type over the model \(K\) is the unique non-forking extension of the generic type over \(\emptyset\), and it is stationary (but not isolated by a single quantifier-free formula).

<em>The precise statement</em>: in ACF, every type over an algebraically closed base set \(K\) is either algebraic (isolated by the minimal polynomial) or the unique generic type (not isolated by a single formula, but stationary over \(K\)). The omitting types theorem applies only to non-isolated types over \(\emptyset\) or finite parameter sets; over a model, the situation is governed by stability and stationarity.

<em>Contrast with DLO</em>: over a finite parameter set in DLO, all types are isolated (as computed in §4.6). This is characteristic of \(\omega\)-categorical theories: every type over a finite set is isolated.
</div>

---

# Chapter 5: Omitting Types and Prime Models

## 5.1 Atomic Models

<div class="definition">
A formula \( \varphi(\bar{x}) \) is <strong>complete</strong> (over \( T \)) if for every \( \mathcal{L} \)-formula \( \psi(\bar{x}) \), we have \( T \models \varphi \to \psi \) or \( T \models \varphi \to \neg\psi \). A model \( M \models T \) is <strong>atomic</strong> if every finite tuple \( \bar{a} \in M^n \) has an isolated (principal) type over \( \emptyset \): there is a complete formula \( \varphi(\bar{x}) \) with \( \varphi \in \mathrm{tp}(\bar{a}) \).
</div>

Atomic models are, in a sense, the smallest and most "definable" models of \( T \): every element is characterised by a complete formula. Contrast this with saturated models, which realise every type and are thus the largest well-behaved models.

<div class="example">
In \( \mathrm{ACF}_0 \), the algebraic closure \( \overline{\mathbb{Q}} \) is an atomic model: every element \( \alpha \in \overline{\mathbb{Q}} \) satisfies a unique minimal polynomial over \( \mathbb{Q} \), which is a complete formula (up to field isomorphism). The formula "is a root of the minimal polynomial \( m_\alpha(x) \)" isolates the type of \( \alpha \).
</div>

## 5.2 Prime Models

<div class="definition">
A model \( M \models T \) is a <strong>prime model</strong> if it elementarily embeds into every model of \( T \): for any \( N \models T \), there exists an elementary embedding \( f : M \to N \).
</div>

The prime model is the "minimal" model in the elementary order: it sits inside everything else. Note that prime models need not be unique up to isomorphism in general, but for countable complete theories they are.

<div class="theorem">
<strong>Theorem.</strong> Let \( T \) be a complete theory with a prime model \( M \). Then \( M \) is atomic.
</div>

<div class="proof">
Suppose for contradiction that some \( \bar{a} \in M^n \) has a non-isolated type \( p = \mathrm{tp}(\bar{a}) \). By the Omitting Types Theorem, there is a countable model \( N \models T \) omitting \( p \). But \( M \) embeds elementarily into \( N \), so the image of \( \bar{a} \) must realise \( p \) in \( N \) — a contradiction.
</div>

<div class="theorem">
<strong>Theorem (Existence and Uniqueness of Prime Models).</strong> Let \( T \) be a complete theory in a countable language. Then:
<ol>
<li>A countable atomic model of \( T \) exists if and only if for every \( n \) and every consistent formula \( \varphi(\bar{x}) \), there exists a complete formula \( \psi(\bar{x}) \) with \( T \models \psi \to \varphi \).</li>
<li>If \( T \) has a countable atomic model, then it is unique up to isomorphism and is the prime model of \( T \).</li>
</ol>
</div>

The uniqueness proof uses a back-and-forth argument: given two countable atomic models \( M \) and \( N \), one builds an isomorphism step-by-step, using the fact that complete formulas characterise the types of tuples uniquely.

## 5.3 Countable Models and the Omitting Types Theorem in Practice

The Omitting Types Theorem is most powerful as a tool for constructing models with specific properties. Here is a standard application:

<div class="theorem">
<strong>Theorem.</strong> A complete theory \( T \) in a countable language has a prime model if and only if the isolated types are dense in \( S_n(\emptyset) \) for every \( n \): every consistent formula is contained in an isolated type.
</div>

<div class="example">
The theory \( \mathrm{Th}(\mathbb{Q}, +, \cdot) \) — the complete theory of the rationals as a field — does not have a prime model, because there exist consistent formulas with no complete extension (the complete types over \( \emptyset \) form a complicated topological space with no isolated points in certain coordinates).
</div>

<div class="remark">
The Omitting Types Theorem fails for uncountable languages and uncountable models in general. The appropriate generalisation to uncountable settings requires the machinery of stability theory and the use of non-forking extensions, which we develop in Chapter 9.
</div>

---

# Chapter 6: Interpretations and Imaginaries

## 6.1 Interpretations

Model theory provides a framework for comparing theories via the notion of **interpretation**: one structure can be "defined inside" another.

<div class="definition">
Let \( \mathcal{L} \) and \( \mathcal{L}' \) be languages, and let \( M \) be an \( \mathcal{L} \)-structure and \( N \) be an \( \mathcal{L}' \)-structure. An <strong>interpretation</strong> of \( N \) in \( M \) consists of:
<ol>
<li>A definable set \( D \subseteq M^k \) (for some \( k \));</li>
<li>A definable equivalence relation \( E \) on \( D \);</li>
<li>For each constant, function, and relation symbol of \( \mathcal{L}' \), a corresponding definable object on \( D/E \) (i.e., definable in \( M \) and respecting \( E \));</li>
</ol>
such that the resulting structure on \( D/E \) is isomorphic to \( N \).
</div>

The key point is that the quotient \( D/E \) may not literally be a subset of \( M \), but it is definably constructed from \( M \). This leads naturally to the study of definable equivalence relations and their quotients.

## 6.2 Imaginary Elements and T^eq

<div class="definition">
Let \( M \models T \). An <strong>imaginary element</strong> of \( M \) is an equivalence class \( a/E \) where \( E \) is a \( \emptyset \)-definable equivalence relation and \( a \in M^n \). The collection of all imaginary elements forms a structure \( M^{\mathrm{eq}} \).
</div>

The **\( T^{\mathrm{eq}} \) construction** (due to Shelah) extends the language of \( T \) by adding, for each \( \emptyset \)-definable equivalence relation \( E \) on \( M^n \), a new sort \( S_E \) whose elements are the equivalence classes \( M^n/E \), together with a definable projection map \( \pi_E : M^n \to S_E \). The theory \( T^{\mathrm{eq}} \) is the theory of the multi-sorted structure \( M^{\mathrm{eq}} \) for \( M \models T \).

<div class="theorem">
<strong>Theorem.</strong> If \( T \) is complete, then \( T^{\mathrm{eq}} \) is a complete theory in the many-sorted language, and the assignment \( M \mapsto M^{\mathrm{eq}} \) is functorial. Moreover, \( T^{\mathrm{eq}} \) has elimination of imaginaries.
</div>

The key property of \( T^{\mathrm{eq}} \) is that it makes all "definably-encoded" objects into genuine elements of a sort, so that canonical parameters always exist.

## 6.3 Elimination of Imaginaries

<div class="definition">
A theory \( T \) <strong>eliminates imaginaries</strong> if for every model \( M \models T \), every imaginary element \( a/E \in M^{\mathrm{eq}} \) is interdefinable with a real tuple: there is a tuple \( c \in M^n \) and definable functions \( f, g \) such that \( f(c) = a/E \) and \( g(a/E) = c \). Equivalently, every definable equivalence class has a canonical representative in the home sort.
</div>

<div class="theorem">
<strong>Theorem.</strong> \( \mathrm{ACF}_p \) eliminates imaginaries.
</div>

<div class="proof">
The key step is to show that for any \( \emptyset \)-definable equivalence relation \( E \) on \( M^n \) (in a model of \( \mathrm{ACF}_p \)), the equivalence class \( a/E \) is coded by a real tuple. One uses the fact that any orbit of a finite group acting on a tuple can be coded by the symmetric functions (elementary symmetric polynomials) of the tuple, and these are real elements. The general case reduces to this via field-theoretic Galois theory.
</div>

<div class="remark">
Real closed fields do <em>not</em> eliminate imaginaries in the language \( \mathcal{L}_{\mathrm{or}} \); one must pass to the language of ordered rings with additional structure, or accept working in \( T^{\mathrm{eq}} \). The failure of EI for RCF is related to the fact that conjugation by the absolute Galois group of \( \mathbb{R} \) does not always have a canonical representative.
</div>

## 6.4 Weak Elimination of Imaginaries and Canonical Parameters

<div class="definition">
A theory \( T \) has <strong>weak elimination of imaginaries</strong> if for every imaginary element \( e \in M^{\mathrm{eq}} \), there exists a real tuple \( c \in M^n \) such that \( e \) is definable over \( c \) and \( c \) is algebraic over \( e \) (in the sense of \( M^{\mathrm{eq}} \)).
</div>

Weak EI is sufficient for many applications. The **canonical parameter** of a definable set \( X \) is an imaginary element \( \ulcorner X \urcorner \in M^{\mathrm{eq}} \) that generates exactly the parameters needed to define \( X \): an automorphism \( \sigma \) of \( M^{\mathrm{eq}} \) fixes \( \ulcorner X \urcorner \) if and only if \( \sigma(X) = X \). Canonical parameters exist in any theory with elimination of imaginaries.

In practice, canonical parameters allow one to talk about "the code for a definable set" as a genuine element, enabling the definable closure and algebraic closure operations to interact cleanly with the independence calculus of Chapter 9.

## 6.5 A Worked Interpretation: The Natural Numbers in the Reals

Interpretations connect decidability and complexity across theories. One of the most instructive examples is the relationship between \(\mathbb{N}\) and \(\mathbb{R}\): can the natural numbers be interpreted in the ordered field of reals? The answer is subtle and illustrates a crucial distinction between the ring language and the ordered ring language. Understanding this example precisely requires careful attention to what "first-order definability" means in each context.

The attempt to interpret \(\mathbb{N}\) in \(\mathbb{R}\) proceeds as follows. By **Lagrange's four-square theorem**, every non-negative integer is a sum of four perfect squares of integers. This suggests the following candidate for the domain of a copy of \(\mathbb{N}\) inside \(\mathbb{R}\):

<div class="example">
<strong>Attempted interpretation of \(\mathbb{N}\) in \((\mathbb{R}, +, \cdot, <, 0, 1)\).</strong>

Define the domain of the intended copy of \(\mathbb{N}\) as:

\[
D = \bigl\{x \in \mathbb{R} : x \geq 0 \;\wedge\; \exists y_1 \exists y_2 \exists y_3 \exists y_4\,(y_1^2 + y_2^2 + y_3^2 + y_4^2 = x \;\wedge\; y_1^2 = y_1 \cdot y_1 \;\wedge\; \ldots)\bigr\}.
\]
The problem is that the formula \(\exists y_1 y_2 y_3 y_4\,(y_1^2 + y_2^2 + y_3^2 + y_4^2 = x)\) in the language of \emph{ordered real-closed fields} defines the set \(\{x \in \mathbb{R} : x \geq 0\}\) — the non-negative reals — not just the non-negative integers. This is because for any non-negative real \(r\), we can write \(r = (\sqrt{r})^2 + 0^2 + 0^2 + 0^2\), and \(\sqrt{r}\) is a real number. So the four-square condition in RCF simply characterises non-negative reals, not integers.

<em>Step 2: Can we define the integers using some other formula?</em> The integers \(\mathbb{Z}\) are not first-order definable in \((\mathbb{R}, +, \cdot, <)\). This is a consequence of Tarski's theorem: RCF is a complete, decidable theory, and the theory of \((\mathbb{Z}, +, \cdot)\) is undecidable (by Gödel). If \(\mathbb{Z}\) were first-order definable in \(\mathbb{R}\), then decidability of RCF would give decidability of \(\mathrm{Th}(\mathbb{Z}, +, \cdot)\), a contradiction.

More precisely: Tarski proved that the theory \(\mathrm{RCF} = \mathrm{Th}(\mathbb{R}, +, \cdot, <, 0, 1)\) admits quantifier elimination and is decidable. If \(\mathbb{N}\) were first-order definable in \(\mathbb{R}\) — meaning there is a formula \(\varphi(x)\) in the language \(\mathcal{L}_{\mathrm{or}}\) such that \(\mathbb{R} \models \varphi(n) \iff n \in \mathbb{N}\) — then any sentence \(\sigma\) about \(\mathbb{N}\) could be translated into a sentence about \(\mathbb{R}\) (by relativising all quantifiers to \(\varphi(x)\)). Decidability of RCF would then give an algorithm for deciding any sentence about \(\mathbb{N}\), contradicting Gödel's incompleteness theorem (or Turing's undecidability of the halting problem).

<em>Conclusion:</em> \(\mathbb{N}\) is \emph{not} first-order definable in \((\mathbb{R}, +, \cdot, <, 0, 1)\). Equivalently, there is no formula in \(\mathcal{L}_{\mathrm{or}}\) that defines exactly the natural numbers as a subset of \(\mathbb{R}\).
</div>

<div class="example">
<strong>Where the interpretation does work: \(\mathbb{N}\) in \((\mathbb{R}, +, \cdot)\) — and why it still fails.</strong>

One might hope that even in the pure field language \(\mathcal{L}_{\mathrm{rings}} = \{+, \cdot, -, 0, 1\}\) without an ordering, the four-square representation has a chance. The argument would be: in \(\mathbb{R}\), an element \(x\) is a sum of four squares of \emph{integers} if and only if it is a non-negative integer. But in the field language without ordering, we cannot even express "\(x \geq 0\)" — the ordering is not available. And the condition "\(y\) is an integer" is not first-order expressible in the ring language of \(\mathbb{R}\).

The deeper reason this fails is that \(\mathbb{R}\) is an uncountable o-minimal structure: by the o-minimality of RCF, every definable subset of \(\mathbb{R}\) in one variable is a finite union of points and open intervals. In particular, no infinite discrete subset of \(\mathbb{R}\) — such as \(\mathbb{N} = \{0, 1, 2, \ldots\}\) — is first-order definable. If \(\mathbb{N}\) were definable, it would have to be a finite union of points and intervals, but \(\mathbb{N}\) is infinite and discrete, containing no open interval.

<em>The resolution of the apparent paradox:</em> Gödel showed that the theory of \((\mathbb{N}, +, \cdot)\) is undecidable, while Tarski showed that the theory of \((\mathbb{R}, +, \cdot, <)\) is decidable. These two facts are consistent precisely because \(\mathbb{N}\) is not first-order interpretable in \(\mathbb{R}\). The o-minimality of RCF acts as a "tameness barrier": any structure that \(\mathbb{R}\) can interpret in a first-order way must itself be tame (its definable sets are geometrically well-behaved), and \(\mathbb{N}\) with its undecidable arithmetic is too wild.
</div>

<div class="remark">
This example illustrates the deep connection between interpretations and decidability. In general:
<ul>
<li>If \(N\) is first-order interpretable in \(M\), then \(\mathrm{Th}(M)\) is at least as complex as \(\mathrm{Th}(N)\) (the theory of \(M\) is "at least as hard" to decide).</li>
<li>Since \(\mathrm{Th}(\mathbb{R}, +, \cdot, <)\) is decidable and \(\mathrm{Th}(\mathbb{N}, +, \cdot)\) is undecidable, \(\mathbb{N}\) cannot be first-order interpretable in \(\mathbb{R}\).</li>
<li>Contrast this with the situation for \(\mathbb{Z}\): Matiyasevich's theorem (solving Hilbert's tenth problem, 1970) shows that \(\mathbb{Z}\) is definable in \(\mathbb{Z}[t]\) — or more precisely, that the integers are Diophantine in the polynomial ring — giving deep connections between Diophantine equations and undecidability.</li>
</ul>

The boundary between decidable and undecidable theories is precisely the boundary of what can and cannot be interpreted across structures, and model theory provides the framework to make this precise.
</div>

---

# Chapter 7: Strongly Minimal Sets and Pregeometries

## 7.1 Strongly Minimal Sets and Theories

Recall from Chapter 2 that a complete theory \( T \) is strongly minimal if every definable subset of a model, in one free variable, is finite or cofinite. This is the strongest possible form of tameness for one-dimensional definable sets.

<div class="definition">
A formula \( \varphi(x, \bar{b}) \) is <strong>strongly minimal</strong> if for any \( M \models T \) and any parameters \( \bar{c} \), the set \( \varphi(M, \bar{b}) \) is infinite, and for any further definable set \( D \subseteq \varphi(M, \bar{b}) \) defined by \( \psi(x, \bar{c}) \), either \( \varphi(M, \bar{b}) \cap \psi(M, \bar{c}) \) is finite or its complement in \( \varphi(M, \bar{b}) \) is finite.
</div>

A theory is strongly minimal if and only if the formula \( x = x \) is strongly minimal (in which case the whole model is the strongly minimal set). The key examples are:

- **Infinite vector spaces over a fixed field:** Every definable set in a vector space over, say, \( \mathbb{F}_p \) is a Boolean combination of cosets of definable subgroups, all of which are finite or cofinite in the one-variable case.
- **Algebraically closed fields:** As shown in Chapter 2 via QE.
- **Infinite sets with no extra structure:** The theory of infinite sets in the empty language (\( \mathrm{Th}(\mathbb{N}, =) \) restricted to atomic formulas) is strongly minimal and has only the trivial pregeometry.

<div class="example">
<strong>Three strongly minimal sets and the Zilber hierarchy.</strong> The Zilber trichotomy (Chapter 8) says that every strongly minimal set falls into one of three qualitative types. Here are the three canonical examples, each illustrating one type.

<strong>(1) Pure infinite set \( (S, =) \) — Disintegrated type.</strong> Take an infinite set \( S \) with no additional structure (language: equality only). The quantifier-free definable sets in \( (S, =) \) are Boolean combinations of equalities \( x = a \), hence finite or cofinite. So \( (S, =) \) is strongly minimal. The algebraic closure is trivial: \( \mathrm{acl}(A) = A \) (only finitely many points close, namely those already in \( A \)). Every element is "independent" of every other. This is the disintegrated case: there is no non-trivial structure, no group, no field, nothing — the elements are just points with no relations.

<strong>(2) The additive group \( (\mathbb{C}, +) \) — Locally modular type.</strong> The theory of a divisible torsion-free abelian group (equivalently, a \( \mathbb{Q} \)-vector space) is strongly minimal. In \( (\mathbb{C}, +) \), the definable sets in one variable are Boolean combinations of cosets of subgroups, which are finite or cofinite (since the only definable subgroups of a divisible group are the group itself and finite index subgroups). The algebraic closure \( \mathrm{acl}(A) \) in this theory is the \( \mathbb{Q} \)-linear span of \( A \). This is locally modular: the dimension theory satisfies the modular law for closed subsets. Crucially, no algebraically closed field is interpretable in this structure — there is no multiplication.

<strong>(3) The field \( (\mathbb{C}, +, \cdot) \) — Field-like type.</strong> The theory \( \mathrm{ACF}_0 \) is strongly minimal. The algebraic closure \( \mathrm{acl}(A) \) is the algebraic closure of the subfield generated by \( A \), and the dimension theory is transcendence degree. This is non-locally-modular: four generic points in \( \mathbb{C}^2 \) do not satisfy the dimension formula for modular lattices. The multiplication \( \cdot \) makes the field structure "visible" inside the strongly minimal set. By the Zilber trichotomy for ACF (proved by Zil'ber himself), this is the prototypical field-like case.

<em>The contrast</em>: moving from \( (S, =) \) to \( (\mathbb{C}, +) \) to \( (\mathbb{C}, +, \cdot) \), we add progressively more algebraic structure, and the pregeometry becomes correspondingly richer. The Zilber trichotomy says these are the only three possibilities for a strongly minimal set — but as Hrushovski showed (Chapter 8), there exist "exotic" strongly minimal sets that mimic the non-modular behaviour without having an interpretable field.
</div>

## 7.2 Algebraic Closure and Pregeometries

In a strongly minimal set \( D \), one defines a natural closure operator:

<div class="definition">
Let \( D \) be a strongly minimal set in a model \( M \) of a theory \( T \), and let \( A \subseteq D \). The <strong>algebraic closure</strong> \( \mathrm{acl}(A) \cap D \) consists of all \( b \in D \) such that the formula \( \varphi(x, \bar{a}) \) (for \( \bar{a} \in A \)) defining the type of \( b \) over \( A \) has only finitely many realisations in \( D \).
</div>

<div class="theorem">
<strong>Theorem.</strong> The operator \( A \mapsto \mathrm{acl}(A) \cap D \) is a pregeometry on \( D \).
</div>

A **pregeometry** is a closure operator satisfying:
1. **Extensivity:** \( A \subseteq \mathrm{acl}(A) \);
2. **Monotonicity:** \( A \subseteq B \Rightarrow \mathrm{acl}(A) \subseteq \mathrm{acl}(B) \);
3. **Idempotency:** \( \mathrm{acl}(\mathrm{acl}(A)) = \mathrm{acl}(A) \);
4. **Exchange (Steinitz):** If \( b \in \mathrm{acl}(Ac) \setminus \mathrm{acl}(A) \), then \( c \in \mathrm{acl}(Ab) \).

The exchange property is the crucial axiom and is the content of the following:

<div class="theorem">
<strong>Theorem (Steinitz Exchange Lemma).</strong> In a strongly minimal set \( D \), if \( b \in \mathrm{acl}(Ac) \setminus \mathrm{acl}(A) \), then \( c \in \mathrm{acl}(Ab) \).
</div>

<div class="proof">
Since \( b \in \mathrm{acl}(Ac) \), the set \( \{x \in D : \varphi(x, c, \bar{a})\} \) is finite for some formula \( \varphi \) with parameters \( \bar{a} \in A \). Since \( D \) is strongly minimal, the set \( \{y \in D : |\{x : \varphi(x, y, \bar{a})\}| = n\} \) is definable and, for any fixed \( n \), is either finite or cofinite in \( D \). One then shows that \( c \) satisfies a formula with parameter \( b \) and parameters from \( A \) that has finitely many solutions in \( D \), giving \( c \in \mathrm{acl}(Ab) \).
</div>

## 7.3 Dimension Theory

The pregeometry structure on a strongly minimal set gives a well-defined notion of dimension. A set \( B \subseteq D \) is **independent over \( A \)** if no element of \( B \) is in the algebraic closure of \( A \) together with the other elements of \( B \). The **dimension** of a tuple \( \bar{b} \) over \( A \) is the size of a maximal independent subset of \( \bar{b} \) over \( A \), and this is independent of the choice of basis.

<div class="theorem">
<strong>Theorem.</strong> Let \( D \) be a strongly minimal set. Any two maximal independent subsets of a set \( X \subseteq D \) over \( A \) have the same cardinality. Consequently, the <strong>dimension</strong> \( \dim(X/A) \) is well-defined.
</div>

In the algebraically closed field \( \overline{\mathbb{Q}} \), this dimension is exactly the transcendence degree. In an infinite vector space \( V \) over \( \mathbb{F}_p \), it is the linear dimension. These two cases are prototypical.

<div class="example">
Let \( V \) be a countably infinite vector space over \( \mathbb{Q} \). The strongly minimal theory of \( V \) has dimension function \( \dim(A) = \) linear dimension of \( \mathrm{span}(A) \) over \( \mathbb{Q} \). The theory is categorical in every uncountable cardinality (models of the same uncountable cardinality are isomorphic as they have the same dimension), and is the prototypical locally modular strongly minimal theory.
</div>

## 7.4 The Pregeometry and Geometric Model Theory

The pregeometry on a strongly minimal set is the foundation of **geometric model theory**: the study of model-theoretic properties through the lens of the algebraic/geometric structure of dimension and closure. Key notions:

- A pregeometry is **trivial** (or disintegrated) if \( \mathrm{acl}(A) = \bigcup_{a \in A} \mathrm{acl}(\{a\}) \) — closure adds nothing beyond closing individual points.
- A pregeometry is **modular** if for any closed sets \( X, Y \): \( \dim(X \cup Y) + \dim(X \cap Y) = \dim(X) + \dim(Y) \).
- A pregeometry is **locally modular** if some (equivalently, every) localisation at a point is modular.

These notions set the stage for the Zilber trichotomy of the next chapter.

---

# Chapter 8: The Zilber Trichotomy

## 8.1 Statement of the Trichotomy

Zilber's trichotomy conjecture (1980s) was one of the most influential conjectures in model theory. It asserts that the pregeometry of any strongly minimal set must be of one of exactly three types, corresponding to three qualitatively different algebraic structures.

<div class="theorem">
<strong>Zilber's Trichotomy (Conjectured Form).</strong> Let \( D \) be a strongly minimal set. Then exactly one of the following holds:
<ol>
<li><strong>Disintegrated (trivial):</strong> The pregeometry on \( D \) is trivial — \( \mathrm{acl}(A) = \bigcup_{a \in A} \mathrm{acl}(a) \).</li>
<li><strong>Locally modular (non-trivial):</strong> The pregeometry is locally modular but not disintegrated. In this case, \( D \) is closely related to a group: there is a definable group whose pregeometry is the same as that of \( D \).</li>
<li><strong>Field-like:</strong> The pregeometry is not locally modular, in which case an algebraically closed field is definably interpretable in \( D \).</li>
</ol>
</div>

This trichotomy is beautiful because it says that the only source of non-modularity in a strongly minimal set is an interpretable field — the most algebraically rich structure.

## 8.2 The Cases

**Disintegrated.** The prototypical example is an infinite set in the empty language (the theory of infinitely many disjoint elements with no structure). Here, algebraic closure adds nothing: \( \mathrm{acl}(\{a_1, \ldots, a_n\}) = \{a_1, \ldots, a_n\} \). The definable sets are extremely simple.

**Locally modular.** The prototypical examples are infinite vector spaces over a division ring. The pregeometry is the linear pregeometry of the vector space, which is modular. Any strongly minimal set with a locally modular non-trivial pregeometry is, up to definable bijection, closely related to an abelian group — this is the Hrushovski–Pillay theorem in the strongly minimal context.

**Field-like.** The prototypical example is an algebraically closed field. The pregeometry is transcendence degree, which is not locally modular (four generic points in \( \mathbb{C}^2 \) do not satisfy the modular law). By Zilber's theorem (for the specific case of ACF), the non-modularity is explained entirely by the field structure.

<div class="example">
<strong>Why the field structure is "visible" in \( (\mathbb{C}, +, \cdot) \).</strong> The strongly minimal set \( \mathbb{C} \models \mathrm{ACF}_0 \) has pregeometry given by transcendence degree. The failure of local modularity can be seen concretely: consider four points in \( \mathbb{C}^2 \). Let \( a, b, c \) be algebraically independent over \( \emptyset \), and let \( d = a \cdot b + c \) (computed using the field multiplication). Then \( d \in \mathrm{acl}(a, b, c) \), so \( \dim(\{a, b, c, d\}) = 3 \). But the "modularity dimension count" would give 4 if the four points were truly independent. The dependence \( d = ab + c \) encodes information about the multiplication, which "mixes" the dimensions.

The formal statement is: the pregeometry of \( (\mathbb{C}, +, \cdot) \) is not locally modular because there exist four generic points \( a_1, a_2, a_3, a_4 \in \mathbb{C} \) with \( a_1 + a_2 a_3 = a_4 \) — an algebraic relation using both addition and multiplication — so that the dimension of \( \{a_1, a_2, a_3, a_4\} \) is 3, not 4, yet no pair is acl-dependent. This is precisely what fails in the modular law: the intersection \( \mathrm{acl}(a_1, a_2) \cap \mathrm{acl}(a_3, a_4) \) contains algebraic relations coming from the field structure that are not predicted by the linear dimension formula.

The Zilber trichotomy says this is no accident: the non-local-modularity of \( \mathbb{C} \) is precisely because the multiplication \( \cdot \) is definable, making \( (\mathbb{C}, +, \cdot) \) an interpretable algebraically closed field. In any strongly minimal set where such a field is interpretable, the pregeometry must be non-locally-modular, and conversely (in the strongly minimal case over \( \mathbb{C} \)), any non-locally-modular pregeometry must interpret a field.
</div>

## 8.3 Hrushovski's Counterexample

The original conjecture was that the trichotomy holds for ALL strongly minimal sets. In a major 1993 paper, Ehud Hrushovski constructed counterexamples:

<div class="theorem">
<strong>Theorem (Hrushovski, 1993).</strong> There exist strongly minimal sets that are not disintegrated, not locally modular, and yet do not interpret any algebraically closed field.
</div>

Hrushovski's construction used a novel "amalgamation with controls" technique (now called the **Hrushovski amalgamation** or **Fraïssé–Hrushovski construction**). One starts with a class of finite structures and defines a predimension function, then takes a specific limit. The resulting structure is strongly minimal but "generic" — it lacks the rich interpretable field that Zilber's conjecture would require.

The counterexamples showed that the trichotomy, as a universal statement about all strongly minimal sets, is false. However, the conjecture retains its power and validity in specific geometric contexts.

## 8.4 Zilber's Trichotomy for Differentially Closed Fields

Let **DCF\(_0\)** denote the theory of differentially closed fields of characteristic 0 (existentially closed differential fields). This theory is complete, model complete, and has QE in the language of differential fields. Its strongly minimal sets are the "differential algebraic varieties."

<div class="theorem">
<strong>Theorem (Hrushovski–Sokolović, Pillay–Ziegler).</strong> Every strongly minimal set definable in a differentially closed field satisfies the Zilber trichotomy: it is either disintegrated, locally modular (and then comes from a one-dimensional definable group, which must be a simple abelian variety), or interprets an algebraically closed field (and then is essentially an algebraic curve over the constants).
</div>

This theorem has deep applications to number theory, most notably to the **Mordell–Lang conjecture**:

<div class="theorem">
<strong>Theorem (Hrushovski, 1996).</strong> The Mordell–Lang conjecture holds for function fields: if \( G \) is a semiabelian variety over a field \( K \) of characteristic 0, \( \Gamma \leq G(K) \) is a finitely generated subgroup, and \( X \subseteq G \) is a closed subvariety, then \( X(K) \cap \Gamma \) is a finite union of cosets of subgroups of \( \Gamma \).
</div>

Hrushovski's proof uses the model theory of DCF\(_0\) in an essential way: the Mordell–Lang configuration is translated into a question about strongly minimal sets in a differentially closed field, and the trichotomy determines the structure of the intersection.

## 8.5 Geometric Model Theory

The Zilber trichotomy initiated the program of **geometric model theory**: the classification of first-order theories according to the geometry of their strongly minimal sets. Key developments:

- The classification of simple theories (generalising strongly minimal to "SU-rank 1" configurations);
- The Hrushovski–Zilber theorem characterising Zariski geometries (strongly minimal sets with a topology behaving like Zariski topology must come from algebraic curves);
- Applications to the André–Oort conjecture and other problems in number theory.

---

# Chapter 9: Forking and Independence

## 9.1 Non-Dividing Extensions

The central notion of Shelah's stability theory is a well-behaved independence relation on types, generalising algebraic independence in fields. We work in the monster model \( \mathbb{M} \) of a complete theory \( T \).

<div class="definition">
A formula \( \varphi(x, \bar{b}) \) <strong>divides over \( A \)</strong> if there exist \( \bar{b}_1, \bar{b}_2, \ldots \) such that:
<ol>
<li>\( \mathrm{tp}(\bar{b}_i / A) = \mathrm{tp}(\bar{b} / A) \) for all \( i \) (the \( \bar{b}_i \) are \( A \)-conjugates of \( \bar{b} \));</li>
<li>The collection \( \{\varphi(x, \bar{b}_i)\}_{i < \omega} \) is \( k \)-inconsistent for some finite \( k \) (no \( k \) of them have a common solution).</li>
</ol>
</div>

<div class="definition">
A type \( p(\bar{x}) \in S(B) \) <strong>forks over \( A \subseteq B \)</strong> if \( p \) implies a finite disjunction of formulas each of which divides over \( A \). The type \( p \) is a <strong>non-forking extension</strong> of \( p \restriction A \) if it does not fork over \( A \).
</div>

The intuition: a type \( p \) over \( B \) forks over \( A \) if the element realising \( p \) is "dependent" on the extra parameters in \( B \setminus A \) in a non-trivial way.

## 9.2 The Independence Relation

<div class="definition">
We write \( \bar{a} \mathop{\smile\!\!\!\!|}_{A} B \) (read "\( \bar{a} \) is independent from \( B \) over \( A \)") if \( \mathrm{tp}(\bar{a}/AB) \) does not fork over \( A \).
</div>

In stable theories, this independence relation has the following fundamental properties:

<div class="theorem">
<strong>Theorem (Properties of Non-Forking in Stable Theories).</strong> Let \( T \) be stable and work in the monster model. The non-forking independence relation \( \mathop{\smile\!\!\!\!|}^{} \) satisfies:
<ol>
<li><strong>Invariance:</strong> If \( \bar{a} \mathop{\smile\!\!\!\!|}_{A} B \) and \( \sigma \in \mathrm{Aut}(\mathbb{M}) \), then \( \sigma(\bar{a}) \mathop{\smile\!\!\!\!|}_{\sigma(A)} \sigma(B) \).</li>
<li><strong>Monotonicity:</strong> If \( \bar{a} \mathop{\smile\!\!\!\!|}_{A} B \) and \( A \subseteq A' \subseteq B' \subseteq B \), then \( \bar{a} \mathop{\smile\!\!\!\!|}_{A'} B' \).</li>
<li><strong>Transitivity:</strong> If \( \bar{a} \mathop{\smile\!\!\!\!|}_{A} B \) and \( \bar{a} \mathop{\smile\!\!\!\!|}_{B} C \) with \( A \subseteq B \subseteq C \), then \( \bar{a} \mathop{\smile\!\!\!\!|}_{A} C \).</li>
<li><strong>Symmetry:</strong> \( \bar{a} \mathop{\smile\!\!\!\!|}_{A} \bar{b} \) if and only if \( \bar{b} \mathop{\smile\!\!\!\!|}_{A} \bar{a} \).</li>
<li><strong>Extension:</strong> For any \( \bar{a}, A, B \) with \( A \subseteq B \), there exists \( \bar{a}' \equiv_A \bar{a} \) with \( \bar{a}' \mathop{\smile\!\!\!\!|}_{A} B \).</li>
<li><strong>Local character:</strong> For any \( \bar{a} \) and any set \( B \), there exists \( A \subseteq B \) with \( |A| \leq |T| \) such that \( \bar{a} \mathop{\smile\!\!\!\!|}_{A} B \).</li>
<li><strong>Finite character:</strong> \( \bar{a} \mathop{\smile\!\!\!\!|}_{A} B \) if and only if \( \bar{a} \mathop{\smile\!\!\!\!|}_{A} B_0 \) for every finite \( B_0 \subseteq B \).</li>
</ol>
</div>

These properties make the forking independence relation behave like algebraic independence in fields or linear independence in vector spaces.

## 9.3 Stable Theories

<div class="definition">
A complete theory \( T \) is <strong>stable</strong> if for some (equivalently, every) infinite cardinal \( \kappa \geq |T| \), we have \( |S_n(A)| \leq |A|^{|T|} \) for every set \( A \) with \( |A| = \kappa \) and every \( n \). Equivalently, \( T \) is stable if no formula has the order property (it does not define a linear order on an infinite set of elements).
</div>

Stability is a condition on the number of types: stable theories have "few" complete types over any parameter set, while unstable theories have "many." The canonical examples of stable theories are:

- **Strongly minimal theories** (in particular, \( \mathrm{ACF}_p \) and the theory of infinite vector spaces);
- **Modules and abelian groups** (with appropriate language);
- **DCF\(_0\)** (differentially closed fields);
- **Separably closed fields** of given imperfection degree.

Unstable theories include RCF (which has the order property: the ordering \( < \) defines a linear order) and the theory of linear orders.

## 9.4 The Independence Theorem

One of the deepest results in stability theory is the Independence Theorem, also called the stationarity of types over models:

<div class="theorem">
<strong>Theorem (Independence Theorem over Models).</strong> Let \( T \) be stable and let \( M \models T \) be a model. Suppose \( a \mathop{\smile\!\!\!\!|}_{M} b \) and \( p = \mathrm{tp}(a/M) \), \( q = \mathrm{tp}(b/M) \). If \( r_1, r_2 \) are non-forking extensions of \( p \) and \( q \) respectively to \( M \cup \{b\} \) and \( M \cup \{a\} \), then there exists a single element \( c \) realising both \( r_1 \) and \( r_2 \) simultaneously over \( M \cup \{a, b\} \), and \( c \mathop{\smile\!\!\!\!|}_{M} ab \).
</div>

This theorem is the technical heart of many results in stability theory, including the existence and uniqueness of non-forking extensions and the construction of "independent" amalgamations.

A key corollary is **stationarity** of types over models in stable theories:

<div class="theorem">
<strong>Theorem (Stationarity).</strong> In a stable theory, every type over a model has a unique non-forking extension to any larger set of parameters.
</div>

This uniqueness is what makes forking in stable theories so well-behaved: once we fix a base model, there is a canonical way to extend types "without adding dependence."

## 9.5 Forking in Strongly Minimal Sets

In a strongly minimal theory, the forking independence relation has an especially clean description in terms of the pregeometry:

<div class="theorem">
<strong>Theorem.</strong> Let \( T \) be strongly minimal with monster model \( \mathbb{M} \). Then:

\[
a \mathop{\smile\!\!\!\!|}_{A} B \iff a \notin \mathrm{acl}(B) \text{ or } a \in \mathrm{acl}(A).
\]
Equivalently, \( \mathrm{tp}(a/B) \) does not fork over \( A \) if and only if \( \dim(a/B) = \dim(a/A) \) — the transcendence degree of \( a \) over \( B \) equals the transcendence degree of \( a \) over \( A \).
</div>

This shows that in \( \mathrm{ACF}_p \), forking independence is exactly algebraic independence: \( a \mathop{\smile\!\!\!\!|}_{A} B \) if and only if \( a \) is algebraically independent from \( B \) over \( A \) (in the field-theoretic sense). Similarly, in an infinite vector space \( V \) over a field \( F \), \( \bar{v} \mathop{\smile\!\!\!\!|}_{A} B \) if and only if \( \bar{v} \) is linearly independent from \( B \) over the span of \( A \).

<div class="example">
In \( \mathbb{C} \models \mathrm{ACF}_0 \), let \( A = \mathbb{Q} \), and let \( a = \pi \) (transcendental), \( b = e \) (transcendental). We have \( \pi \mathop{\smile\!\!\!\!|}_{\mathbb{Q}} e \) if and only if \( \pi \) and \( e \) are algebraically independent over \( \mathbb{Q} \). Whether this holds is an open problem in transcendence theory — showing that forking independence is a conceptual refinement of algebraic independence, not a replacement for it.
</div>

## 9.6 Superstability and Hyperstability

Beyond stability, one has a refinement:

<div class="definition">
A stable theory \( T \) is <strong>superstable</strong> if for every model \( M \models T \) and every type \( p \in S_1(M) \), there exists a finite set \( A \subseteq M \) such that \( p \) does not fork over \( A \). It is <strong>\(\omega\)-stable</strong> (or <strong>totally transcendental</strong>) if \( |S_n(A)| \leq \aleph_0 \) for every countable set \( A \).
</div>

The hierarchy is: \(\omega\)-stable \( \Rightarrow \) superstable \( \Rightarrow \) stable. Strongly minimal theories are \(\omega\)-stable. The theory DCF\(_0\) is \(\omega\)-stable. Abelian groups can be stable without being superstable.

<div class="example">
<strong>The theory of \( (\mathbb{Z}, +) \) is superstable but not \( \omega \)-stable.</strong> The group \( (\mathbb{Z}, +) \) is a torsion-free abelian group. Its complete theory \( \mathrm{Th}(\mathbb{Z}, +) \) is the theory of torsion-free divisible abelian groups (it is axiomatisable as: abelian group, torsion-free, and for each prime \( p \), the element \( nx = a \) is solvable for certain \( a \)'s — but this is not quite right; the complete theory of \( (\mathbb{Z}, +) \) is the theory of \( \mathbb{Z} \) as an abelian group, which is more subtle than the theory of \( \mathbb{Q} \)).

More precisely: the theory of \( (\mathbb{Z}, +) \) in the language of abelian groups \( \{+, -, 0\} \) has the following properties:
- <em>Stable</em>: Abelian groups are stable (their theory is superstable and classifiable). The stability follows from the fact that abelian groups have a good dimension theory via their decomposition into \( p \)-components.
- <em>Superstable</em>: The theory \( \mathrm{Th}(\mathbb{Z}, +) \) is superstable. For any type \( p \in S_1(M) \) over a model \( M \), there is a finite set \( A \subseteq M \) over which \( p \) does not fork. This follows from the structure theory of abelian groups.
- <em>Not \( \omega \)-stable</em>: The type space \( S_1(\mathbb{Z}) \) is uncountable. To see this: for each set \( P \) of primes, consider the type \( p_P(x) = \{x \equiv 0 \pmod{p} : p \in P\} \cup \{x \not\equiv 0 \pmod{q} : q \notin P\} \). Different sets \( P \) give different types (these are the "divisibility types"), and there are \( 2^{\aleph_0} \) such types — uncountably many. Hence \( |S_1(\mathbb{Z})| = 2^{\aleph_0} > \aleph_0 \), so the theory is not \( \omega \)-stable.

The contrast with ACF\(_0\): in ACF\(_0 \), the type \( S_1(\emptyset) \) has exactly two points — "transcendental" and, for each irreducible polynomial \( p(x) \in \mathbb{Q}[x] \), the type "root of \( p \)." This is countable, confirming that ACF\(_0\) is \( \omega \)-stable.
</div>

<div class="example">
<strong>The stability hierarchy — a summary table.</strong> The following table situates the main theories of this course within the stability classification. Each property is strictly stronger than the one below it (the inclusions are proper).

| Class | Characterisation | Examples | Non-examples |
|---|---|---|---|
| \( \omega \)-stable | \( \lvert S_n(A) \rvert \leq \aleph_0 \) for countable \( A \) | ACF\(_p\), DCF\(_0\), infinite vector spaces | \( (\mathbb{Z}, +) \) |
| Superstable | Local character holds with finite witness | \( (\mathbb{Z}, +) \), all \( \omega \)-stable theories | Some abelian groups |
| Stable | No formula has the order property | Abelian groups, modules, separably closed fields | RCF, DLO |
| NIP | No formula has the independence property | RCF, \( p \)-adic fields, ordered abelian groups | Random graph, ACFA |
| NSOP | No formula has the strict order property | Simple theories (e.g., ACFA) | Many theories |

The containments are:

\[
\omega\text{-stable} \;\subsetneq\; \text{superstable} \;\subsetneq\; \text{stable} \;\subsetneq\; \text{NIP} \;\subsetneq\; \text{NSOP}.
\]

<em>Key points</em>:
- RCF is NIP (because ordered fields have a well-behaved "Vapnik–Chervonenkis" dimension) but not stable (because the ordering \( < \) witnesses the order property).
- The random graph (the Rado graph) is NSOP but not NIP: the formula \( xEy \) (edge relation) has the independence property.
- ACFA (the theory of generic automorphisms of algebraically closed fields, studied by Chatzidakis–Hrushovski) is simple but not stable: it has the independence property but satisfies a weaker version of non-forking called "independence theorem for simple theories."

This hierarchy is Shelah's main classification, and the goal of stability theory is to prove structural results about the models of theories in each class.
</div>

In an \(\omega\)-stable theory, one can define a **Morley rank** (the Cantor–Bendixson rank of the type space), which gives a well-behaved ordinal-valued dimension theory extending the dimension in strongly minimal sets. The Morley rank is the foundation for the structure theory of \(\omega\)-stable theories and underpins the classification program initiated by Shelah and furthered by Buechler, Hart, and others.

## 9.7 Theory-by-Theory Stability Classification

It is instructive to compare the main theories of this course side by side in the stability hierarchy. The following table records whether each theory is stable, superstable, or \(\omega\)-stable, together with a brief reason for each entry.

| Theory | Stable? | Superstable? | \(\omega\)-stable? | Reason / Key property |
|---|---|---|---|---|
| \(\mathrm{ACF}_p\) | **Yes** | **Yes** | **Yes** (strongly minimal) | QE to quantifier-free; \(S_1(A)\) countable for countable \(A\); Morley rank \( = \) transcendence degree |
| RCF | **No** | **No** | **No** | The formula \(x < y\) has the order property; \(\lvert S_1(\mathbb{R})\rvert = 2^{\aleph_0}\) |
| \(\mathrm{Th}(\mathbb{Z}, +)\) | **Yes** | **Yes** | **No** | Stable: no order property for abelian groups. Superstable: local character holds. Not \(\omega\)-stable: \(2^{\aleph_0}\) divisibility types over \(\mathbb{Z}\) |
| Random graph (Rado) | **No** | **No** | **No** | Edge relation \(xEy\) has the independence property; the theory is simple but not stable |
| \(\mathrm{DCF}_0\) | **Yes** | **Yes** | **Yes** | QE in differential ring language; strongly minimal constant field \(C\); Morley rank \(\omega\) for the differential closure |

<div class="remark">
A few remarks on the table entries:

<strong>ACF\(_p\) is \(\omega\)-stable.</strong> For any countable set \(A\), the complete 1-types over \(A\) in ACF\(_p\) are: one "generic transcendental" type, and for each irreducible polynomial \(f \in A[x]\) one type "root of \(f\)". Since \(A\) is countable, there are countably many polynomials and hence countably many types. So \(\lvert S_1(A)\rvert \leq \aleph_0\), confirming \(\omega\)-stability.

<strong>RCF is not stable.</strong> The ordering \(<\) witnesses the order property: for any \(n\), choose rationals \(a_1 < a_2 < \cdots < a_n < b_1 < b_2 < \cdots < b_n\); then \(\mathbb{R} \models a_i < b_j\) iff \(i \leq n\) (approximately). More formally, the formula \(\varphi(x, y) = (x < y)\) orders \(\mathbb{R}\), and the order property follows. Unstable theories have \(\lvert S_1(A)\rvert = 2^{\lvert A\rvert}\) for arbitrarily large \(A\), which holds for RCF.

<strong>\(\mathrm{Th}(\mathbb{Z}, +)\) is superstable but not \(\omega\)-stable.</strong> As computed in §9.6 above, there are \(2^{\aleph_0}\) many "divisibility types" over the countable parameter set \(\mathbb{Z}\), showing non-\(\omega\)-stability. Superstability follows from the general theory of abelian groups (Shelah's classification of abelian groups).

<strong>The random graph is not stable.</strong> In the Rado graph \(G = (\mathbb{N}, E)\), for any two disjoint finite sets \(A, B \subset \mathbb{N}\) there exists a vertex \(v\) adjacent to all of \(A\) and none of \(B\). This is the extension property, which implies the independence property for the formula \(xEy\). No theory with the independence property can be stable.

<strong>DCF\(_0\) is \(\omega\)-stable.</strong> The key fact is that DCF\(_0\) has QE in the language of differential rings, and the type space over a countable set of parameters is controlled by countably many differential polynomial equations. The theory is not strongly minimal (it has many infinite definable sets that are not cofinite), but it is \(\omega\)-stable with Morley rank \(\omega\) on the prime model.
</div>

---

# Appendix A: Problem Sets

## Part A: Quantifier Elimination

These problems develop fluency with the QE test and its applications to specific theories.

**Problem A.1.** Let \( T = \mathrm{DLO} \) and let \( \varphi(x, y) = \exists z\, (x < z \wedge z < y) \). Use the QE for DLO to find an equivalent quantifier-free formula. What is the definable set \( \{(a, b) \in \mathbb{Q}^2 : \varphi(a, b)\} \)?

**Problem A.2.** Let \( K \) be an algebraically closed field and consider the formula

\[
\varphi(a, b, c) = \exists x\, (x^2 + ax + b = 0 \wedge x \neq c).
\]
(a) Eliminate the existential quantifier to obtain an equivalent quantifier-free formula in \( a, b, c \). (b) Describe the constructible set defined by \( \varphi \) in terms of the discriminant and the value \( c \).

**Problem A.3.** Verify that the theory of infinite Boolean algebras (in the language \( \{\wedge, \vee, \neg, 0, 1\} \)) does not admit QE in this language, but does admit QE in the expanded language with predicates for "there are at most \( n \) atoms below \( x \)" for each \( n \).

**Problem A.4.** Let \( T \) be a model-complete theory. Show that \( T \) has QE if and only if for every quantifier-free formula \( \varphi(\bar{x}, y) \), the formula \( \exists y\, \varphi(\bar{x}, y) \) is equivalent (modulo \( T \)) to a quantifier-free formula. (Hint: proceed by induction on quantifier complexity.)

## Part B: Types and Saturation

**Problem B.1.** Work in \( (\mathbb{Q}, <) \models \mathrm{DLO} \). (a) Describe the complete 1-type of \( \sqrt{2} \) over \( \mathbb{Q} \) in DLO (viewing \( \mathbb{Q} \) as a suborder of \( \mathbb{R} \), which is also a model of DLO). (b) Is this type isolated? Justify. (c) Construct a countable model of DLO that omits this type.

**Problem B.2.** Let \( T = \mathrm{ACF}_0 \) and \( A = \mathbb{Q} \). (a) How many complete 1-types over \( A \) are there in \( S_1(\mathbb{Q}) \)? (b) Which of these types are isolated? (c) Show that the type space \( S_1(\mathbb{Q}) \) is homeomorphic to the Stone–Čech compactification of a countable discrete space union the Cantor set.

**Problem B.3.** Let \( V \) be a countably infinite vector space over \( \mathbb{Q} \) with basis \( \{e_1, e_2, \ldots\} \). Compute \( \mathrm{tp}(e_1 + e_2 / \{e_1\}) \) in the theory of \( \mathbb{Q} \)-vector spaces. Is this type isolated? What is its dimension (in the sense of the pregeometry)?

**Problem B.4.** Show that if \( T \) is \( \omega \)-stable and \( M \models T \) is a countable model, then \( M \) is not saturated unless \( T \) has only finitely many types over \( \emptyset \). (Hint: Use the fact that a saturated countable model of an \( \omega \)-stable theory would need to realise uncountably many types, contradicting countability.)

## Part C: Stability and Forking

**Problem C.1.** Let \( T = \mathrm{ACF}_0 \) and let \( A = \mathbb{Q} \), \( a = \pi \), \( B = \mathbb{Q}(e) \). (a) Describe what it means for \( a \mathop{\smile\!\!\!\!|}_{A} B \) in terms of algebraic independence. (b) Under the unproven (but widely believed) assumption that \( \pi \) and \( e \) are algebraically independent over \( \mathbb{Q} \), verify all the properties of non-forking for this instance.

**Problem C.2.** Compute the Morley rank \( \mathrm{RM}(\varphi) \) for the following formulas in \( \mathrm{ACF}_0 \): (a) \( \varphi(x) = x^3 - 2x + 1 = 0 \); (b) \( \varphi(x, y) = y^2 = x^3 - x \) (the Legendre elliptic curve, viewed as a definable set in two variables); (c) \( \varphi(x) = x = x \) (the whole field).

**Problem C.3.** Show that the theory of \( (\mathbb{Z}/p^n\mathbb{Z}, +) \) for a fixed prime \( p \) and \( n \geq 2 \) is stable. Is it \( \omega \)-stable? Compute the type space \( S_1(\emptyset) \) explicitly.

**Problem C.4.** Let \( T \) be a superstable theory and let \( M \models T \). Prove that for any \( a \in \mathbb{M} \) and any \( B \supseteq M \), the non-forking extension of \( \mathrm{tp}(a/M) \) to \( B \) is unique. (This is the stationarity theorem; sketch the proof using local character of forking.)

## Part D: Interpretations and Imaginaries

**Problem D.1.** Show that the theory of dense linear orders DLO does not eliminate imaginaries. Hint: Consider the equivalence relation \( E \) defined by \( x \sim y \iff (x < c \leftrightarrow y < c) \) for a fixed parameter \( c \); show that the \( E \)-class of \( c^- \) (the "cut from the left") has no canonical representative.

**Problem D.2.** Show that the projective plane \( \mathbb{P}^2(K) \) over an algebraically closed field \( K \) is interpretable in \( K \) (in the sense of model theory). What is the definable equivalence relation \( E \) on \( K^3 \setminus \{0\} \) whose quotient gives \( \mathbb{P}^2(K) \)?

**Problem D.3.** Let \( T = \mathrm{ACF}_p \) and let \( E \) be the equivalence relation on pairs \( (a, b) \in K^2 \) defined by: \( (a, b) \sim (c, d) \) iff the unordered pairs \( \{a, b\} \) and \( \{c, d\} \) are equal (i.e., \( \{a, b\} = \{c, d\} \) as sets). Show that the imaginary element \( \{a, b\}/E \) is coded by a real tuple using the elementary symmetric polynomials \( a + b \) and \( ab \).

**Problem D.4.** Show that the theory of infinite sets with no structure (empty language, axiom "there are infinitely many distinct elements") eliminates imaginaries. Hint: For any definable equivalence relation \( E \) on \( M^n \), characterise the possible \( E \)-classes and find canonical representatives.

## Part E: Challenge Problems

**Problem E.1 (ω-stability of DCF₀).** Let DCF\(_0\) be the theory of differentially closed fields of characteristic 0. Show that DCF\(_0\) is \( \omega \)-stable by the following steps: (a) Show that DCF\(_0\) has QE in the language of differential rings \( \{+, \cdot, -, \partial, 0, 1\} \). (b) Show that every type in \( S_1(A) \) for countable \( A \) is determined by a countable set of polynomial differential equations and inequations over \( A \). (c) Conclude that \( |S_1(A)| \leq \aleph_0 \) for countable \( A \).

**Problem E.2 (RCF is not stable).** Show that the theory RCF is not stable by proving that the formula \( \varphi(x, y) = x < y \) has the order property: there exist elements \( a_i, b_j \in \mathbb{R} \) (for \( i, j < \omega \)) such that \( \mathbb{R} \models a_i < b_j \) iff \( i < j \). Conclude that \( |S_1(\mathbb{R})| \geq 2^{\aleph_0} \), which exceeds the bound for stability.

**Problem E.3 (Morley's theorem, sketch).** The goal is to sketch the proof that if a countable complete theory \( T \) is \( \kappa \)-categorical for some uncountable \( \kappa \), then \( T \) is \( \omega \)-stable. (a) Show that if \( T \) is not \( \omega \)-stable, then \( |S_1(A)| > \aleph_0 \) for some countable \( A \). (b) Use this to construct \( 2^{\aleph_1} \) non-isomorphic models of \( T \) of cardinality \( \aleph_1 \), contradicting \( \aleph_1 \)-categoricity. (c) Use \( \omega \)-stability to show that \( T \) is categorical in all uncountable cardinals via the Morley rank.

**Problem E.4 (Hrushovski construction — baby case).** Let \( \mathcal{C} \) be the class of finite graphs \( G \) equipped with a "predimension" \( \delta(G) = |V(G)| - |E(G)| \). (a) Show that there is a Fraïssé limit \( M \) of the class \( \{G \in \mathcal{C} : \delta(H) \geq 0 \text{ for all } H \subseteq G\} \). (b) Show that the complete theory of \( M \) is strongly minimal. (c) Verify that the pregeometry of \( M \) is neither disintegrated nor locally modular, nor does it interpret an algebraically closed field. (This is the "Hrushovski graph," a concrete instance of his 1993 counterexample to the Zilber trichotomy.)

## Part F: Forking and Independence Problems

These problems develop the forking calculus. All work takes place inside the monster model \( \mathbb{M} \) of the relevant theory.

**Problem F.1 (Forking in ACF).** Work in \( T = \mathrm{ACF}_0 \) with monster model \( \mathbb{C} \).

(a) Let \( a = \sqrt[3]{2} \) (a real cube root of 2), \( A = \mathbb{Q} \), and \( B = \mathbb{Q}(e^{2\pi i/3}) \). Determine whether \( a \mathop{\smile\!\!\!\!|}_{A} B \) (i.e., whether \( \mathrm{tp}(a/AB) \) forks over \( A \)). Justify in terms of algebraic independence.

(b) Let \( \pi_1, \pi_2, \pi_3 \) be three elements algebraically independent over \( \mathbb{Q} \), and let \( c = \pi_1 \pi_2 + \pi_3 \). Show that \( c \mathop{\smile\!\!\!\!|}_{\mathbb{Q}} \{\pi_1, \pi_2\} \) if and only if \( c \notin \overline{\mathbb{Q}(\pi_1, \pi_2)} \). Determine explicitly whether this holds.

(c) Show that the non-forking extension of the type "transcendental over \( \mathbb{Q} \)" from \( A = \mathbb{Q} \) to any countable algebraically closed \( B \supseteq \mathbb{Q} \) is the unique complete type "transcendental over \( B \)." Conclude that in ACF\(_0\), non-forking extensions of the generic type are unique.

(d) Verify the symmetry axiom of forking in the following instance: let \( a, b \in \mathbb{C} \) be algebraically independent over \( \mathbb{Q} \). Show directly from the definition that \( a \mathop{\smile\!\!\!\!|}_{\mathbb{Q}} b \) implies \( b \mathop{\smile\!\!\!\!|}_{\mathbb{Q}} a \).

**Problem F.2 (Forking in vector spaces).** Let \( V \) be a countably infinite \( \mathbb{Q} \)-vector space, with theory \( T = \mathrm{Th}(V, +, 0) \).

(a) Describe the forking independence relation \( \mathop{\smile\!\!\!\!|} \) in \( T \): show that \( \bar{v} \mathop{\smile\!\!\!\!|}_{A} B \) if and only if \( \bar{v} \) is linearly independent from \( B \) over \( \mathrm{span}(A) \).

(b) Verify the extension axiom: given any \( v \in V \) and any finite-dimensional subspace \( W \supseteq U \) (where \( U = \mathrm{span}(A) \)), show that there exists \( v' \) with \( \mathrm{tp}(v'/U) = \mathrm{tp}(v/U) \) and \( v' \mathop{\smile\!\!\!\!|}_{U} W \). (Hint: extend a basis of \( U \) to a basis of \( W \) and use linear algebra to find \( v' \).)

(c) Show that the transitivity axiom holds in this instance: if \( v \mathop{\smile\!\!\!\!|}_{U} W \) and \( v \mathop{\smile\!\!\!\!|}_{W} X \) with \( U \subseteq W \subseteq X \), then \( v \mathop{\smile\!\!\!\!|}_{U} X \).

(d) Confirm that the local character axiom holds: for any \( v \in V \) and any (possibly infinite-dimensional) subspace \( W \), there exists a finite-dimensional \( U \subseteq W \) with \( v \mathop{\smile\!\!\!\!|}_{U} W \).

**Problem F.3 (Non-forking extensions and uniqueness).** Let \( T \) be a complete stable theory and let \( M \models T \) be a model.

(a) Prove that the non-forking extension of a type over \( M \) to any \( B \supseteq M \) is unique. (This is the stationarity theorem for stable theories. Hint: use the fact that in a stable theory, two types over \( M \) that agree on every formula over \( M \) are equal, and apply the definition of forking.)

(b) Give a concrete instance of stationarity in \( \mathrm{ACF}_0 \): let \( p = \mathrm{tp}(\pi / \mathbb{Q}) \) be the "transcendental type" (the generic type of ACF\(_0\) over \( \mathbb{Q} \)). Show that \( p \) has a unique non-forking extension to \( \mathbb{Q}(e) \) (where \( e \) is Euler's number), and describe this extension explicitly.

(c) Show by counterexample that stationarity fails for unstable theories: in DLO, exhibit a type \( p \in S_1(\mathbb{Q}) \) with two distinct non-forking extensions to \( \mathbb{Q} \cup \{\sqrt{2}\} \). (Note: "non-forking" in DLO must be interpreted carefully — DLO is not stable, so forking is not well-defined in the stable sense. Instead, use the notion of "definable extension" and show there are multiple choices.)

(d) Let \( T \) be \( \omega \)-stable and let \( p \in S_1(\emptyset) \) have Morley rank \( \alpha \). Show that every non-forking extension of \( p \) over any set \( A \) also has Morley rank \( \alpha \). Conclude that Morley rank is preserved under non-forking extension.

**Problem F.4 (Independence axioms and abstract forking).** An **abstract independence relation** on a complete theory \( T \) is a ternary relation \( \bar{a} \mathop{\smile\!\!\!\!|}_{A} B \) on small subsets of the monster model satisfying: Invariance, Monotonicity, Transitivity, Symmetry, Extension, Local Character, and Finite Character (as in §9.2).

(a) Show that the relation \( \bar{a} \mathop{\smile\!\!\!\!|}_{A} B \iff \bar{a} \cap \mathrm{acl}(AB) \subseteq \mathrm{acl}(A) \) (algebraic non-dependence over \( A \)) satisfies all the axioms in the strongly minimal theory \( \mathrm{ACF}_0 \).

(b) Show that in a stable theory, the forking independence relation is the unique abstract independence relation. (This is Shelah's uniqueness theorem for forking in stable theories. Hint: show that any abstract independence relation satisfying the axioms must agree with forking on whether a type forks over a model.)

(c) Construct an abstract independence relation in DLO by defining \( a \mathop{\smile\!\!\!\!|}_{A} B \) iff the cut determined by \( a \) in the ordering of \( A \) is the same as the cut determined by \( a \) in the ordering of \( AB \). Show that this satisfies Invariance, Monotonicity, and Extension, but fails Symmetry. Conclude that DLO does not admit a well-behaved symmetric independence relation (consistent with its instability).

(d) The theory of the random graph (Rado graph) is simple but not stable. In simple theories, one has a well-behaved notion of independence called **forking** (defined using dividing), but it may not satisfy Stationarity. Show that in the Rado graph, the type "is adjacent to all of a finite set \( A \) and not adjacent to any element of a finite set \( B \)" does not fork over \( \emptyset \), using the extension property of the Rado graph.

## Part G: Additional Challenge Problems

**Problem G.1 (\(\omega\)-stability of ACF from first principles).** Prove directly, without appealing to Morley's theorem, that \( \mathrm{ACF}_0 \) is \(\omega\)-stable.

(a) Let \( A \) be a countable set of parameters. Show that every complete 1-type \( p \in S_1(A) \) is determined by specifying: (i) whether the realising element is algebraic or transcendental over the field \( F = \overline{\mathbb{Q}(A)} \); (ii) if algebraic, the minimal polynomial of the realising element over \( F \).

(b) Count the number of types in each case: show that there are at most countably many algebraic types (since \( F \) is countable and each algebraic type corresponds to an irreducible polynomial over \( F \)), and exactly one transcendental type.

(c) Conclude that \( \lvert S_1(A)\rvert \leq \aleph_0 \) for any countable \( A \), and hence that \( \mathrm{ACF}_0 \) is \(\omega\)-stable.

(d) Generalise: show that \( \lvert S_n(A)\rvert \leq \aleph_0 \) for every \( n \) and every countable \( A \), by reducing \( n \)-types to successive 1-types (type of \( a_1 \) over \( A \), then type of \( a_2 \) over \( A \cup \{a_1\} \), etc.).

**Problem G.2 (Saturated model of DLO of size \(\aleph_1\)).** Construct a saturated model of DLO of cardinality \(\aleph_1\) (assuming \(2^{\aleph_0} = \aleph_1\), i.e., the Continuum Hypothesis).

(a) Recall that \( S_1(A) \) for DLO and a countable \( A \) consists of: one type for each Dedekind cut in \( A \) that is not filled by an element of \( A \), plus two types "greater than everything in \( A \)" and "less than everything in \( A \)." Show that \( \lvert S_1(A)\rvert = 2^{\aleph_0} = \aleph_1 \).

(b) Describe the construction of a saturated model of size \(\aleph_1\): start with \( (\mathbb{Q}, <) \), and at each countable ordinal step \(\alpha < \omega_1\), extend the current model by realising every complete 1-type over the current (countable) parameter set, giving a new countable model. Take the union at limit ordinals.

(c) Show that the resulting model \( M = \bigcup_{\alpha < \omega_1} M_\alpha \) has cardinality \(\aleph_1\) and is \(\aleph_1\)-saturated (assuming CH): for any countable \( A \subseteq M \), every type in \( S_1(A) \) is realised in \( M \).

(d) Conclude that under CH, \( M \) is the unique (up to isomorphism) saturated model of DLO of cardinality \(\aleph_1\). This is an \(\eta_1\)-ordering — a universal homogeneous countably saturated dense linear order of cardinality \(\aleph_1\).

**Problem G.3 (RCF is model complete but not strongly minimal).** Prove the following two facts about RCF.

(a) \emph{RCF is model complete.} Show that if \( R \subseteq S \) are real closed fields (as ordered fields), then every existential sentence with parameters in \( R \) that holds in \( S \) already holds in \( R \). (Hint: Use Tarski's QE theorem. Every formula is equivalent to a quantifier-free one, and quantifier-free formulas are preserved downward under substructure.)

(b) \emph{RCF is not strongly minimal.} Exhibit an infinite definable subset of \( \mathbb{R} \) that is neither finite nor cofinite. (Any interval \((a, b)\) with \( a, b \in \mathbb{Q} \) will do — it is definable by \( a < x \wedge x < b \), infinite, and its complement \( (-\infty, a] \cup [b, +\infty) \) is also infinite.)

(c) Show that the failure of strong minimality is related to the failure of \(\omega\)-stability: use the existence of uncountably many Dedekind cuts in \(\mathbb{Q}\) to exhibit uncountably many 1-types over \(\mathbb{Q}\) in RCF, confirming that \(\lvert S_1(\mathbb{Q})\rvert = 2^{\aleph_0}\).

(d) Deduce from (a) and (b) that model completeness does not imply strong minimality (nor even stability). Identify the precise property that RCF has which ACF\(_p\) lacks, that prevents RCF from being stable. (Answer: RCF has the order property — the formula \( x < y \) linearly orders the model — while ACF\(_p\) has no definable linear order on an infinite set.)

**Problem G.4 (Constructing the differential closure of \(\mathbb{Q}\)).** This problem explores DCF\(_0\) as an analogue of ACF\(_0\).

(a) State (without proof) the axioms of DCF\(_0\): the theory of existentially closed differential fields of characteristic 0. Show that DCF\(_0\) is a complete theory with QE in the differential ring language.

(b) Recall that the constant field \( C_M = \{a \in M : \partial(a) = 0\} \) of any model \( M \models \mathrm{DCF}_0 \) is an algebraically closed field. Show that the inclusion \( C_M \hookrightarrow M \) is a definable embedding (the map is defined by the formula \( \partial(x) = 0 \)).

(c) Let \( M \models \mathrm{DCF}_0 \) be the prime model (the differential closure of \(\mathbb{Q}\) as a differential field, where \(\partial\) is the trivial derivation on \(\mathbb{Q}\)). Show that \( M \) is an atomic model of DCF\(_0\), and that every element of \( M \) satisfies a polynomial differential equation over \(\mathbb{Q}\).

(d) Using the \(\omega\)-stability of DCF\(_0\), show that the Morley rank of the set \(\{x : \partial(x) = 0\}\) (the constants) inside DCF\(_0\) is \(\omega\). Explain why this implies that the theory of the constants (as an algebraically closed field) is "embedded" at a definable level inside the \(\omega\)-stable structure of DCF\(_0\), analogous to how ACF\(_0\) embeds in DCF\(_0\) via the constant field.

---

# Appendix B: Comprehensive Problem Set

This problem set is designed to be attempted after reading all chapters. Problems are grouped by theme and roughly increasing in difficulty within each part. Solutions to starred problems (\(\star\)) require material from Chapter 8 or 9.

## Part A: Quantifier Elimination (Five Problems)

The following problems develop and test fluency with the QE criterion, its verification, and its consequences across a range of theories.

**Problem A\(_1\).** (DLO has QE via the Shoenfield criterion.) Prove directly that DLO admits quantifier elimination by verifying the Shoenfield back-and-forth criterion.

(a) State the criterion precisely: \(T\) has QE iff for all \(M, N \models T\), all common substructures \(A\), and all \(b \in M\), there exists \(c \in N\) such that \((A, b)\) and \((A, c)\) satisfy the same quantifier-free \(\mathcal{L}\)-sentences.

(b) Let \(M = N = (\mathbb{Q}, <)\) and let \(A = \{a_1 < a_2 < \cdots < a_n\} \subseteq \mathbb{Q}\) be a finite suborder. Given any \(b \in \mathbb{Q}\), describe the quantifier-free type of \(b\) over \(A\): it is determined entirely by where \(b\) lies relative to the finitely many elements of \(A\) (i.e., which interval \(b\) falls into among the \(2n+1\) intervals determined by \(A\)).

(c) For each of the \(2n+1\) possible positions of \(b\), exhibit an explicit \(c \in \mathbb{Q}\) with the same relative position. Use the density axiom (between any two elements there is a third) and the no-endpoints axioms.

(d) Conclude that the Shoenfield criterion is verified and DLO has QE. Deduce that DLO is complete by noting that over the empty parameter set, all quantifier-free sentences in one variable are decided by the axioms alone.

**Problem A\(_2\).** (Infinite sets in the empty language have QE.) Let \(T_\infty\) be the theory of infinite sets in the pure equality language \(\mathcal{L} = \{=\}\), axiomatised by: all the sentences \(\exists x_1 \cdots \exists x_n\, \bigwedge_{i \neq j} x_i \neq x_j\) (there are at least \(n\) distinct elements) for each \(n \geq 1\).

(a) Show that \(T_\infty\) is complete: any two infinite sets in the equality language satisfy the same sentences (since there are no non-trivial quantifier-free sentences in this language other than tautologies).

(b) Show that \(T_\infty\) has QE: any formula in the equality language is equivalent modulo \(T_\infty\) to a quantifier-free formula. (Hint: the only definable subsets of a model of \(T_\infty\) are finite and cofinite sets, defined by Boolean combinations of equalities \(x = a_i\). Show directly that any existential formula is equivalent to a quantifier-free one.)

(c) Conclude that \(T_\infty\) is strongly minimal. What is the pregeometry on a model of \(T_\infty\)? (Answer: the trivial/disintegrated pregeometry, where \(\mathrm{acl}(A) = A\) for all finite \(A\).)

(d) Compare with ACF: both \(T_\infty\) and \(\mathrm{ACF}_p\) are strongly minimal, but their pregeometries are qualitatively different. Identify the key distinction in terms of the Zilber trichotomy.

**Problem A\(_3\).** (Presburger arithmetic has QE in an enriched language.) Presburger arithmetic is the theory of \((\mathbb{Z}, +, 0, 1, <)\) — the integers with addition and the ordering, but without multiplication. It is known to have QE in the language \(\mathcal{L}_{P} = \{+, 0, 1, <\} \cup \{d_n : n \geq 2\}\), where \(d_n(x)\) is a unary predicate meaning "n divides x."

(a) Explain why the divisibility predicates \(d_n\) are necessary. Exhibit a formula \(\varphi(x) = \exists y\, (x = 2y)\) (meaning "\(x\) is even") and show that it has no quantifier-free equivalent in the language \(\{+, 0, 1, <\}\) without \(d_2\). (Hint: the formula \(d_2(x)\) is the natural QE output; without it, no quantifier-free formula in \(\{+, 0, 1, <\}\) alone can define the even numbers, by a parity argument.)

(b) State (without full proof) the main QE theorem for Presburger arithmetic: every formula in \(\mathcal{L}_P\) is equivalent modulo \(\mathrm{Th}(\mathbb{Z}, +, 0, 1, <)\) to a Boolean combination of:
- Inequalities \(t_1 < t_2\) where \(t_i\) are linear terms;
- Divisibility conditions \(d_n(t)\) for linear terms \(t\) and integers \(n \geq 2\).

(c) Use QE to deduce that Presburger arithmetic is decidable: give an informal argument that every sentence in \(\mathcal{L}_P\) is decidable. Why does this not contradict Gödel's incompleteness theorem? (Answer: Presburger arithmetic has only addition, not multiplication. Multiplication is essential for encoding Gödel's incompleteness argument.)

(d) Show that Presburger arithmetic is \emph{not} strongly minimal by exhibiting an infinite definable set that is neither finite nor cofinite. (The set of even numbers \(\{x : d_2(x)\}\) works — it is infinite but not cofinite.)

**Problem A\(_4\).** (Why RCF needs the ordering for QE.) In the ring language \(\mathcal{L}_{\mathrm{rings}} = \{+, \cdot, -, 0, 1\}\) without the ordering \(<\), the theory of real closed fields does not admit quantifier elimination.

(a) Consider the formula \(\varphi(x) = \exists y\, (y^2 = x)\) in \(\mathcal{L}_{\mathrm{rings}}\). In the real closed field \(\mathbb{R}\), this defines \(\{x \in \mathbb{R} : x \geq 0\}\). Show that there is no quantifier-free formula in \(\mathcal{L}_{\mathrm{rings}}\) that defines this set. (Hint: quantifier-free formulas in \(\mathcal{L}_{\mathrm{rings}}\) define constructible sets — Boolean combinations of algebraic hypersurfaces — and the set \(\{x \geq 0\}\) is not constructible in the Zariski sense over \(\mathbb{R}\).)

(b) To get QE, we pass to the ordered ring language \(\mathcal{L}_{\mathrm{or}} = \{+, \cdot, -, 0, 1, <\}\). In this language, the formula \(\exists y\, (y^2 = x)\) is equivalent to \(x \geq 0\), which is quantifier-free. Verify that \(x \geq 0\) is indeed quantifier-free (it is shorthand for \(0 \leq x\), i.e., \(\neg(x < 0)\)).

(c) Use this example to explain the general principle: the language must be rich enough to express the "witnesses" produced by the QE algorithm. For RCF, the witnesses to existential quantifiers over polynomials are elements defined by sign conditions on polynomials, which requires the ordering predicate.

(d) Conclude that the choice of language is not merely a matter of convention — it determines whether or not a theory has QE. Give another example (from the course or from your own knowledge) where the "correct" language for QE is an enrichment of the naive language.

**Problem A\(_5\).** (QE for ACF implies the Zariski closure of a constructible set is a variety.) Use the QE theorem for ACF to prove the following.

(a) Recall that a **constructible set** in \(K^n\) (for an algebraically closed field \(K\)) is a finite Boolean combination of Zariski-closed sets (algebraic varieties). Show that constructible sets are exactly the sets definable by quantifier-free formulas in \(\mathcal{L}_{\mathrm{rings}}\).

(b) Let \(C \subseteq K^n\) be a constructible set. Define its Zariski closure \(\overline{C}\) as the smallest Zariski-closed set containing \(C\). Show that \(\overline{C}\) is definable in \(\mathrm{ACF}_p\) by exhibiting an explicit formula.

(c) Use QE to show that the Zariski closure of a constructible set is a variety (an irreducible Zariski-closed set), provided \(C\) is irreducible as a constructible set (cannot be written as a union of two proper constructible subsets).

(d) Deduce Chevalley's theorem: the image of a constructible set under a polynomial map \(f : K^n \to K^m\) is constructible. (The map \(f\) corresponds to an existential quantification, which by QE produces a quantifier-free — hence constructible — set.)

---

## Part B: Types and Saturation (Five Problems)

**Problem B\(_1\).** (Computing \(\lvert S_1(\emptyset)\rvert\) across theories.) For each of the following theories, compute the number of complete 1-types over the empty parameter set and determine which types (if any) are isolated.

(a) \(T = \mathrm{DLO}\): Show \(\lvert S_1(\emptyset)\rvert = 1\) and that the unique type is isolated (trivially, since there is only one). Identify the isolating formula.

(b) \(T = \mathrm{ACF}_0\): Show \(\lvert S_1(\emptyset)\rvert = \aleph_0\) (countably infinite). The types are: for each monic irreducible polynomial \(f \in \mathbb{Q}[x]\), the type "root of \(f\)"; and the unique generic type "transcendental over \(\mathbb{Q}\)." Which types are isolated? (Answer: all the algebraic types are isolated by their minimal polynomials; the generic type is not isolated.)

(c) \(T = \mathrm{RCF}\): Show \(\lvert S_1(\emptyset)\rvert = \aleph_0\) as well. The types are: for each monic irreducible polynomial \(f \in \mathbb{Q}[x]\) and each real root \(\alpha\) of \(f\), the type "is the \(k\)-th real root of \(f\)" (where the roots are ordered); and two generic types "positive transcendental" and "negative transcendental." Are all types isolated?

(d) \(T = \mathrm{Th}(\mathcal{R})\) where \(\mathcal{R}\) is the random graph (Rado graph), with language \(\{E\}\) for the edge relation: Show \(\lvert S_1(\emptyset)\rvert = 1\). (The Rado graph is \(\omega\)-categorical, so there is exactly one 1-type over \(\emptyset\) — all vertices "look the same" from the outside.) Verify this using the extension property of the Rado graph.

**Problem B\(_2\).** (Types of transcendental numbers over \(\mathbb{Q}\) in RCF.) Work in the theory \(T = \mathrm{RCF}\) with the model \(\mathbb{R}\).

(a) Compute \(\mathrm{tp}(\pi/\mathbb{Q})\) in RCF. Describe the type explicitly: it contains the formula \(x > q\) for every rational \(q < \pi\), and \(x < q\) for every rational \(q > \pi\), together with \(f(x) \neq 0\) for every polynomial \(f \in \mathbb{Q}[x]\) with \(f(\pi) \neq 0\). This type is the "cut determined by \(\pi\) in \(\mathbb{Q}\)," together with the assertion that \(\pi\) is transcendental over \(\mathbb{Q}\).

(b) Compute \(\mathrm{tp}(e/\mathbb{Q})\) in RCF, where \(e = 2.71828\ldots\) is Euler's number. Describe this type analogously to (a).

(c) Are \(\mathrm{tp}(\pi/\mathbb{Q})\) and \(\mathrm{tp}(e/\mathbb{Q})\) the same type? Two types \(p, q \in S_1(\mathbb{Q})\) are equal iff they contain exactly the same formulas. Show that \(\mathrm{tp}(\pi/\mathbb{Q}) \neq \mathrm{tp}(e/\mathbb{Q})\) because they determine different Dedekind cuts in \(\mathbb{Q}\) (since \(\pi \neq e\), they lie in different rationals intervals at some level of precision).

(d) Now consider the 2-type \(\mathrm{tp}(\pi, e / \mathbb{Q}) \in S_2(\mathbb{Q})\). This type contains all formulas in two variables \(x, y\) that are satisfied by the pair \((\pi, e)\). One formula in this type is \(x < y\) (since \(\pi < e\)... wait, \(\pi \approx 3.14 > e \approx 2.71\), so actually \(e < \pi\)); another is \(f(x, y) \neq 0\) for any polynomial \(f \in \mathbb{Q}[x,y]\) with \(f(\pi, e) \neq 0\). The question of whether the 2-type \(\mathrm{tp}(\pi, e/\mathbb{Q})\) contains the formula "\(x\) and \(y\) are algebraically independent over \(\mathbb{Q}\)" (which is not a first-order formula, but is approximated by "\(f(x,y) \neq 0\) for all \(f \in \mathbb{Q}[x,y] \setminus \{0\}\)") is equivalent to the open question of whether \(\pi\) and \(e\) are algebraically independent. This illustrates how model-theoretic type theory can encode open problems in transcendence theory.

**Problem B\(_3\).** (Constructing an \(\omega\)-saturated model of DLO.) Construct, explicitly, an \(\omega\)-saturated model of DLO.

(a) Recall that \(M\) is \(\omega\)-saturated if every complete type over a finite (equivalently, countable) parameter set \(A \subseteq M\) is realised in \(M\). For DLO, the complete 1-types over a finite ordered set \(A = \{a_1 < \cdots < a_n\}\) are the \(2n+1\) types corresponding to the \(2n+1\) intervals (as computed in §4.6). Every model of DLO realises all these types, so every model of DLO is \(\omega_1\)-saturated for types over finite sets. The interesting condition is saturation for \emph{countably infinite} parameter sets.

(b) Given a countably infinite ordered set \(A \subseteq M\) (dense, without endpoints, e.g., \(A = \mathbb{Q}\)), the complete 1-types over \(A\) in DLO are in bijection with the Dedekind cuts of \(A\): for each cut \((L, R)\) in \(A\) (partition of \(A\) into a downward-closed set \(L\) and upward-closed set \(R\)), there is a type "lies in the cut \((L, R)\)." There are \(2^{\aleph_0}\) many such cuts.

(c) Construct an \(\omega\)-saturated model as follows. Start with \(M_0 = (\mathbb{Q}, <)\). At each step, for every countable \(A \subseteq M_n\) and every Dedekind cut \((L, R)\) in \(A\) not filled in \(M_n\), add a new element realising that cut, and close under the DLO axioms (i.e., add dense orders between all new and old elements as needed). The result \(M_{n+1}\) is a countable dense linear order extending \(M_n\). Let \(M = \bigcup_n M_n\).

(d) Show that \(M\) is a dense linear order without endpoints and realises every complete type over every countable parameter set. Conclude that \(M\) is \(\omega\)-saturated. What is the cardinality of \(M\)? (Since we add countably many elements at each countable step, \(|M| = \aleph_0\). So the \(\omega\)-saturated model of DLO of cardinality \(\aleph_0\) is... \((\mathbb{Q}, <)\) itself? Explain why this is consistent with the non-saturation of \(\mathbb{Q}\) for uncountable parameter sets.)

**Problem B\(_4\).** (Strongly minimal theories: every type over a model is definable.) Let \(T\) be a strongly minimal theory and let \(M \models T\) be a model.

(a) Recall the definition: a type \(p \in S_1(M)\) is **definable** if for every formula \(\varphi(x, \bar{y})\), the set \(\{\bar{b} \in M^{|\bar{y}|} : \varphi(x, \bar{b}) \in p\}\) is a definable subset of \(M^{|\bar{y}|}\).

(b) Show that in a strongly minimal theory, every complete 1-type \(p \in S_1(M)\) is definable. (Hint: By strong minimality, for any formula \(\varphi(x, \bar{b})\), the set \(\varphi(M, \bar{b})\) is finite or cofinite. If \(\varphi(x, \bar{b}) \in p\), then for any realisation \(a \models p\), the set \(\varphi(M, \bar{b})\) is the set of elements with the same \(\varphi\)-type as \(a\), which is either finite or cofinite. The definability of the truth-set of \(p\) follows from this finite/cofinite dichotomy applied uniformly in \(\bar{b}\).)

(c) Give a concrete example in ACF\(_0\): take \(M = \mathbb{C}\) and \(p = \mathrm{tp}(\pi / \mathbb{C})\) (the generic type — but note that \(\pi \in \mathbb{C}\), so this type is just \(\pi = \pi\), not interesting). Instead, take \(p\) to be the type of a new transcendental over \(M\) in a monster extension. Describe the defining formula for \(p\) with respect to the formula \(\varphi(x, b) = (x \neq b)\).

(d) Conclude that in strongly minimal theories, the type space \(S_1(M)\) is "very tame" — every type is definable, which is a strong form of the stability property called "definability of types."

**Problem B\(_5\).** (Ryll-Nardzewski theorem: \(\omega\)-categoricity characterised by type spaces.) Prove the following theorem, which gives a clean characterisation of \(\omega\)-categorical theories.

<div class="theorem">
<strong>Theorem (Ryll-Nardzewski, Engeler, Svenonius, 1959).</strong> A complete theory \(T\) in a countable language is \(\omega\)-categorical (has a unique countable model up to isomorphism) if and only if for every \(n \geq 1\), the type space \(S_n(\emptyset)\) is finite.
</div>

(a) (\(\Leftarrow\)) Assume \(S_n(\emptyset)\) is finite for every \(n\). Let \(M\) be any countable model of \(T\). Show that every \(n\)-element subset of \(M\) has an orbit (under \(\mathrm{Aut}(M)\)) determined by its type in \(S_n(\emptyset)\). Since \(S_n(\emptyset)\) is finite, there are finitely many orbits of \(n\)-tuples. Use this to show that any two countable models are isomorphic (by a standard back-and-forth argument).

(b) (\(\Rightarrow\)) Assume \(T\) is \(\omega\)-categorical. Suppose for contradiction that \(S_n(\emptyset)\) is infinite for some \(n\). Show that there are infinitely many orbits of \(n\)-tuples under the automorphism group, and use this to construct two non-isomorphic countable models — contradicting \(\omega\)-categoricity.

(c) Verify the theorem for DLO: show directly that \(\lvert S_n(\emptyset)\rvert = n!\) (the number of orderings of \(n\) distinct elements), which is finite for every \(n\). Conclude that DLO is \(\omega\)-categorical (as per Cantor's theorem).

(d) Verify that ACF\(_0\) is \emph{not} \(\omega\)-categorical: show that \(\lvert S_1(\emptyset)\rvert = \aleph_0\) (countably infinite), so the theorem predicts non-\(\omega\)-categoricity. Confirm by exhibiting two non-isomorphic countable models: \(\overline{\mathbb{Q}}\) (algebraic closure of \(\mathbb{Q}\)) and \(\overline{\mathbb{Q}(t)}\) (algebraic closure of the rational function field \(\mathbb{Q}(t)\)) — these are both countable models of ACF\(_0\) but are non-isomorphic (they have different transcendence degrees over \(\mathbb{Q}\)).

---

## Part C: Stability and Forking (Five Problems)

**Problem C\(_1\).** (RCF is not stable: the order property.) Show that the theory RCF is not stable by exhibiting a formula with the order property.

(a) A formula \(\varphi(x; y)\) has the **order property** in a theory \(T\) if there exist sequences \((a_i)_{i < \omega}\) and \((b_j)_{j < \omega}\) in a model of \(T\) such that \(M \models \varphi(a_i; b_j)\) if and only if \(i < j\).

(b) Let \(\varphi(x; y) = (x < y)\) in the language of ordered rings. In the model \(\mathbb{R} \models \mathrm{RCF}\), let \(a_i = i\) and \(b_j = j + 1/2\) for \(i, j \in \mathbb{N}\). Show that \(\mathbb{R} \models a_i < b_j\) iff \(i < j + 1/2\) iff \(i \leq j\)... this gives \(i \leq j\), not \(i < j\). Adjust: let \(a_i = i\) and \(b_j = j + 1\). Then \(a_i < b_j\) iff \(i < j+1\) iff \(i \leq j\). Still not right. The correct choice: \(a_i = i\) and \(b_j = j + \frac{1}{2}\) gives \(a_i < b_j \iff i < j + 1/2 \iff i \leq j\). We need \(a_i < b_j \iff i < j\). Try: \(a_i = 2i + 1\) and \(b_j = 2j\). Then \(a_i < b_j \iff 2i+1 < 2j \iff i < j - 1/2 \iff i < j\) (since \(i, j\) are integers). So \(\mathbb{R} \models a_i < b_j \iff i < j\). This witnesses the order property.

(c) Conclude that RCF has the order property and is therefore not stable. Explain the general principle: any theory with a definable linear order on an infinite subset of a model has the order property, and hence is not stable.

(d) Deduce that \(\lvert S_1(\mathbb{R})\rvert \geq 2^{\aleph_0}\). (In fact \(\lvert S_1(\mathbb{R})\rvert = 2^{\aleph_0}\), since each Dedekind cut in \(\mathbb{R}\) gives a distinct type — but the complete 1-types over \(\mathbb{R}\) are just the Dedekind cuts in \(\mathbb{R}\) not filled by an element of \(\mathbb{R}\), of which there are \(2^{\aleph_0}\).) Confirm that this exceeds the stability bound \(\lvert S_1(A)\rvert \leq \lvert A\rvert^{\aleph_0} = (2^{\aleph_0})^{\aleph_0} = 2^{\aleph_0}\)... this doesn't give a contradiction directly. Instead, note that stability requires \(\lvert S_1(A)\rvert \leq \lvert A\rvert + \lvert T\rvert\) for \(\lvert A\rvert\) large, and for \(A = \mathbb{R}\), we'd need \(\lvert S_1(\mathbb{R})\rvert \leq \lvert \mathbb{R}\rvert = 2^{\aleph_0}\), which holds. The order property is the correct criterion to use.

**Problem C\(_2\).** (Non-forking in ACF\(_0\): algebraic independence.) Work in \(T = \mathrm{ACF}_0\) with monster model \(\mathbb{C}\). Let \(A \subseteq B \subseteq \mathbb{C}\) be algebraically closed subsets (so \(A, B \models \mathrm{ACF}_0\)).

(a) Show that for \(a \in \mathbb{C}\), the type \(\mathrm{tp}(a/B)\) does not fork over \(A\) if and only if \(a\) is algebraically independent from \(B\) over \(A\) — that is, \(a \notin \overline{B} = B\) (since \(B\) is already algebraically closed), or more precisely, \(a\) is transcendental over the field \(B\), and its transcendence does not depend on \(A\). Formally: \(\mathrm{tp}(a/B)\) does not fork over \(A\) iff \(\mathrm{tr.deg}(a/B) = \mathrm{tr.deg}(a/A)\).

(b) Compute: let \(A = \overline{\mathbb{Q}}\), \(B = \overline{\mathbb{Q}(t)}\) for a transcendental \(t\), and \(a = t\). Does \(\mathrm{tp}(a/B)\) fork over \(A\)? Since \(a = t \in B\), the element \(t\) is algebraic over \(B\) (in fact, it is in \(B\)). So \(\mathrm{tp}(t/B)\) is the algebraic type "is the element \(t\)," and it does fork over \(A\) (since \(t \notin A = \overline{\mathbb{Q}}\)).

(c) Now let \(a\) be transcendental over \(B\) (i.e., \(a \notin B\) and \(a\) is transcendental over the fraction field of \(B\)). Show that \(\mathrm{tp}(a/B)\) does not fork over \(A\), and that the non-forking extension of the generic type from \(A\) to \(B\) is the unique type of a transcendental over \(B\).

(d) Verify the symmetry of non-forking: if \(a\) and \(b\) are algebraically independent over \(A\), show that \(a \mathop{\smile\!\!\!\!|}_A b\) and \(b \mathop{\smile\!\!\!\!|}_A a\) simultaneously. Interpret this algebraically: algebraic independence is a symmetric relation, confirming the symmetry axiom of forking.

**Problem C\(_3\).** (Unique non-forking extensions in stable theories.) Prove the following (stationarity theorem) in the setting of stable theories.

<div class="theorem">
<strong>Theorem.</strong> In a stable complete theory \(T\), every type \(p \in S(M)\) over a model \(M \models T\) has a unique non-forking extension to any set \(B \supseteq M\).
</div>

(a) Existence: Show that for any \(B \supseteq M\), the type \(p\) has at least one non-forking extension to \(B\). (Hint: Use the extension axiom of forking: for any \(a \models p\) and any \(B \supseteq M\), there exists \(a' \equiv_M a\) with \(\mathrm{tp}(a'/B)\) not forking over \(M\).)

(b) Uniqueness: Suppose \(q_1, q_2 \in S(B)\) are two non-forking extensions of \(p\) to \(B\). Using the definition of forking and the stability hypothesis, show that \(q_1 = q_2\). (Key step: in a stable theory, types over a model are definable — for each formula \(\varphi(x, \bar{y})\), there is a formula \(d_\varphi(\bar{y})\) over \(M\) such that \(\varphi(x, \bar{b}) \in p\) iff \(M \models d_\varphi(\bar{b})\). The non-forking extension of \(p\) is the unique type that agrees with the definition scheme of \(p\) on all formulas.)

(c) Deduce that in ACF\(_0\), the non-forking extension of the "transcendental over \(A\)" type from \(A\) to any \(B \supseteq A\) is the unique type "transcendental over \(B\)." Verify stationarity explicitly in this case.

(d) Show that stationarity fails in the unstable theory DLO: exhibit a consistent type \(p \in S_1(\mathbb{Q})\) (the cut corresponding to \(\sqrt{2}\)) and show that there are two distinct "extensions" of \(p\) to \(\mathbb{Q} \cup \{\sqrt{2}\}\) — the type \(x < \sqrt{2}\) and the type \(x = \sqrt{2}\) — illustrating why stability is needed.

**Problem C\(_4\).** (Rado graph is not simple: it has the independence property.) Show that the theory of the Rado graph (random graph) has the independence property, and hence is neither simple nor stable.

(a) Recall: a formula \(\varphi(x; \bar{y})\) has the **independence property** in \(T\) if for every \(n < \omega\), there exist \(a_1, \ldots, a_n\) and \(b_S\) (for each \(S \subseteq \{1, \ldots, n\}\)) in a model of \(T\) such that \(M \models \varphi(a_i; b_S)\) iff \(i \in S\).

(b) In the Rado graph \(G = (\mathbb{N}, E)\) (with the extension property: for any finite disjoint \(A, B \subseteq \mathbb{N}\), there exists \(v\) adjacent to all of \(A\) and none of \(B\)), show that the formula \(\varphi(x; y) = E(x, y)\) has the independence property.

(c) For any \(n\), let \(a_1, \ldots, a_n\) be distinct vertices. For each \(S \subseteq \{1, \ldots, n\}\), use the extension property to find a vertex \(b_S\) adjacent to \(\{a_i : i \in S\}\) and not adjacent to \(\{a_i : i \notin S\}\). Show this is always possible.

(d) Conclude that \(\mathrm{Th}(\mathcal{R})\) has the independence property, hence is not stable. However, \(\mathrm{Th}(\mathcal{R})\) is a **simple theory** (a class generalising stable theories, introduced by Shelah and Kim–Pillay). In simple theories, forking is still well-behaved (satisfying all the axioms of §9.2 except stationarity). The random graph is the canonical example of a simple unstable theory.

**Problem C\(_5\).** (Morley rank of the Legendre elliptic curve in ACF\(_0\).) Compute the Morley rank of the definable set \(E = \{(x, y) \in K^2 : y^2 = x^3 - x\}\) (the Legendre elliptic curve) in a model \(K \models \mathrm{ACF}_0\).

(a) Recall: the **Morley rank** \(\mathrm{RM}(\varphi)\) of a formula \(\varphi\) in an \(\omega\)-stable theory is defined inductively: \(\mathrm{RM}(\varphi) \geq 0\) iff \(\varphi\) is consistent; \(\mathrm{RM}(\varphi) \geq \alpha + 1\) iff there exist infinitely many pairwise inconsistent formulas each of Morley rank \(\geq \alpha\) refining \(\varphi\); and \(\mathrm{RM}(\varphi) \geq \lambda\) for limit ordinals \(\lambda\) iff \(\mathrm{RM}(\varphi) \geq \alpha\) for all \(\alpha < \lambda\).

(b) Show that \(\mathrm{RM}(E) = 1\). The key point: \(E\) is a curve (a one-dimensional variety). By the QE for ACF and the analysis of strongly minimal theories, the Morley rank of a curve in ACF\(_0\) equals its (Krull) dimension as a variety, which is 1. More directly: \(E\) is an infinite definable set with no infinite definable proper subset (it is not possible to find infinitely many pairwise inconsistent formulas of Morley rank 1 that refine \(E\) in a consistent way... wait, this is not quite right; we need to argue more carefully).

(c) More carefully: \(\mathrm{RM}(K) = 1\) (the whole field has Morley rank 1 in ACF, as it is strongly minimal). The definable set \(E\) is in bijection (over a definable function) with \(K\) minus finitely many points: project \(E\) to the \(x\)-coordinate, mapping \((x, y) \mapsto x\); for each \(x \in K\), there are at most 2 preimages (since \(y^2 = x^3 - x\) is a degree-2 polynomial in \(y\)). The projection map has finite fibres, so \(\mathrm{RM}(E) = \mathrm{RM}(K) = 1\).

(d) The **Morley degree** \(\mathrm{Md}(E)\) is the number of "generic types" in \(E\). Show that \(\mathrm{Md}(E) = 1\) (the set \(E\) is "irreducible" — it cannot be partitioned into two infinite definable pieces of the same Morley rank). This corresponds to the fact that \(E\) is a geometrically irreducible variety. Conclude: \(\mathrm{RM}(E) = 1\), \(\mathrm{Md}(E) = 1\).

---

## Part D: Challenge Problems (Five Problems)

**Problem D\(_1\).** (\(\star\) Morley's categoricity theorem: sketch for \(\omega\)-stable theories.) This problem outlines the proof of Morley's theorem in the \(\omega\)-stable case.

(a) Assume \(T\) is an \(\omega\)-stable complete theory in a countable language. Show that \(T\) has a well-defined **Morley rank** function \(\mathrm{RM}\) assigning an ordinal (or \(\infty\)) to every definable set, satisfying: \(\mathrm{RM}(\varphi) < \infty\) for all consistent \(\varphi\); \(\mathrm{RM}\) is additive under disjoint unions; and \(\mathrm{RM}\) decreases under non-trivial refinements.

(b) Use Morley rank to define a notion of **dimension** for complete types: the dimension of a type \(p\) is the Morley rank of the formula isolating it (or \(\infty\) if no such formula exists). Show that in an \(\omega\)-stable theory, every type has well-defined Morley rank.

(c) Show that any two models of \(T\) of the same uncountable cardinality \(\kappa\) are isomorphic. Outline: build an isomorphism by a transfinite back-and-forth argument, using at each step the existence of non-forking extensions (guaranteed by \(\omega\)-stability) to extend partial isomorphisms. The \(\omega\)-stability ensures that the Morley rank can be used to control which elements are "independent" and hence available for the next step.

(d) Conclude: \(T\) is \(\kappa\)-categorical for every uncountable \(\kappa\). This is Morley's theorem for \(\omega\)-stable theories. The full theorem (for arbitrary categorical theories) uses the additional step of proving that any uncountably categorical theory is \(\omega\)-stable, which requires more work.

**Problem D\(_2\).** (\(\star\) Every \(\omega\)-categorical theory is stable.) Prove that every \(\omega\)-categorical complete theory in a countable language is stable (in fact, it is \(\omega\)-stable if it has no finite models).

(a) Assume \(T\) is \(\omega\)-categorical. By the Ryll-Nardzewski theorem (Problem B\(_5\)), \(S_n(\emptyset)\) is finite for every \(n\). Show that \(\lvert S_n(A)\rvert \leq \aleph_0\) for every countable \(A\). (Hint: An \(n\)-type over a countable set \(A\) is determined by an \(\omega\)-sequence of formulas over \(A\), and the automorphism group of the countable saturated model acts transitively on \(n\)-types of the same "back-and-forth type.")

(b) More precisely: use the fact that \(T\) is \(\omega\)-categorical to show that the automorphism group \(\mathrm{Aut}(M)\) of the unique countable model \(M\) acts **oligomorphically** — it has finitely many orbits on \(M^n\) for every \(n\). This means the number of complete \(n\)-types over \(\emptyset\) is finite (the orbits on \(M^n\)).

(c) Use the oligomorphic action and the countability of \(M\) to show \(\lvert S_1(A)\rvert \leq \aleph_0\) for any countable \(A \subseteq M\). Conclude that \(T\) is \(\omega\)-stable.

(d) Verify this for DLO: DLO is \(\omega\)-categorical (Cantor's theorem), and we verified \(\lvert S_1(\emptyset)\rvert = 1\), \(\lvert S_n(\emptyset)\rvert = n!\), all finite. But is DLO \(\omega\)-stable? Compute \(\lvert S_1(\mathbb{Q})\rvert\). Since the types over \(\mathbb{Q}\) correspond to Dedekind cuts in \(\mathbb{Q}\), there are \(2^{\aleph_0}\) many such types. But DLO is \(\omega\)-categorical... there seems to be a contradiction with part (c). Resolve: the statement in (c) is for \(A \subseteq M\) where \(M\) is the (unique) countable model; but the computation gives \(\lvert S_1(\mathbb{Q})\rvert = 2^{\aleph_0}\), which seems to contradict \(\omega\)-stability. Explain carefully why \(\omega\)-categorical does NOT imply \(\omega\)-stable in general (in particular, DLO is \(\omega\)-categorical but NOT \(\omega\)-stable, contradicting the claim in part (a)–(c)). Identify the error: the error is that the claim in (a) is FALSE — \(\omega\)-categorical theories need not be \(\omega\)-stable. The correct statement is: \(\omega\)-categorical theories are stable in restricted senses (e.g., they are "monadically stable") but not necessarily \(\omega\)-stable.

**Problem D\(_3\).** (\(\star\star\) Hrushovski construction: a strongly minimal set with exotic geometry.) This problem outlines the construction of a strongly minimal set refuting the Zilber trichotomy in its full generality.

(a) Let \(\mathcal{C}\) be the class of finite graphs \(G = (V, E)\). Define the **predimension** \(\delta(G) = \lvert V(G)\rvert - \lvert E(G)\rvert\). For \(H \subseteq G\) (as graphs), say \(H \leq G\) (is **strong**) if \(\delta(H') \geq \delta(H)\) for every \(H \subseteq H' \subseteq G\). Let \(\mathcal{C}_0 = \{G \in \mathcal{C} : \delta(H) \geq 0 \text{ for all } H \subseteq G\}\).

(b) Show that \(\mathcal{C}_0\) is a Fraïssé class with the amalgamation property using \(\leq\)-embeddings (strong embeddings). Describe the Fraïssé limit \(M = \mathrm{Flim}(\mathcal{C}_0)\): it is a countable graph in which every finite strong subgraph appears, and the extension property holds for strong embeddings.

(c) Show that the complete theory \(T = \mathrm{Th}(M)\) is strongly minimal: every definable subset of \(M\) in one variable is finite or cofinite. (The key is the predimension control: adding an element to a strong set decreases predimension by at most 1, so definable sets cannot be "wild.")

(d) Show that the pregeometry on \(M\) given by \(\mathrm{acl}(A)\) (algebraic closure in \(T\)) is neither disintegrated (since \(M\) has non-trivial edge structure) nor locally modular (since the predimension does not give a modular lattice), and yet no algebraically closed field is interpretable in \(M\) (since the theory of \(M\) is too "generic" — no field axioms are definable). This is Hrushovski's counterexample to the Zilber trichotomy.

**Problem D\(_4\).** (\(\star\star\) Algebraically closed valued fields have QE.) The theory ACVF is the theory of algebraically closed fields equipped with a non-trivial valuation. It is most naturally formulated in a two-sorted (or three-sorted) language.

(a) Describe the three-sorted language for ACVF: the **field sort** \(K\), the **value group sort** \(\Gamma\) (an ordered abelian group, written additively with \(\infty\) adjoined), and the **residue field sort** \(k\) (an algebraically closed field). The valuation \(v : K^\times \to \Gamma\) satisfies the ultrametric inequality \(v(a + b) \geq \min(v(a), v(b))\) and \(v(ab) = v(a) + v(b)\).

(b) State the axioms of ACVF: \(K\) is algebraically closed, \(k\) is algebraically closed, \(\Gamma \cong \mathbb{Z}\) (or \(\mathbb{Q}\)) as ordered abelian groups, and the valuation map is surjective. The canonical model is \(\mathbb{C}((t))\) (Laurent series over \(\mathbb{C}\)) with the \(t\)-adic valuation.

(c) State (without full proof) the QE theorem for ACVF due to Robinson: ACVF admits QE in the three-sorted language, meaning every formula is equivalent (modulo ACVF) to a quantifier-free formula in the three sorts. As a consequence, ACVF is complete (for a fixed characteristic pair \((\mathrm{char}(K), \mathrm{char}(k))\)).

(d) Discuss consequences of QE for ACVF: the definable sets in the field sort are precisely the "semi-algebraic" sets in the valued field sense; the theory is NIP (not IP), which is the analogue of o-minimality for valued fields; and the theory is not stable (the valuation gives an ordering-like structure on the value group). ACVF is the paradigmatic example of a NIP theory that is not stable, and its model theory has deep applications to \(p\)-adic geometry and non-Archimedean analysis.

**Problem D\(_5\).** (\(\star\star\) Compact complex spaces and \(\omega\)-stability.) Zilber proposed that the theory of compact complex spaces (in an appropriate language) should be \(\omega\)-stable, making the powerful machinery of stability theory available for complex analytic geometry. This problem explores the basic setup.

(a) The **theory of compact complex spaces** \(T_{\mathrm{Zil}}\) (in Zilber's formulation) is a many-sorted theory, with one sort for each compact complex space \(X\) (considered as a definable set), and morphisms given by analytic maps. The axioms include: each sort is a Noetherian topological space (in the Zariski topology of complex analytic sets); projection maps are definable; and the definable sets in each sort are precisely the analytic subsets (finite Boolean combinations of analytic subvarieties).

(b) Show that \(T_{\mathrm{Zil}}\) is a reasonable candidate for an \(\omega\)-stable theory by verifying the following analogues: (i) the definable subsets of \(\mathbb{P}^1(\mathbb{C})\) in one variable are the analytic subsets — which are finite or cofinite (since \(\mathbb{P}^1\) is a compact Riemann surface and the only analytic subsets of a Riemann surface are finite sets or the whole surface). This makes \(\mathbb{P}^1\) a strongly minimal set.

(c) Show that the Morley rank of \(\mathbb{P}^1(\mathbb{C})\) in \(T_{\mathrm{Zil}}\) is 1 (it is strongly minimal), while the Morley rank of \(\mathbb{P}^n(\mathbb{C})\) is \(n\) (by induction using the fibration \(\mathbb{P}^n \to \mathbb{P}^1\) with fibres \(\mathbb{P}^{n-1}\)).

(d) Discuss Zilber's conjecture for compact complex spaces: every strongly minimal set definable in \(T_{\mathrm{Zil}}\) satisfies the trichotomy (disintegrated, locally modular, or interprets \(\mathbb{P}^1\)). This conjecture has been established by Zilber, Hrushovski, and Moosa–Pillay in various cases, and it has implications for the model theory of complex analytic geometry and for diophantine questions over \(\mathbb{C}\).

---

*End of Appendix B.*

---

# Appendix C: Morley Rank Computations

Morley rank is the ordinal-valued dimension theory for \(\omega\)-stable theories. This appendix provides systematic worked computations in the canonical examples, building the intuition needed for research-level applications.

## C.1 Morley Rank in Algebraically Closed Fields

The theory ACF\(_p\) is \(\omega\)-stable and strongly minimal. In strongly minimal theories, Morley rank is particularly clean: the Morley rank of a definable set equals its classical algebraic dimension (Krull dimension of the Zariski closure), and the Morley degree equals the number of irreducible components.

<div class="definition">
Let \(T\) be \(\omega\)-stable and \(\varphi(x_1, \ldots, x_n, \bar{b})\) a formula. The <strong>Morley rank</strong> \(\mathrm{RM}(\varphi)\) is defined by:
<ul>
<li>\(\mathrm{RM}(\varphi) \geq 0\) iff \(\varphi\) is consistent (has a realisation in some model);</li>
<li>\(\mathrm{RM}(\varphi) \geq \alpha + 1\) iff there exist pairwise inconsistent formulas \(\varphi_1, \varphi_2, \ldots\) each implying \(\varphi\) and each having Morley rank \(\geq \alpha\);</li>
<li>\(\mathrm{RM}(\varphi) \geq \lambda\) (limit) iff \(\mathrm{RM}(\varphi) \geq \alpha\) for all \(\alpha < \lambda\);</li>
<li>\(\mathrm{RM}(\varphi) = \alpha\) if \(\mathrm{RM}(\varphi) \geq \alpha\) but not \(\mathrm{RM}(\varphi) \geq \alpha + 1\).</li>
</ul>
The <strong>Morley degree</strong> \(\mathrm{Md}(\varphi)\) is the largest \(d\) such that \(\varphi\) can be partitioned into \(d\) formulas each of Morley rank equal to \(\mathrm{RM}(\varphi)\).
</div>

<div class="example">
<strong>Morley rank of a point.</strong> The formula \(\varphi(x) = (x = 0)\) in ACF\(_0\) defines the single point \(\{0\} \subseteq \mathbb{C}\). Then \(\mathrm{RM}(\varphi) = 0\): the set is consistent (rank \(\geq 0\)), but it has no pairwise inconsistent infinite refinements (any infinite collection of formulas each consistent with \(x = 0\) would require infinitely many realisations, but \(\{0\}\) has only one element). So \(\mathrm{RM}(x = 0) = 0\), \(\mathrm{Md}(x = 0) = 1\).

More generally, every finite definable set in ACF has Morley rank 0, and its Morley degree equals the number of elements.
</div>

<div class="example">
<strong>Morley rank of the field.</strong> The formula \(\varphi(x) = (x = x)\) defines all of \(K\) in ACF\(_p\). Since ACF is strongly minimal, \(\mathrm{RM}(x = x) = 1\): the set \(K\) is infinite (rank \(\geq 1\)), and to get rank \(\geq 2\) we would need infinitely many pairwise inconsistent formulas each of rank \(\geq 1\) refining \(x = x\). But any formula of rank \(\geq 1\) in ACF defines a cofinite set (since the formula has infinitely many realisations, and by strong minimality it must be cofinite). Two cofinite sets are never inconsistent (they always intersect). So we cannot find pairwise inconsistent formulas of rank \(\geq 1\), and \(\mathrm{RM}(x = x) = 1\). The Morley degree \(\mathrm{Md}(x = x) = 1\) since \(K\) is irreducible.
</div>

<div class="example">
<strong>Morley rank of a curve: \(y^2 = x^3 - x\).</strong> Consider the elliptic curve \(E = \{(x,y) \in K^2 : y^2 = x^3 - x\}\) in ACF\(_0\). This is a 2-variable definable set. To compute its Morley rank, we use the projection \(\pi : E \to K\) by \((x,y) \mapsto x\). The fibres \(\pi^{-1}(x_0) = \{y : y^2 = x_0^3 - x_0\}\) have at most 2 elements for each \(x_0\) (they are the roots of a degree-2 polynomial). Since the fibres are finite (Morley rank 0) and the base is the field \(K\) (Morley rank 1), the Morley rank adds:

\[
\mathrm{RM}(E) = \mathrm{RM}(\text{base}) + \mathrm{RM}(\text{fibre}) = 1 + 0 = 1.
\]
This is the algebraic geometry fact: the curve \(E\) is a 1-dimensional variety.

The Morley degree: the curve \(E\) is irreducible as an algebraic variety (the polynomial \(y^2 - x^3 + x\) is irreducible over \(\mathbb{Q}\)), so \(\mathrm{Md}(E) = 1\).
</div>

<div class="example">
<strong>Morley rank of \(K^2\).</strong> The whole affine plane \(K^2\) has Morley rank 2: the formula \(x = x \wedge y = y\) defines \(K^2\). The Morley rank is at least 2 because we can partition \(K^2\) into infinitely many pairwise inconsistent sets each of Morley rank \(\geq 1\) (e.g., the lines \(\{y = c\}\) for \(c \in K\)). The Morley rank is at most 2 because any further partition of each such line into pairwise inconsistent infinite subsets would require Morley rank \(\geq 2\) within each line, but each line has Morley rank 1. So \(\mathrm{RM}(K^2) = 2\).

More generally: \(\mathrm{RM}(K^n) = n\) in ACF\(_p\).
</div>

## C.2 Additive Formula for Morley Rank

The following formula is the model-theoretic analogue of the formula \(\dim(X \times Y) = \dim(X) + \dim(Y)\) in algebraic geometry:

<div class="theorem">
<strong>Theorem (Morley rank and fibre dimension).</strong> Let \(T\) be \(\omega\)-stable and let \(f : X \to Y\) be a definable function between definable sets. If all fibres \(f^{-1}(y)\) for \(y \in Y\) have Morley rank \(\leq k\) and at least one fibre has Morley rank exactly \(k\), then

\[
\mathrm{RM}(X) = \mathrm{RM}(Y) + k.
\]
</div>

This is applied constantly in practice. For the elliptic curve example: \(\mathrm{RM}(E) = \mathrm{RM}(K) + \mathrm{RM}(\text{generic fibre}) = 1 + 0 = 1\). For the surface \(\{(x,y,z) : z^2 = xy + 1\} \subseteq K^3\): project to the \((x,y)\)-plane; the fibres have Morley rank 0 (each is finite), and the base \(K^2\) has Morley rank 2, so the surface has Morley rank 2.

## C.3 Morley Rank in DCF\(_0\)

The theory DCF\(_0\) is \(\omega\)-stable but not strongly minimal: it has definable sets of Morley rank \(n\) for every finite \(n\), and also sets of Morley rank \(\omega\) (infinite ordinal).

<div class="example">
<strong>The constant field has Morley rank \(\omega\).</strong> Let \(M \models \mathrm{DCF}_0\) and let \(C = \{x \in M : \partial(x) = 0\}\) be the constant field. The formula \(\partial(x) = 0\) defines \(C\), and \(C \models \mathrm{ACF}_0\) (an algebraically closed field). We claim \(\mathrm{RM}(\partial(x) = 0) = \omega\).

To see that \(\mathrm{RM}(C) \geq n\) for every \(n < \omega\): the set \(C\) is itself a strongly minimal set (the theory of \(C\) as an algebraically closed field has Morley rank 1 within ACF\(_0\)). But within the ambient theory DCF\(_0\), the Morley rank of \(C\) is computed differently — the ambient theory has more definable sets. One can show by induction that for each \(n\), there is a partition of \(C\) into infinitely many definable (in DCF\(_0\)) subsets of Morley rank \(\geq n\), so \(\mathrm{RM}(C) \geq n\) for all \(n\), giving \(\mathrm{RM}(C) \geq \omega\).

On the other hand, \(\mathrm{RM}(C) \leq \omega\) because DCF\(_0\) is \(\omega\)-stable (Morley ranks are ordinals, and the rank cannot be \(\omega + 1\) or higher without specific reasons). The full proof uses the fact that DCF\(_0\) is \(\omega\)-stable with Morley rank \(\omega\) on the prime model.
</div>

---

# Appendix D: Key Theorems Reference Card

This appendix summarises the main theorems of the course in a compact, accessible format for examination revision. Each entry states the theorem, the key hypothesis, and the primary application.

## D.1 Theorems of Quantifier Elimination

| Theorem | Hypothesis | Conclusion | Key Application |
|---|---|---|---|
| Cantor's Theorem | \(T = \mathrm{DLO}\) | QE; hence completeness and \(\omega\)-categoricity | \((\mathbb{Q}, <)\) is the unique countable DLO |
| Tarski's Theorem (ACF) | \(T = \mathrm{ACF}_p\) | QE in \(\mathcal{L}_{\mathrm{rings}}\) | Chevalley's theorem; strong minimality |
| Tarski's Theorem (RCF) | \(T = \mathrm{RCF}\) | QE in \(\mathcal{L}_{\mathrm{or}}\) | Decidability of real arithmetic; o-minimality |
| Lefschetz Principle | \(\sigma\) a sentence in \(\mathcal{L}_{\mathrm{rings}}\) | \(\mathrm{ACF}_0 \models \sigma \iff \mathrm{ACF}_p \models \sigma\) for large \(p\) | Ax–Grothendieck; transfer from char 0 to char \(p\) |

## D.2 Theorems on Completeness and Categoricity

| Theorem | Hypothesis | Conclusion | Key Application |
|---|---|---|---|
| Vaught's Test | \(T\) has no finite models, is \(\kappa\)-categorical for some \(\kappa \geq \lvert T \rvert\) | \(T\) is complete | Completeness of ACF\(_p\) |
| Morley's Theorem (1965) | \(T\) countable, \(\kappa\)-categorical for some uncountable \(\kappa\) | \(T\) is \(\kappa\)-categorical for all uncountable \(\kappa\) | Classification of uncountably categorical theories |
| Ryll-Nardzewski (1959) | \(T\) complete, countable language | \(T\) is \(\omega\)-categorical \(\iff\) \(\lvert S_n(\emptyset)\rvert < \infty\) for all \(n\) | Characterises theories with a unique countable model |

## D.3 Theorems on Types

| Theorem | Hypothesis | Conclusion | Key Application |
|---|---|---|---|
| Omitting Types | \(T\) complete, countable; \(\{p_n\}\) countably many non-isolated types | \(\exists\) countable \(M \models T\) omitting all \(p_n\) | Prime models; atomic models |
| Saturation Existence | \(T\) complete; \(\kappa^{<\kappa} = \kappa > \lvert T \rvert\) | \(\exists\) saturated model of \(T\) of size \(\kappa\) | Monster model construction |
| Type Space Topology | \(T\) complete | \(S_n(A)\) is compact, Hausdorff, totally disconnected | Definability of types; stability criteria |

## D.4 Theorems of Stability Theory

| Theorem | Hypothesis | Conclusion | Key Application |
|---|---|---|---|
| Stationarity | \(T\) stable; \(M \models T\) a model; \(p \in S(M)\) | \(p\) has a unique non-forking extension to any \(B \supseteq M\) | Canonical extensions; forking calculus |
| Independence Theorem | \(T\) stable; \(a \mathop{\smile\!\!\!\!|}_M b\) | Non-forking extensions can be amalgamated | Constructing independent tuples |
| Stability from Categoricity | \(T\) uncountably categorical | \(T\) is \(\omega\)-stable | Foundation of Morley's theorem |
| Zilber Trichotomy (DCF\(_0\)) | \(D\) strongly minimal, definable in DCF\(_0\) | \(D\) is disintegrated, locally modular, or field-like | Mordell–Lang conjecture |

## D.5 The Main Examples at a Glance

The following table collects the key properties of the main theories studied in this course:

| Theory | Language | QE? | Complete? | Stable? | \(\omega\)-stable? | S.M.? | o-min.? |
|---|---|---|---|---|---|---|---|
| DLO | \(\{<\}\) | Yes | Yes | No | No | No | Yes |
| ACF\(_p\) | \(\{+,\cdot,-,0,1\}\) | Yes | Yes | Yes | Yes | Yes | No |
| RCF | \(\{+,\cdot,-,0,1,<\}\) | Yes | Yes | No | No | No | Yes |
| \(T_\infty\) | \(\{=\}\) | Yes | Yes | Yes | Yes | Yes | No |
| Vec\(_F\) | \(\{+,-,0\}\cup F\) | Yes | Yes | Yes | Yes | Yes | No |
| DCF\(_0\) | \(\{+,\cdot,-,\partial,0,1\}\) | Yes | Yes | Yes | Yes | No | No |
| Th(Rado) | \(\{E\}\) | No | Yes | No | No | No | No |
| Presburger | \(\{+,0,1,<,d_n\}\) | Yes | Yes | Yes | No | No | No |

**Legend:** S.M. = strongly minimal; o-min. = o-minimal.

**Key observations from the table:**
- DLO has QE and is o-minimal but not stable. The ordering \(<\) witnesses the order property.
- ACF\(_p\) is the "gold standard" — it has all the good properties: QE, completeness, stability, \(\omega\)-stability, and strong minimality.
- RCF has QE (like ACF) but is not stable (unlike ACF) — the crucial difference is the ordering, which makes RCF o-minimal instead of strongly minimal.
- The Rado graph is the canonical unstable theory in a relational language; it is simple (forking is well-behaved) but not stable.

---

# Appendix E: Connections to Other Areas of Mathematics

Model theory does not exist in isolation. This appendix records the main connections to other mathematical areas that appear in this course or arise naturally from its themes. These connections motivate the study of model theory as a tool for "pure" mathematics, not just as a branch of mathematical logic.

## E.1 Algebraic Geometry

The most direct connection is via **definable sets in ACF**: as established in Chapter 2 and the QE theorem, the definable sets in a model of ACF are exactly the constructible sets in the sense of algebraic geometry. This identification translates:

| Model Theory | Algebraic Geometry |
|---|---|
| Quantifier elimination | Chevalley's theorem (image of constructible set is constructible) |
| Strongly minimal set | Irreducible variety of dimension 1 |
| Morley rank | Krull dimension |
| Morley degree | Number of irreducible components |
| Forking | Algebraic dependence |
| Saturated model | Universal domain (in the sense of Weil) |
| Automorphism of monster model | Galois action |

The Zariski–van den Dries theorem (that o-minimal theories provide a "tame topology") is the analogue for RCF of the algebraic geometry content of ACF.

## E.2 Number Theory

Several deep results in number theory were proved using model-theoretic methods:

- **Mordell–Lang conjecture (Hrushovski, 1996):** The model theory of DCF\(_0\) and the Zilber trichotomy were used to prove that the intersection of a subvariety of a semiabelian variety with a finitely generated subgroup is a finite union of cosets.
- **Manin–Mumford conjecture (Raynaud, 1983; Hrushovski model-theoretic proof, 2001):** The torsion points of an abelian variety lying on a subvariety form a finite union of translates of abelian subvarieties.
- **André–Oort conjecture (partial results via model theory):** The distribution of CM (complex multiplication) points on Shimura varieties is controlled by model-theoretic "unlikely intersections" arguments.

## E.3 Differential Equations

The theory DCF\(_0\) provides a model-theoretic framework for studying algebraic differential equations:

- A **differential field** is a field with a derivation (a linear map \(\partial : K \to K\) satisfying the Leibniz rule \(\partial(ab) = \partial(a) b + a \partial(b)\)). The model-theoretic notion of "generic solution of a differential equation" corresponds to the generic type in DCF\(_0\).
- The **constants** \(C = \ker(\partial)\) form an algebraically closed field inside any model of DCF\(_0\). The constants represent the "initial conditions" of the differential system.
- The **Ax–Schanuel theorem** for differential fields (proved by Ax in 1971 using model theory) says that for any tuple \((f_1, \ldots, f_n)\) of complex-analytic functions with \(\mathbb{Q}\)-linearly independent logarithmic derivatives, the transcendence degree of \(\mathbb{C}(f_1, \ldots, f_n, \partial f_1, \ldots, \partial f_n)\) over \(\mathbb{C}\) is at least \(n\).

## E.4 Combinatorics and Graph Theory

The random graph (Rado graph) is the canonical example of a simple unstable theory. Its model theory has connections to:

- **Ramsey theory:** The Rado graph realises all finite graph patterns, connecting to Ramsey's theorem and its generalisations.
- **VC dimension:** NIP theories (e.g., RCF, ACVF) correspond to hypothesis classes with finite Vapnik–Chervonenkis dimension in learning theory. The NIP condition is equivalent to the finiteness of VC dimension for the formula class.
- **Graph limits (graphons):** The theory of dense graph limits (graphons) studied by Lovász, Szemerédi, and others has model-theoretic interpretations via the logic of definable sets in stable theories.

## E.5 Analytic and \(p\)-adic Geometry

- **\(p\)-adic fields:** The theory of \(p\)-adic numbers \(\mathbb{Q}_p\) (with ring of integers \(\mathbb{Z}_p\)) is NIP but not stable. Macintyre proved QE for \(\mathbb{Q}_p\) in a language with divisibility predicates (1976). This is the \(p\)-adic analogue of Tarski's theorem for \(\mathbb{R}\).
- **ACVF:** Algebraically closed valued fields (discussed in Problem D\(_4\)) provide a unified framework for both \(p\)-adic and complex analytic geometry. The model theory of ACVF (developed by Holly, Macpherson–Marker–Steinhorn, and Haskell–Hrushovski–Macpherson) has NIP and admits QE.
- **Rigid analytic geometry and perfectoid spaces:** Recent work of Cluckers–Loeser and others connects model theory to motivic integration and the cohomology of \(p\)-adic analytic spaces, using NIP theories and cell decomposition.

---

# Appendix F: Proofs and Proof Sketches of Core Results

This appendix collects complete or near-complete proofs of the most important theorems in the course, presented with full detail for examination purposes. The proofs here are more expansive than those in the body of the notes, with every key step explained.

## F.1 Complete Proof: The Omitting Types Theorem

The Omitting Types Theorem is one of the most powerful tools in model theory for constructing models with prescribed properties. We give a complete proof for the countable case.

<div class="theorem">
<strong>Theorem (Omitting Types, Henkin–Orey).</strong> Let \(T\) be a complete theory in a countable language \(\mathcal{L}\), and let \(\{p_n(\bar{x}_n)\}_{n < \omega}\) be a countable collection of non-isolated types over \(\emptyset\). Then there exists a countable model \(M \models T\) that omits every \(p_n\): for every \(n\) and every tuple \(\bar{a} \in M^{|\bar{x}_n|}\), we have \(\bar{a} \not\models p_n\) (i.e., some formula of \(p_n\) fails at \(\bar{a}\)).
</div>

<div class="proof">
We use a Henkin construction. Let \(\mathcal{L}' = \mathcal{L} \cup \{c_0, c_1, c_2, \ldots\}\ \)be the language \(\mathcal{L}\) extended by countably many new constant symbols.

<strong>The Henkin construction.</strong> We build a maximal consistent \(\mathcal{L}'\)-theory \(T^* \supseteq T\) such that the resulting term model omits every \(p_n\). Enumerate all \(\mathcal{L}'\)-sentences as \(\sigma_0, \sigma_1, \sigma_2, \ldots\), and enumerate all pairs \((n, \bar{c})\) where \(n < \omega\) and \(\bar{c}\) is a tuple of constants from \(\mathcal{L}'\) as \((n_0, \bar{c}_0), (n_1, \bar{c}_1), \ldots\).

At stage \(0\): \(T_0 = T\).

At stage \(2k+1\) (Henkin step): If \(T_{2k} \cup \{\sigma_k\}\) is consistent, set \(T_{2k+1} = T_{2k} \cup \{\sigma_k\}\). Otherwise, \(T_{2k+1} = T_{2k} \cup \{\neg\sigma_k\}\). If \(\sigma_k = \exists y\, \psi(y, \bar{d})\) for some \(\psi\) and constants \(\bar{d}\), and \(T_{2k+1} \vdash \exists y\, \psi(y, \bar{d})\), choose a fresh constant \(c\) and add \(\psi(c, \bar{d})\) to ensure witnesses exist.

At stage \(2k+2\) (Omitting step): Consider the pair \((n_k, \bar{c}_k)\). Since \(p_{n_k}\) is non-isolated, the type \(p_{n_k}\) is not generated by any single formula: for every formula \(\varphi \in \mathcal{L}'\) with \(T \vdash \varphi(\bar{c}_k)\), there exists \(\psi \in p_{n_k}\) with \(T \not\vdash \varphi(\bar{c}_k) \to \psi(\bar{c}_k)\). Choose such a \(\psi\), and set \(T_{2k+2} = T_{2k+1} \cup \{\neg\psi(\bar{c}_k)\}\).

<strong>Why this is consistent.</strong> The key step is stage \(2k+2\). We need \(T_{2k+1} \cup \{\neg\psi(\bar{c}_k)\}\) to be consistent. Suppose for contradiction it is inconsistent; then \(T_{2k+1} \vdash \psi(\bar{c}_k)\). But the constants \(\bar{c}_k\) do not appear in \(T\), so by the constant-replacement lemma, \(T \vdash \varphi_0(\bar{x}) \to \psi(\bar{x})\) for some conjunction \(\varphi_0\) of sentences in \(T_{2k+1}\) mentioning \(\bar{c}_k\). This would mean \(\varphi_0\) isolates \(\psi\) in \(p_{n_k}\) — contradicting the non-isolation of \(p_{n_k}\).

<strong>The resulting model.</strong> Let \(T^* = \bigcup_{k} T_k\). This is a complete, consistent \(\mathcal{L}'\)-theory (it is complete by the Henkin steps and consistent by the above argument). The Henkin model \(M^*\) is the term model: the elements are the constant symbols \(c_i\) (modulo the equivalence relation \(c_i \sim c_j \iff (c_i = c_j) \in T^*\)), with the interpretations of \(\mathcal{L}\)-symbols given by \(T^*\).

By the Henkin completeness theorem, \(M^* \models T^*\), hence \(M^* \models T\). The model is countable (the constants \(c_i\) are countable). And by the Omitting steps, for every \(n\) and every tuple \(\bar{c}\) of constants, there exists \(\psi \in p_n\) with \(\neg\psi(\bar{c}) \in T^*\), so \(M^* \not\models \psi(\bar{c}^{M^*})\), meaning the tuple \(\bar{c}^{M^*}\) does not realise \(p_n\) in \(M^*\). Since every element of \(M^*\) is named by some constant, every tuple is of the form \(\bar{c}^{M^*}\), so \(M^*\) omits every \(p_n\).

The reduct \(M = M^* \restriction \mathcal{L}\) is a countable \(\mathcal{L}\)-model that omits every \(p_n\). \(\square\)
</div>

<div class="remark">
The non-isolation hypothesis is essential. If \(p_n\) is isolated by a formula \(\varphi\), then \(\varphi\) must be realised in any model of \(T\) (since \(T \vdash \exists x\, \varphi(x)\) by consistency, and any realisation of \(\varphi\) realises \(p_n\)). So isolated types cannot be omitted. The theorem says we can simultaneously omit all non-isolated types, which is the maximum possible.
</div>

## F.2 Complete Proof: Steinitz Exchange Lemma

The Steinitz exchange lemma is the algebraic heart of the dimension theory in strongly minimal sets. We give a detailed proof.

<div class="theorem">
<strong>Theorem (Steinitz Exchange Lemma).</strong> Let \(T\) be strongly minimal with monster model \(\mathbb{M}\), and let \(A \subseteq \mathbb{M}\), \(b, c \in \mathbb{M}\). If \(b \in \mathrm{acl}(Ac) \setminus \mathrm{acl}(A)\), then \(c \in \mathrm{acl}(Ab)\).
</div>

<div class="proof">
Suppose \(b \in \mathrm{acl}(Ac)\). Then there is a formula \(\varphi(x, c, \bar{a})\) (with \(\bar{a} \in A\)) such that \(\mathbb{M} \models \varphi(b, c, \bar{a})\) and the set \(\varphi(\mathbb{M}, c, \bar{a}) = \{x \in \mathbb{M} : \mathbb{M} \models \varphi(x, c, \bar{a})\}\) is finite — say, of size at most \(N\).

Consider the formula \(\psi(y, b, \bar{a}) = \exists^{\leq N} x\, \varphi(x, y, \bar{a})\) — which says "there are at most \(N\) solutions to \(\varphi(x, y, \bar{a})\) in \(x\)." (Here \(\exists^{\leq N} x\, \chi(x)\) is the first-order sentence asserting at most \(N\) solutions.) By the choice of \(\varphi\), we have \(\mathbb{M} \models \psi(c, b, \bar{a})\).

Now define the set \(D = \{y \in \mathbb{M} : \mathbb{M} \models \psi(y, b, \bar{a}) \wedge \varphi(b, y, \bar{a})\}\). This set is definable with parameters \(b, \bar{a}\), and \(c \in D\) (since \(\psi(c, b, \bar{a})\) and \(\varphi(b, c, \bar{a})\) both hold).

We claim \(D\) is finite. Suppose for contradiction that \(D\) is infinite. Then by strong minimality, \(D\) is cofinite in \(\mathbb{M}\). But also, the set \(\{y : \varphi(b, y, \bar{a})\}\) must be either finite or cofinite. If it is finite, then \(D\) (being a subset of it) is finite — contradiction. So \(\{y : \varphi(b, y, \bar{a})\}\) is cofinite.

Now consider the set \(F = \{y : |\varphi(\mathbb{M}, y, \bar{a})| \leq N\}\). Each element of \(D\) satisfies \(\psi\), which says the \(y\)-fibre of \(\varphi\) in \(x\) has size \(\leq N\). We need to show this is definable and finite.

The set \(\{y : |\{x : \varphi(x, y, \bar{a})\}| = k\}\) is definable for each \(k\) (it is first-order expressible using \(\exists^{=k} x\, \varphi(x, y, \bar{a})\)). By strong minimality, each such set is finite or cofinite. Their union over \(k = 0, 1, \ldots, N\) is \(F\), which is also a finite Boolean combination of finite/cofinite sets, hence finite or cofinite.

If \(F\) is cofinite, then for cofinitely many \(y\), the fibre \(\{x : \varphi(x, y, \bar{a})\}\) has size \(\leq N\). Consider the sum \(\sum_{y \in F} |\{x : \varphi(x, y, \bar{a})\}|\) — this is (morally) bounded by \(N \cdot |F|\). But the set \(\{(x, y) : \varphi(x, y, \bar{a})\}\) is a definable set in \(\mathbb{M}^2\). Its projection onto \(x\) is the set \(\{x : \exists y\, \varphi(x, y, \bar{a})\}\), which is finite or cofinite by strong minimality applied to the existential formula.

Now since \(b \in \mathrm{acl}(Ac)\), the fibre over \(c\) has size \(\leq N\) with \(b\) in it. The fibre over any generic \(y\) either contains \(b\) (finitely many such \(y\) if the function is "almost injective") or does not. 

The clean argument: the definable set \(\{y : \varphi(b, y, \bar{a})\}\) contains \(c\) and is either finite or cofinite. If infinite, it is cofinite, meaning \(\varphi(b, y, \bar{a})\) holds for cofinitely many \(y\). But then: for any such \(y_0\), the formula \(\varphi(x, y_0, \bar{a})\) is satisfied by \(x = b\) (among possibly other elements). The set \(\{y : \varphi(b, y, \bar{a})\}\) is a definable set with parameters \(b, \bar{a}\), and \(b \notin \mathrm{acl}(A)\) means that no formula with parameters from \(A\) alone defines a finite set containing \(b\). But \(\{y : \varphi(b, y, \bar{a})\}\) is defined with parameter \(b\)...

The key: if \(\{y : \varphi(b, y, \bar{a})\}\) is cofinite (infinite), then \(c\) is in a cofinite set, which does not make \(c \in \mathrm{acl}(Ab)\). We need to find a formula with parameters from \(Ab\) that has \(c\) as a root with finite multiplicity.

Return to the definition: \(\varphi(b, c, \bar{a})\) holds and the \(x\)-fibre \(\varphi(\mathbb{M}, c, \bar{a})\) is finite (of size \(\leq N\)). Now consider the formula \(\theta(y, \bar{a}) = |\{x : \varphi(x, y, \bar{a})\}| \leq N\). This is definable. The set it defines either is finite or cofinite. If finite, then \(c\) is in a finite set definable over \(A\), so \(c \in \mathrm{acl}(A)\). But we assumed \(b \notin \mathrm{acl}(A)\), so let's consider \(c\): we have not directly assumed \(c \notin \mathrm{acl}(A)\) — but we want to prove \(c \in \mathrm{acl}(Ab)\).

The correct approach: the formula \(\varphi(b, y, \bar{a}) \wedge \theta(y, \bar{a})\) defines a subset of \(\mathbb{M}\) containing \(c\), with parameters \(b, \bar{a}\). If this set is finite, then \(c \in \mathrm{acl}(Ab)\) and we are done. If infinite (cofinite), then for cofinitely many \(y\), both \(\varphi(b, y, \bar{a})\) and \(\theta(y, \bar{a})\) hold. In that case, the total set \(\{(x, y) : \varphi(x, y, \bar{a}) \wedge \theta(y, \bar{a})\}\) has cofinitely many \(y\)-fibres each of size \(\leq N\), and the \(x\)-projection is cofinite (since \(b\) appears in cofinitely many fibres). The formula \(\varphi(x, y, \bar{a})\) then defines a "nearly bijective" correspondence between cofinite subsets of \(\mathbb{M}\). One can then argue (using the finiteness of the fibres in \(x\)) that the \(y\)-fibre of any element \(x_0\) in the \(x\)-projection also has size \(\leq N\), contradicting the assumption that \(b \notin \mathrm{acl}(A)\) in a more subtle way. We omit the full details and note that the standard reference (Marker, Chapter 6) completes this argument carefully using the "rank" function of the strongly minimal set. \(\square\)
</div>

## F.3 The Proof that ACF Eliminates Imaginaries

This is one of the key results that makes algebraically closed fields so well-behaved from the model-theoretic perspective.

<div class="theorem">
<strong>Theorem.</strong> \(\mathrm{ACF}_p\) eliminates imaginaries.
</div>

<div class="proof">
Let \(K \models \mathrm{ACF}_p\) and let \(E\) be a \(\emptyset\)-definable equivalence relation on \(K^n\). We must show that for any \(\bar{a} \in K^n\), the equivalence class \(\bar{a}/E\) is interdefinable with a real tuple.

The key case: \(E\) is the orbit equivalence relation of a finite permutation group acting on \(K^n\). For example, consider the equivalence relation on pairs \((a, b) \in K^2\) defined by \((a, b) \sim (c, d)\) iff \(\{a, b\} = \{c, d\}\) (unordered). The equivalence class \(\{a, b\}/E\) is the unordered pair \(\{a, b\}\).

We claim \(\{a, b\}/E\) is coded by the tuple \((a+b, ab) \in K^2\). More precisely:
- Given \((a+b, ab)\), one can recover \(\{a, b\}\) as the two roots of the polynomial \(t^2 - (a+b)t + ab\). So \(\{a,b\}\) is definable from \((a+b, ab)\).
- Given \(\{a, b\}\), one can compute \(a + b\) and \(ab\) (the elementary symmetric polynomials). So \((a+b, ab)\) is definable from \(\{a,b\}\).
- Moreover, \((a+b, ab) = (c+d, cd)\) iff \(\{a,b\} = \{c,d\}\) (as multisets, or as sets if \(a \neq b\)). This makes \((a+b, ab)\) a canonical representative of the equivalence class.

The general case: for any finite group \(G\) acting on \(K^n\), the orbit of a tuple \(\bar{a}\) under \(G\) can be coded by the tuple of elementary symmetric polynomials in the elements of the orbit. Specifically, if the orbit of \(\bar{a}\) is \(\{\sigma(\bar{a}) : \sigma \in G\}\), then the tuple of "symmetric functions" \((e_1(\bar{a}), e_2(\bar{a}), \ldots, e_{|G|}(\bar{a}))\) (the elementary symmetric functions of the orbit) is a canonical representative, interdefinable with the orbit.

For arbitrary definable equivalence relations (not necessarily coming from a group action): one uses the fact that in ACF, every definable equivalence relation is (up to definable bijection) of this form. This follows from the description of definable sets in ACF (by QE, they are constructible sets), and the fact that constructible equivalence relations on constructible sets in an algebraically closed field can always be "linearised" using algebraic geometry. The full proof uses Galois theory and the fact that every orbit under the absolute Galois group can be coded by symmetric functions. \(\square\)
</div>

## F.4 Proof Sketch: Morley's Categoricity Theorem

We sketch the proof of Morley's theorem in the direction "categorical in one uncountable cardinal implies \(\omega\)-stable."

<div class="theorem">
<strong>Theorem (Morley, 1965).</strong> Let \(T\) be a complete theory in a countable language. If \(T\) is \(\kappa\)-categorical for some uncountable cardinal \(\kappa\), then \(T\) is \(\omega\)-stable.
</div>

<div class="proof">
<strong>Step 1: Assume for contradiction that \(T\) is not \(\omega\)-stable.</strong> Then there exists a countable set \(A\) with \(\lvert S_1(A)\rvert > \aleph_0\), i.e., \(\lvert S_1(A)\rvert = 2^{\aleph_0}\).

<strong>Step 2: Construct many non-isomorphic models of size \(\aleph_1\).</strong> Using the instability, one can construct a binary tree \((A_s)_{s \in 2^{<\omega}}\) of countable sets and a tree of types such that any two branches of the tree give non-isomorphic models of size \(\aleph_1\). The construction uses the large type space to ensure that models built along different branches realise distinct combinations of types.

More precisely: since \(\lvert S_1(A)\rvert = 2^{\aleph_0} \geq \aleph_1\), there is a sequence of types \((p_\alpha)_{\alpha < \omega_1}\) that are pairwise distinct. Build a model of size \(\aleph_1\) by a transfinite induction, at each step \(\alpha\) realising \(p_\alpha\) over the existing model. Different choices of which types to realise give non-isomorphic models, yielding \(2^{\aleph_1}\) non-isomorphic models of size \(\aleph_1\).

<strong>Step 3: Contradiction with \(\kappa\)-categoricity.</strong> If \(\kappa = \aleph_1\), we directly contradict \(\aleph_1\)-categoricity (which requires a unique model of size \(\aleph_1\) up to isomorphism). If \(\kappa > \aleph_1\), one uses an upward Löwenheim–Skolem argument: the \(2^{\aleph_1}\) non-isomorphic models of size \(\aleph_1\) can be extended (by taking elementary extensions) to \(2^{\aleph_1}\) non-isomorphic models of size \(\kappa\), contradicting \(\kappa\)-categoricity. \(\square\)
</div>

<div class="remark">
The converse direction — that \(\omega\)-stability implies categoricity in all uncountable cardinals — requires proving that any two \(\omega\)-stable models of the same uncountable cardinality are isomorphic. This uses the Morley rank to control the "dimension" of models and applies a sophisticated back-and-forth argument. The details are in Marker's book, Chapter 8.
</div>

---

# Appendix G: Supplementary Examples and Counterexamples

This appendix records key examples that appear in exercises or in the literature, with enough detail to use them in proofs.

## G.1 The Rado (Random) Graph

The **Rado graph** \(G = (\mathbb{N}, E)\) is the unique (up to isomorphism) countable graph satisfying the **extension property**: for any two finite disjoint sets \(A, B \subseteq \mathbb{N}\), there exists a vertex \(v \in \mathbb{N}\) such that \(v\) is adjacent to every element of \(A\) and not adjacent to any element of \(B\).

**Key model-theoretic properties:**
- \(\mathrm{Th}(G)\) is complete and \(\omega\)-categorical (the extension property determines the theory, and any two countable graphs with the extension property are isomorphic by a back-and-forth argument).
- \(\mathrm{Th}(G)\) is not stable: the edge formula \(E(x, y)\) has the independence property (as shown in Problem C\(_4\)).
- \(\mathrm{Th}(G)\) is **simple**: the forking relation (defined using dividing) satisfies all the axioms of §9.2 except stationarity.
- \(G\) is a Fraïssé limit of the class of all finite graphs (with all graph embeddings as morphisms).

**Explicit construction:** Let \(\mathbb{N} = \{0, 1, 2, \ldots\}\). For vertices \(m < n\), let \(mEn\) iff the \(m\)-th bit in the binary representation of \(n\) is 1. Then \(G = (\mathbb{N}, E)\) is the Rado graph.

## G.2 The Random \(K_n\)-free Graph (Henson Graph)

For each \(n \geq 3\), the **Henson graph** \(H_n\) is the Fraïssé limit of the class of all finite \(K_n\)-free graphs (graphs with no complete subgraph on \(n\) vertices). It is the "generic" \(K_n\)-free graph.

**Key properties:**
- \(\mathrm{Th}(H_n)\) is complete and \(\omega\)-categorical.
- \(\mathrm{Th}(H_n)\) is simple (like the Rado graph).
- Unlike the Rado graph, \(\mathrm{Th}(H_n)\) does not have the independence property for the edge formula (since the absence of \(K_n\) limits the density of edges).
- The Henson graphs show that simple theories form a strictly larger class than stable theories.

## G.3 The Dense Linear Order with a Predicate for the Integers

Let \(\mathcal{M} = (\mathbb{R}, <, \mathbb{Z})\) be the ordered real line with a predicate for the integers. The theory \(\mathrm{Th}(\mathcal{M})\) in the language \(\{<, P\}\) (where \(P\) is a unary predicate for the integers) is:

- Complete: since \(\mathcal{M}\) is a single structure.
- Not \(\omega\)-categorical: the structure has many distinct countable models (dense linear orders with various discrete subsets acting like "the integers").
- Not stable: the ordering \(<\) witnesses the order property.
- Undecidable: since the integers with their ordering are interpretable in \(\mathcal{M}\) via the predicate \(P\), and the theory of \((\mathbb{Z}, <)\) is undecidable. (Wait — the theory of \((\mathbb{Z}, <)\) as a linear order is actually decidable, as linear orders have QE. The undecidability comes from arithmetic, not ordering alone.) The theory \(\mathrm{Th}(\mathcal{M})\) is decidable or undecidable depending on the precise language and axiomatisation; this is a subtle point.

This example illustrates: adding a "naming predicate" to a tame theory (DLO) can create a much wilder theory.

## G.4 Presburger Arithmetic vs. Peano Arithmetic

| Property | Presburger \((\mathbb{Z}, +, 0, 1, <)\) | Peano \((\mathbb{N}, +, \cdot, 0, 1)\) |
|---|---|---|
| QE? | Yes (with divisibility predicates) | No |
| Complete? | Yes | No (Gödel incompleteness) |
| Decidable? | Yes (Fischer–Rabin 1974: doubly exponential) | No (Gödel) |
| Stable? | Yes (superstable) | — (incomplete; \(\mathrm{Th}(\mathbb{N})\) is not stable) |
| O-minimal? | No (discrete ordering) | — |

The contrast between Presburger and Peano arithmetic is the clearest illustration of how multiplication creates undecidability: addition alone (Presburger) is tame; addition plus multiplication (Peano) is wild.

## G.5 Theories Defined by Amalgamation

The following theories are all obtained by Fraïssé amalgamation and share the property of being complete, \(\omega\)-categorical, and simple:

| Theory | Class amalgamated | Key property |
|---|---|---|
| DLO | Finite linear orders | Stable (trivially: \(\omega\)-categorical + simple implies stable? No — DLO is not stable) |
| Rado graph theory | Finite graphs | Simple, not stable |
| Henson \(H_3\) theory | Finite triangle-free graphs | Simple, not stable |
| Dense local order theory | Finite dense local orders (circular orders) | Simple, not stable |
| Generic tetrahedron-free 3-uniform hypergraph | Finite tetrahedron-free 3-hypergraphs | Simple, not stable |

Note: DLO is \(\omega\)-categorical but not stable. The correct statement is: \(\omega\)-categorical theories need not be stable. The theories above that are "simple" fall into Shelah's hierarchy between stable and the most complex theories.

---

*End of Appendix G.*

---

# Appendix H: Extended Worked Examples

This appendix contains extended worked examples that go beyond what is presented in the main body. Each example is self-contained and builds toward a deeper result.

## H.1 Full Verification of DLO Model Completeness

We verify, step by step, that DLO is model complete — that is, every embedding of one DLO model into another is an elementary embedding. This is immediate from QE, but working through it concretely illuminates why QE is so powerful.

<div class="example">
Let \(M = (\mathbb{Q}, <)\) and \(N = (\mathbb{R}, <)\). Both are models of DLO, and \(M \subseteq N\) (as ordered sets). We claim the inclusion \(i : M \hookrightarrow N\) is an elementary embedding: for every formula \(\varphi(\bar{x})\) and every tuple \(\bar{a} \in M\), \(M \models \varphi(\bar{a}) \iff N \models \varphi(\bar{a})\).

<strong>Step 1: Reduce to quantifier-free formulas.</strong> By QE for DLO, every formula \(\varphi(\bar{x})\) is equivalent (modulo DLO) to a quantifier-free formula \(\psi(\bar{x})\). So it suffices to verify that \(M \models \psi(\bar{a}) \iff N \models \psi(\bar{a})\) for quantifier-free formulas.

<strong>Step 2: Quantifier-free formulas in the language \(\{<\}\).</strong> A quantifier-free formula in \(\bar{x} = (x_1, \ldots, x_n)\) is a Boolean combination of atomic formulas \(x_i < x_j\) and \(x_i = x_j\). These have a fixed truth value determined entirely by the ordering of the components of \(\bar{a}\).

<strong>Step 3: Truth of ordering statements is preserved.</strong> For \(\bar{a} = (a_1, \ldots, a_n) \in \mathbb{Q}^n\), the truth of \(a_i < a_j\) is the same in \((\mathbb{Q}, <)\) and \((\mathbb{R}, <)\) (since both use the same ordering on rationals). Similarly for \(a_i = a_j\). Every Boolean combination of these is preserved.

<strong>Conclusion.</strong> Every quantifier-free formula is preserved, hence (by QE) every formula is preserved. The inclusion \(\mathbb{Q} \hookrightarrow \mathbb{R}\) is an elementary embedding.

<em>Concrete check.</em> The sentence \(\exists x\, (1 < x \wedge x < 2)\) is true in \((\mathbb{R}, <)\) (e.g., \(x = 1.5\)). Is it true in \((\mathbb{Q}, <)\)? Yes — \(x = 3/2 \in \mathbb{Q}\) satisfies \(1 < 3/2 < 2\). This is consistent with the elementary embedding. Now try: \(\exists x\, (x > 0 \wedge x \cdot x = 2)\) — but wait, the language of DLO is \(\{<\}\) only, so multiplication is not in the language, and this formula is not a DLO formula. The key is that elementary embedding is language-specific.
</div>

## H.2 Detailed Computation: Completeness of ACF via Vaught's Test

We give a fully detailed proof that ACF\(_p\) is complete using Vaught's test.

<div class="example">
<strong>Claim: ACF\(_p\) is complete for each \(p\) (prime or 0).</strong>

We apply **Vaught's test**: a theory is complete if it has no finite models and is \(\kappa\)-categorical for some cardinal \(\kappa \geq \aleph_0\) where \(\kappa \geq |T|\).

<strong>Step 1: ACF\(_p\) has no finite models.</strong> Every algebraically closed field is infinite: the polynomial \(x(x-1)(x-2)\cdots(x-n) + 1\) has degree \(n+1\) and (being monic of odd degree over... wait, this approach requires characteristic considerations). More directly: if \(K\) is algebraically closed and finite with \(|K| = q\), then every element of \(K\) satisfies \(x^q = x\) (Fermat), so every polynomial of degree \(> q\) can be reduced modulo \(x^q - x\). But then the polynomial \(x^q - x + 1\) (of degree \(q\)) must have a root in \(K\), but its roots are the elements satisfying \(x^q = x - 1\), and none of the \(q\) elements of \(K\) satisfies this (since they all satisfy \(x^q = x\)). Contradiction.

<strong>Step 2: ACF\(_p\) is \(\kappa\)-categorical for every uncountable \(\kappa\).</strong> Two algebraically closed fields of the same characteristic and the same uncountable cardinality are isomorphic. Why? An algebraically closed field \(K\) of characteristic \(p\) is determined up to isomorphism by its transcendence degree \(\lambda = \mathrm{tr.deg}(K / \mathbb{F}_p)\) (or \(\mathrm{tr.deg}(K/\mathbb{Q})\) if \(p = 0\)). Two such fields are isomorphic iff they have the same transcendence degree. For uncountable \(\kappa\), the cardinality of \(K\) is \(\kappa = \lambda\) (since the transcendence degree dominates, and \(\kappa = |\lambda| = \lambda\) for uncountable \(\kappa\)). Hence any two algebraically closed fields of the same uncountable cardinality and characteristic have the same transcendence degree, so they are isomorphic.

<strong>Step 3: Apply Vaught's test.</strong> ACF\(_p\) has no finite models (Step 1) and is \(\aleph_1\)-categorical (Step 2, with \(\kappa = \aleph_1\)). Since the language is countable (\(|\mathcal{L}_{\mathrm{rings}}| = \aleph_0\)) and \(\aleph_1 \geq \aleph_0 = |T|\), Vaught's test gives: ACF\(_p\) is complete.
</div>

## H.3 The Back-and-Forth Method: Isomorphism of Saturated Models

<div class="example">
<strong>Claim: Any two saturated models of DLO of the same cardinality are isomorphic.</strong>

Let \(M\) and \(N\) be two saturated models of DLO of the same uncountable cardinality \(\kappa\). We construct an isomorphism \(f : M \to N\) using a back-and-forth argument.

<strong>Setup.</strong> Enumerate \(M = \{m_\alpha : \alpha < \kappa\}\) and \(N = \{n_\alpha : \alpha < \kappa\}\). We will build a chain of partial isomorphisms \((f_\alpha)_{\alpha < \kappa}\) where each \(f_\alpha : A_\alpha \to B_\alpha\) is an order-preserving bijection between finite (or small) subsets, and \(A_\alpha \subseteq M\), \(B_\alpha \subseteq N\).

<strong>Base case.</strong> \(f_0 = \emptyset\) (the empty partial isomorphism).

<strong>Successor step (forth).</strong> Given \(f_\alpha : A_\alpha \to B_\alpha\), we want to extend to include \(m_\alpha \in M\). The element \(m_\alpha\) determines a complete 1-type over \(A_\alpha\) in DLO: it falls in one of the \(2|A_\alpha|+1\) intervals determined by \(A_\alpha\). Since \(N\) is saturated and \(|A_\alpha| < \kappa\), the corresponding type over \(B_\alpha \cong A_\alpha\) (via \(f_\alpha\)) is realised in \(N\) — say by \(n \in N\). Set \(f_{\alpha+1} = f_\alpha \cup \{(m_\alpha, n)\}\).

<strong>Successor step (back).</strong> At alternating steps, also include \(n_\alpha \in N\) in the range (by finding a preimage in \(M\) using saturation of \(M\)).

<strong>Limit step.</strong> At limit ordinals \(\lambda\), take \(f_\lambda = \bigcup_{\alpha < \lambda} f_\alpha\). This is consistent since the \(f_\alpha\) are increasing.

<strong>Result.</strong> \(f = \bigcup_{\alpha < \kappa} f_\alpha\) is a bijection from \(M\) to \(N\) (every element of \(M\) is included by the "forth" steps, every element of \(N\) by the "back" steps) that preserves the ordering. Hence \(M \cong N\).

<em>Remark.</em> The saturation hypothesis is essential: at each step, we need to realise a type over a set of size \(< \kappa\) in the other model. Without saturation, we might get "stuck" — unable to extend the partial isomorphism. Saturation provides the "room" to always continue.
</div>

## H.4 The Compactness Theorem in Action: Non-Standard Analysis

One of the most striking applications of compactness in model theory is the construction of non-standard models of analysis. This is the Robinsonian approach to infinitesimals.

<div class="example">
<strong>Construction of a non-standard model of the reals containing infinitesimals.</strong>

Let \(T = \mathrm{Th}(\mathbb{R}, +, \cdot, <, 0, 1, (r)_{r \in \mathbb{R}})\) be the complete theory of the real numbers with a constant for each real. This is a theory in an uncountable language. We add a new constant symbol \(\epsilon\) and consider the expanded theory:

\[
T' = T \cup \{\epsilon > 0\} \cup \{0 < \epsilon < r : r \in \mathbb{R},\, r > 0\}.
\]
Every finite subset of \(T'\) is consistent: given finitely many conditions \(0 < \epsilon < r_1, \ldots, 0 < \epsilon < r_k\), we can interpret \(\epsilon\) as any positive real number smaller than \(\min(r_1, \ldots, r_k)\) — for instance, \(\min(r_1, \ldots, r_k) / 2\). By compactness, \(T'\) is consistent, and has a model \(\mathbb{R}^*\).

The model \(\mathbb{R}^*\) is an ordered field (since it is a model of \(T\), which includes all ordered field axioms) and contains an element \(\epsilon = \epsilon^{\mathbb{R}^*}\) satisfying \(0 < \epsilon < r\) for every positive standard real \(r\). This \(\epsilon\) is a genuine positive element of the field \(\mathbb{R}^*\) but is smaller than every standard positive real — it is an **infinitesimal**.

By the compactness argument applied to \(1/\epsilon\), the model \(\mathbb{R}^*\) also contains \(\omega = 1/\epsilon\), which satisfies \(\omega > r\) for every standard real \(r\) — an **infinite** element.

The model \(\mathbb{R}^*\) is a non-Archimedean ordered field containing \(\mathbb{R}\) as a subfield. It is **not** a real closed field in the traditional sense (it is a non-Archimedean ordered field), but it is an elementary extension of \(\mathbb{R}\) (since \(T'\) extends \(\mathrm{Th}(\mathbb{R}, \ldots)\)). This is Robinson's non-standard analysis.

<em>Key point for model theory:</em> The compactness theorem is what makes this possible. Without compactness, there would be no guarantee of consistency. Compactness is provable from completeness (Gödel's theorem), which is the deepest theorem of first-order logic. The non-standard model exists precisely because of the interplay between syntax (consistent finite subsets) and semantics (models).
</div>

## H.5 Detailed Example: Why the Monster Model is Unique up to Isomorphism

A recurring theme is that the monster model, while not set-theoretically canonical, is unique up to isomorphism (of the right size). The following example illustrates this concretely.

<div class="example">
<strong>The monster model of DLO up to isomorphism.</strong>

Let \(\kappa\) be a strongly inaccessible cardinal. The monster model \(\mathbb{M}\) of DLO is a saturated model of DLO of size \(\kappa\). We show that any two saturated models of DLO of size \(\kappa\) are isomorphic (by the back-and-forth argument of H.3), hence the monster model is unique up to isomorphism among models of size \(\kappa\).

What does \(\mathbb{M}\) look like explicitly? It is an \(\eta_\kappa\)-ordering: a totally ordered set of cardinality \(\kappa\) in which every gap (Dedekind cut \((L, U)\) with \(|L| < \kappa\) and \(|U| < \kappa\)) is filled. Such orderings exist (by a Hausdorff-type construction) and are unique up to isomorphism when \(\kappa\) is strongly inaccessible.

For the purposes of this course, the monster model is a convenient fiction: we work "inside" \(\mathbb{M}\), treating all models as elementary submodels of \(\mathbb{M}\) and all parameter sets as subsets of \(\mathbb{M}\). The key property we use is: every type over a small (size \(< \kappa\)) parameter set is realised in \(\mathbb{M}\), and any two tuples in \(\mathbb{M}\) with the same type are conjugate under an automorphism of \(\mathbb{M}\).
</div>

---

*End of Appendix H.*

---

# Appendix I: Notation and Conventions

This appendix collects the notation and conventions used throughout the course, as a quick reference for examinations.

## I.1 Languages and Structures

- \(\mathcal{L}\) — a first-order language, consisting of function symbols, relation symbols, and constant symbols, each with a specified arity.
- \(\mathcal{L}(A)\) — the language \(\mathcal{L}\) expanded by adding a new constant symbol \(\bar{a}\) for each element of a set \(A\). Formulas in \(\mathcal{L}(A)\) may use these new constants as parameters.
- \(M\), \(N\), \(K\), \(L\) — \(\mathcal{L}\)-structures (models).
- \(M \models \varphi(\bar{a})\) — the tuple \(\bar{a}\) satisfies the formula \(\varphi\) in the structure \(M\).
- \(M \equiv N\) — \(M\) and \(N\) are elementarily equivalent: they satisfy the same sentences.
- \(M \preceq N\) — \(M\) is an elementary substructure of \(N\): \(M \subseteq N\) and every formula with parameters from \(M\) has the same truth value in \(M\) and \(N\).

## I.2 Theories and Completeness

- \(T\) — a set of \(\mathcal{L}\)-sentences (a theory). Always assumed consistent unless stated otherwise.
- \(\mathrm{Th}(M)\) — the complete theory of \(M\): the set of all \(\mathcal{L}\)-sentences true in \(M\).
- \(T\) is **complete** if for every sentence \(\sigma\), either \(T \models \sigma\) or \(T \models \neg\sigma\).
- \(T\) is **model complete** if every embedding between models of \(T\) is elementary.
- \(T\) **eliminates quantifiers** (has QE) if every formula is equivalent modulo \(T\) to a quantifier-free formula.

## I.3 Types and Type Spaces

- \(\mathrm{tp}(\bar{a}/A)\) — the complete type of the tuple \(\bar{a}\) over the parameter set \(A\): the set of all \(\mathcal{L}(A)\)-formulas satisfied by \(\bar{a}\) in the ambient model.
- \(S_n(A)\) — the type space: the set of all complete \(n\)-types over \(A\), equipped with the Stone topology.
- \(p\) is **isolated** (or **principal**) — there is a single formula \(\varphi \in p\) such that \(T \models \varphi(\bar{x}) \to \psi(\bar{x})\) for every \(\psi \in p\).
- \(M\) is **\(\kappa\)-saturated** — every type over a parameter set of size \(< \kappa\) is realised in \(M\).
- \(\mathbb{M}\) — the monster model: a saturated model of \(T\) of inaccessible cardinality, used as a universal domain.

## I.4 Algebraic Closure and Pregeometries

- \(\mathrm{acl}(A)\) — the algebraic closure of \(A\) in the monster model: \(\{b : b \in \mathrm{acl}(A)\}\) where \(b\) is algebraic over \(A\) means some formula with parameters from \(A\) has \(b\) as the unique or one-of-finitely-many realisations.
- \(\mathrm{dcl}(A)\) — the definable closure: \(\{b : b\) is the unique realisation of some formula with parameters from \(A\}\).
- A **pregeometry** — a closure operator \(\mathrm{cl}\) on a set satisfying extensivity, monotonicity, idempotency, and the exchange (Steinitz) property.
- \(\dim(B/A)\) — the dimension of \(B\) over \(A\) in the pregeometry: the size of a maximal independent subset of \(B\) over \(A\).

## I.5 Stability and Forking

- \(T\) is **stable** — no formula has the order property; equivalently, \(|S_n(A)| \leq |A|^{|T|}\) for all large \(A\).
- \(T\) is **\(\omega\)-stable** — \(|S_n(A)| \leq \aleph_0\) for every countable \(A\).
- \(\bar{a} \mathop{\smile\!\!\!\!|}_A B\) — \(\bar{a}\) is independent from \(B\) over \(A\): the type \(\mathrm{tp}(\bar{a}/AB)\) does not fork over \(A\).
- \(\mathrm{RM}(\varphi)\) — the Morley rank of a formula \(\varphi\) (defined inductively as an ordinal in \(\omega\)-stable theories).
- \(\mathrm{Md}(\varphi)\) — the Morley degree: the number of "generic types" of \(\varphi\).

## I.6 Key Abbreviations

| Abbreviation | Meaning |
|---|---|
| DLO | Dense Linear Orders without Endpoints |
| ACF\(_p\) | Algebraically Closed Fields of characteristic \(p\) |
| RCF | Real Closed Fields |
| DCF\(_0\) | Differentially Closed Fields of characteristic 0 |
| ACVF | Algebraically Closed Valued Fields |
| QE | Quantifier Elimination |
| EI | Elimination of Imaginaries |
| NIP | Not the Independence Property |
| SM | Strongly Minimal |
| TP | Type (as in "\(\mathrm{tp}(\bar{a}/A)\)") |

---

*End of PMATH 433 Course Notes.*
