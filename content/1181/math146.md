---
title: "MATH 146: Linear Algebra 1 for Honours Mathematics"
subjects: "MATH"
---

---

# Chapter 1: Vectors and Geometry in \(\mathbb{R}^n\)

The concrete world of \(\mathbb{R}^n\) is where linear algebra begins, and where geometric intuition is richest. Even after we pass to abstract vector spaces in Chapter 3, we will return here repeatedly to ground our ideas. The goal of this chapter is to establish \(\mathbb{R}^n\) as a vector space, equip it with the dot product, and see how orthogonality and projection organise geometry.

## 1.1 \(\mathbb{R}^n\) as a Vector Space

Before giving the abstract definition of a vector space, it is instructive to observe that \(\mathbb{R}^n\) with its familiar operations already satisfies every algebraic law we could want. This serves as both motivation and warm-up.

<div class="definition">

<strong>Definition 1.1 (\(\mathbb{R}^n\)).</strong> For a positive integer \(n\), <em>\(n\)-dimensional Euclidean space</em> is the set \(\mathbb{R}^n = \{(x_1, \ldots, x_n) : x_i \in \mathbb{R}\}\). We write elements as column vectors \(\mathbf{x} = \begin{pmatrix} x_1 \\ \vdots \\ x_n \end{pmatrix}\) and define <em>addition</em> and <em>scalar multiplication</em> componentwise:
\[
\mathbf{x} + \mathbf{y} = \begin{pmatrix} x_1 + y_1 \\ \vdots \\ x_n + y_n \end{pmatrix}, \qquad c\mathbf{x} = \begin{pmatrix} cx_1 \\ \vdots \\ cx_n \end{pmatrix}.
\]

</div>

These two operations interact in exactly the right ways. One verifies that \(\mathbb{R}^n\) satisfies the ten axioms V1–V10 that will define a vector space in Chapter 3 (commutativity, associativity, zero vector, additive inverse, distributivity, and the scalar-one axiom). A sum \(c_1\mathbf{v}_1 + \cdots + c_k\mathbf{v}_k\) is called a <em>linear combination</em> of \(\mathbf{v}_1, \ldots, \mathbf{v}_k\).

<div class="definition">

<strong>Definition 1.2 (Span).</strong> The <em>span</em> of a set of vectors \(\{\mathbf{v}_1, \ldots, \mathbf{v}_k\} \subseteq \mathbb{R}^n\) is the set of all their linear combinations:
\[
\operatorname{Span}\{\mathbf{v}_1, \ldots, \mathbf{v}_k\} = \{c_1 \mathbf{v}_1 + \cdots + c_k \mathbf{v}_k : c_1, \ldots, c_k \in \mathbb{R}\}.
\]
A set \(S\) is <em>spanned by</em> \(\{\mathbf{v}_1, \ldots, \mathbf{v}_k\}\) if \(S = \operatorname{Span}\{\mathbf{v}_1, \ldots, \mathbf{v}_k\}\).

</div>

<div class="theorem">

<strong>Theorem 1.3.</strong> If \(\mathbf{v}_k \in \operatorname{Span}\{\mathbf{v}_1, \ldots, \mathbf{v}_{k-1}\}\), then \(\operatorname{Span}\{\mathbf{v}_1, \ldots, \mathbf{v}_k\} = \operatorname{Span}\{\mathbf{v}_1, \ldots, \mathbf{v}_{k-1}\}\).

</div>

This simple observation is the engine behind our ability to strip spanning sets down to their essentials.

### Linear Independence

A spanning set may contain redundancy — some vectors expressible in terms of the others. Linear independence is the condition that no such redundancy exists.

<svg viewBox="0 0 480 200" xmlns="http://www.w3.org/2000/svg" style="max-width:480px;display:block;margin:1.5em auto">
  <!-- Left panel: two independent vectors -->
  <text x="120" y="14" text-anchor="middle" font-size="11" font-weight="bold" fill="currentColor">Linearly Independent</text>
  <line x1="40" y1="110" x2="200" y2="110" stroke="currentColor" stroke-width="0.8"/>
  <line x1="120" y1="30" x2="120" y2="170" stroke="currentColor" stroke-width="0.8"/>
  <!-- v1 -->
  <line x1="120" y1="110" x2="180" y2="60" stroke="#3b82f6" stroke-width="2.5" marker-end="url(#li1)"/>
  <text x="186" y="55" font-size="11" fill="#3b82f6" font-weight="bold">v₁</text>
  <!-- v2 -->
  <line x1="120" y1="110" x2="80" y2="52" stroke="#22c55e" stroke-width="2.5" marker-end="url(#li2)"/>
  <text x="64" y="50" font-size="11" fill="#22c55e" font-weight="bold">v₂</text>
  <text x="120" y="188" text-anchor="middle" font-size="10" fill="currentColor">Span = plane ℝ²</text>
  <defs>
    <marker id="li1" markerWidth="7" markerHeight="7" refX="5" refY="3.5" orient="auto">
      <path d="M0,0 L0,7 L7,3.5 z" fill="#3b82f6"/>
    </marker>
    <marker id="li2" markerWidth="7" markerHeight="7" refX="5" refY="3.5" orient="auto">
      <path d="M0,0 L0,7 L7,3.5 z" fill="#22c55e"/>
    </marker>
    <marker id="li3" markerWidth="7" markerHeight="7" refX="5" refY="3.5" orient="auto">
      <path d="M0,0 L0,7 L7,3.5 z" fill="#ef4444"/>
    </marker>
  </defs>

  <!-- Right panel: three coplanar (dependent) vectors -->
  <text x="360" y="14" text-anchor="middle" font-size="11" font-weight="bold" fill="currentColor">Linearly Dependent</text>
  <line x1="280" y1="110" x2="440" y2="110" stroke="currentColor" stroke-width="0.8"/>
  <line x1="360" y1="30" x2="360" y2="170" stroke="currentColor" stroke-width="0.8"/>
  <!-- u1 -->
  <line x1="360" y1="110" x2="420" y2="70" stroke="#3b82f6" stroke-width="2.5" marker-end="url(#li1)"/>
  <text x="426" y="66" font-size="11" fill="#3b82f6" font-weight="bold">u₁</text>
  <!-- u2 -->
  <line x1="360" y1="110" x2="310" y2="70" stroke="#22c55e" stroke-width="2.5" marker-end="url(#li2)"/>
  <text x="296" y="66" font-size="11" fill="#22c55e" font-weight="bold">u₂</text>
  <!-- u3 = u1+u2 (dependent) -->
  <line x1="360" y1="110" x2="370" y2="50" stroke="#ef4444" stroke-width="2" stroke-dasharray="5,3" marker-end="url(#li3)"/>
  <text x="374" y="46" font-size="11" fill="#ef4444" font-weight="bold">u₃</text>
  <text x="360" y="188" text-anchor="middle" font-size="10" fill="#ef4444">u₃ = c₁u₁+c₂u₂ (redundant)</text>
</svg>

<div class="definition">

<strong>Definition 1.4 (Linear Dependence and Independence).</strong> Vectors \(\mathbf{v}_1, \ldots, \mathbf{v}_k \in \mathbb{R}^n\) are <em>linearly dependent</em> if there exist scalars \(c_1, \ldots, c_k\), not all zero, such that \(c_1\mathbf{v}_1 + \cdots + c_k\mathbf{v}_k = \mathbf{0}\). They are <em>linearly independent</em> if the only solution to \(c_1\mathbf{v}_1 + \cdots + c_k\mathbf{v}_k = \mathbf{0}\) is \(c_1 = \cdots = c_k = 0\).

</div>

Notice that the set is dependent if and only if at least one vector can be written as a linear combination of the others — the two formulations are equivalent, and it is worth making sure you can pass fluently between them.

<div class="theorem">

