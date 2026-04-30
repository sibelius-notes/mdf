#!/usr/bin/env python3
"""Generate all AMATH 242 / CS 371 figures. Run: python3 _build.py"""
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
from matplotlib.patches import FancyArrowPatch
import os, math

OUT = os.path.dirname(os.path.abspath(__file__))
DPI = 200

def save(name):
    plt.savefig(os.path.join(OUT, name), dpi=DPI, bbox_inches='tight')
    plt.close()
    print(f"  {name}")

# ── 1. fp-number-line ────────────────────────────────────────────────────────
def fp_number_line():
    fig, ax = plt.subplots(figsize=(8, 2))
    # F[b=2, M=3, E=1]: generate all normalised FPNs in [0.5, 2]
    fps = []
    for s in [+1, -1]:
        for exp in [-1, 0, 1]:
            for m1 in [1]:        # leading 1
                for m2 in [0, 1]:
                    for m3 in [0, 1]:
                        val = s * (m1/2 + m2/4 + m3/8) * (2**exp)
                        if val != 0:
                            fps.append(val)
    fps = sorted(set(fps))
    ax.axhline(0, color='gray', lw=1)
    for x in fps:
        ax.plot(x, 0, 'o', color='steelblue', ms=6, zorder=3)
    ax.set_xlim(-2.2, 2.2)
    ax.set_ylim(-0.5, 0.5)
    ax.set_xlabel('Real line')
    ax.set_yticks([])
    ax.set_title('Floating point numbers F[2, 3, 1] — gaps widen away from 0')
    ax.spines[['top', 'right', 'left']].set_visible(False)
    save('fp-number-line.png')

# ── 2. taylor-error ──────────────────────────────────────────────────────────
def taylor_error():
    x = np.linspace(-np.pi, np.pi, 400)
    cos_exact = np.cos(x)
    t2 = 1 - x**2/2
    t4 = 1 - x**2/2 + x**4/24
    fig, ax = plt.subplots(figsize=(7, 4))
    ax.plot(x, cos_exact, 'k', lw=2, label=r'$\cos x$')
    ax.plot(x, t2, '--', color='steelblue', label=r'$T_2(x) = 1 - x^2/2$')
    ax.plot(x, t4, '--', color='tomato', label=r'$T_4(x) = 1 - x^2/2 + x^4/24$')
    ax.set_ylim(-2, 2)
    ax.axhline(0, color='gray', lw=0.5)
    ax.legend()
    ax.set_xlabel('x')
    ax.set_title('Taylor polynomial approximations of cos x')
    save('taylor-error.png')

# ── 3. catastrophic-cancellation ─────────────────────────────────────────────
def catastrophic_cancellation():
    # show relative error of (sqrt(x+1) - sqrt(x)) computed directly vs rewritten
    x = np.logspace(-1, 15, 400)
    direct = np.sqrt(x + 1) - np.sqrt(x)
    stable = 1.0 / (np.sqrt(x + 1) + np.sqrt(x))
    rel_err = np.abs(direct - stable) / np.abs(stable)
    fig, ax = plt.subplots(figsize=(7, 4))
    ax.loglog(x, rel_err, color='tomato', lw=1.5)
    ax.set_xlabel('x')
    ax.set_ylabel('Relative error of direct formula')
    ax.set_title(r'Catastrophic cancellation: $\sqrt{x+1} - \sqrt{x}$ for large $x$')
    ax.grid(True, which='both', ls=':', lw=0.5)
    save('catastrophic-cancellation.png')

