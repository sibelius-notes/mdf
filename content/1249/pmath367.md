---
title: "PMATH 367: Topology"
prof: "Stephen New"
subjects: "PMATH"
---

These notes are based on [Stephen New's PMATH 367 lecture notes](https://www.math.uwaterloo.ca/~snew/PMATH367/index.html), substantially enriched with motivation, examples, and narrative. The reader is assumed to have experience with real analysis (metric spaces, continuity, compactness) and basic group theory.

---

# Chapter 1: Point-Set Topology

## Section 1.1: Topological Spaces and Continuous Maps

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

<strong>Example 1.3.</strong> Let \(X = \{1, 2, 3\}\). The collections \(\mathcal{R} = \{\emptyset, \{1\}, X\}\), \(\mathcal{S} = \{\emptyset, \{1\}, \{1,2\}, X\}\), and \(\mathcal{T} = \{\emptyset, \{1\}, \{1,2\}, \{1,3\}, X\}\) are all topologies on \(X\). However, \(\mathcal{B} = \{\emptyset, \{1\}, \{2\}, X\}\) is <em>not</em> a topology because \(\{1\} \cup \{2\} = \{1,2\} \notin \mathcal{B}\).

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

The topology <strong>generated</strong> by \(\mathcal{B}\) consists of all sets \(U\) such that for every \(a \in U\), there exists \(B \in \mathcal{B}\) with \(a \in B \subseteq U\). Equivalently, the topology consists of all unions of elements of \(\mathcal{B}\).

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

- The unit sphere \(S^n = \{x \in \mathbb{R}^{n+1} \mid \|x\| = 1\}\) with the north pole removed is homeomorphic to \(\mathbb{R}^n\) via <strong>stereographic projection</strong>: \(f(x) = \left(\frac{x_1}{1-x_{n+1}}, \ldots, \frac{x_n}{1-x_{n+1}}\right)\).

</div>

![Stereographic projection from the north pole maps S^n minus a point to R^n](/pics/367/stereographic.svg)

---

## Section 1.2: Examples of Topological Spaces

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

<strong>Definition 2.8.</strong> An <strong>action</strong> of a group \(G\) on a space \(X\) is a map \(G \times X \to X\), written \((g, x) \mapsto gx\), satisfying \(1 \cdot x = x\) and \((gh)x = g(hx)\). The <strong>orbit space</strong> \(X/G\) is the quotient by the equivalence relation \(x \sim y \iff gx = y\) for some \(g \in G\).

</div>

<div class="example">

<strong>Example 2.9.</strong> The group \(\mathbb{Z}\) acts on \(\mathbb{R}\) by addition: \(n \cdot t = t + n\). The orbit space \(\mathbb{R}/\mathbb{Z}\) is homeomorphic to the circle \(S^1\) via \(f([t]) = (\cos 2\pi t, \sin 2\pi t)\). This realizes the circle as the real line "wrapped around" with period 1.

</div>

<div class="example">

<strong>Example 2.10.</strong> The multiplicative group \(S^1 \subseteq \mathbb{C}^*\) acts on \(\mathbb{C}\) by multiplication. The orbits are circles centered at the origin (plus the origin itself), and the orbit space \(\mathbb{C}/S^1\) is homeomorphic to \([0, \infty)\) via \(f([z]) = |z|\).

</div>

Not all quotient constructions yield nice spaces. The action of \((0, \infty)\) on \(\mathbb{R}^2\) by scaling gives a quotient space that is *not* Hausdorff — the equivalence class of the origin cannot be separated from any ray.

---

## Section 1.3: Connected, Path-Connected, and Compact Spaces

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

<strong>Definition 3.11.</strong> An <strong>open cover</strong> of \(X\) is a collection \(\mathcal{S}\) of open sets whose union is \(X\). A <strong>subcover</strong> is a subcollection that still covers \(X\). The space \(X\) is <strong>compact</strong> if every open cover has a <strong>finite</strong> subcover.

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

# Chapter 2: Separation, Countability, and Manifolds

## Section 2.1: Countability and Separation Axioms

### Countability axioms

How "large" is a topology? The countability axioms measure this using the lens of countability.

<div class="definition">

<strong>Definition 4.1.</strong> A topological space \(X\) is:

- <strong>First-countable</strong> if every point has a countable neighbourhood basis (a countable collection of open sets such that every neighbourhood of the point contains one of them).
- <strong>Second-countable</strong> if the topology has a countable basis.
- <strong>Separable</strong> if \(X\) has a countable dense subset.
- <strong>Lindelöf</strong> if every open cover has a countable subcover.

</div>

These properties are ordered by strength: second-countable implies all the others. In metric spaces, second-countability, separability, and the Lindelöf property are all equivalent.

<div class="example">

<strong>Example 4.2.</strong> The Sorgenfrey line \(\mathbb{R}_\ell\) is first-countable, Lindelöf, and separable (the rationals are dense), but <em>not</em> second-countable. This shows the equivalences for metric spaces do not hold in general. Even worse, the Sorgenfrey plane \(\mathbb{R}_\ell \times \mathbb{R}_\ell\) is not Lindelöf, showing that the Lindelöf property is not preserved by products.

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

## Section 2.2: Topological Manifolds

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

# Chapter 3: The Fundamental Group

## Section 3.1: Homotopy of Paths and the Fundamental Group

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

<strong>Definition 6.3.</strong> Let \(X\) be a topological space and \(a \in X\). The <strong>fundamental group</strong> of \(X\) at \(a\) is the set \(\pi_1(X, a)\) of homotopy classes of loops at \(a\), with the group operation given by <strong>concatenation</strong>: if \(\alpha\) is a loop at \(a\) and \(\beta\) is a loop at \(a\), the product path \(\alpha \beta\) first traverses \(\alpha\) at double speed, then \(\beta\) at double speed:

\[
(\alpha \beta)(t) = \begin{cases} \alpha(2t) & \text{if } 0 \leq t \leq \tfrac{1}{2}, \\ \beta(2t - 1) & \text{if } \tfrac{1}{2} \leq t \leq 1. \end{cases}
\]

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

\[
\operatorname{wind}(\alpha, u) = \frac{1}{2\pi i} \oint_\alpha \frac{dz}{z - u}.
\]

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

## Section 3.2: Homotopy Invariance and Retracts

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
- The figure-eight space \(8\) and the theta space \(\Theta\) are both strong deformation retracts of \(\mathbb{C} \setminus \{\pm i\}\). They are homotopy equivalent but <em>not</em> homeomorphic (removing the crossing point of \(8\) disconnects it into four arcs, but no point removal disconnects \(\Theta\) into four pieces).

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

# Chapter 4: Computing the Fundamental Group

## Section 4.1: Free Groups and Free Products

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

## Section 4.2: The Seifert-Van Kampen Theorem

The Seifert-Van Kampen theorem is the most powerful tool for computing fundamental groups. It computes \(\pi_1(X)\) from the fundamental groups of open subsets that cover \(X\).

<div class="theorem">

<strong>Theorem 9.1 (Seifert-Van Kampen).</strong> Let \(X = \bigcup_{k \in K} U_k\) where each \(U_k\) is open in \(X\) with \(a \in U_k\), and suppose all \(U_k\), pairwise intersections \(U_k \cap U_\ell\), and triple intersections \(U_k \cap U_\ell \cap U_m\) are path-connected. Then

\[
\pi_1(X, a) \cong \left(\ast_{k \in K} \pi_1(U_k, a)\right) / N
\]

where \(N\) is the normal subgroup generated by elements \([\omega]_k [\omega^{-1}]_\ell\) for loops \(\omega\) at \(a\) in \(U_k \cap U_\ell\).

</div>

In the common case of two open sets:

<div class="corollary">

<strong>Corollary 9.2.</strong> If \(X = U \cup V\) with \(U, V, U \cap V\) path-connected and \(a \in U \cap V\), then:

\[
\pi_1(X, a) \cong \left(\pi_1(U, a) * \pi_1(V, a)\right) / N
\]

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

\[
\pi_1\left((T^2)^{\#g}\right) = \left\langle a_1, b_1, \ldots, a_g, b_g \;\middle|\; \prod_{i=1}^g [a_i, b_i] \right\rangle
\]

\[
\pi_1\left((\mathbb{P}^2)^{\#h}\right) = \left\langle a_1, \ldots, a_h \;\middle|\; a_1^2 a_2^2 \cdots a_h^2 \right\rangle
\]

where \([a_i, b_i] = a_i b_i a_i^{-1} b_i^{-1}\). Their abelianizations are \(\mathbb{Z}^{2g}\) and \(\mathbb{Z}^{h-1} \times \mathbb{Z}_2\) respectively.

</div>

A deep consequence: **every finitely presented group arises as the fundamental group of some topological space**. Given \(G = \langle \alpha_1, \ldots, \alpha_n \mid w_1, \ldots, w_\ell \rangle\), form the wedge of \(n\) circles, then attach \(\ell\) discs along the words \(w_j\). The resulting CW complex has \(\pi_1 \cong G\).

---

## Section 4.3: Covering Spaces

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

\[
\left\{\text{based connected coverings } p: (\tilde{X}, \tilde{a}) \to (X, a)\right\} / \cong \;\;\longleftrightarrow\;\; \left\{\text{subgroups } H \subseteq \pi_1(X, a)\right\}
\]

given by \(p \mapsto p_*(\pi_1(\tilde{X}, \tilde{a}))\). In particular:

- The <strong>universal cover</strong> corresponds to the trivial subgroup \(H = \{e\}\). It is the unique simply connected covering space.
- The identity covering \(X \to X\) corresponds to the whole group \(\pi_1(X, a)\).
- An \(n\)-fold covering corresponds to a subgroup of index \(n\).

</div>

The proof constructs the universal cover explicitly: \(\tilde{X} = \{[\alpha] \mid \alpha \text{ is a path starting at } a\}\) with the topology generated by sets \(\tilde{U}_{[\alpha]} = \{[\alpha\lambda] \mid \lambda \text{ is a path in } U\}\) for elementary open sets \(U\). This is a beautifully concrete construction — points of the universal cover are homotopy classes of paths from the base point, and the covering map simply evaluates the endpoint.

For a general subgroup \(H\), one forms the quotient \(\tilde{X}_H = \tilde{X}/{\equiv}\) where \([\alpha] \equiv [\beta]\) if \(\alpha(1) = \beta(1)\) and \([\alpha\beta^{-1}] \in H\).

---

# Chapter 5: Beyond the Fundamental Group

## Section 5.1: Algebraic Topology — Higher Invariants (PMATH 467)

The fundamental group \(\pi_1(X)\) is a remarkably effective invariant, but it has blind spots. It detects 1-dimensional holes — loops that cannot be contracted — but says nothing about higher-dimensional phenomena. The sphere \(S^2\) has \(\pi_1(S^2) = 0\), yet it is clearly not contractible (it encloses a 2-dimensional "hole"). To detect such features, we need more powerful machinery. **PMATH 467: Algebraic Topology** develops the full arsenal: higher homotopy groups, homology, cohomology, and the deep theorems they unlock.

### Higher homotopy groups

The fundamental group studies maps from the circle \(S^1\) into \(X\). The natural generalization replaces the circle with higher-dimensional spheres.

<div class="definition">

<strong>Definition 11.1.</strong> For \(n \geq 1\) and a based space \((X, a)\), the <strong>\(n\)-th homotopy group</strong> \(\pi_n(X, a)\) is the set of homotopy classes of based maps \(f: (S^n, *) \to (X, a)\), with the group operation defined by "stacking" maps along an equatorial hyperplane. For \(n = 0\), \(\pi_0(X)\) is the set of path-components (with no group structure in general).

</div>

For \(n = 1\), this recovers the fundamental group. For \(n \geq 2\), something remarkable happens: the group operation is *abelian*. Intuitively, this is because in two or more dimensions there is enough room to "slide" one map past another — a phenomenon that fails in one dimension, which is why \(\pi_1\) can be non-abelian.

The higher homotopy groups are functorial (a continuous map \(f: X \to Y\) induces homomorphisms \(f_*: \pi_n(X) \to \pi_n(Y)\)) and homotopy-invariant. A space is **\(n\)-connected** if \(\pi_k(X) = 0\) for all \(k \leq n\). Simply connected means 1-connected.

<div class="example">

<strong>Example 11.2.</strong> The spheres \(S^n\) have a single "essential" map in dimension \(n\): the identity map \(S^n \to S^n\) is not null-homotopic, giving \(\pi_n(S^n) \cong \mathbb{Z}\). But here is a surprise: \(\pi_3(S^2) \cong \mathbb{Z}\) as well! The generator is the <strong>Hopf fibration</strong> \(h: S^3 \to S^2\), one of the most beautiful maps in all of mathematics. Viewing \(S^3 \subseteq \mathbb{C}^2\) and \(S^2 = \mathbb{CP}^1\), it sends \((z_1, z_2) \mapsto [z_1 : z_2]\). Every fibre \(h^{-1}(p)\) is a circle, and any two such fibres are linked in \(S^3\). This linking is what makes \(h\) topologically non-trivial.

</div>

Computing \(\pi_n(S^k)\) for general \(n\) and \(k\) is one of the deepest unsolved problems in topology. The homotopy groups of spheres exhibit chaotic, seemingly unpredictable behaviour. Here is a small sample:

| | \(\pi_1\) | \(\pi_2\) | \(\pi_3\) | \(\pi_4\) | \(\pi_5\) | \(\pi_6\) |
|:---|:---|:---|:---|:---|:---|:---|
| \(S^1\) | \(\mathbb{Z}\) | 0 | 0 | 0 | 0 | 0 |
| \(S^2\) | 0 | \(\mathbb{Z}\) | \(\mathbb{Z}\) | \(\mathbb{Z}_2\) | \(\mathbb{Z}_2\) | \(\mathbb{Z}_{12}\) |
| \(S^3\) | 0 | 0 | \(\mathbb{Z}\) | \(\mathbb{Z}_2\) | \(\mathbb{Z}_2\) | \(\mathbb{Z}_{12}\) |

The pattern \(\pi_{n+k}(S^n)\) eventually stabilizes for large \(n\) (this is the **Freudenthal suspension theorem**); the resulting "stable" groups form the subject of **stable homotopy theory**, a central topic of modern algebraic topology.

### Homology: counting holes algebraically

Homotopy groups are conceptually clean but fiendishly difficult to compute. **Homology** takes a different approach: instead of studying maps from spheres, it studies the space itself by decomposing it into simple pieces and tracking how those pieces fit together.

The key idea is the **chain complex**. One triangulates the space (or, more generally, decomposes it into cells) and forms free abelian groups \(C_n\) generated by the \(n\)-dimensional cells. The **boundary operator** \(\partial_n: C_n \to C_{n-1}\) records how each cell's boundary is assembled from lower-dimensional cells. The crucial property is \(\partial_{n-1} \circ \partial_n = 0\) — "the boundary of a boundary is zero."

<div class="definition">

<strong>Definition 11.3.</strong> The <strong>\(n\)-th homology group</strong> of a chain complex is

\[
H_n = \ker(\partial_n) / \operatorname{im}(\partial_{n+1}) = Z_n / B_n
\]

where \(Z_n = \ker \partial_n\) are the <strong>cycles</strong> (chains without boundary) and \(B_n = \operatorname{im}\, \partial_{n+1}\) are the <strong>boundaries</strong> (chains that bound something). A homology class \([\sigma] \in H_n\) represents an \(n\)-dimensional "hole" — a cycle that does not bound.

</div>

<div class="example">

<strong>Example 11.4.</strong> The homology of the spheres is beautifully simple:

\[
H_k(S^n) = \begin{cases} \mathbb{Z} & \text{if } k = 0 \text{ or } k = n, \\ 0 & \text{otherwise.} \end{cases}
\]

The generator of \(H_n(S^n)\) is called the <strong>fundamental class</strong> — it represents the sphere "wrapping once around itself." For the torus, \(H_0(T^2) \cong \mathbb{Z}\), \(H_1(T^2) \cong \mathbb{Z}^2\), and \(H_2(T^2) \cong \mathbb{Z}\). The two generators of \(H_1\) correspond to the two independent loops on the torus.

</div>

Homology satisfies the **Eilenberg-Steenrod axioms**, which characterize it uniquely (up to a choice of coefficient group). Among the axioms, the most powerful is the **Mayer-Vietoris sequence**: if \(X = U \cup V\), there is a long exact sequence

\[
\cdots \to H_n(U \cap V) \to H_n(U) \oplus H_n(V) \to H_n(X) \to H_{n-1}(U \cap V) \to \cdots
\]

This is the homological analogue of the Seifert-Van Kampen theorem, but it works in all dimensions and is often easier to apply.

The **Euler characteristic** from Chapter 5 appears here in its true generality:

\[
\chi(X) = \sum_{n=0}^{\infty} (-1)^n \operatorname{rank}(H_n(X)).
\]

For compact surfaces, this recovers the formula \(\chi = V - E + F\) from any triangulation.

The relationship between \(\pi_1\) and \(H_1\) is precise: \(H_1(X) \cong \pi_1(X)^{\text{ab}}\), the abelianization of the fundamental group. So homology forgets the non-abelian structure of \(\pi_1\) but gains computability and higher-dimensional reach.

### Cohomology and the cup product

Where homology assigns groups, **cohomology** assigns *dual* groups — and gains a multiplicative structure.

<div class="definition">

<strong>Definition 11.5.</strong> The <strong>\(n\)-th cohomology group</strong> with coefficients in a ring \(R\) is \(H^n(X; R) = \operatorname{Hom}(H_n(X), R)\) (roughly speaking). The <strong>cup product</strong> \(\smile: H^p(X) \times H^q(X) \to H^{p+q}(X)\) makes the <strong>cohomology ring</strong> \(H^*(X) = \bigoplus_n H^n(X)\) into a graded-commutative ring.

</div>

The cup product is a strictly finer invariant than homology alone. A famous example: the spaces \(\mathbb{CP}^2\) and \(S^2 \vee S^4\) have identical homology groups, but their cohomology rings differ — \(H^*(\mathbb{CP}^2)\) has a non-trivial cup product (the square of the degree-2 generator is the degree-4 generator), while \(H^*(S^2 \vee S^4)\) has all cup products zero. The cup product detects how the "holes" in a space interact, not just how many there are.

### The great theorems

The machinery of algebraic topology proves theorems that seem far removed from algebra.

**The Brouwer Fixed Point Theorem** (all dimensions). *Every continuous map \(f: D^n \to D^n\) has a fixed point.* The proof is a homological echo of our \(\pi_1\) argument: if \(f\) had no fixed point, we could construct a retraction \(r: D^n \to S^{n-1}\), which would induce a surjection \(H_{n-1}(D^n) \twoheadrightarrow H_{n-1}(S^{n-1})\). But \(H_{n-1}(D^n) = 0\) while \(H_{n-1}(S^{n-1}) \cong \mathbb{Z}\), a contradiction.

**The Hairy Ball Theorem.** *There is no continuous non-vanishing tangent vector field on \(S^{2n}\) (even-dimensional spheres).* You cannot comb a coconut without creating a cowlick. The proof uses the **Euler class** or an index-theoretic argument: a non-vanishing vector field would define a homotopy from the identity to the antipodal map, which has degree \((-1)^{2n+1} = -1 \neq 1\), contradicting the fact that homotopic maps have the same degree. On odd-dimensional spheres, non-vanishing vector fields *do* exist — for \(S^1\), the tangent vector field is simply rotation by 90 degrees.

**The Borsuk-Ulam Theorem.** *For every continuous map \(f: S^n \to \mathbb{R}^n\), there exists a point \(x \in S^n\) with \(f(x) = f(-x)\).* At every moment, some pair of antipodal points on Earth has the same temperature and the same barometric pressure. The proof for \(n = 2\) uses the fundamental group of \(\mathbb{RP}^2\); the general case uses \(\mathbb{Z}_2\)-cohomology. A delightful corollary:

**The Ham Sandwich Theorem.** *Given \(n\) measurable sets in \(\mathbb{R}^n\), there exists a single hyperplane simultaneously bisecting all of them by volume.* Two slices of bread and a slice of ham in \(\mathbb{R}^3\) can always be simultaneously halved by one cut — hence the name.

**The Lefschetz Fixed Point Theorem.** *If \(f: X \to X\) is a continuous map of a compact triangulable space and the Lefschetz number \(\Lambda(f) = \sum_{n} (-1)^n \operatorname{tr}(f_*: H_n(X; \mathbb{Q}) \to H_n(X; \mathbb{Q}))\) is nonzero, then \(f\) has a fixed point.* Brouwer's theorem is the special case \(X = D^n\), where \(\Lambda(f) = 1\) for any \(f\). The Lefschetz theorem detects fixed points even when \(X\) has complicated topology.

**Classification of Platonic Solids.** *There are exactly five convex regular polyhedra: tetrahedron, cube, octahedron, dodecahedron, and icosahedron.* The proof uses the Euler characteristic \(\chi(S^2) = V - E + F = 2\). If each face is a regular \(p\)-gon and \(q\) faces meet at each vertex, then double-counting gives \(qV = 2E = pF\), and substituting into \(\chi = 2\) yields \(\frac{1}{p} + \frac{1}{q} = \frac{1}{2} + \frac{1}{E}\). Since \(\frac{1}{p} + \frac{1}{q} > \frac{1}{2}\) and \(p, q \geq 3\), only five pairs \((p, q)\) work: \((3,3), (3,4), (4,3), (3,5), (5,3)\).

### Deeper waters

Beyond these classical results, algebraic topology connects to many areas of modern mathematics:

- **K-theory** classifies vector bundles over spaces, linking topology to algebra and number theory. The **Bott periodicity theorem** says that the homotopy groups of the classifying spaces for vector bundles repeat with period 2 (complex) or 8 (real), a stunning rigidity.
- **Characteristic classes** (Stiefel-Whitney, Chern, Pontryagin) are cohomology classes associated to vector bundles that measure twisting. The non-orientability of the Möbius band, for instance, is detected by a non-trivial Stiefel-Whitney class.
- **Spectral sequences** are a bookkeeping device for computing homology from successive approximations. They are notorious for their complexity but indispensable for serious computations.
- The **Poincare conjecture** (proved by Perelman in 2003 using Ricci flow, not purely algebraic topology) states that every simply connected, closed 3-manifold is homeomorphic to \(S^3\). Higher-dimensional analogues were proved earlier by Smale (\(n \geq 5\)) and Freedman (\(n = 4\)) using surgery theory and cobordism — deep tools from algebraic topology.

---

## Section 5.2: Topological Dynamics and Ergodic Theory (PMATH 457)

If algebraic topology studies the *shape* of spaces, topological dynamics studies what happens when you *move around* in them. The central question is: given a space \(X\) and a continuous self-map \(T: X \to X\), what can we say about the long-term behaviour of the orbits \(x, Tx, T^2x, T^3x, \ldots\)? Do they eventually cycle? Become dense? Distribute themselves evenly? **PMATH 457** develops the theory in two intertwined halves: *topological dynamics* (using topology and combinatorics) and *ergodic theory* (adding measure theory).

### Topological dynamical systems

<div class="definition">

<strong>Definition 12.1.</strong> A <strong>(compact) topological dynamical system</strong> is a pair \((X, T)\) where \(X\) is a compact Hausdorff space and \(T: X \to X\) is a continuous map. More generally, a <strong>flow</strong> is a continuous action of a topological group \(G\) on \(X\), i.e., a continuous map \(G \times X \to X\) satisfying the group action axioms. When \(G = \mathbb{Z}\) (generated by a single homeomorphism), one recovers the case of iterating a single map.

</div>

The **orbit** of a point \(x\) is the set \(\mathcal{O}(x) = \{T^n x \mid n \geq 0\}\), and its closure \(\overline{\mathcal{O}(x)}\) is the **orbit closure**. The orbit closure is always a closed invariant set — a "sub-dynamical system" in its own right.

<div class="example">

<strong>Example 12.2 (Irrational rotation).</strong> Let \(X = S^1\) (the unit circle in \(\mathbb{C}\)) and \(T(z) = e^{2\pi i \alpha} z\) for some irrational \(\alpha\). Then every orbit is dense in \(S^1\) — the sequence \(1, e^{2\pi i\alpha}, e^{4\pi i\alpha}, \ldots\) visits every arc of the circle. This is the <strong>equidistribution theorem</strong> of Weyl: the points are not only dense, they are uniformly distributed. Contrast this with the case of rational \(\alpha = p/q\), where every orbit is periodic with period \(q\).

</div>

<div class="example">

<strong>Example 12.3 (The doubling map).</strong> Let \(T: S^1 \to S^1\) be \(T(z) = z^2\), or equivalently \(T(x) = 2x \mod 1\) on \([0, 1)\). This is a chaotic system: nearby points diverge exponentially (sensitive dependence on initial conditions), periodic orbits are dense, and the map is topologically mixing. Writing \(x\) in binary, the doubling map simply shifts the binary expansion one place to the left — it is the "shift map" in disguise.

</div>

### Minimality and recurrence

<div class="definition">

<strong>Definition 12.4.</strong> A dynamical system \((X, T)\) is <strong>minimal</strong> if \(X\) has no proper non-empty closed invariant subset. Equivalently, every orbit is dense: \(\overline{\mathcal{O}(x)} = X\) for every \(x \in X\).

</div>

Minimal systems are the "irreducible" building blocks of topological dynamics. By Zorn's Lemma (applied to the poset of non-empty closed invariant subsets), every compact dynamical system contains a minimal subsystem. The irrational rotation is the prototypical minimal system.

A point \(x\) is **recurrent** if it returns arbitrarily close to its starting position: for every neighbourhood \(U\) of \(x\), there exists \(n \geq 1\) with \(T^n x \in U\). In a minimal system, every point is recurrent. The **Birkhoff recurrence theorem** states that *every* compact dynamical system has at least one recurrent point — this is proved using Zorn's Lemma and the intersection property of compact sets.

### The Stone-Cech compactification and ultrafilters

One of the most profound ideas in topological dynamics is the use of **ultrafilters** and the **Stone-Cech compactification** \(\beta\mathbb{N}\) as a dynamical tool.

<div class="definition">

<strong>Definition 12.5.</strong> An <strong>ultrafilter</strong> on \(\mathbb{N}\) is a collection \(p\) of subsets of \(\mathbb{N}\) that is closed under finite intersections and supersets, contains no empty set, and is "maximal" in the sense that for every \(A \subseteq \mathbb{N}\), either \(A \in p\) or \(\mathbb{N} \setminus A \in p\). The <strong>principal ultrafilters</strong> are those of the form \(p_n = \{A \subseteq \mathbb{N} \mid n \in A\}\). All others are called <strong>free ultrafilters</strong> (their existence requires the Axiom of Choice).

</div>

The set \(\beta\mathbb{N}\) of all ultrafilters on \(\mathbb{N}\), with the Stone topology, is a compact Hausdorff space in which \(\mathbb{N}\) embeds densely (via principal ultrafilters). The remarkable fact is that addition on \(\mathbb{N}\) extends to a *semigroup operation* on \(\beta\mathbb{N}\): define \(p + q = \{A \subseteq \mathbb{N} \mid \{n : A - n \in p\} \in q\}\). This operation is associative (but not commutative) and right-continuous. The algebraic structure of this semigroup — its **idempotents** (elements with \(p + p = p\)), **minimal ideals**, and **smallest ideal** — encodes deep combinatorial information about the integers.

### From dynamics to combinatorics

The connection between topological dynamics and Ramsey theory is one of the jewels of modern combinatorics.

<div class="theorem">

<strong>Theorem 12.6 (Van der Waerden, 1927).</strong> For any finite colouring of \(\mathbb{Z}\) (that is, any partition \(\mathbb{Z} = C_1 \cup C_2 \cup \cdots \cup C_r\)), at least one colour class contains arbitrarily long arithmetic progressions.

</div>

The original proof is purely combinatorial (and intricate). But there is a beautiful dynamical proof due to Furstenberg and Weiss. The idea is:

1. Encode the colouring as a point in a compact product space \(X = \{1, \ldots, r\}^{\mathbb{Z}}\) (the space of all bi-infinite sequences on \(r\) colours, with the product topology).
2. The shift map \(T: X \to X\) given by \((Tx)_n = x_{n+1}\) is a homeomorphism.
3. The colouring of \(\mathbb{Z}\) corresponds to a single point \(x_0 \in X\), and the orbit closure \(Y = \overline{\mathcal{O}(x_0)}\) is a compact invariant subsystem.
4. By the Birkhoff Multiple Recurrence Theorem (a non-trivial dynamical result), there is a point in \(Y\) that is "multiply recurrent," which translates directly into a monochromatic arithmetic progression.

This approach generalizes vastly. The **Hales-Jewett theorem** — a much stronger result about "combinatorial lines" in the grid \(\{0, 1, \ldots, k-1\}^n\) for large \(n\) — also admits a proof via topological dynamics (though the standard proof is combinatorial). It implies Van der Waerden's theorem as a special case.

<div class="theorem">

<strong>Theorem 12.7 (Hales-Jewett, 1963).</strong> For any finite alphabet \(A\) and any finite colouring of the set \(A^n\) of words of length \(n\), if \(n\) is large enough (depending on \(|A|\) and the number of colours), there exists a monochromatic <strong>combinatorial line</strong> — a set of \(|A|\) words obtained by replacing some fixed set of coordinates with each letter of \(A\) in turn.

</div>

### Boundary actions and the greatest ambit

When a topological group \(G\) acts on a compact space \(X\), the dynamics encode information about the *group itself*. The **greatest ambit** of \(G\) is the "largest" compact \(G\)-flow with a distinguished point — it is the Stone-Cech compactification \(\beta G\) with the natural \(G\)-action, and every compact \(G\)-flow is a quotient of it.

**Boundary actions** arise when \(G\) acts on a compact space \(X\) and there is a \(G\)-fixed probability measure — the "boundary" is a minimal \(G\)-invariant subset that captures the asymptotic behaviour of orbits. For free groups and hyperbolic groups, the boundary is a Cantor set or a sphere, and its dynamics encodes the geometry of the group at infinity. This connects topological dynamics to geometric group theory.

### Ergodic theory: adding measure

Topological dynamics tells us *where* orbits go, but not *how often* they visit different regions. For this, we need measures.

<div class="definition">

<strong>Definition 12.8.</strong> A <strong>measure-preserving system</strong> is a tuple \((X, \mathcal{B}, \mu, T)\) where \((X, \mathcal{B}, \mu)\) is a probability space and \(T: X \to X\) is a measurable map with \(\mu(T^{-1}(A)) = \mu(A)\) for all \(A \in \mathcal{B}\). The system is <strong>ergodic</strong> if every invariant set \(A\) (i.e., \(T^{-1}(A) = A\)) has measure 0 or 1.

</div>

Ergodicity means the system cannot be decomposed into two independent subsystems of positive measure — it is "indecomposable" from the measure-theoretic viewpoint. The irrational rotation on \(S^1\) with Lebesgue measure is ergodic. The doubling map is ergodic. The identity map is not ergodic (every set is invariant).

The **Krylov-Bogolyubov theorem** guarantees that every continuous map on a compact metrizable space has at least one invariant probability measure — so the ergodic-theoretic viewpoint is always available.

### The ergodic theorems

The **mean ergodic theorem** (von Neumann, 1932) and the **pointwise ergodic theorem** (Birkhoff, 1931) are the founding results of the subject. They say that time averages equal space averages.

<div class="theorem">

<strong>Theorem 12.9 (Birkhoff's Pointwise Ergodic Theorem).</strong> Let \((X, \mathcal{B}, \mu, T)\) be a measure-preserving system and \(f \in L^1(X, \mu)\). Then the limit

\[
\bar{f}(x) = \lim_{N \to \infty} \frac{1}{N} \sum_{n=0}^{N-1} f(T^n x)
\]

exists for \(\mu\)-almost every \(x\), and \(\bar{f}\) is \(T\)-invariant. If the system is ergodic, then \(\bar{f}(x) = \int_X f \, d\mu\) almost everywhere.

</div>

In physical terms: if \(f\) measures some observable quantity (temperature, velocity, etc.) and \(T\) is the time evolution, then the long-run time average of \(f\) along almost every orbit equals the spatial average over the entire phase space. This is the mathematical justification for the **ergodic hypothesis** in statistical mechanics — the reason we can compute thermodynamic quantities by averaging over phase space instead of tracking individual particle trajectories.

### Rokhlin's Lemma: approximation by towers

<div class="theorem">

<strong>Theorem 12.10 (Rokhlin's Lemma, 1948).</strong> Let \(T\) be an aperiodic (no periodic orbits a.e.) invertible measure-preserving transformation of a non-atomic probability space \((X, \mu)\). For any \(n \geq 1\) and \(\varepsilon > 0\), there exists a measurable set \(B\) such that the sets \(B, TB, T^2B, \ldots, T^{n-1}B\) are pairwise disjoint and

\[
\mu(B \cup TB \cup \cdots \cup T^{n-1}B) > 1 - \varepsilon.
\]

</div>

The collection \(\{B, TB, \ldots, T^{n-1}B\}\) is called a **Rokhlin tower** of height \(n\). The lemma says that an aperiodic system can be approximated by a periodic one (the tower looks like a cyclic permutation) on a set of measure as close to 1 as desired. This is an indispensable tool for constructing examples and counterexamples in ergodic theory.

### Entropy: measuring chaos

How "random" is a dynamical system? The concept of **entropy**, imported from information theory by Kolmogorov and Sinai, gives a precise numerical answer.

<div class="definition">

<strong>Definition 12.11.</strong> Let \(\mathcal{P} = \{P_1, \ldots, P_k\}\) be a finite measurable partition of \(X\). Its <strong>Shannon entropy</strong> is

\[
H(\mathcal{P}) = -\sum_{i=1}^k \mu(P_i) \log \mu(P_i).
\]

The <strong>entropy of the partition \(\mathcal{P}\) relative to \(T\)</strong> is

\[
h(T, \mathcal{P}) = \lim_{n \to \infty} \frac{1}{n} H\left(\bigvee_{j=0}^{n-1} T^{-j}\mathcal{P}\right)
\]

where \(\bigvee\) denotes the join (common refinement) of partitions. The <strong>measure-theoretic entropy</strong> of \(T\) is \(h(T) = \sup_{\mathcal{P}} h(T, \mathcal{P})\).

</div>

Entropy measures the rate at which the system generates information — how quickly you need new bits to describe the orbit of a typical point. A rotation (rational or irrational) has entropy 0: it is completely predictable. The doubling map \(x \mapsto 2x \mod 1\) has entropy \(\log 2\): each iteration effectively reveals one new binary digit.

Entropy is a conjugacy invariant: if two systems are measurably isomorphic, they have the same entropy. The converse fails in general, but for the most "random" systems it holds.

### Ornstein's theorem: the classification of Bernoulli shifts

The most spectacular application of entropy is the classification of **Bernoulli shifts** — the paradigmatic random systems.

<div class="definition">

<strong>Definition 12.12.</strong> Let \(p = (p_1, \ldots, p_k)\) be a probability vector. The <strong>Bernoulli shift</strong> \(B(p_1, \ldots, p_k)\) is the shift map on the product space \(\{1, \ldots, k\}^{\mathbb{Z}}\) with the product measure \(\mu = \prod_{n \in \mathbb{Z}} (p_1, \ldots, p_k)\). This models an independent sequence of coin flips (with a biased coin).

</div>

<div class="theorem">

<strong>Theorem 12.13 (Ornstein, 1970).</strong> Two Bernoulli shifts are measurably isomorphic if and only if they have the same entropy. That is, \(B(p_1, \ldots, p_k) \cong B(q_1, \ldots, q_\ell)\) if and only if \(-\sum p_i \log p_i = -\sum q_j \log q_j\).

</div>

This is a remarkable rigidity theorem. It says that for Bernoulli shifts, entropy is a *complete* invariant — it tells you everything. The "if" direction is the hard part: one must construct an explicit measure-preserving isomorphism between two product spaces with different alphabets but the same entropy. The proof introduces the concept of **finitely determined processes** and uses a deep approximation argument.

Ornstein's theorem has a beautiful analogy with the classification of surfaces: just as compact surfaces are classified by two numbers (orientability and Euler characteristic), Bernoulli shifts are classified by a single number (entropy).

### Orbit equivalence: dynamics beyond isomorphism

A further weakening of "same dynamics" asks only that orbits have the same *structure*, not the same map.

<div class="definition">

<strong>Definition 12.14.</strong> Two measure-preserving systems \((X, \mu, T)\) and \((Y, \nu, S)\) are <strong>orbit equivalent</strong> if there exists a measure-preserving bijection \(\varphi: X \to Y\) sending each \(T\)-orbit to an \(S\)-orbit (not necessarily respecting the dynamics).

</div>

<div class="theorem">

<strong>Theorem 12.15 (Dye, 1959).</strong> Any two ergodic measure-preserving transformations of a non-atomic probability space are orbit equivalent.

</div>

This stunning result says that from the point of view of orbit structure alone, *all* ergodic systems look the same. The entropy, which distinguishes Bernoulli shifts so precisely, is invisible to orbit equivalence. This shows that orbit equivalence is a much coarser relation than measurable isomorphism — it forgets the "speed" of the dynamics and retains only the "shape" of the orbits.

Dye's theorem is the starting point for the deep connections between ergodic theory and the theory of **von Neumann algebras** in operator theory, where the orbit equivalence relation of a group action determines a factor of type \(\mathrm{II}_1\).

### The web of connections

The interplay between the topological, combinatorial, and measure-theoretic viewpoints is the defining feature of PMATH 457. The subject draws on essentially everything developed in PMATH 367:

- **Compact spaces** are the stage for topological dynamics (Tychonoff's theorem ensures that product spaces and Stone-Cech compactifications are available).
- **Quotient spaces** appear when forming orbit spaces and factor systems.
- **Covering spaces** relate to the dynamics of deck transformations.
- **The fundamental group** appears in the study of flows on surfaces and the dynamics of surface homeomorphisms.
- **Product topologies** underlie shift spaces and symbolic dynamics.

From this foundation, the subject radiates into number theory (equidistribution, continued fractions), combinatorics (Ramsey theory, additive combinatorics), probability (mixing, large deviations), and mathematical physics (statistical mechanics, quantum ergodicity).
