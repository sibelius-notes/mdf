---
title: "SYDE 322: Software Design"
subjects: "SYDE"
---

## Sources and References

- Sommerville, <em>Software Engineering</em> (Pearson)
- Pressman and Maxim, <em>Software Engineering: A Practitioner's Approach</em> (McGraw-Hill)
- Cormen, Leiserson, Rivest, Stein, <em>Introduction to Algorithms</em> (MIT Press)
- Gamma, Helm, Johnson, Vlissides, <em>Design Patterns: Elements of Reusable Object-Oriented Software</em> (Addison-Wesley)
- Martin, <em>Clean Architecture</em> (Prentice Hall)

---

# Chapter 1: Software Requirements

## 1.1 Kinds of Requirements

Software requirements divide into <em>functional</em> (what the system does) and <em>non-functional</em> (how well — performance, reliability, security, usability, maintainability). Functional requirements list features, data, and behaviours; non-functional requirements state quantified expectations ("95% of requests complete within 200 ms").

Requirements also differ in abstraction: user requirements in natural language, system requirements in structured form, and software specifications in formal notations. Each layer serves a different audience.

## 1.2 Elicitation and Specification

Elicitation techniques include stakeholder interviews, observation, document analysis, and collaborative workshops. User stories ("As a shopper, I want to save my cart so I can complete the purchase later") connect features to user value. Use cases enumerate actor-system interactions. Scenario descriptions ground specifications in concrete situations.

Specifications must be complete, consistent, unambiguous, verifiable, and traceable. IEEE 830 and INCOSE guides structure the documentation. Requirements management tools link each requirement to its source, its rationale, and downstream design, test cases, and defects.

<div class="definition">
A <strong>requirement</strong> is a statement of capability or constraint that the system must satisfy to meet stakeholder needs; a good requirement is verifiable — one can decide unambiguously whether the final system meets it.
</div>

# Chapter 2: Software Architecture

## 2.1 Architectural Styles

Architecture describes the high-level structure of a software system: components, connectors, and governing constraints. Classical styles include layered (UI-logic-data), client-server, microservices, event-driven, pipe-and-filter, and model-view-controller. Each style has strengths for particular quality attributes: microservices scale horizontally; layered eases maintenance; event-driven decouples producers and consumers.

## 2.2 Quality Attributes

Architectural decisions trade off quality attributes. Performance, scalability, reliability, availability, modifiability, testability, portability, and security often conflict. An architecture tuned for throughput may be harder to maintain; one optimised for security may hurt developer productivity. Scenario-based methods (ATAM — Architecture Tradeoff Analysis Method) make these trade-offs explicit with measurable scenarios per attribute.

## 2.3 Interfaces and Module Boundaries

Sound architecture hides information inside modules and exposes minimal, stable interfaces. The Single Responsibility Principle — a module should have one reason to change — steers decomposition. Dependency inversion (high-level modules depend on abstractions, not concretions) keeps business logic independent of infrastructure.

# Chapter 3: Design Patterns

## 3.1 Creational Patterns

Factory, Abstract Factory, Builder, Singleton, and Prototype decouple object creation from object use. A Factory centralises instantiation so that switching concrete classes does not ripple through call sites. Singletons limit instantiation but complicate testing and parallelism; use sparingly.

## 3.2 Structural Patterns

Adapter, Bridge, Composite, Decorator, Facade, Flyweight, and Proxy address object composition. The Decorator wraps an object to add behaviour transparently; Facade provides a unified interface to a complex subsystem; Proxy places a stand-in to control access (lazy loading, remote invocation, security).

## 3.3 Behavioural Patterns

Observer, Strategy, Command, State, Iterator, Visitor, Template Method, Mediator, and Chain of Responsibility describe object interaction. The Observer pattern publishes events to subscribers without knowing who listens — the foundation of event-driven systems. Strategy encapsulates algorithms so that they can be swapped at runtime without branching.

<div class="remark">
Patterns are names for recurring design ideas, not reusable code. Applying patterns without clear need leads to over-engineering; recognising a pattern that fits clarifies design discussions and documentation.
</div>

# Chapter 4: Testing and Quality Assurance

## 4.1 Test Levels

Unit tests exercise individual functions or classes in isolation, typically using mocks or stubs for dependencies. Integration tests verify interactions among components. System tests validate the whole software against requirements. Acceptance tests confirm that the system delivers user value, often written by or with users.

