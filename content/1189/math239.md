---
title: "MATH 239: Introduction to Combinatorics"
subjects: "MATH"
---

# MATH 239 -- Introduction to Combinatorics

These notes cover two major parts: **Enumeration** (formal power series, compositions, binary strings, recurrences) and **Graph Theory** (structure, planarity, matchings). Every numbered definition, theorem, lemma, proposition, and corollary is recorded below.

---

# Part I: Enumeration

## Prologue: Four Problems

Before developing any machinery, it is worth pausing to ask what enumeration is actually for. Peter Nelson opens the very first lecture of MATH 239 with four problems, none of which is trivial, all of which will eventually yield to the tools developed in Part I.

**Problem 1.** In how many ways can six distinct objects be arranged in a row? A moment's thought gives \(6! = 720\), and the reasoning generalises at once: there are \(n!\) arrangements of \(n\) distinct objects.

**Problem 2.** How many binary strings of length 10 contain no subsequence \(101\)? Here the answer is far less obvious. Trying to list such strings directly is tedious; what is needed is a systematic method.

**Problem 3.** In how many ways can one make change for a dollar using standard US coins (pennies, nickels, dimes, quarters, half-dollars)? This question has subtleties even in its formulation — does order matter? — and Nelson notes that different interpretations yield genuinely different answers. A coin-change problem of this type is, in disguise, a problem about partitioning an integer, and will eventually be addressed using generating series.

**Problem 4.** How many five-card hands from a standard 52-card deck constitute a full house (three cards of one denomination and two of another)? This is a finite counting problem whose answer \(\binom{13}{1}\binom{4}{3}\binom{12}{1}\binom{4}{2} = 3744\) can be computed by careful case analysis, but the same ideas recur in far more complex settings.

These four problems share a common character: each asks for the size of a well-defined finite set. The central goal of Part I is to build what Nelson calls an "algebraic machine" — the theory of generating series — capable of attacking all of them and many more. The approach is simultaneously combinatorial and algebraic. Combinatorial thinking identifies the structure of the objects being counted; algebraic manipulation of formal power series turns structural observations into closed-form answers.

---

Part I of the course develops techniques for counting combinatorial objects using generating series (formal power series), with applications to compositions of integers, binary strings, and recurrence relations. The following summarises the key definitions and results from Chapters 1–3.

## Chapter 1: Generating Series and Compositions

### 1.1 Generating Series (Formal Power Series)

A central tool in enumeration is the generating series (also called a formal power series). Rather than counting objects one at a time, we encode an entire sequence of counts into a single algebraic expression.

The idea has an elegant motivation. Suppose we have a collection of objects and we want to know, for each non-negative integer \(n\), how many objects have "size" \(n\) (where size might mean length, weight, number of parts, or any other natural statistic). One approach is to compile a table: \(a_0\) objects of size 0, \(a_1\) of size 1, \(a_2\) of size 2, and so on. The generating series is simply the formal power series \(\sum_{n \ge 0} a_n x^n\), which packages the entire table into one algebraic object. The variable \(x\) is a placeholder; it carries no numerical value, and we never ask whether the series converges. What matters is the sequence of coefficients.

Peter Nelson introduces the generating series through the farm-animal example in Lecture 6: assign to each animal its number of legs as a weight, and form the sum \(\sum_{\text{animals}} x^{\text{legs}}\). Collecting like terms, the coefficient of \(x^4\) counts the four-legged animals. This is the essence of the definition — a generating series is a bookkeeping device that sorts objects by weight and records the counts as coefficients.

<div class="definition">

<strong>Definition (Generating Series).</strong> Let \(S\) be a set of objects with a weight function \(w : S \to \mathbb{Z}_{\ge 0}\). The <em>generating series</em> for \(S\) with respect to \(w\) is
\[
\Phi_S(x) = \sum_{\sigma \in S} x^{w(\sigma)} = \sum_{n \ge 0} a_n x^n,
\]
where \(a_n\) is the number of elements of \(S\) having weight \(n\).

</div>

The coefficient \([x^n]\Phi_S(x)\) counts the objects of weight \(n\). Two generating series are equal if and only if they agree coefficient by coefficient. Generating series are manipulated as formal algebraic objects; convergence is not required.

This last point deserves emphasis. In calculus, a power series is a function defined (where it converges) by substituting a real or complex number for \(x\). In combinatorics, \(x\) is a purely formal symbol. The series \(\frac{1}{1-2x} = 1 + 2x + 4x^2 + 8x^3 + \cdots\) is not a function evaluated at \(x\); it is a formal identity between power series, valid in the ring of formal power series over \(\mathbb{Z}\). This distinction frees us from all analytic concerns about radius of convergence and allows purely algebraic manipulation.

To make this algebraic manipulation precise, we need to define the ring structure on formal power series.

<div class="definition">

<strong>Definition (Formal Power Series Operations).</strong> Given formal power series \(A(x) = \sum a_n x^n\) and \(B(x) = \sum b_n x^n\), their <em>sum</em> and <em>product</em> are defined by
\[
A(x) + B(x) = \sum_{n \ge 0}(a_n + b_n)x^n, \qquad A(x)\cdot B(x) = \sum_{n \ge 0}\left(\sum_{k=0}^{n} a_k b_{n-k}\right)x^n.
\]

</div>

The product formula is the Cauchy convolution: to get the coefficient of \(x^n\) in \(A(x)B(x)\), sum over all ways of splitting \(n = k + (n-k)\) and multiply the corresponding coefficients. This is exactly the same formula used for polynomial multiplication, extended termwise to infinite series.

A calculation that appears constantly in the course is the following: \((1 - x)(1 + x + x^2 + x^3 + \cdots) = 1\), which follows immediately from the product definition since all coefficients of \(x^n\) for \(n \ge 1\) cancel. This shows that the formal series \(1 + x + x^2 + \cdots\) is the multiplicative inverse of \(1 - x\), written \(\frac{1}{1-x}\). The general condition for invertibility is:

<div class="definition">

<strong>Definition (Inverse of a Formal Power Series).</strong> A formal power series \(A(x)\) has a multiplicative inverse if and only if its constant term \(a_0 \neq 0\). In that case there exists a unique formal power series \(B(x)\) such that \(A(x)B(x) = 1\).

</div>

The condition \(a_0 \neq 0\) is necessary and sufficient: one constructs the inverse coefficients recursively from the equation \(A(x)B(x) = 1\), which gives \(b_0 = 1/a_0\), and then \(b_n = -\frac{1}{a_0}\sum_{k=1}^n a_k b_{n-k}\) for \(n \ge 1\). No convergence is needed; this is a pure algebraic construction. The most important instance for our purposes is \(\frac{1}{1 - f(x)}\) whenever \(f(0) = 0\), which is the basis of the geometric series formula and the string lemma introduced in Section 1.5.

### 1.2 Compositions of an Integer

Having set up the formal framework, we turn to the first substantial counting problem: compositions of an integer. This is where the generating-series approach first shows its power over ad hoc methods.

<div class="definition">

<strong>Definition (Composition).</strong> A <em>composition</em> of a non-negative integer \(n\) is an ordered sequence \((c_1, c_2, \ldots, c_k)\) of positive integers such that \(c_1 + c_2 + \cdots + c_k = n\). Each \(c_i\) is called a <em>part</em>.

</div>

Unlike partitions of an integer — where order is irrelevant and \((2,1)\) and \((1,2)\) are the same — compositions are ordered tuples: \((2,1)\) and \((1,2)\) are distinct compositions of 3. The empty tuple \(()\) is the unique composition of 0, with zero parts. A composition of \(n\) with \(k\) parts is equivalently a way of placing \(k-1\) dividers among \(n-1\) gaps in a row of \(n\) unit squares, which gives the classical formula: the number of compositions of \(n\) (for \(n \ge 1\)) is \(2^{n-1}\), since each composition corresponds to choosing which of the \(n-1\) gaps between units receive a divider. The generating series for the number of compositions of \(n\) is
\[
\sum_{n \ge 0} 2^{n-1} x^n = \frac{1}{1-2x} \quad (\text{adjusting for } n=0).
\]

The generating series perspective, however, does far more than recover this formula. As Lecture 8 and 9 show, it handles constrained compositions — those with odd parts, or parts at most 5, or parts in a specified set — with equal ease, simply by replacing the generating series for the set of allowed part sizes and applying the string lemma (Theorem 1.5 below). The power of the method lies precisely in this modularity: changing the constraint changes one building block, and the machinery propagates the change automatically.

### 1.3 Binary Strings and Blocks

Binary strings are another class of objects that the generating-series machine handles elegantly. A binary string is a sequence of symbols, each drawn from the alphabet \(\{0, 1\}\); the length of the string is its number of symbols.

<div class="definition">

<strong>Definition (Binary String).</strong> A <em>binary string</em> is a finite sequence of 0s and 1s. The <em>length</em> of a binary string is the number of characters it contains. The <em>empty string</em> \(\varepsilon\) has length 0.

</div>

Binary strings appear throughout computer science and information theory. In the MATH 239 context they serve as a rich combinatorial laboratory: they are concrete enough to reason about directly, but complex enough to require genuine technique. Counting strings with forbidden patterns, or with prescribed block structures, is not in general easy by elementary methods. By Lecture 10, Nelson introduces a systematic approach based on unambiguous regular expressions, which translate directly into rational generating series.

A key structural notion is the block decomposition of a string: a maximal run of the same symbol.

<div class="definition">

<strong>Definition (Block and Gap).</strong> A <em>block</em> in a binary string is a maximal non-empty substring consisting entirely of the same character. A <em>1-block</em> is a maximal substring of 1s.

</div>

For example, in the string \(110001101\), the blocks are \(11\), \(000\), \(11\), \(0\), \(1\), alternating between 1-blocks and 0-blocks. This block decomposition is fundamental: every non-empty binary string consists of alternating blocks of 0s and 1s, starting with either a 0-block or a 1-block. Identifying a binary string with its sequence of block lengths converts string-counting problems into composition-counting problems, connecting the two threads of Chapter 1.

<svg viewBox="0 0 420 120" xmlns="http://www.w3.org/2000/svg" style="max-width:420px;display:block;margin:1.5em auto">
  <text x="210" y="16" font-size="12" fill="currentColor" text-anchor="middle" font-weight="bold">Binary String Block Decomposition: 1 1 0 0 0 1 1 0 1</text>
  <!-- Character boxes -->
  <!-- 1 1 0 0 0 1 1 0 1 = 9 chars, each box 38px wide starting at x=20 -->
  <!-- Block labels -->
  <!-- Block 1: chars 0-1 (11) -->
  <rect x="20" y="30" width="76" height="36" rx="3" fill="#3b82f6" fill-opacity="0.25" stroke="#3b82f6" stroke-width="1.5"/>
  <text x="32" y="52" font-size="16" fill="#3b82f6" font-weight="bold">1</text>
  <text x="70" y="52" font-size="16" fill="#3b82f6" font-weight="bold">1</text>
  <text x="58" y="22" font-size="9" fill="#3b82f6" text-anchor="middle">1-block(2)</text>
  <!-- Block 2: chars 2-4 (000) -->
  <rect x="96" y="30" width="114" height="36" rx="3" fill="#ef4444" fill-opacity="0.18" stroke="#ef4444" stroke-width="1.5"/>
  <text x="108" y="52" font-size="16" fill="#ef4444" font-weight="bold">0</text>
  <text x="146" y="52" font-size="16" fill="#ef4444" font-weight="bold">0</text>
  <text x="184" y="52" font-size="16" fill="#ef4444" font-weight="bold">0</text>
  <text x="153" y="22" font-size="9" fill="#ef4444" text-anchor="middle">0-block(3)</text>
  <!-- Block 3: chars 5-6 (11) -->
  <rect x="210" y="30" width="76" height="36" rx="3" fill="#3b82f6" fill-opacity="0.25" stroke="#3b82f6" stroke-width="1.5"/>
  <text x="222" y="52" font-size="16" fill="#3b82f6" font-weight="bold">1</text>
  <text x="260" y="52" font-size="16" fill="#3b82f6" font-weight="bold">1</text>
  <text x="248" y="22" font-size="9" fill="#3b82f6" text-anchor="middle">1-block(2)</text>
  <!-- Block 4: char 7 (0) -->
  <rect x="286" y="30" width="38" height="36" rx="3" fill="#ef4444" fill-opacity="0.18" stroke="#ef4444" stroke-width="1.5"/>
  <text x="298" y="52" font-size="16" fill="#ef4444" font-weight="bold">0</text>
  <text x="305" y="22" font-size="9" fill="#ef4444" text-anchor="middle">0(1)</text>
  <!-- Block 5: char 8 (1) -->
  <rect x="324" y="30" width="38" height="36" rx="3" fill="#3b82f6" fill-opacity="0.25" stroke="#3b82f6" stroke-width="1.5"/>
  <text x="336" y="52" font-size="16" fill="#3b82f6" font-weight="bold">1</text>
  <text x="343" y="22" font-size="9" fill="#3b82f6" text-anchor="middle">1(1)</text>
  <!-- Arrows / decomposition legend -->
  <text x="210" y="90" font-size="10" fill="currentColor" text-anchor="middle">Blocks alternate: (1-block, 0-block, …). Block lengths give a composition of the length.</text>
  <text x="210" y="108" font-size="10" fill="currentColor" text-anchor="middle">Length = 2 + 3 + 2 + 1 + 1 = 9</text>
</svg>

<div class="definition">

<strong>Definition (Concatenation).</strong> If \(s\) and \(t\) are binary strings, their <em>concatenation</em> \(st\) is the string formed by appending \(t\) to the end of \(s\).

</div>

Concatenation is the fundamental operation on strings. It is associative but not commutative (in general \(st \neq ts\)), and the empty string \(\varepsilon\) is the identity: \(\varepsilon s = s\varepsilon = s\) for every string \(s\). The Kleene star operation \(S^*\), defined below, is built from concatenation.

We often decompose the set of all binary strings by specifying a "recursive decomposition" that partitions the set into pieces whose generating series can be computed.

### 1.4 The Sum and Product Lemmas

The two most important tools for computing generating series are:

To see why these lemmas are so fundamental, it helps to trace their combinatorial content. Nelson uses a lunch analogy in Lecture 7: if \(S_1\) is a set of main dishes with prices as weights, and \(S_2\) is a set of side dishes with prices as weights, then \(\Phi_{S_1}(x) + \Phi_{S_2}(x)\) counts total lunch-item choices at each price. And \(\Phi_{S_1}(x) \cdot \Phi_{S_2}(x)\) counts the number of (main dish, side dish) combinations at each combined price. The "and" of two independent choices becomes a product of generating series; the "or" of two disjoint choices becomes a sum.

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

The Sum Lemma formalises partition-by-cases: if a set decomposes into disjoint subsets (perhaps by the first character, or the last block, or the number of 1s), the generating series decomposes as a sum. The Product Lemma formalises independent combination: if an object is uniquely described by an ordered pair of sub-objects, with weight equal to the sum of the sub-weights, the generating series factorises as a product. Together, they convert set-level structural observations — which can often be verified just by inspection — into algebraic equations between power series.

There is, however, an important caveat: both lemmas require the decomposition to be unambiguous. If a string can be decomposed into blocks in more than one way, or if an object can be described by more than one ordered pair, the Sum and Product Lemmas cannot be applied. The theory of unambiguous regular expressions, developed in Lectures 11 and 12, is precisely the systematic framework for ensuring that decompositions are unambiguous before applying the lemmas.

### 1.5 Recursive Decompositions and Rational Generating Series

The combination of the Sum and Product Lemmas with the geometric series formula \(\frac{1}{1-r} = \sum_{n \ge 0} r^n\) leads to the Kleene-star construction, which is the engine behind most of the generating series computations in Part I.

If \(S\) is a set with weight function \(w\) having no elements of weight 0, define \(S^0 = \{\varepsilon\}\) (a single empty tuple), \(S^1 = S\), \(S^2 = S \times S\), and so on. The Kleene star is then
\[
S^* = S^0 \cup S^1 \cup S^2 \cup S^3 \cup \cdots,
\]
the set of all finite tuples (strings) of elements of \(S\). The weight of a tuple \((\sigma_1, \ldots, \sigma_t)\) is defined as the sum of the weights of its entries: \(w^*(\sigma_1, \ldots, \sigma_t) = \sum_{i=1}^t w(\sigma_i)\), with the empty tuple having weight 0.

