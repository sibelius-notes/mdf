---
title: "ECE 493: Computer Arithmetic Hardware"
prof: "Nachiket Kapre"
subjects: "ECE"
---

## Sources and References

**Primary textbook** — de Dinechin, F., & Kumm, M. (2023). *Application-Specific Arithmetic*. Springer. (Free via Springer link)

**Supplementary texts** — Weste, N., & Harris, D. (2015). *CMOS VLSI Design: A Circuits and Systems Perspective* (4th ed.). Pearson. — Ercegovac, M. D., & Lang, T. (2004). *Digital Arithmetic*. Morgan Kaufmann. — Goldberg, D. (1991). What every computer scientist should know about floating-point arithmetic. *ACM Computing Surveys*, 23(1), 5–48.

**Key papers** — Rouhani, B. D., et al. (2023). Microscaling data formats for deep learning. arXiv:2310.10537. — Micikevicius, P., et al. (2022). FP8 formats for deep learning. arXiv:2209.05433. — Gu, J., et al. (2024). Scalable and effective arithmetic tree generation for adder and multiplier designs. arXiv:2405.06758.

**Online resources** — Computer Arithmetic Algorithms and Hardware Designs lecture notes, MIT OCW 6.004; IEEE 754-2019 Standard for Floating-Point Arithmetic; FPLLL lattice reduction library documentation.

---

# Chapter 1: Number Formats and Representation

## 1.1 Fixed-Point Numbers

A **fixed-point number** allocates a fixed number of bits for the integer part and a fixed number for the fractional part. For a \(W\)-bit word with \(F\) fractional bits, the representable range and precision are:

<div class="definition">
<strong>Fixed-point format</strong> \((W, F)\): an integer \(x\) stored as a \(W\)-bit two's complement or unsigned integer represents the real value \(x \cdot 2^{-F}\). The <strong>least significant bit (LSB)</strong> has weight \(2^{-F}\); the quantization step is \(\Delta = 2^{-F}\).
</div>

For a signed \((W,F)\) format, the representable range is \([-2^{W-F-1},\; 2^{W-F-1} - 2^{-F}]\). The maximum relative error of **rounding** is \(\frac{1}{2}\cdot 2^{-F}/x\); for **truncation** it is up to \(2^{-F}/x\).

Fixed-point arithmetic is area- and power-efficient: no normalization logic is required, and word-length growth on addition is predictable. The design challenge is to choose \(W\) and \(F\) such that the dynamic range covers all values that occur during computation — a task that range analysis tools (Gappa, Fluctuat, Sollya) assist.

**Two's complement** representation is universal for signed fixed-point hardware because addition and subtraction circuits are identical for signed and unsigned operands; overflow simply wraps around. The negation of a two's complement number \(x\) is \(\bar{x} + 1\) (bitwise complement plus one).

## 1.2 Floating-Point Numbers

**IEEE 754** defines the dominant floating-point formats. A floating-point number is represented as:

\[
x = (-1)^s \cdot m \cdot 2^{e - \text{bias}}
\]

where \(s\) is the sign bit, \(m\) is the **significand** (also called mantissa), \(e\) is the biased exponent stored as an unsigned integer, and the bias is \(2^{E-1} - 1\) for an \(E\)-bit exponent field.

| Format | Total bits | Sign | Exponent | Significand | Bias |
|---|---|---|---|---|---|
| binary16 (half) | 16 | 1 | 5 | 10 | 15 |
| bfloat16 | 16 | 1 | 8 | 7 | 127 |
| binary32 (single) | 32 | 1 | 8 | 23 | 127 |
| binary64 (double) | 64 | 1 | 11 | 52 | 1023 |

In normal numbers, the significand has an implicit leading 1 bit (hidden bit), so binary32 effectively has 24 bits of significand precision. **Subnormal numbers** (biased exponent = 0) have no hidden bit and extend representability toward zero at the cost of reduced precision.

**Special values** in IEEE 754:
- Biased exponent all-ones, significand = 0: \(\pm\infty\)
- Biased exponent all-ones, significand \(\neq 0\): NaN (Not a Number)
- Biased exponent 0, significand 0: \(\pm 0\) (signed zero)

## 1.3 Narrow-Precision Formats for AI/ML

Deep neural network inference and training have driven research into **narrow-precision floating-point formats** that reduce memory bandwidth and arithmetic hardware area while preserving model accuracy.

