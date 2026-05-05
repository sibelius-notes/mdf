---
why: |
  The reference model for every other `-rest` file in this chapter. Six offerings, six chapters, each at textbook depth with definitions, theorems, and worked examples from the standard public references for that topic.
made_up: true
title: "CO 759: Topics in Discrete Optimization"
subjects: "CO"
---

*These notes synthesize material from six instances of CO 759 at the University of Waterloo, a graduate topics course whose subject matter rotates each term. The instances covered here are: Joseph Cheriyan's Spring 2014 offering on Spectral Methods in Graph Algorithms; William Cook's Winter 2015 offering on Computational Discrete Optimization; Ricardo Fukasawa's Winter 2016 offering on Integer Programming; William Cook's Winter 2018 offering on Deep Learning from an Optimization Perspective; the Fall 2019 instance on Optimization Under Uncertainty; and the Spring 2024 instance on Approximation Algorithms and Hardness. Because no single textbook covers the union of these topics, the exposition draws on the standard references for each chapter, all of which are publicly available.*

**Sources.** Daniel Spielman and Shang-Hua Teng, *Spectral sparsification of graphs* and *Nearly-linear time algorithms for graph partitioning*, available on arXiv; Luca Trevisan, *Lecture notes on graph partitioning, expanders and spectral methods*, free on the author's Berkeley/Bocconi site; Alexander Schrijver, *Combinatorial Optimization: Polyhedra and Efficiency* (Springer, 2003); George Nemhauser and Laurence Wolsey, *Integer and Combinatorial Optimization* (Wiley, 1988); Laurence Wolsey, *Integer Programming* (Wiley, 1998); Ian Goodfellow, Yoshua Bengio and Aaron Courville, *Deep Learning* (MIT Press, 2016, free at deeplearningbook.org); Stephen Boyd and Lieven Vandenberghe, *Convex Optimization* (Cambridge University Press, 2004, free PDF on Boyd's Stanford page); Aharon Ben-Tal, Laurent El Ghaoui and Arkadi Nemirovski, *Robust Optimization* (Princeton University Press, 2009); Vijay Vazirani, *Approximation Algorithms* (Springer, 2001); David Williamson and David Shmoys, *The Design of Approximation Algorithms* (Cambridge University Press, 2011, free PDF on the authors' page).

---

# Chapter 1: Spectral Methods in Graph Algorithms

Taught at UW as CO 759 in Spring 2014 by Joseph Cheriyan.

The premise of spectral graph theory is that the eigenvalues and eigenvectors of matrices naturally associated to a graph — the adjacency matrix, the (normalized or unnormalized) Laplacian, the transition matrix of the simple random walk — encode deep combinatorial information. One can read off connectivity, expansion, mixing time of random walks, the existence of good cuts and clusters, and the quality of various semidefinite relaxations of NP-hard partitioning problems. The course traced a path from the basic linear algebra of the Laplacian through Cheeger's inequality, expander graphs, the Spielman--Teng nearly-linear-time Laplacian solver, and on to spectral clustering and the Goemans--Williamson semidefinite programming approach to MAX-CUT.

## 1.1 The Laplacian and Its Spectrum

Let \(G = (V, E)\) be an undirected graph on \(n\) vertices with nonnegative edge weights \(w_{uv}\). The (unnormalized) Laplacian is the matrix

\[
L_G = D_G - A_G,
\]

where \(A_G\) is the weighted adjacency matrix and \(D_G\) is the diagonal degree matrix with \(D_{vv} = \sum_{u} w_{uv}\). The fundamental quadratic-form identity is

\[
x^\top L_G x = \sum_{\{u,v\} \in E} w_{uv} (x_u - x_v)^2,
\]

which immediately shows that \(L_G\) is positive semidefinite, that the all-ones vector \(\mathbf{1}\) lies in its kernel, and that the multiplicity of the eigenvalue \(0\) equals the number of connected components of \(G\).

<div class="definition">
<strong>Definition 1.1 (Laplacian eigenvalues).</strong> Order the eigenvalues of \(L_G\) as \(0 = \lambda_1 \le \lambda_2 \le \cdots \le \lambda_n\). The second-smallest eigenvalue \(\lambda_2(L_G)\) is called the <em>algebraic connectivity</em> or <em>Fiedler value</em>; the corresponding eigenvector is the <em>Fiedler vector</em>.
</div>

The normalized Laplacian \(\mathcal{L}_G = D_G^{-1/2} L_G D_G^{-1/2} = I - D_G^{-1/2} A_G D_G^{-1/2}\) has eigenvalues in \(\left[0, 2\right]\); its spectrum governs the mixing of the lazy random walk on \(G\). The Fiedler vector partitions \(V\) into two pieces by sign, and this is the prototypical spectral cut.

## 1.2 The Cheeger Inequality

The principal quantitative link between spectrum and combinatorial structure is Cheeger's inequality. For a subset \(S \subseteq V\) with \(0 < \operatorname{vol}(S) \le \operatorname{vol}(V)/2\), define the conductance \(\phi(S) = w(S, \bar S) / \operatorname{vol}(S)\), and let \(\phi(G) = \min_S \phi(S)\) be the conductance of the graph.

<div class="theorem">
<strong>Theorem 1.2 (Cheeger's Inequality).</strong> Let \(\lambda_2\) denote the second eigenvalue of the normalized Laplacian. Then

\[
\frac{\lambda_2}{2} \;\le\; \phi(G) \;\le\; \sqrt{2 \lambda_2}.
\]
</div>

The lower bound is a one-line consequence of the variational characterization of \(\lambda_2\) restricted to vectors orthogonal to \(D^{1/2}\mathbf{1}\). The upper bound is constructive: round the Fiedler vector by sweeping through the level sets and outputting the prefix of smallest conductance. This sweep cut is the workhorse of spectral partitioning.

<div class="remark">
<strong>Remark.</strong> Cheeger's inequality is tight: a cycle has \(\phi(G) \asymp 1/n\) and \(\lambda_2 \asymp 1/n^2\), so the square root cannot be improved without further assumptions. Higher-order Cheeger inequalities of Lee--Oveis Gharan--Trevisan relate \(\lambda_k\) to the existence of \(k\) disjoint sparse cuts.
</div>

## 1.3 Expanders and Their Constructions

A family of \(d\)-regular graphs \(\{G_n\}\) is said to be a family of <em>expanders</em> if there is a constant \(\varepsilon > 0\) with \(\phi(G_n) \ge \varepsilon\) for all \(n\); equivalently, by Cheeger, \(\lambda_2(\mathcal{L}_{G_n}) \ge \varepsilon^2/2\). The deepest expanders are <em>Ramanujan</em>: their nontrivial adjacency eigenvalues satisfy \(|\lambda| \le 2\sqrt{d-1}\), the Alon--Boppana lower bound. The Lubotzky--Phillips--Sarnak and Margulis constructions exhibit infinite Ramanujan families using number theory; the more elementary <em>zig-zag product</em> of Reingold--Vadhan--Wigderson produces (non-Ramanujan but constant-spectral-gap) expanders combinatorially and lies behind Reingold's \(\mathsf{SL} = \mathsf{L}\) theorem.

<div class="example">
<strong>Example 1.3 (Random walks on expanders).</strong> If \(G\) is a \(d\)-regular expander with second-largest adjacency eigenvalue \(\lambda \le \alpha d\) with \(\alpha < 1\), then a random walk of length \(t\) starting from any vertex puts probability at most \(\alpha^t\) above uniform on each vertex. This yields the expander Chernoff bound: sums of bounded functions evaluated along an expander walk concentrate almost as well as if the steps were independent samples, while using exponentially fewer random bits.
</div>

## 1.4 Laplacian Solvers and Spectral Sparsification

Spielman and Teng's program, completed in a series of papers from 2004 onward, gives algorithms that solve the linear system \(L_G x = b\) to relative accuracy \(\varepsilon\) in time \(\widetilde{O}(m \log(1/\varepsilon))\) where \(m = |E|\). The two pillars of the construction are <em>low-stretch spanning trees</em> and <em>spectral sparsifiers</em>.

<div class="definition">
<strong>Definition 1.4 (Spectral sparsifier).</strong> A weighted subgraph \(H\) of \(G\) is a <em>\(\varepsilon\)-spectral sparsifier</em> if for every \(x \in \mathbb{R}^V\),

\[
(1-\varepsilon) \, x^\top L_G x \;\le\; x^\top L_H x \;\le\; (1+\varepsilon) \, x^\top L_G x.
\]
</div>

The Spielman--Srivastava theorem produces such an \(H\) with \(O(n \log n / \varepsilon^2)\) edges by sampling each edge with probability proportional to its <em>effective resistance</em> in \(G\). Effective resistances are themselves computable from a Laplacian solver, leading to a virtuous recursion that powers nearly-linear-time algorithms for max-flow approximation and for sampling random spanning trees.

## 1.5 Spectral Clustering and SDP for MAX-CUT

The \(k\)-means heuristic applied to the rows of the matrix whose columns are the bottom \(k\) eigenvectors of \(\mathcal{L}_G\) is the standard spectral clustering algorithm; it can be analyzed via higher-order Cheeger inequalities.

For MAX-CUT, the Goemans--Williamson semidefinite relaxation replaces each binary variable \(x_v \in \{\pm 1\}\) by a unit vector \(u_v \in \mathbb{R}^n\) and maximizes \(\sum_{\{u,v\} \in E} w_{uv} (1 - u_u^\top u_v)/2\). After solving the SDP one rounds by drawing a uniform random hyperplane and assigning vertices according to which side they fall on. The crucial calculation is

\[
\Pr\!\left[ \operatorname{sgn}(g^\top u_u) \ne \operatorname{sgn}(g^\top u_v) \right] \;=\; \frac{\arccos(u_u^\top u_v)}{\pi},
\]

and the ratio between this and the SDP contribution is bounded below by the Goemans--Williamson constant \(\alpha_{GW} \approx 0.87856\).

<div class="theorem">
<strong>Theorem 1.5 (Goemans--Williamson).</strong> Hyperplane rounding of the MAX-CUT SDP achieves expected weight at least \(\alpha_{GW}\) times the optimum, where

\[
\alpha_{GW} = \min_{0 \le \theta \le \pi} \frac{2\theta/\pi}{1 - \cos\theta} \approx 0.87856.
\]
</div>

Khot's Unique Games Conjecture implies this constant is tight: no polynomial-time algorithm can achieve ratio \(\alpha_{GW} + \varepsilon\) for any \(\varepsilon > 0\), unless the conjecture fails.

---

# Chapter 2: Computational Discrete Optimization

Taught at UW as CO 759 in Winter 2015 by William Cook.

Where Chapter 1 used continuous (spectral) tools to attack discrete problems, the present chapter is firmly in the world of integer linear programming and its computational practice. William Cook is one of the architects of <em>Concorde</em>, the de facto exact solver for the symmetric travelling salesman problem, and the course wove together the theory of branch-and-cut with the engineering decisions that make it work in practice.

## 2.1 The IP Framework

A general (mixed-)integer linear program reads

\[
\min \, \{ c^\top x : A x \le b, \; x \ge 0, \; x_j \in \mathbb{Z} \text{ for } j \in I \}.
\]

Replacing the integrality constraint by \(x \in \mathbb{R}^n\) yields the <em>linear programming relaxation</em>; its optimum is a lower bound on the IP optimum. Branch-and-bound recursively splits the feasible region — typically by branching on a fractional variable \(x_j\) into the disjunction \(x_j \le \lfloor \bar x_j \rfloor \;\vee\; x_j \ge \lceil \bar x_j \rceil\) — and prunes nodes whose LP bound exceeds the best integer solution found so far.

<div class="definition">
<strong>Definition 2.1 (Cutting plane).</strong> A <em>cutting plane</em> for an integer program is a linear inequality \(\alpha^\top x \le \beta\) that is satisfied by every integer-feasible \(x\) but is violated by some fractional optimum of the LP relaxation. Adding cuts strengthens the relaxation without losing any integer-feasible point.
</div>

## 2.2 Branch-and-Cut and Modern Solvers

Branch-and-bound and cutting planes combine into branch-and-cut: at each node one solves the LP, generates cuts to tighten it, re-solves, and only branches when no further useful cut is found. Effective implementation relies on a constellation of techniques that the course examined in detail: presolve (probing, coefficient strengthening, bound propagation, symmetry detection), strong branching and pseudo-cost heuristics for variable selection, best-first vs. depth-first node selection, primal heuristics (feasibility pump, RINS, local branching), and warm-starting the LP via the dual simplex after fixing or relaxing variables.

<div class="example">
<strong>Example 2.2 (Symmetric TSP).</strong> The Dantzig--Fulkerson--Johnson formulation of TSP uses a binary variable \(x_e\) for each edge, the degree-two constraints \(\sum_{e \ni v} x_e = 2\) for every vertex, and the exponentially many <em>subtour elimination</em> constraints \(\sum_{e \in E(S)} x_e \le |S| - 1\) for every \(\emptyset \ne S \subsetneq V\). Subtour constraints are separated in polynomial time by min-cut computation on the support graph of the LP solution, so the LP relaxation is tractable despite having exponentially many constraints.
</div>

## 2.3 Concorde and the TSP

Concorde solves TSP instances by branch-and-cut on the subtour LP, augmented with families of <em>comb</em>, <em>clique-tree</em>, <em>bipartition</em>, and <em>local-cut</em> inequalities discovered through decades of polyhedral combinatorics. Heuristic primal solutions are produced by Lin--Kernighan and chained Lin--Kernighan. Cook documented in lectures the human-scale milestones: the 532-city problem (1954), the 7397-city VLSI instance (1995), and the 85,900-city pla85900 (2006). Today Concorde routinely proves optimality on instances with tens of thousands of cities.

<div class="remark">
<strong>Remark.</strong> The course's pedagogical principle — and one of Cook's recurring themes — is that the gap between the theoretical worst-case complexity of TSP (\(\mathsf{NP}\)-hard) and its practical solvability is enormous, mediated by the strength of the cutting planes. A typical TSPLIB instance has integrality gap below \(2\%\) on the subtour LP, so a few well-placed cuts suffice to close it.
</div>

## 2.4 Computational Practice

Beyond TSP the course covered general MILP solver architecture (CPLEX, Gurobi, SCIP), modelling languages (AMPL, JuMP), the role of the LP solver (primal/dual simplex vs. interior point, basis recovery), and case studies in vehicle routing, scheduling, network design, and protein folding. Students were expected to build, instrument, and benchmark their own branch-and-cut codes on small but nontrivial instances, with the explicit goal of internalizing the trade-offs that define modern combinatorial optimization.

---

# Chapter 3: Integer Programming

Taught at UW as CO 759 in Winter 2016 by Ricardo Fukasawa.

Where Chapter 2 emphasized algorithms and engineering, Fukasawa's offering of CO 759 took a polyhedral and theoretical perspective. The central object of study is the integer hull \(\operatorname{conv}\{x \in \mathbb{Z}^n : Ax \le b\}\) of a rational polyhedron, and the central question is how to describe — or at least usefully approximate — this convex hull by linear inequalities.

## 3.1 Integer Hulls and Valid Inequalities

<div class="definition">
<strong>Definition 3.1 (Valid inequality).</strong> An inequality \(\alpha^\top x \le \beta\) is <em>valid</em> for a set \(S \subseteq \mathbb{R}^n\) if every \(x \in S\) satisfies it. A valid inequality for \(S\) is a <em>facet</em> of \(\operatorname{conv}(S)\) if the set \(\{x \in \operatorname{conv}(S) : \alpha^\top x = \beta\}\) is a face of dimension \(\dim \operatorname{conv}(S) - 1\).
</div>

For a rational polyhedron \(P = \{x : Ax \le b\}\), Meyer's theorem guarantees that the integer hull \(P_I = \operatorname{conv}(P \cap \mathbb{Z}^n)\) is itself a rational polyhedron, but the number of facets of \(P_I\) may be exponential in the size of \(A\) and \(b\), and computing them is intractable in general.

<div class="theorem">
<strong>Theorem 3.2 (Chvátal--Gomory).</strong> Let \(P = \{x : Ax \le b\}\) be a rational polyhedron and let \(u \ge 0\) be a vector of multipliers such that \(u^\top A \in \mathbb{Z}^n\). Then the inequality \(u^\top A \, x \le \lfloor u^\top b \rfloor\) is valid for \(P_I\). Iterating this <em>Chvátal closure</em> finitely many times produces \(P_I\) for any rational polyhedron.
</div>

The number of rounds of closure needed — the <em>Chvátal rank</em> — can be enormous (Eisenbrand--Schulz showed an \(n^2\)-bound and matching examples), but for important combinatorial polytopes (matching, stable set in perfect graphs) a single round suffices.

## 3.2 Gomory Cuts and Mixed-Integer Cuts

Gomory's mixed-integer cut, derived from a row of the simplex tableau in which the basic variable is fractional, is the workhorse of practical IP solvers. Given a row \(x_B = \bar a_0 - \sum_{j \in N} \bar a_j x_j\) with \(\bar a_0 \notin \mathbb{Z}\), let \(f_0 = \bar a_0 - \lfloor \bar a_0 \rfloor\) and \(f_j = \bar a_j - \lfloor \bar a_j \rfloor\). The Gomory mixed-integer cut is

\[
\sum_{j : f_j \le f_0} f_j \, x_j \;+\; \sum_{j : f_j > f_0} \frac{f_0 (1 - f_j)}{1 - f_0} \, x_j \;\ge\; f_0,
\]

valid for the mixed-integer hull and violated by the current LP optimum.

<div class="remark">
<strong>Remark.</strong> Gomory cuts were considered numerically unstable until Balas, Ceria, Cornuéjols and Natraj demonstrated in 1996 that, generated in rounds from the optimal simplex tableau and added to the LP, they dramatically accelerate convergence on hard MILP instances. Modern solvers spend a substantial fraction of their cut-generation budget on Gomory family cuts (mixed-integer, mixed-integer rounding, lift-and-project).
</div>

## 3.3 Branch-and-Cut Revisited

Fukasawa's course treated branch-and-cut from the polyhedral side: how families of cuts (knapsack covers, flow covers, clique inequalities for the stable set polytope, blossom inequalities for matching) arise from the structure of specific combinatorial problems. The general principle is that a strong relaxation comes not from one master family but from a careful library of cut classes, each tuned to a constraint type appearing in the model.

<div class="example">
<strong>Example 3.3 (Cover inequalities).</strong> For a knapsack constraint \(\sum_{j \in N} a_j x_j \le b\) with \(x_j \in \{0,1\}\), a subset \(C \subseteq N\) is a <em>cover</em> if \(\sum_{j \in C} a_j > b\), and the cover inequality \(\sum_{j \in C} x_j \le |C| - 1\) is valid. <em>Lifting</em> the cover by computing maximal coefficients on \(N \setminus C\) yields a stronger and often facet-defining inequality.
</div>

## 3.4 Lattice and Group Approaches

Fukasawa also touched on the group-theoretic view of IP — Gomory's corner polyhedron, the master cyclic group problem, and the more recent rediscovery of these ideas in the cutting-plane theory of Cornuéjols, Conforti, and Zambelli. Integer programming with a fixed number of variables is solvable in polynomial time by Lenstra's algorithm via lattice basis reduction (LLL), an algorithmic high point combining geometry of numbers with convex optimization.

---

# Chapter 4: Deep Learning from an Optimization Perspective

Taught at UW as CO 759 in Winter 2018 by William Cook.

Cook's 2018 offering took the unusual step, for a C&O graduate course, of treating deep learning as an instance of large-scale nonconvex optimization. The lectures followed the structure of Goodfellow, Bengio and Courville's textbook, with emphasis on the optimization landscape, training algorithms, and the empirical generalization of overparameterized networks.

## 4.1 Architectures as Compositions

A feedforward neural network with \(L\) layers computes \(f(x; \theta) = W_L \, \sigma(W_{L-1} \, \sigma(\cdots \sigma(W_1 x + b_1) \cdots) + b_{L-1}) + b_L\), where \(\sigma\) is a fixed nonlinearity (rectified linear unit \(\sigma(z) = \max(z, 0)\), sigmoid, tanh) applied componentwise and \(\theta = (W_\ell, b_\ell)_{\ell=1}^L\) collects the parameters. Convolutional networks restrict \(W_\ell\) to be a Toeplitz / block-Toeplitz matrix realizing convolution with a small kernel; recurrent networks tie \(W_\ell\) across time steps; attention layers compute \(\operatorname{softmax}(QK^\top/\sqrt{d}) V\) for query, key, value projections.

## 4.2 Empirical Risk Minimization and SGD

Given training data \((x_i, y_i)_{i=1}^N\) and a per-sample loss \(\ell(f(x_i; \theta), y_i)\) (squared error for regression, cross-entropy for classification), the parameters are fit by minimizing the empirical risk

\[
L(\theta) = \frac{1}{N} \sum_{i=1}^N \ell(f(x_i; \theta), y_i),
\]

a deeply nonconvex function of \(\theta\) for any nontrivial network depth. The training algorithm of choice is mini-batch stochastic gradient descent: at each step a random batch \(B \subseteq \{1, \ldots, N\}\) is drawn and the parameters are updated by

\[
\theta_{t+1} = \theta_t - \eta_t \cdot \frac{1}{|B|} \sum_{i \in B} \nabla_\theta \ell(f(x_i; \theta_t), y_i),
\]

with step size (or <em>learning rate</em>) schedule \(\eta_t\) and possibly with momentum, Nesterov acceleration, or adaptive per-coordinate scaling (AdaGrad, RMSProp, Adam).

<div class="theorem">
<strong>Theorem 4.1 (Convergence of SGD, convex case).</strong> If \(L\) is convex with \(G\)-bounded stochastic gradient and step sizes \(\eta_t = c/\sqrt{t}\), then \(\mathbb{E}\!\left[L(\bar\theta_T)\right] - L^\star = O(G/\sqrt{T})\), where \(\bar\theta_T\) is the average iterate. For \(L\) merely smooth (not convex), one has \(\mathbb{E}\!\left[\|\nabla L(\theta_t)\|^2\right] \to 0\) with constant step size proportional to \(1/L\)-smoothness.
</div>

For nonconvex deep networks no theorem of comparable strength is known; the empirical observation, which the course examined at length, is that SGD with appropriate initialization (He, Glorot) and normalization (batch norm, layer norm) reliably finds parameters with low training loss and good test-set performance.

## 4.3 Backpropagation

Backpropagation is the chain rule organized around the computation graph. Forward propagation computes activations \(a_\ell = \sigma(W_\ell a_{\ell-1} + b_\ell)\); backward propagation computes the loss gradient with respect to each parameter by

\[
\delta_L = \nabla_{a_L} \ell, \qquad \delta_\ell = (W_{\ell+1}^\top \delta_{\ell+1}) \odot \sigma'(W_\ell a_{\ell-1} + b_\ell),
\]

then \(\nabla_{W_\ell} \ell = \delta_\ell a_{\ell-1}^\top\) and \(\nabla_{b_\ell} \ell = \delta_\ell\). Reverse-mode automatic differentiation, of which backpropagation is a special case, computes gradients of any composition of differentiable operations at cost within a constant factor of evaluating the function itself.

<div class="remark">
<strong>Remark (Vanishing and exploding gradients).</strong> In deep networks the product structure \(\delta_\ell = (\prod_{k > \ell} W_k^\top D_k) \delta_L\), where \(D_k\) is diagonal containing \(\sigma'\) values, causes gradients to either vanish or explode unless the matrices are carefully scaled. The introduction of ReLU activations, residual connections (\(a_\ell = \sigma(W_\ell a_{\ell-1}) + a_{\ell-1}\)), and normalization layers were the key engineering breakthroughs of the 2012--2017 era, enabling training of networks with hundreds of layers.
</div>

## 4.4 Generalization

Classical learning theory bounds the generalization gap by a complexity measure (VC dimension, Rademacher complexity, covering number) of the hypothesis class. For modern overparameterized networks these bounds are vacuous: the network has more parameters than training points and can fit arbitrary labels. Yet networks trained by SGD generalize well on natural data. Cook's lectures surveyed competing explanations — implicit regularization of SGD toward minimum-norm or flat minima, the neural tangent kernel limit (Jacot--Gabriel--Hongler 2018) in which infinite-width networks behave as kernel regressors, double descent (Belkin et al.), and PAC-Bayes bounds — without endorsing any single resolution. The honest position taken by the instructor was that the optimization-generalization story for deep learning remains an active research frontier, of considerable interest to the C&O community precisely because of its blend of high-dimensional convex relaxation, nonconvex landscape geometry, and statistical learning theory.

---

# Chapter 5: Optimization Under Uncertainty

Taught at UW as CO 759 in Fall 2019.

Most optimization models in practice involve parameters — demands, prices, capacities, travel times, returns — that are not known exactly when the decision is made. <em>Optimization under uncertainty</em> is the family of frameworks that turn this observation into formal models. The course traced three main paradigms: stochastic programming, robust optimization, and the more recent distributionally robust optimization.

## 5.1 Stochastic Programming and Two-Stage Recourse

The two-stage stochastic linear program with recourse takes the form

\[
\min_{x \in X} \; c^\top x + \mathbb{E}_{\xi}\!\left[ Q(x, \xi) \right],
\]

where the first-stage decision \(x\) must be made before the random vector \(\xi\) is observed, and the recourse function

\[
Q(x, \xi) = \min_{y \ge 0} \, \{ q(\xi)^\top y : W y = h(\xi) - T(\xi) x \}
\]

captures the cost of optimally adjusting in the second stage. When \(\xi\) takes finitely many values \(\xi^1, \ldots, \xi^S\) with probabilities \(p_s\), the problem is the deterministic equivalent

\[
\min \; c^\top x + \sum_{s=1}^S p_s \, q(\xi^s)^\top y^s \quad \text{s.t. } x \in X, \; W y^s = h(\xi^s) - T(\xi^s) x, \; y^s \ge 0,
\]

a (large) linear program with block-angular structure that admits decomposition by Benders' (or L-shaped) algorithm. Sample average approximation replaces the unknown distribution by an empirical sample of Monte-Carlo scenarios; consistency and convergence-rate results (Shapiro--Dentcheva--Ruszczyński) bound the optimality gap as a function of sample size and problem complexity. Multistage extensions — where decisions and observations alternate over a horizon — introduce non-anticipativity constraints and lead to algorithms such as stochastic dual dynamic programming (Pereira--Pinto), originally developed for hydroelectric reservoir management.

## 5.2 Robust Optimization

Robust optimization replaces a probabilistic description of \(\xi\) by a deterministic <em>uncertainty set</em> \(\mathcal{U}\) and seeks a solution that is feasible (and optimal in worst case) for every realization in \(\mathcal{U}\):

\[
\min_x \; \max_{\xi \in \mathcal{U}} \; f(x, \xi) \quad \text{s.t. } g_i(x, \xi) \le 0 \text{ for all } \xi \in \mathcal{U}.
\]

The principal contribution of Ben-Tal, El Ghaoui and Nemirovski (1998 onward) is the realization that for many natural choices of \(\mathcal{U}\) the robust counterpart is itself a tractable convex program. A linear constraint \(a^\top x \le b\) with \(a\) ranging over an ellipsoid \(\{a_0 + Pu : \|u\|_2 \le 1\}\) becomes the second-order cone constraint \(a_0^\top x + \|P^\top x\|_2 \le b\); over a polyhedral budget set it becomes a linear program; over a positive semidefinite uncertainty set it becomes an SDP.

<div class="example">
<strong>Example 5.1 (Bertsimas--Sim budget).</strong> The budget uncertainty set \(\mathcal{U} = \{a : a_j = \bar a_j + \hat a_j z_j, \; |z_j| \le 1, \; \sum_j |z_j| \le \Gamma\}\) interpolates between the nominal problem (\(\Gamma = 0\)) and the box-robust problem (\(\Gamma = n\)). For each constraint at most \(\Gamma\) coefficients deviate to their worst values; the robust counterpart is a linear program with \(O(n)\) extra variables, and probabilistic guarantees scale as \(\exp(-\Gamma^2/2n)\) for symmetric independent perturbations.
</div>

## 5.3 Distributionally Robust Optimization

Distributionally robust optimization (DRO) hedges against ambiguity in the distribution of \(\xi\) itself: one specifies an <em>ambiguity set</em> \(\mathcal{P}\) of plausible distributions and solves

\[
\min_x \; \sup_{\mathbb{P} \in \mathcal{P}} \, \mathbb{E}_\mathbb{P}[f(x, \xi)].
\]

Two ambiguity sets dominate the literature: moment-based sets (distributions matching a prescribed mean and covariance), which lead to SDP reformulations via duality, and Wasserstein balls around an empirical distribution, which under mild conditions yield convex programs with explicit regularization structure. Mohajerin Esfahani--Kuhn (2018) showed that Wasserstein-DRO with linear loss is equivalent to a regularized empirical risk minimization, exposing a deep link between DRO and statistical learning.

<div class="remark">
<strong>Remark.</strong> The three paradigms are complementary rather than competing. Stochastic programming is appropriate when reliable distribution information is available; robust optimization when only support information is trustworthy; DRO when one has limited samples and seeks finite-sample performance guarantees. The Fall 2019 course argued that the choice should reflect the actual epistemic state of the modeler, not algorithmic convenience.
</div>

---

# Chapter 6: Approximation Algorithms and Hardness

Taught at UW as CO 759 in Spring 2024.

The final chapter of this composite turns to the question that motivates nearly every relaxation in this course: when an integer program is NP-hard, can we at least guarantee a solution within a provable factor of optimal in polynomial time, and what intrinsic limits does complexity theory place on such guarantees?

## 6.1 Approximation Ratios

For a minimization problem with optimum \(\mathrm{OPT}\), a polynomial-time algorithm is an <em>\(\alpha\)-approximation</em> (\(\alpha \ge 1\)) if it always returns a solution of cost at most \(\alpha \cdot \mathrm{OPT}\). For maximization the convention is symmetric with \(\alpha \le 1\). Classical results include the \(2\)-approximation for vertex cover via LP rounding or maximal matching, the \(\ln n\)-approximation for set cover by the greedy algorithm, the \(3/2\)-approximation for metric TSP by Christofides--Serdyukov, and the \((1 - 1/e)\)-approximation for max-coverage and submodular maximization.

<div class="theorem">
<strong>Theorem 6.1 (Goemans--Williamson, restated).</strong> For MAX-CUT, hyperplane rounding of the SDP relaxation achieves approximation ratio \(\alpha_{GW} \approx 0.87856\). Under the Unique Games Conjecture, no polynomial-time algorithm achieves ratio \(\alpha_{GW} + \varepsilon\) for any \(\varepsilon > 0\).
</div>

## 6.2 The PCP Theorem and Inapproximability

The watershed result of computational complexity since Cook--Levin is the PCP theorem of Arora--Lund--Motwani--Sudan--Szegedy (1992) and its proof simplification by Dinur (2007).

<div class="theorem">
<strong>Theorem 6.2 (PCP Theorem).</strong> Every language in \(\mathsf{NP}\) has a probabilistically checkable proof system in which the verifier reads only \(O(1)\) bits of the proof, uses \(O(\log n)\) random bits, accepts every correct proof of a yes-instance with probability \(1\), and accepts any purported proof of a no-instance with probability at most \(1/2\).
</div>

The combinatorial restatement is that <em>gap-MAX-3SAT</em> is NP-hard: given a 3-SAT instance one cannot distinguish in polynomial time, unless \(\mathsf{P} = \mathsf{NP}\), between the case in which all clauses are satisfiable and the case in which at most a \((1-\varepsilon)\)-fraction can be simultaneously satisfied. From this single hardness gap one derives by reductions inapproximability lower bounds for nearly every NP-hard optimization problem: vertex cover (\(7/6 - \varepsilon\), Dinur--Safra; \(2 - \varepsilon\) under UGC), independent set (\(n^{1-\varepsilon}\), Håstad), MAX-3SAT (\(7/8 + \varepsilon\), Håstad and tight by random assignment), set cover (\((1-\varepsilon)\ln n\), Feige and tight up to constants), Steiner tree, asymmetric TSP, and many others.

## 6.3 Hardness Reductions

The Spring 2024 course developed the standard reduction toolkit: gap-preserving reductions and the PCP composition theorem; the Long Code and Fourier analysis on the Boolean cube as the engine of Håstad's optimal inapproximability results; the Unique Games Conjecture as a clean source of tight hardness for problems whose canonical SDP is conjectured optimal (MAX-CUT, vertex cover, all 2-CSPs by the Raghavendra dichotomy); and the more recent <em>2-to-2 Games Theorem</em> of Khot--Minzer--Safra (2018) and its consequences. Methodologically the chapter served as a counterweight to the algorithmic optimism of Chapters 2 and 3: even with the most sophisticated cutting planes, decomposition methods, and SDP relaxations at our disposal, complexity theory marks out inviolable limits to what polynomial-time algorithms can achieve, and the value of an approximation guarantee is precisely that it is provable on every instance, not merely typical of the ones encountered in benchmarks.
