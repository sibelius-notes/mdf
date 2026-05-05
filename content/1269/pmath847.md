---
made_up: true
title: "PMATH 847: Geometric Representation Theory"
subjects: "PMATH"
---

*These notes synthesize material from N. Chriss and V. Ginzburg's Representation Theory and Complex Geometry, R. Hotta, K. Takeuchi, and T. Tanisaki's D-Modules, Perverse Sheaves, and Representation Theory, P. Etingof et al.'s Introduction to Representation Theory, and G. Lusztig's Introduction to Quantum Groups, enriched with material from MIT 18.758 and D. Ben-Zvi's lecture notes.*

---

## Chapter 1: Algebraic Groups and Flag Varieties

Geometric representation theory begins with a fundamental insight: many of the deepest results in the representation theory of Lie algebras and related structures can be understood, and indeed proved, by studying the geometry of certain algebraic varieties naturally attached to a reductive group. Chief among these is the flag variety \(G/B\), whose rich geometric structure — Schubert cells, line bundles, intersection theory — encodes an enormous amount of representation-theoretic information. In this opening chapter, we develop the algebraic-group foundations that support the entire edifice.

### 1.1 Linear Algebraic Groups

We work over an algebraically closed field \(k\) of characteristic zero (typically \(k = \mathbb{C}\)).

<div class="definition">
A <strong>linear algebraic group</strong> is a Zariski-closed subgroup \(G \subseteq \mathrm{GL}_n(k)\) for some \(n\). Equivalently, it is an affine algebraic variety equipped with morphisms \(\mu: G \times G \to G\) (multiplication) and \(\iota: G \to G\) (inversion) that make it into a group, together with an identity element \(e \in G\).
</div>

The basic examples pervade all of mathematics.

<div class="example">
<strong>Classical groups.</strong> The following are linear algebraic groups:
<ul>
<li>\(\mathrm{GL}_n(k)\), the general linear group, defined as the open (hence affine) subset \(\{\det \neq 0\} \subseteq M_n(k)\).</li>
<li>\(\mathrm{SL}_n(k) = \{g \in \mathrm{GL}_n(k) : \det(g) = 1\}\), the special linear group.</li>
<li>\(\mathrm{SO}_n(k) = \{g \in \mathrm{SL}_n(k) : g^T g = I\}\), the special orthogonal group.</li>
<li>\(\mathrm{Sp}_{2n}(k) = \{g \in \mathrm{GL}_{2n}(k) : g^T J g = J\}\) where \(J = \begin{pmatrix} 0 & I_n \\ -I_n & 0 \end{pmatrix}\), the symplectic group.</li>
</ul>
</div>

A morphism of algebraic groups is a group homomorphism that is simultaneously a morphism of algebraic varieties. A key structural result is the Jordan decomposition: every element \(g \in G\) can be uniquely written as \(g = g_s g_u\) where \(g_s\) is semisimple (diagonalizable) and \(g_u\) is unipotent, and the two commute.

### 1.2 Tori, Borel Subgroups, and Root Systems

The internal structure of a reductive algebraic group is governed by its tori and Borel subgroups.

<div class="definition">
A <strong>torus</strong> is an algebraic group isomorphic to \((\mathbb{G}_m)^r = (k^\times)^r\) for some \(r \geq 0\). A <strong>maximal torus</strong> \(T \subseteq G\) is a torus not properly contained in any other torus.
</div>

All maximal tori in a connected reductive group are conjugate — this is a fundamental theorem whose proof uses the completeness of the flag variety (established below). The common dimension \(r = \dim T\) is called the <strong>rank</strong> of \(G\).

<div class="example">
For \(G = \mathrm{GL}_n(k)\), a maximal torus is the group of diagonal matrices

\[
T = \left\{ \begin{pmatrix} t_1 & & \\ & \ddots & \\ & & t_n \end{pmatrix} : t_i \in k^\times \right\} \cong (\mathbb{G}_m)^n.
\]
For \(G = \mathrm{SL}_n(k)\), the maximal torus is the subgroup of diagonal matrices with determinant 1, so it has rank \(n-1\).
</div>

The character lattice \(X^*(T) = \mathrm{Hom}(T, \mathbb{G}_m)\) and the cocharacter lattice \(X_*(T) = \mathrm{Hom}(\mathbb{G}_m, T)\) are free abelian groups of rank \(r\) in natural duality via the pairing \(\langle \chi, \lambda \rangle\) defined by \(\chi \circ \lambda(t) = t^{\langle \chi, \lambda \rangle}\).

The adjoint action of \(T\) on the Lie algebra \(\mathfrak{g} = \mathrm{Lie}(G)\) decomposes \(\mathfrak{g}\) into weight spaces:

\[
\mathfrak{g} = \mathfrak{t} \oplus \bigoplus_{\alpha \in \Phi} \mathfrak{g}_\alpha
\]
where \(\mathfrak{t} = \mathrm{Lie}(T)\) is the zero weight space and \(\Phi \subset X^*(T) \setminus \{0\}\) is the set of <strong>roots</strong>.

<div class="definition">
The set \(\Phi\) together with the lattice \(X^*(T)\) forms a <strong>root system</strong>. A choice of <strong>positive roots</strong> \(\Phi^+\) determines a set of <strong>simple roots</strong> \(\Delta = \{\alpha_1, \ldots, \alpha_r\}\), the indecomposable positive roots. Every positive root is a non-negative integer linear combination of simple roots.
</div>

<div class="example">
For \(G = \mathrm{SL}_n(k)\) with the diagonal torus \(T\), let \(\varepsilon_i \in X^*(T)\) extract the \(i\)-th diagonal entry. The roots are \(\Phi = \{\varepsilon_i - \varepsilon_j : i \neq j\}\). With the standard choice of positive roots \(\Phi^+ = \{\varepsilon_i - \varepsilon_j : i < j\}\), the simple roots are \(\Delta = \{\varepsilon_1 - \varepsilon_2, \varepsilon_2 - \varepsilon_3, \ldots, \varepsilon_{n-1} - \varepsilon_n\}\). This is the root system of type \(A_{n-1}\).
</div>

<div class="definition">
A <strong>Borel subgroup</strong> \(B \subseteq G\) is a maximal connected solvable closed subgroup. All Borel subgroups are conjugate.
</div>

Given a choice of positive roots \(\Phi^+\), the corresponding Borel subgroup is \(B = TU\), where \(U\) is the unipotent radical generated by the root subgroups \(U_\alpha\) for \(\alpha \in \Phi^+\). In \(\mathrm{SL}_n\), this is the subgroup of upper triangular matrices, and \(U\) is the subgroup of upper triangular unipotent matrices.

### 1.3 The Weyl Group

<div class="definition">
The <strong>Weyl group</strong> of \(G\) (with respect to \(T\)) is \(W = N_G(T)/T\), where \(N_G(T)\) is the normalizer of \(T\) in \(G\).
</div>

The Weyl group is a finite group generated by simple reflections \(s_1, \ldots, s_r\) corresponding to the simple roots. It acts on \(X^*(T)\) and on \(\mathfrak{t}^*\), and is a Coxeter group with respect to the simple reflections.

<div class="example">
For \(G = \mathrm{SL}_n(k)\), the Weyl group \(W \cong S_n\), the symmetric group. The simple reflection \(s_i\) corresponds to the transposition \((i, i+1)\), acting on the diagonal torus by permuting the \(i\)-th and \((i+1)\)-th entries.
</div>

Each element \(w \in W\) has a <strong>length</strong> \(\ell(w)\), which is the minimal number of simple reflections needed to express \(w\). There is a unique longest element \(w_0 \in W\) with \(\ell(w_0) = |\Phi^+|\).

### 1.4 Parabolic Subgroups

<div class="definition">
A <strong>parabolic subgroup</strong> \(P \subseteq G\) is a closed subgroup containing a Borel subgroup. Parabolic subgroups containing a fixed Borel \(B\) are in bijection with subsets \(I \subseteq \Delta\) of the simple roots: to \(I\) one associates the <strong>standard parabolic</strong> \(P_I\) generated by \(B\) and the root subgroups \(U_{-\alpha}\) for \(\alpha \in I\).
</div>

The extreme cases are \(P_\varnothing = B\) and \(P_\Delta = G\). For a parabolic \(P\), the quotient \(G/P\) is a projective variety called a <strong>partial flag variety</strong>.

### 1.5 The Flag Variety and Bruhat Decomposition

The flag variety is the most important geometric object in geometric representation theory.

<div class="definition">
The <strong>flag variety</strong> is the quotient \(\mathcal{B} = G/B\). It is a smooth projective algebraic variety of dimension \(|\Phi^+|\). As a set, it parametrizes all Borel subgroups of \(G\) via the bijection \(gB \mapsto gBg^{-1}\).
</div>

<div class="example">
For \(G = \mathrm{SL}_n(k)\) and \(B\) the upper triangular matrices, the flag variety is

\[
\mathcal{B} = \mathrm{SL}_n / B \cong \{0 = V_0 \subset V_1 \subset \cdots \subset V_n = k^n : \dim V_i = i\},
\]
the variety of complete flags in \(k^n\). For \(\mathrm{SL}_2\), this is \(\mathbb{P}^1\); for \(\mathrm{SL}_3\), it is a three-dimensional variety fibered over \(\mathbb{P}^2\) with fibers \(\mathbb{P}^1\).
</div>

The Bruhat decomposition is the key structural result about the flag variety.

<div class="theorem">
<strong>Bruhat Decomposition.</strong> The flag variety \(G/B\) decomposes as a disjoint union of \(B\)-orbits:

\[
G/B = \bigsqcup_{w \in W} BwB/B.
\]
Each orbit \(C_w = BwB/B\) is isomorphic to affine space \(\mathbb{A}^{\ell(w)}\) and is called a <strong>Schubert cell</strong>. Here we write \(w\) for a representative \(\dot{w} \in N_G(T)\) of the Weyl group element.
</div>

<div class="proof">
<strong>Proof sketch.</strong> We outline the argument in several steps.

<strong>Step 1: The double coset decomposition.</strong> We first establish that \(G = \bigsqcup_{w \in W} BwB\). Consider the action of \(B\) on \(G/B\) by left multiplication. By the structure theory of reductive groups, the \(B\)-orbits on \(G/B\) are indexed by \(W\). More precisely, one shows that any \(g \in G\) can be written in the form \(g = b_1 \dot{w} b_2\) for some \(w \in W\) and \(b_1, b_2 \in B\), using induction on the dimension of \(G\) and the structure of minimal parabolic subgroups.

<strong>Step 2: The cell structure.</strong> For each \(w \in W\), we must show \(BwB/B \cong \mathbb{A}^{\ell(w)}\). Write \(U = \prod_{\alpha \in \Phi^+} U_\alpha\) for the unipotent radical of \(B\). Consider the subgroup

\[
U_w = \prod_{\alpha \in \Phi^+ \cap w(\Phi^-)} U_\alpha.
\]
Then the map \(U_w \to BwB/B\) given by \(u \mapsto uw B\) is an isomorphism of varieties. Since \(|\Phi^+ \cap w(\Phi^-)| = \ell(w)\) (a standard result in root system combinatorics), each factor \(U_\alpha \cong \mathbb{A}^1\) contributes one dimension, giving \(BwB/B \cong \mathbb{A}^{\ell(w)}\).

<strong>Step 3: Disjointness.</strong> If \(BwB = Bw'B\), then \(w^{-1}B w \cap B\) and \(w'^{-1}Bw' \cap B\) have the same image in \(G/B\), which forces \(w = w'\) by an argument involving the \(T\)-fixed points of \(G/B\).
</div>

### 1.6 Schubert Varieties

<div class="definition">
The <strong>Schubert variety</strong> \(X_w\) is the closure of the Schubert cell \(C_w\) in \(G/B\):

\[
X_w = \overline{C_w} = \overline{BwB/B}.
\]
It is an irreducible projective variety of dimension \(\ell(w)\).
</div>

The inclusion relations among Schubert varieties are governed by the Bruhat order:

\[
X_w = \bigsqcup_{v \leq w} C_v
\]
where \(\leq\) denotes the Bruhat order on \(W\). In particular, \(X_{w_0} = G/B\) is the full flag variety, and \(X_e = \{eB\}\) is a single point.

<div class="example">
For \(G = \mathrm{SL}_3\), the Weyl group is \(W = S_3 = \{e, s_1, s_2, s_1 s_2, s_2 s_1, s_1 s_2 s_1\}\) with lengths \(0, 1, 1, 2, 2, 3\). The Schubert varieties give a CW decomposition of the flag variety with cells in dimensions \(0, 1, 1, 2, 2, 3\). The Hasse diagram of the Bruhat order captures the full incidence structure.
</div>

