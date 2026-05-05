---
made_up: true
title: "CO 749: Topics in Graph Theory"
subjects: "CO"
---

*These notes consolidate two CO 749 instances offered at the University of Waterloo as topics courses in graph theory: Jim Geelen's Fall 2016 lecture course on graph minors (the only instance with a recoverable public outline, comprising 24 video lectures on the proof of the Robertson-Seymour Graph Minors Structure Theorem) and a Fall 2024 follow-up listing of CO 749 with topic Graph Minors but no archived outline. Because no UWaterloo internal materials, recorded notes, or LEARN content are reproduced, the exposition is reconstructed from public sources. Primary references include the Robertson-Seymour series, Graph Minors I-XXIII (Journal of Combinatorial Theory, Series B), Reinhard Diestel's Graph Theory (5th edition, Springer GTM 173, with a free draft on the author's website and an extensive Chapter 12 on minors), Lovász's classical paper Graph Theory and Probability and related survey work, the Geelen-Gerards-Whittle papers on matroid minors available on the arXiv, the tree-width chapters of Cygan et al.'s Parameterized Algorithms (Springer), and public lecture notes circulated at MIT and Cambridge.*

---

# Chapter 1: Graph Minors and the Structure Theorem (Geelen, F16)

Taught at UW as CO 749 in Fall 2016 by Jim Geelen. The course was a self-contained graduate exposition of the proof of the Robertson-Seymour Graph Minors Structure Theorem, drawing on Geelen's collaborative work with Gerards and Whittle on the analogous matroid minors program and on the more recent simplifications of Kawarabayashi and Wollan. The arc of the lectures traces a single grand result --- the qualitative description of all graphs that exclude a fixed minor --- and the sustained development of the technical machinery (tree-width, branch-width, tangles, walls, flat embeddings, vortices, surface grids) that the proof requires.

## 1.1 The minor relation and the well-quasi-ordering theorem

A graph \(H\) is a <em>minor</em> of a graph \(G\), written \(H \preceq G\), if \(H\) can be obtained from a subgraph of \(G\) by contracting edges. Equivalently, there is a family of pairwise vertex-disjoint, connected subgraphs \(\{B_v : v \in V(H)\}\) of \(G\) (the <em>branch sets</em> or <em>model</em> of \(H\) in \(G\)) such that whenever \(uv \in E(H)\) there is an edge of \(G\) joining \(B_u\) and \(B_v\). The minor relation is reflexive and transitive, and once parallel edges and loops are suppressed it is a partial order on isomorphism classes of finite simple graphs.

<div class="definition">
<strong>Definition 1.1 (Minor and topological minor).</strong> Let \(G, H\) be finite graphs. We say \(H\) is a <em>minor</em> of \(G\) if there exist pairwise vertex-disjoint connected subgraphs \(B_v \subseteq G\) indexed by \(v \in V(H)\) such that for every \(uv \in E(H)\) some edge of \(G\) has one end in \(B_u\) and the other in \(B_v\). We say \(H\) is a <em>topological minor</em> of \(G\) (or \(G\) contains a <em>subdivision</em> of \(H\)) if some subdivision of \(H\) is isomorphic to a subgraph of \(G\). Every topological minor is a minor; the converse holds when \(\Delta(H) \le 3\) but fails in general.
</div>

The motivating philosophy of the entire theory is that "excluding a fixed minor" is a robust hypothesis that imposes strong global structure on a graph. The first concrete evidence for this is Wagner's 1937 reformulation of Kuratowski's theorem.

<div class="theorem">
<strong>Theorem 1.2 (Wagner 1937).</strong> A finite graph \(G\) is planar if and only if \(G\) contains neither \(K_5\) nor \(K_{3,3}\) as a minor.
</div>

The historical trajectory from Wagner to Robertson-Seymour begins with the question whether <em>every</em> minor-closed family (a class of graphs closed under taking minors) admits a similar finite description. Wagner conjectured this in the 1960s. The conjecture was settled in the affirmative by Robertson and Seymour over the course of the twenty-three-paper Graph Minors series.

<div class="theorem">
<strong>Theorem 1.3 (Robertson-Seymour Graph Minors Theorem; Wagner's conjecture).</strong> The class of finite graphs is well-quasi-ordered under the minor relation \(\preceq\): in any infinite sequence \(G_1, G_2, G_3, \ldots\) of finite graphs there exist indices \(i < j\) with \(G_i \preceq G_j\). Equivalently, every minor-closed family \(\mathcal{F}\) of finite graphs has a finite set \(\mathrm{Forb}(\mathcal{F})\) of <em>excluded minors</em>, and \(G \in \mathcal{F}\) iff \(G\) contains no member of \(\mathrm{Forb}(\mathcal{F})\) as a minor.
</div>

The depth of this theorem cannot be overstated. It is purely existential --- the proof gives no bound on the number or size of the excluded minors --- and yet it implies, for instance, that the class of graphs embeddable on any fixed surface is characterized by finitely many forbidden minors, that the class of knotlessly embeddable graphs in \(\mathbb{R}^3\) is so characterized, and that membership in any minor-closed family can be tested in polynomial (indeed cubic) time.

<div class="remark">
<strong>Remark 1.4 (Why "well-quasi-ordering" is the right concept).</strong> A quasi-order \(\preceq\) on a set \(X\) is a <em>well-quasi-order</em> (wqo) if every infinite sequence \(x_1, x_2, \ldots\) in \(X\) contains an infinite ascending subsequence \(x_{i_1} \preceq x_{i_2} \preceq \cdots\); equivalently, \(X\) contains no infinite antichain and no infinite strictly descending chain. Two-step lemmas like Higman's lemma (the Kruskal-style result that finite sequences over a wqo are wqo under subsequence embedding) and Kruskal's tree theorem (finite trees are wqo under topological minor embedding) furnish the local building blocks; the Robertson-Seymour theorem is the analogous global statement for arbitrary graphs and is much harder.
</div>

The lectures opened (Lecture 1) with the precise definition of the minor relation and the dual notion that organizes the entire proof: tree-width.

## 1.2 Tree-width, branch-width, and tangles

Tree-width measures how "tree-like" a graph is. It was introduced by Halin (1976) and rediscovered by Robertson and Seymour, who recognized its centrality.

<div class="definition">
<strong>Definition 1.5 (Tree-decomposition; tree-width).</strong> A <em>tree-decomposition</em> of a graph \(G\) is a pair \((T, \{X_t\}_{t \in V(T)})\) where \(T\) is a tree and each \(X_t \subseteq V(G)\) (called a <em>bag</em>) such that
<ol>
<li>\(\bigcup_{t \in V(T)} X_t = V(G)\);</li>
<li>for every edge \(uv \in E(G)\) there is some \(t\) with \(\{u,v\} \subseteq X_t\);</li>
<li>for every \(v \in V(G)\) the set \(\{t : v \in X_t\}\) induces a connected subtree of \(T\).</li>
</ol>
The <em>width</em> of the decomposition is \(\max_t |X_t| - 1\). The <em>tree-width</em> \(\mathrm{tw}(G)\) is the minimum width over all tree-decompositions of \(G\).
</div>

Trees themselves have tree-width \(1\); cycles have tree-width \(2\); the \(k \times k\) grid \(\boxtimes_k\) has tree-width exactly \(k\); and \(K_n\) has tree-width \(n-1\). One useful equivalent is via <em>brambles</em>: \(\mathrm{tw}(G) \ge k\) iff \(G\) contains a bramble of order \(k+1\), where a bramble is a family of pairwise touching connected subgraphs and its order is the minimum size of a hitting set.

<div class="definition">
<strong>Definition 1.6 (Branch-decomposition; branch-width).</strong> A <em>branch-decomposition</em> of a graph \(G\) with at least two edges is a pair \((T, \tau)\) where \(T\) is a tree in which every internal vertex has degree \(3\) and \(\tau\) is a bijection from the leaves of \(T\) to \(E(G)\). For each edge \(e\) of \(T\), removing \(e\) partitions \(E(G)\) into two parts \(A_e, B_e\); the <em>order</em> of \(e\) is the number of vertices of \(G\) incident with both \(A_e\) and \(B_e\). The <em>width</em> of the decomposition is the maximum order over all edges of \(T\), and the <em>branch-width</em> \(\mathrm{bw}(G)\) is the minimum width.
</div>

Branch-width and tree-width are equivalent up to a factor of \(3/2\): \(\mathrm{bw}(G) \le \mathrm{tw}(G) + 1 \le \tfrac{3}{2}\,\mathrm{bw}(G)\). The branch-width formulation is often more convenient for inductive arguments, especially because it dualizes cleanly to the notion of a <em>tangle</em>.

<div class="definition">
<strong>Definition 1.7 (Tangle of order \(k\)).</strong> A <em>tangle</em> of order \(k\) in a graph \(G\) is a collection \(\mathcal{T}\) of subsets (called the "small sides") of separations \((A, B)\) of \(G\) of order \(< k\), satisfying: (T1) for every separation \((A,B)\) of order \(<k\) exactly one of \(A, B\) lies in \(\mathcal{T}\); (T2) if \(A_1, A_2, A_3 \in \mathcal{T}\) then \(A_1 \cup A_2 \cup A_3 \ne V(G)\); (T3) no \(A \in \mathcal{T}\) contains \(V(G) \setminus \{v\}\) for any single vertex \(v\).
</div>

Tangles are a Robertson-Seymour invention that captures the intuition of a "highly connected blob" of \(G\) without committing to any one set of vertices. Lecture 4 introduced highly connected sets and tangles together, and a fundamental duality between tangles and branch-decompositions states that \(G\) admits a branch-decomposition of width \(< k\) iff \(G\) has no tangle of order \(k\).

## 1.3 The Erdos-Posa property and the Grid Theorem

Lectures 5 and 6 covered two cornerstones. The first is the classical Erdos-Posa theorem.

<div class="theorem">
<strong>Theorem 1.8 (Erdos-Posa 1965).</strong> There is a function \(f(k) = O(k \log k)\) such that for every graph \(G\) and every positive integer \(k\), either \(G\) contains \(k\) pairwise vertex-disjoint cycles or there is a set \(S \subseteq V(G)\) of at most \(f(k)\) vertices meeting every cycle of \(G\).
</div>

This min-max-style statement (a "packing-covering duality") is the prototype of what is called the <em>Erdos-Posa property</em> for a graph class: a graph class \(\mathcal{H}\) has the Erdos-Posa property if for some function \(f\), every graph either contains \(k\) disjoint subgraphs in \(\mathcal{H}\) or a set of at most \(f(k)\) vertices meeting all such subgraphs. Robertson and Seymour generalized this dramatically: a connected graph \(H\) has the Erdos-Posa property (for \(H\)-minors) iff \(H\) is planar.

The reason planarity matters in this circle of ideas is the second cornerstone, the Excluded Grid Theorem.

<div class="theorem">
<strong>Theorem 1.9 (Excluded Grid Theorem; Robertson-Seymour, Graph Minors V).</strong> There is a function \(g\) such that every graph of tree-width at least \(g(k)\) contains the \(k \times k\) grid \(\boxtimes_k\) as a minor. Equivalently, the class of graphs with tree-width less than \(g(k)\) is exactly the class of graphs excluding \(\boxtimes_k\) as a minor.
</div>

Robertson and Seymour gave an exponential bound for \(g\); after a long sequence of improvements (Chekuri-Chuzhoy and others) it is now known that \(g(k)\) can be taken polynomial in \(k\). The grid theorem is the gateway from the local notion of tree-width to the global combinatorics of minors: large tree-width means a large grid minor, and a large grid minor lets one start "drawing" the graph on a piece of surface.

## 1.4 Walls, flat embeddings, and the Two Paths Theorem

Lectures 7 through 12 developed the technical heart of the structure theorem. A <em>wall</em> of height \(h\) is a subdivision of the standard hexagonal grid of height \(h\); walls are convenient because they have maximum degree \(3\), so wall minors and wall topological minors coincide. Inside a high-order tangle, one extracts a large wall, and then the surrounding combinatorial geometry can be made rigid.

<div class="theorem">
<strong>Theorem 1.10 (Two Paths Theorem; Seymour, Shiloach, Thomassen, Robertson-Seymour).</strong> The following decision problem is solvable in polynomial time: given a graph \(G\) and four vertices \(s_1, t_1, s_2, t_2\) of \(G\), decide whether there exist two vertex-disjoint paths \(P_1, P_2\) in \(G\) such that \(P_i\) connects \(s_i\) to \(t_i\). Moreover, an instance has no solution iff \(G\) admits a "planar 3-cut" decomposition with the four terminals on a common face.
</div>

The "moreover" clause --- the structural characterization of no-instances --- is the version Geelen presented and is the workhorse for the next step.

<div class="theorem">
<strong>Theorem 1.11 (Flat Wall Theorem; Robertson-Seymour, Graph Minors XIII).</strong> There are functions \(R(t,h)\) and \(a(t)\) such that for every graph \(G\) containing a wall of height \(R(t,h)\), either \(G\) contains \(K_t\) as a minor, or there is a set \(A \subseteq V(G)\) of at most \(a(t)\) "apex" vertices and a wall \(W'\) of height \(h\) in \(G - A\) which is <em>flat</em>: the closure of \(W'\) embeds in a disk in such a way that no other part of \(G - A\) interferes with the embedding.
</div>

Flatness is the key mechanism by which tree-width and topology meet: a flat wall is a piece of \(G\) that genuinely sits inside a disk, after a bounded number of vertices have been removed. Once a flat wall is in hand, one can begin to assemble a global embedding into a surface.

## 1.5 The Graph Minors Structure Theorem

The culmination of Lectures 13-23 is the Graph Minors Structure Theorem, the qualitative description of all graphs excluding a fixed minor.

<div class="theorem">
<strong>Theorem 1.12 (Graph Minors Structure Theorem; Robertson-Seymour, Graph Minors XVI).</strong> For every graph \(H\) there exist constants \(k = k(H)\), \(g = g(H)\), \(p = p(H)\), and \(a = a(H)\) such that every graph \(G\) with no \(H\)-minor admits a tree-decomposition \((T, \{X_t\})\) in which each <em>torso</em> --- the bag \(X_t\) augmented with edges between any two vertices that lie in a common adjacent bag --- is "nearly embeddable" in a surface of Euler genus at most \(g\). "Nearly embeddable" means: after deleting at most \(a\) apex vertices, the remainder embeds in the surface up to the addition of at most \(p\) <em>vortices</em>, where each vortex is a graph of path-width at most \(k\) attached along a face boundary.
</div>

Unpacking: every \(H\)-minor-free graph is a clique-sum of pieces, each of which is "almost" a graph drawn on a fixed-genus surface, where "almost" means a bounded number of apex vertices and a bounded number of vortices of bounded path-width attached to faces. The proof builds the embedding by iteratively finding flat walls, attaching them to existing partial embeddings (Lectures 16-18), handling vortices and "holes" (Lectures 17-22), and bounding the global topology (Lecture 23 bounds the number of holes, hence the genus required). Lecture 24 was an overview lecture with slides.

<div class="example">
<strong>Example 1.13.</strong> Specializing \(H = K_5\) one recovers Wagner's theorem (modulo a clique-sum decomposition): \(K_5\)-minor-free graphs are clique-sums of planar graphs and copies of the Wagner graph \(V_8\). For \(H\) of large genus the apex and vortex parameters genuinely appear; the structure theorem is the only known way to produce graphs that exclude \(K_t\)-minors but that fail to embed in any surface of bounded genus.
</div>

<div class="remark">
<strong>Remark 1.14 (Algorithmic content).</strong> Combining the structure theorem with the Two Paths Theorem and dynamic programming on tree-decompositions of bounded width, Robertson and Seymour proved that for every fixed graph \(H\), the problem "Does \(G\) contain \(H\) as a minor?" is solvable in time \(O(|V(G)|^3)\). This is the source of the famous corollary: every minor-closed property of finite graphs is recognizable in cubic time, even though the algorithm is not constructive (it depends on the unknown finite list of forbidden minors).
</div>

## 1.6 Hadwiger's conjecture

The structure theorem feeds into the most celebrated open problem about graph minors: Hadwiger's conjecture (1943).

<div class="theorem">
<strong>Conjecture 1.15 (Hadwiger).</strong> For every \(t \ge 1\), every graph with no \(K_t\)-minor is \((t-1)\)-colourable.
</div>

This conjecture is trivial for \(t \le 3\); equivalent to the Four Colour Theorem for \(t = 5\) (Wagner's reduction); proved for \(t = 6\) by Robertson-Seymour-Thomas via the structure theorem (any minimal counterexample for \(t=6\) must contain a vertex whose deletion gives a planar graph, contradicting four-colourability); and open for all \(t \ge 7\). Recent work of Norin, Postle, Song, and others has reduced the upper bound on the chromatic number of \(K_t\)-minor-free graphs from \(O(t \sqrt{\log t})\) (Kostochka, Thomason) to \(O(t \log \log t)\) and below, but the linear conjecture remains far out of reach.

<div class="remark">
<strong>Remark 1.16 (Connections to Lovász's work).</strong> The classical lower bounds on chromatic number in terms of forbidden minors and the Erdos-style probabilistic constructions of graphs with high girth and high chromatic number (Lovász 1968 and after) provide the backdrop against which Hadwiger-type questions are studied. They show that purely local constraints cannot force colourability: minor-closed hypotheses are essential.
</div>

## 1.7 Applications and outlook

The Graph Minors series has had a profound effect on three adjacent fields. First, fixed-parameter tractability: the existence of \(O(n^3)\) algorithms for arbitrary minor-closed properties motivated the entire FPT framework, and the structure theorem underwrites Courcelle-style theorems on bounded tree-width. Second, topological graph theory: the structure theorem is a uniform statement about how surfaces appear in graph classes. Third, matroid theory: Geelen, Gerards, and Whittle have proved a direct analogue of Robertson-Seymour for matroids representable over a fixed finite field --- the matroid minors program --- and the techniques developed for graphs (tangles, branch-width, structure relative to a tangle) translate, with significant additional work, to that setting. The Geelen lectures explicitly emphasized this transfer of intuition between the graph and matroid worlds.

# Chapter 2: Pointer to F24 (Graph Minors, instructor TBA)

Planned for Fall 2024 as a CO 749 topics offering on graph minors, with no public outline archived at the time these notes were assembled. The natural supposition is that the course revisits Geelen's F16 syllabus while shifting emphasis toward developments of the past decade. Three directions are particularly likely.

The first is the algorithmic side. The polynomial Excluded Grid Theorem of Chekuri-Chuzhoy now permits genuinely efficient algorithms whose dependence on the excluded minor is not astronomically bad. Combined with the bidimensionality framework of Demaine, Fomin, Hajiaghayi, and Thilikos, a wide class of optimization problems on \(H\)-minor-free graphs admits subexponential parameterized algorithms and EPTASs. Cygan et al.'s textbook treatment of tree-width-based dynamic programming and Bodlaender's algorithmic work on computing tree-decompositions provide the contemporary standard reference, and a F24 follow-up would likely use them.

A second direction is matroids. The Geelen-Gerards-Whittle program has now established the analogue of Wagner's well-quasi-ordering conjecture for matroids representable over any fixed finite field \(\mathrm{GF}(q)\), via a structure theorem describing such matroids in terms of "frame templates" and lifts of graphic matroids. The proofs draw on connectivity, branch-width, and tangle ideas isomorphic to those in the graph series, but require new ingredients (the matroid version of the Two Paths Theorem, deep linear-algebraic stability arguments). The arXiv preprints of Geelen, Gerards, and Whittle are the public reference.

A third likely strand is the structural graph theory of induced subgraphs and other "non-minor" containment relations, where the Chudnovsky-Seymour-Scott-Spirkl program on the Erdos-Hajnal conjecture and the recent solution of the chi-bounding question for bounded-tree-width-induced-subgraph classes suggests a parallel "structure theorems for excluded induced subgraphs" picture --- much less developed than the minor case but rapidly evolving.

<div class="remark">
<strong>Remark 2.1 (How to use this chapter).</strong> Without an outline the only honest pointer is to the literature: Diestel Chapter 12 for a textbook treatment of the structure theorem (proof sketches and full statements), the original Robertson-Seymour papers for the definitive arguments, Cygan et al. for the parameterized algorithmic side, and the arXiv listings of Geelen-Gerards-Whittle for the matroid analogue. A student arriving in a F24 offering with a working command of Geelen's F16 lectures is well prepared.
</div>
