"""Generate all matplotlib figures for AMATH 251 notes."""
import math
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import matplotlib.patches as mpatch
from matplotlib.patches import FancyArrowPatch, Arc
import os

OUT = os.path.dirname(os.path.abspath(__file__))

def save(name):
    plt.savefig(os.path.join(OUT, name), dpi=200, bbox_inches='tight')
    plt.close()
    print(f"  {name}")

plt.rcParams.update({
    'font.size': 11,
    'axes.labelsize': 12,
    'axes.titlesize': 12,
    'lines.linewidth': 1.8,
    'axes.spines.top': False,
    'axes.spines.right': False,
})

# ── 1. dep-indep-vars.png ──────────────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(5, 3.5))
x = np.linspace(0, 2*np.pi, 300)
y = np.sin(x) + 0.2*x
ax.plot(x, y, 'steelblue', lw=2)
ax.set_xlabel('independent variable  $x$')
ax.set_ylabel('dependent variable  $y(x)$')
ax.set_title('$y\' = f(x,y)$: knowing $x$ determines the slope')
ax.annotate('solution curve', xy=(4, 1.2), xytext=(3.2, 2),
            arrowprops=dict(arrowstyle='->', color='gray'), fontsize=10, color='gray')
save('dep-indep-vars.png')

# ── 2. existence-rectangle.png ─────────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(5, 4))
ax.add_patch(mpatches.FancyBboxPatch((0.5, 0.8), 3.0, 2.2,
    boxstyle='square,pad=0', edgecolor='steelblue', facecolor='#e8f4fc', lw=2))
x0, y0 = 2.0, 1.9
ax.plot(x0, y0, 'o', color='#c0392b', ms=8, zorder=5)
ax.annotate(r'$(x_0, y_0)$', xy=(x0, y0), xytext=(x0+0.2, y0+0.2), fontsize=11)
ax.annotate('', xy=(x0+0.001, y0), xytext=(0.5, y0),
            arrowprops=dict(arrowstyle='<->', color='#27ae60', lw=1.5))
ax.text(1.2, y0+0.15, r'$I$', color='#27ae60', fontsize=12)
ax.text(3.7, 1.9, r'$R$', color='steelblue', fontsize=13)
ax.set_xlim(0, 5); ax.set_ylim(0, 4)
ax.set_xlabel('$x$'); ax.set_ylabel('$y$')
ax.set_title('Existence & Uniqueness rectangle $R$')
save('existence-rectangle.png')

# ── 3. slope-field-cosine.png ──────────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(6, 4))
xs, ys = np.meshgrid(np.linspace(-np.pi, 3*np.pi, 18), np.linspace(-2.5, 2.5, 14))
dxs = np.ones_like(xs); dys = np.cos(xs)
norm = np.sqrt(1 + dys**2)
ax.quiver(xs, ys, dxs/norm, dys/norm, alpha=0.4, color='gray',
          scale=20, headwidth=3, headlength=4)
for C in [-1, 0, 1.5]:
    xv = np.linspace(-np.pi, 3*np.pi, 400)
    yv = np.sin(xv) + C
    ax.plot(xv, yv, lw=2)
ax.set_xlim(-np.pi, 3*np.pi); ax.set_ylim(-2.5, 2.5)
ax.set_xlabel('$x$'); ax.set_ylabel('$y$')
ax.set_title(r"Slope field: $y' = \cos x$, three particular solutions")
save('slope-field-cosine.png')

# ── 4. slope-field-yoverx.png ──────────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(6, 4))
xs, ys = np.meshgrid(np.linspace(-2.5, 2.5, 20), np.linspace(-2.5, 2.5, 20))
with np.errstate(divide='ignore', invalid='ignore'):
    dys = np.where(np.abs(xs) > 0.05, ys/xs, np.nan)
dxs = np.ones_like(xs)
norm = np.sqrt(1 + np.where(np.isnan(dys), 0, dys)**2)
ax.quiver(xs, ys, dxs/norm, np.where(np.isnan(dys), 0, dys/norm),
          alpha=0.4, color='gray', scale=20, headwidth=3)
for C in [1.0, -0.5, 2.0, -1.5]:
    xv = np.linspace(0.05, 2.5, 200)
    ax.plot(xv, C*xv, lw=2)
    ax.plot(-xv, C*xv, lw=2, color=ax.lines[-1].get_color())
