---
title: "PMATH 441/641: Algebraic Number Theory"
prof: "David McKinnon"
subjects: "PMATH"
---

These notes synthesize material from multiple sources on algebraic number theory as taught at the University of Waterloo. The following resources were consulted and are gratefully credited:

- **David McKinnon**, *Lecture Notes for PM 441/741*, Department of Pure Mathematics, University of Waterloo, Spring 2024. [PDF](https://uwaterloo.ca/scholar/sites/ca.scholar/files/dmckinno/files/number_theory_notes.pdf)
- **PMATH 441/641 Course Notes**, Department of Pure Mathematics, University of Waterloo, Winter 2000. [PDF](https://uwaterloo.ca/pure-mathematics/sites/default/files/uploads/documents/pmath441_0.pdf)
- **S. New**, *PMATH 441 Lecture Notes* (Chapters 1–6 and Appendix on Continued Fractions), Department of Mathematics, University of Waterloo. [Course page](https://math.uwaterloo.ca/~snew/PMATH441/index.html)
- **Alex Rutar**, *Algebraic Number Theory* (course notes for PMATH 441/641, Winter 2019), University of Waterloo. [GitHub](https://github.com/alexrutar/UWaterloo-Course-Notes/blob/master/pmath/441_notes.pdf)

# Chapter 1: Factorization in Rings

The study of algebraic number theory begins with a careful analysis of factorization in commutative rings. In the familiar setting of the integers, every positive integer greater than 1 factors uniquely as a product of primes. This fundamental theorem of arithmetic, however, is not a universal phenomenon: many rings of algebraic integers fail to enjoy unique factorization, and understanding when and why this failure occurs is one of the central motivations for algebraic number theory. In this chapter, we develop the general theory of divisibility and factorization in commutative rings, establish the hierarchy of Euclidean domains, principal ideal domains, and unique factorization domains, and study concrete examples including the Gaussian integers and polynomial rings.

## Divisibility and Associates

We begin with the most basic notions of divisibility in a commutative ring, generalizing the familiar concepts from the integers.

<div class="definition"><strong>Definition 1.1 (Divisibility and Associates).</strong> Let \(R\) be a commutative ring with identity. Let \(a, b \in R\). We say that <strong>\(a\) divides \(b\)</strong> (or \(a\) is a <strong>divisor</strong> or <strong>factor</strong> of \(b\), or \(b\) is a <strong>multiple</strong> of \(a\)), and we write \(a \mid b\), when \(b = ar\) for some \(r \in R\). We say that \(a\) and \(b\) are <strong>associates</strong>, and we write \(a \sim b\), when \(a \mid b\) and \(b \mid a\).</div>

The relation of divisibility is intimately connected to the containment of principal ideals. The following theorem collects the basic properties of divisibility and associates in commutative rings.

<div class="theorem"><strong>Theorem 1.2 (Properties of Divisibility).</strong> Let \(R\) be a commutative ring. Let \(a, b \in R\). Then:
<ol>
<li>\(a \mid b\) if and only if \(b \in \langle a \rangle\) if and only if \(\langle b \rangle \subseteq \langle a \rangle\).</li>
<li>\(a \sim b\) if and only if \(\langle a \rangle = \langle b \rangle\) if and only if \(a\) and \(b\) have the same multiples and divisors.</li>
<li>\(a \sim 0\) if and only if \(a = 0\) if and only if \(\langle a \rangle = \{0\}\).</li>
<li>\(a \sim 1\) if and only if \(a\) is a unit if and only if \(\langle a \rangle = R\).</li>
<li>If \(R\) is an integral domain, then \(a \sim b\) if and only if \(b = au\) for some unit \(u \in R\).</li>
</ol></div>

<div class="proof"><strong>Proof.</strong> These are straightforward verifications from the definitions. For (1), \(a \mid b\) means \(b = ar\) for some \(r \in R\), which says exactly that \(b \in \langle a \rangle\), and \(b \in \langle a \rangle\) if and only if every multiple of \(b\) is a multiple of \(a\), i.e., \(\langle b \rangle \subseteq \langle a \rangle\). Parts (2)-(4) follow directly from (1). For (5), if \(a \sim b\) then \(b = au\) and \(a = bv\) for some \(u, v \in R\), so \(a = auv\), and since \(R\) is an integral domain and \(a \neq 0\) (the case \(a = b = 0\) being trivial), we get \(uv = 1\), so \(u\) is a unit. The converse is immediate. <span class="qed">∎</span></div>

## Primes and Irreducibles

The integers enjoy the property that an element is prime if and only if it is irreducible. In a general commutative ring, these are distinct concepts, and understanding their relationship is essential.

<div class="definition"><strong>Definition 1.3 (Irreducible and Prime Elements).</strong> Let \(R\) be a commutative ring. Let \(a \in R\) be a non-zero non-unit.
<ul>
<li>We say that \(a\) is <strong>reducible</strong> when \(a = bc\) for some non-units \(b, c \in R\), and otherwise we say that \(a\) is <strong>irreducible</strong>.</li>
<li>We say that \(a\) is <strong>prime</strong> when for all \(b, c \in R\), if \(a \mid bc\) then either \(a \mid b\) or \(a \mid c\).</li>
</ul>
Note that if \(a\) is irreducible, then the only divisors of \(a\) are the units and the associates of \(a\).</div>

The distinction between primes and irreducibles is subtle but important. The property of being prime is fundamentally about divisibility behavior with respect to products, while irreducibility is about the impossibility of non-trivial factorizations. In the integers, these notions coincide, but in more exotic rings they can diverge.

<div class="theorem"><strong>Theorem 1.4 (Associates Preserve Properties).</strong> Let \(R\) be a commutative ring. Let \(a, b \in R\) with \(a \sim b\). Then:
<ol>
<li>\(a = 0\) if and only if \(b = 0\).</li>
<li>\(a\) is a unit if and only if \(b\) is a unit.</li>
<li>\(a\) is irreducible if and only if \(b\) is irreducible.</li>
<li>\(a\) is prime if and only if \(b\) is prime.</li>
</ol></div>

<div class="proof"><strong>Proof.</strong> Since \(a \sim b\), we have \(a \mid b\) and \(b \mid a\), so \(\langle a \rangle = \langle b \rangle\). Parts (1) and (2) follow from Theorem 1.2. For (3), if \(a\) is irreducible and \(b = cd\) for some \(c, d \in R\), then since \(a = bu\) for some unit \(u\), we have \(a = cdu\), and since \(a\) is irreducible, one of \(c\) or \(du\) must be a unit; if \(du\) is a unit then \(d\) is a unit, and if \(c\) is a unit then \(c\) is a unit, so \(b\) is irreducible. For (4), suppose \(a\) is prime and \(b \mid cd\). Since \(a \sim b\), we have \(a \mid cd\), so \(a \mid c\) or \(a \mid d\), giving \(b \mid c\) or \(b \mid d\). <span class="qed">∎</span></div>

The next theorem establishes the fundamental relationship between primes and irreducibles: every prime is irreducible, but the converse may fail.

<div class="theorem"><strong>Theorem 1.5 (Primes are Irreducible).</strong> Let \(R\) be an integral domain. Then every prime element in \(R\) is irreducible.</div>

<div class="proof"><strong>Proof.</strong> Let \(p \in R\) be prime. Since \(p\) is a non-zero non-unit, suppose \(p = ab\) for some \(a, b \in R\). Then \(p \mid ab\), so \(p \mid a\) or \(p \mid b\). Say \(p \mid a\), so \(a = pc\) for some \(c \in R\). Then \(p = ab = pcb\), and since \(R\) is an integral domain and \(p \neq 0\), we get \(cb = 1\), so \(b\) is a unit. Thus \(p\) is irreducible. <span class="qed">∎</span></div>

<div class="example"><strong>Example.</strong> In the ring \(\mathbb{Z}_{12}\), one can verify that the prime elements are \(2, 3, 10, 9\) (and their associates), while for instance \(4\) is irreducible but not prime, since \(4 \mid 2 \cdot 2\) but \(4 \nmid 2\).</div>

<div class="example"><strong>Example.</strong> In the ring \(\mathbb{Z}[\sqrt{-3}i]\), one can find irreducible elements that are not prime. For instance, \(2\) is irreducible but \(2 \mid (1+\sqrt{-3}i)(1-\sqrt{-3}i) = 4\) while \(2\) divides neither factor.</div>

## Prime and Maximal Ideals

The ideal-theoretic perspective on primality and irreducibility provides powerful tools and elegant characterizations through quotient rings.

<div class="definition"><strong>Definition 1.6 (Prime and Maximal Ideals).</strong> Let \(R\) be a ring. An ideal \(P\) in \(R\) is called <strong>prime</strong> when \(P \neq R\) and for all \(a, b \in R\), if \(ab \in P\) then either \(a \in P\) or \(b \in P\). An ideal \(M\) in \(R\) is called <strong>maximal</strong> when \(M \neq R\) and for all ideals \(A\) in \(R\), if \(M \subseteq A\) then either \(A = M\) or \(A = R\).</div>

<div class="example"><strong>Example.</strong> In \(\mathbb{Z}\), the maximal ideals are exactly the ideals \(\langle p \rangle\) where \(p\) is a positive prime number. The prime ideals in \(\mathbb{Z}\) are exactly the ideals \(\langle p \rangle\) where \(p = 0\) or \(p\) is a positive prime.</div>

The connection between elements and ideals is made precise by the following result.

<div class="theorem"><strong>Theorem 1.7 (Elements and Ideals).</strong> Let \(R\) be a commutative ring and let \(a \in R\). Then:
<ol>
<li>\(a\) is prime if and only if \(\langle a \rangle\) is a non-zero prime ideal.</li>
<li>If \(R\) is an integral domain, then \(a\) is irreducible if and only if \(\langle a \rangle\) is maximal amongst non-zero principal ideals.</li>
</ol></div>

<div class="proof"><strong>Proof.</strong> For (1), suppose \(a\) is prime. Then \(a\) is a non-zero non-unit, so \(\langle a \rangle \neq \{0\}\) and \(\langle a \rangle \neq R\). If \(bc \in \langle a \rangle\), then \(a \mid bc\), so \(a \mid b\) or \(a \mid c\), meaning \(b \in \langle a \rangle\) or \(c \in \langle a \rangle\). Conversely, if \(\langle a \rangle\) is a non-zero prime ideal, then \(a \neq 0\) and \(a\) is not a unit (since \(\langle a \rangle \neq R\)), and if \(a \mid bc\) then \(bc \in \langle a \rangle\), so \(b \in \langle a \rangle\) or \(c \in \langle a \rangle\), meaning \(a \mid b\) or \(a \mid c\).

For (2), suppose \(a\) is irreducible and \(\langle a \rangle \subseteq \langle b \rangle\) for some non-zero \(b \in R\). Then \(b \mid a\), so \(a = bc\) for some \(c \in R\). Since \(a\) is irreducible, either \(b\) or \(c\) is a unit. If \(b\) is a unit, then \(\langle b \rangle = R\). If \(c\) is a unit, then \(a \sim b\) and \(\langle a \rangle = \langle b \rangle\). Conversely, if \(\langle a \rangle\) is maximal among non-zero principal ideals and \(a = bc\), then \(\langle a \rangle \subseteq \langle b \rangle\), so either \(\langle a \rangle = \langle b \rangle\) (meaning \(b \sim a\), so \(c\) is a unit) or \(\langle b \rangle = R\) (meaning \(b\) is a unit). <span class="qed">∎</span></div>

The most important characterizations of prime and maximal ideals are through the structure of quotient rings. These results connect the abstract ideal-theoretic notions to the concrete algebraic properties of being an integral domain or a field.

<div class="theorem"><strong>Theorem 1.8 (Prime Ideal Characterization).</strong> Let \(R\) be a commutative ring. Let \(P\) be an ideal in \(R\). Then \(P\) is prime if and only if \(R/P\) is an integral domain.</div>

<div class="proof"><strong>Proof.</strong> Suppose that \(P\) is prime. Since \(P \neq R\), we have \(1 \notin P\), so \(1 + P \neq 0 + P\) in \(R/P\). Since \(R\) is commutative, so is \(R/P\). For the absence of zero divisors, let \(a, b \in R\) and suppose \((a+P)(b+P) = 0 + P\). Then \(ab + P = 0 + P\), so \(ab \in P\). Since \(P\) is prime, \(a \in P\) or \(b \in P\), giving \(a + P = 0 + P\) or \(b + P = 0 + P\).

Conversely, suppose \(R/P\) is an integral domain. Since \(1 + P \neq 0 + P\), we have \(1 \notin P\), so \(P \neq R\). Let \(a, b \in R\) with \(ab \in P\). Then \((a+P)(b+P) = ab + P = 0 + P\). Since \(R/P\) has no zero divisors, \(a + P = 0 + P\) or \(b + P = 0 + P\), so \(a \in P\) or \(b \in P\). <span class="qed">∎</span></div>

<div class="theorem"><strong>Theorem 1.9 (Maximal Ideal Characterization).</strong> Let \(R\) be a commutative ring. Let \(M\) be an ideal in \(R\). Then \(M\) is maximal if and only if \(R/M\) is a field.</div>

<div class="proof"><strong>Proof.</strong> Suppose \(M\) is maximal. Since \(M \neq R\), we have \(1 + M \neq 0 + M\) in \(R/M\), and \(R/M\) is commutative since \(R\) is. Let \(a + M\) be a nonzero element of \(R/M\). We must show it is a unit. Since \(a + M \neq 0 + M\), we have \(a \notin M\), so \(M \subsetneq M + \langle a \rangle\). Since \(M\) is maximal, \(M + \langle a \rangle = R\). In particular, \(1 \in M + \langle a \rangle\), say \(1 = m + ar\) for some \(m \in M\) and \(r \in R\). Then \(1 + M = ar + M = (a+M)(r+M)\), so \(r + M\) is the inverse of \(a + M\).

Conversely, suppose \(R/M\) is a field. Since \(1 + M \neq 0 + M\), we have \(M \neq R\). Let \(I\) be an ideal with \(M \subseteq I \subseteq R\) and \(I \neq M\). Choose \(a \in I\) with \(a \notin M\). Then \(a + M \neq 0 + M\) in \(R/M\), so \(a + M\) has an inverse: \((a+M)(b+M) = 1 + M\) for some \(b\). Then \(1 - ab \in M \subseteq I\), and since \(a \in I\) we have \(ab \in I\), so \(1 \in I\), giving \(I = R\). <span class="qed">∎</span></div>

Since every field is an integral domain, we immediately obtain:

<div class="corollary"><strong>Corollary 1.10.</strong> Every maximal ideal is prime.</div>

These characterizations have immediate and illuminating applications.

<div class="example"><strong>Example.</strong> Since \(\mathbb{Q}[x]/\langle x^2 - 2 \rangle \cong \mathbb{Q}(\sqrt{2})\), which is a field, it follows that \(\langle x^2 - 2 \rangle\) is a maximal (hence prime) ideal of \(\mathbb{Q}[x]\). In \(\mathbb{R}[x]\), however, \(x^2 - 2 = (x - \sqrt{2})(x + \sqrt{2})\), so \(\langle x^2 - 2 \rangle\) is neither maximal nor prime.</div>

<div class="example"><strong>Example.</strong> In \(\mathbb{Z}[x]\), the ideal \(\langle x \rangle = \{f \in \mathbb{Z}[x] : f(0) = 0\}\) is prime because for \(f, g \in \mathbb{Z}[x]\), if \(fg \in \langle x \rangle\) then \(f(0)g(0) = 0\) and so \(f(0) = 0\) or \(g(0) = 0\). But \(\langle x \rangle\) is not maximal since \(\langle x \rangle \subsetneq \langle 2, x \rangle = \{f \in \mathbb{Z}[x] : f(0) \text{ is even}\} \neq \mathbb{Z}[x]\).</div>

## The ED-PID-UFD Hierarchy

The most important classes of integral domains, from the viewpoint of factorization, form a strict chain of inclusions: Euclidean domains are contained in principal ideal domains, which are contained in unique factorization domains. We now develop each class and prove these containments.

<div class="definition"><strong>Definition 1.11 (Euclidean Domain).</strong> A <strong>Euclidean domain</strong> (ED) is an integral domain \(R\) together with a function \(E : R \setminus \{0\} \to \mathbb{N}\), called a <strong>Euclidean norm</strong>, with the property that for all \(a, b \in R\) with \(a \neq 0\), there exist \(q, r \in R\) such that \(b = qa + r\) and either \(r = 0\) or \(E(r) < E(a)\).</div>

<div class="definition"><strong>Definition 1.12 (Principal Ideal Domain).</strong> A <strong>principal ideal domain</strong> (PID) is an integral domain \(R\) such that every ideal \(I\) in \(R\) is principal, i.e., \(I = \langle a \rangle\) for some \(a \in R\).</div>

<div class="definition"><strong>Definition 1.13 (Unique Factorization Domain).</strong> A <strong>unique factorization domain</strong> (UFD) is an integral domain \(R\) with the property that for every nonzero non-unit \(a \in R\):
<ol>
<li>(<em>Existence</em>) \(a = a_1 a_2 \cdots a_\ell\) for some \(\ell \in \mathbb{Z}^+\) and some irreducible elements \(a_i \in R\), and</li>
<li>(<em>Uniqueness</em>) if \(a = a_1 a_2 \cdots a_\ell = b_1 b_2 \cdots b_m\) where each \(a_i\) and \(b_j\) is irreducible, then \(m = \ell\) and for some permutation \(\sigma \in S_m\) we have \(a_i \sim b_{\sigma(i)}\) for all \(i\).</li>
</ol></div>

<div class="example"><strong>Example.</strong> Every field is a Euclidean domain (using any function \(E : R \setminus \{0\} \to \mathbb{N}\) as a Euclidean norm), since given \(a, b \in R\) with \(a \neq 0\), we can take \(q = ba^{-1}\) and \(r = 0\).</div>

<div class="example"><strong>Example.</strong> If \(F\) is a field, then \(F[x]\) is a Euclidean domain with norm \(E(f) = \deg(f)\). This is the familiar polynomial division algorithm.</div>

We now prove the first link in the chain: every Euclidean domain is a principal ideal domain.

<div class="theorem"><strong>Theorem 1.14 (ED implies PID).</strong> Every Euclidean domain is a principal ideal domain.</div>

<div class="proof"><strong>Proof.</strong> Let \(R\) be a Euclidean domain with norm \(E\). Let \(A\) be an ideal in \(R\). If \(A = \{0\}\), then \(A = \langle 0 \rangle\) is principal. Suppose \(A \neq \{0\}\). Choose a nonzero element \(a \in A\) of smallest possible Euclidean norm. We claim \(A = \langle a \rangle\). Since \(a \in A\), we have \(\langle a \rangle \subseteq A\). Let \(b \in A\). Choose \(q, r \in R\) such that \(b = qa + r\) and either \(r = 0\) or \(E(r) < E(a)\). Note that \(r = b - qa \in A\), so by the minimality of \(E(a)\) we must have \(r = 0\). Thus \(b = qa \in \langle a \rangle\). <span class="qed">∎</span></div>

To prove the next implication, we first need a chain condition on ideals.

<div class="definition"><strong>Definition 1.15 (Noetherian Ring).</strong> A ring \(R\) is called <strong>Noetherian</strong> when it satisfies the <strong>ascending chain condition</strong>: for every ascending chain of ideals \(A_1 \subseteq A_2 \subseteq A_3 \subseteq \cdots\) in \(R\), there exists \(n \in \mathbb{Z}^+\) such that \(A_k = A_n\) for all \(k \geq n\).</div>

<div class="theorem"><strong>Theorem 1.16 (PID implies Noetherian).</strong> Every principal ideal domain is Noetherian.</div>

<div class="proof"><strong>Proof.</strong> Let \(R\) be a principal ideal domain and let \(\langle a_1 \rangle \subseteq \langle a_2 \rangle \subseteq \langle a_3 \rangle \subseteq \cdots\) be an ascending chain of ideals. Let \(A = \bigcup_{k=1}^{\infty} \langle a_k \rangle\). Then \(A\) is an ideal in \(R\), so \(A = \langle a \rangle\) for some \(a \in R\). Since \(a \in A\), we can choose \(n \in \mathbb{Z}^+\) with \(a \in \langle a_n \rangle\). For all \(k \geq n\), we have \(\langle a_k \rangle \subseteq A = \langle a \rangle \subseteq \langle a_n \rangle \subseteq \langle a_k \rangle\), so \(\langle a_k \rangle = \langle a_n \rangle\). <span class="qed">∎</span></div>

Now we establish the second link in the chain, which is the deepest result in this section.

<div class="theorem"><strong>Theorem 1.17 (PID implies UFD).</strong> Every principal ideal domain is a unique factorization domain.</div>

<div class="proof"><strong>Proof.</strong> Let \(R\) be a principal ideal domain and let \(a \in R\) be a nonzero non-unit. We must establish both existence and uniqueness of factorization into irreducibles.

<strong>Existence of an irreducible factor.</strong> If \(a\) is irreducible, we are done. Otherwise, \(a = a_1 b_1\) where \(a_1, b_1\) are non-units, and \(\langle a \rangle \subsetneq \langle a_1 \rangle\). If \(a_1\) is irreducible, we are done. Otherwise, \(a_1 = a_2 b_2\) with \(a_2, b_2\) non-units, and \(\langle a \rangle \subsetneq \langle a_1 \rangle \subsetneq \langle a_2 \rangle\). Continuing, this process must terminate since \(R\) is Noetherian (Theorem 1.16), yielding an irreducible factor \(a_n\) of \(a\).

<strong>Existence of a complete factorization.</strong> If \(a\) is irreducible, we are done. Otherwise, let \(a_1\) be an irreducible factor of \(a\), say \(a = a_1 b_1\). Then \(b_1\) is not a unit (since \(a\) is reducible while \(a_1\) is irreducible). If \(b_1\) is irreducible, we are done. Otherwise, let \(a_2\) be an irreducible factor of \(b_1\), say \(b_1 = a_2 b_2\). Continuing, we obtain \(\langle a \rangle \subsetneq \langle b_1 \rangle \subsetneq \langle b_2 \rangle \subsetneq \cdots\). By the Noetherian property, this chain must stabilize, so eventually some \(b_n\) is irreducible and \(a = a_1 a_2 \cdots a_n b_n\).

<strong>Uniqueness.</strong> Suppose \(a = a_1 a_2 \cdots a_\ell = b_1 b_2 \cdots b_m\) where each \(a_i\) and \(b_j\) is irreducible. Since \(a_1 \mid b_1 b_2 \cdots b_m\), and since \(a_1\) is irreducible in a PID, the ideal \(\langle a_1 \rangle\) is maximal among nonzero principal ideals (Theorem 1.7), hence is a nonzero maximal ideal (in a PID, maximal among principal ideals means maximal), hence prime (Corollary 1.10), so \(a_1\) is prime. Thus \(a_1 \mid b_k\) for some \(k\). After reindexing, we may assume \(a_1 \mid b_1\). Since \(b_1\) is irreducible and \(a_1\) is not a unit, \(a_1 \sim b_1\), say \(b_1 = a_1 u\) for some unit \(u\). Then \(a_1 a_2 \cdots a_\ell = a_1 u b_2 \cdots b_m\), and by cancellation \(a_2 \cdots a_\ell = u b_2 \cdots b_m\). By induction, \(\ell = m\) and \(a_i \sim b_i\) after a suitable permutation of \(b_2, \ldots, b_m\). <span class="qed">∎</span></div>

<div class="remark"><strong>Remark.</strong> The implications ED \(\Rightarrow\) PID \(\Rightarrow\) UFD are strict. One can show that the ring \(\mathbb{Z}\left[\frac{1+\sqrt{-19}}{2}\right]\) is a PID but not a Euclidean domain under any norm. Similarly, the polynomial ring \(\mathbb{Z}[x]\) is a UFD but not a PID (since the ideal \(\langle 2, x \rangle\) is not principal).</div>

![Ring hierarchy: ED ⊊ PID ⊊ UFD ⊊ Integral Domain as nested ovals with examples](/pics/pmath441/ring-hierarchy.svg)

<div class="example"><strong>Example.</strong> For each \(d \in \{-2, -1, 2, 3\}\), the ring \(\mathbb{Z}[\sqrt{d}]\) is a Euclidean domain with Euclidean norm \(N(a + b\sqrt{d}) = |a^2 - db^2|\).</div>

<div class="example"><strong>Example.</strong> The rings \(\mathbb{Z}[\sqrt{-3}i]\) and \(\mathbb{Z}[\sqrt{-5}]\) are not unique factorization domains. For instance, in \(\mathbb{Z}[\sqrt{-5}]\), we have \(6 = 2 \cdot 3 = (1+\sqrt{-5})(1-\sqrt{-5})\), giving two essentially different factorizations into irreducibles.</div>

## Gaussian Integers

The ring of Gaussian integers \(\mathbb{Z}[i] = \{a + bi : a, b \in \mathbb{Z}\}\) is one of the most important examples in algebraic number theory. It is a Euclidean domain with norm \(N(a+bi) = a^2 + b^2\), and hence a UFD. The classification of its prime elements provides a beautiful connection between the arithmetic of \(\mathbb{Z}[i]\) and the representation of integers as sums of two squares.

<div class="theorem"><strong>Theorem 1.18 (Primes in the Gaussian Integers).</strong> Every prime element in the ring \(\mathbb{Z}[i]\) is an associate of exactly one of the following elements:
<ol>
<li>\(1 + i\),</li>
<li>\(p\), where \(p\) is a prime number in \(\mathbb{Z}^+\) with \(p \equiv 3 \pmod{4}\),</li>
<li>\(x + iy\), where \(x, y \in \mathbb{Z}\) with \(0 < y \leq x\) and \(x^2 + y^2 = p\) for some prime number \(p \in \mathbb{Z}^+\) with \(p \equiv 1 \pmod{4}\).</li>
</ol></div>

<div class="proof"><strong>Proof.</strong> Since \(\mathbb{Z}[i]\) is a Euclidean domain (hence a PID, hence a UFD), primes and irreducibles coincide. The norm \(N : \mathbb{Z}[i] \to \mathbb{N}\) given by \(N(a+bi) = a^2 + b^2\) is multiplicative: \(N(\alpha\beta) = N(\alpha)N(\beta)\). The units in \(\mathbb{Z}[i]\) are exactly the elements of norm 1, i.e., \(\{1, -1, i, -i\}\).

Let \(\pi\) be a prime in \(\mathbb{Z}[i]\). Then \(\pi \mid \pi\bar{\pi} = N(\pi) \in \mathbb{Z}^+\), so \(\pi\) divides some rational prime \(p\). Write \(p = \pi \alpha\) in \(\mathbb{Z}[i]\), so \(p^2 = N(p) = N(\pi)N(\alpha)\). Since \(\pi\) is not a unit, \(N(\pi) > 1\), so \(N(\pi) = p\) or \(N(\pi) = p^2\).

<strong>Case 1:</strong> \(N(\pi) = p\). Then \(p = a^2 + b^2\) where \(\pi = a + bi\). This requires \(p = 2\) (giving \(\pi \sim 1+i\)) or \(p \equiv 1 \pmod{4}\) (by Fermat's theorem on sums of two squares).

<strong>Case 2:</strong> \(N(\pi) = p^2\). Then \(N(\alpha) = 1\), so \(\alpha\) is a unit and \(\pi \sim p\). Taking norms, \(p^2 = N(\pi)\), so \(p\) is irreducible in \(\mathbb{Z}[i]\). If \(p \equiv 1 \pmod{4}\), then \(p = a^2 + b^2\) for some integers \(a, b\), giving \(p = (a+bi)(a-bi)\) with both factors non-units, contradicting irreducibility. If \(p = 2\), then \(2 = -i(1+i)^2\) is not irreducible. Thus \(p \equiv 3 \pmod{4}\).

Conversely, one verifies that each element listed is indeed prime. <span class="qed">∎</span></div>

This classification leads to the classical characterization of which positive integers are representable as sums of two squares.

<div class="corollary"><strong>Corollary 1.19 (Sums of Two Squares).</strong> Let \(n \in \mathbb{Z}^+\) factor as

\[
n = 2^m \cdot \prod_\alpha p_\alpha^{k_\alpha} \cdot \prod_\beta q_\beta^{\ell_\beta}
\]
where \(m \in \mathbb{N}\), \(k_\alpha, \ell_\beta \in \mathbb{Z}^+\), the \(p_\alpha\) are distinct primes with \(p_\alpha \equiv 1 \pmod{4}\), and the \(q_\beta\) are distinct primes with \(q_\beta \equiv 3 \pmod{4}\). Then there exists a solution \((x, y) \in \mathbb{Z}^2\) to \(x^2 + y^2 = n\) if and only if each exponent \(\ell_\beta\) is even, and in this case the number of solutions \((x, y) \in \mathbb{Z}^2\) is equal to \(4 \prod_\alpha (k_\alpha + 1)\).</div>

### Units in Quadratic Integer Rings

The structure of units in quadratic integer rings is governed by a remarkable theorem that connects to Pell's equation.

<div class="theorem"><strong>Theorem 1.20 (Units in Quadratic Integer Rings).</strong> Let \(d \in \mathbb{Z}^+\) be a non-square. Then there exists a unique smallest unit \(u \in \mathbb{Z}[\sqrt{d}]\) with \(u > 1\), and the set of all units in \(\mathbb{Z}[\sqrt{d}]\) is \(\mathbb{Z}[\sqrt{d}]^* = \{\pm u^k : k \in \mathbb{Z}\}\).</div>

<div class="corollary"><strong>Corollary 1.21 (Pell's Equation).</strong> Let \(d \in \mathbb{Z}^+\) be a non-square and let \(u\) be the smallest unit in \(\mathbb{Z}[\sqrt{d}]\) with \(u > 1\). For \(k \geq 0\), write \(u^k = p_k + q_k \sqrt{d}\) with \(p_k, q_k \in \mathbb{Z}\). Then the solutions \((x, y) \in \mathbb{Z}^2\) to Pell's equation \(x^2 - dy^2 = \pm 1\) are given by \((x, y) = (\pm p_k, \pm q_k)\) for \(k \geq 0\).</div>

## Polynomial Rings

The theory of polynomials over integral domains provides essential tools for algebraic number theory. We collect here the key results about polynomial division, irreducibility criteria, and the passage between \(\mathbb{Z}[x]\) and \(\mathbb{Q}[x]\).

### The Division Algorithm and its Consequences

<div class="theorem"><strong>Theorem 1.22 (Division Algorithm for Polynomials).</strong> Let \(R\) be a ring. Let \(f, g \in R[x]\) and suppose that the leading coefficient of \(g\) is a unit in \(R\). Then there exist unique polynomials \(q, r \in R[x]\) such that \(f = qg + r\) and \(\deg(r) < \deg(g)\).</div>

<div class="proof"><strong>Proof.</strong> <strong>Existence.</strong> If \(\deg(f) < \deg(g)\), take \(q = 0\) and \(r = f\). Suppose \(\deg(f) \geq \deg(g)\). Write \(f(x) = \sum_{i=0}^n a_i x^i\) with \(a_n \neq 0\) and \(g(x) = \sum_{i=0}^m b_i x^i\) with \(b_m\) a unit. Then the polynomial \(f(x) - a_n b_m^{-1} x^{n-m} g(x)\) has degree less than \(n\). By induction, there exist \(p, r \in R[x]\) with \(f(x) - a_n b_m^{-1} x^{n-m} g(x) = p(x)g(x) + r(x)\) and \(\deg(r) < \deg(g)\). Setting \(q(x) = a_n b_m^{-1} x^{n-m} + p(x)\) gives \(f = qg + r\).

<strong>Uniqueness.</strong> Suppose \(f = qg + r = pg + s\) with \(\deg(r), \deg(s) < \deg(g)\). Then \((q-p)g = s - r\). Since the leading coefficient of \(g\) is a unit (hence not a zero divisor), \(\deg((q-p)g) = \deg(q-p) + \deg(g)\). If \(q - p \neq 0\), then \(\deg((q-p)g) \geq \deg(g)\), contradicting \(\deg(s-r) < \deg(g)\). Thus \(q = p\) and \(r = s\). <span class="qed">∎</span></div>

Two classical and frequently used consequences of the division algorithm are the Remainder and Factor theorems.

<div class="corollary"><strong>Corollary 1.23 (Remainder Theorem).</strong> Let \(R\) be a ring, let \(f \in R[x]\), and let \(a \in R\). When we divide \(f(x)\) by \((x - a)\), the remainder is the constant polynomial \(r(x) = f(a)\).</div>

<div class="corollary"><strong>Corollary 1.24 (Factor Theorem).</strong> Let \(R\) be a commutative ring, let \(f \in R[x]\), and let \(a \in R\). Then \(f(a) = 0\) if and only if \((x - a) \mid f(x)\).</div>

<div class="theorem"><strong>Theorem 1.25 (Roots Theorem).</strong> Let \(R\) be an integral domain, let \(0 \neq f \in R[x]\), and let \(n = \deg(f)\). Then \(f\) has at most \(n\) distinct roots in \(R\).</div>

<div class="proof"><strong>Proof.</strong> By induction on \(n\). If \(\deg(f) = 0\), then \(f\) is a nonzero constant with no roots. Let \(n \geq 1\) and assume every polynomial of degree \(n-1\) has at most \(n-1\) roots. If \(a\) is a root of \(f\), by the Factor Theorem \(f(x) = (x-a)g(x)\) for some \(g \in R[x]\) with \(\deg(g) = n - 1\). By induction, \(g\) has at most \(n-1\) roots. If \(b \neq a\) is another root of \(f\), then \(0 = (b-a)g(b)\), and since \(R\) is an integral domain and \(b - a \neq 0\), we get \(g(b) = 0\). Thus every root of \(f\) other than \(a\) is a root of \(g\), giving at most \(1 + (n-1) = n\) roots total. <span class="qed">∎</span></div>

### Gauss' Lemma and Irreducibility Criteria

To transfer irreducibility questions between \(\mathbb{Z}[x]\) and \(\mathbb{Q}[x]\), we need the notion of content and the fundamental result of Gauss.

<div class="definition"><strong>Definition 1.26 (Content and Primitive Polynomials).</strong> Let \(f \in \mathbb{Z}[x]\). The <strong>content</strong> of \(f\), denoted \(c(f)\), is the greatest common divisor of the coefficients of \(f\). We say that \(f\) is <strong>primitive</strong> when \(c(f) = 1\).</div>

<div class="theorem"><strong>Theorem 1.27 (Gauss' Lemma).</strong>
<ol>
<li>For all \(f, g \in \mathbb{Z}[x]\), we have \(c(fg) = c(f)c(g)\). In particular, the product of primitive polynomials is primitive.</li>
<li>Let \(0 \neq f \in \mathbb{Z}[x]\) and let \(g(x) = \frac{1}{c(f)} f(x) \in \mathbb{Z}[x]\). Then \(f\) is irreducible in \(\mathbb{Q}[x]\) if and only if \(g\) is irreducible in \(\mathbb{Z}[x]\).</li>
</ol></div>

<div class="proof"><strong>Proof.</strong> <strong>Part (1).</strong> If \(f = 0\) or \(g = 0\), then \(c(fg) = 0 = c(f)c(g)\). Suppose \(f, g \neq 0\). Let \(h(x) = \frac{1}{c(f)} f(x)\) and \(k(x) = \frac{1}{c(g)} g(x)\), so \(h, k \in \mathbb{Z}[x]\) with \(c(h) = c(k) = 1\) and \(fg = c(f)c(g)hk\), giving \(c(fg) = c(f)c(g)c(hk)\). It suffices to show \(c(hk) = 1\).

Write \(h(x) = \sum_{i=0}^n a_i x^i\) and \(k(x) = \sum_{i=0}^m b_i x^i\). Suppose for contradiction that some prime \(p\) divides \(c(hk)\). Since \(c(h) = 1\), choose the smallest index \(r\) with \(p \nmid a_r\). Since \(c(k) = 1\), choose the smallest index \(s\) with \(p \nmid b_s\). The coefficient of \(x^{r+s}\) in \(hk\) is

\[
c_{r+s} = a_0 b_{r+s} + \cdots + a_r b_s + \cdots + a_{r+s} b_0.
\]
Since \(p \mid c_{r+s}\) and \(p \mid a_i\) for \(i < r\) and \(p \mid b_j\) for \(j < s\), it follows that \(p \mid a_r b_s\). Since \(p\) is prime, \(p \mid a_r\) or \(p \mid b_s\), contradicting our choices.

<strong>Part (2).</strong> Let \(g(x) = \frac{1}{c(f)} f(x)\) so \(c(g) = 1\).

Suppose \(g\) is reducible in \(\mathbb{Z}[x]\), say \(g = hk\) with \(h, k\) non-units in \(\mathbb{Z}[x]\). Since \(c(h)c(k) = c(g) = 1\), both \(h\) and \(k\) are primitive, hence nonconstant. Then \(f = c(f)g = c(f) \cdot h \cdot k\), and since \(c(f)h\) and \(k\) are nonconstant in \(\mathbb{Q}[x]\), \(f\) is reducible in \(\mathbb{Q}[x]\).

Conversely, suppose \(f\) is reducible in \(\mathbb{Q}[x]\), say \(f = h \cdot k\) with \(h, k\) nonconstant in \(\mathbb{Q}[x]\). Clearing denominators and dividing out content, write \(h = \frac{c(ah)}{a} p\) and \(k = \frac{c(bk)}{b} q\) where \(p, q \in \mathbb{Z}[x]\) are primitive and nonconstant. Then \(f = c(ah)c(bk) \cdot pq / (ab)\), and comparing content yields \(g = pq\), a product of nonconstant polynomials in \(\mathbb{Z}[x]\). <span class="qed">∎</span></div>

<div class="corollary"><strong>Corollary 1.28.</strong> Let \(0 \neq f(x) \in \mathbb{Z}[x]\). Then \(f(x)\) is reducible in \(\mathbb{Q}[x]\) if and only if \(f(x)\) can be factored as a product of two nonconstant polynomials in \(\mathbb{Z}[x]\).</div>

This powerful result means that to test irreducibility over \(\mathbb{Q}\), we need only look for factorizations over \(\mathbb{Z}\).

<div class="theorem"><strong>Theorem 1.29 (Rational Roots Test).</strong> Let \(f(x) = \sum_{i=0}^n c_i x^i\) where \(n \in \mathbb{Z}^+\), each \(c_i \in \mathbb{Z}\), and \(c_n \neq 0\). Let \(r, s \in \mathbb{Z}\) with \(s \neq 0\) and \(\gcd(r, s) = 1\). If \(f(r/s) = 0\), then \(r \mid c_0\) and \(s \mid c_n\).</div>

<div class="proof"><strong>Proof.</strong> From \(f(r/s) = 0\), multiplying by \(s^n\) gives

\[
0 = c_0 s^n + c_1 s^{n-1} r + \cdots + c_n r^n.
\]
Thus \(r \mid c_0 s^n\). Since \(\gcd(r, s) = 1\), we have \(\gcd(r, s^n) = 1\), so \(r \mid c_0\). Similarly, \(s \mid c_n r^n\) and \(\gcd(s, r^n) = 1\) give \(s \mid c_n\). <span class="qed">∎</span></div>

The next two results provide efficient irreducibility tests that avoid the need to search for factorizations directly.

<div class="theorem"><strong>Theorem 1.30 (Modular Reduction).</strong> Let \(f(x) = \sum_{i=0}^n c_i x^i\) with \(n \in \mathbb{Z}^+\), \(c_i \in \mathbb{Z}\), and \(c_n \neq 0\). Let \(p\) be a prime with \(p \nmid c_n\). Let \(\bar{f}(x) = \sum_{i=0}^n \bar{c}_i x^i \in \mathbb{Z}_p[x]\) where \(\bar{c}_i = [c_i] \in \mathbb{Z}_p\). If \(\bar{f}\) is irreducible in \(\mathbb{Z}_p[x]\), then \(f\) is irreducible in \(\mathbb{Q}[x]\).</div>

<div class="proof"><strong>Proof.</strong> We prove the contrapositive. Suppose \(f\) is reducible in \(\mathbb{Q}[x]\). By Corollary 1.28, choose nonconstant \(g, h \in \mathbb{Z}[x]\) with \(f = gh\). Write \(g(x) = \sum a_i x^i\) with leading coefficient \(a_k \neq 0\) and \(h(x) = \sum b_i x^i\) with leading coefficient \(b_\ell \neq 0\), where \(k, \ell \geq 1\). Since \(c_n = a_k b_\ell\) and \(p \nmid c_n\), we have \(p \nmid a_k\) and \(p \nmid b_\ell\). Thus \(\bar{g}\) has degree \(k\) and \(\bar{h}\) has degree \(\ell\), both nonconstant, and \(\bar{f} = \bar{g}\bar{h}\) is reducible in \(\mathbb{Z}_p[x]\). <span class="qed">∎</span></div>

<div class="theorem"><strong>Theorem 1.31 (Eisenstein's Criterion).</strong> Let \(f(x) = \sum_{i=0}^n c_i x^i\) with \(n \in \mathbb{Z}^+\), \(c_i \in \mathbb{Z}\), and \(c_n \neq 0\). Let \(p\) be a prime such that \(p \mid c_i\) for \(0 \leq i < n\), \(p \nmid c_n\), and \(p^2 \nmid c_0\). Then \(f\) is irreducible in \(\mathbb{Q}[x]\).</div>

<div class="proof"><strong>Proof.</strong> Suppose for contradiction that \(f\) is reducible in \(\mathbb{Q}[x]\). By Corollary 1.28, write \(f = gh\) with \(g(x) = \sum_{i=0}^k a_i x^i\) and \(h(x) = \sum_{i=0}^\ell b_i x^i\) nonconstant in \(\mathbb{Z}[x]\). Since \(c_0 = a_0 b_0\) and \(p \mid c_0\) but \(p^2 \nmid c_0\), exactly one of \(a_0, b_0\) is divisible by \(p\). Say \(p \mid a_0\) and \(p \nmid b_0\).

Since \(p \mid c_1 = a_0 b_1 + a_1 b_0\) and \(p \mid a_0\), we get \(p \mid a_1 b_0\), and since \(p \nmid b_0\), we get \(p \mid a_1\). Continuing inductively, \(p \mid c_j\) for \(j < n\) and \(p \mid a_i\) for \(i < j\) together imply \(p \mid a_j b_0\), hence \(p \mid a_j\). In particular, \(p \mid a_k\). But then \(p \mid a_k b_\ell = c_n\), contradicting \(p \nmid c_n\). <span class="qed">∎</span></div>

<div class="example"><strong>Example.</strong> The polynomial \(f(x) = 5x^5 + 3x^4 - 18x^3 + 12x + 6\) is irreducible in \(\mathbb{Q}[x]\) by Eisenstein's criterion with \(p = 3\): we have \(3 \mid 6\), \(3 \mid 12\), \(3 \mid (-18)\), \(3 \mid 3\), \(3 \nmid 5\), and \(9 \nmid 6\).</div>

<div class="example"><strong>Example.</strong> Let \(p\) be a prime. The cyclotomic polynomial \(\Phi_p(x) = 1 + x + x^2 + \cdots + x^{p-1}\) is irreducible in \(\mathbb{Q}[x]\). To see this, apply the substitution \(x \mapsto x + 1\) and then use Eisenstein's criterion with the prime \(p\).</div>

### Exercises

<div class="definition"><strong>Exercise 1.1.</strong> Find all primes and irreducible elements in \(\mathbb{Z}_{12}\).</div>

<div class="definition"><strong>Exercise 1.2.</strong> For each \(d \in \{-2, -1, 2, 3\}\), show that \(\mathbb{Z}[\sqrt{d}]\) is a Euclidean domain with Euclidean norm \(N(a + b\sqrt{d}) = |a^2 - db^2|\).</div>

<div class="definition"><strong>Exercise 1.3.</strong> Show that the rings \(\mathbb{Z}[\sqrt{-3}i]\) and \(\mathbb{Z}[\sqrt{-5}]\) are not unique factorization domains.</div>

<div class="definition"><strong>Exercise 1.4.</strong> List all monic reducible and irreducible polynomials in \(\mathbb{Z}_2[x]\) of degree less than 4, then determine the number of irreducible polynomials in \(\mathbb{Z}_2[x]\) of degree 4.</div>

<div class="definition"><strong>Exercise 1.5.</strong> Prove that \(f(x) = x^5 + 2x + 4\) is irreducible in \(\mathbb{Q}[x]\) by working in \(\mathbb{Z}_3[x]\).</div>

<div class="definition"><strong>Exercise 1.6.</strong> Let \(p\) be a prime. Show that \(f(x) = 1 + x + x^2 + \cdots + x^{p-1}\) is irreducible in \(\mathbb{Q}[x]\).</div>

<div class="definition"><strong>Exercise 1.7.</strong> Show that \(\sqrt{1 + \sqrt{2}} \notin \mathbb{Q}\).</div>

---

# Chapter 2: Field Extensions and Galois Theory

Galois theory is one of the crown jewels of algebra, providing a profound correspondence between the structure of field extensions and the structure of groups of automorphisms. This chapter develops the theory of field extensions, embeddings, and normal extensions, culminating in the Fundamental Theorem of Galois Theory. Throughout, we work with subfields of \(\mathbb{C}\), which simplifies several technical aspects while retaining all the essential ideas needed for algebraic number theory.

## Field Extensions and Degree

<div class="definition"><strong>Definition 2.1 (Field Extension and Degree).</strong> Let \(F\) and \(K\) be fields with \(F \subseteq K\). We say that \(K\) is an <strong>extension field</strong> of \(F\) (or \(F\) is a <strong>subfield</strong> of \(K\)), and we write \(K/F\). The field \(K\) is naturally a vector space over \(F\), and we write \([K : F] = \dim_F K\) for the <strong>degree</strong> of the extension. If \([K : F] < \infty\), we say \(K\) is a <strong>finite extension</strong> of \(F\).</div>

The degree of an extension is the single most important numerical invariant. The following result shows that degrees are multiplicative in towers, which is the field-theoretic analogue of the dimension formula for nested vector spaces.

<div class="theorem"><strong>Theorem 2.2 (Tower Law).</strong> Let \(F\), \(K\), and \(L\) be fields with \(F \subseteq K \subseteq L\). Then

\[
[L : F] = [K : F] \cdot [L : K].
\]
More precisely, if \(U\) is a basis for \(K\) over \(F\) and \(V\) is a basis for \(L\) over \(K\), then \(\{uv : u \in U, v \in V\}\) is a basis for \(L\) over \(F\).</div>

<div class="proof"><strong>Proof.</strong> Let \(U = \{u_i\}\) be a basis for \(K/F\) and \(V = \{v_j\}\) a basis for \(L/K\). We show \(W = \{u_i v_j\}\) is a basis for \(L/F\).

<strong>Spanning.</strong> Let \(a \in L\). Since \(V\) spans \(L/K\), write \(a = \sum_j s_j v_j\) with \(s_j \in K\). Since \(U\) spans \(K/F\), write each \(s_j = \sum_i r_{ij} u_i\) with \(r_{ij} \in F\). Then \(a = \sum_{i,j} r_{ij} u_i v_j\), so \(W\) spans \(L/F\).

<strong>Linear independence.</strong> Suppose \(\sum_{i,j} r_{ij} u_i v_j = 0\) with \(r_{ij} \in F\). Then \(\sum_j \left(\sum_i r_{ij} u_i\right) v_j = 0\). Since each \(\sum_i r_{ij} u_i \in K\) and \(V\) is linearly independent over \(K\), we get \(\sum_i r_{ij} u_i = 0\) for each \(j\). Since \(U\) is linearly independent over \(F\), we get \(r_{ij} = 0\) for all \(i, j\). <span class="qed">∎</span></div>

## Algebraic Elements and Minimal Polynomials

The key dichotomy for elements in field extensions is whether they satisfy a polynomial equation or not. This distinction governs the entire structure theory.

<div class="definition"><strong>Definition 2.3 (Generated Subring and Subfield).</strong> Let \(R\) and \(S\) be commutative rings with \(R \subseteq S\) and let \(U \subseteq S\). The <strong>subring of \(S\) generated by \(U\) over \(R\)</strong>, denoted \(R[U]\), is the smallest subring of \(S\) containing \(R \cup U\). When \(U = \{u_1, \ldots, u_n\}\), we write \(R[u_1, \ldots, u_n]\) and we have

\[
R[u_1, \ldots, u_n] = \{f(u_1, \ldots, u_n) : f \in R[x_1, \ldots, x_n]\}.
\]
When \(F\) and \(K\) are fields with \(F \subseteq K\) and \(U \subseteq K\), the <strong>subfield of \(K\) generated by \(U\) over \(F\)</strong>, denoted \(F(U)\), is the smallest subfield of \(K\) containing \(F \cup U\). When \(U = \{u_1, \ldots, u_n\}\), we have

\[
F(u_1, \ldots, u_n) = \left\{\frac{f(u_1, \ldots, u_n)}{g(u_1, \ldots, u_n)} : f, g \in F[x_1, \ldots, x_n],\; g(u_1, \ldots, u_n) \neq 0\right\}.
\]
</div>

<div class="definition"><strong>Definition 2.4 (Algebraic and Transcendental Elements).</strong> Let \(F\) and \(K\) be fields with \(F \subseteq K\). An element \(a \in K\) is <strong>algebraic over \(F\)</strong> if there exists a nonzero polynomial \(f(x) \in F[x]\) such that \(f(a) = 0\); otherwise \(a\) is <strong>transcendental over \(F\)</strong>. We say \(K\) is <strong>algebraic over \(F\)</strong> if every element of \(K\) is algebraic over \(F\).</div>

The fundamental structure theorem for simple extensions tells us that the algebraic/transcendental dichotomy completely determines the structure of \(F(a)\).

<div class="theorem"><strong>Theorem 2.5 (Structure of Simple Extensions).</strong> Let \(F\) and \(K\) be fields with \(F \subseteq K\) and let \(a \in K\).
<ol>
<li>If \(a\) is transcendental over \(F\), then \(F[a] \cong F[x]\) and \(F(a) \cong F(x)\) (the field of rational functions). In this case \([F(a) : F] = \infty\) and the set \(\{1, a, a^2, \ldots\}\) is linearly independent over \(F\).</li>
<li>If \(a\) is algebraic over \(F\), then there exists a unique monic irreducible polynomial \(f(x) \in F[x]\) with \(f(a) = 0\). The ideal generated by this polynomial satisfies \(\langle f \rangle = \{g \in F[x] : g(a) = 0\}\), and we have

\[
F(a) = F[a] \cong F[x]/\langle f \rangle.
\]
Setting \(n = \deg(f)\), the set \(\{1, a, a^2, \ldots, a^{n-1}\}\) is a basis for \(F(a)\) over \(F\) and \([F(a) : F] = n\).</li>
</ol></div>

<div class="proof"><strong>Proof.</strong> Consider the evaluation homomorphism \(\phi : F[x] \to K\) defined by \(\phi(g) = g(a)\). Its image is \(F[a]\) and its kernel is \(\ker(\phi) = \{g \in F[x] : g(a) = 0\}\).

<strong>(1)</strong> If \(a\) is transcendental, then \(\ker(\phi) = \{0\}\), so \(\phi\) is injective and \(F[a] \cong F[x]\). Since \(F[x]\) is an integral domain, \(F(a)\) is its field of fractions, isomorphic to \(F(x)\).

<strong>(2)</strong> If \(a\) is algebraic, then \(\ker(\phi) \neq \{0\}\). Since \(F[x]\) is a PID, \(\ker(\phi) = \langle f \rangle\) for some monic polynomial \(f\). We claim \(f\) is irreducible. If \(f = gh\) with \(g, h\) nonconstant, then \(0 = f(a) = g(a)h(a)\). Since \(K\) is a field (hence an integral domain), \(g(a) = 0\) or \(h(a) = 0\), contradicting the minimality of \(\deg(f)\) among nonzero elements of \(\ker(\phi)\). By the first isomorphism theorem, \(F[a] \cong F[x]/\langle f \rangle\). Since \(f\) is irreducible in the PID \(F[x]\), \(\langle f \rangle\) is maximal, so \(F[x]/\langle f \rangle\) is a field, giving \(F[a] = F(a)\). The images of \(1, x, \ldots, x^{n-1}\) form a basis for \(F[x]/\langle f \rangle\), so \(\{1, a, \ldots, a^{n-1}\}\) is a basis for \(F(a)/F\). <span class="qed">∎</span></div>

<div class="definition"><strong>Definition 2.6 (Minimal Polynomial).</strong> When \(F \subseteq K\) are fields and \(a \in K\) is algebraic over \(F\), the unique monic irreducible polynomial \(f(x) \in F[x]\) with \(f(a) = 0\) is called the <strong>minimal polynomial</strong> of \(a\) over \(F\). Its degree is the <strong>degree</strong> of \(a\) over \(F\).</div>

The minimal polynomial interacts well with extensions of the base field:

<div class="corollary"><strong>Corollary 2.7.</strong> Let \(F \subseteq K \subseteq L\) be fields and let \(a \in L\). If \(f(x) \in F[x]\) is the minimal polynomial of \(a\) over \(F\) and \(g(x) \in K[x]\) is the minimal polynomial of \(a\) over \(K\), then \(g(x) \mid f(x)\) in \(K[x]\).</div>

<div class="proof"><strong>Proof.</strong> Since \(f(a) = 0\) and \(f(x) \in F[x] \subseteq K[x]\), and since \(g\) generates the kernel of evaluation at \(a\) in \(K[x]\), we have \(g \mid f\) in \(K[x]\). <span class="qed">∎</span></div>

<div class="example"><strong>Example.</strong> Consider \(\sqrt{-5}\), which has minimal polynomial \(x^2 + 5\) over \(\mathbb{Q}\). Then \([\mathbb{Q}(\sqrt{-5}) : \mathbb{Q}] = 2\) and \(\{1, \sqrt{-5}\}\) is a basis for \(\mathbb{Q}(\sqrt{-5})\) over \(\mathbb{Q}\).</div>

<div class="example"><strong>Example.</strong> The element \(\zeta = e^{2\pi i/3}\) has minimal polynomial \(x^2 + x + 1\) over \(\mathbb{Q}\), so \([\mathbb{Q}(\zeta) : \mathbb{Q}] = 2\) and \(\mathbb{Q}(\zeta) = \{a + b\zeta : a, b \in \mathbb{Q}\}\).</div>

The following results establish fundamental properties of algebraic extensions.

<div class="corollary"><strong>Corollary 2.8.</strong> Let \(F \subseteq K\) be fields. Then \([K : F]\) is finite if and only if \(K\) is algebraic and finitely generated as a field over \(F\).</div>

<div class="proof"><strong>Proof.</strong> If \([K : F] = n < \infty\), then any \(a \in K\) satisfies a nontrivial \(F\)-linear relation among \(\{1, a, \ldots, a^n\}\), so \(a\) is algebraic over \(F\). Moreover, any basis \(\{u_1, \ldots, u_n\}\) generates \(K\) as a field over \(F\). Conversely, if \(K = F(a_1, \ldots, a_m)\) with each \(a_i\) algebraic, then by the tower law applied to the chain \(F \subseteq F(a_1) \subseteq F(a_1, a_2) \subseteq \cdots \subseteq K\), each step has finite degree, so \([K : F]\) is finite. <span class="qed">∎</span></div>

<div class="corollary"><strong>Corollary 2.9 (Transitivity of Algebraicity).</strong> Let \(F \subseteq K \subseteq L\) be fields. If \(L\) is algebraic over \(K\) and \(K\) is algebraic over \(F\), then \(L\) is algebraic over \(F\).</div>

<div class="proof"><strong>Proof.</strong> Let \(a \in L\). Since \(a\) is algebraic over \(K\), choose a polynomial \(f(x) = \sum_{i=0}^n c_i x^i \in K[x]\) with \(f(a) = 0\). Consider the tower

\[
F \subseteq F(c_0) \subseteq F(c_0, c_1) \subseteq \cdots \subseteq F(c_0, \ldots, c_{n-1}) \subseteq F(c_0, \ldots, c_{n-1}, a).
\]
Each \(c_i\) is algebraic over \(F\), so each step \(F(c_0, \ldots, c_{i-1}) \subseteq F(c_0, \ldots, c_i)\) has finite degree. The final step also has finite degree since \(a\) is a root of \(f(x) \in F(c_0, \ldots, c_{n-1})[x]\). By the tower law, \([F(c_0, \ldots, c_{n-1}, a) : F]\) is finite, so \(a\) is algebraic over \(F\). <span class="qed">∎</span></div>

## Conjugates and Embeddings

The notion of conjugates generalizes the familiar idea that a quadratic irrational \(\alpha = a + b\sqrt{d}\) has a conjugate \(\bar{\alpha} = a - b\sqrt{d}\). More generally, the conjugates of an algebraic element are the roots of its minimal polynomial, and they are intimately connected to field embeddings.

<div class="definition"><strong>Definition 2.10 (Conjugates).</strong> Let \(K \subseteq \mathbb{C}\) be a field and let \(\theta \in \mathbb{C}\) be algebraic over \(K\) with minimal polynomial \(p(x) \in K[x]\). The roots \(\theta_1, \theta_2, \ldots, \theta_n\) of \(p\) in \(\mathbb{C}\) (where \(\theta = \theta_1\)) are called the <strong>conjugates</strong> of \(\theta\) over \(K\).</div>

<div class="definition"><strong>Definition 2.11 (Embeddings and Automorphisms).</strong> Let \(K, L, M\) be fields with \(K \subseteq L \subseteq M\). An <strong>embedding</strong> of \(L\) into \(M\) is an injective ring homomorphism \(\phi : L \to M\). An <strong>automorphism</strong> of \(L\) is a bijective ring homomorphism \(\phi : L \to L\). We say \(\phi\) <strong>fixes \(K\)</strong> (or is <strong>\(K\)-fixing</strong>) when \(\phi(x) = x\) for all \(x \in K\). We write

\[
\operatorname{Hom}_K(L, M) = \{\text{\(K\)-fixing embeddings } \phi : L \to M\}
\]

\[
\operatorname{Aut}_K(L) = \{\text{\(K\)-fixing automorphisms } \phi : L \to L\}.
\]
Note that \(\operatorname{Aut}_K(L)\) is a group under composition and \(\operatorname{Aut}_K(L) \subseteq \operatorname{Hom}_K(L, M)\).</div>

The following observation will be used repeatedly: for finite extensions, an embedding whose image lands inside the source must be an automorphism.

<div class="proposition"><strong>Proposition 2.12.</strong> Let \(K \subseteq L \subseteq M\) be fields with \([L : K]\) finite. For \(\phi \in \operatorname{Hom}_K(L, M)\), we have \(\phi \in \operatorname{Aut}_K(L)\) if and only if \(\phi(L) \subseteq L\).</div>

<div class="proof"><strong>Proof.</strong> If \(\phi \in \operatorname{Aut}_K(L)\), then \(\phi(L) = L\). Conversely, suppose \(\phi(L) \subseteq L\). Since \(\phi\) fixes \(K\), we have \(K \subseteq \phi(L)\). Since \(\phi : L \to \phi(L)\) is a \(K\)-fixing isomorphism, if \(\{u_1, \ldots, u_n\}\) is a basis for \(L/K\), then \(\{\phi(u_1), \ldots, \phi(u_n)\}\) is a basis for \(\phi(L)/K\). Thus \([\phi(L) : K] = [L : K]\). Since \(K \subseteq \phi(L) \subseteq L\) and \([\phi(L) : K] = [L : K]\), we get \(\phi(L) = L\). <span class="qed">∎</span></div>

## The Separability of Subfields of C

Before proving the embedding extension theorem, we need the crucial fact that irreducible polynomials over subfields of \(\mathbb{C}\) have no repeated roots. This is the separability property, which holds automatically in characteristic zero.

<div class="theorem"><strong>Theorem 2.13 (Separability).</strong> Let \(K\) be a field with \(\mathbb{Q} \subseteq K \subseteq \mathbb{C}\) and let \(f(x) \in K[x]\). If \(f(x)\) is irreducible in \(K[x]\), then \(f(x)\) has no multiple roots in \(\mathbb{C}\).</div>

<div class="proof"><strong>Proof.</strong> Suppose \(f(x)\) has a multiple root \(a \in \mathbb{C}\), so \((x-a)^2 \mid f(x)\) in \(\mathbb{C}[x]\). Then \((x-a) \mid f'(x)\) in \(\mathbb{C}[x]\). Let \(d(x) = \gcd(f(x), f'(x))\) in \(K[x]\), computed via the Euclidean algorithm. Since \((x-a)\) divides both \(f\) and \(f'\) in \(\mathbb{C}[x]\), we have \(\deg(d) \geq 1\). Since \(d \mid f'\) and \(\deg(f') = \deg(f) - 1\), we have \(\deg(d) < \deg(f)\). Since \(d \mid f\) in \(K[x]\) with \(1 \leq \deg(d) < \deg(f)\), the polynomial \(f\) is reducible in \(K[x]\), a contradiction. <span class="qed">∎</span></div>

<div class="remark"><strong>Remark.</strong> This result uses characteristic zero in an essential way: \(f'(x) \neq 0\) whenever \(f\) has degree \(\geq 1\) and the characteristic is zero. In positive characteristic, there exist irreducible inseparable polynomials (such as \(x^p - t\) over \(\mathbb{F}_p(t)\)).</div>

## The Embedding Extension Theorem

The embedding extension theorem is the engine that drives the entire theory of field extensions and Galois theory. It tells us exactly how many ways an embedding can be extended when we adjoin an algebraic element.

<div class="theorem"><strong>Theorem 2.14 (Embedding Extension Theorem).</strong> Let \(K\) be a field with \(\mathbb{Q} \subseteq K \subseteq \mathbb{C}\). Let \(a \in \mathbb{C}\) be algebraic over \(K\) with \(n = [K(a) : K]\). Then every embedding \(\phi : K \to \mathbb{C}\) extends to exactly \(n\) embeddings of \(K(a)\) into \(\mathbb{C}\).</div>

<div class="proof"><strong>Proof.</strong> Let \(\phi : K \to \mathbb{C}\) be an embedding and let \(f(x) = \sum_{i=0}^n c_i x^i \in K[x]\) be the minimal polynomial of \(a\) over \(K\). Define \(g(x) = \sum_{i=0}^n \phi(c_i) x^i \in \phi(K)[x]\). Since \(\phi : K \to \phi(K)\) is an isomorphism, and \(f\) is irreducible of degree \(n\) in \(K[x]\), the polynomial \(g\) is irreducible of degree \(n\) in \(\phi(K)[x]\). By separability (Theorem 2.13), \(g\) has \(n\) distinct roots \(b_1, b_2, \ldots, b_n\) in \(\mathbb{C}\).

Let \(\psi : K(a) \to \mathbb{C}\) be any embedding extending \(\phi\). Since \(\psi(c_i) = \phi(c_i)\), applying \(\psi\) to \(f(a) = 0\) gives \(g(\psi(a)) = 0\). Thus \(\psi(a)\) must be one of \(b_1, \ldots, b_n\).

Conversely, for each root \(b_k\), the formula

\[
\psi_k\left(\sum_{i=0}^{n-1} r_i a^i\right) = \sum_{i=0}^{n-1} \phi(r_i) b_k^i
\]
defines an embedding \(\psi_k : K(a) \to \mathbb{C}\) extending \(\phi\) with \(\psi_k(a) = b_k\). This is well-defined since \(\{1, a, \ldots, a^{n-1}\}\) is a basis for \(K(a)/K\), and one verifies it is an injective ring homomorphism. Thus there are exactly \(n\) extensions. <span class="qed">∎</span></div>

By the Primitive Element Theorem (which we prove below), this generalizes immediately:

<div class="corollary"><strong>Corollary 2.15.</strong> Let \(K \subseteq L \subseteq \mathbb{C}\) with \([L : K] = n < \infty\). Then every embedding of \(K\) into \(\mathbb{C}\) extends to exactly \(n\) embeddings of \(L\) into \(\mathbb{C}\). In particular, \(|\operatorname{Hom}_K(L, \mathbb{C})| = [L : K]\).</div>

<div class="proof"><strong>Proof.</strong> By the Primitive Element Theorem (Theorem 2.17), \(L = K(a)\) for some \(a \in L\). The result follows from Theorem 2.14. Alternatively, one can prove this by induction on \([L:K]\): if \([L:K] > 1\), pick \(a \in L \setminus K\) and apply Theorem 2.14 to the extension \(K(a)/K\), then use induction for \(L/K(a)\), with the tower law giving \([L:K(a)] \cdot [K(a):K] = [L:K]\) embeddings in total. <span class="qed">∎</span></div>

<div class="example"><strong>Example.</strong> Consider \(\mathbb{Q}(\sqrt{d})/\mathbb{Q}\) for a squarefree integer \(d\). The minimal polynomial of \(\sqrt{d}\) is \(x^2 - d\), which has roots \(\pm\sqrt{d}\). The two embeddings of \(\mathbb{Q}(\sqrt{d})\) into \(\mathbb{C}\) fixing \(\mathbb{Q}\) are \(\sigma_1 : \sqrt{d} \mapsto \sqrt{d}\) (the identity) and \(\sigma_2 : \sqrt{d} \mapsto -\sqrt{d}\).</div>

<div class="example"><strong>Example.</strong> Consider \(\mathbb{Q}(\sqrt[3]{2})/\mathbb{Q}\). The minimal polynomial of \(\sqrt[3]{2}\) is \(x^3 - 2\), with roots \(\sqrt[3]{2}\), \(\omega\sqrt[3]{2}\), and \(\omega^2\sqrt[3]{2}\), where \(\omega = e^{2\pi i/3}\). The three embeddings of \(\mathbb{Q}(\sqrt[3]{2})\) into \(\mathbb{C}\) fixing \(\mathbb{Q}\) are determined by \(\sqrt[3]{2} \mapsto \omega^k \sqrt[3]{2}\) for \(k = 0, 1, 2\). Note that only the identity maps \(\mathbb{Q}(\sqrt[3]{2})\) into itself (since \(\omega\sqrt[3]{2} \notin \mathbb{R}\)), so \(|\operatorname{Aut}_\mathbb{Q}(\mathbb{Q}(\sqrt[3]{2}))| = 1 < 3 = [\mathbb{Q}(\sqrt[3]{2}) : \mathbb{Q}]\).</div>

## The Primitive Element Theorem

The Primitive Element Theorem asserts that every finite extension of subfields of \(\mathbb{C}\) is simple, i.e., generated by a single element. This is a remarkably powerful simplification.

<div class="theorem"><strong>Theorem 2.17 (Primitive Element Theorem).</strong> Let \(K\) and \(L\) be fields with \(\mathbb{Q} \subseteq K \subseteq L \subseteq \mathbb{C}\). If \([L : K]\) is finite, then there exists an element \(a \in L\) such that \(L = K(a)\).</div>

<div class="proof"><strong>Proof.</strong> Since \([L : K]\) is finite, write \(L = K(u_1, u_2, \ldots, u_n)\) for some basis elements \(u_i\). It suffices to show that for any \(u, v \in L\), there exists \(w \in L\) with \(K(u, v) = K(w)\), since then we can inductively reduce the number of generators.

Let \(u, v \in L\). Let \(f(x) \in K[x]\) be the minimal polynomial of \(u\) over \(K\) with roots \(a_1 = u, a_2, \ldots, a_k\) in \(\mathbb{C}\), and let \(g(x) \in K[x]\) be the minimal polynomial of \(v\) over \(K\) with roots \(b_1 = v, b_2, \ldots, b_\ell\) in \(\mathbb{C}\). Choose \(t \in K\) such that \(t \neq -\frac{u - a_i}{v - b_j}\) for any pair of indices \((i, j)\) with \((i,j) \neq (1,1)\). Such a choice is possible since \(K\) is infinite (as it contains \(\mathbb{Q}\)). Let \(w = u + tv\).

Clearly \(w \in K(u, v)\), so \(K(w) \subseteq K(u, v)\). We claim \(K(u, v) \subseteq K(w)\). Consider the polynomial \(h(x) = f(w - tx) \in K(w)[x]\). Note that \(h(v) = f(w - tv) = f(u) = 0\) and \(g(v) = 0\). If \(x \in \mathbb{C}\) is a common root of \(g\) and \(h\), then \(g(x) = 0\) implies \(x = b_j\) for some \(j\), and \(h(x) = 0\) implies \(f(w - tx) = 0\), so \(w - tb_j = a_i\) for some \(i\), giving \(t = \frac{w - a_i}{b_j} = \frac{u + tv - a_i}{b_j}\). If \(b_j \neq v\), then \(t = -\frac{u - a_i}{v - b_j}\) for some \((i, j) \neq (1,1)\), contradicting our choice of \(t\). Thus \(v\) is the only common root of \(g\) and \(h\).

Let \(d(x) = \gcd(g(x), h(x))\) in \(K(w)[x]\). Since \(v\) is the only common root and all roots are simple (by separability), \(d(x) = (x - v)\). Since \(d(x) \in K(w)[x]\), it follows that \(v \in K(w)\). Then \(u = w - tv \in K(w)\), so \(K(u, v) \subseteq K(w)\). <span class="qed">∎</span></div>

<div class="remark"><strong>Remark.</strong> The proof uses the separability of irreducible polynomials over subfields of \(\mathbb{C}\) (which follows from characteristic zero) and the infinitude of \(K\). Over finite fields, the Primitive Element Theorem still holds, but for a different reason: every finite extension of a finite field is cyclic, hence simple.</div>

## Normal Extensions

Not every finite extension is "well-behaved" from the Galois-theoretic perspective. The concept of normality isolates those extensions for which the Galois group achieves its maximum possible size.

<div class="definition"><strong>Definition 2.18 (Normal Extension).</strong> Let \(K \subseteq L \subseteq \mathbb{C}\) with \([L : K] < \infty\). We say \(L\) is a <strong>normal extension</strong> of \(K\) if \(L\) is closed under taking conjugates over \(K\): whenever \(\alpha \in L\) and \(\beta\) is a conjugate of \(\alpha\) over \(K\), then \(\beta \in L\).</div>

<div class="example"><strong>Example.</strong> The extension \(\mathbb{Q}(\sqrt{d})/\mathbb{Q}\) is normal for any squarefree \(d\). If \(\alpha = a + b\sqrt{d} \in \mathbb{Q}(\sqrt{d})\), its conjugate \(a - b\sqrt{d}\) is also in \(\mathbb{Q}(\sqrt{d})\).</div>

<div class="example"><strong>Example.</strong> The extension \(\mathbb{Q}(\sqrt[3]{2})/\mathbb{Q}\) is <strong>not</strong> normal. Indeed, \(\sqrt[3]{2} \in \mathbb{Q}(\sqrt[3]{2})\) but its conjugate \(\omega\sqrt[3]{2} \notin \mathbb{Q}(\sqrt[3]{2})\) since \(\omega\sqrt[3]{2} \notin \mathbb{R}\) while \(\mathbb{Q}(\sqrt[3]{2}) \subseteq \mathbb{R}\). This is the prototypical example of a non-normal extension.</div>

The next theorem gives several equivalent characterizations of normality, each useful in different contexts.

<div class="definition"><strong>Definition 2.19 (Splitting Field).</strong> Let \(K \subseteq L \subseteq \mathbb{C}\) be fields and let \(f(x) \in K[x]\). We say \(f(x)\) <strong>splits in \(L\)</strong> if \(f(x)\) factors completely into linear factors in \(L[x]\). We say \(L\) is the <strong>splitting field</strong> of \(f(x)\) over \(K\) if \(L = K(a_1, \ldots, a_n)\), where \(a_1, \ldots, a_n\) are all the roots of \(f(x)\) in \(\mathbb{C}\).</div>

<div class="theorem"><strong>Theorem 2.20 (Characterizations of Normality).</strong> Let \(K \subseteq L \subseteq \mathbb{C}\) with \([L : K]\) finite. The following are equivalent:
<ol>
<li>\(|\operatorname{Aut}_K(L)| = [L : K]\).</li>
<li>\(\operatorname{Hom}_K(L, \mathbb{C}) = \operatorname{Aut}_K(L)\).</li>
<li>For every \(a \in L\), the minimal polynomial of \(a\) over \(K\) splits in \(L\).</li>
<li>\(L\) is the splitting field of some polynomial \(f(x) \in K[x]\).</li>
</ol></div>

<div class="proof"><strong>Proof.</strong> <strong>(1) \(\Leftrightarrow\) (2):</strong> By Corollary 2.15, \(|\operatorname{Hom}_K(L, \mathbb{C})| = [L : K]\). Since \(\operatorname{Aut}_K(L) \subseteq \operatorname{Hom}_K(L, \mathbb{C})\), we have \(|\operatorname{Aut}_K(L)| = [L : K]\) if and only if \(\operatorname{Aut}_K(L) = \operatorname{Hom}_K(L, \mathbb{C})\).

<strong>(2) \(\Rightarrow\) (3):</strong> Suppose \(\operatorname{Hom}_K(L, \mathbb{C}) = \operatorname{Aut}_K(L)\). Let \(a \in L\) and let \(f(x) \in K[x]\) be the minimal polynomial of \(a\) over \(K\), with roots \(a_1 = a, a_2, \ldots, a_m\) in \(\mathbb{C}\). The identity embedding \(\operatorname{id} : K \hookrightarrow \mathbb{C}\) extends to \(m\) embeddings \(\phi_j : K(a) \to \mathbb{C}\) with \(\phi_j(a) = a_j\). Each \(\phi_j\) extends to at least one embedding \(\psi_j : L \to \mathbb{C}\). Since \(\psi_j\) fixes \(K\), we have \(\psi_j \in \operatorname{Hom}_K(L, \mathbb{C}) = \operatorname{Aut}_K(L)\). Therefore \(a_j = \psi_j(a) \in L\) for all \(j\), so \(f\) splits in \(L\).

<strong>(3) \(\Rightarrow\) (4):</strong> By the Primitive Element Theorem, choose \(a \in L\) with \(L = K(a)\). Let \(f(x)\) be the minimal polynomial of \(a\) with roots \(a_1, \ldots, a_n\). By hypothesis, each \(a_i \in L\), so \(L = K(a) = K(a_1, \ldots, a_n)\) is the splitting field of \(f\).

<strong>(4) \(\Rightarrow\) (1):</strong> Let \(L\) be the splitting field of \(f(x) \in K[x]\) with roots \(a_1, \ldots, a_n \in L\). We use an inductive construction. If \(f\) splits completely in \(K\), then \(L = K\) and \(|\operatorname{Aut}_K(L)| = 1 = [L:K]\). Otherwise, let \(g_1(x) \in K[x]\) be a nonlinear irreducible factor of \(f\) with roots \(a_{1,1}, \ldots, a_{1,\ell_1}\). The identity extends to \(\ell_1\) embeddings \(\phi_{j_1} : K(a_{1,1}) \to \mathbb{C}\) with \(\phi_{j_1}(a_{1,1}) = a_{1,j_1}\). Since all roots lie in \(L\), the image lands in \(L\). Continuing inductively through a tower \(K \subset K(a_{1,1}) \subset K(a_{1,1}, a_{2,1}) \subset \cdots = L\), we obtain \(\ell_1 \ell_2 \cdots \ell_m = [L:K]\) embeddings, each of which maps \(L\) into \(L\) (since images of roots of \(f\) are roots of \(f\), hence in \(L\)). By Proposition 2.12, these are all automorphisms, giving \(|\operatorname{Aut}_K(L)| = [L:K]\). <span class="qed">∎</span></div>

<div class="definition"><strong>Definition 2.21 (Galois Extension).</strong> When \(K \subseteq L \subseteq \mathbb{C}\) with \([L : K]\) finite, we say that \(L\) is <strong>Galois over \(K\)</strong> when the equivalent conditions of Theorem 2.20 hold.</div>

<div class="corollary"><strong>Corollary 2.22.</strong> Let \(K \subseteq \mathbb{C}\) and let \(\alpha_1, \ldots, \alpha_n \in \mathbb{C}\) be algebraic over \(K\). Then \(L = K(\alpha_1, \ldots, \alpha_n)\) is normal over \(K\) if all the conjugates of each \(\alpha_i\) lie in \(L\).</div>

<div class="proof"><strong>Proof.</strong> Let \(\sigma : L \hookrightarrow \mathbb{C}\) be an embedding fixing \(K\). By the Primitive Element Theorem, \(L = K(\theta)\) where \(\theta = f(\alpha_1, \ldots, \alpha_n)\) for some \(f \in K[x_1, \ldots, x_n]\). Then \(\sigma(\theta) = f(\sigma(\alpha_1), \ldots, \sigma(\alpha_n))\). Since each \(\sigma(\alpha_i)\) is a conjugate of \(\alpha_i\), hence in \(L\) by hypothesis, we have \(\sigma(\theta) \in L\). Thus \(\sigma(L) \subseteq L\), so \(\sigma \in \operatorname{Aut}_K(L)\) by Proposition 2.12. <span class="qed">∎</span></div>

<div class="corollary"><strong>Corollary 2.23 (Existence of Normal Closure).</strong> Let \(K \subseteq L \subseteq \mathbb{C}\) with \([L : K]\) finite. Then there exists a finite extension \(H/L\) with \(H \subseteq \mathbb{C}\) such that \(H\) is normal over \(K\).</div>

<div class="proof"><strong>Proof.</strong> By the Primitive Element Theorem, \(L = K(\theta)\). Let \(\theta_1, \ldots, \theta_n\) be the conjugates of \(\theta\) over \(K\). Set \(H = K(\theta_1, \ldots, \theta_n)\). By Corollary 2.22, \(H\) is normal over \(K\), and clearly \(H \supseteq L\). <span class="qed">∎</span></div>

<div class="example"><strong>Example.</strong> The extension \(\mathbb{Q}(\sqrt[3]{2})/\mathbb{Q}\) is not normal. Its normal closure is \(H = \mathbb{Q}(\sqrt[3]{2}, \omega\sqrt[3]{2}, \omega^2\sqrt[3]{2}) = \mathbb{Q}(\sqrt[3]{2}, \omega)\), where \(\omega = e^{2\pi i/3}\). We have \([H : \mathbb{Q}] = 6\), since \([H : \mathbb{Q}(\sqrt[3]{2})] = 2\) and \([\mathbb{Q}(\sqrt[3]{2}) : \mathbb{Q}] = 3\).</div>

<div class="remark"><strong>Remark.</strong> If \(L/K\) is normal and \(F\) is an intermediate field (\(K \subseteq F \subseteq L\)), then \(L/F\) is also normal. This is because the conjugates of any \(\alpha \in L\) over \(F\) form a subset of the conjugates of \(\alpha\) over \(K\), which all lie in \(L\) by the normality of \(L/K\). However, \(F/K\) need not be normal.</div>

## Galois Groups and the Fundamental Theorem

We now arrive at the central construction of Galois theory: the Galois group of a normal extension, and the correspondence between subgroups and intermediate fields.

<div class="definition"><strong>Definition 2.24 (Galois Group and Fixed Field).</strong> Let \(K \subseteq L \subseteq \mathbb{C}\) be fields. The <strong>Galois group</strong> of \(L\) over \(K\) is the group \(\operatorname{Gal}(L/K) = \operatorname{Aut}_K(L)\). For a subgroup \(H \leq \operatorname{Gal}(L/K)\), the <strong>fixed field</strong> of \(H\) is

\[
\operatorname{Fix}(H) = L^H = \{x \in L : \sigma(x) = x \text{ for all } \sigma \in H\}.
\]
One verifies directly that \(L^H\) is a subfield of \(L\).</div>

<div class="remark"><strong>Remark.</strong> Recall that \(|\operatorname{Gal}(L/K)| \leq [L : K]\), with equality if and only if \(L/K\) is normal (i.e., Galois). When \(L/K\) is Galois, the Galois group is as large as it can possibly be.</div>

Before stating the Fundamental Theorem, we establish a key preliminary result that shows the fixed field and Galois group operations are well-behaved.

<div class="theorem"><strong>Theorem 2.25.</strong> Let \(K \subseteq L \subseteq \mathbb{C}\) with \(L/K\) a finite normal extension, and let \(G = \operatorname{Gal}(L/K)\). Then:
<ol>
<li>\(L^G = K\).</li>
<li>If \(H \leq G\) with \(L^H = K\), then \(H = G\).</li>
</ol></div>

<div class="proof"><strong>Proof.</strong> <strong>(1)</strong> We show \(L^G = K\). Clearly \(K \subseteq L^G\). Since \(L/K\) is normal, every \(K\)-fixing embedding \(\sigma : L \hookrightarrow \mathbb{C}\) is an automorphism of \(L\), i.e., \(\sigma \in G\). So \(\sigma\) fixes \(L^G\). The number of embeddings of \(L\) fixing \(L^G\) is at most \([L : L^G]\), but there are \([L : K]\) of them (since they are all the \(K\)-fixing embeddings). Thus

\[
[L : K] \leq [L : L^G] \leq [L : K],
\]
so \([L^G : K] = 1\) and \(L^G = K\).

<strong>(2)</strong> Suppose \(L^H = K\). Write \(L = K(\alpha)\) by the Primitive Element Theorem and consider the polynomial

\[
f(x) = \prod_{\sigma \in H} (x - \sigma(\alpha)).
\]
The coefficients of \(f\) are elementary symmetric polynomials in the \(\sigma(\alpha)\), and for any \(\tau \in H\), the map \(\sigma \mapsto \tau\sigma\) permutes \(H\), so \(\tau\) permutes the roots \(\{\sigma(\alpha)\}\) and fixes each coefficient. Thus the coefficients lie in \(L^H = K\), so \(f(x) \in K[x]\). Since \(\operatorname{id} \in H\), \(f(\alpha) = 0\), and \(\deg(f) = |H|\). The minimal polynomial of \(\alpha\) over \(K\) has degree at most \(|H|\), so

\[
[L : K] = [K(\alpha) : K] \leq |H| \leq |G| = [L : K].
\]
Therefore \(|H| = |G|\), and since \(H \leq G\), we conclude \(H = G\). <span class="qed">∎</span></div>

We are now ready for the main theorem, which establishes a perfect dictionary between the lattice of intermediate fields and the lattice of subgroups of the Galois group.

<div class="theorem"><strong>Theorem 2.26 (Fundamental Theorem of Galois Theory).</strong> Let \(K \subseteq L \subseteq \mathbb{C}\) with \(L/K\) a finite normal extension, and let \(G = \operatorname{Gal}(L/K)\). Let \(F\) be an intermediate field (\(K \subseteq F \subseteq L\)).
<ol>
<li>\(L^{\operatorname{Gal}(L/F)} = F\).</li>
<li>If \(H \leq G\), then \(\operatorname{Gal}(L/L^H) = H\).</li>
<li>\(F/K\) is normal if and only if \(\operatorname{Gal}(L/F) \trianglelefteq \operatorname{Gal}(L/K)\). In this case,

\[
\operatorname{Gal}(F/K) \cong \operatorname{Gal}(L/K) / \operatorname{Gal}(L/F).
\]
</li>
</ol>
In particular, the maps \(F \mapsto \operatorname{Gal}(L/F)\) and \(H \mapsto L^H\) are mutually inverse, inclusion-reversing bijections between the set of intermediate fields \(K \subseteq F \subseteq L\) and the set of subgroups \(H \leq G\).</div>

<div class="proof"><strong>Proof.</strong> <strong>(i)</strong> Since \(L/K\) is normal and \(K \subseteq F \subseteq L\), the extension \(L/F\) is also normal (the conjugates of any element of \(L\) over \(F\) are a subset of its conjugates over \(K\), all of which lie in \(L\)). By Theorem 2.25(1) applied to \(L/F\), we get \(L^{\operatorname{Gal}(L/F)} = F\).

<strong>(ii)</strong> Let \(H' = \operatorname{Gal}(L/L^H)\). By definition, \(H\) fixes \(L^H\), so \(H \leq H'\). Since \(L/L^H\) is normal (as it is a sub-extension of the normal extension \(L/K\)), and \(H \leq \operatorname{Gal}(L/L^H)\) has \(L^H\) as its fixed field, Theorem 2.25(2) gives \(H = H'\).

<strong>(iii)</strong> Let \(H = \operatorname{Gal}(L/F)\). For \(\sigma \in G\), the map \(\sigma|_F : F \to \sigma(F)\) is an isomorphism, and one computes \(\sigma H \sigma^{-1} = \operatorname{Gal}(L/\sigma(F))\). Therefore:

\[
H \trianglelefteq G \iff \operatorname{Gal}(L/\sigma(F)) = \operatorname{Gal}(L/F) \text{ for all } \sigma \in G \iff \sigma(F) = F \text{ for all } \sigma \in G.
\]
The condition \(\sigma(F) = F\) for all \(\sigma \in G\) means exactly that every \(K\)-fixing automorphism of \(L\) maps \(F\) into itself, which (since each such restriction \(\sigma|_F : F \to F\) is an automorphism) is equivalent to \(F/K\) being normal.

When \(H \trianglelefteq G\), the restriction map \(\operatorname{Gal}(L/K) \to \operatorname{Gal}(F/K)\) given by \(\sigma \mapsto \sigma|_F\) is a well-defined group homomorphism (since \(\sigma(F) = F\)). Its kernel is \(\{\sigma \in G : \sigma|_F = \operatorname{id}_F\} = \operatorname{Gal}(L/F) = H\). By the first isomorphism theorem, \(\operatorname{Gal}(F/K) \cong G/H\). <span class="qed">∎</span></div>

<div class="remark"><strong>Remark.</strong> The Fundamental Theorem transforms questions about field extensions into questions about finite groups, which are in principle completely classifiable. For instance, the intermediate fields of a Galois extension \(L/K\) correspond bijectively to the subgroups of \(\operatorname{Gal}(L/K)\), with normal subextensions corresponding to normal subgroups.</div>

<div class="example"><strong>Example.</strong> Consider the normal closure \(H = \mathbb{Q}(\sqrt[3]{2}, \omega)/\mathbb{Q}\). This is a Galois extension of degree 6. The Galois group \(\operatorname{Gal}(H/\mathbb{Q})\) is isomorphic to \(S_3\), the symmetric group on three elements, since the automorphisms permute the three roots \(\sqrt[3]{2}, \omega\sqrt[3]{2}, \omega^2\sqrt[3]{2}\) of \(x^3 - 2\). The subgroup lattice of \(S_3\) has subgroups \(\{e\}\), three copies of \(\mathbb{Z}/2\mathbb{Z}\), one copy of \(\mathbb{Z}/3\mathbb{Z}\) (which is normal), and \(S_3\) itself. These correspond, respectively, to the intermediate fields \(H\), three quadratic extensions, the unique intermediate field \(\mathbb{Q}(\omega)\) (which is normal over \(\mathbb{Q}\), consistent with \(\mathbb{Z}/3\mathbb{Z} \trianglelefteq S_3\)), and \(\mathbb{Q}\).</div>

![Field extension tower: ℚ ⊂ ℚ(∛2) ⊂ ℚ(∛2,ω) with degrees [3] and [2], total [ℚ(∛2,ω):ℚ] = 6](/pics/pmath441/field-extension-tower.svg)

![Galois group Gal(ℚ(∛2,ω)/ℚ) ≅ S₃ = D₃: 6 elements {e, r, r², s, sr, sr²} with rotation (blue) and reflection (red) arrows](/pics/pmath441/galois-s3-cayley.svg)

![Subgroup lattice of ℤ₁₂: ℤ₁₂ ← ℤ₆, ℤ₄ ← ℤ₃, ℤ₂ ← {0}](/pics/pmath441/subgroup-lattice-z12.svg)

<div class="example"><strong>Example.</strong> The extension \(\mathbb{Q}(\sqrt[3]{2})/\mathbb{Q}\) has degree 3, but \(|\operatorname{Aut}_\mathbb{Q}(\mathbb{Q}(\sqrt[3]{2}))| = 1\), dramatically illustrating the failure of the Galois correspondence for non-normal extensions. There are three \(\mathbb{Q}\)-embeddings of \(\mathbb{Q}(\sqrt[3]{2})\) into \(\mathbb{C}\), but only one (the identity) maps \(\mathbb{Q}(\sqrt[3]{2})\) back into itself, since the other two send \(\sqrt[3]{2}\) to a complex, non-real conjugate.</div>
# Chapter 3: Algebraic Integers and Number Fields

## Algebraic Numbers and Algebraic Integers

In Chapter 2 we studied field extensions and their basic properties. We now turn to the central objects of algebraic number theory: algebraic integers and the rings they form inside number fields. The guiding question is deceptively simple---which elements of a number field deserve to be called "integers"? In the rational numbers, the answer is obvious: the integers are precisely the elements of \(\mathbb{Z}\). But in a general number field, the notion of "having no denominator" is not immediately available, and we must find a more intrinsic characterization.

The key insight is that an ordinary integer \(a \in \mathbb{Z}\) is a root of the monic polynomial \(x - a \in \mathbb{Z}[x]\). More generally, a rational number \(a/b\) in lowest terms is a root of the monic polynomial \(x - a/b\), which has integer coefficients if and only if \(b = 1\). This observation suggests the correct generalization.

<div class="definition"><strong>Definition 3.1 (Algebraic Integer).</strong> An element \(\alpha \in \mathbb{C}\) is called an <strong>algebraic integer</strong> if it is a root of some monic polynomial \(f(x) \in \mathbb{Z}[x]\). More generally, if \(A\) is a commutative ring contained in a commutative ring \(S\), an element \(\alpha \in S\) is said to be <strong>integral over</strong> \(A\) if there exists a monic polynomial \(f(x) \in A[x]\) such that \(f(\alpha) = 0\).</div>

Thus the algebraic integers are precisely the elements of \(\mathbb{C}\) that are integral over \(\mathbb{Z}\). Note that we require the polynomial to be monic but not necessarily irreducible. This flexibility is essential: it is often easier to exhibit some monic polynomial satisfied by \(\alpha\) than to compute its minimal polynomial.

<div class="example"><strong>Example.</strong> The element \(i = \sqrt{-1}\) is an algebraic integer because it is a root of \(x^2 + 1 \in \mathbb{Z}[x]\). The primitive cube root of unity \(\omega = e^{2\pi i/3}\) is an algebraic integer, being a root of \(x^2 + x + 1\). On the other hand, \(\omega/2\) is not an algebraic integer: its minimal polynomial over \(\mathbb{Q}\) is \(x^2 + \frac{1}{2}x + \frac{1}{4}\), which does not have integer coefficients, and by Gauss's Lemma no monic polynomial in \(\mathbb{Z}[x]\) can have \(\omega/2\) as a root.</div>

An important first observation is that for elements of \(\overline{\mathbb{Q}}\), integrality is detected by the minimal polynomial.

<div class="theorem"><strong>Theorem 3.2 (Integrality and the Minimal Polynomial).</strong> Let \(\alpha \in \mathbb{C}\) be algebraic over \(\mathbb{Q}\). Then \(\alpha\) is an algebraic integer if and only if its minimal polynomial over \(\mathbb{Q}\) has coefficients in \(\mathbb{Z}\).</div>

<div class="proof"><strong>Proof.</strong> If the minimal polynomial \(m(x) \in \mathbb{Q}[x]\) of \(\alpha\) already lies in \(\mathbb{Z}[x]\), then \(\alpha\) is visibly an algebraic integer. Conversely, suppose \(\alpha\) is a root of a monic polynomial \(f(x) \in \mathbb{Z}[x]\). Factor \(f(x)\) into monic irreducible factors in \(\mathbb{Z}[x]\), say \(f(x) = g_1(x) g_2(x) \cdots g_k(x)\). Since \(f(\alpha) = 0\), we have \(g_j(\alpha) = 0\) for some index \(j\). Now \(g_j(x)\) is monic and irreducible in \(\mathbb{Z}[x]\), hence irreducible in \(\mathbb{Q}[x]\) by Gauss's Lemma. Therefore \(g_j(x)\) is the minimal polynomial of \(\alpha\) over \(\mathbb{Q}\), and it lies in \(\mathbb{Z}[x]\). <span class="qed">∎</span></div>

## Equivalent Characterizations of Integrality

The definition of integrality in terms of monic polynomials is clean, but it does not immediately reveal that the sum or product of two algebraic integers is again an algebraic integer. To establish this, we need an alternative characterization that involves modules.

<div class="definition"><strong>Definition 3.3 (Module).</strong> Let \(R\) be a commutative ring with identity. An <strong>\(R\)-module</strong> is an abelian group \(M\) equipped with a scalar multiplication \(R \times M \to M\) satisfying the usual axioms: for all \(r, s \in R\) and \(a, b \in M\),

\[
r(a+b) = ra + rb, \quad (r+s)a = ra + sa, \quad (rs)a = r(sa), \quad 1 \cdot a = a.
\]
A submodule of \(M\) is a subset \(N \subseteq M\) that is itself an \(R\)-module under the same operations. The module \(M\) is <strong>finitely generated</strong> if there exist \(m_1, \ldots, m_k \in M\) such that every element of \(M\) can be written as an \(R\)-linear combination of the \(m_i\).</div>

The reader should keep in mind two fundamental examples: a module over a field is simply a vector space, and a module over \(\mathbb{Z}\) is the same thing as an abelian group. When \(R \subseteq S\) is an inclusion of rings, the ring \(S\) itself is naturally an \(R\)-module.

<div class="theorem"><strong>Theorem 3.4 (Equivalent Conditions for Integrality).</strong> Let \(R \subseteq S\) be commutative rings with identity and let \(\alpha \in S\). The following conditions are equivalent:
<br>(i) \(\alpha\) is integral over \(R\), i.e., \(\alpha\) is a root of a monic polynomial in \(R[x]\).
<br>(ii) The ring \(R[\alpha]\) is finitely generated as an \(R\)-module.
<br>(iii) There exists a subring \(T\) with \(R \subseteq T \subseteq S\) such that \(\alpha \in T\) and \(T\) is finitely generated as an \(R\)-module.</div>

<div class="proof"><strong>Proof.</strong> <strong>(i) \(\Rightarrow\) (ii):</strong> Suppose \(\alpha\) satisfies a monic polynomial \(f(x) = x^n + a_{n-1}x^{n-1} + \cdots + a_0 \in R[x]\). Then

\[
\alpha^n = -a_{n-1}\alpha^{n-1} - \cdots - a_0,
\]
so \(\alpha^n\) lies in the \(R\)-module \(M\) generated by \(\{1, \alpha, \alpha^2, \ldots, \alpha^{n-1}\}\). Multiplying by \(\alpha\) shows that \(\alpha^{n+1} \in M\) as well, and by induction every power of \(\alpha\) lies in \(M\). Therefore \(R[\alpha] = M\) is finitely generated.

<strong>(ii) \(\Rightarrow\) (iii):</strong> Take \(T = R[\alpha]\).

<strong>(iii) \(\Rightarrow\) (i):</strong> Let \(T\) be finitely generated as an \(R\)-module with generators \(t_1, \ldots, t_n\). Since \(\alpha \in T\) and \(T\) is a ring, we have \(\alpha t_i \in T\) for each \(i\), so we may write

\[
\alpha t_i = \sum_{j=1}^{n} a_{ij} t_j
\]
for some \(a_{ij} \in R\). In matrix form, \((\alpha I_n - A)\mathbf{t} = 0\), where \(A = (a_{ij})\) and \(\mathbf{t} = (t_1, \ldots, t_n)^T\). Multiplying on the left by the adjugate matrix gives \(\det(\alpha I_n - A) \cdot t_i = 0\) for each \(i\). Since \(1 \in T\) is an \(R\)-linear combination of the \(t_i\), we obtain \(\det(\alpha I_n - A) = 0\). Expanding the determinant gives a monic polynomial in \(\alpha\) with coefficients in \(R\). <span class="qed">∎</span></div>

The power of the module-theoretic characterization is that it allows us to prove closure properties of integral elements with ease.

## The Ring of Algebraic Integers

<div class="theorem"><strong>Theorem 3.5 (Algebraic Integers Form a Ring).</strong> Let \(K\) be a number field. The set

\[
\mathcal{O}_K = \{\alpha \in K : \alpha \text{ is integral over } \mathbb{Z}\}
\]
is a subring of \(K\).</div>

<div class="proof"><strong>Proof.</strong> Clearly \(0, 1 \in \mathcal{O}_K\). Let \(\alpha, \beta \in \mathcal{O}_K\). Then \(\mathbb{Z}[\alpha]\) is a finitely generated \(\mathbb{Z}\)-module, generated by \(\{1, \alpha, \ldots, \alpha^{a-1}\}\) for some \(a\), and \(\mathbb{Z}[\beta]\) is finitely generated, generated by \(\{1, \beta, \ldots, \beta^{b-1}\}\). The ring \(\mathbb{Z}[\alpha, \beta]\) is then generated as a \(\mathbb{Z}\)-module by the finite set \(\{\alpha^i \beta^j : 0 \le i \le a-1, \, 0 \le j \le b-1\}\).

Now \(\mathbb{Z}[\alpha + \beta]\), \(\mathbb{Z}[\alpha - \beta]\), and \(\mathbb{Z}[\alpha\beta]\) are all subrings of \(\mathbb{Z}[\alpha, \beta]\). Since \(\mathbb{Z}\) is a Noetherian ring, every submodule of a finitely generated \(\mathbb{Z}\)-module is itself finitely generated. Thus \(\alpha \pm \beta\) and \(\alpha\beta\) are each contained in a finitely generated \(\mathbb{Z}\)-module, hence are integral over \(\mathbb{Z}\) by condition (iii) of Theorem 3.4. <span class="qed">∎</span></div>

More generally, the same argument establishes the following:

<div class="corollary"><strong>Corollary 3.6.</strong> Let \(R \subseteq S\) be commutative rings. The set \(\overline{R} = \{\alpha \in S : \alpha \text{ is integral over } R\}\) is a subring of \(S\), called the <strong>integral closure</strong> of \(R\) in \(S\).</div>

## Integral Closure and Transitivity

<div class="definition"><strong>Definition 3.7 (Integral Closure).</strong> Let \(R \subseteq S\) be commutative rings. The <strong>integral closure</strong> of \(R\) in \(S\) is the subring \(\overline{R} = \{\alpha \in S : \alpha \text{ is integral over } R\}\). We say \(R\) is <strong>integrally closed in</strong> \(S\) if \(\overline{R} = R\). An integral domain \(R\) is called <strong>integrally closed</strong> if it is integrally closed in its field of fractions.</div>

A crucial property of integrality is its transitivity, which ensures that the integral closure is itself integrally closed.

<div class="theorem"><strong>Theorem 3.8 (Transitivity of Integrality).</strong> Let \(R \subseteq S \subseteq T\) be commutative rings. If \(\alpha \in T\) is integral over \(S\) and \(S\) is integral over \(R\), then \(\alpha\) is integral over \(R\).</div>

<div class="proof"><strong>Proof.</strong> Since \(\alpha\) is integral over \(S\), there exist \(c_0, c_1, \ldots, c_{n-1} \in S\) such that \(\alpha^n + c_{n-1}\alpha^{n-1} + \cdots + c_0 = 0\). Consider the tower of rings

\[
R \subseteq R[c_0] \subseteq R[c_0, c_1] \subseteq \cdots \subseteq R[c_0, \ldots, c_{n-1}] \subseteq R[c_0, \ldots, c_{n-1}, \alpha].
\]
Each \(c_i\) is integral over \(R\) since \(S\) is integral over \(R\), so by Theorem 3.4, each ring \(R[c_0, \ldots, c_k]\) is finitely generated as a module over \(R[c_0, \ldots, c_{k-1}]\). The element \(\alpha\) is integral over \(R[c_0, \ldots, c_{n-1}]\), so \(R[c_0, \ldots, c_{n-1}, \alpha]\) is finitely generated over \(R[c_0, \ldots, c_{n-1}]\). By iterating the module generation (if \(M\) is finitely generated over \(N\) and \(N\) is finitely generated over \(P\), then \(M\) is finitely generated over \(P\)), we conclude that \(R[c_0, \ldots, c_{n-1}, \alpha]\) is finitely generated as an \(R\)-module. Since \(\alpha\) lies in this ring, it is integral over \(R\) by Theorem 3.4(iii). <span class="qed">∎</span></div>

<div class="corollary"><strong>Corollary 3.9.</strong> The integral closure \(\overline{R}\) of \(R\) in \(S\) is integrally closed in \(S\). That is, if \(\alpha \in S\) is integral over \(\overline{R}\), then \(\alpha \in \overline{R}\).</div>

<div class="proof"><strong>Proof.</strong> If \(\alpha\) is integral over \(\overline{R}\) and \(\overline{R}\) is integral over \(R\), then \(\alpha\) is integral over \(R\) by transitivity, hence \(\alpha \in \overline{R}\). <span class="qed">∎</span></div>

## Number Fields and Their Rings of Integers

<div class="definition"><strong>Definition 3.10 (Number Field).</strong> An <strong>algebraic number field</strong> (or simply a <strong>number field</strong>) is a subfield \(K\) of \(\mathbb{C}\) such that \([K : \mathbb{Q}]\) is finite. The <strong>ring of integers</strong> of \(K\) is

\[
\mathcal{O}_K = \{\alpha \in K : \alpha \text{ is integral over } \mathbb{Z}\},
\]
the integral closure of \(\mathbb{Z}\) in \(K\).</div>

A fundamental property is that every element of a number field is "almost" an algebraic integer---it becomes one after clearing a single integer denominator.

<div class="proposition"><strong>Proposition 3.11.</strong> Let \(K\) be a number field. For every \(\alpha \in K\), there exists a positive integer \(b\) such that \(b\alpha \in \mathcal{O}_K\). In particular, \(K\) is the field of fractions of \(\mathcal{O}_K\).</div>

<div class="proof"><strong>Proof.</strong> Let \(\alpha \in K\) be algebraic over \(\mathbb{Q}\), and let \(h(x) = a_n x^n + a_{n-1}x^{n-1} + \cdots + a_0 \in \mathbb{Z}[x]\) with \(a_n > 0\) be a polynomial with \(h(\alpha) = 0\). Multiplying the equation \(h(\alpha) = 0\) by \(a_n^{n-1}\), we obtain

\[
(a_n \alpha)^n + a_{n-1}(a_n \alpha)^{n-1} + a_{n-2}a_n(a_n \alpha)^{n-2} + \cdots + a_0 a_n^{n-1} = 0.
\]
This shows that \(a_n \alpha\) is a root of a monic polynomial in \(\mathbb{Z}[x]\), so \(a_n \alpha \in \mathcal{O}_K\). <span class="qed">∎</span></div>

<div class="corollary"><strong>Corollary 3.12.</strong> The ring of integers \(\mathcal{O}_K\) is integrally closed.</div>

<div class="proof"><strong>Proof.</strong> Since \(K\) is the fraction field of \(\mathcal{O}_K\) and \(\mathcal{O}_K\) is the integral closure of \(\mathbb{Z}\) in \(K\), Corollary 3.9 tells us that \(\mathcal{O}_K\) is integrally closed in \(K\). <span class="qed">∎</span></div>

## Quadratic Number Fields

The simplest nontrivial number fields are the quadratic fields, and they provide the ideal testing ground for the general theory.

<div class="definition"><strong>Definition 3.13 (Quadratic Number Field).</strong> A <strong>quadratic number field</strong> is a number field of the form \(K = \mathbb{Q}(\sqrt{d})\), where \(d\) is a squarefree integer with \(d \ne 0, 1\).</div>

Every quadratic extension of \(\mathbb{Q}\) inside \(\mathbb{C}\) takes this form for a unique squarefree \(d\). The ring of integers of a quadratic field has a surprisingly clean description that depends on the residue of \(d\) modulo 4.

<div class="theorem"><strong>Theorem 3.14 (Ring of Integers of a Quadratic Field).</strong> Let \(d\) be a squarefree integer with \(d \ne 0, 1\), and let \(K = \mathbb{Q}(\sqrt{d})\). Then

\[
\mathcal{O}_K = \mathbb{Z}[\omega], \quad \text{where} \quad \omega = \begin{cases} \sqrt{d} & \text{if } d \not\equiv 1 \pmod{4}, \\ \frac{1 + \sqrt{d}}{2} & \text{if } d \equiv 1 \pmod{4}. \end{cases}
\]
</div>

<div class="proof"><strong>Proof.</strong> Every element of \(K\) has the form \(\alpha = a + b\sqrt{d}\) with \(a, b \in \mathbb{Q}\). Its minimal polynomial over \(\mathbb{Q}\) is

\[
(x - a - b\sqrt{d})(x - a + b\sqrt{d}) = x^2 - 2ax + (a^2 - db^2).
\]
By Theorem 3.2, the element \(\alpha\) is an algebraic integer if and only if both \(2a \in \mathbb{Z}\) and \(a^2 - db^2 \in \mathbb{Z}\).

Write \(a = m/2\) and \(b = n/2\) with \(m, n \in \mathbb{Z}\) (taking \(2a \in \mathbb{Z}\) already forces \(a\) to be a half-integer, and a similar analysis of \(a^2 - db^2 \in \mathbb{Z}\) forces \(b\) to be a half-integer as well). Then the integrality condition \(a^2 - db^2 \in \mathbb{Z}\) becomes \(m^2 - dn^2 \equiv 0 \pmod{4}\).

<strong>Case 1:</strong> \(d \not\equiv 1 \pmod{4}\). Since \(d\) is squarefree, we have \(d \equiv 2\) or \(3 \pmod{4}\). A case analysis shows \(m^2 - dn^2 \equiv 0 \pmod{4}\) forces both \(m\) and \(n\) to be even. So \(a, b \in \mathbb{Z}\), and \(\mathcal{O}_K = \mathbb{Z}[\sqrt{d}]\).

<strong>Case 2:</strong> \(d \equiv 1 \pmod{4}\). Then \(m^2 - dn^2 \equiv m^2 - n^2 \equiv 0 \pmod{4}\), which holds if and only if \(m \equiv n \pmod{2}\). The algebraic integers are therefore elements of the form \(\frac{m + n\sqrt{d}}{2}\) with \(m \equiv n \pmod{2}\). This is precisely \(\mathbb{Z}\left[\frac{1+\sqrt{d}}{2}\right]\), since every such element can be written as \(a + b \cdot \frac{1+\sqrt{d}}{2}\) with \(a, b \in \mathbb{Z}\). <span class="qed">∎</span></div>

<div class="example"><strong>Example.</strong> The ring of integers of \(\mathbb{Q}(\sqrt{-1})\) is \(\mathbb{Z}[i]\), the Gaussian integers, since \(-1 \equiv 3 \pmod{4}\). The ring of integers of \(\mathbb{Q}(\sqrt{5})\) is \(\mathbb{Z}\left[\frac{1+\sqrt{5}}{2}\right]\), since \(5 \equiv 1 \pmod{4}\). Note that the golden ratio \(\varphi = \frac{1+\sqrt{5}}{2}\) is an algebraic integer, being a root of \(x^2 - x - 1\). The ring of integers of \(\mathbb{Q}(\sqrt{2})\) is \(\mathbb{Z}[\sqrt{2}]\), since \(2 \equiv 2 \pmod{4}\).</div>

## \(\mathcal{O}_K\) as a Free \(\mathbb{Z}\)-Module

One of the most important structural results about the ring of integers is that, as an additive group, it looks exactly like \(\mathbb{Z}^n\) where \(n = [K : \mathbb{Q}]\). This rigidity is what makes algebraic number theory possible.

<div class="theorem"><strong>Theorem 3.15 (\(\mathcal{O}_K\) is a Free \(\mathbb{Z}\)-Module of Rank \(n\)).</strong> Let \(K\) be a number field with \([K : \mathbb{Q}] = n\). Then \(\mathcal{O}_K\) is a free \(\mathbb{Z}\)-module of rank \(n\). More precisely, there exist elements \(\omega_1, \ldots, \omega_n \in \mathcal{O}_K\) that form both a \(\mathbb{Q}\)-basis for \(K\) and a \(\mathbb{Z}\)-basis for \(\mathcal{O}_K\).</div>

The proof requires the trace pairing, which we develop in Chapter 4, but let us sketch the main ideas here. Choose a \(\mathbb{Q}\)-basis \(\{x_1, \ldots, x_n\}\) for \(K\) with each \(x_i \in \mathcal{O}_K\) (this is possible by Proposition 3.11, after clearing denominators). Define the linear map \(\varphi : K \to \mathbb{Q}^n\) by

\[
\varphi(\alpha) = \bigl(\operatorname{Tr}_{K/\mathbb{Q}}(x_1 \alpha), \ldots, \operatorname{Tr}_{K/\mathbb{Q}}(x_n \alpha)\bigr).
\]
The nondegeneracy of the trace pairing (Theorem 4.5 below) implies that \(\varphi\) is injective. Since the trace of an algebraic integer is an integer, \(\varphi\) maps \(\mathcal{O}_K\) into \(\mathbb{Z}^n\). As \(\mathcal{O}_K\) contains the \(n\) linearly independent elements \(x_1, \ldots, x_n\), its image under \(\varphi\) is a subgroup of \(\mathbb{Z}^n\) of rank \(n\), hence isomorphic to \(\mathbb{Z}^n\).

<div class="remark"><strong>Remark.</strong> The fact that \(\mathcal{O}_K \cong \mathbb{Z}^n\) as abelian groups has powerful consequences. It immediately implies that \(\mathcal{O}_K\) is a Noetherian ring (every ideal is finitely generated), that every nonzero ideal of \(\mathcal{O}_K\) is also a free abelian group of rank \(n\), and that the quotient \(\mathcal{O}_K / I\) is finite for every nonzero ideal \(I\).</div>

We close this chapter by recording that the ring of integers in a number field is a Dedekind domain---the class of rings for which the theory of ideal factorization works perfectly.

<div class="definition"><strong>Definition 3.16 (Dedekind Domain).</strong> A <strong>Dedekind domain</strong> is an integrally closed, Noetherian integral domain in which every nonzero prime ideal is maximal.</div>

<div class="corollary"><strong>Corollary 3.17.</strong> For any number field \(K\), the ring of integers \(\mathcal{O}_K\) is a Dedekind domain.</div>

<div class="proof"><strong>Proof.</strong> The ring \(\mathcal{O}_K\) is an integral domain (being a subring of a field), integrally closed (Corollary 3.12), and Noetherian (since it is isomorphic to \(\mathbb{Z}^n\) as an abelian group, every ideal is a subgroup of \(\mathbb{Z}^n\) and hence finitely generated). It remains to show that every nonzero prime ideal is maximal. If \(\mathfrak{p}\) is a nonzero prime ideal of \(\mathcal{O}_K\), then \(\mathcal{O}_K/\mathfrak{p}\) is a finite integral domain (since \(\mathcal{O}_K/\mathfrak{p}\) is a quotient of the finite group \(\mathcal{O}_K/\mathfrak{p}\)), and every finite integral domain is a field. <span class="qed">∎</span></div>

---

# Chapter 4: Trace, Norm, and Discriminant

## Trace and Norm via Embeddings

Let \(K\) be a number field with \([K : \mathbb{Q}] = n\). There are exactly \(n\) field embeddings \(\sigma_1, \ldots, \sigma_n : K \hookrightarrow \mathbb{C}\) that fix \(\mathbb{Q}\) pointwise. These embeddings are the key to defining two fundamental arithmetic invariants of the elements of \(K\).

<div class="definition"><strong>Definition 4.1 (Trace and Norm).</strong> Let \(K\) be a number field with \([K : \mathbb{Q}] = n\) and let \(\sigma_1, \ldots, \sigma_n \in \operatorname{Hom}_{\mathbb{Q}}(K, \mathbb{C})\) be the \(n\) embeddings of \(K\) into \(\mathbb{C}\). For \(\alpha \in K\), the <strong>trace</strong> and <strong>norm</strong> of \(\alpha\) over \(\mathbb{Q}\) are defined by

\[
\operatorname{Tr}_{K/\mathbb{Q}}(\alpha) = \sum_{i=1}^{n} \sigma_i(\alpha), \qquad N_{K/\mathbb{Q}}(\alpha) = \prod_{i=1}^{n} \sigma_i(\alpha).
\]
</div>

There is an equivalent linear-algebraic definition. For each \(\alpha \in K\), the multiplication map \(M_\alpha : K \to K\) defined by \(M_\alpha(x) = \alpha x\) is a \(\mathbb{Q}\)-linear transformation. Relative to any \(\mathbb{Q}\)-basis of \(K\), this map has a matrix representation, and

\[
\operatorname{Tr}_{K/\mathbb{Q}}(\alpha) = \operatorname{tr}(M_\alpha), \qquad N_{K/\mathbb{Q}}(\alpha) = \det(M_\alpha).
\]
The characteristic polynomial of \(M_\alpha\) is \(f_\alpha(x) = \prod_{i=1}^{n}(x - \sigma_i(\alpha))\), from which both definitions agree by Vieta's formulas.

<div class="example"><strong>Example.</strong> Let \(K = \mathbb{Q}(\sqrt{d})\) with \(d\) squarefree, and let \(\alpha = a + b\sqrt{d}\) with \(a, b \in \mathbb{Q}\). The two embeddings send \(\sqrt{d}\) to \(\pm\sqrt{d}\), so

\[
\operatorname{Tr}_{K/\mathbb{Q}}(\alpha) = (a + b\sqrt{d}) + (a - b\sqrt{d}) = 2a, \qquad N_{K/\mathbb{Q}}(\alpha) = (a + b\sqrt{d})(a - b\sqrt{d}) = a^2 - db^2.
\]
Equivalently, relative to the basis \(\{1, \sqrt{d}\}\), the matrix of \(M_\alpha\) is \(\begin{pmatrix} a & bd \\ b & a \end{pmatrix}\), which has trace \(2a\) and determinant \(a^2 - db^2\).</div>

## Properties of Trace and Norm

The trace and norm satisfy the properties one would hope for.

<div class="proposition"><strong>Proposition 4.2.</strong> Let \(K\) be a number field with \([K : \mathbb{Q}] = n\), and let \(\alpha, \beta \in K\), \(r \in \mathbb{Q}\). Then:
<br>(i) \(\operatorname{Tr}_{K/\mathbb{Q}}(\alpha + \beta) = \operatorname{Tr}_{K/\mathbb{Q}}(\alpha) + \operatorname{Tr}_{K/\mathbb{Q}}(\beta)\) <em>(additivity)</em>,
<br>(ii) \(\operatorname{Tr}_{K/\mathbb{Q}}(r\alpha) = r \cdot \operatorname{Tr}_{K/\mathbb{Q}}(\alpha)\) <em>(homogeneity)</em>,
<br>(iii) \(N_{K/\mathbb{Q}}(\alpha\beta) = N_{K/\mathbb{Q}}(\alpha) \cdot N_{K/\mathbb{Q}}(\beta)\) <em>(multiplicativity)</em>,
<br>(iv) \(N_{K/\mathbb{Q}}(r\alpha) = r^n \cdot N_{K/\mathbb{Q}}(\alpha)\).</div>

<div class="proof"><strong>Proof.</strong> Each \(\sigma_i\) is a ring homomorphism fixing \(\mathbb{Q}\), so \(\sigma_i(\alpha + \beta) = \sigma_i(\alpha) + \sigma_i(\beta)\), \(\sigma_i(r\alpha) = r\sigma_i(\alpha)\), and \(\sigma_i(\alpha\beta) = \sigma_i(\alpha)\sigma_i(\beta)\). All four properties then follow immediately from the definitions. <span class="qed">∎</span></div>

The trace and norm relate to the minimal polynomial of \(\alpha\) through a multiplicity factor.

<div class="theorem"><strong>Theorem 4.3 (Characteristic Polynomial via Minimal Polynomial).</strong> Let \(K\) be a number field with \([K : \mathbb{Q}] = n\), let \(\alpha \in K\), and let \(p(x) \in \mathbb{Q}[x]\) be the minimal polynomial of \(\alpha\) over \(\mathbb{Q}\). Set \(m = [K : \mathbb{Q}(\alpha)]\). Then

\[
f_\alpha(x) = p(x)^m = \prod_{\sigma \in \operatorname{Hom}_{\mathbb{Q}}(K, \mathbb{C})} \bigl(x - \sigma(\alpha)\bigr).
\]
</div>

<div class="proof"><strong>Proof.</strong> Let \(\ell = \deg p = [\mathbb{Q}(\alpha) : \mathbb{Q}]\), so that \(n = \ell m\). Let \(\alpha_1, \ldots, \alpha_\ell\) be the roots of \(p(x)\) in \(\mathbb{C}\). The \(\ell\) embeddings \(\mathbb{Q}(\alpha) \hookrightarrow \mathbb{C}\) send \(\alpha\) to \(\alpha_1, \ldots, \alpha_\ell\) respectively, and each such embedding extends in exactly \(m\) ways to an embedding \(K \hookrightarrow \mathbb{C}\). Therefore the multiset \(\{\sigma(\alpha) : \sigma \in \operatorname{Hom}_{\mathbb{Q}}(K, \mathbb{C})\}\) consists of each \(\alpha_i\) appearing exactly \(m\) times. The product \(\prod_\sigma (x - \sigma(\alpha))\) thus equals \(\prod_{i=1}^{\ell} (x - \alpha_i)^m = p(x)^m\).

To verify this equals the characteristic polynomial of \(M_\alpha\), choose a basis \(\{u_1, \ldots, u_m\}\) for \(K\) over \(\mathbb{Q}(\alpha)\) and use the basis \(\{u_j \alpha^{k-1} : 1 \le j \le m, \, 0 \le k \le \ell-1\}\) for \(K\) over \(\mathbb{Q}\). Relative to this basis, \(M_\alpha\) decomposes into \(m\) blocks, each being the companion matrix of \(p(x)\), giving \(f_\alpha(x) = p(x)^m\). <span class="qed">∎</span></div>

An important consequence is the transitivity of trace and norm in towers of extensions.

<div class="corollary"><strong>Corollary 4.4 (Transitivity).</strong> Let \(\mathbb{Q} \subseteq K \subseteq L \subseteq \mathbb{C}\) with \([L : \mathbb{Q}]\) finite. Then for all \(\alpha \in L\),

\[
\operatorname{Tr}_{L/\mathbb{Q}}(\alpha) = \operatorname{Tr}_{K/\mathbb{Q}}\bigl(\operatorname{Tr}_{L/K}(\alpha)\bigr), \qquad N_{L/\mathbb{Q}}(\alpha) = N_{K/\mathbb{Q}}\bigl(N_{L/K}(\alpha)\bigr).
\]
</div>

<div class="proof"><strong>Proof.</strong> Each embedding \(\rho \in \operatorname{Hom}_{\mathbb{Q}}(L, \mathbb{C})\) restricts to some \(\sigma \in \operatorname{Hom}_{\mathbb{Q}}(K, \mathbb{C})\), and for each \(\sigma\), there are exactly \([L:K]\) embeddings \(\tau \in \operatorname{Hom}_K(L, \mathbb{C})\) that restrict to \(\sigma\) on \(K\) (after composing with an extension of \(\sigma\)). Therefore

\[
\operatorname{Tr}_{L/\mathbb{Q}}(\alpha) = \sum_{\sigma \in \operatorname{Hom}_{\mathbb{Q}}(K, \mathbb{C})} \sum_{\tau \in \operatorname{Hom}_K(L, \mathbb{C})} \sigma\bigl(\tau(\alpha)\bigr) = \sum_{\sigma} \sigma\Bigl(\sum_\tau \tau(\alpha)\Bigr) = \sum_{\sigma} \sigma\bigl(\operatorname{Tr}_{L/K}(\alpha)\bigr) = \operatorname{Tr}_{K/\mathbb{Q}}\bigl(\operatorname{Tr}_{L/K}(\alpha)\bigr).
\]
The argument for the norm is identical, with products replacing sums. <span class="qed">∎</span></div>

## Integrality of Trace and Norm

<div class="theorem"><strong>Theorem 4.5.</strong> Let \(K\) be a number field and \(\alpha \in \mathcal{O}_K\). Then \(\operatorname{Tr}_{K/\mathbb{Q}}(\alpha) \in \mathbb{Z}\) and \(N_{K/\mathbb{Q}}(\alpha) \in \mathbb{Z}\).</div>

<div class="proof"><strong>Proof.</strong> If \(\alpha \in \mathcal{O}_K\), then each conjugate \(\sigma_i(\alpha)\) is also an algebraic integer (since \(\sigma_i(\alpha)\) satisfies the same minimal polynomial as \(\alpha\)). The trace \(\operatorname{Tr}(\alpha) = \sum \sigma_i(\alpha)\) and the norm \(N(\alpha) = \prod \sigma_i(\alpha)\) are therefore algebraic integers, by the ring property. But they are also rational numbers (as coefficients of the characteristic polynomial, which lies in \(\mathbb{Q}[x]\)). An element of \(\mathbb{Q}\) that is an algebraic integer must lie in \(\mathbb{Z}\). <span class="qed">∎</span></div>

## Units of \(\mathcal{O}_K\)

<div class="proposition"><strong>Proposition 4.6 (Units Characterized by Norm).</strong> Let \(K\) be a number field and \(\alpha \in \mathcal{O}_K\). Then \(\alpha \in \mathcal{O}_K^\times\) if and only if \(N_{K/\mathbb{Q}}(\alpha) = \pm 1\).</div>

<div class="proof"><strong>Proof.</strong> If \(\alpha \in \mathcal{O}_K^\times\), then \(\alpha\beta = 1\) for some \(\beta \in \mathcal{O}_K\). Taking norms, \(N(\alpha)N(\beta) = N(1) = 1\). Since both \(N(\alpha)\) and \(N(\beta)\) are integers, we must have \(N(\alpha) = \pm 1\).

Conversely, suppose \(N_{K/\mathbb{Q}}(\alpha) = \pm 1\). Then \(\alpha \prod_{i=2}^{n} \sigma_i(\alpha) = \pm 1\), so \(\alpha^{-1} = \pm \prod_{i=2}^{n} \sigma_i(\alpha)\). Each \(\sigma_i(\alpha)\) is an algebraic integer, so their product is an algebraic integer. Since \(\alpha^{-1} \in K\) and is an algebraic integer, \(\alpha^{-1} \in \mathcal{O}_K\). <span class="qed">∎</span></div>

<div class="example"><strong>Example.</strong> In \(\mathcal{O}_{\mathbb{Q}(i)} = \mathbb{Z}[i]\), the norm of \(a + bi\) is \(a^2 + b^2\). So the units are the elements with \(a^2 + b^2 = 1\), namely \(\{\pm 1, \pm i\}\). In \(\mathcal{O}_{\mathbb{Q}(\sqrt{2})} = \mathbb{Z}[\sqrt{2}]\), the norm of \(a + b\sqrt{2}\) is \(a^2 - 2b^2\), and the equation \(a^2 - 2b^2 = \pm 1\) is a Pell equation with infinitely many solutions, so \(\mathcal{O}_K^\times\) is infinite.</div>

## The Discriminant

The discriminant is a fundamental invariant that encodes information about the "complexity" of a number field and its ring of integers. It measures how far apart the conjugates of a basis are spread.

<div class="definition"><strong>Definition 4.7 (Discriminant of an \(n\)-tuple).</strong> Let \(K\) be a number field with \([K : \mathbb{Q}] = n\) and let \(\sigma_1, \ldots, \sigma_n\) be the \(n\) embeddings of \(K\) into \(\mathbb{C}\). For elements \(\alpha_1, \ldots, \alpha_n \in K\), the <strong>discriminant</strong> is defined by

\[
\operatorname{disc}(\alpha_1, \ldots, \alpha_n) = \det\bigl(\sigma_j(\alpha_k)\bigr)_{1 \le j,k \le n}^2.
\]
Equivalently, \(\operatorname{disc}(\alpha_1, \ldots, \alpha_n) = \det\bigl(\operatorname{Tr}_{K/\mathbb{Q}}(\alpha_j \alpha_k)\bigr)_{1 \le j,k \le n}\).</div>

The equivalence of the two formulas is a key computation:

<div class="proposition"><strong>Proposition 4.8 (Trace Formula for Discriminant).</strong> Let \(B \in M_n(\mathbb{C})\) be the matrix with \(B_{jk} = \sigma_j(\alpha_k)\), and let \(A \in M_n(K)\) be the matrix with \(A_{jk} = \operatorname{Tr}_{K/\mathbb{Q}}(\alpha_j \alpha_k)\). Then \(B^T B = A\), and therefore \(\operatorname{disc}(\alpha_1, \ldots, \alpha_n) = \det(A) = (\det B)^2\).</div>

<div class="proof"><strong>Proof.</strong> For all indices \(j, k\),

\[
(B^T B)_{jk} = \sum_{i=1}^{n} B_{ij} B_{ik} = \sum_{i=1}^{n} \sigma_i(\alpha_j)\sigma_i(\alpha_k) = \sum_{i=1}^{n} \sigma_i(\alpha_j \alpha_k) = \operatorname{Tr}_{K/\mathbb{Q}}(\alpha_j \alpha_k) = A_{jk}. \qedhere
\]
<span class="qed">∎</span></div>

The discriminant detects linear independence:

<div class="corollary"><strong>Corollary 4.9.</strong> The elements \(\alpha_1, \ldots, \alpha_n \in K\) form a \(\mathbb{Q}\)-basis for \(K\) if and only if \(\operatorname{disc}(\alpha_1, \ldots, \alpha_n) \ne 0\).</div>

<div class="proof"><strong>Proof.</strong> Choose \(\theta \in K\) with \(K = \mathbb{Q}(\theta)\), and let \(\theta_1, \ldots, \theta_n\) be its conjugates. The discriminant \(\operatorname{disc}(1, \theta, \ldots, \theta^{n-1})\) is the square of the Vandermonde determinant \(\prod_{i < j}(\theta_i - \theta_j)\), which is nonzero since the conjugates are distinct. If \(C\) is the change-of-basis matrix expressing the \(\alpha_k\) in terms of \(\{1, \theta, \ldots, \theta^{n-1}\}\), then by the change-of-basis formula (Theorem 4.11 below), \(\operatorname{disc}(\alpha_1, \ldots, \alpha_n) = (\det C)^2 \operatorname{disc}(1, \theta, \ldots, \theta^{n-1})\), which is nonzero if and only if \(\det C \ne 0\), if and only if the \(\alpha_k\) are linearly independent. <span class="qed">∎</span></div>

## The Vandermonde Determinant

<div class="definition"><strong>Definition 4.10 (Vandermonde Matrix).</strong> For elements \(a_1, \ldots, a_n\) in a commutative ring, the <strong>Vandermonde matrix</strong> is

\[
V(a_1, \ldots, a_n) = \begin{pmatrix} 1 & a_1 & a_1^2 & \cdots & a_1^{n-1} \\ 1 & a_2 & a_2^2 & \cdots & a_2^{n-1} \\ \vdots & \vdots & \vdots & \ddots & \vdots \\ 1 & a_n & a_n^2 & \cdots & a_n^{n-1} \end{pmatrix}.
\]
Its determinant is \(\det V(a_1, \ldots, a_n) = \prod_{1 \le i < j \le n} (a_j - a_i)\).</div>

Using this, if \(K = \mathbb{Q}(\theta)\) with minimal polynomial \(p(x)\) having roots \(\theta_1, \ldots, \theta_n\), then

\[
\operatorname{disc}(1, \theta, \ldots, \theta^{n-1}) = \det V(\theta_1, \ldots, \theta_n)^2 = \prod_{1 \le i < j \le n} (\theta_i - \theta_j)^2.
\]

## Change of Basis and Integral Bases

<div class="theorem"><strong>Theorem 4.11 (Change of Basis).</strong> Let \(K\) be a number field with \([K : \mathbb{Q}] = n\). Let \(\{u_1, \ldots, u_n\}\) be a \(\mathbb{Q}\)-basis for \(K\) and let \(v_1, \ldots, v_n \in K\) with \(v_k = \sum_{i=1}^{n} c_{ik} u_i\). Let \(C = (c_{ik})\). Then

\[
\operatorname{disc}(v_1, \ldots, v_n) = (\det C)^2 \cdot \operatorname{disc}(u_1, \ldots, u_n).
\]
</div>

<div class="proof"><strong>Proof.</strong> Let \(B^U\) and \(B^V\) be the matrices with entries \(B^U_{jk} = \sigma_j(u_k)\) and \(B^V_{jk} = \sigma_j(v_k)\). Since \(v_k = \sum_i c_{ik} u_i\), we have \(\sigma_j(v_k) = \sum_i c_{ik} \sigma_j(u_i)\), so \(B^V = B^U C\). Therefore

\[
\operatorname{disc}(v_1, \ldots, v_n) = (\det B^V)^2 = (\det B^U)^2 (\det C)^2 = (\det C)^2 \cdot \operatorname{disc}(u_1, \ldots, u_n). \qedhere
\]
<span class="qed">∎</span></div>

<div class="definition"><strong>Definition 4.12 (Integral Basis).</strong> Let \(K\) be a number field with \([K : \mathbb{Q}] = n\). An <strong>integral basis</strong> for \(K\) is a set \(\{\omega_1, \ldots, \omega_n\} \subset \mathcal{O}_K\) that is simultaneously a \(\mathbb{Q}\)-basis for \(K\) and a \(\mathbb{Z}\)-basis for \(\mathcal{O}_K\), so that every \(\alpha \in \mathcal{O}_K\) can be uniquely written as \(\alpha = m_1 \omega_1 + \cdots + m_n \omega_n\) with \(m_i \in \mathbb{Z}\).</div>

<div class="theorem"><strong>Theorem 4.13 (Existence of Integral Bases).</strong> Every number field \(K\) has an integral basis.</div>

<div class="proof"><strong>Proof.</strong> Choose \(\theta \in \mathcal{O}_K\) with \(K = \mathbb{Q}(\theta)\). Consider the collection of all \(\mathbb{Q}\)-bases for \(K\) that consist of algebraic integers. This collection is nonempty since it contains \(\{1, \theta, \ldots, \theta^{n-1}\}\). The discriminant of any such basis is a nonzero integer (nonzero by Corollary 4.9, integer by Theorem 4.5).

Choose a basis \(\{\omega_1, \ldots, \omega_n\} \subset \mathcal{O}_K\) minimizing \(|\operatorname{disc}(\omega_1, \ldots, \omega_n)|\). We claim this is an integral basis. If not, there exists \(\gamma \in \mathcal{O}_K\) with \(\gamma = a_1\omega_1 + \cdots + a_n\omega_n\) where some \(a_j \notin \mathbb{Z}\). Say \(a_1 \notin \mathbb{Z}\), and write \(a_1 = a + r\) with \(a \in \mathbb{Z}\) and \(0 < r < 1\). Replace \(\omega_1\) by \(\omega_1' = \gamma - a\omega_1 = r\omega_1 + a_2\omega_2 + \cdots + a_n\omega_n\). Then \(\{\omega_1', \omega_2, \ldots, \omega_n\}\) is a basis of algebraic integers, and the change of basis has determinant \(r\), so

\[
|\operatorname{disc}(\omega_1', \omega_2, \ldots, \omega_n)| = r^2 |\operatorname{disc}(\omega_1, \ldots, \omega_n)| < |\operatorname{disc}(\omega_1, \ldots, \omega_n)|,
\]
contradicting minimality. <span class="qed">∎</span></div>

## Uniqueness of Discriminant and the Discriminant of a Number Field

<div class="theorem"><strong>Theorem 4.14.</strong> If \(\{\omega_1, \ldots, \omega_n\}\) and \(\{\omega_1', \ldots, \omega_n'\}\) are two integral bases for \(K\), then \(\operatorname{disc}(\omega_1, \ldots, \omega_n) = \operatorname{disc}(\omega_1', \ldots, \omega_n')\).</div>

<div class="proof"><strong>Proof.</strong> Since both are \(\mathbb{Z}\)-bases for \(\mathcal{O}_K\), the change of basis matrix \(C\) has integer entries, and so does \(C^{-1}\). Therefore \(\det(C) \in \mathbb{Z}\) and \(\det(C^{-1}) \in \mathbb{Z}\), which forces \(\det(C) = \pm 1\). By the change of basis formula, \(\operatorname{disc}(\omega_1', \ldots, \omega_n') = (\det C)^2 \operatorname{disc}(\omega_1, \ldots, \omega_n) = \operatorname{disc}(\omega_1, \ldots, \omega_n)\). <span class="qed">∎</span></div>

<div class="definition"><strong>Definition 4.15 (Discriminant of a Number Field).</strong> The <strong>discriminant</strong> of a number field \(K\), denoted \(\operatorname{disc}(K)\) or \(d_K\), is the discriminant of any integral basis for \(K\).</div>

The discriminant is an isomorphism invariant: two isomorphic number fields have the same discriminant. It therefore "discriminates" between non-isomorphic number fields.

## Discriminant and Minimal Polynomial

<div class="theorem"><strong>Theorem 4.16.</strong> Let \(K = \mathbb{Q}(\theta)\) with \([K : \mathbb{Q}] = n\), and let \(p(x)\) be the minimal polynomial of \(\theta\) over \(\mathbb{Q}\), with roots \(\theta_1, \ldots, \theta_n\). Then

\[
\operatorname{disc}(1, \theta, \ldots, \theta^{n-1}) = \prod_{1 \le i < j \le n} (\theta_i - \theta_j)^2 = (-1)^{n(n-1)/2} N_{K/\mathbb{Q}}\bigl(p'(\theta)\bigr).
\]
</div>

<div class="proof"><strong>Proof.</strong> The first equality follows from the Vandermonde determinant. For the second, since \(p(x) = \prod_{i=1}^{n}(x - \theta_i)\), we have \(p'(x) = \sum_{k=1}^{n} \prod_{i \ne k}(x - \theta_i)\), so

\[
p'(\theta_k) = \prod_{i \ne k}(\theta_k - \theta_i).
\]
Taking the product over all \(k\):

\[
N_{K/\mathbb{Q}}(p'(\theta)) = \prod_{k=1}^{n} p'(\theta_k) = \prod_{k=1}^{n} \prod_{i \ne k}(\theta_k - \theta_i).
\]
Now \(\prod_{k} \prod_{i \ne k}(\theta_k - \theta_i) = \prod_{i < j}(\theta_i - \theta_j)(\theta_j - \theta_i) = (-1)^{n(n-1)/2}\prod_{i < j}(\theta_i - \theta_j)^2\). <span class="qed">∎</span></div>

<div class="remark"><strong>Remark.</strong> The quantity \(\operatorname{disc}(1, \theta, \ldots, \theta^{n-1})\) is sometimes called the <strong>discriminant of the polynomial</strong> \(p(x)\) and written \(\operatorname{disc}(p)\). For small degrees:

\[
\operatorname{disc}(x^2 + bx + c) = b^2 - 4c, \qquad \operatorname{disc}(x^3 + px + q) = -4p^3 - 27q^2.
\]
</div>

## Discriminant of Quadratic Fields

<div class="theorem"><strong>Theorem 4.17.</strong> Let \(d\) be a squarefree integer and \(K = \mathbb{Q}(\sqrt{d})\). Then

\[
\operatorname{disc}(K) = \begin{cases} 4d & \text{if } d \not\equiv 1 \pmod{4}, \\ d & \text{if } d \equiv 1 \pmod{4}. \end{cases}
\]
</div>

<div class="proof"><strong>Proof.</strong> <strong>Case 1:</strong> \(d \not\equiv 1 \pmod{4}\). An integral basis is \(\{1, \sqrt{d}\}\), and

\[
\operatorname{disc}(1, \sqrt{d}) = \det\begin{pmatrix} 1 & \sqrt{d} \\ 1 & -\sqrt{d}\end{pmatrix}^2 = (-2\sqrt{d})^2 = 4d.
\]

<strong>Case 2:</strong> \(d \equiv 1 \pmod{4}\). An integral basis is \(\bigl\{1, \frac{1+\sqrt{d}}{2}\bigr\}\), and

\[
\operatorname{disc}\!\left(1, \tfrac{1+\sqrt{d}}{2}\right) = \det\begin{pmatrix} 1 & \frac{1+\sqrt{d}}{2} \\[4pt] 1 & \frac{1-\sqrt{d}}{2}\end{pmatrix}^2 = (-\sqrt{d})^2 = d. \qedhere
\]
<span class="qed">∎</span></div>

## Finding Integral Bases in Practice

A useful technique for computing \(\mathcal{O}_K\) is the following containment result.

<div class="theorem"><strong>Theorem 4.18.</strong> Let \(K\) be a number field with \([K : \mathbb{Q}] = n\). Let \(\{\alpha_1, \ldots, \alpha_n\}\) be a \(\mathbb{Q}\)-basis for \(K\) with each \(\alpha_i \in \mathcal{O}_K\), and let \(d = \operatorname{disc}(\alpha_1, \ldots, \alpha_n)\). If \(\alpha \in \mathcal{O}_K\), then there exist \(m_1, \ldots, m_n \in \mathbb{Z}\) such that

\[
\alpha = \frac{m_1 \alpha_1 + \cdots + m_n \alpha_n}{d}, \qquad d \mid m_i^2 \text{ for each } i.
\]
</div>

<div class="proof"><strong>Proof.</strong> Write \(\alpha = a_1\alpha_1 + \cdots + a_n\alpha_n\) with \(a_i \in \mathbb{Q}\). Applying each embedding \(\sigma_j\) gives a system of linear equations. By Cramer's rule, \(a_i = \gamma_i / \delta\) where \(\delta = \det(\sigma_j(\alpha_k))\) and \(\gamma_i\) is obtained by replacing the \(i\)-th column with \((\sigma_1(\alpha), \ldots, \sigma_n(\alpha))^T\). Both \(\gamma_i\) and \(\delta\) are algebraic integers, and \(\delta^2 = d\). Setting \(m_i = da_i = \delta \gamma_i\), we have \(m_i \in \mathbb{Q} \cap \mathcal{O}_{\overline{\mathbb{Q}}} = \mathbb{Z}\), and \(m_i^2/d = \gamma_i^2 \in \mathbb{Z}\). <span class="qed">∎</span></div>

<div class="example"><strong>Example.</strong> Let \(K = \mathbb{Q}(\theta)\) where \(\theta\) is a root of \(f(x) = x^3 + x + 1\). Then \(\operatorname{disc}(f) = -4(1)^3 - 27(1)^2 = -31\), which is squarefree. By the change-of-basis formula, \(\operatorname{disc}(1, \theta, \theta^2) = \operatorname{disc}(f) = -31\). Since this is squarefree, the index \([\mathcal{O}_K : \mathbb{Z}[\theta]]\) must be 1, so \(\mathcal{O}_K = \mathbb{Z}[\theta]\) and \(\{1, \theta, \theta^2\}\) is an integral basis with \(\operatorname{disc}(K) = -31\).</div>

## Stickelberger's Theorem

A remarkable constraint on the discriminant of a number field is given by Stickelberger's theorem.

<div class="theorem"><strong>Theorem 4.19 (Stickelberger).</strong> Let \(K\) be a number field. Then \(\operatorname{disc}(K) \equiv 0\) or \(1 \pmod{4}\).</div>

<div class="proof"><strong>Proof.</strong> Let \(\{\omega_1, \ldots, \omega_n\}\) be an integral basis, and let \(\delta = \det(\sigma_j(\omega_k))\), so that \(\operatorname{disc}(K) = \delta^2\). Consider the sum

\[
S = \sum_{\pi \in S_n} \operatorname{sgn}(\pi) \prod_{i=1}^{n} \sigma_i(\omega_{\pi(i)}),
\]
which equals \(\delta\). Each summand is an algebraic integer. Now consider the partition of \(S_n\) into even and odd permutations: \(\delta = A - B\) where \(A\) is the sum over even permutations and \(B\) is the sum over odd permutations. Then \(A + B = \sum_{\pi} |\operatorname{sgn}(\pi)| \prod \sigma_i(\omega_{\pi(i)})\) and

\[
\delta^2 = (A - B)^2 = (A + B)^2 - 4AB.
\]
Both \(A + B\) and \(AB\) are symmetric functions of the \(\sigma_i(\omega_k)\), hence lie in \(\mathbb{Q}\). Since they are also algebraic integers, they lie in \(\mathbb{Z}\). Therefore \(\operatorname{disc}(K) = (A+B)^2 - 4AB \equiv (A+B)^2 \pmod{4}\), and a perfect square modulo 4 is either 0 or 1. <span class="qed">∎</span></div>

## Sign of the Discriminant

<div class="proposition"><strong>Proposition 4.20.</strong> Let \(K\) be a number field with \(r_1\) real embeddings and \(2r_2\) complex embeddings. Then the sign of \(\operatorname{disc}(K)\) is \((-1)^{r_2}\).</div>

<div class="proof"><strong>Proof.</strong> Let \(\{\omega_1, \ldots, \omega_n\}\) be an integral basis and let \(\delta = \det(\sigma_j(\omega_k))\), so \(\operatorname{disc}(K) = \delta^2\). Complex conjugation fixes the rows corresponding to real embeddings and swaps the rows corresponding to pairs of conjugate complex embeddings. Therefore \(\overline{\delta}\) is obtained from \(\delta\) by performing \(r_2\) row transpositions, giving \(\overline{\delta} = (-1)^{r_2} \delta\).

If \(r_2\) is even, then \(\overline{\delta} = \delta\), so \(\delta \in \mathbb{R}\) and \(\delta^2 > 0\). If \(r_2\) is odd, then \(\overline{\delta} = -\delta\), so \(\delta\) is purely imaginary and \(\delta^2 < 0\). In both cases, the sign of \(\operatorname{disc}(K) = \delta^2\) is \((-1)^{r_2}\). <span class="qed">∎</span></div>

<div class="remark"><strong>Remark.</strong> For a quadratic field \(\mathbb{Q}(\sqrt{d})\) with \(d > 0\), we have \(r_1 = 2, r_2 = 0\), so \(\operatorname{disc}(K) > 0\). For \(d < 0\), we have \(r_1 = 0, r_2 = 1\), so \(\operatorname{disc}(K) < 0\). This is consistent with Theorem 4.17.</div>

## Compositum and Discriminant

When two number fields are "independent" in a precise sense, the discriminant of their compositum factors nicely.

<div class="theorem"><strong>Theorem 4.21.</strong> Let \(K\) and \(L\) be number fields with \([K : \mathbb{Q}] = k\) and \([L : \mathbb{Q}] = \ell\). Suppose \([KL : \mathbb{Q}] = k\ell\) and \(\gcd(\operatorname{disc}(K), \operatorname{disc}(L)) = 1\). Then if \(\{\alpha_1, \ldots, \alpha_k\}\) and \(\{\beta_1, \ldots, \beta_\ell\}\) are integral bases for \(K\) and \(L\) respectively, the set \(\{\alpha_i \beta_j\}\) is an integral basis for \(KL\), and

\[
\operatorname{disc}(KL) = \operatorname{disc}(K)^\ell \cdot \operatorname{disc}(L)^k.
\]
</div>

---

# Chapter 5: Cyclotomic Number Fields

## Roots of Unity and Cyclotomic Polynomials

The cyclotomic fields \(\mathbb{Q}(\zeta_n)\), obtained by adjoining a primitive \(n\)-th root of unity to the rationals, occupy a central position in algebraic number theory. They provide the richest source of abelian extensions of \(\mathbb{Q}\), and their arithmetic is remarkably explicit. In this chapter we develop the basic theory: the irreducibility of cyclotomic polynomials, the structure of the Galois group, the ring of integers, and the discriminant.

<div class="definition"><strong>Definition 5.1 (Cyclotomic Polynomial).</strong> For \(n \in \mathbb{Z}^+\), set \(\zeta_n = e^{2\pi i/n}\). The <strong>\(n\)-th cyclotomic polynomial</strong> is

\[
\Phi_n(x) = \prod_{\substack{1 \le k \le n \\ \gcd(k, n) = 1}} (x - \zeta_n^k).
\]
Its degree is \(\varphi(n)\), Euler's totient function.</div>

The cyclotomic polynomials are characterized by the fundamental factorization of \(x^n - 1\):

<div class="theorem"><strong>Theorem 5.2 (Properties of Cyclotomic Polynomials).</strong>
<br>(i) \(x^n - 1 = \prod_{d \mid n} \Phi_d(x)\).
<br>(ii) \(\Phi_n(x) \in \mathbb{Z}[x]\) for all \(n \ge 1\).
<br>(iii) \(\Phi_1(0) = -1\) and \(\Phi_n(0) = 1\) for \(n \ge 2\).
<br>(iv) For \(p\) prime: \(\Phi_p(x) = x^{p-1} + x^{p-2} + \cdots + x + 1\). More generally, \(\Phi_{p^k}(x) = \Phi_p(x^{p^{k-1}})\) and \(\Phi_{p^k}(1) = p\).</div>

<div class="proof"><strong>Proof.</strong> <strong>(i)</strong> The roots of \(x^n - 1\) are the elements of the cyclic group \(C_n = \{\zeta_n^k : k \in \mathbb{Z}_n\}\). Each element of \(C_n\) is a primitive \(d\)-th root of unity for exactly one divisor \(d\) of \(n\), and the primitive \(d\)-th roots of unity are precisely the roots of \(\Phi_d(x)\). Therefore \(x^n - 1 = \prod_{d \mid n} \Phi_d(x)\).

<strong>(ii)</strong> By induction on \(n\). We have \(\Phi_1(x) = x - 1 \in \mathbb{Z}[x]\). For \(n > 1\), write \(x^n - 1 = \Phi_n(x) g(x)\) where \(g(x) = \prod_{d \mid n, d \ne n} \Phi_d(x) \in \mathbb{Z}[x]\) by the induction hypothesis. Since \(g\) is monic, long division of \(x^n - 1\) by \(g(x)\) in \(\mathbb{Z}[x]\) yields a quotient \(\Phi_n(x) \in \mathbb{Z}[x]\).

<strong>(iii)</strong> By induction. \(\Phi_1(0) = -1\). For \(n \ge 2\), evaluating \(x^n - 1 = \Phi_n(x) \Phi_1(x) h(x)\) at \(x = 0\) gives \(-1 = \Phi_n(0)(-1)(1) = -\Phi_n(0)\), so \(\Phi_n(0) = 1\). (Here \(h(x) = \prod_{d \mid n, d \ne 1, d \ne n} \Phi_d(x)\), which satisfies \(h(0) = 1\) by induction.)

<strong>(iv)</strong> From part (i), \(x^p - 1 = \Phi_p(x) \Phi_1(x) = \Phi_p(x)(x-1)\), so \(\Phi_p(x) = \frac{x^p - 1}{x - 1} = x^{p-1} + \cdots + x + 1\). Similarly, \(x^{p^k} - 1 = \Phi_{p^k}(x) \cdot (x^{p^{k-1}} - 1)\), giving \(\Phi_{p^k}(x) = \frac{x^{p^k} - 1}{x^{p^{k-1}} - 1} = \Phi_p(x^{p^{k-1}})\). Evaluating at \(x = 1\): \(\Phi_{p^k}(1) = \Phi_p(1) = p\). <span class="qed">∎</span></div>

## Irreducibility of \(\Phi_n(x)\) over \(\mathbb{Q}\)

The irreducibility of the cyclotomic polynomial is one of the cornerstones of algebraic number theory. It tells us that all primitive \(n\)-th roots of unity are conjugate over \(\mathbb{Q}\), and therefore \([\mathbb{Q}(\zeta_n) : \mathbb{Q}] = \varphi(n)\).

<div class="theorem"><strong>Theorem 5.3 (Irreducibility of Cyclotomic Polynomials).</strong> For every \(n \in \mathbb{Z}^+\), the polynomial \(\Phi_n(x)\) is irreducible over \(\mathbb{Q}\).</div>

The proof proceeds by showing that if \(f(x)\) is the minimal polynomial of any primitive \(n\)-th root of unity over \(\mathbb{Q}\), then every other primitive \(n\)-th root of unity is also a root of \(f\), forcing \(f = \Phi_n\). The key step is a \(p\)-th power argument.

<div class="lemma"><strong>Lemma 5.4.</strong> Let \(g(x) \in \mathbb{F}_p[x]\). Then \(g(x^p) = g(x)^p\).</div>

<div class="proof"><strong>Proof.</strong> Write \(g(x) = \sum_{i=0}^{m} c_i x^i\). By Fermat's Little Theorem, \(c_i^p = c_i\) for each coefficient. By the Binomial Theorem in characteristic \(p\), all middle binomial coefficients \(\binom{p}{k}\) for \(0 < k < p\) vanish, so \((a + b)^p = a^p + b^p\). Applying this repeatedly, \(g(x)^p = \bigl(\sum c_i x^i\bigr)^p = \sum c_i^p x^{ip} = \sum c_i x^{ip} = g(x^p)\). <span class="qed">∎</span></div>

<div class="proof"><strong>Proof of Theorem 5.3.</strong> Let \(\zeta\) be a primitive \(n\)-th root of unity and let \(f(x) \in \mathbb{Q}[x]\) be its minimal polynomial over \(\mathbb{Q}\). Since \(\zeta\) is a root of the monic polynomial \(\Phi_n(x) \in \mathbb{Z}[x]\), Theorem 3.2 gives \(f(x) \in \mathbb{Z}[x]\), and \(f \mid \Phi_n\) in \(\mathbb{Z}[x]\). Write \(x^n - 1 = f(x)g(x)\) with \(g(x) \in \mathbb{Z}[x]\) (this is valid since \(f \mid \Phi_n \mid x^n - 1\) and all polynomials are monic, so long division stays in \(\mathbb{Z}[x]\)).

We will show that if \(\theta\) is any root of \(f\) and \(p\) is any prime with \(\gcd(p, n) = 1\), then \(\theta^p\) is also a root of \(f\). Since every \(k\) with \(\gcd(k, n) = 1\) can be written as a product of primes coprime to \(n\), iterating this step shows that \(\zeta^k\) is a root of \(f\) for every such \(k\), giving \(\Phi_n \mid f\) and hence \(f = \Phi_n\).

Suppose, for contradiction, that \(f(\theta^p) \ne 0\) for some root \(\theta\) of \(f\) and some prime \(p\) with \(p \nmid n\). Then \(\theta^p\) is a root of \(x^n - 1\) but not of \(f\), so \(g(\theta^p) = 0\). Thus \(\theta\) is a root of \(h(x) = g(x^p) \in \mathbb{Z}[x]\). Since \(f\) is the minimal polynomial of \(\theta\), we have \(f \mid h\) in \(\mathbb{Q}[x]\), and since both are in \(\mathbb{Z}[x]\) with \(f\) monic, \(h = fk\) for some \(k \in \mathbb{Z}[x]\).

Reduce modulo \(p\): \(\overline{h}(x) = \overline{g}(x^p) = \overline{g}(x)^p\) by Lemma 5.4. So \(\overline{f}\,\overline{k} = \overline{g}^{\,p}\). Let \(s(x)\) be an irreducible factor of \(\overline{f}\) in \(\mathbb{F}_p[x]\). Then \(s \mid \overline{g}^{\,p}\), hence \(s \mid \overline{g}\). Since \(x^n - 1 = f(x)g(x)\), reducing modulo \(p\) gives \(x^n - 1 = \overline{f}\,\overline{g}\). Since \(s \mid \overline{f}\) and \(s \mid \overline{g}\), we have \(s^2 \mid x^n - 1\) in \(\mathbb{F}_p[x]\).

But the derivative of \(x^n - 1\) is \(nx^{n-1}\), and since \(p \nmid n\), the constant \(n\) is invertible in \(\mathbb{F}_p\). Therefore \(\gcd(x^n - 1, nx^{n-1}) = 1\) in \(\mathbb{F}_p[x]\), which means \(x^n - 1\) has no repeated factors---a contradiction. <span class="qed">∎</span></div>

## The Galois Group of \(\mathbb{Q}(\zeta_n)/\mathbb{Q}\)

Since \(\Phi_n(x)\) is irreducible over \(\mathbb{Q}\), we have \([\mathbb{Q}(\zeta_n) : \mathbb{Q}] = \varphi(n)\). Moreover, all roots of \(\Phi_n\) lie in \(\mathbb{Q}(\zeta_n)\), so the extension is Galois.

<div class="theorem"><strong>Theorem 5.5.</strong> The extension \(\mathbb{Q}(\zeta_n)/\mathbb{Q}\) is Galois of degree \(\varphi(n)\), and there is a canonical isomorphism

\[
\operatorname{Gal}(\mathbb{Q}(\zeta_n)/\mathbb{Q}) \cong (\mathbb{Z}/n\mathbb{Z})^\times
\]
given by sending \(\sigma \in \operatorname{Gal}(\mathbb{Q}(\zeta_n)/\mathbb{Q})\) to the unique \(k \in (\mathbb{Z}/n\mathbb{Z})^\times\) such that \(\sigma(\zeta_n) = \zeta_n^k\).</div>

<div class="proof"><strong>Proof.</strong> The splitting field of \(\Phi_n(x)\) over \(\mathbb{Q}\) is \(\mathbb{Q}(\zeta_n)\) (indeed, it is the splitting field of \(x^n - 1\)), so the extension is Galois. Since \(\Phi_n\) is irreducible, \([\mathbb{Q}(\zeta_n) : \mathbb{Q}] = \deg \Phi_n = \varphi(n)\).

Any automorphism \(\sigma \in \operatorname{Gal}(\mathbb{Q}(\zeta_n)/\mathbb{Q})\) must send \(\zeta_n\) to another root of \(\Phi_n\), which is \(\zeta_n^k\) for some \(k\) with \(\gcd(k, n) = 1\). Define \(\psi : \operatorname{Gal}(\mathbb{Q}(\zeta_n)/\mathbb{Q}) \to (\mathbb{Z}/n\mathbb{Z})^\times\) by \(\psi(\sigma_k) = k\). This is a homomorphism:

\[
\sigma_k \circ \sigma_\ell(\zeta_n) = \sigma_k(\zeta_n^\ell) = (\zeta_n^\ell)^k = \zeta_n^{k\ell} = \sigma_{k\ell}(\zeta_n),
\]
so \(\psi(\sigma_k \circ \sigma_\ell) = k\ell = \psi(\sigma_k)\psi(\sigma_\ell)\). Since an automorphism of \(\mathbb{Q}(\zeta_n)\) is determined by its action on \(\zeta_n\), the map \(\psi\) is injective. Both groups have order \(\varphi(n)\), so \(\psi\) is an isomorphism. <span class="qed">∎</span></div>

<div class="remark"><strong>Remark.</strong> The Galois group \(\operatorname{Gal}(\mathbb{Q}(\zeta_n)/\mathbb{Q})\) is abelian, being isomorphic to \((\mathbb{Z}/n\mathbb{Z})^\times\). By the Kronecker--Weber theorem, every finite abelian extension of \(\mathbb{Q}\) is contained in some cyclotomic field \(\mathbb{Q}(\zeta_n)\). This deep result is a cornerstone of class field theory.</div>

## Ring of Integers of Cyclotomic Fields

One of the most pleasing facts in algebraic number theory is that the ring of integers of \(\mathbb{Q}(\zeta_n)\) is exactly \(\mathbb{Z}[\zeta_n]\)---the "obvious guess" turns out to be correct. We prove this in two stages: first for prime powers, then for general \(n\).

### The Prime Power Case

<div class="theorem"><strong>Theorem 5.6.</strong> Let \(p\) be a prime and \(r \ge 1\). Then \(\mathcal{O}_{\mathbb{Q}(\zeta_{p^r})} = \mathbb{Z}[\zeta_{p^r}]\).</div>

The proof exploits the special arithmetic of the element \(\lambda = 1 - \zeta_{p^r}\), which is a "uniformizer" in the sense that \(p\) is (up to a unit) a high power of \(\lambda\).

<div class="proof"><strong>Proof.</strong> Set \(\zeta = \zeta_{p^r}\) and \(s = \varphi(p^r) = p^{r-1}(p-1)\). Since \(1 - x\) divides \(1 - x^k\) in \(\mathbb{Z}[x]\) for any positive integer \(k\), the element \(1 - \zeta^j\) is divisible by \(1 - \zeta\) in \(\mathcal{O}_K\) for each \(j\). From

\[
p = \Phi_{p^r}(1) = \prod_{\substack{1 \le j \le p^r \\ \gcd(j,p) = 1}} (1 - \zeta^j),
\]
and the fact that each factor \(1 - \zeta^j\) is an associate of \(1 - \zeta\) (since \(\frac{1 - \zeta^j}{1 - \zeta}\) is a unit for \(\gcd(j,p) = 1\)), we obtain \(p = (1 - \zeta)^s \lambda\) for some unit \(\lambda \in \mathcal{O}_K^\times\).

Now the set \(\{1, (1-\zeta), (1-\zeta)^2, \ldots, (1-\zeta)^{s-1}\}\) is a \(\mathbb{Q}\)-basis for \(K\), and \(\operatorname{disc}(1 - \zeta) = \operatorname{disc}(\zeta)\), which is a power of \(p\) by Theorem 5.9 below.

By Theorem 4.18, any \(\alpha \in \mathcal{O}_K\) can be written as

\[
\alpha = \frac{\ell_1 + \ell_2(1-\zeta) + \cdots + \ell_s(1-\zeta)^{s-1}}{d}
\]
where \(d = \operatorname{disc}(\zeta)\) is a power of \(p\) and \(\ell_1, \ldots, \ell_s \in \mathbb{Z}\).

Suppose \(\mathcal{O}_K \ne \mathbb{Z}[\zeta]\). Then there exists \(\alpha \in \mathcal{O}_K \setminus \mathbb{Z}[\zeta]\) of the above form where not all \(\ell_i\) are divisible by \(p\). Let \(i\) be the smallest index with \(p \nmid \ell_i\). Then

\[
\gamma = \frac{\ell_i(1-\zeta)^{i-1} + \cdots + \ell_s(1-\zeta)^{s-1}}{p} \in \mathcal{O}_K.
\]
Since \(p = (1-\zeta)^s \lambda\), multiplying by \((1-\zeta)^{s-i}\lambda\) and simplifying shows that \(\theta = \frac{\ell_i}{1-\zeta} \in \mathcal{O}_K\). Taking norms: \(N(1-\zeta) \cdot N(\theta) = N(\ell_i)\), giving \(p \cdot N(\theta) = \ell_i^s\). Since \(N(\theta) \in \mathbb{Z}\), this forces \(p \mid \ell_i^s\), hence \(p \mid \ell_i\), contradicting our choice. <span class="qed">∎</span></div>

### The General Case

<div class="theorem"><strong>Theorem 5.7.</strong> For every \(n \in \mathbb{Z}^+\), \(\mathcal{O}_{\mathbb{Q}(\zeta_n)} = \mathbb{Z}[\zeta_n]\).</div>

<div class="proof"><strong>Proof.</strong> We proceed by induction on the number of distinct prime factors of \(n\). If \(n = p^r\) is a prime power, the result is Theorem 5.6.

For the inductive step, write \(n = p_1^{a_1} \cdots p_k^{a_k}\) and set \(m = p_1^{a_1} \cdots p_{k-1}^{a_{k-1}}\) and \(q = p_k^{a_k}\). By induction, \(\mathcal{O}_{\mathbb{Q}(\zeta_m)} = \mathbb{Z}[\zeta_m]\) and \(\mathcal{O}_{\mathbb{Q}(\zeta_q)} = \mathbb{Z}[\zeta_q]\).

The compositum of \(\mathbb{Q}(\zeta_m)\) and \(\mathbb{Q}(\zeta_q)\) is \(\mathbb{Q}(\zeta_n)\), since by the Euclidean algorithm there exist integers \(g, h\) with \(\zeta_n = \zeta_m^g \zeta_q^h\). Moreover, \([\mathbb{Q}(\zeta_n) : \mathbb{Q}] = \varphi(n) = \varphi(m)\varphi(q)\), so the extensions have maximal compositum degree. Since \(\operatorname{disc}(\mathbb{Q}(\zeta_m))\) is supported only on primes dividing \(m\) and \(\operatorname{disc}(\mathbb{Q}(\zeta_q))\) is a power of \(p_k\), we have \(\gcd(\operatorname{disc}(\mathbb{Q}(\zeta_m)), \operatorname{disc}(\mathbb{Q}(\zeta_q))) = 1\).

By Theorem 4.21,

\[
\mathcal{O}_{\mathbb{Q}(\zeta_n)} = \mathcal{O}_{\mathbb{Q}(\zeta_m)} \cdot \mathcal{O}_{\mathbb{Q}(\zeta_q)} = \mathbb{Z}[\zeta_m] \cdot \mathbb{Z}[\zeta_q] = \mathbb{Z}[\zeta_m, \zeta_q] = \mathbb{Z}[\zeta_n]. \qedhere
\]
<span class="qed">∎</span></div>

<div class="corollary"><strong>Corollary 5.8.</strong> The set \(\{1, \zeta_n, \zeta_n^2, \ldots, \zeta_n^{\varphi(n)-1}\}\) is an integral basis for \(\mathbb{Q}(\zeta_n)\).</div>

## Constructibility of Regular Polygons

The Galois-theoretic structure of cyclotomic fields yields a complete answer to the ancient Greek problem of constructing regular polygons with straightedge and compass.

<div class="theorem"><strong>Theorem 5.9 (Gauss--Wantzel).</strong> The regular \(n\)-gon is constructible by straightedge and compass if and only if \(n\) is of the form

\[
n = 2^k p_1 p_2 \cdots p_\ell
\]
where \(k \ge 0\) and \(p_1, \ldots, p_\ell\) are distinct Fermat primes (primes of the form \(2^{2^m} + 1\)).</div>

<div class="proof"><strong>Proof.</strong> A point in the plane is constructible from the origin and a unit length if and only if its coordinates lie in a field obtained from \(\mathbb{Q}\) by a tower of quadratic extensions. Thus constructibility of the regular \(n\)-gon is equivalent to \(\zeta_n\) being constructible, which requires \([\mathbb{Q}(\zeta_n) : \mathbb{Q}] = \varphi(n)\) to be a power of 2.

Now \(\varphi(n)\) is a power of 2 if and only if \(n = 2^k p_1 \cdots p_\ell\) where each \(p_i\) is a distinct Fermat prime. Indeed, for an odd prime \(p\), \(\varphi(p^r) = p^{r-1}(p-1)\) is a power of 2 only if \(r = 1\) and \(p - 1\) is a power of 2, i.e., \(p\) is a Fermat prime. <span class="qed">∎</span></div>

<div class="remark"><strong>Remark.</strong> The known Fermat primes are \(3, 5, 17, 257, 65537\). It is unknown whether there are finitely or infinitely many Fermat primes. Gauss famously constructed the regular 17-gon in 1796, at age 19.</div>

## Discriminant of Cyclotomic Fields

<div class="theorem"><strong>Theorem 5.10.</strong> Let \(n \ge 1\) and let \(d = \operatorname{disc}(\mathbb{Q}(\zeta_n))\). Then \(d\) divides \(n^{\varphi(n)}\). If \(p\) is an odd prime, then

\[
\operatorname{disc}(\mathbb{Q}(\zeta_p)) = (-1)^{(p-1)/2} p^{p-2}.
\]
More generally, if \(n = p_1^{k_1} \cdots p_\ell^{k_\ell}\), then

\[
\operatorname{disc}(\mathbb{Q}(\zeta_n)) = (-1)^{\varphi(n)/2} \prod_{i=1}^{\ell} p_i^{b_i}
\]
where \(b_i = \varphi(n)\bigl(k_i - \frac{1}{p_i - 1}\bigr)\).</div>

<div class="proof"><strong>Proof.</strong> Since \(x^n - 1 = \Phi_n(x) g(x)\) with \(g \in \mathbb{Z}[x]\), differentiating and evaluating at \(\zeta_n\) gives

\[
n\zeta_n^{n-1} = \Phi_n'(\zeta_n) g(\zeta_n).
\]
Taking norms over \(\mathbb{Q}(\zeta_n)/\mathbb{Q}\):

\[
n^{\varphi(n)} \cdot N(\zeta_n^{n-1}) = N(\Phi_n'(\zeta_n)) \cdot N(g(\zeta_n)).
\]
Since \(\zeta_n\) is a unit in \(\mathcal{O}_{\mathbb{Q}(\zeta_n)}\), \(N(\zeta_n^{n-1}) = \pm 1\). By Theorem 4.16, \(N(\Phi_n'(\zeta_n)) = (-1)^{\varphi(n)(\varphi(n)-1)/2} \operatorname{disc}(\zeta_n) = \pm \operatorname{disc}(\mathbb{Q}(\zeta_n))\). Since \(g(\zeta_n) \in \mathcal{O}_{\mathbb{Q}(\zeta_n)}\), \(N(g(\zeta_n)) \in \mathbb{Z}\). Therefore \(\operatorname{disc}(\mathbb{Q}(\zeta_n))\) divides \(n^{\varphi(n)}\).

For \(p\) an odd prime, \(\Phi_p(x) = \frac{x^p - 1}{x - 1}\) and \(g(x) = x - 1\). Differentiating \(x^p - 1 = \Phi_p(x)(x-1)\) and substituting \(x = \zeta_p\):

\[
p\zeta_p^{p-1} = \Phi_p'(\zeta_p)(\zeta_p - 1).
\]
Taking norms: \(p^{p-1} = N(\Phi_p'(\zeta_p)) \cdot N(\zeta_p - 1)\). Now \(N(\zeta_p - 1) = \prod_{j=1}^{p-1}(\zeta_p^j - 1) = (-1)^{p-1}\Phi_p(1) = p\) and \(N(\zeta_p^{p-1}) = 1\) since \(p-1\) is even. Also, \(N(\Phi_p'(\zeta_p)) = (-1)^{(p-1)(p-2)/2} \operatorname{disc}(\zeta_p)\). Therefore

\[
p^{p-1} = (-1)^{(p-1)(p-2)/2} \operatorname{disc}(\zeta_p) \cdot p,
\]
giving \(\operatorname{disc}(\mathbb{Q}(\zeta_p)) = (-1)^{(p-1)/2} p^{p-2}\). (Here we use that \((-1)^{(p-1)(p-2)/2} = (-1)^{(p-1)/2}\) since \(p\) is odd.) <span class="qed">∎</span></div>

<div class="example"><strong>Example.</strong> For \(p = 5\): \(\operatorname{disc}(\mathbb{Q}(\zeta_5)) = (-1)^2 \cdot 5^3 = 125\). For \(p = 7\): \(\operatorname{disc}(\mathbb{Q}(\zeta_7)) = (-1)^3 \cdot 7^5 = -16807\). The negative sign reflects the fact that \(\mathbb{Q}(\zeta_7)\) has \(r_2 = 3\) (an odd number of) pairs of complex embeddings.</div>

<div class="remark"><strong>Remark.</strong> The discriminant formula shows that \(\operatorname{disc}(\mathbb{Q}(\zeta_n))\) is supported only on the primes dividing \(n\). This is the first hint of a deep connection between the discriminant and ramification: a prime \(p\) ramifies in \(\mathbb{Q}(\zeta_n)\) if and only if \(p \mid n\), and this happens if and only if \(p \mid \operatorname{disc}(\mathbb{Q}(\zeta_n))\).</div>
# Chapter 6: Composita and Resultants

In earlier chapters, we developed techniques for computing discriminants via the trace pairing. But for many number fields, computing the discriminant directly from the definition --- as a product of differences of conjugates squared --- is impractical. In this chapter, we introduce the <strong>resultant</strong>, a powerful algebraic tool that reduces discriminant computation to a determinant calculation. We then turn to the theory of <strong>composita</strong>, which governs what happens when two number fields are "combined," and we use it to prove that the ring of integers of any cyclotomic field has the expected form. The chapter closes with a striking example, due to Dedekind, of a number field whose ring of integers admits no power basis.

## The Resultant

### Definition and the Sylvester Matrix

The resultant of two polynomials encodes, in a single determinant, whether the polynomials share a common root. It will serve as the key computational bridge between the minimal polynomial of an algebraic number and its discriminant.

<div class="definition"><strong>Definition 6.1 (Resultant).</strong> Let \(f(x) = a_n x^n + a_{n-1}x^{n-1} + \cdots + a_0\) and \(g(x) = b_m x^m + b_{m-1}x^{m-1} + \cdots + b_0\) be polynomials in \(\mathbb{C}[x]\) of degrees \(n\) and \(m\) respectively. The <strong>resultant</strong> of \(f\) and \(g\), denoted \(R(f,g)\), is the determinant of the \((n+m) \times (n+m)\) <strong>Sylvester matrix</strong>:

\[
R(f,g) = \det \begin{pmatrix}
a_n & a_{n-1} & \cdots & a_0 & & & 0 \\
0 & a_n & a_{n-1} & \cdots & a_0 & & \\
\vdots & & \ddots & & & \ddots & \\
0 & \cdots & 0 & a_n & a_{n-1} & \cdots & a_0 \\
b_m & b_{m-1} & \cdots & b_0 & & & 0 \\
0 & b_m & b_{m-1} & \cdots & b_0 & & \\
\vdots & & \ddots & & & \ddots & \\
0 & \cdots & 0 & b_m & b_{m-1} & \cdots & b_0
\end{pmatrix}
\]
where the first \(m\) rows are shifts of the coefficients of \(f\), and the last \(n\) rows are shifts of the coefficients of \(g\).
</div>

The resultant \(R(f,g)\) is homogeneous of degree \(m\) in the coefficients \(a_i\) and of degree \(n\) in the coefficients \(b_j\). This observation will be crucial when we derive the product formula.

### Resultant and Common Roots

The fundamental property of the resultant is that it detects shared roots.

<div class="proposition"><strong>Proposition 6.2.</strong> Let \(f, g \in \mathbb{C}[x]\) with \(\deg f = n\) and \(\deg g = m\). The following are equivalent:
<br>(i) \(f\) and \(g\) have a common root in \(\mathbb{C}\).
<br>(ii) There exist polynomials \(h, k \in \mathbb{C}[x]\) with \(\deg h \le m-1\) and \(\deg k \le n-1\) such that \(h(x)f(x) = k(x)g(x)\).
<br>(iii) \(R(f,g) = 0\).
</div>

<div class="proof"><strong>Proof.</strong> <strong>(i) \(\Rightarrow\) (ii):</strong> If \(\alpha\) is a common root, write \(f(x) = (x - \alpha)k(x)\) and \(g(x) = (x - \alpha)h(x)\). Then \(h(x)f(x) = (x-\alpha)h(x)k(x) = k(x)g(x)\), with \(\deg h \le m-1\) and \(\deg k \le n-1\).

<strong>(ii) \(\Rightarrow\) (i):</strong> If \(h(x)f(x) = k(x)g(x)\) with \(\deg h \le m-1\) and \(\deg k \le n-1\), then comparing degrees, the roots of \(k\) cannot account for all roots of \(f\), so some root of \(f\) must also be a root of \(g\).

<strong>(ii) \(\Leftrightarrow\) (iii):</strong> Write \(h(x) = c_{m-1}x^{m-1} + \cdots + c_0\) and \(k(x) = d_{n-1}x^{n-1} + \cdots + d_0\). Comparing coefficients of \(x^{n+m-1}, x^{n+m-2}, \ldots, x^0\) in the equation \(hf = kg\) gives a system of \(n+m\) linear equations in the \(n+m\) unknowns \(c_0, \ldots, c_{m-1}, -d_0, \ldots, -d_{n-1}\). This system has a nontrivial solution if and only if the coefficient matrix has zero determinant, and this determinant is precisely the transpose of the Sylvester matrix. Since \(\det(A) = \det(A^T)\), condition (ii) holds if and only if \(R(f,g) = 0\). <span class="qed">∎</span>
</div>

### The Product Formula for Resultants

The most useful computational form of the resultant expresses it directly in terms of the roots of the two polynomials.

<div class="theorem"><strong>Theorem 6.3 (Product Formula).</strong> Let \(f, g \in \mathbb{C}[x]\) with \(f(x) = a_n(x - x_1)\cdots(x - x_n)\) and \(g(x) = b_m(x - y_1)\cdots(x - y_m)\). Then

\[
R(f,g) = a_n^m \, b_m^n \prod_{i=1}^{n}\prod_{j=1}^{m}(x_i - y_j).
\]
Equivalently,

\[
R(f,g) = a_n^m \prod_{i=1}^{n} g(x_i) = (-1)^{mn}\, b_m^n \prod_{j=1}^{m} f(y_j).
\]
</div>

<div class="proof"><strong>Proof.</strong> Define

\[
S = a_n^m \, b_m^n \prod_{i,j}(x_i - y_j).
\]
We regard the \(x_i\) and \(y_j\) as indeterminates and work in the polynomial ring \(\mathbb{C}[x_1, \ldots, x_n, y_1, \ldots, y_m]\). By Proposition 6.2, whenever \(x_i = y_j\) we have \(R(f,g) = 0\), so \((x_i - y_j)\) divides \(R(f,g)\). Since these are distinct irreducible elements in a UFD, the full product \(\prod_{i,j}(x_i - y_j)\) divides \(R(f,g)\).

Now \(S\) is homogeneous of degree \(m\) in the \(a_i\) (via the symmetric functions of the \(x_i\)) and of degree \(n\) in the \(b_j\) (via the symmetric functions of the \(y_j\)), matching the degrees of \(R(f,g)\). Since \(S\) divides \(R\) and both have the same degree, we have \(R = cS\) for some constant \(c \in \mathbb{C}\).

Comparing leading terms: the coefficient of \(a_n^m b_m^n\) in \(R(f,g)\) is \(1\) (from the Sylvester determinant), and the same coefficient in \(S\) is \(1\). Therefore \(c = 1\), and \(R(f,g) = S\).

The alternative forms follow because \(g(x) = b_m \prod_{j=1}^m (x - y_j)\), so \(a_n^m \prod_{i=1}^n g(x_i) = S\), and similarly for \(f(y_j)\). <span class="qed">∎</span>
</div>

### Discriminant as a Resultant

The product formula gives us an elegant connection between the discriminant and the resultant, which is the primary reason we developed this machinery.

<div class="corollary"><strong>Corollary 6.4 (Discriminant--Resultant Formula).</strong> Let \(\alpha\) be algebraic over \(\mathbb{Q}\) with minimal polynomial \(f(x) = x^n + a_{n-1}x^{n-1} + \cdots + a_0\), and let \(\alpha = \alpha_1, \alpha_2, \ldots, \alpha_n\) be its conjugates. Then

\[
\operatorname{disc}(\alpha) = (-1)^{n(n-1)/2}\, R(f, f').
\]
</div>

<div class="proof"><strong>Proof.</strong> Since \(f\) is monic of degree \(n\) and \(f'\) has degree \(n-1\) with leading coefficient \(n\), the product formula gives

\[
R(f, f') = \prod_{i=1}^{n} f'(\alpha_i).
\]
Now \(f(x) = \prod_{k=1}^n (x - \alpha_k)\), so

\[
f'(\alpha_i) = \prod_{\substack{j=1 \\ j \ne i}}^{n} (\alpha_i - \alpha_j).
\]
Therefore

\[
R(f, f') = \prod_{i=1}^{n} \prod_{\substack{j=1 \\ j \ne i}}^{n} (\alpha_i - \alpha_j) = (-1)^{n(n-1)/2} \prod_{1 \le i < j \le n} (\alpha_i - \alpha_j)^2 = (-1)^{n(n-1)/2}\, \operatorname{disc}(\alpha).
\]
The sign arises because the ordered product over all \(i \ne j\) pairs differs from the product over \(i < j\) by a factor of \((-1)^{n(n-1)/2}\). <span class="qed">∎</span>
</div>

This formula is extremely practical: to compute \(\operatorname{disc}(\theta)\) for a root \(\theta\) of an irreducible polynomial \(f\), one simply evaluates a \((2n-1) \times (2n-1)\) determinant rather than computing all conjugates explicitly.

<div class="example"><strong>Example.</strong> Let \(\theta\) be a root of \(f(x) = x^3 + x^2 - 2x + 8\), so \(f'(x) = 3x^2 + 2x - 2\). The Sylvester matrix is \(5 \times 5\):

\[
R(f, f') = \det \begin{pmatrix}
1 & 1 & -2 & 8 & 0 \\
0 & 1 & 1 & -2 & 8 \\
3 & 2 & -2 & 0 & 0 \\
0 & 3 & 2 & -2 & 0 \\
0 & 0 & 3 & 2 & -2
\end{pmatrix} = 2012 = 4 \cdot 503.
\]
Since \(n = 3\), we get \(\operatorname{disc}(\theta) = (-1)^{3 \cdot 2/2} \cdot 2012 = -2012 = -4 \cdot 503\).
</div>

## Composita of Number Fields

When studying multiple number fields simultaneously, it is natural to ask what happens when we "combine" them. The compositum provides the answer.

<div class="definition"><strong>Definition 6.5 (Compositum).</strong> If \(K\) and \(L\) are number fields (subfields of \(\mathbb{C}\)), the <strong>compositum</strong> \(KL\) is the smallest subfield of \(\mathbb{C}\) containing both \(K\) and \(L\).
</div>

The compositum \(KL\) is generated over \(\mathbb{Q}\) by the union \(K \cup L\); equivalently, it consists of all finite \(\mathbb{Q}\)-linear combinations of products \(\alpha\beta\) with \(\alpha \in K\) and \(\beta \in L\).

<div class="lemma"><strong>Lemma 6.6.</strong> Let \([K : \mathbb{Q}] = m\) and \([L : \mathbb{Q}] = n\). Then:
<br>(i) \([KL : \mathbb{Q}] \le mn\).
<br>(ii) \([KL : \mathbb{Q}] = mn\) if and only if for every pair of embeddings \(\sigma : K \hookrightarrow \mathbb{C}\) and \(\tau : L \hookrightarrow \mathbb{C}\), there exists a unique embedding \(\varepsilon : KL \hookrightarrow \mathbb{C}\) with \(\varepsilon|_K = \sigma\) and \(\varepsilon|_L = \tau\).
</div>

<div class="proof"><strong>Proof.</strong> (i) We have \([KL : \mathbb{Q}] = [KL : K] \cdot [K : \mathbb{Q}] \le [L : \mathbb{Q}] \cdot [K : \mathbb{Q}] = mn\), since \(KL\) is generated over \(K\) by the elements of \(L\), and \([KL : K] \le [L : \mathbb{Q}]\).

(ii) If \([KL : \mathbb{Q}] = mn\), then \(KL\) has exactly \(mn\) embeddings into \(\mathbb{C}\). Each embedding \(\varepsilon : KL \hookrightarrow \mathbb{C}\) is determined by \(\varepsilon|_K\) and \(\varepsilon|_L\) (since products of elements of \(K\) and \(L\) generate \(KL\)). There are \(m\) choices for \(\varepsilon|_K\) and \(n\) choices for \(\varepsilon|_L\), giving \(mn\) pairs, and since there are exactly \(mn\) embeddings, each pair \((\sigma, \tau)\) corresponds to a unique embedding. The converse is similar. <span class="qed">∎</span>
</div>

### Ring of Integers of Composita

The central result in the theory of composita connects the ring of integers of \(KL\) to the rings of integers of \(K\) and \(L\), using the discriminant as the controlling quantity.

<div class="theorem"><strong>Theorem 6.7 (Ring of Integers of a Compositum).</strong> Let \(K\) and \(L\) be number fields with \([K : \mathbb{Q}] = m\), \([L : \mathbb{Q}] = n\), and \([KL : \mathbb{Q}] = mn\). Let \(d = \gcd(\operatorname{disc}(K), \operatorname{disc}(L))\). Then

\[
\mathcal{O}_{KL} \subseteq \frac{1}{d}\, \mathcal{O}_K \mathcal{O}_L.
\]
In particular, if \(\gcd(\operatorname{disc}(K), \operatorname{disc}(L)) = 1\), then \(\mathcal{O}_{KL} = \mathcal{O}_K \mathcal{O}_L\).
</div>

<div class="proof"><strong>Proof.</strong> Let \(\{\alpha_1, \ldots, \alpha_m\}\) be an integral basis for \(K\) and \(\{\beta_1, \ldots, \beta_n\}\) an integral basis for \(L\). Since \([KL : \mathbb{Q}] = mn\), the products \(\alpha_i \beta_j\) form a \(\mathbb{Q}\)-basis of \(KL\). Every \(\gamma \in KL\) can thus be written as

\[
\gamma = \sum_{i,j} \frac{a_{ij}}{r}\, \alpha_i \beta_j
\]
where \(a_{ij}, r \in \mathbb{Z}\) with \(\gcd(a_{11}, \ldots, a_{mn}, r) = 1\). If \(\gamma \in \mathcal{O}_{KL}\), we must show that \(r \mid d\).

By symmetry, it suffices to show \(r \mid \operatorname{disc}(K)\). Since \([KL : \mathbb{Q}] = mn\), for each embedding \(\sigma_i : K \hookrightarrow \mathbb{C}\), there exists an extension \(\sigma_i' : KL \hookrightarrow \mathbb{C}\) that fixes \(L\) pointwise (by Lemma 6.6). Set \(x_i = \sum_{j=1}^n \frac{a_{ij}}{r} \beta_j \in L\) for each \(i\), so that

\[
\sigma_i'(\gamma) = \sum_{k=1}^m \sigma_i(\alpha_k) \, x_k.
\]
By Cramer's rule, \(x_k = \gamma_k / \delta\), where \(\delta = \det(\sigma_i(\alpha_j))\) satisfies \(\delta^2 = \operatorname{disc}(K)\), and each \(\gamma_k\) is an algebraic integer. Then \(\operatorname{disc}(K) \cdot x_k = \delta \gamma_k \in \mathcal{O}_K\), and since \(x_k \in L\), we have \(\operatorname{disc}(K) \cdot x_k \in \mathcal{O}_L\). In particular,

\[
\frac{\operatorname{disc}(K) \cdot a_{ij}}{r} \in \mathbb{Z}
\]
for all \(i, j\). Since \(\gcd(a_{11}, \ldots, a_{mn}, r) = 1\), it follows that \(r \mid \operatorname{disc}(K)\). By the same argument applied to \(L\), we get \(r \mid \operatorname{disc}(L)\), so \(r \mid d\). <span class="qed">∎</span>
</div>

<div class="remark"><strong>Remark.</strong> When the discriminants are coprime (\(d = 1\)), the theorem gives \(\mathcal{O}_{KL} = \mathcal{O}_K \mathcal{O}_L\). This is a remarkably clean result: the ring of integers of the compositum is generated (as a \(\mathbb{Z}\)-module) by all pairwise products of integral basis elements from \(K\) and \(L\).
</div>

### Application: The Ring of Integers of \(\mathbb{Q}(\zeta_n)\)

The theory of composita gives a clean inductive proof that cyclotomic rings of integers have the expected form.

<div class="theorem"><strong>Theorem 6.8.</strong> For any positive integer \(n\), the ring of integers of \(\mathbb{Q}(\zeta_n)\) is \(\mathbb{Z}[\zeta_n]\).
</div>

<div class="proof"><strong>Proof.</strong> We proceed by induction on the number of distinct prime power factors of \(n\). The base case \(n = p^r\) (a prime power) is proved by a direct argument using the factorization \(p = (1 - \zeta_{p^r})^{\varphi(p^r)} \cdot \lambda\) for a unit \(\lambda \in \mathcal{O}_{\mathbb{Q}(\zeta_{p^r})}\), and showing that no non-integral rational combination of the basis \(\{1, 1-\zeta_{p^r}, \ldots, (1-\zeta_{p^r})^{s-1}\}\) (where \(s = \varphi(p^r)\)) can be an algebraic integer.

For the inductive step, write \(n = p_1^{e_1} \cdots p_k^{e_k}\), and set \(m = p_1^{e_1} \cdots p_{k-1}^{e_{k-1}}\). Let \(K = \mathbb{Q}(\zeta_m)\) and \(L = \mathbb{Q}(\zeta_{p_k^{e_k}})\). By induction, \(\mathcal{O}_K = \mathbb{Z}[\zeta_m]\) and \(\mathcal{O}_L = \mathbb{Z}[\zeta_{p_k^{e_k}}]\).

First, \(KL = \mathbb{Q}(\zeta_n)\): since \(\gcd(m, p_k^{e_k}) = 1\), there exist integers \(x, y\) with \(xm + yp_k^{e_k} = 1\), so \(\zeta_n = \zeta_m^y \cdot \zeta_{p_k^{e_k}}^x \in KL\). Moreover,

\[
\varphi(n) = \varphi(m)\,\varphi(p_k^{e_k}) = [K : \mathbb{Q}] \cdot [L : \mathbb{Q}] \ge [KL : \mathbb{Q}] \ge [\mathbb{Q}(\zeta_n) : \mathbb{Q}] = \varphi(n),
\]
so \([KL : \mathbb{Q}] = [K : \mathbb{Q}][L : \mathbb{Q}]\). Since \(\operatorname{disc}(K)\) is a power of \(p_1 \cdots p_{k-1}\) and \(\operatorname{disc}(L)\) is a power of \(p_k\), we have \(\gcd(\operatorname{disc}(K), \operatorname{disc}(L)) = 1\). By Theorem 6.7,

\[
\mathbb{Z}[\zeta_n] \subseteq \mathcal{O}_{\mathbb{Q}(\zeta_n)} \subseteq \mathcal{O}_K \mathcal{O}_L = \mathbb{Z}[\zeta_m] \cdot \mathbb{Z}[\zeta_{p_k^{e_k}}] = \mathbb{Z}[\zeta_n],
\]
so \(\mathcal{O}_{\mathbb{Q}(\zeta_n)} = \mathbb{Z}[\zeta_n]\). <span class="qed">∎</span>
</div>

## Dedekind's Example: A Non-Monogenic Number Field

Not every number field has a power basis. Dedekind constructed the first example of this phenomenon.

<div class="theorem"><strong>Theorem 6.9 (Dedekind).</strong> Let \(\theta\) be a root of \(f(x) = x^3 + x^2 - 2x + 8\) and \(K = \mathbb{Q}(\theta)\). Then \(\mathcal{O}_K\) has no power basis; that is, there is no \(\lambda \in \mathcal{O}_K\) such that \(\{1, \lambda, \lambda^2\}\) is an integral basis.
</div>

<div class="proof"><strong>Proof.</strong> From Example 6.4 (via the resultant), \(\operatorname{disc}(\theta) = -4 \cdot 503\). One checks that \(\omega = (\theta^2 + \theta)/2 \in \mathcal{O}_K\) (by verifying that its minimal polynomial has integer coefficients, using the relations among the conjugates). A change-of-basis calculation then gives \(\operatorname{disc}(1, \theta, \omega) = -503\). Since \(503\) is prime, \(\{1, \theta, \omega\}\) is an integral basis and \(\operatorname{disc}(K) = -503\).

Now suppose \(\lambda \in \mathcal{O}_K\) with \(\{1, \lambda, \lambda^2\}\) an integral basis. Write \(\lambda = a + b\theta + c\omega\) for \(a, b, c \in \mathbb{Z}\). A computation shows that \(\lambda^2 = A_1 + A_2 \theta + A_3 \omega\) where

\[
A_1 = a^2 - 2c^2 - 8bc, \quad A_2 = -2c^2 + 2ab + 2bc - b^2, \quad A_3 = 2b^2 + 2ac + c^2.
\]
By the change-of-basis formula,

\[
\operatorname{disc}(\lambda) = -503 \cdot (bA_3 - cA_2)^2 = -503 \cdot (2b^3 - bc^2 + b^2c + 2c^3)^2.
\]
But \(2b^3 - bc^2 + b^2c + 2c^3 \equiv bc(b - c) \pmod{2}\), which is always even. Therefore \(4 \mid \operatorname{disc}(\lambda)\), so \(\operatorname{disc}(\lambda) \ne -503 = \operatorname{disc}(K)\), and \(\{1, \lambda, \lambda^2\}\) can never be an integral basis. <span class="qed">∎</span>
</div>

<div class="remark"><strong>Remark.</strong> A number field \(K\) is called <strong>monogenic</strong> if \(\mathcal{O}_K = \mathbb{Z}[\alpha]\) for some \(\alpha\). Dedekind's example shows that monogenicity is a special property, not enjoyed by all number fields. The obstruction is fundamentally arithmetic: it depends on the divisibility properties of discriminants modulo small primes.
</div>

---

# Chapter 7: Dedekind Domains and Ideal Factorization

The passage from elements to ideals is the central paradigm of algebraic number theory. In the integers \(\mathbb{Z}\), every element factors uniquely into primes. But in a general ring of integers \(\mathcal{O}_K\), unique factorization of elements can fail. The miracle, discovered by Dedekind, is that unique factorization is <em>always</em> recovered at the level of ideals. In this chapter, we develop the abstract framework of Dedekind domains, prove the unique factorization of ideals, and show how to compute prime factorizations in practice via the Kummer--Dedekind theorem.

## Failure of Unique Factorization

To motivate the theory, we begin with the classical example showing that unique factorization of elements can fail.

<div class="example"><strong>Example.</strong> In the ring \(\mathbb{Z}[\sqrt{-5}]\), consider the two factorizations

\[
6 = 2 \cdot 3 = (1 + \sqrt{-5})(1 - \sqrt{-5}).
\]
Each of \(2, 3, 1+\sqrt{-5}, 1-\sqrt{-5}\) is irreducible in \(\mathbb{Z}[\sqrt{-5}]\) (as can be verified using the norm \(N(a + b\sqrt{-5}) = a^2 + 5b^2\)), and yet they give two genuinely different factorizations. This means \(\mathbb{Z}[\sqrt{-5}]\) is not a UFD.
</div>

The failure is not incidental --- it reflects a deep structural feature. The key insight, due to Kummer and Dedekind, is that while elements may not factor uniquely, <em>ideals</em> always do, provided the ring satisfies certain natural conditions. The abstract encapsulation of these conditions is the notion of a Dedekind domain.

## Noetherian Rings

The first ingredient is a finiteness condition on ideals.

<div class="definition"><strong>Definition 7.1 (Noetherian Ring).</strong> A commutative ring \(R\) is called <strong>Noetherian</strong> if every ideal of \(R\) is finitely generated as an \(R\)-module.
</div>

There are several equivalent characterizations.

<div class="proposition"><strong>Proposition 7.2 (Equivalent Conditions for Noetherian).</strong> Let \(R\) be a commutative ring. The following are equivalent:
<br>(i) (Ascending Chain Condition) Every ascending chain of ideals \(I_1 \subseteq I_2 \subseteq I_3 \subseteq \cdots\) eventually stabilizes: there exists \(N\) such that \(I_k = I_N\) for all \(k \ge N\).
<br>(ii) (Maximal Condition) Every nonempty collection of ideals of \(R\) has a maximal element.
<br>(iii) \(R\) is Noetherian.
</div>

<div class="proof"><strong>Proof.</strong> <strong>(iii) \(\Rightarrow\) (i):</strong> Given an ascending chain \(I_1 \subseteq I_2 \subseteq \cdots\), the union \(I = \bigcup_{k=1}^{\infty} I_k\) is an ideal. Since \(R\) is Noetherian, \(I = (a_1, \ldots, a_r)\). Each \(a_i\) lies in some \(I_{k_i}\); setting \(N = \max(k_1, \ldots, k_r)\) gives \(I \subseteq I_N\), so the chain stabilizes at \(N\).

<strong>(i) \(\Rightarrow\) (ii):</strong> If a nonempty collection \(\mathcal{S}\) had no maximal element, we could build a strictly ascending chain \(I_1 \subsetneq I_2 \subsetneq \cdots\) in \(\mathcal{S}\), contradicting (i).

<strong>(ii) \(\Rightarrow\) (iii):</strong> Let \(I\) be an ideal. Consider the collection \(\mathcal{S}\) of finitely generated ideals contained in \(I\). By (ii), \(\mathcal{S}\) has a maximal element \(M = (a_1, \ldots, a_r)\). If \(M \ne I\), choose \(b \in I \setminus M\); then \((a_1, \ldots, a_r, b) \in \mathcal{S}\) strictly contains \(M\), contradicting maximality. So \(M = I\) is finitely generated. <span class="qed">∎</span>
</div>

<div class="remark"><strong>Remark.</strong> The most basic example of a Noetherian domain is a PID. By Hilbert's basis theorem, if \(R\) is Noetherian then so is \(R[x]\). Quotient rings of Noetherian rings are again Noetherian. Thus a great many rings encountered in practice are Noetherian.
</div>

## Dedekind Domains

<div class="definition"><strong>Definition 7.3 (Dedekind Domain).</strong> An integral domain \(R\) is a <strong>Dedekind domain</strong> if it satisfies the following three properties:
<br>(1) \(R\) is Noetherian.
<br>(2) Every nonzero prime ideal of \(R\) is maximal.
<br>(3) \(R\) is integrally closed in its field of fractions.
</div>

Condition (2) says that the nonzero primes of \(R\) form a single "layer" in the spectrum: there is no room for a chain \((0) \subsetneq P \subsetneq Q\) of primes. Condition (3) says that any element of \(\operatorname{Frac}(R)\) satisfying a monic polynomial over \(R\) already lies in \(R\).

<div class="example"><strong>Example.</strong> Every PID is a Dedekind domain. In particular, \(\mathbb{Z}\) is a Dedekind domain.
</div>

<div class="example"><strong>Example.</strong> The ring \(\mathbb{Z}[\sqrt{-5}]\) is <em>not</em> integrally closed in \(\mathbb{Q}(\sqrt{-5})\) (since \((1+\sqrt{-5})/2\) might or might not be integral --- in fact, it is not, and \(\mathbb{Z}[\sqrt{-5}] = \mathcal{O}_{\mathbb{Q}(\sqrt{-5})}\) since \(-5 \equiv 3 \pmod{4}\)). So \(\mathbb{Z}[\sqrt{-5}]\) is actually a Dedekind domain. On the other hand, \(\mathbb{Z}[\sqrt{5}]\) is <em>not</em> integrally closed, since \((1+\sqrt{5})/2\) is a root of \(x^2 - x - 1 \in \mathbb{Z}[x]\) and lies in \(\mathbb{Q}(\sqrt{5})\) but not in \(\mathbb{Z}[\sqrt{5}]\).
</div>

The theorem that makes the whole theory work is the following.

<div class="theorem"><strong>Theorem 7.4.</strong> Let \(K\) be a number field. Then \(\mathcal{O}_K\) is a Dedekind domain.
</div>

<div class="proof"><strong>Proof.</strong> We verify the three conditions.

<strong>(1) \(\mathcal{O}_K\) is Noetherian.</strong> Every nonzero ideal \(I \subseteq \mathcal{O}_K\) has an integral basis \(\{\alpha_1, \ldots, \alpha_n\}\) (Theorem 8.4 of the previous chapter), so \(I = (\alpha_1, \ldots, \alpha_n)\) is finitely generated.

<strong>(2) Every nonzero prime ideal is maximal.</strong> Let \(P \subseteq \mathcal{O}_K\) be a nonzero prime ideal. It suffices to show \(\mathcal{O}_K / P\) is a field. Since \(P\) is nonzero, it contains a nonzero integer \(a \in P \cap \mathbb{Z}_{>0}\) (take the norm of any nonzero element). If \(\{\omega_1, \ldots, \omega_n\}\) is an integral basis for \(\mathcal{O}_K\), then every element of \(\mathcal{O}_K/P\) is represented by an integer linear combination of \(\omega_1, \ldots, \omega_n\) with coefficients in \(\{0, 1, \ldots, a-1\}\). Hence \(|\mathcal{O}_K/P| \le a^n < \infty\). Since every finite integral domain is a field, \(P\) is maximal.

<strong>(3) \(\mathcal{O}_K\) is integrally closed.</strong> Suppose \(\gamma \in K\) satisfies \(\gamma^m + c_{m-1}\gamma^{m-1} + \cdots + c_0 = 0\) with \(c_i \in \mathcal{O}_K\). Then \(\gamma\) lies in the ring \(A = \mathbb{Z}[c_0, \ldots, c_{m-1}, \gamma]\). Since each \(c_i\) is an algebraic integer of degree at most \([K : \mathbb{Q}]\), and \(\gamma^m\) can be expressed in terms of lower powers using the relation, the ring \(A\) is finitely generated as an abelian group. Hence \(\gamma\) is an algebraic integer, so \(\gamma \in \mathcal{O}_K\). <span class="qed">∎</span>
</div>

## Every Ideal Contains a Product of Primes

The first step toward unique factorization of ideals is showing that every nonzero ideal is "bounded below" by a product of prime ideals.

<div class="lemma"><strong>Lemma 7.5.</strong> Let \(R\) be a Dedekind domain. Then every nonzero ideal of \(R\) contains a product of prime ideals.
</div>

<div class="proof"><strong>Proof.</strong> Let \(\mathcal{S}\) be the set of nonzero ideals that do <em>not</em> contain any product of prime ideals. Suppose for contradiction that \(\mathcal{S} \ne \emptyset\). Since \(R\) is Noetherian, \(\mathcal{S}\) has a maximal element \(M\).

The ideal \(M\) is not prime (since any prime ideal contains itself, a product of one prime). So there exist \(r, s \in R \setminus M\) with \(rs \in M\). Set \(M_1 = M + (r)\) and \(M_2 = M + (s)\). Both \(M_1\) and \(M_2\) strictly contain \(M\), so neither is in \(\mathcal{S}\). Hence each contains a product of prime ideals: say \(P_1 \cdots P_\ell \subseteq M_1\) and \(Q_1 \cdots Q_k \subseteq M_2\). But then

\[
P_1 \cdots P_\ell \, Q_1 \cdots Q_k \subseteq M_1 M_2 \subseteq M,
\]
contradicting \(M \in \mathcal{S}\). <span class="qed">∎</span>
</div>

## The Inverse Ideal

To "divide" ideals, we need the notion of an inverse.

<div class="definition"><strong>Definition 7.6 (Fractional Ideal).</strong> Let \(R\) be a Dedekind domain with field of fractions \(K\). A <strong>fractional ideal</strong> of \(R\) is a nonzero finitely generated \(R\)-submodule of \(K\). An <strong>integral ideal</strong> is a fractional ideal contained in \(R\) (i.e., an ordinary nonzero ideal of \(R\)).
</div>

Every fractional ideal \(I\) has a "denominator": there exists \(0 \ne d \in R\) with \(dI \subseteq R\), so \(I = \frac{1}{d}J\) for some integral ideal \(J\).

<div class="definition"><strong>Definition 7.7 (Ideal Inverse).</strong> For a nonzero ideal \(I\) of a Dedekind domain \(R\) with field of fractions \(K\), the <strong>inverse</strong> of \(I\) is

\[
I^{-1} = (R : I) = \{ a \in K \mid aI \subseteq R \}.
\]
</div>

The crucial result is that prime ideals are invertible.

<div class="lemma"><strong>Lemma 7.8.</strong> Let \(R\) be a Dedekind domain and \(I \subsetneq R\) a proper nonzero ideal. Then there exists \(\gamma \in K \setminus R\) such that \(\gamma I \subseteq R\).
</div>

<div class="proof"><strong>Proof.</strong> Let \(0 \ne a \in I\). By Lemma 7.5, \((a) \supseteq P_1 \cdots P_r\) for some prime ideals \(P_i\); choose \(r\) minimal. Let \(M\) be a maximal ideal containing \(I\). Since \(M\) is prime and \(M \supseteq (a) \supseteq P_1 \cdots P_r\), we have \(M \supseteq P_i\) for some \(i\); since primes are maximal, \(M = P_i\), say \(M = P_1\).

If \(r = 1\), then \(P_1 \subseteq (a) \subseteq I\), so \(P_1 = (a) = I\) (since \(P_1\) is maximal). Take \(\gamma = 1/a \in K \setminus R\); then \(\gamma I = R\).

If \(r > 1\), by minimality of \(r\), \(P_2 \cdots P_r \not\subseteq (a)\). Choose \(b \in P_2 \cdots P_r \setminus (a)\) and set \(\gamma = b/a\). Then \(\gamma \notin R\) (since \(b \notin (a)\)), but \(\gamma I \subseteq \gamma P_1 \subseteq \frac{b}{a} P_1 = \frac{1}{a} P_1 P_2 \cdots P_r \subseteq \frac{1}{a}(a) = R\). <span class="qed">∎</span>
</div>

## The Cancellation Law

The existence of inverses for ideals yields the cancellation property, which is the engine of unique factorization.

<div class="proposition"><strong>Proposition 7.9.</strong> Let \(R\) be a Dedekind domain, and let \(I\) be a nonzero ideal of \(R\). Then for any \(0 \ne \alpha \in I\), there exists an ideal \(J\) such that \(IJ = (\alpha)\).
</div>

<div class="proof"><strong>Proof.</strong> Set \(J = \{\beta \in R : \beta I \subseteq (\alpha)\}\). By definition, \(IJ \subseteq (\alpha)\). We show \((\alpha) \subseteq IJ\).

Let \(B = \frac{1}{\alpha} IJ\), an ideal of \(R\). We want \(B = R\). Suppose not: by Lemma 7.8, there exists \(\gamma \in K \setminus R\) with \(\gamma B \subseteq R\). Since \(\alpha \in I\), we have \(J \subseteq B\), so \(\gamma J \subseteq \gamma B \subseteq R\). Then \(\frac{\gamma}{\alpha} IJ = \gamma B \subseteq R\), meaning \((\gamma J) I \subseteq (\alpha)\), so \(\gamma J \subseteq J\) by definition of \(J\).

But \(J\) has an integral basis (being a nonzero ideal of a ring of integers), hence is a finitely generated abelian group. The inclusion \(\gamma J \subseteq J\) with \(J\) finitely generated implies \(\gamma\) is integral over \(R\). Since \(R\) is integrally closed, \(\gamma \in R\), contradicting \(\gamma \notin R\). <span class="qed">∎</span>
</div>

<div class="corollary"><strong>Corollary 7.10 (Cancellation Law).</strong> Let \(A, B, C\) be ideals in a Dedekind domain with \(C \ne 0\). If \(AC = BC\), then \(A = B\).
</div>

<div class="proof"><strong>Proof.</strong> By Proposition 7.9, there exists \(J\) with \(CJ = (\alpha)\) for some nonzero \(\alpha\). Then \((\alpha)A = ACJ = BCJ = (\alpha)B\), so \(\alpha A = \alpha B\), and hence \(A = B\). <span class="qed">∎</span>
</div>

<div class="corollary"><strong>Corollary 7.11 (Divisibility = Containment).</strong> Let \(A, B\) be ideals in a Dedekind domain. Then \(A \supseteq B\) if and only if \(A \mid B\) (i.e., \(B = AC\) for some ideal \(C\)).
</div>

<div class="proof"><strong>Proof.</strong> If \(B = AC\), then \(B \subseteq A\). Conversely, if \(A \supseteq B\) and \(A \ne (0)\), choose \(0 \ne \alpha \in A\) and let \(J\) satisfy \(JA = (\alpha)\). Then \((\alpha) = JA \supseteq JB\), so \(R \supseteq \frac{1}{\alpha}JB\). Setting \(C = \frac{1}{\alpha}JB\), we get \(AC = \frac{1}{\alpha}AJB = B\). <span class="qed">∎</span>
</div>

## Unique Factorization of Ideals

We now arrive at the main theorem, the fundamental result of the subject.

<div class="theorem"><strong>Theorem 7.12 (Unique Factorization of Ideals).</strong> In a Dedekind domain, every proper nonzero ideal factors uniquely (up to reordering) as a product of prime ideals.
</div>

<div class="proof"><strong>Proof.</strong> <strong>Existence:</strong> Let \(\mathcal{S}\) be the set of proper nonzero ideals that cannot be written as a product of prime ideals. Suppose \(\mathcal{S} \ne \emptyset\); by the Noetherian property, \(\mathcal{S}\) has a maximal element \(M\). Since \(M\) is not prime (otherwise it is a product of one prime), \(M\) is contained in some maximal ideal \(P \supsetneq M\). By Corollary 7.11, \(P \mid M\), so \(M = PC\) for some ideal \(C\).

Since \(M \subsetneq P\) and \(M = PC\), we have \(C \ne R\). If \(C\) were a product of primes, then \(M = PC\) would be too, contradicting \(M \in \mathcal{S}\). So \(C \in \mathcal{S}\). But \(C \supseteq M\) (since \(M = PC \subseteq C\)) and \(C \ne M\) (otherwise \(M = PM\) and cancellation gives \(P = R\), a contradiction). This contradicts the maximality of \(M\) in \(\mathcal{S}\). Hence \(\mathcal{S} = \emptyset\).

<strong>Uniqueness:</strong> Suppose \(P_1 \cdots P_r = Q_1 \cdots Q_s\) with all \(P_i, Q_j\) prime. Then \(P_1 \supseteq Q_1 \cdots Q_s\). Since \(P_1\) is prime, \(P_1 \supseteq Q_j\) for some \(j\). Since nonzero primes are maximal, \(P_1 = Q_j\). Cancelling (by Corollary 7.10) gives \(P_2 \cdots P_r = Q_1 \cdots \hat{Q}_j \cdots Q_s\). By induction, the factorizations agree up to reordering.

(No proper nonempty product of prime ideals can equal \(R\), since each \(P_i \subsetneq R\), so the base case of the induction is immediate.) <span class="qed">∎</span>
</div>

This theorem shows that the monoid of nonzero ideals of a Dedekind domain, under multiplication, is a free commutative monoid generated by the nonzero prime ideals. Equivalently, every nonzero fractional ideal is invertible, and the group of fractional ideals is free abelian on the primes.

### PID if and only if UFD

For Dedekind domains, the notions of principal ideal domain and unique factorization domain coincide.

<div class="theorem"><strong>Theorem 7.13.</strong> A Dedekind domain \(R\) is a PID if and only if it is a UFD.
</div>

<div class="proof"><strong>Proof.</strong> Every PID is a UFD (standard algebra). Conversely, suppose \(R\) is a UFD and Dedekind. It suffices to show every nonzero prime ideal \(P\) is principal. Choose \(0 \ne \alpha \in P\); since \(\alpha\) is not a unit (as \(P\) is proper), write \(\alpha = p_1^{a_1} \cdots p_k^{a_k}\) with each \(p_i\) irreducible. Since \(P\) is prime, some \(p_i \in P\), say \(p_1 \in P\). Then \((p_1) \subseteq P\). But \((p_1)\) is prime (in a UFD, irreducible elements generate prime ideals) and hence maximal (since \(R\) is Dedekind). So \(P = (p_1)\). <span class="qed">∎</span>
</div>

<div class="corollary"><strong>Corollary 7.14.</strong> For a number field \(K\), the ring \(\mathcal{O}_K\) has unique factorization of elements if and only if \(\mathcal{O}_K\) is a PID.
</div>

## Kummer--Dedekind Theorem

In practice, the most important question is: given a rational prime \(p\), how does the ideal \((p)\) factor in \(\mathcal{O}_K\)? The Kummer--Dedekind theorem gives a complete answer whenever \(\mathcal{O}_K = \mathbb{Z}[\alpha]\), or more generally, whenever \(p\) does not divide the index \([\mathcal{O}_K : \mathbb{Z}[\alpha]]\).

<div class="theorem"><strong>Theorem 7.15 (Kummer--Dedekind).</strong> Let \(K = \mathbb{Q}(\alpha)\) where \(\alpha \in \mathcal{O}_K\) with minimal polynomial \(f(x) \in \mathbb{Z}[x]\). Let \(p\) be a prime not dividing \([\mathcal{O}_K : \mathbb{Z}[\alpha]]\). Suppose that the reduction of \(f\) modulo \(p\) factors in \(\mathbb{F}_p[x]\) as

\[
\overline{f}(x) \equiv \overline{g}_1(x)^{e_1} \cdots \overline{g}_r(x)^{e_r} \pmod{p},
\]
where \(\overline{g}_1, \ldots, \overline{g}_r\) are distinct monic irreducible polynomials in \(\mathbb{F}_p[x]\). Then

\[
(p) = \mathfrak{p}_1^{e_1} \cdots \mathfrak{p}_r^{e_r}
\]
where \(\mathfrak{p}_i = (p, g_i(\alpha))\), and \(g_i \in \mathbb{Z}[x]\) is any monic lift of \(\overline{g}_i\). Moreover, \(N(\mathfrak{p}_i) = p^{f_i}\) where \(f_i = \deg \overline{g}_i\).
</div>

<div class="proof"><strong>Proof.</strong> We compute:

\[
\mathbb{Z}[\alpha]/(p) \cong \mathbb{Z}[x]/(f(x), p) \cong \mathbb{F}_p[x]/(\overline{f}(x)) \cong \mathbb{F}_p[x]/(\overline{g}_1^{e_1}) \times \cdots \times \mathbb{F}_p[x]/(\overline{g}_r^{e_r}).
\]
The prime ideals of \(\mathbb{Z}[\alpha]\) containing \(p\) correspond to the prime ideals of this product, which are exactly the ideals \((p, g_i(\alpha))\) corresponding to the irreducible factors \(\overline{g}_i\). Tracing the isomorphisms gives the stated factorization. Since \(p \nmid [\mathcal{O}_K : \mathbb{Z}[\alpha]]\), the factorization in \(\mathbb{Z}[\alpha]\) lifts to the same factorization in \(\mathcal{O}_K\). <span class="qed">∎</span>
</div>

<div class="example"><strong>Example.</strong> Consider \(K = \mathbb{Q}(\sqrt{2})\), so \(\mathcal{O}_K = \mathbb{Z}[\sqrt{2}]\) and \(f(x) = x^2 - 2\).

<strong>\(p = 5\):</strong> \(x^2 - 2\) is irreducible mod \(5\) (no roots), so \((5)\) remains prime in \(\mathcal{O}_K\), and \(\mathcal{O}_K/(5) \cong \mathbb{F}_{25}\).

<strong>\(p = 7\):</strong> \(x^2 - 2 \equiv (x-3)(x+3) \pmod{7}\), so \((7) = (\sqrt{2} - 3, 7)(\sqrt{2} + 3, 7)\) splits into two prime ideals of norm \(7\).

<strong>\(p = 2\):</strong> \(x^2 - 2 \equiv x^2 \pmod{2}\), so \((2) = (\sqrt{2})^2\) ramifies. The unique prime above \(2\) is \((\sqrt{2})\).
</div>

## Ramification and the Discriminant

<div class="definition"><strong>Definition 7.16 (Ramification).</strong> Let \(K\) be a number field and \(p\) a rational prime. Write

\[
(p) = \mathfrak{p}_1^{e_1} \cdots \mathfrak{p}_r^{e_r}
\]
as a product of prime ideals in \(\mathcal{O}_K\). The integer \(e_i\) is called the <strong>ramification index</strong> of \(\mathfrak{p}_i\) over \(p\), and \(f_i = \log_p N(\mathfrak{p}_i)\) is the <strong>residue degree</strong> (or <strong>inertia degree</strong>). We say \(p\) is <strong>ramified</strong> in \(K\) if \(e_i \ge 2\) for some \(i\), and <strong>unramified</strong> otherwise.
</div>

The discriminant controls which primes ramify.

<div class="theorem"><strong>Theorem 7.17 (Ramification and Discriminant).</strong> Let \(K\) be a number field with discriminant \(D = \operatorname{disc}(K)\). A rational prime \(p\) is ramified in \(K\) if and only if \(p \mid D\).
</div>

<div class="proof"><strong>Proof.</strong> <strong>(\(\Rightarrow\)):</strong> Suppose \(p\) is ramified, so \((p) = \mathfrak{p}^2 Q\) for some prime \(\mathfrak{p}\) and ideal \(Q\). Choose \(\alpha \in \mathfrak{p}Q \setminus \mathfrak{p}^2 Q\). Then \(\alpha \notin (p)\) but \(\alpha^2 \in \mathfrak{p}^2 Q^2 \subseteq (p)\), so \(\alpha^2/p \in \mathcal{O}_K\). For any \(\beta \in \mathcal{O}_K\), \((\alpha\beta)^2/p \in \mathcal{O}_K\), and using the multinomial theorem modulo \(p\):

\[
\operatorname{Tr}((\alpha\beta)^p) = p \cdot \operatorname{Tr}\!\left(\frac{(\alpha\beta)^p}{p}\right),
\]
so \(p \mid \operatorname{Tr}((\alpha\beta)^p)\). Moreover,

\[
(\operatorname{Tr}(\alpha\beta))^p = \sum_i \sigma_i(\alpha\beta)^p + p\gamma = \operatorname{Tr}((\alpha\beta)^p) + p\gamma
\]
for some algebraic integer \(\gamma\), so \(p \mid (\operatorname{Tr}(\alpha\beta))^p\) and hence \(p \mid \operatorname{Tr}(\alpha\beta)\).

Write \(\alpha = a_1\omega_1 + \cdots + a_n\omega_n\) with \(a_i \in \mathbb{Z}\) and \(\{\omega_1, \ldots, \omega_n\}\) an integral basis. Since \(\alpha \notin (p)\), some \(a_i\) (say \(a_1\)) is not divisible by \(p\). Since \(p \mid \operatorname{Tr}(\alpha\omega_i)\) for all \(i\), the first row of the matrix \(\bigl(\operatorname{Tr}(\omega_i \omega_j)\bigr)\) --- after replacing row 1 by \(\sum a_k \operatorname{Tr}(\omega_k \omega_j)\) --- shows that \(p \mid a_1 D\). Since \(p \nmid a_1\), we conclude \(p \mid D\).

<strong>(\(\Leftarrow\)):</strong> If \(p \mid D\), the trace form on \(\mathcal{O}_K/(p)\) is degenerate: there exists \(x \in \mathcal{O}_K/(p)\), \(x \ne 0\), with \(\operatorname{Tr}(xy) = 0\) for all \(y \in \mathcal{O}_K/(p)\). A nondegenerate trace form characterizes products of separable field extensions, hence \(\mathcal{O}_K/(p)\) is not a product of fields, meaning the factorization of \((p)\) has a repeated factor. <span class="qed">∎</span>
</div>

<div class="example"><strong>Example.</strong> For \(K = \mathbb{Q}(\sqrt{3})\), we have \(\operatorname{disc}(K) = 12\). The primes dividing \(12\) are \(2\) and \(3\). Indeed, \((2) = (2, 1+\sqrt{3})^2\) and \((3) = (\sqrt{3})^2\) both ramify.
</div>

---

# Chapter 8: Ideal Norms and the Class Group

Having established unique factorization of ideals in Dedekind domains, we now introduce the **norm of an ideal**, which generalizes the norm of an element. The multiplicativity of the ideal norm --- whose proof requires delicate arguments involving localization or combinatorial counting --- is the key technical result of this chapter. We then define the **class group**, which measures the failure of unique factorization of elements, and prove that it is always finite using Minkowski's geometry of numbers.

## Norm of an Ideal

<div class="definition"><strong>Definition 8.1 (Ideal Norm).</strong> Let \(K\) be a number field with \([K : \mathbb{Q}] = n\), and let \(I \subseteq \mathcal{O}_K\) be a nonzero ideal. The <strong>norm</strong> of \(I\) is

\[
N(I) = |\mathcal{O}_K / I|,
\]
the number of elements in the quotient ring \(\mathcal{O}_K/I\). Equivalently, \(N(I) = [\mathcal{O}_K : I]\) as an index of abelian groups.
</div>

Since every nonzero ideal \(I\) contains a nonzero integer \(a\) (take the norm of any nonzero \(\alpha \in I\)), and \(|\mathcal{O}_K/(a)| = |a|^n\), the quotient \(\mathcal{O}_K/I\) is always finite.

### Computing the Norm via Discriminants

<div class="theorem"><strong>Theorem 8.2.</strong> Let \(I \subseteq \mathcal{O}_K\) be a nonzero ideal with integral basis \(\{\alpha_1, \ldots, \alpha_n\}\). Then

\[
N(I) = \left|\frac{\operatorname{disc}(\alpha_1, \ldots, \alpha_n)}{\operatorname{disc}(K)}\right|^{1/2}.
\]
</div>

<div class="proof"><strong>Proof.</strong> The result is independent of the choice of integral basis for \(I\), since any two integral bases are related by a matrix in \(\operatorname{GL}_n(\mathbb{Z})\). Fix an integral basis \(\{\omega_1, \ldots, \omega_n\}\) for \(\mathcal{O}_K\), and write \(\alpha_i = \sum_j a_{ij} \omega_j\) where \(A = (a_{ij})\) is the lower-triangular matrix from the basis algorithm (with positive diagonal entries \(a_{11}, \ldots, a_{nn}\)). Then

\[
\operatorname{disc}(\alpha_1, \ldots, \alpha_n) = (\det A)^2 \operatorname{disc}(K) = (a_{11} \cdots a_{nn})^2 \operatorname{disc}(K).
\]
It therefore suffices to show \(N(I) = a_{11} \cdots a_{nn}\).

Every element of \(\mathcal{O}_K\) is congruent modulo \(I\) to a unique element of the form \(r_1\omega_1 + \cdots + r_n\omega_n\) with \(0 \le r_i < a_{ii}\). The existence follows by successively reducing: given \(\gamma = b_1\omega_1 + \cdots + b_n\omega_n\), divide \(b_n\) by \(a_{nn}\), subtract the appropriate multiple of \(\alpha_n\), and repeat. The uniqueness follows because if two such representatives were congruent mod \(I\), their difference would be an element of \(I\) with each coordinate strictly less than \(a_{ii}\) in absolute value, which forces all coordinates to be zero (by the minimality conditions defining the \(a_{ii}\)). Hence \(N(I) = \prod_{i=1}^n a_{ii}\). <span class="qed">∎</span>
</div>

### Norm of a Principal Ideal

The ideal norm generalizes the element norm.

<div class="theorem"><strong>Theorem 8.3.</strong> Let \(I = (\alpha)\) be a principal ideal of \(\mathcal{O}_K\). Then \(N(I) = |N_{K/\mathbb{Q}}(\alpha)|\).
</div>

<div class="proof"><strong>Proof.</strong> If \(\{\omega_1, \ldots, \omega_n\}\) is an integral basis for \(\mathcal{O}_K\), then \(\{\alpha\omega_1, \ldots, \alpha\omega_n\}\) is an integral basis for \(I = (\alpha)\). Let \(\sigma_1, \ldots, \sigma_n\) be the embeddings of \(K\) into \(\mathbb{C}\). Then

\[
\bigl(\sigma_i(\alpha\omega_j)\bigr) = \operatorname{diag}(\sigma_1(\alpha), \ldots, \sigma_n(\alpha)) \cdot \bigl(\sigma_i(\omega_j)\bigr),
\]
so

\[
\operatorname{disc}(\alpha\omega_1, \ldots, \alpha\omega_n) = N_{K/\mathbb{Q}}(\alpha)^2 \cdot \operatorname{disc}(\omega_1, \ldots, \omega_n).
\]
By Theorem 8.2, \(N(I) = |N_{K/\mathbb{Q}}(\alpha)|\). <span class="qed">∎</span>
</div>

### Fermat's Theorem for Ideals

The finite quotient \(\mathcal{O}_K / \mathfrak{p}\) is a field when \(\mathfrak{p}\) is prime, giving a natural analogue of Fermat's little theorem.

<div class="theorem"><strong>Theorem 8.4 (Fermat's Theorem for Ideals).</strong> Let \(K\) be a number field, \(\mathfrak{p} \subseteq \mathcal{O}_K\) a prime ideal, and \(\alpha \in \mathcal{O}_K\) with \(\mathfrak{p} \nmid (\alpha)\). Then

\[
\alpha^{N(\mathfrak{p}) - 1} \equiv 1 \pmod{\mathfrak{p}}.
\]
</div>

<div class="proof"><strong>Proof.</strong> Since \(\mathfrak{p}\) is a prime (hence maximal) ideal, \(\mathcal{O}_K/\mathfrak{p}\) is a field with \(N(\mathfrak{p})\) elements. Its multiplicative group has order \(N(\mathfrak{p}) - 1\). Since \(\mathfrak{p} \nmid (\alpha)\), the image of \(\alpha\) in \(\mathcal{O}_K/\mathfrak{p}\) is a nonzero element, and the result follows from Lagrange's theorem. <span class="qed">∎</span>
</div>

The following simple observation is used repeatedly.

<div class="proposition"><strong>Proposition 8.5.</strong> If \(I \subseteq \mathcal{O}_K\) is a nonzero ideal, then \(N(I) \in I\).
</div>

<div class="proof"><strong>Proof.</strong> Since \(|\mathcal{O}_K/I| = N(I)\), by Lagrange's theorem applied to the additive group \(\mathcal{O}_K/I\), we have \(N(I) \cdot 1 \equiv 0 \pmod{I}\), so \(N(I) \in I\). <span class="qed">∎</span>
</div>

<div class="corollary"><strong>Corollary 8.6.</strong> For any \(a \in \mathbb{Z}_{>0}\), there are only finitely many ideals \(I \subseteq \mathcal{O}_K\) with \(N(I) = a\).
</div>

<div class="proof"><strong>Proof.</strong> If \(N(I) = a\), then \(a \in I\), so \((a) \subseteq I\), hence \(I \mid (a)\). By unique factorization, \((a)\) has only finitely many ideal divisors. <span class="qed">∎</span>
</div>

## Multiplicativity of the Ideal Norm

The most important property of the ideal norm is its multiplicativity. The proof requires some care, as it cannot be derived from the Chinese Remainder Theorem alone when the ideals share common prime factors.

<div class="lemma"><strong>Lemma 8.7.</strong> Let \(B, C \subseteq \mathcal{O}_K\) be nonzero ideals. Then there exists \(\alpha \in B\) such that \(\gcd\!\left(\frac{(\alpha)}{B},\, C\right) = \mathcal{O}_K\).
</div>

<div class="proof"><strong>Proof.</strong> If \(C = \mathcal{O}_K\), any \(\alpha \in B\) works. Otherwise, write \(C = P_1^{e_1} \cdots P_r^{e_r}\). For each \(m\), choose \(\alpha_m \in B \cdot \prod_{i \ne m} P_i\) but \(\alpha_m \notin B P_m\) (which is possible since \(BP_m \subsetneq B \cdot \prod_{i \ne m} P_i\) by unique factorization). Set \(\alpha = \alpha_1 + \cdots + \alpha_r\).

For any fixed \(m\), all \(\alpha_i\) with \(i \ne m\) lie in \(BP_m\), so if \(\alpha \in BP_m\) then \(\alpha_m \in BP_m\), contradicting the choice of \(\alpha_m\). Hence \(\alpha \notin BP_m\) for any \(m\), which means \(P_m \nmid \frac{(\alpha)}{B}\) for any \(m\), giving \(\gcd\!\left(\frac{(\alpha)}{B}, C\right) = \mathcal{O}_K\). <span class="qed">∎</span>
</div>

<div class="theorem"><strong>Theorem 8.8 (Multiplicativity of the Ideal Norm).</strong> For any nonzero ideals \(B, C \subseteq \mathcal{O}_K\),

\[
N(BC) = N(B)\, N(C).
\]
</div>

<div class="proof"><strong>Proof.</strong> By Lemma 8.7, choose \(\alpha \in B\) with \(\gcd\!\left(\frac{(\alpha)}{B}, C\right) = \mathcal{O}_K\). Let \(\beta_1, \ldots, \beta_{N(B)}\) represent the distinct cosets of \(\mathcal{O}_K / B\), and let \(\gamma_1, \ldots, \gamma_{N(C)}\) represent the distinct cosets of \(\mathcal{O}_K / C\).

<strong>Claim:</strong> The elements \(\beta_i + \alpha\gamma_j\), for \(1 \le i \le N(B)\) and \(1 \le j \le N(C)\), represent the distinct cosets of \(\mathcal{O}_K / BC\).

<em>Distinctness:</em> Suppose \(\beta_i + \alpha\gamma_j \equiv \beta_k + \alpha\gamma_\ell \pmod{BC}\). Since \(BC \subseteq B\), reducing mod \(B\) gives \(\beta_i \equiv \beta_k \pmod{B}\), so \(i = k\). Then \(\alpha(\gamma_\ell - \gamma_j) \equiv 0 \pmod{BC}\), meaning \(BC \mid (\alpha)(\gamma_\ell - \gamma_j)\). Since \(\gcd\!\left(\frac{(\alpha)}{B}, C\right) = \mathcal{O}_K\), we conclude \(C \mid (\gamma_\ell - \gamma_j)\), so \(j = \ell\).

<em>Completeness:</em> Given \(\omega \in \mathcal{O}_K\), choose \(i\) with \(\omega \equiv \beta_i \pmod{B}\). Then \(\omega - \beta_i \in B\), and since \(B = \gcd((\alpha), BC)\) (because \(\gcd\!\left(\frac{(\alpha)}{B}, C\right) = \mathcal{O}_K\) implies \((\alpha) + BC = B\)), write \(\omega - \beta_i = \alpha a + b\) with \(a \in \mathcal{O}_K\) and \(b \in BC\). Choose \(j\) with \(a \equiv \gamma_j \pmod{C}\). Then \(\omega = \beta_i + \alpha\gamma_j + \alpha(a - \gamma_j) + b\), and \(\alpha(a - \gamma_j) + b \in BC\), so \(\omega \equiv \beta_i + \alpha\gamma_j \pmod{BC}\).

Therefore \(N(BC) = N(B) \cdot N(C)\). <span class="qed">∎</span>
</div>

## The \(efg\) Formula

The multiplicativity of the norm yields a fundamental numerical constraint on how primes split.

<div class="theorem"><strong>Theorem 8.9 (\(\sum e_i f_i = n\)).</strong> Let \(K\) be a number field of degree \(n = [K : \mathbb{Q}]\), and let \(p\) be a rational prime. Write

\[
(p) = \mathfrak{p}_1^{e_1} \cdots \mathfrak{p}_r^{e_r}
\]
with \(N(\mathfrak{p}_i) = p^{f_i}\). Then

\[
\sum_{i=1}^{r} e_i f_i = n.
\]
</div>

<div class="proof"><strong>Proof.</strong> Taking norms of both sides: \(N((p)) = p^n\) (since \(N((p)) = |N_{K/\mathbb{Q}}(p)| = p^n\)). By multiplicativity,

\[
p^n = N(\mathfrak{p}_1)^{e_1} \cdots N(\mathfrak{p}_r)^{e_r} = p^{e_1 f_1} \cdots p^{e_r f_r} = p^{\sum e_i f_i}.
\]
<span class="qed">∎</span>
</div>

<div class="remark"><strong>Remark.</strong> This formula has a pleasing geometric interpretation: the "space" \(\mathcal{O}_K/(p)\), which has \(p^n\) elements, is carved up by the primes \(\mathfrak{p}_i\), each contributing a factor of \(p^{e_i f_i}\). When \(p\) is unramified (\(e_i = 1\) for all \(i\)), the formula becomes \(\sum f_i = n\), and the splitting pattern of \(p\) is completely described by the residue degrees.
</div>

## The Class Group

We now turn to the central invariant of algebraic number theory: the **class group**, which measures the obstruction to \(\mathcal{O}_K\) being a PID.

<div class="definition"><strong>Definition 8.10 (Ideal Class Group).</strong> Let \(K\) be a number field. The <strong>ideal group</strong> \(I_K\) is the group of nonzero fractional ideals of \(\mathcal{O}_K\) under multiplication. The <strong>principal ideal group</strong> \(P_K\) is the subgroup consisting of principal fractional ideals \((\alpha)\) for \(\alpha \in K^{\times}\). The <strong>class group</strong> (or <strong>ideal class group</strong>) of \(K\) is

\[
\operatorname{Cl}(K) = I_K / P_K.
\]
Its order \(h_K = |\operatorname{Cl}(K)|\) is called the <strong>class number</strong> of \(K\).
</div>

Equivalently, two ideals \(I\) and \(J\) represent the same class if and only if \(I = \alpha J\) for some \(\alpha \in K^{\times}\), or equivalently, if there exist nonzero \(\alpha, \beta \in \mathcal{O}_K\) with \((\alpha)I = (\beta)J\).

The class group is abelian, with identity \([\mathcal{O}_K]\), and the class of any nonzero ideal has an inverse (guaranteed by the existence of ideal inverses in a Dedekind domain). The ring \(\mathcal{O}_K\) is a PID if and only if \(h_K = 1\).

## Finiteness of the Class Number

The deepest result of this chapter is that the class group is always finite.

<div class="theorem"><strong>Theorem 8.11 (Finiteness of the Class Number).</strong> For every number field \(K\), the class number \(h_K\) is finite. More precisely, every ideal class contains an integral ideal of norm at most the <strong>Minkowski bound</strong>:

\[
M_K = \frac{n!}{n^n} \left(\frac{4}{\pi}\right)^s \sqrt{|\operatorname{disc}(K)|}
\]
where \(n = [K : \mathbb{Q}]\), \(r\) is the number of real embeddings, \(s\) is the number of pairs of complex embeddings (so \(n = r + 2s\)).
</div>

<div class="proof"><strong>Proof.</strong> The proof has two steps.

<strong>Step 1: Every ideal class has a small representative.</strong> Let \([I]\) be an ideal class, and choose an integral representative. Consider the inverse \(I^{-1}\). We seek \(\alpha \in I^{-1}\) (nonzero) such that \(J = \alpha I\) is an integral ideal of norm at most \(M_K\). Since \(N(\alpha I) = |N_{K/\mathbb{Q}}(\alpha)| \cdot N(I)\) (by multiplicativity), we need \(|N_{K/\mathbb{Q}}(\alpha)| \le M_K / N(I) = M_K \cdot N(I^{-1})\).

Embed \(I^{-1}\) as a lattice in Minkowski space \(V_K \cong \mathbb{R}^n\), and apply <strong>Minkowski's Lattice Theorem</strong>: if \(S \subseteq \mathbb{R}^n\) is a convex, symmetric set with \(\operatorname{vol}(S) > 2^n \cdot |\det(I^{-1})|\), then \(S\) contains a nonzero lattice point.

Take \(S = \{(v_1, \ldots, v_n) \in V_K : \sum |v_i| \le t\}\). This set is convex and symmetric, with volume \(\operatorname{vol}(S) = 2^r \pi^s t^n / n!\). The lattice determinant is \(|\det(I^{-1})| = N(I^{-1})\sqrt{|\operatorname{disc}(K)|}\).

By the AM--GM inequality, any vector in \(S\) satisfies \(\prod |v_i| \le (t/n)^n\). So we need \((t/n)^n \le M_K N(I^{-1})\) (to ensure \(S \subseteq \Lambda\), the locus of vectors of sufficiently small norm) and \(\operatorname{vol}(S) > 2^n |\det(I^{-1})|\) (to apply Minkowski).

Combining these two conditions and optimizing \(t\) shows that for every \(B > M_K N(I^{-1})\), there exists a nonzero \(\alpha \in I^{-1}\) with \(|N(\alpha)| < B\). Since the norm of an ideal is a positive integer, this gives an ideal \(J = \alpha I\) with \(N(J) \le M_K\) in the class \([I]^{-1}\) --- hence also a representative of norm at most \(M_K\) in the class \([I]\).

<strong>Step 2: Finitely many ideals of bounded norm.</strong> If \(N(I) \le M_K\), then \(N(I) \in I\) (Proposition 8.5), so \((N(I)) \subseteq I\), hence \(I \mid (N(I))\). The ideal \((N(I))\) has only finitely many divisors (by unique factorization), and \(N(I)\) ranges over finitely many integers at most \(M_K\). Thus there are only finitely many ideal classes. <span class="qed">∎</span>
</div>

## Computing the Class Group: Worked Examples

The Minkowski bound, combined with the Kummer--Dedekind theorem, gives a practical algorithm for computing class groups.

<strong>General Strategy:</strong>
1. Compute the Minkowski bound \(M_K\).
2. Factor all rational primes \(p \le M_K\) in \(\mathcal{O}_K\) using the Kummer--Dedekind theorem. The prime ideals that arise generate \(\operatorname{Cl}(K)\).
3. Determine relations among these generators by finding principal ideals of small norm (often by evaluating norms of simple elements).

<div class="example"><strong>Example (\(\mathbb{Q}(\sqrt{-23})\)).</strong> Here \(\operatorname{disc}(K) = -23\), and \(n = 2\), \(r = 0\), \(s = 1\). The Minkowski bound is

\[
M_K = \frac{2}{4}\cdot\frac{4}{\pi}\sqrt{23} < 5.
\]
So we need prime ideals of norm at most \(4\), meaning we factor \(p = 2\) and \(p = 3\).

Since \(-23 \equiv 1 \pmod{4}\), the ring of integers is \(\mathcal{O}_K = \mathbb{Z}\!\left[\frac{1+\sqrt{-23}}{2}\right]\).

<strong>Factoring (2):</strong> The minimal polynomial of \(\frac{1+\sqrt{-23}}{2}\) is \(x^2 - x + 6\), which factors mod 2 as \(x(x-1) = x(x+1)\). So

\[
(2) = \mathfrak{p}\mathfrak{p}', \quad \mathfrak{p} = \left(2, \frac{1+\sqrt{-23}}{2}\right), \quad \mathfrak{p}' = \left(2, \frac{1-\sqrt{-23}}{2}\right).
\]

<strong>Factoring (3):</strong> Similarly, \(x^2 - x + 6 \equiv (x+1)(x-2) \pmod{3}\), giving

\[
(3) = \mathfrak{q}\mathfrak{q}', \quad \mathfrak{q} = \left(3, \frac{1+\sqrt{-23}}{2}\right), \quad \mathfrak{q}' = \left(3, \frac{1-\sqrt{-23}}{2}\right).
\]

<strong>Relations:</strong> Since \(\mathfrak{p}\mathfrak{p}' = (2)\) is principal, \([\mathfrak{p}'] = [\mathfrak{p}]^{-1}\) in \(\operatorname{Cl}(K)\). Similarly \([\mathfrak{q}'] = [\mathfrak{q}]^{-1}\).

One computes \(\mathfrak{p}\mathfrak{q} = \left(\frac{1-\sqrt{-23}}{2}\right)\), so \([\mathfrak{p}][\mathfrak{q}] = 1\), giving \([\mathfrak{q}] = [\mathfrak{p}]^{-1} = [\mathfrak{p}']\).

<strong>Is \(\mathfrak{p}\) principal?</strong> If \(\mathfrak{p} = (\alpha)\), then \(N(\alpha) = N(\mathfrak{p}) = 2\). But \(N\!\left(\frac{a+b\sqrt{-23}}{2}\right) = \frac{a^2+23b^2}{4}\), and \(\frac{a^2+23b^2}{4} = 2\) gives \(a^2 + 23b^2 = 8\), which has no integer solutions. So \(\mathfrak{p}\) is not principal.

<strong>Is \(\mathfrak{p}^2\) principal?</strong> We have \(\mathfrak{p}^2 \sim \mathfrak{p}' \sim \mathfrak{q}\). Since \(N\!\left(\frac{3+\sqrt{-23}}{2}\right) = \frac{9+23}{4} = 8 = N(\mathfrak{p}^3)\) and \(N\!\left(\frac{3-\sqrt{-23}}{2}\right) = 8\), these give two distinct principal ideals of norm \(8\). The ideals of norm \(8\) are \(\mathfrak{p}^3, \mathfrak{p}^2\mathfrak{p}', \mathfrak{p}\mathfrak{p}'^2, \mathfrak{p}'^3\). Since \(\mathfrak{p}^2\mathfrak{p}' \sim \mathfrak{p}\) is not principal, and \(\mathfrak{p}\mathfrak{p}'^2 \sim \mathfrak{p}'\) is not principal, the two principal ideals of norm 8 must be \(\mathfrak{p}^3\) and \(\mathfrak{p}'^3\). Hence \([\mathfrak{p}]^3 = 1\) but \([\mathfrak{p}] \ne 1\) and \([\mathfrak{p}]^2 \ne 1\) (since \([\mathfrak{p}^2] = [\mathfrak{p}'] \ne 1\)).

Therefore \(\operatorname{Cl}(\mathbb{Q}(\sqrt{-23})) \cong \mathbb{Z}/3\mathbb{Z}\), and \(h_K = 3\).
</div>

<div class="example"><strong>Example (A cubic field).</strong> Let \(K = \mathbb{Q}(\alpha)\) where \(\alpha\) is a root of \(f(x) = x^3 - 3x + 3\), which is irreducible by Eisenstein at \(p = 3\). Since \(\operatorname{disc}(f) = -135 = -3^3 \cdot 5\) is squarefree up to the index, one can verify that \(\mathcal{O}_K = \mathbb{Z}[\alpha]\).

The field has one real embedding and one pair of complex embeddings (\(r = 1, s = 1\)), giving

\[
M_K = \frac{3!}{27} \cdot \frac{4}{\pi} \sqrt{135} < 4.
\]
We factor primes \(p \le 3\):

<strong>\(p = 2\):</strong> \(f(x) = x^3 - 3x + 3 \equiv x^3 + x + 1 \pmod{2}\), which has no roots mod 2 and is irreducible (a cubic with no roots over \(\mathbb{F}_2\)). So \((2)\) is prime.

<strong>\(p = 3\):</strong> \(f(x) \equiv x^3 \pmod{3}\), so \((3) = \mathfrak{p}_3^3\) where \(\mathfrak{p}_3 = (3, \alpha) = (\alpha)\) (since \(3 = -\alpha^3 + 3\alpha = \alpha(-\alpha^2 + 3)\), so \(3 \in (\alpha)\)).

All prime ideals of norm at most 3 are principal. Hence \(\operatorname{Cl}(K)\) is trivial and \(\mathcal{O}_K\) is a PID.
</div>

## Gauss's Conjecture and the Hilbert Class Field

We conclude with two deep results connecting the class group to the broader landscape of number theory.

<div class="theorem"><strong>Theorem 8.12 (Baker--Stark, 1969).</strong> For \(d > 0\) squarefree, the imaginary quadratic field \(\mathbb{Q}(\sqrt{-d})\) has class number \(1\) (i.e., \(\mathcal{O}_{\mathbb{Q}(\sqrt{-d})}\) is a PID) if and only if

\[
d \in \{1, 2, 3, 7, 11, 19, 43, 67, 163\}.
\]
</div>

This confirms a conjecture made by Gauss. Heilbronn proved in 1934 that there is at most one value beyond Gauss's list; Baker and Stark independently showed the list is complete.

<div class="remark"><strong>Remark.</strong> For real quadratic fields \(\mathbb{Q}(\sqrt{d})\) with \(d > 0\), Gauss also conjectured that infinitely many have class number \(1\). This remains wide open and is one of the major unsolved problems in number theory.
</div>

The class group has a beautiful structural interpretation via class field theory.

<div class="theorem"><strong>Theorem 8.13 (Hilbert Class Field).</strong> Let \(K\) be a number field with class number \(h_K\). There exists a unique field extension \(E/K\), called the <strong>Hilbert class field</strong> of \(K\), with the following properties:
<br>(1) \([E : K] = h_K\).
<br>(2) \(E/K\) is Galois, and \(\operatorname{Gal}(E/K) \cong \operatorname{Cl}(K)\).
<br>(3) \(E/K\) is unramified at all primes (including the archimedean ones).
<br>(4) Every ideal of \(\mathcal{O}_K\) becomes principal in \(\mathcal{O}_E\).
<br>(5) A prime ideal \(\mathfrak{p}\) of \(\mathcal{O}_K\) splits into \(h_K / f\) prime ideals in \(\mathcal{O}_E\), where \(f\) is the order of \([\mathfrak{p}]\) in \(\operatorname{Cl}(K)\).
</div>

<div class="remark"><strong>Remark.</strong> The Hilbert class field theorem, conjectured by Hilbert and proved by Furtw&auml;ngler, is one of the cornerstones of class field theory. It shows that the class group is not merely an abstract invariant but governs the arithmetic of a canonical extension. For instance, for \(K = \mathbb{Q}(\sqrt{-23})\) with \(h_K = 3\), the Hilbert class field is \(E = K(\alpha)\) where \(\alpha\) is a root of \(x^3 - x - 1\), and every ideal of \(\mathcal{O}_K\) becomes principal in \(\mathcal{O}_E\).
</div>
# Chapter 9: Lattices and Minkowski's Theorem

The theory of algebraic numbers, as developed thus far, has been largely algebraic in character. We have studied rings of integers, ideals, and their factorization properties using the tools of commutative algebra. In this chapter, we introduce a geometric perspective that proves to be extraordinarily powerful. The central idea is that the ring of integers \(\mathcal{O}_K\) of a number field \(K\) can be viewed as a lattice in a real vector space, and that geometric properties of this lattice encode deep arithmetic information about \(K\).

The key result of this chapter is Minkowski's Convex Body Theorem, which gives conditions under which a convex, symmetric subset of \(\mathbb{R}^n\) must contain a nonzero lattice point. Combined with the Minkowski embedding, this theorem yields a fundamental bound on norms of elements in ideals, which in turn proves the finiteness of the class number. As striking applications, we prove that every prime \(p \equiv 1 \pmod{4}\) is a sum of two squares, and that every positive integer is a sum of four squares.

## Lattices in \(\mathbb{R}^n\)

<div class="definition"><strong>Definition 9.1 (Lattice).</strong> A <em>lattice</em> in \(\mathbb{R}^n\) is an additive subgroup \(\Lambda \subseteq \mathbb{R}^n\) that is isomorphic to \(\mathbb{Z}^n\) as an abelian group and spans \(\mathbb{R}^n\) as a real vector space. Equivalently, \(\Lambda\) is a lattice if there exist linearly independent vectors \(\alpha_1, \ldots, \alpha_n \in \mathbb{R}^n\) such that

\[
\Lambda = \{m_1 \alpha_1 + \cdots + m_n \alpha_n \mid m_1, \ldots, m_n \in \mathbb{Z}\}.
\]
The set \(\{\alpha_1, \ldots, \alpha_n\}\) is called a <em>basis</em> for \(\Lambda\).
</div>

A basis for a lattice \(\Lambda\) is not unique. If \(\{\alpha_1, \ldots, \alpha_n\}\) is a basis and \(P = (v_{ij})\) is an \(n \times n\) integer matrix with \(\det(P) = \pm 1\), then the vectors \(\alpha_i' = \sum_j v_{ij} \alpha_j\) also form a basis for \(\Lambda\). Conversely, any two bases for \(\Lambda\) are related by such a unimodular change-of-basis matrix, because the transition matrix and its inverse must both have integer entries, forcing the determinant to be \(\pm 1\).

<div class="definition"><strong>Definition 9.2 (Fundamental Domain and Determinant).</strong> Let \(\Lambda\) be a lattice in \(\mathbb{R}^n\) with basis \(\{\alpha_1, \ldots, \alpha_n\}\). The <em>fundamental domain</em> (or fundamental parallelepiped) of \(\Lambda\) with respect to this basis is

\[
\mathcal{P} = \{\theta_1 \alpha_1 + \cdots + \theta_n \alpha_n \mid 0 \le \theta_i < 1 \text{ for all } i\}.
\]
The <em>determinant</em> (or <em>covolume</em>) of \(\Lambda\) is

\[
d(\Lambda) = |\det(\alpha_1, \ldots, \alpha_n)|,
\]
where the matrix is formed by taking the \(\alpha_i\) as column vectors.
</div>

Every point in \(\mathbb{R}^n\) can be written uniquely as \(\lambda + \gamma\) where \(\lambda \in \Lambda\) and \(\gamma \in \mathcal{P}\). The Lebesgue measure of \(\mathcal{P}\) equals \(d(\Lambda)\). The determinant is well-defined because if \(\{\alpha_1', \ldots, \alpha_n'\}\) is another basis related by a unimodular matrix \(P\), then \(|\det(\alpha_1', \ldots, \alpha_n')| = |\det P| \cdot |\det(\alpha_1, \ldots, \alpha_n)| = |\det(\alpha_1, \ldots, \alpha_n)|\).

<div class="example"><strong>Example.</strong> The standard integer lattice \(\Lambda_0 = \mathbb{Z}^n\) has the standard basis vectors \(e_1, \ldots, e_n\) as a basis, and \(d(\Lambda_0) = 1\). More generally, if \(A\) is an \(n \times n\) invertible real matrix, then \(A(\mathbb{Z}^n)\) is a lattice with determinant \(|\det A|\).
</div>

## Blichfeldt's Theorem

The first geometric result we need is a counting argument due to Blichfeldt, which is a multi-dimensional pigeonhole principle. It says that a set whose measure exceeds \(m\) times the covolume of a lattice must contain \(m+1\) points whose pairwise differences are all lattice vectors.

<div class="theorem"><strong>Theorem 9.3 (Blichfeldt's Theorem).</strong> Let \(\Lambda\) be a lattice in \(\mathbb{R}^n\), let \(m \in \mathbb{Z}^+\), and let \(S \subseteq \mathbb{R}^n\) be a Lebesgue measurable set. Suppose that either
<ol>
<li>\(\mu(S) > m \cdot d(\Lambda)\), or</li>
<li>\(\mu(S) = m \cdot d(\Lambda)\) and \(S\) is compact.</li>
</ol>
Then there exist \(m+1\) distinct points \(x_1, \ldots, x_{m+1} \in S\) such that \(x_i - x_j \in \Lambda\) for all \(1 \le i, j \le m+1\).
</div>

<div class="proof"><strong>Proof.</strong> Let \(\alpha_1, \ldots, \alpha_n\) be a basis for \(\Lambda\), and let

\[
\mathcal{P} = \{\theta_1 \alpha_1 + \cdots + \theta_n \alpha_n \mid 0 \le \theta_i < 1\}
\]
be the fundamental parallelepiped. Every point \(x \in \mathbb{R}^n\) has a unique representation \(x = \lambda + \gamma\) with \(\lambda \in \Lambda\) and \(\gamma \in \mathcal{P}\), and \(\mu(\mathcal{P}) = d(\Lambda)\).

For each \(\lambda \in \Lambda\), define

\[
R(\lambda) = \{\nu \in \mathcal{P} \mid \lambda + \nu \in S\}.
\]
The sets \(R(\lambda)\) are pairwise disjoint subsets of \(\mathcal{P}\) (after translating each piece of \(S\) back into \(\mathcal{P}\)), and

\[
\sum_{\lambda \in \Lambda} \mu(R(\lambda)) = \mu(S).
\]

<strong>Case 1:</strong> Suppose \(\mu(S) > m \cdot d(\Lambda) = m \cdot \mu(\mathcal{P})\). Since the sum of the measures \(\mu(R(\lambda))\) exceeds \(m \cdot \mu(\mathcal{P})\), there must exist a point \(\nu_0 \in \mathcal{P}\) that belongs to at least \(m+1\) of the sets \(R(\lambda)\). (If every point belonged to at most \(m\) sets, the sum of measures could not exceed \(m \cdot \mu(\mathcal{P})\).) Thus there exist distinct \(\lambda_1, \ldots, \lambda_{m+1} \in \Lambda\) such that \(\nu_0 + \lambda_i \in S\) for each \(i\). Setting \(x_i = \lambda_i + \nu_0\), we have \(x_i - x_j = \lambda_i - \lambda_j \in \Lambda\).

<strong>Case 2:</strong> Suppose \(\mu(S) = m \cdot d(\Lambda)\) and \(S\) is compact. For each \(r \ge 1\), let \(S_r = (1 + \epsilon_r) S\) where \(\epsilon_r \to 0^+\). Then \(\mu(S_r) = (1+\epsilon_r)^n \mu(S) > m \cdot d(\Lambda)\), so by Case 1, there exist distinct points \(x_{1,r}, \ldots, x_{m+1,r} \in S_r\) with differences in \(\Lambda\). Since \(S\) is compact (hence bounded), the sequences \(x_{j,r}\) have convergent subsequences with limits \(x_j^0 \in S\) (since \(S\) is closed). Because \(\Lambda\) is discrete, the differences \(x_{j,r} - x_{i,r} \in \Lambda\) must eventually stabilize, so \(x_j^0 - x_i^0 \in \Lambda\) as required. <span class="qed">∎</span>
</div>

## Minkowski's Convex Body Theorem

The bridge from Blichfeldt's counting argument to number theory is Minkowski's theorem, which applies specifically to convex, symmetric sets. Recall that a set \(S \subseteq \mathbb{R}^n\) is <em>symmetric about the origin</em> if \(x \in S\) implies \(-x \in S\), and <em>convex</em> if \(x, y \in S\) implies \(\lambda x + (1-\lambda)y \in S\) for all \(0 \le \lambda \le 1\).

<div class="theorem"><strong>Theorem 9.4 (Minkowski's Convex Body Theorem).</strong> Let \(\Lambda\) be a lattice in \(\mathbb{R}^n\), let \(m \in \mathbb{Z}^+\), and let \(S \subseteq \mathbb{R}^n\) be convex and symmetric about the origin. If either
<ol>
<li>\(\mu(S) > m \cdot 2^n \cdot d(\Lambda)\), or</li>
<li>\(\mu(S) = m \cdot 2^n \cdot d(\Lambda)\) and \(S\) is compact,</li>
</ol>
then \(S\) contains \(m\) pairs \(\pm \lambda_1, \ldots, \pm \lambda_m\) of nonzero lattice points.
</div>

<div class="proof"><strong>Proof.</strong> Consider the set \(\frac{1}{2}S = \{\frac{1}{2}x \mid x \in S\}\). Its measure is \(\mu(\frac{1}{2}S) = 2^{-n} \mu(S)\). Under our hypotheses, either \(\mu(\frac{1}{2}S) > m \cdot d(\Lambda)\), or \(\mu(\frac{1}{2}S) = m \cdot d(\Lambda)\) and \(\frac{1}{2}S\) is compact (since \(S\) is). By Blichfeldt's Theorem (Theorem 9.3), there exist \(m+1\) distinct points \(\frac{1}{2}x_1, \ldots, \frac{1}{2}x_{m+1}\) in \(\frac{1}{2}S\) such that \(\frac{1}{2}x_i - \frac{1}{2}x_j \in \Lambda\) for all \(i, j\).

Order the \(x_i\) so that \(x_1 > x_2 > \cdots > x_{m+1}\), where we say \(x_i > x_j\) if the first nonzero coordinate of \(x_i - x_j\) is positive. Define

\[
\lambda_j = \frac{1}{2}x_j - \frac{1}{2}x_{m+1} \in \Lambda \setminus \{0\}
\]
for \(j = 1, \ldots, m\). By the ordering, the \(m\) pairs \(\pm \lambda_1, \ldots, \pm \lambda_m\) are all distinct.

Since \(S\) is symmetric, \(-\frac{1}{2}x_{m+1} = \frac{1}{2}(-x_{m+1}) \in \frac{1}{2}S\). Since \(S\) is convex, \(\frac{1}{2}S\) is convex, so

\[
\lambda_j = \frac{1}{2}x_j + \frac{1}{2}(-x_{m+1}) = \frac{1}{2} \cdot \frac{1}{2}x_j + \frac{1}{2} \cdot \frac{1}{2}(-x_{m+1})
\]
Wait -- we need to be slightly more careful. We have \(\frac{1}{2}x_j \in \frac{1}{2}S\) and \(-\frac{1}{2}x_{m+1} \in \frac{1}{2}S\). Since \(S\) is convex and symmetric, \(\lambda_j = \frac{1}{2}x_j + (-\frac{1}{2}x_{m+1})\). In fact, since \(\frac{1}{2}x_j \in \frac{1}{2}S\) and \(-\frac{1}{2}x_{m+1} \in \frac{1}{2}S\), convexity of \(S\) gives

\[
\lambda_j = \frac{1}{2}x_j - \frac{1}{2}x_{m+1} = \frac{1}{2} x_j + \frac{1}{2}(-x_{m+1}) \in S
\]
because \(x_j, -x_{m+1} \in S\) and \(S\) is convex. Thus each \(\lambda_j\) is a nonzero lattice point in \(S\), and by symmetry \(-\lambda_j \in S\) as well. <span class="qed">∎</span>
</div>

<div class="remark"><strong>Remark.</strong> The bound in Minkowski's theorem is best possible. Consider the lattice \(\Lambda_0 = \mathbb{Z}^n\) and the open set \(S = \{(x_1, \ldots, x_n) \in \mathbb{R}^n \mid |x_1| < m, \; |x_j| < 1 \text{ for } j \ge 2\}\). Then \(\mu(S) = m \cdot 2^n = m \cdot 2^n \cdot d(\Lambda_0)\), but \(S\) contains only \(m-1\) pairs of nonzero lattice points, namely \(\pm(k, 0, \ldots, 0)\) for \(k = 1, \ldots, m-1\).
</div>

In the most commonly used special case \(m = 1\), Minkowski's theorem says: if \(S\) is convex, symmetric, and \(\mu(S) > 2^n d(\Lambda)\) (or \(\mu(S) = 2^n d(\Lambda)\) with \(S\) compact), then \(S\) contains a nonzero lattice point.

## Real and Complex Embeddings

To apply Minkowski's theorem to number fields, we need to embed the ring of integers \(\mathcal{O}_K\) as a lattice in a real vector space. The tool for this is the Minkowski embedding, which uses the field embeddings of \(K\) into \(\mathbb{C}\).

Let \(K\) be a number field of degree \(n = [K:\mathbb{Q}]\). There are exactly \(n\) field homomorphisms \(\sigma_1, \ldots, \sigma_n : K \hookrightarrow \mathbb{C}\) that fix \(\mathbb{Q}\). Some of these have image contained in \(\mathbb{R}\) (the <em>real embeddings</em>), and the rest come in conjugate pairs (the <em>complex embeddings</em>).

<div class="definition"><strong>Definition 9.5 (Signature).</strong> Let \(K\) be a number field of degree \(n\). Write \(r_1\) for the number of real embeddings and \(r_2\) for the number of conjugate pairs of complex embeddings. Then \(n = r_1 + 2r_2\), and the pair \((r_1, r_2)\) is called the <em>signature</em> of \(K\).
</div>

We label the embeddings so that \(\sigma_1, \ldots, \sigma_{r_1}\) are real, and \(\sigma_{r_1+1}, \overline{\sigma_{r_1+1}}, \ldots, \sigma_{r_1+r_2}, \overline{\sigma_{r_1+r_2}}\) are the complex conjugate pairs.

<div class="example"><strong>Example.</strong> The field \(\mathbb{Q}(\sqrt{2})\) has two real embeddings \(\sigma_1(a+b\sqrt{2}) = a + b\sqrt{2}\) and \(\sigma_2(a+b\sqrt{2}) = a - b\sqrt{2}\), so \((r_1, r_2) = (2, 0)\). The field \(\mathbb{Q}(i)\) has no real embeddings and one conjugate pair \(\sigma(a+bi) = a+bi\), \(\overline{\sigma}(a+bi) = a - bi\), so \((r_1, r_2) = (0, 1)\). A cubic field defined by an irreducible polynomial with one real root and two complex roots has signature \((1, 1)\).
</div>

## The Minkowski Embedding

<div class="definition"><strong>Definition 9.6 (Minkowski Embedding).</strong> Let \(K\) be a number field with signature \((r_1, r_2)\). The <em>Minkowski embedding</em> is the injective ring homomorphism

\[
\sigma : K \hookrightarrow \mathbb{R}^{r_1} \times \mathbb{C}^{r_2}
\]
defined by

\[
\sigma(\alpha) = \bigl(\sigma_1(\alpha), \ldots, \sigma_{r_1}(\alpha), \sigma_{r_1+1}(\alpha), \ldots, \sigma_{r_1+r_2}(\alpha)\bigr).
\]
By identifying \(\mathbb{C}\) with \(\mathbb{R}^2\) via \(z \mapsto (\operatorname{Re}(z), \operatorname{Im}(z))\), we may view \(\sigma\) as a map \(\sigma : K \hookrightarrow \mathbb{R}^n\).
</div>

The target space \(\mathbb{R}^{r_1} \times \mathbb{C}^{r_2}\) is sometimes called <em>Minkowski space</em> and denoted \(V_K\). It is a real vector space of dimension \(r_1 + 2r_2 = n\). As a ring, it has coordinate-wise operations, and the norm map \(N : V_K \to \mathbb{R}\) given by

\[
N(x_1, \ldots, x_{r_1}, z_{r_1+1}, \ldots, z_{r_1+r_2}) = \prod_{i=1}^{r_1} x_i \cdot \prod_{j=r_1+1}^{r_1+r_2} |z_j|^2
\]
satisfies \(N(\sigma(\alpha)) = N_{K/\mathbb{Q}}(\alpha)\) for all \(\alpha \in K\).

<div class="example"><strong>Example.</strong> For \(K = \mathbb{Q}(\sqrt{2})\), the Minkowski embedding sends \(a + b\sqrt{2}\) to \((a + b\sqrt{2}, a - b\sqrt{2}) \in \mathbb{R}^2\). The lattice \(\sigma(\mathbb{Z}[\sqrt{2}])\) is a rectangular lattice in \(\mathbb{R}^2\) tilted at \(45^\circ\) with respect to the coordinate axes. For \(K = \mathbb{Q}(i)\), the embedding sends \(a + bi\) to \((a+bi) \in \mathbb{C} \cong \mathbb{R}^2\), and \(\sigma(\mathbb{Z}[i])\) is the standard square lattice.
</div>

## \(\sigma(\mathcal{O}_K)\) Is a Lattice

The crucial geometric fact is that the image of the ring of integers under the Minkowski embedding forms a lattice.

<div class="theorem"><strong>Theorem 9.7.</strong> Let \(K\) be a number field of degree \(n\). The image \(\sigma(\mathcal{O}_K)\) of \(\mathcal{O}_K\) under the Minkowski embedding is a lattice in \(\mathbb{R}^n\).
</div>

<div class="proof"><strong>Proof.</strong> Let \(\{\omega_1, \ldots, \omega_n\}\) be an integral basis for \(\mathcal{O}_K\). We must show that \(\{\sigma(\omega_1), \ldots, \sigma(\omega_n)\}\) is a basis for \(\mathbb{R}^n\). It suffices to show that these vectors are linearly independent over \(\mathbb{C}\).

Form the \(n \times n\) matrix \(B\) whose \((i,j)\)-entry is \(\sigma_i(\omega_j)\) (using all \(n\) embeddings, including conjugate pairs). The columns of \(B\) are the vectors \(\sigma(\omega_j)\) (before identifying \(\mathbb{C}\) with \(\mathbb{R}^2\)). If there were a linear dependence among the columns, then there would exist complex numbers \(a_1, \ldots, a_n\) (not all zero) such that \(\sum_j a_j \sigma_i(\omega_j) = 0\) for all \(i\). By linearity of the \(\sigma_i\), this would give \(\sigma_i(\sum_j a_j \omega_j) = 0\) for each \(i\), making the embeddings \(\sigma_1, \ldots, \sigma_n\) linearly dependent as functions from \(K\) to \(\mathbb{C}\).

But by the theorem on linear independence of characters (distinct homomorphisms from a group to a field are linearly independent), the embeddings \(\sigma_1, \ldots, \sigma_n\) are linearly independent over \(\mathbb{C}\). This contradiction shows that the columns of \(B\) are linearly independent over \(\mathbb{C}\), hence over \(\mathbb{R}\). <span class="qed">∎</span>
</div>

More generally, any nonzero ideal \(A \subseteq \mathcal{O}_K\) gives a sublattice \(\sigma(A)\) of \(\sigma(\mathcal{O}_K)\), and we can compute its covolume precisely.

<div class="lemma"><strong>Lemma 9.8.</strong> Let \(A\) be a nonzero ideal of \(\mathcal{O}_K\). Then \(\sigma(A)\) is a lattice \(\Lambda\) in \(\mathbb{R}^n\), and

\[
d(\Lambda) = 2^{-r_2} \sqrt{|\operatorname{disc}(K)|} \cdot N(A).
\]
</div>

<div class="proof"><strong>Proof.</strong> Let \(\alpha_1, \ldots, \alpha_n\) be an integral basis for the ideal \(A\). The coordinates of \(\sigma(\alpha_i)\) in the standard basis of \(\mathbb{R}^n\) (using real and imaginary parts for complex places) form a matrix whose determinant is

\[
D_0 = \left(\frac{1}{-2i}\right)^{r_2} \det(\sigma_j(\alpha_i))
\]
since \(\operatorname{Re}(z) = \frac{z + \bar{z}}{2}\) and \(\operatorname{Im}(z) = \frac{z - \bar{z}}{2i}\). By the discriminant formula, \(|\det(\sigma_j(\alpha_i))| = \sqrt{|\operatorname{disc}(K)|} \cdot N(A)\). Therefore

\[
d(\Lambda) = |D_0| = \frac{1}{2^{r_2}} \sqrt{|\operatorname{disc}(K)|} \cdot N(A)
\]
and since \(D_0 \neq 0\), the image \(\sigma(A)\) is indeed a lattice. <span class="qed">∎</span>
</div>

## The Minkowski Bound

We are now ready to state and prove the fundamental norm bound that underlies the finiteness of the class number. The idea is to choose a convex, symmetric set in Minkowski space whose volume is large enough to guarantee a nonzero lattice point via Minkowski's theorem.

<div class="theorem"><strong>Theorem 9.9 (Minkowski Bound).</strong> Let \(K\) be a number field of degree \(n\) with signature \((r_1, r_2)\), and let \(A\) be a nonzero ideal in \(\mathcal{O}_K\). Then there exists a nonzero element \(\alpha \in A\) such that

\[
|N_{K/\mathbb{Q}}(\alpha)| \le \left(\frac{2}{\pi}\right)^{r_2} \sqrt{|\operatorname{disc}(K)|} \cdot N(A).
\]
In particular, every ideal class of \(\mathcal{O}_K\) contains an ideal of norm at most

\[
C_K = \left(\frac{2}{\pi}\right)^{r_2} \sqrt{|\operatorname{disc}(K)|}.
\]
</div>

<div class="proof"><strong>Proof.</strong> Let \(t \in \mathbb{R}^+\) and define the set

\[
S_t = \{(x_1, \ldots, x_n) \in \mathbb{R}^n \mid |x_i| \le t \text{ for } i = 1, \ldots, r_1; \;\; x_{r_1+2j-1}^2 + x_{r_1+2j}^2 \le t^2 \text{ for } j = 1, \ldots, r_2\}.
\]
This set is convex and symmetric about the origin. Its measure is

\[
\mu(S_t) = 2^{r_1} \pi^{r_2} t^n.
\]
We choose \(t\) so that \(\mu(S_t) = 2^n \cdot d(\Lambda)\), where \(\Lambda = \sigma(A)\) has \(d(\Lambda) = 2^{-r_2} \sqrt{|\operatorname{disc}(K)|} \cdot N(A)\). This gives

\[
2^{r_1} \pi^{r_2} t^n = 2^n \cdot 2^{-r_2} \sqrt{|\operatorname{disc}(K)|} \cdot N(A),
\]
so

\[
t = \left(\frac{2}{\pi}\right)^{r_2/n} \bigl(\sqrt{|\operatorname{disc}(K)|} \cdot N(A)\bigr)^{1/n}.
\]
Since \(S_t\) is compact, Minkowski's theorem (Theorem 9.4 with \(m = 1\)) yields a nonzero lattice point \(\sigma(\alpha) \in S_t\) for some \(\alpha \in A\), \(\alpha \neq 0\). Then

\[
|N_{K/\mathbb{Q}}(\alpha)| = \prod_{i=1}^{r_1} |\sigma_i(\alpha)| \cdot \prod_{j=1}^{r_2} |\sigma_{r_1+j}(\alpha)|^2 \le t^{r_1} \cdot (t^2)^{r_2} = t^n = \left(\frac{2}{\pi}\right)^{r_2} \sqrt{|\operatorname{disc}(K)|} \cdot N(A).
\]
For the second statement, let \([I]\) be any ideal class, and let \(A\) be an ideal with \(IA \sim (1)\). By the above, there exists \(\alpha \in A\), \(\alpha \neq 0\), with \(|N(\alpha)| \le C_K \cdot N(A)\). Since \(\alpha \in A\), there is an ideal \(B\) with \(AB = (\alpha)\), so \(B \sim I\). Since \(N(A) \cdot N(B) = N(\alpha) \le C_K \cdot N(A)\), we get \(N(B) \le C_K\). <span class="qed">∎</span>
</div>

<div class="remark"><strong>Remark.</strong> By using the more refined set \(S_t = \{(x_1, \ldots, x_n) \mid \sum_{i=1}^n |x_i| \le t\}\) together with the arithmetic-geometric mean inequality, one obtains the sharper bound

\[
|N_{K/\mathbb{Q}}(\alpha)| \le \left(\frac{4}{\pi}\right)^{r_2} \frac{n!}{n^n} \sqrt{|\operatorname{disc}(K)|} \cdot N(A).
\]
This improved constant \((4/\pi)^{r_2} \cdot n!/n^n\) is smaller than the original \((2/\pi)^{r_2}\) for \(n \ge 2\).
</div>

<div class="corollary"><strong>Corollary 9.10 (Finiteness of the Class Number).</strong> The class number \(h_K\) of any number field \(K\) is finite.
</div>

<div class="proof"><strong>Proof.</strong> By Theorem 9.9, every ideal class contains an ideal of norm at most \(C_K\). Since there are only finitely many ideals of any given norm (the number of ideals of norm \(m\) divides a product of partition functions of \(m\)), the number of ideal classes is finite. <span class="qed">∎</span>
</div>

## Application: Sums of Two Squares

As a beautiful application, we use Minkowski's theorem to prove the classical result characterizing which primes are sums of two squares.

<div class="theorem"><strong>Theorem 9.11 (Sums of Two Squares).</strong> Let \(p\) be an odd prime. The following are equivalent:
<ol>
<li>\(\left(\frac{-1}{p}\right) = 1\).</li>
<li>\(p \equiv 1 \pmod{4}\).</li>
<li>There exist \(x, y \in \mathbb{Z}\) such that \(p = x^2 + y^2\).</li>
</ol>
</div>

<div class="proof"><strong>Proof.</strong> The equivalence of (i) and (ii) follows from the theory of the Legendre symbol (Proposition 12.1 below).

<strong>(ii) \(\Rightarrow\) (iii) via Minkowski:</strong> Since \(\left(\frac{-1}{p}\right) = 1\), there exists \(\ell \in \mathbb{Z}\) with \(\ell^2 \equiv -1 \pmod{p}\). Consider the lattice \(\Lambda \subseteq \mathbb{R}^2\) with \(\mathbb{Z}\)-basis \(\{(1, \ell), (0, p)\}\), so that \(d(\Lambda) = p\). Let \(S\) be the open disc of radius \(r = \sqrt{2p/\pi}\) centered at the origin. Then \(\mu(S) = \pi r^2 = 2p > 2^2 \cdot p = 4p\)... let us recalculate: we need \(\mu(S) > 4 d(\Lambda) = 4p\), so set \(r^2 = 4p/\pi\), giving \(\mu(S) = 4p\). Since the closed disc is compact, Minkowski's theorem gives a nonzero lattice point \((m, m\ell + np) \in S\). Then

\[
0 < m^2 + (m\ell + np)^2 \le r^2 < 2p.
\]
Working modulo \(p\), we have \(m^2 + (m\ell + np)^2 \equiv m^2 + m^2\ell^2 = m^2(1 + \ell^2) \equiv 0 \pmod{p}\). Since the quantity is strictly between \(0\) and \(2p\) and divisible by \(p\), it must equal \(p\). Thus \(p = m^2 + (m\ell + np)^2\).

<strong>(iii) \(\Rightarrow\) (ii):</strong> Since the squares modulo 4 are \(\{0, 1\}\), and \(p\) is odd, we need \(x^2 + y^2 \equiv 1 \pmod{4}\) (as \(p\) is odd, not both \(x, y\) are even), which forces \(p \equiv 1 \pmod{4}\). <span class="qed">∎</span>
</div>

One can also give a proof using the Gaussian integers: since \(p \equiv 1 \pmod{4}\), the prime \(p\) splits in \(\mathbb{Z}[i]\) as \((p) = PQ\), where \(P, Q\) are conjugate prime ideals. Since \(\mathbb{Z}[i]\) is a PID, \(P = (a + bi)\), and then \(p = N(P) = a^2 + b^2\).

## Application: Lagrange's Four Squares Theorem

The Minkowski-theoretic approach extends to prove that every positive integer is a sum of four squares. The key is to work in a four-dimensional lattice related to quaternions.

<div class="proposition"><strong>Proposition 9.12 (Euler's Four Squares Identity).</strong> We have

\[
\left(\sum_{i=1}^4 a_i^2\right)\left(\sum_{i=1}^4 b_i^2\right) = \sum_{i=1}^4 c_i^2
\]
where

\[
c_1 = a_1b_1 - a_2b_2 - a_3b_3 - a_4b_4, \quad c_2 = a_1b_2 + a_2b_1 + a_3b_4 - a_4b_3,
\]

\[
c_3 = a_1b_3 - a_2b_4 + a_3b_1 + a_4b_2, \quad c_4 = a_1b_4 + a_2b_3 - a_3b_2 + a_4b_1.
\]
</div>

<div class="proof"><strong>Proof.</strong> This follows from the multiplicativity of the norm on the quaternions \(\mathbb{H}\): if \(q = a_1 + a_2 i + a_3 j + a_4 k\) and \(r = b_1 + b_2 i + b_3 j + b_4 k\), then \(|qr|^2 = |q|^2 |r|^2\). <span class="qed">∎</span>
</div>

By this identity, to show every positive integer is a sum of four squares, it suffices to prove it for primes.

<div class="theorem"><strong>Theorem 9.13 (Lagrange's Four Squares Theorem).</strong> Every positive integer \(n\) can be written as \(n = x^2 + y^2 + z^2 + w^2\) for some \(x, y, z, w \in \mathbb{Z}\).
</div>

<div class="proof"><strong>Proof.</strong> By Euler's identity (Proposition 9.12), it suffices to prove the result for primes \(p\).

<strong>Claim:</strong> For any prime \(p\), there exist \(a, b \in \mathbb{Z}\) such that \(a^2 + b^2 \equiv -1 \pmod{p}\).

If \(p \equiv 1 \pmod{4}\), then \(-1\) is a square mod \(p\) and we may take \(b = 0\). If \(p \equiv 3 \pmod{4}\), the set \(\{y^2 + 1 \mid y \in \mathbb{F}_p\}\) has \(\frac{p+1}{2}\) elements (counting \(0^2 + 1 = 1\) and the \(\frac{p-1}{2}\) distinct nonzero squares, each giving a distinct value after adding 1). Since there are only \(\frac{p-1}{2}\) nonzero squares in \(\mathbb{F}_p\), some value \(y_0^2 + 1\) must be a non-square. Then \(-(y_0^2+1)\) is a square, so there exists \(x_0\) with \(x_0^2 \equiv -(y_0^2+1) \pmod{p}\). (For \(p = 2\) the result is trivial: \(2 = 1^2 + 1^2 + 0^2 + 0^2\).)

Now consider the lattice \(\Lambda \subseteq \mathbb{R}^4\) with basis

\[
v_1 = (1, 0, a, b), \quad v_2 = (0, 1, b, -a), \quad v_3 = (0, 0, p, 0), \quad v_4 = (0, 0, 0, p).
\]
Then \(d(\Lambda) = p^2\). Let \(S\) be a closed ball of radius \(r\) with \(\mu(S) = \frac{\pi^2 r^4}{2}\). Choose \(r^2 = \frac{4p}{\pi\sqrt{2}}\) so that \(\mu(S) = 2^4 p^2\); since the ball is compact, Minkowski's theorem yields a nonzero lattice point \((x, y, z, w) \in S\).

Writing \((x,y,z,w) = \alpha v_1 + \beta v_2 + \gamma v_3 + \delta v_4\), we have \(x = \alpha\), \(y = \beta\), \(z = a\alpha + b\beta + p\gamma\), \(w = b\alpha - a\beta + p\delta\). Working modulo \(p\):

\[
x^2 + y^2 + z^2 + w^2 \equiv \alpha^2 + \beta^2 + (a\alpha + b\beta)^2 + (b\alpha - a\beta)^2 \equiv (1 + a^2 + b^2)(\alpha^2 + \beta^2) \equiv 0 \pmod{p}
\]
since \(a^2 + b^2 \equiv -1\). Also \(0 < x^2 + y^2 + z^2 + w^2 \le r^2 < 2p\). Since the sum is positive, divisible by \(p\), and less than \(2p\), it must equal \(p\). <span class="qed">∎</span>
</div>

---

# Chapter 10: Dirichlet's Unit Theorem

The group of units \(\mathcal{O}_K^*\) of the ring of integers of a number field \(K\) is a fundamental invariant that controls many arithmetic properties, from the structure of principal ideals to the solvability of Diophantine equations. In a PID like \(\mathbb{Z}\), the unit group is simply \(\{\pm 1\}\), but for general number fields, the unit group can be much richer. Dirichlet's Unit Theorem gives a complete description of this group: it is finitely generated, consisting of a finite torsion part (the roots of unity in \(K\)) and a free part whose rank is determined by the signature of \(K\).

## Units in Imaginary Quadratic Fields

We begin with the simplest case. If \(K = \mathbb{Q}(\sqrt{d})\) with \(d < 0\), then \(K\) has no real embeddings (\(r_1 = 0\)) and one pair of complex embeddings (\(r_2 = 1\)). Dirichlet's theorem predicts that the unit group has rank \(r_1 + r_2 - 1 = 0\), so the unit group consists entirely of roots of unity.

<div class="theorem"><strong>Theorem 10.1 (Units in Imaginary Quadratic Fields).</strong> Let \(K = \mathbb{Q}(\sqrt{d})\) with \(d < 0\) squarefree. Then

\[
\mathcal{O}_K^* = \begin{cases} \{\pm 1, \pm i\} \cong \mathbb{Z}/4\mathbb{Z} & \text{if } d = -1, \\ \{\pm 1, \pm \omega, \pm \omega^2\} \cong \mathbb{Z}/6\mathbb{Z} & \text{if } d = -3 \text{ (where } \omega = e^{2\pi i/3}\text{)}, \\ \{\pm 1\} \cong \mathbb{Z}/2\mathbb{Z} & \text{otherwise.} \end{cases}
\]
</div>

<div class="proof"><strong>Proof.</strong> If \(\alpha = a + b\sqrt{d} \in \mathcal{O}_K^*\), then \(N(\alpha) = a^2 - db^2 = \pm 1\). Since \(d < 0\), we have \(a^2 + |d|b^2 = 1\), and the number of integer solutions is finite. For \(|d| \ge 4\), the only solutions are \(b = 0\), \(a = \pm 1\). For \(d = -1\), we get \(a^2 + b^2 = 1\), giving \(\{\pm 1, \pm i\}\). For \(d = -3\) (and ring of integers \(\mathbb{Z}[\frac{1+\sqrt{-3}}{2}]\)), the norm equation \(a^2 + ab + b^2 = 1\) has six solutions giving the sixth roots of unity. <span class="qed">∎</span>
</div>

## Units in Real Quadratic Fields

For \(K = \mathbb{Q}(\sqrt{d})\) with \(d > 0\), both embeddings are real (\(r_1 = 2\), \(r_2 = 0\)), and Dirichlet's theorem predicts rank \(r_1 + r_2 - 1 = 1\). Thus \(\mathcal{O}_K^* \cong \{\pm 1\} \times \mathbb{Z}\), and the unit group is generated by \(-1\) and a single <em>fundamental unit</em>.

<div class="definition"><strong>Definition 10.2 (Fundamental Unit).</strong> Let \(K = \mathbb{Q}(\sqrt{d})\) with \(d > 0\) squarefree. The <em>fundamental unit</em> of \(\mathcal{O}_K\) is the smallest unit \(u > 1\). Every unit of \(\mathcal{O}_K\) is of the form \(\pm u^k\) for some \(k \in \mathbb{Z}\).
</div>

Finding the fundamental unit amounts to solving the Pell equation \(x^2 - dy^2 = \pm 1\), and we shall see in Appendix A that continued fractions provide an efficient algorithm for this.

<div class="example"><strong>Example.</strong> For \(K = \mathbb{Q}(\sqrt{2})\), the fundamental unit is \(1 + \sqrt{2}\), since \((1+\sqrt{2})(1-\sqrt{2}) = -1\). For \(K = \mathbb{Q}(\sqrt{19})\), the fundamental unit is \(170 + 39\sqrt{19}\), as computed in Appendix A.
</div>

## The Norm Criterion for Units

Before proving Dirichlet's theorem in general, we record the basic characterization of units by their norm.

<div class="theorem"><strong>Theorem 10.3.</strong> Let \(K\) be a number field. An element \(\alpha \in \mathcal{O}_K\) is a unit if and only if \(N_{K/\mathbb{Q}}(\alpha) = \pm 1\).
</div>

<div class="proof"><strong>Proof.</strong> If \(\alpha\) is a unit, then \(\alpha \beta = 1\) for some \(\beta \in \mathcal{O}_K\), so \(N(\alpha) N(\beta) = N(1) = 1\). Since both norms are integers, \(N(\alpha) = \pm 1\).

Conversely, if \(N(\alpha) = \pm 1\), then \(\prod_{i=1}^n \sigma_i(\alpha) = \pm 1\). The element \(\alpha^{-1} = \pm \prod_{i \neq 1} \sigma_i(\alpha)\) is a product of algebraic integers (the conjugates of \(\alpha\)), hence an algebraic integer. Since \(\alpha^{-1} \in K\), we have \(\alpha^{-1} \in \mathcal{O}_K\), so \(\alpha\) is a unit. <span class="qed">∎</span>
</div>

## The Logarithmic Embedding

The proof of Dirichlet's Unit Theorem rests on converting the multiplicative structure of the unit group into an additive one using logarithms. The key construction is the logarithmic map.

<div class="definition"><strong>Definition 10.4 (Logarithmic Embedding).</strong> Let \(K\) be a number field with signature \((r_1, r_2)\) and Minkowski embedding \(\sigma : K \hookrightarrow V_K = \mathbb{R}^{r_1} \times \mathbb{C}^{r_2}\). Let \(V_K^<em> = (\mathbb{R}^</em>)^{r_1} \times (\mathbb{C}^*)^{r_2}\) be the subset where no coordinate vanishes. The <em>logarithmic map</em> is

\[
L : V_K^* \to \mathbb{R}^{r_1 + r_2}
\]
defined by

\[
L(x_1, \ldots, x_{r_1}, z_{r_1+1}, \ldots, z_{r_1+r_2}) = (\log|x_1|, \ldots, \log|x_{r_1}|, 2\log|z_{r_1+1}|, \ldots, 2\log|z_{r_1+r_2}|).
\]
</div>

The factor of 2 in the complex places is natural: it accounts for the fact that each complex embedding contributes \(|z|^2\) to the norm. With this normalization, if \(\alpha \in K^*\) and \(L(\sigma(\alpha)) = (\ell_1, \ldots, \ell_{r_1+r_2})\), then

\[
\sum_{i=1}^{r_1+r_2} \ell_i = \log|N_{K/\mathbb{Q}}(\alpha)|.
\]
In particular, if \(\alpha \in \mathcal{O}_K^*\), then \(N(\alpha) = \pm 1\), so

\[
\ell_1 + \cdots + \ell_{r_1+r_2} = 0.
\]
Thus \(L(\sigma(\mathcal{O}_K^*))\) lies in the hyperplane \(H = \{x \in \mathbb{R}^{r_1+r_2} \mid \sum x_i = 0\}\), which has dimension \(r_1 + r_2 - 1\).

The map \(L\) is a group homomorphism from the multiplicative group \(V_K^*\) to the additive group \(\mathbb{R}^{r_1+r_2}\), because \(L(uv) = L(u) + L(v)\).

## Roots of Unity as the Kernel

<div class="theorem"><strong>Theorem 10.5.</strong> Let \(\mu_K\) denote the group of roots of unity in \(K\). Then \(\mu_K = \ker(L \circ \sigma|_{\mathcal{O}_K^*})\).
</div>

<div class="proof"><strong>Proof.</strong> The kernel of \(L\) restricted to the image of \(\mathcal{O}_K^<em>\) consists of elements \(\alpha \in \mathcal{O}_K^</em>\) with \(|\sigma_i(\alpha)| = 1\) for all \(i\). Every root of unity clearly has this property.

Conversely, suppose \(\alpha \in \mathcal{O}_K\) with \(|\sigma_i(\alpha)| \le 1\) for all \(i\). The set of such elements is a bounded subset of the lattice \(\sigma(\mathcal{O}_K)\), hence finite. Now if \(\alpha \in \mathcal{O}_K^*\) lies in the kernel, then every power \(\alpha^k\) also satisfies \(|\sigma_i(\alpha^k)| = 1\) for all \(i\), so the powers \(\alpha^k\) lie in a finite set. Therefore \(\alpha^j = \alpha^k\) for some \(j \neq k\), giving \(\alpha^{j-k} = 1\), so \(\alpha\) is a root of unity. <span class="qed">∎</span>
</div>

## Dirichlet's Unit Theorem

<div class="theorem"><strong>Theorem 10.6 (Dirichlet's Unit Theorem).</strong> Let \(K\) be a number field with \(r_1\) real embeddings and \(r_2\) conjugate pairs of complex embeddings. Let \(\mu_K\) be the group of roots of unity in \(K\). Then

\[
\mathcal{O}_K^* \cong \mu_K \times \mathbb{Z}^{r_1 + r_2 - 1}.
\]
</div>

The proof proceeds in several steps. We must show that \(L(\sigma(\mathcal{O}_K^*))\) is a full-rank lattice in the hyperplane \(H\).

<div class="proof"><strong>Proof.</strong> Let \(U = \sigma(\mathcal{O}_K^<em>) \subseteq V_K^</em>\). We write the proof in three claims.

<strong>Step 1: \(L(U)\) is a discrete subgroup of \(H\).</strong>

Let \(B = \{(y_1, \ldots, y_{r_1+r_2}) \in \mathbb{R}^{r_1+r_2} \mid |y_i| \le b\}\) be an arbitrary hypercube. If \(L(\sigma(\alpha)) \in B\), then \(|\sigma_i(\alpha)| \le e^b\) for real embeddings and \(|\sigma_j(\alpha)| \le e^{b/2}\) for complex embeddings. Then the minimal polynomial \(\prod_\sigma (t - \sigma(\alpha)) \in \mathbb{Z}[t]\) has coefficients bounded in terms of \(b\) alone. There are only finitely many such integer polynomials, hence only finitely many such \(\alpha\). Therefore \(L(U) \cap B\) is finite for every bounded \(B\), so \(L(U)\) is discrete.

Since \(L(U)\) is a discrete subgroup of the \((r_1+r_2-1)\)-dimensional space \(H\), it is a free abelian group of rank \(r \le r_1 + r_2 - 1\).

<strong>Step 2: \(G/U\) is compact, where \(G = \{v \in V_K^* \mid |N(v)| = 1\}\).</strong>

Consider \(G = \{v \in V_K^<em> \mid |N(v)| = 1\}\), which is a closed subgroup of \(V_K^</em>\). For any \(v \in G\), multiplication by \(v\) preserves the Lebesgue measure of regions in \(V_K\) (since \(|N(v)| = 1\) and \(v\) acts as a linear map with determinant \(\pm N(v)\)).

Let \(C \subseteq G\) be any compact, symmetric, convex region with \(\mu(C) \ge 2^n \cdot d(\sigma(\mathcal{O}_K))\). For any \(g \in G\), the translated region \(g^{-1}C\) has the same measure and is still symmetric, compact, and convex. By Minkowski's theorem, there exists \(0 \neq \alpha \in \mathcal{O}_K\) with \(\sigma(\alpha) \in g^{-1}C\).

Since \(C\) is compact, \(|N(C)|\) is bounded, so there are only finitely many possible values of \(|N(\alpha)|\) arising this way. Let \(\alpha_1, \ldots, \alpha_m \in \mathcal{O}_K\) represent all possible absolute norms. For any \(g \in G\), we have \(\sigma(\alpha) \in g^{-1}C\) for some \(\alpha\) with \(|N(\alpha)| = |N(\alpha_i)|\), so \(\alpha = \alpha_i u\) for some unit \(u\), and hence \(gU \cap \sigma(\alpha_i^{-1})C \neq \emptyset\).

Therefore the coset space \(G/U\) is covered by the finite union \(\bigcup_{i=1}^m G \cap \sigma(\alpha_i^{-1})C\), which is compact. Since \(G/U\) is a closed subset of a compact set, it is compact.

<strong>Step 3: \(L(U)\) has rank \(r_1 + r_2 - 1\).</strong>

The map \(L : G \to H \cong \mathbb{R}^{r_1+r_2-1}\) is continuous and surjective. Since \(G/U\) is compact, its image \(L(G)/L(U) = H/L(U)\) is compact. Now \(L(U) \cong \mathbb{Z}^r\) for some \(r \le r_1+r_2-1\), and \(H/L(U) \cong (S^1)^r \times \mathbb{R}^{r_1+r_2-1-r}\). For this to be compact, we need \(r_1+r_2-1-r = 0\), i.e., \(r = r_1+r_2-1\).

<strong>Conclusion:</strong> The kernel of \(L \circ \sigma\) restricted to \(\mathcal{O}_K^*\) is \(\mu_K\) (Theorem 10.5), and the image \(L(U)\) is a free abelian group of rank \(r_1+r_2-1\). By the first isomorphism theorem,

\[
\mathcal{O}_K^*/\mu_K \cong L(U) \cong \mathbb{Z}^{r_1+r_2-1}.
\]
Since \(\mu_K\) is finite, the sequence \(1 \to \mu_K \to \mathcal{O}_K^<em> \to \mathbb{Z}^{r_1+r_2-1} \to 0\) splits (as \(\mathbb{Z}^{r_1+r_2-1}\) is free), giving \(\mathcal{O}_K^</em> \cong \mu_K \times \mathbb{Z}^{r_1+r_2-1}\). <span class="qed">∎</span>
</div>

<div class="remark"><strong>Remark.</strong> A set of units \(\epsilon_1, \ldots, \epsilon_{r_1+r_2-1}\) whose images under \(L \circ \sigma\) form a basis for the lattice \(L(U)\) is called a <em>system of fundamental units</em> for \(K\).
</div>

<div class="example"><strong>Example.</strong> Let \(K = \mathbb{Q}(\sqrt{d})\) with \(d > 0\). Then \(r_1 = 2\), \(r_2 = 0\), \(\mu_K = \{\pm 1\}\), and \(\mathcal{O}_K^<em> \cong \mathbb{Z}/2\mathbb{Z} \times \mathbb{Z}\). The single fundamental unit generates the free part. For \(K = \mathbb{Q}(\sqrt{2}, \sqrt{3})\), we have \(r_1 = 4\), \(r_2 = 0\), and \(\mathcal{O}_K^</em> = \{\pm 1\} \times \mathbb{Z}^3\).
</div>

## Showing an Ideal Is Not Principal Using the Unit Group

Dirichlet's theorem has practical consequences for computing class groups. Suppose we want to determine whether an ideal \(I\) of \(\mathcal{O}_K\) is principal. If \(I = (\alpha)\), then \(\alpha\) has norm \(\pm N(I)\). The image \(L(\sigma(\alpha))\) lies in the affine hyperplane \(\sum \ell_i = \log N(I)\). Since any two generators of \(I\) differ by a unit, and the image of the unit group is a lattice in \(H\), we can search a bounded fundamental domain for possible generators.

<div class="example"><strong>Example.</strong> Let \(K = \mathbb{Q}(\alpha)\) where \(\alpha\) is a root of \(x^3 + 4x + 1\). One checks that \(\mathcal{O}_K = \mathbb{Z}[\alpha]\) and \(P = (\alpha + 1, 2)\) is a prime ideal of norm 2. The polynomial has one real root and one conjugate pair of complex roots, so \((r_1, r_2) = (1, 1)\), giving unit rank \(1 + 1 - 1 = 1\).

The element \(\alpha\) has \(N(\alpha) = -1\), so \(\alpha\) is a unit (in fact a fundamental unit). The real root of \(x^3 + 4x + 1\) is approximately \(-0.246\), so the complex roots have absolute value approximately \(2.015\). If \(P\) were principal with generator \(y\), then by translating by appropriate powers of the fundamental unit, we could arrange \(1 \le |y_1| \le 4\) (where \(y_1\) is the real embedding of \(y\)). The constraint \(|y_1| \cdot |y_2|^2 = 2\) then gives \(\frac{1}{\sqrt{2}} \le |y_2| \le \sqrt{2}\). A finite search through elements of \(\mathcal{O}_K\) in this bounded region of Minkowski space reveals that none have norm 2. Therefore \(P\) is not principal.
</div>

<div class="example"><strong>Example.</strong> Consider \(K = \mathbb{Q}(\sqrt{11})\) and the ideal \(P = (5, 6 + \sqrt{11})\). Since \(N(P) = 5\), we need to check if \(a^2 - 11b^2 = \pm 5\) has a solution. Indeed, \(4^2 - 11 \cdot 1^2 = 5\), so \(P = (4 - \sqrt{11})\) is principal. One verifies that \(\frac{6 + \sqrt{11}}{4 - \sqrt{11}} = 7 + 2\sqrt{11} \in \mathbb{Z}[\sqrt{11}]\), confirming that \(4 - \sqrt{11}\) divides both generators of \(P\).
</div>

---

# Chapter 11: Quadratic Reciprocity

Quadratic reciprocity is one of the crown jewels of number theory. The law, first conjectured by Euler and Legendre and proved by Gauss, governs when one prime is a quadratic residue modulo another. In this chapter, we give a proof of quadratic reciprocity that flows naturally from the algebraic number theory we have developed, using cyclotomic fields and the Frobenius automorphism.

## The Legendre Symbol

Suppose we wish to determine when a quadratic equation \(x^2 \equiv a \pmod{p}\) has a solution for an odd prime \(p\). The Legendre symbol organizes this information.

<div class="definition"><strong>Definition 11.1 (Legendre Symbol).</strong> Let \(p\) be an odd prime and \(a\) an integer with \(p \nmid a\). The <em>Legendre symbol</em> is

\[
\left(\frac{a}{p}\right) = \begin{cases} 1 & \text{if } a \text{ is a quadratic residue mod } p, \\ -1 & \text{if } a \text{ is a quadratic non-residue mod } p. \end{cases}
\]
</div>

The set \(H_p\) of quadratic residues modulo \(p\) (i.e., the set of nonzero squares in \(\mathbb{F}_p^*\)) is a subgroup of index 2 in \(\mathbb{F}_p^*\). The Legendre symbol defines a surjective group homomorphism \(\phi : \mathbb{F}_p^* \to \{\pm 1\}\) with kernel \(H_p\). This immediately gives the multiplicativity of the Legendre symbol and a formula using Euler's criterion.

<div class="proposition"><strong>Proposition 11.2 (Basic Properties).</strong> Let \(p\) be an odd prime. Then:
<ol>
<li><strong>(Multiplicativity)</strong> \(\displaystyle\left(\frac{ab}{p}\right) = \left(\frac{a}{p}\right)\left(\frac{b}{p}\right)\) for all \(a, b\) with \(p \nmid ab\).</li>
<li><strong>(Euler's criterion)</strong> \(\displaystyle\left(\frac{a}{p}\right) \equiv a^{(p-1)/2} \pmod{p}\).</li>
<li><strong>(First supplement)</strong> \(\displaystyle\left(\frac{-1}{p}\right) = (-1)^{(p-1)/2} = \begin{cases} 1 & \text{if } p \equiv 1 \pmod{4}, \\ -1 & \text{if } p \equiv 3 \pmod{4}. \end{cases}\)</li>
</ol>
</div>

<div class="proof"><strong>Proof.</strong> Part (i) follows because the Legendre symbol is a group homomorphism. For (ii), since \(\mathbb{F}_p^*\) is cyclic of order \(p-1\), let \(\alpha\) be a generator. Then \(a = \alpha^k\) for some \(k\), and \(a\) is a square if and only if \(k\) is even, if and only if \(\alpha^{k(p-1)/2} = 1\). Since \(a^{(p-1)/2} = \alpha^{k(p-1)/2}\) equals \(1\) when \(k\) is even and \(-1\) when \(k\) is odd (being a root of \(x^2 - 1\) in a field), we get Euler's criterion. Part (iii) is the special case \(a = -1\). <span class="qed">∎</span>
</div>

## Quadratic Reciprocity via Cyclotomic Galois Theory

The algebraic number theory approach to quadratic reciprocity uses the Galois theory of cyclotomic fields. The key idea is to connect the Legendre symbol to the splitting behavior of primes, which in turn is governed by the Frobenius automorphism.

Let \(p\) be an odd prime, and consider the cyclotomic field \(\mathbb{Q}(\zeta_p)\). Its Galois group is

\[
\operatorname{Gal}(\mathbb{Q}(\zeta_p)/\mathbb{Q}) \cong (\mathbb{Z}/p\mathbb{Z})^*
\]
via \(\sigma_a : \zeta_p \mapsto \zeta_p^a\) for \(a \in (\mathbb{Z}/p\mathbb{Z})^*\).

<div class="definition"><strong>Definition 11.3 (Frobenius Automorphism).</strong> Let \(q \neq p\) be a prime, and let \(\mathfrak{Q}\) be a prime ideal of \(\mathbb{Z}[\zeta_p]\) lying above \(q\). The <em>Frobenius automorphism</em> \(\operatorname{Frob}_q \in \operatorname{Gal}(\mathbb{Q}(\zeta_p)/\mathbb{Q})\) is the unique automorphism satisfying

\[
\operatorname{Frob}_q(\alpha) \equiv \alpha^q \pmod{\mathfrak{Q}}
\]
for all \(\alpha \in \mathbb{Z}[\zeta_p]\).
</div>

That \(\operatorname{Frob}_q = \sigma_q\) is easily verified: for \(\alpha = \sum a_i \zeta_p^i\) with \(a_i \in \mathbb{Z}\),

\[
\alpha^q \equiv \sum a_i \zeta_p^{qi} = \sigma_q(\alpha) \pmod{\mathfrak{Q}}
\]
since \(\mathbb{Z}[\zeta_p]/\mathfrak{Q}\) has characteristic \(q\).

Now let \(H_p\) be the subgroup of squares in \((\mathbb{Z}/p\mathbb{Z})^*\). By the fundamental theorem of Galois theory, \(H_p\) corresponds to a unique quadratic subfield of \(\mathbb{Q}(\zeta_p)\). Define \(p^* = (-1)^{(p-1)/2} p\), and let \(K_p = \mathbb{Q}(\sqrt{p^*})\).

<div class="lemma"><strong>Lemma 11.4.</strong> The fixed field \(\mathbb{Q}(\zeta_p)^{H_p}\) equals \(K_p = \mathbb{Q}(\sqrt{p^*})\), and \(H_p = \operatorname{Gal}(\mathbb{Q}(\zeta_p)/K_p)\).
</div>

This is a standard result from the theory of Gauss sums, which shows that \(\sqrt{p^*}\) lies in \(\mathbb{Q}(\zeta_p)\).

The connection between the Legendre symbol and splitting is now clear:

\[
\left(\frac{q}{p}\right) = 1 \iff q \in H_p \iff \sigma_q \text{ fixes } K_p \iff q \text{ splits in } K_p.
\]

<div class="theorem"><strong>Theorem 11.5 (Quadratic Reciprocity).</strong> Let \(p\) and \(q\) be distinct odd primes. Then

\[
\left(\frac{p}{q}\right)\left(\frac{q}{p}\right) = (-1)^{\frac{p-1}{2} \cdot \frac{q-1}{2}}.
\]
Equivalently,

\[
\left(\frac{q}{p}\right) = \left(\frac{p^*}{q}\right)
\]
where \(p^* = (-1)^{(p-1)/2} p\).
</div>

<div class="proof"><strong>Proof.</strong> From the analysis above, we have

\[
\left(\frac{q}{p}\right) = 1 \iff q \text{ splits in } K_p = \mathbb{Q}(\sqrt{p^*}).
\]
By the theory of splitting in quadratic fields, the prime \(q\) splits in \(\mathbb{Q}(\sqrt{p^<em>})\) if and only if \(p^</em>\) is a square modulo \(q\), i.e., \(\left(\frac{p^*}{q}\right) = 1\). Therefore

\[
\left(\frac{q}{p}\right) = \left(\frac{p^*}{q}\right) = \left(\frac{(-1)^{(p-1)/2} p}{q}\right) = \left(\frac{-1}{q}\right)^{(p-1)/2} \left(\frac{p}{q}\right) = (-1)^{\frac{(p-1)(q-1)}{4}} \left(\frac{p}{q}\right).
\]
Rearranging gives the classical form of quadratic reciprocity. <span class="qed">∎</span>
</div>

<div class="example"><strong>Example.</strong> To compute \(\left(\frac{113}{17}\right)\), we apply reciprocity repeatedly:

\[
\left(\frac{113}{17}\right) = \left(\frac{11}{17}\right) = \left(\frac{17}{11}\right) = \left(\frac{6}{11}\right) = \left(\frac{2}{11}\right)\left(\frac{3}{11}\right).
\]
Now \(\left(\frac{3}{11}\right) = -\left(\frac{11}{3}\right) = -\left(\frac{-1}{3}\right) = -(-1) = 1\) (using \(11 \equiv 2 \equiv -1 \pmod{3}\) and the first supplement). By the second supplement (or direct computation), \(\left(\frac{2}{11}\right)\) can be evaluated. Since \(11 \equiv 3 \pmod{8}\), we have \(\left(\frac{2}{11}\right) = -1\). Therefore \(\left(\frac{113}{17}\right) = (-1)(1) = -1\), so 113 is not a quadratic residue modulo 17.
</div>

## Connection to the Frobenius Map and Splitting of Primes

The proof of quadratic reciprocity reveals a deep connection between the Legendre symbol and the arithmetic of primes in number fields. The Frobenius automorphism \(\operatorname{Frob}_q\) encodes the splitting behavior of the prime \(q\): it acts on the residue field \(\mathbb{Z}[\zeta_p]/\mathfrak{Q}\) as the Frobenius endomorphism \(x \mapsto x^q\).

<div class="remark"><strong>Remark.</strong> The question "for which primes \(q\) is a given element \(\sigma_a\) equal to \(\operatorname{Frob}_q\)?" has a remarkable answer: by Dirichlet's theorem on primes in arithmetic progressions, for every \(a \in (\mathbb{Z}/p\mathbb{Z})^*\), there are infinitely many primes \(q \equiv a \pmod{p}\), each with \(\operatorname{Frob}_q = \sigma_a\). This observation generalizes vastly: the <em>Chebotarev Density Theorem</em> asserts that for any Galois extension \(L/K\), every conjugacy class in \(\operatorname{Gal}(L/K)\) arises as \(\operatorname{Frob}_\mathfrak{p}\) for a positive density of primes \(\mathfrak{p}\) of \(K\).
</div>

---

# Chapter 12: Fermat's Last Theorem

Fermat's Last Theorem, stating that the equation \(x^n + y^n = z^n\) has no solutions in positive integers for \(n \ge 3\), resisted proof for over 350 years until Andrew Wiles's celebrated work in 1995. However, long before Wiles, Ernst Kummer made dramatic progress by proving the theorem for a large class of prime exponents, the so-called <em>regular primes</em>. Kummer's approach, which uses the arithmetic of cyclotomic integers \(\mathbb{Z}[\zeta_p]\), was one of the driving forces behind the development of algebraic number theory.

In this chapter, we present Kummer's proof for Case I of Fermat's Last Theorem for regular primes.

## Regular Primes

The ring \(\mathbb{Z}[\zeta_p]\) is not always a UFD, and this failure is measured by its class number \(h_p = h_{\mathbb{Q}(\zeta_p)}\). The crucial definition is:

<div class="definition"><strong>Definition 12.1 (Regular Prime).</strong> An odd prime \(p\) is called <em>regular</em> if \(p \nmid h_p\), where \(h_p\) is the class number of \(\mathbb{Q}(\zeta_p)\). Otherwise, \(p\) is called <em>irregular</em>.
</div>

The first few irregular primes are 37, 59, 67, and 101. It is conjectured that there are infinitely many regular primes (and in fact that about 60.65% of all primes are regular), but this remains unproven.

The importance of regularity for Fermat's Last Theorem comes from the following observation: if \(p\) is regular and \(I\) is an ideal of \(\mathbb{Z}[\zeta_p]\) with \(I^p\) principal, then \(I\) itself is principal. This is because \([I]^p = 1\) in the class group, and since \(p \nmid h_p\), raising to the \(p\)-th power is an automorphism of the class group (by Lagrange's theorem and the coprimality condition), so \([I] = 1\).

## Kummer's Approach: Factoring in \(\mathbb{Z}[\zeta_p]\)

The idea behind Kummer's approach is elegant. Suppose \(x^p + y^p = z^p\) for integers \(x, y, z\) with \(p \nmid xyz\). In the ring \(\mathbb{Z}[\zeta_p]\), where \(\zeta = \zeta_p\) is a primitive \(p\)-th root of unity, we can factor

\[
z^p = x^p + y^p = \prod_{j=0}^{p-1} (x + \zeta^j y).
\]
If the ideals \((x + \zeta^j y)\) are pairwise coprime, then since their product is a \(p\)-th power of an ideal, each factor must itself be a \(p\)-th power. This is the starting point for Kummer's argument.

## Properties of \((1 - \zeta)\) in \(\mathbb{Z}[\zeta_p]\)

Before proceeding with the proof, we need several key properties of the element \(1 - \zeta\) in \(\mathbb{Z}[\zeta_p]\).

<div class="lemma"><strong>Lemma 12.2.</strong> Let \(\zeta = \zeta_p\) be a primitive \(p\)-th root of unity. In \(\mathbb{Z}[\zeta]\):
<ol>
<li>The elements \(1 - \zeta, 1 - \zeta^2, \ldots, 1 - \zeta^{p-1}\) are associates.</li>
<li>The element \(1 + \zeta\) is a unit.</li>
<li>There exists a unit \(u \in \mathbb{Z}[\zeta]^*\) such that \(p = u(1-\zeta)^{p-1}\). In particular, \((1-\zeta)\) is the unique prime ideal of \(\mathbb{Z}[\zeta]\) lying above \(p\).</li>
</ol>
</div>

<div class="proof"><strong>Proof.</strong> (i) For \(1 \le j \le p-1\), the ratio \(\frac{1 - \zeta^j}{1 - \zeta} = 1 + \zeta + \cdots + \zeta^{j-1}\) is an element of \(\mathbb{Z}[\zeta]\). Similarly, choose \(k\) with \(jk \equiv 1 \pmod{p}\); then \(\frac{1 - \zeta}{1 - \zeta^j} = \frac{1 - \zeta^{jk}}{1 - \zeta^j} \in \mathbb{Z}[\zeta]\). So the ratio and its inverse are both algebraic integers, making them associates.

(ii) We have \(1 + \zeta = \frac{1 - \zeta^2}{1 - \zeta}\), and by part (i), both \(1 - \zeta^2\) and \(1 - \zeta\) are associates, so their ratio is a unit.

(iii) The cyclotomic polynomial gives

\[
1 + x + \cdots + x^{p-1} = \prod_{j=1}^{p-1} (x - \zeta^j).
\]
Setting \(x = 1\):

\[
p = \prod_{j=1}^{p-1} (1 - \zeta^j) = (1 - \zeta)^{p-1} \prod_{j=1}^{p-1} \frac{1 - \zeta^j}{1 - \zeta} = u(1-\zeta)^{p-1}
\]
where \(u = \prod_{j=1}^{p-1} \frac{1-\zeta^j}{1-\zeta} \in \mathbb{Z}[\zeta]^*\) by part (i). <span class="qed">∎</span>
</div>

We also need a fact about units and complex conjugation.

<div class="lemma"><strong>Lemma 12.3.</strong> If \(u \in \mathbb{Z}[\zeta_p]^*\), then \(u/\bar{u}\) is a root of unity (i.e., of the form \(\pm \zeta^j\) for some \(j\)).
</div>

<div class="proof"><strong>Proof.</strong> For any \(\sigma \in \operatorname{Gal}(\mathbb{Q}(\zeta)/\mathbb{Q})\), we have \(\sigma(\zeta) = \zeta^a\) for some \(a\), so \(\overline{\sigma(\zeta)} = \zeta^{-a} = \sigma(\bar{\zeta})\). Thus \(\sigma(\bar{u}) = \overline{\sigma(u)}\), and consequently

\[
\left|\sigma\!\left(\frac{u}{\bar{u}}\right)\right| = \frac{|\sigma(u)|}{|\overline{\sigma(u)}|} = 1
\]
for every embedding \(\sigma\). An algebraic integer all of whose conjugates have absolute value 1 must be a root of unity. <span class="qed">∎</span>
</div>

## Kummer's Theorem for Case I

Fermat's Last Theorem is traditionally divided into two cases. Case I assumes that \(p \nmid xyz\), while Case II allows \(p\) to divide exactly one of \(x, y, z\). Kummer proved both cases for regular primes; we present Case I.

<div class="theorem"><strong>Theorem 12.4 (Kummer, Case I).</strong> Let \(p \ge 3\) be a regular prime. If \(x, y, z \in \mathbb{Z} \setminus \{0\}\) with \(p \nmid xyz\), then \(x^p + y^p \neq z^p\).
</div>

<div class="proof"><strong>Proof.</strong> Suppose for contradiction that \(z^p = x^p + y^p\) with \(p \nmid xyz\). In \(\mathbb{Z}[\zeta]\), we factor

\[
z^p = \prod_{j=0}^{p-1} (x + \zeta^j y).
\]

<strong>Step 1: The ideals \((x + \zeta^j y)\) are pairwise coprime.</strong>

Suppose \(\mathfrak{p}\) is a common prime factor of \((x + \zeta^j y)\) and \((x + \zeta^{j'} y)\) for \(j \neq j'\). Then \(\mathfrak{p}\) divides

\[
(x + \zeta^j y) - (x + \zeta^{j'} y) = \zeta^{j'} y (\zeta^{j-j'} - 1).
\]
By Lemma 12.2(i), \(\zeta^{j-j'} - 1\) is an associate of \(1 - \zeta\), so \(\mathfrak{p}\) divides \(y(1-\zeta)\). Since \((1-\zeta)\) is the unique prime above \(p\), either \(\mathfrak{p} = (1-\zeta)\) or \(\mathfrak{p}\) divides \((y)\).

If \(\mathfrak{p} = (1-\zeta)\), then \(\mathfrak{p}\) divides \(x + \zeta^j y \equiv x + y \pmod{(1-\zeta)}\), so \(p \mid (x+y)\). Similarly \(\mathfrak{p} \mid z^p\), so \(p \mid z\). But then \(x^p + y^p = z^p \equiv 0 \pmod{p}\), giving \(x + y \equiv 0 \pmod{p}\), so \(x^p + y^p = (x+y)(\cdots) \equiv 0 \pmod{p^2}\) (by the binomial theorem), forcing \(p^2 \mid z^p\), hence \(p \mid z\). But we assumed \(p \nmid z\), a contradiction. Similarly, \(\mathfrak{p}\) cannot divide \((y)\) without contradicting \(p \nmid y\).

<strong>Step 2: Each \((x + \zeta^j y)\) is a \(p\)-th power of an ideal.</strong>

Since the ideals \((x + \zeta^j y)\) are pairwise coprime and their product \((z^p) = (z)^p\) is a \(p\)-th power, unique factorization of ideals forces each \((x + \zeta^j y) = I_j^p\) for some ideal \(I_j\).

<strong>Step 3: Each \(I_j\) is principal (by regularity).</strong>

Since \(p\) is regular, \(p \nmid h_p\). The class \([I_j]\) satisfies \([I_j]^p = 1\) in the class group. Since \(\gcd(p, h_p) = 1\), the only element of order dividing \(p\) in the class group (which has order \(h_p\)) is the identity. So \([I_j] = 1\), meaning \(I_j\) is principal.

<strong>Step 4: Derive a contradiction.</strong>

Taking \(j = 1\), we have \((x + \zeta y) = (t)^p\) for some \(t \in \mathbb{Z}[\zeta]\), so \(x + \zeta y = ut^p\) for some unit \(u\).

Write \(t = b_0 + b_1\zeta + \cdots + b_{p-2}\zeta^{p-2}\). Working modulo the ideal \((p) = (1-\zeta)^{p-1}\), the Frobenius-type relation gives

\[
t^p \equiv (b_0 + b_1 + \cdots + b_{p-2})^p \pmod{p}
\]
since \(\zeta^k \equiv 1 \pmod{(1-\zeta)}\). Similarly \(\bar{t}^p \equiv (b_0 + \cdots + b_{p-2})^p \pmod{p}\), so \(t^p \equiv \bar{t}^p \pmod{p}\).

By Lemma 12.3, \(u/\bar{u} = \pm \zeta^j\) for some \(j\). Consider the case \(u/\bar{u} = \zeta^j\). Then

\[
x + y\zeta = ut^p \equiv \zeta^j \bar{u} \bar{t}^p = \zeta^j \overline{ut^p} = \zeta^j(x + y\bar{\zeta}) = \zeta^j(x + y\zeta^{-1}) \pmod{p}.
\]
This gives

\[
x + y\zeta - y\zeta^{j-1} - x\zeta^j \equiv 0 \pmod{p}.
\]
Since \(1, \zeta, \zeta^2, \ldots, \zeta^{p-2}\) form a basis for \(\mathbb{Z}[\zeta]\) over \(\mathbb{Z}\), and modulo \(p\) the ring \(\mathbb{Z}[\zeta]/(p) \cong \mathbb{F}_p[x]/(x-1)^{p-1}\), this linear combination being zero modulo \(p\) with the terms \(1, \zeta, \zeta^{j-1}, \zeta^j\) forces \(j \in \{0, 1, 2, p-1\}\) (otherwise we would have a nontrivial relation among fewer than \(p-1\) distinct basis elements). Each possibility leads to \(p \mid x\), \(p \mid y\), or \(p \mid z\), contradicting our assumption \(p \nmid xyz\). <span class="qed">∎</span>
</div>

<div class="remark"><strong>Remark.</strong> Case II (when \(p\) divides one of \(x, y, z\)) requires additional arguments involving the unit group of \(\mathbb{Z}[\zeta_p]\) and Kummer's lemma on units. With more work, Kummer established Fermat's Last Theorem for all regular primes.
</div>

## The Hilbert Class Field

Kummer's work highlighted the role of the class group in controlling arithmetic. A deep generalization is provided by class field theory.

<div class="theorem"><strong>Theorem 12.5 (Hilbert Class Field).</strong> Let \(K\) be a number field with class number \(h_K\). There exists a unique field extension \(E/K\), called the <em>Hilbert class field</em> of \(K\), with the following properties:
<ol>
<li>\([E:K] = h_K\).</li>
<li>\(E/K\) is Galois, and \(\operatorname{Gal}(E/K) \cong \operatorname{Cl}(\mathcal{O}_K)\).</li>
<li>Every ideal of \(\mathcal{O}_K\) becomes principal in \(\mathcal{O}_E\).</li>
<li>Every prime ideal \(\mathfrak{P}\) of \(\mathcal{O}_K\) decomposes into the product of \(h_K/f\) prime ideals in \(\mathcal{O}_E\), where \(f\) is the order of \([\mathfrak{P}]\) in \(\operatorname{Cl}(\mathcal{O}_K)\).</li>
<li>The extension \(E/K\) is unramified at all primes (both finite and infinite).</li>
</ol>
</div>

The existence of the Hilbert class field was conjectured by Hilbert and proved by Furtwangler. It is the maximal abelian unramified extension of \(K\), and its construction is one of the cornerstones of class field theory. While the full proof lies well beyond the scope of these notes, the statement itself illuminates the deep connection between ideal class groups and Galois theory.

<div class="example"><strong>Example.</strong> For \(K = \mathbb{Q}(\sqrt{-23})\), we computed earlier that \(h_K = 3\) and \(\operatorname{Cl}(\mathcal{O}_K) \cong \mathbb{Z}/3\mathbb{Z}\). The Hilbert class field is a degree 3 extension of \(K\) in which every ideal of \(\mathcal{O}_K\) becomes principal.
</div>

---

# Appendix A: Continued Fractions

Continued fractions provide a systematic way to produce the best rational approximations to real numbers. For quadratic irrationals, the continued fraction expansion is eventually periodic, a fact that connects directly to the computation of fundamental units in real quadratic fields and to the solution of Pell's equation. This appendix develops the theory from scratch and concludes with explicit computations.

## Finite and Infinite Continued Fractions

<div class="definition"><strong>Definition A.1 (Continued Fraction).</strong> Let \(a_0 \in \mathbb{R}\) and \(a_k > 0\) for \(k \ge 1\). The <em>finite continued fraction</em> \([a_0, a_1, \ldots, a_n]\) is defined recursively by

\[
[a_0] = a_0, \qquad [a_0, a_1, \ldots, a_n] = a_0 + \cfrac{1}{[a_1, \ldots, a_n]}.
\]
When \(a_0 \in \mathbb{Z}\) and \(a_k \in \mathbb{Z}^+\) for \(k \ge 1\), the <em>infinite continued fraction</em> is

\[
[a_0, a_1, a_2, \ldots] = \lim_{n \to \infty} [a_0, a_1, \ldots, a_n].
\]
</div>

<div class="theorem"><strong>Theorem A.2.</strong> Every rational number is equal to a finite continued fraction.
</div>

<div class="proof"><strong>Proof.</strong> Let \(x = a/b\) with \(a \in \mathbb{Z}\), \(b \in \mathbb{Z}^+\). Apply the division algorithm repeatedly:

\[
a = q_1 b + r_1, \quad b = q_2 r_1 + r_2, \quad r_1 = q_3 r_2 + r_3, \quad \ldots
\]
with \(0 = r_n < r_{n-1} < \cdots < r_1 < b\). Then

\[
x = \frac{a}{b} = q_1 + \frac{r_1}{b} = q_1 + \cfrac{1}{b/r_1} = q_1 + \cfrac{1}{q_2 + \cfrac{r_2}{r_1}} = \cdots = [q_1, q_2, \ldots, q_n].
\]
<span class="qed">∎</span>
</div>

<div class="remark"><strong>Remark.</strong> The representation is not quite unique: we always have \([a_0, a_1, \ldots, a_n, 1] = [a_0, a_1, \ldots, a_n + 1]\). One can make it unique by requiring \(a_n \ge 2\) when \(n \ge 1\).
</div>

## Convergents and Their Recursive Computation

The power of continued fractions lies in the elegant recursive formulas for the successive approximations.

<div class="definition"><strong>Definition A.3 (Convergents).</strong> The \(n\)-th <em>convergent</em> of the continued fraction \([a_0, a_1, a_2, \ldots]\) is

\[
c_n = [a_0, a_1, \ldots, a_n] = \frac{p_n}{q_n}
\]
where \(p_n\) and \(q_n\) are defined by the recursion:

\[
p_0 = a_0, \quad p_1 = a_1 a_0 + 1, \quad p_k = a_k p_{k-1} + p_{k-2} \quad (k \ge 2),
\]

\[
q_0 = 1, \quad q_1 = a_1, \quad q_k = a_k q_{k-1} + q_{k-2} \quad (k \ge 2).
\]
</div>

<div class="theorem"><strong>Theorem A.4.</strong> For all \(n \ge 0\), we have \(c_n = p_n/q_n\).
</div>

<div class="proof"><strong>Proof.</strong> We proceed by induction. The base cases are immediate: \(c_0 = a_0 = p_0/q_0\) and \(c_1 = a_0 + 1/a_1 = (a_1 a_0 + 1)/a_1 = p_1/q_1\).

For the inductive step, suppose the formula holds for continued fractions of length \(k\). Then

\[
c_{k+1} = [a_0, a_1, \ldots, a_k, a_{k+1}] = \left[a_0, a_1, \ldots, a_{k-1}, a_k + \frac{1}{a_{k+1}}\right].
\]
By the inductive hypothesis (applied with \(a_k' = a_k + 1/a_{k+1}\) in the last position, noting that \(p_i' = p_i\) and \(q_i' = q_i\) for \(i < k\)):

\[
c_{k+1} = \frac{a_k' p_{k-1} + p_{k-2}}{a_k' q_{k-1} + q_{k-2}} = \frac{(a_k + 1/a_{k+1}) p_{k-1} + p_{k-2}}{(a_k + 1/a_{k+1}) q_{k-1} + q_{k-2}}.
\]
Multiplying numerator and denominator by \(a_{k+1}\):

\[
c_{k+1} = \frac{a_{k+1}(a_k p_{k-1} + p_{k-2}) + p_{k-1}}{a_{k+1}(a_k q_{k-1} + q_{k-2}) + q_{k-1}} = \frac{a_{k+1} p_k + p_{k-1}}{a_{k+1} q_k + q_{k-1}} = \frac{p_{k+1}}{q_{k+1}}.
\]
<span class="qed">∎</span>
</div>

## Properties of Convergents

The convergents satisfy beautiful arithmetic properties that make them the best possible rational approximations.

<div class="theorem"><strong>Theorem A.5.</strong> Let \(a_0 \in \mathbb{Z}\), \(a_k \in \mathbb{Z}^+\) for \(k \ge 1\), and let \(c_n = p_n/q_n\) be the convergents. Then:
<ol>
<li>For all \(k \ge 0\): \(p_{k+1} q_k - q_{k+1} p_k = (-1)^k\).</li>
<li>For all \(k \ge 0\): \(\gcd(p_k, q_k) = 1\).</li>
<li>For all \(k \ge 0\): \(\displaystyle c_{k+1} - c_k = \frac{(-1)^k}{q_{k+1} q_k}\).</li>
<li>The sequence \(\{c_n\}\) converges.</li>
<li>If \(x = [a_0, a_1, a_2, \ldots]\), then \(c_{2k} < x < c_{2k+1}\) for all \(k \ge 0\).</li>
</ol>
</div>

<div class="proof"><strong>Proof.</strong> (i) We prove this by induction. For \(k = 0\): \(p_1 q_0 - q_1 p_0 = (a_1 a_0 + 1)(1) - a_1 \cdot a_0 = 1 = (-1)^0\). For \(k \ge 1\):

\[
p_{k+1} q_k - q_{k+1} p_k = (a_{k+1} p_k + p_{k-1})q_k - (a_{k+1} q_k + q_{k-1})p_k = p_{k-1} q_k - q_{k-1} p_k = -(p_k q_{k-1} - q_k p_{k-1}).
\]
By induction, \(p_k q_{k-1} - q_k p_{k-1} = (-1)^{k-1}\), so \(p_{k+1} q_k - q_{k+1} p_k = (-1)^k\).

(ii) From (i), \(p_{k+1} q_k - q_{k+1} p_k = (-1)^k\), so \(\gcd(p_k, q_k) \mid (-1)^k\), giving \(\gcd(p_k, q_k) = 1\).

(iii) Using (i):

\[
c_{k+1} - c_k = \frac{p_{k+1}}{q_{k+1}} - \frac{p_k}{q_k} = \frac{p_{k+1} q_k - q_{k+1} p_k}{q_{k+1} q_k} = \frac{(-1)^k}{q_{k+1} q_k}.
\]

(iv) and (v): From (iii) and the fact that \(q_k \ge 1\) is strictly increasing for \(k \ge 1\), the differences \(c_{k+1} - c_k\) alternate in sign and decrease in absolute value. By the alternating series test, the series \(c_0 + \sum_{k=0}^\infty (c_{k+1} - c_k)\) converges, and the even convergents \(c_0 < c_2 < c_4 < \cdots\) increase to the limit while the odd convergents \(c_1 > c_3 > c_5 > \cdots\) decrease to it. <span class="qed">∎</span>
</div>

## Irrational Numbers and Infinite Continued Fractions

<div class="theorem"><strong>Theorem A.6.</strong> A real number \(x\) is irrational if and only if \(x = [a_0, a_1, a_2, \ldots]\) for some \(a_0 \in \mathbb{Z}\) and \(a_k \in \mathbb{Z}^+\) for \(k \ge 1\). In this case, the partial quotients are given by \(a_n = \lfloor x_n \rfloor\), where \(x_0 = x\) and \(x_{k+1} = 1/(x_k - \lfloor x_k \rfloor)\) for \(k \ge 0\).
</div>

<div class="proof"><strong>Proof.</strong> <strong>Irrationality of infinite continued fractions:</strong> Suppose \(x = [a_0, a_1, a_2, \ldots]\) with \(a_0 \in \mathbb{Z}\) and \(a_k \in \mathbb{Z}^+\). By Theorem A.5(v), \(x\) lies strictly between \(c_k\) and \(c_{k+1}\) for all \(k\), so \(x \neq c_k\) for any \(k\). If \(x = r/s\) were rational, then for all \(k\):

\[
0 < \frac{1}{sq_k} \le \left|\frac{r}{s} - \frac{p_k}{q_k}\right| = |x - c_k| < |c_{k+1} - c_k| = \frac{1}{q_{k+1} q_k} < \frac{1}{q_k^2}.
\]
This gives \(s > q_k\) for all \(k\), contradicting \(q_k \to \infty\).

<strong>Uniqueness of partial quotients:</strong> If \(x = [a_0, a_1, a_2, \ldots]\), then \(a_0 < x < a_0 + 1\) (by Theorem A.5(v) with the fact that \([a_1, a_2, \ldots] > a_1 \ge 1\)), so \(a_0 = \lfloor x \rfloor = \lfloor x_0 \rfloor\). Then \(x_1 = 1/(x - a_0) = [a_1, a_2, \ldots]\), and by induction \(a_n = \lfloor x_n \rfloor\) and \(x_n = [a_n, a_{n+1}, \ldots]\).

<strong>Every irrational has a continued fraction expansion:</strong> Given \(x \in \mathbb{R} \setminus \mathbb{Q}\), define \(x_0 = x\), \(a_k = \lfloor x_k \rfloor\), and \(x_{k+1} = 1/(x_k - a_k)\). Since \(x_0\) is irrational, \(x_k - a_k\) is never zero, and each \(x_k\) is irrational with \(a_k \ge 1\) for \(k \ge 1\). One verifies that \(x = [a_0, a_1, \ldots, a_n, x_{n+1}]\) for all \(n\), so

\[
|x - c_n| = \frac{1}{q_n(x_{n+1} q_n + q_{n-1})} < \frac{1}{q_n^2} \to 0,
\]
giving \(x = \lim c_n = [a_0, a_1, a_2, \ldots]\). <span class="qed">∎</span>
</div>

## Best Approximation Property

Convergents are optimal rational approximations in a strong sense.

<div class="theorem"><strong>Theorem A.7 (Best Approximation).</strong> Let \(x = [a_0, a_1, a_2, \ldots]\) with convergents \(c_n = p_n/q_n\), and let \(r/s\) be a fraction with \(s > 0\). Then:
<ol>
<li>If \(|sx - r| < |q_k x - p_k|\), then \(s \ge q_{k+1}\).</li>
<li>If \(|x - r/s| < |x - p_k/q_k|\), then \(s > q_k\).</li>
<li>If \(|x - r/s| < 1/(2s^2)\), then \(r/s = c_k\) for some \(k\).</li>
</ol>
</div>

<div class="proof"><strong>Proof.</strong> (i) Suppose \(|sx - r| < |q_k x - p_k|\) and, for contradiction, that \(s < q_{k+1}\). Express \((r, s) = u(p_k, q_k) + v(p_{k+1}, q_{k+1})\) using the fact that \(p_k q_{k+1} - q_k p_{k+1} = (-1)^{k+1}\) means the matrix \(\begin{pmatrix} p_k & p_{k+1} \\ q_k & q_{k+1}\end{pmatrix}\) has determinant \((-1)^{k+1}\), hence is invertible over \(\mathbb{Z}\).

One finds \(u, v \in \mathbb{Z}\) with \(u \neq 0\) (since \(v = 0\) would give \(s = uq_k\) and \(|sx - r| \ge |q_k x - p_k|\)) and \(v \neq 0\) (since \(u = 0\) would give \(s = vq_{k+1} \ge q_{k+1}\)). Moreover, \(u\) and \(v\) have opposite signs (since \(s = uq_k + vq_{k+1} > 0\) and \(s < q_{k+1}\)).

Since \(x\) lies between \(c_k\) and \(c_{k+1}\), the quantities \(q_k x - p_k\) and \(q_{k+1}x - p_{k+1}\) have opposite signs. Combined with \(u\) and \(v\) having opposite signs, the products \(u(q_k x - p_k)\) and \(v(q_{k+1}x - p_{k+1})\) have the same sign, so

\[
|sx - r| = |u(q_k x - p_k) + v(q_{k+1}x - p_{k+1})| = |u||q_k x - p_k| + |v||q_{k+1}x - p_{k+1}| > |q_k x - p_k|,
\]
contradicting our assumption.

(ii) If \(|x - r/s| < |x - p_k/q_k|\) and \(s \le q_k\), then \(|sx - r| = s|x - r/s| < s|x - p_k/q_k| \le q_k|x - p_k/q_k| = |q_k x - p_k|\), contradicting (i) (which gives \(s \ge q_{k+1} > q_k\)).

(iii) Given \(|x - r/s| < 1/(2s^2)\), choose \(k\) with \(q_k \le s < q_{k+1}\). If \(r/s \neq p_k/q_k\), then \(|r/s - p_k/q_k| \ge 1/(sq_k)\) (since \(rq_k - sp_k\) is a nonzero integer). The triangle inequality gives

\[
\frac{1}{sq_k} \le \left|\frac{r}{s} - \frac{p_k}{q_k}\right| \le \left|\frac{r}{s} - x\right| + \left|x - \frac{p_k}{q_k}\right| < \frac{1}{2s^2} + \frac{1}{2sq_k},
\]
where the last inequality uses (i) applied to \(p_k/q_k\). Subtracting \(1/(2sq_k)\) gives \(1/(2sq_k) < 1/(2s^2)\), so \(s < q_k\), contradicting \(q_k \le s\). <span class="qed">∎</span>
</div>

## Quadratic Irrationals and Periodic Continued Fractions

The connection between continued fractions and algebraic number theory runs through quadratic irrationals.

<div class="definition"><strong>Definition A.8 (Quadratic Irrational).</strong> A <em>quadratic irrational</em> is an irrational number that is a root of a quadratic polynomial with integer coefficients.
</div>

<div class="theorem"><strong>Theorem A.9.</strong> The quadratic irrationals are precisely the numbers of the form \(x = \frac{r + s\sqrt{d}}{t}\) where \(d \in \mathbb{Z}^+\) is not a perfect square and \(r, s, t \in \mathbb{Z}\) with \(s, t \neq 0\) and \(t \mid (r^2 - s^2 d)\).
</div>

<div class="proof"><strong>Proof.</strong> If \(x = (r + s\sqrt{d})/t\) with the stated conditions, then \(tx - r = s\sqrt{d}\), so \(t^2 x^2 - 2rtx + r^2 = s^2 d\), giving \(t^2 x^2 - 2rtx + (r^2 - s^2d) = 0\). This is a quadratic with integer coefficients (note \(t \mid (r^2 - s^2 d)\) ensures the constant term divided by \(t^2\) is rational, and in fact the equation \(tx^2 - 2rx + (r^2-s^2d)/t = 0\) has integer coefficients).

Conversely, if \(x\) is irrational and satisfies \(ax^2 + bx + c = 0\) with \(a, b, c \in \mathbb{Z}\), \(a \neq 0\), then \(x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}\). Setting \(d = b^2 - 4ac\) (which must be positive and non-square since \(x\) is real and irrational), we get the desired form. <span class="qed">∎</span>
</div>

The following celebrated theorem of Lagrange characterizes quadratic irrationals by the periodicity of their continued fraction expansions.

<div class="theorem"><strong>Theorem A.10 (Lagrange).</strong> Let \(x = [a_0, a_1, a_2, \ldots]\) with \(a_0 \in \mathbb{Z}\) and \(a_k \in \mathbb{Z}^+\) for \(k \ge 1\). Then:
<ol>
<li>The sequence \(\{a_n\}\) is eventually periodic if and only if \(x\) is a quadratic irrational.</li>
<li>The sequence \(\{a_n\}\) is purely periodic if and only if \(x\) is a quadratic irrational with \(x > 1\) and \(-1 < \bar{x} < 0\), where \(\bar{x}\) denotes the conjugate of \(x\).</li>
</ol>
</div>

We write \(\overline{a_1, \ldots, a_\ell}\) for the repeating block, so that \([a_0, \overline{a_1, \ldots, a_\ell}]\) means the sequence \(a_1, \ldots, a_\ell\) repeats indefinitely.

## Computing \(\sqrt{d}\) as a Continued Fraction

For a positive non-square integer \(d\), the continued fraction of \(\sqrt{d}\) has a particularly nice structure.

<div class="theorem"><strong>Theorem A.11.</strong> Let \(d \in \mathbb{Z}^+\) be a non-square. Write \(\sqrt{d} = [a_0, a_1, a_2, \ldots]\) with convergents \(c_n = p_n/q_n\), and let \(\ell\) be the minimum period of \(\{a_n\}_{n \ge 1}\). Define \(x_0 = \sqrt{d}\) and \(x_{k+1} = 1/(x_k - \lfloor x_k \rfloor)\), and write \(x_k = (r_k + \sqrt{d})/s_k\). Then:
<ol>
<li>\(a_\ell = 2a_0\), so that \(\sqrt{d} = [a_0, \overline{a_1, a_2, \ldots, a_{\ell-1}, 2a_0}]\).</li>
<li>The sequence \(\{s_n\}\) is purely periodic with \(s_k = 1 \iff \ell \mid k\).</li>
<li>For all \(k \ge 0\): \(p_k^2 - dq_k^2 = (-1)^k s_{k+1}\).</li>
<li>The smallest unit \(u\) in \(\mathbb{Z}[\sqrt{d}]\) with \(u > 1\) equals \(u = p_{\ell-1} + q_{\ell-1}\sqrt{d}\), and \(u^m = p_{m\ell-1} + q_{m\ell-1}\sqrt{d}\) for all \(m \in \mathbb{Z}^+\).</li>
</ol>
</div>

Part (iv) is the key connection to number theory: the continued fraction algorithm directly computes the fundamental unit.

## Connection to Pell's Equation

<div class="corollary"><strong>Corollary A.12.</strong> Let \(d \in \mathbb{Z}^+\) be a non-square, and let \(r, s \in \mathbb{Z}^+\). If \(|r^2 - ds^2| \le \sqrt{d}\), then \(r/s\) is a convergent of \(\sqrt{d}\).
</div>

<div class="proof"><strong>Proof.</strong> Suppose \(|r^2 - ds^2| \le \sqrt{d}\). We consider two cases.

<strong>Case 1:</strong> \(0 < r^2 - ds^2 \le \sqrt{d}\). Then \(r > s\sqrt{d}\), and

\[
0 < \frac{r}{s} - \sqrt{d} = \frac{r^2 - ds^2}{s(r + s\sqrt{d})} \le \frac{\sqrt{d}}{s(s\sqrt{d} + s\sqrt{d})} = \frac{1}{2s^2}.
\]
By Theorem A.7(iii), \(r/s\) is a convergent of \(\sqrt{d}\).

<strong>Case 2:</strong> \(-\sqrt{d} < r^2 - ds^2 < 0\). Then \(r < s\sqrt{d}\), so \(r/\sqrt{d} < s\), and

\[
0 < \frac{s}{r} - \frac{1}{\sqrt{d}} = \frac{s\sqrt{d} - r}{r\sqrt{d}} = \frac{ds^2 - r^2}{r\sqrt{d}(s\sqrt{d} + r)} < \frac{\sqrt{d}}{r\sqrt{d}(r + r)} = \frac{1}{2r^2}.
\]
By Theorem A.7(iii), \(s/r\) is a convergent of \(1/\sqrt{d}\). Since the convergents of \(1/\sqrt{d}\) are the reciprocals of the convergents of \(\sqrt{d}\) (by the observation that if \(x > 1\) then \(1/x = [0, a_0, a_1, \ldots]\) and \(d_n = 1/c_{n-1}\)), it follows that \(r/s\) is a convergent of \(\sqrt{d}\). <span class="qed">∎</span>
</div>

This corollary, combined with Theorem A.11(iii) and (iv), shows that solutions to Pell's equation \(x^2 - dy^2 = \pm 1\) correspond precisely to convergents \(p_n/q_n\) where \(s_{n+1} = 1\), and the fundamental solution is \((p_{\ell-1}, q_{\ell-1})\).

## Worked Example: \(\sqrt{14}\)

<div class="example"><strong>Example.</strong> We compute the continued fraction of \(\sqrt{14}\). Setting \(x_0 = \sqrt{14}\) and applying the recursion \(a_k = \lfloor x_k \rfloor\), \(x_{k+1} = 1/(x_k - a_k)\):

| \(k\) | \(x_k\) | \(a_k\) |
|:---:|:---:|:---:|
| 0 | \(\sqrt{14}\) | 3 |
| 1 | \(\frac{\sqrt{14}+3}{5}\) | 1 |
| 2 | \(\frac{\sqrt{14}+2}{2}\) | 2 |
| 3 | \(\frac{\sqrt{14}+2}{5}\) | 1 |
| 4 | \(\frac{\sqrt{14}+3}{1}\) | 6 |
| 5 | \(\frac{\sqrt{14}+3}{5}\) | 1 |

Since \(x_5 = x_1\), the sequence is periodic with period \(\ell = 4\):

\[
\sqrt{14} = [3, \overline{1, 2, 1, 6}].
\]
The convergents are \(3, 4, 11/3, 15/4, 101/27, \ldots\). Since \(\ell = 4\), the fundamental solution to \(x^2 - 14y^2 = 1\) comes from \((p_3, q_3) = (15, 4)\), and indeed \(15^2 - 14 \cdot 4^2 = 225 - 224 = 1\). The fundamental unit in \(\mathbb{Z}[\sqrt{14}]\) is \(15 + 4\sqrt{14}\).
</div>

## Worked Example: \(\sqrt{19}\)

<div class="example"><strong>Example.</strong> We compute the continued fraction of \(\sqrt{19}\) and find the fundamental unit.

| \(k\) | \(x_k\) | \(a_k\) | \(p_k\) | \(q_k\) | \(N_k = p_k^2 - 19q_k^2\) |
|:---:|:---:|:---:|:---:|:---:|:---:|
| 0 | \(\sqrt{19}\) | 4 | 4 | 1 | \(-3\) |
| 1 | \(\frac{\sqrt{19}+4}{3}\) | 2 | 9 | 2 | 5 |
| 2 | \(\frac{\sqrt{19}+2}{5}\) | 1 | 13 | 3 | \(-2\) |
| 3 | \(\frac{\sqrt{19}+3}{2}\) | 3 | 48 | 11 | 5 |
| 4 | \(\frac{\sqrt{19}+3}{5}\) | 1 | 61 | 14 | \(-3\) |
| 5 | \(\frac{\sqrt{19}+2}{3}\) | 2 | 170 | 39 | 1 |
| 6 | \(\frac{\sqrt{19}+4}{1}\) | 8 | | | |

Since \(x_6\) yields \(a_6 = 8 = 2a_0\) and then the pattern repeats, the period is \(\ell = 6\):

\[
\sqrt{19} = [4, \overline{2, 1, 3, 1, 2, 8}].
\]
The norms \(N_k = p_k^2 - 19q_k^2\) confirm Theorem A.11(iii): \(N_k = (-1)^k s_{k+1}\), and \(N_5 = 1\) corresponds to \(s_6 = 1\), i.e., \(\ell \mid 6\).

The fundamental unit in \(\mathbb{Z}[\sqrt{19}]\) with \(u > 1\) is

\[
u = p_5 + q_5\sqrt{19} = 170 + 39\sqrt{19}.
\]
One verifies: \(170^2 - 19 \cdot 39^2 = 28900 - 28899 = 1\). Since \(\ell = 6\) is even, the norm of the fundamental unit is \(+1\), meaning Pell's equation \(x^2 - 19y^2 = -1\) has no solution.
</div>