<strong>Theorem 1.5.</strong> Any set containing \(\mathbf{0}\) is linearly dependent. Any set of two vectors is dependent if and only if one is a scalar multiple of the other.

</div>

### Basis and Standard Basis

<div class="definition">

<strong>Definition 1.6 (Basis).</strong> A set \(\mathcal{B} = \{\mathbf{v}_1, \ldots, \mathbf{v}_k\}\) is a <em>basis</em> for a subspace \(S \subseteq \mathbb{R}^n\) if \(\mathcal{B}\) is linearly independent and \(\operatorname{Span}\mathcal{B} = S\).

</div>

<div class="definition">

<strong>Definition 1.7 (Standard Basis).</strong> The <em>standard basis</em> for \(\mathbb{R}^n\) is \(\{\mathbf{e}_1, \ldots, \mathbf{e}_n\}\), where \(\mathbf{e}_i\) has a 1 in position \(i\) and 0 elsewhere.

</div>

### Affine Subsets: Lines, Planes, and \(k\)-Planes

Geometry in \(\mathbb{R}^n\) is organised by these flat, translated subspaces.

<div class="definition">

<strong>Definition 1.8 (\(k\)-plane).</strong> Let \(\mathbf{v}_1, \ldots, \mathbf{v}_k \in \mathbb{R}^n\) be linearly independent and let \(\mathbf{b} \in \mathbb{R}^n\). The set
\[
\{\mathbf{b} + c_1\mathbf{v}_1 + \cdots + c_k\mathbf{v}_k : c_1, \ldots, c_k \in \mathbb{R}\}
\]
is a <em>\(k\)-plane</em> through \(\mathbf{b}\) with direction vectors \(\mathbf{v}_1, \ldots, \mathbf{v}_k\). The cases \(k = 1\) and \(k = 2\) are <em>lines</em> and <em>planes</em>; a \((n-1)\)-plane is a <em>hyperplane</em>.

</div>

## 1.2 Dot Product and Norms

The dot product promotes \(\mathbb{R}^n\) from a mere vector space to a space with angles and distances. This additional structure is what makes geometry possible.

<div class="definition">

<strong>Definition 1.9 (Dot Product).</strong> For \(\mathbf{x}, \mathbf{y} \in \mathbb{R}^n\), the <em>dot product</em> is \(\mathbf{x} \cdot \mathbf{y} = \sum_{i=1}^n x_i y_i\).

</div>

The dot product is <em>symmetric</em> (\(\mathbf{x} \cdot \mathbf{y} = \mathbf{y} \cdot \mathbf{x}\)), <em>bilinear</em> (\(\mathbf{x} \cdot (s\mathbf{y} + t\mathbf{z}) = s(\mathbf{x} \cdot \mathbf{y}) + t(\mathbf{x} \cdot \mathbf{z})\)), and <em>positive definite</em> (\(\mathbf{x} \cdot \mathbf{x} \geq 0\) with equality iff \(\mathbf{x} = \mathbf{0}\)). These three properties are what make it an <em>inner product</em>.

<div class="definition">

<strong>Definition 1.10 (Norm).</strong> The <em>norm</em> (or <em>length</em>) of \(\mathbf{x} \in \mathbb{R}^n\) is \(\|\mathbf{x}\| = \sqrt{\mathbf{x} \cdot \mathbf{x}}\). A vector of norm 1 is a <em>unit vector</em>.

</div>

<div class="theorem">

<strong>Theorem 1.11 (Cauchy–Schwarz Inequality).</strong> For all \(\mathbf{x}, \mathbf{y} \in \mathbb{R}^n\),
\[
|\mathbf{x} \cdot \mathbf{y}| \leq \|\mathbf{x}\| \|\mathbf{y}\|,
\]
with equality if and only if \(\mathbf{x}\) and \(\mathbf{y}\) are linearly dependent.

</div>

*Proof.* If \(\mathbf{y} = \mathbf{0}\) both sides are zero. Otherwise, for any \(t \in \mathbb{R}\),
\[0 \leq \|\mathbf{x} - t\mathbf{y}\|^2 = \|\mathbf{x}\|^2 - 2t(\mathbf{x} \cdot \mathbf{y}) + t^2\|\mathbf{y}\|^2.\]
Setting \(t = (\mathbf{x} \cdot \mathbf{y})/\|\mathbf{y}\|^2\) and simplifying yields the result. \(\square\)

The Cauchy–Schwarz inequality justifies the definition of the angle \(\theta \in [0,\pi]\) between nonzero vectors by \(\cos\theta = (\mathbf{x} \cdot \mathbf{y})/(\|\mathbf{x}\|\|\mathbf{y}\|)\), since the right-hand side lies in \([-1,1]\).

## 1.3 Orthogonality and Projections

Two vectors are <em>orthogonal</em> if \(\mathbf{x} \cdot \mathbf{y} = 0\), i.e., if the angle between them is \(\pi/2\). Projection is the operation that decomposes a vector into its component along a given direction and its component perpendicular to it.

<div class="definition">

<strong>Definition 1.12 (Projection and Perpendicular).</strong> For \(\mathbf{u}, \mathbf{v} \in \mathbb{R}^n\) with \(\mathbf{v} \neq \mathbf{0}\), the <em>projection</em> of \(\mathbf{u}\) onto \(\mathbf{v}\) and its <em>perpendicular component</em> are
\[
\operatorname{proj}_{\mathbf{v}} \mathbf{u} = \frac{\mathbf{u} \cdot \mathbf{v}}{\|\mathbf{v}\|^2}\,\mathbf{v}, \qquad \operatorname{perp}_{\mathbf{v}} \mathbf{u} = \mathbf{u} - \operatorname{proj}_{\mathbf{v}} \mathbf{u}.
\]

</div>

One checks directly that \(\operatorname{proj}_{\mathbf{v}}\mathbf{u}\) is a scalar multiple of \(\mathbf{v}\) and that \(\operatorname{perp}_{\mathbf{v}}\mathbf{u}\) is orthogonal to \(\mathbf{v}\), so the decomposition \(\mathbf{u} = \operatorname{proj}_{\mathbf{v}}\mathbf{u} + \operatorname{perp}_{\mathbf{v}}\mathbf{u}\) is an orthogonal direct sum. Geometrically, \(\operatorname{proj}_{\mathbf{v}}\mathbf{u}\) is the "shadow" of \(\mathbf{u}\) cast on the line through \(\mathbf{v}\).

---

# Chapter 2: Systems of Linear Equations

Solving a system of linear equations is the most concrete problem in the subject, and the algorithmic answer — Gaussian elimination to row echelon form — is the workhorse of computational linear algebra. But the real payoff of this chapter is theoretical: the rank of a matrix, the uniqueness of RREF, and a first glimpse of the dimension theorem.

## 2.1 Row Operations and Echelon Forms

<div class="definition">

<strong>Definition 2.1 (Linear System and Augmented Matrix).</strong> A <em>system of \(m\) linear equations in \(n\) unknowns</em> has the form \(a_{i1}x_1 + \cdots + a_{in}x_n = b_i\) for \(1 \leq i \leq m\). We encode it as the <em>augmented matrix</em> \([A \mid \mathbf{b}]\) where \(A = (a_{ij})\) is the \(m \times n\) <em>coefficient matrix</em>.

</div>

<div class="definition">

<strong>Definition 2.2 (Elementary Row Operations).</strong> The three <em>elementary row operations</em> (EROs) are: (i) \(R_i \leftarrow cR_i\) for \(c \neq 0\); (ii) \(R_i \leftarrow R_i + cR_j\) for \(i \neq j\); (iii) \(R_i \leftrightarrow R_j\). Two matrices are <em>row equivalent</em> if one is obtainable from the other by a sequence of EROs.

</div>

<div class="theorem">

<strong>Theorem 2.3.</strong> If \([A_1 \mid \mathbf{b}_1]\) and \([A_2 \mid \mathbf{b}_2]\) are row equivalent augmented matrices, their corresponding systems have the same solution set.

