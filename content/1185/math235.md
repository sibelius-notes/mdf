---
title: "MATH 235: Linear Algebra 2 for Honours Mathematics"
subjects: "MATH"
---

# Chapter 7: Fundamental Subspaces

This chapter reviews key concepts from MATH 136 (subspaces, bases, dimension, linear mappings) and establishes the tools needed for the rest of the course.

## 7.1 Bases of Fundamental Subspaces

<div class="definition">

<strong>Definition (Fundamental Subspaces).</strong> Let \(A\) be an \(m \times n\) matrix. The four fundamental subspaces of \(A\) are:
1. The columnspace \(\text{Col}(A) = \{A\vec{x} \in \mathbb{R}^m \mid \vec{x} \in \mathbb{R}^n\}\).
2. The rowspace \(\text{Row}(A) = \{A^T \vec{x} \in \mathbb{R}^n \mid \vec{x} \in \mathbb{R}^m\}\).
3. The nullspace \(\text{Null}(A) = \{\vec{x} \in \mathbb{R}^n \mid A\vec{x} = \vec{0}\}\).
4. The left nullspace \(\text{Null}(A^T) = \{\vec{x} \in \mathbb{R}^m \mid A^T\vec{x} = \vec{0}\}\).

</div>

<div class="theorem">

<strong>Theorem 7.1.1.</strong> Let \(A\) be an \(m \times n\) matrix. Then \(\text{Col}(A)\) and \(\text{Null}(A^T)\) are subspaces of \(\mathbb{R}^m\), and \(\text{Row}(A)\) and \(\text{Null}(A)\) are subspaces of \(\mathbb{R}^n\).

</div>

<div class="theorem">

<strong>Theorem 7.1.2.</strong> Let \(A\) be an \(m \times n\) matrix. The columns of \(A\) which correspond to leading ones in the reduced row echelon form of \(A\) form a basis for \(\text{Col}(A)\). Moreover, \(\dim \text{Col}(A) = \text{rank}\, A\).

</div>

<div class="theorem">

<strong>Theorem 7.1.3.</strong> Let \(A\) be an \(m \times n\) matrix. The set of all non-zero rows in the reduced row echelon form of \(A\) form a basis for \(\text{Row}(A)\). Hence, \(\dim \text{Row}(A) = \text{rank}\, A\).

</div>

<div class="theorem">

<strong>Theorem 7.1.4 (Dimension Theorem).</strong> Let \(A\) be an \(m \times n\) matrix. Then
\[\text{rank}\, A + \dim \text{Null}(A) = n\]

</div>

<div class="corollary">

<strong>Corollary 7.1.5.</strong> Let \(A\) be an \(m \times n\) matrix with \(\text{rank}\, A = r\). Then
\[\dim \text{Null}(A) = n - r \qquad \dim \text{Null}(A^T) = m - r\]

</div>

## 7.2 Subspaces of Linear Mappings

Recall that every linear mapping \(L : \mathbb{R}^n \to \mathbb{R}^m\) has a standard matrix \([L]\) satisfying \(L(\vec{x}) = [L]\vec{x}\). The range and kernel of \(L\) are linked to the fundamental subspaces of \([L]\).

<div class="theorem">

<strong>Theorem 7.2.1.</strong> If \(L : \mathbb{R}^n \to \mathbb{R}^m\) is a linear mapping, then \(\text{Range}(L) = \text{Col}([L])\) and \(\text{rank}[L] = \dim \text{Range}(L)\).

</div>

<div class="theorem">

<strong>Theorem 7.2.2.</strong> If \(L : \mathbb{R}^n \to \mathbb{R}^m\) is a linear mapping, then \(\text{Ker}(L) = \text{Null}([L])\) and \(\dim(\text{Ker}(L)) = n - \text{rank}[L]\).

</div>

<div class="theorem">

<strong>Theorem 7.2.3.</strong> Let \(L : \mathbb{R}^n \to \mathbb{R}^m\) be a linear mapping. Then
\[\dim \text{Range}(L) + \dim \text{Ker}(L) = \dim(\mathbb{R}^n)\]

</div>

---

# Chapter 8: Linear Mappings

This chapter generalizes linear mappings from \(\mathbb{R}^n \to \mathbb{R}^m\) to mappings between arbitrary vector spaces, develops the Rank-Nullity Theorem, introduces the matrix of a linear mapping with respect to chosen bases, and studies isomorphisms.

## 8.1 General Linear Mappings

<div class="definition">

<strong>Definition (Linear Mapping).</strong> Let \(V\) and \(W\) be vector spaces. A mapping \(L : V \to W\) is called linear if
\[L(s\vec{x} + t\vec{y}) = sL(\vec{x}) + tL(\vec{y})\]
for all \(\vec{x}, \vec{y} \in V\) and \(s, t \in \mathbb{R}\).

</div>

<div class="theorem">

<strong>Theorem 8.1.1.</strong> Let \(V\) and \(W\) be vector spaces and let \(L : V \to W\) be a linear mapping. Then \(L(\vec{0}) = \vec{0}\).

</div>

<div class="definition">

<strong>Definition (Addition and Scalar Multiplication of Mappings).</strong> Let \(L : V \to W\) and \(M : V \to W\) be linear mappings. We define \(L + M\) by \((L + M)(\vec{v}) = L(\vec{v}) + M(\vec{v})\), and for any \(t \in \mathbb{R}\) we define \(tL\) by \((tL)(\vec{v}) = tL(\vec{v})\).

</div>

<div class="theorem">

<strong>Theorem 8.1.2.</strong> Let \(V\) and \(W\) be vector spaces. The set \(\mathcal{L}\) of all linear mappings \(L : V \to W\) with standard addition and scalar multiplication of mappings is a vector space.

</div>

<div class="definition">

<strong>Definition (Composition).</strong> Let \(L : V \to W\) and \(M : W \to U\) be linear mappings. Then we define \(M \circ L\) by \((M \circ L)(\vec{v}) = M(L(\vec{v}))\) for all \(\vec{v} \in V\).

</div>

## 8.2 Rank-Nullity Theorem

<div class="definition">

<strong>Definition (Range, Kernel).</strong> Let \(L : V \to W\) be a linear mapping. The kernel of \(L\) is \(\text{Ker}(L) = \{\vec{v} \in V \mid L(\vec{v}) = \vec{0}_W\}\) and the range of \(L\) is \(\text{Range}(L) = \{L(\vec{v}) \mid \vec{v} \in V\}\).

</div>

<div class="theorem">

<strong>Theorem 8.2.1.</strong> Let \(L : V \to W\) be a linear mapping. Then \(\text{Ker}(L)\) is a subspace of \(V\) and \(\text{Range}(L)\) is a subspace of \(W\).

</div>

<div class="definition">

<strong>Definition (Rank, Nullity).</strong> Let \(L : V \to W\) be a linear mapping. The rank of \(L\) is \(\text{rank}(L) = \dim(\text{Range}(L))\). The nullity of \(L\) is \(\text{nullity}(L) = \dim(\text{Ker}(L))\).

</div>

<div class="theorem">

<strong>Theorem 8.2.2 (Rank-Nullity Theorem).</strong> Let \(V\) be an \(n\)-dimensional vector space and let \(W\) be a vector space. If \(L : V \to W\) is linear, then
\[\text{rank}(L) + \text{nullity}(L) = n\]

</div>

The proof extends the basis of \(\text{Ker}(L)\) to a basis of \(V\) and shows the images of the extra basis vectors form a basis for \(\text{Range}(L)\), exactly mirroring the proof of the Dimension Theorem.

## 8.3 Matrix of a Linear Mapping

Using coordinate vectors, every linear mapping between finite-dimensional vector spaces can be represented as a matrix mapping. If \(B\) is a basis for \(V\) and \(C\) is a basis for \(W\), the matrix satisfies \([L(\vec{x})]_C = {}_C[L]_B [\vec{x}]_B\).

<div class="definition">

<strong>Definition (Matrix of a Linear Mapping).</strong> Suppose \(B = \{\vec{v}_1, \ldots, \vec{v}_n\}\) is a basis for \(V\) and \(C\) is a basis for a finite-dimensional vector space \(W\), and let \(L : V \to W\) be linear. Then the matrix of \(L\) with respect to bases \(B\) and \(C\) is
\[{}_C[L]_B = \begin{bmatrix} [L(\vec{v}_1)]_C & \cdots & [L(\vec{v}_n)]_C \end{bmatrix}\]
It satisfies \([L(\vec{x})]_C = {}_C[L]_B [\vec{x}]_B\) for all \(\vec{x} \in V\).

</div>

<div class="definition">