Schubert varieties are generally singular. Their singularities carry deep representation-theoretic information, as we shall see in the chapter on Kazhdan-Lusztig theory.

### 1.7 Line Bundles on the Flag Variety

Each character \(\lambda \in X^*(T)\) extends to a character of \(B\) (trivial on the unipotent radical \(U\)), and thus defines a one-dimensional \(B\)-representation \(k_\lambda\). From this, we construct a line bundle on \(G/B\).

<div class="definition">
The <strong>homogeneous line bundle</strong> \(\mathcal{L}(\lambda)\) on \(G/B\) associated to \(\lambda \in X^*(T)\) is

\[
\mathcal{L}(\lambda) = G \times^B k_{-\lambda},
\]
the quotient of \(G \times k\) by the \(B\)-action \(b \cdot (g, z) = (gb^{-1}, \lambda(b)z)\). This gives a \(G\)-equivariant line bundle on \(G/B\).
</div>

The map \(\lambda \mapsto \mathcal{L}(\lambda)\) is a group homomorphism from \(X^*(T)\) to \(\mathrm{Pic}(G/B)\), and for \(G\) semisimple it is an isomorphism. The global sections \(H^0(G/B, \mathcal{L}(\lambda))\) carry a natural \(G\)-representation.

### 1.8 The Borel-Weil Theorem

The Borel-Weil theorem, proven independently by Armand Borel and André Weil in the 1950s, provides a geometric realization of all irreducible finite-dimensional representations of a reductive group.

<div class="theorem">
<strong>Borel-Weil Theorem.</strong> Let \(\lambda \in X^*(T)\) be a dominant weight (i.e., \(\langle \lambda, \alpha^\vee \rangle \geq 0\) for all simple roots \(\alpha\)). Then:
<ol>
<li>\(H^0(G/B, \mathcal{L}(\lambda))\) is the irreducible \(G\)-representation \(V(\lambda)\) with highest weight \(\lambda\).</li>
<li>If \(\lambda\) is not dominant, then \(H^0(G/B, \mathcal{L}(\lambda)) = 0\).</li>
</ol>
</div>

<div class="proof">
We prove this for \(G = \mathrm{SL}_2(k)\) to illustrate the ideas, then indicate the general argument.

<strong>The case \(G = \mathrm{SL}_2\).</strong> Here \(G/B \cong \mathbb{P}^1\), and dominant weights are non-negative integers \(n \geq 0\). The line bundle \(\mathcal{L}(n)\) is \(\mathcal{O}_{\mathbb{P}^1}(n)\). Its global sections form the space of homogeneous polynomials of degree \(n\) in two variables:

\[
H^0(\mathbb{P}^1, \mathcal{O}(n)) = k[x, y]_n = \mathrm{Span}\{x^n, x^{n-1}y, \ldots, y^n\},
\]
which is the \((n+1)\)-dimensional irreducible representation \(\mathrm{Sym}^n(k^2)\) of \(\mathrm{SL}_2\). For \(n < 0\), we have \(H^0(\mathbb{P}^1, \mathcal{O}(n)) = 0\).

<strong>The general case.</strong> The proof proceeds in several stages:

<em>Non-vanishing.</em> One first shows that \(H^0(G/B, \mathcal{L}(\lambda)) \neq 0\) when \(\lambda\) is dominant. This is done by constructing a non-zero \(B\)-eigensection: the function \(f_\lambda: G \to k\) defined by \(f_\lambda(ub) = \lambda(b)^{-1}\) (for \(u \in U^-\), \(b \in B\), using the open Bruhat cell \(U^- B\)) extends to a regular section of \(\mathcal{L}(\lambda)\).

<em>Highest weight structure.</em> The section \(f_\lambda\) is a highest weight vector of weight \(\lambda\) for the \(G\)-action on \(H^0(G/B, \mathcal{L}(\lambda))\). It is annihilated by the positive root operators in \(\mathfrak{g}\).

<em>Irreducibility.</em> One shows the \(G\)-module generated by \(f_\lambda\) is all of \(H^0(G/B, \mathcal{L}(\lambda))\) by analyzing the \(B\)-orbit structure. The key is that the open orbit \(U^- \cdot eB\) is dense, so a section is determined by its restriction to this open set.

<em>Vanishing.</em> When \(\lambda\) is not dominant, there exists a simple root \(\alpha_i\) with \(\langle \lambda, \alpha_i^\vee \rangle < 0\). The restriction of \(\mathcal{L}(\lambda)\) to the corresponding \(\mathbb{P}^1\)-fiber in \(G/B\) has negative degree, so any global section must vanish on this fiber, and by irreducibility of the \(G\)-action, the section vanishes identically.
</div>

### 1.9 The Borel-Weil-Bott Theorem

Raoul Bott extended the Borel-Weil theorem in 1957 by computing the higher cohomology groups of \(\mathcal{L}(\lambda)\).

<div class="definition">
Let \(\rho = \frac{1}{2}\sum_{\alpha \in \Phi^+} \alpha\) be the half-sum of positive roots (equivalently, the sum of fundamental weights). The <strong>dot action</strong> of \(W\) on \(X^*(T)\) is \(w \cdot \lambda = w(\lambda + \rho) - \rho\).
</div>

<div class="theorem">
<strong>Borel-Weil-Bott Theorem.</strong> Let \(\lambda \in X^*(T)\). Then:
<ol>
<li>If \(\lambda + \rho\) is singular (i.e., \(\langle \lambda + \rho, \alpha^\vee \rangle = 0\) for some root \(\alpha\)), then \(H^i(G/B, \mathcal{L}(\lambda)) = 0\) for all \(i \geq 0\).</li>
<li>If \(\lambda + \rho\) is regular, let \(w \in W\) be the unique element such that \(w \cdot \lambda\) is dominant. Then

\[
H^i(G/B, \mathcal{L}(\lambda)) = \begin{cases} V(w \cdot \lambda) & \text{if } i = \ell(w), \\ 0 & \text{if } i \neq \ell(w). \end{cases}
\]
</li>
</ol>
</div>

<div class="example">
For \(G = \mathrm{SL}_2\), \(\rho = 1\), and \(\lambda = n \in \mathbb{Z}\). If \(n \geq 0\), then \(\lambda + \rho = n + 1 > 0\) is regular, the identity element makes \(\lambda\) dominant, and \(H^0(\mathbb{P}^1, \mathcal{O}(n)) = V(n)\). If \(n = -1\), then \(\lambda + \rho = 0\) is singular, and all cohomology vanishes. If \(n \leq -2\), then \(\lambda + \rho = n + 1 < 0\), the reflection \(s\) gives \(s \cdot n = -n - 2 \geq 0\), and \(H^1(\mathbb{P}^1, \mathcal{O}(n)) = V(-n-2)\), recovering Serre duality.
</div>

---

## Chapter 2: D-Modules

The theory of D-modules, developed by Mikio Sato, Joseph Bernstein, and others in the 1970s and 1980s, provides an algebraic framework for studying systems of linear partial differential equations on algebraic varieties. In the context of geometric representation theory, D-modules on the flag variety serve as geometric avatars of representations of Lie algebras, a connection made precise by the Beilinson-Bernstein localization theorem.

### 2.1 Differential Operators on Smooth Varieties

Let \(X\) be a smooth algebraic variety over \(k\) with structure sheaf \(\mathcal{O}_X\).

<div class="definition">
The sheaf of <strong>differential operators</strong> \(\mathcal{D}_X\) on \(X\) is defined by the following filtration. Set \(\mathcal{D}_X^0 = \mathcal{O}_X\) (multiplication operators), and define inductively:

\[
\mathcal{D}_X^k = \{P \in \mathcal{E}nd_k(\mathcal{O}_X) : [P, f] \in \mathcal{D}_X^{k-1} \text{ for all } f \in \mathcal{O}_X\}.
\]
Then \(\mathcal{D}_X = \bigcup_{k \geq 0} \mathcal{D}_X^k\).
</div>

On an affine open set \(U\) with local coordinates \(x_1, \ldots, x_n\), the ring \(\mathcal{D}_X(U)\) is generated by \(\mathcal{O}_X(U)\) and the partial derivatives \(\partial_1, \ldots, \partial_n\) subject to the relations:

\[
[\partial_i, \partial_j] = 0, \quad [\partial_i, f] = \frac{\partial f}{\partial x_i} \quad \text{for all } f \in \mathcal{O}_X(U).
\]

The associated graded \(\mathrm{gr}(\mathcal{D}_X) = \bigoplus_{k \geq 0} \mathcal{D}_X^k / \mathcal{D}_X^{k-1}\) is commutative and isomorphic to the symmetric algebra \(\mathrm{Sym}(\mathcal{T}_X)\) of the tangent sheaf, which is the structure sheaf of the cotangent bundle \(T^*X\).

<div class="example">
For \(X = \mathbb{A}^n\), the ring of differential operators is the <strong>Weyl algebra</strong>

\[
D_n = k[x_1, \ldots, x_n, \partial_1, \ldots, \partial_n]
\]
with relations \([\partial_i, x_j] = \delta_{ij}\). This is a simple ring (no two-sided ideals) of Gelfand-Kirillov dimension \(2n\).
</div>

### 2.2 Left and Right D-Modules

<div class="definition">
A <strong>left \(\mathcal{D}_X\)-module</strong> is a sheaf \(\mathcal{M}\) of left modules over \(\mathcal{D}_X\) that is quasi-coherent as an \(\mathcal{O}_X\)-module. A <strong>right \(\mathcal{D}_X\)-module</strong> is defined analogously with right module structures.
</div>

The canonical example of a left D-module is \(\mathcal{O}_X\) itself, with the natural action of differential operators. The canonical example of a right D-module is the canonical sheaf \(\omega_X = \Omega_X^n\) (top exterior power of the cotangent bundle), where a vector field \(\xi\) acts on a top form \(\omega\) by the negative Lie derivative: \(\omega \cdot \xi = -\mathcal{L}_\xi \omega\).

There is an equivalence between left and right D-modules given by:

\[
\mathcal{M} \mapsto \mathcal{M} \otimes_{\mathcal{O}_X} \omega_X \quad (\text{left} \to \text{right}), \qquad \mathcal{N} \mapsto \mathcal{N} \otimes_{\mathcal{O}_X} \omega_X^{-1} \quad (\text{right} \to \text{left}).
\]

<div class="example">
A <strong>flat connection</strong> on a vector bundle \(\mathcal{E}\) on \(X\) is equivalent to a left \(\mathcal{D}_X\)-module structure on \(\mathcal{E}\). The connection \(\nabla: \mathcal{E} \to \mathcal{E} \otimes \Omega^1_X\) defines the action of vector fields, and flatness (\(\nabla^2 = 0\)) ensures compatibility with the commutation relations in \(\mathcal{D}_X\). This shows that D-modules generalize the classical theory of flat connections and local systems.
</div>

### 2.3 The de Rham Functor and the Characteristic Variety

<div class="definition">
Let \(\mathcal{M}\) be a left \(\mathcal{D}_X\)-module. The <strong>de Rham complex</strong> of \(\mathcal{M}\) is

\[
\mathrm{DR}(\mathcal{M}) = [\mathcal{M} \xrightarrow{\nabla} \mathcal{M} \otimes \Omega^1_X \xrightarrow{\nabla} \cdots \xrightarrow{\nabla} \mathcal{M} \otimes \Omega^n_X]
\]
placed in degrees \(-n, \ldots, 0\) (with the shift convention of Hotta-Takeuchi-Tanisaki). The <strong>de Rham functor</strong> sends \(\mathcal{M}\) to the complex of sheaves \(\mathrm{DR}(\mathcal{M})\) (or its hypercohomology).
</div>

For the trivial D-module \(\mathcal{M} = \mathcal{O}_X\), the de Rham complex reduces to the algebraic de Rham complex \(\Omega^\bullet_X\), whose hypercohomology computes the algebraic de Rham cohomology \(H^*_{\mathrm{dR}}(X)\).

<div class="definition">
Let \(\mathcal{M}\) be a coherent \(\mathcal{D}_X\)-module. Choose a good filtration \(\{F_k \mathcal{M}\}\) (compatible with the order filtration on \(\mathcal{D}_X\)). The <strong>characteristic variety</strong> (or <strong>singular support</strong>) of \(\mathcal{M}\) is

\[
\mathrm{Ch}(\mathcal{M}) = \mathrm{Supp}(\mathrm{gr}^F \mathcal{M}) \subseteq T^*X.
\]
This is a closed conical subvariety of the cotangent bundle, independent of the choice of good filtration.
</div>

