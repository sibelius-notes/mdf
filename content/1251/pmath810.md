---
title: "PMATH 810: Banach Algebras and Operator Theory"
subjects: PMATH
prof: Laurent W. Marcoux
---

## Sources and References

**Primary text** — Laurent W. Marcoux, *An Introduction to Operator Algebras*, lecture notes, University of Waterloo, 2005. Publicly hosted at math.uwaterloo.ca/~m2branna/math656/PMath810Notes.pdf.

**Supplementary** — Gerard J. Murphy, *C\*-Algebras and Operator Theory*, Academic Press, 1990. Gert K. Pedersen, *C\*-Algebras and their Automorphism Groups*, Academic Press, 1979. John B. Conway, *A Course in Functional Analysis*, 2nd ed., Springer, 1990. William Arveson, *A Short Course on Spectral Theory*, Springer, 2002. Ronald G. Douglas, *Banach Algebra Techniques in Operator Theory*, 2nd ed., Springer, 1998.

**Online resources** — MIT OpenCourseWare 18.102 (Introduction to Functional Analysis); lecture notes from Vaughan Jones (Berkeley), Hanfeng Li (SUNY Buffalo), and Narutaka Ozawa (RIMS Kyoto) on operator algebras.

---

# Chapter 1: A Brief Review of Banach Space Theory

## 1.1 Normed Spaces and Banach Spaces

The theory of Banach algebras is, at its heart, a marriage of algebra and analysis. Before we can introduce the algebraic structures, we need to recall the analytic backbone: the theory of Banach spaces. A **normed space** is a vector space \( X \) over \( \mathbb{F} \) (where \( \mathbb{F} \) is either \( \mathbb{R} \) or \( \mathbb{C} \)) equipped with a function \( \|\cdot\| : X \to [0, \infty) \) satisfying positivity, homogeneity, and the triangle inequality. Completeness — the requirement that every Cauchy sequence converges — elevates a normed space to a **Banach space**.

<div class="definition">
A <strong>Banach space</strong> is a normed vector space \( (X, \|\cdot\|) \) that is complete with respect to the metric \( d(x,y) = \|x - y\| \).
</div>

The canonical examples permeate modern analysis. For \( 1 \le p \le \infty \), the space \( \ell^p \) consists of all scalar sequences \( (a_n) \) for which \( \|(a_n)\|_p = \left(\sum_{n=1}^\infty |a_n|^p\right)^{1/p} < \infty \) when \( p < \infty \), and \( \|(a_n)\|_\infty = \sup_n |a_n| < \infty \) when \( p = \infty \). The space \( c_0 \) consists of sequences converging to zero, with the sup norm. For \( 1 \le p \le \infty \) and a measure space \( (\Omega, \mu) \), the Lebesgue space \( L^p(\Omega, \mu) \) carries the norm \( \|f\|_p = \left(\int |f|^p \, d\mu\right)^{1/p} \). When \( X \) is a compact Hausdorff space, \( C(X) \) — the space of continuous scalar-valued functions on \( X \) — is a Banach space under the uniform norm \( \|f\|_\infty = \sup_{x \in X} |f(x)| \).

**Hilbert spaces** are Banach spaces with additional geometric structure: they arise from an inner product \( \langle \cdot, \cdot \rangle \) via the norm \( \|x\| = \langle x, x \rangle^{1/2} \). The distinguishing feature is the parallelogram law

\[
\|x + y\|^2 + \|x - y\|^2 = 2(\|x\|^2 + \|y\|^2),
\]

which characterizes inner product spaces among normed spaces (Jordan–von Neumann). The prototypical Hilbert spaces are \( \ell^2 \) and \( L^2(\Omega, \mu) \). The geometry of Hilbert spaces — orthogonality, projections, orthonormal bases — underpins spectral theory.

The **Hardy spaces** \( H^p \) occupy a special place. For \( 1 \le p \le \infty \), \( H^p \) is the closed subspace of \( L^p(\mathbb{T}) \) — where \( \mathbb{T} \) is the unit circle — consisting of functions whose Fourier coefficients \( \hat{f}(n) \) vanish for all \( n < 0 \). Equivalently, one may define \( H^2 \) as the space of holomorphic functions \( f \) on the unit disk \( \mathbb{D} \) for which \( \sup_{0 < r < 1} \int_0^{2\pi} |f(re^{i\theta})|^2 d\theta/(2\pi) < \infty \). Hardy spaces are intimately connected with Toeplitz and Hankel operators and play a central role in function-theoretic operator theory.

## 1.2 The Dual Space and Weak Topologies

For a Banach space \( X \), the **dual space** \( X^* \) consists of all bounded linear functionals \( \phi : X \to \mathbb{F} \). The dual is itself a Banach space under the operator norm \( \|\phi\| = \sup_{\|x\| \le 1} |\phi(x)| \). The classical duality pairings are: \( (\ell^p)^* \cong \ell^q \) for \( 1/p + 1/q = 1 \) with \( 1 < p < \infty \), \( (c_0)^* \cong \ell^1 \), and \( (L^p)^* \cong L^q \) for \( 1 < p < \infty \). The dual of \( C(X) \) — via the Riesz representation theorem — is the space of regular Borel measures on \( X \).

The **weak topology** on \( X \) is the coarsest topology making every \( \phi \in X^* \) continuous. A net \( (x_\alpha) \) converges weakly to \( x \) if \( \phi(x_\alpha) \to \phi(x) \) for every \( \phi \in X^* \). The **weak\* topology** on \( X^* \) is the coarsest topology making evaluation at each \( x \in X \) continuous: \( \phi_\alpha \xrightarrow{w^*} \phi \) iff \( \phi_\alpha(x) \to \phi(x) \) for all \( x \in X \).

## 1.3 The Fundamental Theorems

The four pillars of functional analysis — Hahn-Banach, Open Mapping, Closed Graph, and Uniform Boundedness — provide the structural bedrock on which the entire theory rests.

<div class="theorem">
<strong>Hahn-Banach Theorem.</strong> Let \( X \) be a normed space, \( Y \subseteq X \) a subspace, and \( \phi \in Y^* \). There exists \( \tilde{\phi} \in X^* \) such that \( \tilde{\phi}\big|_Y = \phi \) and \( \|\tilde{\phi}\| = \|\phi\| \).
</div>

The Hahn-Banach theorem has numerous corollaries: the dual space separates points (if \( x \ne 0 \) there exists \( \phi \in X^* \) with \( \phi(x) \ne 0 \)); every closed subspace is an intersection of kernels of bounded functionals; the canonical embedding \( x \mapsto \hat{x} \) of \( X \) into \( X^{**} \) is an isometry. When this embedding is surjective, \( X \) is called **reflexive**; the spaces \( L^p \) for \( 1 < p < \infty \) are reflexive, while \( c_0 \), \( \ell^1 \), and \( L^1 \) are not.

<div class="theorem">
<strong>Open Mapping Theorem.</strong> Let \( X \) and \( Y \) be Banach spaces and \( T : X \to Y \) a bounded surjective linear map. Then \( T \) is an open map: it sends open sets to open sets.
</div>