**FP8 formats** — two variants are standardized (Micikevicius et al., 2022):

- **E4M3** (4-bit exponent, 3-bit mantissa): bias = 7, no \(\pm\infty\), NaN = S.1111.111. Range \(\approx \pm 448\), fine-grained near zero. Used for **activations** in forward pass.
- **E5M2** (5-bit exponent, 2-bit mantissa): bias = 15, full IEEE special values. Range \(\approx \pm 57344\). Used for **gradients** in backward pass.

**Microscaling (MX) formats** (Rouhani et al., 2023) add a shared block-level scale factor to groups of narrow elements:

\[
x_i = \text{scale} \cdot \text{element}_i, \quad \text{scale} = 2^{e_{\text{shared}} - \text{bias}}
\]

Groups of 32 elements share a single 8-bit E8M0 scale (exponent-only, representing powers of 2). MX formats defined in the specification include:

| MX Format | Element format | Elements per block |
|---|---|---|
| MXFP8 (E4M3) | FP8 E4M3 | 32 |
| MXFP8 (E5M2) | FP8 E5M2 | 32 |
| MXFP6 (E2M3) | FP6 | 32 |
| MXFP4 | FP4 E2M1 | 32 |
| MXINT8 | INT8 | 32 |

The shared scale amortizes scale overhead: for a 32-element block, the 8-bit scale contributes only 0.25 bits per element overhead. MX formats are now supported in AMD/Intel/NVIDIA hardware.

## 1.4 Units in the Last Place (ULP) and Error Analysis

The **unit in the last place (ulp)** of a floating-point number \(x\) is the value of the least significant bit of the significand. For a binary32 number with significand \(1.b_{22}b_{21}\ldots b_0\) and exponent \(e\):

\[
\text{ulp}(x) = 2^{e - 23}
\]

IEEE 754 guarantees that correctly rounded operations return results with error at most \(\frac{1}{2}\text{ ulp}\). The **machine epsilon** \(\epsilon_{\text{mach}}\) is defined as half the ulp of 1.0:

\[
\epsilon_{\text{mach}} = 2^{-(p-1)} \cdot \frac{1}{2} = 2^{-p}
\]

where \(p\) is the number of significand bits (including the implicit leading 1). For binary32, \(\epsilon_{\text{mach}} = 2^{-24} \approx 5.96 \times 10^{-8}\).

**Goldberg's fundamental theorem of floating-point error analysis**: if \(\hat{x} = x(1 + \delta)\) where \(|\delta| \leq \epsilon_{\text{mach}}\), then the relative error of a floating-point operation \(\text{fl}(x \circ y)\) for \(\circ \in \{+, -, \times, \div\}\) satisfies:

\[
\text{fl}(x \circ y) = (x \circ y)(1 + \delta), \quad |\delta| \leq \epsilon_{\text{mach}}
\]

**Catastrophic cancellation** occurs when subtracting two nearly equal quantities: the relative error of the result can be enormous even though each operand is accurately represented. Example: \(x = 1.000001\), \(y = 1.000000\); \(x - y = 0.000001\), but if each is represented with 7 significant decimal digits, the difference has only 1 significant digit.

**Gappa** (Generating Automatically Proofs of floating-point Arithmetic) is a proof assistant that automatically verifies bounds on floating-point rounding errors given a program and numeric constraints. It generates machine-checkable proofs, making it suitable for certifying safety-critical arithmetic implementations.

---

# Chapter 2: Adder Architectures

## 2.1 Ripple-Carry Adder

The **ripple-carry adder (RCA)** is the simplest binary addition circuit. For two \(n\)-bit operands \(A\) and \(B\), full adder (FA) cells are chained so that the carry out of position \(i\) feeds the carry in of position \(i+1\):

\[
s_i = a_i \oplus b_i \oplus c_i, \quad c_{i+1} = a_i b_i + (a_i \oplus b_i) c_i
\]

The **generate** and **propagate** signals at each bit position are:

\[
g_i = a_i \cdot b_i, \quad p_i = a_i \oplus b_i
\]

The carry at position \(i\) satisfies \(c_{i+1} = g_i + p_i \cdot c_i\). In the worst case (carry ripples through all \(n\) positions), the critical path delay is:

\[
t_{\text{RCA}}(n) = t_{\text{FA,carry}} \cdot (n-1) + t_{\text{FA,sum}}
\]

