---
title: "AMATH 361: Continuum Mechanics"
prof: "Francis J. Poulin"
subjects: "AMATH"
---

The primary source is the course summary prepared by Ryan Newson (Winter 2005), which covers the material in a compact but mathematically precise form. The exposition of viscoelasticity and elasticity follows A.J.M. Spencer, *Continuum Mechanics* (Dover Publications, 2004), one of the clearest undergraduate treatments of the subject. The fluid mechanics chapters draw on D.J. Acheson, *Elementary Fluid Dynamics* (Oxford University Press, 1990), and G.K. Batchelor, *An Introduction to Fluid Dynamics* (Cambridge University Press, 1967). Readers seeking a more geometrically modern treatment of kinematics should consult M.E. Gurtin, *An Introduction to Continuum Mechanics* (Academic Press, 1981).

---

# Part I — Constitutive Foundations

# Chapter 1: One-Dimensional Viscoelasticity

## 1.1 The Principle of Fading Memory

The central question of mechanics is deceptively simple: if you apply a force to a material, how does it deform? For a perfectly elastic spring the answer is instantaneous and local — the deformation is proportional to the force at that moment, with no reference to the past. For a Newtonian viscous fluid the force is proportional to the *rate* of deformation. Real materials, however, belong to neither category. A polymer gel pulled quickly responds like a stiff elastic solid; pulled slowly, it flows. Biological tissue deforms more under a sustained load than under a brief one of the same magnitude. These materials are **viscoelastic**: their response depends on the entire history of forcing.

The simplest mathematical framework that captures this history-dependence is the **convolution integral**. If \(f(t)\) is the applied force (stress) and \(r(t)\) is the resulting deformation (strain), we write

\[
r(t) = \int_0^t \alpha(\tau)\, f(t - \tau)\, d\tau
\]

The kernel \(\alpha(\tau)\) assigns a weight to the force applied \(\tau\) seconds ago. The physical principle that guides the choice of \(\alpha\) is **fading memory**: remote history contributes less than recent history.

<div class="definition">
<strong>Fading Memory Principle.</strong> The memory (creep) kernel \(\alpha(\tau)\) satisfies \(\alpha(\tau) \to 0\) as \(\tau \to \infty\). The material gradually forgets its loading history.
</div>

This is not a mathematical convenience but a physical observation: a rubber band stretched five minutes ago contributes negligibly to its current state compared to what happened in the last second. The shape of the decay of \(\alpha\) — exponential, power-law, or otherwise — characterises the material.

The general **linear viscoelastic constitutive relation** between \(f\) and \(r\) is a linear ODE with constant coefficients:

\[
q_2 \frac{d^2 r}{dt^2} + q_1 \frac{dr}{dt} + q_0 r = p_2 \frac{d^2 f}{dt^2} + p_1 \frac{df}{dt} + p_0 f
\]

The six constants \(p_0, p_1, p_2, q_0, q_1, q_2 \geq 0\) characterise the material. Different choices give rise to the classical mechanical models.

## 1.2 Mechanical Analogues: Springs and Dashpots

Before analysing the general ODE, it is instructive to study the two elementary building blocks.

An **elastic spring** obeys Hooke's law:

\[
f_{sp}(t) = G\, r_{sp}(t)
\]
where \(G\) [N/m] is the stiffness. The response is instantaneous and reversible; there is no memory whatsoever.

A **viscous dashpot** (a piston moving through oil) obeys:

\[
f_{dp}(t) = \eta\, \frac{dr_{dp}}{dt}(t)
\]
where \(\eta\) [N·s/m] is the viscosity. The dashpot resists change: the force is proportional to the velocity, not the position. It dissipates energy irreversibly.

These two elements are combined in two canonical configurations.

## 1.3 The Maxwell Fluid

In the **Maxwell model**, a spring and dashpot are connected in **series**. When two elements are in series, they share the same force (the force must be transmitted through both) and their individual deformations add:

\[
f(t) = f_{sp}(t) = f_{dp}(t), \qquad r(t) = r_{sp}(t) + r_{dp}(t)
\]

Differentiating the deformation and substituting the element laws:

\[
\frac{dr}{dt} = \frac{1}{G}\frac{df}{dt} + \frac{f}{\eta}
\]

This is a first-order ODE. To understand the Maxwell model physically, perform a **stress relaxation test**: impose a sudden constant deformation \(r(t) = r_0 H(t)\), where \(H\) is the Heaviside step function, and ask what force is required to maintain it. Solving gives:

\[
f(t) = G r_0 \exp\!\left(-\frac{G}{\eta}\, t\right)
\]

The stress relaxes exponentially to zero with relaxation time \(\tau_M = \eta/G\). For \(t \gg \tau_M\), no force is needed to maintain the deformation — the dashpot has accommodated all the strain and the spring is at rest. This is **fluid-like behaviour**: the Maxwell model eventually flows without limit under any sustained load.

<figure style="text-align:center;margin:1.5em 0;">
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 680 200" width="680" height="200" style="max-width:100%;font-family:serif;font-size:13px;">
  <!-- Maxwell: spring in series with dashpot -->
  <text x="110" y="18" text-anchor="middle" font-weight="bold">Maxwell (series)</text>
  <!-- left wall -->
  <rect x="10" y="85" width="6" height="30" fill="#666"/>
  <line x1="16" y1="100" x2="40" y2="100" stroke="#333" stroke-width="2"/>
  <!-- spring -->
  <polyline points="40,100 47,88 54,112 61,88 68,112 75,88 82,112 89,100" fill="none" stroke="#333" stroke-width="2"/>
  <!-- connector -->
  <line x1="89" y1="100" x2="110" y2="100" stroke="#333" stroke-width="2"/>
  <!-- dashpot cylinder -->
  <rect x="110" y="90" width="40" height="20" fill="none" stroke="#333" stroke-width="2"/>
  <line x1="130" y1="82" x2="130" y2="90" stroke="#333" stroke-width="2"/>
  <line x1="118" y1="102" x2="142" y2="102" stroke="#333" stroke-width="2.5"/>
  <!-- dashpot piston rod -->
  <line x1="150" y1="100" x2="175" y2="100" stroke="#333" stroke-width="2"/>
  <!-- arrow / force label -->
  <line x1="175" y1="100" x2="195" y2="100" stroke="#e05" stroke-width="2" marker-end="url(#arr)"/>
  <text x="200" y="104" fill="#e05">f</text>
  <!-- labels -->
  <text x="64" y="125" text-anchor="middle" font-size="12" font-style="italic">G</text>
  <text x="130" y="125" text-anchor="middle" font-size="12" font-style="italic">η</text>

  <!-- Kelvin-Voigt: spring parallel with dashpot -->
  <text x="390" y="18" text-anchor="middle" font-weight="bold">Kelvin-Voigt (parallel)</text>
  <!-- left wall -->
  <rect x="290" y="75" width="6" height="50" fill="#666"/>
  <line x1="296" y1="85" x2="320" y2="85" stroke="#333" stroke-width="2"/>
  <line x1="296" y1="115" x2="320" y2="115" stroke="#333" stroke-width="2"/>
  <!-- vertical connectors left -->
  <line x1="320" y1="85" x2="320" y2="115" stroke="#333" stroke-width="1.5"/>
  <!-- top path: spring -->
  <polyline points="320,85 327,73 334,97 341,73 348,97 355,73 362,85" fill="none" stroke="#333" stroke-width="2"/>
  <line x1="362" y1="85" x2="380" y2="85" stroke="#333" stroke-width="2"/>
  <!-- bottom path: dashpot -->
  <rect x="320" y="107" width="40" height="16" fill="none" stroke="#333" stroke-width="2"/>
  <line x1="340" y1="101" x2="340" y2="107" stroke="#333" stroke-width="2"/>
  <line x1="328" y1="117" x2="352" y2="117" stroke="#333" stroke-width="2.5"/>
  <line x1="360" y1="115" x2="380" y2="115" stroke="#333" stroke-width="2"/>
  <!-- right connector -->
  <line x1="380" y1="85" x2="380" y2="115" stroke="#333" stroke-width="1.5"/>
  <line x1="380" y1="100" x2="405" y2="100" stroke="#333" stroke-width="2"/>
  <!-- arrow -->
  <line x1="405" y1="100" x2="425" y2="100" stroke="#e05" stroke-width="2" marker-end="url(#arr)"/>
  <text x="430" y="104" fill="#e05">f</text>
  <!-- labels -->
  <text x="341" y="68" text-anchor="middle" font-size="12" font-style="italic">G</text>
  <text x="340" y="137" text-anchor="middle" font-size="12" font-style="italic">η</text>

  <!-- SLS: KV element in series with a spring -->
  <text x="590" y="18" text-anchor="middle" font-weight="bold">Zener / SLS</text>
  <!-- left wall -->
  <rect x="490" y="85" width="6" height="30" fill="#666"/>
  <line x1="496" y1="100" x2="518" y2="100" stroke="#333" stroke-width="2"/>
  <!-- Spring G1 -->
  <polyline points="518,100 525,88 532,112 539,88 546,112 553,88 560,100" fill="none" stroke="#333" stroke-width="2"/>
  <line x1="560" y1="100" x2="574" y2="100" stroke="#333" stroke-width="2"/>
  <!-- parallel block: G2 || η -->
  <line x1="574" y1="100" x2="574" y2="78" stroke="#333" stroke-width="1.5"/>
  <line x1="574" y1="100" x2="574" y2="122" stroke="#333" stroke-width="1.5"/>
  <polyline points="574,78 581,66 588,90 595,66 602,78" fill="none" stroke="#333" stroke-width="2"/>
  <line x1="602" y1="78" x2="622" y2="78" stroke="#333" stroke-width="2"/>
  <rect x="574" y="114" width="36" height="14" fill="none" stroke="#333" stroke-width="2"/>
  <line x1="592" y1="108" x2="592" y2="114" stroke="#333" stroke-width="2"/>
  <line x1="582" y1="122" x2="602" y2="122" stroke="#333" stroke-width="2.5"/>
  <line x1="610" y1="122" x2="622" y2="122" stroke="#333" stroke-width="2"/>
  <line x1="622" y1="78" x2="622" y2="122" stroke="#333" stroke-width="1.5"/>
  <line x1="622" y1="100" x2="640" y2="100" stroke="#333" stroke-width="2"/>
  <!-- arrow -->
  <line x1="640" y1="100" x2="660" y2="100" stroke="#e05" stroke-width="2" marker-end="url(#arr)"/>
  <text x="665" y="104" fill="#e05">f</text>
  <!-- labels -->
  <text x="538" y="132" text-anchor="middle" font-size="11" font-style="italic">G₁</text>
  <text x="588" y="62" text-anchor="middle" font-size="11" font-style="italic">G₂</text>
  <text x="592" y="145" text-anchor="middle" font-size="11" font-style="italic">η</text>

  <defs>
    <marker id="arr" markerWidth="8" markerHeight="6" refX="6" refY="3" orient="auto">
      <polygon points="0 0, 8 3, 0 6" fill="#e05"/>
    </marker>
  </defs>
</svg>
<figcaption style="font-size:0.88em;color:#888;margin-top:0.3em;">Three canonical spring-dashpot models. Left: Maxwell (series) — shared force, additive deformations. Centre: Kelvin–Voigt (parallel) — shared deformation, additive forces. Right: Standard Linear Solid / Zener (spring G₁ in series with a K-V block) — finite instantaneous and long-time stiffness.</figcaption>
</figure>

## 1.4 The Kelvin–Voigt Solid

In the **Kelvin–Voigt model**, a spring and dashpot are in **parallel**. Elements in parallel share the same deformation (they are attached at both ends) and their forces add:

\[
r(t) = r_{sp}(t) = r_{dp}(t), \qquad f(t) = f_{sp}(t) + f_{dp}(t)
\]

This gives:

\[
\eta\, \frac{dr}{dt} + G r = f
\]

To understand this model, perform a **creep test**: suddenly apply a constant force \(f(t) = f_0 H(t)\) and observe the deformation. Solving:

\[
r(t) = \frac{f_0}{G}\!\left(1 - e^{-Gt/\eta}\right)
\]

The deformation grows exponentially from zero toward the equilibrium value \(f_0/G\) — exactly the deformation a spring of stiffness \(G\) would have in equilibrium. The dashpot retards the approach but cannot prevent the system from reaching the same elastic equilibrium. This is **solid-like behaviour**: the Kelvin–Voigt model deforms but eventually stops.

The contrast between the two models is fundamental. The Maxwell model has zero long-time stiffness: under a sustained force, it flows indefinitely. The Kelvin–Voigt model has zero instantaneous stiffness: it cannot deform discontinuously under a sudden impulse. Neither pathology matches most real materials, which motivates the next model.

## 1.5 The Standard Linear Solid (Zener Model)

The **Standard Linear Solid** (SLS), also called the **Zener model**, consists of a Kelvin–Voigt element with an additional spring placed in series. This seemingly minor modification has important consequences:

- Finite instantaneous stiffness (unlike pure K-V, which cannot respond instantly)
- Finite long-time stiffness (unlike pure Maxwell, which flows to zero force)
- A single relaxation time governing the smooth transition between the two regimes

The SLS is the simplest model that captures both elastic and viscous behaviour without pathology at short or long times. It serves as the first approximation for cartilage, tendon, polymer networks, and many biological soft tissues.

## 1.6 Laplace Transforms and the Convolution Kernel

The Laplace transform is the natural tool for linear viscoelasticity because it converts differential equations into algebra and convolution integrals into products.

<div class="definition">
<strong>Laplace Transform.</strong> For \(f : [0,\infty) \to \mathbb{R}\) of exponential order,