<div class="theorem">
<strong>Banach Isomorphism Theorem.</strong> If \( T : X \to Y \) is a bounded bijective linear map between Banach spaces, then \( T^{-1} \) is also bounded.
</div>

The Banach Isomorphism Theorem is an immediate consequence of the Open Mapping Theorem. It says that a bounded linear bijection between Banach spaces is automatically a topological isomorphism — a striking rigidity result with no analogue for incomplete normed spaces.

<div class="theorem">
<strong>Closed Graph Theorem.</strong> A linear map \( T : X \to Y \) between Banach spaces is bounded if and only if its graph \( \{(x, Tx) : x \in X\} \) is closed in \( X \times Y \).
</div>

<div class="theorem">
<strong>Banach-Steinhaus Theorem (Uniform Boundedness Principle).</strong> Let \( X \) be a Banach space, \( Y \) a normed space, and \( \mathcal{F} \subseteq B(X, Y) \) a family of bounded linear maps that is pointwise bounded: \( \sup_{T \in \mathcal{F}} \|Tx\| < \infty \) for each \( x \in X \). Then \( \sup_{T \in \mathcal{F}} \|T\| < \infty \).
</div>

<div class="remark">
The Uniform Boundedness Principle is proved via the Baire Category Theorem: a complete metric space cannot be written as a countable union of nowhere-dense sets. If the family \( \mathcal{F} \) were not uniformly bounded, the sets \( \{x : \sup_T \|Tx\| \le n\} \) would be closed and their union would be all of \( X \), forcing one to have nonempty interior by Baire, from which uniform boundedness follows by a scaling argument.
</div>

<div class="theorem">
<strong>Banach-Alaoglu Theorem.</strong> The closed unit ball \( B_{X^*} = \{\phi \in X^* : \|\phi\| \le 1\} \) is compact in the weak\* topology on \( X^* \).
</div>

The Banach-Alaoglu theorem is proved by embedding \( B_{X^*} \) into a product of compact sets via \( \phi \mapsto (\phi(x))_{x \in X} \) and applying Tychonoff's theorem. It is indispensable for extracting convergent subnets from bounded sequences of functionals — the functional-analytic analogue of Bolzano-Weierstrass.

---

# Chapter 2: Banach Algebras

## 2.1 Definitions and Basic Examples

A **Banach algebra** is a Banach space that is simultaneously an associative algebra, with the norm and multiplication compatible via the submultiplicativity condition.

<div class="definition">
A <strong>Banach algebra</strong> is a Banach space \( \mathcal{A} \) over \( \mathbb{C} \) equipped with an associative bilinear multiplication satisfying

\[
\|ab\| \le \|a\| \cdot \|b\| \quad \text{for all } a, b \in \mathcal{A}.
\]
If \( \mathcal{A} \) contains a multiplicative identity \( e \) with \( \|e\| = 1 \), it is called <strong>unital</strong>.
</div>

The submultiplicativity condition ensures that multiplication is jointly continuous: \( a_n \to a \) and \( b_n \to b \) imply \( a_n b_n \to ab \). This is immediate from

\[
\|a_n b_n - ab\| \le \|a_n\| \cdot \|b_n - b\| + \|a_n - a\| \cdot \|b\|.
\]

The richness of the subject owes to the extraordinary variety of examples.

<div class="example">
<strong>\( C(X) \) — Continuous functions.</strong> When \( X \) is a compact Hausdorff space, \( C(X) \) under pointwise multiplication is a commutative unital Banach algebra. The identity is the constant function \( 1 \). This example is in some sense universal for commutative C*-algebras (Gelfand-Naimark).

<strong>\( B(X) \) — Bounded operators.</strong> For a Banach space \( X \), the algebra \( B(X) \) of all bounded linear operators \( T : X \to X \) under composition is a unital Banach algebra, with identity the identity operator \( I \). This is generally noncommutative for \( \dim X > 1 \) and is the central object of operator theory.

<strong>\( L^1(G) \) — Group algebra.</strong> For a locally compact group \( G \) with Haar measure \( \mu \), the Banach space \( L^1(G, \mu) \) becomes a Banach algebra under convolution \( (f * g)(x) = \int_G f(y) g(y^{-1}x) \, d\mu(y) \). This algebra encodes the representation theory of \( G \) and is a cornerstone of abstract harmonic analysis.

<strong>The disk algebra \( A(\mathbb{D}) \).</strong> The set of functions continuous on the closed unit disk \( \overline{\mathbb{D}} \) and holomorphic on the open disk \( \mathbb{D} \), equipped with the uniform norm, forms a closed subalgebra of \( C(\overline{\mathbb{D}}) \). Its maximal ideal space is homeomorphic to \( \overline{\mathbb{D}} \), making it a prototypical example in several complex variables and function algebras.

<strong>The Wiener algebra \( W \).</strong> The space of continuous functions on \( \mathbb{T} \) with absolutely convergent Fourier series, with norm \( \|f\|_W = \sum_{n=-\infty}^\infty |\hat{f}(n)| \), is a Banach algebra under pointwise multiplication. Wiener's theorem — that a function in \( W \) with no zeros has a reciprocal in \( W \) — is a beautiful application of the Gelfand theory.

<strong>The Calkin algebra.</strong> Let \( H \) be a separable infinite-dimensional Hilbert space and \( K(H) \) the closed ideal of compact operators. The quotient \( B(H)/K(H) \) is a Banach algebra called the <em>Calkin algebra</em>; it encodes Fredholm theory and the essential spectrum.

<strong>The Toeplitz algebra.</strong> The C*-subalgebra of \( B(H^2) \) generated by the unilateral shift \( S : e_n \mapsto e_{n+1} \) is the Toeplitz algebra \( \mathcal{T} \). It contains all Toeplitz operators \( T_\phi \) (compression of multiplication by \( \phi \) to \( H^2 \)) and fits into the short exact sequence \( 0 \to K(H^2) \to \mathcal{T} \to C(\mathbb{T}) \to 0 \).
</div>

## 2.2 Unitization

A non-unital Banach algebra \( \mathcal{A} \) can always be embedded in a unital one. The **unitization** \( \mathcal{A}^+ \) is formed as the vector space \( \mathcal{A} \oplus \mathbb{C} \) with multiplication \( (a, \lambda)(b, \mu) = (ab + \mu a + \lambda b, \lambda \mu) \) and norm \( \|(a, \lambda)\| = \|a\| + |\lambda| \). The map \( a \mapsto (a, 0) \) is an isometric embedding and \( (0, 1) \) is the identity of \( \mathcal{A}^+ \). When \( \mathcal{A} \) is already unital, the unitization is not the standard construction to use — instead one works with \( \mathcal{A} \) directly.

## 2.3 Invertible Elements and the Spectrum

In a unital Banach algebra \( \mathcal{A} \), an element \( a \in \mathcal{A} \) is **invertible** (or **regular**) if there exists \( b \in \mathcal{A} \) with \( ab = ba = e \). The set of invertibles is denoted \( \text{Inv}(\mathcal{A}) \) or \( \mathcal{A}^{-1} \).

