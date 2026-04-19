---
title: "AMATH 740: Numerical Analysis"
subjects: "AMATH"
---

## Sources and References

These notes draw primarily from the following authoritative texts in numerical analysis:

- Trefethen, L. N. & Bau, D. III, *Numerical Linear Algebra* (SIAM, 1997). The canonical graduate reference for matrix methods, QR factorization, eigenvalue algorithms, and iterative solvers.
- Golub, G. H. & Van Loan, C. F., *Matrix Computations* (Johns Hopkins University Press, 4th ed., 2013). Comprehensive reference for LU, Cholesky, QR, SVD, and eigenvalue computations.
- Heath, M. T., *Scientific Computing: An Introductory Survey* (SIAM, 2nd ed., 2018; free PDF from SIAM). Broad coverage of floating-point arithmetic, root finding, interpolation, quadrature, and ODEs.
- Quarteroni, A., Sacco, R. & Saleri, F., *Numerical Mathematics* (Springer, 2nd ed., 2007). Rigorous treatment of error analysis, interpolation, numerical integration, and ODE methods.
- Saad, Y., *Iterative Methods for Sparse Linear Systems* (SIAM, 2nd ed., 2003; free PDF: cs.umn.edu/~saad/books). Definitive reference for Krylov subspace methods, GMRES, and preconditioning.
- Süli, E. & Mayers, D., *An Introduction to Numerical Analysis* (Cambridge University Press, 2003). Clear treatment of interpolation, differentiation, integration, and ODEs with careful error analysis.

---

# Chapter 1: Floating-Point Arithmetic and Error Analysis

## 1.1 The IEEE 754 Standard

Every numerical computation ultimately executes on hardware that can only represent a finite subset of the real numbers. The **IEEE 754 standard** (1985, revised 2008) defines the binary floating-point system used by virtually all modern processors. Understanding this standard is the prerequisite for understanding why numerical algorithms succeed or fail.

A **floating-point number** in base \(\beta\) with \(p\) digits of precision is represented as

\[
x = \pm \, m \cdot \beta^{e-p+1},
\]

where \(m\) is a \(p\)-digit integer (the **significand** or mantissa) and \(e\) is the **exponent** lying in a bounded range \([e_{\min}, e_{\max}]\). In the binary system (\(\beta = 2\)), IEEE 754 double precision uses \(p = 53\) bits for the significand and allocates 11 bits to the exponent, giving a total of 64 bits per number. The representable range is approximately \(2^{-1022}\) to \(2^{1023} \approx 1.8 \times 10^{308}\), with roughly 15–16 significant decimal digits.

The set of **normalized** double-precision floating-point numbers excludes zero and the smallest magnitudes (subnormal numbers handle those), requiring the leading bit of the significand to be 1. Because this bit is always 1, it need not be stored explicitly, which is why 52 stored bits yield 53 bits of precision. The special values \(\pm\infty\) and NaN (Not a Number) are also part of the standard and arise from operations like division by zero or \(\sqrt{-1}\).

## 1.2 Machine Epsilon and Rounding

**Machine epsilon** \(\varepsilon_{\mathrm{mach}}\) is defined as the smallest positive floating-point number such that

\[
\mathrm{fl}(1 + \varepsilon_{\mathrm{mach}}) > 1,
\]

equivalently, \(\varepsilon_{\mathrm{mach}} = \beta^{1-p}\). For IEEE 754 double precision, \(\varepsilon_{\mathrm{mach}} = 2^{-52} \approx 2.22 \times 10^{-16}\). This is not the smallest positive double (which is the subnormal \(2^{-1074}\)) but rather the gap between 1 and the next representable number larger than 1.

When a real number \(x\) is **rounded** to the nearest floating-point number \(\mathrm{fl}(x)\), the relative error satisfies

\[
\frac{|\mathrm{fl}(x) - x|}{|x|} \leq \frac{1}{2}\varepsilon_{\mathrm{mach}},
\]

provided \(x\) lies within the normal range. This bound is called the **unit roundoff** \(u = \frac{1}{2}\varepsilon_{\mathrm{mach}}\). Equivalently, \(\mathrm{fl}(x) = x(1+\delta)\) for some \(|\delta| \leq u\).

IEEE 754 mandates that the four basic operations \(+, -, \times, \div\) and the square root are computed **exactly and then rounded**, meaning the computed result \(\hat{z} = \mathrm{fl}(x \circ y)\) satisfies \(\hat{z} = (x \circ y)(1 + \delta)\) with \(|\delta| \leq u\). This property is central to Wilkinson-style backward error analysis.

## 1.3 Catastrophic Cancellation

**Catastrophic cancellation** occurs when two nearly equal numbers are subtracted, causing a dramatic loss of significant digits. Consider computing \(f(x) = \sqrt{x+1} - \sqrt{x}\) for large \(x\). Both square roots agree in their leading digits, and subtraction leaves only a few accurate bits in the result. The exact formula can be rewritten as

\[
f(x) = \frac{1}{\sqrt{x+1} + \sqrt{x}},
\]

which is numerically stable for all \(x > 0\). This rewriting—finding an algebraically equivalent form that avoids subtraction of nearby quantities—is the standard remedy for catastrophic cancellation.

A more subtle form occurs in the quadratic formula. When \(b^2 \gg 4ac\), the root

\[
r_1 = \frac{-b + \sqrt{b^2 - 4ac}}{2a}
\]

suffers severe cancellation if \(b > 0\). The stable approach computes the large-magnitude root first,

\[
r_2 = \frac{-b - \sqrt{b^2 - 4ac}}{2a},
\]

and then obtains the other via the identity \(r_1 r_2 = c/a\), giving \(r_1 = c/(a r_2)\).

## 1.4 Forward and Backward Error Analysis

Let \(f : \mathbb{R}^n \to \mathbb{R}^m\) be the mathematical problem we wish to solve and let \(\hat{f}\) denote the computed result. **Forward error analysis** tracks the accumulated rounding errors from each arithmetic operation forward through the computation, bounding the final error \(\|\hat{f}(x) - f(x)\|\). This is conceptually straightforward but often leads to overly pessimistic bounds because errors from different sources may partially cancel.

**Backward error analysis**, introduced by J. H. Wilkinson in the 1960s, takes the complementary view. Instead of asking "how far is the computed answer from the exact answer?", it asks "for what nearby input \(\hat{x}\) is the computed answer exact?" Formally, the **backward error** of the computation is

\[
\eta = \min\bigl\{ \|\hat{x} - x\| : \hat{f}(x) = f(\hat{x}) \bigr\}.
\]

If \(\eta\) is small relative to the data, the algorithm has done what the problem asked—it has solved a nearby problem exactly. Whether the computed solution \(\hat{f}(x) = f(\hat{x})\) is close to the true solution \(f(x)\) then depends on the **condition number** of \(f\), not on the algorithm.

## 1.5 Condition Numbers

The **condition number** of a problem measures how sensitive the output is to small perturbations in the input, independent of the algorithm used to solve it. For a differentiable function \(f : \mathbb{R} \to \mathbb{R}\) and scalar data \(x\), the relative condition number is