<strong>Definition (Matrix of a Linear Operator).</strong> Suppose \(B = \{\vec{v}_1, \ldots, \vec{v}_n\}\) is a basis for \(V\) and \(L : V \to V\) is a linear operator. Then the \(B\)-matrix of \(L\) is
\[[L]_B = \begin{bmatrix} [L(\vec{v}_1)]_B & \cdots & [L(\vec{v}_n)]_B \end{bmatrix}\]
It satisfies \([L(\vec{x})]_B = [L]_B [\vec{x}]_B\) for all \(\vec{x} \in V\).

</div>

<div class="remark">

<strong>Remark.</strong> When the basis \(B\) consists of eigenvectors of \(L\), the matrix \([L]_B\) is diagonal. This connection between diagonalization and the matrix of a linear operator is central to the course.

</div>

## 8.4 Isomorphisms

<div class="definition">

<strong>Definition (One-to-One, Onto).</strong> Let \(L : V \to W\) be a linear mapping. \(L\) is called one-to-one (injective) if \(L(\vec{u}) = L(\vec{v})\) implies \(\vec{u} = \vec{v}\). \(L\) is called onto (surjective) if for every \(\vec{w} \in W\), there exists \(\vec{v} \in V\) such that \(L(\vec{v}) = \vec{w}\).

</div>

<div class="lemma">

<strong>Lemma 8.4.1.</strong> Let \(L : V \to W\) be a linear mapping. \(L\) is one-to-one if and only if \(\text{Ker}(L) = \{\vec{0}\}\).

</div>

<div class="definition">

<strong>Definition (Isomorphism).</strong> Let \(V\) and \(W\) be vector spaces. Then \(V\) is said to be isomorphic to \(W\) if there exists a linear mapping \(L : V \to W\) which is one-to-one and onto. \(L\) is called an isomorphism.

</div>

<div class="theorem">

<strong>Theorem 8.4.2.</strong> Let \(V\) and \(W\) be finite-dimensional vector spaces. Then \(V\) is isomorphic to \(W\) if and only if \(\dim V = \dim W\).

</div>

<div class="theorem">

<strong>Theorem 8.4.3.</strong> If \(V\) and \(W\) are isomorphic vector spaces and \(L : V \to W\) is linear, then \(L\) is one-to-one if and only if \(L\) is onto.

</div>

<div class="theorem">

<strong>Theorem 8.4.4.</strong> Let \(V\) and \(W\) be isomorphic vector spaces and let \(\{\vec{v}_1, \ldots, \vec{v}_n\}\) be a basis for \(V\). Then a linear mapping \(L : V \to W\) is an isomorphism if and only if \(\{L(\vec{v}_1), \ldots, L(\vec{v}_n)\}\) is a basis for \(W\).

</div>

---

# Chapter 9: Inner Products

This chapter extends the dot product to general inner products on vector spaces, develops orthogonality, the Gram-Schmidt procedure, projections, the Fundamental Theorem of Linear Algebra, and least squares.

## 9.1 Inner Product Spaces

<div class="definition">

<strong>Definition (Inner Product).</strong> Let \(V\) be a vector space. An inner product on \(V\) is a function \(\langle \cdot, \cdot \rangle : V \times V \to \mathbb{R}\) satisfying for every \(\vec{v}, \vec{u}, \vec{w} \in V\) and \(s, t \in \mathbb{R}\):

- I1 (Positive Definite): \(\langle \vec{v}, \vec{v} \rangle \geq 0\) and \(\langle \vec{v}, \vec{v} \rangle = 0\) if and only if \(\vec{v} = \vec{0}\).
- I2 (Symmetric): \(\langle \vec{v}, \vec{w} \rangle = \langle \vec{w}, \vec{v} \rangle\).
- I3 (Bilinear): \(\langle s\vec{v} + t\vec{u}, \vec{w} \rangle = s\langle \vec{v}, \vec{w} \rangle + t\langle \vec{u}, \vec{w} \rangle\).

</div>

<div class="definition">

<strong>Definition (Inner Product Space).</strong> A vector space \(V\) with an inner product \(\langle \cdot, \cdot \rangle\) on \(V\) is called an inner product space.

</div>

Important examples include the standard dot product on \(\mathbb{R}^n\), the trace inner product \(\langle A, B \rangle = \text{tr}(B^T A)\) on \(M_{m \times n}(\mathbb{R})\), evaluation inner products such as \(\langle p, q \rangle = p(-1)q(-1) + p(0)q(0) + p(1)q(1)\) on \(P_2(\mathbb{R})\), and the integral inner product \(\langle f, g \rangle = \int_{-\pi}^{\pi} f(x)g(x)\,dx\) on \(C[-\pi, \pi]\).

<div class="theorem">

<strong>Theorem 9.1.1.</strong> Let \(V\) be an inner product space. Then for any \(\vec{v} \in V\), \(\langle \vec{v}, \vec{0} \rangle = 0\).

</div>

## 9.2 Orthogonality and Length

<div class="definition">

<strong>Definition (Length).</strong> Let \(V\) be an inner product space. For any \(\vec{v} \in V\), the length (or norm) of \(\vec{v}\) is \(\|\vec{v}\| = \sqrt{\langle \vec{v}, \vec{v} \rangle}\).

</div>

<div class="definition">

<strong>Definition (Unit Vector).</strong> If \(\vec{v} \in V\) satisfies \(\|\vec{v}\| = 1\), then \(\vec{v}\) is called a unit vector.

</div>

<div class="theorem">

<strong>Theorem 9.2.1.</strong> Let \(V\) be an inner product space. For any \(\vec{v} \in V\) and \(t \in \mathbb{R}\), we have \(\|t\vec{v}\| = |t|\|\vec{v}\|\). Moreover, if \(\vec{v} \neq \vec{0}\), then \(\hat{v} = \frac{1}{\|\vec{v}\|}\vec{v}\) is a unit vector.

</div>

<div class="definition">

<strong>Definition (Orthogonal Vectors).</strong> Vectors \(\vec{x}, \vec{y}\) in an inner product space are orthogonal if \(\langle \vec{x}, \vec{y} \rangle = 0\).

</div>

<div class="definition">

<strong>Definition (Orthogonal Set).</strong> A set \(S = \{\vec{v}_1, \ldots, \vec{v}_k\}\) is orthogonal if \(\langle \vec{v}_i, \vec{v}_j \rangle = 0\) for all \(i \neq j\).

</div>

<div class="theorem">

<strong>Theorem 9.2.2 (Generalized Pythagorean Theorem).</strong> If \(\{\vec{v}_1, \ldots, \vec{v}_k\}\) is an orthogonal set, then \(\|\vec{v}_1 + \cdots + \vec{v}_k\|^2 = \|\vec{v}_1\|^2 + \cdots + \|\vec{v}_k\|^2\).

</div>

<div class="theorem">

<strong>Theorem 9.2.3.</strong> Let \(S = \{\vec{v}_1, \ldots, \vec{v}_k\}\) be an orthogonal set in an inner product space with \(\vec{v}_i \neq \vec{0}\) for all \(i\). Then \(S\) is linearly independent.

</div>

<div class="theorem">

<strong>Theorem 9.2.4 (Coordinates w.r.t. Orthogonal Basis).</strong> If \(S = \{\vec{v}_1, \ldots, \vec{v}_n\}\) is an orthogonal basis for an inner product space \(V\) and \(\vec{v} \in V\), then
\[\vec{v} = \frac{\langle \vec{v}, \vec{v}_1 \rangle}{\|\vec{v}_1\|^2}\vec{v}_1 + \cdots + \frac{\langle \vec{v}, \vec{v}_n \rangle}{\|\vec{v}_n\|^2}\vec{v}_n\]

</div>

<div class="definition">

<strong>Definition (Orthonormal Set, Orthonormal Basis).</strong> An orthogonal set \(S = \{\vec{v}_1, \ldots, \vec{v}_k\}\) with \(\|\vec{v}_i\| = 1\) for all \(i\) is called orthonormal. An orthonormal set that is a basis for \(V\) is an orthonormal basis.

</div>

<div class="theorem">

<strong>Theorem 9.2.5 (Coordinates w.r.t. Orthonormal Basis).</strong> If \(B = \{\vec{v}_1, \ldots, \vec{v}_n\}\) is an orthonormal basis for \(V\) and \(\vec{v} \in V\), then
\[\vec{v} = \langle \vec{v}, \vec{v}_1 \rangle \vec{v}_1 + \cdots + \langle \vec{v}, \vec{v}_n \rangle \vec{v}_n\]

</div>

<div class="theorem">

<strong>Theorem 9.2.6.</strong> For an \(n \times n\) matrix \(P\), the following are equivalent:
1. The columns of \(P\) form an orthonormal basis for \(\mathbb{R}^n\).
2. \(P^T = P^{-1}\).
3. The rows of \(P\) form an orthonormal basis for \(\mathbb{R}^n\).

