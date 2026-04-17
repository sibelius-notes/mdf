---
title: "PMATH 457: Topological Dynamics and Ergodic Theory"
subjects: "PMATH"
---

## Sources and References

**Primary textbooks** — N. Hindman & D. Strauss, *Algebra in the Stone-Čech Compactification*, 2nd ed., de Gruyter, 2012; J. Auslander, *Minimal Flows and Their Extensions*, North-Holland, 1988; H. Furstenberg, *Recurrence in Ergodic Theory and Combinatorial Number Theory*, Princeton University Press, 1981.  
**Supplementary texts** — W. Parry, *Topics in Ergodic Theory*, Cambridge University Press, 1981; P. Walters, *An Introduction to Ergodic Theory*, Springer, 1982; T. Downarowicz, *Entropy in Dynamical Systems*, Cambridge University Press, 2011; D. Rudolph, *Fundamentals of Measurable Dynamics*, Oxford University Press, 1990; E. Glasner, *Ergodic Theory via Joinings*, AMS, 2003.  
**Online resources** — T. Tao's blog posts on ergodic theory and the Furstenberg correspondence principle; MIT OpenCourseWare 18.125 (Real Analysis); Cambridge Part III lecture notes on ergodic theory; Stanford lecture notes on topological dynamics; notes by Kra, Host, and Frantzikinakis on ergodic theory and combinatorics.

---

## Historical and Motivational Introduction

The subject of dynamical systems — the mathematical study of how points in a space evolve under repeated application of a rule — has its roots in one of the most celebrated failures in mathematical physics. In 1890, Henri Poincaré proved his *recurrence theorem* while attempting to solve the three-body problem: any measure-preserving transformation of a bounded region of phase space must, with probability one, return arbitrarily close to any given starting point. Poincaré's result was the first rigorous theorem in what would become ergodic theory. It shattered the naive hope of finding closed-form solutions to the three-body problem, but in doing so it opened an entirely new vista — the statistical, asymptotic study of dynamical behavior over long time scales.

The second great impetus came from Ludwig Boltzmann's *ergodic hypothesis* in statistical mechanics, roughly contemporaneous with Poincaré. Boltzmann postulated that a gas molecule moving through phase space visits, over infinite time, *every* state on its energy surface with equal frequency. This was the physical intuition that time averages and space averages should coincide. Making Boltzmann's hypothesis rigorous occupied mathematicians for four decades until George David Birkhoff proved his pointwise ergodic theorem in 1931: for almost every starting point, time averages of integrable observables converge to their space averages. The key names in the early development are Birkhoff (ergodic theorem, 1931), von Neumann (mean ergodic theorem, 1932), and Hopf (ergodic decomposition). Then came the entropy revolution: Kolmogorov (1958) imported Shannon's information-theoretic entropy into dynamics, creating an isomorphism invariant that could distinguish non-isomorphic Bernoulli shifts. Ornstein (1970) showed entropy is actually a *complete* invariant for Bernoulli shifts.