<div class="theorem">
If \( \|e - a\| < 1 \), then \( a \in \mathcal{A}^{-1} \) and \( a^{-1} = \sum_{n=0}^\infty (e - a)^n \), with \( \|a^{-1}\| \le (1 - \|e - a\|)^{-1} \).
</div>

<div class="proof">
The series \( \sum_{n=0}^\infty (e - a)^n \) converges absolutely since \( \|(e-a)^n\| \le \|e-a\|^n \) and \( \sum \|e-a\|^n < \infty \). One checks that \( a \cdot \sum_{n=0}^N (e-a)^n = e - (e-a)^{N+1} \to e \) as \( N \to \infty \), and similarly for the left product.
</div>

This **Neumann series** argument has an important corollary.

<div class="theorem">
The set \( \mathcal{A}^{-1} \) is open in \( \mathcal{A} \), and the inversion map \( a \mapsto a^{-1} \) is continuous (in fact, analytic) on \( \mathcal{A}^{-1} \).
</div>

This shows that "invertibility is an open condition," a fact that is used constantly in spectral theory. If \( a \in \mathcal{A}^{-1} \) and \( \|b - a\| < \|a^{-1}\|^{-1} \), then \( b = a(e - a^{-1}(a-b)) \) where \( \|a^{-1}(a-b)\| < 1 \), making \( b \) invertible.

<div class="definition">
The <strong>spectrum</strong> of \( a \in \mathcal{A} \) is

\[
\sigma(a) = \{\lambda \in \mathbb{C} : \lambda e - a \notin \mathcal{A}^{-1}\}.
\]

The <strong>resolvent set</strong> is \( \rho(a) = \mathbb{C} \setminus \sigma(a) \), and the <strong>resolvent</strong> is the function \( R(\lambda, a) = (\lambda e - a)^{-1} \) defined on \( \rho(a) \). The <strong>spectral radius</strong> of \( a \) is \( r(a) = \sup\{|\lambda| : \lambda \in \sigma(a)\} \).
</div>

The resolvent \( \lambda \mapsto R(\lambda, a) \) is an analytic \( \mathcal{A} \)-valued function on \( \rho(a) \), and satisfies the **resolvent identity**

\[
R(\lambda, a) - R(\mu, a) = (\mu - \lambda) R(\lambda, a) R(\mu, a).
\]

<div class="theorem">
<strong>Spectral Radius Formula.</strong> For every \( a \) in a unital Banach algebra \( \mathcal{A} \),

\[
r(a) = \lim_{n \to \infty} \|a^n\|^{1/n} = \inf_{n \ge 1} \|a^n\|^{1/n}.
\]

In particular, \( \sigma(a) \) is a nonempty compact subset of \( \mathbb{C} \), and \( \sigma(a) \subseteq \{|\lambda| \le \|a\|\} \).
</div>

The proof that \( \sigma(a) \ne \varnothing \) uses Liouville's theorem: if \( \sigma(a) = \varnothing \), the resolvent \( R(\lambda, a) \) would be an entire \( \mathcal{A} \)-valued function satisfying \( R(\lambda, a) \to 0 \) as \( |\lambda| \to \infty \), hence bounded, hence constant zero by Liouville — contradicting \( (\lambda e - a) R(\lambda, a) = e \). This argument is the key place where the complex field is essential; spectra may be empty in real Banach algebras.

<div class="theorem">
<strong>Gelfand-Mazur Theorem.</strong> If \( \mathcal{A} \) is a unital Banach algebra in which every nonzero element is invertible (a division algebra), then \( \mathcal{A} \cong \mathbb{C} \).
</div>

The proof is immediate: for any \( a \in \mathcal{A} \), pick \( \lambda \in \sigma(a) \) (which exists by the spectral non-emptiness). Then \( \lambda e - a \) is not invertible, so \( \lambda e - a = 0 \), i.e., \( a = \lambda e \). Every element is a scalar multiple of the identity.

## 2.4 The Left Regular Representation

Every Banach algebra \( \mathcal{A} \) embeds isometrically into \( B(\mathcal{A}) \) via the **left regular representation** \( \pi : \mathcal{A} \to B(\mathcal{A}) \), \( \pi(a)(b) = ab \). One checks \( \|\pi(a)\| = \|a\| \) (using \( \|ab\| \le \|a\|\|b\| \) and \( \|ae\| = \|a\| \) when \( \mathcal{A} \) is unital). This shows concretely that every abstract Banach algebra can be realized as an algebra of operators.

## 2.5 The Analytic Functional Calculus

One of the most powerful tools in Banach algebra theory is the ability to define \( f(a) \) for holomorphic functions \( f \) defined on a neighborhood of \( \sigma(a) \). The key input is that the resolvent is an analytic function.

<div class="definition">
Let \( a \in \mathcal{A} \) and let \( U \) be an open set containing \( \sigma(a) \). For \( f \in H(U) \) (holomorphic on \( U \)), define

\[
f(a) = \frac{1}{2\pi i} \oint_\Gamma f(\lambda) R(\lambda, a) \, d\lambda,
\]

where \( \Gamma \) is a cycle in \( U \setminus \sigma(a) \) with winding number \( 1 \) around every point of \( \sigma(a) \) and \( 0 \) around every point outside \( U \). This is the <strong>analytic functional calculus</strong> for \( a \).
</div>

The functional calculus is well-defined (independent of \( \Gamma \)) and satisfies remarkable properties. The map \( f \mapsto f(a) \) is a unital algebra homomorphism from \( H(U) \) into \( \mathcal{A} \). Moreover, if \( f(\lambda) = \sum_{n=0}^N c_n \lambda^n \) is a polynomial, then \( f(a) = \sum_{n=0}^N c_n a^n \) (consistent with the purely algebraic notion). The central structural result is:

<div class="theorem">
<strong>Spectral Mapping Theorem.</strong> For \( f \in H(U) \),

\[
\sigma(f(a)) = f(\sigma(a)) = \{f(\lambda) : \lambda \in \sigma(a)\}.
\]
</div>

The analytic functional calculus can be used to construct idempotents (projections) corresponding to isolated spectral components: if \( \sigma(a) = \sigma_1 \cup \sigma_2 \) where \( \sigma_1, \sigma_2 \) are disjoint and compact, one uses \( f = \mathbf{1}_{\sigma_1} \) (approximated appropriately) to get an idempotent decomposing \( \mathcal{A} \).

---

# Chapter 3: Operator Algebras

## 3.1 The Algebra \( B(X) \)

For a Banach space \( X \), \( B(X) \) is the paradigmatic noncommutative Banach algebra. Beyond its norm topology, one considers the **strong operator topology** (SOT) in which \( T_\alpha \to T \) iff \( T_\alpha x \to Tx \) for all \( x \in X \), and the **weak operator topology** (WOT) in which \( T_\alpha \to T \) iff \( \phi(T_\alpha x) \to \phi(Tx) \) for all \( x \in X \) and \( \phi \in X^* \). These topologies are strictly coarser than the norm topology and play an essential role in von Neumann algebra theory.

## 3.2 Compact Operators and the Fredholm Alternative

