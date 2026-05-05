---
made_up: true
title: "PMATH 940: Topics in Number Theory"
subjects: PMATH
---

*These notes consolidate the rotating PMATH 940 topics course at the University of Waterloo across recent offerings for which no standalone note exists: Wang's Winter 2019 course on elliptic curves; C. L. Stewart's three offerings on Diophantine equations and geometric number theory (F19, F20, F22); Rubinstein's Winter 2020 analytic number theory course; Liu's Winter 2023 course on analytic Diophantine geometry; the Fall 2021 Stewart offering on modular forms; and the Winter 2026 course on Fermat's Last Theorem. Each chapter is designed as a self-contained motivational tour of its subject — a first-lecture introduction for a student deciding whether to commit.*

## Sources and References

- Silverman, J. H. *The Arithmetic of Elliptic Curves*, 2nd ed. (Springer GTM 106)
- Silverman, J. H. *Advanced Topics in the Arithmetic of Elliptic Curves* (Springer GTM 151)
- Hindry, M. & Silverman, J. H. *Diophantine Geometry: An Introduction* (Springer GTM 201)
- Lang, S. *Fundamentals of Diophantine Geometry* (Springer)
- Montgomery, H. L. & Vaughan, R. C. *Multiplicative Number Theory I* (Cambridge)
- Iwaniec, H. & Kowalski, E. *Analytic Number Theory* (AMS Colloquium 53)
- Baker, A. & Wüstholz, G. *Logarithmic Forms and Diophantine Geometry* (Cambridge)
- Waldschmidt, M. *Diophantine Approximation on Linear Algebraic Groups* (Springer Grundlehren)
- Cornell, G., Silverman, J. H. & Stevens, G. (eds.) *Modular Forms and Fermat's Last Theorem* (Springer)
- Diamond, F. & Shurman, J. *A First Course in Modular Forms* (Springer GTM 228)
- Milne, J. S. *Elliptic Curves* and *Modular Functions and Modular Forms* (open course notes, jmilne.org)
- Bombieri, E. & Gubler, W. *Heights in Diophantine Geometry* (Cambridge, 2006)

---

# Chapter 1: Elliptic Curves and Their Properties

Taught at UW as PMATH 940 in Winter 2019 by Wang.

An elliptic curve is the simplest algebraic variety on which a group of rational points can be infinite — and the most arithmetically rich. The equation \(y^2 = x^3 + Ax + B\) hides the Birch–Swinnerton-Dyer conjecture, the proof of Fermat's Last Theorem, modern cryptographic primitives like CSIDH and Curve25519, and a large portion of the Langlands program. Wang's course introduced each of these threads in sequence, starting from the chord-and-tangent group law and ending at a survey of the BSD rank-\(0\) and rank-\(1\) theorems.

<div class="definition">
<strong>Definition 1.1 (Elliptic curve).</strong> Let \(k\) be a field of characteristic \(\ne 2, 3\). An <em>elliptic curve</em> over \(k\) is a smooth projective curve of genus \(1\) with a distinguished \(k\)-rational point \(O\). Such a curve admits a short Weierstrass equation
\[ E \colon y^2 = x^3 + Ax + B, \qquad \Delta = -16(4A^3 + 27B^2) \ne 0, \]
with \(O\) the unique point at infinity. The <em>j-invariant</em> \(j(E) = 1728 \cdot 4A^3 / (4A^3 + 27B^2)\) classifies \(E\) up to isomorphism over \(\bar k\).
</div>

The **group law** is the geometric miracle that makes elliptic curves arithmetic objects: three collinear points on \(E\) sum to \(O\). Over \(\mathbb{Q}\) or any number field this yields a genuine abelian group whose structure is the central object of study. Over a finite field \(\mathbb{F}_q\) the group is finite, with order controlled by the Hasse bound \(|E(\mathbb{F}_q)| = q + 1 - a_q\), \(|a_q| \le 2\sqrt q\) — a case of the Weil conjectures proved by Hasse in 1933.

<div class="theorem">
<strong>Theorem 1.2 (Mordell–Weil, 1928).</strong> For \(E\) an elliptic curve over a number field \(K\), the group \(E(K)\) is finitely generated:
\[ E(K) \cong \mathbb{Z}^r \oplus T, \]
with \(r = \operatorname{rank} E(K) \ge 0\) and \(T\) a finite torsion subgroup. Mazur's theorem (1977) enumerates the fifteen possible \(T\) when \(K = \mathbb{Q}\); Merel's theorem (1996) bounds \(|T|\) uniformly in \([K : \mathbb{Q}]\).
</div>

