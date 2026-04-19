---
title: "ECE 457A: Co-operative and Adaptive Algorithms"
prof: "Chunxiao Li"
subjects: "ECE"
---

## Sources and References
**Primary references** — E.-G. Talbi, *Metaheuristics: From Design to Implementation*, Wiley, 2009; A. P. Engelbrecht, *Computational Intelligence: An Introduction*, 2nd ed., Wiley, 2007.
**Supplementary texts** — R. S. Sutton and A. G. Barto, *Reinforcement Learning: An Introduction*, 2nd ed., MIT Press, 2018 (free: incompleteideas.net); F. O. Karray and C. W. De Silva, *Soft Computing and Intelligent Systems Design*, Pearson Education, 2004.
**Online resources** — MIT OpenCourseWare 6.034 Artificial Intelligence; Stuart Russell and Peter Norvig, *Artificial Intelligence: A Modern Approach*, 4th ed. (Chapter 3 on search, Chapters 4–6 on constraint satisfaction and local search).

---

# Chapter 1: Introduction to Computational Intelligence and Search

## 1.1 Ill-Structured Problems and the Need for Heuristics

Classical computer science thrives on well-structured problems: sorting, shortest paths, matrix multiplication. These problems admit exact polynomial-time algorithms whose correctness can be proved analytically. However, the real world is full of **ill-structured problems** — combinatorial optimization tasks, scheduling, planning, and design problems whose solution spaces are so vast that exhaustive enumeration is computationally infeasible.

<div class="definition">
<strong>Ill-structured problem:</strong> A problem for which no efficient exact algorithm is known, typically because the search space grows exponentially with problem size, the objective function is multi-modal or discontinuous, or the problem cannot be fully formalized in advance.
</div>

The travelling salesman problem (TSP) is a canonical example: given \(n\) cities, find the minimum-cost tour visiting each exactly once. The number of distinct tours is \(\frac{(n-1)!}{2}\), which for \(n = 50\) exceeds \(10^{62}\). Even at \(10^{12}\) tour evaluations per second, exhaustive search would take longer than the age of the universe.

**Heuristics** are problem-specific rules of thumb or evaluation functions that guide search toward promising regions of the solution space without guaranteeing optimality. A heuristic sacrifices completeness or optimality guarantees for tractability.

<div class="definition">
<strong>Metaheuristic:</strong> A high-level strategy that guides and modifies subsidiary heuristics to produce solutions to hard optimization problems. Metaheuristics are largely problem-independent and can be applied across a wide range of domains.
</div>

The field of computational intelligence encompasses the design and analysis of algorithms inspired by biological and physical phenomena — evolution, swarm behaviour, neural computation, thermodynamics — to solve problems where classical AI techniques break down.

## 1.2 Problem Representation and Search Spaces

Any search-based algorithm requires a formal specification of:

1. **State space** \(S\): the set of all possible configurations.
2. **Initial state** \(s_0 \in S\): the starting point.
3. **Goal condition** \(G \subseteq S\): the set of acceptable terminal states.
4. **Operators (actions)** \(A\): functions \(a: S \to S\) that transition between states.
5. **Cost function** \(c(s, a, s')\): the cost of applying action \(a\) in state \(s\) to reach state \(s'\).

The **search graph** is the implicit graph whose nodes are states and whose edges are operator applications. For most interesting problems this graph is too large to enumerate explicitly; algorithms explore it lazily.

## 1.3 Graph Search: BFS, DFS, and Informed Search

### 1.3.1 Breadth-First Search

Breadth-first search (BFS) expands nodes layer by layer, exploring all nodes at depth \(d\) before any node at depth \(d+1\). It uses a FIFO queue as the frontier.

**Completeness:** BFS is complete for finite branching factor \(b\).
**Optimality:** BFS finds the shallowest goal. If all edge costs are equal, shallowest implies cheapest; otherwise BFS is not optimal.
**Time complexity:** \(O(b^d)\) where \(d\) is the depth of the shallowest goal.
**Space complexity:** \(O(b^d)\) — the frontier can hold all nodes at depth \(d\).

### 1.3.2 Depth-First Search

Depth-first search (DFS) uses a LIFO stack, diving as deep as possible before backtracking. Its space complexity is only \(O(bm)\) where \(m\) is the maximum depth, but it is neither complete (may loop in infinite graphs) nor optimal.

**Depth-limited search** caps DFS at a predetermined depth limit \(l\), ensuring termination at the cost of possibly missing goals below \(l\).

**Iterative deepening depth-first search (IDDFS)** runs depth-limited DFS with \(l = 0, 1, 2, \ldots\) until a goal is found. Although it re-expands nodes, the dominant cost is at the last level, so the total node count is \(O(b^d)\) — the same asymptotic complexity as BFS but with linear space \(O(bd)\).

### 1.3.3 Uniform-Cost Search

Uniform-cost search (UCS) — also known as Dijkstra's algorithm without a fixed goal — expands the node with the lowest path cost \(g(n)\) first using a min-priority queue. It is complete and optimal for non-negative edge costs.

### 1.3.4 Informed Search and Heuristics

A **heuristic function** \(h(n)\) estimates the cost from node \(n\) to the nearest goal.

<div class="definition">
<strong>Admissibility:</strong> A heuristic \(h\) is admissible if it never overestimates the true cost to reach the goal: \(h(n) \leq h^*(n)\) for all \(n\), where \(h^*(n)\) is the true optimal cost.
</div>

<div class="definition">
<strong>Consistency (monotonicity):</strong> A heuristic \(h\) is consistent if for every node \(n\) and every successor \(n'\) reached by action \(a\):

\[ h(n) \leq c(n, a, n') + h(n') \]

This is a generalisation of the triangle inequality. Consistency implies admissibility.
</div>

### 1.3.5 A* Search

A* evaluates nodes by the function

\[ f(n) = g(n) + h(n) \]

where \(g(n)\) is the exact cost from start to \(n\), and \(h(n)\) is the admissible heuristic estimate from \(n\) to goal.

<div class="theorem">
<strong>Optimality of A*:</strong> If \(h\) is admissible, A* on a tree (or A* with a consistent heuristic on a graph) is complete and optimal — it finds the minimum-cost path to the goal.
</div>

**Proof sketch:** Suppose A* returns a suboptimal goal \(G_2\) with \(f(G_2) = g(G_2) > C^*\) (the optimal cost). At the moment \(G_2\) is selected, there must exist a node \(n\) on an optimal path in the frontier. Since \(h\) is admissible, \(f(n) = g(n) + h(n) \leq C^*\). Therefore \(f(n) \leq C^* < f(G_2)\), meaning A* would expand \(n\) before \(G_2\) — a contradiction.

**Heuristic quality** is measured by the **effective branching factor** \(b^*\): the branching factor of a uniform tree with the same total node count as A*. A perfect heuristic (\(h = h^*\)) gives \(b^* = 1\). Common heuristics for the 8-puzzle:

- **Misplaced tiles:** count of tiles not in their goal position. Admissible (each misplaced tile needs at least one move).
- **Manhattan distance:** \(h = \sum_{i} |x_i - x_i^{\text{goal}}| + |y_i - y_i^{\text{goal}}|\). More informed than misplaced tiles.

<div class="example">
<strong>Worked example — A* on a small graph:</strong>

Consider a graph with nodes A, B, C, D, E and goal E. Edges: A–B cost 1, A–C cost 4, B–C cost 2, B–D cost 5, C–E cost 1, D–E cost 2. Heuristic values: \(h(A)=4, h(B)=3, h(C)=1, h(D)=2, h(E)=0\).

<em>Iteration 1:</em> Frontier = \{A: f=0+4=4\}. Expand A. Generate B (\(g=1, f=4\)), C (\(g=4, f=5\)).

<em>Iteration 2:</em> Best = B (\(f=4\)). Expand B. Generate C via B (\(g=3, f=4\)), D (\(g=6, f=8\)). C via A had \(g=4\), C via B has \(g=3\) — update C.

<em>Iteration 3:</em> Best = C (\(f=4\)). Expand C. Generate E (\(g=4, f=4\)).

<em>Iteration 4:</em> Best = E (\(f=4\)). Goal found. Optimal path: A → B → C → E, cost 4.
</div>

### 1.3.6 IDA*

IDA* (iterative deepening A*) applies the iterative deepening idea to A*. The threshold is the \(f\)-value, not depth. It begins with threshold \(f_0 = h(s_0)\) and performs a depth-first search pruning any node where \(f(n) > \text{threshold}\). If no goal is found, the threshold is increased to the minimum \(f\)-value that was pruned. IDA* is complete, optimal (with admissible \(h\)), and requires only \(O(bd)\) space — crucial for large state spaces where the A* open list becomes too large.

---

# Chapter 2: Constraint Satisfaction and SAT

## 2.1 Constraint Satisfaction Problems

<div class="definition">
<strong>Constraint Satisfaction Problem (CSP):</strong> A CSP is a triple \((X, D, C)\) where \(X = \{x_1, \ldots, x_n\}\) is a set of variables, \(D = \{D_1, \ldots, D_n\}\) is a set of domains (each \(D_i\) is the set of values \(x_i\) may take), and \(C = \{C_1, \ldots, C_m\}\) is a set of constraints. Each constraint \(C_k\) specifies allowable combinations of values for a subset of variables.
</div>

A **solution** is an assignment of values from their respective domains to all variables such that every constraint is satisfied. CSPs are ubiquitous: scheduling, timetabling, graph colouring, Sudoku, circuit layout, and configuration problems all fit this framework.

**Graph colouring** is a classic CSP: \(x_i\) represents the colour of vertex \(i\), \(D_i = \{\text{red, green, blue}\}\), and the constraints are \(x_i \neq x_j\) for every edge \((i, j)\).

## 2.2 Backtracking Search for CSPs

A naive generate-and-test approach assigns values and checks all constraints at the end. Backtracking search instead checks constraints incrementally.

```
function BACKTRACK(assignment, csp):
    if assignment is complete: return assignment
    var ← SELECT-UNASSIGNED-VARIABLE(csp, assignment)
    for each value in ORDER-DOMAIN-VALUES(var, assignment, csp):
        if value is consistent with assignment:
            add {var = value} to assignment
            result ← BACKTRACK(assignment, csp)
            if result ≠ failure: return result
            remove {var = value} from assignment
    return failure
```

### 2.2.1 Variable Ordering: MRV Heuristic

The **Minimum Remaining Values (MRV)** heuristic selects the variable with the fewest legal values remaining in its domain — the most constrained variable, also called the "fail-first" strategy. By tackling the hardest variable first, failures are detected earlier, pruning large portions of the search tree.

### 2.2.2 Value Ordering: LCV Heuristic

Given a selected variable, the **Least Constraining Value (LCV)** heuristic orders values by the number of choices they rule out for neighbouring variables. It prefers the value that leaves the most flexibility for the remaining variables.

### 2.2.3 Forward Checking

**Forward checking (FC)** propagates the effect of each assignment immediately: after assigning \(x_i = v\), it removes values from the domains of all unassigned neighbours that are inconsistent with \(v\). If any domain becomes empty, backtrack immediately.

FC detects some — but not all — inconsistencies. Consider two unassigned variables \(x_j\) and \(x_k\) that are constrained with each other; FC does not check their mutual consistency.

## 2.3 Arc Consistency and AC-3

**Arc consistency** detects inconsistencies more aggressively. An arc \((x_i, x_j)\) is arc-consistent if for every value \(v \in D_i\) there exists at least one value \(w \in D_j\) such that the constraint \(C_{ij}(v, w)\) holds.

The **AC-3** algorithm enforces arc consistency across all arcs:

```
function AC-3(csp):
    queue ← all arcs in csp
    while queue is not empty:
        (x_i, x_j) ← DEQUEUE(queue)
        if REVISE(csp, x_i, x_j):
            if D_i is empty: return false
            for each x_k in NEIGHBOURS(x_i) \ {x_j}:
                ENQUEUE(queue, (x_k, x_i))
    return true

function REVISE(csp, x_i, x_j):
    revised ← false
    for each v in D_i:
        if no w in D_j satisfies constraint C_ij(v, w):
            delete v from D_i
            revised ← true
    return revised
```

<div class="theorem">
<strong>AC-3 complexity:</strong> With \(n\) variables, domain size \(d\), and \(e\) binary constraints, AC-3 runs in \(O(ed^3)\) time. Each arc \((x_i, x_j)\) can be re-inserted at most \(d\) times (once per deletion from \(D_i\)), and each revision takes \(O(d^2)\) time.
</div>

<div class="example">
<strong>AC-3 on map colouring:</strong> Consider Australia's states with the 3-colour domain \(\{R, G, B\}\). Suppose we assign Western Australia (WA) = Red. Forward checking removes Red from the domains of Northern Territory (NT) and South Australia (SA). AC-3 then propagates further: if NT = Green, SA cannot be Green (due to the NT–SA arc), so SA = Blue. Queensland, New South Wales, Victoria, and Tasmania can then be checked.
</div>

## 2.4 SAT and DPLL

**Propositional satisfiability (SAT)** is the prototypical NP-complete problem: given a propositional formula in conjunctive normal form (CNF), decide whether there is a truth assignment satisfying all clauses.

A formula in CNF is a conjunction of **clauses**, each clause being a disjunction of **literals** (a variable or its negation).

The **Davis–Putnam–Logemann–Loveland (DPLL)** algorithm is a complete, backtracking-based search for SAT:

```
function DPLL(clauses, symbols, model):
    if all clauses are true in model: return true
    if any clause is false in model: return false
    P, value ← FIND-PURE-SYMBOL(symbols, clauses, model)
    if P: return DPLL(clauses, symbols \ {P}, model ∪ {P=value})
    P, value ← FIND-UNIT-CLAUSE(clauses, model)
    if P: return DPLL(clauses, symbols \ {P}, model ∪ {P=value})
    P ← FIRST(symbols)
    return DPLL(clauses, REST(symbols), model ∪ {P=true})
        or DPLL(clauses, REST(symbols), model ∪ {P=false})
```

Two key simplifications:

- **Pure symbol rule:** A literal is pure if it appears with only one polarity in all clauses. Assign it the satisfying polarity; no clause is harmed.
- **Unit clause rule:** A clause with exactly one unassigned literal is a unit clause — the literal must be assigned the satisfying value immediately (unit propagation).

DPLL with unit propagation is the foundation of modern SAT solvers (CDCL — conflict-driven clause learning), which can handle formulas with millions of variables.

## 2.5 Model Checking

Model checking verifies that a system satisfies a specification expressed in temporal logic (e.g., CTL or LTL). The system is modelled as a **Kripke structure**: a finite directed graph where nodes are system states, edges are transitions, and each node is labelled with the set of atomic propositions true in that state.

Model checking can be viewed as a CSP: find states (or paths) satisfying the temporal formula. For finite-state systems, model checking is decidable and runs in polynomial time in the size of the state space; the challenge is the **state explosion problem** — the state space grows exponentially with the number of concurrent components.

Techniques to combat state explosion include:
- **Symbolic model checking** using Binary Decision Diagrams (BDDs)
- **Bounded model checking** using SAT solvers (unroll the transition relation \(k\) steps and check satisfiability)
- **Abstraction and refinement** (CEGAR: counterexample-guided abstraction refinement)

---

# Chapter 3: Simulated Annealing

## 3.1 Motivation: Escaping Local Optima

Pure local search — hill climbing — iteratively moves to a neighbour with better objective value. It is fast and requires little memory, but it gets trapped in **local optima**: states better than all their neighbours but not globally optimal. For multi-modal landscapes (many peaks and valleys), hill climbing is unreliable.

**Simulated annealing (SA)** is a probabilistic local search metaheuristic that allows uphill moves (moves that worsen the objective) with a probability that decreases over time. The name and inspiration come from the physical process of annealing: slowly cooling a molten material so that atoms settle into a low-energy crystalline structure. Cooling too quickly (quenching) produces a disordered, high-energy structure; slow cooling allows exploration of the energy landscape before settling.

## 3.2 The Metropolis Acceptance Criterion

At each step of SA, a candidate neighbour solution \(s'\) is generated from the current solution \(s\). If \(s'\) is better (lower cost for minimisation), it is accepted unconditionally. If \(s'\) is worse by \(\Delta E = f(s') - f(s) > 0\), it is accepted with probability

\[ P(\text{accept}) = e^{-\Delta E / T} \]

where \(T\) is the current **temperature** parameter. This is the **Metropolis acceptance criterion**, borrowed from statistical mechanics.

<div class="remark">
At high \(T\), \(e^{-\Delta E / T} \approx 1\) for moderate \(\Delta E\): almost all moves are accepted, and the search resembles a random walk. At low \(T\), \(e^{-\Delta E / T} \approx 0\) for any \(\Delta E > 0\): the algorithm becomes essentially greedy hill climbing. The gradual reduction of \(T\) transitions the algorithm from exploration to exploitation.
</div>

```
function SIMULATED-ANNEALING(problem, schedule):
    current ← INITIAL-STATE(problem)
    T ← schedule(0)
    for t = 1 to ∞:
        T ← schedule(t)
        if T = 0: return current
        next ← RANDOM-NEIGHBOUR(current)
        ΔE ← f(next) - f(current)
        if ΔE < 0:
            current ← next
        else:
            current ← next with probability e^{-ΔE / T}
```

## 3.3 Cooling Schedules

The cooling schedule \(T(t)\) governs the temperature at step \(t\). Common schedules:

**Exponential (geometric) cooling:**

\[ T(t) = T_0 \cdot \alpha^t, \quad 0 < \alpha < 1 \]

where \(T_0\) is the initial temperature and \(\alpha\) is the cooling rate (typically 0.9–0.999). This is the most common schedule in practice. The algorithm runs for a fixed number of steps or until \(T\) drops below a threshold.

**Logarithmic cooling:**

\[ T(t) = \frac{T_0}{\ln(1 + t)} \]

This schedule satisfies the theoretical convergence condition but is extremely slow in practice.

**Adaptive cooling:** The temperature is updated based on acceptance statistics. If the acceptance rate is too high, cool faster; if too low, cool slower.

## 3.4 Convergence Theory

<div class="theorem">
<strong>Convergence of SA:</strong> Simulated annealing converges to the global optimum in probability if the temperature is reduced no faster than

\[ T(t) = \frac{C}{\ln(1+t)} \]

where \(C \geq \Delta_{\max}\), the maximum energy difference between any two neighbouring states.
</div>

In practice, logarithmic cooling is too slow. Practical SA with exponential cooling is not guaranteed to find the global optimum but often finds very good solutions efficiently. The key design choices are:

1. **Neighbourhood structure:** What constitutes a neighbour of a solution?
2. **Initial temperature \(T_0\):** Often set so that an initial acceptance rate of ~80% is achieved.
3. **Cooling rate \(\alpha\):** Slower cooling (larger \(\alpha\)) gives better solutions at the cost of more iterations.
4. **Termination:** Fixed iterations, temperature threshold, or no improvement for \(k\) steps.

<div class="example">
<strong>SA for TSP:</strong> A state is a permutation of cities representing the tour. A natural neighbourhood uses the <em>2-opt move</em>: select two edges, remove them, and reconnect the two paths in the other valid way. For a tour with segments A–B–...–C–D, a 2-opt move removes edges (A,B) and (C,D) and adds (A,C) and (B,D), reversing the segment B–...–C. The cost change \(\Delta E\) is the difference in the lengths of the removed and added edges. If \(\Delta E < 0\), accept; otherwise accept with probability \(e^{-\Delta E/T}\).
</div>

---

# Chapter 4: Tabu Search

## 4.1 Motivation and Core Idea

Tabu search (TS), introduced by Fred Glover in 1986, is a deterministic local search metaheuristic that uses adaptive memory to guide the search. Unlike simulated annealing, TS accepts the best available move even if it worsens the objective — and it explicitly avoids revisiting recently visited solutions via the **tabu list**.

<div class="definition">
<strong>Tabu list:</strong> A short-term memory structure that records recently visited solutions (or move attributes) and prohibits (makes <em>tabu</em>) moves that would return to them for a fixed number of iterations (the <em>tabu tenure</em>).
</div>

## 4.2 Algorithm Structure

```
function TABU-SEARCH(problem):
    s ← INITIAL-SOLUTION(problem)
    s_best ← s
    tabu_list ← []
    for each iteration:
        candidates ← GENERATE-NEIGHBOURHOOD(s)
        s' ← best solution in candidates not in tabu_list
               (or satisfying aspiration criterion)
        update tabu_list with move that produced s'
        s ← s'
        if f(s) < f(s_best): s_best ← s
    return s_best
```

At each iteration, the algorithm examines all neighbours of the current solution and moves to the best one that is not forbidden by the tabu list. This "best of the non-tabu" strategy means the algorithm will climb out of local optima by accepting worsening moves when no improving non-tabu move exists.

## 4.3 Tabu List Representation

Storing entire solutions in the tabu list is memory-intensive. In practice, the list stores **move attributes** (characteristics of the move rather than the resulting solution). For TSP, a common attribute is the pair of cities whose connecting edge was added or removed. A move is tabu if its reversal attributes appear in the list.

**Tabu tenure** (list size) is critical:
- Too short: the algorithm may cycle among a small set of solutions.
- Too long: too many moves are forbidden, restricting exploration.

Dynamic tenure — varying the list size during the search — can improve performance.

## 4.4 Aspiration Criteria

Since tabu moves may sometimes lead to the global optimum, tabu status can be overridden by an **aspiration criterion**. The most common criterion:

<div class="definition">
<strong>Aspiration by objective:</strong> A tabu move is permitted if it leads to a solution better than the best solution found so far (\(f(s') < f(s_{\text{best}})\)).
</div>

This ensures that genuinely excellent moves are never blocked solely because they are tabu.

## 4.5 Intensification and Diversification

A sophisticated tabu search uses two complementary strategies:

**Intensification:** Focus the search on the most promising region of the solution space. Achieved by returning to elite solutions (the best solutions found), increasing the tabu tenure to prevent escape, and applying more refined neighbourhood operations in the promising region.

**Diversification:** Force the search into unexplored regions when the current region appears exhausted. Achieved by penalising frequently visited solution attributes (frequency-based memory), reducing the tabu tenure to allow more moves, or restarting from a randomly generated solution.

<div class="remark">
Long-term memory structures (frequency memories, recency memories, and quality memories) distinguish advanced tabu search from basic implementations. The frequency memory records how often each solution attribute has appeared; moves involving frequently seen attributes are penalised during diversification phases.
</div>

## 4.6 Comparison with Simulated Annealing

| Feature | Simulated Annealing | Tabu Search |
|---|---|---|
| Acceptance of worse solutions | Probabilistic | Deterministic (best non-tabu) |
| Memory | None (memoryless) | Short- and long-term memory |
| Parameters | Temperature schedule | Tabu tenure, aspiration |
| Theoretical guarantee | Convergence to global optimum (impractical schedule) | Convergence under certain conditions |
| Typical performance | Good general-purpose | Often superior on combinatorial problems |

---

# Chapter 5: Genetic Algorithms

## 5.1 Biological Motivation

Genetic algorithms (GAs), introduced by John Holland in the 1970s, are population-based search methods inspired by Darwinian evolution. A **population** of candidate solutions (individuals) evolves over generations via selection, crossover (recombination), and mutation. Fitter individuals reproduce more often, propagating good "genetic material" through the population. The population explores multiple regions of the search space simultaneously, providing natural parallelism and robustness.

## 5.2 Representation

Individuals are typically encoded as **chromosomes** — binary strings, integer strings, real-valued vectors, or permutations depending on the problem. The **genotype** is the encoding; the **phenotype** is the decoded solution.

For binary encoding, a solution is a bit string \(x = (x_1, x_2, \ldots, x_L)\) where each \(x_i \in \{0, 1\}\). For continuous optimisation, real-valued vectors are used directly (real-coded GA). For permutation problems like TSP, individuals are permutations of \(\{1, \ldots, n\}\).

## 5.3 Fitness Function

The **fitness function** \(f(x)\) measures the quality of individual \(x\). For maximisation problems, the fitness is the objective value directly. For minimisation, a common transformation is \(f(x) = \frac{1}{1 + \text{cost}(x)}\) or \(f(x) = f_{\max} - \text{cost}(x)\).

## 5.4 Selection

Selection determines which individuals reproduce. Individuals with higher fitness should be selected more often, but some selection pressure toward poorer individuals maintains diversity.

### 5.4.1 Roulette Wheel Selection (Fitness-Proportionate)

Each individual \(i\) is assigned a selection probability proportional to its fitness:

\[ P(i) = \frac{f(x_i)}{\sum_{j=1}^{N} f(x_j)} \]

Imagine a roulette wheel where each individual occupies a slice proportional to its fitness. This method is simple but has problems: if one individual has very high fitness, it dominates selection (premature convergence); if all fitnesses are close, selection is nearly random.

### 5.4.2 Tournament Selection

Select \(k\) individuals at random and choose the best among them as a parent. Repeat for the second parent. Tournament size \(k\) controls selection pressure: \(k=2\) is mild; large \(k\) gives strong pressure toward the best individual.

Tournament selection does not require global fitness information, avoids the scaling problems of roulette wheel, and is computationally efficient.

### 5.4.3 Rank Selection

Individuals are ranked by fitness; selection probability is proportional to rank rather than raw fitness. This reduces the dominance of highly fit individuals.

## 5.5 Crossover (Recombination)

Crossover combines the genetic material of two parents to produce offspring.

### 5.5.1 One-Point Crossover

Choose a random crossover point \(k \in \{1, \ldots, L-1\}\). The first offspring takes bits \(1\) to \(k\) from parent 1 and bits \(k+1\) to \(L\) from parent 2. The second offspring takes the complementary segments.

\[ P_1 = \underbrace{1010}_{\text{first }k}\underbrace{110}_{\text{last }L-k}, \quad P_2 = \underbrace{0110}_{\text{first }k}\underbrace{011}_{\text{last }L-k} \]

\[ O_1 = 1010\,011, \quad O_2 = 0110\,110 \]

### 5.5.2 Two-Point Crossover

Two crossover points \(k_1 < k_2\) are chosen. The middle segment \(k_1+1\) to \(k_2\) is swapped between parents.

### 5.5.3 Uniform Crossover

Each bit position is independently assigned to offspring 1 or offspring 2 with probability 0.5 (determined by a random mask). Uniform crossover has no positional bias but disrupts any building blocks embedded in contiguous substrings.

## 5.6 Mutation

Mutation introduces random changes to maintain diversity and explore new regions.

**Bit-flip mutation:** Each bit is flipped independently with probability \(p_m\) (typically \(p_m = 1/L\)). This ensures on average one mutation per chromosome.

**Gaussian mutation (real-coded):** Add Gaussian noise \(\mathcal{N}(0, \sigma^2)\) to each gene.

Mutation rate is a critical parameter: too high and the GA becomes a random search; too low and genetic diversity is lost, leading to premature convergence.

## 5.7 The GA Main Loop

```
function GENETIC-ALGORITHM(population_size, max_generations):
    P ← INITIALISE-POPULATION(population_size)
    evaluate fitness of each individual in P
    for each generation t = 1 to max_generations:
        P' ← []
        while |P'| < population_size:
            p1, p2 ← SELECT(P)
            if rand() < p_c:
                o1, o2 ← CROSSOVER(p1, p2)
            else:
                o1, o2 ← p1, p2
            o1 ← MUTATE(o1, p_m)
            o2 ← MUTATE(o2, p_m)
            P' ← P' ∪ {o1, o2}
        P ← P'
        evaluate fitness of each individual in P
    return best individual ever seen
```

**Elitism:** Copy the best individual(s) from generation \(t\) directly to generation \(t+1\) without modification. Elitism guarantees the best solution found is never lost.

## 5.8 The Schema Theorem

Holland's schema theorem provides a theoretical justification for GAs. A **schema** \(H\) is a template over \(\{0, 1, *\}\) where \(*\) is a wildcard matching either 0 or 1. For example, \(H = 1**0\) matches the strings \(\{1000, 1010, 1100, 1110\}\).

Key schema properties:
- **Order** \(o(H)\): number of fixed bits (non-wildcards).
- **Defining length** \(\delta(H)\): distance between the first and last fixed bit positions.
- **Fitness** \(\hat{f}(H, t)\): average fitness of schema instances in the population at generation \(t\).

<div class="theorem">
<strong>Schema Theorem (Holland 1975):</strong> The expected number of instances of schema \(H\) in generation \(t+1\) satisfies:

\[ m(H, t+1) \geq m(H, t) \cdot \frac{\hat{f}(H, t)}{\bar{f}(t)} \cdot \left(1 - p_c \frac{\delta(H)}{L-1} - o(H) \cdot p_m\right) \]

where \(\bar{f}(t)\) is the mean fitness of the population, \(p_c\) is the crossover probability, \(p_m\) is the mutation probability, and \(L\) is the chromosome length.
</div>

The schema theorem states that **short, low-order, above-average schemata receive exponentially increasing representation** in successive generations. These are called **building blocks** — substructures that contribute positively to fitness. The **Building Block Hypothesis** posits that GAs work by identifying, preserving, and recombining building blocks.

<div class="remark">
The schema theorem is an inequality and gives only a lower bound. It does not account for the creation of schema instances by crossover and mutation, and the Building Block Hypothesis remains controversial. Nevertheless, the theorem explains why GAs tend to focus on short, fit, low-order patterns and provides guidance on parameter settings.
</div>

<div class="example">
<strong>GA for function optimisation:</strong> Maximise \(f(x) = x^2\) over integers \(x \in [0, 31]\) encoded as 5-bit binary strings. Population: \(\{01101 (f=169), 11000 (f=576), 01000 (f=64), 10011 (f=361)\}\). Total fitness = 1170.

Roulette probabilities: 0.145, 0.493, 0.055, 0.309. After selection and crossover, the population should shift toward higher values. After one-point crossover of 11000 and 10011 at position 2: offspring are 11011 (\(f=729\)) and 10000 (\(f=256\)). The population's average fitness increases.
</div>

---

# Chapter 6: Swarm Intelligence and Particle Swarm Optimisation

## 6.1 Principles of Swarm Intelligence

Swarm intelligence studies collective behaviours emerging from interactions among simple agents that follow local rules. No central controller directs the swarm; global intelligent behaviour arises from self-organisation. Examples from nature include:

- **Bird flocking (Reynolds boids):** Cohesion, separation, and alignment rules produce lifelike flocking.
- **Fish schooling:** Predator avoidance and foraging coordination without a leader.
- **Ant colonies:** Stigmergic communication via pheromones enables collective path optimisation.

Swarm intelligence algorithms harness these principles for optimisation. The two most important are Particle Swarm Optimisation (PSO, inspired by flocking) and Ant Colony Optimisation (ACO, inspired by ant foraging).

## 6.2 Particle Swarm Optimisation

Particle swarm optimisation was introduced by Kennedy and Eberhart in 1995, inspired by the social behaviour of bird flocks and fish schools. A **swarm** of \(N\) particles explores the search space, each particle representing a candidate solution.

Each particle \(i\) has:
- **Position** \(\mathbf{x}_i(t)\): current candidate solution at time \(t\).
- **Velocity** \(\mathbf{v}_i(t)\): direction and speed of movement.
- **Personal best** \(\mathbf{p}_i\): best position particle \(i\) has ever visited.
- **Global best** \(\mathbf{g}\): best position any particle has ever visited (global PSO) or best in the particle's neighbourhood (local PSO).

## 6.3 Velocity Update Equation

The core of PSO is the **velocity update rule**:

\[ \mathbf{v}_i(t+1) = w \mathbf{v}_i(t) + c_1 r_1 (\mathbf{p}_i - \mathbf{x}_i(t)) + c_2 r_2 (\mathbf{g} - \mathbf{x}_i(t)) \]

where:
- \(w\) is the **inertia weight**: controls momentum, balancing exploration and exploitation.
- \(c_1\) is the **cognitive coefficient**: weight of the cognitive (personal) component.
- \(c_2\) is the **social coefficient**: weight of the social (global) component.
- \(r_1, r_2 \sim U(0,1)\) are independent uniform random numbers, introducing stochasticity.

The position update is:

\[ \mathbf{x}_i(t+1) = \mathbf{x}_i(t) + \mathbf{v}_i(t+1) \]

<div class="remark">
The three components of the velocity update have clear interpretations: the <em>inertia term</em> \(w\mathbf{v}_i(t)\) keeps the particle moving in its current direction; the <em>cognitive term</em> \(c_1 r_1(\mathbf{p}_i - \mathbf{x}_i)\) pulls the particle toward its own best-known position; the <em>social term</em> \(c_2 r_2(\mathbf{g} - \mathbf{x}_i)\) pulls the particle toward the globally best-known position.
</div>

## 6.4 Parameter Guidelines

Standard parameter settings (Clerc and Kennedy, 2002):
- \(w = 0.729\) (constriction coefficient derivation)
- \(c_1 = c_2 = 1.496\)
- Swarm size: 20–50 particles for most problems.

Alternatively, using the **constriction factor** formulation:

\[ \mathbf{v}_i(t+1) = \chi \left[ \mathbf{v}_i(t) + c_1 r_1 (\mathbf{p}_i - \mathbf{x}_i) + c_2 r_2 (\mathbf{g} - \mathbf{x}_i) \right] \]

where

\[ \chi = \frac{2}{\left| 2 - \phi - \sqrt{\phi^2 - 4\phi} \right|}, \quad \phi = c_1 + c_2 > 4 \]

This guarantees convergence under certain conditions.

## 6.5 PSO Algorithm

```
function PSO(swarm_size, max_iterations, problem):
    initialise each particle i with random x_i, v_i
    p_i ← x_i; g ← argmin_{i} f(p_i)
    for t = 1 to max_iterations:
        for each particle i:
            r1, r2 ← Uniform(0,1)
            v_i ← w*v_i + c1*r1*(p_i - x_i) + c2*r2*(g - x_i)
            x_i ← x_i + v_i
            if f(x_i) < f(p_i): p_i ← x_i
            if f(p_i) < f(g): g ← p_i
    return g
```

## 6.6 Topology Variants

- **Global best (gbest):** All particles share a single global best. Fast convergence but susceptible to premature convergence.
- **Local best (lbest):** Each particle's social component uses the best in its neighbourhood (e.g., a ring of size \(k=2\)). Slower convergence but better diversity.
- **Von Neumann topology:** Particles on a 2D grid, each connected to four neighbours. Good balance between exploration and exploitation.

---

# Chapter 7: Ant Colony Optimisation

## 7.1 Foraging Behaviour of Ants

Real ants find shortest paths between nest and food sources through stigmergy — indirect communication via pheromone trails. When ants traverse a path, they deposit pheromone; shorter paths are completed faster, receiving more pheromone per unit time, and are therefore more attractive to subsequent ants. This positive feedback loop causes the colony to converge to the shortest path.

**Key insight:** Pheromone evaporation (negative feedback) prevents premature convergence to suboptimal paths and allows adaptation to changing environments.

## 7.2 Ant Colony Optimisation Framework

Ant Colony Optimisation (ACO), introduced by Marco Dorigo in his 1992 PhD thesis, is a metaheuristic for combinatorial optimisation inspired by ant foraging. The problem must be representable as a **construction graph**: a graph where nodes represent solution components and a complete solution corresponds to a path.

Each edge \((i, j)\) has:
- **Pheromone trail** \(\tau_{ij}\): a learned, adaptive quantity representing the historical desirability of the transition.
- **Heuristic information** \(\eta_{ij}\): a problem-specific, fixed quantity (e.g., \(1/d_{ij}\) for TSP where \(d_{ij}\) is the distance).

## 7.3 Ant System (AS)

The original ACO algorithm, Ant System (AS), works as follows:

**Construction:** Each ant \(k\) builds a solution incrementally. From node \(i\), it chooses the next node \(j\) probabilistically:

\[ P_{ij}^k = \frac{[\tau_{ij}]^\alpha [\eta_{ij}]^\beta}{\sum_{l \in \mathcal{N}_i^k} [\tau_{il}]^\alpha [\eta_{il}]^\beta}, \quad j \in \mathcal{N}_i^k \]

where \(\mathcal{N}_i^k\) is the set of nodes not yet visited by ant \(k\) (the feasible neighbourhood), \(\alpha\) controls the influence of pheromone, and \(\beta\) controls the influence of heuristic information.

**Pheromone update:** After all \(m\) ants complete their tours, pheromone is updated globally:

\[ \tau_{ij} \leftarrow (1 - \rho) \tau_{ij} + \Delta\tau_{ij} \]

where \(\rho \in (0,1)\) is the **evaporation rate** and

\[ \Delta\tau_{ij} = \sum_{k=1}^{m} \Delta\tau_{ij}^k \]

Each ant \(k\) contributes:

\[ \Delta\tau_{ij}^k = \begin{cases} \frac{Q}{L^k} & \text{if ant } k \text{ used edge } (i,j) \\ 0 & \text{otherwise} \end{cases} \]

where \(L^k\) is the tour length of ant \(k\) and \(Q\) is a constant. Shorter tours deposit more pheromone per unit length.

## 7.4 Ant Colony System (ACS)

ACS, a more advanced ACO variant by Dorigo and Gambardella (1997), introduces two key improvements:

### 7.4.1 Pseudo-Random Proportional Rule

Instead of always using the probabilistic rule, ACS uses a parameter \(q_0 \in [0,1]\):
- With probability \(q_0\): choose the edge maximising \(\tau_{ij}^\alpha \cdot \eta_{ij}^\beta\) (exploitation).
- With probability \(1 - q_0\): use the probabilistic rule (exploration).

This balances exploitation of known good paths with exploration of new ones.

### 7.4.2 Local Pheromone Update

After each construction step, the ant updates the pheromone on the used edge:

\[ \tau_{ij} \leftarrow (1 - \phi) \tau_{ij} + \phi \tau_0 \]

where \(\phi\) is the local evaporation rate and \(\tau_0\) is the initial pheromone value. This reduces the pheromone on used edges, making them less attractive to subsequent ants and encouraging exploration.

### 7.4.3 Global Pheromone Update (Best Ant Only)

Only the globally best ant (or the best ant of the current iteration) deposits pheromone:

\[ \tau_{ij} \leftarrow (1-\rho)\tau_{ij} + \rho \cdot \frac{1}{L_{\text{best}}} \quad \text{for edges in the best tour} \]

<div class="example">
<strong>ACO for TSP — worked trace:</strong> Consider a 4-city TSP with distance matrix \(d = \begin{pmatrix} 0 & 2 & 9 & 10 \\ 2 & 0 & 6 & 4 \\ 9 & 6 & 0 & 8 \\ 10 & 4 & 8 & 0 \end{pmatrix}\). Initialise \(\tau_{ij} = \tau_0 = 0.1\) for all edges. Set \(\alpha = 1, \beta = 2, \rho = 0.5\), one ant.

Heuristic values: \(\eta_{12} = 1/2 = 0.5\), \(\eta_{13} = 1/9 \approx 0.11\), \(\eta_{14} = 1/10 = 0.1\), \(\eta_{23} = 1/6 \approx 0.17\), \(\eta_{24} = 1/4 = 0.25\), \(\eta_{34} = 1/8 = 0.125\).

Ant starts at city 1. Probabilities for next city: proportional to \(\tau \cdot \eta^2\): edge (1,2): \(0.1 \times 0.25 = 0.025\); edge (1,3): \(0.1 \times 0.012 = 0.0012\); edge (1,4): \(0.1 \times 0.01 = 0.001\). City 2 is strongly favoured. Continue to build tour 1→2→4→3→1 with length \(2+4+8+9=23\). After pheromone update with \(\rho=0.5\): \(\tau_{ij} \leftarrow 0.5 \times 0.1 + 1/23 \approx 0.093\) on tour edges; other edges decay to \(0.05\).
</div>

## 7.5 MAX-MIN Ant System (MMAS)

MMAS restricts pheromone values to the interval \([\tau_{\min}, \tau_{\max}]\) to prevent stagnation (all ants following the same path) and premature convergence. Only the best ant (global or iteration best) deposits pheromone. Pheromone trails are initialised at \(\tau_{\max}\).

## 7.6 Key ACO Parameters

| Parameter | Role | Typical value |
|---|---|---|
| \(\alpha\) | Pheromone importance | 1 |
| \(\beta\) | Heuristic importance | 2–5 |
| \(\rho\) | Evaporation rate | 0.1–0.5 |
| \(m\) | Number of ants | \(n\) (number of cities) |
| \(\tau_0\) | Initial pheromone | \(1 / (n \cdot L_{\text{nn}})\) where \(L_{\text{nn}}\) is the nearest-neighbour tour length |

---

# Chapter 8: Reinforcement Learning

## 8.1 The Reinforcement Learning Framework

Reinforcement learning (RL) addresses a fundamentally different setting from supervised learning. An **agent** interacts with an **environment** in discrete time steps. At each step \(t\):

1. The agent observes state \(S_t \in \mathcal{S}\).
2. It selects action \(A_t \in \mathcal{A}(S_t)\) according to its **policy** \(\pi(a|s) = P(A_t=a | S_t=s)\).
3. The environment transitions to state \(S_{t+1}\) and emits **reward** \(R_{t+1} \in \mathbb{R}\).

The agent's goal is to learn a policy that maximises the expected **cumulative discounted return**:

\[ G_t = R_{t+1} + \gamma R_{t+2} + \gamma^2 R_{t+3} + \cdots = \sum_{k=0}^{\infty} \gamma^k R_{t+k+1} \]

where \(\gamma \in [0,1)\) is the **discount factor**: rewards in the far future are worth less than immediate rewards. When \(\gamma = 0\), only immediate reward matters; as \(\gamma \to 1\), all future rewards are weighted equally.

## 8.2 Markov Decision Processes

<div class="definition">
<strong>Markov Decision Process (MDP):</strong> A tuple \((\mathcal{S}, \mathcal{A}, P, R, \gamma)\) where \(\mathcal{S}\) is the state space, \(\mathcal{A}\) is the action space, \(P(s'|s,a)\) is the transition probability, \(R(s,a,s')\) is the reward function, and \(\gamma\) is the discount factor. The Markov property requires that the future depends only on the current state: \(P(S_{t+1}|S_t, A_t, S_{t-1}, A_{t-1}, \ldots) = P(S_{t+1}|S_t, A_t)\).
</div>

## 8.3 Value Functions

The **state-value function** under policy \(\pi\):

\[ V^\pi(s) = \mathbb{E}_\pi \left[ G_t \mid S_t = s \right] = \mathbb{E}_\pi \left[ \sum_{k=0}^{\infty} \gamma^k R_{t+k+1} \mid S_t = s \right] \]

The **action-value function** (Q-function) under policy \(\pi\):

\[ Q^\pi(s,a) = \mathbb{E}_\pi \left[ G_t \mid S_t = s, A_t = a \right] \]

## 8.4 The Bellman Equations

The **Bellman expectation equation** expresses the value function as a recursive relationship:

\[ V^\pi(s) = \sum_{a} \pi(a|s) \sum_{s'} P(s'|s,a) \left[ R(s,a,s') + \gamma V^\pi(s') \right] \]

Similarly for the action-value function:

\[ Q^\pi(s,a) = \sum_{s'} P(s'|s,a) \left[ R(s,a,s') + \gamma \sum_{a'} \pi(a'|s') Q^\pi(s',a') \right] \]

The **optimal value function** \(V^*(s) = \max_\pi V^\pi(s)\) satisfies the **Bellman optimality equation**:

\[ V^*(s) = \max_{a} \sum_{s'} P(s'|s,a) \left[ R(s,a,s') + \gamma V^*(s') \right] \]

The optimal Q-function satisfies:

\[ Q^*(s,a) = \sum_{s'} P(s'|s,a) \left[ R(s,a,s') + \gamma \max_{a'} Q^*(s',a') \right] \]

The optimal policy selects the action maximising \(Q^*(s,a)\): \(\pi^*(s) = \arg\max_a Q^*(s,a)\).

## 8.5 Temporal Difference Learning

Model-free RL methods learn directly from experience without a model of \(P\) or \(R\). **Temporal difference (TD) learning** combines the ideas of Monte Carlo methods (learning from complete episodes) and dynamic programming (bootstrapping — using estimates to update estimates).

The simplest TD update is **TD(0)**. After observing transition \((s, a, r, s')\):

\[ V(s) \leftarrow V(s) + \alpha \left[ r + \gamma V(s') - V(s) \right] \]

The term \(\delta_t = r + \gamma V(s') - V(s)\) is the **TD error**: the difference between the estimated value and the updated estimate based on the observed reward and next state.

## 8.6 Q-Learning

Q-learning (Watkins, 1989) is an off-policy TD control algorithm that directly learns the optimal action-value function \(Q^*\) regardless of the policy followed.

**Q-learning update rule:**

\[ Q(S_t, A_t) \leftarrow Q(S_t, A_t) + \alpha \left[ R_{t+1} + \gamma \max_{a'} Q(S_{t+1}, a') - Q(S_t, A_t) \right] \]

The key insight is the \(\max_{a'}\) operator: Q-learning always updates toward the optimal action in the next state, even if the behaviour policy does not take that action.

```
function Q-LEARNING(episodes, alpha, gamma, epsilon):
    initialise Q(s,a) arbitrarily for all s, a; Q(terminal,.) = 0
    for each episode:
        S ← initial state
        while S is not terminal:
            A ← epsilon-greedy action from Q(S,.)
            take action A; observe R, S'
            Q(S,A) ← Q(S,A) + alpha * [R + gamma * max_a Q(S',a) - Q(S,A)]
            S ← S'
    return Q
```

<div class="theorem">
<strong>Convergence of Q-learning:</strong> Q-learning converges to the optimal \(Q^*\) with probability 1 if every state-action pair is visited infinitely often and the learning rate satisfies the Robbins-Monro conditions: \(\sum_t \alpha_t = \infty\) and \(\sum_t \alpha_t^2 < \infty\).
</div>

## 8.7 Exploration vs. Exploitation

A key challenge in RL is the **exploration-exploitation dilemma**: should the agent exploit its current best policy or explore less-visited actions that might lead to higher long-term rewards?

**Epsilon-greedy exploration:** With probability \(\epsilon\), take a random action; with probability \(1-\epsilon\), take the greedy action \(\arg\max_a Q(s,a)\).

\[ A_t = \begin{cases} \arg\max_a Q(S_t, a) & \text{with probability } 1-\epsilon \\ \text{random action} & \text{with probability } \epsilon \end{cases} \]

**Decaying epsilon:** Start with \(\epsilon = 1\) (pure exploration) and decay toward 0 (pure exploitation) to exploit learned knowledge as training progresses.

**Softmax (Boltzmann) exploration:** Select action \(a\) with probability:

\[ P(a|s) = \frac{e^{Q(s,a)/\tau}}{\sum_{a'} e^{Q(s,a')/\tau}} \]

where \(\tau\) is the temperature. High \(\tau\) gives near-uniform exploration; low \(\tau\) concentrates probability on the best action.

## 8.8 SARSA: On-Policy TD Control

SARSA (State–Action–Reward–State–Action) is an **on-policy** TD control algorithm. It learns \(Q^\pi\) for the policy \(\pi\) being followed:

\[ Q(S_t, A_t) \leftarrow Q(S_t, A_t) + \alpha \left[ R_{t+1} + \gamma Q(S_{t+1}, A_{t+1}) - Q(S_t, A_t) \right] \]

The difference from Q-learning: instead of \(\max_{a'} Q(S_{t+1}, a')\), SARSA uses \(Q(S_{t+1}, A_{t+1})\) — the value of the actual next action taken. SARSA is safer in systems where exploration-induced penalties matter (e.g., cliff walking), since it accounts for the exploratory policy in its update.

<div class="example">
<strong>Q-learning on a grid world:</strong> A \(4 \times 4\) grid with start at (0,0), goal at (3,3), and a wall at (1,1). Actions: \(\{N, S, E, W\}\). Reward: +10 at goal, -1 per step, -5 for hitting a wall. With \(\alpha = 0.1, \gamma = 0.9, \epsilon = 0.1\):

<em>Step 1:</em> State (0,0), Q-values all 0. Epsilon-greedy selects East (random). Reach (0,1), reward -1. Update: \(Q((0,0),E) \leftarrow 0 + 0.1[-1 + 0.9 \times 0 - 0] = -0.1\).

After many episodes, Q-values converge so that the greedy policy navigates around the wall to the goal efficiently.
</div>

## 8.9 Deep Reinforcement Learning

When the state space is continuous or very large, tabular Q-learning is impractical. **Deep Q-Networks (DQN)** approximate \(Q^*(s,a)\) with a neural network \(Q(s,a;\theta)\) parameterised by weights \(\theta\).

Key innovations of DQN (Mnih et al., 2015):

1. **Experience replay:** Store transitions \((s,a,r,s')\) in a replay buffer and sample mini-batches for training. Breaks temporal correlations in sequential data.
2. **Target network:** Use a separate, periodically updated target network \(Q(s,a;\theta^-)\) to compute the TD target. Prevents oscillations from the target and current network being the same.

The loss function for DQN:

\[ \mathcal{L}(\theta) = \mathbb{E}_{(s,a,r,s') \sim \mathcal{D}} \left[ \left( r + \gamma \max_{a'} Q(s',a';\theta^-) - Q(s,a;\theta) \right)^2 \right] \]

---

# Chapter 9: Putting It All Together — Algorithm Selection and Design

## 9.1 Taxonomy of Optimisation Algorithms

The algorithms covered in this course occupy different positions in the algorithm design space:

**Exact algorithms** (dynamic programming, branch-and-bound): guarantee optimal solutions but are computationally feasible only for small instances.

**Constructive heuristics** (nearest-neighbour for TSP, greedy algorithms): build a solution incrementally; fast but quality depends heavily on problem structure.

**Local search** (hill climbing, SA, TS): start with a complete solution and improve iteratively; good for continuous or discrete problems with a well-defined neighbourhood.

**Population-based methods** (GA, PSO, ACO): maintain a set of solutions and exchange information between them; natural parallelism, good for multi-modal landscapes.

**Reinforcement learning**: learn a policy from interaction with an environment; suited to sequential decision-making problems.

## 9.2 No Free Lunch Theorem

<div class="theorem">
<strong>No Free Lunch (NFL) Theorem (Wolpert and Macready, 1997):</strong> Averaged over all possible problems, no optimisation algorithm outperforms any other. For every problem where algorithm A outperforms algorithm B, there exists an equal-sized set of problems where B outperforms A.
</div>

The NFL theorem has a crucial practical implication: **domain knowledge matters**. To outperform random search on a specific class of problems, an algorithm must exploit the structure of that class. This is why algorithm design involves careful problem analysis and why there is no single "best" metaheuristic.

## 9.3 Hybridisation: Memetic Algorithms

Hybrid algorithms — called **memetic algorithms** — combine global search (population-based) with local search to exploit both exploration and exploitation strengths. A common approach embeds a local search phase after each crossover in a GA:

```
for each generation:
    P' ← selection and crossover from P
    for each individual x in P':
        x ← LOCAL-SEARCH(x)   // e.g., hill climbing or SA
    P ← P'
```

Memetic algorithms often outperform pure GAs and pure local search on hard combinatorial problems, especially when the problem has a good local search neighbourhood structure.

## 9.4 Comparative Summary

| Algorithm | Type | Memory | Stochastic | Gradient-free | Key strength |
|---|---|---|---|---|---|
| A* | Informed search | \(O(b^d)\) | No | Yes | Optimal if \(h\) admissible |
| SA | Trajectory | \(O(1)\) | Yes | Yes | Simple, escapes local optima |
| Tabu Search | Trajectory | Tabu list | Mostly no | Yes | Adaptive memory, systematic |
| GA | Population | \(O(Nm)\) | Yes | Yes | Broad exploration, implicit parallelism |
| PSO | Population | \(O(Nm)\) | Yes | Yes | Simple, continuous domains |
| ACO | Population | Pheromone matrix | Yes | Yes | Combinatorial problems, positive feedback |
| Q-learning | Policy learning | Q-table | Yes | Yes | Sequential decisions, model-free |

## 9.5 Nature-Inspired Computing: Unifying Principles

All algorithms in this course share a set of unifying principles that explain their effectiveness on ill-structured problems:

1. **Adaptivity:** Algorithms modify their behaviour based on feedback (pheromone updates, temperature reduction, Q-value updates). This is the "adaptive" component of the course title.

2. **Co-operation:** Population-based methods share information between agents (particles share global best, ants share pheromone, GA individuals exchange genetic material). This is the "co-operative" component.

3. **Balance of exploration and exploitation:** Effective algorithms avoid premature convergence (too much exploitation) and aimless wandering (too much exploration) by dynamically adjusting this balance.

4. **Positive and negative feedback:** Positive feedback (pheromone reinforcement, fitness-proportionate selection) amplifies good solutions; negative feedback (evaporation, mutation, random moves) prevents stagnation.

5. **Decentralised control:** No global controller directs the search; intelligent global behaviour emerges from local interactions and simple rules.

These principles — borrowed from thermodynamics, evolutionary biology, and ethology — provide a rich source of algorithmic ideas and continue to inspire new developments in computational intelligence.

---

# Appendix: Key Formulas Reference

## A.1 Search

| Formula | Description |
|---|---|
| \(f(n) = g(n) + h(n)\) | A* evaluation function |
| \(h(n) \leq h^*(n)\) | Admissibility condition |
| \(h(n) \leq c(n,a,n') + h(n')\) | Consistency condition |

## A.2 Simulated Annealing

| Formula | Description |
|---|---|
| \(P = e^{-\Delta E / T}\) | Metropolis acceptance probability |
| \(T(t) = T_0 \alpha^t\) | Exponential cooling schedule |
| \(T(t) = C / \ln(1+t)\) | Logarithmic cooling (convergence guarantee) |

## A.3 Genetic Algorithms

| Formula | Description |
|---|---|
| \(P(i) = f(x_i) / \sum_j f(x_j)\) | Roulette wheel selection probability |
| \(m(H,t+1) \geq m(H,t) \cdot \frac{\hat{f}(H,t)}{\bar{f}(t)} \cdot \left(1 - p_c \frac{\delta(H)}{L-1} - o(H)p_m\right)\) | Schema theorem |

## A.4 PSO

| Formula | Description |
|---|---|
| \(\mathbf{v}_i \leftarrow w\mathbf{v}_i + c_1 r_1(\mathbf{p}_i - \mathbf{x}_i) + c_2 r_2(\mathbf{g} - \mathbf{x}_i)\) | Velocity update |
| \(\mathbf{x}_i \leftarrow \mathbf{x}_i + \mathbf{v}_i\) | Position update |

## A.5 ACO

| Formula | Description |
|---|---|
| \(P_{ij}^k = \frac{\tau_{ij}^\alpha \eta_{ij}^\beta}{\sum_{l \in \mathcal{N}_i^k} \tau_{il}^\alpha \eta_{il}^\beta}\) | Transition probability |
| \(\tau_{ij} \leftarrow (1-\rho)\tau_{ij} + \Delta\tau_{ij}\) | Global pheromone update |
| \(\Delta\tau_{ij}^k = Q / L^k\) if ant \(k\) used edge \((i,j)\) | Ant contribution |

## A.6 Reinforcement Learning

| Formula | Description |
|---|---|
| \(G_t = \sum_{k=0}^{\infty} \gamma^k R_{t+k+1}\) | Discounted return |
| \(V^\pi(s) = \sum_a \pi(a\|s) \sum_{s'} P(s'\|s,a)\left[R + \gamma V^\pi(s')\right]\) | Bellman expectation equation |
| \(Q(S_t,A_t) \leftarrow Q(S_t,A_t) + \alpha\left[R_{t+1} + \gamma \max_{a'} Q(S_{t+1},a') - Q(S_t,A_t)\right]\) | Q-learning update |
| \(Q(S_t,A_t) \leftarrow Q(S_t,A_t) + \alpha\left[R_{t+1} + \gamma Q(S_{t+1},A_{t+1}) - Q(S_t,A_t)\right]\) | SARSA update |
