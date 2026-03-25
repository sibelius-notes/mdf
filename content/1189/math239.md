---
title: "MATH 239: Introduction to Combinatorics"
---

# MATH 239 -- Introduction to Combinatorics

These course notes follow the official text for MATH 239, Fall 2018, from the Department of Combinatorics and Optimization at the University of Waterloo. The material divides into two major parts: **Enumeration** (formal power series, compositions, binary strings, recurrences) and **Graph Theory** (structure, planarity, matchings). Every numbered definition, theorem, lemma, proposition, and corollary from the course notes is recorded below.

---

# Part I: Enumeration

Part I of the course develops techniques for counting combinatorial objects using generating series (formal power series), with applications to compositions of integers, binary strings, and recurrence relations. The following summarizes the key definitions and results from Chapters 1--3.

## Chapter 1: Generating Series and Compositions

### 1.1 Generating Series (Formal Power Series)

A central tool in enumeration is the generating series (also called a formal power series). Rather than counting objects one at a time, we encode an entire sequence of counts into a single algebraic expression.

<div class="definition">

<strong>Definition (Generating Series).</strong> Let \(S\) be a set of objects with a weight function \(w : S \to \mathbb{Z}_{\ge 0}\). The <em>generating series</em> for \(S\) with respect to \(w\) is
\[
\Phi_S(x) = \sum_{\sigma \in S} x^{w(\sigma)} = \sum_{n \ge 0} a_n x^n,
\]
where \(a_n\) is the number of elements of \(S\) having weight \(n\).

</div>

The coefficient \([x^n]\Phi_S(x)\) counts the objects of weight \(n\). Two generating series are equal if and only if they agree coefficient by coefficient. Generating series are manipulated as formal algebraic objects; convergence is not required.

<div class="definition">

<strong>Definition (Formal Power Series Operations).</strong> Given formal power series \(A(x) = \sum a_n x^n\) and \(B(x) = \sum b_n x^n\), their <em>sum</em> and <em>product</em> are defined by
\[
A(x) + B(x) = \sum_{n \ge 0}(a_n + b_n)x^n, \qquad A(x)\cdot B(x) = \sum_{n \ge 0}\left(\sum_{k=0}^{n} a_k b_{n-k}\right)x^n.
\]

</div>

<div class="definition">

<strong>Definition (Inverse of a Formal Power Series).</strong> A formal power series \(A(x)\) has a multiplicative inverse if and only if its constant term \(a_0 \neq 0\). In that case there exists a unique formal power series \(B(x)\) such that \(A(x)B(x) = 1\).

</div>

### 1.2 Compositions of an Integer

<div class="definition">

<strong>Definition (Composition).</strong> A <em>composition</em> of a non-negative integer \(n\) is an ordered sequence \((c_1, c_2, \ldots, c_k)\) of positive integers such that \(c_1 + c_2 + \cdots + c_k = n\). Each \(c_i\) is called a <em>part</em>.

</div>

The number of compositions of \(n\) (for \(n \ge 1\)) is \(2^{n-1}\), since each composition corresponds to choosing which of the \(n-1\) gaps between units receive a divider. The generating series for the number of compositions of \(n\) is
\[
\sum_{n \ge 0} 2^{n-1} x^n = \frac{1}{1-2x} \quad (\text{adjusting for } n=0).
\]

### 1.3 Binary Strings and Blocks

<div class="definition">

<strong>Definition (Binary String).</strong> A <em>binary string</em> is a finite sequence of 0s and 1s. The <em>length</em> of a binary string is the number of characters it contains. The <em>empty string</em> \(\varepsilon\) has length 0.

</div>

<div class="definition">

<strong>Definition (Block and Gap).</strong> A <em>block</em> in a binary string is a maximal non-empty substring consisting entirely of the same character. A <em>1-block</em> is a maximal substring of 1s.

</div>

<div class="definition">

<strong>Definition (Concatenation).</strong> If \(s\) and \(t\) are binary strings, their <em>concatenation</em> \(st\) is the string formed by appending \(t\) to the end of \(s\).

</div>

We often decompose the set of all binary strings by specifying a "recursive decomposition" that partitions the set into pieces whose generating series can be computed.

### 1.4 The Sum and Product Lemmas

The two most important tools for computing generating series are:

<div class="theorem">

<strong>Theorem (Sum Lemma).</strong> If \(S\) is partitioned into disjoint sets \(S_1, S_2, \ldots\) (each inheriting the weight function from \(S\)), then
\[
\Phi_S(x) = \Phi_{S_1}(x) + \Phi_{S_2}(x) + \cdots
\]

</div>

<div class="theorem">

<strong>Theorem (Product Lemma).</strong> Let \(S = A \times B\) with weight function \(w(a,b) = w_A(a) + w_B(b)\). Then
\[
\Phi_S(x) = \Phi_A(x) \cdot \Phi_B(x).
\]

</div>

These lemmas allow us to break complicated sets into simpler pieces. For example, every binary string can be uniquely decomposed as a (possibly empty) sequence of blocks, and the Product Lemma converts this decomposition into a product of generating series.

### 1.5 Recursive Decompositions and Rational Generating Series

A typical application: the set \(\{0,1\}^*\) of all binary strings, weighted by length, has generating series
\[
\Phi(x) = \frac{1}{1-2x},
\]
since there are \(2^n\) binary strings of length \(n\). More generally, decomposing a set of strings by their structure (first character, last block, etc.) yields a system of equations whose solution is a rational function of \(x\).

<div class="definition">

<strong>Definition (Rational Generating Series).</strong> A generating series is <em>rational</em> if it can be written in the form \(\frac{p(x)}{q(x)}\) where \(p(x)\) and \(q(x)\) are polynomials with \(q(0) \neq 0\).

</div>