ax.axvline(0, color='#c0392b', lw=1.5, ls='--', label='$x=0$ singularity')
ax.set_xlim(-2.5, 2.5); ax.set_ylim(-2.5, 2.5)
ax.set_xlabel('$x$'); ax.set_ylabel('$y$')
ax.set_title(r"Slope field: $y' = y/x$ — IVP at $y(0)=5$ fails")
ax.legend(fontsize=9)
save('slope-field-yoverx.png')

# ── 5. slope-field-2xsqrty.png ─────────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(6, 4))
xs, ys = np.meshgrid(np.linspace(-2, 2, 18), np.linspace(-0.2, 2, 14))
with np.errstate(invalid='ignore'):
    dys = np.where(ys >= 0, 2*xs*np.sqrt(np.maximum(ys,0)), np.nan)
dxs = np.ones_like(xs)
norm = np.sqrt(1 + np.where(np.isnan(dys), 0, dys)**2)
ax.quiver(xs, ys, dxs/norm, np.where(np.isnan(dys),0,dys/norm),
          alpha=0.45, color='gray', scale=20, headwidth=3)
xv = np.linspace(-2, 2, 300)
ax.plot(xv, (xv**2/2)**2, 'steelblue', lw=2, label=r'$y=(x^2/2)^2$ ($C=0$)')
ax.axhline(0, color='#e67e22', lw=2, label=r'$y\equiv 0$')
ax.plot(0, 0, 'o', color='#c0392b', ms=9, zorder=5)
ax.annotate('$(0,0)$: two solutions', xy=(0,0), xytext=(0.3, 0.5),
            arrowprops=dict(arrowstyle='->', color='gray'), fontsize=10)
ax.set_xlim(-2, 2); ax.set_ylim(-0.2, 2)
ax.set_xlabel('$x$'); ax.set_ylabel('$y$')
ax.set_title(r"$y' = 2x\sqrt{y}$ — non-uniqueness at $(0,0)$")
ax.legend(fontsize=9)
save('slope-field-2xsqrty.png')

# ── 6. clepsydra.png ────────────────────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(4, 5))
ax.set_aspect('equal'); ax.axis('off')
# cylinder walls
cyl_x = [-0.6, 0.6]
cyl_y_top = 4.5; cyl_y_bot = 0.3
ax.plot([cyl_x[0]]*2, [cyl_y_bot, cyl_y_top], 'k', lw=2)
ax.plot([cyl_x[1]]*2, [cyl_y_bot, cyl_y_top], 'k', lw=2)
ax.plot(cyl_x, [cyl_y_top]*2, 'k', lw=2)
ax.plot(cyl_x, [cyl_y_bot]*2, 'k', lw=2)
# water fill
y_water = 2.8
ax.fill_betweenx([cyl_y_bot, y_water], cyl_x[0], cyl_x[1], color='#3498db', alpha=0.3)
ax.plot(cyl_x, [y_water]*2, color='#3498db', lw=2)
# y(t) arrow
ax.annotate('', xy=(0.75, y_water), xytext=(0.75, cyl_y_bot),
            arrowprops=dict(arrowstyle='<->', color='#27ae60', lw=1.5))
ax.text(0.82, (y_water+cyl_y_bot)/2, '$y(t)$', fontsize=12, color='#27ae60', va='center')
# hole
ax.fill_betweenx([cyl_y_bot-0.35, cyl_y_bot], -0.12, 0.12, color='k')
# outflow arrow
ax.annotate('', xy=(0, cyl_y_bot-0.9), xytext=(0, cyl_y_bot-0.35),
            arrowprops=dict(arrowstyle='->', color='#3498db', lw=2))
ax.text(0.18, cyl_y_bot-0.65, r'$\gamma\sqrt{2gy}$', fontsize=11, color='#3498db')
# labels
ax.text(-0.5, cyl_y_top+0.25, 'Clepsydra (water clock)', fontsize=11)
ax.text(-0.9, cyl_y_bot+0.4, 'area $A(y)$', fontsize=10, color='gray')
ax.text(-0.9, cyl_y_bot-0.3, 'hole area $a$', fontsize=10, color='gray')
ax.set_xlim(-1.2, 1.5); ax.set_ylim(-1.2, 5.2)
save('clepsydra.png')

# ── 7. boat-resistance.png ──────────────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(6, 3))
ax.axis('off')
# boat shape
boat_x = np.array([-1.8, -2, -1.8, 1.8, 2, 1.8, -1.8])
boat_y = np.array([0.2, 0, -0.3, -0.3, 0, 0.2, 0.2])
ax.fill(boat_x, boat_y, color='#d4a85a', alpha=0.7)
ax.plot(boat_x, boat_y, 'k', lw=1)
# velocity arrow
ax.annotate('', xy=(3.5, 0), xytext=(2.1, 0),
            arrowprops=dict(arrowstyle='->', color='steelblue', lw=2.5))