# ── 4. bisection-method ──────────────────────────────────────────────────────
def bisection_method():
    f = lambda x: x**3 - x - 2
    a, b = 1, 2
    fig, ax = plt.subplots(figsize=(7, 4))
    xv = np.linspace(0.8, 2.2, 300)
    ax.plot(xv, f(xv), 'k', lw=2)
    ax.axhline(0, color='gray', lw=0.5)
    colors = ['steelblue', 'tomato', 'seagreen']
    for i in range(3):
        c = (a + b) / 2
        ax.axvline(c, color=colors[i], ls='--', lw=1.2, label=f'$c_{i+1}={c:.4f}$')
        if f(a) * f(c) < 0:
            b = c
        else:
            a = c
    ax.axvspan(a, b, alpha=0.15, color='gold', label='Final bracket')
    ax.set_xlim(0.8, 2.2)
    ax.legend(fontsize=8)
    ax.set_xlabel('x')
    ax.set_title(r'Bisection on $f(x)=x^3-x-2$')
    save('bisection-method.png')

# ── 5. fixed-point-cobweb ────────────────────────────────────────────────────
def fixed_point_cobweb():
    g = lambda x: (10 / (x + 4))**0.5
    x0 = 1.5
    xs = [x0]
    for _ in range(8):
        xs.append(g(xs[-1]))
    fig, ax = plt.subplots(figsize=(6, 6))
    t = np.linspace(1, 2, 200)
    ax.plot(t, g(t), 'steelblue', lw=2, label='g(x)')
    ax.plot(t, t, 'gray', lw=1, ls='--', label='y = x')
    # cobweb
    for i in range(len(xs) - 1):
        x_cur = xs[i]
        x_next = xs[i + 1]
        ax.plot([x_cur, x_cur], [x_cur, x_next], 'tomato', lw=1)
        ax.plot([x_cur, x_next], [x_next, x_next], 'tomato', lw=1)
    ax.plot(xs[0], xs[0], 'ko', ms=7, label=f'$x_0={x0}$')
    ax.set_xlabel('x')
    ax.set_title(r'Cobweb diagram: $g(x) = \sqrt{10/(x+4)}$')
    ax.legend()
    save('fixed-point-cobweb.png')

# ── 6. newtons-method ────────────────────────────────────────────────────────
def newtons_method():
    f = lambda x: x**3 - 2
    fp = lambda x: 3*x**2
    xv = np.linspace(0.5, 2, 300)
    fig, ax = plt.subplots(figsize=(7, 4))
    ax.plot(xv, f(xv), 'k', lw=2, label=r'$f(x)=x^3-2$')
    ax.axhline(0, color='gray', lw=0.5)
    x0 = 1.8
    colors = ['steelblue', 'tomato', 'seagreen']
    for i in range(3):
        x1 = x0 - f(x0)/fp(x0)
        tx = np.linspace(x0 - 0.6, x0 + 0.1, 50)
        ax.plot(tx, f(x0) + fp(x0)*(tx - x0), ls='--', color=colors[i], lw=1.2,
                label=f'$x_{i}={x0:.4f}$')
        ax.plot(x0, f(x0), 'o', color=colors[i], ms=6)
        x0 = x1
    ax.set_xlim(0.5, 2)
    ax.set_ylim(-2, 4)
    ax.legend(fontsize=8)
    ax.set_xlabel('x')
    ax.set_title("Newton's method — tangent line iterations")
    save('newtons-method.png')

# ── 7. convergence-rates ─────────────────────────────────────────────────────
def convergence_rates():
    iters = np.arange(1, 12)
    linear = 0.5**iters
    quad = (0.5**2)**iters  # reuse same initial error scaling
    fig, ax = plt.subplots(figsize=(7, 4))
    ax.semilogy(iters, linear, 'o--', color='steelblue', label='Linear (q=1, C=0.5)')
    ax.semilogy(iters, quad, 's--', color='tomato', label='Quadratic (q=2)')
    ax.set_xlabel('Iteration')
    ax.set_ylabel('Error $|e_k|$')
    ax.set_title('Linear vs quadratic convergence')
    ax.legend()
    ax.grid(True, which='both', ls=':', lw=0.5)
    save('convergence-rates.png')