## Chapter 2: Coefficients of Rational Functions

### 2.1 Partial Fractions

To extract the coefficient \([x^n]\) from a rational generating series, we use partial fraction decomposition.

<div class="theorem">

<strong>Theorem (Partial Fraction Decomposition).</strong> If \(\frac{p(x)}{q(x)}\) is a rational function with \(\deg p < \deg q\), and the denominator factors as
\[
q(x) = (1-r_1 x)^{m_1}(1-r_2 x)^{m_2}\cdots(1-r_k x)^{m_k}
\]
with \(r_1, \ldots, r_k\) distinct and nonzero, then there exist unique constants \(A_{i,j}\) such that
\[
\frac{p(x)}{q(x)} = \sum_{i=1}^{k}\sum_{j=1}^{m_i} \frac{A_{i,j}}{(1-r_i x)^j}.
\]

</div>

The key identity used to extract coefficients is:
\[
[x^n]\frac{1}{(1-rx)^j} = \binom{n+j-1}{j-1}r^n.
\]

### 2.2 Solutions to Recurrence Relations

Many counting problems lead to linear recurrence relations. The connection to generating series is that if a sequence \((a_n)\) satisfies a linear recurrence with constant coefficients, then its generating series is rational.

<div class="theorem">

<strong>Theorem (Recurrences and Rational Series).</strong> Suppose the sequence \((a_n)_{n \ge 0}\) satisfies a linear recurrence
\[
a_n = c_1 a_{n-1} + c_2 a_{n-2} + \cdots + c_d a_{n-d}
\]
for \(n \ge d\), with given initial conditions. Then the generating series \(A(x) = \sum_{n \ge 0} a_n x^n\) is rational, with denominator \(1 - c_1 x - c_2 x^2 - \cdots - c_d x^d\).

</div>

The roots of the characteristic polynomial \(x^d - c_1 x^{d-1} - \cdots - c_d = 0\) determine the closed-form solution via partial fractions.

## Chapter 3: The Binomial Series, Quicksort, and Mergesort

### 3.1 The Binomial Series

<div class="theorem">

<strong>Theorem (Binomial Series / Negative Binomial Series).</strong> For any non-negative integer \(k\),
\[
\frac{1}{(1-x)^k} = \sum_{n \ge 0}\binom{n+k-1}{k-1}x^n.
\]
More generally, for a positive integer \(k\),
\[
(1+x)^k = \sum_{n=0}^{k}\binom{k}{n}x^n.
\]

</div>

<div class="definition">

<strong>Definition (Binomial Coefficient).</strong> For integers \(n \ge 0\) and \(0 \le k \le n\), the binomial coefficient is
\[
\binom{n}{k} = \frac{n!}{k!(n-k)!}.
\]

</div>

The binomial series connects formal power series to classical combinatorial identities, and is used to extract coefficients from generating series with repeated roots.

### 3.2 Average Number of Occurrences

<div class="definition">

<strong>Definition (Bivariate Generating Series).</strong> Let \(S\) be a set with a weight function \(w\) and a statistic \(\chi\). The <em>bivariate generating series</em> is
\[
\Phi_S(x,y) = \sum_{\sigma \in S} x^{w(\sigma)} y^{\chi(\sigma)}.
\]

</div>

The average value of \(\chi\) among objects of weight \(n\) can be extracted by differentiating \(\Phi_S(x,y)\) with respect to \(y\) and evaluating at \(y=1\).

### 3.3 The Factor Theorem

<div class="theorem">

<strong>Theorem (Factor Theorem for Formal Power Series).</strong> If \(f(x)\) is a polynomial and \(f(r) = 0\), then \((x - r)\) divides \(f(x)\).

</div>

This is used in the partial fraction method to factor denominators and find closed forms for coefficients of rational generating series.

---

# Part II: Introduction to Graph Theory

## Chapter 4: Introduction to Graph Theory

### 4.1 Definitions

Graph theory studies mathematical objects called "graphs" -- a word to which graph theorists have given a rather special meaning. We begin with the foundational definitions.

<div class="definition">

<strong>Definition 4.1.1 (Graph).</strong> A <em>graph</em> \(G\) is a finite nonempty set \(V(G)\) of objects, called <em>vertices</em>, together with a set \(E(G)\) of unordered pairs of distinct vertices. The elements of \(E(G)\) are called <em>edges</em>.

</div>

If \(e = \{u,v\}\) then we say \(u\) and \(v\) are **adjacent** vertices, and that edge \(e\) is **incident** with vertices \(u\) and \(v\). Vertices adjacent to \(u\) are called **neighbours** of \(u\), and the set of neighbours is denoted \(N(u)\). A geometric representation or **drawing** of a graph places a small circle for each vertex and a line for each edge. A graph representable with no edges crossing is said to be **planar**.

Some important consequences of the definition: edges are *unordered* pairs (changing to ordered pairs gives a **directed graph** or **digraph**); no **multiple edges** are allowed; no **loops** are allowed (edges join distinct vertices). If we wish to allow loops and/or multiple edges, we use the term **multigraph**.

### 4.2 Isomorphism

<div class="definition">

<strong>Definition 4.2.1 (Isomorphism).</strong> Two graphs \(G_1\) and \(G_2\) are <em>isomorphic</em> if there exists a bijection \(f : V(G_1) \to V(G_2)\) such that vertices \(f(u)\) and \(f(v)\) are adjacent in \(G_2\) if and only if \(u\) and \(v\) are adjacent in \(G_1\). Such a bijection \(f\) is called an <em>isomorphism</em>.

</div>

The collection of graphs isomorphic to \(G\) forms the **isomorphism class** of \(G\). An isomorphism from \(G\) to itself is called an **automorphism** of \(G\). There are exactly 11 isomorphism classes of graphs on 4 vertices.