</div>

<div class="definition">

<strong>Definition 2.4 (Reduced Row Echelon Form).</strong> A matrix \(R\) is in <em>reduced row echelon form (RREF)</em> if: (1) all-zero rows lie below all nonzero rows; (2) the first nonzero entry in each nonzero row is 1 (a <em>leading one</em> or <em>pivot</em>); (3) each leading one is strictly to the right of the leading one above it; (4) each leading one is the only nonzero entry in its column.

</div>

The <em>rank</em> of a matrix \(A\), written \(\operatorname{rank}(A)\), is the number of leading ones in its RREF.

### RREF Uniqueness

The uniqueness of RREF is not obvious — different sequences of row operations might, in principle, produce different reduced forms. The following theorem says they cannot.

<div class="theorem">

<strong>Theorem 2.5 (Uniqueness of RREF).</strong> Every matrix has a unique RREF.

</div>

*Proof.* Suppose \(R\) and \(R'\) are both RREFs of \(A\). Since they are row equivalent to each other, they represent the same linear map \(\mathbb{R}^n \to \mathbb{R}^m\) (up to a change of basis in the domain given by elementary matrices, which are invertible). More concretely, let \(j_1 < j_2 < \cdots < j_r\) be the pivot columns of \(R\) and \(j_1' < \cdots < j_{r'}'\) the pivot columns of \(R'\). Since row operations preserve the solution space of the homogeneous system, we have \(\operatorname{Null}(R) = \operatorname{Null}(R')\), hence \(r = r'\). A careful induction on the pivot columns, using the fact that the free variables of \(R\) and \(R'\) parametrise the same nullspace, shows \(j_k = j_k'\) for all \(k\) and moreover that the non-pivot entries in each pivot row are forced to be equal. Hence \(R = R'\). \(\square\)

### Rank and the Solution Count

<div class="theorem">

<strong>Theorem 2.6.</strong> Let \(A\) be \(m \times n\) with \(\operatorname{rank}(A) = r\). (1) If \(\operatorname{rank}[A \mid \mathbf{b}] > r\), the system is inconsistent. (2) If the system is consistent, it has \(n - r\) free variables, and thus a unique solution if \(r = n\), infinitely many if \(r < n\). (3) \(\operatorname{rank}(A) = m\) if and only if \(A\mathbf{x} = \mathbf{b}\) is consistent for every \(\mathbf{b}\).

</div>

## 2.2 The Rank-Nullity Theorem (Preview)

The \(n - r\) free variables in a consistent system index a basis for the solution set when the system is homogeneous. Since the solution space of \(A\mathbf{x} = \mathbf{0}\) is the <em>nullspace</em> \(\operatorname{Null}(A)\), and the \(r\) pivot columns span the <em>columnspace</em> \(\operatorname{Col}(A)\), we get a preview of the main structural theorem:

\[
\dim(\operatorname{Col}(A)) + \dim(\operatorname{Null}(A)) = n.
\]

The full theorem and its abstract form will appear in Chapter 4.

## 2.3 Geometric Interpretation

Geometrically, each linear equation \(a_1 x_1 + \cdots + a_n x_n = b\) cuts out a hyperplane in \(\mathbb{R}^n\). The solution set of a system is the intersection of \(m\) hyperplanes. A consistent system has a solution set that is either a point (\(r = n\)) or an affine \((n-r)\)-plane. An inconsistent system corresponds to hyperplanes with empty intersection — a phenomenon that cannot occur in \(\mathbb{R}^1\) but is generic in higher dimensions.

---

# Chapter 3: Abstract Vector Spaces

One of the great insights of modern mathematics is that the algebraic structure behind \(\mathbb{R}^n\) — its axioms — appears in wildly different settings: spaces of functions, spaces of matrices, spaces of polynomials. By working with the axioms directly, we prove theorems once and apply them everywhere.

## 3.1 Axioms and Examples

<div class="definition">

<strong>Definition 3.1 (Vector Space).</strong> A <em>vector space over \(\mathbb{R}\)</em> is a set \(V\) equipped with operations of <em>addition</em> \(V \times V \to V\) and <em>scalar multiplication</em> \(\mathbb{R} \times V \to V\) satisfying, for all \(\mathbf{u}, \mathbf{v}, \mathbf{w} \in V\) and \(a, b \in \mathbb{R}\):

<strong>V1</strong> (Closure under addition): \(\mathbf{u} + \mathbf{v} \in V\). <strong>V2</strong> (Associativity): \((\mathbf{u} + \mathbf{v}) + \mathbf{w} = \mathbf{u} + (\mathbf{v} + \mathbf{w})\). <strong>V3</strong> (Commutativity): \(\mathbf{u} + \mathbf{v} = \mathbf{v} + \mathbf{u}\). <strong>V4</strong> (Zero vector): there exists \(\mathbf{0} \in V\) with \(\mathbf{v} + \mathbf{0} = \mathbf{v}\). <strong>V5</strong> (Additive inverse): for each \(\mathbf{v}\) there exists \(-\mathbf{v}\) with \(\mathbf{v} + (-\mathbf{v}) = \mathbf{0}\). <strong>V6</strong> (Closure under scalar multiplication): \(a\mathbf{v} \in V\). <strong>V7</strong>: \(a(b\mathbf{v}) = (ab)\mathbf{v}\). <strong>V8</strong>: \((a+b)\mathbf{v} = a\mathbf{v} + b\mathbf{v}\). <strong>V9</strong>: \(a(\mathbf{u}+\mathbf{v}) = a\mathbf{u} + a\mathbf{v}\). <strong>V10</strong>: \(1 \cdot \mathbf{v} = \mathbf{v}\).

</div>

Notice that V4 and V5 make \((V, +)\) an abelian group, and the remaining axioms say scalar multiplication is a ring homomorphism \(\mathbb{R} \to \operatorname{End}(V)\) compatible with the group structure.

<div class="example">

<strong>Example 3.2.</strong> The following are all vector spaces over \(\mathbb{R}\):
(a) \(\mathbb{R}^n\) with componentwise operations.
(b) The space \(M_{m \times n}(\mathbb{R})\) of \(m \times n\) real matrices, with entrywise addition and scalar multiplication.
(c) The space \(\mathcal{P}_n\) of polynomials of degree at most \(n\): here \(\dim \mathcal{P}_n = n+1\) with basis \(\{1, x, x^2, \ldots, x^n\}\).
(d) The space \(\mathcal{P}\) of all polynomials — an <em>infinite-dimensional</em> vector space.
(e) The space \(C([a,b])\) of continuous functions \([a,b] \to \mathbb{R}\), with pointwise operations.
(f) The space \(\mathcal{L}(\mathbb{R}^n, \mathbb{R}^m)\) of all linear maps \(\mathbb{R}^n \to \mathbb{R}^m\).

</div>

<div class="theorem">

<strong>Theorem 3.3.</strong> In any vector space \(V\): (1) the zero vector is unique; (2) additive inverses are unique; (3) \(0\mathbf{v} = \mathbf{0}\) for all \(\mathbf{v}\); (4) \((-1)\mathbf{v} = -\mathbf{v}\).

</div>

*Proof.* For (3): \(0\mathbf{v} = (0+0)\mathbf{v} = 0\mathbf{v} + 0\mathbf{v}\); adding \(-0\mathbf{v}\) to both sides gives \(\mathbf{0} = 0\mathbf{v}\). \(\square\)

## 3.2 Subspaces

Rather than verifying all ten axioms for a subset, we have a simpler test.

<div class="definition">

<strong>Definition 3.4 (Subspace).</strong> A non-empty subset \(W \subseteq V\) is a <em>subspace</em> of \(V\) if \(W\) is itself a vector space under the operations inherited from \(V\).

</div>

<div class="theorem">

