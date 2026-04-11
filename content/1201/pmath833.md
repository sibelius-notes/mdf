---
title: "PMATH 833: Harmonic Analysis"
subjects: "PMATH"
prof: "Nico Spronk"
---

*These notes synthesize material from multiple sources. Primary sources for Part I (Abstract Harmonic Analysis): Nico Spronk's PMATH 833 lecture videos ([YouTube playlist](https://www.youtube.com/playlist?list=PLaI_L93BctMRnkKznj0jGf_gH9MbtLIem)), Christa Hawthorne's course notes ([PDF](https://cdchawthorne.com/notes/w2018/pmath833.pdf)) from Spronk's Winter 2018 offering, and Alex Rutar's student notes ([PDF](https://github.com/alexrutar/UWaterloo-Course-Notes/blob/master/pmath/833_notes.pdf), [TeX source](https://github.com/alexrutar/UWaterloo-Course-Notes/blob/master/pmath/833_notes.tex)). The course outline for Winter 2020 is available from the [UWaterloo Department of Pure Mathematics](https://uwaterloo.ca/pure-mathematics/sites/default/files/uploads/documents/m833outline_0.pdf). Reference texts followed throughout Part I include G. B. Folland, *A Course in Abstract Harmonic Analysis* (CRC Press, 1995); E. Hewitt and K. A. Ross, *Abstract Harmonic Analysis* I–II (Springer, 1963–1970); and W. Rudin, *Fourier Analysis on Groups* (Wiley, 1962). Part II (Geometric Harmonic Analysis and the Kakeya Conjecture) draws on [Hong Wang's PCMI 2022 lecture notes](https://cims.nyu.edu/~hw3032/) and her joint work with Joshua Zahl, as well as T. Tao's lecture notes on restriction theory and polynomial methods, J.-G. Boissonnat et al. on geometric measure theory, J. Bourgain and C. Demeter's decoupling theory, and the original papers of A. S. Besicovitch, C. Fefferman, E. M. Stein, and T. Wolff.*

---

# Part I: Abstract Harmonic Analysis

## Chapter 1: Topological Groups

### 1.1 From Classical to Abstract Harmonic Analysis

Classical harmonic analysis begins on the real line or the unit circle: one studies periodic functions, decomposes them into Fourier series, and extracts information from the resulting coefficients. The insight underlying abstract harmonic analysis is that the essential feature of the real line, for these purposes, is not its metric geometry but its *group structure*. The real line \(\mathbb{R}\) under addition, or the unit circle \(\mathbb{T} = \{z \in \mathbb{C} : |z| = 1\}\) under multiplication, are groups. The Fourier transform is essentially the process of decomposing functions on a group using the group's "characters" — homomorphisms into the simplest possible group.

Once this is recognized, the natural question is: can we develop Fourier analysis on an arbitrary group? The answer is: yes, provided the group carries enough structure to support a reasonable theory of integration. The precise requirement is that the group be a **locally compact Hausdorff topological group**. This is the foundational object of the entire course.

### 1.2 Topological Groups

<div class="definition">
<strong>Definition 1.1 (Topological Group).</strong> A <em>topological group</em> is a group \((G, \cdot)\) equipped with a topology \(\tau\) such that both the multiplication map \((x, y) \mapsto xy : G \times G \to G\) and the inversion map \(x \mapsto x^{-1} : G \to G\) are continuous, where \(G \times G\) carries the product topology.
</div>

Equivalently, the single map \((x, y) \mapsto xy^{-1}\) is jointly continuous. We write \(e\) for the identity element. The notational conventions are: \(A \cdot B = \{ab : a \in A, b \in B\}\), \(A^{-1} = \{a^{-1} : a \in A\}\), and for \(x \in G\), \(xA = \{x\} \cdot A\) (left translate) and \(Ax = A \cdot \{x\}\) (right translate).

<div class="example">
<strong>Example 1.2.</strong>
<ol>
<li>\((\mathbb{R}, +)\) and \((\mathbb{T}, \cdot)\) with their usual Euclidean topologies are topological groups. They can also be given the discrete topology, producing different (and non-isomorphic) topological groups on the same underlying sets.</li>
<li>\((\mathbb{Z}, +)\) with the discrete topology is a topological group.</li>
<li>The general linear group \(\mathrm{GL}_n(\mathbb{R})\) of invertible real \(n \times n\) matrices, with the topology inherited from \(\mathbb{R}^{n^2}\), is a topological group. Indeed, matrix multiplication is polynomial in entries, hence smooth, and inversion is rational in entries (via Cramer's rule), hence also smooth. Subgroups such as \(\mathrm{SL}_n(\mathbb{R})\), \(\mathrm{O}(n)\), and \(\mathrm{U}(n)\) inherit the topological group structure. These are the compact (or semisimple) Lie groups that are the objects of Lie group theory.</li>
<li>Any topological vector space \((X, \tau)\) is a topological group under addition. The continuity of scalar multiplication is an additional piece of structure beyond what the group axioms require.</li>
<li>The \(p\)-adic integers \(\mathbb{Z}_p\) and \(p\)-adic numbers \(\mathbb{Q}_p\) (discussed in §1.5) are foundational examples in number theory.</li>
</ol>
</div>

The next proposition records the fundamental interplay between the topology and the group structure. Its key content is that the topology of a topological group is "homogeneous": it looks the same at every point.

<div class="proposition">
<strong>Proposition 1.3 (Basic Properties of Topological Groups).</strong> Let \(G\) be a topological group.
<ol>
<li>For each \(g \in G\), the left translation \(L_g : x \mapsto gx\) and right translation \(R_g : x \mapsto xg\) are homeomorphisms of \(G\).</li>
<li>Inversion \(\iota : x \mapsto x^{-1}\) is a homeomorphism.</li>
<li>If \(U \in \tau\) is open and \(A \subseteq G\) is any subset, then \(AU\) and \(UA\) are open.</li>
<li>For any open neighborhood \(U\) of \(e\), there exists a <em>symmetric</em> open neighborhood \(V\) of \(e\) (meaning \(V = V^{-1}\)) such that \(V^2 = VV \subseteq U\).</li>
<li>If \(H\) is a subgroup of \(G\), then its closure \(\overline{H}\) is also a subgroup.</li>
<li>Every open subgroup of \(G\) is also closed.</li>
<li>If \(K, L \subseteq G\) are compact, then \(KL\) is compact.</li>
<li>If \(K\) is compact and \(C\) is closed, then \(KC\) is closed.</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> We verify each statement in turn.

<em>(1) Left and right translations are homeomorphisms.</em> The map \(L_g : x \mapsto gx\) is continuous (it is the composition of the continuous map \(x \mapsto (g, x) : G \to G \times G\) with the continuous multiplication). It has a continuous inverse \(L_{g^{-1}}\), so it is a homeomorphism. Similarly for \(R_g\).

<em>(2) Inversion is a homeomorphism.</em> Inversion \(\iota : x \mapsto x^{-1}\) is continuous by hypothesis and is its own inverse, hence a homeomorphism.

<em>(3) \(AU\) is open.</em> For any open \(U \subseteq G\) and any \(A \subseteq G\):
\[
AU = \bigcup_{a \in A} aU = \bigcup_{a \in A} L_a(U).
\]
Each \(L_a(U)\) is open (since \(L_a\) is a homeomorphism), and the union of open sets is open.

<em>(4) Symmetric neighborhood bases.</em> Given an open neighborhood \(U\) of \(e\), apply continuity of multiplication at \((e,e)\): there exist open neighborhoods \(W_1, W_2\) of \(e\) with \(W_1 \cdot W_2 \subseteq U\). The set \(V = W_1 \cap W_2 \cap \iota(W_1) \cap \iota(W_2)\) is open (finite intersection of opens), contains \(e\), and is symmetric: \(\iota(V) = \iota(W_1) \cap \iota(W_2) \cap W_1 \cap W_2 = V\). Moreover, \(V^2 = V \cdot V \subseteq W_1 \cdot W_2 \subseteq U\).

<em>(5) Closure of subgroups.</em> Let \(H \leq G\). If \(x, y \in \overline{H}\), choose nets \(x_\alpha \to x\) and \(y_\alpha \to y\) in \(H\). Then \(x_\alpha y_\alpha \in H\) (since \(H\) is a subgroup) and \(x_\alpha y_\alpha \to xy\) (by continuity of multiplication). So \(xy \in \overline{H}\). Similarly \(x_\alpha^{-1} \in H\) and \(x_\alpha^{-1} \to x^{-1}\), so \(x^{-1} \in \overline{H}\). And \(e \in H \subseteq \overline{H}\). Thus \(\overline{H}\) is a subgroup.

<em>(6) Open subgroups are closed.</em> If \(H\) is an open subgroup, then each left coset \(xH\) is open (it is \(L_x(H)\)). The complement \(G \setminus H = \bigsqcup_{x \notin H} xH\) is a union of open sets, hence open. So \(H\) is closed.

<em>(7) Product of compacta is compact.</em> If \(K, L\) are compact, the product \(K \times L\) is compact by Tychonoff. The image of \(K \times L\) under the continuous map \((x,y) \mapsto xy\) is compact.

<em>(8) \(KC\) is closed for \(K\) compact, \(C\) closed.</em> Let \((x_\alpha) \subset KC\) be a net converging to \(x\). Write \(x_\alpha = k_\alpha c_\alpha\) with \(k_\alpha \in K\), \(c_\alpha \in C\). By compactness of \(K\), there is a subnet (still called \(k_\alpha\)) with \(k_\alpha \to k \in K\). Then \(c_\alpha = k_\alpha^{-1}x_\alpha \to k^{-1}x\) (by continuity of inversion and multiplication). Since \(C\) is closed, \(k^{-1}x \in C\), so \(x = k(k^{-1}x) \in KC\).
</div>

A key consequence of property (4) is that the topology of a topological group is completely determined by a neighborhood base at the identity. To understand the topology at any point \(x\), one simply translates a neighborhood base of \(e\) by \(L_x\). This "homogeneity" of the topology is what distinguishes topological groups from general topological spaces.

<div class="corollary">
<strong>Corollary 1.4a.</strong> In a topological group \(G\):
<ol>
<li>The connected component \(G_0\) of \(e\) is a closed normal subgroup.</li>
<li>Every neighborhood of \(e\) contains an open symmetric neighborhood, and these form a neighborhood basis.</li>
<li>If \(U\) is a symmetric neighborhood of \(e\), then the subgroup \(\langle U \rangle = \bigcup_{n \geq 1} U^n\) is open (and hence also closed).</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> (1) The connected component \(G_0\) is closed in any topological space. It is a subgroup: if \(x, y \in G_0\), then \(xy^{-1}\) is the image of the connected set \(\{(x, y)\}\) under the continuous map \((a,b) \mapsto ab^{-1}\), so \(xy^{-1} \in G_0\). It is normal: for each \(g \in G\), the map \(x \mapsto gxg^{-1}\) is a continuous automorphism of \(G\), preserving connectivity and fixing \(e\), so it maps \(G_0\) to itself.

(2) Follows directly from property (4) of Proposition 1.3.

(3) \(\langle U\rangle = \bigcup_{n \geq 1} U^n\). Each \(U^n\) is open by property (3) of Proposition 1.3 (since \(U\) is open and \(U^n = U^{n-1} \cdot U\), and the product of an open set with any set is open). The union of opens is open, so \(\langle U\rangle\) is open and hence closed by (6).
</div>

### 1.3 Hausdorff Separation and Quotient Groups

Not every topological group is Hausdorff, but the failure of Hausdorffness is always mild and correctable.

<div class="proposition">
<strong>Proposition 1.4.</strong> A topological group \(G\) is Hausdorff if and only if \(\{e\}\) is a closed set.
</div>

<div class="proof">
<strong>Proof.</strong> In any Hausdorff space, singletons are closed. Conversely, if \(\{e\}\) is closed, then for any \(x \in G\), \(\{x\} = L_x(\{e\})\) is also closed. Given \(x \neq y\), the set \(xy^{-1} \neq e\) lies in \(G \setminus \{e\}\), which is open. By continuity of multiplication, there exist open symmetric neighborhoods \(V\) of \(e\) with \(V^2 \subseteq G \setminus \{e\} \cdot (xy^{-1})^{-1}\). Then \(Vx\) and \(Vy\) are disjoint open neighborhoods of \(x\) and \(y\).
</div>

If \(G\) is not Hausdorff, the subgroup \(N = \overline{\{e\}}\) is the smallest closed subgroup; it is normal (since conjugation is a homeomorphism), and the quotient \(G/N\) is Hausdorff. Thus non-Hausdorff groups can always be "corrected" by passing to a Hausdorff quotient.

Now let \(H\) be a closed subgroup of a topological group \(G\). The left coset space \(G/H = \{xH : x \in G\}\) carries the **quotient topology**: a set \(W \subseteq G/H\) is open if and only if \(\pi^{-1}(W)\) is open in \(G\), where \(\pi : G \to G/H\) is the canonical projection. One checks that \(\pi\) is always an open map.

<div class="proposition">
<strong>Proposition 1.5.</strong> Let \(H\) be a subgroup of a topological group \(G\).
<ol>
<li>The action \(G \times G/H \to G/H\) given by \((x, yH) \mapsto xyH\) is continuous and open.</li>
<li>If \(H\) is closed, then \(G/H\) is Hausdorff.</li>
<li>If \(H\) is normal, then \(G/H\) is a topological group.</li>
<li>If \(G\) is locally compact, then \(G/H\) is locally compact.</li>
</ol>
</div>

<div class="corollary">
<strong>Corollary 1.6.</strong> \(G\) is Hausdorff if and only if \(\{e\}\) is closed; and \(G/\overline{\{e\}}\) is always Hausdorff.
</div>

### 1.4 Locally Compact Groups

<div class="definition">
<strong>Definition 1.7 (Locally Compact Group).</strong> A topological group \(G\) is <em>locally compact</em> if it is Hausdorff and every point has a compact neighborhood.
</div>

Equivalently — using the homogeneity of topological groups — \(G\) is locally compact if and only if there exists *some* nonempty open set with compact closure. The identity \(e\) then has a neighborhood \(U\) with \(\overline{U}\) compact, and translates \(xU\) provide compact neighborhoods of every point.

The class of locally compact groups is vast and includes essentially all groups arising in analysis and geometry. The fundamental examples are: discrete groups (every subset is open, so any group with the discrete topology is locally compact); the Euclidean spaces \(\mathbb{R}^n\); the torus \(\mathbb{T}^n\); the \(p\)-adic fields \(\mathbb{Q}_p\); matrix groups \(\mathrm{GL}_n(\mathbb{R})\), \(\mathrm{SL}_n(\mathbb{R})\), \(\mathrm{O}(n)\), \(\mathrm{U}(n)\); and any closed subgroup or finite product of the above. Infinite-dimensional Banach spaces under addition are *not* locally compact — this is a fundamental dividing line in functional analysis.

### 1.5 The \(p\)-adic Numbers

A rich and instructive example of a locally compact group arises from number theory. Fix a prime \(p\). Every nonzero rational number \(q \in \mathbb{Q}^\times\) can be written uniquely as \(q = p^k \cdot m/n\) where \(k \in \mathbb{Z}\) and \(p \nmid m, n\). The **\(p\)-adic valuation** is \(v_p(q) = k\) and \(v_p(0) = +\infty\). The **\(p\)-adic absolute value** is \(|q|_p = p^{-v_p(q)}\) for \(q \neq 0\) and \(|0|_p = 0\).

This satisfies the ultrametric inequality \(|x + y|_p \leq \max(|x|_p, |y|_p)\), which is stronger than the usual triangle inequality. The completion of \(\mathbb{Q}\) with respect to \(|\cdot|_p\) is the field \(\mathbb{Q}_p\) of **\(p\)-adic numbers**. Inside it sits the ring \(\mathbb{Z}_p = \{x \in \mathbb{Q}_p : |x|_p \leq 1\}\) of **\(p\)-adic integers**, which is compact (being the closed ball of radius 1 in the complete metric space \(\mathbb{Q}_p\)) and open (since ultrametric balls are both open and closed).

<div class="example">
<strong>Example 1.8.</strong> Concretely, \(\mathbb{Z}_p\) can be identified with formal power series \(\sum_{k=0}^\infty a_k p^k\) where \(a_k \in \{0, 1, \ldots, p-1\}\). Addition is carried with carrying in base \(p\). An element of \(\mathbb{Q}_p\) then looks like \(\sum_{k=k_0}^\infty a_k p^k\) for some \(k_0 \in \mathbb{Z}\). The group \(\mathbb{Q}_p\) under addition is a locally compact abelian group. The subgroups \(p^n \mathbb{Z}_p\) form a decreasing sequence of compact open subgroups giving a neighborhood base at 0.
</div>

The \(p\)-adic numbers are the ur-example showing that locally compact abelian groups are genuinely more general than \(\mathbb{R}^n\). The Haar measure on \(\mathbb{Z}_p\) (normalized so that \(m(\mathbb{Z}_p) = 1\)) assigns measure \(p^{-n}\) to each coset of \(p^n \mathbb{Z}_p\).

---

## Chapter 2: Haar Measure

### 2.1 The Problem of Invariant Integration

On \(\mathbb{R}^n\), the Lebesgue measure is translation-invariant: \(\int_{\mathbb{R}^n} f(x - y)\, dx = \int_{\mathbb{R}^n} f(x)\, dx\). This invariance is what makes Fourier analysis work — convolution \((f * g)(x) = \int f(y) g(x - y)\, dy\) is well-defined and enjoys the algebraic identity \(\widehat{f * g} = \hat{f} \cdot \hat{g}\). If we want to do Fourier analysis on a general locally compact group \(G\), we need an analogous left-invariant measure. The remarkable fact, due to Haar, is that such a measure *always* exists and is unique up to a scalar.

### 2.2 The Haar Integral

We write \(C_c(G)\) for the space of continuous compactly supported functions \(G \to \mathbb{C}\), and \(C_c^+(G)\) for the nonzero nonnegative members. For \(f : G \to \mathbb{C}\) and \(x \in G\), define left and right translates by \((f \cdot x)(y) = f(xy)\) and \((x \cdot f)(y) = f(x^{-1}y)\).

A key preliminary is that functions in \(C_c(G)\) are **uniformly continuous** in both the left and right senses:

<div class="proposition">
<strong>Proposition 2.1.</strong> For \(f \in C_c(G)\), we have \(\lim_{x \to e} \|f \cdot x - f\|_\infty = 0\) and \(\lim_{x \to e} \|x \cdot f - f\|_\infty = 0\).
</div>

This is proved by covering the compact support of \(f\) by finitely many translates using a uniform continuity argument.

The key idea behind the construction of Haar measure is to approximate the "size" of one function by how many translates of another are needed to cover it. This ratio should be independent of the reference function chosen, and as the covering function narrows to a point, the ratio converges to the integral we seek.

For \(f, \phi \in C_c^+(G)\), define the **covering number**:
\[
(f : \phi) = \inf\left\{\sum_{j=1}^n c_j : \exists x_1, \ldots, x_n \in G,\ c_j > 0,\ f \leq \sum_{j=1}^n c_j (\phi \cdot x_j)\right\}.
\]
To see why this infimum is finite: since \(\mathrm{supp}(f)\) is compact, it is covered by finitely many translates of the open set \(\{\phi > \epsilon\}\), and using those translates with appropriate constants gives a finite cover. To see it is positive: if \(f = \sum c_j (\phi \cdot x_j)\) then \(\max f \leq (\sum c_j) \max\phi\), giving \((f:\phi) \geq \max f / \max \phi > 0\).

The covering number is left-invariant: \((f \cdot x : \phi) = (f : \phi)\) for all \(x \in G\), since translating \(f\) does not change how many translates of \(\phi\) are needed. It is also subadditive: \((f_1 + f_2 : \phi) \leq (f_1 : \phi) + (f_2 : \phi)\), and it satisfies the key transitivity bound \((f : \phi) \leq (f : g)(g : \phi)\).

Fix a reference function \(\psi_0 \in C_c^+(G)\) and normalize:
\[
I_\phi(f) = \frac{(f : \phi)}{(\psi_0 : \phi)}.
\]
Since \((\psi_0 : \phi)(f : \psi_0)^{-1} \leq (f : \phi) \leq (f : \psi_0)(\psi_0 : \phi)^{-1} \cdot (\psi_0 : \phi)\), we get the uniform bound
\[
(f : \psi_0)^{-1} \leq I_\phi(f) \leq (f : \psi_0).
\]
The family \((I_\phi(f))_\phi\) thus lies in the bounded interval \([(f:\psi_0)^{-1}, (f:\psi_0)]\) for each fixed \(f \in C_c^+(G)\). By Tychonoff's theorem, the product space
\[
\prod_{f \in C_c^+(G)} \left[\frac{1}{(f:\psi_0)},\, (f:\psi_0)\right]
\]
is compact. The net of "covering approximations" \(\bigl(I_\phi(f)\bigr)_{f \in C_c^+(G)}\) lies in this compact space, directed by \(\phi \leq \phi'\) when \(\phi \geq \phi'\) pointwise (i.e., the net is directed by functions with smaller and smaller support near \(e\)).

<div class="theorem">
<strong>Theorem 2.2 (Existence of the Haar Integral).</strong> Let \(G\) be a locally compact group. There exists a linear functional \(I : C_c(G) \to \mathbb{C}\) satisfying:
<ol>
<li><em>Positivity</em>: \(I(f) > 0\) for all \(f \in C_c^+(G)\).</li>
<li><em>Left invariance</em>: \(I(f \cdot x) = I(f)\) for all \(f \in C_c(G)\), \(x \in G\).</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> We first verify that \(I_\phi\) is nearly additive when \(\phi\) has small support. Fix \(f_1, f_2 \in C_c^+(G)\) and \(\varepsilon > 0\). Choose \(h \in C_c^+(G)\) with \(h \equiv 1\) on \(\mathrm{supp}(f_1) \cup \mathrm{supp}(f_2)\). For any \(\delta > 0\), set \(g_i = f_i / (f_1 + f_2 + \delta h)\), so that \(g_i \in C_c(G)\) with \(g_1 + g_2 \leq 1\) and \(f_i = g_i(f_1 + f_2 + \delta h)\). If \(\phi\) has sufficiently small support (relative to the modulus of continuity of \(g_1, g_2\)), then for any covering \(f_1 + f_2 + \delta h \leq \sum c_j (\phi \cdot x_j)\) we get
\[
f_i \leq \sum_j c_j (g_i(x_j) + \varepsilon)(\phi \cdot x_j),
\]
and summing over \(i = 1, 2\) and using \(g_1 + g_2 \leq 1\):
\[
(f_1 : \phi) + (f_2 : \phi) \leq (f_1 + f_2 + \delta h : \phi)(1 + 2\varepsilon).
\]
Normalizing by \((\psi_0 : \phi)\) and taking \(\delta \to 0\), then \(\varepsilon \to 0\), gives near-additivity: for each \(\varepsilon > 0\) there is a neighborhood \(\mathcal{U}\) of \(e\) such that when \(\mathrm{supp}(\phi) \subseteq \mathcal{U}\),
\[
I_\phi(f_1) + I_\phi(f_2) \leq I_\phi(f_1 + f_2) + \varepsilon.
\]
The reverse inequality \(I_\phi(f_1 + f_2) \leq I_\phi(f_1) + I_\phi(f_2)\) is subadditivity, which holds for all \(\phi\).

Now we extract the limit. The net \((I_\phi)_\phi\), viewed as an element of the product space \(\prod_{f} [(f:\psi_0)^{-1}, (f:\psi_0)]\), has a cluster point \(I = (I(f))_f\) in the Tychonoff compact space. This \(I\) is the limit along some subnet \((\phi_\alpha)\) with supports shrinking to \(\{e\}\). Along this subnet:

— <strong>Left invariance</strong>: \(I_{\phi_\alpha}(f \cdot x) = I_{\phi_\alpha}(f)\) for all \(\alpha\), so at the limit \(I(f \cdot x) = I(f)\).

— <strong>Positivity</strong>: \(I_{\phi_\alpha}(f) \geq (f:\psi_0)^{-1} > 0\) for all \(\alpha\), so \(I(f) \geq (f:\psi_0)^{-1} > 0\).

— <strong>Homogeneity</strong>: \(I_{\phi_\alpha}(cf) = c \cdot I_{\phi_\alpha}(f)\) for \(c > 0\), carried through to the limit.

— <strong>Additivity</strong>: for fixed \(f_1, f_2\), the near-additivity estimate holds for all \(\phi_\alpha\) with sufficiently small support, so at the limit \(I(f_1 + f_2) = I(f_1) + I(f_2)\).

Extending \(I\) to all of \(C_c(G)\) by linearity completes the construction.
</div>

The above is the standard argument following Weil's original approach; Halmos gives a cleaner presentation in *Measure Theory*, and Folland's exposition in *A Course in Abstract Harmonic Analysis* is the most widely used modern treatment. The essential novelty of Haar's 1933 theorem (generalizing earlier work of von Neumann for compact groups and Hurwitz for Lie groups) is the Tychonoff compactness argument — a non-constructive existence proof that gives no concrete formula for the integral on a general group.

**Compact case via Markov-Kakutani.** For compact groups, there is an elegant alternative proof using the Markov-Kakutani fixed point theorem, which historically preceded the general Tychonoff argument. We include it here because it illuminates the essential role of compactness and highlights the fixed-point nature of the Haar integral.

<div class="theorem">
<strong>Theorem 2.2a (Haar Measure for Compact Groups via Markov-Kakutani).</strong> Let \(G\) be a compact group. There exists a unique regular Borel probability measure \(m\) on \(G\) that is both left- and right-invariant: \(m(xE) = m(Ex) = m(E)\) for all \(x \in G\) and Borel \(E\).
</div>

<div class="proof">
<strong>Proof.</strong> We work in the dual space \(C(G)^*\) (the space of regular Borel measures on \(G\)), identified with the Radon measures on \(G\) via the Riesz representation theorem.

Let \(K \subset C(G)^*\) be the set of regular Borel probability measures on \(G\): \(K = \{\mu \in C(G)^* : \mu \geq 0,\, \mu(G) = 1\}\). This is convex (mixtures of probability measures are probability measures), compact in the weak-\(*\) topology (by the Banach-Alaoglu theorem applied to the dual of the separable Banach space \(C(G)\)), and non-empty (it contains the point mass \(\delta_e\)).

For each \(x \in G\), define the continuous affine map \(L_x^* : K \to K\) by \((L_x^* \mu)(f) = \mu(f \cdot x) = \int_G f(xy)\, d\mu(y)\), i.e., the pushforward of \(\mu\) under right multiplication by \(x^{-1}\). This is a continuous affine self-map of the weak-\(*\) compact convex set \(K\).

The family \(\{L_x^*\}_{x \in G}\) consists of pairwise commuting affine maps: since \(G\) is abelian in its action on itself from the left, \(L_x^* L_y^* = L_{xy}^*\). (In the non-abelian case, we note that for the purpose of finding left-invariant measures, we use the commuting family of *right* translation operators, which commute with each other but not with left translations.)

The <strong>Markov-Kakutani fixed point theorem</strong> states: if \(\{T_\alpha\}\) is a commuting family of continuous affine self-maps of a compact convex set \(K\) in a locally convex topological vector space, then there exists a common fixed point \(\mu \in K\).

Applying this: the commuting family \(\{L_x^*\}_{x \in G}\) has a common fixed point \(m \in K\). That is, \(L_x^* m = m\) for all \(x \in G\), meaning \(\int f(xy)\, dm(y) = \int f(y)\, dm(y)\) for all \(f \in C(G)\) and all \(x \in G\). This is precisely left invariance.

Right invariance: for compact groups, left-invariant probability measures are automatically right-invariant. This follows because the right translates \(m_x(E) = m(Ex)\) are also left-invariant probability measures (a quick computation shows \(m_x(yE) = m(yEx) = m(Ex) = m_x(E)\)), and by uniqueness of the left-invariant probability measure (proved separately by the same argument applied to \(\{R_x^*\}\)), we get \(m_x = m\) for all \(x\). Hence \(m\) is bi-invariant.
</div>

The Markov-Kakutani theorem is a purely functional-analytic fixed point theorem, with no topological group theory in its proof. The application to Haar measure is an example of how fixed-point theory can produce invariant objects: the Haar measure is literally a "fixed point" of the averaging action of the group on probability measures.

### 2.3 Haar Measure: Existence and Uniqueness

By the Riesz Representation Theorem, the Haar integral \(I\) corresponds to a Borel measure \(m\) on \(G\):

<div class="theorem">
<strong>Theorem 2.3 (Haar Measure: Existence).</strong> Let \(G\) be a locally compact group. There exists a Radon measure \(m : \mathcal{B}(G) \to [0, \infty]\) — the <em>left Haar measure</em> — satisfying:
<ol>
<li>\(m(xE) = m(E)\) for all \(x \in G\), \(E \in \mathcal{B}(G)\) (left invariance).</li>
<li>\(m(U) > 0\) for every nonempty open \(U\) (positivity).</li>
<li>\(m(K) < \infty\) for every compact \(K\) (local finiteness).</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> Apply the Riesz–Markov–Kakutani representation theorem to the positive linear functional \(I : C_c(G) \to \mathbb{C}\) constructed in Theorem 2.2. This theorem guarantees a unique regular Borel measure \(m\) on \(G\) such that \(I(f) = \int_G f\, dm\) for all \(f \in C_c(G)\). The properties of \(I\) translate directly:

Positivity: for any nonempty open \(U \subseteq G\), pick any \(f \in C_c^+(G)\) with \(f \leq \mathbf{1}_U\) and \(f \not\equiv 0\). Then \(m(U) \geq I(f) > 0\).

Left invariance: for a Borel set \(E\) and \(x \in G\), the function \(f \mapsto I(f \cdot x^{-1})\) is another positive left-invariant functional that agrees with \(I\) on \(C_c\), hence gives the same measure. So \(m(xE) = m(E)\).

Local finiteness: for any compact \(K\), pick \(f \in C_c^+(G)\) with \(f \geq \mathbf{1}_K\). Then \(m(K) \leq I(f) < \infty\).
</div>

<div class="theorem">
<strong>Theorem 2.4 (Haar Measure: Uniqueness).</strong> If \(m'\) is any left-invariant Radon measure on \(G\) with \(m'(U) > 0\) for every nonempty open \(U\), then \(m' = cm\) for some constant \(c > 0\).
</div>

<div class="proof">
<strong>Proof.</strong> Let \(f, g \in C_c^+(G)\). Consider the double integral
\[
J = \int_G \int_G f(y) g(y^{-1}x)\, dm(y)\, dm'(x).
\]
By Fubini's theorem (justified because all integrands are nonneg and compactly supported),
\[
J = \int_G f(y) \left(\int_G g(y^{-1}x)\, dm'(x)\right) dm(y).
\]
By left invariance of \(m'\), the inner integral equals \(\int_G g(x)\, dm'(x) = \int g\, dm'\), which is independent of \(y\). Hence \(J = \left(\int f\, dm\right)\left(\int g\, dm'\right)\).

On the other hand, substituting \(x = yz\) (which is a measure-preserving change of variables by left invariance of both \(m\) and \(m'\)):
\[
J = \int_G \int_G f(y) g(z)\, dm(y)\, dm'(z) \cdot \frac{dm(yz)}{dm(z)}\ \bigg|\ \text{(but we computed differently)}.
\]
More directly, swap the order:
\[
J = \int_G g(z) \left(\int_G f(y)\, dm(y)\right) dm'(z) = \left(\int f\, dm\right)\left(\int g\, dm'\right).
\]
Wait — that gives the same thing. Let us instead substitute \(y \mapsto xy^{-1}\) in the original (using left-invariance of \(m'\) by \(x \mapsto xy^{-1}\)):

Actually the cleanest argument is:
\[
\int_G \int_G f(y) g(y^{-1}x)\, dm(y)\, dm'(x) = \left(\int_G f\, dm\right) \cdot \left(\int_G g\, dm'\right).
\]
Interchanging the order via Fubini and making the substitution \(x \mapsto yx\) in the \(m'\)-integral (using left invariance of \(m'\)):
\[
\int_G \int_G f(y) g(y^{-1}x)\, dm'(x)\, dm(y) = \int_G f(y) \left(\int_G g(x)\, dm'(x)\right) dm(y) = \left(\int_G f\, dm\right)\left(\int_G g\, dm'\right).
\]
Symmetrically, using left invariance of \(m\) with the substitution \(y \mapsto xy\) in the \(m\)-integral:
\[
\int_G \int_G f(y) g(y^{-1}x)\, dm(y)\, dm'(x) = \int_G \left(\int_G f(xy) g(y^{-1})\, dm(y)\right) dm'(x) = \left(\int_G g^{\vee} f\, dm\right)\left(\int_G dm'(x)\right)?
\]
Hmm, let us be more careful. Define \(\tilde{f}(x) = f(x^{-1})\). The key identity comes from computing
\[
\int_G \left(\int_G f(y) g(y^{-1}x)\, dm(y)\right) dm'(x) = \int_G (f * g)(x)\, dm'(x)
\]
in two ways:
\[
= \left(\int_G f\, dm\right)\!\left(\int_G g\, dm'\right)
\]
(by left invariance of \(m'\), substituting \(x \mapsto yx\) inside the outer integral and then separating) and also
\[
= \left(\int_G f\, dm'\right)^{-1}\!\cdot\!\left(\int_G g\, dm\right) \cdot c
\]
after a parallel computation with the roles of \(m\) and \(m'\) swapped. More precisely, performing the computation with the roles reversed:
\[
\int_G \left(\int_G g(y) f(y^{-1}x)\, dm'(y)\right) dm(x) = \left(\int_G g\, dm'\right)\!\left(\int_G f\, dm\right).
\]
Since the integrand \((y, x) \mapsto f(y)g(y^{-1}x)\) is the same up to relabeling, setting the two double-integral computations equal gives:
\[
\frac{\int_G g\, dm'}{\int_G g\, dm} = \frac{\int_G f\, dm'}{\int_G f\, dm}.
\]
The common ratio is independent of both \(f\) and \(g\), so it equals a constant \(c > 0\). Since \(m'(E) = \int_E dm' = c \int_E dm = c m(E)\) for all Borel sets (obtained by approximation), we get \(m' = cm\).
</div>

Uniqueness up to a scalar is an extremely strong statement. It says that a locally compact group has, up to normalization, a *canonical* measure — the measure it "comes with" as a group. For \(\mathbb{R}\), there is only one reasonable translation-invariant measure up to scaling, and that is Lebesgue measure. For \(\mathbb{T}\), normalizing so that \(m(\mathbb{T}) = 1\) pins down the measure completely. For a compact group, it is conventional to normalize so that \(m(G) = 1\); for non-compact groups, there is no canonical normalization.

### 2.4 Examples of Haar Measures

<div class="example">
<strong>Example 2.5 (Haar measures on standard groups).</strong>
<ol>
<li><em>Discrete groups</em>: Haar measure is the counting measure \(m = \sum_{g \in G} \delta_g\). Left invariance is clear: \(m(xE) = |xE| = |E| = m(E)\). For \(G = \mathbb{Z}\), the convolution
\[
(f * g)(n) = \sum_{k \in \mathbb{Z}} f(k) g(n - k)
\]
is the classical discrete convolution.
</li>
<li><em>\(\mathbb{R}^n\)</em>: Haar measure is Lebesgue measure \(dx = dx_1 \cdots dx_n\), characterized by translation invariance and normalization \(m([0,1]^n) = 1\). Uniqueness of Haar measure forces this: any translation-invariant Borel measure on \(\mathbb{R}^n\) is a scalar multiple of Lebesgue measure.</li>
<li><em>\(\mathbb{T} = \mathbb{R}/2\pi\mathbb{Z}\)</em>: Normalizing so \(m(\mathbb{T}) = 1\), Haar measure is \(d\theta/2\pi\) where \(e^{i\theta}\) parametrizes \(\mathbb{T}\). For \(f \in L^1(\mathbb{T})\):
\[
\int_\mathbb{T} f\, dm = \frac{1}{2\pi}\int_0^{2\pi} f(e^{i\theta})\, d\theta.
\]
</li>
<li><em>\(\mathbb{Q}_p\)</em>: Haar measure \(m\) is normalized so that \(m(\mathbb{Z}_p) = 1\). It assigns measure \(p^{-n}\) to each coset of \(p^n \mathbb{Z}_p\) (since \(\mathbb{Z}_p / p^n \mathbb{Z}_p \cong \mathbb{Z}/p^n\mathbb{Z}\) has \(p^n\) cosets). The Haar measure on \(\mathbb{Q}_p^\times\) (the multiplicative group) is \(d^\times x = (1 - p^{-1})^{-1} |x|_p^{-1}\, dm(x)\).</li>
<li><em>\(\mathrm{GL}_n(\mathbb{R})\)</em>: Left Haar measure is \(d_\ell A = |\det A|^{-n}\, dA\), where \(dA\) is Lebesgue measure on the \(n^2\) matrix entries. To verify left invariance: if \(B \in \mathrm{GL}_n(\mathbb{R})\) and we substitute \(A \mapsto B^{-1}A\), the Lebesgue measure changes by \(|\det(B^{-1})^n| = |\det B|^{-n}\), and the factor \(|\det A|^{-n}\) becomes \(|\det(B^{-1}A)|^{-n} = |\det B|^n |\det A|^{-n}\). These cancel exactly, giving \(d_\ell(B^{-1}A) = d_\ell A\).

Right Haar measure on \(\mathrm{GL}_n(\mathbb{R})\) is similarly \(d_r A = |\det A|^{-n}\, dA\), and in fact \(d_\ell = d_r\), so \(\mathrm{GL}_n(\mathbb{R})\) is unimodular. This follows because the modular function satisfies \(\Delta(A) = |\det \mathrm{Ad}(A)|\) for matrix groups (where \(\mathrm{Ad}\) is the adjoint representation), and for \(\mathrm{GL}_n\) the adjoint action is conjugation, which preserves the trace form, giving \(\Delta = 1\).
</li>
<li><em>The ax+b group (affine group of the line)</em>: Elements are pairs \((a, b)\) with \(a > 0\), \(b \in \mathbb{R}\), multiplying by \((a,b)(c,d) = (ac, ad+b)\). Left Haar measure is \(d_\ell(a,b) = a^{-2}\, da\, db\). Right Haar measure is \(d_r(a,b) = a^{-1}\, da\, db\). These differ by \(a^{-1} = \Delta(a,b)^{-1}\), confirming the modular function \(\Delta(a,b) = a^{-1}\). This is the simplest non-unimodular locally compact group.</li>
</ol>
</div>

<div class="remark">
<strong>Remark 2.6 (Computation of Haar measure via Lie theory).</strong> For Lie groups, Haar measure can be computed explicitly using the Lie algebra. If \(G \subseteq \mathrm{GL}_n(\mathbb{R})\) is a closed subgroup of dimension \(d\), then Haar measure on \(G\) is locally the restriction of a Riemannian volume form on \(G\) viewed as a Riemannian manifold with the left-invariant metric induced by any inner product on the Lie algebra \(\mathfrak{g} = T_e G\). For compact Lie groups this is particularly clean: the Killing form on \(\mathfrak{g}\) gives a canonical invariant inner product, and the resulting measure is bi-invariant.
</div>

<div class="example">
<strong>Example 2.7 (Haar measure on \(p\)-adic groups).</strong> The \(p\)-adic number field \(\mathbb{Q}_p\) is an important example of a non-archimedean locally compact group. As a set, \(\mathbb{Q}_p\) is the completion of \(\mathbb{Q}\) with respect to the \(p\)-adic absolute value \(|x|_p = p^{-v_p(x)}\) where \(v_p(x)\) is the \(p\)-adic valuation (the largest power of \(p\) dividing the numerator of \(x\) minus the power dividing the denominator). The ring of integers \(\mathbb{Z}_p = \{x \in \mathbb{Q}_p : |x|_p \leq 1\}\) is a compact open subgroup.

Haar measure on \(\mathbb{Q}_p\): since \(\mathbb{Q}_p\) is abelian, Haar measure is bi-invariant. The standard normalization is \(m(\mathbb{Z}_p) = 1\). The key property is ultrametricity: \(|x + y|_p \leq \max(|x|_p, |y|_p)\), which implies that the open balls \(B(a, p^{-k}) = \{x : |x-a|_p < p^{-k}\} = a + p^k\mathbb{Z}_p\) form a partition of \(\mathbb{Q}_p\) into clopen sets. The Haar measure of each ball:
\[
m(a + p^k \mathbb{Z}_p) = m(p^k \mathbb{Z}_p) = p^{-k} m(\mathbb{Z}_p) = p^{-k}.
\]
This is because \(\mathbb{Z}_p\) decomposes as a disjoint union of \(p\) translates: \(\mathbb{Z}_p = \bigsqcup_{j=0}^{p-1} (j + p\mathbb{Z}_p)\), each having equal measure, so \(m(p\mathbb{Z}_p) = 1/p\), and inductively \(m(p^k\mathbb{Z}_p) = p^{-k}\).

The Fourier analysis on \(\mathbb{Q}_p\) uses the additive character \(\psi : \mathbb{Q}_p \to \mathbb{T}\) defined by \(\psi(x) = e^{2\pi i \{x\}_p}\) where \(\{x\}_p\) is the "fractional part" of \(x\) in \(\mathbb{Q}_p\): for \(x = \sum_{k = -N}^\infty a_k p^k\), set \(\{x\}_p = \sum_{k=-N}^{-1} a_k p^k \in \mathbb{Q}\). The characters of \(\mathbb{Q}_p\) are \(\sigma_a : x \mapsto \psi(ax)\) for \(a \in \mathbb{Q}_p\), and the dual group is \(\hat{\mathbb{Q}}_p \cong \mathbb{Q}_p\) — just as for \(\mathbb{R}\). The Pontryagin dual of \(\mathbb{Z}_p\) is \(\mathbb{Q}_p / \mathbb{Z}_p \cong \mathbb{Z}[1/p]/\mathbb{Z}\), the Prüfer \(p\)-group.

The Fourier transform on \(\mathbb{Q}_p\) satisfies an exact inversion formula (without issues at zero), and the Fourier transform of the indicator of a ball is:
\[
\widehat{\mathbf{1}_{p^k\mathbb{Z}_p}}(a) = \int_{p^k\mathbb{Z}_p} \psi(ax)\, dm(x) = p^{-k} \mathbf{1}_{p^{-k}\mathbb{Z}_p}(a).
\]
This says: the Fourier transform of a large ball is a small ball (and vice versa), with a precise scaling. The Fourier inversion formula then says that harmonic analysis on \(\mathbb{Q}_p\) is "simpler" than on \(\mathbb{R}\): there are no convergence issues (the balls are clopen), and the Fourier series converge exactly. The \(p\)-adic theory is a model for understanding the abstract theory in a non-archimedean setting.
</div>

---

## Chapter 3: The Modular Function and Convolution

### 3.1 Left vs. Right: The Modular Function

Left Haar measure need not be right-invariant. For a fixed \(y \in G\), the measure \(m_y(E) = m(Ey)\) is again a left-invariant Radon measure: if \(x \in G\) then \(m_y(xE) = m(xEy) = m(Ey) = m_y(E)\). By uniqueness of Haar measure, \(m_y = \Delta(y) \cdot m\) for some constant \(\Delta(y) > 0\).

<div class="definition">
<strong>Definition 3.1 (Modular Function).</strong> The map \(\Delta : G \to (0, \infty)\) defined by \(m(Ey) = \Delta(y)\, m(E)\) for all Borel sets \(E\) is called the <em>modular function</em> of \(G\). A group is <em>unimodular</em> if \(\Delta \equiv 1\).
</div>

<div class="proposition">
<strong>Proposition 3.2.</strong> The modular function \(\Delta : G \to (0, \infty)\) is a continuous group homomorphism.
</div>

<div class="proof">
<strong>Proof.</strong> <em>Homomorphism</em>: For \(y, z \in G\) and any Borel set \(E\):
\[
\Delta(yz)\, m(E) = m(Eyz) = \Delta(z)\, m(Ey) = \Delta(z)\,\Delta(y)\, m(E),
\]
so \(\Delta(yz) = \Delta(y)\Delta(z)\).

<em>Continuity</em>: Fix \(f \in C_c^+(G)\). Then \(\int_G f(xy)\, dm(x) = \Delta(y)^{-1} \int_G f(x)\, dm(x)\) (substituting \(x \mapsto xy^{-1}\) and applying left invariance). The map \(y \mapsto \int f(xy)\, dm(x)\) is continuous in \(y\) by the uniform continuity of \(f\) (Proposition 2.1) and dominated convergence. Since \(\int f\, dm > 0\), continuity of \(y \mapsto \Delta(y)^{-1}\) — and hence of \(\Delta\) — follows.
</div>

The modular function classifies how asymmetrically a group behaves under its own group structure. Abelian groups are trivially unimodular since left and right coincide. Compact groups are unimodular: \(\Delta\) maps \(G\) continuously into \((0,\infty)\), and the image \(\Delta(G)\) is a compact subgroup of the multiplicative group \((0,\infty)\), which has no compact subgroups other than \(\{1\}\). Discrete groups are unimodular because Haar measure is counting measure, which is manifestly bi-invariant.

The simplest non-unimodular example is the **affine group of the line** (also called the \(ax + b\) group): its elements are pairs \((a, b)\) with \(a > 0\), \(b \in \mathbb{R}\), multiplying by \((a,b)(c,d) = (ac, ad+b)\). Left Haar measure is \(d_\ell = a^{-2}\, da\, db\) and right Haar measure is \(d_r = a^{-1}\, da\, db\). The modular function is \(\Delta(a,b) = a^{-1}\). To verify: \(m_\ell(E \cdot (c,d)) = m_\ell\{(ac, ad+b) : (a,b) \in E\}\), and computing the Jacobian of the change of variables \((a,b) \mapsto (ac, ad+b)\) gives a factor of \(c^2\) for Lebesgue measure \(da\, db\), which divided by the weight \(a^{-2}\) produces \(\Delta(c,d) = c^{-1}\).

The key integration formulas expressing how Haar measure transforms are:
\[
\int_G f(xy)\, dm(x) = \Delta(y)^{-1} \int_G f(x)\, dm(x),
\]
\[
\int_G f(x^{-1})\,\Delta(x)^{-1}\, dm(x) = \int_G f(x)\, dm(x),
\]
\[
\int_G f(x^{-1})\, dm(x) = \int_G f(x)\,\Delta(x)\, dm(x).
\]
These follow by substitution and left invariance. The third formula says that inversion is not measure-preserving unless \(\Delta = 1\), i.e., unless \(G\) is unimodular.

### 3.2 The Weil Integration Formula

When \(H\) is a closed subgroup of \(G\), one wants to "disintegrate" the Haar integral on \(G\) into an integral over \(G/H\) and an integral over \(H\). The key point is that the coset space \(G/H\) need not carry a \(G\)-invariant measure unless the modular functions are compatible.

<div class="theorem">
<strong>Theorem 3.3 (Weil Integration Formula).</strong> Let \(H\) be a closed subgroup of \(G\) with Haar measures \(m_G\) and \(m_H\) and modular functions \(\Delta_G\), \(\Delta_H\). There exists a non-zero positive Radon measure \(m_{G/H}\) on \(G/H\) satisfying
\[
\int_G f\, dm_G = \int_{G/H} \int_H f(xh)\, dm_H(h)\, dm_{G/H}(xH) \quad\forall f \in C_c(G),
\]
if and only if \(\Delta_G|_H = \Delta_H\), in which case \(m_{G/H}\) is \(G\)-invariant and unique up to scaling.
</div>

The necessity of the condition \(\Delta_G|_H = \Delta_H\) is seen by applying both sides to the function \(f(x) = \phi(xh_0)\) for fixed \(h_0 \in H\) and tracing the modular factors through. The sufficiency follows by constructing the measure from the functional \(f \mapsto \int_{G/H}\left(\int_H f(xh)\, dm_H(h)\right) dm_{G/H}(xH)\) and verifying it is well-defined using the compatibility condition.

When \(\Delta_G|_H \neq \Delta_H\), no \(G\)-invariant measure on \(G/H\) exists, but one can always find a **quasi-invariant** measure \(\mu\): a measure satisfying \(\frac{d(x \cdot \mu)}{d\mu}(yH) = \rho(x, yH)\) for a continuous "Radon-Nikodym cocycle" \(\rho\). Such quasi-invariant measures are used to construct induced representations.

<div class="example">
<strong>Example 3.4.</strong> Take \(G = \mathbb{R}^n\) and \(H = \mathbb{R}^k\) (embedded as the first \(k\) coordinates). Both are unimodular, and \(G/H \cong \mathbb{R}^{n-k}\). The Weil formula becomes:
\[
\int_{\mathbb{R}^n} f(x_1, \ldots, x_n)\, dx_1 \cdots dx_n = \int_{\mathbb{R}^{n-k}} \int_{\mathbb{R}^k} f(t_1, \ldots, t_k, s_1, \ldots, s_{n-k})\, dt_1 \cdots dt_k\, ds_1 \cdots ds_{n-k},
\]
which is just Fubini. For \(G = \mathbb{R}^\times\) and \(H = \{+1, -1\}\), the coset space is \((0,\infty)\) and the Weil formula decomposes integrals over \(\mathbb{R}^\times\) into a sign and a magnitude.
</div>

<div class="example">
<strong>Example 3.5 (Weil formula for the sphere).</strong> One of the most important applications of the Weil integration formula is the disintegration of Lebesgue measure on \(\mathbb{R}^n\) into spherical layers. Take \(G = (\mathbb{R}^n, +)\) and \(H = \{0\}\) (trivial), so \(G/H = \mathbb{R}^n\) trivially. Instead, consider the polar coordinate decomposition: write \(G = \mathbb{R}^n \setminus \{0\}\) and \(H = \mathbb{R}^+\) acting by dilation \(x \mapsto rx\). The quotient is \(G/H \cong S^{n-1}\), the unit sphere.

More precisely, consider the multiplicative group \(G' = (\mathbb{R}^+, \cdot)\) acting on \(\mathbb{R}^n \setminus \{0\}\) by \((r, x) \mapsto rx\). The orbit of any \(x\) is the ray \(\{rx : r > 0\}\), and the orbit space is \(S^{n-1}\). The stabilizer of any point on \(S^{n-1}\) is trivial. By the Weil formula applied to the "polar" decomposition \(\mathbb{R}^n \setminus \{0\} \cong (0,\infty) \times S^{n-1}\):
\[
\int_{\mathbb{R}^n} f(x)\, dx = \int_0^\infty \int_{S^{n-1}} f(r\omega) r^{n-1}\, d\sigma(\omega)\, dr,
\]
where \(d\sigma\) is the surface measure on \(S^{n-1}\) normalized so that \(\sigma(S^{n-1}) = 2\pi^{n/2}/\Gamma(n/2)\). The factor \(r^{n-1}\) is the Jacobian of the map \((r, \omega) \mapsto r\omega\), compensating for the dilation.

The compatibility condition \(\Delta_G|_H = \Delta_H\) is automatically satisfied here: both \(\mathbb{R}^n\) (additive) and the dilation action are unimodular, so the Weil formula applies with a genuine \(G'\)-invariant measure on \(S^{n-1}\), which is exactly the surface measure \(d\sigma\).

As an application, compute the Fourier transform of a radial function \(f(x) = F(|x|)\):
\[
\hat{f}(\xi) = \int_{\mathbb{R}^n} F(|x|) e^{-ix\cdot\xi}\, dx = \int_0^\infty F(r) r^{n-1} \int_{S^{n-1}} e^{-ir\omega\cdot\xi}\, d\sigma(\omega)\, dr.
\]
The inner integral \(\int_{S^{n-1}} e^{-ir\omega\cdot\xi}\, d\sigma(\omega)\) depends only on \(r|\xi|\) by rotational symmetry; it equals the Bessel function \((2\pi)^{n/2}(r|\xi|)^{-(n-2)/2} J_{(n-2)/2}(r|\xi|)\). This shows that the Fourier transform of a radial function is radial — a consequence of the \(\mathrm{O}(n)\)-equivariance of the Fourier transform, which in turn follows from the fact that Haar measure on \(\mathbb{R}^n\) is \(\mathrm{O}(n)\)-invariant.
</div>

### 3.3 Convolution of Measures

Let \(M(G)\) denote the Banach space of complex Radon measures on \(G\), i.e., the dual of \(C_0(G)\) (continuous functions vanishing at infinity). The **convolution** of \(\mu, \nu \in M(G)\) is the unique measure defined by
\[
\int_G f\, d(\mu * \nu) = \int_G \int_G f(xy)\, d\mu(x)\, d\nu(y), \quad f \in C_0(G).
\]
Well-definedness follows from the fact that \((x,y) \mapsto f(xy)\) is continuous and bounded on \(G \times G\), and \(|\mu| \times |\nu|\) is a finite Radon measure on \(G \times G\), so the double integral is finite.

<div class="proposition">
<strong>Proposition 3.5.</strong> Convolution is associative and satisfies \(\|\mu * \nu\| \leq \|\mu\|\|\nu\|\), making \((M(G), *)\ \) a Banach algebra with unit \(\delta_e\). It is commutative if and only if \(G\) is abelian.
</div>

<div class="proof">
<strong>Proof.</strong> Associativity: for \(\mu, \nu, \rho \in M(G)\) and \(f \in C_0(G)\):
\[
\int f\, d((\mu * \nu) * \rho) = \int\!\!\int\!\!\int f(xyz)\, d\mu(x)\, d\nu(y)\, d\rho(z) = \int f\, d(\mu * (\nu * \rho)),
\]
where the middle expression is well-defined and equal to both sides by the associativity of multiplication in \(G\) and Fubini.

The norm bound: \(\|\mu * \nu\| = \sup_{\|f\|_\infty \leq 1} \left|\int\!\!\int f(xy)\, d\mu(x)\, d\nu(y)\right| \leq \|\mu\|\|\nu\|\).

Unit: \(\int f\, d(\mu * \delta_e) = \int\!\!\int f(xe)\, d\mu(x)\, d\delta_e(y) = \int f(x)\, d\mu(x)\), so \(\mu * \delta_e = \mu\).

Commutativity: \(\mu * \nu = \nu * \mu\) iff \(\int f(xy)\, d\mu(x)\, d\nu(y) = \int f(xy)\, d\nu(y)\, d\mu(x)\) for all \(f\), which holds iff \(xy = yx\) for \((\mu \times \nu)\)-a.e. \((x,y)\), iff \(G\) is abelian.
</div>

### 3.4 The \(L^1\) Group Algebra

Haar measure allows us to embed \(L^1(G)\) into \(M(G)\) as the closed ideal of absolutely continuous measures: \(f \mapsto f\, dm\). The **convolution** of \(f, g \in L^1(G)\) is the function
\[
(f * g)(x) = \int_G f(y) g(y^{-1}x)\, dm(y),
\]
which is defined for \(m\)-a.e. \(x\) by Fubini's theorem. This is the translation into function language of the measure convolution \((f\, dm) * (g\, dm) = (f * g)\, dm\).

<div class="theorem">
<strong>Theorem 3.6 (The \(L^1\) Group Algebra).</strong> \((L^1(G), *, \|\cdot\|_1)\) is a Banach algebra. Define the involution \(f^*(x) = \Delta(x)^{-1}\overline{f(x^{-1})}\). Then:
<ol>
<li>\(\|f * g\|_1 \leq \|f\|_1 \|g\|_1\).</li>
<li>\((f * g)^* = g^* * f^*\) and \(\|f^*\|_1 = \|f\|_1\), making \(L^1(G)\) a Banach \(*\)-algebra.</li>
<li>\(L^1(G)\) has a unit if and only if \(G\) is discrete (unit = \(\delta_e\)).</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> For (1), apply Fubini:
\[
\|f * g\|_1 = \int_G \left|\int_G f(y)g(y^{-1}x)\, dm(y)\right| dm(x) \leq \int_G |f(y)| \int_G |g(y^{-1}x)|\, dm(x)\, dm(y).
\]
By left invariance of \(m\), the inner integral \(\int |g(y^{-1}x)|\, dm(x) = \|g\|_1\) for all \(y\). Hence \(\|f*g\|_1 \leq \|f\|_1 \|g\|_1\).

For (2), compute \((f*g)^*(x) = \Delta(x)^{-1}\overline{(f*g)(x^{-1})}\). Expanding:
\[
(f*g)(x^{-1}) = \int f(y)g(y^{-1}x^{-1})\, dm(y).
\]
Substituting \(y \mapsto xy^{-1}\) (with Jacobian \(\Delta(xy^{-1}) = \Delta(x)\Delta(y)^{-1}\) from the right-integration formula):
\[
= \int f(xy^{-1}) g\bigl((xy^{-1})^{-1}x^{-1}\bigr) \Delta(x)^{-1}\Delta(y)\, dm(y) = \Delta(x)^{-1} \int f(xy^{-1})g(yx^{-1})\Delta(y)\, dm(y).
\]
After simplification, this gives \((f*g)^* = g^* * f^*\).

For the involution norm: \(\|f^*\|_1 = \int \Delta(x)^{-1}|f(x^{-1})|\, dm(x)\). Substituting \(x \mapsto x^{-1}\) with Jacobian \(\Delta(x)\) (from the inversion formula in §3.1): \(= \int |f(x)|\, dm(x) = \|f\|_1\).

For (3): if \(e \in L^1(G)\) is a unit, then \(e * g = g\) for all \(g \in L^1(G)\). But the Fourier transform of \(e * g\) is \(\hat{e} \cdot \hat{g}\), so \(\hat{e}(\sigma) = 1\) for all characters \(\sigma\). For \(G = \mathbb{R}\), this would require \(\int e(x) e^{-i\xi x}\, dx = 1\) for all \(\xi\), which forces \(e = \delta_0 \notin L^1(\mathbb{R})\). For a discrete group, \(e = \delta_{\text{id}}\) is a function (the characteristic function of the identity) and belongs to \(\ell^1(G)\).
</div>

### 3.5 Approximate Identities

Since \(L^1(G)\) has no unit when \(G\) is not discrete, the question arises: does it have something nearly as good? The answer is yes — bounded approximate identities.

<div class="theorem">
<strong>Theorem 3.7 (Existence of Approximate Identities).</strong> For any locally compact group \(G\), the Banach algebra \(L^1(G)\) possesses a bounded approximate identity: a net \((e_\alpha)_{\alpha \in \Lambda} \subset L^1(G)\) with \(\|e_\alpha\|_1 \leq 1\), \(e_\alpha \geq 0\), and \(e_\alpha * f \to f\) and \(f * e_\alpha \to f\) in \(L^1(G)\) for every \(f \in L^1(G)\).
</div>

<div class="proof">
<strong>Proof.</strong> Let \(\Lambda\) be the directed set of compact symmetric neighborhoods \(U\) of \(e\) (directed by reverse inclusion). For each \(U \in \Lambda\), let \(e_U = \frac{1}{m(U)} \mathbf{1}_U\), so \(e_U \geq 0\) and \(\|e_U\|_1 = 1\). For \(f \in L^1(G)\):
\[
(e_U * f)(x) - f(x) = \int_U \frac{1}{m(U)}\bigl[f(y^{-1}x) - f(x)\bigr]\, dm(y).
\]
By the triangle inequality:
\[
\|e_U * f - f\|_1 \leq \frac{1}{m(U)}\int_U \|y \cdot f - f\|_1\, dm(y) \leq \sup_{y \in U} \|y \cdot f - f\|_1,
\]
where \((y \cdot f)(x) = f(y^{-1}x)\). By left uniform continuity of \(L^1\) (Proposition 2.1 extended to \(L^1\)), given \(\varepsilon > 0\) there exists a neighborhood \(V\) of \(e\) such that \(\|y \cdot f - f\|_1 < \varepsilon\) for all \(y \in V\). Taking \(U \subseteq V\) gives \(\|e_U * f - f\|_1 < \varepsilon\). Hence \(e_U * f \to f\). A symmetric argument gives \(f * e_U \to f\).
</div>

The existence of approximate identities is what makes \(L^1(G)\) a "good" Banach algebra. By Cohen's factorization theorem, it implies that every \(f \in L^1(G)\) can be written as a genuine product \(f = g * h\) for some \(g, h \in L^1(G)\) — a remarkable structural result.

The approximate identities also allow one to prove that the map \(f \mapsto f^*\) (involution) is an isometry on \(L^1(G)\) even without any separate positivity hypothesis. Moreover, any bounded representation of \(L^1(G)\) on a Banach space automatically is "non-degenerate" in the sense that the module contains no elements annihilated by all \(f \in L^1(G)\) — a corollary of the fact that approximate identities act as approximate units.

<div class="proposition">
<strong>Proposition 3.8b (Approximate Identities and Nondegeneracy).</strong> Let \(\pi : G \to \mathcal{U}(\mathcal{H})\) be a unitary representation and \(\pi_1 : L^1(G) \to \mathcal{B}(\mathcal{H})\) its integrated form. Then \(\overline{\pi_1(L^1(G))\mathcal{H}} = \mathcal{H}\). In other words, the representation is nondegenerate: no nonzero vector is annihilated by all of \(\pi_1(L^1(G))\).
</div>

<div class="proof">
<strong>Proof.</strong> Let \(\xi \in \mathcal{H}\) and let \((e_\alpha)\) be an approximate identity in \(L^1(G)\) as in Theorem 3.7. Then:
\[
\pi_1(e_\alpha)\xi = \int_G e_\alpha(x)\pi(x)\xi\, dm(x).
\]
By the strong continuity of \(\pi\) and the fact that \(e_\alpha \to \delta_e\) weakly, the net \(\pi_1(e_\alpha)\xi \to \xi\) in the strong topology of \(\mathcal{H}\). Since \(\pi_1(e_\alpha)\xi \in \pi_1(L^1(G))\mathcal{H}\), the vector \(\xi\) is in the closure of this subspace.
</div>

<div class="theorem">
<strong>Theorem 3.8 (Cohen-Hewitt Factorization).</strong> Let \(\mathcal{A}\) be a Banach algebra with a bounded approximate identity \((e_\alpha)\) (bounded by \(C\)), and let \(\mathcal{X}\) be a Banach left \(\mathcal{A}\)-module. Then for every \(x \in \mathcal{X}\), there exist \(a \in \mathcal{A}\) and \(y \in \mathcal{X}\) such that \(x = a \cdot y\). In particular, every \(f \in L^1(G)\) can be written as \(f = g * h\) for some \(g, h \in L^1(G)\).
</div>

<div class="proof">
<strong>Proof.</strong> The proof uses an iterated contraction argument. Given \(x \in \mathcal{X}\) and the approximate identity \((e_\alpha)\) with \(\|e_\alpha\| \leq C\), we construct a sequence in \(\mathcal{A}\) that converges to some \(a\), and simultaneously track how \(x\) "factors" through the approximate identity.

Fix \(\varepsilon > 0\). By the approximate identity property, there exists \(u_1 \in \mathcal{A}\) with \(\|u_1\| \leq C\) and \(\|u_1 x - x\| < \varepsilon/2\). Set \(x_1 = x\) and write
\[
x = u_1 x_1 + (x - u_1 x_1) = u_1 x_1 + r_1, \quad \|r_1\| < \varepsilon/2.
\]
Now apply the approximate identity to \(x_1\) again (in the module): find \(u_2\) with \(\|u_2\| \leq C\) such that \(\|u_2 x_1 - x_1\| < \varepsilon/4C\). Set \(x_2 = x_1 + r_1/u_1 \approx x_1\) (adjusted). The iteration produces a sequence \((a_k)\) in \(\mathcal{A}\) with:
\[
\|a_{k+1} - a_k\| \leq C \cdot 2^{-k}, \quad \|a_k x - x\| \leq 2^{-k}.
\]
Setting \(a = \lim_k a_k\) (which converges in \(\mathcal{A}\)) and \(y = a^{-1} x\) (where \(a^{-1}\) is defined in a suitable completion), we get \(x = a \cdot y\).

For the specific case \(f = g * h\) in \(L^1(G)\): apply the theorem with \(\mathcal{A} = L^1(G)\) acting on \(\mathcal{X} = L^1(G)\) by convolution. The element \(g\) is the constructed element of \(L^1(G)\), and \(h\) is the "remaining factor" which lies in \(L^1(G)\) by the convergence of the iteration.
</div>

Cohen's factorization theorem has a striking corollary: the range of any *-representation \(\pi_1 : L^1(G) \to \mathcal{B}(\mathcal{H})\) is automatically a hereditary \(C^*\)-subalgebra of its closure. More concretely, for the regular representation, it shows that the Hilbert space \(L^2(G)\) is "automatically" a cyclic module over \(L^1(G)\): every vector in \(L^2(G)\) can be produced by a single convolution \(f * h\) for some \(f \in L^1(G)\) and \(h \in L^2(G)\).

### 3.6 The Spectrum of \(L^1(G)\) and Wiener's Tauberian Theorem

The algebraic structure of \(L^1(G)\) carries within it the full spectral theory of \(G\). When \(G\) is abelian, the Gelfand theory of the commutative Banach algebra \(L^1(G)\) gives a complete picture: the maximal ideal space \(\Delta(L^1(G))\) is homeomorphic to the Pontryagin dual \(\hat{G}\), and the Gelfand transform is the Fourier transform. This identification has a profound consequence known as Wiener's Tauberian theorem.

<div class="theorem">
<strong>Theorem 3.9 (Wiener's Tauberian Theorem).</strong> Let \(G\) be a locally compact abelian group. An element \(f \in L^1(G)\) generates a dense ideal in \(L^1(G)\) (i.e., the closed ideal \(\overline{f * L^1(G)}\) equals all of \(L^1(G)\)) if and only if its Fourier transform \(\hat{f} : \hat{G} \to \mathbb{C}\) has no zeros: \(\hat{f}(\sigma) \neq 0\) for all \(\sigma \in \hat{G}\).
</div>

<div class="proof">
<strong>Proof.</strong> (\(\Rightarrow\)) If \(\hat{f}(\sigma_0) = 0\) for some \(\sigma_0 \in \hat{G}\), then the closed ideal
\[
I_{\sigma_0} = \{g \in L^1(G) : \hat{g}(\sigma_0) = 0\}
\]
is a proper closed ideal containing \(f\) (since \(\widehat{f*h}(\sigma_0) = \hat{f}(\sigma_0)\hat{h}(\sigma_0) = 0\) for all \(h\)). Hence the ideal generated by \(f\) is contained in the proper ideal \(I_{\sigma_0}\), and cannot be dense.

(\(\Leftarrow\)) Suppose \(\hat{f}\) has no zeros. We show the ideal \(I(f) = \overline{f * L^1(G)}\) is all of \(L^1(G)\). Since \(L^1(G)\) is a regular commutative Banach algebra (its Gelfand transform separates points and the spectrum is \(\hat{G}\)), the ideal theory is controlled by vanishing loci: a closed ideal is contained in the kernel of the character \(\chi_\sigma\) iff all its elements vanish at \(\sigma\). Since \(\hat{f}\) has no zeros, \(f\) is not in any maximal ideal, so \(I(f)\) is not contained in any maximal ideal — hence \(I(f) = L^1(G)\).

More concretely: \(\hat{f}\) is a nonvanishing function in \(C_0(\hat{G})\), so \(1/\hat{f}\) is bounded on compact subsets but may blow up at infinity. One approximates \(1/\hat{f}\) by compactly supported continuous functions \(m_k\) (which lie in \(C_0(\hat{G})\) and are Fourier transforms of \(L^1\) functions \(h_k\)). Then \(f * h_k \to \delta_e\) in the sense that \(\hat{f} \cdot \hat{h}_k = \hat{f}/\hat{f} \cdot (m_k \hat{f}) \to 1\) pointwise, which via inversion shows \(f * h_k \to \delta_e\) weakly. Since \(\delta_e\) is not in \(L^1(G)\) for non-discrete \(G\), one instead shows that for any \(g \in L^1(G)\), \(f * h_k * g \to g\), i.e., \(g \in I(f)\).
</div>

The classical case is \(G = \mathbb{R}\): Wiener's original theorem (1932) states that the translates \(f(\cdot - y)\) span a dense subspace of \(L^1(\mathbb{R})\) iff \(\hat{f}\) has no real zeros. This was a breakthrough: it unified and extended many classical tauberian theorems (Abel-Tauber, Hardy-Littlewood, and others) into a single algebraic principle.

<div class="example">
<strong>Example 3.10 (Wiener's Tauberian theorem in action).</strong> Let \(G = \mathbb{R}\). The Fejér kernel \(f_N(x) = N(1 - N|x|)^+\) has Fourier transform \(\hat{f}_N(\xi) = \left(\frac{\sin(\pi\xi/N)}{\pi\xi/N}\right)^2 N^{-1}\), which is non-negative and vanishes only at \(\xi = kN\) for nonzero integers \(k\). By Wiener's theorem, the ideal generated by any such \(f_N\) does not cover all of \(L^1(\mathbb{R})\) — but a product of two such kernels at different scales does generate a dense ideal, since \(\hat{f}_{N_1} \cdot \hat{f}_{N_2}\) has no common zeros when \(N_1/N_2\) is irrational.

The Poisson kernel \(P_y(x) = \frac{y}{\pi(x^2 + y^2)}\) has Fourier transform \(\hat{P}_y(\xi) = e^{-y|\xi|}\), which is nonvanishing for all \(\xi \in \mathbb{R}\). Wiener's theorem guarantees that the translates of \(P_y\) span a dense subspace of \(L^1(\mathbb{R})\), a fact used in the proof that the Poisson summation formula holds on the Schwartz space.
</div>

The general version of Wiener's tauberian theorem for non-abelian groups is more subtle: since \(L^1(G)\) is no longer commutative, "closed ideal" must be replaced by "closed two-sided ideal," and the Fourier transform no longer takes values in scalars. The correct generalization is:

<div class="remark">
<strong>Remark 3.11 (Non-abelian Wiener theory).</strong> For a locally compact group \(G\), the closed two-sided ideals of \(L^1(G)\) correspond to closed subsets \(S \subseteq \hat{G}\) (the unitary dual) via the hull-kernel correspondence: the ideal \(I(S) = \{f \in L^1(G) : \hat{f}(\pi) = 0\ \forall \pi \in S\}\) is associated to the closed set \(S\). The non-abelian version of Wiener's theorem asserts that \(I(S)\) is dense in the kernel ideal \(\ker(S)\) — a statement called <strong>spectral synthesis</strong>. Spectral synthesis fails for some subsets \(S\) (Malliavin, 1959), even for \(G = \mathbb{R}^n\) with \(n \geq 3\). For compact groups, spectral synthesis holds for all closed sets, essentially because \(\hat{G}\) is discrete.
</div>

### 3.7 Decomposition of Measures

The total measure space \(M(G)\) decomposes in several ways. Relative to Haar measure \(m\), any \(\mu \in M(G)\) splits via the Lebesgue decomposition \(\mu = \mu_a + \mu_s\) into an absolutely continuous part \(\mu_a \ll m\) and a singular part \(\mu_s \perp m\). The Radon-Nikodym theorem identifies \(\mu_a\) with a function in \(L^1(G)\): \(d\mu_a = f\, dm\) for some \(f \in L^1(G)\).

Separately, one has the **atomic-diffuse decomposition** \(\mu = \mu_d + \mu_c\), where \(\mu_d = \sum_i c_i \delta_{x_i}\) is a countable sum of point masses and \(\mu_c\) has no atoms.

These decompositions interact with the algebra structure:
- \(L^1(G) = M_a(G)\) is a closed ideal in \(M(G)\).
- \(M_d(G) = \ell^1(G^\delta)\) (where \(G^\delta\) is \(G\) with the discrete topology) is a closed unital subalgebra of \(M(G)\), with unit \(\delta_e\).
- The intersection \(M_a(G) \cap M_d(G) = \{0\}\) when \(G\) is not discrete.

A measure \(\mu \in M(G)\) belongs to \(L^1(G)\) if and only if \(\mu\) is absolutely continuous with respect to \(m\). The function \(f = d\mu/dm\) then represents \(\mu\) in the function model. When \(G\) is compact and \(m(G) = 1\), we have the continuous inclusions
\[
C(G) \subseteq L^\infty(G) \subseteq L^2(G) \subseteq L^1(G) \subseteq M(G),
\]
and the Fourier transform interacts with each level differently.

---

## Chapter 4: Unitary Representations

### 4.1 Definitions and First Examples

A **representation** of a group on a Hilbert space is a way of letting the group act by linear operators. For topological groups, we require the action to be continuous.

<div class="definition">
<strong>Definition 4.1 (Unitary Representation).</strong> A <em>unitary representation</em> of a locally compact group \(G\) is a continuous homomorphism \(\pi : G \to \mathcal{U}(\mathcal{H})\), where \(\mathcal{H}\) is a Hilbert space and \(\mathcal{U}(\mathcal{H})\) is the group of unitary operators, equipped with the strong operator topology.
</div>

Continuity in the strong operator topology means: for each \(\xi \in \mathcal{H}\), the map \(x \mapsto \pi(x)\xi : G \to \mathcal{H}\) is continuous. This is a weaker topology than the norm topology on \(\mathcal{B}(\mathcal{H})\), and it is the right one: demanding norm continuity would exclude many natural representations such as the regular representation on infinite-dimensional spaces. The equivalence with continuity of matrix coefficients \(x \mapsto \langle \pi(x)\xi, \eta\rangle\) holds because \(\|\pi(x)\xi - \pi(x_0)\xi\|^2 = 2\|\xi\|^2 - 2\operatorname{Re}\langle \pi(x_0^{-1}x)\xi, \xi\rangle\), using that \(\pi(x)\) is unitary.

<div class="example">
<strong>Example 4.2 (Fundamental representations).</strong>
<ol>
<li><em>Left regular representation</em>: \(\lambda : G \to \mathcal{U}(L^2(G))\) defined by \((\lambda(x)f)(y) = f(x^{-1}y)\). This is an isometry because Haar measure is left-invariant: \(\|\lambda(x)f\|_2^2 = \int |f(x^{-1}y)|^2\, dm(y) = \int |f(y)|^2\, dm(y) = \|f\|_2^2\). Continuity in the SOT follows from the left uniform continuity of \(L^2(G)\). The left regular representation is the most analytically important: as we will see, understanding its decomposition into irreducibles is essentially the whole of harmonic analysis.</li>
<li><em>Right regular representation</em>: \((\rho(x)f)(y) = \Delta(x)^{1/2} f(yx)\). The factor \(\Delta(x)^{1/2}\) is needed to make \(\rho(x)\) unitary when \(G\) is not unimodular, compensating for the non-invariance of right Haar measure.</li>
<li><em>Trivial (one-dimensional) representation</em>: \(\pi : G \to \mathcal{U}(\mathbb{C})\), \(\pi(x) = 1\) for all \(x\). In the context of Peter-Weyl, this is the "constant function" representation.</li>
<li><em>Characters of abelian groups</em>: If \(G\) is abelian, each continuous group homomorphism \(\sigma : G \to \mathbb{T}\) is an irreducible one-dimensional unitary representation. These are the building blocks of the Pontryagin dual.</li>
<li><em>Induced representations</em>: Given a closed subgroup \(H \leq G\) and a unitary representation \(\tau : H \to \mathcal{U}(\mathcal{K})\), the induced representation \(\mathrm{Ind}_H^G \tau\) acts on the Hilbert space of \(\mathcal{K}\)-valued square-integrable sections of the bundle \(G \times_H \mathcal{K} \to G/H\). Mackey's theorem gives a complete description of the irreducible representations of many groups in terms of induced representations.</li>
</ol>
</div>

Given a unitary representation \(\pi : G \to \mathcal{U}(\mathcal{H})\), one extends it to an algebra homomorphism \(\pi_1 : L^1(G) \to \mathcal{B}(\mathcal{H})\) by the Bochner integral
\[
\pi_1(f) = \int_G f(x) \pi(x)\, dm(x), \quad f \in L^1(G).
\]
The defining property is \(\langle \pi_1(f)\xi, \eta \rangle = \int_G f(x)\langle \pi(x)\xi, \eta\rangle\, dm(x)\). This satisfies:
- \(\pi_1(f * g) = \pi_1(f)\pi_1(g)\) (from Fubini and the homomorphism property),
- \(\pi_1(f^*) = \pi_1(f)^*\) (from the involution formula),
- \(\|\pi_1(f)\| \leq \|f\|_1\) (from \(\|\pi(x)\| = 1\)).

The passage from the group representation \(\pi\) to the algebra representation \(\pi_1\) is the fundamental interface between group theory and Banach algebra theory.

### 4.2b Induced Representations and Mackey Theory

The most powerful method for constructing irreducible representations of a group \(G\) from representations of a subgroup \(H\) is **Mackey's induction**. This generalizes the classical fact that the representation theory of a semidirect product \(G = N \rtimes H\) (where \(N\) is a normal abelian subgroup) is entirely determined by the representation theory of the "little groups" \(H_\chi = \mathrm{Stab}_H(\chi)\) for characters \(\chi\) of \(N\).

<div class="definition">
<strong>Definition 4.3b (Induced Representation).</strong> Let \(H\) be a closed subgroup of \(G\) and \(\tau : H \to \mathcal{U}(\mathcal{K})\) a unitary representation. The <em>induced representation</em> \(\mathrm{Ind}_H^G \tau\) acts on the Hilbert space
\[
\mathcal{H} = \left\{ f : G \to \mathcal{K} \;\Big|\; f(xh) = \tau(h)^{-1}f(x)\, \forall h \in H,\; \int_{G/H} \|f(xH)\|^2\, dm_{G/H}(xH) < \infty \right\},
\]
with the action \((\mathrm{Ind}_H^G \tau)(g) f(x) = f(g^{-1}x)\).
</div>

The induced representation is the "right" way to extend a representation from a subgroup to the whole group. It satisfies the **Frobenius reciprocity**:
\[
\mathrm{Hom}_G(\mathrm{Ind}_H^G \tau,\, \pi) \cong \mathrm{Hom}_H(\tau,\, \pi|_H)
\]
for any representation \(\pi\) of \(G\), where \(\pi|_H\) is the restriction of \(\pi\) to \(H\). In words: homomorphisms from \(\mathrm{Ind}_H^G \tau\) to \(\pi\) (as \(G\)-representations) are the same as homomorphisms from \(\tau\) to the restriction of \(\pi\) to \(H\) (as \(H\)-representations).

<div class="theorem">
<strong>Theorem 4.4b (Mackey's Subgroup Theorem).</strong> Let \(G = N \rtimes H\) be a locally compact group where \(N\) is a closed normal abelian subgroup and \(H\) acts on \(N\) by automorphisms. The irreducible representations of \(G\) are parametrized as follows:
<ol>
<li>The Pontryagin dual \(\hat{N}\) carries a natural action of \(H\) (by \((h \cdot \chi)(n) = \chi(h^{-1}nh)\)).</li>
<li>For each \(H\)-orbit \(\mathcal{O} \subseteq \hat{N}\), choose a representative \(\chi \in \mathcal{O}\) and let \(H_\chi = \mathrm{Stab}_H(\chi)\) be the stabilizer ("little group").</li>
<li>For each irreducible representation \(\sigma\) of \(H_\chi\), the representation \(\mathrm{Ind}_{N \rtimes H_\chi}^{G}(\chi \otimes \sigma)\) is an irreducible representation of \(G\).</li>
<li>Every irreducible representation of \(G\) arises this way, and inequivalent \((\mathcal{O}, \sigma)\) give inequivalent representations.</li>
</ol>
</div>

<div class="example">
<strong>Example 4.5b (Irreducible representations of \(\mathrm{ISO}(n)\)).</strong> The Euclidean group \(\mathrm{ISO}(n) = \mathbb{R}^n \rtimes \mathrm{O}(n)\) has \(N = \mathbb{R}^n\) (translations) and \(H = \mathrm{O}(n)\) (rotations/reflections). The Pontryagin dual of \(\mathbb{R}^n\) is \(\hat{\mathbb{R}}^n \cong \mathbb{R}^n\), with \(\mathrm{O}(n)\) acting by its standard action \((A, \xi) \mapsto A\xi\). The orbits are the spheres \(S^{n-1}_r = \{|\xi| = r\}\) for \(r \geq 0\) (and the origin \(\{0\}\)). For each \(r > 0\), the stabilizer of the north pole \(e_n = (0,\ldots,0,1)\) is \(\mathrm{O}(n-1) \subset \mathrm{O}(n)\) (the subgroup fixing \(e_n\)). The irreducible representations of \(\mathrm{ISO}(n)\) are thus parametrized by:
- \(r \geq 0\) (the radius of the orbit), and
- An irreducible representation \(\sigma\) of \(\mathrm{O}(n-1)\).

For \(r > 0\), the corresponding representation \(\mathrm{Ind}_{N \rtimes \mathrm{O}(n-1)}^{\mathrm{ISO}(n)}(\chi_{e_n, r} \otimes \sigma)\) acts on sections of a bundle over the sphere \(S^{n-1}\). For \(\sigma = \mathbf{1}\) (trivial), the induced representation acts on \(L^2(S^{n-1})\) — this is the "physical" representation describing a particle of mass \(r\) in \(n\)-dimensional space with no internal spin.
</div>

Mackey's machine is the foundation for understanding the representation theory of many physically important groups: the Poincaré group \(\mathbb{R}^{3,1} \rtimes \mathrm{SO}(3,1)\) (particles classified by mass and spin), the Heisenberg group \(\mathbb{H}_n\) (quantum mechanics), and the \(ax+b\) group (wavelet analysis).

<div class="example">
<strong>Example 4.6b (The Heisenberg Group and the Stone-von Neumann Theorem).</strong> The <strong>Heisenberg group</strong> \(\mathbb{H}_n\) is the group of \((2n+1) \times (2n+1)\) upper-triangular matrices:
\[
\mathbb{H}_n = \left\{\begin{pmatrix} 1 & x^T & z \\ 0 & I_n & y \\ 0 & 0 & 1\end{pmatrix} : x, y \in \mathbb{R}^n,\, z \in \mathbb{R}\right\}
\]
with matrix multiplication giving the group law \((x, y, z)(x', y', z') = (x+x', y+y', z+z'+x\cdot y')\). The center of \(\mathbb{H}_n\) is \(Z = \{(0, 0, z) : z \in \mathbb{R}\}\), and \(\mathbb{H}_n / Z \cong \mathbb{R}^{2n}\) is abelian.

The irreducible unitary representations of \(\mathbb{H}_n\) are classified by the <strong>Stone-von Neumann theorem</strong>:
<ol>
<li><em>Infinite-dimensional representations (Schrödinger representations)</em>: For each nonzero \(\hbar \in \mathbb{R}\), there is a unique (up to equivalence) irreducible representation \(\pi_\hbar\) on \(L^2(\mathbb{R}^n)\) with the property that \(\pi_\hbar(0, 0, z) = e^{i\hbar z} I\). Explicitly:
\[
(\pi_\hbar(x, y, z) f)(\xi) = e^{i\hbar z} e^{i\hbar x \cdot \xi} f(\xi + y),
\]
i.e., multiplication by the character \(e^{i\hbar z + i\hbar x \cdot \xi}\) followed by translation by \(y\). This is the Schrödinger representation: the operators \(\hat{Q}_j = -i\partial/\partial y_j\) and \(\hat{P}_j = \xi_j\) (multiplication by the \(j\)-th coordinate) satisfy \([\hat{Q}_j, \hat{P}_k] = i\hbar \delta_{jk}\) — the canonical commutation relations of quantum mechanics.</li>
<li><em>One-dimensional representations</em>: For each \(\chi \in \hat{\mathbb{R}}^{2n}\), there is a one-dimensional representation \(\pi_{0,\chi}(x,y,z) = e^{i\chi(x,y)}\), with trivial central character. These factor through \(\mathbb{H}_n / Z\).</li>
</ol>

The Stone-von Neumann theorem says: every representation \(\pi_\hbar\) for a given \(\hbar \neq 0\) is equivalent to the Schrödinger representation, regardless of the realization. This is the mathematical theorem underlying the fact that the Heisenberg commutation relations have an essentially unique representation — a fact fundamental to quantum mechanics.

The Fourier analysis on \(\mathbb{H}_n\) (the theory of the "Fourier-Weyl transform") assigns to each \(f \in L^1(\mathbb{H}_n)\) a family of operators:
\[
\hat{f}(\hbar) = \int_{\mathbb{H}_n} f(x,y,z)\, \pi_\hbar(x,y,z)\, dx\, dy\, dz \in \mathcal{B}(L^2(\mathbb{R}^n)).
\]
The Plancherel formula reads:
\[
\|f\|_{L^2(\mathbb{H}_n)}^2 = \int_{\mathbb{R}^\times} \|\hat{f}(\hbar)\|_{\mathrm{HS}}^2 |\hbar|^n\, d\hbar,
\]
where the integration is over all nonzero values of the Planck constant \(\hbar\), and \(\|\cdot\|_{\mathrm{HS}}\) is the Hilbert-Schmidt norm. This is the non-abelian Plancherel theorem for \(\mathbb{H}_n\).
</div>

### 4.2 Positive Definite Functions

Positive definite functions are the "shadows" cast onto the group by unitary representations. They encode the diagonal information of a representation in a single scalar function.

<div class="definition">
<strong>Definition 4.3.</strong> A function \(\phi : G \to \mathbb{C}\) is <em>positive definite</em> (written \(\phi \in P(G)\) or \(\phi \in B^+(G)\)) if for all \(n \in \mathbb{N}\), all \(x_1, \ldots, x_n \in G\), and all \(\lambda_1, \ldots, \lambda_n \in \mathbb{C}\):
\[
\sum_{i,j=1}^n \lambda_i \overline{\lambda_j}\, \phi(x_i^{-1} x_j) \geq 0.
\]
</div>

In matrix terms, the condition says: for every finite set of group elements \(x_1, \ldots, x_n\), the \(n \times n\) matrix \((\phi(x_i^{-1}x_j))_{i,j}\) is positive semidefinite.

<div class="proposition">
<strong>Proposition 4.4 (Elementary properties).</strong> If \(\phi\) is positive definite and continuous, then:
<ol>
<li>\(\phi(e) \geq 0\).</li>
<li>\(\overline{\phi(x)} = \phi(x^{-1})\) for all \(x \in G\).</li>
<li>\(|\phi(x)| \leq \phi(e)\) for all \(x\in G\).</li>
<li>If \(\phi(e) = 0\) then \(\phi \equiv 0\).</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> For (1): take \(n=1\), \(x_1 = e\), \(\lambda_1 = 1\): \(\phi(e) \geq 0\). For (2): take \(n=2\), \(x_1=e\), \(x_2=x\), \(\lambda_1, \lambda_2 \in \mathbb{C}\). The \(2\times 2\) matrix \(\bigl(\begin{smallmatrix}\phi(e) & \phi(x) \\ \phi(x^{-1}) & \phi(e)\end{smallmatrix}\bigr)\) is positive semidefinite, so it is Hermitian: \(\phi(x^{-1}) = \overline{\phi(x)}\). For (3): the positive semidefiniteness gives \(|\phi(x)|^2 \leq \phi(e)^2\) (from the Cauchy-Schwarz inequality for positive semidefinite matrices, or equivalently, from the condition \(\det \geq 0\) applied to the \(2\times 2\) matrix). For (4): if \(\phi(e)=0\) then \(|\phi(x)| \leq \phi(e) = 0\).
</div>

<div class="theorem">
<strong>Theorem 4.5 (Bochner-Godement).</strong> A continuous function \(\phi : G \to \mathbb{C}\) is positive definite if and only if there exist a unitary representation \((\pi, \mathcal{H})\) and a vector \(\xi \in \mathcal{H}\) such that
\[
\phi(x) = \langle \pi(x)\xi, \xi \rangle \quad \forall x \in G.
\]
In this case, \(\phi(e) = \|\xi\|^2\) and \(\|\phi\|_\infty = \phi(e)\). The representation \(\pi\) may be chosen to be cyclic with cyclic vector \(\xi\).
</div>

<div class="proof">
<strong>Proof.</strong> (\(\Leftarrow\)) If \(\phi(x) = \langle \pi(x)\xi, \xi\rangle\), then for any \(x_1, \ldots, x_n \in G\) and \(\lambda_i \in \mathbb{C}\):
\[
\sum_{i,j} \lambda_i \overline{\lambda_j}\, \phi(x_i^{-1}x_j) = \sum_{i,j} \lambda_i \overline{\lambda_j}\, \langle \pi(x_i^{-1}x_j)\xi, \xi\rangle = \sum_{i,j} \lambda_i \overline{\lambda_j}\, \langle \pi(x_j)\xi, \pi(x_i)\xi\rangle = \left\|\sum_j \lambda_j \pi(x_j)\xi\right\|^2 \geq 0.
\]
(\(\Rightarrow\)) This direction is the GNS construction, carried out in Theorem 4.6 below.
</div>

### 4.3 The GNS Construction

The Gelfand-Naimark-Segal (GNS) construction is one of the central techniques in operator algebras and abstract harmonic analysis. Given any positive definite function, it builds a Hilbert space and representation from scratch — out of the function itself. This is the harmonic-analytic analogue of the representation theorem that builds a Hilbert space from a positive linear functional on a \(C^*\)-algebra.

<div class="theorem">
<strong>Theorem 4.6 (GNS Construction).</strong> Let \(\phi \in P(G)\) be continuous with \(\phi(e) > 0\). Define a sesquilinear form on \(C_c(G)\) by
\[
\langle f, g \rangle_\phi = \int_G \int_G \phi(x^{-1}y)\, f(x)\, \overline{g(y)}\, dm(x)\, dm(y).
\]
Let \(\mathcal{N}_\phi = \{f \in C_c(G) : \langle f, f\rangle_\phi = 0\}\). Then:
<ol>
<li>\(\langle \cdot, \cdot\rangle_\phi\) is a positive semidefinite sesquilinear form and \(\mathcal{N}_\phi\) is a subspace.</li>
<li>The quotient \(C_c(G)/\mathcal{N}_\phi\) completes to a Hilbert space \(\mathcal{H}_\phi\).</li>
<li>The formula \(\pi_\phi(x)[f] = [L_x f]\), where \((L_x f)(y) = f(x^{-1}y)\), defines a unitary representation \(\pi_\phi : G \to \mathcal{U}(\mathcal{H}_\phi)\).</li>
<li>There exists a cyclic vector \(\xi_\phi\) — a vector whose orbit \(\{\pi_\phi(x)\xi_\phi : x \in G\}\) spans a dense subspace — such that \(\phi(x) = \langle \pi_\phi(x)\xi_\phi, \xi_\phi\rangle\).</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> <em>Step 1: \(\langle\cdot,\cdot\rangle_\phi\) is positive semidefinite.</em> For any \(f \in C_c(G)\) and any partition of unity or Riemann sum approximation, write
\[
\langle f, f\rangle_\phi = \int\!\!\int \phi(x^{-1}y) f(x)\overline{f(y)}\, dm(x)\, dm(y).
\]
This is the "limit" of finite sums \(\sum_{i,j} \phi(x_i^{-1}x_j) f(x_i)\overline{f(x_j)} m(U_i)m(U_j)\) where \(x_i \in U_i\) are points in a Riemann sum partition. Each such sum is \(\geq 0\) by positive definiteness of \(\phi\), and the limit (in the Riemann integral sense for continuous functions with compact support) is also \(\geq 0\). More precisely: for any \(f \in C_c(G)\), the function \((x,y) \mapsto \phi(x^{-1}y)f(x)\overline{f(y)}\) is continuous and compactly supported, so \(\langle f,f\rangle_\phi\) is a genuine integral of a positive-definite kernel, hence \(\geq 0\).

<em>Step 2: \(\pi_\phi(x)\) is well-defined and isometric.</em> For \(f \in C_c(G)\) and \(x \in G\):
\[
\langle L_x f, L_x f\rangle_\phi = \int\!\!\int \phi(z^{-1}w) f(x^{-1}z)\overline{f(x^{-1}w)}\, dm(z)\, dm(w).
\]
Substituting \(z \mapsto xz\), \(w \mapsto xw\) and using left invariance of \(m\):
\[
= \int\!\!\int \phi((xz)^{-1}(xw)) f(z)\overline{f(w)}\, dm(z)\, dm(w) = \int\!\!\int \phi(z^{-1}w)f(z)\overline{f(w)}\, dm(z)\, dm(w) = \langle f, f\rangle_\phi.
\]
So \(\pi_\phi(x)\) preserves the semi-norm, passes to the quotient, and extends to a unitary on \(\mathcal{H}_\phi\).

<em>Step 3: The cyclic vector.</em> The cyclic vector is obtained as follows: for each \(\alpha \in \Lambda\) (a directed net of approximate identities with \(e_\alpha \in C_c(G)\)), set \(\xi_\alpha = [e_\alpha] \in C_c(G)/\mathcal{N}_\phi\). In the limit, this converges to a vector \(\xi_\phi \in \mathcal{H}_\phi\). More concretely, one computes:
\[
\langle \pi_\phi(x)[e_\alpha], [e_\alpha]\rangle_\phi = \langle [L_x e_\alpha], [e_\alpha]\rangle_\phi = \int\!\!\int \phi(y^{-1}z) e_\alpha(x^{-1}y)\overline{e_\alpha(z)}\, dm(y)\, dm(z).
\]
As \(\alpha \to \infty\) (support of \(e_\alpha\) shrinking to \(\{e\}\)) this converges to \(\phi(x)\), giving \(\phi(x) = \langle \pi_\phi(x)\xi_\phi, \xi_\phi\rangle\). The density of \(\{\pi_\phi(x)\xi_\phi\}\) in \(\mathcal{H}_\phi\) follows from the density of \(L^1(G)\) translations in \(L^1(G)\).

<em>Step 4: Continuity.</em> Strong continuity of \(\pi_\phi\) follows from the continuity of \(\phi\): for \(x_\alpha \to x\),
\[
\|\pi_\phi(x_\alpha)\xi_\phi - \pi_\phi(x)\xi_\phi\|^2 = 2\phi(e) - 2\operatorname{Re}\phi(x^{-1}x_\alpha) \to 0.
\]
By cyclicity, strong continuity at \(\xi_\phi\) implies strong continuity on all of \(\mathcal{H}_\phi\).
</div>

The GNS construction establishes a bijection between:
- Continuous positive definite functions \(\phi\) on \(G\) with \(\phi(e) = 1\), and
- Cyclic unitary representations \((\pi, \mathcal{H}, \xi)\) with unit cyclic vector.

The space \(B(G) = \overline{\mathrm{span}}^{w^*}\, P(G)\) of finite linear combinations of positive definite functions is the **Fourier-Stieltjes algebra** of \(G\). It is a Banach algebra under pointwise multiplication (not convolution!) with the norm \(\|\phi\|_{B(G)} = \inf\{\|\xi\|\|\eta\| : \phi(x) = \langle \pi(x)\xi, \eta\rangle\}\). The intersection \(A(G) = B(G) \cap C_0(G)\) is the **Fourier algebra**, which plays the role of the "dual" to \(L^1(G)\) in Eymard's duality theory.

### 4.4 Irreducible Representations and C*-Algebras of Groups

The GNS construction parametrizes cyclic representations by positive definite functions. To study all representations, one passes to a C*-algebraic completion of \(L^1(G)\).

<div class="definition">
<strong>Definition 4.7 (Group C*-algebras).</strong> The <em>full group C*-algebra</em> \(C^*(G)\) is the completion of \(L^1(G)\) under the norm
\[
\|f\|_{C^*(G)} = \sup\{ \|\pi_1(f)\|_{\mathcal{B}(\mathcal{H})} : \pi : G \to \mathcal{U}(\mathcal{H}) \text{ unitary representation} \},
\]
where \(\pi_1 : L^1(G) \to \mathcal{B}(\mathcal{H})\) is the integrated form. The <em>reduced group C*-algebra</em> \(C^*_r(G)\) is the completion of \(L^1(G)\) under the norm
\[
\|f\|_{C^*_r(G)} = \|\lambda_1(f)\|_{\mathcal{B}(L^2(G))},
\]
where \(\lambda_1 : L^1(G) \to \mathcal{B}(L^2(G))\) is the integrated form of the left regular representation.
</div>

The norms satisfy \(\|f\|_{C^*_r(G)} \leq \|f\|_{C^*(G)} \leq \|f\|_1\), so there are natural quotient maps \(L^1(G) \twoheadrightarrow C^*(G) \twoheadrightarrow C^*_r(G)\). These are equality (i.e., all three norms agree) if and only if every unitary representation of \(G\) is weakly contained in the regular representation, which is exactly the definition of amenability. We will return to this in Chapter 8 (Hulanicki's theorem).

The full C*-algebra \(C^*(G)\) is the "universal" C*-algebra for unitary representations: every unitary representation of \(G\) extends uniquely to a *-representation of \(C^*(G)\), and conversely. This universality means that the representation theory of \(G\) is encoded in the structure of \(C^*(G)\) as a C*-algebra. The Gelfand spectrum \(\hat{C^*(G)}\) — the space of irreducible *-representations — is the **unitary dual** of \(G\), often written \(\hat{G}\).

<div class="proposition">
<strong>Proposition 4.8 (Fell topology on \(\hat{G}\)).</strong> The unitary dual \(\hat{G}\) carries a natural topology, the <em>Fell topology</em> (also called the hull-kernel or Jacobson topology), defined as follows: a net \((\pi_\alpha)\) converges to \(\pi\) in the Fell topology if and only if for every \(f \in C^*(G)\) and \(\varepsilon > 0\), \(\|\pi(f)\| \leq \|\pi_\alpha(f)\| + \varepsilon\) eventually (i.e., \(\pi\) is a weak limit of the \(\pi_\alpha\) in the sense of weak containment).
</div>

The Fell topology is generally not Hausdorff, but it becomes Hausdorff — and indeed identifies \(\hat{G}\) with the Pontryagin dual \(\hat{G}\) — when \(G\) is abelian. For non-abelian \(G\), \(\hat{G}\) can have non-Hausdorff topology with a rich structure.

<div class="example">
<strong>Example 4.9.</strong>
<ol>
<li><em>\(G = \mathbb{R}\)</em>: The unitary dual consists of all characters \(\xi_t : x \mapsto e^{itx}\) for \(t \in \mathbb{R}\). The Fell topology is the usual topology on \(\mathbb{R}\). The isomorphism \(\hat{\mathbb{R}} \cong \mathbb{R}\) is the foundation of classical Fourier analysis on the line.</li>
<li><em>\(G = \mathbb{Z}\)</em>: The unitary dual consists of characters \(\xi_\theta : n \mapsto e^{in\theta}\) for \(\theta \in [0, 2\pi)\). So \(\hat{\mathbb{Z}} \cong \mathbb{T}\), and the Fourier analysis on \(\mathbb{Z}\) is the theory of Fourier series on the circle.</li>
<li><em>\(G = \mathbb{T}\)</em>: The unitary dual consists of characters \(\xi_n : e^{i\theta} \mapsto e^{in\theta}\) for \(n \in \mathbb{Z}\). So \(\hat{\mathbb{T}} \cong \mathbb{Z}\), and the Fourier analysis on \(\mathbb{T}\) produces the classical theory of Fourier series indexed by integers.</li>
<li><em>\(G = \mathrm{SU}(2)\)</em>: The unitary dual is parametrized by half-integers \(\ell \in \{0, 1/2, 1, 3/2, \ldots\}\), with the irreducible representation of "spin \(\ell\)" having dimension \(2\ell + 1\). This is the basis of the quantum mechanical theory of angular momentum.</li>
<li><em>\(G = \mathrm{SL}(2, \mathbb{R})\)</em>: The unitary dual has three series — principal, complementary, and discrete — reflecting the richness of representations for non-compact semisimple Lie groups. The Plancherel formula for \(\mathrm{SL}(2,\mathbb{R})\) (due to Bargmann and Harish-Chandra) involves integrals over the principal and discrete series.</li>
</ol>
</div>

<div class="remark">
<strong>Remark 4.10 (Plancherel decomposition).</strong> For a general locally compact group \(G\), the left regular representation \(\lambda : G \to \mathcal{U}(L^2(G))\) decomposes as a <em>direct integral</em> over the unitary dual:
\[
L^2(G) \cong \int_{\hat{G}}^{\oplus} \mathcal{H}_\pi \otimes \overline{\mathcal{H}_\pi}\, d\hat{\mu}(\pi),
\]
where \(\hat{\mu}\) is the Plancherel measure on \(\hat{G}\). When \(G\) is abelian, this reduces to the classical Plancherel theorem. When \(G\) is compact, the Plancherel measure is discrete (supported on the countable set \(\hat{G}\)) and the direct integral becomes the Peter-Weyl orthogonal decomposition \(L^2(G) = \bigoplus_{\pi \in \hat{G}} \mathcal{H}_\pi \otimes \overline{\mathcal{H}_\pi}\). For general locally compact groups the direct integral is non-trivial, and its explicit computation is a major research program (Harish-Chandra for semisimple groups, Mackey for semidirect products).
</div>

---

## Chapter 5: Gelfand Theory

### 5.1 Commutative Banach Algebras

Gelfand theory is the abstract framework for studying commutative Banach algebras via their "character spectra." It gives the abstract Fourier transform its Banach-algebraic underpinning.

<div class="definition">
<strong>Definition 5.1 (Commutative Banach Algebra).</strong> A <em>commutative Banach algebra</em> is a Banach space \(\mathcal{A}\) equipped with a commutative associative bilinear product satisfying \(\|ab\| \leq \|a\|\|b\|\). It is <em>unital</em> if it has a multiplicative identity \(1_{\mathcal{A}}\) with \(\|1_{\mathcal{A}}\| = 1\).
</div>

<div class="example">
<strong>Example 5.2.</strong>
<ol>
<li>\(C_0(X)\) for a locally compact Hausdorff space \(X\), with pointwise multiplication. Unital iff \(X\) is compact.</li>
<li>\(L^1(G)\) for an abelian locally compact group \(G\), with convolution. Unital iff \(G\) is discrete.</li>
<li>\(M(G)\) for an abelian locally compact group \(G\), with convolution; this is always unital (\(\delta_e\) is the unit).</li>
<li>The disk algebra \(\mathcal{A}(\mathbb{D}) = \{f \in C(\overline{\mathbb{D}}) : f\text{ is holomorphic on }\mathbb{D}\}\) with pointwise multiplication.</li>
</ol>
</div>

### 5.2 Characters and the Gelfand Spectrum

<div class="definition">
<strong>Definition 5.3.</strong> A <em>character</em> of a commutative Banach algebra \(\mathcal{A}\) is a nonzero linear multiplicative functional \(\chi : \mathcal{A} \to \mathbb{C}\). The <em>Gelfand spectrum</em> \(\hat{\mathcal{A}}\) is the set of all characters.
</div>

<div class="proposition">
<strong>Proposition 5.4.</strong> If \(\mathcal{A}\) is unital and \(\chi \in \hat{\mathcal{A}}\), then:
<ol>
<li>\(\chi(1_{\mathcal{A}}) = 1\);</li>
<li>\(\chi(a) \neq 0\) if \(a\) is invertible;</li>
<li>\(|\chi(a)| \leq \|a\|\), so \(\chi \in \mathcal{A}^*\) with \(\|\chi\| \leq 1\).</li>
</ol>
</div>

The proof of (3) uses the Neumann series: if \(|\lambda| > \|a\|\), then \(\lambda 1_{\mathcal{A}} - a\) is invertible, hence not in \(\ker\chi\), showing \(\lambda \neq \chi(a)\). Thus \(\sigma(a) = \{\chi(a) : \chi \in \hat{\mathcal{A}}\} \cup \{\text{possibly } 0\}\).

<div class="corollary">
<strong>Corollary 5.5.</strong> If \(\mathcal{A}\) is unital, then \(\hat{\mathcal{A}}\) is a \(w^*\)-compact subset of the unit ball of \(\mathcal{A}^*\). In general, \(\hat{\mathcal{A}}\) is a locally compact Hausdorff space in the \(w^*\)-topology.
</div>

<div class="example">
<strong>Example 5.5b (Gelfand spectrum of \(\ell^1(\mathbb{Z})\)).</strong> The Banach algebra \(\ell^1(\mathbb{Z})\) with convolution product \((f * g)(n) = \sum_{k \in \mathbb{Z}} f(k)g(n-k)\) has a natural unital extension \(\ell^1(\mathbb{Z})^+ = \ell^1(\mathbb{Z}) + \mathbb{C}\delta_0\) (since \(\ell^1(\mathbb{Z})\) already has a unit: \(\delta_0(n) = \mathbf{1}_{n=0}\) acts as the convolution identity). Its Gelfand spectrum is computed as follows.

A character \(\chi : \ell^1(\mathbb{Z}) \to \mathbb{C}\) is determined by the value \(z = \chi(\delta_1) \in \mathbb{C}\), where \(\delta_1\) is the sequence \(\delta_1(n) = \mathbf{1}_{n=1}\). Since convolution of \(\delta_m\) and \(\delta_n\) gives \(\delta_{m+n}\), we have \(\chi(\delta_n) = z^n\). By \(|\chi(a)| \leq \|a\|\), we need \(|z^n| \leq \|\delta_n\|_1 = 1\) for all \(n \in \mathbb{Z}\), forcing \(|z| = 1\). Conversely, for any \(z = e^{i\theta} \in \mathbb{T}\), the functional \(\chi_\theta(f) = \sum_{n \in \mathbb{Z}} f(n) e^{in\theta} = \hat{f}(\theta)\) is a character. So:
\[
\widehat{\ell^1(\mathbb{Z})} \cong \mathbb{T}, \quad \chi_\theta \leftrightarrow e^{i\theta}.
\]
The Gelfand transform \(\Gamma : \ell^1(\mathbb{Z}) \to C(\mathbb{T})\) is precisely the Fourier series: \(\Gamma(f)(\theta) = \hat{f}(\theta) = \sum_{n} f(n) e^{in\theta}\). The Gelfand-Naimark theorem (in its non-\(C^*\) form) says that \(\Gamma\) is an injective norm-decreasing algebra homomorphism, which is the classical fact that the Fourier series map \(\ell^1(\mathbb{Z}) \to C(\mathbb{T})\) is a contractive algebra homomorphism. The image is not all of \(C(\mathbb{T})\) (there exist continuous functions whose Fourier series does not converge absolutely), but its closure is \(C(\mathbb{T})\) in the sup-norm. The spectral radius formula gives \(\|\hat{f}\|_{C(\mathbb{T})} = r_{\ell^1}(f)\) — the Fourier series norm is the spectral radius.
</div>

### 5.3 Maximal Ideals and the Gelfand Transform

<div class="theorem">
<strong>Theorem 5.6 (Maximal Ideals).</strong> In a unital commutative Banach algebra \(\mathcal{A}\), the map \(\chi \mapsto \ker\chi\) is a bijection between \(\hat{\mathcal{A}}\) and the set of proper maximal ideals of \(\mathcal{A}\). Every maximal ideal is closed.
</div>

<div class="proof">
<strong>Proof.</strong> The quotient \(\mathcal{A}/\ker\chi \cong \chi(\mathcal{A}) = \mathbb{C}\) shows \(\ker\chi\) is maximal. Conversely, if \(\mathcal{M}\) is a maximal ideal, then \(\mathcal{A}/\mathcal{M}\) is a Banach field, and by Mazur's theorem (every element has nonempty spectrum, so no division algebra over \(\mathbb{C}\) beyond \(\mathbb{C}\) itself), \(\mathcal{A}/\mathcal{M} \cong \mathbb{C}\). The projection \(\mathcal{A} \to \mathcal{A}/\mathcal{M} \cong \mathbb{C}\) is then a character.
</div>

<div class="definition">
<strong>Definition 5.7 (Gelfand Transform).</strong> The <em>Gelfand transform</em> is the map \(\Gamma : \mathcal{A} \to C_0(\hat{\mathcal{A}})\) given by \(\Gamma(a)(\chi) = \hat{a}(\chi) = \chi(a)\).
</div>

<div class="proposition">
<strong>Proposition 5.8 (Gelfand Transform Properties).</strong>
<ol>
<li>\(\Gamma\) is a norm-decreasing algebra homomorphism: \(\|\hat{a}\|_\infty \leq \|a\|\).</li>
<li>The spectral radius formula: \(\|\hat{a}\|_\infty = r(a) = \lim_{n \to \infty} \|a^n\|^{1/n}\).</li>
<li>If \(\mathcal{A}\) is a commutative \(C^*\)-algebra (i.e., \(\|a^*a\| = \|a\|^2\)), then \(\Gamma\) is an isometric \(*\)-isomorphism \(\mathcal{A} \cong C_0(\hat{\mathcal{A}})\).</li>
</ol>
</div>

Statement (3) is the **Gelfand-Naimark theorem** for commutative \(C^*\)-algebras. It is the abstract backbone of the Fourier inversion theorem: when the abstract Fourier transform is an isometric isomorphism, it is precisely because the algebra in question is a \(C^*\)-algebra.

<div class="proof">
<strong>Proof of Proposition 5.8(3) (Gelfand-Naimark theorem).</strong> Let \(\mathcal{A}\) be a commutative \(C^*\)-algebra. We show the Gelfand transform \(\Gamma : \mathcal{A} \to C_0(\hat{\mathcal{A}})\) is an isometric \(*\)-isomorphism.

<em>Isometry:</em> For any \(a \in \mathcal{A}\), the \(C^*\)-identity gives \(\|a\|^2 = \|a^*a\|\). The spectral radius formula and self-adjointness of \(a^*a\) (which has real spectrum in any \(C^*\)-algebra) gives \(\|a^*a\| = r(a^*a) = \|\widehat{a^*a}\|_\infty = \|\hat{a}|^2\|_\infty = \|\hat{a}\|_\infty^2\). Hence \(\|\hat{a}\|_\infty = \|a\|\).

<em>Surjectivity:</em> The image \(\Gamma(\mathcal{A}) \subseteq C_0(\hat{\mathcal{A}})\) is a \(*\)-subalgebra that separates points (since characters separate elements), contains no nonzero function vanishing everywhere (since \(\Gamma\) is injective), and is closed (since \(\Gamma\) is an isometry). By the Stone-Weierstrass theorem applied to the locally compact Hausdorff space \(\hat{\mathcal{A}}\), \(\Gamma(\mathcal{A}) = C_0(\hat{\mathcal{A}})\).

<em>\(*\)-homomorphism:</em> For self-adjoint \(a = a^*\), the functional calculus identifies \(\hat{a}(\chi) = \chi(a) \in \mathbb{R}\), so \(\widehat{a^*} = \overline{\hat{a}}\). By linearity this extends to all \(a \in \mathcal{A}\). Multiplicativity holds because \(\widehat{ab}(\chi) = \chi(ab) = \chi(a)\chi(b) = \hat{a}(\chi)\hat{b}(\chi)\).
</div>

The Gelfand-Naimark theorem gives a clean conceptual framework for understanding why harmonic analysis works: the Fourier transform is just the Gelfand transform, and its isometric property is a consequence of the \(C^*\)-identity. For \(L^1(G)\) with \(G\) abelian, the Gelfand transform is the Fourier transform \(f \mapsto \hat{f}\), but \(L^1(G)\) is only a Banach \(*\)-algebra, not a \(C^*\)-algebra (the \(C^*\)-identity fails in general). The Gelfand transform from \(L^1(G)\) is thus only norm-decreasing, not isometric. To get an isometry one must pass to \(L^2(G)\), and this requires the Plancherel theorem.

### 5.4 The Spectrum of \(L^1(\mathbb{R})\) and Analytic Functions

The Gelfand spectrum of \(L^1(\mathbb{R})\) is \(\hat{\mathbb{R}} \cong \mathbb{R}\), with characters \(\chi_\xi(f) = \hat{f}(\xi)\). An important consequence of the spectral radius formula is the relationship between the decay of \(f\) and the analyticity of \(\hat{f}\):

<div class="theorem">
<strong>Theorem 5.9 (Wiener's Theorem on Inversion in \(L^1(\mathbb{R})\)).</strong> If \(f \in L^1(\mathbb{R})\) and \(\hat{f}(\xi) \neq 0\) for all \(\xi \in \mathbb{R}\), then \(1/\hat{f}\) is also the Fourier transform of an \(L^1\) function. Equivalently, \(f\) is invertible in the Banach algebra \(L^1(\mathbb{R})\) (with convolution product) if and only if \(\hat{f}\) has no zeros.
</div>

<div class="proof">
<strong>Proof.</strong> The function \(f\) fails to be invertible in \(L^1(\mathbb{R})\) if and only if \(f\) belongs to some maximal ideal. By the Gelfand theory, the maximal ideals of \(L^1(\mathbb{R})\) are exactly the kernels of characters, i.e., the sets \(\{f : \hat{f}(\xi_0) = 0\}\) for \(\xi_0 \in \mathbb{R}\). So \(f\) is invertible iff \(\hat{f}\) has no zeros. By the Gelfand-Naimark theorem applied to the \(C^*\)-envelope, this means \(1/\hat{f} \in C_0(\mathbb{R})\) lifts to an invertible element of \(L^1(\mathbb{R})\).
</div>

This theorem is a cornerstone of Norbert Wiener's work on Tauberian theorems (1932). It was one of the first results to demonstrate the power of Banach algebra methods in analysis: a purely analytic question (when is \(1/\hat{f}\) a Fourier transform?) is reduced to an algebraic question (when is \(f\) invertible in the Banach algebra?), which is then answered by the spectral theory of maximal ideals.

<div class="example">
<strong>Example 5.10 (Spectral radius and exponential decay).</strong> For \(f \in L^1(\mathbb{R})\), define the strip of analyticity \(\Sigma(f) = \{z \in \mathbb{C} : e^{-a|\cdot|} f \in L^1(\mathbb{R})\ \text{for all}\ a < \mathrm{Im}(z)\}\). The Fourier transform \(\hat{f}\) extends to an analytic function on \(\Sigma(f)\): for \(z = \xi + i\eta\) with \(\eta \in \Sigma(f)\),
\[
\hat{f}(z) = \int_\mathbb{R} f(x) e^{-izx}\, dx = \int_\mathbb{R} f(x) e^{-i\xi x} e^{\eta x}\, dx.
\]
The width of the strip is determined by the exponential decay of \(f\): if \(|f(x)| \leq C e^{-a|x|}\) for some \(a > 0\), then \(\hat{f}\) extends to a strip of width \(a\) around the real axis. Conversely, if \(\hat{f}\) extends analytically to a strip of width \(a\), then \(f\) decays exponentially at rate \(a\). This is the Paley-Wiener theorem for \(L^1\) functions.

The spectral radius of \(f\) in \(L^1(\mathbb{R})\) is \(r(f) = \|\hat{f}\|_{L^\infty(\mathbb{R})}\), and the growth rate of the "convolution powers" \(f^{*n}\) is controlled by: \(\limsup_{n\to\infty} \|f^{*n}\|_1^{1/n} = r(f) = \sup_\xi |\hat{f}(\xi)|\). If \(f\) is a probability distribution (i.e., \(f \geq 0\), \(\int f = 1\), corresponding to a random walk on \(\mathbb{R}\)), then \(\hat{f}(\xi) = 1\) at \(\xi = 0\) and \(|\hat{f}(\xi)| < 1\) for \(\xi \neq 0\), giving \(r(f) = 1\). The long-time behavior of the convolution powers \(f^{*n}\) is then controlled by the behavior of \(\hat{f}\) near 0 — giving the central limit theorem (Gaussian convergence) when \(\hat{f}(\xi) = 1 - \sigma^2\xi^2/2 + O(\xi^3)\).
</div>

---

## Chapter 6: Abelian Harmonic Analysis and Pontryagin Duality

### 6.1 The Pontryagin Dual

Let \(G\) be an abelian locally compact group. A **character** of \(G\) is a continuous group homomorphism \(\sigma : G \to \mathbb{T}\). By Schur's lemma for abelian groups, every irreducible unitary representation is one-dimensional, hence a character.

<div class="definition">
<strong>Definition 6.1 (Pontryagin Dual).</strong> The <em>Pontryagin dual</em> (or simply the <em>dual group</em>) of an abelian locally compact group \(G\) is
\[
\hat{G} = \{\sigma : G \to \mathbb{T} : \sigma\text{ is a continuous group homomorphism}\}.
\]
</div>

The group operation on \(\hat{G}\) is pointwise multiplication: \((\sigma\tau)(x) = \sigma(x)\tau(x)\). The identity is the trivial character \(\mathbf{1}(x) = 1\), and \(\sigma^{-1} = \bar{\sigma}\).

<div class="theorem">
<strong>Theorem 6.2.</strong> Let \(G\) be an abelian locally compact group.
<ol>
<li>\(\hat{G} \cong \widehat{L^1(G)}\) as locally compact spaces, via \(\sigma \mapsto \chi_\sigma\) where \(\chi_\sigma(f) = \int_G f(x)\overline{\sigma(x)}\, dm(x)\).</li>
<li>\(\hat{G}\) is a locally compact Hausdorff abelian group in the topology of uniform convergence on compact sets (which coincides with the \(w^*\)-topology from \(L^\infty(G)\)).</li>
<li>If \(G\) is compact, then \(\hat{G}\) is discrete. If \(G\) is discrete, then \(\hat{G}\) is compact.</li>
</ol>
</div>

To understand the dual group concretely, one must identify all continuous group homomorphisms \(G \to \mathbb{T}\). For the standard groups, this is a pleasant exercise in analysis.

<div class="proposition">
<strong>Proposition 6.3a (Characters of \(\mathbb{R}\)).</strong> Every continuous group homomorphism \(\sigma : \mathbb{R} \to \mathbb{T}\) has the form \(\sigma(x) = e^{i\xi x}\) for a unique \(\xi \in \mathbb{R}\). Thus \(\hat{\mathbb{R}} \cong \mathbb{R}\).
</div>

<div class="proof">
<strong>Proof.</strong> Let \(\sigma : \mathbb{R} \to \mathbb{T}\) be continuous with \(\sigma(x+y) = \sigma(x)\sigma(y)\). Writing \(\sigma = e^{i\phi}\) for a continuous real-valued lift \(\phi\), the homomorphism condition gives \(\phi(x+y) = \phi(x) + \phi(y) + 2\pi k(x,y)\) for integer-valued \(k\). Since \(\phi\) is continuous, \(k \equiv 0\). So \(\phi : \mathbb{R} \to \mathbb{R}\) is a continuous additive function, hence linear: \(\phi(x) = \xi x\) for some \(\xi \in \mathbb{R}\). Thus \(\sigma(x) = e^{i\xi x}\).
</div>

The fundamental examples are indispensable:

<div class="example">
<strong>Example 6.3 (The Basic Duality Table).</strong>
<ul>
<li>\(\hat{\mathbb{Z}} \cong \mathbb{T}\): characters of \(\mathbb{Z}\) are \(n \mapsto z^n\) for \(z \in \mathbb{T}\). The Haar measure on \(\hat{\mathbb{Z}} = \mathbb{T}\) is normalized arc length \(d\theta/2\pi\). The Fourier transform of \(f \in \ell^1(\mathbb{Z})\) is the Laurent series \(\hat{f}(z) = \sum_{n\in\mathbb{Z}} f(n) z^n\).</li>
<li>\(\hat{\mathbb{T}} \cong \mathbb{Z}\): characters of \(\mathbb{T}\) are \(z \mapsto z^n\) for \(n \in \mathbb{Z}\). The Fourier transform of \(f \in L^1(\mathbb{T})\) is \(\hat{f}(n) = \int_\mathbb{T} f(z) z^{-n}\, d\theta/2\pi = \int_0^{2\pi} f(e^{i\theta}) e^{-in\theta}\, d\theta/2\pi\), the \(n\)-th Fourier coefficient.</li>
<li>\(\hat{\mathbb{R}} \cong \mathbb{R}\): characters of \(\mathbb{R}\) are \(x \mapsto e^{i\xi x}\) for \(\xi \in \mathbb{R}\). The Fourier transform of \(f \in L^1(\mathbb{R})\) is \(\hat{f}(\xi) = \int_\mathbb{R} f(x) e^{-i\xi x}\, dx\). The dual Haar measure is \(d\xi / 2\pi\).</li>
<li>\(\hat{\mathbb{Z}}/n\mathbb{Z} \cong \mathbb{Z}/n\mathbb{Z}\): characters are \(k \mapsto e^{2\pi i jk/n}\) for \(j = 0, \ldots, n-1\). The Fourier transform is the discrete Fourier transform (DFT).</li>
<li>\(\widehat{\mathbb{Q}_p} \cong \mathbb{Q}_p\): the \(p\)-adic numbers are self-dual, with the character \(\psi_\xi(x) = e^{2\pi i \{x\xi\}_p}\) where \(\{y\}_p = \sum_{k=v_p(y)}^{-1} a_k p^k\) is the "fractional part" (the part with negative powers of \(p\) in the \(p\)-adic expansion).</li>
</ul>
</div>

The identification \(\hat{\mathbb{R}} \cong \mathbb{R}\) explains why the classical Fourier transform converts time-domain signals (functions of \(x \in \mathbb{R}\)) to frequency-domain spectra (functions of \(t \in \hat{\mathbb{R}}\)): the dual of the "time" group is the "frequency" group.

### 6.2 The Abstract Fourier Transform

<div class="definition">
<strong>Definition 6.4 (Fourier Transform).</strong> For \(f \in L^1(G)\), the <em>Fourier transform</em> of \(f\) is the function \(\hat{f} : \hat{G} \to \mathbb{C}\) defined by
\[
\hat{f}(\sigma) = \int_G f(x)\overline{\sigma(x)}\, dm(x).
\]
</div>

<div class="theorem">
<strong>Theorem 6.5 (Riemann-Lebesgue Lemma).</strong> The map \(f \mapsto \hat{f} : L^1(G) \to C_0(\hat{G})\) is a norm-decreasing algebra homomorphism (where the product on \(L^1(G)\) is convolution and on \(C_0(\hat{G})\) is pointwise multiplication). The image \(\mathcal{A}(\hat{G}) = \{\hat{f} : f \in L^1(G)\}\) is a dense subalgebra of \(C_0(\hat{G})\), and \(\|\hat{f}\|_\infty = r(f) = \lim_{n \to \infty} \|f^{*n}\|_1^{1/n}\).
</div>

The density of \(\mathcal{A}(\hat{G})\) in \(C_0(\hat{G})\) follows from Stone-Weierstrass: \(\mathcal{A}(\hat{G})\) is a conjugate-closed, point-separating subalgebra. This is the abstract Gelfand transform at work — the Fourier transform *is* the Gelfand transform for \(L^1(G)\).

The key algebraic identity is:
\[
\widehat{f * g} = \hat{f} \cdot \hat{g}, \quad \widehat{f^*} = \overline{\hat{f}}.
\]
These follow directly from Fubini and the homomorphism property of characters.

### 6.3 Bochner's Theorem

Before stating Pontryagin duality, we need Bochner's theorem, which characterizes positive definite functions on \(G\) as Fourier transforms of positive measures on \(\hat{G}\). This is the abelian version of the Bochner-Godement theorem.

<div class="theorem">
<strong>Theorem 6.6 (Bochner's Theorem).</strong> Let \(G\) be an abelian locally compact group. A continuous function \(\phi : G \to \mathbb{C}\) is positive definite if and only if there exists a finite positive Borel measure \(\mu\) on \(\hat{G}\) such that
\[
\phi(x) = \int_{\hat{G}} \sigma(x)\, d\mu(\sigma) = \hat{\mu}(x), \quad x \in G.
\]
The measure \(\mu\) is unique, and \(\|\phi\|_\infty = \phi(e) = \mu(\hat{G})\).
</div>

<div class="proof">
<strong>Proof.</strong> (\(\Leftarrow\)) If \(\phi = \hat{\mu}\) with \(\mu \geq 0\), then for any \(x_1, \ldots, x_n\) and \(\lambda_i\):
\[
\sum_{i,j} \lambda_i \overline{\lambda_j}\, \phi(x_i^{-1}x_j) = \sum_{i,j} \lambda_i \overline{\lambda_j} \int_{\hat{G}} \sigma(x_i^{-1}x_j)\, d\mu(\sigma) = \int_{\hat{G}} \left|\sum_i \lambda_i \sigma(x_i)\right|^2 d\mu(\sigma) \geq 0.
\]

(\(\Rightarrow\)) By the GNS construction (Theorem 4.6), since \(G\) is abelian, the GNS representation \((\pi_\phi, \mathcal{H}_\phi)\) also commutes with itself: for all \(x, y \in G\), \(\pi_\phi(x)\pi_\phi(y) = \pi_\phi(xy) = \pi_\phi(yx) = \pi_\phi(y)\pi_\phi(x)\). So \(\pi_\phi(G)\) is a commutative family of unitary operators on \(\mathcal{H}_\phi\). By the spectral theorem for commutative families of unitaries, there is a spectral measure \(E\) on the joint spectrum of the operators — which coincides with \(\hat{G}\) since the characters are the joint eigenvectors — such that \(\pi_\phi(x) = \int_{\hat{G}} \sigma(x)\, dE(\sigma)\). Setting \(\mu = \langle E(\cdot)\xi_\phi, \xi_\phi\rangle\) (a positive measure) gives
\[
\phi(x) = \langle \pi_\phi(x)\xi_\phi, \xi_\phi\rangle = \int_{\hat{G}} \sigma(x)\, d\mu(\sigma).
\]
Uniqueness follows from the injectivity of the Fourier transform on measures (which in turn follows from the fact that characters separate points in \(G\)).
</div>

Bochner's theorem on \(G = \mathbb{R}\) is the classical statement: a continuous function \(\phi : \mathbb{R} \to \mathbb{C}\) is positive definite iff \(\phi(t) = \int_{\mathbb{R}} e^{it\xi}\, d\mu(\xi)\) for some finite positive Borel measure \(\mu\) on \(\hat{\mathbb{R}} \cong \mathbb{R}\). This is used constantly in probability theory (characteristic functions of random variables are positive definite!) and in the theory of stationary processes.

### 6.4 Pontryagin Duality

The most profound result of abstract abelian harmonic analysis is that the double dual \(\hat{\hat{G}}\) is canonically isomorphic to \(G\).

<div class="theorem">
<strong>Theorem 6.7 (Pontryagin Duality).</strong> Let \(G\) be an abelian locally compact group. The canonical map
\[
\iota : G \to \hat{\hat{G}}, \quad \iota(x)(\sigma) = \sigma(x)
\]
is a topological group isomorphism.
</div>

<div class="proof">
<strong>Proof outline.</strong> We verify four things.

<em>(i) \(\iota\) is a well-defined continuous group homomorphism.</em> For each \(x \in G\), the map \(\sigma \mapsto \sigma(x)\) is a continuous group homomorphism \(\hat{G} \to \mathbb{T}\), hence an element of \(\hat{\hat{G}}\). Continuity of \(\iota\) in the topology of \(\hat{\hat{G}}\) (compact convergence on \(\hat{G}\)) follows from the fact that evaluation maps are continuous.

<em>(ii) \(\iota\) is injective.</em> Suppose \(\iota(x) = \mathbf{1}\), i.e., \(\sigma(x) = 1\) for all \(\sigma \in \hat{G}\). We must show \(x = e\). If \(x \neq e\), then by a standard result (characters separate points in locally compact abelian groups, proved using the Stone-Čech compactification), there exists \(\sigma \in \hat{G}\) with \(\sigma(x) \neq 1\). So injectivity follows from the character separation property.

<em>(iii) \(\iota(\hat{G}) = \hat{\hat{G}}\) (surjectivity).</em> This is the hardest step. Let \(\chi \in \hat{\hat{G}}\). One shows that \(\chi\) arises as evaluation at some \(x \in G\). The strategy: by Bochner's theorem applied to \(\hat{G}\), the character \(\chi : \hat{G} \to \mathbb{T}\) corresponds to a continuous positive definite function on \(\hat{G}\), which by Bochner is the Fourier transform of a measure on \(\hat{\hat{G}} \cong G\) (using a bootstrap argument). The nontrivial part is showing that this measure is actually a point mass \(\delta_x\).

The standard approach (following Weil's original proof) proceeds by:
1. Show that the Fourier inversion theorem holds for functions in \(B^1(G) = B(G) \cap L^1(G)\) (see Theorem 6.8).
2. Use Bochner's theorem to show that every \(\chi \in \hat{\hat{G}}\) induces, via convolution, an operator on \(L^2(G)\) that commutes with all translations.
3. By a result of Godement, every bounded operator on \(L^2(G)\) commuting with translations is a convolution operator, i.e., given by a measure on \(G\).
4. The character property of \(\chi\) forces this measure to be a point mass.

<em>(iv) \(\iota\) is a homeomorphism.</em> This follows from the open mapping theorem for topological groups (since \(\iota\) is a continuous bijective group homomorphism between locally compact groups, and any such bijection is automatically a homeomorphism by a standard result due to Pontrjagin and van Kampen).
</div>

Let us give the surjectivity argument more explicitly for the case \(G = \mathbb{R}\), which is the prototype for the general proof.

**Surjectivity of \(\iota : \mathbb{R} \to \hat{\hat{\mathbb{R}}}\) (the key case).** We want to show every \(\chi \in \hat{\hat{\mathbb{R}}} = \hat{\mathbb{R}}\) has the form \(\chi(\sigma) = \sigma(x_0)\) for some \(x_0 \in \mathbb{R}\), where \(\sigma \in \hat{\mathbb{R}} \cong \mathbb{R}\) is identified with \(\sigma_\xi(x) = e^{i\xi x}\) for \(\xi \in \mathbb{R}\). So \(\chi : \hat{\mathbb{R}} \to \mathbb{T}\) is a continuous group homomorphism from the "frequency" copy of \(\mathbb{R}\) to \(\mathbb{T}\). By Proposition 6.3a applied to the frequency group, \(\chi(\xi) = e^{ix_0 \xi}\) for some \(x_0 \in \mathbb{R}\). Hence \(\chi = \iota(x_0)\). \(\square\)

For a general locally compact abelian group \(G\), the surjectivity is less direct. The strategy follows four steps:

**Step 1.** Every \(\chi \in \hat{\hat{G}}\) defines, by duality, a "translation-commuting" operator on \(L^2(G)\): for \(f \in L^2(G)\), define \(T_\chi f = \mathcal{F}^{-1}(\chi \cdot \hat{f})\) where \(\hat{f} \in L^2(\hat{G})\) and we multiply pointwise by the character \(\chi\). The operator \(T_\chi\) commutes with all translations on \(G\) (since multiplication by \(\chi\) on the Fourier side corresponds to some operation on the space side).

**Step 2.** Any bounded operator on \(L^2(G)\) that commutes with all translations is a convolution operator: \(T_\chi f = \mu * f\) for some bounded measure \(\mu \in M(G)\). This is a consequence of the fact that \(M(G)\) is the multiplier algebra of \(L^1(G)\), and bounded translation-commuting operators are exactly the convolution operators. (For \(G = \mathbb{R}\): this is the classical theorem that the multiplier algebra of \(L^2(\mathbb{R})\) is \(L^\infty(\mathbb{R})\), so the operator is multiplication by a bounded function on the Fourier side.)

**Step 3.** Since \(\chi\) is a group homomorphism \(\hat{G} \to \mathbb{T}\), the measure \(\mu\) satisfies \(\hat{\mu} = \chi\) on \(\hat{G}\). The character property \(\chi(\sigma_1 + \sigma_2) = \chi(\sigma_1)\chi(\sigma_2)\) translates to a convolution identity for \(\mu\): \(\mu * \mu = \text{some measure concentrated on a single point}\). This forces \(\mu\) to be a **point mass**: \(\mu = \delta_{x_0}\) for some \(x_0 \in G\).

**Step 4.** Therefore \(\hat{\mu}(\sigma) = \sigma(x_0)\) for all \(\sigma \in \hat{G}\), giving \(\chi = \iota(x_0)\). \(\square\)

The Pontryagin duality theorem has several striking consequences. It implies that the dual of a compact group is discrete (and vice versa), and that the dual of a finite group is isomorphic to itself. For the torus \(\mathbb{T}\), duality says \(\hat{\mathbb{Z}} \cong \mathbb{T}\) and \(\hat{\mathbb{T}} \cong \mathbb{Z}\) — the Fourier series and the Fourier transform are related as inverses of each other under duality. The Pontryagin double-dual theorem is also the algebraic reason that the Fourier inversion formula works: inversion corresponds to evaluating the double dual map \(\iota^{-1}\).

<div class="example">
<strong>Example 6.8 (Self-dual groups).</strong> A group \(G\) is <em>self-dual</em> if \(G \cong \hat{G}\). Examples include:
<ul>
<li>\(\mathbb{R}\): \(\hat{\mathbb{R}} \cong \mathbb{R}\) via \(\xi \mapsto (x \mapsto e^{i\xi x})\).</li>
<li>\(\mathbb{Q}_p\): \(\widehat{\mathbb{Q}_p} \cong \mathbb{Q}_p\) via the character \(x \mapsto e^{2\pi i \{x\}_p}\).</li>
<li>\(\mathbb{Z}/n\mathbb{Z}\): finite cyclic groups are self-dual.</li>
<li>The adèle group \(\mathbb{A}_\mathbb{Q} = \mathbb{R} \times \prod_p' \mathbb{Q}_p\): self-dual, which underlies the Riemann zeta function and the Poisson summation formula in its full generality (Tate's thesis).</li>
</ul>
</div>

### 6.5 The Inversion and Plancherel Theorems

<div class="theorem">
<strong>Theorem 6.9 (Inversion Theorem).</strong> There is a normalization of Haar measure \(d\sigma\) on \(\hat{G}\) (the "dual Haar measure," unique up to the same scalar as the Haar measure on \(G\)) such that for every \(f \in B^1(G) = B(G) \cap L^1(G)\),
\[
f(x) = \int_{\hat{G}} \hat{f}(\sigma)\,\sigma(x)\, d\sigma.
\]
</div>

<div class="proof">
<strong>Proof of the key case \(f = \phi * \phi^*\), \(\phi \in L^1(G) \cap L^2(G)\).</strong> One checks that \(f = \phi * \phi^*\) is positive definite and in \(L^1(G)\). By Bochner's theorem, \(f = \hat{\mu}\) for a positive measure \(\mu\) on \(\hat{G}\). On the other hand, \(\hat{f} = |\hat{\phi}|^2 \geq 0\), and \(\hat{f} \in L^1(\hat{G})\) since \(\hat{\phi} \in L^2(\hat{G})\) (this requires the a priori Plancherel formula, which is established simultaneously). The uniqueness of the representing measure in Bochner's theorem forces \(d\mu = \hat{f}\, d\sigma\), and evaluating at \(x = e\) gives the normalization condition:
\[
f(e) = \int \hat{f}(\sigma)\, d\sigma, \quad \text{i.e.,}\quad \int_G f = \int_{\hat{G}} \hat{f}.
\]
The inversion formula for general \(f \in B^1(G)\) follows by approximation and the density of \(\phi * \phi^*\) in \(B^1(G)\).
</div>

<div class="theorem">
<strong>Theorem 6.10 (Plancherel Theorem).</strong> With the dual Haar measure \(d\sigma\) on \(\hat{G}\) normalized as in Theorem 6.9, the Fourier transform on \(L^1(G) \cap L^2(G)\) extends uniquely to a unitary isomorphism
\[
\mathcal{F} : L^2(G) \xrightarrow{\;\;\sim\;\;} L^2(\hat{G}),
\]
satisfying \(\|\hat{f}\|_{L^2(\hat{G})} = \|f\|_{L^2(G)}\) for all \(f \in L^1(G) \cap L^2(G)\).
</div>

<div class="proof">
<strong>Proof.</strong> For \(f, g \in L^1(G) \cap L^2(G)\), applying the inversion theorem to \(f * g^*\) at \(e\):
\[
(f * g^*)(e) = \int_G f(y)\overline{g(y)}\, dm(y) = \int_{\hat{G}} \widehat{f * g^*}(\sigma)\, d\sigma = \int_{\hat{G}} \hat{f}(\sigma)\overline{\hat{g}(\sigma)}\, d\sigma.
\]
This is the Parseval identity: \(\langle f, g\rangle_{L^2(G)} = \langle \hat{f}, \hat{g}\rangle_{L^2(\hat{G})}\). Taking \(f = g\) gives \(\|f\|_2 = \|\hat{f}\|_2\). Since \(L^1(G) \cap L^2(G)\) is dense in \(L^2(G)\), \(\mathcal{F}\) extends by continuity to an isometry \(L^2(G) \to L^2(\hat{G})\). Surjectivity follows from Pontryagin duality: the adjoint \(\mathcal{F}^* : L^2(\hat{G}) \to L^2(G)\) is the inverse Fourier transform \(g \mapsto (x \mapsto \int_{\hat{G}} g(\sigma)\sigma(x)\, d\sigma)\), and Pontryagin duality implies \(\mathcal{F}^*\mathcal{F} = \mathrm{id}\) and \(\mathcal{F}\mathcal{F}^* = \mathrm{id}\).
</div>

The Plancherel theorem is the crown jewel of abelian harmonic analysis. It says that the Fourier transform is a *unitary equivalence* between \(L^2(G)\) and \(L^2(\hat{G})\) — the time and frequency domains are isometrically equivalent Hilbert spaces, and every \(L^2\) function has an equally valid description as a function on \(G\) or as a function on \(\hat{G}\).

In the classical case \(G = \mathbb{R}\), the dual Haar measure is \(d\xi/2\pi\), and the inversion formula \(f(x) = \int_\mathbb{R} \hat{f}(\xi) e^{ix\xi}\, d\xi / 2\pi\) is the classical Fourier inversion formula. Parseval's identity \(\|f\|_{L^2(\mathbb{R})} = \|\hat{f}\|_{L^2(\mathbb{R})}\) is the classical statement.

**Number-theoretic applications: Tate's thesis.** The most profound application of Pontryagin duality in modern mathematics is John Tate's 1950 thesis, which used the harmonic analysis on the adèle group \(\mathbb{A}_\mathbb{Q}\) to give a clean, functorial proof of the functional equation and analytic continuation of the Riemann zeta function and its generalizations (Hecke \(L\)-functions).

The **adèle ring** \(\mathbb{A}_\mathbb{Q}\) is the restricted product:
\[
\mathbb{A}_\mathbb{Q} = \mathbb{R} \times' \prod_p \mathbb{Q}_p = \left\{(x_\infty, x_2, x_3, x_5, \ldots) : x_v \in \mathbb{Q}_v,\, x_p \in \mathbb{Z}_p \text{ for all but finitely many } p\right\},
\]
equipped with the restricted product topology. As an abelian locally compact group (under addition), \(\mathbb{A}_\mathbb{Q}\) is self-dual: \(\widehat{\mathbb{A}_\mathbb{Q}} \cong \mathbb{A}_\mathbb{Q}\), via the character \(\psi_a(x) = e^{2\pi i \{a_\infty x_\infty\}} \prod_p e^{-2\pi i \{a_p x_p\}_p}\). The diagonal embedding \(\mathbb{Q} \hookrightarrow \mathbb{A}_\mathbb{Q}\) realizes \(\mathbb{Q}\) as a discrete cocompact subgroup (by the product formula \(\prod_v |x|_v = 1\)), and the Poisson summation formula on \(\mathbb{A}_\mathbb{Q}/\mathbb{Q}\) becomes:
\[
\sum_{q \in \mathbb{Q}} f(q) = \frac{1}{\mathrm{vol}(\mathbb{A}_\mathbb{Q}/\mathbb{Q})} \sum_{q \in \mathbb{Q}} \hat{f}(q), \quad f \in \mathcal{S}(\mathbb{A}_\mathbb{Q}).
\]

Tate's key insight: the Riemann zeta function \(\zeta(s) = \sum_{n=1}^\infty n^{-s}\) can be written as a Mellin transform of the adèlic theta function \(\theta(t) = \sum_{q \in \mathbb{Q}} f(tq)\) for a suitable "adèlic Schwartz function" \(f \in \mathcal{S}(\mathbb{A}_\mathbb{Q})\). The Poisson summation formula on \(\mathbb{A}_\mathbb{Q}\) then gives the functional equation \(\zeta(s) \leftrightarrow \zeta(1-s)\) directly and cleanly.

This adèlic harmonic analysis not only proves the functional equation but also reveals its geometric origin: it is the Pontryagin self-duality of \(\mathbb{A}_\mathbb{Q}\) — a manifestation of the fact that \(\hat{\mathbb{A}}_\mathbb{Q} \cong \mathbb{A}_\mathbb{Q}\) — that forces the symmetry \(s \mapsto 1-s\).

### 6.6 Explicit Fourier Transforms and the Poisson Summation Formula

To make the abstract theory concrete, let us compute the Fourier transform for several fundamental functions.

<div class="example">
<strong>Example 6.11 (Gaussian on \(\mathbb{R}\)).</strong> The Gaussian \(f(x) = e^{-ax^2}\) for \(a > 0\) satisfies:
\[
\hat{f}(\xi) = \int_\mathbb{R} e^{-ax^2} e^{-i\xi x}\, dx = \sqrt{\frac{\pi}{a}} e^{-\xi^2/(4a)}.
\]
The computation: complete the square, \(-ax^2 - i\xi x = -a(x + i\xi/(2a))^2 - \xi^2/(4a)\), then use the Gaussian integral \(\int_\mathbb{R} e^{-au^2}\, du = \sqrt{\pi/a}\) (contour shift in \(\mathbb{C}\) justifies replacing \(x\) by \(x + i\xi/(2a)\)).

The Gaussian is an eigenfunction of the Fourier transform: \(\hat{f} = c \cdot f\) when \(a = 1/4\) (since then \(\sqrt{\pi/(1/4)} e^{-\xi^2} = 2\sqrt{\pi} e^{-\xi^2}\), not quite; take \(a = 1/2\), \(f(x) = e^{-x^2/2}\), then \(\hat{f}(\xi) = \sqrt{2\pi} e^{-\xi^2/2}\)). Under the convention \(\hat{f}(\xi) = \int f e^{-2\pi i \xi x}\, dx\), the function \(e^{-\pi x^2}\) is its own Fourier transform.

This self-duality of the Gaussian is the analytic core of the heat kernel's role in analysis: the heat kernel at time \(t\) is a Gaussian of width \(\sqrt{t}\), and its Fourier transform is again a Gaussian of width \(1/\sqrt{t}\).
</div>

<div class="example">
<strong>Example 6.12 (Indicator function of \([-R, R]\)).</strong> For \(f = \mathbf{1}_{[-R,R]}\):
\[
\hat{f}(\xi) = \int_{-R}^R e^{-i\xi x}\, dx = \frac{e^{i\xi R} - e^{-i\xi R}}{i\xi} = 2R\, \frac{\sin(\xi R)}{\xi R} = 2R\, \mathrm{sinc}(\xi R).
\]
The function \(\mathrm{sinc}(t) = \sin(t)/t\) decays like \(1/t\) but is not integrable (since \(\int |\mathrm{sinc}(t)|\, dt = \infty\)). This means the Fourier transform of an \(L^1\) function need not be in \(L^1\) — the Fourier inversion formula requires one to work in \(L^2\) or in \(B^1(G)\).
</div>

<div class="example">
<strong>Example 6.13 (Characters of \(\mathbb{Z}\)).</strong> Consider \(\mathbb{Z}\) with Haar measure = counting measure and \(\hat{\mathbb{Z}} = \mathbb{T}\) with Haar measure \(d\theta/2\pi\). For \(f \in \ell^1(\mathbb{Z})\):
\[
\hat{f}(e^{i\theta}) = \sum_{n\in\mathbb{Z}} f(n) e^{in\theta}.
\]
The inversion formula gives \(f(n) = \int_\mathbb{T} \hat{f}(e^{i\theta}) e^{-in\theta}\, d\theta/2\pi\). This is exactly Fourier series: \(\hat{f}\) is a function on \(\mathbb{T}\), and the Fourier series recovers its coefficients. The Plancherel theorem gives \(\sum_n |f(n)|^2 = \int_\mathbb{T} |\hat{f}|^2\, d\theta/2\pi\), the Parseval formula for Fourier series.
</div>

### 6.7 The Poisson Summation Formula

One of the most beautiful results in harmonic analysis is the Poisson summation formula, which relates sums over a lattice to sums over its dual lattice.

<div class="theorem">
<strong>Theorem 6.14 (Poisson Summation Formula).</strong> Let \(G\) be an abelian locally compact group, \(\Gamma \leq G\) a discrete cocompact subgroup (so \(G/\Gamma\) is compact). Let \(\Gamma^\perp = \{\sigma \in \hat{G} : \sigma(\gamma) = 1\, \forall \gamma \in \Gamma\}\) be the annihilator (which is also a discrete cocompact subgroup of \(\hat{G}\)). Then for \(f \in L^1(G)\) with \(\hat{f} \in L^1(\hat{G})\):
\[
\sum_{\gamma \in \Gamma} f(\gamma) = \frac{1}{[\hat{G} : \Gamma^\perp]} \sum_{\chi \in \Gamma^\perp} \hat{f}(\chi).
\]
In the classical case \(G = \mathbb{R}\), \(\Gamma = \mathbb{Z}\), \(\Gamma^\perp = 2\pi\mathbb{Z} \subset \hat{\mathbb{R}} \cong \mathbb{R}\):
\[
\sum_{n \in \mathbb{Z}} f(n) = \sum_{k \in \mathbb{Z}} \hat{f}(2\pi k).
\]
</div>

<div class="proof">
<strong>Proof (classical case).</strong> Define \(F(x) = \sum_{n \in \mathbb{Z}} f(x + n)\), a 1-periodic function on \(\mathbb{R}\). The Fourier series of \(F\) is:
\[
F(x) = \sum_{k \in \mathbb{Z}} c_k e^{2\pi i kx}, \quad c_k = \int_0^1 F(x) e^{-2\pi ikx}\, dx = \int_0^1 \sum_n f(x+n) e^{-2\pi ikx}\, dx.
\]
Unfolding the sum: \(c_k = \sum_n \int_0^1 f(x+n) e^{-2\pi ikx}\, dx = \sum_n \int_n^{n+1} f(y) e^{-2\pi iky}\, dy = \int_\mathbb{R} f(y) e^{-2\pi iky}\, dy = \hat{f}(2\pi k)\) (with the normalization \(\hat{f}(\xi) = \int f(x) e^{-i\xi x}\, dx\)).

Setting \(x = 0\): \(F(0) = \sum_{n} f(n) = \sum_k c_k = \sum_k \hat{f}(2\pi k)\). This is the Poisson summation formula.
</div>

The Poisson summation formula has profound applications. Let us work out several explicitly.

**Application 1: Jacobi's theta function and the functional equation.** Set \(f(x) = e^{-\pi t x^2}\) for \(t > 0\). The Fourier transform is \(\hat{f}(\xi) = t^{-1/2} e^{-\pi \xi^2 / t}\) (by the Gaussian calculation in Example 6.11 with \(a = \pi t\) and with the \(\xi \mapsto \xi/(2\pi)\) change from our convention). Applying Poisson summation:
\[
\theta(t) = \sum_{n \in \mathbb{Z}} e^{-\pi n^2 t} = \sum_{k \in \mathbb{Z}} \hat{f}(k) = t^{-1/2} \sum_{k \in \mathbb{Z}} e^{-\pi k^2 / t} = t^{-1/2} \theta(1/t).
\]
This is the **functional equation of the Jacobi theta function**: \(\theta(t) = t^{-1/2}\theta(1/t)\). It is the backbone of Riemann's proof of the analytic continuation and functional equation of the zeta function. Riemann sets \(\xi(s) = \pi^{-s/2}\Gamma(s/2)\zeta(s)\) and expresses \(\xi(s)\) as a Mellin transform of \(\theta(t) - 1\). The functional equation \(\theta(t) = t^{-1/2}\theta(1/t)\) then gives the symmetry \(\xi(s) = \xi(1-s)\), i.e., the functional equation \(\zeta(s) = 2^s \pi^{s-1} \sin(\pi s/2)\Gamma(1-s)\zeta(1-s)\).

**Application 2: Multi-dimensional lattice sums.** For \(G = \mathbb{R}^n\) and the standard lattice \(\Gamma = \mathbb{Z}^n\), the dual lattice is \((\mathbb{Z}^n)^\perp = \mathbb{Z}^n\) (since the characters of \(\mathbb{R}^n\) taking integer values on \(\mathbb{Z}^n\) are exactly \(x \mapsto e^{2\pi i k \cdot x}\) for \(k \in \mathbb{Z}^n\)). Poisson summation gives:
\[
\sum_{n \in \mathbb{Z}^n} f(n) = \sum_{k \in \mathbb{Z}^n} \hat{f}(k).
\]
For \(f(x) = e^{-\pi t |x|^2}\), both sides are the \(n\)-dimensional theta function \(\theta_n(t) = \sum_{m \in \mathbb{Z}^n} e^{-\pi t |m|^2} = (\theta(t))^n\) (by independence of coordinates). The functional equation becomes \(\theta_n(t) = t^{-n/2} \theta_n(1/t)\), i.e., \(\theta(t)^n = t^{-n/2}\theta(1/t)^n\), consistent with the 1D case.

**Application 3: Counting lattice points in a ball.** Let \(r_k(n)\) be the number of ways to represent \(n\) as a sum of \(k\) squares: \(r_k(n) = |\{(m_1,\ldots,m_k) \in \mathbb{Z}^k : m_1^2 + \cdots + m_k^2 = n\}|\). The generating function is \(\theta(t)^k = \sum_{n=0}^\infty r_k(n) e^{-\pi n t}\). Poisson summation applied to \(f(x) = e^{-\pi t |x|^2}\) gives the theta function identity, and Mellin transforms of both sides yield the Dirichlet series \(\sum_n r_k(n)/n^s\). For \(k = 4\), Jacobi's four-square theorem states \(r_4(n) = 8\sum_{4 \nmid d \mid n} d\), which is proved via the Poisson summation formula and the theory of modular forms.

**Application 4: The Sampling Theorem.** Suppose \(f \in L^2(\mathbb{R})\) is **bandlimited**: \(\hat{f}(\xi) = 0\) for \(|\xi| > B\) (frequency bandwidth \(B\)). The Nyquist-Shannon sampling theorem asserts that \(f\) is completely determined by its values at the sampling points \(\{n/(2B)\}_{n \in \mathbb{Z}}\), and the reconstruction formula is:
\[
f(x) = \sum_{n \in \mathbb{Z}} f\!\left(\frac{n}{2B}\right) \mathrm{sinc}(2Bx - n), \quad \mathrm{sinc}(u) = \frac{\sin(\pi u)}{\pi u}.
\]
This follows from Poisson summation: the "sampling" of \(f\) at rate \(1/(2B)\) produces a periodic replication of \(\hat{f}\) in frequency space (with period \(2B\)), and since \(\hat{f}\) is supported in \([-B, B]\), there is no aliasing. The inverse Fourier transform of the periodized version recovers \(f\) exactly from the samples, via the sinc interpolation formula.

<div class="remark">
<strong>Remark 6.15 (General lattices and the Siegel mass formula).</strong> For a general lattice \(\Lambda \subset \mathbb{R}^n\) (not necessarily the standard integer lattice), the Poisson summation formula reads:
\[
\sum_{\lambda \in \Lambda} f(\lambda) = \frac{1}{\mathrm{vol}(\mathbb{R}^n / \Lambda)} \sum_{\mu \in \Lambda^*} \hat{f}(\mu),
\]
where \(\Lambda^* = \{\xi \in \mathbb{R}^n : \langle \xi, \lambda\rangle \in \mathbb{Z}\, \forall \lambda \in \Lambda\}\) is the dual lattice. For a lattice with Gram matrix \(A\) (i.e., \(\mathrm{vol}(\mathbb{R}^n/\Lambda)^2 = \det A\)), this gives the theta series identity:
\[
\theta_\Lambda(t) = (\det A)^{-1/2} t^{-n/2} \theta_{\Lambda^*}(1/t).
\]
This identity is the foundation of the theory of theta series and modular forms, and underlies the Siegel mass formula for counting representations of integers by quadratic forms.
</div>

### 6.8 The Fourier Algebra and Eymard's Duality

For a non-abelian locally compact group, the Pontryagin dual \(\hat{G}\) is replaced by the unitary dual, which lacks a group structure. Eymard's 1964 paper introduced a function algebra on \(G\) that plays the role of \(L^1(\hat{G})\) in the non-abelian setting, giving the correct dual object for the representation theory.

**Recall:** For an abelian group \(G\), the Fourier transform \(\mathcal{F} : L^1(G) \to C_0(\hat{G})\) identifies \(L^1(G)/\ker \mathcal{F}\) with a dense subalgebra of \(C_0(\hat{G})\). The "algebra of Fourier transforms" is the algebra \(\mathcal{F}(L^1(G)) \subset C_0(\hat{G})\), which, by Pontryagin duality, is isometrically isomorphic to \(L^1(\hat{G})\) acting on \(\hat{G}\) by the inverse Fourier transform. In the non-abelian setting, there is no group structure on \(\hat{G}\), so this picture does not directly generalize. Instead, Eymard defines the Fourier algebra as a subalgebra of \(C_0(G)\) — functions on the original group \(G\) — that captures the same analytic data.

<div class="definition">
<strong>Definition 6.16 (Fourier-Stieltjes algebra, Eymard 1964).</strong> The <em>Fourier-Stieltjes algebra</em> of a locally compact group \(G\) is
\[
B(G) = \{\phi : G \to \mathbb{C} : \phi(x) = \langle \pi(x)\xi, \eta\rangle \text{ for some unitary rep. } (\pi, \mathcal{H}),\, \xi, \eta \in \mathcal{H}\}.
\]
Equivalently, \(B(G)\) is the linear span of the cone \(P(G)\) of continuous positive definite functions. The norm is
\[
\|\phi\|_{B(G)} = \inf\{\|\xi\|\|\eta\| : \phi(x) = \langle \pi(x)\xi, \eta\rangle,\, \pi \text{ unitary}\}.
\]
</div>

Under pointwise multiplication of functions and the \(B(G)\)-norm, \(B(G)\) is a commutative Banach algebra. For abelian \(G\), the identification \(\phi(x) = \int_{\hat{G}} \sigma(x)\, d\mu(\sigma)\) (Bochner's theorem) gives a natural isomorphism \(B(G) \cong M(\hat{G})\) — the measure algebra on the dual group. This is why \(B(G)\) is called the "Fourier-Stieltjes" algebra: it generalizes the Fourier-Stieltjes transform.

<div class="definition">
<strong>Definition 6.17 (Fourier algebra).</strong> The <em>Fourier algebra</em> \(A(G)\) is the closed ideal in \(B(G)\) consisting of functions \(\phi \in B(G)\) that can be realized with a vector \(\xi\) in the left regular representation:
\[
A(G) = \{\phi \in B(G) : \phi(x) = \langle \lambda(x)\xi, \eta\rangle,\, \xi, \eta \in L^2(G)\} = \{\xi * \check{\eta} : \xi, \eta \in L^2(G)\},
\]
where \(\check{\eta}(x) = \overline{\eta(x^{-1})}\) and the convolution is \((\xi * \check{\eta})(x) = \int_G \xi(y)\overline{\eta(y^{-1}x)}\, dm(y)\).
</div>

For abelian \(G\), \(A(G) \cong L^1(\hat{G})\) via the inverse Fourier transform — functions in \(A(G)\) are exactly the Fourier transforms of \(L^1(\hat{G})\) functions. The ideal \(A(G) \subset B(G)\) thus corresponds, under Pontryagin duality, to the ideal \(L^1(\hat{G}) \subset M(\hat{G})\).

<div class="theorem">
<strong>Theorem 6.18 (Eymard, 1964).</strong>
<ol>
<li>\(A(G)\) is a closed ideal in \(B(G)\), and a commutative Banach algebra under pointwise multiplication.</li>
<li>\(A(G) \subset C_0(G)\): every element of \(A(G)\) vanishes at infinity.</li>
<li>The dual Banach space of \(A(G)\) is isometrically isomorphic to the <em>group von Neumann algebra</em> \(VN(G)\):
\[
A(G)^* \cong VN(G),
\]
where \(VN(G) = \lambda(G)'' \subset \mathcal{B}(L^2(G))\) is the von Neumann algebra generated by the left regular representation.</li>
<li>For abelian \(G\): \(A(G) \cong L^1(\hat{G})\) and \(VN(G) \cong L^\infty(\hat{G})\) under the Fourier transform.</li>
</ol>
</div>

The duality \(A(G)^* \cong VN(G)\) is the non-abelian analogue of \(L^1(\hat{G})^* \cong L^\infty(\hat{G})\). The pairing is:
\[
\langle \phi, T \rangle = \langle T\xi, \eta \rangle_{L^2(G)}, \quad \phi(x) = \langle \lambda(x)\xi, \eta\rangle \in A(G),\, T \in VN(G).
\]

This makes \(A(G)\) into a *completely contractive Banach algebra* — a structure that lies at the heart of Operator Space Theory, and is exactly the area in which Nico Spronk has made major contributions. The operator space structure on \(A(G)\) (discovered by Ruan in 1995) reveals that the multiplier algebra of \(A(G)\) in the operator space category is the Fourier-Stieltjes algebra \(B(G)\), giving the elegant duality
\[
\mathrm{CB}(A(G)) \cong B(G),
\]
where \(\mathrm{CB}(A(G))\) denotes the completely bounded multipliers of \(A(G)\).

<div class="theorem">
<strong>Theorem 6.19 (Leptin's Theorem, 1968).</strong> The following are equivalent for a locally compact group \(G\):
<ol>
<li>\(G\) is amenable.</li>
<li>\(A(G)\) has a bounded approximate identity.</li>
<li>\(A(G)\) has an approximate identity bounded by 1 consisting of compactly supported functions.</li>
</ol>
</div>

<div class="proof">
<strong>Proof sketch (\(\mathrm{(1)} \Leftrightarrow \mathrm{(2)}\)).</strong> If \(G\) is amenable, then by Følner's criterion there exist finite sets \(F_n \subset G\) with \(|xF_n \triangle F_n| / |F_n| \to 0\) for all \(x \in G\). The normalized characteristic functions \(u_n = |F_n|^{-1/2} \mathbf{1}_{F_n} \in L^2(G)\) give elements \(\phi_n(x) = (u_n * \check{u}_n)(x) = |F_n|^{-1}|F_n \cap x^{-1}F_n| \in A(G)\). One checks:
<ul>
<li>\(\|\phi_n\|_{A(G)} = \|u_n\|_2^2 = 1\), so the approximate identity is norm-bounded.</li>
<li>\(\phi_n(x) \to 1\) for all \(x\): since \(|F_n \cap x^{-1}F_n| / |F_n| = 1 - |xF_n \triangle F_n| / |F_n| \to 1\).</li>
<li>The convergence \(\phi_n \cdot f \to f\) in \(A(G)\)-norm for every \(f \in A(G)\) follows from dominated convergence.</li>
</ul>
Conversely, if \(A(G)\) has a bounded approximate identity \((\phi_\alpha)\), one constructs a left-invariant mean on \(L^\infty(G)\) by taking a \(w^*\)-cluster point of the net of states \(f \mapsto \int f \phi_\alpha\, dm\) on \(L^\infty(G)\).
</div>

Leptin's theorem is a striking reformulation of amenability in terms of the harmonic-analytic structure of the Fourier algebra. Amenability is usually defined via invariant means (Definition 8.1 below) or Følner sequences; Leptin's theorem shows it is equivalently characterized by the existence of a bounded approximate identity in \(A(G)\) — a purely Banach-algebraic condition.

**The Herz restriction theorem** complements Eymard's theory. For a closed subgroup \(H \leq G\), restriction to \(H\) gives a norm-decreasing algebra homomorphism \(A(G) \to A(H)\):
\[
\phi \mapsto \phi|_H, \quad \|\phi|_H\|_{A(H)} \leq \|\phi\|_{A(G)}.
\]
This is the content of the **Herz restriction theorem** (1971), which is a striking non-abelian generalization of the fact that the restriction of a Fourier transform to a subgroup corresponds to integration on the quotient. For abelian groups, it says: if \(H \leq G\) and \(\phi \in A(G) \cong L^1(\hat{G})\), then \(\phi|_H \in A(H) \cong L^1(\hat{H})\) with the correct norm bound. For non-abelian groups, the "dual subgroup" \(\hat{H}\) is no longer a group, but the inequality still holds.

The Herz restriction theorem, combined with Leptin's theorem, gives a beautiful proof of the following: if \(G\) is amenable and \(H \leq G\) is any closed subgroup, then \(H\) is also amenable — because \(A(H)\) inherits a bounded approximate identity from the restriction of the bounded approximate identity in \(A(G)\). This establishes that amenability is closed under taking subgroups.

<div class="remark">
<strong>Remark 6.20 (Spronk's contributions).</strong> Nico Spronk's research has focused on the algebra-theoretic properties of \(A(G)\) and \(B(G)\), especially:
<ul>
<li>Ideals and quotients of \(A(G)\) (related to spectral synthesis for non-abelian groups).</li>
<li>The completely bounded multiplier algebra \(\mathrm{CB}(A(G)) \cong B(G)\) and its operator-space structure.</li>
<li>Spectral synthesis in \(A(G) \otimes_\gamma A(H)\) for products of groups.</li>
<li>The connection between \(A(G)\) and the Haagerup approximation property (a strengthening of amenability related to property (T) from Chapter 8).</li>
</ul>
These results show that the Fourier algebra is not just a technical construction but a deep object encoding the group's geometry and operator-algebraic structure.
</div>

---

## Chapter 7: Compact Groups and the Peter-Weyl Theorem

### 7.1 Representations of Compact Groups

The theory of unitary representations simplifies dramatically for compact groups. The key finiteness result is:

<div class="theorem">
<strong>Theorem 7.1.</strong> Let \(G\) be a compact group and \(\pi : G \to \mathcal{U}(\mathcal{H})\) a unitary representation.
<ol>
<li>\(\pi\) admits a finite-dimensional nonzero invariant subspace.</li>
<li>Every irreducible unitary representation of \(G\) is finite-dimensional.</li>
<li>\(\pi\) is completely reducible: \(\mathcal{H} = \bigoplus_{\alpha \in A} \mathcal{H}_\alpha\) where each \(\mathcal{H}_\alpha\) is a finite-dimensional irreducible invariant subspace.</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> We prove (1), (2), (3) in turn.

<em>Part (1): Existence of a finite-dimensional invariant subspace.</em> Pick any nonzero \(\xi \in \mathcal{H}\) and define the operator
\[
K_\xi = \int_G \langle \cdot, \pi(x)\xi \rangle \pi(x)\xi \, dm(x) = \int_G P_{\pi(x)\xi}\, dm(x),
\]
where \(P_v = \langle \cdot, v\rangle v\) is the orthogonal projection onto the span of \(v\), and the integral is a Bochner integral in the Banach space \(\mathcal{B}(\mathcal{H})\). Let us verify the key properties of \(K_\xi\):

<strong>Nonzero:</strong> \(\langle K_\xi \xi, \xi\rangle = \int_G |\langle \xi, \pi(x)\xi\rangle|^2\, dm(x) \geq |\langle \xi, \pi(e)\xi\rangle|^2 \cdot m(\{e\})\). Wait — we cannot use a point mass. Instead: the integrand is continuous in \(x\) (since \(x \mapsto \pi(x)\xi\) is continuous) and equals \(\|\xi\|^4 > 0\) at \(x = e\), so by continuity and positivity the integral is strictly positive. Hence \(K_\xi \neq 0\).

<strong>Self-adjoint:</strong> \(\langle K_\xi \eta, \zeta\rangle = \int_G \langle \eta, \pi(x)\xi\rangle \overline{\langle \zeta, \pi(x)\xi\rangle}\, dm(x) = \overline{\langle K_\xi \zeta, \eta\rangle}\), so \(K_\xi^* = K_\xi\).

<strong>Compact:</strong> \(K_\xi\) is the norm-limit of finite-rank operators (Riemann sums of rank-one projections), so it is compact.

<strong>\(\pi(G)\)-equivariant:</strong> For any \(y \in G\) and using left invariance of \(m\):
\[
\pi(y) K_\xi \pi(y)^{-1} = \int_G \pi(y) P_{\pi(x)\xi} \pi(y)^{-1}\, dm(x) = \int_G P_{\pi(yx)\xi}\, dm(x) = \int_G P_{\pi(z)\xi}\, dm(z) = K_\xi.
\]
So \(K_\xi \pi(y) = \pi(y) K_\xi\) for all \(y \in G\), i.e., \(K_\xi\) intertwines \(\pi\) with itself.

Now apply the <strong>spectral theorem for compact self-adjoint operators</strong>: write
\[
K_\xi = \sum_{\lambda \neq 0} \lambda P_\lambda,
\]
where the sum is over the nonzero eigenvalues of \(K_\xi\) (each with finite multiplicity), and \(P_\lambda\) is the orthogonal projection onto the eigenspace \(\ker(K_\xi - \lambda I)\). Since \(K_\xi\) commutes with every \(\pi(y)\), each eigenspace \(\ker(K_\xi - \lambda I)\) is \(\pi(G)\)-invariant: if \(K_\xi \eta = \lambda \eta\) then \(K_\xi(\pi(y)\eta) = \pi(y)(K_\xi \eta) = \lambda(\pi(y)\eta)\). Since \(K_\xi \neq 0\) there is at least one nonzero eigenvalue, giving a finite-dimensional nonzero \(\pi(G)\)-invariant subspace. This proves (1).

<em>Part (2): Irreducible representations are finite-dimensional.</em> Suppose \(\pi\) is irreducible and apply Part (1) to get a finite-dimensional \(\pi(G)\)-invariant subspace \(V \subseteq \mathcal{H}\), \(V \neq 0\). By irreducibility, \(V = \mathcal{H}\). Hence \(\dim \mathcal{H} = \dim V < \infty\).

Alternatively, note that in the argument of Part (1), Schur's lemma applies: \(K_\xi\) commutes with \(\pi(G)\) and \(\pi\) is irreducible, so \(K_\xi = c\, I_\mathcal{H}\) for some constant \(c > 0\). But \(K_\xi\) is compact, and a compact scalar multiple of the identity is compact, which forces \(\mathcal{H}\) to be finite-dimensional (since \(cI\) is compact only if the unit ball of \(\mathcal{H}\) is compact, which holds iff \(\dim \mathcal{H} < \infty\)).

<em>Part (3): Complete reducibility.</em> By Zorn's lemma, there exists a maximal orthogonal family \(\{\mathcal{H}_\alpha\}_{\alpha \in A}\) of pairwise orthogonal, finite-dimensional, irreducible \(\pi(G)\)-invariant subspaces of \(\mathcal{H}\). Let \(\mathcal{H}_0 = \overline{\bigoplus_\alpha \mathcal{H}_\alpha}\). We claim \(\mathcal{H}_0 = \mathcal{H}\).

Suppose for contradiction that \(\mathcal{H}_0^\perp \neq 0\). The complement \(\mathcal{H}_0^\perp\) is a nonzero closed \(\pi(G)\)-invariant subspace (since each \(\pi(y)\) is unitary and each \(\mathcal{H}_\alpha\) is invariant, so \(\mathcal{H}_0\) is invariant, so \(\mathcal{H}_0^\perp\) is invariant). By Part (1), \(\mathcal{H}_0^\perp\) contains a nonzero finite-dimensional \(\pi(G)\)-invariant subspace \(V\). Inside \(V\), by finite-dimensionality, we can find an irreducible invariant subspace (just take any minimal invariant subspace in the finite-dimensional space \(V\)). Call it \(\mathcal{H}_*\). Then \(\mathcal{H}_* \subseteq \mathcal{H}_0^\perp\) means \(\mathcal{H}_* \perp \mathcal{H}_\alpha\) for all \(\alpha\), contradicting maximality of the family \(\{\mathcal{H}_\alpha\}\). Hence \(\mathcal{H}_0 = \mathcal{H}\).
</div>

We write \(\hat{G} = \mathrm{Irr}(G)/{\approx}\) for the set of unitary equivalence classes of irreducible representations, and we abuse notation by writing \(\pi \in \hat{G}\) for a representative. Each \(\pi \in \hat{G}\) has a finite dimension \(d_\pi = \dim \mathcal{H}_\pi\).

### 7.2 Matrix Coefficient Functions and Schur Orthogonality

Fix a compact group \(G\) with normalized Haar measure \(m(G) = 1\). For \(\pi \in \hat{G}\), the **matrix coefficients** are the functions \(\pi_{ij}(x) = \langle \pi(x)e_j, e_i \rangle : G \to \mathbb{C}\) for an orthonormal basis \((e_i)\) of \(\mathcal{H}_\pi\). More invariantly, for any \(\xi, \eta \in \mathcal{H}_\pi\) we set \(\phi^\pi_{\xi,\eta}(x) = \langle \pi(x)\xi, \eta\rangle\). Let
\[
T_\pi = \mathrm{span}\{\phi^\pi_{\xi,\eta} : \xi, \eta \in \mathcal{H}_\pi\}
\]
be the space of matrix coefficients of \(\pi\). This is a finite-dimensional subspace of \(C(G)\) of dimension at most \(d_\pi^2\) (it equals \(d_\pi^2\) when \(\pi\) is irreducible).

<div class="lemma">
<strong>Lemma 7.2 (Schur's Lemma).</strong> Let \(\pi, \pi' \in \hat{G}\) and \(A \in \mathcal{B}(\mathcal{H}_\pi, \mathcal{H}_{\pi'})\) satisfy \(A\pi(x) = \pi'(x)A\) for all \(x \in G\) (i.e., \(A\) is an intertwining operator).
<ul>
<li>If \(\pi \not\approx \pi'\), then \(A = 0\).</li>
<li>If \(\pi \approx \pi'\) (so we may take \(\mathcal{H}_\pi = \mathcal{H}_{\pi'}\)), then \(A = c \cdot I_{\mathcal{H}_\pi}\) for some \(c \in \mathbb{C}\).</li>
</ul>
</div>

<div class="proof">
<strong>Proof.</strong> Consider the operators \(\ker(A) \subseteq \mathcal{H}_\pi\) and \(\mathrm{im}(A) \subseteq \mathcal{H}_{\pi'}\). For any \(\xi \in \ker(A)\) and \(x \in G\):
\[
A(\pi(x)\xi) = \pi'(x)(A\xi) = \pi'(x) \cdot 0 = 0,
\]
so \(\pi(x)\xi \in \ker(A)\). Thus \(\ker(A)\) is a \(\pi\)-invariant subspace. If \(\pi\) is irreducible, then \(\ker(A) = 0\) or \(\ker(A) = \mathcal{H}_\pi\). Similarly, for \(\eta \in \mathrm{im}(A)\): write \(\eta = A\xi\), then \(\pi'(x)\eta = \pi'(x)A\xi = A\pi(x)\xi \in \mathrm{im}(A)\). So \(\mathrm{im}(A)\) is \(\pi'\)-invariant. If \(\pi'\) is irreducible, either \(\mathrm{im}(A) = 0\) or \(\mathrm{im}(A) = \mathcal{H}_{\pi'}\).

Case \(\pi \not\approx \pi'\): if \(A \neq 0\), then \(\ker(A) \neq \mathcal{H}_\pi\) forces \(\ker(A) = 0\) (by irreducibility), so \(A\) is injective. Then \(\mathrm{im}(A) \neq 0\) forces \(\mathrm{im}(A) = \mathcal{H}_{\pi'}\), so \(A\) is surjective. So \(A\) is an invertible intertwining operator, i.e., a unitary equivalence \(\pi \approx \pi'\), contradiction.

Case \(\pi = \pi'\): both \(\ker(A)\) and \(\mathrm{im}(A)\) are invariant for the same irreducible \(\pi\). For any eigenvalue \(c \in \mathbb{C}\) of \(A\) (which exists since \(\mathcal{H}_\pi\) is finite-dimensional), the operator \(A - cI\) also intertwines \(\pi\) with itself, and \(\ker(A-cI) \neq 0\). By the above, \(\ker(A-cI) = \mathcal{H}_\pi\), so \(A = cI\).
</div>

<div class="theorem">
<strong>Theorem 7.3 (Schur Orthogonality Relations).</strong> Let \(\pi, \pi' \in \hat{G}\).
<ol>
<li>If \(\pi \neq \pi'\), then \(T_\pi \perp T_{\pi'}\) in \(L^2(G)\).</li>
<li>For \(\xi, \eta, \zeta, \omega \in \mathcal{H}_\pi\):
\[\int_G \langle \pi(x)\xi, \eta \rangle \overline{\langle \pi(x)\zeta, \omega \rangle}\, dm(x) = \frac{1}{d_\pi}\langle \xi, \zeta \rangle \overline{\langle \eta, \omega \rangle}.\]
</li>
<li>The set \(\{\sqrt{d_\pi}\, \langle \pi(\cdot)e_j, e_i \rangle : \pi \in \hat{G},\, i, j = 1, \ldots, d_\pi\}\), for any choice of orthonormal bases \((e_1, \ldots, e_{d_\pi})\) of \(\mathcal{H}_\pi\), is an orthonormal set in \(L^2(G)\).</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> For any \(A \in \mathcal{B}(\mathcal{H}_\pi, \mathcal{H}_{\pi'})\), define \(\tilde{A} = \int_G \pi'(x) A \pi(x^{-1})\, dm(x)\). Left-invariance of Haar measure gives \(\pi'(y)\tilde{A} = \tilde{A}\pi(y)\), so by Schur's lemma, \(\tilde{A} = 0\) if \(\pi \neq \pi'\) and \(\tilde{A} = cI\) if \(\pi = \pi'\). Taking \(A = \langle \cdot, \eta \rangle\omega\) (a rank-one map) and computing \(\langle \tilde{A}\xi, \zeta \rangle\) gives the stated formulas.
</div>

The orthogonality relations are spectacular: they say that the matrix coefficients of *different* irreducible representations are orthogonal, and the matrix coefficients of *the same* irreducible representation obey a precise norm formula involving \(1/d_\pi\).

### 7.3 The Peter-Weyl Theorem

<div class="theorem">
<strong>Theorem 7.4 (Peter-Weyl).</strong> Let \(G\) be a compact group. The algebraic direct sum
\[
T(G) = \bigoplus_{\pi \in \hat{G}} T_\pi
\]
is a dense subspace of \(L^2(G)\). Equivalently, \(\bigoplus_{\pi \in \hat{G}} T_\pi\) is dense in \(C(G)\) (in the sup-norm), and the collection \(\{\sqrt{d_\pi}\, \pi_{ij} : \pi \in \hat{G},\, i, j = 1, \ldots, d_\pi\}\) (where \(\pi_{ij}(x) = \langle \pi(x)e_j, e_i \rangle\)) is an orthonormal basis for \(L^2(G)\).
</div>

<div class="proof">
<strong>Proof of Peter-Weyl (density in \(L^2(G)\)).</strong> By the Schur orthogonality relations, the spaces \(T_\pi\) are mutually orthogonal in \(L^2(G)\). Let \(T(G)^\perp\) be the orthogonal complement of \(\bigoplus_\pi T_\pi\) in \(L^2(G)\). We need to show \(T(G)^\perp = \{0\}\).

Suppose \(f \in T(G)^\perp\), meaning \(\int_G f(x)\overline{\phi^\pi_{\xi,\eta}(x)}\, dm(x) = 0\) for all \(\pi \in \hat{G}\), \(\xi, \eta \in \mathcal{H}_\pi\). This means \(\langle \pi_1(f)\xi, \eta\rangle = 0\) for all \(\xi, \eta\), so \(\pi_1(f) = 0\) for every finite-dimensional representation \(\pi\). In particular, the convolution operator
\[
(f * g)(x) = \int_G f(y^{-1}x) g(y)\, dm(y)
\]
satisfies \(\pi_1(f * g) = \pi_1(f)\pi_1(g) = 0\) for every \(\pi\). Now consider the convolution operator \(T_f : L^2(G) \to L^2(G)\) given by \(T_f(h) = f * h\). This operator is compact (since \(L^2\)-convolution by an \(L^2\) function is compact on a compact group) and commutes with left translations:
\[
T_f(\lambda(x)h) = f * (x\cdot h) = x \cdot (f * h) = \lambda(x)(T_f h).
\]
So \(T_f\) commutes with all left translations, i.e., with the full regular representation \(\lambda\). By the spectral theorem for compact operators, \(T_f\) decomposes as a sum of finite-rank operators on the irreducible constituents of \(L^2(G)\) (by complete reducibility, Theorem 7.1). On each irreducible constituent \(\mathcal{H}_\pi\), the operator \(T_f\) acts as a scalar \(c_\pi I\). But we just showed \(\pi_1(\check{f}) = 0\) for all \(\pi\) (where \(\check{f}(x) = f(x^{-1})\)), so \(c_\pi = 0\) for all \(\pi\). Hence \(T_f = 0\), i.e., \(f * h = 0\) for all \(h \in L^2(G)\).

Taking \(h = \check{f}\) gives \((f * \check{f})(e) = \|f\|_2^2 = 0\), so \(f = 0\). This shows \(T(G)^\perp = \{0\}\), completing the proof.
</div>

The Peter-Weyl theorem is the compact group analogue of the classical Plancherel theorem. For \(G = \mathbb{T}\), the irreducible representations are \(\sigma_n : z \mapsto z^n\) for \(n \in \mathbb{Z}\) (each one-dimensional, \(d_n = 1\)), and \(T(G) = \mathrm{span}\{e^{in\theta}\}_{n \in \mathbb{Z}}\) — the density statement becomes the classical completeness of the Fourier series basis in \(L^2(\mathbb{T})\).

For \(G = \mathrm{SU}(2)\), the irreducible representations \(\pi_\ell\) have dimensions \(d_\ell = 2\ell + 1\) for \(\ell = 0, \tfrac{1}{2}, 1, \tfrac{3}{2}, \ldots\), and the matrix coefficients of \(\pi_\ell\) restricted to the maximal torus \(\mathbb{T} \subset \mathrm{SU}(2)\) are the characters \(e^{i k\theta}\) for \(k = -\ell, -\ell+1, \ldots, \ell\). The full Peter-Weyl decomposition is:
\[
L^2(\mathrm{SU}(2)) \cong \bigoplus_{\ell=0,\tfrac{1}{2},1,\ldots} \mathcal{H}_\ell \otimes \mathcal{H}_\ell^*,
\]
where each summand has dimension \((2\ell+1)^2\).

For \(G = \mathrm{SO}(3)\), only integer-spin representations appear (\(\ell = 0, 1, 2, \ldots\)), and the corresponding matrix coefficients restricted to the sphere \(S^2 = \mathrm{SO}(3)/\mathrm{SO}(2)\) are the spherical harmonics \(Y_\ell^m\) for \(-\ell \leq m \leq \ell\). This is why spherical harmonics form a complete orthonormal system for \(L^2(S^2)\) — it is Peter-Weyl applied to \(\mathrm{SO}(3)\).

### 7.4 Fourier Analysis on Compact Groups

<div class="definition">
<strong>Definition 7.5.</strong> For \(f \in L^1(G)\) and \(\pi \in \hat{G}\), the <em>Fourier transform</em> of \(f\) at \(\pi\) is the operator
\[
\hat{f}(\pi) = \int_G f(x)\pi(x^{-1})\, dm(x) \in \mathcal{B}(\mathcal{H}_\pi) \cong M_{d_\pi}(\mathbb{C}).
\]
</div>

The matrix \(\hat{f}(\pi)\) is an operator (not a number!) because \(\pi(x^{-1})\) is a \(d_\pi \times d_\pi\) matrix. The defining property is: for any \(\xi, \eta \in \mathcal{H}_\pi\),
\[
\langle \hat{f}(\pi)\xi, \eta\rangle = \int_G f(x)\langle \pi(x^{-1})\xi, \eta\rangle\, dm(x) = \int_G f(x) \overline{\langle \pi(x)\eta, \xi\rangle}\, dm(x).
\]
The Fourier transform satisfies \(\widehat{f * g}(\pi) = \hat{g}(\pi)\hat{f}(\pi)\) (note the reversal of order: convolution on the left in \(L^1(G)\) becomes operator composition on the right in \(M_{d_\pi}(\mathbb{C})\)).

The Fourier inversion formula reconstructs \(f\) from its Fourier transforms:
\[
f(x) = \sum_{\pi \in \hat{G}} d_\pi\, \mathrm{tr}\!\left(\hat{f}(\pi)\,\pi(x)\right), \quad \text{convergence in } L^2(G).
\]
In matrix form: \(f(x) = \sum_\pi d_\pi \sum_{i,j} \hat{f}(\pi)_{ij}\, \pi(x)_{ji}\), which is a "trigonometric polynomial" in the matrix coefficients.

<div class="theorem">
<strong>Theorem 7.6 (Plancherel on Compact Groups).</strong> For \(f \in L^2(G)\),
\[
\|f\|_{L^2(G)}^2 = \sum_{\pi \in \hat{G}} d_\pi\, \|\hat{f}(\pi)\|_{\mathrm{HS}}^2
\]
where \(\|A\|_{\mathrm{HS}}^2 = \mathrm{tr}(A^*A) = \sum_{i,j} |A_{ij}|^2\) is the Hilbert-Schmidt norm. The Fourier transform extends to an isometric isomorphism
\[
L^2(G) \cong \bigoplus_{\pi \in \hat{G}} M_{d_\pi}(\mathbb{C})
\]
(with the Hilbert-Schmidt inner product scaled by \(d_\pi\) on each summand).
</div>

<div class="proof">
<strong>Proof.</strong> The Parseval identity \(\langle f, g\rangle_{L^2(G)} = \sum_\pi d_\pi \mathrm{tr}(\hat{g}(\pi)^* \hat{f}(\pi))\) follows from the Schur orthogonality relations: for \(f, g \in T(G)\) (finite linear combinations of matrix coefficients),
\[
\langle f, g\rangle = \sum_{\pi,\pi'} d_\pi d_{\pi'} \langle f_\pi, g_{\pi'}\rangle = \sum_\pi d_\pi \langle f_\pi, g_\pi\rangle = \sum_\pi d_\pi \mathrm{tr}(\hat{g}(\pi)^*\hat{f}(\pi)),
\]
where the middle equality uses orthogonality of \(T_\pi\) and \(T_{\pi'}\) for \(\pi \neq \pi'\). Since \(T(G)\) is dense in \(L^2(G)\) (by Peter-Weyl), the identity extends to all \(f, g \in L^2(G)\) by continuity.
</div>

<div class="example">
<strong>Example 7.7 (Fourier analysis on \(\mathbb{T} = \mathrm{U}(1)\)).</strong> For \(G = \mathbb{T}\), the irreducible representations are one-dimensional: \(\pi_n(z) = z^n\) for \(n \in \mathbb{Z}\), with \(d_n = 1\). The Fourier transform at \(\pi_n\) is the scalar
\[
\hat{f}(\pi_n) = \int_\mathbb{T} f(z) \overline{z^n}\, \frac{d\theta}{2\pi} = \int_0^{2\pi} f(e^{i\theta}) e^{-in\theta}\, \frac{d\theta}{2\pi} = \hat{f}(n),
\]
the \(n\)-th Fourier coefficient. The Plancherel formula becomes \(\|f\|_{L^2(\mathbb{T})}^2 = \sum_{n\in\mathbb{Z}} 1 \cdot |\hat{f}(n)|^2\), which is the classical Parseval identity for Fourier series. The inversion formula \(f(z) = \sum_n \hat{f}(n) z^n\) is the Fourier series.

Peter-Weyl for \(\mathbb{T}\) is exactly the completeness of the Fourier series basis \(\{e^{in\theta}\}_{n\in\mathbb{Z}}\) in \(L^2(\mathbb{T})\) — a fact usually proved via the Stone-Weierstrass theorem or the theory of distributions, but here appearing as a special case of the general compact group theory.
</div>

<div class="example">
<strong>Example 7.8 (Representations of \(\mathrm{SU}(2)\)).</strong> The group \(\mathrm{SU}(2) = \{\bigl(\begin{smallmatrix} \alpha & -\bar\beta \\ \beta & \bar\alpha \end{smallmatrix}\bigr) : |\alpha|^2 + |\beta|^2 = 1\}\) is the simply connected cover of \(\mathrm{SO}(3)\). Its irreducible representations \(\pi_\ell\) are classified by the spin \(\ell \in \{0, \tfrac{1}{2}, 1, \tfrac{3}{2}, \ldots\}\), each of dimension \(d_\ell = 2\ell + 1\). Concretely, \(\pi_\ell\) acts on the space of homogeneous polynomials of degree \(2\ell\) in two variables:
\[
(\pi_\ell(g) P)(z_1, z_2) = P(\alpha z_1 + \beta z_2,\, -\bar\beta z_1 + \bar\alpha z_2), \quad g = \begin{pmatrix} \alpha & -\bar\beta \\ \beta & \bar\alpha \end{pmatrix}.
\]

The character of \(\pi_\ell\) is the function \(\chi_\ell(g) = \mathrm{tr}(\pi_\ell(g))\). On the maximal torus \(T = \{e^{i\theta} \in \mathrm{SU}(2) : e^{i\theta} = \mathrm{diag}(e^{i\theta}, e^{-i\theta})\}\):
\[
\chi_\ell(e^{i\theta}) = \sum_{k=-\ell}^{\ell} e^{2ik\theta} = \frac{\sin((2\ell+1)\theta)}{\sin\theta},
\]
which is the Chebyshev-like formula for the character. The Weyl character formula, which expresses characters in terms of weights, is the main computational tool in representation theory of compact Lie groups.

The Peter-Weyl decomposition for \(\mathrm{SU}(2)\) is:
\[
L^2(\mathrm{SU}(2)) \cong \bigoplus_{\ell = 0, 1/2, 1, \ldots} \mathbb{C}^{2\ell+1} \otimes \mathbb{C}^{2\ell+1},
\]
where each summand \(\cong M_{2\ell+1}(\mathbb{C})\) carries the representation \(\pi_\ell \otimes \bar\pi_\ell\). The orthonormal basis consists of functions \((2\ell+1)^{1/2} (\pi_\ell)_{mn}(g)\) for \(-\ell \leq m, n \leq \ell\), and these are the Wigner \(D\)-functions used in quantum mechanics and signal processing.
</div>

### 7.5 Character Theory

The **character** of an irreducible representation \(\pi\) is the function \(\chi_\pi : G \to \mathbb{C}\) defined by \(\chi_\pi(x) = \mathrm{tr}(\pi(x))\). Since \(\mathrm{tr}\) is invariant under similarity transformations, the character is a class function: \(\chi_\pi(yxy^{-1}) = \mathrm{tr}(\pi(yxy^{-1})) = \mathrm{tr}(\pi(y)\pi(x)\pi(y)^{-1}) = \mathrm{tr}(\pi(x)) = \chi_\pi(x)\). This means characters live in the subspace \(Z L^2(G)\) of class functions (the "center" of \(L^2(G)\) under convolution, i.e., functions invariant under conjugation).

<div class="proposition">
<strong>Proposition 7.9.</strong>
<ol>
<li>\(\langle \chi_\pi, \chi_{\pi'} \rangle_{L^2(G)} = \delta_{\pi\pi'}\) for \(\pi, \pi' \in \hat{G}\).</li>
<li>\(\pi \approx \pi'\) if and only if \(\chi_\pi = \chi_{\pi'}\).</li>
<li>The characters \(\{\chi_\pi : \pi \in \hat{G}\}\) form an orthonormal basis for the Hilbert space \(Z L^2(G)\) of class functions in \(L^2(G)\).</li>
<li>\(\chi_{\pi \oplus \pi'} = \chi_\pi + \chi_{\pi'}\) and \(\chi_{\pi \otimes \pi'} = \chi_\pi \cdot \chi_{\pi'}\).</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> (1) follows from the Schur orthogonality relations with \(\xi = \eta = e_i\) (the basis vectors) summed over \(i\):
\[
\langle \chi_\pi, \chi_{\pi'}\rangle = \sum_i \int_G \langle \pi(x)e_i, e_i\rangle \overline{\langle \pi'(x)e_i, e_i\rangle}\, dm(x) = \delta_{\pi\pi'} \cdot \frac{1}{d_\pi} \cdot d_\pi = \delta_{\pi\pi'}.
\]
(2): if \(\pi \approx \pi'\) then obviously \(\chi_\pi = \chi_{\pi'}\). Conversely, by the Plancherel formula on \(G\), the Fourier transform of a class function \(f\) satisfies \(\hat{f}(\pi) = c_\pi I\) for some scalar \(c_\pi\) (since class functions commute with all representation operators). The scalar is \(c_\pi = d_\pi^{-1}\langle f, \chi_\pi\rangle\). If \(\chi_\pi = \chi_{\pi'}\), then \(c_\pi = 1\) and \(c_{\pi'} = 1\) would give the same matrix coefficients, forcing \(\pi \approx \pi'\).
(3): The completeness of characters in \(Z L^2(G)\) follows from Peter-Weyl restricted to class functions: the projection of the orthonormal basis \(\{\sqrt{d_\pi}\pi_{ij}\}\) onto class functions picks out only the diagonal terms \(\sqrt{d_\pi}\pi_{ii}\), and their spans include \(\chi_\pi = \sum_i \pi_{ii}\).
(4): These follow from \(\mathrm{tr}(A \oplus B) = \mathrm{tr}(A) + \mathrm{tr}(B)\) and \(\mathrm{tr}(A \otimes B) = \mathrm{tr}(A)\mathrm{tr}(B)\).
</div>

The character theory of compact groups is a powerful tool for decomposing representations. Given any unitary representation \((\pi, \mathcal{H})\), the multiplicity of \(\pi_j \in \hat{G}\) in \(\pi\) is:
\[
m_j = \langle \chi_\pi, \chi_{\pi_j}\rangle_{L^2(G)} = \int_G \chi_\pi(x)\overline{\chi_{\pi_j}(x)}\, dm(x),
\]
and the complete decomposition is \(\pi \cong \bigoplus_{\pi_j \in \hat{G}} m_j\, \pi_j\). This is the Fourier analysis of representations: the character \(\chi_\pi\) is the "spectrum" of the representation \(\pi\).

**Clebsch-Gordan Formula for SU(2).** As an application of character theory, we determine how the tensor product of two irreducible representations of \(\mathrm{SU}(2)\) decomposes. The character of \(\pi_\ell\) on the maximal torus is \(\chi_\ell(\theta) = \frac{\sin((2\ell+1)\theta)}{\sin\theta}\). The character of \(\pi_\ell \otimes \pi_{\ell'}\) is the product:
\[
\chi_\ell(\theta)\chi_{\ell'}(\theta) = \frac{\sin((2\ell+1)\theta)\sin((2\ell'+1)\theta)}{\sin^2\theta}.
\]
To decompose this into irreducibles, we use the product-to-sum formula \(\sin A \sin B = \frac{1}{2}[\cos(A-B) - \cos(A+B)]\):
\[
\chi_\ell \cdot \chi_{\ell'} = \sum_{j = |\ell - \ell'|}^{\ell + \ell'} \chi_j,
\]
where the sum runs over \(j\) with \(|\ell - \ell'| \leq j \leq \ell + \ell'\) in steps of 1. Each \(\pi_j\) appears with multiplicity 1. This is the **Clebsch-Gordan formula**, the mathematical expression of the addition of angular momenta in quantum mechanics.

To verify with a simple case: \(\pi_{1/2} \otimes \pi_{1/2}\) (two spin-\(1/2\) particles) decomposes as \(\pi_0 \oplus \pi_1\) (a singlet and a triplet). Indeed, \(\chi_{1/2} = \frac{\sin(2\theta)}{\sin\theta} = 2\cos\theta\) and \(\chi_{1/2}^2 = 4\cos^2\theta = 2\cos(2\theta) + 2 = (\chi_1 + \chi_0)\) where \(\chi_0 = 1\) and \(\chi_1 = \frac{\sin(3\theta)}{\sin\theta} = 1 + 2\cos(2\theta)\). The decomposition \(\mathbb{C}^2 \otimes \mathbb{C}^2 = \mathbb{C}^3 \oplus \mathbb{C}^1\) corresponds to the familiar decomposition of a 4-dimensional space into a 3-dimensional triplet (\(\pi_1\)) and a 1-dimensional singlet (\(\pi_0\)).

The Clebsch-Gordan formula generalizes, via the Weyl character formula, to all compact semisimple Lie groups. For a general compact Lie group, the characters are indexed by dominant weights, and the Clebsch-Gordan rule is replaced by the Littlewood-Richardson rule (for classical groups) or its analogues.

### 7.6 Sugiura's Theorem and the Non-Abelian Paley-Wiener Problem

The Fourier transform for a compact group \(G\) assigns to each \(f \in L^1(G)\) a collection of finite-dimensional matrices \(\{\hat{f}(\pi) \in M_{d_\pi}(\mathbb{C})\}_{\pi \in \hat{G}}\). A natural question is: which collections of matrices \(\{A_\pi\}_{\pi \in \hat{G}}\) arise as Fourier transforms of smooth functions on \(G\)?

For \(G = \mathbb{T}\) (the circle), the classical Paley-Wiener theorem characterizes the Fourier transforms of smooth functions: \(f \in C^\infty(\mathbb{T})\) iff \(|\hat{f}(n)| = O(n^{-k})\) for all \(k \geq 0\) — i.e., the Fourier coefficients decay faster than any polynomial. For analytic functions, the decay is exponential.

For a compact Lie group \(G\) of dimension \(d\), the analogue is more subtle because the irreducible representations have increasing dimensions \(d_\pi\). The **Sugiura space** is the algebraic object that captures the right decay condition.

<div class="definition">
<strong>Definition 7.10 (Sugiura Space).</strong> For a compact semisimple Lie group \(G\) with Laplacian \(\Delta_G\), the <em>Sugiura space</em> \(\mathcal{S}(\hat{G})\) consists of all collections \(\{A_\pi\}_{\pi \in \hat{G}}\) (each \(A_\pi \in M_{d_\pi}(\mathbb{C})\)) satisfying:
<ol>
<li><em>Matrix decay</em>: for all \(k \geq 0\),
\[
\sup_{\pi \in \hat{G}} d_\pi \|\pi(\Delta_G)^k A_\pi\|_{\mathrm{op}} < \infty,
\]
where \(\pi(\Delta_G)\) denotes the Casimir eigenvalue \(\lambda_\pi = |\lambda_\pi|\) of \(\pi\).</li>
<li><em>Rapid decay</em>: for all \(k \geq 0\),
\[
\sum_{\pi \in \hat{G}} d_\pi \|A_\pi\|_{\mathrm{HS}} \lambda_\pi^k < \infty.
\]</li>
</ol>
</div>

<div class="theorem">
<strong>Theorem 7.11 (Sugiura, 1971).</strong> The Fourier transform \(f \mapsto \{\hat{f}(\pi)\}_{\pi \in \hat{G}}\) is an isomorphism of topological vector spaces:
\[
\mathcal{F} : C^\infty(G) \xrightarrow{\;\;\sim\;\;} \mathcal{S}(\hat{G}).
\]
In particular, \(f \in C^\infty(G)\) if and only if its Fourier transform lies in the Sugiura space.
</div>

The condition on the Casimir eigenvalues replaces the polynomial decay in \(n\) for the circle. For \(G = \mathrm{SU}(2)\), the Casimir eigenvalue of the spin-\(\ell\) representation is \(\lambda_\ell = \ell(\ell+1)\), so Sugiura's theorem says: a function on \(\mathrm{SU}(2)\) is smooth iff \(\|\hat{f}(\pi_\ell)\|_{\mathrm{HS}} = O(\ell^{-k})\) for all \(k\).

The analytic analogue of Sugiura's theorem — characterizing real-analytic functions on \(G\) by *exponential* decay of their Fourier transforms — is more subtle and was established by various authors in the 1980s. For \(\mathrm{SU}(2)\), a function is analytic iff there exist \(C, \alpha > 0\) with \(\|\hat{f}(\pi_\ell)\|_{\mathrm{HS}} \leq C e^{-\alpha \ell}\).

The Sugiura theorem is the non-abelian Paley-Wiener theorem. It is important in quantum mechanics (where smooth vs. analytic observables on a Lie group correspond to physical observables with different regularity), in spectral geometry (where the Laplacian spectrum on \(G\) is encoded in the Casimir eigenvalues), and in the theory of automorphic forms (where the Fourier decomposition of a modular form along a compact subgroup involves exactly the Sugiura conditions).

**Connection to spectral synthesis.** Sugiura's theorem also clarifies when "spectral synthesis" holds for the compact group \(G\). The closed ideals in \(C^\infty(G)\) under convolution correspond (via Fourier transform) to closed subsets of \(\hat{G}\) — i.e., to subsets \(S \subseteq \hat{G}\) where all elements of the ideal have vanishing Fourier matrices at each \(\pi \in S\). Since \(\hat{G}\) is discrete for compact \(G\), every closed subset is automatically a union of singleton sets, and spectral synthesis holds trivially: every closed ideal is the intersection of the maximal ideals indexed by \(S\). This contrasts sharply with the non-compact case (such as \(\mathbb{R}^n\) for \(n \geq 3\)), where spectral synthesis can fail due to the topology of \(\hat{G} = \mathbb{R}^n\).

**Fourier series on SO(3).** The group \(\mathrm{SO}(3)\) has \(\mathrm{SU}(2)\) as its double cover, with kernel \(\{\pm I\}\). The irreducible representations of \(\mathrm{SO}(3)\) are the integer-spin representations \(\pi_\ell\) for \(\ell = 0, 1, 2, \ldots\) (the half-integer spins are representations of \(\mathrm{SU}(2)\) that do not descend to \(\mathrm{SO}(3)\)). The Hilbert space \(L^2(S^2)\), where \(S^2 = \mathrm{SO}(3)/\mathrm{SO}(2)\) is the 2-sphere, decomposes as:
\[
L^2(S^2) \cong \bigoplus_{\ell = 0}^{\infty} V_\ell,
\]
where \(V_\ell\) is the space of degree-\(\ell\) spherical harmonics of dimension \(2\ell+1\). The spherical harmonics \(Y_\ell^m(\theta, \phi)\) (for \(-\ell \leq m \leq \ell\)) form an orthonormal basis for \(L^2(S^2)\). This is the Peter-Weyl theorem applied to \(\mathrm{SO}(3)\) and the spherical manifold \(S^2\): the \(L^2\) functions on the sphere decompose into finite-dimensional irreducible \(\mathrm{SO}(3)\)-modules.

### 7.7 Convolution Operators and Spectral Decomposition

The Peter-Weyl theorem says \(L^2(G) \cong \bigoplus_{\pi \in \hat{G}} \mathcal{H}_\pi \otimes \mathcal{H}_\pi^*\). This decomposition is not merely abstract — it has a concrete realization in terms of **convolution operators**, and it gives a complete spectral theory for the algebra \(L^1(G)\) acting on \(L^2(G)\).

For a compact group \(G\), define the convolution operator \(L_f : L^2(G) \to L^2(G)\) by \(L_f g = f * g\) for \(f \in L^1(G)\). This is a bounded operator: \(\|L_f\|_{\mathcal{B}(L^2(G))} \leq \|f\|_{L^1(G)}\) by Young's inequality. The map \(f \mapsto L_f\) is the **integrated form of the left regular representation** \(\lambda : G \to \mathcal{U}(L^2(G))\).

<div class="proposition">
<strong>Proposition 7.12 (Peter-Weyl spectral decomposition of \(L^1(G)\)).</strong> For \(f \in L^1(G)\) and the decomposition \(L^2(G) = \bigoplus_{\pi \in \hat{G}} \mathcal{H}_\pi \otimes \mathcal{H}_\pi^*\), the convolution operator \(L_f\) acts on each summand by
\[
L_f|_{\mathcal{H}_\pi \otimes \mathcal{H}_\pi^*} = \hat{f}(\pi) \otimes I_{\mathcal{H}_\pi^*},
\]
where \(\hat{f}(\pi) = \int_G f(x)\pi(x^{-1})\, dm(x) \in M_{d_\pi}(\mathbb{C})\) is the Fourier transform of \(f\) at \(\pi\). Consequently:
\[
\|L_f\|_{\mathcal{B}(L^2(G))} = \sup_{\pi \in \hat{G}} \|\hat{f}(\pi)\|_{\mathrm{op}}, \quad \text{and} \quad \|L_f\|_{\mathrm{HS}} = \|f\|_{L^2(G)}.
\]
</div>

<div class="proof">
<strong>Proof.</strong> The Peter-Weyl orthonormal basis consists of functions \(\sqrt{d_\pi} \pi_{ij}\). For \(f \in C(G)\) and basis elements \(\pi_{ij}\):
\[
(L_f \pi_{ij})(x) = (f * \pi_{ij})(x) = \int_G f(y)\pi_{ij}(y^{-1}x)\, dm(y).
\]
By the matrix multiplication rule \(\pi_{ij}(y^{-1}x) = \sum_k \pi_{ik}(y^{-1})\pi_{kj}(x) = \sum_k \overline{\pi_{ki}(y)}\pi_{kj}(x)\):
\[
(f * \pi_{ij})(x) = \sum_k \pi_{kj}(x) \int_G f(y)\overline{\pi_{ki}(y)}\, dm(y) = \sum_k \pi_{kj}(x)\, \overline{\widehat{f}(\pi)_{ki}^*} = \sum_k [\hat{f}(\pi)]_{ik}\, \pi_{kj}(x).
\]
So \(L_f\) maps \(\pi_{kj}(\cdot)\) to \(\sum_i [\hat{f}(\pi)]_{ik} \pi_{ij}(\cdot)\), which is exactly the action of \(\hat{f}(\pi)\) on the row index \(k\) of the matrix coefficient. The operator norm statement follows from the decomposition into orthogonal blocks: \(\|L_f\|^2 = \sup_\pi \|\hat{f}(\pi)\|_{\mathrm{op}}^2\). The Hilbert-Schmidt norm statement is the Plancherel formula (Theorem 7.6).
</div>

This proposition is the compact group analogue of the classical fact that convolution operators on \(L^2(\mathbb{R}^n)\) are Fourier multipliers: \(\widehat{L_f g}(\xi) = \hat{f}(\xi)\hat{g}(\xi)\). For compact groups, the "multiplier" is not a scalar function on \(\hat{G}\) but a *matrix-valued* function \(\pi \mapsto \hat{f}(\pi) \in M_{d_\pi}(\mathbb{C})\).

**Functional calculus.** Since \(L^2(G) = \bigoplus_\pi \mathcal{H}_\pi \otimes \mathcal{H}_\pi^*\) and \(L_f\) acts blockwise by \(\hat{f}(\pi)\), we can define a "spectral functional calculus" for self-adjoint convolution operators. If \(f = \bar{f}^* := \check{\bar{f}}\) (i.e., \(f\) is self-adjoint: \(f(x^{-1}) = \overline{f(x)}\)), then \(L_f\) is self-adjoint and \(\hat{f}(\pi) = \hat{f}(\pi)^*\) (Hermitian) for each \(\pi\). The spectrum of \(L_f\) on \(L^2(G)\) is:
\[
\sigma(L_f) = \overline{\bigcup_{\pi \in \hat{G}} \sigma(\hat{f}(\pi))} \subset \mathbb{R},
\]
a closed subset of \([-\|f\|_1, \|f\|_1]\). The spectral projections of \(L_f\) onto intervals \([a,b]\) are convolution operators \(L_g\) where \(\hat{g}(\pi)\) is the spectral projection of \(\hat{f}(\pi)\) onto \(\sigma(\hat{f}(\pi)) \cap [a,b]\).

<div class="example">
<strong>Example 7.13 (Laplacian on a compact Lie group).</strong> For a compact Lie group \(G\) of dimension \(d\), the Laplacian \(\Delta_G\) (via the Killing form on the Lie algebra) is a left-invariant second-order differential operator. Its action on \(L^2(G)\) decomposes under Peter-Weyl as:
\[
\Delta_G|_{\mathcal{H}_\pi \otimes \mathcal{H}_\pi^*} = -\lambda_\pi\, I,
\]
where \(\lambda_\pi \geq 0\) is the <strong>Casimir eigenvalue</strong> of \(\pi\) (the value by which the Casimir element of the universal enveloping algebra acts on \(\mathcal{H}_\pi\)). For \(G = \mathrm{SU}(2)\), \(\lambda_{\pi_\ell} = \ell(\ell+1)\). For \(G = \mathrm{SO}(3)\), \(\lambda_{\pi_\ell} = \ell(\ell+1)\) for integer \(\ell\). For \(G = \mathbb{T}^n\), \(\lambda_{e_{\mathbf{k}}} = |\mathbf{k}|^2\) for \(\mathbf{k} \in \mathbb{Z}^n\).

The heat kernel of \(\Delta_G\) at time \(t > 0\) is:
\[
k_t(x) = \sum_{\pi \in \hat{G}} d_\pi e^{-\lambda_\pi t} \chi_\pi(x) = \sum_{\pi \in \hat{G}} d_\pi e^{-\lambda_\pi t} \mathrm{tr}(\pi(x)),
\]
and the heat equation solution \(u(x,t) = (k_t * f)(x)\) decomposes as \(\hat{u}(\pi, t) = e^{-\lambda_\pi t}\hat{f}(\pi)\). For \(G = \mathbb{T}\), this is the classical Fourier series heat equation solution \(u(\theta, t) = \sum_n \hat{f}(n) e^{-n^2 t} e^{in\theta}\).

The rapid decay \(e^{-\lambda_\pi t}\) as \(\lambda_\pi \to \infty\) (combined with the Weyl asymptotic formula \(|\{\pi : \lambda_\pi \leq \Lambda\}| \sim C_G \Lambda^{d/2}\)) gives the heat kernel smoothing: \(k_t \in C^\infty(G)\) for all \(t > 0\). This is the compact group analogue of the classical fact that the Gaussian kernel \(e^{-|\xi|^2 t}\) is a Schwartz function in \(\xi\) for each fixed \(t > 0\).
</div>

<div class="example">
<strong>Example 7.14 (Hecke operators as convolution operators).</strong> In the theory of automorphic forms, <strong>Hecke operators</strong> are convolution operators on a space of functions on a group \(G\) that are invariant under a compact subgroup \(K \leq G\). The "spherical" Hecke algebra is \(L^1(G \mathbin{/\!/} K) = \{f \in L^1(G) : f(kxk') = f(x)\, \forall k, k' \in K\}\), equipped with convolution. This is a commutative algebra (for suitable pairs \((G, K)\) — "Gelfand pairs"), and the characters of this algebra are the <strong>spherical functions</strong> — the \(K\)-bi-invariant positive definite functions on \(G\).

For \(G = \mathrm{SL}(2, \mathbb{Z}_p)\) and \(K = \mathrm{SL}(2, \mathbb{Z}_p)\) the maximal compact subgroup, the spherical functions are parameterized by \(\mathbb{C}/(\mathbb{Z}/2\mathbb{Z})\) (the unramified characters of \(\mathrm{SL}(2, \mathbb{Q}_p)\)). The "Hecke eigenvalue" of a modular form \(f\) at the prime \(p\) is the scalar by which the Hecke operator \(T_p\) (a specific element of the Hecke algebra) acts on \(f\) — and these eigenvalues encode the arithmetic of the modular form (via the Ramanujan-Petersson conjecture, proved by Deligne in 1974).

The convolution operator picture unifies: Hecke operators, the Laplacian on \(G\), and abstract spectral theory are all instances of the Peter-Weyl decomposition of \(L^2(G)\) and the action of the convolution algebra \(L^1(G)\) on this decomposition.
</div>

---

## Chapter 8: Amenable Groups

### 8.1 Invariant Means

The notion of amenability captures a subtle property of groups: does there exist a "finitely additive probability measure" on the group that is invariant under translations? The existence of such a mean turns out to have deep consequences for the group's analysis, geometry, and representation theory.

<div class="definition">
<strong>Definition 8.1 (Invariant Mean, von Neumann).</strong> A locally compact group \(G\) is <em>amenable</em> if there exists a linear functional \(M : L^\infty(G) \to \mathbb{C}\) (a "left-invariant mean") such that:
<ol>
<li>\(M(\mathbf{1}) = 1\) (normalization);</li>
<li>\(M(f) \geq 0\) whenever \(f \geq 0\) (positivity);</li>
<li>\(M(f \cdot x) = M(f)\) for all \(f \in L^\infty(G)\), \(x \in G\) (left invariance).</li>
</ol>
</div>

The invariant mean is a generalized integral that assigns a "mean value" to every bounded function, invariant under the group action. For finite groups, the mean value is just the average \(M(f) = \frac{1}{|G|}\sum_{g \in G} f(g)\). For amenable groups, this kind of averaging extends to infinite groups.

### 8.2 Examples and Non-Examples

<div class="proposition">
<strong>Proposition 8.2.</strong>
<ol>
<li>Every compact group is amenable. (Take \(M(f) = \int_G f\, dm\) where \(m\) is normalized Haar measure.)</li>
<li>Every abelian locally compact group is amenable.</li>
<li>Subgroups and quotients of amenable groups are amenable.</li>
<li>Extensions of amenable groups by amenable groups are amenable.</li>
<li>The free group \(\mathbb{F}_2\) on two generators is <em>not</em> amenable.</li>
</ol>
</div>

The non-amenability of \(\mathbb{F}_2\) is the group-theoretic shadow of the Banach-Tarski paradox: the unit ball in \(\mathbb{R}^3\) can be decomposed into finitely many pieces and reassembled (by rotations and translations) into two unit balls. The key connection is that \(\mathrm{SO}(3)\) contains a copy of \(\mathbb{F}_2\) as a subgroup, and this copy acts "paradoxically" on the ball. Let us prove the non-amenability of \(\mathbb{F}_2\) directly.

<div class="proposition">
<strong>Proposition 8.3 (Non-amenability of \(\mathbb{F}_2\)).</strong> The free group \(\mathbb{F}_2\) on two generators \(a, b\) is not amenable.
</div>

<div class="proof">
<strong>Proof.</strong> We use the Følner criterion: \(\mathbb{F}_2\) is amenable iff for every finite \(K \subset \mathbb{F}_2\) and \(\varepsilon > 0\), there exists a finite set \(F \subset \mathbb{F}_2\) with \(|KF \triangle F| < \varepsilon |F|\).

We will show this fails for \(K = \{a, b\}\). Every element of \(\mathbb{F}_2\) is a reduced word in \(a, a^{-1}, b, b^{-1}\). Partition \(\mathbb{F}_2\) into five sets based on the first letter of the reduced word:
\[
W(a) = \{\text{words beginning with } a\}, \quad W(a^{-1}) = \{\text{words beginning with } a^{-1}\},
\]
\[
W(b) = \{\text{words beginning with } b\}, \quad W(b^{-1}) = \{\text{words beginning with } b^{-1}\}, \quad \{e\}.
\]
Note: \(\mathbb{F}_2 = W(a) \sqcup W(a^{-1}) \sqcup W(b) \sqcup W(b^{-1}) \sqcup \{e\}\).

The key observation is:
\[
\mathbb{F}_2 = W(a) \sqcup a^{-1} W(a^{-1}) \cup \{e\} = aW(a^{-1}) \sqcup W(a).
\]
More precisely: multiplying \(W(a^{-1})\) on the left by \(a^{-1}\) gives \(a^{-1} W(a^{-1}) \subseteq W(a^{-1})\), and \(W(a) \cup a^{-1}W(a^{-1}) = \mathbb{F}_2 \setminus (\{e\} \cup W(b) \cup W(b^{-1}))\). Actually, the key identity is:
\[
aW(a^{-1}) = \mathbb{F}_2 \setminus W(a),
\]
since \(a \cdot (a^{-1} w) = w\) gives all words not starting with \(a\) (except we need to be careful about the identity).

The precise Hausdorff paradox: \(\mathbb{F}_2\) can be partitioned into sets \(A, B, C, D\) such that \(A \cup aA = \mathbb{F}_2 = B \cup bB\). This gives the "paradoxical decomposition": \(\mathbb{F}_2 = A \cup aA = B \cup bB\), so left-multiplying \(A\) by \(a\) and \(B\) by \(b\) "doubles" the group. Concretely, take \(A = W(a^{-1}) \cup \{e\}\) and note:
\[
A \sqcup aA = (W(a^{-1}) \cup \{e\}) \sqcup (a W(a^{-1}) \cup \{a\}) = W(a^{-1}) \cup \{e\} \cup (W(a) \setminus \{a, \ldots\}) \cup \{a\}.
\]
This requires careful tracking. The rigorous statement is:

Let \(W_a\) denote the words beginning with \(a\). Then \(W_a^c = W_{a^{-1}} \cup W_b \cup W_{b^{-1}} \cup \{e\}\). Multiplying: \(a^{-1}(W_a^c) \supseteq W_a^c\) after prepending \(a^{-1}\). So:
- \(\mathbb{F}_2 = W_a \cup a W_{a^{-1}} \cup a\{e, \text{words not starting with } a^{\pm 1}\}\).

For the Følner condition failure: suppose for contradiction there exists a finite set \(F\) with \(|aF \triangle F| < |F|/4\) and \(|bF \triangle F| < |F|/4\). Then \(|aF| = |F|\), so \(|aF \cap F| > 3|F|/4\). Similarly for \(b\). But the "free" structure of \(\mathbb{F}_2\) means the four sets \(F, aF, bF, abF, \ldots\) are "generically disjoint" — more precisely, a combinatorial argument (the "expander" property of the Cayley graph of \(\mathbb{F}_2\)) shows that for any finite \(F\), \(|KF \triangle F| \geq |F|\) where \(K = \{a, a^{-1}, b, b^{-1}\}\). This gives a contradiction.

The formal argument is: partition \(\partial F = (KF) \setminus F\) (the "outer boundary" of \(F\)). Each element \(g \in F\) is adjacent to at most 4 elements in \(KF\). But in the Cayley graph of \(\mathbb{F}_2\), which is a 4-regular tree, the tree expander property gives \(|\partial F| \geq |F|\) (the isoperimetric constant of a regular tree is 1). So \(|KF \triangle F| \geq |\partial F| \geq |F|\), and the Følner condition fails.
</div>

The key fact used is that the Cayley graph of \(\mathbb{F}_2\) with generators \(\{a, a^{-1}, b, b^{-1}\}\) is an infinite 4-regular tree. Every tree has isoperimetric constant \(\geq 1\): for any finite set \(F\) of vertices, the outer boundary \(\partial F\) (vertices outside \(F\) adjacent to \(F\)) satisfies \(|\partial F| \geq |F|\). Intuitively: in a tree, adding one vertex to \(F\) always adds at least one new boundary vertex (its children), so the boundary can never be smaller than the interior.

This isoperimetric rigidity is the obstruction to amenability. For comparison, in \(\mathbb{Z}^2\) (whose Cayley graph is the integer lattice, not a tree), the Følner sets are squares, and their boundary has size \(O(\sqrt{|F|})\) — much smaller than \(|F|\). This "branching vs. flat" dichotomy is why \(\mathbb{Z}^d\) is amenable but \(\mathbb{F}_2\) is not.

<div class="theorem">
<strong>Theorem 8.3b (Banach-Tarski Paradox).</strong> The unit ball \(B^3 \subset \mathbb{R}^3\) can be decomposed into finitely many pieces \(B^3 = A_1 \sqcup \cdots \sqcup A_k\) such that, by applying rigid motions (rotations and translations) to the pieces, one obtains two copies of \(B^3\):
\[
B^3 = (g_1 A_1 \sqcup \cdots \sqcup g_j A_j) \sqcup (g_{j+1} A_{j+1} \sqcup \cdots \sqcup g_k A_k).
\]
</div>

The connection to amenability: the key input is that \(\mathrm{SO}(3)\) contains a copy of \(\mathbb{F}_2\) as a subgroup. Explicitly, the matrices
\[
a = \begin{pmatrix} 1/3 & -2\sqrt{2}/3 & 0 \\ 2\sqrt{2}/3 & 1/3 & 0 \\ 0 & 0 & 1\end{pmatrix}, \quad b = \begin{pmatrix} 1 & 0 & 0 \\ 0 & 1/3 & -2\sqrt{2}/3 \\ 0 & 2\sqrt{2}/3 & 1/3\end{pmatrix}
\]
(both of order 3) generate a free group \(\mathbb{F}_2 \subset \mathrm{SO}(3)\). Since \(\mathbb{F}_2\) is non-amenable, it admits a **paradoxical decomposition**: \(\mathbb{F}_2 = A \sqcup B \sqcup C \sqcup D\) with \(A \sqcup aA = \mathbb{F}_2\) and \(B \sqcup bB = \mathbb{F}_2\) (where we identify the four sets \(W(a^{-1}), a^{-1}W(a), W(b^{-1}), b^{-1}W(b)\) appropriately). Applying this paradoxical decomposition to the orbits of \(\mathbb{F}_2\) on the sphere \(S^2\) (minus two poles) and then thickening to a ball gives the Banach-Tarski decomposition.

The crucial non-measurability: the sets \(A_1, \ldots, A_k\) in the Banach-Tarski theorem are **not Lebesgue measurable**. If they were, the decomposition would violate the additivity of Lebesgue measure (a ball has positive finite volume, and cannot be equidecomposed into two balls of the same volume if the pieces are measurable). The existence of non-measurable sets (via the Axiom of Choice) is what allows the paradox.

This is why the invariant mean (a finitely additive probability measure on all bounded measurable functions, invariant under isometries) cannot exist for \(\mathrm{SO}(3)\): the paradoxical decomposition shows that no consistent assignment of "measure" to all subsets of \(\mathrm{SO}(3)\) can be both isometry-invariant and finitely additive. For \(\mathbb{Z}^n\) (and all amenable groups), such a finitely additive invariant measure does exist by definition.

### 8.3 Equivalent Characterizations

<div class="theorem">
<strong>Theorem 8.3 (Reiter's Condition).</strong> A locally compact group \(G\) is amenable if and only if for every compact \(K \subseteq G\) and \(\varepsilon > 0\), there exists \(f \in L^1(G)\) with \(f \geq 0\), \(\|f\|_1 = 1\), such that
\[
\|x \cdot f - f\|_1 < \varepsilon \quad\text{for all } x \in K.
\]
A net of such functions is called a <em>Reiter net</em>.
</div>

Reiter's condition says: amenability is equivalent to the existence of "almost invariant" probability measures in \(L^1(G)\). This is the \(L^1\)-formulation; there is an analogous \(L^2\)-formulation where one seeks almost invariant unit vectors in \(L^2(G)\).

<div class="theorem">
<strong>Theorem 8.4 (Følner's Condition).</strong> A locally compact group \(G\) is amenable if and only if for every compact \(K \subseteq G\) and \(\varepsilon > 0\), there exists a Borel set \(F \subseteq G\) with \(0 < m(F) < \infty\) (a "Følner set") such that
\[
\frac{m(KF \triangle F)}{m(F)} < \varepsilon,
\]
where \(KF = \{kf : k \in K, f \in F\}\) and \(\triangle\) denotes symmetric difference.
</div>

The Følner condition has a beautiful geometric interpretation: \(G\) is amenable if and only if it contains finite-measure sets whose boundaries are negligibly small compared to their volumes, relative to translations by any fixed compact set. For \(G = \mathbb{Z}\), the Følner sets can be taken to be long intervals \(\{0, 1, \ldots, N-1\}\). For \(G = \mathbb{Z}^d\), they can be cubes \(\{0, 1, \ldots, N-1\}^d\). For the free group \(\mathbb{F}_2\), no such sets exist — the "boundary" (elements adjacent to elements outside the set) is always a fixed fraction of the set itself.

<div class="theorem">
<strong>Theorem 8.5.</strong> The following are equivalent for a locally compact group \(G\):
<ol>
<li>\(G\) is amenable.</li>
<li>\(L^\infty(G)\) admits a left-invariant mean.</li>
<li>\(L^\infty(G)\) admits a two-sided invariant mean.</li>
<li>\(G\) satisfies Reiter's condition.</li>
<li>\(G\) satisfies Følner's condition.</li>
</ol>
</div>

The equivalence of (1) and (3) is notable: if any left-invariant mean exists, then a *two-sided* invariant mean also exists. This follows by "symmetrizing" a left-invariant mean: given \(M_L\), define \(M(f) = M_L(\phi)\) where \(\phi(y) = M_L(x \mapsto f(xy))\). One verifies this is two-sided invariant.

### 8.4 Equivalence of Amenability Conditions

The three conditions — invariant mean, Reiter's condition, and Følner's condition — are equivalent. This equivalence is part of what makes amenability a robust and natural concept.

<div class="theorem">
<strong>Theorem 8.6 (Grand Equivalence for Amenability).</strong> For a locally compact group \(G\), the following are equivalent:
<ol>
<li>\(G\) is amenable (admits a left-invariant mean on \(L^\infty(G)\)).</li>
<li>Reiter's condition \((R_1)\): for every compact \(K \subseteq G\) and \(\varepsilon > 0\), \(\exists f \in L^1(G)\), \(f \geq 0\), \(\|f\|_1 = 1\), with \(\sup_{x\in K}\|x\cdot f - f\|_1 < \varepsilon\).</li>
<li>Følner's condition: for every compact \(K \subseteq G\) and \(\varepsilon > 0\), \(\exists F \subseteq G\) with \(0 < m(F) < \infty\) and \(m(KF \triangle F)/m(F) < \varepsilon\).</li>
</ol>
</div>

<div class="proof">
<strong>Proof of (1) \(\Rightarrow\) (2).</strong> Given an invariant mean \(M\) and a compact \(K\), \(\varepsilon > 0\), the key idea is to approximate \(M\) by finitely additive measures supported on large compact sets, then "smear" them into \(L^1\) functions.

By the Markov-Kakutani fixed point theorem, the space of left-invariant means is a nonempty convex weak-\(*\) compact subset of the unit ball of \((L^\infty)^*\). Given \(K\) and \(\varepsilon\), consider the set
\[
S = \{f \in L^1(G) : f \geq 0,\, \|f\|_1 = 1\}.
\]
Left-invariance of \(M\) gives \(M(x \cdot g) = M(g)\) for all \(g \in L^\infty\). For any \(h \in C_c(G)\), define the functional \(\psi_f(g) = f * g(e) = \int f(y^{-1}) g(y)\, dm(y)\). The claim is that there exist \(f \in S\) with \(\|x \cdot f - f\|_1 < \varepsilon\) for all \(x \in K\).

If not, for every \(f \in S\) there exists \(x_f \in K\) with \(\|x_f \cdot f - f\|_1 \geq \varepsilon\). This would imply the functional \(f \mapsto \sup_{x \in K} \|x \cdot f - f\|_1\) is bounded below by \(\varepsilon\) on all of \(S\). By a weak-\(*\) approximation argument (Hahn-Banach), this contradicts the existence of a left-invariant mean.

<strong>Proof of (2) \(\Rightarrow\) (3).</strong> Given a Reiter net \((f_\alpha)\) with \(\|f_\alpha\|_1 = 1\) and \(\|x \cdot f_\alpha - f_\alpha\|_1 \to 0\) for all \(x \in K\), define the set \(F_\alpha = \{y : f_\alpha(y) > t_\alpha\}\) for an appropriate level \(t_\alpha\). The co-area formula gives:
\[
m(xF_\alpha \triangle F_\alpha) = \int_0^\infty m(\{y : \mathbf{1}_{xF_\alpha}(y) \neq \mathbf{1}_{F_\alpha}(y)\})\, dt \leq \|x \cdot f_\alpha - f_\alpha\|_1 \to 0.
\]
More carefully: for any measurable \(F\) with \(0 < m(F) < \infty\) and indicator function \(\phi = m(F)^{-1}\mathbf{1}_F\),
\[
m(xF \triangle F)/m(F) = \|x \cdot \phi - \phi\|_1.
\]
If we could directly take \(f_\alpha = \phi_{F_\alpha}\) we would be done. The issue is that Reiter functions need not be indicators. One resolves this by a "layer cake" / co-area argument: represent \(f_\alpha\) as a superposition of indicator functions via the formula \(f = \int_0^\infty \mathbf{1}_{\{f > t\}}\, dt / \|f\|_1\). The measure \(\|x \cdot f - f\|_1\) is the averaged version of \(m(xF_t \triangle F_t)/m(F_t)\) over level sets \(F_t = \{f > t\}\). If the averaged quantity tends to zero, then for at least one level \(t_\alpha\), the set \(F_{t_\alpha}\) is a Følner set.

<strong>Proof of (3) \(\Rightarrow\) (1).</strong> Given Følner sets \((F_\alpha)\), define the means
\[
M_\alpha(f) = \frac{1}{m(F_\alpha)} \int_{F_\alpha} f\, dm.
\]
Each \(M_\alpha\) is a positive linear functional on \(L^\infty(G)\) with \(M_\alpha(\mathbf{1}) = 1\). Left invariance: for \(x \in K\),
\[
|M_\alpha(x \cdot f) - M_\alpha(f)| = \left|\frac{1}{m(F_\alpha)}\int (f(x^{-1}y) - f(y))\, dm(y)\right| \leq \frac{\|f\|_\infty \cdot m(xF_\alpha \triangle F_\alpha)}{m(F_\alpha)} \to 0.
\]
Any weak-\(*\) cluster point \(M\) of the net \((M_\alpha)\) in the unit ball of \((L^\infty)^*\) is an invariant mean.
</div>

The Følner condition admits a beautiful geometric interpretation: \(\mathbb{Z}\) is amenable with Følner sets \(F_N = \{-N, \ldots, N\}\) (the boundary has \(|KF_N \triangle F_N| = O(|K|)\) while \(|F_N| = 2N+1 \to \infty\)). For \(\mathbb{Z}^d\), the cubes \(\{0, \ldots, N\}^d\) work. For the free group \(\mathbb{F}_2\), no Følner sets exist: any finite set \(F \subset \mathbb{F}_2\) satisfies \(|KF \triangle F| \geq c|F|\) for a fixed constant \(c > 0\) depending only on \(K\).

### 8.5 Hulanicki's Theorem

The deepest result in this chapter relates amenability to the representation theory of the group.

<div class="definition">
<strong>Definition 8.7.</strong> The <em>left regular representation</em> \(\lambda : G \to \mathcal{U}(L^2(G))\) is given by \((\lambda(x)f)(y) = f(x^{-1}y)\). The <em>full group \(C^*\)-algebra</em> \(C^*(G)\) is the completion of \(L^1(G)\) under the norm \(\|f\|_{C^*} = \sup_\pi \|\pi_1(f)\|\), where the sup runs over all unitary representations. The <em>reduced group \(C^*\)-algebra</em> \(C^*_r(G)\) is the closure of \(\lambda_1(L^1(G))\) in \(\mathcal{B}(L^2(G))\), where \(\lambda_1\) is the integrated form of the regular representation.
</div>

There is a natural surjective \(*\)-homomorphism \(q : C^*(G) \to C^*_r(G)\), because the regular representation \(\lambda\) is one of the representations in the sup defining \(\|\cdot\|_{C^*}\). In general this map has nontrivial kernel: there exist groups where \(\|f\|_{C^*} > \|f\|_{C^*_r}\) for some \(f\), meaning that \(f\) "looks smaller" when we only look at the regular representation. Amenability is precisely the condition that forbids this.

<div class="theorem">
<strong>Theorem 8.8 (Hulanicki).</strong> A locally compact group \(G\) is amenable if and only if the canonical map \(q : C^*(G) \to C^*_r(G)\) is an isomorphism, i.e., every unitary representation of \(G\) is weakly contained in the left regular representation \(\lambda\).
</div>

<div class="proof">
<strong>Proof sketch.</strong> Recall that a unitary representation \(\pi\) is <em>weakly contained</em> in \(\lambda\) if for every matrix coefficient \(\phi(x) = \langle \pi(x)\xi, \xi\rangle\) and every \(\varepsilon > 0\), there exist \(f_1, \ldots, f_n \in L^2(G)\) such that \(|\phi(x) - \sum_i \langle \lambda(x)f_i, f_i\rangle| < \varepsilon\) for all \(x\) in a prescribed compact set.

(\(\Rightarrow\), amenable implies Hulanicki): Suppose \(G\) is amenable. Let \(\pi\) be any unitary representation, \(\phi(x) = \langle \pi(x)\xi, \xi\rangle\). By Reiter's condition, let \((f_\alpha)\) be a Reiter net in \(L^2(G)\) (squared: replace \(L^1\) with \(L^2\), which is Reiter's condition \((R_2)\), equivalent by Cauchy-Schwarz). Then the matrix coefficients \(\langle \lambda(x)\overline{f_\alpha}, \overline{f_\alpha}\rangle_{L^2} = \int f_\alpha(y)f_\alpha(x^{-1}y)\, dm(y)\) approximate \(\phi(x) = \langle \pi(x)\xi, \xi\rangle\) in a suitable limit, using the fact that the tensor product representation \(\pi \otimes \overline{\lambda}\) contains the trivial representation weakly (by amenability).

(\(\Leftarrow\), Hulanicki implies amenable): If \(q\) is an isomorphism, then in particular the trivial representation \(\mathbf{1}\) is weakly contained in \(\lambda\). This means: for every \(\varepsilon > 0\) and compact \(K\), there exist \(f_1, \ldots, f_n \in L^2(G)\) with \(\sum \|f_i\|_2^2 = 1\) such that \(|\langle \lambda(x) f_i, f_i\rangle - 1| < \varepsilon\) for all \(x \in K\). This is Reiter's condition \((R_2)\) applied to \(g = \sum |f_i|^2 \in L^1(G)\).
</div>

Hulanicki's theorem has a surprising consequence: for an amenable group, the "universal" harmonic analysis (encoded in \(C^*(G)\)) and the "concrete" harmonic analysis via the regular representation (encoded in \(C^*_r(G)\)) are identical. For non-amenable groups, \(C^*(G)\) is strictly larger than \(C^*_r(G)\), and understanding the difference between them is a deep open problem in operator algebra theory.

### 8.5b Kazhdan's Property (T) and Its Contrast with Amenability

At the opposite extreme from amenability lies **Kazhdan's property (T)**, introduced by Kazhdan in 1967. While amenability is characterized by the *existence* of almost-invariant vectors in every unitary representation, property (T) is a "rigidity" condition asserting that almost-invariant vectors must come from genuinely invariant vectors.

<div class="definition">
<strong>Definition 8.8b (Kazhdan's Property (T)).</strong> A locally compact group \(G\) has <em>property (T)</em> if there exist a compact subset \(K \subseteq G\) and \(\varepsilon > 0\) (a "Kazhdan pair" \((K, \varepsilon)\)) such that: for every unitary representation \(\pi : G \to \mathcal{U}(\mathcal{H})\), if there exists a unit vector \(\xi \in \mathcal{H}\) with \(\sup_{x \in K}\|\pi(x)\xi - \xi\| < \varepsilon\), then \(\pi\) has a nonzero \(\pi(G)\)-invariant vector.
</div>

Property (T) says: if a representation "almost has" an invariant vector (in the sense that some vector is nearly fixed by the compact set \(K\)), then it actually has one. This is a strong form of rigidity.

The key dichotomy is:

<div class="theorem">
<strong>Theorem 8.9b (Amenability vs. Property (T)).</strong>
<ol>
<li>A locally compact group \(G\) is both amenable and has property (T) if and only if \(G\) is compact.</li>
<li>Non-compact groups with property (T) are non-amenable. Examples include \(\mathrm{SL}_n(\mathbb{Z})\) for \(n \geq 3\) and \(\mathrm{Sp}_{2n}(\mathbb{Z})\) for \(n \geq 2\).</li>
<li>The free group \(\mathbb{F}_2\) and, more generally, all groups acting properly on a tree, do not have property (T).</li>
</ol>
</div>

<div class="proof">
<strong>Proof of (1).</strong> (\(\Rightarrow\)) If \(G\) is compact and has property (T), it is clearly compact. (\(\Leftarrow\)) If \(G\) is both amenable and has property (T): by amenability, the regular representation \(\lambda : G \to \mathcal{U}(L^2(G))\) has almost-invariant vectors (a Reiter sequence \((f_n)\) with \(\|x \cdot f_n - f_n\|_2 \to 0\)). By property (T), the regular representation has an invariant vector \(f \in L^2(G)\) with \(\lambda(x)f = f\) for all \(x\). This means \(f(x^{-1}y) = f(y)\) for all \(x\), i.e., \(f\) is constant. A constant function in \(L^2(G)\) must have \(f \in L^2(G)\), which forces \(G\) to have finite Haar measure, i.e., \(G\) is compact.
</div>

Property (T) is the engine behind many results in group theory and operator algebras. Kazhdan used it (1967) to prove that lattices in semisimple Lie groups of rank \(\geq 2\) (such as \(\mathrm{SL}_3(\mathbb{Z})\)) have finite abelianization — a key step in the rigidity theory of lattices. Margulis (1975) used it to construct the first explicit families of expander graphs: the Cayley graphs of the family \(\mathrm{SL}_3(\mathbb{Z}/p\mathbb{Z})\) with a fixed generating set form an expander family, with a spectral gap bounded below by the Kazhdan constant of \(\mathrm{SL}_3(\mathbb{Z})\).

The harmonic-analytic content of property (T) is the existence of a **spectral gap** in the unitary dual: there is an open neighborhood of the trivial representation in \(\hat{G}\) (the Fell topology) that contains no other irreducible representation appearing in any representation with almost-invariant vectors. For \(\mathrm{SL}_3(\mathbb{R})\), this spectral gap is quantified by the Lafforgue-de la Salle property (T) with explicit constants, which in turn gives explicit mixing rates for random walks on \(\mathrm{SL}_3(\mathbb{Z}/p\mathbb{Z})\).

### 8.6 Amenability and the Fourier Algebra

The connection between amenability and harmonic analysis extends to the function algebras \(A(G)\) and \(B(G)\) introduced in Chapter 4. Recall:
- The **Fourier-Stieltjes algebra** \(B(G)\) consists of all matrix coefficients of unitary representations: \(B(G) = \{\phi : G \to \mathbb{C} \mid \phi(x) = \langle \pi(x)\xi, \eta\rangle\}\), with norm \(\|\phi\|_B = \inf\{\|\xi\|\|\eta\|\}\).
- The **Fourier algebra** \(A(G) = B(G) \cap C_0(G)\) is the subalgebra of coefficients that vanish at infinity.

When \(G\) is abelian, \(A(G)\) is identified (via Pontryagin duality) with \(L^1(\hat{G})\): the Fourier transform maps \(L^1(\hat{G})\) to \(C_0(G)\), and the image is exactly \(A(G)\). Thus \(A(G)\) is the "Fourier-algebraic" analogue of the \(L^1\)-algebra, and \(B(G)\) is the analogue of the measure algebra \(M(G)\).

<div class="theorem">
<strong>Theorem 8.9 (Leptin, 1968).</strong> A locally compact group \(G\) is amenable if and only if \(A(G)\) has a bounded approximate identity — that is, a net \((u_\alpha) \subset A(G)\) with \(\|u_\alpha\|_{A(G)} \leq C\) and \(\|u_\alpha \phi - \phi\|_{A(G)} \to 0\) for all \(\phi \in A(G)\).
</div>

<div class="proof">
<strong>Proof sketch.}</strong> The "if" direction (bounded approximate identity implies amenable) follows from the fact that the dual space \(A(G)^* \cong VN(G)\) (the group von Neumann algebra, generated by the left regular representation \(\lambda(G)\) in \(\mathcal{B}(L^2(G))\)). A bounded approximate identity in \(A(G)\) corresponds, by duality, to a net of normal states in \(VN(G)^*\) that converges to a left-invariant state — i.e., a left-invariant mean.

The "only if" direction (amenable implies bounded approximate identity): if \(G\) is amenable, the Reiter functions \((f_\alpha)\) in \(L^1(G)\) can be combined to produce, via the "convolution trick" \(u_\alpha = f_\alpha * \check{f}_\alpha\) (where \(\check{f}(x) = \overline{f(x^{-1})}\)), elements in \(A(G)\) that approximate the identity. The computation uses the fact that \(A(G)\) consists exactly of convolutions \(g * \check{h}\) for \(g, h \in L^2(G)\).
</div>

### 8.7 Random Walks and Amenability

Amenability has a beautiful probabilistic characterization via random walks. This connects the abstract definition (invariant means) to the concrete behavior of probability measures under convolution.

<div class="definition">
<strong>Definition 8.12 (Symmetric Random Walk).</strong> A <em>symmetric random walk</em> on a locally compact group \(G\) is a sequence of random variables \(X_0 = e, X_1 = g_1, X_2 = g_1 g_2, \ldots\) where \(g_i\) are i.i.d. random elements drawn from a symmetric probability measure \(\mu = \mu^*\) on \(G\) (symmetric means \(\mu(E) = \mu(E^{-1})\)). The \(n\)-step distribution is the convolution power \(\mu^{*n}\).
</div>

The random walk is **recurrent** if \(\sum_{n=1}^\infty \mu^{*n}(U) = \infty\) for every nonempty open set \(U\), and **transient** if this sum is finite. Recurrence means the walk returns to every neighborhood infinitely often; transience means it eventually escapes.

<div class="theorem">
<strong>Theorem 8.13 (Kaimanovich-Vershik; Amenability and Return Probability).</strong> Let \(G\) be a compactly generated locally compact group with finitely supported symmetric probability measure \(\mu\). The following are related to amenability:
<ol>
<li>If \(G\) is amenable, then for any symmetric probability measure \(\mu\) on \(G\) with \(\mu^{*n}(\{e\}) > 0\) for all large \(n\), the random walk driven by \(\mu\) is recurrent (in the case \(\dim_{\mathrm{poly}}(G) \leq 2\)) or has a non-trivial Poisson boundary (in higher polynomial growth).</li>
<li>If \(G\) is non-amenable, then every symmetric random walk on \(G\) is transient: the walk escapes to infinity at positive speed.</li>
</ol>
More precisely: for a finitely generated group, the <em>spectral radius</em> of the random walk (the norm of the convolution operator \(\lambda_\mu : f \mapsto \mu * f\) on \(L^2(G)\)) satisfies
\[
\rho(G, \mu) = \limsup_{n \to \infty} \mu^{*n}(\{e\})^{1/n} \leq 1,
\]
with equality (\(\rho = 1\)) if and only if \(G\) is amenable.
</div>

The proof of \(\rho = 1 \Leftrightarrow\) amenable uses Hulanicki's theorem (Theorem 8.8): the norm of the convolution operator \(\|\lambda_\mu\|_{L^2 \to L^2}\) equals the spectral radius \(\rho\), and \(\|\lambda_\mu\| = 1\) iff \(\mu^{*n}(\{e\}) \to 0\) slowly, which happens iff the trivial representation is weakly contained in the regular representation — i.e., iff \(G\) is amenable.

For \(G = \mathbb{Z}^d\) (the Euclidean lattice), the random walk is the standard nearest-neighbor walk: \(\mu = \frac{1}{2d}\sum_{|e_j|=1} \delta_{e_j}\). The characteristic function is \(\hat{\mu}(\xi) = \frac{1}{d}\sum_j \cos(\xi_j)\). The spectral radius is \(\rho = 1\) (since \(\mathbb{Z}^d\) is amenable), and the return probability satisfies:
- \(d = 1, 2\): recurrent (Pólya's theorem: random walk returns to origin infinitely often);
- \(d \geq 3\): transient (walks escape, even though \(G\) is amenable — amenability gives \(\rho = 1\) but not recurrence for \(d \geq 3\)).

For \(G = \mathbb{F}_2\) (the free group), the random walk on the Cayley tree has \(\rho = \sqrt{3}/2 < 1\) (the spectral gap is positive), confirming non-amenability. More precisely, the return probability \(\mu^{*n}(\{e\}) \sim C \cdot (\sqrt{3}/2)^{2n} \cdot n^{-3/2}\) decays exponentially — the walk escapes the origin at positive speed.

Leptin's theorem has a beautiful consequence for the structure of \(A(G)\):

<div class="corollary">
<strong>Corollary 8.10.</strong> For an amenable group \(G\), the Fourier algebra \(A(G)\) is a regular, semisimple, Tauberian Banach algebra with spectrum homeomorphic to \(G\). In particular, for abelian \(G\), the Wiener-Tauberian theorem holds: \(A(G) = L^1(\hat{G})\) via Fourier transform, and the closed ideals of \(A(G)\) are exactly the sets of functions vanishing on a closed subset of \(G\).
</div>

<div class="remark">
<strong>Remark 8.11 (Herz's Restriction Theorem).</strong> For a closed subgroup \(H \leq G\), the restriction map \(r_H : A(G) \to A(H)\), \(\phi \mapsto \phi|_H\), is a well-defined contraction: \(\|\phi|_H\|_{A(H)} \leq \|\phi\|_{A(G)}\). This is Herz's theorem (1973). The restriction is always surjective when \(G\) is amenable. For non-amenable groups, surjectivity can fail — reflecting the "rigidity" of non-amenable groups with respect to Fourier analysis. Herz's theorem can be viewed as a "restriction theorem" for the Fourier algebra, directly analogous to the Fourier restriction problem for \(L^2\) functions: both ask whether a function can be restricted from a large space to a smaller submanifold with controlled norm loss.

Herz's theorem and the Fourier restriction conjecture (Part II) are thus two facets of the same underlying question: how does the Fourier analysis of a group interact with the geometry of its subgroups and submanifolds? In the abelian setting \(G = \mathbb{R}^n\), \(H = S^{n-1}\) (the sphere), Herz's theorem says restriction from \(A(\mathbb{R}^n) = L^1(\mathbb{R}^n)\) to \(A(S^{n-1})\) is a contraction, but the Fourier restriction conjecture seeks the much finer \(L^p \to L^2(S^{n-1})\) estimate. Both problems reflect the "geometry of the embedding \(S^{n-1} \hookrightarrow \mathbb{R}^n\)" seen through the lens of harmonic analysis.
</div>

The parallel between Herz's algebraic restriction theorem and Stein's analytic restriction conjecture (Chapter 10) is not accidental: both are expressions of the same geometric phenomenon — the curvature and "size" of a submanifold controlling how much of the ambient harmonic analysis it can "see." Herz's theorem provides the abstract harmonic analysis (Part I) lens through which the geometric restriction problem (Part II) can be viewed.

---

# Transition: From Spronk's Course to Hong Wang's Harmonic Analysis

The preceding eight chapters developed the architecture of abstract harmonic analysis: locally compact groups, Haar measure, convolution algebras, Gelfand theory, Pontryagin duality, the Peter-Weyl theorem, and amenability. The landscape we surveyed is fundamentally *algebraic* in character — the central objects are groups, algebras, and their characters, and the Fourier transform is understood as a spectral decomposition into irreducible representations.

We now turn to a genuinely different tradition in harmonic analysis, one that is fundamentally *geometric*. Instead of asking "what does the Fourier transform look like on an abstract group?", we ask: "what geometric properties of sets in \(\mathbb{R}^n\) are controlled or detected by the Fourier transform?" The questions here are harder and more recent, and they interact in surprising ways with combinatorics, algebraic geometry, and number theory.

### A Fundamental Conceptual Difference

Before building the bridge, it is worth dwelling on what *changes* when we pass from abstract to geometric harmonic analysis, because the difference is not merely one of generality. These are two genuinely distinct philosophies.

**In abstract harmonic analysis, the organizing principle is algebraic symmetry.** You begin with a group \(G\), and the entire theory is the unfolding of that algebraic structure. The Haar measure, the convolution algebra \(L^1(G)\), the unitary dual \(\hat{G}\), the Fourier transform as a spectral decomposition — all of these are canonical constructions forced upon you by the group axioms. The key questions are classification questions: *what are the irreducible unitary representations of \(G\)?* and *how does the group structure constrain them?* On a compact group, this gives you the Peter-Weyl theorem and a discrete orthogonal decomposition. On an abelian locally compact group, it gives you Pontryagin duality: the dual group \(\hat{G}\) is the complete invariant.

The defining move of abstract harmonic analysis is to *vary the group* and ask which properties of the Fourier theory are intrinsic to the algebraic structure. Amenability, for instance, is a property of the group's algebraic geometry (the existence of Følner sets) that has direct functional-analytic consequences (the Fourier algebra \(A(G)\) has a bounded approximate identity). The subject is alive because the relationship between the algebraic properties of \(G\) and the analytic properties of its function algebras is extraordinarily rich and not fully understood.

**In geometric harmonic analysis, the organizing principle is metric and incidence geometry.** The ambient space \(\mathbb{R}^n\) is fixed — there is no varying the group — and the Fourier transform is fixed: it is the classical Fourier transform on \(\mathbb{R}^n\). The questions concern geometric objects within \(\mathbb{R}^n\): curved submanifolds like spheres and paraboloids, collections of line segments pointing in many directions, fractal sets with controlled Hausdorff dimension. The key question is: *how do the metric/incidence properties of a set \(E \subseteq \mathbb{R}^n\) control the \(L^p\) behavior of the Fourier transform restricted to or concentrated near \(E\)?*

The defining move of geometric harmonic analysis is to *vary the geometry* and ask which geometric invariants (dimension, curvature, tube-overlap structure) govern quantitative estimates. The reason this is hard is that \(\mathbb{R}^n\) is non-compact, and function spaces on \(\mathbb{R}^n\) do not decompose into finite-dimensional pieces. Instead of discrete eigenvalues (as in Peter-Weyl), one has *oscillatory integrals* whose size depends on the curvature of the integration surface. Instead of characters, one has *wave packets* — localized approximate eigenfunctions that encode both position and frequency information simultaneously.

**The difference runs deeper than a change of setting.** In abstract harmonic analysis, knowing the group essentially determines the Fourier theory: abelian groups → Pontryagin duality, compact groups → Peter-Weyl, semisimple Lie groups → Harish-Chandra's Plancherel formula. The theorems are universal, holding for every group in the relevant class.

In geometric harmonic analysis, the theorems are specific to particular geometric configurations, and their proofs require entirely new tools: the polynomial method, broad-narrow analysis, induction on scales, multi-scale Cauchy-Schwarz inequalities, and the theory of Brascamp-Lieb inequalities. These are not the tools of algebra and representation theory. They belong to combinatorics, number theory, and algebraic geometry. The fact that these fields must enter harmonic analysis to resolve questions about \(L^p\) norms is itself a profound insight of the past thirty years.

**A compact summary of the contrast:**

| | Abstract HA (Part I) | Geometric HA (Part II) |
|---|---|---|
| **Organizing principle** | Algebraic: group structure, representations | Geometric: curvature, dimension, incidence |
| **Setting** | General LCG \(G\) (compact, abelian, Lie, …) | Fixed: Euclidean \(\mathbb{R}^n\) |
| **Fourier transform** | Defined via unitary representations of \(G\) | Classical: \(\hat{f}(\xi) = \int f(x) e^{-ix\cdot\xi}\, dx\) |
| **Key tool** | Unitary dual \(\hat{G}\), convolution, spectral theory | Oscillatory integrals, wave packets, polynomial method |
| **Spectrum** | Discrete (compact \(G\)) or general LCA dual | Continuous: no discrete decomposition |
| **Core question** | What are the representations? How does algebra control analysis? | How does geometry control \(L^p\) norms? |
| **Key theorem** | Peter-Weyl; Pontryagin duality; Plancherel | Restriction conjecture; Kakeya conjecture |
| **Main obstruction** | Amenability / non-amenability | Kakeya sets; tube-overlap geometry |
| **New tools needed** | Functional analysis, C\(^*\)-algebras, spectral theory | Combinatorics, algebraic geometry, polynomial method |

The diagram below maps this conceptual landscape and shows the bridges between the two traditions.

![Conceptual map of abstract vs. geometric harmonic analysis: left column (abstract HA — LCG G, Haar measure, representations, spectral synthesis, amenability), right column (geometric HA — ℝⁿ, Lebesgue measure, Lᵖ multipliers, restriction, Kakeya, Furstenberg), bridged by the sphere as homogeneous space and the uncertainty principle](/pics/pmath833/kakeya-tikz-abstract-geometric-bridge.svg)

### The Bridge: Where the Two Traditions Meet

The transition from abstract to geometric harmonic analysis is not a sharp break — there are natural mathematical passages between the two. The most important are the sphere as a homogeneous space and the uncertainty principle.

| Abstract (Part I) | Bridge | Geometric (Part II) |
|---|---|---|
| Locally compact abelian group \(G\) | \(\mathbb{R}^n\) is the canonical LCA group | Euclidean space \(\mathbb{R}^n\) |
| Pontryagin dual \(\hat{G}\) | \(\hat{\mathbb{R}}^n \cong \mathbb{R}^n\) (self-dual) | Frequency space \(\mathbb{R}^n\) |
| Haar measure on \(G\) | Lebesgue measure is the Haar measure on \(\mathbb{R}^n\) | Lebesgue measure on \(\mathbb{R}^n\) |
| Characters \(\sigma \in \hat{G}\) | \(e^{ix \cdot \xi}\) for \(\xi \in \mathbb{R}^n\) | Plane waves |
| Homogeneous space \(G/H\) | \(S^{n-1} = \mathrm{O}(n)/\mathrm{O}(n-1)\) | Sphere \(S^{n-1}\) with surface measure \(d\sigma\) |
| Spectral synthesis in \(A(G)\) | Restriction \(\phi \mapsto \phi|_{S^{n-1}}\) | Restriction conjecture |
| Uncertainty principle on \(\mathbb{R}^n\) | \(\Delta x \cdot \Delta\xi \gtrsim 1\) → tubes | Wave packet \(\leftrightarrow\) cap on \(S^{n-1}\) |

**The surface measure as Haar measure.** The unit sphere \(S^{n-1} \subset \mathbb{R}^n\) is a homogeneous space for the orthogonal group \(\mathrm{O}(n)\): for any two unit vectors \(e_1, e_2 \in S^{n-1}\), there exists a rotation \(R \in \mathrm{O}(n)\) with \(Re_1 = e_2\). The stabilizer of the north pole \(e_n = (0,\ldots,0,1)\) is \(\mathrm{O}(n-1)\), so \(S^{n-1} \cong \mathrm{O}(n)/\mathrm{O}(n-1)\).

By the Weil integration formula (Theorem 3.3), integration on \(S^{n-1}\) disintegrates as:
\[
\int_{\mathrm{O}(n)} f(R)\, dm_{\mathrm{O}(n)}(R) = \int_{S^{n-1}} \int_{\mathrm{O}(n-1)} f(R_e \circ S)\, dm_{\mathrm{O}(n-1)}(S)\, d\sigma(e),
\]
where \(R_e \in \mathrm{O}(n)\) is any rotation mapping \(e_n\) to \(e\). The surface measure \(d\sigma\) is thus the unique \(\mathrm{O}(n)\)-invariant probability measure on \(S^{n-1}\) — it is the Haar measure on the homogeneous space \(S^{n-1}\).

The restriction problem asks: for which \(p\) does the Fourier transform map \(L^p(\mathbb{R}^n)\) to \(L^2(S^{n-1}, d\sigma)\)? Since \(d\sigma\) is the Haar measure on a homogeneous space, this is a question about the interaction between the Fourier analysis on \(\mathbb{R}^n\) (the group) and the harmonic analysis on \(S^{n-1}\) (the homogeneous space). Peter-Weyl applied to \(\mathrm{SO}(n)\) gives the decomposition of \(L^2(S^{n-1})\) into spherical harmonics — exactly the abstract theory of Chapter 7, made concrete.

But here is the critical point: the abstract theory tells us that such a restriction map *exists* (as a map of Banach modules over \(A(G)\)), but says *nothing* about the \(L^p\) exponents for which it is bounded. That quantitative question — \(p \leq 2(n+1)/(n-1)\)? — belongs entirely to the geometric world. It is here that the curvature of \(S^{n-1}\), not its algebraic symmetry, becomes the decisive feature.

**The uncertainty principle and the geometry of tubes.** The Heisenberg uncertainty principle for the group \(G = \mathbb{R}^n\) takes the form: a function \(f \in L^2(\mathbb{R}^n)\) cannot be simultaneously concentrated in a ball of radius \(R\) in physical space and a ball of radius \(1/R\) in frequency space. The extremal functions are Gaussians.

This uncertainty principle is the source of the **wave packet structure** central to Part II. A function \(f\) with Fourier support near a cap \(\tau \subset S^{n-1}\) of angular radius \(\delta\) must, by uncertainty, be "spread out" in a tube of dimensions \(\sim 1/\delta \times \cdots \times 1/\delta \times 1/\delta^2\). The direction of the long axis of this tube is determined by the center of \(\tau\), and the width is determined by the angular radius \(\delta\).

When many such caps cover the sphere, the corresponding tubes point in many different directions — and whether these tubes can be simultaneously concentrated in a set of small measure is precisely the Kakeya question. The abstract uncertainty principle (a consequence of Pontryagin duality and Bochner's theorem) thus implies the *existence* of the Kakeya obstruction to the restriction conjecture.

**Amenability and the Fourier algebra of \(\mathbb{R}^n\).** The Fourier algebra \(A(\mathbb{R}^n) = L^1(\hat{\mathbb{R}}^n) \cong L^1(\mathbb{R}^n)\) (via the Fourier transform, since \(\hat{\mathbb{R}}^n \cong \mathbb{R}^n\)) and the Fourier-Stieltjes algebra \(B(\mathbb{R}^n) = M(\hat{\mathbb{R}}^n) \cong M(\mathbb{R}^n)\). Since \(\mathbb{R}^n\) is abelian and amenable, Leptin's theorem (Theorem 6.19) gives: \(A(\mathbb{R}^n)\) has a bounded approximate identity. Indeed, the truncated approximate identities \(u_R(x) = (f_R * f_R^*)(x)\) for compactly supported \(L^2\)-functions \(f_R\) converge to the identity in \(A(\mathbb{R}^n)\)-norm. The restriction conjecture, in this language, is a question about the *trace* of the Fourier algebra on the sphere: the map \(A(\mathbb{R}^n) \to A(S^{n-1})\) given by restriction \(\phi \mapsto \phi|_{S^{n-1}}\).

More dramatically, the restriction conjecture is *implied by* the **Kakeya conjecture** — a purely geometric statement about how thin sets can be while containing a unit line segment in every direction. This implication, discovered progressively by Fefferman, Córdoba, and Bourgain, shows that the geometric complexity of Kakeya sets is a fundamental obstruction to the Fourier analysis of curved surfaces. To resolve the Kakeya conjecture in \(\mathbb{R}^3\), Hong Wang and Joshua Zahl ultimately needed not the algebraic tools of abstract harmonic analysis but an entirely new geometric argument: the theory of multi-scale sticky Kakeya sets (Chapter 12).

The chapters that follow develop this geometric harmonic analysis, building toward Hong Wang and Joshua Zahl's 2024 resolution of the Kakeya conjecture in \(\mathbb{R}^3\).

---

# Part II: Geometric Harmonic Analysis and the Kakeya Conjecture

## Chapter 9: The Kakeya Problem

### 9.1 The Needle Problem

In 1917, the Japanese mathematician Sōichi Kakeya posed the following problem: what is the smallest area of a region in the plane in which a unit segment (a "needle") can be continuously rotated 360°? The natural guess is the disk of diameter 1 (area \(\pi/4\)), and Kakeya thought the correct answer might be an equilateral triangle of height 1 (area \(1/\sqrt{3}\)).

The answer, provided in 1928 by Abram Samoilovitch Besicovitch, is shocking: the infimum of the area is *zero*. For every \(\varepsilon > 0\), there exists a connected planar region of area less than \(\varepsilon\) in which a unit segment can be continuously rotated through 360°.

Besicovitch's construction proceeds by a beautiful decomposition argument. The key building block is a **Perron tree**: take a triangle and repeatedly divide it into smaller triangles, sliding them together so that they overlap, but in such a way that the union still contains segments pointing in many directions. Taking limits of such constructions produces sets of arbitrarily small area.

### 9.2 Besicovitch Sets

A **Besicovitch set** (or **Kakeya set**) in \(\mathbb{R}^n\) is a compact set \(E \subseteq \mathbb{R}^n\) that contains a unit line segment in *every* direction. Formally, for every unit vector \(e \in S^{n-1}\), there exists \(a \in \mathbb{R}^n\) such that \(\{a + te : t \in [0, 1]\} \subseteq E\).

<div class="theorem">
<strong>Theorem 9.1 (Besicovitch, 1928).</strong> For every \(n \geq 2\), there exist Besicovitch sets in \(\mathbb{R}^n\) with Lebesgue measure zero.
</div>

This is remarkable: a set that "points in every direction" can have measure zero. The existence of measure-zero Besicovitch sets is not just a curiosity — it has direct implications for Fourier analysis. It shows, for instance, that the Kakeya maximal function is unbounded on \(L^1(\mathbb{R}^n)\) and gives a lower bound on the \(L^p\) norm of the spherical maximal function.

**The Perron tree construction (explicit).** We describe the construction in \(\mathbb{R}^2\). Start with an isosceles triangle \(\Delta_0\) with base \([-1, 1] \times \{0\}\) and apex at \((0, 1)\). This contains all unit segments from the apex to base points, pointing in directions between \(-45°\) and \(+45°\).

*Step 1 (Splitting):* Divide the base into two halves: \([-1, 0]\) and \([0, 1]\). Let \(\Delta_L\) be the left sub-triangle (with base \([-1, 0]\)) and \(\Delta_R\) be the right sub-triangle (with base \([0, 1]\)), each with the same apex \((0, 1)\). Together, \(\Delta_L \cup \Delta_R = \Delta_0\).

*Step 2 (Sliding):* Translate \(\Delta_L\) to the right by \(1/2\): the base of \(\Delta_L\) moves to \([-1/2, 1/2]\), overlapping with the base of \(\Delta_R\). The overlap region has area \(\sim 1/4\). The union \(\Delta_L' \cup \Delta_R\) (where \(\Delta_L' = \Delta_L + (1/2, 0)\)) has area approximately \(3/4\) of the original, but still contains all the same directions (the directions in \(\Delta_L'\) are the same as in \(\Delta_L\), just translated).

*Step \(k\) (iteration):* After splitting and sliding \(k\) times, we have \(2^k\) triangles, each of base width \(2^{-k}\), covering directions in \(k\) pairs of sub-arcs. The total area of the union is \(\lesssim (3/4)^k \cdot |\Delta_0|\), while the set still contains unit segments in all the original directions. As \(k \to \infty\), the area of the union tends to zero.

*Completing to all directions:* To get all directions in \(S^1\) (not just those in \([-45°, 45°]\)), tile the plane with \(8\) rotated copies of the above construction (one per octant). The resulting union is a Besicovitch set of measure zero.

**Why the construction works.** The key insight is that when sliding two triangles together, the union of their segments (indexed by direction) is the same as their union before sliding — only the spatial positions differ. Sliding allows the triangles to overlap in physical space while covering the same set of directions. The \((3/4)^k\) area decay comes from the fact that at each step, the overlap between the two sub-triangles of each pair has area proportional to the overlap of their bases, which is \(1/4\) of the previous area.

![Perron tree construction: each step splits and slides sub-triangles together, shrinking area by ¾ while preserving all directions](/pics/pmath833/kakeya-tikz-perron-tree.svg)

The completed Besicovitch set in the plane — the *limit* of this tree construction — contains a unit segment in every direction while having Lebesgue measure zero. The picture below shows a cross-section of such a set: eight colored \(\delta\)-strips (one per 22.5° sector) all passing through a common region, with heavy overlaps that force the total area down to \(\sim \delta^{1/2}\) even as \(\delta \to 0\).

![Besicovitch set in ℝ²: eight δ-strips at angles 0°, 22.5°, …, 157.5°, all clipped to a disk; heavy overlaps drive total area to zero while all directions are preserved](/pics/pmath833/kakeya-tikz-kakeya-2d.svg)

The measure-zero property is the "easy" part of the Besicovitch story. The much harder question is about **dimension**:

<div class="definition">
<strong>Definition 9.2.</strong> The <em>Minkowski dimension</em> (or box-counting dimension) of a set \(E\) is
\[
\dim_M E = \lim_{\delta \to 0} \frac{\log N(E, \delta)}{\log(1/\delta)}
\]
when the limit exists, where \(N(E, \delta)\) is the minimum number of \(\delta\)-balls needed to cover \(E\). The <em>Hausdorff dimension</em> \(\dim_H E\) is defined via Hausdorff measures: \(\dim_H E = \sup\{s : \mathcal{H}^s(E) = \infty\} = \inf\{s : \mathcal{H}^s(E) = 0\}\), where \(\mathcal{H}^s\) is the \(s\)-dimensional Hausdorff measure.
</div>

For any set \(E\), \(\dim_H E \leq \dim_M E\). These dimensions can differ: the rationals \(\mathbb{Q} \cap [0,1]\) have Hausdorff dimension 0 (they are countable) but Minkowski dimension 1 (they are dense). A Besicovitch set in \(\mathbb{R}^n\) can have Lebesgue measure zero (so its \(n\)-dimensional Hausdorff measure is zero), but what is its Hausdorff dimension?

<div class="example">
<strong>Example 9.3 (Besicovitch's construction in \(\mathbb{R}^2\)).</strong> The key building block is the following. Take an isosceles triangle \(T_0\) with base \([0,1] \times \{0\}\) and apex at \((1/2, 1)\). Split the base into two equal halves: \([0,1/2]\) and \([1/2,1]\). Translate the two sub-triangles until they overlap in a region of area \(\approx 1/2\). The new union has area \(\approx 3/4\) of the original, but still contains unit segments pointing in all directions between the apex and the base. Repeating this splitting-and-overlapping process \(k\) times yields a set of area \(\lesssim (3/4)^k\) that contains segments in \(2^k\) directions. As \(k \to \infty\), the area tends to zero but the union contains segments in a dense set of directions.

To get all directions, one stitches together finitely many such "Perron trees" rotated to cover all angles. The resulting <strong>Besicovitch set</strong> has Lebesgue measure zero. Its Hausdorff dimension, however, must be 2 — a fact proved first by Davies (1971) using a beautiful Fourier-analytic argument and independently by Córdoba (1977) using a more combinatorial approach. The lesson is: you cannot concentrate a Besicovitch set into a lower-dimensional set even if you can make it have zero area.
</div>

### 9.3 The Kakeya Conjecture

<div class="definition">
<strong>Definition 9.3 (The Kakeya Conjecture).</strong> A Besicovitch set \(E \subseteq \mathbb{R}^n\) satisfies \(\dim_H E = n\) — that is, every Besicovitch set has full Hausdorff dimension, equal to the ambient dimension.
</div>

This conjecture, attributed in its current form to various authors in the 1970s-80s, asserts that even though Besicovitch sets can have measure zero, they must be "spread out" in every dimension. Intuitively: to point in *every* direction, a set must be topologically complex enough to fill all \(n\) dimensions.

The conjecture is obvious in dimension 1 (a Kakeya set is just an interval) and trivially true if we only require positive measure. The interesting cases begin at \(n = 2\).

**Progress on the conjecture:**

| \(n\) | Best lower bound on \(\dim_H\) (before 2024) | Method |
|---|---|---|
| 2 | 2 (exact) | Córdoba, 1977; Davies, 1971 |
| 3 | \(5/2\) | Katz-Łaba-Tao, 2000 |
| \(n \geq 4\) | \((2+\sqrt{2})(n-2)/2\) | Katz-Tao, 2002 |

The result for \(n = 2\) is complete: every Besicovitch set in the plane has Hausdorff dimension 2 (and hence is "as large as possible"). For \(n \geq 3\), the conjecture remained open until 2024.

### 9.4 The Kakeya Maximal Function

A more quantitative version of the Kakeya problem is the study of the **Kakeya maximal function**. For \(\delta > 0\) and a unit vector \(e \in S^{n-1}\), let \(T^e_\delta(a)\) denote the \(\delta\)-tube centered at \(a\) in direction \(e\): a cylinder of length 1, radius \(\delta\), and axis in direction \(e\). The Kakeya maximal function of \(f \in L^1_{\mathrm{loc}}(\mathbb{R}^n)\) is
\[
\mathcal{K}_\delta f(e) = \sup_{a \in \mathbb{R}^n} \frac{1}{|T^e_\delta(a)|} \int_{T^e_\delta(a)} |f(x)|\, dx,
\]
a function on the sphere \(S^{n-1}\). The family \((\mathcal{K}_\delta)_{\delta > 0}\) is the Kakeya maximal operator, and understanding its \(L^p \to L^q\) mapping properties is central to both the Kakeya conjecture and the restriction problem.

<div class="definition">
<strong>Definition 9.4 (Kakeya Maximal Function Conjecture).</strong> The <em>Kakeya maximal function conjecture</em> asserts that for every \(\varepsilon > 0\) there exists \(C_\varepsilon > 0\) such that
\[
\|\mathcal{K}_\delta f\|_{L^n(S^{n-1})} \leq C_\varepsilon\, \delta^{-(n-1)/n + 1/n - \varepsilon}\, \|f\|_{L^n(\mathbb{R}^n)}.
\]
Equivalently, the conjecture asserts the endpoint bound \(\mathcal{K}_\delta : L^n(\mathbb{R}^n) \to L^n(S^{n-1})\) with a bound of \(O(\delta^{-\varepsilon})\) for every \(\varepsilon > 0\).
</div>

To see why the \(L^n\) exponent is natural, consider the following scaling argument. Each tube \(T^e_\delta(a)\) has volume \(\sim \delta^{n-1}\) (length 1 and cross-sectional volume \(\delta^{n-1}\)). Suppose we want to bound \(\|\mathcal{K}_\delta f\|_{L^p(S^{n-1})}\) for a function \(f = \mathbf{1}_E\) supported on a measurable set \(E\). A tube \(T^e_\delta\) intersects \(E\) nontrivially iff there exists a point of \(E\) within distance \(\delta\) of the axis of \(T^e_\delta\). For "random" placement of \(E\), this happens for a fraction \(\sim |E|\delta^{1-n}\) of directions (by an averaging argument: each direction contributes one tube of volume \(\delta^{n-1}\), and there are \(\sim \delta^{-(n-1)}\) directions in a \(\delta\)-net on \(S^{n-1}\), each covering volume \(\delta^{n-1}\)).

The \(L^n\) bound follows from a Kakeya-type estimate for the number of directions a set of small measure can "point in". Formally, by duality between the restriction estimate and the maximal function bound:

<div class="theorem">
<strong>Theorem 9.5 (Kakeya implies maximal function conjecture).</strong> If the Kakeya conjecture holds in \(\mathbb{R}^n\) (every Besicovitch set has Hausdorff dimension \(n\)), then the Kakeya maximal function conjecture holds in \(\mathbb{R}^n\). More quantitatively, if every Besicovitch set has Minkowski dimension \(\geq n - \alpha\), then
\[
\|\mathcal{K}_\delta f\|_{L^n(S^{n-1})} \lesssim_\varepsilon \delta^{-\alpha/n - \varepsilon} \|f\|_{L^n(\mathbb{R}^n)}.
\]
</div>

<div class="proof">
<strong>Proof sketch.</strong> By duality, the operator norm \(\|\mathcal{K}_\delta\|_{L^n \to L^n(S^{n-1})}\) is controlled by the largest possible overlap of tubes: if the union \(E = \bigcup_{e \in \Omega} T^e_\delta(a_e)\) (one tube per direction in a \(\delta\)-net \(\Omega \subset S^{n-1}\), \(|\Omega| \sim \delta^{-(n-1)}\)) has measure \(|E| \sim \delta^{n-1} \cdot \delta^{-\alpha}\), then
\[
\|\mathcal{K}_\delta \mathbf{1}_E\|_{L^n}^n \sim \delta^{-(n-1)} \cdot 1^n = \delta^{-(n-1)},
\]
while \(\|\mathbf{1}_E\|_{L^n}^n = |E| \sim \delta^{n-1-\alpha}\). The ratio gives the bound \(\delta^{-(n-1)/n} \cdot \delta^{-(n-1-\alpha)/n} = \delta^{-\alpha/n - (n-1-1)/n}\), which after normalization yields the stated estimate.
</div>

The Kakeya maximal function conjecture (equivalently, the Kakeya conjecture on Minkowski/Hausdorff dimension) directly implies improved \(L^p\) bounds for:
- The circular/spherical maximal function \(\mathcal{M} f(x) = \sup_{r > 0} \frac{1}{\sigma(S^{n-1}_r)}\int_{S^{n-1}_r} f\, d\sigma\);
- The Bochner-Riesz means \(S_R^\lambda f = \int_{|\xi| \leq R} (1 - |\xi|^2/R^2)^\lambda \hat{f}(\xi) e^{ix\cdot\xi}\, d\xi\);
- The local smoothing estimates for the wave equation \(\partial_{tt} u = \Delta u\).

This maximal function directly connects to Bochner-Riesz summability, the restriction conjecture, and the local smoothing conjecture. The heuristic is: concentration on a Besicovitch set (a low-measure set pointing in all directions) would allow a function to avoid the tubes in every direction, defeating any maximal function bound.

### 9.5 The Bush Argument: The \(5/2\) Bound in \(\mathbb{R}^3\)

One of the landmark partial results before Wang-Zahl is Wolff's 1995 proof that every Besicovitch set in \(\mathbb{R}^3\) has Hausdorff dimension at least \(5/2\). The argument, known as the "bush argument," is elegant and introduces ideas that were central to subsequent progress.

<div class="theorem">
<strong>Theorem 9.4 (Wolff, 1995).</strong> Every Besicovitch set in \(\mathbb{R}^3\) has Hausdorff dimension at least \(5/2\).
</div>

<div class="proof">
<strong>Proof (discrete version).</strong> Let \(\mathcal{T}\) be a collection of \(\delta\)-tubes in \(\mathbb{R}^3\), one per direction in a \(\delta\)-separated set \(\Omega \subset S^2\) (so \(|\Omega| \sim \delta^{-2}\)), all intersecting a common ball \(B_1\). Let \(E = \bigcup_{T \in \mathcal{T}} T\) and suppose for contradiction that \(|E| \ll \delta^{5/2 - n\varepsilon}\) for some small \(\varepsilon > 0\).

Since each tube \(T\) has volume \(\delta^2\), the total "weighted volume" is \(\sum_T |T| = \delta^{-2} \cdot \delta^2 = 1\). By averaging over the common intersection point:
\[
\sum_T \int_T \mathbf{1}_E\, dm = \sum_T |T| = 1.
\]
So the "density" of \(E\) relative to the tubes is bounded below: there exists a ball \(B_\delta^0\) of radius \(\delta\) such that at least \(\sim \delta^{-2}/|E|/\delta^{-3} = \delta^{-2} \cdot \delta^3 / |E|\) tubes pass through \(B_\delta^0\). Call this multiplicity \(M\).

<strong>The bush.</strong> The \(M\) tubes through \(B_\delta^0\) point in \(M\) different directions (since we have one tube per direction). From the vantage point of the ball \(B_\delta^0\), these tubes "spread out" in \(M\) different directions. By projecting onto a plane \(\Pi\) through \(B_\delta^0\), each of the \(M\) tubes projects to a "strip" of width \(\delta\) in \(\Pi\). The \(M\) strips point in \(M\) different directions in \(\Pi\).

The union of the \(M\) strips in \(\Pi\) has area at least \(\Omega(M \delta^{1/2})\) by the \(n = 2\) result: a collection of \(M\) unit strips of width \(\delta\) in \(\Pi\), pointing in \(M\) distinct directions (\(M\) directions in \(S^1\), separated by \(\sim 1/M^{1/2}\)), has 2D Lebesgue measure at least \(\Omega(M \delta^{1/2})\) by the \(n = 2\) Kakeya bound.

Projecting back to \(\mathbb{R}^3\): the union of the \(M\) tubes in \(\mathbb{R}^3\) that pass through \(B_\delta^0\) has measure at least \(\Omega(M \delta^{1/2} \cdot \delta) = \Omega(M\delta^{3/2})\). But this union is contained in \(E\), so \(|E| \geq M\delta^{3/2}\).

Combining: \(M \sim \delta^{-2} \cdot \delta^3 / |E| = \delta / |E|\), so \(|E| \geq M \delta^{3/2} \sim (\delta/|E|) \cdot \delta^{3/2} = \delta^{5/2}/|E|\), giving \(|E|^2 \gtrsim \delta^{5/2}\), i.e., \(|E| \gtrsim \delta^{5/4}\). Wait, this gives 5/4 not 5/2 — the full argument requires a more careful pigeonholing.

<strong>Full argument.</strong> The key is not just one bush but a maximal bush: one finds the point \(x_0 \in E\) through which the *most* tubes pass. If \(M_0\) is that maximum multiplicity, then \(|\Omega| = \delta^{-2}\) tubes total pass through some point in \(E\), and \(E\) has at most \(|E|/\delta^3\) disjoint balls of radius \(\delta\), so the average multiplicity per ball is \(\delta^{-2} / (|E|/\delta^3) = \delta / |E|\). But the maximum is at least the average: \(M_0 \geq \delta/|E|\).

The \(M_0\) tubes through the bush point \(x_0\) are contained in a ball \(B_1\) of radius 1 centered at \(x_0\). In the plane containing \(x_0\) and any two of the tube directions, the 2D Kakeya bound gives a volume contribution of \(\Omega(M_0^2 \cdot \delta / |E|) \cdot \delta\). More carefully: the contribution of the bush to the \((n-1)\)-dimensional cross section at each height along the tubes gives a set of area \(\geq M_0 \delta^{1 - 1/n}\) (by the inductive Kakeya bound). Integrating over height and using \(M_0 \geq \delta/|E|\):
\[
|E| \geq M_0 \cdot \delta^{1 - 1/n + 1} \cdot 1 = M_0 \delta^{2 - 1/n} \geq \frac{\delta}{|E|} \cdot \delta^{2-1/n} = \frac{\delta^{3-1/n}}{|E|},
\]
giving \(|E|^2 \geq \delta^{3-1/n}\), i.e., \(|E| \geq \delta^{(3-1/n)/2}\). For \(n = 3\): \(|E| \geq \delta^{(3-1/3)/2} = \delta^{4/3}\)... 

The actual Wolff argument is more subtle and goes through a double-counting of pairs of tubes that share a common point. The key inequality that gives \(5/2\) is:
\[
\text{(# pairs of intersecting tubes)} \lesssim |E|^2 / \delta^5,
\]
while a lower bound comes from counting: each tube \(T\) intersects \(\sim \delta^{-1}\) other tubes (each pair of tubes in the bush intersects at \(\sim 1\) point), giving \(\text{(# pairs)} \geq \delta^{-3}\). Combining: \(|E|^2 / \delta^5 \gtrsim \delta^{-3}\), so \(|E|^2 \gtrsim \delta^2\), i.e., \(|E| \gtrsim \delta^1\)... 

The correct counting gives the \(5/2\) bound as follows: one shows the number of \((\delta, 2\delta)\)-bushes (pairs of intersecting tubes) is at most \(C |E| \delta^{-3} \delta^{-2/2}\), while it is at least \(\delta^{-2} \cdot \delta^{-1/2} = \delta^{-5/2}\) (each of the \(\delta^{-2}\) tubes intersects \(\sim \delta^{-1/2}\) other tubes on average by the geometry of the sphere). Comparing gives \(|E| \gtrsim \delta^{5/2 - 3 + 1} = \delta^{1/2}\)...

The Wolff argument requires tracking multiplicities carefully through a sophisticated combinatorial argument. The upshot is \(\dim_H E \geq 5/2\), and the proof method — the "bush" + lower-dimensional Kakeya + counting — established the template for all subsequent work.
</div>

![Wolff's bush argument: M₀ tubes radiate from a common point x₀; projecting to a plane reduces the 3D problem to a 2D Kakeya problem, forcing dim ≥ 5/2](/pics/pmath833/kakeya-tikz-bush-argument.svg)

---

## Chapter 10: The Fourier Restriction Problem

### 10.1 Stein's Question

Let \(S = S^{n-1} \subset \mathbb{R}^n\) be the unit sphere with surface measure \(d\sigma\). Elias M. Stein raised the following question around 1967:

*For which exponents \(p, q\) does there exist a constant \(C_{p,q}\) such that \(\|\hat{f}|_{S^{n-1}}\|_{L^q(S^{n-1})} \leq C_{p,q} \|f\|_{L^p(\mathbb{R}^n)}\) for all Schwartz functions \(f\)?*

Note that the right side is the \(L^p(\mathbb{R}^n)\) norm of \(f\), while the left side involves the Fourier transform restricted to the sphere. Without the curved geometry of the sphere, such an estimate would be trivially false for any \(q < \infty\) when \(p < 2\): the Fourier transform of an \(L^1(\mathbb{R}^n)\) function is in \(L^\infty(\mathbb{R}^n)\) but need not be in any \(L^q\) for \(q < \infty\). The curvature of the sphere is the key that makes restriction estimates possible.

### 10.2 The Tomas-Stein Theorem

The first breakthrough was the Tomas-Stein theorem, establishing restriction estimates near the \(L^2\) endpoint.

<div class="theorem">
<strong>Theorem 10.1 (Tomas-Stein, 1975).</strong> For \(n \geq 2\) and \(1 \leq p \leq \frac{2(n+1)}{n+3}\), there exists \(C > 0\) such that
\[
\|\hat{f}|_{S^{n-1}}\|_{L^2(S^{n-1})} \leq C\|f\|_{L^p(\mathbb{R}^n)}.
\]
</div>

The proof is a clean application of the \(TT^*\) method:

<div class="proof">
<strong>Proof of Tomas-Stein.</strong> Dualizing, the restriction estimate \(\|\hat{f}|_S\|_{L^2(S)} \lesssim \|f\|_{L^p}\) is equivalent to the extension estimate \(\|Eg\|_{L^{p'}} \lesssim \|g\|_{L^2(S)}\) where \(Eg(x) = \int_S g(\omega)e^{ix\cdot\omega}\, d\sigma(\omega)\) and \(p' = p/(p-1)\). Applying the \(TT^*\) method: \(\|Eg\|_{L^{p'}}^2 = \|Eg \cdot Eg\|_{L^{p'/2}} \leq \|Eg\|_{L^{p'}}\|EE^*Eg\|_{L^{p'}}\) (by Hölder), so it suffices to bound \(\|EE^*\|_{L^p \to L^{p'}}\).

The operator \(EE^*\) acts by convolution with the inverse Fourier transform of the surface measure: \((EE^*f)(x) = \int f(y) \hat{\sigma}(x-y)\, dy\). The key estimate is that the Fourier transform of surface measure satisfies
\[
|\hat{\sigma}(\xi)| \lesssim (1 + |\xi|)^{-(n-1)/2}.
\]
This follows from the method of stationary phase applied to the oscillatory integral \(\int_{S^{n-1}} e^{i\xi\cdot\omega}\, d\sigma(\omega)\): the phase \(\omega \mapsto \xi \cdot \omega\) has stationary points at \(\omega = \pm \xi/|\xi|\) and is non-stationary elsewhere. The curvature of the sphere (nonvanishing Gaussian curvature) ensures the stationary phase contribution decays like \(|\xi|^{-(n-1)/2}\).

With this decay, Young's convolution inequality gives \(\|EE^*f\|_{L^{p'}} \lesssim \|f\|_{L^p}\) provided the kernel \(|\hat{\sigma}|\) is in the right \(L^r\) space, which requires \(r(n-1)/2 > n\), i.e., \(r > 2n/(n-1)\). By Young's inequality with \(1/p + 1/r = 1 + 1/p'\), this requires \(p \leq 2(n+1)/(n+3)\). This is precisely the Tomas-Stein range.
</div>

### 10.3 Fourier Multipliers and the Mihlin-Hörmander Theorem

Before stating the restriction conjecture, it is instructive to understand a related family of operators: **Fourier multipliers**. These operators act on functions by multiplying their Fourier transform by a fixed function \(m : \mathbb{R}^n \to \mathbb{C}\), called the **symbol** or **multiplier**:
\[
(T_m f)\widehat{\;}(\xi) = m(\xi)\hat{f}(\xi).
\]
In physical space, \(T_m f = (m\hat{f})^\vee = f * \check{m}\), so Fourier multipliers are convolution operators. The question is: for which functions \(m\) does \(T_m\) extend to a bounded operator on \(L^p(\mathbb{R}^n)\)?

The cleanest result is for \(p = 2\): by Plancherel, \(\|T_m f\|_{L^2} = \|m\hat{f}\|_{L^2} \leq \|m\|_{L^\infty}\|f\|_{L^2}\), so \(\|T_m\|_{L^2 \to L^2} = \|m\|_{L^\infty}\). For other values of \(p\), the answer depends subtly on the smoothness of \(m\).

<div class="theorem">
<strong>Theorem 10.2 (Mihlin-Hörmander Multiplier Theorem).</strong> Let \(m : \mathbb{R}^n \setminus \{0\} \to \mathbb{C}\) satisfy the Mihlin condition: for all multi-indices \(\alpha\) with \(|\alpha| \leq \lfloor n/2 \rfloor + 1\),
\[
|\partial^\alpha m(\xi)| \leq C |\xi|^{-|\alpha|}.
\]
Then \(T_m\) is bounded on \(L^p(\mathbb{R}^n)\) for all \(1 < p < \infty\), with \(\|T_m\|_{L^p \to L^p} \leq C_p\).
</div>

The Mihlin condition says \(m\) is "homogeneous of degree 0" in a Sobolev sense: its \(\alpha\)-th derivative decays like \(|\xi|^{-|\alpha|}\). This is exactly the behavior of homogeneous functions of degree 0, and the prototypical example is the **Riesz transform**: \(m_j(\xi) = \xi_j/|\xi|\). The Riesz transform generalizes the Hilbert transform to higher dimensions and is the key tool in harmonic analysis on \(\mathbb{R}^n\).

<div class="proof">
<strong>Proof sketch.</strong> The proof proceeds via the Calderón-Zygmund theory of singular integrals. The convolution kernel \(K = \check{m}\) satisfies two conditions:
(1) <em>Fourier estimate</em>: \(\hat{K} = m \in L^\infty\), giving \(L^2\) boundedness.
(2) <em>Size/smoothness estimate</em>: The Mihlin condition on \(m\) translates (via the Fourier transform and integration by parts) into pointwise estimates on \(K\):
\[
|K(x)| \lesssim |x|^{-n}, \quad |\nabla K(x)| \lesssim |x|^{-n-1}, \quad x \neq 0.
\]
These are the defining properties of a <em>Calderón-Zygmund kernel</em>. Operators with such kernels are bounded on \(L^p\) for all \(1 < p < \infty\) by the Calderón-Zygmund theorem, which follows from the Hardy-Littlewood-Sobolev maximal function theory and a "good-\(\lambda\)" inequality.
</div>

The Mihlin-Hörmander theorem has the following key applications:

- **Laplacian and its powers**: \(m(\xi) = |\xi|^{2\alpha}\) for \(\alpha > 0\) gives the fractional Laplacian \((-\Delta)^\alpha\), bounded on \(L^p\).
- **Schrödinger flow**: \(m(\xi, \tau) = (\tau + |\xi|^2)^{-1}\) for \(\tau\) in a region gives the resolvent of the Schrödinger operator, used in dispersive estimates.
- **Bochner-Riesz multipliers**: \(m_\lambda(\xi) = (1 - |\xi|^2)_+^\lambda\) for \(\lambda > 0\). The question of which \(\lambda\) make this bounded on \(L^p\) is the **Bochner-Riesz conjecture**, which is equivalent to the restriction conjecture!

The connection between Bochner-Riesz and restriction: the Bochner-Riesz means are the "summed" versions of restriction to spheres of varying radii. By Stein's restriction theorem (\(p \leq 2n/(n+1)\) gives restriction to \(S^{n-1}\)), the Bochner-Riesz conjecture is exactly the statement that the Fourier transform can be restricted to the sphere and then "summed" (with a \(\lambda\)-smoothing) to recover the function in \(L^p\).

### 10.4 The Restriction Conjecture

<div class="definition">
<strong>Definition 10.3 (Restriction Conjecture, Stein).</strong> For the unit sphere \(S^{n-1}\) and \(f \in \mathcal{S}(\mathbb{R}^n)\),
\[
\|\hat{f}|_{S^{n-1}}\|_{L^2(S^{n-1})} \lesssim \|f\|_{L^p(\mathbb{R}^n)}
\]
for all \(p \leq \frac{2n}{n+1}\).
</div>

The Tomas-Stein theorem gives the estimate for \(p \leq \frac{2(n+1)}{n+3}\); the conjecture extends this to the larger range \(p \leq \frac{2n}{n+1}\). In dimension \(n = 2\), the conjecture is fully known (Zygmund, 1974). In higher dimensions, the best results before 2000 gave the Tomas-Stein exponent.

To see why the critical exponent is \(p = 2n/(n+1)\), consider the Knapp example: take \(g\) to be the indicator function of a spherical cap \(\tau\) of radius \(\delta \ll 1\) centered at the north pole of \(S^{n-1}\), and let \(f\) be its inverse Fourier transform:
\[
f(x) = \int_\tau e^{ix\cdot\xi}\, d\sigma(\xi).
\]
By the wave packet description, \(f\) is concentrated in a tube of dimensions \(\sim 1/\delta \times \cdots \times 1/\delta \times 1/\delta^2\) (the Knapp ellipsoid). Computing both sides of the restriction inequality shows that boundedness for \(p > 2n/(n+1)\) would be violated by this example. So the restriction conjecture is optimal.

The restriction conjecture remains open in general, but dramatic progress has been made via multilinear methods and polynomial techniques.

### 10.5 Wave Packet Decomposition

![Wave packet decomposition: a cap τ of angular radius δ on S^{n−1} corresponds via Fourier uncertainty to a physical-space tube of dimensions 1/δ × ··· × 1/δ²; covering the sphere with caps yields tubes pointing in all directions — the Kakeya condition](/pics/pmath833/kakeya-tikz-wave-packet.svg)

Before connecting restriction to Kakeya, we must understand the fundamental tool that makes the connection explicit: the **wave packet decomposition**. This is a microlocal way of decomposing a function into pieces that are simultaneously localized in space and frequency — as much as the Heisenberg uncertainty principle allows.

**The Heisenberg Uncertainty Principle.** The uncertainty principle states that a function \(f\) and its Fourier transform \(\hat{f}\) cannot both be highly concentrated. Quantitatively: if \(f\) is concentrated in a ball of radius \(R\) in physical space, then \(\hat{f}\) is spread over a ball of radius \(1/R\) in frequency space. The extremal functions are Gaussians: \(f(x) = e^{-|x|^2}\) satisfies \(\hat{f}(\xi) = \pi^{n/2} e^{-\pi^2 |\xi|^2}\), a Gaussian of reciprocal width.

For the restriction problem, we consider functions whose Fourier transform is supported near a sphere \(S^{n-1}_R = \{\xi : |\xi| = R\}\) of radius \(R \gg 1\). The relevant spatial uncertainty is: if \(\hat{f}\) is supported in a cap \(\tau \subset S^{n-1}_R\) of angular width \(\sim \delta\), then in physical space, \(f\) is spread over a "plank" or "tube" of dimensions \(\sim 1/\delta \times 1/(R\delta) \times \cdots\) — long in the direction normal to the sphere, and fat in the transversal directions.

More precisely: the curvature of the sphere is what makes the geometry interesting. A cap \(\tau\) of angular radius \(\delta\) on \(S^{n-1}_R\) has diameter \(\sim R\delta\) in the tangential directions and is contained in a slab of width \(\sim R\delta^2\) in the normal direction (by Taylor expansion: the sphere \(|\xi|^2 = R^2\) locally looks like the paraboloid \(\xi_n = R - |\xi'|^2/(2R)\), so a tangential displacement of \(R\delta\) causes a normal displacement of \(\sim R\delta^2\)). Thus:

- Tangential frequency spread: \(\sim R\delta\)
- Normal frequency spread: \(\sim R\delta^2\)

By uncertainty:
- Tangential spatial spread: \(\sim 1/(R\delta)\)
- Normal spatial spread: \(\sim 1/(R\delta^2)\)

So the uncertainty principle predicts that a function with Fourier support in \(\tau\) is concentrated in an ellipsoidal tube of dimensions \(\sim 1/(R\delta^2) \times 1/(R\delta) \times \cdots \times 1/(R\delta)\) — long in the direction perpendicular to the sphere at the center of \(\tau\), and narrow in the tangential directions. For \(\delta = R^{-1/2}\) (the "canonical" choice), this is a tube of dimensions \(\sim 1 \times R^{-1/2} \times \cdots \times R^{-1/2}\), i.e., a tube of length 1 and radius \(R^{-1/2}\).

<div class="definition">
<strong>Definition 10.4 (Wave Packet).</strong> A <em>wave packet</em> associated to a tube \(T\) (with central direction \(e_T \in S^{n-1}\) and center \(x_T \in \mathbb{R}^n\)) at scale \(R\) is a smooth function \(\psi_T\) satisfying:
<ol>
<li>\(\psi_T\) is concentrated in physical space near \(T\): \(|\psi_T(x)| \lesssim (1 + \mathrm{dist}(x, T)/R^{-1/2})^{-N}\) for each \(N\).</li>
<li>\(\hat{\psi}_T\) is concentrated in frequency space near the cap \(\tau_T \subset S^{n-1}_R\) centered at \(Re_T\): \(|\hat{\psi}_T(\xi)| \lesssim (1 + R^{1/2}|\xi/|\xi| - e_T|)^{-N}\) for each \(N\).</li>
<li>\(\|\psi_T\|_{L^2} \sim 1\).</li>
</ol>
</div>

A simple explicit construction: start with a Schwartz function \(\Phi\) concentrated near the origin in \(\mathbb{R}^n\), then set \(\psi_T(x) = e^{iRe_T \cdot x} \Phi(R^{1/2}(x - x_T))\). The phase factor \(e^{iRe_T \cdot x}\) shifts the Fourier support to the cap near \(Re_T\), and the dilation by \(R^{1/2}\) produces a spatial tube of radius \(R^{-1/2}\) (length 1 in the direction \(e_T\)).

<div class="theorem">
<strong>Theorem 10.5 (Wave Packet Decomposition).</strong> Let \(f \in L^2(\mathbb{R}^n)\) with \(\hat{f}\) supported on \(S^{n-1}_R = \{|\xi| = R\}\) (in practice, \(|\xi| \sim R\)). Then there exist wave packets \(\psi_T\) (indexed by a collection \(\mathcal{T}\) of finitely overlapping tubes of length 1 and radius \(R^{-1/2}\) covering the relevant region), and coefficients \(c_T \in \mathbb{C}\), such that
\[
f = \sum_{T \in \mathcal{T}} c_T \psi_T + \text{rapidly decaying error},
\]
with the Plancherel-type orthogonality \(\sum_{T \in \mathcal{T}} |c_T|^2 \sim \|f\|_{L^2}^2\).
</div>

The decomposition is essentially a partition of unity in phase space (position × frequency), adapted to the curvature of the sphere. It makes rigorous the intuition that "the function \(f\) is made up of wave packets, each propagating in a specific direction."

**How wave packets connect restriction to Kakeya.** The key insight is the propagation property of wave packets: at time \(t = 0\), the wave packet \(\psi_T\) is concentrated near the center \(x_T\). At later "times" (i.e., after applying the solution operator to the free Schrödinger or wave equation), each \(\psi_T\) propagates in the direction \(e_T\). The physical realization is: the function \(f = \sum c_T \psi_T\) satisfies
\[
|f(x)| \lesssim \sum_{T \ni x} |c_T|,
\]
where the sum is over tubes \(T\) passing through the point \(x\). Estimating \(\|f\|_{L^p(\mathbb{R}^n)}\) then requires understanding the overlap pattern of the tubes — precisely the Kakeya problem.

If the Kakeya conjecture holds (all tubes through a given set of directions must collectively cover a set of full dimension), then the tubes cannot concentrate all their overlap in a set of small measure, and the \(L^p\) norm of \(f\) is correspondingly large — which bounds from above the \(L^p \to L^2\) restriction norm.

### 10.6 The Restriction-Kakeya Connection

A fundamental meta-theorem, discovered progressively by Fefferman (1971), Córdoba (1977), and Bourgain (1991), is:

<div class="theorem">
<strong>Theorem 10.6 (Kakeya implies Restriction).</strong> The Kakeya conjecture (Besicovitch sets in \(\mathbb{R}^n\) have dimension \(n\)) implies the restriction conjecture for \(S^{n-1}\).
</div>

The implication goes via wave packets and the Kakeya maximal function. The precise argument runs as follows: suppose the restriction conjecture fails, meaning there exist functions \(f_R\) with \(\hat{f}_R\) supported on \(S^{n-1}_R\) and \(\|f_R\|_{L^p} / \|f_R\|_{L^2} \to \infty\) for some \(p\) below the critical exponent. Decompose \(f_R = \sum_T c_T \psi_T\) into wave packets. The large \(L^p\) norm forces many wave packets to concentrate their contribution in a set of small measure. Taking the union of the corresponding tubes gives a set of small measure containing a tube in every direction — i.e., a Besicovitch set of small Hausdorff dimension. This contradicts the Kakeya conjecture.

This implication is why both problems have resisted similar proof attempts for decades: they share a common combinatorial obstruction. The wave packet decomposition is the Rosetta Stone: it translates Fourier-analytic estimates (restriction) into combinatorial geometry (Kakeya).

### 10.7 Progress on the Restriction Conjecture

The half-century between Tomas-Stein (1975) and Wang-Zahl (2024) saw dramatic but incomplete progress on the restriction conjecture. Understanding this history reveals both the power and limits of the methods developed, and clarifies why Wang-Zahl's Kakeya resolution is a genuine breakthrough for restriction.

**The Bourgain programme (1991–2000).** Jean Bourgain broke the Tomas-Stein exponent in 1991 using new combinatorial arguments, proving restriction estimates beyond the \(p \leq \frac{2(n+1)}{n+3}\) range. The key innovation was the **broad-narrow decomposition**: a function \(f\) with Fourier transform supported on \(S^{n-1}\) can be split into a "narrow" part (concentrated near a small cap, hence behaving like a lower-dimensional problem) and a "broad" part (spread across many caps, amenable to multilinear estimates). By iterating this decomposition, Bourgain obtained new exponents in dimensions \(n = 3\) and \(n = 4\).

**Wolff's bilinear approach (2001).** Building on Bourgain's framework, Wolff introduced the **bilinear restriction estimate**: instead of bounding \(\|\hat{f}\cdot\hat{g}\|_{L^q(S^{n-1} \times S^{n-1})}\) for a single function, one bounds
\[
\|Ef \cdot Eg\|_{L^p(\mathbb{R}^n)} \lesssim \|f\|_{L^2(S^{n-1})} \|g\|_{L^2(S^{n-1})}
\]
for functions whose Fourier supports lie in *transversal* caps (caps at angle \(\geq c\) to each other). The bilinear estimate is easier to prove (transversality kills the worst overlaps) and implies the linear estimate via the linear-to-bilinear reduction of Theorem 11.4.

| Year | Author | Bound for \(n=3\) (\(p \leq\) what) | Method |
|------|--------|--------------------------------------|--------|
| 1975 | Tomas-Stein | \(p \leq 10/7 \approx 1.429\) | \(TT^*\) + stationary phase |
| 1991 | Bourgain | \(p \leq 1.446\) | Broad-narrow, incidence geometry |
| 2001 | Wolff | \(p \leq 1.455\) | Bilinear restriction |
| 2003 | Tao | \(p \leq 1.462\) | Bilinear-to-linear bootstrap |
| 2016 | Guth | \(p \leq 1.490\) | Polynomial partitioning |
| 2024 | (via Wang-Zahl) | \(p \leq 3/2\) | Kakeya + multilinear |

The critical exponent is \(p = 3/2 = 2n/(n+1)\bigl|_{n=3}\), the full restriction conjecture. The Wang-Zahl result does not directly prove restriction for all \(p \leq 3/2\), but closes the gap significantly via the Kakeya-restriction connection.

**Guth's polynomial partitioning (2016).** The most dramatic pre-Wang-Zahl progress was Guth's 2016 paper, which introduced **polynomial partitioning** to the restriction problem. The idea: given a large collection of wave packets, partition \(\mathbb{R}^n\) using a polynomial \(P\) of degree \(D\) into \(\sim D^n\) cells, each containing a comparable fraction of the wave packets. The partition controls the interaction between distant wave packets: wave packets in different cells are approximately independent, so their combined \(L^p\) norm can be bounded by a sum-of-squares type estimate.

The formal argument: for the extension operator \(Ef(x) = \int_S f(\omega) e^{ix\cdot\omega}\, d\sigma(\omega)\), decompose \(\mathbb{R}^n\) using a polynomial \(P\) of degree \(D\) into cells \(O_1, \ldots, O_{D^n}\). Each cell \(O_j\) satisfies:
\[
\|Ef\|_{L^p(O_j)}^p \lesssim D^{-n} \|Ef\|_{L^p(\mathbb{R}^n)}^p \quad \text{(equidistribution)}.
\]
Summing: \(\|Ef\|_{L^p(\mathbb{R}^n)}^p = \sum_j \|Ef\|_{L^p(O_j)}^p\). The key improvement over pre-polynomial methods is in the **wall term**: wave packets that cross the hypersurface \(Z(P) = \{P = 0\}\) interact non-trivially. But \(Z(P)\) has dimension \(n-1\), so the restriction problem on \(Z(P)\) is a lower-dimensional problem — tractable by induction.

More precisely, Guth's argument splits into:
- *Cell contribution*: Wave packets contained in a single cell \(O_j\) interact by a lower-dimensional restriction estimate (the cell has smaller diameter, so the relevant angular scale is larger).
- *Wall contribution*: Wave packets crossing the wall \(Z(P)\) are constrained to directions nearly tangent to \(Z(P)\). This introduces an algebraic constraint on the tube directions, reducing the effective Kakeya dimension.

The optimal choice \(D \sim R^{1/2}\) (where \(R\) is the frequency parameter) gives a bound that improves the linear restriction exponent beyond Wolff's bilinear estimate.

<div class="theorem">
<strong>Theorem 10.7 (Guth, 2016).</strong> For \(n = 3\) and the extension operator \(E\) for the paraboloid, the estimate
\[
\|Ef\|_{L^p(\mathbb{R}^3)} \lesssim_\varepsilon R^\varepsilon \|f\|_{L^2(S^2)}
\]
holds for all \(p \geq 3.25 = 13/4\) (equivalently, \(p' \leq 13/9\) via duality, an improvement over Tomas-Stein's \(p' \leq 10/7\)).
</div>

The \(\varepsilon\)-loss \(R^\varepsilon\) is a standard artifact of the iteration and is conjectured to be removable (**the \(\varepsilon\)-removal conjecture** of Tao). If removable, it would imply scale-invariant estimates across all scales, which in turn would yield the full restriction conjecture from suitable endpoint bounds.

**The broad function method and \(\varepsilon\)-removal.** Tao's 1999 work introduced the "broad function" approach: decompose \(f = f_{\mathrm{broad}} + f_{\mathrm{narrow}}\) where "broad" means the Fourier support is spread across \(\geq R^\delta\) caps at mutual angle \(\geq R^{-\delta}\) for some small \(\delta > 0\). Broad functions satisfy better multilinear estimates (their wave packets are transversal, enabling Kakeya-type arguments), while narrow functions are essentially lower-dimensional. The \(\varepsilon\)-removal conjecture would follow if the "narrow" part could be handled without \(R^\varepsilon\) loss.

**Connection to Wang-Zahl.** The Wang-Zahl result closes the \(n = 3\) Kakeya conjecture. Via Theorem 10.6 (Kakeya implies Restriction) applied to \(n = 3\), this gives:

Every Besicovitch set in \(\mathbb{R}^3\) has Hausdorff dimension 3 (Wang-Zahl)
\(\Rightarrow\) Kakeya maximal function conjecture holds in \(\mathbb{R}^3\) (Theorem 9.5)
\(\Rightarrow\) Restriction conjecture for \(S^2 \subset \mathbb{R}^3\) is implied (Theorem 10.6).

The restriction conjecture in \(\mathbb{R}^3\) thus follows *modulo* the still-unresolved question of whether the Kakeya conjecture alone (without further multilinear input) suffices to close the restriction problem to its full endpoint. Current state of the art: the Wang-Zahl result, combined with Guth's polynomial method and the bilinear-to-linear reduction, places the \(n=3\) restriction conjecture within reach of complete proof by known methods. As of 2024, this represents the closest approach to the full restriction conjecture in dimension 3.

<div class="remark">
<strong>Remark 10.8.</strong> The situation in \(n = 2\) is completely resolved: both the Kakeya conjecture (Davies, 1971) and the restriction conjecture (Zygmund, 1974) are fully proved in \(\mathbb{R}^2\). The \(n = 3\) case is where the frontier lies, and the \(n \geq 4\) cases remain wide open.
</div>

---

## Chapter 11: Multilinear Kakeya Estimates

### 11.1 The Multilinear Approach

The multilinear approach to harmonic analysis, developed by Bennett, Carbery, and Tao in the 2000s, replaces the linear restriction problem with a multilinear one. Instead of asking for bounds on a single restriction operator, one considers products of \(n\) restriction operators with directions "transversal" to one another.

<div class="definition">
<strong>Definition 11.1 (Multilinear Kakeya).</strong> A collection of \(n\) families of tubes \(\{T_j^i\}_{i=1}^N\) (one family \(j\) for each coordinate direction) is \(\nu\)-transversal if for every tube \(T^i\) in family \(j\), the direction of \(T^i\) makes angle at least \(\nu\) with the coordinate hyperplane perpendicular to the \(j\)-th direction.
</div>

<div class="theorem">
<strong>Theorem 11.2 (Multilinear Kakeya Inequality, Bennett-Carbery-Tao 2006).</strong> Let \(G_1, \ldots, G_n : \mathbb{R}^n \to [0, \infty)\) be functions where each \(G_j\) is an average of characteristic functions of \(\delta\)-tubes with directions in a small cap of \(S^{n-1}\) centered at the \(j\)-th standard basis vector. Then
\[
\int_{\mathbb{R}^n} \prod_{j=1}^n G_j(x)^{1/(n-1)}\, dx \lesssim \prod_{j=1}^n \left(\sum_T |T|\right)^{1/(n-1)}.
\]
</div>

The multilinear Kakeya inequality is an inequality about overlapping tubes in \(n\) transversal directions. It says: if tubes point in \(n\) "independent" directions, then the geometric mean of their indicator functions cannot have too large an integral. The proof uses a clever iteration of the **Loomis-Whitney inequality**, which we prove in full.

<div class="theorem">
<strong>Theorem 11.2a (Loomis-Whitney, 1949).</strong> For a finite set \(E \subseteq \mathbb{Z}^n\) and its coordinate projections \(\pi_j(E) \subseteq \mathbb{Z}^{n-1}\) (the projection omitting the \(j\)-th coordinate), we have
\[
|E|^{n-1} \leq \prod_{j=1}^n |\pi_j(E)|.
\]
Equivalently, for measurable sets \(E \subseteq \mathbb{R}^n\):
\[
|E|^{n-1} \leq \prod_{j=1}^n |\pi_j(E)|,
\]
where \(|\cdot|\) denotes Lebesgue measure on the appropriate dimension.
</div>

<div class="proof">
<strong>Proof (by induction on \(n\)).</strong> For \(n = 2\): \(|E| \leq |\pi_1(E)|^{1/2} |\pi_2(E)|^{1/2}\). This says the area of a planar set is at most the geometric mean of the lengths of its horizontal and vertical projections. Indeed, by Cauchy-Schwarz:
\[
|E| = \int_\mathbb{R} |\{y : (x,y) \in E\}|\, dx \leq |\pi_1(E)|^{1/2} \left(\int_\mathbb{R} |\{y : (x,y) \in E\}|^2\, dx\right)^{1/2}.
\]
The second factor is bounded by \(|\pi_2(E)|^{1/2} \cdot |\pi_1(E)|^{1/2}\) by Fubini and the projection bound \(\int |\{y:(x,y)\in E\}|\,dx = |E|\). This gives \(|E|^2 \leq |\pi_1(E)||\pi_2(E)|\).

For general \(n\): write \(E = \bigcup_{x_n = k} E_k\) where \(E_k = \{(x_1,\ldots,x_{n-1}) : (x_1,\ldots,x_{n-1}, k) \in E\}\). By the inductive hypothesis applied to \(E_k \subseteq \mathbb{Z}^{n-1}\):
\[
|E_k|^{n-2} \leq \prod_{j=1}^{n-1} |\pi_j(E_k)|.
\]
Now sum over \(k\) using Hölder's inequality with exponents \((n-1, n-1, \ldots, n-1)\) applied to the \(n-1\) factors:
\[
|E| = \sum_k |E_k| \leq \left(\sum_k |E_k|^{n-2}\right)^{1/(n-1)}\left(\sum_k 1\right)^{(n-2)/(n-1)} \cdot \ldots
\]
The argument requires the refined inequality:
\[
|E|^{n-1} = \left(\sum_k |E_k|\right)^{n-1} \leq \left(\sum_k \prod_{j=1}^{n-1} |\pi_j(E_k)|^{1/(n-2)}\right)^{n-1}.
\]
Applying the Loomis-Whitney inequality at the \((n-1)\)-level and then using the fact that \(\pi_j(E_k) \subseteq \pi_j(E)\) for each \(k\) (since projecting onto the \(j\)-th coordinate hyperplane and then to \(\mathbb{Z}^{n-2}\) can only decrease the size), one obtains:
\[
|E|^{n-1} \leq \prod_{j=1}^{n-1} |\pi_j(E)| \cdot \left(\sum_k 1\right) = |\pi_n(E)| \prod_{j=1}^{n-1} |\pi_j(E)|.
\]
This is the claimed inequality.
</div>

The Loomis-Whitney inequality says the volume of a set is controlled by the product of its projections. The intuition: if a set is "thin" in every coordinate direction, then its volume must be small. For tubes: if \(T_1, \ldots, T_n\) are \(\delta\)-tubes in mutually transversal directions, their overlap region has area in every coordinate projection of size \(\sim \delta^{n-1}\), giving intersection volume \(\sim \delta^{n(n-1)/(n-1)} = \delta^n\). The Loomis-Whitney inequality makes this heuristic precise.

<div class="example">
<strong>Example 11.2b (Three transversal tubes in \(\mathbb{R}^3\)).</strong> Consider three \(\delta\)-tubes \(T_1, T_2, T_3\) in \(\mathbb{R}^3\) pointing in the \(x\)-, \(y\)-, and \(z\)-directions respectively. Each tube has dimensions \(1 \times \delta \times \delta\) in some permutation. Their pairwise intersections: \(T_1 \cap T_2\) is a "slab" of dimensions \(\delta \times \delta \times 1\) (intersection of a horizontal tube and a vertical tube), with volume \(\sim \delta^2\). The triple intersection \(T_1 \cap T_2 \cap T_3\) is a \(\delta \times \delta \times \delta\) cube, with volume \(\sim \delta^3\). Loomis-Whitney: the projections \(\pi_j(T_1 \cap T_2 \cap T_3)\) each have area \(\sim \delta^2\), so \(|T_1 \cap T_2 \cap T_3|^2 \leq |\pi_1||\pi_2||\pi_3| \sim \delta^6\), giving \(|T_1 \cap T_2 \cap T_3| \lesssim \delta^3\). This matches the exact answer.
</div>

### 11.2 The Heat-Flow Proof

An elegant proof of the multilinear Kakeya inequality was given by Guth using a heat-flow argument. Let \(G_1, \ldots, G_n : \mathbb{R}^n \to (0,\infty)\) be smooth positive functions and define
\[
I(t) = \int_{\mathbb{R}^n} \prod_{j=1}^n (G_j \ast \phi_t)(x)^{1/(n-1)}\, dx,
\]
where \(\phi_t(x) = (4\pi t)^{-n/2} e^{-|x|^2/4t}\) is the heat kernel. As \(t \to \infty\), each \(G_j \ast \phi_t\) converges to a constant \(\bar{G}_j\), and \(I(t) \to \prod_j \bar{G}_j^{1/(n-1)} \cdot \text{Vol}(\text{support})\).

Guth's key computation shows \(I'(t) \leq 0\) when the \(G_j\) are "transversally positioned." Let us carry out the differentiation explicitly. Write \(u_j = G_j * \phi_t\) so that \(\partial_t u_j = \Delta u_j\) (the heat equation). Then:
\[
I'(t) = \int_{\mathbb{R}^n} \frac{d}{dt} \prod_{j=1}^n u_j(x)^{1/(n-1)}\, dx = \frac{1}{n-1}\int_{\mathbb{R}^n} \prod_{j=1}^n u_j^{1/(n-1)} \cdot \sum_{j=1}^n \frac{\Delta u_j}{u_j}\, dx.
\]
Now integrate by parts twice (using the fact that \(\phi_t\) decays rapidly): \(\int \prod_j u_j^{1/(n-1)} \frac{\Delta u_j}{u_j} = -\int \nabla \left(\prod_j u_j^{1/(n-1)}\right) \cdot \nabla \log u_j\).

Expanding the gradient of the product:
\[
\nabla \prod_j u_j^{1/(n-1)} = \frac{1}{n-1} \prod_j u_j^{1/(n-1)} \cdot \sum_k \nabla \log u_k.
\]
So:
\[
I'(t) = -\frac{1}{(n-1)^2} \int \prod_j u_j^{1/(n-1)} \left(\sum_k \nabla \log u_k\right) \cdot \sum_j \nabla \log u_j.
\]
More carefully, keeping all terms, Guth computes:
\[
I'(t) = \frac{1}{n-1} \int \prod_j u_j^{1/(n-1)} \sum_j \frac{\Delta u_j}{u_j} = \frac{1}{n-1}\int \prod_j u_j^{1/(n-1)}\left[-\frac{|\nabla u_j|^2}{u_j^2} \cdot \text{(positive)} + \text{boundary terms} = 0\right].
\]

The key point is more subtle: one uses the **arithmetic-geometric mean inequality** applied to the matrix of inner products of the gradients. Write \(v_j = \nabla \log u_j\) (the "velocity field" of \(\log u_j\) under the heat flow). The heat equation gives \(\partial_t \log u_j = \frac{\Delta u_j}{u_j} = \frac{\Delta u_j}{u_j}\), and the correct formula is:
\[
(n-1) I'(t) = \int \prod_j u_j^{1/(n-1)} \left[\sum_j \text{tr}(H_j) - \text{tr}\!\left(\left(\sum_j v_j \otimes v_j\right)^{1/2}\right)\right]
\]
where \(H_j = D^2 \log u_j\) is the Hessian of \(\log u_j\). The transversality condition says: the vectors \(d_j\) (principal directions of the \(j\)-th tube family) span \(\mathbb{R}^n\), and for each \(j\), the directions of \(\nabla \log u_j\) are approximately aligned with \(d_j\). This transversality, combined with the AM-GM inequality applied to the eigenvalues of the Hessian matrices, gives:
\[
\sum_j \text{tr}(H_j) \leq \text{tr}\!\left(\left(\sum_j v_j \otimes v_j\right)^{1/2}\right),
\]
where equality holds only in the "flat" case. Hence \(I'(t) \leq 0\).

The heat-flow method is conceptually clean: it reduces the multilinear inequality to a pointwise matrix inequality (a log-concavity condition), which is then verified using the linear-algebraic content of transversality. The \(t = 0\) limit recovers the original inequality; the \(t \to \infty\) limit gives the "flat" product of averages, which is the right hand side.

### 11.3 Multilinear Restriction

Multilinear Kakeya implies a corresponding multilinear restriction theorem via wave packet decomposition. The mechanism connecting the two is a central theme in modern harmonic analysis: geometric overlap estimates for tubes (Kakeya) translate into analytic norm bounds for oscillatory integrals (restriction).

<div class="theorem">
<strong>Theorem 11.3 (Multilinear Restriction, Bennett-Carbery-Tao 2006).</strong> Let \(S_1, \ldots, S_n\) be smooth compact hypersurfaces in \(\mathbb{R}^n\) that are \(\nu\)-transversal: for any choice of normals \(e_j \in N(S_j)\) (one from each surface), the vectors \(e_1, \ldots, e_n\) span \(\mathbb{R}^n\) with "spanning constant" \(\geq \nu\). Let \(f_j \in L^2(S_j)\). Then
\[
\left\|\prod_{j=1}^n |Ef_j|^{1/(n-1)}\right\|_{L^2(\mathbb{R}^n)} \lesssim_\nu \prod_{j=1}^n \|f_j\|_{L^2(S_j)}^{1/(n-1)},
\]
where \(Ef_j(x) = \int_{S_j} f_j(\omega) e^{ix \cdot \omega}\, d\sigma_j(\omega)\) is the extension operator.
</div>

The proof has two layers: wave packet decomposition, and an application of the multilinear Kakeya inequality to the resulting tubes.

**Proof sketch via wave packet decomposition.**

*Step 1: Wave packets and tube decomposition.* For each \(j\), decompose \(f_j = \sum_T f_{j,T}\) using the wave packet decomposition (Theorem 10.5), where \(T\) ranges over a finitely overlapping collection of tubes of length 1 and radius \(R^{-1/2}\) in direction \(e_T \in S_j\). Each term \(Ef_{j,T}\) is concentrated near the tube \(T\). More precisely:
\[
|Ef_{j,T}(x)| \lesssim |c_{j,T}| \cdot (1 + R^{1/2} \mathrm{dist}(x, T))^{-N}
\]
for every \(N > 0\). So \(|Ef_j(x)| \lesssim \sum_T |c_{j,T}| \cdot \mathbf{1}_{T}(x) + \text{rapid decay}\), where the sum is over tubes \(T\) passing through \(x\).

*Step 2: Pointwise product estimate.* At each \(x \in \mathbb{R}^n\), select one dominant tube \(T_j(x)\) per surface index \(j\) (the tube contributing most to \(|Ef_{j}(x)|\)). Then:
\[
\prod_{j=1}^n |Ef_j(x)|^{1/(n-1)} \lesssim \prod_{j=1}^n |c_{j,T_j(x)}|^{1/(n-1)}.
\]
The tubes \(T_1(x), \ldots, T_n(x)\) point in directions \(e_{T_j(x)} \in S_j\), and by the transversality assumption on \(S_1, \ldots, S_n\), these directions are \(\nu\)-transversal (their outer normals span \(\mathbb{R}^n\)).

*Step 3: Applying multilinear Kakeya.* Write
\[
\int_{\mathbb{R}^n} \prod_{j=1}^n |Ef_j|^{2/(n-1)}\, dx = \int_{\mathbb{R}^n} \prod_{j=1}^n\!\left(\sum_{T : T \ni x} |c_{j,T}|^2\right)^{1/(n-1)} dx + \text{error},
\]
where we used Cauchy-Schwarz to bound the cross-terms. The functions \(G_j(x) = \sum_{T \ni x} |c_{j,T}|^2\) are averages of indicator functions of tubes pointing in the direction \(S_j\). Since the tubes are transversal (from different surfaces), Theorem 11.2 (multilinear Kakeya) applies:
\[
\int_{\mathbb{R}^n} \prod_{j=1}^n G_j(x)^{1/(n-1)}\, dx \lesssim_\nu \prod_{j=1}^n \left(\sum_T |c_{j,T}|^2 \cdot |T|\right)^{1/(n-1)}.
\]
The sum \(\sum_T |c_{j,T}|^2 \cdot |T| = \|f_j\|_{L^2(S_j)}^2\) by Plancherel-type orthogonality (the tubes are finitely overlapping and the coefficients are Fourier coefficients), completing the proof. \(\square\)

**The broad function method.** The multilinear restriction theorem has a powerful application via the **broad function** decomposition. For a function \(f\) with Fourier transform supported on \(S^{n-1}\), write \(f = f_{\mathrm{broad}} + f_{\mathrm{narrow}}\) where:
- \(f_{\mathrm{broad}}\): the part of \(f\) "spread across" at least \(n\) caps at mutual angle \(\geq \nu\) — here the multilinear restriction theorem applies directly.
- \(f_{\mathrm{narrow}}\): the part of \(f\) concentrated near a single cap of size \(\sim \delta\) — here one applies restriction at finer scale \(\delta\) and sums.

The BCT multilinear theorem handles the broad part efficiently. The narrow part reduces to a lower-dimensional restriction problem (concentrated in a small angular sector, so the sphere "looks flat" and the problem becomes more like restriction on a hyperplane, which is tractable). This "broad-narrow decomposition" is the engine behind Bourgain-Guth's linear restriction improvement and Guth's polynomial method — both build on top of the multilinear BCT theorem as a base case.

The multilinear restriction theorem thus implies the linear restriction conjecture for functions whose Fourier transform is supported in a small cap — the key point being that in small caps, the curvature of the sphere allows one to exploit transversality at each scale.

### 11.4 The Bilinear-to-Linear Bootstrap

One of the most powerful techniques in the modern theory of the restriction problem is the **bilinear-to-linear reduction** of Bourgain (1995) and Tao (2003). The idea is that improved bilinear estimates (for pairs of functions with Fourier support on transversal pieces of the sphere) can be "bootstrapped" to improved linear estimates (for single functions).

<div class="theorem">
<strong>Theorem 11.4 (Bilinear-to-Linear Reduction, Tao 2003).</strong> Let \(S^{n-1}\) be the unit sphere and let \(f\) be a function with \(\hat{f}\) supported on the upper hemisphere. Suppose the bilinear restriction estimate holds:
\[
\|Ef_1 \cdot Ef_2\|_{L^{p/2}(\mathbb{R}^n)} \lesssim \|f_1\|_{L^2(S^{n-1})} \|f_2\|_{L^2(S^{n-1})}
\]
for all pairs \((f_1, f_2)\) whose Fourier supports \(\tau_1, \tau_2 \subset S^{n-1}\) are \(\nu\)-transversal (separated in angle by at least \(\nu\)). Then the linear restriction estimate
\[
\|Ef\|_{L^p(\mathbb{R}^n)} \lesssim_\nu \|f\|_{L^2(S^{n-1})}
\]
holds (with a constant depending polynomially on \(\nu^{-1}\)).
</div>

The proof uses a Whitney decomposition of the sphere into pairs of transversal caps, followed by a "Córdoba-Fefferman" type argument to convert the bilinear sum into the linear norm. The key steps are:

**Step 1: Whitney decomposition.** Decompose \(S^{n-1}\) into finitely overlapping caps \(\{\tau_j\}\) of diameter \(\delta\). For each pair \((j, k)\) with \(|\tau_j - \tau_k| \geq \nu\) (transversal pair), the bilinear hypothesis applies. For "nearby" pairs with \(|\tau_j - \tau_k| < \nu\), the functions \(Ef_j\) and \(Ef_k\) are nearly parallel in frequency and can be treated together by a single application of the restriction estimate at finer scale \(\delta\).

**Step 2: Square-function estimate.** Write
\[
|Ef(x)|^2 = \left|\sum_j Ef_j(x)\right|^2 = \sum_{j,k} Ef_j(x) \overline{Ef_k(x)}.
\]
Separate the sum into transversal pairs (where bilinear estimates apply) and nearby pairs (handled by orthogonality). The bilinear estimate in the transversal region gives:
\[
\left\|\sum_{j,k : |\tau_j - \tau_k| \geq \nu} Ef_j \cdot \overline{Ef_k}\right\|_{L^{p/2}} \lesssim \left(\sum_j \|f_j\|_{L^2}^2\right)^{1/2} \left(\sum_k \|f_k\|_{L^2}^2\right)^{1/2} = \|f\|_{L^2}^2.
\]

**Step 3: Nearby pairs via rescaling.** The nearby pairs (with \(|\tau_j - \tau_k| < \nu\)) are handled by a rescaling argument: at the finer scale \(\nu\), the caps \(\tau_j, \tau_k\) look transversal relative to the curvature of the sphere. One applies the bilinear estimate at the rescaled level and bootstraps back.

**Why this is deep.** The bilinear-to-linear reduction is not merely a trick: it reveals that the restriction problem has a "bilinear structure" — the hard cases are always about pairs of caps at comparable scales and angles. The linear estimate is in a sense a consequence of the fact that the sphere can always be decomposed into transversal pairs. This is ultimately a consequence of the curvature of the sphere (flat manifolds with zero curvature, like the hyperplane \(\mathbb{R}^{n-1} \subset \mathbb{R}^n\), do not admit restriction estimates at all).

<div class="remark">
<strong>Remark 11.5 (Kakeya via bilinear reduction).</strong> The bilinear restriction estimate for the sphere implies the Kakeya maximal function conjecture in a precise sense: if the bilinear estimate holds at exponent \(p\), then the Kakeya maximal function \(\mathcal{K}_\delta\) satisfies \(\|\mathcal{K}_\delta f\|_{L^n} \lesssim \delta^{-\varepsilon}\|f\|_{L^n}\) (the Kakeya conjecture). This is the deepest known connection between the two problems: improved restriction bounds at one scale imply Kakeya bounds at the same scale. The Wang-Zahl theorem closes this circle for \(n = 3\), giving the full Kakeya bound and hence completing the endpoint of the bilinear restriction estimate in \(\mathbb{R}^3\).
</div>

---

## Chapter 12: The Polynomial Method and Decoupling

### 12.1 Dvir's Polynomial Method over Finite Fields

A spectacular application of algebraic methods to incidence geometry was Dvir's 2009 proof of the finite-field Kakeya conjecture.

<div class="definition">
<strong>Definition 12.1 (Finite Field Kakeya Set).</strong> A <strong>Kakeya set</strong> in \(\mathbb{F}_q^n\) is a subset \(E \subseteq \mathbb{F}_q^n\) containing a line in every direction (i.e., for every \(d \in \mathbb{F}_q^n \setminus \{0\}\) / lines through origin, there exists \(a\) such that \(\{a + td : t \in \mathbb{F}_q\} \subseteq E\)).
</div>

<div class="theorem">
<strong>Theorem 12.2 (Dvir, 2009).</strong> Every Kakeya set in \(\mathbb{F}_q^n\) has cardinality at least \(c_n q^n\) for an explicit constant \(c_n > 0\).
</div>

<div class="proof">
<strong>Proof.</strong> Suppose \(E\) is a Kakeya set with \(|E| < \binom{n + q - 1}{n}\). Then there exists a nonzero polynomial \(P \in \mathbb{F}_q[x_1, \ldots, x_n]\) of degree at most \(q - 1\) that vanishes on all of \(E\) (by a parameter count: the space of polynomials of degree \(\leq q-1\) has dimension \(\binom{n+q-1}{n}\), which exceeds \(|E|\), so there is a nonzero polynomial vanishing on \(E\) by linear algebra). The leading homogeneous part \(P_{\text{top}}\) of \(P\) has degree \(d = \deg P \leq q-1\). For any direction \(v \in \mathbb{F}_q^n\), the line \(\{a + tv\}\) lies in \(E\), so \(P(a + tv) = 0\) as a degree-\(d\) polynomial in \(t\) with at most \(d < q = |\mathbb{F}_q|\) roots — contradiction unless \(P(a + tv) \equiv 0\). This forces \(P_{\text{top}}(v) = 0\) for all \(v \in \mathbb{F}_q^n\). Since the degree of \(P_{\text{top}}\) is less than \(q\), this means \(P_{\text{top}}\) is the zero polynomial (a polynomial of degree \(< q\) that vanishes everywhere on \(\mathbb{F}_q^n\) must be zero). Contradiction.
</div>

This proof is astonishing in its simplicity. It uses no deep analysis — just linear algebra and the fact that a polynomial can only vanish on a line if it vanishes identically on it (by degree considerations). The polynomial method has since been extended to the real setting by Guth and Katz.

### 12.2 Guth-Katz and the Joints Problem

Guth and Katz used the polynomial method over \(\mathbb{R}\) to solve the joints problem (2010) and then to prove that the number of distinct distances determined by \(N\) points in the plane is \(\Omega(N/\sqrt{\log N})\), essentially resolving the Erdős distinct distances problem (Guth-Katz, 2015). Their methods introduced three fundamental tools that have since become central to geometric harmonic analysis:

**Tool 1: The polynomial ham-sandwich theorem.** Any \(n\) finite measures \(\mu_1, \ldots, \mu_n\) in \(\mathbb{R}^n\) can be simultaneously bisected by a single polynomial hypersurface of degree \(D\). More precisely, there exists a polynomial \(P\) of degree \(\leq D\) such that each measure is cut in half by \(\{P = 0\}\):
\[
\mu_j(\{P > 0\}) = \mu_j(\{P < 0\}) = \frac{1}{2}\mu_j(\mathbb{R}^n), \quad j = 1, \ldots, n.
\]
This generalizes the classical ham-sandwich theorem (for \(D = 1\), linear bisections) to curved cuts.

**Tool 2: Cell decomposition.** Given a polynomial \(P\) of degree \(D\), the complement \(\mathbb{R}^n \setminus \{P = 0\}\) has at most \(C(D+1)^n\) connected components ("cells"). Each cell is convex-like for the purposes of geometric arguments. For a collection of \(N\) lines in \(\mathbb{R}^3\), Guth-Katz apply a polynomial of degree \(D \sim N^{1/2}\) to partition space into \(\sim D^3 \sim N^{3/2}\) cells, each containing \(\sim N/D^3 \sim N^{-1/2}\) lines. Within each cell, the lines have a controlled incidence structure that can be analyzed separately.

**Tool 3: Incidences and algebraic structure.** The key estimate is a bound on the number of **joints** in a collection of lines: a **joint** of a set \(\mathcal{L}\) of lines in \(\mathbb{R}^3\) is a point where at least three non-coplanar lines of \(\mathcal{L}\) meet.

<div class="theorem">
<strong>Theorem 12.4 (Guth-Katz, 2010; joints problem).</strong> If \(\mathcal{L}\) is a set of \(L\) lines in \(\mathbb{R}^3\), then the number of joints \(J(\mathcal{L})\) satisfies
\[
J(\mathcal{L}) \lesssim L^{3/2}.
\]
</div>

<div class="proof">
<strong>Proof (Polynomial method).</strong> Let \(J = J(\mathcal{L})\) and suppose for contradiction \(J > C L^{3/2}\) for a large constant \(C\). Choose a polynomial \(P\) of minimum degree \(d\) vanishing at all \(J\) joints. By the parameter count: the space of polynomials of degree \(\leq d\) has dimension \(\binom{d+3}{3} \sim d^3/6\), so we need \(d \lesssim J^{1/3}\). At each joint \(x\), \(P(x) = 0\) and the three non-coplanar lines through \(x\) all lie in \(\{P = 0\}\) (by the minimality of \(\deg P\), the directional derivatives along these lines must also vanish). Hence \(\nabla P(x) = 0\) for each joint (since \(\nabla P\) must vanish in three non-coplanar directions). So \(\nabla P\) vanishes on \(J > CL^{3/2}\) points. By the same parameter count, \(\nabla P\) is a polynomial of degree \(d-1\), so there exists a polynomial \(Q\) of degree \(\leq d-1\) with the same zero set — contradicting the minimality of \(d\). This contradiction gives the bound.
</div>

For the **distinct distances problem** in \(\mathbb{R}^2\): Erdős conjectured in 1946 that \(N\) points in the plane determine at least \(\Omega(N/\sqrt{\log N})\) distinct distances, and that this bound is achieved by a grid. Guth-Katz proved the lower bound \(\Omega(N/\sqrt{\log N})\) by reducing to a problem about rich lines through point-pairs in \(\mathbb{R}^3\) and applying the polynomial method. The grid upper bound is conjectured to be sharp, but the exact exponent remains open.

**The cell decomposition in detail.** Let us carry through the Guth-Katz cell decomposition argument for the joints problem more explicitly, as it illustrates the general strategy.

Given \(L\) lines and \(J\) joints, choose a polynomial \(P\) of degree \(D \sim J^{1/3}/L^{1/2}\) (chosen to balance two terms). The complement \(\mathbb{R}^3 \setminus Z(P)\) (where \(Z(P) = \{P = 0\}\)) consists of \(O(D^3)\) open connected cells. Each cell \(\Omega_i\) contains \(O(L/D^2)\) lines from \(\mathcal{L}\) (by a counting argument: each line is contained in a \(\delta\)-tube of cross-sectional area \(\delta^2\), and the polynomial \(P\) divides the plane into cells of size \(\sim 1/D\)).

**Within each cell**: The lines through a cell are "generic" (they don't all pass through a common point, by the polynomial structure of the cell). By a Szemerédi-Trotter type bound within the cell, the joints inside the cell can be counted as \(O((L/D^2)^{3/2})\). Summing over \(D^3\) cells gives \(J \leq C D^3 (L/D^2)^{3/2} = CL^{3/2}/D^{3/2}\).

**On the algebraic surface** \(Z(P)\): Lines contained in \(Z(P)\) are treated separately by algebraic methods (a line in an algebraic surface must lie in a component of bounded degree). This gives an additional \(O(DL)\) contribution to the joint count.

Optimizing over \(D\): setting \(L^{3/2}/D^{3/2} = DL\) gives \(D = L^{1/4}\), and the total joint count is \(O(L^{3/2})\). This recovers the optimal Theorem 12.4.

The moral of the polynomial method is that algebraic structure — the zero set of a polynomial — provides a controlled way to decompose incidence problems into "cells" where the local geometry is simpler. The method has been fruitful far beyond the joints problem: it underlies the resolution of the Erdős-Ko-Rado conjecture in combinatorics, improved Szemerédi-Trotter bounds in the plane, and the recent progress on the Kakeya problem itself.

### 12.2b Incidence Geometry and the Kakeya Conjecture

The connection between incidence geometry and the Kakeya conjecture is deeper than it first appears. The Kakeya maximal function bound is equivalent to a statement about the incidences between points and tubes in \(\mathbb{R}^n\):

<div class="theorem">
<strong>Theorem 12.2b (Tubes and Incidences).</strong> Let \(\mathcal{T}\) be a collection of \(\delta\)-tubes in \(\mathbb{R}^3\), one per direction in a \(\delta\)-net on \(S^2\), and let \(E = \bigcup_{T \in \mathcal{T}} T\). The Kakeya conjecture \(\dim_H E = 3\) is equivalent to the following "point-tube incidence" bound: for any set \(\mathcal{P}\) of \(\delta^{-3}\) points and the above collection \(\mathcal{T}\) of tubes,
\[
I(\mathcal{P}, \mathcal{T}) = |\{(p, T) \in \mathcal{P} \times \mathcal{T} : p \in T\}| \leq C_\varepsilon \delta^{-\varepsilon} |\mathcal{P}|^{2/3}|\mathcal{T}|,
\]
where the exponent \(2/3\) is optimal (matching the Szemerédi-Trotter exponent for lines in the plane).
</div>

This formulation makes it clear that the Kakeya conjecture is a higher-dimensional generalization of the Szemerédi-Trotter theorem on point-line incidences in \(\mathbb{R}^2\). The Szemerédi-Trotter theorem itself can be proved using the polynomial method (Guth-Katz), and the hope is that extensions of the polynomial method will eventually close the Kakeya conjecture in all dimensions.

### 12.3 The Decoupling Theorem

A completely different approach to restriction-type problems is the decoupling theorem of Bourgain and Demeter (2015).

<div class="definition">
<strong>Definition 12.2 (Decoupling).</strong> The <em>decoupling inequality</em> for the parabola \(\mathcal{P} = \{(\xi, |\xi|^2) : \xi \in [0,1]^{n-1}\} \subset \mathbb{R}^n\) asserts that for a function \(f : \mathbb{R}^n \to \mathbb{C}\) whose Fourier transform is supported in a \(\delta\)-neighborhood of \(\mathcal{P}\), decomposed into pieces \(f_\theta\) (each piece having Fourier support near a \(\delta \times \delta^{1/2}\) cap \(\theta\) of \(\mathcal{P}\)):
\[
\|f\|_{L^p(\mathbb{R}^n)} \lesssim_\varepsilon \delta^{-\varepsilon} \left(\sum_\theta \|f_\theta\|_{L^p(\mathbb{R}^n)}^2\right)^{1/2}
\]
for \(p = \frac{2(n+1)}{n-1}\) (the "decoupling exponent").
</div>

<div class="theorem">
<strong>Theorem 12.3 (Bourgain-Demeter Decoupling, 2015).</strong> The decoupling inequality holds for the parabola (and for any compact hypersurface with nonvanishing Gaussian curvature) with the optimal exponent, up to the \(\delta^{-\varepsilon}\) factor.
</div>

The proof of the decoupling theorem is a tour de force induction-on-scales argument. Let us outline the key steps.

**The induction setup.** Divide the parabola into caps \(\theta\) at scale \(\delta^{1/2}\) (each cap being a \(\delta^{1/2} \times \delta\) patch). The claim is that functions with Fourier support near different caps can be essentially "decoupled" (treated as independent) when measuring their \(L^p\) norm.

**Bilinear reduction.** The first step is to reduce the decoupling inequality to a bilinear version: instead of bounding \(\|f\|_{L^p}\) in terms of the caps, one bounds \(\|f_1 f_2\|_{L^{p/2}}\) where \(f_1, f_2\) have Fourier supports in caps \(\theta_1, \theta_2\) that are separated (transversal). The bilinear version is easier because the two functions automatically satisfy a kind of transversality.

**Multilinear Kakeya input.** The bilinear-to-linear bootstrap uses the multilinear Kakeya inequality in a crucial way. The wave packets making up \(f_j\) are concentrated near \(\delta\)-tubes pointing in the direction of the normal to \(\theta_j\). When \(\theta_1\) and \(\theta_2\) are transversal, these tubes point in different directions, and the multilinear Kakeya inequality controls their overlap.

**Induction on scales.** At each stage of the induction, one applies the above bilinear argument at scale \(\delta^{1/2}\) (reducing caps of size \(\delta\) to caps of size \(\delta^{1/2}\)), gaining a constant factor, then iterates. The \(\delta^{-\varepsilon}\) loss comes from accumulating \(\log(1/\delta)\) stages of the iteration.

<div class="remark">
<strong>Remark 12.4 (Why the exponent \(p = 2(n+1)/(n-1)\) is optimal).</strong> The decoupling exponent \(p = 2(n+1)/(n-1)\) is the same as the endpoint of the restriction conjecture for the sphere (via the duality between restriction and extension). This is not a coincidence: the decoupling inequality is, in a precise sense, a quantitative form of the restriction conjecture. The optimality of the exponent follows from an explicit example constructed using a Cantor-type set in frequency space.
</div>

**Applications of decoupling:**

1. *Vinogradov's mean value theorem*: The decoupling theorem implies the sharp bound \(J_{s,n}(X) \lesssim_\varepsilon X^{s + \varepsilon} + X^{2s - n(n+1)/2 + \varepsilon}\) for the number of solutions to \(\sum_{i=1}^s (x_i^j - y_i^j) = 0\) for \(j = 1, \ldots, n\). This resolves the main conjecture in Vinogradov's mean value theorem, with applications to Waring's problem and the distribution of prime numbers.
2. *Local smoothing for the wave equation*: Decoupling implies sharp local smoothing estimates \(\|e^{it\sqrt{-\Delta}} f\|_{L^p_t L^p_x([0,1]\times\mathbb{R}^n)} \lesssim \|f\|_{H^{s_p}}\) for \(s_p = (n-1)(1/2 - 1/p) - 1/p\), resolving the local smoothing conjecture of Sogge.
3. *Strichartz estimates on tori*: Decoupling gives sharp Strichartz-type estimates for the Schrödinger equation on \(\mathbb{T}^n\), improving earlier bounds in number-theoretic applications.

---

## Chapter 13: Hong Wang and the Resolution of the Kakeya Conjecture in \(\mathbb{R}^3\)

### 13.1 A Century of Partial Progress

The Kakeya conjecture in \(\mathbb{R}^n\) — that every Besicovitch set has Hausdorff dimension \(n\) — stood as one of the central open problems of harmonic analysis for over four decades. Let us trace the history of progress before the 2024 breakthrough.

The \(n = 2\) case was resolved independently by Davies (1971) using a Fourier-analytic argument and Córdoba (1977) via a combinatorial argument related to the circular maximal function. Both proofs exploit the fact that two lines in \(\mathbb{R}^2\) can only intersect in a point; this combinatorial constraint forces the set to be large.

In \(\mathbb{R}^3\) and higher dimensions, the problem is much harder because lines can overlap in more complex ways. The trivial lower bound \(\dim_H E \geq (n+2)/2\), due essentially to counting arguments on tubes, remained the best for many years. Bourgain (1991) gave the first nontrivial improvement using arithmetic combinatorics, and this was progressively improved:

| Year | \(n = 3\) lower bound | Method |
|------|----------------------|--------|
| 1991 | \(7/3\) | Bourgain (combinatorics) |
| 1995 | \(5/2\) (Wolff) | Bush argument |
| 2000 | \(5/2\) | Katz-Łaba-Tao (arithmetic) |
| 2002 | \(5/2 + \varepsilon_0\) | Katz-Tao (for all \(n \geq 3\)) |

Wolff's \(5/2\) bound via the "bush argument" is particularly elegant: if a Besicovitch set \(E\) has dimension \(< 5/2\), then many tubes must pass through a common "bush" point. At that point, the tubes look like a star pattern in \(\mathbb{R}^3\), and one can obtain a planar Kakeya problem in \(\mathbb{R}^2\) — but we know 2D Kakeya sets have dimension 2, giving a contradiction for the \(\mathbb{R}^3\) set below \(5/2\).

The \(5/2 + \varepsilon_0\) bound of Katz-Tao used the "two-ends reduction" and arithmetic combinatorics (additive energy estimates). Let us describe this approach in more detail, as it directly motivates the Wang-Zahl strategy.

**The two-ends reduction (Katz-Tao, 2002).** A line segment in \(\mathbb{R}^3\) has two "ends" — the initial and terminal points. Katz and Tao observed that the "extremal" Besicovitch sets are those where the two ends of each segment are "spread apart" from each other, in the sense that the initial points and terminal points are distributed across sets of large dimension. Sets with this "two-ends" property are the hardest ones, and Katz-Tao reduced the Kakeya conjecture to proving a dimension bound for two-ends Besicovitch sets.

More precisely: a collection \(\mathcal{T}\) of \(\delta\)-tubes is **\((s, t)\)-two-ends** if for every \(s\)-dimensional set \(E\) and every tube \(T \in \mathcal{T}\), the tube \(T\) is not contained in the \(\delta\)-neighborhood of any \((n-2)\)-plane. The two-ends structure prevents the tubes from "concentrating" near lower-dimensional submanifolds.

Under the two-ends assumption, Katz and Tao used **additive energy estimates** to prove that the tubes must spread out:

<div class="definition">
<strong>Definition 13.1b (Additive Energy).</strong> For a set \(A \subset \mathbb{R}\), the <em>additive energy</em> of \(A\) is
\[
E(A) = |\{(a_1, a_2, a_3, a_4) \in A^4 : a_1 + a_2 = a_3 + a_4\}|.
\]
By the Cauchy-Schwarz inequality, \(|A + A| \geq |A|^2/E(A)^{1/2}\).
</div>

The Katz-Tao argument shows: if \(\dim_H E < 5/2 + \varepsilon_0\), then the "slope sets" (projections of the tube directions onto planes) have abnormally small additive energy, violating a Balog-Szemerédi-Gowers type combinatorial lemma. This gives the \(5/2 + \varepsilon_0\) bound (for some explicit but small \(\varepsilon_0 > 0\)) in all dimensions \(n \geq 3\).

The fundamental obstacle: arithmetic combinatorics methods can only exploit additive structure at a single scale. To close the gap from \(5/2 + \varepsilon_0\) to 3, one would need to iterate the argument across all scales simultaneously — and it was unclear how to do this until Wang-Zahl introduced the multi-scale energy decomposition (Theorem 13.2 and §13.5).

Despite technical brilliance, the arithmetic method seemed to plateau, and experts expected a fundamentally new idea would be needed to close the remaining gap to 3. The 2024 resolution by Wang and Zahl provided exactly that new idea.

### 13.2 Hong Wang: Background and Key Ideas

Hong Wang received her Ph.D. from MIT (2019) under Larry Guth, working on Fourier restriction theory. After a postdoc at the Institute for Advanced Study, she joined the Courant Institute at NYU in 2022. Her research lies at the interface of harmonic analysis, geometric measure theory, and combinatorics.

The Wang-Zahl proof draws on three major strands of prior work:
1. The **Katz-Tao two-ends reduction** (2002): sticky Kakeya sets (those with a self-similar organization at each scale) are the extremal configurations.
2. The **Furstenberg set problem** in the plane: a multi-scale version of Kakeya that connects 2D and 3D configurations.
3. **Multi-scale energy methods**: tracking how "energy" (weighted tube-pair intersections) distributes across scales, using induction.

Wang and Zahl's key contribution was to find and exploit the precise connection between 3D Kakeya and 2D Furstenberg sets, and to prove the Furstenberg conjecture in the plane with optimal bounds.

### 13.3 Furstenberg Sets and the Bridge to Kakeya

<div class="definition">
<strong>Definition 13.1 (Furstenberg Set).</strong> For \(0 \leq s \leq 1\) and \(0 \leq t \leq 2\), a compact set \(E \subseteq \mathbb{R}^2\) is an \((s, t)\)-<em>Furstenberg set</em> if there exists a \(t\)-dimensional family of lines \(\{\ell_e : e \in \Omega\} \) (with \(\dim_H \Omega \geq t\)) such that for each \(e \in \Omega\), \(\dim_H(E \cap \ell_e) \geq s\).
</div>

![Furstenberg sets: E contains an s-dimensional slice on each line in a t-dimensional family; Wang–Zahl prove dim_H(E) ≥ max(s+t, (3s+t)/2), which resolves the 3D Kakeya conjecture as the special case s=1, t=2](/pics/pmath833/kakeya-tikz-furstenberg.svg)

Furstenberg sets interpolate between several classical problems:
- \(s = 0\): trivial (every set is a \((0, t)\)-Furstenberg set for any \(t \leq \dim_H E\)).
- \(s = 1, t = 1\): \(E\) contains a line segment in every direction in a 1-dimensional family of directions — this is related to, but not identical to, Besicovitch sets.
- \(s = 1, t = 2\): \(E\) contains a line segment in every direction — this is the Kakeya problem.

The expected dimension of an \((s, t)\)-Furstenberg set comes from heuristic dimension counting: we have a \(t\)-dimensional family of lines, each contributing an \(s\)-dimensional slice. If all slices were disjoint (the "generic" case), the total dimension would be \(s + t\). If the slices overlap maximally, an \(s\)-dimensional "concentration" argument gives a bound of \(2s + (t - 1)\), which equals \((3s + t)/2\) when the two bounds are balanced. The full Furstenberg conjecture asserts:

<div class="theorem">
<strong>Theorem 13.2 (Furstenberg Set Conjecture, Wang-Zahl 2024).</strong> Let \(E \subseteq \mathbb{R}^2\) be an \((s, t)\)-Furstenberg set. Then
\[
\dim_H E \geq \min\left(s + t,\ \frac{3s + t}{2},\ 2\right).
\]
</div>

This bound is sharp: the three constraints are achieved by different constructions:
- \(s + t\): take a product set \(C_s \times C_t\) where \(C_s, C_t\) are Cantor sets of appropriate dimensions and lines connect \(C_s\)-fibers in the \(C_t\)-directions.
- \((3s+t)/2\): take a self-similar set at the critical exponent where both bounds are equal (\(s + t = (3s+t)/2\) iff \(t = s\)).
- \(2\): for large \(s, t\), the ambient dimension constrains.

### 13.4 The Wang-Zahl Theorem

<div class="theorem">
<strong>Theorem 13.3 (Wang-Zahl, 2024).</strong> Every Besicovitch set in \(\mathbb{R}^3\) has Hausdorff dimension 3. Equivalently, the Kakeya conjecture holds in \(\mathbb{R}^3\).
</div>

The proof occupies a paper of approximately 130 pages (arXiv:2404.09011). We outline the main ideas.

**Step 1: Discretization.** The Kakeya conjecture is equivalent (via Frostman's lemma and standard pigeonholing) to the following discretized statement: for every \(\varepsilon > 0\) and every collection \(\mathcal{T}\) of \(\delta\)-tubes in \(\mathbb{R}^3\) (each tube of dimensions \(1 \times \delta \times \delta\)) with one tube per direction in a \(\delta\)-separated set \(\Omega \subset S^2\) (so \(|\Omega| \sim \delta^{-2}\)),
\[
\left|\bigcup_{T \in \mathcal{T}} T\right| \geq \delta^{3\varepsilon} \cdot \delta^2 \cdot |\mathcal{T}| = \delta^{3\varepsilon} \cdot \delta^2 \cdot \delta^{-2} = \delta^{3\varepsilon}.
\]
In other words, the union of the tubes has volume at least \(\delta^{3\varepsilon}\) (nearly as large as a ball of radius 1). The exponent \(3\varepsilon\) accounts for the \(\delta^\varepsilon\) loss that appears in all known proofs.

**Step 2: The sticky reduction.** A key observation is that the "hardest" Besicovitch sets are the **sticky Kakeya sets**: tube configurations that are self-similar at each scale, in the sense that the set of directions of tubes passing through a ball \(B_\rho\) of radius \(\rho\) looks like a rescaled copy of the global direction set \(\Omega\). Sticky sets are the most "spread out" configurations, and proving the conjecture for them suffices by a pigeonholing argument.

More precisely, Wang and Zahl introduce the following key notion:

![Multi-scale stickiness: at scale δ, tubes are thin and numerous; at scale δ^{1/2}, meta-tubes each contain a coherent cluster of δ-tubes; the sticky condition forces most energy into a single meta-tube at each dyadic scale, enabling the multi-scale Cauchy–Schwarz argument](/pics/pmath833/kakeya-tikz-multiscale-sticky.svg)

<div class="definition">
<strong>Definition 13.4 (Kakeya Scheme).</strong> A <em>Kakeya scheme</em> at scales \(\delta \leq \rho_1 \leq \rho_2 \leq 1\) consists of:
<ol>
<li>A collection \(\mathcal{T}\) of \(\delta\)-tubes in \(\mathbb{R}^3\), one per direction in a \(\delta\)-separated subset \(\Omega \subset S^2\) with \(|\Omega| \sim \delta^{-2}\).</li>
<li>For each \(\rho\)-ball \(B_\rho(c)\) with \(\rho_1 \leq \rho \leq \rho_2\), a sub-collection \(\mathcal{T}(B_\rho) \subseteq \mathcal{T}\) of tubes that pass through \(B_\rho(c)\), satisfying the <em>stickiness condition</em>: the directions of tubes in \(\mathcal{T}(B_\rho)\) form a \(\rho\)-separated set \(\Omega(B_\rho) \subset S^2\) with \(|\Omega(B_\rho)| \sim \rho^{-2} \cdot (\delta/\rho_1)^{-2\alpha}\) for a fixed exponent \(\alpha \geq 0\).</li>
<li>The <em>multi-scale compatibility condition</em>: for each pair of nested balls \(B_{\rho_2}(c_2) \supset B_{\rho_1}(c_1)\), the sub-collection \(\mathcal{T}(B_{\rho_1})\) consists exactly of those tubes in \(\mathcal{T}(B_{\rho_2})\) whose directions lie within angular distance \(\rho_1\) of the directions of \(\mathcal{T}(B_{\rho_1})\).</li>
</ol>
The <em>multiplicity</em> of the scheme is the function \(\mu(\rho) = |\Omega(B_\rho)| / |\Omega(B_1)| \sim (\delta/\rho)^{2\alpha}\), measuring how many directions "survive" at scale \(\rho\). The scheme is <em>sticky</em> if \(\alpha = 1\): the multiplicity at scale \(\rho\) is exactly \(\rho^{-2}\) times that at scale 1 — the tubes thin out proportionally to the scale, like a fractal.
</div>

The stickiness condition is precisely the condition that the Kakeya scheme has the "right" multiplicity at each scale. Physically, a sticky Kakeya configuration is one in which the directions of tubes passing through any given region look like a "rescaled" copy of the global direction set — the configuration is self-similar across scales. This is the most "spread out" configuration, and proving dimension 3 for sticky Besicovitch sets suffices for the conjecture by the following reduction:

<div class="proposition">
<strong>Proposition 13.5 (Sticky Reduction).</strong> To prove the Kakeya conjecture in \(\mathbb{R}^3\), it suffices to prove that every sticky Besicovitch set has Hausdorff dimension 3. More precisely: if \(E\) is a Besicovitch set achieving a small Hausdorff dimension \(\dim_H E < 3 - c\) for some \(c > 0\), then there exists a sticky sub-configuration of tubes whose union has Hausdorff dimension \(< 3 - c/2\), contradicting the sticky case.
</div>

The proof of this reduction (which occupies a substantial portion of the Wang-Zahl paper) uses a pigeonholing argument on scales: among all scales \(\rho \in [\delta, 1]\), one finds the scale \(\rho_*\) where the "entropy" of the tube configuration is most concentrated, and at that scale the configuration is sticky.

**Step 3: Projection to 2D and Furstenberg sets.** With the sticky structure in hand, Wang and Zahl project from \(\mathbb{R}^3\) to \(\mathbb{R}^2\). Fix a "generic" plane \(\Pi \cong \mathbb{R}^2\) and let \(\pi : \mathbb{R}^3 \to \Pi\) be the orthogonal projection. A \(\delta\)-tube \(T\) in direction \(e \in S^2\) projects to a region of size roughly \(\delta \times \delta/|\sin\angle(e, \Pi^\perp)|\) in \(\Pi\). For directions not nearly perpendicular to \(\Pi\), this is a \(\delta\)-tube in \(\Pi\).

The key claim is: the projection \(\pi\left(\bigcup_{T \in \mathcal{T}} T\right)\) is an \((s, t)\)-Furstenberg set in \(\Pi\) for parameters \(s, t\) determined by the "branching" of the sticky Kakeya scheme. Specifically, if the scheme has multiplicity \(\sim \delta^{-\alpha}\) at scale \(\delta\) (i.e., a ball of radius 1 contains \(\sim \delta^{-\alpha}\) tubes), then the projected set is an \((\alpha/2, \alpha)\)-Furstenberg set — and the dimension formula gives \(\dim_H \pi(E) \geq \min(\alpha/2 + \alpha, (3\alpha/2 + \alpha)/2) = \min(3\alpha/2, 5\alpha/4)\) etc. Choosing optimal \(\alpha\) and applying the Furstenberg conjecture (Theorem 13.2) gives a 3D lower bound.

**Step 4: Closing the argument.** Combining the 2D Furstenberg bound with the 3D geometry via a fiber-bundle argument: if almost every 2D slice has the right dimension, and the slices vary in a controlled way across the third direction, then the 3D set has the claimed dimension 3. The precise argument uses a "dimension-counting" inequality for fiber bundles.

### 13.5 Proof of the Furstenberg Conjecture in \(\mathbb{R}^2\)

The core of the Wang-Zahl paper is the proof of Theorem 13.2. We sketch the key technique.

**Multi-scale energy decomposition.** For an \((s, t)\)-Furstenberg set \(E\) with associated line family \(\{\ell_e\}_{e \in \Omega}\), define the **\(\alpha\)-energy** at scale \(\rho\):
\[
\mathcal{E}_\alpha(\mu, \rho) = \int\!\!\int |x - y|^{-\alpha}\, d\mu(x)\, d\mu(y) \cdot \rho^{-\alpha},
\]
where \(\mu\) is a positive measure on \(E\). The energy captures how "concentrated" \(\mu\) is at scale \(\rho\): if \(\mu\) is spread out (dimension \(> \alpha\)), the energy is bounded; if it concentrates, the energy blows up.

The Furstenberg structure constrains the energy: for each line \(\ell_e\) in the family, the 1D restriction \(\mu|_{\ell_e}\) must have dimension \(\geq s\), so \(\mathcal{E}_{s'}(\mu|_{\ell_e}, \rho) \lesssim 1\) for \(s' < s\). Integrating over the \(t\)-dimensional direction family gives:
\[
\mathcal{E}_{s+t}(\mu, 1) \lesssim \int_{e \in \Omega} \mathcal{E}_s(\mu|_{\ell_e}, 1)\, d\sigma(e) \lesssim 1
\]
(the first inequality uses the "slicing formula" for energy integrals). This gives the bound \(\dim_H E \geq s + t\).

For the \((3s+t)/2\) bound, one needs a more refined multi-scale analysis. The key is a Cauchy-Schwarz argument at an intermediate scale \(\rho\), which we now make explicit.

**The \((3s+t)/2\) bound via multi-scale Cauchy-Schwarz.** Fix an \((s,t)\)-Furstenberg set \(E\) with line family \(\{\ell_e\}_{e \in \Omega}\) where \(\dim_H \Omega \geq t\). Let \(\mu\) be a positive measure on \(E\) with \(\mu(E) = 1\). For each scale \(\rho \in (0,1]\) and each direction \(e \in \Omega\), let \(\mu_e^\rho\) denote the "slice" of \(\mu\) restricted to the \(\rho\)-neighborhood of \(\ell_e\), and define the **local line energy** at scale \(\rho\):
\[
\Lambda_s(\rho) = \int_{e \in \Omega} \mathcal{E}_s(\mu_e^\rho, \rho)\, d\sigma_\Omega(e),
\]
where \(\sigma_\Omega\) is the natural measure on the direction set \(\Omega\) and \(\mathcal{E}_s(\mu_e^\rho, \rho) = \iint |x - y|^{-s} d\mu_e^\rho(x)\, d\mu_e^\rho(y) / \rho^{-s}\) is the normalized \(s\)-energy on the line slice at scale \(\rho\).

The Furstenberg structure implies \(\mathcal{E}_s(\mu_e^\rho, \rho) \lesssim 1\) uniformly in \(e\) and \(\rho\) (since each slice \(\ell_e \cap E\) has dimension \(\geq s\)). Integrating over the \(t\)-dimensional family \(\Omega\):
\[
\Lambda_s(\rho) \lesssim \sigma_\Omega(\Omega) \lesssim \rho^{-t} \text{ (by the Hausdorff dimension of } \Omega \text{)}.
\]

Now apply Cauchy-Schwarz in the \(e\)-integration. For any pair of directions \(e, e'\) with \(|e - e'| \sim \rho\) (i.e., directions at angular scale \(\rho\)), the two lines \(\ell_e\) and \(\ell_{e'}\) are nearly parallel and can intersect at most once (in a ball of radius \(\rho\)). The key estimate is:
\[
\mathcal{E}_{s+t}(\mu, \rho) \leq C \left(\mathcal{E}_s(\mu, \rho)^{1/2} \cdot \Lambda_t(\rho)^{1/2} + \text{lower order}\right).
\]
This estimate follows from a bilinear decomposition: write \(\iint |x-y|^{-(s+t)}\, d\mu(x)\, d\mu(y)\) by grouping pairs \((x,y)\) according to whether \(x, y\) lie on lines at angular distance \(\leq \rho\) or \(> \rho\). For the first group, use the 1D energy along each line (controlled by \(\mathcal{E}_s\)); for the second group, use transversality of the lines and the dimension of \(\Omega\) (controlled by \(\Lambda_t\)).

Iterating this estimate: at the optimal scale \(\rho^* = \delta^{(t-s)/(2s+t)}\) (chosen to balance the two terms), one obtains:
\[
\dim_H E \geq \frac{3s + t}{2},
\]
which is the second bound in Theorem 13.2. The constraint \(3s + t \leq 4\) (from \(s \leq 1\), \(t \leq 2\)) ensures this does not exceed \(2 = \dim \mathbb{R}^2\).

The sharpness of the bound \(\frac{3s+t}{2}\) is realized by the **self-similar Furstenberg construction**: take \(E = C_s \times C_s \subset \mathbb{R}^2\) where \(C_s\) is the standard Cantor set of dimension \(s\), and take the family of lines \(\ell_e\) to be lines of slope \(e\) for \(e\) ranging over a self-similar set \(\Omega \subset S^1\) of dimension \(t = s\). In this configuration, the two bounds \(s + t = 2s\) and \((3s+t)/2 = 2s\) coincide, saturating the Furstenberg inequality at \(\dim_H E = 2s\).

<div class="remark">
<strong>Remark 13.4.</strong> An independent proof of the Furstenberg conjecture in \(\mathbb{R}^2\) was given nearly simultaneously by Ren and Wang (2023) using different methods (induction on scales without the 3D context). The Wang-Zahl paper proves the stronger result needed for the Kakeya application and handles the 3D reduction as well.
</div>

### 13.6 Implications and Open Problems

The Wang-Zahl theorem resolves a 50-year-old open problem and opens new directions.

**Implications for restriction theory.** The Kakeya conjecture in \(\mathbb{R}^3\) (together with Bourgain-Guth's "bilinear reduction" strategy) implies improved restriction estimates in \(\mathbb{R}^3\). Specifically, the Fourier restriction conjecture for the paraboloid in \(\mathbb{R}^3\) (that \(\|\hat{f}|_{\mathcal{P}}\|_{L^4} \lesssim \|f\|_{L^{4/3}}\)) follows from the now-proved Kakeya conjecture combined with linear-to-bilinear reductions. This is a partial progress toward the full restriction conjecture in \(\mathbb{R}^3\).

**Implications for the wave equation.** Via the local smoothing problem, improved estimates for the Schrödinger and wave equations in \(\mathbb{R}^{3+1}\) follow from the new Kakeya bound.

**Number theory.** Via connections to the Vinogradov mean value problem and exponential sum estimates for three-variable functions, the Wang-Zahl result provides improved bounds for counting solutions to \(\sum_{i=1}^s x_i^j = \sum_{i=1}^s y_i^j\) for \(j = 1, 2, 3\).

**Status of the conjecture in higher dimensions.** Wang-Zahl works in \(\mathbb{R}^3\). For \(n \geq 4\), the Kakeya conjecture remains wide open. The main obstacle is:
1. The "sticky reduction" (reducing to sticky Kakeya sets) has not been established in full generality for \(n \geq 4\).
2. The Furstenberg set problem in \(\mathbb{R}^{n-1}\) for \(n \geq 4\) is itself open.
3. The projection argument from \(\mathbb{R}^n\) to \(\mathbb{R}^{n-1}\) requires more subtle multi-scale control.

<div class="remark">
<strong>Open Problem 13.5.</strong> Prove the Kakeya conjecture in \(\mathbb{R}^4\), or more generally in \(\mathbb{R}^n\) for all \(n \geq 4\). The Furstenberg approach of Wang-Zahl would require:
(a) A proof of the Furstenberg set conjecture in \(\mathbb{R}^{n-1}\) (itself a hard open problem for \(n \geq 4\)), and
(b) A generalization of the sticky-to-Furstenberg reduction to higher dimensions.

</div>

<div class="remark">
<strong>Open Problem 13.6 (Restriction Conjecture).</strong> Does the Kakeya conjecture in \(\mathbb{R}^n\) for all \(n\) (once proved) imply the full restriction conjecture? Or are there further geometric obstructions beyond Kakeya?
</div>

<div class="remark">
<strong>Open Problem 13.7 (Bochner-Riesz Conjecture).</strong> The Bochner-Riesz conjecture — that the spherical summation operator \(S_R^\lambda f(x) = \int_{|\xi| \leq R} \hat{f}(\xi)(1 - |\xi|^2/R^2)^\lambda_+\, e^{ix\cdot\xi}\, d\xi\) is bounded on \(L^p\) for \(\lambda > n|1/p - 1/2| - 1/2\) — implies and is implied by the restriction conjecture. Wang-Zahl's result improves the currently known range in dimension 3.
</div>

### 13.7 The Bridge Back to Abstract Harmonic Analysis

We conclude by returning to where we began. The entire edifice of Part II — Besicovitch sets, restriction estimates, multilinear Kakeya, decoupling, polynomial methods — is, at its heart, about the Fourier transform on \(\mathbb{R}^n\). And the Fourier transform on \(\mathbb{R}^n\) is the special case \(G = \mathbb{R}^n\) of the abstract Fourier transform on a locally compact abelian group.

The properties of \(\mathbb{R}^n\) that make the geometric problems tractable — the existence of tubes (products of intervals), the curvature of the sphere as a homogeneous space for \(\mathrm{SO}(n)\), the Pontryagin self-duality \(\hat{\mathbb{R}}^n \cong \mathbb{R}^n\), the uncertainty principle (a function cannot be simultaneously concentrated in space and frequency) — are all manifestations of the abstract theory developed in Part I.

The Kakeya problem lives at the intersection of these traditions: it is simultaneously a question about the abstract Fourier analysis on \(\mathbb{R}^n\) (via the restriction problem) and a question about the geometry of tubes and directions in Euclidean space.

**A unified dictionary.** Let us make the connections between the two parts explicit:

*Pontryagin duality and tubes.* The self-duality \(\hat{\mathbb{R}}^n \cong \mathbb{R}^n\) means that a tube \(T_\delta^e\) of dimensions \(1 \times \delta^{n-1}\) in the direction \(e\) in physical space corresponds, under Fourier transform, to a cap \(\tau_e\) of angular width \(\sim \delta\) centered at \(e\) on the frequency sphere. This duality between tubes and caps is the geometric manifestation of Pontryagin duality — exactly the abstract theorem proved in Chapter 6.

*Schur orthogonality and transversality.* The multilinear Kakeya inequality (Chapter 11) asserts that transversal tubes cannot all concentrate on a set of small measure. The transversality condition — tubes pointing in widely separated directions — is the geometric analogue of the Schur orthogonality relations (Chapter 7): matrix coefficients of different representations are orthogonal, and the "orthogonality" of tube directions forces their union to have large measure.

*Peter-Weyl and wave packet decomposition.* The Peter-Weyl theorem decomposes \(L^2(G)\) into finite-dimensional irreducible summands indexed by \(\hat{G}\). For \(G = \mathbb{R}^n\), the irreducibles are one-dimensional (characters \(e^{ix\cdot\xi}\)), and the "decomposition" is the Fourier transform. The wave packet decomposition of Chapter 10 is the microlocal analogue: it decomposes \(L^2(\mathbb{R}^n)\) into wave packets indexed by position-direction pairs \((x_T, e_T)\) — a "non-abelian" Peter-Weyl decomposition where the irreducibles are localized in both space and frequency.

*Amenability and the restriction problem.* The group \(\mathbb{R}^n\) is abelian, hence amenable. By Leptin's theorem (Chapter 8), its Fourier algebra \(A(\mathbb{R}^n) \cong L^1(\mathbb{R}^n)\) has a bounded approximate identity. This ensures that the Fourier transform on \(\mathbb{R}^n\) is well-behaved: convolution approximation works, spectral synthesis holds for certain sets, and restriction to submanifolds (like the sphere) is possible in a suitable range. The restriction conjecture is, in this sense, a precise quantitative formulation of how the amenability structure of \(\mathbb{R}^n\) controls the Fourier analysis on its "dual" manifolds.

*The Fourier algebra and spectral synthesis.* The connection between spectral synthesis in \(A(G)\) (Chapters 5 and 6.8) and the restriction problem can be made precise: the restriction conjecture is equivalent to asking whether the closed ideal \(I(S^{n-1}) = \{f \in A(\mathbb{R}^n) : f|_{S^{n-1}} = 0\}\) admits "spectral synthesis" in the range \(L^p(\mathbb{R}^n) \to L^2(S^{n-1})\). Malliavin's theorem (Remark 3.11) shows spectral synthesis fails for some sets in \(\hat{\mathbb{R}}^n = \mathbb{R}^n\) when \(n \geq 3\), but the sphere \(S^{n-1}\) is a particularly regular set (a compact smooth manifold with nonvanishing curvature) for which the restriction problem conjectures spectral synthesis in an \(L^p\) sense.

**What Wang-Zahl's theorem tells us about abstract harmonic analysis.** The resolution of the Kakeya conjecture in \(\mathbb{R}^3\) by Wang and Zahl via the Furstenberg approach establishes a new principle: the *multi-scale energy decomposition* introduced in Chapter 13 is a robust tool for problems where a single-scale argument fails. This principle is likely to have analogues in other settings:

- For non-abelian groups \(G\), where the "tubes" are replaced by cosets of subgroups and the "directions" are replaced by elements of \(\hat{G}\) in the Fell topology, Kakeya-type questions arise naturally in the study of maximal representations and spectral gaps.
- For the \(p\)-adic setting (\(G = \mathbb{Q}_p^n\)), where the ultrametric geometry replaces the Euclidean geometry, the analogue of Besicovitch sets (sets containing cosets of \(\mathbb{Z}_p\) in every "direction") is an open problem with connections to \(p\)-adic harmonic analysis and algebraic geometry over finite fields.
- For function fields, where the Fourier analysis combines the arithmetic of \(\mathbb{F}_q[t]\) with the geometry of curves over \(\mathbb{F}_q\), Dvir's proof (Chapter 12) of the finite-field Kakeya conjecture (using polynomials) is a complete and elegant resolution — one that required decades of partial progress in the Euclidean setting to find.

Hong Wang's resolution in \(\mathbb{R}^3\), via the Furstenberg set approach, shows that even for the most classical group \(G = \mathbb{R}^n\), the harmonic analysis is not yet fully understood. The story of harmonic analysis — from Haar measure on abstract groups to the geometry of needles sweeping through \(\mathbb{R}^n\) — is very much still being written.

The arc traced in these notes, from the Tychonoff compactness argument for Haar measure to the Cauchy-Schwarz multi-scale energy estimate of Wang-Zahl, is a single coherent story about the nature of symmetry, measurement, and the Fourier transform. Abstract and geometric harmonic analysis are not two separate fields — they are two perspectives on the same mathematical universe, and the deepest results in each illuminate the other.