Nelson motivates this in Lecture 8 with two concrete examples. First, when \(S = \{0, 1\}\) with both elements having weight 1, the elements of \(S^*\) are exactly the binary strings (after removing tuple punctuation), and the weight is string length. Second, when \(S\) is the set of positive integers with \(w(n) = n\), the elements of \(S^*\) are exactly the compositions of non-negative integers, and the weight is the sum of parts. The Kleene star thus simultaneously captures both binary strings and compositions as special cases of a single construction.

The generating series for \(S^*\) takes a beautifully compact form:

<div class="theorem">

<strong>Theorem (String/Kleene-Star Lemma).</strong> Let \(S\) be a set with weight function \(w\) such that no element of \(S\) has weight 0. Then the generating series for \(S^<em>\) with respect to \(w^</em>\) is
\[
\Phi_{S^*}(x) = \frac{1}{1 - \Phi_S(x)}.
\]

</div>

The proof is a one-line calculation. Since the sets \(S^0, S^1, S^2, \ldots\) are disjoint and their union is \(S^*\), the Sum Lemma gives \(\Phi_{S^*}(x) = \sum_{t \ge 0} \Phi_{S^t}(x)\). The Product Lemma, applied \(t\) times, gives \(\Phi_{S^t}(x) = [\Phi_S(x)]^t\). Combining, \(\Phi_{S^*}(x) = \sum_{t \ge 0} [\Phi_S(x)]^t = \frac{1}{1 - \Phi_S(x)}\), where the last step uses the geometric series formula with \(r = \Phi_S(x)\), which is valid since \(\Phi_S(0) = 0\) (there are no weight-0 elements).

The condition that \(S\) has no weight-0 elements is essential. If \(S\) contained an element of weight 0, then \(S^*\) would contain infinitely many tuples of weight 0 (one for each number of copies of that element), and the weight function would not be a valid weight function for a generating series.

A typical application: the set \(\{0,1\}^*\) of all binary strings, weighted by length, has generating series
\[
\Phi(x) = \frac{1}{1-2x},
\]
since there are \(2^n\) binary strings of length \(n\). More generally, decomposing a set of strings by their structure (first character, last block, etc.) yields a system of equations whose solution is a rational function of \(x\).

The String Lemma applied to compositions is equally clean. The set \(C\) of all compositions is \((\mathbb{Z}_{>0})^*\), the Kleene star of the positive integers. With weight function \(w(n) = n\), the generating series for a single positive integer part is \(\Phi_{\mathbb{Z}_{>0}}(x) = x + x^2 + x^3 + \cdots = \frac{x}{1-x}\). The String Lemma then gives
\[
\Phi_C(x) = \frac{1}{1 - \frac{x}{1-x}} = \frac{1-x}{1-2x},
\]
and extracting the coefficient of \(x^n\) for \(n \ge 1\) recovers the classical formula \(2^{n-1}\) compositions of \(n\).

For constrained compositions — say, compositions with only odd parts — one simply replaces \(\mathbb{Z}_{>0}\) by the set of odd positive integers \(T = \{1, 3, 5, \ldots\}\), whose generating series is \(\Phi_T(x) = x + x^3 + x^5 + \cdots = \frac{x}{1-x^2}\). The String Lemma immediately gives
\[
\Phi_{T^*}(x) = \frac{1}{1 - \frac{x}{1-x^2}} = \frac{1-x^2}{1-x^2-x}.
\]
The coefficient of \(x^n\) in this rational function gives the number of compositions of \(n\) with all odd parts. Computing this coefficient requires the partial-fraction techniques of Chapter 2.

<div class="definition">

<strong>Definition (Rational Generating Series).</strong> A generating series is <em>rational</em> if it can be written in the form \(\frac{p(x)}{q(x)}\) where \(p(x)\) and \(q(x)\) are polynomials with \(q(0) \neq 0\).

</div>

Rational generating series are the central objects of study in Part I. The String Lemma shows that whenever a set can be described as the Kleene star of a finite set (or more generally as a regular expression with polynomial generating series), the resulting generating series is rational. The theory of coefficients of rational functions — partial fractions, characteristic polynomials, closed-form extraction — is developed in Chapter 2.

### 1.6 Recursive Decompositions of Binary Strings

The String Lemma handles sets that are Kleene stars of simpler sets. But many interesting sets of binary strings — such as strings avoiding the pattern 101, or strings whose runs of 0s all have length divisible by 3 — are not straightforwardly Kleene stars. For these, one uses unambiguous regular expressions (Lecture 12) or recursive decompositions (Lecture 13).

A recursive decomposition describes a set of strings \(S\) in terms of itself: typically, it says that a string in \(S\) is either a small base string or is built by concatenating a smaller string in \(S\) with some fixed pieces. Such a description leads to an equation satisfied by \(\Phi_S(x)\), which can then be solved for \(\Phi_S(x)\) as a rational function.

Nelson's Lecture 13 illustrates this with the decomposition \(S = \{\varepsilon\} \cup (S \cdot \{0\}) \cup (S \cdot \{1\})\). Translating to generating series: if \(F(x) = \Phi_S(x)\), then
\[
F(x) = 1 + F(x) \cdot x + F(x) \cdot x = 1 + 2x \cdot F(x),
\]
which gives \(F(x) = \frac{1}{1-2x}\) — the generating series for all binary strings, consistent with \(S = \{0,1\}^*\). The power of recursive decompositions is that they can describe sets for which no simple Kleene-star expression exists, by encoding the recursive structure of the objects directly in the equation for \(F(x)\).

The formal notion of unambiguity is critical here: the recursive decomposition must produce each string in exactly one way, or else the equation for \(F(x)\) does not correctly reflect the count. When the decomposition is unambiguous, the equation for \(F(x)\) is exact, and solving it yields the correct generating series.

## Chapter 2: Coefficients of Rational Functions

### 2.1 Partial Fractions

The generating series produced by the methods of Chapter 1 are typically rational functions of \(x\). To complete a counting problem, one must extract explicit formulas for their coefficients. The main tool for this is partial fraction decomposition.

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

This identity — which is the content of the negative binomial theorem (Theorem 3.1 below) — reduces coefficient extraction from any rational function to a sum of terms of the form \(\binom{n+j-1}{j-1}r_i^n\). The dominant term for large \(n\) is controlled by the root \(r_i\) of largest absolute value, and when \(m_i = 1\) for all \(i\) (all roots are simple), the formula simplifies to a linear combination of pure exponentials: \([x^n]\frac{p(x)}{q(x)} = \sum_i A_i r_i^n\).

It is worth noting how the denominator is written: the convention \((1-r_i x)\) rather than \((x - r_i)\) is deliberately chosen so that the roots \(r_i\) appear as coefficients of \(x^1\), and the expansion \(\frac{1}{1-r_i x} = \sum_{n \ge 0} r_i^n x^n\) is immediate from the geometric series formula. The Factor Theorem for polynomials (Theorem 3.3) justifies the factorisation of \(q(x)\) over any algebraically closed field; in practice the roots \(r_i\) may be complex even when the original problem has integer coefficients.

The procedure for a given rational generating series \(\frac{p(x)}{q(x)}\) is thus: factor \(q(x)\) (or equivalently, find the roots of \(q\)); write the partial fraction decomposition; determine the constants \(A_{i,j}\) by matching coefficients or using the residue formula; and assemble the final formula for \([x^n]\frac{p(x)}{q(x)}\) using the binomial coefficient identity above.

### 2.2 Solutions to Recurrence Relations

Many counting problems lead to linear recurrence relations. The connection to generating series is that if a sequence \((a_n)\) satisfies a linear recurrence with constant coefficients, then its generating series is rational.

The relationship between recurrences and rational generating series runs deeper than a mere correspondence: it is a bijection. Given a linear recurrence \(a_n = c_1 a_{n-1} + \cdots + c_d a_{n-d}\) with initial conditions \(a_0, \ldots, a_{d-1}\), multiplying the generating series \(A(x) = \sum a_n x^n\) by the denominator polynomial \(1 - c_1 x - \cdots - c_d x^d\) and using the recurrence shows that the product is a polynomial (determined entirely by the initial conditions). Conversely, given a rational function \(p(x)/q(x)\) with \(q(0) \ne 0\), the sequence of coefficients satisfies a linear recurrence whose characteristic polynomial is related to \(q\). The two viewpoints — recurrence relations and rational generating series — are thus interchangeable.

<div class="theorem">

<strong>Theorem (Recurrences and Rational Series).</strong> Suppose the sequence \((a_n)_{n \ge 0}\) satisfies a linear recurrence
\[
a_n = c_1 a_{n-1} + c_2 a_{n-2} + \cdots + c_d a_{n-d}
\]
for \(n \ge d\), with given initial conditions. Then the generating series \(A(x) = \sum_{n \ge 0} a_n x^n\) is rational, with denominator \(1 - c_1 x - c_2 x^2 - \cdots - c_d x^d\).

</div>

The roots of the characteristic polynomial \(x^d - c_1 x^{d-1} - \cdots - c_d = 0\) determine the closed-form solution via partial fractions.

The Fibonacci sequence is the canonical example. Setting \(a_0 = a_1 = 1\) and \(a_n = a_{n-1} + a_{n-2}\) for \(n \ge 2\), the theorem gives
\[
A(x) = \frac{1}{1 - x - x^2}.
\]
The denominator \(1 - x - x^2\) factors as \((1 - \phi x)(1 - \hat\phi x)\) where \(\phi = \frac{1+\sqrt{5}}{2}\) and \(\hat\phi = \frac{1-\sqrt{5}}{2}\) are the golden ratio and its conjugate. Partial fractions then yield Binet's formula \(a_n = \frac{1}{\sqrt{5}}(\phi^n - \hat\phi^n)\), an exact expression for the \(n\)-th Fibonacci number in terms of irrational numbers that are nonetheless always integers when combined.

The same method applies to any sequence defined by a homogeneous linear recurrence with constant coefficients. The denominator polynomial plays the role of the characteristic polynomial; its roots determine the exponential growth rates of the solution; and partial fractions decompose the general solution into a sum of geometric progressions (or, for repeated roots, of polynomial multiples of geometric progressions). This is the generating-series analogue of the method of undetermined coefficients or the method of characteristic roots taught in differential equations.

## Chapter 3: The Binomial Series, Quicksort, and Mergesort

### 3.1 The Binomial Series

Chapter 3 gathers several important results that connect the generating-series machinery to classical combinatorics. The first is the binomial series, which provides both a fundamental identity for \([x^n](1-x)^{-k}\) and the bridge back to binomial coefficients.

Before stating the theorem, it is useful to recall where binomial coefficients come from. In Lecture 2, Nelson derives the formula \(\binom{n}{k} = \frac{n!}{k!(n-k)!}\) by a double-counting argument: the number of ordered \(k\)-tuples of distinct elements of an \(n\)-element set is \(\frac{n!}{(n-k)!}\) (arranging first, choosing second), and also equals \(\binom{n}{k} \cdot k!\) (choosing the subset and then ordering it). Equating the two expressions and dividing by \(k!\) gives the formula. Pascal's identity \(\binom{n}{k} = \binom{n-1}{k-1} + \binom{n-1}{k}\) follows from a simpler combinatorial argument: fix one element; either it is included in the \(k\)-subset (leaving \(k-1\) choices from \(n-1\) elements) or it is excluded (\(k\) choices from \(n-1\) elements). Pascal's triangle organises these coefficients row by row, with each entry the sum of its two parents above.

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

The negative binomial series \(\frac{1}{(1-x)^k} = \sum_{n \ge 0}\binom{n+k-1}{k-1}x^n\) has a direct combinatorial proof that Nelson presents in Lecture 5. The coefficient \([x^n]\frac{1}{(1-x)^k}\) is the number of \(k\)-tuples of non-negative integers summing to \(n\) — equivalently, the number of multisets of size \(n\) on \(k\) types. This count is \(\binom{n+k-1}{k-1}\) by the stars-and-bars argument: place \(n\) stars and \(k-1\) bars in a row, giving a total of \(n+k-1\) symbols, and choose \(k-1\) positions for the bars.

The positive binomial theorem \((1+x)^k = \sum_{n=0}^k \binom{k}{n}x^n\) is the finite case. Its combinatorial proof is equally direct: the coefficient of \(x^n\) in the product \((1+x)(1+x)\cdots(1+x)\) (\(k\) factors) counts the number of ways to choose \(x\) from exactly \(n\) of the \(k\) factors, which is \(\binom{k}{n}\). Nelson uses induction on \(k\) and Pascal's identity to give a rigorous formal-power-series proof.

Together, these two formulas supply the coefficient-extraction identity
\[
[x^n]\frac{1}{(1-rx)^j} = \binom{n+j-1}{j-1}r^n
\]
used in Section 2.1, by substituting \(rx\) for \(x\) in the negative binomial expansion.

### 3.2 Average Number of Occurrences

The generating-series framework extends naturally to tracking multiple statistics simultaneously. By introducing a second variable to mark occurrences of a pattern or structure, one obtains a bivariate generating series from which one can extract both the count of objects and statistical information about them.

The central technique is to differentiate the bivariate series with respect to the marking variable and evaluate at 1. If \(\Phi_S(x, y) = \sum_{\sigma \in S} x^{w(\sigma)} y^{\chi(\sigma)}\), then
\[
\frac{\partial}{\partial y}\Phi_S(x, y)\Big|_{y=1} = \sum_{\sigma \in S} \chi(\sigma) x^{w(\sigma)},
\]
so the coefficient of \(x^n\) in this derivative is \(\sum_{w(\sigma)=n} \chi(\sigma)\), the total value of the statistic \(\chi\) over all weight-\(n\) objects. Dividing by \([x^n]\Phi_S(x,1)\) — the number of weight-\(n\) objects — gives the average value of \(\chi\) among weight-\(n\) objects.

<div class="definition">

<strong>Definition (Bivariate Generating Series).</strong> Let \(S\) be a set with a weight function \(w\) and a statistic \(\chi\). The <em>bivariate generating series</em> is
\[
\Phi_S(x,y) = \sum_{\sigma \in S} x^{w(\sigma)} y^{\chi(\sigma)}.
\]

</div>

The average value of \(\chi\) among objects of weight \(n\) can be extracted by differentiating \(\Phi_S(x,y)\) with respect to \(y\) and evaluating at \(y=1\).

A natural statistic on binary strings is the number of occurrences of a fixed pattern, such as the block \(11\). The bivariate generating series that marks each occurrence of \(11\) with a factor of \(y\) allows one to compute the average number of occurrences of \(11\) in a random string of length \(n\). Such questions are relevant to information theory (how often does a given pattern appear in random data?) and to the analysis of algorithms (how often does a given comparison occur in sorting a random input?).

The application to sorting algorithms — particularly Quicksort and Mergesort — is the other main content of Chapter 3 in the course notes. The average-case analysis of these algorithms leads to recurrences whose generating series can be expressed (after suitable manipulation) in terms of harmonic numbers and logarithms, illustrating that the generating-series method extends beyond purely rational functions when the recurrences are no longer linear with constant coefficients.

### 3.3 The Factor Theorem

The Factor Theorem for polynomials is a classical algebraic result, included here because it underpins the partial-fraction decomposition of Section 2.1. Specifically, one must be able to factor the denominator polynomial of a rational generating series before applying partial fractions; the Factor Theorem guarantees that roots correspond to linear factors.

<div class="theorem">

<strong>Theorem (Factor Theorem for Formal Power Series).</strong> If \(f(x)\) is a polynomial and \(f(r) = 0\), then \((x - r)\) divides \(f(x)\).

</div>

This is used in the partial fraction method to factor denominators and find closed forms for coefficients of rational generating series.

The proof is the familiar one from algebra: write \(f(x) = \sum_{k=0}^d a_k x^k\) and note that \(f(x) - f(r) = \sum_{k=0}^d a_k (x^k - r^k)\). Since \((x-r)\) divides \(x^k - r^k\) for each \(k \ge 1\) (by the factorisation \(x^k - r^k = (x-r)(x^{k-1} + rx^{k-2} + \cdots + r^{k-1})\)), the entire sum is divisible by \((x-r)\). Since \(f(r) = 0\), we have \(f(x) = f(x) - f(r)\), which is divisible by \((x-r)\).