<strong>Theorem 3.5 (Subspace Test).</strong> A non-empty subset \(W \subseteq V\) is a subspace if and only if it is closed under addition and scalar multiplication: for all \(\mathbf{u}, \mathbf{v} \in W\) and \(c \in \mathbb{R}\), we have \(\mathbf{u} + \mathbf{v} \in W\) and \(c\mathbf{u} \in W\).

</div>

*Proof.* The "only if" direction is immediate. For "if": closure under scalar multiplication with \(c = 0\) gives \(\mathbf{0} = 0\mathbf{u} \in W\), so V4 holds; taking \(c = -1\) gives additive inverses, so V5 holds. The remaining axioms hold in \(W\) because they hold in the larger space \(V\). \(\square\)

The key examples: the span of any set of vectors is a subspace; the solution set of a homogeneous linear system is a subspace; the set of polynomials with a prescribed root is a subspace of \(\mathcal{P}\).

<div class="remark">

<strong>Remark 3.6 (Intersection and Sum).</strong> If \(U, W\) are subspaces of \(V\), then so is \(U \cap W\). The <em>sum</em> \(U + W = \{\mathbf{u} + \mathbf{w} : \mathbf{u} \in U, \mathbf{w} \in W\}\) is also a subspace. If \(U \cap W = \{\mathbf{0}\}\), we write \(U \oplus W\) (direct sum) and every element of \(U + W\) decomposes uniquely as \(\mathbf{u} + \mathbf{w}\).

</div>

## 3.3 Linear Independence and Span

The definitions of span and linear independence carry over from \(\mathbb{R}^n\) word-for-word.

<div class="definition">

<strong>Definition 3.7 (Span, Linear Independence).</strong> In a vector space \(V\), the <em>span</em> of \(S = \{\mathbf{v}_1, \ldots, \mathbf{v}_k\}\) is the set of all linear combinations of elements of \(S\); it is a subspace of \(V\). The set \(S\) is <em>linearly independent</em> if \(c_1\mathbf{v}_1 + \cdots + c_k\mathbf{v}_k = \mathbf{0}\) implies all \(c_i = 0\).

</div>

A key structural lemma clarifies the relationship between span and independence.

<div class="lemma">

<strong>Lemma 3.8.</strong> A vector \(\mathbf{v}\) can be removed from a spanning set \(\{\mathbf{v}_1, \ldots, \mathbf{v}_k\}\) without changing the span if and only if \(\mathbf{v} \in \operatorname{Span}\{\mathbf{v}_1, \ldots, \widehat{\mathbf{v}}, \ldots, \mathbf{v}_k\}\), i.e., if \(\mathbf{v}\) is a linear combination of the rest. Equivalently, the set is linearly dependent if and only if at least one of its members lies in the span of the others.

</div>

<div class="theorem">

<strong>Theorem 3.9 (Steinitz Exchange Lemma).</strong> Let \(\{\mathbf{u}_1, \ldots, \mathbf{u}_m\}\) be linearly independent in \(V\) and let \(\{\mathbf{w}_1, \ldots, \mathbf{w}_n\}\) span \(V\). Then \(m \leq n\).

</div>

*Proof.* By induction we construct spanning sets \(S_0 = \{\mathbf{w}_1, \ldots, \mathbf{w}_n\}\), \(S_1, \ldots, S_m\) where \(S_k\) contains \(\mathbf{u}_1, \ldots, \mathbf{u}_k\) and \(n - k\) of the original \(\mathbf{w}_j\)'s, and still spans \(V\). At step \(k\), write \(\mathbf{u}_k\) as a linear combination of elements of \(S_{k-1}\); since \(\mathbf{u}_k \notin \operatorname{Span}\{\mathbf{u}_1, \ldots, \mathbf{u}_{k-1}\}\) (by independence), at least one \(\mathbf{w}_j\) appears with a nonzero coefficient, and we replace that \(\mathbf{w}_j\) by \(\mathbf{u}_k\). After \(m\) steps we have not run out of \(\mathbf{w}_j\)'s, so \(m \leq n\). \(\square\)

The Steinitz Exchange Lemma is the spine of dimension theory: it immediately implies that all bases of \(V\) have the same size.

## 3.4 Bases and Dimension

<div class="definition">

<strong>Definition 3.10 (Basis).</strong> A <em>basis</em> for \(V\) is a linearly independent spanning set. Equivalently, \(\mathcal{B} = \{\mathbf{v}_1, \ldots, \mathbf{v}_n\}\) is a basis if and only if every vector in \(V\) can be written <em>uniquely</em> as a linear combination of elements of \(\mathcal{B}\).

</div>

<div class="theorem">

<strong>Theorem 3.11 (Dimension is Well-Defined).</strong> If \(V\) has a finite basis of size \(n\), then every basis of \(V\) has size \(n\).

</div>

*Proof.* If \(\mathcal{B}\) and \(\mathcal{B}'\) are both bases, then \(\mathcal{B}\) is linearly independent and \(\mathcal{B}'\) spans, so \(|\mathcal{B}| \leq |\mathcal{B}'|\) by Steinitz. Symmetrically \(|\mathcal{B}'| \leq |\mathcal{B}|\). \(\square\)

<div class="definition">

<strong>Definition 3.12 (Dimension).</strong> The <em>dimension</em> \(\dim V\) is the common size of all bases of \(V\). We set \(\dim\{\mathbf{0}\} = 0\). If no finite basis exists, \(V\) is <em>infinite-dimensional</em>.

</div>

<div class="theorem">

<strong>Theorem 3.13 (Three-in-One).</strong> Let \(\dim V = n\) and let \(S = \{\mathbf{v}_1, \ldots, \mathbf{v}_n\}\) be a set of exactly \(n\) vectors. Then the following are equivalent: (a) \(S\) is linearly independent; (b) \(S\) spans \(V\); (c) \(S\) is a basis for \(V\).

</div>

<div class="theorem">

<strong>Theorem 3.14 (Extension and Reduction).</strong> In a finite-dimensional vector space \(V\): every linearly independent set can be extended to a basis; every spanning set contains a basis as a subset.

</div>

<div class="theorem">

<strong>Theorem 3.15 (Dimension of Subspaces).</strong> If \(W\) is a subspace of a finite-dimensional \(V\), then \(\dim W \leq \dim V\), with equality if and only if \(W = V\). Moreover, \(\dim(U + W) = \dim U + \dim W - \dim(U \cap W)\).

</div>

### Quotient Spaces

The quotient construction is an essential tool in functional analysis and in the first isomorphism theorem.

<div class="definition">

<strong>Definition 3.16 (Quotient Space).</strong> Let \(W\) be a subspace of \(V\). For \(\mathbf{v} \in V\), the <em>coset</em> \(\mathbf{v} + W = \{\mathbf{v} + \mathbf{w} : \mathbf{w} \in W\}\). The <em>quotient space</em> is \(V/W = \{\mathbf{v} + W : \mathbf{v} \in V\}\) with operations \((\mathbf{u}+W) + (\mathbf{v}+W) = (\mathbf{u}+\mathbf{v})+W\) and \(c(\mathbf{v}+W) = (c\mathbf{v})+W\).

</div>

These operations are well-defined (independent of coset representative) precisely because \(W\) is closed under addition and scalar multiplication.

<div class="theorem">

<strong>Theorem 3.17.</strong> \(V/W\) is a vector space, and \(\dim(V/W) = \dim V - \dim W\).

</div>

*Proof.* If \(\{\mathbf{v}_1 + W, \ldots, \mathbf{v}_k + W\}\) is a basis for \(V/W\) and \(\{\mathbf{w}_1, \ldots, \mathbf{w}_m\}\) is a basis for \(W\), then \(\{\mathbf{v}_1, \ldots, \mathbf{v}_k, \mathbf{w}_1, \ldots, \mathbf{w}_m\}\) is a basis for \(V\), giving \(\dim V = k + m\). \(\square\)

## 3.5 Coordinates

