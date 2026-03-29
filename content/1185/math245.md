---
title: "MATH 245: Linear Algebra 2 for Honours Mathematics"
subjects: "MATH"
---

These notes cover MATH 245, the honours version of MATH 235 at the University of Waterloo. The course takes the machinery of linear algebra — subspaces, maps, diagonalization — and rebuilds it properly from the ground up over arbitrary fields, with full proofs and the deeper structural results: the Spectral Theorem for normal operators, the Singular Value Decomposition, Jordan Normal Form, and an introduction to bilinear forms and tensor products. The philosophy throughout is that the right level of abstraction reveals why theorems are true, not just that they are.

---

# Chapter 1: Review of Fundamental Subspaces

Every matrix carries four canonical subspaces that together describe everything a linear map can do: where it sends vectors, what it annihilates, and the complementary directions in domain and codomain. Understanding these subspaces — their dimensions, their mutual orthogonality — is the foundation on which all of spectral theory and the SVD rest.

## 1.1 The Four Fundamental Subspaces

<div class="definition">

<strong>Definition 1.1 (Fundamental Subspaces).</strong> Let \(A\) be an \(m \times n\) matrix over \(\mathbb{R}\). The four fundamental subspaces are:
1. The <em>column space</em> (range): \(\operatorname{Col}(A) = \{A\mathbf{x} \mid \mathbf{x} \in \mathbb{R}^n\} \subseteq \mathbb{R}^m\).
2. The <em>row space</em>: \(\operatorname{Row}(A) = \operatorname{Col}(A^T) \subseteq \mathbb{R}^n\).
3. The <em>null space</em> (kernel): \(\operatorname{Null}(A) = \{\mathbf{x} \in \mathbb{R}^n \mid A\mathbf{x} = \mathbf{0}\}\).
4. The <em>left null space</em>: \(\operatorname{Null}(A^T) = \{\mathbf{x} \in \mathbb{R}^m \mid A^T \mathbf{x} = \mathbf{0}\}\).

</div>

The rank of \(A\) equals \(\dim \operatorname{Col}(A) = \dim \operatorname{Row}(A)\); that row rank equals column rank is itself a non-trivial theorem. To see why it is non-trivial: row operations do not obviously preserve column space, yet the rank measured by row reduction gives a consistent answer in both. The proof goes via the observation that elementary row operations are invertible and hence preserve the null space, which by rank-nullity pins down the column rank.

Using the standard dot product on \(\mathbb{R}^n\):

<div class="theorem">

<strong>Theorem 1.2 (Fundamental Theorem of Linear Algebra).</strong> Let \(A\) be \(m \times n\) with \(\operatorname{rank}(A) = r\). Then:
\[\mathbb{R}^n = \operatorname{Row}(A) \oplus \operatorname{Null}(A), \qquad \mathbb{R}^m = \operatorname{Col}(A) \oplus \operatorname{Null}(A^T)\]
with \(\dim \operatorname{Row}(A) = \dim \operatorname{Col}(A) = r\), \(\dim \operatorname{Null}(A) = n - r\), and \(\dim \operatorname{Null}(A^T) = m - r\).

</div>

Geometrically: \(A\) maps \(\operatorname{Row}(A)\) isomorphically onto \(\operatorname{Col}(A)\), and annihilates \(\operatorname{Null}(A)\) entirely.

## 1.2 Rank-Nullity in Abstract Settings

The dimension count above generalizes immediately to abstract linear maps.

<div class="theorem">

<strong>Theorem 1.3 (Rank-Nullity Theorem).</strong> Let \(V\) be a finite-dimensional vector space and \(T : V \to W\) a linear map. Then
\[\dim \operatorname{Range}(T) + \dim \ker(T) = \dim V.\]

</div>

*Proof.* Let \(\{\mathbf{u}_1, \ldots, \mathbf{u}_k\}\) be a basis for \(\ker(T)\); extend it to a basis \(\{\mathbf{u}_1, \ldots, \mathbf{u}_k, \mathbf{v}_1, \ldots, \mathbf{v}_r\}\) of \(V\). We claim \(\{T\mathbf{v}_1, \ldots, T\mathbf{v}_r\}\) is a basis for \(\operatorname{Range}(T)\). Spanning: any \(T\mathbf{x}\) with \(\mathbf{x} = \sum a_i \mathbf{u}_i + \sum b_j \mathbf{v}_j\) gives \(T\mathbf{x} = \sum b_j T\mathbf{v}_j\). Independence: if \(\sum b_j T\mathbf{v}_j = 0\) then \(T(\sum b_j \mathbf{v}_j) = 0\), so \(\sum b_j \mathbf{v}_j \in \ker T\), which forces all \(b_j = 0\). Thus \(\dim \operatorname{Range}(T) = r\) and \(\dim \ker T = k\), giving \(r + k = \dim V\). \(\square\)

Notice that this proof is purely abstract — it never uses a matrix or coordinates. The rank-nullity theorem is a statement about the structure of any linear map.

---

# Chapter 2: Linear Maps on Abstract Vector Spaces

Moving from \(\mathbb{R}^n\) to an arbitrary vector space \(V\) forces us to think about linear maps intrinsically — without coordinates. The payoff is that the theory becomes cleaner and applies uniformly to spaces of polynomials, matrices, and functions.

## 2.1 Homomorphisms and Isomorphisms

<div class="definition">

<strong>Definition 2.1 (Linear Map).</strong> Let \(V\) and \(W\) be vector spaces over a field \(\mathbb{F}\). A map \(T : V \to W\) is <em>linear</em> if \(T(s\mathbf{u} + t\mathbf{v}) = sT(\mathbf{u}) + tT(\mathbf{v})\) for all \(\mathbf{u}, \mathbf{v} \in V\) and \(s, t \in \mathbb{F}\). A linear map is also called a <em>homomorphism</em> of vector spaces; the set of all such maps is denoted \(\mathcal{L}(V, W)\).

</div>

<div class="definition">

<strong>Definition 2.2 (Isomorphism).</strong> A linear map \(T : V \to W\) that is bijective (one-to-one and onto) is called an <em>isomorphism</em>. We say \(V\) and \(W\) are <em>isomorphic</em> and write \(V \cong W\).

</div>

The key structural fact is that dimension completely classifies finite-dimensional vector spaces up to isomorphism:

<div class="theorem">

<strong>Theorem 2.3.</strong> Two finite-dimensional vector spaces over \(\mathbb{F}\) are isomorphic if and only if they have the same dimension. In particular, every \(n\)-dimensional space over \(\mathbb{F}\) is isomorphic to \(\mathbb{F}^n\).

</div>

*Proof.* If \(\dim V = \dim W = n\), choose bases \(B = \{\mathbf{v}_1, \ldots, \mathbf{v}_n\}\) for \(V\) and \(C = \{\mathbf{w}_1, \ldots, \mathbf{w}_n\}\) for \(W\), and define \(T\mathbf{v}_i = \mathbf{w}_i\) extended linearly. This is an isomorphism. Conversely, an isomorphism maps a basis to a basis, preserving dimension. \(\square\)