### 4.3 Degree

The number of edges incident with a vertex \(v\) is called the **degree** of \(v\), denoted \(\deg(v)\).

<div class="theorem">

<strong>Theorem 4.3.1 (Handshaking Lemma / Degree-Sum Formula).</strong> For any graph \(G\),
\[
\sum_{v \in V(G)} \deg(v) = 2|E(G)|.
\]

</div>

Each edge has two ends, so summing all vertex degrees counts each edge exactly twice.

<div class="corollary">

<strong>Corollary 4.3.2.</strong> The number of vertices of odd degree in a graph is even.

</div>

<div class="corollary">

<strong>Corollary 4.3.3.</strong> The average degree of a vertex in the graph \(G\) is \(\frac{2|E(G)|}{|V(G)|}\).

</div>

<div class="definition">

<strong>Definition 4.3.4 (Complete Graph).</strong> A <em>complete graph</em> is one in which all pairs of distinct vertices are adjacent. The complete graph with \(p\) vertices is denoted \(K_p\), \(p \ge 1\).

</div>

In \(K_n\) each vertex has degree \(n-1\), so \(K_n\) is \((n-1)\)-regular with \(\binom{n}{2}\) edges. A graph in which every vertex has degree \(k\) is called a **\(k\)-regular graph**.

### 4.4 Bipartite Graphs

A graph whose vertices can be partitioned into two sets \(A\) and \(B\) so that every edge joins a vertex in \(A\) to a vertex in \(B\) is called a **bipartite graph** with **bipartition** \((A,B)\). The **complete bipartite graph** \(K_{m,n}\) has all vertices in \(A\) adjacent to all vertices in \(B\), with \(|A|=m\), \(|B|=n\).

<div class="definition">

<strong>Definition 4.4.1 (n-Cube).</strong> For \(n \ge 0\), the <em>\(n\)-cube</em> is the graph whose vertices are the \(\{0,1\}\)-strings of length \(n\), and two strings are adjacent if and only if they differ in exactly one position.

</div>

The \(n\)-cube has \(2^n\) vertices, is \(n\)-regular, and has \(n 2^{n-1}\) edges. It is always bipartite: partition by parity of the number of 1s.

### 4.5 How to Specify a Graph

<div class="definition">

<strong>Definition 4.5.1 (Adjacency Matrix).</strong> The <em>adjacency matrix</em> of a graph \(G\) with vertices \(v_1, \ldots, v_p\) is the \(p \times p\) matrix \(A = [a_{ij}]\) where \(a_{ij} = 1\) if \(v_i\) and \(v_j\) are adjacent, and \(a_{ij} = 0\) otherwise.

</div>

<div class="definition">

<strong>Definition 4.5.2 (Incidence Matrix).</strong> The <em>incidence matrix</em> of a graph \(G\) with vertices \(v_1, \ldots, v_p\) and edges \(e_1, \ldots, e_q\) is the \(p \times q\) matrix \(B = [b_{ij}]\) where \(b_{ij} = 1\) if \(v_i\) is incident with \(e_j\), and \(b_{ij} = 0\) otherwise.

</div>

Each column of \(B\) contains exactly two 1s, and \(BB^t = A + \operatorname{diag}(\deg(v_1), \ldots, \deg(v_p))\). Graphs can also be specified via **adjacency lists**.

### 4.6 Paths and Cycles

<div class="definition">

<strong>Definition 4.6.1 (Subgraph).</strong> A <em>subgraph</em> of a graph \(G\) is a graph whose vertex set is a subset \(U\) of \(V(G)\) and whose edge set is a subset of those edges of \(G\) that have both vertices in \(U\).

</div>

A subgraph with \(V(H) = V(G)\) is called a **spanning subgraph**. A **walk** from \(v_0\) to \(v_n\) is an alternating sequence \(v_0 e_1 v_1 e_2 \ldots v_{n-1} e_n v_n\); its length is \(n\). A walk is **closed** if \(v_0 = v_n\). A **path** is a walk in which all vertices are distinct.

<div class="theorem">

<strong>Theorem 4.6.2.</strong> If there is a walk from vertex \(x\) to vertex \(y\) in \(G\), then there is a path from \(x\) to \(y\) in \(G\).

</div>

<div class="corollary">

<strong>Corollary 4.6.3.</strong> Let \(x, y, z\) be vertices of \(G\). If there is a path from \(x\) to \(y\) and a path from \(y\) to \(z\), then there is a path from \(x\) to \(z\).

</div>

A **cycle** in \(G\) is a subgraph with \(n\) distinct vertices \(v_0, v_1, \ldots, v_{n-1}\) and \(n\) distinct edges \(\{v_0,v_1\},\{v_1,v_2\},\ldots,\{v_{n-1},v_0\}\). The shortest possible cycle in a graph is a 3-cycle (triangle). The **girth** of \(G\) is the length of its shortest cycle.

<div class="theorem">

<strong>Theorem 4.6.4.</strong> If every vertex in \(G\) has degree at least 2, then \(G\) contains a cycle.

</div>

A spanning cycle is called a **Hamilton cycle**.

### 4.7 Equivalence Relations

A relation on a set \(S\) is **reflexive** if every element is related to itself, **symmetric** if \(a \sim b\) implies \(b \sim a\), and **transitive** if \(a \sim b\) and \(b \sim c\) imply \(a \sim c\). A relation that is all three is an **equivalence relation**, and it partitions \(S\) into equivalence classes.

The relation "is joined by a walk to" on the vertices of a graph is an equivalence relation. Its equivalence classes are the vertex sets of the components.

### 4.8 Connectedness

<div class="definition">

<strong>Definition 4.8.1 (Connected).</strong> A graph \(G\) is <em>connected</em> if, for each two vertices \(x\) and \(y\), there is a path from \(x\) to \(y\).

