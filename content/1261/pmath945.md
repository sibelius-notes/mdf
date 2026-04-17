---
title: "PMATH 945: Category Theory and Homological Algebra"
subjects: "PMATH"
prof: "Jason Bell"
---

## Sources and References

**Primary textbook** — Saunders Mac Lane, *Categories for the Working Mathematician*, 2nd ed. (Springer GTM 5, 1998). The definitive classical reference.

**Supplementary texts** — Emily Riehl, *Category Theory in Context* (Dover, 2016; freely available at math.jhu.edu/~eriehl/context.pdf); Tom Leinster, *Basic Category Theory* (Cambridge, 2014; arXiv:1612.09375); Saunders Mac Lane and Ieke Moerdijk, *Sheaves in Geometry and Logic* (Springer, 1992); Francis Borceux, *Handbook of Categorical Algebra* I–III (Cambridge, 1994); Masaki Kashiwara and Pierre Schapira, *Categories and Sheaves* (Springer, 2006); Charles Weibel, *An Introduction to Homological Algebra* (Cambridge, 1994); Joseph Rotman, *An Introduction to Homological Algebra*, 2nd ed. (Springer, 2009); Peter Hilton and Urs Stammbach, *A Course in Homological Algebra*, 2nd ed. (Springer, 1997); Paolo Aluffi, *Algebra: Chapter 0* (AMS, 2009).

**Online resources** — Christa Hawthorne's PMATH 945 notes from Jason Bell's Winter 2016 offering (cdchawthorne.com); the nLab (ncatlab.org), an open-access wiki for higher category theory and homotopy theory; the Stacks Project (stacks.math.columbia.edu), a comprehensive reference for algebraic geometry using categorical methods; MIT OpenCourseWare 18.905 (Algebraic Topology) lecture notes by Haynes Miller.

---

Category theory was born from a very concrete problem in algebraic topology. In the 1940s, Samuel Eilenberg and Saunders Mac Lane were studying natural equivalences between homology theories — isomorphisms that arose "without making any choice." To make precise what it means for an isomorphism to be *natural*, they had to introduce the notion of a *natural transformation* between *functors*. But to define functors, they needed *categories*. What began as scaffolding for a definition turned out to be one of the most revolutionary frameworks in twentieth-century mathematics.

The central insight of Eilenberg and Mac Lane's 1945 paper "General Theory of Natural Equivalences" is this: the distinction between a natural isomorphism and a mere isomorphism is mathematically meaningful and consequential. Every finite-dimensional vector space \(V\) is isomorphic to its dual \(V^*\) — but the isomorphism depends on a choice of basis and there is no canonical way to make it. By contrast, \(V\) is canonically isomorphic to its double dual \(V^{**}\) via the evaluation map \(v \mapsto \mathrm{ev}_v\). Category theory provides the language to express this distinction precisely.

Grothendieck's 1957 paper "Sur quelques points d'algèbre homologique" — universally known as the Tôhoku paper after the journal in which it appeared — transformed the subject. Grothendieck introduced abelian categories and the machinery of derived functors in sufficient generality to apply to sheaves of abelian groups on a topological space (or later a site), making cohomology theories in algebraic geometry rigorous. His systematic use of universal properties, exactness, and functorial constructions set the template for modern algebra and algebraic geometry.

Daniel Kan's 1958 paper "Adjoint functors" introduced what Mac Lane would later call "the most important concept" in category theory. Adjoint functors formalize the idea of "optimal solutions to universal problems" and encode the free-forgetful duality that appears throughout mathematics. Peter Freyd's and Barry Mitchell's embedding theorems in the early 1960s established that every small abelian category can be faithfully embedded into a module category, licensing diagram-chasing arguments in full generality. These developments — categories, functors, natural transformations, adjunctions, abelian categories, derived functors, the embedding theorem — constitute the core of this course.

---

# Part I: Category Theory

## Chapter 1: Categories

The notion of a category is at once extremely abstract and extremely concrete. It abstracts the observation that in every branch of mathematics, objects come equipped with a notion of "structure-preserving map": sets and functions, groups and homomorphisms, topological spaces and continuous maps, vector spaces and linear transformations. A category is simply a collection of objects together with a collection of morphisms between them, subject to the rule that morphisms can be composed and that every object has an identity morphism. The power of this abstraction is not that it is complicated, but that it is comprehensive: once a construction or theorem is formulated categorically, it applies simultaneously to all branches of mathematics.

### 1.1 Set-Theoretic Foundations: Classes and Universes

Before defining categories, we must address a foundational subtlety. The collection of all sets is not itself a set — if it were, one could construct the Russell set \(\{x : x \notin x\}\), a contradiction. Similarly, the "category of all sets" requires us to speak of a collection of all sets as if it were a single object. This forces a choice of foundational framework.

The most flexible approach, favored by Grothendieck, is the theory of *universes*. A **Grothendieck universe** is a set \(\mathcal{U}\) satisfying: (i) if \(x \in \mathcal{U}\) and \(y \in x\) then \(y \in \mathcal{U}\); (ii) if \(x \in \mathcal{U}\) then \(\mathcal{P}(x) \in \mathcal{U}\); (iii) if \(I \in \mathcal{U}\) and \(\{x_i\}_{i \in I}\) is a family with each \(x_i \in \mathcal{U}\), then \(\bigcup_i x_i \in \mathcal{U}\); and (iv) \(\mathbb{N} \in \mathcal{U}\). The Axiom of Universes (an extension of ZFC) asserts that every set belongs to some universe. We then declare a set to be **small** if it is an element of \(\mathcal{U}\), and **large** otherwise. A category whose objects and morphisms all lie in \(\mathcal{U}\) is called **small**; one whose objects form a proper class (not a set in \(\mathcal{U}\)) is **large**.

A more elementary approach is von Neumann–Bernays–Gödel (NBG) set theory, which admits proper classes — collections too large to be sets — as first-class citizens. One can then say: a large category is one whose objects form a proper class.

For this course, we adopt the practical working mathematician's stance: we freely speak of "the category of all groups" and "the category of all sets" without worrying about foundational paradoxes, implicitly assuming that a suitable universe has been fixed. We will be explicit about set-theoretic size when it matters — primarily in the statements of adjoint functor theorems and in the definition of limits and colimits.

<div class="definition">
<strong>Definition 1.1 (Small, Large, Locally Small).</strong> Fix a Grothendieck universe \(\mathcal{U}\). A category \(\mathcal{C}\) is called:
<ul>
<li><em>Small</em> if both \(\mathrm{Ob}(\mathcal{C})\) and \(\bigsqcup_{A,B \in \mathrm{Ob}(\mathcal{C})} \mathrm{Hom}_\mathcal{C}(A, B)\) are elements of \(\mathcal{U}\).</li>
<li><em>Locally small</em> if \(\mathrm{Hom}_\mathcal{C}(A, B)\) is a set (element of \(\mathcal{U}\)) for every pair of objects \(A, B \in \mathrm{Ob}(\mathcal{C})\).</li>
<li><em>Large</em> if it is not small.</li>
</ul>
</div>

Most naturally occurring categories — **Set**, **Grp**, **Top**, **R-Mod** — are large but locally small. Small categories arise as indexing categories for diagrams (e.g., the category with two objects and one non-identity arrow between them, used to define morphisms as diagrams). The distinction matters in the context of the Yoneda lemma and limit-existence theorems, where local smallness is typically required.

### 1.2 Definition of a Category

With foundations in hand, we can give the central definition.

<div class="definition">
<strong>Definition 1.2 (Category).</strong> A <em>category</em> \(\mathcal{C}\) consists of:
<ol>
<li>A class \(\mathrm{Ob}(\mathcal{C})\) of <em>objects</em>.</li>
<li>For each pair of objects \(A, B \in \mathrm{Ob}(\mathcal{C})\), a set \(\mathrm{Hom}_\mathcal{C}(A, B)\) of <em>morphisms from \(A\) to \(B\)</em>. We write \(f : A \to B\) to mean \(f \in \mathrm{Hom}_\mathcal{C}(A, B)\).</li>
<li>For each triple of objects \(A, B, C \in \mathrm{Ob}(\mathcal{C})\), a <em>composition map</em>

\[
\circ : \mathrm{Hom}_\mathcal{C}(B, C) \times \mathrm{Hom}_\mathcal{C}(A, B) \to \mathrm{Hom}_\mathcal{C}(A, C), \quad (g, f) \mapsto g \circ f,
\]
satisfying <em>associativity</em>: \(h \circ (g \circ f) = (h \circ g) \circ f\) for all composable \(f, g, h\).</li>
<li>For each object \(A \in \mathrm{Ob}(\mathcal{C})\), an <em>identity morphism</em> \(\mathrm{id}_A \in \mathrm{Hom}_\mathcal{C}(A, A)\) satisfying \(f \circ \mathrm{id}_A = f\) and \(\mathrm{id}_B \circ f = f\) for all \(f : A \to B\).</li>
</ol>
</div>

The hom-sets \(\mathrm{Hom}_\mathcal{C}(A, B)\) are required to be pairwise disjoint: each morphism has a unique source and a unique target. The identity morphism is unique: if \(e : A \to A\) satisfies \(e \circ f = f\) for all \(f : B \to A\), then \(e = e \circ \mathrm{id}_A = \mathrm{id}_A\).

### 1.3 Examples of Categories

The following examples illustrate the range of the definition. In each case the reader should verify that composition is associative and that identity morphisms exist.

<div class="example">
<strong>Example 1.3 (The Fundamental Examples).</strong>
<ol>
<li><strong>Set</strong>: objects are all sets, morphisms are functions, composition is function composition. This is the prototypical example and the one to which all "concrete" categories reduce via forgetful functors.</li>
<li><strong>Grp</strong>: objects are groups, morphisms are group homomorphisms.</li>
<li><strong>Ab</strong>: objects are abelian groups, morphisms are group homomorphisms. This is a full subcategory of <strong>Grp</strong>.</li>
<li><strong>Ring</strong>: objects are (unital) rings, morphisms are unital ring homomorphisms.</li>
<li><strong>CRing</strong>: objects are commutative unital rings, morphisms are unital ring homomorphisms. A full subcategory of <strong>Ring</strong>.</li>
<li><strong>Top</strong>: objects are topological spaces, morphisms are continuous maps.</li>
<li><strong>Haus</strong>: objects are Hausdorff spaces, morphisms are continuous maps. A full subcategory of <strong>Top</strong>.</li>
<li><strong>Vect</strong>\(_k\): objects are vector spaces over a fixed field \(k\), morphisms are \(k\)-linear maps.</li>
<li><em>R</em><strong>-Mod</strong>: for a ring \(R\), objects are left \(R\)-modules, morphisms are \(R\)-module homomorphisms. When \(R = \mathbb{Z}\), this recovers <strong>Ab</strong>.</li>
<li><strong>Top</strong>\(_*\): objects are <em>pointed</em> topological spaces \((X, x_0)\), morphisms are continuous maps preserving the basepoint. The fundamental group is a functor from this category to <strong>Grp</strong>.</li>
</ol>
</div>

<div class="example">
<strong>Example 1.4 (Poset Categories).</strong> Every partially ordered set \((P, \leq)\) defines a <em>small</em> category \(\mathbf{P}\) by: \(\mathrm{Ob}(\mathbf{P}) = P\), and

\[
\mathrm{Hom}_{\mathbf{P}}(x, y) = \begin{cases} \{(x,y)\} & \text{if } x \leq y, \\ \emptyset & \text{otherwise.} \end{cases}
\]
Composition exists because \(\leq\) is transitive, and identity morphisms exist because \(\leq\) is reflexive. In a poset category, there is <em>at most one</em> morphism between any two objects, so all the structure lies in the existence or non-existence of morphisms rather than in the morphisms themselves.

Products in the poset category are greatest lower bounds (meets) and coproducts are least upper bounds (joins). This observation connects order theory to category theory and will recur throughout the course when we define limits and colimits.
</div>

<div class="example">
<strong>Example 1.5 (Monoids as One-Object Categories).</strong> A <em>monoid</em> is a set \(M\) with an associative binary operation and a two-sided identity. A monoid is precisely a category with a single object \(*\): the morphisms \(\mathrm{Hom}(*, *) = M\), composition is the monoid operation, and the identity morphism is the identity element of \(M\).

This observation makes the dictionary between category theory and monoid theory explicit. A functor from a one-object category \(M\) to <strong>Set</strong> is precisely a (left) \(M\)-set — a set equipped with a left action of \(M\). A functor from \(M\) to <strong>Vect</strong>\(_k\) is a representation of the monoid \(M\) over \(k\). The theory of group actions and representation theory are instances of the theory of functors from one-object categories.
</div>

<div class="example">
<strong>Example 1.6 (Groupoids).</strong> A <em>groupoid</em> is a category in which every morphism is an isomorphism (has a two-sided inverse). Groups are groupoids with one object. More interestingly, the <em>fundamental groupoid</em> \(\Pi_1(X)\) of a topological space \(X\) is the category whose objects are points of \(X\) and whose morphisms from \(x\) to \(y\) are homotopy classes (relative to endpoints) of paths from \(x\) to \(y\). Composition is path concatenation. When \(X\) is path-connected, the fundamental groupoid is equivalent to the one-object groupoid determined by the fundamental group \(\pi_1(X, x_0)\) for any basepoint \(x_0\).

Groupoids arise naturally in the study of symmetries with multiple "base points" — for example, in the theory of covering spaces, where deck transformations form a groupoid, or in stack theory, where symmetry groups of different objects may vary. The shift from groups to groupoids is part of the broader categorical perspective: instead of fixing a base point, one works with all base points simultaneously.
</div>

<div class="example">
<strong>Example 1.7 (The Category of Matrices).</strong> Fix a field \(k\). Define a category \(\mathbf{Mat}_k\) by: \(\mathrm{Ob}(\mathbf{Mat}_k) = \mathbb{N} = \{0, 1, 2, \ldots\}\), and \(\mathrm{Hom}(m, n)\) is the set of \(n \times m\) matrices over \(k\). Composition is matrix multiplication. This category is equivalent to <strong>fdVect</strong>\(_k\) (finite-dimensional \(k\)-vector spaces with linear maps): send the object \(n\) to the vector space \(k^n\). This equivalence makes precise the familiar identification of linear maps with matrices once bases are chosen.
</div>

<div class="example">
<strong>Example 1.8 (The Homotopy Category).</strong> Let \(\mathbf{hTop}\) be the category whose objects are topological spaces and whose morphisms are homotopy classes of continuous maps. This is a legitimate category because homotopy is an equivalence relation compatible with composition. Crucially, \(\mathbf{hTop}\) is not a "concrete" category in a natural sense — morphisms are equivalence classes of maps, not maps themselves. Many invariants of topological spaces (homology groups, the fundamental group) factor through \(\mathbf{hTop}\): homotopy equivalent spaces have isomorphic homology groups.
</div>

<div class="remark">
<strong>Remark 1.9 (Small Categories as Diagrams).</strong> Several important small categories serve as "diagram shapes." The <em>discrete category</em> \(\mathbf{n}\) has objects \(\{0, 1, \ldots, n-1\}\) and only identity morphisms; a functor \(\mathbf{n} \to \mathcal{C}\) is simply a choice of \(n\) objects in \(\mathcal{C}\). The <em>arrow category</em> \(\mathbf{2} = (0 \to 1)\) has two objects and one non-identity morphism; a functor \(\mathbf{2} \to \mathcal{C}\) is a single morphism in \(\mathcal{C}\). The category \(\mathbf{3} = (0 \to 1 \to 2)\) encodes composable pairs of morphisms. These diagram shapes will serve as the "indexing categories" for limits and colimits in Chapter 7.
</div>

### 1.4 Monomorphisms, Epimorphisms, and Isomorphisms

In each of our concrete categories, the "injective" and "surjective" morphisms play a special role. Category theory captures these notions intrinsically, in terms of cancellation properties rather than elements.

<div class="definition">
<strong>Definition 1.10 (Monomorphism, Epimorphism, Isomorphism).</strong> Let \(\mathcal{C}\) be a category and \(f : A \to B\) a morphism.
<ul>
<li>\(f\) is a <em>monomorphism</em> (or <em>mono</em>) if for all objects \(X\) and all \(g, h : X \to A\), \(f \circ g = f \circ h\) implies \(g = h\). We write \(f : A \hookrightarrow B\).</li>
<li>\(f\) is an <em>epimorphism</em> (or <em>epi</em>) if for all objects \(Y\) and all \(g, h : B \to Y\), \(g \circ f = h \circ f\) implies \(g = h\). We write \(f : A \twoheadrightarrow B\).</li>
<li>\(f\) is an <em>isomorphism</em> if there exists \(g : B \to A\) with \(g \circ f = \mathrm{id}_A\) and \(f \circ g = \mathrm{id}_B\). We write \(f : A \xrightarrow{\sim} B\).</li>
<li>\(f\) is a <em>split monomorphism</em> (or <em>section</em>) if there exists \(r : B \to A\) with \(r \circ f = \mathrm{id}_A\). We write \(r\) is a <em>retraction</em> of \(f\).</li>
</ul>
</div>

The categorical definitions match the set-theoretic ones in familiar categories.

<div class="proposition">
<strong>Proposition 1.11 (Monomorphisms and Epimorphisms in Concrete Categories).</strong>
<ol>
<li>In <strong>Set</strong>, <strong>Grp</strong>, <strong>Ab</strong>, and <em>R</em><strong>-Mod</strong>: monomorphisms are exactly injective homomorphisms, and isomorphisms are exactly bijective homomorphisms.</li>
<li>In <strong>Set</strong>: epimorphisms are exactly surjective functions.</li>
<li>In <strong>Grp</strong> and <strong>Ab</strong>: epimorphisms are exactly surjective homomorphisms.</li>
</ol>
</div>

The situation for epimorphisms is more subtle in other categories, as the next example shows.

<div class="example">
<strong>Example 1.12 (The Inclusion \(\mathbb{Z} \hookrightarrow \mathbb{Q}\) is an Epimorphism in <strong>Ring</strong>).</strong> Let \(i : \mathbb{Z} \to \mathbb{Q}\) be the natural inclusion. This is not surjective — \(1/2 \in \mathbb{Q}\) has no preimage. Nevertheless, \(i\) is an epimorphism in the category of (unital) rings.

<em>Proof.</em> Suppose \(f, g : \mathbb{Q} \to R\) are ring homomorphisms with \(f \circ i = g \circ i\), i.e., \(f(n) = g(n)\) for all \(n \in \mathbb{Z}\). Since \(f\) and \(g\) are ring homomorphisms, \(f(1) = g(1) = 1_R\). For any \(p/q \in \mathbb{Q}\) with \(q \neq 0\), we have \(f(p) = g(p)\) and \(f(1/q) \cdot f(q) = f(1) = 1_R\), so \(f(1/q) = f(q)^{-1}\). Similarly \(g(1/q) = g(q)^{-1} = f(q)^{-1}\). Hence \(f(p/q) = f(p) \cdot f(1/q) = g(p) \cdot g(1/q) = g(p/q)\). So \(f = g\). \(\square\)

This example shows that in the category <strong>Ring</strong>, the notions of "epimorphism" and "surjection" genuinely differ. The inclusion \(\mathbb{Z} \hookrightarrow \mathbb{Q}\) is an epimorphism because any ring map out of \(\mathbb{Q}\) is determined by its values on \(\mathbb{Z}\). More generally, any localization map \(R \to S^{-1}R\) is an epimorphism in <strong>Ring</strong>.
</div>

<div class="remark">
<strong>Remark 1.13 (Isomorphisms vs. Bijective Morphisms).</strong> In some categories, a morphism can be both a monomorphism and an epimorphism without being an isomorphism. The inclusion \(\mathbb{Z} \hookrightarrow \mathbb{Q}\) is such an example: it is a monomorphism (injective) and an epimorphism (shown above), but it is not an isomorphism. This pathology cannot happen in <strong>Set</strong> (where bijections are isomorphisms), in <strong>Grp</strong>, or in <strong>Ab</strong>, but it can happen in <strong>Ring</strong>, <strong>Top</strong>, and many other categories.

A morphism that is both a monomorphism and an epimorphism is sometimes called a <em>bimorphism</em>. In an <em>abelian category</em> (Chapter 9), every bimorphism is an isomorphism — this is one of the key properties that makes abelian categories so useful.
</div>

### 1.5 Subcategories and the Historical Origins of Category Theory

<div class="definition">
<strong>Definition 1.14 (Subcategory).</strong> A <em>subcategory</em> \(\mathcal{D}\) of \(\mathcal{C}\) consists of a sub-class of objects \(\mathrm{Ob}(\mathcal{D}) \subseteq \mathrm{Ob}(\mathcal{C})\) and sub-sets of morphisms \(\mathrm{Hom}_\mathcal{D}(A, B) \subseteq \mathrm{Hom}_\mathcal{C}(A, B)\) for each \(A, B \in \mathrm{Ob}(\mathcal{D})\), closed under composition and containing all identity morphisms of objects in \(\mathrm{Ob}(\mathcal{D})\).

\(\mathcal{D}\) is a <em>full subcategory</em> if \(\mathrm{Hom}_\mathcal{D}(A, B) = \mathrm{Hom}_\mathcal{C}(A, B)\) for all \(A, B \in \mathrm{Ob}(\mathcal{D})\): a full subcategory is determined entirely by its objects.

\(\mathcal{D}\) is a <em>wide</em> (or <em>lluf</em>) subcategory if \(\mathrm{Ob}(\mathcal{D}) = \mathrm{Ob}(\mathcal{C})\) but possibly with fewer morphisms.
</div>

<div class="example">
<strong>Example 1.15 (Subcategory Examples).</strong>
<ol>
<li><strong>Ab</strong> is a full subcategory of <strong>Grp</strong> (same morphisms, restricted to abelian groups).</li>
<li>Finite groups form a full subcategory of <strong>Grp</strong>.</li>
<li>The category of finitely generated \(R\)-modules is a full subcategory of <em>R</em><strong>-Mod</strong>.</li>
<li>The category of bijections in <strong>Set</strong> (all sets, only bijective maps) is a wide but not full subcategory of <strong>Set</strong>: it has the same objects but fewer morphisms.</li>
<li>The category <strong>hTop</strong>\(_*\) of pointed spaces with homotopy classes of basepoint-preserving maps is a subcategory of <strong>Top</strong>\(_*\).</li>
</ol>
</div>

The historical origins of category theory deserve a brief account, since the subject was deliberately constructed as a language for something else, not as an end in itself.

In the early 1940s, Samuel Eilenberg and Saunders Mac Lane were studying the algebraic invariants of topological spaces — specifically, the question of when two different constructions (two different homology theories, or two different cochain complexes) produce "the same" result. The standard notion of isomorphism was insufficient: two homology theories might be isomorphic for every space, but the isomorphisms might be defined by different, arbitrary choices (of triangulations, of basepoints, of representatives). Eilenberg and Mac Lane wanted to express the idea that two homology theories are isomorphic *functorially* — that the isomorphisms fit together coherently as the underlying space varies.

To make this precise, they had to define what it means for a construction to be "functorial" (vary naturally with the space), and then define what it means for two functors to be "naturally isomorphic." These definitions required the notions of functor and natural transformation. But to define functors, one needs categories: the domain and codomain of a functor. Thus categories were invented as the minimal vocabulary needed to express naturality.

The paper "General Theory of Natural Equivalences" (Transactions of the AMS, 1945) introduced all three concepts simultaneously: categories, functors, and natural transformations. Mac Lane later recalled that colleagues initially dismissed the theory as "general abstract nonsense" — a phrase that became a badge of honor in the field. Within fifteen years, through Grothendieck's work, category theory had become indispensable.

---

## Chapter 2: Functors

A functor is a map between categories that respects all the structure: it sends objects to objects, morphisms to morphisms, and preserves composition and identities. Functors are the morphisms of the "category of all categories" (which, like the category of all sets, requires some care to make precise). More importantly, functors are the vehicle through which mathematical structures in one area are related to structures in another.

### 2.1 Definition and Basic Examples

<div class="definition">
<strong>Definition 2.1 (Functor).</strong> Let \(\mathcal{C}\) and \(\mathcal{D}\) be categories. A <em>(covariant) functor</em> \(F : \mathcal{C} \to \mathcal{D}\) consists of:
<ol>
<li>A function \(F : \mathrm{Ob}(\mathcal{C}) \to \mathrm{Ob}(\mathcal{D})\).</li>
<li>For each pair \(A, B \in \mathrm{Ob}(\mathcal{C})\), a function \(F : \mathrm{Hom}_\mathcal{C}(A, B) \to \mathrm{Hom}_\mathcal{D}(F(A), F(B))\).</li>
</ol>
These must satisfy:
<ul>
<li><em>Preservation of composition</em>: \(F(g \circ f) = F(g) \circ F(f)\) for all composable \(f, g\).</li>
<li><em>Preservation of identities</em>: \(F(\mathrm{id}_A) = \mathrm{id}_{F(A)}\) for all \(A \in \mathrm{Ob}(\mathcal{C})\).</li>
</ul>
A <em>contravariant functor</em> \(G : \mathcal{C} \to \mathcal{D}\) is a (covariant) functor \(G : \mathcal{C}^{\mathrm{op}} \to \mathcal{D}\): it reverses the direction of morphisms, so \(G(f) : G(B) \to G(A)\) for \(f : A \to B\), and \(G(g \circ f) = G(f) \circ G(g)\).
</div>

The composition of functors is again a functor. The identity functor \(\mathrm{Id}_\mathcal{C} : \mathcal{C} \to \mathcal{C}\) sends every object and morphism to itself. With these, there is a category **Cat** whose objects are (small) categories and whose morphisms are functors.

<div class="example">
<strong>Example 2.2 (Forgetful Functors).</strong> The most pervasive examples are the <em>forgetful functors</em>, which "forget" some of the algebraic structure:
<ul>
<li>\(U : \mathbf{Grp} \to \mathbf{Set}\), sending a group \(G\) to its underlying set \(|G|\) and a homomorphism to the underlying function. This functor forgets the group structure.</li>
<li>\(U : \mathbf{Top} \to \mathbf{Set}\), sending a topological space to its underlying set and a continuous map to the underlying function.</li>
<li>\(U : R\text{-}\mathbf{Mod} \to \mathbf{Ab}\), sending an \(R\)-module to its underlying abelian group, forgetting the \(R\)-module structure.</li>
<li>\(U : \mathbf{Ring} \to \mathbf{Ab}\), sending a ring to its underlying additive group.</li>
</ul>
Forgetful functors are ubiquitous and, crucially, they always have left adjoints — the "free" constructions. This free-forgetful adjunction is the prototypical adjunction and will be developed in Chapter 5.
</div>

<div class="example">
<strong>Example 2.3 (Free Functors).</strong> Dual to the forgetful functors are the <em>free functors</em>:
<ul>
<li>\(F : \mathbf{Set} \to \mathbf{Grp}\), sending a set \(S\) to the free group \(F(S)\) on generators \(S\), and a function \(f : S \to T\) to the unique group homomorphism \(F(S) \to F(T)\) extending \(f\).</li>
<li>\(F : \mathbf{Set} \to \mathbf{Vect}_k\), sending \(S\) to the free \(k\)-vector space \(k^{(S)}\) with basis \(S\).</li>
<li>\(F : \mathbf{Set} \to R\text{-}\mathbf{Mod}\), sending \(S\) to the free \(R\)-module \(R^{(S)} = \bigoplus_{s \in S} R\).</li>
</ul>
</div>