In the context of generating series, the Factor Theorem is applied to the denominator polynomial \(q(x)\) of a rational series \(\frac{p(x)}{q(x)}\). Written in the variable \(x\), the roots of \(q\) are the values \(\alpha\) with \(q(\alpha) = 0\); each such root contributes a factor \((x - \alpha)\), or equivalently \((-\alpha)(1 - x/\alpha)\), to the factorisation. In the partial-fraction convention used in Section 2.1, one writes the denominator as a product of factors \((1 - r_i x)\) where \(r_i = 1/\alpha_i\), trading roots of \(q(x)\) for reciprocal roots of the reversed polynomial.

---

This completes Part I. The three chapters have developed a coherent algebraic framework for enumeration: generating series encode counting problems; the Sum, Product, and String Lemmas convert structural descriptions of combinatorial objects into algebraic equations; rational generating series arise naturally and their coefficients are computed by partial fractions; and the binomial series connects the whole apparatus to classical combinatorial identities. Part II turns to graph theory, a subject with its own distinct toolkit, but the spirit — finding the right structure and encoding it mathematically — remains the same.

---

# Part II: Introduction to Graph Theory

## Chapter 4: Introduction to Graph Theory

### 4.1 Definitions

Graph theory studies mathematical objects called "graphs" — a word to which graph theorists have given a rather special meaning. We begin with the foundational definitions.

The word "graph" here has nothing to do with the graphs of functions you encountered in calculus. Rather, a graph in the combinatorial sense is an abstract structure capturing the idea of *connections*: we have a collection of objects (the vertices) and a specification of which pairs of objects are connected to each other (the edges). The data is purely combinatorial: what matters is not where the vertices sit in space, but simply *which* pairs are joined.

This abstraction turns out to be extraordinarily powerful. Consider a few examples of problems that graph theory models naturally:

- **Computer networks.** The computers and servers form the vertices; cables or wireless links form the edges. Whether data can travel from one machine to another is a question about connectivity in the graph.
- **Road networks.** Cities are vertices, roads are edges. Finding the shortest route between two cities becomes finding a shortest path.
- **Social networks.** People are vertices; two people are joined by an edge if they know each other. Questions about how rumours spread, or about degrees of separation, become graph-theoretic questions.
- **Scheduling and colouring.** If courses must be scheduled so that no student has two exams at the same time, one builds a graph where courses are vertices and two courses are adjacent if they share a student; the problem becomes one of *graph colouring*.
- **Chemistry.** Molecules can be represented as graphs in which atoms are vertices and chemical bonds are edges. In particular, the hydrocarbons known as alkanes have the structure of trees.

In each case the power of the abstraction is the same: we strip away the particulars of the application, retain only the combinatorial skeleton, and then prove general theorems that apply to all instances at once.

<div class="definition">

<strong>Definition 4.1.1 (Graph).</strong> A <em>graph</em> \(G\) is a finite nonempty set \(V(G)\) of objects, called <em>vertices</em>, together with a set \(E(G)\) of unordered pairs of distinct vertices. The elements of \(E(G)\) are called <em>edges</em>.

</div>

It is worth pausing on the two words "finite" and "distinct." Finiteness keeps us in the realm of combinatorics rather than infinite combinatorics. The requirement that edges join *distinct* vertices rules out **loops** — an edge from a vertex to itself — and the word "pair" (not "multiset") rules out **multiple edges** between the same pair of vertices. A graph satisfying these restrictions is sometimes called a *simple graph* to emphasize the contrast. If we wish to allow loops and/or multiple edges, we use the term **multigraph**. For this course, "graph" always means "simple graph" unless otherwise stated.

If \(e = \{u,v\}\) then we say \(u\) and \(v\) are **adjacent** vertices, and that edge \(e\) is **incident** with vertices \(u\) and \(v\). Vertices adjacent to \(u\) are called **neighbours** of \(u\), and the set of neighbours is denoted \(N(u)\). A geometric representation or **drawing** of a graph places a small circle for each vertex and a line for each edge. A graph representable with no edges crossing is said to be **planar**.

Notice that two drawings of the same graph can look completely different. Consider the graph \(G\) with \(V(G) = \{a, b, c, d\}\) and \(E(G) = \{\{a,b\},\{b,c\},\{b,d\}\)\): we might draw \(b\) in the centre with three spokes going out, or we might arrange all four vertices in a row. Both drawings represent exactly the same abstract object. As the lectures emphasise, "it is the structure of the graph that matters — namely, what are the vertices and which vertices are paired in the edges. A graph is an abstract structure of sets; a specific drawing is not the graph itself, but merely represents it."

Some important consequences of the definition: edges are *unordered* pairs, so \(\{u,v\} = \{v,u\}\); changing to ordered pairs would give a **directed graph** or **digraph**. No multiple edges are allowed, and no loops are allowed.

### 4.2 Isomorphism

Two different drawings of the same graph are obviously "the same graph." But what about two graphs that are defined with different vertex-labels yet have exactly the same connection pattern? We want a precise way to say that two graphs have "the same shape."

Imagine taking the vertices of one graph and relabelling them, then checking whether the edge structure matches. If such a relabelling exists that perfectly preserves the adjacency structure, the two graphs are called *isomorphic* — from the Greek for "same shape." The formal definition makes this precise.

<div class="definition">

<strong>Definition 4.2.1 (Isomorphism).</strong> Two graphs \(G_1\) and \(G_2\) are <em>isomorphic</em> if there exists a bijection \(f : V(G_1) \to V(G_2)\) such that vertices \(f(u)\) and \(f(v)\) are adjacent in \(G_2\) if and only if \(u\) and \(v\) are adjacent in \(G_1\). Such a bijection \(f\) is called an <em>isomorphism</em>.

</div>

The key idea is that an isomorphism must be a bijection — so it pairs up vertices one-to-one — and it must preserve adjacency in *both* directions: edges correspond to edges, and non-edges correspond to non-edges.

To see a concrete example, consider two graphs on four vertices. Let \(G_1\) have \(V(G_1) = \{a,b,c,d\}\) and edges \(\{a,b\},\{b,c\},\{c,d\},\{d,a\}\) — a 4-cycle drawn as a square. Let \(G_2\) have \(V(G_2) = \{1,2,3,4\}\) and edges \(\{1,3\},\{3,2\},\{2,4\},\{4,1\}\) — the same 4-cycle, but drawn as a "bowtie" shape that looks quite different. The map \(f(a)=1,\, f(b)=3,\, f(c)=2,\, f(d)=4\) is easily verified to be an isomorphism: every edge of \(G_1\) maps to an edge of \(G_2\) and vice versa. So these two graphs are "the same" — they are both 4-cycles \(C_4\), regardless of how they happen to be drawn.

As the lectures note: when we introduce graph theory we see that there are many ways to represent the same graph. We want a rigorous notion of "the same structure," and isomorphism provides it. Two graphs are isomorphic when you can drag the vertices of one around to match the other, preserving all the connections.

The collection of graphs isomorphic to \(G\) forms the **isomorphism class** of \(G\). An isomorphism from \(G\) to itself is called an **automorphism** of \(G\). Counting distinct isomorphism classes is itself a rich combinatorial problem: there are exactly 11 isomorphism classes of graphs on 4 vertices.

To *prove* that two graphs are isomorphic, you exhibit the bijection and verify it preserves edges. To *prove* they are not isomorphic, you exhibit an invariant that differs between them — for example, the degree sequence (the multiset of vertex degrees), the number of triangles, or the girth. Isomorphism-invariants allow us to rule out isomorphism without searching through all possible bijections.

### 4.3 Degree

The **degree** of a vertex \(v\) in a graph \(G\) is the number of edges incident with \(v\), denoted \(\deg(v)\). Equivalently, \(\deg(v) = |N(v)|\), the size of the neighbourhood of \(v\). The degree is one of the most fundamental numerical attributes of a vertex.

One of the first theorems in the subject is the Handshaking Lemma, whose name comes from the following vivid interpretation. Imagine a party at which certain pairs of people shake hands. Model this as a graph: people are vertices, handshakes are edges. The degree of each person is the number of handshakes they participate in. Now, if we sum up the handshake counts over all people, each handshake gets counted twice — once from each participant's perspective. So the total is exactly twice the number of handshakes that occurred. This is the content of the Handshaking Lemma.

<div class="theorem">

<strong>Theorem 4.3.1 (Handshaking Lemma / Degree-Sum Formula).</strong> For any graph \(G\),
\[
\sum_{v \in V(G)} \deg(v) = 2|E(G)|.
\]

</div>

The proof is a double-counting argument. Each edge \(\{u,v\}\) contributes exactly 1 to \(\deg(u)\) and exactly 1 to \(\deg(v)\). Thus when we sum \(\deg(v)\) over all vertices, each edge is counted exactly twice, giving \(2|E(G)|\). \(\square\)

This simple lemma is used constantly throughout graph theory. In the lectures, the instructor notices it first empirically: adding up vertex degrees for several example graphs always yields an even number, and twice the edge count at that. The lemma then explains why.

An immediate consequence is:

<div class="corollary">

<strong>Corollary 4.3.2.</strong> The number of vertices of odd degree in a graph is even.

</div>

The argument is clean: write the degree-sum as a sum over odd-degree vertices plus a sum over even-degree vertices. The right-hand side \(2|E(G)|\) is even, and the sum over even-degree vertices is also even (each term is even), so the sum over odd-degree vertices must be even. Since each term in that sum is a positive odd integer, there must be an even number of them.

<div class="corollary">

<strong>Corollary 4.3.3.</strong> The average degree of a vertex in the graph \(G\) is \(\frac{2|E(G)|}{|V(G)|}\).

</div>

The average degree formula is useful for quick sanity-checking: if you know the number of vertices and edges, you immediately know the average degree.

Next, we single out the most "edge-rich" graphs: those in which every possible edge is present.

<div class="definition">

<strong>Definition 4.3.4 (Complete Graph).</strong> A <em>complete graph</em> is one in which all pairs of distinct vertices are adjacent. The complete graph with \(p\) vertices is denoted \(K_p\), \(p \ge 1\).

</div>

In \(K_n\) each vertex has degree \(n-1\), so by the Handshaking Lemma the number of edges is \(\frac{n(n-1)}{2} = \binom{n}{2}\). We say \(K_n\) is \((n-1)\)-**regular**, meaning every vertex has the same degree. More generally, a graph in which every vertex has degree \(k\) is called a **\(k\)-regular graph**. The complete graphs are the densest possible: they contain every edge. By contrast, the empty graph (no edges at all) is \(0\)-regular.

An interesting fact noted in the lectures is that \(K_5\) is the smallest complete graph that cannot be drawn in the plane without edge-crossings — no matter how you arrange the five vertices, some pair of edges will cross. This anticipates the theory of planar graphs developed later in the course.

A \(k\)-regular graph on \(n\) vertices has exactly \(\frac{nk}{2}\) edges (by the Handshaking Lemma), so \(nk\) must be even. For example, a 3-regular graph requires an even number of vertices.

### 4.4 Bipartite Graphs

A graph whose vertices can be partitioned into two sets \(A\) and \(B\) so that every edge joins a vertex in \(A\) to a vertex in \(B\) is called a **bipartite graph** with **bipartition** \((A,B)\). The two parts \(A\) and \(B\) are the *sides* of the bipartition. No edge is allowed within \(A\) or within \(B\). Bipartite graphs model many natural situations — for instance, a job-assignment problem in which one side represents workers and the other represents tasks, with an edge meaning "this worker can do this task."

<svg viewBox="0 0 320 200" xmlns="http://www.w3.org/2000/svg" style="max-width:320px;display:block;margin:1.5em auto">
  <defs>
    <marker id="bpArr" markerWidth="0" markerHeight="0" refX="0" refY="0" orient="auto"/>
  </defs>
  <text x="160" y="16" font-size="12" fill="currentColor" text-anchor="middle" font-weight="bold">Bipartite Graph with Perfect Matching</text>
  <!-- Side A label -->
  <text x="70" y="36" font-size="11" fill="#3b82f6" text-anchor="middle" font-weight="bold">A</text>
  <!-- Side B label -->
  <text x="250" y="36" font-size="11" fill="#ef4444" text-anchor="middle" font-weight="bold">B</text>
  <!-- A vertices at x=70, y = 55,95,135,175 -->
  <!-- B vertices at x=250, y = 55,95,135,175 -->
  <!-- All edges (non-matching): thin gray -->
  <line x1="70" y1="55" x2="250" y2="95" stroke="currentColor" stroke-width="1" opacity="0.3"/>
  <line x1="70" y1="55" x2="250" y2="135" stroke="currentColor" stroke-width="1" opacity="0.3"/>
  <line x1="70" y1="95" x2="250" y2="55" stroke="currentColor" stroke-width="1" opacity="0.3"/>
  <line x1="70" y1="95" x2="250" y2="175" stroke="currentColor" stroke-width="1" opacity="0.3"/>
  <line x1="70" y1="135" x2="250" y2="95" stroke="currentColor" stroke-width="1" opacity="0.3"/>
  <line x1="70" y1="175" x2="250" y2="135" stroke="currentColor" stroke-width="1" opacity="0.3"/>
  <!-- Perfect matching edges: thick green -->
  <line x1="70" y1="55" x2="250" y2="55" stroke="#22c55e" stroke-width="2.5"/>
  <line x1="70" y1="95" x2="250" y2="135" stroke="#22c55e" stroke-width="2.5"/>
  <line x1="70" y1="135" x2="250" y2="175" stroke="#22c55e" stroke-width="2.5"/>
  <line x1="70" y1="175" x2="250" y2="95" stroke="#22c55e" stroke-width="2.5"/>
  <!-- A vertices -->
  <circle cx="70" cy="55" r="10" fill="#3b82f6" fill-opacity="0.8"/>
  <circle cx="70" cy="95" r="10" fill="#3b82f6" fill-opacity="0.8"/>
  <circle cx="70" cy="135" r="10" fill="#3b82f6" fill-opacity="0.8"/>
  <circle cx="70" cy="175" r="10" fill="#3b82f6" fill-opacity="0.8"/>
  <text x="70" y="59" font-size="9" fill="white" text-anchor="middle">a₁</text>
  <text x="70" y="99" font-size="9" fill="white" text-anchor="middle">a₂</text>
  <text x="70" y="139" font-size="9" fill="white" text-anchor="middle">a₃</text>
  <text x="70" y="179" font-size="9" fill="white" text-anchor="middle">a₄</text>
  <!-- B vertices -->
  <circle cx="250" cy="55" r="10" fill="#ef4444" fill-opacity="0.8"/>
  <circle cx="250" cy="95" r="10" fill="#ef4444" fill-opacity="0.8"/>
  <circle cx="250" cy="135" r="10" fill="#ef4444" fill-opacity="0.8"/>
  <circle cx="250" cy="175" r="10" fill="#ef4444" fill-opacity="0.8"/>
  <text x="250" y="59" font-size="9" fill="white" text-anchor="middle">b₁</text>
  <text x="250" y="99" font-size="9" fill="white" text-anchor="middle">b₂</text>
  <text x="250" y="139" font-size="9" fill="white" text-anchor="middle">b₃</text>
  <text x="250" y="179" font-size="9" fill="white" text-anchor="middle">b₄</text>
  <text x="160" y="195" font-size="9" fill="#22c55e" text-anchor="middle">Green edges: perfect matching (saturates all vertices)</text>
</svg>

The **complete bipartite graph** \(K_{m,n}\) has all vertices in \(A\) adjacent to all vertices in \(B\), with \(|A|=m\), \(|B|=n\). It has \(mn\) edges. Each vertex in \(A\) has degree \(n\) and each vertex in \(B\) has degree \(m\).

A particularly beautiful family of bipartite graphs is the hypercube family:

<div class="definition">

<strong>Definition 4.4.1 (n-Cube).</strong> For \(n \ge 0\), the <em>\(n\)-cube</em> is the graph whose vertices are the \(\{0,1\}\)-strings of length \(n\), and two strings are adjacent if and only if they differ in exactly one position.

</div>

The \(n\)-cube has \(2^n\) vertices. To see that it is \(n\)-regular: for each binary string \(s\), we obtain a neighbour by flipping any one of the \(n\) bit positions, giving exactly \(n\) neighbours. By the Handshaking Lemma, the number of edges is \(\frac{n \cdot 2^n}{2} = n \cdot 2^{n-1}\).

