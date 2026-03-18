---
title: "PMATH 348 — Fields and Galois Theory"
prof: "Yu-Ru Liu"
---

## Introduction: Why Galois Theory?

The central question motivating this course is an old one: given a polynomial equation, can its roots be expressed using only the arithmetic operations of addition, subtraction, multiplication, and division together with the extraction of <span>&#92;(n&#92;)</span>th roots? An expression built from these five operations is called a **radical**. The quadratic formula shows that every quadratic equation is solvable by radicals, and analogous formulas — Cardano's formula for cubics and Ferrari's method for quartics — show the same is true for degrees three and four. The natural question is whether such a formula exists for degree five.

By changing variables, any cubic can be reduced to the depressed form <span>&#92;(x^3 + px = q&#92;)</span>, and through the independent work of del Ferro, Tartaglia, and Fontana — with the solution published by Cardano in *Ars Magna* — the solution is

<span>&#92;[ x = &#92;sqrt[3]{&#92;frac{q}{2} + &#92;sqrt{&#92;frac{p^3}{27} + &#92;frac{q^2}{4}}} + &#92;sqrt[3]{&#92;frac{q}{2} - &#92;sqrt{&#92;frac{p^3}{27} + &#92;frac{q^2}{4}}} &#92;]</span>

Ferrari extended this to quartic equations by reducing them to cubics. Since radical solutions exist for degrees up to four, it is natural to seek one for degree five. However, attempts by Euler, Bézout, and Lagrange all failed. Lagrange noticed that the roots of equations of degree at most four are preserved under certain permutations, but this property fails for quintics — a first hint that something fundamentally different happens at degree five. In 1799, Ruffini gave a 500-page proof of insolvability, though with a gap. In 1824, Abel filled the gap and completed the **Abel-Ruffini theorem**: the general quintic is not solvable by radicals.

But this raises a sharper question: given a *specific* polynomial of degree five, is it solvable by radicals? Galois theory answers this by reversing the question: *suppose* a radical solution exists — what must the polynomial look like?

The Galois approach proceeds in two steps. Given a root <span>&#92;(&#92;alpha&#92;)</span> of a polynomial, we first pass from the element <span>&#92;(&#92;alpha&#92;)</span> to the **field** <span>&#92;(&#92;mathbb{Q}(&#92;alpha)&#92;)</span>, the smallest field containing <span>&#92;(&#92;mathbb{Q}&#92;)</span> and <span>&#92;(&#92;alpha&#92;)</span>. A field has far more algebraic structure than a single element, but our knowledge of <span>&#92;(&#92;mathbb{Q}(&#92;alpha)&#92;)</span> is still limited — for instance, we may not know how many intermediate fields <span>&#92;(E&#92;)</span> sit between <span>&#92;(&#92;mathbb{Q}&#92;)</span> and <span>&#92;(&#92;mathbb{Q}(&#92;alpha)&#92;)</span>. We then take the second step: we associate <span>&#92;(&#92;mathbb{Q}(&#92;alpha)&#92;)</span> to a **group**, specifically the automorphism group <span>&#92;(&#92;text{Aut}&#95;{&#92;mathbb{Q}}(&#92;mathbb{Q}(&#92;alpha))&#92;)</span> consisting of all field isomorphisms from <span>&#92;(&#92;mathbb{Q}(&#92;alpha)&#92;)</span> to itself that fix every element of <span>&#92;(&#92;mathbb{Q}&#92;)</span>. When <span>&#92;(&#92;alpha&#92;)</span> is algebraic, this group is finite. The fundamental theorem of Galois theory then establishes a perfect correspondence between intermediate fields and subgroups of this automorphism group. The infinite problem of classifying field extensions is thus transformed into the finite problem of classifying subgroups of a group — and this simplification makes many ancient puzzles tractable.

In the words of Prof. Liu: *Galois theory is an interplay between fields and groups. It transforms an infinite field question into a finite group problem. Welcome to PMATH 348 — a journey between finiteness and infiniteness.*

---

## Chapter 1: Ring Theory

This chapter reviews the ring theory needed throughout the course and proves Eisenstein's criterion, a powerful tool for establishing irreducibility of polynomials.

### 1.1 Review of Ring Theory

A **commutative ring with 1** (or simply **ring** in this course) is a set <span>&#92;(R&#92;)</span> with addition and multiplication such that <span>&#92;((R,+)&#92;)</span> is an abelian group with identity <span>&#92;(0&#92;)</span>, multiplication is commutative and associative with identity <span>&#92;(1&#92;)</span>, and the distributive law holds. A **field** is a ring in which every non-zero element has a multiplicative inverse. An **integral domain** is a ring in which the product of two non-zero elements is non-zero.

<div class="example">
<strong>Example.</strong> The integers <span>&#92;(&#92;mathbb{Z}&#92;)</span> form an integral domain. The rationals <span>&#92;(&#92;mathbb{Q}&#92;)</span>, reals <span>&#92;(&#92;mathbb{R}&#92;)</span>, complex numbers <span>&#92;(&#92;mathbb{C}&#92;)</span>, and integers modulo a prime <span>&#92;(&#92;mathbb{Z}&#95;p&#92;)</span> are all fields.
</div>

A key observation is that the only ideals of a field <span>&#92;(F&#92;)</span> are <span>&#92;(&#92;{0&#92;}&#92;)</span> and <span>&#92;(F&#92;)</span> itself. Consequently, if <span>&#92;(&#92;phi: F &#92;to S&#92;)</span> is a ring homomorphism from a field to a ring, then <span>&#92;(&#92;phi&#92;)</span> is either injective or identically zero. An integral domain <span>&#92;(R&#92;)</span> is a **principal ideal domain (PID)** if every ideal is generated by a single element.

The polynomial ring <span>&#92;(F[x]&#92;)</span> and the integers <span>&#92;(&#92;mathbb{Z}&#92;)</span> are closely parallel. Both are PIDs. The units of <span>&#92;(&#92;mathbb{Z}&#92;)</span> are <span>&#92;(&#92;{&#92;pm 1&#92;}&#92;)</span>, while the units of <span>&#92;(F[x]&#92;)</span> are the non-zero constants <span>&#92;(F^&#42; = F &#92;setminus &#92;{0&#92;}&#92;)</span>. The equivalence classes of non-zero elements modulo units are the positive integers in <span>&#92;(&#92;mathbb{Z}&#92;)</span> and the monic polynomials in <span>&#92;(F[x]&#92;)</span>. The field of fractions of <span>&#92;(&#92;mathbb{Z}&#92;)</span> is <span>&#92;(&#92;mathbb{Q}&#92;)</span>, and the field of fractions of <span>&#92;(F[x]&#92;)</span> is the **field of rational functions** <span>&#92;(F(x) = &#92;{f(x)/g(x) : f,g &#92;in F[x],\, g &#92;neq 0&#92;}&#92;)</span>.

For the quotient ring <span>&#92;(R/I&#92;)</span>, elements have the form <span>&#92;(r + I&#92;)</span> with addition and multiplication inherited from <span>&#92;(R&#92;)</span>. For <span>&#92;(n &#92;in &#92;mathbb{Z}&#92;)</span>, we have <span>&#92;(&#92;mathbb{Z}/&#92;langle n &#92;rangle = &#92;{0, 1, &#92;ldots, |n|-1&#92;}&#92;)</span>. The quotient <span>&#92;(R/I&#92;)</span> is a domain if and only if <span>&#92;(I&#92;)</span> is a prime ideal, and a field if and only if <span>&#92;(I&#92;)</span> is a maximal ideal.

### 1.2 Gauss's Lemma and Eisenstein's Criterion

A polynomial <span>&#92;(f(x) &#92;in R[x]&#92;)</span> is **irreducible** over <span>&#92;(R&#92;)</span> if it is non-constant and cannot be written as a product of two polynomials of lower degree in <span>&#92;(R[x]&#92;)</span>.