ax.text(3.6, 0.1, r'$v$', fontsize=14, color='steelblue')
# drag arrow
ax.annotate('', xy=(-3.5, 0), xytext=(-2.1, 0),
            arrowprops=dict(arrowstyle='->', color='#c0392b', lw=2.5))
ax.text(-4.2, 0.1, r'$F_{AR}=-kv^2$', fontsize=12, color='#c0392b')
# water
ax.fill_between([-4.5,4.5], [-0.3,-0.3], [-0.7,-0.7], color='#3498db', alpha=0.25)
ax.text(-0.5, -1.1, 'Motor off at $t=0$.  Motor boat decelerates toward $v(t)=0$', fontsize=10, ha='center')
ax.set_xlim(-5, 5); ax.set_ylim(-1.4, 0.8)
save('boat-resistance.png')

# ── 8. logistic-growth.png ──────────────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(6, 4.5))
t = np.linspace(0, 6, 400)
M, k = 5.0, 1.0
for P0, col in [(0.5,'#3498db'), (1.5,'#27ae60'), (7.0,'#e67e22')]:
    P = M*P0 / (P0 + (M-P0)*np.exp(-k*M*t))
    ax.plot(t, P, color=col, lw=2, label=f'$P_0={P0}$')
ax.axhline(M, color='#c0392b', ls='--', lw=1.5, label=f'$P=M={M}$ (stable)')
ax.axhline(0, color='gray', ls=':', lw=1.5, label='$P=0$ (unstable)')
ax.set_xlabel('$t$'); ax.set_ylabel('$P(t)$')
ax.set_title('Logistic growth: $P\'= kP(M-P)$')
ax.legend(fontsize=9)
ax.set_ylim(-0.3, 8.5)
save('logistic-growth.png')

# ── 9. harvesting-bifurcation.png ───────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(6, 4.5))
M, k = 5.0, 0.4
h_vals = np.linspace(0, k*M**2/4 * 1.3, 400)
h_crit = k*M**2/4
disc = M**2 - 4*h_vals/k
Mplus  = np.where(disc > 0, (M + np.sqrt(np.maximum(disc,0)))/2, np.nan)
Mminus = np.where(disc > 0, (M - np.sqrt(np.maximum(disc,0)))/2, np.nan)
ax.plot(h_vals, Mplus,  'steelblue', lw=2.5, label=r'$M_+$ (stable)')
ax.plot(h_vals, Mminus, '#c0392b',   lw=2.5, ls='--', label=r'$M_-$ (unstable)')
ax.axvline(h_crit, color='gray', ls=':', lw=1.5)
ax.text(h_crit+0.02, 0.3, r'$h_c = kM^2/4$', fontsize=10, color='gray')
ax.annotate('saddle-node\nbifurcation', xy=(h_crit, M/2), xytext=(h_crit*0.55, 3.5),
            arrowprops=dict(arrowstyle='->', color='gray'), fontsize=9, ha='center')
ax.fill_betweenx([0, M/2], h_crit, h_vals[-1], alpha=0.07, color='#c0392b', label='extinction zone')
ax.set_xlabel('harvest rate $h$'); ax.set_ylabel('equilibrium population')
ax.set_title('Logistic harvesting: equilibria vs $h$')
ax.legend(fontsize=9)
save('harvesting-bifurcation.png')

# ── 10. escape-velocity.png ─────────────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(6, 4))
R = 6.371e6; G = 6.674e-11; Mearth = 5.972e24
v_esc = np.sqrt(2*G*Mearth/R)
r = np.linspace(R, 8*R, 500)
for v0_fac, col, lbl in [(0.6,'steelblue','$v_0 < v_{esc}$ (returns)'),
                          (1.0,'#27ae60', r'$v_0 = v_{esc}$ (barely escapes)'),
                          (1.4,'#e67e22','$v_0 > v_{esc}$ (escapes)')]:
    v0 = v0_fac * v_esc
    v2 = v0**2 + 2*G*Mearth*(1/r - 1/R)
    v2 = np.where(v2 > 0, v2, np.nan)
    ax.plot(r/R, np.sqrt(v2)/1e3, color=col, lw=2, label=lbl)
