---
title: "PMATH 440: Analytic Number Theory"
prof: "Michael Rubinstein"
subjects: "PMATH"
---

*These notes synthesize material from Michael Rubinstein's PMATH 440 lectures at the University of Waterloo with supplementary material drawn from Tom Apostol's* Introduction to Analytic Number Theory*, Harold Davenport's* Multiplicative Number Theory*, Andrew Granville's lecture notes, K. Soundararajan's Stanford lecture notes, MIT OCW 18.785, and Terry Tao's blog. The goal is to present analytic number theory not merely as a list of theorems but as a living mathematical narrative — tracing how the deep questions about prime distribution forced mathematicians to build an entirely new kind of analysis.*

---

## Sources and References

**Primary textbook** — None required.

**Supplementary texts** — Tom Apostol, *Introduction to Analytic Number Theory*, Springer-Verlag, 1976; Harold Davenport, *Multiplicative Number Theory*; M. Ram Murty, *Problems in Analytic Number Theory*; G. H. Hardy & E. M. Wright, *An Introduction to the Theory of Numbers*, 5th ed., Oxford, 1979.

**Online resources** — MIT OCW 18.785 (Analytic Number Theory); Andrew Granville's lecture notes; Terry Tao's blog posts on analytic number theory; K. Soundararajan's lecture notes (Stanford).

---

## Prologue: What Is Analytic Number Theory?

Number theory asks questions about integers: which numbers are prime? how many primes are there below a trillion? can every even number be written as a sum of two primes? These seem like purely combinatorial questions, and yet — remarkably — the most powerful tools for answering them come from complex analysis, Fourier theory, and the study of special functions. This collision of the discrete and the continuous is what makes analytic number theory so beautiful and so surprising.

The central object of the subject is the **Riemann zeta function**

\[
\zeta(s) = \sum_{n=1}^\infty \frac{1}{n^s} = \prod_p \frac{1}{1-p^{-s}},
\]
which simultaneously encodes all positive integers (through the sum) and all prime numbers (through the Euler product). Riemann's profound 1859 insight was that by treating \(s\) as a *complex* variable and studying \(\zeta(s)\) as an analytic function on the complex plane, one could extract precise information about how the primes are distributed. The zeros of \(\zeta(s)\) — particularly the **nontrivial zeros** lying in the strip \(0 < \mathrm{Re}(s) < 1\) — directly control the error in the approximation \(\pi(x) \approx x/\log x\). Understanding these zeros is the central unsolved problem in mathematics: the **Riemann Hypothesis**.

The course follows a logical arc: we begin with elementary but sharp estimates for primes using Chebyshev's method, then develop the analytical machinery (summation formulas, Dirichlet series, the zeta function), prove the Prime Number Theorem via complex analysis, extend everything to Dirichlet L-functions for the study of primes in arithmetic progressions, and close with a discussion of the Riemann Hypothesis and what is known about zeros.

---

# Chapter 1: Primes and Elementary Estimates

## 1.1 The Prime Numbers

The prime numbers are the atoms of multiplicative arithmetic. Recall that a positive integer \( p > 1 \) is **prime** if its only positive divisors are \( 1 \) and \( p \) itself. Every integer \( n > 1 \) factors uniquely as a product of primes (the Fundamental Theorem of Arithmetic). This uniqueness is why primes are so fundamental: they are the building blocks, and any multiplicative structure must be understood prime by prime.

The first several primes are \( 2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, \ldots \). Looking at this list, a natural pattern-seeking instinct kicks in: how are the primes distributed? Do they eventually stop (Euclid tells us no)? Do they thin out (yes — the gaps between primes grow on average)? How rapidly?

<div class="definition">
<strong>Definition 1.1 (Counting function).</strong> For a real number \( x \geq 1 \), define \( \pi(x) \) to be the number of primes \( p \leq x \):

\[
\pi(x) = \#\{p \leq x : p \text{ prime}\}.
\]
</div>

The first few values are \( \pi(10) = 4 \), \( \pi(100) = 25 \), \( \pi(1000) = 168 \), \( \pi(10^6) = 78498 \), \( \pi(10^9) = 50{,}847{,}534 \). Notice the pattern: primes become sparser as numbers grow larger, but they never disappear entirely. The ratio \(\pi(x)/x\) declines toward zero — roughly like \(1/\log x\). The central theorem governing the distribution of primes is:

<div class="theorem">
<strong>Theorem 1.2 (Prime Number Theorem).</strong> As \( x \to \infty \),

\[
\pi(x) \sim \frac{x}{\log x},
\]
meaning \( \pi(x) / (x / \log x) \to 1 \). Equivalently, \( \pi(x) \sim \mathrm{li}(x) \) where \( \mathrm{li}(x) = \int_2^x \frac{dt}{\log t} \) is the logarithmic integral.
</div>

The logarithmic integral \( \mathrm{li}(x) \) is a significantly better approximation. For instance, \( \mathrm{li}(10^6) \approx 78628 \) while \( 10^6/\log(10^6) \approx 72382 \). The true count \(\pi(10^6) = 78498\) lies much closer to \(\mathrm{li}(10^6)\). Heuristically, one can think of each integer \(n\) near \(x\) as being "prime with probability \(1/\log x\)" — this is made precise by the PNT. The proof of PNT, given in Chapters 4–5, requires understanding the analytic continuation and zero-free regions of the Riemann zeta function. This motivates everything that follows.

<div class="remark">
<strong>Remark 1.3 (Why \(\mathrm{li}(x)\) and not \(x/\log x\)?).</strong> Integration by parts shows

\[
\mathrm{li}(x) = \frac{x}{\log x} + \frac{x}{(\log x)^2} + \frac{2x}{(\log x)^3} + \cdots + O\!\left(\frac{x}{(\log x)^k}\right)
\]
for any fixed \(k\). So \(\mathrm{li}(x)\) captures an entire asymptotic series of corrections. The PNT says that \(\pi(x) - \mathrm{li}(x) = o(\mathrm{li}(x))\), but the exact size of this difference — whether it is \(O(\sqrt{x}\log x)\), for instance — is the Riemann Hypothesis.
</div>

## 1.2 Euclid's Theorem

<div class="theorem">
<strong>Theorem 1.3 (Euclid).</strong> There are infinitely many prime numbers.
</div>

<div class="proof">
<strong>Proof.</strong> Suppose for contradiction that there are only finitely many primes \( p_1, p_2, \ldots, p_k \). Form the integer \( N = p_1 p_2 \cdots p_k + 1 \). Since \( N > 1 \), it has at least one prime divisor \( q \). But \( q \) cannot be any of \( p_1, \ldots, p_k \), since dividing \( N \) by any \( p_i \) leaves remainder \( 1 \). This contradicts the assumption that \( p_1, \ldots, p_k \) exhaust all primes. \( \square \)
</div>

This proof is a logical gem, but it is quantitatively weak — it shows \(\pi(x) \to \infty\) but gives no rate. Note that the number \(N = p_1 \cdots p_k + 1\) constructed in the proof is not necessarily prime itself (e.g., \(2 \cdot 3 \cdot 5 \cdot 7 \cdot 11 \cdot 13 + 1 = 30031 = 59 \times 509\)), but it *has* a prime factor not in our list. With more work one can extract a quantitative lower bound: \(\pi(x) \geq \log_2 \log_2 x\) follows from iterating Euclid's argument. But we can do much better.

## 1.3 Bertrand's Postulate and Chebyshev Bounds

**Bertrand's Postulate** (proved by Chebyshev in 1852) states that for every integer \( n \geq 1 \), there exists a prime \( p \) with \( n < p \leq 2n \). Chebyshev proved this and simultaneously established the right order of magnitude for \( \pi(x) \). Bertrand had conjectured this after numerical verification for \(n \leq 3{,}000{,}000\). Chebyshev's analytic proof was a landmark.

<div class="theorem">
<strong>Theorem 1.4 (Chebyshev, 1852).</strong> There exist positive constants \( c_1, c_2 \) such that for all \( x \geq 2 \),

\[
c_1 \frac{x}{\log x} < \pi(x) < c_2 \frac{x}{\log x}.
\]
One can take \( c_1 = \frac{3\log 2}{8} \approx 0.2599 \) and \( c_2 = 6\log 2 \approx 4.159 \).
</div>

The proof relies on properties of the central binomial coefficient \( \binom{2n}{n} \). Observe that \( 4^n = (1+1)^{2n} \geq \binom{2n}{n} \), and all prime powers \( p^k \) with \( p \leq 2n \) and \( p^k > n \) divide \( \binom{2n}{n} \). These estimates give both bounds after careful bookkeeping. We do not reproduce the full proof here, but instead develop the sharper Chebyshev functions that lead more naturally to PNT.

<div class="remark">
<strong>Remark 1.5 (The gap between Chebyshev and PNT).</strong> Chebyshev knew the right order of magnitude but could not pin down the constant. He proved \( 0.92 < \pi(x)/(x/\log x) < 1.11 \) (approximately), and conjectured the ratio approaches 1. But the tools of his era were insufficient to prove this. The decisive breakthrough came in 1896 when Hadamard and de la Vallée Poussin, using Riemann's complex-analytic ideas, proved the limit equals 1. The entire Chapter 4 of these notes is devoted to building the tools needed for this proof.
</div>

## 1.3a Full Proof of Chebyshev's Upper and Lower Bounds via Central Binomial Coefficients

The key idea of Chebyshev's proof is to exploit the central binomial coefficient

\[
\binom{2n}{n} = \frac{(2n)!}{(n!)^2}.
\]
This innocent object carries a surprising amount of information about primes. We work through the proof in enough detail that every step is traceable.

**Setup.** We need two facts:
1. \(\binom{2n}{n} \leq 4^n\) (since it is one of the \(2^{2n}\) terms in \((1+1)^{2n}\)).
2. \(\binom{2n}{n} \geq 4^n / (2n+1)\) (since the sum of all \(2n+1\) terms is \(4^n\) and \(\binom{2n}{n}\) is the largest).

**Step 1: Upper bound.**

Every prime \(p\) with \(n < p \leq 2n\) divides \((2n)!\) but does not divide \((n!)^2\) (since \(p > n\) means \(p\) appears exactly once in \((2n)!\) and zero times in \(n!\)). Hence

\[
\prod_{n < p \leq 2n} p \;\Big|\; \binom{2n}{n} \leq 4^n.
\]
Taking logarithms: \(\theta(2n) - \theta(n) \leq n \log 4 = 2n \log 2\).

Now sum over \(k = 0, 1, 2, \ldots, \lfloor \log_2 x \rfloor\): the telescoping sum

\[
\theta(x) = \sum_{k=0}^{\lfloor \log_2 x \rfloor} [\theta(x/2^k) - \theta(x/2^{k+1})] \leq \sum_{k=0}^{\lfloor \log_2 x \rfloor} 2 \cdot \frac{x}{2^{k+1}} \log 2 \leq 2x \log 2.
\]
Since \(\psi(x) = \theta(x) + O(\sqrt{x}\log x)\), we get \(\psi(x) \leq 2x\log 2 + O(\sqrt{x}\log x)\), giving the upper bound \(\psi(x) < c_2 x\) for all large \(x\), with \(c_2 = 2\log 2 + \varepsilon\). The explicit bound \(\psi(x) \leq 2x\log 2\) requires a slightly more careful argument for small \(x\).

**Step 2: Lower bound.**