Why is the \(n\)-cube bipartite? The bipartition is by parity: put all strings with an even number of 1s into one class, and all strings with an odd number of 1s into the other. Flipping a single bit changes the parity of the number of 1s, so every edge goes from one class to the other. One sees this most clearly for small values: the 1-cube is just an edge \(K_2\), the 2-cube is a 4-cycle \(C_4\), and the 3-cube has the familiar cube shape.

The \(n\)-cube has important applications in computer science, coding theory, and parallel computing. The vertices label the possible states of \(n\) binary switches; two states are adjacent if they differ in exactly one switch. Gray codes (sequences that visit each vertex of the \(n\)-cube exactly once, moving along edges) are used in analogue-to-digital conversion.

The \(n\)-cube is always bipartite: partition by parity of the number of 1s.

### 4.5 How to Specify a Graph

Beyond drawing pictures, there are algebraic ways to encode a graph, useful in algorithms and linear algebra.

<div class="definition">

<strong>Definition 4.5.1 (Adjacency Matrix).</strong> The <em>adjacency matrix</em> of a graph \(G\) with vertices \(v_1, \ldots, v_p\) is the \(p \times p\) matrix \(A = [a_{ij}]\) where \(a_{ij} = 1\) if \(v_i\) and \(v_j\) are adjacent, and \(a_{ij} = 0\) otherwise.

</div>

The adjacency matrix is symmetric (since edges are unordered) and has zeros on the diagonal (since there are no loops). The \(i\)-th row sum equals \(\deg(v_i)\). Note that the matrix depends on the chosen labelling of the vertices; two different labellings give matrices related by a permutation similarity \(PAP^{-1}\).

<div class="definition">

<strong>Definition 4.5.2 (Incidence Matrix).</strong> The <em>incidence matrix</em> of a graph \(G\) with vertices \(v_1, \ldots, v_p\) and edges \(e_1, \ldots, e_q\) is the \(p \times q\) matrix \(B = [b_{ij}]\) where \(b_{ij} = 1\) if \(v_i\) is incident with \(e_j\), and \(b_{ij} = 0\) otherwise.

</div>

Each column of \(B\) contains exactly two 1s (one for each endpoint of the edge), so the sum of each column is 2, consistent with the Handshaking Lemma. The product \(BB^t\) satisfies \(BB^t = A + \operatorname{diag}(\deg(v_1), \ldots, \deg(v_p))\) — a fact that connects the two matrix representations.

Graphs can also be specified via **adjacency lists**: for each vertex, store the list of its neighbours. Adjacency lists are the most common representation in algorithms because they allow efficient traversal of the neighbourhood of a vertex.

### 4.6 Paths and Cycles

One of the central themes of graph theory is connectivity: can we get from one vertex to another by following edges? This section introduces the combinatorial structures that formalise this question.

Before we can talk about connectivity, we need to discuss subgraphs — graphs that live inside a given graph.

<div class="definition">

<strong>Definition 4.6.1 (Subgraph).</strong> A <em>subgraph</em> of a graph \(G\) is a graph whose vertex set is a subset \(U\) of \(V(G)\) and whose edge set is a subset of those edges of \(G\) that have both vertices in \(U\).

</div>

A subgraph with \(V(H) = V(G)\) is called a **spanning subgraph** — it uses all the vertices but possibly fewer edges. The notation \(G - e\) denotes the spanning subgraph obtained by removing a single edge \(e\), while \(G + e\) denotes the graph obtained by adding a new edge \(e\) to \(G\).

Think of a graph as a road network. A **walk** is the most general notion of movement along edges: we allow revisiting vertices and edges, just as a driver might loop back through the same intersection.

Formally, a **walk** from \(v_0\) to \(v_n\) is an alternating sequence \(v_0 e_1 v_1 e_2 \cdots v_{n-1} e_n v_n\) where each \(e_i = \{v_{i-1}, v_i\}\) is an edge; its **length** is \(n\), the number of edges used. A walk is **closed** if \(v_0 = v_n\). Since the graph is simple (at most one edge between any pair of vertices), a walk can be recorded just as a sequence of vertices.

A **path** is a walk in which all vertices are distinct. Since no vertex is repeated, no edge is repeated either. Paths are the "efficient" routes through a graph, with no unnecessary backtracking.

<div class="theorem">

<strong>Theorem 4.6.2.</strong> If there is a walk from vertex \(x\) to vertex \(y\) in \(G\), then there is a path from \(x\) to \(y\) in \(G\).

</div>

The proof is intuitive: given a walk from \(x\) to \(y\), if it ever revisits a vertex \(v\) — say, the sequence passes through \(v\) at step \(i\) and again at step \(j > i\) — we can shortcut by deleting the portion of the walk between those two visits. Repeating this shortcut-and-delete procedure yields a walk with no repeated vertices, i.e., a path. More formally, one can induct on the length of the walk.

<div class="corollary">

<strong>Corollary 4.6.3.</strong> Let \(x, y, z\) be vertices of \(G\). If there is a path from \(x\) to \(y\) and a path from \(y\) to \(z\), then there is a path from \(x\) to \(z\).

</div>

This follows by concatenating the two paths to form a walk from \(x\) to \(z\), then applying Theorem 4.6.2 to extract a path. The corollary says, informally, that "reachability" is transitive.

A **cycle** in \(G\) is a subgraph with \(n\) distinct vertices \(v_0, v_1, \ldots, v_{n-1}\) and \(n\) distinct edges \(\{v_0,v_1\},\{v_1,v_2\},\ldots,\{v_{n-1},v_0\}\). A cycle has equal numbers of vertices and edges; its **length** is the number of edges (and vertices). The shortest possible cycle in a simple graph is a 3-cycle (a **triangle**), since two-vertex "cycles" would require a multi-edge. The **girth** of \(G\) is the length of its shortest cycle; if \(G\) has no cycle, its girth is defined to be \(\infty\).

<div class="theorem">

<strong>Theorem 4.6.4.</strong> If every vertex in \(G\) has degree at least 2, then \(G\) contains a cycle.

</div>

The proof uses a longest-path argument. Start at any vertex and walk along edges, always choosing a new vertex. Since every vertex has degree at least 2, whenever we arrive at any vertex \(v\), there is always at least one edge incident with \(v\) that we have not used to arrive there; we can potentially continue the walk. Since the graph is finite, eventually we must arrive at a vertex we have seen before, creating a cycle.

A spanning cycle — a cycle that passes through every vertex exactly once — is called a **Hamilton cycle**. Hamilton cycles are much harder to detect than Eulerian circuits; there is no simple degree-condition characterisation for the existence of a Hamilton cycle.

### 4.7 Equivalence Relations

A relation on a set \(S\) is **reflexive** if every element is related to itself, **symmetric** if \(a \sim b\) implies \(b \sim a\), and **transitive** if \(a \sim b\) and \(b \sim c\) imply \(a \sim c\). A relation that is all three is an **equivalence relation**, and it partitions \(S\) into equivalence classes.

The relation "is joined by a walk to" on the vertices of a graph is an equivalence relation. Reflexivity holds because the trivial walk of length 0 joins each vertex to itself. Symmetry holds because walks can be traversed in reverse. Transitivity holds by Corollary 4.6.3.

The equivalence classes under this relation are the vertex sets of the **components** of the graph. Two vertices are in the same component if and only if there is a path between them.

### 4.8 Connectedness

The concept of connectedness is perhaps the most basic structural property of a graph. A communication network is of little use if some pairs of nodes cannot communicate at all; a road network is deficient if some cities cannot be reached from others.

<div class="definition">

<strong>Definition 4.8.1 (Connected).</strong> A graph \(G\) is <em>connected</em> if, for each two vertices \(x\) and \(y\), there is a path from \(x\) to \(y\).

</div>

Checking connectedness naively requires verifying the existence of a path between every pair of vertices, which is \(\binom{|V(G)|}{2}\) checks. The following theorem cuts this down to \(|V(G)| - 1\) checks:

<div class="theorem">

<strong>Theorem 4.8.2.</strong> Let \(G\) be a graph and let \(v\) be a vertex in \(G\). If for each vertex \(w\) in \(G\) there is a path from \(v\) to \(w\), then \(G\) is connected.

</div>

The proof is brief: given any two vertices \(x\) and \(y\), by assumption there is a path from \(v\) to \(x\) (reversible to give a path from \(x\) to \(v\)) and a path from \(v\) to \(y\). By Corollary 4.6.3, there is a path from \(x\) to \(y\).

As an application, the lectures prove that the \(n\)-cube is connected: fix the all-zeros string \(\mathbf{0}\) and show there is a path from \(\mathbf{0}\) to any string \(s\). The path is constructed greedily: find the positions where \(s\) has a 1, and flip them one at a time. Each flip changes exactly one bit, so each step is a valid edge. This gives a path of length equal to the number of 1s in \(s\).

<div class="definition">

<strong>Definition 4.8.4 (Component).</strong> A <em>component</em> of \(G\) is a subgraph \(C\) of \(G\) such that (a) \(C\) is connected, and (b) no subgraph of \(G\) that properly contains \(C\) is connected.

</div>

Equivalently, a component is a maximal connected subgraph. A connected graph has exactly one component; a disconnected graph has at least two. Notice that no edge of \(G\) can join a vertex inside a component to a vertex outside that component — if such an edge existed, the component could be enlarged, contradicting maximality. This observation leads to the concept of cuts.

Given a subset \(X \subseteq V(G)\), the **cut induced by \(X\)** is the set of edges with exactly one end in \(X\):
\[
\partial(X) = \bigl\{\{u,v\} \in E(G) : u \in X,\, v \notin X\bigr\}.
\]
A cut is an **empty cut** if no edges cross the boundary.

<div class="theorem">

<strong>Theorem 4.8.5.</strong> A graph \(G\) is not connected if and only if there exists a proper nonempty subset \(X\) of \(V(G)\) such that the cut induced by \(X\) is empty.

</div>

This theorem gives a clean algebraic certificate for disconnectedness: to prove a graph is disconnected, exhibit such a set \(X\). To prove it is connected, argue that every proper nonempty \(X\) has a non-empty cut. This "cut" perspective on connectivity recurs throughout the theory.

### 4.9 Eulerian Circuits

One of the oldest problems in graph theory has a vivid historical origin. In the early eighteenth century, the Prussian city of Königsberg (now Kaliningrad, Russia) was built on both banks of the Pregel River and on two river islands. Seven bridges connected the various land masses. The residents of Königsberg amused themselves with the following puzzle: **can one take a walk through the city, crossing each of the seven bridges exactly once and returning to the starting point?**

In 1736, the Swiss mathematician Leonhard Euler published a paper resolving this puzzle — not by trying harder, but by proving that such a walk is *impossible*. This paper is widely regarded as the birth of graph theory.

Euler's approach was to model the problem as a graph: the four land masses (two riverbanks and two islands) become vertices, and the seven bridges become edges. Note that this graph has multiple edges between some pairs of vertices (two of the bridges connect the same pair of land masses), so it is a multigraph. However, as noted in the lectures, we can subdivide any multiple edge by inserting an additional vertex, converting the multigraph into a simple graph without changing the problem.

The puzzle then becomes: does this graph have a closed walk that uses every edge exactly once? This is the concept of an **Eulerian circuit**.

<div class="definition">

<strong>Definition 4.9.1 (Eulerian Circuit).</strong> An <em>Eulerian circuit</em> of a graph \(G\) is a closed walk that contains every edge of \(G\) exactly once.

</div>

Euler's insight was to find a *necessary condition* in terms of degrees. Suppose \(G\) has an Eulerian circuit. As the circuit passes through any vertex \(v\), it uses one edge to enter and one edge to leave. Since each edge is used exactly once, the edges incident with \(v\) are paired up into enter/leave pairs. Therefore, every vertex must have *even* degree. (Isolated vertices, which are never visited, trivially have even degree 0.)

Returning to Königsberg: the four land masses have degrees 3, 3, 5, and 3 in the bridge graph — all odd. So no Eulerian circuit can exist, and the residents were right to be stumped.

Euler proved the necessity. The converse — that even degrees are also *sufficient* — requires a proof, and a beautiful one:

<div class="theorem">

<strong>Theorem 4.9.2.</strong> Let \(G\) be a connected graph. Then \(G\) has an Eulerian circuit if and only if every vertex has even degree.

</div>

*Proof sketch (the "if" direction).* We prove by strong induction on \(|E(G)|\) that any connected graph with all even degrees has an Eulerian circuit.

**Base case:** If \(|E(G)| = 0\), the graph consists of a single vertex, and the trivial walk is an Eulerian circuit.

**Inductive step:** Suppose \(|E(G)| \ge 1\). Since every vertex has degree at least 2 (all degrees are positive even numbers, assuming \(G\) is not a single isolated vertex), Theorem 4.6.4 guarantees that \(G\) contains a cycle \(C\). Remove the edges of \(C\) from \(G\). What remains? Each vertex of \(C\) had its degree reduced by 2 (one edge entering, one leaving on the cycle), so all degrees remain even. The resulting graph \(G - E(C)\) may no longer be connected; let \(G_1, G_2, \ldots, G_k\) be its components that have at least one edge. Each \(G_i\) is a connected graph with all even degrees, and since \(|E(G_i)| < |E(G)|\), the induction hypothesis gives an Eulerian circuit \(W_i\) in each \(G_i\).

Now we *splice* these circuits together. Since \(G\) was connected, each component \(G_i\) shares at least one vertex with \(C\). We can walk along \(C\), and whenever we reach a vertex \(v\) that belongs to some \(G_i\), we detour along the full Eulerian circuit \(W_i\) of \(G_i\) (starting and ending at \(v\)), before continuing along \(C\). The resulting walk uses every edge of \(C\) and every edge of each \(G_i\) exactly once — hence every edge of \(G\) exactly once. It is closed, so it is an Eulerian circuit of \(G\). \(\square\)

This proof has a constructive flavour: it tells us how to build the Eulerian circuit, not just that one exists. In practice, the algorithm described is called **Hierholzer's algorithm**.

### 4.10 Bridges

The Eulerian circuit discussion touches on a key structural concept: some edges, if removed, disconnect the graph. These are the "weak links."

<div class="definition">

<strong>Definition 4.10.1 (Bridge).</strong> An edge \(e\) of \(G\) is a <em>bridge</em> if \(G - e\) has more components than \(G\).

</div>

Bridges represent critical connections: removing a bridge either disconnects a connected graph, or increases the number of components of a disconnected one. In network design, bridges are points of failure — if a bridge in a communication network goes down, some nodes lose connectivity.

<div class="lemma">

