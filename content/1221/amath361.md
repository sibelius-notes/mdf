---
title: "AMATH 361: Continuum Mechanics"
prof: ""
subjects: "AMATH"
---

The primary source is the course summary prepared by Ryan Newson (Winter 2005), which covers the material in a compact but mathematically precise form. The exposition of viscoelasticity and elasticity follows A.J.M. Spencer, *Continuum Mechanics* (Dover Publications, 2004), one of the clearest undergraduate treatments of the subject. The fluid mechanics chapters draw on D.J. Acheson, *Elementary Fluid Dynamics* (Oxford University Press, 1990), and G.K. Batchelor, *An Introduction to Fluid Dynamics* (Cambridge University Press, 1967). Readers seeking a more geometrically modern treatment of kinematics should consult M.E. Gurtin, *An Introduction to Continuum Mechanics* (Academic Press, 1981).

---

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