</div>

<div class="definition">

<strong>Definition (Orthogonal Matrix).</strong> An \(n \times n\) matrix \(P\) whose columns form an orthonormal basis for \(\mathbb{R}^n\) is called an orthogonal matrix.

</div>

<div class="theorem">

<strong>Theorem 9.2.7.</strong> Let \(P\) and \(Q\) be \(n \times n\) orthogonal matrices and \(\vec{x}, \vec{y} \in \mathbb{R}^n\). Then:
1. \((P\vec{x}) \cdot (P\vec{y}) = \vec{x} \cdot \vec{y}\).
2. \(\|P\vec{x}\| = \|\vec{x}\|\).
3. \(\det P = \pm 1\).
4. All real eigenvalues of \(P\) are \(\pm 1\).
5. \(PQ\) is orthogonal.

</div>

## 9.3 The Gram-Schmidt Procedure

Given any basis for a subspace of an inner product space, the Gram-Schmidt procedure converts it into an orthogonal basis. Each new vector is obtained by subtracting the projection onto the span of the previously computed vectors.

<div class="theorem">

<strong>Theorem 9.3.1 (Gram-Schmidt Orthogonalization).</strong> Let \(W\) be a subspace of an inner product space with basis \(\{\vec{w}_1, \ldots, \vec{w}_k\}\). Define successively:
\[\vec{v}_1 = \vec{w}_1\]
\[\vec{v}_2 = \vec{w}_2 - \frac{\langle \vec{w}_2, \vec{v}_1 \rangle}{\|\vec{v}_1\|^2}\vec{v}_1\]
\[\vec{v}_i = \vec{w}_i - \frac{\langle \vec{w}_i, \vec{v}_1 \rangle}{\|\vec{v}_1\|^2}\vec{v}_1 - \frac{\langle \vec{w}_i, \vec{v}_2 \rangle}{\|\vec{v}_2\|^2}\vec{v}_2 - \cdots - \frac{\langle \vec{w}_i, \vec{v}_{i-1} \rangle}{\|\vec{v}_{i-1}\|^2}\vec{v}_{i-1}\]
for \(3 \leq i \leq k\). Then \(\text{Span}\{\vec{v}_1, \ldots, \vec{v}_i\} = \text{Span}\{\vec{w}_1, \ldots, \vec{w}_i\}\) for \(1 \leq i \leq k\). In particular, \(\{\vec{v}_1, \ldots, \vec{v}_k\}\) is an orthogonal basis for \(W\).

</div>

If a vector \(\vec{v}_i\) turns out to be \(\vec{0}\), this indicates that \(\vec{w}_i\) was a linear combination of the previous vectors; we simply skip it and continue.

<svg viewBox="0 0 340 220" xmlns="http://www.w3.org/2000/svg" style="max-width:340px;display:block;margin:1.5em auto">
  <defs>
    <marker id="gsBlue" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="#3b82f6"/>
    </marker>
    <marker id="gsRed" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="#ef4444"/>
    </marker>
    <marker id="gsGreen" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="#22c55e"/>
    </marker>
    <marker id="gsDash" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="currentColor"/>
    </marker>
  </defs>
  <text x="170" y="16" font-size="12" fill="currentColor" text-anchor="middle" font-weight="bold">Gram-Schmidt: w₁, w₂ → v₁, v₂ (orthogonal)</text>
  <!-- Origin -->
  <circle cx="60" cy="180" r="3" fill="currentColor"/>
  <text x="48" y="194" font-size="10" fill="currentColor">O</text>
  <!-- w1 = v1: along (160, -60) from (60,180) → endpoint (220, 120) -->
  <line x1="60" y1="180" x2="220" y2="120" stroke="#3b82f6" stroke-width="2" marker-end="url(#gsBlue)"/>
  <text x="224" y="116" font-size="12" fill="#3b82f6" font-weight="bold">w₁=v₁</text>
  <!-- w2: original at angle, endpoint (120, 50) -->
  <line x1="60" y1="180" x2="120" y2="50" stroke="#ef4444" stroke-width="2" marker-end="url(#gsRed)"/>
  <text x="96" y="44" font-size="12" fill="#ef4444" font-weight="bold">w₂</text>
  <!-- projection of w2 onto v1: proj = ((w2·v1)/|v1|²) v1
       w2=(60,-130), v1=(160,-60). dot=60*160+(-130)(-60)=9600+7800=17400. |v1|²=160²+60²=25600+3600=29200
       proj = (17400/29200)*(160,-60) = 0.5959*(160,-60)=(95.3,-35.8) → endpoint=(60+95,180-36)=(155,144) -->
  <line x1="60" y1="180" x2="155" y2="144" stroke="currentColor" stroke-width="1.4" stroke-dasharray="5,3" marker-end="url(#gsDash)"/>
  <text x="105" y="175" font-size="10" fill="currentColor">proj</text>
  <!-- v2 = w2 - proj: from foot (155,144) to w2 (120,50)? No: v2 = w2 - proj, drawn from O
       v2 endpoint = (60+60-95, 180-130+36) = (25, 86) -->
  <line x1="60" y1="180" x2="25" y2="86" stroke="#22c55e" stroke-width="2.2" marker-end="url(#gsGreen)"/>
  <text x="8" y="82" font-size="12" fill="#22c55e" font-weight="bold">v₂</text>
  <!-- Right angle between v1 and v2 — small square symbol near origin area -->
  <!-- v1 direction (160,-60)/|v1|, v2 direction (-35,-94)/|v2| - just show text note -->
  <!-- Dashed line from proj foot to w2 tip -->
  <line x1="155" y1="144" x2="120" y2="50" stroke="#22c55e" stroke-width="1" stroke-dasharray="4,3" opacity="0.5"/>
  <!-- Right angle mark: place between v1 and v2 near O -->
  <text x="170" y="205" font-size="10" fill="currentColor" text-anchor="middle" opacity="0.7">v₂ = w₂ − proj_{v₁}(w₂),  v₁ ⊥ v₂</text>
</svg>

## 9.4 General Projections

<div class="definition">

<strong>Definition (Orthogonal Complement).</strong> Let \(W\) be a subspace of an inner product space \(V\). The orthogonal complement of \(W\) is
\[W^\perp = \{\vec{v} \in V \mid \langle \vec{w}, \vec{v} \rangle = 0 \text{ for all } \vec{w} \in W\}\]

</div>

<div class="theorem">

<strong>Theorem 9.4.1.</strong> Let \(\{\vec{v}_1, \ldots, \vec{v}_k\}\) be a basis for a subspace \(W\) of an inner product space \(V\). If \(\langle \vec{x}, \vec{v}_i \rangle = 0\) for \(1 \leq i \leq k\), then \(\vec{x} \in W^\perp\).

</div>

<div class="theorem">

<strong>Theorem 9.4.2.</strong> Let \(W\) be a finite-dimensional subspace of an inner product space \(V\). Then:
1. \(W^\perp\) is a subspace of \(V\).
2. If \(\dim V = n\), then \(\dim W^\perp = n - \dim W\).
3. If \(\dim V = n\), then \((W^\perp)^\perp = W\).
4. \(W \cap W^\perp = \{\vec{0}\}\).
5. If \(\dim V = n\), \(\{\vec{v}_1, \ldots, \vec{v}_k\}\) is an orthogonal basis for \(W\), and \(\{\vec{v}_{k+1}, \ldots, \vec{v}_n\}\) is an orthogonal basis for \(W^\perp\), then \(\{\vec{v}_1, \ldots, \vec{v}_n\}\) is an orthogonal basis for \(V\).

</div>

<div class="definition">

<strong>Definition (Projection, Perpendicular).</strong> Suppose \(W\) is a \(k\)-dimensional subspace of an inner product space \(V\) and \(\{\vec{v}_1, \ldots, \vec{v}_k\}\) is an orthogonal basis for \(W\). For any \(\vec{v} \in V\):
\[\text{proj}_W \vec{v} = \frac{\langle \vec{v}, \vec{v}_1 \rangle}{\|\vec{v}_1\|^2}\vec{v}_1 + \cdots + \frac{\langle \vec{v}, \vec{v}_k \rangle}{\|\vec{v}_k\|^2}\vec{v}_k\]
\[\text{perp}_W \vec{v} = \vec{v} - \text{proj}_W \vec{v}\]

</div>

<div class="theorem">

<strong>Theorem 9.4.3.</strong> For any \(\vec{v} \in V\), \(\text{perp}_W \vec{v} = \vec{v} - \text{proj}_W \vec{v} \in W^\perp\).

</div>

<div class="theorem">

<strong>Theorem 9.4.4.</strong> The mapping \(\text{proj}_W\) is a linear operator on \(V\) with kernel \(W^\perp\).

</div>