<strong>Lemma 4.10.2.</strong> If \(e = \{x,y\}$ is a bridge of a connected graph \(G\), then \(G - e\) has precisely two components; furthermore, \(x\) and \(y\) are in different components.

</div>

The proof uses the cut characterisation of disconnectedness. Since \(G\) was connected and \(G-e\) is disconnected, there must be a proper nonempty subset \(S\) of \(V(G)\) inducing an empty cut in \(G-e\). The only edge crossing this cut in \(G\) is \(e\) itself, so \(S\) separates \(x\) from \(y\). One can show that \(G-e\) has exactly two components by carefully checking that no further splitting occurs.

<div class="theorem">

<strong>Theorem 4.10.3.</strong> An edge \(e\) is a bridge of a graph \(G\) if and only if it is not contained in any cycle of \(G\).

</div>

This elegant characterisation says that bridges are exactly the "cycle-free" edges. Intuitively: if \(e\) lies on a cycle \(C\), then removing \(e\) still leaves the rest of \(C\) as an alternative path between the endpoints of \(e\), so connectivity is not lost. Conversely, if \(e = \{x,y\}\) lies on no cycle, there is no alternative path from \(x\) to \(y\) that avoids \(e\), so removing \(e\) disconnects them.

<div class="corollary">

<strong>Corollary 4.10.4.</strong> If there are two distinct paths from vertex \(u\) to vertex \(v\) in \(G\), then \(G\) contains a cycle.

</div>

Equivalently (contrapositive): if \(G\) has no cycles, then each pair of vertices is joined by at most one path. This is a key property of trees, which we explore in the next chapter.

---

## Chapter 5: Trees

### 5.1 Trees

Trees are, in a sense, the simplest connected graphs: they have just enough edges to be connected, with none to spare. Remove any single edge and the graph falls apart; add any edge and a cycle appears. This minimal-yet-sufficient quality makes trees ubiquitous across mathematics, computer science, and the natural sciences.

In computer science, trees appear as data structures for fast searching (binary search trees, AVL trees, red-black trees), for representing hierarchical data (file systems, parse trees, XML), and in algorithms (BFS and DFS trees, decision trees). In network design, a spanning tree of a network represents the cheapest set of connections that keeps all nodes reachable. In chemistry, the alkanes \(C_n H_{2n+2}\) are precisely the hydrocarbon molecules whose bond-graph is a tree. In biology, evolutionary trees (phylogenies) represent the branching history of species.

<div class="definition">

<strong>Definition 5.1.1 (Tree).</strong> A <em>tree</em> is a connected graph with no cycles.

</div>

<div class="definition">

<strong>Definition 5.1.2 (Forest).</strong> A <em>forest</em> is a graph with no cycles.

</div>

Each component of a forest is a tree, so forests are precisely the disjoint unions of trees. A single tree is the special case of a forest with one component.

The two defining properties — connected and acyclic — are in a precise sense "dual" constraints. Connectivity says the graph is not too sparse; acyclicity says it is not too dense. Trees sit exactly at the boundary.

<div class="lemma">

<strong>Lemma 5.1.3.</strong> If \(u\) and \(v\) are vertices in a tree \(T\), then there is a unique \(u,v\)-path in \(T\).

</div>

Existence follows from connectivity. Uniqueness follows from acyclicity: if there were two distinct paths from \(u\) to \(v\), their symmetric difference would contain a cycle, contradicting the definition of a tree. This is in fact an equivalent characterisation: a connected graph is a tree if and only if every pair of vertices is connected by a *unique* path.

<div class="lemma">

<strong>Lemma 5.1.4.</strong> Every edge of a tree \(T\) is a bridge.

</div>

This follows immediately from Theorem 4.10.3: since a tree has no cycles, every edge is not on any cycle, hence every edge is a bridge. Think of a tree as the graph where every connection is critical: remove any edge and the tree splits into two pieces. This is another way to say that trees are "minimally connected."

Now for the fundamental counting property of trees:

<div class="theorem">

<strong>Theorem 5.1.5.</strong> If \(T\) is a tree, then \(|E(T)| = |V(T)| - 1\).

</div>

*Proof by strong induction on \(|E(T)| = m\).*

**Base case:** \(m = 0\). A tree with no edges is a single vertex (connected, vacuously acyclic), so \(|E| = 0 = 1 - 1 = |V| - 1\). \(\checkmark\)

**Inductive step:** Suppose the result holds for all trees with fewer than \(m \ge 1\) edges. Let \(T\) be a tree with \(m\) edges, and let \(e\) be any edge of \(T\). By Lemma 5.1.4, \(e\) is a bridge, so \(T - e\) has exactly two components (by Lemma 4.10.2); call them \(T_1\) and \(T_2\). Each \(T_i\) is a connected subgraph of \(T\); since \(T\) is acyclic and each \(T_i\) is a subgraph of \(T\), each \(T_i\) is also acyclic. Hence \(T_1\) and \(T_2\) are both trees, each with fewer edges than \(T\).

By the induction hypothesis:
\[
|E(T_1)| = |V(T_1)| - 1 \quad \text{and} \quad |E(T_2)| = |V(T_2)| - 1.
\]
Adding these and using \(|E(T)| = |E(T_1)| + |E(T_2)| + 1\) (the removed edge \(e\) contributes the \(+1\)) and \(|V(T)| = |V(T_1)| + |V(T_2)|\):
\[
|E(T)| = \bigl(|V(T_1)| - 1\bigr) + \bigl(|V(T_2)| - 1\bigr) + 1 = |V(T_1)| + |V(T_2)| - 1 = |V(T)| - 1. \quad \square
\]

This \(|E| = |V| - 1\) formula is one of the most-used facts in the course. As the lectures note, you can observe it empirically: draw several trees with 4, 5, 6 vertices, count the edges — always one fewer than the vertices. The proof then explains why.

<div class="corollary">

<strong>Corollary 5.1.6.</strong> If \(G\) is a forest with \(k\) components, then \(|E(G)| = |V(G)| - k\).

</div>

Each component is a tree satisfying \(|E| = |V| - 1\), and summing over all \(k\) components gives the result.

<div class="definition">

<strong>Definition 5.1.7 (Leaf).</strong> A <em>leaf</em> in a tree is a vertex of degree 1.

</div>

Leaves are the "endpoints" of a tree — the vertices that have only one connection. In a rooted tree (a tree with a designated root vertex), the leaves are the vertices at the "bottom," with no children.

<div class="theorem">

<strong>Theorem 5.1.8.</strong> A tree with at least two vertices has at least two leaves.

</div>

The proof uses a **longest-path argument**: let \(P = v_1 v_2 \cdots v_k\) be a longest path in \(T\). Since \(T\) has at least one edge, \(k \ge 2\). We claim both \(v_1\) and \(v_k\) are leaves.

Consider \(v_1\). Its only neighbour on \(P\) is \(v_2\). Could \(v_1\) have a neighbour \(u\) outside \(P\)? No — because then \(u, v_1, v_2, \ldots, v_k\) would be a path longer than \(P\), a contradiction. Could \(v_1\) have a neighbour \(v_i\) with \(i > 2\)? No — because then \(v_1, v_2, \ldots, v_i, v_1\) would be a cycle, contradicting the tree property. So \(v_1\) has degree exactly 1, i.e., it is a leaf. By an identical argument, \(v_k\) is a leaf. Since \(k \ge 2\), \(v_1 \ne v_k\), so we have found two distinct leaves. \(\square\)

The proof uses the two properties of trees — acyclicity and connectivity — in an elegant interplay. The longest-path argument is a recurring technique in graph theory.

<svg viewBox="0 0 280 200" xmlns="http://www.w3.org/2000/svg" style="max-width:280px;display:block;margin:1.5em auto">
  <defs>
    <marker id="treeArr" markerWidth="0" markerHeight="0" refX="0" refY="0" orient="auto"/>
  </defs>
  <text x="140" y="16" font-size="12" fill="currentColor" text-anchor="middle" font-weight="bold">Labeled Tree (5 vertices, 4 edges)</text>
  <!-- Vertices: root=1 at top center, children 2,3 at level 2, 4,5 as leaves -->
  <!-- 1 at (140, 45), 2 at (80, 110), 3 at (200, 110), 4 at (50, 175), 5 at (115, 175) -->
  <line x1="140" y1="45" x2="80" y2="110" stroke="currentColor" stroke-width="2"/>
  <line x1="140" y1="45" x2="200" y2="110" stroke="currentColor" stroke-width="2"/>
  <line x1="80" y1="110" x2="50" y2="175" stroke="currentColor" stroke-width="2"/>
  <line x1="80" y1="110" x2="115" y2="175" stroke="currentColor" stroke-width="2"/>
  <!-- Vertex circles -->
  <circle cx="140" cy="45" r="14" fill="#3b82f6" fill-opacity="0.85"/>
  <text x="140" y="50" font-size="11" fill="white" text-anchor="middle" font-weight="bold">1</text>
  <circle cx="80" cy="110" r="14" fill="#3b82f6" fill-opacity="0.85"/>
  <text x="80" y="115" font-size="11" fill="white" text-anchor="middle" font-weight="bold">2</text>
  <circle cx="200" cy="110" r="14" fill="#3b82f6" fill-opacity="0.85"/>
  <text x="200" y="115" font-size="11" fill="white" text-anchor="middle" font-weight="bold">3</text>
  <circle cx="50" cy="175" r="14" fill="#22c55e" fill-opacity="0.85"/>
  <text x="50" y="180" font-size="11" fill="white" text-anchor="middle" font-weight="bold">4</text>
  <circle cx="115" cy="175" r="14" fill="#22c55e" fill-opacity="0.85"/>
  <text x="115" y="180" font-size="11" fill="white" text-anchor="middle" font-weight="bold">5</text>
  <!-- Leaf labels -->
  <text x="140" y="196" font-size="10" fill="currentColor" text-anchor="middle" opacity="0.7">Leaves: 3, 4, 5 (degree 1).  |V|=5, |E|=4=|V|−1.</text>
</svg>

### 5.2 Spanning Trees

A spanning subgraph that is also a tree is called a **spanning tree**. A spanning tree of \(G\) uses every vertex of \(G\) but only enough edges to remain connected (and acyclic) — by Theorem 5.1.5, it has exactly \(|V(G)| - 1\) edges.

Spanning trees arise naturally in network design. If you want to connect \(n\) nodes in a network with as few links as possible (while still maintaining full connectivity), a spanning tree achieves the minimum: \(n-1\) edges. Any fewer and the network disconnects; any more and there is a redundant cycle.

<div class="theorem">

<strong>Theorem 5.2.1.</strong> A graph \(G\) is connected if and only if it has a spanning tree.

</div>

The "if" direction is immediate: a spanning tree is connected and uses all vertices of \(G\), so \(G\) is connected. For the "only if" direction, the proof constructs a spanning tree by a pruning argument: as long as \(G\) has a cycle, remove one edge from that cycle. Removing an edge from a cycle does not disconnect the graph (since the rest of the cycle provides an alternative path). We continue until no cycle remains; the result is a connected acyclic spanning subgraph, i.e., a spanning tree. The formal proof uses induction on the number of cycles.

<div class="corollary">

<strong>Corollary 5.2.2.</strong> If \(G\) is connected, with \(p\) vertices and \(q = p-1\) edges, then \(G\) is a tree.

</div>

A connected graph with \(p\) vertices has a spanning tree with \(p-1\) edges. If \(G\) itself has only \(p-1\) edges, the spanning tree must use all of them, so \(G\) equals its spanning tree and is therefore a tree.

The following two theorems describe the exchange operations on spanning trees — how to obtain one spanning tree from another by swapping edges. They are fundamental in the theory of matroids and in optimisation.

<div class="theorem">

<strong>Theorem 5.2.3.</strong> If \(T\) is a spanning tree of \(G\) and \(e\) is an edge not in \(T\), then \(T + e\) contains exactly one cycle \(C\). Moreover, if \(e'\) is any edge on \(C\), then \(T + e - e'\) is also a spanning tree of \(G\).

</div>

Adding the non-tree edge \(e = \{u,v\}\) to \(T\) creates a cycle because \(T\) already contains a unique path from \(u\) to \(v\) (by Lemma 5.1.3); this path together with \(e\) forms the unique cycle \(C\). Removing any edge \(e'\) of \(C\) breaks the cycle while maintaining connectivity (the path from \(u\) to \(v\) can now go via the remaining edges of \(C\)), so \(T + e - e'\) is a spanning tree.

<div class="theorem">

<strong>Theorem 5.2.4.</strong> If \(T\) is a spanning tree of \(G\) and \(e\) is an edge in \(T\), then \(T - e\) has 2 components. If \(e'\) is in the cut induced by one of the components, then \(T - e + e'\) is also a spanning tree of \(G\).

</div>

Removing a tree-edge \(e\) disconnects \(T\) into two components (since every tree-edge is a bridge). To reconnect, we need to add an edge that crosses the resulting cut. Any such edge \(e'\) will reconnect the two components, giving a new spanning tree.

These two theorems describe how to exchange edges in a spanning tree: adding a non-tree edge creates a unique cycle, and removing any edge of that cycle yields a new spanning tree. Conversely, removing a tree edge creates a cut, and adding any edge of that cut yields a new spanning tree. These operations generate all spanning trees from any one spanning tree.

### 5.3 Characterizing Bipartite Graphs

Recall from Section 4.4 that a bipartite graph has its vertices partitioned into two sides with all edges going between sides. We observed that the \(n\)-cube is bipartite. What property of a graph determines whether it is bipartite?

The answer involves odd cycles. A cycle \(C\) of length \(k\) is **odd** if \(k\) is odd, and **even** if \(k\) is even.

<div class="lemma">

<strong>Lemma 5.3.1.</strong> An odd cycle is not bipartite.

</div>

The proof is a simple parity argument. Suppose a cycle of length \(k\) (odd) had a bipartition \((A,B)\). Walk along the cycle: vertices alternate between \(A\) and \(B\). After \(k\) steps (an odd number), we arrive back at the starting vertex. But \(k\) steps of alternation reverses the side, so we arrive at a vertex in the *opposite* side from where we started — a contradiction, since the starting vertex belongs to a fixed side.

<div class="theorem">

<strong>Theorem 5.3.2.</strong> A graph is bipartite if and only if it has no odd cycles.

</div>

The forward direction follows from Lemma 5.3.1: a bipartite graph cannot contain an odd cycle. The reverse direction is more interesting. Suppose \(G\) has no odd cycles; we must construct a bipartition.

The proof uses spanning trees. Since we may handle each component separately, assume \(G\) is connected and let \(T\) be a spanning tree of \(G\). A tree is bipartite: partition its vertices by their distance (level) from the root — even-level vertices go to \(A\), odd-level vertices go to \(B\). Now consider any non-tree edge \(e = \{u,v\}\). In \(T\), the unique path from \(u\) to \(v\) has some length \(\ell\). The cycle formed by this path together with \(e\) has length \(\ell + 1\). Since \(G\) has no odd cycles, \(\ell + 1\) must be even, so \(\ell\) is odd. An odd-length path in a bipartite tree must connect vertices on opposite sides (since the sides alternate with each step). Hence \(u\) and \(v\) are on opposite sides, and the edge \(e\) between them is a valid bipartite edge. This shows that the bipartition \((A,B)\) of \(T\) is also a valid bipartition for all edges of \(G\).

To certify that a graph is bipartite, provide a bipartition. To certify it is not bipartite, exhibit an odd cycle as a subgraph.

### 5.4 Breadth-First Search

We now describe a systematic algorithm for exploring a graph: **Breadth-First Search (BFS)**. BFS is both a theoretical tool (proving properties of connected graphs) and a practical algorithm (used in shortest-path computations, network traversal, and bipartiteness testing).

The underlying idea is simple: start at a root vertex, explore all its neighbours, then all the neighbours of those neighbours, and so on — layer by layer, like ripples expanding on a pond. At each stage, the "frontier" is the set of recently discovered vertices; we systematically exhaust their neighbourhoods before moving to the next layer.

BFS is an algorithm for finding a spanning tree (and testing connectivity).

<div class="definition">

<strong>Algorithm 5.4.1 (Search Tree Algorithm).</strong> To find a spanning tree of a graph \(G\): Select any vertex \(r\) of \(G\) as the initial subgraph \(D\), with \(\mathrm{pr}(r) = \varnothing\). At each stage, find an edge in \(G\) that joins a vertex \(u\) of \(D\) to a vertex \(v\) not in \(D\). Add vertex \(v\) and edge \(\{u,v\}\) to \(D\), with \(\mathrm{pr}(v) = u\). Stop when there is no such edge.

</div>

This general search tree algorithm constructs a spanning tree (or spanning forest, if \(G\) is disconnected) by always expanding the tree by one new vertex at a time. The function \(\mathrm{pr}\) is the **parent** or **predecessor** function: \(\mathrm{pr}(v) = u\) records which vertex \(u\) was responsible for discovering \(v\). The **level** of \(v\) is the number of predecessor-steps from \(v\) back to the root \(r\): formally, the unique \(k\) such that \(\mathrm{pr}^k(v) = r\).

Breadth-First Search is the refinement that always processes vertices in the order they were discovered, using a **queue** (first-in, first-out) to maintain the active set:

<div class="definition">

<strong>Algorithm 5.4.2 (Breadth-First Search).</strong> Follow Algorithm 5.4.1 with the refinement: at each stage, the <em>active</em> vertex \(u\) is the unexhausted vertex that joined the tree earliest.

</div>

A vertex is **exhausted** if all its neighbours have already been added to the tree (i.e., it has no remaining undiscovered neighbours). BFS uses a queue: when a vertex \(v\) is discovered, it is added to the back of the queue; the active vertex \(u\) at each step is taken from the front of the queue.

Here is a step-by-step example. Consider a path graph \(1 - 2 - 3 - 4 - 5\) with two additional edges \(\{1,3\}\) and \(\{2,4\}\), and root at vertex 1.

1. **Initialize:** Queue = \([1]\). Tree \(T\) = \(\{1\}\).
2. **Process vertex 1:** Neighbours are 2 and 3. Add both, set \(\mathrm{pr}(2) = 1\), \(\mathrm{pr}(3) = 1\). Queue = \([2, 3]\). Level(2) = Level(3) = 1.
3. **Process vertex 2:** Neighbours not yet in tree: 4. Add 4, \(\mathrm{pr}(4) = 2\). Neighbour 3 is already in tree (non-tree edge \(\{2,3\}\) — but wait, \(\{2,3\}\) is not in our graph in this example; the extra edge is \(\{1,3\}\)). Queue = \([3, 4]\). Level(4) = 2.
4. **Process vertex 3:** Neighbours not yet in tree: none (1 and 2 already in tree; edge \(\{1,3\}\) is a non-tree edge). Queue = \([4]\).
5. **Process vertex 4:** Neighbours not yet in tree: 5. Add 5, \(\mathrm{pr}(5) = 4\). Queue = \([5]\). Level(5) = 3.
6. **Process vertex 5:** No new neighbours. Queue = \([\,]\). Done.

The resulting BFS tree is the path \(1-2-4-5\) with the extra tree edge \(\{1,3\}\). Non-tree edges are those not included in the tree.

<div class="lemma">

<strong>Lemma 5.4.3.</strong> The vertices enter a breadth-first search tree in non-decreasing order of level.

</div>

This is a direct consequence of the queue discipline: all level-\(k\) vertices are discovered (and enqueued) before any level-\((k+1)\) vertex, so they are processed — and their children discovered — before level-\((k+1)\) vertices enter the queue.

<div class="theorem">

<strong>Theorem 5.4.4 (Primary Property of BFS).</strong> In a connected graph with a breadth-first search tree, each non-tree edge in the graph joins vertices that are at most one level apart in the search tree (of course each tree edge joins vertices that are exactly one level apart).

</div>

This is the key structural property of BFS trees. Suppose \(e = \{u,v\}\) is a non-tree edge and suppose, without loss of generality, that \(u\) was discovered no later than \(v\). When \(u\) was being processed, \(v\) was either already in the tree or was added as a neighbour of \(u\). If \(v\) was already in the tree at that point, \(v\)'s level is at most \(\text{level}(u) + 1\) (it was discovered no later than the processing of \(u\)'s generation). This bounds the level difference to at most 1. The proof formalises this argument using Lemma 5.4.3.

### 5.5 Applications of Breadth-First Search

BFS is not merely an efficient way to find spanning trees — it yields deeper structural information about the graph.

<div class="theorem">

<strong>Theorem 5.5.1.</strong> A connected graph \(G\) with breadth-first search tree \(T\) has an odd cycle if and only if it has a non-tree edge joining vertices at the same level in \(T\).

</div>

The proof uses the primary property of BFS (Theorem 5.4.4): every non-tree edge joins vertices at most one level apart. An edge joining vertices at the same level creates a cycle with a specific parity. If \(e = \{u,v\}\) is a non-tree edge with \(\text{level}(u) = \text{level}(v) = k\), then the path from the root to \(u\) has length \(k\), and the path from the root to \(v\) has length \(k\). The cycle formed by these two root-paths together with \(e\) has length \(k + k + 1 = 2k+1\), which is odd.

Conversely, one shows that if all non-tree edges join vertices at different levels (necessarily one level apart by Theorem 5.4.4), then the BFS level-partition gives a valid bipartition of \(G\).

This gives a constructive method: BFS can directly find either an odd cycle or a bipartition. Running BFS on \(G\):

- If any non-tree edge connects two vertices at the same level, extract the odd cycle by tracing back through the tree to their common ancestor.
- If all non-tree edges connect vertices at adjacent levels, the BFS level-partition is a valid 2-colouring (bipartition).

<div class="theorem">

<strong>Theorem 5.5.2.</strong> The length of a shortest path from \(u\) to \(v\) in a connected graph \(G\) is equal to the level of \(v\) in any breadth-first search tree of \(G\) with \(u\) as the root.

</div>

This is the reason BFS is used for shortest-path computation. The BFS level of a vertex \(v\) (from root \(u\)) is the length of the path in the BFS tree from \(u\) to \(v\). Since BFS explores vertices in order of non-decreasing distance, the first time BFS reaches \(v\) is via a shortest path. The formal proof shows that the BFS tree path is no longer than any other path, by induction on levels.

The **distance** between two vertices \(u\) and \(v\) in \(G\) is the length of a shortest path between them. BFS computes all distances from a given source vertex in time proportional to the number of vertices plus the number of edges — making it one of the most efficient fundamental algorithms in graph theory.

### 5.6 Minimum Spanning Tree

We now turn to an optimisation problem on graphs. Suppose we wish to build a communication network connecting a set of cities, but constructing each link has a cost. We want all cities to be reachable from all others, at minimum total cost. Since a spanning tree is the most economical connected structure, the problem becomes: find a spanning tree of minimum total edge weight.

In the **minimum spanning tree (MST)** problem, we are given a connected graph \(G\) with edge weights \(w : E(G) \to \mathbb{R}\) and seek a spanning tree of minimum total weight. For a subgraph \(H\), write \(w(H) = \sum_{e \in E(H)} w(e)\).

Think of the edge weights as road construction costs: a spanning tree of minimum weight gives the cheapest way to keep all nodes connected. Any connected spanning subgraph of \(G\) costs at least \(w(\text{MST})\), since a spanning tree is the minimal connected spanning subgraph.

**Prim's Algorithm** solves the MST problem greedily. The idea is to grow a tree one vertex at a time, always adding the cheapest available edge that extends the current tree to a new vertex.

**Algorithm (Prim's):**
1. Start with any vertex \(v\). Let \(T\) be the tree containing only \(v\).
2. While \(T\) is not a spanning tree:
   - Let \(\partial(V(T))\) be the cut induced by the current tree's vertex set.
   - Among all edges in \(\partial(V(T))\), choose one of minimum weight, say \(e^* = \{u, v^*\}\) with \(u \in V(T)\) and \(v^* \notin V(T)\).
   - Add \(v^*\) and \(e^*\) to \(T\).
3. Return \(T\).

In the lectures, Prim's algorithm is illustrated on a specific graph: starting at vertex \(a\), the algorithm considers the cut edges from \(\{a\}\), picks the minimum-weight one, and repeats. At each step the tree grows by exactly one vertex and one edge, so after \(|V(G)| - 1\) steps, a spanning tree has been produced.

<div class="theorem">

<strong>Theorem 5.6.1.</strong> Prim's algorithm produces a minimum spanning tree for \(G\).

</div>

The proof uses a greedy exchange argument. Define a partial tree as **good** if there exists a minimum spanning tree containing it as a subgraph. We maintain the invariant that the partial tree built by Prim's algorithm is always good.

**Invariant:** At each stage, there exists an MST \(T^*\) such that \(T \subseteq T^*\) (where \(T\) is Prim's current partial tree).

**Initialization:** The single-vertex tree is trivially contained in every spanning tree.

**Inductive step:** Suppose \(T\) is good (contained in some MST \(T^*\)), and suppose Prim's next step adds edge \(e^* = \{u,v^*\}\) — the minimum-weight edge in the current cut. If \(e^* \in T^*\), then \(T + e^*\) is still contained in \(T^*\), and we are done. If \(e^* \notin T^*\), then by Theorem 5.2.3, adding \(e^*\) to \(T^*\) creates a unique cycle \(C\). This cycle \(C\) must cross the cut induced by \(V(T)\) at least twice (once via \(e^*\)). Let \(e'\) be another edge of \(C\) in the cut. By Prim's choice, \(w(e^*) \le w(e')\). Now replace \(e'\) by \(e^*\) in \(T^*\): by Theorem 5.2.3, \(T^* - e' + e^*\) is still a spanning tree, and its weight \(w(T^*) - w(e') + w(e^*) \le w(T^*)\). Since \(T^*\) was an MST, \(T^* - e' + e^*\) is also an MST, and it contains \(T + e^*\). So \(T + e^*\) is good. \(\square\)

Prim's algorithm is an instance of the **greedy method**: at each step, make the locally optimal choice (minimum-weight cut edge) without reconsidering past choices. The correctness proof shows that local optimality is sufficient here because of the matroid structure underlying the problem.

A related algorithm is **Kruskal's algorithm**, which builds the MST by always adding the globally cheapest edge that does not create a cycle (rather than cheapest cut edge from the current tree). Both algorithms are provably optimal, and both run efficiently.

---

### 5.7 The Travelling Salesman Problem (Bonus)

We close with a famous optimisation problem that is, in a precise sense, much harder than MST.

The **Travelling Salesman Problem (TSP)** asks: given a graph \(G\) with edge weights \(w\), find a **Hamilton cycle** (a cycle visiting every vertex exactly once) of minimum total weight. TSP models the problem of a salesperson who must visit a set of cities and return home, minimising total travel distance.

Despite its innocent appearance, TSP is **NP-hard**: no polynomial-time algorithm is known for it, and it is widely believed that none exists. Many fundamental problems in cryptography (and the Clay Institute's million-dollar P vs. NP problem) are connected to the hardness of TSP and related problems. As the lectures note wryly: if you discover a fast algorithm for TSP, let someone know — it would break most modern encryption.

For the special case where the vertices are points in the Euclidean plane and edge weights are Euclidean distances (the **metric TSP**), one can give a **2-approximation algorithm** — a fast algorithm guaranteed to find a Hamilton cycle of weight at most twice the optimum. The algorithm has four steps:

1. **Find an MST** \(T\) of \(G\) using Prim's algorithm.
2. **Double all edges** of \(T\): create a multigraph \(T'\) where each edge of \(T\) appears twice. Every vertex of \(T'\) now has even degree (since each vertex's degree was multiplied by 2), so by the Eulerian circuit theorem, \(T'\) has an Eulerian circuit \(W\).
3. **Find an Eulerian circuit** \(W\) in \(T'\).
4. **Shortcut** \(W\) to a Hamilton cycle: walk along \(W\), but whenever the next vertex has already been visited, skip it and proceed directly to the following unvisited vertex.

The resulting tour visits each vertex exactly once (it is a Hamilton cycle). Why is it at most twice optimal? Let \(H^*\) be the optimal Hamilton cycle. Then \(w(T) \le w(H^*)\) (since deleting any edge from \(H^*\) gives a spanning tree, and \(T\) is the *minimum* spanning tree). The doubled tree \(T'\) has \(w(T') = 2w(T) \le 2w(H^*)\). The Eulerian circuit \(W\) traverses \(T'\), so \(w(W) = w(T') \le 2w(H^*)\). Finally, the shortcutting step can only decrease the total weight (by the triangle inequality in Euclidean space — skipping a vertex is a shortcut). Hence the final Hamilton cycle has weight at most \(2w(H^*)\).

This 2-approximation algorithm — elegant in its use of MST, Eulerian circuits, and the triangle inequality together — illustrates how the fundamental concepts of this chapter combine to address a hard practical problem.

---

## Chapter 6: Codes

### 6.1 Vector Spaces and Fundamental Cycles

Before turning to planar graphs in Chapter 7, the course takes a detour into algebraic combinatorics — applying the language of linear algebra over the field with two elements to subgraphs of a graph. The payoff is an application to coding theory: the cycle space of a well-chosen graph yields an efficient error-correcting code.

The setting is information theory. Suppose you want to transmit a binary message across a channel that may flip individual bits. If you send the message directly, a single bit flip corrupts it with no way for the receiver to detect, let alone correct, the error. The solution is *redundancy*: encode the message with extra bits that carry information about the rest, so that a few errors can be detected or corrected by checking consistency conditions. A **binary code** is a set of allowed binary strings (the **codewords**); when a received string does not match any codeword, an error is known to have occurred, and the nearest codeword can be taken as the most likely transmitted message.

What makes a code good? Two properties matter: (1) the codewords should be as different from each other as possible, so that a corrupted codeword is closer to the sent codeword than to any other; (2) the code should have algebraic structure that makes encoding and decoding efficient. The graphical codes constructed in this chapter satisfy both conditions automatically from the structure of the underlying graph.

The key algebraic ingredient is the **symmetric difference** of edge sets, which behaves like addition over the field \(\mathbb{F}_2 = \{0, 1\}\) (integers mod 2). Given two subgraphs \(H_1\) and \(H_2\) of a graph \(G\), their modulo-2 sum \(H_1 \oplus H_2\) is the subgraph whose edge set is \(E(H_1) \triangle E(H_2)\) — edges in one but not both. This operation is analogous to XOR on bit strings.

<div class="definition">

<strong>Definition 6.1.1 (Modulo 2 Sum).</strong> For \(H_1, H_2 \in S(G)\), the <em>modulo 2 sum</em> \(H_1 \oplus H_2\) is the element of \(S(G)\) whose edge set consists of all edges of \(G\) that are in \(H_1\) or \(H_2\) but not in both (the symmetric difference of \(E(H_1)\) and \(E(H_2)\)).

</div>

The set \(S(G)\) of all spanning subgraphs of \(G\) — subgraphs using every vertex of \(G\) but any subset of edges — has a natural encoding as binary vectors of length \(|E(G)|\): the \(i\)-th coordinate is 1 if edge \(e_i\) is present, 0 otherwise. Under this encoding, \(\oplus\) becomes coordinate-wise addition mod 2, making \(S(G)\) into a vector space over \(\mathbb{F}_2\).

<div class="theorem">

<strong>Theorem 6.1.2.</strong> The set \(S(G)\) is a vector space over \(GF(2)\).

</div>

<div class="theorem">

<strong>Theorem 6.1.3.</strong> \(\{A_1, A_2, \ldots, A_q\}\) forms a basis for \(S(G)\), where \(A_i\) is the spanning subgraph containing only edge \(e_i\).

</div>

The standard basis \(\{A_1, \ldots, A_q\}\) is simply the set of single-edge subgraphs, mirroring the standard basis vectors \(\mathbf{e}_1, \ldots, \mathbf{e}_q\) of \(\mathbb{F}_2^q\). Thus \(S(G)\) has dimension \(q\) and contains \(2^q\) elements — one for each subset of edges.

The full space \(S(G)\) is too large to be a useful code; any two codewords can differ in just one bit, making error detection impossible. We need a subspace with large **minimum distance** — the minimum number of positions in which two distinct codewords differ. The natural subspace to consider is the collection of all even spanning subgraphs.

<div class="definition">

<strong>Definition 6.1.4 (Even Graph).</strong> A graph in which all degrees are even non-negative integers is called an <em>even graph</em>.

</div>

Why consider even graphs? The key observation is that every cycle is an even graph (each vertex has degree 2 or 0), and the symmetric difference of two even graphs is again even (degrees add mod 2, so odd + odd = even). This closure property is exactly what is needed for a subspace.

Let \(C(G)\) be the set of even spanning subgraphs of \(G\).

<div class="theorem">

<strong>Theorem 6.1.5.</strong> The set \(C(G)\) forms a vector space over \(GF(2)\). (It is a subspace of \(S(G)\).)

</div>

To find a basis for \(C(G)\), we use spanning trees. Fix a spanning tree \(T\) of the connected graph \(G\). For each edge \(e\) not in \(T\), the graph \(T + e\) contains a unique cycle, because adding one edge to a tree creates exactly one cycle (the path from one endpoint of \(e\) to the other in \(T\), together with \(e\) itself).

<div class="theorem">

<strong>Theorem 6.1.6.</strong> Let \(T\) be a spanning tree of a connected graph \(G\). If \(e\) is an edge of \(G\) that is not in \(T\), then \(T + e\) contains a unique cycle. (This cycle contains edge \(e\).)

</div>

Each non-tree edge \(e_i\) thus determines a **fundamental cycle** \(C_i\). With \(q\) edges and \(p\) vertices, \(T\) has \(p-1\) tree edges, leaving \(q - p + 1\) non-tree edges and hence \(q - p + 1\) fundamental cycles.

<div class="lemma">

<strong>Lemma 6.1.7.</strong> For a fixed spanning tree \(T\) of a connected graph \(G\), no two elements of \(C(G)\) contain exactly the same set of non-tree edges.

</div>

This lemma implies that the fundamental cycles are linearly independent: the only element of \(C(G)\) with no non-tree edges is \(Z\) (the empty subgraph). Combined with the fact that every element of \(C(G)\) can be written as a symmetric difference of fundamental cycles, we obtain:

<div class="theorem">

<strong>Theorem 6.1.8.</strong> \(\{C_1, C_2, \ldots, C_{q-p+1}\}\) forms a basis for \(C(G)\), where \(G\) is connected.

</div>

The dimension of \(C(G)\) is \(q - p + 1\), a number called the **cyclomatic number** of \(G\). For a tree, \(q = p - 1\), so the cyclomatic number is 0: a tree has no cycles, and \(C(T)\) contains only the empty subgraph. Adding one edge creates one independent cycle, increasing the cyclomatic number to 1. The cyclomatic number measures, in a precise sense, how "far" a graph is from being a tree.

### 6.2 Graphical Codes

With the cycle space in hand, we can construct error-correcting codes. Represent each even spanning subgraph of \(G\) as a binary vector of length \(q\) (where \(q = |E(G)|\): the \(i\)-th bit is 1 if edge \(e_i\) is present). The set of these vectors forms the **even graphical code** of \(G\).

To measure how good this code is, we need the Hamming distance.

<div class="definition">

<strong>Definition 6.2.1 (Hamming Distance).</strong> The <em>Hamming distance</em> between two binary vectors \(\underline{x}\) and \(\underline{y}\) of the same length is the number of 1s in \(\underline{x} \oplus \underline{y}\).

</div>

Intuitively, the Hamming distance counts the number of bit positions where \(\underline{x}\) and \(\underline{y}\) differ. For two codewords in a linear code (one closed under \(\oplus\)), the minimum Hamming distance equals the minimum weight of a nonzero codeword — the minimum number of 1-bits in any nonzero element of the code. In our setting, the weight of a codeword is the number of edges in the corresponding even subgraph.

What is the minimum weight of a nonzero element of \(C(G)\)? Every nonzero element of \(C(G)\) is a nonempty even subgraph of \(G\); since every even graph contains a cycle, the minimum weight is at least the **girth** of \(G\) (the length of the shortest cycle). Moreover, every cycle is itself an element of \(C(G)\), so the minimum weight is exactly the girth. This gives:

<div class="lemma">

<strong>Lemma 6.2.2.</strong> In the cycle space of a graph \(G\), any two distinct vectors have Hamming distance at least three.

</div>

The minimum distance 3 comes from the girth being at least 3 (since \(G\) is a simple graph, the shortest cycle has length at least 3). A code with minimum distance \(t\) can detect \(t - 1\) errors and correct \(\lfloor (t-1)/2 \rfloor\) errors.

<div class="lemma">

<strong>Lemma 6.2.3.</strong> If fewer than \(t\) errors are made in the transmission of a codeword, then the received message is either the original codeword, or it is not a codeword at all.

</div>

<div class="lemma">

<strong>Lemma 6.2.4.</strong> If at most \(\lfloor\frac{t-1}{2}\rfloor\) errors are made in the transmission of a codeword \(m\), the Hamming distance between the received message \(m'\) and a codeword is minimum for the unique codeword \(m\).

</div>

Together, Lemmas 6.2.3 and 6.2.4 describe the **nearest-neighbour decoding** rule: upon receiving a string \(m'\), the decoder outputs the codeword closest to \(m'\) in Hamming distance. As long as fewer than \(t/2\) errors occurred, this recovers the original codeword correctly.

<div class="lemma">

<strong>Lemma 6.2.5.</strong> The cycle space of a connected graph \(G\) on \(p\) vertices and \(q\) edges is a \((q, q-p+1, t)\)-code for some \(t \ge 3\).

</div>

<div class="lemma">

<strong>Lemma 6.2.6.</strong> The distance of the even graphical code of \(G\) equals the girth of \(G\).

</div>

To build a good graphical code, one therefore wants a graph with many edges (large \(q\)), few vertices (small \(p\), so the dimension \(q - p + 1\) is large), and large girth (for good error-correcting capability). These requirements are in tension: graphs with high girth tend to have few edges for a given number of vertices. The study of such trade-offs — called **extremal graph theory** — connects the coding theory developed here to deep results in combinatorics.

---

## Chapter 7: Planar Graphs

### 7.1 Planarity

The central question of this chapter is: can a given graph be drawn on a flat sheet of paper without any edges crossing? This sounds like a purely geometric question, but it turns out to be a deep combinatorial one, with a beautiful complete characterisation due to Kuratowski.

The everyday motivation is immediate. Printed circuit boards route electrical traces on a flat substrate; crossings between traces create short circuits. Road networks, underground pipe systems, and regional maps all benefit from planar representations. And on the mathematical side, the question connects Euler's formula, the classification of polyhedra, and the famous Four-Colour Theorem.

<div class="definition">

<strong>Definition 7.1.1 (Planar Graph).</strong> A graph \(G\) is <em>planar</em> if it has a drawing in the plane so that its edges intersect only at their ends, and so that no two vertices coincide. The actual drawing is called a <em>planar embedding</em> of \(G\), or a <em>planar map</em>.

</div>

A crucial distinction, emphasised in the lectures: a **planar graph** is an abstract combinatorial object (a set of vertices and edges), while a **planar embedding** is a specific drawing of that graph in the plane. A graph is planar if at least one crossing-free drawing exists. Having one bad drawing does not make a graph non-planar; having no good drawing at all does.

For example, \(K_4\) is planar. One might carelessly draw it with a crossing, but a simple redrawing — move one vertex to the centre — eliminates all crossings. On the other hand, \(K_5\) is not planar: no matter how we arrange its five vertices and ten edges in the plane, some pair of edges must cross.

When a planar graph is drawn in the plane, the edges divide the plane into connected regions called **faces**. One face — the unbounded region surrounding the drawing — is the **outer face**. The other faces are bounded regions enclosed by cycles in the graph.

A planar embedding partitions the plane into connected regions called **faces**; one of these (the unbounded one) is the **outer face**. The subgraph formed by the vertices and edges bounding a face is the **boundary** of the face. Two faces are **adjacent** if they share a common edge.

The **boundary walk** of a face \(f\) is a closed walk traversing its entire boundary. The number of edges in the boundary walk is the **degree** of face \(f\), denoted \(\deg(f)\). A bridge contributes 2 to the degree of the face it is incident with — since it has the same face on both sides, it is traversed twice in the boundary walk.

The face-shaking lemma is the planar analogue of the handshaking lemma for vertices. The argument is the same: each edge has two sides, each side contributing to the boundary of some face, so each edge contributes exactly 2 to the total face-degree sum.

<div class="theorem">

<strong>Theorem 7.1.2 (Faceshaking Lemma).</strong> If we have a planar embedding of a connected graph \(G\) with faces \(f_1, \ldots, f_s\), then
\[
\sum_{i=1}^{s} \deg(f_i) = 2|E(G)|.
\]

</div>

<div class="corollary">

<strong>Corollary 7.1.3.</strong> If the connected graph \(G\) has a planar embedding with \(f\) faces, the average degree of a face is \(\frac{2|E(G)|}{f}\).

</div>

As the lecturer explains: one way to visualise the faces is the "paint bucket" method — pour paint into each connected region of the drawing, and each region that fills is a face. When this analogy is applied to a cycle embedded in the plane, it fills exactly two regions (inside and outside), consistent with the Jordan Curve Theorem: every planar embedding of a cycle separates the plane into exactly two parts.

### 7.2 Euler's Formula

Euler's formula is one of the most elegant and useful results in mathematics. It says that for any connected planar graph, no matter how it is drawn, the same simple equation \(p - q + f = 2\) relates the numbers of vertices, edges, and faces.

<div class="theorem">

<strong>Theorem 7.2.1 (Euler's Formula).</strong> Let \(G\) be a connected graph with \(p\) vertices and \(q\) edges. If \(G\) has a planar embedding with \(f\) faces, then
\[
p - q + f = 2.
\]

</div>

The formula is proved by induction on \(q\), with the key insight that removing a non-bridge edge from a connected planar graph merges two adjacent faces into one — reducing \(q\) by 1 and \(f\) by 1, keeping \(p - q + f\) constant. The base case is any spanning tree of \(G\): a tree on \(p\) vertices has \(p - 1\) edges and a planar embedding with exactly 1 face (the entire plane), giving \(p - (p-1) + 1 = 2\).

One striking consequence is that the number of faces is **independent of the planar embedding**: since \(f = 2 - p + q\) and both \(p\) and \(q\) are fixed properties of the graph (not the drawing), all planar embeddings of a connected graph have the same number of faces. This is not obvious — different embeddings can look very different — but Euler's formula makes it a theorem.

The formula \(p - q + f = 2\) can be written as \(\chi = 2\) where \(\chi = p - q + f\) is the **Euler characteristic** of the plane. On surfaces other than the plane or sphere, the Euler characteristic differs: for the torus, \(\chi = 0\), and one can draw \(K_7\) on a torus without edge crossings, even though \(K_7\) is far from planar. The formula thus captures something fundamental about the topology of the plane specifically.

### 7.3 Stereographic Projection

<div class="theorem">

<strong>Theorem 7.3.1.</strong> A graph is planar if and only if it can be drawn on the surface of a sphere.

</div>

**Stereographic projection** establishes this equivalence. Place a unit sphere on the plane, with the "south pole" at the origin. Every point of the plane corresponds to a unique point on the sphere (by drawing a line from the "north pole" through the plane-point to the sphere), and vice versa for every point except the north pole itself. The north pole corresponds to the "point at infinity."

This projection maps a planar embedding to a spherical embedding and vice versa. One useful consequence: any face of a planar embedding can be made the outer face by a suitable stereographic projection. Simply project so that the point at infinity falls inside the desired face. This symmetry between all faces — including the outer face — is often used in proofs.

### 7.4 Platonic Solids

The connection between planar graphs and three-dimensional polyhedra runs through stereographic projection. A convex polyhedron has a planar graph as its "skeleton": project from a point just outside a face, and the edges and vertices of the polyhedron map to a planar embedding. Conversely, every 3-connected planar graph arises this way (Steinitz's theorem).

A graph is called **platonic** if it admits a planar embedding in which each vertex has the same degree \(d \ge 3\) and each face has the same degree \(d^* \ge 3\). These correspond to highly symmetric polyhedra — the ones used for dice, since their symmetry makes all faces equally likely to land face-up.

<div class="theorem">

<strong>Theorem 7.4.1.</strong> There are exactly five platonic graphs.

</div>

These correspond to the five Platonic solids: the tetrahedron \((d, d^*) = (3,3)\), the octahedron \((4,3)\), the cube \((3,4)\), the icosahedron \((5,3)\), and the dodecahedron \((3,5)\). It is remarkable that exactly five highly symmetric polyhedra exist — this was known to the ancient Greeks and is a theorem of Euclidean geometry.

<div class="lemma">

<strong>Lemma 7.4.2.</strong> Let \(G\) be a planar embedding with \(p\) vertices, \(q\) edges and \(s\) faces, in which each vertex has degree \(d \ge 3\) and each face has degree \(d^<em> \ge 3\). Then \((d, d^</em>)\) is one of the five pairs \(\{(3,3), (3,4), (4,3), (3,5), (5,3)\}\).

</div>

The proof is a beautiful interplay between Euler's formula, the Handshaking Lemma, and the Faceshaking Lemma. From \(dp = 2q\) and \(d^* s = 2q\), together with Euler's formula \(p - q + s = 2\), one derives \(\frac{2}{d} + \frac{2}{d^*} = 1 + \frac{2}{q}\). Since \(q \ge 1\), the left side must exceed 1; but since \(d \ge 3\) and \(d^* \ge 3\), the left side is at most \(\frac{2}{3} + \frac{2}{3} = \frac{4}{3}\). This tight constraint limits the possibilities to the five pairs listed.

<div class="lemma">

<strong>Lemma 7.4.3.</strong> If \(G\) is a platonic graph with \(p\) vertices, \(q\) edges and \(f\) faces, where each vertex has degree \(d\) and each face has degree \(d^*\), then
\[
q = \frac{2dd^<em>}{2d + 2d^</em> - dd^*}
\]
and \(p = 2q/d\) and \(f = 2q/d^*\).

</div>

### 7.5 Nonplanar Graphs

Not every graph is planar. The two simplest non-planar graphs — \(K_5\) and \(K_{3,3}\) — are worth knowing intimately, because Kuratowski's theorem says they are in a precise sense the *only* reasons a graph can fail to be planar.

To prove non-planarity, we use an edge-counting argument: planar graphs with certain girth constraints cannot have too many edges, and graphs that exceed these limits must be non-planar. The general form of the constraint is:

<div class="lemma">

<strong>Lemma 7.5.1.</strong> If \(G\) contains a cycle, then in a planar embedding of \(G\), the boundary of each face contains a cycle.

</div>

<div class="lemma">

<strong>Lemma 7.5.2.</strong> Let \(G\) be a planar embedding with \(p\) vertices and \(q\) edges. If each face of \(G\) has degree at least \(d^<em>\), then \((d^</em> - 2)q \le d^*(p - 2)\).

</div>

The proof combines the Faceshaking Lemma (which gives \(\sum \deg(f) = 2q\) and hence \(d^* \cdot f \le 2q\)) with Euler's formula (\(f = 2 - p + q\)) to eliminate \(f\), arriving at the stated inequality.

Setting \(d^* = 3\) (every face has at least 3 sides, which holds whenever \(G\) has no multi-edges) and \(p = 5\), \(q = 10\) for \(K_5\):

<div class="theorem">

<strong>Theorem 7.5.3.</strong> In a planar graph \(G\) with \(p \ge 3\) vertices and \(q\) edges, we have \(q \le 3p - 6\).

</div>

<div class="corollary">

<strong>Corollary 7.5.4.</strong> \(K_5\) is not planar.

</div>

Since \(|E(K_5)| = 10 > 9 = 3(5) - 6\).

For \(K_{3,3}\), a bipartite graph has no odd cycles, so every cycle has length at least 4, giving \(d^* \ge 4\):

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

The edge-counting argument is clean and powerful, but it is one-directional: it can rule out planarity for dense graphs, but it cannot certify planarity. For that, Kuratowski's theorem is needed.

### 7.6 Kuratowski's Theorem

An **edge subdivision** of a graph \(G\) is obtained by replacing each edge by a path of length 1 or more — inserting new degree-2 vertices along edges. Planarity is preserved under subdivision: drawing a path between two points in the plane is the same as drawing an edge, so a graph is planar if and only if any edge subdivision of it is planar.

This means that if \(K_5\) is non-planar, so is any graph containing an edge subdivision of \(K_5\) as a subgraph — it still has the "shape" of \(K_5\), just with extra vertices along the edges. Kuratowski's theorem, one of the deepest results in graph theory, says that these are the only obstacles to planarity.

<div class="theorem">

<strong>Theorem 7.6.1 (Kuratowski's Theorem).</strong> A graph is not planar if and only if it has a subgraph that is an edge subdivision of \(K_5\) or \(K_{3,3}\).

</div>

The "only if" direction is clear from what we have already shown: any subdivision of \(K_5\) or \(K_{3,3}\) is non-planar, and any graph containing a non-planar subgraph is non-planar. The "if" direction — that every non-planar graph must contain such a subdivision — is the deep part, proved in CO 342. It requires a careful structural analysis of what can "go wrong" in any attempted planar embedding.

Kuratowski's theorem gives a complete combinatorial characterisation of planarity: to check whether a graph is planar, one needs only to search for a Kuratowski subgraph (a subdivision of \(K_5\) or \(K_{3,3}\)). This search can be performed in linear time by modern algorithms.

### 7.7 Colouring and Planar Maps

One of the most famous problems in mathematics is the Four-Colour Problem: can every map of regions in the plane be coloured with four colours so that adjacent regions get different colours? Proposed in 1852 by Francis Guthrie while trying to colour a map of England, it remained open for 124 years until Appel and Haken proved it in 1976 using an exhaustive computer search of 1834 cases.

In graph-theoretic terms, colouring a map is colouring the vertices of its dual graph (Section 7.8). The Four-Colour Theorem is thus equivalent to: every planar graph is 4-colourable. We prove successively weaker bounds here, starting with 6 colours.

<div class="definition">

<strong>Definition 7.7.1 (\(k\)-Colouring).</strong> A <em>\(k\)-colouring</em> of a graph \(G\) is a function from \(V(G)\) to a set of size \(k\) (whose elements are called <em>colours</em>), so that adjacent vertices always have different colours. A graph with a \(k\)-colouring is called <em>\(k\)-colourable</em>.

</div>

Note that a \(k\)-colouring need not use all \(k\) colours; in particular, a \(k\)-colourable graph is also \((k+1)\)-colourable. The **chromatic number** \(\chi(G)\) is the minimum \(k\) for which \(G\) is \(k\)-colourable.

<div class="theorem">

<strong>Theorem 7.7.2.</strong> A graph is 2-colourable if and only if it is bipartite.

</div>

<div class="theorem">

<strong>Theorem 7.7.3.</strong> \(K_n\) is \(n\)-colourable, and not \(k\)-colourable for any \(k < n\).

</div>

The proof strategy for planar graphs exploits Corollary 7.5.5: every planar graph has a vertex of degree at most 5. This vertex has room to inherit a colour not used by its at most 5 neighbours, as long as we have at least 6 colours available.

<div class="theorem">

<strong>Theorem 7.7.4.</strong> Every planar graph is 6-colourable.

</div>

The proof uses induction on \(p\): by Corollary 7.5.5, there is a vertex \(v\) of degree at most 5. Remove \(v\), 6-colour the remaining planar graph by induction, then assign \(v\) one of the (at least one) remaining colours.

To prove the **Five-Colour Theorem**, we need a stronger tool: **edge contraction**. Contracting edge \(\{x, y\}\) merges \(x\) and \(y\) into a single vertex, keeping all adjacencies. If the five neighbours of \(v\) are all 5-coloured differently, we find two non-adjacent neighbours, contract the edge between them (which produces a planar graph on fewer vertices), apply induction, and then show the resulting colouring can be modified to colour \(v\) with a 5th colour.

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

The Four-Colour Theorem was proved by Appel and Haken (1976) using computer verification of hundreds of cases. It was the first major theorem proved with essential computer assistance, and it remains controversial among mathematicians who prefer purely human proofs. A simplified (but still computer-assisted) proof was given by Robertson, Sanders, Seymour, and Thomas in 1997. As of this writing, no fully human proof is known. The Four-Colour Theorem remains one of the most famous results in mathematics precisely because the gap between what is known and what we can prove by hand is so stark.

### 7.8 Dual Planar Maps

Given a connected planar embedding \(G\), the **dual** \(G^*\) is a planar embedding constructed as follows: \(G^*\) has one vertex for each face of \(G\); two vertices of \(G^*\) are joined by an edge whenever the corresponding faces of \(G\) share a common boundary edge. The edge in \(G^*\) is drawn to cross this common boundary edge.

As the lecturer explains, the dual can be constructed geometrically: place a point inside each face of \(G\), then connect two points with a curve that crosses their shared boundary edge. The key subtlety is that the dual of a simple graph may not be simple — it can have loops (when a face shares an edge with itself, i.e., a bridge is present) and multiple edges (when two faces share more than one boundary edge).

Key relationships: a face of degree \(k\) in \(G\) becomes a vertex of degree \(k\) in \(G^*\), and a vertex of degree \(j\) in \(G\) becomes a face of degree \(j\) in \(G^*\). Thus the Handshaking Lemma for \(G\) (Theorem 4.3.1) becomes the Faceshaking Lemma for \(G^*\) (Theorem 7.1.2), and vice versa. Moreover, \((G^*)^* = G\): the dual of the dual is the original graph.

The connection to graph colouring is this: colouring the regions of a map so that adjacent regions get different colours is exactly colouring the vertices of the dual graph. Translating the Four-Colour Theorem for maps into graph-theoretic language: the dual of any planar embedding is a planar graph, and every planar graph is 4-colourable. Thus every map can be 4-coloured.

The five platonic graphs form two dual pairs and one self-dual: the tetrahedron is self-dual; the cube and octahedron are dual to each other (since \((3,4)\) and \((4,3)\) swap \(d\) and \(d^*\)); and the icosahedron and dodecahedron are dual to each other (swapping \((5,3)\) and \((3,5)\)).

---

## Chapter 8: Matchings

### 8.1 Matching

The matching problem arises naturally in many real-world contexts. Students apply for co-op jobs: match students to jobs so each gets at most one job, and each job has at most one employee. Organ donors are matched to recipients by blood type and other criteria. College applicants are matched to universities. In each case, we have a bipartite structure — two disjoint groups — and a set of permissible pairings, and we want the largest possible matching.

A **matching** in a graph \(G\) is a set \(M\) of edges such that no two edges in \(M\) share a common end. A vertex \(v\) is **saturated** by \(M\) if \(v\) is incident with an edge in \(M\). A **maximum matching** is a largest matching. A **perfect matching** saturates every vertex (size \(p/2\)).

Not every graph has a perfect matching. In a bipartite graph with parts \(A\) and \(B\), a perfect matching requires \(|A| = |B|\) and enough "diversity" in the edge structure. Hall's theorem (Section 8.4) characterises exactly when a perfect matching exists.

An **alternating path** with respect to \(M\) is a path whose edges alternate between being in \(M\) and not in \(M\). An **augmenting path** is an alternating path joining two distinct unsaturated vertices.

<div class="lemma">

<strong>Lemma 8.1.1.</strong> If \(M\) has an augmenting path, it is not a maximum matching.

</div>

The proof is constructive: swapping the matching and non-matching edges along an augmenting path (flipping every edge's membership) produces a larger matching — the path has odd length, so it contributes one more non-matching edge than matching edge. This swap increases \(|M|\) by 1 without creating any vertex conflicts, since the two endpoints of the augmenting path were unsaturated.

The converse is also true (though harder to prove): a matching is maximum if and only if it has no augmenting path. This is the foundation of all maximum-matching algorithms. To enlarge a matching, find an augmenting path and swap. Repeat until none exists.

### 8.2 Covers

A **cover** of a graph \(G\) is a set \(C\) of vertices such that every edge of \(G\) has at least one end in \(C\).

A cover must "touch" every edge, so it must include at least one vertex from every matched edge. In particular, a cover has size at least as large as any matching:

<div class="lemma">

<strong>Lemma 8.2.1.</strong> If \(M\) is a matching of \(G\) and \(C\) is a cover of \(G\), then \(|M| \le |C|\).

</div>

This is a **weak duality** result: the maximum matching size is a lower bound on the minimum cover size. The question is whether equality can be achieved — whether there exist a matching and a cover of the same size. If so, both are simultaneously optimal.

<div class="lemma">

<strong>Lemma 8.2.2.</strong> If \(M\) is a matching and \(C\) is a cover and \(|M| = |C|\), then \(M\) is a maximum matching and \(C\) is a minimum cover.

</div>

Konig's theorem says that for bipartite graphs, equality always holds. This is a **strong duality** result, and it is one of the most beautiful theorems in combinatorics.

### 8.3 Konig's Theorem

<div class="theorem">

<strong>Theorem 8.3.1 (Konig's Theorem).</strong> In a bipartite graph, the maximum size of a matching is the minimum size of a cover.

</div>

The proof is algorithmic and constructive, via the **XY-construction**: given a bipartite graph with bipartition \((A,B)\) and a matching \(M\), let \(X_0\) be the unsaturated vertices of \(A\), let \(Z\) be the set of vertices reachable from \(X_0\) by alternating paths, and define \(X = A \cap Z\), \(Y = B \cap Z\).

The bipartite matching algorithm runs BFS-like exploration to construct \(X\) and \(Y\): start with all unsaturated vertices of \(A\) in \(X_0\); discover their neighbours (put in \(Y\)  via non-matching edges); then follow matching edges back to \(A\) (put in \(X\)); repeat. This alternates between non-matching steps (A→B) and matching steps (B→A).

<div class="lemma">

<strong>Lemma 8.3.2.</strong> Let \(M\) be a matching of bipartite graph \(G\) with bipartition \(A, B\), and let \(X\) and \(Y\) be as defined above. Then:
(a) There is no edge of \(G\) from \(X\) to \(B \setminus Y\).
(b) \(C = Y \cup (A \setminus X)\) is a cover of \(G\).
(c) There is no edge of \(M\) from \(Y\) to \(A \setminus X\).
(d) \(|M| = |C| - |U|\) where \(U\) is the set of unsaturated vertices in \(Y\).
(e) There is an augmenting path to each vertex in \(U\).

</div>

The key insight is that the algorithm terminates with either an augmenting path (which can enlarge the matching) or the construction of a cover \(C = Y \cup (A \setminus X)\) with \(|C| = |M|\) (proving the matching is already maximum). The **bipartite matching algorithm** uses BFS-like exploration to construct \(X\) and \(Y\) in levels, finding augmenting paths and iteratively enlarging the matching until no augmenting path exists.

Konig's theorem is an instance of a general min-max principle that appears throughout combinatorics and optimisation: the minimum of one quantity equals the maximum of another. Similar min-max theorems include Menger's theorem (connecting edge-disjoint paths to cuts), the max-flow min-cut theorem, and LP duality. These results are all related at a deep level through the theory of linear programming and network flows.

### 8.4 Applications of Konig's Theorem

Hall's theorem gives a direct characterisation of when a bipartite graph has a matching that saturates one side. It is sometimes called the **marriage theorem**, based on the following charming formulation: a group of people can all be simultaneously matched to acceptable partners if and only if every subset of \(k\) people collectively has at least \(k\) acceptable partners.

More precisely, suppose we want a matching saturating all of \(A\). A necessary condition is clear: for any subset \(D \subseteq A\), the neighbours \(N(D)\) must have \(|N(D)| \ge |D|\), since each vertex of \(D\) needs a distinct match. Hall's theorem says this necessary condition is also sufficient.

<div class="theorem">

<strong>Theorem 8.4.1 (Hall's Theorem).</strong> A bipartite graph \(G\) with bipartition \(A, B\) has a matching saturating every vertex in \(A\), if and only if every subset \(D\) of \(A\) satisfies
\[
|N(D)| \ge |D|.
\]

</div>

Here \(N(D) = \{v \in V(G) : \exists\, u \in D,\; \{u,v\} \in E(G)\}\) is the **neighbour set** of \(D\).

As the lectures explain with the "marriage metaphor": imagine that each girl has a list of acceptable boys. A perfect matching for the girls exists if and only if Hall's condition holds — no group of \(k\) girls has a combined preference list of fewer than \(k\) boys. The condition captures exactly the situations that would cause a failure: a group of \(k\) girls all attracted to the same \(k-1\) boys cannot all be matched.

The proof follows from Konig's theorem: if Hall's condition holds, one shows that the minimum cover of the bipartite graph has size at least \(|A|\) (by a careful argument using Hall's condition to lower-bound any cover's size), and by weak duality a matching of size \(|A|\) exists.

### 8.5 Systems of Distinct Representatives

Given a collection \(Q_1, Q_2, \ldots, Q_n\) of subsets of a finite set \(Q\), a **system of distinct representatives (SDR)** is a sequence \((q_1, q_2, \ldots, q_n)\) of \(n\) distinct elements of \(Q\) such that \(q_i \in Q_i\) for \(i = 1, 2, \ldots, n\).

The SDR problem is a combinatorial scheduling problem: each set \(Q_i\) represents a set of "eligible representatives" for position \(i\), and we want to choose one from each set with no repetition. This arises in scheduling (assign each task to a time slot it can occupy, with no two tasks in the same slot), Latin squares (fill an \(n \times n\) grid so each row and column contain each symbol exactly once), and transversals of set systems.

Translating to bipartite matching: build a bipartite graph with vertices \(\{1, \ldots, n\}\) on one side (positions) and \(Q\) on the other (representatives), with an edge between \(i\) and \(q\) if \(q \in Q_i\). An SDR is precisely a matching that saturates all of \(\{1, \ldots, n\}\).

<div class="corollary">

<strong>Corollary 8.5.1 (Hall's SDR Theorem).</strong> The collection \(Q_1, Q_2, \ldots, Q_n\) of subsets of the finite set \(Q\) has an SDR if and only if, for every subset \(J\) of \(\{1, 2, \ldots, n\}\), we have
\[
\left|\bigcup_{i \in J} Q_i\right| \ge |J|.
\]

</div>

This is exactly Hall's condition for bipartite graphs: for every set \(J\) of positions, the union of their eligible representative sets must be large enough. The condition has an elegant form: you cannot select more positions than you have eligible representatives to fill them.

### 8.6 Perfect Matchings in Bipartite Graphs

<div class="corollary">

<strong>Corollary 8.6.1.</strong> A bipartite graph \(G\) with bipartition \(A, B\) has a perfect matching if and only if \(|A| = |B|\) and every subset \(D\) of \(A\) satisfies \(|N(D)| \ge |D|\).

</div>

A particularly clean special case arises for regular bipartite graphs. If \(G\) is \(k\)-regular (every vertex has degree exactly \(k\)), then every vertex is in \(k\) edges. For any subset \(D \subseteq A\), count the edges from \(D\) to \(N(D)\): there are exactly \(k|D|\) such edges (since each vertex of \(D\) has degree \(k\)). On the other side, each vertex of \(N(D)\) contributes at most \(k\) of these edges. So \(k|D| \le k|N(D)|\), giving \(|N(D)| \ge |D|\) as required.

<div class="theorem">

<strong>Theorem 8.6.2.</strong> If \(G\) is a \(k\)-regular bipartite graph with \(k \ge 1\), then \(G\) has a perfect matching.

</div>

As the lectures note, a nice example is the 3-cube (the graph \(Q_3\) of the 8 vertices and 12 edges of a cube). It is 3-regular and bipartite (colour vertices by the parity of the number of 1s in their binary label), so it must have a perfect matching. One can exhibit 3 such matchings, partitioning all 12 edges — an edge 3-colouring, consistent with Theorem 8.7.1.

### 8.7 Edge-Colouring

An **edge \(k\)-colouring** of a graph \(G\) is an assignment of one of \(k\) colours to each edge, so that two edges incident with the same vertex receive different colours. Equivalently, it is a partition of the edges into \(k\) matchings.

The minimum number of colours needed to edge-colour \(G\) is at least \(\Delta\) (the maximum degree), since all edges at a maximum-degree vertex need distinct colours. For bipartite graphs, this lower bound is tight.

<div class="theorem">

<strong>Theorem 8.7.1.</strong> A bipartite graph with maximum degree \(\Delta\) has an edge \(\Delta\)-colouring.

</div>

<div class="lemma">

<strong>Lemma 8.7.2.</strong> Let \(G\) be a bipartite graph having at least one edge. Then \(G\) has a matching saturating each vertex of maximum degree.

</div>

The proof of Theorem 8.7.1 is elegant: by induction on \(\Delta\). Find a matching (by Lemma 8.7.2) that saturates all maximum-degree vertices; remove it; the remaining graph has maximum degree \(\Delta - 1\) and is still bipartite; apply the induction hypothesis to get a \((\Delta - 1)\)-edge-colouring; add back the matching with a new colour. This gives a \(\Delta\)-edge-colouring.

For general (non-bipartite) graphs, Vizing's theorem says the minimum edge-colouring uses either \(\Delta\) or \(\Delta + 1\) colours; determining which is NP-hard in general.

### 8.8 An Application to Timetabling

The timetabling problem asks for the minimum number of time slots needed to schedule a set of courses, where each course is taught by a specific instructor and no instructor teaches two courses in the same time slot. This is precisely edge-colouring a bipartite graph: instructors and courses form the two sides, with an edge between instructor \(i\) and course \(c\) if instructor \(i\) teaches course \(c\). A time slot corresponds to a matching (courses scheduled in the same slot must have different instructors), and an edge-colouring gives a valid schedule using \(\Delta\) time slots.

<div class="theorem">

<strong>Theorem 8.8.1.</strong> Let \(G\) be a graph with \(q\) edges, and suppose \(k, m\) are positive integers such that (a) \(G\) has an edge \(k\)-colouring, and (b) \(q \le km\). Then \(G\) has an edge \(k\)-colouring in which every colour is used at most \(m\) times.

</div>

<div class="corollary">

<strong>Corollary 8.8.2.</strong> In a bipartite graph \(G\), there is an edge \(k\)-colouring in which each colour is used at most \(m\) times if and only if (a) \(\Delta \le k\), and (b) \(q \le km\).

</div>

In the timetabling context, this says: if we want a schedule using at most \(k\) time slots with at most \(m\) courses per slot, the conditions are exactly (a) no instructor teaches more than \(k\) courses (so \(\Delta \le k\)) and (b) the total number of courses is at most \(km\). When these conditions hold, the bipartite matching machinery guarantees a valid schedule exists.

The timetabling result illustrates the broader theme of Chapter 8: the abstract theory of matchings, covers, Hall's condition, and Konig's theorem translates directly into practical algorithms for scheduling, assignment, and resource allocation. The mathematical elegance of the theory — particularly the min-max duality of Konig's theorem — is not merely aesthetic; it is the foundation of efficient algorithms that solve these problems optimally.
