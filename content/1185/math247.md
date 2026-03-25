---
title: "MATH 247: Calculus 3 for Honours Mathematics"
---

These notes cover MATH 247 (Calculus 3 for Honours Mathematics) at the University of Waterloo. The course is the rigorous honours companion to MATH 237, treating multivariable calculus with the full force of real analysis: epsilon-delta arguments, the topology of \(\mathbb{R}^n\), the Inverse and Implicit Function Theorems, and an introduction to differential forms and the classical integral theorems of vector calculus. The underlying philosophy throughout is that of Spivak's *Calculus on Manifolds*: every definition should be motivated, every theorem should be understood geometrically, and every proof should illuminate rather than merely verify.

---

# Chapter 1: Topology of \(\mathbb{R}^n\)

The first task in multivariable calculus is to understand the space we are working in. Single-variable analysis relies tacitly on topological properties of \(\mathbb{R}\) — the fact that an interval is "connected," or that a closed bounded set is "compact" — but in \(\mathbb{R}^n\) these properties require careful definition. Without them, statements like "a continuous function on a closed bounded set attains its maximum" have no precise meaning.

## Open and Closed Sets

We work in \(\mathbb{R}^n\) equipped with the Euclidean norm \(\|\mathbf{x}\| = \sqrt{x_1^2 + \cdots + x_n^2}\).

<div class="definition">

<strong>Definition 1.1 (Open Ball).</strong> For \(\mathbf{a} \in \mathbb{R}^n\) and \(r > 0\), the <em>open ball</em> of radius \(r\) centred at \(\mathbf{a}\) is
\[
B_r(\mathbf{a}) = \{\mathbf{x} \in \mathbb{R}^n : \|\mathbf{x} - \mathbf{a}\| < r\}.
\]
We also call this a <em>neighborhood</em> of \(\mathbf{a}\).

</div>

The notion of an open set captures, informally, the idea that every point has "room to wiggle" without leaving the set.

<div class="definition">

<strong>Definition 1.2 (Open Set).</strong> A set \(U \subseteq \mathbb{R}^n\) is <em>open</em> if for every \(\mathbf{a} \in U\) there exists \(r > 0\) such that \(B_r(\mathbf{a}) \subseteq U\).

</div>

<div class="definition">

<strong>Definition 1.3 (Closed Set).</strong> A set \(F \subseteq \mathbb{R}^n\) is <em>closed</em> if its complement \(\mathbb{R}^n \setminus F\) is open. Equivalently, \(F\) is closed if and only if it contains all its boundary points: for every sequence \(\{\mathbf{x}_k\} \subseteq F\) with \(\mathbf{x}_k \to \mathbf{a}\), we have \(\mathbf{a} \in F\).

</div>

<div class="definition">

<strong>Definition 1.4 (Interior, Closure, Boundary).</strong> For \(S \subseteq \mathbb{R}^n\):
- The <em>interior</em> \(\operatorname{int}(S)\) is the largest open set contained in \(S\).
- The <em>closure</em> \(\overline{S}\) is the smallest closed set containing \(S\).
- The <em>boundary</em> \(\partial S = \overline{S} \setminus \operatorname{int}(S)\): a point \(\mathbf{b} \in \partial S\) if every ball \(B_r(\mathbf{b})\) meets both \(S\) and \(\mathbb{R}^n \setminus S\).

</div>

Notice that a set can be neither open nor closed (e.g., a half-open interval \([0,1) \subset \mathbb{R}\)), and that \(\mathbb{R}^n\) and \(\emptyset\) are simultaneously both open and closed.

<div class="theorem">

<strong>Theorem 1.5 (Topology of \(\mathbb{R}^n\)).</strong>
1. Arbitrary unions of open sets are open.
2. Finite intersections of open sets are open.
3. Arbitrary intersections of closed sets are closed.
4. Finite unions of closed sets are closed.

</div>

*Proof.* (1) If \(\mathbf{x} \in \bigcup_\alpha U_\alpha\), then \(\mathbf{x} \in U_\alpha\) for some \(\alpha\), so some ball \(B_r(\mathbf{x}) \subseteq U_\alpha \subseteq \bigcup_\alpha U_\alpha\). (2) If \(\mathbf{x} \in U_1 \cap \cdots \cap U_k\), choose \(r_i\) with \(B_{r_i}(\mathbf{x}) \subseteq U_i\) and set \(r = \min r_i > 0\). (3) and (4) follow by taking complements. \(\square\)

The failure of statement (2) for infinite intersections is instructive: \(\bigcap_{n=1}^\infty (-1/n, 1/n) = \{0\}\), which is closed but not open. Infinite intersections of open sets need not be open.

## Compact Sets and Heine-Borel

Compactness is perhaps the single most important topological property in analysis. It is what allows us to pass from local to global: a function that is locally bounded on a compact set is globally bounded.

<div class="definition">

<strong>Definition 1.6 (Bounded Set).</strong> A set \(S \subseteq \mathbb{R}^n\) is <em>bounded</em> if there exists \(R > 0\) such that \(S \subseteq B_R(\mathbf{0})\), i.e., \(\|\mathbf{x}\| \leq R\) for all \(\mathbf{x} \in S\).

</div>

<div class="definition">

<strong>Definition 1.7 (Compact Set — Sequential).</strong> A set \(K \subseteq \mathbb{R}^n\) is <em>sequentially compact</em> if every sequence in \(K\) has a subsequence that converges to a point in \(K\).

</div>

The open-cover definition of compactness is equivalent in \(\mathbb{R}^n\) and is the one that generalises to arbitrary metric and topological spaces.

<div class="definition">

<strong>Definition 1.8 (Open Cover, Compact Set).</strong> An <em>open cover</em> of \(S\) is a collection \(\{U_\alpha\}\) of open sets with \(S \subseteq \bigcup_\alpha U_\alpha\). A set \(K\) is <em>compact</em> if every open cover of \(K\) has a finite subcover.

</div>

<div class="theorem">

<strong>Theorem 1.9 (Heine-Borel).</strong> A subset \(K \subseteq \mathbb{R}^n\) is compact if and only if it is closed and bounded.

</div>

*Proof (sketch).* (\(\Rightarrow\)) If \(K\) is compact: boundedness follows by taking the open cover \(\{B_k(\mathbf{0})\}_{k=1}^\infty\) and extracting a finite subcover. Closedness follows because if \(\mathbf{a} \notin K\), the open sets \(U_k = \{\mathbf{x} : \|\mathbf{x} - \mathbf{a}\| > 1/k\}\) cover \(K\), and a finite subcover forces \(\mathbf{a}\) to be in the exterior of \(K\). (\(\Leftarrow\)) Any closed bounded set in \(\mathbb{R}^n\) is contained in a closed box \([-R,R]^n\). By the Bolzano-Weierstrass theorem (which follows from repeated bisection in \(\mathbb{R}\)), every sequence in a closed bounded set has a convergent subsequence with limit in the set. Sequential compactness and compactness are equivalent in metric spaces, completing the proof. \(\square\)

The Heine-Borel theorem is special to \(\mathbb{R}^n\): in an infinite-dimensional normed space, the closed unit ball is closed and bounded but never compact.

<div class="theorem">

