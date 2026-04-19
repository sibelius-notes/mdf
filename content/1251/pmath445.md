---
title: "PMATH 445: Representations of Finite Groups"
subjects: "PMATH"
prof: "Faisal Al-Faisal"
---

Representation theory asks a deceptively simple question: given a group \(G\), how can it act linearly on a vector space? The power of the question lies in its answer — by studying these linear actions, called *representations*, we can bring the full machinery of linear algebra to bear on problems in group theory, number theory, combinatorics, and mathematical physics. This is the subject of PMATH 445.

The course follows a double arc. The first half develops the theory from scratch using direct linear-algebraic methods, culminating in the orthogonality of characters and the classification of irreducible representations by their character tables. The second half recasts everything in the language of modules over group algebras, with the Artin-Wedderburn theorem as its centrepiece. Both arcs illuminate the same landscape from different altitudes.

# Chapter 1: What Is Representation Theory?

## The Idea Behind Representations

A group \(G\) is an abstract object — a set with a multiplication satisfying certain axioms. To *study* \(G\), one of the most powerful strategies is to make \(G\) act on something more concrete. Groups act on sets (this is the notion of a group action), on geometric objects (symmetries), on other groups (conjugation), and — most relevantly for us — on vector spaces. An action of \(G\) on a vector space \(V\) by linear maps is called a *representation* of \(G\).

Why focus on vector spaces in particular? Because linear algebra gives us an enormous toolkit: eigenvalues, diagonalization, inner products, traces, determinants. A representation "represents" abstract group elements as concrete, computable matrices, allowing us to bring these tools to bear.

The reach of representation theory is remarkable. A few illustrations:

- If \(E\) is an elliptic curve over \(\mathbb{Q}\), there is a representation of the Galois group \(\mathrm{Gal}(\overline{\mathbb{Q}}/\mathbb{Q})\) on the Tate module of \(E\); this representation encodes the arithmetic of \(E\), and its study lies at the heart of Wiles's proof of Fermat's Last Theorem.
- The representation theory of the symmetric group \(S_n\) is interwoven with Young tableaux and the combinatorial structure of symmetric functions — a nexus of connections known as combinatorial representation theory.
- In quantum physics, the symmetry group of a physical system acts on the Hilbert space of quantum states. The irreducible representations of \(SU(3)\) led Gell-Mann and Ne'eman to postulate the existence of quarks before any experimental evidence: mathematics preceded physics.
- Dirichlet's proof of his theorem on primes in arithmetic progressions used, in modern language, Fourier analysis on the abelian group \((\mathbb{Z}/n\mathbb{Z})^\times\) — which is precisely the representation theory of abelian groups.

<div class="definition">
<strong>Definition (Representation).</strong> Let \(G\) be a group and \(F\) a field. A <strong>representation</strong> of \(G\) over \(F\) is a pair \((V, \rho)\) where \(V\) is an \(F\)-vector space and \(\rho : G \to \mathrm{GL}(V)\) is a group homomorphism. We call \(V\) the <strong>representation space</strong> and \(\rho\) the <strong>action map</strong>.
</div>

The condition that \(\rho\) is a homomorphism means \(\rho(gh) = \rho(g)\rho(h)\) for all \(g, h \in G\), and \(\rho(e) = \mathrm{id}_V\). Notice that we do *not* require \(\rho\) to be injective — the added flexibility is essential. If \(\rho\) *is* injective, we call the representation **faithful**.