## 2.2 The Isomorphism Theorems

The first isomorphism theorem gives a canonical decomposition: every linear map factors through its kernel.

<div class="theorem">

<strong>Theorem 2.4 (First Isomorphism Theorem).</strong> Let \(T : V \to W\) be a linear map. The induced map \(\tilde{T} : V/\ker T \to \operatorname{Range}(T)\) defined by \(\tilde{T}(\mathbf{v} + \ker T) = T\mathbf{v}\) is an isomorphism. In particular,
\[V / \ker T \cong \operatorname{Range}(T).\]

</div>

*Proof.* \(\tilde{T}\) is well-defined since \(T\) is constant on cosets. It is linear, injective (if \(\tilde{T}(\mathbf{v} + \ker T) = 0\) then \(T\mathbf{v} = 0\) so \(\mathbf{v} \in \ker T\)), and surjective by definition of range. \(\square\)

<div class="corollary">

<strong>Corollary 2.5.</strong> If \(V\) is finite-dimensional and \(T : V \to W\) is linear, then \(\dim(\operatorname{Range} T) = \dim V - \dim \ker T\). (This recovers Theorem 1.3.)

</div>

## 2.3 Matrix Representations

A choice of bases converts an abstract linear map into a concrete matrix. Let \(B = \{\mathbf{v}_1, \ldots, \mathbf{v}_n\}\) be a basis for \(V\) and \(C = \{\mathbf{w}_1, \ldots, \mathbf{w}_m\}\) a basis for \(W\).

<div class="definition">

<strong>Definition 2.6 (Matrix of a Linear Map).</strong> The matrix of \(T : V \to W\) with respect to bases \(B\) and \(C\) is the \(m \times n\) matrix
\[{}_C[T]_B = \begin{bmatrix} [T\mathbf{v}_1]_C & \cdots & [T\mathbf{v}_n]_C \end{bmatrix},\]
characterized by \([T\mathbf{v}]_C = {}_C[T]_B \, [\mathbf{v}]_B\) for all \(\mathbf{v} \in V\).

</div>

Two matrices represent the same linear operator \(T : V \to V\) in different bases if and only if they are similar: \([T]_{B'} = P^{-1} [T]_B P\) where \(P\) is the change-of-basis matrix. The diagonalization problem is exactly the problem of finding a basis in which the matrix is as simple as possible — ideally, diagonal.

<div class="theorem">

<strong>Theorem 2.7 (Change of Basis).</strong> Let \(T : V \to V\) be a linear operator and \(B, B'\) two bases for \(V\). If \(P = [I]_{B}^{B'}\) is the change-of-basis matrix from \(B'\) to \(B\), then \([T]_{B'} = P^{-1}[T]_B P\).

</div>

---

# Chapter 3: Inner Product Spaces

The notion of angle and length requires extra structure beyond what a vector space provides on its own. An inner product installs exactly this geometry, and the theory that follows — orthogonality, projections, adjoints — is the engine behind the spectral theorems of Chapter 4.

## 3.1 Abstract Inner Products

<div class="definition">

<strong>Definition 3.1 (Inner Product Space).</strong> Let \(V\) be a vector space over \(\mathbb{F} \in \{\mathbb{R}, \mathbb{C}\}\). An <em>inner product</em> on \(V\) is a function \(\langle \cdot, \cdot \rangle : V \times V \to \mathbb{F}\) satisfying:
<ol>
  <li><strong>Positive definiteness:</strong> \(\langle \mathbf{v}, \mathbf{v} \rangle \geq 0\) for all \(\mathbf{v}\), with equality iff \(\mathbf{v} = \mathbf{0}\).</li>
  <li><strong>Conjugate symmetry:</strong> \(\langle \mathbf{u}, \mathbf{v} \rangle = \overline{\langle \mathbf{v}, \mathbf{u} \rangle}\). (For \(\mathbb{F} = \mathbb{R}\) this is just symmetry.)</li>
  <li><strong>Linearity in the first argument:</strong> \(\langle s\mathbf{u} + t\mathbf{w}, \mathbf{v} \rangle = s\langle \mathbf{u}, \mathbf{v} \rangle + t\langle \mathbf{w}, \mathbf{v} \rangle\).</li>
</ol>
A vector space equipped with an inner product is called an <em>inner product space</em>.

</div>

Notice that conjugate symmetry and linearity in the first slot force <em>conjugate linearity</em> in the second: \(\langle \mathbf{u}, s\mathbf{v} \rangle = \bar{s}\langle \mathbf{u}, \mathbf{v} \rangle\). This asymmetry is essential in the complex case.

**Examples.** (i) The standard dot product on \(\mathbb{R}^n\). (ii) The Hermitian inner product \(\langle \mathbf{z}, \mathbf{w} \rangle = \mathbf{z}^* \mathbf{w} = \sum_i z_i \overline{w_i}\) on \(\mathbb{C}^n\). (iii) The trace inner product \(\langle A, B \rangle = \operatorname{tr}(B^* A)\) on \(M_{n \times n}(\mathbb{C})\). (iv) The \(L^2\) inner product \(\langle f, g \rangle = \int_a^b f(x)\overline{g(x)}\,dx\) on \(C[a,b]\).

<div class="definition">

<strong>Definition 3.2 (Norm, Orthogonality).</strong> In an inner product space, the <em>norm</em> of \(\mathbf{v}\) is \(\|\mathbf{v}\| = \sqrt{\langle \mathbf{v}, \mathbf{v} \rangle}\). Vectors \(\mathbf{u}, \mathbf{v}\) are <em>orthogonal</em> (written \(\mathbf{u} \perp \mathbf{v}\)) if \(\langle \mathbf{u}, \mathbf{v} \rangle = 0\).

</div>

## 3.2 The Cauchy-Schwarz Inequality

The Cauchy-Schwarz inequality is one of the most useful inequalities in mathematics. It implies the triangle inequality, gives meaning to the angle between vectors, and underpins convergence arguments throughout analysis.

<div class="theorem">

<strong>Theorem 3.3 (Cauchy-Schwarz Inequality).</strong> For any \(\mathbf{u}, \mathbf{v}\) in an inner product space,
\[|\langle \mathbf{u}, \mathbf{v} \rangle| \leq \|\mathbf{u}\| \, \|\mathbf{v}\|,\]
with equality if and only if \(\mathbf{u}\) and \(\mathbf{v}\) are linearly dependent.

</div>

*Proof.* If \(\mathbf{v} = \mathbf{0}\) both sides are zero. Otherwise, for any \(t \in \mathbb{F}\) set \(\mathbf{w} = \mathbf{u} - t\mathbf{v}\). Then \(0 \leq \|\mathbf{w}\|^2 = \|\mathbf{u}\|^2 - \bar{t}\langle \mathbf{v}, \mathbf{u} \rangle - t\langle \mathbf{u}, \mathbf{v} \rangle + |t|^2 \|\mathbf{v}\|^2\). Choose \(t = \langle \mathbf{u}, \mathbf{v} \rangle / \|\mathbf{v}\|^2\); substituting gives \(0 \leq \|\mathbf{u}\|^2 - |\langle \mathbf{u}, \mathbf{v} \rangle|^2 / \|\mathbf{v}\|^2\), which rearranges to the inequality. Equality holds iff \(\mathbf{w} = \mathbf{0}\), i.e., \(\mathbf{u} = t\mathbf{v}\). \(\square\)