Once a basis is fixed, every vector has a unique coordinate representation, and the abstract vector space becomes isomorphic to \(\mathbb{R}^n\).

<div class="definition">

<strong>Definition 3.18 (Coordinate Vector).</strong> Let \(\mathcal{B} = \{\mathbf{v}_1, \ldots, \mathbf{v}_n\}\) be an ordered basis for \(V\). The unique scalars \(b_1, \ldots, b_n\) with \(\mathbf{v} = b_1\mathbf{v}_1 + \cdots + b_n\mathbf{v}_n\) are the <em>coordinates</em> of \(\mathbf{v}\) with respect to \(\mathcal{B}\), and \([\mathbf{v}]_{\mathcal{B}} = (b_1, \ldots, b_n)^T\) is the <em>coordinate vector</em>.

</div>

The map \(\mathbf{v} \mapsto [\mathbf{v}]_{\mathcal{B}}\) is linear and bijective — a vector space isomorphism \(V \xrightarrow{\sim} \mathbb{R}^n\). Given two bases \(\mathcal{B}\) and \(\mathcal{C}\), the <em>change-of-basis matrix</em> \({}_{\mathcal{C}}P_{\mathcal{B}}\) has columns \([\mathbf{v}_i]_{\mathcal{C}}\) and satisfies \([\mathbf{x}]_{\mathcal{C}} = {}_{\mathcal{C}}P_{\mathcal{B}}[\mathbf{x}]_{\mathcal{B}}\). Note \(({}_{\mathcal{C}}P_{\mathcal{B}})^{-1} = {}_{\mathcal{B}}P_{\mathcal{C}}\).

---

# Chapter 4: Linear Transformations

A vector space without maps between vector spaces is like a set without functions — a static object. Linear transformations are the structure-preserving maps of the category of vector spaces, and they are the central objects of linear algebra.

## 4.1 Definition and Examples

<div class="definition">

<strong>Definition 4.1 (Linear Transformation).</strong> A function \(T : V \to W\) between vector spaces is a <em>linear transformation</em> (or <em>linear map</em>) if for all \(\mathbf{u}, \mathbf{v} \in V\) and \(c \in \mathbb{R}\),
\[
T(\mathbf{u} + \mathbf{v}) = T(\mathbf{u}) + T(\mathbf{v}) \quad \text{and} \quad T(c\mathbf{v}) = cT(\mathbf{v}).
\]
Equivalently, \(T(a\mathbf{u} + b\mathbf{v}) = aT(\mathbf{u}) + bT(\mathbf{v})\) for all scalars \(a, b\).

</div>

Notice that a linear map is completely determined by its values on any basis: if \(\mathcal{B} = \{\mathbf{v}_1, \ldots, \mathbf{v}_n\}\) is a basis for \(V\) and \(\mathbf{w}_1, \ldots, \mathbf{w}_n \in W\) are arbitrary, there exists a unique linear \(T : V \to W\) with \(T(\mathbf{v}_i) = \mathbf{w}_i\). This is the <em>universal property</em> of a basis, and it is extraordinarily useful.

<div class="example">

<strong>Example 4.2.</strong> (a) The zero map \(\mathbf{0} : V \to W\) and the identity \(\operatorname{id}_V : V \to V\) are linear. (b) Differentiation \(\frac{d}{dx} : \mathcal{P}_n \to \mathcal{P}_{n-1}\) is linear. (c) Integration \(\int_a^b : C([a,b]) \to \mathbb{R}\) is linear. (d) For any \(m \times n\) matrix \(A\), the map \(\mathbf{x} \mapsto A\mathbf{x}\) is linear \(\mathbb{R}^n \to \mathbb{R}^m\). (e) Rotation by angle \(\theta\) in \(\mathbb{R}^2\) is linear with matrix \(\begin{pmatrix}\cos\theta & -\sin\theta \\ \sin\theta & \cos\theta\end{pmatrix}\).

</div>

## 4.2 The Kernel and Image

The two fundamental subspaces attached to a linear map encode everything about its injectivity and surjectivity.

<div class="definition">

<strong>Definition 4.3 (Kernel and Image).</strong> For \(T : V \to W\) linear, the <em>kernel</em> and <em>image</em> are
\[
\ker T = \{\mathbf{v} \in V : T(\mathbf{v}) = \mathbf{0}\} \subseteq V, \qquad \operatorname{im} T = \{T(\mathbf{v}) : \mathbf{v} \in V\} \subseteq W.
\]

</div>

<div class="theorem">

<strong>Theorem 4.4.</strong> \(\ker T\) is a subspace of \(V\) and \(\operatorname{im} T\) is a subspace of \(W\).

</div>

<div class="theorem">

<strong>Theorem 4.5 (Injectivity Criterion).</strong> A linear map \(T : V \to W\) is injective if and only if \(\ker T = \{\mathbf{0}\}\).

</div>

*Proof.* If \(T\) is injective and \(T(\mathbf{v}) = \mathbf{0} = T(\mathbf{0})\), then \(\mathbf{v} = \mathbf{0}\). Conversely, if \(\ker T = \{\mathbf{0}\}\) and \(T(\mathbf{u}) = T(\mathbf{v})\), then \(T(\mathbf{u} - \mathbf{v}) = \mathbf{0}\), so \(\mathbf{u} - \mathbf{v} \in \ker T = \{\mathbf{0}\}\), giving \(\mathbf{u} = \mathbf{v}\). \(\square\)

### The Four Fundamental Subspaces

For a matrix \(A \in M_{m \times n}(\mathbb{R})\), the associated linear map \(\mathbf{x} \mapsto A\mathbf{x}\) gives four subspaces: the <em>column space</em> \(\operatorname{Col}(A) = \operatorname{im}(A) \subseteq \mathbb{R}^m\), the <em>null space</em> \(\operatorname{Null}(A) = \ker(A) \subseteq \mathbb{R}^n\), the <em>row space</em> \(\operatorname{Row}(A) = \operatorname{Col}(A^T) \subseteq \mathbb{R}^n\), and the <em>left null space</em> \(\operatorname{Null}(A^T) \subseteq \mathbb{R}^m\). Strikingly:

<div class="theorem">

<strong>Theorem 4.6 (Orthogonality of Fundamental Subspaces).</strong> \(\operatorname{Row}(A) \perp \operatorname{Null}(A)\) and \(\operatorname{Col}(A) \perp \operatorname{Null}(A^T)\). That is, if \(\mathbf{a} \in \operatorname{Row}(A)\) and \(\mathbf{x} \in \operatorname{Null}(A)\), then \(\mathbf{a} \cdot \mathbf{x} = 0\).

</div>

*Proof.* Write \(\mathbf{a} = A^T\mathbf{y}\). Then \(\mathbf{a} \cdot \mathbf{x} = (A^T\mathbf{y})^T\mathbf{x} = \mathbf{y}^T(A\mathbf{x}) = \mathbf{y}^T\mathbf{0} = 0\). \(\square\)

## 4.3 Rank-Nullity Theorem

This is the central theorem of the chapter — indeed, one of the most important theorems in all of linear algebra.

<div class="definition">

<strong>Definition 4.7 (Rank and Nullity).</strong> For a linear map \(T : V \to W\), the <em>rank</em> is \(\operatorname{rank}(T) = \dim(\operatorname{im} T)\) and the <em>nullity</em> is \(\operatorname{nullity}(T) = \dim(\ker T)\).

</div>

<div class="theorem">

<strong>Theorem 4.8 (Rank-Nullity / Dimension Theorem).</strong> Let \(T : V \to W\) be a linear map with \(V\) finite-dimensional. Then
\[
\dim V = \operatorname{rank}(T) + \operatorname{nullity}(T).
\]

</div>

