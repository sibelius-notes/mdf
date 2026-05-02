---
title: "PMATH 334: Introduction to Rings and Fields"
subjects: "PMATH"
prof: "Tomáš Vávra"
---

*Based on lecture notes by Sibelius Peng — [PDF source](https://pdf.sibeliusp.com/1221/pmath334.pdf)*

## Sources and References

**Primary textbook** — Dummit, D.S. and Foote, R.M. *Abstract Algebra*, 3rd ed. Wiley, 2004.
**Supplementary texts** — Herstein, I.N. *Topics in Algebra*, 2nd ed. Wiley, 1975. Stewart, I. *Galois Theory*, 4th ed. CRC Press, 2015. Cox, D.A. *Galois Theory*, 2nd ed. Wiley, 2012.
**Online resources** — Keith Conrad's expository notes (math.uconn.edu/~kconrad/blurbs/) on rings, fields, Galois theory — exceptionally clear. MIT 18.702 Algebra II (Artin, OCW). Emily Riehl's lecture notes on algebra (available freely).
**Lecture notes** — Peng, S. *PMATH 334 Lecture Notes* (Winter 2022). https://pdf.sibeliusp.com/1221/pmath334.pdf

# Chapter 1: Motivation — Fermat's Last Theorem and Constructibility

Abstract algebra is not invented for its own sake. Two of the most celebrated problems in mathematics history motivate the central objects of PMATH 334: rings and fields.

## Fermat's Last Theorem

**Fermat's Last Theorem** states that \(x^n + y^n = z^n\) has no solutions in nonzero integers for \(n \geq 3\). Fermat claimed a proof in 1637; Wiles finally proved it in 1995. The 19th-century attempts to prove it drove the development of ring theory.

**Lamé's approach (1847)**: Lamé observed that over the **cyclotomic ring** \(\mathbb{Z}[\zeta_p]\) (where \(\zeta_p = e^{2\pi i/p}\)), one can factor
\[
z^p = x^p + y^p = (x + y)(x + \zeta_p y)(x + \zeta_p^2 y) \cdots (x + \zeta_p^{p-1} y).
\]
If \(\mathbb{Z}[\zeta_p]\) were a **unique factorisation domain (UFD)** — if every element factored uniquely into irreducibles (analogously to how integers factor into primes) — the argument could be completed. Lamé announced this proof to the French Academy.

**Kummer's objection**: Liouville and Kummer quickly pointed out that \(\mathbb{Z}[\zeta_{23}]\) is not a UFD. The prime 23 was the first counterexample: \(\mathbb{Z}[\zeta_{23}]\) has class number 3, meaning unique factorisation fails. Kummer developed the theory of **ideal numbers** (precursor to modern ideals) to rescue the argument for regular primes, but the general case required Wiles's deep machinery: elliptic curves, modular forms, and Galois representations.

The episode illustrates why ring theory matters: the right algebraic structures make insoluble problems tractable, or reveal precisely where and why a naive approach fails.

## Straightedge-and-Compass Constructibility

The ancient Greek problem: which lengths, angles, and geometric figures can be constructed using only a straightedge (no markings) and compass? Algebraically, starting from length 1:

- One can construct all rational lengths.
- Constructing the length \(\sqrt{a}\) corresponds to taking a square root — a degree-2 field extension.
- A length \(\alpha\) is **constructible** iff it can be obtained by a finite sequence of field operations and square roots from \(\mathbb{Q}\) — equivalently, iff \([\mathbb{Q}(\alpha) : \mathbb{Q}] = 2^k\) for some \(k \geq 0\).

**Classical impossibilities**:
- **Doubling the cube**: construct \(\sqrt[3]{2}\). But \([\mathbb{Q}(\sqrt[3]{2}) : \mathbb{Q}] = 3\), not a power of 2. Impossible.
- **Trisecting an angle**: construct \(\cos(20°)\). The minimal polynomial of \(\cos(20°)\) over \(\mathbb{Q}\) is \(8x^3 - 6x - 1\), degree 3. Impossible in general.
- **Squaring the circle**: construct \(\sqrt{\pi}\). Since \(\pi\) is transcendental (Lindemann 1882), \(\sqrt{\pi}\) is not algebraic over \(\mathbb{Q}\), let alone constructible. Impossible.

**Constructible regular polygons**: a regular \(n\)-gon is constructible iff \(n = 2^k p_1 \cdots p_t\) where \(p_i\) are distinct **Fermat primes** \(p = 2^{2^m} + 1\). Known Fermat primes: 3, 5, 17, 257, 65537. Gauss proved the regular 17-gon is constructible (at age 19, 1796), and this discovery made him choose mathematics over philology. The full characterisation was proved by Gauss and Wantzel (1837).

These impossibility proofs — which convert geometric questions into algebraic ones — are the climax of PMATH 334.

# Chapter 2: Rings — Definitions and Basic Properties

A **ring** is an algebraic structure with two operations generalising the integers: addition (with a group structure) and multiplication (associative, distributing over addition).

## Definition and Examples

<div class="definition">

**Definition (Ring).** A ring \((R, +, \cdot)\) is a set \(R\) with two binary operations satisfying:
1. \((R, +)\) is an abelian group (with identity \(0\)).
2. Multiplication is associative: \((ab)c = a(bc)\).
3. Distributivity: \(a(b+c) = ab + ac\) and \((a+b)c = ac + bc\).
A ring is **commutative** if \(ab = ba\) for all \(a, b\); it has **unity** if there is an identity \(1\) for multiplication.

</div>

**Key examples**:
- \(\mathbb{Z}, \mathbb{Q}, \mathbb{R}, \mathbb{C}\): commutative rings with unity.
- \(\mathbb{Z}/n\mathbb{Z}\): integers mod \(n\). A field iff \(n\) is prime.
- \(\mathbb{Z}[i] = \{a + bi : a, b \in \mathbb{Z}\}\): the **Gaussian integers**. A UFD, but not a field.
- \(\mathbb{Z}[\sqrt{-5}]\): an integral domain that is not a UFD (since \(6 = 2 \cdot 3 = (1+\sqrt{-5})(1-\sqrt{-5})\), two distinct factorisations into irreducibles).
- \(M_n(\mathbb{R})\): \(n \times n\) real matrices. Noncommutative, not an integral domain (zero divisors exist for \(n \geq 2\)).
- \(R[x]\): polynomial ring over a ring \(R\).

**Zero divisors** are nonzero elements \(a, b\) with \(ab = 0\). An **integral domain** is a commutative ring with unity and no zero divisors. A **field** is a commutative ring with unity where every nonzero element has a multiplicative inverse.

Proof: if \(p\) is prime, \(\mathbb{Z}/p\mathbb{Z}\) is a field. If \(n\) is composite, say \(n = ab\) with \(1 < a, b < n\), then \([a][b] = [n] = [0]\) — a zero divisor. So \(\mathbb{Z}/n\mathbb{Z}\) is an integral domain iff \(n\) is prime; and every finite integral domain is a field (by a counting argument using no-zero-divisors plus finite cancellation).

# Chapter 3: Ring Homomorphisms, Ideals, and Quotient Rings

Homomorphisms preserve algebraic structure; ideals are the kernels of ring homomorphisms; quotient rings are the range types.

## Homomorphisms and Ideals

<div class="definition">

**Definition (Ring homomorphism).** A map \(\phi : R \to S\) is a ring homomorphism if \(\phi(a + b) = \phi(a) + \phi(b)\) and \(\phi(ab) = \phi(a)\phi(b)\) for all \(a, b \in R\), and \(\phi(1_R) = 1_S\) (for unital rings). The **kernel** is \(\ker\phi = \{r \in R : \phi(r) = 0\}\) and the **image** is \(\text{im}\,\phi = \{\phi(r) : r \in R\}\).

</div>

<div class="definition">

**Definition (Ideal).** A subset \(I \subseteq R\) is an **ideal** (two-sided) if it is a subgroup under addition, and for all \(r \in R\) and \(a \in I\): \(ra \in I\) and \(ar \in I\). The ideal **generated by** \(a\) is \((a) = \{ra : r \in R\}\) (**principal ideal**).

</div>

The kernel of any ring homomorphism is an ideal. Conversely, every ideal \(I\) is the kernel of the quotient map \(\pi : R \to R/I\) where \(R/I = \{r + I : r \in R\}\) with operations \((r + I) + (s + I) = (r+s) + I\) and \((r+I)(s+I) = rs + I\).

## Isomorphism Theorems

<div class="theorem">

**Theorem (First Isomorphism Theorem).** If \(\phi : R \to S\) is a ring homomorphism, then
\[
R / \ker\phi \cong \text{im}\,\phi.
\]

</div>

<div class="theorem">

**Theorem (Second Isomorphism Theorem).** If \(A\) is a subring and \(I\) is an ideal of \(R\), then \(A + I\) is a subring, \(A \cap I\) is an ideal of \(A\), and \(A/(A \cap I) \cong (A + I)/I\).

</div>

<div class="theorem">

**Theorem (Third Isomorphism Theorem).** If \(I \subseteq J\) are ideals of \(R\), then \(J/I\) is an ideal of \(R/I\), and \((R/I)/(J/I) \cong R/J\).

</div>

**Correspondence theorem**: the ideals of \(R/I\) correspond bijectively to the ideals of \(R\) containing \(I\) via \(J \leftrightarrow J/I\). This is the quotient ring's "ideal lattice" — every ideal of the quotient lifts back to an ideal of the original ring.

# Chapter 4: Maximal Ideals, Prime Ideals, and Zorn's Lemma

The structure of ideals encodes deep information about the ring, especially about its quotient fields.

## Maximal and Prime Ideals

<div class="definition">

**Definition (Prime and maximal ideals).** A proper ideal \(P\) is **prime** if \(ab \in P \Rightarrow a \in P$ or $b \in P\). A proper ideal \(M\) is **maximal** if there is no ideal \(I\) with \(M \subsetneq I \subsetneq R\).

</div>

<div class="theorem">

**Theorem (Quotient characterisations).** Let \(R\) be a commutative ring with unity and \(I\) a proper ideal.
- \(I\) is **prime** iff \(R/I\) is an **integral domain**.
- \(I\) is **maximal** iff \(R/I\) is a **field**.

</div>

These theorems make ideal-type classification concrete. In \(\mathbb{Z}\), the prime ideals are \((0)\) and \((p)\) for prime \(p\); the maximal ideals are precisely \((p)\) (since \(\mathbb{Z}/(p) \cong \mathbb{F}_p\) is a field). In a field, \((0)\) is the only ideal — a field has no interesting ideal structure, which matches the fact that \((0)\) is both prime and maximal.

**Every maximal ideal is prime** (since every field is an integral domain), but not vice versa: in \(\mathbb{Z}\), \((0)\) is prime but not maximal.

## Existence of Maximal Ideals: Zorn's Lemma

Does every ring have a maximal ideal? In general, the proof requires the axiom of choice via Zorn's Lemma.

<div class="theorem">

**Theorem (Zorn's Lemma equivalence).** The axiom of choice, Zorn's Lemma, and the Well-Ordering Theorem are all equivalent over ZF set theory. Zorn's Lemma: if every chain in a partially ordered set \((P, \leq)\) has an upper bound, then \(P\) has a maximal element.

</div>

**Application**: the set of proper ideals of a ring \(R\) (partially ordered by inclusion) has every chain bounded by the union of the chain (still a proper ideal if \(R\) has unity). So Zorn's Lemma guarantees that every proper ideal is contained in a maximal ideal. In particular, every ring with unity has at least one maximal ideal.

The use of Zorn's Lemma here is essential — it is not constructive. There exist models of ZF (without AC) in which some rings have no maximal ideals.

# Chapter 5: Polynomial Rings and Rings of Fractions

## Polynomial Rings

The **polynomial ring** \(R[x]\) over a commutative ring \(R\) consists of polynomials \(a_0 + a_1 x + \cdots + a_n x^n\) with coefficients in \(R\), added and multiplied in the standard way.

Key facts: if \(R\) is an integral domain, so is \(R[x]\) (the leading coefficient of a product is the product of the leading coefficients). If \(R\) is a UFD, so is \(R[x]$ (Gauss's lemma + induction). If \(F\) is a field, then \(F[x]\) is a Euclidean domain (with degree as the norm), hence a PID, hence a UFD.

**Universal property**: for any ring homomorphism \(\phi : R \to S\) and element \(s \in S\) with \(\phi(r)s = s\phi(r)\) for all \(r\), there is a unique ring homomorphism \(\tilde\phi : R[x] \to S\) extending \(\phi\) with \(\tilde\phi(x) = s\). This is the **evaluation homomorphism** \(\text{ev}_s : f \mapsto f(s)\) when \(R \subseteq S\).

## Rings of Fractions

The integers can be embedded in the rationals by formally inverting all nonzero integers. The same construction works for any integral domain.

<div class="theorem">

**Theorem (Field of fractions).** For any integral domain \(D\), there exists a field \(F\) and an injective ring homomorphism \(\iota : D \to F\) such that every element of \(F\) has the form \(\iota(a)/\iota(b)\) for \(a, b \in D\), \(b \neq 0\). This field \(F\) is unique up to isomorphism and is called the **field of fractions** (or fraction field) of \(D\), denoted \(\text{Frac}(D)\).

</div>

Construction: \(\text{Frac}(D) = (D \times D^\times) / \sim\) where \((a, b) \sim (c, d)\) iff \(ad = bc\). The class of \((a,b)\) is written \(a/b\).

**More general localisations**: for a multiplicative set \(S \subseteq R\) (closed under multiplication, not containing 0 or zero divisors), the localisation \(S^{-1}R\) inverts all elements of \(S\). When \(S = R \setminus P\) for a prime ideal \(P\), the localisation \(R_P\) is a local ring (unique maximal ideal \(PR_P\)).

# Chapter 6: The Chinese Remainder Theorem

<div class="theorem">

**Theorem (Chinese Remainder Theorem for rings).** Let \(I_1, \ldots, I_k\) be ideals of a commutative ring \(R\) that are **pairwise comaximal** (\(I_j + I_l = R\) for \(j \neq l\)). Then the natural ring homomorphism
\[
\phi : R \to R/I_1 \times R/I_2 \times \cdots \times R/I_k, \quad r \mapsto (r + I_1, \ldots, r + I_k)
\]
is surjective with kernel \(I_1 \cap \cdots \cap I_k = I_1 \cdots I_k\). In particular, \(R/(I_1 \cdots I_k) \cong R/I_1 \times \cdots \times R/I_k\).

</div>

For \(R = \mathbb{Z}\) and \(I_j = (n_j)\) with pairwise coprime \(n_j\), this recovers the classical CRT: the system of congruences \(x \equiv a_j \pmod{n_j}\) has a unique solution mod \(n_1 \cdots n_k\).

**Application to \(\mathbb{Z}/n\mathbb{Z}\)**: if \(n = p_1^{e_1} \cdots p_t^{e_t}\), then \(\mathbb{Z}/n\mathbb{Z} \cong \mathbb{Z}/p_1^{e_1}\mathbb{Z} \times \cdots \times \mathbb{Z}/p_t^{e_t}\mathbb{Z}\). The group of units satisfies \((\mathbb{Z}/n\mathbb{Z})^\times \cong \prod_i (\mathbb{Z}/p_i^{e_i}\mathbb{Z})^\times\), reducing Euler's phi function to the prime-power case.

**Application in coding theory**: the CRT for \(\mathbb{F}_q[x]\) with coprime moduli \(f_1(x), \ldots, f_k(x)\) is used in Reed–Solomon decoding (the polynomial ring version). The "Reconstruction" step of the Berlekamp–Welch algorithm uses polynomial CRT.

# Chapter 7: Integral Domains — Euclidean, PID, UFD

The integer-like properties of factorisation are captured by the hierarchy:
\[
\text{Field} \subsetneq \text{ED} \subsetneq \text{PID} \subsetneq \text{UFD} \subsetneq \text{Integral Domain}.
\]

## Euclidean Domains

<div class="definition">

**Definition (Euclidean domain).** An integral domain \(D\) with a **norm** \(N : D \setminus \{0\} \to \mathbb{Z}_{\geq 0}\) is a Euclidean domain if for all \(a \in D\) and \(b \in D \setminus \{0\}\), there exist \(q, r \in D\) with \(a = bq + r\) and either \(r = 0\) or \(N(r) < N(b)\).

</div>

**Examples**: \(\mathbb{Z}\) (norm = absolute value), \(F[x]\) for any field \(F\) (norm = degree), \(\mathbb{Z}[i]\) (norm = \(a^2 + b^2\)). Every Euclidean domain is a PID (via the ideal generated by the element of minimal norm).

The **Euclidean algorithm** in an ED computes \(\gcd(a, b)\) by repeated division: \(a = bq_1 + r_1\), \(b = r_1 q_2 + r_2\), \(\ldots\), terminating when \(r_n = 0\); the last nonzero remainder is \(\gcd(a,b)\). **Bézout's identity** follows: there exist \(s, t\) with \(sa + tb = \gcd(a, b)\), computed by back-substitution (extended Euclidean algorithm).

## Principal Ideal Domains

<div class="definition">

**Definition (PID).** An integral domain in which every ideal is principal (generated by a single element) is a **Principal Ideal Domain (PID)**.

</div>

In a PID:
- Every prime element generates a prime ideal.
- Every prime ideal is maximal (since a PID has Krull dimension 1 — the only prime ideals are \((0)\) and the maximal ideals).
- Every PID is a UFD (proved below).
- The ideal \((a) + (b) = (\gcd(a,b))\) in a PID.

**Key example**: \(\mathbb{Z}[x]\) is a UFD (by Gauss's lemma) but not a PID. The ideal \((2, x)\) is not principal in \(\mathbb{Z}[x]\): the only divisors of both 2 and \(x\) are \(\pm 1\), which would generate the whole ring — but \((2, x)\) is a proper ideal.

## Unique Factorisation Domains

<div class="definition">

**Definition (UFD).** An integral domain \(D\) is a **Unique Factorisation Domain** if every nonzero non-unit element \(d\) can be written as a finite product of **irreducibles**, and this factorisation is unique up to order and associates (unit multiples).

</div>

<div class="theorem">

**Theorem.** Every PID is a UFD.

</div>

**Proof sketch**: existence of factorisation follows from the ascending chain condition (every chain of principal ideals stabilises in a PID). Uniqueness: if \(p\) is irreducible in a PID, then \((p)\) is maximal (since a PID is an integral domain and in a PID, prime = irreducible), hence prime; from the prime property, if \(p \mid ab\) then \(p \mid a\) or \(p \mid b\), giving unique factorisation.

**Gauss's Lemma and UFD polynomial rings**:

<div class="theorem">

**Theorem (Gauss's Lemma).** If \(D\) is a UFD, then so is \(D[x]\). Moreover, a polynomial \(f \in D[x]\) is irreducible iff it is either a constant irreducible or a primitive polynomial that is irreducible over \(\text{Frac}(D)\).

</div>

A polynomial is **primitive** if the GCD of its coefficients is 1. Gauss's Lemma: the product of primitive polynomials is primitive. Consequence: \(\mathbb{Z}[x]\) is a UFD; \(\mathbb{Z}[x_1, \ldots, x_n]\) is a UFD for any \(n\).

**Eisenstein's criterion**: a polynomial \(f = a_n x^n + \cdots + a_0 \in \mathbb{Z}[x]\) is irreducible over \(\mathbb{Q}\) if there exists a prime \(p\) such that \(p \nmid a_n\), \(p \mid a_i\) for \(i < n\), and \(p^2 \nmid a_0\). Example: \(x^4 + x^3 + x^2 + x + 1 = (x^5 - 1)/(x-1)\) is irreducible over \(\mathbb{Q}\) by Eisenstein applied after the substitution \(x \mapsto x + 1\) with \(p = 5\).

# Chapter 8: Field Extensions and Algebraic Elements

The theory of field extensions is the language needed to answer the constructibility questions from Chapter 1.

## Basic Theory of Field Extensions

<div class="definition">

**Definition (Field extension).** A **field extension** \(F/K\) is a field \(F\) containing a subfield \(K\). The **degree** \([F : K]\) is the dimension of \(F\) as a \(K\)-vector space.

</div>

**Tower theorem**: if \(F/L/K\) are successive extensions (K ⊆ L ⊆ F), then \([F : K] = [F : L][L : K]\).

**Adjoining an element**: \(K(\alpha)\) denotes the smallest subfield of \(F\) containing \(K\) and \(\alpha\). It equals the fraction field of \(K[\alpha]\) (polynomials in \(\alpha$ with coefficients in \(K\)).

## Algebraic vs. Transcendental Elements

<div class="definition">

**Definition.** An element \(\alpha \in F\) is **algebraic over \(K\)** if \(f(\alpha) = 0\) for some nonzero \(f \in K[x]\); otherwise it is **transcendental**. The **minimal polynomial** of an algebraic element \(\alpha\) is the unique monic irreducible polynomial \(m_\alpha \in K[x]\) with \(\alpha\) as a root.

</div>

<div class="theorem">

**Theorem.** If \(\alpha\) is algebraic over \(K\) with minimal polynomial \(m_\alpha\) of degree \(d\), then \(K(\alpha) \cong K[x]/(m_\alpha(x))\) and \([K(\alpha) : K] = d\). Moreover, \(\{1, \alpha, \alpha^2, \ldots, \alpha^{d-1}\}\) is a \(K\)-basis for \(K(\alpha)\).

</div>

This theorem is the key tool for everything that follows. The minimal polynomial \(m_\alpha\) is irreducible, so \(K[x]/(m_\alpha)\) is a field (since \(K[x]\) is a PID and the ideal generated by an irreducible is maximal). Every element \(\beta \in K(\alpha)\) is uniquely expressible as \(\beta = b_0 + b_1 \alpha + \cdots + b_{d-1} \alpha^{d-1}\) with \(b_i \in K\).

**Algebraic extensions**: \(F/K\) is **algebraic** if every element of \(F\) is algebraic over \(K\). Every finite extension is algebraic. The algebraic closure \(\bar{K}\) of \(K\) is an algebraic extension in which every polynomial over \(K\) splits completely.

# Chapter 9: Straightedge-and-Compass Constructions Revisited

The field extension theory now fully resolves the Greek construction problems.

## Characterisation of Constructible Numbers

<div class="theorem">

**Theorem (Characterisation of constructible numbers).** A real number \(\alpha\) is constructible from the rationals iff there is a tower of field extensions
\[
\mathbb{Q} = F_0 \subsetneq F_1 \subsetneq \cdots \subsetneq F_k
\]
with \(\alpha \in F_k\) and \([F_{i+1} : F_i] = 2\) for each \(i\). Equivalently, \(\alpha\) is constructible iff \([\mathbb{Q}(\alpha) : \mathbb{Q}] = 2^n\) for some \(n \geq 0\).

</div>

The proof proceeds: each straightedge-and-compass step (intersecting two lines, a line and a circle, or two circles) introduces a new element satisfying at most a degree-2 equation over the current field. Conversely, square roots can always be constructed.

**Doubling the cube**: \(\sqrt[3]{2}\) has minimal polynomial \(x^3 - 2\) of degree 3 over \(\mathbb{Q}\). Since 3 is not a power of 2, \(\sqrt[3]{2}\) is not constructible. **Impossibility proved**.

**Trisecting \(60°\)**: \(\cos(20°)\) satisfies \(8x^3 - 6x - 1 = 0\) (from \(\cos(3\theta) = 4\cos^3\theta - 3\cos\theta\) with \(\theta = 20°\)). This polynomial is irreducible over \(\mathbb{Q}\) (by the rational root theorem and irreducibility check), so \([\mathbb{Q}(\cos 20°) : \mathbb{Q}] = 3\). Not constructible. **Impossibility proved**.

## Regular n-gons and Gauss

A regular \(n\)-gon is constructible iff the \(n\)th root of unity \(\zeta_n = e^{2\pi i/n}\) is constructible, iff \([\mathbb{Q}(\zeta_n) : \mathbb{Q}] = \phi(n)\) is a power of 2.

The degree of the \(n\)th cyclotomic extension is the **Euler totient** \(\phi(n)\). Write \(n = 2^a p_1^{e_1} \cdots p_t^{e_t}\). Then \(\phi(n) = 2^{a-1}(p_1 - 1)p_1^{e_1-1} \cdots (p_t - 1)p_t^{e_t-1}\). For \(\phi(n)\) to be a power of 2:
- Each odd prime \(p_i\) must satisfy \(p_i^{e_i-1} = 1\) (so \(e_i = 1\)) and \(p_i - 1\) must be a power of 2 (so \(p_i\) is a **Fermat prime**: \(p_i = 2^{2^m} + 1\)).

Hence: the regular \(n\)-gon is constructible iff \(n = 2^k F_1 F_2 \cdots F_t\) where the \(F_i\) are distinct Fermat primes.

# Chapter 10: Beyond This Course

## Natural Next Topics

PMATH 334 ends with the constructibility theorem — a triumph of field theory linking abstract algebra to Euclidean geometry via the degree of a field extension. But the story of field extensions is only beginning at this point, and several of the deepest results in all of mathematics — the insolubility of the quintic, the proof of Fermat's Last Theorem, the Langlands program — are direct elaborations of the ideas in this course.

**Galois theory.** The single most important continuation of PMATH 334 is **Galois theory**: the correspondence between field extensions and groups of field automorphisms. Let \(F/K\) be a **Galois extension** — finite, normal (every irreducible polynomial over \(K\) with one root in \(F\) splits completely in \(F\)), and separable (no repeated roots). The **Galois group** is the group of field automorphisms

\[\text{Gal}(F/K) = \{ \sigma : F \to F \mid \sigma \text{ is a field isomorphism fixing } K \text{ pointwise} \}.\]

The Fundamental Theorem of Galois Theory establishes a bijection between the lattice of intermediate fields \(K \subseteq E \subseteq F\) and the lattice of subgroups \(H \leq \text{Gal}(F/K)\), given by \(E \mapsto \text{Gal}(F/E)\). The correspondence reverses inclusion: larger intermediate fields correspond to smaller subgroups. Moreover, \(E/K\) is a Galois extension iff \(\text{Gal}(F/E)\) is a normal subgroup of \(\text{Gal}(F/K)\), in which case \(\text{Gal}(E/K) \cong \text{Gal}(F/K) / \text{Gal}(F/E)\). The degree \([E:K] = [\text{Gal}(F/K) : \text{Gal}(F/E)]\).

To see the power of this theorem, consider the splitting field \(F = \mathbb{Q}(\sqrt{2}, \sqrt{3})\) over \(\mathbb{Q}\). This is a degree-4 extension with \(\text{Gal}(F/\mathbb{Q}) \cong \mathbb{Z}/2\mathbb{Z} \times \mathbb{Z}/2\mathbb{Z}\). The three subgroups of order 2 correspond to the three intermediate fields \(\mathbb{Q}(\sqrt{2})\), \(\mathbb{Q}(\sqrt{3})\), and \(\mathbb{Q}(\sqrt{6})\). This is an elegant verification that can be computed explicitly.

The deepest application of Galois theory is the **Abel–Ruffini theorem and its converse**: a polynomial \(f \in \mathbb{Q}[x]\) is solvable by radicals iff its Galois group (the Galois group of its splitting field over \(\mathbb{Q}\)) is a **solvable group**. Recall that a group \(G\) is solvable if there exists a chain \(G = G_0 \supset G_1 \supset \cdots \supset G_k = \{e\}\) where each \(G_{i+1}\) is normal in \(G_i\) and each quotient \(G_i/G_{i+1}\) is abelian. The symmetric group \(S_n\) is solvable for \(n \leq 4\) but not for \(n \geq 5\), because \(A_5\) (the alternating group, a subgroup of index 2 in \(S_5\)) is simple and non-abelian. Since the general degree-\(n\) polynomial has splitting field with Galois group \(S_n\), there is no general formula by radicals for \(n \geq 5\). For specific quintics: the polynomial \(x^5 - 2\) has Galois group isomorphic to the Frobenius group \(F_{20} = \mathbb{Z}/5\mathbb{Z} \rtimes \mathbb{Z}/4\mathbb{Z}\) of order 20, which is solvable, so \(x^5 - 2\) is solvable by radicals (its roots are \(2^{1/5} \zeta_5^k\) for \(k = 0, 1, 2, 3, 4\)). The polynomial \(x^5 - 5x + 12\), however, has Galois group \(S_5\), proving its roots cannot be expressed by radicals.

**Algebraic number theory.** One of the surprising lessons of Fermat's Last Theorem is that the obvious approach — factoring \(x^p + y^p = (x + y)(x + \zeta_p y)(x + \zeta_p^2 y) \cdots (x + \zeta_p^{p-1} y)\) in the ring \(\mathbb{Z}[\zeta_p]\) — fails because \(\mathbb{Z}[\zeta_p]\) is not always a UFD. Kummer's insight (1847) was to work with **ideals** rather than elements: in \(\mathbb{Z}[\zeta_p]\), every ideal factors uniquely into prime ideals, even when elements do not. This makes \(\mathbb{Z}[\zeta_p]\) a **Dedekind domain** — an integral domain in which every nonzero proper ideal factors uniquely into prime ideals, or equivalently, an integrally closed Noetherian domain of Krull dimension 1.

The **class group** \(\text{Cl}(K)\) of a number field \(K\) measures how far the ring of integers \(\mathcal{O}_K\) is from being a UFD: it is trivial iff \(\mathcal{O}_K\) is a PID (and hence a UFD, since PIDs are UFDs). The class group is always finite, and its order \(h_K = |\text{Cl}(K)|\) is called the **class number**. Kummer proved: if \(p \nmid h_{\mathbb{Q}(\zeta_p)}\) (that is, \(p\) is a **regular prime**), then Fermat's Last Theorem holds for exponent \(p\). The smallest irregular prime is 37. Computationally, \(h_K\) is bounded above by the **Minkowski bound**: every ideal class contains an ideal of norm at most \(M_K = \frac{n!}{n^n} \left(\frac{4}{\pi}\right)^{r_2} \sqrt{|d_K|}\), where \(n = [K:\mathbb{Q}]\), \(r_2\) is the number of complex places, and \(d_K\) is the discriminant. This bound is explicit and finite, making \(\text{Cl}(K)\) computable.

The **Dedekind–Kummer theorem** describes how a rational prime \(p\) factors in \(\mathcal{O}_K\): if \(\mathcal{O}_K = \mathbb{Z}[\alpha]\) with minimal polynomial \(f(x)\), then factor \(\bar{f}(x) = \prod \bar{p}_i(x)^{e_i}\) over \(\mathbb{F}_p\), and \(p\mathcal{O}_K = \prod \mathfrak{p}_i^{e_i}\) where \(\mathfrak{p}_i = (p, p_i(\alpha))\). Primes with \(e_i > 1\) are **ramified** — they divide the discriminant — and primes with \(e_i = 1\) and all \(f(\mathfrak{p}_i|p) = 1\) are **totally split**. This splitting behaviour encodes deep arithmetic information and is the starting point for class field theory.

**Elliptic curves as an application of field theory.** An **elliptic curve** over a field \(K\) (of characteristic \(\neq 2, 3\)) is the projective closure of an affine curve \(y^2 = x^3 + ax + b\) with \(4a^3 + 27b^2 \neq 0\). The set of \(K\)-rational points \(E(K)\) forms an abelian group under the geometric chord-and-tangent law. Over \(\mathbb{Q}\), the Mordell–Weil theorem states that \(E(\mathbb{Q})\) is finitely generated: \(E(\mathbb{Q}) \cong \mathbb{Z}^r \oplus T\) where \(T\) is finite and \(r\) is the rank. Computing \(r\) is an open algorithmic problem (it is not known whether there is an algorithm that always terminates). Over \(\mathbb{F}_p\), the number of points satisfies \(|E(\mathbb{F}_p)| = p + 1 - t_p\) where \(|t_p| \leq 2\sqrt{p}\) (Hasse's theorem). Elliptic curves are central to Wiles's proof of FLT, to elliptic-curve cryptography (ECC, covered in CO 487), and to the Birch and Swinnerton-Dyer conjecture (one of the Clay Millennium Problems).

**Commutative algebra.** PMATH 334 introduces the ideal theory of commutative rings in concrete form. Commutative algebra systematises this machinery for Noetherian rings — rings satisfying the ascending chain condition on ideals. In a Noetherian ring, every ideal is finitely generated, and prime ideals can be used to define **Krull dimension** (the maximum length of a chain of prime ideals). Polynomial rings \(k[x_1, \ldots, x_n]\) have dimension \(n\). The **Hilbert Basis Theorem** (that \(R[x]\) is Noetherian whenever \(R\) is) and **Hilbert's Nullstellensatz** — which establishes a bijection between radical ideals of \(k[x_1, \ldots, x_n]\) and algebraic subsets of \(\mathbb{A}^n_k\) (affine \(n\)-space over an algebraically closed field) — form the algebraic foundations of **algebraic geometry**. The Nullstellensatz says: an ideal \(I \subseteq k[x_1,\ldots,x_n]\) has \(\sqrt{I} = \bigcap_{\mathfrak{m} \supseteq I} \mathfrak{m}\) (intersection over maximal ideals), and the common zeros of the polynomials in \(I\) are in bijection with \(\text{Hom}_{k\text{-alg}}(k[x_1,\ldots,x_n]/I, k)\). This is the bridge between ring theory and geometry.

## Follow-up Courses and Reading

**At UWaterloo**, the PMATH curriculum offers a rich sequence of follow-on courses. **PMATH 348 (Fields and Galois Theory)** is the direct continuation, developing the Fundamental Theorem, applications to constructibility and ruler-and-compass problems, and solvability by radicals with full proofs. **PMATH 347 (Groups and Rings)** deepens the group theory used in Galois theory — especially the structure of solvable groups, composition series, and the Jordan–Hölder theorem. **PMATH 447 (Algebraic Number Theory)** develops Dedekind domains, ramification theory, class groups, Dirichlet's unit theorem, and \(L\)-functions; it is where Fermat's Last Theorem for regular primes is finally proved in full. **PMATH 441 (Algebraic Curves)** introduces projective curves, the Riemann–Roch theorem for function fields, and elliptic curves — connecting field theory with complex analysis and geometry. **PMATH 445 (Representations of Finite Groups)** develops the non-commutative side: group algebras (which are semisimple by Maschke's theorem), characters, and the character table, with applications to combinatorics and number theory. For students interested in the foundations side, **PMATH 433 (Model Theory and Set Theory)** covers how Zorn's lemma and the axiom of choice interact with algebraic structures.

**At peer universities**, MIT's 18.702 (Algebra II) covers Galois theory, representations, and modules at a level comparable to PMATH 348 + 347; lecture notes by Artin are freely available. Harvard's Math 122 and 123 cover abstract algebra through Galois theory with problem sets freely available on the course websites. Cambridge Part II and Part III courses (Galois Theory, Algebraic Number Theory, Commutative Algebra) are offered by the Faculty of Mathematics with publicly available example sheets. The Chicago math department's algebraic curriculum, culminating in the year-long graduate sequence (Algebra I–III), is legendary for its depth and rigour. For algebraic number theory specifically, the notes by Andrew Sutherland (MIT 18.785) and by James Milne (jmilne.org) are excellent freely available resources.

**Primary textbooks.** Dummit and Foote, *Abstract Algebra*, 3rd ed. (Wiley, 2004) is the comprehensive reference for everything in PMATH 334 and its continuations: groups, rings, modules, fields, Galois theory, representation theory, homological algebra, and algebraic geometry. At \(\sim\)932 pages it is encyclopaedic; most courses use selected chapters. Herstein, *Topics in Algebra*, 2nd ed. (Wiley, 1975) is a classic at a slightly lower level, with superb exercises. For Galois theory specifically, Stewart, *Galois Theory*, 4th ed. (CRC Press, 2015) is accessible and historically motivated; Cox, *Galois Theory*, 2nd ed. (Wiley, 2012) is thorough and includes geometric applications. Neukirch, *Algebraic Number Theory* (Springer, 1999) is the standard graduate text for algebraic number theory; Marcus, *Number Fields* (Springer) is more accessible. Atiyah and Macdonald, *Introduction to Commutative Algebra* (Addison-Wesley, 1969) is extraordinarily concise (128 pages) and covers Noetherian rings, localisation, completion, dimension theory, and the going-up/going-down theorems; working through all its exercises is one of the most efficient paths to graduate-level algebra. Lang, *Algebra*, 3rd ed. (Springer, 2002) is the comprehensive graduate reference, covering everything from categories to étale cohomology.

**Keith Conrad's expository blurbs** (kconrad.math.uconn.edu/blurbs/) are outstanding free notes on a vast range of topics: norms and traces, Hensel's lemma, discriminants, proofs that specific numbers are irrational or transcendental, the quadratic formula in characteristic 2, and much more. They are written at a level just above PMATH 334 and are ideal for independent exploration. James Milne's course notes (jmilne.org/math/) cover Fields and Galois Theory, Algebraic Number Theory, Algebraic Geometry, and more at a rigorous graduate level; they are freely downloadable in PDF and are regularly updated.

## Open Problems and Active Research

Abstract algebra is often perceived as a finished subject — the domain statements are proved, the hierarchy is established. In fact, several of the deepest open problems in mathematics sit at the interface of ring theory, field theory, and number theory, and active research is pursued by hundreds of mathematicians worldwide.

**The inverse Galois problem.** Every finite group appears as the Galois group of some field extension (Noether's problem has a positive answer over \(\mathbb{C}(t)\) by the Riemann existence theorem). But the central question is: **which finite groups occur as Galois groups of extensions of \(\mathbb{Q}\)**? The abelian case is completely solved by the Kronecker–Weber theorem: every abelian extension of \(\mathbb{Q}\) is contained in a cyclotomic field, so every abelian group is a Galois group over \(\mathbb{Q}\). The solvable case is settled by Shafarevich's theorem (1954): every solvable group occurs as a Galois group over \(\mathbb{Q}\), a deep and difficult result. All simple groups that are known to have been realised over \(\mathbb{Q}\): symmetric groups \(S_n\) (classical), alternating groups \(A_n\) (Hilbert), all sporadic simple groups including the Monster group \(M\) of order \(\sim 8 \times 10^{53}\) (Thompson, 1984). The remaining question — whether every finite simple group (and hence every finite group, by the Schur–Zassenhaus theorem) is a Galois group over \(\mathbb{Q}\) — is open. The current strategy, initiated by Belyi and developed by Malle–Matzat, uses **rigid triples** of conjugacy classes in \(G\) and Belyi's theorem (every curve defined over \(\bar{\mathbb{Q}}\) is a cover of \(\mathbb{P}^1\) ramified only at \(\{0, 1, \infty\}\)) to construct extensions of \(\mathbb{Q}(t)\) with Galois group \(G\), then specialise.

**Class field theory and the Langlands program.** Class field theory gives a complete description of all **abelian** extensions of a number field \(K\): they are classified by subgroups of the idèle class group \(\mathbb{A}_K^\times / K^\times\) via the Artin reciprocity map. This is one of the great theorems of 20th-century mathematics, unifying quadratic reciprocity, the theory of cyclotomic fields, and complex multiplication. The **Langlands program** (formulated by Robert Langlands in a 1967 letter to André Weil) proposes a vast non-abelian generalisation: a conjectural correspondence between \(n\)-dimensional representations \(\rho: \text{Gal}(\bar{K}/K) \to GL_n(\mathbb{C})\) and **automorphic representations** of \(GL_n(\mathbb{A}_K)\). For \(n = 1\), this is class field theory (Artin's reciprocity map). For \(n = 2\), it contains the modularity theorem (every elliptic curve over \(\mathbb{Q}\) is modular) as a special case, which was used by Wiles and Taylor–Wiles to prove Fermat's Last Theorem (1994). The full Langlands program in dimension 2 is largely proved (Langlands–Tunnell, Wiles, Taylor, Breuil–Conrad–Diamond–Taylor for \(\mathbb{Q}\); Blasco–Laumon–Rapoport–Stuhler over function fields). For \(n \geq 3\), substantial progress has been made through the **Langlands–Shahidi method** and **trace formula** approach (Arthur), but the general case remains open. The geometric Langlands program, proved over function fields in characteristic zero by Fargues–Scholze (2021) using perfectoid spaces, represents one of the most spectacular recent advances.

**The \(abc\) conjecture.** Let \(a, b, c\) be coprime positive integers with \(a + b = c\). The **radical** of \(abc\) is \(\text{rad}(abc) = \prod_{p \mid abc} p\) (the product of the distinct prime factors). The \(abc\) conjecture (Oesterlé–Masser, 1985) asserts: for all \(\varepsilon > 0\), there are only finitely many coprime triples with \(c > \text{rad}(abc)^{1+\varepsilon}\). Equivalently, \(c < C_\varepsilon \cdot \text{rad}(abc)^{1+\varepsilon}\) for an explicit constant \(C_\varepsilon\). The conjecture is deceptively simple but has enormous consequences: it implies Fermat's Last Theorem for all but finitely many exponents (without Wiles's machinery), Roth's theorem on rational approximations of algebraic numbers, Szpiro's conjecture on elliptic curve discriminants (linking the height of an elliptic curve to its conductor), and many other results in Diophantine geometry. In 2012, Shinichi Mochizuki posted a series of four papers totalling \(\sim\)600 pages purporting to prove the \(abc\) conjecture using his **inter-universal Teichmüller theory (IUT)**, a framework so novel that it essentially redefined the foundations of arithmetic geometry. After years of attempted verification, Scholze and Stix (2018) identified what they consider a fundamental gap in Lemma 3.12 of the third paper. Mochizuki disputes this assessment. As of 2026, the mathematical community has not reached consensus, and the \(abc\) conjecture is officially open.

**Hilbert's 14th problem and invariant theory.** Let \(k\) be an algebraically closed field, \(G \leq GL_n(k)\) a subgroup acting on the polynomial ring \(k[x_1, \ldots, x_n]\) by linear substitution. The **ring of invariants** is \(k[x_1,\ldots,x_n]^G = \{f : g \cdot f = f \text{ for all } g \in G\}\). Hilbert proved (1890, using his Basis Theorem) that this ring is finitely generated when \(G = GL_n\) or \(G = SL_n\) — and his proof was a landmark in the transition from explicit computations to abstract existence arguments. His 14th problem asked whether the invariant ring is always finitely generated. Nagata (1959) found a counterexample: a specific non-reductive group action on \(\mathbb{A}^{32}\) whose invariant ring is not finitely generated. The problem of characterising which group actions give finitely generated invariants — and algorithmically computing generators when they exist (Gröbner basis methods, SAGBI bases) — remains active. **Geometric invariant theory (GIT)**, developed by Mumford, handles the case of reductive groups and is the foundation for constructing moduli spaces in algebraic geometry.

**Constructive algebra and formalisation.** The proofs in PMATH 334 make multiple uses of the axiom of choice — Zorn's lemma for the existence of maximal ideals (every proper ideal is contained in a maximal ideal), for algebraic closures (every field has an algebraic closure), and for bases of infinite-dimensional vector spaces. **Constructive algebra** (following Bishop and Richman) asks for explicit constructions: given a commutative ring with a decidable equality, can one compute the prime ideal spectrum, the Gröbner basis, or the class group? In many cases the answer is yes, but the proofs require different techniques from those using AC. In **homotopy type theory (HoTT)** and formal proof assistants (Lean 4's Mathlib, Coq's Mathematical Components), formalising the algebraic hierarchy — magma, monoid, group, ring, domain, PID, field — has become an active research programme. The Lean Mathlib library now contains proofs of the Sylow theorems, Galois theory, and Dedekind domains; formalising the class number formula and the full Langlands correspondence are longer-term goals. This research area connects abstract algebra to the foundations of mathematics, to formal verification of software (cryptographic implementations verified against algebraic specifications), and to automated theorem proving — an area where LLM-based tools are beginning to make contributions.

**The Birch and Swinnerton-Dyer conjecture.** Closely connected to the PMATH 334 material on field extensions and the later material on elliptic curves, the BSD conjecture is one of the seven Clay Millennium Problems (\$1 million prize). For an elliptic curve \(E\) over \(\mathbb{Q}\), the rank \(r\) of the Mordell–Weil group \(E(\mathbb{Q}) \cong \mathbb{Z}^r \oplus T_{\text{tors}}\) is predicted to equal the order of vanishing of the \(L\)-function \(L(E, s)\) at \(s = 1\). The BSD conjecture further gives an explicit formula for the leading coefficient of \(L(E,s)\) near \(s=1\) in terms of the real period, the Shafarevich–Tate group, the Tamagawa numbers, and the regulator. Kolyvagin (1990) proved that if \(L(E,1) \neq 0\) then \(r = 0\); Gross–Zagier (1986) proved that if \(L(E,1) = 0\) and \(L'(E,1) \neq 0\) then \(r = 1\). The case of rank \(\geq 2\) is essentially open. Computationally, there exist elliptic curves with rank as high as 28 (found by Elkies), but the BSD conjecture, which predicts the rank from the \(L\)-function without explicit computation of rational points, has not been proved for any single curve of rank \(\geq 2\).

**Transcendence theory.** PMATH 334 studies algebraic extensions — extensions generated by roots of polynomials over a base field. A complementary direction is **transcendence theory**: determining which real and complex numbers are transcendental (not algebraic over \(\mathbb{Q}\)). Liouville (1844) gave the first explicit transcendental numbers; Hermite (1873) proved \(e\) is transcendental; Lindemann (1882) proved \(\pi\) is transcendental (implying the impossibility of squaring the circle). The **Lindemann–Weierstrass theorem** states: if \(\alpha_1, \ldots, \alpha_n\) are distinct algebraic numbers, then \(e^{\alpha_1}, \ldots, e^{\alpha_n}\) are linearly independent over \(\mathbb{Q}\). **Baker's theorem** (1966) extended this to linear forms in logarithms of algebraic numbers with algebraic coefficients, giving explicit lower bounds for \(|b_1 \log \alpha_1 + \cdots + b_n \log \alpha_n| > 0\) when the \(\alpha_i\) are algebraic and the \(b_i\) are integers not all zero. Baker was awarded the Fields Medal (1970) for this work, which has applications to Diophantine equations (bounding solutions to Thue equations), Baker's theorem is one of the cornerstones of **effective Diophantine geometry** — where one wants not just to know that equations have finitely many solutions but to bound them effectively. Whether \(e + \pi\) or \(e \cdot \pi\) is transcendental is unknown; whether \(\Gamma(1/3)\) is transcendental is unknown (it is expected to be, and is known not to be Liouville). The interaction between transcendence theory and the field extensions of PMATH 334 runs through **Schanuel's conjecture**: if \(z_1, \ldots, z_n \in \mathbb{C}\) are linearly independent over \(\mathbb{Q}\), then the transcendence degree of \(\mathbb{Q}(z_1, \ldots, z_n, e^{z_1}, \ldots, e^{z_n})\) over \(\mathbb{Q}\) is at least \(n\). This single conjecture would imply Lindemann–Weierstrass, Baker's theorem, and the algebraic independence of \(e\) and \(\pi\) — but it remains wide open.
