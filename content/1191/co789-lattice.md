---
title: "CO 789: Lattice-Based Cryptography"
prof: "Douglas Stebila"
subjects: "CO"
---

*These notes synthesize the standard lattice-cryptography curriculum from public sources: Micciancio and Goldwasser, <em>Complexity of Lattice Problems: A Cryptographic Perspective</em> (Springer, 2002); Regev, <em>On Lattices, Learning with Errors, Random Linear Codes, and Cryptography</em> (J. ACM, 2009); Peikert, <em>A Decade of Lattice Cryptography</em> (Foundations and Trends in Theoretical Computer Science, 2016, free at the author's site); Lyubashevsky, Peikert, and Regev, <em>On Ideal Lattices and Learning with Errors over Rings</em> (EUROCRYPT 2010); Hoffstein, Pipher, and Silverman, <em>An Introduction to Mathematical Cryptography</em> (2nd ed., Springer); Galbraith, <em>Mathematics of Public Key Cryptography</em> (free at the author's site); the NIST PQC standards documentation for Kyber/ML-KEM and Dilithium/ML-DSA; and various arXiv preprints on lattice algorithms and applications.*

---

# Chapter 1: Lattices and Their Geometry

Lattice-based cryptography draws its security from the apparent intractability of geometric problems on integer point sets. Before any cryptographic construction makes sense we must understand what a lattice is, how it is presented, and what numerical invariants govern its behaviour. The point of this opening chapter is to establish the geometry of lattices with enough precision that later reductions, which trade between algebraic structures over \(\mathbb{Z}_q\) and short vectors in real Euclidean space, become natural rather than mysterious.

## 1.1 Definitions and bases

<div class="definition">
<strong>Definition 1.1 (Lattice).</strong> A <em>lattice</em> \(\Lambda \subset \mathbb{R}^m\) is a discrete additive subgroup of \(\mathbb{R}^m\). Equivalently, given linearly independent vectors \(b_1, \ldots, b_n \in \mathbb{R}^m\) (with \(n \le m\)), the set
\[
\Lambda(B) = \left\{ \sum_{i=1}^n x_i b_i : x_i \in \mathbb{Z} \right\} = B \mathbb{Z}^n
\]
is the lattice <em>generated</em> by the basis \(B = \left[b_1 \mid \cdots \mid b_n\right] \in \mathbb{R}^{m \times n}\). The integer \(n\) is the <em>rank</em>, and \(m\) the <em>dimension of the ambient space</em>; when \(n=m\) the lattice is <em>full-rank</em>.
</div>