<div class="theorem">

<strong>Theorem 9.4.5.</strong> For any \(\vec{v} \in V\), \(\text{proj}_{W^\perp} \vec{v} = \text{perp}_W \vec{v}\).

</div>

## 9.5 The Fundamental Theorem

<div class="definition">

<strong>Definition (Direct Sum).</strong> Let \(U\) and \(W\) be subspaces of \(V\) with \(U \cap W = \{\vec{0}\}\). The direct sum is \(U \oplus W = \{\vec{u} + \vec{w} \in V \mid \vec{u} \in U, \vec{w} \in W\}\).

</div>

<div class="theorem">

<strong>Theorem 9.5.1.</strong> If \(U \cap W = \{\vec{0}\}\), then \(U \oplus W\) is a subspace of \(V\). Moreover, if \(\{\vec{v}_1, \ldots, \vec{v}_k\}\) is a basis for \(U\) and \(\{\vec{w}_1, \ldots, \vec{w}_\ell\}\) is a basis for \(W\), then \(\{\vec{v}_1, \ldots, \vec{v}_k, \vec{w}_1, \ldots, \vec{w}_\ell\}\) is a basis for \(U \oplus W\).

</div>

<div class="theorem">

<strong>Theorem 9.5.2.</strong> Let \(V\) be a finite-dimensional inner product space and \(W\) a subspace of \(V\). Then \(W \oplus W^\perp = V\).

</div>

<div class="theorem">

<strong>Theorem 9.5.3 (The Fundamental Theorem of Linear Algebra).</strong> Let \(A\) be an \(m \times n\) matrix. Then \(\text{Col}(A)^\perp = \text{Null}(A^T)\) and \(\text{Row}(A)^\perp = \text{Null}(A)\). In particular,
\[\mathbb{R}^n = \text{Row}(A) \oplus \text{Null}(A) \qquad \mathbb{R}^m = \text{Col}(A) \oplus \text{Null}(A^T)\]

</div>

This theorem implies the Rank-Nullity Theorem and many results about systems of linear equations.

## 9.6 The Method of Least Squares

When \(A\vec{x} = \vec{b}\) is inconsistent, we seek \(\vec{x}\) minimizing \(\|A\vec{x} - \vec{b}\|\). The Approximation Theorem tells us the closest vector in \(\text{Col}(A)\) to \(\vec{b}\) is \(\text{proj}_{\text{Col}(A)} \vec{b}\), leading to the normal equations.

<div class="theorem">

<strong>Theorem 9.6.1 (Approximation Theorem).</strong> Let \(W\) be a finite-dimensional subspace of an inner product space \(V\). If \(\vec{v} \in V\), then the vector in \(W\) closest to \(\vec{v}\) is \(\text{proj}_W \vec{v}\). That is, \(\|\vec{v} - \text{proj}_W \vec{v}\| < \|\vec{v} - \vec{w}\|\) for all \(\vec{w} \in W\), \(\vec{w} \neq \text{proj}_W \vec{v}\).

</div>

By the Fundamental Theorem, \(\vec{b} - A\vec{x} \in \text{Null}(A^T)\), giving the normal system \(A^T A \vec{x} = A^T \vec{b}\).

<svg viewBox="0 0 300 230" xmlns="http://www.w3.org/2000/svg" style="max-width:300px;display:block;margin:1.5em auto">
  <defs>
    <marker id="lsBlue" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="#3b82f6"/>
    </marker>
    <marker id="lsRed" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="#ef4444"/>
    </marker>
    <marker id="lsGreen" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="#22c55e"/>
    </marker>
    <marker id="lsBlk" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="currentColor"/>
    </marker>
  </defs>
  <text x="150" y="16" font-size="12" fill="currentColor" text-anchor="middle" font-weight="bold">Least Squares: proj b onto Col(A)</text>
  <!-- Col(A) plane (parallelogram) -->
  <polygon points="30,190 200,160 260,80 90,110" fill="#3b82f6" fill-opacity="0.12" stroke="#3b82f6" stroke-width="1.5"/>
  <text x="195" y="100" font-size="11" fill="#3b82f6" font-weight="bold">Col(A)</text>
  <!-- b vector -->
  <circle cx="80" cy="200" r="3" fill="currentColor"/>
  <text x="68" y="215" font-size="10" fill="currentColor">O</text>
  <line x1="80" y1="200" x2="185" y2="48" stroke="#ef4444" stroke-width="2" marker-end="url(#lsRed)"/>
  <text x="188" y="44" font-size="12" fill="#ef4444" font-weight="bold">b</text>
  <!-- Projection Ax_hat = proj_Col(A)(b) -->
  <!-- foot: roughly at (165, 135) on the plane -->
  <line x1="80" y1="200" x2="162" y2="138" stroke="#22c55e" stroke-width="2.2" marker-end="url(#lsGreen)"/>
  <text x="115" y="187" font-size="11" fill="#22c55e" font-weight="bold">Ax̂</text>
  <!-- Residual: b - Ax_hat -->
  <line x1="162" y1="138" x2="185" y2="48" stroke="currentColor" stroke-width="1.5" stroke-dasharray="5,3" marker-end="url(#lsBlk)"/>
  <text x="188" y="95" font-size="10" fill="currentColor">b − Ax̂</text>
  <!-- Right angle mark at foot -->
  <rect x="154" y="130" width="10" height="10" fill="none" stroke="currentColor" stroke-width="1" opacity="0.6"/>
  <text x="150" y="222" font-size="10" fill="currentColor" text-anchor="middle" opacity="0.7">b − Ax̂ ⊥ Col(A)  ⟹  AᵀAx̂ = Aᵀb</text>
</svg>

<div class="theorem">

<strong>Theorem 9.6.2 (Least Squares).</strong> Given data points \((x_1, y_1), \ldots, (x_m, y_m)\), let
\[X = \begin{bmatrix} 1 & x_1 & \cdots & x_1^n \\ \vdots & \vdots & & \vdots \\ 1 & x_m & \cdots & x_m^n \end{bmatrix}, \quad \vec{y} = \begin{bmatrix} y_1 \\ \vdots \\ y_m \end{bmatrix}\]
If \(\vec{a}\) solves the normal system \(X^T X \vec{a} = X^T \vec{y}\), then \(p(x) = a_0 + a_1 x + \cdots + a_n x^n\) is the best fitting polynomial of degree \(n\). Moreover, if at least \(n+1\) of the \(x_i\) are distinct, then \(X^T X\) is invertible and \(\vec{a} = (X^T X)^{-1} X^T \vec{y}\).

</div>

---

# Chapter 10: Applications of Orthogonal Matrices

## 10.1 Orthogonal Similarity

<div class="definition">

<strong>Definition (Orthogonally Similar).</strong> Two matrices \(A\) and \(B\) are orthogonally similar if there exists an orthogonal matrix \(P\) such that \(P^T AP = B\).

</div>

<div class="theorem">

<strong>Theorem 10.1.1 (Triangularization Theorem).</strong> If \(A\) is an \(n \times n\) matrix with real eigenvalues, then \(A\) is orthogonally similar to an upper triangular matrix \(T\).

</div>

The proof proceeds by induction on \(n\): find a unit eigenvector, extend to an orthonormal basis via Gram-Schmidt, form the orthogonal matrix \(P_1\), and reduce the problem to an \((n-1) \times (n-1)\) case.

## 10.2 Orthogonal Diagonalization

<div class="definition">

<strong>Definition (Orthogonally Diagonalizable).</strong> An \(n \times n\) matrix \(A\) is orthogonally diagonalizable if there exists an orthogonal matrix \(P\) and a diagonal matrix \(D\) such that \(P^T AP = D\).

</div>

<div class="theorem">

<strong>Theorem 10.2.1.</strong> If \(A\) is orthogonally diagonalizable, then \(A^T = A\) (i.e., \(A\) is symmetric).

</div>

<div class="definition">

<strong>Definition (Symmetric Matrix).</strong> A matrix \(A\) such that \(A^T = A\) is called symmetric.

</div>

<div class="lemma">

<strong>Lemma 10.2.2.</strong> If \(A\) is a symmetric matrix with real entries, then all of its eigenvalues are real.

</div>

The proof of this lemma requires complex inner products and is given in Chapter 11.

<div class="theorem">

<strong>Theorem 10.2.3 (Principal Axis Theorem).</strong> Every symmetric matrix is orthogonally diagonalizable.

</div>

The proof uses the Triangularization Theorem: since \(A\) is symmetric and all eigenvalues are real, we get \(P^T AP = T\) upper triangular, but then \(T^T = T\) forces \(T\) to be diagonal.

<div class="theorem">