</div>

<div class="theorem">

<strong>Theorem 4.8.2.</strong> Let \(G\) be a graph and let \(v\) be a vertex in \(G\). If for each vertex \(w\) in \(G\) there is a path from \(v\) to \(w\), then \(G\) is connected.

</div>

<div class="definition">

<strong>Definition 4.8.4 (Component).</strong> A <em>component</em> of \(G\) is a subgraph \(C\) of \(G\) such that (a) \(C\) is connected, and (b) no subgraph of \(G\) that properly contains \(C\) is connected.

</div>

Given a subset \(X \subseteq V(G)\), the **cut induced by \(X\)** is the set of edges with exactly one end in \(X\).

<div class="theorem">

<strong>Theorem 4.8.5.</strong> A graph \(G\) is not connected if and only if there exists a proper nonempty subset \(X\) of \(V(G)\) such that the cut induced by \(X\) is empty.

</div>

### 4.9 Eulerian Circuits

<div class="definition">

<strong>Definition 4.9.1 (Eulerian Circuit).</strong> An <em>Eulerian circuit</em> of a graph \(G\) is a closed walk that contains every edge of \(G\) exactly once.

</div>

<div class="theorem">

<strong>Theorem 4.9.2.</strong> Let \(G\) be a connected graph. Then \(G\) has an Eulerian circuit if and only if every vertex has even degree.

</div>

The proof of the "if" direction uses strong induction on the number of edges: find a cycle \(C\), remove its edges to obtain components, apply induction to each component, and splice the Eulerian circuits together along \(C\).

### 4.10 Bridges

<div class="definition">

<strong>Definition 4.10.1 (Bridge).</strong> An edge \(e\) of \(G\) is a <em>bridge</em> if \(G - e\) has more components than \(G\).

</div>

<div class="lemma">

<strong>Lemma 4.10.2.</strong> If \(e = \{x,y\}\) is a bridge of a connected graph \(G\), then \(G - e\) has precisely two components; furthermore, \(x\) and \(y\) are in different components.

</div>

<div class="theorem">

<strong>Theorem 4.10.3.</strong> An edge \(e\) is a bridge of a graph \(G\) if and only if it is not contained in any cycle of \(G\).

</div>

<div class="corollary">

<strong>Corollary 4.10.4.</strong> If there are two distinct paths from vertex \(u\) to vertex \(v\) in \(G\), then \(G\) contains a cycle.

</div>

Equivalently (contrapositive): if \(G\) has no cycles, then each pair of vertices is joined by at most one path.

---

## Chapter 5: Trees

### 5.1 Trees

<div class="definition">

<strong>Definition 5.1.1 (Tree).</strong> A <em>tree</em> is a connected graph with no cycles.

</div>

<div class="definition">

<strong>Definition 5.1.2 (Forest).</strong> A <em>forest</em> is a graph with no cycles.

</div>

Each component of a forest is a tree.

<div class="lemma">

<strong>Lemma 5.1.3.</strong> If \(u\) and \(v\) are vertices in a tree \(T\), then there is a unique \(u,v\)-path in \(T\).

</div>

<div class="lemma">

<strong>Lemma 5.1.4.</strong> Every edge of a tree \(T\) is a bridge.

</div>

<div class="theorem">

<strong>Theorem 5.1.5.</strong> If \(T\) is a tree, then \(|E(T)| = |V(T)| - 1\).

</div>

<div class="corollary">

<strong>Corollary 5.1.6.</strong> If \(G\) is a forest with \(k\) components, then \(|E(G)| = |V(G)| - k\).

</div>

<div class="definition">

<strong>Definition 5.1.7 (Leaf).</strong> A <em>leaf</em> in a tree is a vertex of degree 1.

</div>

<div class="theorem">

<strong>Theorem 5.1.8.</strong> A tree with at least two vertices has at least two leaves.

</div>

The proof uses a longest-path argument: the endpoints of any longest path must both be leaves, since extending the path at either end would either create a cycle or contradict maximality.

### 5.2 Spanning Trees

A spanning subgraph that is also a tree is called a **spanning tree**.

<div class="theorem">

<strong>Theorem 5.2.1.</strong> A graph \(G\) is connected if and only if it has a spanning tree.

</div>

<div class="corollary">

<strong>Corollary 5.2.2.</strong> If \(G\) is connected, with \(p\) vertices and \(q = p-1\) edges, then \(G\) is a tree.

</div>

<div class="theorem">

<strong>Theorem 5.2.3.</strong> If \(T\) is a spanning tree of \(G\) and \(e\) is an edge not in \(T\), then \(T + e\) contains exactly one cycle \(C\). Moreover, if \(e'\) is any edge on \(C\), then \(T + e - e'\) is also a spanning tree of \(G\).

</div>

<div class="theorem">

<strong>Theorem 5.2.4.</strong> If \(T\) is a spanning tree of \(G\) and \(e\) is an edge in \(T\), then \(T - e\) has 2 components. If \(e'\) is in the cut induced by one of the components, then \(T - e + e'\) is also a spanning tree of \(G\).

</div>

These two theorems describe how to exchange edges in a spanning tree: adding a non-tree edge creates a unique cycle, and removing any edge of that cycle yields a new spanning tree.

### 5.3 Characterizing Bipartite Graphs

<div class="lemma">

<strong>Lemma 5.3.1.</strong> An odd cycle is not bipartite.

</div>

<div class="theorem">

<strong>Theorem 5.3.2.</strong> A graph is bipartite if and only if it has no odd cycles.

</div>

To certify that a graph is bipartite, provide a bipartition. To certify it is not bipartite, exhibit an odd cycle as a subgraph.

### 5.4 Breadth-First Search