*Proof.* Let \(\{\mathbf{k}_1, \ldots, \mathbf{k}_s\}\) be a basis for \(\ker T\); extend to a basis \(\{\mathbf{k}_1, \ldots, \mathbf{k}_s, \mathbf{v}_1, \ldots, \mathbf{v}_r\}\) for \(V\), so \(\dim V = r + s\). We claim \(\{T(\mathbf{v}_1), \ldots, T(\mathbf{v}_r)\}\) is a basis for \(\operatorname{im} T\). <em>Spanning</em>: any \(T(\mathbf{u})\) with \(\mathbf{u} = \sum a_i\mathbf{k}_i + \sum b_j\mathbf{v}_j\) satisfies \(T(\mathbf{u}) = \sum b_j T(\mathbf{v}_j)\). <em>Independence</em>: if \(\sum b_j T(\mathbf{v}_j) = \mathbf{0}\), then \(T(\sum b_j\mathbf{v}_j) = \mathbf{0}\), so \(\sum b_j\mathbf{v}_j \in \ker T = \operatorname{Span}\{\mathbf{k}_i\}\), forcing all \(b_j = 0\). Hence \(\operatorname{rank}(T) = r\) and \(\operatorname{nullity}(T) = s\). \(\square\)

The rank-nullity theorem says that a linear map "uses up" dimension: the more it collapses (large kernel), the less it maps onto (small image). The two always add up to the dimension of the domain.

### Isomorphism Theorems

<div class="definition">

<strong>Definition 4.9 (Isomorphism).</strong> A linear map \(T : V \to W\) is an <em>isomorphism</em> if it is bijective. We write \(V \cong W\) and say the spaces are <em>isomorphic</em>.

</div>

<div class="theorem">

<strong>Theorem 4.10 (First Isomorphism Theorem).</strong> Let \(T : V \to W\) be linear. Then \(V/\ker T \cong \operatorname{im} T\).

</div>

*Proof.* Define \(\tilde{T} : V/\ker T \to \operatorname{im} T\) by \(\tilde{T}(\mathbf{v} + \ker T) = T(\mathbf{v})\). This is well-defined (cosets of \(\ker T\) have the same \(T\)-image), linear, surjective onto \(\operatorname{im} T\), and injective (if \(T(\mathbf{v}) = \mathbf{0}\) then \(\mathbf{v} \in \ker T\), so the coset is zero in \(V/\ker T\)). \(\square\)

<div class="corollary">

<strong>Corollary 4.11.</strong> Two finite-dimensional vector spaces over \(\mathbb{R}\) are isomorphic if and only if they have the same dimension.

</div>

## 4.4 Matrix Representations

Every linear map between finite-dimensional spaces can be encoded as a matrix, once bases are chosen.

<div class="definition">

<strong>Definition 4.12 (Matrix of a Linear Map).</strong> Let \(T : V \to W\) be linear, \(\mathcal{B} = \{\mathbf{v}_1, \ldots, \mathbf{v}_n\}\) a basis for \(V\), \(\mathcal{C} = \{\mathbf{w}_1, \ldots, \mathbf{w}_m\}\) a basis for \(W\). The <em>matrix of \(T\) with respect to \(\mathcal{B}\) and \(\mathcal{C}\)</em> is
\[
[T]_{\mathcal{B}}^{\mathcal{C}} = \bigl[[T(\mathbf{v}_1)]_{\mathcal{C}} \;\; [T(\mathbf{v}_2)]_{\mathcal{C}} \;\; \cdots \;\; [T(\mathbf{v}_n)]_{\mathcal{C}}\bigr] \in M_{m \times n}(\mathbb{R}).
\]

</div>

The key property: \([T(\mathbf{v})]_{\mathcal{C}} = [T]_{\mathcal{B}}^{\mathcal{C}} [\mathbf{v}]_{\mathcal{B}}\). For a linear operator \(T : V \to V\), choosing \(\mathcal{B} = \mathcal{C}\) gives the <em>\(\mathcal{B}\)-matrix</em> \([T]_{\mathcal{B}}\). If \(P = {}_{\mathcal{E}}\!P_{\mathcal{B}}\) is the change-of-basis matrix from \(\mathcal{B}\) to the standard basis \(\mathcal{E}\), then \([T]_{\mathcal{B}} = P^{-1}[T]_{\mathcal{E}}P\) — a key formula for diagonalisation.

---

# Chapter 5: Dual Spaces

Every vector space \(V\) carries a shadow: its <em>dual space</em>, the space of all linear functionals on \(V\). The dual is not exotic — it is just the space of linear maps \(V \to \mathbb{R}\) — but it leads to a surprisingly rich and symmetric theory, and it is the right language for understanding transposes, bilinear forms, and later, tensors.

## 5.1 Linear Functionals and the Dual Space

<div class="definition">

<strong>Definition 5.1 (Linear Functional, Dual Space).</strong> A <em>linear functional</em> on \(V\) is a linear map \(\phi : V \to \mathbb{R}\). The <em>dual space</em> of \(V\) is \(V^* = \mathcal{L}(V, \mathbb{R})\), the set of all linear functionals on \(V\), with the usual pointwise operations.

</div>

Since \(\mathbb{R}\) is itself a vector space, \(V^*\) is a vector space over \(\mathbb{R}\). Examples: (a) for any \(\mathbf{a} \in \mathbb{R}^n\), the map \(\phi_{\mathbf{a}}(\mathbf{x}) = \mathbf{a} \cdot \mathbf{x}\) is a linear functional on \(\mathbb{R}^n\); (b) evaluation \(\text{ev}_t : \mathcal{P} \to \mathbb{R}\), \(p \mapsto p(t)\) is a linear functional; (c) integration \(\int_0^1 : C([0,1]) \to \mathbb{R}\) is a linear functional.

## 5.2 Dual Basis

<div class="theorem">

<strong>Theorem 5.2 (Dual Basis).</strong> Let \(\mathcal{B} = \{\mathbf{v}_1, \ldots, \mathbf{v}_n\}\) be a basis for \(V\). For each \(i\), define \(\phi^i : V \to \mathbb{R}\) by \(\phi^i(\mathbf{v}_j) = \delta_{ij}\) (the Kronecker delta). Then \(\mathcal{B}^<em> = \{\phi^1, \ldots, \phi^n\}\) is a basis for \(V^</em>\), called the <em>dual basis</em> of \(\mathcal{B}\). In particular, \(\dim V^* = \dim V\).

</div>

*Proof.* <em>Spanning</em>: for any \(\psi \in V^*\), let \(c_i = \psi(\mathbf{v}_i)\). Then \(\psi - \sum c_i \phi^i\) vanishes on each \(\mathbf{v}_j\), hence on all of \(V\), so \(\psi = \sum c_i\phi^i\). <em>Independence</em>: if \(\sum c_i\phi^i = 0\), evaluate on \(\mathbf{v}_j\) to get \(c_j = 0\). \(\square\)

The dual basis \(\phi^i\) is often written as a row vector: \(\phi^i\) extracts the \(i\)-th coordinate with respect to \(\mathcal{B}\). Notice that \(\phi^i(\mathbf{v}) = [\mathbf{v}]_{\mathcal{B},i}\) is the \(i\)-th component of the coordinate vector.

<div class="remark">

<strong>Remark 5.3 (Double Dual).</strong> There is a natural injection \(\iota : V \hookrightarrow V^{<strong>}\) given by \(\iota(\mathbf{v})(\phi) = \phi(\mathbf{v})\). When \(V\) is finite-dimensional, \(\iota\) is an isomorphism (\(V \cong V^{</strong>}\)) and we may identify \(V\) with its double dual. No such canonical identification exists between \(V\) and \(V^<em>\); an isomorphism \(V \xrightarrow{\sim} V^</em>\) requires choosing a basis (or an inner product).

</div>

## 5.3 The Transpose of a Linear Map

<div class="definition">