<div class="definition">
An operator \( K \in B(X, Y) \) is <strong>compact</strong> if the image of the unit ball \( K(B_X) \) has compact closure in \( Y \). The class of compact operators \( K(X) \subset B(X) \) is a closed two-sided ideal.
</div>

Compact operators are approximated in norm by finite-rank operators (for Hilbert spaces; this is the approximation property). The essential examples: integral operators with \( L^2 \) kernels are compact; diagonal operators \( D_\lambda : e_n \mapsto \lambda_n e_n \) on \( \ell^2 \) are compact iff \( \lambda_n \to 0 \).

<div class="theorem">
<strong>Fredholm Alternative.</strong> Let \( K \in K(X) \) be compact and \( \lambda \ne 0 \). Then either \( \lambda - K \) is invertible in \( B(X) \), or \( \lambda \) is an eigenvalue of \( K \) with finite-dimensional eigenspace, and the same holds for \( K^* \). Moreover, \( \ker(\lambda - K) \) and \( \ker(\lambda - K^*) \) have the same (finite) dimension.
</div>

The Fredholm Alternative generalizes the classical theorem for matrices to infinite dimensions, with one critical caveat: \( 0 \) may be in the spectrum of a compact operator without being an eigenvalue (for example, the Volterra operator on \( L^2[0,1] \)). The non-zero spectrum of a compact operator consists entirely of eigenvalues accumulating only at \( 0 \).

## 3.3 Hilbert Space Operators: Adjoints and Classes

Hilbert space provides richer structure than a general Banach space, primarily because the inner product defines an adjoint.

<div class="definition">
Let \( H \) be a Hilbert space and \( T \in B(H) \). The <strong>adjoint</strong> \( T^* \in B(H) \) is the unique operator satisfying \( \langle Tx, y \rangle = \langle x, T^*y \rangle \) for all \( x, y \in H \). Its existence follows from the Riesz representation theorem: for fixed \( y \), \( x \mapsto \langle Tx, y \rangle \) is a bounded linear functional.
</div>

The adjoint operation satisfies \( (S+T)^* = S^*+T^* \), \( (ST)^* = T^*S^* \), \( (T^*)^* = T \), \( \|\lambda T\|^* = \bar\lambda T^* \), and crucially the **C\*-identity**:

\[
\|T^*T\| = \|T\|^2.
\]

This single identity has profound algebraic consequences and characterizes C\*-algebras among Banach \*-algebras.

The adjoint operation allows us to define several important classes of operators:

<div class="definition">
An operator \( T \in B(H) \) is:
<ul>
<li><strong>self-adjoint</strong> (Hermitian) if \( T^* = T \);</li>
<li><strong>normal</strong> if \( T^*T = TT^* \);</li>
<li><strong>unitary</strong> if \( T^*T = TT^* = I \) (equivalently, \( T \) is a surjective isometry);</li>
<li><strong>a projection</strong> if \( T^2 = T = T^* \) (orthogonal projection onto a closed subspace);</li>
<li><strong>a partial isometry</strong> if \( T^*T \) is a projection (the <em>initial projection</em>), in which case \( TT^* \) is also a projection (the <em>final projection</em>).</li>
</ul>
</div>

Self-adjoint operators have real spectra: if \( T = T^* \), then \( \sigma(T) \subseteq \mathbb{R} \). Normal operators satisfy \( \|Tx\|^2 = \langle T^*Tx, x \rangle = \langle TT^*x, x \rangle = \|T^*x\|^2 \), showing \( \ker T = \ker T^* \). The spectral theorem for normal operators is the culminating result of the chapter.

## 3.4 The Spectral Theorem for Compact Normal Operators

<div class="theorem">
<strong>Spectral Theorem for Compact Normal Operators.</strong> Let \( K \in B(H) \) be compact and normal. Then there exists an orthonormal system \( \{e_n\}_{n=1}^\infty \) (finite or countably infinite) and scalars \( \lambda_n \to 0 \) (if infinite) such that

\[
K = \sum_n \lambda_n \langle \cdot, e_n \rangle e_n
\]

with convergence in norm. The \( \lambda_n \) are the nonzero eigenvalues of \( K \), and \( He_n = \lambda_n e_n \).
</div>

For compact self-adjoint operators this reduces to the classical diagonalization theorem from linear algebra, generalized to infinite dimensions. The key ingredients are: eigenvectors for distinct eigenvalues of a normal operator are orthogonal; nonzero eigenvalues of a compact operator have finite-dimensional eigenspaces; these eigenvalues form an at-most-countable set accumulating only at zero.

## 3.5 Fredholm Theory and the Essential Spectrum

An operator \( T \in B(H) \) is **Fredholm** if both \( \ker T \) and \( H / \overline{\text{ran}\, T} \) (equivalently, \( \ker T^* \)) are finite-dimensional. The **Fredholm index** is

\[
\text{ind}(T) = \dim \ker T - \dim \ker T^*.
\]

<div class="theorem">
<strong>Atkinson's Theorem.</strong> \( T \in B(H) \) is Fredholm if and only if its image in the Calkin algebra \( B(H)/K(H) \) is invertible.
</div>

This theorem reframes Fredholm theory in terms of invertibility in a quotient algebra, connecting it naturally to the spectral theory of the Calkin algebra. The **essential spectrum** of \( T \) is

\[
\sigma_e(T) = \sigma(T + K(H)) \subset \mathbb{C},
\]

where \( \sigma(T + K(H)) \) is the spectrum in the Calkin algebra. Equivalently, \( \lambda \in \sigma_e(T) \) iff \( \lambda I - T \) is not Fredholm. The index is stable under compact perturbations and under norm-continuous deformation within the Fredholm operators, making it an important topological invariant.

<div class="theorem">
<strong>Index Theorem.</strong> The map \( T \mapsto \text{ind}(T) \) is constant on connected components of the Fredholm operators, and \( \text{ind}(ST) = \text{ind}(S) + \text{ind}(T) \) for Fredholm \( S \) and \( T \).
</div>

---

# Chapter 4: Abelian Banach Algebras

## 4.1 Characters and the Maximal Ideal Space

The Gelfand theory transforms the study of commutative Banach algebras into classical function theory, representing every commutative unital Banach algebra as an algebra of continuous functions.

<div class="definition">
Let \( \mathcal{A} \) be a commutative unital Banach algebra. A <strong>character</strong> (or <em>multiplicative linear functional</em>) is a nonzero algebra homomorphism \( \phi : \mathcal{A} \to \mathbb{C} \). The <strong>maximal ideal space</strong> (or <em>Gelfand spectrum</em> or <em>character space</em>) is

\[
\Omega(\mathcal{A}) = \{\phi : \mathcal{A} \to \mathbb{C} \mid \phi \text{ is a character}\}.
\]
</div>

Every character is automatically bounded with \( \|\phi\| \le 1 \) (in fact \( = 1 \) if \( \mathcal{A} \) is unital), since \( \phi(a^{-1})\phi(a) = \phi(e) = 1 \) forces \( |\phi(a)| \le \|a\| \) for all \( a \). Characters are in bijective correspondence with maximal ideals: \( \phi \leftrightarrow \ker \phi \). Since characters lie in the unit ball of \( \mathcal{A}^* \), the Banach-Alaoglu theorem endows \( \Omega(\mathcal{A}) \) with the induced weak\* topology, making it a compact Hausdorff space.