<div class="example">
<strong>Example 1.3 (Torsion pins down shape).</strong> The curve \(E \colon y^2 + y = x^3 - x\) (known as 37a1) has \(E(\mathbb{Q}) \cong \mathbb{Z}\) of rank \(1\) with generator \(P = (0, 0)\) and no torsion. Iteratively doubling \(P\) under the group law produces points \(2P = (1, -1)\), \(4P = (2, -3)\), \(8P = (21/25, -69/125)\), whose heights grow exponentially and whose denominators grow with the square of the logarithm of the height — an explicit quadratic structure that is the Néron–Tate canonical height in action.
</div>

**Torsion and Galois representations.** For \(\ell\) prime to \(\operatorname{char}(k)\), the \(\ell^n\)-torsion \(E[\ell^n] \cong (\mathbb{Z}/\ell^n)^2\) carries a continuous action of \(\operatorname{Gal}(\bar k / k)\), producing a \(2\)-dimensional Galois representation \(\rho_{E,\ell} \colon \operatorname{Gal}(\bar K / K) \to \mathrm{GL}_2(\mathbb{Z}_\ell)\) on the Tate module \(T_\ell E = \varprojlim E[\ell^n]\). **Serre's open image theorem** (1972) says that for \(E/K\) without complex multiplication, the image is open in \(\mathrm{GL}_2(\mathbb{Z}_\ell)\) for every \(\ell\) and equals \(\mathrm{GL}_2(\mathbb{Z}_\ell)\) for all but finitely many \(\ell\) — a deep rigidity statement.

<div class="theorem">
<strong>Theorem 1.4 (Birch–Swinnerton-Dyer conjecture).</strong> For \(E/\mathbb{Q}\) with \(L\)-function \(L(E, s)\),
\[ \operatorname{ord}_{s=1} L(E, s) = \operatorname{rank} E(\mathbb{Q}) \]
and the leading Taylor coefficient encodes the regulator, Tate–Shafarevich group, Tamagawa numbers, and real period of \(E\). Proved for rank \(0\) and \(1\) by Coates–Wiles, Gross–Zagier, and Kolyvagin (under restrictions); open in general.
</div>

<div class="remark">
<strong>Why elliptic curves now.</strong> Beyond BSD, modularity (Wiles, Breuil–Conrad–Diamond–Taylor, 1995–2001) unified elliptic curves over \(\mathbb{Q}\) with the analytic theory of modular forms; Sato–Tate (Clozel–Harris–Shepherd-Barron–Taylor, 2006–2011) established the statistical distribution of Frobenius traces; and recent work on the <em>explicit</em> BSD formula and on rank growth in families puts the field at the intersection of arithmetic statistics, <em>p</em>-adic analysis, and computer algebra. Every graduate career in number theory benefits from a fluent grasp of \(E(\mathbb{Q})\) and its friends.
</div>

---

# Chapter 2: Diophantine Equations and Rational Points

Taught at UW as PMATH 940 in Fall 2019 by C. L. Stewart.