<strong>Definition 5.4 (Transpose / Dual Map).</strong> Let \(T : V \to W\) be linear. The <em>transpose</em> (or <em>dual map</em>) of \(T\) is the linear map \(T^<em> : W^</em> \to V^<em>\) defined by \(T^</em>(\psi) = \psi \circ T\), i.e., \((T^*\psi)(\mathbf{v}) = \psi(T(\mathbf{v}))\).

</div>

The notation is natural: \(T^*\) "pulls back" functionals from \(W\) to \(V\). The matrix of \(T^*\) with respect to the dual bases is the transpose of the matrix of \(T\):

<div class="theorem">

<strong>Theorem 5.5.</strong> Let \([T]_{\mathcal{B}}^{\mathcal{C}} = A\). Then \([T^<em>]_{\mathcal{C}^</em>}^{\mathcal{B}^*} = A^T\).

</div>

*Proof.* Compute: \((T^*\phi^j)(\mathbf{v}_i) = \phi^j(T(\mathbf{v}_i)) = \phi^j\!\left(\sum_k a_{ki}\mathbf{w}_k\right) = a_{ji}\). Thus \(T^*\phi^j = \sum_i a_{ji}\psi^i\), meaning the \(j\)-th column of \([T^*]\) is the \(j\)-th row of \(A\), i.e., \([T^*] = A^T\). \(\square\)

This explains why the matrix transpose is the "right" operation on matrices: it corresponds to taking the dual of the associated linear map.

---

# Chapter 6: Determinants

Determinants are simultaneously a computational tool (testing invertibility, computing volumes) and a conceptual cornerstone (characterising alternating multilinear forms). The cleaner approach — and the one that makes all the properties obvious — is to start from the algebraic definition.

## 6.1 Multilinear Alternating Forms

Think of a square matrix as \(n\) column vectors. A function of those \(n\) vectors that is linear in each separately, and changes sign when two columns are swapped, is called an alternating multilinear form.

<div class="definition">

<strong>Definition 6.1 (Alternating Multilinear Form).</strong> A function \(D : (\mathbb{R}^n)^n \to \mathbb{R}\) is an <em>\(n\)-linear alternating form</em> if:
(1) <em>Multilinearity</em>: \(D\) is linear in each argument separately.
(2) <em>Alternating</em>: \(D(\ldots, \mathbf{v}_i, \ldots, \mathbf{v}_j, \ldots) = -D(\ldots, \mathbf{v}_j, \ldots, \mathbf{v}_i, \ldots)\) whenever columns \(i\) and \(j\) are swapped.

</div>

<div class="theorem">

<strong>Theorem 6.2 (Uniqueness up to Scaling).</strong> The space of \(n\)-linear alternating forms on \(\mathbb{R}^n\) is one-dimensional. In particular, any two such forms are proportional.

</div>

*Proof (sketch).* If \(D\) is alternating multilinear and \(\mathbf{A} = [\mathbf{a}_1 \cdots \mathbf{a}_n]\), write each \(\mathbf{a}_j = \sum_i a_{ij}\mathbf{e}_i\). By multilinearity, \(D(\mathbf{A}) = \sum_\sigma a_{\sigma(1),1}\cdots a_{\sigma(n),n} D(\mathbf{e}_{\sigma(1)}, \ldots, \mathbf{e}_{\sigma(n)})\) where the sum runs over all permutations \(\sigma\). The alternating property forces \(D(\mathbf{e}_{\sigma(1)}, \ldots, \mathbf{e}_{\sigma(n)}) = \operatorname{sgn}(\sigma) D(\mathbf{e}_1, \ldots, \mathbf{e}_n)\), so \(D = D(I) \cdot \det\) where \(\det\) is the unique alternating multilinear form normalised by \(\det(I) = 1\). \(\square\)

<div class="definition">

<strong>Definition 6.3 (Determinant).</strong> The <em>determinant</em> \(\det : M_{n \times n}(\mathbb{R}) \to \mathbb{R}\) is the unique \(n\)-linear alternating form satisfying \(\det(I_n) = 1\). Explicitly:
\[
\det(A) = \sum_{\sigma \in S_n} \operatorname{sgn}(\sigma)\, a_{\sigma(1),1} a_{\sigma(2),2} \cdots a_{\sigma(n),n},
\]
where the sum is over all permutations \(\sigma\) of \(\{1, \ldots, n\}\) and \(\operatorname{sgn}(\sigma) = \pm 1\) is the sign of the permutation.

</div>

## 6.2 Properties and Computation

The defining properties immediately yield the row-operation rules that make computation tractable.

<div class="theorem">

<strong>Theorem 6.4 (Determinant under Row Operations).</strong> Let \(A \in M_{n \times n}(\mathbb{R})\). (1) Multiplying a row by \(c\) multiplies the determinant by \(c\). (2) Swapping two rows negates the determinant. (3) Adding a multiple of one row to another leaves the determinant unchanged.

</div>

Consequently: \(\det A = 0\) if \(A\) has two equal rows, or a zero row, or a row that is a linear combination of the others.

<div class="theorem">

<strong>Theorem 6.5.</strong> \(\det(AB) = \det(A)\det(B)\). In particular, \(\det(A^{-1}) = 1/\det(A)\) for invertible \(A\), and \(\det(A^T) = \det(A)\).

</div>

*Proof.* Both sides define alternating multilinear functions of the columns of \(AB\). Since the space of such forms is one-dimensional, they are proportional; evaluating at \(A = I\) gives proportionality constant \(\det(B)\), yielding \(\det(AB) = \det(A)\det(B)\). \(\square\)

<div class="theorem">

<strong>Theorem 6.6 (Invertibility Criterion).</strong> A square matrix \(A\) is invertible if and only if \(\det(A) \neq 0\).

</div>

*Proof.* \(A\) is invertible iff its RREF is \(I\), iff its rows are linearly independent. Row-reduce \(A\) to \(I\); each ERO multiplies the determinant by a nonzero scalar, so \(\det(A) \neq 0\) iff \(\det\) was never forced to zero, iff no row became zero during elimination, iff the rows are independent. \(\square\)

<div class="definition">

<strong>Definition 6.7 (Cofactor Expansion).</strong> The <em>cofactor</em> \(C_{ij} = (-1)^{i+j}\det(A(i,j))\), where \(A(i,j)\) is the \((n-1) \times (n-1)\) matrix with row \(i\) and column \(j\) deleted. Then for any fixed \(i\):
\[
\det(A) = \sum_{j=1}^n a_{ij} C_{ij} \quad \text{(expansion along row } i\text{)}.
\]

</div>

The adjugate matrix is \(\operatorname{adj}(A) = (\operatorname{cof} A)^T\), and \(A^{-1} = \frac{1}{\det A}\operatorname{adj}(A)\) for invertible \(A\).

## 6.3 Geometric Interpretation: Volume

The determinant measures signed volume. This is the deepest geometric content of the subject.

<div class="theorem">

<strong>Theorem 6.8 (Determinant as Volume).</strong> If \(\mathbf{v}_1, \ldots, \mathbf{v}_n \in \mathbb{R}^n\), the \(n\)-dimensional volume of the parallelotope spanned by them is \(|\det[\mathbf{v}_1 \cdots \mathbf{v}_n]|\).

</div>

In dimension 2, \(|\det[\mathbf{u}\ \mathbf{v}]|\) is the area of the parallelogram spanned by \(\mathbf{u}\) and \(\mathbf{v}\). The sign records orientation: positive if the ordered pair \((\mathbf{u}, \mathbf{v})\) is a positively oriented frame, negative otherwise. The formula \(\det(AB) = \det(A)\det(B)\) then says: a linear transformation multiplies all volumes by the factor \(|\det A|\).

---

# Chapter 7: Eigenvalues and Diagonalization

Given a linear operator \(T : V \to V\), can we find a basis in which the matrix of \(T\) is diagonal — i.e., a basis of "eigen-directions"? This question leads to the spectral theory of matrices and is fundamental to differential equations, quantum mechanics, Markov chains, and data science.