<div class="corollary">

<strong>Corollary 3.4 (Triangle Inequality).</strong> \(\|\mathbf{u} + \mathbf{v}\| \leq \|\mathbf{u}\| + \|\mathbf{v}\|\).

</div>

## 3.3 Gram-Schmidt Orthogonalization

Starting from any basis, we can systematically replace it with an orthonormal one, spanning the same subspaces at each step. This procedure is at the heart of QR factorization, numerical linear algebra, and Fourier analysis.

<div class="theorem">

<strong>Theorem 3.5 (Gram-Schmidt).</strong> Let \(\{\mathbf{w}_1, \ldots, \mathbf{w}_k\}\) be a linearly independent set in an inner product space \(V\). Define vectors \(\mathbf{e}_1, \ldots, \mathbf{e}_k\) inductively by
\[\mathbf{e}_1 = \frac{\mathbf{w}_1}{\|\mathbf{w}_1\|},\]
and for \(j \geq 2\),
\[\tilde{\mathbf{e}}_j = \mathbf{w}_j - \sum_{i=1}^{j-1} \langle \mathbf{w}_j, \mathbf{e}_i \rangle \mathbf{e}_i, \qquad \mathbf{e}_j = \frac{\tilde{\mathbf{e}}_j}{\|\tilde{\mathbf{e}}_j\|}.\]
Then \(\{\mathbf{e}_1, \ldots, \mathbf{e}_k\}\) is an orthonormal set and \(\operatorname{span}\{\mathbf{e}_1, \ldots, \mathbf{e}_j\} = \operatorname{span}\{\mathbf{w}_1, \ldots, \mathbf{w}_j\}\) for each \(j\).

</div>

*Proof.* We proceed by induction. Clearly \(\operatorname{span}\{\mathbf{e}_1\} = \operatorname{span}\{\mathbf{w}_1\}\) and \(\|\mathbf{e}_1\| = 1\). Suppose the claim holds for indices up to \(j-1\). Since \(\mathbf{w}_j \notin \operatorname{span}\{\mathbf{w}_1,\ldots,\mathbf{w}_{j-1}\} = \operatorname{span}\{\mathbf{e}_1,\ldots,\mathbf{e}_{j-1}\}\), the vector \(\tilde{\mathbf{e}}_j \neq \mathbf{0}\). For any \(1 \leq \ell \leq j-1\),
\[\langle \tilde{\mathbf{e}}_j, \mathbf{e}_\ell \rangle = \langle \mathbf{w}_j, \mathbf{e}_\ell \rangle - \langle \mathbf{w}_j, \mathbf{e}_\ell \rangle \|\mathbf{e}_\ell\|^2 = 0,\]
using \(\|\mathbf{e}_\ell\| = 1\) and the orthonormality of \(\{\mathbf{e}_1, \ldots, \mathbf{e}_{j-1}\}\). So \(\mathbf{e}_j \perp \mathbf{e}_\ell\) for all \(\ell < j\), and normalizing gives \(\|\mathbf{e}_j\| = 1\). The span identity is clear since \(\tilde{\mathbf{e}}_j = \mathbf{w}_j - (\text{element of } \operatorname{span}\{\mathbf{e}_1,\ldots,\mathbf{e}_{j-1}\})\). \(\square\)

The key idea is that at each step we subtract the component of \(\mathbf{w}_j\) that lies in the already-constructed orthonormal space, leaving a residual that is perpendicular to everything already processed.

## 3.4 Orthogonal Complements and Projections

<div class="definition">

<strong>Definition 3.6 (Orthogonal Complement).</strong> Let \(W\) be a subspace of an inner product space \(V\). The <em>orthogonal complement</em> of \(W\) is
\[W^\perp = \{\mathbf{v} \in V \mid \langle \mathbf{v}, \mathbf{w} \rangle = 0 \text{ for all } \mathbf{w} \in W\}.\]

</div>

<div class="theorem">

<strong>Theorem 3.7 (Orthogonal Decomposition).</strong> Let \(W\) be a finite-dimensional subspace of an inner product space \(V\). Then \(V = W \oplus W^\perp\), meaning every \(\mathbf{v} \in V\) decomposes uniquely as \(\mathbf{v} = \mathbf{w} + \mathbf{w}^\perp\) with \(\mathbf{w} \in W\) and \(\mathbf{w}^\perp \in W^\perp\).

</div>

*Proof.* Let \(\{\mathbf{e}_1, \ldots, \mathbf{e}_k\}\) be an orthonormal basis for \(W\). Set \(\mathbf{w} = \sum_{i=1}^k \langle \mathbf{v}, \mathbf{e}_i \rangle \mathbf{e}_i\) and \(\mathbf{w}^\perp = \mathbf{v} - \mathbf{w}\). Then \(\mathbf{w} \in W\), and for each \(j\), \(\langle \mathbf{w}^\perp, \mathbf{e}_j \rangle = \langle \mathbf{v}, \mathbf{e}_j \rangle - \langle \mathbf{v}, \mathbf{e}_j \rangle = 0\), so \(\mathbf{w}^\perp \in W^\perp\). Uniqueness follows from \(W \cap W^\perp = \{\mathbf{0}\}\). \(\square\)

<div class="definition">

<strong>Definition 3.8 (Orthogonal Projection).</strong> With notation as above, the <em>orthogonal projection onto \(W\)</em> is the linear map \(P_W : V \to V\) defined by \(P_W \mathbf{v} = \sum_{i=1}^k \langle \mathbf{v}, \mathbf{e}_i \rangle \mathbf{e}_i\).

</div>

The orthogonal projection satisfies \(P_W^2 = P_W\) (it is <em>idempotent</em>) and \(P_W^* = P_W\) (it is <em>self-adjoint</em>). Moreover, the Approximation Theorem states that \(P_W \mathbf{v}\) is the unique vector in \(W\) closest to \(\mathbf{v}\), since \(\|\mathbf{v} - P_W \mathbf{v}\| < \|\mathbf{v} - \mathbf{w}\|\) for all \(\mathbf{w} \in W\), \(\mathbf{w} \neq P_W \mathbf{v}\).

## 3.5 Adjoints of Linear Maps

The adjoint is the linear-algebraic analogue of the complex conjugate. It is indispensable for defining the classes of operators — self-adjoint, unitary, normal — that can be diagonalized.

<div class="definition">

<strong>Definition 3.9 (Adjoint).</strong> Let \(V\) and \(W\) be finite-dimensional inner product spaces over \(\mathbb{F}\) and let \(T : V \to W\) be linear. The <em>adjoint</em> of \(T\) is the unique linear map \(T^* : W \to V\) satisfying
\[\langle T\mathbf{v}, \mathbf{w} \rangle_W = \langle \mathbf{v}, T^*\mathbf{w} \rangle_V \quad \text{for all } \mathbf{v} \in V, \mathbf{w} \in W.\]