Diophantine equations are the oldest subject in mathematics and, in their full generality, undecidable (Matiyasevich 1970 solving Hilbert's tenth problem). The art of the field is to identify *specific* equations where structure — algebraic, analytic, or geometric — cuts through the generic undecidability and lets one prove effective finiteness theorems. Stewart's course developed the master technique of twentieth-century effective Diophantine analysis: **Baker's method of linear forms in logarithms**.

<div class="definition">
<strong>Definition 2.1 (S-integers and S-units).</strong> For a number field \(K\) and a finite set \(S\) of places of \(K\) containing all archimedean places, the <em>ring of S-integers</em> is
\[ \mathcal{O}_{K,S} = \{ x \in K : v(x) \ge 0 \text{ for all } v \notin S \}. \]
Its group of units \(\mathcal{O}_{K,S}^\times\) is the group of <em>S-units</em>.
</div>

<div class="theorem">
<strong>Theorem 2.2 (Baker's theorem on linear forms in logarithms, 1966).</strong> Let \(\alpha_1, \ldots, \alpha_n\) be non-zero algebraic numbers with \(\log \alpha_1, \ldots, \log \alpha_n\) \(\mathbb{Q}\)-linearly independent. There exist effectively computable constants \(c_1, c_2 > 0\) depending on \(n, K = \mathbb{Q}(\alpha_1, \ldots, \alpha_n), [K:\mathbb{Q}]\), and the heights \(h(\alpha_i)\) such that for any algebraic \(\beta_0, \ldots, \beta_n\), not all zero,
\[ |\beta_0 + \beta_1 \log \alpha_1 + \cdots + \beta_n \log \alpha_n| \ge c_1 H^{-c_2}, \]
where \(H\) is the maximum of the heights \(h(\beta_i)\).
</div>

The radical advance of Baker's theorem over Thue's 1909 theorem is *effectivity*. Thue showed that equations like \(f(x, y) = m\) with \(f\) an irreducible form of degree \(\ge 3\) have finitely many integer solutions, but his argument gave no way to list them. Baker's theorem converts the finiteness proof into an algorithm: one computes an upper bound on the size of solutions, then enumerates.

<div class="example">
<strong>Example 2.3 (Mordell curves).</strong> The equation \(y^2 = x^3 + k\) for fixed \(k \in \mathbb{Z}\) has finitely many integer solutions, all of which can in principle be enumerated effectively using Baker's theorem applied to the \(S\)-unit equation arising from the factorization in \(\mathbb{Z}[\sqrt{-k}]\). For \(k = -2\): \((x, y) = (3, \pm 5)\) are the only integer solutions. For \(k = 7\): no solutions at all, an easy case. Contemporary work (Bennett, Bugeaud, Mignotte) solves Mordell equations for ranges of \(|k|\) up to \(10^4\).
</div>

<div class="theorem">
<strong>Theorem 2.4 (Thue, 1909; effective form by Baker).</strong> Let \(F(x, y) \in \mathbb{Z}[x, y]\) be a homogeneous irreducible form of degree \(d \ge 3\). For any non-zero \(m \in \mathbb{Z}\), the equation \(F(x, y) = m\) has only finitely many solutions in integers \((x, y)\), and the solutions satisfy \(\max(|x|, |y|) \le B(F, m)\) for an effectively computable bound \(B\).
</div>

<div class="remark">
<strong>The abc conjecture.</strong> Oesterlé and Masser's 1985 conjecture asserts: for every \(\varepsilon > 0\), only finitely many coprime triples \(a + b = c\) of positive integers satisfy \(c > \operatorname{rad}(abc)^{1 + \varepsilon}\). It implies effective Fermat, effective Catalan, effective Szpiro, Vojta's conjecture in dimension one, and — via Granville–Tucker and others — virtually every finiteness theorem in Diophantine geometry. Mochizuki's claimed 2012 proof has not been accepted by the arithmetic geometry community; a distinct, independent attack through "anabelian" methods remains an open research program.
</div>

The course closed with **Faltings's Mordell theorem**: a curve of genus \(\ge 2\) over a number field has finitely many rational points. The theorem is non-effective in Faltings's original proof; Vojta's later argument, using Arakelov geometry and a clever product construction, is philosophically closer to Baker's method and points toward the effective finiteness conjectures that still drive the subject.

---

# Chapter 3: Analytic Number Theory II

Taught at UW as PMATH 940 in Winter 2020 by Rubinstein.

The Riemann Hypothesis is the most famous open problem in analytic number theory. But the *unconditional* analytic number theory that preceded it — zero-density estimates, sieve bounds, exponential sum estimates — solves a large range of questions that naively seem to need RH. Rubinstein's course mapped these unconditional techniques with an emphasis on three threads whose interaction has driven progress since the 1980s: **zero-density theorems**, **sieve theory**, and **exponential sums**.

<div class="definition">
<strong>Definition 3.1 (Zero-counting function).</strong> Let \(\zeta(s)\) be the Riemann zeta function. For \(T > 0\) and \(1/2 \le \sigma \le 1\), set
\[ N(\sigma, T) = \#\{\rho : \zeta(\rho) = 0, \; \operatorname{Re}(\rho) \ge \sigma, \; |\operatorname{Im}(\rho)| \le T\}. \]
A <em>zero-density estimate</em> is an unconditional bound of the form \(N(\sigma, T) \ll T^{A(1-\sigma) + o(1)}\) for explicit \(A = A(\sigma)\).
</div>

<div class="theorem">
<strong>Theorem 3.2 (Huxley's zero-density estimate).</strong> \(N(\sigma, T) \ll T^{12(1-\sigma)/5 + \varepsilon}\) uniformly for \(\sigma \in [1/2, 1]\).
</div>

Huxley's bound is strong enough to prove the **prime number theorem in short intervals** \([x, x + x^\theta]\) for \(\theta > 7/12\) — unconditionally. This is the closest one can come to the RH-conditional result (all \(\theta > 1/2\)) without actually assuming RH.

<div class="theorem">
<strong>Theorem 3.3 (Selberg's sieve).</strong> Let \(\mathcal{A} \subseteq \mathbb{Z}\) be finite with \(|\mathcal{A}_d| = f(d)|\mathcal{A}|/g(d) + r(d)\) for a multiplicative \(g\) and sifting set \(\mathcal{P}\). For any \(z > 0\),
\[ \#\{a \in \mathcal{A} : \gcd(a, P(z)) = 1\} \;\le\; \frac{|\mathcal{A}|}{G(z)} + \sum_{d \le z^2} 3^{\omega(d)} |r(d)|, \]
where \(P(z) = \prod_{p < z, p \in \mathcal{P}} p\) and \(G(z) = \sum_{d \le z, d | P(z)} g(d)^{-1}\).
</div>

<div class="example">
<strong>Example 3.4 (Brun on twin primes).</strong> Apply Selberg's sieve with \(\mathcal{A} = \{n(n+2) : n \le x\}\) sifted by all primes \(p \le \sqrt x\): the count of twin primes \(p, p+2 \le x\) is \(O(x / \log^2 x)\), whence the sum \(\sum 1/p\) over twin primes converges (Brun's theorem, 1915). The combinatorial sieve has since driven every breakthrough on small gaps between primes, culminating in the Zhang–Maynard–Tao bounded-gaps results (2013–2015), which prove \(\liminf(p_{n+1} - p_n) \le 246\) unconditionally.
</div>

<div class="definition">
<strong>Definition 3.5 (Kloosterman sum).</strong> For integers \(m, n, c\) with \(c \ge 1\),
\[ S(m, n; c) = \sum_{\substack{a \pmod c \\ \gcd(a,c) = 1}} e^{2\pi i (ma + n\bar a)/c}, \]
where \(\bar a \cdot a \equiv 1 \pmod c\).
</div>

<div class="theorem">
<strong>Theorem 3.6 (Weil's bound, 1948).</strong> \(|S(m, n; c)| \le \tau(c) \sqrt{\gcd(m, n, c)} \cdot \sqrt c\), where \(\tau\) is the number-of-divisors function.
</div>

Weil's bound is a consequence of the Riemann hypothesis for curves over finite fields, itself a theorem (Weil 1948; Deligne's later reproof via étale cohomology gave rise to the entire framework of the Weil conjectures). In analytic number theory it enters through the **Petersson** and **Kuznetsov trace formulas**, which expand sums over Hecke eigenvalues into sums of Kloosterman sums weighted by Bessel functions. The 1980s saw a revolution in analytic number theory — sums over primes, equidistribution of Hecke eigenvalues, subconvexity bounds on \(L\)-functions — all powered by exactly this identity.

<div class="remark">
<strong>Ramanujan–Petersson, proved.</strong> Deligne's proof of the Weil conjectures has as a spectacular corollary the Ramanujan–Petersson conjecture for holomorphic cusp forms of weight \(k\ge 2\): the normalized Fourier coefficients satisfy \(|a_p| \le 2 p^{(k-1)/2}\). The extension to Maass forms remains open (Kim–Sarnak 2003 is the current state of the art), and the Generalized Ramanujan Conjecture for \(\mathrm{GL}_n\) automorphic forms remains among the central open problems of the Langlands program.
</div>

---

# Chapter 4: Geometric Number Theory

Taught at UW as PMATH 940 in Fall 2020 by C. L. Stewart.

Minkowski's 1896 *Geometrie der Zahlen* opened a surprising line of inquiry: a purely geometric fact — that a convex symmetric body in \(\mathbb{R}^n\) of volume \(> 2^n\) contains a non-zero lattice point — implies Lagrange's four-square theorem, Dirichlet's simultaneous approximation theorem, and the existence of fundamental units in number fields. Stewart's course traced this thread from Minkowski through modern **heights on projective varieties** and **Arakelov geometry**, arriving at the framework in which Faltings ultimately proved the Mordell conjecture.

<div class="theorem">
<strong>Theorem 4.1 (Minkowski's convex body theorem).</strong> Let \(\Lambda \subseteq \mathbb{R}^n\) be a lattice of covolume \(\operatorname{vol}(\mathbb{R}^n/\Lambda) = V\) and let \(K \subseteq \mathbb{R}^n\) be a convex symmetric body with \(\operatorname{vol}(K) > 2^n V\). Then \(K\) contains a non-zero lattice point.
</div>

<div class="example">
<strong>Example 4.2 (Sum of four squares).</strong> Apply Minkowski to the lattice of quaternion integers in the algebra of Lipschitz quaternions and the ball of radius \(\sqrt{n}\) in \(\mathbb{R}^4\) for a given integer \(n\). The count of lattice points within the ball forces the existence of a non-zero quaternion of norm \(n\); taking conjugates produces the four-square decomposition. The geometry-of-numbers proof is several lines; the elementary proof is several pages.
</div>

<div class="definition">
<strong>Definition 4.3 (Weil height on projective space).</strong> For \(P = (x_0 : \cdots : x_n) \in \mathbb{P}^n(K)\) with coordinates in a number field \(K\), the <em>Weil height</em> is
\[ h(P) = \frac{1}{[K : \mathbb{Q}]} \sum_{v \in M_K} [K_v : \mathbb{Q}_v] \, \log \max_i |x_i|_v. \]
It is independent of the coordinate representation and the choice of \(K\); on \(\mathbb{P}^n(\mathbb{Q})\) with coprime integer coordinates, \(h(P) = \log \max_i |x_i|\).
</div>

<div class="theorem">
<strong>Theorem 4.4 (Northcott, 1950).</strong> The set \(\{P \in \mathbb{P}^n(\overline{\mathbb{Q}}) : h(P) \le B, \; [\mathbb{Q}(P) : \mathbb{Q}] \le D\}\) is finite for every real \(B\) and integer \(D\). Equivalently, any bounded-height, bounded-degree box contains only finitely many algebraic points.
</div>

Northcott's theorem is the engine room of modern Diophantine geometry. Any construction that produces an infinite collection of algebraic points of bounded height and degree must, by Northcott, contain infinitely many repetitions — which produces a contradiction if the points were supposed to be distinct. This is the pattern behind Mordell–Weil, Faltings, and Manin–Mumford.

<div class="definition">
<strong>Definition 4.5 (Néron–Tate height on an abelian variety).</strong> Let \(A/K\) be an abelian variety with symmetric ample divisor \(D\). The <em>Néron–Tate canonical height</em> is
\[ \hat h_D(P) = \lim_{n \to \infty} \frac{h_D([n]P)}{n^2}, \]
where \(h_D\) is any Weil height attached to \(D\). It is a quadratic form on \(A(\overline K)\), vanishes exactly on torsion points, and extends to a positive-definite form on \(A(K) \otimes \mathbb{R}\).
</div>

<div class="remark">
<strong>Arakelov geometry, briefly.</strong> Arakelov's 1974 insight was that one can metrize line bundles on arithmetic surfaces — smoothly at the archimedean places, with integral structure at the finite places — and combine algebraic cycles with <em>Green forms</em> into a graded <em>arithmetic Chow group</em>. Faltings extended the framework to higher dimensions, proved the existence of natural heights on arbitrary varieties, and used the resulting machinery in his 1983 proof of the Mordell conjecture. Arakelov geometry is now the standard language in which the Bogomolov, Lang, Manin–Mumford, and Vojta conjectures are posed.
</div>

The course closed with a sketch of **Faltings's Mordell theorem** via heights and the Vojta inequality — a preview of the following year's Diophantine geometry offering.

---

# Chapter 5: Diophantine Geometry

Taught at UW as PMATH 940 in Fall 2022 by C. L. Stewart.

Stewart's third offering in the PMATH 940 rotation took the scheme-theoretic approach to Diophantine questions. The starting premise — the **Lang–Vojta philosophy** — is a heuristic dictionary: the density of rational points on a smooth projective variety \(X\) over a number field should reflect the positivity of its canonical divisor \(K_X\). Positive \(K_X\) (general type) should force few rational points; trivial \(K_X\) (Calabi–Yau, abelian varieties) allows density under specific circumstances; negative \(K_X\) (Fano) should allow abundant rational points.

<div class="theorem">
<strong>Theorem 5.1 (Faltings 1983; Mordell conjecture).</strong> A smooth projective curve \(C\) of genus \(g \ge 2\) defined over a number field \(K\) has only finitely many \(K\)-rational points.
</div>

Faltings's original proof went through the Shafarevich conjecture for abelian varieties and used finiteness of isogeny classes. Vojta's 1991 reproof is geometric: he embedded products \(C^n\) into the Jacobian \(J(C)\), used the Mumford gap principle on the resulting lattice, and derived the finiteness from a Diophantine approximation argument on a surface.

<div class="theorem">
<strong>Theorem 5.2 (Faltings's "Big Theorem"; Lang conjecture for subvarieties of abelian varieties).</strong> Let \(A\) be an abelian variety over a number field \(K\) and let \(X \subseteq A\) be a closed subvariety. Then the Zariski closure of \(X(K)\) in \(X\) is a finite union of translates of abelian subvarieties of \(A\) contained in \(X\).
</div>

Faltings's theorem subsumes Mordell's: if \(C \subseteq J(C)\) has genus \(\ge 2\), it contains no non-trivial abelian-subvariety translate, so \(C(K)\) must be finite. The theorem is the strongest known statement of "structure on rational points" for abelian varieties.

<div class="definition">
<strong>Definition 5.3 (Height machine on projective varieties).</strong> For \(X\) smooth projective over \(K\) and \(\mathcal L\) a line bundle on \(X\), the <em>Weil height machine</em> produces a height function \(h_\mathcal L \colon X(\overline K) \to \mathbb{R}\), unique up to \(O(1)\), satisfying: (i) \(h_{\mathcal L \otimes \mathcal M} = h_\mathcal L + h_\mathcal M + O(1)\); (ii) \(h_\mathcal L \ge 0\) for \(\mathcal L\) very ample; (iii) \(h_\mathcal L \circ \phi = h_{\phi^*\mathcal L} + O(1)\) for morphisms \(\phi\).
</div>

<div class="example">
<strong>Example 5.4 (Mumford gap principle).</strong> On a curve \(C\) of genus \(g \ge 2\) embedded in its Jacobian \(J(C)\), the Néron–Tate height gives a positive-definite inner product on \(J(C) \otimes \mathbb{R}\). Mumford showed that two distinct \(C(K)\)-points \(P, Q\) satisfy
\[ \hat h_\theta(P - Q) \ge c_1 \sqrt{\hat h_\theta(P) \hat h_\theta(Q)} - c_2 \]
for constants \(c_i\) depending on \(C\). The geometric picture is that \(C(K)\) lies along "thin" bands inside the linear space \(J(C)(K) \otimes \mathbb{R}\), and the gap principle bounds the density of these bands — giving Mumford's sub-exponential bound \(\#C(K) \cap \{h \le B\} \ll_C \log B\).
</div>

<div class="theorem">
<strong>Theorem 5.5 (Uniform Mordell; Dimitrov–Gao–Habegger, 2021).</strong> For every \(g \ge 2\) there exists \(c(g)\) such that every smooth projective curve \(C\) of genus \(g\) over a number field \(K\) satisfies
\[ \#C(K) \le c(g) \cdot (1 + \operatorname{rank}\operatorname{Jac}(C)(K)). \]
</div>

The uniform Mordell result was a sensation: for forty years the best bound on \(\#C(K)\) was Mumford's logarithmic gap bound, with constants depending on the curve. The DGH theorem bounds \(\#C(K)\) linearly in the Mordell–Weil rank with a constant depending *only* on the genus — and it uses the arithmetic of the Betti map together with a uniform Vojta-type inequality on the Faltings height.

<div class="remark">
<strong>Vojta's conjecture.</strong> A far-reaching analogue of the second main theorem of Nevanlinna theory, Vojta's conjecture (1987) asserts that for any smooth projective variety \(X\) over a number field with ample canonical bundle, the rational points of \(X\) outside a proper Zariski-closed subset satisfy \(h_{K_X}(P) \le \varepsilon h_A(P) + O(1)\) for any \(\varepsilon > 0\) and any ample \(A\). It implies abc, uniform Mordell, and effective Diophantine finiteness in vast generality. Proved by Vojta himself in the function-field case; over number fields it remains the principal open conjecture in Diophantine geometry.
</div>

---

# Chapter 6: Analytic Diophantine Geometry

Taught at UW as PMATH 940 in Winter 2023 by Liu.

Liu's course synthesized the analytic threads of the earlier Stewart offerings with the geometric framework of Chapter 5. The central tools — quantitative linear forms in logarithms, effective Siegel–Mahler theorems, transcendence measures — are the ones that let one turn a non-constructive proof of finiteness into an *algorithm* that explicitly lists the solutions.

<div class="theorem">
<strong>Theorem 6.1 (Baker's theorem, quantitative form).</strong> There exist effectively computable constants \(c_1(n), c_2(n) > 0\) such that for any non-zero linear form
\[ \Lambda = \beta_0 + \beta_1 \log \alpha_1 + \cdots + \beta_n \log \alpha_n \]
with \(\alpha_i\) non-zero algebraic, \(\log \alpha_i\) linearly independent over \(\mathbb{Q}\), and \(\beta_i\) integers of absolute value at most \(B\),
\[ |\Lambda| > c_1 \cdot B^{-c_2}. \]
</div>

The quantitative form is what algorithms use. Modern refinements (Baker–Wüstholz, Matveev, Laurent, Bugeaud–Mignotte–Siksek) sharpen the dependence of \(c_1, c_2\) on the heights of the \(\alpha_i\) to the point where one can solve, in practice, Thue equations and elliptic integer-point problems whose solutions have hundreds of digits.

<div class="theorem">
<strong>Theorem 6.2 (Gelfond–Schneider, 1934).</strong> If \(\alpha, \beta\) are algebraic with \(\alpha \ne 0, 1\) and \(\beta\) irrational, then \(\alpha^\beta\) is transcendental. In particular \(2^{\sqrt 2}\), \(e^\pi = (-1)^{-i}\), and Hilbert's seventh number \(2^{\sqrt 2}\) are transcendental.
</div>

<div class="theorem">
<strong>Theorem 6.3 (Lindemann–Weierstrass, 1885).</strong> If \(\gamma_1, \ldots, \gamma_n\) are distinct algebraic numbers, then \(e^{\gamma_1}, \ldots, e^{\gamma_n}\) are linearly independent over \(\overline{\mathbb{Q}}\). In particular \(e^\alpha\) is transcendental for any non-zero algebraic \(\alpha\), yielding the transcendence of \(e\) (take \(\alpha = 1\)) and of \(\pi\) (from \(e^{i\pi} = -1\)).
</div>

<div class="example">
<strong>Example 6.4 (Effective integral points on Mordell curves).</strong> For \(y^2 = x^3 + k\) with \(|k| \le 10^6\), combining Baker's bound for linear forms in \(p\)-adic logarithms with lattice-reduction algorithms (LLL), one can produce a complete list of integral solutions in seconds on a laptop. The pipeline — compute elliptic logarithms, set up a linear form, apply Matveev's bound, reduce by LLL, enumerate small cases — is implemented in Sage, PARI/GP, and Magma. This is the standard laboratory exercise at the end of a quarter of analytic Diophantine geometry.
</div>

<div class="remark">
<strong>Schanuel's conjecture.</strong> The far-reaching transcendence conjecture of Schanuel (1966) asserts: if \(z_1, \ldots, z_n \in \mathbb{C}\) are \(\mathbb{Q}\)-linearly independent, then
\[ \operatorname{trdeg}_\mathbb{Q} \mathbb{Q}(z_1, \ldots, z_n, e^{z_1}, \ldots, e^{z_n}) \ge n. \]
Schanuel implies the transcendence of \(\pi + e, \pi \cdot e, e^\pi \pi\), algebraic independence of \(\pi\) and \(e\), and essentially every classical transcendence question. It remains wide open. Partial progress (Nesterenko's theorem on \(\pi, e^\pi, \Gamma(1/4)\)) is fragmentary and proofs are individually highly technical.
</div>

The course closed by relating the transcendence framework to Diophantine geometry: Schanuel's conjecture, cast in the language of \(o\)-minimal geometry and the Pila–Wilkie theorem on rational points on transcendental sets, has turned out to be precisely the tool required for the modern proofs of the Manin–Mumford and André–Oort conjectures. The subject's analytic, Diophantine, and logical threads converge into a single framework.

---

# Chapter 7: Fermat's Last Theorem and Modular Forms

Planned at UW as PMATH 940 in Winter 2026; the Fall 2021 Stewart offering on modular forms provides preparatory material.

In June 1993 Andrew Wiles announced the proof of Fermat's Last Theorem, concluding a 356-year quest and, along the way, establishing modularity for semistable elliptic curves over \(\mathbb{Q}\). The completion by Taylor–Wiles (1995) and the general case by Breuil–Conrad–Diamond–Taylor (2001) ranks among the twentieth century's most consequential theorems. This chapter sketches the strategy and the prerequisites that a student will need for the 2026 offering.

<div class="definition">
<strong>Definition 7.1 (Modular form).</strong> For the upper half-plane \(\mathfrak{H} = \{\tau \in \mathbb{C} : \operatorname{Im}\tau > 0\}\) and a congruence subgroup \(\Gamma \subseteq \mathrm{SL}_2(\mathbb{Z})\), a <em>modular form of weight \(k\)</em> for \(\Gamma\) is a holomorphic \(f \colon \mathfrak{H} \to \mathbb{C}\) satisfying
\[ f(\gamma \tau) = (c\tau + d)^k f(\tau), \quad \gamma = \begin{pmatrix} a & b \\ c & d \end{pmatrix} \in \Gamma, \]
and holomorphic at every cusp. A <em>cusp form</em> vanishes at every cusp. The space \(S_k(\Gamma)\) of cusp forms is finite-dimensional.
</div>

The **Hecke algebra** \(T(\Gamma)\) acts on \(S_k(\Gamma)\) by operators \(T_p\) for primes \(p\). Simultaneous eigenforms — forms \(f\) with \(T_p f = a_p f\) for all \(p\) — have Fourier coefficients satisfying multiplicative relations expressed in the Euler product of the associated \(L\)-function
\[ L(f, s) = \sum_{n \ge 1} a_n n^{-s} = \prod_p (1 - a_p p^{-s} + p^{k-1-2s})^{-1}. \]

<div class="theorem">
<strong>Theorem 7.2 (Modularity Theorem; Wiles, Taylor–Wiles, BCDT).</strong> Every elliptic curve \(E\) over \(\mathbb{Q}\) is modular: the \(L\)-function \(L(E, s)\) equals \(L(f, s)\) for a weight-2 cuspidal newform \(f\) on \(\Gamma_0(N)\), where \(N\) is the conductor of \(E\).
</div>

<div class="example">
<strong>Example 7.3 (Frey's curve).</strong> Given a hypothetical solution \(a^p + b^p = c^p\) to Fermat with \(p\) prime, \(p \ge 5\), \(\gcd(a, b, c) = 1\), Frey (1985) attached the elliptic curve
\[ E_{a,b,c} \colon y^2 = x(x - a^p)(x + b^p). \]
Its conductor is bounded by \(\operatorname{rad}(abc)\), and its \(\ell\)-adic Galois representation has an extraordinarily small ramification pattern. Ribet's level-lowering theorem (1990) says the associated modular form, if it exists, has weight 2 and level 2 — but \(S_2(\Gamma_0(2)) = 0\). Contradiction. This is the skeleton of the Fermat proof: <em>modularity, level lowering, level-2 emptiness</em>.
</div>

<div class="definition">
<strong>Definition 7.4 (\(\ell\)-adic Galois representation of a modular form).</strong> For a weight-\(k\) cuspidal newform \(f \in S_k(\Gamma_0(N))\) that is a Hecke eigenform, Deligne constructed a continuous representation
\[ \rho_{f,\ell} \colon \operatorname{Gal}(\overline{\mathbb{Q}}/\mathbb{Q}) \to \mathrm{GL}_2(\overline{\mathbb{Q}_\ell}) \]
such that for every prime \(p \nmid N\ell\), \(\operatorname{tr}\rho_{f,\ell}(\operatorname{Frob}_p) = a_p(f)\) and \(\det\rho_{f,\ell}(\operatorname{Frob}_p) = p^{k-1}\).
</div>

<div class="theorem">
<strong>Theorem 7.5 (Ribet's level lowering, 1990).</strong> Let \(f \in S_2(\Gamma_0(Np))\) be a Hecke eigenform with mod-\(\ell\) Galois representation \(\bar\rho_{f,\ell}\) unramified at \(p\). Then there exists a Hecke eigenform \(g \in S_2(\Gamma_0(N))\) with \(\bar\rho_{g,\ell} = \bar\rho_{f,\ell}\).
</div>

Wiles's core insight is to prove modularity by a **Galois deformation** argument: given the residual representation \(\bar\rho_{E,\ell}\), one shows that the universal deformation ring classifying lifts with prescribed ramification equals the Hecke algebra classifying modular forms with the same residual representation. This "\(R = T\)" theorem is the technical heart of the proof.

<div class="remark">
<strong>Where the subject is now.</strong> The Modularity Theorem is no longer the frontier. The Sato–Tate conjecture (proved 2008–2011 by Clozel–Harris–Shepherd-Barron–Taylor using potential modularity and higher symmetric powers); the modularity of abelian surfaces; modularity over totally real fields; and the Fontaine–Mazur conjecture (partially proved by Kisin, Emerton, and others) each generalize Wiles's strategy to broader classes of Galois representations. The 2026 course will introduce the modular-forms toolkit and Wiles's <em>R = T</em> strategy, leaving the more general modern Langlands-program extensions to subsequent graduate work.
</div>