BFS is an algorithm for finding a spanning tree (and testing connectivity).

<div class="definition">

<strong>Algorithm 5.4.1 (Search Tree Algorithm).</strong> To find a spanning tree of a graph \(G\): Select any vertex \(r\) of \(G\) as the initial subgraph \(D\), with \(\mathrm{pr}(r) = \varnothing\). At each stage, find an edge in \(G\) that joins a vertex \(u\) of \(D\) to a vertex \(v\) not in \(D\). Add vertex \(v\) and edge \(\{u,v\}\) to \(D\), with \(\mathrm{pr}(v) = u\). Stop when there is no such edge.

</div>

The function \(\mathrm{pr}\) is the **parent** or **predecessor** function. If \(\mathrm{pr}^k(v) = r\), then the **level** of \(v\) is \(k\).

<div class="definition">

<strong>Algorithm 5.4.2 (Breadth-First Search).</strong> Follow Algorithm 5.4.1 with the refinement: at each stage, the <em>active</em> vertex \(u\) is the unexhausted vertex that joined the tree earliest.

</div>

A vertex is **exhausted** if it is not adjacent to any vertex outside the tree. BFS uses a queue (first-in, first-out).

<div class="lemma">

<strong>Lemma 5.4.3.</strong> The vertices enter a breadth-first search tree in non-decreasing order of level.

</div>

<div class="theorem">

<strong>Theorem 5.4.4 (Primary Property of BFS).</strong> In a connected graph with a breadth-first search tree, each non-tree edge in the graph joins vertices that are at most one level apart in the search tree (of course each tree edge joins vertices that are exactly one level apart).

</div>

### 5.5 Applications of Breadth-First Search

<div class="theorem">

<strong>Theorem 5.5.1.</strong> A connected graph \(G\) with breadth-first search tree \(T\) has an odd cycle if and only if it has a non-tree edge joining vertices at the same level in \(T\).

</div>

This gives a constructive method: BFS can directly find either an odd cycle or a bipartition.

<div class="theorem">

<strong>Theorem 5.5.2.</strong> The length of a shortest path from \(u\) to \(v\) in a connected graph \(G\) is equal to the level of \(v\) in any breadth-first search tree of \(G\) with \(u\) as the root.

</div>

The length of a shortest path between two vertices is called the **distance** between them.

### 5.6 Minimum Spanning Tree

In the **minimum spanning tree (MST)** problem, we are given a connected graph \(G\) with edge weights \(w : E(G) \to \mathbb{R}\) and seek a spanning tree of minimum total weight.

**Prim's Algorithm:** Start with an arbitrary vertex \(v\); let \(T\) be the tree consisting of just \(v\). While \(T\) is not a spanning tree, look at all edges in the cut induced by \(V(T)\), pick one of minimum weight, and add it (and its new endpoint) to \(T\).

<div class="theorem">

<strong>Theorem 5.6.1.</strong> Prim's algorithm produces a minimum spanning tree for \(G\).

</div>

The proof uses induction: at each step, there exists an MST containing the current partial tree as a subgraph. When a new edge is added, if it is not in the assumed MST, swap it with an edge of the unique cycle to get another MST of equal or lesser weight.

---

## Chapter 6: Codes

### 6.1 Vector Spaces and Fundamental Cycles

Let \(S(G)\) be the set of all spanning subgraphs of the graph \(G\), and let \(Z\) denote the element of \(S(G)\) with no edges. The field \(GF(2)\) of integers modulo 2 has elements 0 and 1.

<div class="definition">

<strong>Definition 6.1.1 (Modulo 2 Sum).</strong> For \(H_1, H_2 \in S(G)\), the <em>modulo 2 sum</em> \(H_1 \oplus H_2\) is the element of \(S(G)\) whose edge set consists of all edges of \(G\) that are in \(H_1\) or \(H_2\) but not in both (the symmetric difference of \(E(H_1)\) and \(E(H_2)\)).

</div>

<div class="theorem">

<strong>Theorem 6.1.2.</strong> The set \(S(G)\) is a vector space over \(GF(2)\).

</div>

<div class="theorem">

<strong>Theorem 6.1.3.</strong> \(\{A_1, A_2, \ldots, A_q\}\) forms a basis for \(S(G)\), where \(A_i\) is the spanning subgraph containing only edge \(e_i\).

</div>

Thus \(S(G)\) has dimension \(q\) (the number of edges) and contains \(2^q\) elements.

<div class="definition">

<strong>Definition 6.1.4 (Even Graph).</strong> A graph in which all degrees are even non-negative integers is called an <em>even graph</em>.

</div>

Let \(C(G)\) be the set of even spanning subgraphs of \(G\).

<div class="theorem">

<strong>Theorem 6.1.5.</strong> The set \(C(G)\) forms a vector space over \(GF(2)\). (It is a subspace of \(S(G)\).)

</div>

<div class="theorem">

<strong>Theorem 6.1.6.</strong> Let \(T\) be a spanning tree of a connected graph \(G\). If \(e\) is an edge of \(G\) that is not in \(T\), then \(T + e\) contains a unique cycle. (This cycle contains edge \(e\).)

</div>

Edges not in \(T\) are called **non-tree edges**. If \(G\) has \(q\) edges and \(p\) vertices, there are \(q - p + 1\) non-tree edges. The unique cycle in \(T + e_i\) is called a **fundamental cycle** \(C_i\).

<div class="lemma">

<strong>Lemma 6.1.7.</strong> For a fixed spanning tree \(T\) of a connected graph \(G\), no two elements of \(C(G)\) contain exactly the same set of non-tree edges.

</div>

<div class="theorem">

<strong>Theorem 6.1.8.</strong> \(\{C_1, C_2, \ldots, C_{q-p+1}\}\) forms a basis for \(C(G)\), where \(G\) is connected.