<div class="theorem">
<strong>Theorem (Gauss's Lemma).</strong> Let <span>&#92;(f(x) &#92;in &#92;mathbb{Z}[x]&#92;)</span> with <span>&#92;(&#92;deg(f) &#92;geq 1&#92;)</span>. If <span>&#92;(f(x)&#92;)</span> is irreducible in <span>&#92;(&#92;mathbb{Z}[x]&#92;)</span>, then it is irreducible in <span>&#92;(&#92;mathbb{Q}[x]&#92;)</span>.
</div>

<div class="theorem">
<strong>Theorem (Eisenstein's Criterion).</strong> Let <span>&#92;(f(x) = a&#95;n x^n + a&#95;{n-1} x^{n-1} + &#92;cdots + a&#95;0 &#92;in &#92;mathbb{Z}[x]&#92;)</span> and let <span>&#92;(p&#92;)</span> be a prime. If
- <span>&#92;(p &#92;nmid a&#95;n&#92;)</span>,
- <span>&#92;(p &#92;mid a&#95;i&#92;)</span> for all <span>&#92;(0 &#92;leq i &#92;leq n-1&#92;)</span>, and
- <span>&#92;(p^2 &#92;nmid a&#95;0&#92;)</span>,

then <span>&#92;(f(x)&#92;)</span> is irreducible in <span>&#92;(&#92;mathbb{Q}[x]&#92;)</span>.
</div>

To sketch the proof: map <span>&#92;(f(x)&#92;)</span> to <span>&#92;(&#92;bar{f}(x) &#92;in &#92;mathbb{Z}&#95;p[x]&#92;)</span> by reducing coefficients modulo <span>&#92;(p&#92;)</span>. By the conditions on coefficients, <span>&#92;(&#92;bar{f}(x) = &#92;bar{a}&#95;n x^n&#92;)</span> — only the leading term survives. If <span>&#92;(f(x)&#92;)</span> were reducible in <span>&#92;(&#92;mathbb{Q}[x]&#92;)</span>, an application of Gauss's Lemma would force <span>&#92;(p^2 &#92;mid a&#95;0&#92;)</span>, contradicting the hypothesis. Eisenstein's criterion generalises to unique factorization domains.

<div class="example">
<strong>Example.</strong> The polynomial <span>&#92;(f(x) = x^4 + x^3 + x^2 + x + 1 &#92;in &#92;mathbb{Q}[x]&#92;)</span> (the 5th cyclotomic polynomial) is irreducible. Setting <span>&#92;(g(x) = f(x+1)&#92;)</span> and applying Eisenstein with <span>&#92;(p = 5&#92;)</span> shows <span>&#92;(g(x)&#92;)</span> is irreducible, hence so is <span>&#92;(f(x)&#92;)</span>.
</div>

---

## Chapter 2: Field Extensions

This chapter develops the theory of field extensions, with particular focus on distinguishing extensions generated by algebraic elements from those generated by transcendental elements.

### 2.1 Degree of Extensions

<div class="definition">
<strong>Definition.</strong> If <span>&#92;(E&#92;)</span> is a field containing another field <span>&#92;(F&#92;)</span>, we say <span>&#92;(E&#92;)</span> is a <strong>field extension</strong> of <span>&#92;(F&#92;)</span>, written <span>&#92;(E/F&#92;)</span>. (This notation does not denote a quotient ring — fields have only trivial ideals.)
</div>

If <span>&#92;(E/F&#92;)</span> is a field extension, we can view <span>&#92;(E&#92;)</span> as a vector space over <span>&#92;(F&#92;)</span>, where addition is that of <span>&#92;(E&#92;)</span> and scalar multiplication is the restriction of multiplication in <span>&#92;(E&#92;)</span> to <span>&#92;(F &#92;times E&#92;)</span>.

<div class="definition">
<strong>Definition.</strong> The <strong>degree</strong> of <span>&#92;(E/F&#92;)</span>, written <span>&#92;([E:F]&#92;)</span>, is the dimension of <span>&#92;(E&#92;)</span> as an <span>&#92;(F&#92;)</span>-vector space. If <span>&#92;([E:F] < &#92;infty&#92;)</span>, we say <span>&#92;(E/F&#92;)</span> is a <strong>finite extension</strong>; otherwise an <strong>infinite extension</strong>.
</div>

<div class="example">
<strong>Example.</strong> <span>&#92;([&#92;mathbb{C}:&#92;mathbb{R}] = 2&#92;)</span>, since <span>&#92;(&#92;mathbb{C} &#92;cong &#92;mathbb{R} + &#92;mathbb{R}i&#92;)</span>. On the other hand, <span>&#92;([F(x):F] = &#92;infty&#92;)</span> since <span>&#92;(&#92;{1, x, x^2, &#92;ldots&#92;}&#92;)</span> are linearly independent over <span>&#92;(F&#92;)</span>.
</div>

<div class="theorem">
<strong>Theorem 2.1.1 (Tower Law).</strong> If <span>&#92;(E/K&#92;)</span> and <span>&#92;(K/F&#92;)</span> are finite extensions, then <span>&#92;(E/F&#92;)</span> is finite and <span>&#92;[[E:F] = [E:K] &#92;cdot [K:F].&#92;]</span> In particular, <span>&#92;([K:F]&#92;)</span> divides <span>&#92;([E:F]&#92;)</span> whenever <span>&#92;(K&#92;)</span> is intermediate.
</div>

*Proof sketch.* Suppose <span>&#92;([E:K] = m&#92;)</span> and <span>&#92;([K:F] = n&#92;)</span>, with bases <span>&#92;(&#92;{a&#95;1, &#92;ldots, a&#95;m&#92;}&#92;)</span> for <span>&#92;(E/K&#92;)</span> and <span>&#92;(&#92;{b&#95;1, &#92;ldots, b&#95;n&#92;}&#92;)</span> for <span>&#92;(K/F&#92;)</span>. One verifies that <span>&#92;(&#92;{a&#95;i b&#95;j : 1 &#92;leq i &#92;leq m,&#92; 1 &#92;leq j &#92;leq n&#92;}&#92;)</span> is a basis of <span>&#92;(E/F&#92;)</span>, giving <span>&#92;([E:F] = mn&#92;)</span>. ∎

### 2.2 Algebraic and Transcendental Extensions

<div class="definition">
<strong>Definition.</strong> Let <span>&#92;(E/F&#92;)</span> be a field extension and <span>&#92;(&#92;alpha &#92;in E&#92;)</span>. We say <span>&#92;(&#92;alpha&#92;)</span> is <strong>algebraic over</strong> <span>&#92;(F&#92;)</span> if there exists a non-zero <span>&#92;(f(x) &#92;in F[x]&#92;)</span> with <span>&#92;(f(&#92;alpha) = 0&#92;)</span>. Otherwise <span>&#92;(&#92;alpha&#92;)</span> is <strong>transcendental over</strong> <span>&#92;(F&#92;)</span>.
</div>

<div class="example">
<strong>Example.</strong> The numbers <span>&#92;(&#92;sqrt{2}&#92;)</span> and <span>&#92;(&#92;sqrt[3]{2} + &#92;sqrt{2}&#92;)</span> are algebraic over <span>&#92;(&#92;mathbb{Q}&#92;)</span>. The numbers <span>&#92;(e&#92;)</span> (Hermite, 1873) and <span>&#92;(&#92;pi&#92;)</span> (Lindemann, 1882) are transcendental over <span>&#92;(&#92;mathbb{Q}&#92;)</span>.
</div>

We also use the notion of an **<span>&#92;(F&#92;)</span>-homomorphism**: given rings <span>&#92;(R, R&#95;1&#92;)</span> both containing <span>&#92;(F&#92;)</span>, a ring homomorphism <span>&#92;(&#92;psi: R &#92;to R&#95;1&#92;)</span> is an <span>&#92;(F&#92;)</span>-homomorphism if its restriction to <span>&#92;(F&#92;)</span> is the identity map.

<div class="theorem">
<strong>Theorem 2.2.1.</strong> Let <span>&#92;(E/F&#92;)</span> be a field extension and <span>&#92;(&#92;alpha &#92;in E&#92;)</span> transcendental over <span>&#92;(F&#92;)</span>. Then <span>&#92;(F[&#92;alpha] &#92;cong F[x]&#92;)</span> and <span>&#92;(F(&#92;alpha) &#92;cong F(x)&#92;)</span>. In particular, <span>&#92;(F[&#92;alpha] &#92;neq F(&#92;alpha)&#92;)</span>.
</div>

*Proof sketch.* The <span>&#92;(F&#92;)</span>-homomorphism <span>&#92;(&#92;psi: F(x) &#92;to F(&#92;alpha)&#92;)</span> mapping <span>&#92;(f(x)/g(x) &#92;mapsto f(&#92;alpha)/g(&#92;alpha)&#92;)</span> is well-defined because <span>&#92;(&#92;alpha&#92;)</span> is transcendental (so <span>&#92;(g(&#92;alpha) &#92;neq 0&#92;)</span> for <span>&#92;(g &#92;neq 0&#92;)</span>). One shows it is an isomorphism. ∎

<div class="theorem">
<strong>Theorem 2.2.2.</strong> Let <span>&#92;(E/F&#92;)</span> be a field extension and <span>&#92;(&#92;alpha &#92;in E&#92;)</span> algebraic over <span>&#92;(F&#92;)</span>. Then there exists a unique monic irreducible polynomial <span>&#92;(p(x) &#92;in F[x]&#92;)</span> such that <span>&#92;[F[x]/&#92;langle p(x) &#92;rangle &#92;cong F[&#92;alpha] = F(&#92;alpha).&#92;]</span> The polynomial <span>&#92;(p(x)&#92;)</span> is called the <strong>minimal polynomial of <span>&#92;(&#92;alpha&#92;)</span> over <span>&#92;(F&#92;)</span></strong>.
</div>

*Proof sketch.* Consider the <span>&#92;(F&#92;)</span>-homomorphism <span>&#92;(&#92;psi: F[x] &#92;to F(&#92;alpha)&#92;)</span> mapping <span>&#92;(x &#92;mapsto &#92;alpha&#92;)</span>. Since <span>&#92;(&#92;alpha&#92;)</span> is algebraic, <span>&#92;(&#92;ker(&#92;psi) &#92;neq 0&#92;)</span>. Since <span>&#92;(F[x]/\ker(&#92;psi) &#92;cong &#92;text{Im}(&#92;psi)&#92;)</span> is a subring of a field, <span>&#92;(\ker(&#92;psi)&#92;)</span> is a prime ideal. Since <span>&#92;(F[x]&#92;)</span> is a PID, the kernel is generated by an irreducible polynomial <span>&#92;(p(x)&#92;)</span>; taking <span>&#92;(p(x)&#92;)</span> monic ensures uniqueness. ∎

**Corollary.** If <span>&#92;(p(x)&#92;)</span> is the minimal polynomial of <span>&#92;(&#92;alpha&#92;)</span> over <span>&#92;(F&#92;)</span> with <span>&#92;(&#92;deg(p) = n&#92;)</span>, then <span>&#92;([F(&#92;alpha):F] = n&#92;)</span>. This explains why the degree of <span>&#92;(F(&#92;alpha)/F&#92;)</span> equals the degree of the minimal polynomial — and why we call the vector space dimension the "degree" of the extension.

Furthermore, if <span>&#92;(E/F&#92;)</span> is a finite extension, then by induction there exist <span>&#92;(&#92;alpha&#95;1, &#92;ldots, &#92;alpha&#95;n &#92;in E&#92;)</span> such that <span>&#92;(E = F(&#92;alpha&#95;1, &#92;ldots, &#92;alpha&#95;n)&#92;)</span>, and every finite extension is a tower of simple extensions. A field extension <span>&#92;(E/F&#92;)</span> is **algebraic** if every element of <span>&#92;(E&#92;)</span> is algebraic over <span>&#92;(F&#92;)</span>; it is **transcendental** otherwise.

<div class="theorem">
<strong>Theorem.</strong> Every finite extension is algebraic.
</div>

*Proof sketch.* If <span>&#92;([E:F] = n&#92;)</span> and <span>&#92;(&#92;alpha &#92;in E&#92;)</span>, then the <span>&#92;(n+1&#92;)</span> elements <span>&#92;(1, &#92;alpha, &#92;alpha^2, &#92;ldots, &#92;alpha^n&#92;)</span> cannot be linearly independent over <span>&#92;(F&#92;)</span>, so there exist coefficients giving a polynomial with <span>&#92;(&#92;alpha&#92;)</span> as a root. ∎

<div class="definition">
<strong>Definition.</strong> Let <span>&#92;(E/F&#92;)</span> be a field extension. The <strong>algebraic closure of <span>&#92;(F&#92;)</span> in <span>&#92;(E&#92;)</span></strong> is <span>&#92;(L = &#92;{&#92;alpha &#92;in E : &#92;alpha &#92;text{ is algebraic over } F&#92;}&#92;)</span>. One can show <span>&#92;(L&#92;)</span> is a subfield of <span>&#92;(E&#92;)</span>. A field <span>&#92;(F&#92;)</span> is <strong>algebraically closed</strong> if every algebraic extension of <span>&#92;(F&#92;)</span> equals <span>&#92;(F&#92;)</span>.
</div>

---

## Chapter 3: Splitting Fields

This chapter introduces splitting fields — the natural home for all roots of a given polynomial — and proves their existence and uniqueness.

### 3.1 Splitting Fields: Definitions and Existence

<div class="definition">
<strong>Definition.</strong> Let <span>&#92;(E/F&#92;)</span> be a field extension and <span>&#92;(f(x) &#92;in F[x]&#92;)</span>. We say <span>&#92;(f(x)&#92;)</span> <strong>splits over</strong> <span>&#92;(E&#92;)</span> if <span>&#92;(E&#92;)</span> contains all roots of <span>&#92;(f(x)&#92;)</span>, i.e., <span>&#92;(f(x) = a(x - &#92;alpha&#95;1)(x - &#92;alpha&#95;2) &#92;cdots (x - &#92;alpha&#95;n)&#92;)</span> with all <span>&#92;(&#92;alpha&#95;i &#92;in E&#92;)</span>.
</div>

<div class="definition">
<strong>Definition.</strong> Let <span>&#92;(&#92;tilde{E}/F&#92;)</span> be a field extension and <span>&#92;(f(x) &#92;in F[x]&#92;)</span>. A field <span>&#92;(E&#92;)</span> with <span>&#92;(F &#92;subseteq E &#92;subseteq &#92;tilde{E}&#92;)</span> is a <strong>splitting field of <span>&#92;(f(x)&#92;)</span> in <span>&#92;(&#92;tilde{E}&#92;)</span></strong> if <span>&#92;(f(x)&#92;)</span> splits over <span>&#92;(E&#92;)</span> but over no proper subfield of <span>&#92;(E&#92;)</span> containing <span>&#92;(F&#92;)</span>.
</div>

To prove existence, we first need to find a field extension containing at least one root of a given irreducible polynomial.

<div class="theorem">
<strong>Theorem (Kronecker's Construction).</strong> Let <span>&#92;(p(x) &#92;in F[x]&#92;)</span> be irreducible. Then <span>&#92;(E = F[x]/&#92;langle p(x) &#92;rangle&#92;)</span> is a field containing <span>&#92;(F&#92;)</span> and a root <span>&#92;(&#92;alpha = x + &#92;langle p(x) &#92;rangle&#92;)</span> of <span>&#92;(p(x)&#92;)</span>.
</div>

*Proof sketch.* Since <span>&#92;(p(x)&#92;)</span> is irreducible, the ideal <span>&#92;(I = &#92;langle p(x) &#92;rangle&#92;)</span> is maximal, so <span>&#92;(E = F[x]/I&#92;)</span> is a field. The map <span>&#92;(a &#92;mapsto a + I&#92;)</span> is an injective ring homomorphism from <span>&#92;(F&#92;)</span> to <span>&#92;(E&#92;)</span>, so <span>&#92;(F&#92;)</span> embeds as a subfield. Since <span>&#92;(I = &#92;langle p(x) &#92;rangle&#92;)</span>, the element <span>&#92;(&#92;alpha = x + I&#92;)</span> satisfies <span>&#92;(p(&#92;alpha) = 0&#92;)</span>. ∎

By applying Kronecker's theorem repeatedly (inductively), we obtain:

<div class="theorem">
<strong>Theorem (Kronecker, 1887).</strong> For any <span>&#92;(f(x) &#92;in F[x]&#92;)</span>, there exists a field extension <span>&#92;(E/F&#92;)</span> such that <span>&#92;(f(x)&#92;)</span> splits over <span>&#92;(E&#92;)</span).
</div>

**Corollary.** Every polynomial <span>&#92;(f(x) &#92;in F[x]&#92;)</span> has a splitting field, which is a finite extension of <span>&#92;(F&#92;)</span>. Explicitly, if <span>&#92;(&#92;alpha&#95;1, &#92;ldots, &#92;alpha&#95;n&#92;)</span> are the roots of <span>&#92;(f(x)&#92;)</span> in some extension, then <span>&#92;(F(&#92;alpha&#95;1, &#92;ldots, &#92;alpha&#95;n)&#92;)</span> is the splitting field.

### 3.2 Uniqueness of Splitting Fields

To prove uniqueness, we need to understand how field isomorphisms extend to polynomial rings.

<div class="definition">
<strong>Definition.</strong> If <span>&#92;(&#92;phi: R &#92;to R&#95;1&#92;)</span> is a ring homomorphism, the unique ring homomorphism <span>&#92;(&#92;Phi: R[x] &#92;to R&#95;1[x]&#92;)</span> satisfying <span>&#92;(&#92;Phi|&#95;R = &#92;phi&#92;)</span> and <span>&#92;(&#92;Phi(x) = x&#92;)</span> is said to <strong>extend</strong> <span>&#92;(&#92;phi&#92;)</span>.
</div>

<div class="theorem">
<strong>Theorem 3.2.1.</strong> Let <span>&#92;(&#92;phi: F &#92;to F&#95;1&#92;)</span> be a field isomorphism, <span>&#92;(f(x) &#92;in F[x]&#92;)</span>, and <span>&#92;(&#92;Phi: F[x] &#92;to F&#95;1[x]&#92;)</span> the extension of <span>&#92;(&#92;phi&#92;)</span>. Let <span>&#92;(f&#95;1(x) = &#92;Phi(f(x))&#92;)</span>. If <span>&#92;(E/F&#92;)</span> and <span>&#92;(E&#95;1/F&#95;1&#92;)</span> are splitting fields of <span>&#92;(f(x)&#92;)</span> and <span>&#92;(f&#95;1(x)&#92;)</span> respectively, then <span>&#92;(E &#92;cong E&#95;1&#92;)</span>.
</div>

**Corollary (Uniqueness).** Taking <span>&#92;(&#92;phi = &#92;text{id}&#95;F&#92;)</span>, any two splitting fields of <span>&#92;(f(x) &#92;in F[x]&#92;)</span> over <span>&#92;(F&#92;)</span> are <span>&#92;(F&#92;)</span>-isomorphic.

### 3.3 Degree of Splitting Fields

<div class="theorem">
<strong>Theorem 3.3.1.</strong> If <span>&#92;(f(x) &#92;in F[x]&#92;)</span> has degree <span>&#92;(n&#92;)</span> and <span>&#92;(E/F&#92;)</span> is its splitting field, then <span>&#92;([E:F]&#92;)</span> divides <span>&#92;(n!&#92;)</span>.
</div>

*Proof sketch.* By induction on <span>&#92;(n = &#92;deg(f)&#92;)</span>. If <span>&#92;(f(x)&#92;)</span> is irreducible and <span>&#92;(&#92;alpha &#92;in E&#92;)</span> is a root, then <span>&#92;([F(&#92;alpha):F] = n&#92;)</span>. The splitting field of <span>&#92;(f(x)/(x - &#92;alpha)&#92;)</span> over <span>&#92;(F(&#92;alpha)&#92;)</span> has degree dividing <span>&#92;((n-1)!&#92;)</span> by induction, so <span>&#92;([E:F] = n &#92;cdot [E:F(&#92;alpha)]&#92;)</span> divides <span>&#92;(n!&#92;)</span>. If <span>&#92;(f = gh&#92;)</span> with <span>&#92;(&#92;deg(g) = m&#92;)</span> and <span>&#92;(&#92;deg(h) = k&#92;)</span> where <span>&#92;(m + k = n&#92;)</span>, then <span>&#92;([E:F]&#92;)</span> divides <span>&#92;(m! &#92;cdot k!&#92;)</span>, which divides <span>&#92;(n!&#92;)</span>. ∎

---

## Chapter 4: Characteristic and Prime Fields

This chapter introduces the characteristic of a field, prime fields, derivatives in positive characteristic, finite fields, and separable polynomials.

### 4.1 Prime Fields and Characteristic

<div class="definition">
<strong>Definition.</strong> Given a field <span>&#92;(F&#92;)</span>, its <strong>prime field</strong> is the intersection of all subfields of <span>&#92;(F&#92;)</span>. The <strong>characteristic</strong> of <span>&#92;(F&#92;)</span>, written <span>&#92;(&#92;text{ch}(F)&#92;)</span>, is defined as follows: if the prime field is <span>&#92;(&#92;mathbb{Q}&#92;)</span>, then <span>&#92;(&#92;text{ch}(F) = 0&#92;)</span>; if the prime field is <span>&#92;(&#92;mathbb{Z}&#95;p&#92;)</span> for a prime <span>&#92;(p&#92;)</span>, then <span>&#92;(&#92;text{ch}(F) = p&#92;)</span>.
</div>

<div class="theorem">
<strong>Theorem.</strong> There are only two types of prime fields: either <span>&#92;(&#92;mathbb{Q}&#92;)</span> or <span>&#92;(&#92;mathbb{Z}&#95;p&#92;)</span> for a prime <span>&#92;(p&#92;)</span>.
</div>

*Proof sketch.* Let <span>&#92;(F&#95;1&#92;)</span> be a subfield of <span>&#92;(F&#92;)</span>. Consider the ring map <span>&#92;(&#92;chi: &#92;mathbb{Z} &#92;to F&#95;1&#92;)</span> sending <span>&#92;(n &#92;mapsto n &#92;cdot 1&#95;{F&#95;1}&#92;)</span>. The image is a subring of a field, hence an integral domain, so <span>&#92;(I = &#92;ker(&#92;chi)&#92;)</span> is a prime ideal of <span>&#92;(&#92;mathbb{Z}&#92;)</span>. If <span>&#92;(I = 0&#92;)</span>, then <span>&#92;(&#92;mathbb{Z} &#92;hookrightarrow F&#95;1&#92;)</span> and <span>&#92;(&#92;mathbb{Q} &#92;subseteq F&#95;1&#92;)</span>. If <span>&#92;(I = &#92;langle p &#92;rangle&#92;)</span> for a prime <span>&#92;(p&#92;)</span>, then <span>&#92;(&#92;mathbb{Z}&#95;p &#92;subseteq F&#95;1&#92;)</span>. ∎

### 4.2 Derivatives and Repeated Roots

Taking formal derivatives is straightforward in characteristic zero, but behaves differently in characteristic <span>&#92;(p&#92;)</span>.

<div class="theorem">
<strong>Theorem.</strong> Let <span>&#92;(F&#92;)</span> be a field and <span>&#92;(f(x) &#92;in F[x]&#92;)</span>.
- If <span>&#92;(&#92;text{ch}(F) = 0&#92;)</span>, then <span>&#92;(f'(x) = 0&#92;)</span> if and only if <span>&#92;(f(x)&#92;)</span> is a constant.
- If <span>&#92;(&#92;text{ch}(F) = p&#92;)</span>, then <span>&#92;(f'(x) = 0&#92;)</span> if and only if <span>&#92;(f(x) = g(x^p)&#92;)</span> for some <span>&#92;(g(x) &#92;in F[x]&#92;)</span>.
</div>

The key is that <span>&#92;((ax^n)' = nax^{n-1}&#92;)</span>: in characteristic <span>&#92;(p&#92;)</span>, the term <span>&#92;(nax^{n-1}&#92;)</span> vanishes precisely when <span>&#92;(p &#92;mid n&#92;)</span>, which means <span>&#92;(f(x)&#92;)</span> involves only powers <span>&#92;(x^p, x^{2p}, &#92;ldots&#92;)</span> — that is, <span>&#92;(f(x) = g(x^p)&#92;)</span>.

An element <span>&#92;(&#92;alpha&#92;)</span> in an extension field is a **repeated root** of <span>&#92;(f(x)&#92;)</span> if <span>&#92;(f(x) = (x - &#92;alpha)^2 g(x)&#92;)</span> for some <span>&#92;(g(x)&#92;)</span>.

<div class="theorem">
<strong>Theorem.</strong> <span>&#92;(&#92;alpha&#92;)</span> is a repeated root of <span>&#92;(f(x)&#92;)</span> if and only if <span>&#92;((x - &#92;alpha) &#92;mid &#92;gcd(f, f')&#92;)</span>. Consequently, <span>&#92;(f(x)&#92;)</span> has no repeated root in any extension of <span>&#92;(F&#92;)</span> if and only if <span>&#92;(&#92;gcd(f, f') = 1&#92;)</span>.
</div>

Note the important distinction: the condition of having a repeated root depends on which extension we work in, but the gcd condition involves only polynomials over <span>&#92;(F&#92;)</span>.

### 4.3 Finite Fields

<div class="theorem">
<strong>Theorem.</strong> If <span>&#92;(F&#92;)</span> is a finite field, then its prime field is <span>&#92;(&#92;mathbb{Z}&#95;p&#92;)</span> for some prime <span>&#92;(p&#92;)</span>, and <span>&#92;(|F| = p^n&#92;)</span> for some positive integer <span>&#92;(n&#92;)</span>. Moreover, <span>&#92;(F&#92;)</span> is the splitting field of <span>&#92;(x^{p^n} - x&#92;)</span> over <span>&#92;(&#92;mathbb{Z}&#95;p&#92;)</span>.
</div>

*Proof sketch.* The multiplicative group <span>&#92;(F^&#42; = F &#92;setminus &#92;{0&#92;}&#92;)</span> has order <span>&#92;(p^n - 1&#92;)</span>. One can show <span>&#92;(F^&#42;&#92;)</span> is cyclic, so every <span>&#92;(a &#92;in F^&#42;&#92;)</span> satisfies <span>&#92;(a^{p^n - 1} = 1&#92;)</span>, meaning every element of <span>&#92;(F&#92;)</span> is a root of <span>&#92;(x^{p^n} - x&#92;)</span>. ∎

<div class="theorem">
<strong>Theorem (Moore).</strong> Any two finite fields of order <span>&#92;(p^n&#92;)</span> are isomorphic. We denote this unique field by <span>&#92;(&#92;mathbb{F}&#95;{p^n}&#92;)</span>.
</div>

### 4.4 Separable Polynomials

<div class="definition">
<strong>Definition.</strong> Let <span>&#92;(F&#92;)</span> be a field and <span>&#92;(f(x) &#92;in F[x]&#92;)</span> non-zero.
- If <span>&#92;(f(x)&#92;)</span> is irreducible and has no repeated root in any extension of <span>&#92;(F&#92;)</span>, we say <span>&#92;(f(x)&#92;)</span> is <strong>separable</strong>.
- A general polynomial is separable if all its irreducible factors are separable.
- A field <span>&#92;(F&#92;)</span> is <strong>perfect</strong> if all polynomials in <span>&#92;(F[x]&#92;)</span> are separable.
</div>

<div class="theorem">
<strong>Theorem.</strong> Every field of characteristic zero is perfect. If <span>&#92;(F&#92;)</span> has characteristic <span>&#92;(p&#92;)</span> and <span>&#92;(F^p = &#92;{a^p : a &#92;in F&#92;} = F&#92;)</span>, then <span>&#92;(F&#92;)</span> is perfect. In particular, finite fields are perfect.
</div>

---

## Chapter 5: Sylow Theorems

This chapter develops the group theory needed for Galois theory, culminating in the three Sylow theorems about the structure of finite groups.

### 5.1 Group Actions and the Class Equation

Let <span>&#92;(G&#92;)</span> be a group acting on a set <span>&#92;(S&#92;)</span>. For <span>&#92;(x &#92;in S&#92;)</span>:
- The **orbit** of <span>&#92;(x&#92;)</span> is <span>&#92;(Gx = &#92;{gx : g &#92;in G&#92;}&#92;)</span>.
- The **stabiliser** of <span>&#92;(x&#92;)</span> is <span>&#92;(G&#95;x = &#92;{g &#92;in G : gx = x&#92;}&#92;)</span>, which is a subgroup of <span>&#92;(G&#92;)</span>.

When <span>&#92;(G&#92;)</span> acts on itself by conjugation (i.e., <span>&#92;(g &#92;cdot x = gxg^{-1}&#92;)</span>), the stabiliser of <span>&#92;(x&#92;)</span> is the **centraliser** <span>&#92;(C&#95;G(x) = &#92;{g &#92;in G : gx = xg&#92;}&#92;)</span>. The orbit <span>&#92;(Gx&#92;)</span> is a singleton precisely when <span>&#92;(x&#92;)</span> is in the **centre** <span>&#92;(Z(G)&#92;)</span>.

<div class="theorem">
<strong>Theorem (Class Equation).</strong> For a finite group <span>&#92;(G&#92;)</span>,
<span>&#92;[ |G| = |Z(G)| + &#92;sum&#95;i [G : C&#95;G(x&#95;i)] &#92;]</span>
where the sum runs over representatives <span>&#92;(x&#95;i&#92;)</span> of conjugacy classes with more than one element.
</div>

<div class="theorem">
<strong>Theorem (Cauchy).</strong> If a prime <span>&#92;(p&#92;)</span> divides <span>&#92;(|G|&#92;)</span>, then <span>&#92;(G&#92;)</span> contains an element of order <span>&#92;(p&#92;)</span>.
</div>

### 5.2 Sylow Theorems

A **<span>&#92;(p&#92;)</span>-group** is a group in which every element has order a power of <span>&#92;(p&#92;)</span>. By Cauchy's theorem, a finite group is a <span>&#92;(p&#92;)</span>-group if and only if its order is a power of <span>&#92;(p&#92;)</span>. If <span>&#92;(H&#92;)</span> is a subgroup of <span>&#92;(G&#92;)</span>, the **normaliser of <span>&#92;(H&#92;)</span> in <span>&#92;(G&#92;)</span>** is <span>&#92;(N&#95;G(H) = &#92;{g &#92;in G : gHg^{-1} = H&#92;}&#92;)</span>. Note that <span>&#92;(H &#92;trianglelefteq N&#95;G(H)&#92;)</span>.

<div class="theorem">
<strong>Theorem (First Sylow Theorem).</strong> Let <span>&#92;(G&#92;)</span> be a group of order <span>&#92;(p^n m&#92;)</span> with <span>&#92;(\gcd(p, m) = 1&#92;)</span>. Then <span>&#92;(G&#92;)</span> contains a subgroup of order <span>&#92;(p^i&#92;)</span> for all <span>&#92;(1 &#92;leq i &#92;leq n&#92;)</span>. Moreover, every subgroup of order <span>&#92;(p^i&#92;)</span> is normal in some subgroup of order <span>&#92;(p^{i+1}&#92;)</span>.
</div>

A **Sylow <span>&#92;(p&#92;)</span>-subgroup** of <span>&#92;(G&#92;)</span> is a maximal <span>&#92;(p&#92;)</span>-subgroup. By the first Sylow theorem, if <span>&#92;(|G| = p^n m&#92;)</span> with <span>&#92;(\gcd(p,m) = 1&#92;)</span>, then every Sylow <span>&#92;(p&#92;)</span>-subgroup has order exactly <span>&#92;(p^n&#92;)</span>.

<div class="theorem">
<strong>Theorem (Second Sylow Theorem).</strong> Any two Sylow <span>&#92;(p&#92;)</span>-subgroups of <span>&#92;(G&#92;)</span> are conjugate.
</div>

<div class="theorem">
<strong>Theorem (Third Sylow Theorem).</strong> The number <span>&#92;(n&#95;p&#92;)</span> of Sylow <span>&#92;(p&#92;)</span>-subgroups of <span>&#92;(G&#92;)</span> satisfies <span>&#92;(n&#95;p &#92;mid |G|&#92;)</span> and <span>&#92;(n&#95;p &#92;equiv 1 &#92;pmod{p}&#92;)</span>.
</div>

*Proof sketch of Third Sylow.* Let <span>&#92;(S&#92;)</span> be the set of all Sylow <span>&#92;(p&#92;)</span>-subgroups and <span>&#92;(P &#92;in S&#92;)</span>. By the second theorem, <span>&#92;(|S| = [G : N&#95;G(P)]&#92;)</span>, which divides <span>&#92;(|G|&#92;)</span>. Let <span>&#92;(P&#92;)</span> act on <span>&#92;(S&#92;)</span> by conjugation; orbits of size 1 correspond to elements of <span>&#92;(S&#92;)</span> normalised by <span>&#92;(P&#92;)</span>. One shows the only such element is <span>&#92;(P&#92;)</span> itself, giving <span>&#92;(|S| &#92;equiv 1 &#92;pmod{p}&#92;)</span>. ∎

---

## Chapter 6: Solvable Groups

This chapter introduces solvable groups, which are the group-theoretic key to understanding solvability of polynomial equations by radicals.

### 6.1 Definition and Basic Properties

<div class="definition">
<strong>Definition.</strong> A group <span>&#92;(G&#92;)</span> is <strong>solvable</strong> if there exists a tower
<span>&#92;[ G = G&#95;0 &#92;trianglerighteq G&#95;1 &#92;trianglerighteq G&#95;2 &#92;trianglerighteq &#92;cdots &#92;trianglerighteq G&#95;m = &#92;{1&#92;} &#92;]</span>
with each <span>&#92;(G&#95;{i+1} &#92;trianglelefteq G&#95;i&#92;)</span> and each quotient <span>&#92;(G&#95;i/G&#95;{i+1}&#92;)</span> abelian.
</div>

<div class="theorem">
<strong>Theorem 6.0.1.</strong> Let <span>&#92;(G&#92;)</span> be a solvable group. Then:
1. Every subgroup <span>&#92;(H&#92;)</span> of <span>&#92;(G&#92;)</span> is solvable.
2. For any normal subgroup <span>&#92;(N &#92;trianglelefteq G&#92;)</span>, the quotient group <span>&#92;(G/N&#92;)</span> is solvable.
</div>

*Proof of (1).* Let <span>&#92;(H&#95;i = H &#92;cap G&#95;i&#92;)</span>. Then <span>&#92;(H = H&#95;0 &#92;trianglerighteq H&#95;1 &#92;trianglerighteq &#92;cdots &#92;trianglerighteq H&#95;m = &#92;{1&#92;}&#92;)</span>, and by the second isomorphism theorem <span>&#92;(H&#95;i/H&#95;{i+1} &#92;hookrightarrow G&#95;i/G&#95;{i+1}&#92;)</span>, which is abelian.

*Proof of (2).* Consider the expanded tower <span>&#92;(G&#95;0 N &#92;trianglerighteq G&#95;1 N &#92;trianglerighteq &#92;cdots &#92;trianglerighteq G&#95;m N = N&#92;)</span>. Taking quotients by <span>&#92;(N&#92;)</span> and applying the second and third isomorphism theorems shows each factor is abelian. ∎

<div class="theorem">
<strong>Theorem 6.0.2.</strong> Let <span>&#92;(N &#92;trianglelefteq G&#92;)</span>. If both <span>&#92;(N&#92;)</span> and <span>&#92;(G/N&#92;)</span> are solvable, then <span>&#92;(G&#92;)</span> is solvable. In particular, a direct product of finitely many solvable groups is solvable.
</div>

<div class="corollary">
<strong>Corollary 6.0.3.</strong> Every finite solvable group has a tower with cyclic (in fact cyclic of prime order) quotients.
</div>

### 6.2 Simple Groups and Failure of Solvability

<div class="definition">
<strong>Definition.</strong> A group <span>&#92;(G&#92;)</span> is <strong>simple</strong> if it is non-trivial and has no normal subgroups other than <span>&#92;(&#92;{1&#92;}&#92;)</span> and <span>&#92;(G&#92;)</span> itself.
</div>

The alternating group <span>&#92;(A&#95;5&#92;)</span> is simple. Since the only possible tower for <span>&#92;(A&#95;5&#92;)</span> is <span>&#92;(A&#95;5 &#92;trianglerighteq &#92;{1&#92;}&#92;)</span>, and <span>&#92;(A&#95;5/&#92;{1&#92;} &#92;cong A&#95;5&#92;)</span> is not abelian, <span>&#92;(A&#95;5&#92;)</span> is not solvable. By Theorem 6.0.1, <span>&#92;(S&#95;5&#92;)</span> is not solvable either (since <span>&#92;(A&#95;5 &#92;leq S&#95;5&#92;)</span>). More generally, <span>&#92;(S&#95;n&#92;)</span> is not solvable for all <span>&#92;(n &#92;geq 5&#92;)</span>, since each such <span>&#92;(S&#95;n&#92;)</span> contains a copy of <span>&#92;(A&#95;5&#92;)</span>.

This connection between the symmetric group and solvability is precisely what makes the Abel-Ruffini theorem work.

---

## Chapter 7: Automorphism Groups of Field Extensions

This chapter associates a group to each field extension: the group of field automorphisms that fix the base field.

### 7.1 Automorphism Groups

<div class="definition">
<strong>Definition.</strong> Let <span>&#92;(E/F&#92;)</span> be a field extension. An <strong><span>&#92;(F&#92;)</span>-automorphism of <span>&#92;(E&#92;)</span></strong> is a field automorphism <span>&#92;(&#92;psi: E &#92;to E&#92;)</span> that fixes every element of <span>&#92;(F&#92;)</span> (i.e., <span>&#92;(&#92;psi|&#95;F = &#92;\text{id}&#95;F&#92;)</span>). The set of all such automorphisms, under composition, forms the <strong>automorphism group</strong> <span>&#92;(&#92;\text{Aut}&#95;F(E)&#92;)</span>.
</div>

Two fundamental lemmas govern these automorphisms:

**Lemma 7.1.1.** If <span>&#92;(&#92;\psi &#92;in &#92;\text{Aut}&#95;F(E)&#92;)</span> and <span>&#92;(&#92;\alpha &#92;in E&#92;)</span> is a root of <span>&#92;(f(x) &#92;in F[x]&#92;)</span>, then <span>&#92;(&#92;\psi(&#92;\alpha)&#92;)</span> is also a root of <span>&#92;(f(x)&#92;)</span>. (Automorphisms permute the roots of polynomials with coefficients in the base field.)

**Lemma 7.1.2.** If <span>&#92;(E = F(&#92;\alpha&#95;1, &#92;\ldots, &#92;\alpha&#95;n)&#92;)</span> and two maps <span>&#92;(&#92;\psi&#95;1, &#92;\psi&#95;2 &#92;in &#92;\text{Aut}&#95;F(E)&#92;)</span> agree on each generator <span>&#92;(&#92;\alpha&#95;i&#92;)</span>, then <span>&#92;(&#92;\psi&#95;1 = &#92;\psi&#95;2&#92;)</span>.

<div class="theorem">
<strong>Theorem 7.1.3.</strong> If <span>&#92;(E/F&#92;)</span> is a finite extension, then <span>&#92;(&#92;\text{Aut}&#95;F(E)&#92;)</span> is finite.
</div>

*Proof sketch.* Since <span>&#92;(E/F&#92;)</span> is finite, write <span>&#92;(E = F(&#92;\alpha&#95;1, &#92;\ldots, &#92;\alpha&#95;n)&#92;)</span>. Any <span>&#92;(&#92;\psi &#92;in &#92;\text{Aut}&#95;F(E)&#92;)</span> is determined by where it sends each <span>&#92;(&#92;\alpha&#95;i&#92;)</span>. By Lemma 7.1.1, each <span>&#92;(&#92;\psi(&#92;\alpha&#95;i)&#92;)</span> is a root of the minimal polynomial of <span>&#92;(&#92;\alpha&#95;i&#92;)</span>, giving finitely many choices. So <span>&#92;(|\text{Aut}_F(E)| < &#92;\infty&#92;)</span>. ∎

### 7.2 Automorphism Groups of Splitting Fields

<div class="definition">
<strong>Definition.</strong> The <strong>automorphism group of <span>&#92;(f(x)&#92;)</span> over <span>&#92;(F&#92;)</span></strong> is <span>&#92;(\text{Aut}&#95;F(E)&#92;)</span>, where <span>&#92;(E&#92;)</span> is the splitting field of <span>&#92;(f(x)&#92;)</span> over <span>&#92;(F&#92;)</span>.
</div>

<div class="theorem">
<strong>Theorem 7.2.1 and 7.2.2.</strong> Let <span>&#92;(E/F&#92;)</span> be the splitting field of <span>&#92;(f(x) &#92;in F[x]&#92;)</span> with <span>&#92;(n&#92;)</span> distinct roots. Then <span>&#92;(\text{Aut}&#95;F(E)&#92;)</span> is isomorphic to a subgroup of the symmetric group <span>&#92;(S&#95;n&#92;)</span>. Moreover, <span>&#92;(|\text{Aut}&#95;F(E)| &#92;leq [E:F]&#92;)</span>, with equality if and only if <span>&#92;(f(x)&#92;)</span> is separable.
</div>

### 7.3 Fixed Fields

<div class="definition">
<strong>Definition.</strong> Let <span>&#92;(E/F&#92;)</span> be a field extension and <span>&#92;(G &#92;leq &#92;\text{Aut}&#95;F(E)&#92;)</span>. The <strong>fixed field of <span>&#92;(G&#92;)</span></strong> is <span>&#92;[E^G = &#92;{&#92;\alpha &#92;in E : &#92;\psi(&#92;\alpha) = &#92;\alpha &#92;\text{ for all } &#92;\psi &#92;in G&#92;}.&#92;]</span>
</div>

<div class="theorem">
<strong>Theorem 7.3.1.</strong> If <span>&#92;(f(x) &#92;in F[x]&#92;)</span> is separable with splitting field <span>&#92;(E/F&#92;)</span>, and <span>&#92;(G = &#92;\text{Aut}&#95;F(E)&#92;)</span>, then <span>&#92;(E^G = F&#92;)</span>.
</div>

*Proof sketch.* Let <span>&#92;(L = E^G&#92;)</span>. By definition of <span>&#92;(L&#92;)</span>, every <span>&#92;(F&#92;)</span>-automorphism of <span>&#92;(E&#92;)</span> also fixes <span>&#92;(L&#92;)</span>, so <span>&#92;(\text{Aut}&#95;L(E) = \text{Aut}&#95;F(E)&#92;)</span>. Since <span>&#92;(f(x)&#92;)</span> is separable, <span>&#92;(|\text{Aut}&#95;F(E)| = [E:F]&#92;)</span> and <span>&#92;(|\text{Aut}&#95;L(E)| = [E:L]&#92;)</span>. Thus <span>&#92;([E:F] = [E:L]&#92;)</span>, and since <span>&#92;(F &#92;subseteq L&#92;)</span>, we get <span>&#92;(L = F&#92;)</span>. ∎

---

## Chapter 8: Separable and Normal Extensions

These two properties together define Galois extensions, which are the central objects of the theory.

### 8.1 Separable Extensions

<div class="definition">
<strong>Definition.</strong> An algebraic extension <span>&#92;(E/F&#92;)</span> is <strong>separable</strong> if the minimal polynomial of every <span>&#92;(&#92;\alpha &#92;in E&#92;)</span> is a separable polynomial over <span>&#92;(F&#92;)</span>.
</div>

<div class="theorem">
<strong>Theorem 8.1.1.</strong> If <span>&#92;(E/F&#92;)</span> is the splitting field of a separable polynomial, then <span>&#92;(E/F&#92;)</span> is separable.
</div>

*Proof sketch.* For <span>&#92;(&#92;\alpha &#92;in E&#92;)</span> with minimal polynomial <span>&#92;(p(x)&#92;)</span>, consider the distinct roots <span>&#92;(&#92;\alpha&#95;1 = &#92;\alpha, &#92;\alpha&#95;2, &#92;\ldots, &#92;\alpha&#95;n&#92;)</span> of <span>&#92;(p(x)&#92;)</span> in <span>&#92;(E&#92;)</span> and set <span>&#92;(&#92;\tilde{p}(x) = &#92;prod&#95;{i=1}^n (x - &#92;\alpha&#95;i)&#92;)</span>. By Theorem 7.3.1, the coefficients of <span>&#92;(&#92;\tilde{p}(x)&#92;)</span> lie in <span>&#92;(F&#92;)</span>, and so <span>&#92;(&#92;\tilde{p}(x) = p(x)&#92;)</span>. Thus <span>&#92;(p(x)&#92;)</span> has distinct roots and is separable. ∎

### 8.2 The Primitive Element Theorem

<div class="definition">
<strong>Definition.</strong> A <strong>simple extension</strong> is a field extension <span>&#92;(E/F&#92;)</span> of the form <span>&#92;(E = F(&#92;\gamma)&#92;)</span>. The element <span>&#92;(&#92;\gamma&#92;)</span> is called a <strong>primitive element</strong> of <span>&#92;(E/F&#92;)</span>.
</div>

<div class="theorem">
<strong>Theorem 8.1.4 (Primitive Element Theorem).</strong> Every finite separable extension is simple.
</div>

*Proof sketch.* Assume <span>&#92;(F&#92;)</span> is infinite (the finite field case is handled separately). It suffices to show that any extension generated by two algebraic elements is simple. Let <span>&#92;(E = F(&#92;\alpha, &#92;\beta)&#92;)</span> with minimal polynomials <span>&#92;(a(x)&#92;)</span> and <span>&#92;(b(x)&#92;)</span>. Choose <span>&#92;(&#92;\lambda &#92;in F&#92;)</span> such that <span>&#92;(&#92;\lambda &#92;neq (&#92;\tilde{&#92;\alpha} - &#92;\alpha)/(&#92;\beta - &#92;\tilde{&#92;\beta})&#92;)</span> for all roots <span>&#92;(&#92;\tilde{&#92;\alpha}&#92;)</span> of <span>&#92;(a(x)&#92;)</span> and all roots <span>&#92;(&#92;\tilde{&#92;\beta} &#92;neq &#92;\beta&#92;)</span> of <span>&#92;(b(x)&#92;)</span>. Then <span>&#92;(F(&#92;\alpha, &#92;\beta) = F(&#92;\alpha + &#92;\lambda &#92;\beta)&#92;)</span>. The condition on <span>&#92;(&#92;\lambda&#92;)</span> can always be satisfied since <span>&#92;(F&#92;)</span> is infinite and there are only finitely many excluded values. ∎

### 8.3 Normal Extensions

<div class="definition">
<strong>Definition.</strong> An algebraic extension <span>&#92;(E/F&#92;)</span> is <strong>normal</strong> if for every irreducible <span>&#92;(p(x) &#92;in F[x]&#92;)</span>, either <span>&#92;(p(x)&#92;)</span> has no root in <span>&#92;(E&#92;)</span>, or <span>&#92;(p(x)&#92;)</span> has all its roots in <span>&#92;(E&#92;)</span>.
</div>

<div class="theorem">
<strong>Theorem 8.2.1.</strong> A finite extension <span>&#92;(E/F&#92;)</span> is normal if and only if it is the splitting field of some polynomial in <span>&#92;(F[x]&#92;)</span>.
</div>

*Forward direction.* If <span>&#92;(E = F(&#92;\alpha&#95;1, &#92;\ldots, &#92;\alpha&#95;n)&#92;)</span> and <span>&#92;(p&#95;i(x)&#92;)</span> is the minimal polynomial of <span>&#92;(&#92;\alpha&#95;i&#92;)</span>, then <span>&#92;(E&#92;)</span> is the splitting field of <span>&#92;(p&#95;1(x) &#92;cdots p&#95;n(x)&#92;)</span>.

*Backward direction.* Let <span>&#92;(E/F&#92;)</span> be the splitting field of <span>&#92;(f(x)&#92;)</span>, and <span>&#92;(p(x) &#92;in F[x]&#92;)</span> irreducible with root <span>&#92;(&#92;\alpha&#95;1 &#92;in E&#92;)</span>. For any other root <span>&#92;(&#92;\alpha&#95;2 &#92;neq &#92;\alpha&#95;1&#92;)</span> in the splitting field of <span>&#92;(p(x)&#92;)</span> over <span>&#92;(E&#92;)</span>, Theorem 3.2.1 gives an automorphism <span>&#92;(&#92;\psi&#92;)</span> of the splitting field mapping <span>&#92;(&#92;\alpha&#95;1 &#92;mapsto &#92;\alpha&#95;2&#92;)</span>. Since <span>&#92;(&#92;\psi(E) = E&#92;)</span>, we get <span>&#92;(&#92;\alpha&#95;2 &#92;in E&#92;)</span>. ∎

<div class="definition">
<strong>Definition.</strong> Two elements <span>&#92;(&#92;\alpha, &#92;\beta &#92;in E&#92;)</span> are <strong>conjugate over <span>&#92;(F&#92;)</span></strong> if there exists <span>&#92;(&#92;\psi &#92;in &#92;\text{Aut}&#95;F(E)&#92;)</span> with <span>&#92;(&#92;\psi(&#92;\alpha) = &#92;\beta&#92;)</span> — equivalently, if <span>&#92;(&#92;\alpha&#92;)</span> and <span>&#92;(&#92;\beta&#92;)</span> have the same minimal polynomial over <span>&#92;(F&#92;)</span>.
</div>

<div class="definition">
<strong>Definition.</strong> A <strong>normal closure</strong> of a finite extension <span>&#92;(E/F&#92;)</span> is a normal extension <span>&#92;(N/F&#92;)</span> containing <span>&#92;(E&#92;)</span> that is minimal with this property.
</div>

<div class="theorem">
<strong>Theorem.</strong> Every finite extension <span>&#92;(E/F&#92;)</span> has a normal closure <span>&#92;(N/F&#92;)</span>, unique up to <span>&#92;(E&#92;)</span>-isomorphism.
</div>

*Proof.* Let <span>&#92;(E = F(&#92;\alpha&#95;1, &#92;\ldots, &#92;\alpha&#95;n)&#92;)</span> with minimal polynomial <span>&#92;(p&#95;i(x)&#92;)</span> for <span>&#92;(&#92;\alpha&#95;i&#92;)</span>. Take <span>&#92;(N&#92;)</span> to be the splitting field of <span>&#92;(p&#95;1(x) &#92;\cdots p&#95;n(x)&#92;)</span> over <span>&#92;(E&#92;)</span>. ∎

---

## Chapter 9: Galois Theory

This chapter is the heart of the course: the definition of Galois extensions, Artin's theorem, and the Fundamental Theorem of Galois Theory.

### 9.1 Galois Extensions

<div class="definition">
<strong>Definition.</strong> A field extension <span>&#92;(E/F&#92;)</span> is a <strong>Galois extension</strong> if it is both separable and normal. In this case, the automorphism group <span>&#92;(\text{Aut}&#95;F(E)&#92;)</span> is called the <strong>Galois group</strong> of <span>&#92;(E/F&#92;)</span>, written <span>&#92;(\text{Gal}&#95;F(E)&#92;)</span>.
</div>

By Theorems 8.1.1 and 8.2.1, a finite Galois extension is equivalent to the splitting field of a separable polynomial. If <span>&#92;(f(x)&#92;)</span> has degree <span>&#92;(n&#92;)</span>, then <span>&#92;(\text{Gal}&#95;F(E) &#92;leq S&#95;n&#92;)</span> and <span>&#92;(|\text{Gal}&#95;F(E)| = [E:F]&#92;)</span>.

### 9.2 Artin's Theorem

<div class="theorem">
<strong>Theorem 9.1.1 (E. Artin).</strong> Let <span>&#92;(E&#92;)</span> be a field and <span>&#92;(G&#92;)</span> a finite subgroup of <span>&#92;(\text{Aut}(E)&#92;)</span>. Let <span>&#92;(E^G = &#92;{&#92;\alpha &#92;in E : &#92;\psi(&#92;\alpha) = &#92;\alpha &#92;\text{ for all } &#92;\psi &#92;in G&#92;}&#92;)</span>. Then <span>&#92;(E/E^G&#92;)</span> is a finite Galois extension and <span>&#92;[\text{Gal}&#95;{E^G}(E) = G, &#92;quad [E : E^G] = |G|.&#92;]</span>
</div>

*Proof sketch.* Let <span>&#92;(n = |G|&#92;)</span> and <span>&#92;(F = E^G&#92;)</span>. For any <span>&#92;(&#92;\alpha &#92;in E&#92;)</span>, consider its <span>&#92;(G&#92;)</span>-orbit <span>&#92;(&#92;\alpha&#95;1 = &#92;\alpha, &#92;\alpha&#95;2, &#92;\ldots, &#92;\alpha&#95;m&#92;)</span>. Set <span>&#92;(f(x) = &#92;prod&#95;{i=1}^m (x - &#92;\alpha&#95;i)&#92;)</span>. Since every <span>&#92;(&#92;\psi &#92;in G&#92;)</span> permutes the <span>&#92;(&#92;\alpha&#95;i&#92;)</span>'s, the coefficients of <span>&#92;(f(x)&#92;)</span> are symmetric in the <span>&#92;(&#92;\alpha&#95;i&#92;)</span>'s, hence fixed by all of <span>&#92;(G&#92;)</span> and so lie in <span>&#92;(F&#92;)</span>. One shows <span>&#92;(f(x)&#92;)</span> is the minimal polynomial of <span>&#92;(&#92;\alpha&#92;)</span> over <span>&#92;(F&#92;)</span> — it is separable and splits over <span>&#92;(E&#92;)</span>, so <span>&#92;(E/F&#92;)</span> is Galois. The bound <span>&#92;([E:F] &#92;leq n&#92;)</span> follows from a linear algebra argument: if <span>&#92;([E:F] > n&#92;)</span>, we could find a linear dependence contradicting the minimality hypothesis. Combined with <span>&#92;(|G| &#92;leq |\text{Gal}&#95;F(E)| = [E:F] &#92;leq n = |G|&#92;)</span>, we get equality throughout. ∎

<div class="remark">
<strong>Remark.</strong> The symmetric functions example shows this beautifully: if <span>&#92;(E = F(t&#95;1, &#92;\ldots, t&#95;n)&#92;)</span> is the rational function field in <span>&#92;(n&#92;)</span> variables, and <span>&#92;(G = S&#95;n&#92;)</span> acts by permuting variables, then <span>&#92;(E^G = F(s&#95;1, &#92;\ldots, s&#95;n)&#92;)</span> where <span>&#92;(s&#95;1, &#92;\ldots, s&#95;n&#92;)</span> are the elementary symmetric polynomials.
</div>

### 9.3 The Fundamental Theorem of Galois Theory

<div class="theorem">
<strong>Theorem 9.2.1 (Fundamental Theorem of Galois Theory).</strong> Let <span>&#92;(E/F&#92;)</span> be a finite Galois extension with Galois group <span>&#92;(G = &#92;\text{Gal}&#95;F(E)&#92;)</span>. There is an order-reversing bijection between the set of intermediate fields <span>&#92;(\text{Int}(E/F)&#92;)</span> and the set of subgroups <span>&#92;(\text{Sub}(G)&#92;)</span>:
<span>&#92;[ &#92;\text{Int}(E/F) &#92;longleftrightarrow &#92;\text{Sub}(G) &#92;]</span>
given by <span>&#92;(L &#92;mapsto L^&#42; := &#92;\text{Gal}&#95;L(E)&#92;)</span> and <span>&#92;(H &#92;\mapsto H^&#42; := E^H&#92;)</span>. These maps are inverse to each other, and they reverse inclusions: <span>&#92;(L&#95;1 &#92;\subseteq L&#95;2&#92;)</span> if and only if <span>&#92;(L&#95;2^&#42; &#92;\subseteq L&#95;1^&#42;&#92;)</span>.

Moreover, <span>&#92;([E:L] = |L^&#42;|&#92;)</span> and <span>&#92;([L:F] = [G:L^&#42;]&#92;)</span>.
</div>

*Proof.* The maps are mutually inverse: if <span>&#92;(L &#92;in &#92;\text{Int}(E/F)&#92;)</span>, then <span>&#92;((L^&#42;)^&#42; = E^{\text{Gal}&#95;L(E)} = L&#92;)</span> by Theorem 7.3.1. If <span>&#92;(H &#92;in &#92;\text{Sub}(G)&#92;)</span>, then <span>&#92;((H^&#42;)^&#42; = &#92;\text{Gal}&#95;{E^H}(E) = H&#92;)</span> by Artin's theorem. ∎

The correspondence can be visualised as an inverted diagram:

| Intermediate fields (include ↑ = contain more) | Subgroups (include ↑ = larger group) |
|---|---|
| <span>&#92;(E&#92;)</span> (top) | <span>&#92;(&#92;\{1&#92;}&#92;)</span> (bottom) |
| <span>&#92;(L&#92;)</span> | <span>&#92;(L^&#42; = &#92;\text{Gal}&#95;L(E)&#92;)</span> |
| <span>&#92;(F&#92;)</span> (bottom) | <span>&#92;(G&#92;)</span> (top) |

<div class="theorem">
<strong>Theorem 9.2.3.</strong> Under the Galois correspondence, the extension <span>&#92;(L/F&#92;)</span> is Galois if and only if <span>&#92;(L^&#42;&#92;)</span> is a normal subgroup of <span>&#92;(G&#92;)</span>. In this case, <span>&#92;[\text{Gal}&#95;F(L) &#92;\cong G/L^&#42;.&#92;]</span>
</div>

*Proof.* One shows: <span>&#92;(L/F&#92;)</span> is normal <span>&#92;(&#92;\Leftrightarrow&#92;)</span> <span>&#92;(&#92;\psi(L) = L&#92;)</span> for all <span>&#92;(&#92;\psi &#92;in G&#92;)</span> <span>&#92;(&#92;\Leftrightarrow&#92;)</span> <span>&#92;(&#92;\psi \text{Gal}&#95;L(E) &#92;\psi^{-1} = &#92;\text{Gal}&#95;L(E)&#92;)</span> for all <span>&#92;(&#92;\psi &#92;in G&#92;)</span> <span>&#92;(&#92;\Leftrightarrow&#92;)</span> <span>&#92;(L^&#42; &#92;trianglelefteq G&#92;)</span>. The restriction map <span>&#92;(G &#92;to &#92;\text{Gal}&#95;F(L)&#92;)</span>, <span>&#92;(&#92;\psi &#92;mapsto &#92;\psi|&#95;L&#92;)</span>, is surjective with kernel <span>&#92;(L^&#42;&#92;)</span>. ∎

<div class="example">
<strong>Example.</strong> Let <span>&#92;(E&#92;)</span> be the splitting field of <span>&#92;(x^5 - 7&#92;)</span> over <span>&#92;(&#92;\mathbb{Q}&#92;)</span>. Then <span>&#92;(E = &#92;\mathbb{Q}(&#92;\alpha, &#92;\zeta&#95;5)&#92;)</span> where <span>&#92;(&#92;\alpha = &#92;\sqrt[5]{7}&#92;)</span> and <span>&#92;(&#92;\zeta&#95;5 = e^{2&#92;\pi i/5}&#92;)</span>. Since <span>&#92;([&#92;\mathbb{Q}(&#92;\alpha):&#92;\mathbb{Q}] = 5&#92;)</span> and <span>&#92;([&#92;\mathbb{Q}(&#92;\zeta&#95;5):&#92;\mathbb{Q}] = 4&#92;)</span>, we get <span>&#92;([E:&#92;\mathbb{Q}] = 20&#92;)</span>. The Galois group <span>&#92;(G = &#92;\text{Gal}&#95;{&#92;\mathbb{Q}}(E)&#92;)</span> has order 20 and is generated by
<span>&#92;[ &#92;\sigma: &#92;\alpha &#92;mapsto &#92;\alpha&#92;\zeta&#95;5,\; &#92;\zeta&#95;5 &#92;mapsto &#92;\zeta&#95;5 &#92;qquad &#92;&#92; &#92;\tau: &#92;\alpha &#92;mapsto &#92;\alpha,\; &#92;\zeta&#95;5 &#92;mapsto &#92;\zeta&#95;5^2 &#92;]</span>
with the relation <span>&#92;(&#92;\tau&#92;\sigma = &#92;\sigma^2&#92;\tau&#92;)</span>. The Sylow theorems show there is a unique Sylow 5-subgroup <span>&#92;(&#92;\langle &#92;\sigma &#92;rangle &#92;\cong &#92;\mathbb{Z}&#95;5&#92;)</span> (normal in <span>&#92;(G&#92;)</span>) and five Sylow 2-subgroups.
</div>

---

## Chapter 10: Cyclic Extensions

Cyclic extensions — Galois extensions with cyclic Galois group — are the building blocks for understanding solvability by radicals.

### 10.1 Dedekind's Lemma

<div class="theorem">
<strong>Lemma 10.0.1 (Dedekind's Lemma).</strong> Let <span>&#92;(K&#92;)</span> and <span>&#92;(L&#92;)</span> be fields and <span>&#92;(&#92;\psi&#95;1, &#92;\ldots, &#92;\psi&#95;n: L &#92;to K&#92;)</span> distinct homomorphisms. If <span>&#92;(c&#95;i &#92;in K&#92;)</span> satisfy <span>&#92;[c&#95;1 &#92;\psi&#95;1(&#92;\alpha) + c&#95;2 &#92;\psi&#95;2(&#92;\alpha) + &#92;\cdots + c&#95;n &#92;\psi&#95;n(&#92;\alpha) = 0 &#92;quad &#92;\forall &#92;\alpha &#92;in L,&#92;]</span> then <span>&#92;(c&#95;1 = c&#95;2 = &#92;\cdots = c&#95;n = 0&#92;)</span>.
</div>

In other words: distinct field homomorphisms are linearly independent over any field. This is the key tool in proving that cyclic extensions are generated by elements whose powers lie in the base field.

*Proof sketch.* Suppose the minimal number of non-zero <span>&#92;(c&#95;i&#92;)</span> giving a relation is <span>&#92;(m &#92;geq 2&#92;)</span>. Choose <span>&#92;(&#92;\beta &#92;in L&#92;)</span> with <span>&#92;(&#92;\psi&#95;1(&#92;\beta) &#92;neq &#92;\psi&#95;2(&#92;\beta)&#92;)</span>. By substituting <span>&#92;(&#92;\alpha &#92;beta&#92;)</span> and dividing by <span>&#92;(&#92;\psi&#95;1(&#92;\beta)&#92;)</span>, one obtains a shorter relation — a contradiction with minimality of <span>&#92;(m&#92;)</span>. ∎

### 10.2 Kummer Theory: Cyclic Extensions by Radicals

<div class="theorem">
<strong>Theorem 10.0.2 (Kummer Theory).</strong> Let <span>&#92;(F&#92;)</span> be a field, <span>&#92;(n &#92;in &#92;\mathbb{N}&#92;)</span>, and assume <span>&#92;(&#92;\text{ch}(F) = 0&#92;)</span> or <span>&#92;(\gcd(&#92;\text{ch}(F), n) = 1&#92;)</span>. Assume further that <span>&#92;(x^n - 1&#92;)</span> splits over <span>&#92;(F&#92;)</span> (so <span>&#92;(F&#92;)</span> contains all <span>&#92;(n&#92;)</span>th roots of unity).
1. If <span>&#92;(E/F&#92;)</span> is a cyclic Galois extension of degree <span>&#92;(n&#92;)</span>, then <span>&#92;(E = F(&#92;\alpha)&#92;)</span> for some <span>&#92;(&#92;\alpha &#92;in E&#92;)</span> with <span>&#92;(&#92;\alpha^n &#92;in F&#92;)</span>.
2. If <span>&#92;(E = F(&#92;\alpha)&#92;)</span> with <span>&#92;(&#92;\alpha^n &#92;in F&#92;)</span>, then <span>&#92;(E/F&#92;)</span> is a cyclic extension of degree <span>&#92;(d&#92;)</span> dividing <span>&#92;(n&#92;)</span>.
</div>

*Proof sketch of (1).* Let <span>&#92;(G = &#92;\text{Gal}&#95;F(E) = &#92;\langle &#92;\sigma &#92;rangle &#92;\cong &#92;\mathbb{Z}&#95;n&#92;)</span> and let <span>&#92;(&#92;\zeta&#95;n &#92;in F&#92;)</span> be a primitive <span>&#92;(n&#92;)</span>th root of unity. Apply Dedekind's Lemma with <span>&#92;(&#92;\psi&#95;i = &#92;\sigma^{i-1}&#92;)</span> and <span>&#92;(c&#95;i = &#92;\zeta&#95;n^{1-i}&#92;)</span>: since these are non-zero, there exists <span>&#92;(u &#92;in E&#92;)</span> with
<span>&#92;[&#92;\alpha = u + &#92;\zeta&#95;n^{-1}&#92;\sigma(u) + &#92;\zeta&#95;n^{-2}&#92;\sigma^2(u) + &#92;\cdots + &#92;\zeta&#95;n^{-(n-1)}&#92;\sigma^{n-1}(u) &#92;neq 0.&#92;]</span>
One checks <span>&#92;(&#92;\sigma(&#92;\alpha) = &#92;\zeta&#95;n &#92;\alpha&#92;)</span>, so <span>&#92;(&#92;\alpha, &#92;\alpha&#92;\zeta&#95;n, &#92;\ldots, &#92;\alpha&#92;\zeta&#95;n^{n-1}&#92;)</span> are the conjugates of <span>&#92;(&#92;\alpha&#92;)</span>. Their product gives <span>&#92;(&#92;\alpha^n &#92;in F&#92;)</span> and <span>&#92;(E = F(&#92;\alpha)&#92;)</span>. ∎

### 10.3 Cyclic Extensions in Characteristic p

When the degree equals the characteristic, a different criterion applies.

<div class="theorem">
<strong>Theorem (Artin-Schreier).</strong> Let <span>&#92;(F&#92;)</span> be a field of characteristic <span>&#92;(p&#92;)</span>. Then:
- If <span>&#92;(x^p - x - a &#92;in F[x]&#92;)</span> is irreducible, its splitting field <span>&#92;(E/F&#92;)</span> is a cyclic extension of degree <span>&#92;(p&#92;)</span>.
- If <span>&#92;(E/F&#92;)</span> is a cyclic extension of degree <span>&#92;(p&#92;)</span>, then <span>&#92;(E&#92;)</span> is the splitting field of some irreducible <span>&#92;(x^p - x - a &#92;in F[x]&#92;)</span>.
</div>

---

## Chapter 11: Solvability by Radicals and the Abel-Ruffini Theorem

This final chapter brings together all the preceding theory to prove the Abel-Ruffini theorem: the general polynomial of degree <span>&#92;(&#92;geq 5&#92;)</span> is not solvable by radicals.

### 11.1 Radical Extensions

<div class="definition">
<strong>Definition.</strong> A finite extension <span>&#92;(E/F&#92;)</span> is <strong>radical</strong> if there exists a tower
<span>&#92;[ F = F&#95;0 &#92;subseteq F&#95;1 &#92;subseteq F&#95;2 &#92;subseteq &#92;\cdots &#92;subseteq F&#95;m = E &#92;]</span>
such that <span>&#92;(F&#95;i = F&#95;{i-1}(&#92;\alpha&#95;i)&#92;)</span> and <span>&#92;(&#92;\alpha&#95;i^{d&#95;i} &#92;in F&#95;{i-1}&#92;)</span> for some <span>&#92;(d&#95;i &#92;in &#92;\mathbb{N}&#92;)</span>, for each <span>&#92;(1 &#92;leq i &#92;leq m&#92;)</span>.

A polynomial <span>&#92;(f(x) &#92;in F[x]&#92;)</span> is <strong>solvable by radicals</strong> if it splits over some radical extension of <span>&#92;(F&#92;)</span>.
</div>

<div class="lemma">
<strong>Lemma 11.1.1.</strong> If <span>&#92;(E/F&#92;)</span> is a finite separable radical extension, then its normal closure <span>&#92;(N/F&#92;)</span> is also radical. In particular, when studying solvability of separable polynomials by radicals, we may assume the radical extension is Galois.
</div>

### 11.2 Solvability by Radicals ↔ Solvable Galois Group

<div class="theorem">
<strong>Theorem 11.2.2.</strong> Let <span>&#92;(F&#92;)</span> be a field of characteristic zero and <span>&#92;(f(x) &#92;in F[x]&#92;)</span> separable. Then <span>&#92;(f(x)&#92;)</span> is solvable by radicals if and only if its Galois group <span>&#92;(\text{Gal}(f) = &#92;\text{Gal}&#95;F(E)&#92;)</span> (where <span>&#92;(E&#92;)</span> is the splitting field) is solvable.
</div>

*Proof sketch (<span>&#92;(&#92;\Rightarrow&#92;)</span>).* Suppose <span>&#92;(f(x)&#92;)</span> splits over a radical extension with tower <span>&#92;(F = F&#95;0 &#92;\subseteq &#92;\cdots &#92;\subseteq F&#95;m&#92;)</span>. Let <span>&#92;(n = &#92;\prod d&#95;i&#92;)</span>. Adjoin a primitive <span>&#92;(n&#92;)</span>th root of unity <span>&#92;(&#92;\zeta&#95;n&#92;)</span> by forming <span>&#92;(L = E(&#92;\zeta&#95;n)&#92;)</span>. Setting <span>&#92;(K = F(&#92;\zeta&#95;n)&#92;)</span> and <span>&#92;(K&#95;i = F&#95;i(&#92;\zeta&#95;n)&#92;)</span>, the Kummer theorem (Theorem 10.0.2) shows each <span>&#92;(K&#95;i/K&#95;{i-1}&#92;)</span> is cyclic. The Galois group <span>&#92;(G = &#92;\text{Gal}&#95;F(L)&#92;)</span> then has a tower with abelian quotients:
<span>&#92;[ G &#92;trianglerighteq &#92;\text{Gal}&#95;{K&#95;0}(L) &#92;\trianglerighteq &#92;\text{Gal}&#95;{K&#95;1}(L) &#92;\trianglerighteq &#92;\cdots &#92;\trianglerighteq &#92;\text{Gal}&#95;{K&#95;m}(L) = &#92;\{1&#92;\}. &#92;]</span>
Since each successive quotient is cyclic (by Theorem 9.2.3), <span>&#92;(G&#92;)</span> is solvable. Since <span>&#92;(\text{Gal}(f)&#92;)</span> is a quotient of the solvable group <span>&#92;(G&#92;)</span>, it is solvable.

*Proof sketch (<span>&#92;(&#92;\Leftarrow&#92;)</span>).* If <span>&#92;(\text{Gal}(f)&#92;)</span> is solvable, adjoin <span>&#92;(&#92;\zeta&#95;n&#92;)</span> where <span>&#92;(n = |\text{Gal}(f)|&#92;)</span>. The solvability tower of <span>&#92;\text{Gal}(L/K)&#92;)</span> (which is a subgroup of <span>&#92;\text{Gal}(f)&#92;)</span>) gives, via Kummer theory, a corresponding radical tower: each cyclic step <span>&#92;(H&#95;{i-1}/H&#95;i &#92;\cong C&#95;{d&#95;i}&#92;)</span> contributes a field extension <span>&#92;(K&#95;i = K&#95;{i-1}(&#92;\alpha&#95;i)&#92;)</span> with <span>&#92;(&#92;\alpha&#95;i^{d&#95;i} &#92;in K&#95;{i-1}&#92;)</span>. ∎

### 11.3 The Abel-Ruffini Theorem

<div class="proposition">
<strong>Proposition 11.2.3.</strong> Let <span>&#92;(f(x) &#92;in &#92;\mathbb{Q}[x]&#92;)</span> be irreducible of prime degree <span>&#92;(p&#92;)</span>. If <span>&#92;(f(x)&#92;)</span> has exactly two non-real complex roots, then <span>&#92;(\text{Gal}(f) &#92;\cong S&#95;p&#92;)</span>.
</div>

*Proof.* Since <span>&#92;(S&#95;p&#92;)</span> is generated by a 2-cycle and a <span>&#92;(p&#92;)</span>-cycle, it suffices to find both in <span>&#92;(\text{Gal}(f) &#92;\leq S&#95;p&#92;)</span>. Since <span>&#92;(f(x)&#92;)</span> is irreducible of degree <span>&#92;(p&#92;)</span>, we have <span>&#92;(p &#92;\mid |\text{Gal}(f)|&#92;)</span>, so by Cauchy's theorem there exists a <span>&#92;(p&#92;)</span>-cycle. The complex conjugation map <span>&#92;(a + bi &#92;\mapsto a - bi&#92;)</span> interchanges the two non-real roots and fixes all real roots — this is a 2-cycle in <span>&#92;(\text{Gal}(f)&#92;)</span>. ∎

<div class="example">
<strong>Example.</strong> Let <span>&#92;(f(x) = x^5 + 2x^3 - 24x - 2 &#92;in &#92;\mathbb{Q}[x]&#92;)</span>. By Eisenstein with <span>&#92;(p = 2&#92;)</span>, <span>&#92;(f&#92;)</span> is irreducible. Evaluating: <span>&#92;(f(-1) = 19 > 0&#92;)</span> and <span>&#92;(f(1) = -23 < 0&#92;)</span>, and <span>&#92;(f(x) &#92;to +&#92;\infty&#92;)</span> as <span>&#92;(x &#92;to +&#92;\infty&#92;)</span> and <span>&#92;(-&#92;\infty&#92;)</span> as <span>&#92;(x &#92;to -&#92;\infty&#92;)</span>, so <span>&#92;(f&#92;)</span> has at least 3 real roots. Writing <span>&#92;(&#92;\sum &#92;\alpha&#95;i = 0&#92;)</span> (no <span>&#92;(x^4&#92;)</span> term) and <span>&#92;(&#92;\sum_{i < j} &#92;\alpha_i&#92;\alpha_j = 2&#92;)</span>, we compute <span>&#92;(&#92;sum &#92;\alpha_i^2 = (&#92;\sum &#92;\alpha_i)^2 - 2&#92;\sum_{i<j}&#92;\alpha_i&#92;\alpha_j = -4 < 0&#92;)</span>, which forces the existence of non-real roots. So <span>&#92;(f&#92;)</span> has exactly 3 real and 2 non-real roots. By Proposition 11.2.3, <span>&#92;(\text{Gal}(f) &#92;\cong S&#95;5&#92;)</span>. Since <span>&#92;(S&#95;5&#92;)</span> is not solvable, <span>&#92;(f(x)&#92;)</span> is not solvable by radicals.
</div>

<div class="theorem">
<strong>Theorem (Abel-Ruffini).</strong> A general polynomial <span>&#92;(f(x)&#92;)</span> of degree <span>&#92;(n &#92;geq 5&#92;)</span> is not solvable by radicals.
</div>

*Proof.* For each <span>&#92;(n &#92;geq 5&#92;)</span>, one can construct an irreducible polynomial of degree <span>&#92;(n&#92;)</span> over <span>&#92;(&#92;\mathbb{Q}&#92;)</span> with exactly two non-real roots. (For prime degree, use Proposition 11.2.3 to get Galois group <span>&#92;(S&#95;n&#92;)</span>.) Since <span>&#92;(S&#95;n&#92;)</span> is not solvable for <span>&#92;(n &#92;geq 5&#92;)</span> (it contains <span>&#92;(A&#95;5&#92;)</span>, which is simple and non-abelian), Theorem 11.2.2 implies the polynomial is not solvable by radicals. ∎

---

## Summary: The Grand Picture

Galois theory establishes a dictionary between two worlds:

| Field extensions of <span>&#92;(E/F&#92;)</span> | Subgroups of <span>&#92;(\text{Gal}&#95;F(E)&#92;)</span> |
|---|---|
| Intermediate field <span>&#92;(L&#92;)</span> | Subgroup <span>&#92;(L^&#42; = &#92;\text{Gal}&#95;L(E)&#92;)</span> |
| Larger field = more elements | Smaller group = fewer symmetries |
| <span>&#92;([L:F] = [G : L^&#42;]&#92;)</span> | Index equals degree |
| <span>&#92;(L/F&#92;)</span> Galois | <span>&#92;(L^&#42; &#92;trianglelefteq G&#92;)</span> |
| <span>&#92;(\text{Gal}&#95;F(L) &#92;\cong G/L^&#42;&#92;)</span> | Quotient group = Galois group of subextension |

The culminating application: a polynomial is solvable by radicals if and only if its Galois group is a solvable group. Since <span>&#92;(S&#95;n&#92;)</span> is not solvable for <span>&#92;(n &#92;geq 5&#92;)</span> — because it contains the non-solvable simple group <span>&#92;(A&#95;5&#92;)</span> — there exist quintic polynomials whose Galois group is all of <span>&#92;(S&#95;5&#92;)</span>, and these cannot be solved by any combination of arithmetic operations and root extractions. This resolves a question that occupied mathematicians for over two centuries.