ax.set_xlabel(r'$r / R_\oplus$'); ax.set_ylabel('speed  $v$ (km/s)')
ax.set_title('Escape velocity from Earth')
ax.legend(fontsize=9)
save('escape-velocity.png')

# ── 11. euler-vs-exact.png ──────────────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(7, 4))
# y' = x + y/5,  y(0) = -3, exact via Laplace/integrating factor
# General solution: y = Ce^(x/5) - 5x - 25
# y(0)=-3 => C = 22
f = lambda x, y: x + y/5
y_exact_fn = lambda x: 22*np.exp(x/5) - 5*x - 25
x0, y0_val = 0.0, -3.0

def euler(h, x_end=5):
    xs = [x0]; ys = [y0_val]
    x, y = x0, y0_val
    while x < x_end - 1e-10:
        y += h * f(x, y); x += h
        xs.append(x); ys.append(y)
    return np.array(xs), np.array(ys)

xf = np.linspace(0, 5, 400)
ax.plot(xf, y_exact_fn(xf), 'k', lw=2.5, label='Exact')
for h, col in [(1.0,'#c0392b'), (0.5,'#e67e22'), (0.2,'steelblue')]:
    xe, ye = euler(h)
    ax.plot(xe, ye, 'o--', color=col, ms=4, lw=1.5, label=f'Euler $h={h}$')
ax.set_xlabel('$x$'); ax.set_ylabel('$y$')
ax.set_title("Euler's method vs exact: $y'=x+y/5$, $y(0)=-3$")
ax.legend(fontsize=9)
save('euler-vs-exact.png')

# ── 12. improved-euler.png ──────────────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(7, 4))
h = 0.5
def improved_euler(h, x_end=5):
    xs = [x0]; ys = [y0_val]
    x, y = x0, y0_val
    while x < x_end - 1e-10:
        k1 = f(x, y); u = y + h*k1; k2 = f(x+h, u)
        y += h*(k1+k2)/2; x += h
        xs.append(x); ys.append(y)
    return np.array(xs), np.array(ys)

xf = np.linspace(0, 5, 400)
ax.plot(xf, y_exact_fn(xf), 'k', lw=2.5, label='Exact')
xe, ye = euler(h);           ax.plot(xe, ye, 's--', color='#c0392b', ms=6, lw=1.5, label=f'Euler $h={h}$')
xe2, ye2 = improved_euler(h); ax.plot(xe2, ye2, 'o-', color='steelblue', ms=6, lw=1.5, label=f'Improved Euler $h={h}$')
ax.set_xlabel('$x$'); ax.set_ylabel('$y$')
ax.set_title(f'Improved Euler vs Euler ($h={h}$)')
ax.legend(fontsize=9)
save('improved-euler.png')

# ── 13. picard-iteration.png ─────────────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(6, 4.5))
# y' = y cos x, y(0) = 1  => y = e^{sin x}
# Picard iterates: y_n = sum_{k=0}^{n} sin^k(x)/k!
x = np.linspace(-1.8, 1.8, 300)
y_exact = np.exp(np.sin(x))
for n, col in [(0,'#e74c3c'),(1,'#e67e22'),(2,'#f1c40f'),(4,'#27ae60'),(8,'steelblue')]:
    y_approx = sum(np.sin(x)**k / math.factorial(k) for k in range(n+1))
    ax.plot(x, y_approx, color=col, lw=1.8, label=f'$y_{n}$' if n <= 4 else f'$y_8$')
ax.plot(x, y_exact, 'k', lw=2.5, ls='--', label=r'Exact $e^{\sin x}$')
ax.set_xlabel('$x$'); ax.set_ylabel('$y$')
ax.set_title("Picard iteration: $y'=y\\cos x$, $y(0)=1$")
ax.legend(fontsize=9)
ax.set_ylim(0, 3)
save('picard-iteration.png')

# ── 14. pendulum-fbd.png ─────────────────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(4, 5))
ax.axis('off'); ax.set_aspect('equal')
# pivot
px, py = 0, 4.5
# rod at angle theta
theta = 0.42  # radians
L = 2.8
mx = px + L*np.sin(theta); my = py - L*np.cos(theta)
ax.plot([px, mx], [py, my], 'k', lw=2.5)
ax.plot(px, py, 'k^', ms=12)
ax.plot(mx, my, 'o', color='#c0392b', ms=18, zorder=5)
# angle arc
arc = Arc((px, py), 0.9, 0.9, angle=0, theta1=270-np.degrees(theta), theta2=270,
          color='steelblue', lw=1.5)
