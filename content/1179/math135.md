---
title: "MATH 135: Algebra for Honours Mathematics"
---

# Part I: Introduction to Proof Methods

## Chapter 2: A First Look at Proofs

This chapter introduces the foundational vocabulary of mathematical reasoning: statements, propositions, and axioms.

<div class="definition">

<strong>Definition 2.2.1 (Statement).</strong> A <em>statement</em> is a sentence that has a definite state of being either true or false.

</div>

A <em>proposition</em> is a mathematical claim posed as a statement that needs to be proven or demonstrated false. A <em>theorem</em> is a particularly significant proposition; a <em>lemma</em> is a subsidiary "helper" proposition; a <em>corollary</em> follows almost immediately from a theorem. An <em>axiom</em> is a statement assumed true without proof.

<div class="definition">

<strong>Definition 2.3.1 (Even and Odd).</strong> An integer is <em>even</em> if it can be written in the form \(2k\) where \(k\) is an integer. Otherwise, it can be written in the form \(2k+1\) and is called <em>odd</em>.

</div>

## Chapter 3: Truth Tables and Logical Operators

We build compound statements from simpler components using logical operators.

<div class="definition">

<strong>Definition 3.2.1 (Compound Statement).</strong> A <em>compound statement</em> is a statement composed of several individual statements called <em>component statements</em>.

</div>

<div class="definition">

<strong>Definition 3.3.1 (NOT).</strong> The negation of \(A\), written \(\neg A\), is true when \(A\) is false, and false when \(A\) is true.

</div>

<div class="definition">

<strong>Definition 3.3.2 (AND).</strong> The conjunction \(A \wedge B\) is true only when both \(A\) and \(B\) are true.

</div>

<div class="definition">

<strong>Definition 3.3.3 (OR).</strong> The disjunction \(A \vee B\) is false only when both \(A\) and \(B\) are false. In mathematics, OR is always inclusive.

</div>

<div class="definition">

<strong>Definition 3.5.1 (Logical Equivalence).</strong> Two compound statements \(S_1\) and \(S_2\) are <em>logically equivalent</em>, written \(S_1 \equiv S_2\), if they have the same truth values for all possible states of their component statements.

</div>

<div class="proposition">

