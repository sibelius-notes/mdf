---
title: "PMATH 990: Random Matrix Theory"
subjects: PMATH
prof: Andu Nica
---

## Sources

- Anderson, G. W., Guionnet, A., & Zeitouni, O. (2010). *An Introduction to Random Matrices*. Cambridge University Press.
- Mingo, J. A., & Speicher, R. (2017). *Free Probability and Random Matrices*. Springer (GTM 202).
- Tao, T. (2012). *Topics in Random Matrix Theory*. Graduate Studies in Mathematics 132, AMS.
- Kemp, T. *Lecture notes on random matrices*. University of California, San Diego.
- Speicher, R. *Free probability theory and random matrices*. Lecture notes.

---

## 1. Random Matrix Spaces and Probability Measures

### Haar measure on compact Lie groups

A central theme in RMT is the study of random matrices distributed according to Haar measure, the unique probability measure on a compact Lie group that is left- and right-invariant.

For the unitary group \(U(n)\), Haar measure \(\mu_{U(n)}\) is the normalized, rotationally-invariant probability measure. Any random unitary matrix \(U\) sampled from Haar measure is a uniform random element of \(U(n)\). This distributional choice arises naturally when one wants a "generic" random matrix with no preferred direction—it is the maximum-entropy distribution subject only to the unitarity constraint.

**Key facts:**
- Haar measure is unique for each compact group.
- For \(U(n)\), matrix entries are **not** independent; instead, the distribution respects the constraint that \(U^* U = I\).
- The eigenvalues of a Haar-random unitary matrix are distributed on the circle \(|z| = 1\) in the complex plane.
- Expectations of polynomials in entries are determined by combinatorial structures (permutations and pairings); this is the starting point for Weingarten calculus.

### Wigner matrices and the semicircle law

A **Wigner matrix** \(W\) is an \(n \times n\) random Hermitian matrix whose entries above the diagonal are i.i.d. (or approximately so) with mean 0 and variance \(\sigma^2\). The diagonal entries are often real and i.i.d. as well. The matrix is completed to be Hermitian by setting \(W_{ij} = \overline{W_{ji}}\).

**Fundamental theorem:** The empirical spectral distribution (ESD) of \(W_n / \sqrt{n}\) converges weakly to the **semicircle law** with density

\[\rho_{\text{sc}}(x) = \frac{1}{2\pi\sigma^2} \sqrt{4\sigma^2 - x^2} \quad \text{for } |x| \le 2\sigma\]