<div class="example">
<strong>Example 2.4 (Hom Functors).</strong> Fix an object \(A \in \mathrm{Ob}(\mathcal{C})\). The <em>covariant Hom functor</em> \(h^A = \mathrm{Hom}_\mathcal{C}(A, -) : \mathcal{C} \to \mathbf{Set}\) sends each object \(B\) to the hom-set \(\mathrm{Hom}_\mathcal{C}(A, B)\), and each morphism \(f : B \to B'\) to the post-composition function \(f_* = \mathrm{Hom}(A, f) : g \mapsto f \circ g\).

The <em>contravariant Hom functor</em> \(h_A = \mathrm{Hom}_\mathcal{C}(-, A) : \mathcal{C}^{\mathrm{op}} \to \mathbf{Set}\) sends each object \(B\) to \(\mathrm{Hom}_\mathcal{C}(B, A)\), and each morphism \(f : B \to B'\) to the pre-composition function \(f^* = \mathrm{Hom}(f, A) : g \mapsto g \circ f\).

In <em>R</em><strong>-Mod</strong>, these become \(\mathrm{Hom}_R(M, -)\) and \(\mathrm{Hom}_R(-, N)\), which are respectively a covariant and a contravariant functor landing in <strong>Ab</strong> (or even in <em>R</em><strong>-Mod</strong> if \(R\) is commutative). Their failure to be exact is the foundational observation of homological algebra.
</div>

<div class="example">
<strong>Example 2.5 (Tensor Product).</strong> Fix an \(R\)-module \(M\). The functor \(M \otimes_R - : R\text{-}\mathbf{Mod} \to \mathbf{Ab}\) (or to \(R\text{-}\mathbf{Mod}\) when \(R\) is commutative) sends \(N\) to \(M \otimes_R N\) and a homomorphism \(f : N \to N'\) to \(\mathrm{id}_M \otimes f : M \otimes_R N \to M \otimes_R N'\). This functor is right exact (it is a left adjoint to \(\mathrm{Hom}_R(M, -)\)) but not in general exact, and the failure of exactness is measured by the derived functor \(\mathrm{Tor}\).
</div>

<div class="example">
<strong>Example 2.6 (Homology and the Fundamental Group).</strong> For each \(n \geq 0\), the \(n\)-th singular homology \(H_n : \mathbf{Top} \to \mathbf{Ab}\) is a functor: a continuous map \(f : X \to Y\) induces a group homomorphism \(f_* : H_n(X) \to H_n(Y)\), and this assignment respects composition and identities. The fundamental group \(\pi_1 : \mathbf{Top}_* \to \mathbf{Grp}\) is another functor: a basepoint-preserving continuous map \(f : (X, x_0) \to (Y, y_0)\) induces \(f_* : \pi_1(X, x_0) \to \pi_1(Y, y_0)\). The Hurewicz map \(\pi_1(X, x_0) \to H_1(X)\) (abelianization of the fundamental group) is a natural transformation — a first glimpse of the naturality concept developed in Chapter 3.
</div>

<div class="example">
<strong>Example 2.7 (Spec: the Spectrum Functor).</strong> One of the most important functors in algebraic geometry is the contravariant <em>Spec</em> functor from commutative rings to topological spaces (in fact to locally ringed spaces or to schemes). For a commutative ring \(R\), \(\mathrm{Spec}(R)\) is the set of prime ideals of \(R\), equipped with the Zariski topology: the closed sets are \(V(I) = \{\mathfrak{p} \in \mathrm{Spec}(R) : I \subseteq \mathfrak{p}\}\) for ideals \(I\). A ring homomorphism \(f : R \to S\) induces a continuous map \(\mathrm{Spec}(f) : \mathrm{Spec}(S) \to \mathrm{Spec}(R)\) by \(\mathfrak{p} \mapsto f^{-1}(\mathfrak{p})\).

The Spec functor realizes the anti-equivalence between finitely generated reduced \(\mathbb{C}\)-algebras and affine algebraic varieties over \(\mathbb{C}\): this is the content of Hilbert's Nullstellensatz, recast categorically.
</div>

<div class="remark">
<strong>Remark 2.8 (The Power Set Functor).</strong> The power set \(\mathcal{P}(X)\) gives rise to both a covariant and a contravariant functor \(\mathbf{Set} \to \mathbf{Set}\). The covariant version sends \(f : X \to Y\) to the direct image \(f_* : \mathcal{P}(X) \to \mathcal{P}(Y)\), \(A \mapsto f(A)\). The contravariant version sends \(f\) to the inverse image \(f^* : \mathcal{P}(Y) \to \mathcal{P}(X)\), \(B \mapsto f^{-1}(B)\). Crucially, \(f^{-1}\) commutes with all set operations (unions, intersections, complements), while \(f_*\) only commutes with unions. This asymmetry is the set-theoretic shadow of the distinction between left and right exactness in homological algebra.
</div>

### 2.2 Faithful, Full, and Essentially Surjective Functors

Not all functors are created equal. The following properties describe how well a functor "remembers" the structure of its source category.

<div class="definition">
<strong>Definition 2.9 (Faithful, Full, Essentially Surjective).</strong> A functor \(F : \mathcal{C} \to \mathcal{D}\) is:
<ul>
<li><em>Faithful</em> if for all \(A, B \in \mathrm{Ob}(\mathcal{C})\), the function \(F_{A,B} : \mathrm{Hom}_\mathcal{C}(A, B) \to \mathrm{Hom}_\mathcal{D}(FA, FB)\) is injective.</li>
<li><em>Full</em> if each \(F_{A,B}\) is surjective: every morphism \(FA \to FB\) in \(\mathcal{D}\) is of the form \(F(f)\) for some \(f : A \to B\) in \(\mathcal{C}\).</li>
<li><em>Fully faithful</em> if each \(F_{A,B}\) is bijective.</li>
<li><em>Essentially surjective</em> if every object \(D \in \mathrm{Ob}(\mathcal{D})\) is isomorphic to \(F(C)\) for some \(C \in \mathrm{Ob}(\mathcal{C})\).</li>
</ul>
</div>

Forgetful functors are typically faithful but not full. The forgetful functor \(\mathbf{Grp} \to \mathbf{Set}\) is faithful (an injective/surjective function between groups determines whether the homomorphism is a mono/epi), but it is not full: there are functions between group sets that are not group homomorphisms.

A <em>concrete category</em> is a category \(\mathcal{C}\) equipped with a faithful functor \(U : \mathcal{C} \to \mathbf{Set}\) (the "underlying set" functor). Most categories of mathematical structures — groups, rings, topological spaces, modules — are concrete in this sense. The usefulness of the concept is precisely that faithfulness means the functor "separates morphisms": \(f \neq g\) in \(\mathcal{C}\) implies \(U(f) \neq U(g)\).

### 2.3 Equivalence of Categories

Isomorphism of categories — a functor \(F : \mathcal{C} \to \mathcal{D}\) with a strict inverse \(G : \mathcal{D} \to \mathcal{C}\) satisfying \(GF = \mathrm{Id}_\mathcal{C}\) and \(FG = \mathrm{Id}_\mathcal{D}\) on the nose — is too rigid to be useful. In practice, categories are "the same" when they are *equivalent*, meaning there is a pair of functors that compose to something *isomorphic* to the identity, not necessarily equal to it.

<div class="definition">
<strong>Definition 2.10 (Equivalence of Categories).</strong> Functors \(F : \mathcal{C} \to \mathcal{D}\) and \(G : \mathcal{D} \to \mathcal{C}\) form an <em>equivalence of categories</em> if there are natural isomorphisms \(\eta : \mathrm{Id}_\mathcal{C} \xrightarrow{\sim} GF\) and \(\varepsilon : FG \xrightarrow{\sim} \mathrm{Id}_\mathcal{D}\). We say \(\mathcal{C}\) and \(\mathcal{D}\) are <em>equivalent</em>, written \(\mathcal{C} \simeq \mathcal{D}\).

A single functor \(F : \mathcal{C} \to \mathcal{D}\) is an equivalence if and only if it is <strong>full</strong>, <strong>faithful</strong>, and <strong>essentially surjective</strong>.
</div>

The equivalence condition is strictly weaker than isomorphism. The distinction is analogous to the difference between isomorphism and homeomorphism of topological spaces, where homeomorphism (existence of a continuous bijection with continuous inverse) is the correct notion, not set-theoretic bijection alone.

<div class="example">
<strong>Example 2.11 (Finite-Dimensional Vector Spaces and Matrices).</strong> The functor \(k^{(-)} : \mathbf{Mat}_k \to \mathbf{fdVect}_k\) sending the natural number \(n\) to \(k^n\) is an equivalence of categories. Every finite-dimensional vector space over \(k\) is isomorphic to \(k^n\) for some \(n\) (essentially surjective), and linear maps \(k^m \to k^n\) correspond bijectively to \(n \times m\) matrices (fully faithful). The quasi-inverse sends a finite-dimensional space to its dimension. This is why "linear algebra over \(k\)" and "matrix algebra over \(k\)" contain exactly the same information.
</div>

<div class="example">
<strong>Example 2.12 (Gelfand Duality).</strong> Gelfand's theorem (1943) establishes an anti-equivalence (equivalence with one side reversed) between the category of compact Hausdorff spaces with continuous maps and the category of commutative unital C*-algebras with *-homomorphisms. The functor sends \(X\) to the algebra \(C(X)\) of continuous \(\mathbb{C}\)-valued functions, and sends a continuous map \(f : X \to Y\) to the algebra map \(f^* : C(Y) \to C(X)\) given by pre-composition with \(f\). The quasi-inverse sends an algebra \(A\) to its maximal ideal space (the Gelfand spectrum) \(\hat{A}\).

This is not a curiosity: it is the starting point for noncommutative geometry (Connes), where one studies "noncommutative spaces" by studying noncommutative C*-algebras, using the Gelfand correspondence as motivation.
</div>

<div class="remark">
<strong>Remark 2.13 (The Correct Notion of Sameness for Categories).</strong> The reason equivalence rather than isomorphism is the correct notion of sameness for categories runs deep. Categories form a 2-category <strong>Cat</strong> (to be discussed in §3.3): its objects are categories, its morphisms are functors, and its 2-morphisms are natural transformations. In a 2-category, the correct notion of "sameness" for objects is equivalence (existence of morphisms that compose to something 2-isomorphic to the identity), not isomorphism (existence of morphisms that compose to exactly the identity). Equivalence respects all categorical structure and is preserved under all categorical constructions.
</div>

---

## Chapter 3: Natural Transformations

Natural transformations are the reason categories were invented. They encode the idea that a "canonical" or "natural" construction is one that behaves coherently as the input varies: not just that there is an isomorphism \(A \cong B\) for each object in a family, but that these isomorphisms are compatible with all morphisms in the family. This is the precise content of naturality.

### 3.1 Definition and Examples

<div class="definition">
<strong>Definition 3.1 (Natural Transformation).</strong> Let \(F, G : \mathcal{C} \to \mathcal{D}\) be functors. A <em>natural transformation</em> \(\alpha : F \Rightarrow G\) consists of, for each object \(A \in \mathrm{Ob}(\mathcal{C})\), a morphism \(\alpha_A : F(A) \to G(A)\) in \(\mathcal{D}\) (called the <em>component</em> of \(\alpha\) at \(A\)), such that for every morphism \(f : A \to B\) in \(\mathcal{C}\), the following diagram commutes:

\[
\begin{array}{ccc}
F(A) & \xrightarrow{F(f)} & F(B) \\
\downarrow{\scriptstyle \alpha_A} & & \downarrow{\scriptstyle \alpha_B} \\
G(A) & \xrightarrow{G(f)} & G(B)
\end{array}
\]
i.e., \(\alpha_B \circ F(f) = G(f) \circ \alpha_A\). This square is called the <em>naturality square</em> of \(\alpha\) at \(f\).
</div>

The naturality condition says that the components of \(\alpha\) "intertwine" \(F\) and \(G\): one can either first apply \(F\) and then the component \(\alpha\), or first apply the component \(\alpha\) and then \(G\), and get the same result.

<div class="example">
<strong>Example 3.2 (The Double Dual).</strong> Let \(\mathcal{C} = \mathbf{fdVect}_k\) be the category of finite-dimensional \(k\)-vector spaces. Define two functors \(\mathcal{C} \to \mathcal{C}\): the identity functor \(\mathrm{Id}\) and the double dual functor \((-)^{**} : V \mapsto V^{**} = \mathrm{Hom}_k(\mathrm{Hom}_k(V, k), k)\). For each linear map \(T : V \to W\), the double dual is \(T^{**} : V^{**} \to W^{**}\) defined by \(T^{**}(\phi) = \phi \circ T^*\) where \(T^*(g) = g \circ T\).

Define \(\eta_V : V \to V^{**}\) by \(\eta_V(v) = \mathrm{ev}_v\) (the evaluation map: \(\mathrm{ev}_v(\phi) = \phi(v)\) for \(\phi \in V^*\)). Then \(\eta : \mathrm{Id} \Rightarrow (-)^{**}\) is a natural transformation: for any \(T : V \to W\), the naturality square

\[
\begin{array}{ccc}
V & \xrightarrow{T} & W \\
\downarrow{\scriptstyle \eta_V} & & \downarrow{\scriptstyle \eta_W} \\
V^{\ast\ast} & \xrightarrow{T^{\ast\ast}} & W^{\ast\ast}
\end{array}
\]
commutes. Indeed: \(\eta_W(T(v))(\phi) = \phi(T(v))\) and \(T^{**}(\eta_V(v))(\phi) = \eta_V(v)(T^*(\phi)) = (T^*\phi)(v) = \phi(T(v))\). So both paths give the same result.

In contrast, \(V \cong V^*\) for finite-dimensional \(V\), but there is no natural transformation \(\mathrm{Id} \Rightarrow (-)^*\): any such transformation would require, for each \(V\), an isomorphism \(V \to V^*\), and these cannot be chosen coherently without a choice of inner product or basis.
</div>

<div class="example">
<strong>Example 3.3 (The Determinant).</strong> For each commutative ring \(R\), the general linear group \(\mathrm{GL}_n(R)\) is the group of invertible \(n \times n\) matrices over \(R\), and the multiplicative group of units \(R^\times\) is the abelian group of invertible elements. The determinant \(\det_R : \mathrm{GL}_n(R) \to R^\times\) is a group homomorphism. As \(R\) varies over commutative rings, this defines a natural transformation \(\det : \mathrm{GL}_n \Rightarrow (-)^\times\) between functors \(\mathbf{CRing} \to \mathbf{Grp}\). The naturality square asserts that for any ring homomorphism \(f : R \to S\), one has \(\det_S \circ \mathrm{GL}_n(f) = f^\times \circ \det_R\): the determinant of the matrix obtained by applying \(f\) entrywise equals \(f\) applied to the determinant over \(R\). This is because the determinant formula is a polynomial expression in the matrix entries.
</div>

<div class="example">
<strong>Example 3.4 (Abelianization).</strong> For a group \(G\), let \(G^{\mathrm{ab}} = G/[G, G]\) be its abelianization. The quotient map \(\pi_G : G \to G^{\mathrm{ab}}\) is natural: for any group homomorphism \(f : G \to H\), the induced map \(f^{\mathrm{ab}} : G^{\mathrm{ab}} \to H^{\mathrm{ab}}\) satisfies \(f^{\mathrm{ab}} \circ \pi_G = \pi_H \circ f\). In categorical terms, abelianization is a functor \((-)^{\mathrm{ab}} : \mathbf{Grp} \to \mathbf{Ab}\) and \(\pi\) is a natural transformation from the identity functor on \(\mathbf{Grp}\) (composed with the inclusion \(\mathbf{Ab} \hookrightarrow \mathbf{Grp}\)) to the abelianization functor. This will be reinterpreted as the counit of an adjunction in Chapter 5.
</div>

<div class="example">
<strong>Example 3.5 (The Hurewicz Map).</strong> For a pointed topological space \((X, x_0)\), the Hurewicz homomorphism \(\rho_n : \pi_n(X, x_0) \to H_n(X; \mathbb{Z})\) sends a homotopy class \([f] \in \pi_n(X, x_0)\) (represented by a map \(f : S^n \to X\) sending the basepoint of \(S^n\) to \(x_0\)) to the image \(f_*(\iota_n)\) of the fundamental class \(\iota_n \in H_n(S^n; \mathbb{Z}) \cong \mathbb{Z}\). This defines a natural transformation \(\rho_n : \pi_n \Rightarrow H_n\) between functors \(\mathbf{Top}_* \to \mathbf{Ab}\). The Hurewicz theorem states that if \(X\) is \((n-1)\)-connected (i.e., \(\pi_k(X) = 0\) for \(k < n\)) and \(n \geq 2\), then \(\rho_n\) is an isomorphism. This is a deep theorem connecting the homotopy-theoretic and homological invariants of a space.
</div>

### 3.2 Natural Isomorphisms

<div class="definition">
<strong>Definition 3.6 (Natural Isomorphism).</strong> A natural transformation \(\alpha : F \Rightarrow G\) is a <em>natural isomorphism</em> if every component \(\alpha_A : F(A) \to G(A)\) is an isomorphism in \(\mathcal{D}\). Equivalently, \(\alpha\) has a two-sided inverse as a natural transformation: there exists \(\alpha^{-1} : G \Rightarrow F\) with \(\alpha^{-1} \circ \alpha = \mathrm{id}_F\) and \(\alpha \circ \alpha^{-1} = \mathrm{id}_G\). When a natural isomorphism exists between \(F\) and \(G\), we write \(F \cong G\) and say \(F\) and \(G\) are <em>naturally isomorphic</em>.
</div>

Natural isomorphisms are the correct notion of "sameness" for functors. The double-dual example (Example 3.2) establishes that \(\mathrm{Id} \cong (-)^{**}\) as functors \(\mathbf{fdVect}_k \to \mathbf{fdVect}_k\). The single dual \((-)^*\) is not naturally isomorphic to the identity, even though \(V \cong V^*\) for each individual \(V\): the pathology is exactly the failure of naturality.

<div class="remark">
<strong>Remark 3.7 (Naturality as a Litmus Test).</strong> Naturality is a powerful diagnostic tool. When two objects are isomorphic in multiple ways and one wishes to select the "right" isomorphism, naturality often singles out the canonical choice. For example:
<ul>
<li>In linear algebra, the "natural" inner product on the tensor product \(V \otimes W\) is determined by the bilinear form on \(V \times W\), and this is natural in \(V\) and \(W\).</li>
<li>In commutative algebra, the natural map \(M \otimes_R R \to M\) (sending \(m \otimes r\) to \(rm\)) is a natural isomorphism of functors, while a map \(R \otimes_R M \to M\) requires a commutativity convention.</li>
<li>In algebraic topology, the Poincaré duality isomorphism \(H^k(M) \cong H_{n-k}(M)\) for a closed orientable \(n\)-manifold \(M\) is natural in the sense of maps of manifolds — and this naturality is precisely what makes the duality theorem useful.</li>
</ul>
</div>

### 3.3 Functor Categories and Composition of Natural Transformations

Given two categories \(\mathcal{C}\) and \(\mathcal{D}\), the collection of all functors from \(\mathcal{C}\) to \(\mathcal{D}\) forms itself a category, with natural transformations as morphisms.

<div class="definition">
<strong>Definition 3.8 (Functor Category).</strong> The <em>functor category</em> \([\mathcal{C}, \mathcal{D}]\) (also written \(\mathcal{D}^\mathcal{C}\) or \(\mathrm{Fun}(\mathcal{C}, \mathcal{D})\)) has:
<ul>
<li>Objects: functors \(F : \mathcal{C} \to \mathcal{D}\).</li>
<li>Morphisms: natural transformations \(\alpha : F \Rightarrow G\).</li>
<li>Composition: <em>vertical composition</em> of natural transformations \(\alpha : F \Rightarrow G\) and \(\beta : G \Rightarrow H\) is the natural transformation \(\beta \circ \alpha : F \Rightarrow H\) with components \((\beta \circ \alpha)_A = \beta_A \circ \alpha_A\).</li>
<li>Identity: the identity natural transformation \(\mathrm{id}_F : F \Rightarrow F\) with components \((\mathrm{id}_F)_A = \mathrm{id}_{F(A)}\).</li>
</ul>
When \(\mathcal{C}\) is small, \([\mathcal{C}, \mathcal{D}]\) is a legitimate category (the morphisms between any two functors form a set).
</div>

There is a second operation on natural transformations, called horizontal composition, which involves two natural transformations "side by side" (between adjacent pairs of functors).

<div class="definition">
<strong>Definition 3.9 (Horizontal Composition).</strong> Suppose \(F, G : \mathcal{C} \to \mathcal{D}\) and \(H, K : \mathcal{D} \to \mathcal{E}\) are functors, with natural transformations \(\alpha : F \Rightarrow G\) and \(\beta : H \Rightarrow K\). The <em>horizontal composite</em> \(\beta * \alpha : H \circ F \Rightarrow K \circ G\) has components

\[
(\beta * \alpha)_A = \beta_{G(A)} \circ H(\alpha_A) = K(\alpha_A) \circ \beta_{F(A)}.
\]
(The two expressions are equal by the naturality of \(\beta\).)
</div>

Horizontal and vertical composition are related by the **interchange law**: for composable natural transformations \(\alpha_1 : F \Rightarrow G\), \(\alpha_2 : G \Rightarrow H\) (between \(\mathcal{C} \to \mathcal{D}\)) and \(\beta_1 : F' \Rightarrow G'\), \(\beta_2 : G' \Rightarrow H'\) (between \(\mathcal{D} \to \mathcal{E}\)):

\[
(\beta_2 \circ \beta_1) * (\alpha_2 \circ \alpha_1) = (\beta_2 * \alpha_2) \circ (\beta_1 * \alpha_1).
\]
This law is the categorical shadow of the fact that horizontal and vertical multiplication in a matrix of morphisms commute in a well-defined way.

<div class="remark">
<strong>Remark 3.10 (2-Categories).</strong> The structure of categories, functors, and natural transformations forms a <em>2-category</em> <strong>Cat</strong>: it has objects (categories), 1-morphisms (functors), and 2-morphisms (natural transformations), with two notions of composition (horizontal for functors/natural transformations, vertical for natural transformations). The interchange law is one of the axioms of a 2-category. The notion of a 2-category is the first step toward "higher category theory" — a rich field that includes \((\infty, 1)\)-categories, \(\infty\)-toposes, and homotopy type theory, all of which have become central in modern mathematics and mathematical physics. For this course, 2-category language will appear primarily through the double-category structure on natural transformations.
</div>

---

## Chapter 4: The Opposite Category and Duality

One of the most elegant features of category theory is the **duality principle**: every theorem of category theory has a *dual* theorem, obtained by reversing all arrows. This works because the definition of a category is self-dual: if one swaps sources and targets in every hom-set and reverses composition, the result is again a category. The dual of any categorical construction is again a categorical construction, obtained by applying the original construction to the opposite category.

### 4.1 The Opposite Category

<div class="definition">
<strong>Definition 4.1 (Opposite Category).</strong> Let \(\mathcal{C}\) be a category. The <em>opposite category</em> (or <em>dual category</em>) \(\mathcal{C}^{\mathrm{op}}\) is defined by:
<ul>
<li>\(\mathrm{Ob}(\mathcal{C}^{\mathrm{op}}) = \mathrm{Ob}(\mathcal{C})\).</li>
<li>\(\mathrm{Hom}_{\mathcal{C}^{\mathrm{op}}}(A, B) = \mathrm{Hom}_{\mathcal{C}}(B, A)\) for all objects \(A, B\).</li>
<li>Composition in \(\mathcal{C}^{\mathrm{op}}\): given \(f \in \mathrm{Hom}_{\mathcal{C}^{\mathrm{op}}}(A, B) = \mathrm{Hom}_\mathcal{C}(B, A)\) and \(g \in \mathrm{Hom}_{\mathcal{C}^{\mathrm{op}}}(B, C) = \mathrm{Hom}_\mathcal{C}(C, B)\), their composite in \(\mathcal{C}^{\mathrm{op}}\) is \(f \circ_{\mathcal{C}} g \in \mathrm{Hom}_{\mathcal{C}^{\mathrm{op}}}(A, C) = \mathrm{Hom}_\mathcal{C}(C, A)\).</li>
<li>Identity morphisms: \(\mathrm{id}_A^{\mathcal{C}^{\mathrm{op}}} = \mathrm{id}_A^\mathcal{C}\).</li>
</ul>
</div>

Informally, \(\mathcal{C}^{\mathrm{op}}\) is \(\mathcal{C}\) with all arrows reversed. Note that \((\mathcal{C}^{\mathrm{op}})^{\mathrm{op}} = \mathcal{C}\). A <em>contravariant functor</em> \(F : \mathcal{C} \to \mathcal{D}\) is the same thing as a covariant functor \(\mathcal{C}^{\mathrm{op}} \to \mathcal{D}\). This allows us to always work with covariant functors without loss of generality.

<div class="example">
<strong>Example 4.2 (The Dual Vector Space Functor).</strong> The assignment \(V \mapsto V^* = \mathrm{Hom}_k(V, k)\) is a contravariant functor \((-)^* : \mathbf{Vect}_k \to \mathbf{Vect}_k\), equivalently a covariant functor \((-)^* : \mathbf{Vect}_k^{\mathrm{op}} \to \mathbf{Vect}_k\). A linear map \(T : V \to W\) induces the <em>transpose</em> \(T^* : W^* \to V^*\) (note the reversal!) by \(T^*(\phi) = \phi \circ T\). The double dual is then a covariant functor and the evaluation map \(\eta : \mathrm{Id} \Rightarrow (-)^{**}\) is the natural isomorphism of Example 3.2.
</div>

<div class="example">
<strong>Example 4.3 (Opposite Rings and Bimodules).</strong> For a ring \(R\), the opposite ring \(R^{\mathrm{op}}\) has the same underlying set but multiplication reversed: \(a \cdot_{R^{\mathrm{op}}} b = b \cdot_R a\). A right \(R\)-module is the same as a left \(R^{\mathrm{op}}\)-module. An \((R, S)\)-bimodule is a left module over \(R \otimes_\mathbb{Z} S^{\mathrm{op}}\). This algebraic "opposite ring" is the algebraic counterpart of the opposite category for module categories.
</div>

### 4.2 The Duality Principle

The duality principle is not merely a formal trick — it is a fundamental structural insight.

<div class="theorem">
<strong>Theorem 4.4 (Duality Principle).</strong> If \(P\) is a theorem of category theory, then the dual statement \(P^{\mathrm{op}}\) (obtained by reversing all arrows and replacing every categorical concept by its dual) is also a theorem of category theory.
</div>

<div class="proof">
<strong>Proof.</strong> A proof of \(P\) in a category \(\mathcal{C}\) can be applied to the category \(\mathcal{C}^{\mathrm{op}}\) to obtain a proof of \(P^{\mathrm{op}}\) in \(\mathcal{C}\). \(\square\)
</div>

The following table records the most important dual pairs.

| Concept | Dual |
|---------|------|
| Monomorphism | Epimorphism |
| Section (split mono) | Retraction (split epi) |
| Initial object | Terminal object |
| Product | Coproduct |
| Equalizer | Coequalizer |
| Kernel | Cokernel |
| Pullback | Pushout |
| Limit | Colimit |
| Left adjoint | Right adjoint |
| Projective module | Injective module |
| Projective resolution | Injective resolution |
| Left derived functor | Right derived functor |
| Tor | Ext |
| Filtered colimit | Cofiltered limit |

In practice, the duality principle means that one can prove only half of any symmetric pair of results (e.g., "limits" vs. "colimits") and get the other half for free by dualizing. However, care is needed: not every statement is self-dual, and the dual of an important theorem may be trivial or may require independent verification in important special cases.

<div class="remark">
<strong>Remark 4.5 (Mathematical Dualities).</strong> Many of the deepest dualities in mathematics are instances of categorical duality, often in enriched or higher-categorical settings. Here are several major examples:
<ul>
<li><strong>Pontryagin Duality</strong>: The category of locally compact abelian groups is anti-equivalent to itself via \(G \mapsto \hat{G} = \mathrm{Hom}_{\mathrm{cts}}(G, \mathbb{T})\) (the Pontryagin dual). Under this duality, compact groups correspond to discrete groups, and \(\hat{\hat{G}} \cong G\) naturally.</li>
<li><strong>Gelfand Duality</strong>: As noted in Example 2.12, compact Hausdorff spaces are anti-equivalent to commutative unital C*-algebras. This is the foundation for noncommutative geometry.</li>
<li><strong>Stone Duality</strong>: The category of Boolean algebras is anti-equivalent to the category of Stone spaces (compact, totally disconnected Hausdorff spaces) via the functor of "ultrafilters" / "points of the Stone space." This connects logic (Boolean algebras = propositional theories) to topology.</li>
<li><strong>Koszul Duality</strong>: In the representation theory of algebras, certain graded algebras \(A\) have a "Koszul dual" \(A^!\) such that \((A^!)^! \cong A\), and the derived categories of \(A\)- and \(A^!\)-modules are related by an equivalence (the Koszul equivalence). This is a homological duality that generalizes classical Poincaré duality.</li>
<li><strong>Serre Duality</strong>: For a smooth projective variety \(X\) of dimension \(n\) over a field, there is a natural isomorphism \(H^k(X, \mathcal{F}) \cong H^{n-k}(X, \mathcal{F}^\vee \otimes \omega_X)^*\) where \(\omega_X\) is the canonical bundle. This is the algebraic geometry counterpart of Poincaré duality, and it arises from the adjunction between push-forward and pull-back functors via Grothendieck duality.</li>
</ul>
These examples illustrate a general theme: powerful duality theorems in mathematics often arise from categorical anti-equivalences, and the categorical framework both clarifies their structure and suggests generalizations.
</div>

<div class="remark">
<strong>Remark 4.6 (Projective-Injective Duality in Module Theory).</strong> The duality between projective and injective modules is one of the most practically important instances of categorical duality. A module \(P\) is projective if \(\mathrm{Hom}_R(P, -)\) is exact; a module \(I\) is injective if \(\mathrm{Hom}_R(-, I)\) is exact. In the opposite category \(R\text{-}\mathbf{Mod}^{\mathrm{op}}\) (which is equivalent to the category of right \(R\)-modules in favorable cases), injective objects correspond to projective objects and vice versa. This duality manifests in the theory of resolutions: every module has a projective resolution (computing left derived functors like Tor) and an injective resolution (computing right derived functors like Ext), and the two constructions are formally dual. We will develop this in Chapters 11–12 and 14.
</div>

---

## Chapter 5: Adjoint Functors

Adjoint functors are, in Mac Lane's celebrated phrase, "the most important concept in all of category theory." They formalize the idea of an "optimal solution to a universal problem": given a functor \(G : \mathcal{D} \to \mathcal{C}\) that forgets structure, a left adjoint \(F : \mathcal{C} \to \mathcal{D}\) freely adds structure. The adjunction says precisely that maps from \(FA\) into \(B\) in \(\mathcal{D}\) are in natural bijection with maps from \(A\) into \(GB\) in \(\mathcal{C}\) — to map out of the free object is the same as to map into the underlying set. This single abstract pattern encompasses free groups, free modules, tensor products, Stone-Čech compactifications, sheafification, and hundreds of other constructions across mathematics.

### 5.1 The Hom-Set Formulation

<div class="definition">
<strong>Definition 5.1 (Adjoint Functors).</strong> Let \(\mathcal{C}\) and \(\mathcal{D}\) be categories. A functor \(F : \mathcal{C} \to \mathcal{D}\) is <em>left adjoint</em> to a functor \(G : \mathcal{D} \to \mathcal{C}\) (equivalently, \(G\) is <em>right adjoint</em> to \(F\)) if there is a bijection

\[
\alpha_{A,B} : \mathrm{Hom}_\mathcal{D}(FA, B) \xrightarrow{\sim} \mathrm{Hom}_\mathcal{C}(A, GB)
\]
natural in both \(A \in \mathrm{Ob}(\mathcal{C})\) and \(B \in \mathrm{Ob}(\mathcal{D})\). We write \(F \dashv G\) and call \(\alpha\) the <em>adjunction bijection</em>.

Naturality in \(A\) means: for any \(\varphi : A' \to A\) in \(\mathcal{C}\), the diagram

\[
\mathrm{Hom}(FA, B) \xrightarrow{\alpha_{A,B}} \mathrm{Hom}(A, GB)
\]

\[
\downarrow{(F\varphi)^*} \qquad\qquad \downarrow{\varphi^*}
\]

\[
\mathrm{Hom}(FA', B) \xrightarrow{\alpha_{A',B}} \mathrm{Hom}(A', GB)
\]
commutes. Naturality in \(B\) is the analogous condition for maps \(\psi : B \to B'\).
</div>

The naturality conditions are the heart of the definition: they ensure that the bijection between hom-sets is not an accident at one particular pair \((A, B)\) but a coherent family of bijections fitting together as \(A\) and \(B\) vary. Without naturality, one could always find ad hoc bijections between hom-sets that say nothing meaningful.

### 5.2 The Unit-Counit Formulation

There is an equivalent formulation of adjunctions in terms of two natural transformations, the unit and counit, which are often more convenient to construct explicitly.

<div class="definition">
<strong>Definition 5.2 (Unit and Counit of an Adjunction).</strong> Given an adjunction \(F \dashv G\), define:
<ul>
<li>The <em>unit</em> \(\eta : \mathrm{Id}_\mathcal{C} \Rightarrow GF\) by \(\eta_A = \alpha_{A, FA}(\mathrm{id}_{FA}) \in \mathrm{Hom}_\mathcal{C}(A, GFA)\).</li>
<li>The <em>counit</em> \(\varepsilon : FG \Rightarrow \mathrm{Id}_\mathcal{D}\) by \(\varepsilon_B = \alpha_{GB, B}^{-1}(\mathrm{id}_{GB}) \in \mathrm{Hom}_\mathcal{D}(FGB, B)\).</li>
</ul>
These satisfy the <em>triangle identities</em>:

\[
(G\varepsilon) \circ (\eta G) = \mathrm{id}_G \quad \text{and} \quad (\varepsilon F) \circ (F\eta) = \mathrm{id}_F,
\]
where \(\eta G\) denotes the natural transformation with components \(\eta_{G(B)} : G(B) \to GFG(B)\), and \(G\varepsilon\) has components \(G(\varepsilon_B) : GFG(B) \to G(B)\).
</div>

The unit \(\eta_A : A \to GFA\) is the "universal map" from \(A\) into the underlying object of the free \(\mathcal{D}\)-object on \(A\). The counit \(\varepsilon_B : FGB \to B\) is the "evaluation map" — applying the free-object functor to the underlying set of \(B\) and then projecting back. The triangle identities say that these two maps are inverses in the appropriate sense.

<div class="theorem">
<strong>Theorem 5.3 (Equivalence of Formulations).</strong> The following data are equivalent:
<ol>
<li>An adjunction bijection \(\alpha_{A,B} : \mathrm{Hom}_\mathcal{D}(FA, B) \xrightarrow{\sim} \mathrm{Hom}_\mathcal{C}(A, GB)\), natural in \(A\) and \(B\).</li>
<li>Natural transformations \(\eta : \mathrm{Id}_\mathcal{C} \Rightarrow GF\) and \(\varepsilon : FG \Rightarrow \mathrm{Id}_\mathcal{D}\) satisfying the triangle identities.</li>
</ol>
Given (1), the unit and counit are defined as in Definition 5.2. Given (2), the bijection \(\alpha_{A,B}\) is defined by \(\alpha_{A,B}(f) = G(f) \circ \eta_A\) for \(f : FA \to B\), with inverse \(\alpha_{A,B}^{-1}(g) = \varepsilon_B \circ F(g)\) for \(g : A \to GB\).
</div>

<div class="proof">
<strong>Proof (Sketch).</strong> We verify that the two formulas are inverse to each other. Starting with \(f : FA \to B\), we have

\[
\alpha_{A,B}^{-1}(\alpha_{A,B}(f)) = \varepsilon_B \circ F(G(f) \circ \eta_A) = \varepsilon_B \circ FG(f) \circ F(\eta_A) = f \circ \varepsilon_{FA} \circ F(\eta_A) = f \circ \mathrm{id}_{FA} = f,
\]
using naturality of \(\varepsilon\) and the triangle identity \((\varepsilon F) \circ (F\eta) = \mathrm{id}_F\). The reverse direction is similar. The naturality of \(\alpha\) follows from the naturality of \(\eta\) and \(\varepsilon\). \(\square\)
</div>

### 5.3 Examples of Adjunctions

<div class="example">
<strong>Example 5.4 (Free-Forgetful Adjunctions).</strong> The archetypal family of adjunctions. In each case, \(F\) is the "free" functor constructing the free algebraic object on a given set, and \(U\) is the forgetful functor.
<ol>
<li><strong>Free groups</strong>: \(F : \mathbf{Set} \to \mathbf{Grp}\) (free group on a set of generators) \(\dashv\) \(U : \mathbf{Grp} \to \mathbf{Set}\) (underlying set). The adjunction bijection \(\mathrm{Hom}_{\mathbf{Grp}}(F(S), G) \cong \mathrm{Hom}_{\mathbf{Set}}(S, U(G))\) says: a group homomorphism from the free group on \(S\) is completely determined by a function from \(S\) into the underlying set of \(G\). The unit \(\eta_S : S \to U(F(S))\) sends each generator to itself (as a word of length one).</li>
<li><strong>Free modules</strong>: \(F : \mathbf{Set} \to R\text{-}\mathbf{Mod}\) (free module \(R^{(S)} = \bigoplus_{s \in S} R\)) \(\dashv\) \(U : R\text{-}\mathbf{Mod} \to \mathbf{Set}\). The bijection \(\mathrm{Hom}_R(R^{(S)}, M) \cong \mathrm{Hom}_{\mathbf{Set}}(S, M)\) says that \(R\)-module maps from the free module on \(S\) correspond to functions from \(S\) into \(M\): a module map is determined by its values on the basis elements.</li>
<li><strong>Abelianization</strong>: \((-)^{\mathrm{ab}} : \mathbf{Grp} \to \mathbf{Ab}\) \(\dashv\) \(\iota : \mathbf{Ab} \hookrightarrow \mathbf{Grp}\) (inclusion). The bijection \(\mathrm{Hom}_{\mathbf{Ab}}(G^{\mathrm{ab}}, A) \cong \mathrm{Hom}_{\mathbf{Grp}}(G, \iota(A))\) says that group homomorphisms from \(G\) to an abelian group \(A\) are the same as abelian group homomorphisms from \(G^{\mathrm{ab}}\). This is the universal property of abelianization.</li>
<li><strong>Polynomial rings</strong>: \(k[-] : \mathbf{Set} \to \mathbf{CRing}\) (polynomial ring) \(\dashv\) \(U : \mathbf{CRing} \to \mathbf{Set}\) (underlying set). The bijection \(\mathrm{Hom}_{\mathbf{CRing}}(k[x_1, \ldots, x_n], R) \cong \mathrm{Hom}_{\mathbf{Set}}(\{x_1, \ldots, x_n\}, R)\) says that a ring map from a polynomial ring is determined by the images of the variables — exactly the "evaluation" principle of ring theory.</li>
</ol>
</div>

<div class="example">
<strong>Example 5.5 (Galois Connections).</strong> Every adjunction between poset categories is a <em>Galois connection</em>. Given posets \((P, \leq)\) and \((Q, \leq)\), a Galois connection between \(P\) and \(Q\) consists of order-preserving maps \(f : P \to Q\) and \(g : Q \to P\) such that \(f(p) \leq q\) iff \(p \leq g(q)\) for all \(p \in P, q \in Q\). This is exactly the condition \(F \dashv G\) when \(P\) and \(Q\) are viewed as categories.

Examples: (i) For a ring \(R\) and module \(M\), the "annihilator" construction gives a Galois connection between subsets of \(R\) and subsets of \(M\). (ii) In Galois theory, there is a Galois connection between subgroups of the Galois group and intermediate fields of a field extension. (iii) In lattice theory, the closure operator on a lattice arises as the composite \(GF\) of a Galois connection \(F \dashv G\).
</div>

<div class="example">
<strong>Example 5.6 (Stone-Čech Compactification).</strong> Let \(\mathbf{CHaus}\) be the category of compact Hausdorff spaces with continuous maps, and \(\mathbf{Top}\) the category of all topological spaces. The inclusion \(\iota : \mathbf{CHaus} \hookrightarrow \mathbf{Top}\) has a left adjoint \(\beta : \mathbf{Top} \to \mathbf{CHaus}\), the Stone-Čech compactification. The adjunction bijection

\[
\mathrm{Hom}_{\mathbf{CHaus}}(\beta X, K) \cong \mathrm{Hom}_{\mathbf{Top}}(X, K)
\]
says: every continuous map from \(X\) to a compact Hausdorff space \(K\) factors uniquely through the Stone-Čech compactification \(\beta X \to K\). The unit \(\eta_X : X \to \beta X\) is the canonical embedding of \(X\) into its compactification. This is the universal compact Hausdorff space "generated by" \(X\).
</div>

<div class="example">
<strong>Example 5.7 (Sheaf Adjunctions in Geometry).</strong> For a continuous map \(f : X \to Y\) of topological spaces, there is an adjunction \(f^{-1} \dashv f_*\) between the categories of sheaves of abelian groups on \(Y\) and \(X\):

\[
\mathrm{Hom}_{\mathbf{Sh}(X)}(f^{-1}\mathcal{G}, \mathcal{F}) \cong \mathrm{Hom}_{\mathbf{Sh}(Y)}(\mathcal{G}, f_*\mathcal{F}).
\]
Here \(f_*\mathcal{F}(U) = \mathcal{F}(f^{-1}(U))\) is the direct image (pushing forward to \(Y\)) and \(f^{-1}\mathcal{G}\) is the inverse image (pulling back to \(X\)). This adjunction is fundamental in algebraic geometry, where it is the basis for the definition of cohomology with support, the projection formula, and Grothendieck duality. The Leray spectral sequence, for instance, arises from the composition \(g \circ f\) of two maps and the adjunction between \((g \circ f)_*\) and \(f_* g_*\).
</div>

### 5.4 The Tensor-Hom Adjunction

The single most important adjunction for homological algebra is the Tensor-Hom adjunction, which relates the tensor product and the Hom functor for modules.

We first recall the construction of the tensor product. Let \(R\) be a commutative ring (or more generally, let \(M\) be a right \(R\)-module and \(N\) a left \(R\)-module). The tensor product \(M \otimes_R N\) is the abelian group generated by symbols \(m \otimes n\) for \(m \in M, n \in N\), subject to the relations making \((m, n) \mapsto m \otimes n\) \(R\)-bilinear: \((m+m') \otimes n = m \otimes n + m' \otimes n\), \(m \otimes (n+n') = m \otimes n + m \otimes n'\), and \(mr \otimes n = m \otimes rn\) for \(r \in R\).

<div class="definition">
<strong>Definition 5.8 (Universal Property of the Tensor Product).</strong> Let \(R\) be a commutative ring and \(M, N, P\) be \(R\)-modules. A map \(f : M \times N \to P\) is <em>\(R\)-bilinear</em> if it is \(R\)-linear in each variable separately. The <em>tensor product</em> \(M \otimes_R N\) together with the universal bilinear map \(\otimes : M \times N \to M \otimes_R N\), \((m, n) \mapsto m \otimes n\), has the universal property: for every \(R\)-bilinear map \(f : M \times N \to P\), there is a unique \(R\)-module homomorphism \(\tilde{f} : M \otimes_R N \to P\) with \(\tilde{f}(m \otimes n) = f(m, n)\).
</div>

<div class="theorem">
<strong>Theorem 5.9 (Tensor-Hom Adjunction).</strong> For \(R\)-modules \(M, N, P\) (with \(R\) commutative), there is a natural isomorphism

\[
\mathrm{Hom}_R(M \otimes_R N, P) \cong \mathrm{Hom}_R(M, \mathrm{Hom}_R(N, P)).
\]
In categorical terms, for each \(R\)-module \(N\), the functor \(- \otimes_R N : R\text{-}\mathbf{Mod} \to R\text{-}\mathbf{Mod}\) is left adjoint to the functor \(\mathrm{Hom}_R(N, -) : R\text{-}\mathbf{Mod} \to R\text{-}\mathbf{Mod}\).
</div>

<div class="proof">
<strong>Proof.</strong> Define \(\Phi : \mathrm{Hom}_R(M \otimes_R N, P) \to \mathrm{Hom}_R(M, \mathrm{Hom}_R(N, P))\) by sending \(f : M \otimes_R N \to P\) to the map \(\Phi(f) : M \to \mathrm{Hom}_R(N, P)\) defined by \(\Phi(f)(m)(n) = f(m \otimes n)\). This is well-defined: for fixed \(m\), the map \(n \mapsto f(m \otimes n)\) is \(R\)-linear (since \(f\) is \(R\)-linear and \(m \otimes -\) is \(R\)-linear).

Define \(\Psi : \mathrm{Hom}_R(M, \mathrm{Hom}_R(N, P)) \to \mathrm{Hom}_R(M \otimes_R N, P)\) by sending \(g : M \to \mathrm{Hom}_R(N, P)\) to the map \(\Psi(g) : M \otimes_R N \to P\) determined by \(\Psi(g)(m \otimes n) = g(m)(n)\). This is well-defined by the universal property of the tensor product: the map \((m, n) \mapsto g(m)(n)\) is \(R\)-bilinear, so it factors uniquely through \(M \otimes_R N\).

One checks that \(\Phi\) and \(\Psi\) are mutually inverse: \(\Phi(\Psi(g))(m)(n) = \Psi(g)(m \otimes n) = g(m)(n)\), so \(\Phi\Psi = \mathrm{id}\); and \(\Psi(\Phi(f))(m \otimes n) = \Phi(f)(m)(n) = f(m \otimes n)\), so \(\Psi\Phi = \mathrm{id}\). Naturality in \(M\) and \(P\) is verified by diagram chasing. \(\square\)
</div>

The Tensor-Hom adjunction has an immediate and fundamental consequence for exactness. Since \(- \otimes_R N\) is a left adjoint, it preserves all colimits — in particular, it is *right exact* (it preserves cokernels, which are colimits). Similarly, since \(\mathrm{Hom}_R(N, -)\) is a right adjoint, it preserves all limits — in particular, it is *left exact* (it preserves kernels). These exactness properties are the foundational observation of homological algebra: the failure of full exactness is what gives rise to the derived functors Tor and Ext.

<div class="remark">
<strong>Remark 5.10 (Extension of Scalars).</strong> A fundamental application of the Tensor-Hom adjunction arises from "extension and restriction of scalars." Given a ring homomorphism \(\varphi : R \to S\), every \(S\)-module can be viewed as an \(R\)-module via \(\varphi\) (this is the <em>restriction of scalars</em> functor \(\mathrm{Res}_\varphi : S\text{-}\mathbf{Mod} \to R\text{-}\mathbf{Mod}\)). The <em>extension of scalars</em> functor \(S \otimes_R - : R\text{-}\mathbf{Mod} \to S\text{-}\mathbf{Mod}\) is left adjoint to \(\mathrm{Res}_\varphi\):

\[
\mathrm{Hom}_S(S \otimes_R M, N) \cong \mathrm{Hom}_R(M, \mathrm{Res}_\varphi(N)).
\]
This adjunction is ubiquitous in algebra and algebraic geometry: "base change" (extending scalars along a ring map, e.g., from \(\mathbb{Z}\) to \(\mathbb{Q}\) or from \(\mathbb{R}\) to \(\mathbb{C}\)) is always a left adjoint to restriction, and therefore always right exact. The failure of exact base change is measured by Tor.
</div>

### 5.5 Properties of Adjunctions

<div class="theorem">
<strong>Theorem 5.11 (Uniqueness of Adjoints).</strong> Left adjoints are unique up to natural isomorphism: if \(F \dashv G\) and \(F' \dashv G\), then \(F \cong F'\). Dually, right adjoints are unique up to natural isomorphism.
</div>

<div class="proof">
<strong>Proof.</strong> We construct a natural isomorphism \(\eta : F \Rightarrow F'\). For each object \(A\), the adjunction bijections give

\[
\mathrm{Hom}_\mathcal{D}(FA, B) \cong \mathrm{Hom}_\mathcal{C}(A, GB) \cong \mathrm{Hom}_\mathcal{D}(F'A, B)
\]
naturally in \(B\). By the Yoneda lemma (Chapter 6), a natural isomorphism of functors \(\mathrm{Hom}(FA, -) \cong \mathrm{Hom}(F'A, -)\) in \(B\) corresponds to a unique isomorphism \(FA \cong F'A\). These isomorphisms fit together into a natural isomorphism \(F \cong F'\). \(\square\)
</div>

<div class="theorem">
<strong>Theorem 5.12 (RAPL and LAPC — Statement).</strong>
<ol>
<li><strong>Right Adjoints Preserve Limits (RAPL)</strong>: If \(F \dashv G\) and a limit \(\varprojlim D\) exists in \(\mathcal{D}\), then \(G(\varprojlim D) \cong \varprojlim (G \circ D)\).</li>
<li><strong>Left Adjoints Preserve Colimits (LAPC)</strong>: If \(F \dashv G\) and a colimit \(\varinjlim D\) exists in \(\mathcal{C}\), then \(F(\varinjlim D) \cong \varinjlim (F \circ D)\).</li>
</ol>
We will prove this in §7.8 after developing limits and colimits.
</div>

RAPL/LAPC has immediate applications. The forgetful functor \(U : \mathbf{Grp} \to \mathbf{Set}\) is right adjoint to the free group functor, so it preserves all limits: the underlying set of a product of groups is the product of the underlying sets. The tensor product \(M \otimes_R -\) is left adjoint to \(\mathrm{Hom}_R(M, -)\), so it preserves colimits: tensor product distributes over direct sums, \(M \otimes_R \bigoplus_i N_i \cong \bigoplus_i (M \otimes_R N_i)\).

### 5.6 Monads

Every adjunction generates a monad, a fundamental construction that encompasses free algebras, closure operators, and computational effects (in the theory of programming languages).

<div class="definition">
<strong>Definition 5.13 (Monad).</strong> A <em>monad</em> on a category \(\mathcal{C}\) is a triple \((T, \eta, \mu)\) where \(T : \mathcal{C} \to \mathcal{C}\) is a functor, \(\eta : \mathrm{Id}_\mathcal{C} \Rightarrow T\) is the <em>unit</em>, and \(\mu : T^2 \Rightarrow T\) is the <em>multiplication</em> (where \(T^2 = T \circ T\)), satisfying:
<ul>
<li><em>Associativity</em>: \(\mu \circ T\mu = \mu \circ \mu T\) (as natural transformations \(T^3 \Rightarrow T\)).</li>
<li><em>Unit laws</em>: \(\mu \circ T\eta = \mathrm{id}_T = \mu \circ \eta T\).</li>
</ul>
</div>

<div class="proposition">
<strong>Proposition 5.14 (Every Adjunction Gives a Monad).</strong> Given an adjunction \(F \dashv G\) with unit \(\eta : \mathrm{Id}_\mathcal{C} \Rightarrow GF\) and counit \(\varepsilon : FG \Rightarrow \mathrm{Id}_\mathcal{D}\), the triple \((T, \eta, \mu)\) where \(T = GF\) and \(\mu = G\varepsilon F : T^2 = GFGF \Rightarrow GF = T\) is a monad on \(\mathcal{C}\).
</div>

<div class="example">
<strong>Example 5.15 (Monads from Free-Forgetful Adjunctions).</strong>
<ul>
<li>The free group adjunction \(F \dashv U : \mathbf{Grp} \to \mathbf{Set}\) gives the <em>free group monad</em> \(T\) on <strong>Set</strong>: \(T(S)\) is the free group on \(S\) (as a set), \(\eta_S : S \to T(S)\) sends each element to the corresponding generator, and \(\mu_S : T(T(S)) \to T(S)\) "evaluates" a word of words into a single word (concatenation after substitution). An algebra for this monad is precisely a group.</li>
<li>The free module adjunction gives the <em>free \(R\)-module monad</em> on <strong>Set</strong>, whose algebras are \(R\)-modules.</li>
<li>The power set functor \(\mathcal{P} : \mathbf{Set} \to \mathbf{Set}\) carries a monad structure: \(\eta_S(x) = \{x\}\) (singleton) and \(\mu_S : \mathcal{P}(\mathcal{P}(S)) \to \mathcal{P}(S)\) is \(A \mapsto \bigcup A\) (union). Algebras for this monad are complete semilattices.</li>
</ul>
</div>

<div class="remark">
<strong>Remark 5.16 (Monads in Computer Science).</strong> Monads became important in theoretical computer science through the work of Eugenio Moggi (1989) and Philip Wadler (1992), who showed that monads in the category of sets and functions provide a unified framework for describing computational effects: exceptions (the "Maybe" monad \(TX = X + \{*\}\)), nondeterminism (the power set monad), state (the state monad \(TX = (X \times S)^S\)), continuations, and I/O are all instances of the monad abstraction. This connection between pure mathematics and programming language theory is one of the striking applications of category theory outside mathematics proper.

Beck's monadicity theorem (Barr-Beck theorem) gives conditions under which a functor \(U : \mathcal{D} \to \mathcal{C}\) is "monadic" — i.e., \(\mathcal{D}\) is equivalent to the category of algebras for the monad \(GF\). This theorem is the foundation for the categorical approach to universal algebra (Lawvere's thesis, 1963) and for descent theory in algebraic geometry.
</div>

---

## Chapter 6: The Yoneda Lemma

The Yoneda lemma is the most fundamental result of category theory, and yet it is surprisingly simple to state and prove. Its import is philosophical as much as technical: it says that a mathematical object is completely determined by its "relationships to all other objects." More precisely, a category embeds faithfully (and fully) into its category of presheaves — functors \(\mathcal{C}^{\mathrm{op}} \to \mathbf{Set}\) — and this embedding is natural. From the Yoneda lemma one derives the theory of representable functors, which underlies Grothendieck's functor-of-points approach to algebraic geometry, the theory of classifying spaces in algebraic topology, and the theory of universal properties throughout mathematics.

### 6.1 Representable Functors

<div class="definition">
<strong>Definition 6.1 (Representable Functor).</strong> A functor \(F : \mathcal{C} \to \mathbf{Set}\) is <em>representable</em> if there exists an object \(A \in \mathrm{Ob}(\mathcal{C})\) and a natural isomorphism \(F \cong \mathrm{Hom}_\mathcal{C}(A, -)\). The object \(A\) is called a <em>representing object</em> for \(F\), and is unique up to unique isomorphism (by the Yoneda lemma). Similarly, a contravariant functor \(G : \mathcal{C} \to \mathbf{Set}\) (i.e., \(G : \mathcal{C}^{\mathrm{op}} \to \mathbf{Set}\)) is representable if \(G \cong \mathrm{Hom}_\mathcal{C}(-, B)\) for some \(B\).
</div>

Representable functors are fundamental because they are completely determined by a single object (the representing object) and a single element (the "universal element" in the image of \(\mathrm{id}_A\) under the natural isomorphism). The following examples illustrate the ubiquity of representability.

<div class="example">
<strong>Example 6.2 (Representable Functors in Algebra and Geometry).</strong>
<ul>
<li>The forgetful functor \(U : \mathbf{Grp} \to \mathbf{Set}\) is represented by the infinite cyclic group \(\mathbb{Z}\): \(\mathrm{Hom}_{\mathbf{Grp}}(\mathbb{Z}, G) \cong U(G)\) naturally, since a group homomorphism \(\mathbb{Z} \to G\) is determined by the image of \(1\). The representing object \(\mathbb{Z}\) is the free group on one generator, and the universal element is \(1 \in U(\mathbb{Z})\).</li>
<li>The forgetful functor \(U : \mathbf{Ring} \to \mathbf{Set}\) is represented by \(\mathbb{Z}[x]\): \(\mathrm{Hom}_{\mathbf{Ring}}(\mathbb{Z}[x], R) \cong U(R)\), since a ring homomorphism from \(\mathbb{Z}[x]\) is determined by the image of \(x\) (the evaluation map).</li>
<li>In algebraic geometry, the functor \(F : \mathbf{CRing} \to \mathbf{Set}\) sending \(R\) to the set of solutions \(\{(r_1, \ldots, r_n) \in R^n : f_1(r_1, \ldots, r_n) = \cdots = f_k(r_1, \ldots, r_n) = 0\}\) of a system of polynomial equations is represented by the ring \(\mathbb{Z}[x_1, \ldots, x_n]/(f_1, \ldots, f_k)\). This is the starting point of Grothendieck's theory of schemes as representable functors \(\mathbf{CRing} \to \mathbf{Set}\).</li>
<li>The functor \(\mathrm{Der}_k(-, M) : k\text{-}\mathbf{CAlg} \to \mathbf{Ab}\) sending a \(k\)-algebra \(C\) to the module of \(k\)-derivations \(C \to M\) is represented by the module of Kähler differentials \(\Omega_{C/k}\): \(\mathrm{Der}_k(C, M) \cong \mathrm{Hom}_C(\Omega_{C/k}, M)\). See §6.4 below.</li>
</ul>
</div>

### 6.2 The Yoneda Lemma

<div class="theorem">
<strong>Theorem 6.3 (Yoneda Lemma).</strong> Let \(\mathcal{C}\) be a locally small category, \(F : \mathcal{C} \to \mathbf{Set}\) a functor, and \(A \in \mathrm{Ob}(\mathcal{C})\). There is a bijection

\[
\Phi_{A, F} : \mathrm{Nat}(\mathrm{Hom}_\mathcal{C}(A, -), F) \xrightarrow{\sim} F(A)
\]
natural in both \(A\) and \(F\). The bijection sends a natural transformation \(\eta : \mathrm{Hom}(A, -) \Rightarrow F\) to \(\eta_A(\mathrm{id}_A) \in F(A)\).
</div>

<div class="proof">
<strong>Proof.</strong> Define \(\Phi(\eta) = \eta_A(\mathrm{id}_A)\). We construct an inverse \(\Psi : F(A) \to \mathrm{Nat}(\mathrm{Hom}(A, -), F)\). Given \(x \in F(A)\), define the natural transformation \(\Psi(x) : \mathrm{Hom}(A, -) \Rightarrow F\) by

\[
\Psi(x)_B : \mathrm{Hom}(A, B) \to F(B), \quad f \mapsto F(f)(x).
\]
Naturality of \(\Psi(x)\): for \(g : B \to B'\), we need \(\Psi(x)_{B'}(g \circ f) = F(g)(\Psi(x)_B(f))\). Indeed: \(\Psi(x)_{B'}(g \circ f) = F(g \circ f)(x) = F(g)(F(f)(x)) = F(g)(\Psi(x)_B(f))\).

Now \(\Phi\Psi(x) = \Psi(x)_A(\mathrm{id}_A) = F(\mathrm{id}_A)(x) = x\). And for \(\eta\) a natural transformation, \(\Psi(\Phi(\eta))_B(f) = F(f)(\eta_A(\mathrm{id}_A))\). But by naturality of \(\eta\) applied to \(f : A \to B\):

\[
\eta_B(f) = \eta_B(\mathrm{Hom}(A,f)(\mathrm{id}_A)) = F(f)(\eta_A(\mathrm{id}_A)).
\]
So \(\Psi(\Phi(\eta))_B = \eta_B\) for all \(B\), meaning \(\Psi\Phi(\eta) = \eta\). \(\square\)
</div>

The proof reveals the Yoneda lemma's content: a natural transformation out of a representable functor is completely determined by what it does to the identity morphism — the "universal element." There is no choice to make at any other object, because naturality forces the entire transformation.

<div class="corollary">
<strong>Corollary 6.4 (Representing Objects Are Unique).</strong> If \(F \cong \mathrm{Hom}(A, -) \cong \mathrm{Hom}(B, -)\), then \(A \cong B\) via a unique isomorphism. In particular, representing objects are unique up to unique isomorphism.
</div>

<div class="proof">
<strong>Proof.</strong> The natural isomorphism \(\mathrm{Hom}(A, -) \cong \mathrm{Hom}(B, -)\) yields, by the Yoneda lemma applied at \(B\), an element of \(\mathrm{Hom}(A, B)\) (the image of \(\mathrm{id}_B\)), and applied at \(A\), an element of \(\mathrm{Hom}(B, A)\). One verifies using the naturality of the isomorphism that these two elements are mutually inverse. \(\square\)
</div>

### 6.3 The Yoneda Embedding

<div class="theorem">
<strong>Theorem 6.5 (Yoneda Embedding).</strong> The assignment \(A \mapsto \mathrm{Hom}_\mathcal{C}(-, A) = h^A\) defines a fully faithful functor

\[
\mathbf{y} : \mathcal{C} \to [\mathcal{C}^{\mathrm{op}}, \mathbf{Set}], \quad A \mapsto h^A, \quad f \mapsto (f \circ -),
\]
called the <em>Yoneda embedding</em>. ("Fully faithful" means bijective on all hom-sets.)
</div>

<div class="proof">
<strong>Proof.</strong> By the Yoneda lemma applied to the contravariant case, \(\mathrm{Nat}(h^A, h^B) \cong h^B(A) = \mathrm{Hom}(A, B)\), naturally in \(A\) and \(B\). This bijection is implemented by \(f \mapsto (- \circ f)\) (precomposition with \(f : A \to B\)), which is exactly the action of the Yoneda embedding on morphisms. So the Yoneda embedding is bijective on hom-sets — fully faithful. \(\square\)
</div>

The Yoneda embedding has profound consequences. It says that \(\mathcal{C}\) sits inside the "presheaf category" \([\mathcal{C}^{\mathrm{op}}, \mathbf{Set}]\) as a full subcategory. Objects of \(\mathcal{C}\) are "determined by their relationships to all other objects": if \(\mathrm{Hom}(-, A) \cong \mathrm{Hom}(-, B)\) as functors, then \(A \cong B\). This is the categorical analogue of Cayley's theorem in group theory (every group embeds in a symmetric group) — but the Yoneda embedding works for all categories simultaneously.

<div class="remark">
<strong>Remark 6.6 (Functor of Points in Algebraic Geometry).</strong> The Yoneda lemma is the foundation of Grothendieck's "functor of points" approach to algebraic geometry. Instead of defining a scheme as a topological space with a structure sheaf (the "locally ringed space" definition), one defines a scheme as a functor \(X : \mathbf{CRing} \to \mathbf{Set}\) satisfying certain sheaf conditions. The "points" of the scheme over a ring \(R\) are the elements of \(X(R)\) — the "\(R\)-valued points." This approach has several advantages: it works seamlessly over arbitrary base rings, it naturally incorporates deformation theory (varying \(R\)), and it makes the functor-theoretic properties of schemes (products, base change, etc.) entirely transparent. The Yoneda lemma guarantees that this approach recovers the classical theory: a scheme in the functor-of-points sense that is representable (i.e., \(X \cong \mathrm{Hom}_{\mathbf{Ring}}(A, -)\) for some ring \(A\)) is exactly an affine scheme \(\mathrm{Spec}(A)\).
</div>

### 6.4 Presheaves and Sheaves

<div class="definition">
<strong>Definition 6.7 (Presheaf).</strong> A <em>presheaf of sets</em> on a category \(\mathcal{C}\) is a functor \(F : \mathcal{C}^{\mathrm{op}} \to \mathbf{Set}\). The category of presheaves on \(\mathcal{C}\) is the functor category \(\hat{\mathcal{C}} = [\mathcal{C}^{\mathrm{op}}, \mathbf{Set}]\).

When \(\mathcal{C} = \mathbf{Top}_X\) (the category of open sets of a topological space \(X\), with inclusions as morphisms), a presheaf \(F : \mathbf{Top}_X^{\mathrm{op}} \to \mathbf{Set}\) assigns to each open set \(U \subseteq X\) a set \(F(U)\) of "sections over \(U\)," and to each inclusion \(V \subseteq U\) a "restriction map" \(\rho_{U,V} = F(V \hookrightarrow U) : F(U) \to F(V)\), satisfying: \(\rho_{U,U} = \mathrm{id}\) and \(\rho_{V,W} \circ \rho_{U,V} = \rho_{U,W}\).
</div>

<div class="definition">
<strong>Definition 6.8 (Sheaf).</strong> A presheaf \(F\) on a topological space \(X\) is a <em>sheaf</em> if it satisfies two conditions for every open cover \(U = \bigcup_{i \in I} U_i\):
<ol>
<li><em>Locality (Separation)</em>: If \(s, t \in F(U)\) satisfy \(\rho_{U, U_i}(s) = \rho_{U, U_i}(t)\) for all \(i\), then \(s = t\).</li>
<li><em>Gluing</em>: If \(\{s_i \in F(U_i)\}_{i \in I}\) is a compatible family (i.e., \(\rho_{U_i, U_i \cap U_j}(s_i) = \rho_{U_j, U_i \cap U_j}(s_j)\) for all \(i, j\)), then there exists \(s \in F(U)\) with \(\rho_{U, U_i}(s) = s_i\) for all \(i\).</li>
</ol>
</div>

The prototypical sheaf is the sheaf of continuous functions: \(\mathcal{O}_X(U) = \{f : U \to \mathbb{R} : f \text{ is continuous}\}\), with restriction maps given by restriction of functions. Locality holds because a continuous function is determined by its local values; gluing holds because functions that agree on overlaps can be glued. Many other geometric sheaves — sheaves of holomorphic functions, sheaves of smooth differential forms, sheaves of algebraic sections of a vector bundle — are fundamental objects of geometry.

<div class="remark">
<strong>Remark 6.9 (The Free Cocompletion).</strong> The presheaf category \(\hat{\mathcal{C}} = [\mathcal{C}^{\mathrm{op}}, \mathbf{Set}]\) is the <em>free cocompletion</em> of \(\mathcal{C}\): it is the "smallest" category containing \(\mathcal{C}\) (via the Yoneda embedding) that has all small colimits. The co-Yoneda lemma (or density theorem) states that every presheaf \(F \in \hat{\mathcal{C}}\) is a canonical colimit of representable presheaves:

\[
F \cong \varinjlim_{(A, x) \in \mathcal{C}^{\mathrm{op}} \downarrow F} h^A.
\]
This says every presheaf is "built from" representable ones by taking colimits. Sheafification — the process of converting a presheaf into a sheaf — is the left adjoint to the inclusion of sheaves into presheaves, and it can be constructed as a left Kan extension (§7.9).
</div>

### 6.5 Kähler Differentials

The representability of the derivation functor provides an important application of the Yoneda lemma in commutative algebra.

<div class="definition">
<strong>Definition 6.10 (Derivation).</strong> Let \(k\) be a commutative ring, \(C\) a commutative \(k\)-algebra, and \(M\) a \(C\)-module. A <em>\(k\)-derivation</em> \(\delta : C \to M\) is a \(k\)-linear map satisfying the <em>Leibniz rule</em>: \(\delta(ab) = a\,\delta(b) + b\,\delta(a)\) for all \(a, b \in C\). The set \(\mathrm{Der}_k(C, M)\) of all \(k\)-derivations is a \(C\)-module (with pointwise operations).
</div>

<div class="theorem">
<strong>Theorem 6.11 (Representability of Derivations — Kähler Differentials).</strong> For each commutative \(k\)-algebra \(C\), there exists a \(C\)-module \(\Omega_{C/k}\) (the <em>module of Kähler differentials</em>) and a universal \(k\)-derivation \(d : C \to \Omega_{C/k}\) such that for every \(C\)-module \(M\),

\[
\mathrm{Hom}_C(\Omega_{C/k}, M) \cong \mathrm{Der}_k(C, M)
\]
naturally in \(M\). In other words, \(\mathrm{Der}_k(C, -)\) is represented by \(\Omega_{C/k}\).
</div>

<div class="proof">
<strong>Proof (Construction).</strong> Define \(\Omega_{C/k}\) to be the free \(C\)-module on symbols \(\{dc : c \in C\}\) modulo the relations: \(d(c_1 + c_2) = dc_1 + dc_2\), \(d(c_1 c_2) = c_1\,dc_2 + c_2\,dc_1\), and \(d(\lambda) = 0\) for \(\lambda \in k\). The universal derivation \(d : C \to \Omega_{C/k}\) is \(c \mapsto dc\). Given any derivation \(\delta : C \to M\), the map \(\tilde\delta : \Omega_{C/k} \to M\) defined by \(\tilde\delta(c\,dc') = c\,\delta(c')\) is the unique \(C\)-module map with \(\tilde\delta \circ d = \delta\). \(\square\)
</div>

<div class="example">
<strong>Example 6.12.</strong> For \(C = k[t]\) (polynomial ring in one variable), \(\Omega_{k[t]/k} = k[t]\,dt\) — a free \(k[t]\)-module of rank one, generated by \(dt\). The universal derivation is \(d : k[t] \to k[t]\,dt\), \(f(t) \mapsto f'(t)\,dt\) (formal differentiation). The identification \(\mathrm{Hom}_{k[t]}(\Omega_{k[t]/k}, M) \cong \mathrm{Der}_k(k[t], M)\) says: a \(k\)-derivation \(k[t] \to M\) is determined by the image of \(t\), i.e., by an element \(m \in M\), the "value of \(\delta t\)."
</div>

---

## Chapter 7: Limits and Colimits

Limits and colimits are the categorical generalizations of a vast array of constructions: products, fiber products, inverse limits, kernels, intersections on the limit side; and coproducts, pushouts, direct limits, cokernels, quotients on the colimit side. They provide a common framework for constructions involving "universal objects" satisfying "existence and uniqueness" conditions. The fundamental theme is that a limit is a terminal object in a category of cones (candidates for the universal object), and a colimit is an initial object in the dual category of cocones.

### 7.1 Initial and Terminal Objects

<div class="definition">
<strong>Definition 7.1 (Initial and Terminal Objects).</strong> An object \(I \in \mathrm{Ob}(\mathcal{C})\) is <em>initial</em> if for every \(X \in \mathrm{Ob}(\mathcal{C})\), there is exactly one morphism \(I \to X\). An object \(T \in \mathrm{Ob}(\mathcal{C})\) is <em>terminal</em> if for every \(X\), there is exactly one morphism \(X \to T\). An object that is both initial and terminal is called a <em>zero object</em>.
</div>

<div class="proposition">
<strong>Proposition 7.2.</strong> Initial and terminal objects, if they exist, are unique up to unique isomorphism.
</div>

<div class="proof">
<strong>Proof.</strong> If \(I\) and \(I'\) are both initial, there is a unique map \(f : I \to I'\) and a unique map \(g : I' \to I\). Then \(g \circ f : I \to I\) must equal \(\mathrm{id}_I\) (the unique map \(I \to I\)), and \(f \circ g = \mathrm{id}_{I'}\). So \(f\) is an isomorphism, and it is unique. \(\square\)
</div>

<div class="example">
<strong>Example 7.3.</strong>
<ul>
<li>In <strong>Set</strong>: \(\emptyset\) is the initial object (there is a unique function from the empty set to any set, namely the empty function), and any singleton \(\{*\}\) is terminal.</li>
<li>In <strong>Grp</strong>: the trivial group \(\{e\}\) is both initial and terminal (a zero object). The unique group homomorphism between any two groups factors through the trivial group.</li>
<li>In <strong>Ab</strong> and <em>R</em><strong>-Mod</strong>: the zero module \(0\) is a zero object.</li>
<li>In <strong>Ring</strong> (unital): \(\mathbb{Z}\) is the initial ring (there is a unique ring homomorphism \(\mathbb{Z} \to R\), sending \(n\) to \(n \cdot 1_R\)), and the zero ring \(0\) (in which \(0 = 1\)) is the terminal ring.</li>
<li>In <strong>Field</strong> (non-zero fields): there is no initial or terminal object, because there are no ring homomorphisms between fields of different characteristics.</li>
</ul>
</div>

When a category has a zero object \(0\), one defines the <em>zero morphism</em> \(0_{A,B} : A \to B\) as the composite \(A \to 0 \to B\). In categories with zero morphisms (preadditive categories), one can define kernels and cokernels as equalizers and coequalizers with the zero morphism, recovering the familiar algebraic notion.

### 7.2 Products and Coproducts

<div class="definition">
<strong>Definition 7.4 (Product).</strong> Let \(\{A_i\}_{i \in I}\) be a family of objects in \(\mathcal{C}\). A <em>product</em> of this family is an object \(\prod_{i \in I} A_i\) together with morphisms \(p_j : \prod_{i \in I} A_i \to A_j\) (called <em>projections</em>) satisfying the universal property: for every object \(X\) and family of morphisms \(f_j : X \to A_j\), there is a unique morphism \(\langle f_j \rangle : X \to \prod_{i \in I} A_i\) with \(p_j \circ \langle f_j \rangle = f_j\) for all \(j \in I\).

Dually, a <em>coproduct</em> \(\coprod_{i \in I} A_i\) has injections \(\iota_j : A_j \to \coprod_{i \in I} A_i\) with the dual universal property: every family \(\{f_j : A_j \to X\}\) factors uniquely through the coproduct.
</div>

<div class="example">
<strong>Example 7.5 (Products and Coproducts in Familiar Categories).</strong>
<table>
<thead><tr><th>Category</th><th>Product</th><th>Coproduct</th></tr></thead>
<tbody>
<tr><td><strong>Set</strong></td><td>Cartesian product \(A \times B\)</td><td>Disjoint union \(A \sqcup B\)</td></tr>
<tr><td><strong>Grp</strong></td><td>Direct product \(G \times H\)</td><td>Free product \(G * H\)</td></tr>
<tr><td><strong>Ab</strong></td><td>Direct product \(A \times B\)</td><td>Direct sum \(A \oplus B\) (finite)</td></tr>
<tr><td><em>R</em><strong>-Mod</strong></td><td>Direct product \(\prod M_i\)</td><td>Direct sum \(\bigoplus M_i\)</td></tr>
<tr><td><strong>Top</strong></td><td>Product topology</td><td>Disjoint union (coproduct topology)</td></tr>
<tr><td><strong>Ring</strong></td><td>Direct product \(R \times S\)</td><td>Tensor product \(R \otimes_\mathbb{Z} S\)</td></tr>
</tbody>
</table>
Note the striking divergence in the group case: the coproduct in <strong>Ab</strong> is the direct sum (finite) but the coproduct in <strong>Grp</strong> is the free product (much larger). This reflects the fact that in <strong>Ab</strong>, commutativity forces the coproduct to collapse to the direct sum; in <strong>Grp</strong>, the free product encodes all possible non-commutative interactions of the two groups.
</div>

### 7.3 Equalizers and Coequalizers

<div class="definition">
<strong>Definition 7.6 (Equalizer and Coequalizer).</strong> Let \(f, g : A \rightrightarrows B\) be a parallel pair of morphisms. An <em>equalizer</em> of \((f, g)\) is an object \(E\) and a morphism \(e : E \to A\) such that \(f \circ e = g \circ e\), universal with this property: for any \(h : X \to A\) with \(f \circ h = g \circ h\), there is a unique \(\bar{h} : X \to E\) with \(e \circ \bar{h} = h\).

A <em>coequalizer</em> of \((f, g)\) is an object \(Q\) and a morphism \(q : B \to Q\) with \(q \circ f = q \circ g\), universal with this property.

In a category with zero objects, the equalizer of \(f\) and \(0_{A,B}\) is called the <em>kernel</em> of \(f\) (written \(\ker f \to A\)), and the coequalizer of \(f\) and \(0_{A,B}\) is the <em>cokernel</em> of \(f\) (written \(B \to \mathrm{coker}\,f\)).
</div>

<div class="example">
<strong>Example 7.7.</strong> In <em>R</em><strong>-Mod</strong>, the equalizer of \(f, g : M \to N\) is the submodule \(\ker(f - g) = \{m \in M : f(m) = g(m)\} \subseteq M\). The kernel of \(f : M \to N\) (i.e., the equalizer of \(f\) and the zero map) is the usual kernel \(\ker f = f^{-1}(0)\). The coequalizer of \(f\) and \(g\) is \(N / \mathrm{im}(f - g)\); the cokernel of \(f\) is \(N / \mathrm{im}(f)\).
</div>

### 7.4 Pullbacks and Pushouts

<div class="definition">
<strong>Definition 7.8 (Pullback and Pushout).</strong> Given morphisms \(f : A \to C\) and \(g : B \to C\), the <em>pullback</em> (fiber product) \(A \times_C B\) is the universal object equipped with morphisms \(p_A : A \times_C B \to A\) and \(p_B : A \times_C B \to B\) with \(f \circ p_A = g \circ p_B\).

Given morphisms \(f : C \to A\) and \(g : C \to B\), the <em>pushout</em> (amalgamated sum) \(A \sqcup_C B\) is the universal object with morphisms \(\iota_A : A \to A \sqcup_C B\) and \(\iota_B : B \to A \sqcup_C B\) with \(\iota_A \circ f = \iota_B \circ g\).
</div>

<div class="example">
<strong>Example 7.9 (Pullbacks and Pushouts).</strong>
<ul>
<li>In <strong>Set</strong>: \(A \times_C B = \{(a, b) \in A \times B : f(a) = g(b)\}\) (fiber product of sets).</li>
<li>In <em>R</em><strong>-Mod</strong>: \(A \times_C B = \{(a, b) \in A \oplus B : f(a) = g(b)\}\) and \(A \sqcup_C B = (A \oplus B)/\langle f(c) - g(c) : c \in C\rangle\).</li>
<li>In <strong>Top</strong>: Pullbacks are fiber products with the subspace topology; pushouts include adjunction spaces (attaching cells) — the basic construction of CW complexes.</li>
<li>In <strong>CRing</strong>: \(A \sqcup_C B = A \otimes_C B\) (the tensor product over \(C\)) — the categorical pushout corresponds to the algebraic tensor product. In geometry, \(\mathrm{Spec}(A \otimes_C B) = \mathrm{Spec}(A) \times_{\mathrm{Spec}(C)} \mathrm{Spec}(B)\) (fiber product of affine schemes).</li>
</ul>
</div>

### 7.5 General Limits and Colimits

<div class="definition">
<strong>Definition 7.10 (Diagram, Cone, Limit).</strong> Let \(\mathcal{J}\) be a small category (the <em>index category</em> or <em>diagram shape</em>) and \(\mathcal{C}\) a category. A <em>diagram of shape \(\mathcal{J}\)</em> in \(\mathcal{C}\) is a functor \(D : \mathcal{J} \to \mathcal{C}\).

A <em>cone</em> over \(D\) with <em>apex} \(N\) is an object \(N \in \mathrm{Ob}(\mathcal{C})\) together with morphisms \(\varphi_j : N \to D(j)\) for each \(j \in \mathrm{Ob}(\mathcal{J})\), such that for every morphism \(u : j \to j'\) in \(\mathcal{J}\), the triangle \(D(u) \circ \varphi_j = \varphi_{j'}\) commutes.

The <em>limit</em> (or <em>inverse limit</em>) \(\varprojlim D\) is a terminal cone: a cone \((L, \{\lambda_j\})\) through which every other cone factors uniquely. The <em>colimit</em> (or <em>direct limit</em>) \(\varinjlim D\) is an initial cocone.
</div>

Products are limits over the discrete diagram \(\mathcal{J}\) with objects \(\{i\}_{i \in I}\) and no non-identity morphisms. Equalizers are limits over the diagram \(\bullet \rightrightarrows \bullet\). Pullbacks are limits over the diagram \(\bullet \to \bullet \leftarrow \bullet\). The following theorem shows these are essentially the only cases.

<div class="theorem">
<strong>Theorem 7.11 (Limits from Products and Equalizers).</strong> A category \(\mathcal{C}\) has all small limits if and only if it has all small products and all equalizers. Dually, \(\mathcal{C}\) has all small colimits if and only if it has all small coproducts and all coequalizers.
</div>

<div class="proof">
<strong>Proof (Sketch).</strong> Given a diagram \(D : \mathcal{J} \to \mathcal{C}\), construct the limit as the equalizer of two maps between products:

\[
\varprojlim D = \mathrm{Eq}\left(\prod_{j \in \mathrm{Ob}(\mathcal{J})} D(j) \rightrightarrows \prod_{u \in \mathrm{Mor}(\mathcal{J})} D(\mathrm{cod}(u))\right)
\]
where the two parallel maps send a cone \((x_j)_{j \in \mathrm{Ob}(\mathcal{J})}\) to either \((D(u)(x_{\mathrm{dom}(u)}))_u\) or \((x_{\mathrm{cod}(u)})_u\). Their equalizer is exactly the set of compatible families, which is the limit. \(\square\)
</div>

<div class="definition">
<strong>Definition 7.12 (Complete and Cocomplete).</strong> A category is <em>complete</em> if all small limits exist, and <em>cocomplete</em> if all small colimits exist. A category that is both complete and cocomplete is <em>bicomplete</em>.
</div>

<div class="example">
<strong>Example 7.13.</strong> The categories <strong>Set</strong>, <strong>Grp</strong>, <strong>Ab</strong>, <em>R</em><strong>-Mod</strong>, <strong>Top</strong>, and <strong>Cat</strong> are all bicomplete. The category of fields is neither complete nor cocomplete (no products or coproducts in general). The category of free abelian groups has products but not all coequalizers (quotients of free abelian groups need not be free).
</div>

### 7.6 Filtered Colimits and the Govorov-Lazard Theorem

<div class="definition">
<strong>Definition 7.14 (Filtered Category).</strong> A small category \(\mathcal{J}\) is <em>filtered</em> (or <em>directed</em>) if:
<ol>
<li><em>Non-empty</em>: \(\mathcal{J}\) has at least one object.</li>
<li><em>Bounded above</em>: For any two objects \(j, k \in \mathcal{J}\), there exists an object \(l\) and morphisms \(j \to l\) and \(k \to l\).</li>
<li><em>Equalization</em>: For any two parallel morphisms \(f, g : j \rightrightarrows k\), there exists a morphism \(h : k \to l\) with \(h \circ f = h \circ g\).</li>
</ol>
A <em>filtered colimit</em> is a colimit over a filtered category.
</div>

The classical example of a filtered colimit is the direct limit of a directed system of modules: \(M_1 \to M_2 \to M_3 \to \cdots\), with colimit \(\varinjlim M_n = \bigoplus_n M_n / \sim\) where \(m_i \sim f_i(m_i)\) for the transition maps \(f_i : M_i \to M_{i+1}\).

Filtered colimits are important because they commute with finite limits in the category of sets (and in module categories), unlike general colimits. This property is the key technical ingredient in the Govorov-Lazard theorem.

<div class="theorem">
<strong>Theorem 7.15 (Govorov-Lazard).</strong> An \(R\)-module \(M\) is flat if and only if it is a filtered colimit of finitely generated free \(R\)-modules.
</div>

<div class="proof">
<strong>Proof (Sketch of "if" direction).</strong> Filtered colimits of flat modules are flat (since flatness is preserved by filtered colimits, as tensor product commutes with filtered colimits, and a filtered colimit of flat modules is flat because each \(M_i \otimes_R -\) is exact and filtered colimits preserve exactness). Free modules are flat, so filtered colimits of free modules are flat.

For the "only if" direction, given a flat module \(M\), one constructs the category \(\mathcal{J}_M\) of all finitely generated free modules mapping to \(M\) (with morphisms the commuting triangles). This is a filtered category (by the flatness of \(M\) and the fact that finitely generated free modules over a ring form a filtered system), and the colimit of the diagram \(\mathcal{J}_M \to R\text{-}\mathbf{Mod}\) (sending each free module to itself) is \(M\). \(\square\)
</div>

The Govorov-Lazard theorem has a beautiful geometric interpretation: a module is flat (the tensor product with it is exact) exactly when it can be "approximated" by free modules in a directed (colimit) sense. In algebraic geometry, a morphism of schemes is flat precisely when the corresponding sheaves are flat modules, and this "local freeness up to a filtered colimit" is the algebro-geometric content of flatness.

### 7.7 RAPL and LAPC: Proof

<div class="theorem">
<strong>Theorem 7.16 (Right Adjoints Preserve Limits).</strong> If \(F \dashv G\) and \(D : \mathcal{J} \to \mathcal{D}\) is a diagram with limit \(\varprojlim D\) in \(\mathcal{D}\), then \(G(\varprojlim D) \cong \varprojlim (G \circ D)\) in \(\mathcal{C}\).
</div>

<div class="proof">
<strong>Proof.</strong> We show that \(G(L)\) (where \(L = \varprojlim D\) with cone \(\lambda_j : L \to D(j)\)) is a limit cone for \(G \circ D\). A cone over \(G \circ D\) with apex \(X\) consists of morphisms \(\mu_j : X \to G(D(j))\) satisfying the naturality conditions. By the adjunction bijection, each \(\mu_j\) corresponds to \(\tilde\mu_j : F(X) \to D(j)\). The naturality of \(\mu_j\) translates into: \(\{\tilde\mu_j\}\) is a cone over \(D\) from \(F(X)\). By the universal property of \(L\), there is a unique map \(\tilde\mu : F(X) \to L\) with \(\lambda_j \circ \tilde\mu = \tilde\mu_j\). By adjunction, \(\tilde\mu\) corresponds to a unique map \(\mu : X \to G(L)\) with \(G(\lambda_j) \circ \mu = \mu_j\). This is the required factorization, and uniqueness follows from the bijectivity of the adjunction. \(\square\)
</div>

The dual statement — left adjoints preserve colimits — follows by applying the RAPL theorem to the opposite categories. As immediate corollaries: the forgetful functor \(\mathbf{Grp} \to \mathbf{Set}\) (right adjoint to the free group functor) preserves all limits; tensor product \(- \otimes_R N\) (left adjoint to \(\mathrm{Hom}_R(N, -)\)) preserves all colimits; the free group functor \(\mathbf{Set} \to \mathbf{Grp}\) (left adjoint to the forgetful functor) preserves all colimits but not limits.

### 7.8 Kan Extensions

Kan extensions are the most general limit/colimit-type construction in category theory. Introduced by Daniel Kan in 1958, they generalize both limits and colimits, and Mac Lane's famous dictum is: "All concepts are Kan extensions."

<div class="definition">
<strong>Definition 7.17 (Kan Extension).</strong> Let \(K : \mathcal{C} \to \mathcal{D}\) and \(F : \mathcal{C} \to \mathcal{E}\) be functors. The <em>left Kan extension</em> \(\mathrm{Lan}_K F : \mathcal{D} \to \mathcal{E}\) (if it exists) is the functor that is "left adjoint to restriction along \(K\)": there is a natural bijection

\[
\mathrm{Nat}(\mathrm{Lan}_K F, G) \cong \mathrm{Nat}(F, G \circ K)
\]
for all \(G : \mathcal{D} \to \mathcal{E}\), together with a universal natural transformation \(\eta : F \Rightarrow (\mathrm{Lan}_K F) \circ K\). The <em>right Kan extension</em> \(\mathrm{Ran}_K F\) is defined dually.
</div>

When \(\mathcal{E}\) is cocomplete and \(\mathcal{C}\) is small, the left Kan extension exists and is computed by the <em>coend formula</em>:

\[
(\mathrm{Lan}_K F)(d) = \varinjlim_{(c, K(c) \to d) \in K \downarrow d} F(c).
\]
This is a colimit over the comma category \(K \downarrow d\) (whose objects are pairs \((c, u)\) with \(c \in \mathcal{C}\) and \(u : K(c) \to d\) in \(\mathcal{D}\)).

<div class="example">
<strong>Example 7.18 (Limits and Colimits as Kan Extensions).</strong> Let \(K : \mathcal{J} \to \mathbf{1}\) be the unique functor from a small category to the terminal category (one object, one morphism). Then \(\mathrm{Lan}_K F\) is the colimit of \(F\), and \(\mathrm{Ran}_K F\) is the limit of \(F\). This makes precise the sense in which Kan extensions generalize limits and colimits.
</div>

<div class="example">
<strong>Example 7.19 (Sheafification as a Kan Extension).</strong> Let \(\mathbf{y} : \mathcal{C} \to \hat{\mathcal{C}}\) be the Yoneda embedding and \(F : \mathcal{C} \to \mathcal{D}\) any functor with \(\mathcal{D}\) cocomplete. The left Kan extension \(\mathrm{Lan}_{\mathbf{y}} F : \hat{\mathcal{C}} \to \mathcal{D}\) is the unique cocontinuous functor extending \(F\) along \(\mathbf{y}\). This universal property characterizes the presheaf category as the "free cocompletion" of \(\mathcal{C}\): any functor from \(\mathcal{C}\) to a cocomplete category extends uniquely (up to natural isomorphism) to a cocontinuous functor from \(\hat{\mathcal{C}}\). Sheafification — converting a presheaf to a sheaf — is an example of a left Kan extension along the inclusion of representable presheaves.
</div>

---

## Chapter 8: Monoidal Categories and Enriched Categories

This chapter introduces the notion of a monoidal category — a category with a "tensor product" operation satisfying certain coherence conditions — and the related concept of enrichment, which allows hom-sets to be replaced by "hom-objects" valued in a monoidal category. These structures provide the natural home for the tensor-Hom adjunction, for chain complexes, and for the abstract framework underlying both homological algebra and homotopy theory.

### 8.1 Monoidal Categories

<div class="definition">
<strong>Definition 8.1 (Monoidal Category).</strong> A <em>monoidal category</em> is a tuple \((\mathcal{C}, \otimes, I, \alpha, \lambda, \rho)\) where:
<ul>
<li>\(\mathcal{C}\) is a category, \(\otimes : \mathcal{C} \times \mathcal{C} \to \mathcal{C}\) is a functor (the <em>tensor product</em>), and \(I \in \mathrm{Ob}(\mathcal{C})\) is the <em>unit object</em>.</li>
<li>\(\alpha_{A,B,C} : (A \otimes B) \otimes C \xrightarrow{\sim} A \otimes (B \otimes C)\) is a natural isomorphism (<em>associator</em>).</li>
<li>\(\lambda_A : I \otimes A \xrightarrow{\sim} A\) and \(\rho_A : A \otimes I \xrightarrow{\sim} A\) are natural isomorphisms (<em>left and right unitors</em>).</li>
</ul>
These must satisfy Mac Lane's <em>coherence conditions</em>: the pentagon axiom (compatibility of the associator with itself) and the triangle axiom (compatibility of the associator with the unitors). A monoidal category is <em>strict</em> if \(\alpha\), \(\lambda\), and \(\rho\) are all identity transformations.
</div>

<div class="theorem">
<strong>Theorem 8.2 (Mac Lane's Coherence Theorem).</strong> Every monoidal category is monoidally equivalent to a strict monoidal category: one in which the associator and unitors are all identities.
</div>

The coherence theorem means we can write tensor products of many objects unambiguously without parentheses, since all "legal" bracketings are related by canonical isomorphisms.

<div class="example">
<strong>Example 8.3 (Examples of Monoidal Categories).</strong>
<ul>
<li>\((\mathbf{Set}, \times, \{*\})\): the Cartesian product of sets, with the singleton as unit.</li>
<li>\((\mathbf{Ab}, \otimes_\mathbb{Z}, \mathbb{Z})\): tensor product of abelian groups, with \(\mathbb{Z}\) as unit.</li>
<li>\((R\text{-}\mathbf{Mod}, \otimes_R, R)\): tensor product of \(R\)-modules, with \(R\) as unit. When \(R\) is commutative, this is a symmetric monoidal category.</li>
<li>\((\mathbf{Vect}_k, \otimes_k, k)\): tensor product of vector spaces.</li>
<li>\((\mathbf{Ch}(R), \otimes, R[0])\): the category of chain complexes of \(R\)-modules, with the tensor product of complexes \((A \otimes B)_n = \bigoplus_{p+q=n} A_p \otimes_R B_q\) and differential \(d(a \otimes b) = da \otimes b + (-1)^{|a|} a \otimes db\) (the Koszul sign rule). The unit is \(R\) concentrated in degree 0.</li>
<li>\((\mathbf{Cat}, \times, \mathbf{1})\): the product of small categories, with the category with one object as unit.</li>
</ul>
</div>

<div class="definition">
<strong>Definition 8.4 (Symmetric Monoidal Category).</strong> A monoidal category \((\mathcal{C}, \otimes, I)\) is <em>symmetric</em> if there is a natural isomorphism \(\sigma_{A,B} : A \otimes B \xrightarrow{\sim} B \otimes A\) (the <em>symmetry</em> or <em>braiding</em>) satisfying \(\sigma_{B,A} \circ \sigma_{A,B} = \mathrm{id}_{A \otimes B}\) and the hexagon coherence axioms.
</div>

The categories of sets, abelian groups, \(R\)-modules (for commutative \(R\)), and chain complexes are all symmetric monoidal. The category of representations of a group \(G\) over a field is symmetric monoidal (under tensor product), and this monoidal structure is the basis for the theory of symmetric and exterior products in representation theory.

### 8.2 Closed Monoidal Categories

<div class="definition">
<strong>Definition 8.5 (Closed Monoidal Category).</strong> A monoidal category \((\mathcal{C}, \otimes, I)\) is <em>(left) closed</em> if for each object \(B\), the functor \(- \otimes B : \mathcal{C} \to \mathcal{C}\) has a right adjoint, written \([B, -]\) or \(\underline{\mathrm{Hom}}(B, -)\):

\[
\mathrm{Hom}_\mathcal{C}(A \otimes B, C) \cong \mathrm{Hom}_\mathcal{C}(A, [B, C]).
\]
The object \([B, C]\) is called the <em>internal Hom</em> from \(B\) to \(C\).
</div>

<div class="example">
<strong>Example 8.6 (Closed Monoidal Categories).</strong>
<ul>
<li>\((\mathbf{Set}, \times, \{*\})\) is Cartesian closed: \([B, C] = \mathrm{Hom}_{\mathbf{Set}}(B, C)\) is the set of functions from \(B\) to \(C\), and the adjunction is the classical "currying" bijection \(\mathrm{Hom}(A \times B, C) \cong \mathrm{Hom}(A, C^B)\).</li>
<li>\((R\text{-}\mathbf{Mod}, \otimes_R, R)\) is closed: \([N, P] = \mathrm{Hom}_R(N, P)\), and the adjunction is the Tensor-Hom adjunction (Theorem 5.9).</li>
<li>\((\mathbf{Cat}, \times, \mathbf{1})\) is Cartesian closed: \([\mathcal{C}, \mathcal{D}] = \mathrm{Fun}(\mathcal{C}, \mathcal{D})\) is the functor category.</li>
</ul>
The simply-typed lambda calculus is the "internal language" of a Cartesian closed category (the Lambek-Scott correspondence): types correspond to objects, terms to morphisms, and the lambda abstraction corresponds to the currying adjunction.
</div>

### 8.3 Enriched Categories

The concept of enriched categories replaces the hom-sets of an ordinary category by objects in some monoidal category \(\mathcal{V}\), called the "enriching category." This generalization is essential for understanding the abstract structure of homological algebra.

<div class="definition">
<strong>Definition 8.7 (Enriched Category).</strong> Let \((\mathcal{V}, \otimes, I)\) be a monoidal category. A <em>\(\mathcal{V}\)-enriched category</em> (or <em>category enriched over \(\mathcal{V}\)</em>) \(\mathcal{C}\) consists of:
<ul>
<li>A class of objects \(\mathrm{Ob}(\mathcal{C})\).</li>
<li>For each pair \(A, B\), an object \(\mathcal{C}(A, B) \in \mathrm{Ob}(\mathcal{V})\) (the "hom-object").</li>
<li>Composition morphisms \(\circ_{A,B,C} : \mathcal{C}(B, C) \otimes \mathcal{C}(A, B) \to \mathcal{C}(A, C)\) in \(\mathcal{V}\).</li>
<li>Identity morphisms \(i_A : I \to \mathcal{C}(A, A)\) in \(\mathcal{V}\).</li>
</ul>
These must satisfy associativity and unit axioms in \(\mathcal{V}\).
</div>

<div class="example">
<strong>Example 8.8 (Examples of Enriched Categories).</strong>
<ul>
<li>A <strong>Set</strong>-enriched category is an ordinary category.</li>
<li>An <strong>Ab</strong>-enriched category (hom-groups are abelian groups, composition is bilinear) is precisely a <em>preadditive category</em> — the starting point of Chapter 9's development of abelian categories.</li>
<li>A <strong>Ch</strong>\((R)\)-enriched category (hom-objects are chain complexes, composition respects the differential) is a <em>differential graded (dg) category</em>. The derived category \(\mathbf{D}(R)\) of chain complexes is most naturally understood as a dg-category; this is the modern perspective on homological algebra initiated by Bondal-Kapranov (1990) and Keller (1994).</li>
<li>A <strong>Cat</strong>-enriched category (hom-objects are categories, composition involves functors) is a (strict) 2-category.</li>
</ul>
</div>

<div class="remark">
<strong>Remark 8.9 (Enrichment and Modern Homological Algebra).</strong> The shift from "categories with hom-sets" to "categories with hom-objects" is the conceptual leap that underlies modern developments in homological algebra and algebraic geometry. The derived category \(\mathbf{D}(R)\) is properly understood as a triangulated category (a shadow of its dg-category structure), and the "correct" framework for derived algebraic geometry (Lurie, Toën-Vezzosi) is that of \(\infty\)-categories (also called quasi-categories or \((\infty,1)\)-categories), where hom-objects are simplicial sets encoding all higher homotopical information. The ordinary homological algebra developed in the remaining chapters of these notes is the "strict" or "1-categorical" approximation to this richer structure.
</div>

# Part II: Abelian Categories and Module Theory

The transition from abstract category theory to homological algebra passes through the concept of an *abelian category*. In Part I, we studied categories in great generality — morphisms between objects, without any algebraic structure on the hom-sets themselves. In Part II, we specialize dramatically: we require that hom-sets carry the structure of abelian groups (compatible with composition), that kernels and cokernels exist, and that a certain exactness condition holds that makes diagram-chasing valid. The resulting structure — an abelian category — is the natural habitat for all of homological algebra.

The historical development of abelian categories is itself a beautiful story. Buchsbaum (1955) and Grothendieck (1957) axiomatized the properties of categories of modules and sheaves that are needed to do homological algebra, extracting the essential features and discarding all that is inessential. The payoff was twofold: first, proofs about modules became proofs about all abelian categories simultaneously (including sheaves on topological spaces, representations of quivers, categories of filtered modules, and many more); second, and more profoundly, the abstract framework clarified *why* homological algebra works, reducing it to a few simple axioms from which everything else flows by pure categorical reasoning.

## Chapter 9: Abelian Categories

### 9.1 Preadditive and Additive Categories

We build up the structure of an abelian category in stages. The first stage is to require that hom-sets carry abelian group structure compatible with composition — this is the notion of a *preadditive* category, also called an **Ab**-enriched category (as discussed briefly in §8.3).

<div class="definition">
<strong>Definition 9.1 (Preadditive Category).</strong> A category \(\mathcal{A}\) is <em>preadditive</em> (or <em>\(\mathbf{Ab}\)-enriched</em>) if:
<ul>
<li>For each pair of objects \(A, B\), the hom-set \(\mathrm{Hom}_\mathcal{A}(A, B)\) carries the structure of an abelian group (written additively).</li>
<li>Composition is bilinear: for \(f, g \in \mathrm{Hom}(A, B)\) and \(h \in \mathrm{Hom}(B, C)\) and \(k \in \mathrm{Hom}(C', A)\), we have \(h \circ (f + g) = h \circ f + h \circ g\) and \((f + g) \circ k = f \circ k + g \circ k\).</li>
</ul>
The zero element of \(\mathrm{Hom}(A, B)\) is written \(0_{A,B}\) or simply \(0\).
</div>

In a preadditive category, there is a distinguished "zero morphism" \(0_{A,B} : A \to B\) for every pair of objects. These zero morphisms are compatible in the sense that \(f \circ 0 = 0\) and \(0 \circ g = 0\) for composable morphisms \(f, g\). This is the categorical analogue of the fact that composing with the zero map yields the zero map.

The presence of a zero object strengthens the structure considerably. Recall from §7.1 that a zero object \(\mathbf{0}\) is an object that is both initial and terminal; the zero morphism \(0_{A,B} : A \to B\) then factors as \(A \to \mathbf{0} \to B\). In any preadditive category with a zero object, the zero morphisms are precisely these factorizations through \(\mathbf{0}\).

<div class="definition">
<strong>Definition 9.2 (Additive Category).</strong> A preadditive category \(\mathcal{A}\) is <em>additive</em> if it has a zero object and if every finite collection of objects has a biproduct. The <em>biproduct</em> (or <em>direct sum</em>) \(A \oplus B\) of two objects comes equipped with morphisms

\[
A \xrightarrow{i_1} A \oplus B \xleftarrow{i_2} B \quad \text{and} \quad A \xleftarrow{p_1} A \oplus B \xrightarrow{p_2} B
\]
satisfying \(p_j \circ i_j = \mathrm{id}\) and \(p_j \circ i_k = 0\) for \(j \neq k\), and \(i_1 \circ p_1 + i_2 \circ p_2 = \mathrm{id}_{A \oplus B}\).
</div>

The biproduct \(A \oplus B\) is simultaneously a product (via \(p_1, p_2\)) and a coproduct (via \(i_1, i_2\)) — this unification of product and coproduct is a purely additive phenomenon. In **Set**, products and coproducts differ (one is Cartesian product, the other is disjoint union). In **Ab** or \(R\text{-}\mathbf{Mod}\), the direct sum \(M \oplus N\) serves as both the product and the coproduct in the additive sense, because the category is enriched over abelian groups.

<div class="example">
<strong>Example 9.3 (Additive Categories).</strong>
<ul>
<li>The category \(R\text{-}\mathbf{Mod}\) of left \(R\)-modules is additive: the abelian group structure on \(\mathrm{Hom}_R(M, N)\) is pointwise addition of homomorphisms, and the direct sum \(M \oplus N\) is the biproduct.</li>
<li>The category \(\mathbf{Ab}\) of abelian groups is additive (a special case of \(\mathbb{Z}\text{-}\mathbf{Mod}\)).</li>
<li>The category \(\mathbf{Vect}_k\) of vector spaces over a field \(k\) is additive.</li>
<li>The category of finitely generated free \(\mathbb{Z}\)-modules is additive (it is the full subcategory of \(\mathbf{Ab}\) on free abelian groups of finite rank). This example is important because it is additive but not abelian.</li>
<li>The category \(\mathbf{Ch}(R)\) of chain complexes of \(R\)-modules is additive; the direct sum of complexes is computed degreewise.</li>
</ul>
</div>

### 9.2 Kernels, Cokernels, Images, and Coimages

In an additive category, we can ask for kernels and cokernels — categorical versions of the familiar notions from linear algebra. These generalize the concepts from §7.3 (equalizers and coequalizers) in the presence of the additive structure: the kernel of \(f : A \to B\) is the equalizer of \(f\) and \(0_{A,B}\).

<div class="definition">
<strong>Definition 9.4 (Kernel and Cokernel).</strong> Let \(\mathcal{A}\) be a preadditive category and \(f : A \to B\) a morphism.
<ul>
<li>The <em>kernel</em> of \(f\) is a morphism \(\ker f : K \to A\) such that \(f \circ \ker f = 0\), universal with this property: for any \(g : X \to A\) with \(f \circ g = 0\), there is a unique \(\bar{g} : X \to K\) with \(\ker f \circ \bar{g} = g\).</li>
<li>The <em>cokernel</em> of \(f\) is a morphism \(\mathrm{coker}\, f : B \to C\) such that \(\mathrm{coker}\, f \circ f = 0\), universal with this property: for any \(h : B \to Y\) with \(h \circ f = 0\), there is a unique \(\bar{h} : C \to Y\) with \(\bar{h} \circ \mathrm{coker}\, f = h\).</li>
</ul>
When they exist, kernels and cokernels are unique up to isomorphism.
</div>

In \(R\text{-}\mathbf{Mod}\), the kernel of \(f : M \to N\) is the submodule \(\{m \in M : f(m) = 0\} \hookrightarrow M\), and the cokernel is the quotient \(N / \mathrm{im}(f)\). These are the familiar notions. The image of \(f\) is \(\mathrm{im}(f) = \ker(\mathrm{coker}\, f)\) — the kernel of the cokernel of \(f\). Dually, the coimage is \(\mathrm{coim}(f) = \mathrm{coker}(\ker f)\) — the cokernel of the kernel of \(f\). There is always a canonical morphism \(\mathrm{coim}(f) \to \mathrm{im}(f)\), and the condition that this be an isomorphism is precisely what it means for a category to be abelian.

<div class="definition">
<strong>Definition 9.5 (Image and Coimage).</strong> Let \(\mathcal{A}\) be a preadditive category with kernels and cokernels, and let \(f : A \to B\).
<ul>
<li>The <em>image</em> of \(f\) is \(\mathrm{im}(f) := \ker(\mathrm{coker}\, f)\), a subobject of \(B\).</li>
<li>The <em>coimage</em> of \(f\) is \(\mathrm{coim}(f) := \mathrm{coker}(\ker f)\), a quotient of \(A\).</li>
</ul>
There is a canonical morphism \(\phi_f : \mathrm{coim}(f) \to \mathrm{im}(f)\) induced by the universal properties.
</div>

### 9.3 Abelian Categories: Definition and Examples

We now arrive at the central definition of this part of the course.

<div class="definition">
<strong>Definition 9.6 (Abelian Category).</strong> An additive category \(\mathcal{A}\) is <em>abelian</em> if:
<ol>
<li>Every morphism has a kernel and a cokernel.</li>
<li>Every monomorphism is a kernel (of its cokernel).</li>
<li>Every epimorphism is a cokernel (of its kernel).</li>
</ol>
Equivalently (and perhaps more elegantly), \(\mathcal{A}\) is abelian if it is additive and for every morphism \(f : A \to B\), the canonical map \(\phi_f : \mathrm{coim}(f) \xrightarrow{\sim} \mathrm{im}(f)\) is an isomorphism.
</div>

The equivalence of these formulations is a theorem (see Freyd's *Abelian Categories*, 1964). The condition that coimage equals image is the "First Isomorphism Theorem" at the categorical level: the image of \(f\) is isomorphic to \(A\) modulo the kernel of \(f\), just as in linear algebra or group theory.

The definition may look technical, but its consequences are enormous. In an abelian category, one can:
- Define short exact sequences \(0 \to A \to B \to C \to 0\).
- Perform diagram chases (the Snake Lemma, Five Lemma, etc.).
- Construct long exact sequences in homology.
- Define derived functors.

All of this machinery — the entire apparatus of homological algebra — is available in *any* abelian category, not just in \(R\text{-}\mathbf{Mod}\).

<div class="example">
<strong>Example 9.7 (Abelian Categories).</strong>
<ul>
<li>\(R\text{-}\mathbf{Mod}\) for any ring \(R\) (left modules) is abelian. This is the fundamental example; it is the model from which the axioms were extracted.</li>
<li>\(\mathbf{Ab} = \mathbb{Z}\text{-}\mathbf{Mod}\) is abelian.</li>
<li>\(\mathbf{Vect}_k\) for any field \(k\) is abelian. This is a particularly simple abelian category: every object is projective and injective, all short exact sequences split, and global dimension is 0.</li>
<li>The category \(\mathbf{Sh}(X, \mathbf{Ab})\) of sheaves of abelian groups on a topological space \(X\) is abelian. This was Grothendieck's primary motivation — sheaves of \(\mathcal{O}_X\)-modules on a scheme \(X\) are the context for algebraic geometry, and the abstract framework makes sheaf cohomology a special case of derived functor cohomology.</li>
<li>The category of representations \(\mathbf{Rep}_k(G)\) of a group \(G\) over a field \(k\) is abelian (it is equivalent to \(kG\text{-}\mathbf{Mod}\) for the group algebra \(kG\)).</li>
<li>The category of representations of a quiver \(Q\) (assignments of vector spaces to vertices and linear maps to arrows) is abelian. Gabriel's theorem (1972) classifies quivers of finite representation type.</li>
<li>The functor category \([\mathcal{C}^{op}, \mathbf{Ab}]\) of contravariant functors from any small category \(\mathcal{C}\) to \(\mathbf{Ab}\) is abelian. This encompasses all of the above examples via appropriate choices of \(\mathcal{C}\).</li>
</ul>
</div>

<div class="example">
<strong>Example 9.8 (Non-Examples of Abelian Categories).</strong>
<ul>
<li>The category \(\mathbf{Top}\) of topological spaces is not abelian — it is not even preadditive (there is no natural way to add continuous maps).</li>
<li>The category \(\mathbf{Grp}\) of all groups is not abelian — it is not preadditive since non-abelian groups do not admit addition of homomorphisms.</li>
<li>The full subcategory of \(\mathbf{Ab}\) on <em>free</em> abelian groups is additive but not abelian: the cokernel of \(\mathbb{Z} \xrightarrow{\times 2} \mathbb{Z}\) is \(\mathbb{Z}/2\mathbb{Z}\), which is not free.</li>
<li>The category of topological abelian groups (abelian groups with compatible topology) is additive and has kernels and cokernels, but is not abelian: the canonical map from coimage to image need not be an isomorphism. (A bijective continuous homomorphism of topological abelian groups need not be a homeomorphism.)</li>
</ul>
These non-examples illustrate how strong the abelian axioms are.
</div>

### 9.4 Exact Sequences

With the notion of kernel and image in hand, we can define exact sequences — the central tool of homological algebra.

<div class="definition">
<strong>Definition 9.9 (Exact Sequences).</strong> Let \(\mathcal{A}\) be an abelian category.
<ul>
<li>A sequence \(A \xrightarrow{f} B \xrightarrow{g} C\) is <em>exact at \(B\)</em> if \(\mathrm{im}(f) = \ker(g)\) (as subobjects of \(B\)).</li>
<li>A longer sequence \(\cdots \to A_{n+1} \xrightarrow{f_{n+1}} A_n \xrightarrow{f_n} A_{n-1} \to \cdots\) is <em>exact</em> if it is exact at every term (i.e., \(\mathrm{im}(f_{n+1}) = \ker(f_n)\) for all \(n\)).</li>
<li>A <em>short exact sequence</em> is an exact sequence of the form \(0 \to A \xrightarrow{f} B \xrightarrow{g} C \to 0\), meaning \(f\) is monic (injective), \(g\) is epic (surjective), and \(\mathrm{im}(f) = \ker(g)\).</li>
</ul>
</div>

In \(R\text{-}\mathbf{Mod}\), a short exact sequence \(0 \to A \to B \to C \to 0\) says that \(A\) embeds as a submodule of \(B\) and \(C \cong B/A\). Such sequences encode "extensions" of \(C\) by \(A\) — a theme that will be made precise in Chapter 16 via \(\mathrm{Ext}^1\).

<div class="definition">
<strong>Definition 9.10 (Left and Right Exact Functors).</strong> A (covariant) additive functor \(F : \mathcal{A} \to \mathcal{B}\) between abelian categories is:
<ul>
<li><em>Left exact</em> if for every short exact sequence \(0 \to A \to B \to C \to 0\) in \(\mathcal{A}\), the sequence \(0 \to FA \to FB \to FC\) is exact in \(\mathcal{B}\) (i.e., \(F\) preserves kernels).</li>
<li><em>Right exact</em> if \(FA \to FB \to FC \to 0\) is exact (i.e., \(F\) preserves cokernels).</li>
<li><em>Exact</em> if \(0 \to FA \to FB \to FC \to 0\) is exact.</li>
</ul>
For a contravariant functor \(F\), "left exact" means \(0 \to FC \to FB \to FA\) is exact.
</div>

The prototypical examples of these distinctions are the Hom functors and the tensor product, which we now state precisely. These were already discussed from the adjunction perspective in §5.4; here we state the exactness properties that will drive the need for derived functors in Part III.

<div class="theorem">
<strong>Theorem 9.11 (Exactness of Hom and Tensor).</strong> Let \(R\) be a ring and \(M\) a left \(R\)-module.
<ol>
<li>\(\mathrm{Hom}_R(M, -) : R\text{-}\mathbf{Mod} \to \mathbf{Ab}\) is left exact (covariant).</li>
<li>\(\mathrm{Hom}_R(-, M) : R\text{-}\mathbf{Mod}^{op} \to \mathbf{Ab}\) is left exact (contravariant).</li>
<li>If \(M\) is a right \(R\)-module, then \(M \otimes_R - : R\text{-}\mathbf{Mod} \to \mathbf{Ab}\) is right exact.</li>
</ol>
None of these functors is exact in general. The extent to which they fail to be exact is measured by \(\mathrm{Ext}\) (for Hom) and \(\mathrm{Tor}\) (for tensor), the derived functors constructed in Part III.
</div>

<div class="proof">
<strong>Proof.</strong> We prove (1); the others are analogous or dual. Let \(0 \to A \xrightarrow{f} B \xrightarrow{g} C \to 0\) be exact. Applying \(\mathrm{Hom}_R(M, -)\) gives:

\[
0 \to \mathrm{Hom}_R(M, A) \xrightarrow{f_*} \mathrm{Hom}_R(M, B) \xrightarrow{g_*} \mathrm{Hom}_R(M, C)
\]
where \(f_* (\phi) = f \circ \phi\) and \(g_* (\phi) = g \circ \phi\). 

<em>Injectivity of \(f_*\)</em>: If \(f_*(\phi) = f \circ \phi = 0\), then since \(f\) is monic, \(\phi = 0\).

<em>Exactness at \(\mathrm{Hom}(M,B)\)</em>: \(g_* \circ f_* = 0\) since \(g \circ f = 0\). Conversely, if \(g \circ \phi = 0\), then \(\mathrm{im}(\phi) \subseteq \ker(g) = \mathrm{im}(f)\), so \(\phi\) factors through \(f\) (since \(f\) is a kernel of \(g\)), giving \(\phi = f_*(\psi)\) for some \(\psi\).

That \(g_*\) need not be surjective is shown by the example \(0 \to \mathbb{Z} \xrightarrow{\times 2} \mathbb{Z} \to \mathbb{Z}/2 \to 0\) with \(M = \mathbb{Z}/2\): a homomorphism \(\mathbb{Z}/2 \to \mathbb{Z}/2\) cannot lift to a homomorphism \(\mathbb{Z}/2 \to \mathbb{Z}\) since \(\mathbb{Z}\) is torsion-free. \(\square\)
</div>

The failure of surjectivity in the proof above is exactly the first \(\mathrm{Ext}\) group: \(\mathrm{Ext}^1_\mathbb{Z}(\mathbb{Z}/2, \mathbb{Z}) \cong \mathbb{Z}/2 \neq 0\), as we will compute in §16.3.

<div class="remark">
<strong>Remark 9.12 (Flatness).</strong> A module \(M\) for which \(M \otimes_R -\) is <em>exact</em> (not merely right exact) is called <em>flat</em>. Free modules are flat, projective modules are flat, but the converse fails in general. Flat modules will be characterized by \(\mathrm{Tor}\) in §16.2: \(M\) is flat if and only if \(\mathrm{Tor}_1^R(M, N) = 0\) for all \(N\). The Govorov-Lazard theorem (§7.7) provides a geometric characterization: \(M\) is flat if and only if it is a filtered colimit of finitely generated free modules.
</div>

### 9.5 The Snake Lemma and the Five Lemma

The power of abelian categories manifests most vividly in the "diagram lemmas" — results that hold in every abelian category but whose proofs are most naturally given by *element-chasing* in \(R\text{-}\mathbf{Mod}\) (justified by Mitchell's Embedding Theorem in Chapter 10). We give full proofs here.

<div class="theorem">
<strong>Theorem 9.13 (The Snake Lemma).</strong> Let \(\mathcal{A}\) be an abelian category. Given a commutative diagram with exact rows:

\[
\begin{array}{ccccccccc}
 & & A & \xrightarrow{f} & B & \xrightarrow{g} & C & \to & 0 \\
 & & \downarrow {\scriptstyle \alpha} & & \downarrow {\scriptstyle \beta} & & \downarrow {\scriptstyle \gamma} & & \\
0 & \to & A' & \xrightarrow{f'} & B' & \xrightarrow{g'} & C' & &
\end{array}
\]
there is a natural exact sequence:

\[
\ker \alpha \to \ker \beta \to \ker \gamma \xrightarrow{\partial} \mathrm{coker}\, \alpha \to \mathrm{coker}\, \beta \to \mathrm{coker}\, \gamma
\]
where \(\partial\) is the <em>connecting homomorphism</em>. If moreover \(A \to B\) is monic and \(B' \to C'\) is epic, then the sequence extends to:

\[
0 \to \ker \alpha \to \ker \beta \to \ker \gamma \xrightarrow{\partial} \mathrm{coker}\, \alpha \to \mathrm{coker}\, \beta \to \mathrm{coker}\, \gamma \to 0.
\]
</div>

<div class="proof">
<strong>Proof (element-chase in \(R\text{-}\mathbf{Mod}\), valid in general by Mitchell's theorem).</strong> We define the connecting homomorphism \(\partial\) and verify exactness at each node.

<em>Construction of \(\partial\)</em>: Given \(c \in \ker \gamma \subseteq C\), since \(g : B \to C\) is surjective, pick \(b \in B\) with \(g(b) = c\). Since \(g'(\beta(b)) = \gamma(g(b)) = \gamma(c) = 0\), we have \(\beta(b) \in \ker(g') = \mathrm{im}(f')\). So there is a unique \(a' \in A'\) with \(f'(a') = \beta(b)\). Define \(\partial(c) := [a'] \in \mathrm{coker}\,\alpha = A'/\mathrm{im}(\alpha)\).

<em>Well-definedness</em>: If we chose \(b_1, b_2\) both mapping to \(c\), then \(b_1 - b_2 \in \ker g = \mathrm{im}(f)\), say \(b_1 - b_2 = f(a)\). Then \(\beta(b_1) - \beta(b_2) = \beta f(a) = f'\alpha(a)\), so the corresponding \(a'_1 - a'_2 = \alpha(a) \in \mathrm{im}(\alpha)\), and \([a'_1] = [a'_2]\) in \(\mathrm{coker}\,\alpha\).

<em>Exactness at \(\ker\gamma\)</em>: If \(c = g(b)\) with \(b \in \ker\beta\), then \(\beta(b) = 0\), so \(a' = 0\), so \(\partial(c) = 0\). Conversely, if \(\partial(c) = 0\), then the \(a'\) found above satisfies \(a' = \alpha(a)\) for some \(a \in A\). Then \(b - f(a)\) maps to \(c\) and satisfies \(\beta(b - f(a)) = \beta(b) - f'\alpha(a) = f'(a') - f'(a') = 0\).

The other exactness checks follow by similar element-chasing, which we leave to the reader. \(\square\)
</div>

The connecting homomorphism \(\partial\) is the fundamental mechanism by which short exact sequences give rise to long exact sequences in cohomology. We will exploit it systematically in Chapter 13.

<div class="theorem">
<strong>Theorem 9.14 (The Five Lemma).</strong> Given a commutative diagram with exact rows in an abelian category:

\[
\begin{array}{ccccccccccc}
A_1 & \to & A_2 & \to & A_3 & \to & A_4 & \to & A_5 \\
\downarrow {\scriptstyle f_1} & & \downarrow {\scriptstyle f_2} & & \downarrow {\scriptstyle f_3} & & \downarrow {\scriptstyle f_4} & & \downarrow {\scriptstyle f_5} \\
B_1 & \to & B_2 & \to & B_3 & \to & B_4 & \to & B_5
\end{array}
\]
If \(f_1\) is epic and \(f_2, f_4\) are isomorphisms and \(f_5\) is monic, then \(f_3\) is an isomorphism. More precisely:
<ul>
<li>(Short five lemma) If \(f_1\) is epic and \(f_2, f_4\) are isos, then \(f_3\) is epic.</li>
<li>If \(f_5\) is monic and \(f_2, f_4\) are isos, then \(f_3\) is monic.</li>
</ul>
</div>

<div class="proof">
<strong>Proof.</strong> By Mitchell's theorem (Chapter 10), it suffices to prove this in \(R\text{-}\mathbf{Mod}\) by element-chasing. We show \(f_3\) is injective (the surjectivity argument is dual).

Let \(a \in A_3\) with \(f_3(a) = 0\). Then the image of \(a\) in \(A_4\) maps to 0 in \(B_4\) (since \(f_4\) applied to it equals the image of \(f_3(a) = 0\)), so the image of \(a\) in \(A_4\) is zero (since \(f_4\) is injective). By exactness at \(A_4\), \(a\) maps from some \(a_2 \in A_2\). Then \(f_2(a_2)\) maps to 0 in \(B_3\) (since \(f_3(a) = 0\) and the square commutes), so by exactness at \(B_2\), \(f_2(a_2)\) is the image of some \(b_1 \in B_1\). Since \(f_1\) is surjective, write \(b_1 = f_1(a_1)\). The element \(a_2 - (\text{image of }a_1)\) in \(A_2\) maps to \(f_2(a_2) - f_2(\text{image of }a_1) = b_1 - b_1 = 0\) under \(f_2\), so since \(f_2\) is injective, \(a_2\) is the image of \(a_1 \in A_1\). But then \(a\) is the image of \(a_2\), which is 0 in \(A_3\) by exactness. Thus \(a = 0\). \(\square\)
</div>

<div class="remark">
<strong>Remark 9.15 (Other Diagram Lemmas).</strong> The abelian category framework supports many more diagram lemmas. The <em>3×3 lemma</em> (or Nine Lemma) states that in a commutative diagram of three short exact sequences arranged vertically, if two of the three rows are exact and the columns are exact, then the third row is also exact. The <em>horseshoe lemma</em> (§14.4) will be essential for constructing resolutions from short exact sequences. All of these follow from the snake lemma and the axioms of an abelian category.
</div>

## Chapter 10: Mitchell's Embedding Theorem

### 10.1 Statement of the Theorem

The fundamental question after defining abelian categories is: how much richer is the class of abelian categories beyond \(R\text{-}\mathbf{Mod}\)? Mitchell's Embedding Theorem (1964) provides the decisive answer: for *small* abelian categories, not richer at all — every small abelian category embeds faithfully and exactly into \(R\text{-}\mathbf{Mod}\) for some ring \(R\). This is the categorical generalization of Cayley's theorem for groups (every group embeds in a symmetric group).

<div class="theorem">
<strong>Theorem 10.1 (Mitchell's Embedding Theorem).</strong> Let \(\mathcal{A}\) be a small abelian category. Then there exists a ring \(R\) (with 1, possibly non-commutative) and a functor \(F : \mathcal{A} \to R\text{-}\mathbf{Mod}\) that is:
<ul>
<li><em>Full</em>: every \(R\)-module homomorphism between objects in the image of \(F\) comes from a morphism in \(\mathcal{A}\).</li>
<li><em>Faithful</em>: distinct morphisms in \(\mathcal{A}\) map to distinct \(R\)-module maps.</li>
<li><em>Exact</em>: \(F\) preserves and reflects all exact sequences.</li>
</ul>
In particular, \(\mathcal{A}\) is equivalent to a full exact subcategory of \(R\text{-}\mathbf{Mod}\).
</div>

The theorem was proved by Barry Mitchell in his 1964 paper "The full imbedding theorem." The ring \(R\) depends on \(\mathcal{A}\) and can be quite large; it is constructed from the endomorphism ring of an injective cogenerator of \([\mathcal{A}^{op}, \mathbf{Ab}]\).

### 10.2 Proof Strategy

The proof of Mitchell's theorem is one of the triumphs of abstract category theory. We sketch the main steps, emphasizing the role of the Yoneda lemma (Chapter 6).

**Step 1: The Yoneda embedding.** The functor \(Y : \mathcal{A} \to [\mathcal{A}^{op}, \mathbf{Ab}]\) sending \(A \mapsto \mathrm{Hom}_\mathcal{A}(-, A)\) is full, faithful, and left exact. The functor category \([\mathcal{A}^{op}, \mathbf{Ab}]\) is a Grothendieck abelian category — an abelian category with a generator and satisfying the AB5 axiom (exact filtered colimits). This is the content of Grothendieck's 1957 Tôhoku paper.

**Step 2: Enough injectives.** Grothendieck's theorem guarantees that every Grothendieck abelian category has enough injectives (every object embeds in an injective). This key result, proved in §12.2 in the special case of \(R\text{-}\mathbf{Mod}\), holds in this generality.

**Step 3: An exact embedding.** One chooses an injective cogenerator \(U\) of \([\mathcal{A}^{op}, \mathbf{Ab}]\) (an injective object that "sees" every other object) and considers the functor \(\mathrm{Hom}(-, U)\). The composition

\[
\mathcal{A} \xrightarrow{Y} [\mathcal{A}^{op}, \mathbf{Ab}] \xrightarrow{\mathrm{Hom}(-,U)} \mathbf{Ab}
\]
is exact and faithful. Setting \(R = \mathrm{End}(U)^{op}\) and noting that \(\mathrm{Hom}(-, U)\) takes values in \(R\text{-}\mathbf{Mod}\) gives the desired embedding.

<div class="remark">
<strong>Remark 10.2 (Why Smallness Is Necessary).</strong> The theorem requires \(\mathcal{A}\) to be <em>small</em>. The category \(R\text{-}\mathbf{Mod}\) itself, for any fixed ring \(R\), is not small (it has a proper class of objects). There is no ring \(S\) such that \(R\text{-}\mathbf{Mod}\) embeds as a full exact subcategory of \(S\text{-}\mathbf{Mod}\) in any useful way. Mitchell's theorem is a statement about manageable-size abelian categories, not an assertion that all abelian categories are "just modules."

For practical purposes, the theorem applies whenever one is working with a specific finite diagram in an abelian category — all the objects and morphisms appearing in the diagram form a small abelian subcategory (after closing under finite limits and colimits), so the theorem applies.
</div>

### 10.3 The Metatheorem and Element-Chasing

The practical upshot of Mitchell's theorem is a powerful metatheorem that justifies the computational methods of homological algebra.

<div class="theorem">
<strong>Theorem 10.3 (Mitchell's Metatheorem).</strong> Let \(P\) be a statement of the form: "For all commutative diagrams with exact rows [and/or columns] of a specified shape in an abelian category, some diagram equation holds [and/or some map is monic/epic/an iso]." If \(P\) can be proved in \(R\text{-}\mathbf{Mod}\) by element-chasing for all rings \(R\), then \(P\) holds in all abelian categories.
</div>

The metatheorem requires care in formulation — not every first-order statement about modules translates to abelian categories (statements involving elements do not make sense in general). But the diagram-chase lemmas (Snake Lemma, Five Lemma, Nine Lemma, Horseshoe Lemma, etc.) all have the form covered by the metatheorem: they are statements about exactness of sequences derived from a given exact diagram.

<div class="example">
<strong>Example 10.4 (Application: Snake Lemma for Sheaves).</strong> The Snake Lemma (Theorem 9.13) was proved by element-chasing in \(R\text{-}\mathbf{Mod}\). By Mitchell's metatheorem, it holds in the abelian category \(\mathbf{Sh}(X, \mathbf{Ab})\) of sheaves of abelian groups. This is not obvious directly, since "elements" of a sheaf are local sections that may not glue globally. The metatheorem bypasses the need for a separate sheaf-theoretic proof.

In algebraic geometry, this application is ubiquitous: the snake lemma in \(\mathbf{Coh}(X)\) (coherent sheaves on a scheme \(X\)) is used constantly, and is justified by the abstract metatheorem rather than by explicit local computations.
</div>

<div class="remark">
<strong>Remark 10.5 (Freyd's Alternative).</strong> Before Mitchell, Freyd (1964) proved a weaker result: every small abelian category has an exact faithful (but not necessarily full) embedding into \(\mathbf{Ab}\). Mitchell's strengthening to a full embedding is what makes the metatheorem fully effective. There is also a variant for *essentially small* abelian categories (categories equivalent to small ones), which covers all practical cases.
</div>

## Chapter 11: Projective Modules and Vector Bundles

Projective modules are the algebraic generalization of free modules. They arise as the "nice" objects in homological algebra — the ones for which Hom is exact. The connection to geometry, made precise by the Serre-Swan theorem, shows that projective modules over a commutative ring are the algebraic shadows of vector bundles.

The notion of a projective module is equivalent to several a priori different conditions: a lifting property, a direct summand characterization, and an exactness property of Hom. These multiple characterizations are what make projective modules so useful — depending on the context, one picks the formulation that is most convenient.

### 11.1 Definition and Characterizations

<div class="definition">
<strong>Definition 11.1 (Projective Module).</strong> Let \(R\) be a ring. A left \(R\)-module \(P\) is <em>projective</em> if for any surjection \(g : M \twoheadrightarrow N\) and any homomorphism \(f : P \to N\), there exists a lift \(\tilde{f} : P \to M\) with \(g \circ \tilde{f} = f\):

\[
\begin{array}{ccc}
 & & M \\
 & \nearrow_{\tilde{f}} & \downarrow_g \\
P & \xrightarrow{f} & N
\end{array}
\]
</div>

The lifting property is the defining characteristic of projective objects in any category. In the category \(\mathbf{Set}\), every object is projective (one can always lift along a surjection by the axiom of choice). In \(R\text{-}\mathbf{Mod}\), the class of projective modules is strictly between free modules and all modules.

<div class="theorem">
<strong>Theorem 11.2 (Characterizations of Projective Modules).</strong> For a left \(R\)-module \(P\), the following are equivalent:
<ol>
<li>\(P\) is projective (satisfies the lifting property of Definition 11.1).</li>
<li>Every surjection \(M \twoheadrightarrow P\) splits: there exists \(s : P \to M\) with \(g \circ s = \mathrm{id}_P\).</li>
<li>\(P\) is a direct summand of a free module: there is a free module \(F\) and a module \(Q\) with \(F \cong P \oplus Q\).</li>
<li>The functor \(\mathrm{Hom}_R(P, -) : R\text{-}\mathbf{Mod} \to \mathbf{Ab}\) is exact (not merely left exact).</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> (1) \(\Rightarrow\) (2): Apply the lifting property to the surjection \(M \twoheadrightarrow P\) with \(f = \mathrm{id}_P\).

(2) \(\Rightarrow\) (3): Choose a surjection \(\pi : F \twoheadrightarrow P\) from a free module \(F\) (possible since every module is a quotient of a free module). By (2), this splits: \(F \cong P \oplus \ker(\pi)\).

(3) \(\Rightarrow\) (4): Write \(F = P \oplus Q\) (free). For an exact sequence \(0 \to A \to B \to C \to 0\), applying \(\mathrm{Hom}(F, -) = \mathrm{Hom}(P, -) \oplus \mathrm{Hom}(Q, -)\): since \(F\) is free, \(\mathrm{Hom}(F, -)  \) is exact (elements of \(\mathrm{Hom}(F, C)\) lift because free modules have the lifting property). Hence \(\mathrm{Hom}(P, -)\) is a direct summand of an exact functor, so it is exact.

(4) \(\Rightarrow\) (1): If \(\mathrm{Hom}(P, -)  \) is exact and \(g : M \to N\) is surjective, then \(\mathrm{Hom}(P, M) \to \mathrm{Hom}(P, N)\) is surjective, which is exactly the lifting property. \(\square\)
</div>

<div class="example">
<strong>Example 11.3 (Examples of Projective Modules).</strong>
<ul>
<li>Every free module is projective: \(F = P \oplus 0\). Conversely, over a field, every module (= vector space) is free, hence projective.</li>
<li>Over a PID (like \(\mathbb{Z}\) or \(k[x]\)), every projective module is free. This is a theorem of Kaplansky (1958) for countably generated projectives, and holds in general over PIDs.</li>
<li>Over \(\mathbb{Z}/6 \cong \mathbb{Z}/2 \times \mathbb{Z}/3\) (by CRT), the module \(\mathbb{Z}/2\) is projective: \(\mathbb{Z}/6 = \mathbb{Z}/2 \oplus \mathbb{Z}/3\) as \(\mathbb{Z}/6\)-modules.</li>
<li>The rank-\(n\) module of global sections of the tautological bundle on \(\mathbb{P}^{n-1}\) is projective but not free over the polynomial ring (by the Serre-Swan theorem).</li>
</ul>
</div>

### 11.2 The Dual Basis Lemma

The following criterion gives an explicit algebraic characterization of projective modules in terms of "dual bases," analogous to the basis of a free module.

<div class="theorem">
<strong>Theorem 11.4 (Dual Basis Lemma).</strong> A module \(P\) over a ring \(R\) is projective if and only if there exist elements \(\{x_i\}_{i \in I} \subseteq P\) and homomorphisms \(\{f_i\}_{i \in I} \subseteq \mathrm{Hom}_R(P, R)\) such that:
<ol>
<li>For each \(x \in P\), the set \(\{i \in I : f_i(x) \neq 0\}\) is finite.</li>
<li>For every \(x \in P\), \(x = \sum_{i \in I} f_i(x) \cdot x_i\) (finite sum by (1)).</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> (\(\Rightarrow\)) Write \(P \oplus Q \cong F\) free with basis \(\{e_i\}_{i \in I}\). Let \(\pi : F \to P\) be the projection and \(\iota : P \to F\) the inclusion. Set \(x_i = \pi(e_i)\) and \(f_i = (\text{coordinate function on }e_i) \circ \iota\). For \(x \in P\), \(\iota(x) = \sum f_i(x) e_i\) (finite sum), so \(x = \pi\iota(x) = \sum f_i(x) x_i\).

(\(\Leftarrow\)) Given such \(\{x_i, f_i\}\), define \(\phi : P \to \bigoplus_i R \cdot e_i\) (free) by \(\phi(x) = \sum f_i(x) e_i\), and \(\psi : \bigoplus R e_i \to P\) by \(\psi(e_i) = x_i\). Then \(\psi \circ \phi = \mathrm{id}_P\), so \(P\) is a direct summand of a free module. \(\square\)
</div>

### 11.3 Projective Modules over Local Rings and the Quillen-Suslin Theorem

Over a local ring, the structure of projective modules is completely determined.

<div class="theorem">
<strong>Theorem 11.5 (Kaplansky).</strong> Every projective module over a local ring \((R, \mathfrak{m})\) is free.
</div>

<div class="proof">
<strong>Proof (sketch).</strong> Let \(P\) be projective over a local ring \(R\). By Nakayama's lemma, a minimal generating set for \(P/\mathfrak{m}P\) (a vector space over the residue field \(R/\mathfrak{m}\)) lifts to a minimal generating set for \(P\). The key is that the lifting property forces any such lift to be a free basis: if \(p_1, \ldots, p_n\) generate \(P\) and some relation \(\sum r_i p_i = 0\) holds with not all \(r_i = 0\), one can reduce to a relation in \(P/\mathfrak{m}P\), contradicting the minimality of the generating set over the field \(R/\mathfrak{m}\). \(\square\)
</div>

A major open question from the 1950s was whether every projective module over \(R = k[x_1, \ldots, x_n]\) (polynomial ring over a field) is free. This is the question of whether "algebraic vector bundles over affine space are trivial" — geometrically, \(\mathrm{Spec}\, k[x_1, \ldots, x_n] = \mathbb{A}^n\) is contractible, so one expects all vector bundles to be trivial. Serre posed this as a question in 1955 ("Problème de Serre"), and the answer came two decades later:

<div class="theorem">
<strong>Theorem 11.6 (Quillen-Suslin, 1976).</strong> Every finitely generated projective module over the polynomial ring \(k[x_1, \ldots, x_n]\) (for any field \(k\) or, more generally, any PID) is free.
</div>

Daniel Quillen and Andrei Suslin proved this independently in 1976. Quillen's proof used a reduction to the local case via localization; Suslin's proof was more computational. The theorem resolved Serre's question and confirmed the geometric intuition. It also inaugurated the deep connections between projective modules and algebraic \(K\)-theory: the Grothendieck group \(K_0(R)\) classifies projective modules up to stable isomorphism, and Quillen-Suslin says \(K_0(k[x_1,\ldots,x_n]) \cong \mathbb{Z}\), generated by the rank-1 free module.

### 11.4 Vector Bundles and the Serre-Swan Theorem

The Serre-Swan theorem establishes a precise algebraic-geometric dictionary between projective modules and vector bundles. It is one of the most beautiful results in algebraic geometry and noncommutative geometry.

<div class="theorem">
<strong>Theorem 11.7 (Serre-Swan).</strong> Let \(X\) be a compact Hausdorff topological space and \(C(X)\) the ring of continuous real-valued (or complex-valued) functions on \(X\).
<ol>
<li>(Swan, 1962) The functor \(\Gamma : \mathbf{Vect}(X) \to C(X)\text{-}\mathbf{Mod}\) sending a vector bundle \(E \to X\) to its \(C(X)\)-module of global continuous sections \(\Gamma(X, E)\) is an equivalence of categories between the category of (real or complex) vector bundles on \(X\) and the category of finitely generated projective \(C(X)\)-modules.</li>
<li>(Serre, 1955, algebraic version) For an affine algebraic variety \(X = \mathrm{Spec}\, A\) over an algebraically closed field, the global section functor gives an equivalence between locally free sheaves of finite rank on \(X\) and finitely generated projective \(A\)-modules.</li>
</ol>
</div>

<div class="proof">
<strong>Proof sketch (Swan's theorem).</strong> Given a vector bundle \(E \to X\), the module of sections \(\Gamma(X, E)\) is finitely generated and projective over \(C(X)\) because \(X\) is compact: one can find a complement bundle \(F\) such that \(E \oplus F\) is trivial (= a trivial vector bundle \(X \times \mathbb{R}^n\)), so \(\Gamma(X, E) \oplus \Gamma(X, F) \cong C(X)^n\) is free.

Conversely, given a finitely generated projective \(C(X)\)-module \(P\), write \(P \oplus Q \cong C(X)^n\). The module \(C(X)^n\) corresponds to the trivial bundle \(X \times \mathbb{R}^n\). The projection \(C(X)^n \to P \to 0\) gives a family of projections in \(M_n(\mathbb{R})\) parametrized by \(X\) (since evaluating at each point gives a linear projection). The image bundle \(\{(x, v) : e(x) v = v\} \subseteq X \times \mathbb{R}^n\) is a vector bundle with sections isomorphic to \(P\). \(\square\)
</div>

<div class="remark">
<strong>Remark 11.8 (Noncommutative Geometry and \(K\)-Theory).</strong> The Serre-Swan theorem is the conceptual foundation of Alain Connes' noncommutative geometry. Connes proposed that for a noncommutative algebra \(A\) (the "noncommutative space"), the category of projective \(A\)-modules should play the role of vector bundles. The topological \(K\)-theory group \(K^0(X)\) (generated by isomorphism classes of vector bundles, with direct sum as addition) corresponds via Serre-Swan to the algebraic \(K\)-group \(K_0(C(X))\) (generated by isomorphism classes of finitely generated projective modules). This identification enables the import of all of algebraic \(K\)-theory into topology and vice versa.

For algebraic varieties, the analog of \(K^0\) is the Grothendieck group of locally free sheaves, and Hirzebruch's Riemann-Roch theorem (and its generalization by Grothendieck) computes this group in terms of Chern classes and cohomology. The Quillen-Suslin theorem says \(K_0(\mathbb{A}^n_k) \cong \mathbb{Z}\), consistent with the contractibility of affine space.
</div>

## Chapter 12: Injective Modules

Injective modules are the duals of projective modules. Where projective modules lift along surjections, injective modules extend along injections. In many ways, injective modules are harder to work with explicitly — they tend to be large and non-constructive — but they are indispensable for computing right derived functors (sheaf cohomology, Ext groups).

The key theme of this chapter is the theorem that every module embeds in an injective module ("enough injectives"), which is a non-trivial result requiring the axiom of choice. This is in contrast to "enough projectives" (every module is a quotient of a free module), which is immediate from the definition.

### 12.1 Definition and Baer's Criterion

<div class="definition">
<strong>Definition 12.1 (Injective Module).</strong> A left \(R\)-module \(I\) is <em>injective</em> if for any injection \(f : A \hookrightarrow B\) and any homomorphism \(g : A \to I\), there exists a homomorphism \(\tilde{g} : B \to I\) with \(\tilde{g} \circ f = g\):

\[
\begin{array}{ccc}
0 \to A & \xrightarrow{f} & B \\
\downarrow_g & \searrow_{\tilde{g}} & \\
I & &
\end{array}
\]
</div>

The injective condition is dual to the projective lifting property: projective modules lift along surjections, injective modules extend along injections. Equivalently, \(I\) is injective if and only if \(\mathrm{Hom}_R(-, I)\) is an exact functor (not merely left exact).

In practice, verifying injectivity directly from the definition would require checking the extension property for all injections \(A \hookrightarrow B\). Baer's criterion reduces this to a much simpler check.

<div class="theorem">
<strong>Theorem 12.2 (Baer's Criterion, 1940).</strong> A left \(R\)-module \(I\) is injective if and only if for every left ideal \(\mathfrak{a} \subseteq R\) and every homomorphism \(f : \mathfrak{a} \to I\), there exists an element \(x \in I\) such that \(f(r) = rx\) for all \(r \in \mathfrak{a}\) (i.e., \(f\) extends to the map \(R \to I\) sending \(1 \mapsto x\)).
</div>

<div class="proof">
<strong>Proof.</strong> (\(\Rightarrow\)) If \(I\) is injective, apply the extension property to the injection \(\mathfrak{a} \hookrightarrow R\) and the homomorphism \(f : \mathfrak{a} \to I\). The extension is a map \(\tilde{f} : R \to I\); setting \(x = \tilde{f}(1)\) gives \(f(r) = \tilde{f}(r) = \tilde{f}(r \cdot 1) = r \cdot \tilde{f}(1) = rx\).

(\(\Leftarrow\)) Suppose Baer's condition holds and \(g : A \to I\) is given with \(f : A \hookrightarrow B\) an injection. We want to extend \(g\) to a map \(\tilde{g} : B \to I\). By Zorn's lemma, consider the collection of pairs \((C, h)\) where \(A \subseteq C \subseteq B\) and \(h : C \to I\) extends \(g\). This collection is nonempty (take \(C = A\)) and partially ordered by extension. Any chain has an upper bound (take the union). So there is a maximal pair \((C_0, h_0)\). If \(C_0 \neq B\), pick \(b \in B \setminus C_0\) and let \(\mathfrak{a} = \{r \in R : rb \in C_0\}\), a left ideal. The map \(\mathfrak{a} \to I\) sending \(r \mapsto h_0(rb)\) satisfies Baer's criterion, so extends to a map \(R \to I\) sending \(1 \mapsto x\). Then extend \(h_0\) to \(C_0 + Rb\) by setting \(h(c + rb) = h_0(c) + rx\). This contradicts maximality of \((C_0, h_0)\), so \(C_0 = B\). \(\square\)
</div>

The use of Zorn's lemma is essential and unavoidable — the existence of enough injectives (Theorem 12.4) is equivalent over ZF to the axiom of choice.

<div class="example">
<strong>Example 12.3 (Injective Modules).</strong>
<ul>
<li>Over a field \(k\), every vector space is injective (and projective). \(\mathbf{Vect}_k\) is a "semisimple" abelian category.</li>
<li>The \(\mathbb{Z}\)-module \(\mathbb{Q}\) is injective: given any injection \(f : A \hookrightarrow B\) of abelian groups and \(g : A \to \mathbb{Q}\), one can extend \(g\) to \(B\) by Baer's criterion — since \(\mathbb{Z}\) has only one non-zero ideal type (namely \(n\mathbb{Z}\)), and \(\mathbb{Q}\) is divisible (every element can be "divided" by any non-zero integer), the criterion is satisfied.</li>
<li>More generally, over \(\mathbb{Z}\), the injective abelian groups are precisely the <em>divisible groups</em>: groups \(D\) such that for each \(d \in D\) and each non-zero integer \(n\), there exists \(x \in D\) with \(nx = d\). The divisible groups are: \(\mathbb{Q}\), \(\mathbb{Q}/\mathbb{Z}\), the Prüfer groups \(\mathbb{Z}[p^{-1}]/\mathbb{Z} = \mathbb{Z}(p^\infty)\) for each prime \(p\), and their direct sums and direct products.</li>
<li>Over a Noetherian ring \(R\), the injective modules have a structural description due to Matlis (see §12.3).</li>
</ul>
</div>

### 12.2 Enough Injectives

The existence of enough injectives is a fundamental theorem that makes right derived functors well-defined.

<div class="theorem">
<strong>Theorem 12.4 (Enough Injectives in \(R\text{-}\mathbf{Mod}\)).</strong> For any ring \(R\) and any left \(R\)-module \(M\), there exists an injective left \(R\)-module \(I\) and a monomorphism \(0 \to M \hookrightarrow I\). That is, \(R\text{-}\mathbf{Mod}\) has enough injectives.
</div>

<div class="proof">
<strong>Proof (in two steps).</strong> 

<em>Step 1</em>: Show \(\mathbb{Q}/\mathbb{Z}\) is injective as a \(\mathbb{Z}\)-module. By Baer's criterion, given a homomorphism \(f : n\mathbb{Z} \to \mathbb{Q}/\mathbb{Z}\), we must extend to \(\mathbb{Z}\). Say \(f(n) = [a/b] \in \mathbb{Q}/\mathbb{Z}\). Then \(f(1) = f(n)/n = [a/(nb)]\) works as the extension value.

<em>Step 2</em>: Given an \(R\)-module \(M\), first embed \(M\) into a \(\mathbb{Q}/\mathbb{Z}\)-injective module. View \(M\) as a \(\mathbb{Z}\)-module and choose an embedding \(M \hookrightarrow D\) into a divisible abelian group (inject \(M\) into its injective envelope over \(\mathbb{Z}\)). The functor \(\mathrm{Hom}_\mathbb{Z}(R, -)\) sends injective \(\mathbb{Z}\)-modules to injective \(R\)-modules (by the Hom-tensor adjunction), and there is a natural embedding \(M \hookrightarrow \mathrm{Hom}_\mathbb{Z}(R, M)\) sending \(m \mapsto (r \mapsto rm)\). Composing \(M \hookrightarrow \mathrm{Hom}_\mathbb{Z}(R, M) \hookrightarrow \mathrm{Hom}_\mathbb{Z}(R, D)\) gives the desired embedding into an injective \(R\)-module. \(\square\)
</div>

The *injective envelope* (or *injective hull*) of a module \(M\) is a minimal injective module containing \(M\) — it is the smallest injective extension of \(M\). Injective envelopes exist and are unique up to isomorphism (Eckmann-Schopf, 1953). The injective envelope is denoted \(E(M)\) and can be constructed as the "divisible closure" or "essential extension" of \(M\): an extension \(M \subseteq I\) where \(I\) is injective and every non-zero submodule of \(I\) meets \(M\) non-trivially (this is the "essential" condition).

<div class="definition">
<strong>Definition 12.5 (Injective Envelope).</strong> An <em>injective envelope</em> (or <em>injective hull</em>) of a module \(M\) is an injective module \(E(M)\) together with an essential monomorphism \(M \hookrightarrow E(M)\): every non-zero submodule of \(E(M)\) has non-zero intersection with the image of \(M\). The injective envelope is unique up to isomorphism (as a module over \(M\), i.e., as an essential extension).
</div>

<div class="example">
<strong>Example 12.6 (Injective Envelopes).</strong>
<ul>
<li>\(E(\mathbb{Z}) = \mathbb{Q}\) as \(\mathbb{Z}\)-modules: \(\mathbb{Q}\) is injective and divisible, and every non-zero subgroup of \(\mathbb{Q}\) meets \(\mathbb{Z}\) non-trivially (since \(\mathbb{Q}\) is a localization of \(\mathbb{Z}\)).</li>
<li>\(E(\mathbb{Z}/p) = \mathbb{Z}(p^\infty) = \mathbb{Z}[p^{-1}]/\mathbb{Z}\): the Prüfer \(p\)-group, which is the union \(\mathbb{Z}/p \subset \mathbb{Z}/p^2 \subset \mathbb{Z}/p^3 \subset \cdots\) along the natural inclusions. This is the injective envelope of \(\mathbb{Z}/p\) in \(\mathbf{Ab}\).</li>
<li>Over a Noetherian ring, the indecomposable injective modules are all of the form \(E(R/\mathfrak{p})\) for prime ideals \(\mathfrak{p}\), and every injective module decomposes as a direct sum of indecomposable injectives (Matlis decomposition).</li>
</ul>
</div>

### 12.3 Injective Modules over Specific Rings

The structure of injective modules depends strongly on the ring \(R\). We record the most important cases.

<div class="theorem">
<strong>Theorem 12.7 (Injective \(\mathbb{Z}\)-modules = Divisible Groups).</strong> An abelian group \(D\) is injective (as a \(\mathbb{Z}\)-module) if and only if it is divisible: for every \(d \in D\) and every non-zero \(n \in \mathbb{Z}\), there exists \(x \in D\) with \(nx = d\). Every divisible group is a direct sum of copies of \(\mathbb{Q}\) and of Prüfer groups \(\mathbb{Z}(p^\infty)\) for various primes \(p\).
</div>

This structure theorem is due to Prüfer (1923) and Baer (1940). The Prüfer groups \(\mathbb{Z}(p^\infty)\) are indecomposable (have no non-trivial direct sum decomposition) and serve as the "atoms" of the divisible abelian group universe.

<div class="theorem">
<strong>Theorem 12.8 (Matlis Duality for Noetherian Rings).</strong> Let \((R, \mathfrak{m}, k)\) be a Noetherian local ring, and \(E = E(k)\) be the injective envelope of the residue field. Then:
<ol>
<li>The functor \(D(-) = \mathrm{Hom}_R(-, E)\) is an exact contravariant equivalence (duality) between the categories of Noetherian and Artinian \(R\)-modules.</li>
<li>Every indecomposable injective \(R\)-module is isomorphic to \(E(R/\mathfrak{p})\) for a unique prime \(\mathfrak{p} \in \mathrm{Spec}\, R\).</li>
<li>Every injective \(R\)-module is a direct sum of indecomposable injectives \(E(R/\mathfrak{p})\).</li>
</ol>
</div>

Matlis duality (1958) is a beautiful generalization of Pontryagin duality. For \(R = \mathbb{Z}\) and a prime \(p\), it becomes the duality between \(p\)-primary abelian groups and pro-\(p\) groups. For the power series ring \(R = k[[x]]\), it is related to the duality between formal power series and polynomials.

<div class="remark">
<strong>Remark 12.9 (Self-Injective and Frobenius Rings).</strong> A ring \(R\) is called <em>self-injective</em> if \(R\) is injective as a module over itself. Group algebras \(kG\) of finite groups \(G\) over a field \(k\) are self-injective (in fact, they are Frobenius algebras, a stronger condition). This is the algebraic reason that representation theory of finite groups has a rich duality theory. Frobenius algebras are characterized by the existence of a non-degenerate bilinear form on \(R\), and they appear in TQFT (topological quantum field theory) as the algebraic structures associated to 2-dimensional cobordisms.
</div>

<div class="remark">
<strong>Remark 12.10 (Projective and Injective: A Symmetry).</strong> The duality between projective and injective modules is an instance of the general duality principle in category theory (§4.2). A module is projective iff \(\mathrm{Hom}(P,-)\) is exact; it is injective iff \(\mathrm{Hom}(-,I)\) is exact. Projective modules are the correct objects for computing <em>left</em> derived functors (by resolving the first argument), while injective modules are correct for computing <em>right</em> derived functors (by resolving the target). This will be made precise in Chapter 15.

The category \(\mathbf{Vect}_k\) is "maximally symmetric" in this sense: every object is both projective and injective, every functor is exact, and there are no derived functors to speak of (all higher derived functors vanish). The further one moves from this ideal situation, the richer the homological algebra becomes.
</div>


# Part III: Homological Algebra

With the categorical foundations of Parts I and II established, we now turn to the core techniques of homological algebra. The central idea is to study a module \(M\) — or more generally, an object in an abelian category — by replacing it with a *resolution*: a long exact sequence of "nice" (projective or injective) modules that together encode all the homological information about \(M\). Applying a functor to the resolution and measuring the failure of exactness gives the *derived functors*, which are the main computational tools of the subject.

The story has a beautiful arc. Eilenberg and MacLane introduced cohomology of groups in 1945, and Cartan and Eilenberg's 1956 book *Homological Algebra* systematized the entire theory of derived functors for modules. Grothendieck's 1957 Tôhoku paper then showed that the same constructions work in any abelian category with enough injectives, and introduced the spectral sequences needed to compute derived functors of composites. The two main invariants — \(\mathrm{Ext}\) and \(\mathrm{Tor}\) — measure the "non-projectivity" and "non-injectivity" of modules respectively, and connect directly to classical problems in algebra and topology.

## Chapter 13: Chain Complexes

### 13.1 Chain and Cochain Complexes

The algebraic formalization of "sequences that compose to zero" is the chain complex. The concept appears first in algebraic topology, where the boundary of a boundary is zero (\(\partial^2 = 0\)), and then in algebra, where it encodes exact sequences and their failures.

<div class="definition">
<strong>Definition 13.1 (Chain Complex).</strong> Let \(\mathcal{A}\) be an abelian category. A <em>chain complex</em> \(C_\bullet\) in \(\mathcal{A}\) is a sequence of objects and morphisms

\[
\cdots \to C_{n+1} \xrightarrow{d_{n+1}} C_n \xrightarrow{d_n} C_{n-1} \to \cdots
\]
satisfying \(d_n \circ d_{n+1} = 0\) for all \(n\). The morphisms \(d_n\) are called <em>differentials</em> or <em>boundary maps</em>.

Dually, a <em>cochain complex</em> \(C^\bullet\) has the form \(\cdots \to C^{n-1} \xrightarrow{d^{n-1}} C^n \xrightarrow{d^n} C^{n+1} \to \cdots\) with \(d^n \circ d^{n-1} = 0\).
</div>

The condition \(d^2 = 0\) is the minimal algebraic requirement for a notion of "cycle" (elements in \(\ker d\)) and "boundary" (elements in \(\mathrm{im}\, d\)) to make sense and satisfy \(\mathrm{im} \subseteq \ker\). Homology measures the gap between these.

<div class="definition">
<strong>Definition 13.2 (Homology and Cohomology).</strong> Let \(C_\bullet\) be a chain complex in \(R\text{-}\mathbf{Mod}\). The <em>cycle objects</em>, <em>boundary objects</em>, and <em>homology objects</em> at degree \(n\) are:

\[
Z_n = \ker(d_n : C_n \to C_{n-1}), \quad B_n = \mathrm{im}(d_{n+1} : C_{n+1} \to C_n), \quad H_n(C_\bullet) = Z_n / B_n.
\]
Since \(d_n \circ d_{n+1} = 0\), we have \(B_n \subseteq Z_n\), so the quotient is well-defined.

The complex \(C_\bullet\) is <em>exact</em> (as a sequence) if and only if \(H_n(C_\bullet) = 0\) for all \(n\).
</div>

The category \(\mathbf{Ch}(R)\) of chain complexes of \(R\)-modules is itself an abelian category. A morphism \(f_\bullet : C_\bullet \to D_\bullet\) of chain complexes is a collection of maps \(f_n : C_n \to D_n\) commuting with the differentials: \(d_n^D \circ f_n = f_{n-1} \circ d_n^C\). Such a morphism induces maps \(H_n(f) : H_n(C_\bullet) \to H_n(D_\bullet)\) on homology, making \(H_n : \mathbf{Ch}(R) \to R\text{-}\mathbf{Mod}\) a functor for each \(n\).

<div class="example">
<strong>Example 13.3 (Topological Chain Complexes).</strong> For a simplicial complex \(X\), the simplicial chain complex has \(C_n(X; \mathbb{Z}) = \bigoplus_{\sigma \text{ is an }n\text{-simplex}} \mathbb{Z}\), and the differential \(d_n : C_n \to C_{n-1}\) sends a simplex to its oriented boundary. The resulting homology groups \(H_n(X; \mathbb{Z})\) are the simplicial homology groups, which equal the singular homology of the geometric realization \(|X|\). The condition \(d^2 = 0\) reflects the fact that the boundary of a boundary is empty.

For instance, the boundary of a triangle \([v_0, v_1, v_2]\) is \([v_1, v_2] - [v_0, v_2] + [v_0, v_1]\), and the boundary of this is \((v_2 - v_1) - (v_2 - v_0) + (v_1 - v_0) = 0\).
</div>

<div class="example">
<strong>Example 13.4 (The Koszul Complex).</strong> Let \(R = k[x_1, \ldots, x_n]\) and \(M = k = R/(x_1, \ldots, x_n)\). The <em>Koszul complex</em> \(K_\bullet(x_1, \ldots, x_n)\) is a chain complex of free \(R\)-modules providing a projective resolution of \(k\). Concretely, \(K_p = \bigwedge^p R^n\) (the \(p\)th exterior power of \(R^n\), a free module of rank \(\binom{n}{p}\)), and the differential is:

\[
d_p(e_{i_1} \wedge \cdots \wedge e_{i_p}) = \sum_{j=1}^p (-1)^{j-1} x_{i_j} \cdot e_{i_1} \wedge \cdots \wedge \widehat{e_{i_j}} \wedge \cdots \wedge e_{i_p}.
\]
The Koszul complex is exact in positive degrees (when the \(x_i\) form a regular sequence), giving the minimal free resolution \(0 \to K_n \to \cdots \to K_1 \to K_0 \to k \to 0\). This resolution computes \(\mathrm{Tor}^R_\bullet(k, k)\) and \(\mathrm{Ext}^\bullet_R(k, k)\) and is the algebraic foundation of the Hilbert Syzygy Theorem.
</div>

### 13.2 The Long Exact Sequence in Homology

The most fundamental result in homological algebra is that a short exact sequence of chain complexes gives rise to a long exact sequence in homology. This is the mechanism by which local algebraic information (short exact sequences) propagates into global topological information (long exact sequences in cohomology).

<div class="theorem">
<strong>Theorem 13.5 (Long Exact Sequence in Homology).</strong> Let

\[
0 \to A_\bullet \xrightarrow{f_\bullet} B_\bullet \xrightarrow{g_\bullet} C_\bullet \to 0
\]
be a short exact sequence of chain complexes. Then there is a natural long exact sequence:

\[
\cdots \to H_n(A_\bullet) \xrightarrow{H_n(f)} H_n(B_\bullet) \xrightarrow{H_n(g)} H_n(C_\bullet) \xrightarrow{\partial_n} H_{n-1}(A_\bullet) \to \cdots
\]
where \(\partial_n : H_n(C_\bullet) \to H_{n-1}(A_\bullet)\) is the <em>connecting homomorphism</em>.
</div>

<div class="proof">
<strong>Proof.</strong> The connecting homomorphism is constructed by the same "diagram chase" as in the Snake Lemma (Theorem 9.13). Given a cycle \(c \in Z_n(C)\), lift to some \(b \in B_n\) with \(g_n(b) = c\). Since \(g_{n-1}(d_n^B(b)) = d_n^C(c) = 0\), we have \(d_n^B(b) \in \ker(g_{n-1}) = \mathrm{im}(f_{n-1})\), so write \(d_n^B(b) = f_{n-1}(a)\) for a unique \(a \in A_{n-1}\). One checks \(d_{n-1}^A(a) = 0\) (using \(d^2 = 0\) and injectivity of \(f\)), so \(a\) is a cycle. Define \(\partial_n([c]) = [a] \in H_{n-1}(A)\). Independence of the lift \(b\) and the representative \(c\) follows by a standard diagram chase. The long exact sequence then follows from the exactness at each node, which is verified by element-chasing (justified in all abelian categories by Mitchell's theorem). \(\square\)
</div>

<div class="remark">
<strong>Remark 13.6 (Ubiquity of the Long Exact Sequence).</strong> The long exact sequence in homology is the central computation tool throughout mathematics:
<ul>
<li>In algebraic topology, the long exact sequence of a pair \((X, A)\) arises from \(0 \to C_\bullet(A) \to C_\bullet(X) \to C_\bullet(X, A) \to 0\).</li>
<li>In sheaf theory, the long exact sequence associated to a short exact sequence of sheaves \(0 \to \mathcal{F}' \to \mathcal{F} \to \mathcal{F}'' \to 0\) on a topological space gives the long exact sequence in sheaf cohomology, the fundamental tool of algebraic geometry.</li>
<li>In group cohomology, the inflation-restriction exact sequence and the Hochschild-Serre spectral sequence arise from filtered complexes.</li>
<li>In algebraic geometry, the long exact sequence in étale cohomology (arising from the Kummer sequence \(0 \to \mu_n \to \mathbb{G}_m \xrightarrow{\times n} \mathbb{G}_m \to 0\)) connects cohomological data to arithmetic information.</li>
</ul>
</div>

### 13.3 Chain Homotopies

Two chain maps may induce the same maps on homology even though they are not equal as chain maps. The correct notion of equivalence between chain maps is chain homotopy.

<div class="definition">
<strong>Definition 13.7 (Chain Homotopy).</strong> Two chain maps \(f_\bullet, g_\bullet : C_\bullet \to D_\bullet\) are <em>chain homotopic</em> (written \(f \simeq g\)) if there exists a collection of maps \(h_n : C_n \to D_{n+1}\) (a <em>chain homotopy</em>) such that:

\[
f_n - g_n = d_{n+1}^D \circ h_n + h_{n-1} \circ d_n^C.
\]
A chain map \(f : C_\bullet \to D_\bullet\) is a <em>homotopy equivalence</em> if there exists a chain map \(g : D_\bullet \to C_\bullet\) with \(f \circ g \simeq \mathrm{id}_D\) and \(g \circ f \simeq \mathrm{id}_C\).
</div>

Chain homotopic maps induce the same maps on homology: if \(f \simeq g\) via \(h\), then for any cycle \(z \in Z_n(C)\),

\[
(f_n - g_n)(z) = d^D h_n(z) + h_{n-1} d^C(z) = d^D h_n(z) + 0 = d^D h_n(z) \in B_n(D),
\]
so \([f_n(z)] = [g_n(z)]\) in \(H_n(D)\). The "homotopy category" \(\mathbf{K}(R)\) of chain complexes is the category with the same objects as \(\mathbf{Ch}(R)\) but with morphisms being chain homotopy classes of chain maps. This category is not abelian, but it is the natural setting for the construction of the derived category.

<div class="remark">
<strong>Remark 13.8 (The Derived Category).</strong> The derived category \(\mathbf{D}(R)\) is obtained from the homotopy category \(\mathbf{K}(R)\) by formally inverting all quasi-isomorphisms — chain maps inducing isomorphisms on all homology groups. This is an instance of Gabriel-Zisman localization, and the resulting category \(\mathbf{D}(R)\) is triangulated (not abelian). The derived category is the correct setting for derived functors in the modern sense: rather than choosing a resolution, one works directly with the complex and applies functors at the derived level.

Verdier introduced derived categories (following Grothendieck's suggestions) in his 1963 thesis. Their full power was demonstrated by Beilinson, Bernstein, Deligne, and Gabber in the Faisceaux Pervers paper (1982), where perverse sheaves were shown to be "the heart of a t-structure" on the derived category of constructible sheaves.
</div>

### 13.4 Mapping Cones

The mapping cone provides a powerful tool for understanding the relationship between a chain map and the long exact sequence it induces.

<div class="definition">
<strong>Definition 13.9 (Mapping Cone).</strong> Let \(f_\bullet : C_\bullet \to D_\bullet\) be a chain map. The <em>mapping cone</em> \(\mathrm{Cone}(f)_\bullet\) is the chain complex with:

\[
\mathrm{Cone}(f)_n = C_{n-1} \oplus D_n, \quad d_n^{\mathrm{Cone}} = \begin{pmatrix} -d_{n-1}^C & 0 \\ f_{n-1} & d_n^D \end{pmatrix}.
\]
There are natural chain maps \(D_\bullet \to \mathrm{Cone}(f)_\bullet\) (inclusion into second factor) and \(\mathrm{Cone}(f)_\bullet \to C_{\bullet - 1}\) (projection to first factor, the "shift"), fitting into a short exact sequence:

\[
0 \to D_\bullet \to \mathrm{Cone}(f)_\bullet \to C_{\bullet-1} \to 0.
\]
The long exact sequence in homology of this short exact sequence recovers the long exact sequence induced by \(f\), with \(\partial = H(f)\) as the connecting homomorphism.
</div>

A chain map \(f_\bullet : C_\bullet \to D_\bullet\) is a quasi-isomorphism (i.e., \(H_n(f)\) is an isomorphism for all \(n\)) if and only if \(H_n(\mathrm{Cone}(f)) = 0\) for all \(n\) — i.e., the mapping cone is exact. This characterization is the basis for defining the derived category.

## Chapter 14: Resolutions

### 14.1 Projective Resolutions

A projective resolution of a module \(M\) is an exact sequence terminating at \(M\) with all other terms projective. It provides a "projective replacement" for \(M\) that can be used to compute derived functors.

<div class="definition">
<strong>Definition 14.1 (Projective Resolution).</strong> A <em>projective resolution</em> of an \(R\)-module \(M\) is an exact sequence:

\[
\cdots \to P_2 \xrightarrow{d_2} P_1 \xrightarrow{d_1} P_0 \xrightarrow{\epsilon} M \to 0
\]
where each \(P_n\) is a projective \(R\)-module. Equivalently, it is a quasi-isomorphism \(P_\bullet \xrightarrow{\sim} M\) from a complex \(P_\bullet\) concentrated in non-negative degrees with each \(P_n\) projective (and \(M\) viewed as a complex in degree 0).
</div>

Every module has a projective resolution, constructed inductively: set \(P_0\) to be any free module surjecting onto \(M\), let \(M_1 = \ker(P_0 \to M)\), set \(P_1\) to be a free module surjecting onto \(M_1\), and continue. At each step, the kernel of the current differential is called the \(n\)th syzygy module \(\Omega^n(M)\).

<div class="example">
<strong>Example 14.2 (Projective Resolutions over \(\mathbb{Z}\)).</strong>
<ul>
<li>The resolution \(0 \to \mathbb{Z} \xrightarrow{\times n} \mathbb{Z} \to \mathbb{Z}/n \to 0\) is a projective (in fact, free) resolution of \(\mathbb{Z}/n\) of length 1. This is the minimal such resolution.</li>
<li>The Koszul complex (Example 13.4) is a projective resolution of \(k\) over \(k[x_1, \ldots, x_n]\) of length \(n\).</li>
<li>Over the group algebra \(\mathbb{Z}[C_2] = \mathbb{Z}[x]/(x^2-1)\) for the cyclic group \(C_2 = \langle g \rangle\), the trivial module \(\mathbb{Z}\) has the periodic free resolution: \(\cdots \xrightarrow{N} \mathbb{Z}[C_2] \xrightarrow{g-1} \mathbb{Z}[C_2] \xrightarrow{N} \mathbb{Z}[C_2] \xrightarrow{g-1} \mathbb{Z}[C_2] \to \mathbb{Z} \to 0\), where \(N = 1 + g\) is the norm element. This computation underlies the cohomology of cyclic groups: \(H^n(C_2; \mathbb{Z}) = \mathbb{Z}/2\) for all \(n \geq 1\).</li>
</ul>
</div>

### 14.2 Injective Resolutions

Dually, every module embeds in an injective module, allowing the construction of injective resolutions.

<div class="definition">
<strong>Definition 14.3 (Injective Resolution).</strong> An <em>injective resolution</em> of an \(R\)-module \(M\) is an exact sequence:

\[
0 \to M \xrightarrow{\eta} I^0 \xrightarrow{d^0} I^1 \xrightarrow{d^1} I^2 \to \cdots
\]
where each \(I^n\) is an injective \(R\)-module.
</div>

The construction is dual to the projective case: embed \(M\) in its injective envelope \(I^0 = E(M)\), let \(M^1 = I^0 / M = \mathrm{coker}(\eta)\), embed \(M^1\) in \(I^1 = E(M^1)\), and continue. The successive "cosyzygy" modules \(\Sigma^n(M)\) encode increasingly refined homological information about \(M\).

### 14.3 The Comparison Theorem

The key structural result about resolutions is that, up to homotopy, they are unique — any two resolutions of the same module are homotopy equivalent. This is what makes derived functors well-defined (independent of the choice of resolution).

<div class="theorem">
<strong>Theorem 14.4 (Comparison Theorem).</strong> Let \(P_\bullet \xrightarrow{\sim} M\) be a projective resolution of \(M\) and \(f : M \to N\) a module homomorphism. For any resolution \(Q_\bullet \xrightarrow{\sim} N\) (not necessarily projective), there exists a chain map \(\tilde{f}_\bullet : P_\bullet \to Q_\bullet\) lifting \(f\) (i.e., the diagram commutes up to the augmentation). Moreover, any two such lifts are chain homotopic.
</div>

<div class="proof">
<strong>Proof.</strong> We construct the lift inductively. Define \(\tilde{f}_0 : P_0 \to Q_0\) as follows: since \(P_0\) is projective and \(Q_0 \to N\) is surjective, the composite \(P_0 \to M \xrightarrow{f} N\) lifts to a map \(\tilde{f}_0 : P_0 \to Q_0\). Now \(\tilde{f}_0\) maps \(\ker(P_0 \to M) = \mathrm{im}(d_1^P)\) to \(Q_0\), and we need to lift to \(Q_1\). Since \(\tilde{f}_0 \circ d_1^P : P_1 \to Q_0\) has image in \(\ker(Q_0 \to N) = \mathrm{im}(d_0^Q)\), and since \(P_1\) is projective and \(Q_1 \twoheadrightarrow \ker(Q_0 \to N)\) is surjective (by exactness of the injective resolution), we can lift to \(\tilde{f}_1 : P_1 \to Q_1\). Continue by induction.

For uniqueness up to homotopy: if \(\tilde{f}\) and \(\tilde{g}\) are two lifts, then \(\tilde{f} - \tilde{g}\) is a chain map \(P_\bullet \to Q_\bullet\) lifting \(0 : M \to N\). Construct the homotopy \(h\) inductively using the projective property at each stage. \(\square\)
</div>

<div class="corollary">
<strong>Corollary 14.5.</strong> Any two projective resolutions of the same module \(M\) are homotopy equivalent. Consequently, for any additive functor \(F\), the homology \(H_n(F(P_\bullet))\) is independent of the choice of projective resolution \(P_\bullet\).
</div>

This corollary is the precise statement that derived functors are well-defined, anticipating the construction of Chapter 15.

### 14.4 The Horseshoe Lemma

The horseshoe lemma allows one to construct resolutions of the total module \(B\) from resolutions of the sub- and quotient modules \(A\) and \(C\) in a short exact sequence \(0 \to A \to B \to C \to 0\).

<div class="theorem">
<strong>Theorem 14.6 (Horseshoe Lemma).</strong> Let \(0 \to A \to B \to C \to 0\) be a short exact sequence of \(R\)-modules with projective resolutions \(P_\bullet \twoheadrightarrow A\) and \(Q_\bullet \twoheadrightarrow C\). Then there is a projective resolution \((P \oplus Q)_\bullet \twoheadrightarrow B\) such that the diagram:

\[
0 \to P_\bullet \to (P \oplus Q)_\bullet \to Q_\bullet \to 0
\]
is a short exact sequence of chain complexes lifting \(0 \to A \to B \to C \to 0\).
</div>

The name comes from the shape of the diagram: two vertical resolutions (the "sides" of the horseshoe) are filled in by the middle resolution (the "arch"). The horseshoe lemma is used to show that long exact sequences in derived functors arise from short exact sequences of modules (the connecting morphism in the derived long exact sequence is compatible with the connecting morphism of the original short exact sequence).

### 14.5 Projective and Injective Dimension

The length of the shortest projective (or injective) resolution of a module is a fundamental measure of its homological complexity.

<div class="definition">
<strong>Definition 14.7 (Projective and Injective Dimension).</strong> The <em>projective dimension</em> \(\mathrm{pd}(M)\) of a module \(M\) is the infimum of lengths of projective resolutions:

\[
\mathrm{pd}(M) = \min\{n \geq 0 : \text{there is a projective resolution } 0 \to P_n \to \cdots \to P_0 \to M \to 0\}.
\]
If no finite-length projective resolution exists, \(\mathrm{pd}(M) = \infty\). Dually, the <em>injective dimension} \(\mathrm{id}(M)\) is the minimum length of an injective resolution.

The <em>global dimension</em> of \(R\) is:

\[
\mathrm{gldim}(R) = \sup\{\mathrm{pd}(M) : M \in R\text{-}\mathbf{Mod}\}.
\]
</div>

<div class="theorem">
<strong>Theorem 14.8 (Hilbert Syzygy Theorem).</strong> For the polynomial ring \(R = k[x_1, \ldots, x_n]\) over a field \(k\):
<ol>
<li>\(\mathrm{gldim}(R) = n\).</li>
<li>Every finitely generated \(R\)-module \(M\) has a finite free resolution of length at most \(n\): there is an exact sequence \(0 \to F_n \to \cdots \to F_0 \to M \to 0\) with each \(F_i\) free and finitely generated.</li>
</ol>
</div>

Hilbert proved this in 1890 for the case of ideals in polynomial rings (the original "Hilbert's theorem on syzygies"), introducing the concept of what we now call free resolutions. The statement that \(\mathrm{gldim}(k[x_1,\ldots,x_n]) = n\) can be reformulated: the residue field \(k = k[x_1,\ldots,x_n]/(x_1,\ldots,x_n)\) has projective dimension exactly \(n\) (its minimal free resolution is the Koszul complex of length \(n\)). The theorem places the Koszul complex at the heart of commutative algebra.

## Chapter 15: Derived Functors

### 15.1 Left Derived Functors

With the machinery of Chapter 14 in place, we can now construct the derived functors. The idea is simple but powerful: apply a right-exact functor to a projective resolution, observe that the result may not be exact, and record the deviation from exactness as a sequence of "derived" modules.

<div class="definition">
<strong>Definition 15.1 (Left Derived Functors).</strong> Let \(F : R\text{-}\mathbf{Mod} \to \mathbf{Ab}\) be a right exact additive functor. Choose, for each \(R\)-module \(M\), a projective resolution \(P_\bullet \xrightarrow{\epsilon} M \to 0\). The <em>\(n\)th left derived functor</em> of \(F\) is:

\[
L_n F(M) := H_n(F(P_\bullet)) = H_n(\cdots \to F(P_1) \to F(P_0) \to 0).
\]
By the Comparison Theorem (14.4), this is independent of the choice of resolution. The assignments \(M \mapsto L_n F(M)\) define additive functors \(L_n F : R\text{-}\mathbf{Mod} \to \mathbf{Ab}\) for each \(n \geq 0\).
</div>

Several immediate properties:
<ul>
<li>\(L_0 F(M) \cong F(M)\): since \(F\) is right exact and \(P_1 \to P_0 \to M \to 0\) is exact, applying \(F\) gives \(F(P_1) \to F(P_0) \to F(M) \to 0\) exact, so \(H_0 = \mathrm{coker}(F(P_1) \to F(P_0)) \cong F(M)\).</li>
<li>\(L_n F(P) = 0\) for \(n > 0\) and any projective \(P\): \(P\) has the projective resolution \(0 \to P \to P \to 0\), so \(H_n\) vanishes for \(n > 0\).</li>
<li>Every short exact sequence \(0 \to A \to B \to C \to 0\) gives a long exact sequence: \(\cdots \to L_n F(A) \to L_n F(B) \to L_n F(C) \xrightarrow{\partial} L_{n-1} F(A) \to \cdots \to F(A) \to F(B) \to F(C) \to 0\).</li>
</ul>

### 15.2 Right Derived Functors

Dually, a left-exact functor \(G\) is "completed" by its right derived functors, computed using injective resolutions.

<div class="definition">
<strong>Definition 15.2 (Right Derived Functors).</strong> Let \(G : R\text{-}\mathbf{Mod} \to \mathbf{Ab}\) be a left exact additive functor. For each module \(M\), choose an injective resolution \(0 \to M \to I^0 \to I^1 \to \cdots\). The <em>\(n\)th right derived functor</em> of \(G\) is:

\[
R^n G(M) := H^n(G(I^\bullet)) = H^n(0 \to G(I^0) \to G(I^1) \to \cdots).
\]
Properties:
<ul>
<li>\(R^0 G(M) \cong G(M)\) (since \(G\) is left exact).</li>
<li>\(R^n G(I) = 0\) for \(n > 0\) and any injective \(I\).</li>
<li>Short exact sequences give long exact sequences: \(0 \to G(A) \to G(B) \to G(C) \to R^1 G(A) \to \cdots\)</li>
</ul>
</div>

<div class="example">
<strong>Example 15.3 (Sheaf Cohomology as Right Derived Functor).</strong> Let \(X\) be a topological space and \(\mathbf{Sh}(X)\) the abelian category of sheaves of abelian groups on \(X\). The global section functor \(\Gamma(X, -) : \mathbf{Sh}(X) \to \mathbf{Ab}\) is left exact but generally not exact (the section functor does not preserve surjections). The right derived functors are the sheaf cohomology groups: \(R^n \Gamma(X, \mathcal{F}) = H^n(X, \mathcal{F})\).

The exactness fails because a surjection of sheaves (a sheaf epimorphism) need not be surjective on global sections — a section over the total space might only be patchable locally. The \(H^n(X, \mathcal{F})\) measure this obstruction to global existence of sections. For constant sheaves, this recovers singular cohomology; for structure sheaves of complex manifolds, this gives Dolbeault cohomology (by the \(\overline{\partial}\)-Poincaré lemma, which identifies injective resolutions with the Dolbeault complex).
</div>

### 15.3 Universal Delta-Functors and Grothendieck's Axioms

The collections \(\{L_n F\}_{n \geq 0}\) and \(\{R^n G\}_{n \geq 0}\) are examples of *delta-functors*. Grothendieck's abstract theory characterizes derived functors universally, showing that the derived functors of \(F\) are (up to isomorphism) the unique "erасable" (effaceable) delta-functor extending \(F\).

<div class="definition">
<strong>Definition 15.4 (Delta-Functor).</strong> A (covariant) <em>cohomological delta-functor</em> between abelian categories \(\mathcal{A}\) and \(\mathcal{B}\) is a collection \(T = (T^n)_{n \geq 0}\) of additive functors \(T^n : \mathcal{A} \to \mathcal{B}\) together with, for each short exact sequence \(0 \to A \to B \to C \to 0\), natural connecting morphisms \(\delta^n : T^n(C) \to T^{n+1}(A)\) such that:
<ul>
<li>The sequence \(\cdots \to T^n(B) \to T^n(C) \xrightarrow{\delta^n} T^{n+1}(A) \to \cdots\) is exact.</li>
<li>The \(\delta^n\) are natural (functorial in the short exact sequence).</li>
</ul>
A delta-functor \(T\) is <em>universal</em> if for any other delta-functor \(S\) and any natural transformation \(T^0 \to S^0\), there is a unique extension to a morphism of delta-functors \(T \to S\).
</div>

<div class="theorem">
<strong>Theorem 15.5 (Grothendieck).</strong> Let \(F : \mathcal{A} \to \mathcal{B}\) be a right exact functor between abelian categories, where \(\mathcal{A}\) has enough projectives. The left derived functors \((L_n F)_{n \geq 0}\) form a universal cohomological delta-functor with \(L_0 F \cong F\). An <em>effaceable</em> delta-functor (one for which each \(T^n\), \(n > 0\), sends any object to zero on some monomorphism covering that object) is universal. The right derived functors \((R^n G)_{n \geq 0}\) of a left-exact functor \(G\) are characterized by the dual (effaceable means vanishing on injectives).
</div>

### 15.4 Acyclic Resolutions

In practice, computing derived functors using injective or projective resolutions can be difficult — injective modules are large and hard to describe explicitly. A powerful shortcut is to use *acyclic* resolutions: resolutions by objects on which all higher derived functors vanish, without requiring those objects to be projective or injective.

<div class="definition">
<strong>Definition 15.6 (Acyclic Objects and Acyclic Resolutions).</strong> Let \(F : \mathcal{A} \to \mathcal{B}\) be a right exact functor. An object \(N \in \mathcal{A}\) is <em>\(F\)-acyclic</em> (for the left derived functors) if \(L_n F(N) = 0\) for all \(n > 0\). An <em>\(F\)-acyclic resolution</em> of \(M\) is a resolution \(0 \to N_0 \to N_1 \to \cdots\) (or projective-type) where each \(N_i\) is \(F\)-acyclic.
</div>

<div class="theorem">
<strong>Theorem 15.7 (Acyclic Resolution Theorem).</strong> Let \(F\) be left exact and \(0 \to M \to N^0 \to N^1 \to \cdots\) an \(F\)-acyclic resolution. Then \(R^n F(M) \cong H^n(F(N^\bullet))\). In other words, one may use acyclic resolutions in place of injective ones.
</div>

<div class="example">
<strong>Example 15.8 (de Rham Cohomology as a Derived Functor).</strong> Let \(M\) be a smooth manifold and \(\underline{\mathbb{R}}\) the constant sheaf on \(M\). The de Rham complex \(0 \to \underline{\mathbb{R}} \to \Omega^0 \xrightarrow{d} \Omega^1 \xrightarrow{d} \Omega^2 \to \cdots\) provides a resolution of the constant sheaf by the sheaves of differential forms. By the Poincaré lemma, each \(\Omega^k\) is acyclic for the global section functor \(\Gamma(M, -)\) (the sheaves of differential forms are fine sheaves, hence acyclic). Applying the Acyclic Resolution Theorem:

\[
H^n(M; \mathbb{R}) = R^n \Gamma(M, \underline{\mathbb{R}}) \cong H^n_{\mathrm{dR}}(M) = H^n(\Gamma(M, \Omega^\bullet)).
\]
This is the de Rham theorem: singular cohomology with real coefficients equals de Rham cohomology. The algebraic proof via acyclic resolutions unifies the analytic and topological perspectives.
</div>

## Chapter 16: Ext and Tor

### 16.1 Tor: Definition and Properties

<div class="definition">
<strong>Definition 16.1 (Tor).</strong> Let \(R\) be a ring, \(M\) a right \(R\)-module, and \(N\) a left \(R\)-module. Choose a projective resolution \(P_\bullet \xrightarrow{\sim} N\) of \(N\). The <em>Tor groups</em> are:

\[
\mathrm{Tor}_n^R(M, N) := L_n(M \otimes_R -)(N) = H_n(M \otimes_R P_\bullet).
\]
Alternatively, resolve \(M\) by a projective resolution \(Q_\bullet \xrightarrow{\sim} M\) of right \(R\)-modules and compute \(H_n(Q_\bullet \otimes_R N)\).
</div>

The key fact, which requires the Horseshoe Lemma and the comparison theorem, is that both approaches give the same answer:

<div class="theorem">
<strong>Theorem 16.2 (Balance of Tor).</strong> There is a natural isomorphism \(H_n(M \otimes_R P_\bullet) \cong H_n(Q_\bullet \otimes_R N)\) for any projective resolutions \(P_\bullet\) of \(N\) and \(Q_\bullet\) of \(M\). In other words, \(\mathrm{Tor}_n^R(M, N)\) can be computed by resolving either variable.
</div>

This symmetry ("balance") is not obvious — tensor product is a priori a functor in each variable separately, and the two derived functor constructions (resolve first or second variable) could a priori differ. The balance theorem shows they do not, and gives Tor a canonical status independent of the choice.

<div class="theorem">
<strong>Theorem 16.3 (Properties of Tor).</strong>
<ol>
<li>\(\mathrm{Tor}_0^R(M, N) \cong M \otimes_R N\).</li>
<li>If \(P\) is projective (or flat), \(\mathrm{Tor}_n^R(P, N) = 0\) for all \(n > 0\).</li>
<li>For any short exact sequence \(0 \to A \to B \to C \to 0\) of left \(R\)-modules, there is a long exact sequence: \(\cdots \to \mathrm{Tor}_{n}^R(M, A) \to \mathrm{Tor}_n^R(M, B) \to \mathrm{Tor}_n^R(M, C) \to \mathrm{Tor}_{n-1}^R(M, A) \to \cdots \to M \otimes_R A \to M \otimes_R B \to M \otimes_R C \to 0.\)</li>
<li>\(\mathrm{Tor}_n^R(M, N) \cong \mathrm{Tor}_n^R(N, M)\) when \(R\) is commutative.</li>
<li>Tor commutes with filtered colimits (direct limits): \(\mathrm{Tor}_n^R(M, \varinjlim N_i) \cong \varinjlim \mathrm{Tor}_n^R(M, N_i)\).</li>
</ol>
</div>

<div class="example">
<strong>Example 16.4 (Tor over \(\mathbb{Z}\)).</strong> Using the projective resolution \(0 \to \mathbb{Z} \xrightarrow{\times m} \mathbb{Z} \to \mathbb{Z}/m \to 0\) and tensoring with \(\mathbb{Z}/n\):

\[
0 \to \mathbb{Z}/n \xrightarrow{\times m} \mathbb{Z}/n \to \mathbb{Z}/m \otimes_\mathbb{Z} \mathbb{Z}/n \to 0.
\]
So \(\mathrm{Tor}_0(\mathbb{Z}/m, \mathbb{Z}/n) = \mathbb{Z}/n \otimes \mathbb{Z}/m \cong \mathbb{Z}/\gcd(m,n)\) and \(\mathrm{Tor}_1(\mathbb{Z}/m, \mathbb{Z}/n) = \ker(\times m : \mathbb{Z}/n \to \mathbb{Z}/n) = \{k \in \mathbb{Z}/n : mk \equiv 0 \pmod{n}\} \cong \mathbb{Z}/\gcd(m,n)\).

So for abelian groups, \(\mathrm{Tor}_1^\mathbb{Z}(\mathbb{Z}/m, \mathbb{Z}/n) \cong \mathbb{Z}/\gcd(m,n)\). Higher \(\mathrm{Tor}_n^\mathbb{Z}\) vanish for \(n \geq 2\) since \(\mathrm{gldim}(\mathbb{Z}) = 1\).
</div>

### 16.2 Tor and Flatness

<div class="theorem">
<strong>Theorem 16.5 (Tor and Flatness).</strong> Let \(M\) be a right \(R\)-module. The following are equivalent:
<ol>
<li>\(M\) is flat.</li>
<li>\(\mathrm{Tor}_1^R(M, N) = 0\) for all left \(R\)-modules \(N\).</li>
<li>\(\mathrm{Tor}_n^R(M, N) = 0\) for all \(n > 0\) and all \(N\).</li>
</ol>
</div>

This theorem shows that Tor is precisely the obstruction to flatness. The Govorov-Lazard theorem (§7.7) gives a geometric description: \(M\) is flat iff it is a filtered colimit of finitely generated free modules. Combined with (1) ↔ (2) above, this characterizes flatness both geometrically and homologically.

<div class="remark">
<strong>Remark 16.6 (Flat Base Change in Algebraic Geometry).</strong> Flatness is the correct algebraic notion of "continuously varying fiber" in algebraic geometry. A morphism of schemes \(f : X \to Y\) is flat if the stalks of \(\mathcal{O}_X\) are flat \(\mathcal{O}_{Y,f(x)}\)-modules. Flat morphisms behave well under base change (their fibers vary "algebraically" without jumping in dimension), and the Tor criterion for flatness gives precise control over when a base change preserves exactness. This is crucial for the formulation of smooth, étale, and proper morphisms in scheme theory.
</div>

### 16.3 Ext: Definition and Properties

<div class="definition">
<strong>Definition 16.7 (Ext).</strong> Let \(R\) be a ring and \(M, N\) left \(R\)-modules.

<em>Via projective resolution of \(M\)</em>: Choose \(P_\bullet \xrightarrow{\sim} M\). Apply \(\mathrm{Hom}_R(-, N)\) (which reverses arrows, turning the projective resolution into a cochain complex). Then:

\[
\mathrm{Ext}_R^n(M, N) := R^n \mathrm{Hom}_R(M, -)(N) = H^n(\mathrm{Hom}_R(P_\bullet, N)).
\]

<em>Via injective resolution of \(N\)</em>: Choose \(0 \to N \to I^\bullet\). Apply \(\mathrm{Hom}_R(M, -)\). Then:

\[
\mathrm{Ext}_R^n(M, N) = H^n(\mathrm{Hom}_R(M, I^\bullet)).
\]
These two constructions agree (by a balance theorem analogous to Tor).
</div>

<div class="theorem">
<strong>Theorem 16.8 (Properties of Ext).</strong>
<ol>
<li>\(\mathrm{Ext}_R^0(M, N) \cong \mathrm{Hom}_R(M, N)\).</li>
<li>If \(P\) is projective, \(\mathrm{Ext}_R^n(P, N) = 0\) for \(n > 0\). If \(I\) is injective, \(\mathrm{Ext}_R^n(M, I) = 0\) for \(n > 0\).</li>
<li>Short exact sequences in either variable give long exact sequences in Ext:
<ul>
<li>From \(0 \to A \to B \to C \to 0\) (in the first variable): \(0 \to \mathrm{Hom}(C,N) \to \mathrm{Hom}(B,N) \to \mathrm{Hom}(A,N) \to \mathrm{Ext}^1(C,N) \to \cdots\)</li>
<li>From \(0 \to L \to M \to N \to 0\) (in the second variable): \(0 \to \mathrm{Hom}(A,L) \to \mathrm{Hom}(A,M) \to \mathrm{Hom}(A,N) \to \mathrm{Ext}^1(A,L) \to \cdots\)</li>
</ul></li>
<li>For \(R\) commutative: \(\mathrm{Ext}_R^n(M, N) \cong \mathrm{Ext}_R^n(N, M)\) is false in general; Ext is not symmetric (unlike Tor). However, for self-injective rings (e.g., Gorenstein rings), a duality interchanges \(\mathrm{Ext}^i\) and \(\mathrm{Ext}^{d-i}\) where \(d\) is the dimension.</li>
</ol>
</div>

<div class="example">
<strong>Example 16.9 (Ext over \(\mathbb{Z}\)).</strong> From the free resolution \(0 \to \mathbb{Z} \xrightarrow{\times m} \mathbb{Z} \to \mathbb{Z}/m \to 0\), applying \(\mathrm{Hom}_\mathbb{Z}(-, \mathbb{Z}/n)\):

\[
0 \to \mathrm{Hom}(\mathbb{Z}/m, \mathbb{Z}/n) \to \mathrm{Hom}(\mathbb{Z}, \mathbb{Z}/n) \xrightarrow{\times m} \mathrm{Hom}(\mathbb{Z}, \mathbb{Z}/n) \to 0.
\]
So \(\mathrm{Ext}_\mathbb{Z}^0(\mathbb{Z}/m, \mathbb{Z}/n) = \mathrm{Hom}(\mathbb{Z}/m, \mathbb{Z}/n) \cong \mathbb{Z}/\gcd(m,n)\) and \(\mathrm{Ext}_\mathbb{Z}^1(\mathbb{Z}/m, \mathbb{Z}/n) = \mathrm{coker}(\times m : \mathbb{Z}/n \to \mathbb{Z}/n) \cong \mathbb{Z}/\gcd(m,n)\).

Thus \(\mathrm{Ext}^1_\mathbb{Z}(\mathbb{Z}/m, \mathbb{Z}/n) \cong \mathbb{Z}/\gcd(m,n) \cong \mathrm{Tor}_1^\mathbb{Z}(\mathbb{Z}/m, \mathbb{Z}/n)\). This equality is not a coincidence — over \(\mathbb{Z}\), there is a general duality \(\mathrm{Ext}^1_\mathbb{Z}(M, \mathbb{Z}/n) \cong \mathrm{Tor}_1^\mathbb{Z}(M, \mathbb{Z}/n)\) for finitely generated modules.
</div>

### 16.4 Ext and Extensions

One of the deepest facts about \(\mathrm{Ext}^1\) is that it classifies extensions — this is what gives Ext its name.

<div class="theorem">
<strong>Theorem 16.10 (Ext\(^1\) Classifies Extensions).</strong> Let \(M, N\) be \(R\)-modules. There is a bijection between \(\mathrm{Ext}_R^1(M, N)\) and the set of equivalence classes of short exact sequences (extensions of \(M\) by \(N\)):

\[
0 \to N \to E \to M \to 0.
\]
Two such extensions are equivalent if there is a commutative diagram (with identity maps at the ends):

\[
\begin{array}{ccccccccc}
0 & \to & N & \to & E & \to & M & \to & 0 \\
& & \| & & \downarrow \cong & & \| & & \\
0 & \to & N & \to & E' & \to & M & \to & 0.
\end{array}
\]
The zero element of \(\mathrm{Ext}^1(M, N)\) corresponds to the split extension \(0 \to N \to N \oplus M \to M \to 0\).
</div>

<div class="proof">
<strong>Proof sketch.</strong> Given a projective resolution \(P_1 \xrightarrow{d_1} P_0 \xrightarrow{\epsilon} M \to 0\) and an extension class \([\alpha] \in \mathrm{Ext}^1(M, N) = \ker(\partial)/\mathrm{im}(\cdot \circ d_1)\) (from the cochain complex \(\mathrm{Hom}(P_\bullet, N)\)), define the extension \(E\) as the pushout:

\[
\begin{array}{ccc}
P_1 & \xrightarrow{\alpha} & N \\
\downarrow d_1 & \square & \downarrow \\
P_0 & \to & E
\end{array}
\]
One verifies that \(E\) is an extension of \(M\) by \(N\), and that equivalent extensions arise from cohomologous cocycles. The map is a bijection by an explicit inverse construction: given \(0 \to N \to E \to M \to 0\), lift \(\epsilon : P_0 \to M\) to \(\tilde\epsilon : P_0 \to E\) (projective!), then the composite \(P_1 \to P_0 \to E \to N\) is a cocycle. \(\square\)
</div>

<div class="example">
<strong>Example 16.11 (Extensions of \(\mathbb{Z}/2\) by \(\mathbb{Z}/2\)).</strong> We have \(\mathrm{Ext}^1_\mathbb{Z}(\mathbb{Z}/2, \mathbb{Z}/2) \cong \mathbb{Z}/2\). So there are two non-isomorphic extensions of \(\mathbb{Z}/2\) by \(\mathbb{Z}/2\) (as abelian groups):
<ul>
<li>The split extension: \(0 \to \mathbb{Z}/2 \to \mathbb{Z}/2 \oplus \mathbb{Z}/2 \to \mathbb{Z}/2 \to 0\). (Generator: 0 in \(\mathrm{Ext}^1\).)</li>
<li>The non-split extension: \(0 \to \mathbb{Z}/2 \to \mathbb{Z}/4 \to \mathbb{Z}/2 \to 0\). (Generator: 1 in \(\mathrm{Ext}^1\).)</li>
</ul>
This classification problem — understanding all extensions — is a central question in group theory (group extensions), Galois theory (\(\mathrm{Ext}\) for Galois modules), and algebraic topology (Postnikov towers are classified by cohomological extension classes).
</div>

### 16.5 Ext via Yoneda: Higher Extensions

The description of \(\mathrm{Ext}^n\) as classifying \(n\)-fold extensions (long exact sequences \(0 \to N \to E_n \to \cdots \to E_1 \to M \to 0\)) is due to Yoneda (1954), and provides a beautiful intrinsic description without choosing resolutions.

<div class="definition">
<strong>Definition 16.12 (Yoneda Ext).</strong> An <em>\(n\)-fold extension of \(M\) by \(N\)</em> is an exact sequence:

\[
\xi : 0 \to N \to E_n \to E_{n-1} \to \cdots \to E_1 \to M \to 0.
\]
Two such sequences are <em>Yoneda equivalent</em> if they can be connected by a chain of morphisms of exact sequences (not necessarily isomorphisms, but morphisms that are identities at the \(N\) and \(M\) ends, forming a zig-zag). The set of Yoneda equivalence classes is denoted \(\mathrm{Ext}^n_Y(M, N)\).

The <em>Yoneda product</em> (or Yoneda composition) \(\mathrm{Ext}^m(N, L) \times \mathrm{Ext}^n(M, N) \to \mathrm{Ext}^{m+n}(M, L)\) is defined by concatenating extensions.
</div>

<div class="theorem">
<strong>Theorem 16.13 (Yoneda's Equivalence).</strong> For any abelian category \(\mathcal{A}\) and objects \(M, N\), there is a natural isomorphism:

\[
\mathrm{Ext}^n_\mathcal{A}(M, N) \cong \mathrm{Ext}^n_Y(M, N).
\]
The Yoneda product is associative and makes \(\mathrm{Ext}^\bullet_\mathcal{A}(M, M) = \bigoplus_{n \geq 0} \mathrm{Ext}^n(M, M)\) into a graded \(R\)-algebra (the <em>Ext algebra</em> of \(M\)).
</div>

The Yoneda description works in any abelian category, even without enough projectives or injectives — this is its chief advantage over the derived functor approach. The Yoneda product is the key structure: it endows the Ext groups with algebraic structure beyond just being abelian groups.

<div class="remark">
<strong>Remark 16.14 (The Ext Algebra and Koszul Duality).</strong> The Ext algebra \(\mathrm{Ext}^\bullet_{k[x_1,\ldots,x_n]}(k, k)\) (where \(k\) is the residue field) is isomorphic to the exterior algebra \(\bigwedge^\bullet(y_1, \ldots, y_n)\) on \(n\) generators of degree 1. This is computed from the Koszul complex and is the fundamental example of Koszul duality: the polynomial algebra and the exterior algebra are Koszul duals of each other.

More generally, a Koszul algebra \(A\) (a graded algebra with "nice" resolution of the base field) has a Koszul dual \(A^! = \mathrm{Ext}^\bullet_A(k, k)\), and there is an equivalence of derived categories \(\mathbf{D}(A) \simeq \mathbf{D}(A^!)\) (Beilinson-Ginzburg-Soergel, 1996). Koszul duality is a deep generalization of Fourier transform and Pontryagin duality, and plays a central role in geometric representation theory, the theory of perverse sheaves, and mirror symmetry.
</div>

### 16.6 Applications: Universal Coefficients, Group Cohomology, Hochschild Cohomology

The formalism of Ext and Tor connects directly to classical and modern mathematics through a series of fundamental theorems. We record the most important.

<div class="theorem">
<strong>Theorem 16.15 (Universal Coefficient Theorem).</strong> Let \(C_\bullet\) be a chain complex of free abelian groups and \(G\) an abelian group. There are natural short exact sequences:

\[
0 \to H_n(C_\bullet) \otimes_\mathbb{Z} G \to H_n(C_\bullet \otimes G) \to \mathrm{Tor}_1^\mathbb{Z}(H_{n-1}(C_\bullet), G) \to 0,
\]

\[
0 \to \mathrm{Ext}_\mathbb{Z}^1(H_{n-1}(C_\bullet), G) \to H^n(\mathrm{Hom}(C_\bullet, G)) \to \mathrm{Hom}(H_n(C_\bullet), G) \to 0.
\]
These sequences split (unnaturally). Taking \(C_\bullet\) to be the singular chain complex of a topological space \(X\), one obtains the universal coefficient theorems for singular homology and cohomology.
</div>

The universal coefficient theorem shows that the homology/cohomology of \(X\) with coefficients in an arbitrary abelian group \(G\) is determined (up to extension) by the integral homology \(H_\bullet(X; \mathbb{Z})\) together with Tor and Ext corrections. The Tor term accounts for torsion phenomena: if \(H_{n-1}(X;\mathbb{Z})\) has a finite cyclic summand, tensoring with \(G\) can create extra elements detected by Tor.

<div class="theorem">
<strong>Theorem 16.16 (Künneth Formula).</strong> Let \(X, Y\) be topological spaces (with \(H_\bullet(X;\mathbb{Z})\) consisting of free abelian groups). Then there is a natural short exact sequence:

\[
0 \to \bigoplus_{i+j=n} H_i(X;\mathbb{Z}) \otimes H_j(Y;\mathbb{Z}) \to H_n(X \times Y;\mathbb{Z}) \to \bigoplus_{i+j=n-1} \mathrm{Tor}^\mathbb{Z}_1(H_i(X;\mathbb{Z}), H_j(Y;\mathbb{Z})) \to 0.
\]
</div>

The Künneth formula expresses the homology of a product in terms of the homologies of the factors. In the torsion-free case, it reduces to \(H_n(X \times Y) \cong \bigoplus_{i+j=n} H_i(X) \otimes H_j(Y)\), the clean "Künneth theorem." The Tor term corrects for torsion interactions.

<div class="theorem">
<strong>Theorem 16.17 (Group Cohomology).</strong> Let \(G\) be a group and \(M\) a left \(\mathbb{Z}[G]\)-module (a \(G\)-module). The <em>group cohomology</em> groups are:

\[
H^n(G; M) := \mathrm{Ext}^n_{\mathbb{Z}[G]}(\mathbb{Z}, M),
\]
where \(\mathbb{Z}\) is the trivial \(\mathbb{Z}[G]\)-module (group acts trivially). Dually, the <em>group homology</em> is \(H_n(G; M) := \mathrm{Tor}_n^{\mathbb{Z}[G]}(\mathbb{Z}, M)\).
</div>

Group cohomology was introduced by Eilenberg-MacLane and Hopf in the 1940s to study extension problems in group theory (related to the Schur multiplier \(H_2(G; \mathbb{Z})\)) and in algebraic topology (the cohomology of classifying spaces \(BG\)). The identifications:
<ul>
<li>\(H^0(G; M) = M^G = \{m \in M : gm = m \;\forall g \in G\}\) (invariants)</li>
<li>\(H^1(G; M) = \mathrm{Der}(G, M) / \mathrm{PrincDer}(G, M)\) (crossed homomorphisms modulo principal ones)</li>
<li>\(H^2(G; M)\) classifies extensions \(0 \to M \to \tilde{G} \to G \to 1\) with the action of \(G\) on \(M\) given</li>
</ul>
show that the abstract Ext machinery recovers and clarifies classical constructions. For finite groups, Tate cohomology \(\hat{H}^n(G; M)\) (combining positive and negative degrees) satisfies Tate duality and is central to class field theory and the cohomology of Galois groups.

<div class="theorem">
<strong>Theorem 16.18 (Hochschild Cohomology).</strong> Let \(A\) be a \(k\)-algebra and \(M\) an \(A\)-bimodule (equivalently, a left \(A \otimes_k A^{op}\)-module). The <em>Hochschild cohomology</em> is:

\[
HH^n(A, M) := \mathrm{Ext}^n_{A \otimes A^{op}}(A, M).
\]
Key identifications:
<ul>
<li>\(HH^0(A, M) = Z(M, A) = \{m \in M : am = ma \;\forall a \in A\}\) (center-like elements)</li>
<li>\(HH^1(A, M) = \mathrm{Der}(A, M) / \mathrm{InnDer}(A, M)\) (outer derivations from \(A\) to \(M\))</li>
<li>\(HH^2(A, M)\) classifies (infinitesimal) deformations of \(A\) with coefficients in \(M\)</li>
<li>\(HH^3(A, M)\) contains the obstruction to extending a deformation to higher order</li>
</ul>
</div>

<div class="remark">
<strong>Remark 16.19 (Deformation Theory and the DGLA Formalism).</strong> Hochschild cohomology is the gateway to deformation theory. Kontsevich's formality theorem (1997, Fields Medal 2008) states that the Hochschild cochain complex \(C^\bullet(A, A)\) is formal as a \(L_\infty\)-algebra — it is quasi-isomorphic to its cohomology. For \(A = C^\infty(M)\) (smooth functions on a Poisson manifold), this gives a canonical star product deforming the pointwise product to a non-commutative product, proving Bayen-Flato-Fronsdal-Lichnerowicz-Sternheimer's conjecture on deformation quantization.

The progression from classical Hochschild cohomology to \(L_\infty\)-algebras to deformation quantization illustrates how the abstract homological machinery — Ext functors, chain complexes, resolutions — connects to the deepest questions of mathematical physics. The homological algebra developed in these notes is not the end of the story, but the beginning of a much larger landscape encompassing derived algebraic geometry, \(\infty\)-categories, and the homotopy theory of algebras.
</div>

<div class="remark">
<strong>Remark 16.20 (Looking Forward: Spectral Sequences and Derived Geometry).</strong> Several topics that naturally follow from the material of these notes were not treated here due to scope:

<em>Spectral sequences</em> are the main computational tool for derived functors of composites: if \(F\) and \(G\) are functors with \(F\) sending injectives to \(G\)-acyclics, the Grothendieck spectral sequence computes \(R^{p+q}(F \circ G)\) from \(R^p F \circ R^q G\). Special cases include the Lyndon-Hochschild-Serre spectral sequence for group cohomology, the Serre spectral sequence for fibrations, and the Leray spectral sequence for sheaf cohomology.

<em>Triangulated categories and t-structures</em> formalize the structure of derived categories. A t-structure on \(\mathbf{D}(\mathcal{A})\) determines an abelian category (its "heart"), recovering \(\mathcal{A}\) for the standard t-structure. The category of perverse sheaves is the heart of a non-standard t-structure on \(\mathbf{D}^b_c(X)\) (bounded constructible derived category), and perverse sheaves are the right coefficients for the Decomposition Theorem of Beilinson-Bernstein-Deligne-Gabber.

<em>Derived algebraic geometry</em> (Lurie, Toën-Vezzosi) replaces rings by \(E_\infty\)-ring spectra (derived rings), schemes by derived schemes, and sheaves by \(\infty\)-sheaves. The resulting theory simultaneously handles deformation theory, intersection theory, and stable homotopy theory, and is the natural context for the geometric Langlands program and modern mathematical physics.

These directions each fill entire research programs, and the tools developed in this course — functors, adjunctions, abelian categories, derived functors, Ext and Tor — are the foundation on which all of them are built.
</div>