<strong>Proposition (De Morgan's Laws, DML).</strong> For any two statements \(A\) and \(B\):
1. \(\neg(A \vee B) \equiv (\neg A) \wedge (\neg B)\)
2. \(\neg(A \wedge B) \equiv (\neg A) \vee (\neg B)\)

</div>

The Distributivity Laws also hold: \(A \wedge (B \vee C) \equiv (A \wedge B) \vee (A \wedge C)\) and \(A \vee (B \wedge C) \equiv (A \vee B) \wedge (A \vee C)\).

## Chapter 4: Implications and the Direct Proof

<div class="definition">

<strong>Definition 4.2.1 (Implication).</strong> An <em>implication</em> \(A \Rightarrow B\) is defined by the truth table where \(A \Rightarrow B\) is false only when \(A\) is true and \(B\) is false. The component \(A\) is the <em>hypothesis</em> and \(B\) is the <em>conclusion</em>.

</div>

The negation of an implication satisfies \(\neg(A \Rightarrow B) \equiv A \wedge (\neg B)\), and we also have \((\neg A) \vee B \equiv A \Rightarrow B\).

A <strong>direct proof</strong> of \(A \Rightarrow B\) assumes \(A\) is true and deduces that \(B\) must be true.

## Chapter 5: Analysis of a Proof -- Divisibility

<div class="definition">

<strong>Definition 5.2.1 (Divisibility).</strong> An integer \(m\) <em>divides</em> an integer \(n\), written \(m \mid n\), when there exists an integer \(k\) so that \(n = km\). We call \(m\) a <em>divisor</em> or <em>factor</em> of \(n\), and \(n\) a <em>multiple</em> of \(m\).

</div>

<div class="proposition">

<strong>Proposition (Transitivity of Divisibility, TD).</strong> Let \(a, b, c\) be integers. If \(a \mid b\) and \(b \mid c\), then \(a \mid c\).

</div>

## Chapter 6: Discovering Proofs

<div class="proposition">

<strong>Proposition (Divisibility of Integer Combinations, DIC).</strong> Let \(a, b, c\) be integers. If \(a \mid b\) and \(a \mid c\), then for any integers \(x\) and \(y\), \(a \mid (bx + cy)\).

</div>

<div class="proposition">

<strong>Proposition (Bounds By Divisibility, BBD).</strong> Let \(a\) and \(b\) be integers. If \(a \mid b\) and \(b \neq 0\), then \(|a| \leq |b|\).

</div>

# Part II: Foundations -- Sets and Quantifiers

## Chapter 7: Introduction to Sets

<div class="definition">

<strong>Definition 7.2.1 (Set, Element).</strong> A <em>set</em> is a collection of objects. The objects in a set are called its <em>elements</em> (or members). We write \(x \in S\) if \(x\) is an element of \(S\).

</div>

<div class="definition">

<strong>Definition 7.2.2 (Empty Set).</strong> The set \(\{\}\) contains no elements and is called the <em>empty set</em>, denoted \(\emptyset\).

</div>

<div class="definition">

<strong>Definition 7.2.3 (Set-builder Notation).</strong> If \(S\) has defining property \(P(x)\), then
\[S = \{x \in U : P(x)\}.\]
The part after the colon is the defining property of the set.

</div>

<div class="definition">

<strong>Definition 7.3.1 (Union).</strong> \(S \cup T = \{x : (x \in S) \vee (x \in T)\}\).

</div>

<div class="definition">

<strong>Definition 7.3.2 (Intersection).</strong> \(S \cap T = \{x : (x \in S) \wedge (x \in T)\}\).

</div>

<div class="definition">

<strong>Definition 7.3.3 (Set-Difference).</strong> \(S \setminus T = \{x : (x \in S) \wedge (x \notin T)\}\).

</div>

<div class="definition">

<strong>Definition 7.3.4 (Set Complement).</strong> Relative to a universal set \(U\), the complement of \(S \subseteq U\) is \(\overline{S} = U \setminus S\).

</div>

<div class="definition">

<strong>Definition 7.4.1 (Cartesian Product).</strong> \(S \times T = \{(x,y) : x \in S,\, y \in T\}\). Each element is an <em>ordered pair</em>.

</div>

## Chapter 8: Subsets, Set Equality, Converse, and If and Only If

<div class="definition">

<strong>Definition 8.2.1 (Disjoint Sets).</strong> Sets \(S\) and \(T\) are <em>disjoint</em> when \(S \cap T = \emptyset\).

</div>

<div class="definition">

<strong>Definition 8.2.2 (Subset).</strong> \(S\) is a <em>subset</em> of \(T\), written \(S \subseteq T\), when every element of \(S\) belongs to \(T\).

</div>

<div class="definition">

<strong>Definition 8.2.3 (Proper Subset).</strong> \(S \subsetneq T\) means every element of \(S\) belongs to \(T\), and there is at least one element in \(T\) not in \(S\).

</div>

<div class="definition">

<strong>Definition 8.3.1 (Set Equality).</strong> \(S = T\) when \(S \subseteq T\) and \(T \subseteq S\).

</div>

<div class="definition">

<strong>Definition 8.3.2 (Converse).</strong> The <em>converse</em> of \(A \Rightarrow B\) is \(B \Rightarrow A\). Note: \(A \Rightarrow B \not\equiv B \Rightarrow A\).

</div>

<div class="definition">

<strong>Definition 8.3.3 (If and Only If).</strong> \(A \Leftrightarrow B\) is true exactly when \(A\) and \(B\) have the same truth value. It is equivalent to \((A \Rightarrow B) \wedge (B \Rightarrow A)\).

</div>

<div class="definition">

<strong>Definition 8.3.4 (Perfect Square).</strong> An integer is a <em>perfect square</em> if and only if it equals \(k^2\) for some integer \(k\).

</div>

## Chapter 9: Quantifiers

The <strong>universal quantifier</strong> \(\forall\) means "for all"; the <strong>existential quantifier</strong> \(\exists\) means "there exists". Negation rules:
\[\neg[\forall x \in S,\, P(x)] \equiv \exists x \in S,\, \neg P(x)\]
\[\neg[\exists x \in S,\, P(x)] \equiv \forall x \in S,\, \neg P(x)\]

<div class="definition">

<strong>Definition 9.3.1 (Prime).</strong> An integer \(p > 1\) is <em>prime</em> if and only if its only positive divisors are \(1\) and \(p\) itself. Otherwise, \(p\) is <em>composite</em>.

</div>

Key proof methods: the <strong>Select Method</strong> proves \(\forall x \in S, P(x)\) by choosing a representative \(x\); the <strong>Construct Method</strong> proves \(\exists x \in S, P(x)\) by exhibiting a specific element.

## Chapter 10: Nested Quantifiers

<div class="definition">

<strong>Definition 10.4.1 (Function).</strong> A <em>function</em> \(f: S \to T\) assigns to each \(s \in S\) a unique element \(f(s) \in T\). The set \(S\) is the <em>domain</em> and \(T\) the <em>codomain</em>.

</div>

<div class="definition">

<strong>Definition 10.4.2 (Surjective).</strong> \(f: S \to T\) is <em>onto</em> (surjective) if for every \(y \in T\) there exists \(x \in S\) so that \(f(x) = y\).

</div>

# Part III: More Proof Techniques

## Chapter 11: Contrapositives

<div class="definition">

<strong>Definition 11.2.1 (Contrapositive).</strong> The <em>contrapositive</em> of \(A \Rightarrow B\) is \(\neg B \Rightarrow \neg A\). We have \((A \Rightarrow B) \equiv (\neg B \Rightarrow \neg A)\).

</div>

To prove \(A \Rightarrow B\) by contrapositive, assume \(\neg B\) and deduce \(\neg A\).

## Chapter 12: Proofs by Contradiction

<div class="definition">

<strong>Definition 12.2.1 (Contradiction).</strong> A <em>contradiction</em> is a statement of the form \(A \wedge (\neg A)\), which is always false.

</div>

To prove a statement \(C\) by contradiction, assume \(\neg C\) and derive a contradiction.

<div class="proposition">

<strong>Proposition (Prime Factorization, PF).</strong> Every integer \(n > 1\) can be expressed as a product of primes.

</div>

<div class="proposition">

<strong>Proposition (Euclid's Theorem, ET).</strong> The number of primes is infinite.

</div>

## Chapter 13: Uniqueness, Injections, and the Division Algorithm

<div class="definition">

<strong>Definition 13.5.1 (Injective).</strong> A function \(f: S \to T\) is <em>one-to-one</em> (injective) if for every \(x_1, x_2 \in S\), \(f(x_1) = f(x_2)\) implies \(x_1 = x_2\).

</div>

<div class="proposition">

<strong>Proposition (Division Algorithm).</strong> If \(a\) and \(b\) are integers with \(b > 0\), then there exist unique integers \(q\) (quotient) and \(r\) (remainder) such that
\[a = qb + r \quad\text{where } 0 \leq r < b.\]

</div>

## Chapter 14: Simple Induction

<div class="definition">

<strong>Definition 14.2.1 (Summation Notation).</strong> \(\displaystyle\sum_{i=m}^{n} x_i = x_m + x_{m+1} + \cdots + x_n\).

</div>

<div class="definition">

<strong>Definition 14.2.2 (Product Notation).</strong> \(\displaystyle\prod_{i=m}^{n} x_i = x_m \cdot x_{m+1} \cdots x_n\).

</div>

<div class="definition">

<strong>Definition 14.2.3 (Recurrence Relation).</strong> A <em>recurrence relation</em> defines a sequence by one or more initial terms and expressions involving prior terms.

</div>

<div class="definition">

<strong>Axiom (Principle of Mathematical Induction, POMI).</strong> Let \(P(n)\) depend on \(n \in \mathbb{N}\). If (1) \(P(1)\) is true, and (2) \(P(k) \Rightarrow P(k+1)\) for all \(k \in \mathbb{N}\), then \(P(n)\) is true for all \(n \in \mathbb{N}\).

</div>

<div class="proposition">

<strong>Proposition.</strong> For every \(n \in \mathbb{N}\), \(\displaystyle\sum_{i=1}^n i^2 = \frac{n(n+1)(2n+1)}{6}\).

</div>

<div class="proposition">

<strong>Proposition.</strong> The set \(S_n = \{1,2,\ldots,n\}\) has \(2^n\) subsets.

</div>

<div class="proposition">

<strong>Proposition.</strong> For every integer \(n \geq 3\), \(n^2 > 2n + 1\).

</div>

<div class="proposition">

<strong>Proposition.</strong> For every integer \(n \geq 5\), \(2^n > n^2\).

</div>

<div class="proposition">

<strong>Proposition.</strong> A \(2^n \times 2^n\) grid with one square removed can be covered by triominoes.

</div>

## Chapter 15: Strong Induction

<div class="definition">

<strong>Axiom (Principle of Strong Induction, POSI).</strong> Let \(P(n)\) depend on \(n \in \mathbb{N}\). If (1) \(P(1), P(2), \ldots, P(b)\) are true, and (2) \(P(1) \wedge P(2) \wedge \cdots \wedge P(k) \Rightarrow P(k+1)\) for all \(k \in \mathbb{N}\), then \(P(n)\) is true for all \(n \in \mathbb{N}\).

</div>

Use strong induction when the general case depends on multiple previous cases.

<div class="proposition">

<strong>Proposition.</strong> Every integer \(n \geq 9\) can be written as \(3x + 4y\) for non-negative integers \(x\) and \(y\).

</div>

# Part IV: Securing Internet Commerce

## Chapter 17: The Greatest Common Divisor

<div class="definition">

<strong>Definition 17.2.1 (Greatest Common Divisor).</strong> Let \(a,b\) be integers, not both zero. An integer \(d > 0\) is the <em>greatest common divisor</em> \(\gcd(a,b)\) if and only if:
1. \(d \mid a\) and \(d \mid b\), and
2. if \(c \mid a\) and \(c \mid b\), then \(c \leq d\).

We define \(\gcd(0,0) = 0\).

</div>

<div class="proposition">

<strong>Proposition (GCD With Remainders, GCD WR).</strong> If \(a, b, q, r\) are integers such that \(a = qb + r\), then \(\gcd(a,b) = \gcd(b,r)\).

</div>

This proposition underlies the <strong>Euclidean Algorithm</strong>: repeatedly apply the Division Algorithm until the remainder is zero; the last nonzero remainder is the GCD.

<div class="theorem">

<strong>Proposition (GCD Characterization Theorem, GCD CT).</strong> If \(d\) is a positive common divisor of integers \(a\) and \(b\), and there exist integers \(x\) and \(y\) so that \(ax + by = d\), then \(d = \gcd(a,b)\).

</div>

## Chapter 18: The Extended Euclidean Algorithm

<div class="definition">

<strong>Definition 18.2.1 (Floor).</strong> The <em>floor</em> of \(x\), written \(\lfloor x \rfloor\), is the largest integer less than or equal to \(x\).

</div>

The <strong>Extended Euclidean Algorithm (EEA)</strong> computes \(d = \gcd(a,b)\) together with integers \(x,y\) satisfying \(ax + by = d\).

<div class="proposition">

<strong>Proposition (Bezout's Lemma, BL).</strong> If \(a\) and \(b\) are integers, then \(d = \gcd(a,b)\) can be computed and there exist integers \(x\) and \(y\) so that \(ax + by = d\).

</div>

## Chapter 19: Properties of GCDs

<div class="definition">

<strong>Definition 19.2.1 (Coprime).</strong> Two integers \(a\) and \(b\) are <em>coprime</em> if \(\gcd(a,b) = 1\).

</div>

<div class="proposition">

<strong>Proposition (Coprimeness and Divisibility, CAD).</strong> If \(c \mid ab\) and \(\gcd(a,c) = 1\), then \(c \mid b\).

</div>

<div class="corollary">

<strong>Corollary (Euclid's Lemma, EL).</strong> If \(p\) is a prime and \(p \mid ab\), then \(p \mid a\) or \(p \mid b\).

</div>

<div class="proposition">

<strong>Proposition (GCD of One, GCD OO).</strong> \(\gcd(a,b) = 1\) if and only if there exist integers \(x,y\) with \(ax + by = 1\).

</div>

<div class="proposition">

<strong>Proposition (Division by the GCD, DB GCD).</strong> If \(\gcd(a,b) = d \neq 0\), then \(\gcd\!\left(\dfrac{a}{d}, \dfrac{b}{d}\right) = 1\).

</div>

## Chapter 20: GCD from Prime Factorization

<div class="theorem">

<strong>Theorem (Unique Factorization Theorem, UFT).</strong> If \(n > 1\) is an integer, then \(n\) can be written as a product of prime factors and, apart from the order of factors, this factorization is unique.

</div>

Also known as the <strong>Fundamental Theorem of Arithmetic</strong>.

<div class="proposition">

<strong>Proposition (Finding a Prime Factor, FPF).</strong> An integer \(n > 1\) is either prime or contains a prime factor \(\leq \sqrt{n}\).

</div>

<div class="proposition">

<strong>Proposition (Divisors From Prime Factorization, DFPF).</strong> If \(n = p_1^{\alpha_1} p_2^{\alpha_2} \cdots p_k^{\alpha_k}\) is the unique prime factorization, then \(d\) is a positive divisor of \(n\) if and only if \(d = p_1^{d_1} p_2^{d_2} \cdots p_k^{d_k}\) where \(0 \leq d_i \leq \alpha_i\).

</div>

<div class="proposition">

<strong>Proposition (GCD From Prime Factorization, GCD PF).</strong> If \(a = p_1^{\alpha_1} \cdots p_k^{\alpha_k}\) and \(b = p_1^{\beta_1} \cdots p_k^{\beta_k}\), then
\[\gcd(a,b) = p_1^{d_1} \cdots p_k^{d_k} \quad\text{where } d_i = \min\{\alpha_i, \beta_i\}.\]

</div>

## Chapter 21: Linear Diophantine Equations -- One Solution

<div class="definition">

<strong>Definition 21.2.1 (Diophantine Equation).</strong> Equations with integer coefficients for which integer solutions are sought are called <em>Diophantine equations</em>.

</div>

<div class="theorem">

<strong>Theorem (LDET 1).</strong> Let \(d = \gcd(a,b)\). The linear Diophantine equation \(ax + by = c\) has a solution if and only if \(d \mid c\).

</div>

## Chapter 22: Linear Diophantine Equations -- All Solutions

<div class="theorem">

<strong>Theorem (LDET 2).</strong> Let \(\gcd(a,b) = d\) where both \(a,b\) are not zero. If \(x = x_0, y = y_0\) is one particular solution to \(ax + by = c\), then the complete solution is
\[x = x_0 + \frac{b}{d}\,n, \quad y = y_0 - \frac{a}{d}\,n, \quad \text{for all } n \in \mathbb{Z}.\]

</div>

## Chapter 23: Congruence

<div class="definition">

<strong>Definition 23.2.1 (Congruent).</strong> Let \(m\) be a fixed positive integer. For \(a,b \in \mathbb{Z}\), we say \(a\) is <em>congruent to</em> \(b\) modulo \(m\), written \(a \equiv b \pmod{m}\), if and only if \(m \mid (a - b)\).

</div>

Equivalent formulations: \(a \equiv b \pmod{m}\) iff \(\exists k \in \mathbb{Z}\) such that \(a - b = km\) iff \(a\) and \(b\) have the same remainder when divided by \(m\).

<div class="proposition">

<strong>Proposition (Congruence is an Equivalence Relation, CER).</strong> For \(a,b,c \in \mathbb{Z}\):
1. \(a \equiv a \pmod{m}\) (reflexive).
2. \(a \equiv b \pmod{m} \Rightarrow b \equiv a \pmod{m}\) (symmetric).
3. \(a \equiv b\) and \(b \equiv c \pmod{m} \Rightarrow a \equiv c \pmod{m}\) (transitive).

</div>

<div class="proposition">

<strong>Proposition (Properties of Congruence, PC).</strong> If \(a \equiv a' \pmod{m}\) and \(b \equiv b' \pmod{m}\), then:
1. \(a + b \equiv a' + b' \pmod{m}\)
2. \(a - b \equiv a' - b' \pmod{m}\)
3. \(ab \equiv a'b' \pmod{m}\)

</div>

As a corollary, if \(a \equiv b \pmod{m}\), then \(a^n \equiv b^n \pmod{m}\) for all \(n \in \mathbb{N}\).

<div class="proposition">

<strong>Proposition (Congruence Division, CD).</strong> If \(ac \equiv bc \pmod{m}\) and \(\gcd(c,m) = 1\), then \(a \equiv b \pmod{m}\).

</div>

## Chapter 24: Congruence and Remainders

<div class="proposition">

<strong>Proposition (Congruent Iff Same Remainder, CISR).</strong> \(a \equiv b \pmod{m}\) if and only if \(a\) and \(b\) have the same remainder when divided by \(m\).

</div>

## Chapter 25: Linear Congruences

<div class="definition">

<strong>Definition 25.2.1 (Linear Congruence).</strong> A relation \(ax \equiv c \pmod{m}\) is a <em>linear congruence</em> in \(x\). A solution is an integer \(x_0\) with \(ax_0 \equiv c \pmod{m}\).

</div>

<div class="theorem">

<strong>Theorem (Linear Congruence Theorem, Version 1, LCT 1).</strong> Let \(d = \gcd(a,m)\). The congruence \(ax \equiv c \pmod{m}\) has a solution iff \(d \mid c\). If \(x_0\) is one solution, the complete solution is
\[x \equiv x_0 \pmod{\frac{m}{d}}\]
which gives \(d\) distinct solutions modulo \(m\).

</div>

## Chapter 26: Modular Arithmetic

<div class="definition">

<strong>Definition 26.2.1 (Congruence Class).</strong> The congruence class modulo \(m\) of the integer \(a\) is
\[[a] = \{x \in \mathbb{Z} \mid x \equiv a \pmod{m}\}.\]

</div>

<div class="definition">

<strong>Definition 26.2.2 (\(\mathbb{Z}_m\)).</strong> \(\mathbb{Z}_m = \{[0],[1],\ldots,[m-1]\}\) with operations \([a]+[b]=[a+b]\) and \([a]\cdot[b]=[a \cdot b]\).

</div>

<div class="definition">

<strong>Definition 26.2.3 (Identity).</strong> Given a set \(S\) and operation \(\star\), an <em>identity</em> is an element \(e \in S\) such that \(a \star e = a\) for all \(a \in S\).

</div>

<div class="definition">

<strong>Definition 26.2.4 (Inverse).</strong> The element \(b \in S\) is an <em>inverse</em> of \(a \in S\) if \(a \star b = b \star a = e\).

</div>

In \(\mathbb{Z}_m\), the additive identity is \([0]\), the multiplicative identity is \([1]\), and every element has an additive inverse. Multiplicative inverses may not always exist.

<div class="theorem">

<strong>Theorem (LCT, Version 2).</strong> Let \(d = \gcd(a,m)\). The equation \([a][x] = [c]\) in \(\mathbb{Z}_m\) has a solution iff \(d \mid c\). If \([x_0]\) is one solution, the complete solution consists of \(d\) congruence classes in \(\mathbb{Z}_m\).

</div>

## Chapter 27: Fermat's Little Theorem

<div class="theorem">

<strong>Theorem (Fermat's Little Theorem, FlT).</strong> If \(p\) is prime and \(p \nmid a\), then \(a^{p-1} \equiv 1 \pmod{p}\).

</div>

<div class="corollary">

<strong>Corollary.</strong> For any integer \(a\) and any prime \(p\), \(a^p \equiv a \pmod{p}\).

</div>

<div class="corollary">

<strong>Corollary (Existence of Inverses in \(\mathbb{Z}_p\), INV \(\mathbb{Z}_p\)).</strong> Let \(p\) be prime. If \([a]\) is any nonzero element in \(\mathbb{Z}_p\), then \([a]^{-1} = [a^{p-2}]\).

</div>

## Chapter 28: Chinese Remainder Theorem

<div class="theorem">

<strong>Theorem (Chinese Remainder Theorem, CRT).</strong> If \(\gcd(m_1, m_2) = 1\), then the simultaneous congruences
\[n \equiv a_1 \pmod{m_1}, \quad n \equiv a_2 \pmod{m_2}\]
have a unique solution modulo \(m_1 m_2\).

</div>

<div class="theorem">

<strong>Theorem (Generalized CRT).</strong> If \(m_1, \ldots, m_k\) are pairwise coprime, then the simultaneous system \(n \equiv a_i \pmod{m_i}\) for \(i = 1,\ldots,k\) has a unique solution modulo \(m_1 m_2 \cdots m_k\).

</div>

<div class="theorem">

<strong>Theorem (Splitting Modulus, SM).</strong> Let \(m_1, m_2\) be coprime positive integers. Then
\[x \equiv a \pmod{m_1 m_2} \iff \begin{cases} x \equiv a \pmod{m_1} \\ x \equiv a \pmod{m_2} \end{cases}\]

</div>

## Chapter 29: The RSA Scheme

RSA setup: choose distinct primes \(p,q\), let \(n = pq\). Choose \(e\) with \(\gcd(e,(p-1)(q-1))=1\). Solve \(ed \equiv 1 \pmod{(p-1)(q-1)}\). Public key: \((e,n)\). Private key: \((d,n)\). Encrypt: \(M^e \equiv C \pmod{n}\). Decrypt: \(C^d \equiv R \pmod{n}\).

<div class="theorem">

<strong>Theorem (RSA).</strong> If \(p,q\) are distinct primes, \(n = pq\), \(ed \equiv 1 \pmod{(p-1)(q-1)}\), \(0 \leq M < n\), \(M^e \equiv C \pmod{n}\), and \(C^d \equiv R \pmod{n}\) with \(0 \leq R < n\), then \(R = M\).

</div>

The proof uses Fermat's Little Theorem modulo \(p\) and modulo \(q\) separately, then combines via CRT.

# Part V: Complex Numbers and Euler's Formula

## Chapter 30: Complex Numbers

<div class="definition">

<strong>Definition 30.3.1 (Complex Number).</strong> A <em>complex number</em> in standard form is \(z = x + yi\) where \(x, y \in \mathbb{R}\). The set of all complex numbers is \(\mathbb{C} = \{x + yi : x, y \in \mathbb{R}\}\).

</div>

<div class="definition">

<strong>Definition 30.3.2 (Real and Imaginary Parts).</strong> For \(z = x + yi\), the <em>real part</em> is \(\operatorname{Re}(z) = x\) and the <em>imaginary part</em> is \(\operatorname{Im}(z) = y\).

</div>

<div class="definition">

<strong>Definition 30.3.3 (Equality).</strong> \(x + yi = u + vi\) iff \(x = u\) and \(y = v\).

</div>

<div class="definition">

<strong>Definition 30.3.4 (Addition).</strong> \((a+bi)+(c+di) = (a+c)+(b+d)i\).

</div>

<div class="definition">

<strong>Definition 30.3.5 (Multiplication).</strong> \((a+bi)(c+di) = (ac-bd)+(ad+bc)i\). In particular, \(i^2 = -1\).

</div>

<div class="definition">

<strong>Definition 30.3.7 (Division).</strong> \(\displaystyle\frac{a+bi}{c+di} = \frac{ac+bd}{c^2+d^2} + \frac{bc-ad}{c^2+d^2}\,i\).

</div>

<div class="proposition">

<strong>Proposition (Properties of \(\mathbb{C}\)).</strong> Complex numbers satisfy: associativity and commutativity of \(+\) and \(\cdot\); additive identity \(0\); multiplicative identity \(1\); additive inverses; multiplicative inverses for \(z \neq 0\) given by \(z^{-1} = \frac{x - yi}{x^2 + y^2}\); and distributivity.

</div>

## Chapter 31: Properties of Complex Numbers

<div class="definition">

<strong>Definition 31.2.1 (Conjugate).</strong> The <em>conjugate</em> of \(z = x + yi\) is \(\bar{z} = x - yi\).

</div>

<div class="proposition">

<strong>Proposition (Properties of Conjugates, PCJ).</strong> For \(z, w \in \mathbb{C}\):
1. \(\overline{z+w} = \bar{z}+\bar{w}\)
2. \(\overline{zw} = \bar{z}\,\bar{w}\)
3. \(\overline{\bar{z}} = z\)
4. \(z + \bar{z} = 2\operatorname{Re}(z)\)
5. \(z - \bar{z} = 2\operatorname{Im}(z)\,i\)

</div>

<div class="definition">

<strong>Definition 31.3.1 (Modulus).</strong> \(|z| = |x+yi| = \sqrt{x^2+y^2}\).

</div>

<div class="proposition">

<strong>Proposition (Properties of Modulus, PM).</strong>
1. \(|z| = 0\) iff \(z = 0\)
2. \(|\bar{z}| = |z|\)
3. \(z\bar{z} = |z|^2\)
4. \(|zw| = |z||w|\)
5. \(|z+w| \leq |z|+|w|\) (triangle inequality)

</div>

## Chapter 32: Polar Form

<div class="definition">

<strong>Definition 32.4.1 (Polar Form).</strong> The polar form of \(z\) is \(z = r(\cos\theta + i\sin\theta)\) where \(r = |z|\) and \(\theta\) is an <em>argument</em> of \(z\).

</div>

<div class="proposition">

<strong>Proposition (Polar Multiplication, PMCN).</strong> If \(z_1 = r_1(\cos\theta_1 + i\sin\theta_1)\) and \(z_2 = r_2(\cos\theta_2 + i\sin\theta_2)\), then
\[z_1 z_2 = r_1 r_2(\cos(\theta_1+\theta_2) + i\sin(\theta_1+\theta_2)).\]

</div>

## Chapter 33: De Moivre's Theorem

<div class="theorem">

<strong>Theorem (De Moivre's Theorem, DMT).</strong> For \(\theta \in \mathbb{R}\) and \(n \in \mathbb{Z}\),
\[(\cos\theta + i\sin\theta)^n = \cos(n\theta) + i\sin(n\theta).\]

</div>

<div class="corollary">

<strong>Corollary.</strong> If \(z = r(\cos\theta + i\sin\theta)\) and \(n\) is an integer, then \(z^n = r^n(\cos(n\theta) + i\sin(n\theta))\).

</div>

<div class="definition">

<strong>Definition 33.3.1 (Complex Exponential).</strong> \(e^{i\theta} = \cos\theta + i\sin\theta\).

</div>

Setting \(\theta = \pi\) yields Euler's identity: \(e^{i\pi} + 1 = 0\).

<div class="proposition">

<strong>Proposition (Properties of Complex Exponentials, PCE).</strong>
1. \(e^{i\theta} \cdot e^{i\varphi} = e^{i(\theta+\varphi)}\)
2. \((e^{i\theta})^n = e^{in\theta}\) for all \(n \in \mathbb{Z}\).

</div>

## Chapter 34: Roots of Complex Numbers

<div class="definition">

<strong>Definition 34.2.1 (Complex \(n\)-th Roots).</strong> The complex numbers solving \(z^n = a\) are the <em>complex \(n\)-th roots</em> of \(a\).

</div>

<div class="theorem">

<strong>Theorem (Complex \(n\)-th Roots Theorem, CNRT).</strong> If \(a = r(\cos\theta + i\sin\theta)\), the solutions to \(z^n = a\) are
\[\sqrt[n]{r}\left(\cos\frac{\theta+2k\pi}{n} + i\sin\frac{\theta+2k\pi}{n}\right) \quad\text{for } k = 0,1,\ldots,n-1.\]

</div>

Every nonzero complex number has exactly \(n\) distinct \(n\)-th roots, uniformly distributed on a circle of radius \(\sqrt[n]{r}\).

<div class="proposition">

<strong>Proposition (Quadratic Formula over \(\mathbb{C}\)).</strong> For \(a,b,c \in \mathbb{C}\), the solutions to \(ax^2 + bx + c = 0\) are \(\frac{-b \pm w}{2a}\) where \(w^2 = b^2 - 4ac\).

</div>

# Part VI: Factoring Polynomials

## Chapter 35: An Introduction to Polynomials

<div class="definition">

<strong>Definition 35.2.1 (Polynomial).</strong> A <em>polynomial</em> in \(x\) over the field \(F\) is \(a_n x^n + a_{n-1}x^{n-1} + \cdots + a_1 x + a_0\), where \(x\) is an <em>indeterminate</em> and the \(a_i \in F\) are <em>coefficients</em>. The set of all such polynomials is \(F[x]\).

</div>

<div class="definition">

<strong>Definition 35.2.2 (Degree).</strong> If \(a_n \neq 0\), the polynomial has <em>degree</em> \(n\). The zero polynomial has undefined degree.

</div>

<div class="definition">

<strong>Definition 35.2.3 (Polynomial Equality).</strong> \(f(x) = g(x)\) iff \(a_k = b_k\) for all \(k\).

</div>

<div class="proposition">

<strong>Proposition (Division Algorithm for Polynomials, DAP).</strong> If \(f(x), g(x) \in F[x]\) and \(g(x)\) is not the zero polynomial, then there exist unique \(q(x), r(x) \in F[x]\) such that
\[f(x) = q(x)g(x) + r(x)\]
where \(r(x)\) is zero or \(\deg r(x) < \deg g(x)\).

</div>

<div class="definition">

<strong>Definition 35.3.4 (Divides).</strong> \(g(x) \mid f(x)\) iff there exists \(q(x)\) with \(f(x) = q(x)g(x)\).

</div>

## Chapter 36: Factoring Polynomials

<div class="definition">

<strong>Definition 36.2.1 (Root/Zero).</strong> An element \(c \in F\) is a <em>root</em> of \(f(x)\) if \(f(c) = 0\).

</div>

<div class="theorem">

<strong>Theorem (Fundamental Theorem of Algebra, FTA).</strong> Every complex polynomial \(f(z)\) with \(\deg f \geq 1\) has at least one root in \(\mathbb{C}\).

</div>

<div class="proposition">

<strong>Proposition (Remainder Theorem, RT).</strong> The remainder when \(f(x)\) is divided by \((x-c)\) is \(f(c)\).

</div>

<div class="corollary">

<strong>Corollary (Factor Theorem, FT).</strong> \((x-c)\) is a factor of \(f(x)\) if and only if \(f(c) = 0\).

</div>

<div class="lemma">

<strong>Lemma.</strong> If \(h(x) = f(x)g(x)\) in \(F[x]\), then \(\deg h = \deg f + \deg g\).

</div>

<div class="proposition">

<strong>Proposition.</strong> A polynomial of degree \(n \geq 1\) over a field \(F\) has at most \(n\) roots in \(F\).

</div>

<div class="definition">

<strong>Definition 36.2.2 (Irreducible).</strong> A polynomial of positive degree in \(F[x]\) is <em>irreducible</em> over \(F\) if it cannot be written as the product of two polynomials of positive degree in \(F[x]\). Otherwise it is <em>reducible</em>.

</div>

<div class="proposition">

<strong>Proposition (CPN).</strong> If \(f(z)\) is a complex polynomial of degree \(n \geq 1\), then there exist \(c_1, \ldots, c_n \in \mathbb{C}\) and \(c \neq 0\) such that
\[f(z) = c(z - c_1)(z - c_2)\cdots(z - c_n).\]

</div>

<div class="definition">

<strong>Definition 36.3.1 (Multiplicity).</strong> The <em>multiplicity</em> of a root \(c\) is the largest \(k\) such that \((x-c)^k \mid f(x)\).

</div>

<div class="theorem">

<strong>Theorem (Rational Roots Theorem, RRT).</strong> Let \(f(x) = a_n x^n + \cdots + a_0\) have integer coefficients. If \(\frac{p}{q}\) is a rational root with \(\gcd(p,q) = 1\), then \(p \mid a_0\) and \(q \mid a_n\).

</div>

<div class="theorem">

<strong>Theorem (Conjugate Roots Theorem, CJRT).</strong> If \(f(x)\) has real coefficients and \(c \in \mathbb{C}\) is a root, then \(\bar{c}\) is also a root.

</div>

<div class="corollary">

<strong>Corollary (Real Quadratic Factors, RQF).</strong> If \(f(x)\) has real coefficients and \(c\) is a nonreal root, then \(f(x) = g(x)q(x)\) where \(g(x) = x^2 - 2\operatorname{Re}(c)x + |c|^2\) is a real quadratic.

</div>

<div class="theorem">

<strong>Theorem (Real Factors of Real Polynomials, RFRP).</strong> Every real polynomial of degree \(\geq 1\) can be written as a product of real linear and real quadratic factors.

</div>

# Part VII: Bijections, Counting, and Cardinality

## Chapter 37: Compositions and Bijections

<div class="definition">

<strong>Definition 37.3.1 (Composition).</strong> If \(f: T \to V\) and \(g: S \to T\), then \(f \circ g: S \to V\) is defined by \((f \circ g)(x) = f(g(x))\).

</div>

<div class="proposition">

<strong>Proposition.</strong> The composition of surjections is surjective.

</div>

<div class="proposition">

<strong>Proposition.</strong> The composition of injections is injective.

</div>

<div class="definition">

<strong>Definition 37.4.1 (Bijective).</strong> A function is <em>bijective</em> if it is both surjective and injective.

</div>

<div class="proposition">

<strong>Proposition.</strong> The composition of bijections is a bijection.

</div>

<div class="definition">

<strong>Definition 37.4.2 (Inverse).</strong> If \(f: S \to T\) and \(g: T \to S\) satisfy \(g(f(s)) = s\) for all \(s\) and \(f(g(t)) = t\) for all \(t\), then \(g = f^{-1}\).

</div>

<div class="theorem">

<strong>Theorem (Inverse Theorem).</strong> A function has an inverse if and only if it is bijective.

</div>

## Chapter 38: Counting

<div class="definition">

<strong>Definition 38.3.1 (Same Cardinality).</strong> If there exists a bijection between sets \(S\) and \(T\), we write \(|S| = |T|\).

</div>

<div class="definition">

<strong>Definition 38.3.2 (Finite and Infinite).</strong> If there exists a bijection between \(S\) and \(\{1,2,\ldots,n\}\), then \(|S| = n\) and \(S\) is <em>finite</em>. Otherwise, \(S\) is <em>infinite</em>.

</div>

<div class="proposition">

<strong>Proposition (Cardinality of Disjoint Sets, CDS).</strong> If \(S\) and \(T\) are disjoint finite sets, then \(|S \cup T| = |S| + |T|\).

</div>

<div class="proposition">

<strong>Proposition (Cardinality of Intersecting Sets, CIS).</strong> For any finite sets \(S\) and \(T\), \(|S \cup T| = |S| + |T| - |S \cap T|\).

</div>

<div class="proposition">

<strong>Proposition (Cardinality of Subsets of Finite Sets, CSFS).</strong> If \(S \subsetneq T\) are finite sets, then \(|S| < |T|\).

</div>

## Chapter 39: Cardinality of Infinite Sets

<div class="proposition">

<strong>Proposition.</strong> \(|\mathbb{N}| = |2\mathbb{N}|\), where \(2\mathbb{N}\) is the set of even natural numbers. The bijection is \(f(n) = 2n\).

</div>

<div class="proposition">

<strong>Proposition.</strong> \(|\mathbb{N} \times \mathbb{N}| = |\mathbb{N}|\).

</div>

The proof uses the bijection \(f(a,b) = 2^{a-1}(2b-1)\) and the Even-Odd Factorization of Natural Numbers.

<div class="proposition">

<strong>Proposition.</strong> \(|\mathbb{N}| \neq |(0,1)|\). That is, the natural numbers and the open interval of reals do not have the same cardinality.

</div>

The proof is Cantor's diagonal argument: any proposed listing of elements of \((0,1)\) must miss some element constructed to differ from the \(i\)-th listed number in its \(i\)-th decimal digit.