<strong>Theorem 10.2.4.</strong> A matrix \(A\) is symmetric if and only if \(\vec{x} \cdot (A\vec{y}) = (A\vec{x}) \cdot \vec{y}\) for all \(\vec{x}, \vec{y} \in \mathbb{R}^n\).

</div>

<div class="theorem">

<strong>Theorem 10.2.5.</strong> If \(\vec{v}_1, \vec{v}_2\) are eigenvectors of a symmetric matrix \(A\) corresponding to distinct eigenvalues, then \(\vec{v}_1\) is orthogonal to \(\vec{v}_2\).

</div>

To orthogonally diagonalize a symmetric matrix: find all eigenvalues, find a basis for each eigenspace, apply Gram-Schmidt within each eigenspace (if needed), and normalize to form the orthogonal matrix \(P\).

<svg viewBox="0 0 400 160" xmlns="http://www.w3.org/2000/svg" style="max-width:400px;display:block;margin:1.5em auto">
  <text x="200" y="16" font-size="12" fill="currentColor" text-anchor="middle" font-weight="bold">Spectral Theorem: A = PDP ᵀ  (A symmetric)</text>
  <!-- A -->
  <rect x="10" y="35" width="55" height="55" rx="4" fill="none" stroke="currentColor" stroke-width="1.3" opacity="0.5"/>
  <text x="37" y="67" font-size="13" fill="currentColor" text-anchor="middle" font-weight="bold">A</text>
  <text x="37" y="105" font-size="10" fill="currentColor" text-anchor="middle">symmetric</text>
  <!-- = -->
  <text x="75" y="67" font-size="16" fill="currentColor">=</text>
  <!-- P (orthogonal) -->
  <rect x="90" y="35" width="55" height="55" rx="4" fill="#3b82f6" fill-opacity="0.15" stroke="#3b82f6" stroke-width="1.5"/>
  <text x="117" y="67" font-size="13" fill="#3b82f6" text-anchor="middle" font-weight="bold">P</text>
  <text x="117" y="105" font-size="10" fill="#3b82f6" text-anchor="middle">orthogonal</text>
  <text x="117" y="116" font-size="9" fill="#3b82f6" text-anchor="middle">Pᵀ=P⁻¹</text>
  <!-- D (diagonal, eigenvalues) -->
  <rect x="155" y="35" width="55" height="55" rx="4" fill="#ef4444" fill-opacity="0.15" stroke="#ef4444" stroke-width="1.5"/>
  <text x="182" y="57" font-size="11" fill="#ef4444" text-anchor="middle">λ₁</text>
  <text x="182" y="73" font-size="11" fill="#ef4444" text-anchor="middle">  λ₂</text>
  <text x="182" y="89" font-size="11" fill="#ef4444" text-anchor="middle">    ⋱</text>
  <text x="182" y="105" font-size="10" fill="#ef4444" text-anchor="middle">diagonal D</text>
  <text x="182" y="116" font-size="9" fill="#ef4444" text-anchor="middle">real eigenvalues</text>
  <!-- Pᵀ -->
  <rect x="220" y="35" width="55" height="55" rx="4" fill="#3b82f6" fill-opacity="0.15" stroke="#3b82f6" stroke-width="1.5"/>
  <text x="247" y="67" font-size="13" fill="#3b82f6" text-anchor="middle" font-weight="bold">Pᵀ</text>
  <text x="247" y="105" font-size="10" fill="#3b82f6" text-anchor="middle">= P⁻¹</text>
  <!-- Right: eigenvectors note -->
  <text x="290" y="50" font-size="11" fill="currentColor">Cols of P:</text>
  <text x="290" y="65" font-size="11" fill="currentColor">orthonormal</text>
  <text x="290" y="80" font-size="11" fill="currentColor">eigenvectors</text>
  <text x="290" y="95" font-size="11" fill="currentColor">q₁, …, qₙ</text>
  <text x="200" y="148" font-size="10" fill="currentColor" text-anchor="middle" opacity="0.7">A = λ₁q₁q₁ᵀ + λ₂q₂q₂ᵀ + … + λₙqₙqₙᵀ  (spectral decomposition)</text>
</svg>

## 10.3 Quadratic Forms

<div class="definition">

<strong>Definition (Quadratic Form).</strong> A quadratic form on \(\mathbb{R}^n\) with corresponding symmetric matrix \(A\) is defined by \(Q(\vec{x}) = \vec{x}^T A \vec{x}\) for any \(\vec{x} \in \mathbb{R}^n\).

</div>

Every quadratic form can be represented by a unique symmetric matrix. The off-diagonal entry \(a_{ij}\) is half the coefficient of the cross-term \(x_i x_j\).

<div class="definition">

<strong>Definition (Classification of Quadratic Forms).</strong> A quadratic form \(Q(\vec{x})\) is:
1. Positive definite if \(Q(\vec{x}) > 0\) for all \(\vec{x} \neq \vec{0}\).
2. Negative definite if \(Q(\vec{x}) < 0\) for all \(\vec{x} \neq \vec{0}\).
3. Indefinite if \(Q(\vec{x}) > 0\) for some \(\vec{x}\) and \(Q(\vec{x}) < 0\) for some \(\vec{x}\).
4. Positive semidefinite if \(Q(\vec{x}) \geq 0\) for all \(\vec{x}\) and \(Q(\vec{x}) = 0\) for some \(\vec{x} \neq \vec{0}\).
5. Negative semidefinite if \(Q(\vec{x}) \leq 0\) for all \(\vec{x}\) and \(Q(\vec{x}) = 0\) for some \(\vec{x} \neq \vec{0}\).

</div>

<div class="theorem">

<strong>Theorem 10.3.1.</strong> Let \(A\) be the symmetric matrix of \(Q(\vec{x}) = \vec{x}^T A \vec{x}\). If \(P\) orthogonally diagonalizes \(A\), then \(Q(\vec{x}) = \lambda_1 y_1^2 + \cdots + \lambda_n y_n^2\) where \(\vec{y} = P^T \vec{x}\) and \(\lambda_1, \ldots, \lambda_n\) are the eigenvalues of \(A\).

</div>

<div class="theorem">

<strong>Theorem 10.3.2 (Eigenvalue Test for Definiteness).</strong> Let \(A\) be a symmetric matrix. Then \(Q(\vec{x}) = \vec{x}^T A \vec{x}\) is:
1. Positive definite iff all eigenvalues of \(A\) are positive.
2. Negative definite iff all eigenvalues are negative.
3. Indefinite iff some eigenvalues are positive and some are negative.
4. Positive semidefinite iff eigenvalues are non-negative with at least one zero.
5. Negative semidefinite iff eigenvalues are non-positive with at least one zero.

</div>

## 10.4 Graphing Quadratic Forms

<div class="theorem">

<strong>Theorem 10.4.1.</strong> Let \(Q(\vec{x}) = ax_1^2 + bx_1 x_2 + cx_2^2\). There exists an orthogonal matrix \(P\) corresponding to a rotation such that the change of variables \(\vec{y} = P^T \vec{x}\) brings \(Q\) into diagonal form \(\lambda_1 y_1^2 + \lambda_2 y_2^2\).

</div>

The eigenvectors of the corresponding symmetric matrix are called the principal axes of the quadratic form. The level curve \(Q(\vec{x}) = k\) can be an ellipse, hyperbola, pair of lines, or a point depending on the signs of \(\lambda_1, \lambda_2\) and \(k\).