## 4.2 Test Design

Black-box testing derives test cases from specifications (equivalence partitioning, boundary value analysis, decision tables). White-box testing exploits knowledge of implementation (statement, branch, path coverage). Mutation testing seeds faults to evaluate test suite sensitivity. Property-based testing generates inputs according to declared invariants and shrinks failing cases automatically.

## 4.3 Continuous Integration and Delivery

Continuous integration runs the test suite on every commit, catching regressions before they compound. Continuous delivery keeps the main branch in a deployable state; continuous deployment pushes every green build to production. Together they shorten feedback loops, reduce integration risk, and shift quality earlier in the lifecycle.

# Chapter 5: Software Maintenance and Evolution

## 5.1 Kinds of Maintenance

Corrective maintenance fixes defects; adaptive maintenance responds to environmental change; perfective maintenance improves performance or usability; preventive maintenance reduces technical debt. Studies consistently find maintenance accounts for 60–80% of total software cost.

## 5.2 Refactoring

Refactoring changes the internal structure of code without altering external behaviour. Common refactorings — extract method, inline variable, replace conditional with polymorphism — reduce duplication, clarify intent, and enable future changes. Automated refactoring tools and comprehensive tests make refactoring safe.

## 5.3 Technical Debt

Technical debt captures the future cost of design shortcuts. Like financial debt, a little can accelerate delivery, but compounding interest erodes velocity. Deliberate debt (to meet a launch window) differs from inadvertent debt (from poor design). Tracking, prioritising, and paying down debt is an ongoing engineering obligation.

# Chapter 6: Algorithms and Analysis

## 6.1 Asymptotic Analysis

Algorithm efficiency is measured by how its resource use scales with input size. Big-O notation captures upper bounds: an algorithm with running time \( T(n) \in O(n^{2}) \) grows at most quadratically. Common complexity classes:

| Class | Name | Example |
|-------|------|---------|
| \( O(1) \) | Constant | Hash lookup |
| \( O(\log n) \) | Logarithmic | Binary search |
| \( O(n) \) | Linear | List scan |
| \( O(n\log n) \) | Linearithmic | Merge sort |
| \( O(n^{2}) \) | Quadratic | Insertion sort |
| \( O(2^{n}) \) | Exponential | Brute-force SAT |

## 6.2 Sorting, Searching, and Graph Algorithms

Mergesort and heapsort achieve \( O(n\log n) \) worst case; quicksort averages \( O(n\log n) \) but is \( O(n^{2}) \) worst case without safeguards. Binary search trees, balanced variants (red-black, AVL), and B-trees maintain dynamic order. Hash tables offer average \( O(1) \) access. Graph traversals (BFS, DFS), shortest paths (Dijkstra, Bellman-Ford), minimum spanning trees (Prim, Kruskal), and network flow solve fundamental problems.

## 6.3 Mathematical and Geometric Algorithms

Numerical algorithms — Newton's method, LU decomposition, FFT — underpin simulation and signal processing. String algorithms (KMP, Rabin-Karp, suffix arrays) accelerate text processing. Computational geometry (convex hulls, line intersection, Voronoi) supports CAD and GIS.

## 6.4 Exhaustive Search and Heuristics

Some problems admit no polynomial algorithm unless P = NP. Backtracking, branch-and-bound, dynamic programming, and greedy methods handle moderate instances. For larger problems, heuristics (simulated annealing, genetic algorithms, Tabu search) and approximation algorithms yield near-optimal solutions with provable guarantees in some cases.

## 6.5 NP-Completeness

A problem is NP-complete if it is in NP and every NP problem reduces to it in polynomial time. The Cook-Levin theorem establishes SAT's NP-completeness; thousands of problems (travelling salesman, graph colouring, knapsack) are now known to be NP-complete or NP-hard. Recognising that a problem is NP-complete redirects effort toward approximation, restriction to special cases, or modest inputs.

<div class="example">
Real-world scheduling problems (class timetables, airline crew assignment) are NP-hard; industrial solvers combine integer programming, constraint propagation, and heuristics to deliver feasible solutions within minutes even when optimality is unreachable.
</div>

<div class="theorem">
Software design joins architectural reasoning — modules, patterns, quality trade-offs — with algorithmic reasoning — correctness, efficiency, complexity — and human practice — requirements, testing, maintenance. Engineers who integrate these dimensions produce software systems that are useful, correct, efficient, and durable across changing requirements.
</div>