\[
F(s) = \mathcal{L}\{f(t)\} = \int_0^\infty e^{-st} f(t)\, dt
\]
</div>

The two most essential rules are the **differentiation rule**:

\[
\mathcal{L}\!\left\{\frac{df}{dt}\right\} = s F(s) - f(0), \qquad \mathcal{L}\!\left\{\frac{d^2f}{dt^2}\right\} = s^2 F(s) - s f(0) - f'(0)
\]

and the **convolution theorem**: if \(h(t) = \int_0^t g(\tau) f(t-\tau)\, d\tau\), then \(H(s) = G(s) F(s)\).

Applying the Laplace transform to the general viscoelastic ODE, assuming zero initial conditions, yields the **transfer function**:

\[
R(s) = \frac{p_2 s^2 + p_1 s + p_0}{q_2 s^2 + q_1 s + q_0}\, F(s)
\]

By the convolution theorem, the creep kernel is:

\[
\alpha(\tau) = \mathcal{L}^{-1}\!\left[\frac{p_2 s^2 + p_1 s + p_0}{q_2 s^2 + q_1 s + q_0}\right]_{t=\tau}
\]

This beautifully closes the loop: the ODE parameters \((p_i, q_i)\) and the memory kernel \(\alpha(\tau)\) are two equivalent ways of specifying the same viscoelastic material. The kernel representation is physically intuitive; the ODE representation is computationally convenient; the Laplace transfer function connects them.

## 1.7 Standard Experiments

Three canonical laboratory tests probe the memory function from different angles.

The **creep test** applies a step in force: \(f(t) = f_0 H(t)\). In Laplace space, \(F(s) = f_0 / s\), so \(R(s) = (f_0/s)\hat{\alpha}(s)\). The response \(r(t)/f_0\) is the **creep compliance** \(J(t)\), which increases monotonically with time and saturates (for solid-like models) or grows without bound (for fluid-like models).

The **stress relaxation test** applies a step in deformation: \(r(t) = r_0 H(t)\). Now we invert the roles: the deformation is prescribed, and we solve for the force required. The response \(f(t)/r_0\) is the **relaxation modulus** \(G(t)\), which decays with time toward zero (Maxwell) or a finite equilibrium value (SLS, K-V).