ax.add_patch(arc)
ax.text(px+0.1, py-0.6, r'$\theta$', fontsize=14, color='steelblue')
# L label
ax.text((px+mx)/2 - 0.35, (py+my)/2+0.1, r'$\ell$', fontsize=14)
# gravity arrow
ax.annotate('', xy=(mx, my-1.2), xytext=(mx, my-0.02),
            arrowprops=dict(arrowstyle='->', color='#27ae60', lw=2))
ax.text(mx+0.1, my-0.7, r'$mg$', fontsize=13, color='#27ae60')
# tangential component
tang_x = np.cos(theta); tang_y = np.sin(theta)
ax.annotate('', xy=(mx + 0.8*tang_x, my + 0.8*tang_y*0.3),
            xytext=(mx, my-0.02),
            arrowprops=dict(arrowstyle='->', color='#8e44ad', lw=1.8))
ax.text(mx + 0.85*tang_x + 0.05, my + 0.1, r'$mg\sin\theta$',
        fontsize=10, color='#8e44ad')
ax.set_xlim(-1.5, 3.5); ax.set_ylim(0.5, 5.5)
ax.set_title('Pendulum free-body diagram', y=0.98)
save('pendulum-fbd.png')

# ── 15. buckingham-pendulum-scaling.png ──────────────────────────────────────────
fig, ax = plt.subplots(figsize=(5, 4))
g = 9.8
L_vals = np.logspace(-1, 1.3, 100)
T_vals = 2*np.pi*np.sqrt(L_vals/g)
ax.loglog(L_vals, T_vals, 'steelblue', lw=2.5, label=r'$T = 2\pi\sqrt{\ell/g}$')
# show slope 1/2
Ls = np.array([0.5, 4])
Ts = 2*np.pi*np.sqrt(Ls/g)
ax.loglog(Ls, Ts, 'r--', lw=1.5, label='slope $\\frac{1}{2}$ on log-log')
# slope triangle
ax.text(1.2, 0.4, r'$\Delta\log T = \frac{1}{2}\Delta\log\ell$', fontsize=10, color='gray')
ax.set_xlabel(r'pendulum length $\ell$ (m)')
ax.set_ylabel('period $T$ (s)')
ax.set_title(r'Buckingham $\pi$: $T \propto \sqrt{\ell/g}$, independent of $m$')
ax.legend(fontsize=9)
save('buckingham-pendulum-scaling.png')

# ── 16. mass-spring-fbd.png ──────────────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(6, 3.5))
ax.axis('off')
# wall on left
for y in np.arange(-1, 1.1, 0.25):
    ax.plot([-3.0, -2.7], [y, y+0.2], 'k', lw=1)
ax.plot([-3.0, -3.0], [-1, 1], 'k', lw=2)
# spring (zigzag)
sx = np.linspace(-2.7, -0.5, 20)
sy = 0.2*np.sin(np.linspace(0, 6*np.pi, 20))
ax.plot(sx, sy, 'k', lw=1.5)
ax.text(-1.6, 0.4, '$k$', fontsize=12)
# damper
dy = np.linspace(-2.7, -0.5, 4)
ax.plot([-2.7, -1.8, -1.8, -0.5], [-0.45, -0.45, -0.45, -0.45], 'k', lw=1.5)
ax.add_patch(mpatches.FancyBboxPatch((-1.85, -0.75), 0.3, 0.6,
    boxstyle='square,pad=0', edgecolor='k', facecolor='white', lw=1.5))
ax.plot([-1.55, -0.5], [-0.45, -0.45], 'k', lw=1.5)
ax.text(-1.75, -1.0, '$c$', fontsize=12)
# mass block
ax.add_patch(mpatches.FancyBboxPatch((-0.5, -0.55), 1.0, 1.1,
    boxstyle='square,pad=0', edgecolor='k', facecolor='#d4a85a', lw=2, alpha=0.8))
ax.text(-0.1, -0.05, '$m$', fontsize=13, ha='center')
# equilibrium & x(t)
ax.axvline(0.5, color='gray', ls=':', lw=1)
ax.text(0.55, -0.9, 'equilibrium', fontsize=9, color='gray', rotation=90, va='bottom')
ax.annotate('', xy=(1.8, 0.0), xytext=(0.51, 0.0),
            arrowprops=dict(arrowstyle='->', color='steelblue', lw=2))
ax.text(1.85, 0.1, r'$x(t)$', fontsize=12, color='steelblue')
ax.set_xlim(-3.5, 2.8); ax.set_ylim(-1.3, 1.1)
ax.set_title("Mass–spring–damper: $mx'' + cx' + kx = F(t)$")
save('mass-spring-fbd.png')