## 7.1 Characteristic Polynomial

<div class="definition">

<strong>Definition 7.1 (Eigenvalue, Eigenvector).</strong> Let \(T : V \to V\) be a linear operator. A scalar \(\lambda \in \mathbb{R}\) is an <em>eigenvalue</em> of \(T\) if there exists a nonzero vector \(\mathbf{v} \in V\) with \(T(\mathbf{v}) = \lambda\mathbf{v}\); such \(\mathbf{v}\) is an <em>eigenvector</em>. Equivalently, \(\lambda\) is an eigenvalue iff \((T - \lambda\operatorname{id}_V)\) is not injective, iff \(\ker(T - \lambda\operatorname{id}_V) \neq \{\mathbf{0}\}\).

</div>

For a matrix \(A\), this means \((A - \lambda I)\mathbf{v} = \mathbf{0}\) has a nonzero solution, which happens iff \(\det(A - \lambda I) = 0\).

<div class="definition">

<strong>Definition 7.2 (Characteristic Polynomial).</strong> The <em>characteristic polynomial</em> of \(A \in M_{n \times n}(\mathbb{R})\) is \(p_A(\lambda) = \det(A - \lambda I)\). This is a polynomial of degree \(n\) in \(\lambda\), with leading term \((-1)^n\lambda^n\).

</div>

Notice that \(\operatorname{tr}(A) = \lambda_1 + \cdots + \lambda_n\) (sum of eigenvalues) and \(\det(A) = \lambda_1 \cdots \lambda_n\) (product of eigenvalues), where the \(\lambda_i\) are the roots of \(p_A\) counted with multiplicity. Similar matrices have the same characteristic polynomial, so eigenvalues are properties of the operator, not the matrix.

<div class="definition">

<strong>Definition 7.3 (Algebraic and Geometric Multiplicity).</strong> The <em>algebraic multiplicity</em> \(a_\lambda\) of eigenvalue \(\lambda\) is its multiplicity as a root of \(p_A\). The <em>eigenspace</em> is \(E_\lambda = \ker(A - \lambda I)\), and the <em>geometric multiplicity</em> is \(g_\lambda = \dim E_\lambda \geq 1\).

</div>

<div class="theorem">

<strong>Theorem 7.4.</strong> For any eigenvalue \(\lambda\), \(1 \leq g_\lambda \leq a_\lambda\).

</div>

## 7.2 Eigenspaces and Independence

<div class="lemma">

<strong>Lemma 7.5 (Eigenvectors for Distinct Eigenvalues are Independent).</strong> If \(\lambda_1, \ldots, \lambda_k\) are distinct eigenvalues of \(A\) with eigenvectors \(\mathbf{v}_1, \ldots, \mathbf{v}_k\), then \(\{\mathbf{v}_1, \ldots, \mathbf{v}_k\}\) is linearly independent.

</div>

*Proof.* By induction on \(k\). The base case \(k=1\) is clear (\(\mathbf{v}_1 \neq \mathbf{0}\)). Suppose the result holds for \(k-1\), and suppose \(\sum_{i=1}^k c_i\mathbf{v}_i = \mathbf{0}\). Apply \(A\) to get \(\sum_{i=1}^k c_i\lambda_i\mathbf{v}_i = \mathbf{0}\), then subtract \(\lambda_k\) times the original: \(\sum_{i=1}^{k-1}c_i(\lambda_i - \lambda_k)\mathbf{v}_i = \mathbf{0}\). By induction, \(c_i(\lambda_i - \lambda_k) = 0\) for \(1 \leq i \leq k-1\); since \(\lambda_i \neq \lambda_k\), we get \(c_i = 0\), and then \(c_k = 0\) follows. \(\square\)

<div class="theorem">

<strong>Theorem 7.6.</strong> Let \(A\) have distinct eigenvalues \(\lambda_1, \ldots, \lambda_k\). For each \(i\), let \(\mathcal{B}_i\) be a basis for \(E_{\lambda_i}\). Then \(\mathcal{B}_1 \cup \cdots \cup \mathcal{B}_k\) is linearly independent.

</div>

## 7.3 Diagonalizability Criterion

<div class="definition">

<strong>Definition 7.7 (Diagonalizable).</strong> A matrix \(A \in M_{n \times n}(\mathbb{R})\) is <em>diagonalizable</em> if there exists an invertible \(P\) and a diagonal \(D\) with \(A = PDP^{-1}\). The columns of \(P\) are then eigenvectors and the diagonal entries of \(D\) are the corresponding eigenvalues.

</div>

<div class="theorem">

<strong>Theorem 7.8 (Diagonalizability Criterion).</strong> An \(n \times n\) matrix \(A\) is diagonalizable over \(\mathbb{R}\) if and only if:
(1) the characteristic polynomial \(p_A\) splits completely into linear factors over \(\mathbb{R}\), and
(2) for each eigenvalue \(\lambda\), the geometric multiplicity equals the algebraic multiplicity: \(g_\lambda = a_\lambda\).

</div>

*Proof.* \(A\) is diagonalizable iff \(\mathbb{R}^n\) has a basis of eigenvectors of \(A\). By Theorem 7.6, bases for distinct eigenspaces are independent; collecting them gives a basis for \(\mathbb{R}^n\) iff their total size \(\sum g_{\lambda_i} = n = \sum a_{\lambda_i}\), which requires both splitting and \(g_\lambda = a_\lambda\) for all \(\lambda\). \(\square\)

<div class="corollary">

<strong>Corollary 7.9.</strong> If \(A\) has \(n\) distinct real eigenvalues, it is diagonalizable.

</div>

## 7.4 Powers of Matrices and the Cayley–Hamilton Theorem (Preview)

If \(A = PDP^{-1}\), then \(A^k = PD^kP^{-1}\) and \(D^k = \operatorname{diag}(\lambda_1^k, \ldots, \lambda_n^k)\). This makes computing large powers of diagonalisable matrices essentially free.

<div class="theorem">

<strong>Theorem 7.10 (Cayley–Hamilton, Preview).</strong> Every square matrix satisfies its own characteristic polynomial: if \(p_A(\lambda) = \det(A - \lambda I)\), then \(p_A(A) = 0\) (the zero matrix).

</div>

The Cayley–Hamilton theorem will be proved in full in MATH 245 using the Smith normal form or the theory of modules over a PID. Here we note a corollary: every power \(A^k\) for \(k \geq n\) can be expressed as a linear combination of \(I, A, A^2, \ldots, A^{n-1}\), so the algebra \(\mathbb{R}[A]\) is at most \(n\)-dimensional. This is the beginning of the theory of the minimal polynomial, which will tell us exactly when a matrix is diagonalizable and what Jordan normal form looks like.

---

# Appendix: The Invertible Matrix Theorem

The following compendium shows how many apparently different conditions on a square matrix are in fact equivalent. Let \(A\) be an \(n \times n\) real matrix.

<div class="theorem">

<strong>Theorem A.1 (Invertible Matrix Theorem).</strong> The following are equivalent:
(1) \(A\) is invertible.
(2) The RREF of \(A\) is \(I_n\).
(3) \(\operatorname{rank}(A) = n\).
(4) \(A\mathbf{x} = \mathbf{b}\) has a unique solution for every \(\mathbf{b} \in \mathbb{R}^n\).
(5) \(\operatorname{Null}(A) = \{\mathbf{0}\}\).
(6) The columns of \(A\) form a basis for \(\mathbb{R}^n\).
(7) The rows of \(A\) form a basis for \(\mathbb{R}^n\).
(8) \(A^T\) is invertible.
(9) \(\det(A) \neq 0\).
(10) \(0\) is not an eigenvalue of \(A\).

</div>

Each of these conditions is a different lens on the same phenomenon: a square matrix either establishes a perfect bijection between \(\mathbb{R}^n\) and itself, or it collapses some nonzero subspace to zero. There is no middle ground.