</div>

Existence is guaranteed by the Riesz representation lemma: for each fixed \(\mathbf{w}\), the map \(\mathbf{v} \mapsto \langle T\mathbf{v}, \mathbf{w} \rangle\) is a linear functional on \(V\), hence equals \(\langle \cdot, T^*\mathbf{w} \rangle\) for a unique \(T^*\mathbf{w}\). In an orthonormal basis, if \(T\) has matrix \(A\) then \(T^*\) has matrix \(A^*\) (the conjugate transpose).

<div class="theorem">

<strong>Theorem 3.10 (Properties of the Adjoint).</strong> For linear maps \(S, T : V \to W\) and \(\alpha \in \mathbb{F}\):
<ol>
  <li>\((S + T)^* = S^* + T^*\).</li>
  <li>\((\alpha T)^* = \bar{\alpha} T^*\).</li>
  <li>\((T^*)^* = T\).</li>
  <li>\((ST)^* = T^* S^*\).</li>
  <li>\(\ker T^* = (\operatorname{Range} T)^\perp\).</li>
</ol>

</div>

Property (5) is the abstract version of the Fundamental Theorem: the left null space is the orthogonal complement of the column space.

---

# Chapter 4: Spectral Theory

The spectral theorem is the centrepiece of linear algebra: under the right conditions, an operator on an inner product space has an orthonormal basis of eigenvectors. This means the operator is as simple as possible — a pure scaling in each coordinate direction. The conditions are mild: self-adjoint operators over \(\mathbb{R}\), and normal operators over \(\mathbb{C}\).

## 4.1 Self-Adjoint and Normal Operators

<div class="definition">

<strong>Definition 4.1.</strong> Let \(T : V \to V\) be a linear operator on a finite-dimensional inner product space.
<ul>
  <li>\(T\) is <em>self-adjoint</em> (Hermitian) if \(T^* = T\).</li>
  <li>\(T\) is <em>unitary</em> (or <em>orthogonal</em> over \(\mathbb{R}\)) if \(T^* T = TT^* = I\).</li>
  <li>\(T\) is <em>normal</em> if \(TT^* = T^*T\).</li>
</ul>

</div>

Self-adjoint and unitary operators are both normal. The class of normal operators is precisely the class that can be orthogonally/unitarily diagonalized.

<div class="theorem">

<strong>Theorem 4.2.</strong> If \(T\) is self-adjoint on a complex inner product space, then all eigenvalues of \(T\) are real.

</div>

*Proof.* Suppose \(T\mathbf{v} = \lambda \mathbf{v}\) with \(\|\mathbf{v}\| = 1\). Then \(\lambda = \langle T\mathbf{v}, \mathbf{v} \rangle = \langle \mathbf{v}, T^*\mathbf{v} \rangle = \langle \mathbf{v}, T\mathbf{v} \rangle = \overline{\langle T\mathbf{v}, \mathbf{v} \rangle} = \bar{\lambda}\), so \(\lambda \in \mathbb{R}\). \(\square\)

<svg viewBox="0 0 380 130" xmlns="http://www.w3.org/2000/svg" style="max-width:380px;display:block;margin:1.5em auto">
  <defs>
    <marker id="saArr" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="currentColor"/>
    </marker>
  </defs>
  <text x="190" y="16" font-size="12" fill="currentColor" text-anchor="middle" font-weight="bold">Self-Adjoint: Real Eigenvalues on Number Line, Orthogonal Eigenvectors</text>
  <!-- Number line for eigenvalues -->
  <line x1="20" y1="55" x2="360" y2="55" stroke="currentColor" stroke-width="1.3" marker-end="url(#saArr)"/>
  <text x="363" y="59" font-size="10" fill="currentColor">ℝ</text>
  <!-- Eigenvalue markers -->
  <circle cx="80" cy="55" r="5" fill="#ef4444"/>
  <text x="80" y="47" font-size="11" fill="#ef4444" text-anchor="middle" font-weight="bold">λ₁</text>
  <text x="80" y="72" font-size="10" fill="currentColor" text-anchor="middle">real</text>
  <circle cx="180" cy="55" r="5" fill="#3b82f6"/>
  <text x="180" y="47" font-size="11" fill="#3b82f6" text-anchor="middle" font-weight="bold">λ₂</text>
  <text x="180" y="72" font-size="10" fill="currentColor" text-anchor="middle">real</text>
  <circle cx="280" cy="55" r="5" fill="#22c55e"/>
  <text x="280" y="47" font-size="11" fill="#22c55e" text-anchor="middle" font-weight="bold">λ₃</text>
  <text x="280" y="72" font-size="10" fill="currentColor" text-anchor="middle">real</text>
  <!-- Orthogonal eigenvector pair arrows -->
  <line x1="30" y1="100" x2="80" y2="100" stroke="#ef4444" stroke-width="2" marker-end="url(#saArr)"/>
  <text x="83" y="104" font-size="10" fill="#ef4444">v₁</text>
  <line x1="30" y1="100" x2="30" y2="115" stroke="#3b82f6" stroke-width="2" marker-end="url(#saArr)"/>
  <text x="20" y="125" font-size="9" fill="#3b82f6">v₂</text>
  <!-- Right angle mark -->
  <rect x="30" y="100" width="8" height="8" fill="none" stroke="currentColor" stroke-width="1" opacity="0.6"/>
  <text x="180" y="105" font-size="10" fill="currentColor" text-anchor="middle" opacity="0.7">λ₁≠λ₂≠λ₃ ⟹ v₁⊥v₂⊥v₃  (distinct eigenvalues → orthogonal eigenvectors)</text>
</svg>

<div class="theorem">

<strong>Theorem 4.3.</strong> Eigenvectors of a normal operator \(T\) corresponding to distinct eigenvalues are orthogonal.

</div>

*Proof.* If \(T\mathbf{v} = \lambda \mathbf{v}\) and \(T\mathbf{w} = \mu \mathbf{w}\) with \(\lambda \neq \mu\), then \(\lambda \langle \mathbf{v}, \mathbf{w} \rangle = \langle T\mathbf{v}, \mathbf{w} \rangle = \langle \mathbf{v}, T^*\mathbf{w} \rangle = \langle \mathbf{v}, \bar{\mu}\mathbf{w} \rangle = \mu \langle \mathbf{v}, \mathbf{w} \rangle\). (We used that for normal \(T\), if \(T\mathbf{w} = \mu\mathbf{w}\) then \(T^*\mathbf{w} = \bar{\mu}\mathbf{w}\).) Since \(\lambda \neq \mu\), we get \(\langle \mathbf{v}, \mathbf{w} \rangle = 0\). \(\square\)

## 4.2 Schur's Theorem

Before the full spectral theorem, we need Schur's triangularization, which holds for all operators over \(\mathbb{C}\).

<div class="theorem">