A discrete subgroup is one in which every point has a neighbourhood containing only finitely many lattice points; equivalently the origin is isolated. The standard example is \(\Lambda = \mathbb{Z}^n\), but every lattice is, after a linear change of variables, a tilted and stretched copy of \(\mathbb{Z}^n\) inside \(\mathbb{R}^m\). A given lattice has infinitely many bases: if \(B\) is a basis and \(U \in \mathrm{GL}_n(\mathbb{Z})\) — that is, \(U\) is an integer matrix with determinant \(\pm 1\), called a **unimodular** matrix — then \(B' = BU\) is also a basis of \(\Lambda(B)\), and conversely every basis arises in this way. Computational lattice cryptography is in large part the study of which bases reveal which secrets.

<div class="definition">
<strong>Definition 1.2 (Fundamental parallelepiped, determinant).</strong> The <em>fundamental parallelepiped</em> of a basis \(B \in \mathbb{R}^{m\times n}\) is

\[
\mathcal{P}(B) = \left\{ B x : x \in \left[0,1\right)^n \right\}.
\]

Its \(n\)-dimensional volume \(\det(\Lambda) := \sqrt{\det(B^\top B)}\) depends only on the lattice \(\Lambda\), not on the choice of basis. When \(\Lambda\) is full-rank, \(\det(\Lambda) = \lvert \det(B) \rvert\).
</div>

The basis-independence is immediate: if \(B' = BU\) with \(U\) unimodular, then \(\det((B')^\top B') = \det(U^\top B^\top B U) = \det(U)^2 \det(B^\top B) = \det(B^\top B)\). Geometrically, every fundamental parallelepiped tiles the linear span of \(\Lambda\) by translates indexed by \(\Lambda\) itself, so they all enclose the same volume: one fundamental domain per lattice point.

<div class="example">
<strong>Example 1.3.</strong> Let \(B\) have columns \((1,1)\) and \((0,2)\). Then \(\Lambda(B) = \{(a,\, a+2b): a,b \in \mathbb{Z}\}\). The vectors \(b_1=(1,1)\) and \(b_2=(0,2)\) generate the same set as the (much shorter) basis \((1,1)\) and \((-1,1)\). The first basis has parallelepiped of area \(2\) but contains a long vector \(b_1 + b_2 = (1,3)\); the second basis has the same area but two short orthogonal-looking vectors. This phenomenon — the same lattice having both "ugly" and "good" bases — is the central tension of the field.
</div>

## 1.2 Gram--Schmidt and successive minima

The cleanest invariants of a basis are the lengths of its **Gram--Schmidt orthogonalization**. Given \(b_1, \ldots, b_n\), define

\[
\tilde b_1 = b_1, \qquad \tilde b_i = b_i - \sum_{j<i} \mu_{ij}\, \tilde b_j, \quad \mu_{ij} = \frac{\langle b_i, \tilde b_j \rangle}{\langle \tilde b_j, \tilde b_j \rangle}.
\]

The Gram--Schmidt vectors \(\tilde b_i\) are pairwise orthogonal but generally *not* integer combinations of the \(b_i\), so they are not in the lattice; nevertheless their lengths control geometry. In particular, \(\det(\Lambda) = \prod_i \lVert \tilde b_i \rVert\), so a basis with very unequal Gram--Schmidt norms must contain long vectors when measured against the determinant.

<div class="definition">
<strong>Definition 1.4 (Successive minima).</strong> For a lattice \(\Lambda\) of rank \(n\) and \(1 \le i \le n\), the \(i\)-th <em>successive minimum</em> is

\[
\lambda_i(\Lambda) = \inf\bigl\{ r > 0 : \dim \mathrm{span}\{\Lambda \cap \overline{B}(0,r)\} \ge i \bigr\},
\]

where \(\overline{B}(0,r)\) is the closed Euclidean ball of radius \(r\). Thus \(\lambda_1\) is the length of a shortest nonzero vector and \(\lambda_n\) is the smallest radius enclosing \(n\) linearly independent lattice vectors.
</div>

The infima are achieved because lattices are discrete. The successive minima encode at once the shortest, second-shortest-in-a-new-direction, and so on, lattice vectors. They satisfy \(\lambda_1 \le \lambda_2 \le \cdots \le \lambda_n\) and behave reasonably under sublattices, but they are notoriously hard to compute.

## 1.3 Minkowski's theorems

The earliest deep result about lattices, dating to the geometry of numbers in the late 19th century, gives an unconditional upper bound on \(\lambda_1(\Lambda)\) in terms of the determinant.

<div class="theorem">
<strong>Theorem 1.5 (Minkowski's first theorem).</strong> Let \(\Lambda \subset \mathbb{R}^n\) be a full-rank lattice and let \(K \subset \mathbb{R}^n\) be a centrally symmetric convex body with volume \(\mathrm{vol}(K) > 2^n \det(\Lambda)\). Then \(K\) contains a nonzero lattice point.
</div>

<div class="proof">
<strong>Proof sketch.</strong> Consider the half-scaled body \(\tfrac{1}{2}K\), of volume \(2^{-n}\mathrm{vol}(K) > \det(\Lambda)\). Translating \(\tfrac12 K\) by lattice vectors produces overlapping copies of total volume exceeding the volume of one fundamental domain, so two distinct points \(\tfrac12 x_1\) and \(\tfrac12 x_2 + v\) of the translates coincide for some nonzero \(v \in \Lambda\). Then \(v = \tfrac12(x_1 - x_2) \in K\) by central symmetry and convexity.
</div>

Specializing \(K\) to the Euclidean ball gives the following corollary.

<div class="theorem">
<strong>Corollary 1.6 (Minkowski bound on \(\lambda_1\)).</strong> For any full-rank \(\Lambda \subset \mathbb{R}^n\),

\[
\lambda_1(\Lambda) \le \sqrt{n}\, \det(\Lambda)^{1/n}.
\]
</div>

A sharper form, due also to Minkowski, controls all successive minima simultaneously: \(\bigl(\prod_{i=1}^n \lambda_i\bigr)^{1/n} \le \sqrt{n}\,\det(\Lambda)^{1/n}\), with a matching lower bound \(\bigl(\prod_i \lambda_i\bigr)^{1/n} \ge \det(\Lambda)^{1/n}/\sqrt{n}\) coming from a packing argument. Random lattices, in a precise sense, achieve these bounds up to a \(\sqrt{2\pi e}\) factor (the **Gaussian heuristic**): a "typical" \(n\)-dimensional lattice has \(\lambda_1 \approx \sqrt{n/(2\pi e)}\, \det(\Lambda)^{1/n}\).

<div class="remark">
<strong>Remark 1.7.</strong> The Gaussian heuristic is what designers use to estimate the difficulty of finding short vectors in cryptographic lattices. When a candidate algorithm produces vectors much shorter than the heuristic predicts, the lattice is suspicious: either the algorithm is exploiting structure or the parameters are wrong.
</div>

## 1.4 Dual lattices

<div class="definition">
<strong>Definition 1.8 (Dual lattice).</strong> The <em>dual</em> of a lattice \(\Lambda \subset \mathbb{R}^n\) is

\[
\Lambda^* = \left\{ y \in \mathrm{span}(\Lambda) : \langle x, y \rangle \in \mathbb{Z} \text{ for all } x \in \Lambda \right\}.
\]

If \(B\) is a basis of a full-rank lattice, then \(B^{-\top}\) is a basis of \(\Lambda^*\), and \(\det(\Lambda^*) = 1/\det(\Lambda)\). One has \((\Lambda^*)^* = \Lambda\).
</div>

The dual is the "Fourier-side" lattice and it appears in two crucial places: in transference theorems relating \(\lambda_i(\Lambda)\) to \(\lambda_{n-i+1}(\Lambda^*)\) (Banaszczyk's theorems give \(1 \le \lambda_i(\Lambda) \cdot \lambda_{n-i+1}(\Lambda^*) \le n\)), and in the worst-case to average-case reductions for SIS and LWE, where the random target lattice and its dual appear on opposite sides of the reduction.

# Chapter 2: Computational Lattice Problems

We now switch from geometry to complexity. A lattice cryptosystem is secure only because some lattice problem is hard; the menagerie of lattice problems is therefore the catalogue of cryptographic hardness assumptions available to us.

## 2.1 The shortest and closest vector problems

<div class="definition">
<strong>Definition 2.1 (SVP and CVP).</strong> Given a basis \(B\) of a lattice \(\Lambda\): the <em>Shortest Vector Problem</em> \(\mathsf{SVP}\) asks for \(v \in \Lambda \setminus \{0\}\) with \(\lVert v \rVert = \lambda_1(\Lambda)\); the <em>Closest Vector Problem</em> \(\mathsf{CVP}\) takes also a target \(t \in \mathrm{span}(\Lambda)\) and asks for \(v \in \Lambda\) minimizing \(\lVert v - t \rVert\).
</div>

Both are NP-hard (CVP under deterministic reductions, SVP under randomized reductions for the Euclidean norm, by van Emde Boas, Ajtai, and Micciancio). Cryptography, however, almost never relies on exactly solving these problems; instead it uses approximation versions.

<div class="definition">
<strong>Definition 2.2 (Approximation versions).</strong> For an approximation factor \(\gamma = \gamma(n) \ge 1\):
<ul>
<li><strong>\(\mathsf{SVP}_\gamma\)</strong>: find a nonzero \(v \in \Lambda\) with \(\lVert v \rVert \le \gamma \cdot \lambda_1(\Lambda)\).</li>
<li><strong>\(\mathsf{CVP}_\gamma\)</strong>: find \(v \in \Lambda\) with \(\lVert v - t \rVert \le \gamma \cdot \mathrm{dist}(t, \Lambda)\).</li>
<li><strong>\(\mathsf{SIVP}_\gamma\)</strong> (Shortest Independent Vectors Problem): find \(n\) linearly independent lattice vectors all of length at most \(\gamma \cdot \lambda_n(\Lambda)\).</li>
<li><strong>\(\mathsf{BDD}_\alpha\)</strong> (Bounded Distance Decoding): given \(t\) with \(\mathrm{dist}(t, \Lambda) \le \alpha \cdot \lambda_1(\Lambda)\) for \(\alpha < 1/2\), find the unique closest lattice vector.</li>
</ul>
</div>

The decision variants \(\mathsf{GapSVP}_\gamma\) and \(\mathsf{GapCVP}_\gamma\) are gap promise problems: distinguish whether \(\lambda_1(\Lambda) \le 1\) or \(\lambda_1(\Lambda) > \gamma\).

<div class="theorem">
<strong>Theorem 2.3 (Hardness landscape).</strong> Exact \(\mathsf{SVP}\) and \(\mathsf{CVP}\) are NP-hard. \(\mathsf{GapSVP}_\gamma\) is NP-hard for any constant \(\gamma\) (Khot 2004). On the other hand, for \(\gamma = 2^{O(n \log\log n / \log n)}\), Lenstra--Lenstra--Lovász and Schnorr give polynomial-time algorithms; for \(\gamma = O(\sqrt{n/\log n})\), \(\mathsf{GapSVP}_\gamma\) lies in \(\mathsf{NP} \cap \mathsf{coNP}\) (Aharonov--Regev 2005), so it is unlikely to be NP-hard at this regime.
</div>

Cryptography lives in the polynomial-factor regime \(\gamma = \mathrm{poly}(n)\), where no efficient algorithm is known but NP-hardness is also out of reach: this is the standard "structurally hard" zone where worst-case-to-average-case reductions for SIS and LWE place their guarantees.

<div class="remark">
<strong>Remark 2.4.</strong> The conjecture underlying lattice cryptography is that no quantum or classical algorithm solves \(\mathsf{GapSVP}_\gamma\) or \(\mathsf{SIVP}_\gamma\) on general lattices in time better than \(2^{\Omega(n/\log\gamma)}\) when \(\gamma\) is polynomial. The best provable algorithms (sieving) achieve \(2^{0.292 n + o(n)}\) for exact SVP, classically, and \(2^{0.265 n + o(n)}\) heuristically with quantum walks (Laarhoven).
</div>

# Chapter 3: Lattice Basis Reduction

The algorithmic side of lattice cryptography rests on basis-reduction algorithms, which take an arbitrary basis and produce a more orthogonal one. Reduction algorithms are used both as cryptanalytic tools — to attempt to break LWE or NTRU — and as primitives inside cryptographic schemes (e.g. trapdoor sampling).

## 3.1 The LLL algorithm

The Lenstra--Lenstra--Lovász algorithm (1982), the foundational result of computational lattice theory, runs in polynomial time and outputs a basis whose first vector is short within a factor exponential in the dimension.

<div class="definition">
<strong>Definition 3.1 (LLL-reduced basis).</strong> A basis \(B = (b_1, \ldots, b_n)\) with Gram--Schmidt orthogonalization \((\tilde b_i)\) and coefficients \(\mu_{ij}\) is <em>\(\delta\)-LLL-reduced</em> (for \(\tfrac14 < \delta < 1\)) if:
<ul>
<li><em>Size reduction:</em> \(\lvert \mu_{ij} \rvert \le \tfrac12\) for all \(j < i\);</li>
<li><em>Lovász condition:</em> \(\delta \lVert \tilde b_{i-1} \rVert^2 \le \lVert \tilde b_i + \mu_{i,i-1}\, \tilde b_{i-1} \rVert^2\) for all \(i \ge 2\).</li>
</ul>
</div>

<div class="theorem">
<strong>Theorem 3.2 (LLL guarantee).</strong> A \(\delta\)-LLL-reduced basis with \(\delta = 3/4\) satisfies \(\lVert b_1 \rVert \le 2^{(n-1)/2} \lambda_1(\Lambda)\), and more generally \(\lVert b_i \rVert \le 2^{(n-1)/2} \lambda_i(\Lambda)\). The algorithm runs in time polynomial in \(n\) and the bit-length of the input.
</div>

<div class="proof">
<strong>Proof idea.</strong> The algorithm alternates two operations. <em>Size reduction</em> replaces \(b_i\) by \(b_i - \lfloor \mu_{ij} \rceil b_j\) for \(j < i\), making each \(\lvert \mu_{ij}\rvert \le \tfrac12\). <em>Swap</em>: if the Lovász condition fails at \(i\), swap \(b_i\) with \(b_{i-1}\). The potential function \(\prod_{i=1}^{n} \lVert \tilde b_i \rVert^{2(n-i+1)}\), which is a nonzero integer in the integer-lattice case, decreases by a constant factor on each swap and is bounded below, giving polynomial bound on swaps. The output bound \(\lVert b_1\rVert \le 2^{(n-1)/2}\lambda_1\) follows from \(\lVert \tilde b_i\rVert^2 \ge \tfrac12 \lVert \tilde b_{i-1}\rVert^2\).
</div>

## 3.2 BKZ and block reduction

For higher-quality reduction, the Block Korkine--Zolotarev (BKZ) algorithm of Schnorr (1987) generalizes LLL by performing exact SVP in successive blocks of size \(\beta\). With block size \(\beta\), BKZ achieves \(\lVert b_1 \rVert \le \gamma_\beta^{(n-1)/(\beta-1)} \det(\Lambda)^{1/n}\) where \(\gamma_\beta\) is Hermite's constant; the time complexity grows roughly as \(2^{O(\beta)}\) per SVP call, multiplied by a polynomial number of tours. The trade-off is essentially the only knob attackers turn against LWE: pick the block size \(\beta\) that brings the output down to a target length, then estimate the cost of an SVP oracle in dimension \(\beta\). This yields the so-called **core-SVP** cost model used to compare candidate post-quantum schemes.

<div class="remark">
<strong>Remark 3.3 (Sieving vs. enumeration).</strong> Two families implement the SVP oracle inside BKZ. <em>Enumeration</em> walks the search tree of integer combinations with running time \(2^{O(n \log n)}\) and polynomial space; <em>sieving</em> manipulates exponentially many vectors in time and space \(2^{\Theta(n)}\). For cryptanalytic dimensions in the hundreds, sieving wins.
</div>

# Chapter 4: The Short Integer Solution Problem

We now move to the average-case problems on which efficient lattice cryptography is built. The first is SIS, introduced by Ajtai (1996), who proved that random instances are no easier than worst-case lattice problems.

<div class="definition">
<strong>Definition 4.1 (SIS).</strong> Let \(n, m, q\) be integers with \(m \ge n \log q\), and let \(\beta > 0\). Given a uniformly random matrix \(A \in \mathbb{Z}_q^{n \times m}\), the <em>Short Integer Solution</em> problem \(\mathsf{SIS}_{n,m,q,\beta}\) asks for a nonzero \(z \in \mathbb{Z}^m\) with \(\lVert z \rVert \le \beta\) and \(A z \equiv 0 \pmod q\).
</div>

The set \(\Lambda_q^\perp(A) = \{ z \in \mathbb{Z}^m : Az \equiv 0 \pmod q\}\) is itself a lattice of dimension \(m\) and (typically) determinant \(q^n\), so SIS is exactly the search-SVP problem on this random "\(q\)-ary" lattice.

<div class="theorem">
<strong>Theorem 4.2 (Ajtai's worst-case reduction, refined by Micciancio--Regev).</strong> For appropriate parameters (\(\beta = \mathrm{poly}(n)\), \(q = \mathrm{poly}(n,\beta)\), \(m \ge n \log q\)), if there is a polynomial-time algorithm solving \(\mathsf{SIS}_{n,m,q,\beta}\) on uniformly random \(A\) with non-negligible probability, then there is a polynomial-time algorithm solving \(\mathsf{SIVP}_\gamma\) on every \(n\)-dimensional lattice for some \(\gamma = \tilde O(\beta \sqrt{n})\).
</div>

The reduction proceeds by sampling Gaussian-distributed lattice vectors using the assumed SIS oracle and applying these short combinations to recover a short basis of the input lattice.

## 4.1 One-way functions, hashing, and signatures from SIS

<div class="example">
<strong>Example 4.3 (Ajtai's hash function).</strong> Define \(f_A : \{0,1\}^m \to \mathbb{Z}_q^n\) by \(f_A(x) = Ax \bmod q\). Collisions \(f_A(x) = f_A(x')\) yield short vectors \(x - x' \in \{-1,0,1\}^m\) with \(A(x-x') = 0\), hence solve \(\mathsf{SIS}_{n,m,q,\sqrt m}\). For \(m > n \log q\) the function compresses, so it is a <em>collision-resistant compression function</em> under the worst-case lattice assumption.
</div>

This was the first asymptotically efficient construction whose security reduced to a worst-case (rather than average-case) computational assumption — a hallmark of lattice cryptography.

# Chapter 5: Learning With Errors

The single most important problem in modern lattice cryptography is Learning With Errors, introduced by Regev (2005). LWE plays the role for lattice cryptography that the discrete logarithm problem plays for elliptic-curve cryptography.

<div class="definition">
<strong>Definition 5.1 (LWE distribution and decision LWE).</strong> Fix integers \(n, q\) and an error distribution \(\chi\) on \(\mathbb{Z}\) (typically a discrete Gaussian of parameter \(\alpha q\) for some \(0 < \alpha < 1\)). For a secret \(s \in \mathbb{Z}_q^n\), the <em>LWE distribution</em> \(A_{s,\chi}\) outputs samples \((a, b) \in \mathbb{Z}_q^n \times \mathbb{Z}_q\) where \(a\) is uniform and \(b = \langle a, s\rangle + e \bmod q\) with \(e \leftarrow \chi\). The <em>search</em> LWE problem is: given polynomially many samples from \(A_{s,\chi}\), recover \(s\). The <em>decision</em> LWE problem is: distinguish \(A_{s,\chi}\) (for uniformly random \(s\)) from the uniform distribution on \(\mathbb{Z}_q^n \times \mathbb{Z}_q\), with non-negligible advantage.
</div>

If the error distribution were \(0\), recovering \(s\) from \(m\) samples would be Gaussian elimination on the linear system \(b = As\); the noise transforms a trivial linear-algebra problem into a (conjecturally) hard one. Aggregating samples into matrix form, one writes \(b = A^\top s + e \bmod q\) for \(A \in \mathbb{Z}_q^{n\times m}\), \(b \in \mathbb{Z}_q^m\), \(e \leftarrow \chi^m\).

## 5.1 Regev's quantum reduction

<div class="theorem">
<strong>Theorem 5.2 (Regev 2005).</strong> Let \(n, q, \alpha\) satisfy \(\alpha q > 2\sqrt{n}\). If there is an efficient algorithm solving decision LWE with parameters \((n, q, \alpha)\), then there is an efficient <em>quantum</em> algorithm solving \(\mathsf{SIVP}_{\tilde O(n/\alpha)}\) on every \(n\)-dimensional lattice.
</div>

The reduction passes through the Bounded Distance Decoding problem on \(q\)-ary lattices, uses the LWE oracle to turn close-vector queries into discrete Gaussian samples, and crucially employs a quantum step to invert the Gaussian sampling and produce shorter vectors. A later result of Peikert (2009) and Brakerski--Langlois--Peikert--Regev--Stehlé (2013) gave a *classical* reduction with a larger modulus, dropping the quantum step at the cost of \(q\) growing exponentially with the SIVP factor.

<div class="remark">
<strong>Remark 5.3.</strong> The error rate \(\alpha\) governs both the security and the correctness budget of any LWE-based scheme: too small \(\alpha\) and one can attack via Arora--Ge linearization; too large and decryption fails. Practical schemes choose \(\alpha\) so that \(\alpha q\) is a small constant (say \(\sigma \approx 3\)) and rely on \(n\) and \(q\) for security.
</div>

## 5.2 Decision and search equivalence

For prime \(q = \mathrm{poly}(n)\), search and decision LWE are polynomial-time equivalent. The reverse reduction (decision implies search) is trivial. The forward reduction (search implies decision), due to Regev, recovers the secret coordinate-by-coordinate by guessing each \(s_i \in \mathbb{Z}_q\) and using the decision oracle to test the guess. The crucial cryptographic upshot is that ciphertext distinguishability — what one needs for IND-CPA security — already implies recovery of the entire secret, so any meaningful break of an LWE-based scheme yields a secret-key recovery attack.

# Chapter 6: Public-Key Encryption from LWE

The construction of public-key encryption from LWE — Regev's original contribution — is striking for its directness. The same noisy linear-algebra structure that makes the underlying problem hard yields encryption "for free".

## 6.1 Regev's encryption scheme

<div class="definition">
<strong>Construction 6.1 (Regev PKE).</strong> Parameters \(n, m, q, \chi\). <em>KeyGen:</em> sample \(s \leftarrow \mathbb{Z}_q^n\), \(A \leftarrow \mathbb{Z}_q^{n \times m}\), \(e \leftarrow \chi^m\); output public key \((A, b = A^\top s + e)\) and secret key \(s\). <em>Encrypt</em> a bit \(\mu \in \{0,1\}\): pick \(r \leftarrow \{0,1\}^m\) and output \((u, v) = (A r,\, b^\top r + \mu \lfloor q/2 \rceil)\). <em>Decrypt:</em> compute \(v - \langle u, s \rangle = \langle e, r \rangle + \mu \lfloor q/2 \rceil\); since \(\lvert \langle e, r\rangle\rvert \ll q/4\) with high probability, output \(0\) if the result is closer to \(0\) than to \(\lfloor q/2\rceil\), and \(1\) otherwise.
</div>

<div class="theorem">
<strong>Theorem 6.2 (Security).</strong> If decision LWE\((n,q,\chi)\) is hard, then Regev's scheme is IND-CPA-secure.
</div>

<div class="proof">
<strong>Proof sketch.</strong> By LWE, the public key \((A, b)\) is computationally indistinguishable from uniform \((A, u)\). With uniform \(b\), the leftover hash lemma (or a simple counting argument when \(m \ge (n+1)\log q + \omega(\log n)\)) shows that \((A r, b^\top r)\) is statistically close to uniform, so the ciphertext hides \(\mu\).
</div>

## 6.2 Dual Regev and the SIS/LWE duality

Dual Regev (Gentry--Peikert--Vaikuntanathan 2008) reverses the roles. The public key is a uniform \(A \in \mathbb{Z}_q^{n\times m}\); the secret key is a short \(e \in \mathbb{Z}^m\) with \(Ae = u\) for a chosen \(u \in \mathbb{Z}_q^n\) (i.e. an SIS-style trapdoor). To encrypt a bit \(\mu\), choose a random \(s \in \mathbb{Z}_q^n\), output \((c_0, c_1) = (A^\top s + e_0, u^\top s + e_1 + \mu \lfloor q/2 \rceil)\). Decrypting computes \(c_1 - \langle c_0, e\rangle\) to recover \(\mu\). The duality between primal and dual Regev reflects the duality between the two lattices \(\Lambda_q(A) = A^\top \mathbb{Z}_q^n + q\mathbb{Z}^m\) and \(\Lambda_q^\perp(A)\), which are scalings of each other's duals. Dual Regev plays a foundational role in identity-based encryption (where \(u\) is derived from a user identity) and in the hierarchical IBE constructions of Cash, Hofheinz, Kiltz, and Peikert.

## 6.3 FrodoKEM and the Lindner--Peikert variant

<div class="example">
<strong>Example 6.3 (Lindner--Peikert encryption).</strong> The Lindner--Peikert scheme (PKC 2011) replaces Regev's binary randomness \(r \in \{0,1\}^m\) with a Gaussian-distributed \(r\), pushing security back to LWE itself rather than to the leftover hash lemma. This permits \(m\) to equal \(n\), shrinking ciphertexts by a factor of \(\log q\) and serving as the template for the LWE-based KEMs deployed today.
</div>

<div class="example">
<strong>Example 6.4 (FrodoKEM).</strong> FrodoKEM (Bos et al. 2016, NIST PQC alternate finalist) is a "no algebraic structure" KEM built directly on plain LWE with a matrix-valued public key \(B = A S + E \in \mathbb{Z}_q^{n\times \bar n}\). It avoids ring or module structure and therefore avoids any speculation about ideal-lattice attacks; the cost is a much larger key size (around 15 KB at category 1). FrodoKEM serves as the conservative benchmark against which structured schemes such as Kyber are compared.
</div>

# Chapter 7: Discrete Gaussians and Trapdoor Sampling

The technical workhorse linking lattice geometry to cryptography is the discrete Gaussian distribution on a lattice. A great deal of modern lattice cryptography — from worst-case reductions to digital signatures — depends on being able to sample from this distribution efficiently, given a "good" basis.

<div class="definition">
<strong>Definition 7.1 (Discrete Gaussian).</strong> For a lattice \(\Lambda\), a center \(c \in \mathbb{R}^n\), and a parameter \(\sigma > 0\), define the Gaussian function \(\rho_{\sigma, c}(x) = \exp\bigl(-\pi \lVert x - c\rVert^2/\sigma^2\bigr)\) and its restriction to \(\Lambda\):

\[
D_{\Lambda, \sigma, c}(x) = \frac{\rho_{\sigma,c}(x)}{\rho_{\sigma,c}(\Lambda)}, \qquad x \in \Lambda,
\]

where \(\rho_{\sigma,c}(\Lambda) = \sum_{y \in \Lambda} \rho_{\sigma,c}(y)\).
</div>

<div class="definition">
<strong>Definition 7.2 (Smoothing parameter).</strong> The <em>smoothing parameter</em> \(\eta_\varepsilon(\Lambda)\) is the smallest \(\sigma\) such that \(\rho_{1/\sigma}(\Lambda^* \setminus \{0\}) \le \varepsilon\). Above this scale the discrete Gaussian behaves essentially like a continuous one: e.g. \(D_{\Lambda, \sigma, c} \bmod \mathcal P(B)\) is \(\varepsilon\)-close to uniform on \(\mathcal P(B)\).
</div>

The Klein--Gentry--Peikert--Vaikuntanathan algorithm samples \(D_{\Lambda, \sigma, c}\) given any basis \(B\) provided \(\sigma \ge \max_i \lVert \tilde b_i \rVert \cdot \omega(\sqrt{\log n})\). The shorter the Gram--Schmidt vectors of \(B\), the smaller the achievable \(\sigma\), and consequently the shorter the sampled vectors. Peikert's later "convolution" sampler and the Micciancio--Peikert "perturbation" technique drop the \(\omega(\sqrt{\log n})\) factor in important regimes.

## 7.1 Trapdoors and GPV signatures

A **trapdoor** for a uniformly random \(A \in \mathbb{Z}_q^{n\times m}\) is a basis of \(\Lambda_q^\perp(A)\) with small Gram--Schmidt norms. Ajtai (1999) and later Alwen--Peikert (2009) and Micciancio--Peikert (2012) constructed efficient algorithms to sample \((A, T)\) where \(A\) is statistically close to uniform and \(T\) is such a short basis. Given the trapdoor, one can sample short preimages: for any target \(u\), one can produce \(z\) with \(Az = u\) and \(\lVert z\rVert \le O(\sqrt{n \log q})\), distributed as a discrete Gaussian.

<div class="definition">
<strong>Construction 7.3 (GPV signatures).</strong> The verification key is a uniform \(A\); the signing key is a trapdoor \(T\). To sign a message \(\mu\), set \(u = H(\mu) \in \mathbb{Z}_q^n\) for a hash function \(H\) modelled as a random oracle, then sample a short preimage \(z\) with \(A z = u\) using \(T\). The signature is \(z\). Verification checks \(A z = H(\mu)\) and that \(\lVert z\rVert\) is small.
</div>

Security in the random-oracle model reduces to SIS: a forger producing \((\mu, z)\) for a fresh \(\mu\) yields a short \(z\) with \(Az = H(\mu)\), and combined with the simulator's response one extracts a short SIS solution. The discrete Gaussian distribution is essential here: it is the only known way to sample preimages whose distribution does not leak the trapdoor. The NIST-standardized **Falcon** signature is a Ring-version of GPV using NTRU lattices and the fast Fourier sampler of Ducas--Prest, enabling signatures of about 666 bytes at category 1.

# Chapter 8: Algebraically Structured Lattices

Plain LWE is too costly for many applications: a public key is \(O(n^2)\) ring elements. Replacing \(\mathbb{Z}\) by a polynomial ring squashes this to \(O(n)\), at the price of introducing algebraic structure that one must trust does not leak.

## 8.1 Ring-LWE

Let \(R = \mathbb{Z}\left[x\right]/\Phi_m(x)\) for a cyclotomic polynomial \(\Phi_m\) of degree \(n = \varphi(m)\), and \(R_q = R/qR\). The ring \(R\) is itself a lattice (under the canonical embedding into \(\mathbb{R}^n\) or \(\mathbb{C}^n\)), called the *ring of integers* of the \(m\)-th cyclotomic field; the resulting lattice has rich algebraic symmetry.

<div class="definition">
<strong>Definition 8.1 (Ring-LWE, simplified).</strong> Fix \(R, q, \chi\) (a Gaussian on \(R\)). For a secret \(s \in R_q\), an RLWE sample is \((a, b) \in R_q \times R_q\) with \(a\) uniform and \(b = a \cdot s + e\) where \(e \leftarrow \chi\). The decision RLWE problem is to distinguish such samples from uniform.
</div>

<div class="theorem">
<strong>Theorem 8.2 (Lyubashevsky--Peikert--Regev 2010).</strong> For appropriate cyclotomic \(R\), modulus \(q\), and Gaussian width, decision RLWE is at least as hard (under a quantum reduction) as worst-case approximate-SIVP on <em>ideal lattices</em> in \(R\), i.e. lattices arising as ideals of \(R\).
</div>

A single RLWE sample compresses \(n\) plain-LWE samples sharing the same secret into \(O(n)\) bits, with multiplication in \(R_q\) computable in \(O(n \log n)\) using the Number Theoretic Transform. This is what gives RLWE-based schemes their speed advantage.

<div class="remark">
<strong>Remark 8.3 (Module-LWE).</strong> Module-LWE (Langlois--Stehlé 2015) interpolates between plain LWE and RLWE: secrets and samples are vectors of \(R\)-elements, of dimension \(k\). With \(k=1\) one recovers RLWE; with \(R = \mathbb{Z}\) one recovers LWE. The Kyber KEM uses Module-LWE with small \(k\) (2, 3, or 4), keeping \(R\) the same across security levels, which makes it easier to scale security without re-implementing arithmetic.
</div>

## 8.2 NTRU

The NTRU cryptosystem (Hoffstein, Pipher, Silverman, 1996) predates LWE and uses a distinct algebraic problem. Let \(R = \mathbb{Z}\left[x\right]/(x^n - 1)\) (or \(x^n + 1\)) and choose two short polynomials \(f, g \in R\) with \(f\) invertible mod \(q\). The public key is \(h = g \cdot f^{-1} \bmod q\); the secret key is \((f, g)\). The hardness assumption is that distinguishing \(h\) from a uniform element of \(R_q\) is intractable. NTRU encryption pairs short messages with this trapdoor structure; modern constructions (NTRU Prime, Falcon's underlying trapdoor) refine the parameter choices to defeat known subfield-lattice attacks of Albrecht--Bai--Ducas (2016), which exploit large modulus and overstretched parameters.

# Chapter 9: Fiat--Shamir Signatures and Dilithium

The Fiat--Shamir transform converts an identification scheme (a three-message public-coin protocol) into a signature scheme by replacing the verifier's challenge with a hash of the commitment and message. Lyubashevsky's 2009 application of this transform to lattice problems is the source of the Dilithium signature standard.

## 9.1 Lyubashevsky's identification

<div class="definition">
<strong>Construction 9.1 (Lyubashevsky's lattice identification).</strong> Public key \(A \in R_q^{k \times \ell}\), secret \(\mathbf s \in R^\ell\) with small coefficients, satisfying \(\mathbf t = A \mathbf s\). The prover samples a "masking" vector \(\mathbf y\) from a wide distribution, sends commitment \(\mathbf w = A \mathbf y\); receives a short challenge \(c\); responds \(\mathbf z = \mathbf y + c \mathbf s\). The verifier checks \(A \mathbf z - c \mathbf t = \mathbf w\) and that \(\mathbf z\) is short.
</div>

The tension is that \(\mathbf z\) leaks information about \(\mathbf s\) unless the masking distribution is wide enough. To handle this, Lyubashevsky introduced **rejection sampling**: the prover restarts whenever \(\mathbf z\) lies outside a fixed region, ensuring the conditional distribution of \(\mathbf z\) is independent of \(\mathbf s\). This is one of the most elegant ideas in the field, and it eliminates the need for the expensive Gaussian preimage sampling that GPV-style signatures require.

<div class="example">
<strong>Example 9.2 (Dilithium / ML-DSA).</strong> The CRYSTALS-Dilithium signature scheme (Ducas, Kiltz, Lepoint, Lyubashevsky, Schwabe, Seiler, Stehlé 2018), now standardized by NIST as ML-DSA (FIPS 204), is the Fiat--Shamir transform of the above identification scheme over Module-LWE/Module-SIS. Optimizations include using a power-of-two cyclotomic \(R = \mathbb{Z}\left[x\right]/(x^{256}+1)\), a "high-bits" trick to compress commitments, and aggressive deterministic hashing of randomness for safety. Public keys are around 1.3 KB and signatures around 2.4 KB at category 2.
</div>

# Chapter 10: Kyber and Lattice-Based KEMs

CRYSTALS-Kyber (Bos, Ducas, Kiltz, Lepoint, Lyubashevsky, Schanck, Schwabe, Seiler, Stehlé 2018), standardized by NIST as ML-KEM (FIPS 203), is the dominant post-quantum key encapsulation mechanism. It is essentially a Module-LWE-based variant of Lindner--Peikert encryption combined with the Fujisaki--Okamoto transform to achieve IND-CCA security.

## 10.1 Construction

<div class="definition">
<strong>Construction 10.1 (Kyber.CPA, sketch).</strong> Parameters \(n=256\), small \(k\) (2, 3, or 4), small modulus \(q = 3329\), centered binomial error \(\chi\). <em>KeyGen:</em> sample \(\mathbf A \in R_q^{k\times k}\) (uniform from a hash of a seed), \(\mathbf s, \mathbf e \leftarrow \chi^k\); output public key \((\mathbf A, \mathbf t = \mathbf A \mathbf s + \mathbf e)\), secret key \(\mathbf s\). <em>Encrypt</em> \(\mu \in \{0,1\}^n\): sample \(\mathbf r, \mathbf e_1 \leftarrow \chi^k\), \(e_2 \leftarrow \chi\); output \((\mathbf u = \mathbf A^\top \mathbf r + \mathbf e_1, v = \mathbf t^\top \mathbf r + e_2 + \lfloor q/2 \rfloor \mu)\). <em>Decrypt:</em> compute \(v - \mathbf s^\top \mathbf u\) and round each coefficient.
</div>

The Fujisaki--Okamoto transform then upgrades this to a chosen-ciphertext-secure KEM by using the message as a re-randomization seed and re-encrypting during decapsulation to detect tampering. Compression of ciphertext coefficients (dropping low-order bits) further shrinks bandwidth.

## 10.2 Concrete security

The security of Kyber, like every modern lattice KEM, is estimated by the cost of running BKZ to find a short vector in a particular embedded lattice (the so-called *primal attack*), or to distinguish via the dual attack. The *core-SVP* methodology estimates the cost as \(2^{0.292\,\beta}\) (classical sieving) or \(2^{0.265\,\beta}\) (quantum sieving) for the smallest block size \(\beta\) at which BKZ would succeed. Kyber's three parameter sets target NIST security categories 1, 3, and 5, corresponding roughly to AES-128, AES-192, and AES-256.

<div class="remark">
<strong>Remark 10.2.</strong> The exact relationship between core-SVP cost and "real" attack cost is subtle: memory access patterns for sieving in dimension 400+ are well outside experimentally validated regimes, and some critics — notably the authors of the 2022 "MATZOV" report — argue the standardized parameters may be more or less conservative than the headline numbers suggest. This is an active topic in the post-quantum cryptanalysis literature.
</div>

# Chapter 11: Fully Homomorphic Encryption

Lattice cryptography is unique among public-key paradigms in supporting *fully homomorphic encryption* (FHE), a scheme that lets a server compute on encrypted data without decrypting it. Gentry's 2009 thesis was the breakthrough; the current generation of schemes — BGV, BFV, CKKS — descends from it.

## 11.1 The basic homomorphism

The homomorphic property comes "for free" from LWE-based encryption. If \((u_i, v_i)\) encrypts \(\mu_i\) under secret \(s\), then \((u_1 + u_2, v_1 + v_2)\) encrypts \(\mu_1 + \mu_2 \bmod 2\), since the noise terms simply add. Multiplication is harder: it produces a ciphertext under a tensored secret \(s \otimes s\) with noise that grows quadratically; one then performs **relinearization** using a "key-switching" public key to convert back to a ciphertext under \(s\).

The fundamental obstacle is noise growth. After many operations the noise saturates and decryption fails. Gentry's seminal idea was **bootstrapping**: homomorphically evaluate the decryption circuit, using the encryption of the secret key as auxiliary input, to "refresh" a noisy ciphertext into a less-noisy one encrypting the same plaintext. Provided the scheme can homomorphically evaluate its own decryption with budget to spare, one obtains unbounded computation. This requires a circular-security assumption (the scheme remains secure when given an encryption of its own secret key), an assumption with no known reduction but also no known attack.

## 11.2 BGV, BFV, CKKS, and TFHE

<div class="definition">
<strong>Construction 11.1 (BGV/BFV).</strong> Both schemes use Ring-LWE with plaintext modulus \(t \ll q\). BGV (Brakerski--Gentry--Vaikuntanathan 2012) places the message in the least significant bits, with coefficients in \(\mathbb{Z}_t\); BFV (Brakerski 2012; Fan--Vercauteren 2012) places it in the most significant bits, scaling by \(\lfloor q/t\rceil\). Both support exact integer arithmetic modulo \(t\); BFV is slightly simpler to parameterize and is implemented in libraries such as Microsoft SEAL.
</div>

<div class="definition">
<strong>Construction 11.2 (CKKS).</strong> CKKS (Cheon--Kim--Kim--Song 2017) encodes <em>real or complex numbers</em> with a fixed-precision encoding, treating the noise as part of a controlled approximation error. Multiplication grows the scale, requiring a <em>rescaling</em> step that drops the modulus level. CKKS underlies most practical homomorphic machine-learning deployments.
</div>

The "leveled" BGV/BFV/CKKS schemes support a fixed depth of operations without bootstrapping; bootstrapping is added when unbounded depth is needed, at substantial cost. The TFHE family (Chillotti--Gama--Georgieva--Izabachène) takes a different route, supporting fast bootstrapping after every gate at the cost of slower bulk arithmetic, which is the better choice for circuits of irregular structure.

# Chapter 12: Concrete Security and Parameter Selection

A theoretically secure scheme is useless without parameters. Lattice cryptography has developed a sophisticated, if still partly heuristic, framework for choosing them.

## 12.1 The attack toolbox

Given an LWE instance \((A, b = As + e)\) with \(A \in \mathbb{Z}_q^{m\times n}\), three families of attacks dominate.

The **primal attack** embeds the LWE instance in a lattice via Kannan's construction. The relevant lattice

\[
\Lambda = \left\{ (x, y, z) : \left[A \mid I_m \mid -b\right] \begin{pmatrix} x \\ y \\ z \end{pmatrix} \equiv 0 \pmod q \right\}
\]
contains the unusually short vector \((s, e, 1)\). Running BKZ-\(\beta\) on a basis of (a sublattice of) \(\Lambda\) recovers this short vector when \(\beta\) is large enough that the projected length of \((s,e,1)\) onto the last block is shorter than the Gaussian-heuristic length of the projected lattice — the so-called "2016 estimate" of Alkim--Ducas--Pöppelmann--Schwabe.

The **dual attack** seeks short vectors in \(\Lambda_q^\perp(A)\); applying such a vector \(w\) to \(b\) yields \(\langle w, b\rangle = \langle w, e\rangle\), distinguishable from uniform when \(w\) is short enough. Recent improvements by Guo--Johansson and the MATZOV team combine dual reduction with brute-force enumeration of secret coordinates.

**Combinatorial attacks** (BKW of Blum--Kalai--Wasserman, Arora--Ge linearization for very small noise) target sparse-secret or low-noise regimes. None is competitive against well-parameterized cryptographic LWE.

## 12.2 The LWE estimator

<div class="remark">
<strong>Remark 12.1.</strong> Albrecht, Player, and Scott's <em>LWE estimator</em> (2015, ongoing on GitHub) is an open-source script that, given concrete \(n, q, \chi\), reports the cost of the best known attacks under several models. Designers of Kyber, Dilithium, and Frodo all use a version of it; differences in the choice of cost model (core-SVP vs. memory-aware, classical vs. quantum) are responsible for most disagreements about post-quantum parameter sets.
</div>

The general design philosophy is: pick \(n\) and \(q\) so that the smallest BKZ block size that breaks the scheme is at least \(\beta \approx 400\) (for category 1) or higher; check that the error distribution gives correct decryption with overwhelming probability; ensure the modulus is small enough for efficient NTT-based arithmetic. A modulus \(q \equiv 1 \pmod {2n}\) admits a length-\(n\) NTT, cutting multiplication costs to \(O(n \log n)\); Kyber's choice of \(q = 3329\) and \(n = 256\) is calibrated precisely to fit this constraint while keeping coefficients small enough to multiply in 16-bit words.

## 12.3 Outlook

The standardization of Kyber and Dilithium in 2024, and the rollout of hybrid post-quantum TLS in 2024--2025 by Cloudflare, Google, and Apple, have moved lattice cryptography from a research curiosity to deployed infrastructure within a single decade. The conjecture that \(\mathsf{GapSVP}_\gamma\) and \(\mathsf{SIVP}_\gamma\) for polynomial \(\gamma\) resist quantum attack — the foundation of every post-quantum lattice scheme — remains untouched, though the gap between theoretical worst-case-to-average-case reductions and the parameters actually deployed remains large.

Sharpening this gap, probing the algebraic structure introduced by RLWE and Module-LWE, refining sieving algorithms, and finding new applications of trapdoor sampling and FHE are the central research directions of the next decade. The reader who has followed the geometry of Chapter 1 through the deployed standards of Chapters 9 and 10 should now be equipped to read Peikert's survey, the NIST submissions, and the latest cryptanalytic preprints with confidence — and, more importantly, to recognize in any new construction the recurring melody of short vectors, noisy linear equations, and the Gaussian distributions that connect them.