<div class="theorem">
<strong>Bernstein's Inequality.</strong> For any non-zero coherent \(\mathcal{D}_X\)-module \(\mathcal{M}\), every irreducible component of \(\mathrm{Ch}(\mathcal{M})\) has dimension at least \(\dim X\).
</div>

### 2.4 Holonomic D-Modules

<div class="definition">
A coherent \(\mathcal{D}_X\)-module \(\mathcal{M}\) is <strong>holonomic</strong> if \(\mathcal{M} = 0\) or every irreducible component of \(\mathrm{Ch}(\mathcal{M})\) has dimension exactly \(\dim X\) (the minimum allowed by Bernstein's inequality).
</div>

Holonomic D-modules form an abelian category that is Artinian and Noetherian (every object has finite length). They are the D-modules relevant to representation theory.

<div class="example">
On \(X = \mathbb{A}^1\), the D-module \(\mathcal{D}_X / \mathcal{D}_X \cdot (x\partial - \lambda)\) for \(\lambda \in k\) is holonomic. Its solutions are multiples of \(x^\lambda\). The characteristic variety is the union of the zero section and the fiber over \(x = 0\), which is one-dimensional in \(T^*\mathbb{A}^1 \cong \mathbb{A}^2\).
</div>

### 2.5 Direct and Inverse Images

The six operations for D-modules are the D-module analogues of the six-functor formalism for sheaves. For a morphism \(f: X \to Y\) of smooth varieties:

<div class="definition">
The <strong>inverse image</strong> (or pullback) of a \(\mathcal{D}_Y\)-module \(\mathcal{N}\) is

\[
f^! \mathcal{N} = \mathcal{D}_{X \to Y} \otimes_{f^{-1}\mathcal{D}_Y}^L f^{-1}\mathcal{N}[\dim X - \dim Y]
\]
where \(\mathcal{D}_{X \to Y} = \mathcal{O}_X \otimes_{f^{-1}\mathcal{O}_Y} f^{-1}\mathcal{D}_Y\) is the transfer bimodule. The <strong>direct image</strong> (or pushforward) is

\[
f_+ \mathcal{M} = Rf_*(\mathcal{D}_{Y \leftarrow X} \otimes_{\mathcal{D}_X}^L \mathcal{M})
\]
where \(\mathcal{D}_{Y \leftarrow X} = \omega_X \otimes_{\mathcal{O}_X} \mathcal{D}_{X \to Y} \otimes_{f^{-1}\mathcal{O}_Y} f^{-1}\omega_Y^{-1}\).
</div>

These functors preserve holonomicity and satisfy base-change and projection formulas analogous to those in the theory of constructible sheaves.

### 2.6 D-Modules on the Flag Variety

We now specialize to the flag variety \(\mathcal{B} = G/B\). The group \(G\) acts on \(\mathcal{B}\), and hence on \(\mathcal{D}_\mathcal{B}\). We are interested in \(G\)-equivariant D-modules.

The Lie algebra \(\mathfrak{g}\) acts on \(\mathcal{B}\) via the infinitesimal \(G\)-action, giving a Lie algebra homomorphism \(\mathfrak{g} \to \Gamma(\mathcal{B}, \mathcal{T}_\mathcal{B})\) from \(\mathfrak{g}\) to global vector fields on \(\mathcal{B}\). Composing with the inclusion of vector fields into differential operators, we obtain a map

\[
\mu: U(\mathfrak{g}) \to \Gamma(\mathcal{B}, \mathcal{D}_\mathcal{B}).
\]

<div class="theorem">
<strong>(Beilinson-Bernstein)</strong> The map \(\mu\) descends to an isomorphism

\[
U(\mathfrak{g}) / (U(\mathfrak{g}) \cdot \ker \chi_0) \xrightarrow{\sim} \Gamma(\mathcal{B}, \mathcal{D}_\mathcal{B}),
\]
where \(\chi_0: Z(\mathfrak{g}) \to k\) is the central character corresponding to the trivial representation (i.e., the character of the augmentation \(\lambda = 0\) under the Harish-Chandra isomorphism, or equivalently, the central character \(\chi_{-\rho}\) evaluated at \(-\rho\) in the unshifted convention).
</div>

### 2.7 The Beilinson-Bernstein Localization Theorem

This is one of the crown jewels of geometric representation theory, established by Alexander Beilinson and Joseph Bernstein in 1981. It provides a geometric realization of the category of representations of \(\mathfrak{g}\) with a given central character.

For \(\lambda \in \mathfrak{t}^*\), let \(\mathcal{D}_\lambda\) denote the sheaf of <strong>twisted differential operators</strong> (TDO) on \(\mathcal{B}\) associated to \(\lambda\). When \(\lambda\) is integral, \(\mathcal{D}_\lambda\) is the sheaf of differential operators on the line bundle \(\mathcal{L}(\lambda)\). For general \(\lambda\), it is defined via the Harish-Chandra homomorphism and the notion of a TDO-ring.

<div class="theorem">
<strong>Beilinson-Bernstein Localization Theorem.</strong> Let \(\lambda \in \mathfrak{t}^*\) be a weight, and let \(\chi_\lambda\) be the corresponding central character (under the Harish-Chandra isomorphism, with the dot-action shift). Define \(U_\lambda = U(\mathfrak{g}) / U(\mathfrak{g}) \cdot \ker \chi_\lambda\).

<ol>
<li><strong>Global sections:</strong> \(\Gamma(\mathcal{B}, \mathcal{D}_\lambda) \cong U_\lambda\).</li>
<li><strong>If \(\lambda\) is dominant and regular</strong> (i.e., \(\langle \lambda + \rho, \alpha^\vee \rangle \notin \{0, -1, -2, \ldots\}\) for all positive roots \(\alpha\)), then the global sections functor

\[
\Gamma: \mathrm{Mod}_{qc}(\mathcal{D}_\lambda) \to \mathrm{Mod}(U_\lambda)
\]
is an equivalence of categories, with quasi-inverse given by <strong>localization</strong>:

\[
\Delta_\lambda: M \mapsto \mathcal{D}_\lambda \otimes_{U_\lambda} M.
\]
</li>
<li>Under this equivalence, \(\Gamma\) and \(\Delta_\lambda\) are exact functors, and they restrict to an equivalence between coherent \(\mathcal{D}_\lambda\)-modules and finitely generated \(U_\lambda\)-modules.</li>
</ol>
</div>

<div class="proof">
We give the main steps of the proof.

<strong>Step 1: The map \(U_\lambda \to \Gamma(\mathcal{B}, \mathcal{D}_\lambda)\) is an isomorphism.</strong> The Lie algebra map \(\mathfrak{g} \to \Gamma(\mathcal{B}, \mathcal{T}_\mathcal{B}) \subset \Gamma(\mathcal{B}, \mathcal{D}_\lambda)\) extends to a surjection \(U(\mathfrak{g}) \to \Gamma(\mathcal{B}, \mathcal{D}_\lambda)\). The kernel is the ideal generated by \(\ker \chi_\lambda\) in the center \(Z(\mathfrak{g})\), which follows from the computation of \(\Gamma(\mathcal{B}, \mathcal{O}_\mathcal{B}) = k\) (since \(\mathcal{B}\) is projective) and the identification of the center's action via the Harish-Chandra isomorphism.

<strong>Step 2: Vanishing of higher cohomology.</strong> One shows that for \(\lambda\) dominant and regular, and for any quasi-coherent \(\mathcal{D}_\lambda\)-module \(\mathcal{M}\),

\[
H^i(\mathcal{B}, \mathcal{M}) = 0 \quad \text{for } i > 0.
\]
This is the crucial analytic input. The proof uses the ampleness criterion: the \(\mathcal{D}_\lambda\)-module \(\mathcal{M}\) can be filtered so that the associated graded is a direct sum of line bundles \(\mathcal{L}(\mu)\) with \(\mu\) sufficiently positive, and the Borel-Weil-Bott theorem gives the vanishing.

<strong>Step 3: Generation by global sections.</strong> One shows that for \(\lambda\) dominant and regular, the natural map \(\mathcal{D}_\lambda \otimes_{U_\lambda} \Gamma(\mathcal{B}, \mathcal{M}) \to \mathcal{M}\) is surjective. This uses the fact that \(\mathcal{B}\) is covered by the translates of the open Bruhat cell.

<strong>Step 4: The equivalence.</strong> Steps 2 and 3 together show that \(\Gamma\) is exact and conservative (detects zero objects). Combined with the full faithfulness that follows from Step 1, this gives the equivalence.
</div>

<div class="remark">
The Beilinson-Bernstein theorem transforms representation-theoretic problems into geometric ones. For example, the classification of irreducible representations in category \(\mathcal{O}\) with a given regular central character reduces to the classification of irreducible \(G\)-equivariant holonomic \(\mathcal{D}_\lambda\)-modules on \(\mathcal{B}\), which in turn is governed by the orbit structure (Schubert cells) of \(\mathcal{B}\).
</div>

<div class="example">
For \(\mathfrak{g} = \mathfrak{sl}_2\) and \(\lambda = 0\) (the most important case), the flag variety is \(\mathbb{P}^1\), and \(\mathcal{D}_0 = \mathcal{D}_{\mathbb{P}^1}\). The localization theorem says that \(\mathrm{Mod}(\mathcal{D}_{\mathbb{P}^1})\) is equivalent to \(\mathrm{Mod}(U(\mathfrak{sl}_2)/(C))\), where \(C\) is the Casimir acting by the scalar corresponding to the trivial representation. The irreducible \(\mathcal{D}_{\mathbb{P}^1}\)-modules supported on points correspond to finite-dimensional modules, while those supported on all of \(\mathbb{P}^1\) correspond to infinite-dimensional modules in category \(\mathcal{O}\).
</div>

---

## Chapter 3: Perverse Sheaves

Perverse sheaves, introduced by Beilinson, Bernstein, Deligne, and Gabber in the early 1980s, provide a topological counterpart to the algebraic theory of D-modules. Connected to D-modules by the Riemann-Hilbert correspondence, they bring powerful topological tools — particularly intersection cohomology — to bear on problems in representation theory. This chapter develops the basic theory.

### 3.1 Constructible Sheaves

We work with sheaves on a complex algebraic variety \(X\) in the classical (analytic) topology, with coefficients in a field \(k\) (typically \(\mathbb{Q}\), \(\overline{\mathbb{Q}}_\ell\), or \(\mathbb{C}\)).

<div class="definition">
A sheaf \(\mathcal{F}\) of \(k\)-vector spaces on \(X\) is <strong>constructible</strong> if there exists a finite stratification \(X = \bigsqcup_\alpha S_\alpha\) into locally closed subvarieties such that \(\mathcal{F}|_{S_\alpha}\) is a local system (locally constant sheaf of finite rank) on each stratum \(S_\alpha\).
</div>

<div class="example">
On \(\mathbb{A}^1\), consider the inclusion \(j: \mathbb{A}^1 \setminus \{0\} \hookrightarrow \mathbb{A}^1\). The sheaf \(j_! k_{\mathbb{A}^1 \setminus \{0\}}\) (extension by zero) is constructible with respect to the stratification \(\{0\} \sqcup (\mathbb{A}^1 \setminus \{0\})\). Its stalk is \(k\) at points \(x \neq 0\) and \(0\) at \(x = 0\).
</div>

### 3.2 Derived Categories

To do homological algebra with sheaves, we pass to derived categories.

<div class="definition">
The <strong>bounded derived category of constructible sheaves</strong> on \(X\) is denoted \(D^b_c(X)\) (or \(D^b_c(X, k)\) when the coefficient field matters). Its objects are bounded complexes of sheaves with constructible cohomology sheaves. Morphisms are obtained by formally inverting quasi-isomorphisms.
</div>

The derived category \(D^b_c(X)\) is a triangulated category equipped with a shift functor \([1]\) and distinguished triangles. It is the natural home for the six-functor formalism.

### 3.3 The Six-Functor Formalism

For a morphism \(f: X \to Y\) of algebraic varieties, there are six derived functors relating \(D^b_c(X)\) and \(D^b_c(Y)\):

<div class="definition">
The <strong>six functors</strong> are:
<ul>
<li>\(f^*: D^b_c(Y) \to D^b_c(X)\) (inverse image) and \(f_*: D^b_c(X) \to D^b_c(Y)\) (direct image).</li>
<li>\(f^!: D^b_c(Y) \to D^b_c(X)\) (exceptional inverse image) and \(f_!: D^b_c(X) \to D^b_c(Y)\) (direct image with proper support).</li>
<li>\(\mathcal{H}om\) and \(\otimes\) on each category.</li>
</ul>
These satisfy adjunctions \((f^*, f_*)\) and \((f_!, f^!)\), base change, and the projection formula.
</div>

When \(f\) is proper, \(f_* = f_!\). When \(f\) is a smooth morphism of relative dimension \(d\), \(f^! = f^*[2d]\). The Verdier duality functor \(\mathbb{D}_X: D^b_c(X) \to D^b_c(X)^{\mathrm{op}}\) exchanges \(f_*\) with \(f_!\) and \(f^*\) with \(f^!\).

### 3.4 t-Structures and Perverse Sheaves

The category of perverse sheaves is defined as the heart of a non-standard t-structure on \(D^b_c(X)\).

<div class="definition">
A <strong>t-structure</strong> on a triangulated category \(\mathcal{D}\) is a pair of full subcategories \((\mathcal{D}^{\leq 0}, \mathcal{D}^{\geq 0})\) satisfying:
<ul>
<li>\(\mathcal{D}^{\leq -1} \subseteq \mathcal{D}^{\leq 0}\) and \(\mathcal{D}^{\geq 1} \subseteq \mathcal{D}^{\geq 0}\), where \(\mathcal{D}^{\leq n} = \mathcal{D}^{\leq 0}[-n]\).</li>
<li>\(\mathrm{Hom}(A, B) = 0\) for \(A \in \mathcal{D}^{\leq 0}\), \(B \in \mathcal{D}^{\geq 1}\).</li>
<li>Every object \(C\) fits in a distinguished triangle \(A \to C \to B \to A[1]\) with \(A \in \mathcal{D}^{\leq 0}\), \(B \in \mathcal{D}^{\geq 1}\).</li>
</ul>
The <strong>heart</strong> \(\mathcal{A} = \mathcal{D}^{\leq 0} \cap \mathcal{D}^{\geq 0}\) is an abelian category.
</div>

The standard t-structure on \(D^b_c(X)\) has heart equal to the category of constructible sheaves. The perverse t-structure is different.

<div class="definition">
Fix a stratification \(X = \bigsqcup_\alpha S_\alpha\) with inclusions \(i_\alpha: S_\alpha \hookrightarrow X\). The <strong>perverse t-structure</strong> on \(D^b_c(X)\) is defined by:

\[
{}^p D^{\leq 0} = \{F \in D^b_c(X) : \dim \mathrm{supp}(\mathcal{H}^j(F)) \leq -j \text{ for all } j\},
\]

\[
{}^p D^{\geq 0} = \{F \in D^b_c(X) : \dim \mathrm{supp}(\mathcal{H}^j(\mathbb{D}_X F)) \leq -j \text{ for all } j\}.
\]
The heart \(\mathrm{Perv}(X) = {}^p D^{\leq 0} \cap {}^p D^{\geq 0}\) is the abelian category of <strong>perverse sheaves</strong> on \(X\).
</div>

<div class="remark">
The name "perverse sheaves" is somewhat misleading — they are neither perverse nor sheaves. They are complexes of sheaves, and the terminology reflects the historical development (the "perversity" conditions of Goresky and MacPherson).
</div>

<div class="example">
On a smooth irreducible variety \(X\) of dimension \(n\), the constant sheaf \(k_X[n]\) (shifted by \(n\)) is a perverse sheaf. On a singular variety, the constant sheaf shifted by dimension is generally not perverse.
</div>

### 3.5 Intersection Cohomology

One of the key motivations for perverse sheaves is intersection cohomology, introduced by Mark Goresky and Robert MacPherson in 1980 to restore Poincaré duality for singular spaces.

<div class="definition">
Let \(X\) be an irreducible variety of dimension \(n\), and let \(U \subseteq X\) be the smooth locus with inclusion \(j: U \hookrightarrow X\). Let \(\mathcal{L}\) be a local system on \(U\). The <strong>intersection cohomology complex</strong> \(\mathrm{IC}(X, \mathcal{L})\) is the unique object in \(\mathrm{Perv}(X)\) satisfying:
<ul>
<li>\(\mathrm{IC}(X, \mathcal{L})|_U \cong \mathcal{L}[n]\).</li>
<li>For \(x \in X \setminus U\) of codimension \(c\), the stalk cohomology satisfies \(\mathcal{H}^j(\mathrm{IC}(X, \mathcal{L}))_x = 0\) for \(j \geq -n + c\).</li>
<li>The costalk condition (Verdier dual of the stalk condition) holds as well.</li>
</ul>
When \(\mathcal{L} = k_U\) is the constant local system, we write \(\mathrm{IC}(X) = \mathrm{IC}(X, k_U)\).
</div>

The <strong>intersection cohomology groups</strong> are \(IH^k(X) = \mathbb{H}^{k-n}(X, \mathrm{IC}(X))\). They satisfy Poincaré duality: \(IH^k(X) \cong IH^{2n-k}(X)^*\) when \(X\) is projective.

<div class="theorem">
<strong>Simple perverse sheaves.</strong> The simple objects in the abelian category \(\mathrm{Perv}(X)\) are precisely the intersection cohomology complexes \(\mathrm{IC}(\overline{S}, \mathcal{L})\), where \(S\) ranges over the strata and \(\mathcal{L}\) ranges over the irreducible local systems on \(S\).
</div>

### 3.6 The Decomposition Theorem

The decomposition theorem, proved by Beilinson, Bernstein, Deligne, and Gabber (1982), is one of the most powerful results in algebraic geometry.

<div class="theorem">
<strong>Decomposition Theorem (BBDG).</strong> Let \(f: X \to Y\) be a proper morphism of algebraic varieties, and let \(\mathcal{F}\) be a semisimple perverse sheaf on \(X\). Then the direct image \(Rf_* \mathcal{F}\) decomposes in \(D^b_c(Y)\) as a direct sum of shifts of simple perverse sheaves:

\[
Rf_* \mathcal{F} \cong \bigoplus_i {}^p \mathcal{H}^i(Rf_* \mathcal{F})[-i],
\]
and each perverse cohomology sheaf \({}^p \mathcal{H}^i(Rf_* \mathcal{F})\) is semisimple.
</div>

<div class="proof">
<strong>Proof sketch.</strong> The original proof by Beilinson-Bernstein-Deligne-Gabber proceeds by reduction to positive characteristic, where the result follows from Deligne's proof of the Weil conjectures and the theory of weights for \(\ell\)-adic sheaves. The key idea is that purity (a cohomological condition related to Frobenius eigenvalues) implies semisimplicity.

In characteristic zero, an alternative proof was given by de Cataldo and Migliorini using Hodge theory: the Hodge-Riemann bilinear relations provide the semisimplicity. Sabbah and Mochizuki gave yet another proof using the theory of twistor D-modules.
</div>

<div class="remark">
The decomposition theorem has numerous applications: it implies the semisimplicity of monodromy for proper families, the non-negativity of Kazhdan-Lusztig polynomials (see Chapter 5), and the Springer correspondence (Chapter 4).
</div>

### 3.7 The Riemann-Hilbert Correspondence

The Riemann-Hilbert correspondence, established by Kashiwara and Mebkhout independently around 1980, provides the bridge between the algebraic world of D-modules and the topological world of perverse sheaves.

<div class="theorem">
<strong>Riemann-Hilbert Correspondence.</strong> Let \(X\) be a smooth complex algebraic variety. The de Rham functor

\[
\mathrm{DR}: D^b_{\mathrm{rh}}(\mathcal{D}_X) \to D^b_c(X, \mathbb{C})
\]
is an equivalence of triangulated categories from the bounded derived category of \(\mathcal{D}_X\)-modules with regular holonomic cohomology to the bounded derived category of constructible sheaves of complex vector spaces. Under this equivalence:
<ul>
<li>Regular holonomic \(\mathcal{D}_X\)-modules correspond to perverse sheaves.</li>
<li>Flat connections with regular singularities correspond to local systems.</li>
<li>The D-module operations \(f^!, f_+, \otimes\) correspond to \(f^!, f_*, \otimes\).</li>
</ul>
</div>

The Riemann-Hilbert correspondence allows us to freely translate between the D-module and perverse-sheaf perspectives, using whichever is more convenient for a given problem.

---

## Chapter 4: The Springer Correspondence

The Springer correspondence, discovered by Tonny Albert Springer in 1976, is a remarkable construction that produces representations of the Weyl group from the geometry of the nilpotent cone. It was one of the first major results in what would become geometric representation theory, demonstrating that representation-theoretic objects (Weyl group representations) could be constructed from geometric data (cohomology of fibers of a resolution of singularities).

### 4.1 The Nilpotent Cone

Let \(\mathfrak{g}\) be a semisimple Lie algebra over \(\mathbb{C}\) with adjoint group \(G\).

<div class="definition">
The <strong>nilpotent cone</strong> is the variety of nilpotent elements:

\[
\mathcal{N} = \{x \in \mathfrak{g} : x \text{ is nilpotent}\} = \{x \in \mathfrak{g} : \mathrm{ad}(x) \text{ is a nilpotent endomorphism}\}.
\]
Equivalently, \(\mathcal{N}\) is the zero locus of all homogeneous \(G\)-invariant polynomials of positive degree on \(\mathfrak{g}\).
</div>

The nilpotent cone \(\mathcal{N}\) is a closed, irreducible, normal variety of dimension \(2|\Phi^+| - r = \dim \mathfrak{g} - \mathrm{rank}(\mathfrak{g})\). It is singular (except in trivial cases) and has finitely many \(G\)-orbits.

<div class="example">
For \(\mathfrak{g} = \mathfrak{sl}_n\), the nilpotent cone is \(\mathcal{N} = \{A \in \mathfrak{sl}_n : A^n = 0\}\). The \(G\)-orbits are the nilpotent conjugacy classes, parametrized by partitions of \(n\) (the Jordan type). For \(\mathfrak{sl}_2\), there are two orbits: the zero orbit \(\{0\}\) and the regular nilpotent orbit \(\{A \neq 0 : A^2 = 0, \mathrm{tr}(A) = 0\}\). For \(\mathfrak{sl}_3\), the partitions of 3 give three orbits: \((1,1,1)\) (zero), \((2,1)\) (subregular), and \((3)\) (regular).
</div>

### 4.2 The Springer Resolution

<div class="definition">
The <strong>Springer resolution</strong> is the morphism

\[
\mu: \widetilde{\mathcal{N}} \to \mathcal{N}
\]
where

\[
\widetilde{\mathcal{N}} = \{(x, \mathfrak{b}) \in \mathcal{N} \times \mathcal{B} : x \in \mathfrak{b}\} = T^*\mathcal{B}
\]
is the cotangent bundle of the flag variety, and \(\mu\) is the projection to the first factor.
</div>

The identification \(\widetilde{\mathcal{N}} \cong T^*\mathcal{B}\) comes from the fact that the cotangent fiber at \(\mathfrak{b} \in \mathcal{B}\) is \(T^*_\mathfrak{b}\mathcal{B} \cong (\mathfrak{g}/\mathfrak{b})^* \cong \mathfrak{n}\) (the nilpotent radical of \(\mathfrak{b}\)), where the last isomorphism uses the Killing form. The map \(\mu(x, \mathfrak{b}) = x\) is proper (since \(\mathcal{B}\) is projective) and birational (generically, a regular nilpotent element is contained in a unique Borel subalgebra).

<div class="example">
For \(\mathfrak{sl}_2\), the flag variety is \(\mathcal{B} = \mathbb{P}^1\), and \(\widetilde{\mathcal{N}} = T^*\mathbb{P}^1\). The nilpotent cone \(\mathcal{N} = \{A \in \mathfrak{sl}_2 : A^2 = 0\}\) is the quadric cone \(\{(a, b, c) : a^2 + bc = 0\}\) in \(\mathbb{A}^3\). The Springer resolution is the minimal resolution of this surface singularity, with exceptional fiber \(\mu^{-1}(0) = \mathbb{P}^1\).
</div>

### 4.3 Springer Fibers

<div class="definition">
For \(x \in \mathcal{N}\), the <strong>Springer fiber</strong> over \(x\) is

\[
\mathcal{B}_x = \mu^{-1}(x) = \{\mathfrak{b} \in \mathcal{B} : x \in \mathfrak{b}\},
\]
the variety of Borel subalgebras containing \(x\).
</div>

Springer fibers have rich geometry that encodes representation-theoretic data.

<div class="example">
For \(\mathfrak{sl}_n\), a nilpotent element \(x\) has Jordan type \(\lambda \vdash n\), and the Springer fiber \(\mathcal{B}_x\) parametrizes complete flags \(0 = V_0 \subset V_1 \subset \cdots \subset V_n = \mathbb{C}^n\) such that \(x(V_i) \subseteq V_{i-1}\). For the subregular nilpotent in \(\mathfrak{sl}_3\) (Jordan type \((2,1)\)), the Springer fiber consists of two copies of \(\mathbb{P}^1\) meeting at a point — a union of rational curves whose intersection pattern encodes the Dynkin diagram of type \(A_2\).
</div>

Key properties of Springer fibers include:
- \(\dim \mathcal{B}_x = \frac{1}{2}(\dim G \cdot x - \mathrm{rank}(\mathfrak{g}))\), where \(G \cdot x\) is the adjoint orbit.
- The irreducible components of \(\mathcal{B}_x\) all have the same dimension.
- \(\mathcal{B}_x\) is connected (Steinberg).

### 4.4 The Springer Correspondence

Springer's fundamental insight was that the top cohomology of Springer fibers carries natural representations of the Weyl group.

<div class="theorem">
<strong>Springer Correspondence.</strong> There is a natural action of the Weyl group \(W\) on \(H^*(\mathcal{B}_x, \mathbb{C})\) for each \(x \in \mathcal{N}\), depending only on the orbit \(\mathcal{O}\) of \(x\). Moreover, the top-degree cohomology \(H^{2d_x}(\mathcal{B}_x, \mathbb{C})\), where \(d_x = \dim \mathcal{B}_x\), decomposes under the \(W\)-action and provides a bijection:

\[
\mathrm{Irr}(W) \longleftrightarrow \{(\mathcal{O}, \mathcal{L}) : \mathcal{O} \text{ a nilpotent orbit}, \mathcal{L} \text{ an irreducible } G\text{-equivariant local system on } \mathcal{O}\}_{\text{Springer}},
\]
where the right-hand side consists of "Springer pairs" — a subset (not all!) of the set of all pairs \((\mathcal{O}, \mathcal{L})\).
</div>

To be more precise, for each nilpotent orbit \(\mathcal{O}\), the top cohomology \(H^{2d}(\mathcal{B}_x)\) (for \(x \in \mathcal{O}\)) decomposes as

\[
H^{2d}(\mathcal{B}_x) = \bigoplus_\phi m_\phi V_\phi
\]
where \(V_\phi\) are irreducible \(W\)-representations and \(m_\phi\) are multiplicities. Each pair \((\mathcal{O}, \mathcal{L})\) that appears in the Springer correspondence has \(\mathcal{L}\) determined by the multiplicity space of the corresponding representation.

<div class="example">
<strong>Type \(A_{n-1}\) (the case \(\mathfrak{sl}_n\)).</strong> For \(\mathfrak{sl}_n\), the Springer correspondence takes a particularly clean form. Nilpotent orbits are parametrized by partitions \(\lambda \vdash n\), and irreducible representations of \(W = S_n\) are also parametrized by partitions \(\mu \vdash n\). The Springer correspondence sends \(\mu\) to the orbit of Jordan type \(\mu^t\) (the transpose partition), with trivial local system. Every nilpotent orbit appears, and no non-trivial local systems arise in this type. This recovers the classical Robinson-Schensted correspondence between standard Young tableaux and cells in the flag variety.
</div>

### 4.5 Proof via Perverse Sheaves

The modern proof of the Springer correspondence uses perverse sheaves and the decomposition theorem.

<div class="proof">
<strong>Proof sketch.</strong> Consider the Springer resolution \(\mu: \widetilde{\mathcal{N}} \to \mathcal{N}\). Since \(\mu\) is proper and \(\widetilde{\mathcal{N}} = T^*\mathcal{B}\) is smooth of dimension \(2N\) (where \(N = |\Phi^+|\)), the shifted constant sheaf \(\mathbb{C}_{\widetilde{\mathcal{N}}}[2N]\) is perverse on \(\widetilde{\mathcal{N}}\).

By the decomposition theorem, the direct image

\[
R\mu_* \mathbb{C}_{\widetilde{\mathcal{N}}}[2N]
\]
is a semisimple perverse sheaf on \(\mathcal{N}\). It therefore decomposes as a direct sum of IC-sheaves:

\[
R\mu_* \mathbb{C}_{\widetilde{\mathcal{N}}}[2N] \cong \bigoplus_{(\mathcal{O}, \mathcal{L})} V_{(\mathcal{O}, \mathcal{L})} \otimes \mathrm{IC}(\overline{\mathcal{O}}, \mathcal{L}),
\]
where the sum runs over pairs consisting of a nilpotent orbit and an irreducible equivariant local system, and \(V_{(\mathcal{O}, \mathcal{L})}\) is a multiplicity vector space.

The Weyl group \(W\) acts on the Springer sheaf \(R\mu_* \mathbb{C}_{\widetilde{\mathcal{N}}}[2N]\) via its action on the fibers of \(\mu\). Springer's construction shows this action is non-trivial: the Weyl group acts by correspondences on \(\widetilde{\mathcal{N}} \times_\mathcal{N} \widetilde{\mathcal{N}}\), the Steinberg variety (see below). Since the endomorphism algebra of \(R\mu_* \mathbb{C}[2N]\) includes the group algebra \(\mathbb{C}[W]\) (by a dimension count using the Steinberg variety), the multiplicity spaces \(V_{(\mathcal{O}, \mathcal{L})}\) become \(W\)-representations, and the decomposition gives the Springer correspondence.
</div>

### 4.6 The Steinberg Variety

<div class="definition">
The <strong>Steinberg variety</strong> is the fiber product

\[
Z = \widetilde{\mathcal{N}} \times_\mathcal{N} \widetilde{\mathcal{N}} = \{(x, \mathfrak{b}, \mathfrak{b}') \in \mathcal{N} \times \mathcal{B} \times \mathcal{B} : x \in \mathfrak{b} \cap \mathfrak{b}'\}.
\]
</div>

The Steinberg variety is a union of \(|W|\) irreducible components, each of dimension \(\dim G\). Convolution on the Steinberg variety defines an associative algebra structure on the top Borel-Moore homology \(H_{2\dim G}^{BM}(Z)\), and this algebra is isomorphic to \(\mathbb{C}[W]\), the group algebra of the Weyl group. This is the geometric mechanism underlying the Springer correspondence.

### 4.7 The Grothendieck Simultaneous Resolution

The Springer resolution fits into a larger family — the Grothendieck simultaneous resolution.

<div class="definition">
The <strong>Grothendieck simultaneous resolution</strong> is the diagram

\[
\widetilde{\mathfrak{g}} = \{(x, \mathfrak{b}) \in \mathfrak{g} \times \mathcal{B} : x \in \mathfrak{b}\} \xrightarrow{\pi} \mathfrak{g} \xrightarrow{\chi} \mathfrak{t}/W
\]
where \(\pi(x, \mathfrak{b}) = x\), and \(\chi: \mathfrak{g} \to \mathfrak{t}/W \cong \mathbb{A}^r\) is the adjoint quotient map (Chevalley restriction).
</div>

There is also a map \(\sigma: \widetilde{\mathfrak{g}} \to \mathfrak{t}\) given by \(\sigma(x, \mathfrak{b}) = x \mod [\mathfrak{b}, \mathfrak{b}]\). The composite \(\sigma\) followed by \(\mathfrak{t} \to \mathfrak{t}/W\) equals \(\chi \circ \pi\). The fiber of \(\pi\) over a regular semisimple element consists of \(|W|\) points (the \(W\)-orbit of Borel subalgebras containing a Cartan subalgebra), while the fiber over \(0\) is the flag variety \(\mathcal{B}\) — and the fiber over a general nilpotent element is the Springer fiber.

The Grothendieck simultaneous resolution interpolates between the simple picture over the regular semisimple locus and the rich geometry over the nilpotent cone. The Springer correspondence can be seen as the "specialization" of the monodromy action of \(W\) on regular fibers to the action on Springer fibers.

---

## Chapter 5: Kazhdan-Lusztig Theory

Kazhdan-Lusztig theory, initiated by David Kazhdan and George Lusztig in their landmark 1979 paper, connects the combinatorics of Hecke algebras with the geometry of Schubert varieties and the representation theory of Lie algebras. The Kazhdan-Lusztig conjecture — proved independently by Beilinson-Bernstein and Brylinski-Kashiwara in 1981 using D-modules and the Riemann-Hilbert correspondence — expresses multiplicities of simple modules in Verma modules in terms of intersection cohomology of Schubert varieties.

### 5.1 Category \(\mathcal{O}\)

We begin with the representation-theoretic setting.

<div class="definition">
Let \(\mathfrak{g}\) be a complex semisimple Lie algebra with Cartan subalgebra \(\mathfrak{h}\) and Borel subalgebra \(\mathfrak{b} = \mathfrak{h} \oplus \mathfrak{n}\). The <strong>BGG category \(\mathcal{O}\)</strong> (Bernstein-Gelfand-Gelfand) is the full subcategory of \(\mathfrak{g}\)-modules \(M\) satisfying:
<ol>
<li><em>Weight decomposition:</em> \(M = \bigoplus_{\mu \in \mathfrak{h}^*} M_\mu\) with each \(M_\mu\) finite-dimensional.</li>
<li><em>Finite generation:</em> \(M\) is finitely generated as a \(U(\mathfrak{g})\)-module.</li>
<li><em>Locally \(\mathfrak{n}\)-finite:</em> For every \(v \in M\), \(\dim U(\mathfrak{n}) \cdot v < \infty\).</li>
</ol>
</div>

Category \(\mathcal{O}\) is an abelian category with enough projectives. It decomposes into blocks indexed by central characters:

\[
\mathcal{O} = \bigoplus_{\chi} \mathcal{O}_\chi.
\]

### 5.2 Verma Modules

<div class="definition">
For \(\lambda \in \mathfrak{h}^*\), the <strong>Verma module</strong> is the induced module

\[
M(\lambda) = U(\mathfrak{g}) \otimes_{U(\mathfrak{b})} \mathbb{C}_\lambda,
\]
where \(\mathbb{C}_\lambda\) is the one-dimensional \(\mathfrak{b}\)-module on which \(\mathfrak{h}\) acts by \(\lambda\) and \(\mathfrak{n}\) acts by zero.
</div>

Key properties of Verma modules:
- \(M(\lambda)\) has a unique simple quotient, denoted \(L(\lambda)\).
- Every simple object in \(\mathcal{O}\) is isomorphic to \(L(\lambda)\) for a unique \(\lambda\).
- \(M(\lambda)\) has the same central character as \(M(\mu)\) if and only if \(\lambda\) and \(\mu\) are in the same \(W\)-orbit under the dot action \(w \cdot \lambda = w(\lambda + \rho) - \rho\).
- \(L(\lambda)\) is finite-dimensional if and only if \(\lambda\) is dominant integral.

<div class="example">
For \(\mathfrak{sl}_2\), a Verma module \(M(\lambda)\) has basis \(\{v, fv, f^2 v, \ldots\}\) with \(hv = \lambda v\), \(ev = 0\), and weights \(\lambda, \lambda - 2, \lambda - 4, \ldots\). The module \(M(\lambda)\) is simple unless \(\lambda \in \mathbb{Z}_{\geq 0}\), in which case the simple quotient \(L(\lambda)\) is the \((\lambda+1)\)-dimensional representation and \(M(\lambda)\) has the short exact sequence

\[
0 \to M(-\lambda - 2) \to M(\lambda) \to L(\lambda) \to 0.
\]
</div>

### 5.3 The Multiplicity Problem

The fundamental question in category \(\mathcal{O}\) is:

<em>What is the composition series of \(M(\lambda)\)? That is, what are the multiplicities \([M(\lambda) : L(\mu)]\) of each simple module \(L(\mu)\) as a composition factor of \(M(\lambda)\)?</em>

By the theory of central characters, \([M(\lambda) : L(\mu)] \neq 0\) only if \(\mu = w \cdot \lambda\) for some \(w \in W\). For the principal block (containing the trivial representation), we may write \([M(w \cdot (-\rho)) : L(v \cdot (-\rho))] = [M(w \cdot 0) : L(v \cdot 0)]\), which we denote simply by \([M(w) : L(v)]\).

### 5.4 Kazhdan-Lusztig Polynomials

Kazhdan and Lusztig defined their polynomials using the Hecke algebra.

<div class="definition">
The <strong>Hecke algebra</strong> \(\mathcal{H} = \mathcal{H}(W, S)\) of a Coxeter system \((W, S)\) is the \(\mathbb{Z}[q^{1/2}, q^{-1/2}]\)-algebra with basis \(\{T_w : w \in W\}\) and relations:
<ul>
<li>\(T_s^2 = (q - 1)T_s + q T_e\) for \(s \in S\),</li>
<li>\(T_w T_s = T_{ws}\) if \(\ell(ws) = \ell(w) + 1\).</li>
</ul>
</div>

<div class="definition">
The <strong>Kazhdan-Lusztig involution</strong> on \(\mathcal{H}\) is the ring automorphism defined by \(\overline{q^{1/2}} = q^{-1/2}\) and \(\overline{T_w} = T_{w^{-1}}^{-1}\).
</div>

<div class="theorem">
<strong>(Kazhdan-Lusztig, 1979).</strong> For each \(w \in W\), there exists a unique element \(C'_w \in \mathcal{H}\) (the <strong>Kazhdan-Lusztig basis element</strong>) satisfying:
<ol>
<li>\(\overline{C'_w} = C'_w\) (self-duality under the KL involution),</li>
<li>\(C'_w = q^{-\ell(w)/2} \sum_{v \leq w} P_{v,w}(q) T_v\), where \(P_{v,w}(q) \in \mathbb{Z}[q]\), \(P_{w,w} = 1\), and \(\deg P_{v,w} \leq \frac{1}{2}(\ell(w) - \ell(v) - 1)\) for \(v < w\).</li>
</ol>
The polynomials \(P_{v,w}(q)\) are the <strong>Kazhdan-Lusztig polynomials</strong>.
</div>

<div class="example">
For \(W = S_3\), the KL polynomials are all equal to 1: \(P_{v,w}(q) = 1\) for all \(v \leq w\) in the Bruhat order. This reflects the fact that all Schubert varieties in the \(\mathrm{SL}_3\) flag variety are smooth.

The first non-trivial KL polynomials appear in type \(A_3\): for the element \(w = s_1 s_2 s_1 s_3 s_2 s_1\) (the longest element in a certain parabolic) and \(v = s_2\), one finds \(P_{v,w}(q) = 1 + q\). The extra term reflects a singularity of the corresponding Schubert variety.
</div>

### 5.5 The Kazhdan-Lusztig Conjecture

<div class="theorem">
<strong>Kazhdan-Lusztig Conjecture (Theorem of Beilinson-Bernstein and Brylinski-Kashiwara, 1981).</strong> In the principal block of category \(\mathcal{O}\), the multiplicity of the simple module in a Verma module is given by:

\[
[M(w \cdot (-2\rho)) : L(v \cdot (-2\rho))] = P_{w_0 w, w_0 v}(1),
\]
or equivalently (with the more standard normalization):

\[
\mathrm{ch}\, L(w \cdot 0) = \sum_{v \leq w} (-1)^{\ell(w) - \ell(v)} P_{v,w}(1) \, \mathrm{ch}\, M(v \cdot 0).
\]
</div>

<div class="proof">
<strong>Proof sketch (Beilinson-Bernstein, Brylinski-Kashiwara).</strong> The proof proceeds through a chain of equivalences:

<strong>Step 1: Localization.</strong> By the Beilinson-Bernstein theorem (Chapter 2), the principal block of category \(\mathcal{O}\) is equivalent to a category of \(\mathcal{D}\)-modules on the flag variety \(\mathcal{B}\). Under this equivalence:
<ul>
<li>Verma modules \(M(w \cdot 0)\) correspond to \(\mathcal{D}\)-modules \(\mathcal{M}_w\) supported on the Schubert cells \(C_w\) — specifically, the "standard" D-modules obtained by pushforward from the open embedding of cells.</li>
<li>Simple modules \(L(w \cdot 0)\) correspond to the irreducible holonomic \(\mathcal{D}\)-modules \(\mathcal{L}_w\) on \(\mathcal{B}\), which are the minimal extensions of the trivial connection on the Schubert cell \(C_w\).</li>
</ul>

<strong>Step 2: Riemann-Hilbert.</strong> The Riemann-Hilbert correspondence converts the D-module problem into a topological one. The irreducible D-module \(\mathcal{L}_w\) corresponds to the intersection cohomology complex \(\mathrm{IC}(X_w)\) of the Schubert variety \(X_w\), while the standard D-module \(\mathcal{M}_w\) corresponds to a standard constructible sheaf (the extension by zero from the cell, shifted appropriately).

<strong>Step 3: Intersection cohomology.</strong> The multiplicity \([M(w) : L(v)]\) is now the multiplicity of \(\mathrm{IC}(X_v)\) in the "standard" sheaf on \(C_w\). By the theory of perverse sheaves, this multiplicity equals the dimension of the stalk of \(\mathrm{IC}(X_w)\) at a point of \(C_v\), which is computed by the local intersection cohomology.

<strong>Step 4: The KL polynomial counts stalks.</strong> Kazhdan and Lusztig independently showed (using the geometry of Schubert varieties, originally in the \(\ell\)-adic setting) that

\[
P_{v,w}(q) = \sum_i \dim IH^{2i}(X_w)_x \cdot q^i
\]
where \(x\) is any point in the Schubert cell \(C_v\). Evaluating at \(q = 1\) gives the total stalk dimension, which is the desired multiplicity.
</div>

### 5.6 Soergel Bimodules

Wolfgang Soergel introduced an algebraic approach to KL theory via bimodules over a polynomial ring.

<div class="definition">
Let \(R = \mathbb{C}[\mathfrak{h}^*] = \mathrm{Sym}(\mathfrak{h})\) be the polynomial ring, graded so that \(\mathfrak{h}\) has degree 2. For a simple reflection \(s \in S\), the <strong>Soergel bimodule</strong> (or <strong>Bott-Samelson bimodule</strong>) is

\[
B_s = R \otimes_{R^s} R(1),
\]
where \(R^s\) is the ring of \(s\)-invariants and \((1)\) denotes a grading shift. For a reduced expression \(w = s_1 \cdots s_k\), the <strong>Bott-Samelson bimodule</strong> is

\[
BS(s_1, \ldots, s_k) = B_{s_1} \otimes_R B_{s_2} \otimes_R \cdots \otimes_R B_{s_k}.
\]
An <strong>indecomposable Soergel bimodule</strong> \(B_w\) is the unique indecomposable summand of \(BS(s_1, \ldots, s_k)\) that does not appear in Bott-Samelson bimodules for shorter expressions.
</div>

<div class="theorem">
<strong>(Soergel)</strong> The indecomposable Soergel bimodules \(\{B_w : w \in W\}\) categorify the KL basis: in the Grothendieck group of graded \(R\)-bimodules, \([B_w]\) corresponds to the KL basis element \(C'_w\). In particular, the graded rank of \(B_w\) over \(R\) encodes the KL polynomials.
</div>

Soergel bimodules play a central role in the Elias-Williamson proof of the KL positivity conjecture (see Chapter 7).

### 5.7 Connections to Intersection Cohomology

The KL polynomials are non-negative integer coefficient polynomials — this is a geometric fact: they encode dimensions of intersection cohomology stalks of Schubert varieties, which are non-negative by definition. This <strong>positivity</strong> was conjectured by KL and proved geometrically. An algebraic proof, not relying on geometry, was given by Elias and Williamson (2014) using Soergel bimodules and Hodge theory for Soergel bimodules (Chapter 7).

---

## Chapter 6: Quantum Groups and Crystal Bases

The theory of quantum groups, developed independently by Vladimir Drinfeld and Michio Jimbo in the mid-1980s, provides a one-parameter deformation of universal enveloping algebras that is deeply connected to mathematical physics (the Yang-Baxter equation, integrable systems, knot invariants) and to geometry (via Lusztig's geometric construction and Nakajima's quiver varieties). The theory of crystal bases, due to Masaki Kashiwara, reveals a remarkable combinatorial skeleton underlying representations.

### 6.1 The Quantum Group \(U_q(\mathfrak{g})\)

Let \(\mathfrak{g}\) be a complex semisimple Lie algebra with Cartan matrix \((a_{ij})_{1 \leq i,j \leq r}\), and let \(q\) be an indeterminate (or a non-zero complex number that is not a root of unity).

<div class="definition">
The <strong>quantum group</strong> (or <strong>quantized universal enveloping algebra</strong>) \(U_q(\mathfrak{g})\) is the \(\mathbb{Q}(q)\)-algebra generated by \(E_i, F_i, K_i, K_i^{-1}\) for \(1 \leq i \leq r\), subject to the relations:
<ul>
<li>\(K_i K_j = K_j K_i\), \(K_i K_i^{-1} = K_i^{-1} K_i = 1\).</li>
<li>\(K_i E_j K_i^{-1} = q_i^{a_{ij}} E_j\) and \(K_i F_j K_i^{-1} = q_i^{-a_{ij}} F_j\), where \(q_i = q^{d_i}\) and \(d_i\) are the symmetrizing integers.</li>
<li>\([E_i, F_j] = \delta_{ij} \frac{K_i - K_i^{-1}}{q_i - q_i^{-1}}\).</li>
<li>The <strong>quantum Serre relations</strong>: for \(i \neq j\),

\[
\sum_{k=0}^{1 - a_{ij}} (-1)^k \binom{1 - a_{ij}}{k}_{q_i} E_i^{1 - a_{ij} - k} E_j E_i^k = 0
\]
and similarly for the \(F_i\)'s.</li>
</ul>
Here \(\binom{n}{k}_q = \frac{[n]_q!}{[k]_q! [n-k]_q!}\) is the quantum binomial coefficient, with \([n]_q = \frac{q^n - q^{-n}}{q - q^{-1}}\).
</div>

As \(q \to 1\), the quantum group \(U_q(\mathfrak{g})\) degenerates to the universal enveloping algebra \(U(\mathfrak{g})\), with \(K_i \to 1\), \(E_i \to e_i\), \(F_i \to f_i\).

<div class="example">
For \(\mathfrak{g} = \mathfrak{sl}_2\), the quantum group \(U_q(\mathfrak{sl}_2)\) is generated by \(E, F, K, K^{-1}\) with:

\[
KEK^{-1} = q^2 E, \quad KFK^{-1} = q^{-2} F, \quad [E, F] = \frac{K - K^{-1}}{q - q^{-1}}.
\]
The finite-dimensional irreducible representations \(V_n\) (for \(n \geq 0\)) have dimension \(n + 1\), with basis \(v_0, \ldots, v_n\) and actions:

\[
K v_j = q^{n - 2j} v_j, \quad E v_j = [n - j + 1]_q v_{j-1}, \quad F v_j = [j + 1]_q v_{j+1}.
\]
</div>

### 6.2 The Quantum Yang-Baxter Equation

One of the original motivations for quantum groups comes from mathematical physics.

<div class="definition">
The <strong>quantum Yang-Baxter equation</strong> (QYBE) for an invertible operator \(R \in \mathrm{End}(V \otimes V)\) is

\[
R_{12} R_{13} R_{23} = R_{23} R_{13} R_{12} \quad \in \mathrm{End}(V \otimes V \otimes V),
\]
where \(R_{ij}\) acts as \(R\) on the \(i\)-th and \(j\)-th tensor factors and as the identity on the remaining factor.
</div>

The quantum group \(U_q(\mathfrak{g})\) is a <strong>quasitriangular Hopf algebra</strong>: it carries a universal R-matrix \(\mathcal{R} \in U_q(\mathfrak{g})^{\hat{\otimes} 2}\) that provides solutions to the QYBE in any representation. This structure underlies the construction of quantum knot invariants (the Jones polynomial, HOMFLY polynomial, etc.) and quantum integrable systems.

### 6.3 Representations of Quantum Groups

<div class="theorem">
When \(q\) is not a root of unity, the category of finite-dimensional representations of \(U_q(\mathfrak{g})\) is semisimple and equivalent (as a tensor category) to the category of finite-dimensional representations of \(\mathfrak{g}\). The irreducible representations \(V_q(\lambda)\) are parametrized by dominant weights \(\lambda\), with the same dimension formula (Weyl's formula) and character formula as in the classical case.
</div>

Despite this abstract equivalence, the quantum and classical categories differ as <strong>braided tensor categories</strong> — the braiding provided by the R-matrix is non-trivial and carries the knot-invariant information.

### 6.4 Crystal Bases

Crystal bases, introduced by Kashiwara in 1990, provide a combinatorial framework for studying representations that is intrinsic to the quantum group.

<div class="definition">
Let \(V\) be a finite-dimensional \(U_q(\mathfrak{g})\)-module. A <strong>crystal basis</strong> of \(V\) is a pair \((\mathcal{L}, \mathcal{B})\) where:
<ul>
<li>\(\mathcal{L}\) is a free \(\mathbb{A}\)-submodule of \(V\) (where \(\mathbb{A} = \{f(q) \in \mathbb{Q}(q) : f \text{ is regular at } q = 0\}\)) such that \(V = \mathbb{Q}(q) \otimes_\mathbb{A} \mathcal{L}\).</li>
<li>\(\mathcal{B}\) is a basis of the \(\mathbb{Q}\)-vector space \(\mathcal{L}/q\mathcal{L}\).</li>
<li>The Kashiwara operators \(\tilde{e}_i, \tilde{f}_i\) (modified divided-power versions of \(E_i, F_i\)) preserve \(\mathcal{L}\) and induce operators on \(\mathcal{L}/q\mathcal{L}\) that permute \(\mathcal{B} \cup \{0\}\).</li>
</ul>
</div>

The key insight is that at \(q = 0\) (the "crystal limit"), the representation theory simplifies dramatically: the operators \(\tilde{e}_i, \tilde{f}_i\) become purely combinatorial — they either move a basis vector to another basis vector or annihilate it.

<div class="theorem">
<strong>(Kashiwara)</strong> Every finite-dimensional irreducible \(U_q(\mathfrak{g})\)-module \(V_q(\lambda)\) has a unique crystal basis \((\mathcal{L}(\lambda), \mathcal{B}(\lambda))\), up to scalar multiple of the highest weight vector.
</div>

<div class="definition">
A <strong>crystal</strong> (or <strong>abstract crystal</strong>) is a set \(B\) together with maps \(\tilde{e}_i, \tilde{f}_i: B \to B \cup \{0\}\) and maps \(\mathrm{wt}: B \to X^*(T)\), \(\varepsilon_i, \varphi_i: B \to \mathbb{Z} \cup \{-\infty\}\) satisfying compatibility conditions that abstract the properties of crystal bases.
</div>

### 6.5 Tensor Product Rule and Crystal Graphs

One of the great advantages of crystal bases is that the tensor product of crystals is described by a simple combinatorial rule.

<div class="theorem">
<strong>Tensor Product Rule for Crystals.</strong> If \(\mathcal{B}_1\) and \(\mathcal{B}_2\) are crystal bases for \(V_1\) and \(V_2\), then the crystal basis for \(V_1 \otimes V_2\) is \(\mathcal{B}_1 \otimes \mathcal{B}_2 = \{b_1 \otimes b_2 : b_1 \in \mathcal{B}_1, b_2 \in \mathcal{B}_2\}\) with operators:

\[
\tilde{f}_i(b_1 \otimes b_2) = \begin{cases} \tilde{f}_i(b_1) \otimes b_2 & \text{if } \varphi_i(b_1) > \varepsilon_i(b_2), \\ b_1 \otimes \tilde{f}_i(b_2) & \text{if } \varphi_i(b_1) \leq \varepsilon_i(b_2). \end{cases}
\]
</div>

<div class="example">
For \(\mathfrak{sl}_2\), the crystal of the fundamental representation \(V_q(\omega_1)\) is the set \(\{+, -\}\) with \(\tilde{f}(+) = -\), \(\tilde{f}(-) = 0\), \(\tilde{e}(-) = +\), \(\tilde{e}(+) = 0\). The tensor product rule applied to \(V_q(\omega_1)^{\otimes 2}\) gives a crystal of four elements: \(++ , +-, -+, --\). The connected components are \(\{++, +-, --\}\) (the crystal of \(V_q(2\omega_1)\), the 3-dimensional representation) and \(\{-+\}\) (the crystal of the trivial representation). This recovers \(V(1) \otimes V(1) = V(2) \oplus V(0)\).
</div>

For type \(A\), crystal basis theory has a beautiful combinatorial incarnation in terms of Young tableaux and the Littlewood-Richardson rule.

### 6.6 Canonical Bases

Lusztig independently discovered a basis with similar remarkable properties, which he called the <strong>canonical basis</strong>.

<div class="definition">
The <strong>canonical basis</strong> (or <strong>global crystal basis</strong>) of the negative part \(U_q^-(\mathfrak{g})\) of the quantum group is the unique basis \(\{G(b) : b \in \mathcal{B}(\infty)\}\) of \(U_q^-(\mathfrak{g})\) that:
<ul>
<li>is invariant under the bar involution \(\overline{(\cdot)}\),</li>
<li>is congruent to the crystal basis modulo \(q \cdot \mathcal{L}(\infty)\).</li>
</ul>
This is a \(\mathbb{Z}[q, q^{-1}]\)-basis whose structure constants with respect to multiplication are in \(\mathbb{Z}_{\geq 0}[q, q^{-1}]\) (positivity).
</div>

Kashiwara proved that the global crystal basis coincides with Lusztig's canonical basis. The positivity of structure constants has a geometric explanation via Lusztig's construction.

### 6.7 Lusztig's Geometric Construction

Lusztig gave a geometric construction of the canonical basis and of the quantum group itself using perverse sheaves on quiver varieties.

Let \(Q\) be a quiver whose underlying graph is the Dynkin diagram of \(\mathfrak{g}\), and fix a dimension vector \(\mathbf{v}\). The representation space

\[
E_\mathbf{v} = \bigoplus_{(i \to j) \in Q} \mathrm{Hom}(k^{v_i}, k^{v_j})
\]
carries an action of \(G_\mathbf{v} = \prod_i \mathrm{GL}(v_i)\) by base change.

<div class="theorem">
<strong>(Lusztig)</strong> The \(G_\mathbf{v}\)-equivariant perverse sheaves on \(E_\mathbf{v}\) (specifically, the simple ones) are in bijection with the canonical basis elements of weight \(\mathbf{v}\). The convolution product on the equivariant derived categories categorifies the multiplication in \(U_q^-(\mathfrak{g})\). The canonical basis elements correspond to IC sheaves, and the positivity of structure constants follows from the decomposition theorem.
</div>

### 6.8 Nakajima Quiver Varieties

Hiraku Nakajima, building on work of Kronheimer and others, introduced in the 1990s a class of hyperkähler varieties that provide geometric realizations of highest-weight representations.

<div class="definition">
Fix a quiver \(Q\) with vertex set \(I\), a dimension vector \(\mathbf{v} = (v_i)_{i \in I}\), and a framing vector \(\mathbf{w} = (w_i)_{i \in I}\). The <strong>Nakajima quiver variety</strong> is the hyperkähler quotient

\[
\mathfrak{M}(\mathbf{v}, \mathbf{w}) = T^*\mathrm{Rep}(Q, \mathbf{v}, \mathbf{w}) /\!\!/\!\!/ G_\mathbf{v},
\]
where \(\mathrm{Rep}(Q, \mathbf{v}, \mathbf{w})\) is the space of framed representations of \(Q\), and the quotient is taken with respect to a stability condition.
</div>

More concretely, for a quiver \(Q\) with adjacency matrix \(a_{ij}\), the representation space includes, for each edge, a pair of maps (in both directions due to the cotangent bundle), plus framing maps. The moment map equations and stability conditions cut out a smooth variety.

<div class="theorem">
<strong>(Nakajima)</strong>
<ol>
<li>The direct sum of top Borel-Moore homologies

\[
\bigoplus_\mathbf{v} H_{2d(\mathbf{v})}^{BM}(\mathfrak{M}(\mathbf{v}, \mathbf{w}))
\]
is isomorphic, as a representation of \(\mathfrak{g}\), to the irreducible highest-weight representation \(V(\lambda)\), where \(\lambda = \sum_i w_i \omega_i\) is the dominant weight determined by the framing vector.</li>
<li>The correspondences (Hecke correspondences) between quiver varieties with different dimension vectors provide geometric realizations of the Chevalley generators \(e_i, f_i\).</li>
<li>Fixed points under a torus action on \(\mathfrak{M}(\mathbf{v}, \mathbf{w})\) give a basis that coincides with the canonical/crystal basis.</li>
</ol>
</div>

<div class="example">
For the quiver of type \(A_1\) (a single vertex, no edges), with \(\mathbf{v} = (n)\) and \(\mathbf{w} = (N)\), the Nakajima quiver variety is the cotangent bundle of the Grassmannian:

\[
\mathfrak{M}(n, N) = T^*\mathrm{Gr}(n, N).
\]
The direct sum over \(n\) of the homology of these spaces recovers the \(N\)-th fundamental representation of \(\mathfrak{sl}_2\), which is \(\mathrm{Sym}^N(\mathbb{C}^2)\).
</div>

---

## Chapter 7: Categorification and Modern Directions

The final chapter surveys the philosophy of categorification and several of its most spectacular applications, representing the cutting edge of geometric representation theory. Here, classical algebraic structures (numbers, vector spaces, linear maps) are "lifted" to richer categorical structures (vector spaces, categories, functors), and profound structural theorems emerge from this lifting.

### 7.1 Categorification Philosophy

<div class="definition">
<strong>Categorification</strong> is the process of replacing set-theoretic or algebraic structures by categorical ones:
<ul>
<li>Natural numbers \(\to\) finite sets (or vector spaces).</li>
<li>Integers \(\to\) virtual vector spaces (Grothendieck group \(K_0\)).</li>
<li>Polynomials with non-negative integer coefficients \(\to\) graded vector spaces.</li>
<li>Linear maps \(\to\) functors.</li>
<li>Equalities \(\to\) natural isomorphisms (or canonical isomorphisms).</li>
</ul>
<strong>Decategorification</strong> is the reverse process: passing to the Grothendieck group, taking Euler characteristics, etc.
</div>

The power of categorification is that it reveals hidden structure: equalities become isomorphisms, and multiplicities become dimensions of spaces that may themselves carry additional symmetries. Positivity results (non-negative integer coefficients) find natural explanations as dimensions of vector spaces.

<div class="example">
The simplest example of categorification: the binomial coefficient \(\binom{n}{k}\) is a non-negative integer. It categorifies to the set of \(k\)-element subsets of an \(n\)-element set (whose cardinality is \(\binom{n}{k}\)), or to the vector space with that set as basis. The identity \(\binom{n}{k} = \binom{n-1}{k-1} + \binom{n-1}{k}\) categorifies to a bijection of sets (or isomorphism of vector spaces).
</div>

### 7.2 Khovanov Homology

Mikhail Khovanov's categorification of the Jones polynomial (1999) was a landmark achievement that brought categorification into the mainstream.

The Jones polynomial \(J(L; q) \in \mathbb{Z}[q, q^{-1}]\) is a knot invariant (an invariant of oriented links in \(S^3\)). It can be computed combinatorially using the Kauffman bracket applied to a link diagram.

<div class="definition">
<strong>Khovanov homology</strong> \(Kh^{i,j}(L)\) is a bigraded abelian group associated to a link \(L\) such that the Jones polynomial is recovered as the graded Euler characteristic:

\[
J(L; q) = \sum_{i,j} (-1)^i q^j \dim Kh^{i,j}(L).
\]
</div>

The construction proceeds by replacing the states in the Kauffman bracket state sum with chain complexes. Each state (a choice of resolution at each crossing) contributes a tensor product of "Frobenius algebras" (specifically, the ring \(A = \mathbb{Z}[x]/(x^2)\)), and the differential arises from the multiplication and comultiplication maps of this algebra.

<div class="remark">
Khovanov homology is strictly stronger than the Jones polynomial: there exist links with the same Jones polynomial but different Khovanov homology. It detects the unknot (Kronheimer-Mrowka, 2011) and the trefoil. Rasmussen (2010) used Khovanov homology to give a combinatorial proof of the Milnor conjecture on the slice genus of torus knots.
</div>

### 7.3 Categorical Actions of Lie Algebras

The idea of categorifying Lie algebra representations was developed systematically by Chuang and Rouquier (2008) and independently by Khovanov and Lauda (2010) and Rouquier (2008).

<div class="definition">
A <strong>categorical \(\mathfrak{sl}_2\)-action</strong> on an abelian category \(\mathcal{C}\) consists of:
<ul>
<li>A direct sum decomposition \(\mathcal{C} = \bigoplus_{n \in \mathbb{Z}} \mathcal{C}_n\) (the "weight spaces").</li>
<li>Exact functors \(E: \mathcal{C}_n \to \mathcal{C}_{n+2}\) and \(F: \mathcal{C}_n \to \mathcal{C}_{n-2}\) (categorifying the generators).</li>
<li>Natural transformations \(X: E \Rightarrow E\) and \(T: E^2 \Rightarrow E^2\) satisfying the relations of the degenerate affine Hecke algebra (or the KLR algebra in the quantum setting).</li>
<li>The functors satisfy \(EF \cong FE \oplus \mathrm{Id}^{\oplus |n|}\) on \(\mathcal{C}_n\) when \(n \geq 0\) (and similarly for \(n \leq 0\)).</li>
</ul>
</div>

<div class="theorem">
<strong>(Chuang-Rouquier)</strong> If \(\mathcal{C}\) carries a categorical \(\mathfrak{sl}_2\)-action, then the categories \(\mathcal{C}_n\) and \(\mathcal{C}_{-n}\) are derived equivalent. This equivalence categorifies the reflection action of the Weyl group \(W = \{1, s\}\) on weight spaces.
</div>

The Chuang-Rouquier theorem has powerful applications: it proves Broué's abelian defect group conjecture for symmetric groups and gives derived equivalences between blocks of representation categories.

The full framework of categorical Lie algebra actions uses the <strong>KLR algebra</strong> (Khovanov-Lauda-Rouquier algebra), also known as the <strong>quiver Hecke algebra</strong>.

<div class="definition">
For a symmetrizable Kac-Moody algebra \(\mathfrak{g}\), the <strong>KLR algebra</strong> \(R(\nu)\) (for a positive root \(\nu\)) is a graded algebra defined by generators and relations that categorify the quantum group \(U_q^-(\mathfrak{g})\): the Grothendieck group

\[
K_0\left(\bigoplus_\nu R(\nu)\text{-pmod}\right) \cong U_q^-(\mathfrak{g})_{\mathbb{Z}[q,q^{-1}]}
\]
as a \(\mathbb{Z}[q, q^{-1}]\)-algebra, where the grading shift corresponds to multiplication by \(q\).
</div>

### 7.4 Soergel Bimodules and the Elias-Williamson Theorem

The most spectacular application of categorification to Kazhdan-Lusztig theory came in 2014, when Ben Elias and Geordie Williamson gave an algebraic proof of the Kazhdan-Lusztig positivity conjecture using Soergel bimodules.

Recall from Chapter 5 that Soergel bimodules categorify the Hecke algebra: indecomposable Soergel bimodules \(B_w\) correspond to the Kazhdan-Lusztig basis elements \(C'_w\), and the structure constants of the Hecke algebra (with respect to the KL basis) are the graded multiplicities of indecomposable summands in tensor products.

<div class="theorem">
<strong>Soergel's Conjecture (Elias-Williamson, 2014).</strong> The Kazhdan-Lusztig polynomials \(P_{v,w}(q)\) have non-negative integer coefficients for any Coxeter system \((W, S)\).
</div>

For Weyl groups of algebraic groups, this was known from the geometric interpretation (the coefficients are dimensions of intersection cohomology stalks). But for general Coxeter groups (e.g., non-crystallographic types \(H_3, H_4\), or infinite groups), no geometric interpretation was available. Elias and Williamson's proof works for all Coxeter groups.

<div class="proof">
<strong>Proof sketch (Elias-Williamson).</strong> The proof develops a "Hodge theory" for Soergel bimodules, analogous to the Hodge theory of algebraic varieties:

<strong>Step 1: Diagrammatic presentation.</strong> Elias and Williamson give a presentation of the category of Soergel bimodules by generators (planar diagrams) and relations, making the category completely algebraic and combinatorial.

<strong>Step 2: Intersection form.</strong> On each Soergel bimodule, they define an intersection form (a bilinear pairing) analogous to the intersection form on the cohomology of an algebraic variety.

<strong>Step 3: Hard Lefschetz and Hodge-Riemann.</strong> The key technical achievement is proving that the intersection form satisfies the "hard Lefschetz" property and the "Hodge-Riemann bilinear relations" — that is, the intersection form is non-degenerate and has the correct signature pattern. These are the Soergel-bimodule analogues of the hard Lefschetz theorem and the Hodge-Riemann bilinear relations in algebraic geometry.

<strong>Step 4: Positivity.</strong> The Hodge-Riemann relations imply that the transition matrix between Bott-Samelson bimodules and indecomposable Soergel bimodules has non-negative entries, which translates to the positivity of KL polynomials.

This proof is remarkable because it gives a purely algebraic/combinatorial proof of a result that was previously accessible only through deep geometry (intersection cohomology of Schubert varieties, which requires the machinery of \(\ell\)-adic cohomology and the Weil conjectures).
</div>

### 7.5 The Geometric Satake Correspondence

The geometric Satake correspondence (Lusztig, Ginzburg, Beilinson-Drinfeld, Mirković-Vilonen) connects the representation theory of a reductive group to the geometry of the affine Grassmannian.

<div class="definition">
Let \(G\) be a connected reductive group over \(\mathbb{C}\), and let \(G^\vee\) be the Langlands dual group (the reductive group whose root datum is dual to that of \(G\)). The <strong>affine Grassmannian</strong> of \(G\) is

\[
\mathrm{Gr}_G = G(\!(t)\!) / G[\![t]\!],
\]
the quotient of the loop group by the positive loop group (here \(t\) is a formal parameter).
</div>

The affine Grassmannian is an ind-scheme (an infinite-dimensional algebraic variety expressed as a union of finite-dimensional projective varieties). It has a natural stratification by \(G[\![t]\!]\)-orbits indexed by dominant coweights \(\lambda^\vee\).

<div class="theorem">
<strong>Geometric Satake Correspondence.</strong> There is an equivalence of tensor categories

\[
\mathrm{Perv}_{G[\![t]\!]}(\mathrm{Gr}_G) \cong \mathrm{Rep}(G^\vee)
\]
between the category of \(G[\![t]\!]\)-equivariant perverse sheaves on the affine Grassmannian and the category of finite-dimensional algebraic representations of the Langlands dual group \(G^\vee\). Under this equivalence:
<ul>
<li>The IC sheaf of the orbit closure \(\overline{\mathrm{Gr}_G^\lambda}\) corresponds to the irreducible representation \(V(\lambda)\) of \(G^\vee\).</li>
<li>The convolution product on perverse sheaves corresponds to the tensor product of representations.</li>
<li>The hypercohomology functor is the fiber functor, recovering \(G^\vee\) via Tannakian reconstruction.</li>
</ul>
</div>

<div class="remark">
The geometric Satake correspondence is remarkable because it constructs the Langlands dual group \(G^\vee\) purely from the geometry of \(G\). It provides the geometric foundations for the geometric Langlands program.
</div>

<div class="example">
For \(G = \mathrm{SL}_2\), the Langlands dual is \(G^\vee = \mathrm{PGL}_2\). The affine Grassmannian \(\mathrm{Gr}_{\mathrm{SL}_2}\) is stratified by orbits indexed by non-negative integers \(n \geq 0\). The IC sheaf of the \(n\)-th orbit closure corresponds to the \((n+1)\)-dimensional irreducible representation of \(\mathrm{PGL}_2\). The convolution of the IC sheaves of the \(m\)-th and \(n\)-th orbit closures decomposes according to the Clebsch-Gordan rule.
</div>

### 7.6 The Geometric Langlands Program

The geometric Langlands program, initiated by Drinfeld and developed extensively by Beilinson, Drinfeld, Frenkel, Gaitsgory, and many others, is a vast program that reinterprets the Langlands correspondence in geometric terms.

Let \(\Sigma\) be a smooth projective algebraic curve over \(\mathbb{C}\).

<div class="definition">
The <strong>moduli stack of \(G\)-bundles</strong> on \(\Sigma\) is denoted \(\mathrm{Bun}_G(\Sigma)\). The <strong>moduli stack of \(G^\vee\)-local systems</strong> on \(\Sigma\) is denoted \(\mathrm{Loc}_{G^\vee}(\Sigma)\).
</div>

The geometric Langlands conjecture (in its strongest form, due to Arinkin-Gaitsgory) posits an equivalence of derived categories:

\[
D\text{-}\mathrm{mod}(\mathrm{Bun}_G(\Sigma)) \cong \mathrm{IndCoh}(\mathrm{Loc}_{G^\vee}(\Sigma))
\]
between D-modules on the moduli of \(G\)-bundles and ind-coherent sheaves on the moduli of \(G^\vee\)-local systems. This is a categorification of the classical (number-theoretic) Langlands correspondence, where automorphic forms on \(\mathrm{Bun}_G\) correspond to Galois representations valued in \(G^\vee\).

<div class="remark">
In 2024, a proof of the unramified geometric Langlands conjecture was announced by Gaitsgory and collaborators (Arinkin, Beraldo, Chen, Faergeman, Lin, Raskin). This represents one of the crowning achievements of geometric representation theory, building on decades of foundational work in derived algebraic geometry, higher category theory, and the theory of ind-coherent sheaves.
</div>

The geometric Langlands program ties together essentially all the themes of this course: D-modules and perverse sheaves on algebraic stacks, the geometric Satake correspondence (which provides the "local" input), and categorification (the entire program is a categorification of the classical Langlands correspondence).

### 7.7 Symplectic Resolutions and Symplectic Duality

We conclude with a modern framework that unifies many of the geometric constructions encountered in this course.

<div class="definition">
A <strong>symplectic resolution</strong> is a projective morphism \(\pi: \widetilde{X} \to X\) where \(\widetilde{X}\) is a smooth algebraic variety equipped with an algebraic symplectic form \(\omega \in H^0(\widetilde{X}, \Omega^2_{\widetilde{X}})\), \(X\) is a normal affine variety, and \(\pi\) is a birational projective morphism.
</div>

<div class="example">
The key examples encountered in this course are:
<ul>
<li>The Springer resolution \(\widetilde{\mathcal{N}} \to \mathcal{N}\) (the cotangent bundle of the flag variety resolving the nilpotent cone).</li>
<li>Nakajima quiver varieties \(\mathfrak{M}(\mathbf{v}, \mathbf{w}) \to \mathfrak{M}_0(\mathbf{v}, \mathbf{w})\).</li>
<li>Hilbert schemes of points on surfaces: \(\mathrm{Hilb}^n(\mathbb{C}^2) \to \mathrm{Sym}^n(\mathbb{C}^2)\).</li>
<li>Slodowy slices and their resolutions.</li>
</ul>
</div>

Symplectic resolutions have exceptional geometric and representation-theoretic properties:
- The pushforward of the constant sheaf under \(\pi\) is a semisimple perverse sheaf (by the decomposition theorem), and its endomorphism algebra defines important algebras (e.g., Weyl group algebras, rational Cherednik algebras, quantized quiver varieties).
- The quantization of \(X\) (deformation of the commutative coordinate ring to a non-commutative algebra) often has deep representation-theoretic significance.

<div class="definition">
<strong>Symplectic duality</strong> (or <strong>3d mirror symmetry</strong>, after Intriligator-Seiberg and Braden-Licata-Proudfoot-Webster) is a conjectural relationship between pairs \((X, X^!)\) of symplectic resolutions (or, more generally, conical symplectic singularities). Under this duality:
<ul>
<li>The Coulomb branch of \(X\) is identified with the Higgs branch of \(X^!\) and vice versa.</li>
<li>Category \(\mathcal{O}\) for \(X\) is Koszul dual to category \(\mathcal{O}\) for \(X^!\).</li>
<li>Quantization parameters for \(X\) correspond to deformation parameters for \(X^!\).</li>
</ul>
</div>

<div class="example">
The foundational example of symplectic duality is:
<ul>
<li>\(X = T^*\mathrm{Gr}(k, n)\), the cotangent bundle of the Grassmannian.</li>
<li>\(X^! = T^*\mathrm{Gr}(n-k, n)\), the cotangent bundle of the dual Grassmannian.</li>
</ul>
More generally, Nakajima quiver varieties for a quiver \(Q\) are expected to be dual to Nakajima quiver varieties for the "Langlands dual" quiver (obtained by transposing the adjacency matrix in the non-simply-laced case, and related to Coulomb branch constructions of Braverman-Finkelberg-Nakajima in general).
</div>

<div class="remark">
The theory of Coulomb branches, developed rigorously by Braverman, Finkelberg, and Nakajima using gauge-theoretic methods, provides mathematical definitions of the varieties predicted by 3d \(\mathcal{N} = 4\) supersymmetric gauge theory. These Coulomb branches are conical symplectic singularities, and their study has become a major active area at the intersection of representation theory, algebraic geometry, and mathematical physics.
</div>

The unifying theme of geometric representation theory is now clear: the interplay between geometry (algebraic varieties, sheaves, cohomology) and algebra (representations, categories, functors) is not merely an analogy but a deep structural principle. From the Borel-Weil theorem (representations as sections of line bundles) through the Springer correspondence (Weyl group representations from cohomology of fibers) to the geometric Langlands program (automorphic representations as D-modules), the geometric perspective has revealed structures invisible to purely algebraic methods and has driven some of the most profound advances in modern mathematics.