<strong>Theorem 4.4 (Schur's Theorem).</strong> Let \(T : V \to V\) be a linear operator on an \(n\)-dimensional complex inner product space. Then there exists an orthonormal basis for \(V\) with respect to which the matrix of \(T\) is upper triangular.

</div>

*Proof.* By induction on \(n\). For \(n = 1\) the result is trivial. For \(n > 1\): since \(\mathbb{C}\) is algebraically closed, \(T\) has an eigenvalue \(\lambda_1\) with unit eigenvector \(\mathbf{e}_1\). Let \(W = \operatorname{span}\{\mathbf{e}_1\}^\perp\); note \(T^*\) need not preserve \(W\), but we can consider the compression of \(T\) to a suitable space. More precisely, extend \(\mathbf{e}_1\) to an orthonormal basis, write the matrix of \(T\) in this basis as \(\begin{pmatrix} \lambda_1 & * \\ 0 & T_1 \end{pmatrix}\), and apply the inductive hypothesis to the \((n-1)\times(n-1)\) block \(T_1\). \(\square\)

<svg viewBox="0 0 360 140" xmlns="http://www.w3.org/2000/svg" style="max-width:360px;display:block;margin:1.5em auto">
  <text x="180" y="16" font-size="12" fill="currentColor" text-anchor="middle" font-weight="bold">Schur Triangularization: U*TU = R (upper triangular)</text>
  <!-- T -->
  <rect x="15" y="32" width="60" height="70" rx="4" fill="none" stroke="currentColor" stroke-width="1.3" opacity="0.5"/>
  <text x="45" y="70" font-size="13" fill="currentColor" text-anchor="middle" font-weight="bold">T</text>
  <text x="45" y="115" font-size="9" fill="currentColor" text-anchor="middle">any operator</text>
  <!-- = -->
  <text x="85" y="72" font-size="16" fill="currentColor">=</text>
  <!-- U -->
  <rect x="100" y="32" width="60" height="60" rx="4" fill="#3b82f6" fill-opacity="0.15" stroke="#3b82f6" stroke-width="1.5"/>
  <text x="130" y="66" font-size="13" fill="#3b82f6" text-anchor="middle" font-weight="bold">U</text>
  <text x="130" y="105" font-size="9" fill="#3b82f6" text-anchor="middle">unitary</text>
  <!-- R: upper triangular -->
  <rect x="170" y="32" width="60" height="60" rx="4" fill="#ef4444" fill-opacity="0.15" stroke="#ef4444" stroke-width="1.5"/>
  <!-- Show upper triangular pattern -->
  <text x="178" y="50" font-size="10" fill="#ef4444">λ₁ * *</text>
  <text x="178" y="65" font-size="10" fill="#ef4444">  λ₂ *</text>
  <text x="178" y="80" font-size="10" fill="#ef4444">    λ₃</text>
  <text x="200" y="105" font-size="9" fill="#ef4444" text-anchor="middle">upper triangular</text>
  <!-- U* -->
  <rect x="240" y="32" width="60" height="60" rx="4" fill="#3b82f6" fill-opacity="0.15" stroke="#3b82f6" stroke-width="1.5"/>
  <text x="270" y="66" font-size="13" fill="#3b82f6" text-anchor="middle" font-weight="bold">U*</text>
  <text x="270" y="105" font-size="9" fill="#3b82f6" text-anchor="middle">= U⁻¹</text>
  <text x="180" y="132" font-size="10" fill="currentColor" text-anchor="middle" opacity="0.7">Eigenvalues appear on diagonal of R; normal ⟹ R is diagonal</text>
</svg>

## 4.3 The Real Spectral Theorem

<div class="theorem">

<strong>Theorem 4.5 (Real Spectral Theorem).</strong> Let \(V\) be a finite-dimensional real inner product space and \(T : V \to V\) a self-adjoint operator (\(T = T^*\)). Then \(V\) has an orthonormal basis of eigenvectors of \(T\). Equivalently, every real symmetric matrix is orthogonally diagonalizable.

</div>

*Proof.* By induction on \(n = \dim V\). For \(n = 1\) trivial. For general \(n\): we first show \(T\) has a real eigenvalue. Consider the characteristic polynomial \(\det(T - \lambda I)\) over \(\mathbb{R}\); by working over \(\mathbb{C}\), \(T\) has an eigenvalue \(\lambda\), which is real by Theorem 4.2. Let \(\mathbf{e}_1\) be a unit eigenvector. Set \(W = \operatorname{span}\{\mathbf{e}_1\}^\perp\). Since \(T\) is self-adjoint, \(W\) is \(T\)-invariant: if \(\mathbf{w} \perp \mathbf{e}_1\) then \(\langle T\mathbf{w}, \mathbf{e}_1 \rangle = \langle \mathbf{w}, T\mathbf{e}_1 \rangle = \lambda \langle \mathbf{w}, \mathbf{e}_1 \rangle = 0\). Apply the inductive hypothesis to \(T|_W\) (which is self-adjoint on \(W\)) to get an orthonormal eigenbasis for \(W\); together with \(\mathbf{e}_1\) this gives an orthonormal eigenbasis for \(V\). \(\square\)

## 4.4 Complex Spectral Theorem (Unitary Diagonalization)

<div class="theorem">

<strong>Theorem 4.6 (Spectral Theorem for Normal Operators).</strong> Let \(V\) be a finite-dimensional complex inner product space and \(T : V \to V\) a linear operator. The following are equivalent:
<ol>
  <li>\(T\) is normal (\(TT^* = T^*T\)).</li>
  <li>\(V\) has an orthonormal basis of eigenvectors of \(T\).</li>
  <li>\(T\) is unitarily diagonalizable: there exists a unitary \(U\) such that \(U^{-1}TU\) is diagonal.</li>
</ol>

</div>

*Proof.* \((2 \Leftrightarrow 3)\) is immediate. \((2 \Rightarrow 1)\): if \(T\) is diagonal in some orthonormal basis, then in that basis \(TT^*\) and \(T^*T\) are both diagonal with entries \(|\lambda_i|^2\), so they are equal. \((1 \Rightarrow 2)\): By Schur's Theorem, there is an orthonormal basis in which the matrix of \(T\) is upper triangular: \(U^*TU = R\) with \(R\) upper triangular. Since \(T\) is normal, \(R\) is normal: \(R R^* = (U^*TU)(U^*T^*U) = U^*TT^*U = U^*T^*TU = R^*R\). One checks directly that a normal upper triangular matrix must be diagonal (comparing \((j,j)\) entries of \(RR^* = R^*R\) by induction forces all off-diagonal entries to vanish). \(\square\)

The geometric content: a normal operator is one that, in the right orthonormal frame, acts as a pure diagonal scaling — each basis vector is merely multiplied by a complex number. Self-adjoint operators scale by real numbers; unitary operators scale by numbers of modulus 1.

## 4.5 Quadratic Forms and the Principal Axis Theorem

A quadratic form is a homogeneous degree-2 polynomial, and the spectral theorem shows that every such form can be diagonalized by a rotation.

<div class="definition">

<strong>Definition 4.7 (Quadratic Form).</strong> A <em>quadratic form</em> on \(\mathbb{R}^n\) is a function \(Q(\mathbf{x}) = \mathbf{x}^T A \mathbf{x}\) where \(A\) is a real symmetric matrix. The classification:
<ul>
  <li><em>Positive definite</em>: \(Q(\mathbf{x}) > 0\) for all \(\mathbf{x} \neq \mathbf{0}\) \(\Leftrightarrow\) all eigenvalues of \(A\) are positive.</li>
  <li><em>Negative definite</em>: \(Q(\mathbf{x}) < 0\) for all \(\mathbf{x} \neq \mathbf{0}\) \(\Leftrightarrow\) all eigenvalues negative.</li>
  <li><em>Indefinite</em>: \(Q\) takes both signs \(\Leftrightarrow\) eigenvalues of both signs.</li>
  <li><em>Positive semidefinite</em>: \(Q(\mathbf{x}) \geq 0\) for all \(\mathbf{x}\) \(\Leftrightarrow\) all eigenvalues \(\geq 0\).</li>
</ul>

</div>

<div class="theorem">

<strong>Theorem 4.8 (Principal Axis Theorem).</strong> Let \(Q(\mathbf{x}) = \mathbf{x}^T A \mathbf{x}\) be a quadratic form with symmetric matrix \(A\). There exists an orthogonal matrix \(P\) (a rotation/reflection) such that the change of variables \(\mathbf{x} = P\mathbf{y}\) transforms \(Q\) into the diagonal form
\[Q = \lambda_1 y_1^2 + \lambda_2 y_2^2 + \cdots + \lambda_n y_n^2,\]
where \(\lambda_1, \ldots, \lambda_n\) are the eigenvalues of \(A\). The columns of \(P\) (the eigenvectors of \(A\)) are the <em>principal axes</em>.

</div>

This theorem is what allows one to classify conic sections and quadric surfaces: the level set \(Q(\mathbf{x}) = c\) is, after rotation to the principal axes, immediately recognizable as an ellipse, hyperbola, or degenerate case.

<div class="theorem">

<strong>Theorem 4.9 (Extremal Characterization).</strong> The maximum of \(Q(\mathbf{x}) = \mathbf{x}^T A \mathbf{x}\) subject to \(\|\mathbf{x}\| = 1\) is \(\lambda_{\max}(A)\), attained at the corresponding eigenvector; the minimum is \(\lambda_{\min}(A)\).

</div>

---

# Chapter 5: Singular Value Decomposition

The spectral theorem applies only to normal operators. For an arbitrary matrix — rectangular or non-normal — the singular value decomposition (SVD) is the right analogue. Every matrix can be factored into a rotation, a scaling, and another rotation. The singular values are the fundamental numerical invariants.

## 5.1 Singular Values

The key observation: even if \(A\) is not diagonalizable, the matrix \(A^T A\) is always symmetric and positive semidefinite, hence has a full orthonormal eigenbasis with non-negative eigenvalues.

<div class="definition">

<strong>Definition 5.1 (Singular Values).</strong> Let \(A\) be an \(m \times n\) real matrix. The <em>singular values</em> of \(A\) are \(\sigma_i = \sqrt{\lambda_i}\) where \(\lambda_1 \geq \lambda_2 \geq \cdots \geq \lambda_n \geq 0\) are the eigenvalues of \(A^T A\). We have \(\|A\mathbf{v}_i\| = \sigma_i\) where \(\mathbf{v}_i\) is the corresponding unit eigenvector.

</div>

<div class="theorem">

<strong>Theorem 5.2.</strong> \(\operatorname{rank}(A^T A) = \operatorname{rank}(A)\). Consequently, \(A\) has exactly \(r = \operatorname{rank}(A)\) nonzero singular values.

</div>

*Proof.* \(\ker(A^T A) = \ker(A)\): if \(A^T A \mathbf{x} = \mathbf{0}\), then \(\|A\mathbf{x}\|^2 = \mathbf{x}^T A^T A \mathbf{x} = 0\), so \(A\mathbf{x} = \mathbf{0}\). Thus \(\dim \ker(A^T A) = \dim \ker(A)\), and by rank-nullity, both have the same rank. \(\square\)

## 5.2 SVD Theorem and Proof

<div class="theorem">

<strong>Theorem 5.3 (Singular Value Decomposition).</strong> Let \(A\) be an \(m \times n\) real matrix of rank \(r\). There exist an \(m \times m\) orthogonal matrix \(U\), an \(n \times n\) orthogonal matrix \(V\), and an \(m \times n\) matrix \(\Sigma\) of the form
\[\Sigma = \begin{pmatrix} D & 0 \\ 0 & 0 \end{pmatrix}, \qquad D = \operatorname{diag}(\sigma_1, \ldots, \sigma_r), \quad \sigma_1 \geq \cdots \geq \sigma_r > 0,\]
such that \(A = U \Sigma V^T\).

</div>

*Proof.* Let \(\{\mathbf{v}_1, \ldots, \mathbf{v}_n\}\) be an orthonormal basis of eigenvectors of \(A^T A\) with \(A^T A \mathbf{v}_i = \sigma_i^2 \mathbf{v}_i\), ordered so \(\sigma_1 \geq \cdots \geq \sigma_r > 0 = \sigma_{r+1} = \cdots = \sigma_n\). Form \(V = [\mathbf{v}_1 \mid \cdots \mid \mathbf{v}_n]\).

For \(1 \leq i \leq r\), define \(\mathbf{u}_i = \frac{1}{\sigma_i} A \mathbf{v}_i \in \mathbb{R}^m\). We verify orthonormality:
\[\langle \mathbf{u}_i, \mathbf{u}_j \rangle = \frac{1}{\sigma_i \sigma_j} \langle A\mathbf{v}_i, A\mathbf{v}_j \rangle = \frac{1}{\sigma_i \sigma_j} \langle \mathbf{v}_i, A^T A \mathbf{v}_j \rangle = \frac{\sigma_j^2}{\sigma_i \sigma_j} \langle \mathbf{v}_i, \mathbf{v}_j \rangle = \delta_{ij}.\]
Extend \(\{\mathbf{u}_1, \ldots, \mathbf{u}_r\}\) to an orthonormal basis \(\{\mathbf{u}_1, \ldots, \mathbf{u}_m\}\) for \(\mathbb{R}^m\) (via Gram-Schmidt). Form \(U = [\mathbf{u}_1 \mid \cdots \mid \mathbf{u}_m]\).

Now check: \(A V = A[\mathbf{v}_1 \mid \cdots \mid \mathbf{v}_n] = [\sigma_1 \mathbf{u}_1 \mid \cdots \mid \sigma_r \mathbf{u}_r \mid \mathbf{0} \mid \cdots \mid \mathbf{0}] = U\Sigma\). Since \(V\) is orthogonal, \(A = U\Sigma V^T\). \(\square\)

The geometric meaning: \(V^T\) rotates the domain, \(\Sigma\) scales each coordinate (zeroing out the null-space directions), and \(U\) rotates the codomain. Every linear map is, in the right pair of orthonormal frames, a diagonal scaling.

![SVD geometry: unit circle maps to ellipse](/static/pics/math245/svd_geometry.png)

## 5.3 Applications

**Low-rank approximation.** Write \(A = \sum_{i=1}^r \sigma_i \mathbf{u}_i \mathbf{v}_i^T\). The rank-\(k\) truncation \(A_k = \sum_{i=1}^k \sigma_i \mathbf{u}_i \mathbf{v}_i^T\) is the best rank-\(k\) approximation to \(A\) in the Frobenius norm (Eckart-Young Theorem). This underlies image compression and dimensionality reduction.

**Pseudoinverse.** Define \(\Sigma^+ = \operatorname{diag}(\sigma_1^{-1}, \ldots, \sigma_r^{-1}, 0, \ldots)\) (transposed). The <em>Moore-Penrose pseudoinverse</em> is
\[A^+ = V \Sigma^+ U^T.\]
It gives the minimum-norm least-squares solution \(\hat{\mathbf{x}} = A^+ \mathbf{b}\) to any linear system \(A\mathbf{x} = \mathbf{b}\), consistent or not.

**Condition number.** The ratio \(\kappa(A) = \sigma_1 / \sigma_r\) measures numerical sensitivity: when \(\kappa(A)\) is large, small perturbations in \(\mathbf{b}\) cause large changes in solutions to \(A\mathbf{x} = \mathbf{b}\).

---

# Chapter 6: Jordan Normal Form

Not every operator is diagonalizable. When eigenspaces are too small — when \(T - \lambda I\) is not diagonalizable — generalized eigenvectors fill in the missing dimensions. The Jordan normal form is the canonical representation of any operator over an algebraically closed field.

## 6.1 Generalized Eigenvectors

<div class="definition">

<strong>Definition 6.1 (Generalized Eigenvector).</strong> Let \(T : V \to V\) be a linear operator and \(\lambda\) an eigenvalue of \(T\). A nonzero vector \(\mathbf{v}\) is a <em>generalized eigenvector</em> of rank \(k\) for \(\lambda\) if
\[(T - \lambda I)^k \mathbf{v} = \mathbf{0} \quad \text{but} \quad (T - \lambda I)^{k-1} \mathbf{v} \neq \mathbf{0}.\]
The <em>generalized eigenspace} for \(\lambda\)</em> is \(G(\lambda, T) = \ker(T - \lambda I)^n = \bigcup_{k \geq 1} \ker(T - \lambda I)^k\).