<strong>Theorem 1.10 (Extreme Value Theorem).</strong> If \(f : K \to \mathbb{R}\) is continuous and \(K \subseteq \mathbb{R}^n\) is compact, then \(f\) attains its maximum and minimum on \(K\).

</div>

*Proof.* Let \(M = \sup_K f\). Choose \(\mathbf{x}_k \in K\) with \(f(\mathbf{x}_k) \to M\). By compactness, pass to a subsequence \(\mathbf{x}_{k_j} \to \mathbf{c} \in K\). By continuity, \(f(\mathbf{c}) = \lim f(\mathbf{x}_{k_j}) = M\). \(\square\)

## Connected Sets

<div class="definition">

<strong>Definition 1.11 (Connected Set).</strong> A set \(S \subseteq \mathbb{R}^n\) is <em>connected</em> if it cannot be written as \(S = A \cup B\) where \(A\) and \(B\) are disjoint, non-empty, and both open in \(S\). Equivalently, \(S\) is connected if the only subsets of \(S\) that are simultaneously open and closed in \(S\) are \(\emptyset\) and \(S\) itself.

</div>

<div class="definition">

<strong>Definition 1.12 (Path-Connected).</strong> A set \(S \subseteq \mathbb{R}^n\) is <em>path-connected</em> if for every \(\mathbf{a}, \mathbf{b} \in S\) there is a continuous path \(\gamma : [0,1] \to S\) with \(\gamma(0) = \mathbf{a}\) and \(\gamma(1) = \mathbf{b}\).

</div>

Path-connectedness implies connectedness; the converse holds for open sets in \(\mathbb{R}^n\). The image of a connected set under a continuous map is connected — this is the multivariable Intermediate Value Theorem.

---

# Chapter 2: Functions of Several Variables

The interplay between topology and analysis begins in earnest once we ask: when does \(\lim_{\mathbf{x} \to \mathbf{a}} f(\mathbf{x})\) exist, and what does it mean for \(f\) to be continuous? In single-variable calculus, limits are directional (from left or right). In \(\mathbb{R}^n\) with \(n \geq 2\), a point can be approached from infinitely many directions, and the limit must be the same along all of them simultaneously.

## Limits in \(\mathbb{R}^n\)

<div class="definition">

<strong>Definition 2.1 (Limit).</strong> Let \(f : D \to \mathbb{R}\) with \(D \subseteq \mathbb{R}^n\), and let \(\mathbf{a}\) be a limit point of \(D\). We say \(\displaystyle\lim_{\mathbf{x} \to \mathbf{a}} f(\mathbf{x}) = L\) if for every \(\varepsilon > 0\) there exists \(\delta > 0\) such that
\[
0 < \|\mathbf{x} - \mathbf{a}\| < \delta \text{ and } \mathbf{x} \in D \implies |f(\mathbf{x}) - L| < \varepsilon.
\]

</div>

The key feature distinguishing this from single-variable limits is that \(\delta\) must work for all points within distance \(\delta\) of \(\mathbf{a}\), regardless of the direction of approach. This makes limits harder to establish but also harder to disprove.

<div class="theorem">

<strong>Theorem 2.2 (Limit Laws).</strong> If \(\lim_{\mathbf{x}\to\mathbf{a}} f(\mathbf{x}) = L\) and \(\lim_{\mathbf{x}\to\mathbf{a}} g(\mathbf{x}) = M\), then
\[
\lim_{\mathbf{x}\to\mathbf{a}} [f(\mathbf{x}) + g(\mathbf{x})] = L + M, \quad \lim_{\mathbf{x}\to\mathbf{a}} f(\mathbf{x})g(\mathbf{x}) = LM, \quad \lim_{\mathbf{x}\to\mathbf{a}} \frac{f(\mathbf{x})}{g(\mathbf{x})} = \frac{L}{M} \text{ if } M \neq 0.
\]

</div>

<div class="theorem">

<strong>Theorem 2.3 (Squeeze Theorem).</strong> If \(|f(\mathbf{x}) - L| \leq B(\mathbf{x})\) for all \(\mathbf{x}\) near \(\mathbf{a}\) and \(\lim_{\mathbf{x}\to\mathbf{a}} B(\mathbf{x}) = 0\), then \(\lim_{\mathbf{x}\to\mathbf{a}} f(\mathbf{x}) = L\).

</div>

To show a limit does not exist, the path method is decisive: if \(f(\mathbf{x})\) approaches different values along two different curves through \(\mathbf{a}\), the limit cannot exist. The most common paths to try are lines \(y = mx\) and parabolas \(y = cx^2\).

A useful bounding inequality: since \(|x_i| \leq \|\mathbf{x}\|\) for each component, many expressions can be bounded by powers of \(\|\mathbf{x} - \mathbf{a}\|\).

## Continuity

<div class="definition">

<strong>Definition 2.4 (Continuity).</strong> A function \(f : D \to \mathbb{R}\) is <em>continuous at</em> \(\mathbf{a} \in D\) if
\[
\lim_{\mathbf{x} \to \mathbf{a}} f(\mathbf{x}) = f(\mathbf{a}).
\]
This requires simultaneously: (i) the limit exists, (ii) \(f(\mathbf{a})\) is defined, and (iii) they are equal. We say \(f\) is continuous on \(D\) if it is continuous at every point of \(D\).

</div>

Continuity has a clean topological reformulation: \(f\) is continuous on \(D\) if and only if the preimage \(f^{-1}(U)\) of every open set \(U \subseteq \mathbb{R}\) is open in \(D\). This is often the definition used in general topology.

<div class="theorem">

<strong>Theorem 2.5 (Continuity Arithmetic).</strong> If \(f\) and \(g\) are continuous at \(\mathbf{a}\), then \(f + g\), \(fg\), and \(f/g\) (when \(g(\mathbf{a}) \neq 0\)) are continuous at \(\mathbf{a}\). If \(f\) is continuous at \(\mathbf{a}\) and \(h : \mathbb{R} \to \mathbb{R}\) is continuous at \(f(\mathbf{a})\), then \(h \circ f\) is continuous at \(\mathbf{a}\).

</div>

The polynomial functions, coordinate projections, exponential, logarithm, trigonometric functions, and absolute value are all continuous on their natural domains. Combining them via the above rules covers almost every function encountered in practice.

## Partial Derivatives and the Gradient

<div class="definition">

<strong>Definition 2.6 (Partial Derivative).</strong> Let \(f : D \to \mathbb{R}\) with \(D \subseteq \mathbb{R}^n\). The <em>partial derivative</em> of \(f\) with respect to \(x_i\) at \(\mathbf{a}\) is
\[
\frac{\partial f}{\partial x_i}(\mathbf{a}) = \lim_{h \to 0} \frac{f(\mathbf{a} + h\mathbf{e}_i) - f(\mathbf{a})}{h},
\]
where \(\mathbf{e}_i\) is the \(i\)-th standard basis vector.

</div>

A partial derivative measures the rate of change of \(f\) when we move in the direction of a coordinate axis while holding all other variables fixed. It is nothing but an ordinary single-variable derivative along that axis. This simplicity is also a limitation: a function can have all partial derivatives at a point and yet fail to be continuous there.

<div class="definition">

