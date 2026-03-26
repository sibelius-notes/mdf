---
title: "PMATH 367: Topology"
prof: "Stephen New"
---

These notes are based on the Fall 2024 lecture notes by Stephen New at the University of Waterloo, substantially enriched with motivation, examples, and narrative to serve as a self-contained introduction to point-set and elementary algebraic topology. The reader is assumed to have experience with real analysis (metric spaces, continuity, compactness) and basic group theory.

---

# Part I: Point-Set Topology

## Chapter 1: Topological Spaces and Continuous Maps

### The leap from metric spaces to topological spaces

The story of topology begins with a simple but powerful observation about metric spaces. In a course on real analysis, one learns that a subset \(U\) of a metric space \((X, d)\) is **open** if every point \(a \in U\) has some elbow room — there exists \(r > 0\) such that the open ball \(B(a, r) = \{x \in X \mid d(a,x) < r\}\) is entirely contained in \(U\). One then proves three fundamental properties of the collection of all open sets:

1. The empty set \(\emptyset\) and the whole space \(X\) are both open.
2. The union of any collection of open sets is open.
3. The intersection of any *finite* collection of open sets is open.

Why only finite intersections? Consider the open intervals \((-1/n, 1/n)\) in \(\mathbb{R}\). Each is open, but their intersection \(\bigcap_{n=1}^{\infty} (-1/n, 1/n) = \{0\}\) is a single point — decidedly not open. Finiteness is essential.

The leap of abstraction that defines topology as a discipline is this: *what if we forgot about the metric and kept only these three properties?* If we declare that a "topology" on a set \(X\) is any collection of subsets satisfying these axioms, we obtain a vastly more general framework that captures continuity, convergence, and connectedness without reference to distances. This is the concept of a **topological space**.

### Topological spaces

<div class="definition">

<strong>Definition 1.1.</strong> Let \(X\) be a set. A <strong>topology</strong> on \(X\) is a collection \(\mathcal{T}\) of subsets of \(X\) such that:

1. \(\emptyset \in \mathcal{T}\) and \(X \in \mathcal{T}\).
2. \(\mathcal{T}\) is closed under arbitrary unions: if \(\{U_k\}_{k \in K}\) is any collection of sets in \(\mathcal{T}\), then \(\bigcup_{k \in K} U_k \in \mathcal{T}\).
3. \(\mathcal{T}\) is closed under finite intersections: if \(U_1, U_2, \ldots, U_n \in \mathcal{T}\), then \(U_1 \cap U_2 \cap \cdots \cap U_n \in \mathcal{T}\).

A <strong>topological space</strong> is a pair \((X, \mathcal{T})\) where \(\mathcal{T}\) is a topology on \(X\). The sets in \(\mathcal{T}\) are called the <strong>open subsets</strong> of \(X\), and their complements are called the <strong>closed subsets</strong>.

</div>

Note that to verify property (3), it suffices to check pairwise intersections: if \(A, B \in \mathcal{T}\) implies \(A \cap B \in \mathcal{T}\), then induction handles any finite collection.

When \(a \in X\), an **open neighbourhood** of \(a\) is any open set \(U \in \mathcal{T}\) with \(a \in U\). The notion of "being near a point" is entirely determined by which open sets contain it.

When two topologies \(\mathcal{S}\) and \(\mathcal{T}\) on the same set satisfy \(\mathcal{S} \subseteq \mathcal{T}\), we say \(\mathcal{S}\) is **coarser** (fewer open sets, harder to separate points) and \(\mathcal{T}\) is **finer** (more open sets, more discriminating). This terminology reflects a lattice of topologies ordered by inclusion.

### First examples

Every metric space gives a topology (the **metric topology**), but there are two extreme cases that require no metric at all.

<div class="definition">

<strong>Definition 1.2.</strong> On any set \(X\):
- The <strong>trivial (indiscrete) topology</strong> is \(\{\emptyset, X\}\). It is the coarsest possible topology — nothing can be distinguished from anything else.
- The <strong>discrete topology</strong> is \(\mathcal{P}(X)\), the power set. Every subset is open. It is the finest possible topology — every point is isolated.

</div>

<div class="example">

<strong>Example 1.3.</strong> Let \(X = \{1, 2, 3\}\). The collections \(\mathcal{R} = \{\emptyset, \{1\}, X\}\), \(\mathcal{S} = \{\emptyset, \{1\}, \{1,2\}, X\}\), and \(\mathcal{T} = \{\emptyset, \{1\}, \{1,2\}, \{1,3\}, X\}\) are all topologies on \(X\). However, \(\mathcal{B} = \{\emptyset, \{1\}, \{2\}, X\}\) is *not* a topology because \(\{1\} \cup \{2\} = \{1,2\} \notin \mathcal{B}\).

</div>

### Closed sets, interior, closure, and boundary

The interplay between open and closed sets is one of the central themes of point-set topology. Closed sets are precisely the complements of open sets, and they satisfy dual axioms.

<div class="theorem">

<strong>Theorem 1.4.</strong> Let \(\mathcal{F}\) denote the collection of all closed sets in a topological space \(X\). Then:

1. \(\emptyset \in \mathcal{F}\) and \(X \in \mathcal{F}\).
2. \(\mathcal{F}\) is closed under arbitrary intersections.
3. \(\mathcal{F}\) is closed under finite unions.

</div>

<div class="proof">

<strong>Proof.</strong> This follows by taking complements and applying De Morgan's laws: \(\left(\bigcup_{k \in K} A_k\right)^c = \bigcap_{k \in K} A_k^c\) and \(\left(\bigcap_{k \in K} A_k\right)^c = \bigcup_{k \in K} A_k^c\). ∎

</div>

A set can be both open and closed (such as \(\emptyset\) and \(X\) in any topology, or every set in the discrete topology), or neither (such as \([0,1)\) in \(\mathbb{R}\)).

<div class="definition">

<strong>Definition 1.5.</strong> Let \(X\) be a topological space and \(A \subseteq X\).

- The <strong>interior</strong> of \(A\), denoted \(A^\circ\) or \(\operatorname{Int}(A)\), is the largest open set contained in \(A\) — equivalently, the union of all open sets contained in \(A\).
- The <strong>closure</strong> of \(A\), denoted \(\overline{A}\) or \(\operatorname{Cl}(A)\), is the smallest closed set containing \(A\) — equivalently, the intersection of all closed sets containing \(A\).
- The <strong>boundary</strong> of \(A\), denoted \(\partial A\), is \(\partial A = \overline{A} \setminus A^\circ\).

</div>

The interior and closure are idempotent operations: \((A^\circ)^\circ = A^\circ\) and \(\overline{\overline{A}} = \overline{A}\). A set is open if and only if \(A = A^\circ\), and closed if and only if \(A = \overline{A}\). Every set decomposes as the disjoint union \(\overline{A} = A^\circ \cup \partial A\).

![Interior, closure, and boundary of a set A in X](/pics/367/interior-closure-boundary.svg)

There is a useful pointwise characterization of these concepts. A point \(a\) lies in \(A^\circ\) precisely when some open neighbourhood of \(a\) is entirely contained in \(A\). A point \(a\) lies in \(\overline{A}\) precisely when *every* open neighbourhood of \(a\) meets \(A\).

<div class="definition">