<svg viewBox="0 0 380 200" xmlns="http://www.w3.org/2000/svg" style="max-width:380px;display:block;margin:1.5em auto">
  <defs>
    <marker id="qfArr" markerWidth="7" markerHeight="7" refX="5" refY="3" orient="auto">
      <path d="M0,0 L0,6 L7,3 z" fill="currentColor"/>
    </marker>
  </defs>
  <!-- Left panel: ellipse (both eigenvalues same sign) -->
  <text x="95" y="16" font-size="11" fill="currentColor" text-anchor="middle" font-weight="bold">Ellipse: λ₁,λ₂ &gt; 0</text>
  <line x1="15" y1="100" x2="185" y2="100" stroke="currentColor" stroke-width="1" opacity="0.4" marker-end="url(#qfArr)"/>
  <line x1="95" y1="175" x2="95" y2="25" stroke="currentColor" stroke-width="1" opacity="0.4" marker-end="url(#qfArr)"/>
  <ellipse cx="95" cy="100" rx="60" ry="35" fill="none" stroke="#3b82f6" stroke-width="2"/>
  <text x="158" y="97" font-size="10" fill="#3b82f6">y₁</text>
  <text x="98" y="22" font-size="10" fill="#3b82f6">y₂</text>
  <text x="95" y="192" font-size="10" fill="currentColor" text-anchor="middle" opacity="0.7">λ₁y₁² + λ₂y₂² = 1</text>
  <!-- Right panel: hyperbola (opposite sign eigenvalues) -->
  <text x="285" y="16" font-size="11" fill="currentColor" text-anchor="middle" font-weight="bold">Hyperbola: λ₁&gt;0, λ₂&lt;0</text>
  <line x1="205" y1="100" x2="375" y2="100" stroke="currentColor" stroke-width="1" opacity="0.4" marker-end="url(#qfArr)"/>
  <line x1="285" y1="175" x2="285" y2="25" stroke="currentColor" stroke-width="1" opacity="0.4" marker-end="url(#qfArr)"/>
  <!-- Hyperbola branches -->
  <path d="M245,25 Q285,65 325,25" fill="none" stroke="#ef4444" stroke-width="2"/>
  <path d="M245,175 Q285,135 325,175" fill="none" stroke="#ef4444" stroke-width="2"/>
  <!-- Asymptote lines -->
  <line x1="215" y1="170" x2="355" y2="30" stroke="currentColor" stroke-width="1" stroke-dasharray="4,3" opacity="0.3"/>
  <line x1="215" y1="30" x2="355" y2="170" stroke="currentColor" stroke-width="1" stroke-dasharray="4,3" opacity="0.3"/>
  <text x="348" y="97" font-size="10" fill="#ef4444">y₁</text>
  <text x="288" y="22" font-size="10" fill="#ef4444">y₂</text>
  <text x="285" y="192" font-size="10" fill="currentColor" text-anchor="middle" opacity="0.7">λ₁y₁² − |λ₂|y₂² = 1</text>
</svg>

## 10.5 Optimizing Quadratic Forms

<div class="theorem">

<strong>Theorem 10.5.1.</strong> Let \(Q(\vec{x})\) be a quadratic form with corresponding symmetric matrix \(A\). The maximum value of \(Q(\vec{x})\) subject to \(\|\vec{x}\| = 1\) is the greatest eigenvalue of \(A\), and the minimum is the least eigenvalue. These values are attained at the corresponding unit eigenvectors.

</div>

## 10.6 Singular Value Decomposition

The SVD extends diagonalization-like ideas to arbitrary \(m \times n\) matrices. We maximize \(\|A\vec{x}\|\) subject to \(\|\vec{x}\| = 1\) by examining the eigenvalues of \(A^T A\).

<div class="theorem">

<strong>Theorem 10.6.1.</strong> Let \(A\) be an \(m \times n\) matrix and let \(\lambda_1, \ldots, \lambda_n\) be the eigenvalues of \(A^T A\) with corresponding unit eigenvectors \(\vec{v}_1, \ldots, \vec{v}_n\). Then \(\lambda_1, \ldots, \lambda_n\) are all non-negative, and \(\|A\vec{v}_i\| = \sqrt{\lambda_i}\).

</div>

<div class="definition">

<strong>Definition (Singular Values).</strong> The singular values \(\sigma_1, \ldots, \sigma_n\) of an \(m \times n\) matrix \(A\) are the square roots of the eigenvalues of \(A^T A\) arranged so that \(\sigma_1 \geq \sigma_2 \geq \cdots \geq \sigma_n \geq 0\).

</div>

<div class="theorem">

<strong>Theorem 10.6.2.</strong> Let \(A\) be an \(m \times n\) matrix. Then \(\text{rank}(A^T A) = \text{rank}(A)\).

</div>

<div class="corollary">

<strong>Corollary 10.6.3.</strong> If \(A\) is \(m \times n\) with \(\text{rank}(A) = r\), then \(A\) has exactly \(r\) non-zero singular values.

</div>

<div class="definition">

<strong>Definition (Singular Vectors).</strong> Let \(A\) be \(m \times n\). If \(\vec{v} \in \mathbb{R}^n\) and \(\vec{u} \in \mathbb{R}^m\) are unit vectors and \(\sigma \neq 0\) is a singular value with \(A\vec{v} = \sigma \vec{u}\) and \(A^T \vec{u} = \sigma \vec{v}\), then \(\vec{u}\) is a left singular vector and \(\vec{v}\) is a right singular vector. Additionally, unit vectors in \(\text{Null}(A)\) are right singular vectors and unit vectors in \(\text{Null}(A^T)\) are left singular vectors.

</div>

<div class="theorem">

<strong>Theorem 10.6.4.</strong> If \(\vec{v}\) is a right singular vector of \(A\), then \(\vec{v}\) is an eigenvector of \(A^T A\). If \(\vec{u}\) is a left singular vector of \(A\), then \(\vec{u}\) is an eigenvector of \(AA^T\).

</div>

<div class="lemma">

<strong>Lemma 10.6.5.</strong> Let \(A\) be \(m \times n\) with rank \(r\), and let \(\{\vec{v}_1, \ldots, \vec{v}_n\}\) be an orthonormal basis of eigenvectors of \(A^T A\) with eigenvalues \(\lambda_1 \geq \cdots \geq \lambda_n\). Then \(\left\{\frac{A\vec{v}_1}{\sigma_1}, \ldots, \frac{A\vec{v}_r}{\sigma_r}\right\}\) is an orthonormal basis for \(\text{Col}(A)\).

</div>

<div class="theorem">

<strong>Theorem 10.6.6.</strong> Let \(A\) be \(m \times n\) with rank \(r\). There exists an orthonormal basis \(\{\vec{v}_1, \ldots, \vec{v}_n\}\) of \(\mathbb{R}^n\) of right singular vectors and an orthonormal basis \(\{\vec{u}_1, \ldots, \vec{u}_m\}\) of \(\mathbb{R}^m\) of left singular vectors.

</div>

<div class="definition">

<strong>Definition (Singular Value Decomposition).</strong> A singular value decomposition of an \(m \times n\) matrix \(A\) is a factorization \(A = U \Sigma V^T\), where \(U\) is an \(m \times m\) orthogonal matrix of left singular vectors, \(V\) is an \(n \times n\) orthogonal matrix of right singular vectors, and \(\Sigma\) is the \(m \times n\) matrix with \((\Sigma)_{ii} = \sigma_i\) for \(1 \leq i \leq r\) and all other entries zero.

</div>

The algorithm: (1) find eigenvalues and orthonormal eigenvectors of \(A^T A\); (2) form \(V\) and \(\Sigma\); (3) compute \(\vec{u}_i = \frac{1}{\sigma_i} A \vec{v}_i\) for \(1 \leq i \leq r\) and extend to an orthonormal basis for \(\mathbb{R}^m\) to get \(U\).

<svg viewBox="0 0 420 160" xmlns="http://www.w3.org/2000/svg" style="max-width:420px;display:block;margin:1.5em auto">
  <!-- Title -->
  <text x="210" y="16" font-size="12" fill="currentColor" text-anchor="middle" font-weight="bold">SVD: A = U Σ Vᵀ  (dimensions labeled)</text>
  <!-- A block -->
  <rect x="10" y="30" width="60" height="80" rx="4" fill="#3b82f6" fill-opacity="0.15" stroke="#3b82f6" stroke-width="1.5"/>
  <text x="40" y="74" font-size="14" fill="#3b82f6" text-anchor="middle" font-weight="bold">A</text>
  <text x="40" y="122" font-size="10" fill="currentColor" text-anchor="middle">m × n</text>
  <!-- = -->
  <text x="80" y="76" font-size="18" fill="currentColor" text-anchor="middle">=</text>
  <!-- U block (m×m) -->
  <rect x="94" y="30" width="80" height="80" rx="4" fill="#22c55e" fill-opacity="0.15" stroke="#22c55e" stroke-width="1.5"/>
  <text x="134" y="74" font-size="14" fill="#22c55e" text-anchor="middle" font-weight="bold">U</text>
  <text x="134" y="122" font-size="10" fill="currentColor" text-anchor="middle">m × m</text>
  <text x="134" y="134" font-size="9" fill="#22c55e" text-anchor="middle">left sing. vecs</text>
  <!-- Sigma block (m×n) -->
  <rect x="184" y="30" width="60" height="80" rx="4" fill="#ef4444" fill-opacity="0.15" stroke="#ef4444" stroke-width="1.5"/>
  <text x="214" y="68" font-size="13" fill="#ef4444" text-anchor="middle" font-weight="bold">Σ</text>
  <!-- Diagonal dots in sigma -->
  <circle cx="196" cy="42" r="3" fill="#ef4444" opacity="0.6"/>
  <circle cx="207" cy="53" r="3" fill="#ef4444" opacity="0.6"/>
  <circle cx="218" cy="64" r="3" fill="#ef4444" opacity="0.6"/>
  <text x="214" y="122" font-size="10" fill="currentColor" text-anchor="middle">m × n</text>
  <text x="214" y="134" font-size="9" fill="#ef4444" text-anchor="middle">σ₁≥…≥σᵣ>0</text>
  <!-- VT block (n×n) -->
  <rect x="254" y="30" width="60" height="60" rx="4" fill="#3b82f6" fill-opacity="0.15" stroke="#3b82f6" stroke-width="1.5"/>
  <text x="284" y="64" font-size="14" fill="#3b82f6" text-anchor="middle" font-weight="bold">Vᵀ</text>
  <text x="284" y="105" font-size="10" fill="currentColor" text-anchor="middle">n × n</text>
  <text x="284" y="117" font-size="9" fill="#3b82f6" text-anchor="middle">right sing. vecs</text>
  <!-- Braces / size annotations -->
  <line x1="94" y1="25" x2="174" y2="25" stroke="#22c55e" stroke-width="1" opacity="0.5"/>
  <text x="134" y="22" font-size="9" fill="#22c55e" text-anchor="middle">m cols</text>
  <!-- Summary -->
  <text x="340" y="60" font-size="11" fill="currentColor">U: orthogonal</text>
  <text x="340" y="76" font-size="11" fill="currentColor">V: orthogonal</text>
  <text x="340" y="92" font-size="11" fill="currentColor">Σ: diagonal</text>
  <text x="340" y="108" font-size="11" fill="currentColor">(non-neg. diag)</text>
