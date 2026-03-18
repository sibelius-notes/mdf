---
title: "PMATH 464 — Introduction to Algebraic Geometry"
prof: "Prof. David McKinnon"
---

*L'algèbre n'est qu'une géométrie écrite, la géométrie n'est qu'une algèbre figurée.* — Sophie Germain

---

## Week 1: Algebraic Sets

### 1. What is Algebraic Geometry?

Sophie Germain had it right: algebra is written geometry, and geometry is algebra in pictures. The great thing about geometry is that it is full of pictures — there is a physicality to it that makes it easier to guess what is going on, to guide one's intuition. Trouble is, it is often fiendishly difficult to actually *prove* that intuition. The pictures that so eloquently inspire you to understand the truth also conspire to conceal nuances and special cases.

Algebra, unlike geometry, is quite amenable to computation — that is kind of the whole point of it. But algebra and intuition are not good friends. Look at an algebraic statement, and it is often hard to understand what it is all about.

Enter the genius of Germain. If you can somehow marry the two subjects of algebra and geometry, then you can get the best of both worlds: the intuition of geometry, and the calculational power of algebra. The key is *functions*. If you have a Geometry Thing, then the corresponding Algebra Thing is the set of functions from the Geometry Thing to some nice algebra place, like the complex numbers.

In this course, we will be working over the complex numbers, and all the algebra we do will be with polynomials (and closely related beasts). The Geometry Things we talk about are also defined by polynomials.

### 2. Algebraic Sets

<div class="definition">
<strong>Definition 2.1.</strong> Let <span>&#92;(n&#92;)</span> be a positive integer. <strong>Affine space</strong> <span>&#92;(\mathbb{A}^n&#92;)</span> is the set <span>&#92;(\mathbb{C}^n&#92;)</span>.
</div>

<div class="definition">
<strong>Definition 2.2.</strong> Let <span>&#92;(S&#92;)</span> be a subset of the polynomial ring <span>&#92;(\mathbb{C}[x&#95;1, \ldots, x&#95;n]&#92;)</span>. The <strong>algebraic set</strong> corresponding to <span>&#92;(S&#92;)</span> is:
<span>&#92;[ V(S) = \{ x \in \mathbb{A}^n \mid f(x) = 0 \text{ for all } f \in S \} &#92;]</span>
In other words, <span>&#92;(V(S)&#92;)</span> is the set of points where all functions in <span>&#92;(S&#92;)</span> vanish.
</div>

There are lots of algebraic sets. The <span>&#92;(xy&#92;)</span>-plane is the algebraic subset of <span>&#92;(\mathbb{A}^2&#92;)</span> corresponding to the empty set <span>&#92;(S&#92;)</span>. The <span>&#92;(x&#92;)</span>-axis is <span>&#92;(V(\{y\})&#92;)</span>. The unit "sphere" in <span>&#92;(\mathbb{C}^3&#92;)</span> is <span>&#92;(V(x^2 + y^2 + z^2 - 1)&#92;)</span>. The **twisted cubic** is the algebraic subset of <span>&#92;(\mathbb{A}^3&#92;)</span> defined by <span>&#92;(\{y - x^2, z - x^3\}&#92;)</span>. The origin in <span>&#92;(\mathbb{A}^2&#92;)</span> is defined by <span>&#92;(\{x, y\}&#92;)</span>.

This lets us make a Geometric Thing out of an Algebra Thing. Next step: go the other way.

<div class="definition">
<strong>Definition 2.3.</strong> Let <span>&#92;(X \subset \mathbb{A}^n&#92;)</span> be a subset of affine space. The <strong>ideal</strong> of <span>&#92;(X&#92;)</span> is:
<span>&#92;[ I(X) = \{ f \in \mathbb{C}[x&#95;1, \ldots, x&#95;n] \mid f(P) = 0 \text{ for all } P \in X \} &#92;]</span>
</div>

The ideal of the <span>&#92;(x&#92;)</span>-axis is <span>&#92;((y)&#92;)</span>, since the vanishing polynomials are exactly those you can factor a <span>&#92;(y&#92;)</span> out of. The ideal of the origin is <span>&#92;((x, y)&#92;)</span>.

<div class="theorem">
<strong>Theorem 2.4.</strong> Let <span>&#92;(X&#92;)</span> be a subset of <span>&#92;(\mathbb{A}^n&#92;)</span>, and <span>&#92;(I(X)&#92;)</span> its ideal. Then <span>&#92;(I(X)&#92;)</span> is a <strong>radical ideal</strong> of <span>&#92;(\mathbb{C}[x&#95;1, \ldots, x&#95;n]&#92;)</span>: if <span>&#92;(f^n \in I(X)&#92;)</span> for some positive integer <span>&#92;(n&#92;)</span>, then <span>&#92;(f \in I(X)&#92;)</span>.
</div>

<div class="proof">
<em>Proof.</em> For additivity: if <span>&#92;(f, g \in I(X)&#92;)</span> then <span>&#92;(f(x) = g(x) = 0&#92;)</span> for all <span>&#92;(x \in X&#92;)</span>, so <span>&#92;((f \pm g)(x) = 0&#92;)</span> too. For multiplication: if <span>&#92;(h \in \mathbb{C}[x&#95;1,\ldots,x&#95;n]&#92;)</span> and <span>&#92;(f \in I(X)&#92;)</span>, then <span>&#92;((hf)(x) = h(x) \cdot 0 = 0&#92;)</span>. For radical: if <span>&#92;(f^n \in I(X)&#92;)</span>, then <span>&#92;((f(x))^n = 0&#92;)</span> for all <span>&#92;(x \in X&#92;)</span>, so <span>&#92;(f(x) = 0&#92;)</span>, so <span>&#92;(f \in I(X)&#92;)</span>. ∎
</div>

This means not every ideal is the ideal of an algebraic set — only radical ideals are. Since every ideal of <span>&#92;(\mathbb{C}[x&#95;1, \ldots, x&#95;n]&#92;)</span> is finitely generated (Hilbert Basis Theorem), every algebraic set is defined by finitely many polynomials.

<div class="definition">
<strong>Definition 2.5.</strong> An ideal <span>&#92;(I&#92;)</span> of a ring <span>&#92;(R&#92;)</span> is called <strong>radical</strong> if every <span>&#92;(r \in R&#92;)</span> with <span>&#92;(r^n \in I&#92;)</span> for some positive integer <span>&#92;(n&#92;)</span> satisfies <span>&#92;(r \in I&#92;)</span>. For an arbitrary ideal <span>&#92;(I&#92;)</span>, define the <strong>radical</strong> of <span>&#92;(I&#92;)</span> to be:
<span>&#92;[ \text{rad}(I) = \{ r \in R \mid r^n \in I \text{ for some integer } n > 0 \} &#92;]</span>
</div>

<div class="theorem">
<strong>Theorem 2.6.</strong> Let <span>&#92;(I&#92;)</span> be an ideal of a ring <span>&#92;(R&#92;)</span>. Then <span>&#92;(\text{rad}(I)&#92;)</span> is a radical ideal of <span>&#92;(R&#92;)</span> containing <span>&#92;(I&#92;)</span>.
</div>

<div class="proof">
<em>Proof sketch.</em> Clearly <span>&#92;(I \subseteq \text{rad}(I)&#92;)</span> (take <span>&#92;(n = 1&#92;)</span>). For closure under multiplication: if <span>&#92;(j \in \text{rad}(I)&#92;)</span> with <span>&#92;(j^n \in I&#92;)</span>, then <span>&#92;((rj)^n = r^n j^n \in I&#92;)</span>. For radical: if <span>&#92;(j^n \in \text{rad}(I)&#92;)</span>, then <span>&#92;((j^n)^m \in I&#92;)</span>, so <span>&#92;(j^{nm} \in I&#92;)</span>. For closure under addition: if <span>&#92;(j&#95;1^{n&#95;1} \in I&#92;)</span> and <span>&#92;(j&#95;2^{n&#95;2} \in I&#92;)</span>, then every term of <span>&#92;((j&#95;1 \pm j&#95;2)^{n&#95;1 + n&#95;2}&#92;)</span> contains either a factor of <span>&#92;(j&#95;1^{n&#95;1}&#92;)</span> or <span>&#92;(j&#95;2^{n&#95;2}&#92;)</span>, so <span>&#92;((j&#95;1 \pm j&#95;2)^{n&#95;1+n&#95;2} \in I&#92;)</span>. ∎
</div>

We are now ready for the big correspondence.