The **oscillatory test** applies \(f(t) = f_0 \sin(\omega t)\) and observes the steady-state response \(r(t) = r_0 \sin(\omega t - \delta)\). The **loss angle** \(\delta\) quantifies the phase lag. For a perfectly elastic material, \(\delta = 0\); for a purely viscous fluid, \(\delta = \pi/2\). The **storage modulus** \(G' = (f_0/r_0)\cos\delta\) measures elastic energy storage; the **loss modulus** \(G'' = (f_0/r_0)\sin\delta\) measures viscous dissipation.

<figure style="text-align:center;margin:1.5em 0;">
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 540 200" width="540" height="200" style="max-width:100%;font-family:serif;font-size:12px;">
  <!-- Left panel: Creep compliance J(t) -->
  <!-- axes -->
  <line x1="40" y1="165" x2="230" y2="165" stroke="#333" stroke-width="1.5"/>
  <line x1="40" y1="165" x2="40" y2="20" stroke="#333" stroke-width="1.5"/>
  <text x="235" y="168" font-size="12" font-style="italic">t</text>
  <text x="28" y="16" font-size="12" font-style="italic">J(t)</text>
  <text x="130" y="185" text-anchor="middle" font-size="11" font-weight="bold">Creep Compliance</text>
  <!-- Maxwell: grows linearly (fluid-like) -->
  <polyline points="40,165 80,140 130,105 190,65 220,45" fill="none" stroke="#4488cc" stroke-width="2" stroke-dasharray="6,3"/>
  <text x="225" y="48" fill="#4488cc" font-size="11">Maxwell</text>
  <!-- KV: exponential approach to 1/G plateau -->
  <polyline points="40,165 55,143 70,127 90,112 115,103 145,99 175,97 205,97 225,97" fill="none" stroke="#cc4422" stroke-width="2"/>
  <text x="225" y="100" fill="#cc4422" font-size="11">K-V</text>
  <!-- SLS: similar to KV but starts stiffer -->
  <polyline points="40,155 55,138 75,126 100,115 135,106 170,101 210,98 225,98" fill="none" stroke="#33aa55" stroke-width="2" stroke-dasharray="4,2"/>
  <text x="225" y="90" fill="#33aa55" font-size="11">SLS</text>
  <!-- equilibrium line -->
  <line x1="40" y1="97" x2="225" y2="97" stroke="#aaa" stroke-width="1" stroke-dasharray="3,3"/>

  <!-- Right panel: Relaxation Modulus G(t) -->
  <line x1="310" y1="165" x2="500" y2="165" stroke="#333" stroke-width="1.5"/>
  <line x1="310" y1="165" x2="310" y2="20" stroke="#333" stroke-width="1.5"/>
  <text x="505" y="168" font-size="12" font-style="italic">t</text>
  <text x="298" y="16" font-size="12" font-style="italic">G(t)</text>
  <text x="400" y="185" text-anchor="middle" font-size="11" font-weight="bold">Stress Relaxation Modulus</text>
  <!-- Maxwell: exponential decay to 0 -->
  <polyline points="310,35 340,50 375,75 415,110 455,140 490,158 500,162" fill="none" stroke="#4488cc" stroke-width="2" stroke-dasharray="6,3"/>
  <text x="497" y="158" fill="#4488cc" font-size="11">Maxwell</text>
  <!-- SLS: decays to finite plateau -->
  <polyline points="310,35 340,52 375,75 415,100 455,115 490,122 500,124" fill="none" stroke="#33aa55" stroke-width="2" stroke-dasharray="4,2"/>
  <text x="497" y="130" fill="#33aa55" font-size="11">SLS</text>
  <!-- KV: instant jump, stays constant (ideal solid) -->
  <polyline points="310,165 310,35 500,35" fill="none" stroke="#cc4422" stroke-width="2"/>
  <text x="497" y="48" fill="#cc4422" font-size="11">K-V</text>
  <!-- asymptote dashed for SLS plateau -->
  <line x1="310" y1="124" x2="500" y2="124" stroke="#aaa" stroke-width="1" stroke-dasharray="3,3"/>
</svg>
<figcaption style="font-size:0.88em;color:#888;margin-top:0.3em;">Creep compliance \(J(t)\) (left) and stress relaxation modulus \(G(t)\) (right) for the three classical models. The Maxwell fluid flows without bound under sustained load; Kelvin–Voigt has infinite instantaneous stiffness; the SLS correctly interpolates with finite behaviour at both extremes.</figcaption>
</figure>

## 1.8 Plasticity and Nonlinear Response

The viscoelastic theory above is fundamentally linear: superposition holds. Many materials, however, exhibit **plasticity** — irreversible deformation that occurs once a stress threshold is exceeded. The simplest model replaces the smooth spring with a frictional element obeying Coulomb friction:

- **Static friction**: no motion until the applied force exceeds the static yield stress \(f_s\)
- **Dynamic (kinetic) friction**: once the element is sliding, the resisting force is a constant \(f_k < f_s\)

This threshold behaviour means the constitutive law is nonlinear: the response depends on whether the system is currently yielding. From the standpoint of the memory kernel, plasticity introduces a dependence on the magnitude of the forcing, not merely its history — the integral representation fails. These ideas foreshadow the theory of elastoplasticity in three dimensions, where yield surfaces and flow rules replace the linear constitutive tensor.

---

# Chapter 2: Kinematics of Deformation

The previous chapter treated deformation as a scalar quantity. To describe real three-dimensional materials, we must develop a geometric framework for how a body deforms. This is **kinematics**: the study of motion without reference to forces. The key object is the **strain tensor**, which measures local stretching and shearing at each point of the material.

## 2.1 Displacement and Finite Strain in One Dimension

Let \(x\) denote the initial position of a material point and \(f(x)\) its position after deformation. The **displacement** is:

\[
u(x) = f(x) - x \qquad [m]
\]

The natural measure of local deformation is the ratio of deformed to reference length. For an infinitesimal element \(dx\), the deformed length is \(f'(x)\,dx\), giving a stretch ratio of \(f'(x)\). The **Green–Lagrange strain**:

\[
E(x) = \frac{1}{2}\!\left[(f'(x))^2 - 1\right] = \frac{1}{2}\!\left[(u_x)^2 + 2u_x\right]
\]

is constructed so that \(E = 0\) for rigid motions (where \(f'(x) = 1\) everywhere). The geometric factor of \(\frac{1}{2}\) is conventional and ensures that \(E\) reduces to \(e\) in the linear limit.

For **small deformations**, \(|u_x| \ll 1\), and the quadratic term \((u_x)^2\) is negligible. The **linearised (infinitesimal) strain** is:

\[
e(x) = u_x = f'(x) - 1
\]

This linear approximation is valid for metals under service loads, geological rocks under tectonic stresses, and most structural engineering problems. It breaks down for rubber, biological tissue under large deformations, and any problem where geometric nonlinearity matters.

<figure style="text-align:center;margin:1.5em 0;">
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 440 180" width="440" height="180" style="max-width:100%;font-family:serif;font-size:12px;">
  <!-- Reference square (dashed) -->
  <rect x="50" y="60" width="80" height="80" fill="none" stroke="#888" stroke-width="1.5" stroke-dasharray="5,3"/>
  <text x="90" y="55" text-anchor="middle" fill="#888" font-size="11">Reference</text>

  <!-- Normal strain e_11: stretched in x -->
  <rect x="200" y="60" width="110" height="80" fill="rgba(68,136,204,0.1)" stroke="#4488cc" stroke-width="2"/>
  <text x="255" y="55" text-anchor="middle" fill="#4488cc" font-size="11">Normal strain</text>
  <text x="255" y="45" text-anchor="middle" fill="#4488cc" font-size="10" font-style="italic">e₁₁ = ∂u₁/∂x₁ &gt; 0</text>
  <!-- stretch arrows -->
  <line x1="196" y1="100" x2="185" y2="100" stroke="#4488cc" stroke-width="1.5" marker-end="url(#arB)"/>
  <line x1="314" y1="100" x2="325" y2="100" stroke="#4488cc" stroke-width="1.5" marker-end="url(#arB)"/>
  <!-- reference outline dashed -->
  <rect x="215" y="60" width="80" height="80" fill="none" stroke="#888" stroke-width="1" stroke-dasharray="4,3"/>

  <!-- Shear strain e_12: shearing -->
  <polygon points="50,310 130,310 135,390 55,390" fill="rgba(204,68,34,0.1)" stroke="#cc4422" stroke-width="2" transform="translate(220,-220)"/>
  <text x="385" y="55" text-anchor="middle" fill="#cc4422" font-size="11">Shear strain</text>
  <text x="385" y="45" text-anchor="middle" fill="#cc4422" font-size="10" font-style="italic">e₁₂ = ½(∂u₁/∂x₂ + ∂u₂/∂x₁)</text>
  <!-- reference outline dashed -->
  <rect x="350" y="90" width="80" height="80" fill="none" stroke="#888" stroke-width="1" stroke-dasharray="4,3"/>

  <!-- axes labels -->
  <line x1="30" y1="155" x2="30" y2="50" stroke="#333" stroke-width="1.5" marker-end="url(#arD)"/>
  <line x1="30" y1="155" x2="145" y2="155" stroke="#333" stroke-width="1.5" marker-end="url(#arD)"/>
  <text x="148" y="158" font-size="11" font-style="italic">x₁</text>
  <text x="22" y="46" font-size="11" font-style="italic">x₂</text>

  <defs>
    <marker id="arB" markerWidth="7" markerHeight="5" refX="5" refY="2.5" orient="auto"><polygon points="0 0,7 2.5,0 5" fill="#4488cc"/></marker>
    <marker id="arD" markerWidth="7" markerHeight="5" refX="5" refY="2.5" orient="auto"><polygon points="0 0,7 2.5,0 5" fill="#333"/></marker>
  </defs>
</svg>
<figcaption style="font-size:0.88em;color:#888;margin-top:0.3em;">Normal strain \(e_{11}\) stretches the element in the \(x_1\)-direction; shear strain \(e_{12}\) skews it. The infinitesimal strain tensor captures both effects as the symmetric part of the displacement gradient.</figcaption>
</figure>

## 2.2 Cartesian Tensors and Index Notation

The extension to three dimensions requires the machinery of **tensors**. The essential tool is the **Einstein summation convention**: a repeated index in a term implies summation over that index, so \(a_{ij} b_j \equiv \sum_{j=1}^{3} a_{ij} b_j\).

The **Kronecker delta** plays the role of the identity:

\[
\delta_{ij} = \begin{cases} 1 & i = j \\ 0 & i \neq j \end{cases}, \qquad \delta_{ij} a_j = a_i
\]

Under a rotation of coordinate axes, with rotation matrix \(\beta_{ij} = \mathbf{e}'_j \cdot \mathbf{e}_i\) (the direction cosines between old and new basis vectors), the components of vectors and second-order tensors transform as:

\[
a'_i = \beta_{ij} a_j, \qquad a'_{ij} = \beta_{im} \beta_{jn} a_{mn}
\]

<div class="definition">
<strong>Cartesian Tensor of Order \(n\).</strong> A quantity with components \(T_{i_1 i_2 \cdots i_n}\) is a Cartesian tensor of order \(n\) if its components transform under rotations with one factor of \(\beta\) per index. Scalars are order-0 tensors; vectors are order-1; the stress and strain are order-2.
</div>

The fundamental principle is that physical laws written as tensor equations are **frame-invariant**: they hold in every coordinate system without change. This is why tensor notation is the language of continuum mechanics.

## 2.3 Deformation and Strain in Three Dimensions

Let \(a_i\) denote the reference (initial) position of a material point and \(x_i(\mathbf{a})\) its deformed position. The displacement is:

\[
u_i = x_i - a_i \qquad [m]
\]

The **deformation gradient** \(F_{ij} = \partial x_i / \partial a_j\) encodes the local mapping from reference to deformed configuration. The **Green–Lagrange strain tensor** in three dimensions is:

\[
E_{ij} = \frac{1}{2}\!\left[\delta_{pq}\, x_{p,i}\, x_{q,j} - \delta_{ij}\right] = \frac{1}{2}\!\left[u_{j,i} + u_{i,j} + u_{l,i}\, u_{l,j}\right]
\]

where \(u_{i,j} = \partial u_i / \partial a_j\). The last term is quadratic in displacement gradients. Linearising for small deformations:

<div class="definition">
<strong>Infinitesimal Strain Tensor.</strong>

\[
e_{ij} = \frac{1}{2}(u_{i,j} + u_{j,i})
\]
This is the symmetric part of the displacement gradient. The diagonal components \(e_{11}, e_{22}, e_{33}\) are normal strains; the off-diagonal components are shear strains.
</div>

The symmetry \(e_{ij} = e_{ji}\) follows immediately from the definition. The **volumetric strain** (dilatation) is the trace:

\[
e_{kk} = e_{11} + e_{22} + e_{33} = \nabla \cdot \mathbf{u}
\]
This measures the fractional change in volume: a positive dilatation means the material expanded; negative means it compressed.

---

# Chapter 3: Stress and Linear Elasticity

Having described deformation geometrically, we now connect it to forces through a **constitutive law** — the mathematical encoding of the material's mechanical character.

## 3.1 Traction and the Stress Tensor

Imagine slicing the deformed body along an imaginary internal surface with outward unit normal \(\hat{n}\). The material on the positive side exerts a force per unit area — a **traction vector** — on the material on the negative side.

<div class="theorem">
<strong>Cauchy's Theorem.</strong> There exists a second-order tensor field \(\tau_{ij}\) — the <strong>Cauchy stress tensor</strong> — such that the traction on any surface with unit normal \(\hat{n}\) is:

\[
t_i = \tau_{ij}\, \hat{n}_j \qquad [N/m^2]
\]
</div>

This is a profound result: it asserts that the traction depends linearly on the surface normal, regardless of the surface's shape or orientation. The proof proceeds by applying Newton's law to a shrinking tetrahedron with three faces aligned with the coordinate planes and one inclined face — Cauchy's classical argument.

<figure style="text-align:center;margin:1.5em 0;">
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 220" width="320" height="220" style="max-width:100%;font-family:serif;font-size:12px;">
  <!-- Tetrahedron vertices: O at (100,160), A at (240,160), B at (50,60), C at (180,40) -->
  <!-- Back faces (dashed) -->
  <polygon points="100,160 50,60 180,40" fill="rgba(200,200,200,0.2)" stroke="#888" stroke-width="1.5" stroke-dasharray="5,3"/>
  <line x1="100" y1="160" x2="240" y2="160" stroke="#888" stroke-width="1.5" stroke-dasharray="5,3"/>
  <line x1="100" y1="160" x2="180" y2="40" stroke="#888" stroke-width="1.5" stroke-dasharray="5,3"/>
  <!-- Inclined face (front, highlighted) -->
  <polygon points="240,160 50,60 180,40" fill="rgba(68,136,204,0.15)" stroke="#4488cc" stroke-width="2"/>
  <!-- Axes from O -->
  <line x1="100" y1="160" x2="260" y2="160" stroke="#e05" stroke-width="1.5" marker-end="url(#arE)"/>
  <text x="265" y="163" fill="#e05" font-size="12" font-style="italic">x₁</text>
  <line x1="100" y1="160" x2="100" y2="30" stroke="#e05" stroke-width="1.5" marker-end="url(#arE)"/>
  <text x="88" y="26" fill="#e05" font-size="12" font-style="italic">x₃</text>
  <line x1="100" y1="160" x2="35" y2="85" stroke="#e05" stroke-width="1.5" marker-end="url(#arE)"/>
  <text x="22" y="82" fill="#e05" font-size="12" font-style="italic">x₂</text>
  <!-- Normal to inclined face -->
  <line x1="157" y1="87" x2="200" y2="60" stroke="#4488cc" stroke-width="1.5" marker-end="url(#arF)"/>
  <text x="205" y="58" fill="#4488cc" font-size="12" font-style="italic">n̂</text>
  <!-- Traction vector -->
  <line x1="157" y1="87" x2="185" y2="100" stroke="#33aa55" stroke-width="2" marker-end="url(#arG)"/>
  <text x="188" y="106" fill="#33aa55" font-size="12" font-style="italic">t = τn̂</text>
  <!-- Point labels -->
  <text x="96" y="175" font-size="11">O</text>
  <text x="244" y="175" font-size="11">A</text>
  <text x="38" y="58" font-size="11">B</text>
  <text x="182" y="36" font-size="11">C</text>
  <defs>
    <marker id="arE" markerWidth="7" markerHeight="5" refX="5" refY="2.5" orient="auto"><polygon points="0 0,7 2.5,0 5" fill="#e05"/></marker>
    <marker id="arF" markerWidth="7" markerHeight="5" refX="5" refY="2.5" orient="auto"><polygon points="0 0,7 2.5,0 5" fill="#4488cc"/></marker>
    <marker id="arG" markerWidth="7" markerHeight="5" refX="5" refY="2.5" orient="auto"><polygon points="0 0,7 2.5,0 5" fill="#33aa55"/></marker>
  </defs>
</svg>
<figcaption style="font-size:0.88em;color:#888;margin-top:0.3em;">Cauchy's tetrahedron argument. The three coordinate faces carry stress components \(\tau_{ij}\); the inclined face with outward normal \(\hat{n}\) carries the traction \(t_i = \tau_{ij}\hat{n}_j\). Taking the volume to zero shows the traction is a linear function of \(\hat{n}\) — the fundamental result of stress theory.</figcaption>
</figure>

The diagonal entries \(\tau_{11}, \tau_{22}, \tau_{33}\) are **normal stresses**: positive means tension, negative means compression. The off-diagonal entries \(\tau_{12} = \tau_{21}\), etc., are **shear stresses**. The symmetry \(\tau_{ij} = \tau_{ji}\) is a consequence of angular momentum balance applied to an infinitesimal volume.

## 3.2 The Isotropic Linear Elastic Constitutive Law

For small deformations of an isotropic, homogeneous elastic solid, the most general linear relation between stress and strain is:

<div class="theorem">
<strong>Hooke's Law in Three Dimensions.</strong>

\[
\tau_{ij} = \lambda\, e_{kk}\, \delta_{ij} + 2\mu\, e_{ij}
\]
where \(\lambda\) and \(\mu\) are the <strong>Lamé constants</strong> of the material.
</div>

The first term is isotropic — it acts like a pressure proportional to the volumetric strain. The second term is the deviatoric (shear) contribution. Together, two scalar constants \(\lambda\) and \(\mu\) describe all elastic behaviour of an isotropic material.

The Lamé constants are related to more familiar engineering parameters:

| Engineering Parameter | Symbol | Formula |
|----------------------|--------|---------|
| Young's modulus | \(E_Y\) | \(\mu(3\lambda + 2\mu)/(\lambda + \mu)\) |
| Poisson's ratio | \(\nu\) | \(\lambda / (2(\lambda + \mu))\) |
| Bulk modulus | \(K\) | \(\lambda + 2\mu/3\) |
| Shear modulus | \(G\) | \(\mu\) |

Young's modulus is what you measure in a uniaxial tension test: the ratio of axial stress to axial strain. Poisson's ratio measures the transverse contraction when a bar is pulled: rubber has \(\nu \approx 0.5\) (nearly incompressible), most metals have \(\nu \approx 0.3\), and cork has \(\nu \approx 0\) (which is why it compresses into a bottle without bulging out the sides).

## 3.3 Equilibrium Conditions

In the absence of body forces, force balance on any material volume requires:

<div class="theorem">
<strong>Equilibrium Equations.</strong>

\[
\tau_{ij,j} = 0 \qquad \text{i.e., } \frac{\partial \tau_{ij}}{\partial x_j} = 0
\]
The divergence of the stress tensor vanishes at every point in equilibrium.
</div>

This is simply Newton's first law applied to an infinitesimal element: the net force per unit volume must vanish in equilibrium.

Substituting the constitutive law into the equilibrium equations yields the **Navier equations** of linear elasticity:

\[
(\lambda + \mu)\, \nabla(\nabla \cdot \mathbf{u}) + \mu\, \nabla^2 \mathbf{u} = \mathbf{0}
\]

This is a system of three coupled elliptic PDEs for the three displacement components. Every solution of the Navier equations corresponds to an equilibrium elastic deformation field.

## 3.4 Boundary Value Problems

Boundary conditions for an elastic solid take two forms:

- **Displacement (Dirichlet) conditions**: \(u_i\) prescribed on a surface — modelling a clamped boundary or a fixed support
- **Traction (Neumann) conditions**: \(t_i = \tau_{ij} n_j\) prescribed on a surface — modelling an applied pressure or a free surface (\(t_i = 0\))

Two problem classes appear in the course:

*Multi-layer unidirectional problems* consider a material composed of parallel layers, each with different Lamé constants. Since deformation is constrained to be in one direction, the 3D equations reduce to 1D. Stress must be continuous across interfaces (force balance), and displacement must be continuous (no gaps or overlaps). These conditions uniquely determine the response throughout the layered medium.

*Tethered tube problems* arise in biomechanics. A pressurised cylindrical tube (blood vessel model) with both ends fixed has a different stress distribution than a free tube. The constraint that total length is fixed creates an axial stress throughout the wall, coupling the circumferential and axial equations in a non-trivial way.

---

# Chapter 4: Three-Dimensional Viscoelasticity

The elastic constitutive law of Chapter 3 can be systematically extended to viscoelasticity in three dimensions using the same mathematical machinery developed in Chapter 1, together with a structural insight about the decomposition of the stress tensor.

## 4.1 Dilatational and Deviatoric Decomposition

Any symmetric tensor can be split uniquely into an isotropic part (proportional to the identity) and a trace-free (**deviatoric**) part:

\[
\tau_{ij} = \frac{1}{3}\tau_{kk}\, \delta_{ij} + s_{ij}, \qquad e_{ij} = \frac{1}{3}e_{kk}\, \delta_{ij} + \varepsilon_{ij}
\]

where \(s_{ij} = \tau_{ij} - \frac{1}{3}\tau_{kk}\delta_{ij}\) and \(\varepsilon_{ij} = e_{ij} - \frac{1}{3}e_{kk}\delta_{ij}\) are deviatoric (trace-free). The trace \(e_{kk} = \nabla \cdot \mathbf{u}\) measures volumetric change; the deviatoric part measures shape change at constant volume.

The Hooke's law constitutive relation decouples beautifully under this decomposition. The dilatational part gives:

\[
\tau_{kk} = 3K\, e_{kk}
\]
where \(K = \lambda + 2\mu/3\) is the **bulk modulus**. The deviatoric part gives:

\[
s_{ij} = 2\mu\, \varepsilon_{ij}
\]

Volumetric and shear responses are governed by completely independent elastic constants \(K\) and \(\mu\). This decoupling is special to isotropy and linearity.

## 4.2 The Correspondence Principle

The deviatoric constitutive relation \(s_{ij} = 2\mu\,\varepsilon_{ij}\) has exactly the same structure as the 1D elastic spring \(f = G\,r\). The extension to viscoelasticity follows by the same principle applied in 1D: replace the proportionality by the general linear ODE.

<div class="theorem">
<strong>Elastic–Viscoelastic Correspondence Principle.</strong> The solution to a viscoelastic boundary value problem in Laplace space is obtained from the elastic solution by replacing the shear modulus:

\[
2\mu \;\longrightarrow\; \frac{q_2 s^2 + q_1 s + q_0}{p_2 s^2 + p_1 s + p_0}
\]
The dilatational part with bulk modulus \(K\) remains elastic (fluids are nearly incompressible, and the volumetric response of solids is typically much stiffer and faster than shear).
</div>

The procedure is: (1) solve the elastic boundary value problem, expressing the answer in terms of \(\mu\); (2) take the Laplace transform; (3) substitute the viscoelastic operator for \(2\mu\); (4) invert the Laplace transform.

This principle is not obvious — it rests on the fact that the boundary conditions do not mix dilatational and deviatoric quantities, and that the governing equations are linear. It is a true theorem, not an approximation. The models considered in Chapter 1 (Maxwell, Kelvin–Voigt, SLS) are all special cases of the general operator above.

---

# Part II — Fluid Mechanics (Continuum Branch)

# Chapter 5: From Solids to Fluids — Kinematics of Flow

The four preceding chapters treated materials with a preferred reference configuration: a body deforms from its natural state, and displacement measures departure from that state. A **fluid** has no such preferred configuration — it deforms continuously without limit. The appropriate kinematic variable shifts from displacement to **velocity**.

## 5.1 Eulerian and Lagrangian Descriptions

<div class="definition">
<strong>Lagrangian Description.</strong> We label fluid particles by their initial positions \(\mathbf{a}\) and track how each particle moves. A quantity \(Q(\mathbf{a}, t)\) records the value of \(Q\) for the particle initially at \(\mathbf{a}\).
</div>

<div class="definition">
<strong>Eulerian Description.</strong> We observe fixed points in space. A quantity \(Q(\mathbf{x}, t)\) records the value of \(Q\) at the fixed location \(\mathbf{x}\) at time \(t\), regardless of which fluid particle is currently there.
</div>

The velocity field \(\mathbf{u}(\mathbf{x}, t)\) is naturally Eulerian: it tells you the velocity of whatever fluid particle happens to be at position \(\mathbf{x}\) at time \(t\). Almost all of fluid mechanics is formulated in the Eulerian frame. The Lagrangian frame appears in numerical simulations (particle tracking), in oceanography (Lagrangian floats), and in the theoretical analysis of transport and mixing.

## 5.2 Streamlines and Pathlines

<div class="definition">
<strong>Streamlines.</strong> At a fixed instant \(t^*\), the streamlines are curves \(\boldsymbol{\xi}(s)\) satisfying

\[
\boldsymbol{\xi}'(s) = \mathbf{u}\!\left(\boldsymbol{\xi}(s),\, t^*\right), \qquad \boldsymbol{\xi}(0) = \mathbf{x}_0
\]
At each point, the velocity vector is tangent to the streamline passing through that point.
</div>

<div class="definition">
<strong>Pathlines.</strong> The pathline of a particle released at \(\mathbf{x}_0\) is the curve \(\boldsymbol{\xi}(t)\) satisfying

\[
\dot{\boldsymbol{\xi}}(t) = \mathbf{u}\!\left(\boldsymbol{\xi}(t),\, t\right), \qquad \boldsymbol{\xi}(0) = \mathbf{x}_0
\]
This is the actual physical trajectory of the particle in space.
</div>

For **steady flows** (\(\partial \mathbf{u}/\partial t = 0\)), streamlines and pathlines coincide: since the velocity snapshot is frozen, a particle moves exactly along the streamline it is currently on. For unsteady flows they diverge, sometimes dramatically — a dye streak in an unsteady flow provides a **streakline** that is neither a streamline nor a pathline.

## 5.3 The Material Derivative

When a quantity \(Q(\mathbf{x}, t)\) is observed in the Eulerian frame, its rate of change at a fixed point is simply \(\partial Q / \partial t\). But the rate of change *following a fluid particle* involves an additional term from the particle moving through a spatially varying field:

<div class="definition">
<strong>Material (Substantial) Derivative.</strong>

\[
\frac{DQ}{Dt} = \frac{\partial Q}{\partial t} + (\mathbf{u} \cdot \nabla)\, Q
\]
The first term is the local rate of change at fixed \(\mathbf{x}\); the second is the advective contribution from transport through a non-uniform field.
</div>

The material derivative is the Eulerian representation of the Lagrangian time derivative. The acceleration of a fluid particle is \(D\mathbf{u}/Dt\), not \(\partial\mathbf{u}/\partial t\). The difference \((\mathbf{u}\cdot\nabla)\mathbf{u}\) is the nonlinear **advective acceleration** — the term responsible for much of the richness and difficulty of fluid dynamics.

## 5.4 Rate of Strain in a Fluid

Fluids resist not strain but **rate of strain**. The velocity gradient tensor \(\partial u_i / \partial x_j\) decomposes into its symmetric and antisymmetric parts:

\[
\frac{\partial u_i}{\partial x_j} = \dot{e}_{ij} + \Omega_{ij}
\]

where

\[
\dot{e}_{ij} = \frac{1}{2}\!\left(u_{i,j} + u_{j,i}\right) \quad [s^{-1}]
\]
is the **rate-of-strain tensor** and \(\Omega_{ij} = \frac{1}{2}(u_{i,j} - u_{j,i})\) is the **spin tensor** (local rotation rate). The rate-of-strain tensor is directly analogous to the strain tensor in elasticity; it measures how fast a fluid element is being deformed.

The spin tensor is related to the **vorticity** vector \(\boldsymbol{\omega} = \nabla \times \mathbf{u}\) by \(\omega_k = -\varepsilon_{kij}\Omega_{ij}\), where \(\varepsilon_{kij}\) is the Levi–Civita permutation symbol.

---

# Chapter 6: Inviscid Fluid Mechanics

## 6.1 Conservation of Mass

The first fundamental law is that matter is neither created nor destroyed. For a fluid with density \(\rho(\mathbf{x},t)\):

<div class="theorem">
<strong>Conservation of Mass (Continuity Equation).</strong>

\[
\frac{D\rho}{Dt} + \rho(\nabla \cdot \mathbf{u}) = 0
\]
For an <strong>incompressible fluid</strong> (\(\rho = \text{const}\)):

\[
\nabla \cdot \mathbf{u} = 0
\]
</div>

Incompressibility is an excellent approximation for liquids and for gas flows at Mach number \(Ma = U/c_s < 0.3\) (where \(c_s\) is the speed of sound). The condition \(\nabla \cdot \mathbf{u} = 0\) is a constraint on the velocity field — it has no time derivative, so it is not a dynamical equation but a kinematic restriction that eliminates compressional degrees of freedom.

## 6.2 Conservation of Momentum and the Euler Equations

Newton's second law for a fluid element, expressed using the material derivative:

\[
\rho\, \frac{D\mathbf{u}}{Dt} = -\rho\nabla\Pi + \nabla \cdot \boldsymbol{\tau}
\]
where \(\Pi\) is the gravitational potential (\(\nabla\Pi = g\hat{z}\) for a uniform field) and \(\boldsymbol{\tau}\) is the stress tensor.

For an **inviscid fluid** (\(\mu = 0\)), the stress is purely isotropic: \(\tau_{ij} = -p\,\delta_{ij}\). Writing the dynamic pressure \(\tilde{p} = \Pi + p/\rho_0\):

<div class="theorem">
<strong>Euler Equations for Incompressible Inviscid Flow.</strong>

\[
\nabla \cdot \mathbf{u} = 0, \qquad \frac{D\mathbf{u}}{Dt} = -\nabla\tilde{p}
\]
with \(\mu = 0\) and \(\rho = \rho_0\) (constant).
</div>

Despite neglecting viscosity entirely, the Euler equations describe a vast range of phenomena: surface ocean waves, tidal flows, acoustics, aerodynamics at high Reynolds number, and the large-scale dynamics of geophysical fluids. The reason is that viscosity matters primarily near solid boundaries (in thin **boundary layers**) and at small scales; away from boundaries and at large scales, the Euler equations are an excellent model.

## 6.3 Vorticity and Potential Flow

The **vorticity** \(\boldsymbol{\omega} = \nabla \times \mathbf{u}\) is the most important diagnostic of a flow's rotational character. Taking the curl of the Euler equations:

\[
\frac{D\boldsymbol{\omega}}{Dt} = (\boldsymbol{\omega} \cdot \nabla)\mathbf{u}
\]

The right-hand side is the **vortex stretching** term: if vortex lines are stretched by the flow, their vorticity intensifies (just as a spinning skater pulls in their arms to spin faster). In two dimensions, vortex stretching vanishes and vorticity is simply advected: \(D\omega/Dt = 0\).

**Kelvin's circulation theorem** states that for an inviscid barotropic fluid, the circulation around any closed material loop is conserved. This means that if a flow starts irrotational (\(\boldsymbol{\omega} = 0\) everywhere), it remains irrotational.

<div class="definition">
<strong>Irrotational (Potential) Flow.</strong> A flow with \(\boldsymbol{\omega} = \nabla \times \mathbf{u} = \mathbf{0}\) everywhere. In a simply connected domain, this implies the existence of a scalar <strong>velocity potential</strong>:

\[
\mathbf{u} = \nabla\phi
\]
Substituting into incompressibility: \(\nabla^2\phi = 0\) — the potential satisfies Laplace's equation.
</div>

The theory of potential flow is therefore the theory of harmonic functions, enriched with physical boundary conditions. On a solid boundary: \(\partial\phi/\partial n = 0\) (no normal flow through the wall). Far from a finite body: \(\mathbf{u} \to \mathbf{U}_\infty\) (uniform stream).

For irrotational flows, the Bernoulli equation gives the pressure directly from the velocity potential:

\[
\frac{\partial\phi}{\partial t} + \frac{1}{2}|\nabla\phi|^2 + \tilde{p} = \text{const}
\]

## 6.4 The Stream Function

In two-dimensional incompressible flow \(\mathbf{u} = (u(x,z), w(x,z))\), the incompressibility condition \(u_x + w_z = 0\) is automatically satisfied if we write:

\[
u = \psi_z, \qquad w = -\psi_x
\]

where \(\psi(x,z)\) is the **stream function**. The level curves \(\psi = \text{const}\) are **streamlines**: since \(\nabla\psi \cdot \mathbf{u} = \psi_z u + \psi_x(-w) = 0\), the velocity is tangent to curves of constant \(\psi\).

For irrotational 2D flow, \(\omega = w_x - u_z = -\nabla^2\psi = 0\), so \(\psi\) also satisfies Laplace's equation. Moreover, the combination \(\phi + i\psi\) is a complex analytic function of \(x + iz\), bringing the full power of complex analysis — conformal mappings, the Cauchy integral formula, residues — to bear on 2D potential flow. This is exploited extensively in AMATH 463 for aerofoil theory.

## 6.5 Surface Gravity Waves and Dispersion

The most important example of Euler-equation dynamics in this course is the propagation of small-amplitude waves on a free water surface. We linearise the Euler equations about a state of rest, seeking wave solutions of the form \(\phi \propto e^{kz}\cos(kx - \omega t)\) (in deep water, \(z < 0\) below the surface). Applying the kinematic and dynamic free-surface boundary conditions leads to:

<div class="theorem">
<strong>Deep-Water Dispersion Relation.</strong>

\[
\omega^2 = g\,|k|
\]
The phase speed is \(c_p = \omega/k = \sqrt{g/k}\) and the group velocity is \(c_g = d\omega/dk = \frac{1}{2}\sqrt{g/k} = \frac{1}{2}c_p\).
</div>

Three facts are immediately striking. First, longer waves (\(k\) small) travel faster: \(c_p \propto k^{-1/2}\). Second, the group velocity is exactly half the phase speed: energy propagates at half the rate of the wave crests. Third, the dispersion relation is **irrational** in \(k\), meaning the dispersion is strong — very different from the linear dispersion \(\omega = ck\) of sound or light.

The physical consequence: a pebble dropped in a pond creates a circular wave packet. Watching the packet, one sees individual crests appear at the inner (trailing) edge, travel forward through the group, and disappear at the outer (leading) edge — because the crests travel at twice the speed of the energy they carry. This remarkable phenomenon is a direct consequence of the dispersion relation.

---

# Chapter 7: Viscous Fluid Mechanics

Real fluids are never inviscid. Viscosity dissipates kinetic energy, enforces the no-slip condition at walls, and generates drag. The Euler equations are excellent far from boundaries and at large scales; the **Navier–Stokes equations** describe the full picture, including the critical region near solid walls where velocity must transition from the no-slip value to the free-stream value.

## 7.1 The Navier–Stokes Equations

For a Newtonian fluid, the viscous stress tensor is \(2\mu\,\dot{e}_{ij}\). The incompressible Cauchy momentum equation becomes:

<div class="theorem">
<strong>Navier–Stokes Equations (incompressible Newtonian fluid).</strong>

\[
\nabla \cdot \mathbf{u} = 0, \qquad \frac{D\mathbf{u}}{Dt} = -\nabla\tilde{p} + \nu\,\nabla^2\mathbf{u}
\]
where \(\nu = \mu/\rho\) [m²/s] is the <strong>kinematic viscosity</strong>.
</div>

The viscous term \(\nu\nabla^2\mathbf{u}\) diffuses momentum: regions of high velocity lose momentum to neighbouring regions of low velocity. The **no-slip boundary condition** \(\mathbf{u} = \mathbf{0}\) at solid boundaries is an empirical law consistent with molecular sticking and confirmed by countless experiments down to nanometre scales.

The Navier–Stokes equations are among the most important PDEs in science. They are nonlinear (through the advective term \((\mathbf{u}\cdot\nabla)\mathbf{u}\)) and coupled, making exact solutions rare. Nevertheless, several exact solutions exist for flows where geometry forces a dramatic simplification.

## 7.2 The Reynolds Number and Scaling

To understand when viscosity matters and when it does not, we nondimensionalise the equations. Scaling lengths by \(L\), velocities by \(U\), time by \(L/U\), and pressure by \(\rho U^2\), the Navier–Stokes equations take the form:

\[
\frac{D\mathbf{u}^*}{Dt^*} = -\nabla^*\tilde{p}^* + \frac{1}{Re}\,{\nabla^*}^2\mathbf{u}^*
\]

<div class="definition">
<strong>Reynolds Number.</strong>

\[
Re = \frac{UL}{\nu}
\]
This is the ratio of the inertial force \(\rho U^2/L\) to the viscous force \(\mu U/L^2 = \nu \rho U/L^2\).
</div>

At low \(Re\) (slow flows, small scales, high viscosity), viscosity dominates and the flow is smooth and laminar — **Stokes flow**. At high \(Re\) (fast flows, large scales, low viscosity), inertia dominates and the flow tends to become turbulent.

Representative values: blood in a capillary, \(Re \sim 10^{-3}\); swimming bacteria, \(Re \sim 10^{-4}\); a person swimming, \(Re \sim 10^6\); flow over an aircraft wing, \(Re \sim 10^7\). The onset of turbulence in a straight pipe occurs around \(Re \approx 2300\), though laminar flow can persist to much higher \(Re\) in carefully controlled experiments.

## 7.3 Exact Solution: Poiseuille Flow

For steady, fully developed flow between two infinite parallel plates at \(x = \pm h\), driven by a pressure gradient \(dp/dz\) in the \(z\)-direction, the Navier–Stokes equations reduce to a single ODE. Symmetry forces \(\mathbf{u} = u(x)\hat{z}\), and incompressibility is automatically satisfied. The momentum equation becomes:

\[
\nu\, \frac{d^2 u}{dx^2} = \frac{1}{\rho}\frac{dp}{dz} = \text{const}
\]

with no-slip \(u(\pm h) = 0\). Integrating twice and applying boundary conditions:

\[
u(x) = \frac{1}{2\nu}\frac{dp}{dz}\!\left(x^2 - h^2\right)
\]

This **parabolic profile** is the hallmark of Poiseuille (pressure-driven) flow. The maximum velocity is at the centreline \(x = 0\); the flow rate per unit width is \(Q = -\frac{2h^3}{3\nu}\frac{dp}{dz}\).

<figure style="text-align:center;margin:1.5em 0;">
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 320 200" width="320" height="200" style="max-width:100%;font-family:serif;font-size:12px;">
  <!-- Channel walls -->
  <rect x="60" y="20" width="220" height="12" fill="#aaa" rx="2"/>
  <rect x="60" y="168" width="220" height="12" fill="#aaa" rx="2"/>
  <text x="50" y="32" text-anchor="end" font-size="11">x = h</text>
  <text x="50" y="178" text-anchor="end" font-size="11">x = -h</text>
  <!-- Parabolic velocity profile (half-width 70px at centreline) -->
  <path d="M 60,100 Q 195,26 280,100" fill="rgba(68,136,204,0.15)" stroke="#4488cc" stroke-width="2.5"/>
  <path d="M 60,100 Q 195,174 280,100" fill="rgba(68,136,204,0.15)" stroke="#4488cc" stroke-width="2.5"/>
  <line x1="60" y1="100" x2="280" y2="100" stroke="#4488cc" stroke-width="0.8" stroke-dasharray="4,3"/>
  <!-- velocity arrows at several heights -->
  <line x1="60" y1="32" x2="65" y2="32" stroke="#33aa55" stroke-width="1.5" marker-end="url(#arH)"/>
  <line x1="60" y1="55" x2="105" y2="55" stroke="#33aa55" stroke-width="1.5" marker-end="url(#arH)"/>
  <line x1="60" y1="75" x2="155" y2="75" stroke="#33aa55" stroke-width="1.5" marker-end="url(#arH)"/>
  <line x1="60" y1="100" x2="195" y2="100" stroke="#33aa55" stroke-width="2.5" marker-end="url(#arH)"/>
  <line x1="60" y1="125" x2="155" y2="125" stroke="#33aa55" stroke-width="1.5" marker-end="url(#arH)"/>
  <line x1="60" y1="145" x2="105" y2="145" stroke="#33aa55" stroke-width="1.5" marker-end="url(#arH)"/>
  <line x1="60" y1="168" x2="65" y2="168" stroke="#33aa55" stroke-width="1.5" marker-end="url(#arH)"/>
  <!-- axis -->
  <line x1="60" y1="180" x2="60" y2="10" stroke="#333" stroke-width="1.5" marker-end="url(#arI)"/>
  <text x="50" y="100" text-anchor="end" font-size="11">0</text>
  <text x="40" y="10" font-size="11" font-style="italic">x</text>
  <!-- max velocity label -->
  <text x="200" y="97" font-size="11" fill="#4488cc">u_max</text>
  <text x="195" y="115" text-anchor="middle" font-size="10" fill="#555" font-style="italic">u(x) = u_max(1 − x²/h²)</text>
  <!-- pressure arrow -->
  <line x1="245" y1="100" x2="295" y2="100" stroke="#e05" stroke-width="1.5" stroke-dasharray="5,3" marker-end="url(#arJ)"/>
  <text x="298" y="103" fill="#e05" font-size="11">z</text>
  <text x="270" y="92" fill="#e05" font-size="10">dp/dz &lt; 0</text>
  <defs>
    <marker id="arH" markerWidth="7" markerHeight="5" refX="5" refY="2.5" orient="auto"><polygon points="0 0,7 2.5,0 5" fill="#33aa55"/></marker>
    <marker id="arI" markerWidth="7" markerHeight="5" refX="5" refY="2.5" orient="auto"><polygon points="0 0,7 2.5,0 5" fill="#333"/></marker>
    <marker id="arJ" markerWidth="7" markerHeight="5" refX="5" refY="2.5" orient="auto"><polygon points="0 0,7 2.5,0 5" fill="#e05"/></marker>
  </defs>
</svg>
<figcaption style="font-size:0.88em;color:#888;margin-top:0.3em;">Poiseuille flow between parallel plates: the parabolic velocity profile \(u(x) = u_{max}(1 - x^2/h^2)\). No-slip at both walls; maximum velocity at the centreline; driven by the pressure gradient \(dp/dz < 0\) in the flow direction.</figcaption>
</figure>

For flow in a circular pipe of radius \(R\) — **Hagen–Poiseuille flow** — the analogous result is:

\[
u(r) = \frac{1}{4\nu}\left(-\frac{dp}{dz}\right)(R^2 - r^2)
\]
with flow rate \(Q = \pi R^4 (-dp/dz) / (8\mu)\). The \(R^4\) dependence is dramatic: halving a blood vessel's radius (by arterial plaque) reduces flow by a factor of 16, which is why arterial stenosis causes such severe haemodynamic consequences.

## 7.4 Vorticity Dynamics

Taking the curl of the Navier–Stokes equations yields the **vorticity equation**:

\[
\frac{D\boldsymbol{\omega}}{Dt} = (\boldsymbol{\omega} \cdot \nabla)\mathbf{u} + \nu\,\nabla^2\boldsymbol{\omega}
\]

The three contributions are:
- \(D\boldsymbol{\omega}/Dt\): rate of change of vorticity following a fluid particle
- \((\boldsymbol{\omega}\cdot\nabla)\mathbf{u}\): **vortex stretching** — vorticity amplified by differential advection
- \(\nu\nabla^2\boldsymbol{\omega}\): **viscous diffusion** of vorticity

Vortex stretching is absent in two-dimensional flows (since \(\boldsymbol{\omega}\) is perpendicular to the plane of motion and cannot be stretched by an in-plane velocity gradient). In 2D, vorticity simply advects and diffuses:

\[
\frac{D\omega}{Dt} = \nu\,\nabla^2\omega
\]

This is structurally identical to the advection-diffusion equation for a passive scalar (such as temperature or dye concentration). The analogy is deep: just as dye spreads by diffusion and is carried by the flow, so does vorticity. Vorticity is created at solid boundaries (where the no-slip condition imposes a discontinuity in velocity), diffuses away from the wall, and is swept downstream. The entire structure of viscous boundary layers can be understood as the diffusion of wall-generated vorticity into the flow interior.

---

# Chapter 8: Applications — Bernoulli's Theorem and Potential Flow

The governing equations of ideal fluid mechanics — the Euler equations for an inviscid, incompressible fluid — are nonlinear partial differential equations, and in general they resist closed-form solution. Yet two classical techniques, **Bernoulli's theorem** and **potential flow theory**, carve out a rich class of problems that admit exact, elegant solutions. Bernoulli's theorem converts the momentum equation into an algebraic conservation law along streamlines, while potential flow reduces the entire velocity field to a single scalar satisfying Laplace's equation. Together they underpin much of classical aerodynamics and hydraulics.

## 8.1 Bernoulli's Theorem

Consider the steady Euler momentum equation for an incompressible fluid of uniform density \(\rho\):

\[
(\mathbf{u}\cdot\nabla)\mathbf{u} = -\frac{1}{\rho}\nabla p + \mathbf{g}
\]

We write \(\mathbf{g} = -\nabla(gz)\) (taking \(z\) upward) and use the vector identity

\[
(\mathbf{u}\cdot\nabla)\mathbf{u} = \nabla\!\left(\tfrac{1}{2}|\mathbf{u}|^2\right) - \mathbf{u}\times\boldsymbol{\omega}
\]

where \(\boldsymbol{\omega} = \nabla\times\mathbf{u}\) is the vorticity. The momentum equation becomes:

\[
\nabla\!\left(\frac{p}{\rho} + \tfrac{1}{2}|\mathbf{u}|^2 + gz\right) = \mathbf{u}\times\boldsymbol{\omega}
\]

Now take the dot product with \(\mathbf{u}\). Since \(\mathbf{u}\cdot(\mathbf{u}\times\boldsymbol{\omega}) = 0\) identically (the cross product is perpendicular to \(\mathbf{u}\)), we obtain:

\[
\mathbf{u}\cdot\nabla\!\left(\frac{p}{\rho} + \tfrac{1}{2}|\mathbf{u}|^2 + gz\right) = 0
\]

This says that the quantity in parentheses is constant along streamlines (curves everywhere tangent to \(\mathbf{u}\)).

<div class="theorem">
<strong>Bernoulli's Theorem (steady, inviscid, incompressible flow).</strong> Along any streamline,

\[
p + \tfrac{1}{2}\rho|\mathbf{u}|^2 + \rho g z = \text{const}
\]
The three terms are the <strong>static pressure</strong>, <strong>dynamic pressure</strong>, and <strong>hydrostatic pressure</strong> respectively. Their sum, the <strong>stagnation pressure</strong>, is conserved along each streamline.
</div>

If the flow is additionally **irrotational** (\(\boldsymbol{\omega} = 0\)), then the right-hand side vanishes everywhere (not just along \(\mathbf{u}\)), and the Bernoulli quantity is constant throughout the entire flow domain — a stronger result.

<div class="theorem">
<strong>Bernoulli's Theorem (irrotational form).</strong> For steady, inviscid, incompressible, irrotational flow,

\[
p + \tfrac{1}{2}\rho|\mathbf{u}|^2 + \rho g z = \text{const everywhere}
\]
</div>

**Applications.** The practical power of Bernoulli's theorem is considerable. In a **Venturi tube**, a pipe narrows from cross-sectional area \(A_1\) to \(A_2 < A_1\). Continuity demands \(u_1 A_1 = u_2 A_2\), so the fluid accelerates. Bernoulli then requires \(p_1 - p_2 = \tfrac{1}{2}\rho(u_2^2 - u_1^2) > 0\): pressure drops in the constriction. Measuring this pressure difference with a manometer gives the flow speed without any moving parts.

A **Pitot tube** is a bent tube with one opening facing the oncoming flow and one opening perpendicular to it. At the forward-facing stagnation point the flow speed is zero, so \(p_\text{stag} = p_\infty + \tfrac{1}{2}\rho U^2\), where \(U\) is the free-stream speed. Comparing \(p_\text{stag}\) to the static pressure \(p_\infty\) measured at the side port directly gives the airspeed — the operating principle of every aircraft airspeed indicator.

For flow over an **aerofoil**, the geometry forces the flow above the wing to travel a greater distance and therefore at higher speed than the flow below. By Bernoulli, the upper surface has lower pressure than the lower surface, and the net upward pressure difference integrated over the wing chord gives **lift**. (Quantifying this rigorously requires the **Kutta condition** and the **Kutta–Joukowski theorem** \(L = \rho U \Gamma\), where \(\Gamma\) is the circulation around the aerofoil.)

**Caveats.** Bernoulli's theorem in the form above applies only when: (i) the flow is **steady** (no explicit time dependence); (ii) the fluid is **inviscid** (no shear stresses); (iii) the fluid is **incompressible** (\(\rho\) = const); and (iv) the relation holds along a single streamline (or everywhere, if irrotational). In unsteady flows an additional term \(\partial\phi/\partial t\) (involving the velocity potential \(\phi\)) appears; in compressible flows \(p/\rho\) is replaced by the enthalpy; and across streamlines in rotational flows the constant of integration differs from line to line.

## 8.2 Potential Flow

When the flow is irrotational, \(\boldsymbol{\omega} = \nabla\times\mathbf{u} = 0\), a classical theorem of vector calculus guarantees the existence of a scalar **velocity potential** \(\phi\) such that

\[
\mathbf{u} = \nabla\phi
\]

Substituting into the incompressibility condition \(\nabla\cdot\mathbf{u} = 0\) yields Laplace's equation:

\[
\nabla^2\phi = 0
\]

The problem of finding the flow is thus reduced from solving a nonlinear vector PDE (Euler) to solving a linear scalar PDE (Laplace) — an enormous simplification. The pressure is then recovered a posteriori from the Bernoulli relation.

<div class="definition">
<strong>Velocity Potential.</strong> A scalar field \(\phi(\mathbf{x},t)\) is a velocity potential for the flow \(\mathbf{u}\) if \(\mathbf{u} = \nabla\phi\). Potential flows are automatically irrotational, and for incompressible fluids \(\phi\) satisfies \(\nabla^2\phi = 0\).
</div>

**The stream function in 2D.** For two-dimensional incompressible flow \(\mathbf{u} = (u, v)\) with \(\partial u/\partial x + \partial v/\partial y = 0\), there exists a **stream function** \(\psi\) such that

\[
u = \frac{\partial\psi}{\partial y}, \qquad v = -\frac{\partial\psi}{\partial x}
\]

Curves of constant \(\psi\) are **streamlines**: since \(d\psi = \psi_x\,dx + \psi_y\,dy = -v\,dx + u\,dy = 0\) along \(dy/dx = v/u\). Moreover, the volume flux between two streamlines equals the difference of their \(\psi\)-values. For irrotational 2D flow, substituting the stream function into \(\omega = \partial v/\partial x - \partial u/\partial y = 0\) gives \(\nabla^2\psi = 0\) as well. Both \(\phi\) and \(\psi\) satisfy Laplace's equation.

**The complex potential.** In two dimensions, introduce the complex variable \(z = x + iy\) (not to be confused with the vertical coordinate) and define the **complex potential**

\[
w(z) = \phi(x,y) + i\psi(x,y)
\]

The Cauchy–Riemann equations, which are the condition for \(w\) to be a holomorphic (complex-analytic) function, state \(\phi_x = \psi_y\) and \(\phi_y = -\psi_x\). These are precisely the relations \(u = \phi_x = \psi_y\) and \(v = \phi_y = -\psi_x\). Therefore, **every holomorphic function \(w(z)\) generates a valid 2D potential flow**, and the complex velocity is \(dw/dz = u - iv\). This identification with complex analysis opens the entire toolkit of conformal mappings to the aerodynamicist.

**Elementary solutions.** The linearity of Laplace's equation means that solutions may be superposed freely. The following elementary flows are the building blocks:

<div class="example">
<strong>Uniform stream.</strong> \(w = Ue^{-i\alpha}z\), giving \(\phi = U(x\cos\alpha + y\sin\alpha)\), streamlines are straight lines at angle \(\alpha\) to the \(x\)-axis.
</div>

<div class="example">
<strong>Line source/sink.</strong> \(w = \frac{m}{2\pi}\ln z\), where \(m > 0\) is the source strength (volume flux per unit depth). In polar coordinates, \(\phi = \frac{m}{2\pi}\ln r\), \(\psi = \frac{m}{2\pi}\theta\). The radial velocity is \(u_r = m/(2\pi r)\) and there is no azimuthal component. A sink has \(m < 0\).
</div>

<div class="example">
<strong>Doublet.</strong> Formed by placing a source of strength \(m\) at \(-\epsilon\) and a sink of equal strength at \(+\epsilon\) on the real axis and taking \(m\epsilon \to \kappa/2\pi\) as \(\epsilon\to 0\). The complex potential is \(w = \kappa/(2\pi z)\); in polar form \(\phi = (\kappa/2\pi)(x/r^2)\), \(\psi = -(\kappa/2\pi)(y/r^2)\). The streamlines are circles through the origin.
</div>

<div class="example">
<strong>Point vortex.</strong> \(w = -\frac{i\Gamma}{2\pi}\ln z\), where \(\Gamma\) is the circulation. Then \(\phi = \Gamma\theta/(2\pi)\), \(\psi = -\Gamma\ln r/(2\pi)\). The azimuthal velocity is \(u_\theta = \Gamma/(2\pi r)\); radial velocity vanishes. Streamlines are circles centred on the vortex.
</div>

**Flow past a cylinder.** Superpose a uniform stream \(w_1 = Uz\) and a doublet \(w_2 = Ua^2/z\) (strength \(\kappa = 2\pi U a^2\)):

\[
w = U\!\left(z + \frac{a^2}{z}\right)
\]

In polar coordinates, \(\psi = U(r - a^2/r)\sin\theta\). On \(r = a\), \(\psi = 0\): the circle of radius \(a\) is a streamline, i.e., it can be regarded as a solid cylinder. The velocity components are

\[
u_r = U\!\left(1 - \frac{a^2}{r^2}\right)\cos\theta, \qquad u_\theta = -U\!\left(1 + \frac{a^2}{r^2}\right)\sin\theta
\]

On the cylinder surface (\(r = a\)), \(u_r = 0\) and \(u_\theta = -2U\sin\theta\). By Bernoulli (with gravity neglected), the surface pressure is

\[
p = p_\infty + \tfrac{1}{2}\rho U^2\bigl(1 - 4\sin^2\theta\bigr)
\]

The pressure distribution is symmetric fore-and-aft, which leads to the remarkable conclusion discussed in Section 8.3.

Adding a vortex of circulation \(\Gamma\) to the doublet-plus-stream gives **flow past a cylinder with circulation**, whose pressure distribution is no longer symmetric top-to-bottom, generating a net **lift force** \(L = \rho U \Gamma\) per unit span — the Kutta–Joukowski theorem. This is the simplest model of how a spinning cylinder (Magnus effect) or an aerofoil generates lift.

## 8.3 D'Alembert's Paradox and Its Resolution

The pressure distribution for flow past a cylinder derived above integrates to zero net force in any direction. This is not a coincidence of the cylinder geometry.

<div class="theorem">
<strong>D'Alembert's Paradox.</strong> In steady, inviscid, incompressible, irrotational flow past a body of arbitrary shape, the net hydrodynamic drag on the body is zero.
</div>

The result follows from the **Blasius theorem**: for a body with boundary \(C\), the complex force per unit depth is \(F_x - iF_y = \tfrac{i\rho}{2}\oint_C \left(dw/dz\right)^2 dz\). For any potential flow that is \(O(1/r)\) at large \(r\) (faster than the source decay), the residue theorem applied to a large contour yields zero net force. Put differently, the fore-aft symmetry of irrotational flow means the pressure deceleration on the front face of a body is exactly matched by the pressure acceleration on the rear face: there is no **form drag**.

This prediction flatly contradicts everyday experience — aeroplanes and ships clearly experience drag — and was recognised as a fundamental difficulty almost immediately after the mathematical result was established in the eighteenth century.

**Resolution.** The paradox is resolved by viscosity, which becomes important in a thin **boundary layer** near any solid surface no matter how small the viscosity (as long as it is nonzero). Within the boundary layer, the no-slip condition decelerates the fluid from the free-stream velocity to zero over a distance of order \(\delta \sim (\nu L/U)^{1/2}\). When the pressure rises sufficiently steeply on the rear of a body (an **adverse pressure gradient**), the boundary-layer flow separates from the wall, forming a turbulent **wake** with a momentum deficit. This momentum deficit is what the body's drag must supply. Inviscid potential flow predicts no wake and hence no drag because it enforces no no-slip condition and allows the flow to turn the corner at the rear with no separation.

Prandtl's **boundary-layer theory** (1904) provided the quantitative reconciliation: at high Reynolds numbers the flow is potential flow everywhere except in an \(O(\text{Re}^{-1/2})\)-thick boundary layer and in the wake. The boundary layer carries the vorticity generated at the wall (recall Section 7.4) and is the seat of all viscous effects. The theory, which is developed systematically in AMATH 463, is arguably the most important asymptotic theory in classical fluid mechanics.

---

# Part III — Thermodynamics and Electromagnetic Extensions

# Chapter 9: Thermodynamics and Equations of State

The equations of motion developed so far — the continuity equation and the Navier–Stokes equations — govern five scalar fields: density \(\rho\), the three velocity components \((u,v,w)\), and pressure \(p\). For an incompressible fluid with given body force and viscosity these five equations (one continuity, three momentum, one incompressibility constraint) close the system. For a **compressible** fluid, however, density and pressure are not independent: we need an additional thermodynamic relation between them, an **equation of state**, together with an energy equation governing temperature. This chapter provides that closure.

## 9.1 Thermodynamic Quantities

We model the fluid as a **simple compressible substance** characterised at each material point by a small set of thermodynamic state variables. The primary quantities are:

- **Internal energy** \(e\) (per unit mass): the microscopic kinetic and potential energy of the molecules.
- **Enthalpy** \(h = e + p/\rho\): the thermodynamic potential natural for constant-pressure processes and for analysing flow through ducts and nozzles.
- **Temperature** \(T\): the absolute temperature in Kelvin.
- **Entropy** \(s\) (per unit mass): a measure of the disorder of the molecular state; central to understanding irreversibility.

Two material constants characterise how a fluid stores heat:

<div class="definition">
<strong>Specific Heats.</strong> The <strong>specific heat at constant volume</strong> \(c_v\) is the energy required to raise the temperature of unit mass by one Kelvin at fixed volume: \(c_v = (\partial e/\partial T)_v\). The <strong>specific heat at constant pressure</strong> \(c_p\) is defined analogously at fixed pressure: \(c_p = (\partial h/\partial T)_p\). The ratio \(\gamma = c_p/c_v\) (the <strong>adiabatic index</strong>) equals \(7/5 = 1.4\) for diatomic gases (air) and \(5/3 \approx 1.67\) for monatomic noble gases.
</div>

For an **ideal gas**, \(c_v\) and \(c_p\) are constants independent of temperature, and one can show from statistical mechanics that \(c_p - c_v = R\), where \(R\) is the **specific gas constant** (universal gas constant divided by molar mass: \(R = 287\) J kg\(^{-1}\) K\(^{-1}\) for air).

## 9.2 The First Law of Thermodynamics

The **first law** for a fluid parcel moving with the flow states that the rate of change of internal energy equals the work done by compression plus the heat added. Expressed in terms of material derivatives:

\[
\frac{De}{Dt} = -p\,\frac{D}{Dt}\!\left(\frac{1}{\rho}\right) + \dot{Q}
\]

Here \(1/\rho\) is the specific volume (volume per unit mass), so \(-p\,D(1/\rho)/Dt\) is the compressive work done on the parcel per unit time and per unit mass. The term \(\dot{Q}\) (J kg\(^{-1}\) s\(^{-1}\)) represents all heat additions: conduction, radiation, and internal heat sources such as viscous dissipation.

Since \(h = e + p/\rho\), we compute \(Dh/Dt = De/Dt + (1/\rho)Dp/Dt + p\,D(1/\rho)/Dt\). Substituting the first law:

\[
\frac{Dh}{Dt} = \frac{1}{\rho}\frac{Dp}{Dt} + \dot{Q}
\]

This form is especially convenient in compressible duct flows where the pressure history of a parcel is prescribed.

**Connection to the macroscopic energy equation.** The energy equation for a fluid element can also be derived by taking the dot product of the momentum equation with \(\mathbf{u}\) and combining with continuity. The result, in the absence of viscosity, is:

\[
\frac{\partial}{\partial t}\!\left(\tfrac{1}{2}\rho|\mathbf{u}|^2 + \rho e\right) + \nabla\cdot\!\left[\mathbf{u}\left(\tfrac{1}{2}\rho|\mathbf{u}|^2 + \rho e + p\right)\right] = \rho\dot{Q}
\]

This is a conservation law: the rate of change of total energy (kinetic plus internal) in a volume equals the flux of energy (kinetic + internal + pressure work) through the boundary plus the heat source. The appearance of the enthalpy \(h = e + p/\rho\) in the flux term — rather than just \(e\) — reflects the flow work done by pressure forces moving the fluid across the control surface.

## 9.3 Entropy and the Second Law

The thermodynamic identity relating entropy to other state variables is the **Gibbs relation**:

\[
T\,ds = de + p\,d\!\left(\frac{1}{\rho}\right)
\]

In rate form following a fluid parcel, \(T\,Ds/Dt = De/Dt + p\,D(1/\rho)/Dt\). Comparing with the first law, we immediately identify:

<div class="theorem">
<strong>Entropy Equation.</strong> For a fluid parcel,

\[
T\,\frac{Ds}{Dt} = \dot{Q}
\]
For an <strong>adiabatic</strong> (\(\dot{Q} = 0\)) and <strong>reversible</strong> (frictionless) process, entropy is conserved along particle paths: \(Ds/Dt = 0\). Such a flow is called <strong>isentropic</strong>.
</div>

The **second law** states that irreversible processes (viscous dissipation, heat conduction across a temperature gradient) generate entropy: \(\dot{Q}_\text{irrev} > 0\) at the molecular scale. Therefore, for a real viscous heat-conducting fluid, \(Ds/Dt \geq 0\) for every fluid parcel, with equality only in the ideal (inviscid, non-conducting) limit.

For an **ideal fluid** (inviscid and non-heat-conducting), \(Ds/Dt = 0\) following every parcel. This means that material surfaces of constant entropy are preserved by the flow: if the fluid is homentropic (uniform \(s\)) initially, it remains so for all time. Under isentropic conditions the equations of state simplify greatly, as the next section shows.

## 9.4 Ideal Gas Equation of State

For an ideal gas the equation of state is:

<div class="definition">
<strong>Ideal Gas Law.</strong>

\[
p = \rho R T
\]
where \(R = c_p - c_v\) is the specific gas constant. For air, \(R \approx 287\) J kg\(^{-1}\) K\(^{-1}\) and \(\gamma = 1.4\).
</div>

Combining the ideal gas law with the isentropic condition \(Ds/Dt = 0\) (i.e., \(de = -p\,d(1/\rho)\) and \(e = c_v T\)), one derives the **isentropic relations**:

\[
\frac{p}{p_0} = \left(\frac{\rho}{\rho_0}\right)^\gamma = \left(\frac{T}{T_0}\right)^{\gamma/(\gamma-1)}
\]

where the subscript \(0\) denotes a reference state. Equivalently, \(p = C\rho^\gamma\) for some constant \(C\) that is the same for all parcels in a homentropic flow.

**Sound speed.** The speed of sound is the speed at which small isentropic pressure perturbations propagate:

\[
c^2 = \left.\frac{\partial p}{\partial \rho}\right|_s = \frac{\gamma p}{\rho} = \gamma R T
\]

For air at 20°C, \(c \approx 343\) m s\(^{-1}\). The **Mach number** \(M = |\mathbf{u}|/c\) measures the ratio of flow speed to sound speed; flows with \(M \ll 1\) are effectively incompressible, while \(M > 1\) (supersonic) flows develop shock waves — surfaces across which entropy is produced and the isentropic relations break down.

**Potential temperature.** In atmospheric science it is convenient to track parcels by their **potential temperature**:

\[
\theta = T\!\left(\frac{p_0}{p}\right)^{R/c_p}
\]

where \(p_0\) is a reference pressure (conventionally 1000 hPa). Under isentropic conditions \(Ds/Dt = 0\), one can show \(D\theta/Dt = 0\): potential temperature is conserved along parcel trajectories. Atmospheric stability is determined by the vertical gradient of \(\theta\): if \(\partial\theta/\partial z > 0\) the atmosphere is stably stratified and resists vertical motion; if \(\partial\theta/\partial z < 0\) it is convectively unstable.

## 9.5 Closing the System

We are now in a position to count equations and unknowns for the full compressible fluid system.

**Unknowns.** In three dimensions: density \(\rho\), three velocity components \((u,v,w)\), pressure \(p\), temperature \(T\), and specific entropy \(s\) — seven scalar fields in total. The equation of state \(p = \rho R T\) reduces this to six independent variables; fixing any two of \(\{p, \rho, T, s\}\) via the equation of state determines the others through thermodynamic identities.

**Equations.** The governing system for a compressible ideal (inviscid, non-heat-conducting) gas is:

<div class="theorem">
<strong>Compressible Euler System (ideal gas).</strong>
<ol>
<li><strong>Continuity:</strong> \(\partial\rho/\partial t + \nabla\cdot(\rho\mathbf{u}) = 0\)</li>
<li><strong>Momentum</strong> (3 equations): \(\rho\,D\mathbf{u}/Dt = -\nabla p + \rho\mathbf{g}\)</li>
<li><strong>Energy/Entropy:</strong> \(Ds/Dt = 0\) (or equivalently \(D\theta/Dt = 0\))</li>
<li><strong>Equation of state:</strong> \(p = \rho R T\) (and \(p = C\rho^\gamma\) for homentropic flow)</li>
</ol>
This gives 1 + 3 + 1 + 1 = 6 equations for 6 unknowns \((\rho, u, v, w, p, T)\) (with \(s\) determined by the equation of state). The system is closed.
</div>

**Incompressible limit.** For liquids or low-Mach-number gas flows, \(\rho = \text{const}\) and the system simplifies drastically. The continuity equation reduces to \(\nabla\cdot\mathbf{u} = 0\). The isentropic condition \(Ds/Dt = 0\) is automatically satisfied if the flow is homentropic. The thermodynamic equations decouple entirely from the momentum equation (temperature is advected passively if needed). We are left with:

- Continuity: \(\nabla\cdot\mathbf{u} = 0\) — 1 equation
- Navier–Stokes momentum: \(\rho\,D\mathbf{u}/Dt = -\nabla p + \mu\nabla^2\mathbf{u} + \rho\mathbf{g}\) — 3 equations

This is 4 equations for 4 unknowns \((u, v, w, p)\). The incompressible Navier–Stokes system is therefore self-contained, confirming that all the fluid mechanics in Chapters 6 and 7 was already complete without thermodynamics. The full compressible machinery of the present chapter is essential only when \(M\) is not small, or when temperature effects (buoyancy, stratification, chemical reactions) play a dynamical role.

---

# Chapter 10: Magnetohydrodynamics

**Magnetohydrodynamics** (MHD) is the study of electrically conducting fluids — plasmas, liquid metals, and electrolyte solutions — in the presence of magnetic fields. The defining feature of MHD is the two-way coupling between fluid motion and the magnetic field: the flow distorts and advects the field, while the field exerts forces on the fluid via the Lorentz force. This mutual interaction produces a rich phenomenology absent from ordinary hydrodynamics: waves guided by field lines, equilibria maintained by magnetic pressure and tension, and the spontaneous generation of large-scale magnetic fields by the fluid dynamo effect.

MHD is central to geophysics (the generation of Earth's magnetic field by convection in the liquid iron outer core), solar physics (the structure of sunspots, the solar corona, the solar wind), plasma physics (magnetic confinement fusion in tokamaks), and astrophysics (accretion discs around black holes, neutron star magnetospheres). The Winter 2026 edition of AMATH 361 introduces MHD as a natural extension of the continuum framework developed in the preceding chapters: the fluid is described by the Navier–Stokes equations, and Maxwell's equations govern the electromagnetic field, with the two coupled through Ohm's law and the Lorentz force.

## 10.1 Maxwell's Equations and the Lorentz Force

The electromagnetic field is described by the electric field \(\mathbf{E}\) and magnetic flux density \(\mathbf{B}\), related to the free charge density \(\rho_e\) and free current density \(\mathbf{J}\) by **Maxwell's equations**:

\[
\nabla\cdot\mathbf{B} = 0
\]

\[
\nabla\cdot\mathbf{E} = \frac{\rho_e}{\varepsilon_0}
\]

\[
\nabla\times\mathbf{E} = -\frac{\partial\mathbf{B}}{\partial t}
\]

\[
\nabla\times\mathbf{B} = \mu_0\mathbf{J} + \mu_0\varepsilon_0\frac{\partial\mathbf{E}}{\partial t}
\]

The four equations are, in order: no magnetic monopoles, Gauss's law, Faraday's law, and the Ampère–Maxwell law. Here \(\mu_0 = 4\pi\times 10^{-7}\) H m\(^{-1}\) is the magnetic permeability of free space and \(\varepsilon_0 = 8.85\times 10^{-12}\) F m\(^{-1}\) is the permittivity.

**The MHD approximation.** In most conducting fluids of interest, the fluid velocity \(U\) satisfies \(U \ll c\) (where \(c = 1/\sqrt{\mu_0\varepsilon_0}\) is the speed of light). Under this non-relativistic assumption, the **displacement current** \(\mu_0\varepsilon_0\,\partial\mathbf{E}/\partial t\) in the Ampère–Maxwell law is of order \((U/c)^2\) relative to the magnetic field term \(\nabla\times\mathbf{B}\) and can be neglected. The Ampère law then reduces to:

\[
\nabla\times\mathbf{B} = \mu_0\mathbf{J}
\]

This pre-Maxwell approximation is the cornerstone of MHD. It implies, on taking the divergence, that \(\nabla\cdot\mathbf{J} = 0\) — current is divergence-free in MHD — and that we need not separately track \(\mathbf{E}\) as a dynamic variable.

**Ohm's law for a moving conductor.** In a reference frame moving with the fluid at velocity \(\mathbf{u}\), the electric field seen by the fluid is \(\mathbf{E} + \mathbf{u}\times\mathbf{B}\). **Ohm's law** for a conducting fluid with electrical conductivity \(\sigma\) (units: S m\(^{-1}\)) states that the current density is proportional to this effective electric field:

\[
\mathbf{J} = \sigma(\mathbf{E} + \mathbf{u}\times\mathbf{B})
\]

For a **perfect conductor** (\(\sigma\to\infty\)) we must have \(\mathbf{E} + \mathbf{u}\times\mathbf{B} = 0\) to keep \(\mathbf{J}\) finite. For a resistive conductor, the ratio \(\eta = 1/(\mu_0\sigma)\) is the **magnetic diffusivity** (units: m\(^2\) s\(^{-1}\)), which plays the role for the magnetic field that kinematic viscosity \(\nu\) plays for the vorticity.

**The Lorentz force.** A volume element carrying current density \(\mathbf{J}\) in a magnetic field \(\mathbf{B}\) experiences a body force per unit volume:

<div class="definition">
<strong>Lorentz Force Density.</strong>

\[
\mathbf{f} = \mathbf{J}\times\mathbf{B}
\]
This force couples the electromagnetic field to the fluid momentum equation. Using the MHD Ampère law \(\mathbf{J} = \nabla\times\mathbf{B}/\mu_0\), we can write the Lorentz force entirely in terms of \(\mathbf{B}\):

\[
\mathbf{f} = \frac{1}{\mu_0}(\nabla\times\mathbf{B})\times\mathbf{B} = -\nabla\!\left(\frac{B^2}{2\mu_0}\right) + \frac{1}{\mu_0}(\mathbf{B}\cdot\nabla)\mathbf{B}
\]
</div>

The identity used in the last step is the vector identity \((\nabla\times\mathbf{B})\times\mathbf{B} = (\mathbf{B}\cdot\nabla)\mathbf{B} - \nabla(B^2/2)\). The two resulting terms have transparent physical interpretations that will be discussed in Section 10.3.

## 10.2 The Induction Equation

The equation governing the evolution of \(\mathbf{B}\) is derived by eliminating \(\mathbf{E}\) and \(\mathbf{J}\) among Faraday's law, Ohm's law, and the MHD Ampère law.

From Ohm's law, \(\mathbf{E} = \mathbf{J}/\sigma - \mathbf{u}\times\mathbf{B}\). Substituting \(\mathbf{J} = \nabla\times\mathbf{B}/\mu_0\):

\[
\mathbf{E} = \frac{1}{\mu_0\sigma}\nabla\times\mathbf{B} - \mathbf{u}\times\mathbf{B} = \eta\,\nabla\times\mathbf{B} - \mathbf{u}\times\mathbf{B}
\]

Now substitute into Faraday's law \(\partial\mathbf{B}/\partial t = -\nabla\times\mathbf{E}\):

\[
\frac{\partial\mathbf{B}}{\partial t} = \nabla\times(\mathbf{u}\times\mathbf{B}) - \eta\,\nabla\times(\nabla\times\mathbf{B})
\]

Using \(\nabla\times(\nabla\times\mathbf{B}) = \nabla(\nabla\cdot\mathbf{B}) - \nabla^2\mathbf{B} = -\nabla^2\mathbf{B}\) (since \(\nabla\cdot\mathbf{B} = 0\)):

<div class="theorem">
<strong>The Induction Equation.</strong>

\[
\frac{\partial\mathbf{B}}{\partial t} = \nabla\times(\mathbf{u}\times\mathbf{B}) + \eta\,\nabla^2\mathbf{B}
\]
The first term on the right is the <strong>advective</strong> (or inductive) term, describing the distortion and advection of magnetic field lines by the flow. The second term is <strong>magnetic diffusion</strong>, which smooths out field gradients on a timescale \(\tau_\eta \sim L^2/\eta\).
</div>

This equation has the same mathematical structure as the vorticity equation (Section 7.4): a material transport equation with a diffusion term. Indeed, in the limit of **ideal MHD** (\(\eta = 0\), i.e., infinite conductivity), the induction equation reduces to \(\partial\mathbf{B}/\partial t = \nabla\times(\mathbf{u}\times\mathbf{B})\), which is identical in form to the equation for vorticity in an inviscid fluid.

**The magnetic Reynolds number.** The relative importance of advection and diffusion is measured by the **magnetic Reynolds number**:

<div class="definition">
<strong>Magnetic Reynolds Number.</strong>

\[
Rm = \frac{UL}{\eta}
\]
where \(U\) is a characteristic velocity scale and \(L\) a characteristic length scale. When \(Rm \gg 1\) (advection dominates), magnetic field lines are effectively "frozen" into the fluid. When \(Rm \ll 1\) (diffusion dominates), the field diffuses almost independently of the flow.
</div>

In the Earth's liquid core, \(U \sim 10^{-4}\) m s\(^{-1}\), \(L \sim 10^6\) m, \(\eta \sim 1\) m\(^2\) s\(^{-1}\), giving \(Rm \sim 10^2\). In the solar convection zone, \(Rm \sim 10^8\). In laboratory liquid-metal experiments, \(Rm \sim 1\text{–}10^2\). The large values in natural systems mean that flux freezing is an excellent approximation there.

**Alfvén's frozen flux theorem.** In the ideal MHD limit (\(\eta = 0\)), the magnetic flux through any material surface (a surface that moves with the fluid) is conserved:

\[
\frac{d}{dt}\int_{\mathcal{S}(t)}\mathbf{B}\cdot d\mathbf{A} = 0
\]

This means that magnetic field lines are **frozen into the fluid**: two fluid parcels that initially lie on the same field line always remain on the same field line. The field lines are material lines, carried along and stretched (but not broken) by the flow. Flux freezing is the fundamental organizing principle of ideal MHD, constraining how the magnetic topology can evolve.

## 10.3 The MHD Equations

Combining the Navier–Stokes equations (here in the inviscid limit for clarity) with the induction equation and the Lorentz body force, we obtain the **ideal MHD system**:

<div class="theorem">
<strong>Ideal MHD Equations.</strong>

\[
\frac{\partial\rho}{\partial t} + \nabla\cdot(\rho\mathbf{u}) = 0 \quad\text{(continuity)}
\]

\[
\rho\frac{D\mathbf{u}}{Dt} = -\nabla p + \frac{1}{\mu_0}(\nabla\times\mathbf{B})\times\mathbf{B} \quad\text{(momentum)}
\]

\[
\frac{\partial\mathbf{B}}{\partial t} = \nabla\times(\mathbf{u}\times\mathbf{B}) \quad\text{(induction, ideal MHD)}
\]

\[
\nabla\cdot\mathbf{B} = 0 \quad\text{(solenoidal constraint)}
\]
</div>

(Body forces such as gravity are omitted here but can be added; an energy equation closes the system for compressible fluids.)

**Physical interpretation of the Lorentz force.** Using the identity derived at the end of Section 10.1, the momentum equation becomes:

\[
\rho\frac{D\mathbf{u}}{Dt} = -\nabla\!\left(p + \frac{B^2}{2\mu_0}\right) + \frac{1}{\mu_0}(\mathbf{B}\cdot\nabla)\mathbf{B}
\]

This decomposition reveals two physically distinct contributions:

<div class="definition">
<strong>Magnetic Pressure and Tension.</strong>
<ul>
<li><strong>Magnetic pressure:</strong> \(p_B = B^2/(2\mu_0)\). This acts like an isotropic pressure, pushing fluid away from regions of strong field. It adds to the thermodynamic pressure in the effective pressure \(p + p_B\).</li>
<li><strong>Magnetic tension:</strong> \((\mathbf{B}\cdot\nabla)\mathbf{B}/\mu_0\). This force acts along field lines, resisting their curvature. Curved field lines exert a restoring force analogous to the tension in an elastic string: a field line of curvature \(\kappa\) exerts a force of magnitude \(B^2\kappa/\mu_0\) directed toward the centre of curvature.</li>
</ul>
</div>

Magnetic tension is the restoring force responsible for Alfvén waves (Section 10.4). Magnetic pressure tends to drive fluid out of flux tubes, causing them to expand unless contained by external pressure. The interplay between magnetic pressure, tension, and fluid pressure governs the equilibrium structures of solar flux tubes, tokamak plasmas, and planetary magnetospheres.

**The energy budget.** Taking the dot product of the momentum equation with \(\mathbf{u}\) and combining with the induction equation yields an energy conservation law:

\[
\frac{\partial}{\partial t}\!\left(\frac{1}{2}\rho|\mathbf{u}|^2 + \frac{B^2}{2\mu_0}\right) + \nabla\cdot(\cdots) = 0
\]

The two terms in the time derivative are the **kinetic energy density** and the **magnetic energy density** \(B^2/(2\mu_0)\). Energy can be exchanged between kinetic and magnetic forms, but the total is conserved (in the ideal, inviscid case). In the resistive case, Ohmic heating \(\mathbf{J}\cdot\mathbf{E} = J^2/\sigma\) irreversibly converts magnetic energy into thermal energy, and viscous dissipation similarly converts kinetic energy.

## 10.4 Alfvén Waves

The most fundamental wave mode of MHD is the **Alfvén wave**, a transverse wave in which a magnetic field line oscillates like a vibrating string under tension. The analogy is precise: recall that a taut string of linear mass density \(\mu\) and tension \(T\) supports transverse waves with speed \(\sqrt{T/\mu}\). A magnetised fluid of density \(\rho\) and field strength \(B_0\) has magnetic tension \(B_0^2/\mu_0\) per unit area, giving a wave speed \(B_0/\sqrt{\mu_0\rho}\).

**Derivation.** Consider an incompressible fluid at rest with uniform density \(\rho_0\) and uniform magnetic field \(\mathbf{B}_0 = B_0\hat{\mathbf{z}}\). Perturb the state with small-amplitude velocity \(\mathbf{u}'\) and magnetic field \(\mathbf{b}' = \mathbf{B} - \mathbf{B}_0\), where primed quantities are \(O(\epsilon)\) with \(\epsilon \ll 1\). Linearising the ideal MHD equations (dropping all quadratic terms in primed quantities):

- Momentum: \(\rho_0\,\partial\mathbf{u}'/\partial t = -\nabla p' + \frac{1}{\mu_0}(\mathbf{B}_0\cdot\nabla)\mathbf{b}'\)
- Induction: \(\partial\mathbf{b}'/\partial t = (\mathbf{B}_0\cdot\nabla)\mathbf{u}' - \mathbf{B}_0(\nabla\cdot\mathbf{u}')\)

With \(\nabla\cdot\mathbf{u}' = 0\) (incompressibility) and \(\mathbf{B}_0\cdot\nabla = B_0\,\partial/\partial z\):

\[
\rho_0\,\frac{\partial\mathbf{u}'}{\partial t} = -\nabla p' + \frac{B_0}{\mu_0}\frac{\partial\mathbf{b}'}{\partial z}, \qquad \frac{\partial\mathbf{b}'}{\partial t} = B_0\frac{\partial\mathbf{u}'}{\partial z}
\]

Differentiating the first equation with respect to \(t\) and substituting the second:

\[
\rho_0\,\frac{\partial^2\mathbf{u}'}{\partial t^2} = \frac{B_0^2}{\mu_0}\frac{\partial^2\mathbf{u}'}{\partial z^2} - \nabla\frac{\partial p'}{\partial t}
\]

For transverse perturbations (in the \(x\)- or \(y\)-direction, perpendicular to \(\hat{\mathbf{z}}\)), the pressure perturbation vanishes (by symmetry and incompressibility), and we obtain the wave equation:

\[
\frac{\partial^2 u'_x}{\partial t^2} = v_A^2\,\frac{\partial^2 u'_x}{\partial z^2}
\]

<div class="theorem">
<strong>Alfvén Wave Dispersion Relation.</strong> For plane-wave solutions \(\propto e^{i(kz - \omega t)}\) propagating along the equilibrium field \(\mathbf{B}_0 = B_0\hat{\mathbf{z}}\),

\[
\omega = \pm v_A k, \qquad v_A = \frac{B_0}{\sqrt{\mu_0\rho_0}}
\]
where \(v_A\) is the <strong>Alfvén speed</strong>. The waves are transverse: velocity and magnetic perturbations are perpendicular to both \(\mathbf{B}_0\) and the propagation direction.
</div>

**Physical interpretation.** Consider a field line displaced sideways by a small amount \(\xi\). The restoring tension \(B_0^2/\mu_0\) per unit area acts to straighten the line, while the fluid inertia \(\rho_0\) resists the motion. The balance gives a wave speed \(v_A = B_0/\sqrt{\mu_0\rho_0}\) — exactly the Alfvén speed. The velocity and magnetic perturbations are in phase and proportional: \(\mathbf{u}' = \pm\mathbf{b}'/\sqrt{\mu_0\rho_0}\). This means that kinetic and magnetic energy are equal and exchanged periodically, with no net dissipation in the ideal case.

**Propagation at oblique angles.** When the wave vector \(\mathbf{k}\) makes an angle \(\theta\) with \(\mathbf{B}_0\), the dispersion relation becomes more complex. Three distinct wave branches appear:

- **Alfvén wave** (shear mode): \(\omega = v_A k\cos\theta\); purely transverse, incompressible.
- **Fast magnetosonic wave**: speed greater than both \(v_A\) and the sound speed \(c_s\); propagates in all directions and is nearly isotropic for \(v_A \ll c_s\) or \(v_A \gg c_s\).
- **Slow magnetosonic wave**: speed less than both \(v_A\) and \(c_s\); propagates preferentially along field lines.

For an incompressible fluid only the shear Alfvén mode exists. The fast and slow modes are acoustic in nature and require compressibility. In the solar wind, all three modes have been observed directly by spacecraft.

**Typical Alfvén speeds.** In the Earth's outer core, \(B_0 \sim 10^{-3}\) T, \(\rho_0 \sim 10^4\) kg m\(^{-3}\), giving \(v_A \sim 3\times 10^{-3}\) m s\(^{-1}\) — slower than the convective velocity, so MHD inertia competes with magnetic forces. In the solar corona, \(B_0 \sim 10^{-3}\) T, \(\rho_0 \sim 10^{-12}\) kg m\(^{-3}\), giving \(v_A \sim 10^6\) m s\(^{-1}\) — comparable to the speed of coronal mass ejections.

## 10.5 MHD Equilibria and Applications

**Static equilibrium.** When \(\mathbf{u} = 0\) and all time derivatives vanish, the momentum equation reduces to force balance between the pressure gradient and the Lorentz force:

\[
\nabla\!\left(p + \frac{B^2}{2\mu_0}\right) = \frac{1}{\mu_0}(\mathbf{B}\cdot\nabla)\mathbf{B}
\]

This is the condition for **magnetostatic equilibrium**. If the field lines are straight and parallel, the tension term vanishes and the equilibrium is \(p + B^2/(2\mu_0) = \text{const}\): total pressure (thermal plus magnetic) is uniform. If the field lines are curved, tension provides an additional force that must be balanced.

<div class="example">
<strong>The Z-pinch.</strong> Consider a cylindrical plasma with current flowing in the \(z\)-direction, \(\mathbf{J} = J(r)\hat{\mathbf{z}}\). By Ampère's law, \(\mathbf{B} = B_\theta(r)\hat{\boldsymbol{\theta}}\) (azimuthal field). The Lorentz force \(\mathbf{J}\times\mathbf{B}\) points radially inward, compressing the plasma: \(dp/dr = -J B_\theta\). This self-constriction (the "pinch effect") confines the plasma without external magnets. The Z-pinch is MHD unstable (to the "sausage" and "kink" instabilities), but it remains a conceptually important configuration.
</div>

<div class="example">
<strong>The \(\theta\)-pinch.</strong> Here the current flows in the azimuthal direction \(\hat{\boldsymbol{\theta}}\) and the field is axial \(\hat{\mathbf{z}}\). The Lorentz force \(\mathbf{J}\times\mathbf{B}\) is again radially inward. Unlike the Z-pinch, the \(\theta\)-pinch has straight field lines so there is no tension; pressure balance gives \(p + B^2/(2\mu_0) = \text{const}\). The \(\theta\)-pinch is the basis of many pulsed-power confinement devices.
</div>

**Geophysical applications.**

*The Earth's geodynamo.* Earth's liquid iron outer core (\(2900\text{–}5100\) km depth) is a convecting, electrically conducting fluid. Thermal and compositional convection drives a self-sustaining dynamo: fluid motions generate electric currents (by the induction equation), which generate magnetic field (Ampère's law), which feeds back on the motion (Lorentz force). The output is Earth's dipole field, which reverses irregularly (most recently 780,000 years ago) and protects the surface from cosmic rays. Numerical MHD simulations have reproduced dipole reversals and secular variation in the geomagnetic field, validating the dynamo hypothesis.

*The solar corona and solar wind.* The Sun's outermost atmosphere (the corona) is structured by the solar magnetic field into loop-like flux tubes and open field lines. Coronal plasma is heated to temperatures of \(10^6\text{–}10^7\) K by mechanisms still debated (wave heating, magnetic reconnection), and flows outward as the **solar wind** at \(\sim 400\text{–}800\) km s\(^{-1}\). **Magnetic reconnection** — the topological rearrangement of field lines through resistive breakdown of flux-freezing — releases stored magnetic energy explosively, driving solar flares and coronal mass ejections (CMEs). These events deposit energy in Earth's magnetosphere, causing geomagnetic storms and auroras.

*The magnetosphere.* The solar wind compresses Earth's magnetic field on the dayside (to \(\sim 10\) Earth radii) and stretches it into a long magnetotail on the nightside. The boundary, the **magnetopause**, is a current sheet in MHD equilibrium between solar wind dynamic pressure and Earth's magnetic pressure. Inside, trapped energetic particles form the Van Allen radiation belts. Substorm activity involves magnetic reconnection in the magnetotail, releasing stored energy that accelerates particles toward the polar ionosphere.

**Astrophysical applications.**

*Accretion disc instability.* Gas infalling onto a compact object (black hole, neutron star) forms a rotating disc. Without a mechanism for angular momentum transport, the gas would not accrete. The **magnetorotational instability** (MRI, Balbus and Hawley 1991) provides this mechanism: a weak magnetic field in a differentially rotating disc is linearly unstable. Field lines connecting adjacent annuli are stretched by the differential rotation; the tension tries to spin up the outer annulus and slow down the inner one, transferring angular momentum outward and allowing inflow. The MRI is now the accepted mechanism for turbulent angular momentum transport in accretion discs, explaining the observed luminosities of X-ray binary systems and active galactic nuclei.

*Stellar interiors.* The solar interior is the site of a large-scale magnetic dynamo operating in the tachocline (the thin shear layer between the rigidly rotating radiative zone and the differentially rotating convective zone). Magnetic flux tubes buoyantly rise through the convection zone and emerge at the surface as sunspots, whose 11-year activity cycle reflects the underlying dynamo oscillation. Helioseismology (the analysis of solar oscillations) constrains the internal rotation profile and magnetic field structure, providing the observational foundation for modern stellar MHD.

*Neutron star magnetospheres.* Neutron stars have surface magnetic fields of \(10^8\text{–}10^{12}\) T — \(12\) orders of magnitude stronger than Earth's field. In **pulsars**, the rotating dipole field drives a relativistic plasma wind and radiation beam that sweeps past the observer like a lighthouse. In **magnetars**, field strengths exceed \(10^{10}\) T, making magnetic energy comparable to gravitational binding energy; sudden magnetic rearrangements (starquakes) release gamma-ray bursts detectable across the Galaxy.

**Closing remarks.** Magnetohydrodynamics illustrates the power of the continuum framework: by treating an electrically conducting fluid as a continuum and combining Maxwell's equations with the Navier–Stokes equations through a single constitutive relation (Ohm's law), one obtains a system that describes phenomena spanning planetary cores, stellar atmospheres, and relativistic compact objects. The key dimensionless parameter is the magnetic Reynolds number \(Rm\), which governs whether field lines are frozen into the fluid or can diffuse relative to it. When \(Rm\) is large, the fluid and field co-evolve on an equal footing, exchanging energy through Alfvén waves and storing it in large-scale ordered structures. When \(Rm\) is small, the field is a passive diagnostic of the flow. Between these limits lies the rich and largely unresolved physics of MHD turbulence, dynamo action, and magnetic reconnection — among the most active research frontiers in applied mathematics today.

---

# Continuation: AMATH 464 Solid Mechanics

The engineering applications of solid mechanics — bending, torsion, buckling, energy methods, failure theories, plane elasticity, shells, fatigue, and fracture — are covered in **AMATH 464 Solid Mechanics** (Fall 2026). That course builds directly on Part I of these notes.