<strong>Definition 1.6.</strong> A <strong>limit point</strong> (or <strong>accumulation point</strong>) of \(A\) in \(X\) is a point \(a \in X\) such that every open neighbourhood of \(a\) contains a point of \(A\) other than \(a\) itself, i.e., \((U \setminus \{a\}) \cap A \neq \emptyset\) for all open \(U\) with \(a \in U\). The set of limit points of \(A\) is denoted \(A'\).

</div>

<div class="theorem">

<strong>Theorem 1.7.</strong> For any \(A \subseteq X\), we have \(\overline{A} = A \cup A'\). Consequently, \(A\) is closed if and only if \(A' \subseteq A\).

</div>

### Bases for topologies

Specifying every open set in a topology can be unwieldy. A **basis** provides a compact description from which the entire topology can be recovered, much like how a basis for a vector space generates the whole space.

<div class="definition">

<strong>Definition 1.8.</strong> Let \(X\) be a set. A <strong>basis of sets</strong> in \(X\) is a collection \(\mathcal{B}\) of subsets of \(X\) such that:

1. For every \(a \in X\), there exists \(B \in \mathcal{B}\) with \(a \in B\).
2. For every \(a \in X\) and \(C, D \in \mathcal{B}\) with \(a \in C \cap D\), there exists \(B \in \mathcal{B}\) with \(a \in B \subseteq C \cap D\).

The topology **generated** by \(\mathcal{B}\) consists of all sets \(U\) such that for every \(a \in U\), there exists \(B \in \mathcal{B}\) with \(a \in B \subseteq U\). Equivalently, the topology consists of all unions of elements of \(\mathcal{B}\).

</div>

<div class="theorem">

<strong>Theorem 1.9.</strong> The topology generated by a basis \(\mathcal{B}\) equals:
1. The collection of all \(U \subseteq X\) such that for every \(a \in U\), there exists \(B \in \mathcal{B}\) with \(a \in B \subseteq U\).
2. The collection of all unions of sets in \(\mathcal{B}\) (including the empty union, giving \(\emptyset\)).

These two descriptions coincide, and they form a topology.

</div>

<div class="example">

<strong>Example 1.10.</strong> The open balls \(\{B(a, r) \mid a \in X, r > 0\}\) form a basis for the metric topology on any metric space \(X\). This is why the metric topology is sometimes called the "open ball topology."

</div>

A useful criterion: if \(\mathcal{B} \subseteq \mathcal{T}\), then \(\mathcal{B}\) is a basis for \(\mathcal{T}\) if and only if for every \(a \in X\) and \(U \in \mathcal{T}\) with \(a \in U\), there exists \(B \in \mathcal{B}\) with \(a \in B \subseteq U\). In other words, every open set can be "approximated from inside" by basis elements.

A powerful structural result underlies the flexibility of topological spaces: any collection \(\mathcal{S}\) of subsets of \(X\) generates a unique smallest topology containing \(\mathcal{S}\), because the intersection of any collection of topologies is again a topology.

### Hausdorff spaces

The axioms of a topological space are deliberately weak — so weak that they allow pathological behaviour. In the trivial topology, for instance, no two distinct points can be separated by open sets. To exclude such degeneracies, we impose **separation axioms**.

<div class="definition">

<strong>Definition 1.11.</strong> A topological space \(X\) is <strong>Hausdorff</strong> (or \(T_2\)) if for any two distinct points \(a, b \in X\), there exist disjoint open sets \(U\) and \(V\) with \(a \in U\) and \(b \in V\).

</div>

The Hausdorff condition ensures that limits of sequences (when they exist) are unique, and that one-point sets are closed. Every metric space is Hausdorff: given \(a \neq b\), take \(r = \frac{1}{2}d(a,b)\) and use the balls \(B(a,r)\) and \(B(b,r)\).

The Hausdorff property is so natural that many authors include it in the definition of a topological space. We do not, but the reader should be aware that nearly all spaces encountered in analysis, geometry, and algebra are Hausdorff.

### The subspace topology

Given a topological space \(Y\) and a subset \(X \subseteq Y\), there is a natural way to make \(X\) into a topological space.

<div class="definition">

<strong>Definition 1.12.</strong> Let \(Y\) be a topological space and \(X \subseteq Y\). The <strong>subspace topology</strong> on \(X\) is the collection \(\mathcal{T}_X = \{V \cap X \mid V \text{ open in } Y\}\).

</div>

This is indeed a topology on \(X\) (the verification is straightforward). A subset \(A \subseteq X\) is closed in the subspace topology if and only if \(A = B \cap X\) for some closed \(B\) in \(Y\). When a metric space \(Y\) has a subset \(X\), the subspace topology coincides with the metric topology on \(X\) using the restricted metric.

### Continuous maps and homeomorphisms

The concept of continuity generalizes naturally from metric spaces: instead of the \(\varepsilon\)-\(\delta\) definition, we use the "inverse image of open sets is open" formulation.

<div class="definition">

<strong>Definition 1.13.</strong> Let \(X\) and \(Y\) be topological spaces. A map \(f: X \to Y\) is <strong>continuous</strong> if \(f^{-1}(V)\) is open in \(X\) for every open set \(V\) in \(Y\). Equivalently, \(f\) is continuous if and only if \(f^{-1}(B)\) is closed in \(X\) for every closed set \(B\) in \(Y\).

A <strong>homeomorphism</strong> is a bijective continuous map whose inverse is also continuous. When a homeomorphism \(f: X \to Y\) exists, we write \(X \cong Y\) and say the spaces are <strong>homeomorphic</strong>.

</div>

Homeomorphism is the fundamental equivalence relation in topology. Two homeomorphic spaces are, from the topological viewpoint, *identical* — they have the same open sets, the same convergent sequences, the same connected components, and so on. The central problem of topology is to classify spaces up to homeomorphism and to find **invariants** that distinguish non-homeomorphic spaces.

<div class="theorem">

<strong>Theorem 1.14.</strong> The composition of continuous maps is continuous. Constant maps and inclusion maps of subspaces are continuous.

</div>

A useful technique for verifying continuity: if \(\mathcal{C}\) is a basis for the topology on \(Y\), then \(f: X \to Y\) is continuous if and only if \(f^{-1}(C)\) is open in \(X\) for every \(C \in \mathcal{C}\). This often simplifies checking continuity enormously.

Continuity can also be verified locally: if \(X\) is covered by open sets \(\{A_k\}\) and each restriction \(f|_{A_k}: A_k \to Y\) is continuous, then \(f\) is continuous. A similar "gluing lemma" holds for finitely many closed sets.

<div class="example">

<strong>Example 1.15.</strong> Here are some important homeomorphisms that illustrate the flexible nature of topological equivalence:

- The real line \(\mathbb{R}\) is homeomorphic to the open interval \((0,1)\) via \(f(x) = \frac{1}{2} + \frac{1}{\pi}\arctan(x)\). Despite their vastly different "sizes," they are topologically identical.

- The circle \(x^2 + y^2 = 1\) is homeomorphic to the ellipse \(\frac{x^2}{a^2} + \frac{y^2}{b^2} = 1\) via \(f(x,y) = (ax, by)\).

- The unit sphere \(S^n = \{x \in \mathbb{R}^{n+1} \mid \|x\| = 1\}\) with the north pole removed is homeomorphic to \(\mathbb{R}^n\) via **stereographic projection**: \(f(x) = \left(\frac{x_1}{1-x_{n+1}}, \ldots, \frac{x_n}{1-x_{n+1}}\right)\).

</div>

![Stereographic projection from the north pole maps S^n minus a point to R^n](/pics/367/stereographic.svg)

---

## Chapter 2: Examples of Topological Spaces

### The standard topology on Euclidean space

The most important topology in all of mathematics is the **standard topology** on \(\mathbb{R}^n\), induced by the standard metric \(d(x,y) = \sqrt{\sum_{k=1}^n (y_k - x_k)^2}\). Unless stated otherwise, subsets of \(\mathbb{R}^n\) always carry this topology (which coincides with the subspace topology).

### The order topology

Metric spaces are not the only natural source of topologies. Any linearly ordered set carries a natural topology defined by intervals.

<div class="definition">

<strong>Definition 2.1.</strong> Let \((X, <)\) be a linearly ordered set. The <strong>order topology</strong> on \(X\) has as a basis the open intervals \((a, b)\) for \(a < b\), together with \([\min X, b)\) if a minimum exists, and \((a, \max X]\) if a maximum exists.

</div>

The standard topology on \(\mathbb{R}\) is the order topology for the usual ordering. But the construction applies to any ordered set — the ordinals, the long line, the dictionary-ordered plane — yielding many interesting spaces.

A variation is the **lower limit topology** on \(\mathbb{R}\), denoted \(\mathbb{R}_\ell\), whose basis consists of half-open intervals \([a, b)\). This is strictly finer than the standard topology (every open interval \((a,b)\) is a union of sets \([c, b)\) with \(c > a\), but \([a, b)\) is not open in the standard topology). The lower limit topology, also called the **Sorgenfrey line**, provides many counterexamples in general topology.

### Product spaces

Given two topological spaces \(X\) and \(Y\), we want to put a natural topology on the Cartesian product \(X \times Y\). The right choice is dictated by the requirement that the projection maps should be continuous.

<div class="definition">

<strong>Definition 2.2.</strong> The <strong>product topology</strong> on \(X \times Y\) is generated by the basis \(\{U \times V \mid U \text{ open in } X, V \text{ open in } Y\}\). The projections \(p(x,y) = x\) and \(q(x,y) = y\) are continuous.

</div>

<div class="theorem">

<strong>Theorem 2.3 (Universal property of products).</strong> A map \(f: Z \to X \times Y\) is continuous if and only if both components \(g = p \circ f: Z \to X\) and \(h = q \circ f: Z \to Y\) are continuous.

</div>

This universal property is the *real* reason for the product topology — it is the unique topology making the product into a categorical product in the category of topological spaces.

<div class="example">

<strong>Example 2.4.</strong> The cylinder \(S^1 \times \mathbb{R}\) is homeomorphic to the punctured plane \(\mathbb{R}^2 \setminus \{0\}\) via \(f(x, t) = e^t x\) (viewing \(S^1 \subseteq \mathbb{C}\) and \(\mathbb{R}^2 = \mathbb{C}\)).

</div>

### Infinite products and the box vs. product topology

For an indexed family of spaces \(\{X_k\}_{k \in K}\), there are two natural candidates for a topology on the Cartesian product \(\prod_{k \in K} X_k\).

<div class="definition">

<strong>Definition 2.5.</strong> The <strong>box topology</strong> on \(\prod_{k \in K} X_k\) has basis elements \(\prod_{k \in K} U_k\) where each \(U_k\) is open in \(X_k\).

The <strong>product topology</strong> has basis elements \(\prod_{k \in K} U_k\) where each \(U_k\) is open in \(X_k\) and \(U_k = X_k\) for all but finitely many \(k\).

</div>

For finite index sets, the two topologies coincide. For infinite index sets, the product topology is strictly coarser. Why prefer the product topology? Because it satisfies the universal property: a map \(f: Z \to \prod X_k\) is continuous (in the product topology) if and only if each component \(p_k \circ f: Z \to X_k\) is continuous. The box topology breaks this — continuity of each component does not imply continuity of the product map. The product topology is also the one that makes Tychonoff's Theorem (compactness of products) work.

<div class="theorem">

<strong>Theorem 2.6.</strong> Using the product (or box) topology, \(\overline{\prod_{k \in K} A_k} = \prod_{k \in K} \overline{A_k}\).

</div>

### The quotient topology

Quotient spaces are one of the most important constructions in topology, allowing us to "glue" points together and build new spaces from old ones.

<div class="definition">

<strong>Definition 2.7.</strong> Let \(\sim\) be an equivalence relation on a topological space \(X\). The <strong>quotient space</strong> \(X/{\sim}\) is the set of equivalence classes, with the topology: \(V \subseteq X/{\sim}\) is open if and only if \(q^{-1}(V)\) is open in \(X\), where \(q: X \to X/{\sim}\) is the quotient map \(q(x) = [x]\).

</div>

The quotient topology is the finest topology making the quotient map continuous. It has a useful universal property: a map \(f: X/{\sim} \to Y\) is continuous if and only if \(f \circ q: X \to Y\) is continuous.

A particularly clean source of quotient spaces comes from group actions.

<div class="definition">

<strong>Definition 2.8.</strong> An <strong>action</strong> of a group \(G\) on a space \(X\) is a map \(G \times X \to X\), written \((g, x) \mapsto gx\), satisfying \(1 \cdot x = x\) and \((gh)x = g(hx)\). The **orbit space** \(X/G\) is the quotient by the equivalence relation \(x \sim y \iff gx = y\) for some \(g \in G\).

</div>

<div class="example">

<strong>Example 2.9.</strong> The group \(\mathbb{Z}\) acts on \(\mathbb{R}\) by addition: \(n \cdot t = t + n\). The orbit space \(\mathbb{R}/\mathbb{Z}\) is homeomorphic to the circle \(S^1\) via \(f([t]) = (\cos 2\pi t, \sin 2\pi t)\). This realizes the circle as the real line "wrapped around" with period 1.

</div>

<div class="example">

<strong>Example 2.10.</strong> The multiplicative group \(S^1 \subseteq \mathbb{C}^*\) acts on \(\mathbb{C}\) by multiplication. The orbits are circles centered at the origin (plus the origin itself), and the orbit space \(\mathbb{C}/S^1\) is homeomorphic to \([0, \infty)\) via \(f([z]) = |z|\).

</div>

Not all quotient constructions yield nice spaces. The action of \((0, \infty)\) on \(\mathbb{R}^2\) by scaling gives a quotient space that is *not* Hausdorff — the equivalence class of the origin cannot be separated from any ray.

---

## Chapter 3: Connected, Path-Connected, and Compact Spaces

These three properties — connectedness, path-connectedness, and compactness — are the workhorses of topology. They are **topological invariants**: preserved under homeomorphism. This makes them powerful tools for proving that two spaces are *not* homeomorphic.

### Connectedness

Intuitively, a space is connected if it is "in one piece." The formal definition captures this by saying the space cannot be partitioned into two non-trivial open sets.

<div class="definition">

<strong>Definition 3.1.</strong> A topological space \(X\) is <strong>connected</strong> if there do not exist two non-empty disjoint open sets \(A, B\) with \(A \cup B = X\). Equivalently, the only subsets of \(X\) that are both open and closed are \(\emptyset\) and \(X\) itself.

</div>

<div class="theorem">

<strong>Theorem 3.2.</strong> The image of a connected space under a continuous map is connected.

</div>

This is the key to many applications: if \(f: X \to Y\) is continuous and \(X\) is connected, then \(f(X)\) is connected. In particular, homeomorphic spaces share the same connectedness properties.

<div class="theorem">

<strong>Theorem 3.3.</strong> The connected subspaces of \(\mathbb{R}\) are precisely the intervals (including \(\emptyset\), single points, and \(\mathbb{R}\) itself).

</div>

This characterization is equivalent to the completeness of the real numbers (the least upper bound property).

<div class="theorem">

<strong>Theorem 3.4.</strong> Let \(\{A_k\}_{k \in K}\) be a collection of connected subspaces of \(X\) with \(\bigcap_{k \in K} A_k \neq \emptyset\). Then \(\bigcup_{k \in K} A_k\) is connected.

</div>

This "chain lemma" is the tool for building large connected sets from small ones: as long as the pieces overlap, their union stays connected.

<div class="theorem">

<strong>Theorem 3.5.</strong> If \(A\) is a connected subspace of \(X\) and \(A \subseteq B \subseteq \overline{A}\), then \(B\) is connected. In particular, the closure of a connected set is connected.

</div>

<div class="theorem">

<strong>Theorem 3.6.</strong> The product of two connected spaces is connected. More generally, the product of any collection of connected spaces is connected in the product topology.

</div>

The proof for arbitrary products is more delicate — one shows that certain finite-dimensional "slices" are connected (by the finite case), their union is connected (they share a common point), and this union is dense.

<div class="remark">

<strong>Remark 3.7.</strong> The box topology on \(\mathbb{R}^\omega = \prod_{k=1}^\infty \mathbb{R}\) destroys connectedness: the sets \(\{x \mid \|x\|_\infty < \infty\}\) and \(\{x \mid \|x\|_\infty = \infty\}\) separate \(\mathbb{R}^\omega\) in the box topology. This is another reason the product topology is preferred.

</div>

### Connected components

Every topological space decomposes uniquely into its maximal connected pieces.

<div class="definition">

<strong>Definition 3.8.</strong> The <strong>connected components</strong> of \(X\) are the equivalence classes of the relation \(x \sim y\) if there exists a connected subspace containing both \(x\) and \(y\).

</div>

Each connected component is connected and closed (being the closure of a connected set, which is connected). The connected components of \(\mathbb{Q}\) are the singletons — the rationals are **totally disconnected**.

### Path-connectedness

There is a stronger and more geometric notion of connectedness: the ability to walk continuously between any two points.

<div class="definition">

<strong>Definition 3.9.</strong> A <strong>path</strong> from \(a\) to \(b\) in \(X\) is a continuous map \(\alpha: [0,1] \to X\) with \(\alpha(0) = a\) and \(\alpha(1) = b\). A <strong>loop</strong> at \(a\) is a path from \(a\) to \(a\). The space \(X\) is <strong>path-connected</strong> if for every \(a, b \in X\), there exists a path from \(a\) to \(b\).

</div>

<div class="theorem">

<strong>Theorem 3.10.</strong> Every path-connected space is connected.

</div>

<div class="proof">

<strong>Proof.</strong> If \(X\) were disconnected, choose \(a \in U\) and \(b \in V\) from the separating open sets. A path \(\alpha\) from \(a\) to \(b\) would pull back the separation to \([0,1]\): the sets \(\alpha^{-1}(U)\) and \(\alpha^{-1}(V)\) would separate \([0,1]\), contradicting the connectedness of \([0,1]\). ∎

</div>

The converse is false. The **topologist's sine curve** \(\overline{A}\), where \(A = \{(x, \sin(1/x)) \mid x > 0\}\), is connected but not path-connected: there is no path from \(A\) to the segment \(\{0\} \times [-1, 1]\) despite the closure connecting them.

![The topologist's sine curve: connected but not path-connected](/pics/367/topologist-sine-curve.svg)

Every convex subset of a normed space is path-connected (the straight line between any two points lies in the set), providing a rich supply of path-connected spaces.

**Path-components** are defined analogously to connected components, using the equivalence relation of being connected by a path. Each path-component is contained in a single connected component.

### Compactness

Compactness is perhaps the most important topological property. It is a topological generalization of "finiteness" — a compact space, while potentially infinite, behaves in many ways like a finite set.

<div class="definition">

<strong>Definition 3.11.</strong> An <strong>open cover</strong> of \(X\) is a collection \(\mathcal{S}\) of open sets whose union is \(X\). A <strong>subcover</strong> is a subcollection that still covers \(X\). The space \(X\) is <strong>compact</strong> if every open cover has a **finite** subcover.

</div>

Why is compactness important? It allows us to pass from local information to global conclusions. If something is true "near every point" (captured by an open cover), compactness guarantees it is true "uniformly" (captured by finitely many sets).

<div class="theorem">

<strong>Theorem 3.12 (Heine-Borel).</strong> A subspace of \(\mathbb{R}^n\) is compact if and only if it is closed and bounded.

</div>

<div class="theorem">

<strong>Theorem 3.13.</strong> The continuous image of a compact space is compact.

</div>

This immediately implies the **extreme value theorem**: a continuous real-valued function on a compact space achieves its maximum and minimum.

<div class="theorem">

<strong>Theorem 3.14.</strong> Every closed subspace of a compact space is compact. Every compact subspace of a Hausdorff space is closed.

</div>

The second statement requires the Hausdorff condition — in a non-Hausdorff space, compact subsets need not be closed. The proof constructs, for each point outside the compact set, a pair of disjoint open sets using the Hausdorff property, then extracts a finite subcover to build a single open set separating the point from the compact set.

<div class="theorem">

<strong>Theorem 3.15.</strong> If \(X\) is compact and \(Y\) is Hausdorff and \(f: X \to Y\) is a continuous bijection, then \(f\) is a homeomorphism.

</div>

This remarkable result says that a continuous bijection from a compact space to a Hausdorff space is automatically a homeomorphism — the inverse is "free." This is used constantly in topology to avoid the labour of proving the inverse is continuous.

<div class="example">

<strong>Example 3.16.</strong> No two of \((0,1)\), \((0,1]\), and \([0,1]\) are homeomorphic. The interval \([0,1]\) is compact while the others are not. The spaces \((0,1)\) and \((0,1]\) differ because removing the endpoint 1 from \((0,1]\) leaves a connected space, while removing any point from \((0,1)\) disconnects it.

</div>

<div class="example">

<strong>Example 3.17.</strong> No two of \(\mathbb{R}^1\), \(\mathbb{R}^2\), \(S^1\), and \(S^2\) are homeomorphic. The spheres are compact, the Euclidean spaces are not. Among the spheres, \(S^2 \setminus \{p\} \cong \mathbb{R}^2\) and \(S^1 \setminus \{p\} \cong \mathbb{R}^1\), and these are not homeomorphic since removing a point from \(\mathbb{R}^2\) leaves a connected space, while removing a point from \(\mathbb{R}^1\) does not.

</div>

### Tychonoff's Theorem

The crown jewel of point-set topology is:

<div class="theorem">

<strong>Theorem 3.18 (Tychonoff).</strong> The product of any collection of compact spaces is compact in the product topology.

</div>

The proof uses Zorn's Lemma (equivalently, the Axiom of Choice) and the **finite intersection property**: a space is compact if and only if every collection of closed sets with the finite intersection property (every finite subcollection has non-empty intersection) has non-empty total intersection. This equivalence is the "closed set" dual of the open cover definition, obtained by taking complements.

Tychonoff's Theorem is powerful because it applies to *arbitrary* products. It underpins much of functional analysis (the Banach-Alaoglu theorem on weak-\(*\) compactness relies on it) and algebraic geometry.

---

# Part II: Separation, Countability, and Manifolds

## Chapter 4: Countability and Separation Axioms

### Countability axioms

How "large" is a topology? The countability axioms measure this using the lens of countability.

<div class="definition">

<strong>Definition 4.1.</strong> A topological space \(X\) is:

- **First-countable** if every point has a countable neighbourhood basis (a countable collection of open sets such that every neighbourhood of the point contains one of them).
- **Second-countable** if the topology has a countable basis.
- **Separable** if \(X\) has a countable dense subset.
- **Lindelöf** if every open cover has a countable subcover.

</div>

These properties are ordered by strength: second-countable implies all the others. In metric spaces, second-countability, separability, and the Lindelöf property are all equivalent.

<div class="example">

<strong>Example 4.2.</strong> The Sorgenfrey line \(\mathbb{R}_\ell\) is first-countable, Lindelöf, and separable (the rationals are dense), but *not* second-countable. This shows the equivalences for metric spaces do not hold in general. Even worse, the Sorgenfrey plane \(\mathbb{R}_\ell \times \mathbb{R}_\ell\) is not Lindelöf, showing that the Lindelöf property is not preserved by products.

</div>

### Separation axioms

The separation axioms form a hierarchy measuring how well the topology distinguishes points from closed sets.

<div class="definition">

<strong>Definition 4.3.</strong> A topological space \(X\) is:

- \(T_1\) if one-point sets are closed, equivalently, for distinct \(a, b\), there is an open set containing \(b\) but not \(a\).
- \(T_2\) (<strong>Hausdorff</strong>) if distinct points can be separated by disjoint open sets.
- \(T_3\) (<strong>regular</strong>) if \(X\) is \(T_1\) and points can be separated from closed sets by disjoint open sets.
- \(T_4\) (<strong>normal</strong>) if \(X\) is \(T_1\) and disjoint closed sets can be separated by disjoint open sets.

</div>

The hierarchy is: normal \(\Rightarrow\) regular \(\Rightarrow\) Hausdorff \(\Rightarrow\) \(T_1\). Every metrizable space is normal. Each implication is strict — there exist spaces at each level that fail the next.

Regularity has a useful equivalent formulation: \(X\) is regular if and only if for every point \(a\) and open \(W\) with \(a \in W\), there exists open \(U\) with \(a \in U \subseteq \overline{U} \subseteq W\). This says we can always "shrink" an open neighbourhood to get a closed neighbourhood.

<div class="theorem">

<strong>Theorem 4.4.</strong> Every compact Hausdorff space is normal.

</div>

<div class="theorem">

<strong>Theorem 4.5.</strong> Every regular space with a countable basis is normal.

</div>

### Urysohn's Lemma and its consequences

The separation axioms gain their power through Urysohn's Lemma, one of the deepest results in point-set topology.

<div class="theorem">

<strong>Theorem 4.6 (Urysohn's Lemma).</strong> Let \(X\) be normal and let \(A, B\) be disjoint closed subsets. Then there exists a continuous function \(f: X \to [0, 1]\) with \(f|_A = 0\) and \(f|_B = 1\).

</div>

The proof is a beautiful construction: one builds a family of open sets \(\{U_r\}_{r \in \mathbb{Q} \cap [0,1]}\) with \(\overline{U_r} \subseteq U_s\) whenever \(r < s\), and defines \(f(x) = \inf\{r \in \mathbb{Q} \mid x \in U_r\}\). The nested family of sets is built by induction along an enumeration of the rationals.

Urysohn's Lemma leads to two major theorems:

<div class="theorem">

<strong>Theorem 4.7 (Tietze Extension Theorem).</strong> Let \(X\) be normal and \(A \subseteq X\) closed. Every continuous map \(f: A \to [a, b]\) extends to a continuous map \(g: X \to [a, b]\). The same holds with the closed interval replaced by an open interval.

</div>

The proof of the Tietze Extension Theorem builds the extension as a uniformly convergent series, using Urysohn's Lemma at each step to approximate the function more closely.

<div class="theorem">

<strong>Theorem 4.8 (Urysohn's Metrization Theorem).</strong> Every regular space with a countable basis is metrizable.

</div>

<div class="proof">

<strong>Proof sketch.</strong> Using Urysohn's Lemma (the space is normal by Theorem 4.5), construct a countable family of continuous functions \(f_n: X \to [0, 1]\) that collectively separate points from closed sets. The map \(f: X \to [0, 1]^\omega\) given by \(f(x) = (f_1(x), f_2(x), \ldots)\) is then a homeomorphism onto its image. Since \([0, 1]^\omega\) is metrizable (in the product topology), so is \(X\). ∎

</div>

---

## Chapter 5: Topological Manifolds

Manifolds are the spaces where geometry and topology meet. They are the natural setting for calculus on curved spaces, and their study lies at the heart of modern mathematics and physics.

### Definition and examples

<div class="definition">

<strong>Definition 5.1.</strong> An <strong>\(n\)-dimensional topological manifold</strong> (or <strong>\(n\)-manifold</strong>) is a Hausdorff space \(X\) with a countable basis that is <strong>locally homeomorphic to \(\mathbb{R}^n\)</strong>: for every \(a \in X\), there exist an open set \(U_a \ni a\) and a homeomorphism \(\varphi_a: U_a \to V_a\) where \(V_a\) is open in \(\mathbb{R}^n\). The homeomorphisms \(\varphi_a\) are called <strong>charts</strong>, and a collection covering \(X\) is an <strong>atlas</strong>.

</div>

The Hausdorff condition and second-countability exclude pathological examples (like the "line with two origins") while still being general enough to include all spaces of geometric interest.

When two charts \(\varphi, \psi\) overlap, the composition \(\psi \circ \varphi^{-1}\) (a **transition function**) is a homeomorphism between open subsets of \(\mathbb{R}^n\). By imposing smoothness on these transition functions, one obtains a **smooth manifold** — the setting for differential geometry.

<div class="example">

<strong>Example 5.2.</strong> Key examples of manifolds:

- \(\mathbb{R}^n\) is an \(n\)-manifold (one chart: the identity).
- The \(n\)-sphere \(S^n = \{x \in \mathbb{R}^{n+1} \mid \|x\| = 1\}\) is an \(n\)-manifold, covered by two charts via stereographic projection from the north and south poles.
- The general linear group \(\mathrm{GL}_n(\mathbb{R})\) is an open subset of \(M_n(\mathbb{R}) \cong \mathbb{R}^{n^2}\), hence an \(n^2\)-manifold.
- The \(n\)-torus \(T^n = (S^1)^n\) is an \(n\)-manifold (product of manifolds is a manifold).

</div>

### Projective spaces

<div class="definition">

<strong>Definition 5.3.</strong> The <strong>real projective \(n\)-space</strong> \(\mathbb{P}^n = \mathbb{P}^n(\mathbb{R})\) is the set of lines through the origin in \(\mathbb{R}^{n+1}\). Formally, \(\mathbb{P}^n = (\mathbb{R}^{n+1} \setminus \{0\}) / \mathbb{R}^*\) where \(t \cdot x = tx\), with the quotient topology.

</div>

Projective space is an \(n\)-manifold: it is covered by \(n + 1\) charts \(U_k = \{[x_1, \ldots, x_{n+1}] \mid x_k \neq 0\}\), each homeomorphic to \(\mathbb{R}^n\) via \(\varphi_k([x]) = (x_1/x_k, \ldots, \widehat{x_k/x_k}, \ldots, x_{n+1}/x_k)\). Every manifold is regular, hence metrizable by the Urysohn Metrization Theorem.

One can also show \(\mathbb{P}^n \cong S^n / \{\pm 1\}\), the sphere with antipodal points identified.

### Classification of compact surfaces

One of the triumphs of 19th and early 20th century topology is the complete classification of compact connected 2-manifolds (surfaces) up to homeomorphism.

<div class="theorem">

<strong>Theorem 5.4 (Classification of Surfaces).</strong> Every compact connected 2-manifold is homeomorphic to exactly one of:

- \((T^2)^{\#g} = S^2 \# T^2 \# \cdots \# T^2\) (connected sum of \(g\) tori), for \(g \geq 0\), or
- \((\mathbb{P}^2)^{\#h} = \mathbb{P}^2 \# \cdots \# \mathbb{P}^2\) (connected sum of \(h\) projective planes), for \(h \geq 1\).

</div>

Here the **connected sum** \(X \# Y\) is formed by removing a small open disc from each surface and gluing along the resulting boundary circles. The sphere \(S^2\) is the identity: \(X \# S^2 \cong X\).

![The connected sum operation: remove a disc from each surface and glue along the boundaries](/pics/367/connected-sum.svg)

The proof proceeds through several stages:

1. **Triangulability**: Every compact 2-manifold can be triangulated, hence represented as a polygon with edges identified in pairs.
2. **Cut-and-paste operations**: Systematic moves (cutting along diagonals, reattaching along identified edges) reduce any edge-identification word to a standard form.
3. **Standard forms**: Orientable surfaces give the word \(a_1 b_1 a_1^{-1} b_1^{-1} \cdots a_g b_g a_g^{-1} b_g^{-1}\); non-orientable surfaces give \(a_1 a_1 a_2 a_2 \cdots a_h a_h\).
4. **Key relation**: \(\mathbb{P}^2 \# T^2 \cong \mathbb{P}^2 \# \mathbb{P}^2 \# \mathbb{P}^2\) (attaching a handle to a non-orientable surface is the same as adding two crosscaps).

![The four surfaces from a square with edge identifications](/pics/367/surface-identifications.svg)

<div class="example">

<strong>Example 5.5.</strong> The four surfaces obtained from a square by identifying opposite edges in pairs:

| Word | Surface |
| :--- | :--- |
| \(a b a^{-1} b^{-1}\) | Torus \(T^2\) |
| \(a b^{-1} a^{-1} b\) | Sphere \(S^2\) |
| \(a b a b\) | Klein bottle \(K^2 \cong \mathbb{P}^2 \# \mathbb{P}^2\) |
| \(a b a^{-1} b\) | Klein bottle \(K^2\) |

</div>

Two invariants suffice to distinguish all compact surfaces:

- **Orientability**: whether all edge identifications preserve orientation.
- **Euler characteristic**: \(\chi = V - E + F\) for any polygonalization (invariant by Theorem 5.4). We have \(\chi((T^2)^{\#g}) = 2 - 2g\) and \(\chi((\mathbb{P}^2)^{\#h}) = 2 - h\).

---

# Part III: The Fundamental Group

## Chapter 6: Homotopy of Paths and the Fundamental Group

We now make the leap from point-set topology to **algebraic topology**: the programme of associating algebraic objects (groups, rings, modules) to topological spaces in a way that respects continuous maps. The most accessible such invariant is the **fundamental group**, which detects "holes" by studying loops.

### Homotopy of paths

The key idea is that we should consider two paths "the same" if one can be continuously deformed into the other.

<div class="definition">

<strong>Definition 6.1.</strong> Let \(\alpha, \beta: [0,1] \to X\) be paths from \(a\) to \(b\). An <strong>(endpoint-fixing) homotopy</strong> from \(\alpha\) to \(\beta\) is a continuous map \(F: [0,1] \times [0,1] \to X\) such that:

- \(F(0, t) = \alpha(t)\) and \(F(1, t) = \beta(t)\) for all \(t\),
- \(F(s, 0) = a\) and \(F(s, 1) = b\) for all \(s\).

When such \(F\) exists, we write \(\alpha \simeq \beta\) and say \(\alpha\) is <strong>homotopic</strong> to \(\beta\).

</div>

Think of \(s\) as a "time" parameter: at time \(s = 0\) we have the path \(\alpha\), and the family of paths \(f_s(t) = F(s, t)\) continuously deforms \(\alpha\) into \(\beta\) at time \(s = 1\), all while keeping the endpoints fixed.

![A homotopy continuously deforms the path alpha into the path beta while fixing endpoints](/pics/367/path-homotopy.svg)

<div class="theorem">

<strong>Theorem 6.2.</strong> Homotopy of paths is an equivalence relation.

</div>

### The fundamental group

<div class="definition">

<strong>Definition 6.3.</strong> Let \(X\) be a topological space and \(a \in X\). The <strong>fundamental group</strong> of \(X\) at \(a\) is the set \(\pi_1(X, a)\) of homotopy classes of loops at \(a\), with the group operation given by **concatenation**: if \(\alpha\) is a loop at \(a\) and \(\beta\) is a loop at \(a\), the product path \(\alpha \beta\) first traverses \(\alpha\) at double speed, then \(\beta\) at double speed:

\[(\alpha \beta)(t) = \begin{cases} \alpha(2t) & \text{if } 0 \leq t \leq \tfrac{1}{2}, \\ \beta(2t - 1) & \text{if } \tfrac{1}{2} \leq t \leq 1. \end{cases}\]

</div>

<div class="theorem">

<strong>Theorem 6.4.</strong> Under concatenation of homotopy classes, \(\pi_1(X, a)\) is a group with:

- <strong>Identity</strong>: the class \([\kappa_a]\) of the constant loop at \(a\).
- <strong>Inverse</strong>: \([\alpha]^{-1} = [\alpha^{-1}]\) where \(\alpha^{-1}(t) = \alpha(1 - t)\) traverses \(\alpha\) backwards.
- <strong>Associativity</strong>: \(([\alpha][\beta])[\gamma] = [\alpha]([\beta][\gamma])\).

</div>

The verifications require explicit homotopies. For instance, \(\alpha \alpha^{-1} \simeq \kappa_a\): the homotopy goes "part way along \(\alpha\) and back," going less and less far as the deformation parameter increases. Associativity \((\alpha\beta)\gamma \simeq \alpha(\beta\gamma)\) works by "reparametrizing" — the two paths traverse the same image, just at different speeds at different stages.

<div class="example">

<strong>Example 6.5.</strong> If \(X\) is a convex subset of a normed space, then \(\pi_1(X, a) = 0\) (the trivial group) for every \(a \in X\). Any loop \(\alpha\) at \(a\) can be contracted to a point via the "straight-line homotopy" \(F(s, t) = (1-s)\alpha(t) + sa\). So convex sets have no holes — topologically, they look like a point.

</div>

### The fundamental group of a circle

The first non-trivial computation of a fundamental group is one of the most important results in all of topology.

<div class="theorem">

<strong>Theorem 6.6.</strong> \(\pi_1(S^1, 1) \cong \mathbb{Z}\), generated by the loop \(\sigma(t) = e^{2\pi i t}\) that goes once around the circle counterclockwise.

</div>

The proof uses the technique of **lifting paths to polar coordinates**. Given a path \(\alpha: [0,1] \to \mathbb{C}^*\), one can uniquely lift it to a path \(\tilde{\alpha}(t) = (r(t), \theta(t))\) in \(\mathbb{R}^+ \times \mathbb{R}\) with \(\alpha(t) = r(t)e^{i\theta(t)}\), once an initial value \(\theta(0)\) is specified. The **winding number** \(\operatorname{wind}(\alpha, 0) = \frac{\theta(1) - \theta(0)}{2\pi}\) counts how many times \(\alpha\) wraps around the origin.

The key facts are:

1. Two loops at \(a\) in an annulus \(A = \{z \in \mathbb{C} \mid |z| \in I\}\) are homotopic if and only if they have the same winding number.
2. The loop \(\sigma^n(t) = ae^{2\pi i n t}\) has winding number \(n\).

The winding number therefore gives an isomorphism \(\pi_1(S^1, a) \to \mathbb{Z}\).

For those who know complex analysis, the winding number has an elegant integral formula: for a piecewise \(C^1\) loop \(\alpha\) in \(\mathbb{C} \setminus \{u\}\),

\[\operatorname{wind}(\alpha, u) = \frac{1}{2\pi i} \oint_\alpha \frac{dz}{z - u}.\]

### Functoriality

The fundamental group is not just an invariant of spaces — it is **functorial**, meaning it respects maps between spaces.

<div class="definition">

<strong>Definition 6.7.</strong> A continuous map \(f: (X, a) \to (Y, b)\) (with \(f(a) = b\)) induces a group homomorphism \(f_*: \pi_1(X, a) \to \pi_1(Y, b)\) given by \(f_*([\alpha]) = [f \circ \alpha]\).

</div>

<div class="theorem">

<strong>Theorem 6.8.</strong> We have \(\mathrm{id}_* = \mathrm{id}\) and \((g \circ f)_* = g_* \circ f_*\). Consequently, if \(f: (X, a) \to (Y, b)\) is a homeomorphism, then \(f_*\) is a group isomorphism.

</div>

In the language of category theory: the fundamental group is a (covariant) functor from the category of based topological spaces to the category of groups.

<div class="theorem">

<strong>Theorem 6.9.</strong> \(\pi_1(X \times Y, (a, b)) \cong \pi_1(X, a) \times \pi_1(Y, b)\).

</div>

<div class="example">

<strong>Example 6.10.</strong> The \(n\)-torus has fundamental group \(\pi_1(T^n) \cong \mathbb{Z}^n\).

</div>

### Dependence on base point

If \(\gamma\) is a path from \(a\) to \(b\) in \(X\), the map \(\varphi_\gamma: \pi_1(X, a) \to \pi_1(X, b)\) given by \(\varphi_\gamma([\alpha]) = [\gamma^{-1} \alpha \gamma]\) is a group isomorphism. So in a path-connected space, the fundamental group is independent of the base point up to (non-canonical) isomorphism, and we may write simply \(\pi_1(X)\).

---

## Chapter 7: Homotopy Invariance and Retracts

### Homotopy equivalence of spaces

The fundamental group is invariant under an equivalence relation much weaker than homeomorphism.

<div class="definition">

<strong>Definition 7.1.</strong> Two spaces \(X\) and \(Y\) are <strong>homotopy equivalent</strong> (written \(X \simeq Y\)) if there exist continuous maps \(f: X \to Y\) and \(g: Y \to X\) such that \(g \circ f \simeq \mathrm{id}_X\) and \(f \circ g \simeq \mathrm{id}_Y\) (free homotopies).

</div>

<div class="theorem">

<strong>Theorem 7.2.</strong> If \(X \simeq Y\), then \(\pi_1(X, a) \cong \pi_1(Y, b)\) where \(b\) lies in the same path-component as \(f(a)\).

</div>

Homotopy equivalence is dramatically coarser than homeomorphism. For instance, \(\mathbb{R}^n\) is homotopy equivalent to a point, and the Möbius band is homotopy equivalent to a circle. These spaces differ enormously in their metric and topological properties, but they share the same fundamental group.

### Retracts and deformation retracts

<div class="definition">

<strong>Definition 7.3.</strong> Let \(A \subseteq X\) with inclusion \(i: A \hookrightarrow X\).

- A <strong>retraction</strong> from \(X\) to \(A\) is a continuous map \(r: X \to A\) with \(r(a) = a\) for all \(a \in A\).
- A <strong>deformation retraction</strong> requires additionally that \(i \circ r \simeq \mathrm{id}_X\) (free homotopy).
- A <strong>strong deformation retraction</strong> requires \(i \circ r \simeq \mathrm{id}_X\) relative to \(A\) (points of \(A\) stay fixed throughout the deformation).

</div>

If \(A\) is a deformation retract of \(X\), then \(A \simeq X\) and \(\pi_1(X, a) \cong \pi_1(A, a)\) for any \(a \in A\).

<div class="example">

<strong>Example 7.4.</strong> Important deformation retracts:

- The origin \(\{0\}\) is a strong deformation retract of \(\mathbb{R}^n\) (via \(F(s, x) = (1-s)x\)).
- The sphere \(S^{n-1}\) is a strong deformation retract of \(\mathbb{R}^n \setminus \{0\}\) (via \(F(s, x) = \frac{(1-s)x + s \cdot x/\|x\|}{1} \cdot \|x\|^{1-s}\), or more simply, by normalizing: \(F(s, x) = ((1-s) + s/\|x\|)x\)).
- The figure-eight space \(8\) and the theta space \(\Theta\) are both strong deformation retracts of \(\mathbb{C} \setminus \{\pm i\}\). They are homotopy equivalent but *not* homeomorphic (removing the crossing point of \(8\) disconnects it into four arcs, but no point removal disconnects \(\Theta\) into four pieces).

![The figure-eight and theta space: homotopy equivalent but not homeomorphic](/pics/367/figure-eight-theta.svg)

</div>

<div class="definition">

<strong>Definition 7.5.</strong> A space is <strong>simply connected</strong> if it is path-connected and \(\pi_1(X, a) = 0\). A space is <strong>contractible</strong> if it is homotopy equivalent to a point. Every contractible space is simply connected.

</div>

### Applications of the fundamental group

The computation \(\pi_1(S^1) \cong \mathbb{Z}\) has remarkable consequences.

<div class="theorem">

<strong>Theorem 7.6.</strong> The circle \(S^1\) is not a retract of the closed disc \(D^2\).

</div>

<div class="proof">

<strong>Proof.</strong> If \(r: D^2 \to S^1\) were a retraction, then \(r_* \circ i_*: \pi_1(S^1) \to \pi_1(S^1)\) would be the identity. But \(i_*: \pi_1(S^1) \to \pi_1(D^2)\) maps \(\mathbb{Z}\) to \(0\), so \(r_* \circ i_*\) is the zero map — a contradiction. ∎

</div>

<div class="theorem">

<strong>Theorem 7.7 (Brouwer Fixed Point Theorem, dimension 2).</strong> Every continuous map \(f: D^2 \to D^2\) has a fixed point.

</div>

<div class="theorem">

<strong>Theorem 7.8 (Borsuk-Ulam Theorem, dimension 2).</strong> For every continuous \(f: S^2 \to \mathbb{R}^2\), there exists \(x \in S^2\) with \(f(-x) = f(x)\).

</div>

<div class="theorem">

<strong>Theorem 7.9 (Fundamental Theorem of Algebra).</strong> Every non-constant polynomial over \(\mathbb{C}\) has a root.

</div>

All of these classical results follow, directly or indirectly, from the non-triviality of \(\pi_1(S^1)\).

---

# Part IV: Computing the Fundamental Group

## Chapter 8: Free Groups and Free Products

To compute fundamental groups of complicated spaces, we need algebraic machinery: free groups and free products. These are the group-theoretic analogues of "putting things together without imposing relations."

### Direct products and sums

Recall that the direct product \(\prod_{k \in K} G_k\) consists of all functions \(a: K \to \bigcup G_k\) with \(a(k) \in G_k\), with componentwise multiplication. It satisfies a universal property for maps *into* it: a homomorphism to a product is determined by its components.

When the groups are abelian, the **direct sum** \(\bigoplus_{k \in K} G_k\) (the subgroup of elements with only finitely many non-identity components) satisfies the dual universal property for maps *out of* it.

### Free products

For non-abelian groups, the correct "sum" construction is the **free product**, which plays the role of coproduct in the category of groups.

<div class="definition">

<strong>Definition 8.1.</strong> Let \(\{G_k\}_{k \in K}\) be a family of groups. The <strong>free product</strong> \(\ast_{k \in K} G_k\) is the set of reduced words \(a_1 a_2 \cdots a_n\) where each \(a_i \in G_{k_i}\), adjacent letters come from different groups (\(k_i \neq k_{i+1}\)), and no letter is the identity. Multiplication is by concatenation followed by reduction.

</div>

The free product satisfies the universal property: for any group \(H\) and homomorphisms \(f_k: G_k \to H\), there is a unique homomorphism \(f: \ast G_k \to H\) extending all the \(f_k\)'s, given by \(f(a_1 \cdots a_n) = f_{k_1}(a_1) \cdots f_{k_n}(a_n)\).

<div class="example">

<strong>Example 8.2.</strong> The free product \(G * H\) consists of alternating strings of non-identity elements from \(G\) and \(H\): \(\emptyset, a_1, b_1, a_1 b_1, b_1 a_1, a_1 b_1 a_2, \ldots\) It is generally non-abelian even if \(G\) and \(H\) are abelian: in \(\mathbb{Z} * \mathbb{Z}\), the element \(ab\) is not equal to \(ba\).

</div>

### Free groups

<div class="definition">

<strong>Definition 8.3.</strong> The <strong>free group</strong> \(F(A)\) on a set \(A\) is the set of reduced words \(a_1^{k_1} a_2^{k_2} \cdots a_n^{k_n}\) with \(a_i \in A\), \(k_i \in \mathbb{Z} \setminus \{0\}\), and \(a_i \neq a_{i+1}\). It satisfies the universal property: for any group \(G\) and any function \(f: A \to G\), there is a unique homomorphism \(g: F(A) \to G\) extending \(f\).

</div>

Free groups are the "most general" groups generated by a set. Every group is a quotient of a free group: if \(A\) generates \(G\), then \(G \cong F(A)/N\) for some normal subgroup \(N\). This leads to **presentations** of groups.

<div class="definition">

<strong>Definition 8.4.</strong> A <strong>group presentation</strong> \(\langle A \mid W \rangle = F(A)/N\) where \(N\) is the normal subgroup generated by the words in \(W\).

</div>

<div class="example">

<strong>Example 8.5.</strong>

| Group | Presentation |
| :--- | :--- |
| \(\mathbb{Z}\) | \(\langle a \mid \rangle\) |
| \(\mathbb{Z}_n\) | \(\langle a \mid a^n \rangle\) |
| \(\mathbb{Z}^2\) | \(\langle a, b \mid aba^{-1}b^{-1} \rangle\) |
| \(D_n\) | \(\langle \sigma, \tau \mid \sigma^n, \tau^2, \sigma\tau\sigma\tau \rangle\) |

</div>

The **abelianization** of a group \(G\) is \(\mathrm{Ab}(G) = G/[G, G]\), where \([G, G]\) is generated by commutators. The abelianization of a free group is a free abelian group: \(\mathrm{Ab}(F(A)) \cong \mathbb{Z}^A\).

---

## Chapter 9: The Seifert-Van Kampen Theorem

The Seifert-Van Kampen theorem is the most powerful tool for computing fundamental groups. It computes \(\pi_1(X)\) from the fundamental groups of open subsets that cover \(X\).

<div class="theorem">

<strong>Theorem 9.1 (Seifert-Van Kampen).</strong> Let \(X = \bigcup_{k \in K} U_k\) where each \(U_k\) is open in \(X\) with \(a \in U_k\), and suppose all \(U_k\), pairwise intersections \(U_k \cap U_\ell\), and triple intersections \(U_k \cap U_\ell \cap U_m\) are path-connected. Then

\[\pi_1(X, a) \cong \left(\ast_{k \in K} \pi_1(U_k, a)\right) / N\]

where \(N\) is the normal subgroup generated by elements \([\omega]_k [\omega^{-1}]_\ell\) for loops \(\omega\) at \(a\) in \(U_k \cap U_\ell\).

</div>

In the common case of two open sets:

<div class="corollary">

<strong>Corollary 9.2.</strong> If \(X = U \cup V\) with \(U, V, U \cap V\) path-connected and \(a \in U \cap V\), then:

\[\pi_1(X, a) \cong \left(\pi_1(U, a) * \pi_1(V, a)\right) / N\]

where \(N\) is generated by \([\omega]_U [\omega^{-1}]_V\) for loops \(\omega\) in \(U \cap V\). In particular:

1. If \(\pi_1(U \cap V) = 0\), then \(\pi_1(X) \cong \pi_1(U) * \pi_1(V)\).
2. If \(\pi_1(V) = 0\), then \(\pi_1(X) \cong \pi_1(U) / N\) where \(N\) is generated by images of loops in \(U \cap V\).

</div>

### Applications

<div class="example">

<strong>Example 9.3.</strong> For \(n \geq 2\), \(\pi_1(S^n) = 0\). Cover \(S^n\) by \(U = S^n \setminus \{p\}\) and \(V = S^n \setminus \{-p\}\). Both are homeomorphic to \(\mathbb{R}^n\) (simply connected), and \(U \cap V \cong \mathbb{R}^n \setminus \{0\}\) is path-connected for \(n \geq 2\). By Van Kampen, \(\pi_1(S^n) = 0 * 0 = 0\).

</div>

<div class="example">

<strong>Example 9.4 (Wedge of circles).</strong> The wedge (one-point union) of \(n\) circles has fundamental group \(\pi_1(\bigvee_{k=1}^n S^1) \cong F_n\), the free group on \(n\) generators. This follows from Van Kampen applied to \(n\) open sets, each a slightly thickened circle.

</div>

<div class="example">

<strong>Example 9.5 (Graphs).</strong> For a finite connected graph \(G\) with maximal tree \(T\), if \(E_1, \ldots, E_n\) are the edges not in \(T\), then \(\pi_1(G) \cong F_n\). The fundamental group of a graph is always free.

</div>

<div class="example">

<strong>Example 9.6 (Surfaces).</strong> The fundamental groups of the compact surfaces are:

\[\pi_1\left((T^2)^{\#g}\right) = \left\langle a_1, b_1, \ldots, a_g, b_g \;\middle|\; \prod_{i=1}^g [a_i, b_i] \right\rangle\]

\[\pi_1\left((\mathbb{P}^2)^{\#h}\right) = \left\langle a_1, \ldots, a_h \;\middle|\; a_1^2 a_2^2 \cdots a_h^2 \right\rangle\]

where \([a_i, b_i] = a_i b_i a_i^{-1} b_i^{-1}\). Their abelianizations are \(\mathbb{Z}^{2g}\) and \(\mathbb{Z}^{h-1} \times \mathbb{Z}_2\) respectively.

</div>

A deep consequence: **every finitely presented group arises as the fundamental group of some topological space**. Given \(G = \langle \alpha_1, \ldots, \alpha_n \mid w_1, \ldots, w_\ell \rangle\), form the wedge of \(n\) circles, then attach \(\ell\) discs along the words \(w_j\). The resulting CW complex has \(\pi_1 \cong G\).

---

## Chapter 10: Covering Spaces

Covering spaces provide a geometric realization of the fundamental group. The theory reveals a beautiful dictionary between topology and group theory: subgroups of \(\pi_1(X)\) correspond to covering spaces of \(X\), just as subgroups of a group correspond to intermediate fields in Galois theory.

### Covering spaces and covering maps

<div class="definition">

<strong>Definition 10.1.</strong> A <strong>covering</strong> consists of spaces \(\tilde{X}\) and \(X\) and a continuous surjection \(p: \tilde{X} \to X\) such that every point of \(X\) has an open neighbourhood \(U\) (an <strong>elementary open set</strong>) whose preimage \(p^{-1}(U)\) is a disjoint union of open sets in \(\tilde{X}\), each mapped homeomorphically onto \(U\) by \(p\).

</div>

<div class="example">

<strong>Example 10.2.</strong> Key covering spaces:

- The map \(p: \mathbb{R} \to S^1\) given by \(p(t) = e^{it}\) wraps the real line around the circle. The fibre \(p^{-1}(1) = 2\pi\mathbb{Z}\).

![The real line covers the circle as a helix, with the covering map p(t) = e^{it}](/pics/367/covering-helix.svg)
- The map \(p: S^1 \to S^1\) given by \(p(z) = z^n\) is an \(n\)-fold covering.
- The map \(p: \mathbb{R}^2 \to T^2\) given by \(p(s, t) = (e^{is}, e^{it})\) covers the torus.
- More generally, products of coverings give coverings of products.

</div>

### Path and homotopy lifting

The fundamental property of covering spaces is that paths and homotopies can be "lifted."

<div class="theorem">

<strong>Theorem 10.3 (Path Lifting).</strong> Given a covering \(p: \tilde{X} \to X\), a path \(\alpha\) in \(X\) with \(\alpha(0) = a\), and a point \(\tilde{a} \in p^{-1}(a)\), there exists a unique lift \(\tilde{\alpha}\) in \(\tilde{X}\) with \(\tilde{\alpha}(0) = \tilde{a}\) and \(p \circ \tilde{\alpha} = \alpha\).

</div>

<div class="theorem">

<strong>Theorem 10.4 (Homotopy Lifting).</strong> Given a covering \(p: \tilde{X} \to X\) and a continuous map \(F: [0,1] \times Y \to X\) with a lift \(\tilde{f}\) of \(f(y) = F(0, y)\), there exists a unique lift \(\tilde{F}\) of \(F\) with \(\tilde{F}(0, y) = \tilde{f}(y)\).

</div>

<div class="corollary">

<strong>Corollary 10.5.</strong> If \(\alpha \simeq \beta\) in \(X\) (homotopy of paths with fixed endpoints), then their lifts starting at the same point end at the same point.

</div>

<div class="corollary">

<strong>Corollary 10.6.</strong> The induced map \(p_*: \pi_1(\tilde{X}, \tilde{a}) \to \pi_1(X, a)\) is injective. Its image consists of classes \([\alpha]\) where the lift of \(\alpha\) starting at \(\tilde{a}\) is a loop.

</div>

<div class="corollary">

<strong>Corollary 10.7.</strong> If \(X\) is path-connected, all fibres \(p^{-1}(a)\) have the same cardinality (the <strong>number of sheets</strong> of the covering). The number of sheets equals the index \([\pi_1(X, a) : p_*(\pi_1(\tilde{X}, \tilde{a}))]\).

</div>

### Local path-connectedness

<div class="definition">

<strong>Definition 10.8.</strong> A space \(X\) is <strong>locally path-connected</strong> if every open neighbourhood of every point contains a path-connected open neighbourhood. It is <strong>semi-locally simply connected</strong> if every point has a neighbourhood \(U\) such that every loop in \(U\) is null-homotopic in \(X\).

</div>

In a locally path-connected space, the connected components equal the path-components. Every manifold is locally path-connected (open balls in \(\mathbb{R}^n\) are convex, hence path-connected).

### The classification of covering spaces

<div class="theorem">

<strong>Theorem 10.9 (Classification of Covering Spaces).</strong> Let \(X\) be path-connected, locally path-connected, and semi-locally simply connected. There is a bijection:

\[\left\{\text{based connected coverings } p: (\tilde{X}, \tilde{a}) \to (X, a)\right\} / \cong \;\;\longleftrightarrow\;\; \left\{\text{subgroups } H \subseteq \pi_1(X, a)\right\}\]

given by \(p \mapsto p_*(\pi_1(\tilde{X}, \tilde{a}))\). In particular:

- The **universal cover** corresponds to the trivial subgroup \(H = \{e\}\). It is the unique simply connected covering space.
- The identity covering \(X \to X\) corresponds to the whole group \(\pi_1(X, a)\).
- An \(n\)-fold covering corresponds to a subgroup of index \(n\).

</div>

The proof constructs the universal cover explicitly: \(\tilde{X} = \{[\alpha] \mid \alpha \text{ is a path starting at } a\}\) with the topology generated by sets \(\tilde{U}_{[\alpha]} = \{[\alpha\lambda] \mid \lambda \text{ is a path in } U\}\) for elementary open sets \(U\). This is a beautifully concrete construction — points of the universal cover are homotopy classes of paths from the base point, and the covering map simply evaluates the endpoint.

For a general subgroup \(H\), one forms the quotient \(\tilde{X}_H = \tilde{X}/{\equiv}\) where \([\alpha] \equiv [\beta]\) if \(\alpha(1) = \beta(1)\) and \([\alpha\beta^{-1}] \in H\).

---

# Part V: Looking Ahead

## A glimpse of algebraic topology (PMATH 467)

The fundamental group is just the first in a sequence of increasingly powerful algebraic invariants. **PMATH 467: Algebraic Topology** develops the full machinery.

**Homotopy groups.** The fundamental group \(\pi_1(X, a)\) detects 1-dimensional holes (loops). The **higher homotopy groups** \(\pi_n(X, a)\), defined using maps from the \(n\)-sphere \(S^n\) into \(X\), detect \(n\)-dimensional holes. While \(\pi_1\) can be non-abelian, all higher homotopy groups are abelian. Computing them is notoriously difficult — even the homotopy groups of spheres are not fully known.

**Homology groups.** An alternative approach assigns to each space a sequence of abelian groups \(H_0(X), H_1(X), H_2(X), \ldots\) called **homology groups**. They are generally more computable than homotopy groups and satisfy powerful axioms (the Eilenberg-Steenrod axioms). For instance, \(H_n(S^k) \cong \mathbb{Z}\) if \(n = 0\) or \(n = k\), and is trivial otherwise.

**Cohomology.** The dual theory of **cohomology** \(H^n(X)\) carries additional structure: the **cup product** makes \(H^*(X) = \bigoplus_n H^n(X)\) into a graded ring. This ring structure can distinguish spaces that homology alone cannot.

Some celebrated results of algebraic topology include:

- The **Brouwer fixed point theorem** (in all dimensions): every continuous map \(D^n \to D^n\) has a fixed point.
- The **hairy ball theorem**: there is no continuous non-vanishing tangent vector field on \(S^{2n}\). (You cannot comb a hairy ball flat without creating a cowlick.)
- The **Borsuk-Ulam theorem**: every continuous map \(S^n \to \mathbb{R}^n\) identifies a pair of antipodal points. A playful consequence: at any moment, there exist two antipodal points on Earth with the same temperature and barometric pressure (the **ham sandwich theorem** is a related result about simultaneous bisection of multiple objects by a hyperplane).
- The **Lefschetz fixed point theorem**: a powerful generalization of the Brouwer theorem using traces on homology.
- The **classification of Platonic solids**: the Euler characteristic constrains which regular polyhedra can exist, and homology makes this precise.

## A glimpse of topological dynamics (PMATH 457)

While algebraic topology studies spaces through algebraic invariants, **PMATH 457: Topological Dynamics and Ergodic Theory** studies spaces through the lens of *continuous transformations acting on them*. The central objects are dynamical systems \((X, T)\) where \(X\) is a compact topological space and \(T: X \to X\) is a continuous map.

**Topological dynamics** studies the orbit structure: given a point \(x\), what can we say about the sequence \(x, Tx, T^2x, \ldots\)? A **minimal flow** is one where every orbit is dense — the system is as "mixed" as possible. The study of minimal flows connects to combinatorics through:

- **Van der Waerden's theorem**: any finite colouring of the integers contains arbitrarily long monochromatic arithmetic progressions. This has a beautiful proof via topological dynamics on the space of ultrafilters \(\beta\mathbb{N}\).
- **Hales-Jewett theorem**: a powerful generalization about combinatorial lines in high-dimensional grids.

**Ergodic theory** adds a measure-theoretic dimension. Given a probability measure \(\mu\) preserved by \(T\), the **ergodic theorems** of Birkhoff and von Neumann say that time averages \(\frac{1}{n}\sum_{k=0}^{n-1} f(T^k x)\) converge to space averages \(\int f \, d\mu\) for "most" points \(x\). Key results include:

- **Rokhlin's lemma**: any aperiodic measure-preserving transformation can be approximated by a periodic one on most of the space, a powerful tool for constructing counterexamples and proving structural results.
- **Entropy**: a numerical invariant measuring the "information content" of a dynamical system. Two systems with different entropy cannot be isomorphic.
- **Ornstein's theorem**: a remarkable rigidity result stating that Bernoulli shifts (the simplest "random" systems) are completely classified by their entropy — a striking parallel to the classification of surfaces by the Euler characteristic.

The subject sits at the intersection of topology, measure theory, group theory, and combinatorics, drawing on the foundations built in PMATH 367.