</div>

A chain of generalized eigenvectors \(\mathbf{v}_k, \mathbf{v}_{k-1} = (T-\lambda I)\mathbf{v}_k, \ldots, \mathbf{v}_1 = (T-\lambda I)^{k-1}\mathbf{v}_k\) forms a <em>Jordan chain</em>. In the basis given by this chain (read bottom to top), the restriction of \(T\) has the form \(\lambda I + N\) where \(N\) shifts each vector to the next: this is a Jordan block.

## 6.2 Jordan Blocks and Jordan Form

<div class="definition">

<strong>Definition 6.2 (Jordan Block).</strong> The \(k \times k\) <em>Jordan block</em> for eigenvalue \(\lambda\) is
\[J_k(\lambda) = \begin{pmatrix} \lambda & 1 & & 0 \\ & \lambda & \ddots & \\ & & \ddots & 1 \\ 0 & & & \lambda \end{pmatrix}.\]

</div>

<div class="theorem">

<strong>Theorem 6.3 (Jordan Normal Form).</strong> Let \(V\) be a finite-dimensional vector space over \(\mathbb{C}\) and \(T : V \to V\) a linear operator. There exists a basis for \(V\) with respect to which the matrix of \(T\) is block diagonal,
\[[T] = \operatorname{diag}(J_{k_1}(\lambda_1), J_{k_2}(\lambda_2), \ldots, J_{k_s}(\lambda_s)),\]
where each \(J_{k_i}(\lambda_i)\) is a Jordan block. This form is unique up to permutation of blocks.