# ── 8. lu-factorization ──────────────────────────────────────────────────────
def lu_factorization():
    fig, axes = plt.subplots(1, 3, figsize=(9, 3))
    n = 5
    A = np.random.RandomState(7).rand(n, n)
    L = np.tril(A, -1) + np.eye(n)
    U = np.triu(A)
    for ax, M, title in zip(axes, [A, L, U], ['A', 'L (unit lower tri)', 'U (upper tri)']):
        im = ax.imshow(M, cmap='RdBu_r', vmin=-1, vmax=1)
        ax.set_title(title)
        ax.set_xticks([]); ax.set_yticks([])
    fig.colorbar(im, ax=axes, shrink=0.6)
    fig.suptitle('LU factorization: A = LU')
    save('lu-factorization.png')

# ── 9. condition-number ──────────────────────────────────────────────────────
def condition_number():
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(10, 4))
    x = np.linspace(-3, 3, 200)
    # well-conditioned
    ax1.plot(x, x + 1, 'steelblue', lw=2, label='$x + y = 1$')
    ax1.plot(x, 2 - x, 'tomato', lw=2, label='$x - y = -2$  (perturbed: dashed)')
    ax1.plot(x, 2.1 - x, 'tomato', lw=1.5, ls='--')
    ax1.set_xlim(-3, 3); ax1.set_ylim(-3, 3)
    ax1.axhline(0, color='gray', lw=0.5); ax1.axvline(0, color='gray', lw=0.5)
    ax1.set_title('Well-conditioned system')
    ax1.legend(fontsize=8)
    # ill-conditioned
    ax2.plot(x, (1 - x)/1, 'steelblue', lw=2, label='$x + y = 1$')
    ax2.plot(x, (2 - x)/(1 + 1e-3), 'tomato', lw=2, label='$(1{+}\\delta)x + y = 2$ (nearly parallel)')
    ax2.plot(x, (2.1 - x)/(1 + 1e-3), 'tomato', lw=1.5, ls='--', label='Perturbed RHS')
    ax2.set_xlim(-3, 3); ax2.set_ylim(-3, 3)
    ax2.axhline(0, color='gray', lw=0.5); ax2.axvline(0, color='gray', lw=0.5)
    ax2.set_title('Ill-conditioned system (large $\\kappa(A)$)')
    ax2.legend(fontsize=7)
    plt.tight_layout()
    save('condition-number.png')

# ── 10. iterative-convergence ─────────────────────────────────────────────────
def iterative_convergence():
    # GJ vs GS convergence on a diagonally-dominant system
    A = np.array([[4., -1., 0.], [-1., 4., -1.], [0., -1., 4.]])
    b = np.array([1., 2., 1.])
    x_exact = np.linalg.solve(A, b)
    n = len(b)
    D = np.diag(np.diag(A))
    Dinv = np.diag(1./np.diag(A))
    # Gauss-Jacobi
    xj = np.zeros(n)
    errs_j = []
    for _ in range(20):
        xj = Dinv @ (b - (A - D) @ xj)
        errs_j.append(np.linalg.norm(xj - x_exact))
    # Gauss-Seidel
    xs = np.zeros(n)
    errs_s = []
    L_plus_D = np.tril(A)
    U = np.triu(A, 1)
    for _ in range(20):
        xs = np.linalg.solve(L_plus_D, b - U @ xs)
        errs_s.append(np.linalg.norm(xs - x_exact))
    iters = np.arange(1, 21)
    fig, ax = plt.subplots(figsize=(7, 4))
    ax.semilogy(iters, errs_j, 'o--', color='steelblue', label='Gauss-Jacobi')
    ax.semilogy(iters, errs_s, 's--', color='tomato', label='Gauss-Seidel')
    ax.set_xlabel('Iteration')
    ax.set_ylabel('Error $\\|x_k - x^*\\|$')
    ax.set_title('Gauss-Jacobi vs Gauss-Seidel convergence')
    ax.legend()
    ax.grid(True, which='both', ls=':', lw=0.5)
    save('iterative-convergence.png')