<div class="theorem">
For \( a \in \mathcal{A} \), \( \lambda \in \sigma(a) \) if and only if there exists \( \phi \in \Omega(\mathcal{A}) \) with \( \phi(a) = \lambda \). Equivalently,

\[
\sigma(a) = \{\phi(a) : \phi \in \Omega(\mathcal{A})\}.
\]
</div>

## 4.2 The Gelfand Transform

<div class="definition">
The <strong>Gelfand transform</strong> of \( a \in \mathcal{A} \) is the function \( \hat{a} : \Omega(\mathcal{A}) \to \mathbb{C} \) defined by \( \hat{a}(\phi) = \phi(a) \). The map \( a \mapsto \hat{a} \) is the <strong>Gelfand representation</strong>

\[
\Gamma : \mathcal{A} \to C(\Omega(\mathcal{A})), \quad \Gamma(a) = \hat{a}.
\]
</div>

The Gelfand transform \( \Gamma \) is a norm-decreasing algebra homomorphism. Its kernel is the **Jacobson radical** \( \text{rad}(\mathcal{A}) = \bigcap \{ M : M \text{ is a maximal ideal of } \mathcal{A} \} \). When \( \text{rad}(\mathcal{A}) = \{0\} \), \( \mathcal{A} \) is called **semisimple** and \( \Gamma \) is injective. Note that \( \|\hat{a}\|_\infty = \sup_\phi |\phi(a)| = r(a) \), the spectral radius — so \( \Gamma \) is isometric iff \( \|a\|^2 = \|a^2\| \) for all \( a \), which is the key C*-condition.

## 4.3 Examples: \( C(X) \) and Gelfand-Naimark

<div class="example">
For \( \mathcal{A} = C(X) \) with \( X \) compact Hausdorff, the characters are precisely the evaluation maps \( \text{ev}_x : f \mapsto f(x) \), so \( \Omega(C(X)) \cong X \) homeomorphically, and the Gelfand transform is the identity \( f \mapsto f \). The Gelfand-Naimark theorem (for commutative C*-algebras) states that every commutative unital C*-algebra is isometrically \( * \)-isomorphic to \( C(\Omega(\mathcal{A})) \) for a compact Hausdorff space \( \Omega(\mathcal{A}) \), so that \( C(X) \) algebras are in fact the <em>only</em> commutative unital C*-algebras.
</div>

## 4.4 The Jacobson Radical

In a general (possibly non-semisimple) commutative Banach algebra, the Jacobson radical measures the "non-function-like" part. An element \( a \in \mathcal{A} \) lies in \( \text{rad}(\mathcal{A}) \) if and only if \( r(a) = 0 \), i.e., \( \lim_n \|a^n\|^{1/n} = 0 \) — such elements are called **quasinilpotent**. In \( C^* \)-algebras (to be defined), \( \text{rad}(\mathcal{A}) = \{0\} \) automatically, so all C*-algebras are semisimple.

## 4.5 Wiener's Theorem

A striking application of the Gelfand theory is Wiener's theorem on absolutely convergent Fourier series.

<div class="theorem">
<strong>Wiener's Theorem.</strong> Let \( f \in W(\mathbb{T}) \) (the Wiener algebra of functions with absolutely convergent Fourier series) and suppose \( f(t) \ne 0 \) for all \( t \in \mathbb{T} \). Then \( 1/f \in W(\mathbb{T}) \).
</div>

<div class="proof">
The Wiener algebra \( W \) is a commutative unital Banach algebra under pointwise multiplication. We identify its characters: since evaluation at each point \( t \in \mathbb{T} \) is a character, and these are the only characters (as \( W \) is a function algebra on \( \mathbb{T} \)), we have \( \Omega(W) \cong \mathbb{T} \). The function \( f \) is invertible in \( W \) iff \( \hat{f}(\phi) = \phi(f) \ne 0 \) for all \( \phi \in \Omega(W) \), iff \( f(t) \ne 0 \) for all \( t \in \mathbb{T} \) — which is our hypothesis. By Gelfand theory, \( f \in W^{-1} \), i.e., \( 1/f \in W \).
</div>

This proof, due to Gelfand himself, replaces Wiener's original intricate real-variable argument with a three-line abstract argument. It is one of the finest illustrations of the power of the Gelfand theory.

---

# Chapter 5: C\*-Algebras

## 5.1 Definitions and First Properties

C\*-algebras are Banach algebras with an involution satisfying the C\*-identity. They are simultaneously the most natural and the most tractable class of operator algebras.

<div class="definition">
A <strong>C\*-algebra</strong> is a Banach algebra \( \mathcal{A} \) over \( \mathbb{C} \) equipped with an <strong>involution</strong> \( * : \mathcal{A} \to \mathcal{A} \) satisfying:
<ol>
<li>\( (a+b)^* = a^* + b^* \)</li>
<li>\( (\lambda a)^* = \bar{\lambda} a^* \)</li>
<li>\( (ab)^* = b^* a^* \)</li>
<li>\( (a^*)^* = a \)</li>
<li>The <strong>C\*-identity</strong>: \( \|a^*a\| = \|a\|^2 \).</li>
</ol>
</div>

The C\*-identity encodes both algebraic and metric information. From it one derives \( \|a^*\| = \|a\| \) (since \( \|a\|^2 = \|a^*a\| \le \|a^*\|\|a\| \) gives \( \|a\| \le \|a^*\| \), and by symmetry equality holds). A \( * \)-algebra satisfying the C\*-identity is automatically a Banach algebra once the norm is complete.

<div class="remark">
There is a fundamental distinction between <em>abstract</em> and <em>concrete</em> C\*-algebras. A concrete C\*-algebra is a closed \( * \)-subalgebra of \( B(H) \) for some Hilbert space \( H \). An abstract C\*-algebra is defined axiomatically as above. The Gelfand-Naimark theorem asserts that every abstract C\*-algebra is isometrically \( * \)-isomorphic to a concrete one, collapsing this distinction.
</div>

The first major structural result is that C\*-algebra homomorphisms are automatically isometries if injective:

<div class="theorem">
Every \( * \)-homomorphism \( \pi : \mathcal{A} \to \mathcal{B} \) between C\*-algebras satisfies \( \|\pi(a)\| \le \|a\| \). If \( \pi \) is injective, it is isometric.
</div>

This striking rigidity means C\*-algebras have essentially unique norms: if an algebra admits a C\*-norm, it admits exactly one (up to completing).

## 5.2 Elements of C\*-Algebras

The involution allows us to decompose and classify elements.

