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

## 4.1 Complete Types

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

## 4.2 Realising and Omitting Types

A type \( p(\bar{x}) \in S_n(A) \) is **realised** in \( M \supseteq A \) if some tuple in \( M \) has type \( p \) over \( A \). Since \( p \) is consistent with \( T \), any sufficiently saturated model realises \( p \). But not every type needs to be realised in every model.

<div class="definition">
A type \( p \in S_n(A) \) is <strong>isolated</strong> (or <strong>principal</strong>) if there exists a formula \( \varphi \in p \) such that \( T \cup \{\varphi(\bar{a}) : \bar{a} \in A\} \models \psi \) for every \( \psi \in p \); that is, the formula \( \varphi \) generates \( p \) in the sense that \( T \models \varphi(\bar{x}) \to \psi(\bar{x}) \) for all \( \psi \in p \).
</div>

Isolated types are always realised in any model containing \( A \) (by a standard argument using the defining formula). Non-isolated types, by contrast, can sometimes be omitted.

<div class="theorem">
<strong>Omitting Types Theorem.</strong> Let \( T \) be a complete theory in a countable language, and let \( \{p_n\}_{n < \omega} \) be a countable collection of non-isolated types over \( \emptyset \) (or over a finite parameter set). Then there exists a countable model \( M \models T \) that omits every \( p_n \).
</div>

The proof uses a Henkin construction with a back-and-forth bookkeeping that ensures, at each stage, that the type being constructed is not forced to extend any \( p_n \). The non-isolation hypothesis is essential: an isolated type cannot be omitted in any model.

## 4.3 Saturated and Homogeneous Models

<div class="definition">
A model \( M \models T \) is <strong>\( \kappa \)-saturated</strong> if for every set \( A \subseteq M \) with \( |A| < \kappa \), every type \( p \in S_n(A) \) is realised in \( M \). It is <strong>saturated</strong> if it is \( |M| \)-saturated.
</div>

Saturated models are the model-theoretic analogue of algebraically closed fields or other universal objects: they contain all possible types over small parameter sets.

<div class="theorem">
<strong>Theorem.</strong> If \( T \) is a complete theory and \( \kappa > |T| \) is a cardinal such that \( \kappa^{<\kappa} = \kappa \) (e.g., \( \kappa \) is a strongly inaccessible cardinal, or \( \kappa = \lambda^+ \) for any \( \lambda \geq |T| \)), then \( T \) has a saturated model of cardinality \( \kappa \).
</div>

<div class="definition">
A model \( M \models T \) is <strong>\( \kappa \)-homogeneous</strong> if for any two tuples \( \bar{a}, \bar{b} \in M^{<\kappa} \) with \( \mathrm{tp}(\bar{a}) = \mathrm{tp}(\bar{b}) \), every extension of \( \bar{a} \) to \( \bar{a} c \) has a matching extension: there exists \( d \in M \) with \( \mathrm{tp}(\bar{a} c) = \mathrm{tp}(\bar{b} d) \).
</div>

Saturated models are homogeneous of the same cardinal. Homogeneity is the "structural richness" version of saturation: every automorphism between small elementary substructures extends to an automorphism of the whole model.

## 4.4 The Monster Model

In modern model theory it is extremely convenient to work inside a single large saturated model, called the **monster model**.

<div class="definition">
Let \( T \) be a complete theory. A <strong>monster model</strong> \( \mathbb{M} \) for \( T \) is a model that is \( \kappa \)-saturated and \( \kappa \)-homogeneous for some strongly inaccessible cardinal \( \kappa \) larger than any set we will ever care about. We fix \( \mathbb{M} \) once and for all and work within it: all models of \( T \) that appear in arguments are assumed to be small elementary submodels of \( \mathbb{M} \), and all parameter sets are subsets of \( \mathbb{M} \) of size less than \( \kappa \).
</div>

Inside the monster model:
- Every complete type over a small set is realised;
- Any two tuples with the same type are conjugate under an automorphism of \( \mathbb{M} \);
- Definable sets have canonical representatives.

The monster model is not a set-theoretically innocent object — its existence requires strong set-theoretic hypotheses (or a convention about universes) — but its use is heuristically and technically invaluable. In practice, one either assumes the existence of sufficiently saturated models or works in a Grothendieck-universe framework.

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

In an \(\omega\)-stable theory, one can define a **Morley rank** (the Cantor–Bendixson rank of the type space), which gives a well-behaved ordinal-valued dimension theory extending the dimension in strongly minimal sets. The Morley rank is the foundation for the structure theory of \(\omega\)-stable theories and underpins the classification program initiated by Shelah and furthered by Buechler, Hart, and others.