# ── 17. damping-regimes.png ──────────────────────────────────────────────────────
fig, axes = plt.subplots(1, 3, figsize=(10, 3.5), sharey=True)
t = np.linspace(0, 8, 500)
m, k = 1.0, 4.0
om0 = np.sqrt(k/m)
# Underdamped: c=1, b1 = c/m = 1, b0 = k/m = 4  => alpha=-0.5, beta=sqrt(15)/2
c_u = 1.0; al_u = -c_u/(2*m); be_u = np.sqrt(k/m - (c_u/(2*m))**2)
y_u = np.exp(al_u*t) * (np.cos(be_u*t) + 0.3*np.sin(be_u*t))
axes[0].plot(t, y_u, 'steelblue', lw=2)
axes[0].plot(t,  np.exp(al_u*t), 'k--', lw=1, alpha=0.5)
axes[0].plot(t, -np.exp(al_u*t), 'k--', lw=1, alpha=0.5)
axes[0].set_title('Underdamped\n$b_1^2 < 4b_0$')
# Critically damped: c = 2*sqrt(k*m) = 4, r = -2 repeated
c_c = 2*np.sqrt(k*m); r_c = -c_c/(2*m)
y_c = (1 + 0.5*t) * np.exp(r_c*t)  # (c1 + c2*t)*e^{r t}
axes[1].plot(t, y_c, 'steelblue', lw=2)
axes[1].set_title('Critically damped\n$b_1^2 = 4b_0$')
# Overdamped: c=6, r+,r- both negative
c_o = 6.0; disc = (c_o/(2*m))**2 - k/m
rp = -c_o/(2*m) + np.sqrt(disc); rm = -c_o/(2*m) - np.sqrt(disc)
y_o = 0.6*np.exp(rp*t) + 0.4*np.exp(rm*t)
axes[2].plot(t, y_o, 'steelblue', lw=2)
axes[2].set_title('Overdamped\n$b_1^2 > 4b_0$')
for ax2 in axes:
    ax2.axhline(0, color='gray', lw=0.8, ls=':')
    ax2.set_xlabel('$t$')
axes[0].set_ylabel('$x(t)$')
plt.tight_layout()
save('damping-regimes.png')

# ── 18. pendulum-linearization.png ───────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(5.5, 3.5))
th = np.linspace(-np.pi/2, np.pi/2, 300)
ax.plot(th, np.sin(th), 'steelblue', lw=2.5, label=r'$\sin\theta$')
ax.plot(th, th,         '#c0392b',   lw=2, ls='--', label=r'$\theta$ (linearization)')
ax.fill_between(th, np.sin(th), th, alpha=0.12, color='#c0392b',
                label='error region')
ax.axvline( np.pi/6, color='gray', ls=':', lw=1)
ax.axvline(-np.pi/6, color='gray', ls=':', lw=1)
ax.text(np.pi/6+0.03, -0.4, r'$30°$', fontsize=10, color='gray')
ax.set_xlabel(r'$\theta$ (rad)'); ax.set_ylabel('')
ax.set_title(r'Linear approximation $\sin\theta\approx\theta$ for small $|\theta|$')
ax.legend(fontsize=9)
save('pendulum-linearization.png')

# ── 19. resonance-beats.png ───────────────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(7, 3.5))
om0 = 4.0; eps = 0.3; om = om0 - eps
# beats: x = [F0/(m(om0^2-om^2))] * (cos(om t) - cos(om0 t))
# ≈ [F0/(m * 2*om0*eps)] * 2 sin((om0-om)/2 * t) * sin((om0+om)/2 * t)
t = np.linspace(0, 30, 3000)
A = 1/(om0**2 - om**2)
x = A * (np.cos(om*t) - np.cos(om0*t))
env = 2*A*np.abs(np.sin((om0-om)/2 * t))
ax.plot(t, x, 'steelblue', lw=1.5, label='$x(t)$: beats')
ax.plot(t, env, 'k--', lw=1.5, alpha=0.7, label='envelope')
ax.plot(t, -env, 'k--', lw=1.5, alpha=0.7)
ax.set_xlabel('$t$'); ax.set_ylabel('$x(t)$')
ax.set_title(fr'Beating: $\omega={om}$ near $\omega_0={om0}$')
ax.legend(fontsize=9)
save('resonance-beats.png')