</svg>

---

# Chapter 11: Complex Vector Spaces

This chapter extends all results to complex vector spaces: complex diagonalization, Hermitian inner products, unitary matrices, the Spectral Theorem for normal matrices, and the Cayley-Hamilton Theorem.

## 11.1 Complex Number Review

<div class="definition">

<strong>Definition (Absolute Value).</strong> The absolute value (modulus) of \(z = a + bi\) is \(|z| = \sqrt{a^2 + b^2}\).

</div>

<div class="theorem">

<strong>Theorem 11.1.1.</strong> Let \(w, z \in \mathbb{C}\). Then: (1) \(|z|\) is a non-negative real number; (2) \(|z| = 0\) iff \(z = 0\); (3) \(|w + z| \leq |w| + |z|\).

</div>

<div class="theorem">

<strong>Theorem 11.1.2.</strong> For \(z_1, z_2, z_3 \in \mathbb{C}\): (1) commutativity of addition and multiplication; (2) associativity; (3) distributivity; (4) \(|z_1 z_2| = |z_1||z_2|\).

</div>

<div class="definition">

<strong>Definition (Complex Conjugate).</strong> If \(z = a + bi\), then the complex conjugate is \(\bar{z} = a - bi\).

</div>

<div class="theorem">

<strong>Theorem 11.1.3.</strong> For \(w, z \in \mathbb{C}\) with \(z = a + bi\):
(1) \(\overline{\bar{z}} = z\);
(2) \(z\) is real iff \(\bar{z} = z\);
(3) \(z\) is imaginary iff \(\bar{z} = -z\);
(4) \(\overline{z \pm w} = \bar{z} \pm \bar{w}\);
(5) \(\overline{zw} = \bar{z}\bar{w}\);
(6) \(z + \bar{z} = 2a\);
(7) \(z - \bar{z} = 2bi\);
(8) \(z\bar{z} = a^2 + b^2 = |z|^2\).

</div>

## 11.2 Complex Vector Spaces

<div class="definition">

<strong>Definition (Complex Vector Space).</strong> A set \(V\) is a vector space over \(\mathbb{C}\) if it satisfies all ten vector space axioms (V1--V10), with scalars from \(\mathbb{C}\) instead of \(\mathbb{R}\).

</div>

<div class="theorem">

<strong>Theorem 11.2.1.</strong> If \(\vec{z} \in \mathbb{C}^n\), then there exist \(\vec{x}, \vec{y} \in \mathbb{R}^n\) such that \(\vec{z} = \vec{x} + i\vec{y}\).

</div>

<div class="definition">

<strong>Definition (Subspace over \(\mathbb{C}\)).</strong> If \(S\) is a subset of a complex vector space \(V\) and \(S\) is itself a complex vector space under the same operations, then \(S\) is a subspace of \(V\).

</div>

All concepts (linear independence, spanning, bases, dimension, coordinates, linear mappings, matrices of linear mappings, determinants, invertibility) carry over from the real case, with complex scalars.

<div class="definition">

<strong>Definition (Complex Conjugate of Vectors and Matrices).</strong> For \(\vec{z} \in \mathbb{C}^n\), \(\bar{\vec{z}}\) is obtained by conjugating each entry. For \(A \in M_{m \times n}(\mathbb{C})\), \(\bar{A}\) is obtained by conjugating each entry.

</div>

<div class="theorem">

<strong>Theorem 11.2.2.</strong> For \(A \in M_{m \times n}(\mathbb{C})\) and \(\vec{z} \in \mathbb{C}^n\), \(\overline{A\vec{z}} = \bar{A}\bar{\vec{z}}\).

</div>

## 11.3 Complex Diagonalization

<div class="definition">

<strong>Definition (Eigenvalue, Eigenvector over \(\mathbb{C}\)).</strong> Let \(A \in M_{n \times n}(\mathbb{C})\). If there exists \(\lambda \in \mathbb{C}\) and \(\vec{z} \in \mathbb{C}^n\), \(\vec{z} \neq \vec{0}\), such that \(A\vec{z} = \lambda \vec{z}\), then \(\lambda\) is an eigenvalue and \(\vec{z}\) is an eigenvector.

</div>

All theory of similar matrices, eigenvalues, eigenvectors, and diagonalization from MATH 136 applies with complex eigenvalues and eigenvectors allowed.

<div class="theorem">

<strong>Theorem 11.3.1.</strong> Let \(A \in M_{n \times n}(\mathbb{R})\). If \(\lambda\) is a non-real eigenvalue of \(A\) with eigenvector \(\vec{z}\), then \(\bar{\lambda}\) is also an eigenvalue of \(A\) with eigenvector \(\bar{\vec{z}}\).

</div>

<div class="corollary">

<strong>Corollary 11.3.2.</strong> If \(A \in M_{n \times n}(\mathbb{R})\) with \(n\) odd, then \(A\) has at least one real eigenvalue.

</div>

## 11.4 Complex Inner Products

The standard dot product on \(\mathbb{C}^n\) does not yield a non-negative real number for \(\vec{z} \cdot \vec{z}\). Instead, we conjugate one argument.

<div class="definition">

<strong>Definition (Standard Inner Product on \(\mathbb{C}^n\)).</strong> For \(\vec{z}, \vec{w} \in \mathbb{C}^n\),
\[\langle \vec{z}, \vec{w} \rangle = \vec{z} \cdot \bar{\vec{w}} = z_1 \bar{w}_1 + \cdots + z_n \bar{w}_n\]

</div>

<div class="theorem">

<strong>Theorem 11.4.1.</strong> The standard inner product on \(\mathbb{C}^n\) satisfies:
(1) \(\langle \vec{z}, \vec{z} \rangle \in \mathbb{R}\) and \(\langle \vec{z}, \vec{z} \rangle \geq 0\), with equality iff \(\vec{z} = \vec{0}\);
(2) \(\langle \vec{z}, \vec{w} \rangle = \overline{\langle \vec{w}, \vec{z} \rangle}\) (conjugate symmetric);
(3) \(\langle \vec{v} + \vec{z}, \vec{w} \rangle = \langle \vec{v}, \vec{w} \rangle + \langle \vec{z}, \vec{w} \rangle\);
(4) \(\langle \alpha \vec{z}, \vec{w} \rangle = \alpha \langle \vec{z}, \vec{w} \rangle\).

</div>

<div class="definition">

<strong>Definition (Hermitian Inner Product).</strong> Let \(V\) be a complex vector space. A Hermitian inner product on \(V\) is a function \(\langle \cdot, \cdot \rangle : V \times V \to \mathbb{C}\) satisfying for all \(\vec{v}, \vec{w}, \vec{z} \in V\) and \(\alpha \in \mathbb{C}\):
(1) \(\langle \vec{z}, \vec{z} \rangle \in \mathbb{R}\), \(\langle \vec{z}, \vec{z} \rangle \geq 0\), with equality iff \(\vec{z} = \vec{0}\);
(2) \(\langle \vec{z}, \vec{w} \rangle = \overline{\langle \vec{w}, \vec{z} \rangle}\);
(3) \(\langle \vec{v} + \vec{z}, \vec{w} \rangle = \langle \vec{v}, \vec{w} \rangle + \langle \vec{z}, \vec{w} \rangle\);
(4) \(\langle \alpha \vec{z}, \vec{w} \rangle = \alpha \langle \vec{z}, \vec{w} \rangle\).

</div>

<div class="theorem">