</div>

The Jordan form exists over \(\mathbb{C}\) (or any algebraically closed field) because every polynomial factors into linear factors, so every operator has enough eigenvalues to build chains. Over \(\mathbb{R}\), a rational canonical form is needed instead.

**Reading off structure.** The number of Jordan blocks for eigenvalue \(\lambda\) equals \(\dim \ker(T - \lambda I)\) (the geometric multiplicity). The size of the largest block for \(\lambda\) equals the index of \(\lambda\): the smallest \(k\) with \(\ker(T-\lambda I)^k = \ker(T-\lambda I)^{k+1}\). The algebraic multiplicity of \(\lambda\) is the sum of all block sizes for \(\lambda\).

## 6.3 Cayley-Hamilton Theorem

<div class="theorem">

<strong>Theorem 6.4 (Cayley-Hamilton Theorem).</strong> Let \(T : V \to V\) be a linear operator with characteristic polynomial \(p(\lambda) = \det(\lambda I - T)\). Then \(p(T) = 0\) (the zero operator on \(V\)).

</div>

*Proof.* Over \(\mathbb{C}\), use the Jordan normal form: \(T\) is similar to \(J\), so \(p(T)\) is similar to \(p(J)\), and it suffices to show \(p(J) = 0\). Since \(p(\lambda) = \prod_i (\lambda - \lambda_i)^{m_i}\) where \(m_i\) are algebraic multiplicities, and each block \(J_{k}(\lambda_i)\) satisfies \((J_k(\lambda_i) - \lambda_i I)^k = 0\), one verifies that \(p(J) = 0\) block by block. \(\square\)

The Cayley-Hamilton theorem has a striking corollary: every matrix satisfies a degree-\(n\) polynomial equation, so the algebra generated by a single operator is at most \(n\)-dimensional. In particular, \(A^{-1}\) (when it exists) can be expressed as a polynomial in \(A\).

---

# Chapter 7: Bilinear Forms

Bilinear forms generalize both inner products and quadratic forms. They capture the notion of a "pairing" between two vectors, and their classification — via Sylvester's theorem — reveals the deep geometry encoded in symmetric forms.

## 7.1 Symmetric Bilinear Forms

<div class="definition">

<strong>Definition 7.1 (Bilinear Form).</strong> A <em>bilinear form</em> on a real vector space \(V\) is a function \(B : V \times V \to \mathbb{R}\) that is linear in each argument separately. It is <em>symmetric</em> if \(B(\mathbf{u}, \mathbf{v}) = B(\mathbf{v}, \mathbf{u})\) for all \(\mathbf{u}, \mathbf{v}\).

</div>

<div class="definition">

<strong>Definition 7.2 (Matrix of a Bilinear Form).</strong> Given a basis \(B = \{\mathbf{e}_1, \ldots, \mathbf{e}_n\}\) for \(V\), the <em>Gram matrix</em> of \(B\) with respect to this basis is \([B]_{ij} = B(\mathbf{e}_i, \mathbf{e}_j)\). If the form is symmetric, the Gram matrix is symmetric.

</div>