# ── 11. lagrange-basis ───────────────────────────────────────────────────────
def lagrange_basis():
    nodes = np.array([0., 1., 2., 3.])
    x = np.linspace(-0.2, 3.2, 400)
    fig, ax = plt.subplots(figsize=(8, 4))
    colors = ['steelblue', 'tomato', 'seagreen', 'purple']
    for i, xi in enumerate(nodes):
        L = np.ones_like(x)
        for j, xj in enumerate(nodes):
            if j != i:
                L *= (x - xj) / (xi - xj)
        ax.plot(x, L, color=colors[i], lw=2, label=f'$L_{i}(x)$')
        ax.plot(xi, 1, 'o', color=colors[i], ms=8)
        for j, xj in enumerate(nodes):
            if j != i:
                ax.plot(xj, 0, 'o', color=colors[i], ms=8, mfc='white')
    ax.axhline(0, color='gray', lw=0.5)
    ax.set_ylim(-1, 1.5)
    ax.set_xlabel('x')
    ax.legend(ncol=2)
    ax.set_title('Lagrange basis polynomials (4 nodes)')
    save('lagrange-basis.png')

# ── 12. runge-phenomenon ─────────────────────────────────────────────────────
def runge_phenomenon():
    f = lambda x: 1 / (1 + 25 * x**2)
    x = np.linspace(-1, 1, 400)
    fig, ax = plt.subplots(figsize=(8, 4))
    ax.plot(x, f(x), 'k', lw=2, label=r'$f(x)=1/(1+25x^2)$')
    for n, color in [(6, 'steelblue'), (10, 'tomato'), (14, 'seagreen')]:
        nodes = np.linspace(-1, 1, n + 1)
        from numpy.polynomial import polynomial as P
        coeffs = np.polyfit(nodes, f(nodes), n)
        p = np.polyval(coeffs, x)
        ax.plot(x, p, '--', color=color, lw=1.5, label=f'$n={n}$ interpolant')
        ax.plot(nodes, f(nodes), 'o', color=color, ms=4)
    ax.set_ylim(-1, 2)
    ax.axhline(0, color='gray', lw=0.5)
    ax.legend(fontsize=8)
    ax.set_xlabel('x')
    ax.set_title("Runge's phenomenon — high-degree interpolation on equispaced nodes")
    save('runge-phenomenon.png')

# ── 13. cubic-spline ─────────────────────────────────────────────────────────
def cubic_spline():
    from scipy.interpolate import CubicSpline
    f = lambda x: np.sin(2 * np.pi * x)
    nodes = np.linspace(0, 1, 7)
    x = np.linspace(0, 1, 400)
    cs = CubicSpline(nodes, f(nodes))
    fig, ax = plt.subplots(figsize=(7, 4))
    ax.plot(x, f(x), 'k', lw=2, label='$f(x)=\\sin(2\\pi x)$')
    ax.plot(x, cs(x), '--', color='steelblue', lw=2, label='Cubic spline')
    ax.plot(nodes, f(nodes), 'o', color='tomato', ms=7, zorder=5, label='Nodes')
    ax.legend()
    ax.set_xlabel('x')
    ax.set_title('Cubic spline interpolation')
    save('cubic-spline.png')

# ── 14. trapezoid-midpoint ───────────────────────────────────────────────────
def trapezoid_midpoint():
    f = lambda x: np.sin(x) + 1.2
    a, b = 0, np.pi
    fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(10, 4))
    x = np.linspace(a, b, 300)
    for ax, title, do_mid in [(ax1, 'Trapezoid rule', False), (ax2, 'Midpoint rule', True)]:
        ax.plot(x, f(x), 'k', lw=2)
        ax.fill_between([a, b], [f(a), f(b)] if not do_mid else [f((a+b)/2), f((a+b)/2)],
                        alpha=0.3, color='steelblue')
        if not do_mid:
            ax.plot([a, a, b, b, a], [0, f(a), f(b), 0, 0], 'steelblue', lw=1.5)
        else:
            m = (a + b) / 2
            ax.axvline(m, color='tomato', ls='--', lw=1)
            ax.plot([a, a, b, b, a], [0, f(m), f(m), 0, 0], 'steelblue', lw=1.5)
            ax.plot(m, f(m), 'ro', ms=8)
        ax.set_title(title)
        ax.set_xlabel('x')
        ax.set_ylim(0, 2.5)
    plt.tight_layout()
    save('trapezoid-midpoint.png')