This is one of the most important results in RMT:
- The eigenvalues of a large random Hermitian matrix are distributed according to a smooth density.
- The support is an interval (with semicircle shape when plotted).
- This holds under very general conditions on the entries (Wigner's semicircle law).

**Mechanism:** The semicircle law emerges from a balance between the random perturbations and the growing dimension \(n\). When we scale by \(1/\sqrt{n}\), the spectrum stabilizes in the limit.

### Probability measures and density of states

In the context of RMT, a **probability measure** \(\mu\) on \(\mathbb{R}\) (or \(\mathbb{C}\)) represents the distribution of eigenvalues. The **density of states** or **empirical spectral distribution** is the histogram of eigenvalues normalized to be a probability measure.

For a deterministic or random Hermitian matrix \(M_n\) with eigenvalues \(\lambda_1, \ldots, \lambda_n\), the empirical spectral distribution is

\[\mu_n = \frac{1}{n} \sum_{j=1}^{n} \delta_{\lambda_j}\]

In the limit \(n \to \infty\), the weak limit of \(\mu_n\) is the limiting spectral distribution. The semicircle law is an example of such a limit.

---

## 2. Weingarten Calculus for Unitary Groups

### Motivation and formal setup

When a unitary matrix \(U\) is drawn from Haar measure on \(U(n)\), the entries \(U_{ij}\) are random variables satisfying \(U^* U = I\). A fundamental problem is computing expectations of polynomials in these entries, such as

\[\mathbb{E} U_{i_1 j_1} U_{i_2 j_2} \cdots U_{i_k j_k}\]

The unitarity constraint makes direct computation difficult: the entries are not independent.

**Weingarten calculus** provides a systematic method to evaluate such expectations in terms of the Weingarten function, a quantity depending on \(n\) and combinatorial data (permutations).

### The Weingarten function

Let \(\pi, \sigma \in S_k\) be permutations of \(\{1, \ldots, k\}\). The **Weingarten function** \(\text{Wg}(\pi \sigma^{-1}, n)\) is defined implicitly by the orthogonality relation:

\[\sum_{\tau \in S_k} \text{Wg}(\tau, n) \cdot \frac{\chi_\pi(\tau) \chi_\sigma(\tau)}{d_\tau}\]

where \(d_\tau\) is the dimension of the irreducible representation of \(S_k\) labeled by \(\tau\).

Equivalently (and more directly), Weingarten functions can be computed from the **unitary case formula**:

\[\mathbb{E}[U_{i_1 j_1} \cdots U_{i_k j_k}] = \sum_{\pi, \sigma \in S_k} \delta_{i_\pi} \delta_{j_\sigma} \text{Wg}(\pi^{-1}\sigma, n)\]

where the Kronecker deltas enforce that the free indices match up correctly.

### Asymptotic behavior

For large \(n\), the Weingarten function has an expansion in powers of \(1/n\):

\[\text{Wg}(\pi \sigma^{-1}, n) = \frac{1}{n^{2c(\pi\sigma^{-1})}} \left( g_0(\pi\sigma^{-1}) + O(1/n^2) \right)\]

where \(c(\pi\sigma^{-1})\) is the number of cycles in the permutation \(\pi^{-1}\sigma\) acting on pairs (not individual elements), and \(g_0\) is the leading-order Weingarten function.

**Key insight:** Only permutations \(\pi, \sigma\) such that the pair structure is planar (i.e., the permutation is non-crossing in an appropriate sense) contribute to the leading order. This is why Weingarten calculus naturally uncovers the Catalan numbers and free probability.

### Applications

Weingarten calculus is used to:
- Compute moments of Haar-random unitary matrices.
- Evaluate traces of products of random unitary matrices.
- Establish asymptotic freeness of random unitary matrices.
- Derive the asymptotic eigenvalue distribution of products and sums of random matrices.

---

## 3. Spectral Properties of Random Hermitian Matrices

### Spectrum and eigenvalues

The **spectrum** \(\sigma(M)\) of a Hermitian matrix \(M\) is the set of its eigenvalues (all real). The **empirical spectral measure** is the distribution of eigenvalues, normalized by \(1/n\).

For a sequence of random Hermitian matrices \(M_n\), we study:
- **Limiting spectral distribution (LSD):** the weak limit of the empirical spectral distribution.
- **Bulk eigenvalues:** those in the interior of the support of the LSD.
- **Edge eigenvalues:** those near the boundary of the support.

### Resolvent and Green's function

The **resolvent** of a matrix \(M\) is

\[R_z(M) = (M - zI)^{-1} = \int_\mathbb{R} \frac{d\mu(t)}{t - z}\]

where \(\mu\) is the spectral measure. For large random matrices, we study the resolvent \(R_z(M_n)\) as \(n \to \infty\).

The **Stieltjes transform** of a probability measure \(\mu\) is

\[m_\mu(z) = \int_\mathbb{R} \frac{d\mu(t)}{t - z}\]

which is the \((1,1)\) entry of the resolvent when \(\mu\) is the limiting spectral distribution. Inverting the Stieltjes transform recovers the density of the measure (when it exists).

### Concentration and deviations

Large deviations theory quantifies the probability that the empirical spectral distribution deviates significantly from the limiting spectral distribution. For Wigner matrices, the rate function is the **Kullback-Leibler divergence**, and the probability of a large deviation is exponentially small in \(n\).

This rigor is crucial for establishing that the spectrum is "stable" and predictable in the limit.

---

## 4. Horn's Conjecture and Eigenvalue Inequalities

### The problem: constraints on sums

When \(A\) and \(B\) are \(n \times n\) Hermitian matrices with given spectra \(\lambda_1(A) \ge \cdots \ge \lambda_n(A)\) and \(\mu_1(B) \ge \cdots \ge \mu_n(B)\), what are the possible spectra of \(A + B\)?

This is a fundamental problem in spectral theory with applications to quantum mechanics, optimization, and random matrices.

### Horn's conjecture

In 1962, Alfred Horn conjectured that the possible spectra of \(A+B\) are exactly those satisfying a finite list of **Horn inequalities**. These are linear inequalities on the eigenvalues of \(A\), \(B\), and \(A+B\), encoded as a certain set of triples of permutations.

**Example:** The simplest Horn inequality is \(\lambda_1(A+B) \le \lambda_1(A) + \lambda_1(B)\), which follows from the maximal eigenvalue of a sum being at most the sum of maximal eigenvalues.

### The resolution: Knutson-Tao

In 1999, Knutson and Tao proved Horn's conjecture using techniques from combinatorics and representation theory. The proof relies on:
- **Littelmann's hive model**, a combinatorial structure that encodes eigenvalue constraints.
- **Gromov's theorem on equivariant cohomology** and convexity of moment maps.

The result is that Horn's inequalities characterize exactly which eigenvalue triples \((\lambda(A), \lambda(B), \lambda(A+B))\) are realizable.

### Connections to random matrices

In RMT, Horn's conjecture and related inequalities constrain the possible empirical spectral distributions of sums of random matrices. When sampling random matrices from Haar measure or Wigner ensembles, the law of large numbers and central limit theorem respect these spectral constraints.

---

## 5. GUE (Gaussian Unitary Ensemble) and Hermite Polynomials

### Definition of GUE

The **Gaussian Unitary Ensemble** (GUE) is the probability measure on the space of \(n \times n\) Hermitian matrices given by

\[d\mathbb{P}(M) = \frac{1}{Z_n} \exp\left( -\frac{n}{2} \text{tr}(M^2) \right) dM\]

where \(dM\) is the Lebesgue measure on Hermitian matrices, and \(Z_n\) is a normalization constant.

**Interpretation:** The GUE is a Gaussian distribution on the space of Hermitian matrices, with covariance structure chosen to be scaling-invariant in \(n\).

**Equivalent description:** The entries of a GUE matrix can be generated as:
- Diagonal entries: independent standard normal random variables.
- Off-diagonal entries: independent complex Gaussians with \(\text{Re}(M_{ij})\) and \(\text{Im}(M_{ij})\) independent \(N(0, 1/2)\).
- Complete the matrix to be Hermitian.

This makes GUE a "natural" random matrix ensemble from a Gaussian perspective.

### Joint eigenvalue distribution

For a GUE matrix \(M\), the eigenvalues \(\lambda_1, \ldots, \lambda_n\) have joint density

\[p(\lambda_1, \ldots, \lambda_n) = \frac{1}{Z_n} \prod_{i<j} |\lambda_i - \lambda_j|^2 \exp\left( -\frac{n}{2} \sum_{i=1}^{n} \lambda_i^2 \right)\]

This is a consequence of the Jacobian for the change of variables from matrix entries to eigenvalues and eigenvectors.

**Key feature:** The eigenvalues repel each other (the Vandermonde determinant \(\prod_{i<j} |\lambda_i - \lambda_j|^2 > 0\)), so they are unlikely to coincide. This is a hallmark of beta-ensembles with \(\beta = 2\).

### Hermite polynomials

The **probabilists' Hermite polynomials** \(H_n(x)\) satisfy

\[\int_\mathbb{R} H_n(x) H_m(x) e^{-x^2/2} dx = \sqrt{2\pi} \, n! \, \delta_{nm}\]

The **physicists' Hermite polynomials** \(\text{He}_n(x)\) satisfy

\[\int_\mathbb{R} \text{He}_n(x) \text{He}_m(x) e^{-x^2} dx = \sqrt{\pi} \, 2^n \, n! \, \delta_{nm}\]

The connection to GUE is that the **correlation kernel** of the eigenvalues can be expressed in terms of Hermite polynomials. Specifically, the \(k\)-point correlation function factors as a determinant of a kernel involving Hermite polynomials and their weights.

### Characteristic polynomial and orthogonal polynomials

The characteristic polynomial of a GUE matrix, evaluated at an energy \(E\), has a distribution that is related to the orthogonal polynomials with respect to the Gaussian weight. These orthogonal polynomial ensembles are a powerful tool for computing correlation functions and level statistics.

---

## 6. Bulk Eigenvalues: The Semicircle Law

### Convergence to the semicircle law

For Wigner matrices with appropriately scaled entries, the empirical spectral distribution converges almost surely to the semicircle law \(\rho_{\text{sc}}(x) = \frac{1}{2\pi}\sqrt{4-x^2}\) (for \(\sigma = 1\)).

This is one of the most robust results in RMT:
- It holds for a very wide class of entry distributions (sub-exponential tails suffice).
- It is universal: the limiting density does not depend on the specific distribution of the entries, only on the first two moments.
- The convergence is in the weak topology, and stronger convergence (e.g., in Wasserstein distance) also holds under suitable conditions.

### Proof ideas: method of moments

One classical proof uses the **method of moments**:

1. Compute the \(k\)-th moment of the empirical spectral distribution: \(m_k = \frac{1}{n} \text{tr}(W^k)\).
2. Show that \(\mathbb{E}[m_k] \to m_k^{\text{sc}}\), where \(m_k^{\text{sc}}\) is the \(k\)-th moment of the semicircle law.
3. The moments of the semicircle law are the Catalan numbers: \(m_k^{\text{sc}} = C_k = \frac{1}{k+1}\binom{2k}{k}\).
4. Conclude by the method of moments that the ESD converges to the semicircle law.

**Why Catalan numbers appear:** When expanding \(\text{tr}(W^k) = \sum_i \lambda_i^k\) and taking expectations, only certain permutations of the indices (those corresponding to pairings and non-crossing structures) contribute significantly. The combinatorics of these structures yields Catalan numbers.

### Local semicircle law

In addition to weak convergence of the ESD, one can prove the **local semicircle law**: for any interval of length \(\gg 1/n\), the number of eigenvalues in that interval is approximately \(n \rho_{\text{sc}}(x) \cdot \text{(interval length)}\). This is valid down to scales of order \(1/n\) or even smaller, depending on conditions.

The local semicircle law is crucial for proving results about edge eigenvalues and gap statistics.

### Universality

**Universality** is the principle that the bulk eigenvalue statistics depend only on the symmetry class of the matrix (e.g., Hermitian with real entries, complex Hermitian, etc.), not on the specific distributions of the entries.

For Hermitian matrices (the GUE symmetry class), the bulk level statistics are universal. This has been proven under increasingly general entry distributions.

---

## 7. Edge Eigenvalues: Tracy-Widom and Airy Limits

### The edge phenomenon

While the bulk eigenvalues are distributed according to the semicircle law, the **largest (and smallest) eigenvalues** exhibit different behavior. Near the edge of the support of the semicircle law (at \(x = 2\) for the standard semicircle), the eigenvalue fluctuations are smaller and follow a different distribution.

### Tracy-Widom distribution

The **Tracy-Widom distribution** \(F_2\) is the distribution of the largest eigenvalue of a GUE matrix (after appropriate centering and scaling). Its cumulative distribution function is

\[F_2(s) = \det(I - P_s)\]

where \(P_s\) is the projection operator onto the subspace spanned by parabolic cylinder functions (or Airy functions) in a certain integral operator. The notation \(\det(I - P_s)\) refers to the Fredholm determinant.

**Asymptotic behavior:**
- For \(s \to -\infty\): \(\log F_2(s) \sim -2^{-1} s^{3/2}\) (left tail is Gaussian).
- For \(s \to \infty\): \(1 - F_2(s) \sim C e^{-4s^{3/2}/3}\) (right tail is much heavier, sub-exponential).

### Airy kernel and Airy processes

The spectral density near the edge is described by the **Airy kernel**:

\[K_{\text{Ai}}(x, y) = \frac{\text{Ai}(x) \text{Ai}'(y) - \text{Ai}'(x) \text{Ai}(y)}{x - y}\]

where \(\text{Ai}(x)\) is the Airy function, a solution to the differential equation \(\text{Ai}''(x) - x \, \text{Ai}(x) = 0\).

The **Airy process** is a limiting point process of eigenvalues near the edge; its correlation functions are given by determinants of the Airy kernel.

### Proof strategy: steepest descent and Riemann-Hilbert problems

The proof that the largest eigenvalue is distributed according to the Tracy-Widom distribution uses several advanced techniques:
- **Steepest descent analysis** of integrals (e.g., contour integrals in the complex plane).
- **Riemann-Hilbert problems** to compute the asymptotics of orthogonal polynomials.
- Connection to the **Painlevé equations**, particularly Painlevé II.

The Tracy-Widom distribution can be expressed as a Painlevé transcendent, which relates edge eigenvalue statistics to the theory of integrable systems.

### Universality at the edge

Like the bulk, edge eigenvalue statistics are **universal**: the Tracy-Widom distribution appears as the edge behavior for a very wide class of random matrix ensembles (not just GUE). This universality extends to sample covariance matrices, sparse random graphs, and other structures.

---

## 8. Free Additive Convolution ⊞ and Free Probability

### Free independence and noncommutative probability

In classical probability, if \(X\) and \(Y\) are independent random variables, then \(\mathbb{E}[f(X) g(Y)] = \mathbb{E}[f(X)] \mathbb{E}[g(Y)]\) for all bounded measurable \(f, g\).

In **noncommutative (operator algebra) probability**, random variables are replaced by self-adjoint operators in a \(C^*\)- or von Neumann algebra, and the classical expectation is replaced by a **state** (a positive linear functional).

**Free independence** is a notion of independence that is more natural in the noncommutative setting. Two subalgebras (or sequences of noncommuting operators) are freely independent if certain mixed moments factor.

### Free additive convolution

The **free additive convolution** \(\mu \boxplus \nu\) of two probability measures \(\mu\) and \(\nu\) is the law of \(A + B\) when \(A\) and \(B\) are freely independent self-adjoint random variables with distributions \(\mu\) and \(\nu\) respectively.

**Key property:** The free additive convolution is determined by the **Voiculescu transform** (or \(R\)-transform):

\[R_{\mu \boxplus \nu} = R_\mu + R_\nu\]

The \(R\)-transform is defined implicitly from the Stieltjes transform:

\[m_\mu(z) = \frac{1}{z - R_\mu(m_\mu(z))}\]

(This is analogous to cumulants in classical probability, where the moment generating function of a sum of independent random variables is the product, and the cumulant generating function of the sum is the sum of cumulant generating functions.)

### Example: semicircle ⊞ semicircle

If \(\mu\) and \(\nu\) are both semicircle laws with variances \(\sigma^2\) and \(\tau^2\), then \(\mu \boxplus \nu\) is the semicircle law with variance \(\sigma^2 + \tau^2\).

This mirrors the classical fact that the sum of two independent Gaussians is Gaussian; here, the free sum of two semicircles is a semicircle.

### Computation of free convolutions

The \(R\)-transform can often be computed explicitly or inversed to recover the density of \(\mu \boxplus \nu\). In favorable cases, the free convolution is a classical (commutative) convolution of some other quantities, or can be described in terms of orthogonal polynomials.

### Atomic measures and the free Lévy-Khintchine formula

Free additive convolution also admits a Lévy-Khintchine representation: measures without an atom at 0 can be represented as free convolutions of a semicircle and atomic measures (point masses). This structure mirrors classical Lévy processes.

---

## 9. Asymptotic Free Independence

### Free independence in random matrix theory

One of the most powerful applications of free probability to RMT is the following:

**Theorem:** Let \(A_n\) and \(B_n\) be sequences of \(n \times n\) random Hermitian matrices such that:
1. Their empirical spectral distributions converge almost surely to limits \(\mu_A\) and \(\mu_B\).
2. They satisfy a "freeness" condition (e.g., they are independent, or one is invariant and the other is random).

Then the empirical spectral distribution of \(A_n + B_n\) converges to \(\mu_A \boxplus \mu_B\) (free additive convolution).

This is **remarkable** because it means that for large random matrices, independence in the usual sense is transformed into free independence in the limiting operator-algebraic sense.

### Applications to Wigner and covariance matrices

Consider a Wigner matrix \(W\) and an independent Wigner matrix \(W'\). The empirical spectral distribution of \(W + W'\) converges to the free convolution of two semicircle laws, which is itself a semicircle law (with increased variance). This can be proven directly by Weingarten calculus or by free probability.

For sample covariance matrices \(XX^*/n\) (where \(X\) is \(n \times m\) with i.i.d. entries) and independent Wigner matrices, asymptotic free independence determines the spectrum of their sum.

### Operator algebra interpretation

In the limit \(n \to \infty\), the random matrices \(A_n\) can be thought of as generating a von Neumann algebra (a limit of the matrix algebras \(M_n(\mathbb{C})\)). The empirical spectral distribution is the law of the self-adjoint element in the limit, with respect to the trace state.

Free independence is the independence notion natural to this operator-algebraic limit.

### Infinitesimal freeness and random matrices over finite fields

Beyond the classical case, free independence has been studied in random matrices over finite fields, over \(p\)-adic fields, and in operator algebras of various types. The asymptotic behavior (as dimension or degree goes to infinity) often exhibits freeness.

---

## 10. Free Probability and Connections to Noncommutative Geometry

### Voiculescu's approach to operator algebras

**Dan Voiculescu** introduced free probability in the late 1980s as a framework for understanding the structure of group factors (von Neumann algebras generated by a group).

A key motivation was the question: for which groups \(G\) is the group von Neumann algebra \(L(G)\) a **factor** (irreducible, with trivial center)?

In the case of free groups (e.g., free product \(F_n * F_m\)), Voiculescu showed using free probability that certain types of generators are freely independent, which implies that the von Neumann algebra is indeed a factor.

### Free probability spaces

A **free probability space** is a pair \((\mathcal{A}, \tau)\) where:
- \(\mathcal{A}\) is a unital algebra (often a \(C^*\)- or von Neumann algebra).
- \(\tau\) is a state (a linear functional with \(\tau(1) = 1\) and \(\tau(x^* x) \ge 0\)).

Random variables are self-adjoint elements of \(\mathcal{A}\). A subalgebra or family of subalgebras is freely independent if the mixed moments of elements from different subalgebras can be computed via a "freeness rule" (analogous to conditional expectations in classical probability).

### Noncommutative distributions

In free probability, a self-adjoint element \(a \in \mathcal{A}\) has a **noncommutative distribution** \(\mu_a\) determined by its moments:

\[\mu_a = \sum_{k=0}^\infty c_k \delta_k\]

where the \(c_k\) encode the moments (or free cumulants) of \(a\). The spectral measure (the usual distribution of eigenvalues in the finite-dimensional case) is recovered from these data when \(a\) is self-adjoint.

### Operator-valued free probability

An important extension is **operator-valued free probability**, where the state is replaced by a more general conditional expectation taking values in a subalgebra. This allows for a richer structure and applications to random matrix theory with dependent entries, or matrices over noncommutative ground rings.

### Noncommutative geometry and spectral triples

**Alain Connes'** noncommutative geometry program seeks to generalize differential geometry to noncommutative spaces (e.g., spaces described by noncommutative algebras rather than function rings).

A **spectral triple** is the noncommutative analog of a Riemannian manifold: it consists of a \(C^*\)-algebra \(\mathcal{A}\), a Hilbert space \(\mathcal{H}\), and a self-adjoint operator \(D\) (the "Dirac operator") satisfying certain axioms.

The **spectrum of \(D\)** plays the role of the "geometry" in the noncommutative space. In this sense, random matrix theory and free probability are relevant: the spectrum of random operators in noncommutative spaces, studied through free probability, describes the geometric features of the underlying space.

### Applications to quantum physics and gauge theory

Spectral triples have applications to:
- **Quantum mechanics**: the Dirac operator encoding the relativistic dynamics of fermions.
- **Standard Model physics**: constructing a spectral action that reproduces Einstein-Yang-Mills theory.
- **Quantum field theory**: understanding the structure of noncommutative field theories.

Free probability arises naturally when quantizing or analyzing random perturbations of these fundamental operators.

### Outlook: free probability in higher dimensions and free Lévy processes

Recent developments extend free probability to higher dimensions (free product of multiple copies of random variable), and develop a theory of **free Lévy processes** (noncommutative analogs of classical Lévy processes). Random matrix theory, via Weingarten calculus and asymptotic freeness, continues to be a primary source of examples and insight.

---

## Summary

Random matrix theory combines probability, spectral theory, combinatorics, and operator algebras. The phenomena are robust and universal:

- **Semicircle law:** Most large random Hermitian matrices have bulk eigenvalues distributed according to the semicircle density, independent of microscopic details.
- **Edge eigenvalues:** Near the boundary of the spectrum, the Tracy-Widom distribution and Airy kernel emerge, reflecting a delicate balance between eigenvalue repulsion and confinement.
- **Free probability:** In the limit of large dimension, independent random matrices become freely independent in the operator-algebraic sense. The free additive convolution governs the spectrum of sums of random matrices.
- **Weingarten calculus:** A rigorous framework for computing expectations of polynomials in entries of random unitary (and other) matrices, which encodes the combinatorics of permutations and pairings.
- **Connections:** Random matrix theory bridges discrete mathematics (combinatorics, permutations), continuous mathematics (analysis, PDEs, integrable systems), and operator algebras (von Neumann algebras, \(C^*\)-algebras, noncommutative geometry).

The merger of the W20 (Weingarten calculus, Horn's conjecture, bulk and edge statistics, GUE) and W25 (Wigner matrices, free probability, asymptotic freeness) offerings represents a comprehensive arc from computational techniques and concrete matrix ensembles to deep structural principles (free independence) that hold in the limit.
