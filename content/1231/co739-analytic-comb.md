---
title: "CO 739: Analytic and Algorithmic Combinatorics"
prof: "Stephen Melczer"
subjects: "CO"
---

*These notes synthesize material from publicly available sources on analytic combinatorics, principally Philippe Flajolet and Robert Sedgewick's Analytic Combinatorics (Cambridge University Press, 2009; freely available at algo.inria.fr/flajolet/Publications/book.pdf), Stephen Melczer's An Invitation to Analytic Combinatorics in Several Variables (Springer, 2021; preprint on the author's website), Herbert Wilf's Generatingfunctionology (Academic Press, 2nd ed., 1994; freely available at www2.math.upenn.edu/~wilf/DownldGF.html), Robin Pemantle and Mark C. Wilson's Analytic Combinatorics in Several Variables (Cambridge, 2013), Doron Zeilberger and Marko Petkovsek's A=B (freely available), and supplementary public lecture notes by Igor Pak (UCLA) and Bruno Salvy (INRIA). All proofs and examples have been re-derived and re-phrased from these public sources.*

---

## Chapter 1: Generating Functions and the Symbolic Method

Analytic combinatorics is a discipline that uses complex analysis and generating functions to derive precise asymptotic information about combinatorial structures. Its central thesis, due to Flajolet and Sedgewick, is that one can pass directly from a combinatorial specification of a class of objects to an analytic expression for the generating function, and from the analytic properties of that generating function — particularly the location and nature of its singularities — to the asymptotic growth rate and limit law of the counting sequence. This chapter introduces the basic objects of the theory: combinatorial classes, generating functions, and the symbolic method.

### 1.1 Combinatorial Classes and Generating Functions

A **combinatorial class** is a (finite or denumerable) set \(\mathcal{A}\) together with a **size function** \(|\cdot|: \mathcal{A} \to \mathbb{Z}_{\ge 0}\) such that the set \(\mathcal{A}_n = \{\alpha \in \mathcal{A} : |\alpha| = n\}\) of objects of size \(n\) is finite for every \(n\). The **counting sequence** of \(\mathcal{A}\) is \(a_n = |\mathcal{A}_n|\).

<div class="definition">
<strong>Definition 1.1 (Ordinary and exponential generating functions).</strong> The <em>ordinary generating function</em> (OGF) of a sequence \((a_n)_{n \ge 0}\) is the formal power series

\[
A(z) = \sum_{n \ge 0} a_n z^n = \sum_{\alpha \in \mathcal{A}} z^{|\alpha|}.
\]

The <em>exponential generating function</em> (EGF) is

\[
\hat{A}(z) = \sum_{n \ge 0} a_n \frac{z^n}{n!} = \sum_{\alpha \in \mathcal{A}} \frac{z^{|\alpha|}}{|\alpha|!}.
\]
</div>

The choice between OGF and EGF depends on whether one is counting <strong>unlabelled</strong> structures (where atoms are interchangeable) or <strong>labelled</strong> structures (where atoms carry distinguishing labels \(1, 2, \ldots, n\)). For unlabelled classes — words, partitions, trees with anonymous nodes — the OGF is the natural object. For labelled classes — permutations, set partitions, labelled graphs — the EGF is forced upon us by the combinatorial product, in which two structures of sizes \(m\) and \(n\) can be combined in \(\binom{m+n}{m}\) ways by interleaving labels.

<div class="example">
<strong>Example 1.2.</strong> The class of all finite binary words has counting sequence \(a_n = 2^n\) and OGF \(A(z) = \frac{1}{1-2z}\). The class of permutations has \(a_n = n!\) and EGF \(\hat{A}(z) = \frac{1}{1-z}\). The class of set partitions has \(a_n = B_n\) (Bell number) and EGF \(\hat{B}(z) = \exp(e^z - 1)\).
</div>

A formal power series ring \(\mathbb{C}[[z]]\) is the appropriate algebraic setting: one may add, multiply, differentiate, and (under mild hypotheses) compose power series without worrying about convergence. The leap to analysis comes when we ask whether \(A(z)\) converges in some disk \(|z| < \rho\); at that point the sequence \((a_n)\) is constrained by the Cauchy–Hadamard formula \(\rho = 1/\limsup_n a_n^{1/n}\), and the position of singularities on the boundary controls the growth.

### 1.2 The Symbolic Method for Unlabelled Classes

The symbolic method is a dictionary translating set-theoretic constructions on combinatorial classes into algebraic operations on generating functions. The basic atoms are the **neutral class** \(\mathcal{E}\) consisting of a single object of size \(0\), with OGF \(1\), and the **atomic class** \(\mathcal{Z}\) consisting of a single object of size \(1\), with OGF \(z\).

<div class="theorem">
<strong>Theorem 1.3 (Admissible OGF constructions).</strong> Let \(\mathcal{A}, \mathcal{B}\) be combinatorial classes with OGFs \(A(z), B(z)\). Then the constructions of disjoint union, Cartesian product, sequence, multi-set, power-set, and cycle are admissible, and the corresponding OGFs are:

<table>
<tr><th>Construction</th><th>OGF</th></tr>
<tr><td>Disjoint union: \(\mathcal{A} + \mathcal{B}\)</td><td>\(A(z) + B(z)\)</td></tr>
<tr><td>Product: \(\mathcal{A} \times \mathcal{B}\)</td><td>\(A(z) \cdot B(z)\)</td></tr>
<tr><td>Sequence: \(\mathrm{SEQ}(\mathcal{A})\), \(A(0)=0\)</td><td>\(\frac{1}{1-A(z)}\)</td></tr>
<tr><td>Multi-set: \(\mathrm{MSET}(\mathcal{A})\)</td><td>\(\prod_{\alpha} \frac{1}{1-z^{|\alpha|}} = \exp\!\left(\sum_{k \ge 1} \frac{A(z^k)}{k}\right)\)</td></tr>
<tr><td>Power-set: \(\mathrm{PSET}(\mathcal{A})\)</td><td>\(\exp\!\left(\sum_{k \ge 1} \frac{(-1)^{k-1} A(z^k)}{k}\right)\)</td></tr>
<tr><td>Cycle: \(\mathrm{CYC}(\mathcal{A})\)</td><td>\(\sum_{k \ge 1} \frac{\varphi(k)}{k} \log\frac{1}{1-A(z^k)}\)</td></tr>
</table>
</div>

The product formula \(\sum_n c_n z^n = (\sum_m a_m z^m)(\sum_n b_n z^n)\) with \(c_n = \sum_{k=0}^n a_k b_{n-k}\) reflects the fact that an element of \(\mathcal{A} \times \mathcal{B}\) of size \(n\) is a pair \((\alpha, \beta)\) with \(|\alpha| + |\beta| = n\). The sequence formula iterates the product: \(\mathrm{SEQ}(\mathcal{A}) = \mathcal{E} + \mathcal{A} + \mathcal{A}^2 + \cdots\) gives \(1 + A + A^2 + \cdots = 1/(1-A)\). The Pólya-style multiset and powerset formulas account for unordered repetition with and without multiplicities; their derivation uses the cycle index of the symmetric group.

<div class="example">
<strong>Example 1.4 (Compositions and partitions of integers).</strong> A <em>composition</em> of \(n\) is an ordered sequence of positive integers summing to \(n\). The class of compositions is \(\mathrm{SEQ}(\mathrm{SEQ}_{\ge 1}(\mathcal{Z}))\) with OGF

\[
C(z) = \frac{1}{1 - \frac{z}{1-z}} = \frac{1-z}{1-2z},
\]

so \(c_n = 2^{n-1}\) for \(n \ge 1\). An (integer) <em>partition</em> is an unordered multiset of positive integers, so \(\mathcal{P} = \mathrm{MSET}(\mathrm{SEQ}_{\ge 1}(\mathcal{Z}))\), giving Euler's formula

\[
P(z) = \prod_{k \ge 1} \frac{1}{1-z^k}.
\]
</div>

<div class="example">
<strong>Example 1.5 (Plane and binary trees).</strong> A plane tree (Catalan tree) is a root attached to a sequence of plane trees: \(\mathcal{T} = \mathcal{Z} \times \mathrm{SEQ}(\mathcal{T})\), giving \(T(z) = z/(1 - T(z))\), or \(T - T^2 = z\), whose solution \(T(z) = (1 - \sqrt{1-4z})/2\) extracts coefficients \([z^n] T(z) = \frac{1}{n} \binom{2n-2}{n-1} = C_{n-1}\) (Catalan numbers).
</div>

### 1.3 The Symbolic Method for Labelled Classes

For labelled classes, the combinatorial product \(\mathcal{A} \star \mathcal{B}\) is the **labelled product**: a pair \((\alpha, \beta)\) is replaced by all \(\binom{|\alpha|+|\beta|}{|\alpha|}\) order-consistent relabellings. The factor \(\binom{m+n}{m}\) is precisely what makes the EGF the right object: \(\frac{a_m}{m!} \cdot \frac{b_n}{n!} \cdot \binom{m+n}{m} = \frac{a_m b_n \binom{m+n}{m}}{m!\, n!}\) and summing over partitions of size gives \(\hat{A}(z) \hat{B}(z)\).

<div class="theorem">
<strong>Theorem 1.6 (Admissible EGF constructions).</strong> For labelled classes,

<table>
<tr><th>Construction</th><th>EGF</th></tr>
<tr><td>Disjoint union</td><td>\(\hat{A}(z) + \hat{B}(z)\)</td></tr>
<tr><td>Labelled product</td><td>\(\hat{A}(z) \cdot \hat{B}(z)\)</td></tr>
<tr><td>Sequence \(\mathrm{SEQ}(\mathcal{A})\), \(\hat{A}(0)=0\)</td><td>\(\frac{1}{1-\hat{A}(z)}\)</td></tr>
<tr><td>Set \(\mathrm{SET}(\mathcal{A})\)</td><td>\(\exp(\hat{A}(z))\)</td></tr>
<tr><td>Cycle \(\mathrm{CYC}(\mathcal{A})\)</td><td>\(\log \frac{1}{1-\hat{A}(z)}\)</td></tr>
</table>
</div>

The exponential formula \(\hat{A} \mapsto \exp(\hat{A})\) is the cornerstone of labelled enumeration: it says that the EGF of "sets of \(\mathcal{A}\)-objects" is the exponential of the EGF of \(\mathcal{A}\). Equivalently, the sequence \((a_n)\) of "connected structures" determines the sequence \((b_n)\) of "all structures" via \(\hat{B} = \exp(\hat{A})\); this is the **exp–log inversion** that pervades enumerative combinatorics.

<div class="example">
<strong>Example 1.7 (Permutations as sets of cycles).</strong> A permutation is a set of disjoint cycles. Cycles on \(k\) elements have EGF \(z^k/k\) summed: the EGF of cycles is \(\log\frac{1}{1-z}\). Hence permutations have EGF \(\exp\log\frac{1}{1-z} = \frac{1}{1-z}\), agreeing with \(n!/n! = 1\). Derangements (permutations with no fixed point) have cycles of length \(\ge 2\): EGF \(\exp\!\left(\log\frac{1}{1-z} - z\right) = \frac{e^{-z}}{1-z}\).
</div>

<div class="example">
<strong>Example 1.8 (Set partitions and Bell numbers).</strong> A set partition is a set of nonempty sets, so \(\mathcal{B} = \mathrm{SET}(\mathrm{SET}_{\ge 1}(\mathcal{Z}))\) with EGF \(\hat{B}(z) = \exp(e^z - 1)\). The Bell numbers \(B_n = n! [z^n] \exp(e^z - 1)\) thus satisfy Dobinski's formula \(B_n = \frac{1}{e}\sum_{k \ge 0} k^n/k!\).
</div>

### 1.4 Marking Parameters

If we wish to track an additional combinatorial parameter \(\chi\) (number of cycles, number of leaves, etc.), we introduce a marking variable \(u\) and consider the bivariate generating function \(A(z,u) = \sum_{\alpha} z^{|\alpha|} u^{\chi(\alpha)}\). The symbolic method extends naturally: a "marked atom" contributes \(zu\) instead of \(z\), and the constructions remain admissible. This bivariate framework is essential for limit-law theorems in Chapter 6.

<div class="remark">
<strong>Remark 1.9.</strong> The dictionary between combinatorial constructions and generating-function operations is so robust that, for many natural classes, an entire enumeration problem reduces to writing down a specification and then reading off the GF. Computer-algebra packages such as <em>combstruct</em> in Maple and the <em>Combinatorial Species</em> packages in Sage automate this translation.
</div>

## Chapter 2: Singularity Analysis

Knowing a generating function does not, by itself, tell us how its coefficients grow. The bridge between formal-series identities and asymptotic enumeration is **singularity analysis**: the coefficient asymptotics of \(A(z)\) are controlled by the location, type, and multiplicity of the singularities of \(A\) on the boundary of its disk of convergence.

### 2.1 Radius of Convergence and the First Principle

<div class="definition">
<strong>Definition 2.1 (Radius of convergence).</strong> For \(A(z) = \sum_{n \ge 0} a_n z^n\), the <em>radius of convergence</em> is

\[
\rho = \frac{1}{\limsup_n |a_n|^{1/n}} \in [0, \infty].
\]
</div>

The crude estimate \(a_n \asymp \rho^{-n}\) — more precisely, \(\rho^{-n}\) is the exponential growth rate \(\limsup a_n^{1/n}\) — is the **first principle of coefficient asymptotics**: exponential growth is dictated by the modulus of the nearest singularity to the origin. The **subexponential factor** (the polynomial or logarithmic correction \(a_n / \rho^{-n}\)) is governed by the nature of that singularity.

<div class="theorem">
<strong>Theorem 2.2 (Pringsheim's theorem).</strong> If \(A(z)\) has nonnegative real coefficients and finite radius of convergence \(\rho\), then \(z = \rho\) is a singularity of \(A\).
</div>

This theorem, fundamental for combinatorial GFs (whose coefficients are nonnegative integers), guarantees that the **dominant singularity** lives on the positive real axis — a substantial simplification.

### 2.2 Meromorphic Functions and Rational Asymptotics

The simplest case is a meromorphic GF whose dominant singularity is a pole. If \(A(z)\) is meromorphic in \(|z| < R\) with a single pole at \(z = \rho < R\) of order \(m\), then

\[
A(z) = \frac{c}{(1-z/\rho)^m} + (\text{lower-order singular terms}) + (\text{analytic part}),
\]

and the polar contribution dominates: \([z^n] (1-z/\rho)^{-m} = \binom{n+m-1}{m-1} \rho^{-n} \sim \frac{n^{m-1}}{(m-1)!} \rho^{-n}\).

<div class="theorem">
<strong>Theorem 2.3 (Rational coefficient asymptotics).</strong> If \(A(z) = P(z)/Q(z)\) is rational with \(\gcd(P,Q)=1\), and \(Q\) has roots \(\rho_1, \ldots, \rho_k\) of minimum modulus \(\rho\) and multiplicities \(m_1, \ldots, m_k\), then

\[
a_n = \sum_{j=1}^k C_j(n) \rho_j^{-n}
\]

where \(C_j(n)\) is a polynomial in \(n\) of degree \(m_j - 1\). When there is a unique dominant pole at \(z = \rho\) of order \(m\), \(a_n \sim \frac{c\, n^{m-1}}{(m-1)!\, \rho^{m}} \rho^{-n}\) for an explicit constant \(c\).
</div>

<div class="example">
<strong>Example 2.4 (Fibonacci numbers).</strong> The OGF \(F(z) = z/(1-z-z^2)\) has poles at the roots of \(1-z-z^2\), namely \(z_\pm = (-1 \pm \sqrt{5})/2\). The dominant pole is \(\rho = (\sqrt{5}-1)/2 = 1/\varphi\), giving \(F_n \sim \varphi^n/\sqrt{5}\) where \(\varphi = (1+\sqrt{5})/2\) is the golden ratio.
</div>

### 2.3 Standard Singular Expansions and the Transfer Theorem

For non-rational GFs — those with algebraic, logarithmic, or essential singularities — one needs a more powerful machinery. The **Flajolet–Odlyzko transfer theorem** asserts that a singular expansion of \(A(z)\) at its dominant singularity transfers to a coefficient asymptotic, provided \(A\) is analytic in a slightly larger region.

<div class="definition">
<strong>Definition 2.5 (Delta-domain).</strong> A <em>Delta-domain</em> at \(\rho\) is a domain of the form

\[
\Delta(\phi, \eta) = \{z : |z| < \rho + \eta, \ z \ne \rho, \ |\arg(z - \rho)| > \phi\}
\]

for some \(\phi \in (0, \pi/2)\) and \(\eta > 0\). A function is <em>Delta-analytic</em> at \(\rho\) if it is analytic in some such domain.
</div>

The Delta-domain is a disk of radius \(\rho+\eta\) with a small "Pacman bite" excised at the singularity \(\rho\); analyticity in this domain allows the Hankel-contour argument that drives the transfer theorem.

<div class="theorem">
<strong>Theorem 2.6 (Flajolet–Odlyzko transfer theorem).</strong> Let \(\rho > 0\) and let \(\alpha \in \mathbb{C} \setminus \{0, -1, -2, \ldots\}\). If \(A(z)\) is Delta-analytic at \(\rho\) and

\[
A(z) \sim \left(1 - \frac{z}{\rho}\right)^{-\alpha} \quad (z \to \rho \text{ in } \Delta),
\]

then

\[
[z^n] A(z) \sim \frac{n^{\alpha-1}}{\Gamma(\alpha)} \rho^{-n}.
\]

More generally, big-O and little-o error terms transfer term-by-term: if \(A(z) = \sum_j c_j (1-z/\rho)^{-\alpha_j} + O((1-z/\rho)^{-\beta})\) with \(\beta < \min \alpha_j\), then \([z^n]A = \sum_j c_j \frac{n^{\alpha_j - 1}}{\Gamma(\alpha_j)} \rho^{-n} + O(n^{\beta-1} \rho^{-n})\).
</div>

<div class="proof">
<strong>Proof sketch.</strong> By Cauchy's formula \([z^n]A(z) = \frac{1}{2\pi i} \oint A(z) z^{-n-1} dz\). Deform the contour from \(|z| = \rho - \epsilon\) to a Hankel-style contour hugging \(\rho\): a small circle around \(\rho\) of radius \(1/n\) joined to two rays going outward. The Hankel-contour integral of \((1-z/\rho)^{-\alpha} z^{-n-1}\) reduces, after the change of variable \(z = \rho(1 + t/n)\), to the classical Hankel integral representation of \(1/\Gamma(\alpha)\). The remaining contour pieces are exponentially smaller because \(A\) is bounded on them.
</div>

The basic singular scale \(\{(1-z/\rho)^{-\alpha} : \alpha \in \mathbb{R}\}\) together with its logarithmic enhancements covers virtually all combinatorial GFs: square roots (\(\alpha = -1/2\)) for trees, logarithms for harmonic-type counts, integer-power poles for rational GFs.

### 2.4 The Square-Root Singularity and Tree-Like Structures

<div class="example">
<strong>Example 2.7 (Catalan-type asymptotics).</strong> The OGF \(T(z) = (1 - \sqrt{1-4z})/2\) has singular expansion near \(z = 1/4\):

\[
T(z) = \tfrac{1}{2} - \tfrac{1}{2}(1-4z)^{1/2}.
\]

By the transfer theorem with \(\alpha = -1/2\) and \(\rho = 1/4\),

\[
[z^n] T(z) \sim \frac{4^n}{2\sqrt{\pi n^3}},
\]

recovering the classical Catalan asymptotic \(C_n \sim 4^n / \sqrt{\pi n^3}\).
</div>

This square-root singularity is universal: any "simple variety of trees" (\(\mathcal{T} = \mathcal{Z} \times \phi(\mathcal{T})\) for some "shape generator" \(\phi\)) has a generating function with a square-root singularity, leading to \(n^{-3/2}\) asymptotics. This is the **\(n^{-3/2}\) phenomenon** observed throughout tree enumeration.

### 2.5 Darboux's Method

A precursor of singularity analysis is **Darboux's method**, which derives coefficient asymptotics from the smoothness of the GF on its disk of convergence. Roughly, if \(A(z) = \sum c_j (1-z/\rho)^{\beta_j} + R(z)\) where \(R\) is sufficiently smooth on \(|z| = \rho\), then \([z^n] R = o(\rho^{-n} n^{-K})\) for any \(K\), and the singular terms dictate the asymptotics. Darboux's method requires the singular part to have only finitely many singularities on the boundary circle, and it is generally subsumed by the Flajolet–Odlyzko transfer theorem when the latter applies. Darboux remains useful for problems with multiple singularities of equal modulus.

### 2.6 Multiple Singularities and Periodic Behavior

When \(A(z)\) has several singularities of the same minimal modulus, their contributions superimpose. If \(A(z)\) has dominant singularities \(\rho \omega_1, \ldots, \rho \omega_k\) (with \(|\omega_j| = 1\)) of the same nature, then

\[
a_n \sim \rho^{-n} n^{\alpha-1} \cdot \frac{1}{\Gamma(\alpha)} \sum_{j=1}^k c_j \omega_j^{-n},
\]

producing periodic or quasi-periodic behavior in \(a_n\). A canonical example: \([z^n] 1/(1-z^2) = 1\) if \(n\) even, \(0\) if \(n\) odd — the alternation arising from the two poles \(z = \pm 1\).

## Chapter 3: Saddle-Point Methods

When a generating function has no finite singularities — that is, when it is **entire** — singularity analysis cannot directly apply. The classical example is the EGF \(\exp(z) = \sum z^n/n!\). For such GFs, the relevant tool is the **saddle-point method**, a complex-analytic version of Laplace's method that locates the steepest-descent contour for the Cauchy integral.

### 3.1 The Saddle-Point Heuristic

By Cauchy's formula \(a_n = \frac{1}{2\pi i} \oint A(z) z^{-n-1} dz\). On a circle \(|z| = r\), the integrand has modulus \(|A(re^{i\theta})| r^{-n-1}\). For an entire function of moderate growth, this modulus is largest at \(\theta = 0\) (when \(A\) has positive Taylor coefficients) and behaves like \(\exp(h(r) - n \log r)\) for some real function \(h\). Optimising in \(r\) leads to the **saddle-point equation**

\[
r \frac{A'(r)}{A(r)} = n,
\]

determining a saddle radius \(r = r_n\). The Cauchy integral on the circle of radius \(r_n\) is then evaluated by quadratic Taylor expansion of the log-integrand.

<div class="theorem">
<strong>Theorem 3.1 (Hayman's theorem, simplified).</strong> Let \(A(z) = \sum a_n z^n\) be entire with positive coefficients and "Hayman-admissible" (a technical concentration property). If \(r_n\) solves \(r A'(r)/A(r) = n\) and \(b(r) = r \frac{d}{dr}\!\left[r \frac{A'(r)}{A(r)}\right]\), then

\[
a_n \sim \frac{A(r_n)}{r_n^n \sqrt{2\pi b(r_n)}}.
\]
</div>

<div class="proof">
<strong>Proof sketch.</strong> Write \(a_n = \frac{1}{2\pi} \int_{-\pi}^{\pi} A(r_n e^{i\theta}) r_n^{-n} e^{-in\theta} d\theta\). Expand \(\log A(r_n e^{i\theta}) - in\theta\) about \(\theta = 0\); the linear term vanishes by the saddle-point equation, and the quadratic term is \(-b(r_n) \theta^2/2\). Hayman admissibility ensures the integral concentrates in a window of width \(\sim 1/\sqrt{b(r_n)}\) around \(\theta=0\), so the integral is approximated by a Gaussian, giving the stated formula.
</div>

### 3.2 Stirling's Formula via Saddle Point

<div class="example">
<strong>Example 3.2 (Stirling's formula).</strong> Take \(A(z) = e^z\), so \(a_n = 1/n!\). The saddle equation \(r = n\) gives \(r_n = n\); \(b(r) = r\); the formula yields

\[
\frac{1}{n!} \sim \frac{e^n}{n^n \sqrt{2\pi n}},
\]

equivalently \(n! \sim n^n e^{-n} \sqrt{2\pi n}\) — Stirling's formula.
</div>

### 3.3 Applications to Bell Numbers and Involutions

<div class="example">
<strong>Example 3.3 (Bell numbers).</strong> Recall \(\hat{B}(z) = \exp(e^z - 1)\), entire. The saddle equation is \(r e^r = n\), so \(r_n = W(n)\) (Lambert W-function). After computing \(b(r) = r(1+r) e^r\), Hayman's theorem yields

\[
B_n \sim \frac{n!\, e^{e^{r_n} - 1}}{r_n^n \sqrt{2\pi n(1+r_n)}}, \qquad r_n e^{r_n} = n.
\]

Equivalently \(B_n \sim n^{-1/2} (\lambda(n))^{n+1/2} e^{\lambda(n)-n-1}\) where \(\lambda(n) = n/W(n)\) — the famous Moser–Wyman asymptotic.
</div>

<div class="example">
<strong>Example 3.4 (Involutions).</strong> The number of involutions of \([n]\) (permutations with \(\sigma^2 = \mathrm{id}\)) has EGF \(\exp(z + z^2/2)\). The saddle equation \(r + r^2 = n\) gives \(r_n \sim \sqrt{n} - 1/2\), and Hayman's theorem yields \(I_n \sim n^{n/2} e^{-n/2 + \sqrt{n} - 1/4} / \sqrt{2}\).
</div>

### 3.4 Large Powers and the Quasi-Powers Theorem

A bivariate version of the saddle-point method applies to large powers \(\phi(z)^n\), enabling local limit theorems. Specifically, if \(F(z, u) = \sum_{n,k} f_{n,k} z^n u^k\) and locally \(F(z,u) \approx (\text{analytic})\cdot \phi(u)^n\), then the distribution of \(k\) given \(n\) (suitably normalised) is asymptotically Gaussian — the **Quasi-Powers theorem** of Bender and Hwang. This is the principal tool for proving central limit theorems in combinatorics.

## Chapter 4: Multivariate Analytic Combinatorics

Multivariate generating functions arise naturally when we mark several parameters simultaneously, count lattice paths constrained to wedges, or enumerate combinatorial structures decomposed into independent coordinates. The asymptotics of the **diagonal coefficients** \([z_1^{n_1} \cdots z_d^{n_d}] F(z_1, \ldots, z_d)\) along a ray \(n_j = \alpha_j n\) require the framework of **Analytic Combinatorics in Several Variables** (ACSV), developed by Pemantle, Wilson, Baryshnikov, and Melczer.

### 4.1 Multivariate Cauchy Integral and Critical Points

For an analytic function \(F(\mathbf{z}) = \sum_{\mathbf{n}} a_{\mathbf{n}} \mathbf{z}^{\mathbf{n}}\) on a polydisk, the multivariate Cauchy formula reads

\[
a_{\mathbf{n}} = \frac{1}{(2\pi i)^d} \oint_{T} \frac{F(\mathbf{z})}{\mathbf{z}^{\mathbf{n}+\mathbf{1}}} \, dz_1 \cdots dz_d,
\]

over a torus \(T = \{|z_j| = r_j\}\). The asymptotic analysis depends on the **singular variety** \(\mathcal{V} = \{\mathbf{z} : H(\mathbf{z}) = 0\}\) where \(F = G/H\) is meromorphic. Asymptotics along \(\mathbf{n} = n \mathbf{r} + O(1)\) are governed by the **critical points** of \(\mathcal{V}\) in direction \(\mathbf{r}\).

<div class="definition">
<strong>Definition 4.1 (Smooth point and critical point).</strong> Let \(\mathcal{V} = \{H = 0\}\) be the singular variety of \(F = G/H\). A point \(\mathbf{z}^* \in \mathcal{V}\) is <em>smooth</em> if \(\nabla H(\mathbf{z}^*) \ne 0\); otherwise it is <em>singular</em>. A smooth point \(\mathbf{z}^*\) is <em>critical</em> in direction \(\mathbf{r} = (r_1, \ldots, r_d)\) if there exists \(\lambda \ne 0\) such that

\[
r_j \cdot z_j^* \frac{\partial H}{\partial z_j}(\mathbf{z}^*) = \lambda \, r_d \cdot z_d^* \frac{\partial H}{\partial z_d}(\mathbf{z}^*), \quad j = 1, \ldots, d-1,
\]

equivalently, the logarithmic gradient \((z_j \partial_j H)\) is proportional to \(\mathbf{r}\) at \(\mathbf{z}^*\).
</div>

The critical-point equations are the multivariate analogue of the saddle-point equation; they single out points on \(\mathcal{V}\) whose normal direction is "aimed" at the direction \(\mathbf{r}\) of asymptotic interest.

### 4.2 Smooth-Point Asymptotics

<div class="theorem">
<strong>Theorem 4.2 (Pemantle–Wilson smooth-point formula).</strong> Suppose \(F = G/H\) has a unique <em>minimal</em> critical point \(\mathbf{z}^*\) in the direction \(\mathbf{r}\), \(\mathbf{z}^*\) is smooth, the determinant of a certain Hessian \(\mathcal{H}(\mathbf{z}^*) \ne 0\), and several technical "combinatorial" conditions hold. Then as \(n \to \infty\) with \(\mathbf{n}/n \to \mathbf{r}\),

\[
a_{\mathbf{n}} \sim \frac{G(\mathbf{z}^*)}{(z_d^* \partial_d H)(\mathbf{z}^*)} \cdot \frac{(\mathbf{z}^*)^{-\mathbf{n}}}{(2\pi n)^{(d-1)/2} \sqrt{\det \mathcal{H}(\mathbf{z}^*)}}.
\]
</div>

The term \((\mathbf{z}^*)^{-\mathbf{n}}\) carries the exponential growth — analogous to \(\rho^{-n}\) in one variable — while the \(n^{-(d-1)/2}\) factor reflects the codimension-1 saddle in \(d\)-dimensional integration. Minimality means \(\mathbf{z}^*\) lies on the boundary of the open polydisk of convergence; combinatorial conditions (positive coefficients, etc.) often guarantee this.

<div class="example">
<strong>Example 4.3 (Central binomial coefficient).</strong> The diagonal of \(F(x,y) = 1/(1-x-y)\) is \(\binom{2n}{n}\). Solving the critical-point equation \(x = y\) on \(1 - x - y = 0\) gives \(x^* = y^* = 1/2\). The smooth-point formula yields

\[
\binom{2n}{n} = [x^n y^n]\frac{1}{1-x-y} \sim \frac{4^n}{\sqrt{\pi n}},
\]

agreeing with the classical Stirling-based asymptotic.
</div>

### 4.3 Multiple Points and Cone Points

When \(\mathcal{V}\) is singular at the critical point — say two sheets cross transversely at \(\mathbf{z}^*\) — the asymptotics change form. **Multiple points** (transverse intersections of smooth strata of \(\mathcal{V}\)) lead to a different leading order, often without the \(n^{-(d-1)/2}\) factor. **Cone points** (where \(H\) vanishes to higher order) lead to integrals over Airy-type kernels and \(n^{-1/3}\) scaling. ACSV provides a complete classification: the local geometry of \(\mathcal{V}\) at the critical point determines the precise asymptotic regime.

<div class="theorem">
<strong>Theorem 4.4 (Multiple-point asymptotic, simplified).</strong> If \(\mathbf{z}^*\) is a transverse multiple point where \(k\) smooth sheets of \(\mathcal{V}\) intersect, and the direction \(\mathbf{r}\) lies in the relative interior of the cone of normal directions, then \(a_{\mathbf{n}} \sim C(\mathbf{z}^*)^{-\mathbf{n}} n^{-(d-k)/2}\) for an explicit constant \(C\).
</div>

<div class="example">
<strong>Example 4.5 (Delannoy numbers).</strong> The Delannoy numbers \(D(m,n)\), counting lattice paths from \((0,0)\) to \((m,n)\) using steps \((1,0), (0,1), (1,1)\), have GF \(F(x,y) = 1/(1-x-y-xy)\). On the central diagonal \(m=n\), the critical point is \((x^*,y^*) = (\sqrt{2}-1, \sqrt{2}-1)\), giving the smooth-point asymptotic \(D(n,n) \sim (3+2\sqrt{2})^n / \sqrt{\pi n \sqrt{8}}\).
</div>

### 4.4 The Morse-Theoretic Picture

The geometric heart of ACSV is a Morse-theoretic deformation argument. The torus of integration in the multivariate Cauchy integral is deformed across the singular variety \(\mathcal{V}\); each time it crosses a critical point, a "residue" contribution is picked up, mirroring the way classical residue calculus picks up poles in the one-variable case. The resulting decomposition expresses \(a_{\mathbf{n}}\) as a sum of integrals over residue forms localized at critical points, each of which is then estimated by a stationary-phase or saddle-point argument. This picture, due to Baryshnikov and Pemantle, places ACSV firmly within stratified Morse theory.

## Chapter 5: Algorithmic Aspects and the Kernel Method

A defining feature of CO 739 is its emphasis on **effective** and **algorithmic** methods. Generating functions are not merely existence-proofs of asymptotics; they are computable objects, and powerful algorithms exist to manipulate them, derive their differential or recurrence relations, and extract their coefficient asymptotics rigorously.

### 5.1 D-finite and D-algebraic Functions

<div class="definition">
<strong>Definition 5.1 (D-finite function).</strong> A formal power series \(f(z) \in \mathbb{Q}[[z]]\) is <em>D-finite</em> (or holonomic) if it satisfies a linear ODE with polynomial coefficients:

\[
p_r(z) f^{(r)}(z) + p_{r-1}(z) f^{(r-1)}(z) + \cdots + p_0(z) f(z) = 0,
\]

with \(p_j(z) \in \mathbb{Q}[z]\), \(p_r \ne 0\). Equivalently, the \(\mathbb{Q}(z)\)-vector space spanned by \(\{f, f', f'', \ldots\}\) is finite-dimensional.
</div>

<div class="theorem">
<strong>Theorem 5.2 (Closure properties).</strong> The class of D-finite functions over \(\mathbb{Q}(z)\) is closed under addition, multiplication, integration, differentiation, and Hadamard product with rational functions. Algebraic functions are D-finite. The diagonal of a multivariate rational function is D-finite (Lipshitz; Christol's theorem in characteristic 0).
</div>

D-finiteness is the algorithmic analogue of analyticity: a D-finite series is encoded by a finite ODE plus initial conditions, and all the standard manipulations have effective algorithms (implemented in Maple's <em>gfun</em> and Mathematica).

<div class="definition">
<strong>Definition 5.3 (P-recursive sequence).</strong> A sequence \((a_n)\) is <em>P-recursive</em> (or polynomially recursive) if it satisfies a linear recurrence with polynomial-in-\(n\) coefficients:

\[
q_s(n) a_{n+s} + q_{s-1}(n) a_{n+s-1} + \cdots + q_0(n) a_n = 0.
\]
</div>

<div class="theorem">
<strong>Theorem 5.4 (D-finite if and only if P-recursive).</strong> A power series \(f(z) = \sum a_n z^n\) is D-finite if and only if its coefficient sequence \((a_n)\) is P-recursive.
</div>

The translation \(f \leftrightarrow (a_n)\) is bidirectional and constructive: from an ODE for \(f\), one extracts a recurrence for \(a_n\) by matching coefficients, and conversely.

### 5.2 The Kernel Method

The **kernel method** is an algebraic technique for solving functional equations of the form

\[
K(z, u) F(z, u) = G(z, u) + R(z) H(z, u)
\]

where \(F(z,u)\) is the unknown bivariate GF, \(K\) is the **kernel**, and \(R(z)\) encodes a "boundary" generating function. It was pioneered for lattice path enumeration: paths in a half-plane or quadrant can be encoded by step-by-step generating functions whose recursions satisfy precisely this form.

<div class="example">
<strong>Example 5.5 (Dyck paths).</strong> Let \(D(z, u)\) be the GF for lattice paths in the upper half-plane starting at the origin, with steps \(\pm 1\), where \(z\) marks length and \(u\) marks final altitude. A first-step decomposition gives a functional equation that, after multiplying by \(u\) and rearranging, reads

\[
(u - z u^2 - z) D(z,u) = u - z D(z, 0).
\]

The kernel is \(K(z,u) = u - zu^2 - z\). The trick: substitute the root \(u_0(z) = (1 - \sqrt{1-4z^2})/(2z)\) of the kernel \(K(z, u_0) = 0\) into the equation; the left-hand side vanishes, leaving

\[
D(z, 0) = u_0(z)/z = \frac{1 - \sqrt{1-4z^2}}{2z^2},
\]

whose coefficients (at even \(n\)) are the Catalan numbers — the classical count of Dyck paths.
</div>

<div class="theorem">
<strong>Theorem 5.6 (Kernel method, general form).</strong> If \(K(z, u) F(z, u) = G(z, u) + R(z) H(z,u)\) holds in \(\mathbb{Q}[[z]][u]\), and \(u_0(z) \in \mathbb{Q}[[z]]\) is a power series root of \(K(z, u)\) such that \(F(z, u_0(z))\) is well-defined as a formal substitution, then

\[
0 = G(z, u_0(z)) + R(z) H(z, u_0(z)),
\]

determining \(R(z)\) (typically the unknown GF tracking a marginal statistic).
</div>

### 5.3 Quadrant Walks and the Obstinate Kernel Method

For walks in the quarter plane with a step set \(\mathcal{S} \subset \{-1,0,1\}^2 \setminus \{(0,0)\}\), the GF \(Q(z; x, y) = \sum_w z^{|w|} x^{i(w)} y^{j(w)}\) (over walks \(w\) with endpoint \((i(w), j(w))\)) satisfies

\[
K(z;x,y) Q(z;x,y) = xy - zF_1(x) - zF_2(y),
\]

where the kernel \(K(z;x,y) = xy - z\, xy \,\sum_{(i,j) \in \mathcal{S}} x^i y^j\) and \(F_1, F_2\) encode the \(y=0\) and \(x=0\) boundaries. Mishna and Bousquet-Mélou classified the 79 inherently distinct nontrivial small-step models. The **group of the walk** — generated by birational involutions that exchange \((x,y) \leftrightarrow (\bar{x}, y)\) and \((x,y) \leftrightarrow (x, \bar{y})\) on the kernel curve — controls solvability.

<div class="theorem">
<strong>Theorem 5.7 (Bousquet-Mélou–Mishna classification).</strong> Of the 79 small-step quadrant-walk models, 23 have a finite group of the walk; 22 of these have D-finite GF \(Q(z;1,1)\) (computable via orbit summation), and one (Kreweras, exceptional) is also algebraic. The remaining 56 have infinite group; of these, all but a few were proven by Bostan, Raschel, Salvy, and collaborators to be non-D-finite.
</div>

This dichotomy — D-finite if and only if finite group, modulo a small list of exceptions — is one of the most striking results in modern enumerative combinatorics, demonstrating how the algorithmic notion of D-finiteness aligns with intrinsic combinatorial-geometric structure.

### 5.4 Creative Telescoping

To evaluate or simplify sums involving binomial-coefficient or hypergeometric-like terms, the **Wilf–Zeilberger (WZ) method** of creative telescoping is a fully algorithmic engine.

<div class="theorem">
<strong>Theorem 5.8 (Zeilberger's algorithm).</strong> Let \(F(n,k)\) be a proper hypergeometric term (i.e., \(F(n+1,k)/F(n,k)\) and \(F(n,k+1)/F(n,k)\) are rational in \(n,k\)). Then there exist polynomials \(a_0(n), \ldots, a_J(n)\) and a hypergeometric term \(G(n,k)\) such that

\[
\sum_{j=0}^J a_j(n) F(n+j, k) = G(n, k+1) - G(n, k).
\]

Summing over \(k\) (telescoping the right-hand side) yields a P-recurrence for \(S(n) = \sum_k F(n,k)\).
</div>

The algorithm exhibits the polynomials \(a_j\) and the certificate \(G\) explicitly; the certificate provides a checkable proof of the resulting recurrence.

<div class="example">
<strong>Example 5.9 (Identity proof by WZ).</strong> To prove \(\sum_k \binom{n}{k}^2 = \binom{2n}{n}\), apply Zeilberger's algorithm to \(F(n,k) = \binom{n}{k}^2 / \binom{2n}{n}\). The output \((n+1) F(n+1,k) - 2(2n+1) F(n,k) = G(n,k+1) - G(n,k)\) gives, after summation, \((n+1) S(n+1) - 2(2n+1) S(n) = 0\); together with \(S(0) = 1\) this characterises \(S(n) = 1\) — the identity.
</div>

### 5.5 Effective Asymptotics and the Sage ACSV Package

Combining D-finiteness with singularity analysis allows fully effective coefficient-asymptotic algorithms. Given a D-finite GF \(f(z)\) by ODE and initial conditions, one computes (a) the singular points of the ODE (zeros of leading coefficient), (b) the local exponents at each singularity (indicial equation), and (c) the connection coefficients matching local solutions to the global one. This "rigorous numerical analytic continuation" (van der Hoeven, Mezzarobba) yields provably correct asymptotics with explicit error bounds. Melczer's <em>sage_acsv</em> package implements the multivariate analogue: for a rational \(F = G/H\), it computes critical points, verifies minimality, and outputs the leading-order asymptotic with provable correctness in many cases.

## Chapter 6: Limit Laws and Random Combinatorial Structures

Beyond first-order asymptotics of counting sequences, analytic combinatorics provides a fine-grained probabilistic description: it computes the limit distributions of natural parameters of a uniformly random combinatorial structure of size \(n\).

### 6.1 Bivariate Generating Functions and Marked Parameters

If \(F(z, u) = \sum_{n,k} f_{n,k} z^n u^k\) marks a parameter \(\chi\) on a class \(\mathcal{F}\), then the probability that \(\chi(\alpha) = k\) for \(\alpha\) uniform in \(\mathcal{F}_n\) is \(p_{n,k} = f_{n,k}/f_n\) where \(f_n = [z^n] F(z, 1)\). The probability generating function of \(\chi\) on \(\mathcal{F}_n\) is

\[
P_n(u) = \frac{[z^n] F(z, u)}{[z^n] F(z, 1)}.
\]

### 6.2 The Quasi-Powers Theorem

<div class="theorem">
<strong>Theorem 6.1 (Hwang's Quasi-Powers theorem).</strong> Suppose \(P_n(u) = A(u) B(u)^{\beta_n} (1 + O(1/\kappa_n))\) uniformly in a complex neighborhood of \(u = 1\), with \(A, B\) analytic and \(A(1) = B(1) = 1\), \(\beta_n \to \infty\), \(\kappa_n \to \infty\). Let \(\mu_n = \mathbb{E}[\chi]\) and \(\sigma_n^2 = \mathrm{Var}(\chi)\). Then \(\mu_n = \beta_n B'(1) + O(1)\), \(\sigma_n^2 = \beta_n (B''(1) + B'(1) - B'(1)^2) + O(1)\), and

\[
\frac{\chi - \mu_n}{\sigma_n} \xrightarrow{d} \mathcal{N}(0, 1)
\]

with rate of convergence \(O(\sigma_n^{-1} + \kappa_n^{-1})\).
</div>

The quasi-powers theorem is the workhorse for proving Gaussian limit laws in combinatorics: any bivariate GF whose dominant singularity moves analytically with the marking parameter \(u\) and whose dominant local behavior takes the quasi-powers form yields a Gaussian-distributed parameter.

<div class="example">
<strong>Example 6.2 (Number of cycles in a random permutation).</strong> The bivariate EGF of permutations marked by number of cycles is \(F(z, u) = (1-z)^{-u}\). Using the singular expansion (singularity at \(z=1\) moves with \(u\)) and the transfer theorem, one obtains \(\mu_n = H_n \sim \log n\), \(\sigma_n^2 \sim \log n\), and the number of cycles is asymptotically Gaussian with mean and variance both \(\sim \log n\) — the Goncharov–Erdős–Turán theorem.
</div>

### 6.3 Patterns and Profile of Trees

The size of various subtree statistics of random Catalan trees — number of leaves, number of nodes of out-degree \(k\), height profile — can be analyzed by bivariate GFs and the smooth-point theorem. The number of leaves in a random plane tree of size \(n\) is asymptotically Gaussian with mean \(\sim n/2\) and variance \(\sim n/8\). The height of such a tree, however, exhibits non-Gaussian behavior: it concentrates around \(\sqrt{\pi n}\) with Theta-distribution fluctuations, a phenomenon discovered by de Bruijn, Knuth, and Rice.

### 6.4 Lattice Paths and the Cycle Lemma

<div class="theorem">
<strong>Theorem 6.3 (Cycle lemma, Dvoretzky–Motzkin).</strong> Among the \(n\) cyclic shifts of any sequence \(\mathbf{s} = (s_1, \ldots, s_n)\) of integers summing to \(1\), exactly one yields a sequence whose all partial sums are positive. Consequently, the number of paths from \((0,0)\) to \((n, k)\) (\(k \ge 1\)) using steps \(\pm 1\) and staying strictly positive equals \(\frac{k}{n} \binom{n}{(n-k)/2}\) (when parities agree).
</div>

The cycle lemma converts cyclic-symmetry counting into linear counting and is a recurring tool in lattice-path enumeration, often complementing the kernel method for problems amenable to bijective treatment.

## Chapter 7: Asymptotics of Combinatorial Sequences and Applications

This final chapter assembles the theory of the previous chapters into a unified workflow for asymptotic enumeration and surveys characteristic applications.

### 7.1 The Analytic Combinatorics Workflow

The asymptotic enumeration of a combinatorial class \(\mathcal{A}\) proceeds in five stages. First, one specifies \(\mathcal{A}\) as a combinatorial construction over atoms. Second, one applies the symbolic method to obtain a closed-form or implicit equation for \(A(z)\). Third, one performs an analytic study to locate the dominant singularity \(\rho\) and determine the type of singular behavior. Fourth, one transfers — applying singularity analysis (or the saddle-point method, in the entire-function case) to extract \([z^n] A(z)\). Finally, one refines: lower-order corrections, error terms, and bivariate (limit-law) information are computed as needed.

This pipeline is intentionally modular: each stage admits independent algorithmic improvement, and the framework gracefully accommodates parametric families, multivariate marking, and asymptotic uniformity.

### 7.2 Smirnov Words and Pattern Avoidance

<div class="example">
<strong>Example 7.1 (Smirnov words).</strong> A <em>Smirnov word</em> over alphabet \(\Sigma\) of size \(\sigma\) is a word in which no two adjacent letters are equal. The OGF (counting by length) is

\[
S(z) = \frac{1+z}{1 - (\sigma-1) z}.
\]

The dominant pole at \(z = 1/(\sigma-1)\) gives \(s_n \sim \sigma (\sigma-1)^{n-1}\). More refined: the bivariate GF \(S(z, u)\) marking the number of distinct letters used yields a Gaussian limit by quasi-powers.
</div>

<div class="example">
<strong>Example 7.2 (Permutations avoiding a pattern of length 3).</strong> The number of permutations of \([n]\) avoiding any one of the six length-3 patterns equals the Catalan number \(C_n\) (Knuth, MacMahon, Simion–Schmidt). The OGF is the same Catalan GF, with the universal \(n^{-3/2}\) singularity at \(z = 1/4\), giving asymptotic count \(\sim 4^n / \sqrt{\pi n^3}\).
</div>

### 7.3 Random Maps and the Brownian Map

The enumeration of planar maps — connected planar graphs embedded in the sphere — was solved by Tutte (1962) using the kernel-style "quadratic method." The number of rooted planar maps with \(n\) edges is

\[
M_n = \frac{2 \cdot 3^n (2n)!}{n!\, (n+2)!} \sim \frac{2}{\sqrt{\pi}} \cdot \frac{12^n}{n^{5/2}},
\]

exhibiting the universal map-asymptotic with \(n^{-5/2}\). The Schaeffer bijection and Le Gall's continuum scaling limit theorem identify the geometric profile of large random maps with the Brownian map, a random metric space.

### 7.4 Random Graphs at the Phase Transition

The random graph \(G(n, M)\) with \(M = (1+\mu n^{-1/3})n/2\) edges undergoes a phase transition near \(\mu = 0\) — the **double-jump** of Erdős and Rényi. Flajolet, Knuth, and Pittel used singularity analysis of multivariate GFs (with marking on the number of components and on excess) to derive precise asymptotic distributions of component sizes, the size of the giant component, and the number of "complex" components. The methods of multivariate analytic combinatorics fit naturally into this framework.

### 7.5 Closing Perspective

The unifying message of analytic combinatorics is that combinatorial structure, once captured in a generating function, surrenders its asymptotic and probabilistic secrets to the tools of complex analysis. The theory thus binds three threads — combinatorial specification, algebraic manipulation of formal series, and complex-analytic asymptotic estimation — into a single, broadly applicable methodology. With the recent extension to several variables (ACSV) and effective algorithmic refinements (D-finite algorithms, kernel-method classifications, certified asymptotics), analytic combinatorics has matured into both a rich theoretical framework and a practical computational discipline. For the working combinatorialist, it provides a near-universal recipe: specify the structure, encode it as a generating function, locate the singularities, and read off the asymptotic behavior — a recipe that has illuminated tree enumeration, lattice-path counting, random map theory, additive number theory, and far beyond.

<div class="remark">
<strong>Remark 7.3 (Further reading).</strong> The reader who wishes to pursue these themes is directed to the canonical reference Flajolet–Sedgewick, <em>Analytic Combinatorics</em>, freely available online; to Melczer's <em>An Invitation to Analytic Combinatorics in Several Variables</em> for the modern multivariate theory; to Pemantle–Wilson's monograph for deeper geometric and analytic background; to Wilf's <em>Generatingfunctionology</em> for the unified generating-function viewpoint at an introductory level; and to Petkovsek–Wilf–Zeilberger's <em>A=B</em> for algorithmic identity-proving and creative telescoping. Each of these sources is freely available in some form on the authors' or institutions' websites.
</div>