For a full adder implemented in standard cells, \(t_{\text{FA,carry}} \approx 2\tau\) (two gate delays). Thus RCA is \(O(n)\) in delay and \(O(n)\) in area — optimal area but slow for large \(n\).

## 2.2 Carry-Lookahead Adder

The **carry-lookahead adder (CLA)** precomputes carries using the recursive structure of the generate-propagate algebra. Defining group generate \(G_{i:j}\) and group propagate \(P_{i:j}\) for a bit range \([j,i]\):

\[
G_{i:j} = G_{i:k+1} + P_{i:k+1} \cdot G_{k:j}
\]

\[
P_{i:j} = P_{i:k+1} \cdot P_{k:j}
\]

The key observation is that \(c_{i+1} = G_{i:0} + P_{i:0} \cdot c_0\): once the group generate and propagate are known, the carry at any position follows immediately. A 4-bit CLA block computes all carries in 2–3 gate delays (independent of position), replacing the ripple chain.

For \(n > 4\) bits, CLAs are organized hierarchically: 4-bit CLA blocks feed a second-level CLA that computes group signals over 16-bit spans, and so on. A 16-bit hierarchical CLA achieves \(O(\log n)\) delay.

## 2.3 Prefix Adder Networks

The generate-propagate algebra forms a **prefix problem**: computing all prefix reductions \(G_{i:0}\) for \(i = 0, 1, \ldots, n-1\). Efficient parallel prefix networks achieve \(O(\log n)\) depth and \(O(n \log n)\) work.

<div class="definition">
A <strong>parallel prefix network</strong> for \(n\) inputs computes all prefix outputs \(P_i = x_0 \circ x_1 \circ \cdots \circ x_i\) (for an associative operator \(\circ\)) using a graph of binary combine nodes. The network is characterized by its <strong>depth</strong> (longest path through combine nodes) and <strong>size</strong> (total number of combine nodes).
</div>

Three classical networks span the performance-area trade-off:

**Sklansky (1960)**: depth \(\log_2 n\), size \(\frac{n}{2}\log_2 n\), but high **fan-out** at intermediate nodes (a node at level \(k\) drives \(2^{k-1}\) outputs). High fan-out increases wire capacitance and worsens practical timing despite low logical depth.

**Kogge-Stone (1973)**: depth \(\log_2 n\), size \(n \log_2 n - n + 1\), fan-out at most 2 at every node. Kogge-Stone has maximum wiring but minimal fan-out — the best timing in deep submicron CMOS where wire delay dominates.

**Brent-Kung (1982)**: depth \(2\log_2 n - 1\), size \(2n - 2 - \log_2 n\), fan-out at most 2. Brent-Kung minimizes area (fewest nodes) at the cost of increased depth. It achieves the lower bound on node count for depth-\(2\log n\) networks.

**Hybrid networks** interpolate between these extremes by allowing controlled fan-out. The design space is a Pareto frontier of depth vs. area; the paper by Gu et al. (2024) formulates this as an optimization problem and uses machine learning to synthesize Pareto-optimal prefix structures for a given technology library.

## 2.4 Carry-Save Adders and Multi-Operand Addition

When summing \(k > 2\) operands, a **carry-save adder (CSA)** reduces three operands to two (a partial sum vector and a carry vector) in a single FA delay:

\[
(A, B, C) \xrightarrow{\text{CSA}} (S, C_{\text{out}}) \quad \text{where } A + B + C = S + 2 C_{\text{out}}
\]

Note that \(S\) and \(C_{\text{out}}\) are not summed internally — they remain as two separate vectors ("carry-save representation"), deferring carry propagation to a single final adder. A **Wallace tree** or **Dadda tree** of CSAs reduces \(k\) operands to 2 in \(\lceil \log_{3/2} k \rceil\) levels (Wallace) or slightly fewer in Dadda's optimized sequence, at the cost of irregular wiring.

CSA reduction is the basis of fast multiplier design: a \(k \times k\) multiplier generates \(k\) partial products that must be summed, and CSA trees reduce this sum efficiently.

---

# Chapter 3: Multiplier Architectures

## 3.1 Partial Product Generation

An \(n\)-bit × \(m\)-bit binary multiplier computes:

\[
P = A \times B = \sum_{i=0}^{m-1} a_i \cdot B \cdot 2^i
\]

