---
title: "PMATH 347: Groups and Rings"
subjects: "PMATH"
prof: "William Slofstra"
---

*Based on lecture notes by Sibelius Peng — [PDF source](https://pdf.sibeliusp.com/1205/pm347.pdf)*

## Sources and References

**Primary textbook** — Dummit, D. S. & Foote, R. M. *Abstract Algebra*, 3rd ed. Wiley, 2004.
**Supplementary texts** — Artin, M. *Algebra*, 2nd ed. Pearson, 2010. Herstein, I. N. *Topics in Algebra*, 2nd ed. Wiley, 1975. Lang, S. *Algebra*, revised 3rd ed. Springer, 2002.
**Online resources** — MIT OCW 18.703 *Modern Algebra* (lecture notes and problem sets); Harvard Math 122 *Groups and Rings* (lecture notes, Elkies); Benedict Gross's Harvard abstract algebra lecture series (freely available on YouTube).

---

# Part I: Group Theory

# Chapter 1: The Algebra of Operations

## Why Abstraction?

Mathematics begins with numbers and ends — at its most foundational — with structure. The progression is visible in the undergraduate curriculum: from the arithmetic of integers to the algebra of polynomials to the linear algebra of vector spaces and matrices. Each step reveals that the same patterns recur across wildly different settings: you can add integers, add vectors, compose functions, and multiply matrices, and in each case the operation obeys the same rules. **Abstract algebra** is the project of extracting and studying these rules in isolation, independent of the particular objects they govern.

A **binary operation** on a set \(X\) is a function \(b \colon X \times X \to X\). The notation \(b(x,y)\) is usually replaced by an inline symbol: \(x + y\), \(x \cdot y\), \(x \circ y\), or simply \(xy\). What matters is that \(b\) is a function from pairs of elements of \(X\) back into \(X\) — closing the set under the operation. Addition is a binary operation on \(\mathbb{N}\), \(\mathbb{Z}\), \(\mathbb{Q}\), \(\mathbb{R}\), and \(\mathbb{C}\); subtraction is a binary operation on \(\mathbb{Z}\) but *not* on \(\mathbb{N}\) (since \(2 - 5 \notin \mathbb{N}\)); function composition is a binary operation on the set of all functions \(X \to X\).

Two properties of operations are of fundamental importance. An operation \(*\) is **associative** if \(a * (b * c) = (a * b) * c\) for all \(a, b, c \in X\), and **commutative** (or **abelian**) if \(a * b = b * a\) for all \(a, b \in X\). Subtraction and division fail both. Matrix multiplication fails commutativity but retains associativity. Function composition is associative but generally not commutative. This simple observation motivates the central division of the first half of the course: group theory studies associative operations (not necessarily commutative), while abelian group theory — and the ring theory of the second half — adds commutativity.

## Groups

A **group** is a pair \((G, \cdot)\) where \(G\) is a set and \(\cdot\) is an associative binary operation on \(G\) such that:
1. There exists an **identity element** \(e \in G\) with \(eg = ge = g\) for all \(g \in G$.
2. Every \(g \in G\) has an **inverse** \(g^{-1} \in G\) with \(gg^{-1} = g^{-1}g = e\).

Identities are unique (if \(e\) and \(e'\) are both identities, then \(e = e \cdot e' = e'\)) and inverses are unique given associativity (the proof is a two-line manipulation using left and right inverses). The order \(|G|\) of a group is the cardinality of the underlying set; infinite groups have \(|G| = \infty\). A group is **abelian** if the operation is also commutative.

The examples are immediate: \((\mathbb{Z}, +)\), \((\mathbb{Q}, +)\), \((\mathbb{R}, +)\), \((\mathbb{C}, +)\) are infinite abelian groups; \((\mathbb{Z}/n\mathbb{Z}, +)\) is a finite abelian group of order \(n\); \((\mathbb{Q}^\times, \cdot)\) is infinite abelian; any vector space under addition is an abelian group. The first genuinely non-abelian example is the **general linear group** \(GL_n(K)\) of invertible \(n \times n\) matrices over a field \(K\) for \(n \geq 2\).

The **order of an element** \(g \in G\) is \(|g| = \min\{k \geq 1 : g^k = e\}\) if such a \(k\) exists, and \(+\infty\) otherwise. The order of the identity is 1; the order of any non-identity element in \(\mathbb{Z}/n\mathbb{Z}\) divides \(n\) (as Lagrange's theorem will soon explain).

## Dihedral Groups

The **dihedral group** \(D_{2n}\) is the group of symmetries of a regular \(n\)-gon — the set of all invertible linear transformations \(T \in GL_2(\mathbb{R})\) that map the polygon to itself, with group operation being composition. Setting the vertices at \(v_k = e^{2\pi ik/n} = (\cos(2\pi k/n), \sin(2\pi k/n))\), the symmetries consist of \(n\) rotations and \(n\) reflections.

Let \(s\) be rotation by \(2\pi/n\) radians (so \(s^n = e\), \(|s| = n\)) and let \(r\) be reflection through the \(x\)-axis (so \(r^2 = e\), \(|r| = 2\)). A key calculation shows:

\[
rs = s^{-1}r, \quad \text{equivalently} \quad sr = rs^{-1}.
\]

These two generators with these three relations — \(s^n = e\), \(r^2 = e\), and \(rs = s^{-1}r\) — completely determine \(D_{2n}\). The group has \(|D_{2n}| = 2n\) elements: \(\{s^i r^j : 0 \leq i < n, 0 \leq j < 2\}\). For \(n \geq 3\), the relation \(rs \neq sr\) makes \(D_{2n}\) non-abelian. This is the first incarnation of a theme that runs through all of group theory: understanding a group through its generators and relations.

## Permutation Groups

The **symmetric group** \(S_n\) is the group of all bijections \(\pi \colon \{1, \ldots, n\} \to \{1, \ldots, n\}\) under composition. Since there are \(n!\) such bijections, \(|S_n| = n!\). For \(n \geq 3\), \(S_n\) is non-abelian — for instance, \((12)(23) = (123)\) but \((23)(12) = (132)\).

Permutations are most conveniently written in **disjoint cycle notation**: the permutation \(\pi(1) = 6, \pi(2) = 5, \pi(3) = 1, \pi(4) = 4, \pi(5) = 2, \pi(6) = 3\) is written \((163)(25)\), with fixed points dropped. A **\(k\)-cycle** is a permutation that cyclically permutes \(k\) elements and fixes all others. Every permutation factors uniquely (up to order) as a product of disjoint cycles, and disjoint cycles commute. Inverses are obtained by reversing each cycle: \((163)^{-1} = (361)\).

---

# Chapter 2: Subgroups and Cyclic Groups

## Subgroups

A subset \(H \subseteq G\) is a **subgroup** of \(G\) (written \(H \leq G\)) if it is closed under the group operation and under taking inverses, and contains the identity. Equivalently (and more compactly): \(H\) is a non-empty subset of \(G\) satisfying \(gh^{-1} \in H\) for all \(g, h \in H\). For finite subsets, closure under the operation alone suffices: if \(H\) is finite, non-empty, and closed under multiplication, it is already a subgroup.

Every group has at least two subgroups: the **trivial subgroup** \(\{e\}\) and the group \(G\) itself. A subgroup is **proper** if it is neither of these extremes. The intersection of any collection of subgroups is again a subgroup — this allows one to define the **subgroup generated by** a set \(S\):

\[
\langle S \rangle = \bigcap_{\substack{S \subseteq H \leq G}} H,
\]

the smallest subgroup of \(G\) containing \(S\). Concretely, \(\langle S \rangle\) consists of all finite products of elements of \(S\) and their inverses.

## Cyclic Groups

A group \(G\) is **cyclic** if \(G = \langle g \rangle\) for some single element \(g\), called a **generator**. The infinite cyclic group is \(\mathbb{Z} = \langle 1 \rangle\) under addition; the finite cyclic group of order \(n\) is \(\mathbb{Z}/n\mathbb{Z} = \langle 1 \rangle\) under modular addition.

The subgroups of \(\mathbb{Z}\) are exactly the sets \(m\mathbb{Z} = \{mk : k \in \mathbb{Z}\}\) for \(m \geq 0\). The subgroups of \(\mathbb{Z}/n\mathbb{Z}\) are in bijection with the divisors of \(n\): for each \(d \mid n\), there is a unique subgroup of order \(d\), generated by \(n/d\). This classifies all subgroups of finite cyclic groups completely.

---

# Chapter 3: Homomorphisms and the Isomorphism Theorems

## Homomorphisms

A **group homomorphism** from \((G, \cdot)\) to \((H, *)\) is a function \(\phi \colon G \to H\) that respects the group operations: \(\phi(g_1 \cdot g_2) = \phi(g_1) * \phi(g_2)\) for all \(g_1, g_2 \in G\). A homomorphism automatically satisfies \(\phi(e_G) = e_H\) and \(\phi(g^{-1}) = \phi(g)^{-1}\).

Two subsets of particular importance are the **kernel** \(\ker\phi = \{g \in G : \phi(g) = e_H\}\) and the **image** \(\mathrm{Im}\,\phi = \phi(G)\). Both are subgroups (kernel of \(G\), image of \(H\)), but the kernel has an additional property: it is **normal** in \(G\), meaning \(gKg^{-1} \subseteq K\) for all \(g \in G$.

An **isomorphism** is a bijective homomorphism (equivalently, a homomorphism with a two-sided inverse). Groups \(G\) and \(H\) are **isomorphic** (written \(G \cong H\)) if an isomorphism between them exists. Isomorphic groups are, for all structural purposes, the same group with relabeled elements. The classification of groups up to isomorphism is the central project of group theory.

## Cosets and Lagrange's Theorem

Let \(H \leq G\). The **left cosets** of \(H\) in \(G\) are the sets \(gH = \{gh : h \in H\}\) for \(g \in G\). The left cosets partition \(G\): any two cosets are either equal or disjoint, and every element of \(G\) belongs to exactly one. Since each coset has the same cardinality as \(H\), the index \([G:H]\) (the number of distinct cosets) satisfies \(|G| = [G:H] \cdot |H|\).

<div class="theorem">
<strong>Lagrange's Theorem:</strong> If \(H\) is a subgroup of a finite group \(G\), then \(|H|\) divides \(|G|\), and \([G:H] = |G|/|H|\).
</div>

The consequences are immediate and powerful. Every element of a finite group has order dividing \(|G|\); if \(|G| = p\) is prime, then \(G\) has no proper non-trivial subgroups and must be cyclic, isomorphic to \(\mathbb{Z}/p\mathbb{Z}\). Lagrange's theorem also implies **Fermat's little theorem**: for prime \(p\) and integer \(a\) with \(p \nmid a\), one has \(a^{p-1} \equiv 1 \pmod{p}\), since \(|(\mathbb{Z}/p\mathbb{Z})^\times| = p-1\).

## Normal Subgroups and Quotient Groups

A subgroup \(N \leq G\) is **normal** (written \(N \trianglelefteq G\)) if \(gN = Ng\) for all \(g \in G\) — equivalently, if \(gng^{-1} \in N\) for all \(g \in G\) and \(n \in N\). Normal subgroups are precisely those for which the set of left cosets \(G/N\) carries a well-defined group structure under \((gN)(hN) = (gh)N\). The resulting group is the **quotient group** \(G/N\).

Why normal? If \(N\) is not normal, the coset multiplication is not well-defined: choosing different representatives from the same coset can give different products. Normal subgroups are precisely the kernels of homomorphisms — every kernel is normal, and every normal subgroup is the kernel of the canonical quotient map \(\pi \colon G \to G/N,\; g \mapsto gN\).

Every subgroup of an abelian group is normal (since \(gN = Ng\) trivially). In non-abelian groups, finding normal subgroups is more subtle and connects to the structure of the group.

## The Isomorphism Theorems

Three fundamental theorems relate homomorphisms, quotients, and subgroups.

<div class="theorem">
<strong>First Isomorphism Theorem:</strong> If \(\phi \colon G \to H\) is a group homomorphism, then \(\ker\phi \trianglelefteq G\) and \(G/\ker\phi \cong \mathrm{Im}\,\phi\).
</div>

This is the workhorse of group theory: to understand a quotient \(G/N\), find a homomorphism with kernel \(N\). Conversely, any group \(H\) that is a "homomorphic image" of \(G\) is a quotient of \(G\) by some normal subgroup.

<div class="theorem">
<strong>Correspondence Theorem:</strong> Let \(N \trianglelefteq G\). There is an inclusion-preserving bijection between subgroups of \(G\) containing \(N\) and subgroups of \(G/N\), given by \(H \mapsto H/N\). Normal subgroups of \(G\) containing \(N\) correspond to normal subgroups of \(G/N\).
</div>

<div class="theorem">
<strong>Third Isomorphism Theorem:</strong> If \(N \trianglelefteq G\) and \(M \trianglelefteq G\) with \(N \leq M\), then \(M/N \trianglelefteq G/N\) and \((G/N)/(M/N) \cong G/M\).
</div>

These three theorems, together with the second isomorphism theorem (which relates intersections and products of subgroups), constitute the foundational structure theory. They will reappear in identical form for rings in Part II.

## Normalizers and the Center

The **normalizer** of a subgroup \(H\) in \(G\) is \(N_G(H) = \{g \in G : gH = Hg\}\) — the largest subgroup of \(G\) in which \(H\) is normal. The **center** \(Z(G) = \{z \in G : zg = gz \text{ for all } g \in G\}\) is the set of elements that commute with everything; it is always a normal abelian subgroup of \(G\). A group is abelian if and only if \(Z(G) = G\).

---

# Chapter 4: Products and Quotients

## Direct Products

If \(G_1\) and \(G_2\) are groups, the **direct product** \(G_1 \times G_2\) is the Cartesian product with componentwise multiplication. This is the simplest way to build larger groups from smaller ones. The fundamental theorem of finite abelian groups (Chapter 6 below) will show that every finite abelian group is a direct product of cyclic groups of prime-power order.

The condition for an **internal direct product** — when a group \(G\) can be written as a product of subgroups \(H_1, H_2 \leq G\) — requires: \(H_1 \cap H_2 = \{e\}\), \(H_1H_2 = G\), and \(H_1, H_2 \trianglelefteq G\). When these hold, \(G \cong H_1 \times H_2\). Internal direct products are a powerful tool for classifying groups by decomposing them into simpler pieces.

---

# Chapter 5: Group Actions

## The Orbit-Stabilizer Framework

A **group action** of \(G\) on a set \(X\) is a homomorphism \(\phi \colon G \to S_X\) (the group of bijections of \(X\)), or equivalently, a function \(G \times X \to X\), \((g, x) \mapsto g \cdot x\), satisfying \(e \cdot x = x\) and \((gh) \cdot x = g \cdot (h \cdot x)\). Group actions are the language for expressing symmetry concretely.

For a group action on \(X\), the **orbit** of \(x \in X\) is \(\mathcal{O}_x = \{g \cdot x : g \in G\}\) and the **stabilizer** of \(x\) is \(G_x = \{g \in G : g \cdot x = x\}$. Orbits partition \(X\); stabilizers are subgroups of \(G\).

<div class="theorem">
<strong>Orbit-Stabilizer Theorem:</strong> For any action of a finite group \(G\) on \(X\), and any \(x \in X\),
\[
|G| = |\mathcal{O}_x| \cdot |G_x|.
\]
</div>

This deceptively simple statement has far-reaching consequences. The bijection \(\mathcal{O}_x \cong G/G_x\) (given by \(g \cdot x \leftrightarrow gG_x\)) identifies orbits with cosets of stabilizers.

## Cayley's Theorem

Every group acts on itself by left multiplication: \(g \cdot h = gh\). This action is faithful (only the identity fixes every element), giving an injective homomorphism \(G \hookrightarrow S_G\).

<div class="theorem">
<strong>Cayley's Theorem:</strong> Every group \(G\) is isomorphic to a subgroup of a symmetric group. In particular, every finite group of order \(n\) embeds in \(S_n\).
</div>

Cayley's theorem says that permutation groups are universal — every abstract group "is" a permutation group. This justifies the special role of symmetric groups in the theory.

## Conjugation and the Class Equation

The **conjugation action** of \(G\) on itself sends \((g, x) \mapsto gxg^{-1}\). The orbits under this action are the **conjugacy classes**: elements \(x, y \in G\) are conjugate if \(y = gxg^{-1}\) for some \(g$. In an abelian group, every conjugacy class has size 1 (every element is its own class). The stabilizer of \(x\) under conjugation is the **centralizer** \(C_G(x) = \{g \in G : gx = xg\}\), and by the orbit-stabilizer theorem the size of the conjugacy class of \(x\) is \([G : C_G(x)]\).

Since conjugacy classes partition \(G\) and the center \(Z(G)\) consists precisely of the singleton conjugacy classes:

\[
|G| = |Z(G)| + \sum_{\text{non-central classes}} [G : C_G(x_i)].
\]

This is the **class equation**. For \(p\)-groups — groups of order \(p^k\) for some prime \(p\) — every term on the right is divisible by \(p\), so \(p \mid |Z(G)|\), hence \(|Z(G)| > 1\): every \(p\)-group has a non-trivial center. This is a key lemma in the classification of groups of small order.

---

# Chapter 6: Classification of Finite Groups

## Groups of Order \(pq\)

How many groups are there of order \(n\)? For \(n = p\) prime, there is exactly one: \(\mathbb{Z}/p\mathbb{Z}\). For \(n = p^2\), there are exactly two: \(\mathbb{Z}/p^2\mathbb{Z}\) and \(\mathbb{Z}/p\mathbb{Z} \times \mathbb{Z}/p\mathbb{Z}\). For \(n = pq\) with \(p < q\) primes, the answer depends on divisibility: if \(p \nmid (q-1)\), the only group is \(\mathbb{Z}/pq\mathbb{Z} \cong \mathbb{Z}/p\mathbb{Z} \times \mathbb{Z}/q\mathbb{Z}\); if \(p \mid (q-1)\), there are exactly two groups — the cyclic group and a non-abelian group. These results come from the Sylow theorems (closely related to the orbit-stabilizer machinery) and semidirect products.

## Classification of Finite Abelian Groups

The classification of finite abelian groups is one of the most satisfying results in algebra.

<div class="theorem">
<strong>Fundamental Theorem of Finite Abelian Groups:</strong> Every finite abelian group is isomorphic to a direct product of cyclic groups of prime-power order:
\[
G \cong \mathbb{Z}/p_1^{a_1}\mathbb{Z} \times \mathbb{Z}/p_2^{a_2}\mathbb{Z} \times \cdots \times \mathbb{Z}/p_k^{a_k}\mathbb{Z}.
\]
This decomposition is unique (up to reordering of factors).
</div>

The decomposition is unique: two finite abelian groups are isomorphic if and only if they have the same list of prime-power cyclic factors. For example, abelian groups of order 12 are: \(\mathbb{Z}/12\mathbb{Z} \cong \mathbb{Z}/4\mathbb{Z} \times \mathbb{Z}/3\mathbb{Z}\), and \(\mathbb{Z}/2\mathbb{Z} \times \mathbb{Z}/2\mathbb{Z} \times \mathbb{Z}/3\mathbb{Z}\). There are exactly two.

## Simple Groups

A group is **simple** if it has no normal subgroups other than \(\{e\}\) and \(G\) itself. Simple groups are the "atoms" of group theory — every finite group can be built from simple groups (via extensions), just as integers are built from primes. The classification of finite simple groups (CFSG) is one of the greatest achievements of 20th-century mathematics, completed around 2004 after work by hundreds of mathematicians spanning tens of thousands of pages. The main families of finite simple groups are: cyclic groups of prime order, alternating groups \(A_n\) for \(n \geq 5\), the groups of Lie type (analogues of Lie groups over finite fields), and 26 sporadic groups — including the Monster group of order approximately \(8 \times 10^{53}\).

## Semidirect Products and Free Groups

The **semidirect product** \(N \rtimes_\phi H\) generalizes the direct product by allowing a non-trivial action \(\phi \colon H \to \mathrm{Aut}(N)\). The underlying set is \(N \times H\), but the multiplication is twisted: \((n_1, h_1)(n_2, h_2) = (n_1 \cdot \phi(h_1)(n_2),\, h_1 h_2)\). Dihedral groups are semidirect products: \(D_{2n} \cong \mathbb{Z}/n\mathbb{Z} \rtimes \mathbb{Z}/2\mathbb{Z}\), where the non-trivial element of \(\mathbb{Z}/2\mathbb{Z}\) acts on \(\mathbb{Z}/n\mathbb{Z}\) by inversion \(k \mapsto -k\).

A **free group** \(F_S\) on a generating set \(S\) is the "most general" group generated by \(S\) — there are no relations among the generators other than those forced by the group axioms. Every group is a quotient of a free group: the **group presentation** \(\langle s_1, s_2, \ldots \mid r_1, r_2, \ldots \rangle\) specifies generators and a list of relations defining the quotient. The dihedral group has presentation \(\langle s, r \mid s^n, r^2, rsrs \rangle\).

---

# Part II: Ring Theory

# Chapter 7: Rings, Subrings, and Homomorphisms

## The Axioms of a Ring

Algebra with a single operation (groups) is powerful but limited — it cannot capture the interplay between addition and multiplication that makes \(\mathbb{Z}\), \(\mathbb{Q}\), and polynomial rings so useful. A **ring** is a triple \((R, +, \cdot)\) where \((R, +)\) is an abelian group (written additively), \(\cdot\) is an associative binary operation (multiplication), and the distributive laws hold: \(a(b + c) = ab + ac\) and \((a + b)c = ac + bc\). We write \(0\) for the additive identity and \(-a\) for the additive inverse of \(a\).

A ring need not have a multiplicative identity; when it does, the identity is denoted \(1\) and called the **unity** or \(1_R\). We will generally work with **unital rings** (having a unity). If multiplication is also commutative, the ring is a **commutative ring**; most rings in this course are commutative.

The integers \(\mathbb{Z}\), the rationals \(\mathbb{Q}\), the reals \(\mathbb{R}\), and the complexes \(\mathbb{C}\) are all commutative unital rings. The polynomial ring \(R[x]\) over any ring \(R\) is a ring; matrix rings \(M_n(R)\) are rings (non-commutative for \(n \geq 2\)). The integers modulo \(n\), written \(\mathbb{Z}/n\mathbb{Z}\), are a commutative ring — the unifying structure behind modular arithmetic.

## Fields, Units, and Zero Divisors

A **field** is a commutative unital ring where every non-zero element has a multiplicative inverse. Fields are rings in which division (by non-zero elements) is always possible: \(\mathbb{Q}\), \(\mathbb{R}\), \(\mathbb{C}\), and \(\mathbb{Z}/p\mathbb{Z}\) for prime \(p\) are all fields.

An element \(u \in R\) is a **unit** if it has a multiplicative inverse. The units of a ring form a group \(R^\times\) under multiplication; a field is precisely a commutative unital ring where every non-zero element is a unit (\(R^\times = R \setminus \{0\}\)). The units of \(\mathbb{Z}\) are \(\pm 1\); the units of \(\mathbb{Z}/n\mathbb{Z}\) are the residues coprime to \(n\), giving the group \((\mathbb{Z}/n\mathbb{Z})^\times\) of order \(\phi(n)\) (Euler's totient).

A **zero divisor** is a non-zero element \(a \in R\) for which \(ab = 0\) for some non-zero \(b\). In \(\mathbb{Z}/6\mathbb{Z}\), the element \(2\) is a zero divisor since \(2 \cdot 3 = 0\). Fields have no zero divisors. An **integral domain** is a commutative unital ring with no zero divisors — the setting where one can cancel: \(ab = ac\) and \(a \neq 0\) implies \(b = c\).

## Characteristic and Subrings

The **characteristic** of a ring \(R\) is the smallest positive integer \(n\) such that \(n \cdot 1 = 1 + 1 + \cdots + 1\) (\(n\) times) equals \(0\), or \(0\) if no such integer exists. The characteristic of \(\mathbb{Z}\) and \(\mathbb{Q}\) is \(0\); of \(\mathbb{Z}/n\mathbb{Z}\) is \(n\); of \(\mathbb{Z}/p\mathbb{Z}\) is the prime \(p\). If \(R\) is an integral domain, its characteristic is either \(0\) or prime. The **prime subring** of \(R\) is the smallest subring, generated by \(1_R\); it is isomorphic to \(\mathbb{Z}/n\mathbb{Z}\) when the characteristic is \(n\), and to \(\mathbb{Z}\) when the characteristic is \(0\).

## Ring Homomorphisms and Polynomials

A **ring homomorphism** \(\phi \colon R \to S\) is a function preserving both operations: \(\phi(a + b) = \phi(a) + \phi(b)\) and \(\phi(ab) = \phi(a)\phi(b)\), with \(\phi(1_R) = 1_S\) if both rings are unital. The kernel \(\ker\phi = \{a \in R : \phi(a) = 0\}\) is an **ideal** of \(R\) (a concept defined in the next chapter), and the image is a subring of \(S\).

The **polynomial ring** \(R[x]\) consists of all formal polynomials \(a_0 + a_1 x + \cdots + a_n x^n\) with coefficients in \(R\), added and multiplied in the usual way. The degree of a non-zero polynomial is the highest index with a non-zero coefficient; by convention, the zero polynomial has degree \(-\infty\). When \(R\) is an integral domain, \(\deg(fg) = \deg f + \deg g\), so \(R[x]\) is also an integral domain.

---

# Chapter 8: Ideals and Quotient Rings

## Ideals

An **ideal** of a ring \(R\) is a subset \(I \subseteq R\) satisfying: \(I\) is a subgroup of \((R, +)\), and for all \(r \in R\) and \(a \in I\), \(ra \in I\) and \(ar \in I\). The second condition says that multiplying any element of \(I\) by any ring element stays in \(I\) — ideals "absorb" multiplication. Kernels of ring homomorphisms are ideals; conversely, every ideal is the kernel of the quotient map.

The **quotient ring** \(R/I\) is the set of cosets \(\{r + I : r \in R\}\) with ring operations \((r + I) + (s + I) = (r + s) + I\) and \((r + I)(s + I) = rs + I\). These are well-defined precisely when \(I\) is an ideal (unlike group quotients, which required normality — in commutative rings, every ideal is automatically "normal" in the group-theoretic sense).

## The Isomorphism Theorems for Rings

The analogue of the first group isomorphism theorem holds verbatim:

<div class="theorem">
<strong>First Isomorphism Theorem for Rings:</strong> If \(\phi \colon R \to S\) is a ring homomorphism, then \(R/\ker\phi \cong \mathrm{Im}\,\phi\).
</div>

The correspondence theorem and the second and third isomorphism theorems also carry over from groups: subgroups become subrings and ideals, normal subgroups become ideals, quotient groups become quotient rings. The structural parallel between groups and rings is one of the most satisfying aspects of abstract algebra.

## Maximal Ideals and Fields

An ideal \(I \subsetneq R\) is **maximal** if there is no ideal \(J\) with \(I \subsetneq J \subsetneq R\). The fundamental theorem connecting ideal structure to field structure is:

<div class="theorem">
<strong>Theorem:</strong> Let \(R\) be a commutative unital ring and \(I \subsetneq R\) a proper ideal. Then \(R/I\) is a field if and only if \(I\) is maximal.
</div>

For example, \(\mathbb{Z}/(p)\) is a field for prime \(p\) because \((p)\) is a maximal ideal of \(\mathbb{Z}\). And \(\mathbb{R}[x]/(x^2 + 1)\) is a field (isomorphic to \(\mathbb{C}\)) because \(x^2 + 1\) is irreducible over \(\mathbb{R}\), making \((x^2+1)\) maximal.

The existence of maximal ideals in any commutative ring relies on **Zorn's lemma** — an axiom equivalent to the Axiom of Choice. The argument is that the set of proper ideals, partially ordered by inclusion, has every chain bounded above by the union of the chain; Zorn's lemma then guarantees a maximal element.

## Prime Ideals and Integral Domains

A proper ideal \(P \subsetneq R\) is **prime** if whenever \(ab \in P$, either \(a \in P\) or \(b \in P\). Equivalently, \(R/P\) is an integral domain. Every maximal ideal is prime (since fields are integral domains), but not conversely: \((0)\) is a prime ideal in \(\mathbb{Z}\) (since \(\mathbb{Z}\) is an integral domain) but is not maximal (since \((2) \supsetneq (0)\)).

The language of prime and maximal ideals generalizes the elementary number theory of prime and composite integers. In \(\mathbb{Z}\), the prime ideals are \((0)\) and \((p)\) for prime \(p\); the maximal ideals are \((p)\) for prime \(p\). The ring \(\mathbb{Z}\) itself is not a field (integers don't have multiplicative inverses), but it is an integral domain — captured by \((0)\) being prime.

---

# Chapter 9: Fields of Fractions and the Chinese Remainder Theorem

## Localization and Fields of Fractions

If \(R\) is an integral domain, one can always embed it into a field — the **field of fractions** — by formally creating fractions \(a/b\) with \(a, b \in R\) and \(b \neq 0\). The construction mirrors the construction of \(\mathbb{Q}\) from \(\mathbb{Z}\): pairs \((a,b)\) are declared equivalent if \(ad = bc\), and the field operations are the familiar fraction rules.

More generally, given a **multiplicative set** \(S \subseteq R\) (closed under multiplication, containing 1), one can form the **localization** \(S^{-1}R\), the ring of fractions \(\{a/s : a \in R, s \in S\}\). The localization at a prime ideal \(P\) (taking \(S = R \setminus P\)) produces a local ring — a ring with a unique maximal ideal. Local rings are ubiquitous in algebraic geometry: the ring of rational functions defined at a given point is the local ring at the corresponding prime.

## The Chinese Remainder Theorem

The classical Chinese Remainder Theorem (CRT) of elementary number theory — that the system \(x \equiv a_i \pmod{n_i}\) has a unique solution modulo \(\prod n_i\) when the \(n_i\) are pairwise coprime — is a special case of an algebraic theorem about rings.

Two ideals \(I, J\) in a commutative ring \(R\) are **comaximal** if \(I + J = R\). The ring-theoretic CRT states:

<div class="theorem">
<strong>Chinese Remainder Theorem:</strong> If \(I_1, \ldots, I_k\) are pairwise comaximal ideals in a commutative ring \(R\), then
\[
R/(I_1 \cap \cdots \cap I_k) \cong R/I_1 \times \cdots \times R/I_k.
\]
Moreover, \(I_1 \cap \cdots \cap I_k = I_1 \cdots I_k\) (the product of the ideals).
</div>

For \(R = \mathbb{Z}\) and \(I_i = (n_i)\) with pairwise coprime \(n_i\), this recovers the classical CRT. In polynomial rings, it allows splitting certain computations into independent parts.

---

# Chapter 10: PIDs, UFDs, and Polynomial Rings

## Divisibility in Integral Domains

In any integral domain, element \(a\) **divides** \(b\) (written \(a \mid b\)) if \(b = ac\) for some \(c \in R\). Two elements \(a, b\) are **associates** if \(a \mid b\) and \(b \mid a\), equivalently if \(a = ub\) for some unit \(u\). A **greatest common divisor** of \(a\) and \(b\) is a common divisor \(d\) such that every other common divisor divides \(d\).

An element \(p \in R\) is **irreducible** if \(p\) is not a unit and whenever \(p = ab\), one of \(a\) or \(b\) is a unit. An element \(p\) is **prime** if \(p\) is not a unit and \(p \mid ab\) implies \(p \mid a\) or \(p \mid b\). In \(\mathbb{Z}\), irreducible and prime coincide; in general integral domains they need not.

## Principal Ideal Domains

A **principal ideal domain** (PID) is an integral domain in which every ideal is principal — generated by a single element. The integers \(\mathbb{Z}\) and polynomial rings \(F[x]\) over a field \(F\) are PIDs. In a PID, the ideal-theoretic and divisibility-theoretic properties align cleanly: a non-zero ideal \((a)\) is prime if and only if \(a\) is prime (equivalently, irreducible); every non-zero prime ideal is maximal.

In a PID, GCDs always exist and can be computed: \(\gcd(a, b) = d\) where \((d) = (a) + (b)\). This gives the ring-theoretic form of Bézout's theorem: in a PID, \(\gcd(a,b) = ra + sb\) for some \(r, s \in R\).

## Euclidean Domains

A **Euclidean domain** is an integral domain \(R\) equipped with a size function \(\nu \colon R \setminus \{0\} \to \mathbb{Z}_{\geq 0}\) (the **Euclidean norm**) such that for all \(a, b \in R\) with \(b \neq 0\), there exist \(q, r \in R\) with \(a = qb + r\) and either \(r = 0\) or \(\nu(r) < \nu(b)\).

Every Euclidean domain is a PID: given an ideal \(I\), choose an element \(d \in I\) of minimal norm; then \(I = (d)\) by the division algorithm. The integers \(\mathbb{Z}\) (with \(\nu(n) = |n|\), the usual absolute value) and polynomial rings \(F[x]\) over a field \(F\) (with \(\nu(f) = \deg f\)) are Euclidean domains. The **Gaussian integers** \(\mathbb{Z}[i] = \{a + bi : a, b \in \mathbb{Z}\}\) are a Euclidean domain with \(\nu(a+bi) = a^2 + b^2\); the division algorithm here corresponds to approximating a complex rational by a nearby Gaussian integer.

## Unique Factorization Domains

A **unique factorization domain** (UFD) is an integral domain in which every non-zero non-unit element factors into irreducibles, and this factorization is unique up to order and units. The fundamental theorem of arithmetic — every integer factors uniquely into primes — is the statement that \(\mathbb{Z}\) is a UFD.

The hierarchy is: Euclidean domains \(\subsetneq\) PIDs \(\subsetneq\) UFDs \(\subsetneq\) integral domains. Each inclusion is strict:
- \(\mathbb{Z}[\frac{1+\sqrt{-19}}{2}]\) is a PID but not Euclidean.
- \(\mathbb{Z}[x]\) is a UFD but not a PID (since the ideal \((2, x)\) is not principal).
- The ring \(\mathbb{Z}[\sqrt{-5}]\) is an integral domain but not a UFD: \(6 = 2 \cdot 3 = (1 + \sqrt{-5})(1 - \sqrt{-5})\) gives two essentially different factorizations.

In a UFD, irreducible and prime coincide, and GCDs exist. The converse of the last implication requires additional structure.

## Gauss's Lemma and Polynomial UFDs

The connection between UFDs and polynomial rings is given by Gauss's lemma. The **content** of a polynomial \(f = a_0 + a_1 x + \cdots + a_n x^n \in R[x]\) is \(\gcd(a_0, a_1, \ldots, a_n)\); a polynomial is **primitive** if its content is a unit.

<div class="theorem">
<strong>Gauss's Lemma:</strong> If \(R\) is a UFD, then the product of two primitive polynomials in \(R[x]\) is primitive.
</div>

An elegant corollary: if \(f \in R[x]\) factors in \(F[x]\) (where \(F\) is the field of fractions of \(R\)), it factors in \(R[x]\) with the same degree bound. More precisely, if \(f\) is primitive and \(f = gh\) in \(F[x]\), then \(g\) and \(h\) can be taken to have coefficients in \(R\).

<div class="theorem">
<strong>Theorem:</strong> If \(R\) is a UFD, then \(R[x]\) is a UFD.
</div>

By induction, \(R[x_1, \ldots, x_n]\) is a UFD whenever \(R\) is. In particular, \(\mathbb{Z}[x]\) and \(F[x_1, \ldots, x_n]\) for any field \(F\) are UFDs — a fundamental fact in algebraic geometry.

A practical criterion for irreducibility of integer polynomials is:

<div class="theorem">
<strong>Eisenstein's Criterion:</strong> If \(f = a_n x^n + \cdots + a_0 \in \mathbb{Z}[x]\) and there is a prime \(p\) with \(p \mid a_i\) for \(i < n\), \(p \nmid a_n\), and \(p^2 \nmid a_0\), then \(f\) is irreducible over \(\mathbb{Q}\).
</div>

Eisenstein's criterion shows, for instance, that \(x^n - p\) is irreducible over \(\mathbb{Q}\) for any prime \(p\) — the minimal polynomial of \(\sqrt[n]{p}\) is irreducible. The cyclotomic polynomial \(\Phi_p(x) = x^{p-1} + x^{p-2} + \cdots + 1\) is irreducible over \(\mathbb{Q}\) by substituting \(x \mapsto x + 1\) and applying Eisenstein.

---

# Chapter 11: Beyond This Course

## Natural Next Topics

### Field Extensions and Galois Theory

PMATH 347 builds the foundations for **Galois theory** — arguably the crown jewel of undergraduate algebra, and the subject of PMATH 348 at Waterloo. A **field extension** \(K/F\) is a field \(K\) containing \(F\) as a subfield. The degree \([K:F]\) is the dimension of \(K\) as an \(F\)-vector space. Simple extensions \(F(\alpha)\) — obtained by adjoining a root of an irreducible polynomial — have degree equal to the degree of that polynomial; the quotient ring construction \(F[x]/(f(x))\) (for irreducible \(f\)) is the algebraic model.

Galois theory connects field extensions to group theory: the **Galois group** \(\mathrm{Gal}(K/F)\) is the group of field automorphisms of \(K\) that fix \(F\) pointwise. The **fundamental theorem of Galois theory** establishes a correspondence between subgroups of \(\mathrm{Gal}(K/F)\) and intermediate fields \(F \subseteq L \subseteq K\) — a bijection reversing inclusion. This bijection is the conceptual bridge between the two halves of PMATH 347: group theory is needed to understand field extensions, and field theory gives the group theory new meaning.

The supreme application is the ancient question of **solvability by radicals**: can the roots of a polynomial \(f(x)\) be expressed using arithmetic operations and radicals (square roots, cube roots, etc.)? Galois showed this is possible if and only if the Galois group of \(f\) is **solvable** — a property of groups (related to the derived series \(G \geq [G,G] \geq [[G,G],[G,G]] \geq \ldots\) eventually reaching \(\{e\}\)). Since \(S_5\) is not solvable, a general quintic cannot be solved by radicals — the Abel-Ruffini theorem, now a corollary of Galois theory.

### Algebraic Number Theory

The rings \(\mathbb{Z}[\sqrt{-5}]\) and \(\mathbb{Z}[i]\) (Gaussian integers) that appear as examples in PMATH 347 are instances of **rings of integers** of number fields. A **number field** is a finite extension \(K/\mathbb{Q}\); its ring of integers \(\mathcal{O}_K\) consists of all elements satisfying a monic polynomial equation with coefficients in \(\mathbb{Z}\). These rings fail to be UFDs in general — Kummer's discovery of this failure in the 19th century, and his introduction of "ideal numbers" (now ideals) to restore unique factorization, was the original motivation for ideal theory.

The correct substitute for unique factorization in rings of integers is unique factorization of **ideals** into prime ideals, which holds in any **Dedekind domain** (a Noetherian integrally closed integral domain of Krull dimension 1). Rings of integers of number fields are Dedekind domains. The failure of unique element factorization is measured by the **class group** \(\mathrm{Cl}(\mathcal{O}_K)\) — a finite abelian group whose triviality is equivalent to \(\mathcal{O}_K\) being a UFD (equivalently, a PID).

### Representation Theory

Groups act on vector spaces: a **linear representation** of a group \(G\) over a field \(F\) is a group homomorphism \(\rho \colon G \to GL_n(F)\). **Representation theory** studies these homomorphisms — breaking representations into irreducible pieces (**Maschke's theorem**: every representation of a finite group over a field of characteristic 0 is completely reducible), computing **characters** (traces of matrices), and using them to understand the group's structure.

Character theory is a vast tool: the number of irreducible representations equals the number of conjugacy classes; the degrees of irreducible representations divide \(|G|\); the character table of a group encodes deep structural information. Applications range from the proof that groups of order \(p^a q^b\) (Burnside's theorem) are solvable, to the analysis of molecular orbital theory in chemistry, to modern cryptography.

## Follow-up Courses and Reading

### At the University of Waterloo

**PMATH 348** (*Fields and Galois Theory*) is the direct continuation, completing the algebraic picture by studying field extensions, splitting fields, algebraic closures, and the full Galois correspondence. **PMATH 446** (*Introduction to Commutative Algebra and Algebraic Geometry*) develops ring theory further toward algebraic geometry: Noetherian rings, Hilbert's basis theorem, algebraic varieties, and the Nullstellensatz. **PMATH 441** (*Algebraic Number Theory*) applies the ring and field theory to study number fields, rings of integers, Dedekind domains, and class groups.

### Standard Texts

**Dummit & Foote** *Abstract Algebra* (3rd ed., Wiley) is the most comprehensive reference at this level, covering groups, rings, modules, fields, Galois theory, and introductory algebraic number theory. **Artin's** *Algebra* (2nd ed., Pearson) takes a more geometric view, emphasizing linear groups and matrix methods; it is particularly good for developing intuition. **Herstein's** *Topics in Algebra* (2nd ed., Wiley) is more concise and is famous for its challenging exercises — a standard text for several generations. For commutative algebra, **Atiyah-Macdonald** *Introduction to Commutative Algebra* (Addison-Wesley) is the classic short text, covering Noetherian rings, primary decompositions, and local rings in under 130 pages.

### Graduate Level

**Lang's** *Algebra* (Springer) is the encyclopedic graduate reference, covering all standard topics and much more in a terse, demanding style. For algebraic geometry (the geometric side of commutative algebra), **Hartshorne** *Algebraic Geometry* (Springer) is the standard introduction, assuming solid commutative algebra. **Neukirch** *Algebraic Number Theory* (Springer) is the definitive graduate treatment. For representation theory, **Serre** *Linear Representations of Finite Groups* (Springer) is a elegant short text, and **Fulton-Harris** *Representation Theory: A First Course* (Springer) is a longer, example-driven account.

## Open Problems and Active Research

### The Inverse Galois Problem

The **inverse Galois problem** asks: for every finite group \(G\), does there exist a Galois extension of \(\mathbb{Q}\) with Galois group \(G\)? In other words, does every finite group arise as the symmetry group of some polynomial equation over \(\mathbb{Q}\)? This problem, formulated in the 19th century and still open, is one of the great unsolved problems in algebra. It is known to hold for all finite abelian groups (by Kronecker-Weber), all symmetric groups \(S_n\), all alternating groups \(A_n\), and many other families. The Shafarevich theorem shows every finite solvable group occurs as a Galois group over \(\mathbb{Q}\). But the full problem for all finite groups — including the Monster group — remains open.

### The Classification of Finite Simple Groups and Its Applications

The CFSG (Classification of Finite Simple Groups) — completed around 2004 with Aschbacher-Smith's quasithin classification — is formally proved but its proof is so vast (estimated 10,000–15,000 pages across hundreds of papers) that ongoing work focuses on **revisionary proofs**: shorter, more transparent arguments. The Gorenstein-Lyons-Solomon (GLS) program aims to produce a unified second-generation proof in a series of roughly 12 volumes, of which 8 have appeared. Separately, applications of the CFSG to permutation groups, graph theory, and coding theory continue to be developed — including sharp bounds on primitive permutation groups that are used in computational group theory.

### Algebraic \(K\)-Theory

**Algebraic \(K\)-theory** generalizes the notion of class group and units to higher dimensions, associating to a ring \(R\) a sequence of abelian groups \(K_0(R), K_1(R), K_2(R), \ldots\). The group \(K_0(R)\) is the Grothendieck group of projective \(R\)-modules (a vast generalization of vector spaces); \(K_1(R)\) is related to determinants of invertible matrices; \(K_2(R)\) (defined by Milnor) is related to the Steinberg group. The Bass-Quillen theorem, the Quillen-Lichtenbaum conjecture (relating algebraic and étale \(K\)-theory for rings of integers), and the relationship between algebraic \(K\)-theory and motivic cohomology are active research areas intertwining algebra, algebraic geometry, and algebraic topology.

### Non-commutative Ring Theory

The rings in PMATH 347 are almost entirely commutative. **Non-commutative ring theory** — the study of rings where \(ab \neq ba\) in general — is a rich field with deep connections to representation theory, Lie algebras, and quantum groups. The Artin-Wedderburn theorem classifies semisimple rings (those with no nilpotent ideals) as products of matrix rings over division rings. The **Brauer group** of a field classifies central simple algebras over that field and connects to Galois cohomology and class field theory. **Quantum groups** — non-commutative Hopf algebras deforming classical group algebras — were introduced in the 1980s by Drinfeld and Jimbo in connection with the quantum Yang-Baxter equation from physics and have become a central object in modern representation theory and mathematical physics.

### Algorithmic and Computational Aspects

Abstract algebra has a vibrant computational side. **Gröbner bases** (Buchberger's algorithm, 1965) generalize Gaussian elimination to multivariate polynomial ideals, allowing computation of intersections, quotients, and solutions to polynomial systems. They are implemented in every computer algebra system (Mathematica, Magma, GAP) and are fundamental in algebraic geometry, cryptography, and robotics. The question of the **complexity of group-theoretic algorithms** — how efficiently can one solve the word problem, compute subgroup structure, or test isomorphism? — connects group theory to complexity theory. The graph isomorphism problem (solved in quasipolynomial time by Babai in 2015, using group theory) and the orbit-counting problems of combinatorics all live at this intersection.