When \(V\) is finite-dimensional of dimension \(n\), a choice of basis identifies \(\mathrm{GL}(V)\) with \(\mathrm{GL}_n(F)\), giving a **matrix representation** \(\rho : G \to \mathrm{GL}_n(F)\). A different basis produces a conjugate matrix representation \(r'(g) = Ar(g)A^{-1}\) for some fixed invertible \(A\). The choice of basis is inessential, and we study representations up to this equivalence.

It is worth pausing to appreciate how many structures are "representations in disguise." A group acting on a graph (edge-colourings, adjacency eigenvalues) is representation theory. The Laplacian of a symmetric graph decomposes into irreducible blocks indexed by representations. Character sums over finite fields — Gauss sums, Kloosterman sums — are trace functions of Galois representations. Even the Fast Fourier Transform is an efficient algorithm for decomposing a function on a cyclic group into irreducible components.

## Group Actions and the Path to Representations

The conceptually cleanest route to the definition of a representation passes through group actions.

<div class="definition">
<strong>Definition (Group Action).</strong> A <strong>group action</strong> of \(G\) on a set \(X\) is a function \(G \times X \to X\), written \((g,x) \mapsto g \cdot x\), satisfying: (i) \(e \cdot x = x\) for all \(x\); (ii) \((gh) \cdot x = g \cdot (h \cdot x)\) for all \(g, h \in G\) and \(x \in X\). A set \(X\) equipped with such an action is called a <strong>\(G\)-set</strong>.
</div>

If \(G\) acts on \(X\), each element \(g \in G\) defines a bijection \(a_g : X \to X\) by \(a_g(x) = g \cdot x\). The map \(g \mapsto a_g\) is a group homomorphism \(G \to \mathrm{Sym}(X)\). Conversely, any such homomorphism defines an action. This equivalence is the content of:

<div class="proposition">
<strong>Proposition.</strong> Group actions of \(G\) on \(X\) are in bijection with group homomorphisms \(G \to \mathrm{Sym}(X)\). Furthermore, the action is faithful if and only if the homomorphism is injective.
</div>

A representation is simply a group action on a vector space that respects the linear structure. If \(G\) acts on an \(F\)-vector space \(V\) and each \(g\) acts by a linear map, then the map \(G \to \mathrm{Sym}(V)\) has image in the subgroup \(\mathrm{GL}(V)\) of *linear* bijections. This is precisely a representation.

The key examples of group actions are the foundations on which all representation theory is built:

- **Trivial action**: \(g \cdot x = x\) for all \(g, x\). Boring but indispensable.
- **Left multiplication**: \(G\) acts on itself by \(g \cdot x = gx\). This gives, after linearization, the **regular representation**.
- **Conjugation**: \(G\) acts on a normal subgroup \(H\) by \(g \cdot h = ghg^{-1}\).
- **Left cosets**: \(G\) acts on \(G/H\) by \(g \cdot (xH) = (gx)H\). After linearization, this is a **permutation representation**.

The **Orbit-Stabilizer Formula** \(|Gx| = [G : G_x]\) and **Burnside's Lemma** (the number of orbits equals the average number of fixed points) are fundamental tools that will reappear throughout the course.

<div class="remark">
<strong>Remark (Cayley's Theorem as a representation).</strong> The action of \(G\) on itself by left multiplication gives an injective homomorphism \(G \hookrightarrow \mathrm{Sym}(G) \cong S_{|G|}\). This is Cayley's theorem: every group embeds in a symmetric group. The linearized version of this action, the regular representation \(\mathbb{C}\langle G \rangle\), will turn out to contain every irreducible representation of \(G\) as a subrepresentation. The regular representation is, in a precise sense, the "universal" representation.
</div>

# Chapter 2: The Language of Representations

## Definitions and Equivalence

In what follows, unless otherwise stated, \(G\) is a group, \(F\) is a field, and all vector spaces are \(F\)-vector spaces. A representation \((V, \rho)\) has **degree** \(\deg \rho = \dim_F V\).

Rather than always writing pairs \((V, \rho)\), we often speak of "the \(G\)-module \(V\)," treating \(V\) as a vector space on which \(G\) acts by \(g \cdot v := \rho(g)v\). The linearity condition \(g \cdot (cv + w) = c(g \cdot v) + g \cdot w\) makes \(V\) into what is called an \(FG\)-module. The two terminologies — representation and \(G\)-module — are synonyms.

Two representations are *essentially the same* if one can be obtained from the other by a change of basis. Formally:

<div class="definition">
<strong>Definition (Isomorphism of Representations).</strong> Representations \((V, \rho)\) and \((W, \sigma)\) of \(G\) are <strong>isomorphic</strong> (written \(V \cong W\)) if there exists an invertible linear map \(T : V \to W\) such that \(T \circ \rho(g) = \sigma(g) \circ T\) for all \(g \in G\), equivalently, \(T(gv) = gT(v)\) for all \(g \in G\) and \(v \in V\). Such a \(T\) is called a <strong>\(G\)-linear map</strong> (or \(G\)-equivariant map, or intertwining operator).
</div>

The set of all \(G\)-linear maps from \(V\) to \(W\) is denoted \(\mathrm{Hom}_G(V, W)\). The fundamental problem of representation theory is to **classify all representations of \(G\) up to isomorphism**.

This is a meaningful problem: for a finite group \(G\) over \(\mathbb{C}\), there are only finitely many isomorphism classes of irreducible representations (we will prove this), and the character table is a finite matrix encoding them all. The classification is therefore completable in principle — and in practice for many important groups.

## Fundamental Examples

<div class="example">
<strong>Example (Trivial representation).</strong> For any \(G\) and any \(F\)-vector space \(V\), define \(\rho(g) = \mathrm{id}_V\) for all \(g \in G\). This is the <strong>trivial representation</strong>. Despite appearances, it is crucial — often one wants to determine whether a given representation "contains a copy" of the trivial representation. By the averaging trick, the multiplicity of the trivial representation in any \(V\) equals \(\dim V^G\), the dimension of the space of \(G\)-fixed vectors.
</div>

<div class="example">
<strong>Example (One-dimensional representations of \(C_n\): fully worked).</strong> Let \(C_n = \langle a \mid a^n = e \rangle\) be the cyclic group of order \(n\). A one-dimensional representation \(\rho : C_n \to \mathbb{C}^\times\) is completely determined by the single value \(\rho(a) \in \mathbb{C}^\times\), since \(\rho(a^j) = \rho(a)^j\). The homomorphism condition forces \(\rho(e) = \rho(a^n) = \rho(a)^n = 1\), so \(\rho(a)\) must be an \(n\)th root of unity. Over \(\mathbb{C}\), the \(n\)th roots of unity are \(\{1, \zeta, \zeta^2, \ldots, \zeta^{n-1}\}\) where \(\zeta = e^{2\pi i/n}\). This gives exactly \(n\) one-dimensional representations:

\[
\rho_k : C_n \to \mathbb{C}^\times, \quad \rho_k(a^j) = \zeta^{jk}, \quad k = 0, 1, \ldots, n-1.
\]
Let us be concrete for \(C_4 = \{0, 1, 2, 3\}\) (written additively). The generator is \(a = 1\), and \(\zeta = i\) (the imaginary unit). The four representations are:
\begin{align*}
\rho_0 &: \rho_0(j) = 1 \quad\text{(trivial)},\\
\rho_1 &: \rho_1(0)=1,\ \rho_1(1)=i,\ \rho_1(2)=-1,\ \rho_1(3)=-i,\\
\rho_2 &: \rho_2(0)=1,\ \rho_2(1)=-1,\ \rho_2(2)=1,\ \rho_2(3)=-1,\\
\rho_3 &: \rho_3(0)=1,\ \rho_3(1)=-i,\ \rho_3(2)=-1,\ \rho_3(3)=i.
\end{align*}
Note that \(\rho_3 = \overline{\rho_1}\) (complex conjugate). Since \(C_4\) is abelian with 4 conjugacy classes \(\{0\}, \{1\}, \{2\}, \{3\}\), these 4 representations are precisely all the irreducible complex representations. We will use this as our first fully worked character table in Chapter 8.
</div>

<div class="example">
<strong>Example (The sign representation of \(S_n\): faithful vs unfaithful).</strong> The symmetric group \(S_n\) acts on \(\{1, \ldots, n\}\), and every permutation has a sign \(\pm 1\). The <strong>sign representation</strong> is \(\mathrm{sgn} : S_n \to \{+1, -1\} \subset \mathbb{C}^\times\), with \(\mathrm{sgn}(\sigma) = (-1)^{\text{number of transpositions in any factorization of } \sigma}\). This is a well-defined group homomorphism (it doesn't matter how you factor \(\sigma\) into transpositions — the parity is always the same).

The sign representation is <em>not faithful</em> for \(n \geq 2\): the alternating group \(A_n = \ker(\mathrm{sgn})\) contains more than just the identity. For example, \(\mathrm{sgn}((123)) = +1\) even though \((123) \neq e\). The kernel of the representation is \(A_n\), so the representation "cannot see" any element of \(A_n\) — it treats all even permutations identically.

By contrast, the standard representation of \(S_n\) on \(V_\mathrm{std} = \{(z_1,\ldots,z_n) : \sum z_i = 0\} \subset \mathbb{C}^n\) is faithful for \(n \geq 3\): if \(\sigma \neq e\) then there exists some vector in \(V_\mathrm{std}\) that \(\sigma\) moves (one can check this directly). Thus faithfulness depends delicately on the representation.

The key point: whether or not \(\rho\) is faithful, the representation is still a perfectly good linear-algebraic object. Unfaithful representations arise naturally — for instance, every representation of \(G\) that factors through a quotient \(G/N\) is unfaithful (its kernel contains \(N\)). When we classify all representations of \(G\), we must include both faithful and unfaithful ones.
</div>

<div class="example">
<strong>Example (Standard representation of \(S_3\)).</strong> The symmetric group \(S_3\) is the symmetry group of an equilateral triangle. Placing the triangle in the plane gives a two-dimensional representation \(\rho : S_3 \to \mathrm{GL}_2(\mathbb{R})\). With generator \(a = (1\,2\,3)\) acting as a \(2\pi/3\)-rotation and \(b = (1\,2)\) as a reflection, the matrices are

\[
A = \begin{pmatrix} 0 & -1 \\ 1 & -1 \end{pmatrix}, \quad B = \begin{pmatrix} 1 & -1 \\ 0 & -1 \end{pmatrix}.
\]
One checks \(A^3 = B^2 = I\) and \(BAB = A^2\), confirming \(\rho\) is a valid representation. This two-dimensional irreducible representation is called the <strong>standard representation</strong> of \(S_3\).
</div>

<div class="example">
<strong>Example (The 2-dimensional representations of \(D_4\): explicit matrices).</strong> The dihedral group \(D_4 = \langle r, s \mid r^4 = s^2 = e, srs^{-1} = r^{-1} \rangle\) is the symmetry group of a square. It has order 8. The most natural representation is the geometric one: \(D_4\) acts on \(\mathbb{R}^2\) by symmetries of the unit square with vertices at \((\pm 1, \pm 1)\). The generator \(r\) acts as counterclockwise rotation by \(90°\), and \(s\) acts as reflection across the \(x\)-axis. The corresponding matrices are:

\[
\rho(r) = \begin{pmatrix} 0 & -1 \\ 1 & 0 \end{pmatrix}, \quad \rho(s) = \begin{pmatrix} 1 & 0 \\ 0 & -1 \end{pmatrix}.
\]
Let us verify the relations. First, \(\rho(r)^4\): we compute

\[
\rho(r)^2 = \begin{pmatrix} 0 & -1 \\ 1 & 0 \end{pmatrix}^2 = \begin{pmatrix} -1 & 0 \\ 0 & -1 \end{pmatrix} = -I, \quad \rho(r)^4 = (-I)^2 = I. \checkmark
\]
Next, \(\rho(s)^2 = \bigl(\begin{smallmatrix}1&0\\0&-1\end{smallmatrix}\bigr)^2 = I\). \(\checkmark\) Finally, \(\rho(s)\rho(r)\rho(s)^{-1} = \rho(s)\rho(r)\rho(s)\):

\[
\begin{pmatrix}1&0\\0&-1\end{pmatrix}\begin{pmatrix}0&-1\\1&0\end{pmatrix}\begin{pmatrix}1&0\\0&-1\end{pmatrix} = \begin{pmatrix}1&0\\0&-1\end{pmatrix}\begin{pmatrix}0&1\\1&0\end{pmatrix} = \begin{pmatrix}0&1\\-1&0\end{pmatrix} = \rho(r)^{-1}. \checkmark
\]
The eight matrices of \(D_4\) under this representation are:
\begin{align*}
\rho(e) &= \begin{pmatrix}1&0\\0&1\end{pmatrix}, & \rho(r) &= \begin{pmatrix}0&-1\\1&0\end{pmatrix}, & \rho(r^2) &= \begin{pmatrix}-1&0\\0&-1\end{pmatrix}, & \rho(r^3) &= \begin{pmatrix}0&1\\-1&0\end{pmatrix},\\
\rho(s) &= \begin{pmatrix}1&0\\0&-1\end{pmatrix}, & \rho(rs) &= \begin{pmatrix}0&1\\1&0\end{pmatrix}, & \rho(r^2s) &= \begin{pmatrix}-1&0\\0&1\end{pmatrix}, & \rho(r^3s) &= \begin{pmatrix}0&-1\\-1&0\end{pmatrix}.
\end{align*}
This representation is irreducible (we will verify this once we have character theory: its character has \(\langle\chi,\chi\rangle = 1\)). It is also faithful: the map \(D_4 \to \mathrm{GL}_2(\mathbb{R})\) is injective, as one can check that no two distinct elements of \(D_4\) give the same matrix.

This example also illustrates the key conceptual point: to define a representation of a group given by generators and relations, it suffices to specify matrices for the generators and verify that all relations hold. We did not need to specify all 8 matrices in advance; once \(\rho(r)\) and \(\rho(s)\) are chosen satisfying the three defining relations, the entire representation is determined.
</div>

<div class="example">
<strong>Example (The defining representation of \(S_n\) and its decomposition).</strong> The group \(S_n\) acts naturally on \(\mathbb{C}^n\) by permuting coordinates: \(\sigma \cdot e_i = e_{\sigma(i)}\). This is the <em>defining</em> or <em>permutation representation</em> \(V_\mathrm{def}\) of degree \(n\). It contains the trivial representation as a subrepresentation: the line \(\mathbb{C}(e_1 + e_2 + \cdots + e_n)\) is fixed by all permutations. The orthogonal complement (with respect to the standard inner product, which is \(G\)-invariant) is

\[
V_\mathrm{std} = \{(z_1, \ldots, z_n) \in \mathbb{C}^n : z_1 + z_2 + \cdots + z_n = 0\},
\]
a \(G\)-invariant subspace of dimension \(n-1\). We therefore have \(V_\mathrm{def} \cong V_\mathrm{triv} \oplus V_\mathrm{std}\). For \(n = 3\), \(V_\mathrm{std}\) is exactly the two-dimensional standard representation.
</div>

<div class="remark">
<strong>Remark (Group presentations).</strong> If \(G = \langle g_1, \ldots, g_k : r_1, \ldots, r_\ell \rangle\), then to define a representation \(\rho : G \to \mathrm{GL}(V)\) it suffices to specify the images \(\rho(g_i) \in \mathrm{GL}(V)\) in such a way that the corresponding matrix relations hold. For instance, for \(D_n = \langle r, s : r^n = s^2 = e,\, srs = r^{-1} \rangle\), one only needs \(\rho(r)^n = \rho(s)^2 = \mathrm{id}\) and \(\rho(s)\rho(r)\rho(s) = \rho(r)^{-1}\).
</div>

The **alternating (sign) representation** of \(S_n\) is the one-dimensional representation \(\mathrm{sgn} : S_n \to F^\times\) defined by \(\mathrm{sgn}(\pi) = \pm 1\) according to the parity of \(\pi\). Together with the trivial representation, these are the only one-dimensional representations of \(S_n\) for \(n \geq 2\).

## One-Dimensional Representations and the Abelianization

One-dimensional representations \(\rho : G \to F^\times\) are the simplest and most transparent. Since \(F^\times\) is abelian, any such homomorphism must kill the commutator subgroup \([G, G]\) — the subgroup generated by all commutators \([g, h] = ghg^{-1}h^{-1}\). Therefore every one-dimensional representation of \(G\) factors through the abelianization \(G^{\mathrm{ab}} = G / [G, G]\).

<div class="proposition">
<strong>Proposition.</strong> The one-dimensional complex representations of \(G\) are in bijection with the one-dimensional complex representations of \(G^{\mathrm{ab}}\), via inflation. In particular, the number of one-dimensional irreducible representations of \(G\) equals \(|G^{\mathrm{ab}}| = [G : [G,G]]\).
</div>

<div class="example">
<strong>Example.</strong> For \(S_n\) with \(n \geq 2\), the commutator subgroup is \([S_n, S_n] = A_n\) (the alternating group), so \(S_n^{\mathrm{ab}} \cong C_2\). There are exactly 2 one-dimensional representations: trivial and sign. For \(D_4\), the commutator subgroup is \([D_4, D_4] = \{e, r^2\} \cong C_2\), so \(D_4^{\mathrm{ab}} \cong D_4 / C_2 \cong C_2 \times C_2\), which has 4 elements. Thus \(D_4\) has exactly 4 one-dimensional representations. We will see this borne out in the character table.
</div>

# Chapter 3: Building Representations

## Permutation Representations

Given a finite \(G\)-set \(X = \{x_1, \ldots, x_n\}\), we can **linearize** the action of \(G\) by forming the free vector space \(F\langle X \rangle\) with basis \(X\) and extending the action by linearity:

\[
g(a_1 x_1 + \cdots + a_n x_n) = a_1(gx_1) + \cdots + a_n(gx_n).
\]
This is the **permutation representation** induced by \(X\). The associated matrix representation consists of permutation matrices (matrices obtained by permuting columns of the identity).

The central example is the **regular representation**: let \(G\) act on itself by left multiplication. The resulting representation \(V_\mathrm{reg} = F\langle G \rangle\) has degree \(|G|\), and its decomposition into irreducible pieces encodes the entire representation theory of \(G\). We will return to it repeatedly.

A useful complementary model replaces \(F\langle X \rangle\) with the function space \(F(X, F)\) of \(F\)-valued functions on \(X\), with action \((g \cdot f)(x) = f(g^{-1}x)\). The two models are isomorphic via \(x \mapsto e_x\) (the indicator function of \(x\)), but the function-space model generalizes more cleanly to infinite groups.

<div class="example">
<strong>Example (Regular representation of \(S_3\)).</strong> The regular representation of \(S_3\) has degree \(|S_3| = 6\). Its basis consists of the six group elements: \(\{e, (12), (13), (23), (123), (132)\}\). The element \((12)\) acts by sending each basis vector \(g\) to \((12)g\). In matrix form (using the ordering above), the matrix of \((12)\) is the \(6 \times 6\) permutation matrix:

\[
\rho_\mathrm{reg}((12)) = \begin{pmatrix} 0&1&0&0&0&0\\ 1&0&0&0&0&0\\ 0&0&0&1&0&0\\ 0&0&1&0&0&0\\ 0&0&0&0&0&1\\ 0&0&0&0&1&0 \end{pmatrix}.
\]
We will show later that this 6-dimensional representation decomposes as \(V_\mathrm{triv} \oplus V_\mathrm{sgn} \oplus V_\mathrm{std}^{\oplus 2}\), consistent with the formula \(6 = 1^2 + 1^2 + 2^2\).
</div>

## The Character of the Regular Representation

Even before developing the full theory, we can compute the character of the regular representation. The character of a permutation representation at \(g\) counts the number of fixed points of \(g\). In the regular representation, \(g\) fixes the basis vector \(h\) if and only if \(gh = h\), i.e., \(g = e\). Therefore:

\[
\chi_\mathrm{reg}(e) = |G|, \qquad \chi_\mathrm{reg}(g) = 0 \text{ for all } g \neq e.
\]
This single formula will later give us enormous leverage: by decomposing the regular representation into irreducibles and using the character formula, we will prove that every irreducible representation of \(G\) appears in the regular representation with multiplicity equal to its dimension. This yields the fundamental dimension formula \(|G| = \sum_i (\dim V_i)^2\).

<div class="remark">
<strong>Remark (Why zero off the identity?).</strong> Intuitively, in the regular representation, \(G\) acts by permuting its own elements freely — no non-identity element fixes anything. Algebraically: if \(g \neq e\) then left multiplication by \(g\) is a fixed-point-free permutation of \(G\). In terms of matrices: the matrix of \(\rho_\mathrm{reg}(g)\) has a 1 in position \((h, k)\) whenever \(gh = k\), i.e., \(k = gh\). For a diagonal entry \((h, h)\) to be nonzero we'd need \(gh = h\), i.e., \(g = e\). So for \(g \neq e\), all diagonal entries are zero, confirming \(\chi_\mathrm{reg}(g) = 0\).
</div>

## Constructing New Representations from Old

Given \(G\)-modules \(V\) and \(W\), we can build new ones:

**Subrepresentations.** A **\(G\)-submodule** of \(V\) is a subspace \(U \subseteq V\) that is \(G\)-invariant: \(gu \in U\) for all \(g \in G\), \(u \in U\). A \(G\)-invariant subspace \(U\) is itself a representation; in a matrix basis adapted to \(U \subseteq V\), the matrix of \(\rho(g)\) is block upper triangular with \(\rho|_U(g)\) in the upper-left block.

**Direct sum.** The direct sum \(V \oplus W\) becomes a \(G\)-module under \(g(v,w) = (gv, gw)\), with block-diagonal matrix representation \(\rho(g) \oplus \sigma(g)\).

**Dual representation.** The dual space \(V^* = \mathrm{Hom}(V, F)\) becomes a \(G\)-module under \((g \cdot f)(v) = f(g^{-1}v)\), called the **dual** or **contragredient** of \(V\). In matrix terms, the dual representation is the **inverse transpose**: \(r^*(g) = r(g^{-1})^T\).

**Quotient representation.** If \(U \subseteq V\) is a \(G\)-submodule, then \(V/U\) becomes a \(G\)-module via \(g(v + U) = gv + U\). The First Isomorphism Theorem holds in this setting: if \(T : V \to W\) is \(G\)-linear then \(V/\ker T \cong \mathrm{im}\, T\) as \(G\)-modules.

**Fixed points.** For any \(G\)-module \(V\), the subspace \(V^G = \{v \in V : gv = v \text{ for all } g \in G\}\) of \(G\)-fixed points is a \(G\)-submodule isomorphic to a direct sum of copies of the trivial representation.

<div class="remark">
<strong>Remark (The averaging projector).</strong> The element \(P = \frac{1}{|G|}\sum_{g \in G} \rho(g)\) defines a linear map \(V \to V\) that is a projection onto \(V^G\). To see this: \(P\) is clearly in \(\mathrm{Hom}_G(V,V)\) (it commutes with every \(\rho(h)\) since the sum over \(g\) and over \(hg\) is the same), its image is contained in \(V^G\) (since \(\rho(h)Pv = Pv\)), and \(P\) fixes every \(v \in V^G\) (since \(Pv = \frac{1}{|G|}\sum_g v = v\)). In particular, \(\dim V^G = \mathrm{tr}(P) = \frac{1}{|G|}\sum_g \chi_V(g)\).
</div>

## Tensor Products of Vector Spaces

The tensor product construction is central to representation theory. The idea is to define a "product" \(V \otimes W\) that mimics bilinear operations.

Given \(F\)-vector spaces \(V\) and \(W\), the tensor product \(V \otimes_F W\) is the quotient of the free vector space \(F\langle V \times W \rangle\) by the subspace generated by all vectors of the form

\[
(v, w_1+w_2) - (v,w_1) - (v,w_2), \quad (v_1+v_2,w) - (v_1,w) - (v_2,w), \quad (cv,w) - c(v,w), \quad (v,cw) - c(v,w).
\]
The coset of \((v,w)\) is denoted \(v \otimes w\) and called a **pure tensor**. By construction, \(\otimes\) is bilinear, and *every element of \(V \otimes W\) is a finite sum of pure tensors* — though not every element is itself a pure tensor.

<div class="theorem">
<strong>Theorem (Universal Property of \(\otimes\)).</strong> For any bilinear map \(\beta : V \times W \to U\), there exists a unique linear map \(B : V \otimes W \to U\) such that \(\beta = B \circ \otimes\). That is, to define a linear map from \(V \otimes W\), it suffices to give a bilinear map on \(V \times W\).
</div>

If \(\{e_i\}\) is a basis for \(V\) and \(\{f_j\}\) is a basis for \(W\), then \(\{e_i \otimes f_j\}\) is a basis for \(V \otimes W\), so \(\dim(V \otimes W) = (\dim V)(\dim W)\).

**Tensor product of \(G\)-modules.** If \(V\) and \(W\) are \(G\)-modules, their **inner tensor product** is \(V \otimes W\) with action \(g(v \otimes w) = gv \otimes gw\). Even if \(V\) and \(W\) are irreducible, their tensor product can be reducible — this creates an interesting decomposition problem called the **Clebsch-Gordan problem**.

<div class="example">
<strong>Example (Tensor product for \(S_3\)).</strong> Let us compute \(V_\mathrm{std} \otimes V_\mathrm{sgn}\) for \(S_3\). Since \(\chi_{V \otimes W} = \chi_V \cdot \chi_W\) (pointwise product), the character values are:

\[
\chi_\mathrm{std}(e) \cdot \chi_\mathrm{sgn}(e) = 2 \cdot 1 = 2, \quad \chi_\mathrm{std}((12)) \cdot \chi_\mathrm{sgn}((12)) = 0 \cdot (-1) = 0, \quad \chi_\mathrm{std}((123)) \cdot \chi_\mathrm{sgn}((123)) = (-1) \cdot 1 = -1.
\]
This is exactly the character of \(V_\mathrm{std}\)! Hence \(V_\mathrm{std} \otimes V_\mathrm{sgn} \cong V_\mathrm{std}\). This makes geometric sense: twisting by a sign doesn't change the geometry of the 2D rotation/reflection representation.
</div>

One can also form the **outer tensor product** of a \(G_1\)-module \(V\) and a \(G_2\)-module \(W\): this is a representation of \(G_1 \times G_2\) on \(V \otimes W\) via \((g_1, g_2)(v \otimes w) = g_1v \otimes g_2w\). A fundamental result:

<div class="theorem">
<strong>Theorem.</strong> Let \(V\) be an irreducible \(G_1\)-module and \(W\) an irreducible \(G_2\)-module. Then \(V \otimes W\) is an irreducible \(G_1 \times G_2\)-module. Conversely, every irreducible representation of \(G_1 \times G_2\) over an algebraically closed field arises this way.
</div>

This theorem is extremely useful: it tells us that classifying representations of \(G_1 \times G_2\) reduces entirely to classifying representations of the two factors separately. For example, the irreducible representations of \(C_2 \times C_2\) are in bijection with pairs of irreducibles of \(C_2\), of which there are \(2 \times 2 = 4\) — and indeed \(C_2 \times C_2\) has 4 conjugacy classes, consistent with the count.

## The Hom Space and the Trace

There is a beautiful interplay between \(\mathrm{Hom}\) spaces and tensor products. For \(G\)-modules \(V\) and \(W\):

<div class="theorem">
<strong>Theorem.</strong> There is a \(G\)-linear isomorphism \(V^* \otimes W \xrightarrow{\sim} \mathrm{Hom}(V,W)\), sending \(f \otimes w\) to the map \(v \mapsto f(v)w\). In particular,

\[
\mathrm{Hom}_G(V,W) = \mathrm{Hom}(V,W)^G.
\]
</div>

This perspective makes the **trace** of a linear operator more conceptual. The evaluation map \(\tau : V^* \otimes V \to F\) defined by \(\tau(f \otimes v) = f(v)\) corresponds, under the isomorphism \(V^* \otimes V \cong \mathrm{Hom}(V,V)\), precisely to the trace functional. This is the "natural" linear functional on \(\mathrm{Hom}(V,V)\).

The identification \(\mathrm{Hom}_G(V, W) = (V^* \otimes W)^G\) lets us compute dimensions using the averaging formula: \(\dim \mathrm{Hom}_G(V, W) = \dim (V^* \otimes W)^G = \frac{1}{|G|} \sum_{g \in G} \chi_{V^*}(g) \chi_W(g) = \frac{1}{|G|} \sum_{g \in G} \overline{\chi_V(g)} \chi_W(g) = \langle \chi_V, \chi_W \rangle.\) This is a preview of the fundamental orthogonality of characters.

# Chapter 4: Irreducibility and Maschke's Theorem

## Irreducible Representations

Given that we want to classify all representations of \(G\), it makes sense to first identify the "atoms" — representations that cannot be broken into smaller pieces.

<div class="definition">
<strong>Definition.</strong> A \(G\)-module \(V \neq 0\) is <strong>irreducible</strong> (or <strong>simple</strong>) if its only \(G\)-submodules are \(0\) and \(V\) itself. It is <strong>indecomposable</strong> if \(V \cong U \oplus W\) implies \(U = 0\) or \(W = 0\). A representation that is a direct sum of irreducible representations is called <strong>completely reducible</strong> (or <strong>semisimple</strong>).
</div>

Irreducible implies indecomposable, but the converse fails in general (it holds for finite groups in characteristic zero, as we will see). A one-dimensional representation is always irreducible.

To get a feel for what irreducibility means in practice: the two-dimensional standard representation \(V_\mathrm{std}\) of \(S_3\) is irreducible because there is no line in \(\mathbb{C}^2\) fixed by all rotations and reflections of the equilateral triangle. On the other hand, the three-dimensional defining representation of \(S_3\) (permuting the standard basis of \(\mathbb{C}^3\)) is *not* irreducible: the line spanned by \(e_1 + e_2 + e_3\) is \(S_3\)-invariant.

<div class="example">
<strong>Example (\(\mathrm{Irr}_\mathbb{C}(S_3)\)).</strong> The complex irreducible representations of \(S_3\) are:
<ul>
<li>The <strong>trivial representation</strong> \(V_\mathrm{triv}\) (dimension 1): \(\rho(\pi) = 1\) for all \(\pi\).</li>
<li>The <strong>sign representation</strong> \(V_\mathrm{sgn}\) (dimension 1): \(\rho(\pi) = \mathrm{sgn}(\pi)\).</li>
<li>The <strong>standard representation</strong> \(V_\mathrm{std}\) (dimension 2): the action on the plane described earlier.</li>
</ul>
These are all the irreducible complex representations of \(S_3\). One can verify this by noting that \(S_3\) has 3 conjugacy classes, so there are exactly 3 irreducible representations (a fact we will prove in Chapter 8). The dimensions must satisfy \(1^2 + 1^2 + 2^2 = 6 = |S_3|\), which is indeed satisfied.
</div>

<div class="example">
<strong>Example (\(\mathrm{Irr}_\mathbb{C}(\mathbb{Z}/n\mathbb{Z})\)).</strong> The cyclic group \(C_n = \mathbb{Z}/n\mathbb{Z}\) is abelian with \(n\) elements and \(n\) conjugacy classes. All irreducible complex representations are one-dimensional (by Schur's Lemma for abelian groups, proved in Chapter 5). They are \(\rho_k : m \mapsto e^{2\pi i mk/n}\) for \(k = 0, 1, \ldots, n-1\). The character table is the \(n \times n\) <strong>DFT matrix</strong>:

\[
\chi_{V_k}(m) = e^{2\pi i mk/n} = \omega^{mk}, \quad \omega = e^{2\pi i/n}.
\]
The orthogonality of rows in the character table is just the orthogonality of rows in the DFT matrix — the mathematical basis of the discrete Fourier transform.
</div>

## Maschke's Theorem

The fundamental theorem of this chapter tells us when complete reducibility holds.

<div class="theorem">
<strong>Theorem (Maschke, 1898).</strong> Let \(G\) be a finite group and \(\mathrm{char}\, F \nmid |G|\). Then every finite-dimensional \(FG\)-module is completely reducible.
</div>

The hypothesis \(\mathrm{char}\, F \nmid |G|\) is sharp: if \(p = \mathrm{char}\, F\) divides \(|G|\), there exist finite-dimensional representations that are not completely reducible. This is the starting point of **modular representation theory**.

Before proving Maschke's theorem, let us understand precisely why the characteristic hypothesis is necessary. This requires a concrete counterexample.

<div class="example">
<strong>Example (The failure of Maschke in characteristic \(p\): fully worked).</strong> Let \(p\) be prime, \(G = C_p = \mathbb{Z}/p\mathbb{Z} = \langle a \rangle\), and \(F = \mathbb{F}_p\) (the field with \(p\) elements, also known as \(\mathbb{Z}/p\mathbb{Z}\) as a field). Consider the 2-dimensional representation:

\[
\rho : G \to \mathrm{GL}_2(\mathbb{F}_p), \quad \rho(a) = \begin{pmatrix} 1 & 1 \\ 0 & 1 \end{pmatrix}.
\]
First, this is a valid representation: \(\rho(a)^p = \bigl(\begin{smallmatrix}1&1\\0&1\end{smallmatrix}\bigr)^p\). By the binomial theorem for upper triangular unipotent matrices, \(\bigl(\begin{smallmatrix}1&1\\0&1\end{smallmatrix}\bigr)^n = \bigl(\begin{smallmatrix}1&n\\0&1\end{smallmatrix}\bigr)\), so \(\rho(a)^p = \bigl(\begin{smallmatrix}1&p\\0&1\end{smallmatrix}\bigr) = \bigl(\begin{smallmatrix}1&0\\0&1\end{smallmatrix}\bigr) = I\) in \(\mathbb{F}_p\) (since \(p \equiv 0 \pmod{p}\)). So \(\rho(a)^p = I = \rho(e)\). Good.

Now, the subspace \(U = \{(x, 0) : x \in \mathbb{F}_p\} = \mathrm{span}\{e_1\}\) is \(G\)-invariant: \(\rho(a)(x, 0)^T = (x, 0)^T\). So \(U \cong V_\mathrm{triv}\) is a \(G\)-submodule of \(V = \mathbb{F}_p^2\).

If \(V\) were completely reducible, there would be a \(G\)-invariant complement \(W\) to \(U\) in \(V\), with \(V = U \oplus W\). Since \(\dim V = 2\) and \(\dim U = 1\), we'd need \(\dim W = 1\), i.e., \(W = \mathrm{span}\{v\}\) for some vector \(v = (b, c)\) with \(c \neq 0\) (since \(W \cap U = 0\)). For \(W\) to be \(G\)-invariant, we'd need \(\rho(a)v \in W\), i.e., \(\rho(a)v = \lambda v\) for some \(\lambda \in \mathbb{F}_p^\times\). Computing:

\[
\rho(a)\begin{pmatrix}b\\c\end{pmatrix} = \begin{pmatrix}1&1\\0&1\end{pmatrix}\begin{pmatrix}b\\c\end{pmatrix} = \begin{pmatrix}b+c\\c\end{pmatrix}.
\]
For this to equal \(\lambda(b, c)^T\), we need \(b + c = \lambda b\) and \(c = \lambda c\). The second equation gives \(\lambda = 1\) (since \(c \neq 0\)), and then the first gives \(b + c = b\), i.e., \(c = 0\) — contradiction. So no such complement exists, and \(V\) is indecomposable but not irreducible.

The root cause: the "averaging trick" would require dividing by \(|G| = p\), but \(p = 0\) in \(\mathbb{F}_p\). Concretely, the averaged projection onto \(U\) would be

\[
\widetilde{P} = \frac{1}{p}\sum_{k=0}^{p-1} \rho(a^k) P_0 \rho(a^k)^{-1},
\]
but \(1/p\) does not exist in \(\mathbb{F}_p\). The averaging trick literally cannot be performed.
</div>

<div class="remark">
<strong>Remark (Modular representation theory).</strong> The study of representations over fields of characteristic \(p \mid |G|\) is called <em>modular representation theory</em> and was pioneered by Richard Brauer in the 1930s–1950s. The theory is vastly more complicated than the characteristic-zero case: indecomposable representations need not be irreducible, decompositions are non-unique, and the number of irreducible representations can be much smaller than the number of conjugacy classes. The Brauer character is the modular analogue of the ordinary character, and the decomposition matrix encoding which modular representations arise as reductions of characteristic-zero representations is a central object of study.
</div>

The key ingredient in the proof of Maschke's theorem is the **averaging trick** (or Weyl's unitary trick in its continuous analogue):

<div class="proof">
<strong>Proof of Maschke's Theorem (detailed).</strong> We prove: every submodule \(U \subseteq V\) has a \(G\)-invariant complement.

<strong>Step 1 (Choose any complement, then average it).</strong> Since \(U\) is a subspace of the vector space \(V\), there exists a linear projection \(P_0 : V \to V\) with image \(U\) (i.e., \(P_0^2 = P_0\) and \(\mathrm{im}(P_0) = U\)). Such a projection exists because any subspace of a vector space is a direct summand as a vector space. However, \(P_0\) need not be \(G\)-equivariant. We fix this by averaging:

\[
\widetilde{P} = \frac{1}{|G|} \sum_{g \in G} \rho(g) \circ P_0 \circ \rho(g)^{-1}.
\]
The factor \(1/|G|\) requires \(|G| \neq 0\) in \(F\), which is our hypothesis.

<strong>Step 2 (\(\widetilde{P}\) is a projection onto \(U\)).</strong> For any \(v \in V\), \(\widetilde{P}(v)\) is in \(U\): each term \(\rho(g)P_0\rho(g)^{-1}v\) lies in \(\rho(g)(U)\), and since \(U\) is \(G\)-invariant, \(\rho(g)(U) \subseteq U\). So \(\widetilde{P}(v) \in U\) for all \(v\).

For \(u \in U\): \(\rho(g)^{-1}u \in U\) (by \(G\)-invariance of \(U\)), then \(P_0(\rho(g)^{-1}u) = \rho(g)^{-1}u\) (since \(P_0\) is the identity on \(U\)), then \(\rho(g)(\rho(g)^{-1}u) = u\). So each term in the sum equals \(u\), giving \(\widetilde{P}(u) = \frac{1}{|G|} \cdot |G| \cdot u = u\). Thus \(\widetilde{P}\) fixes \(U\) pointwise and maps \(V\) into \(U\), confirming it is a projection.

<strong>Step 3 (\(\widetilde{P}\) is \(G\)-equivariant).</strong> For any \(h \in G\):

\[
\rho(h) \circ \widetilde{P} = \frac{1}{|G|}\sum_{g \in G} \rho(h)\rho(g) P_0 \rho(g)^{-1} = \frac{1}{|G|}\sum_{g \in G} \rho(hg) P_0 \rho(hg)^{-1} \cdot \rho(h).
\]
Substituting \(g' = hg\) (a bijection on \(G\)) gives \(\rho(h)\circ\widetilde{P} = \widetilde{P} \circ \rho(h)\).

<strong>Step 4 (\(W = \ker\widetilde{P}\) is a \(G\)-invariant complement).</strong> Since \(\widetilde{P}^2 = \widetilde{P}\) (it is a projection), \(V = \mathrm{im}(\widetilde{P}) \oplus \ker(\widetilde{P}) = U \oplus W\). Since \(\widetilde{P}\) is \(G\)-equivariant and \(W = \ker(\widetilde{P})\), for \(w \in W\) and \(g \in G\):

\[
\widetilde{P}(\rho(g)w) = \rho(g)(\widetilde{P}(w)) = \rho(g)(0) = 0.
\]
So \(\rho(g)w \in \ker\widetilde{P} = W\). Thus \(W\) is \(G\)-invariant. \(\square\)
</div>

Let us verify the \(G\)-invariance claim once more from a slightly different angle: for any \(h \in G\),

\[
\rho(h) \widetilde{P} \rho(h)^{-1} = \frac{1}{|G|} \sum_{g \in G} \rho(h)\rho(g) P_0 \rho(g)^{-1} \rho(h)^{-1} = \frac{1}{|G|} \sum_{g \in G} \rho(hg) P_0 \rho(hg)^{-1} = \frac{1}{|G|} \sum_{g' \in G} \rho(g') P_0 \rho(g')^{-1} = \widetilde{P},
\]
where we substituted \(g' = hg\) and used that the sum over \(G\) is invariant under left translation. So \(\widetilde{P}\) commutes with all \(\rho(h)\), meaning \(\ker \widetilde{P}\) is \(G\)-invariant.

The factor \(1/|G|\) requires that \(|G|\) is invertible in \(F\), hence the characteristic hypothesis. As a corollary:

<div class="corollary">
<strong>Corollary.</strong> If \(\mathrm{char}\, F \nmid |G|\), then a finite-dimensional \(FG\)-module is irreducible if and only if it is indecomposable.
</div>

Maschke's theorem also implies that every finite-dimensional unitary representation of a finite group is completely reducible (using the complement \(W = U^\perp\)). The inner product needed to make a representation unitary can always be constructed by averaging: given any inner product \(\langle \cdot, \cdot \rangle_0\) on \(V\), define

\[
\langle v, w \rangle = \frac{1}{|G|} \sum_{g \in G} \langle \rho(g)v, \rho(g)w \rangle_0.
\]
This averaged inner product is \(G\)-invariant, making \(\rho\) unitary with respect to it.

<div class="remark">
<strong>Remark (Weyl's unitary trick).</strong> Maschke's averaging argument has a continuous analogue due to Hermann Weyl (1925): for a compact topological group \(G\), one replaces the average \(\frac{1}{|G|}\sum_{g \in G}\) with the Haar integral \(\int_G \cdot \, dg\) (normalised so that \(\int_G 1\, dg = 1\)). The conclusion is the same: every finite-dimensional complex representation of a compact group is completely reducible. This applies to \(SO(n)\), \(SU(n)\), and \(U(n)\), and is the foundation of harmonic analysis on compact groups.
</div>

# Chapter 5: Schur's Lemma and Isotypic Decompositions

## Schur's Lemma

Schur's Lemma is perhaps the single most-used tool in representation theory. It says that irreducible representations are rigid: the only \(G\)-linear maps between two irreducibles are either zero or isomorphisms.

<div class="theorem">
<strong>Theorem (Schur's Lemma).</strong> Let \(V\) and \(W\) be irreducible \(G\)-modules.
<ol>
<li>Any nonzero map in \(\mathrm{Hom}_G(V, W)\) is an isomorphism.</li>
<li>If \(F\) is algebraically closed and \(V\) is finite-dimensional, then \(\mathrm{Hom}_G(V,V) = \{\lambda\, \mathrm{id} : \lambda \in F\} \cong F\).</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> For (1): if \(T \in \mathrm{Hom}_G(V, W)\) is nonzero, then \(\ker T\) and \(\mathrm{im}\, T\) are \(G\)-submodules of \(V\) and \(W\) respectively. Since \(V\) is irreducible and \(T \neq 0\), we have \(\ker T = 0\). Since \(W\) is irreducible and \(\mathrm{im}\, T \neq 0\), we have \(\mathrm{im}\, T = W\). So \(T\) is an isomorphism.

For (2): any \(T \in \mathrm{Hom}_G(V,V)\) has an eigenvalue \(\lambda \in F\) (since \(F\) is algebraically closed and \(V\) is finite-dimensional, the characteristic polynomial of \(T\) has a root in \(F\)). Then \(T - \lambda\, \mathrm{id} \in \mathrm{Hom}_G(V,V)\) is not invertible (since \(\lambda\) is an eigenvalue), hence by (1) it must be zero. So \(T = \lambda\, \mathrm{id}\). \(\square\)
</div>

Let us unpack why Part (1) works so cleanly. The kernel and image of a \(G\)-linear map are automatically \(G\)-invariant: if \(T(v) = 0\) and \(T\) is \(G\)-linear, then \(T(gv) = gT(v) = g \cdot 0 = 0\), so \(gv \in \ker T\). Similarly, \(T(gv) = g T(v) \in g \cdot \mathrm{im}(T)\), so the image is \(G\)-stable. Irreducibility then forces these subspaces to be trivial, leaving no room for \(T\) to be anything but an isomorphism.

Part (2) fails if \(F\) is not algebraically closed. For instance, over \(\mathbb{R}\), the two-dimensional rotation representation of \(C_4\) is irreducible, but multiplication by \(i\) (rotation by 90°) is a \(\mathbb{R}C_4\)-linear endomorphism that is not a scalar multiple of the identity.

The consequence of Part (2) is often called "Schur's magical fact": if \(V\) is an irreducible \(\mathbb{C}G\)-module and \(T : V \to V\) commutes with every \(\rho(g)\), then \(T\) is multiplication by a scalar. This is magical because it is a purely algebraic statement with no continuity or topological assumptions — and it is the key reason why irreducible representations over algebraically closed fields are "rigid."

## Schur's Lemma for Abelian Groups

The following corollary is one of the most important consequences of Schur's Lemma, and it is the bridge from representation theory to Fourier analysis.

<div class="corollary">
<strong>Corollary.</strong> If \(G\) is abelian and \(F\) is algebraically closed, then every irreducible finite-dimensional \(FG\)-module is one-dimensional.
</div>

<div class="proof">
<strong>Proof.</strong> For any \(h \in G\), the map \(\rho(h) : V \to V\) is \(G\)-linear (because \(\rho(h)\rho(g) = \rho(hg) = \rho(gh) = \rho(g)\rho(h)\) when \(G\) is abelian). By Schur's Lemma (2), \(\rho(h) = \lambda_h \cdot \mathrm{id}_V\) for some scalar \(\lambda_h\). Therefore every subspace of \(V\) is \(G\)-invariant: if \(U \subseteq V\) is any subspace and \(u \in U\), then \(hu = \rho(h)u = \lambda_h u \in U\). Since \(V\) is irreducible, its only \(G\)-invariant subspaces are \(0\) and \(V\). Every one-dimensional subspace is \(G\)-invariant (as computed above), so if \(\dim V \geq 2\), there would be proper nontrivial submodules. Hence \(\dim V = 1\). \(\square\)
</div>

This corollary is the starting point of Fourier analysis on abelian groups. For \(G = \mathbb{Z}/n\mathbb{Z}\), it says every irreducible complex representation is a character \(\rho_k : j \mapsto e^{2\pi ijk/n}\) — exactly the "frequencies" of discrete Fourier analysis.

<div class="remark">
<strong>Remark (Why commutativity matters).</strong> The key step is that \(\rho(h)\) is \(G\)-linear when \(G\) is abelian. In a non-abelian group, \(\rho(h)\rho(g) = \rho(hg) \neq \rho(gh) = \rho(g)\rho(h)\) in general, so \(\rho(h)\) is not \(G\)-equivariant. This is why non-abelian groups can have higher-dimensional irreducible representations. For example, \(S_3\) has a 2-dimensional irreducible, and \(A_4\) has a 3-dimensional irreducible.
</div>

<div class="example">
<strong>Example (Schur's lemma and the center).</strong> More generally, if \(V\) is an irreducible \(\mathbb{C}G\)-module and \(z \in Z(G)\) (the center of \(G\)), then \(\rho(z) : V \to V\) commutes with all \(\rho(g)\) (by centrality), so \(\rho(z) = \lambda_z \cdot \mathrm{id}_V\) for some scalar \(\lambda_z\). The function \(z \mapsto \lambda_z\) is a group homomorphism \(Z(G) \to \mathbb{C}^\times\), i.e., a one-dimensional representation of \(Z(G)\). This is often called the <em>central character</em> of \(V\). For example, for \(G = S_n\), the center is trivial (for \(n \geq 3\)), so this gives no information; but for \(G = GL_n(\mathbb{F}_q)\), the center is \(\mathbb{F}_q^\times\) and central characters are important invariants.
</div>

<div class="example">
<strong>Example (Schur's Lemma in action: non-isomorphic irreducibles).</strong> Let \(V\) and \(W\) be two non-isomorphic irreducible \(\mathbb{C}G\)-modules. Schur's Lemma tells us \(\mathrm{Hom}_G(V, W) = 0\): the only \(G\)-linear map from \(V\) to \(W\) is the zero map. This is a strong constraint. For instance, for \(S_3\), the three irreducibles are \(V_\mathrm{triv}\), \(V_\mathrm{sgn}\), and \(V_\mathrm{std}\). We have \(\mathrm{Hom}_{S_3}(V_\mathrm{triv}, V_\mathrm{std}) = 0\): there is no nonzero \(S_3\)-equivariant linear map from the trivial representation into the standard representation. This is another way of saying that \(V_\mathrm{std}\) has no trivial sub-representation — a fact we also see from the character computation \(\langle \chi_\mathrm{triv}, \chi_\mathrm{std} \rangle = 0\).
</div>

## Isotypic Decompositions

Maschke's theorem guarantees that every finite-dimensional \(FG\)-module (over a field of suitable characteristic) is a direct sum of irreducibles. But such a decomposition is not unique — different choices of basis can split things differently. What *is* canonical is how many copies of each irreducible appear.

<div class="definition">
<strong>Definition.</strong> Let \(\mathrm{Irr}_F(G) = \{V_1, \ldots, V_r\}\) be the set of isomorphism classes of irreducible \(FG\)-modules. For a completely reducible module \(V\), the <strong>isotypic decomposition</strong> of \(V\) is the decomposition

\[
V \cong V_1^{\oplus m_1} \oplus \cdots \oplus V_r^{\oplus m_r},
\]
where \(m_i = \dim_F \mathrm{Hom}_G(V_i, V)\) is the <strong>multiplicity</strong> of \(V_i\) in \(V\). The summand \(V_i^{\oplus m_i}\) is the <strong>\(V_i\)-isotypic component</strong> of \(V\).
</div>

<div class="theorem">
<strong>Theorem (Uniqueness of Isotypic Decompositions).</strong> The isotypic decomposition is unique: the multiplicities \(m_i\) are uniquely determined by \(V\). Equivalently, \(V \cong W\) if and only if \(m_i(V) = m_i(W)\) for all \(i\).
</div>

<div class="proof">
<strong>Proof sketch.</strong> Suppose \(V \cong \bigoplus_i V_i^{\oplus m_i}\) and \(V \cong \bigoplus_i V_i^{\oplus n_i}\). Apply Schur's Lemma: \(\dim \mathrm{Hom}_G(V_j, V) = m_j\) from the first decomposition and \(= n_j\) from the second. So \(m_j = n_j\). \(\square\)
</div>

The multiplicity formula \(m_i = \dim \mathrm{Hom}_G(V_i, V)\) is powerful. It says: to find how many times \(V_i\) appears in \(V\), count the \(G\)-linear maps from \(V_i\) into \(V\).

<div class="remark">
<strong>Remark (The isotypic component is canonical).</strong> While the decomposition \(V = V_1^{\oplus m_1} \oplus \cdots\) is not canonical (there are many ways to split a given isotypic component into a direct sum of irreducibles), the isotypic component \(V_i^{\oplus m_i}\) <em>itself</em> is canonical: it is equal to the sum of all \(G\)-submodules of \(V\) isomorphic to \(V_i\). In particular, any \(G\)-module map \(\phi : V \to V\) necessarily preserves each isotypic component. This is the representation-theoretic analogue of the fact that a linear map preserving a bilinear form must preserve the eigenspace decomposition.
</div>

<div class="example">
<strong>Example (Isotypic decomposition of \(V_\mathrm{std}^{\otimes 2}\) for \(S_3\)).</strong> We computed earlier that \(V_\mathrm{std} \otimes V_\mathrm{std} \cong V_\mathrm{triv} \oplus V_\mathrm{sgn} \oplus V_\mathrm{std}\). The multiplicities are \(m_\mathrm{triv} = 1\), \(m_\mathrm{sgn} = 1\), \(m_\mathrm{std} = 1\). Equivalently, \(\dim \mathrm{Hom}_{S_3}(V_\mathrm{triv}, V_\mathrm{std}^{\otimes 2}) = 1\), and so on for the other irreducibles.
</div>

# Chapter 6: Fourier Analysis and the Regular Representation

## Fourier Analysis on Finite Abelian Groups

The representation theory of finite abelian groups is Fourier analysis in disguise. This is one of the oldest and most beautiful connections in mathematics.

Let \(G\) be a finite abelian group. By the structure theorem, \(G \cong C_{n_1} \times \cdots \times C_{n_k}\). Since \(G\) is abelian, Schur's Lemma forces all irreducible complex representations to be one-dimensional. A one-dimensional complex representation of \(G\) with image in \(U_1(\mathbb{C}) = \{z \in \mathbb{C} : |z| = 1\}\) is called a **unitary character**.

<div class="theorem">
<strong>Theorem.</strong> Let \(G\) be a finite abelian group.
<ol>
<li>The group \(\widehat{G}\) of unitary characters equals \(\mathrm{Irr}_\mathbb{C}(G)\) and satisfies \(|\widehat{G}| = |G|\).</li>
<li><strong>(Orthogonality)</strong> The characters form an orthonormal set in \(\ell^2(G)\) with inner product \(\langle f, g \rangle = \frac{1}{|G|}\sum_{x \in G} f(x)\overline{g(x)}\).</li>
<li><strong>(Completeness)</strong> The characters form a basis for \(\ell^2(G)\).</li>
</ol>
Thus, every \(f \in \ell^2(G)\) has a unique Fourier expansion \(f = \sum_{\chi \in \widehat{G}} \langle f, \chi \rangle \chi\).
</div>

The classical Fourier analysis on \(\mathbb{R}/2\pi\mathbb{Z}\) is the limiting case of this theorem as the group becomes continuous. The functions \(e_n(x) = e^{inx}\) are precisely the unitary characters of \(\mathbb{R}/2\pi\mathbb{Z}\), and the Fourier series expansion is the analogue of the finite group case with \(\ell^2(G)\) replaced by \(L^2(\mathbb{R}/2\pi\mathbb{Z})\).

<div class="example">
<strong>Example (Fourier analysis on \(C_4\)).</strong> The group \(C_4 = \{0, 1, 2, 3\}\) (with addition mod 4) has four irreducible characters:

\[
\chi_k(m) = i^{km}, \quad k = 0, 1, 2, 3, \quad i = e^{2\pi i / 4}.
\]
For any function \(f : C_4 \to \mathbb{C}\), say \(f = (f_0, f_1, f_2, f_3)\) (the values at \(0, 1, 2, 3\)), the Fourier coefficients are

\[
\hat f(k) = \langle f, \chi_k \rangle = \frac{1}{4}(f_0 + f_1 i^{-k} + f_2 i^{-2k} + f_3 i^{-3k}).
\]
This is exactly the discrete Fourier transform, and the Fourier inversion formula \(f(m) = \sum_{k=0}^3 \hat f(k) \chi_k(m)\) is the familiar DFT inverse. The representation-theoretic perspective gives a clean proof: since the four characters are an orthonormal basis for the four-dimensional space \(\ell^2(C_4)\), Fourier inversion is just basis expansion.
</div>

## The Isotypic Decomposition of the Regular Representation

The following theorem is the centrepiece of the whole theory.

<div class="theorem">
<strong>Theorem.</strong> Let \(F\) be algebraically closed with \(\mathrm{char}\, F \nmid |G|\), and let \(\mathrm{Irr}_F(G) = \{V_1, \ldots, V_r\}\). Then:
<ol>
<li>(Isotypic decomposition) \(F\langle G \rangle \cong V_1^{\oplus \dim V_1} \oplus \cdots \oplus V_r^{\oplus \dim V_r}\).</li>
<li>(Dimension formula) \(|G| = (\dim V_1)^2 + \cdots + (\dim V_r)^2\).</li>
<li>There are only finitely many irreducible representations, and \(r \leq |G|\).</li>
</ol>
</div>

The key step is Lemma: the map \(\mathrm{Hom}_G(F\langle G \rangle, U) \to U\) given by \(f \mapsto f(1)\) is an isomorphism of \(F\)-vector spaces. This shows that the multiplicity of \(V_i\) in \(F\langle G \rangle\) is \(\dim \mathrm{Hom}_G(F\langle G \rangle, V_i) = \dim V_i\), giving the isotypic decomposition. The dimension formula follows by computing \(\dim F\langle G \rangle = |G|\) on both sides.

<div class="example">
<strong>Example (Decomposition of the regular representation of \(S_3\)).</strong> We have \(\mathrm{Irr}_\mathbb{C}(S_3) = \{V_\mathrm{triv}, V_\mathrm{sgn}, V_\mathrm{std}\}\) with dimensions \(1, 1, 2\). The theorem predicts:

\[
\mathbb{C}\langle S_3 \rangle \cong V_\mathrm{triv}^{\oplus 1} \oplus V_\mathrm{sgn}^{\oplus 1} \oplus V_\mathrm{std}^{\oplus 2}.
\]
Dimension check: \(1 \cdot 1 + 1 \cdot 1 + 2 \cdot 2 = 6 = |S_3|\). ✓

We can verify this concretely. The character of the regular representation is \(\chi_\mathrm{reg}(e) = 6\), \(\chi_\mathrm{reg}(g) = 0\) for \(g \neq e\). The multiplicity of \(V_\mathrm{std}\) is

\[
\langle \chi_\mathrm{std}, \chi_\mathrm{reg} \rangle = \frac{1}{6}\big(\chi_\mathrm{std}(e)\overline{\chi_\mathrm{reg}(e)} + \cdots\big) = \frac{1}{6}(2 \cdot 6 + 0 + 0) = 2.
\]
Similarly, the multiplicity of each one-dimensional representation is 1. ✓
</div>

The dimension formula \(|G| = \sum_i (\dim V_i)^2\) is one of the most useful equations in finite group theory. It severely constrains the possible dimensions of irreducible representations. For instance, if \(|G| = p\) is prime, then the only solution with all \(d_i^2 \leq p\) and \(\sum d_i^2 = p\) forces all \(d_i = 1\) and \(r = p\), implying \(G\) is abelian (actually \(G \cong C_p\)). More generally, from \(\sum d_i^2 = |G|\) and \(d_1 = 1\) (the trivial representation), we get \(d_i \leq \sqrt{|G|}\) for all \(i\), and in fact \(d_i \mid |G|\) (a result we will prove).

## Counting Irreducibles

A critical structural fact:

<div class="theorem">
<strong>Theorem.</strong> (Under the same hypotheses.) The number \(r\) of isomorphism classes of irreducible \(F\)-representations of \(G\) equals the number of conjugacy classes in \(G\). In particular, \(r = |G|\) if and only if \(G\) is abelian.
</div>

This will be proved using character theory in the next chapter. For now, the dimension formula and the count of one-dimensional representations (which equal the number of irreducibles of \(G^{\mathrm{ab}} = G/[G,G]\)) give useful constraints on the degrees.

<div class="example">
<strong>Example (\(\mathrm{Irr}_\mathbb{C}(D_8)\)).</strong> The dihedral group \(D_8 = \langle a, b : a^4 = b^2 = e,\, bab = a^{-1} \rangle\) has order 8 and 5 conjugacy classes. The derived subgroup \([D_8, D_8] = \langle a^2 \rangle\) has index 4, so there are 4 one-dimensional representations. The dimension formula gives \(8 = 1^2 + 1^2 + 1^2 + 1^2 + d_5^2\), forcing \(d_5 = 2\). Explicitly, the four degree-1 representations are lifts of characters of \(D_8/[D_8, D_8] \cong C_2 \times C_2\), and the two-dimensional one is the geometric action on the square.
</div>

<div class="example">
<strong>Example (Full character table of \(D_8\)).</strong> Let us work this out completely. Label the conjugacy classes:

\[
C_1 = \{e\}, \quad C_2 = \{a^2\}, \quad C_3 = \{a, a^3\}, \quad C_4 = \{b, a^2b\}, \quad C_5 = \{ab, a^3b\}.
\]
The four one-dimensional characters correspond to group homomorphisms \(D_8 \to \{\pm 1\}\), determined by the pair \((\rho(a), \rho(b)) \in \{\pm 1\}^2\) satisfying \(\rho(a)^4 = \rho(b)^2 = 1\) and \(\rho(b)\rho(a)\rho(b) = \rho(a)^{-1} = \rho(a)^{-1}\), which gives no constraint since \(\rho(a) = \pm 1\) implies \(\rho(a)^{-1} = \rho(a)\). So the four choices are:

\[
\chi_1: (1,1), \quad \chi_2: (1,-1), \quad \chi_3: (-1,1), \quad \chi_4: (-1,-1).
\]
For the two-dimensional representation \(\chi_5\), we use \(\rho(a) = \bigl(\begin{smallmatrix}0&-1\\1&0\end{smallmatrix}\bigr)\) and \(\rho(b) = \bigl(\begin{smallmatrix}1&0\\0&-1\end{smallmatrix}\bigr)\). Computing traces: \(\chi_5(e) = 2\), \(\chi_5(a^2) = \mathrm{tr}(-I) = -2\), \(\chi_5(a) = 0\), \(\chi_5(b) = 0\), \(\chi_5(ab) = 0\). The complete character table of \(D_8\) is:

| | \(\{e\}\) | \(\{a^2\}\) | \(\{a,a^3\}\) | \(\{b,a^2b\}\) | \(\{ab,a^3b\}\) |
|---|---|---|---|---|---|
| \(\chi_1\) | 1 | 1 | 1 | 1 | 1 |
| \(\chi_2\) | 1 | 1 | 1 | \(-1\) | \(-1\) |
| \(\chi_3\) | 1 | 1 | \(-1\) | 1 | \(-1\) |
| \(\chi_4\) | 1 | 1 | \(-1\) | \(-1\) | 1 |
| \(\chi_5\) | 2 | \(-2\) | 0 | 0 | 0 |

Verification: \(1+1+1+1+4 = 8 = |D_8|\). ✓ Row orthogonality: \(\langle \chi_5, \chi_5 \rangle = \frac{1}{8}(4 + 4 + 0 + 0 + 0) = 1\). ✓
</div>

# Chapter 7: Characters: Definition and Properties

## The Character of a Representation

Characters are the central computational and theoretical tool of representation theory. The miracle is that a function as coarse as the trace completely determines a representation.

<div class="definition">
<strong>Definition.</strong> The <strong>character</strong> of a \(\mathbb{C}G\)-module \((V, \rho)\) is the function \(\chi_\rho : G \to \mathbb{C}\) defined by \(\chi_\rho(g) = \mathrm{tr}(\rho(g))\). We also write \(\chi_V\). The character of an irreducible representation is an <strong>irreducible character</strong>.
</div>

Why should the trace be the right invariant? Among the standard similarity invariants — the characteristic polynomial, determinant, trace — the determinant is too coarse (non-isomorphic representations can have identical determinants). The trace manages, remarkably, to distinguish all representations over \(\mathbb{C}\).

The key property making this work is that the trace is *conjugation-invariant*: \(\mathrm{tr}(ABA^{-1}) = \mathrm{tr}(B)\). Changing a basis amounts to conjugating each matrix, so the trace is independent of basis choice. Moreover, conjugate group elements \(g\) and \(hgh^{-1}\) give rise to conjugate matrices \(\rho(g)\) and \(\rho(h)\rho(g)\rho(h)^{-1}\), so their traces are equal. This means characters are class functions.

<div class="proposition">
<strong>Proposition (Properties of Characters).</strong> Let \((V, \rho)\) and \((W, \sigma)\) be \(\mathbb{C}G\)-modules. Then:
<ol>
<li>\(\chi_V(hgh^{-1}) = \chi_V(g)\) for all \(g, h \in G\). (Characters are class functions.)</li>
<li>If \(V \cong W\) then \(\chi_V = \chi_W\). (The converse is also true and will be proved below.)</li>
<li>\(\chi_V(e) = \dim V\).</li>
<li>\(\chi_{V \oplus W}(g) = \chi_V(g) + \chi_W(g)\).</li>
<li>\(\chi_{V \otimes W}(g) = \chi_V(g)\chi_W(g)\).</li>
<li>\(\chi_{V^*}(g) = \chi_V(g^{-1}) = \overline{\chi_V(g)}\). (The last equality uses the fact that eigenvalues of \(\rho(g)\) are roots of unity.)</li>
<li>\(|\chi_V(g)| \leq \dim V\) for all \(g \in G\).</li>
</ol>
</div>

Let us prove the key properties (5) and (6) in detail.

<div class="proof">
<strong>Proof of (5).</strong> Let \(\{e_i\}\) be a basis for \(V\) with \(\rho(g)e_i = \sum_j a_{ji}(g) e_j\) and \(\{f_k\}\) a basis for \(W\) with \(\sigma(g)f_k = \sum_l b_{lk}(g) f_l\). The basis for \(V \otimes W\) is \(\{e_i \otimes f_k\}\), and \(g \cdot (e_i \otimes f_k) = (ge_i) \otimes (gf_k) = \sum_j a_{ji} e_j \otimes \sum_l b_{lk} f_l\). The diagonal entry for \((e_i \otimes f_k)\) in this matrix is \(a_{ii}(g) b_{kk}(g)\). Summing:

\[
\chi_{V \otimes W}(g) = \sum_{i,k} a_{ii}(g) b_{kk}(g) = \left(\sum_i a_{ii}(g)\right)\left(\sum_k b_{kk}(g)\right) = \chi_V(g)\chi_W(g). \quad \square
\]
</div>

<div class="proof">
<strong>Proof that eigenvalues of \(\rho(g)\) are roots of unity (for finite \(G\)).</strong> Since \(G\) is finite, \(g^n = e\) for some \(n = |G|\). Thus \(\rho(g)^n = \rho(g^n) = \rho(e) = \mathrm{id}\). So the minimal polynomial of \(\rho(g)\) divides \(x^n - 1\), which has only simple roots over \(\mathbb{C}\). Therefore \(\rho(g)\) is diagonalizable with eigenvalues that are \(n\)th roots of unity. If \(\lambda_1, \ldots, \lambda_d\) are the eigenvalues (with multiplicity), then \(\chi_V(g) = \sum \lambda_i\) and \(\chi_V(g^{-1}) = \sum \lambda_i^{-1} = \sum \bar\lambda_i = \overline{\chi_V(g)}\). \(\square\)
</div>

Property (4) says the character "linearizes" direct sums into ordinary addition. Property (5) says it "multiplicates" tensor products into ordinary multiplication. Together, characters form a **ring** under pointwise addition and multiplication — the **character ring** of \(G\).

<div class="example">
<strong>Example (Permutation characters).</strong> If \((V, \rho)\) is the permutation representation induced by the action of \(G\) on a finite set \(X\), then

\[
\chi_\rho(g) = |\{x \in X : gx = x\}| = |\mathrm{Fix}(g)|.
\]
This follows because in the standard basis of \(F\langle X \rangle\), the matrix of \(\rho(g)\) has a 1 in position \((x,x)\) if and only if \(gx = x\). For the regular representation specifically: \(\chi_\mathrm{reg}(e) = |G|\) and \(\chi_\mathrm{reg}(g) = 0\) for all \(g \neq e\).
</div>

<div class="example">
<strong>Example (Standard representation of \(S_3\)).</strong> The defining representation of \(S_3\) on \(\mathbb{C}^3\) decomposes as \(V_\mathrm{def} = V_\mathrm{triv} \oplus V_\mathrm{std}\), where \(V_\mathrm{std} = \{(a,b,c) : a+b+c=0\}\). The character values are:

\[
\chi_\mathrm{std}(e) = 2, \quad \chi_\mathrm{std}(\text{2-cycle}) = 0, \quad \chi_\mathrm{std}(\text{3-cycle}) = -1.
\]
These can be computed directly: the 2-cycle \((12)\) acts on \(V_\mathrm{std} \subset \mathbb{C}^3\) by swapping coordinates 1 and 2. The basis \(\{e_1 - e_2, e_1 + e_2 - 2e_3\}\) of \(V_\mathrm{std}\) transforms as \(e_1 - e_2 \mapsto -(e_1-e_2)\) and \(e_1+e_2-2e_3 \mapsto e_1+e_2-2e_3\), so the matrix is \(\bigl(\begin{smallmatrix}-1&0\\0&1\end{smallmatrix}\bigr)\) with trace 0. The 3-cycle \((123)\) sends \(e_1 \mapsto e_2 \mapsto e_3 \mapsto e_1\); on \(V_\mathrm{std}\), the matrix (in the same basis) is \(\bigl(\begin{smallmatrix}-1&-1\\1&0\end{smallmatrix}\bigr)\) with trace \(-1\).
</div>

## Class Functions and the Inner Product

A **class function** on \(G\) is a function \(f : G \to \mathbb{C}\) that is constant on conjugacy classes. Every character is a class function. The space \(\mathcal{C}(G)\) of class functions has dimension equal to \(h(G)\), the number of conjugacy classes.

We equip \(\mathcal{C}(G)\) with the Hermitian inner product:

\[
\langle f, g \rangle = \frac{1}{|G|} \sum_{x \in G} f(x)\overline{g(x)}.
\]
This inner product encodes deep information about representations via:

<div class="proposition">
<strong>Proposition.</strong> For \(\mathbb{C}G\)-modules \(V\) and \(W\):

\[
\langle \chi_V, \chi_W \rangle = \dim \mathrm{Hom}_G(W, V) = \dim \mathrm{Hom}_G(V, W).
\]
</div>

<div class="proof">
<strong>Proof.</strong> We use the earlier identification \(\mathrm{Hom}_G(V, W) = (V^* \otimes W)^G\) and the dimension formula for fixed points: \(\dim U^G = \frac{1}{|G|}\sum_{g \in G} \chi_U(g)\). With \(U = V^* \otimes W\), and using \(\chi_{V^*}(g) = \overline{\chi_V(g)}\) and \(\chi_{V^* \otimes W}(g) = \chi_{V^*}(g)\chi_W(g) = \overline{\chi_V(g)}\chi_W(g)\):

\[
\dim \mathrm{Hom}_G(V,W) = \frac{1}{|G|}\sum_{g \in G}\overline{\chi_V(g)}\chi_W(g) = \langle \chi_V, \chi_W \rangle. \quad \square
\]
</div>

The proof reveals why the inner product has its particular form: it is literally counting \(G\)-equivariant maps.

# Chapter 8: Orthogonality of Characters and Character Tables

## The Orthogonality Relations

<div class="theorem">
<strong>Theorem (Orthogonality of Irreducible Characters).</strong> Let \(\chi_V\) and \(\chi_W\) be irreducible characters of \(G\). Then:

\[
\langle \chi_V, \chi_W \rangle = \begin{cases} 1 & \text{if } V \cong W \\ 0 & \text{if } V \not\cong W. \end{cases}
\]
</div>

This is the nonabelian generalization of the orthogonality of Fourier characters of abelian groups. It follows immediately from the proposition in the previous chapter combined with Schur's Lemma (which says \(\dim \mathrm{Hom}_G(V,W) = 1\) if \(V \cong W\) and \(= 0\) otherwise).

Let us be explicit: Schur's Lemma tells us that any \(G\)-linear map from an irreducible \(V\) to an irreducible \(W\) is either 0 (if \(V \not\cong W\)) or a scalar multiple of a fixed isomorphism (if \(V \cong W\)). So \(\dim \mathrm{Hom}_G(V, W) = 0\) or \(1\), and the theorem follows from \(\langle \chi_V, \chi_W \rangle = \dim \mathrm{Hom}_G(V, W)\).

The orthogonality relations have immediate and powerful consequences:

<div class="corollary">
<strong>Corollary (Multiplicity Formula).</strong> For an irreducible \(W\) and any \(V\):

\[
\mathrm{mult}(W, V) = \langle \chi_W, \chi_V \rangle.
\]
</div>

<div class="corollary">
<strong>Corollary (Isomorphism Criterion).</strong> \(V \cong W\) if and only if \(\chi_V = \chi_W\).
</div>

<div class="corollary">
<strong>Corollary (Irreducibility Criterion).</strong> \(V\) is irreducible if and only if \(\langle \chi_V, \chi_V \rangle = 1\).
</div>

These are the tools that make character theory computationally powerful. To determine the isotypic decomposition of any representation \(V\), one simply computes the inner products \(\langle \chi_{V_i}, \chi_V \rangle\) with each irreducible character \(\chi_{V_i}\).

<div class="example">
<strong>Example (Decomposing a representation of \(S_3\) using characters).</strong> Suppose we are given the representation \(V\) of \(S_3\) with character values \(\chi_V(e) = 4\), \(\chi_V((12)) = 0\), \(\chi_V((123)) = 1\). Let us find the isotypic decomposition. Using the character table (below):

\[
m_\mathrm{triv} = \langle \chi_V, \chi_\mathrm{triv} \rangle = \tfrac{1}{6}(1 \cdot 4 + 3 \cdot 0 \cdot 1 + 2 \cdot 1 \cdot 1) = \tfrac{6}{6} = 1.
\]

\[
m_\mathrm{sgn} = \langle \chi_V, \chi_\mathrm{sgn} \rangle = \tfrac{1}{6}(1 \cdot 4 + 3 \cdot 0 \cdot (-1) + 2 \cdot 1 \cdot 1) = \tfrac{6}{6} = 1.
\]

\[
m_\mathrm{std} = \langle \chi_V, \chi_\mathrm{std} \rangle = \tfrac{1}{6}(1 \cdot 8 + 3 \cdot 0 \cdot 0 + 2 \cdot 1 \cdot (-1)) = \tfrac{6}{6} = 1.
\]
Check: \(1 \cdot 1 + 1 \cdot 1 + 1 \cdot 2 = 4 = \chi_V(e) = \dim V\). ✓ So \(V \cong V_\mathrm{triv} \oplus V_\mathrm{sgn} \oplus V_\mathrm{std}\).
</div>

## Completeness and the Character Table

<div class="theorem">
<strong>Theorem (Completeness of Irreducible Characters).</strong> The irreducible characters \(\chi_{V_1}, \ldots, \chi_{V_r}\) form an orthonormal basis for the space \(\mathcal{C}(G)\) of class functions on \(G\). In particular, \(r = h(G)\) (the number of conjugacy classes).
</div>

This theorem completes the "Fourier analysis" picture for nonabelian groups: just as the unitary characters of a finite abelian group are an orthonormal basis for \(\ell^2(G)\), the irreducible characters of a finite group are an orthonormal basis for the subspace \(\mathcal{C}(G)\) of \(\ell^2(G)\).

<div class="proof">
<strong>Proof (sketch).</strong> We already know the irreducible characters are orthonormal (by the first orthogonality theorem). It remains to show they span \(\mathcal{C}(G)\), i.e., that no nonzero class function is orthogonal to all irreducible characters.

Suppose \(f \in \mathcal{C}(G)\) satisfies \(\langle f, \chi_V \rangle = 0\) for all \(V \in \mathrm{Irr}(G)\). Define the operator \(T_f = \sum_{g \in G} f(g)\rho(g)\) on a \(G\)-module \(V\). One checks that \(T_f\) is \(G\)-linear. If \(V\) is irreducible, Schur's lemma implies \(T_f = \lambda \cdot \mathrm{id}_V\). Taking traces: \(\lambda \dim V = \mathrm{tr}(T_f) = \sum_{g} f(g) \chi_V(g) = |G| \langle f, \chi_V \rangle = 0\). So \(T_f = 0\) on every irreducible \(V\).

Applied to the regular representation (which contains every irreducible): \(T_f = 0\) on \(\mathbb{C}\langle G \rangle\). Evaluating on the basis vector \(e\):

\[
T_f(e) = \sum_{g \in G} f(g) \rho_\mathrm{reg}(g)(e) = \sum_{g \in G} f(g) \cdot g = 0.
\]
Since \(\{g : g \in G\}\) is a basis for \(\mathbb{C}\langle G \rangle\), this implies \(f(g) = 0\) for all \(g\). So \(f = 0\). \(\square\)
</div>

The geometric picture is striking: the vector space \(\mathcal{C}(G)\) has dimension \(h(G)\) (one dimension per conjugacy class, since a class function is determined by its values on the \(h(G)\) conjugacy classes). The irreducible characters are an orthonormal basis for this space. The number of irreducibles equals the number of conjugacy classes: this is not a coincidence, it is a theorem.

The **character table** of \(G\) is the \(r \times r\) matrix (where \(r = h(G)\)) whose rows are indexed by irreducible representations and whose columns are indexed by conjugacy classes, with entry \(\chi_{V_i}(C_j)\) for conjugacy class representative \(C_j\):

| | \(C_1\) | \(C_2\) | \(\cdots\) | \(C_r\) |
|---|---|---|---|---|
| \(\chi_1\) | \(\chi_1(C_1)\) | \(\chi_1(C_2)\) | \(\cdots\) | \(\chi_1(C_r)\) |
| \(\chi_2\) | \(\chi_2(C_1)\) | \(\chi_2(C_2)\) | \(\cdots\) | \(\chi_2(C_r)\) |
| \(\vdots\) | \(\vdots\) | \(\vdots\) | \(\ddots\) | \(\vdots\) |
| \(\chi_r\) | \(\chi_r(C_1)\) | \(\chi_r(C_2)\) | \(\cdots\) | \(\chi_r(C_r)\) |

The character table of \(G\) encodes an enormous amount of information about \(G\). For instance:

- The first column gives the degrees: \(\chi_i(e) = \dim V_i\).
- The row sums \(\sum_j |C_j| \chi_i(C_j)\) equal zero for non-trivial irreducibles (by the dimension formula applied to \(\chi_\mathrm{reg} = 0\) off the identity).
- Rows are orthogonal with weight \(|C_j|/|G|\); columns are orthogonal with weight 1 (**column orthogonality**).

The column orthogonality deserves its own statement:

<div class="theorem">
<strong>Theorem (Second Orthogonality / Column Orthogonality).</strong> Let \(C\) and \(C'\) be conjugacy classes of \(G\) with representatives \(g\) and \(g'\). Then:

\[
\sum_{i=1}^r \chi_i(g)\overline{\chi_i(g')} = \begin{cases} |G|/|C| & \text{if } g \text{ and } g' \text{ are conjugate} \\ 0 & \text{otherwise.} \end{cases}
\]
Equivalently, if we define the matrix \(X\) by \(X_{ij} = \chi_i(C_j)\), then the matrix \(D X^* D'\) is the identity (up to scaling), where \(D\) and \(D'\) are diagonal matrices encoding the conjugacy class sizes.
</div>

This column orthogonality is often as useful as row orthogonality: if the character table is partially filled in, column orthogonality gives additional equations that constrain the unknown entries.

## Full Character Table for \(C_4\)

Let us work out the character table of \(C_4 = \{0, 1, 2, 3\}\) (addition mod 4) in complete detail, as a prototype for all cyclic groups.

**Step 1: Conjugacy classes.** Since \(C_4\) is abelian, every element is its own conjugacy class. There are 4 conjugacy classes: \(\{0\}, \{1\}, \{2\}, \{3\}\). Sizes: each has size 1.

**Step 2: Number and dimensions of irreducibles.** We need 4 irreducible representations (one per conjugacy class). Since \(\sum d_i^2 = |C_4| = 4\) and all \(d_i \geq 1\), the unique solution is \(d_1 = d_2 = d_3 = d_4 = 1\). All irreducibles are 1-dimensional, as predicted by the corollary to Schur's Lemma.

**Step 3: Write down the representations.** With \(\zeta = i = e^{2\pi i/4}\), the four representations are \(\rho_k(j) = i^{jk}\) for \(k = 0, 1, 2, 3\):

| | \(\{0\}\) | \(\{1\}\) | \(\{2\}\) | \(\{3\}\) |
|---|---|---|---|---|
| \(\chi_0\) | \(1\) | \(1\) | \(1\) | \(1\) |
| \(\chi_1\) | \(1\) | \(i\) | \(-1\) | \(-i\) |
| \(\chi_2\) | \(1\) | \(-1\) | \(1\) | \(-1\) |
| \(\chi_3\) | \(1\) | \(-i\) | \(-1\) | \(i\) |

**Verification of row orthogonality** (checking \(\langle \chi_1, \chi_1 \rangle = 1\)):

\[
\frac{1}{4}(1 \cdot 1 + i \cdot \bar i + (-1)(-1) + (-i)\overline{(-i)}) = \frac{1}{4}(1 + 1 + 1 + 1) = 1. \checkmark
\]
**Verification of orthogonality of \(\chi_1\) and \(\chi_2\)**:

\[
\frac{1}{4}(1 + i(-1) + (-1)(1) + (-i)(-1)) = \frac{1}{4}(1 - i - 1 + i) = 0. \checkmark
\]
**Dimension formula**: \(1^2 + 1^2 + 1^2 + 1^2 = 4 = |C_4|\). \(\checkmark\)

**Connection to DFT.** The character table of \(C_n\) is precisely the discrete Fourier transform (DFT) matrix \(F_n\) with entries \((F_n)_{jk} = \zeta^{jk}\) where \(\zeta = e^{2\pi i/n}\). The orthogonality of rows is the statement that \(\frac{1}{n}F_n^* F_n = I_n\), which is the unitarity of the DFT. For \(C_4\) this gives us the 4-point DFT, the simplest nontrivial instance.

## Full Character Table for \(S_3\)

<div class="example">
<strong>Example (Character table of \(S_3\)).</strong> The three conjugacy classes of \(S_3\) have representatives \(e\), \((1\,2)\), \((1\,2\,3)\) and sizes 1, 3, 2. The character table is:

| | \(\{e\}\) | \(\{(1\,2)\}\) | \(\{(1\,2\,3)\}\) |
|---|---|---|---|
| \(\chi_\mathrm{triv}\) | 1 | 1 | 1 |
| \(\chi_\mathrm{sgn}\) | 1 | \(-1\) | 1 |
| \(\chi_\mathrm{std}\) | 2 | 0 | \(-1\) |

Let us verify this table systematically from scratch.

<strong>Step 1.</strong> \(S_3\) has conjugacy classes of sizes 1, 3, 2 as above. So 3 irreducibles.

<strong>Step 2.</strong> Dimension formula: \(d_1^2 + d_2^2 + d_3^2 = 6\). The only solution (up to ordering) with all \(d_i \geq 1\) is \((1, 1, 2)\).

<strong>Step 3.</strong> The trivial rep gives row \((1, 1, 1)\). The sign rep gives row \((1, -1, 1)\) since 2-cycles are odd permutations and 3-cycles are even.

<strong>Step 4.</strong> The 2-dimensional irrep has \(\chi(e) = 2\). Using row orthogonality with \(\chi_\mathrm{triv}\): \(\frac{1}{6}(1 \cdot 2 + 3 \cdot b + 2 \cdot c) = 0 \Rightarrow 2 + 3b + 2c = 0\). Using row orthogonality with \(\chi_\mathrm{sgn}\): \(\frac{1}{6}(1 \cdot 2 + 3 \cdot (-1) \cdot b + 2 \cdot 1 \cdot c) = 0 \Rightarrow 2 - 3b + 2c = 0\). Subtracting: \(6b = 0 \Rightarrow b = 0\). Then \(2 + 2c = 0 \Rightarrow c = -1\).

<strong>Step 5.</strong> Verify \(\langle \chi_\mathrm{std}, \chi_\mathrm{std} \rangle = 1\): \(\frac{1}{6}(4 + 0 + 2) = 1\). ✓

One verifies: \(1^2 + 1^2 + 2^2 = 6 = |S_3|\). Row orthogonality: \(\langle \chi_\mathrm{std}, \chi_\mathrm{std} \rangle = \frac{1}{6}(4 + 0 + 2) = 1\). ✓

Column orthogonality for columns 1 and 2: \(1 \cdot 1 + 1 \cdot (-1) + 2 \cdot 0 = 0\). ✓ For column 2 with itself: \(1^2 + (-1)^2 + 0^2 = 2 = |G|/|C_2| = 6/3\). ✓
</div>

## Full Character Table for \(Z/4Z\)

The complete character table for \(\mathbb{Z}/4\mathbb{Z}\) was given above. Let us now use it to see orthogonality of columns in action.

**Column orthogonality for columns \(\{1\}\) and \(\{3\}\):**

\[
\sum_k \chi_k(1)\overline{\chi_k(3)} = 1 \cdot 1 + i \cdot \overline{(-i)} + (-1)\cdot \overline{(-1)} + (-i)\cdot \overline{i} = 1 \cdot 1 + i \cdot i + (-1)(-1) + (-i)(-i) = 1 - 1 + 1 - 1 = 0. \checkmark
\]
(Note: since \(C_4\) is abelian, column \(\{j\}\) corresponds to the element \(j\), and \(\overline{\chi_k(j)} = \overline{i^{jk}} = i^{-jk} = \chi_k(-j)\). So the column orthogonality amounts to \(\sum_k i^{(j_1 - j_2)k} = 0\) for \(j_1 \neq j_2\) — the standard fact about geometric sums of roots of unity.)

## Constructing the Character Table Systematically

It is instructive to see how one constructs a character table from scratch, without knowing the representations in advance. We illustrate with \(S_3\), the simplest nonabelian case.

**Step 1.** The group \(S_3\) has conjugacy classes \(\{e\}\), \(\{(12),(13),(23)\}\), \(\{(123),(132)\}\) of sizes 1, 3, 2. So there are 3 irreducible representations.

**Step 2.** The dimension formula \(\sum d_i^2 = 6\) with \(d_i \geq 1\) has (up to ordering) unique solution \((1, 1, 2)\).

**Step 3.** The trivial and sign representations give the first two rows: \((1,1,1)\) and \((1,-1,1)\).

**Step 4.** By column orthogonality applied to column 1 versus itself: \(1^2 + 1^2 + d_3^2 = |G|/|C_1| = 6\), confirming \(d_3 = 2\). ✓

**Step 5.** Use row orthogonality of \(\chi_3\) with \(\chi_\mathrm{triv}\): \(\frac{1}{6}(2a + 3b + 2c) = 0\), where \((a,b,c)\) are the unknown values.

**Step 6.** Use \(\langle \chi_3, \chi_3 \rangle = 1\): \(\frac{1}{6}(4 + 3b^2 + 2c^2) = 1\).

**Step 7.** Use column orthogonality of columns 2 and 3 with each other: \(1 \cdot 1 + 1 \cdot 1 + bc = 0\), so \(bc = -2\).

**Step 8.** Solve: from the constraint equations we get \(b = 0\) (since \(2a + 3b + 2c = 0\) and \(a = 2\)), and then \(c = -1\) and the equations all check out. The character table is complete.

<div class="example">
<strong>Example (Character table of \(S_4\)).</strong> The symmetric group \(S_4\) has order 24 and 5 conjugacy classes, corresponding to the 5 cycle types: identity \((1^4)\), transpositions \((2,1^2)\), double transpositions \((2^2)\), 3-cycles \((3,1)\), and 4-cycles \((4)\). Their sizes are 1, 6, 3, 8, 6 respectively. There are 5 irreducible representations; their dimensions \(d_i\) must satisfy \(\sum d_i^2 = 24\). The abelianization \(S_4^{ab} \cong C_2\) gives 2 one-dimensional representations (trivial and sign). The remaining dimensions satisfy \(d_3^2 + d_4^2 + d_5^2 = 22\); the solutions with each \(d_i \geq 2\) are \((2, 3, 3)\) (since \(4 + 9 + 9 = 22\)). The character table is:

| | \(e\) | \((12)\) | \((12)(34)\) | \((123)\) | \((1234)\) |
|---|---|---|---|---|---|
| \(\chi_\mathrm{triv}\) | 1 | 1 | 1 | 1 | 1 |
| \(\chi_\mathrm{sgn}\) | 1 | \(-1\) | 1 | 1 | \(-1\) |
| \(\chi_2\) | 2 | 0 | 2 | \(-1\) | 0 |
| \(\chi_3\) | 3 | 1 | \(-1\) | 0 | \(-1\) |
| \(\chi_3'\) | 3 | \(-1\) | \(-1\) | 0 | 1 |

Here \(\chi_2\) is the unique 2-dimensional irreducible (coming from \(S_4 \to S_3 \to GL_2\) via the sign map on the Klein four-group), \(\chi_3\) is the standard representation restricted from \(S_4\), and \(\chi_3' = \chi_3 \otimes \chi_\mathrm{sgn}\). Verification: \(1+1+4+9+9 = 24 = |S_4|\). ✓
</div>

<div class="remark">
<strong>Remark (The character table as a unitary matrix).</strong> Equip the set of irreducible characters \(\{V_1, \ldots, V_r\}\) with weights \(1\) and the set of conjugacy classes \(\{C_1, \ldots, C_r\}\) with weights \(|C_j|/|G|\). Then the character table, viewed as a matrix, is unitary with respect to these weighted inner products. This is just a restatement of both orthogonality theorems, but it highlights the pleasing symmetry between rows and columns.
</div>

# Chapter 9: Inflation, Kernels, and Symmetric Powers

## Inflation and the Kernel of a Character

If \(\phi : G \to H\) is a group homomorphism and \((W, \sigma)\) is an \(H\)-module, we can define a \(G\)-module \(\phi^* W\) by pulling back: \(\rho(g) = \sigma(\phi(g))\). This is called **inflation** when \(\phi : G \twoheadrightarrow G/N\) is a quotient map.

<div class="definition">
<strong>Definition.</strong> Let \(N \trianglelefteq G\) and let \(W\) be a \((G/N)\)-module. The <strong>inflation</strong> of \(W\) to \(G\) is the \(G\)-module \(\mathrm{Inf}_{G/N}^G(W)\) defined by \(\rho(g)w = (gN) \cdot w\). The <strong>kernel</strong> of a character \(\chi_V\) is \(\ker \chi_V = \{g \in G : \chi_V(g) = \chi_V(e)\} = \ker \rho\). Characters with trivial kernel are <strong>faithful characters</strong>.
</div>

The kernel of a character is indeed a normal subgroup: it equals \(\ker \rho\), the kernel of the representation homomorphism. One can characterize it using character values: since \(|\chi_V(g)| \leq \dim V = \chi_V(e)\) with equality if and only if all eigenvalues of \(\rho(g)\) are equal (i.e., \(\rho(g)\) is scalar), the kernel consists precisely of the elements \(g\) where \(\rho(g)\) is a scalar matrix. For irreducible \(V\), this means \(\rho(g) = \lambda I\), and since \(g^{|G|} = e\), we get \(\lambda^{|G|} = 1\).

The one-dimensional representations of \(G\) are exactly the inflations of the irreducible representations of the abelianization \(G^\mathrm{ab} = G/[G,G]\). More generally, if \(N\) is a normal subgroup contained in the kernel of some representation, then that representation factors through \(G/N\).

<div class="example">
<strong>Example (Inflation for \(S_4\)).</strong> The symmetric group \(S_4\) surjects onto \(S_3 = S_4/V_4\) where \(V_4 = \{e, (12)(34), (13)(24), (14)(23)\}\) is the Klein four-group. The three irreducibles of \(S_3\) inflate to irreducibles of \(S_4\): the trivial and sign become the trivial and sign of \(S_4\), and the standard 2-dimensional representation of \(S_3\) inflates to the 2-dimensional irreducible \(\chi_2\) of \(S_4\). This accounts for 3 of the 5 irreducibles; the other two are faithful (their kernels are trivial).
</div>

## Symmetric and Alternating Powers

Given a \(G\)-module \(V\), the tensor power \(V^{\otimes n}\) carries a natural action of both \(G\) (acting on each tensor factor) and \(S_n\) (permuting the factors). These two actions commute, and their interaction is controlled by **Schur-Weyl duality** — one of the deep organizing principles of representation theory.

The **symmetric power** \(\mathrm{Sym}^n(V)\) is the quotient of \(V^{\otimes n}\) by the subspace generated by \(v_1 \otimes \cdots \otimes v_n - v_{\sigma(1)} \otimes \cdots \otimes v_{\sigma(n)}\) for all \(\sigma \in S_n\), and the **alternating power** \(\mathrm{Alt}^n(V)\) is the quotient by \(v_1 \otimes \cdots \otimes v_n - \mathrm{sgn}(\sigma) v_{\sigma(1)} \otimes \cdots \otimes v_{\sigma(n)}\). Both are \(G\)-modules.

For a two-dimensional representation \(V\), one has \(\dim \mathrm{Sym}^n(V) = n+1\) and \(\dim \mathrm{Alt}^n(V) = \binom{2}{n}\) (so \(\mathrm{Alt}^n(V) = 0\) for \(n > 2\) and \(\mathrm{Alt}^2(V)\) is one-dimensional). The standard representation of \(S_n\) satisfies \(\mathrm{Alt}^{n-1}(V_\mathrm{std}) \cong V_\mathrm{sgn}\).

The characters of symmetric and alternating powers are given by the Newton power sum formulas. If \(\chi_V(g) = \lambda_1 + \cdots + \lambda_d\) (sum of eigenvalues), then:

\[
\chi_{\mathrm{Sym}^2 V}(g) = \frac{\chi_V(g)^2 + \chi_V(g^2)}{2}, \qquad \chi_{\mathrm{Alt}^2 V}(g) = \frac{\chi_V(g)^2 - \chi_V(g^2)}{2}.
\]
These formulas are useful for computing character tables and for determining the Frobenius-Schur indicator.

<div class="example">
<strong>Example (Symmetric square of \(V_\mathrm{std}\) for \(S_3\)).</strong> We have \(\chi_\mathrm{std}(e) = 2\), \(\chi_\mathrm{std}((12)) = 0\), \(\chi_\mathrm{std}((123)) = -1\). Also, \((12)^2 = e\) and \((123)^2 = (132)\) with \(\chi_\mathrm{std}((132)) = -1\). Using the formula:
\begin{align*}
\chi_{\mathrm{Sym}^2 V_\mathrm{std}}(e) &= \frac{4 + 2}{2} = 3,\\
\chi_{\mathrm{Sym}^2 V_\mathrm{std}}((12)) &= \frac{0 + 2}{2} = 1,\\
\chi_{\mathrm{Sym}^2 V_\mathrm{std}}((123)) &= \frac{1 + (-1)}{2} = 0.
\end{align*}
The character \((3, 1, 0)\) can be decomposed using the \(S_3\) character table:

\[
m_\mathrm{triv} = \tfrac{1}{6}(3 \cdot 1 + 3 \cdot 1 + 2 \cdot 0) = 1, \quad m_\mathrm{sgn} = \tfrac{1}{6}(3 - 3 + 0) = 0, \quad m_\mathrm{std} = \tfrac{1}{6}(6 + 0 + 0) = 1.
\]
So \(\mathrm{Sym}^2(V_\mathrm{std}) \cong V_\mathrm{triv} \oplus V_\mathrm{std}\). Dimension check: \(1 + 2 = 3\). ✓

Similarly, \(\chi_{\mathrm{Alt}^2 V_\mathrm{std}}(e) = \frac{4-2}{2} = 1\), \(\chi_{\mathrm{Alt}^2 V_\mathrm{std}}((12)) = \frac{0-2}{2} = -1\), \(\chi_{\mathrm{Alt}^2 V_\mathrm{std}}((123)) = \frac{1+1}{2} = 1\). This is the character of \(V_\mathrm{sgn}\)! So \(\mathrm{Alt}^2(V_\mathrm{std}) \cong V_\mathrm{sgn}\), consistent with \(V_\mathrm{std} \cong V_\mathrm{std}^*\) (since \(V_\mathrm{std} \otimes V_\mathrm{sgn} \cong V_\mathrm{std}\)) and \(\mathrm{Alt}^2 V \cong \det V\).
</div>

# Chapter 10: The Representation Theory of \(S_n\)

## Young Diagrams

The representation theory of the symmetric group is one of the most beautiful chapters in all of mathematics. It establishes a remarkable bijection between the set of irreducible complex representations of \(S_n\) and the combinatorial objects called Young diagrams.

There are natural bijections:

\[
\mathrm{Irr}_\mathbb{C}(S_n) \longleftrightarrow \{\text{conjugacy classes in } S_n\} \longleftrightarrow \{\text{partitions of } n\}.
\]
The conjugacy class of a permutation is determined by its cycle type, and cycle types correspond to ways of writing \(n\) as an ordered sum of positive integers. A **partition** of \(n\) is a tuple \(\lambda = (\lambda_1 \geq \lambda_2 \geq \cdots \geq \lambda_k > 0)\) with \(\sum \lambda_i = n\), written \(\lambda \vdash n\).

A partition \(\lambda\) is displayed as a **Young diagram**: a left-justified array of boxes with \(\lambda_i\) boxes in row \(i\). For example, the Young diagram of \(\lambda = (3,2,2,1)\) consists of 8 boxes arranged in rows of lengths 3, 2, 2, 1 from top to bottom.

<div class="example">
<strong>Example (\(S_3\)).</strong> The partitions of 3 are \((3)\), \((2,1)\), and \((1,1,1)\). Their Young diagrams have one row of 3 boxes; one row of 2 and one row of 1; and one column of 3. These correspond to the three irreducible representations \(V_\mathrm{triv}\), \(V_\mathrm{std}\), and \(V_\mathrm{sgn}\) of \(S_3\).
</div>

<div class="example">
<strong>Example (\(S_4\)).</strong> The partitions of 4 are \((4)\), \((3,1)\), \((2,2)\), \((2,1,1)\), and \((1,1,1,1)\), giving 5 irreducible representations of \(S_4\). Their dimensions by the hook length formula:
- \((4)\): trivial, dimension 1
- \((3,1)\): standard, dimension 3
- \((2,2)\): dimension 2
- \((2,1,1)\): standard \(\otimes\) sign, dimension 3
- \((1,1,1,1)\): sign, dimension 1
Check: \(1 + 9 + 4 + 9 + 1 = 24 = |S_4|\). ✓
</div>

## Young Tableaux and Specht Modules

A **Young tableau** of shape \(\lambda\) is a filling of the Young diagram of \(\lambda\) with the numbers \(1, \ldots, n\), each appearing exactly once. The **row group** \(R(T)\) is the subgroup of \(S_n\) that permutes entries within each row; the **column group** \(C(T)\) permutes entries within each column.

Associated to each tableau \(T\) are two elements of the group algebra \(\mathbb{C}S_n\):

\[
a_T = \sum_{\sigma \in R(T)} \sigma, \quad b_T = \sum_{\tau \in C(T)} \mathrm{sgn}(\tau) \tau, \quad c_T = b_T a_T \quad \text{(the \textbf{Young symmetrizer})}.
\]

<div class="definition">
<strong>Definition.</strong> Let \(\lambda \vdash n\) and let \(T\) be a standard Young tableau of shape \(\lambda\). The <strong>Specht module</strong> \(S^\lambda\) is the \(\mathbb{C}S_n\)-submodule of \(\mathbb{C}S_n\) generated by \(c_T\).
</div>

<div class="theorem">
<strong>Theorem.</strong> For each \(\lambda \vdash n\), the Specht module \(S^\lambda\) is an irreducible \(\mathbb{C}S_n\)-module, and the assignment \(\lambda \mapsto S^\lambda\) gives a bijection between partitions of \(n\) and \(\mathrm{Irr}_\mathbb{C}(S_n)\). The dimension of \(S^\lambda\) is given by the <strong>hook length formula</strong>:

\[
\dim S^\lambda = \frac{n!}{\prod_{(i,j) \in \lambda} h(i,j)},
\]
where \(h(i,j)\) is the hook length at cell \((i,j)\) — the number of cells directly below or directly to the right of \((i,j)\), plus one.
</div>

The hook length formula is a beautiful combinatorial result: despite the intricate algebraic construction, the dimension turns out to be a simple product formula. For instance, \(S^{(n)} \cong V_\mathrm{triv}\), \(S^{(1,1,\ldots,1)} \cong V_\mathrm{sgn}\), and \(S^{(n-1,1)} \cong V_\mathrm{std}\) (the standard representation).

<div class="example">
<strong>Example (Hook lengths for \(\lambda = (3,2)\) in \(S_5\)).</strong> The Young diagram of \((3,2)\) is:
\[
\begin{array}{|c|c|c|}
\hline
\phantom{0} & \phantom{0} & \phantom{0} \\
\hline
\phantom{0} & \phantom{0} \\
\cline{1-2}
\end{array}
\]
The hook lengths are: top-left cell has 4 cells in its hook (itself + 2 to the right + 1 below), so \(h(1,1) = 4\). Working out all hook lengths: \(h(1,1) = 4\), \(h(1,2) = 2\), \(h(1,3) = 1\), \(h(2,1) = 2\), \(h(2,2) = 1\). The hook length formula gives:

\[
\dim S^{(3,2)} = \frac{5!}{4 \cdot 2 \cdot 1 \cdot 2 \cdot 1} = \frac{120}{16} = \ldots
\]
Wait, let us recompute: \(4 \cdot 2 \cdot 1 \cdot 2 \cdot 1 = 16\) does not divide 120 evenly. Let me recheck: \(h(1,1) = 3 + 1 = 4\), \(h(1,2) = 1 + 1 = 2\), \(h(1,3) = 0 + 1 = 1\), \(h(2,1) = 1 + 1 = 2\) (one cell to the right + zero below + 1), \(h(2,2) = 0 + 1 = 1\). Product: \(4 \cdot 2 \cdot 1 \cdot 2 \cdot 1 = 16\). But \(5! = 120\) and \(120/16\) is not an integer — there must be an error. Recalculating more carefully: \(h(1,1)\) = (2 cells to right) + (1 cell below) + 1 = 4. \(h(1,2)\) = (1 cell to right) + (1 cell below) + 1 = 3. Oh, I need to count cells directly below in the same column: for \((1,2)\), there is one cell below in column 2, row 2. So \(h(1,2) = 1 + 1 + 1 = 3\). \(h(2,1) = (1 \text{ right}) + 0 + 1 = 2\). \(h(2,2) = 0 + 0 + 1 = 1\). \(h(1,3) = 0 + 0 + 1 = 1\). Product: \(4 \cdot 3 \cdot 1 \cdot 2 \cdot 1 = 24\). So \(\dim S^{(3,2)} = 120/24 = 5\). And \(\dim S^{(2,1^3)}\) (the conjugate shape) is also 5 by symmetry. Check: \(1 + 5 + 4 + 5 + 1 + \ldots\) — for \(S_5\), the dimension formula gives \(\sum d_i^2 = 120\), and the irreducibles have dimensions \(1, 4, 5, 5, 4, 1\) (from the partitions of 5), and \(1 + 16 + 25 + 25 + 16 + \ldots\) — there are 7 partitions of 5, giving 7 irreducibles, so we need \(1+4+5+6+5+4+1\) type numbers. Actually for \(S_5\): partitions are \((5),(4,1),(3,2),(3,1^2),(2^2,1),(2,1^3),(1^5)\) with dimensions \(1,4,5,6,5,4,1\) and \(1+16+25+36+25+16+1 = 120\). ✓
</div>

**Branching rules** describe how Specht modules restrict and induce between \(S_n\) and \(S_{n+1}\): the restriction of \(S^\mu\) (\(\mu \vdash n+1\)) to \(S_n\) decomposes as \(\bigoplus S^{\mu^-}\) over all \(\mu^-\) obtained by removing one box from \(\mu\), and the induction of \(S^\lambda\) (\(\lambda \vdash n\)) to \(S_{n+1}\) decomposes as \(\bigoplus S^{\lambda^+}\) over all \(\lambda^+\) obtained by adding one box.

## The Robinson-Schensted Correspondence

One of the most striking combinatorial results connecting the representation theory of \(S_n\) to combinatorics is the Robinson-Schensted correspondence:

<div class="theorem">
<strong>Theorem (Robinson-Schensted).</strong> There is a canonical bijection between permutations \(\sigma \in S_n\) and pairs \((P, Q)\) of standard Young tableaux of the same shape \(\lambda \vdash n\). The shape \(\lambda\) is related to the cycle structure of \(\sigma\): in particular, the length of the first row of \(\lambda\) is the length of the longest increasing subsequence of \(\sigma\).
</div>

As a consequence, summing over all shapes:

\[
n! = \sum_{\lambda \vdash n} (f^\lambda)^2,
\]
where \(f^\lambda = \dim S^\lambda\) is the number of standard Young tableaux of shape \(\lambda\) (equal to the dimension of the Specht module). This is yet another proof of the dimension formula \(|S_n| = \sum_\lambda (\dim S^\lambda)^2\), but now with a combinatorial flavour.

# Chapter 11: Module Theory and the Artin-Wedderburn Theorem

## Algebras and the Group Algebra

The second arc of the course recasts representation theory in terms of modules over rings. This perspective is more powerful in some respects and provides natural connections to noncommutative algebra.

<div class="definition">
<strong>Definition.</strong> An \(F\)-<strong>algebra</strong> is an \(F\)-vector space \(A\) equipped with an associative, bilinear multiplication \(A \times A \to A\) and a unit \(1_A \in A\). An \(A\)-<strong>module</strong> is an abelian group \(M\) together with a ring homomorphism \(A \to \mathrm{End}(M)\) (equivalently, a left action of \(A\) on \(M\) by additive maps satisfying \((ab)m = a(bm)\)).
</div>

The central example is the **group algebra** \(FG\): as a vector space, \(FG = F\langle G \rangle\) with basis \(G\); multiplication is extended from \(G\) by linearity. An \(FG\)-module is *exactly* an \(F\)-representation of \(G\).

Other key examples:
- \(F[x]\)-modules are vector spaces equipped with a chosen linear operator (the action of \(x\)). By the structure theorem for modules over a PID, the theory of \(F[x]\)-modules recaptures the Jordan normal form theorem.
- \(\mathbb{Z}\)-modules are abelian groups.
- \(M_n(F)\)-modules: the only simple \(M_n(F)\)-module is \(F^n\) (column vectors with matrix multiplication).

The quaternion algebra \(\mathbb{H} = \mathbb{R} \cdot 1 \oplus \mathbb{R} \cdot i \oplus \mathbb{R} \cdot j \oplus \mathbb{R} \cdot k\) (with \(i^2 = j^2 = k^2 = -1\) and \(ij = k\)) is a noncommutative division ring — a "skew field." It arises naturally in the representation theory of groups with quaternionic (real) irreducibles.

<div class="remark">
<strong>Remark (Why the group algebra?).</strong> The group algebra \(FG\) is the universal object encoding all representations of \(G\): giving a representation \(G \to \mathrm{GL}(V)\) is the same as giving an \(FG\)-module structure on \(V\). The passage to \(FG\) turns the study of representations into the study of modules over a single ring — a branch of algebra with powerful general theorems available. The Artin-Wedderburn theorem is the most important of these.
</div>

## The Center of the Group Algebra

The center \(Z(FG)\) of the group algebra has a beautiful explicit description that connects algebra to combinatorics.

<div class="proposition">
<strong>Proposition.</strong> The center \(Z(FG)\) of the group algebra has as a basis the conjugacy class sums

\[
C_j^+ = \sum_{g \in C_j} g,
\]
one for each conjugacy class \(C_j\) of \(G\). In particular, \(\dim Z(FG) = h(G)\) = number of conjugacy classes.
</div>

<div class="proof">
<strong>Proof.</strong> An element \(\alpha = \sum_{g \in G} a_g g \in FG\) lies in \(Z(FG)\) if and only if \(h\alpha h^{-1} = \alpha\) for all \(h \in G\). Since \(h(\sum_g a_g g)h^{-1} = \sum_g a_g (hgh^{-1})\), the condition becomes: for all \(h\) and all \(g\), the coefficient of \(g\) in \(h\alpha h^{-1}\) equals \(a_g\). This forces \(a_g = a_{hgh^{-1}}\) for all \(g, h\), i.e., the function \(g \mapsto a_g\) is constant on conjugacy classes. The basis \(\{C_j^+\}\) follows immediately. \(\square\)
</div>

This fact has an important consequence: under the Artin-Wedderburn decomposition \(FG \cong \prod_i M_{n_i}(F)\), the center decomposes as \(Z(FG) \cong \prod_i Z(M_{n_i}(F)) \cong \prod_i F\). So \(\dim Z(FG) = r\) (the number of irreducible representations). Combining: \(r = h(G)\).

## Simple and Semisimple Modules

<div class="definition">
<strong>Definition.</strong> An \(R\)-module \(M\) is <strong>simple</strong> if \(M \neq 0\) and it has no proper nonzero submodules. An \(R\)-module is <strong>semisimple</strong> if it is a direct sum of simple submodules.
</div>

Simple \(FG\)-modules are precisely irreducible \(G\)-representations. Maschke's theorem, in module-theoretic language, says that \(FG\) is a semisimple ring when \(\mathrm{char}\, F \nmid |G|\).

A remarkably elegant characterization of semisimplicity:

<div class="theorem">
<strong>Theorem.</strong> For an \(R\)-module \(M\), the following are equivalent:
<ol>
<li>\(M\) is semisimple.</li>
<li>\(M\) is a sum (not necessarily direct) of simple submodules.</li>
<li>Every submodule \(N \subseteq M\) has a complement: there exists \(N'\) with \(M = N \oplus N'\).</li>
<li>Every submodule of \(M\) is semisimple.</li>
</ol>
</div>

Key consequences:
- Submodules and quotients of semisimple modules are semisimple.
- Every simple submodule of a semisimple module \(M = \bigoplus_i S_i\) is isomorphic to some \(S_i\).

The theorem that \(F^n\) is the unique simple \(M_n(F)\)-module shows how matrix algebras over fields are perfectly "tame" from the module-theory perspective. The Artin-Wedderburn theorem generalizes this.

## The Artin-Wedderburn Theorem

<div class="definition">
<strong>Definition.</strong> A ring \(R\) is <strong>semisimple</strong> if every \(R\)-module is semisimple, equivalently, if the regular left module \(R R\) is semisimple.
</div>

<div class="theorem">
<strong>Theorem (Artin-Wedderburn).</strong> Let \(R\) be a semisimple ring. Then

\[
R \cong M_{n_1}(D_1) \times M_{n_2}(D_2) \times \cdots \times M_{n_k}(D_k)
\]
where \(D_1, \ldots, D_k\) are division rings. This decomposition is unique up to reordering and isomorphism. The number \(k\) equals the number of isomorphism classes of simple \(R\)-modules.
</div>

This is one of the great theorems of algebra. Wedderburn proved the theorem for finite-dimensional algebras over a field in 1907; Artin extended it to abstract semisimple rings in 1927. The footnote in E. Artin's 1950 survey captures the community's reaction: *"This extraordinary result has excited the fantasy of every algebraist and still does so in our day."*

Let us explain why this theorem is so powerful. It says that a semisimple ring is — up to isomorphism — *nothing but a product of matrix algebras over division rings*. There are no other examples. The structure is completely rigid.

The proof strategy is:
1. Decompose \(R R = \bigoplus S_i^{\oplus m_i}\) into simple submodules using semisimplicity.
2. Each simple submodule is a minimal left ideal; the sum of all copies of a fixed simple \(S_j\) is a two-sided ideal (the "block").
3. Each block is isomorphic to \(M_{m_j}(D_j)\) where \(D_j = \mathrm{End}_R(S_j)^{op}\) is a division ring (by Schur's Lemma, since \(S_j\) is simple).
4. The product decomposition follows from the orthogonality of distinct blocks.

**Application to group algebras.** When \(F\) is algebraically closed and \(\mathrm{char}\, F \nmid |G|\), Maschke's theorem ensures that \(FG\) is semisimple. By Schur's Lemma (part 2), every \(D_i\) in the Artin-Wedderburn decomposition is just \(F\). Therefore:

<div class="corollary">
<strong>Corollary.</strong> Let \(F\) be algebraically closed with \(\mathrm{char}\, F \nmid |G|\) and let \(\mathrm{Irr}_F(G) = \{V_1, \ldots, V_r\}\) with \(\dim V_i = n_i\). Then:

\[
FG \cong M_{n_1}(F) \times M_{n_2}(F) \times \cdots \times M_{n_r}(F).
\]
</div>

The dimension formula \(|G| = \sum n_i^2\) follows immediately: \(\dim FG = |G|\) and \(\dim M_{n_i}(F) = n_i^2\). The character table theorem (number of irreducibles = number of conjugacy classes) follows from the theory of the center: \(\dim Z(FG) = h(G)\) (center of the group algebra has basis the conjugacy class sums), and \(Z(M_{n_i}(F)) \cong F\), so \(\dim Z(FG) = r\).

<div class="example">
<strong>Example (Artin-Wedderburn for \(S_3\)).</strong> We have

\[
\mathbb{C}S_3 \cong M_1(\mathbb{C}) \times M_1(\mathbb{C}) \times M_2(\mathbb{C}) \cong \mathbb{C} \times \mathbb{C} \times M_2(\mathbb{C}).
\]
Dimension check: \(1 + 1 + 4 = 6 = |S_3|\). ✓ The center of \(\mathbb{C}S_3\) (spanned by the 3 conjugacy class sums) is isomorphic to \(\mathbb{C} \times \mathbb{C} \times \mathbb{C}\) (the centers of the three blocks). ✓
</div>

<div class="example">
<strong>Example (Artin-Wedderburn for \(C_n\)).</strong> The cyclic group \(C_n\) is abelian, so all irreducibles are one-dimensional and \(\mathbb{C}C_n \cong \mathbb{C}^n\) (product of \(n\) copies of \(\mathbb{C}\)). This is just the statement that \(\mathbb{C}[x]/(x^n - 1) \cong \mathbb{C}^n\) via the Chinese Remainder Theorem, since \(x^n - 1 = \prod_{k=0}^{n-1}(x - \zeta^k)\) splits completely over \(\mathbb{C}\).
</div>

## Primitive Idempotents and the Artin-Wedderburn Decomposition Explicitly

The Artin-Wedderburn decomposition is not just an abstract isomorphism — it can be made explicit using **primitive central idempotents**.

<div class="definition">
<strong>Definition.</strong> An element \(e \in FG\) is a <strong>central idempotent</strong> if \(e \in Z(FG)\) and \(e^2 = e\). It is <strong>primitive</strong> if it cannot be written as \(e = e_1 + e_2\) with \(e_1, e_2\) orthogonal central idempotents (\(e_1 e_2 = 0\)).
</div>

<div class="theorem">
<strong>Theorem.</strong> Let \(F\) be algebraically closed with \(\mathrm{char}\, F \nmid |G|\). The primitive central idempotents of \(FG\) are:

\[
e_i = \frac{\dim V_i}{|G|} \sum_{g \in G} \chi_{V_i}(g^{-1}) g = \frac{\dim V_i}{|G|} \sum_{g \in G} \overline{\chi_{V_i}(g)} g,
\]
one for each irreducible representation \(V_i\). They satisfy \(e_i e_j = \delta_{ij} e_i\) and \(\sum_i e_i = 1\). The projection \(FG \to M_{n_i}(F)\) of the Artin-Wedderburn decomposition is right multiplication by \(e_i\).
</div>

The formula \(e_i = \frac{n_i}{|G|}\sum_g \overline{\chi_i(g)} g\) is the representation-theoretic analogue of the projection formula in Fourier analysis: for a finite abelian group, the projection onto the \(\chi_k\)-eigenspace of a function is \(\hat{f}(k) = \frac{1}{|G|}\sum_g \overline{\chi_k(g)} f(g)\). The extra factor of \(n_i = \dim V_i\) accounts for the non-commutativity.

<div class="example">
<strong>Example (Idempotents for \(S_3\)).</strong> For the trivial representation (\(n_1 = 1\), \(\chi_1 \equiv 1\)):

\[
e_1 = \frac{1}{6}\sum_{g \in S_3} g = \frac{1}{6}(e + (12) + (13) + (23) + (123) + (132)).
\]
This is the "symmetrizer" — it projects onto the trivial isotypic component. For the sign representation (\(n_2 = 1\), \(\chi_2 = \mathrm{sgn}\)):

\[
e_2 = \frac{1}{6}\sum_{g \in S_3} \mathrm{sgn}(g) \cdot g = \frac{1}{6}(e - (12) - (13) - (23) + (123) + (132)).
\]
This is the "antisymmetrizer." One can verify \(e_1 + e_2 + e_3 = 1\) (as elements of \(\mathbb{C}S_3\), where \(e_3\) is the idempotent for the standard representation) and \(e_i e_j = 0\) for \(i \neq j\).
</div>

Over \(\mathbb{R}\), the division rings \(D_i\) can be \(\mathbb{R}\), \(\mathbb{C}\), or \(\mathbb{H}\). This trichotomy is classified by the **Frobenius-Schur indicator**, discussed in the next chapter.

# Chapter 12: Real Representations

## The Frobenius-Schur Indicator

Over \(\mathbb{C}\), every representation decomposes into complex irreducibles. Over \(\mathbb{R}\), the story is richer: a complex irreducible \(V\) can behave in three fundamentally different ways when we look at its underlying real structure.

<div class="definition">
<strong>Definition (Frobenius-Schur indicator).</strong> For an irreducible character \(\chi_V\) of a finite group \(G\), the <strong>Frobenius-Schur indicator</strong> is:

\[
\iota(\chi_V) = \frac{1}{|G|} \sum_{g \in G} \chi_V(g^2).
\]
</div>

<div class="theorem">
<strong>Theorem.</strong> For an irreducible \(\mathbb{C}G\)-module \(V\):

\[
\iota(\chi_V) = \begin{cases} 1 & \text{if } V \text{ is the complexification of a real irreducible (real type)} \\ -1 & \text{if } V \text{ has a quaternionic structure (quaternionic type)} \\ 0 & \text{if } V \not\cong V^* \text{ (complex type, i.e., } V \text{ and } \bar{V} \text{ are non-isomorphic)} \end{cases}
\]
</div>

In terms of bilinear forms: \(\iota(\chi_V) = 1\) if and only if \(V\) has a nonzero \(G\)-invariant symmetric bilinear form; \(\iota(\chi_V) = -1\) if and only if \(V\) has a nonzero \(G\)-invariant skew-symmetric bilinear form.

The indicator also arises in the decomposition of symmetric and alternating squares: if \(\chi_{\mathrm{Sym}^2}(g) = \frac{1}{2}(\chi(g)^2 + \chi(g^2))\) and \(\chi_{\mathrm{Alt}^2}(g) = \frac{1}{2}(\chi(g)^2 - \chi(g^2))\), then \(\iota(\chi_V) = \langle \chi_{\mathrm{Sym}^2 V}, \chi_\mathrm{triv} \rangle - \langle \chi_{\mathrm{Alt}^2 V}, \chi_\mathrm{triv} \rangle\).

The Artin-Wedderburn decomposition of \(\mathbb{R}G\) corresponds precisely to this trichotomy: real-type irreducibles contribute \(M_n(\mathbb{R})\) blocks, quaternionic-type contribute \(M_m(\mathbb{H})\) blocks, and complex-type contribute \(M_k(\mathbb{C})\) blocks (with the corresponding \(\mathbb{C}\)-irreducible and its conjugate merging into one \(\mathbb{R}\)-irreducible).

<div class="example">
<strong>Example (Frobenius-Schur indicators for \(S_3\)).</strong> For \(S_3\), the three irreducibles \(V_\mathrm{triv}\), \(V_\mathrm{sgn}\), \(V_\mathrm{std}\) all have real character values (in fact, all character values are integers). The indicator for \(V_\mathrm{triv}\): \(\iota = \frac{1}{6}(1 + 1 + 1 + 1 + 1 + 1) = 1\) (real type). Similarly for \(V_\mathrm{sgn}\): \(\iota = \frac{1}{6}(\chi_\mathrm{sgn}(e^2) + \chi_\mathrm{sgn}((12)^2) + \cdots) = \frac{1}{6}(1 + 1 + 1 + 1 + 1 + 1) = 1\) (real type). For \(V_\mathrm{std}\): \(\iota = \frac{1}{6}(2 + 2 + 2 + 2 + (-1) + (-1)) = \frac{6}{6} = 1\). Wait — we need the values \(\chi_\mathrm{std}(g^2)\) for each \(g \in S_3\): \(e^2 = e\), so \(\chi_\mathrm{std}(e) = 2\); \((12)^2 = e\), so contribution 2; all three transpositions give 2; \((123)^2 = (132)\), and \(\chi_\mathrm{std}((132)) = -1\); \((132)^2 = (123)\), contribution \(-1\). Total: \(\frac{1}{6}(2 + 2 + 2 + 2 + (-1) + (-1)) = \frac{6}{6} = 1\). So all irreducibles of \(S_3\) are of real type, consistent with the fact that all characters are real-valued.
</div>

<div class="remark">
<strong>Remark (Real-valued vs real type).</strong> A character \(\chi_V\) being real-valued (i.e., \(\chi_V = \overline{\chi_V}\)) is equivalent to \(V \cong V^*\) (since \(\overline{\chi_V(g)} = \chi_{V^*}(g)\)), which means \(\iota(\chi_V) \neq 0\). So real-valued characters are either real type (\(\iota = 1\)) or quaternionic type (\(\iota = -1\)), but not complex type. The simplest group with a quaternionic-type irreducible is the quaternion group \(Q_8\) of order 8.
</div>

## The Quaternion Group \(Q_8\) as an Example

The quaternion group \(Q_8 = \{\pm 1, \pm i, \pm j, \pm k\}\) with the multiplication rules \(i^2 = j^2 = k^2 = -1\) and \(ij = k\), \(jk = i\), \(ki = j\) is one of the most important examples in the theory of real representations.

\(Q_8\) has order 8 and 5 conjugacy classes: \(\{1\}\), \(\{-1\}\), \(\{\pm i\}\), \(\{\pm j\}\), \(\{\pm k\}\). The dimension formula gives \(8 = \sum d_i^2\) with 5 terms. The abelianization is \(Q_8^{\mathrm{ab}} \cong C_2 \times C_2\) (since \([Q_8, Q_8] = \{1, -1\}\)), so there are 4 one-dimensional representations. The unique solution is \(d_i = (1, 1, 1, 1, 2)\).

The character table of \(Q_8\):

| | \(\{1\}\) | \(\{-1\}\) | \(\{\pm i\}\) | \(\{\pm j\}\) | \(\{\pm k\}\) |
|---|---|---|---|---|---|
| \(\chi_0\) | 1 | 1 | 1 | 1 | 1 |
| \(\chi_1\) | 1 | 1 | 1 | \(-1\) | \(-1\) |
| \(\chi_2\) | 1 | 1 | \(-1\) | 1 | \(-1\) |
| \(\chi_3\) | 1 | 1 | \(-1\) | \(-1\) | 1 |
| \(\chi_4\) | 2 | \(-2\) | 0 | 0 | 0 |

The 2-dimensional irreducible \(\chi_4\) has Frobenius-Schur indicator:

\[
\iota(\chi_4) = \frac{1}{8}\left(\chi_4(1^2) + \chi_4((-1)^2) + 2\chi_4(i^2) + 2\chi_4(j^2) + 2\chi_4(k^2)\right).
\]
Now \(1^2 = 1\), \((-1)^2 = 1\), \(i^2 = -1\), \(j^2 = -1\), \(k^2 = -1\). So:

\[
\iota(\chi_4) = \frac{1}{8}(2 + (-2) \cdot 1 + 2 \cdot (-2) + 2 \cdot (-2) + 2 \cdot (-2)) \cdot \ldots
\]
Wait, more carefully: \(g^2\) for each of the 8 elements: \(1^2 = 1, (-1)^2 = 1, i^2 = -1, (-i)^2 = -1, j^2 = -1, (-j)^2 = -1, k^2 = -1, (-k)^2 = -1\). So \(\iota(\chi_4) = \frac{1}{8}(\chi_4(1) + \chi_4(1) + \chi_4(-1) + \chi_4(-1) + \chi_4(-1) + \chi_4(-1) + \chi_4(-1) + \chi_4(-1)) = \frac{1}{8}(2 + 2 + (-2) \cdot 6) = \frac{1}{8}(4 - 12) = \frac{-8}{8} = -1\). So \(\chi_4\) is of quaternionic type. This means that while \(\chi_4\) is a 2-dimensional complex irreducible, it does *not* come from a real representation; instead, it comes from the natural 1-dimensional representation of \(Q_8\) over the quaternions \(\mathbb{H}\).

# Chapter 13: Applications to Group Theory

## Burnside's \(p^a q^b\) Theorem

One of the most striking applications of representation theory to pure group theory is Burnside's theorem, proved in 1904 using character theory — and for which no elementary proof was found until the 1970s.

<div class="theorem">
<strong>Theorem (Burnside, 1904).</strong> Let \(G\) be a group of order \(p^a q^b\) where \(p, q\) are primes. Then \(G\) is solvable.
</div>

The historical significance of this theorem is hard to overstate. In 1904, Burnside could prove it only using characters; the result sat with no group-theoretic proof for 70 years, until Goldschmidt (1970) and Matsuyama (1973) gave elementary proofs. That character theory could prove something apparently purely group-theoretic, and that nothing else could prove it for so long, is a testament to the power of the representation-theoretic approach.

The key character-theoretic ingredient is:

<div class="lemma">
<strong>Lemma.</strong> If \(C\) is a conjugacy class of \(G\) with \(|C|\) coprime to \(\dim V\) for an irreducible \(\mathbb{C}G\)-module \(V\) with \(\chi_V(e) > 1\), and if \(|C| > 1\), then \(\chi_V(C) = 0\) or \(\rho(g)\) is a scalar for \(g \in C\).
</div>

The proof proceeds via algebraic number theory: character values are algebraic integers, and so are \(\chi(g)/\chi(e)\). If \(|C|\) and \(\dim V\) are coprime, a Bezout argument shows \(\frac{|C|}{\chi(e)}\chi(g)\) is an algebraic integer, and combining with the absolute value bound \(|\chi(g)| \leq \chi(e)\) forces either \(\chi(g) = 0\) or \(|\chi(g)| = \chi(e)\) (all eigenvalues equal, making \(\rho(g)\) scalar).

The theorem follows: if \(G\) has a conjugacy class of size \(p^a\) (with \(a > 0\)), one analyzes the irreducible characters to show that \(G\) has a proper nontrivial normal subgroup, then proceeds by induction on \(|G|\). The existence of such a conjugacy class is guaranteed by Sylow theory.

<div class="remark">
<strong>Remark (What Burnside's theorem says structurally).</strong> Solvability means \(G\) has a composition series with all factors abelian. Groups of order \(p^a q^b\) include many familiar examples: dihedral groups, most abelian groups, groups of order up to 59 (all groups of order less than 60 are solvable). The first non-solvable group is \(A_5\) of order 60 (which has order \(2^2 \cdot 3 \cdot 5\) — three primes, not two). Burnside's theorem explains why: any group that is non-solvable must have order divisible by at least three distinct primes.
</div>

## Dimension Divisibility

Another application of character theory to group structure:

<div class="theorem">
<strong>Theorem.</strong> Let \(V\) be an irreducible \(\mathbb{C}G\)-module. Then \(\dim V\) divides \(|G|\).
</div>

The proof uses the fact that \(\frac{|G|}{\dim V}\chi_V(g)\) is an algebraic integer for all \(g\) (proved using character inner products and the fact that character values are algebraic integers), combined with the formula \(\frac{|G|}{(\dim V)^2} = \sum_g \frac{\chi_V(g)\overline{\chi_V(g)}}{\dim V}\).

More precisely: one proves \(\frac{|G|}{\dim V} \in \mathbb{Z}\) by showing that \(\frac{|G|}{\dim V} = \sum_{g \in G} \frac{\chi_V(g) \overline{\chi_V(g)}}{\dim V}\) is a sum of algebraic integers (hence an algebraic integer) that also lies in \(\mathbb{Q}\) (hence in \(\mathbb{Z}\)).

<div class="example">
<strong>Example (Divisibility constraints).</strong> For \(S_4\) with \(|G| = 24\), the possible irreducible dimensions are divisors of 24: \(1, 2, 3, 4, 6, 8, 12, 24\). Combined with \(\sum d_i^2 = 24\) and 5 conjugacy classes, the unique solution is \((1,1,2,3,3)\). Every \(d_i\) indeed divides 24. For \(A_5\) with \(|G| = 60\), the five irreducible dimensions are \((1,3,3,4,5)\), all dividing 60. ✓
</div>

## Additional Character-Theoretic Applications

### Normal Subgroups via Characters

Representation theory gives a clean detection of normal subgroups:

<div class="theorem">
<strong>Theorem.</strong> A normal subgroup \(N \trianglelefteq G\) can be recovered from the character table: \(N\) is the intersection of the kernels of all irreducible representations, and the set of all normal subgroups is the set of all intersections \(\bigcap_{i \in I} \ker\chi_i\) for subsets \(I \subseteq \{1, \ldots, r\}\).
</div>

In other words: a subgroup is normal if and only if it is a union of conjugacy classes, and a normal subgroup is "seen" by the character table as a set of conjugacy classes where certain characters take special values (equal to their degree at the identity).

<div class="example">
<strong>Example (Normal subgroups of \(S_4\)).</strong> From the character table of \(S_4\):
- \(\ker\chi_\mathrm{sgn} = A_4\) (the alternating group, index 2).
- \(\ker\chi_2\) consists of elements where the 2-dimensional representation is trivial. Reading off from the character table, \(\chi_2(g) = 2 = \chi_2(e)\) only for \(g = e\) and \(g = (12)(34), (13)(24), (14)(23)\) (the double transpositions). So \(\ker\chi_2 = \{e, (12)(34),(13)(24),(14)(23)\} = V_4\), the Klein four-group.
- The intersection \(\ker\chi_\mathrm{sgn} \cap \ker\chi_2 = A_4 \cap V_4 = V_4\) (since \(V_4 \leq A_4\)).
The normal subgroups of \(S_4\) are exactly \(\{e\}\), \(V_4\), \(A_4\), and \(S_4\) — all recoverable from the character table. ✓
</div>

# Chapter 14: Induction of Representations

## Induced Representations

If \(H \leq G\) and \(W\) is an \(H\)-module, we want to build a \(G\)-module "from" \(W\). This is the process of **induction**, dual to restriction.

<div class="definition">
<strong>Definition.</strong> Let \(H \leq G\) and let \(W\) be a \(\mathbb{C}H\)-module. The <strong>induced representation</strong> of \(W\) from \(H\) to \(G\) is the \(\mathbb{C}G\)-module:

\[
\mathrm{Ind}_H^G(W) = \mathbb{C}G \otimes_{\mathbb{C}H} W,
\]
where \(\mathbb{C}G\) is viewed as a \((\mathbb{C}G, \mathbb{C}H)\)-bimodule. We write \(W \uparrow_H^G\) or \(W \uparrow\).
</div>

**Concrete construction.** Let \(\{t_1, \ldots, t_k\}\) be a set of left coset representatives for \(G/H\), so \(G = \bigsqcup_{i=1}^k t_i H\). Then as a vector space,

\[
\mathrm{Ind}_H^G(W) = t_1 \otimes W \oplus \cdots \oplus t_k \otimes W \cong W^k
\]
(with \(k = [G:H]\) summands), and the action of \(g \in G\) sends \(t_i \otimes w\) to \(t_j \otimes h \cdot w\), where \(gt_i = t_j h\) for the unique \(t_j\) and \(h \in H\). In particular, \(\dim \mathrm{Ind}_H^G(W) = [G:H] \cdot \dim W\).

<div class="remark">
<strong>Remark (Restriction and induction as adjoints).</strong> The restriction functor \(\mathrm{Res}_H^G\) takes a \(G\)-module and restricts the action to \(H\). The induction functor \(\mathrm{Ind}_H^G\) goes the other direction: it takes an \(H\)-module and builds a \(G\)-module. Frobenius reciprocity says these functors are adjoint:

\[
\mathrm{Hom}_G(\mathrm{Ind}_H^G W, V) \cong \mathrm{Hom}_H(W, \mathrm{Res}_H^G V).
\]
This adjunction is the categorical origin of Frobenius reciprocity.
</div>

<div class="example">
<strong>Example.</strong> Inducing the trivial representation of \(H\) to \(G\) gives the permutation representation \(\mathbb{C}\langle G/H \rangle\): \(\mathrm{Ind}_H^G(\mathbf{1}_H) \cong \mathbb{C}\langle G/H \rangle\). In particular, \(\mathrm{Ind}_{\{e\}}^G(\mathbf{1}) \cong \mathbb{C}\langle G \rangle\) is the regular representation.
</div>

<div class="example">
<strong>Example (Induced representation of \(C_2\) in \(S_3\)).</strong> Let \(H = \langle (12) \rangle \cong C_2 \leq S_3\). The group \(H\) has two irreducible representations: trivial \(\chi_+\) and sign \(\chi_-\). The index \([S_3 : H] = 3\). Let us compute \(\mathrm{Ind}_H^{S_3}(\chi_-)\) using the character formula.

Choose coset representatives \(t_1 = e\), \(t_2 = (13)\), \(t_3 = (23)\). For \(g = (12) \in S_3\):

\[
\chi_{\mathrm{Ind} \chi_-}((12)) = \sum_{\{i : t_i^{-1}(12)t_i \in H\}} \chi_-(t_i^{-1}(12)t_i).
\]
We need \(t_i^{-1}(12)t_i \in H = \{e, (12)\}\). Check: \(e^{-1}(12)e = (12) \in H\), contributing \(\chi_-((12)) = -1\); \((13)^{-1}(12)(13) = (23) \notin H\); \((23)^{-1}(12)(23) = (13) \notin H\). So \(\chi_{\mathrm{Ind}\chi_-}((12)) = -1\).

Similarly: \(\chi_{\mathrm{Ind}\chi_-}(e) = 3 \cdot \chi_-(e) = 3 \cdot 1 = 3\); for \((123)\): \(e^{-1}(123)e = (123) \notin H\), and the other coset representatives also give conjugates not in \(H\), so \(\chi_{\mathrm{Ind}\chi_-}((123)) = 0\). The character values are \((3, -1, 0)\) on the three conjugacy classes — this is the character of \(V_\mathrm{triv} \oplus V_\mathrm{std}\)! (Indeed \(1 + 2 = 3\), \(1 + 0 = 1\), \(1 + (-1) = 0\) — wait, \(1 \cdot 1 + (-1) \cdot 1 = 0 \neq -1\). Let me recalculate: \(\chi_\mathrm{triv}((12)) + \chi_\mathrm{std}((12)) = 1 + 0 = 1 \neq -1\). So \(\mathrm{Ind}_H^{S_3}(\chi_-) \ncong V_\mathrm{triv} \oplus V_\mathrm{std}\). By character inner products: \(\langle (3,-1,0), \chi_\mathrm{triv} \rangle = \frac{1}{6}(3 \cdot 1 + 3 \cdot (-1) \cdot 1 + 2 \cdot 0) = 0\); \(\langle (3,-1,0), \chi_\mathrm{sgn} \rangle = \frac{1}{6}(3 - 3(-1)(-1) + 0) = \frac{1}{6}(3-3) = 0\). That gives multiplicity 0 for both one-dimensional irreducibles, but \(\langle (3,-1,0), \chi_\mathrm{std} \rangle = \frac{1}{6}(3\cdot 2 + 3\cdot(-1)(0) + 2\cdot 0\cdot(-1)) = \frac{6}{6} = 1\)... but \(\dim = 3 \neq 2\). Something is wrong. Rechecking: for \(g = e\), \(\chi_{\uparrow}(e) = \sum_i \chi_-(t_i^{-1} e t_i) = 3 \cdot \chi_-(e) = 3\). For \(g = (12)\), only \(i = 1\) contributes (as computed), giving \(-1\). For \(g = (123)\), \(t_1^{-1}(123)t_1 = (123) \notin H\); \((13)(123)(13) = (132) \cdot\)... actually \((13)^{-1}(123)(13)\): let us compute directly. \((13)(123) = (23)\) (as permutations), then \((23)(13) = (123)\). So \((13)^{-1}(123)(13) = (123) \notin H\). Similarly for \(t_3\). So \(\chi_\uparrow((123)) = 0\). Character values: \((3, -1, 0)\) on classes of sizes \(1, 3, 2\). Inner products: \(\langle \chi_\uparrow, \chi_\mathrm{triv} \rangle = \frac{1}{6}(3 - 3 + 0) = 0\), \(\langle \chi_\uparrow, \chi_\mathrm{sgn} \rangle = \frac{1}{6}(3 + 3 + 0) = 1\), \(\langle \chi_\uparrow, \chi_\mathrm{std} \rangle = \frac{1}{6}(6 + 0 + 0) = 1\). So \(\mathrm{Ind}_H^{S_3}(\chi_-) \cong V_\mathrm{sgn} \oplus V_\mathrm{std}\). ✓ Dimension: \(1 + 2 = 3 = [S_3:H] \cdot \dim \chi_- = 3 \cdot 1\). ✓
</div>

## Frobenius Reciprocity

The most fundamental property of induction is its adjointness to restriction:

<div class="theorem">
<strong>Theorem (Frobenius Reciprocity).</strong> Let \(W\) be a \(\mathbb{C}H\)-module and \(V\) a \(\mathbb{C}G\)-module. Then there is a natural isomorphism of vector spaces:

\[
\mathrm{Hom}_{\mathbb{C}H}(W, \mathrm{Res}_H^G(V)) \cong \mathrm{Hom}_{\mathbb{C}G}(\mathrm{Ind}_H^G(W), V).
\]
In terms of characters:

\[
\langle \chi_W, \chi_V \!\!\downarrow \rangle_H = \langle \chi_W\!\!\uparrow, \chi_V \rangle_G.
\]
</div>

This says: the multiplicity of \(W\) in the restriction of \(V\) equals the multiplicity of \(V\) in the induction of \(W\). Frobenius reciprocity is an extremely efficient computational tool: to determine the decomposition of induced representations, one can instead analyze restrictions, which are often easier.

<div class="proof">
<strong>Proof of the character formula.</strong> We compute directly. Let \(\{t_1, \ldots, t_k\}\) be coset representatives for \(G/H\). Then:

\[
\langle \chi_W \uparrow, \chi_V \rangle_G = \frac{1}{|G|}\sum_{g \in G} \chi_W\uparrow(g) \overline{\chi_V(g)} = \frac{1}{|G|} \sum_{g \in G} \left(\frac{1}{|H|}\sum_{x \in G, x^{-1}gx \in H} \chi_W(x^{-1}gx)\right) \overline{\chi_V(g)}.
\]
Switching the order of summation and substituting \(h = x^{-1}gx \in H\):

\[
= \frac{1}{|G||H|} \sum_{x \in G} \sum_{h \in H} \chi_W(h) \overline{\chi_V(xhx^{-1})} = \frac{1}{|H|}\sum_{h \in H} \chi_W(h) \left(\frac{1}{|G|}\sum_{x \in G}\overline{\chi_V(xhx^{-1})}\right) = \frac{1}{|H|}\sum_{h \in H}\chi_W(h)\overline{\chi_V(h)} = \langle \chi_W, \chi_V\downarrow\rangle_H,
\]
using that \(\chi_V\) is a class function (so \(\chi_V(xhx^{-1}) = \chi_V(h)\)) and \(\frac{1}{|G|}\sum_{x \in G} = 1\). \(\square\)
</div>

<div class="corollary">
<strong>Corollary.</strong> For every \(V \in \mathrm{Irr}_\mathbb{C}(G)\), there exists \(W \in \mathrm{Irr}_\mathbb{C}(H)\) such that \(V\) occurs as a direct summand of \(\mathrm{Ind}_H^G(W)\). In other words, every irreducible of \(G\) can be induced from an irreducible of some subgroup.
</div>

This corollary provides a strategy for determining \(\mathrm{Irr}(G)\): start from irreducibles of subgroups and induce up. This strategy is particularly powerful for groups with a rich subgroup structure, like \(GL_n(\mathbb{F}_q)\).

## The Character Formula for Induced Representations

<div class="proposition">
<strong>Proposition.</strong> Let \(W\) be a \(\mathbb{C}H\)-module with character \(\chi_W\), and let \(\{t_1, \ldots, t_k\}\) be coset representatives for \(G/H\). Then:

\[
\chi_{W\uparrow}(g) = \sum_{\substack{i=1 \\ t_i^{-1}gt_i \in H}}^k \chi_W(t_i^{-1}gt_i) = \frac{1}{|H|} \sum_{\substack{x \in G \\ x^{-1}gx \in H}} \chi_W(x^{-1}gx).
\]
In particular, \(\chi_{W\uparrow}(g) = 0\) if the conjugacy class of \(g\) in \(G\) does not intersect \(H\).
</div>

<div class="example">
<strong>Example (Inducing from \(A_3\) to \(S_3\)).</strong> The group \(A_3 \cong C_3\) has three irreducible characters \(\phi_0, \phi_1, \phi_2\) (the trivial and two non-trivial cubic characters). Inducing to \(S_3\): \(\phi_0 \uparrow \cong \chi_\mathrm{triv} \oplus \chi_\mathrm{sgn}\) (the permutation representation \(\mathbb{C}\langle S_3/A_3 \rangle\)), while \(\phi_1 \uparrow \cong \phi_2 \uparrow \cong \chi_\mathrm{std}\). Frobenius reciprocity confirms: \(\mathrm{mult}(\phi_1, \chi_\mathrm{std}\!\downarrow) = \mathrm{mult}(\chi_\mathrm{std}, \phi_1\!\uparrow) = 1\).

Let us verify \(\phi_1 \uparrow \cong \chi_\mathrm{std}\) explicitly. Take coset representatives \(\{e, (12)\}\). The character formula for \(g = (12)\): we need \(t_i^{-1}(12)t_i \in A_3\). For \(t_1 = e\): \((12) \notin A_3\). For \(t_2 = (12)\): \((12)^{-1}(12)(12) = (12) \notin A_3\). So \(\phi_1\uparrow((12)) = 0\). For \(g = (123)\): \(e^{-1}(123)e = (123) \in A_3\), contributing \(\phi_1((123)) = \omega\); \((12)^{-1}(123)(12) = (132) \in A_3\), contributing \(\phi_1((132)) = \omega^{-1} = \bar\omega\). Sum: \(\omega + \bar\omega = 2\cos(2\pi/3) = -1\). So \(\phi_1\uparrow((123)) = -1\). Character values: \((2, 0, -1)\) = character of \(\chi_\mathrm{std}\). ✓
</div>

## Mackey's Irreducibility Criterion

A natural question is when an induced representation is irreducible. The answer involves the notion of **Mackey's double coset formula**. If \(H, K \leq G\), then \(G\) decomposes into double cosets \(HsK\), and restricting the induced module \(\mathrm{Ind}_H^G(W)\) to \(K\) decomposes it into pieces indexed by these double cosets:

<div class="theorem">
<strong>Theorem (Mackey's Restriction Formula).</strong>

\[
\mathrm{Res}_K^G(\mathrm{Ind}_H^G(W)) \cong \bigoplus_{s \in H\backslash G/K} \mathrm{Ind}_{K \cap s^{-1}Hs}^K({}^s W),
\]
where \({}^s W\) is the \((s^{-1}Hs \cap K)\)-module defined by \({}^s W(k) = W(sks^{-1})\).
</div>

<div class="theorem">
<strong>Theorem (Mackey's Irreducibility Criterion).</strong> The induced module \(\mathrm{Ind}_H^G(W)\) is irreducible if and only if:
<ol>
<li>\(W \in \mathrm{Irr}(H)\), and</li>
<li>For every \(s \in G \setminus H\), the representations \(\mathrm{Res}_{H \cap s^{-1}Hs}^H(W)\) and \(\mathrm{Res}_{H \cap sHs^{-1}}^H({}^s W)\) have no common irreducible constituent.
</ol>
</div>

In the special case \(H \trianglelefteq G\), the double cosets are just cosets, and the criterion simplifies: \(\mathrm{Ind}_H^G(W)\) is irreducible if and only if \(W\) is irreducible and no two conjugates \({}^s W\) and \(W\) (\(s \notin H\)) are isomorphic.

<div class="example">
<strong>Example (Character table of \(A_5\)).</strong> The alternating group \(A_5\) is the smallest nonabelian simple group, of order 60 with 5 conjugacy classes. Starting from \(\mathrm{Irr}(A_4)\) (which has three degree-1 representations and one degree-3 representation), we can induce to \(A_5\): the non-trivial degree-1 characters of the cyclic subgroup \(C_5 \leq A_5\) induce to an irreducible degree-5 character (verified via Frobenius reciprocity). The complete character table of \(A_5\) is:

| | \(1 \cdot e\) | \(20 \cdot (1\,2\,3)\) | \(15 \cdot (1\,2)(3\,4)\) | \(12 \cdot (1\,2\,3\,4\,5)\) | \(12 \cdot (1\,3\,4\,5\,2)\) |
|---|---|---|---|---|---|
| \(\chi_0\) | 1 | 1 | 1 | 1 | 1 |
| \(\chi_1\) | 3 | 0 | \(-1\) | \(\frac{1+\sqrt{5}}{2}\) | \(\frac{1-\sqrt{5}}{2}\) |
| \(\chi_2\) | 3 | 0 | \(-1\) | \(\frac{1-\sqrt{5}}{2}\) | \(\frac{1+\sqrt{5}}{2}\) |
| \(\chi_3\) | 4 | 1 | 0 | \(-1\) | \(-1\) |
| \(\chi_4\) | 5 | \(-1\) | 1 | 0 | 0 |

The golden ratio \(\varphi = \frac{1+\sqrt{5}}{2}\) appearing in the character values of \(A_5\) reflects the group's connection to the icosahedron and its fivefold symmetry. Note that \(1^2 + 3^2 + 3^2 + 4^2 + 5^2 = 60 = |A_5|\). ✓

The two 3-dimensional irreducibles \(\chi_1, \chi_2\) arise from the two 3-dimensional geometric representations of \(A_5\): the group \(A_5 \cong \mathrm{Isom}^+(S^2_\mathrm{icosa})\) acts on \(\mathbb{R}^3\) in two ways related by an outer automorphism (since \(A_5\) is simple, any two faithful permutation representations of degree 5 are related by such an automorphism). The representations \(\chi_1\) and \(\chi_2\) are complex conjugates of each other — their character values involve \(\varphi\) and \(\bar\varphi = \frac{1-\sqrt{5}}{2} = 1 - \varphi\). The 4-dimensional irreducible \(\chi_3\) arises as the standard representation of \(A_5\) inside \(S_5\), and \(\chi_4\) (dimension 5) comes from inducing from the two-element subgroup \(C_2 \leq A_5\).
</div>

<div class="remark">
<strong>Remark (Frobenius groups).</strong> A particularly clean application of induction is the theory of <strong>Frobenius groups</strong>. A finite group \(G\) is a Frobenius group with kernel \(N\) and complement \(H\) if \(H\) is a subgroup with \(H \cap H^g = \{e\}\) for all \(g \notin H\), and \(N = G \setminus \bigcup_{g \in G} (H^g \setminus \{e\})\) is a normal subgroup with \(G = NH\) and \(N \cap H = \{e\}\). The key representation-theoretic fact is that every irreducible of \(G\) is either (a) inflated from \(G/N \cong H\), or (b) induced from a non-trivial irreducible of \(N\), and all of type (b) have dimension \(|H| \cdot \dim(\text{irrep of }N)\). The Frobenius kernel \(N\) is always nilpotent — this is one of the hardest theorems in group theory, and no purely group-theoretic proof is known.
</div>

# Chapter 15: The Structure of the Group Algebra and Further Topics

## Conjugacy Class Sums and the Multiplication of Blocks

The conjugacy class sums \(C_j^+ = \sum_{g \in C_j} g\) span the center \(Z(\mathbb{C}G)\). As noted, they form a basis, so the center is an \(r\)-dimensional commutative algebra. One can compute the structure constants of this algebra — the coefficients in

\[
C_i^+ \cdot C_j^+ = \sum_k a_{ij}^k C_k^+
\]
— directly in terms of group theory:

\[
a_{ij}^k = \frac{|C_i||C_j|}{|G|}\sum_{\ell=1}^r \frac{\chi_\ell(C_i)\chi_\ell(C_j)\overline{\chi_\ell(C_k)}}{\chi_\ell(e)}.
\]
These structure constants are always non-negative integers (since \(a_{ij}^k\) counts the number of ways to write a fixed element of \(C_k\) as a product of an element from \(C_i\) and an element from \(C_j\)). The formula above is a consequence of the character theory developed earlier and provides another "check" on character tables.

<div class="example">
<strong>Example (Structure constants for \(S_3\)).</strong> Consider the product \(C_\mathrm{trans}^+ \cdot C_\mathrm{trans}^+\) where \(C_\mathrm{trans} = \{(12),(13),(23)\}\). Each product of two transpositions is either the identity (if they are equal) or a 3-cycle. Specifically, in \(S_3\):

\[
(12)(12) = e, \quad (12)(13) = (132), \quad (12)(23) = (123),
\]
and similarly for other pairs. Each element of \(C_\mathrm{trans}\) squares to \(e\), giving 3 contributions to the identity; each ordered pair of distinct elements of \(C_\mathrm{trans}\) gives a 3-cycle, with \(3 \cdot 2 = 6\) contributions to \(C_\mathrm{cycle}^+ = \{(123),(132)\}\). So

\[
(C_\mathrm{trans}^+)^2 = 3 \cdot e + 3 \cdot C_\mathrm{cycle}^+ = 3 C_1^+ + 3 C_\mathrm{cycle}^+
\]
(where \(C_1^+ = e\)), giving structure constants \(a_{\mathrm{trans},\mathrm{trans}}^e = 3\), \(a_{\mathrm{trans},\mathrm{trans}}^\mathrm{cycle} = 3\), and \(a_{\mathrm{trans},\mathrm{trans}}^\mathrm{trans} = 0\). One can verify these using the character formula.
</div>

## Representation Theory of \(GL_2(\mathbb{F}_q)\)

As a glimpse of more advanced representation theory, we briefly describe the representation theory of \(GL_2(\mathbb{F}_q)\), the group of invertible \(2 \times 2\) matrices over the field with \(q\) elements (where \(q = p^n\) for a prime \(p\)).

The group \(GL_2(\mathbb{F}_q)\) has order \((q^2-1)(q^2-q) = q(q-1)^2(q+1)\). Its representation theory over \(\mathbb{C}\) is rich and serves as a prototype for the representation theory of \(GL_n(\mathbb{F}_q)\) in general. The irreducible representations fall into several families:

1. **Principal series representations** (\((q-1)^2/2\) of them, roughly): induced from characters of the Borel subgroup (upper triangular matrices).
2. **Special representations** (\(q-1\) of them): twisted versions of the Steinberg representation.
3. **Cuspidal representations** (\(q(q-1)/2\) of them): "new" representations that do not appear in the principal series; they are harder to construct and require working with characters of non-split tori.

The total number of conjugacy classes of \(GL_2(\mathbb{F}_q)\) is \(q^2 - 1\) (this requires a calculation involving the classification of conjugacy classes of matrices over finite fields). One can verify:

\[
|GL_2(\mathbb{F}_q)| = \sum_i (\dim V_i)^2
\]
using the dimensions of the irreducibles above, providing a non-trivial check.

This example illustrates how the representation theory of "groups of Lie type" — finite groups arising as points of algebraic groups over finite fields — is an active and deep area of current mathematics, with connections to the Langlands program, modular forms, and automorphic representations.

## Summary Table: Key Facts

The following table summarizes the main structural facts proved in this course.

| Theorem | Statement | Key Tool |
|---|---|---|
| Maschke (1898) | Every rep in char 0 (or \(\mathrm{char}\nmid \vert G\vert \)) is semisimple | Averaging projector |
| Schur's Lemma | \(\mathrm{Hom}_G(V,W) = 0\) or isomorphisms only; End\(_G(V) \cong F\) | Kernel/image are \(G\)-invariant |
| 1st Orthogonality | \(\langle \chi_i, \chi_j \rangle = \delta_{ij}\) | Schur + averaging |
| 2nd Orthogonality | \(\sum_i \chi_i(g)\overline{\chi_i(h)} = \vert C_G(g)\vert \delta_{[g],[h]}\) | Unitarity of character table |
| Dimension formula | \(\vert G\vert = \sum_i (\dim V_i)^2\) | Regular rep decomposition |
| \(\#\mathrm{Irr} = \#\mathrm{conj. classes}\) | \(r = h(G)\) | \(\dim Z(\mathbb{C}G) = r = h(G)\) |
| Artin-Wedderburn | \(\mathbb{C}G \cong \prod_i M_{n_i}(\mathbb{C})\) | Semisimplicity + Schur |
| Frobenius reciprocity | \(\langle \chi_W\uparrow, \chi_V \rangle_G = \langle \chi_W, \chi_V\downarrow\rangle_H\) | Adjunction of Ind/Res |
| Burnside \(p^aq^b\) | Groups of order \(p^aq^b\) are solvable | Algebraic integers + characters |
| Dim divisibility | \(\dim V \mid \vert G\vert \) for irr. \(V\) | Algebraic integers |
| Hook length formula | \(\dim S^\lambda = n!/\prod h(i,j)\) | Young symmetrizers |

## A Final Word: Why Character Tables Are So Powerful

A finite group \(G\) can be an utterly intractable combinatorial object. The symmetric group \(S_{20}\) has more than \(2.4 \times 10^{18}\) elements; a direct attack on its structure is hopeless. But its character table — a \(p(20) \times p(20) = 627 \times 627\) matrix, where \(p(20)\) is the number of partitions of 20 — encodes all the essential information about its representation theory in a finite, computable form.

The character table knows:
- All normal subgroups (as intersections of kernels of characters).
- Whether the group is abelian, solvable, simple, etc.
- How representations tensor with each other (via the Clebsch-Gordan coefficients).
- The structure of the group algebra via Artin-Wedderburn.

And yet it does not know everything: there exist non-isomorphic groups with the same character table (they are called **Brauer pairs** or simply groups with the same character degrees). The character table is a very powerful invariant, but not a complete invariant.

The fact that such a finite object captures so much information about an infinite-looking problem is, in the end, the deepest miracle of representation theory. It arises because group theory (non-commutative, combinatorial) and linear algebra (commutative, continuous) happen to resonate in exactly the right way — and the character theory we have developed in this course is the mathematical expression of that resonance.

# Chapter 16: Deeper Dives — Worked Computations and Extensions

## The \(D_4\) Character Table: A Detailed Construction

We have stated the character table of \(D_4 = D_8\) (the dihedral group of order 8) earlier. Let us now redo the construction completely from scratch, using only the structure of \(D_4\) and the general theory, without any foreknowledge of the representations.

### Step 1: Group Structure and Conjugacy Classes

The dihedral group of order 8 is \(D_4 = \langle r, s \mid r^4 = s^2 = e,\ srs^{-1} = r^{-1} \rangle\). Its 8 elements are \(\{e, r, r^2, r^3, s, rs, r^2s, r^3s\}\). To find the conjugacy classes, we compute conjugates:

- \(e\) is always alone: \(C_1 = \{e\}\).
- Since \(srs^{-1} = r^{-1} = r^3\), we have \(r \sim r^3\). Is \(r \sim r^2\)? Computing \(r^k r r^{-k} = r\) for all \(k\), and \(sr^k r (sr^k)^{-1} = sr^{k+1}r^{-k}s^{-1} = s r s^{-1} = r^{-1} = r^3\). So \(r\) and \(r^3\) are conjugate but \(r^2\) is not conjugate to \(r\). Thus \(C_3 = \{r, r^3\}\).
- \(r^2\) generates \(\{e, r^2\}\) in the center: \(r \cdot r^2 \cdot r^{-1} = r^2\) and \(s r^2 s^{-1} = r^{-2} = r^2\). So \(C_2 = \{r^2\}\).
- For the reflections: \(r s r^{-1} = r s r^3 = r (r^3 s) \cdot \text{(using } rs = sr^{-1}) \). Alternatively: \(r \cdot s \cdot r^{-1} = r s r^3\). Using \(rs = sr^{-1} = sr^3\): \(r(sr^3) = (rs)r^3 = sr^{-1}r^3 = sr^2 = r^2s \cdot \text{?}\) Let me be more careful. In \(D_4\), the rule is \(sr = r^{-1}s = r^3 s\). So \(r s r^{-1} = r s r^3\). First, \(sr^3 = r^{-3}s = rs\). So \(r(sr^3) = r \cdot rs \cdot\)... Actually let me use a direct computation: \(r s r^{-1}\). We have \(rs = sr^{-1}\), so \(r = sr^{-1}s^{-1}\)... this is getting complicated. Let me just tabulate:

Using the standard relation \(sr = r^{-1}s\), we can compute:

\[
r s r^{-1} = r s r^3.
\]
Now \(rs = sr^{-1} = sr^3\) (since \(sr = r^{-1}s \Rightarrow rs = s^{-1}r^{-1} \cdot s^2 = ...\)). Let us use the presentation directly: conjugating \(s\) by \(r\):

\[
r s r^{-1}: \text{ need to express as a word in }r, s.
\]
From \(srs^{-1} = r^{-1}\), we get \(sr = r^{-1}s\), so \(rs = sr\) ... no. From \(srs = r^{-1}\) (since \(s^2 = e\)):

\[
rs = s r^{-1} \cdot s^2 \cdot s^{-1} = \ldots
\]
Let me use the explicit matrix representation instead. With \(\rho(r) = \bigl(\begin{smallmatrix}0&-1\\1&0\end{smallmatrix}\bigr)\) and \(\rho(s) = \bigl(\begin{smallmatrix}1&0\\0&-1\end{smallmatrix}\bigr)\):

\[
\rho(r)\rho(s)\rho(r)^{-1} = \begin{pmatrix}0&-1\\1&0\end{pmatrix}\begin{pmatrix}1&0\\0&-1\end{pmatrix}\begin{pmatrix}0&1\\-1&0\end{pmatrix} = \begin{pmatrix}0&1\\1&0\end{pmatrix}\begin{pmatrix}0&1\\-1&0\end{pmatrix} = \begin{pmatrix}-1&0\\0&1\end{pmatrix} = \rho(r^2 s).
\]
So \(r s r^{-1} = r^2 s\). Similarly, \(r^2 s r^{-2} = s\) (can be verified). And \(r^3 s r^{-3} = r^2 s\) by similar computation. Wait: \(r(r^2 s)r^{-1} = r^3 s r^{-1} = r^3 s r^3 = \ldots\). Actually one can check that the four reflections \(\{s, rs, r^2s, r^3s\}\) split into two conjugacy classes:
- \(C_4 = \{s, r^2 s\}\): since \(r s r^{-1} = r^2 s\) (computed above), and \(r^2 s (r^2)^{-1} = r^2 s r^2 = s\) (since \(r^2\) is central), so \(s\) and \(r^2 s\) are conjugate.
- \(C_5 = \{rs, r^3 s\}\): since \(r(rs)r^{-1} = r^2 s r^3 = r^{-1}s = r^3 s\).

So the 5 conjugacy classes are: \(C_1 = \{e\}\), \(C_2 = \{r^2\}\), \(C_3 = \{r, r^3\}\), \(C_4 = \{s, r^2s\}\), \(C_5 = \{rs, r^3s\}\), with sizes 1, 1, 2, 2, 2.

### Step 2: Determine Dimension Types

\(|D_4| = 8 = \sum d_i^2\) with 5 terms: unique solution \((1,1,1,1,2)\). The abelianization is \(D_4 / [D_4, D_4]\). The commutator subgroup \([D_4, D_4]\) is generated by \([r, s] = rsr^{-1}s^{-1} = r \cdot r^{-2}s \cdot s = r^{-1}\)... wait, let me compute \([r,s] = rsr^{-1}s^{-1}\). We showed \(rsr^{-1} = r^2s\), so \([r,s] = r^2s \cdot s^{-1} = r^2\). Thus \([D_4, D_4] = \langle r^2 \rangle = \{e, r^2\}\) and \(D_4^{\mathrm{ab}} = D_4/\{e, r^2\} \cong C_2 \times C_2\). This has 4 elements, confirming 4 one-dimensional representations.

### Step 3: Write Down the One-Dimensional Representations

The one-dimensional representations factor through \(D_4^{\mathrm{ab}} \cong C_2 \times C_2\). In this quotient, \(r\) maps to an element of order dividing 2 and \(s\) maps to an element of order dividing 2. So \(\rho(r) \in \{+1, -1\}\) and \(\rho(s) \in \{+1, -1\}\) with the only constraint \(\rho(r)^4 = \rho(s)^2 = 1\) (automatic) and \(\rho(s)\rho(r)\rho(s)^{-1} = \rho(r)^{-1}\), which forces \(\rho(r)^{-1} = \rho(r)\) (since \(\rho(s)^2 = 1\)), i.e., \(\rho(r)^2 = 1\). So \(\rho(r) = \pm 1\) and \(\rho(s) = \pm 1\), giving 4 choices:

| | \(e\) | \(r^2\) | \(r, r^3\) | \(s, r^2s\) | \(rs, r^3s\) |
|---|---|---|---|---|---|
| \(\chi_1\): \((\rho(r), \rho(s)) = (1,1)\) | 1 | 1 | 1 | 1 | 1 |
| \(\chi_2\): \((\rho(r), \rho(s)) = (1,-1)\) | 1 | 1 | 1 | \(-1\) | \(-1\) |
| \(\chi_3\): \((\rho(r), \rho(s)) = (-1,1)\) | 1 | 1 | \(-1\) | 1 | \(-1\) |
| \(\chi_4\): \((\rho(r), \rho(s)) = (-1,-1)\) | 1 | 1 | \(-1\) | \(-1\) | 1 |

### Step 4: Find the 2-Dimensional Irreducible by Orthogonality

Let \(\chi_5 = (a, b, c, d, e_5)\) be the unknown row. We know \(a = \chi_5(e) = 2\).

Row orthogonality with \(\chi_1\) (trivial rep):

\[
\frac{1}{8}(1 \cdot 2 + 1 \cdot b + 2 \cdot c + 2 \cdot d + 2 \cdot e_5) = 0 \implies 2 + b + 2c + 2d + 2e_5 = 0.
\]

Row orthogonality with \(\chi_2\):

\[
\frac{1}{8}(2 + b + 2c - 2d - 2e_5) = 0 \implies 2 + b + 2c - 2d - 2e_5 = 0.
\]

Subtracting: \(4d + 4e_5 = 0 \implies d = -e_5\).

Row orthogonality with \(\chi_3\):

\[
\frac{1}{8}(2 + b - 2c + 2d - 2e_5) = 0 \implies 2 + b - 2c + 2d - 2e_5 = 0.
\]

Row orthogonality with \(\chi_4\):

\[
\frac{1}{8}(2 + b - 2c - 2d + 2e_5) = 0 \implies 2 + b - 2c - 2d + 2e_5 = 0.
\]

From the \(\chi_3\) and \(\chi_4\) equations, adding: \(4 + 2b - 4c = 0 \implies b = 2c - 2\). Subtracting: \(4d - 4e_5 = 0 \implies d = e_5\). Combined with \(d = -e_5\): \(d = e_5 = 0\).

Now from \(\chi_1\) equation: \(2 + b + 2c = 0\), and \(b = 2c - 2\): \(2 + (2c-2) + 2c = 0 \implies 4c = 0 \implies c = 0\). Then \(b = -2\).

Finally, check normality: \(\langle \chi_5, \chi_5 \rangle = \frac{1}{8}(4 + 4 + 0 + 0 + 0) = 1\). ✓

The full character table of \(D_4\):

| | \(\{e\}\) | \(\{r^2\}\) | \(\{r,r^3\}\) | \(\{s,r^2s\}\) | \(\{rs,r^3s\}\) |
|---|---|---|---|---|---|
| \(\chi_1\) | 1 | 1 | 1 | 1 | 1 |
| \(\chi_2\) | 1 | 1 | 1 | \(-1\) | \(-1\) |
| \(\chi_3\) | 1 | 1 | \(-1\) | 1 | \(-1\) |
| \(\chi_4\) | 1 | 1 | \(-1\) | \(-1\) | 1 |
| \(\chi_5\) | 2 | \(-2\) | 0 | 0 | 0 |

Verification: \(1 + 1 + 1 + 1 + 4 = 8 = |D_4|\). ✓

Column orthogonality (columns \(C_2\) and \(C_3\)):

\[
1 \cdot 1 + 1 \cdot 1 + 1 \cdot (-1) + 1 \cdot (-1) + (-2) \cdot 0 = 1 + 1 - 1 - 1 + 0 = 0. \checkmark
\]

### The 2-Dimensional Representation Explicitly

We already wrote down the 2-dimensional representation via matrices. Let us verify that the character values match. The conjugacy class \(C_3 = \{r, r^3\}\) has \(\chi_5(r) = \mathrm{tr}\bigl(\begin{smallmatrix}0&-1\\1&0\end{smallmatrix}\bigr) = 0 = \chi_5(r^3)\). The class \(C_2 = \{r^2\}\) has \(\chi_5(r^2) = \mathrm{tr}(-I) = -2\). All consistent with the table. ✓

### Tensor Products of \(D_4\) Representations

Let us use the character table to compute some tensor products. The character of \(\chi_2 \otimes \chi_3\) is the pointwise product of the two rows:

\[
(1 \cdot 1, 1 \cdot 1, 1 \cdot (-1), (-1) \cdot 1, (-1)(-1)) = (1, 1, -1, -1, 1) = \chi_4.
\]
So \(\chi_2 \otimes \chi_3 \cong \chi_4\). More interestingly:

\[
\chi_5 \otimes \chi_2: (2 \cdot 1, (-2) \cdot 1, 0 \cdot 1, 0 \cdot (-1), 0 \cdot (-1)) = (2, -2, 0, 0, 0) = \chi_5.
\]
So \(\chi_5 \otimes \chi_2 \cong \chi_5\): tensoring the 2-dimensional irreducible with \(\chi_2\) leaves it unchanged! This is the \(D_4\) analogue of the \(S_3\) result \(V_\mathrm{std} \otimes V_\mathrm{sgn} \cong V_\mathrm{std}\).

And \(\chi_5 \otimes \chi_5\):

\[
(4, 4, 0, 0, 0).
\]
Decomposing: \(\langle (4,4,0,0,0), \chi_i \rangle\) for each \(i\). The sizes are 1, 1, 2, 2, 2, so the inner product is \(\frac{1}{8}\) times the weighted sum. For \(\chi_1\): \(\frac{1}{8}(4 + 4) = 1\). For \(\chi_2\): \(\frac{1}{8}(4 + 4) = 1\). For \(\chi_3\): \(\frac{1}{8}(4 + 4) = 1\). For \(\chi_4\): \(\frac{1}{8}(4 + 4) = 1\). For \(\chi_5\): \(\frac{1}{8}(8 - 8) = 0\). So \(\chi_5 \otimes \chi_5 \cong \chi_1 \oplus \chi_2 \oplus \chi_3 \oplus \chi_4\). Dimension check: \(4 = 1 + 1 + 1 + 1\). ✓

## Restriction and Induction: Detailed Examples

### Restricting from \(D_4\) to \(C_4\)

The rotation subgroup \(C_4 = \langle r \rangle \cong C_4\) is a normal subgroup of \(D_4\) of index 2. The irreducible representations of \(C_4\) over \(\mathbb{C}\) are \(\psi_k : r^j \mapsto i^{jk}\) for \(k = 0, 1, 2, 3\) (where \(i = e^{2\pi i/4}\)).

What are the restrictions of \(D_4\)-irreducibles to \(C_4\)?

For the one-dimensional reps: \(\mathrm{Res}_{C_4}^{D_4}(\chi_j)\) is a 1-dimensional rep of \(C_4\) determined by \(\chi_j(r)\). From the table: \(\chi_1(r) = 1\), \(\chi_2(r) = 1\), \(\chi_3(r) = -1\), \(\chi_4(r) = -1\). So \(\chi_1\!\downarrow = \chi_2\!\downarrow = \psi_0\) (trivial) and \(\chi_3\!\downarrow = \chi_4\!\downarrow = \psi_2\) (the order-2 character, since \(\psi_2(r) = -1\)).

For the 2-dimensional rep: \(\chi_5\!\downarrow\) has character values at \(e, r, r^2, r^3\) given by \(2, 0, -2, 0\) (from columns \(C_1, C_3, C_2, C_3\) of the \(D_4\) table). The character of \(\psi_k\) at these elements is \(1, i^k, -1, i^{3k}\). By inner product:

\[
\langle \chi_5\!\downarrow, \psi_1 \rangle_{C_4} = \tfrac{1}{4}(2 \cdot 1 + 0 \cdot \bar i + (-2)(-1) + 0 \cdot \bar{i}^3) = \tfrac{1}{4}(2 + 2) = 1.
\]
Similarly \(\langle \chi_5\!\downarrow, \psi_3 \rangle_{C_4} = 1\). And \(\langle \chi_5\!\downarrow, \psi_0\rangle = \frac{1}{4}(2+0-2+0) = 0\), \(\langle \chi_5\!\downarrow, \psi_2\rangle = \frac{1}{4}(2+0-2+0) = 0\). So \(\chi_5\!\downarrow \cong \psi_1 \oplus \psi_3\).

By Frobenius reciprocity, \(\mathrm{mult}(\chi_5, \psi_1\!\uparrow) = \mathrm{mult}(\psi_1, \chi_5\!\downarrow) = 1\). So \(\chi_5\) appears in \(\psi_1\!\uparrow\). Since \(\dim(\psi_1\!\uparrow) = [D_4:C_4] \cdot 1 = 2 = \dim\chi_5\), we have \(\psi_1\!\uparrow \cong \chi_5\)! The 2-dimensional irreducible of \(D_4\) is the induced representation of the primitive 4th-root-of-unity character of \(C_4\).

### The Regular Representation of \(D_4\) Decomposed

By the isotypic decomposition theorem:

\[
\mathbb{C}D_4 \cong \chi_1^{\oplus 1} \oplus \chi_2^{\oplus 1} \oplus \chi_3^{\oplus 1} \oplus \chi_4^{\oplus 1} \oplus \chi_5^{\oplus 2}.
\]
Dimension check: \(1 + 1 + 1 + 1 + 4 = 8 = |D_4|\). ✓

This can be verified using the character of the regular representation: \(\chi_\mathrm{reg}(e) = 8\), \(\chi_\mathrm{reg}(g) = 0\) for \(g \neq e\). The multiplicity of \(\chi_5\) is \(\langle \chi_5, \chi_\mathrm{reg}\rangle = \frac{1}{8}(2 \cdot 8) = 2\). ✓

The Artin-Wedderburn decomposition is:

\[
\mathbb{C}D_4 \cong \mathbb{C} \times \mathbb{C} \times \mathbb{C} \times \mathbb{C} \times M_2(\mathbb{C}).
\]
Dimension check: \(1 + 1 + 1 + 1 + 4 = 8\). ✓

## Character Theory Applied to Group Structure: More Examples

### Detecting Simplicity

A finite group \(G\) is **simple** if its only normal subgroups are \(\{e\}\) and \(G\). Since normal subgroups correspond to intersections of kernels of characters, \(G\) is simple if and only if no proper subset of conjugacy classes (other than just \(\{e\}\)) forms a union that is the kernel of some character.

Equivalently, \(G\) is simple if and only if every irreducible character other than the trivial character has trivial kernel.

<div class="example">
<strong>Example (\(A_5\) is simple via characters).</strong> From the character table of \(A_5\), the kernels of the five irreducible characters are: \(\ker\chi_0 = A_5\) (trivial rep has full kernel); \(\ker\chi_1\) consists of elements where \(\chi_1(g) = 3 = \chi_1(e)\) — scanning the table, this only occurs at \(g = e\), so \(\ker\chi_1 = \{e\}\). Similarly, all the other non-trivial characters have trivial kernel. Therefore \(A_5\) is simple.

This argument does not use any structural properties of \(A_5\) — just the numerical data in its character table. It is a remarkable fact that simplicity (a structural property) is detectable from the purely numerical character table.
</div>

### The Class Equation via Characters

The **class equation** \(|G| = |Z(G)| + \sum_{[g] : |[g]| > 1} |G|/|C_G(g)|\) can be reformulated using character theory. The size of the centralizer \(|C_G(g)|\) is recoverable from the character table via the second orthogonality relation:

\[
|C_G(g)| = \sum_{i=1}^r |\chi_i(g)|^2.
\]
This is because the second orthogonality relation gives \(\sum_i |\chi_i(g)|^2 = |G|/|C_G(g)| \cdot |C_G(g)| = |C_G(g)|\)... wait, let me be careful. The second orthogonality says \(\sum_i \chi_i(g)\overline{\chi_i(h)} = |C_G(g)| \delta_{[g],[h]}\). Setting \(g = h\): \(\sum_i |\chi_i(g)|^2 = |C_G(g)|\). So the centralizer size is the sum of squares of character values in a column of the character table!

<div class="example">
<strong>Example (Centralizer sizes in \(S_3\)).</strong> For \(g = (12) \in S_3\):

\[
\sum_i |\chi_i((12))|^2 = 1^2 + (-1)^2 + 0^2 = 2 = |C_{S_3}((12))|.
\]
Indeed, \(C_{S_3}((12)) = \{e, (12)\}\) has order 2. ✓ For \(g = (123)\):

\[
\sum_i |\chi_i((123))|^2 = 1^2 + 1^2 + (-1)^2 = 3 = |C_{S_3}((123))|.
\]
Indeed \(C_{S_3}((123)) = \langle (123) \rangle = \{e, (123), (132)\}\) has order 3. ✓
</div>

## The Induced Character Formula in Detail

We state and carefully prove the formula for the character of an induced representation, as it is used constantly in computations.

<div class="theorem">
<strong>Theorem (Induced Character Formula).</strong> Let \(H \leq G\), \(W\) an \(\mathbb{C}H\)-module. For \(g \in G\):

\[
\chi_{\mathrm{Ind}_H^G W}(g) = \frac{1}{|H|} \sum_{\substack{x \in G \\ x^{-1}gx \in H}} \chi_W(x^{-1}gx).
\]
</div>

<div class="proof">
<strong>Proof.</strong> Choose coset representatives \(\{t_1, \ldots, t_k\}\) for \(H \backslash G\). As a vector space, \(\mathrm{Ind}_H^G(W) = \bigoplus_{i=1}^k t_i \otimes W\). Fix \(g \in G\). The element \(g\) acts on \(\mathrm{Ind}_H^G(W)\) by:

\[
g \cdot (t_i \otimes w) = t_j \otimes (h_i w), \quad \text{where } g t_i = t_j h_i, \text{ i.e., } h_i = t_j^{-1} g t_i \in H.
\]
This action permutes the "coset slots" (the index \(i \to j\)) and acts by \(h_i\) within the \(j\)-th slot. To compute the trace, we need to sum over the diagonal contributions, i.e., the coset slots that are fixed by the permutation \(i \mapsto j\): this happens when \(j = i\), i.e., when \(g t_i = t_i h_i\), i.e., when \(t_i^{-1} g t_i = h_i \in H\).

For such \(i\), the contribution to the trace from the \(i\)-th slot is \(\mathrm{tr}(\rho_W(h_i)) = \chi_W(t_i^{-1} g t_i)\). Thus:

\[
\chi_{\mathrm{Ind}_H^G W}(g) = \sum_{\substack{i=1 \\ t_i^{-1} g t_i \in H}}^k \chi_W(t_i^{-1} g t_i).
\]
This is the coset-representative version of the formula. To obtain the sum-over-\(G\) version, note that for each coset representative \(t_i\), all elements \(t_i h\) (for \(h \in H\)) are in the same coset, and \((t_i h)^{-1} g (t_i h) = h^{-1}(t_i^{-1} g t_i) h\). Since \(\chi_W\) is a class function on \(H\), \(\chi_W(h^{-1}(t_i^{-1}g t_i)h) = \chi_W(t_i^{-1}g t_i)\) whenever \(t_i^{-1}g t_i \in H\). So we can replace the sum over coset representatives by a sum over all of \(G\), dividing by \(|H|\):

\[
\chi_{\mathrm{Ind}_H^G W}(g) = \frac{1}{|H|}\sum_{\substack{x \in G \\ x^{-1}gx \in H}} \chi_W(x^{-1}gx). \qquad \square
\]
</div>

<div class="remark">
<strong>Remark (Induced character vanishes off \(H\)-conjugates).</strong> The formula immediately shows: if the conjugacy class of \(g\) in \(G\) does not intersect \(H\), then the sum is empty and \(\chi_{\mathrm{Ind}_H^G W}(g) = 0\). This is a powerful vanishing result. For instance, inducing any character of a proper subgroup \(H\) to \(G\) gives zero at all elements of \(G\) whose conjugacy class misses \(H\).
</div>

## The Tensor Product and Frobenius Reciprocity Together

Here is a worked example that uses both the tensor product of characters and Frobenius reciprocity simultaneously.

<div class="example">
<strong>Example (Decomposing \(\mathrm{Ind}_{C_3}^{S_3}(\phi_1) \otimes V_\mathrm{sgn}\)).</strong> We know \(\mathrm{Ind}_{C_3}^{S_3}(\phi_1) \cong V_\mathrm{std}\) (proved in Chapter 14). So:

\[
\mathrm{Ind}_{C_3}^{S_3}(\phi_1) \otimes V_\mathrm{sgn} \cong V_\mathrm{std} \otimes V_\mathrm{sgn} \cong V_\mathrm{std},
\]
since we computed earlier that \(V_\mathrm{std} \otimes V_\mathrm{sgn} \cong V_\mathrm{std}\) for \(S_3\).

Now let us verify this via the "induction and twisting" formula. There is a general identity:

\[
\mathrm{Ind}_H^G(W) \otimes V \cong \mathrm{Ind}_H^G(W \otimes \mathrm{Res}_H^G(V)).
\]
This is called the <strong>projection formula</strong> (or tensor identity). Applying it:

\[
\mathrm{Ind}_{C_3}^{S_3}(\phi_1) \otimes V_\mathrm{sgn} \cong \mathrm{Ind}_{C_3}^{S_3}(\phi_1 \otimes \mathrm{Res}_{C_3}^{S_3}(V_\mathrm{sgn})).
\]
The restriction \(\mathrm{Res}_{C_3}^{S_3}(V_\mathrm{sgn})\): since all elements of \(C_3 = A_3 \leq A_3\) are even permutations, \(V_\mathrm{sgn}\) restricts to the trivial representation on \(C_3\). So \(\phi_1 \otimes \mathrm{Res}_{C_3}^{S_3}(V_\mathrm{sgn}) = \phi_1 \otimes \mathbf{1} = \phi_1\). Therefore:

\[
\mathrm{Ind}_{C_3}^{S_3}(\phi_1) \otimes V_\mathrm{sgn} \cong \mathrm{Ind}_{C_3}^{S_3}(\phi_1) \cong V_\mathrm{std}. \checkmark
\]
The projection formula is a very efficient computational tool when combined with Frobenius reciprocity.
</div>

# Chapter 17: Representation Theory and Number Theory

## Characters and Dirichlet \(L\)-functions

One of the most beautiful applications of representation theory is the proof of Dirichlet's theorem on primes in arithmetic progressions. Let us explain the connection.

**Dirichlet's Theorem.** For any \(a, n\) with \(\gcd(a, n) = 1\), there are infinitely many primes \(p \equiv a \pmod{n}\).

The proof uses **Dirichlet characters**: group homomorphisms \(\chi : (\mathbb{Z}/n\mathbb{Z})^\times \to \mathbb{C}^\times\). These are exactly the one-dimensional complex representations of the group \((\mathbb{Z}/n\mathbb{Z})^\times\).

By the structure theorem, \((\mathbb{Z}/n\mathbb{Z})^\times\) is a finite abelian group of order \(\phi(n)\), and by the theory we have developed, it has exactly \(\phi(n)\) irreducible representations, all one-dimensional. The corresponding **Dirichlet \(L\)-functions** are defined by:

\[
L(s, \chi) = \sum_{n=1}^\infty \frac{\chi(n)}{n^s} = \prod_p \frac{1}{1 - \chi(p)p^{-s}},
\]
where the product is over primes and \(\chi(n)\) is extended to all positive integers by setting \(\chi(n) = 0\) if \(\gcd(n, N) > 1\).

The key orthogonality relation for characters of \((\mathbb{Z}/n\mathbb{Z})^\times\):

\[
\frac{1}{\phi(n)} \sum_{\chi} \chi(a^{-1})\chi(p) = \begin{cases} 1 & \text{if } p \equiv a \pmod{n} \\ 0 & \text{otherwise} \end{cases}
\]
is precisely the character orthogonality for abelian groups, applied to detect the arithmetic progression \(p \equiv a \pmod{n}\). The proof of Dirichlet's theorem then reduces to showing that each \(L(1, \chi) \neq 0\) for non-trivial \(\chi\) — a non-vanishing result at the boundary of the region of convergence.

Thus Dirichlet's theorem is, at its heart, a result about the representation theory of the abelian group \((\mathbb{Z}/n\mathbb{Z})^\times\). The "Fourier analysis" on this group (decomposing functions into irreducible components indexed by characters) is the mechanism by which the arithmetic information is extracted.

## Gauss Sums and Character Theory

A **Gauss sum** associated to a Dirichlet character \(\chi \pmod{n}\) is:

\[
\tau(\chi) = \sum_{a=0}^{n-1} \chi(a) e^{2\pi i a/n}.
\]
These sums are fundamental in analytic number theory and appear in the functional equation for \(L(s, \chi)\).

From the representation-theoretic viewpoint, the Gauss sum is an intertwining operator. The key identity:

\[
|\tau(\chi)|^2 = \begin{cases} n & \text{if } \chi \text{ is primitive} \\ 0 & \text{if } \chi \text{ is imprimitive} \end{cases}
\]
is a consequence of the character orthogonality relations for the group \(\mathbb{Z}/n\mathbb{Z}\).

More explicitly, for the quadratic character \(\chi = \left(\frac{\cdot}{p}\right)\) (the Legendre symbol) modulo a prime \(p\):

\[
\tau(\chi)^2 = (-1)^{(p-1)/2} p = \begin{cases} p & \text{if } p \equiv 1 \pmod{4} \\ -p & \text{if } p \equiv 3 \pmod{4}. \end{cases}
\]
This is Gauss's famous theorem on quadratic Gauss sums, and the proof is essentially an exercise in character orthogonality.

## Artin \(L\)-functions and the Nonabelian Case

The abelian case (Dirichlet characters = 1-dim reps of \((\mathbb{Z}/n\mathbb{Z})^\times\)) generalizes beautifully to the nonabelian case. Given a finite Galois extension \(K/\mathbb{Q}\) with group \(G = \mathrm{Gal}(K/\mathbb{Q})\) and an irreducible representation \(\rho : G \to \mathrm{GL}(V)\), E. Artin (1923) defined the **Artin \(L\)-function**:

\[
L(s, \rho) = \prod_p \det\left(I - \rho(\mathrm{Frob}_p) p^{-s}\right)^{-1},
\]
where \(\mathrm{Frob}_p\) is the Frobenius element at a prime \(p\). The key properties:
- If \(\rho = \mathbf{1}\) is trivial, \(L(s, \mathbf{1}) = \zeta(s)\) is the Riemann zeta function.
- If \(G\) is abelian and \(\rho\) is one-dimensional, \(L(s, \rho)\) is a Dirichlet \(L\)-function.
- For any two representations \(\rho_1, \rho_2\): \(L(s, \rho_1 \oplus \rho_2) = L(s, \rho_1) L(s, \rho_2)\).
- **Artin's conjecture** (largely open): \(L(s, \rho)\) extends to an entire function for any nontrivial irreducible \(\rho\).

The character theory of finite groups is thus literally built into the theory of Artin \(L\)-functions: the way representations decompose (additivity of \(L\)-functions under direct sums) is the \(L\)-function manifestation of character additivity. The Frobenius reciprocity of induced representations corresponds to an identity for induced Artin \(L\)-functions:

\[
L(s, \mathrm{Ind}_H^G \rho) = L(s, \rho|_{G_K}),
\]
which is Artin's induction theorem. This connects the representation theory of \(G\) to the arithmetic of the field extension.

# Chapter 18: Schur-Weyl Duality

## Setup and Statement

Schur-Weyl duality is one of the most striking applications of representation theory and connects the representation theories of \(GL_n\) and \(S_d\) in a tight, mutually determining way.

Let \(V = \mathbb{C}^n\) be the standard representation of \(GL_n(\mathbb{C})\). The tensor power \(V^{\otimes d} = V \otimes \cdots \otimes V\) (\(d\) times) carries two commuting actions:
- \(GL_n(\mathbb{C})\) acts diagonally: \(g \cdot (v_1 \otimes \cdots \otimes v_d) = gv_1 \otimes \cdots \otimes gv_d\).
- \(S_d\) acts by permuting factors: \(\sigma \cdot (v_1 \otimes \cdots \otimes v_d) = v_{\sigma^{-1}(1)} \otimes \cdots \otimes v_{\sigma^{-1}(d)}\).

These two actions commute: \(g \sigma v = \sigma g v\) for \(g \in GL_n\), \(\sigma \in S_d\). Define:
- \(A = \mathbb{C}[GL_n]\)-endomorphisms of \(V^{\otimes d}\) = image of the \(GL_n\) action in \(\mathrm{End}(V^{\otimes d})\).
- \(B = \mathbb{C}[S_d]\)-endomorphisms = image of the \(S_d\) action.

<div class="theorem">
<strong>Theorem (Schur-Weyl Duality).</strong> The images \(A\) and \(B\) are each other's centralizers in \(\mathrm{End}(V^{\otimes d})\): \(A = \mathrm{End}_{S_d}(V^{\otimes d})\) and \(B = \mathrm{End}_{GL_n}(V^{\otimes d})\). As a consequence, there is a multiplicity-free decomposition:

\[
V^{\otimes d} \cong \bigoplus_{\lambda} S^\lambda \otimes W^\lambda,
\]
where the sum is over all partitions \(\lambda \vdash d\) with at most \(n\) parts, \(S^\lambda\) is the Specht module (irreducible \(S_d\)-module), and \(W^\lambda\) is the corresponding irreducible \(GL_n\)-module (called a <strong>Weyl module</strong> or <strong>Schur functor</strong>).
</div>

The key word is "multiplicity-free": each irreducible of \(S_d\) (occurring at all) appears with multiplicity exactly 1, and the corresponding \(GL_n\)-module is the "partner" \(W^\lambda\). The two representation theories are linked in a perfect duality: knowing which \(S^\lambda\) appear determines which \(W^\lambda\) appear, and vice versa.

## Consequences

**For \(GL_n\)-representation theory.** The irreducible polynomial representations of \(GL_n(\mathbb{C})\) in degree \(d\) are precisely the \(W^\lambda\) for \(\lambda \vdash d\) with at most \(n\) rows. Their characters are the **Schur polynomials** \(s_\lambda(x_1, \ldots, x_n)\) — the most important basis for the ring of symmetric functions.

**For symmetric function theory.** The ring of symmetric functions \(\Lambda = \mathbb{Z}[x_1, x_2, \ldots]^{S_\infty}\) has several natural bases (monomial, elementary, complete, power sum, Schur). Schur-Weyl duality gives a representation-theoretic interpretation of all these bases and the relations between them.

**For combinatorics.** The dimension of \(W^\lambda\) (for \(GL_n\) acting on degree-\(d\) part of \(\mathbb{C}^n\)) is the number of semistandard Young tableaux of shape \(\lambda\) with entries in \(\{1, \ldots, n\}\) — a formula known as the **hook-content formula**. Combined with the hook length formula for \(\dim S^\lambda\), Schur-Weyl duality gives deep combinatorial identities.

<div class="example">
<strong>Example (\(V^{\otimes 2}\) for \(GL_n\)).</strong> For \(d = 2\), the partitions are \((2)\) and \((1,1)\). We have:

\[
V^{\otimes 2} \cong \mathrm{Sym}^2(V) \oplus \mathrm{Alt}^2(V),
\]
with \(\mathrm{Sym}^2(V) \cong S^{(2)} \otimes W^{(2)}\) and \(\mathrm{Alt}^2(V) \cong S^{(1,1)} \otimes W^{(1,1)}\). Here \(S^{(2)}\) is the trivial \(S_2\)-rep (dimension 1) and \(S^{(1,1)}\) is the sign \(S_2\)-rep (dimension 1). The \(GL_n\)-modules are the symmetric square \(W^{(2)} = \mathrm{Sym}^2(V)\) and the exterior square \(W^{(1,1)} = \wedge^2(V)\). Dimensions: \(\dim \mathrm{Sym}^2(V) = \binom{n+1}{2}\) and \(\dim \wedge^2(V) = \binom{n}{2}\). Check: \(\binom{n+1}{2} + \binom{n}{2} = n^2 = \dim V^{\otimes 2}\). ✓
</div>

# Chapter 19: Further Directions

## Modular Representation Theory

When the characteristic of the field \(F\) divides \(|G|\), Maschke's theorem fails and the theory becomes much richer and more complicated. This is **modular representation theory**, developed by Richard Brauer.

The key new features:
- **Brauer characters**: Analogues of ordinary characters, defined using a lift from characteristic \(p\) to characteristic 0 via the ring of Witt vectors.
- **Decomposition matrix**: The matrix \(D\) with \(D_{\chi, \phi}\) = multiplicity of the modular irreducible \(\phi\) as a composition factor of the reduction mod \(p\) of the ordinary irreducible \(\chi\).
- **Blocks**: The indecomposable two-sided ideals of \(FG\). Each block is associated to a conjugacy class of \(p\)-subgroups (its **defect groups**).
- **Projective indecomposable modules (PIMs)**: The indecomposable direct summands of \(FG\) as a left \(FG\)-module. These replace the simple summands of Artin-Wedderburn.

<div class="example">
<strong>Example (Modular reps of \(S_3\) in characteristic 3).</strong> Over \(\mathbb{F}_3\), the group \(S_3\) has order 6 = 2 \cdot 3, so \(3 \mid |S_3|\). The modular irreducibles are the irreducibles over \(\mathbb{F}_3\) (not over \(\mathbb{C}\)). Since \(S_3^{\mathrm{ab}} = C_2\), there are 2 one-dimensional representations over \(\mathbb{F}_3\): trivial and sign. These remain irreducible (dimension 1, trivially). The standard representation \(V_\mathrm{std}\) (2-dimensional over \(\mathbb{C}\)) reduces mod 3 to a 2-dimensional \(\mathbb{F}_3 S_3\)-module, which is still irreducible (one can check). So there are 3 modular irreducibles... but the number of irreducibles in characteristic \(p\) equals the number of \(p\)-regular conjugacy classes (classes whose elements have order coprime to \(p\)). In \(S_3\), the conjugacy classes have representatives \(e\), \((12)\), \((123)\) of orders 1, 2, 3. The 3-regular classes (order coprime to 3) are those of \(e\) and \((12)\). So there are exactly <strong>2</strong> modular irreducibles over \(\mathbb{F}_3\), not 3.

The discrepancy: the standard 2-dimensional complex rep \(V_\mathrm{std}\) reduces mod 3 to an irreducible \(\mathbb{F}_3\)-module, and so does the sign rep. The trivial rep also reduces to an irreducible. But there are 3 ordinary irreducibles and only 2 modular ones — the decomposition matrix \(D\) encodes how ordinary irreducibles break up into modular composition factors.
</div>

## The McKay Correspondence

A deep and mysterious connection between representation theory and geometry is the **McKay correspondence**, discovered by John McKay in 1980.

Let \(\Gamma \leq SU(2)\) be a finite subgroup. By the classification, these are cyclic groups \(C_n\), dihedral groups \(D_n\), and the exceptional groups corresponding to the tetrahedron (\(A_4\)), octahedron/cube (\(S_4\)), and icosahedron/dodecahedron (\(A_5\)).

The **McKay graph** of \(\Gamma\) is defined as follows: vertices are the irreducible representations \(\{V_0, V_1, \ldots, V_r\}\) of \(\Gamma\) (with \(V_0\) the trivial rep), and the number of edges from \(V_i\) to \(V_j\) equals the multiplicity of \(V_j\) in \(V \otimes V_i\), where \(V\) is the 2-dimensional representation of \(\Gamma\) coming from its inclusion in \(SU(2)\).

**McKay's Theorem:** The McKay graph of \(\Gamma\) is an affine Dynkin diagram of type \(\widetilde{A}_n\), \(\widetilde{D}_n\), \(\widetilde{E}_6\), \(\widetilde{E}_7\), or \(\widetilde{E}_8\) — exactly the same ADE classification as that of simple Lie algebras!

This is a striking "coincidence" with no elementary explanation: why should finite subgroups of \(SU(2)\) (classified by the ADE types via their McKay graphs) correspond to simple Lie algebras (also classified by ADE Dynkin diagrams)? The explanation ultimately lies in algebraic geometry (the minimal resolutions of \(\mathbb{C}^2/\Gamma\) are ADE surface singularities) and string theory (which provides a physical interpretation of the duality). But the McKay correspondence, discovered simply by computing McKay graphs of finite groups, is one of the most beautiful unexpected discoveries in representation theory.

## Representation Stability

A modern direction in representation theory is the notion of **representation stability**, introduced by Church, Ellenberg, and Farb around 2010.

The idea is that many natural sequences of representations \(V_n\) of \(S_n\) (or of other groups in a compatible family) stabilize in a precise sense as \(n \to \infty\). For instance, the cohomology groups \(H^k(\mathrm{Conf}_n(\mathbb{C}), \mathbb{Q})\) (configuration spaces of \(n\) distinct points in \(\mathbb{C}\)) are representations of \(S_n\), and they are representation-stable for large enough \(n\).

This notion of stability is formalized using the language of **FI-modules** (modules over the category FI of finite sets and injections), where an FI-module encodes a compatible system of representations of all symmetric groups simultaneously. The theory has applications to statistics, algebraic topology, and algebraic geometry.

## Geometric Representation Theory: A Glimpse

The most active frontier of modern representation theory is its interaction with geometry. A few highlights:

**Geometric Satake.** The irreducible representations of a reductive algebraic group \(G\) (like \(GL_n\), \(SO_n\), etc.) over \(\mathbb{C}\) are in natural bijection with the \(G^\vee\)-equivariant perverse sheaves on the affine Grassmannian \(\mathrm{Gr}_G\) (where \(G^\vee\) is the Langlands dual group). This is the **geometric Satake correspondence**.

**Categorification.** The irreducible representations of \(S_n\) (Specht modules \(S^\lambda\)) can be "categorified": one constructs a 2-category (a category of categories) whose Grothendieck group (the free abelian group on isomorphism classes of objects) recovers the usual representation ring. The morphisms in the 2-category then give extra structure invisible at the level of characters.

**Kazhdan-Lusztig theory.** For Hecke algebras (deformations of group algebras of Weyl groups), the representation theory involves mysterious polynomials \(P_{y,w}(q)\) (Kazhdan-Lusztig polynomials) whose coefficients count intersection cohomology of Schubert varieties. These polynomials are always non-negative — a fact that was conjectured on representation-theoretic grounds and proved geometrically.

The thread connecting all these developments is this: the linear-algebraic structures we have studied — characters, orthogonality, induction, modules — are the algebraic shadows of much richer geometric and categorical structures. Understanding those richer structures is one of the driving forces of contemporary mathematics.

---

*These notes cover the content of PMATH 445 at the University of Waterloo as taught by Faisal Al-Faisal, enriched with detailed worked examples, proofs, historical context, and connections to broader mathematics. The core theory (Maschke, Schur, orthogonality, Artin-Wedderburn, induction, Frobenius reciprocity) is developed with full proofs; the later chapters indicate the depth and breadth of the subject beyond the course.*

