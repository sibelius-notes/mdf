---
title: "MATH 145: Algebra for Honours Mathematics"
subjects: "MATH"
---

These notes cover MATH 145, the honours enrichment of MATH 135 at the University of Waterloo. The course develops the algebraic foundations underlying modern number theory and cryptography — divisibility, congruences, prime factorization, and the structure of modular arithmetic — at a level of rigour and depth suited to students who will continue into pure mathematics. Where MATH 135 states results, MATH 145 proves them; where MATH 135 computes, MATH 145 asks *why* the computation works.

---

# Chapter 1: Logic and Proofs

Mathematics is a language before it is a subject. Before we can prove anything about integers, we need precise conventions for what it means to *make a claim* and what it means to *establish that claim*. This chapter sets up that vocabulary.

## Mathematical Statements and Connectives

A mathematical statement is not merely a sentence — it is a sentence with a definite truth value. The power of formal logic is that it lets us manipulate truth values symbolically, building complex guarantees from simple ones.

<div class="definition">

<strong>Definition 1.1 (Statement).</strong> A <em>statement</em> is a sentence that is either true or false, but not both. A <em>proposition</em> is a statement that requires proof; a <em>theorem</em> is a significant proposition; a <em>lemma</em> is a helper result; a <em>corollary</em> follows easily from a theorem. An <em>axiom</em> is a statement accepted without proof.

</div>

The logical connectives allow us to build compound statements from simpler ones.

<div class="definition">

<strong>Definition 1.2 (Logical Connectives).</strong> Let \(A\) and \(B\) be statements.
<ul>
<li><em>Negation:</em> \(\neg A\) is true exactly when \(A\) is false.</li>
<li><em>Conjunction:</em> \(A \wedge B\) is true exactly when both \(A\) and \(B\) are true.</li>
<li><em>Disjunction:</em> \(A \vee B\) is false exactly when both \(A\) and \(B\) are false. (OR is always inclusive in mathematics.)</li>
<li><em>Implication:</em> \(A \Rightarrow B\) is false only when \(A\) is true and \(B\) is false. The statement \(A\) is the <em>hypothesis</em>; \(B\) is the <em>conclusion</em>.</li>
<li><em>Biconditional:</em> \(A \Leftrightarrow B\) holds exactly when \(A\) and \(B\) have the same truth value.</li>
</ul>

</div>

<div class="remark">

Notice that an implication \(A \Rightarrow B\) is vacuously true when \(A\) is false — a false hypothesis "implies" anything. This is not a quirk but a feature: it means our theorems are never falsified by irrelevant cases.

</div>

Two statements are logically equivalent if they agree on every possible truth assignment to their components.

<div class="definition">

<strong>Definition 1.3 (Logical Equivalence).</strong> \(S_1 \equiv S_2\) if \(S_1\) and \(S_2\) have the same truth value for all states of their components.

</div>

The following equivalences are among the most useful. De Morgan's Laws say that negation "distributes" through \(\vee\) and \(\wedge\) by swapping them.

<div class="proposition">