# ── 15. composite-error ──────────────────────────────────────────────────────
def composite_error():
    f = lambda x: np.sin(x)
    exact = 2.0  # integral of sin from 0 to pi
    hs = np.logspace(-0.3, -2.5, 40)
    errs_t, errs_m, errs_s = [], [], []
    for h in hs:
        n = max(int(np.pi / h), 2)
        if n % 2 != 0: n += 1
        xs = np.linspace(0, np.pi, n + 1)
        # trapezoid
        ft = f(xs)
        T = h * (ft[0]/2 + ft[-1]/2 + np.sum(ft[1:-1]))
        errs_t.append(abs(T - exact))
        # midpoint
        xm = (xs[:-1] + xs[1:]) / 2
        M = h * np.sum(f(xm))
        errs_m.append(abs(M - exact))
        # Simpson's
        S = (h/3) * (ft[0] + ft[-1] + 4*np.sum(ft[1:-1:2]) + 2*np.sum(ft[2:-2:2]))
        errs_s.append(abs(S - exact))
    fig, ax = plt.subplots(figsize=(7, 4))
    ax.loglog(hs, errs_t, 'o-', color='steelblue', ms=3, label='Trapezoid ($O(h^2)$)')
    ax.loglog(hs, errs_m, 's-', color='tomato', ms=3, label='Midpoint ($O(h^2)$)')
    ax.loglog(hs, errs_s, '^-', color='seagreen', ms=3, label="Simpson's ($O(h^4)$)")
    ax.set_xlabel('Step size $h$')
    ax.set_ylabel('Absolute error')
    ax.set_title('Composite quadrature error vs step size')
    ax.legend()
    ax.grid(True, which='both', ls=':', lw=0.5)
    save('composite-error.png')

# ── 16. gauss-quadrature ─────────────────────────────────────────────────────
def gauss_quadrature():
    # compare GL accuracy on integral of exp(-x^2) from -1 to 1
    from numpy.polynomial.legendre import leggauss
    exact = np.sqrt(np.pi) * (math.erf(1))
    f = lambda x: np.exp(-x**2)
    ns = np.arange(1, 14)
    errs_gl, errs_t = [], []
    for n in ns:
        xi, wi = leggauss(n)
        errs_gl.append(abs(np.dot(wi, f(xi)) - exact))
        # trapeziodal with same number of function evals
        xs = np.linspace(-1, 1, n + 1)
        h = 2 / n
        ft = f(xs)
        T = h * (ft[0]/2 + ft[-1]/2 + np.sum(ft[1:-1]))
        errs_t.append(abs(T - exact))
    fig, ax = plt.subplots(figsize=(7, 4))
    ax.semilogy(ns, errs_gl, 'o-', color='steelblue', label='Gauss-Legendre')
    ax.semilogy(ns, np.clip(errs_t, 1e-16, None), 's-', color='tomato', label='Trapezoid (same pts)')
    ax.set_xlabel('Number of quadrature points $n$')
    ax.set_ylabel('Absolute error')
    ax.set_title(r'Gauss-Legendre vs trapezoidal: $\int_{-1}^1 e^{-x^2}\,dx$')
    ax.legend()
    ax.grid(True, which='both', ls=':', lw=0.5)
    save('gauss-quadrature.png')