<div class="definition">
In a C\*-algebra \( \mathcal{A} \):
<ul>
<li>\( a \) is <strong>self-adjoint</strong> if \( a^* = a \). Every \( a \in \mathcal{A} \) decomposes uniquely as \( a = \text{Re}(a) + i \, \text{Im}(a) \) with \( \text{Re}(a) = (a + a^*)/2 \) and \( \text{Im}(a) = (a - a^*)/(2i) \) self-adjoint.</li>
<li>\( a \) is <strong>normal</strong> if \( a^*a = aa^* \).</li>
<li>\( a \) is <strong>positive</strong>, written \( a \ge 0 \), if \( a = b^*b \) for some \( b \in \mathcal{A} \) (equivalently, \( a \) is self-adjoint with \( \sigma(a) \subseteq [0, \infty) \)).</li>
<li>\( p \) is a <strong>projection</strong> if \( p^2 = p = p^* \).</li>
<li>\( v \) is a <strong>partial isometry</strong> if \( v^*v \) is a projection.</li>
</ul>
</div>

The positive elements form a closed convex cone \( \mathcal{A}_+ = \{a \in \mathcal{A} : a \ge 0\} \). Every positive element has a unique positive square root: for \( a \ge 0 \), there exists a unique \( b \ge 0 \) with \( b^2 = a \), obtained via the continuous functional calculus applied to \( t \mapsto \sqrt{t} \) on \( \sigma(a) \subseteq [0,\infty) \). The positive cone defines a partial order: \( a \le b \) iff \( b - a \ge 0 \).

## 5.3 Ideals and Quotients

<div class="theorem">
Every closed two-sided ideal \( \mathcal{I} \) of a C\*-algebra \( \mathcal{A} \) is self-adjoint (\( \mathcal{I}^* = \mathcal{I} \)), and the quotient \( \mathcal{A}/\mathcal{I} \) is a C\*-algebra under the quotient norm.
</div>

The self-adjointness of ideals uses the approximate identity: every C\*-algebra has a bounded approximate identity \( (e_\lambda) \) with \( e_\lambda \ge 0 \), \( \|e_\lambda\| \le 1 \), and \( e_\lambda a \to a \) for all \( a \). For a closed ideal \( \mathcal{I} \), if \( a \in \mathcal{I} \) then \( a^* = \lim_\lambda a^* e_\lambda \in \mathcal{I} \) since \( a^* e_\lambda = (e_\lambda a)^* \in \mathcal{I} \). The C\*-identity in the quotient follows from the identity \( \|a + \mathcal{I}\|^2 = \|a^*a + \mathcal{I}\| \), which requires careful verification.

## 5.4 Positive Linear Functionals and States

<div class="definition">
A linear functional \( \phi : \mathcal{A} \to \mathbb{C} \) on a unital C\*-algebra is:
<ul>
<li><strong>positive</strong> if \( \phi(a) \ge 0 \) whenever \( a \ge 0 \);</li>
<li>a <strong>state</strong> if \( \phi \) is positive and \( \phi(e) = 1 \);</li>
<li>a <strong>pure state</strong> if \( \phi \) is a state that cannot be written as a proper convex combination of states.</li>
</ul>
</div>

Every positive linear functional is bounded, with \( \|\phi\| = \phi(e) \) for unital \( \mathcal{A} \). The set of states \( S(\mathcal{A}) \) is a weak\* compact convex subset of the unit ball of \( \mathcal{A}^* \). By the Krein-Milman theorem, \( S(\mathcal{A}) \) is the weak\* closed convex hull of its extreme points — the pure states \( P(\mathcal{A}) \).

A key example: for \( \mathcal{A} = B(H) \) and a unit vector \( \xi \in H \), the functional \( \omega_\xi(T) = \langle T\xi, \xi \rangle \) is a state. These "vector states" are pure states when \( \mathcal{A} = B(H) \) (since \( B(H) \) is a factor); in general, pure states of a C\*-algebra correspond to irreducible representations.

## 5.5 The GNS Construction

The GNS (Gelfand-Naimark-Segal) construction is the fundamental method for building Hilbert space representations from states, and is the cornerstone of the abstract theory.

<div class="theorem">
<strong>GNS Construction.</strong> Let \( \mathcal{A} \) be a unital C\*-algebra and \( \phi \) a state on \( \mathcal{A} \). There exists a Hilbert space \( H_\phi \), a unit vector \( \xi_\phi \in H_\phi \), and a \( * \)-representation \( \pi_\phi : \mathcal{A} \to B(H_\phi) \) such that:
<ol>
<li>\( \phi(a) = \langle \pi_\phi(a) \xi_\phi, \xi_\phi \rangle \) for all \( a \in \mathcal{A} \);</li>
<li>\( H_\phi = \overline{\pi_\phi(\mathcal{A}) \xi_\phi} \) (cyclicity: \( \xi_\phi \) is a cyclic vector).</li>
</ol>
The triple \( (H_\phi, \pi_\phi, \xi_\phi) \) is unique up to unitary equivalence.
</div>

<div class="proof">
The key idea is to turn \( \mathcal{A} \) itself into an inner product space. Define a sesquilinear form on \( \mathcal{A} \) by \( \langle a, b \rangle = \phi(b^*a) \). Positivity of \( \phi \) gives \( \langle a, a \rangle \ge 0 \). The Cauchy-Schwarz inequality shows that the <strong>left kernel</strong> \( N_\phi = \{a \in \mathcal{A} : \phi(a^*a) = 0\} \) is a closed left ideal. The quotient \( \mathcal{A}/N_\phi \) with inner product \( \langle a + N_\phi, b + N_\phi \rangle = \phi(b^*a) \) is a pre-Hilbert space; complete it to obtain \( H_\phi \). Let \( \xi_\phi = e + N_\phi \). The left multiplication action \( \pi_\phi(a)(b + N_\phi) = ab + N_\phi \) extends to \( B(H_\phi) \) and satisfies the required properties.
</div>

<div class="example">
For \( \mathcal{A} = C(\mathbb{T}) \) and \( \phi(f) = \int_\mathbb{T} f \, d\mu \) (integration against a Borel probability measure \( \mu \)), the GNS Hilbert space is \( L^2(\mathbb{T}, \mu) \), the cyclic vector is the constant function \( 1 \), and \( \pi_\phi(f) \) is the multiplication operator \( M_f \).
</div>

## 5.6 The Gelfand-Naimark Theorem

The universal representation assembles all GNS representations simultaneously.

<div class="definition">
The <strong>universal representation</strong> of \( \mathcal{A} \) is

\[
\pi_u = \bigoplus_{\phi \in S(\mathcal{A})} \pi_\phi : \mathcal{A} \to B\!\left(\bigoplus_{\phi \in S(\mathcal{A})} H_\phi\right).
\]
</div>

<div class="theorem">
<strong>Gelfand-Naimark Theorem.</strong> Every C\*-algebra \( \mathcal{A} \) is isometrically \( * \)-isomorphic to a closed \( * \)-subalgebra of \( B(H) \) for some Hilbert space \( H \). In particular, every abstract C\*-algebra is a concrete one.
</div>

<div class="proof">
The universal representation \( \pi_u \) is faithful (injective): for any nonzero \( a \in \mathcal{A} \), the linear functional \( \phi(b) = \|a\|^{-2}\phi_0(a^*ba) \) (for a suitable state \( \phi_0 \) with \( \phi_0(a^*a) = \|a^*a\| = \|a\|^2 \)) satisfies \( \phi(e) = 1 \) and lies in \( S(\mathcal{A}) \). Then \( \|\pi_\phi(a)\xi_\phi\|^2 = \phi(a^*a) = \|a\|^2/\|a\|^2 \cdot \|a\|^2 = \|a\|^2 \), so \( \pi_\phi(a) \ne 0 \). Since \( \pi_u \) is an injective \( * \)-homomorphism between C\*-algebras, it is isometric.
</div>