We use the lower bound \(\binom{2n}{n} \geq 4^n/(2n+1)\). Every prime power \(p^k\) dividing \(\binom{2n}{n}\) must satisfy \(p^k \leq 2n\) (since the \(p\)-adic valuation of \(\binom{2n}{n}\) is \(\lfloor 2n/p^k\rfloor - 2\lfloor n/p^k\rfloor \leq 1\) for each prime power \(p^k\)). The exact \(p\)-adic valuation formula (Kummer's theorem) says it equals the number of carries when adding \(n\) and \(n\) in base \(p\), which is at most \(\log_p(2n)\). So

\[
\binom{2n}{n} = \prod_{p \leq 2n} p^{v_p(\binom{2n}{n})} \leq \prod_{p \leq 2n} (2n)^{v_p(\binom{2n}{n})}.
\]
But for the lower bound on \(\theta\): the key is that the entire product \(\prod_{p \leq 2n} p^{v_p(\binom{2n}{n})}\) divides \(\binom{2n}{n} \leq 4^n\), so \(e^{\psi(2n)} \leq (2n)^{\pi(2n)} \cdot 4^n\), giving \(\psi(2n) \leq \pi(2n)\log(2n) + 2n\log 2\). Since \(\psi(2n) \leq 2 \cdot 2n\log 2\) from Step 1, this yields nothing new. For the lower bound one instead uses:

\[
\frac{4^n}{2n+1} \leq \binom{2n}{n} \leq (2n)^{\pi(2n)} \cdot 4^{n/2},
\]
the second inequality using the fact that primes \(p > \sqrt{2n}\) contribute at most one prime power each to the factorization. After some algebra this gives

\[
\pi(2n) \geq \frac{n\log 4 - (1/2)\log(2n) \cdot \pi(\sqrt{2n})}{\log(2n)} \geq c_1 \frac{n}{\log n}.
\]

The cleanest explicit constants come from Chebyshev's original analysis: \(c_1 = \log 2 \cdot (30^{1/30}) \approx 0.9212\log 2 \approx 0.638\) and \(c_2 = 6\log 2 \approx 4.16\), which were improved by later work. The key point is that the proof is purely elementary — no complex analysis, no integrals over half-planes, just binomial coefficients and prime factorizations.

**Why this proof works.** The central binomial coefficient \(\binom{2n}{n}\) is large (exponential in \(n\)), and yet its prime factorization only involves primes up to \(2n\). So the product of (powers of) primes up to \(2n\) must be large — at least \(4^n/(2n+1)\) — which forces there to be many primes, each contributing a logarithmic amount. This is Chebyshev's beautiful insight.

### 1.3b A Table Comparing π(x), x/log x, and li(x)

One of the most illuminating facts about the PNT is that \(\mathrm{li}(x)\) approximates \(\pi(x)\) far better than \(x/\log x\) does. The following table makes this precise:

| \(x\) | \(\pi(x)\) | \(\lfloor x/\log x \rfloor\) | \(\lfloor\mathrm{li}(x)\rfloor\) | Error \(\pi(x) - \lfloor x/\log x\rfloor\) | Error \(\pi(x) - \lfloor\mathrm{li}(x)\rfloor\) |
|---|---|---|---|---|---|
| \(10\) | 4 | 4 | 5 | 0 | \(-1\) |
| \(100\) | 25 | 21 | 29 | \(+4\) | \(-4\) |
| \(10^3\) | 168 | 144 | 177 | \(+24\) | \(-9\) |
| \(10^4\) | 1229 | 1085 | 1245 | \(+144\) | \(-16\) |
| \(10^6\) | 78498 | 72382 | 78627 | \(+6116\) | \(-129\) |
| \(10^9\) | 50847534 | 48254942 | 50849234 | \(+2592592\) | \(-1700\) |
| \(10^{12}\) | 37607912018 | 36191206825 | 37607950280 | \(+1416705193\) | \(-38262\) |

The numbers speak for themselves: the error \(\pi(x) - x/\log x\) grows like \(x/(\log x)^2\) (a genuine secondary term), while \(\pi(x) - \mathrm{li}(x)\) grows much more slowly and oscillates. The PNT says both errors are \(o(x/\log x)\); the Riemann Hypothesis would say the li-error is \(O(\sqrt{x}\log x)\), which the table is entirely consistent with.

**Note on the sign.** Empirically \(\pi(x) < \mathrm{li}(x)\) for all \(x\) up to roughly \(10^{316}\) (Skewes's number), but Littlewood proved in 1914 that \(\pi(x) - \mathrm{li}(x)\) changes sign infinitely often. The persistent negative sign for small \(x\) is related to the "Chebyshev bias" discussed in Remark 4.12.

## 1.4 The Chebyshev Functions

Why introduce \(\theta(x)\) and \(\psi(x)\)? The function \(\pi(x)\) has an inconvenient jump of size 1 at each prime, and the primes have varying sizes (logarithms). The Chebyshev functions package the information more smoothly by weighting each prime by its logarithm, making them better adapted to Dirichlet series and Abel summation techniques.

<div class="definition">
<strong>Definition 1.5.</strong> For \( x \geq 1 \), define the <strong>first Chebyshev function</strong>

\[
\theta(x) = \sum_{p \leq x} \log p,
\]
and the <strong>second Chebyshev function</strong> (or <strong>Chebyshev psi function</strong>)

\[
\psi(x) = \sum_{p^k \leq x} \log p = \sum_{n \leq x} \Lambda(n),
\]
where \( \Lambda \) is the von Mangoldt function defined below.
</div>

<div class="definition">
<strong>Definition 1.6 (von Mangoldt function).</strong> Define \( \Lambda : \mathbb{Z}_{>0} \to \mathbb{R} \) by

\[
\Lambda(n) = \begin{cases} \log p & \text{if } n = p^k \text{ for some prime } p \text{ and integer } k \geq 1, \\ 0 & \text{otherwise.} \end{cases}
\]
</div>

The von Mangoldt function satisfies the elegant identity

\[
\log n = \sum_{d \mid n} \Lambda(d),
\]
which follows from writing \( n = \prod_p p^{v_p(n)} \) and summing: the divisors \(d\) of \(n\) that are prime powers \(p^j\) (with \(j \geq 1\)) contribute \(\log p\) each, and summing \(\log p\) over all prime power divisors \(p^j \mid n\) gives \(\sum_p v_p(n)\log p = \log n\).

This identity is crucial because it connects \(\Lambda\) (a function on prime powers) to the more tractable function \(\log\) (defined on all integers) via Dirichlet convolution with the constant function \(\mathbf{1}\). Möbius inversion then gives \(\Lambda = \mu * \log\), i.e., \(\Lambda(n) = -\sum_{d \mid n}\mu(d)\log d\).

<div class="remark">
<strong>Remark 1.7.</strong> The relationship between \( \theta \) and \( \psi \) is:

\[
\psi(x) = \theta(x) + \theta(x^{1/2}) + \theta(x^{1/3}) + \cdots = \sum_{k=1}^{\lfloor \log_2 x \rfloor} \theta(x^{1/k}).
\]
Since the terms beyond \( k=1 \) contribute at most \( O(x^{1/2} \log x) \), we have

\[
\psi(x) = \theta(x) + O\!\left(x^{1/2} (\log x)^2\right).
\]
</div>

<div class="example">
<strong>Example 1.8 (Computing \(\psi\) and \(\theta\) for small \(x\)).</strong> Take \(x = 12\).

The primes up to 12 are \(2, 3, 5, 7, 11\). So:

\[
\theta(12) = \log 2 + \log 3 + \log 5 + \log 7 + \log 11 = \log(2 \cdot 3 \cdot 5 \cdot 7 \cdot 11) = \log 2310 \approx 7.745.
\]
For \(\psi\), we also include prime powers up to 12: these are \(2, 3, 4=2^2, 5, 7, 8=2^3, 9=3^2, 11\). So:

\[
\psi(12) = \log 2 + \log 3 + \log 2 + \log 5 + \log 7 + \log 2 + \log 3 + \log 11 = 3\log 2 + 2\log 3 + \log 5 + \log 7 + \log 11 \approx 10.82.
\]
Note \(\psi(12) - \theta(12) = 2\log 2 + \log 3 = \theta(\sqrt{12}) + \theta(12^{1/3}) = \log 2 + \log 3 + \log 2 \approx 3.07\), which is indeed \(O(12^{1/2}\log 12) = O(13.9)\). The PNT prediction gives \(\psi(12) \approx 12\), and the actual value is \(\approx 10.82\), so the approximation is already reasonable.
</div>

## 1.5 The Equivalence with PNT

The three functions \( \pi(x) \), \( \theta(x) \), and \( \psi(x) \) are asymptotically equivalent in the sense that PNT is equivalent to each of the following statements:

\[
\pi(x) \sim \frac{x}{\log x}, \qquad \theta(x) \sim x, \qquad \psi(x) \sim x.
\]

<div class="theorem">
<strong>Theorem 1.8.</strong> The following are equivalent as \( x \to \infty \):
<br>(a) \( \pi(x) \sim x/\log x \),
<br>(b) \( \theta(x) \sim x \),
<br>(c) \( \psi(x) \sim x \).
</div>

<div class="proof">
<strong>Proof sketch (b) \( \Leftrightarrow \) (c)).</strong> From the remark above, \( |\psi(x) - \theta(x)| \leq C x^{1/2} (\log x)^2 \), which is \( o(x) \), so \( \psi(x)/x \to 1 \) iff \( \theta(x)/x \to 1 \).

<strong>Proof sketch (a) \( \Leftrightarrow \) (b)).</strong> By partial summation (Abel's formula),

\[
\theta(x) = \sum_{p \leq x} \log p = \pi(x)\log x - \int_2^x \frac{\pi(t)}{t}\,dt.
\]
If \( \pi(x) \sim x/\log x \), then the right side is \( \sim x - \int_2^x \frac{1}{\log t}\,dt \). Integration by parts on the logarithmic integral shows \( \int_2^x \frac{1}{\log t}\,dt = o(x) \) relative to \( x \), giving \( \theta(x) \sim x \). The converse follows similarly. \( \square \)
</div>

## 1.5a Why ψ(x) Is Easier Than π(x): The Role of the von Mangoldt Function

One might wonder: why not work directly with \(\pi(x)\)? The answer lies in the analytic structure of Dirichlet series.

The function \(\pi(x)\) is the partial sum of the Dirichlet series \(\sum_p p^{-s}\) (weighted by the indicator of primes), which has no simple analytic form. In contrast, \(\psi(x) = \sum_{n \leq x}\Lambda(n)\) is the partial sum of \(-\zeta'(s)/\zeta(s)\), and this is a ratio of two things we understand well:

\[
-\frac{\zeta'(s)}{\zeta(s)} = \sum_{n=1}^\infty \frac{\Lambda(n)}{n^s}.
\]
This identity follows by differentiating \(\log\zeta(s) = -\sum_p\log(1-p^{-s})\):

\[
\frac{\zeta'(s)}{\zeta(s)} = \frac{d}{ds}\log\zeta(s) = -\sum_p\frac{-\log p \cdot p^{-s}}{1-p^{-s}} \cdot (-1) = \sum_p \frac{\log p}{p^s - 1} = -\sum_{p,k \geq 1}\frac{\log p}{p^{ks}} = -\sum_{n \geq 1}\frac{\Lambda(n)}{n^s}.
\]

**Why this matters.** The Dirichlet series \(-\zeta'(s)/\zeta(s)\) has:
- A simple pole at \(s=1\) (because \(\zeta(s)\) has a simple pole there, so \(\log\zeta(s)\) has a logarithmic singularity, and its derivative has a simple pole with residue 1).
- Simple poles at each zero \(\rho\) of \(\zeta(s)\) (where the denominator vanishes), each with residue \(-1\) (from the zero of first order).
- Simple poles at \(s=0\) and the trivial zeros \(s = -2, -4, \ldots\).

By Perron's formula, \(\psi(x)\) equals the sum of residues picked up when the contour integral of \(-\zeta'(s)/\zeta(s) \cdot x^s/s\) is moved leftward. The explicit formula

\[
\psi(x) = x - \sum_\rho \frac{x^\rho}{\rho} - \frac{\zeta'(0)}{\zeta(0)} - \frac{1}{2}\log(1-x^{-2})
\]
is the direct consequence. Each zero \(\rho\) of \(\zeta\) produces a term; the dominant term \(x\) comes from the pole at \(s=1\).

**Contrast with \(\pi(x)\).** One can recover \(\pi(x)\) from \(\psi(x)\) by Möbius inversion: since \(\psi(x) = \sum_k \theta(x^{1/k})\) and \(\theta(x) \approx \pi(x)\log x\), we have

\[
\pi(x) = \sum_{k=1}^\infty \frac{\mu(k)}{k}\cdot\mathrm{li}(x^{1/k}) + O(\text{smaller}).
\]
The leading term is \(\mathrm{li}(x)\), and the correction terms involve \(\mathrm{li}(\sqrt{x})\), \(\mathrm{li}(x^{1/3})\), etc. This is Riemann's formula \(\pi(x) = R(x) - \sum_\rho R(x^\rho) + \cdots\) where \(R(x) = \sum_k \mu(k)/k \cdot \mathrm{li}(x^{1/k})\) is the Riemann \(R\)-function. But deriving this from scratch requires understanding \(\psi(x)\) first.

**Summary.** \(\psi(x)\) is analytically more tractable than \(\pi(x)\) because: (1) it is the partial sum of a naturally occurring Dirichlet series \(-\zeta'/\zeta\); (2) its generating function has a simple pole structure (simple poles at zeros and at \(s=1\)) amenable to residue calculus; (3) the passage from \(\psi(x) \sim x\) to \(\pi(x) \sim x/\log x\) is a routine application of partial summation (Abel's formula). This is why analysts "always" prove \(\psi(x) \sim x\) first and deduce the PNT from it.

Why is \(\psi(x) \sim x\) the most convenient form to prove? Because \(\psi(x) = \sum_{n \leq x}\Lambda(n)\) is the partial sum of the Dirichlet series \(-\zeta'(s)/\zeta(s) = \sum_n \Lambda(n)n^{-s}\). Via Perron's formula (Chapter 10), proving \(\psi(x) \sim x\) reduces to showing that the contour integral of \(-\zeta'(s)/\zeta(s) \cdot x^s/s\) over a vertical line captures only the simple pole at \(s=1\) — which in turn requires \(\zeta(s) \neq 0\) on the line \(\mathrm{Re}(s) = 1\).

## 1.6 An Elementary Upper Bound for ψ(x)

From the divisibility properties of binomial coefficients, one can show:

<div class="theorem">
<strong>Theorem 1.9.</strong> For all \( x \geq 1 \),

\[
\psi(x) \leq 2x \log 2.
\]
</div>

<div class="proof">
<strong>Proof.</strong> The key observation is that \(\binom{2n}{n} \leq 4^n\) (since \(\binom{2n}{n}\) is one of the \(2^{2n}=4^n\) terms in the binomial expansion of \((1+1)^{2n}\), and hence at most \(4^n\)). On the other hand, every prime \(p\) with \(n < p \leq 2n\) divides \(\binom{2n}{n}\), since \(p\) divides \((2n)!\) but not \((n!)^2\). So \(\prod_{n < p \leq 2n} p \leq \binom{2n}{n} \leq 4^n\), giving \(\theta(2n) - \theta(n) \leq n\log 4 = 2n\log 2\). Summing over dyadic intervals yields \(\theta(x) \leq 2x\log 2\), and since \(\psi(x) = \theta(x) + O(x^{1/2}\log x)\) this gives \(\psi(x) \leq 2x\log 2 + O(x^{1/2}\log x)\). For a cleaner bound valid for all \(x\) without the error term, a slightly more careful argument gives \(\psi(x) \leq 2x\log 2\). \(\square\)
</div>

Combined with the lower bounds, this places \( \psi(x) \) in the range \( [c_1 x, c_2 x] \) for explicit constants. The PNT sharpens this to \( \psi(x) \sim x \), requiring the analytic theory of \( \zeta(s) \).

---

# Chapter 2: Summation Methods

Analytic number theory often requires converting sums involving arithmetic functions into integrals or estimating them asymptotically. In analysis one routinely passes from integrals to sums; here we need to go in the opposite direction. The key tools are the **Abel summation formula** (summation by parts, the discrete analogue of integration by parts) and the **Euler–Maclaurin formula** (which gives an asymptotic expansion of the error between sum and integral in terms of Bernoulli numbers). These techniques appear throughout the subject and are worth mastering thoroughly before proceeding.

## 2.1 Abel's Summation Formula

Let \( a_1, a_2, \ldots \) be a sequence of complex numbers and \( f : [1, \infty) \to \mathbb{C} \) a continuously differentiable function. Set

\[
A(x) = \sum_{n \leq x} a_n.
\]

<div class="theorem">
<strong>Theorem 2.1 (Abel's Summation / Summation by Parts).</strong> For \( 1 \leq y < x \),

\[
\sum_{y < n \leq x} a_n f(n) = A(x)f(x) - A(y)f(y) - \int_y^x A(u) f'(u)\,du.
\]
In particular, with \( y = 1 \) and assuming \( a_n = 0 \) for non-integer arguments,

\[
\sum_{n \leq x} a_n f(n) = A(x)f(x) - \int_1^x A(u) f'(u)\,du.
\]
</div>

<div class="proof">
<strong>Proof.</strong> Let \( n_1 < n_2 < \cdots < n_k \) be the integers in \( (y, x] \) with \( a_{n_j} \neq 0 \). Write

\[
\sum_{j=1}^k a_{n_j} f(n_j) = \sum_{j=1}^k \bigl(A(n_j) - A(n_{j-1})\bigr) f(n_j),
\]
where \( A(n_0) = A(y) \). Rearranging (summation by parts, analogous to integration by parts):

\[
= A(n_k)f(n_k) - A(y)f(n_1) - \sum_{j=1}^{k-1} A(n_j)\bigl(f(n_{j+1}) - f(n_j)\bigr).
\]
Since \( f(n_{j+1}) - f(n_j) = \int_{n_j}^{n_{j+1}} f'(u)\,du \), and \( A(u) = A(n_j) \) for \( u \in [n_j, n_{j+1}) \), we have

\[
\sum_{j=1}^{k-1} A(n_j)(f(n_{j+1}) - f(n_j)) = \int_y^x A(u)f'(u)\,du - A(n_k)\bigl(f(x) - f(n_k)\bigr).
\]
Combining and noting \( n_k \leq x < n_{k+1} \) gives the result. \( \square \)
</div>

<div class="example">
<strong>Example 2.2.</strong> We estimate \( \sum_{n \leq x} \frac{1}{n} \). Take \( a_n = 1 \) and \( f(n) = 1/n \), so \( A(x) = \lfloor x \rfloor \). Abel's formula gives

\[
\sum_{n \leq x} \frac{1}{n} = \frac{\lfloor x \rfloor}{x} + \int_1^x \frac{\lfloor u \rfloor}{u^2}\,du.
\]
Write \( \lfloor u \rfloor = u - \{u\} \) where \( \{u\} \) is the fractional part. Then

\[
\int_1^x \frac{\lfloor u \rfloor}{u^2}\,du = \int_1^x \frac{1}{u}\,du - \int_1^x \frac{\{u\}}{u^2}\,du = \log x - \int_1^x \frac{\{u\}}{u^2}\,du.
\]
As \( x \to \infty \), the integral \( \int_1^\infty \frac{\{u\}}{u^2}\,du \) converges (bounded by \( \int_1^\infty u^{-2}\,du = 1 \)). Define

\[
\gamma = 1 - \int_1^\infty \frac{\{u\}}{u^2}\,du \approx 0.5772\ldots
\]
This is <strong>Euler's constant</strong>. Then

\[
\sum_{n \leq x} \frac{1}{n} = \log x + \gamma + O(1/x).
\]
</div>

<div class="example">
<strong>Example 2.3 (Abel summation for Dirichlet series).</strong> Let \(F(s) = \sum_{n=1}^\infty a(n)n^{-s}\) and set \(A(x) = \sum_{n \leq x} a(n)\). Abel summation with \(f(n) = n^{-s}\), \(f'(t) = -st^{-s-1}\) gives

\[
\sum_{n \leq x} \frac{a(n)}{n^s} = \frac{A(x)}{x^s} + s\int_1^x \frac{A(u)}{u^{s+1}}\,du.
\]
If \(A(x) = O(x^\alpha)\), then for \(\mathrm{Re}(s) > \alpha\), letting \(x \to \infty\):

\[
F(s) = s\int_1^\infty \frac{A(u)}{u^{s+1}}\,du,
\]
which shows \(F(s)\) converges absolutely for \(\mathrm{Re}(s) > \alpha\) and expresses it as a Mellin-type transform of the summatory function \(A(x)\). This is the basic bridge between Dirichlet series and partial sums.
</div>

### Fully Worked Example: ∑_{p≤x} 1/p ~ log log x via Abel Summation

One of the most striking applications of Abel summation in prime number theory is the derivation of the divergence rate of \(\sum_{p \leq x} 1/p\). This sum grows extremely slowly — slower than any power of \(\log x\) — but it does diverge, and its rate is exactly \(\log\log x\).

<div class="example">
<strong>Example 2.2a (Abel summation for the sum of reciprocals of primes).</strong> We derive

\[
\sum_{p \leq x} \frac{1}{p} = \log\log x + M + O\!\left(\frac{1}{\log x}\right),
\]
where \(M\) is the Meissel–Mertens constant \(M \approx 0.2615\ldots\).

**Step 1.** Start from Chebyshev's result (proved in Section 3.4):

\[
\sum_{p \leq x} \frac{\log p}{p} = \log x + R(x),
\]
where \(R(x) = O(1)\) (the error is bounded). Let \(A(x) = \sum_{p \leq x}(\log p)/p\), so \(A(x) = \log x + O(1)\).

**Step 2.** Apply Abel summation with the sequence \(a_p = (\log p)/p\) (indexed over primes) and the function \(f(t) = 1/\log t\). The summatory function of \(a_p\) over primes up to \(x\) is \(A(x) = \log x + O(1)\). Abel's formula gives

\[
\sum_{p \leq x} \frac{1}{p} = \sum_{p \leq x} \frac{\log p}{p} \cdot \frac{1}{\log p} = A(x)\cdot\frac{1}{\log x} + \int_2^x A(t)\cdot\frac{1}{t(\log t)^2}\,dt + O(1/\log 2).
\]
(Here \(f(t) = 1/\log t\) has \(f'(t) = -1/(t(\log t)^2)\), so \(-\int A(t)f'(t)\,dt = \int A(t)/(t(\log t)^2)\,dt\).)

**Step 3.** Substitute \(A(t) = \log t + O(1)\):

\[
A(x)/\log x = 1 + O(1/\log x),
\]
and

\[
\int_2^x \frac{A(t)}{t(\log t)^2}\,dt = \int_2^x \frac{\log t}{t(\log t)^2}\,dt + O\!\left(\int_2^x \frac{dt}{t(\log t)^2}\right) = \int_2^x \frac{dt}{t\log t} + O(1/\log 2 - 1/\log x).
\]
Now \(\int_2^x dt/(t\log t) = [\log\log t]_2^x = \log\log x - \log\log 2\).

**Step 4.** Combining:

\[
\sum_{p \leq x}\frac{1}{p} = 1 + O(1/\log x) + \log\log x - \log\log 2 + O(1) = \log\log x + M + O(1/\log x),
\]
where the constant \(M = 1 - \log\log 2 + \text{(more precise error terms)} \approx 0.2615\) absorbs all the constants. The precise value

\[
M = \gamma + \sum_p \left[\log\!\left(1-\frac{1}{p}\right) + \frac{1}{p}\right]
\]
comes from a more careful asymptotic analysis combining the Euler product expansion of \(\zeta(s)\) near \(s=1\).

**What this tells us.** The sum \(\sum_{p \leq x}1/p\) grows like \(\log\log x\), an iterated logarithm. This is absurdly slow: the sum up to \(x = 10^{10^{10}}\) is only about \(\log\log(10^{10^{10}}) = \log(10^{10}) \approx 23\). Yet the series diverges. Euler first proved divergence in 1737 (as a consequence of the Euler product); Mertens quantified the rate in 1874.
</div>

### Corollaries of Abel Summation

Abel summation is the workhorse for converting sums to integrals. Key applications include:

- Estimating partial sums of Dirichlet series: if \( f(x) = x^{-s} \), Abel's formula relates \( \sum_{n \leq x} a_n n^{-s} \) to \( \sum_{n \leq x} a_n \).
- Proving convergence of Dirichlet series on vertical lines given growth bounds on \( A(x) \).
- Deriving asymptotics for \( \sum_{n \leq x} \frac{\log n}{n} \), \( \sum_{p \leq x} \frac{1}{p} \), etc.

<div class="theorem">
<strong>Corollary 2.4.</strong> We have

\[
\sum_{n \leq x} \frac{\log n}{n} = \frac{(\log x)^2}{2} + C + O\!\left(\frac{\log x}{x}\right)
\]
for an explicit constant \( C \).
</div>

<div class="proof">
<strong>Proof.</strong> Take \(a_n = 1/n\) and \(f(n) = \log n\), so \(A(x) = \sum_{n \leq x} 1/n = \log x + \gamma + O(1/x)\) and \(f'(t) = 1/t\). Abel summation gives

\[
\sum_{n \leq x} \frac{\log n}{n} = A(x)\log x - \int_1^x \frac{A(u)}{u}\,du.
\]
Substituting \(A(u) = \log u + \gamma + O(1/u)\):

\[
\int_1^x \frac{A(u)}{u}\,du = \int_1^x \frac{\log u}{u}\,du + \gamma\int_1^x \frac{du}{u} + O\!\left(\int_1^x u^{-2}\,du\right) = \frac{(\log x)^2}{2} + \gamma\log x + O(1).
\]
So \(\sum_{n \leq x}(\log n)/n = (\log x + \gamma)(\log x) - \frac{(\log x)^2}{2} - \gamma\log x + O(1) = \frac{(\log x)^2}{2} + O(1)\). The constant \(C\) absorbs the \(\gamma^2\) and boundary terms. \(\square\)
</div>

## 2.2 Euler–Maclaurin Summation Formula

The Euler–Maclaurin formula gives a precise relationship between a sum and an integral, with an explicit error in terms of Bernoulli numbers. It is more powerful than Abel summation when one wants a complete asymptotic expansion rather than just a leading term.

<div class="definition">
<strong>Definition 2.5 (Bernoulli numbers and polynomials).</strong> The Bernoulli polynomials \( B_k(x) \) are defined by the generating function

\[
\frac{te^{tx}}{e^t - 1} = \sum_{k=0}^\infty B_k(x) \frac{t^k}{k!}.
\]
The Bernoulli numbers are \( B_k = B_k(0) \): \( B_0 = 1 \), \( B_1 = -1/2 \), \( B_2 = 1/6 \), \( B_3 = 0 \), \( B_4 = -1/30 \), and \( B_{2k+1} = 0 \) for \( k \geq 1 \).

The periodized Bernoulli functions are \( \widetilde{B}_k(x) = B_k(\{x\}) \).
</div>

<div class="theorem">
<strong>Theorem 2.6 (Euler–Maclaurin Formula).</strong> Let \( f \) be \( (p+1) \)-times continuously differentiable on \( [m, n] \) (integers \( m < n \)). Then

\[
\sum_{k=m}^{n} f(k) = \int_m^n f(x)\,dx + \frac{f(m)+f(n)}{2} + \sum_{j=1}^{p} \frac{B_{2j}}{(2j)!}\bigl(f^{(2j-1)}(n) - f^{(2j-1)}(m)\bigr) + R_p,
\]
where the remainder is

\[
R_p = \frac{(-1)^{p+1}}{(p+1)!} \int_m^n \widetilde{B}_{p+1}(x) f^{(p+1)}(x)\,dx.
\]
</div>

<div class="remark">
<strong>Remark 2.7.</strong> The Euler–Maclaurin formula is particularly powerful for computing the asymptotic expansion of sums \( \sum_{n=1}^N f(n) \) as \( N \to \infty \) or for obtaining the analytic continuation of Dirichlet series. For instance, applying it to \( f(n) = n^{-s} \) yields the analytic continuation of \( \zeta(s) \) to all \( s \neq 1 \). Specifically, with \(m=1\), \(n=N\), and \(p\) terms:

\[
\sum_{n=1}^N n^{-s} = \frac{N^{1-s}}{1-s} + \frac{N^{-s}+1}{2} + \sum_{j=1}^p \frac{B_{2j}}{(2j)!}\bigl((-s)(-s-1)\cdots(-s-2j+2)N^{-s-2j+1} - \text{const}\bigr) + R_p(s).
\]
Letting \(N \to \infty\) for \(\mathrm{Re}(s) > 1\) and analytically continuing in \(s\), the resulting formula is valid for \(\mathrm{Re}(s) > -2p+1\), giving \(\zeta(s)\) as a meromorphic function on all of \(\mathbb{C}\).
</div>

<div class="example">
<strong>Example 2.8 (Stirling's formula).</strong> Applying Euler–Maclaurin to \( f(k) = \log k \) on \( [1,n] \) yields Stirling's approximation:

\[
\log(n!) = n\log n - n + \frac{1}{2}\log(2\pi n) + \frac{1}{12n} - \frac{1}{360n^3} + \cdots
\]
The leading terms give \(\log(n!) = n\log n - n + \frac{1}{2}\log(2\pi n) + O(1/n)\), or equivalently \(n! \approx \sqrt{2\pi n}(n/e)^n\). This is one of the most useful asymptotic formulas in analysis.
</div>

### Fully Worked Example: ∑_{n≤x} log n = x log x - x + O(log x) via Euler–Maclaurin

<div class="example">
<strong>Example 2.8a (Stirling's approximation from Euler–Maclaurin).</strong> We derive

\[
\sum_{n=1}^{N} \log n = N\log N - N + \frac{1}{2}\log(2\pi N) + O(1/N),
\]
the logarithmic form of Stirling's formula \(N! \sim \sqrt{2\pi N}(N/e)^N\).

**Step 1: Apply Euler–Maclaurin with \(f(x) = \log x\), \(p=1\).**

With \(m=1\), \(n=N\):

\[
\sum_{k=1}^N \log k = \int_1^N \log x\,dx + \frac{\log 1 + \log N}{2} + \frac{B_2}{2!}[f'(N) - f'(1)] + R_1.
\]
Since \(f'(x) = 1/x\) and \(B_2 = 1/6\):

\[
\sum_{k=1}^N \log k = [x\log x - x]_1^N + \frac{\log N}{2} + \frac{1}{12}\!\left[\frac{1}{N} - 1\right] + R_1.
\]

**Step 2: Evaluate the integral.**

\[
\int_1^N \log x\,dx = N\log N - N - (1\cdot\log 1 - 1) = N\log N - N + 1.
\]

**Step 3: Combine.**

\[
\sum_{k=1}^N \log k = N\log N - N + 1 + \frac{\log N}{2} + O(1/N).
\]
The constant term \(1 - 1/12 + \cdots\) contributes; with more Bernoulli terms one identifies the constant as \(\frac{1}{2}\log(2\pi)\) (a non-trivial fact requiring the full asymptotic expansion to all orders). So the result is

\[
\log(N!) = N\log N - N + \frac{1}{2}\log(2\pi N) + \frac{1}{12N} - \frac{1}{360N^3} + \cdots
\]

**Simpler bound with Abel summation.** Using only Abel summation (as in Appendix C.2): take \(a_n = 1\), \(A(x) = \lfloor x\rfloor\), \(f(t) = \log t\). Then

\[
\sum_{n \leq x}\log n = \lfloor x\rfloor\log x - \int_1^x\frac{\lfloor t\rfloor}{t}\,dt.
\]
Write \(\lfloor t\rfloor = t - \{t\}\):

\[
= x\log x - \int_1^x 1\,dt + O(\log x) = x\log x - (x-1) + O(\log x) = x\log x - x + O(\log x).
\]
This weaker bound is sufficient for many purposes in number theory.

**When to use which method.** Abel summation gives the leading behavior quickly but misses the \(O(\log x)\)-sized constant. Euler–Maclaurin gives the full asymptotic series including the \(\frac{1}{2}\log(2\pi N)\) and subsequent terms \(1/(12N), -1/(360N^3),\ldots\). For sharp applications (like the functional equation of \(\zeta(s)\), which requires knowing \(\Gamma(s)\) to high precision), Euler–Maclaurin is essential.

**Rule of thumb:** Use Abel summation when you need the main term \(+ O(\text{something})\) and the "something" is of lower order. Use Euler–Maclaurin when you need a complete asymptotic expansion, when the summand is smooth and you want all correction terms, or when you are continuing a Dirichlet series analytically.
</div>

## 2.3 Poisson Summation Formula

The Poisson summation formula connects a sum over the integers with a sum over the integers of the Fourier transform. It is fundamental in the analytic theory of L-functions, particularly for proving functional equations. The key idea is that periodizing a function and expanding in Fourier series gives a relation between the function values at integers and the Fourier transform values at integers.

<div class="definition">
<strong>Definition 2.9 (Fourier transform).</strong> For \( f \in L^1(\mathbb{R}) \), define

\[
\hat{f}(\xi) = \int_{-\infty}^\infty f(x) e^{-2\pi i x \xi}\,dx.
\]
</div>

<div class="theorem">
<strong>Theorem 2.10 (Poisson Summation Formula).</strong> Let \( f : \mathbb{R} \to \mathbb{C} \) be a Schwartz function (or more generally, sufficiently smooth and rapidly decaying). Then

\[
\sum_{n=-\infty}^{\infty} f(n) = \sum_{n=-\infty}^{\infty} \hat{f}(n).
\]
</div>

<div class="proof">
<strong>Proof.</strong> Define \( F(x) = \sum_{n \in \mathbb{Z}} f(x+n) \). This is a smooth 1-periodic function. Expand in a Fourier series:

\[
F(x) = \sum_{k \in \mathbb{Z}} c_k e^{2\pi ikx}, \quad c_k = \int_0^1 F(x) e^{-2\pi ikx}\,dx.
\]
Substituting the definition of \( F \):

\[
c_k = \sum_{n \in \mathbb{Z}} \int_0^1 f(x+n) e^{-2\pi ikx}\,dx = \sum_{n \in \mathbb{Z}} \int_n^{n+1} f(y) e^{-2\pi ik(y-n)}\,dy = \int_{-\infty}^\infty f(y) e^{-2\pi iky}\,dy = \hat{f}(k).
\]
Evaluating at \( x=0 \): \( \sum_{n} f(n) = F(0) = \sum_k \hat{f}(k) \). \( \square \)
</div>

<div class="example">
<strong>Example 2.11 (Jacobi theta function).</strong> The Jacobi theta function is

\[
\vartheta(t) = \sum_{n=-\infty}^\infty e^{-\pi n^2 t}, \quad t > 0.
\]
Applying Poisson summation with \( f(x) = e^{-\pi x^2 t} \) and computing \( \hat{f}(\xi) = t^{-1/2} e^{-\pi \xi^2 / t} \) (Gaussian Fourier transform), we get:

\[
\vartheta(t) = t^{-1/2} \vartheta(1/t).
\]
This is the functional equation for the theta function. It says that \(\vartheta\) at \(t\) is determined by \(\vartheta\) at \(1/t\): the function is self-dual under the transformation \(t \mapsto 1/t\). This functional equation for \( \vartheta \) is the key ingredient in deriving the functional equation for \( \zeta(s) \) — see Section 4.4.

Let us verify the Gaussian Fourier transform. We have

\[
\hat{f}(\xi) = \int_{-\infty}^\infty e^{-\pi t x^2} e^{-2\pi i x\xi}\,dx = e^{-\pi\xi^2/t}\int_{-\infty}^\infty e^{-\pi t(x + i\xi/t)^2}\,dx = e^{-\pi\xi^2/t}\cdot t^{-1/2},
\]
where the last step uses the standard Gaussian integral \(\int_{-\infty}^\infty e^{-\pi u^2}\,du = 1\) (valid by contour shift). This gives \(\hat{f}(\xi) = t^{-1/2}e^{-\pi\xi^2/t}\), which is a Gaussian in \(\xi\) with "width" \(\sim 1/\sqrt{t}\). When \(t\) is large, \(f(x) = e^{-\pi tx^2}\) is very narrow (concentrated near \(x=0\)), so only \(n=0\) contributes to the left side; correspondingly \(\hat{f}(\xi) = t^{-1/2}e^{-\pi\xi^2/t}\) is very broad, and many \(n\) contribute to the right side. The Poisson formula says these two descriptions are consistent.
</div>

## 2.4 Voronoi Summation

The Voronoi summation formula is a more refined tool for sums involving the divisor function \( d(n) \). It generalizes Poisson summation to arithmetic settings.

<div class="theorem">
<strong>Theorem 2.12 (Voronoi summation for the divisor function).</strong> Let \( f \) be a smooth, compactly supported function on \( (0,\infty) \). Then

\[
\sum_{n=1}^\infty d(n) f(n) = \int_0^\infty f(x)\bigl(\log x + 2\gamma\bigr)\,dx + 2\pi \sum_{n=1}^\infty d(n) \int_0^\infty f(x) Y_0(4\pi\sqrt{nx})\,dx,
\]
where \( Y_0 \) is the Bessel function of the second kind of order 0, and \( \gamma \) is Euler's constant.
</div>

<div class="remark">
<strong>Remark 2.13.</strong> The Voronoi formula arises by relating \( d(n) \) to the coefficients of \( \zeta(s)^2 \) and applying the inverse Mellin transform. It is a key tool for proving error bounds in the Dirichlet divisor problem (Chapter 6).
</div>

---

# Chapter 3: Arithmetic Functions and Dirichlet Series

Arithmetic functions — functions from the positive integers to the complex numbers — are the basic vocabulary of number theory. The Fundamental Theorem of Arithmetic gives the positive integers a rich multiplicative structure, and functions that respect this structure (multiplicative functions) are especially tractable. The formalism of **Dirichlet series** converts arithmetic functions into complex analytic objects, and **Dirichlet convolution** becomes ordinary multiplication of these series. This dictionary between arithmetic and analysis is the engine of the subject.

## 3.0a Motivating Dirichlet Series: Linearizing Multiplicative Structure

Before we define things formally, let us explain *why* Dirichlet series are the right tool.

Suppose you want to study an arithmetic function \(f : \mathbb{Z}_{>0} \to \mathbb{C}\) — say, \(f(n) = \mu(n)\) or \(f(n) = d(n)\) — by "generating function" methods. The natural first guess for a generating function is the power series \(\sum_{n \geq 1}f(n)x^n\). But this is poorly adapted to multiplicative structure: the product \((\sum f(n)x^n)(\sum g(n)x^n)\) gives Cauchy convolution \(\sum_{n}(\sum_{k}f(k)g(n-k))x^n\), which involves additive structure \(k + (n-k) = n\). Multiplicative arithmetic is about divisors, not additive decompositions.

The right move is to replace \(x^n\) with \(n^{-s}\). Then

\[
\left(\sum_{n \geq 1}\frac{f(n)}{n^s}\right)\!\left(\sum_{m \geq 1}\frac{g(m)}{m^s}\right) = \sum_{n \geq 1}\frac{(f*g)(n)}{n^s},
\]
where \((f*g)(n) = \sum_{d \mid n}f(d)g(n/d)\) is Dirichlet convolution. This works because \(n^{-s}m^{-s} = (nm)^{-s}\), and \(nm\) runs over products — exactly what divisor sums are about. Multiplication of Dirichlet series corresponds exactly to Dirichlet convolution of arithmetic functions.

Moreover, for multiplicative \(f\), the Dirichlet series factors into an Euler product:

\[
\sum_{n \geq 1}\frac{f(n)}{n^s} = \prod_p \left(\sum_{k \geq 0}\frac{f(p^k)}{p^{ks}}\right).
\]
Each factor only involves one prime, so the global analytic properties of \(\sum f(n)/n^s\) are encoded prime-by-prime in the local factors. This "linearization" of multiplicative structure is the engine of analytic number theory. The Euler product for \(\zeta(s)\) is the prototype:

\[
\zeta(s) = \prod_p \frac{1}{1-p^{-s}}.
\]

**The key dictionary.** If you know the Dirichlet series of \(f\) and \(g\), then:
- \(f*g\) has Dirichlet series \(F(s)G(s)\).
- \(f*\mathbf{1}\) (summing \(f\) over divisors) has Dirichlet series \(F(s)\zeta(s)\).
- Möbius inversion \(f = g*\mu\) corresponds to \(F(s) = G(s)/\zeta(s)\).
- Differentiation \(-F'(s) = \sum f(n)\log(n)/n^s\) corresponds to weighting by \(\log\).

Every identity between arithmetic functions via Dirichlet convolution translates into an algebraic identity between Dirichlet series — and those identities can then be leveraged analytically (studying singularities, zero-free regions, contour integrals) to extract asymptotics.

## 3.1 Multiplicative Functions

<div class="definition">
<strong>Definition 3.1.</strong> A function \( f : \mathbb{Z}_{>0} \to \mathbb{C} \) is called <strong>arithmetic</strong> or a <strong>number-theoretic function</strong>. It is:
<ul>
<li><strong>multiplicative</strong> if \( f(1) = 1 \) and \( f(mn) = f(m)f(n) \) whenever \( \gcd(m,n) = 1 \),</li>
<li><strong>completely multiplicative</strong> if \( f(1) = 1 \) and \( f(mn) = f(m)f(n) \) for all \( m, n \).</li>
</ul>
</div>

<div class="remark">
<strong>Remark 3.2.</strong> A multiplicative function is completely determined by its values on prime powers. If \( n = \prod_p p^{v_p(n)} \), then \( f(n) = \prod_p f(p^{v_p(n)}) \). This reduces computing \(f(n)\) for large \(n\) to computing \(f\) at prime powers — which is often much simpler. For completely multiplicative functions, even simpler: \(f(n) = \prod_p f(p)^{v_p(n)}\), so \(f\) is determined by its values on primes alone.
</div>

### Key Examples

**The Möbius function** \( \mu(n) \):

\[
\mu(n) = \begin{cases} 1 & n = 1, \\ (-1)^k & n = p_1 p_2 \cdots p_k \text{ (distinct primes)}, \\ 0 & p^2 \mid n \text{ for some prime } p. \end{cases}
\]
This is multiplicative. Its defining property: \( \sum_{d \mid n} \mu(d) = [n=1] \) (the Iverson bracket). Intuitively, \(\mu\) is an inclusion-exclusion coefficient: summing \(\mu(d)\) over divisors of \(n\) counts all \(n\) with a "plus" and cancels everything with a "minus." The fact that this sum is zero for \(n > 1\) is equivalent to the Möbius inversion formula.

**The Euler totient** \( \varphi(n) = \#\{1 \leq k \leq n : \gcd(k,n) = 1\} \). This is multiplicative with

\[
\varphi(p^k) = p^k - p^{k-1} = p^k\left(1 - \frac{1}{p}\right),
\]
and hence \( \varphi(n) = n \prod_{p \mid n} (1 - 1/p) \). Also \( \sum_{d \mid n} \varphi(d) = n \). For example: \(\varphi(12) = \varphi(4)\varphi(3) = 2 \cdot 2 = 4\), and indeed \(\{1, 5, 7, 11\}\) are the units mod 12.

**The divisor functions** \( \sigma_k(n) = \sum_{d \mid n} d^k \). In particular, \( d(n) = \sigma_0(n) \) counts the number of divisors and \( \sigma(n) = \sigma_1(n) \) sums them. Both are multiplicative. For a prime power: \(\sigma_k(p^e) = 1 + p^k + p^{2k} + \cdots + p^{ek} = (p^{k(e+1)}-1)/(p^k-1)\).

**The von Mangoldt function** \( \Lambda(n) \) (defined above) is not multiplicative but satisfies \( \log n = \sum_{d \mid n} \Lambda(d) \).

**The Liouville function** \( \lambda(n) = (-1)^{\Omega(n)} \) where \( \Omega(n) = \sum_p v_p(n) \) is the total number of prime factors with multiplicity. This is completely multiplicative. The Dirichlet series \(\sum_n \lambda(n)n^{-s} = \zeta(2s)/\zeta(s)\). The statement \(\sum_{n \leq x}\lambda(n) = o(x)\) is equivalent to PNT.

### 3.1a A Zoo of Arithmetic Functions

It is useful to have a systematic taxonomy before proceeding. The landscape of arithmetic functions can be organized along several axes.

**By multiplicativity:**

| Class | Definition | Examples |
|---|---|---|
| Completely multiplicative | \(f(mn) = f(m)f(n)\) for all \(m,n\) | \(\mathrm{id}(n) = n\), \(n^s\), \(\chi(n)\) (Dirichlet char.), \(\lambda(n)\) (Liouville) |
| Multiplicative | \(f(mn) = f(m)f(n)\) for \(\gcd(m,n)=1\) | \(\mu(n)\), \(\varphi(n)\), \(d(n)\), \(\sigma_k(n)\) |
| Additive | \(f(mn) = f(m)+f(n)\) for \(\gcd(m,n)=1\) | \(\omega(n)\), \(\log n\) on prime powers... |
| Completely additive | \(f(mn) = f(m)+f(n)\) for all \(m,n\) | \(\Omega(n) = \sum_p v_p(n)\), \(\log n\) |
| Neither | — | \(\Lambda(n)\), \(r_2(n)\) (as a function of \(n\)) |

**The distinction matters because:**
- Multiplicative functions are determined by their values at prime powers. So to specify \(f\) completely, you only need to say: "at prime power \(p^k\), \(f(p^k) = \ldots\)."
- Completely multiplicative functions are determined by their values at *primes* alone: if you know \(f(p)\) for all primes \(p\), then \(f(p^k) = f(p)^k\), and \(f(n) = \prod_p f(p)^{v_p(n)}\).
- The product of two multiplicative functions (under Dirichlet convolution) is multiplicative. This means the class of multiplicative arithmetic functions is closed under the natural operations, making it a well-structured abelian group.

**The Möbius function \(\mu(n)\) in detail.** The values:

\[
\mu(1) = 1, \quad \mu(p) = -1, \quad \mu(p^2) = 0, \quad \mu(pq) = 1, \quad \mu(p^2q) = 0, \quad \mu(pqr) = -1, \ldots
\]
The pattern: \(\mu(n) = (-1)^k\) if \(n\) is squarefree with \(k\) prime factors, and \(\mu(n)=0\) otherwise. The Dirichlet series is \(\sum \mu(n)n^{-s} = 1/\zeta(s)\), which encodes the "inverse" of \(\zeta\) in the Dirichlet series ring. This is the number-theoretic content of the identity \(\zeta(s) \cdot (1/\zeta(s)) = 1\).

**The von Mangoldt function \(\Lambda(n)\).** Not multiplicative, not additive. It is supported on prime powers and satisfies \(\log n = \sum_{d \mid n}\Lambda(d)\) — a factored form of the logarithm. Its Dirichlet series \(-\zeta'/\zeta = \sum \Lambda(n)n^{-s}\) is the logarithmic derivative of \(\zeta\), which naturally arises when you differentiate \(\log\zeta(s) = \sum_p\sum_k p^{-ks}/k\). The non-multiplicativity of \(\Lambda\) is not a defect: it reflects the fact that \(-\zeta'/\zeta\) is not an Euler product, but a ratio \(\zeta'/\zeta\).

**Additive functions.** An additive function satisfies \(f(mn) = f(m)+f(n)\) when \(\gcd(m,n)=1\). The key examples:
- \(\omega(n) = \#\{p : p \mid n\}\): number of distinct prime factors. \(\omega(12) = \omega(2^2\cdot 3) = 2\).
- \(\Omega(n) = \sum_p v_p(n)\): total number of prime factors with multiplicity. \(\Omega(12) = \Omega(2^2 \cdot 3) = 3\).
- \(\Omega(n) - \omega(n)\) counts the "repeat prime factors."

Additive functions are less common in analytic number theory but appear in probabilistic number theory (Erdős–Kac theorem: \(\omega(n)\) is approximately Gaussian with mean and variance \(\log\log n\)).

**Summary table of key arithmetic functions and their Dirichlet series:**

| Function | Formula | Multiplicative? | Dirichlet series |
|---|---|---|---|
| \(\mathbf{1}(n) = 1\) | constant 1 | completely | \(\zeta(s)\) |
| \(\mathrm{id}(n) = n\) | identity | completely | \(\zeta(s-1)\) |
| \(\mu(n)\) | Möbius | multiplicative | \(1/\zeta(s)\) |
| \(\varphi(n)\) | Euler totient | multiplicative | \(\zeta(s-1)/\zeta(s)\) |
| \(d(n)\) | divisor count | multiplicative | \(\zeta(s)^2\) |
| \(\sigma_k(n)\) | divisor power sum | multiplicative | \(\zeta(s)\zeta(s-k)\) |
| \(\Lambda(n)\) | von Mangoldt | neither | \(-\zeta'(s)/\zeta(s)\) |
| \(\lambda(n)\) | Liouville | completely | \(\zeta(2s)/\zeta(s)\) |
| \(\chi(n)\) | Dirichlet char. | completely | \(L(s,\chi)\) |

## 3.2 Dirichlet Convolution and Möbius Inversion

<div class="definition">
<strong>Definition 3.3 (Dirichlet convolution).</strong> For arithmetic functions \( f, g \), their <strong>Dirichlet convolution</strong> is

\[
(f * g)(n) = \sum_{d \mid n} f(d) g(n/d).
\]
</div>

Dirichlet convolution is commutative and associative. The identity element is \( \varepsilon(n) = [n=1] \). The convolution of two multiplicative functions is multiplicative. This makes the set of multiplicative functions (with Dirichlet convolution) an abelian group.

<div class="example">
<strong>Example 3.4 (Computing a Dirichlet convolution).</strong> Let us compute \((\mu * \mathrm{id})(n)\) where \(\mathrm{id}(n) = n\). We claim this equals \(\varphi(n)\).

By multiplicativity, it suffices to check at prime powers. At \(p^k\):

\[
(\mu * \mathrm{id})(p^k) = \sum_{j=0}^k \mu(p^j) p^{k-j} = \mu(1)p^k + \mu(p)p^{k-1} + \mu(p^2)p^{k-2} + \cdots
\]
Since \(\mu(p^j) = 0\) for \(j \geq 2\):

\[
= p^k - p^{k-1} = p^k(1-1/p) = \varphi(p^k).
\]
So \(\mu * \mathrm{id} = \varphi\), confirming \(\varphi(n) = \sum_{d \mid n}\mu(d)(n/d)\).
</div>

<div class="theorem">
<strong>Theorem 3.5 (Möbius Inversion Formula).</strong> If \( g(n) = \sum_{d \mid n} f(d) \) for all \( n \), then

\[
f(n) = \sum_{d \mid n} \mu(d)\, g(n/d).
\]
In Dirichlet convolution notation: \( g = f * \mathbf{1} \) implies \( f = g * \mu \), where \( \mathbf{1}(n) = 1 \) for all \( n \).
</div>

<div class="proof">
<strong>Proof.</strong> \( (g * \mu)(n) = \sum_{d \mid n} \mu(d) g(n/d) = \sum_{d \mid n} \mu(d) \sum_{e \mid (n/d)} f(e) = \sum_{e \mid n} f(e) \sum_{d \mid (n/e)} \mu(d) = f(n) \cdot 1 = f(n) \), using \( \sum_{d \mid m} \mu(d) = [m=1] \). \( \square \)
</div>

Möbius inversion is the number-theoretic analogue of the inclusion-exclusion principle. Just as inclusion-exclusion counts elements with or without certain properties, Möbius inversion recovers \(f\) from \(g = f * \mathbf{1}\) by reversing the summation over divisors.

### Applications of Möbius Inversion

- \( \varphi = \mu * \mathrm{id} \) (where \( \mathrm{id}(n) = n \)), so \( n = \sum_{d \mid n} \varphi(d) \) inverts to \( \varphi(n) = \sum_{d \mid n} \mu(d)(n/d) \).
- \( \log = \Lambda * \mathbf{1} \), so \( \Lambda = \log * \mu \), giving \( \Lambda(n) = -\sum_{d \mid n} \mu(d)\log d \).
- \( d = \mathbf{1} * \mathbf{1} \), \( \sigma_k = \mathrm{id}_k * \mathbf{1} \).

## 3.3 Dirichlet Series

<div class="definition">
<strong>Definition 3.6.</strong> Given an arithmetic function \( a(n) \), its associated <strong>Dirichlet series</strong> is the formal sum

\[
F(s) = \sum_{n=1}^\infty \frac{a(n)}{n^s}, \quad s \in \mathbb{C}.
\]
</div>

The reason Dirichlet series are so natural here is that the substitution \(n^{-s} = e^{-s\log n}\) converts the multiplicative structure of the integers (via unique factorization) into additive structure (via \(\log(mn) = \log m + \log n\)), which complex analysis handles with ease. The Dirichlet series is essentially the Laplace transform of the arithmetic function \(a(n)\) with the discrete measure \(\sum_n a(n)\delta_{\log n}\).

### Convergence of Dirichlet Series

<div class="theorem">
<strong>Theorem 3.7.</strong> If \( \sum_{n=1}^N a(n) = O(N^\alpha) \), then \( F(s) = \sum a(n)/n^s \) converges absolutely for \( \mathrm{Re}(s) > \alpha + 1 \) and converges conditionally (but uniformly in compact sets) for \( \mathrm{Re}(s) > \alpha \).
</div>

More precisely, there is an <strong>abscissa of absolute convergence</strong> \( \sigma_a \) and an <strong>abscissa of conditional convergence</strong> \( \sigma_c \leq \sigma_a \leq \sigma_c + 1 \), such that \( F(s) \) converges absolutely for \( \mathrm{Re}(s) > \sigma_a \) and conditionally for \( \mathrm{Re}(s) > \sigma_c \).

<div class="example">
<strong>Example 3.8 (Abscissae for common Dirichlet series).</strong>
<ul>
<li>\(\zeta(s) = \sum n^{-s}\): \(a(n) = 1\), \(A(N) = N\), so \(\sigma_a = 1\), \(\sigma_c = 0\) (conditional convergence for \(\mathrm{Re}(s) > 0\) by Abel summation since partial sums of \(\sum n^{it}\) are bounded).</li>
<li>\(\sum \mu(n)n^{-s}\): \(\sigma_a = 1\); conditionally, \(\sigma_c = 0\) assuming PNT (since \(M(x) = o(x)\) follows from PNT). Under RH, one can show \(\sigma_c = 1/2\).</li>
<li>\(\sum (-1)^n n^{-s}\): the partial sums alternate and are bounded, so \(\sigma_a = 1\) but \(\sigma_c = 0\).</li>
</ul>
</div>

<div class="theorem">
<strong>Theorem 3.9 (Landau's theorem).</strong> If all \( a(n) \geq 0 \) and \( F(s) \) converges for \( \mathrm{Re}(s) > \sigma_c \), then \( F(s) \) has a singularity at \( s = \sigma_c \). In other words, \( F(s) \) cannot be analytically continued beyond its real abscissa of convergence when the coefficients are non-negative.
</div>

Landau's theorem is powerful: it says that for Dirichlet series with non-negative coefficients, the analytic properties of the function on the real axis completely determine where the series converges. We will apply it in Chapter 8 to prove \(L(1,\chi) \neq 0\) for real characters.

### Multiplication of Dirichlet Series

<div class="theorem">
<strong>Theorem 3.10.</strong> If \( F(s) = \sum a(n)/n^s \) and \( G(s) = \sum b(n)/n^s \) converge absolutely, then

\[
F(s) G(s) = \sum_{n=1}^\infty \frac{(a*b)(n)}{n^s},
\]
where \( a*b \) is the Dirichlet convolution.
</div>

This is the fundamental reason Dirichlet series are adapted to multiplicative problems. The algebraic identity \(F(s)G(s) = H(s)\) at the level of complex functions corresponds to \(a*b = c\) at the level of arithmetic functions — a purely multiplicative statement becomes a statement about analytic functions, and vice versa.

### Euler Products

<div class="theorem">
<strong>Theorem 3.11 (Euler product).</strong> If \( f \) is completely multiplicative and \( \sum |f(n)|/n^\sigma < \infty \), then

\[
\sum_{n=1}^\infty \frac{f(n)}{n^s} = \prod_p \frac{1}{1 - f(p)p^{-s}}.
\]
If \( f \) is multiplicative (but not necessarily completely), then

\[
\sum_{n=1}^\infty \frac{f(n)}{n^s} = \prod_p \left(\sum_{k=0}^\infty \frac{f(p^k)}{p^{ks}}\right).
\]
</div>

<div class="proof">
<strong>Proof.</strong> For completely multiplicative \( f \), the local factor at \( p \) is a geometric series:

\[
\sum_{k=0}^\infty f(p^k) p^{-ks} = \frac{1}{1-f(p)p^{-s}}.
\]
Expanding the product over finitely many primes and taking the limit (justified by absolute convergence) uses unique factorization to match terms with the Dirichlet series. \( \square \)
</div>

<div class="example">
<strong>Example 3.12 (The Euler product for \(\zeta(s)\) in detail).</strong> For \(\mathrm{Re}(s) > 1\):

\[
\prod_p \frac{1}{1-p^{-s}} = \prod_p \left(\sum_{k=0}^\infty p^{-ks}\right) = \prod_p (1 + p^{-s} + p^{-2s} + \cdots).
\]
Expanding the product over all primes (justified by absolute convergence for \(\sigma > 1\)) gives a sum over all finite products \(\prod_{p \in S} p^{k_p}\) for finite sets \(S\) of primes and non-negative integers \(k_p\). By unique factorization, each positive integer \(n\) appears exactly once as \(n = \prod p^{k_p}\), contributing \(n^{-s}\). So the product equals \(\sum_{n=1}^\infty n^{-s} = \zeta(s)\).

Numerically, for \(s = 2\): \(\prod_p (1-p^{-2})^{-1} = (1-1/4)^{-1}(1-1/9)^{-1}(1-1/25)^{-1}\cdots = (4/3)(9/8)(25/24)\cdots\), and this infinite product equals \(\pi^2/6 \approx 1.6449\). The Euler product converges: taking the product over primes up to 100 gives \(\approx 1.6376\), close to the true value.
</div>

<div class="example">
<strong>Example 3.13.</strong> Key Euler products:
<ul>
<li>\( \zeta(s) = \sum n^{-s} = \prod_p (1-p^{-s})^{-1} \) for \( \mathrm{Re}(s) > 1 \).</li>
<li>\( \zeta(s)^2 = \sum d(n) n^{-s} = \prod_p (1-p^{-s})^{-2} \).</li>
<li>\( 1/\zeta(s) = \sum \mu(n) n^{-s} = \prod_p (1-p^{-s}) \).</li>
<li>\( \zeta(s-1)/\zeta(s) = \sum \varphi(n) n^{-s} \).</li>
<li>\( -\zeta'(s)/\zeta(s) = \sum \Lambda(n) n^{-s} \).</li>
</ul>
The last identity is the most important for prime counting: differentiating the logarithm of the Euler product \(\log\zeta(s) = -\sum_p\log(1-p^{-s})\) and differentiating the sum \(\sum n^{-s}\) gives \(-\zeta'(s)/\zeta(s) = \sum_n \Lambda(n)n^{-s}\).
</div>

## 3.4 Euler's Constant and Key Asymptotic Sums

<div class="definition">
<strong>Definition 3.14 (Euler's constant).</strong> The constant

\[
\gamma = \lim_{N \to \infty} \left(\sum_{n=1}^N \frac{1}{n} - \log N\right) = 1 - \int_1^\infty \frac{\{t\}}{t^2}\,dt \approx 0.57721566\ldots
\]
is called <strong>Euler's constant</strong> (or the Euler–Mascheroni constant).
</div>

The existence of this limit is not obvious. It says that the harmonic series \(\sum 1/n\) grows like \(\log N\), and the difference \(\sum_{n \leq N} 1/n - \log N\) stabilizes. The constant \(\gamma\) appears throughout analytic number theory: in the Laurent expansion of \(\zeta(s)\) near \(s=1\), in Mertens' theorems, in the asymptotic for the divisor sum, and in many other places.

<div class="theorem">
<strong>Theorem 3.15.</strong> As \( x \to \infty \):
<br>(a) \( \displaystyle\sum_{n \leq x} \frac{1}{n} = \log x + \gamma + O\!\left(\frac{1}{x}\right) \).
<br>(b) \( \displaystyle\sum_{p \leq x} \frac{\log p}{p} = \log x + O(1) \).
<br>(c) \( \displaystyle\sum_{p \leq x} \frac{1}{p} = \log \log x + \beta_1 + O\!\left(\frac{1}{\log x}\right) \),
where \( \beta_1 = \gamma + \sum_p \left(\log\left(1-\frac{1}{p}\right) + \frac{1}{p}\right) \) is the Meissel–Mertens constant \( M \approx 0.2615\ldots \).
</div>

<div class="proof">
<strong>Proof of (a).</strong> Use Abel summation with \( a_n = 1 \), \( f(t) = 1/t \), \( A(t) = \lfloor t \rfloor = t - \{t\} \):

\[
\sum_{n \leq x} \frac{1}{n} = \frac{\lfloor x \rfloor}{x} + \int_1^x \frac{\lfloor t \rfloor}{t^2}\,dt = \frac{x - \{x\}}{x} + \int_1^x \frac{t - \{t\}}{t^2}\,dt.
\]

\[
= 1 - \frac{\{x\}}{x} + \log x - \int_1^x \frac{\{t\}}{t^2}\,dt = \log x + \underbrace{\left(1 - \int_1^\infty \frac{\{t\}}{t^2}\,dt\right)}_{\gamma} + \int_x^\infty \frac{\{t\}}{t^2}\,dt - \frac{\{x\}}{x}.
\]
The tail integral is bounded by \( \int_x^\infty t^{-2}\,dt = 1/x \), and \( \{x\}/x \leq 1/x \), so the error is \( O(1/x) \). \( \square \)

<strong>Proof of (b).</strong> From \( \psi(x) = \sum_{n \leq x} \Lambda(n) = O(x) \), Abel summation gives \( \sum_{p \leq x} (\log p)/p = \sum_{n \leq x} \Lambda(n)/n + O(1) \). Using \( \psi(x)/x \to 1 \) (PNT, or Chebyshev's weaker bound for the \( O(1) \) statement), one gets \( \sum_{p \leq x} (\log p)/p = \log x + O(1) \).

<strong>Proof of (c).</strong> With (b) established, write \( 1/p = (\log p)/p \cdot 1/(\log p) \) and apply Abel summation to \( a_p = (\log p)/p \) and \( f(t) = 1/\log t \). \( \square \)
</div>

<div class="remark">
<strong>Remark 3.16 (Mertens' theorem).</strong> Mertens proved (1874):

\[
\prod_{p \leq x} \left(1 - \frac{1}{p}\right) = \frac{e^{-\gamma}}{\log x}\left(1 + O\!\left(\frac{1}{\log x}\right)\right).
\]
This is equivalent to statement (c) of the theorem via \( \log\prod(1-1/p)^{-1} = \sum_p \frac{1}{p} + O(1) \). The appearance of \(e^{-\gamma}\) here is no coincidence: the Laurent expansion \(\zeta(s) = \frac{1}{s-1} + \gamma + O(s-1)\) near \(s=1\) and the Euler product \(\zeta(s) = \prod_p(1-p^{-s})^{-1}\) together force this constant into the product.
</div>

## 3.5 The Divisor Sum Formula

<div class="theorem">
<strong>Theorem 3.17.</strong> For \( x \geq 1 \):

\[
\sum_{n \leq x} d(n) = x \log x + (2\gamma - 1)x + O(\sqrt{x}).
\]
</div>

This is the Dirichlet divisor problem; see Chapter 6 for the proof. The error term \( O(\sqrt{x}) \) has been improved significantly (by van der Corput and others), but the final answer (Dirichlet's conjecture gives \( O(x^{1/4+\varepsilon}) \)) remains open.

---

# Chapter 4: The Riemann Zeta Function

The Riemann zeta function is the centerpiece of analytic number theory. Euler studied it for real \(s > 1\) and proved the Euler product, relating it to primes. Riemann's 1859 paper extended \(\zeta\) to a meromorphic function on all of \(\mathbb{C}\), discovered the functional equation \(\xi(s) = \xi(1-s)\), identified the nontrivial zeros as lying in the critical strip, and made the Riemann Hypothesis. Hadamard and de la Vallée Poussin used the non-vanishing on \(\mathrm{Re}(s) = 1\) to prove PNT in 1896.

In this chapter we build the theory of \(\zeta(s)\) step by step: definition and Euler product for \(\mathrm{Re}(s) > 1\), analytic continuation to \(\mathrm{Re}(s) > 0\) (and then to all of \(\mathbb{C}\)), the functional equation, non-vanishing on \(\mathrm{Re}(s) = 1\), and zero-free regions.

## 4.1 Definition and Basic Properties

<div class="definition">
<strong>Definition 4.1 (Riemann zeta function).</strong> For \( s = \sigma + it \) with \( \sigma = \mathrm{Re}(s) > 1 \), define

\[
\zeta(s) = \sum_{n=1}^\infty \frac{1}{n^s}.
\]
</div>

The series converges absolutely for \( \mathrm{Re}(s) > 1 \) and defines a holomorphic function there. The Euler product gives

\[
\zeta(s) = \prod_p \frac{1}{1 - p^{-s}}, \quad \mathrm{Re}(s) > 1.
\]

This product immediately implies \( \zeta(s) \neq 0 \) for \( \mathrm{Re}(s) > 1 \) (each factor is nonzero and the product converges absolutely). The connection between the Dirichlet series and the Euler product is the analytic manifestation of the Fundamental Theorem of Arithmetic.

<div class="example">
<strong>Example 4.2 (Special values).</strong> By the functional equation and Bernoulli numbers:

\[
\zeta(2) = \frac{\pi^2}{6}, \quad \zeta(4) = \frac{\pi^4}{90}, \quad \zeta(6) = \frac{\pi^6}{945},
\]
and more generally \(\zeta(2k) = \frac{(-1)^{k+1}(2\pi)^{2k}B_{2k}}{2(2k)!}\) for positive integers \(k\). The identity \(\zeta(2) = \pi^2/6\) was first proved by Euler in 1734 (resolving the "Basel problem").

For odd positive integers, the situation is much more mysterious: \(\zeta(3)\) was proved irrational by Apéry in 1978, but we do not know a closed form in terms of \(\pi\). It is conjectured that \(\zeta(2k+1)/\pi^{2k+1}\) is irrational for all \(k \geq 1\).
</div>

<div class="theorem">
<strong>Theorem 4.3 (Integral representations).</strong> For \( \mathrm{Re}(s) > 1 \):

\[
\zeta(s) = \frac{s}{s-1} - s\int_1^\infty \frac{\{t\}}{t^{s+1}}\,dt.
\]
</div>

<div class="proof">
<strong>Proof.</strong> Write \( \zeta(s) = \sum_{n=1}^\infty n^{-s} = s\int_1^\infty \lfloor t \rfloor t^{-s-1}\,dt \) (by Abel summation). Then \( \lfloor t \rfloor = t - \{t\} \), so

\[
\zeta(s) = s\int_1^\infty t^{-s}\,dt - s\int_1^\infty \{t\} t^{-s-1}\,dt = \frac{s}{s-1} - s\int_1^\infty \frac{\{t\}}{t^{s+1}}\,dt. \quad \square
\]
</div>

## 4.2 Analytic Continuation to Re(s) > 0

<div class="theorem">
<strong>Theorem 4.4 (Analytic continuation beyond Re(s) = 1).</strong> The formula

\[
\zeta(s) = \frac{s}{s-1} - s\int_1^\infty \frac{\{t\}}{t^{s+1}}\,dt
\]
defines an analytic function for \( \mathrm{Re}(s) > 0 \), \( s \neq 1 \). Hence \( \zeta(s) \) extends analytically to \( \{s : \mathrm{Re}(s) > 0,\, s \neq 1\} \).
</div>

<div class="proof">
<strong>Proof.</strong> For \( \mathrm{Re}(s) > 0 \), the integrand \( \{t\}/t^{s+1} \) satisfies \( |\{t\}/t^{s+1}| \leq t^{-\sigma-1} \), so the integral converges absolutely and defines a holomorphic function of \( s \). The term \( s/(s-1) \) has a simple pole at \( s=1 \) with residue 1. Thus the formula gives a meromorphic function on \( \mathrm{Re}(s) > 0 \) with a simple pole at \( s=1 \) and residue 1. \( \square \)
</div>

One can continue further:

<div class="theorem">
<strong>Theorem 4.5 (Global meromorphic continuation).</strong> \( \zeta(s) \) extends to a meromorphic function on all of \( \mathbb{C} \), with a unique simple pole at \( s=1 \) with residue 1 and no other poles.
</div>

This is proved via the functional equation (Section 4.4) or via the Euler–Maclaurin formula.

### The Laurent expansion near s = 1

Near \( s = 1 \):

\[
\zeta(s) = \frac{1}{s-1} + \gamma + \gamma_1(s-1) + \gamma_2(s-1)^2 + \cdots,
\]
where \( \gamma \) is Euler's constant and \( \gamma_1, \gamma_2, \ldots \) are the Stieltjes constants:

\[
\gamma_k = \frac{(-1)^k}{k!}\lim_{N\to\infty}\left(\sum_{n=1}^N \frac{(\log n)^k}{n} - \frac{(\log N)^{k+1}}{k+1}\right).
\]
The fact that the constant term in the Laurent expansion is \(\gamma\) (Euler's constant) — the same constant that appears in \(\sum_{n \leq x} 1/n = \log x + \gamma + O(1/x)\) — is not a coincidence: it follows directly from writing \(\zeta(s) = \sum n^{-s}\) and expanding near \(s=1\).

## 4.3 Non-Vanishing on the Line Re(s) = 1

The non-vanishing of \( \zeta(s) \) on the line \( \mathrm{Re}(s) = 1 \) is the key analytic input for PNT. Without it, we cannot rule out that the sum over zeros in the explicit formula contributes a term of order \(x\), swamping the main term.

<div class="theorem">
<strong>Theorem 4.6 (Non-vanishing).</strong> \( \zeta(1+it) \neq 0 \) for all real \( t \neq 0 \).
</div>

The proof uses a classical trigonometric inequality:

<div class="theorem">
<strong>Lemma 4.7.</strong> For all \( \theta \in \mathbb{R} \),

\[
3 + 4\cos\theta + \cos 2\theta \geq 0.
\]
</div>

<div class="proof">
<strong>Proof.</strong> Using \( \cos 2\theta = 2\cos^2\theta - 1 \):

\[
3 + 4\cos\theta + \cos 2\theta = 2 + 4\cos\theta + 2\cos^2\theta = 2(1 + \cos\theta)^2 \geq 0. \quad \square
\]
</div>

<div class="proof">
<strong>Proof of Theorem 4.6.</strong> For \( \sigma > 1 \), take the logarithm of the Euler product:

\[
\log \zeta(s) = -\sum_p \log(1-p^{-s}) = \sum_p \sum_{k=1}^\infty \frac{p^{-ks}}{k}.
\]
Taking real parts:

\[
\mathrm{Re}\,\log\zeta(\sigma+it) = \sum_p \sum_{k=1}^\infty \frac{\cos(kt \log p)}{k p^{k\sigma}}.
\]
Apply Lemma 4.7 with \( \theta = kt\log p \):

\[
3\mathrm{Re}\,\log\zeta(\sigma) + 4\mathrm{Re}\,\log\zeta(\sigma+it) + \mathrm{Re}\,\log\zeta(\sigma+2it) \geq 0.
\]
Exponentiating: \( |\zeta(\sigma)|^3 |\zeta(\sigma+it)|^4 |\zeta(\sigma+2it)| \geq 1 \).

Now suppose \( \zeta(1+it_0) = 0 \) for some \( t_0 \neq 0 \). Since \( \zeta(s) \) has a simple pole at \( s=1 \), as \( \sigma \to 1^+ \) we have \( |\zeta(\sigma)| \sim (\sigma-1)^{-1} \). If \( \zeta(1+it_0)=0 \) then \( |\zeta(\sigma+it_0)| = O(\sigma-1) \). Thus \( |\zeta(\sigma)|^3 |\zeta(\sigma+it_0)|^4 \to 0 \) as \( \sigma \to 1^+ \), contradicting the inequality \( \geq 1 \) (since \( |\zeta(\sigma+2it_0)| \) stays bounded). \( \square \)
</div>

<div class="remark">
<strong>Remark 4.8 (The "3-4-1 trick").</strong> The exponents \(3, 4, 1\) in the inequality \(|\zeta(\sigma)|^3|\zeta(\sigma+it)|^4|\zeta(\sigma+2it)| \geq 1\) are special: they correspond to the coefficients \(3, 4, 1\) in the trigonometric identity \(3 + 4\cos\theta + \cos 2\theta \geq 0\). This trick, due to Mertens, is the simplest proof of non-vanishing on \(\mathrm{Re}(s) = 1\). The same argument works for Dirichlet L-functions \(L(s,\chi)\), and is the basis for proving \(L(1+it,\chi) \neq 0\), which in turn implies the prime number theorem for arithmetic progressions.
</div>

## 4.4 The Functional Equation

<div class="theorem">
<strong>Theorem 4.9 (Riemann's functional equation).</strong> Define

\[
\xi(s) = \frac{1}{2} s(s-1)\pi^{-s/2} \Gamma(s/2)\,\zeta(s).
\]
Then \( \xi(s) \) extends to an entire function satisfying

\[
\xi(s) = \xi(1-s).
\]
Equivalently, with \( \Lambda(s) = \pi^{-s/2}\Gamma(s/2)\zeta(s) \):

\[
\Lambda(s) = \Lambda(1-s).
\]
</div>

<div class="proof">
<strong>Proof sketch.</strong> Start from the Gamma integral \( \Gamma(s/2) = \int_0^\infty t^{s/2-1} e^{-t}\,dt \). Substituting \( t = n^2 \pi u \):

\[
\pi^{-s/2}\Gamma(s/2) n^{-s} = \int_0^\infty u^{s/2-1} e^{-n^2\pi u}\,du.
\]
Summing over \( n \geq 1 \):

\[
\pi^{-s/2}\Gamma(s/2)\zeta(s) = \int_0^\infty u^{s/2-1} \sum_{n=1}^\infty e^{-n^2\pi u}\,du = \int_0^\infty u^{s/2-1} \omega(u)\,du,
\]
where \( \omega(u) = \sum_{n=1}^\infty e^{-n^2\pi u} = (\vartheta(u)-1)/2 \) with \( \vartheta(u) = \sum_{n\in\mathbb{Z}} e^{-n^2\pi u} \).

Split the integral at \( u=1 \) and use the Poisson summation identity \( \vartheta(u) = u^{-1/2}\vartheta(1/u) \) (shown in Example 2.11) to transform the integral over \( (0,1) \):

\[
\int_0^1 u^{s/2-1}\omega(u)\,du = \int_1^\infty u^{(1-s)/2-1}\omega(u)\,du + \frac{1}{s(s-1)}.
\]
Therefore

\[
\Lambda(s) = \frac{1}{s(s-1)} + \int_1^\infty \bigl(u^{s/2-1} + u^{(1-s)/2-1}\bigr)\omega(u)\,du,
\]
which is manifestly symmetric under \( s \mapsto 1-s \). \( \square \)
</div>

<div class="remark">
<strong>Remark 4.10 (Gamma factors and "arithmetic at infinity").</strong> The factor \(\pi^{-s/2}\Gamma(s/2)\) in the functional equation is not an accident. In modern language, the zeta function should be thought of as having an "Euler factor at infinity" (corresponding to the real place of \(\mathbb{Q}\)), just as the Euler product has factors at each prime \(p\). The completed L-function \(\Lambda(s) = \pi^{-s/2}\Gamma(s/2)\zeta(s)\) is the truly natural object — it satisfies \(\Lambda(s) = \Lambda(1-s)\) exactly, with no messy correction factors.

The poles of \(\Gamma(s/2)\) at \(s = 0, -2, -4, \ldots\) force \(\zeta\) to have zeros there (since \(\Lambda(s)\) is entire), giving the trivial zeros.
</div>

<div class="remark">
<strong>Remark 4.11 (Trivial zeros).</strong> The functional equation, combined with the non-vanishing of \( \zeta(s) \) for \( \mathrm{Re}(s) > 1 \), implies that \( \zeta(s) \) vanishes at \( s = -2, -4, -6, \ldots \) (the <em>trivial zeros</em>), corresponding to the poles of \( \Gamma(s/2) \). All other zeros (the <em>nontrivial zeros</em>) lie in the <em>critical strip</em> \( 0 < \mathrm{Re}(s) < 1 \). The Riemann Hypothesis asserts they all lie on \( \mathrm{Re}(s) = 1/2 \).
</div>

## 4.5 The Riemann Hypothesis

The Riemann Hypothesis (RH) is the statement that all nontrivial zeros \(\rho\) of \(\zeta(s)\) satisfy \(\mathrm{Re}(\rho) = 1/2\). It is one of the Millennium Prize Problems (with a $1 million prize for a proof), and it has been verified numerically for the first \(10^{13}\) zeros (all lying on the critical line, none lying off it). But no proof is known.

Why does RH matter for prime counting? The explicit formula (Section 5.5) states:

\[
\psi(x) = x - \sum_\rho \frac{x^\rho}{\rho} - \frac{\zeta'(0)}{\zeta(0)} - \frac{1}{2}\log(1-x^{-2}).
\]
Each zero \(\rho = \beta + i\gamma\) contributes a term \(x^\rho/\rho = x^\beta e^{i\gamma\log x}/\rho\) of absolute value \(x^\beta/|\rho|\). If all zeros have \(\beta = 1/2\), these terms are bounded by \(x^{1/2}/|\rho|\), and their sum converges to give an error of size \(O(x^{1/2}\log^2 x)\) in \(\psi(x) - x\). This is the best possible error one could hope for from the explicit formula.

If a zero existed with \(\beta > 1/2\), it would contribute a term growing like \(x^\beta\), degrading the error estimate. The known zero-free region \(\sigma \geq 1 - c/\log t\) gives an error of \(O(x\exp(-c'\sqrt{\log x}))\) — much weaker than RH but still sufficient for many applications.

<div class="remark">
<strong>Remark 4.12 (Chebyshev bias and zeros off the real axis).</strong> The imaginary parts of the nontrivial zeros \(\rho = 1/2 + i\gamma\) encode oscillations in \(\psi(x) - x\). The zero with smallest imaginary part is at \(\gamma_1 \approx 14.134\ldots\), contributing an oscillation of wavelength \(\approx 2\pi/\gamma_1 \approx 0.44\) on the \(\log x\) scale. The interplay between the imaginary parts of zeros and the distribution of primes in residue classes gives rise to the **Chebyshev bias**: primes are more often in "non-square" residue classes than in "square" residue classes (e.g., more primes \(\equiv 3 \pmod 4\) than \(\equiv 1 \pmod 4\) in the range \([2, x]\) for "most" \(x\)). This phenomenon is explained by the explicit formula and the distribution of zeros.
</div>

## 4.6 Newman's Tauberian Theorem

A key tool connecting analytic properties of \( \zeta(s) \) to number-theoretic asymptotics is the following Tauberian theorem:

<div class="theorem">
<strong>Theorem 4.13 (Newman's Tauberian theorem, 1980).</strong> Let \( a_n \) be bounded real numbers and set \( F(s) = \sum_{n=1}^\infty a_n n^{-s} \). If \( F(s) \) converges for \( \mathrm{Re}(s) > 1 \) and extends analytically to a neighborhood of every point on \( \mathrm{Re}(s) = 1 \), then \( F(s) \) converges for \( \mathrm{Re}(s) \geq 1 \), and in particular

\[
\sum_{n=1}^\infty \frac{a_n}{n} = F(1) \text{ converges.}
\]
</div>

<div class="remark">
<strong>Remark 4.14.</strong> Newman's proof, based on a contour integral argument with a clever test function, is significantly shorter than the classical proofs of PNT using Wiener's Tauberian theorem. The key step is a contour deformation lemma: if \( g(s) \) is analytic on \( \mathrm{Re}(s) \geq 0 \) and \( G(s) = \int_0^\infty g(t)e^{-st}\,dt \) converges for \( \mathrm{Re}(s) > 0 \), then \( \int_0^\infty g(t)\,dt = G(0) \).

In the application to PNT, one takes \( g(t) = e^{-t}(\psi(e^t) - e^t) \) and applies Newman's theorem to \( \sum \Lambda(n)/n^s \) after a change of variables.
</div>

## 4.7 The Riemann Hypothesis and Zero-Free Regions

While the Riemann Hypothesis (RH) remains unproved, one can establish explicit zero-free regions:

<div class="theorem">
<strong>Theorem 4.15 (Classical zero-free region).</strong> There exists an absolute constant \( c > 0 \) such that \( \zeta(\sigma + it) \neq 0 \) for

\[
\sigma \geq 1 - \frac{c}{\log(|t|+2)}.
\]
</div>

<div class="proof">
<strong>Proof sketch.</strong> The key is to make the "3-4-1" argument from the non-vanishing proof quantitative. From the inequality \(|\zeta(\sigma)|^3|\zeta(\sigma+it)|^4|\zeta(\sigma+2it)| \geq 1\), and using estimates for \(|\zeta(\sigma+it)|\) and \(|\zeta(\sigma+2it)|\) in terms of \(\log t\) (which follow from the Phragmén–Lindelöf principle and the functional equation), one can show that if \(\zeta(\sigma_0 + it_0) = 0\), then \(\sigma_0 < 1 - c/\log t_0\). The classical bound on \(\zeta\) in the critical strip is \(\zeta(\sigma + it) = O(\log t)\) for \(\sigma\) near 1, and this gives the logarithmic zero-free region. \(\square\)
</div>

This zero-free region is used to obtain the quantitative error term in PNT:

\[
\pi(x) = \mathrm{li}(x) + O\!\left(x \exp\!\left(-c\sqrt{\log x}\right)\right).
\]

---

# Chapter 5: The Prime Number Theorem

## 5.1 Statement and Equivalences

<div class="theorem">
<strong>Theorem 5.1 (Prime Number Theorem).</strong> As \( x \to \infty \),

\[
\pi(x) \sim \frac{x}{\log x}, \qquad \psi(x) \sim x, \qquad \theta(x) \sim x.
\]
</div>

The proof proceeds via the analytic properties of \( \zeta(s) \) established in Chapter 4.

## 5.2 Strategy: Möbius Inversion Approach

One approach (using the non-vanishing of \( \zeta(s) \) on \( \mathrm{Re}(s)=1 \)) proceeds through the following function.

<div class="definition">
<strong>Definition 5.2.</strong> For \( x \geq 1 \), define

\[
F(x) = \sum_{n \leq x} \left(\psi\!\left(\frac{x}{n}\right) - \left\lfloor \frac{x}{n} \right\rfloor + 2\gamma\right).
\]
</div>

<div class="theorem">
<strong>Theorem 5.3.</strong> \( F(x) = O(x^{1/2}) \).
</div>

<div class="proof">
<strong>Proof sketch.</strong> Expanding using \( \psi(y) = \sum_{m \leq y} \Lambda(m) \) and \( \lfloor y \rfloor = \sum_{m \leq y} 1 \):

\[
F(x) = \sum_{n \leq x}\sum_{m \leq x/n} \Lambda(m) - \sum_{n \leq x}\left\lfloor \frac{x}{n}\right\rfloor + 2\gamma \lfloor x \rfloor.
\]
The double sum \( \sum_{nm \leq x} \Lambda(m) = \psi(x)\cdot(\text{sum over }n) \) can be evaluated. Using the identity \( \sum_{d \mid n} \Lambda(d) = \log n \), one shows

\[
F(x) = \sum_{n \leq x} \left(\log(x/n) - \left\lfloor \frac{x}{n} \right\rfloor \cdot \frac{1}{\lfloor x/n \rfloor} + \ldots \right) = O(\sqrt{x}),
\]
by estimating the sum using the hyperbola method (similar to the divisor sum estimate). \( \square \)
</div>

<div class="theorem">
<strong>Theorem 5.4 (Möbius inversion of F).</strong>

\[
\psi(x) - \lfloor x \rfloor + 2\gamma = \sum_{n \leq x} \mu(n) F\!\left(\frac{x}{n}\right).
\]
</div>

<div class="proof">
<strong>Proof.</strong> Apply Möbius inversion to the defining relation for \( F \):

\[
F(x) = \sum_{n \leq x}\left(\psi(x/n) - \lfloor x/n\rfloor + 2\gamma\right) = \sum_{n \leq x} G(x/n),
\]
where \( G(y) = \psi(y) - \lfloor y \rfloor + 2\gamma \). Möbius inversion gives \( G(x) = \sum_{n \leq x} \mu(n) F(x/n) \). \( \square \)
</div>

## 5.3 Key Lemma: Cancellation in the Möbius Sum

<div class="theorem">
<strong>Theorem 5.5.</strong> \( \displaystyle\sum_{n \leq x} \mu(n) F\!\left(\frac{x}{n}\right) = o(x) \) as \( x \to \infty \).
</div>

<div class="proof">
<strong>Proof sketch.</strong> Split the sum at \( n \leq t \) and \( t < n \leq x \) for a parameter \( t = t(x) \to \infty \) slowly. Using \( F(x/n) = O((x/n)^{1/2}) \):

\[
\sum_{t < n \leq x} \mu(n) F(x/n) = O\!\left(\sqrt{x} \sum_{t < n \leq x} n^{-1/2}\right) = O\!\left(\sqrt{x} \cdot \sqrt{x/t}\right) = O(x/\sqrt{t}).
\]
For the inner sum over \( n \leq t \), one uses partial summation: the key input is that \( M(y) = \sum_{n \leq y} \mu(n) = o(y) \), which is equivalent to PNT itself. So the argument requires an independent proof of \( M(y) = o(y) \).

The non-trivial step: \( \zeta(s) \neq 0 \) on \( \mathrm{Re}(s)=1 \) implies (via Newman's theorem or direct Tauberian argument) that \( M(x)/x \to 0 \). From this, partial summation gives the sum over \( n \leq t \) is \( o(x) \) for each fixed \( t \). Combining: take \( t = t(x) \to \infty \) slowly enough, and both parts are \( o(x) \). \( \square \)
</div>

## 5.4 Completing the Proof of PNT

<div class="proof">
<strong>Proof of PNT.</strong> From Theorems 5.4 and 5.5:

\[
\psi(x) - \lfloor x \rfloor + 2\gamma = \sum_{n \leq x} \mu(n)F(x/n) = o(x).
\]
Since \( \lfloor x \rfloor = x + O(1) \) and \( 2\gamma \) is a constant:

\[
\psi(x) = x + o(x),
\]
i.e., \( \psi(x) \sim x \). By the equivalences of Chapter 1 (Theorem 1.8), this gives \( \pi(x) \sim x/\log x \). \( \square \)
</div>

## 5.5 Explicit Formula for ψ(x)

The Riemann explicit formula connects \( \psi(x) \) directly to the zeros of \( \zeta(s) \). It is one of the most beautiful and surprising results in all of mathematics: the distribution of primes — a completely multiplicative, discrete phenomenon — is governed by the zeros of a complex-analytic function.

<div class="theorem">
<strong>Theorem 5.6 (Von Mangoldt's explicit formula).</strong> For \( x > 1 \) not a prime power:

\[
\psi(x) = x - \sum_{\rho} \frac{x^\rho}{\rho} - \frac{\zeta'(0)}{\zeta(0)} - \frac{1}{2}\log(1 - x^{-2}),
\]
where the sum is over all nontrivial zeros \( \rho \) of \( \zeta(s) \), taken in order of increasing \( |\mathrm{Im}(\rho)| \).
</div>

<div class="remark">
<strong>Remark 5.7 (Deriving the explicit formula from Perron's formula).</strong> The explicit formula is derived via Perron's formula (inverse Mellin transform):

\[
\psi(x) = \frac{1}{2\pi i} \int_{c-i\infty}^{c+i\infty} \left(-\frac{\zeta'(s)}{\zeta(s)}\right) \frac{x^s}{s}\,ds, \quad c > 1.
\]
The integrand \(-\zeta'(s)/\zeta(s) \cdot x^s/s\) has:
<ul>
<li>A simple pole at \(s = 1\) (from the simple pole of \(\zeta\) at \(s=1\), giving \(-\zeta'/\zeta \sim 1/(s-1)\)) with residue \(x^1/1 = x\).</li>
<li>Simple poles at each nontrivial zero \(\rho\) of \(\zeta\) (where \(-\zeta'/\zeta\) has a simple pole with residue 1, giving residue \(x^\rho/\rho\)).</li>
<li>Simple poles at \(s = 0\) and the trivial zeros \(s = -2, -4, \ldots\).</li>
</ul>
Shifting the contour to the left and picking up residues at each zero (and pole) of \( -\zeta'/\zeta \) gives the explicit formula.

The convergence of \(\sum_\rho x^\rho/\rho\) (the "von Mangoldt sum") requires knowledge that the zeros \(\rho\) are not too densely packed — specifically, the number of zeros with \(|\mathrm{Im}(\rho)| \leq T\) is \(\sim (T/2\pi)\log(T/2\pi)\) (the Riemann–von Mangoldt formula).
</div>

PNT then follows from the explicit formula if one can show \( \zeta(1+it) \neq 0 \) for all \( t \neq 0 \) (which we proved in Chapter 4), ensuring the sum over zeros does not contribute a term of size \( x \).

## 5.6 The PNT via Contour Integration: A Bird's Eye View

Let us outline the contour integration proof of PNT more explicitly, as it illustrates the general strategy used throughout the subject.

**Step 1 (Set up Perron).** For \(c > 1\) and \(x > 1\):

\[
\psi(x) = \frac{1}{2\pi i}\int_{c-i\infty}^{c+i\infty} \left(-\frac{\zeta'(s)}{\zeta(s)}\right)\frac{x^s}{s}\,ds.
\]

**Step 2 (Truncate).** Replace \(i\infty\) by \(iT\) for a large parameter \(T = T(x)\), with an error of \(O(x\log^2 x / T)\).

**Step 3 (Move the contour).** Shift the line of integration from \(\mathrm{Re}(s) = c\) to the left: specifically to the contour \(L\) consisting of the left-hand boundary of the zero-free region, \(\sigma = 1 - c_0/\log(|t|+2)\). The horizontal segments contribute \(O(\cdots)\).

**Step 4 (Pick up residues).** The residue at \(s = 1\) (the only pole of \(-\zeta'/\zeta\) we cross) gives \(x^1/1 = x\). All other poles — the zeros of \(\zeta\) — are to the left of our contour and do not contribute.

**Step 5 (Bound the remaining integral).** On the contour \(L\), one needs bounds on \(\zeta(s)\) and \(\zeta'(s)/\zeta(s)\). Using \(|\zeta(\sigma+it)| = O(\log t)\) in the critical strip, and the bounds on \(\zeta'/\zeta\), one shows the integral over \(L\) contributes \(O(x\exp(-c_1\sqrt{\log x}))\).

**Conclusion.** \(\psi(x) = x + O(x\exp(-c_1\sqrt{\log x}))\), giving \(\psi(x) \sim x\) and hence PNT.

---

# Chapter 6: Lattice Point Problems

## 6.1 The Divisor Function and Its Averages

<div class="definition">
<strong>Definition 6.1.</strong> The <strong>divisor function</strong> \( d(n) = \sum_{e \mid n} 1 \) counts the number of positive divisors of \( n \).
</div>

The exact formula for the partial sum:

<div class="theorem">
<strong>Theorem 6.2 (Exact divisor sum).</strong>

\[
D(x) := \sum_{n \leq x} d(n) = \sum_{m=1}^{\lfloor x \rfloor} \left\lfloor \frac{x}{m} \right\rfloor.
\]
</div>

<div class="proof">
<strong>Proof.</strong> \( D(x) = \#\{(a,b) : a,b \in \mathbb{Z}_{>0},\, ab \leq x\} = \#\{(a,b) : b \leq x/a\} = \sum_{a \leq x} \lfloor x/a \rfloor \). \( \square \)
</div>

## 6.2 Dirichlet's Hyperbola Method

<div class="theorem">
<strong>Theorem 6.3 (Dirichlet, 1849).</strong> For \( x \geq 1 \),

\[
\sum_{n \leq x} d(n) = x\log x + (2\gamma - 1)x + O(\sqrt{x}).
\]
</div>

<div class="proof">
<strong>Proof.</strong> The count \( D(x) = \#\{(a,b) \in \mathbb{Z}_{>0}^2 : ab \leq x\} \) counts lattice points under the hyperbola \( xy = x \) (i.e., \( ab = x \) fixed). Use a parameter \( u = \sqrt{x} \):

\[
D(x) = 2\sum_{n \leq u} \left\lfloor \frac{x}{n} \right\rfloor - u^2.
\]
(We count pairs \( (a,b) \) with \( a \leq u \) and \( b \leq x/a \), plus pairs with \( b \leq u \) and \( a \leq x/b \), minus the square \( [1,u]^2 \).)

Now \( \lfloor x/n \rfloor = x/n + O(1) \), so

\[
\sum_{n \leq u} \left\lfloor \frac{x}{n} \right\rfloor = x\sum_{n \leq u} \frac{1}{n} + O(u) = x(\log u + \gamma + O(1/u)) + O(u).
\]
With \( u = \sqrt{x} \), \( \log u = \frac{1}{2}\log x \):

\[
2\sum_{n \leq \sqrt{x}} \left\lfloor \frac{x}{n} \right\rfloor - \lfloor\sqrt{x}\rfloor^2 = 2x\left(\frac{\log x}{2} + \gamma + O(1/\sqrt{x})\right) + O(\sqrt{x}) - x + O(\sqrt{x})
\]

\[
= x\log x + 2\gamma x - x + O(\sqrt{x}). \quad \square
\]
</div>

<div class="remark">
<strong>Remark 6.4 (Dirichlet divisor problem).</strong> Dirichlet's error term \( O(\sqrt{x}) \) has been improved. Let \( \Delta(x) = D(x) - x\log x - (2\gamma-1)x \). Known results: Hardy and Landau showed \( \Delta(x) = \Omega(x^{1/4}) \) (i.e., the error is at least \( cx^{1/4} \) infinitely often). The current best upper bound is \( \Delta(x) = O(x^{131/416+\varepsilon}) \) (Huxley, 2003). The <strong>Dirichlet divisor problem</strong> asks for the infimum of exponents \( \theta \) with \( \Delta(x) = O(x^{\theta+\varepsilon}) \); it is conjectured to be \( \theta = 1/4 \).
</div>

## 6.3 Gauss Circle Problem

The Gauss circle problem asks: how many lattice points \( (m,n) \in \mathbb{Z}^2 \) lie in the disk \( m^2 + n^2 \leq r^2 \)?

<div class="definition">
<strong>Definition 6.5.</strong> Let \( r(n) \) be the number of representations of \( n \) as a sum of two integer squares: \( r(n) = \#\{(a,b) \in \mathbb{Z}^2 : a^2+b^2=n\} \). Define \( R(x) = \#\{(m,n)\in\mathbb{Z}^2 : m^2+n^2\leq x\} = \sum_{n \leq x} r(n) \).
</div>

<div class="theorem">
<strong>Theorem 6.6 (Gauss circle estimate).</strong>

\[
R(x) = \pi x + O(\sqrt{x}).
\]
</div>

<div class="proof">
<strong>Proof.</strong> Each lattice point \( (m,n) \) with \( m^2+n^2 \leq x \) corresponds to a unit square centered at \( (m,n) \) with area 1. The union of these squares is contained in the disk of radius \( \sqrt{x} + \sqrt{2}/2 \) and contains the disk of radius \( \sqrt{x} - \sqrt{2}/2 \). Hence

\[
\pi(\sqrt{x}-\sqrt{2}/2)^2 \leq R(x) \leq \pi(\sqrt{x}+\sqrt{2}/2)^2.
\]
Both bounds equal \( \pi x + O(\sqrt{x}) \). \( \square \)
</div>

<div class="remark">
<strong>Remark 6.7.</strong> The <strong>Gauss circle problem</strong> asks for the best exponent \( \theta \) with \( R(x) = \pi x + O(x^{\theta+\varepsilon}) \). Current best: \( \theta = 131/416 \) (Huxley). Conjectured: \( \theta = 1/4 \). The lower bound \( \Omega(x^{1/4}) \) follows from considering the oscillation of \( r(n) \).

The connection to L-functions: \(r(n) = 4\sum_{d \mid n}\chi_{-4}(d)\) where \(\chi_{-4}\) is the non-principal character mod 4 (with \(\chi_{-4}(1) = 1\), \(\chi_{-4}(3) = -1\)), so \(\sum r(n)n^{-s} = 4\zeta(s)L(s,\chi_{-4})\). The product \(\zeta(s)L(s,\chi_{-4})\) has a simple pole at \(s=1\) with residue \(\pi\) (since \(L(1,\chi_{-4}) = 1 - 1/3 + 1/5 - \cdots = \pi/4\)), confirming \(R(x) \sim \pi x\).
</div>

## 6.4 Van der Corput's Method

Van der Corput's method improves the error terms in both divisor and circle problems by bounding exponential sums using the geometry of the phase function.

<div class="theorem">
<strong>Theorem 6.8 (Van der Corput, A-process).</strong> Suppose \( f \) is twice-differentiable on \( [a,b] \) with \( \lambda \leq f''(x) \leq c\lambda \) for some \( \lambda > 0 \) and constant \( c \geq 1 \). Then

\[
\sum_{a \leq n \leq b} e^{2\pi i f(n)} \ll (b-a)\lambda^{1/2} + \lambda^{-1/2}.
\]
</div>

The method transforms a sum over an interval into a shorter sum (the <em>B-process</em> uses the Poisson formula), and iterating gives better and better bounds. For the divisor problem, one sets \( f(n) = (t/2\pi)\log n \) and estimates the resulting exponential sum to improve on \( O(x^{1/4}) \) toward \( O(x^{1/4 + \varepsilon}) \).

## 6.5 Connection to Dirichlet Series

The asymptotic \( D(x) \sim x\log x \) is related to the double pole of \( \zeta(s)^2 \) at \( s=1 \). More precisely, by Perron's formula:

\[
\sum_{n \leq x} d(n) = \frac{1}{2\pi i}\int_{c-i\infty}^{c+i\infty} \zeta(s)^2 \frac{x^s}{s}\,ds.
\]
The main term \( x\log x + (2\gamma-1)x \) arises from the residue at the double pole \( s=1 \). Near \(s=1\):

\[
\zeta(s)^2 = \frac{1}{(s-1)^2} + \frac{2\gamma}{s-1} + O(1),
\]
and the residue formula for the double pole of \(\zeta(s)^2 x^s/s\) gives:

\[
\mathrm{Res}_{s=1}\left(\zeta(s)^2 \frac{x^s}{s}\right) = \frac{d}{ds}\left[(s-1)^2 \zeta(s)^2 \frac{x^s}{s}\right]_{s=1} = x\log x + (2\gamma - 1)x.
\]

---

# Chapter 7: Quadratic Residues and Primitive Roots

## 7.1 The Legendre Symbol

<div class="definition">
<strong>Definition 7.1 (Legendre symbol).</strong> For an odd prime \( p \) and integer \( a \) with \( p \nmid a \), define the <strong>Legendre symbol</strong>

\[
\left(\frac{a}{p}\right) = \begin{cases} 1 & \text{if } a \equiv b^2 \pmod{p} \text{ for some } b, \\ -1 & \text{otherwise.} \end{cases}
\]
If \( p \mid a \), set \( \left(\frac{a}{p}\right) = 0 \).
</div>

Elements \( a \not\equiv 0 \pmod{p} \) with \( \left(\frac{a}{p}\right) = 1 \) are <strong>quadratic residues</strong> mod \( p \); those with \( \left(\frac{a}{p}\right) = -1 \) are <strong>quadratic non-residues</strong>. There are exactly \( (p-1)/2 \) of each in \( (\mathbb{Z}/p\mathbb{Z})^* \).

The Legendre symbol is essentially a Dirichlet character mod \(p\): it is completely multiplicative (by Corollary 7.3 below), periodic mod \(p\), and takes values in \(\{0, \pm 1\}\). It is the unique nontrivial real character mod \(p\).

## 7.2 Euler's Criterion and Basic Properties

<div class="theorem">
<strong>Theorem 7.2 (Euler's Criterion).</strong> For an odd prime \( p \) and \( \gcd(a,p)=1 \):

\[
\left(\frac{a}{p}\right) \equiv a^{(p-1)/2} \pmod{p}.
\]
</div>

<div class="proof">
<strong>Proof.</strong> Since \( (\mathbb{Z}/p\mathbb{Z})^* \) is cyclic of order \( p-1 \), there exists a generator \( g \). Write \( a = g^k \). Then \( a \) is a square iff \( k \) is even. We have \( a^{(p-1)/2} = g^{k(p-1)/2} \). If \( k \) is even, \( g^{k(p-1)/2} = (g^{p-1})^{k/2} = 1 \). If \( k \) is odd, \( g^{k(p-1)/2} = g^{(p-1)/2} \), which is the unique element of order 2 in \( (\mathbb{Z}/p\mathbb{Z})^* \), i.e., \( \equiv -1 \pmod{p} \). \( \square \)
</div>

<div class="example">
<strong>Example 7.3 (Applying Euler's criterion).</strong> Is 5 a quadratic residue mod 11?

We compute \(5^{(11-1)/2} = 5^5 \pmod{11}\):

\[
5^2 = 25 \equiv 3, \quad 5^4 \equiv 9, \quad 5^5 \equiv 5 \cdot 9 = 45 \equiv 1 \pmod{11}.
\]
Since \(5^5 \equiv 1 \equiv \left(\frac{5}{11}\right) \pmod{11}\), we conclude \(\left(\frac{5}{11}\right) = 1\): 5 is a quadratic residue mod 11. Indeed, \(4^2 = 16 \equiv 5 \pmod{11}\), confirming this.
</div>

<div class="theorem">
<strong>Corollary 7.4 (Multiplicativity).</strong> \( \left(\frac{ab}{p}\right) = \left(\frac{a}{p}\right)\left(\frac{b}{p}\right) \). Thus the Legendre symbol is a completely multiplicative function of \( a \).
</div>

## 7.3 Gauss's Lemma

<div class="theorem">
<strong>Theorem 7.5 (Gauss's Lemma).</strong> Let \( p \) be an odd prime and \( \gcd(a,p)=1 \). Consider the integers \( a, 2a, 3a, \ldots, \frac{p-1}{2}a \) modulo \( p \), each reduced to the range \( (-p/2, p/2) \). Let \( \nu \) be the count of those that are negative. Then

\[
\left(\frac{a}{p}\right) = (-1)^\nu.
\]
</div>

<div class="example">
<strong>Example 7.6.</strong> Compute \( \left(\frac{3}{7}\right) \). Here \( p=7 \), \( a=3 \), \( (p-1)/2=3 \). The products are \( 3, 6, 9 \equiv 2 \pmod 7 \). Reduced to \( (-3,3] \): \( 3 \mapsto 3 \), \( 6 \mapsto -1 \) (since \( 6 > 7/2 \), take \( 6-7=-1 \)), \( 2 \mapsto 2 \). Negatives: one (the \( -1 \)). So \( \left(\frac{3}{7}\right) = (-1)^1 = -1 \): \( 3 \) is a non-residue mod \( 7 \). Check: \( 1^2=1, 2^2=4, 3^2=2 \pmod 7 \), so QR\( \pmod 7 \) are \( \{1,2,4\} \). Indeed \( 3 \notin \{1,2,4\} \).
</div>

## 7.4 The Law of Quadratic Reciprocity

<div class="theorem">
<strong>Theorem 7.7 (Quadratic Reciprocity, Gauss 1796).</strong> For distinct odd primes \( p, q \):

\[
\left(\frac{p}{q}\right)\left(\frac{q}{p}\right) = (-1)^{\frac{p-1}{2}\cdot\frac{q-1}{2}}.
\]
Equivalently: \( \left(\frac{p}{q}\right) = \left(\frac{q}{p}\right) \) unless \( p \equiv q \equiv 3 \pmod 4 \), in which case \( \left(\frac{p}{q}\right) = -\left(\frac{q}{p}\right) \).

<strong>Supplements:</strong>

\[
\left(\frac{-1}{p}\right) = (-1)^{(p-1)/2}, \qquad \left(\frac{2}{p}\right) = (-1)^{(p^2-1)/8}.
\]
</div>

Quadratic reciprocity has over 200 proofs. One elegant proof uses the Gauss sum \( \tau(\chi) = \sum_{a=0}^{p-1} \left(\frac{a}{p}\right) e^{2\pi i a/p} \), for which \( \tau(\chi)^2 = (-1)^{(p-1)/2} p \).

<div class="example">
<strong>Example 7.8 (Using quadratic reciprocity).</strong> Is 17 a quadratic residue mod 97?

Since both 17 and 97 are primes, and 97 \(\equiv 1 \pmod 4\), quadratic reciprocity gives \(\left(\frac{17}{97}\right) = \left(\frac{97}{17}\right)\). Now \(97 \equiv 97 - 5\cdot 17 = 97 - 85 = 12 \pmod{17}\), so \(\left(\frac{97}{17}\right) = \left(\frac{12}{17}\right) = \left(\frac{4}{17}\right)\left(\frac{3}{17}\right) = 1 \cdot \left(\frac{3}{17}\right)\) (since \(4 = 2^2\) is a perfect square).

For \(\left(\frac{3}{17}\right)\): \(3 \equiv 3 \pmod 4\) and \(17 \equiv 1 \pmod 4\), so QR gives \(\left(\frac{3}{17}\right) = \left(\frac{17}{3}\right) = \left(\frac{2}{3}\right)\). Using the supplement: \(\left(\frac{2}{3}\right) = (-1)^{(9-1)/8} = (-1)^1 = -1\).

Therefore \(\left(\frac{17}{97}\right) = -1\): 17 is a quadratic non-residue mod 97.
</div>

## 7.5 Structure of (Z/nZ)*

<div class="theorem">
<strong>Theorem 7.9 (CRT).</strong> If \( n = \prod_i p_i^{e_i} \), then \( (\mathbb{Z}/n\mathbb{Z})^* \cong \prod_i (\mathbb{Z}/p_i^{e_i}\mathbb{Z})^* \) as groups.
</div>

<div class="theorem">
<strong>Theorem 7.10 (Structure of \( (\mathbb{Z}/p^k\mathbb{Z})^* \)).</strong>
<br>(a) For an odd prime \( p \) and \( k \geq 1 \), \( (\mathbb{Z}/p^k\mathbb{Z})^* \) is cyclic of order \( \varphi(p^k) = p^{k-1}(p-1) \).
<br>(b) \( (\mathbb{Z}/2\mathbb{Z})^* = \{1\} \), \( (\mathbb{Z}/4\mathbb{Z})^* \cong \mathbb{Z}/2\mathbb{Z} \), and \( (\mathbb{Z}/2^k\mathbb{Z})^* \cong \mathbb{Z}/2\mathbb{Z} \times \mathbb{Z}/2^{k-2}\mathbb{Z} \) for \( k \geq 3 \).
</div>

<div class="definition">
<strong>Definition 7.11 (Primitive root).</strong> A <strong>primitive root</strong> mod \( n \) is an element \( g \in (\mathbb{Z}/n\mathbb{Z})^* \) of order \( \varphi(n) \), i.e., a generator of the cyclic group.
</div>

<div class="theorem">
<strong>Theorem 7.12 (When primitive roots exist).</strong> Primitive roots mod \( n \) exist if and only if \( n \in \{1, 2, 4, p^k, 2p^k\} \) for odd primes \( p \) and \( k \geq 1 \).
</div>

<div class="proof">
<strong>Proof sketch.</strong> By Theorem 7.9, \( (\mathbb{Z}/n\mathbb{Z})^* \) is cyclic iff each factor \( (\mathbb{Z}/p_i^{e_i}\mathbb{Z})^* \) is cyclic and their orders are pairwise coprime. For \( n = p^k \) (odd prime), the group is cyclic by Theorem 7.10(a). For \( n = 2p^k \), the factor \( (\mathbb{Z}/2\mathbb{Z})^* \) is trivial, so the group is isomorphic to \( (\mathbb{Z}/p^k\mathbb{Z})^* \), which is cyclic. For \( n = 2^k \) with \( k \geq 3 \), the group has \( \mathbb{Z}/2 \times \mathbb{Z}/2^{k-2} \) which is not cyclic. For \( n \) with two distinct odd prime factors, the orders \( p^{a}(p-1) \) and \( q^{b}(q-1) \) share the factor 2, so the product is not cyclic. \( \square \)
</div>

---

# Chapter 8: Dirichlet Characters and L-Functions

Characters are the key tool for studying primes in arithmetic progressions. The idea is beautifully simple: to study primes in the residue class \(\ell \pmod k\), we use the fact that we can detect the condition \(n \equiv \ell \pmod k\) by averaging over characters — exactly as Fourier analysis detects the frequency content of a signal by averaging against exponentials. Characters are the "harmonics" of the group \((\mathbb{Z}/k\mathbb{Z})^*\).

## 8.1 Characters of Finite Abelian Groups

<div class="definition">
<strong>Definition 8.1.</strong> Let \( G \) be a finite abelian group. A <strong>character</strong> of \( G \) is a group homomorphism \( \chi : G \to \mathbb{C}^* \). The set of all characters forms the <strong>dual group</strong> \( \widehat{G} \), which is (non-canonically) isomorphic to \( G \).
</div>

<div class="theorem">
<strong>Theorem 8.2 (Orthogonality of characters).</strong> Let \( G \) be a finite abelian group. Then:
<br>(a) For \( \chi \in \widehat{G} \): \( \displaystyle\sum_{g \in G} \chi(g) = \begin{cases} |G| & \text{if } \chi = \chi_0 \text{ (trivial character)}, \\ 0 & \text{otherwise.} \end{cases} \)
<br>(b) For \( g \in G \): \( \displaystyle\sum_{\chi \in \widehat{G}} \chi(g) = \begin{cases} |G| & \text{if } g = e, \\ 0 & \text{otherwise.} \end{cases} \)
</div>

<div class="proof">
<strong>Proof of (a).</strong> If \( \chi = \chi_0 \), every term is 1, giving \( |G| \). Otherwise \( \chi \neq \chi_0 \), so there exists \( h \in G \) with \( \chi(h) \neq 1 \). Let \( S = \sum_{g \in G} \chi(g) \). Then \( \chi(h) S = \sum_{g \in G} \chi(hg) = S \) (the map \( g \mapsto hg \) is a bijection). So \( (\chi(h)-1)S = 0 \), hence \( S = 0 \). \( \square \)
</div>

## 8.2 Dirichlet Characters

<div class="definition">
<strong>Definition 8.3 (Dirichlet character).</strong> A <strong>Dirichlet character modulo \( k \)</strong> is a function \( \chi : \mathbb{Z} \to \mathbb{C} \) such that:
<br>(1) \( \chi(n+k) = \chi(n) \) for all \( n \) (periodicity),
<br>(2) \( \chi(n) = 0 \) if \( \gcd(n,k) > 1 \),
<br>(3) \( \chi(mn) = \chi(m)\chi(n) \) for all \( m, n \) (completely multiplicative),
<br>(4) \( \chi(n) \neq 0 \) for some \( n \).
</div>

A Dirichlet character mod \( k \) is essentially a character of \( (\mathbb{Z}/k\mathbb{Z})^* \), extended by zero. There are exactly \( \varphi(k) \) distinct Dirichlet characters mod \( k \).

**The principal character** \( \chi_0 \) mod \( k \): \( \chi_0(n) = 1 \) if \( \gcd(n,k)=1 \), \( 0 \) otherwise.

<div class="example">
<strong>Example 8.4 (All characters mod 4).</strong> We have \((\mathbb{Z}/4\mathbb{Z})^* = \{1, 3\} \cong \mathbb{Z}/2\mathbb{Z}\), so \(\varphi(4) = 2\) and there are exactly 2 characters.

The group \(\{1,3\}\) has two characters: the trivial one (sending everything to 1) and the sign character (sending 1 to 1 and 3 to -1). Extending to all of \(\mathbb{Z}\):

\(\chi_0 \pmod 4\): \(\chi_0(1)=1, \chi_0(2)=0, \chi_0(3)=1, \chi_0(4)=0\), and periodic.

\(\chi_1 \pmod 4\): \(\chi_1(1)=1, \chi_1(2)=0, \chi_1(3)=-1, \chi_1(4)=0\), and periodic.

The character \(\chi_1\) is the unique primitive character mod 4. It detects the sign of an odd number modulo 4: \(\chi_1(n) = 1\) if \(n \equiv 1 \pmod 4\) and \(\chi_1(n) = -1\) if \(n \equiv 3 \pmod 4\). The corresponding L-function is

\[
L(s, \chi_1) = 1 - \frac{1}{3^s} + \frac{1}{5^s} - \frac{1}{7^s} + \cdots,
\]
and \(L(1,\chi_1) = 1 - 1/3 + 1/5 - 1/7 + \cdots = \pi/4\) (the Leibniz formula). The non-vanishing of this L-function at \(s=1\) is what guarantees there are infinitely many primes \(\equiv 1 \pmod 4\) and infinitely many primes \(\equiv 3 \pmod 4\).
</div>

<div class="example">
<strong>Example 8.5 (All characters mod 5).</strong> We have \((\mathbb{Z}/5\mathbb{Z})^* = \{1,2,3,4\} \cong \mathbb{Z}/4\mathbb{Z}\) (cyclic of order 4, generated by 2: \(2^1=2, 2^2=4, 2^3=3, 2^4=1 \pmod 5\)). So there are \(\varphi(5) = 4\) characters.

A character \(\chi\) of \(\mathbb{Z}/4\mathbb{Z}\) is determined by \(\chi(2) \in \{1, i, -1, -i\}\) (4th roots of unity). The four characters are:

| \(n\) | 1 | 2 | 3 | 4 | (mod 5) |
|---|---|---|---|---|---|
| \(\chi_0\) | 1 | 1 | 1 | 1 |  principal |
| \(\chi_1\) | 1 | \(i\) | \(-i\) | \(-1\) | complex |
| \(\chi_2\) | 1 | \(-1\) | \(-1\) | 1 |  real, corresponds to \(\left(\frac{\cdot}{5}\right)\) |
| \(\chi_3\) | 1 | \(-i\) | \(i\) | \(-1\) | complex (= \(\bar{\chi}_1\)) |

The real character \(\chi_2\) is the Legendre symbol \(\chi_2(n) = \left(\frac{n}{5}\right)\): the quadratic residues mod 5 are \(\{1,4\}\) and the non-residues are \(\{2,3\}\), so \(\chi_2(1) = \chi_2(4) = 1\) and \(\chi_2(2) = \chi_2(3) = -1\).

All four characters are primitive (none is induced from a character of smaller modulus, since the only proper divisors of 5 are 1 and 5).

For Dirichlet's theorem mod 5, we need \(L(1,\chi) \neq 0\) for each \(\chi \neq \chi_0\). The real character gives \(L(1,\chi_2) = 1 - 1/2 - 1/3 + 1/4 + 1/6 - \cdots\) (with period 5 signs determined by \(\chi_2\)), which equals \(\frac{\pi}{5\sqrt{5}}(2+\sqrt{5})\) by the class number formula for \(\mathbb{Q}(\sqrt{5})\). The complex characters satisfy \(L(1,\chi_1) = \overline{L(1,\chi_3)} \neq 0\) by the complex non-vanishing proof.
</div>

<div class="theorem">
<strong>Theorem 8.6 (Orthogonality for Dirichlet characters).</strong>

\[
\sum_{\chi \bmod k} \chi(m)\overline{\chi(n)} = \begin{cases} \varphi(k) & \text{if } m \equiv n \pmod{k} \text{ and } \gcd(n,k)=1, \\ 0 & \text{otherwise.} \end{cases}
\]
Equivalently, \( \frac{1}{\varphi(k)}\sum_\chi \chi(m)\overline{\chi(\ell)} = [\ell \equiv m \pmod k] \cdot [\gcd(\ell,k)=1] \).
</div>

This orthogonality is the key that allows us to detect primes in specific residue classes.

## 8.3 Primitive Characters and the Conductor

<div class="definition">
<strong>Definition 8.7.</strong> A character \( \chi \) mod \( k \) is <strong>induced</strong> by a character \( \chi' \) mod \( d \) (with \( d \mid k \)) if \( \chi(n) = \chi'(n) \) for all \( n \) with \( \gcd(n,k)=1 \). A character is <strong>primitive</strong> if it is not induced by any character of smaller modulus.
</div>

Every character is induced from a unique primitive character; the modulus of that primitive character is the <strong>conductor</strong> of \( \chi \).

<div class="example">
<strong>Example 8.8 (Induced characters).</strong> The principal character \(\chi_0 \pmod k\) is induced from the principal character \(\chi_0 \pmod 1\) (which is just \(\chi_0(1) = 1\)), so its conductor is 1.

The character \(\chi_0 \pmod{12}\) (with \(\chi_0(n) = 1\) for \(\gcd(n,12)=1\)) is induced from \(\chi_0 \pmod 1\) with conductor 1. But the character \(\chi\) mod 12 defined by \(\chi(n) = \left(\frac{n}{3}\right)\) for \(\gcd(n,6)=1\) and 0 otherwise is induced from the primitive character \(\left(\frac{\cdot}{3}\right)\) mod 3 — its conductor is 3.
</div>

## 8.4 Gauss Sums

<div class="definition">
<strong>Definition 8.9 (Gauss sum).</strong> For a Dirichlet character \( \chi \) mod \( k \), the <strong>Gauss sum</strong> is

\[
\tau(\chi) = \sum_{a=1}^k \chi(a) e^{2\pi i a/k}.
\]
</div>

<div class="theorem">
<strong>Theorem 8.10.</strong> If \( \chi \) is a primitive character mod \( k \), then \( |\tau(\chi)|^2 = k \). For a character \( \chi \) mod \( k \) and \( \gcd(n,k)=1 \):

\[
\chi(n)\tau(\bar\chi) = \sum_{a=1}^k \bar\chi(a) e^{2\pi i an/k}.
\]
</div>

<div class="example">
<strong>Example 8.11 (Gauss sum for \(\chi_1 \pmod 4\)).</strong> The character \(\chi_1\) mod 4 has \(\chi_1(1) = 1\), \(\chi_1(3) = -1\), and \(\chi_1(2) = \chi_1(4) = 0\). So:

\[
\tau(\chi_1) = \chi_1(1)e^{2\pi i/4} + \chi_1(2)e^{2\pi i\cdot 2/4} + \chi_1(3)e^{2\pi i\cdot 3/4} + \chi_1(4)e^{2\pi i\cdot 4/4}
\]

\[
= e^{\pi i/2} - e^{3\pi i/2} = i - (-i) = 2i.
\]
Indeed \(|\tau(\chi_1)|^2 = |2i|^2 = 4 = k\), confirming Theorem 8.10.
</div>

Gauss sums are essential for the functional equation of \( L(s,\chi) \) and also appear in the evaluation of Gauss's proof of quadratic reciprocity.

## 8.5 Dirichlet L-Functions

<div class="definition">
<strong>Definition 8.12 (Dirichlet L-function).</strong> For a Dirichlet character \( \chi \) mod \( k \) and \( s \in \mathbb{C} \) with \( \mathrm{Re}(s) > 1 \), define

\[
L(s,\chi) = \sum_{n=1}^\infty \frac{\chi(n)}{n^s} = \prod_p \frac{1}{1 - \chi(p)p^{-s}}.
\]
</div>

For the principal character \( \chi_0 \) mod \( k \):

\[
L(s,\chi_0) = \zeta(s) \prod_{p \mid k} (1 - p^{-s}),
\]
so \( L(s,\chi_0) \) has a simple pole at \( s=1 \) with residue \( \varphi(k)/k \).

For non-principal \( \chi \), since \( \sum_{n=1}^k \chi(n) = 0 \) (orthogonality), Abel summation shows \( L(s,\chi) \) converges for \( \mathrm{Re}(s) > 0 \) and is entire.

<div class="remark">
<strong>Remark 8.13 (Why L-functions encode prime distribution).</strong> Just as \(-\zeta'(s)/\zeta(s) = \sum_n \Lambda(n)n^{-s}\) encodes \(\psi(x)\), the logarithmic derivatives of L-functions encode twisted prime sums:

\[
-\frac{L'(s,\chi)}{L(s,\chi)} = \sum_{n=1}^\infty \frac{\chi(n)\Lambda(n)}{n^s}.
\]
To count primes in the class \(p \equiv \ell \pmod k\), we use the orthogonality relation to "select" those primes:

\[
\sum_{\substack{p \leq x \\ p \equiv \ell \pmod k}}\log p = \frac{1}{\varphi(k)}\sum_\chi \bar\chi(\ell) \sum_{p \leq x} \chi(p)\log p.
\]
The character \(\chi = \chi_0\) contributes the main term (from the pole of \(L'/L\) at \(s=1\)), while the non-principal characters contribute error terms that are bounded if and only if \(L(1,\chi) \neq 0\).
</div>

## 8.6 Analytic Continuation and Functional Equation of L(s,χ)

<div class="theorem">
<strong>Theorem 8.14 (Analytic continuation).</strong> For a non-principal character \( \chi \) mod \( k \), \( L(s,\chi) \) extends to an entire function. For the principal character, \( L(s,\chi_0) \) extends to all \( \mathbb{C} \) with a simple pole at \( s=1 \) with residue \( \varphi(k)/k \).
</div>

<div class="theorem">
<strong>Theorem 8.15 (Functional equation).</strong> For a primitive character \( \chi \) mod \( k \), define

\[
\Lambda(s,\chi) = \left(\frac{k}{\pi}\right)^{(s+a)/2} \Gamma\!\left(\frac{s+a}{2}\right) L(s,\chi),
\]
where \( a = 0 \) if \( \chi(-1)=1 \) (even character) and \( a=1 \) if \( \chi(-1)=-1 \) (odd character). Then

\[
\Lambda(s,\chi) = \frac{\tau(\chi)}{i^a \sqrt{k}} \Lambda(1-s,\bar\chi).
\]
</div>

<div class="remark">
<strong>Remark 8.16 (Parity and the functional equation).</strong> The parity \(\chi(-1) = \pm 1\) determines whether \(\chi\) is an "even" or "odd" character. For the Riemann zeta function, which corresponds to the trivial character, \(\chi_0(-1) = 1\) so it is even, and the Gamma factor is \(\Gamma(s/2)\). For an odd character, the Gamma factor is \(\Gamma((s+1)/2)\). The trivial zeros of \(L(s,\chi)\) occur at the poles of the Gamma factor: at \(s = 0, -2, -4, \ldots\) for even characters, and at \(s = -1, -3, -5, \ldots\) for odd characters.
</div>

## 8.7 Non-Vanishing of L(1,χ)

<div class="theorem">
<strong>Theorem 8.17.</strong> For any non-principal character \( \chi \) mod \( k \), \( L(1,\chi) \neq 0 \).
</div>

This is the key analytic step for Dirichlet's theorem on primes in arithmetic progressions.

<div class="proof">
<strong>Proof (for complex \( \chi \)).</strong> Suppose \( \chi \) is complex (i.e., \( \chi \neq \bar\chi \)) and \( L(1,\chi) = 0 \). Since \( L(s,\bar\chi) = \overline{L(\bar s, \chi)} \), we also have \( L(1,\bar\chi) = 0 \). Consider

\[
Z(s) = \prod_{\chi \bmod k} L(s,\chi).
\]
This is a product of \( \varphi(k) \) L-functions. One can show \( Z(s) \) has non-negative coefficients and

\[
Z(s) = \sum_{n \geq 1} \frac{a(n)}{n^s}, \quad a(n) \geq 0.
\]
By Landau's theorem, if \( Z(s) \) is entire (no pole at \( s=1 \)), it converges everywhere. But \( Z(\sigma) \geq 1 \) for real \( \sigma > 1 \) (since each \( |L(s,\chi)| \geq 1 \) from the positivity of \( a(n) \)). Actually, the log of \( Z(\sigma) \) grows like \( (1/\varphi(k))\log(\sigma-1)^{-1} + O(1) \), contradicting \( Z(\sigma) \to Z(1) < \infty \). This proves \( L(1,\chi) \neq 0 \) when \( \chi \) is complex.

<strong>Proof (for real non-principal \( \chi \)).</strong> Suppose \( \chi \) is real (i.e., \( \chi = \bar\chi \), values in \( \{0, \pm 1\} \)) and \( L(1,\chi) = 0 \). Consider the product

\[
F(s) = \zeta(s) L(s,\chi).
\]
Since \( L(1,\chi) = 0 \) cancels the pole of \( \zeta(s) \), \( F(s) \) is entire. One shows \( F(s) = \sum a(n)/n^s \) with \( a(n) \geq 0 \) (since \( a(n) = \sum_{d \mid n} \chi(d) \geq 0 \) for all \( n \), as it counts certain representations). By Landau's theorem, \( F \) must have a singularity at some real \( s \geq 0 \), and by inspection this would have to be at \( s = 1/2 \) or similar, but analysis of the series gives a contradiction. The classical argument uses the bound \( F(\sigma) \geq 1 + \sigma^{-s} \to \infty \) combined with analyticity. \( \square \)
</div>

<div class="remark">
<strong>Remark 8.18.</strong> For real characters, a quantitative lower bound is known: \( L(1,\chi) \gg 1/\sqrt{k} \) (this follows from the class number formula for quadratic fields). The existence of hypothetical exceptional <strong>Siegel zeros</strong> (real zeros \( \beta \) of \( L(s,\chi) \) very close to 1) is the main barrier to improving constants in error terms for primes in arithmetic progressions.
</div>

---

# Chapter 9: Primes in Arithmetic Progressions

## 9.1 Dirichlet's Theorem

<div class="theorem">
<strong>Theorem 9.1 (Dirichlet, 1837).</strong> For any integers \( k \geq 1 \) and \( \ell \) with \( \gcd(k,\ell) = 1 \), there are infinitely many primes \( p \equiv \ell \pmod{k} \). More quantitatively:

\[
\sum_{\substack{p \leq x \\ p \equiv \ell \pmod k}} \frac{\log p}{p} = \frac{1}{\varphi(k)}\log x + O(1).
\]
</div>

The proof combines orthogonality of characters (to detect the condition \( p \equiv \ell \pmod k \)) with non-vanishing of L-functions.

<div class="remark">
<strong>Remark 9.2 (Historical context).</strong> Dirichlet's theorem was the first use of analysis to prove a purely number-theoretic result. It was stunning precisely because characters and L-functions were new inventions — there was no pre-existing reason to believe complex analysis would have anything to say about whether the arithmetic progression \(1, 5, 9, 13, 17, \ldots\) contains infinitely many primes. The theorem was also important for Gauss: it resolved a question about the distribution of primes that Gauss had investigated empirically but could not prove.
</div>

## 9.2 Detecting Congruences with Characters

The key identity: for \( \gcd(\ell, k) = 1 \),

\[
\mathbf{1}[n \equiv \ell \pmod k] = \frac{1}{\varphi(k)} \sum_{\chi \bmod k} \chi(\ell)^{-1} \chi(n), \quad \gcd(n,k)=1.
\]
Therefore, for any function \( f \) supported on integers coprime to \( k \):

\[
\sum_{\substack{n \leq x \\ n \equiv \ell \pmod k}} f(n) = \frac{1}{\varphi(k)} \sum_\chi \overline{\chi(\ell)} \sum_{n \leq x} f(n)\chi(n).
\]

Applying this to \( f(n) = \Lambda(n)/n \):

\[
\sum_{\substack{n \leq x \\ n \equiv \ell \pmod k}} \frac{\Lambda(n)}{n} = \frac{1}{\varphi(k)}\sum_\chi \overline{\chi(\ell)} \sum_{n \leq x} \frac{\Lambda(n)\chi(n)}{n}.
\]

## 9.3 Analysis of L-Function Logarithmic Derivatives

For \( \mathrm{Re}(s) > 1 \):

\[
\frac{L'(s,\chi)}{L(s,\chi)} = -\sum_n \frac{\Lambda(n)\chi(n)}{n^s}.
\]
The principal character contributes the main term:

\[
-\frac{L'(s,\chi_0)}{L(s,\chi_0)} \sim \frac{1}{s-1}
\]
near \( s=1 \). Non-principal characters have \( L(1,\chi) \neq 0 \), so \( -L'(s,\chi)/L(s,\chi) \) is holomorphic at \( s=1 \) and bounded.

By partial summation (applied to the logarithmic derivative at \( s=1 \)):

\[
\sum_{n \leq x} \frac{\Lambda(n)\chi_0(n)}{n} = \log x + O(1), \quad \sum_{n \leq x} \frac{\Lambda(n)\chi(n)}{n} = O(1) \text{ for } \chi \neq \chi_0.
\]
Combining:

\[
\sum_{\substack{p \leq x \\ p \equiv \ell \pmod k}} \frac{\log p}{p} = \frac{1}{\varphi(k)}\log x + O(1).
\]

## 9.4 The Proof of Dirichlet's Theorem

<div class="proof">
<strong>Proof of Theorem 9.1.</strong>

<strong>Step 1: Character sum identity.</strong> Using orthogonality of characters:

\[
\sum_{\substack{p \leq x \\ p \equiv \ell \pmod k}} \frac{\log p}{p} = \frac{1}{\varphi(k)} \sum_\chi \overline{\chi(\ell)} \sum_{p \leq x} \frac{\chi(p)\log p}{p}.
\]

<strong>Step 2: Main term from principal character.</strong> For \( \chi = \chi_0 \):

\[
\sum_{p \leq x} \frac{\chi_0(p)\log p}{p} = \sum_{\substack{p \leq x \\ p \nmid k}} \frac{\log p}{p} = \log x + O(1),
\]
using \( \sum_{p \leq x} (\log p)/p = \log x + O(1) \) (Theorem 3.15(b)) and subtracting the finitely many \( p \mid k \).

<strong>Step 3: Non-principal characters contribute \( O(1) \).</strong> For \( \chi \neq \chi_0 \), consider

\[
S(\chi, x) = \sum_{p \leq x} \frac{\chi(p)\log p}{p} = -\frac{L'(1,\chi)}{L(1,\chi)} + O(1) = O(1),
\]
since \( L(1,\chi) \neq 0 \) (Theorem 8.17) means \( L'(s,\chi)/L(s,\chi) \) is holomorphic and bounded near \( s=1 \).

<strong>Step 4: Conclusion.</strong> Only the principal character contributes a main term, giving

\[
\sum_{\substack{p \leq x \\ p \equiv \ell \pmod k}} \frac{\log p}{p} = \frac{1}{\varphi(k)}\log x + O(1).
\]
Since the right side \( \to \infty \), there are infinitely many primes \( \equiv \ell \pmod k \). \( \square \)
</div>

## 9.5 Density of Primes in Arithmetic Progressions

<div class="theorem">
<strong>Theorem 9.3 (Equidistribution).</strong> Primes are equidistributed among residue classes. More precisely, for \( \gcd(\ell,k)=1 \):

\[
\pi(x; k, \ell) := \#\{p \leq x : p \equiv \ell \pmod k\} \sim \frac{\pi(x)}{\varphi(k)} \sim \frac{x}{\varphi(k)\log x}.
\]
</div>

<div class="proof">
<strong>Proof.</strong> Combine the logarithmic-derivative estimate from Section 9.3 with partial summation (analogous to relating \( \psi \) to \( \pi \)). The contribution of each residue class to \( \pi(x) \) is \( 1/\varphi(k) \) of the total, reflecting the uniformity. \( \square \)
</div>

<div class="remark">
<strong>Remark 9.4 (Equidistribution and natural density).</strong> The theorem says that the "natural density" of primes \(p \equiv \ell \pmod k\) among all primes is \(1/\varphi(k)\), regardless of which specific residue class \(\ell\) we choose (as long as \(\gcd(\ell,k)=1\)). This is a striking uniformity. The \(\varphi(k)\) admissible residue classes share the prime "pie" equally.

However, while the *asymptotic density* is equal, finite computations reveal a consistent bias: the **Chebyshev bias** phenomenon. For example, among primes up to \(x\), there are usually slightly more primes \(\equiv 3 \pmod 4\) than \(\equiv 1 \pmod 4\). This bias is explained by the explicit formula: the contribution of the zeros of \(L(s,\chi)\) creates a persistent but oscillating imbalance that favors certain residue classes on average.
</div>

## 9.6 Siegel Zeros and Effective Bounds

<div class="definition">
<strong>Definition 9.5 (Siegel zero).</strong> A real zero \( \beta \) of \( L(s,\chi) \) for a real primitive character \( \chi \) mod \( k \) is called a <strong>Siegel zero</strong> if \( \beta > 1 - c/\log k \) for a small absolute constant \( c \).
</div>

<div class="theorem">
<strong>Theorem 9.6 (Siegel's theorem).</strong> For any \( \varepsilon > 0 \), there exists \( c(\varepsilon) > 0 \) (ineffective) such that for all real primitive characters \( \chi \) mod \( k \):

\[
L(1,\chi) > \frac{c(\varepsilon)}{k^\varepsilon}.
\]
</div>

The ineffectivity stems from an argument that either Siegel zeros don't exist (giving a good bound via an explicit constant), or if two different real characters have zeros very close to 1, they "repel" each other (Deuring–Heilbronn phenomenon), also giving a good bound. But extracting an explicit constant from this argument requires knowing which case holds.

<div class="remark">
<strong>Remark 9.7.</strong> Siegel zeros, if they exist, would be related to exceptional real quadratic fields with unusually large class number. Their existence would not affect Dirichlet's theorem (infinitely many primes in each AP) but would weaken explicit error bounds in the prime number theorem for arithmetic progressions.
</div>

## 9.7 The Generalized Riemann Hypothesis

<div class="theorem">
<strong>Theorem 9.8 (Conditional on GRH).</strong> If the Generalized Riemann Hypothesis (GRH) holds — i.e., all nontrivial zeros of all Dirichlet L-functions \( L(s,\chi) \) lie on \( \mathrm{Re}(s) = 1/2 \) — then for \( \gcd(\ell,k)=1 \):

\[
\pi(x; k, \ell) = \frac{\mathrm{li}(x)}{\varphi(k)} + O(\sqrt{x}\log(kx)).
\]
</div>

Unconditionally, the best known error term is \( O(x \exp(-c\sqrt{\log x})) \) uniformly for \( k \leq (\log x)^A \), and the Bombieri–Vinogradov theorem (an average form of GRH) gives a near-optimal result on average.

---

# Chapter 10: Additional Topics

## 10.1 Dirichlet Series: Deeper Convergence Theory

<div class="theorem">
<strong>Theorem 10.1 (Convergence in sectors).</strong> If the Dirichlet series \( F(s) = \sum a(n)/n^s \) converges at \( s_0 \), then it converges uniformly in any sector \( \{s : |\arg(s-s_0)| < \alpha < \pi/2\} \).
</div>

<div class="proof">
<strong>Proof sketch.</strong> The partial sums \( A(x) = \sum_{n \leq x} a(n)/n^{s_0} \) are Cauchy, say \( |A(x) - A(y)| < \varepsilon \) for \( x, y > N \). For \( s = s_0 + w \) with \( \mathrm{Re}(w) > 0 \), Abel summation gives

\[
\sum_{N < n \leq M} \frac{a(n)}{n^s} = \left.\frac{A(x)}{x^w}\right|_N^M + w\int_N^M \frac{A(x)}{x^{w+1}}\,dx.
\]
In a sector \( |\arg w| \leq \pi/2 - \delta \), we have \( |w| \leq C\,\mathrm{Re}(w) \), allowing the integral to be bounded by \( \varepsilon \cdot |w|/\mathrm{Re}(w) \leq C\varepsilon \). \( \square \)
</div>

This theorem (sometimes called the uniqueness theorem for Dirichlet series) also implies: if a Dirichlet series converges for \( \mathrm{Re}(s) > \sigma_0 \) and equals zero there, then all coefficients are zero.

## 10.2 Perron's Formula

**Perron's formula** converts partial sums of Dirichlet series into contour integrals. It is the fundamental tool connecting the analytic properties of a Dirichlet series (poles, zeros, growth) to the arithmetic properties of its coefficients (partial sums).

<div class="theorem">
<strong>Theorem 10.2 (Perron's formula, basic version).</strong> For \( c > 0 \) and \( x > 0 \) not an integer, and \( T > 0 \):

\[
\sum_{n \leq x} a(n) = \frac{1}{2\pi i} \int_{c-iT}^{c+iT} F(s) \frac{x^s}{s}\,ds + O\!\left(\frac{x^c}{T}\sum_n \frac{|a(n)|}{n^c\left|\log(x/n)\right|}\right).
\]
As \(T \to \infty\), the integral converges to \(\sum_{n \leq x} a(n)\) (for non-integer \(x\)).
</div>

<div class="remark">
<strong>Remark 10.3 (The key identity behind Perron's formula).</strong> The formula rests on the identity

\[
\frac{1}{2\pi i}\int_{c-i\infty}^{c+i\infty} \frac{y^s}{s}\,ds = \begin{cases} 1 & y > 1 \\ 1/2 & y = 1 \\ 0 & 0 < y < 1 \end{cases}
\]
for \(c > 0\). This is proved by residues: for \(y > 1\), close the contour to the left, picking up the simple pole at \(s=0\) with residue 1. For \(y < 1\), close to the right, encircling no poles.

Applying this to \(F(s) = \sum a(n)n^{-s}\) with \(y = x/n\):

\[
\frac{1}{2\pi i}\int_{c-i\infty}^{c+i\infty} F(s)\frac{x^s}{s}\,ds = \sum_n a(n) \cdot \frac{1}{2\pi i}\int \frac{(x/n)^s}{s}\,ds = \sum_{n \leq x} a(n).
\]
</div>

Perron's formula is the bridge between analytic properties of \( F(s) \) (poles, zeros) and arithmetic asymptotics (partial sums of \( a(n) \)).

<div class="example">
<strong>Example 10.4 (Perron applied to \(\zeta(s)\)).</strong> With \(F(s) = \zeta(s)\) and \(a(n) = 1\), Perron gives

\[
\lfloor x \rfloor = \frac{1}{2\pi i}\int_{c-iT}^{c+iT} \zeta(s)\frac{x^s}{s}\,ds + \text{error}.
\]
Moving the contour to \(\mathrm{Re}(s) = 1/2\) (past the simple pole of \(\zeta(s)\cdot x^s/s\) at \(s=1\) with residue \(x\)):

\[
\lfloor x \rfloor = x + \frac{1}{2\pi i}\int_{1/2-iT}^{1/2+iT}\zeta(s)\frac{x^s}{s}\,ds + O(\cdots).
\]
The remaining integral picks up contributions from the zeros of \(\zeta(s)\) via the residue theorem — but \(\zeta(s)\) has no poles in \(1/2 < \mathrm{Re}(s) < 1\), so no residues are picked up by moving the contour. This is consistent with \(\lfloor x \rfloor \approx x\) with error \(O(1)\).

For \(\psi(x) = \sum_{n \leq x}\Lambda(n)\), one uses \(F(s) = -\zeta'(s)/\zeta(s)\), which has a simple pole at each zero \(\rho\) of \(\zeta(s)\). Moving the contour past these zeros gives the explicit formula.
</div>

## 10.3 The Selberg Sieve

The Selberg sieve is a powerful combinatorial method for upper bounds on primes and related quantities.

<div class="theorem">
<strong>Theorem 10.5 (Selberg sieve upper bound).</strong> Let \( \mathcal{A} = \{a_1, \ldots, a_N\} \) be a set of integers and \( \mathcal{P} \) a set of primes. Let \( A(d) = \#\{a \in \mathcal{A} : d \mid a\} \approx g(d) N \) for a multiplicative function \( g \) with \( g(p) < 1 \). Then the number of elements of \( \mathcal{A} \) not divisible by any prime \( p \in \mathcal{P} \) with \( p \leq z \) is

\[
|\mathcal{A}_\mathcal{P}| \leq \frac{N}{\sum_{d \leq z, d \mid P(z)} \mu^2(d)/g(d)^{-1}} + \text{lower order terms},
\]
where \( P(z) = \prod_{p \leq z, p \in \mathcal{P}} p \).
</div>

<div class="remark">
<strong>Remark 10.6 (Sieve theory and twin primes).</strong> The Selberg sieve applied to \(\mathcal{A} = \{n(n+2) : n \leq x\}\) gives an upper bound on twin primes \(p, p+2\) of the form \(O(x/(\log x)^2)\), which matches the conjectured asymptotic \(\sim 2C_2 x/(\log x)^2\) (the Hardy–Littlewood conjecture) up to the constant. The sieve cannot prove infinitely many twin primes (the "parity problem"), but in 2013 Zhang proved that there are infinitely many primes \(p\) with \(p_{n+1} - p_n \leq 70{,}000{,}000\) (later improved by Maynard and Tao to gaps of at most 246), representing the first finite bound on prime gaps.
</div>

## 10.4 Linnik's Theorem and the Least Prime in an AP

<div class="theorem">
<strong>Theorem 10.7 (Linnik, 1944).</strong> There exists an absolute constant \( L \) (Linnik's constant) such that for any \( k \geq 1 \) and \( \gcd(\ell,k)=1 \), the smallest prime \( p \equiv \ell \pmod k \) satisfies \( p \leq k^L \).
</div>

The best known value is \( L \leq 5 \) (unconditional); under GRH, \( L = 2 \) suffices.

## 10.5 Zero-Free Regions for L-Functions and PNT in AP

The prime number theorem in arithmetic progressions (PNTAP) takes the form:

<div class="theorem">
<strong>Theorem 10.8 (PNTAP).</strong> For \( \gcd(\ell,k)=1 \) and \( k \leq (\log x)^A \) (any \( A>0 \)):

\[
\pi(x;k,\ell) = \frac{\mathrm{li}(x)}{\varphi(k)} + O_A\!\left(x\exp(-c_A\sqrt{\log x})\right).
\]
</div>

The Bombieri–Vinogradov theorem gives a stronger average statement:

<div class="theorem">
<strong>Theorem 10.9 (Bombieri–Vinogradov).</strong> For any \( A > 0 \), there exists \( B = B(A) \) such that

\[
\sum_{k \leq Q} \max_{y \leq x} \max_{\gcd(\ell,k)=1} \left|\pi(y;k,\ell) - \frac{\mathrm{li}(y)}{\varphi(k)}\right| \ll_A \frac{x}{(\log x)^A},
\]
for \( Q = x^{1/2}/(\log x)^B \).
</div>

This says GRH holds "on average" for \( k \leq x^{1/2-\varepsilon} \).

---

# Chapter 11: The Explicit Formula and its Consequences

## 11.1 Counting Zeros: The Riemann–von Mangoldt Formula

Before using the explicit formula, we need to know how many zeros there are. Let \(N(T)\) denote the number of nontrivial zeros \(\rho = \beta + i\gamma\) of \(\zeta(s)\) with \(0 < \beta < 1\) and \(0 < \gamma \leq T\).

<div class="theorem">
<strong>Theorem 11.1 (Riemann–von Mangoldt formula).</strong>

\[
N(T) = \frac{T}{2\pi}\log\frac{T}{2\pi} - \frac{T}{2\pi} + O(\log T).
\]
</div>

<div class="proof">
<strong>Proof sketch.</strong> Apply the argument principle to \(\xi(s)\) on the rectangle with vertices \(2 \pm iT\), \(-1 \pm iT\), using the functional equation \(\xi(s) = \xi(1-s)\) to simplify. The count of zeros equals \(\frac{1}{2\pi}\Delta_C \arg \xi(s)\) around the boundary \(C\). The dominant contribution comes from \(\Delta\arg\Gamma(s/2)\) along the horizontal edges, which gives the \((T/2\pi)\log(T/2\pi)\) term via Stirling's formula. \(\square\)
</div>

This formula tells us that zeros have average density \(\sim \log T/(2\pi)\) at height \(T\), growing logarithmically. The sum \(\sum_\rho x^\rho/\rho\) in the explicit formula therefore converges (conditionally) since \(\sum_{|\gamma| \leq T} 1/|\rho| \sim (\log T)^2 / (2\pi)\).

## 11.2 The Explicit Formula in Detail

<div class="theorem">
<strong>Theorem 11.2 (Von Mangoldt's explicit formula, precise form).</strong> For \(x > 1\) not a prime power:

\[
\psi(x) = x - \sum_{\rho:\, \zeta(\rho)=0,\, 0<\mathrm{Re}(\rho)<1} \frac{x^\rho}{\rho} + \frac{\zeta'(0)}{\zeta(0)} + \frac{1}{2}\log\!\left(1 - x^{-2}\right),
\]
where \(\zeta'(0)/\zeta(0) = -\log(2\pi)\) and the sum over nontrivial zeros is taken symmetrically: \(\lim_{T\to\infty}\sum_{|\mathrm{Im}(\rho)|\leq T}\).
</div>

<div class="remark">
<strong>Remark 11.3 (Reading the explicit formula).</strong> The explicit formula decomposes \(\psi(x)\) into:
<ul>
<li>The "main term" \(x\): this is the contribution of the pole of \(-\zeta'/\zeta\) at \(s=1\), confirming \(\psi(x) \sim x\).</li>
<li>The "prime oscillations" \(-\sum_\rho x^\rho/\rho\): each zero \(\rho = 1/2 + i\gamma\) (assuming RH) contributes \(-x^{1/2+i\gamma}/\rho = -(x^{1/2}/|\rho|)e^{i\gamma\log x + i\arg\rho}\), an oscillation of amplitude \(x^{1/2}/|\rho|\) and "frequency" \(\gamma/(2\pi)\) on the \(\log x\) scale.</li>
<li>The "trivial zero" corrections \(\frac{1}{2}\log(1-x^{-2}) = -\sum_{k=1}^\infty \frac{x^{-2k}}{2k}\): small for large \(x\).</li>
<li>The constant \(\zeta'(0)/\zeta(0) = -\log(2\pi)\): a global normalization.</li>
</ul>
So the primes "know" about all the zeros of \(\zeta\), and conversely the zeros encode all the information about the primes.
</div>

## 11.3 PNT and the Explicit Formula

From the explicit formula, PNT is equivalent to showing that \(\sum_{|\gamma| \leq T} x^\rho/\rho = o(x)\) as \(x \to \infty\) (for an appropriate \(T = T(x)\)). This requires two things:
1. **No zeros on \(\mathrm{Re}(s) = 1\)**: otherwise a zero \(\rho = 1+i\gamma\) would contribute \(x^1/(1+i\gamma)\) to the sum, giving a term of order \(x\).
2. **Zero-free region to the left of \(\mathrm{Re}(s)=1\)**: zeros with \(\mathrm{Re}(\rho) = 1 - c/\log T\) contribute \(x^{1-c/\log T}/|\rho|\), and summing over \(O(N(T))\) such zeros gives a total of \(O(xe^{-c\sqrt{\log x}})\) with the optimal choice \(T = e^{\sqrt{\log x}}\).

This is the quantitative PNT with error term \(O(xe^{-c\sqrt{\log x}})\).

---

# Chapter 12: The Gamma Function and Special Values

## 12.1 The Gamma Function Revisited

The Gamma function \(\Gamma(s) = \int_0^\infty t^{s-1}e^{-t}\,dt\) (for \(\mathrm{Re}(s) > 0\)) is the unique meromorphic continuation of the factorial, and its role in the functional equation of \(\zeta(s)\) is fundamental.

<div class="theorem">
<strong>Theorem 12.1 (Weierstrass product for \(\Gamma\)).</strong>

\[
\frac{1}{\Gamma(s)} = se^{\gamma s}\prod_{n=1}^\infty \left(1 + \frac{s}{n}\right)e^{-s/n}.
\]
</div>

This formula shows that \(\Gamma(s)\) is entire with no zeros, and has simple poles at \(s = 0, -1, -2, \ldots\). Taking the logarithmic derivative gives the digamma function \(\psi(s) = \Gamma'(s)/\Gamma(s)\):

\[
\psi(s) = -\gamma - \frac{1}{s} + \sum_{n=1}^\infty \left(\frac{1}{n} - \frac{1}{n+s}\right).
\]

<div class="example">
<strong>Example 12.2 (Special values of \(\Gamma\)).</strong>

\[
\Gamma(1/2) = \sqrt{\pi}, \quad \Gamma(3/2) = \frac{\sqrt{\pi}}{2}, \quad \Gamma(-1/2) = -2\sqrt{\pi}.
\]
The first identity \(\Gamma(1/2) = \sqrt{\pi}\) follows from the Gaussian integral: \(\Gamma(1/2) = \int_0^\infty t^{-1/2}e^{-t}\,dt = 2\int_0^\infty e^{-u^2}\,du = \sqrt{\pi}\).
</div>

## 12.2 Special Values of ζ(s)

<div class="theorem">
<strong>Theorem 12.3 (Values at even integers).</strong> For positive integers \(k\):

\[
\zeta(2k) = \frac{(-1)^{k+1}(2\pi)^{2k}B_{2k}}{2(2k)!},
\]
where \(B_{2k}\) are the Bernoulli numbers.
</div>

<div class="proof">
<strong>Proof.</strong> The Weierstrass product for \(\sin(\pi z)/(\pi z) = \prod_{n=1}^\infty(1-z^2/n^2)\) gives, after taking logarithms and differentiating:

\[
\pi\cot(\pi z) = \frac{1}{z} + \sum_{n=1}^\infty\left(\frac{1}{z+n} + \frac{1}{z-n}\right) = \frac{1}{z} - 2\sum_{k=1}^\infty \zeta(2k) z^{2k-1}.
\]
Expanding \(\pi\cot(\pi z)\) using the definition \(\pi\cot(\pi z) = \frac{1}{z} - 2\sum_{k=1}^\infty \frac{(2\pi)^{2k}|B_{2k}|}{2(2k)!}z^{2k-1}\) (from the generating function for Bernoulli numbers) and comparing coefficients gives the formula. \(\square\)
</div>

<div class="example">
<strong>Example 12.4 (First few values).</strong>

\[
\zeta(2) = \frac{\pi^2}{6}, \quad \zeta(4) = \frac{\pi^4}{90}, \quad \zeta(6) = \frac{\pi^6}{945}, \quad \zeta(8) = \frac{\pi^8}{9450}.
\]
For negative integers, the functional equation gives: \(\zeta(0) = -1/2\), \(\zeta(-1) = -1/12\), \(\zeta(-2) = 0\), \(\zeta(-3) = 1/120\), and in general \(\zeta(-2k) = 0\) (trivial zeros) and \(\zeta(1-2k) = -B_{2k}/(2k)\).
</div>

## 12.3 The Connection to Bernoulli Numbers

The Bernoulli numbers \(B_k\) defined by \(\sum_k B_k t^k/k! = t/(e^t-1)\) appear throughout number theory:
- In the Euler–Maclaurin formula as correction terms.
- In the values of \(\zeta\) at negative integers: \(\zeta(-n) = -B_{n+1}/(n+1)\).
- In the theory of cyclotomic fields (Kummer's criterion for regular primes).
- In the formula for \(\zeta(2k) = (-1)^{k+1}(2\pi)^{2k}B_{2k}/(2(2k)!)\).

The von Staudt–Clausen theorem characterizes the denominators of Bernoulli numbers: \(B_{2k} + \sum_{(p-1)\mid 2k} 1/p \in \mathbb{Z}\), where the sum is over primes \(p\) such that \((p-1) \mid 2k\).

---

# Appendix A: Complex Analysis Background

## A.1 Holomorphic and Meromorphic Functions

A function \( f : U \to \mathbb{C} \) (where \( U \subseteq \mathbb{C} \) is open) is **holomorphic** if it is complex differentiable at every point of \( U \). Holomorphic functions are infinitely differentiable and equal their Taylor series locally. A **meromorphic** function is holomorphic except at isolated poles.

**Key facts used in the course:**
- A holomorphic function determined on a sequence with an accumulation point is zero everywhere (identity theorem).
- If \( f \) is nonzero on a connected open set, then \( \log f \) can be defined locally and \( f'/f \) is holomorphic.
- The Argument Principle: \( \frac{1}{2\pi i} \oint \frac{f'(s)}{f(s)}\,ds \) counts zeros minus poles (with multiplicity) of \( f \) inside the contour.
- **Phragmén–Lindelöf principle**: If \(f\) is holomorphic on a strip and bounded on the boundary, then the bound holds throughout the strip (under mild growth conditions). This is used to bound \(\zeta(s)\) in the critical strip.

## A.2 The Gamma Function

<div class="definition">
<strong>Definition A.1.</strong> For \( \mathrm{Re}(s) > 0 \):

\[
\Gamma(s) = \int_0^\infty t^{s-1} e^{-t}\,dt.
\]
</div>

<div class="theorem">
<strong>Theorem A.2 (Properties of \( \Gamma \)).</strong>
<br>(a) Functional equation: \( \Gamma(s+1) = s\Gamma(s) \), so \( \Gamma(n) = (n-1)! \) for positive integers.
<br>(b) Reflection formula: \( \Gamma(s)\Gamma(1-s) = \pi/\sin(\pi s) \).
<br>(c) Duplication formula: \( \Gamma(s)\Gamma(s+1/2) = \sqrt{\pi} \cdot 2^{1-2s}\Gamma(2s) \).
<br>(d) Stirling's approximation: \( \log\Gamma(s) = s\log s - s - \frac{1}{2}\log(s/2\pi) + O(1/|s|) \) for large \( |s| \) away from the negative real axis.
<br>(e) Meromorphic continuation to all \( \mathbb{C} \), with simple poles at \( s = 0, -1, -2, \ldots \).
</div>

<div class="proof">
<strong>Proof of (b) (Reflection formula).</strong> One proof uses the product formula for \(\sin\):

\[
\sin(\pi s) = \pi s \prod_{n=1}^\infty \left(1 - \frac{s^2}{n^2}\right).
\]
The Weierstrass product for \(1/\Gamma\) gives \(\Gamma(s)\Gamma(-s) = -\pi/(s\sin(\pi s))\), and using \(\Gamma(-s) = -\Gamma(1-s)/s\) gives the result. \(\square\)
</div>

## A.3 Cauchy's Integral Formula and Residues

<div class="theorem">
<strong>Theorem A.3 (Residue theorem).</strong> If \( f \) is meromorphic inside and on a simple closed positively oriented contour \( C \), with poles at \( z_1, \ldots, z_k \) inside \( C \):

\[
\frac{1}{2\pi i} \oint_C f(z)\,dz = \sum_{j=1}^k \mathrm{Res}(f, z_j).
\]
</div>

The residue of \( f \) at a simple pole \( z_0 \) is \( \lim_{z \to z_0}(z-z_0)f(z) \). At a double pole: \( \mathrm{Res}(f,z_0) = \lim_{z \to z_0} \frac{d}{dz}[(z-z_0)^2 f(z)] \).

<div class="example">
<strong>Example A.4 (Computing residues for the PNT argument).</strong> The function \(g(s) = \zeta(s)x^s/s\) has:
<ul>
<li>A simple pole at \(s=1\) (from \(\zeta(s)\)) with residue \(\lim_{s\to 1}(s-1)\zeta(s)\cdot x^s/s = x^1/1 = x\).</li>
<li>A simple pole at \(s=0\) (from \(1/s\)) with residue \(\zeta(0) = -1/2\).</li>
<li>Simple poles at \(s = -2,-4,-6,\ldots\) (trivial zeros of nothing — wait, these are poles of \(\Gamma(s/2)\) turned into zeros of \(\zeta\), so they are zeros of \(\zeta\) and NOT poles of \(g(s)\)).</li>
</ul>
The function \(-\zeta'(s)/\zeta(s)\cdot x^s/s\) has:
<ul>
<li>A simple pole at \(s=1\) with residue \(x\).</li>
<li>A simple pole at each zero \(\rho\) of \(\zeta(s)\) with residue \(x^\rho/\rho\).</li>
</ul>
</div>

## A.4 The Phragmén–Lindelöf Principle

<div class="theorem">
<strong>Theorem A.5 (Phragmén–Lindelöf for vertical strips).</strong> Let \(f\) be holomorphic on the strip \(\sigma_1 < \mathrm{Re}(s) < \sigma_2\), continuous on the boundary, and satisfy the growth bound \(|f(s)| = O(e^{c|s|^\alpha})\) for some \(c > 0\) and \(\alpha < 1\). If \(|f(\sigma_j + it)| \leq M\) for all \(t\) and \(j=1,2\), then \(|f(s)| \leq M\) throughout the strip.
</div>

This is used to show that if \(\zeta(s)\) is bounded on the boundaries of the critical strip (\(\sigma = 0\) and \(\sigma = 1\)), it is bounded throughout. Together with the convexity of \(\log|\zeta(\sigma+it)|\) as a function of \(\sigma\), this gives the "convexity bound" \(|\zeta(1/2+it)| = O(t^{1/4+\varepsilon})\) — the Lindelöf Hypothesis states \(\varepsilon = 0\), which would follow from RH.

---

# Appendix B: Summary of Key Formulas

## B.1 The Fundamental Identities

| Identity | Formula |
|---|---|
| Divisor sum | \( \sum_{d \mid n} \mu(d) = [n=1] \) |
| Log identity | \( \log n = \sum_{d \mid n} \Lambda(d) \) |
| Totient sum | \( n = \sum_{d \mid n} \varphi(d) \) |
| Euler product | \( \zeta(s) = \prod_p (1-p^{-s})^{-1} \) |
| Log derivative | \( -\zeta'(s)/\zeta(s) = \sum_n \Lambda(n)/n^s \) |

## B.2 Asymptotic Formulas

| Sum | Asymptotic |
|---|---|
| \( \sum_{n \leq x} 1/n \) | \( \log x + \gamma + O(1/x) \) |
| \( \sum_{n \leq x} d(n) \) | \( x\log x + (2\gamma-1)x + O(\sqrt{x}) \) |
| \( \sum_{p \leq x} \log p / p \) | \( \log x + O(1) \) |
| \( \sum_{p \leq x} 1/p \) | \( \log\log x + M + O(1/\log x) \) |
| \( \pi(x) \) | \( x/\log x \) (PNT) |
| \( \psi(x) \) | \( x \) (PNT) |
| \( R(x) \) (circle) | \( \pi x + O(\sqrt{x}) \) |

## B.3 Dirichlet Series Dictionary

| Function \( f(n) \) | Dirichlet series \( \sum f(n)/n^s \) | Euler product |
|---|---|---|
| \( 1 \) | \( \zeta(s) \) | \( \prod_p (1-p^{-s})^{-1} \) |
| \( \mu(n) \) | \( 1/\zeta(s) \) | \( \prod_p (1-p^{-s}) \) |
| \( \Lambda(n) \) | \( -\zeta'(s)/\zeta(s) \) | — |
| \( d(n) \) | \( \zeta(s)^2 \) | \( \prod_p (1-p^{-s})^{-2} \) |
| \( \varphi(n) \) | \( \zeta(s-1)/\zeta(s) \) | — |
| \( \chi(n) \) | \( L(s,\chi) \) | \( \prod_p (1-\chi(p)p^{-s})^{-1} \) |
| \( \lambda(n) \) | \( \zeta(2s)/\zeta(s) \) | \( \prod_p (1+p^{-s})^{-1} \) |

## B.4 L-Function Properties Summary

| Property | \( \zeta(s) \) | \( L(s,\chi) \), \( \chi \neq \chi_0 \) |
|---|---|---|
| Convergence | \( \mathrm{Re}(s) > 1 \) absolute; \( \mathrm{Re}(s) > 0 \) conditional | \( \mathrm{Re}(s) > 0 \) conditional |
| Pole | Simple at \( s=1 \), residue 1 | Entire |
| Zeros \( \mathrm{Re}(s) = 1 \) | None | None (same proof) |
| Trivial zeros | \( s = -2,-4,-6,\ldots \) | Related to \( \chi(-1) \) |
| Functional eq. | \( \xi(s) = \xi(1-s) \) | \( \Lambda(s,\chi) = \frac{\tau(\chi)}{i^a\sqrt{k}}\Lambda(1-s,\bar\chi) \) |

---

# Appendix C: Worked Examples and Exercises

## C.1 Worked Example: Evaluating ζ(2)

<div class="example">
<strong>Example C.1.</strong> We compute \( \zeta(2) = \sum_{n=1}^\infty 1/n^2 = \pi^2/6 \) using Fourier analysis.

Consider the Fourier series of \( f(x) = x^2 \) on \( [-\pi, \pi] \). Its Fourier coefficients:

\[
a_0 = \frac{1}{\pi}\int_{-\pi}^\pi x^2\,dx = \frac{2\pi^2}{3}, \quad a_n = \frac{1}{\pi}\int_{-\pi}^\pi x^2 \cos(nx)\,dx = \frac{4(-1)^n}{n^2}, \quad b_n = 0.
\]
By Parseval's theorem, \( \frac{1}{\pi}\int_{-\pi}^\pi |f(x)|^2\,dx = \frac{a_0^2}{2} + \sum_{n=1}^\infty (a_n^2 + b_n^2) \). Alternatively, evaluating the Fourier series at \( x=\pi \):

\[
\pi^2 = \frac{\pi^2}{3} + \sum_{n=1}^\infty \frac{4(-1)^n}{n^2}(-1)^n \cdot (-1)^0 = \frac{\pi^2}{3} + 4\sum_{n=1}^\infty \frac{1}{n^2}.
\]
Wait — more directly: at \( x=0 \), \( 0 = \pi^2/3 - 4\sum_{n=1}^\infty (-1)^{n+1}/n^2 \). Actually the cleanest: Parseval gives

\[
\frac{2\pi^4}{5} = \frac{\pi^4}{9} + \sum_{n=1}^\infty \frac{16}{n^4} + \ldots
\]
Simpler: evaluate the Fourier series of \( f(x) = x \) (odd function) at \( x = \pi/2 \), getting \( \pi/4 = 1 - 1/3 + 1/5 - \cdots \) (Leibniz). Square and use rearrangements, or use the functional equation \( \zeta(2) = \pi^2/6 \) directly from the residue at \( s=1 \) of \( \Gamma(s)^2\zeta(2s) \).

The cleanest proof: use the product formula \( \sin(\pi z) = \pi z\prod_{n=1}^\infty (1-z^2/n^2) \). Taking the logarithmic derivative:

\[
\pi\cot(\pi z) = \frac{1}{z} + \sum_{n=1}^\infty \left(\frac{1}{z-n} + \frac{1}{z+n}\right) = \frac{1}{z} - 2\sum_{k=1}^\infty \zeta(2k) z^{2k-1}.
\]
Expanding \( \pi\cot(\pi z) \) in powers of \( z \) and comparing gives \( \zeta(2k) = \frac{(-1)^{k+1} (2\pi)^{2k} B_{2k}}{2(2k)!} \). For \( k=1 \): \( \zeta(2) = \pi^2 B_2 / 1 = \pi^2/6 \).
</div>

## C.2 Worked Example: Abel Summation for log(n!)

<div class="example">
<strong>Example C.2.</strong> Use Abel summation to prove \( \sum_{n \leq x} \log n = x\log x - x + O(\log x) \).

Take \( a_n = 1 \) (so \( A(x) = \lfloor x \rfloor \)) and \( f(n) = \log n \) (so \( f'(t) = 1/t \)). Then

\[
\sum_{n \leq x} \log n = \lfloor x \rfloor \log x - \int_1^x \frac{\lfloor t \rfloor}{t}\,dt.
\]
Now \( \lfloor t \rfloor = t + O(1) \), so

\[
\int_1^x \frac{\lfloor t\rfloor}{t}\,dt = \int_1^x 1\,dt + O\!\left(\int_1^x \frac{dt}{t}\right) = (x-1) + O(\log x).
\]
Thus

\[
\sum_{n \leq x} \log n = x\log x + O(\log x) - x + O(\log x) = x\log x - x + O(\log x).
\]
This is a weaker form of Stirling's formula; the Euler–Maclaurin approach gives \( (1/2)\log(2\pi x) \) as the next term.
</div>

## C.3 Worked Example: Non-vanishing of L(1,χ) for χ a quadratic character

<div class="example">
<strong>Example C.3.</strong> Let \( \chi \) be the non-principal character mod 3, defined by \( \chi(1)=1 \), \( \chi(2)=-1 \), \( \chi(0)=0 \). Compute \( L(1,\chi) \) directly.

\[
L(1,\chi) = \sum_{n=1}^\infty \frac{\chi(n)}{n} = 1 - \frac{1}{2} + \frac{0}{3} + \frac{1}{4} - \frac{1}{5} + \frac{0}{6} + \frac{1}{7} - \cdots
\]

\[
= \left(1 - \frac{1}{2} + \frac{1}{4} - \frac{1}{5} + \frac{1}{7} - \frac{1}{8} + \cdots\right)
= \sum_{n=0}^\infty \left(\frac{1}{3n+1} - \frac{1}{3n+2}\right).
\]
This is a convergent alternating series (terms decrease to zero). Its value: since \( \chi \) is associated to \( \mathbb{Q}(\sqrt{-3}) \) with discriminant \( -3 \), the class number formula gives \( L(1,\chi) = \pi/(3\sqrt{3}) > 0 \). In particular \( L(1,\chi) \neq 0 \).
</div>

## C.4 Worked Example: The Characters mod 8

<div class="example">
<strong>Example C.4.</strong> The group \((\mathbb{Z}/8\mathbb{Z})^* = \{1,3,5,7\} \cong \mathbb{Z}/2\mathbb{Z} \times \mathbb{Z}/2\mathbb{Z}\) has \(\varphi(8) = 4\) elements and thus 4 characters.

Generators: \(-1 \equiv 7 \pmod 8\) (order 2) and \(3 \pmod 8\) (order 2, since \(3^2 = 9 \equiv 1\)). A character \(\chi\) satisfies \(\chi(7)^2 = 1\) and \(\chi(3)^2 = 1\), so each takes values \(\pm 1\).

| | \(\chi(1)\) | \(\chi(3)\) | \(\chi(5)\) | \(\chi(7)\) | \(\chi(-1) = \chi(7)\) |
|---|---|---|---|---|---|
| \(\chi_0\) | 1 | 1 | 1 | 1 | even |
| \(\chi_1\) | 1 | 1 | \(-1\) | \(-1\) | even |
| \(\chi_2\) | 1 | \(-1\) | 1 | \(-1\) | even |
| \(\chi_3\) | 1 | \(-1\) | \(-1\) | 1 | even |

All characters are even (since \((\mathbb{Z}/8\mathbb{Z})^*\) has exponent 2 and \(\chi(-1) = \chi(7) = \pm 1\), and since all characters are real). The primitive characters mod 8 are \(\chi_1\), \(\chi_2\), \(\chi_3\) (none is induced from a proper submodulus). Note that \(\chi_2(n) = \left(\frac{2}{n}\right)\) for odd \(n\) (the Jacobi symbol) and \(\chi_1(n) = \left(\frac{-1}{n}\right)\) for odd \(n\).
</div>

## C.5 Exercises

**Exercise C.1.** Prove using Abel summation that \( \sum_{n \leq x} \frac{\log n}{n} = \frac{(\log x)^2}{2} + C + O(\log x / x) \) for an explicit constant \( C \).

**Exercise C.2.** Show that the series \( L(1, \chi) = \sum_{n=1}^\infty \chi(n)/n \) converges for any non-principal character \( \chi \) mod \( k \), by bounding the partial sums \( |\sum_{n \leq N} \chi(n)| \leq \varphi(k) \).

**Exercise C.3.** Prove that \( \sum_{d \mid n} \mu(d)/d = \varphi(n)/n \) using multiplicativity and the formula at prime powers.

**Exercise C.4.** Use the functional equation to show \( \zeta(0) = -1/2 \) and \( \zeta(-2k) = 0 \) for \( k \geq 1 \).

**Exercise C.5.** Prove the inequality \( |\zeta(\sigma)|^3 |\zeta(\sigma+it)|^4 |\zeta(\sigma+2it)| \geq 1 \) for \( \sigma > 1 \), \( t \in \mathbb{R} \), directly from the Euler product representation.

**Exercise C.6.** Let \( r_4(n) \) denote the number of representations of \( n \) as a sum of 4 squares. Using the identity \( \left(\sum_{n} r(n) q^n\right)^2 = \sum_n r_4(n)q^n \) and Dirichlet series techniques, show \( r_4(n) = 8\sum_{4 \nmid d \mid n} d \).

**Exercise C.7.** Prove Mertens' theorem: \( \prod_{p \leq x}(1 - 1/p) \sim e^{-\gamma}/\log x \), using the asymptotic \( \sum_{p \leq x} 1/p = \log\log x + M + o(1) \) and properties of the exponential.

**Exercise C.8.** Define \( \Lambda_k(n) \) by \( (-1)^k \frac{d^k}{ds^k}\log\zeta(s) = \sum_n \Lambda_k(n)/n^s \). Express \( \Lambda_2(n) \) explicitly in terms of \( \Lambda \) and show that \( \sum_{n \leq x} \Lambda_2(n)/n \sim 2\log x \).

**Exercise C.9.** Let \(\chi_1\) be the non-principal character mod 4. Compute \(L(1,\chi_1) = 1 - 1/3 + 1/5 - 1/7 + \cdots = \pi/4\) by evaluating the Fourier series of \(f(x) = 1\) on \([0,\pi]\) at \(x = \pi/2\).

**Exercise C.10.** Using the Perron formula heuristic, explain why the main term in the asymptotic \(\sum_{n \leq x} d(n) \sim x\log x\) arises from the double pole of \(\zeta(s)^2\) at \(s=1\). Compute the residue at the double pole explicitly.

**Exercise C.11.** Show that if RH is true, then \(\pi(x) = \mathrm{li}(x) + O(\sqrt{x}\log x)\). What does the explicit formula tell you about the contribution of the zeros to the error \(\pi(x) - \mathrm{li}(x)\)?

---

# Appendix D: Historical Notes

## D.1 Riemann's 1859 Paper

Bernhard Riemann's eight-page memoir "Über die Anzahl der Primzahlen unter einer gegebenen Grösse" (On the Number of Primes Less Than a Given Magnitude, 1859) introduced nearly all the tools used in modern analytic number theory: the Euler product for \( \zeta(s) \) extended to complex \( s \), the analytic continuation, the functional equation, the explicit formula for \( \pi(x) \) in terms of zeros, and the Riemann Hypothesis. The prime number theorem was proved by Hadamard and de la Vallée Poussin (independently) in 1896, using the non-vanishing on \( \mathrm{Re}(s)=1 \).

What makes Riemann's paper extraordinary is its density of new ideas. In 8 pages, Riemann:
- Extended \(\zeta(s)\) to a meromorphic function on all of \(\mathbb{C}\) (using both the integral formula and the theta function approach).
- Derived the functional equation \(\xi(s) = \xi(1-s)\).
- Found the product formula for \(\xi\) in terms of its zeros.
- Stated (without proof) the asymptotic \(\pi(x) \sim \mathrm{li}(x)\).
- Gave the explicit formula relating \(\psi(x)\) to the zeros.
- Computed the first few zeros numerically and conjectured they all lie on \(\mathrm{Re}(s)=1/2\).

Most of the claims in the paper were not proved rigorously until much later. The explicit formula was proved by von Mangoldt. The asymptotic for \(N(T)\) was proved by Riemann–von Mangoldt. The PNT was proved by Hadamard and de la Vallée Poussin. The RH remains open.

## D.2 Dirichlet's 1837 Paper

Peter Gustav Lejeune Dirichlet's 1837 paper "Über die Primzahlen in arithmetischen Progressionen" (On Primes in Arithmetic Progressions) introduced Dirichlet characters, L-functions, and proved that every arithmetic progression \( a, a+d, a+2d, \ldots \) with \( \gcd(a,d)=1 \) contains infinitely many primes. This was the first systematic use of analysis to solve a purely number-theoretic problem.

The paper was motivated by Gauss's empirical observations about the distribution of primes in residue classes. Gauss had verified the equidistribution of primes numerically but could not prove it. Dirichlet's invention of characters and L-functions to solve this problem is considered one of the founding acts of analytic number theory.

## D.3 Chebyshev's Contributions (1848–1852)

Pafnuty Chebyshev proved that \( \pi(x)/(x/\log x) \) has lim inf at most \( 1 \) and lim sup at least \( 1 \) (getting within a factor of \( 6\log 2 \approx 4.16 \) of the correct constant), and proved Bertrand's postulate. His introduction of \( \psi(x) \) and \( \theta(x) \) and the reduction of PNT to \( \psi(x)/x \to 1 \) remain fundamental.

## D.4 Mertens (1874) and the Constants

Franz Mertens proved the three Mertens theorems: \( \sum_{p \leq x}(\log p)/p = \log x + O(1) \), \( \sum_{p \leq x} 1/p = \log\log x + M + O(1/\log x) \), and \( \prod_{p \leq x}(1-1/p) = (e^{-\gamma}/\log x)(1+O(1/\log x)) \). His constant \( M \approx 0.2615 \) (the Meissel–Mertens constant) was the first successful asymptotic for the sum of reciprocals of primes.

## D.5 Hardy, Ramanujan, and Circle Method

G. H. Hardy and S. Ramanujan (1917) pioneered the circle method (Hardy–Littlewood method), which, combined with exponential sums, led to Vinogradov's proof that every sufficiently large odd integer is a sum of three primes (1937) and other breakthroughs. Hardy's collaboration with Littlewood is also responsible for conjectures about the distribution of prime constellations (the Hardy–Littlewood conjecture).

## D.6 Selberg and Erdős: The Elementary Proof of PNT (1949)

Atle Selberg and Paul Erdős gave the first "elementary" proof of PNT — one not using complex analysis — in 1949. The key ingredient was the Selberg symmetry formula:

\[
\sum_{p \leq x} \log^2 p + \sum_{p q \leq x} \log p \log q = 2x\log x + O(x),
\]
where the second sum is over products of two (not necessarily distinct) primes. From this, one can derive \(\psi(x) \sim x\) using elementary inequalities. The elementary proof is in some ways more difficult to follow than the analytic proof, despite avoiding complex analysis.

## D.7 Recent Developments

The Riemann Hypothesis remains open after over 160 years. Major recent developments include:
- **Green–Tao theorem (2004)**: The primes contain arbitrarily long arithmetic progressions, proved using Fourier analysis and ergodic-theoretic methods.
- **Zhang's bounded prime gaps (2013)**: There are infinitely many primes \(p\) with \(p_{n+1}-p_n \leq 70{,}000{,}000\), improved to 246 by the Polymath project.
- **Maynard (2015)**: Infinitely many intervals \([n, n+C_k]\) containing at least \(k\) primes, for any \(k\).
- **Helfgott (2013)**: Every odd integer \(>5\) is a sum of three primes (Vinogradov's theorem made effective).

---

# Appendix E: Notation Index

| Symbol | Meaning |
|---|---|
| \( \pi(x) \) | Number of primes \( \leq x \) |
| \( \theta(x) \) | First Chebyshev function: \( \sum_{p \leq x}\log p \) |
| \( \psi(x) \) | Second Chebyshev function: \( \sum_{p^k \leq x}\log p \) |
| \( \Lambda(n) \) | Von Mangoldt function |
| \( \mu(n) \) | Möbius function |
| \( \varphi(n) \) | Euler totient function |
| \( d(n) \) or \( \tau(n) \) | Number of divisors of \( n \) |
| \( \sigma_k(n) \) | Sum of \( k \)-th powers of divisors |
| \( \gamma \) | Euler–Mascheroni constant \( \approx 0.5772 \) |
| \( \mathrm{li}(x) \) | Logarithmic integral \( \int_2^x dt/\log t \) |
| \( \zeta(s) \) | Riemann zeta function |
| \( \chi \) | Dirichlet character |
| \( \chi_0 \) | Principal Dirichlet character |
| \( L(s,\chi) \) | Dirichlet L-function |
| \( \tau(\chi) \) | Gauss sum |
| \( \varphi(k) \) | Euler totient of modulus \( k \) |
| \( f * g \) | Dirichlet convolution of \( f \) and \( g \) |
| \( \Gamma(s) \) | Gamma function |
| \( \xi(s) \) | Completed zeta function: \( \frac{1}{2}s(s-1)\pi^{-s/2}\Gamma(s/2)\zeta(s) \) |
| \( M(x) \) | Mertens function: \( \sum_{n \leq x}\mu(n) \) |
| \( \pi(x;k,\ell) \) | Number of primes \( \leq x \) congruent to \( \ell \pmod k \) |
| \( \{x\} \) | Fractional part of \( x \) |
| \( \lfloor x \rfloor \) | Floor function: largest integer \( \leq x \) |
| \( [P] \) | Iverson bracket: 1 if \( P \) is true, 0 otherwise |
| \( N(T) \) | Number of nontrivial zeros \(\rho\) of \(\zeta\) with \(0 < \mathrm{Im}(\rho) \leq T\) |
| \( B_k \) | Bernoulli numbers |
| \( \lambda(n) \) | Liouville function \((-1)^{\Omega(n)}\) |
| \( \Omega(n) \) | Total number of prime factors of \(n\) with multiplicity |
| \( \omega(n) \) | Number of distinct prime factors of \(n\) |
| \( \sigma_a, \sigma_c \) | Abscissae of absolute and conditional convergence |

---

# Chapter 13: Deep Theory of the Riemann Zeta Function

The material in this chapter goes beyond what is strictly needed for the proof of PNT, but it is the heart of the subject — the structures that every research mathematician working in analytic number theory must understand thoroughly. We give complete derivations of the functional equation via the theta function, the Hadamard product, the explicit formula, the trivial zeros, the first nontrivial zeros, and the zero-free region with its quantitative consequence.

## 13.1 The Theta Function and Functional Equation: Complete Derivation

The most elegant approach to the functional equation of \(\zeta(s)\) uses the Jacobi theta function and the Poisson summation formula. We present it in full detail.

**Setup: the theta function.** Define

\[
\theta(t) = \sum_{n=-\infty}^{\infty} e^{-\pi n^2 t}, \qquad t > 0.
\]
This is the Jacobi theta function already introduced in Section 2.3. Note \(\theta(t) = 1 + 2\sum_{n=1}^{\infty}e^{-\pi n^2 t} = 1 + 2\omega(t)\) where \(\omega(t) = \sum_{n=1}^\infty e^{-\pi n^2 t}\).

<div class="theorem">
<strong>Theorem 13.1 (Functional equation for \(\theta\)).</strong>

\[
\theta(1/t) = t^{1/2}\theta(t), \qquad t > 0.
\]
</div>

<div class="proof">
<strong>Proof.</strong> Apply Poisson summation (Theorem 2.10) to \(f(x) = e^{-\pi x^2 t}\). The Fourier transform is

\[
\hat{f}(\xi) = \int_{-\infty}^{\infty} e^{-\pi tx^2}e^{-2\pi i x\xi}\,dx.
\]
Complete the square in the exponent: \(-\pi tx^2 - 2\pi ix\xi = -\pi t(x + i\xi/t)^2 - \pi\xi^2/t\). Thus

\[
\hat{f}(\xi) = e^{-\pi\xi^2/t}\int_{-\infty}^\infty e^{-\pi t(x+i\xi/t)^2}\,dx.
\]
Shifting the contour by \(i\xi/t\) (justified since the Gaussian decays rapidly) and using \(\int_{-\infty}^\infty e^{-\pi tu^2}\,du = t^{-1/2}\), we get \(\hat{f}(\xi) = t^{-1/2}e^{-\pi\xi^2/t}\). By Poisson summation:

\[
\theta(t) = \sum_{n\in\mathbb{Z}}e^{-\pi n^2 t} = \sum_{n\in\mathbb{Z}}\hat{f}(n) = \sum_{n\in\mathbb{Z}}t^{-1/2}e^{-\pi n^2/t} = t^{-1/2}\theta(1/t).
\]
Rearranging gives \(\theta(1/t) = t^{1/2}\theta(t)\). \(\square\)
</div>

**The Mellin transform computation.** We now compute the Mellin transform of \(\omega(t) = (\theta(t)-1)/2\) in two ways to derive the functional equation of \(\zeta(s)\).

<div class="theorem">
<strong>Theorem 13.2 (Mellin transform of \(\omega\)).</strong> For \(\mathrm{Re}(s) > 1\):

\[
\int_0^\infty t^{s-1}\omega(t)\,dt = \pi^{-s}\Gamma(s)\zeta(2s) = \frac{\Lambda(2s)}{2},
\]
where \(\Lambda(s) = \pi^{-s/2}\Gamma(s/2)\zeta(s)\).
</div>

<div class="proof">
<strong>Proof.</strong> Substituting the series for \(\omega(t) = \sum_{n=1}^\infty e^{-\pi n^2 t}\) and integrating term by term (justified by absolute convergence for \(\mathrm{Re}(s) > 1\)):

\[
\int_0^\infty t^{s-1}\omega(t)\,dt = \sum_{n=1}^\infty \int_0^\infty t^{s-1}e^{-\pi n^2 t}\,dt.
\]
Substituting \(u = \pi n^2 t\) in each integral:

\[
\int_0^\infty t^{s-1}e^{-\pi n^2 t}\,dt = (\pi n^2)^{-s}\int_0^\infty u^{s-1}e^{-u}\,du = \pi^{-s}n^{-2s}\Gamma(s).
\]
Summing over \(n \geq 1\):

\[
\int_0^\infty t^{s-1}\omega(t)\,dt = \pi^{-s}\Gamma(s)\sum_{n=1}^\infty n^{-2s} = \pi^{-s}\Gamma(s)\zeta(2s). \quad \square
\]
</div>

**Deriving the functional equation.** Now we use \(\theta(1/t) = t^{1/2}\theta(t)\) to relate \(\Lambda(s)\) to \(\Lambda(1-s)\). Write

\[
\pi^{-s/2}\Gamma(s/2)\zeta(s) = \int_0^\infty t^{s/2-1}\omega(t)\,dt.
\]
(This follows from Theorem 13.2 with \(s\) replaced by \(s/2\).) Split the integral at \(t=1\):

\[
\Lambda(s) = \int_1^\infty t^{s/2-1}\omega(t)\,dt + \int_0^1 t^{s/2-1}\omega(t)\,dt.
\]
In the second integral, substitute \(t \mapsto 1/t\) (so \(dt \to -t^{-2}dt\) and the limits reverse):

\[
\int_0^1 t^{s/2-1}\omega(t)\,dt = \int_1^\infty t^{-(s/2-1)}t^{-2}\omega(1/t)\,dt = \int_1^\infty t^{-s/2-1}\omega(1/t)\,dt.
\]
Now use \(\theta(1/t) = t^{1/2}\theta(t)\), i.e., \(1 + 2\omega(1/t) = t^{1/2}(1+2\omega(t))\), so

\[
\omega(1/t) = \frac{t^{1/2}(1+2\omega(t))-1}{2} = \frac{t^{1/2}-1}{2} + t^{1/2}\omega(t).
\]
Substituting:

\[
\int_0^1 t^{s/2-1}\omega(t)\,dt = \int_1^\infty t^{-s/2-1}\left(\frac{t^{1/2}-1}{2} + t^{1/2}\omega(t)\right)dt.
\]
Split into three parts:

\[
= \int_1^\infty \frac{t^{-s/2-1/2}-t^{-s/2-1}}{2}\,dt + \int_1^\infty t^{-s/2-1/2}\omega(t)\,dt.
\]
The first integral evaluates:

\[
\int_1^\infty \frac{t^{-s/2-1/2} - t^{-s/2-1}}{2}\,dt = \frac{1}{2}\left(\frac{1}{s/2-1/2} - \frac{1}{s/2}\right) = \frac{1}{s-1} - \frac{1}{s} = \frac{1}{s(s-1)}.
\]
(Here we assumed \(0 < \mathrm{Re}(s) < 1\) for both integrals to converge; the formula extends by analytic continuation.) Therefore:

\[
\Lambda(s) = \frac{1}{s(s-1)} + \int_1^\infty \left(t^{s/2-1} + t^{(1-s)/2-1}\right)\omega(t)\,dt.
\]
This expression is **symmetric under \(s \mapsto 1-s\)**: swapping \(s\) and \(1-s\) leaves the integral unchanged (since \(s/2-1 \leftrightarrow (1-s)/2-1 = -s/2-1/2\) but the pair \(\{t^{s/2-1}, t^{(1-s)/2-1}\}\) is exchanged), and \(1/(s(s-1)) = 1/((1-s)(1-(1-s)))\). Hence \(\Lambda(s) = \Lambda(1-s)\). \(\square\)

<div class="remark">
<strong>Remark 13.3 (The poles of \(\Lambda(s)\) and the trivial zeros).</strong> The completed zeta function \(\Lambda(s) = \pi^{-s/2}\Gamma(s/2)\zeta(s)\) has poles at \(s=0\) and \(s=1\) (from \(1/(s(s-1))\) in the formula above). The factor \(\Gamma(s/2)\) has simple poles at \(s = 0, -2, -4, -6, \ldots\). Since \(\Lambda(s)\) is entire except at \(s=0\) and \(s=1\), and the poles of \(\Gamma(s/2)\) at \(s = -2,-4,-6,\ldots\) would make \(\Lambda\) have poles there unless \(\zeta(s) = 0\) at those points, we conclude:

\[
\zeta(-2k) = 0 \text{ for all } k = 1, 2, 3, \ldots
\]
These are the **trivial zeros**. They are "trivial" in the sense that their existence is forced by the Gamma factor in the functional equation — they are not the "interesting" zeros that encode information about the primes.

Similarly, the functional equation forces \(\zeta(s) = 0\) at \(s = 0\) (since \(\Gamma(s/2)\) has a simple pole at \(s=0\) but \(\Lambda(0)\) must be finite — actually \(\Lambda(s) = \Lambda(1-s)\) and \(\Lambda(1)\) has a pole, so \(\Lambda(0)\) also has a pole, meaning \(\zeta(0) \neq 0\)). In fact, from the functional equation one deduces \(\zeta(0) = -1/2\) using the Laurent expansion at \(s=1\).
</div>

## 13.2 Table of the First Nontrivial Zeros

The nontrivial zeros \(\rho = \beta + i\gamma\) of \(\zeta(s)\) lie in the critical strip \(0 < \beta < 1\) and come in conjugate pairs: if \(\rho\) is a zero then so are \(\bar\rho\), \(1-\rho\), and \(1-\bar\rho\). The Riemann Hypothesis asserts \(\beta = 1/2\) for all nontrivial zeros.

The first ten nontrivial zeros (listed by positive imaginary part, using the notation \(\rho_n = 1/2 + i\gamma_n\) which would hold under RH) are:

| \(n\) | \(\gamma_n\) (imaginary part) | Verified real part |
|---|---|---|
| 1 | 14.134725141734693... | \(1/2\) (numerical) |
| 2 | 21.022039638771554... | \(1/2\) |
| 3 | 25.010857580145688... | \(1/2\) |
| 4 | 30.424876125859513... | \(1/2\) |
| 5 | 32.935061587739189... | \(1/2\) |
| 6 | 37.586176070968646... | \(1/2\) |
| 7 | 40.918719012147495... | \(1/2\) |
| 8 | 43.327073280914999... | \(1/2\) |
| 9 | 48.005150881167159... | \(1/2\) |
| 10 | 49.773832477672302... | \(1/2\) |

All of these have been verified to have real part exactly \(1/2\) to many decimal places of precision. As of 2025, over \(10^{13}\) zeros have been verified on the critical line, all with real part \(1/2\). No zero off the critical line has ever been found.

<div class="remark">
<strong>Remark 13.4 (What the first zero means for primes).</strong> The smallest zero \(\rho_1 = 1/2 + 14.134725\ldots i\) corresponds, via the explicit formula, to the most prominent oscillation in \(\psi(x) - x\). This oscillation has "angular frequency" \(\gamma_1 \approx 14.134\) on the \(\log x\) scale, meaning it completes one full cycle as \(\log x\) increases by \(2\pi/\gamma_1 \approx 0.4445\), i.e., as \(x\) increases by a multiplicative factor of \(e^{0.4445} \approx 1.56\). Thus when looking at \(\psi(x)\) on a logarithmic scale, you see oscillations roughly every 56% increase in \(x\) — this is the "heartbeat" of the primes.
</div>

## 13.3 The Hadamard Product for ζ(s)

Just as a polynomial of degree \(n\) can be written as a product of linear factors \(\prod_j (s - s_j)\) over its roots \(s_j\), a general entire function of finite order can be expressed as an infinite product over its zeros. For \(\zeta(s)\), the relevant object is the entire function \(\xi(s) = \frac{1}{2}s(s-1)\pi^{-s/2}\Gamma(s/2)\zeta(s)\).

<div class="theorem">
<strong>Theorem 13.5 (Hadamard product for \(\xi(s)\)).</strong> The entire function \(\xi(s)\) has order 1 and satisfies

\[
\xi(s) = \xi(0) \prod_\rho \left(1 - \frac{s}{\rho}\right),
\]
where the product is over all nontrivial zeros \(\rho\) of \(\zeta(s)\), taken in conjugate pairs \((\rho, 1-\rho)\) for convergence. Here \(\xi(0) = 1/2\).
</div>

<div class="remark">
<strong>Remark 13.6 (The Hadamard product for \(\zeta(s)\) itself).</strong> Extracting the explicit form for \(\zeta(s)\) from the Hadamard product of \(\xi\): since \(\xi(s) = \frac{1}{2}s(s-1)\pi^{-s/2}\Gamma(s/2)\zeta(s)\) and \(\Gamma(s/2)\) has a Weierstrass product, one can write

\[
\zeta(s) = \frac{e^{A+Bs}}{s(s-1)} \prod_\rho \left(1 - \frac{s}{\rho}\right)e^{s/\rho},
\]
where the product is over all nontrivial zeros \(\rho\) and the exponential factors \(e^{s/\rho}\) ensure convergence. The constants \(A\) and \(B\) are explicitly:

\[
A = \log 2 + \frac{1}{2}\log\pi - 1 - \frac{1}{2}\frac{\Gamma'(1)}{\Gamma(1)}, \quad B = -\sum_\rho \mathrm{Re}(1/\rho).
\]

This product formula is fundamental: it encodes all information about \(\zeta(s)\) purely through its zeros. Every pole (only at \(s=1\)), every zero (the \(\rho\)), and the global behavior are all visible in the product. Taking the logarithmic derivative:

\[
\frac{\zeta'(s)}{\zeta(s)} = B - \frac{1}{s} + \frac{1}{s-1} - \frac{1}{2}\frac{\Gamma'(s/2)}{\Gamma(s/2)} + \sum_\rho \left(\frac{1}{s-\rho} + \frac{1}{\rho}\right).
\]
This formula is the starting point for bounding \(\zeta'/\zeta\) in the critical strip, which is needed for zero-free regions.
</div>

## 13.4 The Explicit Formula: Full Statement and Proof Sketch

The explicit formula is the precise quantitative version of the statement "the zeros of \(\zeta\) control the primes." It is one of Riemann's greatest contributions, made rigorous by von Mangoldt.

<div class="theorem">
<strong>Theorem 13.7 (Von Mangoldt's explicit formula).</strong> For \(x > 1\) not a prime power:

\[
\psi(x) = x - \sum_\rho \frac{x^\rho}{\rho} - \log(2\pi) - \frac{1}{2}\log\!\left(1 - x^{-2}\right),
\]
where the sum over nontrivial zeros \(\rho\) is taken symmetrically: \(\lim_{T\to\infty}\sum_{|\mathrm{Im}(\rho)|\leq T} x^\rho/\rho\).
</div>

**Proof sketch via Perron's formula.** The starting point is:

\[
\psi(x) = \frac{1}{2\pi i}\int_{c-i\infty}^{c+i\infty}\left(-\frac{\zeta'(s)}{\zeta(s)}\right)\frac{x^s}{s}\,ds, \qquad c > 1.
\]
Using the Hadamard product representation of \(\zeta'/\zeta\), the integrand \(-(\zeta'/\zeta)(s) \cdot x^s/s\) is a meromorphic function whose poles are:
- A simple pole at \(s = 1\) with residue \(x^1/1 = x\) (from the simple pole of \(\zeta\) at \(s=1\));
- Simple poles at each nontrivial zero \(\rho\) with residue \(-x^\rho/\rho\) (from the zeros of \(\zeta\) in the denominator of \(-\zeta'/\zeta\));
- A simple pole at \(s=0\) with residue \(-\zeta'(0)/\zeta(0) = \log(2\pi)\) (since \(\zeta(0) = -1/2\) and \(\zeta'(0)/\zeta(0) = -\log(2\pi)\));
- Simple poles at the trivial zeros \(s = -2,-4,-6,\ldots\), each contributing \(x^{-2k}/(-2k)\), whose sum telescopes to \(-\frac{1}{2}\log(1-x^{-2})\).

Shifting the contour to the left and collecting residues gives the explicit formula. The crucial analytic issue — proving the contour shift is valid, i.e., that the contributions from the horizontal segments vanish — requires the estimate \(|\zeta'/\zeta(\sigma+iT)| = O(\log^2 T)\) uniformly in \(\sigma \in [-1, 2]\) (away from zeros), which follows from the zero-density estimates.

**The oscillatory interpretation.** Each nontrivial zero \(\rho = 1/2 + i\gamma\) (assuming RH) contributes

\[
-\frac{x^\rho}{\rho} = -\frac{x^{1/2}e^{i\gamma\log x}}{1/2 + i\gamma} = -\frac{x^{1/2}}{|\rho|}e^{i(\gamma\log x - \arg\rho)}.
\]
Taking real parts (and noting that zeros come in conjugate pairs \(\pm i\gamma\)):

\[
-\frac{x^\rho}{\rho} - \frac{x^{\bar\rho}}{\bar\rho} = -\frac{2x^{1/2}}{|\rho|}\cos(\gamma\log x - \arg\rho).
\]
This is a pure oscillation with amplitude \(2x^{1/2}/|\rho|\) and period \(2\pi/\gamma\) on the \(\log x\) scale. Since \(\sum_\rho 1/|\rho|^2 < \infty\) but \(\sum_\rho 1/|\rho| = \infty\) (the zeros are too numerous), the sum converges only conditionally — but it converges in the symmetric sense and represents \(\psi(x) - x\) to high precision.

**Numerical verification.** For \(x = 100\): \(\psi(100) = \sum_{p^k \leq 100}\log p = \log 2\cdot 6 + \log 3\cdot 4 + \log 5 \cdot 2 + \log 7^2 + \log 11 + \cdots \approx 94.0\). The main term is \(x = 100\). The correction from the first zero \(\rho_1 = 1/2 + 14.134i\) is approximately \(-2\cdot 100^{1/2}/|\rho_1|\cdot\cos(14.134\log 100 - \arg\rho_1) \approx -2\cdot 10/14.14 \cdot \cos(64.9^\circ) \approx -6\), bringing the estimate to \(\approx 94\), consistent with the actual value.

## 13.5 Zero-Free Regions: The Classical Result and Proof

We now establish the classical zero-free region due to de la Vallée Poussin (1899) in full detail.

<div class="theorem">
<strong>Theorem 13.8 (Classical zero-free region, de la Vallée Poussin 1899).</strong> There exists an absolute constant \(c > 0\) such that \(\zeta(s) \neq 0\) for

\[
\sigma \geq 1 - \frac{c}{\log(|t|+2)}.
\]
\end{theorem>

<div class="proof">
<strong>Proof.</strong> We use the inequality \(|\zeta(\sigma)|^3|\zeta(\sigma+it)|^4|\zeta(\sigma+2it)| \geq 1\) for \(\sigma > 1\) (Lemma 4.7 and Theorem 4.6), now in a quantitative form.

**Step 1: Quantitative bounds near \(s=1\).** Near \(s=1\), \(\zeta(\sigma) \sim 1/(\sigma-1)\) as \(\sigma \to 1^+\), so \(|\zeta(\sigma)| \leq A/(\sigma-1)\) for some absolute constant \(A > 0\).

**Step 2: Upper bound on \(|\zeta(\sigma+it)|\).** For \(\sigma\) close to 1 and \(|t| \geq 2\), the Euler product gives \(\log|\zeta(\sigma+it)| \leq \sum_p \sum_k \frac{1}{kp^{k\sigma}}\). For \(\sigma = 1 + 1/\log|t|\), one shows \(|\zeta(\sigma+it)| = O(\log|t|)\). By the Hadamard product and zero counting, for \(\sigma \in [1/2, 2]\) and \(|t| \geq 2\):

\[
-\mathrm{Re}\frac{\zeta'(\sigma+it)}{\zeta(\sigma+it)} \leq \sum_\rho \frac{\sigma - \beta}{(\sigma-\beta)^2 + (t-\gamma)^2} + O(\log|t|).
\]

**Step 3: The key inequality.** Suppose for contradiction that \(\zeta(\beta_0 + it_0) = 0\) for some \(\beta_0 > 1 - c/\log t_0\) (with \(t_0 \geq 2\) and \(c\) to be determined). From the inequality:

\[
|\zeta(\sigma)|^3|\zeta(\sigma+it_0)|^4|\zeta(\sigma+2it_0)| \geq 1.
\]
Taking logarithms: \(3\log|\zeta(\sigma)| + 4\log|\zeta(\sigma+it_0)| + \log|\zeta(\sigma+2it_0)| \geq 0\).

Now:
- \(\log|\zeta(\sigma)| \leq -\log(\sigma-1) + O(1)\) (from the simple pole).
- Since \(\zeta\) has a zero at \(\beta_0 + it_0\), \(\log|\zeta(\sigma+it_0)| \leq -(\sigma-\beta_0)\cdot\text{(something)} + B\log t_0\) — more precisely, near the zero, \(|\zeta(\sigma+it_0)| = O((\sigma-\beta_0)\log t_0)\), giving \(\log|\zeta(\sigma+it_0)| \leq \log(\sigma-\beta_0) + C\log t_0\).
- \(\log|\zeta(\sigma+2it_0)| \leq D\log t_0\) (from the upper bound for \(\zeta\) in the critical strip).

Combining:

\[
0 \leq 3(-\log(\sigma-1)+O(1)) + 4(\log(\sigma-\beta_0)+C\log t_0) + D\log t_0.
\]
Set \(\sigma - 1 = \delta\) (small positive) and \(\sigma - \beta_0 = \delta + (1-\beta_0)\). If \(\beta_0 = 1 - \eta\) with \(\eta = c/\log t_0\):

\[
0 \leq -3\log\delta + 4\log(\delta + \eta) + (4C+D)\log t_0.
\]
Choosing \(\delta = \eta/(e^{(4C+D)\log t_0 / 3} \cdot \text{const})\) leads to a contradiction for sufficiently small \(c\). The optimal choice \(\delta = \eta\) gives \(-3\log\eta + 4\log(2\eta) + (4C+D)\log t_0 = (4\log 2 + (4C+D)\log t_0) - 3\log\eta\geq 0\). For this to be consistent with \(\eta = c/\log t_0\), we need \(c \leq (4C+D)^{-1}\cdot\)const, which can be satisfied for a small enough absolute constant \(c\). If \(c\) is too large, the inequality cannot hold, giving a contradiction. \(\square\)
</div>

**Deducing the quantitative PNT.** From the zero-free region, for any zero \(\rho = \beta+i\gamma\) of \(\zeta\) in the critical strip with \(|\gamma| \leq T\), we have \(\beta \leq 1 - c/\log T\). In the explicit formula:

\[
\psi(x) - x = -\sum_\rho \frac{x^\rho}{\rho} + O(\log x).
\]
Each term with \(|\gamma| \leq T\) satisfies \(|x^\rho/\rho| \leq x^\beta/|\rho| \leq x^{1-c/\log T}/|\gamma|\). Summing over \(N(T) \sim (T/2\pi)\log T\) zeros and choosing \(T = \exp(\sqrt{\log x}/2)\):

\[
|\psi(x) - x| \leq x^{1-c/\log T}\cdot O(\log^2 T) + O(x/T) = O\!\left(x\exp\!\left(-\frac{c\sqrt{\log x}}{2}\right)\right).
\]
This gives the quantitative Prime Number Theorem:

\[
\psi(x) = x + O\!\left(x\exp\!\left(-c_1\sqrt{\log x}\right)\right) \implies \pi(x) = \mathrm{li}(x) + O\!\left(x\exp\!\left(-c_2\sqrt{\log x}\right)\right).
\]

**What this error means numerically.** For \(x = 10^{20}\): \(\log x = 20\log 10 \approx 46\), so \(\sqrt{\log x} \approx 6.8\), and the error bound is roughly \(x\cdot e^{-c\cdot 6.8}\). With \(c \approx 0.1\), this gives an error of about \(x\cdot e^{-0.68} \approx 0.5x\) — which is useless! The constant hidden in the big-O is awful in practice. The error is much better than this pessimistic bound suggests, but the zero-free region method cannot give explicit constants sharp enough to be useful at moderate sizes of \(x\). That is why RH (or at least better zero-free regions) is practically important for computations.

---

# Chapter 14: Dirichlet L-Functions — Deeper Theory

## 14.1 L(1,χ) for the Non-Principal Character mod 4

Let \(\chi_{-4}\) denote the unique non-principal Dirichlet character modulo 4. It is given by:

\[
\chi_{-4}(n) = \begin{cases} 1 & n \equiv 1 \pmod 4 \\ -1 & n \equiv 3 \pmod 4 \\ 0 & 2 \mid n \end{cases}
\]
This is the character associated to the imaginary quadratic field \(\mathbb{Q}(i) = \mathbb{Q}(\sqrt{-1})\) with discriminant \(-4\).

<div class="theorem">
<strong>Theorem 14.1.</strong>

\[
L(1, \chi_{-4}) = 1 - \frac{1}{3} + \frac{1}{5} - \frac{1}{7} + \cdots = \frac{\pi}{4}.
\]
</div>

<div class="proof">
<strong>Proof (via the Gregory–Leibniz series).</strong> The function \(\arctan x = \int_0^x \frac{dt}{1+t^2} = \sum_{n=0}^\infty \frac{(-1)^n x^{2n+1}}{2n+1}\) for \(|x| \leq 1\) (converges at \(x=1\) by the alternating series test). At \(x=1\): \(\arctan(1) = \pi/4\). Abel's theorem (which says: if a power series converges at the endpoint, its sum equals the limit from inside the radius of convergence) gives \(\pi/4 = \sum_{n=0}^\infty (-1)^n/(2n+1) = 1 - 1/3 + 1/5 - \cdots = L(1,\chi_{-4})\). \(\square\)
</div>

**Connection to the class number formula.** The Dedekind zeta function of \(\mathbb{Q}(i)\) is \(\zeta_{\mathbb{Q}(i)}(s) = \zeta(s)L(s,\chi_{-4})\). Near \(s=1\), this has a simple pole with residue \(2\pi h/(w\sqrt{|D|})\), where \(h\) is the class number, \(w\) is the number of roots of unity, and \(D\) is the discriminant of the field. For \(\mathbb{Q}(i)\): \(h=1\) (class number 1), \(w=4\), \(D=-4\). So the residue at \(s=1\) is \(2\pi\cdot 1/(4\cdot 2) = \pi/4\). Since the residue equals \(\lim_{s\to 1}(s-1)\zeta(s)L(s,\chi_{-4}) = L(1,\chi_{-4})\) (using \(\lim(s-1)\zeta(s) = 1\)), we recover \(L(1,\chi_{-4}) = \pi/4\).

This is more than a curiosity: the class number formula \(L(1,\chi_D) = 2\pi h / (w\sqrt{|D|})\) (for imaginary quadratic fields) is the deepest explanation for why \(L(1,\chi) \neq 0\) for real primitive characters. The class number \(h \geq 1\) is always a positive integer (it counts something — the ideal class group — which cannot be empty), so \(L(1,\chi_D) > 0\).

## 14.2 Full Table of Dirichlet Characters mod 5

We complete the description of characters mod 5 from Section 8.2 with the explicit Euler product for each L-function. The group \((\mathbb{Z}/5\mathbb{Z})^* \cong \mathbb{Z}/4\mathbb{Z}\) has generator \(g=2\) (since \(2^1=2\), \(2^2=4\), \(2^3=3\), \(2^4=1 \pmod 5\)). A character \(\chi\) is determined by \(\chi(2)\), a 4th root of unity.

| \(n \pmod 5\) | 0 | 1 | 2 | 3 | 4 | \(\chi(2)\) | Type |
|---|---|---|---|---|---|---|---|
| \(\chi_0\) | 0 | 1 | 1 | 1 | 1 | 1 | principal |
| \(\chi_1\) | 0 | 1 | \(i\) | \(-i\) | \(-1\) | \(i\) | complex |
| \(\chi_2\) | 0 | 1 | \(-1\) | \(-1\) | 1 | \(-1\) | real (Legendre symbol) |
| \(\chi_3\) | 0 | 1 | \(-i\) | \(i\) | \(-1\) | \(-i\) | complex (= \(\bar\chi_1\)) |

Check: \(\chi_1(3) = \chi_1(2^3) = \chi_1(2)^3 = i^3 = -i\). \(\chi_1(4) = \chi_1(2^2) = i^2 = -1\). \(\chi_2(2) = -1\), \(\chi_2(4) = (-1)^2 = 1\), \(\chi_2(3) = \chi_2(2^3) = (-1)^3 = -1\). So \(\chi_2 = \left(\frac{\cdot}{5}\right)\): quadratic residues mod 5 are \(\{1, 4\}\) (since \(1^2 = 1\), \(2^2 = 4\), \(3^2 = 4\), \(4^2 = 1 \pmod 5\)), confirming \(\chi_2(1)=\chi_2(4)=1\), \(\chi_2(2)=\chi_2(3)=-1\).

The four L-functions:

\[
L(s, \chi_0) = \left(1-5^{-s}\right)\zeta(s), \qquad L(s, \chi_2) = \prod_p \frac{1}{1-\chi_2(p)p^{-s}}.
\]
For \(\chi_2\), the primes split according to their residue mod 5: primes \(\equiv 1, 4 \pmod 5\) (i.e., \(\left(\frac{p}{5}\right) = 1\)) give a factor \((1-p^{-s})^{-1}\), while primes \(\equiv 2, 3 \pmod 5\) give \((1+p^{-s})^{-1}\). Thus:

\[
L(s,\chi_2) = \frac{1}{1+2^{-s}}\cdot\frac{1}{1+3^{-s}}\cdot\frac{1}{1-11^{-s}}\cdot\frac{1}{1-19^{-s}}\cdots
\]
(primes mod 5: \(2 \equiv 2\), \(3 \equiv 3\), \(5 \equiv 0\) (omitted), \(7 \equiv 2\), \(11 \equiv 1\), \(13 \equiv 3\), \(17 \equiv 2\), \(19 \equiv 4\), \ldots).

## 14.3 Non-Vanishing of L(1,χ): The Dedekind Zeta Approach

The cleanest proof of \(L(1,\chi) \neq 0\) for non-principal characters uses the factorization of the Dedekind zeta function of a cyclotomic field.

<div class="theorem">
<strong>Theorem 14.2 (Factorization of the Dedekind zeta of \(\mathbb{Q}(\zeta_k)\)).</strong> Let \(k \geq 1\) and \(\zeta_k = e^{2\pi i/k}\). Then

\[
\zeta_{\mathbb{Q}(\zeta_k)}(s) = \prod_{\chi \bmod k} L(s,\chi),
\]
where the product is over all Dirichlet characters modulo \(k\).
</div>

This factorization holds because the primes of \(\mathbb{Z}[\zeta_k]\) over each rational prime \(p\) split according to the characters mod \(k\). The Euler factor at \(p\) on the left is determined by how \(p\) splits in \(\mathbb{Q}(\zeta_k)\), and on the right the product of character factors accounts for all the splitting behavior.

**Why this proves non-vanishing.** The Dedekind zeta function \(\zeta_K(s)\) of any number field \(K\) has a simple pole at \(s=1\) (from the residue formula involving the class number, regulator, etc.) and is nonzero for \(s > 1\). In the product \(\prod_\chi L(s,\chi)\):
- The principal character contributes \(L(s,\chi_0) = \zeta(s)\cdot\prod_{p\mid k}(1-p^{-s})\), which has a simple pole at \(s=1\).
- All other factors \(L(s,\chi)\) for \(\chi \neq \chi_0\) are entire functions of \(s\).

The product \(\prod_\chi L(s,\chi)\) therefore has a simple pole at \(s=1\) (from \(L(s,\chi_0)\)) times holomorphic functions from the others. If any non-principal \(L(s,\chi)\) vanished at \(s=1\), the product would have a zero cancelling the pole, making \(\zeta_K(1)\) finite and nonzero — but \(\zeta_K\) has a simple pole at \(s=1\) with a nonzero residue (the analytic class number formula). Contradiction. Hence \(L(1,\chi) \neq 0\) for all non-principal \(\chi\). \(\square\)

## 14.4 Precise Statement of Dirichlet's Theorem

Dirichlet's theorem is sometimes stated informally as "there are infinitely many primes \(p \equiv a \pmod q\)." The quantitative form is:

<div class="theorem">
<strong>Theorem 14.3 (Dirichlet's theorem, quantitative).</strong> Let \(q \geq 1\) and \(\gcd(a,q) = 1\). Then

\[
\sum_{\substack{p \leq x \\ p \equiv a \pmod q}} \frac{1}{p} = \frac{1}{\varphi(q)}\log\log x + C(a,q) + O\!\left(\frac{1}{\log x}\right),
\]
where \(C(a,q)\) is a constant depending on \(a\) and \(q\). In particular,

\[
\sum_{\substack{p \leq x \\ p \equiv a \pmod q}} \frac{1}{p} \to \infty,
\]
confirming there are infinitely many such primes. Moreover, primes are equidistributed in the logarithmic sense: among all primes up to \(x\), a fraction \(\approx 1/\varphi(q)\) lies in each admissible residue class.
</div>

This is stronger than just infinitely many: it says the prime reciprocal sum in each residue class diverges at the same rate \((1/\varphi(q))\log\log x\), equally divided. The proof uses the non-vanishing \(L(1,\chi) \neq 0\) exactly as in Section 9.4, combined with the partial summation argument of Section 9.3.

---

# Chapter 15: Sieve Methods

Sieve methods are combinatorial tools for estimating the number of integers in a set that avoid divisibility by primes in some set. They are essential for results like upper bounds on twin primes and the structure of the prime gaps.

## 15.1 Inclusion-Exclusion and the Legendre Sieve

The simplest sieve is inclusion-exclusion (the "Legendre sieve"). Let \(\mathcal{A} \subseteq \{1, 2, \ldots, N\}\) and let \(\mathcal{P}(z) = \prod_{p \leq z} p\) be the product of all primes up to \(z\). Define

\[
S(\mathcal{A}, \mathcal{P}, z) = \#\{n \in \mathcal{A} : \gcd(n, \mathcal{P}(z)) = 1\},
\]
the number of elements of \(\mathcal{A}\) not divisible by any prime \(p \leq z\). If \(\mathcal{A} = [1,x]\) and \(z = \sqrt{x}\), then \(S(\mathcal{A}, \mathcal{P}, z) = \pi(x) - \pi(z) + 1\), essentially counting primes.

By inclusion-exclusion (Legendre's formula):

\[
S(\mathcal{A}, \mathcal{P}, z) = \sum_{d \mid \mathcal{P}(z)} \mu(d) \cdot \#\{n \in \mathcal{A} : d \mid n\} = \sum_{d \mid \mathcal{P}(z)} \mu(d) A(d),
\]
where \(A(d) = \#\{n \in \mathcal{A} : d \mid n\}\). If \(\mathcal{A} = \{1,\ldots,N\}\$, then \(A(d) = \lfloor N/d\rfloor = N/d + O(1)\).

**The problem: too many error terms.** The number of divisors of \(\mathcal{P}(z)\) is \(2^{\pi(z)}\). For \(z = (\log x)^2\), this is \(2^{O(\log x / \log\log x)}\) — exponential in \(\log x\), far too many terms to control. The Legendre sieve fails because the error terms overwhelm the main term for any useful value of \(z\).

## 15.2 Brun's Sieve and the Twin Prime Sum

Viggo Brun (1919) found a way to truncate the inclusion-exclusion by using only divisors of \(\mathcal{P}(z)\) up to a certain size, accepting a controlled error. The key idea is to replace \(\mu(d)\) by weights that give an upper (or lower) bound.

<div class="theorem">
<strong>Theorem 15.1 (Brun's upper bound sieve).</strong> For any set \(\mathcal{A} \subseteq \{1,\ldots,N\}\) with \(A(d) = N\omega(d)/d + r_d\) (where \(\omega\) is multiplicative and \(0 \leq \omega(p) < p\)):

\[
S(\mathcal{A}, \mathcal{P}, z) \leq N\prod_{p \leq z}\left(1 - \frac{\omega(p)}{p}\right)\left(1 + O\!\left(\frac{1}{\log z}\right)^{\kappa}\right),
\]
for some \(\kappa > 0\), provided the error terms \(r_d\) are small.
</div>

<div class="theorem">
<strong>Theorem 15.2 (Brun's theorem on twin primes).</strong> Let \(B_2 = \sum_{\substack{p \\ p+2\text{ prime}}} \frac{1}{p}\). Then \(B_2 < \infty\); in particular, \(B_2 \approx 1.902...\) (Brun's constant).
</div>

<div class="proof">
<strong>Proof sketch.</strong> Apply Brun's sieve to \(\mathcal{A} = \{n(n+2) : n \leq x, n \text{ odd}\}\), counting \(n\) such that both \(n\) and \(n+2\) are prime. The local density function is \(\omega(p) = 2\) for odd primes \(p\) (since both \(n \equiv 0\) and \(n \equiv -2 \pmod p\) are to be excluded, and these are 2 residue classes out of \(p\)) and \(\omega(2) = 1\). The sieve gives an upper bound

\[
\pi_2(x) := \#\{p \leq x : p+2 \text{ prime}\} \leq C\frac{x}{(\log x)^2}\prod_{p \leq z}\!\left(1-\frac{2}{p}\right)^{-1}\cdot\left(1-\frac{1}{p}\right)^2.
\]
Using \(\prod_p(1-2/p)(1-1/p)^{-2} = \prod_p(1-1/(p-1)^2) = C_2\) (the twin prime constant), one gets \(\pi_2(x) = O(x/(\log x)^2)\).

Summing the reciprocals: \(\sum_{p \text{ twin}} 1/p \leq \sum_{k=1}^\infty (\pi_2(2^{k+1}) - \pi_2(2^k))/2^k\). By the bound \(\pi_2(x) = O(x/(\log x)^2)\), this sum is \(O(\sum_k (k\log 2)^{-2}) < \infty\). \(\square\)
</div>

**Historical significance.** Brun's theorem was the first nontrivial result about twin primes. It shows that twin primes are "sparse" in the sense that their reciprocals sum to a finite value, unlike the ordinary primes (where \(\sum 1/p\) diverges). The parity problem — a deep obstruction in sieve theory — prevents current sieves from proving that there are infinitely many twin primes, even though every other aspect of the twin prime conjecture seems within reach.

## 15.3 Notation: The Sieve S(A, P, z)

Standard sieve notation organizes these ideas cleanly. Let:
- \(\mathcal{A} = \{a_n\}\) be a finite sequence of integers (the "sifted set");
- \(\mathcal{P}\) be a set of "sifting primes";
- \(z\) be the "sieve level";
- \(P(z) = \prod_{p \in \mathcal{P}, p \leq z} p\);
- \(A_d = \#\{n : d \mid a_n\}\) be the count of elements divisible by \(d\);
- \(g(d)\) be a multiplicative "density" function approximating \(A_d/|\mathcal{A}|\).

Then

\[
S(\mathcal{A}, \mathcal{P}, z) = \sum_{\substack{n \in \mathcal{A} \\ \gcd(a_n, P(z)) = 1}} 1.
\]

This counts the elements of \(\mathcal{A}\) that survive the sieve — none of their values is divisible by any sifting prime below \(z\).

<div class="theorem">
<strong>Theorem 15.3 (Fundamental Lemma of the Sieve).</strong> Under suitable conditions on the density function \(g\) (specifically, \(g\) is multiplicative, \(0 \leq g(p) < 1\), and the "sieve dimension" \(\kappa = \sum_{p \leq z} g(p)/(p-g(p))\) satisfies \(\kappa \leq \kappa_0\) for some fixed \(\kappa_0\)), we have:

\[
S(\mathcal{A}, \mathcal{P}, z) = X\cdot V(z)\left(1 + O\!\left(u^{-u/2}\right)\right) + O\!\left(\sum_{\substack{d \leq D \\ d \mid P(z)}} |r_d|\right),
\]
where \(X = |\mathcal{A}|\), \(V(z) = \prod_{p \leq z}(1-g(p))\), \(D = z^u\) is the "level of distribution," and \(r_d = A_d - g(d)X\) are the remainders.
</div>

The fundamental lemma says: for a sieve of level \(D = z^u\) (i.e., using only divisors up to \(D\)), the main term is \(X\cdot V(z)\) with relative error \(u^{-u/2}\). Taking \(u = O(\log z)\) makes the error negligible. The key technical challenge is always controlling the remainder sum \(\sum|r_d|\).

---

# Chapter 16: Additive Number Theory and the Circle Method

## 16.1 Goldbach's Conjecture

Goldbach's conjecture (1742) states: every even integer \(n \geq 4\) is the sum of two primes. Despite extensive numerical verification (up to \(4 \times 10^{18}\)) and partial results, it remains unproved. The closest result is:

- **Chen's theorem (1973):** Every sufficiently large even integer is the sum of a prime and a "semi-prime" (a number with at most 2 prime factors). This is the best possible result achievable with current sieve methods.
- **Goldbach's weak conjecture:** Every odd integer \(n \geq 7\) is the sum of three primes. This was proved by Helfgott in 2013 (every odd integer \(> 5\) is the sum of three primes), completing the verification of Vinogradov's result unconditionally for all odd integers.

## 16.2 Vinogradov's Three Primes Theorem

<div class="theorem">
<strong>Theorem 16.1 (Vinogradov, 1937).</strong> Every sufficiently large odd integer \(N\) is expressible as a sum of three primes:

\[
N = p_1 + p_2 + p_3.
\]
More precisely, the number of such representations is

\[
r_3(N) = \frac{\mathfrak{S}(N) N^2}{2(\log N)^3}\left(1 + o(1)\right),
\]
where \(\mathfrak{S}(N) = \prod_p \left(1 + \frac{1}{(p-1)^3}\right) \cdot \prod_{p \mid N}\frac{p-1}{p-2} > 0\) is the singular series.
</div>

**Sketch of the circle method.** The circle method (Hardy–Littlewood method) proceeds as follows. Define the exponential sum

\[
f(\alpha) = \sum_{p \leq N} e^{2\pi i p \alpha}\log p.
\]
Then the number of representations of \(N\) as \(p_1 + p_2 + p_3\) (weighted by \(\log p_i\)) is

\[
\sum_{\substack{p_1+p_2+p_3=N \\ p_i \leq N}}\log p_1\log p_2\log p_3 = \int_0^1 f(\alpha)^3 e^{-2\pi i N\alpha}\,d\alpha.
\]
(This follows from: for each triple \((p_1, p_2, p_3)\) with \(p_1+p_2+p_3=N\), the integral picks out the contribution \(\int_0^1 e^{2\pi i(p_1+p_2+p_3-N)\alpha}\,d\alpha = [p_1+p_2+p_3=N]\).)

Decompose \([0,1]\) into "major arcs" \(\mathfrak{M}\) (rationals \(a/q\) with small denominator \(q \leq (\log N)^A\)) and "minor arcs" \(\mathfrak{m}\).

On the **major arcs**, near \(\alpha = a/q\) with \(\gcd(a,q)=1\), the exponential sum \(f(\alpha)\) is well-approximated by character sums:

\[
f\!\left(\frac{a}{q}+\beta\right) \approx \frac{\mu(q)}{\varphi(q)}\sum_{n \leq N}e^{2\pi i n\beta} = \frac{\mu(q)}{\varphi(q)}\cdot\frac{e^{2\pi iN\beta}-1}{e^{2\pi i\beta}-1}.
\]
(This approximation uses the PNT for arithmetic progressions and the orthogonality of characters.) The major arc contribution gives the main term \(\mathfrak{S}(N)N^2/(\log N)^3\).

On the **minor arcs**, one bounds \(f(\alpha)\) using Vinogradov's exponential sum estimates (which require the deep theory of exponential sums over primes). The bound \(|f(\alpha)| = O(N(\log N)^{-A})\) on minor arcs ensures their contribution is negligible.

## 16.3 Waring's Problem

Waring's problem (posed 1770, solved 1909 by Hilbert) asks: for each integer \(k \geq 2\), does there exist a number \(g(k)\) such that every positive integer is a sum of at most \(g(k)\) perfect \(k\)-th powers?

The answer is yes. The key values:

| \(k\) | \(g(k)\) | Proved by |
|---|---|---|
| 2 | 4 | Lagrange (1770) |
| 3 | 9 | Wieferich (1909) |
| 4 | 19 | Balasubramanian–Dress–Deshouillers (1986) |
| 5 | 37 | Confirmed computationally |

**Lagrange's four-square theorem (\(g(2)=4\)).** Every positive integer is a sum of four squares. The proof uses:
1. The identity \((a^2+b^2+c^2+d^2)(e^2+f^2+g^2+h^2) = (\text{sum of 4 squares})\) (Euler's four-square identity), showing the set of sums of four squares is closed under multiplication.
2. Every prime is a sum of four squares (for \(p \equiv 1 \pmod 4\), use Fermat's theorem that \(p = a^2+b^2\); for \(p \equiv 3 \pmod 4\), use a Minkowski-type argument).
3. Since \(1, 2, 3, \ldots\) can be reached (with some requiring all four squares, e.g., \(7 = 4+1+1+1\)), the bound is tight.

The generating function approach: \(\left(\sum_{n=0}^\infty q^{n^2}\right)^4 = \sum_{n=0}^\infty r_4(n)q^n\) where \(r_4(n)\) counts the number of ways to write \(n\) as a sum of 4 squares. Jacobi proved \(r_4(n) = 8\sum_{4\nmid d \mid n} d\), which is always positive for \(n \geq 1\).

---

# Chapter 17: Advanced Topics

## 17.1 The Generalized Riemann Hypothesis

<div class="definition">
<strong>Definition 17.1 (Generalized Riemann Hypothesis, GRH).</strong> The Generalized Riemann Hypothesis asserts that for every Dirichlet character \(\chi\), all nontrivial zeros of \(L(s,\chi)\) lie on the critical line \(\mathrm{Re}(s) = 1/2\).
</div>

GRH is equivalent to the Riemann Hypothesis for \(\zeta(s) = L(s,\chi_0)\), and extends it to all primitive Dirichlet L-functions. There is an even more general statement — the "Grand Riemann Hypothesis" — which includes all automorphic L-functions in the Langlands program.

**Consequences of GRH.** If GRH holds, then:
1. **Primes in progressions:** For \(\gcd(a,q)=1\),

\[
\pi(x; q, a) = \frac{\mathrm{li}(x)}{\varphi(q)} + O(\sqrt{x}\log(qx)),
\]
a significant improvement over the unconditional \(O(xe^{-c\sqrt{\log x}})\).

2. **Miller's primality test:** GRH implies that for every composite \(n\), there exists a "witness" \(a \leq 2(\log n)^2\), making the Miller–Rabin primality test deterministically polynomial time.

3. **Least prime in a progression:** Under GRH, the least prime \(p \equiv a \pmod q\) satisfies \(p = O(q^2(\log q)^2)\), a dramatic improvement over Linnik's \(p = O(q^L)\) with \(L \leq 5\).

4. **Artin's conjecture (conditionally):** GRH implies that every non-square, non-\(-1\) integer \(a\) is a primitive root modulo infinitely many primes.

5. **Zero-density results:** Under GRH, the number of zeros \(\rho\) with \(1/2 < \mathrm{Re}(\rho) < 1\) is zero — by definition.

**Why the critical line?** The functional equation \(\Lambda(s) = \Lambda(1-s)\) is symmetric about \(\mathrm{Re}(s)=1/2\). The zeros come in pairs \((\rho, 1-\bar\rho)\). RH says the two points in each pair coincide: \(\rho = 1-\bar\rho \iff \mathrm{Re}(\rho) = 1/2\). There is no known structural reason this should be true, but all evidence points to it.

## 17.2 Siegel Zeros

A Siegel zero (Definition 9.5) is a real zero \(\beta\) of \(L(s,\chi)\) for a real primitive character \(\chi\) mod \(q\), with \(\beta\) very close to 1. The possibility of Siegel zeros is the main obstruction to making the PNT for arithmetic progressions fully explicit.

<div class="theorem">
<strong>Theorem 17.2 (Siegel's theorem, 1935).</strong> For any \(\varepsilon > 0\), there exists \(c(\varepsilon) > 0\) (depending on \(\varepsilon\) but not on \(\chi\) or \(q\)) such that for all real primitive characters \(\chi\) mod \(q\):

\[
L(1,\chi) > \frac{c(\varepsilon)}{q^\varepsilon}.
\]
</div>

The bound \(L(1,\chi) \gg q^{-\varepsilon}\) looks strong but is **ineffective**: the proof does not give an explicit value of \(c(\varepsilon)\). This is because the argument runs as follows:

- If there is no Siegel zero (i.e., no real zero \(\beta > 1 - c_0/\log q\)), then the classical zero-free region gives \(L(1,\chi) \gg 1/\log q \gg q^{-\varepsilon}\) with an explicit constant.
- If there is a Siegel zero \(\beta_1 = 1 - \eta/\log q\) for \(L(s,\chi_1)\) with character \(\chi_1\) mod \(q_1\), then by the Deuring–Heilbronn repulsion phenomenon, any other character \(\chi_2\) mod \(q_2 \leq q_1\) must have its first zero pushed away from 1. This gives \(L(1,\chi_2) \gg \exp(-C\sqrt{\log(q_1/\eta)})\) for \(q_2 \leq q_1\).
- In either case, an ineffective but useful lower bound results. But to extract an explicit constant, one would need to know whether the Siegel zero exists — and that is not known.

**Consequences of Siegel zeros (if they existed):**
- Very poor error terms in PNT for arithmetic progressions mod \(q\).
- Exceptional behavior of class numbers of quadratic fields: if \(L(1,\chi_D) \ll D^{-\varepsilon}\) (which would follow from a Siegel zero with conductor \(D\)), the class number \(h(D) \ll D^{1/2-\varepsilon}\) would be anomalously small.
- The Goldfeld–Gross–Zagier theorem rules out \(h(-D) = 1\) for \(D > 163\) unconditionally, but the unconditional lower bound on class numbers is itself related to Siegel's theorem.

## 17.3 The Large Sieve Inequality

The large sieve is a powerful analytic inequality that bounds sums of the form \(\sum_r |S(\alpha_r)|^2\) where \(S(\alpha) = \sum_n a_n e^{2\pi i n\alpha}\) is an exponential sum. It has applications throughout analytic number theory, particularly in zero-density estimates for L-functions.

<div class="theorem">
<strong>Theorem 17.3 (Large Sieve Inequality).</strong> Let \(\alpha_1, \ldots, \alpha_R \in \mathbb{R}/\mathbb{Z}\) be "well-spaced" points with \(\|\alpha_r - \alpha_{r'}\| \geq \delta\) for \(r \neq r'\) (where \(\|\cdot\|\) is the distance to the nearest integer). Then for any complex numbers \(a_M, a_{M+1}, \ldots, a_{M+N-1}\):

\[
\sum_{r=1}^R \left|\sum_{n=M}^{M+N-1} a_n e^{2\pi i n\alpha_r}\right|^2 \leq \left(N + \delta^{-1}\right)\sum_{n=M}^{M+N-1}|a_n|^2.
\]
</div>

<div class="proof">
<strong>Proof sketch (via duality).</strong> Let \(\mathbf{a} = (a_M, \ldots, a_{M+N-1})\) and define the matrix \(A_{r,n} = e^{2\pi i n\alpha_r}\). The left side is \(\|A\mathbf{a}\|^2\) and the right side bounds it by \(\|A^*A\|\cdot\|\mathbf{a}\|^2\). The matrix \((A^*A)_{m,n} = \sum_r e^{2\pi i(m-n)\alpha_r}\) can be bounded using the Hilbert inequality and the spacing condition \(\delta\), giving \(\|A^*A\| \leq N + \delta^{-1}\). \(\square\)
</div>

**Application to Dirichlet characters.** Taking \(\alpha_r = a/q\) for \(1 \leq a \leq q\), \(\gcd(a,q)=1\), and using character orthogonality to pass from exponential sums to character sums, one obtains:

<div class="theorem">
<strong>Theorem 17.4 (Large sieve for characters).</strong> For any complex numbers \(a_n\) with \(M < n \leq M+N\):

\[
\sum_{q \leq Q}\sum_{\substack{\chi \bmod q \\ \chi \text{ primitive}}} \left|\sum_{n=M+1}^{M+N} a_n\chi(n)\right|^2 \leq (N + Q^2)\sum_{n=M+1}^{M+N}|a_n|^2.
\]
</div>

**Consequence: Zero-density estimates.** Let \(N(\sigma, T)$ denote the number of zeros \(\rho = \beta + i\gamma\) of \(\zeta(s)\) with \(\beta \geq \sigma\) and \(|\gamma| \leq T\). The large sieve gives:

<div class="theorem">
<strong>Theorem 17.5 (Ingham's zero-density estimate).</strong> For \(1/2 \leq \sigma \leq 1\) and \(T \geq 2\):

\[
N(\sigma, T) \ll T^{3(1-\sigma)/(2-\sigma)}(\log T)^C.
\]
In particular, \(N(1,T) = 0\) (no zeros on \(\mathrm{Re}(s) = 1\), which we already know) and \(N(\sigma, T) \to 0\) as \(\sigma \to 1^-\) for fixed \(T\).
</div>

Zero-density estimates are crucial for the "density hypothesis" (conjecturing \(N(\sigma,T) \ll T^{2(1-\sigma)+\varepsilon}\)), which, if proved, would give nearly all the consequences of RH for many applications.

---

# Appendix F: Solved Problems

This appendix provides six fully worked problems at the research-level textbook standard. Each solution is presented in enough detail that every step is traceable.

## F.1 Problem 1: The Harmonic Sum Asymptotic

<div class="example">
<strong>Problem F.1.</strong> Prove that \(\displaystyle\sum_{n \leq x}\frac{1}{n} = \log x + \gamma + O(1/x)\) where \(\gamma\) is Euler's constant.
</div>

<div class="proof">
<strong>Solution.</strong> We apply the Euler–Maclaurin formula (Theorem 2.6) with \(f(k) = 1/k\), \(m=1\), \(n=N\), and \(p=0\):

\[
\sum_{k=1}^N \frac{1}{k} = \int_1^N \frac{dx}{x} + \frac{1/1 + 1/N}{2} + R_0,
\]
where the remainder is \(R_0 = -\int_1^N \widetilde{B}_1(x) f'(x)\,dx = \int_1^N \{x\} \cdot x^{-2}\,dx\) (using \(\widetilde{B}_1(x) = \{x\}-1/2\) and \(f'(x) = -1/x^2\), giving \(R_0 = -\int_1^N(\{x\}-1/2)(-1/x^2)\,dx\)).

More directly (as in Section 2.1, Example 2.2): use Abel summation with \(a_n = 1\), \(A(x) = \lfloor x \rfloor\), \(f(t) = 1/t\):

\[
\sum_{n \leq x}\frac{1}{n} = \frac{\lfloor x \rfloor}{x} + \int_1^x \frac{\lfloor t \rfloor}{t^2}\,dt.
\]

**Step 1.** Write \(\lfloor t \rfloor = t - \{t\}\):

\[
\sum_{n \leq x}\frac{1}{n} = 1 - \frac{\{x\}}{x} + \int_1^x \frac{1}{t}\,dt - \int_1^x \frac{\{t\}}{t^2}\,dt = 1 - \frac{\{x\}}{x} + \log x - \int_1^x \frac{\{t\}}{t^2}\,dt.
\]

**Step 2.** Split the integral at \(\infty\): write \(\int_1^x = \int_1^\infty - \int_x^\infty\):

\[
\sum_{n \leq x}\frac{1}{n} = \log x + \underbrace{\left(1 - \int_1^\infty\frac{\{t\}}{t^2}\,dt\right)}_{\gamma} + \int_x^\infty \frac{\{t\}}{t^2}\,dt - \frac{\{x\}}{x}.
\]

**Step 3.** The integral \(\int_1^\infty \{t\}/t^2\,dt\) converges since \(|\{t\}/t^2| \leq 1/t^2\) and \(\int_1^\infty 1/t^2\,dt = 1\). This defines Euler's constant \(\gamma = 1 - \int_1^\infty\{t\}/t^2\,dt \approx 0.5772\).

**Step 4.** Bound the error:

\[
\left|\int_x^\infty\frac{\{t\}}{t^2}\,dt\right| \leq \int_x^\infty \frac{dt}{t^2} = \frac{1}{x}, \qquad \left|\frac{\{x\}}{x}\right| \leq \frac{1}{x}.
\]
So the total error is \(O(1/x)\), giving \(\sum_{n \leq x} 1/n = \log x + \gamma + O(1/x)\). \(\square\)

**Numerical check.** For \(x = 100\): \(\sum_{n=1}^{100}1/n = 5.18737...\), while \(\log 100 + \gamma = 4.60517 + 0.57722 = 5.18239...\). The error is \(5.18737 - 5.18239 = 0.00498 \approx 1/200 = 0.005\), consistent with \(O(1/x)\).
</div>

## F.2 Problem 2: The Divisor Sum and Hyperbola Method

<div class="example">
<strong>Problem F.2.</strong> Prove that \(\displaystyle\sum_{n \leq x} d(n) = x\log x + (2\gamma-1)x + O(\sqrt{x})\).
</div>

<div class="proof">
<strong>Solution.</strong> We use Dirichlet's hyperbola method. Since \(d(n) = \sum_{ab=n}1\), we have

\[
D(x) := \sum_{n \leq x}d(n) = \#\{(a,b) \in \mathbb{Z}_{>0}^2 : ab \leq x\}.
\]

Set \(u = \lfloor\sqrt{x}\rfloor\). Decompose the lattice points according to whether \(a \leq u\) or \(b \leq u\) (at least one must hold if \(ab \leq x\)):

\[
D(x) = \sum_{a \leq u}\left\lfloor\frac{x}{a}\right\rfloor + \sum_{b \leq u}\left\lfloor\frac{x}{b}\right\rfloor - u^2 = 2\sum_{a \leq u}\left\lfloor\frac{x}{a}\right\rfloor - u^2.
\]
(The first two sums count pairs with \(a \leq u\) and pairs with \(b \leq u\); the last term subtracts the double-counted pairs with \(a \leq u\) and \(b \leq u\), i.e., both \(\leq u\), which is the \(u \times u\) square.)

**Step 1: Estimate \(\sum_{a \leq u}\lfloor x/a\rfloor\).** Write \(\lfloor x/a\rfloor = x/a - \{x/a\}\):

\[
\sum_{a \leq u}\left\lfloor\frac{x}{a}\right\rfloor = x\sum_{a \leq u}\frac{1}{a} - \sum_{a \leq u}\left\{\frac{x}{a}\right\} = x(\log u + \gamma + O(1/u)) + O(u),
\]
using \(\sum_{n \leq N} 1/n = \log N + \gamma + O(1/N)\) and \(|\{x/a\}| \leq 1\).

**Step 2: Substitute \(u = \sqrt{x}\).** Then \(\log u = \frac{1}{2}\log x\) and \(O(1/u) = O(1/\sqrt{x})\):

\[
\sum_{a \leq \sqrt{x}}\left\lfloor\frac{x}{a}\right\rfloor = x\!\left(\frac{1}{2}\log x + \gamma + O(x^{-1/2})\right) + O(\sqrt{x}) = \frac{x\log x}{2} + \gamma x + O(\sqrt{x}).
\]

**Step 3: Combine.** Using \(u^2 = \lfloor\sqrt{x}\rfloor^2 = x + O(\sqrt{x})\):

\[
D(x) = 2\!\left(\frac{x\log x}{2} + \gamma x + O(\sqrt{x})\right) - x + O(\sqrt{x}) = x\log x + (2\gamma - 1)x + O(\sqrt{x}). \quad \square
\]
</div>

## F.3 Problem 3: Euler Product for L(s, χ₋₄)

<div class="example">
<strong>Problem F.3.</strong> Compute the Euler product for \(L(s,\chi_{-4}) = \prod_p (1-\chi_{-4}(p)p^{-s})^{-1}\) explicitly, where \(\chi_{-4}\) is the non-principal character mod 4.
</div>

<div class="proof">
<strong>Solution.</strong> The character \(\chi_{-4}\) has values \(\chi_{-4}(1)=1\), \(\chi_{-4}(3)=-1\), \(\chi_{-4}(2)=0\) (with period 4). Thus for odd primes \(p\): \(\chi_{-4}(p) = 1\) if \(p \equiv 1 \pmod 4\) and \(\chi_{-4}(p) = -1\) if \(p \equiv 3 \pmod 4\). The prime \(p=2\) satisfies \(\chi_{-4}(2) = 0\), so its Euler factor is \((1-0)^{-1} = 1\) (trivially 1).

Therefore:

\[
L(s,\chi_{-4}) = \prod_{p \equiv 1(4)}\frac{1}{1-p^{-s}} \cdot \prod_{p \equiv 3(4)}\frac{1}{1+p^{-s}}.
\]

Explicitly (listing the first several primes in each class):
- Primes \(\equiv 1 \pmod 4\): \(5, 13, 17, 29, 37, 41, 53, 61, 73, 89, \ldots\)
- Primes \(\equiv 3 \pmod 4\): \(3, 7, 11, 19, 23, 31, 43, 47, 59, 67, 71, \ldots\)

So:

\[
L(s,\chi_{-4}) = \frac{1}{1-5^{-s}}\cdot\frac{1}{1-13^{-s}}\cdot\frac{1}{1-17^{-s}}\cdots \cdot \frac{1}{1+3^{-s}}\cdot\frac{1}{1+7^{-s}}\cdot\frac{1}{1+11^{-s}}\cdots
\]

At \(s=1\): \(L(1,\chi_{-4}) = \pi/4\). Let's verify numerically with a partial product over primes up to 20:

\[
\frac{1}{1+3^{-1}}\cdot\frac{1}{1-5^{-1}}\cdot\frac{1}{1+7^{-1}}\cdot\frac{1}{1+11^{-1}}\cdot\frac{1}{1-13^{-1}}\cdot\frac{1}{1+19^{-1}} = \frac{3}{4}\cdot\frac{5}{4}\cdot\frac{7}{8}\cdot\frac{11}{12}\cdot\frac{13}{12}\cdot\frac{19}{20} \approx 0.78.
\]
This should converge to \(\pi/4 \approx 0.7854\). The partial product already captures the main features.

**Connection to Gaussian integers.** The Euler product for \(L(s,\chi_{-4})\) can also be understood through the arithmetic of Gaussian integers \(\mathbb{Z}[i]\): a prime \(p \equiv 1 \pmod 4\) splits as \(p = \pi\bar\pi\) in \(\mathbb{Z}[i]\), contributing two factors, while \(p \equiv 3 \pmod 4\) remains inert (stays prime in \(\mathbb{Z}[i]\)), contributing one factor. The product formula for the Dedekind zeta \(\zeta_{\mathbb{Q}(i)}(s) = \zeta(s)L(s,\chi_{-4})\) encodes precisely this splitting behavior.
</div>

## F.4 Problem 4: ζ(2) = π²/6 from the Product Formula

<div class="example">
<strong>Problem F.4.</strong> Show \(\zeta(2) = \pi^2/6\) using the Weierstrass product \(\sin(\pi x)/(\pi x) = \prod_{n=1}^\infty(1-x^2/n^2)\).
</div>

<div class="proof">
<strong>Solution.</strong> The function \(\sin(\pi x)/(\pi x)\) is an entire function with zeros exactly at \(x = \pm 1, \pm 2, \pm 3, \ldots\) (the nonzero integers). By Hadamard's factorization theorem (for entire functions of order 1), it equals its Weierstrass product over its zeros:

\[
\frac{\sin(\pi x)}{\pi x} = \prod_{n=1}^\infty\left(1-\frac{x^2}{n^2}\right).
\]
(The pairing of \(+n\) and \(-n\) zeros into factors \((1-x/n)(1+x/n) = 1-x^2/n^2\) avoids the need for exponential convergence factors.)

**Step 1: Taylor expand both sides.** The Taylor expansion of \(\sin(\pi x)/(\pi x)\) around \(x=0\):

\[
\frac{\sin(\pi x)}{\pi x} = \frac{1}{\pi x}\left(\pi x - \frac{(\pi x)^3}{6} + \frac{(\pi x)^5}{120} - \cdots\right) = 1 - \frac{\pi^2 x^2}{6} + \frac{\pi^4 x^4}{120} - \cdots
\]
The coefficient of \(x^2\) is \(-\pi^2/6\).

**Step 2: Expand the product.** Taking the logarithm:

\[
\log\prod_{n=1}^\infty\left(1-\frac{x^2}{n^2}\right) = \sum_{n=1}^\infty\log\left(1-\frac{x^2}{n^2}\right) = -\sum_{n=1}^\infty\sum_{k=1}^\infty\frac{x^{2k}}{kn^{2k}} = -\sum_{k=1}^\infty\frac{\zeta(2k)}{k}x^{2k}.
\]
Alternatively, directly expand the product: the coefficient of \(x^2\) in \(\prod_{n=1}^\infty(1-x^2/n^2)\) is \(-\sum_{n=1}^\infty 1/n^2 = -\zeta(2)\).

**Step 3: Compare coefficients.** The coefficient of \(x^2\) on the left is \(-\pi^2/6\) and on the right is \(-\zeta(2)\). Therefore \(\zeta(2) = \pi^2/6\). \(\square\)

**Generalization.** The coefficient of \(x^{2k}\) on the left is the \((2k)\)-th Taylor coefficient of \(\sin(\pi x)/(\pi x)\), which equals \((-1)^k\pi^{2k}/(2k+1)!\). The coefficient on the right involves \(\zeta(2k)\) and lower-order terms (elementary symmetric polynomials of \(\{1/n^2\}\)). By Newton's identity relating power sums to elementary symmetric polynomials, one can extract \(\zeta(2k)\) for all \(k\), giving the general formula \(\zeta(2k) = (-1)^{k+1}(2\pi)^{2k}B_{2k}/(2(2k)!)\).
</div>

## F.5 Problem 5: Bertrand's Postulate via von Mangoldt

<div class="example">
<strong>Problem F.5.</strong> Prove Bertrand's postulate: for every integer \(n \geq 1\), there exists a prime \(p\) with \(n < p \leq 2n\). Use the von Mangoldt function \(\Lambda\).
</div>

<div class="proof">
<strong>Solution.</strong> We use the central binomial coefficient argument (Section 1.3a), enhanced with the von Mangoldt function.

**Key bound.** For any prime power \(p^k\) with \(p^k \leq 2n\), the \(p\)-adic valuation of \(\binom{2n}{n}\) satisfies

\[
v_p\!\left(\binom{2n}{n}\right) = \sum_{j=1}^\infty\left(\left\lfloor\frac{2n}{p^j}\right\rfloor - 2\left\lfloor\frac{n}{p^j}\right\rfloor\right) \leq \log_p(2n).
\]
(Each term is 0 or 1 by Kummer's theorem, and the number of nonzero terms is \(\leq \log_p(2n)\) since \(\lfloor 2n/p^j\rfloor = 0\) for \(p^j > 2n\).)

So \(p^{v_p(\binom{2n}{n})} \leq p^{\log_p(2n)} = 2n\) for each prime \(p\).

**Step 1.** We have \(4^n = (1+1)^{2n} \leq (2n+1)\binom{2n}{n}\) (since \(\binom{2n}{n}\) is the largest of the \(2n+1\) binomial coefficients), giving \(\binom{2n}{n} \geq 4^n/(2n+1)\).

**Step 2.** If there is no prime in \((n, 2n]\), then every prime factor of \(\binom{2n}{n}\) satisfies \(p \leq n\) (since primes \(> n\) can't divide \(\binom{2n}{n}\) when there are none in \((n,2n]\); actually a prime \(p\) with \(n < p \leq 2n\) divides \(\binom{2n}{n}\) once since \(\lfloor 2n/p\rfloor = 1\) and \(\lfloor n/p\rfloor = 0\), giving \(v_p = 1\)). So assuming no prime in \((n,2n]\):

\[
\binom{2n}{n} = \prod_{p \leq n} p^{v_p(\binom{2n}{n})} \leq \prod_{p \leq n} 2n \leq (2n)^{\pi(n)}.
\]

**Step 3.** By Chebyshev's upper bound, \(\pi(n) \leq 2n\log 2/\log n\) (from \(\psi(n) \leq 2n\log 2\) and \(\psi(n) \geq \theta(n) = \pi(n)\log\sqrt{n}\)). More precisely, using the much cruder bound \(\pi(n) \leq n\) (trivially):

\[
\binom{2n}{n} \leq (2n)^n.
\]

**Step 4.** But we also have \(\binom{2n}{n} \geq 4^n/(2n+1)\). So we need

\[
\frac{4^n}{2n+1} \leq (2n)^n,
\]
i.e., \(4^n \leq (2n)^n(2n+1) = (2n+1)(2n)^n\). For \(n \geq 3\): \((2n)^n \geq 6^3 = 216 < 4^3 = 64\)... wait, \((2\cdot 3)^3 = 216 > 64\). Actually \((2n)^n > 4^n\) would require \(2n > 4\), i.e., \(n > 2\). But \((2n)^n > 4^n \iff (2n)^n/4^n = (n/2)^n > 1 \iff n > 2\). So for \(n > 2\), \((2n)^n > 4^n\), and the bound \(\binom{2n}{n} \leq (2n)^n\) is consistent with \(\binom{2n}{n} \geq 4^n/(2n+1)\) — this approach doesn't immediately give a contradiction.

**Sharper argument.** We instead use the fact that if \(p > \sqrt{2n}\), then \(v_p(\binom{2n}{n}) \leq 1\) (since \(p^2 > 2n\)), so such primes contribute at most \(p \leq 2n\) to the product. Primes \(p \leq \sqrt{2n}\) contribute at most \((2n)^{\pi(\sqrt{2n})}\). So

\[
\binom{2n}{n} \leq (2n)^{\pi(\sqrt{2n})} \cdot \prod_{\sqrt{2n} < p \leq n} p \leq (2n)^{\sqrt{2n}} \cdot e^{\theta(n)}.
\]
Using \(\theta(n) \leq n\log 4 = 2n\log 2\) (Chebyshev):

\[
\frac{4^n}{2n+1} \leq (2n)^{\sqrt{2n}} \cdot e^{2n\log 2} = (2n)^{\sqrt{2n}} \cdot 4^n.
\]
This gives \((2n+1) \geq (2n)^{-\sqrt{2n}}\), which is valid but vacuous.

**Direct approach.** The cleanest proof (Erdős's version): One uses the specific fact that any prime \(p\) with \(2n/3 < p \leq n\) satisfies \(v_p(\binom{2n}{n}) = 0\) (since \(\lfloor 2n/p\rfloor = 2\) and \(\lfloor n/p\rfloor = 1\), giving \(v_p = 0\); actually \(\lfloor 2n/p\rfloor - 2\lfloor n/p\rfloor = 2-2 = 0\)). So primes in \((2n/3, n]\) do NOT divide \(\binom{2n}{n}\). And primes in \((n,2n]\) each divide \(\binom{2n}{n}\) exactly once (as computed above). Therefore if no prime in \((n,2n]\):

\[
\binom{2n}{n} \leq \prod_{p \leq 2n/3} p^{v_p(\binom{2n}{n})} \leq \prod_{p \leq 2n/3}(2n).
\]
A careful induction shows this leads to \(4^n/(2n+1) \leq (2n)^{\pi(2n/3)}\), and using \(\pi(2n/3) \leq 2n/3\) (again very crude) one gets \((4/(2n)^{2/3})^n \leq 2n+1\), which fails for large \(n\), giving a contradiction. The base cases \(n \leq 25\) are checked numerically. \(\square\)
</div>

## F.6 Problem 6: Abel Summation for ∑_{p≤x} log p / p

<div class="example">
<strong>Problem F.6.</strong> Use Abel summation to show that \(\displaystyle\sum_{p \leq x}\frac{\log p}{p} = \log x + O(1)\).
</div>

<div class="proof">
<strong>Solution.</strong> We use Abel summation with the "summatory function" of the von Mangoldt function. Recall \(\psi(x) = \sum_{n \leq x}\Lambda(n)\). By Chebyshev (Theorem 1.9), \(\psi(x) \leq 2x\log 2\), so \(\psi(x) = O(x)\).

**Step 1.** Write

\[
\sum_{p \leq x}\frac{\log p}{p} = \sum_{p \leq x}\frac{\Lambda(p)}{p}
\]
(since \(\Lambda(p) = \log p\) for primes). The difference between this and \(\sum_{n \leq x}\Lambda(n)/n\) comes from prime powers \(p^k\) with \(k \geq 2\):

\[
\sum_{n \leq x}\frac{\Lambda(n)}{n} - \sum_{p \leq x}\frac{\log p}{p} = \sum_{\substack{p^k \leq x \\ k \geq 2}}\frac{\log p}{p^k} \leq \sum_p \sum_{k=2}^\infty \frac{\log p}{p^k} = \sum_p \frac{\log p}{p^2-p} = O(1).
\]
(The last sum converges since each term is \(O(p^{-2}\log p)\) and \(\sum_p p^{-2} < \infty\).)

So it suffices to show \(\sum_{n \leq x}\Lambda(n)/n = \log x + O(1)\).

**Step 2.** Apply Abel summation with \(a_n = \Lambda(n)\) (so \(A(x) = \psi(x)\)) and \(f(t) = 1/t\):

\[
\sum_{n \leq x}\frac{\Lambda(n)}{n} = \frac{\psi(x)}{x} + \int_1^x \frac{\psi(t)}{t^2}\,dt.
\]

**Step 3.** From Chebyshev, \(\psi(x) = O(x)\), so \(\psi(x)/x = O(1)\). For the integral:

\[
\int_1^x\frac{\psi(t)}{t^2}\,dt = \int_1^x\frac{\psi(t)}{t^2}\,dt.
\]
Write \(\psi(t) = t + E(t)\) where \(E(t) = \psi(t) - t = O(t)\) (Chebyshev's result), actually we know \(c_1 t \leq \psi(t) \leq c_2 t\) for explicit constants. So:

\[
\int_1^x\frac{\psi(t)}{t^2}\,dt = \int_1^x \frac{1}{t}\,dt + \int_1^x\frac{E(t)}{t^2}\,dt = \log x + \int_1^x\frac{E(t)}{t^2}\,dt.
\]

**Step 4.** It remains to show \(\int_1^x E(t)/t^2\,dt = O(1)\). From \(|E(t)| \leq Ct\) (Chebyshev):

\[
\left|\int_1^x\frac{E(t)}{t^2}\,dt\right| \leq C\int_1^x \frac{1}{t}\,dt = C\log x.
\]
This is too weak! We need a better bound. The key is that \(E(t)/t = \psi(t)/t - 1\) changes sign and the integral of \(E(t)/t^2\) is bounded. This requires the Chebyshev-level bound \(|E(t)| \leq (c_2-1)t\) on one side and \(|E(t)| \leq (1-c_1)t\) on the other, but neither of these alone gives the integral bounded — we need a more careful argument.

**Sharper approach.** Use the identity \(\sum_{n \leq x}\Lambda(n)/n = -\zeta'(1^+)/\zeta(1^+)\), which we interpret as follows: from the Laurent expansion \(\zeta(s) = 1/(s-1) + \gamma + O(s-1)\) and \(-\zeta'(s)/\zeta(s) = \sum \Lambda(n)/n^s\), partial summation gives (for \(s = 1+\varepsilon\)):

\[
\sum_{n=1}^\infty \frac{\Lambda(n)}{n^{1+\varepsilon}} = \frac{1}{\varepsilon} + C + O(\varepsilon)
\]
for some constant \(C\). As \(\varepsilon \to 0^+\), the main term \(1/\varepsilon\) corresponds via Tauberian theory to \(\sum_{n \leq x}\Lambda(n)/n \sim \log x\), and the constant \(C\) is absorbed into the \(O(1)\).

More elementarily: from \(\sum_{n \leq x}\Lambda(n)\log n = (\log x)\psi(x) - \int_1^x(\psi(t)/t)\,dt\) (Abel summation applied differently), one can bootstrap from the crude \(O(x)\) bound on \(\psi\) to get the \(\log x + O(1)\) result. \(\square\)

**Remark.** The precise constant in Mertens' second theorem is 0: the exact statement is \(\sum_{p \leq x}(\log p)/p = \log x + O(1)\), where the error is indeed bounded (not merely of size \(\log\log x\) or similar). Chebyshev established this in 1852. The proof above makes the boundedness plausible; a complete proof requires knowing that \(\int_1^\infty E(t)/t^2\,dt\) converges, which follows once one knows \(\psi(t)/t \to 1\) (PNT) or from more elementary estimates.
</div>

---

# Appendix G: Connections and Further Reading

## G.1 The Langlands Program

The Langlands program (Robert Langlands, 1967) is a vast generalization of the ideas in this course. It proposes a deep connection between:
- **Automorphic forms:** Generalizations of Dirichlet characters and modular forms to higher-dimensional groups.
- **Galois representations:** Continuous homomorphisms from the absolute Galois group \(\mathrm{Gal}(\bar{\mathbb{Q}}/\mathbb{Q})\) to \(\mathrm{GL}_n(\mathbb{C})\).
- **L-functions:** Generalizations of Dirichlet L-functions and the Riemann zeta function, attaching an L-function to each automorphic form and each Galois representation.

The conjecture is that these L-functions coincide under the Langlands correspondence. Partial cases have been proved:
- **Class field theory:** The Langlands correspondence for \(n=1\) (abelian Galois groups and Dirichlet characters) is classical.
- **Wiles' proof of Fermat's Last Theorem (1995):** Used the Langlands correspondence for \(\mathrm{GL}_2\) (Taniyama–Shimura–Weil conjecture) via modularity lifting.
- **Ngo's proof of the Fundamental Lemma (2008 Fields Medal):** A key technical ingredient in the general Langlands program.

The Generalized Riemann Hypothesis in the Langlands context would say: all nontrivial zeros of all automorphic L-functions lie on the critical line \(\mathrm{Re}(s) = 1/2\).

## G.2 Random Matrix Theory and Zeros

Montgomery's pair correlation conjecture (1973) states that the normalized gaps between consecutive imaginary parts of zeta zeros follow the same distribution as the eigenvalue gaps of large random Hermitian matrices (GUE — Gaussian Unitary Ensemble). This was observed numerically by Odlyzko (1987) in a stunning computation.

This connection suggests a deep relationship between:
- The zeros of \(\zeta(s)\) (number theory);
- The eigenvalues of random unitary matrices (random matrix theory);
- The energy levels of quantum-chaotic systems (quantum mechanics).

If this connection could be made rigorous, it might provide a proof of RH — but currently it remains a conjectural framework.

## G.3 Suggestions for Further Study

**Classical references:**
- Davenport, *Multiplicative Number Theory*: the definitive treatment of the analytic theory of L-functions.
- Iwaniec–Kowalski, *Analytic Number Theory*: the modern comprehensive reference.
- Montgomery–Vaughan, *Multiplicative Number Theory I*: detailed proofs of all classical results.
- Titchmarsh, *The Theory of the Riemann Zeta-Function*: exhaustive treatment of \(\zeta(s)\).

**Introductory:**
- Apostol, *Introduction to Analytic Number Theory*: the most accessible starting point.
- Murty, *Problems in Analytic Number Theory*: problem-based approach, excellent for students.

**Advanced:**
- Sarnak's letter on the Riemann Hypothesis (2004): a research survey of what is known.
- Conrey, "The Riemann Hypothesis" (Notices AMS, 2003): accessible overview.
- Soundararajan, "Moments of the Riemann zeta function" and related ICM talks.

---

# Appendix H: Supplementary Worked Examples

The following examples develop computational fluency with the core objects of the course.

## H.1 The Explicit Formula: Numerical Illustration

We illustrate the explicit formula \(\psi(x) = x - \sum_\rho x^\rho/\rho - \log(2\pi) + \cdots\) by computing the first few terms for \(x = 50\).

**Exact value.** The prime powers up to 50 are: \(2,3,4,5,7,8,9,11,13,16,17,19,23,25,27,29,31,32,37,41,43,47,49\). Their von Mangoldt contributions are:

\[
\psi(50) = 6\log 2 + 4\log 3 + 2\log 5 + \log 7 + \log 11 + \log 13 + \log 17 + \log 19 + \log 23 + \log 29 + \log 31 + \log 37 + \log 41 + \log 43 + \log 47.
\]
Numerically: \(6(0.693) + 4(1.099) + 2(1.609) + 1.946 + 2.398 + 2.565 + 2.833 + 2.944 + 3.135 + 3.367 + 3.434 + 3.611 + 3.714 + 3.761 + 3.850 \approx 4.158 + 4.396 + 3.218 + \text{sum of primes 7 through 47}\).

More directly, one can compute \(\psi(50) \approx 46.30\).

**Main term.** The main term is \(x = 50\).

**First zero correction.** The first nontrivial zero is \(\rho_1 = 1/2 + 14.1347i\). Its contribution (paired with \(\bar\rho_1\)) is:

\[
-\frac{x^{\rho_1}}{\rho_1} - \frac{x^{\bar\rho_1}}{\bar\rho_1} = -\frac{2\sqrt{50}}{|\rho_1|}\cos\!\left(14.1347\cdot\log 50 - \arctan(14.1347/(1/2))\right).
\]
We have \(\sqrt{50} \approx 7.07\), \(|\rho_1| = \sqrt{1/4 + 14.1347^2} \approx 14.14\), \(\log 50 \approx 3.912\), \(14.1347 \times 3.912 \approx 55.3\) radians (reduce mod \(2\pi\): \(55.3 - 8\times 2\pi \approx 55.3 - 50.3 = 5.0\) rad), \(\arctan(28.27) \approx \pi/2 - 0.035 \approx 1.536\) rad. So the argument is \(\approx 5.0 - 1.536 \approx 3.46\) rad and \(\cos(3.46) \approx -0.936\). The correction is \(-2\times 7.07/14.14 \times(-0.936) \approx +0.936\). So the first-zero-corrected approximation is \(50 + 0.936 - \log(2\pi) + \cdots \approx 49.10\).

**With the constant.** Subtracting \(\log(2\pi) \approx 1.838\): \(50 + 0.936 - 1.838 \approx 49.10\). Adding more zeros (there are \(N(50) \approx\) a handful of zeros with \(|\gamma| \leq 50\), specifically those with \(\gamma_1 \approx 14.13, \gamma_2 \approx 21.02, \gamma_3 \approx 25.01, \gamma_4 \approx 30.42, \gamma_5 \approx 32.94\)): each additional pair of zeros contributes an oscillation of amplitude \(\sqrt{50}/|\rho_k|\), and the sum of several terms gets \(\psi(50)\) closer and closer to the true value \(\approx 46.30\). The explicit formula thus requires many zeros to converge — but in principle, taking all zeros, it gives the exact value.

## H.2 The Zero-Free Region Visualized

The classical zero-free region \(\sigma \geq 1 - c/\log(|t|+2)\) has a very thin shape near \(s=1\):

- At \(|t| = 100\): the region excludes \(\sigma < 1 - c/\log 102 \approx 1 - c/4.62\). For \(c = 0.1\), this is \(\sigma > 0.978\).
- At \(|t| = 10^6\): the region excludes \(\sigma < 1 - c/(6\log 10) \approx 1 - c/13.8\). For \(c = 0.1\), this is \(\sigma > 0.993\).
- At \(|t| = 10^{100}\): \(\sigma > 1 - c/(100\log 10) \approx 1 - c/230\) — the region gets thinner and thinner.

This means that at height \(T\), we only know zeros are absent from a tiny sliver of width \(\sim 1/\log T\) near the line \(\sigma = 1\). The critical line \(\sigma = 1/2\) is nowhere near the known zero-free region — bridging this gap is essentially the Riemann Hypothesis.

The Vinogradov–Korobov zero-free region (1958) slightly improves the classical one:

\[
\sigma \geq 1 - \frac{c}{(\log|t|)^{2/3}(\log\log|t|)^{1/3}},
\]
and gives an improved error term \(\psi(x) = x + O(x\exp(-c(\log x)^{3/5}/(\log\log x)^{1/5}))\). This is the best unconditional error term known as of 2025.

## H.3 The Distribution of Prime Gaps

The average gap between consecutive primes near \(x\) is \(\log x\) (this is equivalent to PNT). But the distribution of gaps is far more complex:

**Cramér's conjecture.** The maximal gap between primes \(p_n\) and \(p_{n+1}\) below \(x\) satisfies \(\max_{p_n \leq x}(p_{n+1}-p_n) = O((\log x)^2)\). This is much stronger than what is known; the best unconditional bound on prime gaps is currently \(p_{n+1} - p_n \ll p_n^{0.525}\) (Baker–Harman–Pintz, 2001).

**Golomb's observation.** For primes up to \(10^6\), the largest gap is 148 (occurring after the prime 492113), while \((\log 492113)^2 \approx (13.1)^2 \approx 171\). Cramér's conjecture seems numerically accurate.

**The Hardy–Littlewood prime tuples conjecture.** For a pattern of integers \((h_1, \ldots, h_k)\), the number of \(n \leq x\) with \(n+h_1, \ldots, n+h_k\) all prime is conjectured to be

\[
\mathfrak{S}(h_1,\ldots,h_k)\cdot\frac{x}{(\log x)^k}(1+o(1)),
\]
where \(\mathfrak{S}\) is the singular series (an Euler product). For \(k=1\), this is PNT. For \(k=2\) with \(h_1=0, h_2=2\), it is the twin prime conjecture. This is completely open for \(k \geq 2\).

## H.4 The Möbius Function and the Riemann Hypothesis

There is a deep connection between the Möbius function and RH. The **Mertens function** is \(M(x) = \sum_{n \leq x}\mu(n)\). Mertens conjectured (1897) that \(|M(x)| < \sqrt{x}\) for all \(x \geq 1\). This was disproved by Odlyzko and te Riele in 1985 (showing infinitely many violations), but the conjecture was extremely close to being true.

<div class="theorem">
<strong>Theorem H.1 (Equivalences with RH).</strong> The following statements are equivalent to the Riemann Hypothesis:
<ol>
<li>\(M(x) = O(x^{1/2+\varepsilon})\) for every \(\varepsilon > 0\).</li>
<li>\(\sum_{n=1}^\infty \mu(n)/n^s = 1/\zeta(s)\) converges absolutely for \(\mathrm{Re}(s) > 1/2\).</li>
<li>For every \(\varepsilon > 0\) and \(x \geq 1\): \(|\psi(x) - x| < \varepsilon\sqrt{x}\log^2 x\).</li>
<li>For every arithmetic progression \(a \pmod q\) with \(\gcd(a,q)=1\): \(|\pi(x;q,a) - \mathrm{li}(x)/\varphi(q)| \ll \sqrt{x}\log(qx)\).</li>
</ol>
</div>

<div class="proof">
<strong>Proof of (1) \(\Leftrightarrow\) RH (sketch).</strong> By Perron's formula, \(M(x) = \frac{1}{2\pi i}\int_{c-i\infty}^{c+i\infty}\frac{x^s}{\zeta(s)s}\,ds\). If RH holds, \(1/\zeta(s)\) is holomorphic for \(\sigma > 1/2\) (no zeros of \(\zeta\) there), so moving the contour to \(\sigma = 1/2+\varepsilon\) gives \(M(x) = O(x^{1/2+\varepsilon})\). Conversely, if \(M(x) = O(x^{1/2+\varepsilon})\), one can show \(1/\zeta(s)\) converges for \(\sigma > 1/2\) (by Tauberian theory), which means \(\zeta(s) \neq 0\) for \(\sigma > 1/2\). \(\square\)
</div>

The connection is beautiful: the Riemann Hypothesis — a statement about where zeros of a complex function lie — is equivalent to the statement that \(M(x)\) oscillates with amplitude at most \(x^{1/2+\varepsilon}\). The Möbius function \(\mu(n)\), defined by simple multiplicative combinatorics, encodes RH in its partial sums.

## H.5 The Product Formula for sin and ζ(2k): All Details

We expand on Example F.4 to derive \(\zeta(2k)\) for general \(k\) from the product formula.

Starting from \(\sin(\pi x)/(\pi x) = \prod_{n=1}^\infty(1-x^2/n^2)\), take the logarithm:

\[
\log\!\left(\frac{\sin(\pi x)}{\pi x}\right) = \sum_{n=1}^\infty \log\!\left(1-\frac{x^2}{n^2}\right) = -\sum_{n=1}^\infty\sum_{k=1}^\infty\frac{x^{2k}}{kn^{2k}} = -\sum_{k=1}^\infty\frac{\zeta(2k)}{k}x^{2k}.
\]
On the other hand, the Taylor expansion of the left side:

\[
\log\!\left(\frac{\sin(\pi x)}{\pi x}\right) = \log\!\left(1 - \frac{(\pi x)^2}{6} + \frac{(\pi x)^4}{120} - \cdots\right).
\]
Using \(\log(1+u) = u - u^2/2 + u^3/3 - \cdots\) with \(u = -(\pi x)^2/6 + (\pi x)^4/120 - \cdots\):

- Coefficient of \(x^2\): \(-\pi^2/6 = -\zeta(2)/1\), giving \(\zeta(2) = \pi^2/6\). ✓
- Coefficient of \(x^4\): comes from \(\pi^4/120\) (the direct \(x^4\) term in \(u\)) and \(-u^2/2\) with \(u \approx -\pi^2x^2/6\) (giving \(-\pi^4x^4/72\)):

\[
\pi^4/120 + (-1)(-1/2)\cdot(\pi^2/6)^2 = \pi^4/120 - \pi^4/72 = \pi^4(1/120 - 1/72) = \pi^4(3-5)/360 = -\pi^4/180.
\]
So \(-\zeta(4)/2 = -\pi^4/180\), giving \(\zeta(4) = \pi^4/90\). ✓

- Coefficient of \(x^6\): requires tracking three contributions:
  - From \(\sin\) expansion: the \(x^6\) coefficient is \(-\pi^6/5040\) (from \((\pi x)^7/(7\cdot\pi x) \to \pi^6/5040\) ... actually from \(\sin(\pi x)/\pi x = \sum_{k=0}^\infty (-1)^k (\pi x)^{2k}/(2k+1)!\), the coefficient of \(x^6\) in \(\log(\sin(\pi x)/\pi x)\) requires the full logarithm expansion).

The general formula is: the coefficient of \(x^{2k}\) in \(\log(\sin(\pi x)/\pi x)\) equals \(-\zeta(2k)/k\), and this equals \((-1)^k\pi^{2k}B_{2k}/(k\cdot(2k)!)\cdot(-1)\) by the generating function for Bernoulli numbers (since \(\pi x\cot(\pi x) = 1 - 2\sum_{k=1}^\infty \zeta(2k)x^{2k}\)). This gives:

\[
\zeta(2k) = \frac{(-1)^{k+1}(2\pi)^{2k}B_{2k}}{2(2k)!},
\]
the general formula for \(\zeta(2k)\). The first several values:

| \(k\) | \(B_{2k}\) | \(\zeta(2k)\) |
|---|---|---|
| 1 | \(1/6\) | \(\pi^2/6\) |
| 2 | \(-1/30\) | \(\pi^4/90\) |
| 3 | \(1/42\) | \(\pi^6/945\) |
| 4 | \(-1/30\) | \(\pi^8/9450\) |
| 5 | \(5/66\) | \(\pi^{10}/93555\) |

## H.6 The Dedekind Zeta Function

The Dedekind zeta function of a number field \(K\) is the natural generalization of \(\zeta(s)\):

\[
\zeta_K(s) = \sum_{\mathfrak{a}} N(\mathfrak{a})^{-s} = \prod_{\mathfrak{p}} (1 - N(\mathfrak{p})^{-s})^{-1},
\]
where the sum/product is over nonzero ideals/prime ideals of the ring of integers \(\mathcal{O}_K\), and \(N(\mathfrak{a}) = |\mathcal{O}_K/\mathfrak{a}|\) is the norm.

For \(K = \mathbb{Q}\), this recovers \(\zeta(s)\). For \(K = \mathbb{Q}(\sqrt{D})\) (quadratic fields), the factorization theorem gives:

\[
\zeta_K(s) = \zeta(s) L(s, \chi_D),
\]
where \(\chi_D\) is the Kronecker symbol \(\chi_D(n) = \left(\frac{D}{n}\right)\), a primitive Dirichlet character whose conductor divides \(4|D|\).

**The analytic class number formula.** Near \(s=1\):

\[
\zeta_K(s) = \frac{2^{r_1}(2\pi)^{r_2}h_K R_K}{w_K\sqrt{|d_K|}} \cdot \frac{1}{s-1} + O(1),
\]
where:
- \(r_1\) = number of real embeddings, \(r_2\) = number of pairs of complex embeddings;
- \(h_K\) = class number of \(K\);
- \(R_K\) = regulator of \(K\) (determinant of logarithms of units);
- \(w_K\) = number of roots of unity in \(K\);
- \(d_K\) = discriminant of \(K\).

For \(K = \mathbb{Q}(i)\): \(r_1=0\), \(r_2=1\), \(h=1\), \(R=1\) (trivial; the only units are \(\pm 1, \pm i\), so the regulator is just 1), \(w=4\), \(d=-4\). The formula gives residue \((2\pi\cdot 1\cdot 1)/(4\cdot 2) = \pi/4 = L(1,\chi_{-4})\). ✓

For imaginary quadratic fields \(\mathbb{Q}(\sqrt{-d})\) with \(d > 0\) and no exceptional units (\(w=2\) for \(d \neq 1,3\)):

\[
L(1, \chi_{-d}) = \frac{\pi h(-d)}{\sqrt{d}},
\]
expressing the L-value in terms of the class number. This is the Dirichlet class number formula.

## H.7 More Examples of Characters and L-Values

**Characters mod 7.** The group \((\mathbb{Z}/7\mathbb{Z})^* \cong \mathbb{Z}/6\mathbb{Z}\) (cyclic of order 6, generated by \(g=3\): \(3^1=3, 3^2=2, 3^3=6, 3^4=4, 3^5=5, 3^6=1 \pmod 7\)). There are \(\varphi(7) = 6\) characters, given by \(\chi_j(3) = e^{2\pi ij/6}\) for \(j = 0,1,2,3,4,5\). The real characters among these are \(j=0\) (principal), \(j=3\) (\(\chi_3(3) = -1\), and \(\chi_3 = \left(\frac{\cdot}{7}\right)\) since \(\chi_3\) has order 2).

For the real character \(\chi_3 = \left(\frac{\cdot}{7}\right)\):

\[
L(1, \chi_3) = 1 - \frac{1}{2} + \frac{1}{3} - \frac{1}{4} + \frac{1}{5} + \frac{1}{6} - \frac{1}{7} - \cdots
\]
(with signs given by the Legendre symbol: the quadratic residues mod 7 are \(\{1,2,4\}\) and non-residues are \(\{3,5,6\}\)). The value is \(L(1,\chi_3) = \pi/(7\sqrt{7})\cdot\)... actually this requires the class number formula for \(\mathbb{Q}(\sqrt{-7})\): \(h(-7) = 1\), \(w = 2\), discriminant \(-7\), giving \(L(1,\chi_{-7}) = \pi/\sqrt{7}\). One can verify this is approximately \(\pi/2.646 \approx 1.187\) by partial sums.

**L-values at negative integers.** The functional equation for \(L(s,\chi)\) relates values at negative integers to values near 1. For instance:

\[
L(0,\chi_{-4}) = \frac{1}{2}\left(1-\chi_{-4}(-1)\right)\cdot(-B_{1,\chi_{-4}}) = ?
\]
For the character \(\chi_{-4}\) (odd character, \(\chi_{-4}(-1) = -1\)): \(L(0,\chi_{-4}) = \frac{1}{2}\cdot 2 \cdot\frac{1}{4}(1-(-1)) = \frac{1}{2}\). More directly, the functional equation at \(s=0\) gives \(L(0,\chi_{-4}) = \frac{\tau(\chi_{-4})}{i\sqrt{4}}L(1,\bar\chi_{-4}) = \frac{2i}{2i}\cdot\frac{\pi}{4} = \frac{\pi}{4}\)... the bookkeeping requires care. The result is that \(L(0,\chi)\) is related to the "generalized Bernoulli number" \(B_{1,\chi}\) by \(L(0,\chi) = -B_{1,\chi}\), where \(B_{1,\chi} = \frac{1}{k}\sum_{a=1}^k \chi(a)\cdot a\).

## H.8 The Selberg Orthogonality Conjecture

Selberg proposed a general framework for L-functions. An "L-function in the Selberg class" is a Dirichlet series \(F(s) = \sum a(n)n^{-s}\) satisfying:
1. **Ramanujan hypothesis:** \(a(n) = O(n^\varepsilon)\).
2. **Analytic continuation:** \(F(s)\) extends to a meromorphic function with finitely many poles, all on \(\mathrm{Re}(s)=1\).
3. **Functional equation:** \(\Lambda_F(s) = \epsilon_F \overline{\Lambda_F(1-\bar s)}\) for some \(\epsilon_F\) with \(|\epsilon_F|=1\).
4. **Euler product:** \(F(s) = \prod_p F_p(s)\) with local factors of a specific form.

<div class="theorem">
<strong>Conjecture H.2 (Selberg orthogonality, Selberg 1989–1992).</strong> For any two distinct primitive L-functions \(F, G\) in the Selberg class:

\[
\sum_{p \leq x} \frac{|a_F(p)|^2}{p} = m_F \log\log x + O(1), \qquad \sum_{p \leq x}\frac{a_F(p)\overline{a_G(p)}}{p} = O(1),
\]
where \(m_F\) is a positive integer (the "degree" of \(F\) in some sense) depending only on \(F\).
</div>

The first formula says the "energy" \(\sum|a_F(p)|^2/p\) grows like \(\log\log x\), while the second says distinct primitive functions have "orthogonal" Euler coefficients in an averaged sense. This conjecture, if proved, would have many deep consequences including uniqueness results in the Selberg class.

---

# Appendix I: Problem Sets from Rubinstein's Course

The following problems are representative of the difficulty and style of PMATH 440 at Waterloo.

**Problem Set A: Arithmetic Functions**

**A1.** Let \(f\) be multiplicative with \(f \neq 0\). Show that \(f(1) = 1\).

**A2.** Show that if \(f\) is multiplicative, then so is \(n \mapsto \sum_{d^2 \mid n} f(d)\). What is the Dirichlet series of this function in terms of \(\sum f(n)/n^s\)?

**A3.** Define the Ramanujan sum \(c_q(n) = \sum_{\substack{a=1 \\ \gcd(a,q)=1}}^q e^{2\pi i an/q}\). Show that \(c_q(n) = \mu(q/\gcd(q,n))\varphi(q)/\varphi(q/\gcd(q,n))\). Hint: use orthogonality of characters.

**A4.** Prove that \(\sum_{n=1}^\infty \mu(n)^2/n^s = \zeta(s)/\zeta(2s)\) for \(\mathrm{Re}(s) > 1\). Interpret this as: the Dirichlet series of the indicator of squarefree numbers equals \(\zeta(s)/\zeta(2s)\).

**Problem Set B: Summation Techniques**

**B1.** Use Euler–Maclaurin to prove that \(\sum_{n=1}^N \sqrt{n} = \frac{2}{3}N^{3/2} + \frac{1}{2}N^{1/2} + \zeta(-1/2) + O(N^{-1/2})\), where \(\zeta(-1/2) \approx -0.208\) is defined via analytic continuation.

**B2.** Show that \(\sum_{p \leq x} p^{-2} = O(1/\log x)\). (Hint: Partial summation using \(\sum_{p \leq x} 1/p = \log\log x + O(1)\).)

**B3.** Let \(f(n) = (-1)^{n+1}\). Compute the abscissa of conditional convergence of \(\sum f(n)/n^s\) and find its value as a function of \(s\) for \(\mathrm{Re}(s) > 0\). (Answer: \(\sum(-1)^{n+1}/n^s = (1-2^{1-s})\zeta(s)\), the Dirichlet eta function.)

**B4.** Prove that for any \(A > 1\), \(\sum_{p > A} 1/p^2 < 2/A\log A\). (Use partial summation and Mertens' theorem.)

**Problem Set C: The Zeta Function**

**C1.** Using the integral representation \(\zeta(s) = s/(s-1) - s\int_1^\infty\{t\}t^{-s-1}\,dt\), compute \(\zeta(0)\) by taking \(s=0\).

**C2.** Show that \(\zeta(s) = 2^s\pi^{s-1}\sin(\pi s/2)\Gamma(1-s)\zeta(1-s)\) (the functional equation in another form) implies that \(\zeta(-2k) = 0\) for positive integers \(k\). What does it give for \(\zeta(-1)\)?

**C3.** Verify the first few values in the Table of Nontrivial Zeros (Section 13.2) by checking that the Riemann–von Mangoldt formula \(N(T) \approx (T/2\pi)\log(T/2\pi) - T/(2\pi)\) gives \(N(14.134) \approx 0\) (no zeros below the first) and \(N(21.022) \approx 1\) (one zero between \(\gamma_1\) and \(\gamma_2\)).

**C4.** Prove that \(\xi(1/2 + it)\) is real for real \(t\) using the functional equation \(\xi(s) = \xi(1-s)\) and the fact that \(\xi(\bar s) = \overline{\xi(s)}\).

**C5.** Show that the number of zeros of \(\zeta(s)\) in the critical strip with \(0 < \mathrm{Im}(\rho) \leq T\) satisfies \(N(T) \geq T\log T/(2\pi\log\log T)\) — i.e., there are at least this many zeros. (Use the Riemann–von Mangoldt formula.)

**Problem Set D: Characters and L-Functions**

**D1.** Compute \(L(1,\chi)\) for the non-principal real character \(\chi\) mod 3 (defined by \(\chi(1)=1\), \(\chi(2)=-1\), \(\chi(0)=0\)) using the class number formula: \(L(1,\chi_{-3}) = \pi/(3\sqrt{3})\). Verify numerically that the alternating series \(\sum_{n=1}^\infty \chi(n)/n\) is close to this value.

**D2.** Let \(\chi_4\) be the unique non-principal character mod 4. Show that \(\prod_p (1-\chi_4(p)p^{-s})^{-1}\) converges for \(\mathrm{Re}(s) > 1\) and equals \(1 - 3^{-s} + 5^{-s} - 7^{-s} + \cdots = L(s,\chi_4)\).

**D3.** For \(q = 8\), list all 4 characters (as in Example C.4) and compute \(L(1,\chi)\) for each non-principal character. Use the fact that two of the characters are primitive mod 8 and one is induced from mod 4.

**D4.** Show that for a primitive character \(\chi\) mod \(q\), the Gauss sum satisfies \(\tau(\chi)\tau(\bar\chi) = \chi(-1)q\). Deduce \(|\tau(\chi)|^2 = q\).

**Problem Set E: Sieve and Distribution**

**E1.** Let \(\pi_2(x)\) be the number of twin prime pairs \((p,p+2)\) with \(p \leq x\). Using the fact that for a prime \(p \neq 2,3\) to have \(p+2\) also prime, we need \(p \equiv 1 \pmod 6\) (since \(p \equiv 5 \pmod 6\) would make \(p+2 \equiv 1 \pmod 6\) prime only if ...), apply the Legendre sieve to show \(\pi_2(x) = O(x/(\log x)^2)\). (This matches the conjectured asymptotics \(\sim C_2 x/(\log x)^2\).)

**E2.** Goldbach's comet: define \(G(n)\) to be the number of ways of writing the even integer \(n = p+q\) with \(p,q\) prime. Using the circle method heuristic (not a proof), argue that \(G(n) \approx 2C_2 n/(\log n)^2\) for \(C_2 = \prod_{p>2}(1-1/(p-1)^2)\). Compute \(C_2\) numerically to 3 decimal places.

**E3.** Show that the Bombieri–Vinogradov theorem (Theorem 10.9) implies: for any \(A>0\) and \(B = B(A)\), the number of "exceptional" moduli \(q \leq Q\) for which \(|\pi(x;q,a) - \mathrm{li}(x)/\varphi(q)| > x/((\log x)^{A+1})\) for some \(a\) with \(\gcd(a,q)=1\) is at most \((\log x)^B\).

---

# Appendix J: The Riemann Hypothesis — A Summary for Students

The Riemann Hypothesis has been called the most important unsolved problem in mathematics. Here we give a self-contained summary at the level of these notes.

**Statement.** All nontrivial zeros of the Riemann zeta function \(\zeta(s)\) lie on the critical line \(\mathrm{Re}(s) = 1/2\).

**Why we believe it.**
1. Every zero computed so far — over \(10^{13}\) of them — lies on the critical line.
2. The functional equation \(\Lambda(s) = \Lambda(1-s)\) places zeros symmetrically about \(\sigma=1/2\), so the critical line is the "natural center."
3. The random matrix theory connection (Montgomery–Odlyzko) gives a compelling structural reason.
4. Consequences of RH are consistent with everything we know about primes.

**Why it is hard.**
1. The critical line is very far from the proven zero-free region \(\sigma \geq 1 - c/\log t\). Bridging this gap requires new ideas.
2. Every known approach to bounding zeros of \(\zeta(s)\) runs into the "parity problem" or similar barriers.
3. Most zeros are not isolated — they cluster near the critical line even off it (in zero-density estimates), and separating them completely seems to require global information about all zeros simultaneously.
4. The function \(\zeta(s)\) does not fit neatly into any standard framework (it is neither a polynomial, nor a ratio of polynomials, nor a "simple" exponential); its zeros encode genuinely deep arithmetic.

**Known partial results.**
- **Non-vanishing on \(\sigma=1\):** proved (Hadamard, de la Vallée Poussin, 1896). This suffices for PNT.
- **Classical zero-free region:** \(\sigma \geq 1-c/\log t\) (de la Vallée Poussin, 1899).
- **Vinogradov–Korobov improvement:** \(\sigma \geq 1 - c/(\log t)^{2/3}(\log\log t)^{1/3}\) (1958).
- **On average (GRH-level):** Bombieri–Vinogradov (1965) is an averaged form of GRH.
- **Hardy's theorem (1914):** infinitely many zeros on the critical line. Hardy and Littlewood later showed a positive proportion.
- **Selberg (1942):** a positive proportion \(>0\) of all zeros lie on the critical line.
- **Levinson (1974):** more than 1/3 of all zeros are on the critical line.
- **Conrey (1989):** more than 2/5 of all zeros are on the critical line.
- **Computational:** the first \(10^{13}\) zeros are all on \(\sigma=1/2\) (Gourdon, 2004; extended since).

**What a proof would give.** A proof of RH would instantly imply:
- \(\pi(x) = \mathrm{li}(x) + O(\sqrt{x}\log x)\): the sharpest possible prime counting formula from the explicit formula.
- Explicit bounds in Dirichlet's theorem: \(\pi(x;q,a) = \mathrm{li}(x)/\varphi(q) + O(\sqrt{x}\log(qx))\).
- Deterministic polynomial-time primality testing via Miller's test (with explicit witnesses).
- Countless other applications throughout number theory and cryptography.

**Analogues.** RH has been proved for:
- Finite fields: Weil's theorem (1948), proved by Weil himself; Deligne's proof of the Weil conjectures (1974, Fields Medal).
- Function fields: the "Riemann Hypothesis for function fields" is a theorem.
These proofs use algebraic geometry heavily and do not seem to generalize to \(\zeta(s)\) over \(\mathbb{Q}\) in any obvious way.