The modern subject bifurcates into two intertwined branches. *Topological dynamics* studies continuous group actions on compact Hausdorff spaces, asking questions about minimality, equicontinuity, proximality, and the algebraic structure of Ellis semigroups. *Ergodic theory* studies measure-preserving transformations and group actions on probability spaces, asking about mixing, spectral properties, entropy, and orbit equivalence. The two branches are connected at the deepest level: Furstenberg's 1967–1977 work showed that topological notions (distal extensions, equicontinuous towers) have exact measure-theoretic parallels (Furstenberg–Zimmer structure theory), and that ergodic theory can prove purely combinatorial results such as Szemerédi's theorem (1975) on arithmetic progressions. Other landmark names are: Furstenberg (structure theorems and combinatorics, 1967–1981), Ornstein (isomorphism theory, 1970), Ratner (rigidity of unipotent flows, 1991, proving the Raghunathan conjectures), and Einsiedler–Katok–Lindenstrauss (quantum unique ergodicity and Littlewood's conjecture, 2006). These notes develop both branches, from the foundational compactness arguments through the Stone–Čech compactification and ultrafilter methods, to entropy theory and Furstenberg's correspondence principle.

---

# Chapter 1: Compact Topological Dynamical Systems

## Section 1.1: Basic Definitions and Examples

The central objects of topological dynamics are **flows** — continuous actions of groups on compact Hausdorff spaces. This chapter develops the foundational vocabulary and establishes the first structural theorems.

<div class="definition">
<strong>Definition (Topological Dynamical System / Flow)</strong>: A <strong>topological dynamical system</strong> (or <strong>flow</strong>) is a triple \( (X, G, \pi) \) where \( X \) is a compact Hausdorff space, \( G \) is a topological group, and \( \pi : G \times X \to X \) is a continuous action — that is, \( \pi \) is continuous, \( \pi(e, x) = x \) for all \( x \in X \) (where \( e \) is the identity of \( G \)), and \( \pi(gh, x) = \pi(g, \pi(h, x)) \) for all \( g, h \in G \), \( x \in X \).

When \( G = \mathbb{Z} \) or \( G = \mathbb{Z}_{\geq 0} \), the system is generated by a single homeomorphism (resp. continuous self-map) \( T = \pi(1, \cdot) : X \to X \), and we write the system as \( (X, T) \). When \( G = \mathbb{R} \) the system is called a <strong>continuous flow</strong>.
</div>

We will frequently drop \( \pi \) from the notation, writing \( g \cdot x \) or \( gx \) for \( \pi(g, x) \). For a fixed \( g \in G \), the map \( x \mapsto gx \) is a homeomorphism of \( X \) (when \( G \) is a group); for a fixed \( x \in X \), the map \( g \mapsto gx \) is continuous and called the **orbit map** at \( x \).

<div class="definition">
<strong>Definition (Orbit)</strong>: The <strong>orbit</strong> of a point \( x \in X \) under a \( G \)-flow is the set \( \mathcal{O}(x) = \{ gx : g \in G \} \subseteq X \). The <strong>orbit closure</strong> of \( x \) is \( \overline{\mathcal{O}(x)} \).
</div>

<div class="example">
<strong>Example (Irrational Rotation).</strong> Let \( X = \mathbb{T} = \mathbb{R}/\mathbb{Z} \) (the circle), \( G = \mathbb{Z} \), and \( T : \mathbb{T} \to \mathbb{T} \) defined by \( T(x) = x + \alpha \pmod{1} \) for a fixed \( \alpha \in \mathbb{R} \setminus \mathbb{Q} \). This is an <em>irrational rotation</em>. It is a fundamental example: every orbit is dense in \( \mathbb{T} \), and the system is minimal (see below). More generally, for \( \alpha \in \mathbb{Q} \), every orbit is finite and periodic.
</div>

<div class="example">
<strong>Example (Shift Spaces).</strong> Let \( A \) be a finite discrete alphabet and \( X = A^{\mathbb{Z}} \) equipped with the product (Tychonoff) topology, which is compact by Tychonoff's theorem. The <em>shift map</em> \( \sigma : A^{\mathbb{Z}} \to A^{\mathbb{Z}} \) is defined by \( (\sigma x)_n = x_{n+1} \). Then \( (A^{\mathbb{Z}}, \sigma) \) is a topological dynamical system called the <em>full shift</em> on \( A \). A <em>subshift</em> is a closed \( \sigma \)-invariant subset \( X \subseteq A^{\mathbb{Z}} \), yielding a subsystem.
</div>

<div class="example">
<strong>Example (Toral Automorphisms).</strong> Let \( X = \mathbb{T}^n = \mathbb{R}^n / \mathbb{Z}^n \) and \( A \in GL(n, \mathbb{Z}) \) (an integer matrix with determinant \( \pm 1 \)). Then \( A \) induces a homeomorphism of \( \mathbb{T}^n \). For \( n = 2 \) and the matrix \( A = \begin{pmatrix} 2 & 1 \\ 1 & 1 \end{pmatrix} \) (the Arnold cat map), the resulting system is hyperbolic and mixing — an important prototype in the theory.
</div>

## Section 1.2: Invariant Sets and Minimality

Minimality captures the idea of a dynamical system with no proper closed invariant pieces — every orbit is dense, so the system cannot be decomposed into simpler subsystems. Geometrically, a minimal system is "irreducible": there is no smaller closed invariant set to which one could restrict attention. The concept is the topological analog of ergodicity in the measure-theoretic setting: just as an ergodic measure-preserving system has no non-trivial invariant sets of positive measure, a minimal topological system has no proper closed invariant sets at all. The two notions interact subtly: a minimal system need not support an ergodic measure, and an ergodic measure-preserving system need not be supported on a minimal topological orbit.

<div class="definition">
<strong>Definition (Invariant Set)</strong>: A subset \( Y \subseteq X \) of a \( G \)-flow is:
<ul>
<li><strong>positively invariant</strong> if \( gY \subseteq Y \) for all \( g \in G \) (when \( G \) acts by semigroup);
<li><strong>invariant</strong> if \( gY = Y \) for all \( g \in G \).
</ul>
A <strong>subflow</strong> is a closed invariant subset \( Y \subseteq X \) together with the restricted action. A flow is <strong>minimal</strong> if it has no proper closed invariant subsets — equivalently, every orbit is dense.
</div>

<div class="theorem">
<strong>Theorem (Existence of Minimal Subflows)</strong>: Every compact \( G \)-flow contains a minimal subflow.
</div>

<div class="proof">
<em>Proof.</em> The collection of all closed invariant nonempty subsets of \( X \), ordered by inclusion, satisfies the hypotheses of Zorn's lemma: any chain has a nonempty intersection (by compactness, a decreasing chain of nonempty compact sets has nonempty intersection, and the intersection is clearly closed and invariant). A minimal element of this poset is a minimal subflow.
</div>

<div class="remark">
<strong>Remark.</strong> This existence theorem is purely topological — no algebraic structure on \( G \) beyond acting continuously is needed. It is one of the first places where compactness of \( X \) plays an essential role.
</div>

<div class="definition">
<strong>Definition (Equicontinuity)</strong>: A \( G \)-flow \( (X, G) \) is <strong>equicontinuous</strong> if the family of maps \( \{ x \mapsto gx : g \in G \} \) is equicontinuous, i.e., for every \( \varepsilon > 0 \) there exists \( \delta > 0 \) such that \( d(x, y) < \delta \) implies \( d(gx, gy) < \varepsilon \) for all \( g \in G \).
</div>

For metrizable \( X \), equicontinuous minimal flows are exactly the **isometric** flows — those that preserve a compatible metric. They are closely related to compact group rotations, as we shall see in the chapter on Bohr compactification.

## Section 1.3: Proximality and Distality

Two points \( x, y \in X \) capture qualitatively different behaviors under the action.

<div class="definition">
<strong>Definition (Proximal and Distal Points)</strong>: In a compact \( G \)-flow \( (X, G) \), two points \( x, y \in X \) are <strong>proximal</strong> (written \( x \sim_P y \)) if

\[
\inf_{g \in G} d(gx, gy) = 0,
\]
i.e., there exists a net \( (g_\alpha) \) in \( G \) with \( \lim_\alpha g_\alpha x = \lim_\alpha g_\alpha y \). They are <strong>distal</strong> if they are not proximal. The flow itself is called:
<ul>
<li><strong>proximal</strong> if every pair \( (x, y) \) is proximal;
<li><strong>distal</strong> if every pair of distinct points is distal.
</ul>
</div>

<div class="theorem">
<strong>Theorem (Auslander–Ellis)</strong>: In a compact \( G \)-flow, every proximal pair \( (x, y) \) has a common proximal fixed point: there exists a minimal point \( z \in X \) such that \( (x, z) \) and \( (y, z) \) are proximal. In particular, a minimal proximal flow has a fixed point.
</div>

<div class="remark">
<strong>Remark.</strong> Distal flows were introduced by Hilbert and studied systematically by Auslander and Ellis. The Furstenberg structure theorem (Chapter 5) characterizes distal flows as those built from equicontinuous extensions in a transfinite tower.
</div>

## Section 1.4: Morphisms and Extensions

<div class="definition">
<strong>Definition (Homomorphism of Flows)</strong>: A <strong>homomorphism</strong> (or <strong>factor map</strong>) between \( G \)-flows \( (X, G) \) and \( (Y, G) \) is a continuous surjective map \( \phi : X \to Y \) that intertwines the actions: \( \phi(gx) = g\phi(x) \) for all \( g \in G \), \( x \in X \). We call \( (Y, G) \) a <strong>factor</strong> of \( (X, G) \) and \( (X, G) \) an <strong>extension</strong> of \( (Y, G) \). An <strong>isomorphism</strong> is a bijective homomorphism (which is automatically a homeomorphism since \( X \) is compact Hausdorff).
</div>

<div class="definition">
<strong>Definition (Equicontinuous Extension)</strong>: A factor map \( \phi : X \to Y \) is an <strong>equicontinuous extension</strong> if for every \( \varepsilon > 0 \) there exists \( \delta > 0 \) such that whenever \( d_Y(\phi(x_1), \phi(x_2)) < \delta \) and \( d_X(x_1, x_2) < \delta \), then \( d_X(gx_1, gx_2) < \varepsilon \) for all \( g \in G \).
</div>

## Section 1.5: Recurrence

<div class="definition">
<strong>Definition (Recurrent Point)</strong>: A point \( x \in X \) in a \( G \)-flow is <strong>recurrent</strong> if \( x \in \overline{\mathcal{O}(x) \setminus \{x\}} \), i.e., \( x \) returns arbitrarily close to itself under the action. More precisely (for \( G = \mathbb{Z} \)), \( x \) is recurrent if for every neighborhood \( U \ni x \) there exist infinitely many \( n \in \mathbb{Z} \) with \( T^n x \in U \).
</div>

<div class="theorem">
<strong>Theorem (Birkhoff Recurrence)</strong>: Every compact \( G \)-flow contains a recurrent point.
</div>

<div class="proof">
<em>Proof.</em> By the existence of minimal subflows, take any minimal subflow \( M \subseteq X \). Any \( x \in M \) has dense orbit in \( M \), so in particular \( x \in \overline{\mathcal{O}(x) \setminus \{x\}} \).
</div>

## Section 1.6: Worked Examples — Minimality and Equicontinuity

<div class="example">
<strong>Example (Irrational Rotation is Minimal).</strong> Let \( \alpha \in \mathbb{R} \setminus \mathbb{Q} \) and \( T : \mathbb{T} \to \mathbb{T} \), \( T(x) = x + \alpha \pmod{1} \). We claim every orbit is dense in \( \mathbb{T} \), so the system \( (\mathbb{T}, T) \) is minimal.

<em>Proof that every orbit is dense.</em> Fix \( x \in \mathbb{T} \) and let \( y \in \mathbb{T} \) and \( \varepsilon > 0 \). We must find \( n \in \mathbb{Z} \) with \( |T^n x - y| < \varepsilon \) (distances mod 1). Consider the \( N + 1 \) points \( 0\alpha, 1\alpha, 2\alpha, \ldots, N\alpha \) reduced modulo 1. By the pigeonhole principle, if we divide \( \mathbb{T} \) into \( N \) intervals of length \( 1/N \), at least two of these points — say \( j\alpha$ and \( k\alpha \) with \( j < k \leq N \) — lie in the same interval, so \( |(k - j)\alpha \pmod{1}| < 1/N \). Setting \( q = k - j \), we have \( \|q\alpha\| < 1/N \) (where \( \|\cdot\| \) denotes distance to the nearest integer). Taking \( N > 1/\varepsilon \), we get a \( q \geq 1 \) with \( \|q\alpha\| < \varepsilon \). The multiples \( 0, q\alpha, 2q\alpha, \ldots \pmod{1} \) form a sequence of steps of size less than \( \varepsilon \), which therefore visits every \( \varepsilon \)-neighborhood of every point in \( \mathbb{T} \). In particular, there exists \( m \in \mathbb{Z}_{\geq 0} \) with \( \|mq\alpha - (y - x)\| < \varepsilon \), i.e., \( T^{mq}(x) \) is within \( \varepsilon \) of \( y \). Since \( \varepsilon \) and \( y \) were arbitrary, the orbit of \( x \) is dense. \( \square \)

For rational \( \alpha = p/q \), every orbit has period \( q \) and the system is emphatically not minimal (any orbit closure is a finite set, a proper closed invariant subset).
</div>

<div class="example">
<strong>Example (Doubling Map is Not Minimal).</strong> Let \( T : [0, 1) \to [0, 1) \) be the doubling map \( T(x) = 2x \pmod{1} \). The point \( 0 \) is a fixed point: \( T(0) = 0 \). Thus \( \{0\} \) is a closed (compact) invariant set — a proper closed invariant subset of \( [0,1) \). By definition, \( ([0,1), T) \) is not minimal. More generally, any rational \( p/q \) (in lowest terms) is periodic with period dividing the multiplicative order of \( 2 \) modulo \( q \). There are countably many such periodic orbits, each forming a finite closed invariant set. The doubling map is an example of a system that is highly chaotic (strongly mixing, positive topological entropy) yet not minimal.
</div>

<div class="example">
<strong>Example (Equicontinuity: Rotation vs. Doubling Map).</strong> Recall that a system \( (X, T) \) is equicontinuous if the family \( \{T^n : n \in \mathbb{Z}\} \) is equicontinuous as a family of maps on \( X \).

(i) <em>Irrational rotation is equicontinuous.</em> Each \( T^n \) is an isometry of \( \mathbb{T} \) (with the arc-length metric \( d(x, y) = \|x - y\|\)): \( d(T^n x, T^n y) = \|(x + n\alpha) - (y + n\alpha)\| = \|x - y\| = d(x, y) \). So all maps in the family \( \{T^n\} \) preserve distances; given \( \varepsilon > 0 \), take \( \delta = \varepsilon \) and the equicontinuity condition is satisfied uniformly. Equicontinuous minimal systems are the most structured possible: they are compact group rotations.

(ii) <em>Doubling map is not equicontinuous.</em> Consider two points \( x = 0 \) and \( y = \varepsilon \) (small). After \( n \) steps, \( T^n(0) = 0 \) and \( T^n(\varepsilon) = 2^n \varepsilon \pmod{1} \). For \( n \) large enough that \( 2^n \varepsilon > 1/4 \), the distance \( d(T^n(0), T^n(\varepsilon)) \geq 1/4 \) regardless of how small \( \varepsilon \) is. So no uniform \( \delta \) works for \( \varepsilon = 1/4 \), and the family is not equicontinuous. This reflects the exponential separation of nearby orbits — a hallmark of chaos.
</div>

<div class="remark">
<strong>Remark (Bridge to Entropy).</strong> The contrast between the equicontinuous rotation (zero topological entropy) and the non-equicontinuous doubling map (topological entropy \( \log 2 \)) is not coincidental. A theorem of Auslander and Glasner states that equicontinuous minimal systems always have zero topological entropy, while non-equicontinuous minimal systems can have positive entropy. This bridge between equicontinuity and entropy is developed in Chapter 11.
</div>

---

# Chapter 2: Ultrafilters, Čech-Stone Compactification, and the Greatest Ambit

## Section 2.1: Ultrafilters

Ultrafilters are the key algebraic device for studying Stone-Čech compactifications and, ultimately, Ramsey-type combinatorial results.

<div class="definition">
<strong>Definition (Filter and Ultrafilter)</strong>: A <strong>filter</strong> on a set \( S \) is a collection \( \mathcal{F} \subseteq \mathcal{P}(S) \) such that:
<ol>
<li>\( \emptyset \notin \mathcal{F} \) and \( S \in \mathcal{F} \);
<li>If \( A \in \mathcal{F} \) and \( A \subseteq B \), then \( B \in \mathcal{F} \);
<li>If \( A, B \in \mathcal{F} \), then \( A \cap B \in \mathcal{F} \).
</ol>
An <strong>ultrafilter</strong> is a maximal filter — equivalently, a filter \( \mathcal{U} \) such that for every \( A \subseteq S \), either \( A \in \mathcal{U} \) or \( S \setminus A \in \mathcal{U} \).
</div>

A **principal ultrafilter** is \( \mathcal{U}_x = \{ A \subseteq S : x \in A \} \) for some fixed \( x \in S \). All other ultrafilters are **non-principal** (or **free**); their existence requires the axiom of choice (specifically, the ultrafilter lemma, which is weaker than full AC but not provable in ZF alone).

<div class="theorem">
<strong>Theorem (Existence of Non-Principal Ultrafilters)</strong>: For any infinite set \( S \), there exist non-principal ultrafilters on \( S \).
</div>

<div class="proof">
<em>Proof.</em> The Fréchet filter \( \mathcal{F}_0 = \{ A \subseteq S : S \setminus A \text{ is finite} \} \) is a filter not containing any finite sets. By Zorn's lemma, extend \( \mathcal{F}_0 \) to a maximal filter, which is an ultrafilter. Since it contains no finite sets, it is non-principal.
</div>

## Section 2.2: The Stone-Čech Compactification

<div class="definition">
<strong>Definition (Stone-Čech Compactification)</strong>: The <strong>Stone-Čech compactification</strong> of a discrete space \( S \) is a compact Hausdorff space \( \beta S \) together with an injection \( \iota : S \hookrightarrow \beta S \) such that:
<ul>
<li>\( \iota(S) \) is dense in \( \beta S \);
<li>Every bounded function \( f : S \to [0, 1] \) extends uniquely to a continuous function \( \bar{f} : \beta S \to [0, 1] \).
</ul>
</div>

**Ultrafilter construction.** As a set, \( \beta S \) is identified with the set of all ultrafilters on \( S \). Principal ultrafilters \( \mathcal{U}_s \) for \( s \in S \) are identified with elements of \( S \), so \( \iota(s) = \mathcal{U}_s \). The topology on \( \beta S \) is the one generated by the basic open sets

\[
\overline{A} = \{ \mathcal{U} \in \beta S : A \in \mathcal{U} \}
\]
for \( A \subseteq S \). These sets are also clopen, making \( \beta S \) a totally disconnected compact Hausdorff space (a **Stone space**).

For \( f : S \to [0, 1] \), the extension \( \bar{f} : \beta S \to [0, 1] \) is given by \( \bar{f}(\mathcal{U}) = \lim_{\mathcal{U}} f \), the \( \mathcal{U} \)-limit of \( f \): the unique real number \( r \) such that \( f^{-1}(r - \varepsilon, r + \varepsilon) \in \mathcal{U} \) for all \( \varepsilon > 0 \).

<div class="theorem">
<strong>Theorem (Universal Property of \(\beta S\))</strong>: For any compact Hausdorff space \( K \) and any function \( f : S \to K \), there is a unique continuous extension \( \bar{f} : \beta S \to K \).
</div>

## Section 2.3: The Greatest Ambit

When \( G \) is a discrete group (or, more generally, a topological group), the Stone-Čech compactification \( \beta G \) carries a natural structure as a \( G \)-flow.

<div class="definition">
<strong>Definition (G-Ambit)</strong>: A <strong>\( G \)-ambit</strong> is a compact \( G \)-flow \( (X, G) \) together with a distinguished point \( x_0 \in X \) whose orbit \( Gx_0 \) is dense in \( X \).
</div>

<div class="definition">
<strong>Definition (Greatest Ambit)</strong>: The <strong>greatest ambit</strong> (or <strong>Samuel compactification</strong>) of \( G \) is a \( G \)-ambit \( (S(G), G, e_G) \) with the property that for every \( G \)-ambit \( (X, G, x_0) \), there is a unique \( G \)-equivariant continuous map \( \phi : S(G) \to X \) with \( \phi(e_G) = x_0 \). It is unique up to isomorphism.
</div>

**Construction for discrete \( G \).** For a discrete group \( G \), the greatest ambit is simply \( \beta G \) with \( G \) acting by left multiplication: \( g \cdot \mathcal{U} = \{ gA : A \in \mathcal{U} \} \). The distinguished point is the principal ultrafilter \( \mathcal{U}_e \) at the identity, and \( G \cdot \mathcal{U}_e = \{ \mathcal{U}_g : g \in G \} = G \), which is dense in \( \beta G \).

<div class="remark">
<strong>Remark.</strong> For a general locally compact group \( G \), the greatest ambit is more subtle: it is the Samuel compactification of \( G \) with respect to its right uniformity. The left action of \( G \) on itself by multiplication extends to a continuous action on \( S(G) \).
</div>

## Section 2.4: Universal Minimal Flow

<div class="definition">
<strong>Definition (Universal Minimal Flow)</strong>: A minimal \( G \)-flow \( M(G) \) is called the <strong>universal minimal flow</strong> of \( G \) if every minimal \( G \)-flow is a factor of \( M(G) \). It exists and is unique up to isomorphism (for any topological group \( G \)).
</div>

**Construction.** The universal minimal flow \( M(G) \) is the unique minimal subflow of the greatest ambit \( S(G) \). Its existence follows from the general existence of minimal subflows (Theorem 1.1). Its uniqueness and universality follow from the universal property of \( S(G) \): every minimal flow \( Y \) is an ambit (take any point \( y \in Y \) — its orbit is dense by minimality), so there is a factor map \( S(G) \to Y \), whose image is a closed invariant subset of \( Y \), hence all of \( Y \).

<div class="example">
<strong>Example.</strong> For \( G = \mathbb{Z} \), the universal minimal flow \( M(\mathbb{Z}) \) is the Stone-Čech remainder \( \beta\mathbb{Z} \setminus \mathbb{Z} \) with the shift. It is an extremely large space. By contrast, for compact groups \( G \), the universal minimal flow is a single point (the trivial flow), because fixed-point theorems apply.
</div>

---

# Chapter 3: Semigroup Structure on the Greatest Ambit, Idempotent Ultrafilters, and Applications

## Section 3.1: The Ellis Semigroup

<div class="definition">
<strong>Definition (Ellis Semigroup)</strong>: For a compact \( G \)-flow \( (X, G) \), the <strong>Ellis semigroup</strong> \( E(X) \) is the closure in \( X^X \) (with the product topology) of the set of maps \( \{ x \mapsto gx : g \in G \} \subseteq X^X \). Composition of maps makes \( E(X) \) a compact right-topological semigroup (right multiplication is continuous).
</div>

For the greatest ambit \( S(G) = \beta G \) (with \( G \) discrete), the Ellis semigroup of \( \beta G \) acting on itself is \( \beta G \) itself, with the semigroup operation described below.

## Section 3.2: The Semigroup Operation on \(\beta G\)

For \( G \) a discrete group, \( \beta G \) inherits a semigroup structure extending the group operation on \( G \).

<div class="definition">
<strong>Definition (Semigroup Operation on \(\beta G\))</strong>: For \( \mathcal{U}, \mathcal{V} \in \beta G \) and \( G \) a discrete semigroup, define the product \( \mathcal{U} \cdot \mathcal{V} \) by

\[
A \in \mathcal{U} \cdot \mathcal{V} \iff \{ g \in G : g^{-1}A \in \mathcal{V} \} \in \mathcal{U},
\]
where \( g^{-1}A = \{ h \in G : gh \in A \} \). Equivalently, for any \( f : G \to K \) (compact Hausdorff \( K \)),

\[
\lim_{\mathcal{U} \cdot \mathcal{V}} f = \lim_{\mathcal{U}} \left( g \mapsto \lim_{\mathcal{V}} (h \mapsto f(gh)) \right).
\]
</div>

<div class="theorem">
<strong>Theorem (Properties of the Operation)</strong>: The operation \( (\mathcal{U}, \mathcal{V}) \mapsto \mathcal{U} \cdot \mathcal{V} \) on \( \beta G \) satisfies:
<ol>
<li>For fixed \( \mathcal{V} \), the map \( \mathcal{U} \mapsto \mathcal{U} \cdot \mathcal{V} \) is continuous (right-topological semigroup).
<li>The map \( \mathcal{U} \mapsto \mathcal{V} \cdot \mathcal{U} \) need NOT be continuous in general.
<li>The restriction to \( G \hookrightarrow \beta G \) (principal ultrafilters) coincides with the group operation on \( G \).
<li>\( (\beta G, \cdot) \) is a compact right-topological semigroup.
</ol>
</div>

## Section 3.3: Idempotent Ultrafilters

<div class="definition">
<strong>Definition (Idempotent)</strong>: An element \( p \in \beta G \) is an <strong>idempotent</strong> if \( p \cdot p = p \).
</div>

<div class="theorem">
<strong>Theorem (Ellis–Namiooka–Ruppert)</strong>: Every compact right-topological semigroup contains an idempotent.
</div>

<div class="proof">
<em>Proof.</em> Let \( T \) be the semigroup. By Zorn's lemma, choose a minimal closed sub-semigroup \( S \subseteq T \). Fix any \( s \in S \); then \( sS \subseteq S \) is a closed sub-semigroup (closed since \( \cdot s \) is continuous), hence \( sS = S \) by minimality. So there exists \( e \in S \) with \( se = s \). Then \( \{ t \in S : ts = s \} \) is a closed sub-semigroup of \( S \) (one checks it is closed under multiplication), hence equals \( S \) by minimality; in particular \( ee = e \).
</div>

**Corollary.** \( \beta G \) contains idempotent ultrafilters (non-principal ones, since the only idempotent in \( G \) is the identity \( e \) when \( G \) is a group).

## Section 3.4: Hindman's Theorem

The idempotent structure on \( \beta\mathbb{N} \) yields spectacular combinatorial results.

<div class="definition">
<strong>Definition (IP Set and Finite Sum Set)</strong>: Given a sequence \( (x_n)_{n=1}^\infty \) in \( \mathbb{N} \), the set of <strong>finite sums</strong> (FS-set) is

\[
FS((x_n)_{n=1}^\infty) = \left\{ \sum_{n \in F} x_n : F \subseteq \mathbb{N},\, F \text{ finite and nonempty} \right\}.
\]
A set \( A \subseteq \mathbb{N} \) is an <strong>IP set</strong> if it contains \( FS((x_n)) \) for some sequence \( (x_n) \).
</div>

<div class="theorem">
<strong>Theorem (Hindman, 1974)</strong>: For any finite coloring \( \mathbb{N} = C_1 \cup C_2 \cup \cdots \cup C_r \), there exist \( i \in \{1, \ldots, r\} \) and a sequence \( (x_n)_{n=1}^\infty \) such that \( FS((x_n)) \subseteq C_i \). That is, one color class contains an IP set.
</div>

<div class="proof">
<em>Proof (via idempotents).</em> An ultrafilter \( p \in \beta\mathbb{N} \) is an IP-ultrafilter if \( A \in p \) implies \( A \) is an IP set. One shows that any idempotent \( p = p \cdot p \in \beta\mathbb{N} \) has this property. Given a coloring \( \mathbb{N} = \bigsqcup C_i \), one of the \( C_i \) belongs to \( p \), and for any idempotent \( p \), one shows \( C_i \) must contain an IP set.

More precisely: since \( p \cdot p = p \) and \( C_i \in p \), we have \( \{ n : n^{-1}C_i \in p \} \in p \), so there exists \( x_1 \in C_i \) with \( x_1^{-1}C_i = \{ n : x_1 + n \in C_i \} \in p \). By induction, picking \( x_{k+1} \in C_i \cap x_1^{-1}C_i \cap \cdots \cap \big(\sum_{i \in F} x_i\big)^{-1} C_i \) (using \( p \)'s membership for each of these finitely many intersections), one builds the required sequence.
</div>

## Section 3.5: The Central Sets Theorem (Preview)

A set \( C \subseteq \mathbb{N} \) is **central** if it belongs to some minimal idempotent in \( \beta\mathbb{N} \). Central sets are IP sets, satisfy strong recurrence properties, and are the subject of Chapter 4. The connection between the algebraic structure of \( \beta G \) and combinatorial number theory is one of the most striking features of the theory.

---

# Chapter 4: Minimal Idempotents, Central Sets, and Applications

## Section 4.1: Minimal Idempotents and the Ideal Structure of \(\beta G\)

<div class="definition">
<strong>Definition (Ideal)</strong>: In a semigroup \( (S, \cdot) \), a nonempty subset \( I \subseteq S \) is:
<ul>
<li>a <strong>left ideal</strong> if \( SI \subseteq I \);
<li>a <strong>right ideal</strong> if \( IS \subseteq I \);
<li>a <strong>two-sided ideal</strong> if it is both.
</ul>
The <strong>smallest two-sided ideal</strong> of \( S \), if it exists, is called the <strong>kernel</strong> of \( S \), denoted \( K(S) \).
</div>

<div class="theorem">
<strong>Theorem (Structure of Compact Right-Topological Semigroups)</strong>: Let \( T \) be a compact right-topological semigroup. Then:
<ol>
<li>\( T \) has a smallest two-sided ideal \( K(T) \);
<li>\( K(T) \) is a union of minimal left ideals and a union of minimal right ideals;
<li>Every minimal left ideal and every minimal right ideal is closed;
<li>The intersection of any minimal left ideal with any minimal right ideal is a group;
<li>All the groups arising this way are isomorphic.
</ol>
</div>

Applied to \( \beta G \), the kernel \( K(\beta G) \) is the smallest ideal, and an idempotent \( p \in \beta G \) is **minimal** if it lies in \( K(\beta G) \) — equivalently, if the left ideal \( \beta G \cdot p \) is minimal.

<div class="definition">
<strong>Definition (Central Set)</strong>: A set \( A \subseteq G \) is <strong>central</strong> if \( A \in p \) for some minimal idempotent \( p \in K(\beta G) \).
</div>

## Section 4.2: Characterization of Central Sets

Central sets can be characterized dynamically. A set \( A \subseteq \mathbb{N} \) is central if and only if it is a <em>member of some idempotent ultrafilter in the smallest ideal</em> of \( (\beta\mathbb{N}, +) \). Furstenberg gave an equivalent dynamical characterization:

<div class="theorem">
<strong>Theorem (Furstenberg's Characterization of Central Sets)</strong>: \( A \subseteq \mathbb{N} \) is central if and only if there is a minimal compact dynamical system \( (X, T) \), a uniformly recurrent point \( x_0 \in X \), and a neighborhood \( U \ni x_0 \) such that

\[
A \supseteq \{ n \geq 1 : T^n x_0 \in U \}.
\]
</div>

<div class="remark">
<strong>Remark.</strong> This equivalence links the algebraic notion (membership in a minimal idempotent) to the dynamical notion (return times of recurrent orbits in minimal systems), bridging the two main themes of the course.
</div>

## Section 4.3: Central Sets Theorem

<div class="theorem">
<strong>Theorem (Central Sets Theorem, Furstenberg–Hindman)</strong>: Let \( A \subseteq \mathbb{N} \) be a central set. Then for any finite family \( (y_n^{(i)})_{n=1}^\infty \) (\( 1 \leq i \leq r \)) of sequences in \( \mathbb{N} \), there exist a sequence \( (a_k)_{k=1}^\infty \) in \( \mathbb{N} \) and a sequence \( (H_k)_{k=1}^\infty \) of finite nonempty subsets of \( \mathbb{N} \) with \( \max H_k < \min H_{k+1} \) such that for each \( 1 \leq i \leq r \),

\[
FS\!\left(\left(a_k + \sum_{n \in H_k} y_n^{(i)}\right)_{k=1}^\infty\right) \subseteq A.
\]
</div>

## Section 4.4: Density and Combinatorial Consequences

<div class="definition">
<strong>Definition (Syndetic, Thick, and Piecewise Syndetic Sets)</strong>: A set \( A \subseteq \mathbb{Z} \) is:
<ul>
<li><strong>syndetic</strong> if it has bounded gaps: \( \exists K \) finite such that \( A \cap (n + K) \neq \emptyset \) for all \( n \in \mathbb{Z} \);
<li><strong>thick</strong> if it contains arbitrarily long intervals: for each \( N \), \( \exists n \) with \( \{n, n+1, \ldots, n+N\} \subseteq A \);
<li><strong>piecewise syndetic</strong> if it is the intersection of a syndetic set with a thick set, equivalently if it has bounded gaps on arbitrarily long intervals.
</ul>
Central sets are piecewise syndetic.
</div>

<div class="theorem">
<strong>Theorem (van der Waerden)</strong>: For any finite coloring \( \mathbb{N} = C_1 \cup \cdots \cup C_r \), one color class contains arithmetic progressions of every length.
</div>

<div class="proof">
<em>Proof (via topological dynamics / ultrafilters).</em> One approach: use the Furstenberg–Weiss topological proof. Define the orbit-closure system on \( \{1, \ldots, r\}^{\mathbb{Z}} \): if \( x \in \{1, \ldots, r\}^{\mathbb{Z}} \) is defined by \( x(n) = i \) where \( n \in C_i \), then the orbit closure \( X = \overline{\{\sigma^n x : n \in \mathbb{Z}\}} \) is a compact \( \mathbb{Z} \)-system. Any minimal subflow \( M \subseteq X \) carries a uniformly recurrent sequence. The van der Waerden theorem then follows from the multiple recurrence theorem (Furstenberg–Sárközy), which itself is an ergodic-theoretic result (Chapter 5).
</div>

---

# Chapter 5: Furstenberg's Theorem, Bohr Compactification, and the Universal Minimal Distal Flow

## Section 5.1: Furstenberg's Structure Theorem for Distal Flows

One of the deepest results in topological dynamics is Furstenberg's structure theorem, which characterizes distal flows.

<div class="theorem">
<strong>Theorem (Furstenberg Structure Theorem for Minimal Distal Flows)</strong>: Every minimal distal compact \( G \)-flow \( (X, G) \) can be obtained from the trivial one-point flow by a (possibly transfinite) tower of equicontinuous extensions. More precisely, there exists an ordinal \( \eta \) and a tower of minimal flows

\[
\{*\} = X_0 \leftarrow X_1 \leftarrow \cdots \leftarrow X_\alpha \leftarrow \cdots \leftarrow X_\eta = X
\]
where each \( X_{\alpha+1} \to X_\alpha \) is an equicontinuous (isometric) extension, and for limit ordinals \( \lambda \), \( X_\lambda = \varprojlim_{\alpha < \lambda} X_\alpha \).
</div>

<div class="remark">
<strong>Remark.</strong> The theorem says distal flows are "built from rotations." The transfinite tower accounts for iterated equicontinuous extensions, which can have countably or even uncountably many steps. Compare this with the analogous structure theorem in ergodic theory (Furstenberg–Zimmer), where distal measure-preserving systems are also characterized by towers of isometric extensions.
</div>

## Section 5.2: Bohr Compactification

The Bohr compactification \( bG \) of a discrete group \( G \) is the "most efficient" compactification that remembers all the almost-periodic functions on \( G \). Intuitively, \( bG \) retains exactly the "harmonic analysis" of \( G \): all the information encoded by the collection of all characters (homomorphisms to compact groups), but nothing more. For \( G = \mathbb{Z} \), this means \( b\mathbb{Z} \) captures the behavior of sequences of the form \( n \mapsto e^{2\pi i n \alpha} \) for all \( \alpha \in \mathbb{R} \), which are precisely the almost-periodic functions that Bohr studied in his analysis of quasiperiodic phenomena.

<div class="definition">
<strong>Definition (Bohr Compactification)</strong>: The <strong>Bohr compactification</strong> of a topological group \( G \) is a compact group \( bG \) together with a continuous group homomorphism \( \iota : G \to bG \) with dense image, such that every continuous homomorphism \( \phi : G \to K \) into a compact group \( K \) factors uniquely through \( \iota \): \( \phi = \bar{\phi} \circ \iota \) for a unique continuous homomorphism \( \bar{\phi} : bG \to K \).
</div>

**Construction.** The Bohr compactification of \( G \) is constructed as follows. Let \( \mathcal{F} \) be the family of all continuous homomorphisms \( \phi : G \to K_\phi \) into compact groups \( K_\phi \). Define \( bG = \overline{\iota(G)} \subseteq \prod_{\phi \in \mathcal{F}} K_\phi \), where \( \iota(g) = (\phi(g))_{\phi \in \mathcal{F}} \). This works by Tychonoff compactness.

For \( G = \mathbb{Z} \), the Bohr compactification is the Pontryagin dual of \( \mathbb{T} \) (the circle group thought of as discrete): \( b\mathbb{Z} = \widehat{\mathbb{T}_d} \), the Bohr compactification of \( \mathbb{Z} \). Concretely, \( b\mathbb{Z} \) is the closure of \( \mathbb{Z} \) in \( \prod_{\alpha \in [0,1)} \mathbb{T} \) via the diagonal embedding \( n \mapsto (e^{2\pi i n \alpha})_{\alpha} \).

<div class="example">
<strong>Example (The Bohr Compactification of \( \mathbb{Z} \)).</strong> We work out \( b\mathbb{Z} \) concretely. The characters of \( \mathbb{Z} \) are the group homomorphisms \( \chi : \mathbb{Z} \to \mathbb{T} \), where \( \mathbb{T} = \{z \in \mathbb{C} : |z| = 1\} \). Any such character is determined by where \( 1 \in \mathbb{Z} \) goes: if \( \chi(1) = e^{2\pi i \alpha} \) for some \( \alpha \in [0, 1) \), then \( \chi(n) = e^{2\pi i n \alpha} \) for all \( n \in \mathbb{Z} \). Every \( \alpha \in [0, 1) \) gives a character, and distinct \( \alpha \) give distinct characters (they differ at \( n = 1 \)). So the Pontryagin dual of \( \mathbb{Z} \) (with its usual topology) is \( \widehat{\mathbb{Z}} = \mathbb{T} \). However, the Bohr compactification uses \( \mathbb{T} \) with its *discrete* topology \( \mathbb{T}_d \), and the dual of \( \mathbb{T}_d \) is a much larger compact group.

Explicitly: the diagonal embedding \( \iota : \mathbb{Z} \to \mathbb{T}^{[0,1)} \) is \( \iota(n) = (e^{2\pi i n \alpha})_{\alpha \in [0,1)} \). The Bohr compactification \( b\mathbb{Z} \) is \( \overline{\iota(\mathbb{Z})} \subseteq \mathbb{T}^{[0,1)} \). A point in \( b\mathbb{Z} \) is a limit of \( \iota(n_j) \) for some net/sequence \( (n_j) \) in \( \mathbb{Z} \) such that \( e^{2\pi i n_j \alpha}$ converges for every \( \alpha \in [0,1) \) simultaneously. The group operation is coordinate-wise multiplication in \( \mathbb{T}^{[0,1)} \).

The action of \( \mathbb{Z} \) on \( b\mathbb{Z} \) is by translation: the generator \( 1 \in \mathbb{Z} \) acts on \( b\mathbb{Z} \) by multiplication by the element \( \iota(1) = (e^{2\pi i \alpha})_{\alpha \in [0,1)} \). The system \( (b\mathbb{Z}, T) \) where \( T(z) = \iota(1) \cdot z \) is the universal minimal equicontinuous \( \mathbb{Z} \)-system: every minimal equicontinuous \( \mathbb{Z} \)-system is a factor of \( (b\mathbb{Z}, T) \).
</div>

<div class="theorem">
<strong>Theorem (Bohr Almost Periodic Functions)</strong>: A function \( f : G \to \mathbb{C} \) extends to a continuous function on \( bG \) if and only if it is <strong>almost periodic</strong> — i.e., the set of translates \( \{ g \mapsto f(hg) : h \in G \} \) is precompact in the uniform norm.
</div>

<div class="example">
<strong>Example (Almost-Periodic Functions on \( \mathbb{Z} \) via Fourier Series).</strong> A function \( f : \mathbb{Z} \to \mathbb{C} \) is almost periodic if and only if it can be uniformly approximated by trigonometric polynomials — finite sums of the form \( \sum_{k=1}^{N} c_k e^{2\pi i \alpha_k n} \) where \( \alpha_k \in \mathbb{R} \). Equivalently, \( f \) has a "generalized Fourier series"

\[
f(n) \sim \sum_{k=1}^{\infty} c_k e^{2\pi i \alpha_k n},
\]
where the \( \alpha_k \) are real numbers (not necessarily rational or even forming a countable group). The key difference from ordinary Fourier analysis on \( \mathbb{T} \) is that the "frequencies" \( \alpha_k \) can be arbitrary reals, not just integers.

Concretely: the function \( f(n) = e^{2\pi i n \alpha} \) for fixed irrational \( \alpha \) is almost periodic (it is a single Fourier mode). The function \( f(n) = e^{2\pi i n \sqrt{2}} + e^{2\pi i n \sqrt{3}} \) is almost periodic with two incommensurable frequencies. The function \( f(n) = \sin(n^2) \) is NOT almost periodic, as its frequency spectrum is not discrete. Almost-periodic functions are precisely the "signals" that can be analyzed using the compact group \( b\mathbb{Z} \) as a "frequency domain."
</div>

## Section 5.2B: Almost Periodicity, Bohr's Original Work, and Connections to Dynamics

Harald Bohr (brother of Niels Bohr) introduced almost-periodic functions in the 1920s as a natural generalization of periodic functions. A function \( f : \mathbb{R} \to \mathbb{C} \) is *periodic* with period \( T \) if \( f(t + T) = f(t) \) for all \( t \); equivalently, the set of translations \( \{f(\cdot + s) : s \in \mathbb{R}\} \) takes only finitely many distinct values. Bohr's generalization: \( f \) is *almost periodic* if the set of translates is *precompact* in the uniform topology. The classical example is \( f(t) = e^{2\pi i \alpha t} + e^{2\pi i \beta t} \) for incommensurable \( \alpha, \beta \in \mathbb{R} \): this function is not periodic (it never exactly repeats) but its translates form a compact family.

<div class="theorem">
<strong>Theorem (Bohr's Approximation Theorem)</strong>: A continuous function \( f : \mathbb{R} \to \mathbb{C} \) is almost periodic if and only if it is the uniform limit of trigonometric polynomials \( \sum_{k=1}^{N} c_k e^{2\pi i \lambda_k t} \) where \( \lambda_k \in \mathbb{R} \) are arbitrary real frequencies.
</div>

<div class="remark">
<strong>Remark (Bohr Spectrum).</strong> The *Bohr spectrum* of an almost-periodic function \( f \) is \( \mathrm{Sp}(f) = \{ \lambda \in \mathbb{R} : \hat{f}(\lambda) \neq 0 \} \), where \( \hat{f}(\lambda) = \lim_{T \to \infty} \frac{1}{2T} \int_{-T}^T f(t) e^{-2\pi i \lambda t} \, dt \) is the Bohr mean. The spectrum is at most countable. When \( f \) is periodic with period \( p \), the spectrum is \( \{n/p : n \in \mathbb{Z}\} \). When \( f(t) = e^{2\pi i\sqrt{2} t} + e^{2\pi i \pi t} \), the spectrum is \( \{\sqrt{2}, \pi\} \). The Bohr compactification encodes all these spectra simultaneously: a character of \( b\mathbb{R} \) is precisely evaluation at a point of the Bohr spectrum.
</div>

<div class="example">
<strong>Example (Dynamical Interpretation of Bohr Spectrum).</strong> Let \( f : \mathbb{Z} \to \mathbb{C} \) be almost periodic. The dynamical system \( (b\mathbb{Z}, T) \) (where \( T \) is the action of \( 1 \in \mathbb{Z} \)) has a spectral decomposition: the Koopman operator \( U_T \) on \( L^2(b\mathbb{Z}, \mu_{Haar}) \) (where \( \mu_{Haar} \) is the Haar measure on \( b\mathbb{Z} \)) has a basis of eigenfunctions \( \{ e_\alpha : \alpha \in \mathbb{T} \} \) given by \( e_\alpha(z) = \chi_\alpha(z) \) (characters of \( b\mathbb{Z} \)). The Birkhoff averages of \( f \) converge to the projection of \( f \) onto the invariant subspace — which, for almost-periodic \( f \), is just \( \hat{f}(0) = \lim_{N\to\infty} \frac{1}{N}\sum_{n=0}^{N-1} f(n) \), the mean of \( f \). This is a special case of the mean ergodic theorem applied to the system \( (b\mathbb{Z}, \mu_{Haar}, T) \).
</div>

## Section 5.3: Universal Minimal Distal Flow

<div class="definition">
<strong>Definition (Universal Minimal Distal Flow)</strong>: A minimal distal \( G \)-flow \( D(G) \) is the <strong>universal minimal distal flow</strong> if every minimal distal \( G \)-flow is a factor of \( D(G) \).
</div>

The universal minimal distal flow is the inverse limit of all isometric towers (with the natural compatible factor maps). For abelian groups, the universal minimal distal flow is the Bohr compactification itself with the natural action. For general groups, it is more complex.

## Section 5.4: Almost Periodicity and Equicontinuous Flows

<div class="theorem">
<strong>Theorem (Structure of Minimal Equicontinuous Flows)</strong>: A compact \( G \)-flow is minimal and equicontinuous if and only if it is (equivariantly homeomorphic to) a compact group rotation: there is a compact group \( K \), a closed subgroup \( H \leq K \), and a homomorphism \( \rho : G \to K \) with dense image such that \( X \cong K/H \) with action \( g \cdot kH = \rho(g)kH \).
</div>

In particular, for \( G = \mathbb{Z} \), minimal equicontinuous systems are exactly the rotations on compact abelian groups \( K \), i.e., systems of the form \( T(k) = k + a \) for a fixed \( a \in K \) that generates a dense subgroup of \( K \).

---

# Chapter 6: Universal Minimal Proximal and Strongly Proximal Flows

## Section 6.1: Proximal Flows Revisited

We recall the definition of proximal flow (Definition 1.3) and develop the theory further.

<div class="theorem">
<strong>Theorem (Characterization of Proximal Minimal Flows)</strong>: A minimal compact \( G \)-flow \( (X, G) \) is proximal if and only if it has a fixed point — or more precisely, if and only if \( E(X) \), the Ellis semigroup of \( X \), consists entirely of constant maps.
</div>

<div class="proof">
<em>Proof sketch.</em> A constant map \( c_z : x \mapsto z \) is an idempotent in \( E(X) \). If \( E(X) \) contains a constant map \( c_z \), then for any \( x, y \in X \), there is a net \( g_\alpha \in G \) with \( g_\alpha \to c_z \) in \( E(X) \), so \( g_\alpha x \to z \) and \( g_\alpha y \to z \), making \( x, y \) proximal. Conversely, if every pair is proximal, one shows every minimal idempotent in \( E(X) \) is a constant map.
</div>

## Section 6.2: Strongly Proximal Flows

<div class="definition">
<strong>Definition (Strongly Proximal Flow)</strong>: Let \( G \) be a locally compact group. A compact \( G \)-flow \( (X, G) \) is <strong>strongly proximal</strong> if for every probability measure \( \mu \) on \( X \), the orbit closure \( \overline{G\mu} \subseteq \mathcal{M}(X) \) contains a point mass \( \delta_x \) for some \( x \in X \).
</div>

Equivalently, every \( G \)-invariant measure on \( X \) is a point mass — which (for minimal \( X \)) means every probability measure on \( X \) can be "compressed" to a point mass by the group action.

<div class="remark">
<strong>Remark.</strong> Strongly proximal flows arise naturally in the study of boundaries of groups (Furstenberg boundaries). Every compact group has a trivial strongly proximal boundary. Hyperbolic groups and semisimple Lie groups have non-trivial Furstenberg boundaries.
</div>

## Section 6.3: Furstenberg Boundary

<div class="definition">
<strong>Definition (Furstenberg Boundary / Poisson Boundary)</strong>: For a locally compact group \( G \) with a spread-out probability measure \( \mu \), the <strong>Poisson boundary</strong> is the measure-theoretic boundary \( (B, \nu) \) that encodes the asymptotic behavior of the \( \mu \)-random walk on \( G \). The <strong>Furstenberg boundary</strong> is the universal strongly proximal minimal \( G \)-flow, which is the topological counterpart.
</div>

<div class="example">
<strong>Example.</strong> For \( G = SL_2(\mathbb{R}) \), the Furstenberg boundary is the projective line \( \mathbb{P}^1(\mathbb{R}) \cong S^1 \), with \( G \) acting by Möbius transformations. For \( G = SL_n(\mathbb{R}) \) with \( n \geq 2 \), the Furstenberg boundary is the full flag manifold.
</div>

## Section 6.4: Universal Minimal Proximal Flow

<div class="theorem">
<strong>Theorem (Existence of Universal Minimal Proximal Flow)</strong>: For any topological group \( G \), there is a universal minimal proximal \( G \)-flow \( \Pi(G) \) — a minimal proximal flow such that every minimal proximal \( G \)-flow is a factor of \( \Pi(G) \).
</div>

The construction uses the greatest ambit \( S(G) \): one quotients out the "distal component" of the action, leaving the proximal part. The universal minimal proximal flow is the quotient of the universal minimal flow \( M(G) \) by the distal proximal equivalence relation.

---

# Chapter 7: Probability Measures, Affine Flows, and Amenable Groups

## Section 7.1: The Space of Probability Measures as a \(G\)-Flow

For a compact Hausdorff space \( X \), the set \( \mathcal{M}(X) \) of Borel probability measures on \( X \) with the weak-* topology is compact and convex. If \( G \) acts continuously on \( X \), then \( G \) acts on \( \mathcal{M}(X) \) by pushforward:

\[
(g_* \mu)(A) = \mu(g^{-1}A),\quad g \in G,\, A \subseteq X \text{ Borel}.
\]
This makes \( \mathcal{M}(X) \) into a compact convex \( G \)-flow.

<div class="definition">
<strong>Definition (Affine Flow)</strong>: A <strong>compact convex \( G \)-flow</strong> (or <strong>affine \( G \)-flow</strong>) is a compact convex subset \( K \) of a locally convex topological vector space with a continuous affine \( G \)-action: \( g \cdot (\lambda x + (1-\lambda) y) = \lambda (g \cdot x) + (1-\lambda)(g \cdot y) \).
</div>

## Section 7.2: Invariant Probability Measures

<div class="definition">
<strong>Definition (Invariant Measure)</strong>: A Borel probability measure \( \mu \in \mathcal{M}(X) \) is \( G \)-<strong>invariant</strong> if \( g_* \mu = \mu \) for all \( g \in G \), i.e., \( \mu(g^{-1}A) = \mu(A) \) for all \( g \in G \) and all Borel \( A \subseteq X \).
</div>

<div class="theorem">
<strong>Theorem (Markov–Kakutani)</strong>: Let \( G \) be a commutative group acting continuously and affinely on a compact convex set \( K \). Then there exists a \( G \)-fixed point in \( K \).
</div>

<div class="proof">
<em>Proof.</em> For each \( g \in G \) and \( N \in \mathbb{N} \), the Cesàro average \( \frac{1}{N}\sum_{k=0}^{N-1} g^k x \) converges (by compactness, on a subnet) to a fixed point of \( g \). For commutative \( G \), the set of fixed points of any \( g \) is nonempty closed convex, and the intersection over all \( g \) is nonempty by the finite intersection property.
</div>

Applied with \( K = \mathcal{M}(X) \): for any abelian group \( G \) acting on a compact space \( X \), there is a \( G \)-invariant probability measure on \( X \).

## Section 7.3: Amenable Groups

<div class="definition">
<strong>Definition (Amenable Group)</strong>: A locally compact group \( G \) is <strong>amenable</strong> if every compact \( G \)-flow \( (X, G) \) admits a \( G \)-invariant probability measure.
</div>

Equivalent conditions (for discrete \( G \)):
- \( G \) has a left-invariant finitely additive probability measure (a "mean") on bounded functions.
- For every \( \varepsilon > 0 \) and finite set \( F \subseteq G \), there exists a finite set \( K \subseteq G \) with \( |F \cdot K \triangle K| / |K| < \varepsilon \) (Følner condition).
- Every affine compact \( G \)-flow has a fixed point (Ryll-Nardzewski / Day theorem).

<div class="example">
<strong>Example.</strong> All abelian groups are amenable (by Markov-Kakutani). Finite groups are amenable (average over all elements). Extensions of amenable groups by amenable groups are amenable. The free group \( F_2 \) on two generators is <em>not</em> amenable (Hausdorff paradox / Banach-Tarski).
</div>

<div class="theorem">
<strong>Theorem (Tarski's Alternative)</strong>: A discrete group \( G \) is amenable if and only if it does not contain a free group on two generators "paradoxically decomposing" a set.
</div>

## Section 7.4: Fixed Point Properties and Topological Dynamics

<div class="theorem">
<strong>Theorem (Day)</strong>: A discrete group \( G \) is amenable if and only if every compact affine \( G \)-flow has a fixed point.
</div>

<div class="theorem">
<strong>Theorem (Furstenberg)</strong>: \( G \) is amenable if and only if the universal minimal flow \( M(G) \) supports a \( G \)-invariant probability measure, i.e., the one-point flow is a factor of \( M(G) \) in the category of affine flows.
</div>

---

# Chapter 8: Standard Lebesgue Spaces, Probability-Measure-Preserving Actions, and \(\mathrm{Aut}(X, \mu)\)

## Section 8.1: Standard Probability Spaces

We now transition to the measure-theoretic side of dynamics.

<div class="definition">
<strong>Definition (Standard Lebesgue Space)</strong>: A <strong>standard probability space</strong> (or <strong>Lebesgue probability space</strong>) is a triple \( (X, \mathcal{B}, \mu) \) where \( X \) is a standard Borel space (a Polish space with its Borel \(\sigma\)-algebra, or isomorphic to one), \( \mathcal{B} \) is the \(\sigma\)-algebra, and \( \mu \) is a probability measure.
</div>

The key theorem of Lebesgue measure theory is:

<div class="theorem">
<strong>Theorem (Isomorphism of Lebesgue Spaces)</strong>: Any two atomless standard probability spaces are isomorphic as measure spaces (i.e., there is a measure-preserving bijection between them, defined a.e.). In particular, every atomless standard probability space is isomorphic to \( ([0,1], \mathcal{B}, \lambda) \) where \( \lambda \) is Lebesgue measure.
</div>

This means up to isomorphism, there is essentially only one atomless standard probability space, which justifies writing "a standard probability space \( (X, \mu) \)" without loss of generality.

## Section 8.2: Measure-Preserving Transformations

<div class="definition">
<strong>Definition (Measure-Preserving Transformation)</strong>: Let \( (X, \mathcal{B}, \mu) \) be a standard probability space. A measurable map \( T : X \to X \) is <strong>measure-preserving</strong> (or <strong>pmp</strong>) if \( \mu(T^{-1}A) = \mu(A) \) for all \( A \in \mathcal{B} \). If \( T \) is bijective and both \( T \) and \( T^{-1} \) are measurable and measure-preserving, \( T \) is a <strong>measure-preserving automorphism</strong>.
</div>

<div class="example">
<strong>Example (Circle Rotation).</strong> The map \( T : \mathbb{T} \to \mathbb{T} \), \( T(x) = x + \alpha \pmod 1 \), preserves Lebesgue measure \( \lambda \) (since \( \lambda(T^{-1}[a,b]) = \lambda([a-\alpha, b-\alpha]) = b - a \)).
</div>

<div class="example">
<strong>Example (Doubling Map).</strong> The map \( T : [0,1) \to [0,1) \), \( T(x) = 2x \pmod 1 \), preserves Lebesgue measure and is ergodic but not invertible.
</div>

<div class="example">
<strong>Example (Bernoulli Shift).</strong> Let \( (Y, \nu) \) be a finite probability space (the alphabet). The <strong>Bernoulli shift</strong> on \( X = Y^{\mathbb{Z}} \) with product measure \( \mu = \nu^{\mathbb{Z}} \) has shift map \( T((x_n)) = (x_{n+1}) \). This preserves \( \mu \) and is a fundamental example.
</div>

## Section 8.3: The Group \(\mathrm{Aut}(X, \mu)\)

<div class="definition">
<strong>Definition (\(\mathrm{Aut}(X, \mu)\))</strong>: The group \( \mathrm{Aut}(X, \mu) \) is the group of all measure-preserving automorphisms of a standard probability space \( (X, \mu) \), where two automorphisms are identified if they agree \( \mu \)-a.e.
</div>

\( \mathrm{Aut}(X, \mu) \) carries a natural topology, the **weak topology**: \( T_n \to T \) if \( \mu(T_n A \triangle T A) \to 0 \) for every measurable \( A \). With this topology, \( \mathrm{Aut}(X, \mu) \) is a Polish group (separable completely metrizable).

<div class="theorem">
<strong>Theorem (Halmos Conjugacy Lemma)</strong>: The conjugacy class of any aperiodic measure-preserving transformation in \( \mathrm{Aut}(X, \mu) \) is dense in the weak topology. In particular, the set of ergodic transformations is a dense \( G_\delta \) set.
</div>

## Section 8.4: Probability-Measure-Preserving Group Actions

<div class="definition">
<strong>Definition (Pmp Action)</strong>: A <strong>probability-measure-preserving (pmp) action</strong> of a countable group \( \Gamma \) on a standard probability space \( (X, \mu) \) is a group homomorphism \( \Gamma \to \mathrm{Aut}(X, \mu) \), \( \gamma \mapsto T_\gamma \), where each \( T_\gamma \) is a measure-preserving automorphism. We write \( \Gamma \curvearrowright (X, \mu) \).
</div>

<div class="definition">
<strong>Definition (Ergodicity)</strong>: A pmp action \( \Gamma \curvearrowright (X, \mu) \) is <strong>ergodic</strong> if every \( \Gamma \)-invariant measurable set \( A \) (i.e., \( T_\gamma^{-1} A = A \) a.e. for all \( \gamma \)) satisfies \( \mu(A) \in \{0, 1\} \).
</div>

Equivalently, ergodicity says \( X \) cannot be split into two non-trivial invariant pieces. This is the measure-theoretic analog of minimality (though the two notions differ).

---

# Chapter 8B: Furstenberg's Correspondence Principle and Szemerédi's Theorem

## Section 8B.1: Motivation and Statement

Furstenberg's 1977 ergodic-theoretic proof of Szemerédi's theorem is one of the most beautiful ideas in twentieth-century mathematics. Szemerédi's theorem (1975), proved by combinatorial methods, states that any subset of the integers with positive upper density contains arithmetic progressions of every length. Furstenberg discovered that this combinatorial statement about arithmetic progressions in \( \mathbb{Z} \) is *equivalent* to a statement about multiple recurrence in measure-preserving dynamics. The translation between the two worlds — the "correspondence principle" — turns Szemerédi's theorem into a theorem about dynamics, which Furstenberg then proved using the structure theory of measure-preserving systems. This approach opened a vast new research area connecting ergodic theory, combinatorics, and additive number theory.

The upper Banach density of a set \( A \subseteq \mathbb{Z} \) is

\[
d^*(A) = \limsup_{N - M \to \infty} \frac{|A \cap \{M, M+1, \ldots, N-1\}|}{N - M}.
\]
Szemerédi's theorem says: if \( d^*(A) > 0 \), then \( A \) contains arithmetic progressions \( \{a, a+d, a+2d, \ldots, a+kd\} \) for every \( k \geq 1 \) and some \( a \in \mathbb{Z} \), \( d \geq 1 \).

## Section 8B.2: The Furstenberg Correspondence Principle

<div class="theorem">
<strong>Theorem (Furstenberg Correspondence Principle, 1977)</strong>: Let \( A \subseteq \mathbb{Z} \) with \( d^*(A) > 0 \). Then there exists a probability-measure-preserving system \( (X, \mathcal{B}, \mu, T) \) and a measurable set \( B \subseteq X \) with \( \mu(B) = d^*(A) > 0 \), such that for every \( k \geq 1 \) and every \( n_1, n_2, \ldots, n_k \in \mathbb{Z} \):

\[
d^*(A \cap (A - n_1) \cap (A - n_2) \cap \cdots \cap (A - n_k)) \geq \mu(B \cap T^{-n_1}B \cap T^{-n_2}B \cap \cdots \cap T^{-n_k}B).
\]
In particular, if the right-hand side is positive for some choice of \( n_1, \ldots, n_k \), then the intersection \( A \cap (A - n_1) \cap \cdots \cap (A - n_k) \) is non-empty, meaning \( A \) contains a translate of the pattern \( \{0, n_1, n_2, \ldots, n_k\} \).
</div>

<div class="proof">
<em>Proof (Construction of the dynamical system).</em> The key idea is to encode the set \( A \) as a point in a shift space. Consider \( X = \{0, 1\}^{\mathbb{Z}} \) with the product topology (compact, metrizable), and the shift map \( T : X \to X \), \( (Tx)_n = x_{n+1} \). Define \( x^{(A)} \in X \) by \( x^{(A)}_n = \mathbf{1}_A(n) \) (the indicator of \( A \)). Let \( X_A = \overline{\{ T^n x^{(A)} : n \in \mathbb{Z} \}} \) be the orbit closure of \( x^{(A)} \); this is a compact \( T \)-invariant subspace. Define the cylinder set \( B = \{ y \in X_A : y_0 = 1 \} \) (points in \( X_A \) that start with a 1).

Since \( d^*(A) > 0 \), the sequence \( (n_j) \) along which the density is achieved allows us to construct a \( T \)-invariant measure \( \mu \) on \( X_A \) (via a weak-* limit of Cesàro averages of the point masses along translates of \( x^{(A)} \)) with \( \mu(B) \geq d^*(A) > 0 \). The key observation is that for any pattern \( n_1, \ldots, n_k \):

\[
n \in A \cap (A - n_1) \cap \cdots \cap (A - n_k) \iff T^n x^{(A)} \in B \cap T^{-n_1}B \cap \cdots \cap T^{-n_k}B,
\]
since \( (T^n x^{(A)})_0 = x^{(A)}_n = \mathbf{1}_A(n) \) and \( (T^n x^{(A)})_{n_j} = \mathbf{1}_A(n + n_j) \). The density inequality then follows from how \( \mu \) was constructed. \( \square \)
</div>

<div class="remark">
<strong>Remark.</strong> The correspondence principle is a *reduction*: it shows that any lower bound on \( \mu(B \cap T^{-n}B \cap \cdots \cap T^{-kn}B) \) for positive-measure sets in arbitrary pmp systems implies the corresponding combinatorial result for sets of positive density. Furstenberg then proved the required lower bound — the Multiple Recurrence Theorem — by analyzing the structure of the pmp system using the Furstenberg–Zimmer tower.
</div>

## Section 8B.3: Furstenberg's Multiple Recurrence Theorem

<div class="theorem">
<strong>Theorem (Furstenberg Multiple Recurrence, 1977)</strong>: Let \( (X, \mathcal{B}, \mu, T) \) be a probability-measure-preserving system and \( B \in \mathcal{B} \) with \( \mu(B) > 0 \). Then for every \( k \geq 1 \),

\[
\liminf_{N \to \infty} \frac{1}{N} \sum_{n=1}^{N} \mu(B \cap T^{-n}B \cap T^{-2n}B \cap \cdots \cap T^{-kn}B) > 0.
\]
In particular, there exist infinitely many \( n \geq 1 \) with \( B \cap T^{-n}B \cap T^{-2n}B \cap \cdots \cap T^{-kn}B \neq \emptyset \).
</div>

The case \( k = 1 \) is Poincaré recurrence (proved in Section 9.3). The case \( k = 2 \) was proved by Furstenberg and Sárközy independently (and implies that any set of positive density contains a configuration \( \{a, a+n, a+2n\} \)). The general case is Furstenberg's proof of Szemerédi's theorem.

The proof of the general case proceeds by the <em>Furstenberg–Zimmer structure theory</em>: any ergodic pmp system has a canonical tower of extensions

\[
X \to Z_k \to Z_{k-1} \to \cdots \to Z_1 \to Z_0 = \{*\}
\]
where each extension is either a *compact (isometric) extension* or a *weakly mixing extension*. For compact extensions, the multiple recurrence is proved using Fourier analysis on the fiber compact group. For weakly mixing extensions, a "van der Corput"-style argument shows the contributions from such extensions are negligible (they average away). Combining these two cases by transfinite induction proves the theorem.

## Section 8B.4: Szemerédi's Theorem as a Corollary

<div class="theorem">
<strong>Theorem (Szemerédi, 1975; Furstenberg ergodic proof, 1977)</strong>: Let \( A \subseteq \mathbb{Z} \) with \( d^*(A) > 0 \). Then for every \( k \geq 1 \), \( A \) contains an arithmetic progression of length \( k \): there exist \( a \in \mathbb{Z} \) and \( d \geq 1 \) with \( a, a+d, a+2d, \ldots, a+(k-1)d \in A \).
</div>

<div class="proof">
<em>Proof (given the above results).</em> By the Furstenberg Correspondence Principle, construct a pmp system \( (X, \mu, T) \) and a set \( B \) with \( \mu(B) = d^*(A) > 0 \) such that for any \( n \), if \( \mu(B \cap T^{-n}B \cap \cdots \cap T^{-(k-1)n}B) > 0 \), then \( A \cap (A - n) \cap \cdots \cap (A - (k-1)n) \neq \emptyset \), which means \( A \) contains the arithmetic progression \( \{m, m+n, \ldots, m+(k-1)n\} \) for some \( m \). The Multiple Recurrence Theorem guarantees that such \( n \geq 1 \) exists. \( \square \)
</div>

<div class="remark">
<strong>Remark (Legacy of Furstenberg's Approach).</strong> Furstenberg's ergodic proof of Szemerédi's theorem was not just a new proof of a known result — it opened an entirely new research direction. The structure theory developed for the proof (the Furstenberg–Zimmer tower, the notion of characteristic factors) became foundational. Host and Kra (2005) and Ziegler (2007) identified the exact characteristic factors for the \( k \)-term averages, showing they are nilsystems. Green and Tao (2008) used ideas from the ergodic-theoretic approach to prove their theorem that the primes contain arithmetic progressions of every length. Gowers (2001) developed a quantitative (non-ergodic) approach via the Gowers norms, which are now understood to be the "quantitative version" of the characteristic factor theory.
</div>

---

# Chapter 9: \(L^2\) and Birkhoff Ergodic Theorems

## Section 9.1: The Koopman Operator

Given a pmp action \( \Gamma \curvearrowright (X, \mu) \), every \( T \in \mathrm{Aut}(X, \mu) \) induces a unitary operator on \( L^2(X, \mu) \):

<div class="definition">
<strong>Definition (Koopman Operator)</strong>: For \( T \in \mathrm{Aut}(X, \mu) \), the <strong>Koopman operator</strong> \( U_T : L^2(X, \mu) \to L^2(X, \mu) \) is defined by \( U_T f = f \circ T \). It is a unitary operator: \( \langle U_T f, U_T g \rangle = \langle f, g \rangle \) for all \( f, g \in L^2 \).
</div>

The map \( T \mapsto U_T \) is a group homomorphism from \( \mathrm{Aut}(X, \mu) \) to the unitary group \( \mathcal{U}(L^2(X, \mu)) \).

<div class="theorem">
<strong>Theorem (Mean Ergodic Theorem, von Neumann, 1932)</strong>: Let \( U \) be a unitary operator on a Hilbert space \( H \). Then for every \( f \in H \),

\[
\frac{1}{N} \sum_{n=0}^{N-1} U^n f \xrightarrow{H} P f,
\]
where \( P \) is the orthogonal projection onto the fixed-point subspace \( \text{Fix}(U) = \{ h \in H : Uh = h \} \).
</div>

<div class="proof">
<em>Proof.</em> The Hilbert space decomposes as \( H = \text{Fix}(U) \oplus \overline{\text{ran}(I - U)} \) (orthogonal complement of the fixed-point subspace is the closure of the range of \( I - U \)). For \( f \in \text{Fix}(U) \), clearly the averages converge to \( f = Pf \). For \( f = g - Ug \) in \( \text{ran}(I - U) \), the telescoping sum gives \( \frac{1}{N}\sum_{n=0}^{N-1} U^n(g-Ug) = \frac{1}{N}(g - U^N g) \to 0 \). By density and boundedness, convergence holds for all \( f \).
</div>

**Ergodic interpretation.** For a pmp \( \mathbb{Z} \)-action with \( U = U_T \), the fixed-point space is \( \text{Fix}(U_T) = \{ f \in L^2 : f \circ T = f \text{ a.e.}\} = L^2(\mathcal{I}) \) where \( \mathcal{I} \) is the \(\sigma\)-algebra of \( T \)-invariant sets. If \( T \) is ergodic, \( \mathcal{I} \) is trivial, and \( Pf = \int f \, d\mu \) (the constant function). The mean ergodic theorem then says:

\[
\frac{1}{N} \sum_{n=0}^{N-1} f(T^n x) \xrightarrow{L^2} \int_X f \, d\mu.
\]

## Section 9.2: Birkhoff Pointwise Ergodic Theorem

The Birkhoff ergodic theorem is the rigorous mathematical version of Boltzmann's ergodic hypothesis: for a measure-preserving system, and for typical initial conditions, time averages of an observable equal the space average. "Typical" here means for almost every starting point with respect to the invariant measure. When the system is ergodic — when there are no non-trivial invariant sets — "almost every" becomes "every" in the probabilistic sense: the time average is the same constant (the space average) for all typical trajectories. Birkhoff's 1931 proof was a landmark: it required a genuinely new technique (the maximal ergodic lemma, a precursor to Calderón–Zygmund maximal inequalities) and settled one of the central questions in statistical mechanics.

<div class="theorem">
<strong>Theorem (Birkhoff Ergodic Theorem, 1931)</strong>: Let \( (X, \mathcal{B}, \mu) \) be a probability space, \( T : X \to X \) a measure-preserving transformation, and \( f \in L^1(X, \mu) \). Then

\[
\frac{1}{N} \sum_{n=0}^{N-1} f(T^n x) \xrightarrow{N \to \infty} \tilde{f}(x) \quad \mu\text{-a.e.},
\]
where \( \tilde{f} \in L^1 \) is \( T \)-invariant (i.e., \( \tilde{f} \circ T = \tilde{f} \) a.e.) and \( \int \tilde{f} \, d\mu = \int f \, d\mu \).

If \( T \) is ergodic, then \( \tilde{f} = \int f \, d\mu \) a.e. — the time average equals the space average.
</div>

<div class="proof">
<em>Proof sketch.</em> The key estimate is the <em>maximal ergodic lemma</em>: for \( f \in L^1 \), define \( f^*(x) = \sup_{N \geq 1} \frac{1}{N}\sum_{n=0}^{N-1} f(T^n x) \). Then

\[
\mu(\{ x : f^*(x) > \lambda \}) \leq \frac{1}{\lambda} \int_{\{f^* > \lambda\}} f \, d\mu.
\]
This is the Hopf maximal inequality. Given this, the pointwise convergence follows by a density argument: approximate \( f \in L^1 \) by coboundaries and invariant functions, showing the limsup and liminf of the ergodic averages coincide a.e.
</div>

<div class="example">
<strong>Example (Equidistribution).</strong> For an irrational rotation \( T(x) = x + \alpha \) on \( \mathbb{T} \), the Birkhoff ergodic theorem applied to \( f = \mathbf{1}_{[a,b]} \) gives: for Lebesgue-a.e. \( x \in \mathbb{T} \),

\[
\frac{1}{N} \#\{0 \leq n < N : T^n x \in [a, b]\} \to b - a.
\]
In fact, by Weyl's equidistribution theorem, this holds for <em>every</em> \( x \in \mathbb{T} \) (not just a.e.).
</div>

## Section 9.2B: Worked Examples for the Birkhoff Ergodic Theorem

<div class="example">
<strong>Example (Birkhoff Applied to Irrational Rotation — Unique Ergodicity).</strong> Let \( T : \mathbb{T} \to \mathbb{T} \) be the irrational rotation \( T(x) = x + \alpha \pmod{1} \) with \( \alpha \notin \mathbb{Q} \), and let \( f = \mathbf{1}_{[0, 1/2)} \) (the indicator function of the left half of the circle). We claim that for <em>every</em> \( x \in \mathbb{T} \):

\[
\frac{1}{N} \sum_{n=0}^{N-1} f(T^n x) \to \int_{\mathbb{T}} f \, d\lambda = \frac{1}{2},
\]
where \( \lambda \) is Lebesgue measure.

The Birkhoff theorem gives this for \( \lambda \)-almost every \( x \). The stronger statement — convergence for *every* \( x \) — follows from the *unique ergodicity* of the irrational rotation: Lebesgue measure is the *unique* \( T \)-invariant Borel probability measure on \( \mathbb{T} \). This can be seen via Fourier analysis: the characters \( e_k(x) = e^{2\pi i k x} \) form an orthonormal basis of \( L^2(\mathbb{T}) \). We compute

\[
\frac{1}{N} \sum_{n=0}^{N-1} e_k(T^n x) = e_k(x) \cdot \frac{1}{N} \sum_{n=0}^{N-1} e^{2\pi i k n \alpha}.
\]
For \( k \neq 0 \), this is a geometric series: \( \frac{1}{N} \cdot \frac{e^{2\pi i k \alpha N} - 1}{e^{2\pi i k \alpha} - 1} \to 0 \) as \( N \to \infty \), since \( |e^{2\pi i k \alpha} - 1| > 0 \) (as \( k\alpha \notin \mathbb{Z} \) for \( k \neq 0 \)). For \( k = 0 \), the average is identically 1 \( = \int e_0 \, d\lambda \). By linearity and density of trigonometric polynomials in \( C(\mathbb{T}) \), the time averages converge to the space average for every continuous \( f \) and every \( x \). For our indicator \( f = \mathbf{1}_{[0,1/2)} \), approximate by continuous functions to get convergence to \( 1/2 \) for every \( x \).

The punchline: the orbit of *any* point \( x \) under the irrational rotation equidistributes in \( \mathbb{T} \) — a result known as Weyl's equidistribution theorem (1916), which predates Birkhoff by 15 years. Birkhoff's theorem subsumes this.
</div>

<div class="example">
<strong>Example (Non-Ergodic System — Identity Map).</strong> Let \( T = \mathrm{id} : [0,1] \to [0,1] \) be the identity map, with Lebesgue measure \( \lambda \). Clearly \( T \) is measure-preserving: \( \lambda(T^{-1}A) = \lambda(A) \) for all Borel \( A \). Consider \( f(x) = x \). The time average is

\[
\frac{1}{N} \sum_{n=0}^{N-1} f(T^n x) = \frac{1}{N} \sum_{n=0}^{N-1} f(x) = f(x) = x,
\]
which converges to \( x \), not to \( \int_0^1 x \, d\lambda(x) = 1/2 \). So the time average depends on the starting point \( x \) and is not the space average (except for \( x = 1/2 \) by coincidence). This confirms that \( T = \mathrm{id} \) is not ergodic: the invariant \(\sigma\)-algebra is the full Borel \(\sigma\)-algebra (every set is \( T \)-invariant), and the conditional expectation \( \mathbb{E}[f | \mathcal{I}] = f \) is not constant. The Birkhoff theorem says \( \tilde{f} = f \) (every point is a fixed point), and indeed \( \tilde{f}(x) = x \neq 1/2 \) for most \( x \).
</div>

## Section 9.2C: Spectral Characterization of Ergodicity

<div class="theorem">
<strong>Theorem (Spectral Characterization of Ergodicity)</strong>: Let \( T : (X, \mu) \to (X, \mu) \) be a measure-preserving transformation with Koopman operator \( U_T f = f \circ T \) on \( L^2(X, \mu) \). Then:

\[
T \text{ is ergodic} \iff \text{the eigenvalue } 1 \text{ of } U_T \text{ is simple} \iff \{ f \in L^2 : U_T f = f \} = \mathbb{C} \cdot \mathbf{1}.
\]
That is, \( T \) is ergodic if and only if the only \( T \)-invariant \( L^2 \) functions are constants.
</div>

<div class="proof">
<em>Proof.</em> Suppose \( T \) is ergodic and \( U_T f = f \), i.e., \( f(Tx) = f(x) \) a.e. For any \( c \in \mathbb{R} \), the set \( \{x : \mathrm{Re}(f(x)) > c\} \) is \( T \)-invariant (since \( f \circ T = f \)), so by ergodicity its measure is 0 or 1. This means \( \mathrm{Re}(f) \) is a.e. constant; similarly \( \mathrm{Im}(f) \) is a.e. constant, so \( f \) is a.e. constant. Conversely, if 1 is a simple eigenvalue and \( A \) is \( T \)-invariant (\( T^{-1}A = A \) a.e.), then \( U_T \mathbf{1}_A = \mathbf{1}_A \), so \( \mathbf{1}_A \in \text{Fix}(U_T) = \mathbb{C} \cdot \mathbf{1} \), hence \( \mathbf{1}_A \) is constant a.e., meaning \( \mu(A) \in \{0, 1\} \). \( \square \)
</div>

<div class="remark">
<strong>Remark.</strong> This spectral characterization is powerful for several reasons. First, it shows ergodicity is a property of the unitary operator \( U_T \) on Hilbert space, opening the door to spectral theory. Second, it connects to mixing: \( T \) is *weakly mixing* if and only if \( U_T \) has no eigenvalues other than 1 (i.e., its "discrete spectrum" is trivial). \( T \) is *strongly mixing* if and only if \( U_T^n \to 0 \) weakly. The spectral theory of \( U_T \) — particularly the spectral type (Lebesgue, singular, mixed) — is a major invariant in the classification of measure-preserving transformations.
</div>

## Section 9.2D: Mixing, Weak Mixing, and Spectral Types

The ergodic theorem tells us about the long-run average behavior of orbits. A stronger property — *mixing* — describes how the system "loses memory" of its initial state. Intuitively, a strongly mixing system is one where any two measurable sets become "statistically independent" as time progresses: knowing that \( x \in A \) gives no information about whether \( T^n x \in B \) for large \( n \).

<div class="definition">
<strong>Definition (Mixing Hierarchy)</strong>: Let \( (X, \mu, T) \) be a pmp system. We say \( T \) is:
<ul>
<li><strong>ergodic</strong> if every \( T \)-invariant set has measure 0 or 1;
<li><strong>weakly mixing</strong> if \( \frac{1}{N}\sum_{n=0}^{N-1} |\mu(T^{-n}A \cap B) - \mu(A)\mu(B)| \to 0 \) for all measurable \( A, B \);
<li><strong>mildly mixing</strong> if there is no rigidity sequence: no sequence \( n_k \to \infty \) with \( \mu(T^{-n_k}A \triangle A) \to 0 \) for all \( A \);
<li><strong>strongly mixing</strong> if \( \mu(T^{-n}A \cap B) \to \mu(A)\mu(B) \) for all measurable \( A, B \).
</ul>
These properties form a strict hierarchy: strongly mixing \( \Rightarrow \) mildly mixing \( \Rightarrow \) weakly mixing \( \Rightarrow \) ergodic.
</div>

<div class="example">
<strong>Example (Spectral Characterization of the Hierarchy).</strong> Let \( U = U_T \) be the Koopman operator on \( L^2_0 = L^2 \ominus \mathbb{C}\mathbf{1} \) (the orthogonal complement of constants).
<ul>
<li>\( T \) is ergodic \( \iff \) 1 is not an eigenvalue of \( U \) on \( L^2_0 \), i.e., \( U \) has no non-trivial fixed vectors in \( L^2_0 \).
<li>\( T \) is weakly mixing \( \iff \) \( U \) has no eigenvalues on the unit circle restricted to \( L^2_0 \), i.e., \( U|_{L^2_0} \) has *purely continuous spectrum*.
<li>\( T \) is strongly mixing \( \iff \) \( U^n \to 0 \) weakly on \( L^2_0 \), i.e., \( \langle U^n f, g\rangle \to 0 \) for all \( f, g \in L^2_0 \).
</ul>
The irrational rotation has *pure point spectrum* on \( L^2_0 \): the eigenfunctions are the characters \( e_k(x) = e^{2\pi ikx} \) with eigenvalues \( e^{2\pi i k\alpha} \) (all distinct for \( \alpha \notin \mathbb{Q} \)). This explains why the rotation is ergodic but not weakly mixing: it has eigenvalues \( e^{2\pi ik\alpha} \neq 1 \) for \( k \neq 0 \), hence not weakly mixing.
</div>

<div class="theorem">
<strong>Theorem (Halmos–von Neumann, 1942)</strong>: Let \( T \) be an ergodic pmp transformation with *pure point spectrum* (meaning \( L^2(X, \mu) \) is spanned by eigenfunctions of \( U_T \)). Then:
<ol>
<li>The eigenvalues of \( U_T \) form a countable subgroup \( \Lambda \subseteq \mathbb{T} \) (the *eigenvalue group* or *spectrum* of \( T \)).
<li>\( T \) is isomorphic (as a measure-preserving system) to the rotation \( R_a : k \mapsto k + a \) on the compact abelian group \( \hat{\Lambda} \) (Pontryagin dual of \( \Lambda \)) with Haar measure, where \( a \in \hat{\Lambda} \) is chosen so that \( a(\lambda) = \lambda \) for all \( \lambda \in \Lambda \).
<li>Two ergodic systems with pure point spectrum are isomorphic if and only if they have the same eigenvalue group \( \Lambda \).
</ol>
</div>

This is the complete classification of ergodic systems with pure point spectrum: they are all rotations on compact abelian groups, and the invariant is the eigenvalue group. The theorem is a precursor to the Ornstein isomorphism theory, showing that spectral invariants can give complete classification in special cases.

<div class="example">
<strong>Example (Classification via Eigenvalue Group).</strong>
<ul>
<li>The irrational rotation \( T(x) = x + \alpha \) has eigenvalue group \( \Lambda_\alpha = \{ e^{2\pi i n \alpha} : n \in \mathbb{Z} \} \cong \mathbb{Z} \). Two irrational rotations \( T_\alpha \) and \( T_\beta \) are isomorphic \( \iff \Lambda_\alpha = \Lambda_\beta \iff \alpha \) and \( \beta \) are rationally related (i.e., \( \alpha / \beta \in \mathbb{Q} \)).
<li>A rotation on a finite group \( \mathbb{Z}/N\mathbb{Z} \) (by generator 1) has eigenvalue group \( \Lambda = \{ e^{2\pi i k/N} : 0 \leq k < N \} \), the \( N \)-th roots of unity.
<li>A rotation on \( \mathbb{T}^2 \) by an irrational vector \( (\alpha_1, \alpha_2) \) with \( 1, \alpha_1, \alpha_2 \) rationally independent has eigenvalue group \( \Lambda = \{ e^{2\pi i(n_1\alpha_1 + n_2\alpha_2)} : n_1, n_2 \in \mathbb{Z} \} \).
</ul>
</div>

## Section 9.3: Consequences and Applications

<div class="theorem">
<strong>Theorem (Poincaré Recurrence)</strong>: Let \( T : X \to X \) be a measure-preserving transformation of a probability space \( (X, \mu) \). For any measurable set \( A \) with \( \mu(A) > 0 \), \( \mu \)-almost every \( x \in A \) returns to \( A \) infinitely often: for a.e. \( x \in A \), \( T^n x \in A \) for infinitely many \( n \geq 1 \).
</div>

<div class="proof">
<em>Proof.</em> Let \( B = \{ x \in A : T^n x \notin A \text{ for all } n \geq 1 \} \). The sets \( B, T^{-1}B, T^{-2}B, \ldots \) are pairwise disjoint (if \( x \in T^{-k}B \cap T^{-l}B \) with \( k < l \), then \( T^k x \in B \subseteq A \) and \( T^l x \in B \subseteq A \), so \( T^{l-k}(T^k x) \in A \), contradicting \( T^k x \in B \)). Since \( \mu(X) = 1 \) and all these sets have measure \( \mu(B) \), we must have \( \mu(B) = 0 \).
</div>

<div class="theorem">
<strong>Theorem (Multiple Recurrence, Furstenberg 1977)</strong>: Let \( (X, \mu) \) be a probability space, \( T \) a measure-preserving transformation, and \( A \subseteq X \) measurable with \( \mu(A) > 0 \). Then for any \( k \geq 1 \),

\[
\liminf_{N \to \infty} \frac{1}{N} \sum_{n=1}^N \mu(A \cap T^{-n}A \cap T^{-2n}A \cap \cdots \cap T^{-kn}A) > 0.
\]
In particular, there exists \( n \geq 1 \) such that \( A \cap T^{-n}A \cap \cdots \cap T^{-kn}A \neq \emptyset \).
</div>

This is Furstenberg's ergodic-theoretic proof of Szemerédi's theorem (every subset of integers with positive upper density contains arithmetic progressions of every length).

---

# Chapter 10: Orbit Equivalence for Aperiodic pmp \(\mathbb{Z}\)-Actions

## Section 10.1: Orbit Equivalence Relations

<div class="definition">
<strong>Definition (Orbit Equivalence)</strong>: Two pmp actions \( \Gamma \curvearrowright (X, \mu) \) and \( \Lambda \curvearrowright (Y, \nu) \) are <strong>orbit equivalent</strong> (OE) if there is a measure space isomorphism \( \phi : X \to Y \) (a measure-preserving bijection, defined a.e.) such that for a.e. \( x \in X \),

\[
\phi(\Gamma \cdot x) = \Lambda \cdot \phi(x).
\]
That is, \( \phi \) maps orbits to orbits (but not necessarily respecting the group structure).
</div>

Orbit equivalence is a much coarser equivalence than isomorphism of measure-preserving systems (which requires \( \phi \) to intertwine the group actions, not just map orbits to orbits).

<div class="definition">
<strong>Definition (Aperiodic Action)</strong>: A pmp action \( \Gamma \curvearrowright (X, \mu) \) is <strong>aperiodic</strong> (or <strong>free</strong>) if \( \mu(\{ x : \gamma \cdot x = x \}) = 0 \) for every non-identity \( \gamma \in \Gamma \). Equivalently, almost every orbit is infinite.
</div>

## Section 10.2: Dye's Theorem

<div class="theorem">
<strong>Theorem (Dye, 1959)</strong>: Any two aperiodic pmp \( \mathbb{Z} \)-actions (equivalently, any two aperiodic invertible measure-preserving transformations) are orbit equivalent.
</div>

This is a remarkable theorem: it says that for measure-preserving \( \mathbb{Z} \)-actions, there is only one orbit structure (up to measure-theoretic isomorphism). The group theoretic structure of the action (e.g., ergodicity, mixing, entropy) is entirely invisible to orbit equivalence among \( \mathbb{Z} \)-actions.

<div class="proof">
<em>Proof sketch.</em> The proof proceeds by showing both systems have the same orbit equivalence relation: the relation \( x \sim y \iff \exists n \in \mathbb{Z},\, T^n x = y \) (a.e.). For two aperiodic \( \mathbb{Z} \)-actions \( T \) on \( (X, \mu) \) and \( S \) on \( (Y, \nu) \), one constructs an explicit isomorphism as follows: partition \( X \) into "Rokhlin towers" (sets \( F_j, TF_j, T^2 F_j, \ldots, T^{h_j - 1} F_j \)) that cover most of \( X \), and similarly for \( Y \), then match towers of equal height. Iterating this process in the spirit of the Rokhlin lemma gives the desired orbit equivalence in the limit.
</div>

## Section 10.3: The Rokhlin Lemma

<div class="theorem">
<strong>Theorem (Rokhlin Lemma)</strong>: Let \( T : (X, \mu) \to (X, \mu) \) be an aperiodic measure-preserving transformation. For any \( n \in \mathbb{N} \) and \( \varepsilon > 0 \), there exists a measurable set \( F \subseteq X \) (a <strong>Rokhlin tower base</strong>) such that \( F, TF, T^2 F, \ldots, T^{n-1}F \) are pairwise disjoint and

\[
\mu\!\left(\bigcup_{k=0}^{n-1} T^k F\right) > 1 - \varepsilon.
\]
</div>

<div class="proof">
<em>Proof.</em> By aperiodicity, for each \( m \) the set \( A_m = \{ x : T^m x = x \} \) has measure 0. By the pointwise ergodic theorem, for a.e. \( x \), the first-return time to any set is well-defined. Using the uniform distribution of orbits, one constructs \( F \) explicitly using the first-return time decomposition.
</div>

## Section 10.4: The Full Group and Cocycles

<div class="definition">
<strong>Definition (Full Group)</strong>: For a pmp action \( T \in \mathrm{Aut}(X, \mu) \), the <strong>full group</strong> \( [T] \) is the set of all \( S \in \mathrm{Aut}(X, \mu) \) such that for a.e. \( x \in X \), \( Sx \in \{T^n x : n \in \mathbb{Z}\} \) (i.e., \( S \) maps each point to another point in its \( T \)-orbit).
</div>

Two aperiodic transformations are orbit equivalent if and only if their full groups are isomorphic as abstract groups (Dye's theorem reformulated). The full group is a complete invariant of the orbit equivalence class.

---

# Chapter 11: Entropy for \(\mathbb{Z}\)-Actions and Bernoulli Systems

## Section 11.1: Metric Entropy of a Partition

<div class="definition">
<strong>Definition (Shannon Entropy of a Partition)</strong>: Let \( (X, \mathcal{B}, \mu) \) be a probability space and \( \xi = \{ A_1, \ldots, A_k \} \) a finite measurable partition. The <strong>Shannon entropy</strong> of \( \xi \) is

\[
H(\xi) = -\sum_{i=1}^k \mu(A_i) \log \mu(A_i),
\]
with the convention \( 0 \log 0 = 0 \). (Logarithm to base 2 gives bits; natural log gives nats.)
</div>

<div class="definition">
<strong>Definition (Entropy of a Transformation with Respect to a Partition)</strong>: For a pmp transformation \( T \) and finite partition \( \xi \), define the <strong>join} \( \xi \vee T^{-1}\xi \vee \cdots \vee T^{-(n-1)}\xi \) as the partition into atoms \( A_{i_0} \cap T^{-1}A_{i_1} \cap \cdots \cap T^{-(n-1)}A_{i_{n-1}} \). The entropy of \( T \) with respect to \( \xi \) is

\[
h(T, \xi) = \lim_{n \to \infty} \frac{1}{n} H\!\left(\bigvee_{k=0}^{n-1} T^{-k}\xi\right).
\]
The limit exists by subadditivity of \( n \mapsto H(\bigvee_{k=0}^{n-1} T^{-k}\xi) \).
</div>

<div class="definition">
<strong>Definition (Kolmogorov–Sinai Entropy)</strong>: The <strong>metric entropy</strong> (or <strong>KS entropy</strong>) of \( T \) is

\[
h(T) = \sup_\xi h(T, \xi),
\]
where the supremum is over all finite measurable partitions \( \xi \).
</div>

<div class="theorem">
<strong>Theorem (Kolmogorov–Sinai)</strong>: If \( \xi \) is a <strong>generating partition</strong> for \( T \) — meaning the \(\sigma\)-algebra generated by \( \{ T^{-n}\xi : n \in \mathbb{Z} \} \) is (a.e.) the full \(\sigma\)-algebra \( \mathcal{B} \) — then \( h(T) = h(T, \xi) \).
</div>

This makes entropy computable: instead of taking the supremum over all partitions, one need only find a single generating partition and compute its entropy.

## Section 11.2: Entropy of Bernoulli Shifts

<div class="example">
<strong>Example (Entropy of Bernoulli Shifts).</strong> Let \( (Y, \nu) = (\{0, 1, \ldots, k-1\}, (p_0, \ldots, p_{k-1})) \) be a probability distribution on \( k \) symbols, and let \( T \) be the Bernoulli shift on \( Y^{\mathbb{Z}} \) with product measure \( \nu^{\mathbb{Z}} \). The partition \( \xi = \{ [i] : 0 \leq i \leq k-1 \} \) (where \( [i] = \{ x \in Y^{\mathbb{Z}} : x_0 = i \} \)) is a generating partition, and

\[
H\!\left(\bigvee_{j=0}^{n-1} T^{-j}\xi\right) = H(\xi \vee T^{-1}\xi \vee \cdots) = n \cdot H(\nu) = -n \sum_{i=0}^{k-1} p_i \log p_i.
\]
Hence \( h(T) = H(\nu) = -\sum p_i \log p_i \).
</div>

In particular:
- The \( (1/2, 1/2) \)-Bernoulli shift has entropy \( \log 2 \).
- The \( (1/3, 1/3, 1/3) \)-Bernoulli shift has entropy \( \log 3 \).
- These are not isomorphic as measure-preserving systems (Kolmogorov, 1958 — the first use of entropy in ergodic theory).

## Section 11.3: Properties of Entropy

<div class="theorem">
<strong>Theorem (Basic Properties)</strong>: For pmp transformations \( T, S \) on probability spaces:
<ol>
<li><strong>Isomorphism invariance:</strong> If \( T \cong S \) (measure-theoretic isomorphism), then \( h(T) = h(S) \).
<li><strong>Power formula:</strong> \( h(T^n) = |n| \cdot h(T) \) for \( n \in \mathbb{Z} \).
<li><strong>Invertibility:</strong> \( h(T^{-1}) = h(T) \).
<li><strong>Factors decrease entropy:</strong> If \( S \) is a factor of \( T \), then \( h(S) \leq h(T) \).
<li><strong>Products:</strong> \( h(T \times S) = h(T) + h(S) \).
</ol>
</div>

## Section 11.4: Topological Entropy

Topological entropy measures the exponential growth rate of distinguishable orbit segments — it is the most fundamental topological invariant of a dynamical system, capturing how fast the system "creates information" or "separates trajectories." Intuitively: given a finite resolution \( \varepsilon > 0 \), two trajectories are "distinguishable over time \( n \)" if they separate by more than \( \varepsilon \) at some time \( 0 \leq k < n \). The number of such distinguishable \( n \)-orbits grows exponentially in \( n \) for chaotic systems, and the topological entropy is the exponent. Systems with zero entropy are "tame" — they do not create new complexity — while systems with positive entropy are "chaotic" in the sense of exponential complexity growth.

There is a parallel notion of entropy for topological dynamical systems.

<div class="definition">
<strong>Definition (Topological Entropy, Adler–Konheim–McAndrew)</strong>: For a continuous map \( T : X \to X \) on a compact topological space, and an open cover \( \mathcal{U} \), let \( N(\mathcal{U}) \) be the minimum number of sets needed to cover \( X \) from \( \mathcal{U} \), and \( \mathcal{U}^n = \mathcal{U} \vee T^{-1}\mathcal{U} \vee \cdots \vee T^{-(n-1)}\mathcal{U} \) the join cover. Define

\[
h(T, \mathcal{U}) = \lim_{n \to \infty} \frac{1}{n} \log N(\mathcal{U}^n).
\]
The <strong>topological entropy</strong> is \( h_{top}(T) = \sup_{\mathcal{U}} h(T, \mathcal{U}) \).
</div>

**Alternative definition via separated sets.** On a compact metric space \( (X, d) \), a set \( S \subseteq X \) is \( (n, \varepsilon)\)-separated if for every \( x \neq y \in S \), there exists \( 0 \leq k < n \) with \( d(T^k x, T^k y) > \varepsilon \). Let \( \mathrm{sep}(n, \varepsilon, T) \) be the maximum cardinality of an \( (n, \varepsilon) \)-separated set. Then

\[
h_{top}(T) = \lim_{\varepsilon \to 0} \limsup_{n \to \infty} \frac{1}{n} \log \mathrm{sep}(n, \varepsilon, T).
\]
This definition (due to Bowen and Dinaburg) is equivalent to the open-cover definition and is often easier for explicit computation.

<div class="example">
<strong>Example (Irrational Rotation has Zero Entropy).</strong> Let \( T(x) = x + \alpha \pmod 1 \) on \( \mathbb{T} \). Fix \( \varepsilon > 0 \). Because \( T \) is an isometry (\( d(T^n x, T^n y) = d(x, y) \) for all \( n \)), two points \( x, y \) are \( (n, \varepsilon) \)-separated if and only if \( d(x, y) > \varepsilon \). So any \( (n, \varepsilon) \)-separated set is just an \( \varepsilon \)-separated set in the original metric on \( \mathbb{T} \), and \( \mathrm{sep}(n, \varepsilon, T) \leq \lceil 1/\varepsilon \rceil \) for all \( n \). Thus

\[
\limsup_{n \to \infty} \frac{1}{n} \log \mathrm{sep}(n, \varepsilon, T) \leq \lim_{n \to \infty} \frac{\log \lceil 1/\varepsilon \rceil}{n} = 0.
\]
So \( h_{top}(T) = 0 \). More generally, any equicontinuous system has zero topological entropy, because equicontinuity prevents orbits from separating at a rate faster than the initial separation.
</div>

<div class="example">
<strong>Example (Doubling Map has Entropy \( \log 2 \)).</strong> Let \( T(x) = 2x \pmod 1 \) on \( [0, 1) \). Consider the partition \( \xi = \{[0, 1/2), [1/2, 1)\} \) into two intervals. The \( n \)-fold join \( \bigvee_{k=0}^{n-1} T^{-k}\xi \) partitions \( [0,1) \) into \( 2^n \) intervals of length \( 1/2^n \) each, namely \( [j/2^n, (j+1)/2^n) \) for \( j = 0, 1, \ldots, 2^n - 1 \). Two points \( x, y \) in the same atom of this partition have \( |T^k x - T^k y| < 1/2^{n-k} \) for all \( k < n \), while points in different atoms are separated at some step. So \( \mathrm{sep}(n, \varepsilon, T) = 2^n \) for \( \varepsilon < 1/2 \), giving

\[
\frac{1}{n} \log \mathrm{sep}(n, \varepsilon, T) = \frac{n \log 2}{n} = \log 2.
\]
Hence \( h_{top}(T) = \log 2 \). The partition \( \xi \) is generating: the \(\sigma\)-algebra generated by \( \{ T^{-n}\xi : n \geq 0 \} \) is the full Borel \(\sigma\)-algebra on \( [0,1) \) (since the dyadic intervals generate the Borel sets). By the Kolmogorov–Sinai theorem, \( h_{Leb}(T) = h(T, \xi) = \log 2 \), and by the variational principle, \( h_{top}(T) = \log 2 \) as well.
</div>

<div class="example">
<strong>Example (Full Shift on \( k \) Symbols has Entropy \( \log k \)).</strong> Let \( \sigma : A^{\mathbb{Z}} \to A^{\mathbb{Z}} \) be the shift on \( k \) symbols (\( |A| = k \)). Consider two distinct words \( w, w' \in A^n \) (distinct finite sequences of length \( n \) over \( A \)). The cylinder sets \( [w] = \{ x : x_0 x_1 \cdots x_{n-1} = w \} \) and \( [w'] \) are disjoint, and any two points \( x \in [w] \), \( y \in [w'] \) are \( (n, \varepsilon) \)-separated for \( \varepsilon \) smaller than the diameter of a cylinder (since they differ in at least one coordinate among \( 0, 1, \ldots, n-1 \), and in the product metric the separation is detected at the corresponding time step). There are exactly \( k^n \) distinct words of length \( n \), so we can pick one point from each cylinder to get a \( (n, \varepsilon) \)-separated set of cardinality \( k^n \). Thus \( \mathrm{sep}(n, \varepsilon, \sigma) \geq k^n \) and

\[
h_{top}(\sigma) \geq \limsup_{n \to \infty} \frac{1}{n} \log k^n = \log k.
\]
For the upper bound: any \( (n, \varepsilon) \)-separated set has at most \( k^n \) elements (since two points with the same word of length \( n \) in positions \( 0, \ldots, n-1 \) are not separated within those \( n \) steps for small enough \( \varepsilon \)). Hence \( h_{top}(\sigma) = \log k \).
</div>

<div class="theorem">
<strong>Theorem (Variational Principle)</strong>: For a continuous map \( T : X \to X \) on a compact metrizable space,

\[
h_{top}(T) = \sup_\mu h_\mu(T),
\]
where the supremum is over all \( T \)-invariant Borel probability measures \( \mu \), and \( h_\mu(T) \) is the metric entropy with respect to \( \mu \).
</div>

<div class="remark">
<strong>Remark (Significance of the Variational Principle).</strong> The variational principle is a profound bridge between topological and measure-theoretic entropy. It says that topological entropy is the "maximum possible" measure-theoretic entropy over all invariant measures. A measure \( \mu \) that achieves the supremum (if it exists) is called a <em>measure of maximal entropy</em>. For the full \( k \)-shift, the unique measure of maximal entropy is the uniform Bernoulli measure \( (1/k, \ldots, 1/k)^{\mathbb{Z}} \). For the doubling map, Lebesgue measure is the measure of maximal entropy (metric entropy = \( \log 2 \) = topological entropy). For systems with multiple invariant measures, the variational principle explains the relationship between topological complexity and measure-theoretic mixing.
</div>

## Section 11.5: Entropy and Lyapunov Exponents

For smooth dynamical systems on compact manifolds, topological entropy has a beautiful connection to the *Lyapunov exponents* — the exponential rates of expansion and contraction of the derivative map. This connection is captured by the Margulis–Ruelle inequality and the Pesin entropy formula.

<div class="definition">
<strong>Definition (Lyapunov Exponents)</strong>: Let \( T : M \to M \) be a \( C^1 \) diffeomorphism of a compact Riemannian manifold \( M \), and \( \mu \) a \( T \)-invariant ergodic probability measure. By the Oseledets multiplicative ergodic theorem, for \( \mu \)-almost every \( x \in M \), the tangent space \( T_x M \) decomposes into subspaces \( E_1(x), \ldots, E_k(x) \) (the *Oseledets subspaces*) with corresponding *Lyapunov exponents* \( \lambda_1 > \lambda_2 > \cdots > \lambda_k \) such that

\[
\lim_{n \to \infty} \frac{1}{n} \log \|DT^n_x v\| = \lambda_i \quad \text{for } v \in E_i(x) \setminus \{0\}.
\]
</div>

<div class="theorem">
<strong>Theorem (Margulis–Ruelle Inequality)</strong>: For a \( C^1 \) diffeomorphism \( T : M \to M \) and any \( T \)-invariant ergodic probability measure \( \mu \):

\[
h_\mu(T) \leq \sum_{\lambda_i > 0} \lambda_i \cdot \dim E_i,
\]
where the sum is over positive Lyapunov exponents (the "expanding directions"). The right-hand side is the total positive Lyapunov exponent (sum with multiplicity).
</div>

<div class="theorem">
<strong>Theorem (Pesin Entropy Formula)</strong>: If \( T : M \to M \) is a \( C^2 \) diffeomorphism and \( \mu \) is an ergodic invariant measure that is absolutely continuous with respect to Lebesgue measure, then equality holds in the Ruelle inequality:

\[
h_\mu(T) = \sum_{\lambda_i > 0} \lambda_i \cdot \dim E_i.
\]
</div>

<div class="example">
<strong>Example (Entropy of the Arnold Cat Map via Lyapunov Exponents).</strong> The Arnold cat map \( A = \begin{pmatrix} 2 & 1 \\ 1 & 1 \end{pmatrix} \) on \( \mathbb{T}^2 \) has constant derivative \( DA = A \) (it is a linear map). Its eigenvalues are \( \lambda_\pm = \frac{3 \pm \sqrt{5}}{2} \). Since \( \lambda_+ = \frac{3+\sqrt{5}}{2} > 1 \) and \( \lambda_- = \frac{3-\sqrt{5}}{2} \in (0,1) \), the Lyapunov exponents are \( \log \lambda_+ > 0 \) and \( \log \lambda_- < 0 \). The Lebesgue measure on \( \mathbb{T}^2 \) is the unique measure of maximal entropy (by the variational principle and the fact that the system is ergodic with respect to Lebesgue measure). By the Pesin formula:

\[
h_{Leb}(A) = \log \lambda_+ = \log\!\left(\frac{3+\sqrt{5}}{2}\right).
\]
Since Lebesgue measure is the measure of maximal entropy, \( h_{top}(A) = \log\!\left(\frac{3+\sqrt{5}}{2}\right) \approx 0.962 \).
</div>

## Section 11.6: Entropy for Algebraic Systems

For *algebraic* dynamical systems (group automorphisms, algebraic actions of abelian groups), entropy has especially clean formulas.

<div class="theorem">
<strong>Theorem (Entropy of Toral Automorphisms)</strong>: Let \( A \in GL(n, \mathbb{Z}) \) act on \( \mathbb{T}^n = \mathbb{R}^n/\mathbb{Z}^n \) as a toral automorphism. Then

\[
h_{top}(A) = h_{Leb}(A) = \log |\mathrm{Mahler}(p_A)| = \sum_{|\lambda_i| > 1} \log |\lambda_i|,
\]
where \( p_A \) is the characteristic polynomial of \( A \), the sum is over eigenvalues outside the unit circle, and \( |\mathrm{Mahler}(p)| \) is the Mahler measure of the polynomial.
</div>

The Mahler measure of a polynomial \( p(z) = a \prod (z - \alpha_i) \) is \( M(p) = |a| \prod_i \max(1, |\alpha_i|) \). The formula shows that entropy for toral automorphisms is purely algebraic — it depends only on the characteristic polynomial and its roots outside the unit circle.

<div class="example">
<strong>Example (Ledrappier's Three-Dot System).</strong> Consider the \( \mathbb{Z}^2 \)-action on \( X = \mathbb{T}^{\mathbb{Z}^2} \) defined by \( \alpha^{(m,n)}(x)_{(i,j)} = x_{(i+m, j+n)} \), where the phase space is the shift-invariant subgroup defined by \( x_{(i,j)} + x_{(i+1,j)} + x_{(i,j+1)} = 0 \pmod 1 \) for all \( (i,j) \). This is Ledrappier's "three-dot system" (1978), one of the first examples of a \( \mathbb{Z}^2 \) action with interesting entropy behavior. Its topological entropy is infinite (as a \( \mathbb{Z}^2 \)-system in the sense of entropy per \( \mathbb{Z}^2 \)-translate), yet the system has remarkable rigidity properties.
</div>

---

# Chapter 12: Ornstein's Theorem

## Section 12.1: The Isomorphism Problem

Two central questions in ergodic theory are:
1. **Classification up to isomorphism**: When are two measure-preserving systems isomorphic?
2. **Entropy as a complete invariant**: Is entropy sufficient to classify Bernoulli shifts?

The first question motivated much of classical ergodic theory (from Halmos-von Neumann's spectral theory to the entropy theory of Kolmogorov-Sinai). The second was answered definitively by Ornstein.

## Section 12.2: Finitely Determined Processes and Weak Bernoulli

<div class="definition">
<strong>Definition (Very Weak Bernoulli / Finitely Determined)</strong>: A stationary process \( (X, T, \xi) \) (where \( \xi \) is a generating partition) is:
<ul>
<li><strong>weakly Bernoulli</strong> if for every \( \varepsilon > 0 \) there exists \( n \) such that the join \( \bigvee_{k=0}^{n-1} T^{-k}\xi \) and the "past" \( \bigvee_{k=n}^\infty T^{-k}\xi \) are \( \varepsilon \)-independent (in the sense of \(\bar{d}\)-distance);
<li><strong>finitely determined</strong> if it is determined (up to \(\bar{d}\)-closeness) by finitely many parameters — its entropy and the distribution of a finite block.
</ul>
The \(\bar{d}\)-metric on processes is defined by

\[
\bar{d}(\xi, \eta) = \inf\left\{ \int d_H(\omega_\xi(x), \omega_\eta(y)) : \text{couplings of the two processes} \right\},
\]
where \( d_H \) is a normalized Hamming distance.
</div>

## Section 12.3: Ornstein's Isomorphism Theorem

<div class="theorem">
<strong>Theorem (Ornstein, 1970)</strong>: Two Bernoulli shifts \( (Y_1^{\mathbb{Z}}, \sigma, \nu_1^{\mathbb{Z}}) \) and \( (Y_2^{\mathbb{Z}}, \sigma, \nu_2^{\mathbb{Z}}) \) are isomorphic as measure-preserving systems if and only if they have the same entropy:

\[
h(\sigma_1) = h(\sigma_2) \iff \nu_1^{\mathbb{Z}} \text{ and } \nu_2^{\mathbb{Z}} \text{ are isomorphic}.
\]
</div>

<div class="proof">
<em>Proof sketch.</em> The proof has two parts:

<em>Entropy is an isomorphism invariant</em> (Kolmogorov, 1958): This was established earlier and shows entropy is necessary.

<em>Entropy is sufficient (Ornstein's theorem proper)</em>: The key insight is that Bernoulli shifts are "finitely determined": given \( \varepsilon > 0 \), two Bernoulli shifts \( T, S \) with the same entropy, there is a partition \( \xi \) of the first system that is \( \varepsilon \)-close (in \( \bar{d} \)) to a partition of the second with the same distribution and entropy. By iteratively improving approximations (the "Ornstein copying lemma"), one constructs an actual measure-preserving isomorphism in the limit.

The core technical lemma, the <em>Ornstein Copying Lemma</em>, states: given a stationary process and \( \varepsilon > 0 \), one can "copy" a long block of the process into another system that has the right entropy, with an error at most \( \varepsilon \) in \( \bar{d} \).
</em>
</div>

<div class="remark">
<strong>Remark.</strong> Ornstein's theorem is a profound result: it says that for the class of Bernoulli systems, entropy is a <em>complete} invariant. This is in stark contrast to the general classification problem (there are uncountably many non-isomorphic ergodic systems with any given entropy). It also means the \( (1/2, 1/2) \)-Bernoulli shift and the \( (1/4, 1/4, 1/4, 1/4) \)-Bernoulli shift are isomorphic — a fact with no obvious direct proof.
</remark>
</div>

## Section 12.4: Bernoulli Systems and Mixing

<div class="definition">
<strong>Definition (Mixing)</strong>: A pmp transformation \( T \) is:
<ul>
<li><strong>strongly mixing</strong> if for all measurable \( A, B \): \( \mu(T^{-n}A \cap B) \to \mu(A)\mu(B) \) as \( n \to \infty \);
<li><strong>weakly mixing</strong> if \( \frac{1}{N}\sum_{n=0}^{N-1} |\mu(T^{-n}A \cap B) - \mu(A)\mu(B)| \to 0 \).
</ul>
</div>

<div class="theorem">
<strong>Theorem</strong>: Every Bernoulli shift is strongly mixing.
</div>

<div class="proof">
<em>Proof.</em> For cylinder sets \( A = [a_{-m}, \ldots, a_0, \ldots, a_k] \) and \( B = [b_{-l}, \ldots, b_l] \), for \( n \) large enough \( T^{-n}A \) and \( B \) depend on disjoint coordinates, so by independence of product measure, \( \mu(T^{-n}A \cap B) = \mu(A)\mu(B) \) exactly for large \( n \). The result extends to all measurable sets by approximation.
</div>

## Section 12.5: Extensions and Further Results

Ornstein's theory extends in several directions:

1. **Bernoulli spectrum**: A system \( (X, T) \) is Bernoulli if and only if it is weakly Bernoulli. This gives a tractable characterization.

2. **Ornstein–Weiss theorem (1987)**: Ornstein's isomorphism theorem extends to Bernoulli actions of amenable groups \( \Gamma \): two Bernoulli \( \Gamma \)-actions are isomorphic if and only if they have the same entropy.

3. **Non-amenable groups**: For non-amenable groups, entropy is no longer a complete invariant for Bernoulli actions. Popa (2006) showed there are non-isomorphic Bernoulli actions of free groups with the same entropy using rigidity theory.

4. **Entropy and orbit equivalence**: While entropy distinguishes Bernoulli shifts up to isomorphism, orbit equivalence (Chapter 10) is much coarser — all aperiodic pmp \( \mathbb{Z} \)-actions are orbit equivalent regardless of entropy.

<div class="theorem">
<strong>Theorem (Sinai, 1962)</strong>: Every ergodic pmp \( \mathbb{Z} \)-action \( T \) with entropy \( h(T) \geq h \) has the Bernoulli shift of entropy \( h \) as a factor.
</div>

This is Sinai's "factor theorem" and was a precursor to Ornstein's full theorem. Together with Ornstein's result, it gives the complete picture: among Bernoulli systems, entropy classifies up to isomorphism; among general ergodic systems, entropy is only a necessary invariant.

---

# Appendix A: Topological Prerequisites

## Section A.1: Compact Hausdorff Spaces

We collect key facts about compact Hausdorff spaces used throughout.

- A closed subset of a compact space is compact.
- A continuous map from a compact space to a Hausdorff space is a closed map; if bijective, it is a homeomorphism.
- The product of compact spaces is compact (Tychonoff's theorem).
- A compact Hausdorff space is normal (T4): disjoint closed sets can be separated by open sets.
- The continuous real-valued functions \( C(X) \) on a compact Hausdorff \( X \) separate points and determine the topology.

## Section A.2: Nets and Convergence

In non-metrizable spaces, sequences do not suffice for topology; nets are the proper generalization.

<div class="definition">
<strong>Definition (Net)</strong>: A <strong>net} in a set \( X \) is a function \( (x_\alpha)_{\alpha \in \Lambda} \) where \( (\Lambda, \leq) \) is a directed set. A net converges to \( x \in X \) (in a topological space) if for every neighborhood \( U \ni x \) there exists \( \alpha_0 \) such that \( x_\alpha \in U \) for all \( \alpha \geq \alpha_0 \).
</div>

In a compact Hausdorff space, every net has a convergent subnet (compactness). The ultrafilter \( \mathcal{U} \)-limit \( \lim_{\mathcal{U}} f \) (used in defining the Stone-Čech extension) is a net-theoretic limit.

## Section A.3: Baire Category Theorem

<div class="theorem">
<strong>Theorem (Baire Category Theorem)</strong>: A complete metric space (or a locally compact Hausdorff space) is a Baire space: the intersection of countably many dense open sets is dense. Equivalently, a countable union of nowhere dense sets has empty interior.
</div>

This is used in ergodic theory (e.g., genericity of ergodic transformations in \( \mathrm{Aut}(X, \mu) \)) and in topological dynamics (e.g., the set of minimal flows is residual in appropriate spaces).

---

# Appendix B: Measure-Theoretic Prerequisites

## Section B.1: Lebesgue Integration Summary

Let \( (X, \mathcal{B}, \mu) \) be a measure space.

- \( L^p(X, \mu) \) for \( 1 \leq p \leq \infty \) denotes the Banach space of (equivalence classes of) measurable functions \( f \) with \( \|f\|_p = \left(\int |f|^p \, d\mu\right)^{1/p} < \infty \) (with the appropriate modification for \( p = \infty \)).
- \( L^2(X, \mu) \) is a Hilbert space with inner product \( \langle f, g \rangle = \int f \bar{g} \, d\mu \).
- Dominated Convergence Theorem: if \( f_n \to f \) a.e. and \( |f_n| \leq g \in L^1 \), then \( \int f_n \to \int f \).
- Monotone Convergence Theorem: if \( 0 \leq f_n \nearrow f \) a.e., then \( \int f_n \nearrow \int f \).

## Section B.2: Conditional Expectation

<div class="definition">
<strong>Definition (Conditional Expectation)</strong>: Let \( (X, \mathcal{B}, \mu) \) be a probability space and \( \mathcal{A} \subseteq \mathcal{B} \) a sub-\(\sigma\)-algebra. For \( f \in L^1(X, \mu) \), the <strong>conditional expectation} \( \mathbb{E}[f | \mathcal{A}] \) is the unique \( \mathcal{A}\)-measurable function (up to a.e. equality) such that

\[
\int_A \mathbb{E}[f | \mathcal{A}] \, d\mu = \int_A f \, d\mu \quad \text{for all } A \in \mathcal{A}.
\]
</div>

Conditional expectation is the \( L^2 \)-orthogonal projection onto \( L^2(X, \mathcal{A}, \mu) \) (when \( f \in L^2 \)). It satisfies the tower property: if \( \mathcal{A} \subseteq \mathcal{A}' \subseteq \mathcal{B} \), then \( \mathbb{E}[\mathbb{E}[f|\mathcal{A}']|\mathcal{A}] = \mathbb{E}[f|\mathcal{A}] \). Conditional expectation with respect to the invariant \(\sigma\)-algebra is central to the proof of the Birkhoff ergodic theorem and to the theory of disintegrations.

## Section B.3: The Ergodic Decomposition

<div class="theorem">
<strong>Theorem (Ergodic Decomposition)</strong>: Let \( T \) be a pmp transformation of a standard probability space \( (X, \mu) \). Then there is a measurable decomposition \( \mu = \int \mu_x \, d\mu(x) \) where each \( \mu_x \) is an ergodic \( T \)-invariant probability measure, and \( \mu_x = \mu_y \) a.e. when \( x \) and \( y \) are in the same ergodic component.
</div>

This shows every pmp system decomposes into ergodic components, so it suffices (for most purposes) to study ergodic systems.

---

# Appendix C: Worked Problems

This appendix collects 20 problems organized into four parts. Problems in Parts A and B are computational; Parts C and D develop theory. Solutions are sketched where the argument illuminates a key idea.

## Part A: Topological Dynamics — Minimality, Equicontinuity, Proximal/Distal

**Problem A1.** Let \( T : \mathbb{T}^2 \to \mathbb{T}^2 \) be the map \( T(x, y) = (x + \alpha, y + x) \pmod 1 \) (a *skew rotation* or *two-step nilrotation*) where \( \alpha \notin \mathbb{Q} \). Prove that the system \( (\mathbb{T}^2, T) \) is minimal. (*Hint:* Show that for any \( (x_0, y_0) \), the orbit closure contains \( \{x_0\} \times \mathbb{T} \) by examining the \( y \)-coordinates of the orbit, then use minimality of the \( x \)-rotation to expand to all of \( \mathbb{T}^2 \).)

**Problem A2.** Let \( X = \{0, 1, 2\}^{\mathbb{Z}} \) with the shift \( \sigma \), and let \( Y \subseteq X \) be the subshift defined by the forbidden word \( 12 \) (no occurrence of the pattern \( 1 \) followed immediately by \( 2 \)). Is \( (Y, \sigma) \) minimal? Either prove it or find a proper closed invariant subset.

**Problem A3.** Prove that an equicontinuous minimal flow on a metrizable compact space is *distal*. (*Hint:* If \( d(g_\alpha x, g_\alpha y) \to 0 \) for a net \( (g_\alpha) \), use equicontinuity to show \( d(x, y) \) must also be zero.)

**Problem A4.** Let \( G \) be an amenable group acting on a compact metrizable space \( X \). Suppose the action is distal. Prove that \( X \) supports a \( G \)-invariant probability measure. (*Hint:* Use the Fixed Point Theorem for amenable groups applied to the action on \( \mathcal{M}(X) \).)

**Problem A5.** Let \( T : X \to X \) be a homeomorphism of a compact metric space. Define the *prolongation relation*: \( (x, y) \in P \) if there exists a net \( x_\alpha \to x \) and integers \( n_\alpha \) such that \( T^{n_\alpha} x_\alpha \to y \). Show that \( P \) is a closed relation containing the proximal relation \( \sim_P \), and that \( P = \sim_P \) when \( T \) is equicontinuous.

## Part B: Entropy — Topological Entropy Computations

**Problem B1.** Compute the topological entropy of the map \( T : \mathbb{T}^2 \to \mathbb{T}^2 \) given by the Arnold cat map matrix \( A = \begin{pmatrix} 2 & 1 \\ 1 & 1 \end{pmatrix} \). (*Hint:* The topological entropy of a toral automorphism equals \( \sum_i \log|\lambda_i| \) where the sum is over eigenvalues \( |\lambda_i| > 1 \). The eigenvalues of \( A \) are \( \frac{3 \pm \sqrt{5}}{2} \).)

**Problem B2.** Let \( T : [0,1] \to [0,1] \) be the tent map: \( T(x) = 2x \) for \( x \leq 1/2 \) and \( T(x) = 2(1-x) \) for \( x \geq 1/2 \). Compute \( h_{top}(T) \). (*Hint:* Use the partition \( \{[0,1/2], [1/2,1]\} \) and count the number of laps in \( T^n \).)

**Problem B3.** A *subshift of finite type* (SFT) is determined by a 0–1 transition matrix \( A \) (where \( A_{ij} = 1 \) means the transition \( i \to j \) is allowed). Prove that \( h_{top}(\sigma_A) = \log \lambda_1 \) where \( \lambda_1 \) is the spectral radius of \( A \). (*Hint:* The number of admissible words of length \( n \) is \( \sum_{i,j} (A^n)_{ij} \), which grows like \( \lambda_1^n \) by the Perron–Frobenius theorem.)

**Problem B4.** Let \( (X, T) \) and \( (Y, S) \) be compact topological dynamical systems. Prove that \( h_{top}(T \times S) = h_{top}(T) + h_{top}(S) \), where \( T \times S \) acts on \( X \times Y \) by \( (T \times S)(x, y) = (Tx, Sy) \).

**Problem B5.** Let \( T : X \to X \) be a continuous map and \( \phi : X \to Y \) a factor map (continuous, surjective, equivariant). Prove \( h_{top}(S) \leq h_{top}(T) \) where \( S \) is the factor map. Then give an example where the inequality is strict.

## Part C: Ergodic Theory — Ergodicity, Birkhoff, Koopman

**Problem C1.** Let \( T : \mathbb{T}^2 \to \mathbb{T}^2 \) be the skew rotation \( T(x, y) = (x + \alpha, y + x) \) with \( \alpha \notin \mathbb{Q} \). Prove that \( T \) is ergodic with respect to Lebesgue measure on \( \mathbb{T}^2 \) using Fourier analysis: show that every \( T \)-invariant \( L^2 \) function is constant. (*Hint:* If \( f = \sum_{m,n} \hat{f}(m,n) e^{2\pi i(mx + ny)} \) is \( T \)-invariant, then \( \hat{f}(m,n) e^{2\pi i(m\alpha)} e^{2\pi i(nx)} = \hat{f}(m,n) e^{2\pi inx} \cdot e^{2\pi imx}... \) — work this out carefully to show \( \hat{f}(m,n) = 0 \) for \( (m,n) \neq (0,0) \).)

**Problem C2.** Let \( T \) be the doubling map \( T(x) = 2x \pmod 1 \) and \( f(x) = \cos(2\pi x) \). Compute \( \lim_{N \to \infty} \frac{1}{N} \sum_{n=0}^{N-1} f(T^n x) \) for Lebesgue-almost every \( x \). Identify the limit explicitly.

**Problem C3.** Let \( (X, \mu, T) \) be a pmp system and \( U_T \) the Koopman operator. Prove that \( T \) is weakly mixing if and only if for every \( f, g \in L^2(X, \mu) \):

\[
\lim_{N \to \infty} \frac{1}{N} \sum_{n=0}^{N-1} |\langle U_T^n f, g \rangle - \langle f, \mathbf{1}\rangle \langle \mathbf{1}, g\rangle| = 0.
\]
(*Hint:* Weak mixing is equivalent to \( U_T \otimes U_T \) being ergodic on \( L^2(X \times X, \mu \times \mu) \).)

**Problem C4.** Let \( T \) be an ergodic pmp transformation and \( f, g \in L^2(X, \mu) \). Prove the *ergodic theorem for products*: \( \frac{1}{N} \sum_{n=0}^{N-1} f(T^n x) g(T^{2n} x) \to \int f \, d\mu \cdot \int g \, d\mu \) in \( L^2 \) if \( T \) is weakly mixing. (*Hint:* Apply the van der Corput trick: a sequence \( (a_n) \) in a Hilbert space with \( \lim_{H \to \infty} \frac{1}{H}\sum_{h=1}^{H} \limsup_{N} |\frac{1}{N}\sum_n \langle a_{n+h}, a_n\rangle| = 0 \) has Cesàro mean 0.)

**Problem C5.** Construct an explicit example of an ergodic pmp transformation that is not mixing. (*Hint:* The irrational rotation \( T(x) = x + \alpha \pmod 1 \) is ergodic (proved in Problem C1 for the 2-torus; adapt for the circle). Show it is not mixing by taking \( A = [0, 1/4) \) and computing \( \mu(T^{-n}A \cap A) \) for suitable \( n \) — it oscillates rather than converging to \( \mu(A)^2 \).)

## Part D: Furstenberg / Combinatorics — Challenge Problems

**Problem D1 (Sárközy's Theorem).** Let \( A \subseteq \mathbb{N} \) with \( d^*(A) > 0 \). Prove that \( A \) contains two elements differing by a perfect square: there exist \( a, b \in A \) and \( n \geq 1 \) with \( b - a = n^2 \). Use the ergodic approach: apply the Furstenberg Correspondence Principle to get a pmp system \( (X, \mu, T) \) and set \( B \) with \( \mu(B) > 0 \), then show \( \limsup_{N} \frac{1}{N}\sum_{n=1}^N \mu(B \cap T^{-n^2}B) \geq \mu(B)^2 > 0 \) using the spectral theory of \( U_T \).

**Problem D2 (Polynomial Szemerédi).** State (without proof) the Furstenberg–Bergelson–Leibman theorem: if \( p_1, \ldots, p_k \in \mathbb{Z}[n] \) are polynomials with \( p_i(0) = 0 \) for all \( i \), and \( A \subseteq \mathbb{Z} \) has \( d^*(A) > 0 \), then \( A \) contains a configuration \( \{a, a + p_1(n), \ldots, a + p_k(n)\} \) for some \( a \in \mathbb{Z} \), \( n \geq 1 \). Explain why the case \( p_i(n) = in \) recovers Szemerédi's theorem, and why the case \( p_1(n) = n^2 \) gives Sárközy's theorem.

**Problem D3 (IP Sets and Recurrence).** An IP* set is a set \( A \) that intersects every IP set. Prove that the set of return times \( \{ n \geq 1 : \mu(B \cap T^{-n}B) > 0 \} \) is an IP* set when \( (X, \mu, T) \) is a pmp system and \( \mu(B) > 0 \). (*Hint:* Use idempotent ultrafilters: if \( p = p \cdot p \) is an idempotent ultrafilter in \( \beta\mathbb{N} \) and \( C \in p \), then \( C \) is an IP set. Show that the return-time set contains every IP set by applying Hindman's theorem.)

**Problem D4 (Van der Waerden via Topological Dynamics).** Give a proof of van der Waerden's theorem — for any finite coloring of \( \mathbb{N} \), one color class contains arithmetic progressions of every length — using only topological dynamics (no ergodic theory). The steps are: (a) model the coloring as a point \( x \) in a shift space \( K^{\mathbb{Z}} \); (b) take a minimal subflow \( M \) of the orbit closure; (c) apply Birkhoff recurrence to find a uniformly recurrent point; (d) use the Furstenberg–Weiss topological multiple recurrence theorem (that every minimal system \( (M, T) \) satisfies: for every open \( U \neq \emptyset \), there exist \( x \in U \) and \( n \geq 1 \) with \( x, Tx, \ldots, T^{kn}x \in U \) for any \( k \)).

**Problem D5 (Density Ramsey via Correspondence).** Let \( A \subseteq \mathbb{Z}^2 \) with \( d^*(A) > 0 \) (upper density in \( \mathbb{Z}^2 \)). Using the Furstenberg Correspondence Principle for \( \mathbb{Z}^2 \)-actions, show that \( A \) contains the vertices of an axis-aligned square: there exist \( (a, b) \in \mathbb{Z}^2 \) and \( n \geq 1 \) with \( (a,b), (a+n, b), (a, b+n), (a+n, b+n) \in A \). State which multiple recurrence theorem (for \( \mathbb{Z}^2 \)-actions) you would need to complete this argument, and note that it is implied by the Furstenberg–Katznelson theorem (1978) on multidimensional Szemerédi.

---

# Appendix D: Historical Timeline

The following 30-entry timeline traces the development of topological dynamics and ergodic theory from its origins to the early twenty-first century.

| Year | Event |
|------|-------|
| **1890** | Henri Poincaré proves the *Poincaré Recurrence Theorem* in his prize-winning paper on the three-body problem: almost every point in a bounded measure-preserving system returns arbitrarily close to its starting position. |
| **1898** | Jacques Hadamard studies geodesic flows on surfaces of negative curvature, anticipating hyperbolic dynamics. |
| **1900** | Ludwig Boltzmann's *ergodic hypothesis* in statistical mechanics: a generic trajectory visits all states on a constant-energy surface. |
| **1906** | Henri Lebesgue's *Lebesgue integration theory* provides the measure-theoretic foundation needed for ergodic theory. |
| **1913** | Poul Heegaard and Max Dehn contribute to the study of surface mappings, early precursors to topological dynamics. |
| **1916** | Hermann Weyl proves the *Weyl equidistribution theorem*: the sequence \( n\alpha \pmod 1 \) is equidistributed in \( [0,1) \) for irrational \( \alpha \). |
| **1927** | Birkhoff and Smith's paper on "recurrence" introduces the notion of recurrent motion in abstract dynamical systems. |
| **1931** | George David Birkhoff proves the *Birkhoff Pointwise Ergodic Theorem*, the rigorous vindication of Boltzmann's hypothesis for time averages. |
| **1932** | John von Neumann proves the *Mean Ergodic Theorem* (Hilbert space formulation), inspired by quantum mechanics and Koopman's operator-theoretic approach. |
| **1932** | Bernard Koopman introduces the *Koopman operator* \( U_T f = f \circ T \) on \( L^2 \), launching the spectral approach to ergodic theory. |
| **1942** | Paul Halmos and John von Neumann classify ergodic transformations with *pure point spectrum* (Halmos–von Neumann theorem): they are rotations on compact abelian groups. |
| **1949** | Paul Halmos proves the *Conjugacy Lemma*: the set of ergodic transformations is dense (and \( G_\delta \)) in \( \mathrm{Aut}(X, \mu) \). |
| **1955** | Robert Ellis introduces the *Ellis semigroup* and proves the *Ellis–Namiooka–Ruppert theorem* on the existence of idempotents in compact right-topological semigroups. |
| **1956** | Furstenberg defines and studies *distal flows*, initiating the structure theory of topological dynamical systems. |
| **1958** | Andrei Kolmogorov introduces *entropy* into ergodic theory, proving that the \( (1/2,1/2) \)- and \( (1/3,1/3,1/3) \)-Bernoulli shifts are non-isomorphic. |
| **1959** | Henry Dye proves *Dye's Theorem*: any two aperiodic pmp \( \mathbb{Z} \)-actions are orbit equivalent. |
| **1959** | Yakov Sinai defines the *Kolmogorov–Sinai entropy* and proves the Kolmogorov–Sinai theorem (generating partitions compute entropy). |
| **1962** | Sinai proves his *factor theorem*: any ergodic pmp system of entropy \( h \) has the Bernoulli shift of entropy \( h \) as a factor. |
| **1963** | Adler, Konheim, and McAndrew introduce *topological entropy*, the topological analog of metric entropy. |
| **1967** | Harry Furstenberg proves his *structure theorem for minimal distal flows*: every minimal distal flow is built from equicontinuous extensions in a transfinite tower. |
| **1970** | Donald Ornstein proves his *isomorphism theorem*: two Bernoulli shifts are isomorphic iff they have the same entropy, making entropy a complete invariant for Bernoulli systems. |
| **1973** | Neil Hindman proves *Hindman's Theorem* (the finite sums theorem), using a purely combinatorial argument; the ultrafilter proof by Glazer came shortly after. |
| **1975** | Endre Szemerédi proves (by combinatorics) that any subset of integers with positive upper density contains arithmetic progressions of every length. |
| **1977** | Hillel Furstenberg gives an ergodic-theoretic proof of Szemerédi's theorem via the *Furstenberg Correspondence Principle* and the *Multiple Recurrence Theorem*. |
| **1978** | Furstenberg and Katznelson prove the *multidimensional Szemerédi theorem*: subsets of \( \mathbb{Z}^d \) with positive density contain all finite configurations (not just arithmetic progressions). |
| **1981** | Ornstein and Weiss prove that Bernoulli actions of amenable groups are classified by entropy. |
| **1991** | Marina Ratner proves the *Ratner theorems* on the rigidity and equidistribution of unipotent flows on homogeneous spaces, resolving Raghunathan's conjectures. |
| **2001** | Timothy Gowers introduces *Gowers uniformity norms* as a quantitative approach to Szemerédi's theorem, giving polynomial bounds. |
| **2004** | Ben Green and Terence Tao prove that the *primes contain arithmetic progressions of every length*, combining ergodic ideas with analytic number theory. |
| **2006** | Einsiedler, Katok, and Lindenstrauss prove *partial results on quantum unique ergodicity* and use measure rigidity to resolve Littlewood's conjecture on simultaneous Diophantine approximation for almost all pairs. |

---

# Chapter 13: Unique Ergodicity

## Section 13.1: Motivation and Definition

The ergodic theorem guarantees that for a measure-preserving transformation \( T \) with invariant measure \( \mu \), time averages converge to space averages for \( \mu \)-almost every starting point. But what if we want convergence for *every* starting point, not just almost every one? This is possible when there is only one invariant measure — in that case the system is called uniquely ergodic, and the convergence in Birkhoff's theorem is automatically uniform over all starting points. Unique ergodicity is thus a strong rigidity property: the system has no hidden "complexity" coming from multiple invariant measures competing for different parts of the space. The irrational rotation is the canonical example, and the theory of unique ergodicity connects deeply to Weyl's equidistribution theorem, Fourier analysis on compact groups, and the theory of almost-periodic functions.

<div class="definition">
<strong>Definition (Unique Ergodicity)</strong>: A topological dynamical system \( (X, T) \) is <strong>uniquely ergodic</strong> if it admits exactly one \( T \)-invariant Borel probability measure \( \mu \). The measure \( \mu \) is then automatically ergodic (since it cannot be a non-trivial convex combination of two distinct invariant measures).
</div>

<div class="theorem">
<strong>Theorem (Oxtoby, 1952)</strong>: A compact topological dynamical system \( (X, T) \) is uniquely ergodic if and only if for every continuous function \( f \in C(X) \), the Birkhoff averages

\[
A_N f(x) = \frac{1}{N} \sum_{n=0}^{N-1} f(T^n x)
\]
converge <em>uniformly</em> in \( x \in X \) to a constant \( c_f = \int_X f \, d\mu \).
</div>

<div class="proof">
<em>Proof.</em> \( (\Rightarrow) \) Suppose \( (X, T) \) is uniquely ergodic with invariant measure \( \mu \). Suppose for contradiction that \( A_N f \) does not converge uniformly to \( \int f \, d\mu \). Then there exist \( \varepsilon > 0 \), a subsequence \( N_k \to \infty \), and points \( x_k \in X \) with \( |A_{N_k} f(x_k) - \int f \, d\mu| \geq \varepsilon \). The measures \( \frac{1}{N_k}\sum_{n=0}^{N_k-1} \delta_{T^n x_k} \) form a sequence in the compact space \( \mathcal{M}(X) \); passing to a subsequence, they converge weak-* to some \( T \)-invariant measure \( \nu \). Then \( \int f \, d\nu = \lim_k A_{N_k} f(x_k) \neq \int f \, d\mu \), contradicting unique ergodicity. \( (\Leftarrow) \) If uniform convergence holds, then any \( T \)-invariant measure \( \nu \) satisfies \( \int f \, d\nu = \lim_N \int A_N f \, d\nu = c_f = \int f \, d\mu \) for all \( f \in C(X) \), so \( \nu = \mu \). \( \square \)
</div>

## Section 13.2: Worked Examples

<div class="example">
<strong>Example (Irrational Rotation is Uniquely Ergodic).</strong> Let \( T(x) = x + \alpha \pmod{1} \) on \( \mathbb{T} \) with \( \alpha \notin \mathbb{Q} \). We claim the unique \( T \)-invariant Borel probability measure is Lebesgue measure \( \lambda \).

<em>Step 1: Lebesgue measure is invariant.</em> \( \lambda(T^{-1}[a,b]) = \lambda([a - \alpha, b - \alpha]) = b - a = \lambda([a,b]) \). So \( \lambda \) is \( T \)-invariant.

<em>Step 2: Uniqueness via Fourier analysis.</em> Let \( \nu \) be any \( T \)-invariant Borel probability measure. We compute its Fourier coefficients \( \hat{\nu}(k) = \int_{\mathbb{T}} e^{2\pi i k x} \, d\nu(x) \) for \( k \in \mathbb{Z} \). Invariance of \( \nu \) under \( T \) gives

\[
\hat{\nu}(k) = \int e^{2\pi i k x} \, d\nu(x) = \int e^{2\pi i k T(x)} \, d\nu(x) = \int e^{2\pi i k(x + \alpha)} \, d\nu(x) = e^{2\pi i k \alpha} \hat{\nu}(k).
\]
So \( \hat{\nu}(k)(1 - e^{2\pi i k \alpha}) = 0 \). Since \( \alpha \notin \mathbb{Q} \), we have \( e^{2\pi i k \alpha} \neq 1 \) for all \( k \neq 0 \), so \( \hat{\nu}(k) = 0 \) for all \( k \neq 0 \). The Fourier coefficients determine the measure: a measure on \( \mathbb{T} \) with all Fourier coefficients 0 except at \( k = 0 \) (where \( \hat{\nu}(0) = 1 \)) must be Lebesgue measure. Hence \( \nu = \lambda \). \( \square \)

<em>Consequence:</em> By Oxtoby's theorem, for every continuous \( f : \mathbb{T} \to \mathbb{R} \) and every \( x \in \mathbb{T} \),

\[
\frac{1}{N}\sum_{n=0}^{N-1} f(x + n\alpha) \xrightarrow{N \to \infty} \int_0^1 f(t) \, dt
\]
uniformly in \( x \). This is precisely Weyl's equidistribution theorem.
</div>

<div class="example">
<strong>Example (Doubling Map is Not Uniquely Ergodic).</strong> Let \( T(x) = 2x \pmod{1} \) on \( [0,1) \). The doubling map has many invariant measures:
<ul>
<li>Lebesgue measure \( \lambda \) (ergodic with entropy \( \log 2 \)).
<li>The Dirac mass \( \delta_0 \) at the fixed point 0.
<li>Any convex combination \( \alpha \lambda + (1-\alpha)\delta_0 \) for \( \alpha \in [0,1] \) — but only the extreme points are ergodic.
<li>More generally, for any \( p/q \) (periodic point of period \( k \)), the uniform measure on \( \{p/q, T(p/q), \ldots, T^{k-1}(p/q)\} \) is \( T \)-invariant and ergodic.
</ul>
The existence of multiple ergodic measures shows the doubling map is not uniquely ergodic. The Birkhoff averages converge to different limits depending on the starting point: starting at \( x = 0 \), the average of any \( f \) converges to \( f(0) \); starting at a Lebesgue-typical point, it converges to \( \int f \, d\lambda \). The non-uniformity of convergence is the signature of non-unique ergodicity.
</div>

<div class="example">
<strong>Example (Furstenberg Skew Product — Uniquely Ergodic but Not Rotation).</strong> Consider the skew product on \( \mathbb{T}^2 \):

\[
T(x, y) = (x + \alpha, y + x) \pmod{1}
\]
with \( \alpha \notin \mathbb{Q} \). This is a 2-step nilrotation. We claim \( T \) is uniquely ergodic with invariant measure \( \lambda \otimes \lambda \) (Lebesgue on \( \mathbb{T}^2 \)).

To verify invariance: \( \lambda \otimes \lambda(T^{-1}(A \times B)) = \lambda \otimes \lambda(\{(x,y) : x + \alpha \in A, y + x \in B\}) \). Since \( T \) is a measure-preserving homeomorphism of \( \mathbb{T}^2 \) (it has Jacobian 1 as an affine map), Lebesgue measure is preserved.

To prove uniqueness, one uses Fourier analysis on \( \mathbb{T}^2 \). If \( \nu \) is \( T \)-invariant, write \( \hat\nu(m, n) = \int e^{2\pi i(mx + ny)} \, d\nu \). Invariance gives \( \hat\nu(m, n) = e^{2\pi im\alpha} \hat\nu(m, n + m) \). For \( m \neq 0 \), this recursion with the irrational rotation of the \( n \)-index forces \( \hat\nu(m, n) = 0 \) for all \( n \). For \( m = 0 \), one shows \( \hat\nu(0, n) = 0 \) for \( n \neq 0 \) by the irrational rotation argument in \( y \). Hence \( \nu = \lambda \otimes \lambda \).
</div>

<div class="remark">
<strong>Remark (Unique Ergodicity and Minimality).</strong> Unique ergodicity and minimality are independent properties: a system can be minimal without being uniquely ergodic (Furstenberg constructed such examples in 1961, minimal subshifts with multiple invariant measures), and uniquely ergodic without being minimal (e.g., if the unique invariant measure is supported on a proper invariant subset). For the irrational rotation, both properties hold. The two properties together — minimal and uniquely ergodic — form a very strong structural assumption; such systems are called *strictly ergodic*.
</div>

---

# Chapter 14: The Furstenberg–Zimmer Structure Theory

## Section 14.1: Overview

The Furstenberg–Zimmer structure theory is the measure-theoretic analog of the Furstenberg structure theorem for distal flows (Chapter 5). It provides a canonical decomposition of any measure-preserving system into a transfinite tower of extensions, alternating between compact (isometric) extensions and weakly mixing extensions. This structure is the key tool in Furstenberg's proof of the multiple recurrence theorem and, in the refined form due to Host–Kra and Ziegler, in identifying the characteristic factors for polynomial and multilinear ergodic averages. Understanding the structure theory means understanding *why* systems recur: compact extensions contribute the "almost periodic" component of the dynamics, while weakly mixing extensions contribute the "chaotic" component that averages away.

<div class="definition">
<strong>Definition (Extension of Measure-Preserving Systems)</strong>: A <strong>factor map</strong> between pmp systems \( (X, \mu, T) \) and \( (Y, \nu, S) \) is a measurable surjection \( \pi : X \to Y \) with \( \pi_* \mu = \nu \) and \( \pi \circ T = S \circ \pi \) a.e. We say \( (X, \mu, T) \) is an <strong>extension</strong> of \( (Y, \nu, S) \) and \( (Y, \nu, S) \) is a <strong>factor</strong> of \( (X, \mu, T) \).
</div>

<div class="definition">
<strong>Definition (Compact Extension)</strong>: An extension \( \pi : (X, \mu, T) \to (Y, \nu, S) \) is a <strong>compact extension</strong> (or <strong>isometric extension</strong>) if there exists a compact group \( K \) with Haar measure \( m_K \), a measurable cocycle \( \rho : Y \to K \), and a measure-preserving isomorphism \( \phi : X \to Y \times_\rho K \) (a skew product) such that the action on the fiber is by rotation. Equivalently: the functions in \( L^2(X, \mu) \) that are "almost periodic relative to \( Y \)" (i.e., whose orbit under \( U_T \) is precompact in \( L^2(X|Y) \)) span all of \( L^2(X, \mu) \).
</div>

<div class="definition">
<strong>Definition (Weakly Mixing Extension)</strong>: An extension \( \pi : (X, \mu, T) \to (Y, \nu, S) \) is <strong>relatively weakly mixing</strong> if the system \( (X \times_Y X, \mu \times_\nu \mu, T \times T) \) — the fiber product — is ergodic over \( Y \). Equivalently: there are no non-trivial compact sub-extensions between \( X \) and \( Y \).
</div>

## Section 14.2: The Structure Theorem

<div class="theorem">
<strong>Theorem (Furstenberg–Zimmer Structure Theorem, 1976–1978)</strong>: Every ergodic pmp \( \mathbb{Z} \)-system \( (X, \mu, T) \) has a canonical tower of factors

\[
X = X_\infty \to \cdots \to X_{\alpha+1} \to X_\alpha \to \cdots \to X_1 \to X_0 = \{*\}
\]
indexed by ordinals, where:
<ul>
<li>Each extension \( X_{\alpha+1} \to X_\alpha \) is either a compact (isometric) extension or a relatively weakly mixing extension;
<li>At limit ordinals \( \lambda \), \( X_\lambda = \varprojlim_{\alpha < \lambda} X_\alpha \);
<li>The tower terminates at \( X_\infty \) (which is an inverse limit that equals \( X \) in the relevant \( L^2 \)-sense).
</ul>
</div>

<div class="remark">
<strong>Remark (Comparison with Topological Structure Theory).</strong> The Furstenberg–Zimmer theorem is the precise measure-theoretic parallel of the Furstenberg structure theorem for minimal distal flows (Chapter 5). Both say: any system in the relevant category (minimal distal / ergodic measure-preserving) is built from compact (equicontinuous / isometric) pieces by iterated extensions. The key difference is that in the measure-theoretic setting, one also allows weakly mixing extensions (which have no topological analog in the distal case). Weakly mixing extensions contribute factors where the fiber dynamics is "random" relative to the base; these contribute nothing to multiple recurrence averages because they average away by the van der Corput lemma.
</div>

## Section 14.3: Characteristic Factors

The Furstenberg–Zimmer tower leads to the concept of *characteristic factors* for multiple ergodic averages. For the averages

\[
\frac{1}{N}\sum_{n=0}^{N-1} f_1(T^n x) f_2(T^{2n} x) \cdots f_k(T^{kn} x),
\]
one wants to understand which part of the system controls the limit. The answer, identified by Host–Kra (2005) and Ziegler (2007), is the *\( (k-1) \)-step nilsystem factor*.

<div class="definition">
<strong>Definition (Nilsystem)</strong>: A <strong>\( k \)-step nilsystem</strong> is a dynamical system of the form \( (G/\Gamma, T_g) \) where \( G \) is a \( k \)-step nilpotent Lie group, \( \Gamma \leq G \) is a cocompact lattice, \( G/\Gamma \) is the associated nilmanifold, and \( T_g : x\Gamma \mapsto gx\Gamma \) is the left rotation by a fixed element \( g \in G \).
</div>

The simplest nontrivial nilsystem is the 2-step case. Take \( G \) to be the Heisenberg group

\[
G = \left\{ \begin{pmatrix} 1 & a & c \\ 0 & 1 & b \\ 0 & 0 & 1 \end{pmatrix} : a, b, c \in \mathbb{R} \right\}
\]
with \( \Gamma \) the subgroup of integer entries. The nilmanifold \( G/\Gamma \) is 3-dimensional, and the dynamics on it is a skew rotation generalizing the 2-torus skew product \( T(x,y) = (x + \alpha, y + x) \pmod{1} \).

<div class="theorem">
<strong>Theorem (Host–Kra, 2005)</strong>: Let \( (X, \mu, T) \) be an ergodic pmp system and \( f_1, \ldots, f_k \in L^\infty(X, \mu) \). Then

\[
\frac{1}{N}\sum_{n=0}^{N-1} f_1(T^n x) \cdots f_k(T^{kn} x)
\]
converges in \( L^2(\mu) \) as \( N \to \infty \). Moreover, the limit is unchanged if each \( f_j \) is replaced by its conditional expectation onto the \( (k-1) \)-step nilfactor \( \mathcal{Z}_{k-1} \). The nilfactors \( \mathcal{Z}_0 \subseteq \mathcal{Z}_1 \subseteq \cdots \) form an increasing sequence of factors: \( \mathcal{Z}_0 = \{*, X\} \) (trivial), \( \mathcal{Z}_1 = \) the Kronecker factor (the maximal equicontinuous factor), and \( \mathcal{Z}_{k-1} \) is the maximal \( (k-1) \)-step nilsystem factor.
</div>

<div class="example">
<strong>Example (Characteristic Factor for Double Averages).</strong> For the double average \( \frac{1}{N}\sum_{n=0}^{N-1} f(T^n x) g(T^{2n} x) \), the characteristic factor is \( \mathcal{Z}_1 \), the Kronecker factor — the maximal equicontinuous factor. This means:
<ul>
<li>If \( T \) is weakly mixing, then \( \mathcal{Z}_1 = \{*, X\} \) (trivial), and the limit is \( \int f \, d\mu \cdot \int g \, d\mu \).
<li>If \( T \) is an irrational rotation, then \( \mathcal{Z}_1 = T \) itself (the rotation is its own Kronecker factor), and the limit is computed from the eigenfunction structure.
<li>For a general ergodic \( T \), the limit is computed from the projection of \( f \) and \( g \) onto \( L^2(\mathcal{Z}_1) \).
</ul>
This explains the dichotomy in the double recurrence theorem: weakly mixing systems contribute trivially (the double average is just a product of integrals), while the "structured" part comes entirely from the compact equicontinuous factor.
</div>

<div class="remark">
<strong>Remark (Legacy: Gowers Norms and Higher-Order Fourier Analysis).</strong> The Host–Kra result and the theory of nilfactors has a parallel in combinatorics and analytic number theory: the *Gowers uniformity norms* \( \|f\|_{U^k} \), introduced by Gowers (2001) to give quantitative bounds in Szemerédi's theorem. A function \( f : \mathbb{Z}/N\mathbb{Z} \to \mathbb{C} \) has small \( U^k \)-norm if and only if it is "orthogonal to all \( (k-1) \)-step nilsequences." This is the quantitative version of the Host–Kra characteristic factor theorem, and connects the ergodic structure theory to Fourier-analytic methods in additive combinatorics. The Green–Tao–Ziegler inverse theorem for Gowers norms (proved 2012) confirms this connection rigorously.
</div>

---

# Chapter 15: Topological Entropy — Deeper Computations via Open Covers

## Section 15.1: The Open Cover Definition — Step-by-Step Computations

The open cover definition of topological entropy (Adler–Konheim–McAndrew, 1965) is the original formulation, and it is important to see it work in concrete examples. For the full shift and the irrational rotation, the definitions via separated sets gave clean answers; here we redo these computations using the open cover definition directly.

<div class="example">
<strong>Example (Full Shift: Open Cover Computation).</strong> Let \( \sigma : \{0,1\}^{\mathbb{Z}} \to \{0,1\}^{\mathbb{Z}} \) be the full 2-shift, and let \( \mathcal{U} = \{[0], [1]\} \) where \( [i] = \{x \in \{0,1\}^{\mathbb{Z}} : x_0 = i\} \) are the two cylinder sets of length 1.

<em>Step 1: Compute \( N(\mathcal{U}) \).</em> The cover \( \mathcal{U} \) consists of 2 open sets and already covers \( X = \{0,1\}^{\mathbb{Z}} \) (every point has \( x_0 = 0 \) or \( x_0 = 1 \)). So \( N(\mathcal{U}) = 2 \).

<em>Step 2: Compute the join \( \mathcal{U}^n = \mathcal{U} \vee \sigma^{-1}\mathcal{U} \vee \cdots \vee \sigma^{-(n-1)}\mathcal{U} \).</em> The sets in \( \mathcal{U} \) are the cylinders \( [i]_0 \) (determined by coordinate 0). The sets in \( \sigma^{-k}\mathcal{U} \) are \( \sigma^{-k}[i] = [i]_k \) (determined by coordinate \( k \)). The join consists of all intersections \( [i_0]_0 \cap [i_1]_1 \cap \cdots \cap [i_{n-1}]_{n-1} = [i_0 i_1 \cdots i_{n-1}] \) — the length-\( n \) cylinder sets. There are exactly \( 2^n \) such cylinders (one for each binary word of length \( n \)), and each is non-empty and open, and they cover \( X \). So \( N(\mathcal{U}^n) = 2^n \).

<em>Step 3: Compute \( h(\sigma, \mathcal{U}) \).</em>

\[
h(\sigma, \mathcal{U}) = \lim_{n \to \infty} \frac{1}{n} \log N(\mathcal{U}^n) = \lim_{n \to \infty} \frac{1}{n} \log 2^n = \log 2.
\]

<em>Step 4: Conclude \( h_{\mathrm{top}}(\sigma) = \log 2 \).</em> Since \( h_{\mathrm{top}}(\sigma) = \sup_{\mathcal{V}} h(\sigma, \mathcal{V}) \geq h(\sigma, \mathcal{U}) = \log 2 \), and one shows the upper bound \( h_{\mathrm{top}}(\sigma) \leq \log 2 \) by noting that any open cover of \( \{0,1\}^{\mathbb{Z}} \) has a refinement by cylinder sets, and the growth rate of cylinder sets is at most \( 2^n \). Hence \( h_{\mathrm{top}}(\sigma) = \log 2 \).
</div>

<div class="example">
<strong>Example (Irrational Rotation: Open Cover Computation).</strong> Let \( T(x) = x + \alpha \pmod{1} \) on \( \mathbb{T} \) with \( \alpha \notin \mathbb{Q} \), and let \( \mathcal{U} = \{U_1, U_2\} \) be any open cover of \( \mathbb{T} \) by two arcs (e.g., \( U_1 = (0, 3/4) \) and \( U_2 = (1/4, 1) \) with overlap on \( (1/4, 3/4) \)).

<em>Step 1: \( N(\mathcal{U}) = 2 \).</em> Two open arcs are needed to cover \( \mathbb{T} \) (neither alone covers it).

<em>Step 2: The join \( \mathcal{U}^n = \mathcal{U} \vee T^{-1}\mathcal{U} \vee \cdots \vee T^{-(n-1)}\mathcal{U} \).</em> The set \( T^{-k}U_i = \{x : T^k x \in U_i\} = U_i - k\alpha \pmod{1} \), a rotation of the arc \( U_i \) by \( -k\alpha \). Each such set is an arc of length equal to \( |U_i| \). The join \( \mathcal{U}^n \) consists of all intersections \( \bigcap_{k=0}^{n-1} T^{-k} V_k \) where \( V_k \in \{U_1, U_2\} \). 

<em>Step 3: Bounding \( N(\mathcal{U}^n) \).</em> Each set in \( \mathcal{U}^n \) is a connected arc (intersection of arcs on \( \mathbb{T} \)). The \( n \) arcs \( U_1, T^{-1}U_1, \ldots, T^{-(n-1)}U_1 \) have at most \( 2n \) endpoints total, which divide \( \mathbb{T} \) into at most \( 2n \) arcs. The atoms of \( \mathcal{U}^n \) are unions of these arcs, so \( N(\mathcal{U}^n) \leq 2n \).

<em>Step 4: Compute \( h(T, \mathcal{U}) \).</em>

\[
h(T, \mathcal{U}) = \lim_{n \to \infty} \frac{1}{n} \log N(\mathcal{U}^n) \leq \lim_{n \to \infty} \frac{1}{n} \log 2n = \lim_{n \to \infty} \frac{\log 2n}{n} = 0.
\]

<em>Step 5: Conclude.</em> Since this holds for any open cover \( \mathcal{U} \), \( h_{\mathrm{top}}(T) = \sup_{\mathcal{U}} h(T, \mathcal{U}) = 0 \).

The key geometric insight: the irrational rotation moves arcs rigidly (it is an isometry), so the join cover \( \mathcal{U}^n \) is determined by \( n \) arcs of fixed sizes, which can only subdivide \( \mathbb{T} \) into \( O(n) \) pieces — polynomial growth, not exponential.
</div>

<div class="remark">
<strong>Remark (Why Entropy Reflects Complexity).</strong> The contrast between the two computations above is illuminating. For the full shift, the join cover \( \mathcal{U}^n \) has \( 2^n \) atoms (exponential) because each application of \( \sigma \) reveals a new independent bit of information. For the irrational rotation, the join cover grows only polynomially (\( O(n) \) atoms) because rotation is an isometry — no new complexity is created as we look further along the orbit. This is why topological entropy is often described as measuring the "rate of information production" of a dynamical system. A system with positive entropy is constantly creating new distinguishable orbit segments; a system with zero entropy does not.
</div>

## Section 15.2: Entropy of Subshifts of Finite Type

A subshift of finite type (SFT) is defined by a finite alphabet and a set of forbidden words of length 2 (transitions). Its entropy can be computed exactly from the transition matrix.

<div class="example">
<strong>Example (Golden Mean Shift).</strong> The *golden mean shift* is the subshift of \( \{0,1\}^{\mathbb{Z}} \) defined by forbidding the word \( 11 \) (no two consecutive 1s). Its transition matrix is

\[
A = \begin{pmatrix} 1 & 1 \\ 1 & 0 \end{pmatrix}
\]
(the entry \( A_{ij} = 1 \) iff the transition \( i \to j \) is allowed). The number of admissible words of length \( n \) is \( \sum_{i,j} (A^n)_{ij} \). The characteristic polynomial of \( A \) is \( \lambda^2 - \lambda - 1 = 0 \), so the eigenvalues are \( \frac{1 \pm \sqrt{5}}{2} \). The spectral radius (Perron eigenvalue) is \( \phi = \frac{1+\sqrt{5}}{2} \approx 1.618 \) (the golden ratio).

By the Perron–Frobenius theorem, \( \sum_{i,j}(A^n)_{ij} \sim C \phi^n \) as \( n \to \infty \), so the number of admissible length-\( n \) words grows like \( \phi^n \). Therefore:

\[
h_{\mathrm{top}}(\sigma_A) = \lim_{n \to \infty} \frac{1}{n} \log (\text{number of length-}n\text{ words}) = \log \phi = \log\!\left(\frac{1+\sqrt{5}}{2}\right) \approx 0.481.
\]
This is strictly between 0 (zero entropy) and \( \log 2 \) (full shift entropy), reflecting the restriction imposed by forbidding \( 11 \).
</div>

---

# Chapter 16: The Koopman Operator and Spectral Theory in Depth

## Section 16.1: Eigenfunctions of the Koopman Operator for the Irrational Rotation

The spectral theory of the Koopman operator \( U_T \) on \( L^2(X, \mu) \) is one of the most powerful tools for understanding the dynamical properties of a measure-preserving system. For the irrational rotation, this spectral theory is completely explicit. We work it out in full detail here because it forms the backbone of the proofs of unique ergodicity, ergodicity, and the absence of mixing for this system.

<div class="example">
<strong>Example (Complete Spectral Analysis of the Irrational Rotation).</strong> Let \( T(x) = x + \alpha \pmod{1} \) on \( \mathbb{T} = [0,1) \) with \( \alpha \notin \mathbb{Q} \), and \( \mu = \lambda \) (Lebesgue). The Koopman operator is \( U_T f(x) = f(T(x)) = f(x + \alpha) \).

<em>Step 1: Identify the eigenfunctions.</em> We look for \( f \in L^2(\mathbb{T}) \) with \( U_T f = \lambda f \) for some \( \lambda \in \mathbb{C} \). The characters \( e_k(x) = e^{2\pi i k x} \) for \( k \in \mathbb{Z} \) form an orthonormal basis of \( L^2(\mathbb{T}) \). Compute:

\[
U_T e_k(x) = e_k(x + \alpha) = e^{2\pi i k(x + \alpha)} = e^{2\pi i k \alpha} e^{2\pi i kx} = e^{2\pi i k \alpha} \cdot e_k(x).
\]
So each \( e_k \) is an eigenfunction with eigenvalue \( \lambda_k = e^{2\pi i k \alpha} \).

<em>Step 2: All eigenvalues are distinct.</em> We claim \( \lambda_k \neq \lambda_j \) for \( k \neq j \). Indeed, \( \lambda_k = \lambda_j \iff e^{2\pi i(k-j)\alpha} = 1 \iff (k-j)\alpha \in \mathbb{Z} \). Since \( \alpha \notin \mathbb{Q} \) and \( k - j \in \mathbb{Z} \setminus \{0\} \), this is impossible. So all eigenvalues \( \{e^{2\pi i k\alpha} : k \in \mathbb{Z}\} \) are distinct.

<em>Step 3: The spectrum is pure point.</em> The characters \( \{e_k\}_{k \in \mathbb{Z}} \) form a complete orthonormal basis for \( L^2(\mathbb{T}) \), and each is an eigenfunction of \( U_T \). Therefore \( U_T \) has *pure point spectrum* — \( L^2(\mathbb{T}) \) is spanned by eigenfunctions.

<em>Step 4: Ergodicity from spectral theory.</em> The eigenvalue 1 corresponds to \( k = 0 \), with eigenfunction \( e_0 \equiv 1 \) (the constant function). Since \( \lambda_k = e^{2\pi ik\alpha} \neq 1 \) for \( k \neq 0 \), the eigenvalue 1 has multiplicity 1. By the spectral characterization (Section 9.2C), \( T \) is ergodic. \( \square \)

<em>Step 5: Non-mixing from spectral theory.</em> Strongly mixing would require \( \langle U_T^n f, g \rangle \to 0 \) for all \( f, g \in L^2_0 = L^2 \ominus \mathbb{C} \). But \( \langle U_T^n e_k, e_k \rangle = e^{2\pi i k n \alpha} \), and for \( k \neq 0 \) this does not converge to 0 (it is a sequence on the unit circle that is equidistributed but does not converge). So \( T \) is not strongly mixing. Similarly, since \( e_k \) (for \( k \neq 0 \)) are eigenfunctions with eigenvalues \( \neq 1 \), the system is not weakly mixing.
</div>

## Section 16.2: Spectral Types and the Classification Problem

<div class="definition">
<strong>Definition (Spectral Type)</strong>: Let \( (X, \mu, T) \) be a pmp system with Koopman operator \( U_T \) on \( L^2(X, \mu) \). The <strong>spectral type</strong> of \( T \) is the decomposition of the spectral measure of \( U_T|_{L^2_0} \) (restricted to the orthocomplement of constants) into pure point, singular continuous, and absolutely continuous parts.

We say \( T \) has:
<ul>
<li><strong>pure point spectrum</strong> if \( L^2_0 \) is spanned by eigenfunctions of \( U_T \);
<li><strong>absolutely continuous spectrum</strong> if the spectral measures of all \( f \in L^2_0 \) are absolutely continuous with respect to Lebesgue measure on \( \mathbb{T} \);
<li><strong>Lebesgue spectrum</strong> if \( L^2_0 \) decomposes as a countable direct sum of invariant subspaces on each of which \( U_T \) acts as the bilateral shift — the "most random" possible spectrum.
</ul>
</div>

<div class="example">
<strong>Example (Bernoulli Shift has Lebesgue Spectrum).</strong> The \( (1/2, 1/2) \)-Bernoulli shift \( \sigma \) on \( \{0,1\}^{\mathbb{Z}} \) with product measure has Lebesgue spectrum of countably infinite multiplicity. Intuitively: the "coordinate functions" \( f_k(x) = x_k \) (for \( k \in \mathbb{Z} \)) are all independent (under the product measure), and \( U_\sigma^n f_0(x) = x_n \). The subspaces generated by products of coordinate functions form a countably infinite family, each isomorphic to \( L^2(\mathbb{T}) \) with the shift, giving countably infinite Lebesgue spectrum. Lebesgue spectrum implies strongly mixing.
</div>

<div class="theorem">
<strong>Theorem (Spectral Hierarchy)</strong>: For ergodic pmp \( T \):

\[
\text{Lebesgue spectrum} \Rightarrow \text{absolutely continuous spectrum} \Rightarrow \text{weakly mixing} \Rightarrow \text{ergodic}.
\]

\[
\text{pure point spectrum} + \text{ergodic} \Leftrightarrow \text{rotation on compact abelian group}.
\]
Neither implication is reversible: there exist weakly mixing systems with singular continuous spectrum, strongly mixing systems without Lebesgue spectrum, and ergodic systems of every spectral type.
</div>

<div class="remark">
<strong>Remark (Spectral Theory and Isomorphism).</strong> The spectral type of \( U_T \) is an isomorphism invariant: if \( T \cong S \) (measure-theoretic isomorphism), then \( U_T \cong U_S \) (unitary equivalence). Thus spectral invariants can distinguish non-isomorphic systems. However, the spectral type is not a *complete* invariant for general ergodic systems (there exist non-isomorphic ergodic systems with the same spectral type). For systems with pure point spectrum, the Halmos–von Neumann theorem (Section 9.2D) shows that the eigenvalue group *is* a complete invariant. For Bernoulli systems, entropy is a complete invariant (Ornstein, Chapter 12). The general classification problem remains open.
</div>

---

# Chapter 17: Joinings and Disjointness

## Section 17.1: The Concept of Joining

Joinings, introduced by Furstenberg in 1967, provide a powerful framework for comparing and combining ergodic systems. A *joining* of two systems is a measure on their product space that is invariant under the product transformation and has the correct marginals. The existence of special joinings (e.g., off-diagonal joinings, graph joinings) reflects deep structural properties of the systems.

<div class="definition">
<strong>Definition (Joining)</strong>: Let \( (X, \mu, T) \) and \( (Y, \nu, S) \) be ergodic pmp systems. A <strong>joining</strong> of \( (X, \mu, T) \) and \( (Y, \nu, S) \) is a \( (T \times S) \)-invariant Borel probability measure \( \lambda \) on \( X \times Y \) with marginals \( \lambda(A \times Y) = \mu(A) \) and \( \lambda(X \times B) = \nu(B) \).
</div>

The product measure \( \mu \times \nu \) is always a joining (the "independent joining"). A joining is <strong>off-diagonal</strong> if \( \lambda \) is supported on the graph \( \{(x, \phi(x)) : x \in X\} \) of a measure-theoretic isomorphism \( \phi : X \to Y \); off-diagonal joinings exist if and only if the two systems are isomorphic.

<div class="definition">
<strong>Definition (Disjoint Systems)</strong>: Two ergodic pmp systems are <strong>disjoint</strong> (in the sense of Furstenberg) if their only joining is the product measure \( \mu \times \nu \).
</div>

<div class="theorem">
<strong>Theorem (Furstenberg Disjointness)</strong>: A weakly mixing system is disjoint from every ergodic system with pure point spectrum. More generally, a system with purely singular spectrum is disjoint from every system with absolutely continuous spectrum.
</div>

<div class="example">
<strong>Example (Disjointness of Irrational Rotation and Bernoulli Shift).</strong> The irrational rotation \( T_\alpha \) on \( \mathbb{T} \) has pure point spectrum (all eigenfunctions are characters). The \( (1/2,1/2)\)-Bernoulli shift \( \sigma \) is weakly mixing (pure continuous spectrum). By Furstenberg's disjointness theorem, the only joining of \( T_\alpha \) and \( \sigma \) is the product measure. Intuitively: the rotation has "predictable" long-term behavior (equidistributed, quasi-periodic), while the Bernoulli shift is "maximally random." There is no way to couple them non-trivially.
</div>

<div class="remark">
<strong>Remark (Joinings as a Classification Tool).</strong> The theory of joinings, developed extensively by Glasner, Rudolph, del Junco, and others, provides one of the most flexible frameworks for the classification of ergodic systems. A system is *prime* if its only factors are itself and the trivial system — equivalently, if any self-joining decomposes as a product or off-diagonal measure. Rudolph's two-fold mixing theorem and the theory of minimal self-joinings (due to del Junco, Rahe, and Swanson) show that "generic" ergodic systems have remarkable rigidity properties: their only self-joinings are off-diagonal, making their algebraic structure as simple as possible.
</div>

---

# Appendix E: Supplementary Problems

The following problems extend the material from Appendices A–D and the later chapters. They are intended for students who have completed the main problem set and wish to explore more advanced topics.

## Part E: Unique Ergodicity and Spectral Theory

**Problem E1 (Unique Ergodicity of Skew Products).** Let \( \alpha \notin \mathbb{Q} \) and \( f : \mathbb{T} \to \mathbb{T} \) be a measurable function. Consider the skew product \( T_{f} : \mathbb{T}^2 \to \mathbb{T}^2 \) given by \( T_f(x, y) = (x + \alpha, y + f(x)) \). Show that \( T_f \) preserves Lebesgue measure on \( \mathbb{T}^2 \). Then: (a) if \( f(x) = x \), show \( T_f \) is uniquely ergodic; (b) if \( f(x) = 0 \) (constant), show \( T_f \) is not ergodic (the measure decomposes over orbits of the \( y \)-coordinate rotation). (*Hint:* For (a), use the Fourier argument from Section 13.2.)

**Problem E2 (Eigenvalue Group of the 2-Torus Rotation).** Let \( T(x, y) = (x + \alpha, y + \beta) \) be a rotation on \( \mathbb{T}^2 \) with \( 1, \alpha, \beta \) rationally independent. (a) Find all eigenfunctions of the Koopman operator \( U_T \) on \( L^2(\mathbb{T}^2) \). (b) Compute the eigenvalue group \( \Lambda = \{e^{2\pi i(m\alpha + n\beta)} : m, n \in \mathbb{Z}\} \). (c) Show that \( T_\alpha \times T_\beta \) (product of two irrational rotations) is ergodic using the spectral characterization. (d) Is \( T \) isomorphic to \( T_\alpha \times T_\beta \)? Justify using the Halmos–von Neumann theorem.

**Problem E3 (Koopman Operator for the Doubling Map).** Let \( T(x) = 2x \pmod{1} \) on \( [0,1) \) with Lebesgue measure \( \lambda \). (a) Show that \( U_T e_k = e_{2k} \) where \( e_k(x) = e^{2\pi i kx} \). (b) Show that \( U_T \) has no eigenvalues except 0 (in \( L^2_0 \)). (*Hint:* If \( U_T f = \lambda f \) and \( f \in L^2_0 \), expand \( f = \sum \hat{f}(k) e_k \) and use \( U_T e_k = e_{2k} \) to derive a recursion on Fourier coefficients. Show the recursion forces all coefficients to vanish.) (c) Conclude that the doubling map is weakly mixing. (d) Is it strongly mixing?

**Problem E4 (Spectral Theory of the Cat Map).** Let \( A : \mathbb{T}^2 \to \mathbb{T}^2 \) be the Arnold cat map. (a) Show that the characters \( e_{(m,n)}(x,y) = e^{2\pi i(mx + ny)} \) for \( (m,n) \in \mathbb{Z}^2 \) are permuted by the Koopman operator: \( U_A e_{(m,n)} = e_{A^T(m,n)} \), where \( A^T \) is the transpose matrix acting on the dual lattice \( \mathbb{Z}^2 \). (b) The eigenvalues of \( U_A \) on the full \( L^2(\mathbb{T}^2) \) are those characters \( e_{(m,n)} \) that are fixed by \( A^T \): \( A^T(m,n) = (m,n) \). Show the only such vector is \( (0,0) \), so the only fixed function is the constant. Conclude \( A \) is ergodic. (c) Show the orbit of every non-trivial character under \( A^T \) is infinite (so \( U_A \) has no eigenvalues on \( L^2_0 \)), concluding \( A \) is weakly mixing.

**Problem E5 (Entropy from Spectral Theory — Variational Principle in Action).** Let \( T \) be an ergodic pmp transformation with a unique measure of maximal entropy \( \mu^* \). (a) Prove that \( \mu^* \) is ergodic. (*Hint:* If \( \mu^* = \frac{1}{2}\nu_1 + \frac{1}{2}\nu_2 \) with \( \nu_i \) ergodic invariant measures, show \( h_{\mu^*}(T) = \frac{1}{2}h_{\nu_1}(T) + \frac{1}{2}h_{\nu_2}(T) \leq \max(h_{\nu_i}(T)) \leq h_{\mathrm{top}}(T)\), with equality forcing \( \nu_1 = \nu_2 = \mu^* \).) (b) For the full 2-shift, verify that the uniform Bernoulli measure is ergodic and achieves the topological entropy \( \log 2 \). (c) For a general SFT with irreducible transition matrix \( A \), state (without proof) that the unique measure of maximal entropy is the Markov measure associated to the Perron eigenvectors of \( A \).

---

# Chapter 18: Recurrence Theorems — A Unified Perspective

## Section 18.1: Poincaré, Birkhoff, and Beyond

The various recurrence theorems in topological and measure-theoretic dynamics form a hierarchy of increasing strength. Understanding this hierarchy — and the relationships between its members — is a central goal of the course. This chapter synthesizes the results from earlier chapters into a unified picture, with emphasis on how each theorem strengthens the previous one and what new proof technique is required at each step.

The most basic recurrence theorem is **Birkhoff recurrence** (topological): every compact flow has a recurrent point. This requires no measure theory — only compactness and Zorn's lemma. One step up is **Poincaré recurrence** (measure-theoretic): any measure-preserving transformation of a probability space brings almost every point back to any positive-measure set infinitely often. This requires measure theory but no ergodicity. Then comes **ergodic recurrence**: for ergodic systems, the average return frequency to any positive-measure set equals the measure of that set (by the Birkhoff ergodic theorem). Finally, **multiple recurrence** (Furstenberg, 1977) says that for any pmp system and any positive-measure set, there exist simultaneous returns to all of \( B, T^{-n}B, \ldots, T^{-kn}B \) for some \( n \geq 1 \). This is the deepest, requiring the Furstenberg–Zimmer structure theory.

<div class="theorem">
<strong>Theorem (Recurrence Hierarchy Summary)</strong>: Let \( (X, \mu, T) \) be a pmp system and \( B \in \mathcal{B} \) with \( \mu(B) > 0 \). Then:
<ol>
<li><strong>Poincaré Recurrence:</strong> For a.e. \( x \in B \), there exist infinitely many \( n \geq 1 \) with \( T^n x \in B \).
<li><strong>Ergodic Quantification:</strong> If \( T \) is ergodic, then \( \frac{1}{N}\sum_{n=1}^N \mathbf{1}_B(T^n x) \to \mu(B) \) for a.e. \( x \).
<li><strong>Poincaré + Measure:</strong> \( \limsup_{N \to \infty} \frac{1}{N}\sum_{n=1}^N \mu(B \cap T^{-n}B) \geq \mu(B)^2 > 0 \).
<li><strong>Multiple Recurrence (Furstenberg):</strong> For every \( k \geq 1 \), \( \liminf_{N \to \infty} \frac{1}{N}\sum_{n=1}^N \mu(B \cap T^{-n}B \cap \cdots \cap T^{-kn}B) > 0 \).
</ol>
Each statement strictly implies the previous; the last is the hardest and implies Szemerédi's theorem.
</div>

## Section 18.2: The Van der Corput Lemma

The van der Corput lemma is a key analytic tool used in the proof of multiple recurrence and in the theory of equidistribution. It replaces "prove convergence of \( a_n \)" with "prove convergence of \( a_{n+h} \overline{a_n} \) on average," which is often easier.

<div class="theorem">
<strong>Lemma (Van der Corput)</strong>: Let \( (a_n)_{n \geq 1} \) be a bounded sequence in a Hilbert space \( H \). If for every \( h \geq 1 \),

\[
\limsup_{N \to \infty} \left\| \frac{1}{N}\sum_{n=1}^N a_{n+h} \cdot \overline{a_n} \right\|_H \to 0 \quad \text{as } h \to \infty
\]
(more precisely, if \( \lim_{H \to \infty} \frac{1}{H}\sum_{h=1}^H \limsup_{N} \left\|\frac{1}{N}\sum_n \langle a_{n+h}, a_n\rangle\right\| = 0 \)), then

\[
\frac{1}{N}\sum_{n=1}^N a_n \to 0.
\]
</div>

<div class="example">
<strong>Example (Applying Van der Corput to Weakly Mixing Systems).</strong> Let \( (X, \mu, T) \) be weakly mixing and \( f, g \in L^2_0 = L^2 \ominus \mathbb{C}\mathbf{1} \). We want to show

\[
\frac{1}{N}\sum_{n=0}^{N-1} \langle U_T^n f, g \rangle \to 0.
\]
Set \( a_n = U_T^n f \) (a sequence in \( L^2 \)). Then \( \langle a_{n+h}, a_n \rangle_{L^2} = \langle U_T^{n+h} f, U_T^n f \rangle = \langle U_T^h f, f \rangle \) (by unitarity). For weakly mixing \( T \), \( \frac{1}{N}\sum_n |\langle U_T^n f, f\rangle|^2 \to |\int f \, d\mu|^2 = 0 \) (since \( f \in L^2_0 \)). So \( \frac{1}{H}\sum_h |\langle U_T^h f, f\rangle| \to 0 \) by weak mixing. Van der Corput then gives \( \frac{1}{N}\sum_n \langle U_T^n f, g \rangle \to 0 \) as desired.
</div>

## Section 18.3: The Furstenberg–Sárközy Theorem

The Furstenberg–Sárközy theorem is the case \( k = 1 \) (single recurrence with polynomial returns) of the polynomial multiple recurrence theorem. It shows that any set of positive upper density contains two elements differing by a perfect square.

<div class="theorem">
<strong>Theorem (Furstenberg–Sárközy, 1977–1978)</strong>: Let \( A \subseteq \mathbb{N} \) with \( d^*(A) > 0 \). Then there exist \( a \in A \) and \( n \geq 1 \) with \( a + n^2 \in A \).
</div>

<div class="proof">
<em>Proof sketch via ergodic theory.</em> By the Furstenberg Correspondence Principle, produce \( (X, \mu, T) \) and \( B \) with \( \mu(B) \geq d^*(A) > 0 \). It suffices to show \( \limsup_N \frac{1}{N}\sum_{n=1}^N \mu(B \cap T^{-n^2}B) > 0 \).

The key is to analyze the averages \( \frac{1}{N}\sum_{n=1}^N U_T^{n^2} \mathbf{1}_B \) in \( L^2 \). Decompose \( L^2 = L^2_{pp} \oplus L^2_{wm} \) (pure point spectrum plus weakly mixing part). On the pure point spectrum part, each eigenfunction \( f \) with eigenvalue \( e^{2\pi i \lambda} \) contributes \( U_T^{n^2} f = e^{2\pi i \lambda n^2} f \). By Weyl's polynomial equidistribution theorem, the averages \( \frac{1}{N}\sum_{n=1}^N e^{2\pi i \lambda n^2} \to \int_0^1 e^{2\pi i t^2} \, dt \) ... but more precisely, one shows that

\[
\frac{1}{N}\sum_{n=1}^N \mu(B \cap T^{-n^2}B) \to \left\| \mathbb{E}[\mathbf{1}_B | \mathcal{Z}_1] \right\|_{L^2}^2 \geq \mu(B)^2 > 0,
\]
where \( \mathcal{Z}_1 \) is the Kronecker factor (the maximal equicontinuous factor). This uses the fact that on the weakly mixing part, the polynomial averages still go to 0 (by a variant of van der Corput for polynomial sequences), while on the Kronecker factor, the polynomial equidistribution gives the correct limit. Since \( \mu(B)^2 > 0 \), the limsup is positive, giving the desired \( n \). \( \square \)
</div>

<div class="remark">
<strong>Remark (Sárközy's Independent Proof).</strong> Endre Sárközy proved the same theorem independently using purely analytic methods (exponential sums and Fourier analysis on \( \mathbb{Z}/N\mathbb{Z} \)) at the same time as Furstenberg's ergodic proof. The analytic approach is quantitative (it gives bounds on how large \( n \) must be as a function of \( d^*(A) \) and the density), while the ergodic approach is qualitative but applies in much greater generality (to polynomial configurations of any kind). The synthesis of these two approaches, through the work of Gowers, Green–Tao, and Tao–Ziegler, is one of the most active areas of current research.
</div>

---

# Chapter 19: Subshifts, Complexity, and Topological Dynamics

## Section 19.1: Complexity Function of Subshifts

For a subshift \( (X, \sigma) \subseteq A^{\mathbb{Z}} \), the *complexity function* \( p_X(n) \) counts the number of distinct words of length \( n \) that appear in elements of \( X \). The complexity function is a combinatorial invariant that reflects the topological entropy and dynamical properties of the subshift.

<div class="definition">
<strong>Definition (Language and Complexity)</strong>: For a subshift \( X \subseteq A^{\mathbb{Z}} \), the <strong>language</strong> of \( X \) is \( \mathcal{L}(X) = \bigcup_{n \geq 1} \mathcal{L}_n(X) \), where \( \mathcal{L}_n(X) = \{x_0 x_1 \cdots x_{n-1} : x \in X\} \) is the set of words of length \( n \) appearing in \( X \). The <strong>complexity function</strong> is \( p(n) = |\mathcal{L}_n(X)| \).
</div>

<div class="theorem">
<strong>Theorem (Entropy via Complexity)</strong>: For a subshift \( (X, \sigma) \),

\[
h_{\mathrm{top}}(\sigma) = \lim_{n \to \infty} \frac{1}{n} \log p(n) = \inf_{n \geq 1} \frac{1}{n} \log p(n).
\]
The limit exists because \( \log p(n) \) is subadditive.
</div>

<div class="example">
<strong>Example (Sturmian Sequences have Minimal Complexity).</strong> A *Sturmian sequence* is a subshift of \( \{0,1\}^{\mathbb{Z}} \) that codes an irrational rotation: given \( \alpha \notin \mathbb{Q} \) and a partition of \( \mathbb{T} \) into \( [0, 1-\alpha) \cup [1-\alpha, 1) \), the sequence \( x_n = \lfloor (n+1)\alpha \rfloor - \lfloor n\alpha \rfloor \) is Sturmian.

The complexity function of a Sturmian sequence is \( p(n) = n + 1 \): there are exactly \( n + 1 \) distinct words of length \( n \). This is the *minimum possible complexity for an aperiodic sequence* — a theorem of Morse and Hedlund states that if \( p(n) \leq n \) for some \( n \), the sequence is eventually periodic. The entropy is \( \lim_{n} \frac{1}{n}\log(n+1) = 0 \), consistent with our earlier computation that irrational rotations have zero topological entropy.

The Sturmian system is minimal (it is the orbit closure of an irrational rotation coding) and uniquely ergodic (the unique invariant measure is the projection of Lebesgue measure under the coding). Sturmian sequences provide the canonical model of a zero-entropy minimal uniquely ergodic subshift with the simplest possible complexity.
</div>

<div class="example">
<strong>Example (Thue–Morse Sequence).</strong> The *Thue–Morse sequence* \( t = 0110100110010110\ldots \) is defined by \( t_n = (\text{number of 1s in the binary expansion of } n) \pmod 2 \). Equivalently, it is the fixed point of the substitution \( 0 \mapsto 01 \), \( 1 \mapsto 10 \).

The Thue–Morse subshift \( X_{TM} \subseteq \{0,1\}^{\mathbb{Z}} \) is minimal and uniquely ergodic (with invariant measure \( \nu_{TM} \), the Thue–Morse measure). Its complexity function satisfies \( p(n) = O(n^{1 + \varepsilon}) \) for any \( \varepsilon > 0 \) but grows faster than linearly, so \( h_{\mathrm{top}} = 0 \). The Koopman operator for \( (X_{TM}, \nu_{TM}, \sigma) \) has purely singular continuous spectrum — it is ergodic, not weakly mixing, and the spectrum is not pure point (unlike Sturmian systems). This makes the Thue–Morse system a model for the intermediate spectral type between pure point and absolutely continuous.
</div>

## Section 19.2: Substitution Dynamics

Substitution dynamical systems — generated by iterating a map \( \tau : A \to A^+ \) (sending each letter to a word) — are one of the richest sources of examples in topological dynamics and ergodic theory. They include Sturmian sequences, the Thue–Morse sequence, the Fibonacci sequence, and many others.

<div class="definition">
<strong>Definition (Substitution System)</strong>: A <strong>substitution</strong> on an alphabet \( A = \{0, 1, \ldots, k-1\} \) is a map \( \tau : A \to A^+ \) (non-empty finite words over \( A \)). The substitution is <strong>primitive</strong> if there exists \( N \) such that for every pair \( (a, b) \in A^2 \), the letter \( b \) appears in \( \tau^N(a) \). The <strong>substitution matrix</strong> \( M_\tau \) has entries \( (M_\tau)_{ab} = |\tau(b)|_a \) (number of occurrences of \( a \) in \( \tau(b) \)).
</div>

<div class="theorem">
<strong>Theorem (Ergodic Theory of Primitive Substitutions)</strong>: Let \( \tau \) be a primitive substitution on \( A \) with a fixed point \( x \in A^{\mathbb{Z}} \) (i.e., \( \tau(x) = x \)). Then:
<ol>
<li>The orbit closure \( X_\tau = \overline{\{\sigma^n x : n \in \mathbb{Z}\}} \) is a minimal, uniquely ergodic subshift (the <strong>substitution subshift</strong>).
<li>The unique invariant measure \( \mu_\tau \) is determined by the Perron eigenvector of the substitution matrix: the frequency of each letter \( a \in A \) in \( x \) is the \( a \)-component of the Perron eigenvector of \( M_\tau \), normalized.
<li>The topological entropy of \( (X_\tau, \sigma) \) is \( 0 \) (because the complexity function \( p(n) \) is at most polynomial in \( n \) for primitive substitutions of constant length, and at most exponential with exponent below 1 in general).
</ol>
</div>

<div class="example">
<strong>Example (Fibonacci Substitution).</strong> The Fibonacci substitution \( \tau : 0 \mapsto 01, 1 \mapsto 0 \) has substitution matrix \( M = \begin{pmatrix} 1 & 1 \\ 1 & 0 \end{pmatrix} \), with characteristic polynomial \( \lambda^2 - \lambda - 1 = 0 \) and Perron eigenvalue \( \phi = \frac{1+\sqrt{5}}{2} \) (the golden ratio). The Perron eigenvector is \( (1/\phi, 1/\phi^2) \) (normalized), so the frequency of the letter 0 is \( 1/\phi = \phi - 1 \approx 0.618 \) and the frequency of 1 is \( 1/\phi^2 \approx 0.382 \).

The Fibonacci subshift is isomorphic (as a measure-preserving system) to the irrational rotation \( T_{1/\phi} \) on \( \mathbb{T} \) (with angle \( 1/\phi = \phi - 1 \)): this is because the Fibonacci sequence codes the irrational rotation of angle \( 1/\phi \), and the two systems have the same spectral properties (pure point spectrum with eigenvalue group generated by \( e^{2\pi i/\phi} \)).
</div>

---

# Appendix F: Key Formulas and Computational Reference

The following reference compiles the most important formulas and computational results from the course, organized for quick access.

## F.1: Entropy Formulas

| System | Topological Entropy | Metric Entropy (Lebesgue) |
|--------|--------------------|-----------------------------|
| Irrational rotation \( T_\alpha \) on \( \mathbb{T} \) | \( 0 \) | \( 0 \) |
| Doubling map \( T(x) = 2x \pmod{1} \) | \( \log 2 \) | \( \log 2 \) |
| Full \( k \)-shift \( \sigma \) on \( A^{\mathbb{Z}} \), \( \vert A\vert = k \) | \( \log k \) | \( \log k \) (uniform) |
| Bernoulli shift \( (p_0, \ldots, p_{k-1}) \) | \( \log k \) (for uniform) | \( -\sum p_i \log p_i \) |
| Arnold cat map \( A = \begin{pmatrix}2&1\\1&1\end{pmatrix} \) | \( \log\frac{3+\sqrt{5}}{2} \) | \( \log\frac{3+\sqrt{5}}{2} \) |
| Golden mean shift | \( \log \phi \) (\( \phi = \frac{1+\sqrt{5}}{2} \)) | \( = h_{\mathrm{top}} \) (Markov) |
| SFT with matrix \( A \) | \( \log \rho(A) \) | \( = h_{\mathrm{top}} \) (Markov) |
| Sturmian subshift | \( 0 \) | \( 0 \) |
| Thue–Morse subshift | \( 0 \) | \( 0 \) |

(\( \rho(A) \) = spectral radius of the transition matrix \( A \).)

## F.2: Spectral Properties of Key Systems

| System | Ergodic? | Weakly Mixing? | Strongly Mixing? | Spectral Type |
|--------|----------|----------------|------------------|---------------|
| Irrational rotation \( T_\alpha \) | Yes | No | No | Pure point |
| Rational rotation \( T_{p/q} \) | No (unless \( X = \{0\} \)) | No | No | Pure point (periodic) |
| Doubling map | Yes | Yes | Yes | Lebesgue (abs. cont.) |
| Bernoulli shift | Yes | Yes | Yes | Lebesgue, mult. \( \infty \) |
| Arnold cat map | Yes | Yes | Yes | Lebesgue, mult. \( \infty \) |
| Sturmian (irrational rotation code) | Yes | No | No | Pure point |
| Thue–Morse system | Yes | No | No | Singular continuous |
| Generic (Baire typical) pmp | Yes | Yes | No | Singular |

## F.3: Birkhoff Averages — What They Converge To

For a pmp system \( (X, \mu, T) \) and \( f \in L^1(X, \mu) \):

\[
\frac{1}{N}\sum_{n=0}^{N-1} f(T^n x) \xrightarrow{\text{a.e. and }L^1} \mathbb{E}[f \mid \mathcal{I}](x),
\]

where \( \mathcal{I} = \{A : T^{-1}A = A \text{ a.e.}\} \) is the invariant \( \sigma \)-algebra. Special cases:

- **Ergodic \( T \):** \( \mathcal{I} \) is trivial, so \( \mathbb{E}[f|\mathcal{I}] = \int f \, d\mu \) (constant). The time average equals the space average a.e.
- **Identity \( T = \mathrm{id} \):** \( \mathcal{I} = \mathcal{B} \) (the full \( \sigma \)-algebra), so \( \mathbb{E}[f|\mathcal{I}] = f \). The time average is the function itself.
- **Irrational rotation (unique ergodicity):** Convergence holds for *every* \( x \), uniformly, and the limit is \( \int f \, d\lambda \) (Oxtoby's theorem).
- **Strongly mixing \( T \):** Not only do time averages converge, but \( \mu(T^{-n}A \cap B) \to \mu(A)\mu(B) \) for all measurable \( A, B \).

## F.4: Furstenberg Correspondence — Summary Table

| Combinatorial Property of \( A \subseteq \mathbb{Z} \) | Dynamical Equivalent in \( (X, \mu, T, B) \) |
|---------------------------------------------------------|-----------------------------------------------|
| \( d^*(A) > 0 \) | \( \mu(B) > 0 \) |
| \( A \) contains \( \{a, a+n\} \) for some \( n \geq 1 \) | \( \mu(B \cap T^{-n}B) > 0 \) for some \( n \) (Poincaré) |
| \( A \) contains 3-term AP \( \{a, a+n, a+2n\} \) | \( \mu(B \cap T^{-n}B \cap T^{-2n}B) > 0 \) |
| \( A \) contains \( k \)-term AP | \( \mu(B \cap T^{-n}B \cap \cdots \cap T^{-kn}B) > 0 \) |
| \( A \) contains \( \{a, a+n^2\} \) (Sárközy) | \( \mu(B \cap T^{-n^2}B) > 0 \) (polynomial recurrence) |
| \( A \) contains all finite configurations (Furstenberg–Katznelson) | Multiple recurrence for \( \mathbb{Z}^d \)-systems |

---

# Appendix G: Glossary of Key Terms

**Aperiodic (transformation):** A pmp transformation \( T \) such that \( \mu(\{x : T^k x = x\}) = 0 \) for all \( k \geq 1 \). Equivalently, almost every orbit is infinite.

**Birkhoff ergodic theorem:** For a pmp transformation \( T \) and \( f \in L^1(\mu) \), the time averages \( \frac{1}{N}\sum_{n=0}^{N-1} f(T^n x) \) converge a.e. to the conditional expectation \( \mathbb{E}[f|\mathcal{I}] \), where \( \mathcal{I} \) is the invariant \( \sigma \)-algebra.

**Central set:** A subset \( A \subseteq \mathbb{N} \) that belongs to some minimal idempotent ultrafilter in \( \beta\mathbb{N} \). Every central set is an IP set; central sets are piecewise syndetic.

**Complexity function:** For a subshift \( X \subseteq A^{\mathbb{Z}} \), the function \( p(n) = |\mathcal{L}_n(X)| \) counting distinct words of length \( n \) in \( X \). The entropy is \( \lim \frac{1}{n}\log p(n) \).

**Distal (flow/pair):** A flow \( (X, G) \) is distal if no two distinct points are proximal: \( \inf_g d(gx, gy) > 0 \) for all \( x \neq y \). The flow is distal iff every element of the Ellis semigroup \( E(X) \) is a bijection.

**Ellis semigroup:** For a flow \( (X, G) \), the closure \( E(X) \) of \( \{x \mapsto gx : g \in G\} \) in \( X^X \) (product topology), with the semigroup operation of composition. It is a compact right-topological semigroup.

**Entropy (topological):** \( h_{\mathrm{top}}(T) = \sup_{\mathcal{U}} \lim_{n\to\infty} \frac{1}{n}\log N(\mathcal{U}^n) \), where \( N(\mathcal{U}^n) \) is the minimum cover size of the \( n \)-fold join.

**Entropy (metric/KS):** \( h_\mu(T) = \sup_\xi \lim_{n\to\infty} \frac{1}{n} H(\bigvee_{k=0}^{n-1} T^{-k}\xi) \), where the sup is over finite partitions and \( H(\xi) = -\sum \mu(A_i)\log\mu(A_i) \) is Shannon entropy.

**Equicontinuous (flow):** A flow \( (X, G) \) where the family \( \{x \mapsto gx : g \in G\} \) is equicontinuous — for every \( \varepsilon > 0 \) there is \( \delta > 0 \) such that \( d(x, y) < \delta \Rightarrow d(gx, gy) < \varepsilon \) for all \( g \in G \).

**Ergodic (transformation):** A pmp transformation \( T : (X, \mu) \to (X, \mu) \) such that every \( T \)-invariant measurable set has measure 0 or 1. Equivalently, the only \( T \)-invariant \( L^2 \) functions are constants (spectral characterization).

**Furstenberg correspondence principle:** A dictionary between density results in additive combinatorics and recurrence results in ergodic theory. Given \( A \subseteq \mathbb{Z} \) with \( d^*(A) > 0 \), there exists a pmp system \( (X, \mu, T) \) and \( B \) with \( \mu(B) \geq d^*(A) \) such that density of combinatorial configurations in \( A \) is lower-bounded by measure of corresponding dynamical configurations in \( B \).

**IP set:** A set containing the set of all finite sums \( \mathrm{FS}(x_1, x_2, \ldots) = \{\sum_{n \in F} x_n : F \text{ finite}\} \) for some sequence \( (x_n) \). An IP\(^*\) set intersects every IP set.

**Joining:** For two pmp systems \( (X, \mu, T) \) and \( (Y, \nu, S) \), a \( (T \times S) \)-invariant measure on \( X \times Y \) with the correct marginals. The independent joining is \( \mu \times \nu \).

**Koopman operator:** \( U_T : L^2(X, \mu) \to L^2(X, \mu) \), \( U_T f = f \circ T \). Unitary when \( T \) is measure-preserving. Encodes all spectral information about \( T \).

**Minimal (flow):** A \( G \)-flow with no proper closed invariant subsets; equivalently, every orbit is dense.

**Nilsystem:** A measure-preserving system of the form \( (G/\Gamma, m, T_g) \) where \( G \) is a nilpotent Lie group, \( \Gamma \leq G \) is a cocompact lattice, \( m \) is the Haar measure on \( G/\Gamma \), and \( T_g \) is left rotation by \( g \in G \). The characteristic factor for \( k \)-term multiple ergodic averages is a \( (k-1) \)-step nilsystem.

**Proximal (flow/pair):** A pair \( (x, y) \) in a flow is proximal if \( \inf_g d(gx, gy) = 0 \). A flow is proximal if every pair is proximal.

**Strongly mixing:** \( \mu(T^{-n}A \cap B) \to \mu(A)\mu(B) \) for all measurable \( A, B \). Equivalent to \( U_T^n \to 0 \) weakly on \( L^2_0 \).

**Syndetic:** A set \( A \subseteq \mathbb{Z} \) with bounded gaps: there is a finite set \( K \) with \( A \cap (n + K) \neq \emptyset \) for all \( n \).

**Unique ergodicity:** A topological system \( (X, T) \) with exactly one \( T \)-invariant Borel probability measure. Equivalent (by Oxtoby) to uniform convergence of Birkhoff averages for all continuous functions.

**Variational principle:** For a compact metrizable dynamical system \( (X, T) \):

\[
h_{\mathrm{top}}(T) = \sup\{ h_\mu(T) : \mu \text{ is } T\text{-invariant Borel probability}\}.
\]

**Weakly mixing:** \( \frac{1}{N}\sum_{n=0}^{N-1}|\mu(T^{-n}A \cap B) - \mu(A)\mu(B)| \to 0 \) for all measurable \( A, B \). Equivalent to \( U_T \) having no eigenvalues on \( L^2_0 \) (pure continuous spectrum).

---

# Appendix H: Extended Proof Gallery

This appendix collects full detailed proofs of selected results that are central to the course but whose proofs were only sketched in the main text. The goal is to give the reader a complete argument to study, illustrate proof techniques, and provide a model for how these theorems fit together.

## H.1: Full Proof of the Mean Ergodic Theorem

We give a self-contained proof of von Neumann's mean ergodic theorem, including the key spectral decomposition step.

<div class="theorem">
<strong>Theorem (von Neumann Mean Ergodic Theorem, 1932).</strong> Let \( U \) be a unitary operator on a Hilbert space \( H \). For every \( f \in H \),

\[
\frac{1}{N}\sum_{n=0}^{N-1} U^n f \to Pf \quad \text{in } H \text{ norm},
\]
where \( P \) is the orthogonal projection onto \( \mathrm{Fix}(U) = \{h \in H : Uh = h\} \).
</div>

<div class="proof">
<em>Proof.</em> We use the spectral decomposition \( H = \mathrm{Fix}(U) \oplus \overline{\mathrm{ran}(I - U)} \).

<em>Step 1: The decomposition is orthogonal.</em> We claim \( \mathrm{Fix}(U) \perp \mathrm{ran}(I - U) \). If \( Uf = f \) and \( g \in H \), then \( \langle f, g - Ug \rangle = \langle f, g \rangle - \langle f, Ug \rangle = \langle f, g \rangle - \langle U^*f, g \rangle = \langle f, g \rangle - \langle U^{-1}f, g \rangle = \langle f, g \rangle - \langle f, g \rangle = 0 \), using \( U^* = U^{-1} \) (unitarity) and \( U^{-1}f = f \). So \( \mathrm{Fix}(U) \perp \mathrm{ran}(I-U) \), and by taking closures, \( \mathrm{Fix}(U) \perp \overline{\mathrm{ran}(I-U)} \).

<em>Step 2: The decomposition is complete.</em> We need \( H = \mathrm{Fix}(U) \oplus \overline{\mathrm{ran}(I-U)} \). By the orthogonal decomposition theorem, it suffices to show \( \mathrm{Fix}(U)^\perp = \overline{\mathrm{ran}(I-U)} \). The inclusion \( \overline{\mathrm{ran}(I-U)} \subseteq \mathrm{Fix}(U)^\perp \) follows from Step 1. For the other direction: if \( f \perp \mathrm{ran}(I-U) \), then \( 0 = \langle f, g - Ug \rangle = \langle f, g \rangle - \langle f, Ug \rangle = \langle f, g \rangle - \langle U^{-1}f, g \rangle \) for all \( g \in H \), giving \( U^{-1}f = f \), i.e., \( Uf = f \in \mathrm{Fix}(U) \).

<em>Step 3: Averages converge on each summand.</em> 
- If \( f \in \mathrm{Fix}(U) \): \( \frac{1}{N}\sum_{n=0}^{N-1}U^n f = \frac{1}{N}\sum_{n=0}^{N-1} f = f = Pf \). Convergence is trivial.
- If \( f = g - Ug \in \mathrm{ran}(I - U) \): \( \sum_{n=0}^{N-1} U^n f = \sum_{n=0}^{N-1}(U^n g - U^{n+1}g) = g - U^N g \). So \( \left\|\frac{1}{N}\sum_{n=0}^{N-1}U^n f\right\| = \frac{1}{N}\|g - U^N g\| \leq \frac{2\|g\|}{N} \to 0 \). So \( \frac{1}{N}\sum_{n=0}^{N-1}U^n f \to 0 = Pf \) (since \( f \perp \mathrm{Fix}(U) \) means \( Pf = 0 \)).
- For \( f \in \overline{\mathrm{ran}(I-U)} \): Approximate by \( f_k \in \mathrm{ran}(I-U) \) with \( \|f - f_k\| < \varepsilon \). Then \( \left\|\frac{1}{N}\sum U^n f - 0\right\| \leq \left\|\frac{1}{N}\sum U^n(f - f_k)\right\| + \left\|\frac{1}{N}\sum U^n f_k\right\| \leq \|f - f_k\| + \frac{2\|g_k\|}{N} < \varepsilon + \frac{2\|g_k\|}{N} \).
  For large \( N \), this is \( < 2\varepsilon \). Since \( \varepsilon \) is arbitrary, \( \frac{1}{N}\sum U^n f \to 0 = Pf \).

<em>Step 4: General \( f \).</em> Decompose \( f = f_1 + f_2 \) with \( f_1 \in \mathrm{Fix}(U) \) and \( f_2 \in \overline{\mathrm{ran}(I-U)} \). Then \( \frac{1}{N}\sum U^n f = \frac{1}{N}\sum U^n f_1 + \frac{1}{N}\sum U^n f_2 \to f_1 + 0 = Pf \). \( \square \)
</div>

## H.2: Full Proof of Poincaré Recurrence with Quantitative Bound

<div class="theorem">
<strong>Theorem (Quantitative Poincaré Recurrence).</strong> Let \( (X, \mu, T) \) be a pmp system and \( B \in \mathcal{B} \) with \( \mu(B) > 0 \). Then:

\[
\limsup_{N \to \infty} \frac{1}{N}\sum_{n=1}^{N} \mu(B \cap T^{-n}B) \geq \mu(B)^2.
\]
In particular, there exist infinitely many \( n \geq 1 \) with \( \mu(B \cap T^{-n}B) > 0 \), and for any such \( n \), the set \( B \cap T^{-n}B \) has positive measure.
</div>

<div class="proof">
<em>Proof via the mean ergodic theorem.</em> Let \( f = \mathbf{1}_B \in L^2(X, \mu) \). Define the Cesàro averages \( A_N f = \frac{1}{N}\sum_{n=0}^{N-1} U_T^n f \). By the mean ergodic theorem, \( A_N f \to Pf \) in \( L^2 \), where \( P \) projects onto \( \mathrm{Fix}(U_T) \).

Now compute:

\[
\frac{1}{N}\sum_{n=0}^{N-1}\mu(B \cap T^{-n}B) = \frac{1}{N}\sum_{n=0}^{N-1} \langle U_T^n f, f \rangle_{L^2} = \langle A_N f, f \rangle_{L^2} \to \langle Pf, f \rangle_{L^2} = \|Pf\|_{L^2}^2.
\]
(The limit uses \( A_N f \to Pf \) in \( L^2 \) and \( f \in L^2 \), so the inner product converges.) Since \( P \) is an orthogonal projection, \( \|Pf\|^2 \geq |\langle Pf, \mathbf{1}\rangle|^2 / \|\mathbf{1}\|^2 = |\int f \, d\mu|^2 = \mu(B)^2 > 0 \) (by Cauchy–Schwarz applied to \( \mathbf{1} \in \mathrm{Fix}(U_T) \), which is in the range of \( P \)). So

\[
\lim_{N \to \infty} \frac{1}{N}\sum_{n=0}^{N-1}\mu(B \cap T^{-n}B) = \|Pf\|^2 \geq \mu(B)^2 > 0.
\]
This means the Cesàro average of \( \mu(B \cap T^{-n}B) \) converges to a positive number, so \( \mu(B \cap T^{-n}B) > 0 \) for infinitely many \( n \). \( \square \)
</div>

<div class="remark">
<strong>Remark (Equality in the Ergodic Case).</strong> If \( T \) is ergodic, then \( Pf = \int f \, d\mu = \mu(B) \) (a constant), so \( \|Pf\|^2 = \mu(B)^2 \). The Cesàro average of \( \mu(B \cap T^{-n}B) \) converges exactly to \( \mu(B)^2 \). For strongly mixing \( T \), we have the stronger result \( \mu(B \cap T^{-n}B) \to \mu(B)^2 \) for every \( n \to \infty \) (without Cesàro averaging).
</div>

## H.3: Proof that Irrational Rotation is Not Mixing

<div class="theorem">
<strong>Proposition.</strong> The irrational rotation \( T(x) = x + \alpha \pmod{1} \) on \( (\mathbb{T}, \lambda) \) is ergodic but not weakly mixing (hence not strongly mixing).
</div>

<div class="proof">
<em>Proof (ergodicity).</em> Proved in Section 16.1: the Koopman operator \( U_T \) has eigenfunctions \( e_k(x) = e^{2\pi ikx} \) with eigenvalues \( e^{2\pi ik\alpha} \), all distinct for \( k \neq 0 \), so the eigenvalue 1 has multiplicity 1.

<em>Proof (not weakly mixing).</em> The function \( f = e_1(x) = e^{2\pi ix} \in L^2_0 \) (zero integral) satisfies \( U_T e_1 = e^{2\pi i\alpha} e_1 \). So \( U_T^n e_1 = e^{2\pi i n\alpha} e_1 \), which is an eigenfunction with eigenvalue \( \lambda = e^{2\pi i\alpha} \). Since \( \lambda \in \mathbb{T} \) and \( |\lambda^n| = 1 \) for all \( n \), the sequence \( (U_T^n e_1)_{n \geq 1} \) never converges weakly to 0 in \( L^2 \). Specifically:

\[
\langle U_T^n e_1, e_1 \rangle = e^{2\pi in\alpha},
\]
which has absolute value 1 for all \( n \). For weak mixing, we would need

\[
\frac{1}{N}\sum_{n=0}^{N-1}|\langle U_T^n e_1, e_1 \rangle| = 1 \to 0,
\]
which is impossible. Therefore \( T \) is not weakly mixing.

<em>Concrete measure formulation.</em> Take \( A = [0, 1/3) \) and \( B = [0, 1/3) \). For weak mixing we need \( \frac{1}{N}\sum_{n=0}^{N-1}|\lambda([0,1/3) \cap T^{-n}[0,1/3)) - 1/9| \to 0 \). However, when \( n\alpha \pmod{1} \) is very small (which happens for infinitely many \( n \) since the orbit of 0 equidistributes), \( T^{-n}[0,1/3) = [-n\alpha, 1/3 - n\alpha) \approx [0, 1/3) \), so \( \lambda(A \cap T^{-n}A) \approx 1/3 \gg (1/3)^2 = 1/9 \). The oscillation prevents Cesàro convergence to 0. \( \square \)
</div>

## H.4: Derivation of the Doubling Map's Spectral Properties

<div class="example">
<strong>Complete Spectral Analysis of the Doubling Map.</strong> Let \( T(x) = 2x \pmod{1} \) on \( ([0,1), \lambda) \).

<em>Step 1: \( U_T e_k = e_{2k} \).</em> Compute: \( U_T e_k(x) = e_k(T(x)) = e^{2\pi i k(2x)} = e^{2\pi i(2k)x} = e_{2k}(x) \).

<em>Step 2: No \( L^2_0 \) eigenfunctions.</em> Suppose \( U_T f = \lambda f \) for some \( f = \sum_{k \neq 0} \hat{f}(k) e_k \in L^2_0 \) and \( \lambda \neq 0 \). Then \( U_T f = \sum_k \hat{f}(k) e_{2k} \), so matching Fourier coefficients: \( \lambda \hat{f}(k) = \hat{f}(k/2) \) (where \( \hat{f}(k/2) = 0 \) if \( k \) is odd). For even \( k = 2m \): \( \lambda \hat{f}(2m) = \hat{f}(m) \), i.e., \( \hat{f}(m) = \lambda \hat{f}(2m) = \lambda^2 \hat{f}(4m) = \cdots = \lambda^j \hat{f}(2^j m) \). Since \( f \in L^2 \), \( \sum_k |\hat{f}(k)|^2 < \infty \). If \( |\lambda| < 1 \), then \( |\hat{f}(m)| = |\lambda|^j |\hat{f}(2^j m)| \leq |\lambda|^j \|f\|_2 \to 0 \), so \( \hat{f}(m) = 0 \) for all \( m \neq 0 \). If \( |\lambda| > 1 \), a similar argument (going the other direction) forces \( \hat{f} = 0 \). If \( |\lambda| = 1 \), then \( |\hat{f}(m)| = |\hat{f}(2^j m)| \) for all \( j \), which contradicts \( \sum |\hat{f}(k)|^2 < \infty \) unless \( \hat{f}(m) = 0 \). In all cases \( f = 0 \), so there are no \( L^2_0 \) eigenfunctions.

<em>Step 3: \( T \) is weakly mixing.</em> Since \( U_T|_{L^2_0} \) has no eigenvalues, \( T \) is weakly mixing (by the spectral characterization).

<em>Step 4: \( T \) is strongly mixing.</em> For any two characters \( e_k, e_j \in L^2 \):

\[
\langle U_T^n e_k, e_j \rangle = \langle e_{2^n k}, e_j \rangle = \begin{cases} 1 & \text{if } 2^n k = j \\ 0 & \text{otherwise}\end{cases}.
\]
For \( k \neq 0 \) and any fixed \( j \), \( 2^n k = j \) can hold for at most one value of \( n \) (since \( 2^n k \) is injective in \( n \)). So \( \langle U_T^n e_k, e_j \rangle = 0 \) for all but at most one \( n \), hence \( \langle U_T^n e_k, e_j \rangle \to 0 \) as \( n \to \infty \). By linearity and density of trigonometric polynomials, \( \langle U_T^n f, g \rangle \to 0 \) for all \( f, g \in L^2_0 \), confirming strong mixing.
</div>

<div class="remark">
<strong>Remark (Summary of the Three Key Systems).</strong> The three systems studied most carefully in these notes — the irrational rotation, the doubling map, and the full Bernoulli shift — illustrate the full range of dynamical behavior:

| | Irrational Rotation | Doubling Map | Bernoulli Shift |
|---|---|---|---|
| Minimal | Yes | No | No (not even defined topologically as such) |
| Uniquely ergodic | Yes | No (many inv. measures) | Yes (uniform Bernoulli) |
| Ergodic | Yes | Yes | Yes |
| Weakly mixing | No | Yes | Yes |
| Strongly mixing | No | Yes | Yes |
| Entropy | 0 | \( \log 2 \) | \( \log 2 \) |
| Spectral type | Pure point | Lebesgue | Lebesgue (mult. \( \infty \)) |
| Isomorphism class | Rotation on \( \mathbb{T} \) | Lebesgue class | Bernoulli |

The irrational rotation and doubling map have the same entropy (0 vs. \( \log 2 \)) but radically different spectral properties. The doubling map and the Bernoulli shift have the same topological entropy and the same spectral type, yet the Bernoulli shift is a richer system (the doubling map is a factor of the Bernoulli shift, not the other way around). Ornstein's theorem implies that any ergodic system with entropy \( \log 2 \) and the Lebesgue spectral type is isomorphic to the Bernoulli shift — the doubling map satisfies this and hence is, measure-theoretically, isomorphic to the \( (1/2,1/2) \)-Bernoulli shift.
</div>

---

# Appendix I: Quick Reference — Theorems and Their Dependencies

The following diagram outlines the logical dependencies among the main theorems of the course. Understanding these dependencies is essential for seeing the overall structure of the subject.

**Topological branch:**
- Tychonoff's theorem (compactness of products)
  → Existence of minimal subflows (Zorn's lemma + compactness)
  → Birkhoff recurrence theorem
  → Auslander–Ellis theorem (proximal pairs have common proximal points)
- Ellis semigroup (closure in \( X^X \))
  → Ellis–Namiooka–Ruppert (idempotents in compact right-topological semigroups)
  → Idempotents in \( \beta G \)
  → Hindman's theorem (idempotent ultrafilter proof)
  → Central sets theorem
- Furstenberg structure theorem for distal flows (transfinite tower of equicontinuous extensions)
  → Universal minimal distal flow
  → Bohr compactification = universal minimal equicontinuous \( \mathbb{Z} \)-system

**Measure-theoretic branch:**
- Lebesgue integration theory (monotone convergence, dominated convergence, Radon–Nikodym)
  → Definition of pmp transformations and \( L^2 \)
  → Koopman operator (unitary on \( L^2 \))
  → Mean ergodic theorem (von Neumann, 1932)
  → Birkhoff ergodic theorem (1931) — requires maximal ergodic lemma
- Spectral theory of unitary operators
  → Halmos–von Neumann theorem (pure point spectrum \( \iff \) rotation on compact abelian group)
- Shannon information theory
  → Kolmogorov–Sinai entropy (1958)
  → Entropy of Bernoulli shifts
  → Ornstein isomorphism theorem (entropy is complete invariant for Bernoulli shifts)

**Connecting branch (Furstenberg–Zimmer):**
- Birkhoff ergodic theorem + Koopman operator theory
  → Poincaré recurrence (quantitative form)
  → Furstenberg–Zimmer structure theorem (compact and weakly mixing extensions)
  → Multiple recurrence theorem (Furstenberg, 1977)
- Furstenberg correspondence principle (encoding \( A \subseteq \mathbb{Z} \) as a pmp system)
  → Szemerédi's theorem (positive density \( \Rightarrow \) arithmetic progressions)
- Host–Kra theory (nilfactors as characteristic factors)
  → Convergence of multiple ergodic averages
- Green–Tao (primes contain arithmetic progressions of every length, 2004)