where \(a_i\) is the \(i\)-th bit of \(A\) (least significant first). Each term \(a_i \cdot B\) is a **partial product**: a shifted copy of \(B\) if \(a_i = 1\), or zero if \(a_i = 0\). The sum of \(m\) partial products, each \(n\) bits wide, produces a \(2n\)-bit result.

**Booth encoding (radix-4)** reduces the number of partial products by half by recoding pairs of bits of \(A\). For radix-4 Booth, \(A\) is partitioned into overlapping 3-bit groups, each encoding a partial product multiplier from \(\{-2, -1, 0, 1, 2\}\). This halves the partial product count to \(\lceil m/2 \rceil\), reducing the depth of the CSA tree. Booth encoding is standard in all high-performance multiplier implementations.

## 3.2 Dadda Multiplier

The **Dadda multiplier** is a CSA-tree-based architecture that reduces \(m\) partial product rows to 2 using the minimum number of FA and HA cells, then produces the final result with a carry-propagate adder.

Dadda's reduction target sequence is \(d_j\): \(d_1 = 2\), and \(d_{j+1} = \lfloor \frac{3}{2} d_j \rfloor\). Starting from \(m\) rows (where \(m = n\) for an \(n \times n\) multiplier), choose the largest \(d_j < m\) as the first target, and reduce the partial product array column-by-column to that height using FAs (consuming 3 inputs, producing 2 outputs) and HAs (consuming 2 inputs, producing 2 outputs). Repeat with smaller targets until 2 rows remain.

<div class="example">
<strong>8-bit Dadda reduction</strong>: Start with 8 partial product rows. Dadda sequence: 2, 3, 4, 6, 9, 13, … — first target below 8 is 6. Reduce each column from height 8 to height ≤ 6 using FA/HA cells. Then reduce 6 → 4 → 3 → 2. Final two rows are summed with a 16-bit carry-propagate adder. The total number of FA cells is minimized compared to Wallace's approach.
</div>

## 3.3 Karatsuba Multiplication

**Karatsuba's algorithm** (1962) is a divide-and-conquer approach that reduces the number of long multiplications from 4 to 3 at the cost of extra additions. For two \(n\)-digit numbers \(A = A_H \cdot B^m + A_L\) and \(B = B_H \cdot B^m + B_L\) (split at position \(m = \lceil n/2 \rceil\)):

\[
A \times B = A_H B_H \cdot B^{2m} + \left[(A_H + A_L)(B_H + B_L) - A_H B_H - A_L B_L\right] \cdot B^m + A_L B_L
\]

Only three sub-multiplications are needed: \(A_H B_H\), \(A_L B_L\), and \((A_H + A_L)(B_H + B_L)\). The middle term is recovered by subtraction. Applying this recursively gives complexity \(O(n^{\log_2 3}) \approx O(n^{1.585})\) versus \(O(n^2\)) for schoolbook multiplication.

In hardware, Karatsuba tiling is used for large multipliers (e.g., 64-bit or wider): a \(64 \times 64\)-bit multiplier is decomposed into 3 (not 4) sub-multiplications of \(32 \times 32\)-bit operands. The reduction in DSP block count is significant in FPGA implementations.

## 3.4 Compressor Trees and Bit Heaps

A **compressor tree** is the general term for a CSA-based reduction network, typically visualized as a **bit heap**: a table where each column lists the partial product bits contributing to that bit position of the result. The synthesis problem is to schedule FA/HA/compressor operations to reduce each column to height ≤ 2, minimizing delay or area.

Modern arithmetic synthesis tools (FloPoCo, Arithmetic Trees in Gu et al. 2024) formulate bit-heap compression as a covering or scheduling optimization problem solved by ILP, genetic algorithms, or reinforcement learning. The Gu et al. paper demonstrates that learned policies can discover compression schedules that match or exceed hand-optimized Dadda trees in area-delay product.

**Compressors beyond FA**: a 4:2 compressor takes 4 input bits and a carry-in, produces 2 output bits and a carry-out, and is implementable in fewer gate delays than a chain of two FAs. Similarly, 5:3 and 7:3 compressors are used in custom VLSI designs.

---

# Chapter 4: Division and Square Root

## 4.1 Digit-Recurrence Division

The **digit recurrence** (or restoring/non-restoring) algorithm computes one quotient digit per iteration. Starting with partial remainder \(r_0 = a\) (dividend) and divisor \(d\):

\[
r_{j+1} = \beta \cdot r_j - q_{j+1} \cdot d
\]