---

# Chapter 6: Von Neumann Algebras

## 6.1 Operator Topologies

On \( B(H) \), the norm topology is too fine for many purposes — in particular, limits of sequences of projections and spectral decompositions live most naturally in weaker topologies.

<div class="definition">
The <strong>strong operator topology</strong> (SOT) on \( B(H) \) is defined by the seminorms \( T \mapsto \|Tx\| \) for each \( x \in H \): a net \( T_\alpha \xrightarrow{\text{SOT}} T \) iff \( \|T_\alpha x - Tx\| \to 0 \) for all \( x \in H \).

The <strong>weak operator topology</strong> (WOT) is defined by the seminorms \( T \mapsto |\langle Tx, y \rangle| \) for each \( x, y \in H \): \( T_\alpha \xrightarrow{\text{WOT}} T \) iff \( \langle T_\alpha x, y \rangle \to \langle Tx, y \rangle \) for all \( x, y \in H \).
</div>

We have: norm topology \( \supset \) SOT \( \supset \) WOT (each is strictly coarser). On bounded sets, both the SOT and WOT are metrizable when \( H \) is separable. Multiplication is SOT-continuous in each variable separately on bounded sets but not jointly. The adjoint is WOT-continuous but not SOT-continuous in general.

## 6.2 Von Neumann Algebras: Definition and Double Commutant

<div class="definition">
For \( S \subseteq B(H) \), the <strong>commutant</strong> of \( S \) is

\[
S' = \{T \in B(H) : TS = ST \text{ for all } S \in S\}.
\]