\[
\kappa = \frac{|x f'(x)|}{|f(x)|}.
\]

A problem with large \(\kappa\) is **ill-conditioned**: even if an algorithm introduces only a small backward error, the forward error may be large because the problem itself amplifies perturbations.

For a linear system \(Ax = b\), the condition number is \(\kappa(A) = \|A\| \|A^{-1}\|\). If \(A\) and \(b\) are perturbed by \(\delta A\) and \(\delta b\), the relative perturbation in the solution satisfies

\[
\frac{\|\delta x\|}{\|x\|} \lesssim \kappa(A) \left( \frac{\|\delta A\|}{\|A\|} + \frac{\|\delta b\|}{\|b\|} \right).
\]

When \(\kappa(A)\) is large (near \(1/\varepsilon_{\mathrm{mach}}\)), the matrix is nearly singular and no algorithm—however stable—can be expected to compute an accurate solution, because the problem itself is intrinsically sensitive. An algorithm is called **backward stable** if its backward error is of order \(u\); combined with a reasonably conditioned problem, this guarantees accuracy.

## 1.6 Stability of Algorithms: Wilkinson's Paradigm

**Wilkinson's backward error analysis** provides a systematic framework for proving that a given algorithm is backward stable. The key insight is that floating-point arithmetic satisfies the fundamental model \(\mathrm{fl}(a \circ b) = (a \circ b)(1 + \delta)\) with \(|\delta| \leq u\), and a sequence of \(n\) such operations introduces relative errors bounded by \(n u\) to first order (ignoring higher-order terms in \(u\)).

Wilkinson applied this framework to prove that Gaussian elimination with partial pivoting is backward stable: the computed solution \(\hat{x}\) satisfies \((A + \delta A)\hat{x} = b\) where \(\|\delta A\|_\infty \leq \rho_n \cdot 2^{n-1} u \|A\|_\infty\) and \(\rho_n\) is the **growth factor**. For partial pivoting, \(\rho_n \leq 2^{n-1}\) in theory, but in practice it is typically \(O(n^{2/3})\) or less, making the algorithm reliably backward stable.

The distinction between a **stable** algorithm (backward error of size \(u\)) and an **unstable** one (backward error much larger than \(u\)) is fundamental. For example, the classical Gram-Schmidt process for QR factorization can be numerically unstable when the input vectors are nearly linearly dependent, while the modified Gram-Schmidt process and Householder reflectors remain stable.

---

# Chapter 2: Root Finding

## 2.1 Bisection Method

The **bisection method** is the simplest and most reliable root-finding algorithm. Given a continuous function \(f : [a,b] \to \mathbb{R}\) with \(f(a) f(b) < 0\), the intermediate value theorem guarantees at least one root in \((a,b)\). The method repeatedly halves the interval, retaining the subinterval on which a sign change persists.

At each step, the interval has length \((b-a)/2^n\) after \(n\) bisections, so the error in the midpoint approximation satisfies

\[
|x_n - x^*| \leq \frac{b-a}{2^{n+1}}.
\]

To achieve an error below \(\varepsilon\), we need \(n \geq \log_2\bigl((b-a)/\varepsilon\bigr)\) steps. Bisection exhibits **linear convergence** (also called first-order convergence) with rate 1/2: the error at each step is exactly half that of the previous step. While it converges slowly compared to Newton's method, bisection is guaranteed to converge for any continuous function with a sign change and requires no derivative information.

## 2.2 Newton–Raphson Method

The **Newton–Raphson method** is derived by linearizing \(f\) about the current iterate \(x_n\):

\[
0 \approx f(x_n) + f'(x_n)(x - x_n),
\]

giving the iteration

\[
x_{n+1} = x_n - \frac{f(x_n)}{f'(x_n)}.
\]

**Quadratic convergence.** Suppose \(f\) is twice continuously differentiable and \(x^*\) is a simple root (\(f(x^*) = 0\), \(f'(x^*) \neq 0\)). Let \(e_n = x_n - x^*\) denote the error at step \(n\). By Taylor's theorem,

\[
0 = f(x^*) = f(x_n) - e_n f'(x_n) + \frac{e_n^2}{2} f''(\xi_n)
\]

for some \(\xi_n\) between \(x_n\) and \(x^*\). Therefore

\[
f(x_n) = e_n f'(x_n) - \frac{e_n^2}{2} f''(\xi_n),
\]

and

\[
e_{n+1} = x_{n+1} - x^* = x_n - \frac{f(x_n)}{f'(x_n)} - x^* = e_n - \frac{f(x_n)}{f'(x_n)}.
\]

Substituting,

\[
e_{n+1} = \frac{e_n^2 f''(\xi_n)}{2 f'(x_n)}.
\]

As \(n \to \infty\), \(x_n \to x^*\), so \(f'(x_n) \to f'(x^*) \neq 0\) and \(f''(\xi_n) \to f''(x^*)\), giving the asymptotic formula

\[
e_{n+1} \approx \frac{f''(x^*)}{2 f'(x^*)} \, e_n^2.
\]

This is **quadratic convergence**: the number of correct digits roughly doubles at each step. Newton's method converges superlinearly from any sufficiently good starting point near a simple root, but it can fail to converge or converge to an unexpected root if the initial guess is poor, if \(f'\) vanishes, or if the function has a complicated global structure.

**Multiple roots.** At a root of multiplicity \(m \geq 2\), \(f(x^*) = f'(x^*) = \cdots = f^{(m-1)}(x^*) = 0\) but \(f^{(m)}(x^*) \neq 0\). Standard Newton's method degrades to **linear convergence** with rate \(1 - 1/m\). A modified iteration,

\[
x_{n+1} = x_n - m \cdot \frac{f(x_n)}{f'(x_n)},
\]

restores quadratic convergence but requires knowledge of \(m\).

## 2.3 Secant Method

The **secant method** approximates \(f'\) by a finite difference to avoid computing derivatives:

\[
x_{n+1} = x_n - f(x_n) \cdot \frac{x_n - x_{n-1}}{f(x_n) - f(x_{n-1})}.
\]

The convergence order is the golden ratio \(\phi = (1+\sqrt{5})/2 \approx 1.618\), which is superlinear but subquadratic. The derivation proceeds by showing that the error satisfies \(|e_{n+1}| \approx C |e_n|^\phi\). The secant method requires two starting points and two function evaluations per root found (amortized to one evaluation per step after the first), making it more efficient than Newton when derivatives are expensive.

## 2.4 Fixed-Point Iteration and the Banach Contraction Mapping Theorem

A **fixed point** of a function \(g : \mathbb{R} \to \mathbb{R}\) is a value \(x^*\) with \(g(x^*) = x^*\). Any root-finding problem \(f(x) = 0\) can be converted to a fixed-point problem by choosing \(g(x) = x - \alpha(x) f(x)\) for some non-zero function \(\alpha(x)\); Newton's method corresponds to \(\alpha(x) = 1/f'(x)\).

<div class="theorem">
<strong>Banach Contraction Mapping Theorem.</strong> Let \(g : [a,b] \to [a,b]\) be a contraction, meaning there exists \(L \in (0,1)\) such that \(|g(x) - g(y)| \leq L |x-y|\) for all \(x, y \in [a,b]\). Then \(g\) has a unique fixed point \(x^* \in [a,b]\), and the iteration \(x_{n+1} = g(x_n)\) converges to \(x^*\) for any starting point \(x_0 \in [a,b]\), with error bound \(|x_n - x^*| \leq L^n |x_0 - x^*|\).
</div>

For smooth \(g\), the contraction condition near \(x^*\) is equivalent to \(|g'(x^*)| < 1\). The convergence is linear with rate \(L = |g'(x^*)|\). Newton's method can be viewed as a fixed-point iteration for \(g(x) = x - f(x)/f'(x)\), and since \(g'(x^*) = 0\) at a simple root, the convergence is superlinear—indeed quadratic.

## 2.5 Brent's Method

**Brent's method** combines the reliability of bisection with the speed of the secant method and inverse quadratic interpolation. At each step, it chooses between bisection and interpolation based on whether the interpolated step falls within the current bracket and represents a sufficient improvement. This gives guaranteed convergence (at least linear, like bisection) with superlinear speed in practice, making it the standard "black-box" root-finder in many software libraries.

## 2.6 Multivariate Newton's Method

For a system of nonlinear equations \(F(x) = 0\) where \(F : \mathbb{R}^n \to \mathbb{R}^n\), Newton's method generalizes to

\[
x_{n+1} = x_n - J_F(x_n)^{-1} F(x_n),
\]

where \(J_F\) is the **Jacobian matrix** with entries \((J_F)_{ij} = \partial F_i / \partial x_j\). In practice, one does not compute \(J_F^{-1}\) explicitly; instead, at each step one solves the linear system

\[
J_F(x_n) \, \delta x = -F(x_n), \quad x_{n+1} = x_n + \delta x,
\]

using Gaussian elimination or another direct method. The convergence is again quadratic near a simple root (where \(J_F(x^*)\) is nonsingular), using the multivariate analog of the error analysis above.

---

# Chapter 3: Linear Systems — Direct Methods

## 3.1 LU Decomposition with Partial Pivoting

**Gaussian elimination** is the foundational algorithm for solving \(Ax = b\) where \(A \in \mathbb{R}^{n \times n}\). The idea is to factor \(A\) into a lower triangular factor \(L\) and an upper triangular factor \(U\) such that \(PA = LU\), where \(P\) is a permutation matrix encoding the row swaps (**partial pivoting**). The system then reduces to two triangular solves: \(Ly = Pb\) and \(Ux = y\).

**Derivation of LU.** At the \(k\)-th step of elimination, the pivot is chosen as the element of maximum absolute value in column \(k\) at or below the diagonal. This corresponds to premultiplying by a permutation. The elimination subtracts multiples of row \(k\) from rows \(k+1, \ldots, n\); these multipliers, \(\ell_{ik} = a_{ik}^{(k)}/a_{kk}^{(k)}\), satisfy \(|\ell_{ik}| \leq 1\) by the pivoting strategy and form the entries of \(L\) below the diagonal.

After \(n-1\) stages, we have

\[
L_{n-1} P_{n-1} \cdots L_1 P_1 A = U,
\]

which, by careful bookkeeping of the permutations, gives \(PA = LU\) with \(L\) unit lower triangular (diagonal entries all 1) and \(U\) upper triangular.

**Stability analysis.** Define the **growth factor** \(\rho_n = \max_{i,j,k} |a_{ij}^{(k)}| / \max_{i,j} |a_{ij}|\). Wilkinson's analysis shows that the backward error of Gaussian elimination with partial pivoting satisfies \(\|\delta A\| \leq \rho_n \cdot c_n u \|A\|\) for a modest constant \(c_n\). The theoretical worst-case growth factor for partial pivoting is \(2^{n-1}\), achieved by specially constructed matrices, but in virtually all practical cases \(\rho_n = O(n^{1/3})\) or smaller, making partial pivoting reliable.

**Computational cost.** LU factorization requires \(\frac{2}{3}n^3 + O(n^2)\) floating-point operations. Each forward and back substitution costs \(O(n^2)\). Once the factorization is stored, additional right-hand sides can be solved cheaply.

## 3.2 Cholesky Decomposition

When \(A\) is **symmetric positive definite** (SPD), meaning \(A = A^T\) and \(x^T A x > 0\) for all \(x \neq 0\), the LU factorization takes a special symmetric form. The **Cholesky decomposition** writes \(A = LL^T\) where \(L\) is lower triangular with positive diagonal entries.

The derivation follows by equating entries: the \((j,j)\) entry gives

\[
L_{jj} = \sqrt{A_{jj} - \sum_{k=1}^{j-1} L_{jk}^2},
\]

and for \(i > j\),

\[
L_{ij} = \frac{1}{L_{jj}} \left( A_{ij} - \sum_{k=1}^{j-1} L_{ik} L_{jk} \right).
\]

The argument that \(A_{jj} - \sum_{k=1}^{j-1} L_{jk}^2 > 0\) at every step follows from the fact that each leading principal submatrix of an SPD matrix is also SPD, guaranteeing positive pivots throughout.

Cholesky requires approximately \(\frac{1}{3}n^3\) operations—half the cost of general LU—and no pivoting is needed for numerical stability (the off-diagonal entries of \(L\) are bounded by the diagonal entries). This makes it the preferred method for SPD systems.

## 3.3 QR Factorization

Every matrix \(A \in \mathbb{R}^{m \times n}\) (with \(m \geq n\)) admits a **QR factorization** \(A = QR\), where \(Q \in \mathbb{R}^{m \times m}\) is orthogonal (\(Q^T Q = I\)) and \(R \in \mathbb{R}^{m \times n}\) is upper triangular. The factorization is central to least-squares problems, eigenvalue algorithms, and stability analysis.

### 3.3.1 Classical and Modified Gram-Schmidt

**Gram-Schmidt orthogonalization** constructs the columns of \(Q\) by successively orthogonalizing the columns of \(A\). Given columns \(a_1, \ldots, a_n\), define

\[
q_1 = \frac{a_1}{\|a_1\|}, \quad q_j = \frac{a_j - \sum_{i=1}^{j-1} (q_i^T a_j) q_i}{\left\| a_j - \sum_{i=1}^{j-1} (q_i^T a_j) q_i \right\|}.
\]

The coefficients \(r_{ij} = q_i^T a_j\) form the entries of \(R\), and \(r_{jj} = \|a_j - \sum_{i<j} r_{ij} q_i\|\). In **classical Gram-Schmidt** (CGS), all inner products with the current \(a_j\) are computed first, then the projections are subtracted. In **modified Gram-Schmidt** (MGS), projections are subtracted one at a time, updating the working vector before each inner product. Algebraically equivalent, MGS is numerically superior: its computed \(Q\) satisfies \(\|I - Q^T Q\|_2 = O(u \cdot \kappa(A))\), while CGS can lose orthogonality when \(\kappa(A)\) is large.

### 3.3.2 Householder Reflectors

**Householder reflectors** provide the most numerically stable QR algorithm. A Householder reflector is an orthogonal matrix of the form

\[
H = I - 2 v v^T, \quad \|v\|_2 = 1.
\]

Given a vector \(x \in \mathbb{R}^m\), we can choose \(v\) so that \(Hx = \pm \|x\| e_1\). The sign is chosen to avoid cancellation: \(Hx = -\mathrm{sign}(x_1) \|x\| e_1\). Then

\[
v = \frac{x + \mathrm{sign}(x_1)\|x\| e_1}{\|x + \mathrm{sign}(x_1)\|x\| e_1\|}.
\]

Applying \(n\) such reflectors from the left,

\[
H_n \cdots H_2 H_1 A = R,
\]

gives the QR factorization with \(Q^T = H_n \cdots H_1\). The reflectors are never formed explicitly; instead, each is stored as the vector \(v\) and applied as \(Hx = x - 2v(v^T x)\) in \(O(m)\) flops. Householder QR costs \(2mn^2 - \frac{2}{3}n^3\) flops and is backward stable.

## 3.4 Least-Squares Problems

The **overdetermined least-squares problem** seeks \(x \in \mathbb{R}^n\) minimizing \(\|Ax - b\|_2^2\) for \(A \in \mathbb{R}^{m \times n}\) with \(m > n\). The normal equations \(A^T A x = A^T b\) characterize the solution, but forming \(A^T A\) squares the condition number. The preferred approach uses the QR factorization \(A = QR\):

\[
\|Ax - b\|_2^2 = \|QRx - b\|_2^2 = \|Rx - Q^T b\|_2^2
\]

since \(Q\) is orthogonal. Partitioning \(Q^T b = \begin{pmatrix} c \\ d \end{pmatrix}\) with \(c \in \mathbb{R}^n\), the minimum is achieved by solving the triangular system \(Rx = c\), giving a residual \(\|d\|\).

## 3.5 Condition Number and Sensitivity of Linear Systems

The **2-norm condition number** of \(A\) is \(\kappa_2(A) = \sigma_{\max}(A)/\sigma_{\min}(A)\), where \(\sigma_{\max}\) and \(\sigma_{\min}\) are the largest and smallest singular values. For the system \(Ax = b\), the sensitivity estimate

\[
\frac{\|\delta x\|_2}{\|x\|_2} \leq \kappa_2(A) \frac{\|\delta b\|_2}{\|b\|_2}
\]

shows that \(\kappa_2(A)\) multiplies the relative perturbation in the data. A matrix with \(\kappa_2(A) \approx 10^k\) loses approximately \(k\) decimal digits of accuracy in the solution due to rounding.

---

# Chapter 4: Eigenvalue Problems and the SVD

## 4.1 Power Iteration

**Power iteration** is the simplest algorithm for computing the dominant (largest in modulus) eigenvalue of a matrix. Starting from a random vector \(q_0\), the iteration

\[
z_{k+1} = A q_k, \quad q_{k+1} = z_{k+1} / \|z_{k+1}\|
\]

produces a sequence converging to the eigenvector corresponding to \(\lambda_1\), the eigenvalue of largest modulus. The convergence rate is \(|\lambda_2/\lambda_1|^k\), where \(\lambda_2\) is the second-largest eigenvalue. If the two largest eigenvalues are close, convergence is slow.

**Inverse iteration** replaces \(A\) by \((A - \mu I)^{-1}\) to find the eigenvalue nearest to a given shift \(\mu\). Each step requires solving \((A - \mu I) z = q_k\), which after an initial LU factorization costs only \(O(n^2)\) per step. Inverse iteration with a good shift converges extremely quickly (cubically if the shift is updated using the Rayleigh quotient).

## 4.2 The QR Algorithm

The **QR algorithm** is the standard method for computing all eigenvalues of a dense matrix. Starting from \(A_0 = A\), each step computes the QR factorization \(A_k = Q_k R_k\) and sets \(A_{k+1} = R_k Q_k = Q_k^T A_k Q_k\). Since \(Q_k^T A_k Q_k\) is orthogonally similar to \(A_k\), the sequence \(\{A_k\}\) converges (under appropriate conditions) to a (quasi-)upper triangular matrix with eigenvalues on the diagonal. In practice, the algorithm is applied to the **Hessenberg form** (upper Hessenberg for general matrices, tridiagonal for symmetric ones) first obtained by Householder reductions, and **shifts** are used to accelerate convergence. With double implicit shifts (the Francis QR step), the algorithm achieves cubic convergence per eigenvalue and runs in \(O(n^3)\) total operations.

## 4.3 Singular Value Decomposition

The **singular value decomposition** (SVD) is one of the most powerful tools in numerical linear algebra. Every matrix \(A \in \mathbb{R}^{m \times n}\) can be written as

\[
A = U \Sigma V^T,
\]

where \(U \in \mathbb{R}^{m \times m}\) and \(V \in \mathbb{R}^{n \times n}\) are orthogonal matrices, and \(\Sigma \in \mathbb{R}^{m \times n}\) is a diagonal matrix with non-negative entries \(\sigma_1 \geq \sigma_2 \geq \cdots \geq \sigma_{\min(m,n)} \geq 0\) called the **singular values**.

**Derivation from the spectral theorem.** The matrix \(A^T A \in \mathbb{R}^{n \times n}\) is symmetric positive semidefinite, hence diagonalizable with non-negative real eigenvalues: \(A^T A = V \Lambda V^T\) where \(\Lambda = \mathrm{diag}(\lambda_1, \ldots, \lambda_n)\) and \(\lambda_i \geq 0\). Define \(\sigma_i = \sqrt{\lambda_i}\) and let \(r\) be the number of positive singular values (the rank of \(A\)). For \(i = 1, \ldots, r\), define \(u_i = A v_i / \sigma_i\); then

\[
A^T u_i = A^T (A v_i / \sigma_i) = V \Lambda V^T v_i / \sigma_i = \lambda_i v_i / \sigma_i = \sigma_i v_i,
\]

and

\[
u_i^T u_j = \frac{v_i^T A^T A v_j}{\sigma_i \sigma_j} = \frac{\lambda_j \delta_{ij}}{\sigma_i \sigma_j} = \delta_{ij}.
\]

Extend \(\{u_1, \ldots, u_r\}\) to an orthonormal basis of \(\mathbb{R}^m\) by appending \(m - r\) additional vectors. Then \(U = [u_1 \cdots u_m]\) satisfies \(U^T A V = \Sigma\), completing the derivation.

The geometric interpretation is that any linear map acts by: (1) rotating the input space (via \(V^T\)), (2) scaling along coordinate axes by the singular values (via \(\Sigma\)), and (3) rotating the output space (via \(U\)). The singular values are the axes of the hyperellipsoid that \(A\) maps the unit ball to.

## 4.4 Low-Rank Approximation and the Truncated SVD

<div class="theorem">
<strong>Eckart–Young Theorem.</strong> Among all rank-\(k\) matrices \(B\), the matrix \(A_k = \sum_{i=1}^k \sigma_i u_i v_i^T\) minimizes \(\|A - B\|_2\) and also \(\|A - B\|_F\). The minimum values are \(\|A - A_k\|_2 = \sigma_{k+1}\) and \(\|A - A_k\|_F = \sqrt{\sigma_{k+1}^2 + \cdots + \sigma_r^2}\).
</div>

The **truncated SVD** \(A_k\) provides the optimal low-rank approximation to \(A\), which is the foundation for data compression, signal denoising, and dimensionality reduction. In **principal component analysis** (PCA), the data matrix \(X \in \mathbb{R}^{m \times n}\) (centered) is approximated by \(X_k\): the top \(k\) singular vectors of \(X\) define the principal components, and projecting data onto these gives the best \(k\)-dimensional representation in least-squares sense.

## 4.5 Pseudoinverse

The **Moore–Penrose pseudoinverse** \(A^+ = V \Sigma^+ U^T\), where \(\Sigma^+\) replaces each non-zero singular value \(\sigma_i\) by \(1/\sigma_i\), provides the minimum-norm least-squares solution to \(Ax = b\): the solution \(x^+ = A^+ b\) satisfies \(\|Ax^+ - b\|_2 = \min_x \|Ax - b\|_2\) and has minimum \(\|x^+\|_2\) among all minimizers.

---

# Chapter 5: Iterative Methods for Linear Systems

## 5.1 Classical Stationary Methods

For large sparse systems \(Ax = b\), direct methods become prohibitively expensive. **Iterative methods** produce a sequence of approximations converging to the solution. Classical stationary methods split the matrix as \(A = M - N\) for a chosen **splitting matrix** \(M\) that is easy to invert, and iterate

\[
Mx_{k+1} = Nx_k + b, \quad \text{i.e.,} \quad x_{k+1} = M^{-1}Nx_k + M^{-1}b.
\]

The iteration converges if and only if the **spectral radius** \(\rho(M^{-1}N) < 1\), and the convergence rate per step is \(\rho(M^{-1}N)\).

**Jacobi iteration** takes \(M = D\) (the diagonal of \(A\)) and \(N = D - A\). Entry-wise, \((x_{k+1})_i = (b_i - \sum_{j \neq i} a_{ij} (x_k)_j) / a_{ii}\). All components of \(x_k\) are used simultaneously to update \(x_{k+1}\).

**Gauss-Seidel iteration** takes \(M = D - L\) (diagonal plus lower triangular) and \(N = U\). It updates each component sequentially, immediately using newly computed values:

\[
(x_{k+1})_i = \frac{1}{a_{ii}} \left( b_i - \sum_{j < i} a_{ij}(x_{k+1})_j - \sum_{j > i} a_{ij}(x_k)_j \right).
\]

For symmetric positive definite \(A\), Gauss-Seidel converges with \(\rho_{\rm GS} = \rho_{\rm J}^2\), where \(\rho_{\rm J}\) is the spectral radius for Jacobi, meaning Gauss-Seidel converges about twice as fast per iteration (though the iterations are not independent and can be harder to parallelize).

**SOR (Successive Over-Relaxation)** introduces a relaxation parameter \(\omega \in (0,2)\):

\[
x_{k+1} = (1-\omega) x_k + \omega x_k^{\rm GS}.
\]

The optimal \(\omega\) for the Poisson equation on a uniform grid is \(\omega^* = 2/(1 + \sin(\pi h))\), which reduces the spectral radius from \(1 - O(h^2)\) (for Gauss-Seidel) to \(1 - O(h)\) (for optimal SOR), roughly halving the number of iterations needed.

## 5.2 Conjugate Gradient Method

The **conjugate gradient method** (CG) is the crown jewel of iterative solvers for symmetric positive definite systems. It was developed by Hestenes and Stiefel in 1952 and belongs to the class of **Krylov subspace methods**.

For \(A\) SPD, solving \(Ax = b\) is equivalent to minimizing the **A-norm** of the error over a Krylov subspace. At step \(k\), CG finds the unique minimizer of \(\phi(x) = \frac{1}{2}x^T A x - b^T x\) over the Krylov subspace \(\mathcal{K}_k = \mathrm{span}\{r_0, Ar_0, \ldots, A^{k-1}r_0\}\), where \(r_0 = b - Ax_0\) is the initial residual.

**Full derivation.** The CG algorithm maintains three sequences: iterates \(x_k\), residuals \(r_k = b - Ax_k\), and search directions \(p_k\) that are **A-conjugate**: \(p_i^T A p_j = 0\) for \(i \neq j\). Starting with \(p_0 = r_0\), the algorithm proceeds:

\[
\alpha_k = \frac{r_k^T r_k}{p_k^T A p_k}, \quad x_{k+1} = x_k + \alpha_k p_k, \quad r_{k+1} = r_k - \alpha_k A p_k,
\]

\[
\beta_k = \frac{r_{k+1}^T r_{k+1}}{r_k^T r_k}, \quad p_{k+1} = r_{k+1} + \beta_k p_k.
\]

The step size \(\alpha_k\) is chosen to minimize \(\phi\) along direction \(p_k\); the direction update coefficient \(\beta_k\) ensures A-conjugacy of successive directions. One can verify by induction that \(r_k \perp r_j\) for \(k \neq j\) (residuals are mutually orthogonal) and \(p_k^T A p_j = 0\) for \(k \neq j\), so the algorithm terminates in at most \(n\) steps in exact arithmetic.

**Convergence bound.** The error \(e_k = x - x_k\) in the A-norm satisfies

\[
\frac{\|e_k\|_A}{\|e_0\|_A} \leq 2 \left( \frac{\sqrt{\kappa_2(A)} - 1}{\sqrt{\kappa_2(A)} + 1} \right)^k,
\]

where \(\kappa_2(A) = \lambda_{\max}/\lambda_{\min}\) is the spectral condition number. This follows because \(x_k\) minimizes the A-norm error over all polynomials \(p_k\) of degree \(k\) with \(p_k(0) = 1\), and the Chebyshev polynomial of the first kind provides the minimax bound. To reduce the error by a factor of \(\varepsilon\), roughly \(\frac{1}{2}\sqrt{\kappa_2(A)} \ln(2/\varepsilon)\) iterations suffice.

## 5.3 Krylov Subspace Methods and GMRES

For general (non-SPD) matrices, the appropriate generalization is **GMRES** (Generalized Minimal Residual), developed by Saad and Schultz (1986). GMRES at step \(k\) finds \(x_k \in x_0 + \mathcal{K}_k\) minimizing \(\|b - Ax_k\|_2\) over the Krylov subspace. The Arnoldi process builds an orthonormal basis for \(\mathcal{K}_k\), representing the minimization as a small least-squares problem of size \(k \times k\). GMRES converges in at most \(n\) steps in exact arithmetic; in practice, restarted GMRES (GMRES(\(m\))) limits memory by restarting every \(m\) steps.

## 5.4 Preconditioning

The convergence rate of iterative methods depends heavily on \(\kappa_2(A)\). A **preconditioner** \(P \approx A\) transforms the system to \(P^{-1}Ax = P^{-1}b\) (or the symmetric variant \(P^{-1/2}AP^{-1/2}\hat{x} = P^{-1/2}b\)), reducing the condition number at the cost of solving systems with \(P\) at each iteration. Good preconditioners are: (1) cheap to apply (triangular solve, fast transform), (2) a good approximation to \(A\) in some sense (small \(\kappa_2(P^{-1}A)\)), and (3) easy to construct. Examples include incomplete LU (ILU), incomplete Cholesky (IC), algebraic multigrid, and domain-decomposition methods. Preconditioning is often the key factor determining whether an iterative solver is practical.

---

# Chapter 6: Polynomial Interpolation and Approximation

## 6.1 Lagrange Interpolation

Given \(n+1\) distinct nodes \(x_0, x_1, \ldots, x_n\) and values \(f_0, f_1, \ldots, f_n\), the **Lagrange interpolating polynomial** is the unique polynomial \(p_n\) of degree at most \(n\) satisfying \(p_n(x_i) = f_i\). It is given explicitly by

\[
p_n(x) = \sum_{i=0}^n f_i L_i(x), \quad L_i(x) = \prod_{j \neq i} \frac{x - x_j}{x_i - x_j}.
\]

The **Lagrange basis polynomials** \(L_i\) satisfy \(L_i(x_j) = \delta_{ij}\).

**Interpolation error.** If \(f \in C^{n+1}[a,b]\) and the nodes lie in \([a,b]\), then for any \(x \in [a,b]\),

\[
f(x) - p_n(x) = \frac{f^{(n+1)}(\xi)}{(n+1)!} \omega_{n+1}(x),
\]

where \(\xi = \xi(x) \in (a,b)\) and \(\omega_{n+1}(x) = \prod_{i=0}^n (x - x_i)\) is the **node polynomial**. This result follows directly from the divided-difference theory.

## 6.2 Newton's Divided Difference Form

While the Lagrange form is explicit, the **Newton divided difference form** is more efficient for evaluation and incremental updates. Define the divided differences recursively:

\[
f[x_i] = f_i, \quad f[x_i, x_{i+1}] = \frac{f[x_{i+1}] - f[x_i]}{x_{i+1} - x_i},
\]

and in general,

\[
f[x_i, \ldots, x_{i+k}] = \frac{f[x_{i+1}, \ldots, x_{i+k}] - f[x_i, \ldots, x_{i+k-1}]}{x_{i+k} - x_i}.
\]

The Newton form of the interpolating polynomial is

\[
p_n(x) = \sum_{k=0}^n f[x_0, \ldots, x_k] \prod_{j=0}^{k-1}(x - x_j).
\]

This form can be evaluated efficiently in \(O(n)\) operations using **Horner's method** (nested evaluation). Adding a new data point requires only one additional row of the divided difference table, costing \(O(n)\) additional work.

## 6.3 The Runge Phenomenon and Chebyshev Nodes

A naive expectation that polynomial interpolation improves as the degree increases is shattered by the **Runge phenomenon**: for the function \(f(x) = 1/(1+25x^2)\) on \([-1,1]\) with equally spaced nodes, the maximum interpolation error grows without bound as \(n \to \infty\). The culprit is the node polynomial \(|\omega_{n+1}(x)|\), which with equally spaced nodes is large near the endpoints.

The optimal choice of nodes minimizes \(\max_{x \in [-1,1]} |\omega_{n+1}(x)|\). The solution is the **Chebyshev nodes**:

\[
x_k = \cos\!\left(\frac{(2k+1)\pi}{2(n+1)}\right), \quad k = 0, 1, \ldots, n.
\]

These are the zeros of the Chebyshev polynomial of degree \(n+1\), \(T_{n+1}(x) = \cos((n+1)\arccos x)\). Since \(\|T_{n+1}\|_\infty = 1\) and \(T_{n+1}\) is a monic polynomial (with leading coefficient \(2^n\)) times \(2^{-n}\), the node polynomial satisfies

\[
\max_{x \in [-1,1]} |\omega_{n+1}(x)| = \frac{1}{2^n},
\]

which is the smallest possible value among all monic degree-\((n+1)\) polynomials on \([-1,1]\). With Chebyshev nodes, the interpolation error bound becomes

\[
|f(x) - p_n(x)| \leq \frac{\|f^{(n+1)}\|_\infty}{(n+1)! \cdot 2^n},
\]

which decreases rapidly for smooth \(f\) and avoids the blow-up seen with equally spaced nodes.

## 6.4 Spline Interpolation

High-degree polynomial interpolation is often poorly behaved globally, even with Chebyshev nodes, when the function is only piecewise smooth. **Piecewise polynomial interpolation** uses lower-degree polynomials on subintervals.

A **cubic spline** on a partition \(a = t_0 < t_1 < \cdots < t_n = b\) is a function \(s : [a,b] \to \mathbb{R}\) that (1) is a cubic polynomial on each subinterval \([t_{i-1}, t_i]\), and (2) has continuous first and second derivatives across each knot. Given \(n+1\) data values \(f(t_i)\), there are \(4n\) polynomial coefficients to determine. The \(n+1\) interpolation conditions plus \(2(n-1)\) continuity conditions leave 2 degrees of freedom. These are fixed by **boundary conditions**:

- **Natural spline**: \(s''(a) = s''(b) = 0\)
- **Clamped spline**: \(s'(a) = f'(a)\), \(s'(b) = f'(b)\)

**Derivation via the second-derivative representation.** Let \(\sigma_i = s''(t_i)\) be unknowns. On each subinterval, \(s''\) is linear (a cubic's second derivative is linear), and since \(s''(t_{i-1}) = \sigma_{i-1}\) and \(s''(t_i) = \sigma_i\), we have

\[
s''(x) = \sigma_{i-1} \frac{t_i - x}{h_i} + \sigma_i \frac{x - t_{i-1}}{h_i}, \quad h_i = t_i - t_{i-1}.
\]

Integrating twice and enforcing interpolation at both endpoints determines the cubic \(s|_{[t_{i-1},t_i]}\) in terms of \(\sigma_{i-1}\) and \(\sigma_i\). Continuity of \(s'\) at the interior knots then yields a **tridiagonal linear system** for \(\sigma_1, \ldots, \sigma_{n-1}\). The system has a strictly diagonally dominant coefficient matrix, guaranteeing a unique solution.

**Error bound.** For the natural cubic spline satisfying interpolation conditions at equally spaced nodes with spacing \(h\), the error satisfies \(\|f - s\|_\infty \leq C h^4 \|f^{(4)}\|_\infty\) for \(f \in C^4[a,b]\). Cubic splines achieve an optimal convergence rate for smooth functions while avoiding the oscillations of high-degree polynomial interpolation.

---

# Chapter 7: Numerical Differentiation and Integration

## 7.1 Finite Difference Formulas

**Numerical differentiation** approximates derivatives from function values at discrete points. The standard formulas are derived from Taylor expansions.

The **forward difference** approximates \(f'(x)\) by

\[
f'(x) \approx \frac{f(x+h) - f(x)}{h} = f'(x) + \frac{h}{2} f''(x) + O(h^2).
\]

The **centered difference** achieves second-order accuracy:

\[
f'(x) \approx \frac{f(x+h) - f(x-h)}{2h} = f'(x) + \frac{h^2}{6} f'''(x) + O(h^4).
\]

The centered formula for the second derivative is

\[
f''(x) \approx \frac{f(x+h) - 2f(x) + f(x-h)}{h^2} = f''(x) + \frac{h^2}{12} f^{(4)}(x) + O(h^4).
\]

Higher-order formulas are obtained by using more points; the undetermined coefficient method (or the theory of **Richardson extrapolation**) provides a systematic approach.

There is a fundamental tension in numerical differentiation: decreasing \(h\) reduces the truncation error \(O(h^p)\) but increases the rounding error \(O(\varepsilon_{\rm mach}/h)\) (since \(f(x+h) - f(x-h)\) suffers cancellation). The optimal step size balancing these is \(h^* \sim \varepsilon_{\rm mach}^{1/(p+1)}\), giving a minimum total error of \(O(\varepsilon_{\rm mach}^{p/(p+1)})\).

## 7.2 Richardson Extrapolation

**Richardson extrapolation** eliminates leading error terms by combining approximations at different step sizes. If \(D(h) = D + C h^p + O(h^{p+2})\) for a known integer \(p\), then

\[
D_{\rm ext} = \frac{4 D(h/2) - D(h)}{3} = D + O(h^{p+2}),
\]

which is a \((p+2)\)-th order approximation. Applied recursively, Richardson extrapolation can produce arbitrarily high-order approximations from low-order formulas.

## 7.3 Newton–Cotes Integration Rules

**Quadrature** approximates \(I = \int_a^b f(x)\,dx\) by a weighted sum \(I_n = \sum_{i=0}^n w_i f(x_i)\). **Newton–Cotes rules** use equally spaced nodes \(x_i = a + ih\), \(h = (b-a)/n\).

The **trapezoidal rule** (\(n = 1\)):

\[
\int_a^b f(x)\,dx \approx \frac{h}{2}(f(a) + f(b)),
\]

with error \(-\frac{(b-a)^3}{12} f''(\xi)\) for some \(\xi \in (a,b)\). The derivation integrates the linear interpolant exactly. **Simpson's rule** (\(n = 2\)):

\[
\int_a^b f(x)\,dx \approx \frac{h}{3}(f(a) + 4f(a+h) + f(b)), \quad h = (b-a)/2,
\]

with error \(-\frac{(b-a)^5}{2880} f^{(4)}(\xi)\). Despite using a degree-2 polynomial fit, the error is \(O(h^5)\) rather than \(O(h^4)\); this "bonus" order arises because the symmetric nodes cause the cubic error term to vanish. This phenomenon, where a rule integrates polynomials of higher degree than expected, is called **superconvergence**.

**Composite rules** subdivide \([a,b]\) into \(m\) subintervals of width \(H = (b-a)/m\) and apply the basic rule on each. The composite trapezoidal rule has error \(O(H^2)\) and the composite Simpson's rule has error \(O(H^4)\).

## 7.4 Gaussian Quadrature

**Gaussian quadrature** chooses both nodes and weights to maximize the degree of polynomials integrated exactly. An \(n\)-point rule has \(2n\) free parameters (nodes and weights); choosing them optimally gives a rule exact for all polynomials of degree up to \(2n-1\).

The optimal nodes are the roots of the \(n\)-th degree **orthogonal polynomial** \(p_n\) on the interval with respect to a weight function \(w(x)\). For \([-1,1]\) with \(w \equiv 1\), these are the Gauss-Legendre nodes: roots of the Legendre polynomial \(P_n\). The weights are then uniquely determined by the exactness condition on polynomials of degree \(n-1\).

**Error bound.** For \(f \in C^{2n}[a,b]\),

\[
\int_a^b f(x)\,dx - \sum_{i=1}^n w_i f(x_i) = \frac{f^{(2n)}(\xi)}{(2n)!} \int_a^b [p_n(x)]^2 w(x)\,dx.
\]

The connection to orthogonal polynomials is deep: Gaussian quadrature integrates the interpolant through the nodes exactly, and the \(2n\)-degree exactness follows from the orthogonality of \(p_n\) to all polynomials of degree \(< n\).

## 7.5 Romberg Integration

**Romberg integration** applies Richardson extrapolation to the composite trapezoidal rule. Let \(T(h)\) denote the trapezoidal approximation with step size \(h\). The Euler-Maclaurin formula implies

\[
T(h) = I + c_2 h^2 + c_4 h^4 + c_6 h^6 + \cdots
\]

(only even powers of \(h\) appear for smooth functions on \([a,b]\) with appropriate boundary conditions). Applying Richardson extrapolation repeatedly produces approximations of order \(2, 4, 6, \ldots\), organized in the **Romberg triangle**. The \((k,j)\)-th entry is

\[
R_{k,j} = \frac{4^j R_{k,j-1} - R_{k-1,j-1}}{4^j - 1}.
\]

## 7.6 Adaptive Quadrature

Fixed composite rules may waste function evaluations in regions where \(f\) is smooth and allocate too few in regions where \(f\) varies rapidly. **Adaptive quadrature** subdivides intervals only where the local error estimate exceeds a tolerance. A standard implementation applies Simpson's rule on an interval and compares it to the result of two applications on the two halves; if the difference exceeds a threshold, the subintervals are refined recursively. Properly implemented with error control, adaptive quadrature achieves a given accuracy with near-optimal number of function evaluations.

---

# Chapter 8: Orthogonal Polynomials and Fourier Analysis

## 8.1 Orthogonal Polynomials and Three-Term Recurrence

A sequence of polynomials \(\{p_n\}_{n=0}^\infty\) with \(\deg p_n = n\) is **orthogonal** with respect to the inner product \(\langle f, g \rangle = \int_a^b f(x)g(x)w(x)\,dx\) if \(\langle p_m, p_n \rangle = 0\) for \(m \neq n\). Orthogonal polynomial sequences satisfy a **three-term recurrence**:

\[
p_{n+1}(x) = (a_n x + b_n) p_n(x) - c_n p_{n-1}(x),
\]

for constants \(a_n, b_n, c_n\) depending on the normalization and weight function. This recurrence is the key to efficient evaluation (Clenshaw's algorithm) and to proving properties of the roots.

Key families include:
- **Legendre polynomials** \(P_n\): weight \(w = 1\) on \([-1,1]\), used in Gauss-Legendre quadrature.
- **Chebyshev polynomials** \(T_n\): weight \(w = (1-x^2)^{-1/2}\) on \([-1,1]\), defined by \(T_n(\cos\theta) = \cos(n\theta)\); their equioscillation property makes them optimal for minimax approximation.
- **Hermite polynomials** \(H_n\): weight \(w = e^{-x^2}\) on \((-\infty,\infty)\), used in Gauss-Hermite quadrature for integration over the real line.

## 8.2 Best Approximation in \(L^2\)

Given an orthonormal basis \(\{\phi_k\}\) for \(L^2([a,b], w)\), the best approximation to \(f\) in the subspace spanned by \(\phi_0, \ldots, \phi_n\) in the \(L^2\) sense is the **orthogonal projection**:

\[
p_n = \sum_{k=0}^n \hat{f}_k \phi_k, \quad \hat{f}_k = \langle f, \phi_k \rangle.
\]

This minimizes \(\|f - p_n\|_{L^2}\). The coefficients \(\hat{f}_k\) are the **generalized Fourier coefficients** of \(f\), and by Parseval's identity, \(\|f\|_{L^2}^2 = \sum_{k=0}^\infty |\hat{f}_k|^2\).

## 8.3 Discrete Fourier Transform

The **Discrete Fourier Transform** (DFT) of a vector \(x \in \mathbb{C}^n\) is the vector \(\hat{x} \in \mathbb{C}^n\) with

\[
\hat{x}_k = \sum_{j=0}^{n-1} x_j \omega_n^{-jk}, \quad \omega_n = e^{2\pi i/n}, \quad k = 0, 1, \ldots, n-1.
\]

Equivalently, \(\hat{x} = F_n x\) where \(F_n\) is the unitary **DFT matrix** with entries \((F_n)_{kj} = n^{-1/2} \omega_n^{-jk}\). The inverse DFT is \(x_j = n^{-1}\sum_{k=0}^{n-1} \hat{x}_k \omega_n^{jk}\).

Naive computation of the DFT requires \(O(n^2)\) operations (a matrix-vector product). The **Fast Fourier Transform** reduces this to \(O(n \log n)\).

## 8.4 The Cooley–Tukey FFT Algorithm

The **Cooley–Tukey FFT** (1965) exploits the structure of \(F_n\) when \(n = 2^m\) by splitting the DFT recursively. For \(n\) even, split the input into even-indexed and odd-indexed elements:

\[
\hat{x}_k = \sum_{j=0}^{n/2-1} x_{2j} \omega_n^{-2jk} + \sum_{j=0}^{n/2-1} x_{2j+1} \omega_n^{-(2j+1)k}.
\]

Since \(\omega_n^{-2jk} = \omega_{n/2}^{-jk}\), the two sums are DFTs of size \(n/2\):

\[
\hat{x}_k = \hat{e}_k + \omega_n^{-k} \hat{o}_k,
\]

where \(\hat{e}\) and \(\hat{o}\) are the DFTs of the even-indexed and odd-indexed subsequences respectively. For \(k < n/2\), the periodicity gives \(\hat{e}_{k+n/2} = \hat{e}_k\) and \(\hat{o}_{k+n/2} = \hat{o}_k\), so the full DFT is assembled from the two half-size DFTs by \(n/2\) multiplications and additions—the **butterfly operation**. This gives the recurrence \(T(n) = 2T(n/2) + O(n)\), which solves to \(T(n) = O(n \log n)\). With \(n = 2^m\), exactly \(m = \log_2 n\) levels of recursion are needed, and each level involves \(n/2\) butterfly operations. The FFT requires roughly \(\frac{n}{2}\log_2 n\) complex multiplications and \(n \log_2 n\) additions.

The FFT is arguably the most important algorithm in applied mathematics, enabling fast convolution, spectral analysis, signal processing, and the solution of PDEs on regular grids via pseudospectral methods.

---

# Chapter 9: Numerical Methods for Ordinary Differential Equations

## 9.1 Initial Value Problems and Basic Framework

We consider the **initial value problem** (IVP): find \(y : [t_0, T] \to \mathbb{R}^m\) satisfying

\[
y' = f(t, y), \quad y(t_0) = y_0.
\]

By the Picard-Lindelöf theorem, a unique solution exists on some interval \([t_0, t_0 + \delta]\) if \(f\) is continuous and Lipschitz in \(y\). Numerical methods construct a discrete approximation \(y_0, y_1, y_2, \ldots\) at mesh points \(t_0 < t_1 < t_2 < \cdots\) with step size \(h_n = t_{n+1} - t_n\).

The **local truncation error** (LTE) of a method measures by how much the exact solution fails to satisfy the numerical scheme at a single step, while the **global error** measures the cumulative deviation over the entire integration.

## 9.2 Taylor Methods

**Taylor methods** of order \(p\) use the Taylor expansion of the exact solution:

\[
y(t+h) = y(t) + h y'(t) + \frac{h^2}{2} y''(t) + \cdots + \frac{h^p}{p!} y^{(p)}(t) + O(h^{p+1}).
\]

Since \(y' = f(t,y)\), the higher derivatives can be computed by differentiating the ODE: \(y'' = f_t + f_y f\), and so on. Taylor methods have LTE of order \(O(h^p)\) and global error \(O(h^p)\), but require analytical differentiation of \(f\), which is cumbersome for complicated functions.

## 9.3 Runge-Kutta Methods

**Runge-Kutta methods** achieve high-order accuracy by evaluating \(f\) at multiple points within each step, avoiding explicit differentiation. The general explicit \(s\)-stage Runge-Kutta method is

\[
k_i = f\!\left(t_n + c_i h, y_n + h \sum_{j=1}^{i-1} a_{ij} k_j\right), \quad i = 1, \ldots, s,
\]

\[
y_{n+1} = y_n + h \sum_{i=1}^s b_i k_i.
\]

The coefficients \(c_i, a_{ij}, b_i\) are encoded in the **Butcher tableau**.

**Derivation of RK4.** The classical fourth-order Runge-Kutta method uses four stages:

\[
k_1 = f(t_n, y_n), \quad k_2 = f\!\left(t_n + \tfrac{h}{2}, y_n + \tfrac{h}{2} k_1\right),
\]

\[
k_3 = f\!\left(t_n + \tfrac{h}{2}, y_n + \tfrac{h}{2} k_2\right), \quad k_4 = f(t_n + h, y_n + h k_3),
\]

\[
y_{n+1} = y_n + \frac{h}{6}(k_1 + 2k_2 + 2k_3 + k_4).
\]

To verify the order, expand each \(k_i\) in Taylor series about \((t_n, y_n)\) and compare with the Taylor expansion of the exact solution. The **order conditions** are polynomial equations in \(a_{ij}, b_i, c_i\) arising from matching terms through \(h^4\). For RK4, matching through \(h^4\) requires satisfying 8 order conditions with the 10 coefficients (\(a_{21}, a_{31}, a_{32}, a_{41}, a_{42}, a_{43}, b_1, b_2, b_3, b_4\) subject to consistency \(\sum b_i = 1\)). The LTE of RK4 is \(O(h^5)\) and the global error is \(O(h^4)\).

## 9.4 Multistep Methods

**Multistep methods** use several previous values \(y_{n-k+1}, \ldots, y_n\) to advance the solution. They avoid redundant function evaluations by reusing past stages.

The general \(k\)-step **Adams-Bashforth** method integrates the ODE over \([t_n, t_{n+1}]\) after replacing \(f\) by the degree-\((k-1)\) interpolant through the \(k\) most recent evaluations of \(f\):

\[
y_{n+1} = y_n + h \sum_{j=0}^{k-1} \beta_j f_{n-j}.
\]

For \(k = 4\), the Adams-Bashforth coefficients are \(\beta_0 = 55/24\), \(\beta_1 = -59/24\), \(\beta_2 = 37/24\), \(\beta_3 = -9/24\), giving a fourth-order method requiring one new function evaluation per step (after startup).

**Adams-Moulton** methods are implicit analogs, including the current stage \(f_{n+1}\) in the interpolant. The \(k\)-step Adams-Moulton method of order \(k+1\) is typically used as the **corrector** in a predictor-corrector pair with an Adams-Bashforth predictor. The combination allows the use of larger step sizes while retaining accuracy.

## 9.5 Stiffness and A-Stability

A system is **stiff** if it contains widely varying time scales—fast-decaying transients and slow dynamics coexist. The prototypical stiff equation is \(y' = \lambda y\), \(\mathrm{Re}(\lambda) \ll 0\), where explicit methods require \(h \lesssim 2/|\lambda|\) for stability, which may be far smaller than the step size needed for accuracy.

The **stability region** of a method is the set of \(h\lambda \in \mathbb{C}\) for which the numerical solution remains bounded. A method is **A-stable** if its stability region contains the entire left half-plane \(\{z : \mathrm{Re}(z) < 0\}\). Explicit methods (including all explicit Runge-Kutta methods) have bounded stability regions and are not A-stable. Implicit methods can be A-stable; the trapezoidal rule (Crank-Nicolson) and the implicit midpoint rule are A-stable, but they have bounded accuracy for stiff problems.

The Dahlquist equivalence theorem states that A-stable linear multistep methods are at most second-order (Dahlquist's second barrier). To overcome this, **BDF methods** (Backward Differentiation Formulas) sacrifice some of the left half-plane while gaining higher order. The \(k\)-step BDF method is

\[
\sum_{j=0}^k \alpha_j y_{n+j} = h \beta_k f_{n+k},
\]

with \(\beta_0 = \cdots = \beta_{k-1} = 0\). BDF methods of order 1 through 6 are zero-stable and A- or A(\(\alpha\))-stable, and are the standard solvers for stiff ODEs (used in packages like VODE, LSODE, and MATLAB's ode15s).

## 9.6 Step-Size Control

Practical ODE solvers estimate the local error at each step and adjust \(h\) to keep the error within a user-specified tolerance. The standard approach uses **embedded Runge-Kutta pairs** (such as the Dormand-Prince or Fehlberg pairs) that compute two solutions of different orders simultaneously. If the error estimate exceeds the tolerance, the step is rejected and retried with a smaller \(h\); otherwise, the step is accepted and the next step size is chosen as

\[
h_{\rm new} = h \cdot \left(\frac{\rm tol}{\rm error}\right)^{1/(p+1)} \cdot \text{(safety factor)},
\]

balancing efficiency and reliability.

---

# Chapter 10: Numerical Methods for Neural Networks

## 10.1 Backpropagation as Automatic Differentiation

Training a neural network requires computing the gradient of a scalar loss function \(\mathcal{L}\) with respect to all parameters \(\theta\) (weights and biases). This is accomplished by **backpropagation**, which is a special case of **reverse-mode automatic differentiation** (reverse-mode AD).

A neural network computes a function \(F = f_L \circ f_{L-1} \circ \cdots \circ f_1\) where each layer \(f_\ell(a) = \sigma(W_\ell a + b_\ell)\) involves a weight matrix \(W_\ell\), bias \(b_\ell\), and activation function \(\sigma\) applied elementwise. The **forward pass** computes the intermediate activations \(a^{(\ell)} = f_\ell(a^{(\ell-1)})\); the **backward pass** propagates gradients via the chain rule.

Let \(\delta^{(\ell)} = \partial \mathcal{L}/\partial a^{(\ell)}\) denote the error signal at layer \(\ell\). The chain rule gives

\[
\delta^{(\ell)} = \left(W_{\ell+1}^T \delta^{(\ell+1)}\right) \odot \sigma'\!\left(z^{(\ell)}\right),
\]

where \(z^{(\ell)} = W_\ell a^{(\ell-1)} + b_\ell\) is the pre-activation and \(\odot\) denotes elementwise multiplication. The gradients with respect to the parameters are

\[
\frac{\partial \mathcal{L}}{\partial W_\ell} = \delta^{(\ell)} (a^{(\ell-1)})^T, \quad \frac{\partial \mathcal{L}}{\partial b_\ell} = \delta^{(\ell)}.
\]

Reverse-mode AD computes all \(n\) partial derivatives of a scalar output simultaneously using two passes of cost \(O(n)\) each, compared to \(O(n^2)\) for finite differences. This \(O(n)\) property is precisely what makes training large neural networks tractable.

From a numerical standpoint, backpropagation is a specific **computational graph traversal** in which each node stores its local Jacobian and the reverse pass multiplies incoming gradient vectors (cotangents) by transposed local Jacobians. Modern frameworks (PyTorch, JAX, TensorFlow) implement this via operator overloading or source transformation, maintaining numerical stability through careful implementation of activation gradients.

## 10.2 Stochastic Gradient Descent and Variants

**Gradient descent** minimizes a loss \(\mathcal{L}(\theta)\) by iterating \(\theta \leftarrow \theta - \eta \nabla_\theta \mathcal{L}\), where \(\eta > 0\) is the **learning rate**. For convex problems, gradient descent with \(\eta < 2/L\) (where \(L\) is the Lipschitz constant of \(\nabla \mathcal{L}\)) converges at rate \(O(1/k)\), while strongly convex problems converge geometrically with rate \((1 - \eta\mu)^k\), \(\mu\) being the strong convexity parameter.

In practice, neural networks are trained on large datasets, making full-batch gradient computation prohibitively expensive. **Stochastic gradient descent** (SGD) uses a single sample (or a mini-batch of size \(B\)) to form an unbiased estimator of the gradient:

\[
g_k = \frac{1}{B} \sum_{i \in \mathcal{B}_k} \nabla_\theta \ell(\theta; z_i),
\]

and updates \(\theta_{k+1} = \theta_k - \eta_k g_k\). The **noise** introduced by subsampling can help escape sharp local minima and saddle points, and convergence theory for SGD relies on decreasing learning rates \(\eta_k = O(1/k)\) or bounded noise assumptions.

**Adam optimizer.** The **Adam** (Adaptive Moment Estimation) optimizer, due to Kingma and Ba (2014), maintains exponential moving averages of gradients and squared gradients:

\[
m_k = \beta_1 m_{k-1} + (1-\beta_1) g_k, \quad v_k = \beta_2 v_{k-1} + (1-\beta_2) g_k^2,
\]

with bias-corrected estimates \(\hat{m}_k = m_k/(1-\beta_1^k)\) and \(\hat{v}_k = v_k/(1-\beta_2^k)\). The update is

\[
\theta_{k+1} = \theta_k - \eta \frac{\hat{m}_k}{\sqrt{\hat{v}_k} + \epsilon}.
\]

The effective step size for each coordinate is approximately \(\eta \cdot |\hat{m}_k|/\sqrt{\hat{v}_k}\), which scales down noisy directions (large \(\sqrt{v_k}\)) and scales up directions with consistent gradients (small \(\sqrt{v_k}\) relative to \(|m_k|\)). Typical parameters are \(\beta_1 = 0.9\), \(\beta_2 = 0.999\), \(\epsilon = 10^{-8}\). Adam is robust to the scale of the objective and generally requires less careful tuning of the learning rate than SGD with momentum.

**Numerical stability of Adam.** The division by \(\sqrt{\hat{v}_k} + \epsilon\) can cause numerical issues if \(\hat{v}_k\) is extremely small (precluding a large step in a nearly-zero-gradient direction) or extremely large (causing stagnation). The \(\epsilon\) term is critical: too small risks division by near-zero; too large reverts to plain gradient descent.

## 10.3 Gradient Vanishing and Exploding

Deep networks suffer from the **vanishing gradient problem**: during backpropagation, the gradient \(\delta^{(\ell)}\) involves repeated multiplication by the weight matrices \(W_\ell\) and activation derivatives \(\sigma'\). If these have spectral norm less than 1, the gradients decay exponentially with depth, making early layers extremely slow to train. Conversely, if the spectral norms exceed 1, gradients **explode** exponentially.

For a network of depth \(L\) with weight matrices \(W_\ell\) and activation derivative \(\sigma'\), the gradient at layer 1 satisfies

\[
\|\delta^{(1)}\| \approx \prod_{\ell=2}^L \|W_\ell\| \cdot |\sigma'| \cdot \|\delta^{(L)}\|.
\]

If \(\|W_\ell\| |\sigma'| = \rho\) uniformly, then \(\|\delta^{(1)}\| \approx \rho^{L-1} \|\delta^{(L)}\|\), which vanishes for \(\rho < 1\) and explodes for \(\rho > 1\).

Standard remedies include:
- **Gradient clipping**: thresholding \(\|g_k\|_2\) at a maximum value to prevent explosive updates.
- **Careful weight initialization** (Xavier/Glorot, He/Kaiming): choosing the variance of initial weights to maintain unit expected norm of gradients across layers.
- **Batch normalization**: normalizing pre-activations within each mini-batch, which stabilizes the distribution of inputs to each layer and ameliorates the vanishing/exploding gradient problem.
- **Residual connections** (ResNets): adding identity shortcuts \(y = f(x) + x\), which provide a gradient highway that bypasses the multiplicative chain and allows gradients to flow directly to early layers.

## 10.4 Application to PDE-Constrained Optimization

**Physics-Informed Neural Networks** (PINNs) solve PDEs by minimizing a loss that combines residuals of the PDE, boundary conditions, and initial conditions:

\[
\mathcal{L}(\theta) = \lambda_{\rm PDE} \|(\partial_t u + \mathcal{N}[u])_{x_i}\|^2 + \lambda_{\rm BC} \|u(x_i^{\rm BC}) - g\|^2,
\]

where \(u(x;\theta)\) is a neural network approximating the solution. The derivatives of \(u\) with respect to the spatial and temporal inputs are computed via automatic differentiation through the network. From a numerical analysis perspective, PINNs are an instance of **collocation methods**: the PDE is enforced at finitely many collocation points, and the solution is represented in a nonlinear function class (neural networks instead of polynomials). The optimization landscape is non-convex and high-dimensional, making convergence analysis difficult, but empirically PINNs succeed on many problems, particularly in high dimensions where mesh-based methods face the curse of dimensionality.

The connection to classical numerical methods runs deeper: the gradient of the PDE residual loss involves second-order derivatives of the network (the Hessian with respect to inputs), computed by forward-over-reverse AD, which is analogous to computing the stiffness matrix in the finite element method. The condition number of this problem depends on the PDE and the network architecture, and preconditioning strategies for PDE-constrained optimization are an active area of research.

---

<div class="remark">
<strong>Remark on Interconnections.</strong> The ten chapters of this course form a unified whole. Floating-point arithmetic (Ch. 1) underlies every algorithm. Root finding (Ch. 2) uses the linear algebra of Chapter 3 in multivariate Newton's method. The condition number of a matrix (Ch. 3) is its largest-to-smallest singular value ratio (Ch. 4), and the convergence of conjugate gradient (Ch. 5) is controlled by the same quantity. Polynomial interpolation (Ch. 6) determines the nodes of Gaussian quadrature (Ch. 7) via orthogonal polynomial theory (Ch. 8). The DFT and FFT (Ch. 8) enable spectral methods for ODEs (Ch. 9). Automatic differentiation in neural networks (Ch. 10) is the chain rule of calculus viewed through the lens of computational graphs, and the optimization algorithms used to train networks are gradient-based iterative methods (Ch. 5) adapted to the stochastic, nonconvex setting. Mastery of numerical analysis is the foundation for understanding when and why computational methods succeed or fail across all of these domains.
</div>