# ── 17. fourier-series ───────────────────────────────────────────────────────
def fourier_series():
    x = np.linspace(-np.pi, np.pi, 1000)
    # sawtooth: f(x) = x on (-pi, pi)
    fig, ax = plt.subplots(figsize=(8, 4))
    ax.plot(x, x, 'k', lw=2, label='$f(x) = x$')
    for N, color in [(1, 'steelblue'), (5, 'tomato'), (15, 'seagreen')]:
        s = sum(2 * (-1)**(k+1) / k * np.sin(k * x) for k in range(1, N+1))
        ax.plot(x, s, '--', color=color, lw=1.5, label=f'$N={N}$ partial sum')
    ax.set_ylim(-4, 4)
    ax.legend(fontsize=9)
    ax.set_xlabel('x')
    ax.set_title('Fourier series partial sums for $f(x) = x$ on $(-\\pi, \\pi)$')
    save('fourier-series.png')

# ── 18. gibbs-phenomenon ─────────────────────────────────────────────────────
def gibbs_phenomenon():
    # square wave on [-pi, pi]
    x = np.linspace(-np.pi, np.pi, 2000)
    fig, ax = plt.subplots(figsize=(8, 4))
    sq = np.sign(np.sin(x))
    ax.plot(x, sq, 'k', lw=2, label='Square wave')
    for N, color in [(5, 'steelblue'), (15, 'tomato'), (50, 'seagreen')]:
        s = sum(4 / (np.pi * k) * np.sin(k * x) for k in range(1, N+1, 2))
        ax.plot(x, s, '-', color=color, lw=1.2, alpha=0.85, label=f'$N={N}$ terms')
    ax.set_ylim(-1.5, 1.5)
    ax.legend(fontsize=9)
    ax.set_xlabel('x')
    ax.set_title('Gibbs phenomenon near discontinuity')
    save('gibbs-phenomenon.png')