A symmetric bilinear form and a quadratic form are essentially equivalent: given \(B\) symmetric, set \(Q(\mathbf{v}) = B(\mathbf{v}, \mathbf{v})\); given \(Q\), recover \(B(\mathbf{u}, \mathbf{v}) = \frac{1}{2}(Q(\mathbf{u}+\mathbf{v}) - Q(\mathbf{u}) - Q(\mathbf{v}))\) (polarization identity).

<div class="definition">

<strong>Definition 7.3 (Congruence).</strong> Two matrices \(A\) and \(B\) are <em>congruent</em> if there exists an invertible matrix \(P\) such that \(B = P^T A P\). Two symmetric bilinear forms are equivalent if and only if their Gram matrices (in any bases) are congruent.

</div>

Notice that congruence and similarity are different equivalence relations: similarity preserves eigenvalues; congruence preserves the signature of a symmetric form.

## 7.2 Sylvester's Law of Inertia

The classification of symmetric bilinear forms over \(\mathbb{R}\) is complete: up to congruence, a form is determined by its rank, the number of positive eigenvalues, and the number of negative eigenvalues.

<div class="theorem">

<strong>Theorem 7.4 (Sylvester's Law of Inertia).</strong> Let \(B\) be a symmetric bilinear form on a real vector space \(V\) of dimension \(n\). There exists a basis for \(V\) with respect to which the Gram matrix of \(B\) is
\[\operatorname{diag}(\underbrace{1, \ldots, 1}_{p}, \underbrace{-1, \ldots, -1}_{q}, \underbrace{0, \ldots, 0}_{n-p-q}).\]
The integers \(p\), \(q\), and \(n-p-q\) are independent of the choice of diagonalizing basis. The pair \((p, q)\) is called the <em>signature</em> of \(B\).

</div>

*Proof (sketch).* First, complete the square (Gaussian elimination on the Gram matrix using congruence operations) to diagonalize \(B\). Then rescale basis vectors to bring the diagonal to \(\pm 1\) and \(0\). Invariance of signature: if two diagonalizations gave different \(p\), one could construct a subspace on which \(B\) is both positive definite and negative semidefinite, contradicting positive definiteness. \(\square\)

Two symmetric bilinear forms over \(\mathbb{R}\) are congruent if and only if they have the same signature. This is a complete invariant.

## 7.3 Positive Definite Matrices

A positive definite matrix is one for which the associated bilinear form is an inner product. These matrices arise throughout optimization, statistics (covariance matrices), and differential geometry.

<div class="definition">

<strong>Definition 7.5 (Positive Definite Matrix).</strong> A real symmetric matrix \(A\) is <em>positive definite</em> if \(\mathbf{x}^T A \mathbf{x} > 0\) for all \(\mathbf{x} \neq \mathbf{0}\). It is <em>positive semidefinite</em> if \(\mathbf{x}^T A \mathbf{x} \geq 0\) for all \(\mathbf{x}\).

</div>

<div class="theorem">

<strong>Theorem 7.6 (Characterizations of Positive Definiteness).</strong> For a real symmetric matrix \(A\), the following are equivalent:
<ol>
  <li>\(A\) is positive definite.</li>
  <li>All eigenvalues of \(A\) are positive.</li>
  <li>All leading principal minors of \(A\) are positive (Sylvester's criterion).</li>
  <li>\(A = R^T R\) for some invertible upper triangular matrix \(R\) (Cholesky factorization).</li>
  <li>\(A = M^T M\) for some matrix \(M\) with independent columns.</li>
</ol>

</div>

The equivalence of (1) and (2) follows from the Principal Axis Theorem. For (3): the leading principal minors are the determinants of the upper-left \(k \times k\) submatrices; Sylvester's criterion gives a computationally efficient test. The Cholesky factorization (4) is the positive-definite analogue of LU decomposition and is fundamental in numerical computing.

<div class="remark">

<strong>Remark 7.7.</strong> The set of \(n \times n\) positive definite symmetric matrices forms an open convex cone in the space of symmetric matrices. This geometry is exploited in semidefinite programming, where one optimizes over this cone.

</div>

---

# Chapter 8: Tensor Products and Bilinear Maps

An optional but illuminating chapter: tensor products formalize the idea of "pairing" two vector spaces into a new one, and they are the natural language for multilinear algebra, quantum mechanics, and representation theory.

## 8.1 The Universal Property

Bilinear maps are maps that are linear in each argument separately. A tensor product converts bilinear maps into linear ones.

<div class="definition">

<strong>Definition 8.1 (Tensor Product).</strong> Let \(V\) and \(W\) be vector spaces over \(\mathbb{F}\). A <em>tensor product</em> of \(V\) and \(W\) is a vector space \(V \otimes W\) together with a bilinear map \(\otimes : V \times W \to V \otimes W\), \((\mathbf{v}, \mathbf{w}) \mapsto \mathbf{v} \otimes \mathbf{w}\), satisfying the following universal property: for any vector space \(U\) and any bilinear map \(B : V \times W \to U\), there exists a unique linear map \(\tilde{B} : V \otimes W \to U\) such that \(B = \tilde{B} \circ \otimes\).

</div>

In words: the tensor product is the "most general" way to turn a bilinear map into a linear one. The universal property determines \(V \otimes W\) up to unique isomorphism.

<div class="theorem">

<strong>Theorem 8.2.</strong> If \(V\) and \(W\) are finite-dimensional with bases \(\{\mathbf{e}_i\}\) and \(\{\mathbf{f}_j\}\) respectively, then \(V \otimes W\) has dimension \((\dim V)(\dim W)\) with basis \(\{\mathbf{e}_i \otimes \mathbf{f}_j\}\).

</div>

**Key identities.** For scalars \(c\): \((c\mathbf{v}) \otimes \mathbf{w} = c(\mathbf{v} \otimes \mathbf{w}) = \mathbf{v} \otimes (c\mathbf{w})\). Distributivity: \((\mathbf{v}_1 + \mathbf{v}_2) \otimes \mathbf{w} = \mathbf{v}_1 \otimes \mathbf{w} + \mathbf{v}_2 \otimes \mathbf{w}\). Note: not every element of \(V \otimes W\) is a pure tensor \(\mathbf{v} \otimes \mathbf{w}\); general elements are sums of pure tensors.

**Connection to linear algebra.** There are canonical isomorphisms: \(V^* \otimes W \cong \mathcal{L}(V, W)\) (linear maps are the same as rank-1 tensors summed), and \(V^* \otimes V^* \cong \{\text{bilinear forms on } V\}\). Positive-definite inner products on \(V\) correspond to certain elements of the symmetric part of \(V^* \otimes V^*\).

---

> **A note on perspective.** MATH 245 positions itself at the boundary where linear algebra becomes modern mathematics. The spectral theorem is not merely about diagonalizing matrices — it is the finite-dimensional case of the spectral theory of self-adjoint operators on Hilbert spaces (PMATH 450/453). Jordan form is the finite-dimensional case of the structure theorem for finitely generated modules over a PID (PMATH 347). Tensor products are the language of multilinear algebra, differential geometry, and quantum mechanics. The tools developed here will reappear, in their infinite-dimensional or categorical forms, throughout the rest of the mathematics curriculum.