# ── 20. pure-resonance.png ────────────────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(6, 3.5))
om0 = 2.0
t = np.linspace(0, 12, 600)
x = (1/(2*om0)) * t * np.sin(om0*t)  # solution from Laplace transform
ax.plot(t, x, 'steelblue', lw=1.8)
ax.plot(t,  t/(2*om0), 'k--', lw=1.5, alpha=0.6, label='envelope $t/(2\\omega_0)$')
ax.plot(t, -t/(2*om0), 'k--', lw=1.5, alpha=0.6)
ax.set_xlabel('$t$'); ax.set_ylabel('$x(t)$')
ax.set_title(fr'Pure resonance ($\omega=\omega_0={om0}$): unbounded growth')
ax.legend(fontsize=9)
save('pure-resonance.png')

# ── 21. frequency-response.png ────────────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(6, 4))
om0 = 1.0; F0 = 1.0; m = 1.0; k = om0**2
om = np.linspace(0, 3, 500)
for c, col, lbl in [(0.2,'#c0392b','$c=0.2$'), (0.5,'#e67e22','$c=0.5$'),
                     (1.0,'steelblue','$c=1.0$'), (2.0,'#27ae60','$c=2.0$')]:
    A = F0 / np.sqrt((k - m*om**2)**2 + (c*om)**2)
    ax.plot(om, A, color=col, lw=2, label=lbl)
ax.axvline(om0, color='gray', ls=':', lw=1.5)
ax.text(om0+0.03, 3.5, r'$\omega_0$', color='gray', fontsize=11)
ax.set_xlabel(r'forcing frequency $\omega$')
ax.set_ylabel(r'amplitude $A(\omega)$')
ax.set_title('Damped forced motion: frequency response')
ax.legend(fontsize=9, title='damping $c$')
ax.set_ylim(0, 6)
save('frequency-response.png')