<div class="theorem">
<strong>Theorem 2.7 (Hilbert's Nullstellensatz).</strong> Let <span>&#92;(n&#92;)</span> be a positive integer. There is a bijection:
<span>&#92;[ \{\text{algebraic subsets of } \mathbb{A}^n\} \longleftrightarrow \{\text{radical ideals of } \mathbb{C}[x&#95;1, \ldots, x&#95;n]\} &#92;]</span>
given by <span>&#92;(X \mapsto I(X)&#92;)</span> and <span>&#92;(I \mapsto V(I)&#92;)</span>.
</div>

This correspondence is more awesome than it appears. Under it:
- Bigger ideals correspond to **smaller** algebraic sets: <span>&#92;(X \subset Y&#92;)</span> if and only if <span>&#92;(I(Y) \subset I(X)&#92;)</span>.
- Unions of algebraic sets correspond to **intersections** of ideals: <span>&#92;(I(X \cup Y) = I(X) \cap I(Y)&#92;)</span>.
- **Maximal ideals** correspond to single points: <span>&#92;(I(X)&#92;)</span> is maximal if and only if <span>&#92;(X&#92;)</span> is a single point. (The key insight is the evaluation homomorphism <span>&#92;(\phi: \mathbb{C}[x&#95;1,\ldots,x&#95;n] \to \mathbb{C}&#92;)</span> defined by <span>&#92;(\phi(f) = f(P)&#92;)</span>, which is surjective with kernel <span>&#92;(I(P)&#92;)</span>.)
- **Prime ideals** correspond to **irreducible** algebraic sets.

<div class="definition">
<strong>Definition 2.8.</strong> Let <span>&#92;(X&#92;)</span> be a nonempty algebraic set. We say that <span>&#92;(X&#92;)</span> is <strong>reducible</strong> if and only if it is the union <span>&#92;(X = Y&#95;1 \cup Y&#95;2&#92;)</span> of two proper algebraic subsets. We say that <span>&#92;(X&#92;)</span> is <strong>irreducible</strong> if and only if it is not reducible. (The empty set is neither irreducible nor reducible.)
</div>

The proof of the correspondence between prime ideals and irreducible sets is elegant: if <span>&#92;(I(X)&#92;)</span> is not prime, there exist polynomials <span>&#92;(f&#95;1, f&#95;2 \notin I(X)&#92;)</span> with <span>&#92;(f&#95;1 f&#95;2 \in I(X)&#92;)</span>. Then <span>&#92;(X = (X \cap V(f&#95;1)) \cup (X \cap V(f&#95;2))&#92;)</span> is a decomposition into proper algebraic subsets.

---

## Week 2: Polynomial Maps and Coordinate Rings

### 1. Morphisms

These days, every time mathematicians start a new subject, they define the objects they are interested in, and then immediately define the *relationships* between them. For algebraic sets, those relationships are functions that preserve their algebraic structure.

<div class="definition">
<strong>Definition 1.1.</strong> Let <span>&#92;(X \subset \mathbb{A}^n&#92;)</span> and <span>&#92;(Y \subset \mathbb{A}^m&#92;)</span> be algebraic sets. A <strong>polynomial map</strong> from <span>&#92;(X&#92;)</span> to <span>&#92;(Y&#92;)</span> is a function <span>&#92;(\phi : X \to Y&#92;)</span> such that the coordinates of <span>&#92;(\phi = (\phi&#95;1, \ldots, \phi&#95;m)&#92;)</span> are all polynomials in the coordinates of <span>&#92;(\mathbb{A}^n&#92;)</span>.
</div>

For example, <span>&#92;(\phi : \mathbb{A}^1 \to \mathbb{A}^3&#92;)</span> given by <span>&#92;(\phi(t) = (t, t^2, t^3)&#92;)</span> is a polynomial map (parametrizing the twisted cubic). The map <span>&#92;(\phi : H \to C&#92;)</span> given by <span>&#92;(\phi(x,y) = (x, iy)&#92;)</span> from the hyperbola <span>&#92;(H: x^2 - y^2 = 1&#92;)</span> to the circle <span>&#92;(C: x^2 + y^2 = 1&#92;)</span> is a polynomial map — with polynomial inverse <span>&#92;(\psi(x,y) = (x, -iy)&#92;)</span> — and so it is an isomorphism.

<div class="definition">
<strong>Definition 1.2.</strong> A polynomial map <span>&#92;(f : X \to Y&#92;)</span> is an <strong>isomorphism</strong> if there is a polynomial map <span>&#92;(g : Y \to X&#92;)</span> such that <span>&#92;(f \circ g = \text{id}&#92;)</span> and <span>&#92;(g \circ f = \text{id}&#92;)</span>.
</div>

**Warning:** a polynomial map that is one-to-one and onto is *not* necessarily an isomorphism — you also need the inverse to be a polynomial map.

### 2. Coordinate Rings

The ideal of an algebraic set is not invariant under isomorphism. For example, the <span>&#92;(x&#92;)</span>-axis in <span>&#92;(\mathbb{A}^2&#92;)</span> has ideal <span>&#92;((y)&#92;)</span>, while the <span>&#92;(x&#92;)</span>-axis in <span>&#92;(\mathbb{A}^3&#92;)</span> has ideal <span>&#92;((y, z)&#92;)</span> — but these are clearly isomorphic algebraic sets. We need something better.

<div class="definition">
<strong>Definition 1.3.</strong> Let <span>&#92;(X \subset \mathbb{A}^n&#92;)</span> be an algebraic set with ideal <span>&#92;(I(X)&#92;)</span>. The <strong>coordinate ring</strong> of <span>&#92;(X&#92;)</span> is the ring:
<span>&#92;[ \Gamma(X) = \mathbb{C}[x&#95;1, \ldots, x&#95;n] / I(X) &#92;]</span>
which is the ring of polynomial maps from <span>&#92;(X&#92;)</span> to <span>&#92;(\mathbb{A}^1&#92;)</span>.
</div>

Why is <span>&#92;(\Gamma(X)&#92;)</span> the ring of polynomial maps from <span>&#92;(X&#92;)</span> to <span>&#92;(\mathbb{A}^1&#92;)</span>? Because <span>&#92;(f&#92;)</span> and <span>&#92;(g&#92;)</span> agree on <span>&#92;(X&#92;)</span> if and only if <span>&#92;(f - g&#92;)</span> vanishes on <span>&#92;(X&#92;)</span>, i.e., <span>&#92;(f \equiv g \pmod{I(X)}&#92;)</span>.

The Nullstellensatz correspondence still works for coordinate rings:

<div class="theorem">
<strong>Theorem 1.4.</strong> There is a bijection between algebraic subsets of <span>&#92;(X&#92;)</span> and radical ideals of <span>&#92;(\Gamma(X)&#92;)</span>. Under this correspondence, points correspond to maximal ideals, and irreducible subsets correspond to prime ideals.
</div>

### 3. Pullbacks

Given a polynomial map <span>&#92;(\phi : X \to Y&#92;)</span>, we can turn it into a homomorphism going *backwards*. If someone hands us a polynomial map <span>&#92;(f : Y \to \mathbb{A}^1&#92;)</span>, we can compose to get <span>&#92;(f \circ \phi : X \to \mathbb{A}^1&#92;)</span>.

<div class="definition">
<strong>Definition 1.5.</strong> Let <span>&#92;(X&#92;)</span> and <span>&#92;(Y&#92;)</span> be rings containing <span>&#92;(\mathbb{C}&#92;)</span> (called <span>&#92;(\mathbb{C}&#92;)</span>-<strong>algebras</strong>). A <strong><span>&#92;(\mathbb{C}&#92;)</span>-algebra homomorphism</strong> is a ring homomorphism <span>&#92;(\phi : X \to Y&#92;)</span> satisfying <span>&#92;(\phi(z) = z&#92;)</span> for all <span>&#92;(z \in \mathbb{C}&#92;)</span>.
</div>

<div class="definition">
<strong>Definition 1.6.</strong> Let <span>&#92;(\phi : X \to Y&#92;)</span> be a polynomial map of algebraic sets. The <strong>pullback</strong> of <span>&#92;(\phi&#92;)</span> is the <span>&#92;(\mathbb{C}&#92;)</span>-algebra homomorphism:
<span>&#92;[ \phi^&#42; : \Gamma(Y) \to \Gamma(X) \quad \text{given by} \quad \phi^&#42;(f) = f \circ \phi &#92;]</span>
</div>

<div class="theorem">
<strong>Theorem 1.7.</strong> For any <span>&#92;(\mathbb{C}&#92;)</span>-algebra homomorphism <span>&#92;(\psi : \Gamma(Y) \to \Gamma(X)&#92;)</span>, there is a polynomial map <span>&#92;(\phi : X \to Y&#92;)</span> such that <span>&#92;(\psi = \phi^&#42;&#92;)</span>.
</div>

<div class="proof">
<em>Proof sketch.</em> Say <span>&#92;(X \subset \mathbb{A}^n&#92;)</span> and <span>&#92;(Y \subset \mathbb{A}^m&#92;)</span>. To build <span>&#92;(\phi&#92;)</span>, we need <span>&#92;(m&#92;)</span> polynomials. The <span>&#92;(i&#92;)</span>th coordinate function on <span>&#92;(Y&#92;)</span> is just <span>&#92;(x&#95;i&#92;)</span>, so set <span>&#92;(\phi&#95;i&#92;)</span> to be any polynomial representative of <span>&#92;(\psi(x&#95;i) \in \Gamma(X)&#92;)</span>. Define <span>&#92;(\phi(P) = (\phi&#95;1(P), \ldots, \phi&#95;m(P))&#92;)</span>. One then verifies that <span>&#92;(\phi^&#42;(I(Y)) \subset I(X)&#92;)</span>, so <span>&#92;(\phi&#92;)</span> maps <span>&#92;(X&#92;)</span> to <span>&#92;(Y&#92;)</span>, and that <span>&#92;(\phi^&#42; = \psi&#92;)</span>. ∎
</div>

<div class="theorem">
<strong>Theorem 1.8.</strong> Let <span>&#92;(X&#92;)</span> and <span>&#92;(Y&#92;)</span> be algebraic sets. Then <span>&#92;(X \cong Y&#92;)</span> if and only if <span>&#92;(\Gamma(X) \cong \Gamma(Y)&#92;)</span> as <span>&#92;(\mathbb{C}&#92;)</span>-algebras. Moreover, if <span>&#92;(\phi : X \to Y&#92;)</span> is an isomorphism and <span>&#92;(V \subset Y&#92;)</span> is any algebraic subset, then <span>&#92;(I(\phi^{-1}(V)) = \phi^&#42; I(V)&#92;)</span>.
</div>

This is the coup de grâce: two algebraic sets are isomorphic if and only if their coordinate rings are isomorphic as <span>&#92;(\mathbb{C}&#92;)</span>-algebras.

---

## Week 3: Rational Functions and Local Rings

### 1. Varieties and Function Fields

So far, our algebra has been limited to addition, subtraction, and multiplication. Time to add division. Division works better in rings without zero divisors — and recall from last week that <span>&#92;(\Gamma(X)&#92;)</span> is a domain if and only if <span>&#92;(X&#92;)</span> is irreducible.

Moreover, every algebraic set is a *finite* union of irreducible algebraic sets (by the Noetherian property of <span>&#92;(\mathbb{C}[x&#95;1, \ldots, x&#95;n]&#92;)</span>), and this decomposition is unique. This motivates a special name.

<div class="definition">
<strong>Definition 1.1.</strong> Let <span>&#92;(X = X&#95;1 \cup \cdots \cup X&#95;r&#92;)</span> be an expression of <span>&#92;(X&#92;)</span> as the union of finitely many irreducible algebraic subsets. The sets <span>&#92;(X&#95;i&#92;)</span> are called the <strong>irreducible components</strong> of <span>&#92;(X&#92;)</span>.
</div>

<div class="definition">
<strong>Definition 1.2.</strong> A <strong>variety</strong> is an irreducible algebraic set.
</div>

<div class="definition">
<strong>Definition 1.3.</strong> Let <span>&#92;(X&#92;)</span> be a variety. The <strong>function field</strong> <span>&#92;(K(X)&#92;)</span> of <span>&#92;(X&#92;)</span> is the fraction field of the coordinate ring <span>&#92;(\Gamma(X)&#92;)</span>. An element of <span>&#92;(K(X)&#92;)</span> is called a <strong>rational function</strong>.
</div>

The function field of <span>&#92;(\mathbb{A}^n&#92;)</span> is <span>&#92;(\mathbb{C}(x&#95;1, \ldots, x&#95;n)&#92;)</span>, the field of rational functions of <span>&#92;(n&#92;)</span> variables. In general, elements of <span>&#92;(K(X)&#92;)</span> are fractions of elements of <span>&#92;(\Gamma(X)&#92;)</span>. These fractions are *almost* functions: they may fail to be defined at points where the denominator vanishes.

<div class="definition">
<strong>Definition 1.4.</strong> Let <span>&#92;(f&#92;)</span> be a rational function on a variety <span>&#92;(X&#92;)</span>, and let <span>&#92;(P \in X&#92;)</span> be a point. Then <span>&#92;(f&#92;)</span> is <strong>defined at</strong> <span>&#92;(P&#92;)</span> if there is some expression <span>&#92;(f = p/q&#92;)</span> for <span>&#92;(p, q \in \Gamma(X)&#92;)</span> with <span>&#92;(q(P) \neq 0&#92;)</span>. If <span>&#92;(f&#92;)</span> is not defined at <span>&#92;(P&#92;)</span>, we say that <span>&#92;(P&#92;)</span> is a <strong>pole</strong> of <span>&#92;(f&#92;)</span>.
</div>

A subtlety: even if one representation has a zero denominator, another might not. For example, on <span>&#92;(V(y^2 - x^3 + x)&#92;)</span>, the function <span>&#92;(x/y&#92;)</span> appears to have a pole at <span>&#92;((0,0)&#92;)</span>, but <span>&#92;(x/y = y/(x^2 - 1)&#92;)</span>, which has a nonzero denominator at the origin.

<div class="theorem">
<strong>Theorem 1.5.</strong> If <span>&#92;(f = p/q&#92;)</span> with <span>&#92;(q(P) = 0&#92;)</span> and <span>&#92;(p(P) \neq 0&#92;)</span>, then <span>&#92;(P&#92;)</span> is a pole of <span>&#92;(f&#92;)</span>.
</div>

<div class="proof">
<em>Proof.</em> For any representation <span>&#92;(f = a/b&#92;)</span>, we have <span>&#92;(aq = bp&#92;)</span>. Since <span>&#92;(q(P) = 0&#92;)</span>, we get <span>&#92;((bp)(P) = 0&#92;)</span>, and since <span>&#92;(p(P) \neq 0&#92;)</span>, this forces <span>&#92;(b(P) = 0&#92;)</span>. So every representation of <span>&#92;(f&#92;)</span> has a vanishing denominator at <span>&#92;(P&#92;)</span>. ∎
</div>

### 2. Local Rings

<div class="definition">
<strong>Definition 1.6.</strong> Let <span>&#92;(X&#92;)</span> be a variety, <span>&#92;(P \in X&#92;)</span>. The <strong>local ring at <span>&#92;(P&#92;)</span></strong> is:
<span>&#92;[ \mathcal{O}&#95;P(X) = \{ f \in K(X) \mid f \text{ is defined at } P \} &#92;]</span>
Its maximal ideal is <span>&#92;(\mathfrak{m}&#95;P(X) = \{ f \in \mathcal{O}&#95;P(X) \mid f(P) = 0 \}&#92;)</span>, and we have <span>&#92;(\mathfrak{m}&#95;P(X) = I(P) \cdot \mathcal{O}&#95;P(X)&#92;)</span>.
</div>

The local ring captures all the information about a variety near a particular point, filtering out global concerns.

---

## Week 4: Rational Maps and the Zariski Topology

### 1. The Zariski Topology

<div class="definition">
<strong>Definition 0.1.</strong> Let <span>&#92;(V&#92;)</span> be an algebraic variety. A <strong>Zariski closed</strong> subset of <span>&#92;(V&#92;)</span> is an algebraic subset of <span>&#92;(V&#92;)</span>. A subset <span>&#92;(U \subset V&#92;)</span> is <strong>Zariski open</strong> if <span>&#92;(V - U&#92;)</span> is Zariski closed.
</div>

The Zariski topology is named after Oscar Zariski, the great Russian-American mathematician who helped found algebraic geometry as a rigorous subject. **Beware:** it is a truly terrible topology, very far from Hausdorff. If two Zariski open sets are disjoint, then at least one of them is empty!

### 2. Rational Maps

<div class="definition">
<strong>Definition 0.2.</strong> Let <span>&#92;(V&#92;)</span> and <span>&#92;(W&#92;)</span> be varieties. A <strong>rational map</strong> from <span>&#92;(V&#92;)</span> to <span>&#92;(W&#92;)</span> is a function <span>&#92;(f : U \to W&#92;)</span> for some nonempty Zariski open subset <span>&#92;(U \subset V&#92;)</span>, such that for every point <span>&#92;(P \in U&#92;)</span>, there are rational functions <span>&#92;(f&#95;1, \ldots, f&#95;r&#92;)</span> on <span>&#92;(V&#92;)</span>, all defined at <span>&#92;(P&#92;)</span>, with <span>&#92;(f(Q) = (f&#95;1(Q), \ldots, f&#95;r(Q))&#92;)</span> for all <span>&#92;(Q&#92;)</span> where these are defined. We write <span>&#92;(f : V \dashrightarrow W&#92;)</span> for rational maps.
</div>

A rational map is a <strong>morphism</strong> on <span>&#92;(V' \subset V&#92;)</span> if it is defined at every point of <span>&#92;(V'&#92;)</span>. Every polynomial map is a morphism. We will henceforth use "morphism" in place of "polynomial map".

<div class="definition">
<strong>Definition 0.3.</strong> Let <span>&#92;(U \subset V&#92;)</span> be a Zariski open subset. The <strong>ring of functions</strong> on <span>&#92;(U&#92;)</span> is:
<span>&#92;[ \Gamma(U) = \{ f \in K(V) \mid f \text{ has no poles in } U \} &#92;]</span>
</div>

<div class="theorem">
<strong>Theorem 0.5.</strong> Let <span>&#92;(V&#92;)</span> be an affine variety, <span>&#92;(U \subset V&#92;)</span> a nonempty Zariski open subset. If <span>&#92;(U = V - V(f)&#92;)</span> for some <span>&#92;(f \in \Gamma(V)&#92;)</span>, then:
<span>&#92;[ \Gamma(U) = \Gamma(V)[1/f] = \{ p/f^r \mid r \in \mathbb{Z},\, p \in \Gamma(V) \} &#92;]</span>
</div>

An interesting consequence: for <span>&#92;(U = \mathbb{A}^2 - \{(0,0)\}&#92;)</span>, we have <span>&#92;(\Gamma(U) = \mathbb{C}[x,y]&#92;)</span>! This is because any function with a pole only at the origin would need a pole set of dimension 1 (a curve), by Krull's theorem, but there's no such curve vanishing only at <span>&#92;((0,0)&#92;)</span>.

<div class="theorem">
<strong>Theorem 0.6 (Krull's Hauptidealsatz).</strong> Let <span>&#92;(X&#92;)</span> be a variety of dimension <span>&#92;(n&#92;)</span>, and <span>&#92;(f \in \Gamma(X)&#92;)</span> a non-constant function. Then every irreducible component of the algebraic set <span>&#92;(V(f) \subset X&#92;)</span> has dimension <span>&#92;(n-1&#92;)</span>.
</div>

<div class="theorem">
<strong>Theorem 0.7.</strong> Let <span>&#92;(\phi : V \dashrightarrow W&#92;)</span> be a rational map defined at <span>&#92;(P \in V&#92;)</span>. Then <span>&#92;(\phi^&#42;&#92;)</span> induces a ring homomorphism <span>&#92;(\mathcal{O}&#95;{\phi(P)}(W) \to \mathcal{O}&#95;P(V)&#92;)</span>. Moreover, if <span>&#92;(\phi&#92;)</span> is birational with <span>&#92;(\phi^{-1}&#92;)</span> defined at <span>&#92;(\phi(P)&#92;)</span>, then <span>&#92;(\phi^&#42;&#92;)</span> induces an isomorphism of local rings.
</div>

---

## Week 5: Dimension and Smoothness

### 1. Dimension

Defining the dimension of an algebraic set is a giant pain in the neck — so of course we do it.

<div class="definition">
<strong>Definition 1.1.</strong> Let <span>&#92;(V&#92;)</span> be a variety. Let <span>&#92;(V&#95;0 \subsetneq V&#95;1 \subsetneq \cdots \subsetneq V&#95;n = V&#92;)</span> be a chain of maximal length with each <span>&#92;(V&#95;i&#92;)</span> a variety. The <strong>dimension</strong> of <span>&#92;(V&#92;)</span> is <span>&#92;(n&#92;)</span>.
</div>

<div class="definition">
<strong>Definition 1.2.</strong> Let <span>&#92;(D&#92;)</span> be a domain. Let <span>&#92;(P&#95;0 \supsetneq P&#95;1 \supsetneq \cdots \supsetneq P&#95;n = (0)&#92;)</span> be a chain of maximal length with each <span>&#92;(P&#95;i&#92;)</span> a prime ideal of <span>&#92;(D&#92;)</span>. The <strong>Krull dimension</strong> of <span>&#92;(D&#92;)</span> is <span>&#92;(n&#92;)</span>.
</div>

By the Nullstellensatz, the dimension of <span>&#92;(V&#92;)</span> equals the Krull dimension of <span>&#92;(\Gamma(V)&#92;)</span>.

<div class="theorem">
<strong>Theorem 1.3.</strong> The dimension of <span>&#92;(\mathbb{A}^n&#92;)</span> is <span>&#92;(n&#92;)</span>.
</div>

**Example:** The twisted cubic <span>&#92;(C = V(y - x^2, z - x^3) \subset \mathbb{A}^3&#92;)</span> has dimension 1. We can demonstrate this by the chain <span>&#92;((1,1,1) \subsetneq C \subsetneq V(y-x^2) \subsetneq \mathbb{A}^3&#92;)</span>, which must be maximal since <span>&#92;(\mathbb{A}^3&#92;)</span> has dimension 3.

### 2. Smoothness

For a variety to admit local coordinates near a point <span>&#92;(P&#92;)</span>, we need the tangent vectors to span a <span>&#92;(d&#92;)</span>-dimensional space (where <span>&#92;(d = \dim V&#92;)</span>), with the gradients <span>&#92;(\nabla f&#95;i(P)&#92;)</span> spanning an <span>&#92;((n-d)&#92;)</span>-dimensional perpendicular space.

<div class="definition">
<strong>Definition 2.1.</strong> Let <span>&#92;(P&#92;)</span> be a point on an algebraic set <span>&#92;(V \subset \mathbb{A}^n&#92;)</span> with <span>&#92;(I(V) = (f&#95;1, \ldots, f&#95;m)&#92;)</span>. The <strong>Jacobian matrix</strong> of <span>&#92;(V&#92;)</span> at <span>&#92;(P&#92;)</span> is the <span>&#92;(m \times n&#92;)</span> matrix <span>&#92;(J&#95;V(P)&#92;)</span> whose <span>&#92;((i,j)&#92;)</span> entry is <span>&#92;(\frac{\partial f&#95;i}{\partial x&#95;j}(P)&#92;)</span>.
</div>

<div class="definition">
<strong>Definition 2.2.</strong> A point <span>&#92;(P&#92;)</span> on a variety <span>&#92;(V \subset \mathbb{A}^n&#92;)</span> is a <strong>smooth point</strong> if and only if <span>&#92;(\text{rank}(J&#95;V(P)) = n - \dim V&#92;)</span>. Otherwise <span>&#92;(P&#92;)</span> is a <strong>singular point</strong>.
</div>

<div class="theorem">
<strong>Theorem 2.3.</strong> Let <span>&#92;(V = V(f) \subset \mathbb{A}^n&#92;)</span> for a nonzero polynomial <span>&#92;(f&#92;)</span>. Then <span>&#92;(\dim V = n-1&#92;)</span> and <span>&#92;(V&#92;)</span> is smooth at <span>&#92;(P&#92;)</span> if and only if <span>&#92;(\nabla f(P) \neq 0&#92;)</span>.
</div>

For example, the node <span>&#92;(P = (0,0)&#92;)</span> on <span>&#92;(V(y^2 - x^3 - x^2)&#92;)</span> is singular because <span>&#92;(\nabla(y^2 - x^3 - x^2)\big|&#95;{(0,0)} = (-3x^2 - 2x, 2y)\big|&#95;{(0,0)} = (0,0)&#92;)</span>. Geometrically, the origin has two competing tangent lines.

<div class="theorem">
<strong>Theorem 2.4.</strong> Let <span>&#92;(P&#92;)</span> be a point on <span>&#92;(V \subset \mathbb{A}^n&#92;)</span>, and <span>&#92;(\mathfrak{m} = \mathfrak{m}(P) \subset \Gamma(V)&#92;)</span> the maximal ideal at <span>&#92;(P&#92;)</span>. Then:
<span>&#92;[ \dim&#95;{\mathbb{C}} \mathfrak{m}/\mathfrak{m}^2 + \text{rank}(J&#95;V(P)) = n &#92;]</span>
In particular, the rank of the Jacobian matrix is independent of the choice of generators for <span>&#92;(I(V)&#92;)</span>.
</div>

---

## Week 6: The Zariski Tangent Space

The row space of the Jacobian matrix is the span of the gradient vectors <span>&#92;(\nabla f&#95;i(P)&#92;)</span>, which is perpendicular to the null space of the Jacobian. This null space is isomorphic to <span>&#92;(\mathfrak{m}/\mathfrak{m}^2&#92;)</span>.

<div class="definition">
<strong>Definition 1.1.</strong> Let <span>&#92;(V \subset \mathbb{A}^n&#92;)</span> be a variety, <span>&#92;(P \in V&#92;)</span>. Let <span>&#92;(\mathcal{O}&#95;P(V)&#92;)</span> be the local ring at <span>&#92;(P&#92;)</span> with maximal ideal <span>&#92;(\mathfrak{m} = \mathfrak{m}&#95;P(V)&#92;)</span>. The <strong>Zariski tangent space</strong> to <span>&#92;(V&#92;)</span> at <span>&#92;(P&#92;)</span> is:
<span>&#92;[ T&#95;P(V) = (\mathfrak{m}/\mathfrak{m}^2)^&#42; &#92;]</span>
(the dual <span>&#92;(\mathbb{C}&#92;)</span>-vector space to <span>&#92;(\mathfrak{m}&#95;P(V)/\mathfrak{m}&#95;P(V)^2&#92;)</span>). The <strong>tangent space</strong> to <span>&#92;(V&#92;)</span> at <span>&#92;(P&#92;)</span> is:
<span>&#92;[ T&#95;P(V) = P + \ker J&#95;P(V) \subset \mathbb{A}^n &#92;]</span>
</div>

The reason we use the local ring <span>&#92;(\mathcal{O}&#95;P(V)&#92;)</span> rather than <span>&#92;(\Gamma(V)&#92;)</span> is justified by the following theorem, which shows that the two definitions of <span>&#92;(\mathfrak{m}/\mathfrak{m}^2&#92;)</span> agree:

<div class="theorem">
<strong>Theorem 1.2.</strong> Let <span>&#92;(D&#92;)</span> be a domain, <span>&#92;(D&#95;{\mathfrak{m}}&#92;)</span> the localization at a maximal ideal <span>&#92;(\mathfrak{m}&#92;)</span>. For any positive integer <span>&#92;(n&#92;)</span>, there is a natural isomorphism:
<span>&#92;[ \mathfrak{m}^{n-1}/\mathfrak{m}^n \cong \mathfrak{M}^{n-1}/\mathfrak{M}^n &#92;]</span>
where <span>&#92;(\mathfrak{M}&#92;)</span> denotes the ideal of <span>&#92;(D&#95;{\mathfrak{m}}&#92;)</span> generated by <span>&#92;(\mathfrak{m}&#92;)</span>. In particular, <span>&#92;(\mathfrak{m}/\mathfrak{m}^2 \cong \mathfrak{M}/\mathfrak{M}^2&#92;)</span>.
</div>

---

## Week 7: Projective Space

### 1. Motivation

Consider the hyperbola <span>&#92;(V: xy = 1&#92;)</span> and the <span>&#92;(x&#92;)</span>-axis <span>&#92;(W&#92;)</span>. The map <span>&#92;(f(x,y) = x&#92;)</span> is almost an isomorphism, but the inverse <span>&#92;(g(x,0) = (x, 1/x)&#92;)</span> is undefined at <span>&#92;(x = 0&#92;)</span>. As <span>&#92;(x \to 0&#92;)</span>, the curve <span>&#92;(V&#92;)</span> goes off to infinity. The missing point is *infinity* itself.

Writing <span>&#92;(x = X/Z&#92;)</span> and <span>&#92;(y = Y/Z&#92;)</span>, the equation becomes <span>&#92;(XY = Z^2&#92;)</span>, and <span>&#92;(x = 0&#92;)</span> becomes <span>&#92;(X = 0, Z = 0&#92;)</span>. The key is that we care about *ratios*, not individual values.

<div class="definition">
<strong>Definition 1.1.</strong> Let <span>&#92;(n&#92;)</span> be a positive integer. Complex <strong>projective space</strong> <span>&#92;(\mathbb{P}^n&#92;)</span> is the set of nonzero <span>&#92;((n+1)&#92;)</span>-tuples of complex numbers, modulo the equivalence <span>&#92;(v \sim w&#92;)</span> if and only if <span>&#92;(v = \lambda w&#92;)</span> for some <span>&#92;(\lambda \in \mathbb{C}&#92;)</span>. We write points as <span>&#92;([x&#95;0 : x&#95;1 : \cdots : x&#95;n]&#92;)</span>.
</div>

For <span>&#92;(\mathbb{P}^1&#92;)</span> (the projective line): the point <span>&#92;([x:y]&#92;)</span> represents the fraction <span>&#92;(x/y&#92;)</span>, and the single point with <span>&#92;(y = 0&#92;)</span> represents <span>&#92;(\infty&#92;)</span>. So <span>&#92;(\mathbb{P}^1 = \mathbb{C} \cup \{\infty\}&#92;)</span>. More precisely, <span>&#92;(\mathbb{P}^1&#92;)</span> is two copies of <span>&#92;(\mathbb{C}&#92;)</span> glued together, where a nonzero complex number <span>&#92;(z&#92;)</span> is glued to <span>&#92;(1/z&#92;)</span>.

For <span>&#92;(\mathbb{P}^2&#92;)</span>: the new points with <span>&#92;(z = 0&#92;)</span> form a copy of <span>&#92;(\mathbb{P}^1&#92;)</span>, called the **line at infinity**. So morally, <span>&#92;(\mathbb{P}^2 = \mathbb{A}^2 \cup \mathbb{P}^1&#92;)</span>. In general, <span>&#92;(\mathbb{P}^n&#92;)</span> is <span>&#92;(n+1&#92;)</span> copies of <span>&#92;(\mathbb{A}^n&#92;)</span> glued together, with <span>&#92;(\mathbb{P}^n - \mathbb{A}^n&#92;)</span> being a copy of <span>&#92;(\mathbb{P}^{n-1}&#92;)</span>.

The **standard open affine subsets** are <span>&#92;(U&#95;i = \{[x&#95;0 : \cdots : x&#95;n] \mid x&#95;i \neq 0\} \cong \mathbb{A}^n&#92;)</span>, embedded by <span>&#92;((x&#95;0, \ldots, \hat{x}&#95;i, \ldots, x&#95;n) \mapsto [x&#95;0 : \cdots : x&#95;{i-1} : 1 : x&#95;{i+1} : \cdots : x&#95;n]&#92;)</span>.

### 2. Projective Algebraic Sets

<div class="definition">
<strong>Definition 1.2.</strong> An <strong>algebraic subset of <span>&#92;(\mathbb{P}^n&#92;)</span></strong> is a subset <span>&#92;(X \subset \mathbb{P}^n&#92;)</span> such that for all <span>&#92;(i&#92;)</span>, <span>&#92;(X \cap U&#95;i&#92;)</span> is an algebraic subset of <span>&#92;(U&#95;i \cong \mathbb{A}^n&#92;)</span>.
</div>

<div class="definition">
<strong>Definition 1.3.</strong> A polynomial <span>&#92;(f(X&#95;0, \ldots, X&#95;n)&#92;)</span> is <strong>homogeneous</strong> if every term of <span>&#92;(f&#92;)</span> has the same degree.
</div>

Note that homogeneous polynomials are not functions on projective space (rescaling changes the value), but whether they are *zero* or not is well-defined: if <span>&#92;(F&#92;)</span> is homogeneous of degree <span>&#92;(d&#92;)</span>, then <span>&#92;(F(\lambda X&#95;0, \ldots, \lambda X&#95;n) = \lambda^d F(X&#95;0, \ldots, X&#95;n)&#92;)</span>.

<div class="theorem">
<strong>Theorem 1.4.</strong> A subset <span>&#92;(V \subset \mathbb{P}^n&#92;)</span> is algebraic if and only if it is the zero set <span>&#92;(V(F&#95;1, \ldots, F&#95;r)&#92;)</span> of a finite set of homogeneous polynomials <span>&#92;(F&#95;i&#92;)</span>.
</div>

**Examples:** The projective curve <span>&#92;(V(XY - Z^2) \subset \mathbb{P}^2&#92;)</span> is a hyperbola when viewed on <span>&#92;(Z \neq 0&#92;)</span>, but a *parabola* when viewed on <span>&#92;(X \neq 0&#92;)</span>! The difference between a hyperbola and a parabola is just how many points at infinity they have: the hyperbola meets <span>&#92;(Z = 0&#92;)</span> in two points <span>&#92;([1:0:0]&#92;)</span> and <span>&#92;([0:1:0]&#92;)</span>, while the parabola has only one such point.

<div class="definition">
<strong>Definition 1.5.</strong> The <strong>irrelevant ideal</strong> of <span>&#92;(\mathbb{C}[X&#95;0, \ldots, X&#95;n]&#92;)</span> is the ideal <span>&#92;((X&#95;0, \ldots, X&#95;n)&#92;)</span>.
</div>

<div class="theorem">
<strong>Theorem 1.6 (Projective Nullstellensatz).</strong> There is a bijection:
<span>&#92;[ \{\text{algebraic subsets of } \mathbb{P}^n\} \longleftrightarrow \{\text{RRH ideals of } \mathbb{C}[x&#95;0,\ldots,x&#95;n]\} &#92;]</span>
where "RRH" stands for "relevant radical homogeneous". (The irrelevant ideal is excluded because its zero set is empty despite not being the unit ideal.)
</div>

<div class="definition">
<strong>Definition 1.7.</strong> A nonempty projective algebraic set is <strong>reducible</strong> if and only if it is the union of two proper projective algebraic subsets. It is <strong>irreducible</strong> if not.
</div>

<div class="theorem">
<strong>Theorem 1.8.</strong> A projective algebraic set <span>&#92;(V&#92;)</span> is irreducible if and only if <span>&#92;(I(V)&#92;)</span> is prime.
</div>

### 3. Projective Closure

<div class="definition">
<strong>Definition 1.9.</strong> Let <span>&#92;(V \subset \mathbb{A}^n&#92;)</span> be an affine algebraic set, viewed inside <span>&#92;(\mathbb{P}^n&#92;)</span>. The <strong>projective closure</strong> of <span>&#92;(V&#92;)</span> is the intersection of all projective algebraic sets containing <span>&#92;(V&#92;)</span>.
</div>

<div class="theorem">
<strong>Theorem 1.10.</strong> If <span>&#92;(V = V(F)&#92;)</span> for a polynomial <span>&#92;(F&#92;)</span> of degree <span>&#92;(d&#92;)</span>, then the projective closure of <span>&#92;(V&#92;)</span> is <span>&#92;(V(f)&#92;)</span>, where <span>&#92;(f = x&#95;0^d F(x&#95;1/x&#95;0, \ldots, x&#95;n/x&#95;0)&#92;)</span> is the <strong>homogenization</strong> of <span>&#92;(F&#92;)</span>.
</div>

---

## Week 8: Projective Morphisms and Curves

### 1. Projective Morphisms

Defining projective morphisms requires care. An <span>&#92;((m+1)&#92;)</span>-tuple of homogeneous polynomials <span>&#92;([f&#95;0 : \cdots : f&#95;m]&#92;)</span> works *if* the polynomials all have the same degree and never simultaneously vanish on our variety. But different tuples might represent the same map.

<div class="definition">
<strong>Definition 1.1.</strong> Let <span>&#92;(V \subset \mathbb{P}^n&#92;)</span> and <span>&#92;(W \subset \mathbb{P}^m&#92;)</span> be projective algebraic sets. A <strong>morphism</strong> from <span>&#92;(V&#92;)</span> to <span>&#92;(W&#92;)</span> is a function <span>&#92;(f : V \to W&#92;)</span> such that for every point <span>&#92;(P \in V&#92;)</span>, there is an <span>&#92;((m+1)&#92;)</span>-tuple <span>&#92;([f&#95;0 : \cdots : f&#95;m]&#92;)</span> of homogeneous polynomials of the same degree with <span>&#92;(f&#95;i(P) \neq 0&#92;)</span> for some <span>&#92;(i&#92;)</span>, such that <span>&#92;(f(Q) = [f&#95;0(Q) : \cdots : f&#95;m(Q)]&#92;)</span> for all nearby <span>&#92;(Q&#92;)</span>.
</div>

<div class="definition">
<strong>Definition 1.2.</strong> A <strong>rational map</strong> from <span>&#92;(V&#92;)</span> to <span>&#92;(W&#92;)</span> is a morphism that need not be defined everywhere.
</div>

The projective function field and local rings are defined by passing to affine pieces:

<div class="definition">
<strong>Definition 1.3.</strong> The <strong>function field</strong> <span>&#92;(K(V)&#92;)</span> of a projective variety <span>&#92;(V&#92;)</span> is the field <span>&#92;(K(U)&#92;)</span>, where <span>&#92;(U&#92;)</span> is any affine piece of <span>&#92;(V&#92;)</span>. The <strong>local ring</strong> <span>&#92;(\mathcal{O}&#95;P(V)&#92;)</span> is the local ring <span>&#92;(\mathcal{O}&#95;P(U)&#92;)</span> for any affine piece containing <span>&#92;(P&#92;)</span>.
</div>

The **homogeneous coordinate ring** <span>&#92;(\mathbb{C}[X&#95;0, \ldots, X&#95;n]/I(V)&#92;)</span> is *not* an invariant of isomorphism for projective varieties. For example, the line <span>&#92;(S = 0&#92;)</span> in <span>&#92;(\mathbb{P}^2&#92;)</span> and the conic <span>&#92;(V(XY - Z^2) \subset \mathbb{P}^2&#92;)</span> are isomorphic projective varieties, but their homogeneous coordinate rings are <span>&#92;(\mathbb{C}[T,U]&#92;)</span> (a UFD) and <span>&#92;(\mathbb{C}[X,Y,Z]/(XY-Z^2)&#92;)</span> (not a UFD). So we abandon homogeneous coordinate rings and specialize.

### 2. Curves

For the remainder of the course, we specialize to curves.

<div class="definition">
<strong>Definition 2.1.</strong> A <strong>curve</strong> is an algebraic variety of dimension one. A <strong>projective curve</strong> is a projective algebraic variety of dimension one.
</div>

<div class="definition">
<strong>Definition 2.2.</strong> A <strong>discrete valuation ring (DVR)</strong> is a Noetherian local domain whose maximal ideal is principal and nonzero. A generator for the maximal ideal is called a <strong>uniformizing parameter</strong> (or <strong>uniformizer</strong>).
</div>

The prime geometric example is <span>&#92;(\mathbb{C}[t]&#95;{(t)} = \{f(t)/g(t) \mid g(0) \neq 0\}&#92;)</span>, the local ring of <span>&#92;(\mathbb{A}^1&#92;)</span> at the origin. The maximal ideal is <span>&#92;((t)&#92;)</span>, and every rational function can be written as <span>&#92;(t^a \cdot u&#92;)</span> where <span>&#92;(u&#92;)</span> is a unit and <span>&#92;(a&#92;)</span> is an integer.

<div class="theorem">
<strong>Theorem 2.3.</strong> Let <span>&#92;(C \subset \mathbb{A}^n&#92;)</span> be a curve, and <span>&#92;(P \in C&#92;)</span> a smooth point. Then the local ring <span>&#92;(\mathcal{O}&#95;P(C)&#92;)</span> is a DVR, and any linear function whose zero set is not tangent to <span>&#92;(C&#92;)</span> at <span>&#92;(P&#92;)</span> is a uniformizer.
</div>

<div class="proof">
<em>Proof sketch for plane curves.</em> After coordinate change, take <span>&#92;(P = (0,0)&#92;)</span> and write <span>&#92;(f(x,y) = y + r(x,y)&#92;)</span> where <span>&#92;(r&#92;)</span> has only degree <span>&#92;(\geq 2&#92;)</span> terms (using smoothness). The maximal ideal is generated by <span>&#92;(x&#92;)</span> and <span>&#92;(y&#92;)</span>. From the equation <span>&#92;(f = yg(x,y) + xp(x) = 0&#92;)</span> in <span>&#92;(\mathcal{O}&#95;P(C)&#92;)</span>, we get <span>&#92;(y = -x \cdot p(x)/g(x,y) \in (x)&#92;)</span>, so the maximal ideal <span>&#92;((x,y) = (x)&#92;)</span> is principal. ∎
</div>

---

## Week 9: DVRs and Maps of Curves

### 1. Structure of DVRs

<div class="theorem">
<strong>Theorem 1.1.</strong> Let <span>&#92;(D&#92;)</span> be a DVR with maximal ideal <span>&#92;(\mathfrak{m} = (t)&#92;)</span> and fraction field <span>&#92;(K&#92;)</span>. Every ideal of <span>&#92;(D&#92;)</span> is of the form <span>&#92;((t^n)&#92;)</span> for some <span>&#92;(n \geq 0&#92;)</span>. Every nonzero element <span>&#92;(x \in K&#92;)</span> can be written as <span>&#92;(x = u t^n&#92;)</span> for some unit <span>&#92;(u \in D^&#42;&#92;)</span> and integer <span>&#92;(n \in \mathbb{Z}&#92;)</span>. The integer <span>&#92;(n&#92;)</span> is called the <strong>order of vanishing</strong> of <span>&#92;(x&#92;)</span>, written <span>&#92;(\text{ord}(x)&#92;)</span>.
</div>

<div class="proof">
<em>Proof.</em> For any nonzero <span>&#92;(y \in D&#92;)</span>, write <span>&#92;(y = y&#95;1 t&#92;)</span> if <span>&#92;(y&#92;)</span> is not a unit, then <span>&#92;(y&#95;1 = y&#95;2 t&#92;)</span> if <span>&#92;(y&#95;1&#92;)</span> is not a unit, and so on. The chain <span>&#92;((y&#95;1) \subset (y&#95;2) \subset \cdots&#92;)</span> stabilizes (Noetherian), and stabilizing would require <span>&#92;(t&#92;)</span> to be a unit (contradiction), so some <span>&#92;(y&#95;i&#92;)</span> must be a unit. Every ideal is then principal, generated by the element of smallest <span>&#92;(t&#92;)</span>-power. ∎
</div>

### 2. Rational Maps of Smooth Curves Extend

<div class="theorem">
<strong>Theorem 1.2.</strong> Let <span>&#92;(C \subset \mathbb{P}^m&#92;)</span> be a smooth curve, and <span>&#92;(\phi : C \dashrightarrow \mathbb{P}^n&#92;)</span> a rational map. Then <span>&#92;(\phi&#92;)</span> is a morphism (i.e., defined at every point of <span>&#92;(C&#92;)</span>).
</div>

<div class="proof">
<em>Proof.</em> At any point <span>&#92;(P&#92;)</span>, write <span>&#92;(\phi = [1 : u&#95;1 t^{m&#95;1} : \cdots : u&#95;n t^{m&#95;n}]&#92;)</span> using the DVR structure of <span>&#92;(\mathcal{O}&#95;P(C)&#92;)</span>. If any <span>&#92;(m_i < 0&#92;)</span>, multiply all coordinates by <span>&#92;(t^{-\min&#95;i m&#95;i}&#92;)</span>. The resulting tuple has no negative powers of <span>&#92;(t&#92;)</span>, and the coordinate corresponding to the minimum is a unit (hence nonzero at <span>&#92;(P&#92;)</span>). So <span>&#92;(\phi&#92;)</span> is defined at <span>&#92;(P&#92;)</span>. This is, in the professor's words, "unbefrickinlievably awesome." ∎
</div>

### 3. Degree of a Map

<div class="definition">
<strong>Definition 1.4.</strong> Let <span>&#92;(f : V \dashrightarrow W&#92;)</span> be a dominant rational map of algebraic varieties. The <strong>degree</strong> of <span>&#92;(f&#92;)</span> is the degree of the field extension <span>&#92;([K(V) : f^&#42; K(W)]&#92;)</span>.
</div>

<div class="theorem">
<strong>Theorem 1.5.</strong> The degree of a dominant rational map of curves is finite.
</div>

<div class="definition">
<strong>Definition 1.6.</strong> Let <span>&#92;(f : C&#95;1 \to C&#95;2&#92;)</span> be a dominant morphism of curves, <span>&#92;(P \in C&#95;1&#92;)</span>, <span>&#92;(Q = f(P) \in C&#95;2&#92;)</span>. Let <span>&#92;(t&#95;Q&#92;)</span> be a uniformizer at <span>&#92;(Q&#92;)</span>. Write <span>&#92;(f^&#42; t&#95;Q = u \cdot t&#95;P^e&#92;)</span> for a unit <span>&#92;(u \in \mathcal{O}&#95;P(C&#95;1)&#92;)</span>. The integer <span>&#92;(e&#92;)</span> is the <strong>ramification degree</strong> of <span>&#92;(f&#92;)</span> at <span>&#92;(P&#92;)</span>.
</div>

<div class="theorem">
<strong>Theorem 1.7 (Degree Formula).</strong> Let <span>&#92;(f : C&#95;1 \to C&#95;2&#92;)</span> be a non-constant morphism of smooth projective curves. For every point <span>&#92;(Q \in C&#95;2&#92;)</span>:
<span>&#92;[ \sum&#95;{P \in f^{-1}(Q)} e&#95;P = \deg f &#92;]</span>
where <span>&#92;(e&#95;P&#92;)</span> denotes the ramification degree at <span>&#92;(P&#92;)</span>.
</div>

**Example:** For <span>&#92;(f : \mathbb{P}^1 \to \mathbb{P}^1&#92;)</span> given by <span>&#92;(f([x:y]) = [x^2:y^2]&#92;)</span>, the degree is <span>&#92;([C(x) : C(x^2)] = 2&#92;)</span>. The preimage of a generic point has two elements (ramification degree 1 each), but the preimage of <span>&#92;([0:1]&#92;)</span> has one element with ramification degree 2. The weighted count is always 2.

---

## Week 10: Divisors and Bézout's Theorem

### 1. Divisors

Let <span>&#92;(C&#92;)</span> be a smooth projective curve.

<div class="definition">
<strong>Definition 1.1.</strong> A <strong>divisor</strong> on <span>&#92;(C&#92;)</span> is a formal sum <span>&#92;(D = n&#95;1 P&#95;1 + n&#95;2 P&#95;2 + \cdots + n&#95;k P&#95;k&#92;)</span>, where <span>&#92;(n&#95;i \in \mathbb{Z}&#92;)</span> and <span>&#92;(P&#95;i&#92;)</span> are points on <span>&#92;(C&#92;)</span>. The <strong>degree</strong> of a divisor is <span>&#92;(\deg D = \sum n&#95;i&#92;)</span>. A divisor is <strong>effective</strong> if all <span>&#92;(n&#95;i \geq 0&#92;)</span>.
</div>

<div class="definition">
<strong>Definition 1.2.</strong> Let <span>&#92;(C \subset \mathbb{P}^n&#92;)</span> be a smooth curve, <span>&#92;(H \subset \mathbb{P}^n&#92;)</span> a hypersurface not containing <span>&#92;(C&#92;)</span>. Define the <strong>divisor of <span>&#92;(H&#92;)</span></strong>:
<span>&#92;[ \text{div}(H) = \sum&#95;{P \in C} \text{ord}&#95;P(H) \cdot P &#92;]</span>
(a finite sum). For a rational function <span>&#92;(\zeta \in K(C)&#92;)</span>, define <span>&#92;(\text{div}(\zeta) = \sum&#95;{P \in C} \text{ord}&#95;P(\zeta) \cdot P&#92;)</span>.
</div>

<div class="theorem">
<strong>Theorem 1.3.</strong> For any rational function <span>&#92;(\zeta \in K(C)&#92;)</span>, <span>&#92;(\deg \text{div}(\zeta) = 0&#92;)</span>. That is, a rational function has the same number of zeros as poles (counted correctly).
</div>

<div class="proof">
<em>Proof sketch.</em> A non-constant <span>&#92;(\zeta&#92;)</span> corresponds to a morphism <span>&#92;(\psi : C \to \mathbb{P}^1&#92;)</span> by <span>&#92;(\psi(P) = [f(P):g(P)]&#92;)</span> (homogenizing to match degrees). The divisors of zeros and poles are the preimages of <span>&#92;([1:0]&#92;)</span> and <span>&#92;([0:1]&#92;)</span> weighted by ramification degree — both equal <span>&#92;(\deg \psi&#92;)</span> by the Degree Formula. ∎
</div>

### 2. Bézout's Theorem

<div class="definition">
<strong>Definition 1.4.</strong> Let <span>&#92;(f&#92;)</span> and <span>&#92;(g&#92;)</span> be two polynomials in <span>&#92;(\mathbb{C}[x,y]&#92;)</span> with no common irreducible component. The <strong>intersection multiplicity</strong> of <span>&#92;(f&#92;)</span> and <span>&#92;(g&#92;)</span> at a point <span>&#92;(P \in \mathbb{A}^2&#92;)</span> is:
<span>&#92;[ I&#95;P(f,g) = \dim&#95;{\mathbb{C}} \mathcal{O}&#95;P(\mathbb{A}^2)/(f,g) &#92;]</span>
</div>

<div class="theorem">
<strong>Theorem 1.5 (Bézout's Theorem).</strong> Let <span>&#92;(F&#92;)</span> and <span>&#92;(G&#92;)</span> be two homogeneous polynomials in <span>&#92;(\mathbb{C}[x,y,z]&#92;)</span> with no common factor, of degrees <span>&#92;(d&#92;)</span> and <span>&#92;(e&#92;)</span> respectively. Then:
<span>&#92;[ \sum&#95;{P \in V(F,G)} I&#95;P(F,G) = de &#92;]</span>
</div>

<div class="proof">
<em>Proof for <span>&#92;(V(F)&#92;)</span> smooth.</em> One shows <span>&#92;(I&#95;P(F,G) = \text{ord}&#95;P^F(G)&#92;)</span> (the order of vanishing of <span>&#92;(G&#92;)</span> on <span>&#92;(V(F)&#92;)</span> at <span>&#92;(P&#92;)</span>), using the fact that <span>&#92;(\mathcal{O}&#95;P(\mathbb{A}^2)/(f) \cong \mathcal{O}&#95;P(V(f))&#92;)</span>. Then:
<span>&#92;[ \sum&#95;P I&#95;P(F,G) = \sum&#95;P \text{ord}&#95;P^F(G) = \deg \text{div}^F(G) &#92;]</span>
and since <span>&#92;(\deg \text{div}^F(G)&#92;)</span> only depends on the degree of <span>&#92;(G&#92;)</span>, we may take <span>&#92;(G = L^e&#92;)</span> for a generic line <span>&#92;(L&#92;)</span>, giving <span>&#92;(e \cdot \sum&#95;P \text{ord}&#95;P^F(L) = e \cdot d&#92;)</span> (since two distinct lines in <span>&#92;(\mathbb{P}^2&#92;)</span> always meet in exactly one point). ∎
</div>

---

## Week 11: Linear Equivalence and the Picard Group

### 1. Linear Equivalence

If <span>&#92;(H&#92;)</span> and <span>&#92;(H'&#92;)</span> are hyperplanes in <span>&#92;(\mathbb{P}^n&#92;)</span>, then <span>&#92;(\text{div}(H) - \text{div}(H') = \text{div}(H/H')&#92;)</span> is the divisor of a rational function. This motivates:

<div class="definition">
<strong>Definition 1.2.</strong> Divisors <span>&#92;(D&#92;)</span> and <span>&#92;(D'&#92;)</span> on <span>&#92;(C&#92;)</span> are <strong>linearly equivalent</strong> (written <span>&#92;(D \equiv D'&#92;)</span>) if there is some rational function <span>&#92;(\zeta \in K(C)&#92;)</span> such that <span>&#92;(D - D' = \text{div}(\zeta)&#92;)</span>.
</div>

<div class="definition">
<strong>Definition 1.3.</strong> A divisor <span>&#92;(D&#92;)</span> on a smooth curve <span>&#92;(C&#92;)</span> is <strong>very ample</strong> if there is some embedding <span>&#92;(\phi : C \hookrightarrow \mathbb{P}^n&#92;)</span> such that <span>&#92;(D = \text{div}(H)&#92;)</span> on <span>&#92;(\phi(C)&#92;)</span> for some hyperplane <span>&#92;(H \subset \mathbb{P}^n&#92;)</span>.
</div>

<div class="theorem">
<strong>Theorem 1.4.</strong> For a rational function <span>&#92;(\zeta \in K&#92;)</span>, <span>&#92;(\text{div}(\zeta)&#92;)</span> is effective if and only if <span>&#92;(\zeta \in \mathbb{C}&#92;)</span> is constant.
</div>

<div class="theorem">
<strong>Theorems 1.5–1.7.</strong> Linear equivalence is an equivalence relation on divisors. It preserves degree: if <span>&#92;(D&#95;1 \equiv D&#95;2&#92;)</span> then <span>&#92;(\deg D&#95;1 = \deg D&#95;2&#92;)</span>. The sum of linearly equivalent divisors is linearly equivalent to the sum of their equivalents.
</div>

### 2. The Picard Group

<div class="definition">
<strong>Definition 1.8.</strong> Let <span>&#92;(C \subset \mathbb{P}^n&#92;)</span> be a smooth curve. The <strong>degree</strong> of <span>&#92;(C&#92;)</span> is <span>&#92;(\deg \text{div}(H)&#92;)</span>, where <span>&#92;(H&#92;)</span> is any hyperplane in <span>&#92;(\mathbb{P}^n&#92;)</span>.
</div>

<div class="definition">
<strong>Definition 1.9.</strong> The <strong>Picard group</strong> <span>&#92;(\text{Pic}(C)&#92;)</span> of a smooth curve <span>&#92;(C&#92;)</span> is the group of linear equivalence classes of divisors under addition: <span>&#92;(\text{Pic}(C) = \{\text{divisors on } C\} / \{\text{divisors of rational functions}\}&#92;)</span>. The subgroup of degree-zero classes is <span>&#92;(\text{Pic}^0(C)&#92;)</span>.
</div>

### 3. The Linear Series <span>&#92;(L(D)&#92;)</span>

<div class="definition">
<strong>Definition 1.10.</strong> For a divisor <span>&#92;(D&#92;)</span> on a smooth curve <span>&#92;(C&#92;)</span>, define:
<span>&#92;[ L(D) = \{ f \in K(C) \mid D + \text{div}(f) \text{ is effective} \} \cup \{0\} &#92;]</span>
This is a complex vector space (since <span>&#92;(\text{ord}&#95;P(f+g) \geq \min\{\text{ord}&#95;P f, \text{ord}&#95;P g\}&#92;)</span>).
</div>

<div class="theorem">
<strong>Theorem 1.11.</strong> For an effective divisor <span>&#92;(D&#92;)</span>, <span>&#92;(\dim L(D) \leq \deg(D) + 1&#92;)</span>.
</div>

The key result about projective embeddings is that *any* embedding of <span>&#92;(C&#92;)</span> in projective space can be constructed from <span>&#92;(L(D)&#92;)</span> for the corresponding hyperplane section divisor <span>&#92;(D&#92;)</span>:

<div class="theorem">
<strong>Theorem 1.13.</strong> Any embedding of <span>&#92;(C&#92;)</span> into projective space with <span>&#92;(\text{div}(x&#95;0) = D&#92;)</span> can be obtained by finding the embedding associated to some basis of <span>&#92;(L(D)&#92;)</span>, then composing with a projective change of coordinates and a sequence of linear projections.
</div>

**Application: Veronese embedding.** For <span>&#92;(\mathbb{P}^1&#92;)</span>, any two divisors of the same degree are linearly equivalent (since <span>&#92;(P - Q = \text{div}((bx - ay)/(dx - cy))&#92;)</span>). So all embeddings of <span>&#92;(\mathbb{P}^1&#92;)</span> in <span>&#92;(\mathbb{P}^n&#92;)</span> factor through the **<span>&#92;(d&#92;)</span>th Veronese embedding**:
<span>&#92;[ [x:y] \mapsto [x^d : x^{d-1}y : \cdots : y^d] \in \mathbb{P}^d &#92;]</span>
whose image is the **rational normal curve** of degree <span>&#92;(d&#92;)</span>.

---

## Week 12: Elliptic Curves and the Group Law

### 1. Playing with Pic⁰(C)

Let <span>&#92;(C&#92;)</span> be a smooth curve and <span>&#92;(O \in C&#92;)</span> a chosen basepoint. Define a map:
<span>&#92;[ \phi&#95;C : C \to \text{Pic}^0(C), \quad P \mapsto |P - O| &#92;]</span>
We would like to define addition on <span>&#92;(C&#92;)</span> by <span>&#92;(P + Q = R&#92;)</span> where <span>&#92;(\phi&#95;C(R) = \phi&#95;C(P) + \phi&#95;C(Q)&#92;)</span>.

For this to work, <span>&#92;(\phi&#95;C&#92;)</span> must be bijective.

**Lines in the plane (degree 1):** <span>&#92;(\text{Pic}^0(C)&#92;)</span> is trivial — every two points are linearly equivalent (use the ratio of two lines through the respective points). Same for smooth conics (degree 2). In both cases, <span>&#92;(C \cong \mathbb{P}^1&#92;)</span>. Indeed:

<div class="theorem">
<strong>Theorem 1.3.</strong> Let <span>&#92;(C&#92;)</span> be a smooth curve with two points <span>&#92;(P \equiv Q&#92;)</span> on it. Then <span>&#92;(C \cong \mathbb{P}^1&#92;)</span>.
</div>

### 2. Smooth Plane Cubics

For degree 3, things get interesting. We put <span>&#92;(C&#92;)</span> into **Weierstrass form**: by coordinate changes (using a chosen point <span>&#92;(O&#92;)</span>, the tangent line to <span>&#92;(O&#92;)</span>, and the flex structure), any smooth plane cubic can be written as:
<span>&#92;[ y^2 z + a&#95;1 xyz + a&#95;3 yz^2 = x^3 + a&#95;2 x^2 z + a&#95;4 xz^2 + a&#95;6 z^3 &#92;]</span>
or in the affine chart <span>&#92;(z = 1&#92;)</span>: <span>&#92;(y^2 + a&#95;1 xy + a&#95;3 y = x^3 + a&#95;2 x^2 + a&#95;4 x + a&#95;6&#92;)</span>. By further completing the square and cube (over <span>&#92;(\mathbb{C}&#92;)</span>), this simplifies to the **reduced Weierstrass form**: <span>&#92;(y^2 z = x^3 + axz^2 + bz^3&#92;)</span>.

In this form, the point <span>&#92;(O = [0:1:0]&#92;)</span> is on <span>&#92;(C&#92;)</span>, with tangent line <span>&#92;(z = 0&#92;)</span>, and <span>&#92;(\text{div}(z) = 3O&#92;)</span> (so <span>&#92;(O&#92;)</span> is a flex).

**Surjectivity of <span>&#92;(\phi&#95;C&#92;)</span>:** For any two points <span>&#92;(P, Q&#92;)</span> on <span>&#92;(C&#92;)</span>, let <span>&#92;(L&#92;)</span> be the line joining them (tangent line if <span>&#92;(P = Q&#92;)</span). By Bézout's theorem, <span>&#92;(\text{div}(L) = P + Q + R&#92;)</span> for a third point <span>&#92;(R&#92;)</span>.

<div class="theorem">
<strong>Lemma 2.1.</strong> If <span>&#92;(\text{div}(L) = P + Q + R&#92;)</span>, then <span>&#92;(|P - O| + |Q - O| + |R - O| = |0|&#92;)</span> in <span>&#92;(\text{Pic}^0(C)&#92;)</span>.
</div>

<div class="proof">
<em>Proof.</em> Let <span>&#92;(T&#92;)</span> be the line <span>&#92;(z = 0&#92;)</span>, so <span>&#92;(\text{div}(T) = 3O&#92;)</span>. Set <span>&#92;(\alpha = L/T&#92;)</span>. Then <span>&#92;(\text{div}(\alpha) = P + Q + R - 3O&#92;)</span>. ∎
</div>

Using this lemma, we can show that any element of <span>&#92;(\text{Pic}^0(C)&#92;)</span> is equivalent to <span>&#92;(|P - O|&#92;)</span> for some point <span>&#92;(P \in C&#92;)</span>.

<div class="theorem">
<strong>Theorem 2.2.</strong> The map <span>&#92;(\phi&#95;C&#92;)</span> is injective: if <span>&#92;(|P - O| = |Q - O|&#92;)</span>, then <span>&#92;(P = Q&#92;)</span>.
</div>

Thus <span>&#92;(\phi&#95;C : C \xrightarrow{\sim} \text{Pic}^0(C)&#92;)</span> is a bijection, and we can transport the group structure of <span>&#92;(\text{Pic}^0(C)&#92;)</span> to <span>&#92;(C&#92;)</span> itself.

### 3. The Group Law on an Elliptic Curve

A smooth plane cubic equipped with a basepoint <span>&#92;(O&#92;)</span> is called an **elliptic curve**. The group law is geometric:

1. To compute <span>&#92;(P + Q&#92;)</span>: draw the line <span>&#92;(L&#92;)</span> through <span>&#92;(P&#92;)</span> and <span>&#92;(Q&#92;)</span> (tangent line if <span>&#92;(P = Q&#92;)</span>). By Bézout, <span>&#92;(L&#92;)</span> meets <span>&#92;(C&#92;)</span> in a third point <span>&#92;(R&#92;)</span>.
2. Draw the line <span>&#92;(L'&#92;)</span> through <span>&#92;(R&#92;)</span> and <span>&#92;(O&#92;)</span>. It meets <span>&#92;(C&#92;)</span> in a third point <span>&#92;(R'&#92;)</span>.
3. Then <span>&#92;(P + Q = R'&#92;)</span>.

**Example:** On <span>&#92;(C: y^2 z = x^3 + 3xz^2&#92;)</span>, with <span>&#92;(P = [0:0:1]&#92;)</span> and <span>&#92;(Q = [1:2:1]&#92;)</span>:
- The line through <span>&#92;(P&#92;)</span> and <span>&#92;(Q&#92;)</span> is <span>&#92;(2x - y = 0&#92;)</span>. Substituting gives <span>&#92;(x^3 - 4x^2 + 3x = 0&#92;)</span>. The third root is <span>&#92;(\alpha = 3&#92;)</span> (using Vieta's: <span>&#92;(0 + 1 + \alpha = 4&#92;)</span>), giving <span>&#92;(R = [3:6:1]&#92;)</span>.
- The line through <span>&#92;(R&#92;)</span> and <span>&#92;(O = [0:1:0]&#92;)</span> is <span>&#92;(x - 3z = 0&#92;)</span>. The third intersection is <span>&#92;([3:-6:1]&#92;)</span>.
- So <span>&#92;(P + Q = [3:-6:1]&#92;)</span>.

**Example (doubling):** To compute <span>&#92;(2Q&#92;)</span> where <span>&#92;(Q = [1:2:1]&#92;)</span>: the tangent line at <span>&#92;(Q&#92;)</span> is <span>&#92;(3x - 2y + z = 0&#92;)</span>. After computation, <span>&#92;(-2Q = [2:7:8]&#92;)</span>, and then <span>&#92;(2Q = [2:-7:8]&#92;)</span>.

**Note:** It is possible to get <span>&#92;(nP = O&#92;)</span>. The point <span>&#92;(P = [0:0:1]&#92;)</span> on this curve satisfies <span>&#92;(2P = O&#92;)</span> (it is a **2-torsion point**). There are exactly <span>&#92;(n^2&#92;)</span> <span>&#92;(n&#92;)</span>-torsion points on any elliptic curve over <span>&#92;(\mathbb{C}&#92;)</span>, because topologically an elliptic curve is a torus <span>&#92;(\mathbb{C}/(\mathbb{Z} \oplus \mathbb{Z}\tau)&#92;)</span>, and there are <span>&#92;(n&#92;)</span> roots of unity in each factor.

<div class="definition">
<strong>Definition 2.3.</strong> Let <span>&#92;(C&#92;)</span> be an elliptic curve and <span>&#92;(n&#92;)</span> an integer. A point <span>&#92;(P \in C&#92;)</span> is an <strong><span>&#92;(n&#92;)</span>-torsion point</strong> of <span>&#92;(C&#92;)</span> if <span>&#92;(nP = O&#92;)</span>. There are exactly <span>&#92;(n^2&#92;)</span> <span>&#92;(n&#92;)</span>-torsion points on any elliptic curve.
</div>

---

## Summary: The Main Correspondences

The thread running through this course is a sequence of dualities between algebra and geometry:

| Geometry | Algebra |
|----------|---------|
| Algebraic set <span>&#92;(X \subset \mathbb{A}^n&#92;)</span> | Radical ideal <span>&#92;(I(X) \subset \mathbb{C}[x&#95;1,\ldots,x&#95;n]&#92;)</span> |
| Irreducible algebraic set (variety) | Prime ideal |
| Point | Maximal ideal |
| Polynomial map <span>&#92;(\phi : X \to Y&#92;)</span> | <span>&#92;(\mathbb{C}&#92;)</span>-algebra homomorphism <span>&#92;(\phi^&#42; : \Gamma(Y) \to \Gamma(X)&#92;)</span> |
| Isomorphism of varieties | Isomorphism of coordinate rings |
| Function field <span>&#92;(K(X)&#92;)</span> | Fraction field of <span>&#92;(\Gamma(X)&#92;)</span> |
| Smooth point | DVR local ring |
| Projective variety | RRH ideal |
| Linear equivalence class | Element of Pic(<span>&#92;(C&#92;)</span>) |
| Elliptic curve with basepoint | Abelian group |