The <strong>double commutant</strong> (or <strong>bicommutant</strong>) is \( S'' = (S')' \). A <strong>von Neumann algebra</strong> is a \( * \)-subalgebra \( \mathcal{M} \subseteq B(H) \) satisfying \( \mathcal{M}'' = \mathcal{M} \) (equivalently, \( \mathcal{M} = \mathcal{M}'' \)).
</div>

<div class="theorem">
<strong>Von Neumann Double Commutant Theorem.</strong> Let \( \mathcal{M} \subseteq B(H) \) be a unital \( * \)-subalgebra. Then the following are equivalent:
<ol>
<li>\( \mathcal{M} = \mathcal{M}'' \);</li>
<li>\( \mathcal{M} \) is closed in the strong operator topology;</li>
<li>\( \mathcal{M} \) is closed in the weak operator topology.</li>
</ol>
</div>

This theorem, von Neumann's central contribution, shows that von Neumann algebras are exactly the WOT-closed (equivalently, SOT-closed) unital \( * \)-subalgebras of \( B(H) \). They are thus closed under strong limits of bounded nets — in particular, under the formation of spectral projections. This is what makes von Neumann algebras the natural home for spectral theory.

<div class="proof">
We sketch the key step: \( \mathcal{M}'' \subseteq \overline{\mathcal{M}}^{\text{SOT}} \). Fix \( T \in \mathcal{M}'' \), vectors \( x_1, \ldots, x_n \in H \), and \( \varepsilon > 0 \). We show there exists \( S \in \mathcal{M} \) with \( \|Sx_j - Tx_j\| < \varepsilon \) for all \( j \). Consider the amplification: let \( \tilde{H} = H^n = H \oplus \cdots \oplus H \) and for \( A \in B(H) \) let \( \tilde{A} = A \oplus \cdots \oplus A \in B(\tilde{H}) \). The projection \( P \) onto the SOT-closure of \( \tilde{\mathcal{M}} \tilde{x} \) (where \( \tilde{x} = (x_1,\ldots,x_n) \)) lies in \( \tilde{\mathcal{M}}' \) and in particular commutes with \( \tilde{T} \). Since \( \tilde{x} \in \overline{\tilde{\mathcal{M}}\tilde{x}} \), we have \( \tilde{T}\tilde{x} \in \overline{\tilde{\mathcal{M}}\tilde{x}} \), giving the desired \( S \).
</div>

<div class="example">
<strong>Examples of von Neumann algebras.</strong> (i) \( B(H) \) itself; its commutant is \( \mathbb{C} I \) (by Schur's lemma, as \( H \) is irreducible). (ii) \( L^\infty(\Omega, \mu) \) acting on \( L^2(\Omega,\mu) \) by multiplication operators \( M_f \): this is an abelian von Neumann algebra and its double commutant is itself. (iii) The group von Neumann algebra \( L(G) \) generated by the left regular representation of a discrete group \( G \) on \( \ell^2(G) \). (iv) Any maximal abelian self-adjoint subalgebra (MASA) of \( B(H) \).
</div>

## 6.3 The Spectral Theorem for Normal Operators

The full spectral theorem for (not necessarily compact) normal operators requires the notion of spectral measures. This is the correct generalization of the diagonal matrix theorem to infinite-dimensional Hilbert space.

<div class="definition">
Let \( H \) be a Hilbert space and \( \Omega \) a locally compact Hausdorff space with Borel \( \sigma \)-algebra \( \mathcal{B}(\Omega) \). A <strong>spectral measure</strong> (or <em>projection-valued measure</em>) on \( \Omega \) is a map \( E : \mathcal{B}(\Omega) \to B(H) \) such that:
<ol>
<li>Each \( E(\Delta) \) is an orthogonal projection;</li>
<li>\( E(\varnothing) = 0 \) and \( E(\Omega) = I \);</li>
<li>\( E(\Delta_1 \cap \Delta_2) = E(\Delta_1) E(\Delta_2) \) (multiplicativity);</li>
<li>For any \( x, y \in H \), the map \( \Delta \mapsto \langle E(\Delta) x, y \rangle \) is a complex Borel measure on \( \Omega \) (countable additivity).</li>
</ol>
</div>

Given a spectral measure \( E \), one integrates bounded Borel functions \( f : \Omega \to \mathbb{C} \) against it to produce operators \( \int_\Omega f \, dE \in B(H) \), defined weakly by

\[
\left\langle \left(\int_\Omega f \, dE\right) x, y \right\rangle = \int_\Omega f \, d\langle E(\cdot) x, y \rangle.
\]

The map \( f \mapsto \int f \, dE \) is a \( * \)-homomorphism from the bounded Borel functions on \( \Omega \) into \( B(H) \).

<div class="theorem">
<strong>Spectral Theorem for Normal Operators.</strong> For every normal operator \( N \in B(H) \), there exists a unique spectral measure \( E \) on \( \sigma(N) \subseteq \mathbb{C} \) such that

\[
N = \int_{\sigma(N)} \lambda \, dE(\lambda).
\]

The \( * \)-algebra generated by \( N \) and \( N^* \) is \( \left\{ \int f \, dE : f \in C(\sigma(N)) \right\} \), and the von Neumann algebra generated by \( N \) is \( \left\{ \int f \, dE : f \in L^\infty(\sigma(N), \|E\|) \right\} \).
</div>

The spectral theorem can be proved via the Gelfand theory applied to the commutative C\*-algebra \( C^*(N) = \overline{\{p(N, N^*) : p \text{ polynomial in two variables}\}} \). Since \( N \) is normal, this algebra is commutative, so by the commutative Gelfand-Naimark theorem it is isometrically \( * \)-isomorphic to \( C(\sigma(N)) \). The spectral measure then arises as the composition of this isomorphism with the Riesz representation of the resulting projection-valued measure.

## 6.4 The Borel Functional Calculus

The spectral theorem yields a powerful functional calculus extending the continuous functional calculus to all bounded Borel functions.

<div class="definition">
For a normal operator \( N \in B(H) \) with spectral measure \( E \), and for any bounded Borel function \( f : \sigma(N) \to \mathbb{C} \), define the <strong>Borel functional calculus</strong>

\[
f(N) = \int_{\sigma(N)} f(\lambda) \, dE(\lambda).
\]
</div>

The Borel functional calculus satisfies: \( f \mapsto f(N) \) is a bounded \( * \)-homomorphism from \( L^\infty(\sigma(N), E) \) into \( B(H) \) that extends both the polynomial and continuous functional calculi. It allows constructions like: characteristic functions \( f = \mathbf{1}_\Delta \) give projections \( E(\Delta) \) (the spectral projections of \( N \)); the function \( f(\lambda) = \bar\lambda / |\lambda| \) on \( \sigma(N) \setminus \{0\} \) gives the partial isometry in the polar decomposition of \( N \).

Key consequences: if \( N = N^* \) (self-adjoint), then \( \sigma(N) \subseteq \mathbb{R} \), and for any \( t \in \mathbb{R} \) the spectral projection \( E((-\infty, t]) \) is the "spectral resolution" of \( N \), giving the von Neumann spectral decomposition \( N = \int_\mathbb{R} \lambda \, dE_\lambda \) in terms of the resolution of the identity \( E_\lambda = E((-\infty, \lambda]) \).

---

# Appendix A: Essential Spectrum

The essential spectrum captures the "large-scale" spectral behavior of an operator, insensitive to compact perturbations.

<div class="definition">
For \( T \in B(H) \), the <strong>essential spectrum</strong> \( \sigma_e(T) \) is defined in any of the following equivalent ways:
<ol>
<li>\( \sigma_e(T) = \sigma(T + K(H)) \) in the Calkin algebra \( B(H)/K(H) \);</li>
<li>\( \sigma_e(T) = \{\lambda \in \mathbb{C} : \lambda - T \text{ is not Fredholm}\} \);</li>
<li>\( \sigma_e(T) = \bigcap_{K \in K(H)} \sigma(T + K) \) (Weyl's theorem for self-adjoint \( T \)).</li>
</ol>
</div>

The essential spectrum is a closed subset of \( \sigma(T) \) and is invariant under compact perturbations: \( \sigma_e(T) = \sigma_e(T + K) \) for any compact \( K \). For self-adjoint \( T \), the "discrete spectrum" \( \sigma_d(T) = \sigma(T) \setminus \sigma_e(T) \) consists of isolated eigenvalues of finite multiplicity. The spectral theorem then decomposes \( H = H_e \oplus \bigoplus_n \mathbb{C} e_n \) where \( T \upharpoonright H_e \) has purely essential spectrum and \( T e_n = \lambda_n e_n \) for the discrete eigenvalues.

<div class="theorem">
<strong>Weyl's Theorem.</strong> For self-adjoint \( T \in B(H) \), \( \lambda \in \sigma_e(T) \) if and only if there exists a sequence of unit vectors \( (x_n) \) with \( x_n \xrightarrow{w} 0 \) (weak convergence to zero) and \( (T - \lambda)x_n \to 0 \) in norm.
</div>

Such a sequence is called a **Weyl sequence** or **singular sequence** for \( \lambda \). The absence of a strongly convergent subsequence (implied by weak convergence to zero) is what distinguishes essential spectrum from discrete eigenvalues.

---

# Appendix B: Von Neumann Algebras as Dual Spaces

Von Neumann algebras, unlike general C\*-algebras, have a canonical predual — they are themselves dual Banach spaces. This extra structure profoundly enriches the theory.

<div class="definition">
The <strong>predual</strong> of \( B(H) \) is the space of <strong>trace-class operators</strong>

\[
B(H)_* = \mathcal{L}^1(H) = \left\{ A \in B(H) : \|A\|_1 = \text{tr}(|A|) < \infty \right\},
\]

where \( |A| = (A^*A)^{1/2} \) and the trace is \( \text{tr}(A) = \sum_n \langle Ae_n, e_n \rangle \) for any orthonormal basis \( (e_n) \). The duality is \( \langle T, \rho \rangle = \text{tr}(\rho T) \) for \( T \in B(H) \) and \( \rho \in \mathcal{L}^1(H) \).
</div>

Under this duality, \( B(H) \cong \mathcal{L}^1(H)^* \) isometrically, and the WOT on bounded sets of \( B(H) \) coincides with the weak\* topology induced by \( \mathcal{L}^1(H) \).

<div class="definition">
For a von Neumann algebra \( \mathcal{M} \subseteq B(H) \), the <strong>predual</strong> \( \mathcal{M}_* \) is the closed subspace of \( \mathcal{L}^1(H) \) consisting of those \( \rho \) for which \( T \mapsto \text{tr}(\rho T) \) is WOT-continuous on \( \mathcal{M} \). A linear functional \( \phi \in \mathcal{M}^* \) is called <strong>normal</strong> if it is WOT-continuous on bounded sets; these are precisely the elements of \( \mathcal{M}_* \).
</div>

<div class="theorem">
<strong>Sakai's Theorem.</strong> A C\*-algebra \( \mathcal{A} \) is (isometrically \( * \)-isomorphic to) a von Neumann algebra if and only if \( \mathcal{A} \) is a dual Banach space (i.e., there exists a Banach space \( X \) with \( \mathcal{A} \cong X^* \) isometrically).
</div>

Sakai's theorem provides a predual characterization of von Neumann algebras that is intrinsic — not depending on a particular Hilbert space representation. It opens the door to abstract, representation-free treatments of von Neumann algebras. The predual of a von Neumann algebra is unique (up to isometric isomorphism), a deep result due to Sakai. Normal states — positive normal functionals of norm one — play the role of density matrices in quantum mechanics, making this formalism central to mathematical physics.

<div class="remark">
The predual structure has important consequences for the classification theory of von Neumann algebras. The type decomposition (types I, II, III) of von Neumann algebras is defined in terms of the projection lattice and the presence of trace-class or semifinite traces. For instance, \( B(H) \) is a type \( \text{I}_\infty \) factor; the hyperfinite II\(_1\) factor \( R \) (the unique amenable II\(_1\) factor, by Connes's theorem) carries a faithful normal tracial state \( \tau \) with \( \tau(1) = 1 \) and the predual \( R_* \) admits a rich structure of normal functionals crucial to Tomita-Takesaki modular theory.
</div>