# ── 22-26. phase portraits ────────────────────────────────────────────────────────
def phase_portrait(A, title, fname, n_traj=12, T=4, c_colors=None):
    fig, ax = plt.subplots(figsize=(4.5, 4.5))
    def flow(t, xy): return A @ xy
    from scipy.integrate import solve_ivp
    angles = np.linspace(0, 2*np.pi, n_traj, endpoint=False)
    r0 = 2.0
    for ang in angles:
        ic = np.array([r0*np.cos(ang), r0*np.sin(ang)])
        try:
            sol = solve_ivp(flow, [0, T], ic, max_step=0.05, dense_output=True)
            xs, ys = sol.y
            ax.plot(xs, ys, 'steelblue', lw=1.2, alpha=0.75)
            ax.annotate('', xy=(xs[len(xs)//3+1], ys[len(xs)//3+1]),
                        xytext=(xs[len(xs)//3], ys[len(xs)//3]),
                        arrowprops=dict(arrowstyle='->', color='steelblue', lw=1.2))
        except Exception:
            pass
    ax.plot(0, 0, 'ko', ms=6, zorder=5)
    ax.set_xlim(-3, 3); ax.set_ylim(-3, 3)
    ax.set_xlabel('$x_1$'); ax.set_ylabel('$x_2$')
    ax.set_title(title)
    ax.axhline(0, color='gray', lw=0.5, ls=':')
    ax.axvline(0, color='gray', lw=0.5, ls=':')
    save(fname)

from scipy.integrate import solve_ivp  # noqa: ensure imported

# stable node (distinct negative eigenvalues)
phase_portrait(np.array([[-1.5, 0], [0, -0.5]]),
               'Stable node\n$\\lambda_1<\\lambda_2<0$', 'phase-portrait-node-stable.png')

# saddle point
phase_portrait(np.array([[2, 0], [0, -1]]),
               'Saddle point\n$\\lambda_1>0>\\lambda_2$', 'phase-portrait-saddle.png')

# stable spiral
phase_portrait(np.array([[-0.3, -2.0], [2.0, -0.3]]),
               'Stable spiral\n$\\mathrm{Re}(\\lambda)<0$', 'phase-portrait-spiral.png')

# center
phase_portrait(np.array([[0, -2.0], [2.0, 0]]),
               'Center\n$\\lambda = \\pm i\\beta$', 'phase-portrait-center.png')

# improper node (repeated eigenvalue)
phase_portrait(np.array([[2, 1], [0, 2]]),
               'Unstable improper node\n$\\lambda_1=\\lambda_2>0$', 'phase-portrait-improper-node.png')

# ── 27. phase-portrait-classification.png ────────────────────────────────────────
fig, ax = plt.subplots(figsize=(6, 5))
tr_vals = np.linspace(-3, 3, 400)
# boundary curves: D = tr^2/4 (parabola)
D_parab = tr_vals**2 / 4
# fill regions
tr2 = np.linspace(-3, 3, 400)
ax.fill_between(tr2, D_parab, 3.5, alpha=0.12, color='steelblue', label='spirals / nodes')
ax.fill_between(tr2, -0.5, D_parab, alpha=0.12, color='#e67e22', label='saddles ($D<0$)')
ax.plot(tr_vals, D_parab, 'k', lw=2)
ax.axhline(0, color='gray', lw=1, ls=':')
ax.axvline(0, color='gray', lw=1, ls=':')
# labels
ax.text(-2.0, 3.0, 'stable\nspiral/node\n$(\\mathrm{tr}<0)$', fontsize=9, ha='center', color='steelblue')
ax.text(2.0, 3.0, 'unstable\nspiral/node\n$(\\mathrm{tr}>0)$', fontsize=9, ha='center', color='#c0392b')
ax.text(-2.0, -0.3, 'saddle', fontsize=9, color='#e67e22')
ax.text(2.0, -0.3, 'saddle', fontsize=9, color='#e67e22')
ax.text(0.05, 0.15, 'centers\n$(\\mathrm{tr}=0,D>0)$', fontsize=9, color='gray', ha='center')
ax.set_xlabel('trace$(A)$'); ax.set_ylabel('det$(A)$')
ax.set_title('Trace–determinant plane: classification of equilibria')
ax.set_xlim(-3, 3); ax.set_ylim(-0.5, 3.5)
save('phase-portrait-classification.png')

# ── 28. heaviside-pulse.png ──────────────────────────────────────────────────────
fig, axes = plt.subplots(1, 3, figsize=(10, 3))
t = np.linspace(-0.5, 5, 500)
a, c = 1.0, 3.0
# unit step
u = np.where(t >= a, 1.0, 0.0)
axes[0].step(t, u, 'steelblue', lw=2, where='post')
axes[0].set_title(r'Unit step $u(t-a)$, $a=1$')
# pulse
pulse = np.where((t >= a) & (t < c), 1.0, 0.0)
axes[1].step(t, pulse, 'steelblue', lw=2, where='post')
axes[1].set_title(r'Pulse $u(t-a)-u(t-c)$')
# sawtooth-ish: ramp switched on at a
ramp = np.where(t >= a, (t - a), 0.0)
axes[2].plot(t, ramp, 'steelblue', lw=2)
axes[2].set_title(r'Ramp $(t-a)u(t-a)$')
for ax2 in axes:
    ax2.set_xlabel('$t$'); ax2.axhline(0, color='gray', lw=0.7)
plt.tight_layout()
save('heaviside-pulse.png')

# ── 29. dirac-delta.png ──────────────────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(5, 3.5))
t = np.linspace(-1, 3, 600)
for eps, col, lbl in [(0.8,'#e67e22','$\\varepsilon=0.8$'),
                       (0.3,'steelblue','$\\varepsilon=0.3$'),
                       (0.1,'#c0392b','$\\varepsilon=0.1$')]:
    d = np.where(np.abs(t-1) < eps/2, 1/eps, 0.0)
    ax.step(t, d, color=col, lw=1.8, label=lbl, where='post')
ax.set_xlabel('$t$'); ax.set_ylabel(r'$\delta_\varepsilon(t-1)$')
ax.set_title(r'Dirac delta: $\delta(t-1)$ as limit of unit pulses')
ax.legend(fontsize=9)
save('dirac-delta.png')

# ── 30. discontinuous-response.png ───────────────────────────────────────────────
fig, ax = plt.subplots(figsize=(6, 3.5))
# x''+4x = u(t-1), x(0)=x'(0)=0 => x = (1/4)(1-cos(2(t-1))) for t>=1
t = np.linspace(0, 8, 600)
x = np.where(t >= 1, 0.25*(1 - np.cos(2*(t-1))), 0.0)
ax.plot(t, x, 'steelblue', lw=2)
ax.axvline(1, color='gray', ls='--', lw=1.5)
ax.text(1.1, 0.45, 'forcing\nsteps on', fontsize=9, color='gray')
ax.set_xlabel('$t$'); ax.set_ylabel('$x(t)$')
ax.set_title(r"$x''+4x=u(t-1)$: response to a step force")
save('discontinuous-response.png')

print("\nAll figures generated successfully.")