<strong>Theorem 11.4.2.</strong> If \(\langle \cdot, \cdot \rangle\) is a Hermitian inner product, then \(\langle \vec{z}, \vec{v} + \vec{w} \rangle = \langle \vec{z}, \vec{v} \rangle + \langle \vec{z}, \vec{w} \rangle\) and \(\langle \vec{z}, \alpha \vec{w} \rangle = \bar{\alpha} \langle \vec{z}, \vec{w} \rangle\).

</div>

<div class="theorem">

<strong>Theorem 11.4.3.</strong> The function \(\langle A, B \rangle = \text{tr}(\bar{B}^T A)\) defines a Hermitian inner product on \(M_{m \times n}(\mathbb{C})\).

</div>

<div class="definition">

<strong>Definition (Length, Unit Vector in \(\mathbb{C}^n\)).</strong> \(\|\vec{z}\| = \sqrt{\langle \vec{z}, \vec{z} \rangle}\). A vector with \(\|\vec{z}\| = 1\) is a unit vector.

</div>

<div class="definition">

<strong>Definition (Orthogonality in \(\mathbb{C}^n\)).</strong> Vectors \(\vec{z}, \vec{w}\) are orthogonal if \(\langle \vec{z}, \vec{w} \rangle = 0\).

</div>

<div class="theorem">

<strong>Theorem 11.4.4.</strong> For any \(\vec{z}, \vec{w}\) in a Hermitian inner product space and \(\alpha \in \mathbb{C}\):
(1) \(\|\alpha \vec{z}\| = |\alpha| \|\vec{z}\|\);
(2) \(\|\vec{z} + \vec{w}\| \leq \|\vec{z}\| + \|\vec{w}\|\);
(3) \(\frac{1}{\|\vec{z}\|}\vec{z}\) is a unit vector.

</div>

<div class="definition">

<strong>Definition (Orthogonal, Orthonormal Sets in \(\mathbb{C}^n\)).</strong> A set \(S = \{\vec{z}_1, \ldots, \vec{z}_k\}\) is orthogonal if \(\langle \vec{z}_\ell, \vec{z}_j \rangle = 0\) for all \(\ell \neq j\). It is orthonormal if additionally \(\|\vec{z}_j\| = 1\) for all \(j\).

</div>

<div class="theorem">

<strong>Theorem 11.4.5 (Pythagorean Theorem).</strong> If \(\{\vec{z}_1, \ldots, \vec{z}_k\}\) is orthogonal, then \(\|\vec{z}_1 + \cdots + \vec{z}_k\|^2 = \|\vec{z}_1\|^2 + \cdots + \|\vec{z}_k\|^2\).

</div>

<div class="theorem">

<strong>Theorem 11.4.6.</strong> An orthogonal set of non-zero vectors in a Hermitian inner product space is linearly independent.

</div>

The Gram-Schmidt procedure works for Hermitian inner products as well.

<div class="definition">

<strong>Definition (Unitary Matrix).</strong> A matrix \(U \in M_{n \times n}(\mathbb{C})\) whose columns form an orthonormal basis for \(\mathbb{C}^n\) is called unitary.

</div>

<div class="theorem">

<strong>Theorem 11.4.7.</strong> For \(U \in M_{n \times n}(\mathbb{C})\), the following are equivalent:
(1) the columns of \(U\) form an orthonormal basis for \(\mathbb{C}^n\);
(2) \(\bar{U}^T = U^{-1}\);
(3) the rows of \(U\) form an orthonormal basis for \(\mathbb{C}^n\).

</div>

<div class="theorem">

<strong>Theorem 11.4.8.</strong> If \(U\) and \(W\) are unitary, then \(UW\) is unitary.

</div>

<div class="definition">

<strong>Definition (Conjugate Transpose).</strong> For \(A \in M_{m \times n}(\mathbb{C})\), the conjugate transpose is \(A^* = \bar{A}^T\).

</div>

<div class="theorem">

<strong>Theorem 11.4.9.</strong> For \(A, B \in M_{m \times n}(\mathbb{C})\) and \(\alpha \in \mathbb{C}\):
(1) \(\langle A\vec{z}, \vec{w} \rangle = \langle \vec{z}, A^* \vec{w} \rangle\);
(2) \((A^*)^* = A\);
(3) \((A + B)^* = A^* + B^*\);
(4) \((\alpha A)^* = \bar{\alpha} A^*\);
(5) \((AB)^* = B^* A^*\).

</div>

<div class="lemma">

<strong>Lemma 11.4.10 (Proof of Lemma 10.2.2).</strong> If \(A\) is a symmetric matrix with real entries, then all eigenvalues are real.

</div>

The proof uses the Hermitian inner product: if \(A\vec{z} = \lambda \vec{z}\) with \(\|\vec{z}\| = 1\), then \(\lambda = \langle A\vec{z}, \vec{z} \rangle = \langle \vec{z}, A\vec{z} \rangle = \bar{\lambda}\), so \(\lambda\) is real.

## 11.5 Unitary Diagonalization

<div class="definition">

<strong>Definition (Hermitian Matrix).</strong> A matrix \(A \in M_{n \times n}(\mathbb{C})\) such that \(A^* = A\) is called Hermitian.

</div>

Every real symmetric matrix is Hermitian. A Hermitian matrix has real diagonal entries, and the \((\ell, j)\)-entry equals the conjugate of the \((j, \ell)\)-entry.

<div class="theorem">

<strong>Theorem 11.5.1.</strong> An \(n \times n\) matrix is Hermitian if and only if \(\langle A\vec{z}, \vec{w} \rangle = \langle \vec{z}, A\vec{w} \rangle\) for all \(\vec{z}, \vec{w} \in \mathbb{C}^n\).

</div>

<div class="theorem">

<strong>Theorem 11.5.2.</strong> If \(A\) is Hermitian, then:
(1) all eigenvalues of \(A\) are real;
(2) eigenvectors corresponding to distinct eigenvalues are orthogonal.

</div>

<div class="definition">

<strong>Definition (Unitarily Similar).</strong> Matrices \(A\) and \(B\) are unitarily similar if \(U^* A U = B\) for some unitary \(U\).

</div>

<div class="definition">

<strong>Definition (Unitarily Diagonalizable).</strong> An \(n \times n\) matrix \(A\) is unitarily diagonalizable if it is unitarily similar to a diagonal matrix.

</div>

<div class="theorem">

<strong>Theorem 11.5.3 (Schur's Theorem).</strong> If \(A\) is an \(n \times n\) matrix, then \(A\) is unitarily similar to an upper triangular matrix whose diagonal entries are the eigenvalues of \(A\).

</div>

<div class="theorem">

<strong>Theorem 11.5.4 (Spectral Theorem for Hermitian Matrices).</strong> If \(A\) is Hermitian, then \(A\) is unitarily diagonalizable.

</div>

The proof follows from Schur's Theorem: \(U^* AU = T\) upper triangular, but \(A^* = A\) forces \(T^* = T\), so \(T\) is diagonal.

<div class="definition">

<strong>Definition (Normal Matrix).</strong> An \(n \times n\) matrix \(A\) is called normal if \(AA^* = A^*A\).

</div>

Hermitian, skew-Hermitian, unitary, and real orthogonal matrices are all normal.

<div class="theorem">

<strong>Theorem 11.5.5 (Spectral Theorem for Normal Matrices).</strong> A matrix \(A\) is unitarily diagonalizable if and only if \(A\) is normal.

</div>

<div class="theorem">

<strong>Theorem 11.5.6.</strong> If \(A\) is normal, then:
(1) \(\|A\vec{z}\| = \|A^* \vec{z}\|\) for all \(\vec{z} \in \mathbb{C}^n\);
(2) \(A - \lambda I\) is normal for every \(\lambda \in \mathbb{C}\);
(3) if \(A\vec{z} = \lambda \vec{z}\), then \(A^* \vec{z} = \bar{\lambda} \vec{z}\).

</div>

## 11.6 Cayley-Hamilton Theorem

<div class="theorem">

<strong>Theorem 11.6.1 (Cayley-Hamilton Theorem).</strong> If \(A \in M_{n \times n}(\mathbb{C})\), then \(A\) is a root of its characteristic polynomial \(C(\lambda)\). That is, if \(C(\lambda) = c_n \lambda^n + \cdots + c_1 \lambda + c_0\), then
\[C(A) = c_n A^n + c_{n-1} A^{n-1} + \cdots + c_1 A + c_0 I = O\]

</div>

The proof uses Schur's Theorem: write \(U^* AU = T\) upper triangular with eigenvalues \(\lambda_1, \ldots, \lambda_n\) on the diagonal. Then \(C(T) = (-1)^n(T - \lambda_1 I)(T - \lambda_2 I) \cdots (T - \lambda_n I)\), and one shows by examining columns that this product is the zero matrix. Since \(C(T) = U^* C(A) U\), we conclude \(C(A) = O\).