<strong>Proposition 1.4 (De Morgan's Laws).</strong>
\[\neg(A \vee B) \equiv (\neg A) \wedge (\neg B), \qquad \neg(A \wedge B) \equiv (\neg A) \vee (\neg B).\]

</div>

Two further equivalences govern implications: the *contrapositive* and the *negation*.

<div class="proposition">

<strong>Proposition 1.5 (Contrapositive and Negation of Implication).</strong>
\[(A \Rightarrow B) \equiv (\neg B \Rightarrow \neg A), \qquad \neg(A \Rightarrow B) \equiv A \wedge (\neg B).\]

</div>

Notice that the converse \(B \Rightarrow A\) is *not* equivalent to \(A \Rightarrow B\); confusing an implication with its converse is one of the most common errors in mathematical argument.

## Quantifiers and Negation

Real mathematical statements almost always quantify over sets: "for all integers \(n\)..." or "there exists a prime \(p\) such that...".

<div class="definition">

<strong>Definition 1.6 (Quantifiers).</strong> Let \(P(x)\) be a predicate (a statement depending on \(x\)).
<ul>
<li>The <em>universal statement</em> \(\forall x \in S,\, P(x)\) asserts that \(P(x)\) holds for every element of \(S\).</li>
<li>The <em>existential statement</em> \(\exists x \in S,\, P(x)\) asserts that at least one element of \(S\) satisfies \(P\).</li>
</ul>
Negation rules: \(\neg[\forall x \in S,\, P(x)] \equiv \exists x \in S,\, \neg P(x)\) and \(\neg[\exists x \in S,\, P(x)] \equiv \forall x \in S,\, \neg P(x)\).

</div>

When quantifiers are nested, order matters enormously. The statement \(\forall x\, \exists y,\, x + y = 0\) says every integer has an additive inverse; the statement \(\exists y\, \forall x,\, x + y = 0\) would say there is a single \(y\) that works for all \(x\) simultaneously — a very different (and false) claim.

## Proof Techniques

The four fundamental proof strategies each correspond to a logical manipulation.

<div class="definition">

<strong>Definition 1.7 (Proof Strategies).</strong>
<ul>
<li><em>Direct proof</em> of \(A \Rightarrow B\): assume \(A\) and deduce \(B\).</li>
<li><em>Proof by contrapositive</em>: prove the equivalent \(\neg B \Rightarrow \neg A\).</li>
<li><em>Proof by contradiction</em>: assume \(\neg C\) (the negation of the target \(C\)) and derive a contradiction \(X \wedge \neg X\).</li>
<li><em>Proof by induction</em>: see Chapter 2.</li>
</ul>

</div>

A particularly important special case is the proof of an *if and only if* statement \(A \Leftrightarrow B\): one must prove both \(A \Rightarrow B\) and \(B \Rightarrow A\) separately.

---

# Chapter 2: Mathematical Induction and Well-Ordering

Induction is the engine of number theory. Nearly every result about integers — from the existence of prime factorizations to Fermat's Little Theorem — ultimately rests on induction or its close relative, the Well-Ordering Principle. Understanding the relationship between these two principles is itself an important theorem.

## Simple Induction

<div class="definition">

<strong>Axiom 2.1 (Principle of Mathematical Induction, POMI).</strong> Let \(P(n)\) be a predicate on \(\mathbb{N} = \{1, 2, 3, \ldots\}\). Suppose:
<ol>
<li><em>Base case:</em> \(P(1)\) is true.</li>
<li><em>Inductive step:</em> For every \(k \in \mathbb{N}\), \(P(k) \Rightarrow P(k+1)\).</li>
</ol>
Then \(P(n)\) is true for all \(n \in \mathbb{N}\).

</div>

<div class="remark">

The intuition is a domino argument: the first domino falls (base case), and each fallen domino knocks over the next (inductive step), so all dominoes fall. But notice that induction does not tell you <em>what</em> to prove — finding the right predicate \(P(n)\) is the creative act.

</div>

<div class="example">

<strong>Example 2.2.</strong> We prove \(\displaystyle\sum_{i=1}^n i = \frac{n(n+1)}{2}\) for all \(n \geq 1\).

<em>Base case:</em> \(n = 1\): LHS \(= 1\), RHS \(= \frac{1 \cdot 2}{2} = 1\). ✓

<em>Inductive step:</em> Assume the formula holds for some \(k \geq 1\). Then
\[\sum_{i=1}^{k+1} i = \left(\sum_{i=1}^k i\right) + (k+1) = \frac{k(k+1)}{2} + (k+1) = (k+1)\cdot\frac{k+2}{2} = \frac{(k+1)(k+2)}{2},\]
which is the formula for \(n = k+1\). \(\square\)

</div>

## Strong Induction and Well-Ordering

Simple induction proves \(P(k+1)\) using only the single hypothesis \(P(k)\). But for many problems — for instance, proving every integer greater than 1 has a prime factor — we need to use *all* the previous cases simultaneously. This motivates strong induction.

<div class="definition">

<strong>Axiom 2.3 (Principle of Strong Induction, POSI).</strong> Let \(P(n)\) be a predicate on \(\mathbb{N}\). Suppose:
<ol>
<li><em>Base cases:</em> \(P(1), P(2), \ldots, P(b)\) are all true for some \(b \geq 1\).</li>
<li><em>Inductive step:</em> For every \(k \geq b\), if \(P(j)\) holds for all \(1 \leq j \leq k\), then \(P(k+1)\) holds.</li>
</ol>
Then \(P(n)\) is true for all \(n \in \mathbb{N}\).

</div>

<div class="remark">

Strong induction is not "stronger" than simple induction in a logical sense — they are equivalent. The difference is purely practical: strong induction gives you a richer inductive hypothesis to work with.

</div>

The third avatar of the same principle is the Well-Ordering Principle, which asserts that every non-empty set of natural numbers has a smallest element.

<div class="definition">

<strong>Axiom 2.4 (Well-Ordering Principle, WOP).</strong> Every non-empty subset \(S \subseteq \mathbb{N}\) contains a smallest element: there exists \(m \in S\) such that \(m \leq s\) for all \(s \in S\).

</div>

<div class="theorem">

<strong>Theorem 2.5 (Equivalence of Induction and WOP).</strong> The Principle of Mathematical Induction, the Principle of Strong Induction, and the Well-Ordering Principle are logically equivalent (given the Peano axioms for \(\mathbb{N}\)).

</div>

*Proof (sketch).* POMI \(\Rightarrow\) WOP: Suppose for contradiction that \(S \subseteq \mathbb{N}\) is non-empty with no smallest element. Let \(P(n)\) be "\(n \notin S\)". Since \(S\) has no smallest element, \(1 \notin S\) (otherwise 1 would be smallest). If \(1, \ldots, k \notin S\), then \(k+1 \notin S\) (else it would be the minimum). By POMI, \(P(n)\) holds for all \(n\), so \(S = \emptyset\), a contradiction. WOP \(\Rightarrow\) POSI: If POSI fails, the set \(S = \{n : P(n) \text{ is false}\}\) is non-empty, so by WOP it has a minimum \(m\). Then \(P(j)\) holds for all \(j < m\), so the inductive step forces \(P(m)\) — contradicting \(m \in S\). \(\square\)

The practical upshot: in any proof by contradiction involving integers, we may freely invoke WOP; in any induction, we may freely use all previous cases.

---

# Chapter 3: Divisibility and the Euclidean Algorithm

Divisibility is the central organizing concept of elementary number theory. Two integers may share common factors, and the *greatest* such factor — the GCD — encodes surprisingly deep information about their relationship. The Euclidean algorithm, some 2300 years old, computes this quantity efficiently and reveals its innermost structure.

## Divisibility

<div class="definition">

<strong>Definition 3.1 (Divisibility).</strong> An integer \(m\) <em>divides</em> an integer \(n\), written \(m \mid n\), if there exists an integer \(k\) with \(n = km\). We call \(m\) a <em>divisor</em> or <em>factor</em> of \(n\), and \(n\) a <em>multiple</em> of \(m\). Write \(m \nmid n\) when no such \(k\) exists.

</div>

<div class="remark">

Notice that divisibility is a statement about integers, not rationals: \(3 \mid 6\) because \(6 = 2 \cdot 3\), but we do not say \(4 \mid 6\) even though \(6/4 \in \mathbb{Q}\).

</div>

The following three propositions are the workhorse lemmas of divisibility. Their proofs are direct: write everything in terms of the definition and observe that integer linear combinations of integers are integers.

<div class="proposition">

<strong>Proposition 3.2 (Transitivity of Divisibility, TD).</strong> If \(a \mid b\) and \(b \mid c\), then \(a \mid c\).

</div>

*Proof.* Write \(b = ka\) and \(c = \ell b\) for integers \(k, \ell\). Then \(c = \ell b = \ell k a = (\ell k) a\), so \(a \mid c\). \(\square\)

<div class="proposition">

<strong>Proposition 3.3 (Divisibility of Integer Combinations, DIC).</strong> If \(a \mid b\) and \(a \mid c\), then for any integers \(x, y\), \(a \mid (bx + cy)\).

</div>

*Proof.* Write \(b = sa\) and \(c = ta\). Then \(bx + cy = sax + tay = a(sx + ty)\), so \(a \mid (bx + cy)\). \(\square\)

<div class="proposition">

<strong>Proposition 3.4 (Bounds by Divisibility, BBD).</strong> If \(a \mid b\) and \(b \neq 0\), then \(\lvert a \rvert \leq \lvert b \rvert\).

</div>

*Proof.* Write \(b = ka\). Since \(b \neq 0\), we have \(k \neq 0\), so \(\lvert k \rvert \geq 1\). Then \(\lvert b \rvert = \lvert k \rvert \cdot \lvert a \rvert \geq \lvert a \rvert\). \(\square\)

## The Division Algorithm

Before we can discuss GCDs, we need to establish that integer division always leaves a well-defined remainder. This is so basic it seems obvious — but it requires a proof.

<div class="theorem">

<strong>Theorem 3.5 (Division Algorithm).</strong> Let \(a \in \mathbb{Z}\) and \(b \in \mathbb{Z}\) with \(b > 0\). Then there exist <em>unique</em> integers \(q\) (quotient) and \(r\) (remainder) such that
\[a = qb + r, \qquad 0 \leq r < b.\]

</div>

*Proof (existence).* Consider the set \(S = \{a - qb : q \in \mathbb{Z},\, a - qb \geq 0\}\). This set is non-empty (take \(q = -\lvert a \rvert\), so \(a - qb = a + \lvert a \rvert b \geq 0\)). By the Well-Ordering Principle, \(S\) has a minimum element; call it \(r = a - q_0 b\) for some \(q_0\). We claim \(r < b\). If \(r \geq b\), then \(r - b = a - (q_0 + 1)b \geq 0\), so \(r - b \in S\) with \(r - b < r\), contradicting minimality. Hence \(0 \leq r < b\).

*Uniqueness.* Suppose \(a = q_1 b + r_1 = q_2 b + r_2\) with \(0 \leq r_1, r_2 < b\). Subtracting: \((q_1 - q_2)b = r_2 - r_1\). Since \(\lvert r_2 - r_1 \rvert < b\), we get \(\lvert q_1 - q_2 \rvert < 1\), forcing \(q_1 = q_2\) and hence \(r_1 = r_2\). \(\square\)

## GCD and the Euclidean Algorithm

<div class="definition">

<strong>Definition 3.6 (Greatest Common Divisor).</strong> Let \(a, b \in \mathbb{Z}\), not both zero. The <em>greatest common divisor</em> \(d = \gcd(a,b)\) is the unique positive integer satisfying:
<ol>
<li>\(d \mid a\) and \(d \mid b\),</li>
<li>if \(c \mid a\) and \(c \mid b\), then \(c \leq d\).</li>
</ol>
We set \(\gcd(0,0) = 0\) by convention.

</div>

The GCD measures the "arithmetic complexity" of the pair \((a,b)\). Two integers with \(\gcd(a,b) = 1\) are called <em>coprime</em> and are, in an arithmetic sense, as unrelated as integers can be.

The key tool for computing GCDs efficiently is the following lemma, which says GCDs are preserved when we subtract a multiple.

<div class="proposition">

<strong>Proposition 3.7 (GCD with Remainders, GCD WR).</strong> If \(a = qb + r\), then \(\gcd(a,b) = \gcd(b,r)\).

</div>

*Proof.* It suffices to show the two pairs have the same set of common divisors. If \(d \mid a\) and \(d \mid b\), then \(d \mid (a - qb) = r\), so \(d\) is a common divisor of \(b\) and \(r\). Conversely, if \(d \mid b\) and \(d \mid r\), then \(d \mid (qb + r) = a\). The two sets of common divisors coincide, so their maxima coincide. \(\square\)

The Euclidean Algorithm applies the Division Algorithm repeatedly, exploiting Proposition 3.7 at each step:
\[\gcd(a,b) = \gcd(b, r_1) = \gcd(r_1, r_2) = \cdots = \gcd(r_{k-1}, r_k) = \gcd(r_k, 0) = r_k.\]
The remainders \(r_1 > r_2 > \cdots \geq 0\) strictly decrease, so the algorithm terminates. The last nonzero remainder is the GCD.

<div class="example">

<strong>Example 3.8.</strong> \(\gcd(252, 105)\): \(252 = 2 \cdot 105 + 42\), \(105 = 2 \cdot 42 + 21\), \(42 = 2 \cdot 21 + 0\). So \(\gcd(252, 105) = 21\).

</div>

## Bézout's Identity

Perhaps the single most important theorem in elementary number theory: the GCD is not merely the largest common divisor, it is the *smallest positive integer combination* of \(a\) and \(b\).

<div class="theorem">

<strong>Theorem 3.9 (Bézout's Identity).</strong> For integers \(a, b\) not both zero, there exist integers \(x, y\) such that
\[ax + by = \gcd(a,b).\]

</div>

*Proof.* Let \(S = \{ax + by : x, y \in \mathbb{Z},\, ax + by > 0\}\). Since \(a^2 + b^2 > 0 \in S\) (well, \(a \cdot a + b \cdot b = a^2 + b^2 > 0\) for \((a,b) \neq (0,0)\)), \(S\) is non-empty. Let \(d\) be the smallest element of \(S\) (by WOP), say \(d = ax_0 + by_0\). We show \(d = \gcd(a,b)\).

First, every common divisor of \(a\) and \(b\) divides \(d = ax_0 + by_0\) (by DIC). In particular, \(d\) is an integer combination, so any common divisor is at most \(d\).

Second, \(d \mid a\). Write \(a = qd + r\) with \(0 \leq r < d\). Then \(r = a - qd = a - q(ax_0 + by_0) = a(1 - qx_0) + b(-qy_0)\) is an integer combination of \(a\) and \(b\). If \(r > 0\), then \(r \in S\) with \(r < d\), contradicting minimality. So \(r = 0\) and \(d \mid a\). Similarly \(d \mid b\).

Thus \(d\) is a positive common divisor of \(a\) and \(b\), and it is divisible by every common divisor, so \(d\) is the greatest common divisor. \(\square\)

The *Extended Euclidean Algorithm (EEA)* computes the Bézout coefficients \(x, y\) constructively by back-substituting through the steps of the Euclidean Algorithm.

<div class="corollary">

<strong>Corollary 3.10 (GCD Characterization Theorem, GCD CT).</strong> A positive integer \(d\) equals \(\gcd(a,b)\) if and only if \(d \mid a\), \(d \mid b\), and there exist integers \(x, y\) with \(ax + by = d\).

</div>

<div class="corollary">

<strong>Corollary 3.11 (Coprimeness Criterion).</strong> \(\gcd(a,b) = 1\) if and only if there exist integers \(x, y\) with \(ax + by = 1\).

</div>

<div class="proposition">

<strong>Proposition 3.12 (Coprimeness and Divisibility, CAD).</strong> If \(c \mid ab\) and \(\gcd(a,c) = 1\), then \(c \mid b\).

</div>

*Proof.* By Corollary 3.11, write \(ax + cy = 1\) for integers \(x,y\). Multiply by \(b\): \(abx + cby = b\). Now \(c \mid ab\) so \(c \mid abx\), and certainly \(c \mid cby\), so \(c \mid (abx + cby) = b\). \(\square\)

<div class="proposition">

<strong>Proposition 3.13 (Division by the GCD).</strong> If \(\gcd(a,b) = d \neq 0\), then \(\gcd(a/d,\, b/d) = 1\).

</div>

---

# Chapter 4: Primes and Unique Factorization

Primes are the atoms of multiplicative arithmetic — the integers that cannot be broken down further. The Fundamental Theorem of Arithmetic says that the factorization into primes is unique, a fact so basic that we rarely question it. But uniqueness is a genuine theorem; it does not hold in every number system, and its failure in rings like \(\mathbb{Z}[\sqrt{-5}]\) is one of the motivating problems of algebraic number theory.

## Prime Numbers

<div class="definition">

<strong>Definition 4.1 (Prime, Composite).</strong> An integer \(p > 1\) is <em>prime</em> if its only positive divisors are \(1\) and \(p\). An integer \(n > 1\) is <em>composite</em> if it is not prime — equivalently, if \(n = ab\) for integers \(2 \leq a, b < n\).

</div>

<div class="lemma">

<strong>Lemma 4.2 (Euclid's Lemma).</strong> If \(p\) is prime and \(p \mid ab\), then \(p \mid a\) or \(p \mid b\).

</div>

*Proof.* Suppose \(p \nmid a\). Since \(p\) is prime, its only positive divisors are \(1\) and \(p\). Since \(p \nmid a\), we have \(\gcd(a,p) = 1\). By Proposition 3.12, \(p \mid b\). \(\square\)

<div class="remark">

Euclid's Lemma is the key to <em>uniqueness</em> in prime factorization. It says that primes behave "multiplicatively irreducibly" — you cannot split their divisibility between two factors. By induction, if \(p \mid a_1 a_2 \cdots a_k\) then \(p \mid a_i\) for some \(i\).

</div>

<div class="proposition">

<strong>Proposition 4.3 (Finding a Prime Factor, FPF).</strong> Every integer \(n > 1\) has at least one prime factor. Moreover, the smallest prime factor of \(n\) is at most \(\sqrt{n}\) unless \(n\) is itself prime.

</div>

*Proof.* Let \(p\) be the smallest divisor of \(n\) greater than 1. If \(p = ab\) with \(1 < a, b < p\), then \(a \mid n\) and \(a < p\), contradicting minimality; so \(p\) is prime. For the bound: if \(n\) is composite, write \(n = ab\) with \(1 < a \leq b < n\). Then \(a^2 \leq ab = n\), so \(a \leq \sqrt{n}\). \(\square\)

## Infinitude of Primes

<div class="theorem">

<strong>Theorem 4.4 (Euclid's Theorem).</strong> There are infinitely many primes.

</div>

*Proof.* Suppose for contradiction that the set of all primes is finite: \(\{p_1, p_2, \ldots, p_k\}\). Form the integer
\[N = p_1 p_2 \cdots p_k + 1.\]
By Proposition 4.3, \(N > 1\) has a prime factor \(p\). Since every \(p_i\) divides the product \(p_1 \cdots p_k\), we have \(p_i \mid (N - p_1 \cdots p_k) = 1\) if \(p = p_i\), which is impossible. So \(p \notin \{p_1, \ldots, p_k\}\), contradicting that the list was complete. \(\square\)

## The Fundamental Theorem of Arithmetic

<svg viewBox="0 0 340 220" xmlns="http://www.w3.org/2000/svg" style="max-width:340px;display:block;margin:1.5em auto">
  <text x="170" y="14" text-anchor="middle" font-size="12" font-weight="bold" fill="currentColor">Prime Factorization Tree: 60 = 2²·3·5</text>
  <!-- root: 60 -->
  <circle cx="170" cy="36" r="18" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <text x="170" y="40" text-anchor="middle" font-size="13" font-weight="bold" fill="currentColor">60</text>
  <!-- split: 4 × 15 -->
  <line x1="155" y1="52" x2="100" y2="84" stroke="currentColor" stroke-width="1.3"/>
  <line x1="185" y1="52" x2="240" y2="84" stroke="currentColor" stroke-width="1.3"/>
  <circle cx="100" cy="100" r="16" fill="none" stroke="#3b82f6" stroke-width="1.5"/>
  <text x="100" y="104" text-anchor="middle" font-size="12" fill="#3b82f6">4</text>
  <circle cx="240" cy="100" r="16" fill="none" stroke="#22c55e" stroke-width="1.5"/>
  <text x="240" y="104" text-anchor="middle" font-size="12" fill="#22c55e">15</text>
  <!-- 4 → 2 × 2 -->
  <line x1="88" y1="114" x2="60" y2="148" stroke="#3b82f6" stroke-width="1.2"/>
  <line x1="112" y1="114" x2="130" y2="148" stroke="#3b82f6" stroke-width="1.2"/>
  <circle cx="60" cy="162" r="16" fill="#3b82f620" stroke="#3b82f6" stroke-width="1.8"/>
  <text x="60" y="167" text-anchor="middle" font-size="13" font-weight="bold" fill="#3b82f6">2</text>
  <circle cx="130" cy="162" r="16" fill="#3b82f620" stroke="#3b82f6" stroke-width="1.8"/>
  <text x="130" y="167" text-anchor="middle" font-size="13" font-weight="bold" fill="#3b82f6">2</text>
  <!-- 15 → 3 × 5 -->
  <line x1="228" y1="114" x2="205" y2="148" stroke="#22c55e" stroke-width="1.2"/>
  <line x1="252" y1="114" x2="278" y2="148" stroke="#22c55e" stroke-width="1.2"/>
  <circle cx="205" cy="162" r="16" fill="#22c55e20" stroke="#22c55e" stroke-width="1.8"/>
  <text x="205" y="167" text-anchor="middle" font-size="13" font-weight="bold" fill="#22c55e">3</text>
  <circle cx="278" cy="162" r="16" fill="#22c55e20" stroke="#22c55e" stroke-width="1.8"/>
  <text x="278" y="167" text-anchor="middle" font-size="13" font-weight="bold" fill="#22c55e">5</text>
  <!-- result -->
  <text x="170" y="200" text-anchor="middle" font-size="11" fill="currentColor">60 = 2 × 2 × 3 × 5 = 2² · 3 · 5</text>
  <text x="170" y="216" text-anchor="middle" font-size="10" fill="currentColor">Leaves are primes — factorization is unique (FTA)</text>
</svg>

<div class="theorem">

<strong>Theorem 4.5 (Fundamental Theorem of Arithmetic, FTA).</strong> Every integer \(n > 1\) can be written as a product of primes. Moreover, this factorization is unique up to the order of the factors.

</div>

*Proof.* **Existence** by strong induction: if \(n\) is prime we are done; if \(n\) is composite, write \(n = ab\) with \(1 < a, b < n\). By the inductive hypothesis both \(a\) and \(b\) have prime factorizations, and their product is a prime factorization of \(n\).

**Uniqueness.** Suppose \(n = p_1 p_2 \cdots p_s = q_1 q_2 \cdots q_t\) are two prime factorizations. Then \(p_1 \mid q_1 q_2 \cdots q_t\). By Euclid's Lemma applied repeatedly, \(p_1 \mid q_j\) for some \(j\). Since \(q_j\) is prime and \(p_1 > 1\), we have \(p_1 = q_j\). Cancel \(p_1\) from both sides and repeat by strong induction on the number of prime factors. This forces \(s = t\) and the \(p_i\)'s are a rearrangement of the \(q_j\)'s. \(\square\)

<div class="remark">

The FTA allows us to write every \(n > 1\) uniquely as \(n = p_1^{\alpha_1} p_2^{\alpha_2} \cdots p_k^{\alpha_k}\) where \(p_1 < p_2 < \cdots < p_k\) are primes and \(\alpha_i \geq 1\). From this representation, the GCD and LCM become transparent: \(\gcd(a,b) = \prod_i p_i^{\min(\alpha_i, \beta_i)}\).

</div>

<div class="proposition">

<strong>Proposition 4.6 (GCD from Prime Factorization).</strong> Write \(a = \prod_i p_i^{\alpha_i}\) and \(b = \prod_i p_i^{\beta_i}\) (using all primes, with zero exponents allowed). Then
\[\gcd(a,b) = \prod_i p_i^{\min(\alpha_i,\, \beta_i)}.\]

</div>

---

# Chapter 5: Diophantine Equations

A Diophantine equation asks: given integer coefficients, do integer solutions exist, and if so, what are all of them? The simplest nontrivial case — two unknowns, total degree one — is completely solved by the GCD theory we have built.

## Linear Diophantine Equations

<div class="definition">

<strong>Definition 5.1 (Linear Diophantine Equation).</strong> An equation of the form \(ax + by = c\), where \(a, b, c \in \mathbb{Z}\) are given and \(x, y \in \mathbb{Z}\) are unknowns, is a <em>linear Diophantine equation (LDE)</em>.

</div>

<div class="theorem">

<strong>Theorem 5.2 (LDE Existence, LDET 1).</strong> Let \(d = \gcd(a,b)\). The equation \(ax + by = c\) has an integer solution if and only if \(d \mid c\).

</div>

*Proof.* If \(ax + by = c\) has a solution, then since \(d \mid a\) and \(d \mid b\), by DIC we get \(d \mid c\). Conversely, if \(d \mid c\), write \(c = d \cdot m\). By Bézout, there exist \(x_0, y_0\) with \(ax_0 + by_0 = d\). Multiply through by \(m\): \(a(mx_0) + b(my_0) = dm = c\), giving the solution \(x = mx_0\), \(y = my_0\). \(\square\)

<div class="theorem">

<strong>Theorem 5.3 (LDE Complete Solution, LDET 2).</strong> If \(x_0, y_0\) is one particular solution to \(ax + by = c\), with \(\gcd(a,b) = d \neq 0\), then the complete integer solution is
\[x = x_0 + \frac{b}{d}\,n, \qquad y = y_0 - \frac{a}{d}\,n, \qquad n \in \mathbb{Z}.\]

</div>

*Proof.* Any solution satisfies \(a(x - x_0) + b(y - y_0) = 0\), i.e., \(\frac{a}{d}(x - x_0) = -\frac{b}{d}(y - y_0)\). Since \(\gcd(a/d,\, b/d) = 1\) and the left side is divisible by \(b/d\), by CAD we get \((b/d) \mid (x - x_0)\), say \(x - x_0 = (b/d)n\). Substituting back gives \(y - y_0 = -(a/d)n\). \(\square\)

## The Frobenius (Chicken McNugget) Theorem

The Frobenius problem asks: given relatively prime positive integers \(a\) and \(b\), what is the largest integer that cannot be represented as \(ax + by\) with \(x, y \geq 0\)?

<div class="theorem">

<strong>Theorem 5.4 (Frobenius / Chicken McNugget Theorem).</strong> Let \(a, b\) be positive integers with \(\gcd(a,b) = 1\). Then every integer \(n \geq (a-1)(b-1)\) can be written as \(ax + by\) with \(x, y \geq 0\), and the largest integer that cannot is \(ab - a - b\).

</div>

*Proof (sketch).* By LDET 1, since \(\gcd(a,b) = 1\) divides every integer, the equation \(ax + by = n\) always has integer solutions. By LDET 2, the solutions are \(x = x_0 + bn\), \(y = y_0 - an\) for \(n \in \mathbb{Z}\). Among all solutions, choose the one with \(0 \leq x < b\). Then \(y = (n - ax)/b\). One checks that \(y \geq 0\) iff \(n \geq ax\). Since \(x \leq b-1\), this holds when \(n \geq a(b-1) = ab - a\). More carefully, the representable integers form the set \(\{ax + by : x,y \geq 0\}\); the non-representable integers are exactly those \(n\) for which no choice of remainder forces \(y \geq 0\), and \(ab - a - b\) is the largest such. \(\square\)

<div class="example">

<strong>Example 5.5.</strong> With \(a = 6\) (McNuggets sold in sixes) and \(b = 9\), \(\gcd(6,9) = 3\), so any multiple of 3 can be represented. With \(a = 6\), \(b = 11\): the largest non-representable number is \(6 \cdot 11 - 6 - 11 = 49\).

</div>

---

# Chapter 6: Congruences

Modular arithmetic is the study of remainders after division, formalized as an equivalence relation on the integers. What makes it so powerful is that the equivalence is *compatible with arithmetic operations* — addition and multiplication of residues are well-defined — giving the integers modulo \(n\) the structure of a ring.

## Basic Congruence Arithmetic

<div class="definition">

<strong>Definition 6.1 (Congruence).</strong> Let \(m \geq 1\) be an integer. We say \(a\) is <em>congruent to</em> \(b\) modulo \(m\), written \(a \equiv b \pmod{m}\), if \(m \mid (a-b)\).

</div>

Equivalently, \(a \equiv b \pmod{m}\) if and only if \(a\) and \(b\) have the same remainder when divided by \(m\). The value \(m\) is called the <em>modulus</em>.

<div class="proposition">

<strong>Proposition 6.2 (Congruence is an Equivalence Relation, CER).</strong> For all \(a, b, c \in \mathbb{Z}\):
<ol>
<li>\(a \equiv a \pmod{m}\) (reflexive).</li>
<li>\(a \equiv b \Rightarrow b \equiv a \pmod{m}\) (symmetric).</li>
<li>\(a \equiv b\) and \(b \equiv c \Rightarrow a \equiv c \pmod{m}\) (transitive).</li>
</ol>

</div>

<div class="theorem">

<strong>Theorem 6.3 (Properties of Congruence, PC).</strong> If \(a \equiv a' \pmod{m}\) and \(b \equiv b' \pmod{m}\), then:
<ol>
<li>\(a + b \equiv a' + b' \pmod{m}\),</li>
<li>\(a - b \equiv a' - b' \pmod{m}\),</li>
<li>\(ab \equiv a'b' \pmod{m}\).</li>
</ol>
In particular, \(a \equiv b \pmod{m}\) implies \(a^n \equiv b^n \pmod{m}\) for all \(n \in \mathbb{N}\).

</div>

*Proof.* Write \(a = a' + sm\) and \(b = b' + tm\). Then \(a + b = (a' + b') + (s+t)m\), giving (1). For (3): \(ab = (a' + sm)(b' + tm) = a'b' + (a't + b's + stm)m\), giving (3). \(\square\)

<div class="remark">

The significance of Theorem 6.3 is that congruence is a <em>congruence relation</em> on the ring \(\mathbb{Z}\): arithmetic respects the equivalence classes. This is what makes modular arithmetic a coherent system, not merely a bookkeeping device.

</div>

Cancellation, however, requires care:

<div class="proposition">

<strong>Proposition 6.4 (Congruence Division, CD).</strong> If \(ac \equiv bc \pmod{m}\) and \(\gcd(c,m) = 1\), then \(a \equiv b \pmod{m}\).

</div>

*Proof.* From \(ac \equiv bc\) we get \(m \mid c(a-b)\). Since \(\gcd(c,m) = 1\), by CAD, \(m \mid (a-b)\). \(\square\)

<div class="remark">

Without the coprimeness condition, cancellation can fail: \(6 \equiv 2 \pmod{4}\) but \(3 \not\equiv 1 \pmod{4}\). This failure is precisely because \(\gcd(2,4) = 2 \neq 1\).

</div>

## The Ring \(\mathbb{Z}/n\mathbb{Z}\)

<div class="definition">

<strong>Definition 6.5 (Congruence Class, \(\mathbb{Z}/n\mathbb{Z}\)).</strong> The <em>congruence class</em> of \(a\) modulo \(m\) is \([a]_m = \{x \in \mathbb{Z} : x \equiv a \pmod{m}\}\). The set of all congruence classes
\[\mathbb{Z}/n\mathbb{Z} = \{[0], [1], \ldots, [n-1]\}\]
with operations \([a] + [b] = [a+b]\) and \([a] \cdot [b] = [ab]\) is the <em>ring of integers modulo \(n\)</em>.

</div>

<div class="remark">

These operations are well-defined precisely because of Theorem 6.3: if we replace \(a\) by another representative of the same class, the class of the result does not change. This is why congruence — not mere remainder — is the right notion.

</div>

The ring \(\mathbb{Z}/n\mathbb{Z}\) has additive identity \([0]\) and multiplicative identity \([1]\). Every element has an additive inverse (\(-[a] = [n-a]\)). But not every element has a *multiplicative* inverse: \([a]\) is invertible in \(\mathbb{Z}/n\mathbb{Z}\) if and only if \(\gcd(a,n) = 1\).

<div class="definition">

<strong>Definition 6.6 (Units and Zero Divisors).</strong> An element \([a] \in \mathbb{Z}/n\mathbb{Z}\) is a <em>unit</em> if it has a multiplicative inverse: \(\exists [b]\) with \([a][b] = [1]\). An element \([a] \neq [0]\) is a <em>zero divisor</em> if \([a][b] = [0]\) for some \([b] \neq [0]\).

</div>

<div class="proposition">

<strong>Proposition 6.7 (Units in \(\mathbb{Z}/n\mathbb{Z}\)).</strong> \([a]\) is a unit in \(\mathbb{Z}/n\mathbb{Z}\) if and only if \(\gcd(a,n) = 1\).

</div>

*Proof.* \([a]\) is a unit iff \(\exists b: ab \equiv 1 \pmod{n}\) iff the equation \(ax + ny = 1\) has integer solutions iff \(\gcd(a,n) \mid 1\) iff \(\gcd(a,n) = 1\). \(\square\)

<div class="corollary">

<strong>Corollary 6.8.</strong> When \(p\) is prime, every nonzero element of \(\mathbb{Z}/p\mathbb{Z}\) is a unit. That is, \(\mathbb{Z}/p\mathbb{Z}\) is a <em>field</em>.

</div>

<div class="remark">

This is an algebraic way of saying: in a prime modulus, every linear congruence \(ax \equiv c \pmod{p}\) with \(p \nmid a\) has a unique solution. The structure of \(\mathbb{Z}/n\mathbb{Z}\) becomes much richer when \(n\) is composite.

</div>

The collection of all units forms a group under multiplication:

<div class="definition">

<strong>Definition 6.9 (Group of Units, \((\mathbb{Z}/n\mathbb{Z})^*\)).</strong> The <em>group of units modulo \(n\)</em> is
\[(\mathbb{Z}/n\mathbb{Z})^* = \{[a] \in \mathbb{Z}/n\mathbb{Z} : \gcd(a,n) = 1\}.\]
Its order is Euler's totient function \(\phi(n) = \lvert (\mathbb{Z}/n\mathbb{Z})^* \rvert\).

</div>

## Linear Congruences

<div class="theorem">

<strong>Theorem 6.10 (Linear Congruence Theorem, LCT).</strong> Let \(d = \gcd(a,m)\). The congruence \(ax \equiv c \pmod{m}\) has a solution if and only if \(d \mid c\). When solutions exist, there are exactly \(d\) distinct solutions modulo \(m\), and if \(x_0\) is one solution then the complete solution set is
\[\left\{x_0 + \frac{m}{d}\,k : k = 0, 1, \ldots, d-1\right\} \pmod{m}.\]

</div>

*Proof.* The congruence \(ax \equiv c \pmod{m}\) is equivalent to the LDE \(ax - my = c\). By LDET 1, solutions exist iff \(d \mid c\). By LDET 2, the general solution is \(x = x_0 + (m/d)n\) for \(n \in \mathbb{Z}\). Modulo \(m\), the values \(x_0, x_0 + m/d, x_0 + 2m/d, \ldots, x_0 + (d-1)m/d\) are the \(d\) distinct solutions. \(\square\)

## The Chinese Remainder Theorem

<svg viewBox="0 0 460 170" xmlns="http://www.w3.org/2000/svg" style="max-width:460px;display:block;margin:1.5em auto">
  <text x="230" y="14" text-anchor="middle" font-size="12" font-weight="bold" fill="currentColor">Chinese Remainder Theorem: simultaneous congruences</text>
  <!-- system of congruences -->
  <rect x="10" y="22" width="200" height="80" rx="4" fill="none" stroke="#3b82f6" stroke-width="1.5"/>
  <text x="110" y="38" text-anchor="middle" font-size="11" font-weight="bold" fill="#3b82f6">System</text>
  <text x="20" y="57" font-size="11" fill="currentColor">n ≡ 2  (mod 3)</text>
  <text x="20" y="74" font-size="11" fill="currentColor">n ≡ 3  (mod 5)</text>
  <text x="20" y="91" font-size="11" fill="currentColor">gcd(3,5) = 1  ✓</text>
  <!-- arrow -->
  <line x1="215" y1="62" x2="270" y2="62" stroke="#ef4444" stroke-width="2" marker-end="url(#crt)"/>
  <text x="243" y="56" text-anchor="middle" font-size="9" fill="#ef4444">unique sol</text>
  <text x="243" y="76" text-anchor="middle" font-size="9" fill="#ef4444">mod 15</text>
  <defs>
    <marker id="crt" markerWidth="8" markerHeight="8" refX="6" refY="3" orient="auto">
      <path d="M0,0 L0,6 L8,3 z" fill="#ef4444"/>
    </marker>
  </defs>
  <!-- solution -->
  <rect x="275" y="40" width="175" height="44" rx="4" fill="#22c55e20" stroke="#22c55e" stroke-width="1.5"/>
  <text x="362" y="62" text-anchor="middle" font-size="13" font-weight="bold" fill="#22c55e">n ≡ 8  (mod 15)</text>
  <text x="362" y="78" text-anchor="middle" font-size="10" fill="currentColor">8 mod 3 = 2 ✓,  8 mod 5 = 3 ✓</text>
  <!-- ring iso -->
  <rect x="10" y="115" width="440" height="42" rx="3" fill="none" stroke="currentColor" stroke-width="1" stroke-dasharray="4,2"/>
  <text x="230" y="133" text-anchor="middle" font-size="11" fill="currentColor">Ring isomorphism: ℤ/Mℤ  ≅  ℤ/m₁ℤ × ℤ/m₂ℤ × ⋯ × ℤ/mₖℤ</text>
  <text x="230" y="150" text-anchor="middle" font-size="10" fill="currentColor">when m₁,…,mₖ pairwise coprime,  M = m₁m₂⋯mₖ</text>
</svg>

One of the jewels of number theory: a system of simultaneous congruences with coprime moduli always has a unique simultaneous solution. The theorem has a constructive proof that doubles as an algorithm.

<div class="theorem">

<strong>Theorem 6.11 (Chinese Remainder Theorem, CRT).</strong> Let \(m_1, m_2, \ldots, m_k\) be pairwise coprime positive integers and let \(a_1, \ldots, a_k\) be any integers. Then the system
\[n \equiv a_1 \pmod{m_1}, \quad n \equiv a_2 \pmod{m_2}, \quad \ldots, \quad n \equiv a_k \pmod{m_k}\]
has a unique solution modulo \(M = m_1 m_2 \cdots m_k\).

</div>

*Proof.* We give the constructive proof for \(k = 2\) and then describe the general case.

**Case \(k = 2\):** We want \(n\) with \(n \equiv a_1 \pmod{m_1}\) and \(n \equiv a_2 \pmod{m_2}\). The first congruence gives \(n = a_1 + m_1 t\) for some integer \(t\). Substituting into the second: \(a_1 + m_1 t \equiv a_2 \pmod{m_2}\), i.e., \(m_1 t \equiv a_2 - a_1 \pmod{m_2}\). Since \(\gcd(m_1, m_2) = 1\), this has a unique solution \(t_0 \pmod{m_2}\) by LCT. Setting \(n_0 = a_1 + m_1 t_0\) gives a solution unique modulo \(m_1 m_2\).

**General case:** Let \(M_i = M/m_i\). Since the \(m_i\) are pairwise coprime, \(\gcd(M_i, m_i) = 1\), so there exist integers \(y_i\) with \(M_i y_i \equiv 1 \pmod{m_i}\). Set
\[n \equiv \sum_{i=1}^k a_i M_i y_i \pmod{M}.\]
Since \(m_j \mid M_i\) for \(j \neq i\), the \(j\)-th term with \(i \neq j\) vanishes mod \(m_j\), leaving \(n \equiv a_j M_j y_j \equiv a_j \pmod{m_j}\). Uniqueness mod \(M\) follows because any two solutions differ by a multiple of each \(m_i\), hence by a multiple of \(M\). \(\square\)

<div class="remark">

Algebraically, the CRT says that \(\mathbb{Z}/M\mathbb{Z} \cong \mathbb{Z}/m_1\mathbb{Z} \times \cdots \times \mathbb{Z}/m_k\mathbb{Z}\) as rings when the \(m_i\) are pairwise coprime. Each element of the product ring corresponds to a unique element of \(\mathbb{Z}/M\mathbb{Z}\). This isomorphism is the key step in the correctness proof for RSA.

</div>

<div class="theorem">

<strong>Theorem 6.12 (Splitting Modulus).</strong> Let \(m_1, m_2\) be coprime. Then \(x \equiv a \pmod{m_1 m_2}\) if and only if \(x \equiv a \pmod{m_1}\) and \(x \equiv a \pmod{m_2}\).

</div>

---

# Chapter 7: The Structure of \(\mathbb{Z}/n\mathbb{Z}\)

With the algebraic framework in place, we can prove the deep structure theorems: Fermat's Little Theorem, its generalization via Euler's totient, Wilson's Theorem (an elegant characterization of primes), and the existence of primitive roots (generators of the multiplicative group).

## Euler's Totient Function

<div class="definition">

<strong>Definition 7.1 (Euler's Totient).</strong> For \(n \geq 1\), the <em>Euler totient function</em> \(\phi(n)\) counts the integers in \(\{1, 2, \ldots, n\}\) that are coprime to \(n\):
\[\phi(n) = \lvert\{a : 1 \leq a \leq n,\ \gcd(a,n) = 1\}\rvert.\]

</div>

<div class="proposition">

<strong>Proposition 7.2 (Totient of a Prime Power).</strong> For a prime \(p\) and \(k \geq 1\),
\[\phi(p^k) = p^k - p^{k-1} = p^{k-1}(p-1).\]
In particular, \(\phi(p) = p-1\).

</div>

*Proof.* Among \(1, 2, \ldots, p^k\), exactly those divisible by \(p\) are not coprime to \(p^k\). There are \(p^{k-1}\) such multiples, so \(\phi(p^k) = p^k - p^{k-1}\). \(\square\)

<div class="theorem">

<strong>Theorem 7.3 (Multiplicativity of Totient).</strong> If \(\gcd(m,n) = 1\), then \(\phi(mn) = \phi(m)\phi(n)\).

</div>

*Proof.* By CRT, \(\mathbb{Z}/mn\mathbb{Z} \cong \mathbb{Z}/m\mathbb{Z} \times \mathbb{Z}/n\mathbb{Z}\). Under this isomorphism, \([a]_{mn}\) is a unit iff \([a]_m\) and \([a]_n\) are both units. So \(\phi(mn) = \phi(m)\phi(n)\). \(\square\)

## Fermat's Little Theorem

Fermat's Little Theorem is the foundation of almost all practical primality testing and public-key cryptography. Its proof rests on a beautiful "symmetry" argument: multiplying all nonzero residues modulo \(p\) by \(a\) permutes them.

<div class="theorem">

<strong>Theorem 7.4 (Fermat's Little Theorem, FLT).</strong> Let \(p\) be prime and \(a \in \mathbb{Z}\) with \(p \nmid a\). Then
\[a^{p-1} \equiv 1 \pmod{p}.\]
Equivalently, \(a^p \equiv a \pmod{p}\) for <em>every</em> integer \(a\).

</div>

*Proof.* Consider the \(p-1\) residues \(a, 2a, 3a, \ldots, (p-1)a\) modulo \(p\). We claim these are a permutation of \(\{1, 2, \ldots, p-1\}\). Indeed:
- None is \(\equiv 0\): since \(p \nmid a\) and \(p \nmid j\) for \(1 \leq j \leq p-1\), we have \(p \nmid ja\).
- They are distinct: if \(ia \equiv ja \pmod{p}\), then \(p \mid (i-j)a\), and since \(\gcd(a,p) = 1\) we get \(p \mid (i-j)\), forcing \(i = j\) in the range \(1, \ldots, p-1\).

Therefore \(\{a, 2a, \ldots, (p-1)a\} = \{1, 2, \ldots, p-1\}\) as sets of residues. Multiply all elements:
\[(a)(2a)(3a)\cdots((p-1)a) \equiv 1 \cdot 2 \cdot 3 \cdots (p-1) \pmod{p},\]
i.e., \(a^{p-1} \cdot (p-1)! \equiv (p-1)! \pmod{p}\). Since \(\gcd((p-1)!, p) = 1\), we cancel to get \(a^{p-1} \equiv 1 \pmod{p}\). \(\square\)

<div class="corollary">

<strong>Corollary 7.5 (Inverses in \(\mathbb{Z}/p\mathbb{Z}\)).</strong> If \(p\) is prime and \(p \nmid a\), then \(a^{-1} \equiv a^{p-2} \pmod{p}\).

</div>

## Euler's Theorem

Euler's Theorem is the generalization of FLT to composite moduli: the exponent \(p-1\) is replaced by \(\phi(n)\).

<div class="theorem">

<strong>Theorem 7.6 (Euler's Theorem).</strong> If \(\gcd(a,n) = 1\), then \(a^{\phi(n)} \equiv 1 \pmod{n}\).

</div>

*Proof.* Let \(\{u_1, u_2, \ldots, u_{\phi(n)}\}\) be the units in \(\mathbb{Z}/n\mathbb{Z}\). Since \(\gcd(a,n) = 1\), multiplication by \(a\) permutes the units (same argument as FLT: the products \(au_1, \ldots, au_{\phi(n)}\) are distinct units, hence the same set). Taking the product of both sides:
\[(au_1)(au_2)\cdots(au_{\phi(n)}) \equiv u_1 u_2 \cdots u_{\phi(n)} \pmod{n},\]
so \(a^{\phi(n)} \cdot U \equiv U \pmod{n}\) where \(U = u_1 \cdots u_{\phi(n)}\). Since \(U\) is a product of units, \(\gcd(U,n) = 1\), and we cancel to obtain \(a^{\phi(n)} \equiv 1 \pmod{n}\). \(\square\)

<div class="remark">

Group-theoretically, Euler's Theorem is a special case of Lagrange's Theorem: in any finite group, the order of an element divides the order of the group. Here the group is \((\mathbb{Z}/n\mathbb{Z})^*\) of order \(\phi(n)\), so \(a^{\phi(n)} = e\) for any unit \(a\).

</div>

## Wilson's Theorem

Wilson's Theorem gives an elegant necessary and sufficient condition for primality in terms of factorials. Unlike Fermat's test, it is an *exact* characterization — but it is computationally expensive, making it a theoretical rather than practical primality test.

<div class="theorem">

<strong>Theorem 7.7 (Wilson's Theorem).</strong> An integer \(p > 1\) is prime if and only if
\[(p-1)! \equiv -1 \pmod{p}.\]

</div>

*Proof.* **(\(\Leftarrow\))** If \(p\) is composite, say \(p = ab\) with \(1 < a < p\), then \(a \mid (p-1)!\) but \(a \nmid (-1)\) since \(a > 1\). So \((p-1)! \not\equiv -1 \pmod{p}\) when \(p\) is composite (the only edge case is \(p = 4\): \(3! = 6 \equiv 2 \not\equiv -1 \pmod{4}\)).

**(\(\Rightarrow\))** Let \(p\) be prime. In \(\mathbb{Z}/p\mathbb{Z}\), every nonzero element has a unique inverse. The equation \(x^2 \equiv 1 \pmod{p}\) means \(p \mid (x-1)(x+1)\), so \(x \equiv \pm 1 \pmod{p}\). Hence the only elements equal to their own inverse are \(1\) and \(p-1 \equiv -1\).

Pair each element \(a \in \{2, 3, \ldots, p-2\}\) with its distinct inverse \(a^{-1} \neq a\). These \(p-3\) elements pair up into \((p-3)/2\) pairs, each with product \(1\). Therefore
\[(p-1)! = 1 \cdot \underbrace{(2 \cdot 3 \cdots (p-2))}_{\text{pairs multiply to } 1} \cdot (p-1) \equiv 1 \cdot 1 \cdot (-1) = -1 \pmod{p}.\] \(\square\)

<div class="remark">

Notice the proof structure: we exploit the self-pairing of inverses. The elements \(1\) and \(-1\) are their own inverses; all other elements pair off. This pairing argument reappears in many places: in the proof of quadratic reciprocity, in the structure theory of abelian groups.

</div>

## Primitive Roots

The group \((\mathbb{Z}/n\mathbb{Z})^*\) is a finite abelian group. A natural question is whether it is *cyclic* — generated by a single element. When \(n = p\) is prime, the answer is always yes.

<div class="definition">

<strong>Definition 7.8 (Order of an Element).</strong> The <em>order</em> of \(a\) modulo \(n\), written \(\text{ord}_n(a)\), is the smallest positive integer \(k\) such that \(a^k \equiv 1 \pmod{n}\).

</div>

<div class="proposition">

<strong>Proposition 7.9 (Order Divides Euler's Totient).</strong> If \(\gcd(a,n) = 1\), then \(\text{ord}_n(a) \mid \phi(n)\). More generally, \(a^m \equiv 1 \pmod{n}\) if and only if \(\text{ord}_n(a) \mid m\).

</div>

*Proof.* Let \(k = \text{ord}_n(a)\) and write \(\phi(n) = qk + r\) with \(0 \leq r < k\). Then \(a^{\phi(n)} = (a^k)^q \cdot a^r \equiv a^r \equiv 1 \pmod{n}\). If \(r > 0\), then \(r < k\) and \(a^r \equiv 1\), contradicting the minimality of \(k\). So \(r = 0\). The general statement follows similarly. \(\square\)

<div class="definition">

<strong>Definition 7.10 (Primitive Root).</strong> A <em>primitive root modulo \(n\)</em> is an element \(g\) with \(\text{ord}_n(g) = \phi(n)\). Equivalently, the powers \(g^0, g^1, \ldots, g^{\phi(n)-1}\) are all distinct modulo \(n\), so \(g\) generates the entire group \((\mathbb{Z}/n\mathbb{Z})^*\).

</div>

<div class="theorem">

<strong>Theorem 7.11 (Existence of Primitive Roots mod \(p\)).</strong> For every prime \(p\), there exists a primitive root modulo \(p\). In other words, \((\mathbb{Z}/p\mathbb{Z})^*\) is cyclic of order \(p-1\).

</div>

*Proof (sketch).* The key lemma is that for a prime \(p\), the polynomial \(x^d - 1 \equiv 0 \pmod{p}\) has at most \(d\) roots in \(\mathbb{Z}/p\mathbb{Z}\) (since \(\mathbb{Z}/p\mathbb{Z}\) is a field). Let \(\psi(d)\) denote the number of elements of order exactly \(d\) in \((\mathbb{Z}/p\mathbb{Z})^*\). For each divisor \(d\) of \(p-1\), if any element has order \(d\), then its powers \(1, a, a^2, \ldots, a^{d-1}\) are all \(d\) roots of \(x^d \equiv 1\), and each has order dividing \(d\). One shows by an Euler-\(\phi\) counting argument that \(\psi(d) = \phi(d)\) for each divisor \(d\) of \(p-1\), so in particular \(\psi(p-1) = \phi(p-1) \geq 1\). \(\square\)

<div class="remark">

Once we know a primitive root \(g\) exists, every element of \((\mathbb{Z}/p\mathbb{Z})^<em>\) can be written as \(g^k\) for a unique \(k \in \{0, 1, \ldots, p-2\}\). This integer \(k\) is called the </em>discrete logarithm* of \(a\) to base \(g\). The difficulty of computing discrete logarithms — given \(g^k\), find \(k\) — is the basis of the Diffie-Hellman key exchange and the ElGamal cryptosystem.

</div>

## Quadratic Residues and Euler's Criterion

<div class="definition">

<strong>Definition 7.12 (Quadratic Residue).</strong> An integer \(a\) with \(\gcd(a,p) = 1\) is a <em>quadratic residue modulo \(p\)</em> (QR) if the congruence \(x^2 \equiv a \pmod{p}\) has a solution; otherwise it is a <em>quadratic non-residue</em> (QNR).

</div>

<div class="proposition">

<strong>Proposition 7.13 (Half are Residues).</strong> For an odd prime \(p\), there are exactly \((p-1)/2\) quadratic residues and \((p-1)/2\) quadratic non-residues modulo \(p\) among \(\{1, 2, \ldots, p-1\}\).

</div>

*Proof.* The map \(a \mapsto a^2\) on \(\{1, \ldots, p-1\}\) is two-to-one: \(a^2 \equiv (-a)^2 \pmod p\), and since \(a \not\equiv -a\) (as \(p\) is odd), each square has exactly two preimages. So there are \((p-1)/2\) distinct squares. \(\square\)

<div class="theorem">

<strong>Theorem 7.14 (Euler's Criterion).</strong> Let \(p\) be an odd prime and \(\gcd(a,p) = 1\). Then
\[a^{(p-1)/2} \equiv \begin{cases} 1 \pmod{p} & \text{if } a \text{ is a QR mod } p, \\ -1 \pmod{p} & \text{if } a \text{ is a QNR mod } p. \end{cases}\]

</div>

*Proof.* By FLT, \(a^{p-1} \equiv 1\), so \((a^{(p-1)/2})^2 \equiv 1\), meaning \(a^{(p-1)/2} \equiv \pm 1\). If \(a = b^2\) is a QR, then \(a^{(p-1)/2} = b^{p-1} \equiv 1\). If \(a\) is a QNR, then \(a^{(p-1)/2} \not\equiv 1\) (since the only solutions to \(x^{(p-1)/2} \equiv 1\) are the \((p-1)/2\) QRs), so \(a^{(p-1)/2} \equiv -1\). \(\square\)

<div class="definition">

<strong>Definition 7.15 (Legendre Symbol).</strong> For an odd prime \(p\) and \(\gcd(a,p) = 1\), the <em>Legendre symbol</em> is
\[\left(\frac{a}{p}\right) = \begin{cases} 1 & \text{if } a \text{ is a QR mod } p, \\ -1 & \text{if } a \text{ is a QNR mod } p. \end{cases}\]

</div>

<div class="proposition">

<strong>Proposition 7.16 (Multiplicativity of Legendre Symbol).</strong>
\[\left(\frac{ab}{p}\right) = \left(\frac{a}{p}\right)\left(\frac{b}{p}\right).\]

</div>

*Proof.* By Euler's criterion, both sides equal \((ab)^{(p-1)/2} = a^{(p-1)/2} \cdot b^{(p-1)/2} \pmod p\). \(\square\)

---

# Chapter 8: Cryptography and RSA

The classical problem of secure communication is: how can two parties exchange a secret over an insecure channel, without having first shared a key? For most of human history this seemed impossible. In 1976, Diffie and Hellman introduced the concept of public-key cryptography; in 1977, Rivest, Shamir, and Adleman discovered RSA, the first practical implementation. Its correctness is an elegant application of Euler's Theorem and the Chinese Remainder Theorem.

## Public-Key Cryptography

The idea is asymmetric: a *public key* is shared openly and used to encrypt; a *private key* is kept secret and used to decrypt. Anyone can send a message to Bob by encrypting with his public key, but only Bob can read it. The security rests on a *trapdoor function*: one that is easy to compute but hard to invert without secret information.

## The RSA Algorithm

<div class="definition">

<strong>Definition 8.1 (RSA Setup).</strong>
<ol>
<li>Choose distinct large primes \(p\) and \(q\). Set \(n = pq\).</li>
<li>Compute \(\phi(n) = (p-1)(q-1)\).</li>
<li>Choose an encryption exponent \(e\) with \(1 < e < \phi(n)\) and \(\gcd(e, \phi(n)) = 1\).</li>
<li>Compute the decryption exponent \(d\) satisfying \(ed \equiv 1 \pmod{\phi(n)}\), using the EEA.</li>
<li><em>Public key:</em> \((e, n)\). <em>Private key:</em> \((d, n)\).</li>
</ol>
To encrypt a message \(M\) with \(0 \leq M < n\), compute \(C \equiv M^e \pmod{n}\). To decrypt, compute \(M \equiv C^d \pmod{n}\).

</div>

<div class="theorem">

<strong>Theorem 8.2 (RSA Correctness).</strong> With setup as in Definition 8.1, decryption recovers the plaintext: \(C^d \equiv M \pmod{n}\).

</div>

*Proof.* We must show \(M^{ed} \equiv M \pmod{n}\). Since \(ed \equiv 1 \pmod{(p-1)(q-1)}\), write \(ed = 1 + k(p-1)(q-1)\) for some integer \(k\).

**Case 1: \(\gcd(M, p) = 1\).** By FLT, \(M^{p-1} \equiv 1 \pmod{p}\), so
\[M^{ed} = M^{1 + k(p-1)(q-1)} = M \cdot (M^{p-1})^{k(q-1)} \equiv M \cdot 1 = M \pmod{p}.\]

**Case 2: \(p \mid M\).** Then \(M^{ed} \equiv 0 \equiv M \pmod{p}\).

In both cases, \(M^{ed} \equiv M \pmod{p}\). By the same argument with \(p\) and \(q\) swapped, \(M^{ed} \equiv M \pmod{q}\). Since \(\gcd(p,q) = 1\) and both divide \(M^{ed} - M\), we have \(pq \mid M^{ed} - M\), i.e., \(M^{ed} \equiv M \pmod{n}\). \(\square\)

<div class="remark">

Notice that the proof uses FLT for prime moduli and then combines with CRT (implicitly: if \(p \mid x\) and \(q \mid x\) and \(\gcd(p,q) = 1\), then \(pq \mid x\)). The security of RSA rests on the hardness of <em>integer factorization</em>: given \(n = pq\), finding \(p\) and \(q\) is believed to be computationally intractable for large \(n\) (say, \(n\) has 2048 bits). Without knowing \(p\) and \(q\), one cannot compute \(\phi(n)\), and without \(\phi(n)\), one cannot compute \(d\).

</div>

<div class="example">

<strong>Example 8.3.</strong> Let \(p = 7\), \(q = 11\), \(n = 77\), \(\phi(n) = 60\). Choose \(e = 13\) (since \(\gcd(13,60) = 1\)). Find \(d\): solve \(13d \equiv 1 \pmod{60}\). By EEA: \(60 = 4 \cdot 13 + 8\), \(13 = 1 \cdot 8 + 5\), \(8 = 1 \cdot 5 + 3\), \(5 = 1 \cdot 3 + 2\), \(3 = 1 \cdot 2 + 1\). Back-substituting gives \(d = 37\). (Check: \(13 \cdot 37 = 481 = 8 \cdot 60 + 1\). ✓)

Encrypt \(M = 5\): \(C \equiv 5^{13} \pmod{77}\). Compute \(5^2 = 25\), \(5^4 = 625 \equiv 9\), \(5^8 \equiv 81 \equiv 4\), \(5^{13} = 5^8 \cdot 5^4 \cdot 5 \equiv 4 \cdot 9 \cdot 5 = 180 \equiv 26 \pmod{77}\). So \(C = 26\).

Decrypt: \(26^{37} \pmod{77}\). One can verify this returns \(5\) using repeated squaring.

</div>

---

# Appendix: Key Theorems Reference

For convenience, the major theorems of the course and their interdependencies:

- **Division Algorithm** (Theorem 3.5) — existence and uniqueness of quotient and remainder; proved using WOP.
- **GCD WR** (Proposition 3.7) — the key invariant behind the Euclidean Algorithm.
- **Bézout's Identity** (Theorem 3.9) — GCD as smallest positive integer combination; proved using WOP.
- **CAD** (Proposition 3.12) — coprimeness and divisibility; follows from Bézout.
- **Euclid's Lemma** (Lemma 4.2) — \(p \mid ab \Rightarrow p \mid a\) or \(p \mid b\); follows from CAD.
- **FTA** (Theorem 4.5) — unique prime factorization; existence by POSI, uniqueness by Euclid's Lemma.
- **LDET 1 & 2** (Theorems 5.2, 5.3) — existence and form of LDE solutions; follow from Bézout and LDET 1 respectively.
- **LCT** (Theorem 6.10) — linear congruences; follows from LDE theory.
- **CRT** (Theorem 6.11) — simultaneous congruences; follows from LCT plus coprimeness.
- **FLT** (Theorem 7.4) — \(a^{p-1} \equiv 1\) mod prime \(p\); proved by permutation argument.
- **Euler's Theorem** (Theorem 7.6) — generalization of FLT to \(\phi(n)\); proved by same permutation argument.
- **Wilson's Theorem** (Theorem 7.7) — \((p-1)! \equiv -1\) iff \(p\) prime; proved by self-pairing of inverses.
- **RSA Correctness** (Theorem 8.2) — \(M^{ed} \equiv M \pmod{n}\); proved from FLT + CRT.