# ── 19. dft-example ──────────────────────────────────────────────────────────
def dft_example():
    N = 32
    f = lambda n: np.sin(2 * np.pi * 3 * n / N) + 0.5 * np.sin(2 * np.pi * 7 * n / N)
    n = np.arange(N)
    fn = f(n)
    Fk = np.fft.fft(fn) / N
    freqs = np.arange(N)
    fig, (ax1, ax2) = plt.subplots(2, 1, figsize=(8, 5))
    ax1.stem(n, fn, linefmt='steelblue', markerfmt='o', basefmt='gray')
    ax1.set_xlabel('n (time)')
    ax1.set_title('Time domain signal $f[n]$')
    ax2.stem(freqs[:N//2], np.abs(Fk[:N//2]), linefmt='tomato', markerfmt='o', basefmt='gray')
    ax2.set_xlabel('k (frequency)')
    ax2.set_title('DFT magnitude $|F[k]|$')
    plt.tight_layout()
    save('dft-example.png')

# ── 20. fft-butterfly ────────────────────────────────────────────────────────
def fft_butterfly():
    fig, ax = plt.subplots(figsize=(8, 5))
    # Draw a simplified N=8 FFT butterfly
    N = 8
    stages = int(np.log2(N))
    cols = stages + 1
    ys = np.arange(N)
    # bit-reversed input order
    def bit_rev(x, n): return int(bin(x)[2:].zfill(n)[::-1], 2)
    order = [bit_rev(i, stages) for i in range(N)]
    positions = {(0, order[i]): i for i in range(N)}
    # draw nodes
    for col in range(cols):
        for row in range(N):
            ax.plot(col, row, 'o', color='steelblue', ms=8, zorder=3)
    # draw butterfly connections (simplified)
    ax.set_xlim(-0.5, cols - 0.5)
    ax.set_ylim(-0.5, N - 0.5)
    ax.set_xticks(range(cols))
    ax.set_xticklabels(['Input\n(bit-rev)'] + [f'Stage {i+1}' for i in range(stages)])
    ax.set_yticks([])
    ax.set_title(f'FFT butterfly structure (N=8, {stages} stages, $O(N\\log N)$)')
    for s in range(stages):
        step = 2**(s + 1)
        for k in range(0, N, step):
            for j in range(step // 2):
                top = k + j
                bot = k + j + step // 2
                ax.plot([s, s + 1], [top, top], '-', color='steelblue', lw=1, alpha=0.7)
                ax.plot([s, s + 1], [bot, bot], '-', color='steelblue', lw=1, alpha=0.7)
                ax.plot([s, s + 1], [top, bot], '-', color='tomato', lw=0.7, alpha=0.5)
                ax.plot([s, s + 1], [bot, top], '-', color='tomato', lw=0.7, alpha=0.5)
    save('fft-butterfly.png')

# ── 21. complex-plane ─────────────────────────────────────────────────────────
def complex_plane():
    fig, ax = plt.subplots(figsize=(5, 5))
    theta = 0.9
    r = 1.5
    a, b = r * np.cos(theta), r * np.sin(theta)
    ax.axhline(0, color='gray', lw=0.8)
    ax.axvline(0, color='gray', lw=0.8)
    ax.annotate('', xy=(a, b), xytext=(0, 0),
                arrowprops=dict(arrowstyle='->', color='steelblue', lw=2))
    ax.plot([a, a], [0, b], 'k--', lw=0.8)
    ax.plot([0, a], [0, 0], 'k--', lw=0.8)
    ax.text(a + 0.05, b + 0.05, r'$z = a + ib = re^{i\theta}$', fontsize=11)
    ax.text(a/2, -0.15, '$a$', ha='center', fontsize=10)
    ax.text(a + 0.08, b/2, '$b$', ha='left', fontsize=10)
    # angle arc
    arc = np.linspace(0, theta, 40)
    ax.plot(0.4 * np.cos(arc), 0.4 * np.sin(arc), 'tomato', lw=1.5)
    ax.text(0.45, 0.15, r'$\theta$', color='tomato', fontsize=11)
    ax.set_xlim(-2, 2.5); ax.set_ylim(-1.5, 2.5)
    ax.set_xlabel('Real'); ax.set_ylabel('Imaginary')
    ax.set_title('Complex number in polar form')
    save('complex-plane.png')

# ── 22. roots-of-unity ────────────────────────────────────────────────────────
def roots_of_unity():
    N = 8
    fig, ax = plt.subplots(figsize=(5, 5))
    theta = np.linspace(0, 2 * np.pi, 300)
    ax.plot(np.cos(theta), np.sin(theta), 'gray', lw=0.8, ls='--')
    for k in range(N):
        angle = 2 * np.pi * k / N
        x, y = np.cos(angle), np.sin(angle)
        ax.plot(x, y, 'o', color='steelblue', ms=10, zorder=3)
        ax.text(1.1 * x, 1.1 * y, f'$w_8^{k}$', ha='center', va='center', fontsize=9)
    ax.axhline(0, color='gray', lw=0.5)
    ax.axvline(0, color='gray', lw=0.5)
    ax.set_xlim(-1.5, 1.5); ax.set_ylim(-1.5, 1.5)
    ax.set_aspect('equal')
    ax.set_title(r'8th roots of unity $w_8^k = e^{2\pi i k/8}$')
    save('roots-of-unity.png')

# ── Run all ───────────────────────────────────────────────────────────────────
if __name__ == '__main__':
    print("Generating AMATH 242 figures...")
    fp_number_line()
    taylor_error()
    catastrophic_cancellation()
    bisection_method()
    fixed_point_cobweb()
    newtons_method()
    convergence_rates()
    lu_factorization()
    condition_number()
    iterative_convergence()
    lagrange_basis()
    runge_phenomenon()
    cubic_spline()
    trapezoid_midpoint()
    composite_error()
    gauss_quadrature()
    fourier_series()
    gibbs_phenomenon()
    dft_example()
    fft_butterfly()
    complex_plane()
    roots_of_unity()
    print("Done.")