where \(\beta\) is the radix and \(q_{j+1}\) is the selected quotient digit for iteration \(j+1\). The digit selection function must ensure the partial remainder stays bounded (i.e., \(|r_{j+1}| \leq d\) for non-restoring or \(|r_{j+1}| \leq (1 - \beta^{-1})d\) for SRT division).

**SRT (Sweeney-Robertson-Tocher) division** is the basis of most hardware dividers. For radix-4 SRT with digit set \(\{-2, -1, 0, 1, 2\}\):

- The quotient digit is selected based on the few most significant bits of \(r_j\) and \(d\) using a precomputed lookup table.
- Only addition/subtraction (no division) is needed at each step.
- Radix-4 SRT produces 2 quotient bits per cycle, achieving practical performance in 3–5 ns per bit on modern CMOS processes.

## 4.2 Iterative (Newton-Raphson) Methods

For division \(a/d\), Newton-Raphson computes an approximation to \(1/d\) iteratively. Starting with initial estimate \(x_0 \approx 1/d\):

\[
x_{n+1} = x_n (2 - d \cdot x_n)
\]

Each iteration doubles the number of correct bits (**quadratic convergence**). Starting with an \(k\)-bit accurate initial estimate (from a small lookup table), \(\lceil \log_2(p/k) \rceil\) iterations suffice for \(p\)-bit precision. For binary32 (24 bits), a 7-bit table plus 2 iterations gives the result.

The Intel SSE instruction RCPPS provides a ~12-bit initial approximation, and `DIVSS` uses a refined SRT + Newton-Raphson combination internally.

## 4.3 Square Root

Square root is structurally similar to division. **Digit recurrence for square root** computes \(\sqrt{a}\) by maintaining:

\[
r_{j+1} = \beta r_j - 2 q_{j+1} q_{0:j} - \beta^{-j-1} q_{j+1}^2
\]

where \(q_{0:j}\) is the partial result computed so far. The digit selection uses the partial root \(q_{0:j}\) as well as the partial remainder — requiring an online update of the selection function.

**Newton-Raphson for square root**: compute \(1/\sqrt{a}\) using:

\[
x_{n+1} = \frac{x_n}{2}(3 - a x_n^2)
\]

Multiply by \(a\) at the end to get \(\sqrt{a} = a \cdot (1/\sqrt{a})\). This avoids the feedback dependency on the partial result.

---

# Chapter 5: Floating-Point Operations and Error Analysis

## 5.1 Floating-Point Addition

Adding two floating-point numbers requires alignment of significands. For \(x = m_x \cdot 2^{e_x}\) and \(y = m_y \cdot 2^{e_y}\) with \(e_x \geq e_y\):