<strong>Definition 2.7 (Gradient).</strong> If all partial derivatives of \(f : D \to \mathbb{R}\) exist at \(\mathbf{a}\), the <em>gradient</em> is the vector
\[
\nabla f(\mathbf{a}) = \left(\frac{\partial f}{\partial x_1}(\mathbf{a}), \ldots, \frac{\partial f}{\partial x_n}(\mathbf{a})\right) \in \mathbb{R}^n.
\]

</div>

Geometrically, the gradient points in the direction of steepest ascent, and its magnitude gives the rate of that ascent. We will make this precise once differentiability is established.

---

# Chapter 3: Differentiability

Partial derivatives capture rates of change along coordinate directions, but they do not capture the full local linear behavior of \(f\). The correct notion of differentiability in \(\mathbb{R}^n\) requires the existence of a linear map that approximates \(f\) near a point, with the error going to zero faster than the displacement. This is the key idea: differentiability is a property of the best linear approximation.

## The Total Derivative

<div class="definition">

<strong>Definition 3.1 (Differentiable, Total Derivative).</strong> A function \(f : D \to \mathbb{R}^m\) with \(D \subseteq \mathbb{R}^n\) open is <em>differentiable</em> at \(\mathbf{a} \in D\) if there exists a linear map \(L : \mathbb{R}^n \to \mathbb{R}^m\) such that
\[
\lim_{\mathbf{h} \to \mathbf{0}} \frac{\|f(\mathbf{a} + \mathbf{h}) - f(\mathbf{a}) - L(\mathbf{h})\|}{\|\mathbf{h}\|} = 0.
\]
The map \(L\) is called the <em>total derivative</em> (or <em>Fréchet derivative</em>) of \(f\) at \(\mathbf{a}\), written \(Df(\mathbf{a})\).

</div>

