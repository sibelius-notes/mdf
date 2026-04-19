---
title: "PMATH 467: Algebraic Topology"
prof: "Doug Park"
subjects: "PMATH"
---

## Sources and References

**Primary textbooks** — J. R. Munkres, *Elements of Algebraic Topology*, 1st ed.; A. Hatcher, *Algebraic Topology*, Cambridge University Press, 2002 (freely available at https://pi.math.cornell.edu/~hatcher/).
**Supplementary texts** — W. S. Massey, *A Basic Course in Algebraic Topology*; J. R. Munkres, *Topology*, 2nd ed.
**Online resources** — J. Lazovskis, compact course notes for PMATH 467/667 (Winter 2013); MIT OCW 18.905 Algebraic Topology; Gabriel Islambouli, *Algebraic Topology* lecture series (PMATH 467, Winter 2021, University of Waterloo), https://youtube.com/playlist?list=PLevbjS885lNS9Nk8ve13FE5tMdZejsTrE.

---

# Historical and Motivational Overview

The central question of topology is deceptively simple: when are two spaces "the same"? In the late eighteenth and early nineteenth centuries, mathematicians had no systematic language to answer this question. The first deep hint that global shape carries algebraic content came from Leonhard Euler's 1752 observation that for any convex polyhedron, the alternating sum \( V - E + F = 2 \) is always two. Euler's formula was not merely a curiosity about polyhedra; it was the first instance of a topological invariant — a number attached to a space that does not change under continuous deformations. In the 1860s, August Möbius and Johann Benedict Listing independently studied surfaces and introduced the notion of orientability, recognising that the Möbius band and the sphere are genuinely different kinds of objects. These investigations culminated in Henri Poincaré's landmark 1895 memoir *Analysis Situs*, which laid the foundations of what we now call algebraic topology. Poincaré introduced the **Betti numbers** as counts of independent cycles in each dimension, and he introduced the **fundamental group** as a way to detect one-dimensional "holes" that cannot be filled. His work made it clear that topological problems could be translated, at least in part, into problems about groups and linear algebra.

The period from 1895 to 1935 saw the algebraisation of Poincaré's ideas proceed rapidly. Emmy Noether, in a series of lectures in Göttingen around 1925–1927, proposed that Betti numbers and torsion coefficients should be understood not as individual numbers but as the ranks and torsion parts of **homology groups** — abelian groups encoding connectivity data. This conceptual shift, from numbers to groups, transformed the subject. Solomon Lefschetz developed intersection theory and proved his celebrated fixed-point theorem using homology. Heinz Hopf discovered nontrivial maps \( S^3 \to S^2 \), showing that higher-dimensional analogues of the fundamental group — the **higher homotopy groups** introduced by Witold Hurewicz in 1935 — were far more complex than anyone had expected. Eduard Čech and Leopold Vietoris introduced cohomological methods that would later be formalised by Samuel Eilenberg and Norman Steenrod into the axiomatic framework that defines homology theories today. The Eilenberg–MacLane paper of 1944, introducing **singular homology**, provided a definition that worked for every topological space without requiring any simplicial or polyhedral structure.

By the middle of the twentieth century, algebraic topology had become a mature machine for converting topological questions into algebraic ones. J. H. C. Whitehead's introduction of **CW complexes** in 1949 gave a flexible combinatorial language for building spaces cell by cell, making computations tractable. Serre's spectral sequences (1951) allowed the computation of homotopy groups of spheres. The language of **category theory**, invented by Eilenberg and MacLane precisely to organise the functorial relationships in algebraic topology, grew into a discipline of its own. This course covers the core of this machine: the fundamental group and covering spaces, simplicial and singular homology, cellular homology for CW complexes, the major applications (Brouwer fixed-point theorem, Borsuk–Ulam, invariance of domain, Lefschetz fixed-point theorem), and an introduction to higher homotopy groups, fibrations, and the Hurewicz and Whitehead theorems. The unifying philosophy is that every topological problem carries algebraic shadows, and understanding those shadows illuminates the geometry.

---

# Chapter 0: Geometric Notions and CW Complexes

Before introducing algebraic invariants, one must have a precise vocabulary for the spaces and maps being studied. The key notion is that of **homotopy equivalence**: two spaces are homotopy equivalent if each can be continuously deformed into the other, in a sense made precise below. This is a strictly weaker relation than homeomorphism — for instance, any contractible space is homotopy equivalent to a point, even though it may not be homeomorphic to one. The second foundational ingredient is the language of **CW complexes**, introduced by J. H. C. Whitehead in his 1949 paper "Combinatorial Homotopy I". CW complexes provide a cell-by-cell description of spaces like spheres, projective spaces, and surfaces that is ideally suited to homological computation. Nearly every space that arises in practice is either a CW complex or homotopy equivalent to one.

The historical impetus for these definitions came from the difficulty of working with arbitrary topological spaces. Poincaré's original homology theory required triangulations — decompositions into simplices — but not every topological space admits a triangulation, and even when it does, the triangulation is far from unique. Whitehead's CW complexes resolved this by allowing cells of any dimension, attached in order of increasing dimension via arbitrary continuous maps. The resulting theory is both more flexible and more computable than triangulation-based approaches, and it has become the standard setting for modern algebraic topology.

## Section 0.1: Homotopy and Homotopy Equivalence

We begin by formalising the notion of continuous deformation between maps. Informally, two maps \( f, g : X \to Y \) are homotopic if one can be continuously "slid" into the other as time \( t \) progresses from 0 to 1. This is the topologist's analogue of the analyst's notion of a one-parameter family of functions. The difference is that no smoothness or linearity is required: the deformation \( H(\cdot, t) \) is merely required to be continuous at each time \( t \), and jointly continuous in \( (x,t) \).

Homotopy equivalence is the correct notion of "sameness" in homotopy theory. It captures more than homeomorphism in some directions (contractible spaces of different dimensions are all homotopy equivalent) and less in others (homeomorphic spaces are always homotopy equivalent, but not conversely). The key feature is that all the algebraic invariants of algebraic topology — fundamental group, homology, homotopy groups — are invariant under homotopy equivalence, not just homeomorphism. This is why homotopy equivalence is the "right" relation to study.

<div class="definition">
<strong>Definition (Homotopy):</strong> Let \( X \) and \( Y \) be topological spaces and let \( f, g : X \to Y \) be continuous maps. A <em>homotopy</em> from \( f \) to \( g \) is a continuous map \( H : X \times [0,1] \to Y \) such that \( H(x,0) = f(x) \) and \( H(x,1) = g(x) \) for all \( x \in X \). When such an \( H \) exists, we write \( f \simeq g \) and say that \( f \) and \( g \) are <em>homotopic</em>.
</div>

Homotopy defines an equivalence relation on the set of continuous maps \( X \to Y \): reflexivity follows by taking \( H(x,t) = f(x) \); symmetry by \( H'(x,t) = H(x,1-t) \); transitivity by concatenating homotopies via the formula \( H \cdot K(x,t) = H(x,2t) \) for \( t \leq \tfrac{1}{2} \) and \( K(x,2t-1) \) for \( t \geq \tfrac{1}{2} \).

<div class="definition">
<strong>Definition (Homotopy Equivalence):</strong> A continuous map \( f : X \to Y \) is a <em>homotopy equivalence</em> if there exists a continuous map \( g : Y \to X \) such that \( g \circ f \simeq \mathrm{id}_X \) and \( f \circ g \simeq \mathrm{id}_Y \). In this case \( g \) is called a <em>homotopy inverse</em> of \( f \), and the spaces \( X \) and \( Y \) are said to be <em>homotopy equivalent</em> (or to have the same <em>homotopy type</em>), written \( X \simeq Y \).
</div>

<div class="definition">
<strong>Definition (Contractible Space):</strong> A topological space \( X \) is <em>contractible</em> if it is homotopy equivalent to a point, i.e., if the identity map \( \mathrm{id}_X \) is homotopic to a constant map. Equivalently, there exists a point \( x_0 \in X \) and a homotopy \( H : X \times [0,1] \to X \) with \( H(x,0) = x \) and \( H(x,1) = x_0 \) for all \( x \).
</div>

<div class="example">
<strong>Example (Punctured Plane):</strong> The punctured plane \( \mathbb{R}^2 \setminus \{0\} \) is homotopy equivalent to \( S^1 \). Define \( f : S^1 \hookrightarrow \mathbb{R}^2 \setminus \{0\} \) by inclusion and \( g : \mathbb{R}^2 \setminus \{0\} \to S^1 \) by \( g(x) = x/|x| \). Then \( g \circ f = \mathrm{id}_{S^1} \), and the map \( H(x,t) = (1-t)x + t \cdot x/|x| \) is a homotopy from \( \mathrm{id}_{\mathbb{R}^2 \setminus \{0\}} \) to \( f \circ g \). Since \( H(x,t) \neq 0 \) for all \( (x,t) \) (a convex combination of \( x \) and \( x/|x| \) with \( x \neq 0 \) is nonzero), \( H \) takes values in \( \mathbb{R}^2 \setminus \{0\} \). More generally, \( \mathbb{R}^n \setminus \{0\} \simeq S^{n-1} \) by the same argument.
</div>

<div class="example">
<strong>Example (Möbius Band):</strong> The Möbius band deformation retracts onto its core circle \( S^1 \). The deformation retraction sends each point to the nearest point on the core circle via a straight-line homotopy in the normal direction. Thus the Möbius band has the homotopy type of \( S^1 \), and in particular \( \pi_1(\text{Möbius band}) \cong \mathbb{Z} \).
</div>

<div class="definition">
<strong>Definition (Deformation Retract):</strong> A subspace \( A \subseteq X \) is a <em>deformation retract</em> of \( X \) if there exists a continuous map \( r : X \to A \) (the <em>retraction</em>) with \( r|_A = \mathrm{id}_A \), and a homotopy \( H : X \times [0,1] \to X \) such that \( H(x,0) = x \), \( H(x,1) = r(x) \) for all \( x \in X \), and \( H(a,t) = a \) for all \( a \in A \) and \( t \in [0,1] \). The homotopy \( H \) is called a <em>deformation retraction</em>.
</div>

If \( A \) is a deformation retract of \( X \), then the inclusion \( i : A \hookrightarrow X \) is a homotopy equivalence with homotopy inverse \( r \). Deformation retracts arise constantly: the figure-eight \( S^1 \vee S^1 \) is a deformation retract of the punctured torus, and any graph deformation retracts onto any spanning tree's complement.

<div class="example">
<strong>Example (Graph Deformation Retracts):</strong> Let \( X \) be a connected graph (a 1-dimensional CW complex) with \( V \) vertices and \( E \) edges. Choose a spanning tree \( T \subseteq X \). The tree \( T \) is contractible (it deformation retracts to any vertex by contracting edges one at a time), so \( X \) deformation retracts to \( X/T \), which is a wedge of \( E - V + 1 \) circles. Thus \( \pi_1(X) \cong F_{E - V + 1} \) (a free group of rank \( E - V + 1 = 1 - \chi(X) \)). For \( S^1 \vee S^1 \): \( V = 1 \), \( E = 2 \), so \( \pi_1 \cong F_2 \). For the complete graph \( K_4 \): \( V = 4 \), \( E = 6 \), so \( \pi_1(K_4) \cong F_3 \).
</div>

<div class="remark">
<strong>Remark (Homotopy Equivalence vs. Homeomorphism):</strong> Homotopy equivalence is strictly weaker than homeomorphism. The open interval \( (0,1) \) is homeomorphic to \( \mathbb{R} \) (both are 1-manifolds diffeomorphic to \( \mathbb{R} \)), and both are contractible, hence homotopy equivalent to a point. But they are not homeomorphic to a point. On the other hand, \( \mathbb{R}^2 \) and \( \mathbb{R}^3 \) are both contractible, hence homotopy equivalent to each other — but they are not homeomorphic (by invariance of domain: if they were homeomorphic, removing a point from each would give homeomorphic spaces, but \( \mathbb{R}^2 \setminus \{0\} \simeq S^1 \) and \( \mathbb{R}^3 \setminus \{0\} \simeq S^2 \) have different fundamental groups).
</div>

## Section 0.2: CW Complexes

A CW complex is built inductively by attaching cells. The letter "C" stands for "closure-finite" (each cell meets only finitely many other cells) and "W" stands for "weak topology," though these technical conditions are automatic in the finite-dimensional or finite case.

The power of the CW complex framework lies in its combination of combinatorial explicitness and topological flexibility. On the combinatorial side, a CW complex is completely described by its cells and attaching maps — finite data in the finite-dimensional finite case. On the topological side, the attaching maps are arbitrary continuous maps, not required to be linear or piecewise-linear. This flexibility means virtually every space of geometric interest is a CW complex or homotopy equivalent to one: manifolds, algebraic varieties (over \( \mathbb{C} \)), Lie groups, classifying spaces of groups, loop spaces, and so on.

The inductive construction of CW complexes mirrors the proof strategies in algebraic topology: one proves a result for 0-cells (points), then shows the result is preserved under cell attachment, deducing the result for all CW complexes by induction on skeleta. This inductive approach underlies the proofs of cellular approximation, the Whitehead theorem, and the Hurewicz theorem.

<div class="definition">
<strong>Definition (CW Complex):</strong> A <em>CW complex</em> is a Hausdorff space \( X \) together with a filtration \( \emptyset = X^{-1} \subseteq X^0 \subseteq X^1 \subseteq \cdots \subseteq X \) called the <em>skeleta</em>, constructed as follows:
<ul>
<li>The <em>0-skeleton</em> \( X^0 \) is a discrete set of points (the <em>0-cells</em>).</li>
<li>The <em>\( n \)-skeleton</em> \( X^n \) is obtained from \( X^{n-1} \) by attaching a (possibly empty) collection of <em>\( n \)-cells</em>: for each \( n \)-cell \( e^n_\alpha \), there is an <em>attaching map</em> \( \phi_\alpha : S^{n-1} \to X^{n-1} \), and \( X^n = X^{n-1} \sqcup_{\sqcup \phi_\alpha} \sqcup_\alpha D^n \).</li>
<li>If \( X \) is finite-dimensional, \( X = X^n \) for some \( n \). Otherwise \( X \) carries the weak topology: \( U \subseteq X \) is open iff \( U \cap X^n \) is open in \( X^n \) for all \( n \).</li>
</ul>
</div>

<div class="example">
<strong>Example (Spheres):</strong> The \( n \)-sphere \( S^n \) has a minimal CW structure with one 0-cell \( e^0 \) and one \( n \)-cell \( e^n \), where the attaching map \( \phi : S^{n-1} \to \{e^0\} \) is the unique constant map. Thus \( S^n = e^0 \cup e^n \). The Euler characteristic is \( \chi(S^n) = 1 + (-1)^n \), which equals 2 for even \( n \) and 0 for odd \( n \). For instance \( S^2 \) has \( \chi = 2 \), consistent with Euler's formula for polyhedra.
</div>

<div class="example">
<strong>Example (Real Projective Space):</strong> Real projective \( n \)-space \( \mathbb{RP}^n \) is the quotient of \( S^n \) by the antipodal map \( x \mapsto -x \). It has a CW structure with exactly one cell in each dimension \( 0, 1, \ldots, n \): the \( k \)-cell is the image of the open upper hemisphere \( e^k_+ \subset S^k \subset S^n \) under the quotient map. The attaching map of the \( k \)-cell is the 2-to-1 covering map \( S^{k-1} \to \mathbb{RP}^{k-1} \). So \( \mathbb{RP}^n = e^0 \cup e^1 \cup \cdots \cup e^n \) and \( \chi(\mathbb{RP}^n) = \sum_{k=0}^n (-1)^k \), which equals 1 if \( n \) is even and 0 if \( n \) is odd.
</div>

<div class="example">
<strong>Example (Complex Projective Space):</strong> Complex projective \( n \)-space \( \mathbb{CP}^n \) has a CW structure with one cell in each even dimension \( 0, 2, 4, \ldots, 2n \). The \( 2k \)-cell corresponds to the open subset \( \{[z_0 : \cdots : z_n] : z_k \neq 0, z_{k+1} = \cdots = z_n = 0\} \). Since all cells are in even dimensions, \( \chi(\mathbb{CP}^n) = n+1 \). The absence of odd-dimensional cells means the cellular boundary maps are all zero, so \( H_{2k}(\mathbb{CP}^n) \cong \mathbb{Z} \) for \( 0 \leq k \leq n \) and all other homology groups vanish.
</div>

<div class="example">
<strong>Example (Torus):</strong> The torus \( T^2 = S^1 \times S^1 \) has a CW structure with one 0-cell \( v \), two 1-cells \( a \) and \( b \), and one 2-cell \( e^2 \). The attaching map of \( e^2 \) traces the boundary word \( aba^{-1}b^{-1} \). The Euler characteristic is \( \chi(T^2) = 1 - 2 + 1 = 0 \).
</div>

<div class="example">
<strong>Example (Genus-\( g \) Surface):</strong> The orientable surface \( \Sigma_g \) of genus \( g \) has a CW structure with one 0-cell, \( 2g \) 1-cells \( a_1, b_1, \ldots, a_g, b_g \), and one 2-cell attached via the word \( a_1 b_1 a_1^{-1} b_1^{-1} \cdots a_g b_g a_g^{-1} b_g^{-1} \). Thus \( \chi(\Sigma_g) = 1 - 2g + 1 = 2 - 2g \). For \( g = 0 \), \( \Sigma_0 = S^2 \) with \( \chi = 2 \). For \( g = 1 \), \( \Sigma_1 = T^2 \) with \( \chi = 0 \).
</div>

## Section 0.3: Operations on Spaces

The operations of wedge sum, smash product, and suspension are the basic "building blocks" of stable homotopy theory. They allow us to construct new spaces from old ones in controlled ways, and the algebraic invariants of the new space are often computable in terms of those of the pieces. The suspension operation is particularly central: the Freudenthal suspension theorem (Chapter 6) says that the homotopy groups of \( S^n \) stabilise as \( n \to \infty \), and the stable groups are computed from the suspension structure. The smash product is the tensor product of based spaces and is the cornerstone of the symmetric monoidal structure on the stable homotopy category.

<div class="definition">
<strong>Definition (Wedge Sum):</strong> Given based spaces \( (X, x_0) \) and \( (Y, y_0) \), their <em>wedge sum</em> is \( X \vee Y = (X \sqcup Y) / (x_0 \sim y_0) \). It is the "one-point union" at the basepoints. In terms of CW complexes, if \( X \) and \( Y \) are CW complexes with basepoints equal to 0-cells, then \( X \vee Y \) is a CW complex with the cells of \( X \) and \( Y \) combined (identifying the two basepoint 0-cells).
</div>

<div class="definition">
<strong>Definition (Smash Product):</strong> The <em>smash product</em> of based spaces \( (X,x_0) \) and \( (Y,y_0) \) is \( X \wedge Y = (X \times Y)/(X \vee Y) \), where \( X \vee Y \) is identified with the basepoint via the quotient \( (X \times \{y_0\}) \cup (\{x_0\} \times Y) \mapsto * \). One has \( S^m \wedge S^n \cong S^{m+n} \). The smash product is the "correct" tensor product in the category of based spaces.
</div>

<div class="definition">
<strong>Definition (Suspension):</strong> The <em>suspension</em> of a space \( X \) is \( SX = X \times [0,1] / \sim \), where \( (x,0) \sim (x',0) \) and \( (x,1) \sim (x',1) \) for all \( x,x' \in X \). Alternatively, \( SX = X \wedge S^1 \). One has \( SS^n \cong S^{n+1} \), which can be seen from the CW structure: suspending the minimal CW structure of \( S^n \) (one 0-cell, one \( n \)-cell) yields a space with one 0-cell, one 1-cell (the suspension of the 0-cell), one \( n+1 \)-cell (the suspension of the \( n \)-cell), which is exactly the minimal CW structure of \( S^{n+1} \).
</div>

<div class="definition">
<strong>Definition (Euler Characteristic):</strong> If \( X \) is a finite CW complex with \( c_n \) cells of dimension \( n \), its <em>Euler characteristic</em> is \( \chi(X) = \sum_{n \geq 0} (-1)^n c_n \). This is a homotopy invariant: we will see in Chapter 3 that \( \chi(X) = \sum_n (-1)^n \mathrm{rank}(H_n(X)) \), and since homology groups are homotopy invariants, so is \( \chi \).
</div>

<div class="remark">
<strong>Remark (Multiplicativity):</strong> The Euler characteristic satisfies \( \chi(X \times Y) = \chi(X) \cdot \chi(Y) \) and \( \chi(X \vee Y) = \chi(X) + \chi(Y) - 1 \). For a CW complex with a fibration \( F \to E \to B \), there is the formula \( \chi(E) = \chi(F) \cdot \chi(B) \). These multiplicativity properties make the Euler characteristic a powerful invariant for product and bundle computations, and will be especially useful when we compute the Lefschetz number in Chapter 5.
</div>

<div class="example">
<strong>Example (Euler Characteristic Computations):</strong> We collect some verification computations.
<ul>
<li>\( \chi(T^2) = \chi(S^1 \times S^1) = \chi(S^1)^2 = 0 \cdot 0 = 0 \). Alternatively, using cells: \( 1 - 2 + 1 = 0 \).</li>
<li>\( \chi(\mathbb{CP}^1) = \chi(S^2) = 2 \), consistent with \( \mathbb{CP}^1 \cong S^2 \) and the CW structure \( e^0 \cup e^2 \).</li>
<li>\( \chi(\mathbb{CP}^2) = 3 \) (cells in dimensions 0, 2, 4), and for the Hopf fibration \( S^1 \hookrightarrow S^3 \to S^2 \): \( \chi(S^3) = 0 = \chi(S^1) \cdot \chi(S^2) = 0 \cdot 2 = 0 \). Consistent.</li>
<li>For a closed orientable surface \( \Sigma_g \): \( \chi = 2 - 2g \). The genus-2 surface \( \Sigma_2 \) has \( \chi = -2 \), confirming the CW count \( 1 - 4 + 1 = -2 \).</li>
</ul>
</div>

<div class="remark">
<strong>Remark (Relationship Between Chapters 0, 1, and 2):</strong> The CW complex framework introduced in this chapter underlies all the computational machinery that follows. In Chapter 1, we compute \( \pi_1 \) of familiar spaces like \( S^1 \) and \( \mathbb{RP}^n \) using their CW structures (via covering maps and van Kampen). In Chapter 2, van Kampen's theorem is most easily applied when we know a CW structure for the space. In Chapters 3 and 4, the cellular chain complex — defined entirely in terms of the CW structure — gives the most efficient route to homology groups. The Euler characteristic, defined combinatorially, turns out to equal an alternating sum of homology ranks, showing that the combinatorial and algebraic invariants are deeply related.
</div>

---

# Chapter 1: The Fundamental Group

The fundamental group \( \pi_1(X, x_0) \) is the first and most accessible algebraic invariant of a topological space. The idea, due to Poincaré in *Analysis Situs*, is to study loops at a basepoint up to continuous deformation. Two spaces with non-isomorphic fundamental groups cannot be homeomorphic — or even homotopy equivalent — so the fundamental group is a powerful tool for distinguishing spaces. For instance, the circle \( S^1 \) and the disk \( D^2 \) are not homotopy equivalent: \( \pi_1(S^1) \cong \mathbb{Z} \) while \( \pi_1(D^2) = 0 \). Poincaré's original insight was that loops representing different "winding numbers" around a hole are genuinely different, and the group structure captures how loops can be concatenated.

The computation of \( \pi_1(S^1) \cong \mathbb{Z} \) is the cornerstone theorem of this chapter. Its proof uses the theory of **covering spaces** — in particular, the covering \( p : \mathbb{R} \to S^1 \) given by \( p(t) = e^{2\pi i t} \). The integers index the sheets of this cover, and the winding number of a loop at 1 is the integer endpoint of its unique lift starting at 0. This connection between covering spaces and the fundamental group will be vastly generalised in Chapter 2.

Historically, the notion of a fundamental group crystallised slowly. Poincaré defined it in *Analysis Situs* (1895) as the group of "paths returning to the basepoint up to continuous deformation," but his original definition was imprecise about basepoints and path-homotopy. The modern definition, with path-homotopy fixing endpoints and the group operation given by concatenation, was established by the early twentieth century through the work of Tietze, Seifert, and Reidemeister. Reidemeister's introduction of **presentations** of groups by generators and relations (1927) provided the algebraic language needed to express the outputs of van Kampen's theorem precisely.

The fundamental group is both the simplest and the most non-abelian of the invariants studied in this course. It is sensitive to 1-dimensional topology: adding a 1-cell to a CW complex introduces a new generator of \( \pi_1 \), while adding a 2-cell kills a relation. This generator-relation structure — visible in the van Kampen theorem of Chapter 2 — means that every finitely presented group arises as \( \pi_1 \) of some compact space (in fact, of some compact 4-manifold). In contrast, homology groups are abelian and lose the non-commutative information; the passage from \( \pi_1 \) to \( H_1 \) is precisely abelianisation, as we prove in Chapter 5.

## Section 1.1: Paths and the Fundamental Group

The definition of path-homotopy deserves careful thought. The key feature is that endpoints are held fixed throughout the homotopy: a path from \( x_0 \) to \( x_1 \) must be homotoped through paths that also go from \( x_0 \) to \( x_1 \). Without this constraint, any two paths in a path-connected space would be homotopic (just move everything to a constant path). The endpoint-fixing condition is what gives \( \pi_1 \) its nontrivial content: it asks not just "can this loop be deformed to a point?" but "can it be deformed to the constant loop while keeping the basepoint fixed at all times?"

A second subtlety is the parametrisation: we always parametrise paths on \( [0,1] \), and path-homotopy is a homotopy of parametrised paths. A reparametrisation \( \gamma \circ \phi \) (where \( \phi : [0,1] \to [0,1] \) is a homeomorphism with \( \phi(0)=0 \) and \( \phi(1)=1 \)) is always path-homotopic to \( \gamma \), since \( H(s,t) = \gamma((1-t)\phi(s) + ts) \) provides the homotopy. This means that concatenation is associative up to reparametrisation, hence associative in the quotient \( \pi_1 \).

<div class="definition">
<strong>Definition (Path):</strong> A <em>path</em> in a topological space \( X \) is a continuous map \( \gamma : [0,1] \to X \). The point \( \gamma(0) \) is the <em>initial point</em> and \( \gamma(1) \) is the <em>terminal point</em>. A <em>loop</em> based at \( x_0 \) is a path with \( \gamma(0) = \gamma(1) = x_0 \).
</div>

<div class="definition">
<strong>Definition (Path-Homotopy):</strong> Two paths \( \gamma_0, \gamma_1 : [0,1] \to X \) with the same endpoints (\( \gamma_0(0) = \gamma_1(0) \) and \( \gamma_0(1) = \gamma_1(1) \)) are <em>path-homotopic</em>, written \( \gamma_0 \simeq_p \gamma_1 \), if there exists a continuous map \( H : [0,1] \times [0,1] \to X \) such that:
<ul>
<li>\( H(s,0) = \gamma_0(s) \) and \( H(s,1) = \gamma_1(s) \) for all \( s \),</li>
<li>\( H(0,t) = \gamma_0(0) \) and \( H(1,t) = \gamma_0(1) \) for all \( t \).</li>
</ul>
</div>

<div class="definition">
<strong>Definition (Concatenation and Reverse):</strong> Given paths \( \gamma : x_0 \to x_1 \) and \( \delta : x_1 \to x_2 \), their <em>concatenation</em> is the path \( \gamma \cdot \delta : [0,1] \to X \) defined by \( (\gamma \cdot \delta)(s) = \gamma(2s) \) for \( s \leq \tfrac{1}{2} \) and \( \delta(2s-1) \) for \( s \geq \tfrac{1}{2} \). The <em>reverse</em> of \( \gamma \) is \( \bar\gamma(s) = \gamma(1-s) \). These operations are well-defined on path-homotopy classes: if \( \gamma_0 \simeq_p \gamma_1 \) and \( \delta_0 \simeq_p \delta_1 \), then \( \gamma_0 \cdot \delta_0 \simeq_p \gamma_1 \cdot \delta_1 \).
</div>

<div class="definition">
<strong>Definition (Fundamental Group):</strong> Let \( x_0 \in X \). The <em>fundamental group</em> \( \pi_1(X, x_0) \) is the set of path-homotopy classes \( [\gamma] \) of loops \( \gamma \) based at \( x_0 \), with the group operation \( [\gamma] \cdot [\delta] = [\gamma \cdot \delta] \). The identity element is the class of the constant loop \( c_{x_0}(s) = x_0 \).
</div>

<div class="theorem">
<strong>Theorem (Fundamental Group is a Group):</strong> The set \( \pi_1(X, x_0) \) with the concatenation product is a group.
</div>

<div class="proof">
<em>Proof.</em> We verify the four group axioms in detail. Throughout, we use the gluing lemma: if \( f : A \to Y \) and \( g : B \to Y \) are continuous maps with \( A \cup B \) having \( A, B \) closed (or open) and \( f|_{A \cap B} = g|_{A \cap B} \), then the combined map \( A \cup B \to Y \) is continuous.

<strong>Well-definedness:</strong> If \( \gamma_0 \simeq_p \gamma_1 \) via \( H \) and \( \delta_0 \simeq_p \delta_1 \) via \( K \), define \( L(s,t) = H(2s,t) \) for \( s \leq \tfrac{1}{2} \) and \( K(2s-1,t) \) for \( s \geq \tfrac{1}{2} \). This is continuous by the gluing lemma and shows \( \gamma_0 \cdot \delta_0 \simeq_p \gamma_1 \cdot \delta_1 \).

<strong>Associativity:</strong> We need \( (\gamma \cdot \delta) \cdot \varepsilon \simeq_p \gamma \cdot (\delta \cdot \varepsilon) \). These are the same path traversed at different speeds. Define the homotopy \( H : [0,1]^2 \to X \) by:

\[
H(s,t) = \begin{cases} \gamma\!\left(\dfrac{4s}{t+1}\right) & 0 \leq s \leq \dfrac{t+1}{4}, \\[4pt] \delta(4s - t - 1) & \dfrac{t+1}{4} \leq s \leq \dfrac{t+2}{4}, \\[4pt] \varepsilon\!\left(\dfrac{4s - t - 2}{2-t}\right) & \dfrac{t+2}{4} \leq s \leq 1. \end{cases}
\]
At \( t=0 \), the breakpoints are \( \tfrac{1}{4}, \tfrac{1}{2} \), giving \( (\gamma \cdot \delta) \cdot \varepsilon \); at \( t=1 \), the breakpoints are \( \tfrac{1}{2}, \tfrac{3}{4} \), giving \( \gamma \cdot (\delta \cdot \varepsilon) \).

<strong>Identity:</strong> For the right identity, define \( H(s,t) = \gamma\!\left(\dfrac{2s}{1+t}\right) \) for \( s \leq \dfrac{1+t}{2} \) and \( H(s,t) = x_1 \) for \( s \geq \dfrac{1+t}{2} \), where \( x_1 = \gamma(1) \). This is a homotopy from \( \gamma \cdot c_{x_1} \) (at \( t=0 \)) to \( \gamma \) (at \( t=1 \), where the formula gives \( \gamma(s) \) for \( s \leq 1 \)).

<strong>Inverses:</strong> For any loop \( \gamma \) based at \( x_0 \), the homotopy

\[
H(s,t) = \begin{cases} \gamma(2s) & 0 \leq s \leq \dfrac{1-t}{2}, \\ \gamma(1-t) & \dfrac{1-t}{2} \leq s \leq \dfrac{1+t}{2}, \\ \gamma(2-2s) & \dfrac{1+t}{2} \leq s \leq 1 \end{cases}
\]
is a path-homotopy from \( \gamma \cdot \bar\gamma \) (at \( t=0 \)) to the constant loop \( c_{x_0} \) (at \( t=1 \), where the middle segment occupies all of \( [0,1] \)). \( \square \)
</div>

<div class="remark">
<strong>Remark (Change of Basepoint):</strong> If \( X \) is path-connected and \( x_0, x_1 \in X \), any path \( \alpha \) from \( x_0 \) to \( x_1 \) induces an isomorphism \( \hat\alpha : \pi_1(X,x_0) \xrightarrow{\sim} \pi_1(X,x_1) \) by \( \hat\alpha([\gamma]) = [\bar\alpha \cdot \gamma \cdot \alpha] \). Different choices of \( \alpha \) yield conjugate isomorphisms, so \( \pi_1(X,x_0) \) is well-defined up to isomorphism for a path-connected space, and we often write \( \pi_1(X) \) when the basepoint is understood.
</div>

## Section 1.2: The Fundamental Group of the Circle

This is the most important single computation in algebraic topology. We will show that \( \pi_1(S^1) \cong \mathbb{Z} \), where the isomorphism is given by the **winding number**.

The intuition is clear: a loop on the circle either wraps around 0 times (a contractible loop), or wraps around \( n \) times for some nonzero integer \( n \). The integer \( n \) is the winding number. Positive \( n \) means counterclockwise wrapping, negative means clockwise. Two loops are homotopic if and only if they have the same winding number. The group structure is addition of winding numbers: if \( \gamma \) wraps \( m \) times and \( \delta \) wraps \( n \) times, then \( \gamma \cdot \delta \) wraps \( m + n \) times.

The formal proof uses the exponential covering \( p : \mathbb{R} \to S^1 \), \( p(t) = e^{2\pi it} \). This covering "unrolls" the circle into the real line, and the winding number becomes the endpoint of the lifted path — an integer because both endpoints of the loop must project to the same point \( 1 \in S^1 \).

Consider the covering map \( p : \mathbb{R} \to S^1 \) defined by \( p(t) = e^{2\pi it} \).

<div class="theorem">
<strong>Theorem (Path Lifting):</strong> Let \( p : \mathbb{R} \to S^1 \) be the exponential covering. For every path \( \gamma : [0,1] \to S^1 \) and every \( \tilde{x}_0 \in \mathbb{R} \) with \( p(\tilde{x}_0) = \gamma(0) \), there exists a unique path \( \tilde\gamma : [0,1] \to \mathbb{R} \) with \( \tilde\gamma(0) = \tilde{x}_0 \) and \( p \circ \tilde\gamma = \gamma \).
</div>

<div class="proof">
<em>Proof.</em> Cover \( S^1 \) by the evenly covered open sets \( U_+ = S^1 \setminus \{-1\} \) and \( U_- = S^1 \setminus \{1\} \). Each of \( p^{-1}(U_+) \) and \( p^{-1}(U_-) \) is a disjoint union of open intervals in \( \mathbb{R} \), each mapped homeomorphically by \( p \) onto \( U_+ \) (resp. \( U_- \)). Since \( [0,1] \) is compact, by Lebesgue's number lemma there exists a subdivision \( 0 = t_0 < t_1 < \cdots < t_k = 1 \) such that each \( \gamma([t_{i-1}, t_i]) \) lies entirely in \( U_+ \) or \( U_- \). On the first sub-interval \( [t_0, t_1] \), the unique sheet of \( p^{-1}(U_\pm) \) containing \( \tilde x_0 \) determines a unique local lift. This lift ends at some \( \tilde x_1 \in p^{-1}(\gamma(t_1)) \), which uniquely determines the lift on \( [t_1, t_2] \), and so on. The concatenation of these local lifts is the unique global lift \( \tilde\gamma \). \( \square \)
</div>

<div class="theorem">
<strong>Theorem (Homotopy Lifting):</strong> For every homotopy \( H : [0,1] \times [0,1] \to S^1 \) fixing endpoints, and every lift \( \tilde{H}_0 \) of \( H(\cdot,0) \), there is a unique homotopy \( \tilde{H} : [0,1] \times [0,1] \to \mathbb{R} \) with \( \tilde{H}(\cdot,0) = \tilde{H}_0 \) and \( p \circ \tilde{H} = H \). Moreover, \( \tilde{H} \) fixes both endpoints for all \( t \).
</div>

<div class="definition">
<strong>Definition (Winding Number):</strong> For a loop \( \gamma : [0,1] \to S^1 \) based at \( 1 \in S^1 \), let \( \tilde\gamma \) be the unique lift of \( \gamma \) with \( \tilde\gamma(0) = 0 \). The <em>winding number</em> (or <em>degree</em>) of \( \gamma \) is \( \deg(\gamma) = \tilde\gamma(1) \in \mathbb{Z} \). (Since \( p(\tilde\gamma(1)) = \gamma(1) = 1 = p(0) \), we have \( \tilde\gamma(1) \in p^{-1}(1) = \mathbb{Z} \).)
</div>

<div class="theorem">
<strong>Theorem (\( \pi_1(S^1) \cong \mathbb{Z} \)):</strong> The winding number map \( \Phi : \pi_1(S^1, 1) \to \mathbb{Z} \) defined by \( \Phi([\gamma]) = \deg(\gamma) \) is a group isomorphism.
</div>

<div class="proof">
<em>Proof.</em> We verify the four properties.

<strong>Well-defined:</strong> If \( \gamma_0 \simeq_p \gamma_1 \) via a homotopy \( H \), the homotopy lifting property gives a lifted homotopy \( \tilde H \) fixing the starting value \( 0 \). Since \( \tilde H(1,t) \in \mathbb{Z} \) is continuous in \( t \) and \( \mathbb{Z} \) is discrete, \( \tilde H(1,t) \) is constant, so \( \tilde\gamma_0(1) = \tilde H(1,0) = \tilde H(1,1) = \tilde\gamma_1(1) \). Thus \( \Phi \) is well-defined.

<strong>Homomorphism:</strong> If \( \gamma \) lifts to \( \tilde\gamma \) with \( \tilde\gamma(0)=0 \) and \( \tilde\gamma(1)=m \), and \( \delta \) lifts to \( \tilde\delta \) with \( \tilde\delta(0)=0 \) and \( \tilde\delta(1)=n \), then the lift of \( \gamma \cdot \delta \) starting at 0 is:

\[
\widetilde{\gamma \cdot \delta}(s) = \begin{cases} \tilde\gamma(2s) & s \leq \tfrac{1}{2}, \\ m + \tilde\delta(2s-1) & s \geq \tfrac{1}{2}. \end{cases}
\]
This lift ends at \( m + n \). So \( \Phi([\gamma][\delta]) = m+n = \Phi([\gamma]) + \Phi([\delta]) \).

<strong>Surjectivity:</strong> For each \( n \in \mathbb{Z} \), define the loop \( \omega_n(s) = e^{2\pi ins} \). Its lift starting at 0 is the path \( \tilde\omega_n(s) = ns \), which ends at \( n \). So \( \Phi([\omega_n]) = n \), and \( \Phi \) is surjective. Geometrically, \( \omega_n \) winds around the circle \( n \) times counterclockwise (or \( |n| \) times clockwise if \( n < 0 \)).

<strong>Injectivity:</strong> Suppose \( \Phi([\gamma]) = 0 \), i.e., the lift \( \tilde\gamma \) satisfies \( \tilde\gamma(0) = \tilde\gamma(1) = 0 \). Then \( \tilde\gamma \) is a loop in \( \mathbb{R} \) based at \( 0 \). Since \( \mathbb{R} \) is convex, it is contractible (the straight-line homotopy \( \tilde H(s,t) = (1-t)\tilde\gamma(s) \) contracts \( \tilde\gamma \) to the constant loop at 0, keeping the basepoint fixed since \( \tilde H(0,t) = (1-t) \cdot 0 = 0 \) and \( \tilde H(1,t) = (1-t) \cdot 0 = 0 \)). Hence \( \tilde\gamma \simeq_p c_0 \) in \( \mathbb{R} \) via \( \tilde H \). Then \( H = p \circ \tilde H \) is a path-homotopy from \( p \circ \tilde\gamma = \gamma \) to \( p \circ c_0 = c_1 \) in \( S^1 \). Hence \( [\gamma] = [c_1] \) is the identity. \( \square \)
</div>

<div class="example">
<strong>Example (Explicit Computation of Winding Numbers):</strong> We compute the winding numbers of several loops.
<ul>
<li>The constant loop \( c_1(s) = 1 \) lifts to \( \tilde c(s) = 0 \), so \( \deg(c_1) = 0 \).</li>
<li>The loop \( \omega_1(s) = e^{2\pi is} \) (one counterclockwise revolution) lifts to \( \tilde\omega_1(s) = s \), ending at 1, so \( \deg(\omega_1) = 1 \).</li>
<li>The loop \( \omega_{-1}(s) = e^{-2\pi is} \) (one clockwise revolution) lifts to \( \tilde\omega_{-1}(s) = -s \), ending at \( -1 \), so \( \deg(\omega_{-1}) = -1 \).</li>
<li>The loop \( \omega_2(s) = e^{4\pi is} \) (two counterclockwise revolutions) lifts to \( \tilde\omega_2(s) = 2s \), ending at 2, so \( \deg(\omega_2) = 2 \).</li>
<li>The concatenation \( \omega_m \cdot \omega_n \) has winding number \( m + n \), confirming the homomorphism property.</li>
</ul>
</div>

<div class="remark">
<strong>Remark (Functoriality):</strong> A continuous map \( f : (X,x_0) \to (Y,y_0) \) induces a group homomorphism \( f_* : \pi_1(X,x_0) \to \pi_1(Y,y_0) \) by \( f_*([\gamma]) = [f \circ \gamma] \). This satisfies \( (g \circ f)_* = g_* \circ f_* \) and \( (\mathrm{id})_* = \mathrm{id} \). Thus \( \pi_1 \) is a functor from the category of based topological spaces to the category of groups. In particular, a homotopy equivalence induces a group isomorphism on \( \pi_1 \). This functoriality is the key ingredient in the applications below and will be strengthened in Chapters 3 and 4 when we discuss the analogous functoriality for homology.
</div>

<div class="example">
<strong>Example (Fundamental Groups of Common Spaces):</strong> We summarise the fundamental groups of standard spaces, most of which follow from the computations in this and subsequent chapters.

| Space \( X \) | \( \pi_1(X) \) | Method |
|---|---|---|
| \( \mathbb{R}^n \) | 0 | Contractible |
| \( D^n \) | 0 | Contractible |
| \( S^n \), \( n \geq 2 \) | 0 | Van Kampen (Chapter 2) |
| \( S^1 \) | \( \mathbb{Z} \) | Exponential covering |
| \( T^2 \) | \( \mathbb{Z}^2 \) | Van Kampen |
| \( \Sigma_g \) | \( \langle a_i,b_i \mid \prod [a_i,b_i] \rangle \) | Van Kampen |
| \( \mathbb{RP}^1 \) | \( \mathbb{Z} \) | \( \mathbb{RP}^1 \cong S^1 \) |
| \( \mathbb{RP}^2 \) | \( \mathbb{Z}/2 \) | Van Kampen |
| \( \mathbb{RP}^n \), \( n \geq 2 \) | \( \mathbb{Z}/2 \) | Double covering \( S^n \to \mathbb{RP}^n \) |
| \( \mathbb{CP}^n \) | 0 | Cells only in even dimensions |
| \( S^1 \vee S^1 \) | \( F_2 \) | Van Kampen |
| Klein bottle | \( \langle a,b \mid abab^{-1} \rangle \) | Van Kampen |
</div>

<div class="example">
<strong>Example (Simply Connected Spaces):</strong> A path-connected space \( X \) is <em>simply connected</em> if \( \pi_1(X) = 0 \). The following spaces are simply connected:
<ul>
<li>\( \mathbb{R}^n \) for all \( n \): contractible, hence simply connected.</li>
<li>\( D^n \) for all \( n \): contractible.</li>
<li>\( S^n \) for \( n \geq 2 \): since \( S^n = e^0 \cup e^n \) and the attaching map of the \( n \)-cell is constant, there are no 1-cells, so \( \pi_1(S^n) = 0 \) by van Kampen (to be proved in Chapter 2). Alternatively: \( S^n \) minus a point is homeomorphic to \( \mathbb{R}^n \), which is simply connected; the Seifert–van Kampen theorem with the two punctured-hemisphere decomposition gives trivial \( \pi_1 \).</li>
<li>\( \mathbb{CP}^n \) for all \( n \geq 1 \): since the 1-skeleton of \( \mathbb{CP}^n \) is just a point (cells only in even dimensions), there are no loops to generate \( \pi_1 \).</li>
</ul>
On the other hand, \( S^1 \), \( T^2 \), and \( \Sigma_g \) for \( g \geq 1 \) are not simply connected.
</div>

<div class="remark">
<strong>Remark (Loops and 2-Cells):</strong> Intuitively, \( \pi_1(X) \) is generated by loops that wrap around "1-dimensional holes" (i.e., loops not bounding disks), and is killed by 2-cells (disks) whose boundary circles fill in those loops. This is precisely the content of van Kampen's theorem in Chapter 2: attaching a 2-cell via an attaching map \( \phi : S^1 \to X \) kills the normal closure of \( [\phi] \in \pi_1(X) \) from the fundamental group. The interplay between generators (from 1-cells) and relations (from 2-cells) is the algebraic skeleton of a CW complex, and it will reappear in the cellular boundary formula in Chapter 3.
</div>

## Section 1.3: Applications of \( \pi_1 \)

The results in this section all follow the same template: use the functor \( \pi_1 \) to convert a topological statement into an algebraic one, and then derive a contradiction from the algebraic impossibility. In each case, the argument has the form: "if the topological conclusion fails, then there is a retraction of a simply connected space onto a space with nontrivial \( \pi_1 \), which is impossible." This pattern — assuming the conclusion fails, constructing a map with contradictory algebraic properties, and applying functoriality — is the fundamental method of algebraic topology.

<div class="theorem">
<strong>Theorem (Brouwer Fixed-Point Theorem, Dimension 2):</strong> Every continuous map \( f : D^2 \to D^2 \) has a fixed point.
</div>

<div class="proof">
<em>Proof.</em> Suppose for contradiction that \( f(x) \neq x \) for all \( x \in D^2 \). Define a retraction \( r : D^2 \to S^1 \) as follows: for each \( x \), let \( r(x) \) be the point on \( S^1 \) obtained by extending the ray from \( f(x) \) through \( x \) until it hits \( S^1 \). Since \( f(x) \neq x \), this ray is well-defined, and by an explicit formula involving the quadratic formula on the line through \( f(x) \) and \( x \), \( r \) is continuous. For \( x \in S^1 \), the ray from \( f(x) \) through \( x \) hits \( S^1 \) first at \( x \) itself, so \( r|_{S^1} = \mathrm{id}_{S^1} \). Thus \( r \) is a retraction of \( D^2 \) onto \( S^1 \). The inclusion-retraction composite \( S^1 \xrightarrow{i} D^2 \xrightarrow{r} S^1 \) equals \( \mathrm{id}_{S^1} \), so \( r_* \circ i_* = \mathrm{id} \) on \( \pi_1(S^1) \cong \mathbb{Z} \). However, \( D^2 \) is contractible, so \( \pi_1(D^2) = 0 \), and \( i_* : \mathbb{Z} \to 0 \) is the zero map, making \( r_* \circ i_* = 0 \neq \mathrm{id} \) — a contradiction. \( \square \)
</div>

<div class="theorem">
<strong>Theorem (Fundamental Theorem of Algebra):</strong> Every non-constant polynomial \( p(z) = z^n + a_{n-1}z^{n-1} + \cdots + a_0 \in \mathbb{C}[z] \) has a root in \( \mathbb{C} \).
</div>

<div class="proof">
<em>Proof.</em> Suppose \( p \) has no root. For \( r \geq 0 \), define the loop \( \gamma_r : [0,1] \to \mathbb{C} \setminus \{0\} \) by \( \gamma_r(s) = p(re^{2\pi is}) \). This is a family of loops depending continuously on \( r \), so the winding number of \( \gamma_r \) around 0 is a continuous function of \( r \). Since the winding number is integer-valued, it is constant in \( r \). At \( r = 0 \), \( \gamma_0(s) = a_0 \neq 0 \) is constant, with winding number 0. For large \( r \), write \( p(re^{2\pi is}) = r^n e^{2\pi ins}(1 + a_{n-1}r^{-1}e^{-2\pi is} + \cdots) \). The term in parentheses is close to 1 for large \( r \), so by the homotopy \( H(s,t) = r^n e^{2\pi ins}(1 + t(a_{n-1}r^{-1}e^{-2\pi is} + \cdots)) \), \( \gamma_r \) is homotopic to the loop \( s \mapsto r^n e^{2\pi ins} \) which has winding number \( n \geq 1 \). But \( n \geq 1 \neq 0 \), contradicting constancy of the winding number. \( \square \)
</div>

<div class="theorem">
<strong>Theorem (Borsuk–Ulam in Dimension 1):</strong> For any continuous \( f : S^1 \to \mathbb{R} \), there exists a point \( x \in S^1 \) such that \( f(x) = f(-x) \).
</div>

<div class="proof">
<em>Proof.</em> Define \( g : S^1 \to \mathbb{R} \) by \( g(x) = f(x) - f(-x) \). Then \( g(-x) = f(-x) - f(x) = -g(x) \), so \( g \) is an <em>odd</em> function. Pick any \( x_0 \in S^1 \). The values \( g(x_0) \) and \( g(-x_0) = -g(x_0) \) have opposite signs (or both are zero, in which case we are done). Moving continuously from \( x_0 \) to \( -x_0 \) along the upper semicircle, \( g \) changes continuously from \( g(x_0) \) to \( -g(x_0) \). By the Intermediate Value Theorem, there exists a point \( x^* \) on this arc with \( g(x^*) = 0 \), i.e., \( f(x^*) = f(-x^*) \). \( \square \)
</div>

<div class="example">
<strong>Example (Torus Knot Complement and \( \pi_1 \)):</strong> The <em>trefoil knot</em> is a \( (2,3) \) torus knot — it winds twice around the torus in one direction and three times in the other. The fundamental group of its complement in \( S^3 \) is \( \pi_1(S^3 \setminus K_{2,3}) \cong \langle a, b \mid a^2 = b^3 
angle \). Observe that this group is non-abelian: \( a \) and \( b \) do not commute in general (the element \( a^2 = b^3 \) is central, but \( ab 
eq ba \)). More generally, the complement of the \( (p,q) \) torus knot has \( \pi_1 \cong \langle a,b \mid a^p = b^q 
angle \). The abelianisation is \( \langle a,b \mid a^p = b^q, ab = ba 
angle \cong \mathbb{Z} \) (generated by a meridian), confirming \( H_1(S^3 \setminus K) \cong \mathbb{Z} \) for any knot. The non-trivial \( \pi_1 \) detects the knotting: the unknot has \( \pi_1 \cong \mathbb{Z} \), while the trefoil has \( \pi_1 
ot\cong \mathbb{Z} \), so trefoil and unknot are genuinely different knots.
</div>

<div class="example">
<strong>Example (Van Kampen Preview: Two Loops Attached):</strong> Let \( X = S^1 ee S^1 \) — two circles joined at a point. As computed in Chapter 2, van Kampen gives \( \pi_1(X) \cong F_2 = \langle a, b 
angle \), the free group on two generators. Now consider attaching a 2-cell along the commutator \( aba^{-1}b^{-1} \): the resulting space \( Y = (S^1 ee S^1) \cup_{aba^{-1}b^{-1}} e^2 \) has \( \pi_1(Y) \cong F_2 / \langle\!\langle aba^{-1}b^{-1} 
angle\!
angle \cong \mathbb{Z}^2 \), since killing the commutator abelianises \( F_2 \). Thus \( Y \simeq T^2 \): attaching the 2-cell turns the figure-eight into a torus. This illustrates the general principle: adding 2-cells kills relations in \( \pi_1 \), while adding 1-cells adds generators.
</div>

<div class="remark">
<strong>Remark (Non-Homeomorphism of \( \mathbb{R} \) and \( \mathbb{R}^2 \) via \( \pi_1 \)):</strong> A classical application of \( \pi_1 \) is distinguishing \( \mathbb{R} \) and \( \mathbb{R}^2 \). Suppose for contradiction that \( f : \mathbb{R} 	o \mathbb{R}^2 \) is a homeomorphism. Choose any point \( x_0 \in \mathbb{R} \); then \( f \) restricts to a homeomorphism \( \mathbb{R} \setminus \{x_0\} 	o \mathbb{R}^2 \setminus \{f(x_0)\} \). But \( \mathbb{R} \setminus \{x_0\} \) has two path-connected components (it is disconnected), while \( \mathbb{R}^2 \setminus \{f(x_0)\} \simeq S^1 \) is path-connected. A homeomorphism must preserve path-connectedness and the number of components, contradiction. More precisely, \( \pi_1(\mathbb{R} \setminus \{x_0\}) = 0 \) (it is two contractible rays) while \( \pi_1(\mathbb{R}^2 \setminus \{f(x_0)\}) \cong \mathbb{Z} 
eq 0 \), providing an algebraic proof. The same argument, using \( H_k \) instead of \( \pi_1 \), will distinguish \( \mathbb{R}^n \) and \( \mathbb{R}^m \) for all \( n 
eq m \) via invariance of domain (Chapter 5).
</div>

<div class="remark">
<strong>Remark (Summary of Chapter 1 and Preview of Chapter 2):</strong> We have established three fundamental results using \( \pi_1 \): (1) \( \pi_1(S^1) \cong \mathbb{Z} \) via the exponential covering; (2) the Brouwer fixed-point theorem in dimension 2; (3) the Fundamental Theorem of Algebra. The common thread is that \( \pi_1 \) is a functor — topological facts about maps are reflected in algebraic facts about induced homomorphisms. In Chapter 2, we will systematically exploit this functoriality via van Kampen's theorem to compute \( \pi_1 \) of surfaces, knot complements, and spaces built from pieces. The covering space theory will refine the connection between \( \pi_1(X) \) and the covers of \( X \) from a single example (\( \mathbb{R} 	o S^1 \)) to a complete classification.
</div>

---

# Chapter 2: Van Kampen's Theorem and Covering Spaces

Van Kampen's theorem, in its simplest form, tells us how to compute the fundamental group of a space assembled from two pieces. Seifert stated a version in 1930 and van Kampen gave the general formulation in 1933. The theorem converts the topological problem of computing \( \pi_1 \) into a purely algebraic one involving amalgamated free products. It is the primary computational tool for fundamental groups of surfaces, knot complements, and graphs of spaces.

Covering space theory provides a deep bridge between topology and group theory: the connected covering spaces of a "nice" space \( X \) are classified (up to isomorphism over \( X \)) by the conjugacy classes of subgroups of \( \pi_1(X) \). This classification theorem was known in spirit to Poincaré and was made rigorous by Seifert and Threlfall in the 1930s. The universality of the infinite cyclic cover \( \mathbb{R} \to S^1 \) and the infinite tree covering \( S^1 \vee S^1 \) illustrates the power of the theory. The classification will be made fully precise once we study lifting criteria.

From a historical perspective, covering spaces were first studied systematically by Poincaré in the context of Riemann surfaces and monodromy of differential equations. The monodromy of an analytic continuation around a branch point is precisely an element of the deck transformation group of the corresponding covering. The algebraic theory of covering spaces — linking them to subgroups of \( \pi_1 \) — was developed by Reidemeister and Schreier in the 1920s, and Schreier's use of coset graphs to study subgroups of free groups (the **Schreier coset graph**) is a direct topological construction that we will see in Section 2.4. The phrase "covering space" itself entered standard use with the textbook of Seifert and Threlfall (*Lehrbuch der Topologie*, 1934).

A key structural point of this chapter is the **Galois correspondence**: the lattice of subgroups of \( \pi_1(X) \) is in order-reversing bijection with the lattice of covering spaces of \( X \) (ordered by factoring through maps over \( X \)). This mirrors exactly the Galois correspondence in field theory, where intermediate fields correspond to subgroups of the Galois group. Indeed, van Kampen's theorem for a space assembled from pieces corresponds to the amalgamated-product structure of the Galois group for a composite field extension. This algebraic parallel runs throughout modern topology and motivates the more abstract treatment via groupoids and \( \infty \)-categories in current research.

## Section 2.1: Free Products and Amalgamated Products

Free products and amalgamated free products are the group-theoretic analogues of topological operations. The free product \( G * H \) corresponds to the wedge sum \( X \vee Y \) of spaces with \( \pi_1(X) = G \) and \( \pi_1(Y) = H \): van Kampen gives \( \pi_1(X \vee Y) \cong G * H \) when \( X \) and \( Y \) share only a basepoint. The amalgamated free product \( G *_A H \) corresponds to gluing \( X \) and \( Y \) along a common subspace \( Z \) with \( \pi_1(Z) = A \): van Kampen gives \( \pi_1(X \cup_Z Y) \cong G *_A H \).

The universal property of the free product states that the free product is the "most general" group generated by copies of \( G \) and \( H \) that do not interact. The amalgamation forces a specific subgroup of \( G \) to coincide with a specific subgroup of \( H \), reflecting the fact that paths in \( X \cap Y \) can be pushed into either \( X \) or \( Y \).

<div class="definition">
<strong>Definition (Free Product):</strong> Given groups \( G \) and \( H \), their <em>free product</em> \( G * H \) is the group whose elements are <em>reduced words</em> \( g_1 h_1 g_2 h_2 \cdots \) with \( g_i \in G \setminus \{e_G\} \) and \( h_j \in H \setminus \{e_H\} \) (no two consecutive letters from the same group, alternating), with multiplication by concatenation and reduction. The free product satisfies the <em>universal property</em>: homomorphisms \( G * H \to K \) correspond bijectively to pairs of homomorphisms \( G \to K \) and \( H \to K \).
</div>

<div class="definition">
<strong>Definition (Amalgamated Free Product):</strong> Given group homomorphisms \( i : A 	o G \) and \( j : A 	o H \), the <em>amalgamated free product</em> is:

\[
G *_A H = (G * H) ig/ \langle i(a) j(a)^{-1} : a \in A 
angle^{\mathrm{normal}}.
\]
It is the pushout in the category of groups along \( A 	o G \) and \( A 	o H \).
</div>

<div class="example">
<strong>Example (Free Product \( \mathbb{Z} * \mathbb{Z} \) and Reduced Words):</strong> Let \( G = \langle a 
angle \cong \mathbb{Z} \) and \( H = \langle b 
angle \cong \mathbb{Z} \). The free product \( \mathbb{Z} * \mathbb{Z} = \langle a, b 
angle = F_2 \) is the free group on two generators. Its elements are <em>reduced words</em> — finite alternating strings of powers of \( a \) and powers of \( b \) with no cancellation, for example:

\[
a^2 b^{-1} a b^3, \quad b^2 a^{-1} b^2 a, \quad a^{-3} b a^{-1} b^{-2} a.
\]
The word \( aba^{-1}b^2a \) is reduced (the letters alternate between \( a \)-powers and \( b \)-powers). The word \( ab^0a \) reduces to \( a^2 \) by removing the trivial \( b^0 = e_H \). Multiplication is concatenation followed by reduction: \( (a^2 b)(b^{-1} a^3) = a^2 (b \cdot b^{-1}) a^3 = a^5 \). This group is non-abelian: \( ab 
eq ba \) (the words \( ab \) and \( ba \) are both reduced and distinct). The free product \( G * H \) with no amalgamation over any nontrivial group is the "most non-commutative" way to combine \( G \) and \( H \).
</div>

<div class="remark">
<strong>Remark (Universal Property of Free Products):</strong> The free product \( G * H \) is characterised by its universal property: given any group \( K \) and homomorphisms \( \phi_G : G 	o K \) and \( \phi_H : H 	o K \), there is a unique homomorphism \( \Phi : G * H 	o K \) extending both. This is the group-theoretic analogue of the universal property of the wedge sum \( X ee Y \): a map from \( X ee Y \) is the same as a pair of maps from \( X \) and from \( Y \). Van Kampen's theorem (Section 2.2) exploits this universal property: when \( X = U \cup V \) with \( U \cap V \) contractible, the map \( \pi_1(U) * \pi_1(V) 	o \pi_1(X) \) is an isomorphism precisely because the universal property of \( \pi_1(X) \) matches that of the free product.

For the amalgamated product \( G *_A H \), the universal property reads: homomorphisms \( G *_A H 	o K \) correspond bijectively to pairs of homomorphisms \( \phi_G : G 	o K \) and \( \phi_H : H 	o K \) such that \( \phi_G \circ i = \phi_H \circ j \) (i.e., the two copies of \( A \) are sent to the same subgroup of \( K \)). Topologically, this says that a map from \( X \cup_Z Y \) is a pair of maps from \( X \) and \( Y \) that agree on the common subspace \( Z \).
</div>

## Section 2.2: The Seifert–van Kampen Theorem

Van Kampen's theorem is to the fundamental group what the Mayer–Vietoris sequence is to homology: it computes the algebraic invariant of a union in terms of the invariants of the pieces and their intersection. The two results are in fact related — the Mayer–Vietoris sequence for \( H_1 \) can be derived from van Kampen by abelianising. The key difference is that van Kampen works at the level of groups (before abelianisation) and gives the amalgamated free product, while Mayer–Vietoris gives a long exact sequence of abelian groups.

The hypotheses of van Kampen require both \( U \) and \( V \) to be path-connected, open, and their intersection \( U \cap V \) to be path-connected. These conditions ensure that loops in \( X \) can be subdivided into loops in \( U \) and \( V \), and that the subdivision points can be connected to the basepoint within \( U \cap V \). If \( U \cap V \) is not connected, the theorem generalises to give a "free product with multiple amalgamations" (a pushout over a disconnected group), but this case arises less often in practice.

<div class="theorem">
<strong>Theorem (Seifert–van Kampen):</strong> Let \( X = U \cup V \) where \( U, V \) are open and path-connected, and \( U \cap V \) is path-connected and non-empty. Fix a basepoint \( x_0 \in U \cap V \). Let \( i_U : U \cap V \hookrightarrow U \), \( i_V : U \cap V \hookrightarrow V \) be the inclusions. Then the map:

\[
\Phi : \pi_1(U, x_0) *_{\pi_1(U \cap V, x_0)} \pi_1(V, x_0) \to \pi_1(X, x_0)
\]
induced by the inclusions \( U \hookrightarrow X \) and \( V \hookrightarrow X \) is an isomorphism.
</div>

<div class="remark">
<strong>Remark (Van Kampen for Multiple Sets):</strong> There is a more general version of van Kampen: if \( X = \bigcup_\alpha U_\alpha \) with each \( U_\alpha \) open and path-connected, all pairwise intersections \( U_\alpha \cap U_\beta \) path-connected, all triple intersections \( U_\alpha \cap U_\beta \cap U_\gamma \) path-connected, and a common basepoint \( x_0 \) in all \( U_\alpha \), then \( \pi_1(X) \) is the pushout of the diagram of groups \( \pi_1(U_\alpha) \) over \( \pi_1(U_\alpha \cap U_\beta) \). This generalisation is used, for instance, to compute \( \pi_1 \) of a space built from many pieces, and is the topological input to Bass–Serre theory (the theory of groups acting on trees).
</div>

<div class="proof">
<em>Proof.</em> Denote the amalgamated product \( G = \pi_1(U) *_{\pi_1(U \cap V)} \pi_1(V) \) and let \( \Phi : G \to \pi_1(X) \) be the map induced by inclusions.

<strong>Surjectivity.</strong> Let \( \gamma : [0,1] \to X \) be a loop based at \( x_0 \). Since \( U \) and \( V \) are open and cover \( X \), by compactness of \( [0,1] \), there exists a subdivision \( 0 = t_0 < t_1 < \cdots < t_k = 1 \) such that each restriction \( \gamma|_{[t_{i-1},t_i]} \) maps entirely into \( U \) or entirely into \( V \). Since \( U \cap V \) is path-connected and each \( \gamma(t_i) \in U \cap V \) (adjusting the subdivision if necessary to land at points in \( U \cap V \)), choose paths \( \alpha_i \) in \( U \cap V \) from \( x_0 \) to \( \gamma(t_i) \). Then:

\[
[\gamma] = [\alpha_0 \cdot \gamma|_{[t_0,t_1]} \cdot \bar\alpha_1] \cdot [\alpha_1 \cdot \gamma|_{[t_1,t_2]} \cdot \bar\alpha_2] \cdots
\]
Each factor is a loop in \( U \) or \( V \), hence lies in the image of \( \Phi \).

<strong>Injectivity.</strong> Suppose \( w = [u_1][v_1]\cdots[u_m][v_m] \in G \) (with \( u_i \in \pi_1(U) \), \( v_i \in \pi_1(V) \)) satisfies \( \Phi(w) = 1 \) in \( \pi_1(X) \). Then the corresponding concatenated loop \( \gamma \) is null-homotopic in \( X \): there is a homotopy \( H : [0,1]^2 \to X \) from \( \gamma \) to the constant loop. Subdivide \( [0,1]^2 \) into a fine enough grid so each square maps into \( U \) or \( V \). By an inductive procedure — adjusting the edges of the grid that pass through \( U \cap V \) using paths in \( U \cap V \) — one shows that the null-homotopy \( H \) can be decomposed into a sequence of homotopies each taking place entirely in \( U \) or entirely in \( V \). Each such homotopy is an instance of a relation in the amalgamated product, either a relation within \( \pi_1(U) \), within \( \pi_1(V) \), or the amalgamation relation \( [(i_U)_*(c)] = [(i_V)_*(c)] \) for \( c \in \pi_1(U \cap V) \). Hence \( w = 1 \) in \( G \). \( \square \)
</div>

<div class="example">
<strong>Example (\( \pi_1(S^1 \vee S^1) = F_2 \)):</strong> Write \( S^1 \vee S^1 \) as \( U \cup V \) where \( U \) is \( S^1 \vee S^1 \) minus a short open arc on the second circle, \( V \) is \( S^1 \vee S^1 \) minus a short open arc on the first circle, and \( U \cap V \simeq \{*\} \) is contractible. Then \( U \simeq S^1 \), \( V \simeq S^1 \), and van Kampen gives:

\[
\pi_1(S^1 \vee S^1) \cong \pi_1(U) *_{\pi_1(U \cap V)} \pi_1(V) \cong \mathbb{Z} *_{\{1\}} \mathbb{Z} = \mathbb{Z} * \mathbb{Z} = F_2 = \langle a, b \rangle.
\]
</div>

<div class="example">
<strong>Example (Genus-\( g \) Surface):</strong> Decompose \( \Sigma_g \) as \( U = \Sigma_g \setminus \{p\} \simeq \bigvee^{2g} S^1 \) (the complement of a point deformation retracts onto the 1-skeleton) and \( V = D^2 \) (small open disk around \( p \)), with \( U \cap V \simeq S^1 \). The attaching map of the single 2-cell sends the generator of \( \pi_1(U \cap V) \cong \mathbb{Z} \) to the commutator word \( c = \prod_{i=1}^g [a_i, b_i] \in \pi_1(U) \cong F_{2g} \). Van Kampen gives:

\[
\pi_1(\Sigma_g) \cong F_{2g} *_{\mathbb{Z}} \{1\} \cong \langle a_1, b_1, \ldots, a_g, b_g \mid \prod_{i=1}^g a_i b_i a_i^{-1} b_i^{-1} = 1 \rangle.
\]
</div>

<div class="example">
<strong>Example (Klein Bottle):</strong> The Klein bottle \( K \) has a CW structure with one 0-cell, two 1-cells \( a, b \), and one 2-cell attached via the word \( abab^{-1} \). The same van Kampen argument as above gives:

\[
\pi_1(K) \cong \langle a, b \mid abab^{-1} = 1 \rangle.
\]
From the relation \( aba = b \), i.e., \( aba^{-1} = b^{-1} \), we see that \( a \) acts on \( b \) by inversion. Thus \( a \) has infinite order and \( b \) has infinite order, but \( a \) and \( b \) do not commute (since \( ab = ba \) would give \( b^{-1} = b \), forcing \( b^2 = 1 \), but one can check \( b \) has infinite order). The subgroup \( \langle a^2, b \rangle \cong \mathbb{Z}^2 \) is a normal subgroup of index 2. Contrast this with \( \pi_1(T^2) = \langle a,b \mid aba^{-1}b^{-1} \rangle \cong \mathbb{Z}^2 \); the Klein bottle and the torus are distinguished by their fundamental groups.
</div>

<div class="example">
<strong>Example (\( \pi_1(\mathbb{RP}^2) \cong \mathbb{Z}/2 \)):</strong> \( \mathbb{RP}^2 \) has a CW structure with one 0-cell, one 1-cell \( a \), and one 2-cell attached by the word \( a^2 \) (the boundary of the 2-cell traverses \( a \) twice, once in each direction). Van Kampen gives \( \pi_1(\mathbb{RP}^2) \cong \langle a \mid a^2 = 1 \rangle \cong \mathbb{Z}/2 \). This can also be seen via the double cover \( S^2 \to \mathbb{RP}^2 \): the deck group is \( \mathbb{Z}/2 \), so by the theory of covering spaces \( \pi_1(\mathbb{RP}^2) \cong \mathbb{Z}/2 \).
</div>

## Section 2.3: Covering Spaces

The theory of covering spaces is one of the jewels of algebraic topology, establishing a perfect dictionary between topology and group theory. Every connected covering space of a "nice" space \( X \) corresponds to a subgroup of \( \pi_1(X) \), and the geometric properties of the cover are reflected in the algebraic properties of the subgroup: the number of sheets equals the index, the cover is Galois (normal) iff the subgroup is normal, and the deck transformation group equals the quotient group \( N(H)/H \) where \( N(H) \) is the normaliser.

This dictionary has both theoretical and computational uses. Theoretically, it reduces questions about the topology of covering spaces to pure group theory — for instance, the question "does \( X \) have a connected double cover?" becomes "does \( \pi_1(X) \) have a subgroup of index 2?", which is equivalent to "does \( \pi_1(X) \) have a surjective homomorphism to \( \mathbb{Z}/2 \)?", which is equivalent to "is \( \pi_1(X)^{\mathrm{ab}} \) divisible by 2?". Computationally, covering spaces provide explicit models for subgroups of free groups (via graphs), which is the basis for the Nielsen–Schreier theorem.

<div class="definition">
<strong>Definition (Covering Map):</strong> A continuous surjection \( p : \tilde X \to X \) is a <em>covering map</em> if every point \( x \in X \) has an open neighbourhood \( U \) such that \( p^{-1}(U) \) is a disjoint union of open sets \( \bigsqcup_\alpha V_\alpha \subset \tilde X \), each mapped homeomorphically by \( p \) onto \( U \). Such a \( U \) is called <em>evenly covered</em>. The space \( \tilde X \) is a <em>covering space</em> of \( X \), and the cardinality of a fibre \( p^{-1}(x) \) (which is the same for all \( x \) when \( X \) is connected) is the <em>number of sheets</em>.
</div>

<div class="theorem">
<strong>Theorem (Unique Path Lifting):</strong> Let \( p : \tilde X \to X \) be a covering map. For every path \( \gamma \) in \( X \) and every \( \tilde x_0 \in p^{-1}(\gamma(0)) \), there is a unique lift \( \tilde\gamma \) of \( \gamma \) with \( \tilde\gamma(0) = \tilde x_0 \).
</div>

<div class="proof">
<em>Proof.</em> Cover \( [0,1] \) by intervals \( I_j \) such that each \( \gamma(I_j) \) is contained in an evenly covered open set \( U_j \subset X \). By Lebesgue's number lemma, such a covering exists. Let \( p^{-1}(U_j) = \bigsqcup_\alpha V^j_\alpha \) with each \( V^j_\alpha \xrightarrow{p} U_j \) a homeomorphism. On the first interval \( I_1 \), the lift starts at \( \tilde x_0 \in V^1_\alpha \) for the unique sheet \( V^1_\alpha \) containing \( \tilde x_0 \), and is defined by \( \tilde\gamma|_{I_1} = (p|_{V^1_\alpha})^{-1} \circ \gamma|_{I_1} \). This uniquely determines \( \tilde\gamma|_{I_1} \). Proceeding inductively: the endpoint of the lift on \( I_j \) lies in a unique sheet of \( p^{-1}(U_{j+1}) \), determining the lift on \( I_{j+1} \). Concatenating these local lifts gives the unique global lift. \( \square \)
</div>

<div class="theorem">
<strong>Theorem (Lifting Criterion):</strong> Let \( p : (\tilde X, \tilde x_0) \to (X, x_0) \) be a covering map, and let \( f : (Y, y_0) \to (X, x_0) \) be a continuous map with \( Y \) path-connected and locally path-connected. Then a lift \( \tilde f : (Y, y_0) \to (\tilde X, \tilde x_0) \) exists if and only if:

\[
f_*(\pi_1(Y, y_0)) \subseteq p_*(\pi_1(\tilde X, \tilde x_0)).
\]
When it exists, the lift is unique.
</div>

<div class="theorem">
<strong>Theorem (Classification of Covering Spaces):</strong> Let \( X \) be path-connected, locally path-connected, and semi-locally simply connected, with basepoint \( x_0 \). There is a bijection between:
<ul>
<li>Isomorphism classes (over \( X \)) of path-connected covering spaces of \( X \), and</li>
<li>Conjugacy classes of subgroups of \( \pi_1(X, x_0) \).</li>
</ul>
Normal subgroups correspond to <em>regular</em> (or <em>Galois</em>) covers. The trivial subgroup corresponds to the <em>universal cover</em> \( \tilde X \), which is simply connected.
</div>

<div class="example">
<strong>Example (Covering Spaces of \( S^1 \)):</strong> Since \( \pi_1(S^1) \cong \mathbb{Z} \), the subgroups of \( \mathbb{Z} \) are precisely \( n\mathbb{Z} = \{0, \pm n, \pm 2n, \ldots\} \) for \( n \geq 0 \) (with \( n=0 \) giving the trivial subgroup \( \{0\} \) and \( n=1 \) giving all of \( \mathbb{Z} \)). All subgroups are normal since \( \mathbb{Z} \) is abelian. The classification gives:
<ul>
<li>\( n\mathbb{Z} \) (\( n \geq 2 \)): the \( n \)-sheeted covering \( p_n : S^1 \to S^1 \), \( p_n(z) = z^n \). The deck group is \( \mathbb{Z}/n\mathbb{Z} \), acting by multiplication by \( e^{2\pi i/n} \).</li>
<li>\( \{0\} \): the universal cover \( \mathbb{R} \to S^1 \) (infinite-sheeted). The deck group is \( \mathbb{Z} \).</li>
<li>\( \mathbb{Z} \) itself: the trivial covering \( S^1 \to S^1 \) by the identity (1-sheeted).</li>
</ul>
There are no other covering spaces of \( S^1 \) (up to isomorphism).
</div>

<div class="example">
<strong>Example (Covering Spaces of \( \mathbb{RP}^2 \)):</strong> Since \( \pi_1(\mathbb{RP}^2) \cong \mathbb{Z}/2 \), there are exactly two subgroups: \( \mathbb{Z}/2 \) itself (the trivial cover, 1-sheeted) and \( \{0\} \) (the universal cover, 2-sheeted). The universal cover of \( \mathbb{RP}^2 \) is \( S^2 \), with the covering map being the antipodal quotient \( S^2 \to \mathbb{RP}^2 \). The deck group is \( \{1, A\} \cong \mathbb{Z}/2 \) where \( A \) is the antipodal map.
</div>

<div class="definition">
<strong>Definition (Deck Transformation):</strong> A <em>deck transformation</em> (or <em>covering transformation</em>) of a covering \( p : \tilde X \to X \) is a homeomorphism \( \phi : \tilde X \to \tilde X \) with \( p \circ \phi = p \). The deck transformations form a group \( \mathrm{Deck}(\tilde X / X) \) under composition. For the regular cover corresponding to a normal subgroup \( N \trianglelefteq \pi_1(X) \), the deck group is isomorphic to \( \pi_1(X)/N \).
</div>

<div class="example">
<strong>Example (Universal Cover of \( S^1 \)):</strong> The covering \( p : \mathbb{R} \to S^1 \), \( p(t) = e^{2\pi it} \), is the universal cover since \( \mathbb{R} \) is contractible, hence simply connected. The deck group is \( \mathrm{Deck}(\mathbb{R}/S^1) \cong \pi_1(S^1)/\{1\} \cong \mathbb{Z} \), with generator \( \phi : t \mapsto t+1 \). Every sheet is a translate of \( [0,1) \) by an integer.
</div>

<div class="example">
<strong>Example (Universal Cover of \( S^1 \vee S^1 \)):</strong> The universal cover of \( S^1 \vee S^1 \) is the infinite 4-valent tree — the Cayley graph of \( F_2 = \langle a,b \rangle \) with respect to the generators \( \{a, b, a^{-1}, b^{-1}\} \). Each vertex has four edges labelled by \( a, a^{-1}, b, b^{-1} \). The deck group is \( F_2 \) acting on the tree by left multiplication. Every connected covering of \( S^1 \vee S^1 \) can be described as a labelled directed graph (the <em>Schreier coset graph</em>): vertices are cosets of \( H \leq F_2 \), and edges are right multiplication by \( a \) and \( b \).
</div>

## Section 2.4: Subgroups of Free Groups

<div class="theorem">
<strong>Theorem (Nielsen–Schreier):</strong> Every subgroup of a free group is free. If \( H \) is a subgroup of index \( n \) in \( F_k \), then \( H \cong F_{n(k-1)+1} \).
</div>

<div class="example">
<strong>Example (\( F_3 \leq F_2 \) via Double Cover):</strong> The free group \( F_3 \) embeds as an index-2 subgroup of \( F_2 = \langle a, b \rangle \). Consider the homomorphism \( \phi : F_2 \to \mathbb{Z}/2 \) defined by \( \phi(a) = 1 \) and \( \phi(b) = 0 \). The kernel \( H = \ker\phi \) has index 2 in \( F_2 \). By Nielsen–Schreier, \( H \cong F_{2(2-1)+1} = F_3 \). Concretely, the Schreier coset graph has two vertices \( v_0, v_1 \) (cosets \( H, aH \)), with the \( a \)-edge going \( v_0 \to v_1 \to v_0 \) and the \( b \)-edges forming loops at each vertex. This graph has 2 vertices, 4 edges, \( \chi = -2 \), so \( \pi_1 \cong F_3 \). The three generators are:

\[
\text{(1) } a^2 \text{ (loop via } a\text{-edges)}, \quad \text{(2) } b \text{ (loop at } v_0 \text{)}, \quad \text{(3) } aba^{-1} \text{ (}b\text{-loop at } v_1\text{, conjugated)}.
\]
One can verify these generate no relations: the Schreier process gives these three elements as a free basis for \( H \), and a reduced word in \( \{a^2, b, aba^{-1}\} \) and their inverses projects to a reduced word in \( F_2 \), hence is nontrivial.
</div>

<div class="theorem">
<strong>Theorem (Nielsen–Schreier, Proof Sketch):</strong> Every subgroup of a free group is free. More precisely, if \( H \leq F_k \) has finite index \( n = [F_k : H] \), then \( H \) is a free group of rank \( 1 + n(k-1) \).
</div>

<div class="proof">
<em>Proof sketch.</em> Realise \( F_k = \pi_1(igvee^k S^1) \) as the fundamental group of a wedge of \( k \) circles. The subgroup \( H \leq F_k \) corresponds (by covering space theory) to a connected covering space \( p : 	ilde X 	o igvee^k S^1 \). Since \( igvee^k S^1 \) is a graph (a 1-dimensional CW complex), its covering space \( 	ilde X \) is also a graph. Every connected graph \( 	ilde X \) has fundamental group \( \pi_1(	ilde X) \cong F_m \) for some \( m \) (a free group, since graphs deformation retract onto wedges of circles). Thus \( H \cong \pi_1(	ilde X) \) is free.

To compute the rank: the graph \( 	ilde X \) has \( n \) vertices (one per coset of \( H \) in \( F_k \), i.e., one per sheet of the cover) and \( nk \) edges (each of the \( k \) edge-types in the base lifts to \( n \) edges). By the formula for graphs, \( \pi_1(	ilde X) \cong F_{E - V + 1} = F_{nk - n + 1} = F_{1 + n(k-1)} \). \( \square \)
</div>

<div class="remark">
<strong>Remark (Rank Formula and Index):</strong> The formula \( \mathrm{rank}(H) = 1 + [F_k : H](\mathrm{rank}(F_k) - 1) \) is called the <em>Schreier index formula</em>. It has the following special cases:
<ul>
<li>An index-\( n \) subgroup of \( F_2 \) has rank \( 1 + n \). So index-2 subgroups of \( F_2 \) are free of rank 3, index-3 subgroups have rank 4, etc.</li>
<li>A subgroup of index \( n \) in \( \mathbb{Z} = F_1 \) has rank \( 1 + n \cdot 0 = 1 \), so it is \( \cong \mathbb{Z} \) — consistent with the fact that subgroups of \( \mathbb{Z} \) are cyclic.</li>
<li>The formula diverges as \( n 	o \infty \): an infinite-index subgroup can have infinite rank (or finite rank, depending on the subgroup).</li>
</ul>
</div>

<div class="example">
<strong>Example (Commutator Subgroup of \( F_2 \) is Free of Infinite Rank):</strong> Let \( F_2 = \langle a, b 
angle \) and let \( [F_2, F_2] \) be its commutator subgroup (generated by all elements \( [g,h] = ghg^{-1}h^{-1} \)). The abelianisation \( F_2 / [F_2, F_2] \cong \mathbb{Z}^2 \), which is infinite, so \( [F_2, F_2] \) has infinite index in \( F_2 \). By Nielsen–Schreier, \( [F_2, F_2] \) is free. One can show it is free of countably infinite rank, with a free basis given by the elements \( \{a^m b^n a^{-m} b^{-n}\}_{(m,n) 
eq (0,0)} \) (suitably chosen to avoid redundancy). The Schreier coset graph for the commutator subgroup is the Cayley graph of \( \mathbb{Z}^2 \) with respect to the generators \( \{a,b,a^{-1},b^{-1}\} \): an infinite grid. This grid has infinitely many independent cycles (one for each square), confirming the infinite rank.
</div>

<div class="remark">
<strong>Remark (Knot Groups):</strong> The complement of a knot \( K \subset S^3 \) has a finitely presented fundamental group called the <em>knot group</em>. The Wirtinger presentation expresses it with one generator per arc in a knot diagram and one relation per crossing. For the trefoil knot, one obtains \( \pi_1(S^3 \setminus K) \cong \langle a, b \mid a^2 = b^3 \rangle \). This group is non-abelian, which shows the trefoil is non-trivially knotted. The abelianisation of any knot group is \( \mathbb{Z} \) (generated by a meridian), so knot groups are distinguished by their higher commutator quotients and the structure of their covering spaces. This connection between covering spaces, fundamental groups, and knot theory is one of the principal themes of 3-dimensional topology.
</div>

<div class="example">
<strong>Example (Wirtinger Presentation of the Trefoil):</strong> The trefoil knot has a diagram with three crossings and three arcs \( a, b, c \). At each crossing, the Wirtinger relation says the overarc conjugates one underarc to the other. For the trefoil, the three crossings give three relations:

\[
r_1 : a = cbc^{-1}, \quad r_2 : b = aca^{-1}, \quad r_3 : c = bab^{-1}.
\]
One of these is a consequence of the other two (a general fact about Wirtinger presentations). Eliminating \( c = ab^{-1}a^{-1}b \cdot \ldots \) and simplifying, one arrives at \( \pi_1(S^3 \setminus K) = \langle a, b \mid a^2 = b^3 \rangle \). The element \( a^2 = b^3 \) is central in this group (it lies in the centre), and the group is isomorphic to the fundamental group of the Seifert-fibred space \( M(2,3) \). This connects knot theory to 3-manifold topology via fibrations, a theme explored in PMATH 665.
</div>

<div class="remark">
<strong>Remark (Chapter 2 Summary and Preview of Chapter 3):</strong> Chapter 2 has established the two main computational tools for \( \pi_1 \): van Kampen's theorem (composition of spaces) and covering space theory (subgroups and deck transformations). Both tools are fundamentally 1-dimensional: they probe the "1-skeleton" of a space. In Chapter 3, we extend our reach to all dimensions using homology. The key new ingredient is the chain complex: instead of keeping track of loops, we keep track of all chains of every dimension, connected by boundary maps. The boundary operator \( \partial \) satisfies \( \partial^2 = 0 \), an algebraic shadow of the topological fact that "the boundary of a boundary is empty." Homology groups \( H_n \) will detect holes in every dimension, generalising \( \pi_1 \) while being far more computable (since all homology groups are abelian).
</div>

---

# Chapter 3: Homology — Simplicial and Cellular

The fundamental group detects one-dimensional holes in a space, but higher-dimensional holes require new invariants. A 2-sphere has no 1-dimensional hole — every loop is contractible — yet it is far from contractible; the "2-dimensional hole" enclosed by the sphere is invisible to \( \pi_1 \). **Homology groups** solve this problem: \( H_n(X) \) detects \( n \)-dimensional holes by measuring \( n \)-cycles (closed \( n \)-chains) modulo those which are boundaries of \( (n+1) \)-chains. The algebraic structure (\( \partial^2 = 0 \)) ensures this quotient is a well-defined abelian group.

The history of homology is intertwined with the history of modern algebra. Poincaré defined Betti numbers informally in 1895 as the "number of independent \( k \)-cycles," but the definition was imprecise. Emmy Noether's insight (communicated at a Göttingen seminar in 1925) was that Betti numbers and torsion coefficients should be unified as the rank and torsion of a single abelian group, the **homology group**. This point of view made the tools of abstract algebra directly applicable, and within a decade Vietoris, Čech, and Eilenberg had extended Noether's groups to very general settings.

There are three main approaches to defining homology groups, all yielding the same answer for spaces with enough structure. **Simplicial homology** uses a triangulation of \( X \) into simplices; it is easiest to compute by hand. **Cellular homology** uses a CW structure, requiring only one generator per cell rather than per simplex; it is the most efficient for CW complexes. **Singular homology** (Chapter 4) uses all continuous maps \( \Delta^n 	o X \) without any decomposition requirement; it is the most general and most theoretically powerful. This chapter focuses on the first two, which share the same algebraic blueprint: a chain complex built from formal linear combinations of cells, with boundary maps computed by the alternating-sign face formula.

The key algebraic fact underlying all of homology is the identity \( \partial^2 = 0 \), and understanding why this holds geometrically — "the boundary of a boundary is empty" — is the conceptual core of the subject. The sign convention \( (-1)^i \) in the boundary formula is not arbitrary: it is precisely what makes adjacent face maps cancel in pairs when composed. The resulting quotient \( \ker \partial_n / \mathrm{im}\, \partial_{n+1} \) measures precisely the cycles that do not bound — the "holes" of dimension \( n \). Chapter 3 provides the computational toolkit; Chapter 4 provides the theoretical justification.

## Section 3.1: Delta-Complexes and Simplicial Homology

The simplicial chain complex is the most concrete approach to homology, making the groups directly computable for spaces with a triangulation. The key algebraic insight — that \( \partial^2 = 0 \) — can be seen geometrically: the boundary of a triangle consists of three edges, and the boundary of each edge consists of its two endpoints; going around the triangle, each endpoint appears exactly twice, once as the start of an edge and once as the end of an edge, so all contributions cancel. The sign convention \( (-1)^i \) ensures this cancellation works for simplices of all dimensions.

The \( \Delta \)-complex generalises the classical notion of a simplicial complex: in a simplicial complex, different simplices can share at most a face, and the gluing must be linear. In a \( \Delta \)-complex, simplices can be identified in more flexible ways (for instance, both endpoints of a 1-simplex can be identified with the same 0-simplex, giving a circle). This extra flexibility makes \( \Delta \)-complexes more convenient for representing familiar spaces with a small number of cells.

<div class="definition">
<strong>Definition (Standard \( n \)-Simplex):</strong> The <em>standard \( n \)-simplex</em> is:

\[
\Delta^n = \{(t_0, \ldots, t_n) \in \mathbb{R}^{n+1} : t_i \geq 0,\ \sum_{i=0}^n t_i = 1\}.
\]
Its vertices are the standard basis vectors \( e_0, \ldots, e_n \). The <em>faces</em> are the sub-simplices obtained by setting one or more coordinates to zero. The \( i \)-th <em>face map</em> \( \delta_i : \Delta^{n-1} \to \Delta^n \) inserts 0 in the \( i \)-th position: \( \delta_i(t_0,\ldots,t_{n-1}) = (t_0,\ldots,t_{i-1},0,t_i,\ldots,t_{n-1}) \).
</div>

<div class="definition">
<strong>Definition (\( \Delta \)-Complex):</strong> A <em>\( \Delta \)-complex</em> is a topological space \( X \) together with a collection of maps \( \sigma_\alpha : \Delta^n \to X \) (the <em>\( n \)-simplices</em>) such that: (i) the restriction of \( \sigma_\alpha \) to the interior of \( \Delta^n \) is injective; (ii) the restriction of \( \sigma_\alpha \) to any face of \( \Delta^n \) is another simplex \( \sigma_\beta \); (iii) \( X \) has the weak topology with respect to these maps.
</div>

<div class="definition">
<strong>Definition (Chain Groups and Boundary Operator):</strong> For a \( \Delta \)-complex \( X \), the <em>\( n \)-th chain group</em> \( C_n(X) \) is the free abelian group generated by the \( n \)-simplices of \( X \). The <em>boundary operator</em> \( \partial_n : C_n(X) \to C_{n-1}(X) \) is defined on generators by:

\[
\partial_n(\sigma_\alpha) = \sum_{i=0}^n (-1)^i \sigma_\alpha \circ \delta_i,
\]
where \( [v_0,\ldots,\hat v_i,\ldots,v_n] \) denotes the face opposite to the \( i \)-th vertex (the \( i \)-th face of \( \sigma_\alpha \)).
</div>

<div class="theorem">
<strong>Theorem (\( \partial^2 = 0 \)):</strong> For any \( \Delta \)-complex, \( \partial_{n-1} \circ \partial_n = 0 \).
</div>

<div class="remark">
<strong>Remark (Geometric Intuition for \( \partial^2 = 0 \)):</strong> The identity \( \partial^2 = 0 \) has a beautiful geometric interpretation: "the boundary of a boundary is empty." Consider a triangle (2-simplex) \( \sigma \) with vertices \( v_0, v_1, v_2 \). Its boundary \( \partial_2 \sigma = [v_1,v_2] - [v_0,v_2] + [v_0,v_1] \) is the alternating sum of the three edges. The boundary of each edge is its two endpoints with signs: \( \partial_1[v_i,v_j] = v_j - v_i \). Then:

\[
\partial_1(\partial_2 \sigma) = (v_2 - v_1) - (v_2 - v_0) + (v_1 - v_0) = v_2 - v_1 - v_2 + v_0 + v_1 - v_0 = 0.
\]
Each vertex appears twice with opposite signs, so all terms cancel. The algebraic proof for general \( n \) is an extension of this cancellation argument.
</div>

<div class="proof">
<em>Proof.</em> It suffices to check on a single generator \( \sigma \):

\[
\partial_{n-1}(\partial_n \sigma) = \partial_{n-1}\!\left(\sum_{i=0}^n (-1)^i \sigma \circ \delta_i\right) = \sum_{i=0}^n (-1)^i \sum_{j=0}^{n-1} (-1)^j \sigma \circ \delta_i \circ \delta_j.
\]
The face \( \sigma \circ \delta_i \circ \delta_j \) is the face of \( \sigma \) with both the \( i \)-th and \( j \)-th vertices of \( \Delta^n \) omitted. If \( j < i \), then the face map \( \delta_i \circ \delta_j \) inserts 0 first at position \( j \), then at position \( i \); but after inserting 0 at position \( j < i \), the indices shift, so the face equals \( \delta_{j} \circ \delta_{i-1} \) applied to \( \sigma \). Thus each face with two omitted vertices \( j < i \) appears with sign \( (-1)^{i+j} \) (from \( i,j \)) and \( (-1)^{j+(i-1)} = (-1)^{i+j-1} \) (from \( j, i-1 \) in the other order). These two signs sum to \( (-1)^{i+j}(1 - 1) = 0 \), so all terms cancel and \( \partial^2 = 0 \). \( \square \)
</div>

<div class="definition">
<strong>Definition (Homology Groups):</strong> Given the chain complex \( \cdots \xrightarrow{\partial_{n+1}} C_n \xrightarrow{\partial_n} C_{n-1} \xrightarrow{\partial_{n-1}} \cdots \), the <em>\( n \)-th homology group</em> is:

\[
H_n(X) = \ker \partial_n \big/ \mathrm{im}\, \partial_{n+1}.
\]
Elements of \( \ker \partial_n \) are <em>\( n \)-cycles</em>; elements of \( \mathrm{im}\, \partial_{n+1} \) are <em>\( n \)-boundaries</em>. The <em>reduced homology groups</em> \( \tilde H_n(X) \) are defined using the augmented chain complex \( \cdots \to C_0 \xrightarrow{\varepsilon} \mathbb{Z} \to 0 \), where \( \varepsilon(\sum n_i \sigma_i) = \sum n_i \). Then \( \tilde H_n(X) = H_n(X) \) for \( n \geq 1 \), and for a connected space \( \tilde H_0(X) = 0 \) while \( H_0(X) \cong \mathbb{Z} \).
</div>

<div class="remark">
<strong>Remark (Homology as a Functor):</strong> Just as \( \pi_1 \) is a functor from based spaces to groups, homology is a functor from topological spaces (no basepoint needed) to abelian groups. A continuous map \( f : X \to Y \) induces a homomorphism \( f_* : H_n(X) \to H_n(Y) \) by \( f_*(\sigma) = f \circ \sigma \) on singular simplices. This satisfies \( (g \circ f)_* = g_* \circ f_* \) and \( (\mathrm{id})_* = \mathrm{id} \). The naturality of the long exact sequence means that a map of pairs \( f : (X,A) \to (Y,B) \) induces a chain map between the long exact sequences of the two pairs, with all squares commuting. This naturality is used constantly in computations.
</div>

<div class="remark">
<strong>Remark (Interpretation of \( H_0 \)):</strong> The zeroth homology group \( H_0(X) \) counts the path-connected components of \( X \): \( H_0(X) \cong \mathbb{Z}^k \) where \( k \) is the number of path-connected components. This is because a 0-cycle is just a formal integer combination of points, and a 0-boundary is a combination that arises as the boundary of a 1-chain (a path). Two points are homologous iff they are connected by a path, which holds iff they lie in the same path-connected component.
</div>

## Section 3.2: Explicit Computations

<div class="example">
<strong>Example (Circle \( S^1 \), minimal structure):</strong> Give \( S^1 \) the \( \Delta \)-complex structure with one 0-simplex \( v \) and one 1-simplex \( e \) (with both endpoints identified to \( v \)). Then \( C_0 = \mathbb{Z}\langle v \rangle \) and \( C_1 = \mathbb{Z}\langle e \rangle \). The boundary map is \( \partial_1(e) = v - v = 0 \). So:

\[
H_0(S^1) = \ker \partial_0 / \mathrm{im}\, \partial_1 = \mathbb{Z}/0 = \mathbb{Z},
\]

\[
H_1(S^1) = \ker \partial_1 / \mathrm{im}\, \partial_2 = \mathbb{Z}/0 = \mathbb{Z},
\]

\[
H_n(S^1) = 0 \text{ for } n \geq 2.
\]
</div>

<div class="example">
<strong>Example (Circle \( S^1 \), two vertices):</strong> Alternatively, give \( S^1 \) the structure with 0-simplices \( v_0, v_1 \) and 1-simplices \( a : v_0 \to v_1 \) and \( b : v_1 \to v_0 \). Then \( C_0 = \mathbb{Z}^2 \), \( C_1 = \mathbb{Z}^2 \), and \( \partial_1(a) = v_1 - v_0 \), \( \partial_1(b) = v_0 - v_1 \). The kernel of \( \partial_1 \) consists of pairs \( (m,n) \in \mathbb{Z}^2 \) with \( m(v_1-v_0) + n(v_0-v_1) = (m-n)(v_1-v_0) = 0 \), i.e., \( m = n \). So \( \ker \partial_1 = \mathbb{Z}(a+b) \cong \mathbb{Z} \). The image of \( \partial_1 \) is \( \mathbb{Z}(v_1-v_0) \), so \( H_0 = \mathbb{Z}^2/\mathbb{Z}(v_1-v_0) \cong \mathbb{Z} \). We get \( H_1(S^1) \cong \mathbb{Z} \), confirming independence of the triangulation.
</div>

<div class="example">
<strong>Example (Torus \( T^2 \)):</strong> The torus has one 0-cell \( v \), two 1-cells \( a, b \), and one 2-cell \( U \). The boundary word is \( aba^{-1}b^{-1} \), so \( \partial_2(U) = a + b + (-a) + (-b) = 0 \). The boundary map \( \partial_1(a) = v - v = 0 = \partial_1(b) \). Thus all boundary maps are zero, giving:

\[
H_0(T^2) \cong \mathbb{Z}, \quad H_1(T^2) \cong \mathbb{Z}^2, \quad H_2(T^2) \cong \mathbb{Z}, \quad H_n(T^2) = 0 \text{ for } n \geq 3.
\]
This matches: the torus has one connected component (\( H_0 \cong \mathbb{Z} \)), two independent loops \( a, b \) (\( H_1 \cong \mathbb{Z}^2 \)), and one "fundamental class" \( [U] \) (\( H_2 \cong \mathbb{Z} \)).
</div>

<div class="example">
<strong>Example (Klein Bottle \( K \)):</strong> The Klein bottle has a CW structure with one 0-cell \( v \), two 1-cells \( a, b \), and one 2-cell attached by the word \( abab^{-1} \). The boundary map \( \partial_2(U) = a + b + a + (-b) = 2a \) (since the boundary word \( abab^{-1} \) contributes \( a \) twice and \( b \) once positively and once negatively). Wait, let us compute carefully: the boundary of the 2-cell traverses \( a, b, a, b^{-1} \), so \( \partial_2(U) = a + b + a - b = 2a \). Then:
<ul>
<li>\( C_0 = \mathbb{Z} \), \( C_1 = \mathbb{Z}^2 \), \( C_2 = \mathbb{Z} \).</li>
<li>\( \partial_2(U) = 2a \), so \( \mathrm{im}(\partial_2) = 2\mathbb{Z} \cdot a \subseteq C_1 \).</li>
<li>\( \partial_1(a) = v - v = 0 \) and \( \partial_1(b) = v - v = 0 \), so \( \ker(\partial_1) = C_1 = \mathbb{Z}^2 \).</li>
<li>\( H_1(K) = \ker(\partial_1)/\mathrm{im}(\partial_2) = \mathbb{Z}^2 / \langle 2a \rangle \cong \mathbb{Z} \oplus \mathbb{Z}/2 \).</li>
<li>\( H_2(K) = \ker(\partial_2) = 0 \) (since \( \partial_2(U) = 2a \neq 0 \)).</li>
<li>\( H_0(K) = \mathbb{Z} \) (connected).</li>
</ul>
Thus \( H_*(K) : \mathbb{Z}, \mathbb{Z} \oplus \mathbb{Z}/2, 0, 0, \ldots \). The \( \mathbb{Z}/2 \) torsion detects the non-orientability of the Klein bottle.
</div>

<div class="example">
<strong>Example (Genus-\( g \) Surface \( \Sigma_g \)):</strong> For the orientable surface of genus \( g \), the CW structure has one 0-cell, \( 2g \) 1-cells \( a_1,b_1,\ldots,a_g,b_g \), and one 2-cell attached by \( \prod [a_i,b_i] \). The boundary of the 2-cell is:

\[
\partial_2(U) = \sum_{i=1}^g (a_i + b_i - a_i - b_i) = 0.
\]
All \( \partial_1 = 0 \) (as before). So all boundary maps vanish, and:

\[
H_0(\Sigma_g) = \mathbb{Z}, \quad H_1(\Sigma_g) = \mathbb{Z}^{2g}, \quad H_2(\Sigma_g) = \mathbb{Z}, \quad H_n(\Sigma_g) = 0 \text{ for } n \geq 3.
\]
The fact that \( H_2(\Sigma_g) \cong \mathbb{Z} \) (generated by the fundamental class \( [U] \)) reflects the orientability: for non-orientable surfaces, \( H_2 = 0 \).
</div>

## Section 3.3: Cellular Homology

For CW complexes, there is a more efficient computation using only the cells themselves, without subdividing into simplices.

The cellular chain complex has far fewer generators than the simplicial chain complex: instead of one generator per simplex (which requires many simplices to triangulate even simple spaces), the cellular complex has one generator per cell. For \( S^n \), the minimal CW structure has two cells (one 0-cell and one \( n \)-cell), so the cellular chain complex is \( 0 \to \mathbb{Z} \to 0 \to \cdots \to 0 \to \mathbb{Z} \to 0 \) with the two \( \mathbb{Z} \)'s in positions 0 and \( n \), giving \( H_0(S^n) = H_n(S^n) = \mathbb{Z} \) and all others 0. This is a two-line computation; the simplicial version requires triangulating \( S^n \) with many more cells.

The key formula — \( d_n(e^n_\alpha) = \sum_\beta \deg(\phi_{\alpha\beta}) \cdot e^{n-1}_\beta \) — reduces the boundary map to a degree computation. For spaces like \( \mathbb{RP}^n \) where all cells are in a linear chain, the boundary maps alternate between 0 and 2 (the degree of the double cover), and the chain complex is determined by a single repeating pattern. The proof that cellular homology agrees with singular homology uses the long exact sequence of the pair \( (X^n, X^{n-1}) \) and the identification \( H_k(X^n, X^{n-1}) \cong \bigoplus_\alpha \tilde H_k(S^n_\alpha) \) (each \( n \)-cell contributes a copy of \( \mathbb{Z} \) in degree \( n \) and nothing else).

<div class="definition">
<strong>Definition (Cellular Chain Complex):</strong> For a CW complex \( X \), the <em>cellular chain group</em> \( C_n^{CW}(X) \) is the free abelian group generated by the \( n \)-cells. The <em>cellular boundary map</em> \( d_n : C_n^{CW} \to C_{n-1}^{CW} \) is given by:

\[
d_n(e^n_\alpha) = \sum_\beta \deg(\phi_{\alpha\beta}) \cdot e^{n-1}_\beta,
\]
where \( \phi_{\alpha\beta} : S^{n-1} \to S^{n-1} \) is the composition of the attaching map of \( e^n_\alpha \) with the quotient map \( X^{n-1} \to X^{n-1}/\!(X^{n-1} \setminus e^{n-1}_\beta) \cong S^{n-1} \), and \( \deg \) is the degree of this map.
</div>

<div class="theorem">
<strong>Theorem (Cellular Homology):</strong> The cellular homology \( H_n^{CW}(X) = \ker d_n / \mathrm{im}\, d_{n+1} \) is naturally isomorphic to the singular homology \( H_n(X) \).
</div>

<div class="example">
<strong>Example (\( H_*(\mathbb{RP}^2) \) via Cellular Homology):</strong> The CW structure of \( \mathbb{RP}^2 \) has cells \( e^0, e^1, e^2 \). 
<ul>
<li>\( d_1 : C_1 \to C_0 \): The attaching map of \( e^1 \) sends both endpoints of \( [0,1] \) to the single 0-cell, so \( d_1(e^1) = e^0 - e^0 = 0 \).</li>
<li>\( d_2 : C_2 \to C_1 \): The attaching map of \( e^2 \) is the double covering \( S^1 \to \mathbb{RP}^1 \cong S^1 \), given by \( z \mapsto z^2 \), which has degree 2. So \( d_2(e^2) = 2e^1 \).</li>
</ul>
The cellular chain complex is:

\[
0 \to \mathbb{Z} \xrightarrow{d_2 = 2} \mathbb{Z} \xrightarrow{d_1 = 0} \mathbb{Z} \to 0.
\]
Reading off:

\[
H_0(\mathbb{RP}^2) = \mathbb{Z}/\mathrm{im}(d_1) = \mathbb{Z}/0 = \mathbb{Z},
\]

\[
H_1(\mathbb{RP}^2) = \ker(d_1)/\mathrm{im}(d_2) = \mathbb{Z}/2\mathbb{Z},
\]

\[
H_2(\mathbb{RP}^2) = \ker(d_2)/0 = 0 \quad \text{(since } d_2 = 2 \text{ is injective)}.
\]
</div>

<div class="example">
<strong>Example (\( H_*(\mathbb{RP}^3) \) via Cellular Homology):</strong> The CW structure of \( \mathbb{RP}^3 \) has one cell in each dimension 0 through 3.
<ul>
<li>\( d_1 = 0 \): Same reason as above.</li>
<li>\( d_2 = 2 \): The attaching map of \( e^2 \) is the double cover \( S^1 \to \mathbb{RP}^1 \), degree 2.</li>
<li>\( d_3 = 0 \): The attaching map of \( e^3 \) is the double cover \( S^2 \to \mathbb{RP}^2 \). The composition with the quotient \( \mathbb{RP}^2 \to \mathbb{RP}^2/\mathbb{RP}^1 \cong S^2 \) is a map of degree \( 1 + (-1) = 0 \) (the two hemispheres map with opposite orientations but the same sign under the antipodal identification), so \( d_3 = 0 \).</li>
</ul>
The cellular chain complex is:

\[
0 \to \mathbb{Z} \xrightarrow{0} \mathbb{Z} \xrightarrow{2} \mathbb{Z} \xrightarrow{0} \mathbb{Z} \to 0.
\]
Reading off (\( C_3 \xrightarrow{d_3=0} C_2 \xrightarrow{d_2=2} C_1 \xrightarrow{d_1=0} C_0 \)):

\[
H_0 = \mathbb{Z}, \quad H_1 = \ker(d_1)/\mathrm{im}(d_2) = \mathbb{Z}/2\mathbb{Z}, \quad H_2 = \ker(d_2)/\mathrm{im}(d_3) = 0, \quad H_3 = \ker(d_3) = \mathbb{Z}.
\]
</div>

<div class="remark">
<strong>Remark (Pattern for \( \mathbb{RP}^n \)):</strong> The cellular boundary maps of \( \mathbb{RP}^n \) alternate between 0 and multiplication by 2. For even-dimensional cells the attaching map has degree 0 (odd \( n \)-cell in \( \mathbb{RP}^n \)) and for odd-dimensional cells the attaching map has degree 2 (even \( n \)-cell). The resulting homology is: \( H_0 = \mathbb{Z} \), \( H_k = \mathbb{Z}/2 \) for \( k \) odd with \( 0 < k < n \), \( H_n = \mathbb{Z} \) if \( n \) is odd and \( H_n = 0 \) if \( n \) is even, and all other \( H_k = 0 \).
</div>

## Section 3.4: Table of Homology Groups

| Space | \( H_0 \) | \( H_1 \) | \( H_2 \) | \( H_3 \) | Notes |
|---|---|---|---|---|---|
| Point | \( \mathbb{Z} \) | 0 | 0 | 0 | |
| \( S^1 \) | \( \mathbb{Z} \) | \( \mathbb{Z} \) | 0 | 0 | |
| \( S^2 \) | \( \mathbb{Z} \) | 0 | \( \mathbb{Z} \) | 0 | |
| \( S^n \) | \( \mathbb{Z} \) | \( \mathbb{Z} \) if \( n=1 \), else 0 | \( \mathbb{Z} \) if \( n=2 \), else 0 | \( \mathbb{Z} \) if \( n=3 \), else 0 | \( H_n(S^n) \cong \mathbb{Z} \) |
| \( T^2 \) | \( \mathbb{Z} \) | \( \mathbb{Z}^2 \) | \( \mathbb{Z} \) | 0 | |
| \( \mathbb{RP}^2 \) | \( \mathbb{Z} \) | \( \mathbb{Z}/2 \) | 0 | 0 | |
| \( \mathbb{RP}^3 \) | \( \mathbb{Z} \) | \( \mathbb{Z}/2 \) | 0 | \( \mathbb{Z} \) | |
| \( \mathbb{CP}^n \) | \( \mathbb{Z} \) | 0 | \( \mathbb{Z} \) | 0 | \( H_{2k} = \mathbb{Z} \) for \( k \leq n \) |
| \( \Sigma_g \) | \( \mathbb{Z} \) | \( \mathbb{Z}^{2g} \) | \( \mathbb{Z} \) | 0 | genus-\( g \) surface |
| Klein bottle \( K \) | \( \mathbb{Z} \) | \( \mathbb{Z} \oplus \mathbb{Z}/2 \) | 0 | 0 | non-orientable |
| \( T^n \) | \( \mathbb{Z} \) | \( \mathbb{Z}^n \) | \( \mathbb{Z}^{\binom{n}{2}} \) | \( \mathbb{Z}^{\binom{n}{3}} \) | \( H_k(T^n) = \mathbb{Z}^{\binom{n}{k}} \) |
| \( \mathbb{RP}^4 \) | \( \mathbb{Z} \) | \( \mathbb{Z}/2 \) | 0 | \( \mathbb{Z}/2 \) | \( H_4 = 0 \) |
| \( S^1 \vee S^2 \) | \( \mathbb{Z} \) | \( \mathbb{Z} \) | \( \mathbb{Z} \) | 0 | wedge sum |

<div class="remark">
<strong>Remark (Künneth Formula):</strong> The homology of a product \( X \times Y \) is computed by the Künneth formula: when \( H_*(X;\mathbb{Z}) \) is torsion-free,

\[
H_n(X \times Y;\mathbb{Z}) \cong \bigoplus_{k=0}^n H_k(X;\mathbb{Z}) \otimes H_{n-k}(Y;\mathbb{Z}).
\]
In general, there is a correction term involving \( \mathrm{Tor} \), but for spaces with free homology (like \( S^n \), \( T^n \), \( \mathbb{CP}^n \)), the Künneth formula gives an exact computation. For instance:

\[
H_k(T^n) = H_k((S^1)^n) \cong \bigoplus_{j_1 + \cdots + j_n = k,\, j_i \in \{0,1\}} H_{j_1}(S^1) \otimes \cdots \otimes H_{j_n}(S^1) \cong \mathbb{Z}^{\binom{n}{k}},
\]
since each factor \( H_{j_i}(S^1) \) is \( \mathbb{Z} \) (for \( j_i = 0 \) or \( 1 \)) and we are choosing which of the \( n \) circles contribute a 1-dimensional factor.
</div>

<div class="remark">
<strong>Remark (Euler Characteristic via Homology):</strong> For any finite CW complex, \( \chi(X) = \sum_n (-1)^n \mathrm{rank}(H_n(X;\mathbb{Z})) \). This follows from the fact that in any finite chain complex, the alternating sum of ranks of chain groups equals the alternating sum of ranks of homology groups (a consequence of the rank-nullity theorem applied to the boundary maps in the chain complex). This formula confirms that both the cellular definition (alternating sum of cell counts) and the algebraic definition (alternating sum of Betti numbers) give the same number, and will be used in Chapter 5 in the proof of the Lefschetz fixed-point theorem.
</div>

<div class="remark">
<strong>Remark (Homology and Connectivity):</strong> The zeroth homology group encodes connectivity: \( H_0(X) \cong \mathbb{Z}^k \) where \( k \) is the number of path-connected components of \( X \). The first homology group \( H_1(X) \) is the abelianisation of \( \pi_1(X) \) (for path-connected spaces), as we will prove in Chapter 5. For simply connected spaces, \( H_1 = 0 \). Higher homology groups \( H_n \) for \( n \geq 2 \) detect higher-dimensional "voids": \( H_2(S^2) \cong \mathbb{Z} \) detects the 2-dimensional void enclosed by the sphere; \( H_n(S^n) \cong \mathbb{Z} \) detects the \( n \)-dimensional void of the \( n \)-sphere. The torsion subgroup of \( H_n \) (e.g., \( \mathbb{Z}/2 \) in \( H_1(\mathbb{RP}^2) \)) detects "twisted" cycles that bound once you go around twice.
</div>

<div class="remark">
<strong>Remark (Chapter 3 Summary and Preview of Chapter 4):</strong> We have computed the homology of standard spaces using two methods: simplicial homology (for \( \Delta \)-complexes) and cellular homology (for CW complexes). Both yield the same groups, and both require choosing a decomposition of \( X \). In Chapter 4, we introduce singular homology — defined without any decomposition — and prove the key structural theorems (homotopy invariance, long exact sequence, excision) that make homology a powerful computational and theoretical tool. We also prove that singular homology agrees with cellular homology for CW complexes, so the computations of Chapter 3 are justified.
</div>

---

# Chapter 4: Singular Homology

Simplicial and cellular homology require the space to have a CW structure or triangulation. **Singular homology**, introduced by Eilenberg in 1944, works for any topological space whatsoever: a singular \( n \)-simplex is simply any continuous map \( \sigma : \Delta^n \to X \), with no injectivity or linearity required. The resulting chain groups are enormous (typically uncountably generated) but the homology groups they produce are both computable and functorial, and they agree with the cellular computation for CW complexes.

The key results of this chapter — homotopy invariance, the long exact sequence of a pair, excision, and the Mayer–Vietoris sequence — form the axiomatic backbone of any homology theory. Eilenberg and Steenrod showed in 1945 that these four properties, together with a normalisation condition, uniquely characterise singular homology among "ordinary" homology theories. This "axiomatic" characterisation is the deepest structural insight of the subject.

From a historical standpoint, singular homology resolved a problem that had vexed topologists since Poincaré: how to define homology groups for spaces that admit no triangulation. Eilenberg's 1944 paper introduced singular chains as a way to encode all continuous maps into a space, not just linear ones. This "singular" approach was immediately recognised as the right foundation: singular homology agrees with simplicial homology on triangulable spaces (by the simplicial approximation theorem), is functorial for all continuous maps (not just simplicial maps), and satisfies excision without any smoothness hypothesis. The name "singular" reflects the fact that a singular simplex can be a highly non-injective, pathological map — the word is used in the sense of "general," contrasting with the "non-singular" (embedded, linear) simplices of the simplicial theory.

The axiomatic approach to homology, developed by Eilenberg and Steenrod in their 1952 book *Foundations of Algebraic Topology*, identifies the minimal set of properties that characterise a homology theory: the homotopy axiom, the exactness axiom (long exact sequence of a pair), the excision axiom, and the dimension axiom (normalisation at a point). Any functor from spaces to graded abelian groups satisfying these axioms on finite CW complexes is isomorphic to singular homology. This uniqueness is what justifies computing homology by any convenient method — simplicial, cellular, or singular — and always getting the same answer.

## Section 4.1: Singular Chains and Homology

The definition of singular homology is elegantly simple: a singular \( n \)-simplex is just any continuous map \( \Delta^n \to X \), with no additional structure. This "singular" terminology (as opposed to "simplicial") reflects the fact that such maps can be highly non-injective and can have singularities. The chain complex built from all such maps is enormous — even for \( X = \{*\} \), there is exactly one singular \( n \)-simplex for each \( n \) (the unique map to the point), and the homology comes out correctly to \( H_0(\{*\}) = \mathbb{Z} \) and \( H_n(\{*\}) = 0 \) for \( n \geq 1 \), which is a nontrivial calculation.

The key technical lemma underlying all of singular homology is the existence of **barycentric subdivision**: any singular simplex can be subdivided into smaller simplices, allowing one to assume that simplices are "small" (contained in a single open set of an open cover). This is the mechanism behind the excision theorem, which requires subdividing chains to show that excision does not change homology. The proof uses the fact that repeated barycentric subdivision makes simplices arbitrarily small (since the diameter decreases geometrically), and the Lebesgue number lemma guarantees that sufficiently small simplices lie in a single set.

<div class="definition">
<strong>Definition (Singular Chain Group):</strong> A <em>singular \( n \)-simplex</em> in \( X \) is any continuous map \( \sigma : \Delta^n \to X \). The <em>singular \( n \)-chain group</em> \( C_n(X) \) is the free abelian group generated by all singular \( n \)-simplices (for \( n \geq 0 \); \( C_n(X) = 0 \) for \( n < 0 \)). The boundary operator is defined on generators by the same alternating face formula:

\[
\partial_n(\sigma) = \sum_{i=0}^n (-1)^i \sigma \circ \delta_i,
\]
where \( \delta_i : \Delta^{n-1} \to \Delta^n \) is the \( i \)-th face inclusion. The same calculation as before shows \( \partial_{n-1} \circ \partial_n = 0 \), so the singular chain groups form a chain complex, and we define the <em>singular homology groups</em> \( H_n(X) = \ker \partial_n / \mathrm{im}\, \partial_{n+1} \).
</div>

<div class="remark">
<strong>Remark (Size):</strong> For any non-empty space, \( C_n(X) \) is uncountably generated when \( X \) has more than one point (since there are uncountably many continuous maps \( \Delta^n 	o X \)). Nevertheless, the homology groups are often finitely generated. The key point is that most singular simplices cancel in the quotient \( H_n \), and the algebraic structure of the boundary maps forces remarkable cancellation.
</div>

<div class="remark">
<strong>Remark (Standard Simplex and Face Maps):</strong> The standard \( n \)-simplex is

\[
\Delta^n = \{(t_0, t_1, \ldots, t_n) \in \mathbb{R}^{n+1} : t_i \geq 0,\ t_0 + t_1 + \cdots + t_n = 1\},
\]
with vertices \( e_0 = (1,0,\ldots,0) \), \( e_1 = (0,1,0,\ldots,0) \), \ldots, \( e_n = (0,\ldots,0,1) \). The <em>\( i \)-th face map</em> \( \delta_i : \Delta^{n-1} 	o \Delta^n \) embeds \( \Delta^{n-1} \) as the face of \( \Delta^n \) opposite vertex \( e_i \), by inserting a zero in position \( i \):

\[
\delta_i(t_0, \ldots, t_{n-1}) = (t_0, \ldots, t_{i-1}, 0, t_i, \ldots, t_{n-1}).
\]
For example, \( \delta_0 : \Delta^1 	o \Delta^2 \) maps the edge \( [e_0, e_1] \) to the face \( [e_1, e_2] \) of the triangle \( \Delta^2 \) (the face opposite \( e_0 \)). The face maps satisfy the <em>cosimplicial identities</em>: \( \delta_j \circ \delta_i = \delta_{i+1} \circ \delta_j \) for \( i \geq j \). These identities are precisely what makes \( \partial^2 = 0 \) hold.
</div>

<div class="example">
<strong>Example (\( \partial^2 = 0 \): Explicit Alternating Sign Cancellation):</strong> We verify \( \partial_1 \circ \partial_2 = 0 \) for a singular 2-simplex \( \sigma : \Delta^2 	o X \). By definition:

\[
\partial_2(\sigma) = \sigma \circ \delta_0 - \sigma \circ \delta_1 + \sigma \circ \delta_2,
\]
where \( \delta_0, \delta_1, \delta_2 : \Delta^1 	o \Delta^2 \) are the three face inclusions. Applying \( \partial_1 \) to each term:

\[
\partial_1(\sigma \circ \delta_i) = (\sigma \circ \delta_i) \circ \delta_1 - (\sigma \circ \delta_i) \circ \delta_0 = \sigma \circ \delta_i \circ \delta_1 - \sigma \circ \delta_i \circ \delta_0.
\]
So \( \partial_1(\partial_2(\sigma)) = (\sigma \circ \delta_0 \circ \delta_1 - \sigma \circ \delta_0 \circ \delta_0) - (\sigma \circ \delta_1 \circ \delta_1 - \sigma \circ \delta_1 \circ \delta_0) + (\sigma \circ \delta_2 \circ \delta_1 - \sigma \circ \delta_2 \circ \delta_0) \). Using the cosimplicial identity \( \delta_j \delta_i = \delta_{i+1} \delta_j \) for \( j \leq i \), one finds: \( \delta_0 \delta_1 = \delta_2 \delta_0 \), \( \delta_1 \delta_0 = \delta_1 \delta_0 \) (same), \( \delta_0 \delta_0 = \delta_1 \delta_0 \), \( \delta_1 \delta_1 = \delta_2 \delta_1 \), \( \delta_2 \delta_0 = \delta_1 \delta_0 \), \( \delta_2 \delta_1 = \delta_2 \delta_1 \). Collecting terms, every composition \( \sigma \circ \delta_j \circ \delta_i \) appears exactly twice with opposite signs, giving \( \partial_1 \circ \partial_2 = 0 \). The general proof for \( \partial_{n-1} \circ \partial_n \) follows the same sign-cancellation pattern.
</div>

<div class="remark">
<strong>Remark (Why Integer Coefficients):</strong> The chain groups \( C_n(X) \) are defined as <em>free abelian</em> groups — formal integer linear combinations \( \sum n_i \sigma_i \) with \( n_i \in \mathbb{Z} \). This is not just a convention; the integer coefficients are essential for detecting torsion (e.g., the \( \mathbb{Z}/2 \) in \( H_1(\mathbb{RP}^2) \)). If one used \( \mathbb{Q} \) or \( \mathbb{R} \) coefficients, all torsion information would vanish (since \( \mathbb{Z}/k \otimes \mathbb{Q} = 0 \)), and one would lose the distinction between, say, \( S^2 \) (with \( H_1 = 0 \)) and \( \mathbb{RP}^2 \) (with \( H_1 = \mathbb{Z}/2 \)). Using \( \mathbb{Z}/2 \) coefficients erases orientation information but retains \( \mathbb{Z}/2 \)-torsion. The Universal Coefficient Theorem (Section 4.5) precisely quantifies how homology with different coefficient groups are related.
</div>

## Section 4.2: Homotopy Invariance

<div class="remark">
<strong>Remark (Size and Computability):</strong> The singular chain group \( C_n(X) \) for \( n \geq 1 \) and \( |X| > 1 \) is not finitely generated — it is freely generated by all continuous maps \( \Delta^n \to X \), of which there are uncountably many. Nevertheless, the homology groups \( H_n(X) \) are often finitely generated. The key is that most of the uncountable information in \( C_n(X) \) is killed in the quotient \( \ker \partial_n / \mathrm{im}\, \partial_{n+1} \). For a CW complex, the singular homology equals the cellular homology (a finite computation), so the size of the singular chain complex does not affect the final answer.
</div>

<div class="theorem">
<strong>Theorem (Homotopy Invariance of Singular Homology):</strong> If \( f, g : X \to Y \) are homotopic, then \( f_* = g_* : H_n(X) \to H_n(Y) \) for all \( n \). In particular, homotopy equivalent spaces have isomorphic singular homology groups.
</div>

<div class="proof">
<em>Proof.</em> Let \( H : X \times [0,1] \to Y \) be a homotopy from \( f \) to \( g \). We construct a <em>chain homotopy</em> — a collection of homomorphisms \( P_n : C_n(X) \to C_{n+1}(Y) \) satisfying \( \partial P_n + P_{n-1} \partial = g_* - f_* \) on \( C_n(X) \).

The maps \( P_n \) come from the "prism" decomposition of \( \Delta^n \times [0,1] \). The prism \( \Delta^n \times [0,1] \) can be triangulated as a union of \( (n+1) \) simplices of dimension \( n+1 \):

\[
\Delta^n \times [0,1] = \bigcup_{i=0}^n [v_0,\ldots,v_i,w_i,\ldots,w_n],
\]
where \( v_j = (e_j, 0) \) and \( w_j = (e_j, 1) \). For a singular \( n \)-simplex \( \sigma : \Delta^n \to X \), define:

\[
P(\sigma) = \sum_{i=0}^n (-1)^i H \circ (\sigma \times \mathrm{id}) \circ \iota_i,
\]
where \( \iota_i : \Delta^{n+1} \to \Delta^n \times [0,1] \) is the affine map sending vertices \( 0,\ldots,n+1 \) to \( v_0,\ldots,v_i,w_i,\ldots,w_n \). Then a direct computation using the face maps of \( \Delta^{n+1} \) shows \( \partial P(\sigma) + P(\partial \sigma) = g_*(\sigma) - f_*(\sigma) \). For any cycle \( z \in \ker \partial_n \), this gives \( g_*(z) - f_*(z) = \partial(P(z)) \in \mathrm{im}\, \partial_{n+1} \), so \( [g_*(z)] = [f_*(z)] \) in \( H_n(Y) \). \( \square \)
</div>

<div class="remark">
<strong>Remark (Geometric Meaning of Chain Homotopies):</strong> A chain homotopy \( P_n : C_n(X) 	o C_{n+1}(Y) \) should be thought of geometrically as a "prism" construction. Given a singular \( n \)-simplex \( \sigma : \Delta^n 	o X \) and a homotopy \( H : X 	imes [0,1] 	o Y \), the map \( H \circ (\sigma 	imes \mathrm{id}) : \Delta^n 	imes [0,1] 	o Y \) sweeps out a "prism" over \( \sigma \). The prism \( \Delta^n 	imes [0,1] \) is triangulated as a union of \( (n+1) \) simplices of dimension \( n+1 \):

\[
\Delta^n 	imes [0,1] = igcup_{i=0}^n \left[ v_0, \ldots, v_i, w_i, \ldots, w_n 
ight],
\]
where \( v_j = (e_j, 0) \) are the "bottom" vertices and \( w_j = (e_j, 1) \) are the "top" vertices. The chain homotopy \( P(\sigma) \) is the alternating sum of the \( (n+1) \) singular \( (n+1) \)-simplices obtained by restricting \( H \circ (\sigma 	imes \mathrm{id}) \) to each piece of this triangulation. The algebraic identity \( \partial P + P \partial = g_* - f_* \) then encodes the fact that the boundary of the prism consists of the top face (\( g \circ \sigma \)), the bottom face (\( f \circ \sigma \)), and the lateral faces (which contribute the \( P \partial \) term).
</div>

<div class="remark">
<strong>Remark (Corollary: Contractible Spaces Have Trivial Homology):</strong> The most important consequence of homotopy invariance is that contractible spaces have the same homology as a point: \( H_n(X) = 0 \) for \( n \geq 1 \) and \( H_0(X) \cong \mathbb{Z} \) whenever \( X \) is contractible. In particular:
<ul>
<li>\( \mathbb{R}^n \) is contractible (via the straight-line homotopy \( H(x,t) = (1-t)x \)), so \( 	ilde H_k(\mathbb{R}^n) = 0 \) for all \( k \).</li>
<li>\( \mathbb{R}^n \setminus \{0\} \simeq S^{n-1} \) (via the deformation retraction \( x \mapsto x/|x| \)), so \( H_k(\mathbb{R}^n \setminus \{0\}) \cong H_k(S^{n-1}) \), giving \( \mathbb{Z} \) in degrees 0 and \( n-1 \) and 0 elsewhere.</li>
<li>Any convex subset of \( \mathbb{R}^n \) is contractible. Any tree is contractible.</li>
</ul>
These facts make it possible to compute the homology of complicated spaces by decomposing them into contractible pieces and applying Mayer–Vietoris.
</div>

## Section 4.3: Long Exact Sequence of a Pair

The long exact sequence of a pair is the algebraic backbone of "relative thinking" in topology. Relative homology \( H_n(X,A) \) measures the homology of \( X \) relative to \( A \): it detects cycles in \( X \) that are not cycles in \( A \) (i.e., chains in \( X \) whose boundary lies in \( A \)). Intuitively, \( H_n(X,A) \) counts \( n \)-dimensional "holes" in \( X \) that are "bounded" relative to \( A \).

The connecting homomorphism \( \partial_* : H_n(X,A) \to H_{n-1}(A) \) is the key algebraic device: it "takes the boundary" of a relative cycle (a chain in \( X \) whose boundary happens to lie in \( A \)) and produces an actual cycle in \( A \). The exactness of the sequence ensures that cycles in \( A \) that are boundaries in \( X \) (not in \( A \) itself) are precisely those in the image of \( \partial_* \). This "connecting" mechanism is the algebraic analogue of the topological fact that a cycle bounding in \( X \) relative to \( A \) determines a class in \( H_{n-1}(A) \).

<div class="definition">
<strong>Definition (Relative Homology):</strong> For a pair \( (X, A) \) with \( A \subseteq X \), define \( C_n(X, A) = C_n(X) / C_n(A) \). The boundary map \( \partial : C_n(X) \to C_{n-1}(X) \) maps \( C_n(A) \) to \( C_{n-1}(A) \) and hence descends to \( \partial : C_n(X,A) \to C_{n-1}(X,A) \). The <em>relative homology groups</em> are \( H_n(X,A) = \ker \partial / \mathrm{im}\, \partial \).
</div>

<div class="theorem">
<strong>Theorem (Long Exact Sequence of a Pair):</strong> For any pair \( (X, A) \), there is a natural long exact sequence:

\[
\cdots \to H_n(A) \xrightarrow{i_*} H_n(X) \xrightarrow{j_*} H_n(X,A) \xrightarrow{\partial_*} H_{n-1}(A) \to \cdots
\]
where \( i : A \hookrightarrow X \) and \( j : (X, \emptyset) \hookrightarrow (X,A) \) are inclusions, and \( \partial_* \) is the connecting homomorphism.
</div>

<div class="proof">
<em>Proof.</em> The sequence of chain groups \( 0 \to C_*(A) \to C_*(X) \to C_*(X,A) \to 0 \) is a short exact sequence of chain complexes (the last map is surjection by definition of quotient). By the Snake Lemma applied to this short exact sequence of chain complexes, one obtains the desired long exact sequence in homology. The connecting homomorphism \( \partial_* : H_n(X,A) \to H_{n-1}(A) \) is defined as follows: given a relative cycle \( [z] \in H_n(X,A) \), lift it to a chain \( z \in C_n(X) \); then \( \partial z \in C_{n-1}(A) \) is a cycle in \( A \) (since \( \partial^2 z = 0 \) and \( \partial z \) maps to 0 in \( C_{n-1}(X,A) \)); and \( \partial_*[z] = [\partial z] \in H_{n-1}(A) \). Independence of the lift and exactness are verified directly. \( \square \)
</div>

<div class="theorem">
<strong>Theorem (Excision):</strong> Let \( Z \subseteq A \subseteq X \) with \( \bar Z \subseteq \mathrm{int}(A) \). Then the inclusion \( (X \setminus Z, A \setminus Z) \hookrightarrow (X, A) \) induces an isomorphism \( H_n(X \setminus Z, A \setminus Z) \xrightarrow{\sim} H_n(X, A) \) for all \( n \). Equivalently, if \( X = \mathrm{int}(A) \cup \mathrm{int}(B) \), then \( H_n(B, A \cap B) \cong H_n(X, A) \).
</div>

<div class="theorem">
<strong>Theorem (Good Pairs and Quotients):</strong> If \( (X, A) \) is a <em>good pair</em> (meaning \( A \) is a closed subspace that is a deformation retract of some open neighbourhood), then the quotient map \( (X,A) \to (X/A, A/A) \) induces an isomorphism \( H_n(X, A) \cong \tilde H_n(X/A) \).
</div>

<div class="example">
<strong>Example (Computing \( H_*(S^n) \) via the Pair \( (D^n, S^{n-1}) \)):</strong> Since \( (D^n, S^{n-1}) \) is a good pair (any collar neighbourhood of \( S^{n-1} \) in \( D^n \) serves), the good pair isomorphism gives \( H_k(D^n, S^{n-1}) \cong \tilde H_k(S^n) \). The long exact sequence of the pair (for \( k \geq 1 \), using \( H_k(D^n) = 0 \)) gives:

\[
0 = H_k(D^n) \to H_k(D^n, S^{n-1}) \xrightarrow{\partial_*} H_{k-1}(S^{n-1}) \to H_{k-1}(D^n) = 0,
\]
so \( H_k(D^n, S^{n-1}) \cong H_{k-1}(S^{n-1}) \). Hence \( \tilde H_k(S^n) \cong \tilde H_{k-1}(S^{n-1}) \). Inducting from \( \tilde H_1(S^1) \cong \mathbb{Z} \) gives \( \tilde H_k(S^n) \cong \mathbb{Z} \) for \( k = n \) and \( 0 \) otherwise.
</div>

<div class="remark">
<strong>Remark (Excision: Geometric Picture):</strong> The excision theorem says: if \( Z \subseteq A \subseteq X \) with \( \bar{Z} \subseteq \mathrm{int}(A) \), then \( H_n(X \setminus Z, A \setminus Z) \cong H_n(X, A) \). Geometrically, relative cycles in \( X \) that only touch \( A \) at their boundary cannot "see" a subspace \( Z \) well inside \( A \). Barycentric subdivision makes simplices arbitrarily small, ensuring subdivided simplices avoid \( Z \) (by the Lebesgue number lemma). For good pairs \( (X,A) \) this combines with the long exact sequence to give the very useful formula \( H_n(X, A) \cong \tilde H_n(X/A) \): for example \( H_n(D^n, S^{n-1}) \cong \tilde H_n(S^n) \cong \mathbb{Z} \) in degree \( n \).
</div>

## Section 4.4: The Mayer–Vietoris Sequence

The Mayer–Vietoris sequence is the homological analogue of van Kampen's theorem: it computes the homology of a union \( X = A \cup B \) in terms of the homologies of \( A \), \( B \), and \( A \cap B \). The key difference from van Kampen is that the Mayer–Vietoris sequence works in all dimensions simultaneously and produces abelian groups, while van Kampen works for the fundamental group (which can be non-abelian). The Mayer–Vietoris sequence is in fact a consequence of the short exact sequence of chain complexes \( 0 \to C_*(A \cap B) \to C_*(A) \oplus C_*(B) \to C_*(A+B) \to 0 \) and the barycentric subdivision argument showing that \( H_*(A+B) \cong H_*(X) \) (where \( C_*(A+B) \) consists of chains that are sums of chains in \( A \) and chains in \( B \)).

The derivation is a direct application of the Snake Lemma. The subchain complex \( C_*(A+B) \subseteq C_*(X) \) consists of chains expressible as \( \alpha + \beta \) with \( \alpha \in C_*(A) \) and \( \beta \in C_*(B) \). The inclusion \( \Phi : C_*(A \cap B) \to C_*(A) \oplus C_*(B) \) sends \( \sigma \mapsto (\sigma, -\sigma) \), and the map \( \Psi : C_*(A) \oplus C_*(B) \to C_*(A+B) \) sends \( (\alpha, \beta) \mapsto \alpha + \beta \). One checks that the sequence \( 0 \to C_*(A \cap B) \xrightarrow{\Phi} C_*(A) \oplus C_*(B) \xrightarrow{\Psi} C_*(A+B) \to 0 \) is exact (surjectivity of \( \Psi \) is by definition; injectivity and exactness at the middle follow from the sign convention). The Snake Lemma then gives the long exact sequence in homology; the identification \( H_*(A+B) \cong H_*(X) \) follows from barycentric subdivision (any singular simplex in \( X \) can be subdivided until each piece lies in \( A \) or \( B \)). The naturality of Mayer–Vietoris says that a map of pairs \( f : (X; A, B) \to (X'; A', B') \) (with \( f(A) \subseteq A' \) and \( f(B) \subseteq B' \)) induces a chain map between the two long exact sequences, with all squares commuting. This naturality is used in the proof of the Künneth formula and in comparing Mayer–Vietoris sequences for different decompositions of the same space.

<div class="theorem">
<strong>Theorem (Mayer–Vietoris):</strong> Let \( X = A \cup B \) with \( A, B \) open (or both subcomplexes of a CW complex). There is a natural long exact sequence:

\[
\cdots \to H_n(A \cap B) \xrightarrow{\Phi} H_n(A) \oplus H_n(B) \xrightarrow{\Psi} H_n(X) \xrightarrow{\partial} H_{n-1}(A \cap B) \to \cdots
\]
where \( \Phi(\alpha) = (i_*\alpha, -j_*\alpha) \) (with \( i : A \cap B \hookrightarrow A \) and \( j : A \cap B \hookrightarrow B \)) and \( \Psi(\alpha, \beta) = k_*\alpha + l_*\beta \) (with \( k : A \hookrightarrow X \), \( l : B \hookrightarrow X \)).
</div>

<div class="example">
<strong>Example (Homology of \( S^n \) by Mayer–Vietoris):</strong> Write \( S^n = A \cup B \) where \( A = S^n \setminus \{N\} \simeq \mathbb{R}^n \simeq \{*\} \) and \( B = S^n \setminus \{S\} \simeq \{*\} \), with \( A \cap B \simeq S^{n-1} \). The Mayer–Vietoris sequence for \( k \geq 2 \):

\[
\underbrace{H_k(A) \oplus H_k(B)}_{= 0} \to H_k(S^n) \to H_{k-1}(A \cap B) \to \underbrace{H_{k-1}(A) \oplus H_{k-1}(B)}_{= 0}.
\]
By exactness, \( H_k(S^n) \cong H_{k-1}(S^{n-1}) \) for \( k \geq 2 \). By induction (starting from \( H_1(S^1) \cong \mathbb{Z} \)), \( H_n(S^n) \cong \mathbb{Z} \) and \( H_k(S^n) = 0 \) for \( 0 < k < n \).
</div>

<div class="example">
<strong>Example (Homology of \( T^2 \) by Mayer–Vietoris):</strong> Let \( A = T^2 \setminus \{p\} \) and \( B \) an open disk neighbourhood of \( p \in T^2 \). Then \( A \simeq S^1 \vee S^1 \) (the torus minus a point deformation retracts onto the 1-skeleton), \( B \simeq \{*\} \), and \( A \cap B \simeq S^1 \) (a small circle around \( p \)). The Mayer–Vietoris sequence in degree 2 reads:

\[
\underbrace{H_2(A \cap B)}_{=0} \to \underbrace{H_2(A)}_{=0} \oplus \underbrace{H_2(B)}_{=0} \to H_2(T^2) \xrightarrow{\partial} H_1(A \cap B) \xrightarrow{\Phi} H_1(A) \oplus H_1(B).
\]
The map \( \Phi : H_1(S^1) \to H_1(S^1 \vee S^1) \oplus H_1(*) \cong \mathbb{Z}^2 \oplus 0 \). The inclusion \( A \cap B \simeq S^1 \hookrightarrow A \simeq S^1 \vee S^1 \) sends the boundary circle to the commutator \( aba^{-1}b^{-1} \) in \( \pi_1 \), which maps to \( a + b - a - b = 0 \) in \( H_1(A) \cong \mathbb{Z}^2 \). So \( \Phi = 0 \), and the sequence gives an isomorphism \( H_2(T^2) \xrightarrow{\sim} \ker \Phi = \mathbb{Z} \). For degree 1:

\[
\underbrace{H_1(A \cap B)}_{\mathbb{Z}} \xrightarrow{0} \underbrace{H_1(A) \oplus H_1(B)}_{\mathbb{Z}^2 \oplus 0} \to H_1(T^2) \to \underbrace{H_0(A \cap B)}_{\mathbb{Z}} \to \underbrace{H_0(A) \oplus H_0(B)}_{\mathbb{Z} \oplus \mathbb{Z}}.
\]
Since \( A \) and \( B \) are connected, the last map \( \mathbb{Z} \to \mathbb{Z} \oplus \mathbb{Z} \) sends \( 1 \mapsto (1,1) \), so its kernel is 0. By exactness, \( H_1(T^2) \cong H_1(A \oplus B) / \mathrm{im}\,\Phi \cong \mathbb{Z}^2 \). This recovers \( H_1(T^2) \cong \mathbb{Z}^2 \).
</div>

## Section 4.4b: Applications of Mayer–Vietoris

<div class="example">
<strong>Example (Homology of \( S^1 \vee S^2 \)):</strong> Let \( X = S^1 \vee S^2 \). Write \( X = A \cup B \) where \( A \simeq S^1 \) (the circle part plus a small arc of the sphere), \( B \simeq S^2 \) (the sphere part plus a small arc of the circle), and \( A \cap B \simeq \{*\} \) (contractible). Mayer–Vietoris gives:

\[
H_n(A \cap B) \to H_n(A) \oplus H_n(B) \to H_n(X) \to H_{n-1}(A \cap B).
\]
Since \( A \cap B \) is contractible, \( H_n(A \cap B) = 0 \) for \( n \geq 1 \), and the sequence gives \( H_n(X) \cong H_n(A) \oplus H_n(B) \) for \( n \geq 1 \). Thus:

\[
H_1(S^1 \vee S^2) \cong H_1(S^1) \oplus H_1(S^2) = \mathbb{Z} \oplus 0 = \mathbb{Z},
\]

\[
H_2(S^1 \vee S^2) \cong H_2(S^1) \oplus H_2(S^2) = 0 \oplus \mathbb{Z} = \mathbb{Z}.
\]
More generally, for a wedge \( X \vee Y \) of path-connected spaces, \( \tilde H_n(X \vee Y) \cong \tilde H_n(X) \oplus \tilde H_n(Y) \).
</div>

<div class="example">
<strong>Example (Homology of the Mapping Torus):</strong> The mapping torus of a map \( f : X \to X \) is \( T_f = X \times [0,1] / (x,0) \sim (f(x),1) \). For \( f = \mathrm{id} \), \( T_{\mathrm{id}} = X \times S^1 \). For a map \( f : S^1 \to S^1 \) of degree \( d \), the mapping torus \( T_f \) has a fibration structure \( S^1 \to T_f \to S^1 \). The Mayer–Vietoris sequence for \( T_f = A \cup B \) (where \( A \) and \( B \) are two copies of \( S^1 \times [0,1] \) glued along \( S^1 \times \{0\} \) and \( S^1 \times \{1\} \)) gives:

\[
H_2(A \cap B) \to H_2(A) \oplus H_2(B) \to H_2(T_f) \to H_1(A \cap B) \xrightarrow{\Phi} H_1(A) \oplus H_1(B).
\]
With \( A \simeq B \simeq S^1 \), \( A \cap B \simeq S^1 \sqcup S^1 \), the map \( \Phi : \mathbb{Z}^2 \to \mathbb{Z}^2 \) is the matrix \( \begin{pmatrix} 1 & d \\ -1 & -1 \end{pmatrix} \). Computing, \( H_1(T_f) \cong \mathbb{Z}^2 / \mathrm{im}(\Phi) \cong \mathbb{Z} \oplus \mathbb{Z}/(d-1) \) for \( d \neq 1 \), and \( H_1(T_{\mathrm{id}}) \cong \mathbb{Z}^2 \) (the torus).
</div>

<div class="example">
<strong>Example (Homology of \( \mathbb{RP}^2 \) via Mayer–Vietoris):</strong> Decompose \( \mathbb{RP}^2 \) as the union of a Möbius band \( M \) and a disk \( D \). Specifically, \( \mathbb{RP}^2 \) is formed from a Möbius band (which deformation retracts to its core circle \( S^1 \)) and a disk \( D^2 \) (contractible), glued along their boundaries \( S^1 \). So \( A = M \simeq S^1 \), \( B = D^2 \simeq * \), and \( A \cap B \simeq S^1 \) (the boundary circle). The Mayer–Vietoris sequence in degree 2:

\[
0 = H_2(S^1) \to H_2(M) \oplus H_2(D^2) \to H_2(\mathbb{RP}^2) \to H_1(S^1) \xrightarrow{\Phi} H_1(M) \oplus H_1(D^2).
\]
Here \( H_2(M) = 0 \) (the Möbius band is non-compact and homotopy equivalent to \( S^1 \)), \( H_2(D^2) = 0 \), \( H_1(S^1) \cong \mathbb{Z} \), \( H_1(M) \cong \mathbb{Z} \) (generated by the core circle), and \( H_1(D^2) = 0 \). The map \( \Phi : H_1(S^1) \to H_1(M) \) is induced by the inclusion of the boundary \( \partial M \cong S^1 \hookrightarrow M \); since the boundary of a Möbius band goes around the core circle twice, \( \Phi \) is multiplication by 2. The exact sequence gives:

\[
0 \to H_2(\mathbb{RP}^2) \to \mathbb{Z} \xrightarrow{\times 2} \mathbb{Z} \to H_1(\mathbb{RP}^2) \to 0.
\]
Reading off: \( H_2(\mathbb{RP}^2) = \ker(\times 2) = 0 \) and \( H_1(\mathbb{RP}^2) = \mathrm{coker}(\times 2) = \mathbb{Z}/2 \), confirming our cellular computation.
</div>

<div class="example">
<strong>Example (Homology of the Klein Bottle via Mayer–Vietoris):</strong> The Klein bottle \( K \) can be decomposed as the union of two Möbius bands glued along their boundary circles. Let \( A \simeq S^1 \) and \( B \simeq S^1 \) (two Möbius bands, each homotopy equivalent to their core circle), with \( A \cap B \simeq S^1 \) (their common boundary). The Mayer–Vietoris sequence in degree 1:

\[
H_1(S^1) \xrightarrow{\Phi} H_1(S^1) \oplus H_1(S^1) \to H_1(K) \to H_0(S^1) \xrightarrow{\Psi} H_0(S^1) \oplus H_0(S^1).
\]
The map \( \Phi : \mathbb{Z} \to \mathbb{Z}^2 \) sends the boundary generator to \( (2, -2) \) (the boundary goes around each core circle twice, with opposite orientations due to the Klein bottle's non-orientability). From the exact sequence: \( H_1(K) \cong \mathbb{Z}^2 / \langle (2,-2) \rangle \cong \mathbb{Z} \oplus \mathbb{Z}/2 \). In degree 2: \( H_2(K) = 0 \) since \( K \) is non-orientable (there is no fundamental class over \( \mathbb{Z} \)). This matches the cellular computation.
</div>

## Section 4.5: Homology with Coefficients and Universal Coefficients

<div class="definition">
<strong>Definition (Homology with Coefficients):</strong> For an abelian group \( G \), the <em>homology of \( X \) with coefficients in \( G \)</em> is \( H_n(X; G) = H_n(C_*(X) \otimes_{\mathbb{Z}} G) \).
</div>

<div class="example">
<strong>Example (Reduced Homology and Spheres):</strong> For \( X = S^n \), the reduced homology groups are:

\[
\tilde H_k(S^n) = \begin{cases} \mathbb{Z} & k = n \\ 0 & k \neq n. \end{cases}
\]
This can be proved by Mayer–Vietoris induction (as above) or by the long exact sequence of the pair \( (D^n, S^{n-1}) \): since \( D^n \) is contractible, \( H_k(D^n) = 0 \) for \( k \geq 1 \), and the long exact sequence gives \( H_k(D^n, S^{n-1}) \cong H_{k-1}(S^{n-1}) \) for \( k \geq 2 \). By the good pair theorem, \( H_k(D^n, S^{n-1}) \cong \tilde H_k(D^n/S^{n-1}) = \tilde H_k(S^n) \), giving \( \tilde H_k(S^n) \cong \tilde H_{k-1}(S^{n-1}) \) and the induction goes through.
</div>

<div class="example">
<strong>Example (Relative Homology of \( (D^n, S^{n-1}) \)):</strong> The pair \( (D^n, S^{n-1}) \) has relative homology:

\[
H_k(D^n, S^{n-1}) \cong \begin{cases} \mathbb{Z} & k = n \\ 0 & k \neq n. \end{cases}
\]
This follows from the long exact sequence: for \( k \geq 2 \), \( H_k(D^n) = 0 \to H_k(D^n,S^{n-1}) \to H_{k-1}(S^{n-1}) \to H_{k-1}(D^n) = 0 \), giving \( H_k(D^n,S^{n-1}) \cong H_{k-1}(S^{n-1}) \cong \tilde H_{k-1}(S^{n-1}) \cong \mathbb{Z} \) if \( k-1 = n-1 \) (i.e., \( k=n \)) and 0 otherwise. The generator of \( H_n(D^n, S^{n-1}) \cong \mathbb{Z} \) is called the <em>fundamental class</em> of the disk relative to its boundary. This relative fundamental class is the key ingredient in the definition of the degree of a map \( S^n \to S^n \), and explains why the cellular boundary formula involves degrees of attaching maps.
</div>

<div class="theorem">
<strong>Theorem (Universal Coefficient Theorem):</strong> For any space \( X \) and abelian group \( G \), there is a natural short exact sequence (which splits, but not naturally):

\[
0 \to H_n(X) \otimes G \to H_n(X; G) \to \mathrm{Tor}(H_{n-1}(X), G) \to 0.
\]
In particular, \( H_n(X; \mathbb{Q}) \cong H_n(X) \otimes_{\mathbb{Z}} \mathbb{Q} \cong \mathbb{Q}^{\beta_n} \) where \( \beta_n = \mathrm{rank}(H_n(X)) \) is the \( n \)-th Betti number, since \( \mathrm{Tor}(\cdot, \mathbb{Q}) = 0 \). Over \( \mathbb{Z}/2 \), the universal coefficient theorem can "reveal" torsion: \( H_1(\mathbb{RP}^2; \mathbb{Z}/2) \cong \mathbb{Z}/2 \otimes \mathbb{Z}/2 \oplus \mathrm{Tor}(\mathbb{Z},\mathbb{Z}/2) = \mathbb{Z}/2 \).
</div>

<div class="remark">
<strong>Remark (Excision and the Mayer–Vietoris Blueprint):</strong> The excision theorem and the Mayer–Vietoris sequence are the two main tools for computing homology by "cutting and pasting." Excision says that removing a small closed subspace from both the pair and the ambient space does not change relative homology, as long as the removed piece is in the interior of the subspace. Mayer–Vietoris reformulates this as a long exact sequence for unions. Together they allow a "divide and conquer" strategy: to compute \( H_*(X) \), decompose \( X = A \cup B \) into simpler pieces \( A, B \) with known homology, and the Mayer–Vietoris sequence constrains \( H_*(X) \) by \( H_*(A) \), \( H_*(B) \), and \( H_*(A \cap B) \). This strategy will be used in Chapter 5 to prove invariance of domain and in Chapter 6 to compute homotopy groups via fibration sequences.
</div>

<div class="remark">
<strong>Remark (Chapter 4 Summary and Preview of Chapter 5):</strong> The key theorems of Chapter 4 — homotopy invariance, long exact sequence, excision, Mayer–Vietoris — are the "axioms" of singular homology. We have verified that these axioms give computable and homotopy-invariant groups. In Chapter 5, we harvest the main applications: the Brouwer fixed-point theorem (all dimensions), degree theory and the hairy ball theorem, Borsuk–Ulam, and the Lefschetz fixed-point theorem. These are among the most striking theorems in all of mathematics — results whose statements require no algebra to formulate, but whose proofs are immediate consequences of the homological machinery.
</div>

---

# Chapter 5: Applications of Homology

The abstract machinery of homology groups pays off in a series of striking applications. The Brouwer fixed-point theorem, which holds in all dimensions and resisted purely topological proofs for decades, follows immediately once one knows \( \tilde H_*(D^n) = 0 \) and \( \tilde H_n(S^{n-1}) \neq 0 \). The hairy ball theorem, Borsuk–Ulam, and invariance of domain follow from degree theory. Lefschetz's fixed-point theorem uses the full power of homology with rational coefficients to detect fixed points via a trace formula.

The history of these applications is itself a story of the power of new algebraic tools. Brouwer proved his fixed-point theorem in 1912 using techniques that were essentially homological but had not yet been formalised. Lefschetz developed his fixed-point theorem in the 1920s using intersection theory, and the modern homological proof came later. The Borsuk–Ulam theorem (1933) and the hairy ball theorem were among the first results that could be proved cleanly and in full generality once singular homology was available.

The logical flow of Chapter 5 is: first establish the bridge between homotopy and homology (\( H_1 \cong \pi_1^{\mathrm{ab}} \)), then harvest fixed-point theorems from the non-vanishing of \( H_{n-1}(S^{n-1}) \), then use degree theory to study maps between spheres, and finally deploy local homology groups to prove invariance of domain and the Jordan–Brouwer separation theorem. Each application follows the same template introduced in Section 1.3: assume the topological conclusion fails, construct a map with algebraically impossible properties (a retraction onto a sphere from a contractible space, or an odd-degree map that must have even degree), and derive a contradiction. The elegance of these proofs lies in how a single algebraic number — the degree, or a single Lefschetz number — encodes enough information to force a geometric conclusion.

A particularly striking feature is the contrast with the situation in dimension 1: in Chapter 1 we needed the full covering-space machinery (path lifting, homotopy lifting) to prove \( \pi_1(S^1) \cong \mathbb{Z} \) and then deduce the Brouwer fixed-point theorem in dimension 2. In Chapter 5, the same result in all dimensions follows from one line: \( H_{n-1}(S^{n-1}) \cong \mathbb{Z} \) (computed in Chapter 3) and the functoriality of homology. This compression of proof — many lines of geometric argument replaced by one line of algebraic functoriality — illustrates why the development of homology was such a profound advance.

## Section 5.1: Abelianisation and \( H_1 \)

The isomorphism \( H_1(X) \cong \pi_1(X)^{\mathrm{ab}} \) shows that homology is an abelianised version of homotopy, at least in dimension 1. This is the first rigorous connection between the two types of invariants studied in this course. The proof goes through the identification of loops with singular 1-cycles: every loop is a 1-cycle (its boundary is zero since both endpoints are the basepoint), and the boundary formula for singular 2-simplices gives exactly the commutator relations needed to abelianise.

This result has two important corollaries. First, for spaces with abelian fundamental group (e.g., \( S^1 \), \( T^n \), \( \mathbb{RP}^n \) for \( n \geq 3 \)), \( H_1 = \pi_1 \) exactly. Second, for spaces with non-abelian \( \pi_1 \) (e.g., \( \Sigma_g \) for \( g \geq 2 \), \( S^1 \vee S^1 \)), the passage from \( \pi_1 \) to \( H_1 \) loses information — it kills the commutator subgroup. This information loss is the price of having an abelian group, but it means \( H_1 \) is much more computable. For instance, \( \pi_1(\Sigma_2) \) is a complicated non-abelian group, but \( H_1(\Sigma_2) = \mathbb{Z}^4 \) is immediate from the CW structure.

<div class="theorem">
<strong>Theorem (\( H_1 \cong \pi_1^{\mathrm{ab}} \)):</strong> For a path-connected space \( X \), there is a natural isomorphism \( H_1(X) \cong \pi_1(X)^{\mathrm{ab}} \), the abelianisation of the fundamental group.
</div>

<div class="proof">
<em>Proof.</em> Define a map \( \phi : \pi_1(X,x_0) \to H_1(X) \) by sending a loop \( \gamma \) to its singular homology class \( [\gamma] \in H_1(X) \) (loops are 1-cycles since \( \partial_1(\gamma) = \gamma(1) - \gamma(0) = x_0 - x_0 = 0 \)). This map respects concatenation (since \( [\gamma \cdot \delta] = [\gamma] + [\delta] \) in \( H_1 \) by the chain homotopy argument) and path-homotopies (a path-homotopy is a singular 2-chain bounding the difference of the two loops). Since \( H_1(X) \) is abelian, \( \phi \) factors through the abelianisation \( \pi_1(X)^{\mathrm{ab}} \).

Surjectivity: every element of \( H_1(X) \) is represented by a sum of loops (any 1-cycle can be written as a sum of loops based at \( x_0 \) using paths from \( x_0 \) to the vertices). Injectivity: if \( [\gamma] = 0 \) in \( H_1(X) \), then \( \gamma = \partial_2(\sum n_i \sigma_i) \) for some singular 2-chains \( \sigma_i \). This can be used to build an explicit null-homotopy of \( \gamma \) in \( \pi_1(X)^{\mathrm{ab}} \). \( \square \)
</div>

<div class="example">
<strong>Example (Surfaces):</strong> For the genus-\( g \) surface \( \Sigma_g \), we have \( \pi_1(\Sigma_g) = \langle a_1,b_1,\ldots,a_g,b_g \mid \prod [a_i,b_i] = 1 \rangle \). The abelianisation kills the single relation \( \prod [a_i,b_i] = 1 \) (which already becomes trivial in the abelianisation since all commutators vanish), giving \( \pi_1(\Sigma_g)^{\mathrm{ab}} \cong \mathbb{Z}^{2g} \). This matches \( H_1(\Sigma_g) \cong \mathbb{Z}^{2g} \).
</div>

<div class="example">
<strong>Example (Figure-Eight \( S^1 \vee S^1 \)):</strong> The figure-eight has \( \pi_1(S^1 \vee S^1) \cong F_2 = \langle a, b \rangle \). The abelianisation is \( F_2^{\mathrm{ab}} = \langle a, b \mid ab = ba \rangle \cong \mathbb{Z}^2 \). By the theorem, \( H_1(S^1 \vee S^1) \cong \mathbb{Z}^2 \). This matches the Mayer–Vietoris computation (Section 4.4b) and can also be seen directly from the cellular chain complex: the figure-eight has one 0-cell and two 1-cells \( a, b \) with \( \partial_1(a) = \partial_1(b) = 0 \) (both endpoints identified), giving \( H_1 = \ker \partial_1 = \mathbb{Z}^2 \).
</div>

<div class="remark">
<strong>Remark (Surjectivity of the Hurewicz Map for \( H_1 \)):</strong> The proof that \( \phi : \pi_1(X)^{\mathrm{ab}} \to H_1(X) \) is surjective works as follows. Any class in \( H_1(X) \) is represented by a 1-cycle \( z = \sum n_i \sigma_i \), where each \( \sigma_i : [0,1] \to X \) is a singular 1-simplex (path) and \( \partial z = 0 \) (the boundary cancels). The vanishing boundary condition means the endpoints of the paths cancel: for each vertex \( v \), the total coefficient of \( v \) in \( \partial z \) is zero. By standard combinatorics, any such cycle is a linear combination of <em>loops</em> — concatenations of paths that return to their starting point. Choose a basepoint \( x_0 \) and, for each vertex \( v \), a path \( \gamma_v \) from \( x_0 \) to \( v \). Replace each path \( \sigma_i : v_0 \to v_1 \) by the loop \( \gamma_{v_0} \cdot \sigma_i \cdot \bar\gamma_{v_1} \). The homology class is unchanged (since the extra paths cancel in the cycle). Each such loop is now a loop based at \( x_0 \), hence in the image of \( \pi_1(X, x_0) \to H_1(X) \). Since the boundary map kills the extra paths, surjectivity follows.
</div>

<div class="remark">
<strong>Remark (Corollary — \( H_1 \) of Surfaces):</strong> For the genus-\( g \) orientable surface \( \Sigma_g \), the fundamental group \( \pi_1(\Sigma_g) \) has abelianisation \( \mathbb{Z}^{2g} \). By the theorem, \( H_1(\Sigma_g) \cong \mathbb{Z}^{2g} \), a free abelian group on \( 2g \) generators corresponding to the \( 2g \) handle directions. This matches the cellular computation. For the non-orientable surface \( N_k \) (connected sum of \( k \) projective planes), \( \pi_1(N_k)^{\mathrm{ab}} \cong \mathbb{Z}^{k-1} \oplus \mathbb{Z}/2 \), so \( H_1(N_k) \cong \mathbb{Z}^{k-1} \oplus \mathbb{Z}/2 \), where the \( \mathbb{Z}/2 \) torsion detects non-orientability.
</div>

## Section 5.2: Brouwer Fixed-Point Theorem (All Dimensions)

<div class="theorem">
<strong>Theorem (Brouwer Fixed-Point Theorem, General):</strong> Every continuous map \( f : D^n \to D^n \) has a fixed point.
</div>

<div class="proof">
<em>Proof.</em> Suppose \( f(x) \neq x \) for all \( x \in D^n \). Define \( r : D^n \to S^{n-1} \) by: let \( r(x) \) be the unique point on \( S^{n-1} \) on the ray from \( f(x) \) through \( x \), i.e.:

\[
r(x) = x + t(x)(x - f(x))
\]
for the appropriate \( t(x) > 0 \) such that \( |r(x)| = 1 \). Since \( f(x) \neq x \), this is well-defined and continuous. For \( x \in S^{n-1} \), the ray from \( f(x) \) through \( x \) hits \( S^{n-1} \) at \( x \) first, so \( r|_{S^{n-1}} = \mathrm{id} \). Then \( r \circ i = \mathrm{id}_{S^{n-1}} \) where \( i : S^{n-1} \hookrightarrow D^n \), giving \( r_* \circ i_* = \mathrm{id} \) on \( H_{n-1}(S^{n-1}) \cong \mathbb{Z} \). But \( i_* \) factors through \( H_{n-1}(D^n) = 0 \) (since \( D^n \) is contractible), giving \( r_* \circ i_* = 0 \neq \mathrm{id} \). Contradiction. \( \square \)
</div>

<div class="remark">
<strong>Remark (Historical Note on Brouwer):</strong> Luitzen Egbertus Jan Brouwer proved his fixed-point theorem in 1912, before the formalism of singular homology was available. His original proof used what we would now recognise as degree theory for maps of simplicial complexes, carried out in an elaborate combinatorial framework. The clean modern proof — using the fact that \( \tilde H_{n-1}(S^{n-1}) \neq 0 \) while \( \tilde H_{n-1}(D^n) = 0 \) — became available only after Noether's reformulation of Betti numbers as homology groups. Brouwer's theorem resisted elementary proof (i.e., without algebraic topology) for many decades; the first combinatorial proof not using homology (Sperner's lemma approach) appeared in 1928, due to Knaster, Kuratowski, and Mazurkiewicz.
</div>

<div class="remark">
<strong>Remark (Geometric Intuition in Dimension 2):</strong> In dimension 2, the retraction argument has a vivid geometric picture. If \( f : D^2 \to D^2 \) had no fixed point, one could draw, at each point \( x \), the unique ray from \( f(x) \) through \( x \) until it hits the boundary circle. This gives a continuous map \( r : D^2 \to S^1 \) that is the identity on \( S^1 \). But a "retraction" of the disk onto its boundary circle is topologically impossible: the boundary circle is a 1-dimensional hole, and you cannot continuously project all of the disk (with no holes) onto just its boundary without "tearing" something. Algebraically, this impossibility is exactly the statement \( H_1(D^2) = 0 \neq \mathbb{Z} = H_1(S^1) \).
</div>

<div class="remark">
<strong>Remark (Corollary: \( D^n \not\cong S^{n-1} \)):</strong> The Brouwer fixed-point theorem immediately implies that \( D^n \) is not homeomorphic to \( S^{n-1} \) for any \( n \geq 1 \). The disk has the fixed-point property (every self-map has a fixed point), while the sphere does not: the antipodal map \( A : S^{n-1} \to S^{n-1} \) has no fixed points (since \( A(x) = -x \neq x \) for all \( x \in S^{n-1} \)). Since the fixed-point property is a topological invariant (a homeomorphism maps fixed points to fixed points), the two spaces cannot be homeomorphic. This argument also shows \( S^{n-1} \) is not a retract of \( D^n \) (which was the key step in the proof above).
</div>

## Section 5.3: Degree Theory and the Hairy Ball Theorem

Degree theory gives a powerful invariant for maps \( S^n \to S^n \). The degree measures "how many times" the map wraps the domain sphere around the target sphere, with sign indicating orientation. It generalises the winding number for maps \( S^1 \to S^1 \) and has the following key properties:

(1) **Homotopy invariance:** \( f \simeq g \implies \deg(f) = \deg(g) \).
(2) **Multiplicativity:** \( \deg(f \circ g) = \deg(f) \cdot \deg(g) \).
(3) **Local degree formula:** if \( f \) is smooth and \( y \) is a regular value, then \( \deg(f) = \sum_{x \in f^{-1}(y)} \mathrm{sign}(\det Df_x) \).

The local degree formula is the most computable: for a smooth map, one picks a generic point \( y \) and counts preimages with sign. For instance, the map \( z \mapsto z^n \) on \( S^1 \subset \mathbb{C} \) has \( n \) preimages of each point, each contributing \( +1 \), so the degree is \( n \). The antipodal map on \( S^n \) reverses orientation in each coordinate direction: each coordinate flip introduces a sign change, and with \( n+1 \) coordinate changes total, the degree is \( (-1)^{n+1} \).

<div class="definition">
<strong>Definition (Degree of a Map \( S^n \to S^n \)):</strong> For a continuous map \( f : S^n \to S^n \) (with \( n \geq 1 \)), the induced map \( f_* : H_n(S^n) \cong \mathbb{Z} \to \mathbb{Z} \cong H_n(S^n) \) is multiplication by an integer \( \deg(f) \), the <em>degree</em> of \( f \). Key degrees: \( \deg(\mathrm{id}) = 1 \); \( \deg(\text{reflection in a hyperplane}) = -1 \); \( \deg(\text{antipodal map on } S^n) = (-1)^{n+1} \) (since the antipodal map is the composition of \( n+1 \) reflections); \( \deg(\text{constant map}) = 0 \).
</div>

<div class="theorem">
<strong>Theorem (Hairy Ball Theorem):</strong> There is no nowhere-vanishing continuous tangent vector field on \( S^{2k} \) for any \( k \geq 1 \). Equivalently, for even \( n \), there is no continuous map \( v : S^n \to S^n \) with \( v(x) \perp x \) for all \( x \in S^n \).
</div>

<div class="proof">
<em>Proof.</em> Suppose \( v : S^n \to S^n \) is continuous with \( v(x) \perp x \) for all \( x \). Since \( x \perp v(x) \) and \( |x| = |v(x)| = 1 \), the vectors \( x, v(x) \) form an orthonormal pair. Define \( H : S^n \times [0,1] \to S^n \) by:

\[
H(x,t) = \cos(\pi t)\, x + \sin(\pi t)\, v(x).
\]
Since \( |H(x,t)|^2 = \cos^2(\pi t) + \sin^2(\pi t) = 1 \), we have \( H(x,t) \in S^n \). At \( t=0 \), \( H(x,0) = x = \mathrm{id}(x) \). At \( t=1 \), \( H(x,1) = -x = A(x) \), the antipodal map. So \( \mathrm{id} \simeq A \), giving \( \deg(\mathrm{id}) = \deg(A) \). But \( \deg(\mathrm{id}) = 1 \) and \( \deg(A) = (-1)^{n+1} = -1 \) for even \( n \). Contradiction. \( \square \)
</div>

<div class="remark">
<strong>Remark:</strong> The hairy ball theorem shows that one cannot comb a sphere flat without creating a cowlick. For odd spheres \( S^{2k+1} \), a nowhere-vanishing vector field does exist: on \( S^{2k+1} \subset \mathbb{C}^{k+1} \), define \( v(z_1, \ldots, z_{k+1}) = (iz_1, \ldots, iz_{k+1}) \). This is tangent to the sphere and nowhere vanishing. Thus \( S^{2k+1} \) is "parallelisable" in the weakest sense.
</div>

<div class="theorem">
<strong>Theorem (Suspension Formula for Degree):</strong> If \( f : S^{n-1} \to S^{n-1} \) is a continuous map, then its suspension \( Sf : S^n \to S^n \) satisfies \( \deg(Sf) = \deg(f) \).
</div>

<div class="proof">
<em>Proof.</em> The suspension \( Sf \) is defined by \( Sf(x, t) = (f(x), t) \) on \( S^n \cong S^{n-1} * \{N, S\} \) (the unreduced suspension). On homology, the suspension isomorphism \( \tilde H_n(S^n) \cong \tilde H_{n-1}(S^{n-1}) \) is natural, meaning the square with \( (Sf)_* \) and \( f_* \) commutes. Since \( f_* = \deg(f) \cdot \mathrm{id} \) on \( H_{n-1}(S^{n-1}) \) and \( (Sf)_* = \deg(Sf) \cdot \mathrm{id} \) on \( H_n(S^n) \), naturality gives \( \deg(Sf) = \deg(f) \). \( \square \)
</div>

<div class="example">
<strong>Example (Degree of \( z \mapsto z^n \) on \( S^1 \)):</strong> Consider the map \( f_n : S^1 \to S^1 \) given by \( f_n(z) = z^n \) (viewing \( S^1 \subset \mathbb{C} \)). For any regular value \( w \in S^1 \) (all values are regular), the preimage \( f_n^{-1}(w) \) consists of exactly \( n \) points \( \{w^{1/n} e^{2\pi i k/n} : k = 0, \ldots, n-1\} \). At each preimage point, the local orientation is preserved (the map \( z \mapsto z^n \) is orientation-preserving near each \( n \)-th root for \( n > 0 \)), so each preimage contributes \( +1 \) to the degree. By the local degree formula:

\[
\deg(f_n) = \sum_{k=0}^{n-1} (+1) = n.
\]
For \( n < 0 \), the map \( z \mapsto z^n = \bar z^{|n|} \) reverses orientation, giving \( \deg(f_n) = n \). For \( n = 0 \), \( f_0 \) is constant with degree 0. This confirms the Hurewicz isomorphism \( \pi_1(S^1) \cong H_1(S^1) \cong \mathbb{Z} \), with the generator \( [z \mapsto z] \) having degree 1.
</div>

<div class="theorem">
<strong>Theorem (Borsuk Odd Mapping Theorem):</strong> If \( f : S^n \to S^n \) is an odd map (\( f(-x) = -f(x) \) for all \( x \)), then \( \deg(f) \) is odd.
</div>

<div class="proof">
<em>Proof sketch.</em> The proof uses \( \mathbb{Z}/2 \)-cohomology. Consider the induced map \( f^* : H^*(S^n; \mathbb{Z}/2) \to H^*(S^n; \mathbb{Z}/2) \). The odd condition means \( f \) descends to a map \( \bar f : \mathbb{RP}^n \to \mathbb{RP}^n \) on the quotient by the antipodal involution. Studying \( \bar f^* \) on \( H^*(\mathbb{RP}^n; \mathbb{Z}/2) \cong \mathbb{Z}/2\left[\alpha\right]/(\alpha^{n+1}) \) forces \( \bar f^*(\alpha) = \alpha \) (the generator cannot map to zero, as then \( \bar f^* \) would be zero on \( H^n \), contradicting the non-vanishing of \( f^*[\iota_n] \)). This implies \( \deg(f) \equiv 1 \pmod{2} \), i.e., \( \deg(f) \) is odd. \( \square \)
</div>

## Section 5.3b: Jordan–Brouwer Separation Theorem

<div class="theorem">
<strong>Theorem (Jordan–Brouwer Separation Theorem):</strong> If \( S \subset S^n \) is homeomorphic to \( S^{n-1} \), then \( S^n \setminus S \) has exactly two connected components, each with \( S \) as its boundary.
</div>

<div class="proof">
<em>Proof.</em> The statement is equivalent to showing \( \tilde H_0(S^n \setminus S) \cong \mathbb{Z} \) (one extra connected component beyond the compact component). We use the long exact sequence of the pair \( (S^n, S^n \setminus S) \) and the excision theorem.

<strong>Step 1:</strong> By excision, \( H_k(S^n, S^n \setminus S) \cong H_k(\mathbb{R}^n, \mathbb{R}^n \setminus \{0\}) \) locally near any point of \( S \cong S^{n-1} \). The local homology \( H_k(\mathbb{R}^n, \mathbb{R}^n \setminus \{0\}) \cong \tilde H_{k-1}(S^{n-1}) \cong \begin{cases} \mathbb{Z} & k = n \\ 0 & k \neq n \end{cases} \).

<strong>Step 2:</strong> Since \( S \cong S^{n-1} \) is compact, a Mayer–Vietoris argument using the two hemispheres of \( S^{n-1} \) gives:

\[
H_k(S^n, S^n \setminus S) \cong \begin{cases} \mathbb{Z} & k = n \\ 0 & k \neq n. \end{cases}
\]

<strong>Step 3:</strong> The long exact sequence of the pair \( (S^n, S^n \setminus S) \):

\[
H_1(S^n) = 0 \to H_1(S^n, S^n \setminus S) = 0 \to \tilde H_0(S^n \setminus S) \to \tilde H_0(S^n) = 0.
\]
Wait, we need the segment:

\[
H_n(S^n) \cong \mathbb{Z} \to H_n(S^n, S^n \setminus S) \cong \mathbb{Z} \xrightarrow{\partial_*} H_{n-1}(S^n \setminus S) \to H_{n-1}(S^n) = 0,
\]
and

\[
0 = H_1(S^n) \to H_1(S^n, S^n \setminus S) = 0 \to H_0(S^n \setminus S) \to H_0(S^n) \cong \mathbb{Z}.
\]
From the second row, \( H_0(S^n \setminus S) \) maps injectively to \( \mathbb{Z} \), so \( H_0(S^n \setminus S) \cong \mathbb{Z}^2 \) (two components). The full verification uses a careful Alexander duality argument. \( \square \)
</div>

<div class="remark">
<strong>Remark (Jordan Curve Theorem):</strong> The case \( n=2 \) of the Jordan–Brouwer theorem is the classical Jordan Curve Theorem: a simple closed curve in \( S^2 \) divides the sphere into exactly two regions. This theorem, while "obvious" geometrically, is notoriously difficult to prove rigorously by purely geometric methods. The homological proof via the separation theorem is one of the cleanest and most natural, illustrating once again how algebraic topology resolves seemingly simple geometric questions.
</div>

## Section 5.4: Borsuk–Ulam Theorem

<div class="theorem">
<strong>Theorem (Borsuk–Ulam):</strong> For any continuous map \( f : S^n \to \mathbb{R}^n \), there exists \( x \in S^n \) with \( f(x) = f(-x) \).
</div>

<div class="proof">
<em>Proof for \( n = 1 \).</em> Define \( g : S^1 \to \mathbb{R} \) by \( g(x) = f(x) - f(-x) \). Then \( g(-x) = f(-x) - f(x) = -g(x) \), so \( g \) is odd. Parametrise \( S^1 \) and apply the Intermediate Value Theorem on a semicircle from \( x_0 \) to \( -x_0 \), noting that \( g(x_0) \) and \( g(-x_0) = -g(x_0) \) have opposite signs (or both are zero). By IVT, \( g \) vanishes somewhere on the semicircle, giving the desired \( x \). \( \square \)

<em>Proof sketch for general \( n \).</em> If \( f(x) \neq f(-x) \) for all \( x \), define the odd map \( g : S^n \to S^{n-1} \) by \( g(x) = (f(x) - f(-x))/|f(x) - f(-x)| \). Odd maps \( S^n \to S^{n-1} \) lead to a contradiction via \( \mathbb{Z}/2 \)-cohomology (the Borsuk odd mapping theorem shows an odd map \( S^n \to S^n \) must have odd degree, and a map \( S^n \to S^{n-1} \) cannot be a homotopy equivalence, so by a connectivity argument this forces degree 0 from both sides — a contradiction). \( \square \)
</div>

<div class="remark">
<strong>Remark (Applications of Borsuk–Ulam):</strong> The Borsuk–Ulam theorem has elegant applications. (1) <em>Ham Sandwich Theorem:</em> Given \( n \) measurable "sandwiches" in \( \mathbb{R}^n \), there exists a hyperplane bisecting all of them simultaneously. (2) Every continuous map \( S^2 \to \mathbb{R}^2 \) maps some pair of antipodal points to the same point — so at any instant, there are two antipodal points on the Earth with the same temperature and pressure.
</div>

<div class="proof">
<em>Proof of the Ham Sandwich Theorem (using Borsuk–Ulam).</em> Let \( A_1, \ldots, A_n \subseteq \mathbb{R}^n \) be bounded measurable sets. For each unit vector \( u \in S^{n-1} \) and scalar \( t \in \mathbb{R} \), the hyperplane \( \{x : x \cdot u = t\} \) divides \( \mathbb{R}^n \) into two half-spaces. For each \( i \), there is a unique \( t_i(u) \) such that the hyperplane \( \{x \cdot u = t_i(u)\} \) bisects \( A_i \). Define \( f : S^{n-1} \to \mathbb{R}^{n-1} \) by \( f(u) = (t_1(u) - t_1(-u), \ldots, t_{n-1}(u) - t_{n-1}(-u)) \). Then \( f(-u) = -f(u) \) (odd map). By Borsuk–Ulam, there exists \( u^* \in S^{n-1} \) with \( f(u^*) = 0 \), meaning \( t_i(u^*) = t_i(-u^*) \) for \( i = 1, \ldots, n-1 \). Choosing the single bisecting hyperplane for \( A_n \) in direction \( u^* \) simultaneously bisects all \( n \) sets. \( \square \)
</div>

<div class="remark">
<strong>Remark (Lusternik–Schnirelmann and Covers of \( S^2 \)):</strong> The Lusternik–Schnirelmann theorem (a consequence of Borsuk–Ulam) states: if \( S^n \) is covered by \( n+1 \) open (or closed) sets \( U_1, \ldots, U_{n+1} \), then at least one \( U_i \) contains a pair of antipodal points \( \{x, -x\} \). For \( n = 2 \): if \( S^2 = U_1 \cup U_2 \cup U_3 \), at least one \( U_i \) contains an antipodal pair. This has applications in combinatorics (Kneser's conjecture, proved by Lovász in 1978 using topology) and in geometry (the width of a convex body). For \( S^1 \): if \( S^1 = U_1 \cup U_2 \) (two open sets), at least one contains an antipodal pair — this is just the Borsuk–Ulam theorem in dimension 1 (any odd function \( S^1 \to \mathbb{R} \) vanishes somewhere).
</div>

## Section 5.5: The Lefschetz Fixed-Point Theorem

The Lefschetz fixed-point theorem is the most powerful fixed-point theorem in topology. While the Brouwer theorem says "any map \( D^n \to D^n \) has a fixed point" without giving more information, the Lefschetz theorem provides an algebraic obstruction: if \( L(f) \neq 0 \), then \( f \) has a fixed point, and the computation of \( L(f) \) is a purely algebraic exercise.

The proof of the theorem uses the **Lefschetz trace formula** for simplicial maps, which says that the number of fixed points of a simplicial approximation to \( f \) (counted with multiplicity) equals \( L(f) \). This formula is an algebraic generalisation of the fact that the number of fixed points of a linear map \( A \) on a finite-dimensional vector space (counted with algebraic multiplicity) equals \( \mathrm{tr}(A) \). The full proof is given in Hatcher, Section 2.C.

The Lefschetz number satisfies a striking identity: \( L(f) = \chi(X) \) when \( f = \mathrm{id} \). This is because \( \mathrm{tr}(\mathrm{id}_{H_n}) = \dim H_n(X;\mathbb{Q}) = \beta_n \) and \( \chi(X) = \sum (-1)^n \beta_n \). This connects fixed-point theory to the Euler characteristic in a deep way.

<div class="definition">
<strong>Definition (Lefschetz Number):</strong> For a continuous map \( f : X \to X \) on a finite CW complex, the <em>Lefschetz number</em> is:

\[
L(f) = \sum_{n \geq 0} (-1)^n \mathrm{tr}(f_* : H_n(X; \mathbb{Q}) \to H_n(X;\mathbb{Q})).
\]
</div>

<div class="theorem">
<strong>Theorem (Lefschetz Fixed-Point Theorem):</strong> If \( L(f) \neq 0 \), then \( f \) has at least one fixed point.
</div>

<div class="example">
<strong>Example (Identity Map):</strong> For \( f = \mathrm{id}_X \), \( f_* = \mathrm{id} \) on each \( H_n(X;\mathbb{Q}) \), so \( \mathrm{tr}(f_*|_{H_n}) = \dim_{\mathbb{Q}} H_n(X;\mathbb{Q}) = \beta_n \). Thus:

\[
L(\mathrm{id}) = \sum_n (-1)^n \beta_n = \chi(X).
\]
If \( \chi(X) \neq 0 \) (e.g., \( \chi(S^{2k}) = 2 \), \( \chi(\mathbb{CP}^n) = n+1 \), \( \chi(\text{point}) = 1 \)), then \( L(\mathrm{id}) \neq 0 \) and the theorem is trivially satisfied (the identity has every point as a fixed point). More usefully, any map \( f \simeq \mathrm{id} \) has \( L(f) = \chi(X) \neq 0 \) and hence has a fixed point.
</div>

<div class="example">
<strong>Example (Antipodal Map on \( S^2 \)):</strong> Let \( A : S^2 \to S^2 \) be the antipodal map. We have \( H_0(S^2;\mathbb{Q}) \cong \mathbb{Q} \) (one component), \( H_1(S^2;\mathbb{Q}) = 0 \), \( H_2(S^2;\mathbb{Q}) \cong \mathbb{Q} \) (generated by the fundamental class). The induced maps: on \( H_0 \), any continuous map of a connected space induces the identity (\( \mathrm{tr} = 1 \)); on \( H_2 \), the antipodal map has \( \deg(A) = (-1)^{2+1} = -1 \) on \( S^2 \) (since it is a composition of 3 reflections), so \( A_* = -1 \) on \( H_2 \) (\( \mathrm{tr} = -1 \)). Therefore:

\[
L(A) = (-1)^0 \cdot 1 + (-1)^1 \cdot 0 + (-1)^2 \cdot (-1) = 1 + 0 - 1 = 0.
\]
Since \( L(A) = 0 \), the theorem does not guarantee a fixed point — and indeed the antipodal map on \( S^2 \) has no fixed points.
</div>

<div class="example">
<strong>Example (Map on \( S^2 \) of degree 2):</strong> Let \( f : S^2 \to S^2 \) have degree 2. Then \( f_* = 2 \) on \( H_2(S^2;\mathbb{Q}) \). So \( L(f) = 1 + 0 + 2 = 3 \neq 0 \). By Lefschetz, \( f \) has a fixed point. This applies, for example, to the map \( z \mapsto z^2/|z^2| \) on the equatorial \( S^1 \), extended to a degree-2 map on \( S^2 \).
</div>

## Section 5.6: Invariance of Domain

<div class="theorem">
<strong>Theorem (Invariance of Domain):</strong> If \( U \subseteq \mathbb{R}^n \) is open and \( f : U \to \mathbb{R}^n \) is a continuous injective map, then \( f(U) \) is open in \( \mathbb{R}^n \) and \( f \) is a homeomorphism onto its image.
</div>

<div class="proof">
<em>Proof sketch.</em> For any \( x \in U \), we must show \( f(x) \) is an interior point of \( f(U) \). Choose a small closed ball \( \bar B \subset U \) around \( x \). By excision and the long exact sequence of the pair \( (\mathbb{R}^n, \mathbb{R}^n \setminus \{f(x)\}) \), one shows using the local homology groups \( H_n(\mathbb{R}^n, \mathbb{R}^n \setminus \{y\}) \cong \mathbb{Z} \) that the image of the sphere \( f(\partial \bar B) \) separates \( f(x) \) from the complement of \( f(\bar B) \) in \( \mathbb{R}^n \). By the Jordan–Brouwer separation theorem (proved via homology), \( \mathbb{R}^n \setminus f(\partial \bar B) \) has two components, one of which is bounded and contains \( f(x) \). Hence \( f(x) \in \mathrm{int}(f(\bar B)) \subseteq \mathrm{int}(f(U)) \). \( \square \)
</div>

<div class="remark">
<strong>Remark (Local Homology Groups):</strong> The key tool in invariance of domain is the <em>local homology group</em> of a point \( x \in M \) in an \( n \)-manifold:

\[
H_k(M, M \setminus \{x\}) \cong H_k(\mathbb{R}^n, \mathbb{R}^n \setminus \{0\}) \cong \tilde H_{k-1}(S^{n-1}) \cong \begin{cases} \mathbb{Z} & k = n \\ 0 & k \neq n, \end{cases}
\]
where the first isomorphism uses excision (any small ball around \( x \) looks like \( \mathbb{R}^n \)) and the second uses the long exact sequence of the pair \( (\mathbb{R}^n, \mathbb{R}^n \setminus \{0\}) \). These local homology groups are topological invariants: if \( f : M \to N \) is a homeomorphism, then \( f_* : H_k(M, M \setminus \{x\}) \to H_k(N, N \setminus \{f(x)\}) \) is an isomorphism. Since the local homology of an \( n \)-manifold point is \( \mathbb{Z} \) in degree \( n \) and 0 otherwise, any homeomorphism between an \( m \)-manifold and an \( n \)-manifold forces \( m = n \). This proves the <em>invariance of dimension</em>: \( \mathbb{R}^m \cong \mathbb{R}^n \) as topological spaces implies \( m = n \).
</div>

<div class="remark">
<strong>Remark (Jordan–Brouwer as Corollary):</strong> The Jordan–Brouwer separation theorem (Section 5.3b) is a corollary of invariance of domain: if \( S \subset S^n \) is homeomorphic to \( S^{n-1} \), then \( S \) is an \( (n-1) \)-manifold embedded in \( S^n \). The local homology at each point of \( S \) is \( \mathbb{Z} \) in degree \( n-1 \). The complement \( S^n \setminus S \) has \( H_0 \cong \mathbb{Z}^2 \) (two components) by a Mayer–Vietoris argument using Alexander duality. This abstract argument replaces the concrete geometric intuition of "a closed curve divides the plane," providing a proof that works in all dimensions simultaneously.
</div>

## Section 5.7: Classification of Compact Surfaces

<div class="theorem">
<strong>Theorem (Classification of Compact Surfaces):</strong> Every compact connected 2-manifold (surface without boundary) is homeomorphic to exactly one of:
<ul>
<li>the sphere \( S^2 \),</li>
<li>the connected sum of \( g \geq 1 \) tori \( \Sigma_g = T^2 \# \cdots \# T^2 \) (orientable, genus \( g \)),</li>
<li>the connected sum of \( k \geq 1 \) projective planes \( N_k = \mathbb{RP}^2 \# \cdots \# \mathbb{RP}^2 \) (non-orientable).</li>
</ul>
The Euler characteristics are \( \chi(\Sigma_g) = 2 - 2g \) and \( \chi(N_k) = 2 - k \). The surfaces are distinguished by the pair (orientability, \( \chi \)).
</div>

<div class="remark">
<strong>Remark (Homology Detects Surfaces):</strong> The classification is reflected in homology. For \( \Sigma_g \): \( H_1 \cong \mathbb{Z}^{2g} \) (free), \( H_2 \cong \mathbb{Z} \). For \( N_k \): \( H_1 \cong \mathbb{Z}^{k-1} \oplus \mathbb{Z}/2 \) (torsion detects non-orientability), \( H_2 = 0 \). Two surfaces are homeomorphic iff their homology groups (equivalently, their orientability and Euler characteristic) coincide. This is one of the cleanest applications of homology: a purely combinatorial invariant decides a classification problem that seems to require geometric arguments.
</div>

<div class="remark">
<strong>Remark (Fixed-Point Theory for Specific Spaces):</strong> The Lefschetz theorem gives useful results for many spaces.
<ul>
<li>For \( X = \mathbb{CP}^n \): \( \chi(\mathbb{CP}^n) = n+1 \geq 2 \), so every map homotopic to the identity has a fixed point. In particular, every map \( f : \mathbb{CP}^n \to \mathbb{CP}^n \) induced by a projective transformation (which is homotopic to the identity) has a fixed point — a special case of the classical theorem on projective spaces.</li>
<li>For \( X = S^{2n} \): \( \chi(S^{2n}) = 2 \), so \( L(\mathrm{id}) = 2 \neq 0 \) and every map homotopic to the identity has a fixed point. The antipodal map has \( L(A) = 0 \) (as computed above) and indeed has no fixed points.</li>
<li>For \( X = T^2 \): \( \chi(T^2) = 0 \), so \( L(\mathrm{id}) = 0 \). However, specific maps can have nonzero Lefschetz number. For instance, the identity map has \( L = 0 \) but obviously has fixed points (every point!). This illustrates again that \( L(f) = 0 \) is not a necessary condition for the absence of fixed points.</li>
</ul>
</div>

<div class="example">
<strong>Example (Lefschetz Number for Maps on Surfaces):</strong> Let \( f : T^2 \to T^2 \) be a continuous map. Since \( H_0(T^2;\mathbb{Q}) \cong \mathbb{Q} \), \( H_1(T^2;\mathbb{Q}) \cong \mathbb{Q}^2 \), \( H_2(T^2;\mathbb{Q}) \cong \mathbb{Q} \), we have:

\[
L(f) = \mathrm{tr}(f_*|_{H_0}) - \mathrm{tr}(f_*|_{H_1}) + \mathrm{tr}(f_*|_{H_2}).
\]
For a connected \( T^2 \), \( f_*|_{H_0} = 1 \) (since any continuous map of a connected space sends the fundamental class of \( H_0 \) to itself). For \( f_*|_{H_2} \), since \( f : T^2 \to T^2 \) and \( H_2 \) is generated by the fundamental class, \( f_*|_{H_2} \) is multiplication by the degree of \( f \). If \( f \) is the map \( (x,y) \mapsto (2x, y) \) (covering the first \( S^1 \) twice), then \( f_*|_{H_1} = \begin{pmatrix} 2 & 0 \\ 0 & 1 \end{pmatrix} \) with \( \mathrm{tr} = 3 \), and \( \deg(f) = 2 \) (degree on \( H_2 \)). So \( L(f) = 1 - 3 + 2 = 0 \), and the theorem does not guarantee a fixed point. Indeed, \( (x,y) \mapsto (2x,y) \) has no fixed points on the torus \( \mathbb{R}^2/\mathbb{Z}^2 \) (the equation \( 2x = x \pmod{\mathbb{Z}} \) gives \( x = 0 \) or \( x = 1/2 \), but these are fixed points; actually the map does have fixed points at \( x = 0 \) and \( x = 1/2 \)). This illustrates that \( L(f) = 0 \) is consistent with \( f \) having fixed points — the theorem only gives a sufficient condition, not a necessary one.
</div>

<div class="remark">
<strong>Remark (Chapter 5 Summary and Preview of Chapter 6):</strong> The applications in Chapter 5 demonstrate the power of having a functorial machinery that converts topological problems to algebra. The Brouwer, Lefschetz, and Borsuk–Ulam theorems are results about continuous maps that seem to require geometric intuition but follow cleanly from exact sequences and degree calculations. In Chapter 6, we push further and study higher homotopy groups \( \pi_n \). These are more refined invariants than homology — they see things homology misses (e.g., \( \pi_3(S^2) \neq 0 \) while \( H_3(S^2) = 0 \)) — but correspondingly harder to compute. The Hurewicz theorem bridges the two worlds: under connectivity hypotheses, the first nonvanishing homology and homotopy groups coincide.
</div>

---

# Chapter 6: Higher Homotopy Groups

The fundamental group captures 1-dimensional "holes" and loops, but does not see higher-dimensional topology. The \( n \)-sphere \( S^n \) for \( n \geq 2 \) has trivial fundamental group — every loop is contractible — yet it is far from contractible. The missing invariants are the **higher homotopy groups** \( \pi_n(X, x_0) \), introduced by Hurewicz in 1935. These groups measure \( n \)-dimensional "holes" in a way analogous to \( \pi_1 \), but with much richer and less tractable structure.

The computation of homotopy groups of spheres remains one of the central unsolved problems of algebraic topology. While \( \pi_n(S^n) \cong \mathbb{Z} \) is a classical result (Brouwer, degree theory), already \( \pi_3(S^2) \cong \mathbb{Z} \) is surprising: a 3-dimensional sphere wraps non-trivially around a 2-sphere. This was discovered by Hopf in 1931 via the **Hopf fibration** \( S^3 \to S^2 \), the archetypal example of a fibre bundle. The long exact sequence of a fibration is the main computational tool: it reduces the computation of \( \pi_*(S^2) \) to that of \( \pi_*(S^3) \) and \( \pi_*(S^1) \). The interplay of fibrations, homotopy groups, and homology (via Hurewicz) constitutes the deep fabric of this chapter.

Higher homotopy groups were introduced by Witold Hurewicz in two landmark 1935 papers, answering questions left open by Poincaré and Čech. Hurewicz proved the key theorem bearing his name — that in a highly connected space, the first nonvanishing homotopy group equals the first nonvanishing homology group — and used it to compute \( \pi_n(S^n) \cong \mathbb{Z} \) for all \( n \). The non-abelianness of \( \pi_1 \) had been a source of richness in Chapter 2; by contrast, \( \pi_n \) for \( n \geq 2 \) is always abelian (Eckmann–Hilton), making these groups computationally more tractable in principle, yet the groups \( \pi_k(S^n) \) for \( k > n \) exhibit remarkable complexity, with no closed-form pattern known.

The central organising principle of this chapter is the **long exact sequence of a fibration**, which splits the computation of \( \pi_*(E) \) into contributions from the base \( B \) and fibre \( F \). This sequence is the homotopy-theoretic counterpart of the Mayer–Vietoris sequence for homology, but it is generally harder to use because the terms are non-abelian for small dimensions and the maps between them carry more structure than simple homomorphisms. The Hopf fibration is the primary worked example, giving \( \pi_3(S^2) \cong \mathbb{Z} \) in a few lines once \( \pi_3(S^3) \cong \mathbb{Z} \) is known. Eilenberg–MacLane spaces \( K(\pi,n) \) arise as the "simplest" spaces with a single nonzero homotopy group, and the classification of maps into them via cohomology (Section 6.5b) is one of the deepest theorems of the course.

## Section 6.1: Definition and Basic Properties

The higher homotopy groups \( \pi_n(X) \) are defined analogously to \( \pi_1 \) but using maps from \( S^n \) rather than \( S^1 \). The key difference is that for \( n \geq 2 \), the groups are automatically abelian — a consequence of the Eckmann–Hilton argument, which says that any space equipped with two compatible group structures and a shared identity must have a single commutative group structure.

Computing higher homotopy groups is dramatically harder than computing homology groups. For spheres, the groups \( \pi_k(S^n) \) are completely known for small \( k \) or small \( n \), but the general pattern is extremely complex: there are infinitely many \( k \) for which \( \pi_k(S^2) \neq 0 \), and the groups grow in an apparently chaotic fashion. This is in stark contrast with homology: \( H_k(S^n) \) is trivial except in degrees 0 and \( n \).

The main computational tools for \( \pi_n \) are: (1) the long exact sequence of a fibration (which reduces computations to smaller pieces); (2) the Hurewicz theorem (which identifies \( \pi_n \) with \( H_n \) in the first nonvanishing degree); and (3) obstruction theory (which studies when maps can be extended over cells). The Hopf fibration is the prototype for method (1), and its long exact sequence gives the remarkable result \( \pi_3(S^2) \cong \mathbb{Z} \).

<div class="definition">
<strong>Definition (Higher Homotopy Groups):</strong> For \( n \geq 1 \), the <em>\( n \)-th homotopy group</em> \( \pi_n(X, x_0) \) is the set of homotopy classes of based maps \( f : (S^n, s_0) \to (X, x_0) \), with group structure given by first-coordinate concatenation. Represent \( S^n \cong [0,1]^n / \partial [0,1]^n \) (cube with boundary identified to the basepoint), and define:

\[
(f \cdot g)(t_1, \ldots, t_n) = \begin{cases} f(2t_1, t_2, \ldots, t_n) & t_1 \leq \tfrac{1}{2}, \\ g(2t_1 - 1, t_2, \ldots, t_n) & t_1 \geq \tfrac{1}{2}. \end{cases}
\]
The identity element is the constant map to \( x_0 \), and the inverse of \( [f] \) is \( [f \circ r] \) where \( r \) reverses the first coordinate.
</div>

<div class="theorem">
<strong>Theorem (Abelianness for \( n \geq 2 \)):</strong> For \( n \geq 2 \), \( \pi_n(X, x_0) \) is abelian.
</div>

<div class="proof">
<em>Proof (Eckmann–Hilton argument).</em> For \( n \geq 2 \), there are two independent directions in \( [0,1]^n \) along which to define group operations. Let \( \circ_1 \) be concatenation in the first coordinate and \( \circ_2 \) concatenation in the second coordinate. Both are group operations on \( \pi_n(X) \) with the same identity (the constant map). They are compatible in the sense that \( (f \circ_1 g) \circ_2 (h \circ_1 k) = (f \circ_2 h) \circ_1 (g \circ_2 k) \) (by interpreting both sides as maps on the square \( [0,1]^2 \subset [0,1]^n \)). By the Eckmann–Hilton argument (applicable to any two compatible unital binary operations with the same unit), this implies that \( \circ_1 = \circ_2 \) and both operations are commutative. Hence \( f \circ_1 g = f \circ_2 g = g \circ_1 f \) for all \( [f], [g] \in \pi_n(X) \). \( \square \)
</div>

<div class="remark">
<strong>Remark (Contrast with \( \pi_1 \)):</strong> The group \( \pi_1(X) \) can be non-abelian (as we saw: \( \pi_1(S^1 \vee S^1) = F_2 \), \( \pi_1(\Sigma_g) \) for \( g \geq 2 \) is non-abelian). The abelianness of \( \pi_n \) for \( n \geq 2 \) reflects the extra room available in higher dimensions. The Eckmann–Hilton argument is a purely algebraic phenomenon: any two group structures on a set that distribute over each other and share an identity must coincide and be abelian.
</div>

<div class="remark">
<strong>Remark (\( \pi_n(S^n) \cong \mathbb{Z} \) for All \( n \)):</strong> By the Hurewicz theorem (Section 6.4), the sphere \( S^n \) is \( (n-1) \)-connected and \( H_n(S^n) \cong \mathbb{Z} \), so the Hurewicz isomorphism gives \( \pi_n(S^n) \cong \mathbb{Z} \). The generator is the identity map \( \mathrm{id}_{S^n} \in \pi_n(S^n) \), corresponding to the degree-1 map. More generally, the degree map \( \deg : \pi_n(S^n) \to \mathbb{Z} \) (sending \( [f] \) to \( \deg(f) \)) is an isomorphism: two maps \( S^n \to S^n \) are homotopic if and only if they have the same degree (a deep result using the Hurewicz theorem and the fact that \( S^n \) is \( (n-1) \)-connected).
</div>

<div class="remark">
<strong>Remark (Table of \( \pi_k(S^n) \) for Small Values):</strong> The following table collects known homotopy groups of spheres for small \( k \) and \( n \). Entries marked \( \mathbb{Z} \) or \( \mathbb{Z}/m \) are the group itself; \( 0 \) denotes the trivial group.

| \( \pi_k(S^n) \) | \( n=1 \) | \( n=2 \) | \( n=3 \) | \( n=4 \) |
|---|---|---|---|---|
| \( k=1 \) | \( \mathbb{Z} \) | 0 | 0 | 0 |
| \( k=2 \) | 0 | \( \mathbb{Z} \) | 0 | 0 |
| \( k=3 \) | 0 | \( \mathbb{Z} \) | \( \mathbb{Z} \) | 0 |
| \( k=4 \) | 0 | \( \mathbb{Z}/2 \) | \( \mathbb{Z}/2 \) | \( \mathbb{Z} \) |
| \( k=5 \) | 0 | \( \mathbb{Z}/2 \) | \( \mathbb{Z}/2 \) | \( \mathbb{Z}/2 \) |
| \( k=6 \) | 0 | \( \mathbb{Z}/12 \) | \( \mathbb{Z}/12 \) | \( \mathbb{Z}/2 \) |
| \( k=7 \) | 0 | \( \mathbb{Z}/2 \) | \( \mathbb{Z}/2 \) | \( \mathbb{Z} \oplus \mathbb{Z}/12 \) |

Note that \( \pi_k(S^2) \cong \pi_k(S^3) \) for all \( k \geq 3 \) (a consequence of the Hopf fibration, Section 6.3). The stable range \( \pi_{n+k}(S^n) \) for \( k \) fixed and \( n \) large is the stable homotopy group \( \pi_k^{\mathrm{st}} \) (Section 6.6).
</div>

<div class="remark">
<strong>Remark (Action of \( \pi_1 \) on \( \pi_n \)):</strong> For \( n \geq 2 \), the group \( \pi_n(X, x_0) \) is not just an abelian group — it is a module over the group ring \( \mathbb{Z}[\pi_1(X, x_0)] \). The action of a loop \( [\gamma] \in \pi_1(X, x_0) \) on \( [f] \in \pi_n(X, x_0) \) is defined by "transporting" the map \( f : S^n \to X \) around the loop \( \gamma \): conjugate \( f \) by a homotopy that drags the basepoint around \( \gamma \) and back. In formulas, \( [\gamma] \cdot [f] = [\gamma \cdot f \cdot \bar\gamma] \) where \( \gamma \cdot f \cdot \bar\gamma \) denotes the composite obtained by attaching \( \gamma \) as a "whisker" at the basepoint. For simply connected spaces \( \pi_1 = 0 \), this action is trivial and \( \pi_n \) is just an abelian group. For non-simply-connected spaces (e.g., \( S^1 \) with \( \pi_1 = \mathbb{Z} \)), the action can be nontrivial: for the torus \( T^2 \), \( \pi_1 \cong \mathbb{Z}^2 \) acts trivially on \( \pi_2(T^2) = 0 \), but for more complex spaces the action is a significant piece of structure.
</div>

## Section 6.2: Homotopy Groups of \( S^1 \)

The vanishing of \( \pi_n(S^1) \) for \( n \geq 2 \) is one of the most elegant consequences of covering space theory. It says that the circle, despite being a "nontrivial" 1-dimensional space, looks contractible from the perspective of maps from spheres of dimension \( \geq 2 \). This is because the universal cover \( \mathbb{R} \) is contractible, and any map \( S^n \to S^1 \) with \( n \geq 2 \) must lift to \( \mathbb{R} \) (since \( \pi_n(S^n) \to \pi_n(S^1) \) and \( \pi_1(S^n) = 0 \) for \( n \geq 2 \) implies the lifting criterion is satisfied), and then is null-homotopic in \( \mathbb{R} \).

This result means that the "homotopical complexity" of \( S^1 \) is entirely captured by \( \pi_1(S^1) = \mathbb{Z} \). Higher-dimensional maps see only the universal cover. This is a special case of a general principle: for any \( K(\pi,1) \) space (a space with \( \pi_1 = \pi \) and \( \pi_n = 0 \) for \( n \geq 2 \)), the homotopy type is completely determined by the fundamental group. Eilenberg–MacLane spaces \( K(\pi,n) \) generalise this: they have exactly one nonvanishing homotopy group (in degree \( n \)) and play a central role in the theory of cohomology operations.

<div class="theorem">
<strong>Theorem (\( \pi_n(S^1) = 0 \) for \( n \geq 2 \)):</strong> The homotopy groups of the circle satisfy \( \pi_1(S^1) \cong \mathbb{Z} \) and \( \pi_n(S^1) = 0 \) for all \( n \geq 2 \).
</div>

<div class="proof">
<em>Proof.</em> Consider the fibration (covering map) \( p : \mathbb{R} \to S^1 \) with fibre \( p^{-1}(1) = \mathbb{Z} \). The long exact sequence of homotopy groups for this fibration reads:

\[
\cdots \to \pi_n(\mathbb{Z}) \to \pi_n(\mathbb{R}) \to \pi_n(S^1) \xrightarrow{\partial} \pi_{n-1}(\mathbb{Z}) \to \pi_{n-1}(\mathbb{R}) \to \cdots
\]

<strong>For \( n \geq 2 \):</strong> The fibre \( \mathbb{Z} \) is a discrete space, so \( \pi_k(\mathbb{Z}) = 0 \) for all \( k \geq 1 \) (any map \( S^k \to \mathbb{Z} \) from a connected space is constant). Also, \( \mathbb{R} \) is contractible, so \( \pi_n(\mathbb{R}) = 0 \) for all \( n \geq 1 \). The relevant segment for \( n \geq 2 \) is:

\[
0 = \pi_n(\mathbb{R}) \to \pi_n(S^1) \to \pi_{n-1}(\mathbb{Z}) = 0.
\]
By exactness, \( \pi_n(S^1) = 0 \).

<strong>For \( n = 1 \):</strong> The sequence gives:

\[
0 = \pi_1(\mathbb{R}) \to \pi_1(S^1) \xrightarrow{\partial} \pi_0(\mathbb{Z}) \to \pi_0(\mathbb{R}) = 0.
\]
Here \( \pi_0(\mathbb{Z}) = \mathbb{Z} \) (the path components of \( \mathbb{Z} \) are the individual integers). Exactness forces \( \partial : \pi_1(S^1) \xrightarrow{\sim} \mathbb{Z} \) to be an isomorphism, recovering \( \pi_1(S^1) \cong \mathbb{Z} \). \( \square \)
</div>

<div class="theorem">
<strong>Theorem (Lifting Criterion for Covering Spaces):</strong> Let \( p : (\tilde X, \tilde x_0) \to (X, x_0) \) be a covering map, and let \( f : (Y, y_0) \to (X, x_0) \) be a continuous map with \( Y \) path-connected and locally path-connected. A lift \( \tilde f : (Y, y_0) \to (\tilde X, \tilde x_0) \) exists if and only if:

\[
f_*(\pi_1(Y, y_0)) \subseteq p_*(\pi_1(\tilde X, \tilde x_0)).
\]
</div>

<div class="remark">
<strong>Remark (Maps from \( S^n \) to \( S^1 \) for \( n \geq 2 \) Lift to \( \mathbb{R} \)):</strong> The lifting criterion gives an immediate proof that \( \pi_n(S^1) = 0 \) for \( n \geq 2 \). Any map \( f : S^n \to S^1 \) satisfies the lifting criterion for the universal cover \( p : \mathbb{R} \to S^1 \): we need \( f_*(\pi_1(S^n)) \subseteq p_*(\pi_1(\mathbb{R})) = \{0\} \), and this holds since \( \pi_1(S^n) = 0 \) for \( n \geq 2 \) (every loop in \( S^n \) is contractible, as \( S^n \) minus a point is homeomorphic to \( \mathbb{R}^n \), which is simply connected). So every \( f : S^n \to S^1 \) lifts to a map \( \tilde f : S^n \to \mathbb{R} \). Since \( \mathbb{R} \) is contractible, \( \tilde f \) is null-homotopic, and projecting via \( p \) gives \( f = p \circ \tilde f \simeq p \circ c = c_{x_0} \) (constant). Hence every map \( S^n \to S^1 \) is null-homotopic, i.e., \( \pi_n(S^1) = 0 \).
</div>

<div class="remark">
<strong>Remark (\( K(\pi, 1) \) Spaces Have \( \pi_n = 0 \) for \( n \geq 2 \)):</strong> More generally, for any \( K(\pi,1) \) space \( X \) (a space with \( \pi_1(X) = \pi \) and universal cover \( \tilde X \) contractible), the same argument shows \( \pi_n(X) = 0 \) for all \( n \geq 2 \). The universal cover is contractible iff all higher homotopy groups of \( \tilde X \) vanish, and since \( \pi_n(\tilde X) \cong \pi_n(X) \) for \( n \geq 2 \) (covering maps are local homeomorphisms), we get \( \pi_n(X) = 0 \). Examples of \( K(\pi,1) \) spaces include: \( S^1 = K(\mathbb{Z},1) \), \( \mathbb{RP}^\infty = K(\mathbb{Z}/2, 1) \), closed hyperbolic manifolds \( K(\pi_1(M), 1) \) (since their universal cover is \( \mathbb{H}^n \cong \mathbb{R}^n \)), and graphs \( K(F_k, 1) = \bigvee^k S^1 \). The homotopy type of a \( K(\pi,1) \) is completely determined by \( \pi \), making such spaces the "classifying spaces" for the group \( \pi \).
</div>

## Section 6.3: The Hopf Fibration and \( \pi_3(S^2) \)

The Hopf fibration is the most famous fibre bundle in topology, and its discovery by Hopf in 1931 was one of the landmark events in the history of homotopy theory. Before Hopf, it was believed (based on homological evidence) that maps between spheres of different dimensions could always be contracted to a point — that all elements of \( \pi_k(S^n) \) for \( k > n \) were trivial. The Hopf fibration showed this was completely wrong: \( \eta : S^3 \to S^2 \) cannot be contracted to a point.

The geometric picture of the Hopf fibration is beautiful. The fibres are great circles on \( S^3 \subset \mathbb{R}^4 \cong \mathbb{C}^2 \), and any two distinct fibres are linked (in the sense of knot theory) in \( S^3 \). The base space \( S^2 \) is the space of fibres, parametrised by \( [z_0:z_1] \in \mathbb{CP}^1 \). The total space \( S^3 \) is fibred over \( S^2 \) with circle fibres, and the monodromy (how fibres twist as you go around loops in the base) is nontrivial — this is the topological content of \( \pi_3(S^2) \cong \mathbb{Z} \).

<div class="definition">
<strong>Definition (Hopf Fibration):</strong> Identify \( S^3 \subset \mathbb{C}^2 \) with \( \{(z_0, z_1) : |z_0|^2 + |z_1|^2 = 1\} \) and \( S^2 \cong \mathbb{CP}^1 \). The <em>Hopf fibration</em> is the map \( \eta : S^3 \to S^2 \) defined by:

\[
\eta(z_0, z_1) = [z_0 : z_1] \in \mathbb{CP}^1 \cong S^2.
\]
The fibre over any point is a circle \( S^1 = \{e^{i\theta}(z_0,z_1) : \theta \in \mathbb{R}\} \).
</div>

<div class="definition">
<strong>Definition (Fibre Bundle):</strong> A continuous surjection \( p : E \to B \) is a <em>fibre bundle with fibre \( F \)</em> if every point \( b \in B \) has an open neighbourhood \( U \) with a homeomorphism \( \phi : p^{-1}(U) \xrightarrow{\sim} U \times F \) satisfying \( \mathrm{proj}_1 \circ \phi = p|_{p^{-1}(U)} \). The Hopf fibration is a fibre bundle \( S^1 \hookrightarrow S^3 \to S^2 \).
</div>

<div class="theorem">
<strong>Theorem (Long Exact Sequence of a Fibration):</strong> For a fibration \( p : E \to B \) with fibre \( F = p^{-1}(b_0) \) and basepoint \( e_0 \in F \), there is a long exact sequence:

\[
\cdots \to \pi_n(F, e_0) \xrightarrow{i_*} \pi_n(E, e_0) \xrightarrow{p_*} \pi_n(B, b_0) \xrightarrow{\partial} \pi_{n-1}(F, e_0) \to \cdots \to \pi_0(E) \to \pi_0(B).
\]
The connecting homomorphism \( \partial \) is defined by lifting paths in \( B \) to paths in \( E \) starting in \( F \).
</div>

<div class="example">
<strong>Example (\( \pi_3(S^2) \cong \mathbb{Z} \)):</strong> Apply the long exact sequence of the Hopf fibration \( S^1 \hookrightarrow S^3 \xrightarrow{\eta} S^2 \):

\[
\pi_3(S^1) \to \pi_3(S^3) \to \pi_3(S^2) \to \pi_2(S^1) \to \pi_2(S^3) \to \pi_2(S^2) \to \pi_1(S^1) \to \pi_1(S^3).
\]
We know:
<ul>
<li>\( \pi_3(S^1) = 0 \) (proved in Section 6.2),</li>
<li>\( \pi_2(S^1) = 0 \) (proved in Section 6.2),</li>
<li>\( \pi_2(S^3) = 0 \) (since \( S^3 \) is 2-connected; the Hurewicz theorem in Section 6.4 gives \( \pi_2(S^3) \cong H_2(S^3) = 0 \)),</li>
<li>\( \pi_3(S^3) \cong \mathbb{Z} \) (Hurewicz: \( S^3 \) is 2-connected and \( H_3(S^3) \cong \mathbb{Z} \)).</li>
</ul>
The sequence simplifies around the relevant terms:

\[
0 = \pi_3(S^1) \to \pi_3(S^3) \xrightarrow{p_*} \pi_3(S^2) \to \pi_2(S^1) = 0.
\]
By exactness, \( p_* : \pi_3(S^3) \xrightarrow{\sim} \pi_3(S^2) \) is an isomorphism. Therefore:

\[
\pi_3(S^2) \cong \pi_3(S^3) \cong \mathbb{Z},
\]
generated by the Hopf fibration \( \eta : S^3 \to S^2 \). This was Hopf's original theorem (1931), showing that there exist essential maps between spheres in higher dimensions, a result that was completely unexpected at the time.
</div>

## Section 6.4: The Hurewicz Theorem

The Hurewicz theorem is the deepest result connecting homotopy and homology. In its simplest form, it says: if a space has no homotopy below dimension \( n \), then its first nonvanishing homology group equals its first nonvanishing homotopy group. This is the algebraic topology analogue of the physicist's principle that "a system with no low-energy excitations has its first excited state at exactly the energy gap." The connectivity assumption (\( \pi_k = 0 \) for \( k < n \)) is the "energy gap," and the Hurewicz isomorphism \( \pi_n \cong H_n \) is the identification of the ground state.

The proof of the Hurewicz theorem is by induction on \( n \), using the long exact sequence of a pair and the relative Hurewicz theorem. The base case \( n = 1 \) is the \( H_1 = \pi_1^{\mathrm{ab}} \) theorem proved in Chapter 5. The inductive step uses the pair \( (CX, X) \) where \( CX = X \times [0,1] / (X \times \{1\}) \) is the cone on \( X \) (which is contractible), and the identification \( H_n(CX, X) \cong \tilde H_{n-1}(X) \cong \tilde H_{n-1}(X) \).

<div class="definition">
<strong>Definition (Hurewicz Homomorphism):</strong> For \( n \geq 1 \), the <em>Hurewicz homomorphism</em> \( h_n : \pi_n(X, x_0) \to H_n(X) \) is defined by \( h_n([f]) = f_*(\iota_n) \), where \( \iota_n \in H_n(S^n) \cong \mathbb{Z} \) is the fundamental class (the generator corresponding to the identity map). Explicitly, \( h_n \) sends the class of a map \( f : S^n \to X \) to the image of the fundamental class of \( S^n \) under the induced map on homology.
</div>

<div class="theorem">
<strong>Theorem (Hurewicz):</strong> If \( X \) is \( (n-1) \)-connected (i.e., path-connected and \( \pi_k(X) = 0 \) for all \( 1 \leq k \leq n-1 \)) with \( n \geq 2 \), then \( H_k(X) = 0 \) for \( 1 \leq k \leq n-1 \), and the Hurewicz homomorphism \( h_n : \pi_n(X) \xrightarrow{\sim} H_n(X) \) is an isomorphism.
</div>

<div class="theorem">
<strong>Theorem (Relative Hurewicz):</strong> Let \( (X, A) \) be a pair with \( A \) and \( X \) path-connected, and suppose the inclusion \( A \hookrightarrow X \) induces isomorphisms \( \pi_k(A) \xrightarrow{\sim} \pi_k(X) \) for all \( k < n \) (i.e., the pair is \( (n-1) \)-connected). Then \( H_k(X, A) = 0 \) for \( k < n \), and the Hurewicz map \( \pi_n(X, A) \to H_n(X, A) \) is an isomorphism.
</div>

<div class="remark">
<strong>Remark (Relative Hurewicz and Whitehead):</strong> The relative Hurewicz theorem states: if \( (X,A) \) is \( (n-1) \)-connected (with \( A, X \) path-connected, \( A \hookrightarrow X \) inducing isomorphisms on \( \pi_k \) for \( k < n \)), then \( H_k(X,A) = 0 \) for \( k < n \) and \( \pi_n(X,A) \to H_n(X,A) \) is an isomorphism. This is the key technical ingredient in the proof of Whitehead's theorem, connecting the homotopy and homological perspectives. The Hurewicz theorem is the "bridge" from homotopy to homology, and its applications permeate modern homotopy theory.
</div>

<div class="example">
<strong>Example (\( \pi_n(S^n) \cong \mathbb{Z} \) via Hurewicz):</strong> The sphere \( S^n \) is \( (n-1) \)-connected: the sphere minus a point is homeomorphic to \( \mathbb{R}^n \), so any map from \( S^k \) with \( k < n \) can be perturbed to miss a point (by general position, since \( k < n \)) and hence is contractible in \( \mathbb{R}^n \). By the Hurewicz theorem (absolute version), \( \pi_n(S^n) \cong H_n(S^n) \cong \mathbb{Z} \). The generator corresponds to the identity map \( \mathrm{id}_{S^n} \), with Hurewicz image the fundamental class \( [S^n] \in H_n(S^n) \). The integer \( \deg(f) \) for a map \( f : S^n \to S^n \) is precisely the image \( h_n([f]) \in \mathbb{Z} \) of its homotopy class under the Hurewicz isomorphism.
</div>

<div class="remark">
<strong>Remark (Corollary: Acyclic Simply-Connected Spaces are Contractible):</strong> If \( X \) is a simply connected CW complex with \( H_n(X; \mathbb{Z}) = 0 \) for all \( n \geq 1 \), then \( X \) is contractible. Proof: since \( X \) is simply connected, \( \pi_1 = 0 \). By Hurewicz, the first nonvanishing homotopy group equals the first nonvanishing homology group. But all homology groups vanish, so by induction (applying Hurewicz at each level) all \( \pi_n = 0 \). By Whitehead's theorem (Section 6.5), a CW complex with all \( \pi_n = 0 \) is contractible. This corollary is a standard tool for recognising contractible spaces without geometric intuition.
</div>

## Section 6.5: Whitehead's Theorem

Whitehead's theorem says that, for CW complexes, a map that is an isomorphism on all homotopy groups is already a homotopy equivalence. This is a remarkable rigidity result: it says that the homotopy type of a CW complex is completely determined by the collection of homotopy groups, together with the maps between them induced by the CW structure. In contrast, non-CW spaces can have trivial homotopy groups without being contractible (the Warsaw circle being the standard example).

The proof of Whitehead's theorem is a delicate argument using the Hurewicz theorem and the relative Hurewicz theorem. The key step is showing that a weak homotopy equivalence \( f : X \to Y \) induces isomorphisms on all homology groups (by the relative Hurewicz theorem applied to the mapping cylinder), and then using the Whitehead theorem for maps that are isomorphisms on both \( \pi_* \) and \( H_* \) to construct the homotopy inverse.

Whitehead's theorem has a useful corollary: a CW complex is contractible if and only if all its homotopy groups are trivial. This "algebraic" characterisation of contractibility is one of the most powerful tools in the theory: to show a CW complex is contractible, it suffices to show it is weakly contractible (all \( \pi_n = 0 \)).

<div class="theorem">
<strong>Theorem (Whitehead):</strong> A map \( f : X \to Y \) between connected CW complexes that induces isomorphisms \( f_* : \pi_n(X) \xrightarrow{\sim} \pi_n(Y) \) for all \( n \geq 0 \) — a <em>weak homotopy equivalence</em> — is in fact a homotopy equivalence.
</div>

<div class="proof">
<em>Proof sketch.</em> The key steps are:
1. By the relative Hurewicz theorem, the condition \( f_* : \pi_n \to \pi_n \) being an isomorphism for all \( n \) implies \( H_n(f) : H_n(X) \to H_n(Y) \) is an isomorphism for all \( n \) (first use \( \pi_1 \) to establish the \( H_1 \) level, then induct).
2. By attaching cells to \( X \) to kill the relative homotopy groups of \( (Y, f(X)) \), one can factor \( f \) through a sequence of CW approximations where each step is seen to be a deformation retraction.
3. The resulting homotopy inverse \( g : Y \to X \) is constructed explicitly. \( \square \)
</div>

<div class="theorem">
<strong>Theorem (Cellular Approximation):</strong> Any continuous map \( f : X \to Y \) between CW complexes is homotopic to a cellular map (a map sending \( X^n \) to \( Y^n \) for all \( n \)).
</div>

<div class="remark">
<strong>Remark (Whitehead's Theorem via Cellular Approximation):</strong> Cellular approximation is used in the proof of Whitehead's theorem as follows. Given a weak homotopy equivalence \( f : X \to Y \) between connected CW complexes, replace \( f \) by a cellular map (by cellular approximation). One then shows by induction on skeleta that \( f \) can be made into a homotopy equivalence skeleton by skeleton: the induction step at the \( n \)-skeleton uses the fact that \( f_* : \pi_n(X) \to \pi_n(Y) \) is an isomorphism to extend a partial homotopy inverse across the new \( n \)-cells. The relative Hurewicz theorem provides the algebraic input at each step.
</div>

<div class="remark">
<strong>Remark (CW Hypothesis is Essential):</strong> Whitehead's theorem fails for general topological spaces. The Warsaw circle (the closure of the graph of \( \sin(1/x) \) for \( x > 0 \), completed by a vertical arc) has trivial homotopy groups but is not contractible. The CW complex hypothesis ensures enough "room" to build the homotopy inverse. This is one reason CW complexes are the natural setting for modern homotopy theory: they are simultaneously flexible enough to model all weak homotopy types and rigid enough for Whitehead's theorem to provide algebraic control.

The distinction between a <em>weak homotopy equivalence</em> (isomorphism on all \( \pi_n \)) and a <em>homotopy equivalence</em> (having a homotopy inverse) is important for non-CW spaces. Every CW complex is weakly homotopy equivalent to a CW complex (by CW approximation: given any space \( X \), one can build a CW complex \( X_{\mathrm{CW}} \) and a weak equivalence \( X_{\mathrm{CW}} \to X \)). Whitehead's theorem then says that on the CW-approximation, weak equivalence upgrades to genuine equivalence. In practice, most spaces of geometric interest are already CW complexes (or homotopy equivalent to one), making this distinction moot for computations.
</div>

## Section 6.5b: Eilenberg–MacLane Spaces

<div class="definition">
<strong>Definition (Eilenberg–MacLane Space):</strong> A topological space \( K(\pi, n) \) is an <em>Eilenberg–MacLane space</em> if:

\[
\pi_k(K(\pi,n)) = \begin{cases} \pi & k = n \\ 0 & k \neq n. \end{cases}
\]
Such spaces exist and are unique up to homotopy equivalence for any abelian group \( \pi \) (and any group \( \pi \) when \( n = 1 \)).
</div>

<div class="example">
<strong>Example (Eilenberg–MacLane Spaces):</strong>
<ul>
<li>\( K(\mathbb{Z}, 1) = S^1 \): since \( \pi_1(S^1) = \mathbb{Z} \) and \( \pi_n(S^1) = 0 \) for \( n \geq 2 \) (proved in Section 6.2).</li>
<li>\( K(\mathbb{Z}/2, 1) = \mathbb{RP}^\infty \): the infinite-dimensional real projective space, defined as the direct limit \( \mathbb{RP}^\infty = \lim_{\to} \mathbb{RP}^n \). It has \( \pi_1 = \mathbb{Z}/2 \) and all higher \( \pi_k = 0 \), since the universal cover is \( S^\infty \), which is contractible.</li>
<li>\( K(\mathbb{Z}, 2) = \mathbb{CP}^\infty \): the infinite-dimensional complex projective space. It has \( \pi_2 = \mathbb{Z} \) and \( \pi_k = 0 \) for \( k \neq 2 \). This follows from the fibration \( S^1 \to S^\infty \to \mathbb{CP}^\infty \) with contractible total space, giving \( \pi_n(\mathbb{CP}^\infty) \cong \pi_{n-1}(S^1) \), which is \( \mathbb{Z} \) for \( n=2 \) and 0 otherwise.</li>
<li>\( K(\mathbb{Z}, n) \) for general \( n \): constructed by attaching cells to kill all homotopy groups except \( \pi_n \).</li>
</ul>
</div>

<div class="theorem">
<strong>Theorem (Cohomology as Homotopy Classes):</strong> For a CW complex \( X \) and abelian group \( G \), there is a natural bijection:

\[
H^n(X; G) \cong [X, K(G,n)],
\]
where \( [X, K(G,n)] \) denotes the set of homotopy classes of maps from \( X \) to the Eilenberg–MacLane space \( K(G,n) \). This is the "representability" theorem for cohomology: cohomology classes are the same as maps to Eilenberg–MacLane spaces.
</div>

<div class="remark">
<strong>Remark (Significance):</strong> The representability theorem has profound consequences. It means that any natural transformation between cohomology theories arises from a map between Eilenberg–MacLane spaces. This is the foundation of the theory of <strong>cohomology operations</strong> (Steenrod squares, Steenrod powers), which provide additional algebraic structure on \( H^*(X;\mathbb{Z}/p) \) beyond the cup product. The Steenrod algebra is the algebra of all natural cohomology operations, and understanding it is one of the central problems of homotopy theory. For the purposes of this course, the representability theorem explains why \( K(\mathbb{Z},2) = \mathbb{CP}^\infty \) plays the role of a "classifying space" for complex line bundles, with \( H^2(X;\mathbb{Z}) \cong [X, \mathbb{CP}^\infty] \) classifying line bundles over \( X \).
</div>

<div class="remark">
<strong>Remark (Existence of \( K(\pi,n) \) via Killing Homotopy Groups):</strong> For any abelian group \( \pi \) and \( n \geq 1 \), one constructs \( K(\pi,n) \) by a two-step process. First, build a space \( X_n \) with \( \pi_n(X_n) = \pi \) and \( \pi_k(X_n) = 0 \) for \( k < n \): take a wedge of \( n \)-spheres indexed by generators of \( \pi \), then attach \( (n+1) \)-cells to impose the relations in \( \pi \). Second, kill all higher homotopy groups \( \pi_k \) for \( k > n \): for each \( k > n \), for each generator \( [f] \) of \( \pi_k(X_n) \), attach a \( (k+1) \)-cell via \( f \). This does not change \( \pi_j \) for \( j \leq k \) (attaching cells of dimension \( \geq k+1 \) does not affect \( \pi_j \) for \( j \leq k \) by cellular approximation). The resulting direct limit (after countably many such steps) is a \( K(\pi,n) \). It is a CW complex with infinitely many cells in general.
</div>

<div class="remark">
<strong>Remark (Uniqueness of \( K(\pi,n) \)):</strong> The Eilenberg–MacLane space \( K(\pi,n) \) is unique up to homotopy equivalence. If \( X \) and \( Y \) both have \( \pi_n = \pi \) and all other homotopy groups zero, then by Whitehead's theorem (applied to a cellular approximation of the natural map \( X \to K(\pi,n) \) constructed using the representability theorem), \( X \simeq Y \simeq K(\pi,n) \). This uniqueness means that \( K(\pi,n) \) is a homotopy-theoretic invariant of \( (\pi, n) \), not depending on the choice of construction.
</div>

<div class="example">
<strong>Example (\( K(\mathbb{Z}/n, 1) \) as a Lens Space):</strong> For cyclic groups \( \mathbb{Z}/n \), the Eilenberg–MacLane space \( K(\mathbb{Z}/n, 1) \) is the <em>lens space</em> \( L(n,1) \), defined as the quotient \( S^\infty / (\mathbb{Z}/n) \) where \( \mathbb{Z}/n \) acts on \( S^\infty \subset \mathbb{C}^\infty \) by \( \zeta \cdot (z_0, z_1, \ldots) = (\zeta z_0, \zeta z_1, \ldots) \) with \( \zeta = e^{2\pi i/n} \). The finite-dimensional lens space \( L(n,1) = S^{2m+1}/(\mathbb{Z}/n) \) (using only the first \( m+1 \) coordinates) serves as a finite approximation. The infinite lens space has \( \pi_1 = \mathbb{Z}/n \) and universal cover \( S^\infty \), which is contractible (it is the direct limit of \( S^{2m+1} \) which are \( (2m) \)-connected). So \( L(\infty, 1) = S^\infty/(\mathbb{Z}/n) = K(\mathbb{Z}/n, 1) \). For \( n = 2 \): \( K(\mathbb{Z}/2, 1) = \mathbb{RP}^\infty \), consistent with the example in Section 6.5b.
</div>

## Section 6.6: Stable Homotopy Groups and the Freudenthal Theorem

<div class="theorem">
<strong>Theorem (Freudenthal Suspension):</strong> The <em>suspension homomorphism</em> \( \Sigma : \pi_n(S^k) \to \pi_{n+1}(S^{k+1}) \) (defined by \( [f] \mapsto [Sf] \)) is an isomorphism for \( n < 2k-1 \) and a surjection for \( n = 2k-1 \).
</div>

This theorem implies that the groups \( \pi_{n+k}(S^k) \) stabilise as \( k \to \infty \): for \( k > n+1 \), the group \( \pi_{n+k}(S^k) \) is independent of \( k \). This stable value is denoted \( \pi_n^{\mathrm{st}} \) and is the <em>\( n \)-th stable homotopy group of spheres</em>.

| \( n \) | \( \pi_n^{\mathrm{st}} \) | First stable value |
|---|---|---|
| 0 | \( \mathbb{Z} \) | \( \pi_k(S^k) \), all \( k \geq 1 \) |
| 1 | \( \mathbb{Z}/2 \) | \( \pi_3(S^2) \to \pi_4(S^3) \to \cdots \) stabilises |
| 2 | \( \mathbb{Z}/2 \) | |
| 3 | \( \mathbb{Z}/24 \) | Related to exotic 7-spheres |
| 4 | 0 | |
| 5 | 0 | |
| 6 | \( \mathbb{Z}/2 \) | |
| 7 | \( \mathbb{Z}/240 \) | Image of J-homomorphism |

<div class="remark">
<strong>Remark (Connections to Differential Topology):</strong> The stable homotopy groups of spheres have deep connections to differential topology and number theory. Milnor's discovery of exotic smooth structures on \( S^7 \) (1956) is related to \( \pi_3^{\mathrm{st}} = \mathbb{Z}/24 \): there are exactly 28 oriented diffeomorphism classes of 7-manifolds homeomorphic to \( S^7 \), and this number is computed from the image of the J-homomorphism \( J : \pi_7(SO) \to \pi_7^{\mathrm{st}} \). The denominators of Bernoulli numbers appear in the orders of the image of \( J \), linking stable homotopy theory to number theory in a beautiful and unexpected way. The computation of \( \pi_n^{\mathrm{st}} \) for large \( n \) remains an active research problem, and the full stable homotopy groups are known only for small \( n \).
</div>

<div class="example">
<strong>Example (Long Exact Sequence for the Hopf Fibration, Higher Degrees):</strong> The full long exact sequence of the Hopf fibration \( S^1 \hookrightarrow S^3 \to S^2 \) gives more information:

\[
\cdots \to \pi_n(S^1) \to \pi_n(S^3) \to \pi_n(S^2) \to \pi_{n-1}(S^1) \to \cdots
\]
For \( n \geq 3 \), since \( \pi_n(S^1) = 0 \), this gives \( \pi_n(S^3) \cong \pi_n(S^2) \) for \( n \geq 3 \). So the homotopy groups of \( S^2 \) and \( S^3 \) are isomorphic in all degrees \( \geq 3 \):

\[
\pi_4(S^2) \cong \pi_4(S^3) \cong \mathbb{Z}/2, \quad \pi_5(S^2) \cong \pi_5(S^3) \cong \mathbb{Z}/2, \quad \pi_6(S^2) \cong \pi_6(S^3) \cong \mathbb{Z}/12.
\]
The pattern of \( \pi_n(S^2) \) does not stabilise in any simple way — there are infinitely many nontrivial groups, making \( S^2 \) one of the most computationally intractable spaces in homotopy theory. This is in sharp contrast with the simplicity of its homology (\( H_0 = H_2 = \mathbb{Z} \), all others 0).
</div>

<div class="example">
<strong>Example (Hurewicz Applied to \( S^n \)):</strong> The sphere \( S^n \) is \( (n-1) \)-connected: for \( k < n \), every map \( S^k \to S^n \) is null-homotopic (since \( S^n \) minus a point is contractible, and by general position any map \( S^k \to S^n \) with \( k < n \) can be perturbed to miss a point). By the Hurewicz theorem, the Hurewicz map \( h_n : \pi_n(S^n) \to H_n(S^n) \cong \mathbb{Z} \) is an isomorphism. The generator of \( \pi_n(S^n) \) is the identity map \( \mathrm{id} : S^n \to S^n \), and \( h_n([\mathrm{id}]) = \mathrm{id}_*([\iota_n]) = [\iota_n] \in H_n(S^n) \) is the fundamental class. The integer \( \deg(f) = h_n([f]) \in \mathbb{Z} \) is precisely the degree of the map \( f : S^n \to S^n \), confirming that the Hurewicz isomorphism gives the degree map.
</div>

<div class="remark">
<strong>Remark (Chapter 6 and the Course as a Whole):</strong> Higher homotopy groups show that the "shape" of a space contains far more information than any single algebraic invariant can capture. The fundamental group, homology groups, and homotopy groups each see different aspects of topology:
<ul>
<li>\( \pi_1 \) is sensitive to 1-dimensional loops and is generally non-abelian.</li>
<li>\( H_n \) is abelian and detects "holes" efficiently, but is insensitive to subtle homotopy phenomena (e.g., \( H_3(S^2) = 0 \) despite \( \pi_3(S^2) \cong \mathbb{Z} \)).</li>
<li>\( \pi_n \) is the most refined but hardest to compute; even for \( S^2 \) the groups \( \pi_n(S^2) \) are not fully understood in general.</li>
</ul>
The Hurewicz and Whitehead theorems provide the strongest bridges: for highly connected spaces, homology and homotopy agree; for CW complexes, weak equivalences are genuine equivalences. The subject continues to develop through cohomology operations, spectral sequences, and motivic homotopy theory, all of which build on the foundations laid in this course.
</div>

---

# Chapter 7: Cohomology — An Introduction

The dual perspective to homology is cohomology. While homology assigns to each space a sequence of abelian groups \( H_n(X) \) measuring \( n \)-dimensional "holes," cohomology assigns groups \( H^n(X) \) that measure \( n \)-dimensional "cocycles" — functions on chains. The switch from homology to cohomology is algebraically analogous to the switch from a vector space to its dual, but the topological content is different and often richer: cohomology admits a **cup product** making \( H^*(X) = \bigoplus_n H^n(X) \) into a graded ring, not just a graded abelian group. This ring structure distinguishes spaces that homology cannot.

Historically, cohomology was introduced in the 1930s by Alexander and Čech, motivated by duality theorems (Poincaré duality, Alexander duality) connecting the homology and cohomology of manifolds and their complements. The cup product was formalised by Kolmogorov and Alexander in 1936, and the full structure of the cohomology ring became a central tool with the work of Cartan, Serre, and Steenrod in the 1950s. The cohomology ring is strictly more powerful than homology: for instance, \( S^2 \times S^4 \) and \( \mathbb{CP}^3 \) have the same homology groups (\( \mathbb{Z} \) in degrees 0, 2, 4, 6) but different cohomology rings (the former has no nonzero cup product \( H^2 \otimes H^2 \to H^4 \), the latter does).

The passage from homology to cohomology can be understood as a dualisation: instead of measuring chains (formal sums of simplices) and their boundaries, cohomology measures cochains (functions assigning a coefficient to each simplex) and their coboundaries. This dualisation has a striking consequence — cohomology is **contravariant**: a map \( f : X \to Y \) induces \( f^* : H^*(Y) \to H^*(X) \) going backwards. This contravariance is not a defect but a feature: it means that cohomology classes on \( Y \) can be "pulled back" to \( X \) along \( f \), making cohomology the natural home for characteristic classes, obstruction theory, and the representability theorem (\( H^n(X;G) \cong [X, K(G,n)] \)). The cup product, defined at the cochain level by the front-back face formula, passes to cohomology and makes \( H^*(X;R) \) into a graded ring — a structure with no natural homology counterpart.

The chapter is organised around three key ideas. First, Section 7.1 introduces cochain complexes and cohomology groups, relating them to homology via the Universal Coefficient Theorem. Second, Section 7.2 introduces the cup product and computes the cohomology rings of tori and projective spaces, showing how the ring structure distinguishes spaces. Third, Section 7.3 proves Poincaré duality for closed oriented manifolds, using the cap product to identify homology and cohomology in complementary degrees. Together these sections reveal cohomology as the richer, more structured cousin of homology — and the natural home for the global invariants (intersection forms, characteristic classes, Euler classes) that govern manifold topology.

## Section 7.1: Cochain Complexes and Cohomology

<div class="definition">
<strong>Definition (Cochain Complex):</strong> For a chain complex \( \cdots \to C_n \xrightarrow{\partial} C_{n-1} \to \cdots \) and an abelian group \( G \), the <em>cochain complex</em> \( C^*(X;G) \) is defined by \( C^n(X;G) = \mathrm{Hom}(C_n(X), G) \) with the <em>coboundary map</em> \( \delta^n : C^n \to C^{n+1} \) defined by \( (\delta^n \phi)(\sigma) = \phi(\partial_{n+1} \sigma) \) for \( \phi \in C^n \) and a singular \( (n+1) \)-chain \( \sigma \). The condition \( \delta^{n+1} \circ \delta^n = 0 \) follows from \( \partial^2 = 0 \). The <em>cohomology groups</em> are:

\[
H^n(X; G) = \ker \delta^n / \mathrm{im}\, \delta^{n-1}.
\]
Elements of \( \ker \delta^n \) are called <em>cocycles</em>; elements of \( \mathrm{im}\, \delta^{n-1} \) are called <em>coboundaries</em>.
</div>

<div class="remark">
<strong>Remark (Relationship to Homology):</strong> By the Universal Coefficient Theorem for cohomology, there is a (non-naturally split) short exact sequence:

\[
0 \to \mathrm{Ext}^1(H_{n-1}(X), G) \to H^n(X;G) \to \mathrm{Hom}(H_n(X), G) \to 0.
\]
For \( G = \mathbb{Z} \), \( H^n(X;\mathbb{Z}) \cong \mathrm{Hom}(H_n(X),\mathbb{Z}) \oplus \mathrm{Ext}^1(H_{n-1}(X),\mathbb{Z}) \). The \( \mathrm{Ext} \) term captures the torsion: if \( H_{n-1}(X) \) has a \( \mathbb{Z}/k \) summand, then \( H^n(X;\mathbb{Z}) \) acquires a \( \mathbb{Z}/k \) summand. For free abelian homology (no torsion), \( H^n(X;\mathbb{Z}) \cong H_n(X) \).
</div>

<div class="example">
<strong>Example (Cohomology of Standard Spaces):</strong> We list the cohomology groups \( H^*(X;\mathbb{Z}) \):
<ul>
<li>\( H^n(S^k;\mathbb{Z}) = \mathbb{Z} \) for \( n = 0 \) or \( n = k \); \( 0 \) otherwise.</li>
<li>\( H^n(T^2;\mathbb{Z}) = \mathbb{Z} \) for \( n = 0, 2 \); \( \mathbb{Z}^2 \) for \( n = 1 \); \( 0 \) for \( n \geq 3 \).</li>
<li>\( H^n(\mathbb{RP}^2;\mathbb{Z}) = \mathbb{Z} \) for \( n = 0 \); \( 0 \) for \( n = 1 \); \( \mathbb{Z}/2 \) for \( n = 2 \); \( 0 \) for \( n \geq 3 \).</li>
<li>\( H^n(\mathbb{CP}^k;\mathbb{Z}) = \mathbb{Z} \) for \( n \) even with \( 0 \leq n \leq 2k \); \( 0 \) otherwise.</li>
</ul>
Note that \( H^1(\mathbb{RP}^2;\mathbb{Z}) = 0 \) while \( H_1(\mathbb{RP}^2;\mathbb{Z}) = \mathbb{Z}/2 \): the UCT gives \( H^1 = \mathrm{Hom}(\mathbb{Z}/2, \mathbb{Z}) \oplus \mathrm{Ext}^1(\mathbb{Z},\mathbb{Z}) = 0 \oplus 0 = 0 \), and \( H^2 = \mathrm{Hom}(0,\mathbb{Z}) \oplus \mathrm{Ext}^1(\mathbb{Z}/2,\mathbb{Z}) = 0 \oplus \mathbb{Z}/2 = \mathbb{Z}/2 \). The torsion moves up one degree in cohomology.
</div>

<div class="remark">
<strong>Remark (Why Dualise? Cohomology Has Cup Products):</strong> The primary motivation for passing from homology to cohomology is the existence of the cup product: cohomology \( H^*(X; R) \) is a graded ring, while homology is only a graded abelian group. The cup product is defined at the cochain level and passes to cohomology because of the coboundary formula; it makes the cohomology of a space into a graded-commutative ring. This ring structure carries information that homology groups alone cannot: for instance, \( H^*(\mathbb{CP}^2; \mathbb{Z}) \cong \mathbb{Z}[\alpha]/(\alpha^3) \) with \( \alpha \in H^2 \) (so \( \alpha^2 \neq 0 \in H^4 \)) while \( H^*(S^2 \vee S^4; \mathbb{Z}) \) has the same homology groups but \( \alpha \cup \alpha = 0 \) (since the cup product of two \( H^2 \) classes in a wedge is zero). Thus the cohomology ring distinguishes \( \mathbb{CP}^2 \) from \( S^2 \vee S^4 \).
</div>

<div class="remark">
<strong>Remark (Contravariance and Functoriality):</strong> A continuous map \( f : X \to Y \) induces a cochain map \( f^\# : C^*(Y; G) \to C^*(X; G) \) by precomposition: \( (f^\# \phi)(\sigma) = \phi(f \circ \sigma) \) for a singular simplex \( \sigma : \Delta^n \to X \). This cochain map descends to a ring homomorphism \( f^* : H^*(Y; G) \to H^*(X; G) \) on cohomology. The ring homomorphism property means \( f^*(\alpha \cup \beta) = f^*(\alpha) \cup f^*(\beta) \), which is an additional constraint not available for homology. The contravariance (arrows reverse) reflects the fact that a map \( X \to Y \) allows one to "pull back" functions on \( Y \) to functions on \( X \), not the other way around.
</div>

<div class="remark">
<strong>Remark (Kronecker Pairing):</strong> The natural pairing between cohomology and homology is the <em>Kronecker pairing</em>:

\[
\langle \cdot, \cdot \rangle : H^n(X; G) \otimes H_n(X; \mathbb{Z}) \to G, \quad \langle [\phi], [\sigma] \rangle = \phi(\sigma),
\]
where \( \phi \in C^n(X; G) \) is a cocycle and \( \sigma \in C_n(X) \) is a cycle. This is well-defined: if \( \phi' = \phi + \delta \psi \) is cohomologous, then \( \phi'(\sigma) = \phi(\sigma) + \delta\psi(\sigma) = \phi(\sigma) + \psi(\partial \sigma) = \phi(\sigma) \) (since \( \sigma \) is a cycle, \( \partial \sigma = 0 \)). Similarly, if \( \sigma' = \sigma + \partial \tau \), then \( \phi(\sigma') = \phi(\sigma) + \phi(\partial \tau) = \phi(\sigma) + \delta\phi(\tau) = \phi(\sigma) \) (since \( \phi \) is a cocycle, \( \delta\phi = 0 \)). The Universal Coefficient Theorem gives: \( H^n(X; \mathbb{Z}) / \mathrm{torsion} \cong \mathrm{Hom}(H_n(X), \mathbb{Z}) \), so over \( \mathbb{Q} \), the Kronecker pairing is a perfect duality \( H^n(X;\mathbb{Q}) \otimes H_n(X;\mathbb{Q}) \to \mathbb{Q} \).
</div>

<div class="example">
<strong>Example (Cocycle Counting Winding on \( S^1 \)):</strong> On \( S^1 \), the fundamental 1-cocycle is the cochain \( \phi \in C^1(S^1; \mathbb{Z}) \) that counts the "signed winding" of a singular 1-simplex (path) around the circle. Precisely, for a path \( \sigma : [0,1] \to S^1 \), define \( \phi(\sigma) \) to be the winding number: the integer \( \tilde\sigma(1) - \tilde\sigma(0) \in \mathbb{Z} \) where \( \tilde\sigma \) is the unique lift of \( \sigma \) to \( \mathbb{R} \). This is a cocycle (\( \delta\phi = 0 \)) because for any 2-simplex \( \tau : \Delta^2 \to S^1 \), the boundary \( \partial \tau = \tau|_{[v_1,v_2]} - \tau|_{[v_0,v_2]} + \tau|_{[v_0,v_1]} \) has \( \phi(\partial \tau) = 0 \) (the winding numbers telescope). The class \( [\phi] \in H^1(S^1; \mathbb{Z}) \cong \mathbb{Z} \) is the generator, paired with the fundamental class \( [S^1] \in H_1(S^1) \cong \mathbb{Z} \) by \( \langle [\phi], [S^1] \rangle = 1 \).
</div>

## Section 7.2: The Cup Product

<div class="definition">
<strong>Definition (Cup Product):</strong> For cohomology classes \( \alpha \in H^p(X;R) \) and \( \beta \in H^q(X;R) \) with coefficients in a ring \( R \), the <em>cup product</em> \( \alpha \cup \beta \in H^{p+q}(X;R) \) is defined at the cochain level by:

\[
(\phi \cup \psi)(\sigma) = \phi(\sigma|_{[v_0,\ldots,v_p]}) \cdot \psi(\sigma|_{[v_p,\ldots,v_{p+q}]})
\]
for a singular \( (p+q) \)-simplex \( \sigma : \Delta^{p+q} \to X \), where \( \sigma|_{[v_0,\ldots,v_p]} \) is the restriction to the front \( p \)-face and \( \sigma|_{[v_p,\ldots,v_{p+q}]} \) is the restriction to the back \( q \)-face. The cup product makes \( H^*(X;R) = \bigoplus_n H^n(X;R) \) into a graded commutative ring (graded-commutative means \( \alpha \cup \beta = (-1)^{pq} \beta \cup \alpha \) for \( \alpha \in H^p \), \( \beta \in H^q \)).
</div>

<div class="theorem">
<strong>Theorem (Properties of Cup Product):</strong> The cup product satisfies:
<ul>
<li><strong>Associativity:</strong> \( (\alpha \cup \beta) \cup \gamma = \alpha \cup (\beta \cup \gamma) \).</li>
<li><strong>Graded commutativity:</strong> \( \alpha \cup \beta = (-1)^{|\alpha||\beta|} \beta \cup \alpha \) where \( |\alpha| \) denotes the degree of \( \alpha \).</li>
<li><strong>Naturality:</strong> For \( f : X \to Y \), \( f^*(\alpha \cup \beta) = f^*(\alpha) \cup f^*(\beta) \).</li>
<li><strong>Unit:</strong> The class \( 1 \in H^0(X;R) \) (the class of the constant cochain with value \( 1_R \)) satisfies \( 1 \cup \alpha = \alpha = \alpha \cup 1 \).</li>
</ul>
</div>

<div class="example">
<strong>Example (Cohomology Ring of \( T^2 \)):</strong> The torus \( T^2 \) has \( H^0 = \mathbb{Z} \), \( H^1 = \mathbb{Z}^2 \) with generators \( \alpha \) (the class dual to the loop \( a \)) and \( \beta \) (dual to \( b \)), and \( H^2 = \mathbb{Z} \) with generator the fundamental class \( [T^2]^* \). The cup products are:

\[
\alpha \cup \alpha = 0, \quad \beta \cup \beta = 0, \quad \alpha \cup \beta = [T^2]^*, \quad \beta \cup \alpha = -[T^2]^*.
\]
So \( \alpha \cup \beta = -\beta \cup \alpha \) (graded-commutativity with sign \( (-1)^{1 \cdot 1} = -1 \)). The cohomology ring is \( H^*(T^2;\mathbb{Z}) \cong \mathbb{Z}[\alpha,\beta]/(\alpha^2, \beta^2, \alpha\beta + \beta\alpha) \cong \Lambda_{\mathbb{Z}}(\alpha,\beta) \), the exterior algebra on two generators of degree 1.
</div>

<div class="example">
<strong>Example (Cohomology Ring of \( \mathbb{CP}^n \)):</strong> The cohomology ring of \( \mathbb{CP}^n \) with \( \mathbb{Z} \) coefficients is:

\[
H^*(\mathbb{CP}^n;\mathbb{Z}) \cong \mathbb{Z}[\alpha]/(\alpha^{n+1})
\]
where \( \alpha \in H^2(\mathbb{CP}^n;\mathbb{Z}) \cong \mathbb{Z} \) is the generator (the "hyperplane class" or "first Chern class of the tautological line bundle"). The \( k \)-th cup power \( \alpha^k = \alpha \cup \cdots \cup \alpha \) (k times) generates \( H^{2k}(\mathbb{CP}^n;\mathbb{Z}) \cong \mathbb{Z} \). Thus the cohomology ring is a truncated polynomial ring. This ring structure distinguishes \( \mathbb{CP}^n \) from products of spheres: for instance, \( S^2 \times S^4 \) and \( \mathbb{CP}^3 \) have the same Betti numbers but different rings.
</div>

## Section 7.2b: De Rham Cohomology (Comparison)

For smooth manifolds, there is a third approach to cohomology — de Rham cohomology — using differential forms. The de Rham cohomology groups \( H^k_{\mathrm{dR}}(M) \) are defined as the closed \( k \)-forms modulo the exact \( k \)-forms:

\[
H^k_{\mathrm{dR}}(M) = \ker(d : \Omega^k(M) \to \Omega^{k+1}(M)) / \mathrm{im}(d : \Omega^{k-1}(M) \to \Omega^k(M)).
\]
The de Rham theorem (proved using integration of forms over singular chains) states that \( H^k_{\mathrm{dR}}(M) \cong H^k(M;\mathbb{R}) \) for any smooth manifold \( M \).

<div class="example">
<strong>Example (De Rham Cohomology of \( S^1 \)):</strong> On \( S^1 \), the 0-forms are smooth functions \( f : S^1 \to \mathbb{R} \). The 1-forms are expressions \( f(x)dx \) (for \( x \) the angle coordinate). The differential \( d : C^\infty(S^1) \to \Omega^1(S^1) \) maps \( f \mapsto f'dx \). A 1-form \( \omega = f(x)dx \) is closed automatically (since there are no 2-forms). It is exact iff \( f = g' \) for some smooth \( g \), which happens iff \( \int_{S^1} f\, dx = 0 \) (the "period" of \( \omega \) around the circle). Thus:

\[
H^0_{\mathrm{dR}}(S^1) \cong \mathbb{R} \quad \text{(constants)}, \quad H^1_{\mathrm{dR}}(S^1) \cong \mathbb{R} \quad \text{(periods)}.
\]
The generator of \( H^1_{\mathrm{dR}}(S^1) \) is the form \( d\theta / (2\pi) \) (the normalised angle form, with period 1 around the circle). This agrees with \( H^1(S^1;\mathbb{R}) \cong \mathbb{R} \) from the universal coefficient theorem.
</div>

<div class="remark">
<strong>Remark (de Rham vs. Singular Cohomology):</strong> De Rham cohomology has two advantages over singular cohomology: it is computable using calculus (via integration), and it comes with additional structure from the wedge product of forms (which corresponds to the cup product under the de Rham isomorphism). Its disadvantage is that it only works for smooth manifolds and only gives real (not integer) cohomology, so it loses torsion information. For many geometric applications (characteristic classes, index theory), the smooth structure is available and the de Rham perspective is most natural.
</div>

<div class="theorem">
<strong>Theorem (Poincaré Lemma):</strong> For all \( k \geq 1 \), every closed \( k \)-form on \( \mathbb{R}^n \) is exact: \( H^k_{\mathrm{dR}}(\mathbb{R}^n) = 0 \). Equivalently, \( H^0_{\mathrm{dR}}(\mathbb{R}^n) = \mathbb{R} \) (constants) and \( H^k_{\mathrm{dR}}(\mathbb{R}^n) = 0 \) for \( k \geq 1 \).
</div>

<div class="proof">
<em>Proof.</em> The key is that \( \mathbb{R}^n \) is contractible. The homotopy \( H : \mathbb{R}^n \times [0,1] \to \mathbb{R}^n \), \( H(x,t) = tx \), from the identity to the constant map at 0, induces a chain homotopy \( K : \Omega^k(\mathbb{R}^n) \to \Omega^{k-1}(\mathbb{R}^n) \) at the level of differential forms, given by the formula:

\[
(K\omega)(x) = \int_0^1 t^{k-1} i_{\partial/\partial t} \omega(tx) \, dt,
\]
where \( i_{\partial/\partial t} \) denotes interior multiplication (contraction with the vector field \( \partial/\partial t \)). One verifies \( d(K\omega) + K(d\omega) = \omega - c_0^*\omega \) where \( c_0 : \mathbb{R}^n \to \{0\} \) is the constant map. For a closed form \( \omega \) (\( d\omega = 0 \)) with \( k \geq 1 \), this gives \( d(K\omega) = \omega \), so \( \omega \) is exact. \( \square \)
</div>

<div class="example">
<strong>Example (De Rham Cohomology of \( T^2 \)):</strong> The torus \( T^2 = \mathbb{R}^2 / \mathbb{Z}^2 \) has coordinates \( (\theta_1, \theta_2) \in [0,1]^2 / \partial \). Its de Rham cohomology, computed by the de Rham theorem and the known cohomology of \( T^2 \), is:

\[
H^0_{\mathrm{dR}}(T^2) = \mathbb{R}, \quad H^1_{\mathrm{dR}}(T^2) = \mathbb{R}^2, \quad H^2_{\mathrm{dR}}(T^2) = \mathbb{R}.
\]
The generators are: \( H^0 \) generated by the constant function \( 1 \); \( H^1 \) generated by the closed 1-forms \( d\theta_1 \) and \( d\theta_2 \) (closed since \( d^2 = 0 \), not exact since their periods around the respective loops are 1 and not 0); \( H^2 \) generated by the volume form \( d\theta_1 \wedge d\theta_2 \). These classes correspond under the de Rham theorem \( H^k_{\mathrm{dR}} \cong H^k(T^2; \mathbb{R}) \) to the singular cohomology generators we computed algebraically.
</div>

<div class="theorem">
<strong>Theorem (De Rham Isomorphism):</strong> For a smooth manifold \( M \), the integration pairing \( \int : H^k_{\mathrm{dR}}(M) \to H^k(M; \mathbb{R}) \) defined by \( [\omega] \mapsto \left( [\sigma] \mapsto \int_\sigma \omega \right) \) is an isomorphism of \( \mathbb{R} \)-vector spaces.
</div>

<div class="remark">
<strong>Remark (Integration as the Pairing):</strong> The de Rham isomorphism sends a closed \( k \)-form \( \omega \) to the singular cohomology class that evaluates a \( k \)-cycle \( \sigma \) by integrating \( \omega \) over \( \sigma \). The fact that this is well-defined (independent of the representative cycle and the representative form) follows from Stokes' theorem: if \( \omega \) is exact (\( \omega = d\eta \)), then \( \int_\sigma \omega = \int_\sigma d\eta = \int_{\partial \sigma} \eta = 0 \) for any cycle \( \sigma \) (since \( \partial \sigma = 0 \)). Conversely, if \( \sigma = \partial \tau \) is a boundary, then \( \int_\sigma \omega = \int_{\partial \tau} \omega = \int_\tau d\omega = 0 \) for any closed form \( \omega \) (\( d\omega = 0 \)). The Stokes theorem is thus the dual of the identity \( \partial^2 = 0 \), and the de Rham theorem is the statement that these two dualities give isomorphic cohomology theories.
</div>

## Section 7.3: Poincaré Duality

One of the most beautiful theorems in algebraic topology, Poincaré duality establishes a symmetry between the homology and cohomology groups of an oriented closed manifold. Poincaré stated a version in 1895 (in terms of Betti numbers), and the modern statement using the cap product was given by Poincaré himself and later made rigorous by Lefschetz, Čech, and de Rham.

<div class="definition">
<strong>Definition (Fundamental Class):</strong> A connected compact \( n \)-manifold (without boundary) is <em>orientable</em> if it admits a consistent choice of orientation on all coordinate charts. For an oriented closed \( n \)-manifold \( M \), the top homology \( H_n(M;\mathbb{Z}) \cong \mathbb{Z} \) has a distinguished generator called the <em>fundamental class</em> \( [M] \in H_n(M;\mathbb{Z}) \). This class is the algebraic encoding of the global orientation.
</div>

<div class="definition">
<strong>Definition (Cap Product):</strong> For cohomology class \( \alpha \in H^k(X;R) \) and homology class \( \sigma \in H_n(X;R) \), the <em>cap product</em> \( \alpha \cap \sigma \in H_{n-k}(X;R) \) is defined by:

\[
\phi \cap \sigma = \sigma(\phi \otimes \mathrm{id}) \text{ (using the coproduct structure)}.
\]
Concretely, for \( \sigma \) represented by a singular \( n \)-simplex and \( \phi \in C^k \), \( \phi \cap \sigma = \phi(\sigma|_{[v_0,\ldots,v_k]}) \cdot \sigma|_{[v_k,\ldots,v_n]} \).
</div>

<div class="theorem">
<strong>Theorem (Poincaré Duality):</strong> Let \( M \) be a closed oriented \( n \)-manifold with fundamental class \( [M] \in H_n(M;\mathbb{Z}) \). Then for all \( k \), the map:

\[
D : H^k(M;\mathbb{Z}) \to H_{n-k}(M;\mathbb{Z}), \quad D(\alpha) = \alpha \cap [M],
\]
is an isomorphism. Equivalently, \( H^k(M;\mathbb{Z}) \cong H_{n-k}(M;\mathbb{Z}) \).
</div>

<div class="proof">
<em>Proof sketch of Poincaré Duality.</em> The proof proceeds in steps.

<strong>Step 1 (Local case):</strong> For \( \mathbb{R}^n \), one shows \( H^k_c(\mathbb{R}^n) \cong H_{n-k}(\mathbb{R}^n) \), where \( H^k_c \) denotes compactly supported cohomology. This follows from explicit calculation: \( H^k_c(\mathbb{R}^n) = \mathbb{Z} \) if \( k=n \) and 0 otherwise, while \( H_0(\mathbb{R}^n) = \mathbb{Z} \) and \( H_k(\mathbb{R}^n) = 0 \) for \( k \geq 1 \).

<strong>Step 2 (Inductive step):</strong> For a manifold \( M \) covered by opens \( U, V \) each satisfying Poincaré duality (by induction), a Mayer–Vietoris argument shows \( M = U \cup V \) also satisfies it. The key is that the Mayer–Vietoris sequences for homology and compactly supported cohomology are compatible under the duality isomorphism.

<strong>Step 3 (Global):</strong> Any compact oriented \( n \)-manifold \( M \) is covered by finitely many coordinate charts homeomorphic to \( \mathbb{R}^n \). By the inductive argument, Poincaré duality holds for \( M \). The isomorphism \( H^k(M) \cong H_{n-k}(M) \) is then identified with cap product with \( [M] \). \( \square \)
</div>

<div class="example">
<strong>Example (Poincaré Duality for \( \Sigma_g \)):</strong> For the genus-\( g \) surface \( \Sigma_g \) (a closed oriented 2-manifold), Poincaré duality gives:

\[
H^0(\Sigma_g) \cong H_2(\Sigma_g) \cong \mathbb{Z}, \quad H^1(\Sigma_g) \cong H_1(\Sigma_g) \cong \mathbb{Z}^{2g}, \quad H^2(\Sigma_g) \cong H_0(\Sigma_g) \cong \mathbb{Z}.
\]
This symmetry \( H^k \cong H_{2-k} \) is a manifestation of the "self-duality" of 2-manifolds: the space of 0-cycles (points) is dual to the space of 2-cycles (the whole surface), and the space of 1-cycles (loops) is self-dual.
</div>

<div class="example">
<strong>Example (Poincaré Duality for \( S^n \)):</strong> For the \( n \)-sphere, \( H^k(S^n) \cong H_{n-k}(S^n) \), which gives \( H^0(S^n) \cong H_n(S^n) \cong \mathbb{Z} \) and \( H^n(S^n) \cong H_0(S^n) \cong \mathbb{Z} \). All other groups vanish. The self-duality \( H^k \cong H_{n-k} \) is manifest: the only nonzero values are at \( k = 0 \) and \( k = n \), which are symmetric around \( k = n/2 \).
</div>

<div class="remark">
<strong>Remark (Non-orientable Manifolds):</strong> For non-orientable closed manifolds, Poincaré duality holds with \( \mathbb{Z}/2 \) coefficients: \( H^k(M;\mathbb{Z}/2) \cong H_{n-k}(M;\mathbb{Z}/2) \). With \( \mathbb{Z} \) coefficients, Poincaré duality fails: for \( \mathbb{RP}^2 \), \( H^0 = \mathbb{Z} \) but \( H_2 = 0 \), so they are not isomorphic. The fundamental class only exists for oriented manifolds over \( \mathbb{Z} \); over \( \mathbb{Z}/2 \) every manifold has a fundamental class.
</div>

<div class="remark">
<strong>Remark (Applications of Poincaré Duality):</strong> Poincaré duality has profound applications.
<ul>
<li><em>Signature:</em> For a closed oriented \( 4k \)-manifold, the cup product pairing \( H^{2k}(M;\mathbb{R}) \times H^{2k}(M;\mathbb{R}) \to \mathbb{R} \) is a symmetric bilinear form (by graded commutativity of the cup product in even degree). Its signature \( \sigma(M) = b^+ - b^- \) (where \( b^\pm \) are the numbers of positive/negative eigenvalues) is a topological invariant. For \( 4 \)-manifolds, \( \sigma(M) \) is one of the most important invariants in smooth topology.</li>
<li><em>Intersection form:</em> By Poincaré duality, the cup product \( H^k \times H^{n-k} \to H^n \cong \mathbb{Z} \) corresponds under duality to an <em>intersection form</em> on homology, measuring how cycles of complementary dimension intersect. This is the algebraic encoding of geometric intersection.</li>
<li><em>Euler characteristic:</em> Poincaré duality implies \( \chi(M) = \sum (-1)^k \mathrm{rank}(H^k) = \sum (-1)^k \mathrm{rank}(H_{n-k}) \). For \( n \) odd, this gives \( \chi(M) = 0 \) (pairing \( H^k \) with \( H^{n-k} \) and noting that odd-dimensional pairs cancel). So all odd-dimensional closed orientable manifolds have \( \chi = 0 \). For \( S^n \) with \( n \) odd: \( \chi(S^n) = 0 \). For \( T^{2k+1} \): \( \chi = 0 \). This is consistent with what we computed directly.</li>
</ul>
</div>

---

## Appendix: Key Exact Sequences

For reference, here are the most important long exact sequences used throughout this course.

**Long exact sequence of a pair:**

\[
\cdots \to H_n(A) \xrightarrow{i_*} H_n(X) \xrightarrow{j_*} H_n(X,A) \xrightarrow{\partial_*} H_{n-1}(A) \to \cdots
\]

**Mayer–Vietoris sequence (\( X = A \cup B \), open):**

\[
\cdots \to H_n(A \cap B) \xrightarrow{\Phi} H_n(A) \oplus H_n(B) \xrightarrow{\Psi} H_n(X) \xrightarrow{\partial} H_{n-1}(A \cap B) \to \cdots
\]

**Long exact sequence of a fibration \( F \hookrightarrow E \xrightarrow{p} B \):**

\[
\cdots \to \pi_n(F) \xrightarrow{i_*} \pi_n(E) \xrightarrow{p_*} \pi_n(B) \xrightarrow{\partial} \pi_{n-1}(F) \to \cdots \to \pi_0(E) \to \pi_0(B)
\]

**Hurewicz isomorphism** (for \( (n-1) \)-connected \( X \), \( n \geq 2 \)):

\[
h_n : \pi_n(X) \xrightarrow{\sim} H_n(X).
\]

Each of these sequences encodes a fundamental relationship between algebraic invariants. The long exact sequence of a pair measures the "relative" contribution of a subspace; Mayer–Vietoris decomposes a space into simpler pieces; the fibration sequence relates the topology of a total space to that of its base and fibre; and the Hurewicz isomorphism connects the homotopy-theoretic and homological perspectives on connectivity. Together they constitute the computational spine of algebraic topology: every computation in this course reduces to reading off one of these sequences, computing its terms, and deducing the unknown groups from exactness.

**Gysin sequence (for sphere bundles):** Let \( S^{n-1} \hookrightarrow E \xrightarrow{\pi} B \) be a sphere bundle (a fibre bundle with fibre \( S^{n-1} \)) over a compact oriented manifold \( B \). The **Gysin sequence** is the long exact sequence in cohomology:

\[
\cdots \to H^k(E) \xrightarrow{\pi^*} H^{k-n}(B) \xrightarrow{\cup e} H^k(B) \xrightarrow{\pi_!} H^k(E) \to \cdots
\]
where \( e \in H^n(B) \) is the **Euler class** of the bundle and \( \pi_! \) is the Gysin (integration along fibres) map. The Gysin sequence is derived from the Thom isomorphism \( H^k(E, E_0) \cong H^{k-n}(B) \) (where \( E_0 \) is the complement of the zero section) combined with the long exact sequence of the pair \( (E, E_0) \). It is used to compute the cohomology of projective bundles, sphere bundles, and, in particular, to derive relations in the cohomology ring of Grassmannians.

<div class="remark">
<strong>Remark (Serre Spectral Sequence):</strong> The Serre spectral sequence is a vast generalisation of both the Mayer–Vietoris sequence and the Gysin sequence. Given a fibration \( F \to E \to B \) (over a simply connected base, for simplicity), it provides a spectral sequence \( E_2^{p,q} = H^p(B; H^q(F)) \) converging to \( H^{p+q}(E) \). The \( E_2 \)-page is the cohomology of the base with coefficients in the cohomology of the fibre; successive differentials \( d_r : E_r^{p,q} \to E_r^{p+r, q-r+1} \) encode how the fibration "twists" the fibre cohomology over the base. The Mayer–Vietoris sequence arises as the special case of a fibration over \( S^1 \) (a mapping torus fibration), where the spectral sequence degenerates at \( E_2 \). The Serre spectral sequence was developed by Jean-Pierre Serre in 1951 in his thesis on the homotopy groups of spheres, and remains one of the most powerful computational tools in algebraic topology.
</div>

**Summary table of key exact sequences:**

| Sequence | Input data | Output | Primary use |
|---|---|---|---|
| Long exact of pair | Pair \( (X,A) \) | Sequence relating \( H_*(A), H_*(X), H_*(X,A) \) | Relative homology, computing \( H_*(X/A) \) |
| Mayer–Vietoris | Cover \( X = A \cup B \) | Sequence relating \( H_*(A \cap B), H_*(A), H_*(B), H_*(X) \) | Cutting into simpler pieces |
| Long exact of fibration | Fibration \( F \to E \to B \) | Sequence relating \( \pi_*(F), \pi_*(E), \pi_*(B) \) | Computing homotopy groups |
| Hurewicz isomorphism | \( (n-1) \)-connected \( X \) | \( \pi_n(X) \cong H_n(X) \) | Connecting \( \pi \) and \( H \) |
| UCT (homology) | Space \( X \), group \( G \) | Short exact \( H_n \otimes G \to H_n(X;G) \to \mathrm{Tor}(H_{n-1},G) \) | Changing coefficients |
| UCT (cohomology) | Space \( X \), group \( G \) | Short exact \( \mathrm{Ext}(H_{n-1},G) \to H^n(X;G) \to \mathrm{Hom}(H_n,G) \) | Cohomology from homology |
| Gysin sequence | Sphere bundle \( S^{n-1} \to E \to B \) | Sequence with Euler class action | Characteristic classes |

---

## Appendix B: Glossary of Key Terms

**Abelianisation** — For a group \( G \), the quotient \( G^{\mathrm{ab}} = G/[G,G] \) by the commutator subgroup. The abelianisation of \( \pi_1(X) \) equals \( H_1(X) \) for path-connected \( X \).

**Attaching map** — A continuous map \( \phi : S^{n-1} \to X^{n-1} \) used to attach an \( n \)-cell to an \( (n-1) \)-skeleton in a CW complex.

**Betti numbers** — The ranks \( \beta_n = \mathrm{rank}(H_n(X;\mathbb{Z})) \). For a finite CW complex, \( \chi(X) = \sum (-1)^n \beta_n \).

**Boundary operator** — The map \( \partial_n : C_n(X) \to C_{n-1}(X) \) in a chain complex, satisfying \( \partial^2 = 0 \). In simplicial homology, it is the alternating sum of face restrictions.

**Cap product** — A pairing \( H^k(X;R) \otimes H_n(X;R) \to H_{n-k}(X;R) \) implementing Poincaré duality for oriented manifolds.

**Chain complex** — A sequence of abelian groups \( \cdots \to C_n \xrightarrow{\partial_n} C_{n-1} \to \cdots \) with \( \partial_{n-1} \circ \partial_n = 0 \).

**Chain homotopy** — A collection of maps \( P_n : C_n \to C_{n+1} \) with \( \partial P + P \partial = f_* - g_* \), used to prove that homotopic maps induce the same maps on homology.

**Coboundary** — An element of \( \mathrm{im}(\delta^{n-1} : C^{n-1} \to C^n) \) in the cochain complex.

**Cochain complex** — The dual of a chain complex: \( \cdots \to C^{n-1} \xrightarrow{\delta} C^n \xrightarrow{\delta} C^{n+1} \to \cdots \) with \( C^n = \mathrm{Hom}(C_n, G) \).

**Cocycle** — An element of \( \ker(\delta^n : C^n \to C^{n+1}) \).

**Cohomology** — The groups \( H^n(X;G) = \ker \delta^n / \mathrm{im}\, \delta^{n-1} \) of the cochain complex.

**Connecting homomorphism** — The map \( \partial_* : H_n(X,A) \to H_{n-1}(A) \) (or \( \partial : \pi_n(B) \to \pi_{n-1}(F) \)) in a long exact sequence, defined by lifting and taking boundaries.

**Contractible** — Homotopy equivalent to a point; equivalently, the identity map is null-homotopic.

**Covering map** — A surjective continuous map \( p : \tilde X \to X \) such that every point of \( X \) has an evenly covered neighbourhood.

**CW complex** — A space built inductively by attaching cells via attaching maps; the standard framework for algebraic topology computations.

**Deck transformation** — A homeomorphism \( \phi : \tilde X \to \tilde X \) commuting with a covering map \( p : \tilde X \to X \).

**Deformation retract** — A subspace \( A \subseteq X \) together with a retraction \( r : X \to A \) and a homotopy from \( \mathrm{id}_X \) to \( i \circ r \) fixing \( A \) pointwise.

**Degree** — For a map \( f : S^n \to S^n \), the integer \( \deg(f) \) such that \( f_* = \deg(f) \cdot \mathrm{id} \) on \( H_n(S^n) \cong \mathbb{Z} \).

**Euler characteristic** — The alternating sum \( \chi(X) = \sum (-1)^n c_n \) of cell counts, equal to \( \sum (-1)^n \beta_n \) by the Euler–Poincaré formula.

**Excision** — The theorem that removing a set from both a pair and its ambient space does not change relative homology, under appropriate interior conditions.

**Fibration** — A map \( p : E \to B \) with the homotopy lifting property for all spaces; generalises covering maps. Fibre bundles are fibrations.

**Free group** — A group with no relations among its generators; the free group \( F_n \) on \( n \) generators has \( \pi_1(\bigvee^n S^1) = F_n \).

**Free product** — The group \( G * H \) of reduced words from \( G \) and \( H \) alternately; universal for pairs of homomorphisms out of \( G \) and \( H \).

**Fundamental class** — The generator \( [M] \in H_n(M;\mathbb{Z}) \) of the top homology of a closed oriented \( n \)-manifold; the source of Poincaré duality.

**Fundamental group** — \( \pi_1(X, x_0) \), the group of path-homotopy classes of loops at \( x_0 \).

**Good pair** — A pair \( (X,A) \) with \( A \) a deformation retract of some neighbourhood; for good pairs, \( H_n(X,A) \cong \tilde H_n(X/A) \).

**Homology** — The groups \( H_n(X) = \ker \partial_n / \mathrm{im}\, \partial_{n+1} \) measuring \( n \)-dimensional "holes."

**Homotopy** — A continuous deformation \( H : X \times [0,1] \to Y \) between two maps.

**Homotopy equivalence** — A map with a homotopy inverse; the natural notion of "sameness" in homotopy theory.

**Homotopy group** — \( \pi_n(X, x_0) \), the group of homotopy classes of based maps \( (S^n, s_0) \to (X, x_0) \).

**Hurewicz homomorphism** — The natural map \( h_n : \pi_n(X) \to H_n(X) \), an isomorphism when \( X \) is \( (n-1) \)-connected.

**Lefschetz number** — \( L(f) = \sum (-1)^n \mathrm{tr}(f_* : H_n(X;\mathbb{Q}) \to H_n(X;\mathbb{Q})) \); nonzero implies \( f \) has a fixed point.

**Lift** — A map \( \tilde f \) to a covering space such that \( p \circ \tilde f = f \).

**Long exact sequence** — An exact sequence of abelian groups extending infinitely in one or both directions, arising from a short exact sequence of chain complexes.

**Mayer–Vietoris sequence** — The long exact sequence \( \cdots \to H_n(A \cap B) \to H_n(A) \oplus H_n(B) \to H_n(X) \to H_{n-1}(A \cap B) \to \cdots \) for \( X = A \cup B \).

**Path-connected** — A space in which any two points can be joined by a path.

**Poincaré duality** — The isomorphism \( H^k(M) \cong H_{n-k}(M) \) for closed oriented \( n \)-manifolds, implemented by cap product with the fundamental class.

**Relative homology** — \( H_n(X,A) = H_n(C_*(X)/C_*(A)) \); measures cycles in \( X \) relative to the "base" \( A \).

**Retraction** — A map \( r : X \to A \) with \( r|_A = \mathrm{id}_A \).

**Seifert–van Kampen theorem** — The theorem that \( \pi_1(U \cup V) \cong \pi_1(U) *_{\pi_1(U \cap V)} \pi_1(V) \) under connectivity hypotheses.

**Singular simplex** — Any continuous map \( \sigma : \Delta^n \to X \), without injectivity requirements.

**Suspension** — \( SX = X \times [0,1] / \sim \), the space obtained by coning \( X \) at both ends.

**Universal coefficient theorem** — The short exact sequence \( 0 \to H_n(X) \otimes G \to H_n(X;G) \to \mathrm{Tor}(H_{n-1}(X),G) \to 0 \).

**Universal cover** — The simply connected covering space \( \tilde X \to X \); unique up to isomorphism.

**Weak homotopy equivalence** — A map inducing isomorphisms on all homotopy groups; a homotopy equivalence between CW complexes by Whitehead's theorem.

**Winding number** — The degree of a loop in \( S^1 \); gives the isomorphism \( \pi_1(S^1) \cong \mathbb{Z} \).

---

## Appendix C: Common Computations at a Glance

The following summary collects the most frequently computed homology and homotopy groups. All homology is with \( \mathbb{Z} \) coefficients unless noted.

**Homology of standard spaces:**

| Space | \( H_0 \) | \( H_1 \) | \( H_2 \) | \( H_n \) (general) |
|---|---|---|---|---|
| Point \( * \) | \( \mathbb{Z} \) | 0 | 0 | 0 for \( n \geq 1 \) |
| \( S^k \) | \( \mathbb{Z} \) | \( \mathbb{Z} \) if \( k=1 \) | \( \mathbb{Z} \) if \( k=2 \) | \( \mathbb{Z} \) if \( n=k \); 0 if \( 0 < n \neq k \) |
| \( D^k \) | \( \mathbb{Z} \) | 0 | 0 | 0 for \( n \geq 1 \) (contractible) |
| \( T^2 \) | \( \mathbb{Z} \) | \( \mathbb{Z}^2 \) | \( \mathbb{Z} \) | 0 for \( n \geq 3 \) |
| \( \Sigma_g \) | \( \mathbb{Z} \) | \( \mathbb{Z}^{2g} \) | \( \mathbb{Z} \) | 0 for \( n \geq 3 \) |
| \( \mathbb{RP}^2 \) | \( \mathbb{Z} \) | \( \mathbb{Z}/2 \) | 0 | 0 for \( n \geq 3 \) |
| \( \mathbb{CP}^n \) | \( \mathbb{Z} \) | 0 | \( \mathbb{Z} \) | \( \mathbb{Z} \) if \( n = 2k \leq 2n \); 0 else |
| \( K \) (Klein) | \( \mathbb{Z} \) | \( \mathbb{Z} \oplus \mathbb{Z}/2 \) | 0 | 0 for \( n \geq 3 \) |

**Homotopy groups of spheres (low range):**

| | \( \pi_1 \) | \( \pi_2 \) | \( \pi_3 \) | \( \pi_4 \) | \( \pi_5 \) |
|---|---|---|---|---|---|
| \( S^1 \) | \( \mathbb{Z} \) | 0 | 0 | 0 | 0 |
| \( S^2 \) | 0 | \( \mathbb{Z} \) | \( \mathbb{Z} \) | \( \mathbb{Z}/2 \) | \( \mathbb{Z}/2 \) |
| \( S^3 \) | 0 | 0 | \( \mathbb{Z} \) | \( \mathbb{Z}/2 \) | \( \mathbb{Z}/2 \) |
| \( S^n \) (\( n \geq 4 \)) | 0 | 0 | 0 | \( \mathbb{Z} \) | \( \mathbb{Z}/2 \) |

Note: \( \pi_k(S^2) \cong \pi_k(S^3) \) for all \( k \geq 3 \) by the Hopf fibration long exact sequence.

**Fundamental groups and abelianisations:**

| Space | \( \pi_1 \) | \( \pi_1^{\mathrm{ab}} = H_1 \) |
|---|---|---|
| \( S^1 \) | \( \mathbb{Z} \) | \( \mathbb{Z} \) |
| \( T^2 \) | \( \mathbb{Z}^2 \) | \( \mathbb{Z}^2 \) |
| \( \Sigma_g \) | \( \langle a_i,b_i \mid \prod[a_i,b_i] \rangle \) | \( \mathbb{Z}^{2g} \) |
| \( \mathbb{RP}^2 \) | \( \mathbb{Z}/2 \) | \( \mathbb{Z}/2 \) |
| \( \mathbb{RP}^n \), \( n \geq 2 \) | \( \mathbb{Z}/2 \) | \( \mathbb{Z}/2 \) |
| \( S^1 \vee S^1 \) | \( F_2 \) | \( \mathbb{Z}^2 \) |
| Klein bottle | \( \langle a,b \mid abab^{-1} \rangle \) | \( \mathbb{Z} \oplus \mathbb{Z}/2 \) |
| Trefoil complement | \( \langle a,b \mid a^2 = b^3 \rangle \) | \( \mathbb{Z} \) |

These tables summarise the computations of Chapters 1–6 and provide a quick reference for applying the exact sequences of Chapter 4 and the applications of Chapter 5.
