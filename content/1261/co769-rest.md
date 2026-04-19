---
title: "CO 769: Topics in Continuous Optimization"
subjects: "CO"
---

*These notes synthesize material from multiple offerings of CO 769 (Topics in Continuous Optimization) at the University of Waterloo, drawing on standard references in semidefinite programming, conic optimization, and optimal transport. Sources include Wolkowicz, Saigal, and Vandenberghe's <em>Handbook of Semidefinite Programming</em> (Springer, 2000); Boyd and Vandenberghe's <em>Convex Optimization</em> (Cambridge UP, 2004; freely available at the authors' site); Drusvyatskiy and Wolkowicz's survey <em>The many faces of degeneracy in conic optimization</em> (arXiv:1706.03705); Ben-Tal and Nemirovski's <em>Lectures on Modern Convex Optimization</em> (SIAM, 2001); Villani's <em>Optimal Transport: Old and New</em> (Springer Grundlehren, 2009); Santambrogio's <em>Optimal Transport for Applied Mathematicians</em> (Birkhäuser, 2015); and Peyré and Cuturi's <em>Computational Optimal Transport</em> (Foundations and Trends in Machine Learning, freely available at optimaltransport.github.io), supplemented by Cuturi's <em>Sinkhorn Distances</em> (NeurIPS 2013) and various public lecture notes. All sources credited below.*

---

# Chapter 1: Facial Reduction in Semidefinite Programming

Taught at UW as CO 769 in Winter 2016 by Henry Wolkowicz.

Semidefinite programming (SDP) sits at the centre of modern continuous optimization: it generalizes linear programming, captures convex relaxations of hard combinatorial problems, and supports a mature interior-point theory. Yet a recurring obstacle in practical SDP is the breakdown of strong duality when the feasible region fails to contain a strictly feasible point. This chapter develops the basics of SDP, explains why such breakdown occurs through the geometry of the positive semidefinite cone, and presents <em>facial reduction</em> as the canonical regularization procedure. The treatment follows Wolkowicz's Winter 2016 syllabus and the Drusvyatskiy–Wolkowicz survey.

## 1.1 Semidefinite Programming and Conic Duality

Let \(\mathbb{S}^n\) denote the space of \(n \times n\) real symmetric matrices, equipped with the trace inner product \(\langle A, B \rangle = \mathrm{tr}(AB)\). The positive semidefinite cone is

\[
\mathbb{S}^n_+ = \{X \in \mathbb{S}^n : X \succeq 0\} = \{X \in \mathbb{S}^n : v^\top X v \ge 0 \text{ for all } v \in \mathbb{R}^n\}.
\]

This cone is closed, convex, pointed, and self-dual. A semidefinite program in standard primal form is

\[
(P) \quad \min_{X \in \mathbb{S}^n} \; \langle C, X \rangle \quad \text{subject to} \quad \mathcal{A}(X) = b, \;\; X \succeq 0,
\]

where \(\mathcal{A} : \mathbb{S}^n \to \mathbb{R}^m\) is a linear map sending \(X \mapsto (\langle A_i, X \rangle)_{i=1}^m\) and \(C \in \mathbb{S}^n\), \(b \in \mathbb{R}^m\). The Lagrangian dual reads

\[
(D) \quad \max_{y \in \mathbb{R}^m} \; b^\top y \quad \text{subject to} \quad C - \mathcal{A}^*(y) \succeq 0,
\]

where \(\mathcal{A}^*(y) = \sum_{i=1}^m y_i A_i\) is the adjoint. Weak duality \(\langle C, X \rangle \ge b^\top y\) holds unconditionally, since \(\langle C - \mathcal{A}^*(y), X\rangle \ge 0\) for any primal-feasible \(X\) and dual-feasible \(y\).

<div class="definition">
<strong>Definition 1.1 (Conic program over a closed convex cone).</strong> Let \(\mathcal{K} \subseteq \mathbb{S}^n\) be a closed convex cone with dual cone \(\mathcal{K}^* = \{S : \langle S, X\rangle \ge 0 \text{ for all } X \in \mathcal{K}\}\). A <em>conic program</em> is \(\min \langle C, X\rangle\) subject to \(\mathcal{A}(X) = b\), \(X \in \mathcal{K}\). Its conic dual is \(\max b^\top y\) subject to \(C - \mathcal{A}^*(y) \in \mathcal{K}^*\). When \(\mathcal{K} = \mathbb{R}^n_+\) we recover linear programming; when \(\mathcal{K} = \mathbb{S}^n_+\) we recover SDP; when \(\mathcal{K}\) is a Lorentz cone we recover second-order cone programming.
</div>

The fundamental qualitative difference between LP and SDP is that for LP, strong duality holds whenever both problems are feasible; for SDP, this can fail even when both problems have finite optimal value. The reason is geometric: \(\mathbb{R}^n_+\) is a polyhedral cone with finitely many faces, whereas \(\mathbb{S}^n_+\) is a smooth (non-polyhedral) cone whose faces form a continuum parameterized by subspaces of \(\mathbb{R}^n\).

<div class="theorem">
<strong>Theorem 1.2 (Conic weak duality and complementary slackness).</strong> For any feasible \(X\) for \((P)\) and feasible \(y\) for \((D)\), \(\langle C, X\rangle - b^\top y = \langle C - \mathcal{A}^*(y), X\rangle \ge 0\). Equality holds if and only if \(\langle Z, X\rangle = 0\) where \(Z = C - \mathcal{A}^*(y)\). For \(X, Z \succeq 0\), \(\langle Z, X\rangle = 0\) is equivalent to \(ZX = 0\), and equivalent to \(\mathrm{range}(X) \subseteq \ker(Z)\).
</div>

## 1.2 Slater's Condition and the Failure of Strong Duality

The classical sufficient condition for strong duality in convex optimization is <em>Slater's condition</em>, requiring the existence of a strictly feasible point.

<div class="definition">
<strong>Definition 1.3 (Strict feasibility / Slater).</strong> Problem \((P)\) is <em>strictly feasible</em> (satisfies Slater's condition) if there exists \(\hat{X}\) with \(\mathcal{A}(\hat{X}) = b\) and \(\hat{X} \succ 0\) (positive definite, i.e. in the relative interior of \(\mathbb{S}^n_+\)). Problem \((D)\) is strictly feasible if there exists \(\hat{y}\) with \(C - \mathcal{A}^*(\hat{y}) \succ 0\).
</div>

<div class="theorem">
<strong>Theorem 1.4 (Strong duality under Slater).</strong> If \((P)\) has a finite optimal value and \((P)\) is strictly feasible, then \((D)\) is solvable and the optimal values agree. Symmetrically for \((D)\) strictly feasible. If both \((P)\) and \((D)\) are strictly feasible, both are solvable, both have the same finite value, and any primal-dual optimal pair satisfies the complementary slackness \(ZX = 0\).
</div>

When Slater fails, strong duality may fail in any of three pathological ways: the optimal values may differ (a positive <em>duality gap</em>); the dual may be unattained (the supremum is not achieved); or the values may agree but neither problem attains a useful KKT certificate. The Drusvyatskiy–Wolkowicz survey calls these phenomena collectively "the many faces of degeneracy."

<div class="example">
<strong>Example 1.5 (A nonzero duality gap).</strong> Consider the SDP with \(n = 2\), \(C = \left[\begin{smallmatrix} 0 & 1 \\ 1 & 0 \end{smallmatrix}\right]\), and the single equality \(X_{11} = 0\). Primal feasibility forces \(X = \left[\begin{smallmatrix} 0 & 0 \\ 0 & x_{22}\end{smallmatrix}\right]\) with \(x_{22} \ge 0\), so the primal objective is identically \(0\). The dual is \(\max \; 0 \cdot y\) subject to \(\left[\begin{smallmatrix} -y & 1 \\ 1 & 0\end{smallmatrix}\right] \succeq 0\), which forces the off-diagonal entry to vanish — impossible. So the dual is infeasible while the primal value is \(0\). The primal lacks a strictly feasible point because every feasible \(X\) has rank at most \(1\); equivalently, the feasible set lies entirely in a proper face of \(\mathbb{S}^2_+\).
</div>

This example illustrates the geometric picture: when the affine subspace \(\{X : \mathcal{A}(X) = b\}\) does not meet the interior of \(\mathbb{S}^n_+\), the feasible set is confined to a proper face, and the dual fails to "see" this confinement.

## 1.3 Faces of the Semidefinite Cone

To formalize facial reduction, we need the face lattice of \(\mathbb{S}^n_+\).

<div class="definition">
<strong>Definition 1.6 (Face).</strong> A convex subset \(F\) of a convex set \(\mathcal{K}\) is a <em>face</em> if for every line segment in \(\mathcal{K}\) whose relative interior intersects \(F\), the entire segment lies in \(F\). Equivalently, \(F\) is a face if \(x, y \in \mathcal{K}\) and \(\frac{1}{2}(x + y) \in F\) implies \(x, y \in F\). The faces of \(\mathcal{K}\) form a complete lattice under inclusion.
</div>

<div class="theorem">
<strong>Theorem 1.7 (Faces of \(\mathbb{S}^n_+\)).</strong> Every face \(F\) of \(\mathbb{S}^n_+\) has the form
\[
F_V = \{X \in \mathbb{S}^n_+ : \mathrm{range}(X) \subseteq V\}
\]
for a unique subspace \(V \subseteq \mathbb{R}^n\). If \(V\) has dimension \(r\) and \(P \in \mathbb{R}^{n \times r}\) has columns forming an orthonormal basis of \(V\), then \(F_V\) is linearly isomorphic to \(\mathbb{S}^r_+\) via \(X \mapsto P^\top X P\). The face lattice of \(\mathbb{S}^n_+\) is therefore isomorphic to the lattice of subspaces of \(\mathbb{R}^n\).
</div>

Thus \(\mathbb{S}^n_+\) is "self-replicating" in Wolkowicz's terminology: each face is itself isomorphic to a smaller positive semidefinite cone. The minimal face containing a given convex set \(\mathcal{F}\) is denoted \(\mathrm{face}(\mathcal{F}, \mathbb{S}^n_+)\); its associated subspace is \(\mathrm{span}\{\mathrm{range}(X) : X \in \mathcal{F}\}\).

<div class="remark">
<strong>Remark (Singularity degree).</strong> The <em>singularity degree</em> \(\mathrm{sd}(P)\) of an SDP is the minimum number of facial reduction steps required to produce a strictly feasible reformulation. Singularity degree zero corresponds to Slater holding from the outset. Drusvyatskiy and Wolkowicz proved that the singularity degree governs the worst-case Hölder exponent in error bounds for the feasible set: a problem with singularity degree \(d\) admits an error bound with exponent \(2^{-d}\), which deteriorates rapidly as \(d\) grows.
</div>

## 1.4 The Theorem of the Alternative and Facial Reduction

Facial reduction rests on the following theorem of the alternative, a conic generalization of Farkas's lemma adapted to the absence of Slater.

<div class="theorem">
<strong>Theorem 1.8 (Borwein–Wolkowicz reduction certificate).</strong> Suppose \((P)\) is feasible but not strictly feasible. Then exactly one of the following holds: either there exists \(\hat{X} \succ 0\) with \(\mathcal{A}(\hat{X}) = b\) (Slater holds, contradicting our assumption); or there exist \(0 \neq y \in \mathbb{R}^m\) and \(0 \neq Z \in \mathbb{S}^n_+\) with \(\mathcal{A}^*(y) = -Z\) and \(b^\top y = 0\). In the latter case, \(Z\) is orthogonal to every feasible \(X\), and \(\ker(Z)\) contains the range of every feasible \(X\).
</div>

The vector \(y\) (equivalently the matrix \(Z\)) is an <em>exposing certificate</em>: it certifies that the feasible set lies in the proper face \(F_{\ker(Z)}\) of \(\mathbb{S}^n_+\). Restricting the SDP to this face yields an equivalent problem of strictly smaller dimension. Iterating produces the facial reduction algorithm.

<div class="theorem">
<strong>Theorem 1.9 (Facial reduction algorithm).</strong> Set \(\mathcal{K}_0 = \mathbb{S}^n_+\). At iteration \(k\), if the current restricted problem fails Slater, find an exposing certificate \(Z_k \in \mathcal{K}_k^* \setminus \{0\}\) with \(\mathcal{A}^*(y_k) = -Z_k\), \(b^\top y_k = 0\). Set \(\mathcal{K}_{k+1} = \mathcal{K}_k \cap \{Z_k\}^\perp\), which is a proper face of \(\mathcal{K}_k\). The dimension of \(\mathcal{K}_k\) strictly decreases, so the algorithm terminates in at most \(n\) steps with a face \(\mathcal{K}_d \cong \mathbb{S}^r_+\) on which the restricted SDP is strictly feasible. After change of variables \(X = P X' P^\top\) with \(P \in \mathbb{R}^{n \times r}\) spanning the face's subspace, the regularized problem
\[
\min \; \langle P^\top C P, X'\rangle \quad \text{subject to} \quad \mathcal{A}(P X' P^\top) = b, \;\; X' \succ 0
\]
has the same optimal value as \((P)\) and satisfies strong duality with its own dual.
</div>

<div class="proof">
<strong>Proof sketch.</strong> Theorem 1.8 supplies a nonzero \(Z \succeq 0\) in the orthogonal complement of the affine span of the feasible set, with \(Z \in \mathrm{range}(\mathcal{A}^*)\) and \(\langle Z, b\rangle = 0\). For any feasible \(X\), \(\langle Z, X\rangle = \langle \mathcal{A}^*(y), X\rangle = y^\top \mathcal{A}(X) = y^\top b = 0\), so \(\mathrm{range}(X) \subseteq \ker(Z)\). Hence the feasible set sits inside the face \(F_{\ker Z}\). Restricting the problem to this face and iterating produces a strictly decreasing chain of faces; the chain must terminate because the face lattice has finite height \(n\). On the terminal face, Slater is satisfied for the restricted problem by construction.
</div>

Numerically, computing exposing certificates is itself an SDP, so practical facial reduction trades one ill-posed problem for a sequence of well-posed but smaller ones, plus auxiliary subproblems for finding \(y_k\). Considerable effort has gone into computing certificates approximately via Sturm-style error bounds, alternating projections between affine subspaces and \(\mathbb{S}^n_+\), and exploiting problem-specific structure such as sparsity and symmetry.

<div class="remark">
<strong>Remark (Why the failure is generic in applications).</strong> One might expect Slater to hold for "most" SDPs. In fact, SDP relaxations of combinatorial problems systematically fail Slater. The reason is that lifting a discrete variable \(x \in \{-1,+1\}^n\) to a rank-one matrix \(X = xx^\top\) and then convexifying produces a feasible region containing many low-rank matrices. When the original combinatorial constraints induce algebraic relations (e.g. \(X_{ii} = 1\) plus structural equalities), the only feasible matrices may be confined to a proper face. Examples include the second SDP lift of Max-Cut, quadratic assignment problem (QAP) relaxations, graph partitioning lifts, and Euclidean distance matrix completion problems.
</div>

## 1.5 Applications

The Wolkowicz syllabus emphasizes several application areas where facial reduction has had decisive impact.

<div class="example">
<strong>Example 1.10 (Euclidean distance matrices and sensor network localization).</strong> A matrix \(D \in \mathbb{R}^{n \times n}\) with \(D_{ij} = \|p_i - p_j\|^2\) for points \(p_1, \ldots, p_n \in \mathbb{R}^d\) is a <em>Euclidean distance matrix (EDM)</em>. The set of EDMs is the image under a linear map of \(\mathbb{S}^n_+\) intersected with the hyperplane \(\mathrm{diag}(X) = 0\) after a centering operation. EDM completion — recovering missing distances from a partial matrix — is naturally an SDP. For sensor network localization, where pairwise distances are known only between nearby sensors, the SDP relaxation routinely fails Slater because anchor positions and the rank constraint force the feasible set into a proper face. Facial reduction restores strong duality and produces stable, certifiable solutions; this work, developed in Wolkowicz's group, became a model for principled SDP regularization.
</div>

<div class="example">
<strong>Example 1.11 (Polynomial optimization and sum-of-squares).</strong> Lasserre's hierarchy formulates polynomial optimization problems as SDPs over moment matrices. When the feasible set has empty interior in moment space — for instance when equality constraints among polynomials force algebraic relations — the SDP fails Slater. Facial reduction here corresponds to elimination methods for sparse SOS polynomials and to exploiting the algebraic structure of the constraint ideal. Permenter and Parrilo's <em>partial facial reduction</em> via approximate cone projections has become a standard preprocessing step in modern SOS solvers.
</div>

<div class="example">
<strong>Example 1.12 (Quadratic assignment and graph partitioning).</strong> The QAP — minimize \(\mathrm{tr}(AXBX^\top)\) over permutation matrices \(X\) — admits a powerful SDP relaxation through doubly nonnegative lifts. The lift's feasible region lies in a proper face of \(\mathbb{S}^{n^2}_+\) of dimension governed by combinatorial symmetries. Facial reduction reduces the relaxation to an SDP whose size matches the intrinsic degrees of freedom (roughly \(O(n^2)\) instead of \(O(n^4)\) variables), enabling provably tight bounds on instances that were previously out of reach.
</div>

The cumulative message of the course is that facial reduction is not a niche fix-up but a structural preprocessing step that should accompany every conic relaxation of a combinatorial problem. Its theoretical importance is matched by tangible computational gains: regularized SDPs are stable under perturbation, admit accurate interior-point solutions, and certify their optima via genuine KKT pairs.

---

# Chapter 2: Optimal Transport

Planned for CO 769 in Winter 2026 (instructor TBA). The following chapter sketches the topics that any modern course on optimal transport at the graduate level would cover, drawing on the standard references of Villani, Santambrogio, and Peyré–Cuturi.

Optimal transport (OT) studies how to move mass from one distribution to another with minimum cost. Originating in Monge's 1781 memoir on cuttings and embankments, the theory was reborn through Kantorovich's linear-programming relaxation in the 1940s and has since spread through analysis, geometry, PDE, probability, statistics, and machine learning. CO 769 in this incarnation would treat OT as a continuous optimization problem par excellence: infinite-dimensional, convex (after Kantorovich), endowed with rich duality, and tractable via discretization and entropic regularization.

## 2.1 The Monge and Kantorovich Problems

Let \(X, Y\) be Polish spaces (typically \(\mathbb{R}^d\)) equipped with Borel probability measures \(\mu \in \mathcal{P}(X)\) and \(\nu \in \mathcal{P}(Y)\), and let \(c : X \times Y \to [0, +\infty]\) be a lower semicontinuous cost function.

<div class="definition">
<strong>Definition 2.1 (Monge problem).</strong> The <em>Monge problem</em> is to find a measurable map \(T : X \to Y\) with pushforward \(T_\# \mu = \nu\) (i.e. \(\nu(B) = \mu(T^{-1}(B))\) for all Borel \(B\)), minimizing the transport cost
\[
\mathcal{M}(T) = \int_X c(x, T(x)) \, d\mu(x).
\]
A Monge map need not exist (e.g. if \(\mu\) is a Dirac mass and \(\nu\) is not), and the constraint \(T_\# \mu = \nu\) is highly nonconvex. This is what motivated Kantorovich's relaxation.
</div>

<div class="definition">
<strong>Definition 2.2 (Kantorovich problem).</strong> A <em>transport plan</em> (or coupling) is a probability measure \(\pi \in \mathcal{P}(X \times Y)\) whose marginals are \(\mu\) and \(\nu\): \((\mathrm{proj}_X)_\# \pi = \mu\) and \((\mathrm{proj}_Y)_\# \pi = \nu\). Denote the set of such plans by \(\Pi(\mu, \nu)\). The <em>Kantorovich problem</em> is
\[
\mathcal{K}(\mu, \nu) = \inf_{\pi \in \Pi(\mu, \nu)} \int_{X \times Y} c(x, y) \, d\pi(x, y).
\]
The set \(\Pi(\mu, \nu)\) is convex and weakly compact (by Prokhorov's theorem and tightness of marginals), so for lower semicontinuous \(c\) the infimum is attained.
</div>

Kantorovich's brilliance was to recognize that allowing mass to be split — a particle at \(x\) may be sent partly to \(y_1\) and partly to \(y_2\) — convexifies the problem without changing its value when a Monge solution exists. The Kantorovich functional is a linear program over the convex set \(\Pi(\mu, \nu)\).

<div class="theorem">
<strong>Theorem 2.3 (Kantorovich duality).</strong> Under mild hypotheses on \(c\),
\[
\mathcal{K}(\mu, \nu) = \sup \left\{ \int_X \varphi \, d\mu + \int_Y \psi \, d\nu : \varphi(x) + \psi(y) \le c(x, y) \right\},
\]
where the supremum runs over pairs \((\varphi, \psi) \in L^1(\mu) \times L^1(\nu)\). The dual is attained by a pair of <em>c-conjugate</em> potentials, defined via \(\psi(y) = \inf_x (c(x,y) - \varphi(x))\) and symmetrically.
</div>

This duality is the OT analogue of LP duality, with potentials \((\varphi, \psi)\) playing the role of dual variables for the marginal constraints. Strong duality holds without any Slater-type qualification, owing to the compactness of \(\Pi(\mu, \nu)\) and lower semicontinuity of \(c\).

## 2.2 Structure of Optimal Plans: c-Cyclical Monotonicity and Brenier

<div class="definition">
<strong>Definition 2.4 (c-cyclical monotonicity).</strong> A subset \(\Gamma \subseteq X \times Y\) is <em>c-cyclically monotone</em> if for every finite collection of points \((x_1, y_1), \ldots, (x_n, y_n) \in \Gamma\) and every permutation \(\sigma\),
\[
\sum_{i=1}^n c(x_i, y_i) \le \sum_{i=1}^n c(x_i, y_{\sigma(i)}).
\]
A transport plan \(\pi\) is optimal if and only if its support is c-cyclically monotone (under integrability of \(c\)).
</div>

Cyclical monotonicity is the OT-native optimality condition, generalizing the classical Rockafellar characterization of subdifferentials of convex functions (the case \(c(x,y) = -\langle x, y\rangle\)). In the quadratic case \(c(x,y) = \frac{1}{2}\|x - y\|^2\), c-cyclical monotonicity reduces to ordinary cyclical monotonicity of the support of \(\pi\) viewed as a relation between \(x\) and \(y\), which is equivalent to that support being contained in the graph of the subdifferential of a convex function.

<div class="theorem">
<strong>Theorem 2.5 (Brenier).</strong> Let \(\mu, \nu \in \mathcal{P}_2(\mathbb{R}^d)\) (probability measures with finite second moment) with \(\mu\) absolutely continuous with respect to Lebesgue measure. Then for the quadratic cost \(c(x,y) = \frac{1}{2}\|x-y\|^2\), the Kantorovich problem admits a unique optimal plan, and this plan is concentrated on the graph of a map \(T = \nabla \phi\), where \(\phi : \mathbb{R}^d \to \mathbb{R}\) is convex. The map \(T\) is the unique solution of the Monge problem and is called the <em>Brenier map</em>. Equivalently, every measure absolutely continuous with respect to Lebesgue can be sent to any other measure of finite second moment via the gradient of a convex function, and this map is unique \(\mu\)-almost everywhere.
</div>

Brenier's theorem is the structural heart of quadratic OT. It ties optimal transport to the Monge–Ampère equation: the convex potential \(\phi\) satisfies \(\det(\nabla^2 \phi(x)) = \rho_\mu(x) / \rho_\nu(\nabla \phi(x))\) (in the regular case), connecting OT to fully nonlinear PDE. McCann's later generalization to manifolds replaces \(\nabla \phi\) with \(\exp_x(\nabla \phi)\) and underlies the Lott–Sturm–Villani synthetic theory of Ricci curvature on metric measure spaces.

## 2.3 Wasserstein Distance and Dynamic Formulation

<div class="definition">
<strong>Definition 2.6 (Wasserstein distance).</strong> For \(p \ge 1\) and \(\mu, \nu \in \mathcal{P}_p(\mathbb{R}^d)\), the <em>p-Wasserstein distance</em> is
\[
W_p(\mu, \nu) = \left( \inf_{\pi \in \Pi(\mu, \nu)} \int \|x - y\|^p \, d\pi(x,y) \right)^{1/p}.
\]
For \(p \ge 1\), \(W_p\) is a metric on \(\mathcal{P}_p(\mathbb{R}^d)\) that metrizes weak convergence plus convergence of \(p\)-th moments. The space \((\mathcal{P}_2(\mathbb{R}^d), W_2)\), called <em>Wasserstein space</em>, is a complete, separable geodesic space with a formal Riemannian structure due to Otto.
</div>

The Wasserstein distance is a genuine metric, satisfying the triangle inequality through "gluing" of optimal plans. Unlike total variation or KL divergence, \(W_p\) is sensitive to the spatial geometry of the supports — moving mass farther costs more.

<div class="theorem">
<strong>Theorem 2.7 (Benamou–Brenier dynamic formulation).</strong> For \(\mu_0, \mu_1 \in \mathcal{P}_2(\mathbb{R}^d)\),
\[
W_2^2(\mu_0, \mu_1) = \inf_{(\rho_t, v_t)} \int_0^1 \!\! \int_{\mathbb{R}^d} \|v_t(x)\|^2 \, d\rho_t(x) \, dt
\]
where the infimum runs over time-dependent densities \(\rho_t\) and velocity fields \(v_t\) satisfying the continuity equation \(\partial_t \rho_t + \nabla \cdot (\rho_t v_t) = 0\) with boundary conditions \(\rho_0 = \mu_0\), \(\rho_1 = \mu_1\). The optimal flow corresponds to displacement interpolation along Wasserstein geodesics.
</div>

This dynamic reformulation reframes OT as a problem of <em>minimum-energy mass transport</em> in a fluid-mechanical sense, opening the door to PDE methods and motivating the Otto calculus on \(\mathcal{P}_2\). It also yields a convex (in \((\rho, m)\) with \(m = \rho v\)) optimization problem that can be discretized and solved by augmented Lagrangian methods.

## 2.4 Entropic Regularization and Sinkhorn

The Kantorovich LP, when discretized to \(n\) source and \(n\) target points, becomes a linear program with \(n^2\) variables and \(2n - 1\) effective marginal constraints, at cost \(\tilde{O}(n^3)\) per simplex iteration. Cuturi's 2013 insight was to add an entropy regularizer, producing a strictly convex problem solvable by a simple matrix-scaling iteration.

<div class="definition">
<strong>Definition 2.8 (Entropic OT and Sinkhorn divergence).</strong> Given marginals \(a \in \Delta^n\), \(b \in \Delta^n\) and a cost matrix \(C \in \mathbb{R}^{n \times n}\), the <em>entropic OT problem</em> with regularization \(\varepsilon > 0\) is
\[
W_\varepsilon(a, b) = \min_{P \in U(a,b)} \left\langle C, P\right\rangle - \varepsilon H(P), \quad H(P) = -\sum_{ij} P_{ij}(\log P_{ij} - 1),
\]
where \(U(a,b) = \{P \in \mathbb{R}^{n \times n}_+ : P \mathbf{1} = a, P^\top \mathbf{1} = b\}\). The unique optimizer has the form \(P^* = \mathrm{diag}(u) K \mathrm{diag}(v)\) with \(K_{ij} = \exp(-C_{ij}/\varepsilon)\), where \(u, v\) are positive scaling vectors found by alternating Sinkhorn updates \(u \leftarrow a / (Kv)\), \(v \leftarrow b / (K^\top u)\).
</div>

<div class="theorem">
<strong>Theorem 2.9 (Sinkhorn convergence).</strong> Sinkhorn's algorithm converges linearly to the unique entropic optimizer, with rate governed by the Hilbert projective metric of the kernel \(K\). As \(\varepsilon \to 0\), \(W_\varepsilon \to W\) (the unregularized OT cost) and the optimal plan converges to the maximum-entropy optimizer of the LP. As \(\varepsilon \to \infty\), \(P^*\) tends to the independent coupling \(a b^\top\).
</div>

Entropic regularization made OT computationally practical at scale and triggered an explosion of applications: Wasserstein distances between empirical distributions for ML training, generative modeling (Wasserstein GANs), domain adaptation, single-cell genomics, and shape analysis. The <em>Sinkhorn divergence</em> \(S_\varepsilon(a,b) = W_\varepsilon(a,b) - \frac{1}{2}(W_\varepsilon(a,a) + W_\varepsilon(b,b))\) corrects the entropic bias and provides a positive-definite, debiased estimator suitable for gradient-based learning.

## 2.5 Applications across Mathematics and Statistics

<div class="example">
<strong>Example 2.10 (Gradient flows in Wasserstein space).</strong> Many evolution PDEs — the heat equation, porous medium equation, Fokker–Planck equation — admit a JKO (Jordan–Kinderlehrer–Otto) variational formulation as gradient flows of free-energy functionals on \((\mathcal{P}_2, W_2)\). Each time step solves a proximal problem \(\rho^{n+1} = \arg\min_\rho \{\mathcal{F}(\rho) + \frac{1}{2\tau} W_2^2(\rho, \rho^n)\}\). This unifies dissipative PDEs under a common geometric framework and motivates structure-preserving numerical schemes.
</div>

<div class="example">
<strong>Example 2.11 (Wasserstein barycenters and shape interpolation).</strong> Given measures \(\mu_1, \ldots, \mu_K\) with weights \(\lambda_k\), the <em>Wasserstein barycenter</em> minimizes \(\sum_k \lambda_k W_2^2(\mu, \mu_k)\). Barycenters interpolate distributions in a geometry-aware way (image morphing, color transfer, atlas construction in medical imaging) and admit efficient entropic algorithms via iterated Sinkhorn projections.
</div>

<div class="example">
<strong>Example 2.12 (OT in machine learning and statistics).</strong> Wasserstein distances appear in generative adversarial networks (Arjovsky et al., 2017), where the Kantorovich dual reformulates the discriminator as a 1-Lipschitz function. In domain adaptation, OT aligns source and target distributions. In statistics, the bootstrap and uncertainty quantification through Wasserstein balls (distributionally robust optimization) provide finite-sample guarantees. In single-cell biology, OT recovers cell trajectories from snapshot data (Schiebinger et al., 2019).
</div>

The unifying message is that optimal transport equips probability measures with a geometry that respects the underlying ground space, providing a bridge between continuous optimization, PDE, geometry, and statistics. As a topics course in continuous optimization, CO 769 on OT would emphasize the convex-analytic backbone — Kantorovich duality, c-conjugates, displacement convexity — together with the algorithmic interface (Sinkhorn, Benamou–Brenier discretizations, semi-discrete OT via Laguerre tessellations) that has made the subject a workhorse of modern data science.