The total derivative is unique when it exists: if both \(L\) and \(L'\) satisfy the condition, then \(\|L(\mathbf{h}) - L'(\mathbf{h})\| / \|\mathbf{h}\| \to 0\) as \(\mathbf{h} \to \mathbf{0}\), which forces \(L = L'\) for a linear map. The condition says precisely that the remainder \(R(\mathbf{h}) = f(\mathbf{a} + \mathbf{h}) - f(\mathbf{a}) - L(\mathbf{h})\) is \(o(\|\mathbf{h}\|)\) (little-oh of \(\|\mathbf{h}\|\)).

<div class="theorem">

<strong>Theorem 3.2 (Differentiability Implies Continuity).</strong> If \(f\) is differentiable at \(\mathbf{a}\), then \(f\) is continuous at \(\mathbf{a}\).

</div>

*Proof.* We have \(f(\mathbf{a} + \mathbf{h}) = f(\mathbf{a}) + L(\mathbf{h}) + R(\mathbf{h})\). As \(\mathbf{h} \to \mathbf{0}\): \(L(\mathbf{h}) \to 0\) by linearity and \(\|R(\mathbf{h})\| \leq \|\mathbf{h}\| \cdot \|R(\mathbf{h})\|/\|\mathbf{h}\| \to 0\). \(\square\)

<div class="theorem">

<strong>Theorem 3.3 (Partials from the Total Derivative).</strong> If \(f : D \to \mathbb{R}\) is differentiable at \(\mathbf{a}\), then all partial derivatives \(\partial f / \partial x_i\) exist at \(\mathbf{a}\), and
\[
Df(\mathbf{a})(\mathbf{h}) = \nabla f(\mathbf{a}) \cdot \mathbf{h} = \sum_{i=1}^n \frac{\partial f}{\partial x_i}(\mathbf{a})\, h_i.
\]

</div>

*Proof.* Take \(\mathbf{h} = t\mathbf{e}_i\) in the definition: the limit condition forces \(Df(\mathbf{a})(\mathbf{e}_i) = \partial f/\partial x_i(\mathbf{a})\). \(\square\)

The converse is false: partial derivatives can exist without differentiability. The correct sufficient condition is the following.

<div class="theorem">

<strong>Theorem 3.4 (\(C^1\) Implies Differentiable).</strong> If all partial derivatives of \(f\) exist in a neighborhood of \(\mathbf{a}\) and are continuous at \(\mathbf{a}\), then \(f\) is differentiable at \(\mathbf{a}\).

</div>

*Proof (for \(n=2\)).* Write \(f(a+h, b+k) - f(a,b) = [f(a+h, b+k) - f(a, b+k)] + [f(a, b+k) - f(a,b)]\). By the mean value theorem in one variable, the first bracket equals \(f_x(a + \theta h, b+k) \cdot h\) for some \(\theta \in (0,1)\), and the second equals \(f_y(a, b + \phi k) \cdot k\). Writing \(f_x(a+\theta h, b+k) = f_x(a,b) + \varepsilon_1\) and using continuity of \(f_x\) at \((a,b)\), the error \(\varepsilon_1 \to 0\) as \((h,k) \to (0,0)\). Similarly for \(f_y\). Hence the remainder \(R\) satisfies \(|R| \leq |\varepsilon_1||h| + |\varepsilon_2||k| \leq (|\varepsilon_1| + |\varepsilon_2|)\|(h,k)\| = o(\|(h,k)\|)\). \(\square\)

## The Jacobian Matrix

For a map \(F = (f_1, \ldots, f_m) : D \subseteq \mathbb{R}^n \to \mathbb{R}^m\), differentiability means each component \(f_i\) is differentiable, and the total derivative is represented by a matrix.

<div class="definition">

<strong>Definition 3.5 (Jacobian Matrix).</strong> If \(F : D \subseteq \mathbb{R}^n \to \mathbb{R}^m\) is differentiable at \(\mathbf{a}\), the matrix of the linear map \(DF(\mathbf{a})\) with respect to the standard bases is the <em>Jacobian matrix</em>
\[
JF(\mathbf{a}) = \begin{bmatrix} \dfrac{\partial f_1}{\partial x_1} & \cdots & \dfrac{\partial f_1}{\partial x_n} \\[8pt] \vdots & \ddots & \vdots \\[4pt] \dfrac{\partial f_m}{\partial x_1} & \cdots & \dfrac{\partial f_m}{\partial x_n} \end{bmatrix}_{\mathbf{a}}.
\]
When \(m = n\), its determinant \(\det JF(\mathbf{a})\) is the <em>Jacobian</em> of \(F\) at \(\mathbf{a}\).

</div>

The Jacobian generalises the derivative of a scalar function. Geometrically, \(|{\det JF(\mathbf{a})}|\) measures the factor by which \(F\) scales \(n\)-dimensional volume near \(\mathbf{a}\). This is the key to the change-of-variables formula for multiple integrals.

## The Chain Rule

The chain rule is the engine of multivariable calculus: it converts questions about composite functions into matrix multiplication. The proof in the multivariable setting is more delicate than in single-variable calculus because we cannot simply divide by \(\Delta t\) — we need the full strength of the \(o(\|\mathbf{h}\|)\) formulation.

<div class="theorem">

<strong>Theorem 3.6 (Chain Rule).</strong> Let \(G : D \subseteq \mathbb{R}^n \to \mathbb{R}^m\) be differentiable at \(\mathbf{a}\), and let \(F : E \subseteq \mathbb{R}^m \to \mathbb{R}^p\) be differentiable at \(G(\mathbf{a})\). Then the composite \(F \circ G\) is differentiable at \(\mathbf{a}\) and
\[
D(F \circ G)(\mathbf{a}) = DF(G(\mathbf{a})) \circ DG(\mathbf{a}),
\]
or in matrix form, \(J(F \circ G)(\mathbf{a}) = JF(G(\mathbf{a}))\, JG(\mathbf{a})\).

</div>

*Proof.* Let \(\mathbf{b} = G(\mathbf{a})\), \(L = DG(\mathbf{a})\), \(M = DF(\mathbf{b})\). Write
\[
G(\mathbf{a} + \mathbf{h}) = \mathbf{b} + L\mathbf{h} + \mathbf{r}(\mathbf{h}), \quad F(\mathbf{b} + \mathbf{k}) = F(\mathbf{b}) + M\mathbf{k} + \mathbf{s}(\mathbf{k}),
\]
where \(\|\mathbf{r}(\mathbf{h})\|/\|\mathbf{h}\| \to 0\) and \(\|\mathbf{s}(\mathbf{k})\|/\|\mathbf{k}\| \to 0\) as \(\mathbf{h}, \mathbf{k} \to \mathbf{0}\). Setting \(\mathbf{k} = L\mathbf{h} + \mathbf{r}(\mathbf{h})\),
\[
F(G(\mathbf{a}+\mathbf{h})) = F(\mathbf{b}) + M(L\mathbf{h} + \mathbf{r}) + \mathbf{s}(\mathbf{k}) = F(\mathbf{b}) + ML\mathbf{h} + M\mathbf{r} + \mathbf{s}(\mathbf{k}).
\]
We need \(\|M\mathbf{r}(\mathbf{h}) + \mathbf{s}(\mathbf{k})\|/\|\mathbf{h}\| \to 0\). For the first term: \(\|M\mathbf{r}\|/\|\mathbf{h}\| \leq \|M\|\,\|\mathbf{r}\|/\|\mathbf{h}\| \to 0\). For the second: either \(\mathbf{k} = 0\) (in which case \(\mathbf{s}(\mathbf{k}) = 0\)) or \(\|\mathbf{s}(\mathbf{k})\|/\|\mathbf{h}\| = (\|\mathbf{s}(\mathbf{k})\|/\|\mathbf{k}\|) \cdot (\|\mathbf{k}\|/\|\mathbf{h}\|)\), and \(\|\mathbf{k}\|/\|\mathbf{h}\| \leq \|L\| + \|\mathbf{r}\|/\|\mathbf{h}\|\) is bounded. \(\square\)

In Leibniz notation, the chain rule reads
\[
\frac{\partial (f \circ G)}{\partial x_j}(\mathbf{a}) = \sum_{k=1}^m \frac{\partial f}{\partial u_k}(G(\mathbf{a}))\,\frac{\partial G_k}{\partial x_j}(\mathbf{a}).
\]
The "sum over intermediate variables" rule is precisely matrix multiplication.

## Directional Derivatives

<div class="definition">

<strong>Definition 3.7 (Directional Derivative).</strong> The <em>directional derivative</em> of \(f\) at \(\mathbf{a}\) in the direction of a unit vector \(\hat{\mathbf{u}} \in \mathbb{R}^n\) is
\[
D_{\hat{\mathbf{u}}} f(\mathbf{a}) = \lim_{t \to 0} \frac{f(\mathbf{a} + t\hat{\mathbf{u}}) - f(\mathbf{a})}{t} = \frac{d}{dt}\bigg|_{t=0} f(\mathbf{a} + t\hat{\mathbf{u}}).
\]

</div>

<div class="theorem">

<strong>Theorem 3.8.</strong> If \(f\) is differentiable at \(\mathbf{a}\), then \(D_{\hat{\mathbf{u}}} f(\mathbf{a}) = \nabla f(\mathbf{a}) \cdot \hat{\mathbf{u}}\) for all unit vectors \(\hat{\mathbf{u}}\).

</div>

*Proof.* Apply the chain rule to \(g(t) = f(\mathbf{a} + t\hat{\mathbf{u}})\): \(g'(0) = Df(\mathbf{a})(\hat{\mathbf{u}}) = \nabla f(\mathbf{a}) \cdot \hat{\mathbf{u}}\). \(\square\)

By Cauchy-Schwarz, \(D_{\hat{\mathbf{u}}} f(\mathbf{a}) \leq \|\nabla f(\mathbf{a})\|\), with equality when \(\hat{\mathbf{u}} = \nabla f(\mathbf{a})/\|\nabla f(\mathbf{a})\|\). So the gradient points in the direction of steepest ascent, and \(\|\nabla f(\mathbf{a})\|\) is the maximum rate of increase. The gradient is also orthogonal to level sets: if \(f\) is constant along a curve through \(\mathbf{a}\), then \(\nabla f(\mathbf{a})\) is perpendicular to that curve's tangent vector.

---

# Chapter 4: The Inverse and Implicit Function Theorems

These two theorems are among the deepest results in multivariable calculus, and they appear everywhere in differential geometry, differential equations, and mathematical physics. The central question is: when does a system of equations \(F(\mathbf{x}) = \mathbf{0}\) locally define some of the variables as smooth functions of the others? The answer is governed by the invertibility of the Jacobian.

## The Inverse Function Theorem

<div class="theorem">

<strong>Theorem 4.1 (Inverse Function Theorem).</strong> Let \(F : D \subseteq \mathbb{R}^n \to \mathbb{R}^n\) be a \(C^1\) map, and suppose \(\det JF(\mathbf{a}) \neq 0\) at some \(\mathbf{a} \in D\). Then there exist open sets \(U \ni \mathbf{a}\) and \(V \ni F(\mathbf{a})\) such that \(F|_U : U \to V\) is a bijection, and its inverse \(F^{-1} : V \to U\) is also \(C^1\) with
\[
JF^{-1}(\mathbf{y}) = \bigl[JF(F^{-1}(\mathbf{y}))\bigr]^{-1}.
\]

</div>

The theorem says: if the best linear approximation to \(F\) at \(\mathbf{a}\) is invertible, then \(F\) itself is locally invertible. Notice that the condition is only about the derivative at a single point, yet the conclusion is about the behavior of \(F\) in an entire neighborhood.

*Proof (sketch).* Without loss of generality \(\mathbf{a} = F(\mathbf{a}) = \mathbf{0}\) and \(JF(\mathbf{0}) = I\) (by composing with \(JF(\mathbf{a})^{-1}\)). Define \(\Phi(\mathbf{x}) = \mathbf{x} - F(\mathbf{x})\); then \(D\Phi(\mathbf{0}) = 0\). By continuity of the Jacobian, choose \(r > 0\) so that \(\|D\Phi(\mathbf{x})\| \leq 1/2\) on \(B_r(\mathbf{0})\). By the mean value inequality, \(\|\Phi(\mathbf{x}) - \Phi(\mathbf{x}')\| \leq \frac{1}{2}\|\mathbf{x} - \mathbf{x}'\|\), so \(\Phi\) is a contraction. For each \(\mathbf{y}\) near \(\mathbf{0}\), the map \(T_{\mathbf{y}}(\mathbf{x}) = \mathbf{y} + \Phi(\mathbf{x}) = \mathbf{y} + \mathbf{x} - F(\mathbf{x})\) is a contraction of a suitable closed ball. The Banach Fixed Point Theorem gives a unique \(\mathbf{x}\) with \(T_{\mathbf{y}}(\mathbf{x}) = \mathbf{x}\), i.e., \(F(\mathbf{x}) = \mathbf{y}\). Smoothness of the inverse follows from differentiating the identity \(F(F^{-1}(\mathbf{y})) = \mathbf{y}\) and using the chain rule. \(\square\)

The formula \(JF^{-1} = (JF)^{-1}\) is the matrix version of \((f^{-1})'(y) = 1/f'(x)\) from single-variable calculus.

## The Implicit Function Theorem

The Implicit Function Theorem answers the question: when does the zero set of a function locally look like a graph? It is, in a precise sense, a corollary of the Inverse Function Theorem.

<div class="theorem">

<strong>Theorem 4.2 (Implicit Function Theorem).</strong> Let \(F : D \subseteq \mathbb{R}^{n+m} \to \mathbb{R}^m\) be \(C^1\), and write points in \(\mathbb{R}^{n+m}\) as \((\mathbf{x}, \mathbf{y})\) with \(\mathbf{x} \in \mathbb{R}^n\), \(\mathbf{y} \in \mathbb{R}^m\). Suppose \(F(\mathbf{a}, \mathbf{b}) = \mathbf{0}\) and the \(m \times m\) matrix
\[
\frac{\partial F}{\partial \mathbf{y}}(\mathbf{a}, \mathbf{b}) = \left[\frac{\partial F_i}{\partial y_j}\right]_{i,j=1}^m
\]
is invertible. Then there exist neighborhoods \(U \ni \mathbf{a}\) in \(\mathbb{R}^n\) and \(V \ni \mathbf{b}\) in \(\mathbb{R}^m\), and a unique \(C^1\) function \(g : U \to V\) such that
\[
F(\mathbf{x}, g(\mathbf{x})) = \mathbf{0} \quad \text{for all } \mathbf{x} \in U.
\]
The derivative of \(g\) is given by
\[
Dg(\mathbf{x}) = -\left[\frac{\partial F}{\partial \mathbf{y}}(\mathbf{x}, g(\mathbf{x}))\right]^{-1} \frac{\partial F}{\partial \mathbf{x}}(\mathbf{x}, g(\mathbf{x})).
\]

</div>

*Proof.* Define \(\Phi : D \to \mathbb{R}^{n+m}\) by \(\Phi(\mathbf{x}, \mathbf{y}) = (\mathbf{x}, F(\mathbf{x}, \mathbf{y}))\). The Jacobian of \(\Phi\) at \((\mathbf{a}, \mathbf{b})\) is block upper triangular:
\[
J\Phi(\mathbf{a},\mathbf{b}) = \begin{bmatrix} I_n & 0 \\ \partial F/\partial \mathbf{x} & \partial F/\partial \mathbf{y} \end{bmatrix},
\]
which has determinant \(\det(\partial F/\partial \mathbf{y}) \neq 0\). By the Inverse Function Theorem, \(\Phi\) is locally invertible. Write \(\Phi^{-1}(\mathbf{x}, \mathbf{z}) = (\mathbf{x}, h(\mathbf{x}, \mathbf{z}))\) (since the first component is preserved). Setting \(\mathbf{z} = \mathbf{0}\) and \(g(\mathbf{x}) = h(\mathbf{x}, \mathbf{0})\) gives the desired function: \(F(\mathbf{x}, g(\mathbf{x})) = \mathbf{0}\). \(\square\)

The formula for \(Dg\) recovers the implicit differentiation formula \(dy/dx = -F_x/F_y\) from single-variable calculus as a special case with \(n = m = 1\).

## Applications

The Implicit Function Theorem has a striking geometric corollary: the level set \(F(\mathbf{x}) = \mathbf{0}\) is a smooth \(n\)-dimensional manifold near any point where \(JF\) has full rank. This is the rigorous foundation for working with constraints in optimization and in differential geometry.

The tangent space to the level set at \((\mathbf{a}, \mathbf{b})\) is the kernel of \(JF(\mathbf{a}, \mathbf{b})\) — the set of directions along which \(F\) has zero derivative. This generalises the fact that the tangent line to \(f(x,y) = 0\) at a point is perpendicular to \(\nabla f\).

---

# Chapter 5: Higher Derivatives and Taylor's Theorem

Once we know \(f\) is differentiable, we can ask: is \(Df\) itself differentiable? The answer leads to higher-order derivatives, the Hessian matrix, and Taylor's theorem — the multivariable version of the polynomial approximation that is so central to analysis.

## Second-Order Partial Derivatives and Clairaut's Theorem

<div class="definition">

<strong>Definition 5.1 (Second Partial Derivatives, Hessian).</strong> For \(f \in C^2(D)\), the <em>second partial derivatives</em> are \(\partial^2 f/\partial x_i \partial x_j = \partial/\partial x_i (\partial f/\partial x_j)\). The <em>Hessian matrix</em> is
\[
Hf(\mathbf{a}) = \left[\frac{\partial^2 f}{\partial x_i \partial x_j}(\mathbf{a})\right]_{i,j=1}^n.
\]

</div>

The Hessian captures the curvature of the graph of \(f\), just as the second derivative captures curvature in single-variable calculus. Its eigenvalues determine whether \(f\) bends upward, downward, or in a saddle configuration near a critical point.

<div class="theorem">

<strong>Theorem 5.2 (Clairaut–Schwarz).</strong> If \(f \in C^2\) near \(\mathbf{a}\), then \(\partial^2 f / \partial x_i \partial x_j = \partial^2 f / \partial x_j \partial x_i\) at \(\mathbf{a}\). In particular, the Hessian is symmetric.

</div>

## Taylor's Theorem in Several Variables

<div class="theorem">

<strong>Theorem 5.3 (Taylor's Theorem).</strong> Let \(f \in C^{k+1}\) on an open convex set containing the segment from \(\mathbf{a}\) to \(\mathbf{x}\). Then
\[
f(\mathbf{x}) = \sum_{|\alpha| \leq k} \frac{1}{\alpha!}\, \partial^\alpha f(\mathbf{a})\, (\mathbf{x} - \mathbf{a})^\alpha + R_k(\mathbf{x}),
\]
where the sum is over multi-indices \(\alpha\), and the remainder satisfies
\[
R_k(\mathbf{x}) = \frac{1}{(k+1)!}\sum_{|\alpha|=k+1} \partial^\alpha f(\mathbf{c})\, (\mathbf{x}-\mathbf{a})^\alpha
\]
for some \(\mathbf{c}\) on the segment between \(\mathbf{a}\) and \(\mathbf{x}\).

</div>

*Proof.* Apply the single-variable Taylor theorem to \(g(t) = f(\mathbf{a} + t(\mathbf{x} - \mathbf{a}))\) on \([0,1]\). Computing \(g^{(j)}(t)\) by repeated application of the chain rule yields the multinomial expansion. \(\square\)

For \(k = 1\), the second-order form is the most useful:
\[
f(\mathbf{x}) = f(\mathbf{a}) + \nabla f(\mathbf{a}) \cdot (\mathbf{x} - \mathbf{a}) + \frac{1}{2}(\mathbf{x}-\mathbf{a})^T Hf(\mathbf{c})(\mathbf{x}-\mathbf{a}),
\]
and \(|R_1(\mathbf{x})| \leq M\|\mathbf{x}-\mathbf{a}\|^2\) for some constant \(M\) bounding the second partials.

## Critical Points and the Second Derivative Test

<div class="definition">

<strong>Definition 5.4 (Critical Point).</strong> A point \(\mathbf{a}\) in the interior of the domain of \(f\) is a <em>critical point</em> if \(\nabla f(\mathbf{a}) = \mathbf{0}\).

</div>

<div class="theorem">

<strong>Theorem 5.5 (Second Derivative Test).</strong> Let \(f \in C^2\) near a critical point \(\mathbf{a}\). Write \(H = Hf(\mathbf{a})\).

1. If \(H\) is positive definite, then \(\mathbf{a}\) is a strict local minimum.
2. If \(H\) is negative definite, then \(\mathbf{a}\) is a strict local maximum.
3. If \(H\) is indefinite, then \(\mathbf{a}\) is a saddle point.
4. If \(H\) is semidefinite, the test is inconclusive.

</div>

*Proof.* By Taylor's theorem, \(f(\mathbf{a} + \mathbf{h}) - f(\mathbf{a}) = \frac{1}{2}\mathbf{h}^T Hf(\mathbf{c})\mathbf{h}\) for \(\mathbf{c}\) near \(\mathbf{a}\). If \(H\) is positive definite, by continuity of the second partials, \(Hf(\mathbf{c})\) remains positive definite for \(\|\mathbf{h}\|\) small, so \(f(\mathbf{a}+\mathbf{h}) > f(\mathbf{a})\). The other cases are similar. \(\square\)

For \(n = 2\), the test reduces to: let \(D = f_{xx}f_{yy} - f_{xy}^2 = \det Hf\). Then \(D > 0, f_{xx} > 0\) gives a minimum; \(D > 0, f_{xx} < 0\) gives a maximum; \(D < 0\) gives a saddle; \(D = 0\) is inconclusive.

A symmetric matrix is positive definite if and only if all its leading principal minors are positive (Sylvester's criterion). For \(2 \times 2\) matrices, this is equivalent to \(\det H > 0\) and \(H_{11} > 0\).

---

# Chapter 6: Constrained Optimization

Unconstrained optimization finds critical points where \(\nabla f = \mathbf{0}\). Constrained optimization asks: where does \(f\) attain its extreme values on a surface defined by \(g(\mathbf{x}) = 0\)? The method of Lagrange multipliers converts this into an unconstrained system whose structure reflects a beautiful geometric fact.

## Lagrange Multipliers

The geometric insight is this: at a constrained maximum of \(f\) on the surface \(g = 0\), every curve in the surface through the maximum point has zero rate of change of \(f\). But the rate of change of \(f\) along a curve is \(\nabla f \cdot \mathbf{v}\) where \(\mathbf{v}\) is the tangent vector, and the tangent vectors to curves in the constraint surface span the tangent space to that surface. So \(\nabla f\) must be perpendicular to the constraint surface — which means parallel to \(\nabla g\).

<div class="theorem">

<strong>Theorem 6.1 (Lagrange Multiplier Theorem).</strong> Let \(f, g : D \subseteq \mathbb{R}^n \to \mathbb{R}\) be \(C^1\). If \(\mathbf{a}\) is a local extremum of \(f\) subject to \(g(\mathbf{a}) = 0\) and \(\nabla g(\mathbf{a}) \neq \mathbf{0}\), then there exists \(\lambda \in \mathbb{R}\) such that
\[
\nabla f(\mathbf{a}) = \lambda\, \nabla g(\mathbf{a}).
\]

</div>

*Proof.* By the Implicit Function Theorem, since \(\nabla g(\mathbf{a}) \neq \mathbf{0}\), the constraint surface \(S = \{g = 0\}\ \) is a smooth \((n-1)\)-dimensional manifold near \(\mathbf{a}\). Any tangent vector \(\mathbf{v}\) to \(S\) at \(\mathbf{a}\) can be realised as \(\gamma'(0)\) for some smooth curve \(\gamma : (-\varepsilon, \varepsilon) \to S\) with \(\gamma(0) = \mathbf{a}\). If \(\mathbf{a}\) is a constrained local extremum of \(f\), then \(\frac{d}{dt} f(\gamma(t))\big|_{t=0} = \nabla f(\mathbf{a}) \cdot \mathbf{v} = 0\). So \(\nabla f(\mathbf{a})\) is perpendicular to every tangent vector of \(S\). The tangent space of \(S\) is the kernel of \(\nabla g(\mathbf{a})\), so \(\nabla f(\mathbf{a}) \perp \ker(\nabla g(\mathbf{a}))\). By linear algebra, \(\nabla f(\mathbf{a})\) is a scalar multiple of \(\nabla g(\mathbf{a})\). \(\square\)

## Equality Constraints

<div class="theorem">

<strong>Theorem 6.2 (Multiple Constraints).</strong> Suppose \(f : \mathbb{R}^n \to \mathbb{R}\) and \(g_1, \ldots, g_k : \mathbb{R}^n \to \mathbb{R}\) are \(C^1\) with \(k < n\). If \(\mathbf{a}\) is a local extremum of \(f\) on \(\{g_1 = \cdots = g_k = 0\}\) and the gradients \(\nabla g_1(\mathbf{a}), \ldots, \nabla g_k(\mathbf{a})\) are linearly independent, then there exist \(\lambda_1, \ldots, \lambda_k \in \mathbb{R}\) such that
\[
\nabla f(\mathbf{a}) = \lambda_1 \nabla g_1(\mathbf{a}) + \cdots + \lambda_k \nabla g_k(\mathbf{a}).
\]

</div>

## Applications

The algorithm: to find the extrema of \(f\) subject to \(g_1 = \cdots = g_k = 0\), solve the system
\[
\nabla f = \sum_{i=1}^k \lambda_i \nabla g_i, \quad g_1 = 0, \ldots, g_k = 0.
\]
This is \(n + k\) equations in \(n + k\) unknowns (\(\mathbf{x}\) and \(\lambda_1, \ldots, \lambda_k\)). The \(\lambda_i\) are the Lagrange multipliers; they encode the sensitivity of the optimal value to changes in the constraint levels.

A classical application: find the maximum of \(f(x_1,\ldots,x_n) = x_1 \cdots x_n\) on the simplex \(\sum x_i = 1, x_i > 0\). Lagrange gives \(f/x_i = \lambda\) for all \(i\), so all \(x_i\) are equal, yielding the AM-GM inequality \((x_1 \cdots x_n)^{1/n} \leq (x_1 + \cdots + x_n)/n\).

---

# Chapter 7: Multiple Integrals

Integration in \(\mathbb{R}^n\) extends the Riemann integral from intervals to multidimensional regions. The key results are Fubini's theorem (which lets us evaluate multiple integrals as iterated single integrals) and the change-of-variables theorem (which is the multidimensional analogue of the substitution rule).

## Riemann Integration in \(\mathbb{R}^n\)

<div class="definition">

<strong>Definition 7.1 (Riemann Sum, Integrability).</strong> Let \(f : R \to \mathbb{R}\) be bounded on a closed box \(R = [a_1,b_1] \times \cdots \times [a_n,b_n]\). A <em>partition</em> \(\mathcal{P}\) of \(R\) is a subdivision into sub-boxes \(R_i\); the <em>norm</em> \(|\mathcal{P}|\) is the diameter of the largest sub-box. A <em>Riemann sum</em> is \(\sum_i f(\mathbf{c}_i) \operatorname{vol}(R_i)\) for sample points \(\mathbf{c}_i \in R_i\). We say \(f\) is <em>Riemann integrable</em> on \(R\) if all Riemann sums converge to a common limit as \(|\mathcal{P}| \to 0\); that limit is \(\int_R f\). For integration over a general bounded set \(D\), extend \(f\) by zero outside \(D\) and integrate over a box containing \(D\).

</div>

<div class="theorem">

<strong>Theorem 7.2.</strong> Every continuous function on a compact set is Riemann integrable. More generally, \(f\) is Riemann integrable if and only if its set of discontinuities has measure zero.

</div>

## Fubini's Theorem

<div class="theorem">

<strong>Theorem 7.3 (Fubini's Theorem).</strong> Let \(f\) be integrable on the box \(R = [a,b] \times [c,d] \subseteq \mathbb{R}^2\). Then
\[
\iint_R f(x,y)\, dA = \int_a^b \left(\int_c^d f(x,y)\, dy\right) dx = \int_c^d \left(\int_a^b f(x,y)\, dx\right) dy.
\]

</div>

Fubini's theorem reduces a double integral over a rectangle to two successive single integrals. For more general regions, the analogous formula holds:

\[
\iint_D f\,dA = \int_{x_\ell}^{x_u} \int_{y_\ell(x)}^{y_u(x)} f(x,y)\, dy\, dx,
\]

provided \(D = \{(x,y) : x_\ell \leq x \leq x_u,\ y_\ell(x) \leq y \leq y_u(x)\}\). The analogous statement for triple integrals and for \(\mathbb{R}^n\) holds in the same form, with iterated integrals in any order when \(f\) is continuous.

## Change of Variables

The change-of-variables theorem is the multivariable substitute for integration by substitution. Its proof requires understanding how the Jacobian measures the distortion of volume under a differentiable map.

<div class="theorem">

<strong>Theorem 7.4 (Change of Variables).</strong> Let \(\Phi : D^* \subseteq \mathbb{R}^n \to \mathbb{R}^n\) be a \(C^1\) bijection from an open set \(D^*\) onto \(D\), with \(\det J\Phi(\mathbf{u}) \neq 0\) on \(D^*\) (except possibly on a set of measure zero). If \(f : D \to \mathbb{R}\) is integrable, then
\[
\int_D f(\mathbf{x})\, d\mathbf{x} = \int_{D^*} f(\Phi(\mathbf{u}))\, |\det J\Phi(\mathbf{u})|\, d\mathbf{u}.
\]

</div>

*Proof (idea).* For a linear map \(\Phi\), the Riemann sum transforms exactly: the image of a sub-box has volume \(|\det \Phi|\) times the original volume. For a nonlinear \(\Phi\), the local behavior at each point is approximated by the linear map \(J\Phi(\mathbf{u})\), contributing a factor of \(|\det J\Phi(\mathbf{u})|\). Making this precise requires a covering argument and the squeeze theorem for Riemann sums. \(\square\)

The most important special cases are polar, cylindrical, and spherical coordinates:

- <strong>Polar:</strong> \(\Phi(r,\theta) = (r\cos\theta, r\sin\theta)\), \(|\det J\Phi| = r\). So \(\iint_D f\, dA = \iint_{D^*} f(r\cos\theta, r\sin\theta)\, r\, dr\, d\theta\).

- <strong>Cylindrical:</strong> \(\Phi(r,\theta,z) = (r\cos\theta, r\sin\theta, z)\), \(|\det J\Phi| = r\).

- <strong>Spherical:</strong> \(\Phi(\rho,\phi,\theta) = (\rho\sin\phi\cos\theta, \rho\sin\phi\sin\theta, \rho\cos\phi)\), \(|\det J\Phi| = \rho^2\sin\phi\).

## Applications

Multiple integrals compute volume \(\iiint_D dV\), mass \(\iiint_D \delta\, dV\) (with density \(\delta\)), center of mass, moments of inertia, and probability. The change-of-variables theorem often makes apparently intractable integrals routine: for instance, \(\int_{-\infty}^\infty e^{-x^2}\, dx = \sqrt{\pi}\) follows by computing \(\left(\int_{-\infty}^\infty e^{-x^2}dx\right)^2 = \iint_{\mathbb{R}^2} e^{-(x^2+y^2)} dA\) in polar coordinates.

---

# Chapter 8: Vector Calculus

The final chapter draws together differentiation and integration in \(\mathbb{R}^2\) and \(\mathbb{R}^3\) into the three great integral theorems: Green's, Stokes', and the Divergence Theorem. Each theorem says the same thing at a deeper level of abstraction: the integral of a derivative over a region equals the integral of the original quantity over the boundary of that region. This unification is most transparent in the language of differential forms.

## Line Integrals

<div class="definition">

<strong>Definition 8.1 (Line Integral).</strong> Let \(\mathbf{F} : D \subseteq \mathbb{R}^n \to \mathbb{R}^n\) be a continuous vector field and \(\gamma : [a,b] \to D\) a \(C^1\) curve. The <em>line integral</em> of \(\mathbf{F}\) along \(\gamma\) is
\[
\int_\gamma \mathbf{F} \cdot d\mathbf{s} = \int_a^b \mathbf{F}(\gamma(t)) \cdot \gamma'(t)\, dt.
\]

</div>

Physically, this is the work done by the force \(\mathbf{F}\) in moving a particle along \(\gamma\). When \(\mathbf{F} = \nabla f\) for some potential function \(f\), the line integral depends only on the endpoints: \(\int_\gamma \nabla f \cdot d\mathbf{s} = f(\gamma(b)) - f(\gamma(a))\). This is the Fundamental Theorem for line integrals.

<div class="definition">

<strong>Definition 8.2 (Conservative Field).</strong> A vector field \(\mathbf{F}\) on a connected open set \(D\) is <em>conservative</em> if there exists \(f : D \to \mathbb{R}\) with \(\mathbf{F} = \nabla f\). The function \(f\) is called a <em>potential function</em> for \(\mathbf{F}\).

</div>

On a simply connected domain, \(\mathbf{F}\) is conservative if and only if \(\operatorname{curl} \mathbf{F} = \mathbf{0}\) (in \(\mathbb{R}^3\)) or \(\partial F_1/\partial y = \partial F_2/\partial x\) (in \(\mathbb{R}^2\)).

## Green's Theorem

Green's theorem is the two-dimensional case of Stokes' theorem. It relates a line integral around a closed curve to a double integral over the enclosed region, converting a boundary measurement into a bulk measurement.

<div class="theorem">

<strong>Theorem 8.3 (Green's Theorem).</strong> Let \(D \subseteq \mathbb{R}^2\) be a compact region with piecewise smooth boundary \(\partial D\) oriented counterclockwise. If \(P, Q : D \to \mathbb{R}\) are \(C^1\), then
\[
\oint_{\partial D} P\, dx + Q\, dy = \iint_D \left(\frac{\partial Q}{\partial x} - \frac{\partial P}{\partial y}\right) dA.
\]

</div>

*Geometric meaning.* The integrand \(\partial Q/\partial x - \partial P/\partial y\) is the \(z\)-component of \(\operatorname{curl} \mathbf{F}\), where \(\mathbf{F} = (P, Q, 0)\). Green's theorem says: the circulation of \(\mathbf{F}\) around the boundary equals the total vorticity inside the region.

*Proof (sketch, for a rectangle).* For \(D = [a,b] \times [c,d]\), the double integral of \(\partial Q/\partial x\) over \(D\) equals, by Fubini and the Fundamental Theorem of Calculus,
\[
\int_c^d [Q(b,y) - Q(a,y)]\, dy,
\]
which is exactly the contribution of the right and left edges to \(\oint P\, dx + Q\, dy\). The term \(\partial P/\partial y\) handles the top and bottom edges. For general regions, decompose into rectangles and use additivity. \(\square\)

As corollaries, Green's theorem gives formulas for the area of a region:
\[
\operatorname{Area}(D) = \oint_{\partial D} x\, dy = -\oint_{\partial D} y\, dx = \frac{1}{2}\oint_{\partial D} x\, dy - y\, dx.
\]

## Stokes' Theorem and the Divergence Theorem

These theorems generalise Green's theorem to three dimensions: Stokes' theorem to surfaces in \(\mathbb{R}^3\), and the Divergence Theorem to solid regions.

<div class="theorem">

<strong>Theorem 8.4 (Stokes' Theorem).</strong> Let \(S\) be an oriented \(C^2\) surface in \(\mathbb{R}^3\) with piecewise smooth boundary \(\partial S\) oriented consistently with \(S\). If \(\mathbf{F} : D \to \mathbb{R}^3\) is \(C^1\) on an open set containing \(S\), then
\[
\oint_{\partial S} \mathbf{F} \cdot d\mathbf{s} = \iint_S (\operatorname{curl} \mathbf{F}) \cdot d\mathbf{S},
\]
where \(\operatorname{curl} \mathbf{F} = \nabla \times \mathbf{F}\).

</div>

*Geometric meaning.* The circulation of \(\mathbf{F}\) around the boundary \(\partial S\) equals the total flux of the curl of \(\mathbf{F}\) through \(S\). Physically, if \(\mathbf{F}\) is a velocity field, Stokes' theorem says the net circulation at the boundary equals the integrated vorticity across the surface.

<div class="theorem">

<strong>Theorem 8.5 (Divergence Theorem, Gauss's Theorem).</strong> Let \(E \subseteq \mathbb{R}^3\) be a compact region with piecewise smooth outward-oriented boundary \(\partial E\). If \(\mathbf{F} : D \to \mathbb{R}^3\) is \(C^1\) on an open set containing \(E\), then
\[
\oiint_{\partial E} \mathbf{F} \cdot d\mathbf{S} = \iiint_E \operatorname{div} \mathbf{F}\, dV,
\]
where \(\operatorname{div} \mathbf{F} = \nabla \cdot \mathbf{F} = \partial F_1/\partial x + \partial F_2/\partial y + \partial F_3/\partial z\).

</div>

*Geometric meaning.* The total flux of \(\mathbf{F}\) outward through the boundary of \(E\) equals the total divergence (net source density) inside \(E\). In fluid mechanics, this says: the net outflow through the surface equals the total rate of creation (or compression) of fluid inside.

## A Brief Introduction to Differential Forms

The three integral theorems — Fundamental Theorem, Green's, Stokes', Divergence — are instances of a single master theorem. The language that unifies them is the theory of differential forms.

<div class="definition">

<strong>Definition 8.6 (Differential Forms).</strong> A <em>\(k\)-form</em> on \(\mathbb{R}^n\) is an expression that can be integrated over oriented \(k\)-dimensional surfaces. The basic building blocks are:
- <em>0-forms</em>: smooth functions \(f\).
- <em>1-forms</em>: expressions \(\omega = f_1\, dx_1 + \cdots + f_n\, dx_n\), integrated over curves.
- <em>2-forms</em>: expressions \(\omega = \sum_{i<j} f_{ij}\, dx_i \wedge dx_j\), integrated over surfaces; here \(dx_i \wedge dx_j\) is the signed area element.
- <em>\(k\)-forms</em> generally: antisymmetric expressions in \(k\) differentials.

</div>

<div class="definition">

<strong>Definition 8.7 (Exterior Derivative).</strong> The <em>exterior derivative</em> \(d\) maps \(k\)-forms to \((k+1)\)-forms. For a 0-form (function) \(f\):
\[
df = \frac{\partial f}{\partial x_1}\, dx_1 + \cdots + \frac{\partial f}{\partial x_n}\, dx_n.
\]
For a \(k\)-form \(\omega = \sum_I f_I\, dx_I\), we set \(d\omega = \sum_I df_I \wedge dx_I\). The key algebraic fact is \(d \circ d = 0\), i.e., \(d^2 = 0\).

</div>

Notice that \(d^2 = 0\) encodes the commutativity of mixed partials: the identity \(d(df) = 0\) is precisely \(\partial^2 f/\partial x_i \partial x_j = \partial^2 f/\partial x_j \partial x_i\).

<div class="theorem">

<strong>Theorem 8.8 (Generalised Stokes' Theorem).</strong> Let \(\omega\) be a smooth \((k-1)\)-form and \(M\) an oriented \(k\)-dimensional manifold with boundary \(\partial M\). Then
\[
\int_M d\omega = \int_{\partial M} \omega.
\]

</div>

Each classical theorem is a specialisation of this statement:
- \(k=1\), \(M\) a curve, \(\omega = f\): Fundamental Theorem of Calculus.
- \(k=2\), \(M \subseteq \mathbb{R}^2\), \(\omega = P\, dx + Q\, dy\): Green's Theorem.
- \(k=2\), \(M\) a surface in \(\mathbb{R}^3\), \(\omega\) a 1-form: Stokes' Theorem.
- \(k=3\), \(M\) a solid in \(\mathbb{R}^3\), \(\omega\) a 2-form: Divergence Theorem.

The identity \(d^2 = 0\) implies that every exact form (\(\omega = d\eta\)) is closed (\(d\omega = 0\)). The converse — whether every closed form is exact — is a topological question answered by de Rham cohomology, which measures holes in the domain. This is where multivariable calculus merges into algebraic topology.

---

<div class="remark">

<strong>Looking ahead.</strong> The material in these notes is the foundation for PMATH 351 (Real Analysis) and PMATH 365 (Differential Geometry). The rigorous treatment of integration theory, including the Lebesgue integral and the full proof of the change-of-variables theorem in complete generality, appears in PMATH 450 (Lebesgue Integration and Fourier Analysis). The generalised Stokes' theorem on manifolds is developed in detail in PMATH 465/665 (Differential Geometry). The Inverse and Implicit Function Theorems reappear as foundational tools in the theory of smooth manifolds, Lie groups, and differential topology.

</div>