</div>

Thus \(C(G)\) has dimension \(q - p + 1\) and contains \(2^{q-p+1}\) elements. We call \(C(G)\) the **cycle space** of \(G\), and the number \(q - p + 1\) is the **cyclomatic number** of \(G\).

### 6.2 Graphical Codes

<div class="definition">

<strong>Definition 6.2.1 (Hamming Distance).</strong> The <em>Hamming distance</em> between two binary vectors \(\underline{x}\) and \(\underline{y}\) of the same length is the number of 1s in \(\underline{x} \oplus \underline{y}\).

</div>

<div class="lemma">

<strong>Lemma 6.2.2.</strong> In the cycle space of a graph \(G\), any two distinct vectors have Hamming distance at least three.

</div>

A set \(C\) of binary vectors of length \(q\) forming a vector space of dimension \(d\) is called a **binary \((q,d,t)\)-error correcting code** (or \((q,d,t)\)-code) if the minimum Hamming distance between any two distinct vectors of \(C\) is \(t\). The vectors in \(C\) are **codewords**.

<div class="lemma">

<strong>Lemma 6.2.3.</strong> If fewer than \(t\) errors are made in the transmission of a codeword, then the received message is either the original codeword, or it is not a codeword at all.

</div>

<div class="lemma">

<strong>Lemma 6.2.4.</strong> If at most \(\lfloor\frac{t-1}{2}\rfloor\) errors are made in the transmission of a codeword \(m\), the Hamming distance between the received message \(m'\) and a codeword is minimum for the unique codeword \(m\).

</div>

<div class="lemma">

<strong>Lemma 6.2.5.</strong> The cycle space of a connected graph \(G\) on \(p\) vertices and \(q\) edges is a \((q, q-p+1, t)\)-code for some \(t \ge 3\).

</div>

This code is called the **even graphical code** of \(G\).

<div class="lemma">

<strong>Lemma 6.2.6.</strong> The distance of the even graphical code of \(G\) equals the girth of \(G\).

</div>

---

## Chapter 7: Planar Graphs

### 7.1 Planarity

<div class="definition">

<strong>Definition 7.1.1 (Planar Graph).</strong> A graph \(G\) is <em>planar</em> if it has a drawing in the plane so that its edges intersect only at their ends, and so that no two vertices coincide. The actual drawing is called a <em>planar embedding</em> of \(G\), or a <em>planar map</em>.

</div>

A planar embedding partitions the plane into connected regions called **faces**; one of these (the unbounded one) is the **outer face**. The subgraph formed by the vertices and edges bounding a face is the **boundary** of the face. Two faces are **adjacent** if they share a common edge.

The **boundary walk** of a face \(f\) is a closed walk traversing its entire boundary. The number of edges in the boundary walk is the **degree** of face \(f\), denoted \(\deg(f)\). A bridge contributes 2 to the degree of the face it is incident with.

<div class="theorem">

<strong>Theorem 7.1.2 (Faceshaking Lemma).</strong> If we have a planar embedding of a connected graph \(G\) with faces \(f_1, \ldots, f_s\), then
\[
\sum_{i=1}^{s} \deg(f_i) = 2|E(G)|.
\]

</div>

<div class="corollary">

<strong>Corollary 7.1.3.</strong> If the connected graph \(G\) has a planar embedding with \(f\) faces, the average degree of a face is \(\frac{2|E(G)|}{f}\).

</div>

### 7.2 Euler's Formula

<div class="theorem">

<strong>Theorem 7.2.1 (Euler's Formula).</strong> Let \(G\) be a connected graph with \(p\) vertices and \(q\) edges. If \(G\) has a planar embedding with \(f\) faces, then
\[
p - q + f = 2.
\]

</div>

The proof is by induction on \(q\). For a tree (\(q = p-1\)), there is one face and \(p - (p-1) + 1 = 2\). For \(q \ge p\), remove a non-bridge edge; it splits one face into two, and the result follows by induction.

### 7.3 Stereographic Projection

<div class="theorem">

<strong>Theorem 7.3.1.</strong> A graph is planar if and only if it can be drawn on the surface of a sphere.

</div>

**Stereographic projection** maps the plane to the sphere (and vice versa) while preserving the crossing structure of edges. This means any face of a planar embedding can be made the outer face.

### 7.4 Platonic Solids

A graph is called **platonic** if it admits a planar embedding in which each vertex has the same degree \(d \ge 3\) and each face has the same degree \(d^* \ge 3\).

<div class="theorem">

<strong>Theorem 7.4.1.</strong> There are exactly five platonic graphs.

</div>

These correspond to the tetrahedron, octahedron, cube, icosahedron, and dodecahedron.

<div class="lemma">

<strong>Lemma 7.4.2.</strong> Let \(G\) be a planar embedding with \(p\) vertices, \(q\) edges and \(s\) faces, in which each vertex has degree \(d \ge 3\) and each face has degree \(d^* \ge 3\). Then \((d, d^*)\) is one of the five pairs \(\{(3,3), (3,4), (4,3), (3,5), (5,3)\}\).

</div>

The proof combines Euler's formula with the Handshaking Lemma and the Faceshaking Lemma to obtain
\[
\frac{2}{d} + \frac{2}{d^*} = 1 + \frac{2}{q},
\]
and then checks which pairs \((d,d^*)\) make the left side exceed 1.

<div class="lemma">

<strong>Lemma 7.4.3.</strong> If \(G\) is a platonic graph with \(p\) vertices, \(q\) edges and \(f\) faces, where each vertex has degree \(d\) and each face has degree \(d^*\), then
\[
q = \frac{2dd^*}{2d + 2d^* - dd^*}
\]
and \(p = 2q/d\) and \(f = 2q/d^*\).

</div>

### 7.5 Nonplanar Graphs

<div class="lemma">

<strong>Lemma 7.5.1.</strong> If \(G\) contains a cycle, then in a planar embedding of \(G\), the boundary of each face contains a cycle.

</div>

<div class="lemma">

<strong>Lemma 7.5.2.</strong> Let \(G\) be a planar embedding with \(p\) vertices and \(q\) edges. If each face of \(G\) has degree at least \(d^*\), then \((d^* - 2)q \le d^*(p - 2)\).

</div>

<div class="theorem">

<strong>Theorem 7.5.3.</strong> In a planar graph \(G\) with \(p \ge 3\) vertices and \(q\) edges, we have \(q \le 3p - 6\).

</div>

<div class="corollary">

<strong>Corollary 7.5.4.</strong> \(K_5\) is not planar.

</div>

Since \(|E(K_5)| = 10 > 9 = 3(5) - 6\).

<div class="corollary">

<strong>Corollary 7.5.5.</strong> A planar graph has a vertex of degree at most five.

</div>

<div class="theorem">

<strong>Theorem 7.5.6.</strong> In a bipartite planar graph \(G\) with \(p \ge 3\) vertices and \(q\) edges, we have \(q \le 2p - 4\).

</div>

<div class="lemma">

<strong>Lemma 7.5.7.</strong> \(K_{3,3}\) is not planar.

</div>

Since \(|E(K_{3,3})| = 9 > 8 = 2(6) - 4\).

### 7.6 Kuratowski's Theorem

An **edge subdivision** of a graph \(G\) is obtained by replacing each edge by a path of length 1 or more. Edge subdivision does not change planarity.

<div class="theorem">

<strong>Theorem 7.6.1 (Kuratowski's Theorem).</strong> A graph is not planar if and only if it has a subgraph that is an edge subdivision of \(K_5\) or \(K_{3,3}\).

</div>

### 7.7 Colouring and Planar Graphs

<div class="definition">

<strong>Definition 7.7.1 (\(k\)-Colouring).</strong> A <em>\(k\)-colouring</em> of a graph \(G\) is a function from \(V(G)\) to a set of size \(k\) (whose elements are called <em>colours</em>), so that adjacent vertices always have different colours. A graph with a \(k\)-colouring is called <em>\(k\)-colourable</em>.

</div>

<div class="theorem">

<strong>Theorem 7.7.2.</strong> A graph is 2-colourable if and only if it is bipartite.

</div>

<div class="theorem">

<strong>Theorem 7.7.3.</strong> \(K_n\) is \(n\)-colourable, and not \(k\)-colourable for any \(k < n\).

</div>

<div class="theorem">

<strong>Theorem 7.7.4.</strong> Every planar graph is 6-colourable.

</div>

The proof uses induction on \(p\): by Corollary 7.5.5, there is a vertex \(v\) of degree at most 5. Remove \(v\), 6-colour the remaining planar graph by induction, then assign \(v\) one of the (at least one) remaining colours.

<div class="definition">

<strong>Definition 7.7.5 (Edge Contraction).</strong> Let \(G\) be a graph and let \(e = \{x,y\}\) be an edge of \(G\). The graph \(G/e\) obtained from \(G\) by <em>contracting</em> the edge \(e\) is the graph with vertex set \(V(G) \setminus \{x,y\} \cup \{z\}\), where \(z\) is a new vertex, and edge set
\[
\{\{u,v\} \in E(G) : \{u,v\} \cap \{x,y\} = \varnothing\} \cup \{\{u,z\} : u \notin \{x,y\},\;\{u,w\} \in E(G) \text{ for some } w \in \{x,y\}\}.
\]

</div>

If \(G\) is planar, then \(G/e\) is planar (the converse is not true in general).

<div class="theorem">

<strong>Theorem 7.7.6 (Five-Colour Theorem).</strong> Every planar graph is 5-colourable.

</div>

<div class="theorem">

<strong>Theorem 7.7.7 (Four-Colour Theorem).</strong> Every planar graph is 4-colourable.

</div>

The Four-Colour Theorem was proved by Appel and Haken (1976) using computer verification of hundreds of cases.

### 7.8 Dual Planar Maps

Given a connected planar embedding \(G\), the **dual** \(G^*\) is a planar embedding constructed as follows: \(G^*\) has one vertex for each face of \(G\); two vertices of \(G^*\) are joined by an edge whenever the corresponding faces of \(G\) share a common boundary edge. The edge in \(G^*\) is drawn to cross this common boundary edge.

Key relationships: a face of degree \(k\) in \(G\) becomes a vertex of degree \(k\) in \(G^*\), and a vertex of degree \(j\) in \(G\) becomes a face of degree \(j\) in \(G^*\). Thus Theorem 4.3.1 for \(G\) becomes Theorem 7.1.2 for \(G^*\) and vice versa. Moreover, \((G^*)^* = G\).

---

## Chapter 8: Matchings

### 8.1 Matching

A **matching** in a graph \(G\) is a set \(M\) of edges such that no two edges in \(M\) share a common end. A vertex \(v\) is **saturated** by \(M\) if \(v\) is incident with an edge in \(M\). A **maximum matching** is a largest matching. A **perfect matching** saturates every vertex (size \(p/2\)).

An **alternating path** with respect to \(M\) is a path whose edges alternate between being in \(M\) and not in \(M\). An **augmenting path** is an alternating path joining two distinct unsaturated vertices.

<div class="lemma">

<strong>Lemma 8.1.1.</strong> If \(M\) has an augmenting path, it is not a maximum matching.

</div>

Swapping the matching and non-matching edges along an augmenting path produces a larger matching.

### 8.2 Covers

A **cover** of a graph \(G\) is a set \(C\) of vertices such that every edge of \(G\) has at least one end in \(C\).

<div class="lemma">

<strong>Lemma 8.2.1.</strong> If \(M\) is a matching of \(G\) and \(C\) is a cover of \(G\), then \(|M| \le |C|\).

</div>

<div class="lemma">

<strong>Lemma 8.2.2.</strong> If \(M\) is a matching and \(C\) is a cover and \(|M| = |C|\), then \(M\) is a maximum matching and \(C\) is a minimum cover.

</div>

### 8.3 Konig's Theorem

<div class="theorem">

<strong>Theorem 8.3.1 (Konig's Theorem).</strong> In a bipartite graph, the maximum size of a matching is the minimum size of a cover.

</div>

The proof uses the **XY-construction**: given a bipartite graph with bipartition \((A,B)\) and a matching \(M\), let \(X_0\) be the unsaturated vertices of \(A\), let \(Z\) be the set of vertices reachable from \(X_0\) by alternating paths, and define \(X = A \cap Z\), \(Y = B \cap Z\).

<div class="lemma">

<strong>Lemma 8.3.2.</strong> Let \(M\) be a matching of bipartite graph \(G\) with bipartition \(A, B\), and let \(X\) and \(Y\) be as defined above. Then:
(a) There is no edge of \(G\) from \(X\) to \(B \setminus Y\).
(b) \(C = Y \cup (A \setminus X)\) is a cover of \(G\).
(c) There is no edge of \(M\) from \(Y\) to \(A \setminus X\).
(d) \(|M| = |C| - |U|\) where \(U\) is the set of unsaturated vertices in \(Y\).
(e) There is an augmenting path to each vertex in \(U\).

</div>

The **bipartite matching algorithm** uses BFS-like exploration to construct \(X\) and \(Y\) in levels, finding augmenting paths and iteratively enlarging the matching until no augmenting path exists.

### 8.4 Applications of Konig's Theorem

<div class="theorem">

<strong>Theorem 8.4.1 (Hall's Theorem).</strong> A bipartite graph \(G\) with bipartition \(A, B\) has a matching saturating every vertex in \(A\), if and only if every subset \(D\) of \(A\) satisfies
\[
|N(D)| \ge |D|.
\]

</div>

Here \(N(D) = \{v \in V(G) : \exists\, u \in D,\; \{u,v\} \in E(G)\}\) is the **neighbour set** of \(D\).

### 8.5 Systems of Distinct Representatives

Given a collection \(Q_1, Q_2, \ldots, Q_n\) of subsets of a finite set \(Q\), a **system of distinct representatives (SDR)** is a sequence \((q_1, q_2, \ldots, q_n)\) of \(n\) distinct elements of \(Q\) such that \(q_i \in Q_i\) for \(i = 1, 2, \ldots, n\).

<div class="corollary">

<strong>Corollary 8.5.1 (Hall's SDR Theorem).</strong> The collection \(Q_1, Q_2, \ldots, Q_n\) of subsets of the finite set \(Q\) has an SDR if and only if, for every subset \(J\) of \(\{1, 2, \ldots, n\}\), we have
\[
\left|\bigcup_{i \in J} Q_i\right| \ge |J|.
\]

</div>

### 8.6 Perfect Matchings in Bipartite Graphs

<div class="corollary">

<strong>Corollary 8.6.1.</strong> A bipartite graph \(G\) with bipartition \(A, B\) has a perfect matching if and only if \(|A| = |B|\) and every subset \(D\) of \(A\) satisfies \(|N(D)| \ge |D|\).

</div>

<div class="theorem">

<strong>Theorem 8.6.2.</strong> If \(G\) is a \(k\)-regular bipartite graph with \(k \ge 1\), then \(G\) has a perfect matching.

</div>

The proof verifies Hall's condition: for any \(D \subseteq A\), the sum of degrees gives \(k|D| \le k|N(D)|\), so \(|N(D)| \ge |D|\).

### 8.7 Edge-Colouring

An **edge \(k\)-colouring** of a graph \(G\) is an assignment of one of \(k\) colours to each edge, so that two edges incident with the same vertex receive different colours. Equivalently, it is a partition of the edges into \(k\) matchings.

<div class="theorem">

<strong>Theorem 8.7.1.</strong> A bipartite graph with maximum degree \(\Delta\) has an edge \(\Delta\)-colouring.

</div>

<div class="lemma">

<strong>Lemma 8.7.2.</strong> Let \(G\) be a bipartite graph having at least one edge. Then \(G\) has a matching saturating each vertex of maximum degree.

</div>

The proof of Theorem 8.7.1 uses induction on \(\Delta\): by Lemma 8.7.2, find a matching \(M\) saturating all vertices of maximum degree, remove \(M\), and edge-colour the remaining graph (which has maximum degree \(\Delta - 1\)) by induction, using one additional colour for \(M\).

### 8.8 An Application to Timetabling

The timetabling problem asks for the minimum number of time slots to schedule courses taught by instructors, where no instructor teaches two courses simultaneously. This corresponds to edge-colouring a bipartite graph (instructors vs. courses).

<div class="theorem">

<strong>Theorem 8.8.1.</strong> Let \(G\) be a graph with \(q\) edges, and suppose \(k, m\) are positive integers such that (a) \(G\) has an edge \(k\)-colouring, and (b) \(q \le km\). Then \(G\) has an edge \(k\)-colouring in which every colour is used at most \(m\) times.

</div>

<div class="corollary">

<strong>Corollary 8.8.2.</strong> In a bipartite graph \(G\), there is an edge \(k\)-colouring in which each colour is used at most \(m\) times if and only if (a) \(\Delta \le k\), and (b) \(q \le km\).

</div>

This solves the bounded edge-colouring problem for bipartite graphs, which models timetabling with classroom capacity constraints.