1. **Alignment**: right-shift \(m_y\) by \(e_x - e_y\) positions, producing aligned significand \(m_y' = m_y \cdot 2^{e_y - e_x}\).
2. **Significand addition**: \(m_z = m_x + m_y'\) (or subtraction if signs differ).
3. **Normalization**: if \(m_z\) has a leading bit beyond position \(p\), shift right by 1 and increment exponent; if \(m_z\) has leading zeros, shift left (count them with a leading-zero counter or priority encoder) and decrement exponent.
4. **Rounding**: apply rounding mode (round-to-nearest-even, truncation, round-toward-zero, etc.) to the \((p+1)\)th bit using the guard, round, and sticky bits.

The **guard bit** (one bit beyond the significand) and **round bit** (one further) are retained during addition to enable correct rounding. The **sticky bit** is the OR of all bits below the round bit — it records whether any shifted-out bits were non-zero.

**Correct rounding** under IEEE 754 requires that the result equals the nearest representable value (for round-to-nearest), or the nearest in the specified direction (for directed roundings), to the infinite-precision result.

## 5.2 Floating-Point Multiplication

Multiplying \(x \cdot y\):

1. **Exponent addition**: \(e_z = e_x + e_y - \text{bias}\).
2. **Significand multiplication**: \(m_z = m_x \times m_y\) (full-width product, \(2p\) bits).
3. **Normalization**: if the product significand is in \([2, 4)\) (i.e., leading bit is at position \(2p-1\)), shift right by 1 and increment exponent.
4. **Rounding**: truncate to \(p\) bits with correct rounding using guard, round, sticky.
5. **Sign**: XOR of input signs.

The significand multiplication is the bottleneck: a \(24 \times 24\)-bit multiplication for binary32. Fused multiply-add (**FMA**) computes \(a \times b + c\) with a single rounding event, avoiding double rounding and improving accuracy for dot products and polynomial evaluations. FMA is mandatory in IEEE 754-2008 and is supported in all modern processor ISAs (FP64 on x86 via `VFMADD`, SIMD FMA on ARM NEON/SVE).

## 5.3 Error Analysis of Floating-Point Computations

For a sequence of floating-point operations, error accumulates. The standard forward error analysis uses the model:

\[
\text{fl}(x_1 \circ x_2) = (x_1 \circ x_2)(1 + \delta), \quad |\delta| \leq \epsilon
\]

For a sum \(s = \sum_{i=1}^n a_i\) computed left-to-right, the absolute error is bounded by:

\[
|s - \hat{s}| \leq (n-1)\epsilon \sum_{i=1}^n |a_i|
\]

This bound is pessimistic: errors can partially cancel. **Compensated summation** (Kahan, 1965) maintains a running compensation \(c\) that accumulates rounding errors and subtracts them in subsequent steps, reducing the bound to \(O(\epsilon^2 n)\).

**Interval arithmetic** tracks lower and upper bounds on each intermediate result, propagating guaranteed enclosures through the computation. Combined with floating-point, it produces rigorous enclosures at reasonable overhead.

---

# Chapter 6: Function Approximation

## 6.1 Table Lookup Approximation

For a function \(f: [a, b] \to \mathbb{R}\), the simplest hardware approximation stores \(2^k\) uniformly spaced function values in a ROM and uses the leading \(k\) bits of the input as an address. This gives approximation error bounded by the maximum slope times the interval width:

\[
|f(x) - f_{\text{table}}(x)| \leq \frac{1}{2} \cdot \frac{b-a}{2^k} \cdot \max_{x}|f'(x)|
\]

For smooth functions, the table size for \(p\)-bit accuracy grows as \(2^{p/2}\) when combined with linear interpolation. **Bipartite tables** (Schulte, 1994) split the input into two parts, compute two table lookups and an addition, and achieve better accuracy-to-area ratios than single-table methods.

## 6.2 Polynomial Approximation

**Minimax polynomial approximation** of degree \(d\) minimizes the maximum absolute error:

\[
\min_{p \in \mathcal{P}_d} \max_{x \in [a,b]} |f(x) - p(x)|
\]

The Chebyshev equioscillation theorem guarantees that the optimal polynomial equioscillates between \(+e\) and \(-e\) at \(d+2\) points. The **Remez algorithm** iteratively finds this polynomial starting from Chebyshev nodes.

Hardware evaluation of degree-\(d\) polynomials requires \(d\) multiplications and \(d\) additions using **Horner's method**:

\[
p(x) = a_0 + x(a_1 + x(a_2 + \cdots + x(a_{d-1} + x \cdot a_d)\cdots))
\]

Horner's form is critical-path optimal for sequential evaluation. For parallel hardware, **parallel Horner** or **Estrin's scheme** decomposes the polynomial into sub-trees evaluable in \(\lceil \log_2 d \rceil\) parallel multiply-add steps.

## 6.3 Exponential and Logarithm

**Range reduction** is the key technique for elementary function approximation in hardware. For \(e^x\):

\[
x = n \ln 2 + r, \quad |r| \leq \frac{\ln 2}{2}, \quad n \in \mathbb{Z}
\]

Then \(e^x = 2^n \cdot e^r\). The term \(2^n\) is exact (exponent increment); \(e^r\) is approximated with a short polynomial on the small interval \(|r| \leq \ln 2 / 2 \approx 0.347\). A degree-5 minimax polynomial suffices for binary32 accuracy.

For \(\ln(x)\), write \(x = m \cdot 2^n\) with \(m \in [1, 2)\). Then \(\ln(x) = n \ln 2 + \ln(m)\). The term \(n \ln 2\) is computed exactly; \(\ln(m)\) is approximated on \([1, 2)\) with a short polynomial. Alternatively, further reduce \(m\) using a lookup table for \(\ln(1 + k/2^r)\) and approximate \(\ln(1 + f)\) for small \(f\).

## 6.4 CORDIC

The **CORDIC (COordinate Rotation DIgital Computer)** algorithm (Volder, 1959) computes trigonometric and hyperbolic functions using only shifts and additions — no multipliers. It rotates a vector \((x, y)\) by a target angle \(\theta\) using a sequence of micro-rotations:

\[
\begin{pmatrix} x_{j+1} \\ y_{j+1} \end{pmatrix} = K_j \begin{pmatrix} 1 & -d_j 2^{-j} \\ d_j 2^{-j} & 1 \end{pmatrix} \begin{pmatrix} x_j \\ y_j \end{pmatrix}
\]

where \(d_j = \pm 1\) is chosen to reduce the angle residual, and \(K_j = \cos(\arctan 2^{-j})\) is a known constant. After \(n\) iterations, the accumulated scale factor \(K = \prod_{j=0}^{n-1} K_j \approx 0.6073\) is applied (once, as a multiplication or shifted addition).

The CORDIC iteration is a **digit-online algorithm**: each step produces one correct bit of the output. CORDIC is area-efficient (no multiplier array) and is used in processors where area is constrained (microcontrollers, low-power DSP), scientific calculators, and software-defined radio baseband processors.

---

# Chapter 7: Logarithmic Number Systems and AI/ML Considerations

## 7.1 Logarithmic Number Systems (LNS)

A **logarithmic number system** represents a real number by its logarithm: \(\hat{x} = \log_2 x\) stored as a fixed-point value. Multiplication becomes addition:

\[
x \cdot y \leftrightarrow \hat{x} + \hat{y}
\]

and division becomes subtraction. However, addition of LNS numbers requires:

\[
x + y \leftrightarrow \log_2\left(2^{\hat{x}} + 2^{\hat{y}}\right) = \hat{x} + \log_2\left(1 + 2^{\hat{y} - \hat{x}}\right)
\]

The correction term \(\log_2(1 + 2^{-z})\) for \(z = \hat{x} - \hat{y} \geq 0\) is approximated with a lookup table. LNS naturally handles wide dynamic range (the exponent field acts as a log-domain mantissa) and has found application in deep learning inference hardware where multiplications dominate and additions are secondary.

## 7.2 Narrow Precision in AI/ML Hardware

Modern AI accelerators (Google TPU v5, NVIDIA H100, AMD MI300) implement hardware multiply-accumulate units for narrow formats:

**INT8 matrix multiplication** with FP32 accumulation: the tensor core computes \(D = A \times B + C\) where \(A, B \in \text{INT8}\) and \(C, D \in \text{FP32}\) or \(\text{FP16}\). The 8-bit integer products (16-bit intermediate) are accumulated in higher precision to preserve statistical quality.

**Quantization** maps a floating-point model to integer representation:

\[
Q(x) = \text{round}\left(\frac{x}{s}\right) + z
\]

where \(s\) is a per-tensor or per-channel scale and \(z\) is an integer zero-point. **Post-training quantization (PTQ)** applies quantization to a pre-trained model with calibration data; **quantization-aware training (QAT)** fine-tunes the model with fake quantization operators in the forward pass, learning weight distributions that are robust to quantization error.

**FP4 (FP8-lite) training**: the FP4 format E2M1 (2-bit exponent, 1-bit mantissa) represents only 16 distinct positive values (including zero). Training with FP4 weights requires MX-style block scaling and careful gradient handling; the 2025 paper by Li et al. demonstrates LLM pretraining with FP4 activations and weights at negligible accuracy loss using dynamic block scaling.

## 7.3 FPGA vs. ASIC vs. Full-Custom Implementation

The implementation platform determines the arithmetic primitives and optimization targets:

**FPGA**: computation is mapped to look-up tables (LUTs), DSP blocks (multiplier-accumulator units, typically 18×18 or 27×18 bits), and block RAMs. Carry chains implement fast adders. Arithmetic synthesis targets DSP block utilization for multipliers and LUTs for non-standard operations. Karatsuba decomposition efficiently maps large multipliers onto DSP blocks.

**ASIC**: standard-cell synthesis from RTL through place-and-route. Arithmetic cells are optimized at the gate level; tools like Synopsys Design Compiler or Cadence Genus apply retiming, multi-supply voltage, and clock gating automatically. Technology-specific gate libraries (14nm FinFET vs. 5nm GAA) determine timing and power.

**Full-custom**: transistor-level design in a tool like Cadence Virtuoso. Critical path gates are sized individually; layouts are manually placed to minimize wire length and capacitance. This is used for the most performance-critical paths: integer units in microprocessors, multipliers in TPUs. The trade-off is enormous design cost (person-years) versus 2–3× performance advantage over synthesized implementations.
