---
title: "AMATH 475: Introduction to General Relativity"
prof: "Eduardo Martín-Martínez"
subjects: "AMATH"
---

*These notes integrate the professor's typed lecture blocks with spoken explanations from the full lecture series. Video lectures by Eduardo Martín-Martínez are available on YouTube: [Online course — Intro to General Relativity](https://youtube.com/playlist?list=PLeoh1MW56PeLn-tYxepNXBnfTMdbBemfJ).*

---

## Part I — Special Relativity

### Chapter 1. Index Notation and the Einstein Summation Convention

<div class="remark">
The professor opens the first lecture with a confession: "I have three kinds of students. Those who have already seen index notation and will get bored for the first few lectures, those who haven't seen it and will benefit enormously, and those who think they have seen it but haven't really." This chapter is for everyone.
</div>

Index notation is the algebraic backbone of both special and general relativity. Once learned, it transforms pages of component algebra into a single compact line.

**The summation convention.** Whenever an index appears *exactly twice* in a monomial — once as a superscript (contravariant, "upstairs") and once as a subscript (covariant, "downstairs") — a sum over all values of that index is implied. One up, one down: sum.

\[
\sum_{\mu=0}^{3} A^\mu B_\mu \;\equiv\; A^\mu B_\mu
\]

The repeated index \(\mu\) is a *dummy index* and may be freely renamed without changing the expression. An index that appears only once is a *free index* and must match on both sides of an equation.

**The Kronecker delta.** \(\delta^\mu{}_\nu = 1\) if \(\mu=\nu\), zero otherwise. As a matrix it is the identity. Its key property is *index substitution*: contracting with \(\delta\) renames an index.

\[
\delta^\mu{}_\nu A^\nu = A^\mu, \qquad \delta^\mu{}_\mu = n \;\text{(dimension of the space)}
\]

**The Levi-Civita symbol.** The fully antisymmetric symbol \(\varepsilon_{\mu_1 \cdots \mu_n}\) takes value \(+1\) if the indices are an even permutation of \(1,2,\ldots,n\), value \(-1\) for an odd permutation, and \(0\) if any two indices repeat. It is not a tensor (it does not transform with \(n\) copies of the Jacobian), but \(\sqrt{|\det g|}\,\varepsilon_{\mu_1\cdots\mu_n}\) is a tensor density — important when we reach integration on manifolds.

A useful determinant identity:

\[
\det M = \varepsilon^{i_1 \cdots i_n} M_{1 i_1} M_{2 i_2} \cdots M_{n i_n}
\]

**The cross product** in \(\mathbb{R}^3\): \((v \times w)^i = \varepsilon^{ijk} v_j w_k\). The professor shows how vector identities like \(v\times(w\times u) = w(v\cdot u) - u(v\cdot w)\) become two-line proofs using the \(\varepsilon\)-\(\delta\) contraction identity \(\varepsilon_{ijk}\varepsilon^{ilm} = \delta^l_j \delta^m_k - \delta^m_j \delta^l_k\).

**Rules for index notation.** The professor drills the following rules repeatedly throughout the course:

1. Every free index must appear exactly once on each side of an equation, in the same position (up or down).
2. A repeated (dummy) index must appear exactly once up and once down in each term.
3. You may never have an index appear three or more times in a single term — this is always an error.
4. Dummy indices may be freely renamed, but only within a single term.
5. Free indices may not be renamed unless you rename them consistently on both sides.

**A common source of errors.** When working with the Einstein convention, beginners often write expressions like \(A^\mu B^\mu\) (both up) thinking this is a dot product. It is not a valid Einstein-summed expression, and more importantly, it is not invariant under coordinate changes. The invariant contraction is always one up, one down: \(A^\mu B_\mu\).

**The Levi-Civita tensor vs. symbol.** The distinction matters in curved spacetime. The *symbol* \(\varepsilon_{\mu_1\cdots\mu_n}\) is defined to have the same numerical values \(\pm 1, 0\) in every coordinate system — it is *not* a tensor. The *tensor* (also called the volume form) is:

\[
\epsilon_{\mu_1\cdots\mu_n} = \sqrt{|\det g|}\,\varepsilon_{\mu_1\cdots\mu_n}
\]

This transforms as a tensor under diffeomorphisms that preserve orientation (pseudo-tensor under orientation-reversing ones). The professor proves this in Lecture 22 as part of an assignment exercise.

**Worked example: Proving the BAC–CAB rule.** To prove \(\vec A \times (\vec B \times \vec C) = \vec B(\vec A \cdot \vec C) - \vec C(\vec A \cdot \vec B)\) in index notation:

\[
[\vec A \times (\vec B \times \vec C)]^i = \varepsilon^{ijk} A_j (\vec B \times \vec C)_k = \varepsilon^{ijk} A_j \varepsilon_{klm} B^l C^m
\]

Using \(\varepsilon_{ijk}\varepsilon^{ilm} = \delta^l_j\delta^m_k - \delta^m_j\delta^l_k\):

\[
= (\delta^l_j\delta^m_k - \delta^m_j\delta^l_k) A^j B_l C^m = A^j B_j C^i - A^j B^i C_j = (\vec A \cdot \vec B)C^i...
\]

Wait, tracking the raising/lowering carefully in flat space where \(\delta_{ij}\) identifies upper and lower indices: \(= B^i(A_j C^j) - C^i(A_j B^j) = \vec B(\vec A \cdot \vec C) - \vec C(\vec A \cdot \vec B)\). QED.

---

### Chapter 2. Covariance, Contravariance, and the Dual Basis

<div class="definition">
<strong>Contravariant components</strong> of a vector are those that transform <em>with the inverse</em> of the coordinate change matrix (the Jacobian). <strong>Covariant components</strong> transform with the Jacobian itself.
</div>

The professor uses a memorable analogy: "Imagine measuring the size of a room in metres, then changing to centimetres. Your numbers get larger — that is a covariant transformation. The room itself does not change. Contravariant objects go the other way: the components get *smaller* when the units get larger, because you need fewer big units to cover the same distance."

If \(\widetilde{\Lambda}^\mu{}_\nu\) is the Jacobian of the coordinate change \(x \to x'\), then:

\[
\text{Contravariant (upper index):}\quad v'^\mu = \widetilde{\Lambda}^\mu{}_\nu\, v^\nu
\]
\[
\text{Covariant (lower index):}\quad \omega'_\mu = \Lambda^\nu{}_\mu\, \omega_\nu
\]

where \(\Lambda = (\widetilde\Lambda^{-1})^\top\). The two matrices are inverses of each other, guaranteeing that the contraction \(\omega_\mu v^\mu\) is coordinate-independent — it is a *scalar*.

**Basis vectors and dual basis.** Given a basis \(\{e_a\}\) for the tangent space, there is a unique *dual basis* \(\{e^a\}\) for the cotangent space satisfying:

\[
\langle e^a, e_b \rangle = \delta^a{}_b
\]

The basis vectors transform with \(\Lambda\); the dual basis transforms with \(\widetilde\Lambda\). Components go the other way: vector components transform with \(\widetilde\Lambda\) (contravariant), one-form components transform with \(\Lambda\) (covariant).

<div class="remark">
"The components of a vector and the basis vectors transform in opposite ways — that is the whole point. Together they conspire so that the vector itself, as a geometric object, is unchanged by a coordinate transformation. The basis shrinks, the components grow, and the product stays the same."
</div>

**Why the distinction matters physically.** In Newtonian mechanics we rarely distinguish contravariant from covariant, because in Euclidean space with Cartesian coordinates the metric is the identity and raising/lowering indices does nothing. The distinction becomes unavoidable in:
1. Curvilinear coordinates (e.g., spherical), where the metric is non-trivial
2. Special relativity, where the metric is indefinite (Minkowski)
3. General relativity, where the metric is position-dependent

**Example: Spherical coordinates.** In \(\mathbb{R}^3\) with coordinates \((r, \theta, \phi)\), the metric is \(g_{ij} = \operatorname{diag}(1, r^2, r^2\sin^2\theta)\). A vector with contravariant components \(v^r = 1, v^\theta = v^\phi = 0\) has covariant components \(v_r = g_{rr}v^r = 1\), \(v_\theta = g_{\theta\theta}v^\theta = 0\), \(v_\phi = 0\). But a vector with \(v^\theta = 1\) has covariant component \(v_\theta = r^2\). This is why the gradient formula in spherical coordinates looks different from Cartesian — the covariant components of the gradient (which are just partial derivatives, \(\partial_\mu f\)) need to be converted to contravariant components using the inverse metric before they represent the "direction of steepest ascent" in the ordinary sense.

**The metric as the bridge.** The metric tensor \(g_{\mu\nu}\) provides the canonical isomorphism between \(T_pM\) and \(T^*_pM\):

\[
\flat: T_pM \to T^*_pM, \quad v^\mu \mapsto v_\mu = g_{\mu\nu}v^\nu \quad\text{(lowering)}
\]
\[
\sharp: T^*_pM \to T_pM, \quad \omega_\mu \mapsto \omega^\mu = g^{\mu\nu}\omega_\nu \quad\text{(raising)}
\]

These are called the "musical isomorphisms" (\(\flat\) is "flat," \(\sharp\) is "sharp"). Without a metric, there is no natural identification between vectors and covectors — they genuinely live in different spaces.

<svg viewBox="0 0 420 200" xmlns="http://www.w3.org/2000/svg" style="max-width:420px;display:block;margin:1.5em auto">
  <defs>
    <marker id="ah1" markerWidth="8" markerHeight="6" refX="6" refY="3" orient="auto">
      <polygon points="0 0,8 3,0 6" fill="currentColor"/>
    </marker>
  </defs>
  <line x1="60" y1="160" x2="200" y2="160" stroke="currentColor" stroke-width="1.5" marker-end="url(#ah1)"/>
  <line x1="60" y1="160" x2="60" y2="40" stroke="currentColor" stroke-width="1.5" marker-end="url(#ah1)"/>
  <text x="205" y="164" font-size="13" fill="currentColor">e₁</text>
  <text x="64" y="36" font-size="13" fill="currentColor">e₂</text>
  <line x1="60" y1="160" x2="160" y2="90" stroke="#3b82f6" stroke-width="2" marker-end="url(#ah1)"/>
  <text x="115" y="110" font-size="12" fill="#3b82f6">v</text>
  <line x1="250" y1="160" x2="380" y2="130" stroke="currentColor" stroke-width="1.5" stroke-dasharray="4,3" marker-end="url(#ah1)"/>
  <line x1="250" y1="160" x2="280" y2="50" stroke="currentColor" stroke-width="1.5" stroke-dasharray="4,3" marker-end="url(#ah1)"/>
  <text x="385" y="134" font-size="13" fill="currentColor">e₁'</text>
  <text x="285" y="46" font-size="13" fill="currentColor">e₂'</text>
  <line x1="250" y1="160" x2="350" y2="90" stroke="#3b82f6" stroke-width="2" marker-end="url(#ah1)"/>
  <text x="305" y="110" font-size="12" fill="#3b82f6">v (same!)</text>
  <text x="210" y="190" font-size="11" fill="currentColor" text-anchor="middle">Basis changes, components change oppositely, vector is invariant</text>
</svg>

---

### Chapter 3. Special Relativity: Postulates and Spacetime

<div class="remark">
"Why does the speed of light have to be the same for all inertial observers? That is essentially a postulate — or rather, it is what the Michelson–Morley experiment told us and what Maxwell's equations tell us. Einstein's genius was not to explain it, but to accept it at face value and follow the consequences rigorously."
</div>

**The two postulates of Special Relativity:**

<div class="definition">
<strong>Postulate 1 (Principle of Relativity).</strong> The laws of physics take the same form in all inertial reference frames.
</div>

<div class="definition">
<strong>Postulate 2 (Constancy of the Speed of Light).</strong> The speed of light in vacuum, \(c\), is the same for all inertial observers, regardless of the motion of the source or observer.
</div>

The professor notes that demanding the Lorentz transformation be *linear* is essentially a hidden third postulate — it encodes the assumption that spacetime is homogeneous and isotropic. The existence of a maximum speed is more fundamental: one can derive that there must be a universal invariant speed (which could be infinite — giving Galilean relativity — or finite, giving special relativity) from the homogeneity and isotropy of spacetime alone. Experiment selects the finite case.

**Historical context.** The Michelson-Morley experiment (1887) failed to detect the motion of the Earth through the hypothetical luminiferous ether, indicating that the speed of light is the same in all directions regardless of the Earth's motion. Lorentz and FitzGerald proposed that objects contract along their direction of motion through the ether. Einstein's insight (1905) was that the ether is superfluous — the constancy of \(c\) is a fundamental property of spacetime itself, not a dynamical effect. The resulting theory abolishes absolute simultaneity while preserving absolute causality.

**Deriving the Lorentz transformation.** Consider two inertial frames \(S\) and \(S'\), with \(S'\) moving at velocity \(v\) along the \(x\)-axis. The derivation proceeds in five steps:

Step 1 (Linearity): The transformation must be linear — non-linear transformations would map uniform motion in one frame to non-uniform motion in another, violating Postulate 1. So \(t' = \alpha t + \beta x\) and \(x' = \gamma x + \delta t\) for constants \(\alpha, \beta, \gamma, \delta\) to be determined.

Step 2 (Relative velocity): The origin of \(S'\) (\(x' = 0\)) satisfies \(x = vt\) in \(S\). So \(0 = \gamma vt + \delta t\), giving \(\delta = -\gamma v\).

Step 3 (Invariance of the speed of light): A light pulse satisfying \(x = ct\) must also satisfy \(x' = ct'\). Substituting and requiring this for all \(t\) gives a relation between \(\alpha, \beta, \gamma\).

Step 4 (Symmetry): The inverse transformation is obtained by swapping \(v \to -v\). This gives additional constraints.

Step 5 (Normalization): The requirement that the spacetime interval is invariant: \(-c^2 dt'^2 + dx'^2 = -c^2 dt^2 + dx^2\) fixes the remaining freedom uniquely, giving \(\gamma = 1/\sqrt{1-v^2/c^2}\).

The invariance of the spacetime interval \(\Delta s^2 = -c^2 \Delta t^2 + \Delta x^2\) under the transformation uniquely determines the Lorentz boost:

\[
t' = \gamma\!\left(t - \frac{v}{c^2}x\right), \qquad x' = \gamma(x - vt), \qquad \gamma = \frac{1}{\sqrt{1-v^2/c^2}}
\]

**The spacetime interval.** The quantity

\[
\Delta s^2 = -c^2 \Delta t^2 + \Delta x^2 + \Delta y^2 + \Delta z^2
\]

is invariant under all Lorentz transformations. Its sign classifies the separation:

| Sign | Name | Physical meaning |
|---|---|---|
| \(\Delta s^2 < 0\) | Timelike | Causal connection possible |
| \(\Delta s^2 = 0\) | Null (lightlike) | Connected by a light ray |
| \(\Delta s^2 > 0\) | Spacelike | No causal connection |

**Relativity of simultaneity.** Two events that are simultaneous in one inertial frame (\(\Delta t = 0\)) are generally not simultaneous in another frame. This is not an illusion or a measurement artifact — it is a genuine feature of spacetime structure. Simultaneity is relative. Only timelike-separated events have an invariant chronological ordering.

**Time dilation.** Consider a clock at rest in \(S'\). Two ticks occur at \(x' = 0\), \(t'_1 = 0\) and \(t'_2 = T'\). In \(S\): \(\Delta t = \gamma T'\). Moving clocks run slow.

**Length contraction.** A rod at rest in \(S'\) with endpoints at \(x'_1 = 0\) and \(x'_2 = L'\). Measured simultaneously in \(S\): \(\Delta x = L'/\gamma\). Moving rods are shorter.

**Invariant formulation.** All of SR can be expressed via the Minkowski metric. Two events with coordinate difference \(dx^\mu\):

\[
ds^2 = \eta_{\mu\nu}\, dx^\mu\, dx^\nu = -c^2\, dt^2 + dx^2 + dy^2 + dz^2
\]

The sign convention used here is the *east coast* (mostly plus) convention. Every physical relation in SR has a natural 4-dimensional covariant expression, and the goal of learning index notation is precisely to be able to write those relations.

**Worked example: The twin paradox.** Alice stays on Earth; Bob travels to a distant star at high speed and returns. When they reunite, Bob is younger. This is not a paradox but a direct consequence of proper time: Alice's worldline is a straight vertical line in spacetime (she is inertial), and Bob's is a bent worldline. The invariant proper time is shorter for the *bent* worldline — the longest proper time between two events is achieved by the inertial (straight) worldline. SR makes a definitive prediction: the non-inertial twin ages less.

<svg viewBox="0 0 340 300" xmlns="http://www.w3.org/2000/svg" style="max-width:340px;display:block;margin:1.5em auto">
  <defs>
    <marker id="ah2" markerWidth="8" markerHeight="6" refX="6" refY="3" orient="auto">
      <polygon points="0 0,8 3,0 6" fill="currentColor"/>
    </marker>
  </defs>
  <line x1="170" y1="280" x2="170" y2="20" stroke="currentColor" stroke-width="1.5" marker-end="url(#ah2)"/>
  <line x1="20" y1="150" x2="320" y2="150" stroke="currentColor" stroke-width="1.5" marker-end="url(#ah2)"/>
  <text x="175" y="16" font-size="12" fill="currentColor">ct</text>
  <text x="325" y="154" font-size="12" fill="currentColor">x</text>
  <line x1="170" y1="150" x2="310" y2="30" stroke="#f59e0b" stroke-width="2"/>
  <line x1="170" y1="150" x2="30" y2="30" stroke="#f59e0b" stroke-width="2"/>
  <line x1="170" y1="150" x2="310" y2="270" stroke="#f59e0b" stroke-width="2"/>
  <line x1="170" y1="150" x2="30" y2="270" stroke="#f59e0b" stroke-width="2"/>
  <text x="155" y="70" font-size="11" fill="#10b981" text-anchor="middle">timelike</text>
  <text x="155" y="240" font-size="11" fill="#10b981" text-anchor="middle">timelike</text>
  <text x="280" y="154" font-size="11" fill="#ef4444" text-anchor="middle">spacelike</text>
  <text x="60" y="154" font-size="11" fill="#ef4444" text-anchor="middle">spacelike</text>
  <text x="295" y="43" font-size="10" fill="#f59e0b">null</text>
  <text x="295" y="262" font-size="10" fill="#f59e0b">null</text>
  <circle cx="170" cy="150" r="3" fill="currentColor"/>
</svg>

---

### Chapter 4. Proper Time and Four-Velocity

**Proper time** \(\tau\) is the time measured by a clock carried along a worldline. For a particle moving with velocity \(v(t)\) in an inertial frame:

\[
d\tau = dt\sqrt{1 - v^2/c^2} = \frac{dt}{\gamma}, \qquad \tau = \int_{t_1}^{t_2} \frac{dt}{\gamma(t)}
\]

Proper time is invariant — every observer agrees on how much time a given clock has accumulated between two events on its worldline.

**Four-velocity.** Parametrize a worldline by proper time \(\tau\). The four-velocity is:

\[
u^\mu = \frac{dx^\mu}{d\tau} = \left(\gamma c,\; \gamma \vec{v}\right)
\]

Its norm is fixed:

\[
u^\mu u_\mu = \eta_{\mu\nu} u^\mu u^\nu = -c^2
\]

This is a constraint, not a dynamical equation. It says that all massive particles move through spacetime at the same "speed" — the speed of light — but in different directions through the four-dimensional manifold.

<div class="remark">
"You are always moving through spacetime at the speed of light. When you are stationary, you are moving entirely through the time direction. When you accelerate, some of that motion tilts into space, and your time axis tilts — that is time dilation."
</div>

**Four-acceleration.** \(a^\mu = du^\mu/d\tau\). Differentiating \(u^\mu u_\mu = -c^2\): \(u_\mu a^\mu = 0\) — four-acceleration is always orthogonal to four-velocity. Its magnitude is the proper acceleration: \(a^\mu a_\mu = \alpha^2 \geq 0\). For an inertial observer \(\alpha = 0\); for an accelerating observer \(\alpha \neq 0\).

**Rapidity revisited.** A boost with speed \(v\) can be written as a hyperbolic rotation with rapidity \(\xi = \operatorname{arctanh}(v/c)\). Then \(\gamma = \cosh\xi\) and \(\gamma v/c = \sinh\xi\). The four-velocity of a particle moving at speed \(v\) in the \(x\)-direction is:

\[
u^\mu = c(\cosh\xi,\, \sinh\xi,\, 0,\, 0)
\]

The utility of rapidity is that rapidities add for collinear boosts: an observer boosted with rapidity \(\xi_1\) relative to the ground, and then boosted with rapidity \(\xi_2\) relative to the first frame, sees the ground moving with rapidity \(\xi_1 + \xi_2\). This is simpler than the relativistic velocity addition formula \(v_{13} = (v_{12}+v_{23})/(1+v_{12}v_{23}/c^2)\).

---

### Chapter 5. The Minkowski Metric and the Poincaré Group

**The Minkowski metric.** In Cartesian coordinates \((t, x, y, z)\):

\[
\eta_{\mu\nu} = \operatorname{diag}(-1, +1, +1, +1)
\]

This is the *east coast* convention (also called the "mostly plus" convention). The professor explicitly warns: "Some books use the opposite sign — west coast convention — and you will get all your results with the wrong sign if you mix them. Choose one and be consistent."

The metric raises and lowers indices:

\[
v_\mu = \eta_{\mu\nu} v^\nu, \qquad v^\mu = \eta^{\mu\nu} v_\nu
\]

**Lorentz group.** The Lorentz group \(O(1,3)\) consists of all linear transformations \(\Lambda\) preserving \(\eta\):

\[
\Lambda^\rho{}_\mu\, \eta_{\rho\sigma}\, \Lambda^\sigma{}_\nu = \eta_{\mu\nu}
\]

It has four connected components. The *proper orthochronous* Lorentz group \(SO^+(1,3)\) is the component connected to the identity.

**Generators.** The six generators split into three rotation generators \(\hat{J}_i\) and three boost generators \(\hat{K}_i\). Boosts are hyperbolic rotations. A boost along \(x\) with rapidity \(\xi = \operatorname{arctanh}(v/c)\):

\[
\Lambda^\mu{}_\nu = \begin{pmatrix} \cosh\xi & -\sinh\xi & 0 & 0 \\ -\sinh\xi & \cosh\xi & 0 & 0 \\ 0 & 0 & 1 & 0 \\ 0 & 0 & 0 & 1 \end{pmatrix}
\]

Rapidities add: \(\xi_{13} = \xi_{12} + \xi_{23}\) for collinear boosts. The professor demonstrates in Mathematica (Lecture 9): computing the product of two non-collinear boosts reveals a *rotation* in the result — this is **Thomas precession**, a purely relativistic kinematic effect with real consequences for electron spin in atoms.

**Poincaré group.** The Poincaré group extends the Lorentz group by including spacetime translations. Its generators are:

\[
\hat{P}_\mu = -i\partial_\mu \quad\text{(four translations)}, \qquad \hat{M}_{\rho\sigma} \quad\text{(six Lorentz generators)}
\]

The 10 generators span the Lie algebra with commutation relations:

\[
[\hat{P}_\mu, \hat{P}_\nu] = 0, \qquad [\hat{M}_{\rho\sigma}, \hat{P}_\mu] = i(\eta_{\sigma\mu}\hat{P}_\rho - \eta_{\rho\mu}\hat{P}_\sigma)
\]

**Thomas precession.** When two non-collinear Lorentz boosts are composed, the result is a Lorentz boost combined with a spatial rotation — the *Thomas-Wigner rotation* or Thomas precession. In Lecture 9, the professor demonstrates this numerically in Mathematica: take a boost in the \(x\)-direction, then a boost in the \(y\)-direction. The composition is not a pure boost; there is an additional rotation of the spatial axes. The Thomas precession angle for a particle moving in a circular orbit at speed \(v\) with period \(T\) is:

\[
\Omega_\text{Thomas} = -\gamma^2 \frac{\vec a \times \vec v}{c^2(\gamma+1)} \approx -\frac{\vec a \times \vec v}{2c^2} \quad (\text{for } v \ll c)
\]

For an electron orbiting a proton, this gives a precession that halves the naive spin-orbit coupling, explaining the factor of 2 in the hydrogen spectrum fine structure. Thomas precession is a purely kinematic effect of special relativity, requiring no forces beyond the centripetal acceleration.

**Discrete symmetries.** The full Lorentz group \(O(1,3)\) has four connected components:
- \(L_+^\uparrow\) (proper orthochronous): det\(\Lambda = +1\), \(\Lambda^0{}_0 > 0\) — connected to identity
- \(L_+^\downarrow\) (proper non-orthochronous): time reversal \(T\)
- \(L_-^\uparrow\) (improper orthochronous): parity reversal \(P\)
- \(L_-^\downarrow\) (improper non-orthochronous): combined \(PT\)

The Standard Model of particle physics is invariant under \(CPT\) (charge conjugation times parity times time reversal) but violates \(P\) (weak interactions), \(C\), and \(CP\) separately.

---

### Chapter 6. Dynamics: Hamilton's Principle and Noether's Theorem

**Hamilton's principle (stationary action).** The trajectory followed by a physical system is the one that makes the action \(S = \int L\, dt\) stationary under variations with fixed endpoints:

\[
\delta S = 0 \implies \frac{\partial L}{\partial q^i} - \frac{d}{dt}\frac{\partial L}{\partial \dot{q}^i} = 0 \quad\text{(Euler-Lagrange equations)}
\]

<div class="theorem">
<strong>Noether's Theorem.</strong> Every continuous symmetry of the action corresponds to a conserved quantity. If the Lagrangian is invariant under the one-parameter transformation \(q^i \to q^i + \varepsilon \xi^i(q)\), then
\[
\mathcal{Q} = \sum_i \frac{\partial L}{\partial \dot{q}^i}\,\xi^i
\]
is conserved along every solution.
</div>

Examples: time-translation invariance → energy; spatial translation invariance → momentum; rotational invariance → angular momentum.

**Free particle action.** The relativistically invariant action for a free massive particle is proportional to the proper time elapsed:

\[
S = -mc^2 \int d\tau = -mc \int ds = -mc \int \sqrt{-\eta_{\mu\nu}\dot{x}^\mu \dot{x}^\nu}\; d\lambda
\]

Varying this action gives the geodesic equation: \(d^2x^\mu/d\tau^2 = 0\) — free particles travel in straight lines in Minkowski spacetime.

**Four-momentum and the energy-momentum relation.** The four-momentum:

\[
p^\mu = mu^\mu = \left(\frac{E}{c},\; \vec{p}\right), \qquad p^\mu p_\mu = -m^2c^2 \implies E^2 = m^2c^4 + c^2|\vec{p}|^2
\]

For a photon (\(m=0\)): \(E = c|\vec{p}|\) and \(p^\mu p_\mu = 0\) (null four-vector).

<div class="remark">
The professor explicitly bans "relativistic mass" from the course: "The mass of a particle is the Lorentz-invariant quantity \(m\), period. What increases with velocity is not the mass but the energy and momentum."
</div>

**Particle collider exercise.** Comparing two scenarios for creating a particle of mass \(M\) from two protons of mass \(m_p\):

*Scenario A* (head-on collision): two beams each with energy \(E\) collide. Total four-momentum squared: \(s = -(p_1 + p_2)^2 = 4E^2/c^2\). Available centre-of-mass energy: \(\sqrt{s}\, c = 2E\).

*Scenario B* (fixed target): one beam with energy \(E\) hits a proton at rest. Total four-momentum squared: \(s = -(p_1 + p_2)^2 = 2m_p^2c^2 + 2m_p E/c^2\). Centre-of-mass energy: \(\sqrt{s}\, c \approx \sqrt{2m_p c^2 E}\) at high energy.

For Scenario A: \(\sqrt{s} \propto E\) (linear). For Scenario B: \(\sqrt{s} \propto \sqrt{E}\) (square root). At \(E = 10^3\) GeV, Scenario A gives \(\sqrt{s} \approx 2000\) GeV while Scenario B gives \(\sqrt{s} \approx \sqrt{2 \times 0.938 \times 10^3} \approx 43\) GeV. The head-on collider wins by a factor of ~46. This is why the LHC, Tevatron, and LEP all used colliding beams rather than fixed targets for high-energy physics.

---

### Chapter 7. Four-Acceleration and Rindler Coordinates

**Four-acceleration:** \(b^\mu = du^\mu/d\tau\). It is always orthogonal to the four-velocity (\(u^\mu b_\mu = 0\)). Its norm gives the proper acceleration: \(b^\mu b_\mu = a^2 \geq 0\).

**Rindler coordinates.** An observer with constant proper acceleration \(a\) along \(x\) follows the hyperbolic worldline \(-t^2 + x^2 = c^4/a^2\). In Rindler coordinates \((\tau, \xi)\):

\[
ds^2 = -\left(1 + \frac{a\xi}{c^2}\right)^2 c^2\, d\tau^2 + d\xi^2 + dy^2 + dz^2
\]

<div class="remark">
"The speed of light is not \(c\) for a non-inertial observer. The locally measured speed of light varies with position in Rindler coordinates — this foreshadows the equivalence principle of General Relativity."
</div>

**Acceleration horizon.** The surface \(\xi = -c^2/a\) is an acceleration horizon: signals from beyond it can never reach the accelerated observer. This is a purely kinematic horizon — no GR required.

<div class="remark">
The acceleration horizon in Rindler spacetime is a preview of the event horizon of a black hole. The professor emphasizes this structural parallel: both arise from the fact that some regions of spacetime cannot send light signals to other regions. In Rindler's case it is kinematic (due to acceleration); in Schwarzschild's case it is dynamic (due to curvature). The mathematical structure is similar: in Rindler coordinates the metric coefficient \((1 + a\xi/c^2)^2\) in front of \(d\tau^2\) vanishes at the horizon, just as \((1-R_s/r)\) vanishes at the Schwarzschild horizon.
</div>

**Uniformly accelerated observer: worldline in detail.** An observer starting at \(x_0 = c^2/a\) at \(t=0\) with proper acceleration \(a\):

\[
x(\tau) = \frac{c^2}{a}\cosh\!\left(\frac{a\tau}{c}\right), \quad t(\tau) = \frac{c}{a}\sinh\!\left(\frac{a\tau}{c}\right)
\]

The worldline satisfies \(x^2 - c^2t^2 = c^4/a^2\) — a hyperbola in spacetime. The proper time and coordinate time are related by \(t = (c/a)\sinh(a\tau/c)\); for small \(v/c\), \(\tau \approx t\) as expected.

**Gravitational time dilation from SR.** The Rindler metric teaches us that clocks at different Rindler positions \(\xi\) tick at different rates. Two clocks separated by \(\Delta\xi\) at positions \(\xi_1\) and \(\xi_2\) have a proper time ratio:

\[
\frac{d\tau_2}{d\tau_1} = \frac{1 + a\xi_2/c^2}{1 + a\xi_1/c^2}
\]

By the Equivalence Principle, an observer in a gravitational field with local acceleration \(g\) at height \(h\) has the same relation: clocks at greater height run faster. This is gravitational time dilation, derived here from special relativity alone.

**Bell's rocket paradox.** Two rockets accelerating identically in the ground frame (same program). A rope connects them. Does it break?

<div class="example">
<strong>Resolution:</strong> Identical coordinate accelerations do not mean identical proper accelerations. The rockets' separation in the ground frame stays fixed, but the rope Lorentz-contracts. In the rope's rest frame, the gap between rockets grows. The rope breaks.

For a Born-rigid extended object (one that does not stretch), the trailing end must accelerate harder than the leading end — this anticipates why clocks at different heights in a gravitational field run at different rates.

The quantitative statement: two Rindler observers with proper accelerations \(a_1\) and \(a_2 = a_1 + \delta a\) remain at a constant proper distance from each other. To maintain Born-rigid acceleration (constant rest-frame separation), the leading observer must have smaller proper acceleration: \(a_2 < a_1\). The Rindler family of observers \(\{a(\xi)\} = c^2/(c^2/a + \xi)\) achieves this: every observer in the family maintains the same proper distance from their neighbours.
</div>

---

## Part II — Differential Geometry

### Chapter 8. Differentiable Manifolds

<div class="remark">
"A manifold is like a bag of infinitely many potatoes. The potatoes are the points, the bag is the set, and the atlas is the collection of maps that tell us how to navigate inside the bag. The key idea is that locally — near each potato — everything looks like ordinary flat \(\mathbb{R}^n\)."
</div>

<div class="definition">
<strong>Differentiable manifold.</strong> A Hausdorff topological space \(M\) of dimension \(n\) together with an atlas \(\{(U_\alpha, \phi_\alpha)\}\) where each \(U_\alpha \subset M\) is open, each \(\phi_\alpha : U_\alpha \to \mathbb{R}^n\) is a homeomorphism (chart), and all transition maps \(\phi_\beta \circ \phi_\alpha^{-1}\) are smooth wherever defined.
</div>

The charts provide coordinates: if \(p \in U_\alpha\) then \(\phi_\alpha(p) = (x^1(p), \ldots, x^n(p))\). A function \(f: M \to \mathbb{R}\) is smooth if \(\bar{f} := f \circ \phi^{-1}: \mathbb{R}^n \to \mathbb{R}\) is smooth for every chart.

**Examples of manifolds.**

- \(\mathbb{R}^n\) is trivially a manifold with a single global chart (the identity map). It has a natural flat metric \(\delta_{ij}\) or Minkowski metric \(\eta_{\mu\nu}\).
- The \(n\)-sphere \(S^n\) requires at least two charts (e.g., stereographic projection from north and south poles). It has no global coordinate chart — any single chart must exclude at least one point.
- A cylinder \(\mathbb{R} \times S^1\) can be covered with a single chart with periodicity identification, but it is topologically distinct from \(\mathbb{R}^2\).
- The torus \(T^2 = S^1 \times S^1\) is a 2-dimensional manifold with non-trivial topology.
- Spacetime in General Relativity is a 4-dimensional Lorentzian manifold. Its topological structure (global shape) is a subject of active research in mathematical physics.

**The Hausdorff condition.** The Hausdorff condition says: for any two distinct points \(p \neq q\) in \(M\), there exist disjoint open sets \(U \ni p\) and \(V \ni q\). This prevents pathologies like two points that cannot be separated by any open sets. All physical spacetimes are Hausdorff.

**Transition maps and compatibility.** When two charts \((U_\alpha, \phi_\alpha)\) and \((U_\beta, \phi_\beta)\) overlap, the *transition map* \(\phi_\beta \circ \phi_\alpha^{-1}: \phi_\alpha(U_\alpha \cap U_\beta) \to \phi_\beta(U_\alpha \cap U_\beta)\) must be smooth. This condition ensures that the notion of "smooth function on \(M\)" does not depend on which chart you use to check it.

**Orientability.** A manifold is orientable if it has an atlas where all transition maps have positive Jacobian determinant. Physical spacetimes are assumed orientable. The Möbius strip is a classic example of a non-orientable manifold.

<svg viewBox="0 0 400 180" xmlns="http://www.w3.org/2000/svg" style="max-width:420px;display:block;margin:1.5em auto">
  <defs>
    <marker id="ah3" markerWidth="8" markerHeight="6" refX="6" refY="3" orient="auto">
      <polygon points="0 0,8 3,0 6" fill="currentColor"/>
    </marker>
  </defs>
  <ellipse cx="90" cy="90" rx="70" ry="55" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <text x="90" y="95" text-anchor="middle" font-size="13" fill="currentColor">M</text>
  <circle cx="80" cy="80" r="3" fill="#3b82f6"/>
  <text x="88" y="78" font-size="11" fill="#3b82f6">p</text>
  <line x1="165" y1="90" x2="245" y2="90" stroke="currentColor" stroke-width="1.5" marker-end="url(#ah3)"/>
  <text x="202" y="83" font-size="11" fill="currentColor">φ</text>
  <rect x="250" y="55" width="120" height="70" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <text x="310" y="95" text-anchor="middle" font-size="13" fill="currentColor">ℝⁿ</text>
  <circle cx="275" cy="80" r="3" fill="#3b82f6"/>
  <text x="283" y="78" font-size="11" fill="#3b82f6">φ(p)</text>
</svg>

---

### Chapter 9. Tangent Vectors

**Curves on a manifold.** A smooth curve is a smooth map \(\gamma: \mathbb{R} \to M\).

**Vectors as derivations.** A tangent vector at \(p\) is a linear map from smooth functions to reals satisfying the Leibniz rule:

\[
v: C^\infty(M) \to \mathbb{R}, \qquad v(fg) = f(p)\,v(g) + g(p)\,v(f)
\]

Every tangent vector is the tangent to some curve through \(p\): \(v[f] = \frac{d}{dt}(f\circ\gamma)\big|_{t=0}\).

**Coordinate basis.** In a chart, the partial derivatives \(\partial_\mu := \partial/\partial x^\mu\) form a basis for the tangent space \(T_pM\):

\[
v = v^\mu \partial_\mu, \qquad v^\mu = v[x^\mu]
\]

The tangent space \(T_pM\) is an \(n\)-dimensional real vector space.

**Lie bracket.** The commutator of two vector fields:

\[
[v,w][f] = v[w[f]] - w[v[f]], \qquad [v,w]^\mu = v^\nu \partial_\nu w^\mu - w^\nu \partial_\nu v^\mu
\]

**Coordinate vs. non-coordinate bases.** A basis \(\{e_a\}\) is a coordinate basis if and only if \([e_a, e_b] = 0\) for all pairs. The orthonormal polar basis \(\{\hat{e}_r, \hat{e}_\theta\}\) is not a coordinate basis — this is why gradient, divergence, and Laplacian formulas look complicated in polar coordinates.

**Explicit example (from Lecture 15).** The professor works through the following example. On \(\mathbb{R}^2\), consider the two vector fields:

\[
e_1 = y\partial_x + \partial_y, \qquad e_2 = \partial_y
\]

These span the tangent space at every point (for \(y \neq 0\)) and form a valid basis. But:

\[
[e_1, e_2] = [y\partial_x + \partial_y, \partial_y] = -\partial_x \neq 0
\]

So this is not a coordinate basis, even though it looks like one at first glance. The non-commutativity arises from the \(y\)-dependence of \(e_1\).

**Tangent space at a point vs. vector fields.** It is crucial to distinguish:
- *Tangent space at a point \(p\)*: \(T_pM\), a fixed \(n\)-dimensional vector space. Its elements are tangent vectors at \(p\) only.
- *Tangent bundle*: \(TM = \bigsqcup_{p \in M} T_pM\), the collection of all tangent spaces. Its sections are vector fields.
- *Vector field*: a smooth assignment of a tangent vector to each point.

In GR, equations involving tensors hold *as identities of tensor fields* — they must hold at every point of the manifold simultaneously.

**Integral curves and flows.** Given a vector field \(v\) on \(M\), an *integral curve* is a curve \(\gamma(t)\) such that \(\dot\gamma(t) = v(\gamma(t))\). The existence and uniqueness theorem for ODEs guarantees a unique maximal integral curve through each point. The collection of all integral curves fills the manifold (they cannot cross) and defines the *flow* \(\phi_t\). In GR: geodesics are integral curves of the geodesic vector field on the tangent bundle \(TM\).

**Connection to the geodesic equation.** The geodesic equation \(\ddot x^\mu + \Gamma^\mu{}_{\nu\rho}\dot x^\nu\dot x^\rho = 0\) is a second-order ODE on \(M\), but it can be rewritten as a first-order ODE on \(TM\) by introducing velocity as an additional variable: \(\dot x^\mu = v^\mu\), \(\dot v^\mu = -\Gamma^\mu{}_{\nu\rho}v^\nu v^\rho\). The geodesic flow is then the integral curve system on \(TM\). The Hamiltonian formulation uses the co-geodesic flow on \(T^*M\).

---

### Chapter 10. One-Forms and the Cotangent Space

<div class="definition">
A <strong>one-form</strong> (covector) at \(p\) is a real-valued linear functional on \(T_pM\):

\[
\omega: T_pM \to \mathbb{R}
\]
The space of all one-forms at \(p\) is the <strong>cotangent space</strong> \(T^*_pM\).
</div>

<div class="remark">
The professor is emphatic: "One-forms and vectors live in different spaces. You cannot take the inner product of a one-form with a vector — that would be like contracting apples and monkeys. What you can do is the contraction, and the result is a scalar. An inner product requires a metric, and we are not there yet."
</div>

**Dual basis.** Given coordinates \(x^\mu\), the dual basis \(\{dx^\mu\}\) satisfies:

\[
\langle dx^\mu, \partial_\nu \rangle = \delta^\mu{}_\nu
\]

**Differential of a function.** For any smooth \(f: M \to \mathbb{R}\), the differential \(df\) is the one-form:

\[
\langle df, v \rangle = v[f], \qquad (df)_\mu = \partial_\mu f
\]

The gradient is a *covector*, not a vector. In coordinates: \(df = (\partial_\mu f)\, dx^\mu\). The components of the gradient are the components of the differential of the function.

**The gradient is not a vector field.** This is a subtle but important point. In elementary calculus, we freely write "the gradient vector \(\nabla f\)" and think of it as a vector. On a manifold without a metric, \(df\) is a one-form — its components \(\partial_\mu f\) transform with \(\Lambda\) (covariant), not \(\widetilde\Lambda\). To get a vector, you must raise the index with the metric: \((\text{grad}\, f)^\mu = g^{\mu\nu}\partial_\nu f\). In flat Cartesian space, \(g^{\mu\nu} = \delta^{\mu\nu}\) and this distinction is invisible — which is why it is never taught in undergraduate calculus.

<div class="example">
<strong>Worked example: one-forms in polar coordinates.</strong> In \(\mathbb{R}^2\) with polar coordinates \((r,\theta)\), the dual basis is \(\{dr, d\theta\}\). A vector is \(v = v^r \partial_r + v^\theta \partial_\theta\). The one-form \(\omega = \omega_r dr + \omega_\theta d\theta\) pairs with \(v\) to give \(\omega(v) = \omega_r v^r + \omega_\theta v^\theta\) — no metric needed.

Now consider \(f = r^2\). Then \(df = 2r\,dr\). The one-form components are \((df)_r = 2r\) and \((df)_\theta = 0\). But the gradient vector has components \((\nabla f)^r = g^{rr}(df)_r = 1 \cdot 2r = 2r\) and \((\nabla f)^\theta = g^{\theta\theta}(df)_\theta = 0\). In the orthonormal basis, the gradient has magnitude \(2r\) in the \(\hat r\) direction — consistent with \(\nabla(r^2) = 2r\hat r\) in polar coordinates.
</div>

**Non-coordinate (anholonomic) bases.** Sometimes it is convenient to use an orthonormal frame \(\{e_a\}\) that is not the coordinate basis. The corresponding dual frame \(\{e^a\}\) satisfies \(\langle e^a, e_b\rangle = \delta^a{}_b\). In an orthonormal frame, the metric components are just the constant matrix \(\eta_{ab} = \operatorname{diag}(-1,+1,+1,+1)\) everywhere — but the connection coefficients (spin connection) are no longer symmetric, because the frame basis vectors do not commute. This is the basis for the tetrad (vierbein) formulation of GR, which is essential for coupling gravity to spinor fields (fermions).

<svg viewBox="0 0 360 160" xmlns="http://www.w3.org/2000/svg" style="max-width:380px;display:block;margin:1.5em auto">
  <defs>
    <marker id="ah5" markerWidth="8" markerHeight="6" refX="6" refY="3" orient="auto">
      <polygon points="0 0,8 3,0 6" fill="currentColor"/>
    </marker>
  </defs>
  <text x="70" y="18" font-size="12" fill="currentColor" text-anchor="middle">T_pM (vectors)</text>
  <rect x="10" y="25" width="120" height="120" fill="none" stroke="currentColor" stroke-width="1.2" rx="4"/>
  <line x1="70" y1="130" x2="100" y2="65" stroke="#3b82f6" stroke-width="2" marker-end="url(#ah5)"/>
  <text x="108" y="62" font-size="12" fill="#3b82f6">v</text>
  <text x="230" y="18" font-size="12" fill="currentColor" text-anchor="middle">T*_pM (one-forms)</text>
  <rect x="170" y="25" width="120" height="120" fill="none" stroke="currentColor" stroke-width="1.2" rx="4"/>
  <line x1="230" y1="130" x2="255" y2="60" stroke="#ef4444" stroke-width="2" marker-end="url(#ah5)"/>
  <text x="262" y="57" font-size="12" fill="#ef4444">ω</text>
  <line x1="135" y1="85" x2="165" y2="85" stroke="currentColor" stroke-width="1.5" marker-end="url(#ah5)"/>
  <text x="150" y="78" font-size="10" fill="currentColor">g♭</text>
  <line x1="165" y1="100" x2="135" y2="100" stroke="currentColor" stroke-width="1.5" marker-end="url(#ah5)"/>
  <text x="150" y="118" font-size="10" fill="currentColor">g♯</text>
  <text x="310" y="90" font-size="12" fill="currentColor">ω(v) ∈ ℝ</text>
  <line x1="293" y1="83" x2="295" y2="83" stroke="none"/>
</svg>

---

### Chapter 11. Tensors on Manifolds

<div class="definition">
A <strong>tensor of type \((r,s)\)</strong> at \(p\) is a multilinear map:

\[
T: \underbrace{T^*_pM \times \cdots}_{r} \times \underbrace{T_pM \times \cdots}_{s} \to \mathbb{R}
\]
</div>

Components: \(T^{\mu_1\cdots\mu_r}{}_{\nu_1\cdots\nu_s} = T(dx^{\mu_1},\ldots,dx^{\mu_r}, \partial_{\nu_1},\ldots,\partial_{\nu_s})\). Under coordinate change: each upper index transforms with \(\widetilde\Lambda\), each lower index with \(\Lambda\).

**Tensor operations:**

- *Symmetrization:* \(T_{(\mu\nu)} = \tfrac{1}{2}(T_{\mu\nu} + T_{\nu\mu})\)
- *Antisymmetrization:* \(T_{[\mu\nu]} = \tfrac{1}{2}(T_{\mu\nu} - T_{\nu\mu})\)
- *Tensor product:* \((R \otimes S)\) with components \(R^{\mu_1\cdots}{}_{\nu_1\cdots} S^{\rho_1\cdots}{}_{\sigma_1\cdots}\)
- *Contraction:* sum over a matched pair of upper and lower indices, reducing type by \((1,1)\)

Scalar fields are type \((0,0)\), vector fields type \((1,0)\), one-form fields type \((0,1)\).

**Why the transformation law defines a tensor.** A quantity with indices is a tensor if and only if its components transform in the prescribed way under coordinate changes. This is not just a formal definition — it guarantees that tensor equations are coordinate-independent. If \(T^{\mu\nu} = 0\) in one coordinate system and the components transform as a \((2,0)\) tensor, then \(T^{\mu\nu} = 0\) in every coordinate system. This is why the Einstein equations make sense: both \(G_{ab}\) and \(T_{ab}\) are genuine tensors, so their equality is a coordinate-independent statement.

**The metric as a tensor.** The metric \(g_{\mu\nu}\) is a \((0,2)\) symmetric tensor. Its inverse \(g^{\mu\nu}\) is a \((2,0)\) tensor. They satisfy \(g^{\mu\rho}g_{\rho\nu} = \delta^\mu{}_\nu\). The metric can be used to define an inner product: for two vectors \(u\) and \(v\), \(g(u,v) = g_{\mu\nu}u^\mu v^\nu\). For a Lorentzian metric, this inner product is not positive definite, and vectors can be classified as timelike, null, or spacelike based on the sign of \(g(v,v)\).

<div class="example">
<strong>Example: Tensor structure of the Faraday tensor.</strong> The electromagnetic field strength \(F_{\mu\nu} = \partial_\mu A_\nu - \partial_\nu A_\mu\) is a \((0,2)\) antisymmetric tensor. Its 6 independent components encode the electric field \(E_i = F_{0i}/c\) and magnetic field \(B^i = \tfrac{1}{2}\varepsilon^{ijk}F_{jk}\). Under Lorentz transformation, \(E\) and \(B\) mix — they are not separately tensors, but \(F_{\mu\nu}\) is. This shows why the covariant formulation is preferable: \(F_{\mu\nu}F^{\mu\nu} = 2(B^2 - E^2/c^2)\) and \(\varepsilon^{\mu\nu\rho\sigma}F_{\mu\nu}F_{\rho\sigma} = -8\vec{E}\cdot\vec{B}/c\) are Lorentz invariants, obvious from the tensor structure but not from the three-dimensional formulation.
</div>

---

### Chapter 12. n-Forms, Exterior Derivative, and Integration

**n-forms.** An \(n\)-form is a fully antisymmetric covariant tensor of type \((0,n)\).

**Wedge product.** \(dx^\mu \wedge dx^\nu = dx^\mu \otimes dx^\nu - dx^\nu \otimes dx^\mu\). The wedge product of a \(k\)-form and a \(p\)-form is a \((k+p)\)-form, fully antisymmetrized. The wedge product is graded-commutative:

\[
\alpha \wedge \beta = (-1)^{kp}\,\beta \wedge \alpha
\]
for a \(k\)-form \(\alpha\) and \(p\)-form \(\beta\). In particular, \(dx^\mu \wedge dx^\mu = 0\) (no repeated forms). This is why antisymmetry produces the Jacobian determinant in multivariable integration.

**Exterior derivative.** The operator \(d\) maps \(n\)-forms to \((n+1)\)-forms:

\[
(d\sigma)_{\mu_0\cdots\mu_n} = (n+1)\,\partial_{[\mu_0}\sigma_{\mu_1\cdots\mu_n]}, \qquad d^2 = 0
\]

For a function \(f\) (0-form): \(df = \partial_\mu f\, dx^\mu\) (the gradient one-form). For a one-form \(\omega\): \((d\omega)_{\mu\nu} = \partial_\mu \omega_\nu - \partial_\nu \omega_\mu\). For a two-form \(F_{\mu\nu}\): \((dF)_{\mu\nu\rho} = \partial_\mu F_{\nu\rho} + \partial_\nu F_{\rho\mu} + \partial_\rho F_{\mu\nu}\) — this is precisely the Bianchi identity \(\partial_{[\mu}F_{\nu\rho]} = 0\) for the electromagnetic field, equivalent to the homogeneous Maxwell equations.

<div class="example">
<strong>Exterior calculus and Maxwell's equations.</strong> All four Maxwell equations can be written using exterior calculus. Define the Faraday two-form \(F = \frac{1}{2}F_{\mu\nu}dx^\mu \wedge dx^\nu\) and the current three-form \(J\). Then:

Homogeneous equations: \(dF = 0\) (encodes \(\nabla\cdot B = 0\) and \(\nabla\times E = -\partial_t B\))

Inhomogeneous equations: \(d{\star}F = 4\pi{\star}J\) (encodes \(\nabla\cdot E = 4\pi\rho\) and \(\nabla\times B = 4\pi J/c + \partial_t E\))

where \(\star\) is the Hodge dual. The conservation of charge follows automatically: \(d^2 = 0\) implies \(d{\star}J = 0\), i.e., \(\partial_\mu J^\mu = 0\).
</div>

**Exact and closed forms:**
- \(\omega\) is *exact* if \(\omega = d\sigma\); every exact form is closed (\(d\omega = d^2\sigma = 0\))
- \(\omega\) is *closed* if \(d\omega = 0\); locally every closed form is exact (Poincaré lemma)
- Globally, a closed form need not be exact — the failure measures topology (de Rham cohomology)

**de Rham cohomology.** The \(k\)-th de Rham cohomology group is \(H^k_{dR}(M) = \ker(d:\ \Omega^k \to \Omega^{k+1}) / \text{im}(d:\ \Omega^{k-1} \to \Omega^k)\), i.e., closed forms modulo exact forms. For \(S^2\): \(H^0 = \mathbb{R}\), \(H^1 = 0\), \(H^2 = \mathbb{R}\). The non-trivial \(H^2\) captures the fact that the area form on \(S^2\) is closed (no 3-forms on a 2-manifold) but not exact (there is no 1-form whose exterior derivative is the area form — which would require \(S^2\) to have a "hole"). The de Rham theorem connects this algebra to the topology of the manifold via integration.

**Integration.** The integral of a one-form \(\omega\) along a curve \(\gamma(s)\):

\[
\int_\gamma \omega = \int_{s_1}^{s_2} \omega_\mu \frac{dx^\mu}{ds}\, ds \quad\text{(parameter-independent)}
\]

If \(\omega = df\): integral equals \(f(\gamma(s_2)) - f(\gamma(s_1))\) — Fundamental Theorem of Calculus on manifolds.

The *volume form* on an oriented \(n\)-manifold with metric \(g\) is the canonical \(n\)-form:

\[
\operatorname{vol} = \sqrt{|\det g|}\; dx^1 \wedge dx^2 \wedge \cdots \wedge dx^n
\]

Integration of an \(n\)-form over an oriented manifold automatically incorporates the correct Jacobian factor from the change of variables.

<div class="remark">
In thermodynamics: internal energy \(U\) is a state function, so \(dU\) is exact and its integral is path-independent. Work \(\delta W\) uses a crossed-out \(d\) (or \(\delta\)) because it is a one-form that is not exact on the space of thermodynamic states — its integral depends on the path (the process). The professor emphasises: "The fact that heat and work are not exact forms is the content of the second law of thermodynamics, encoded in the topology of the state space."
</div>

The change-of-variables formula in multivariable calculus (with the Jacobian determinant) is a direct consequence of the antisymmetry of the wedge product: \(dx \wedge dy = r\, dr \wedge d\theta\) in polar coordinates. Stokes' theorem in its most general form states:

\[
\int_M d\omega = \int_{\partial M} \omega
\]
This unifies the Fundamental Theorem of Calculus, Green's theorem, the divergence theorem, and the classical Stokes theorem into one statement.

<svg viewBox="0 0 380 180" xmlns="http://www.w3.org/2000/svg" style="max-width:400px;display:block;margin:1.5em auto">
  <defs>
    <marker id="ah6" markerWidth="8" markerHeight="6" refX="6" refY="3" orient="auto">
      <polygon points="0 0,8 3,0 6" fill="currentColor"/>
    </marker>
  </defs>
  <ellipse cx="130" cy="100" rx="100" ry="60" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <text x="130" y="55" text-anchor="middle" font-size="13" fill="currentColor">M</text>
  <ellipse cx="130" cy="100" rx="100" ry="60" fill="none" stroke="#3b82f6" stroke-width="2.5" stroke-dasharray="8,4"/>
  <text x="230" y="145" font-size="11" fill="#3b82f6">∂M</text>
  <path d="M 80 70 Q 130 45 180 70" fill="none" stroke="#ef4444" stroke-width="2" marker-end="url(#ah6)"/>
  <text x="132" y="42" font-size="11" fill="#ef4444">dω integrated inside</text>
  <path d="M 30 100 A 100 60 0 0 1 230 100" fill="none" stroke="#f59e0b" stroke-width="2" marker-end="url(#ah6)"/>
  <text x="132" y="175" font-size="11" fill="#f59e0b" text-anchor="middle">= ω integrated on boundary</text>
  <text x="310" y="90" font-size="18" fill="currentColor">∫_M dω</text>
  <text x="310" y="118" font-size="14" fill="currentColor">= ∫_{∂M} ω</text>
</svg>

---

### Chapter 13. Pullbacks, Pushforwards, and Lie Derivatives

**Smooth maps.** \(\phi: M \to N\) is smooth if the composition with charts is smooth.

**Pullback \(\phi^*\).** For a function \(f\) on \(N\): \((\phi^* f)(p) = f(\phi(p))\). For a one-form \(\omega\) on \(N\): \((\phi^* \omega)(v) = \omega(\phi_* v)\). Pullback works for all covariant tensors.

**Pushforward \(\phi_*\).** For a vector \(v \in T_pM\): \((\phi_* v)[f] = v[\phi^* f]\). Pushforward works for contravariant tensors. If \(\phi\) is a diffeomorphism, both operations extend to all tensor types.

<div class="remark">
The professor's key slogan: "Covariant objects (one-forms, tensors with lower indices) can always be pulled back. Contravariant objects (vectors) can always be pushed forward. Mixed tensors in general require the map to be a diffeomorphism before you can transport them." This asymmetry has deep consequences in GR: the metric can be pulled back to any submanifold (giving an induced metric), but pushing forward a metric requires a diffeomorphism.
</div>

**Local flows of vector fields.** Every smooth vector field \(v\) generates a local flow \(\phi_t: M \to M\), defined by the ODE:

\[
\frac{d}{dt}\phi_t(p) = v(\phi_t(p)), \quad \phi_0(p) = p
\]
This is just integrating the vector field as a system of differential equations. The flow exists for small \(t\) near every point; if \(v\) has compact support, it is a one-parameter group of diffeomorphisms for all \(t \in \mathbb{R}\).

**Lie derivative.** The Lie derivative \(\mathcal{L}_v T\) of a tensor \(T\) along a vector field \(v\): drag \(T\) along the flow of \(v\) by an infinitesimal step, compare with the original, divide by the step size. For different tensor types:

\[
\mathcal{L}_v f = v[f], \qquad \mathcal{L}_v w = [v,w], \qquad (\mathcal{L}_v \omega)_\mu = v^\nu \partial_\nu \omega_\mu + \omega_\nu \partial_\mu v^\nu
\]

In full index notation for a general \((1,1)\) tensor:

\[
(\mathcal{L}_v T)^\mu{}_\nu = v^\rho \partial_\rho T^\mu{}_\nu - T^\rho{}_\nu \partial_\rho v^\mu + T^\mu{}_\rho \partial_\nu v^\rho
\]

The general rule: one \(-\partial v\) term (with the same structure as the tensor's lower index) for each lower index, and one \(+\partial v\) term (with the appropriate structure) for each upper index.

Cartan's magic formula (for forms): \(\mathcal{L}_v \omega = d(i_v \omega) + i_v(d\omega)\), where \(i_v\) is contraction with \(v\) (interior product, inserting \(v\) into the first slot of \(\omega\)).

**Diffeomorphism invariance.** A crucial property of GR is *diffeomorphism invariance*: if \((M, g)\) is a solution of the Einstein equations and \(\phi: M \to M\) is any diffeomorphism, then \((M, \phi^* g)\) is also a solution (with the stress-energy tensor pulled back accordingly). This means that solutions are only defined up to diffeomorphism — a profound statement about the physical content of GR. The Lie derivative \(\mathcal{L}_\xi g = 0\) is the condition for \(\xi\) to generate a diffeomorphism symmetry (isometry), which by Noether's theorem corresponds to a conserved charge along geodesics — exactly the Killing equation.

---

### Chapter 14. Affine Connection and Covariant Derivative

<div class="remark">
"The ordinary partial derivative of a vector is not a tensor: it has extra terms coming from the change in the basis vectors. The covariant derivative corrects for this — it subtracts the change due to the basis, keeping only the intrinsic change in the vector itself."
</div>

<div class="definition">
An <strong>affine connection</strong> \(\nabla\) assigns to each pair \((X, Y)\) of vector fields a vector field \(\nabla_X Y\), satisfying:
\begin{align}
\nabla_{fX + gY}Z &= f\nabla_X Z + g\nabla_Y Z \\
\nabla_X(fY) &= (Xf)\,Y + f\,\nabla_X Y \quad\text{(Leibniz rule)}
\end{align}
</div>

**Christoffel symbols.** In a coordinate basis: \(\nabla_\mu \partial_\nu = \Gamma^\rho{}_{\mu\nu}\,\partial_\rho\). The covariant derivative of a vector:

\[
(\nabla_\mu V)^\nu = \partial_\mu V^\nu + \Gamma^\nu{}_{\mu\rho}\, V^\rho
\]

For a one-form: \((\nabla_\mu \omega)_\nu = \partial_\mu \omega_\nu - \Gamma^\rho{}_{\mu\nu}\, \omega_\rho\).

The pattern: \(+\Gamma\) for each upper index, \(-\Gamma\) for each lower index.

**Torsion-free connections:** \(\Gamma^\rho{}_{\mu\nu} = \Gamma^\rho{}_{\nu\mu}\) (symmetric in lower indices). In a coordinate basis, this means \([\nabla_\mu, \nabla_\nu]f = 0\) for scalars.

**Motivation for the covariant derivative.** The professor motivates the need for a new derivative operator through polar coordinates. Consider a constant vector field \(V = \partial_x\) in Cartesian coordinates. In polar coordinates, \(V = \cos\theta\,\partial_r - (\sin\theta/r)\,\partial_\theta\). The components \(V^r = \cos\theta\) and \(V^\theta = -\sin\theta/r\) are not constant, yet \(V\) itself has not changed. The ordinary partial derivative \(\partial_r V^\theta = \sin\theta/r^2 \neq 0\) is telling us about the change in basis vectors, not any intrinsic change in \(V\). The covariant derivative corrects for this: \(\nabla_r V^\theta = \partial_r V^\theta + \Gamma^\theta{}_{r\theta} V^\theta + \Gamma^\theta{}_{rr} V^r\). For flat space in polar coordinates, the Christoffel symbols are \(\Gamma^r{}_{\theta\theta} = -r\), \(\Gamma^\theta{}_{r\theta} = \Gamma^\theta{}_{\theta r} = 1/r\), all others zero. Substituting: \(\nabla_\mu V^\nu = 0\) — as expected for a constant vector field.

<div class="example">
<strong>Computing Christoffel symbols for \(S^2\).</strong> The round 2-sphere of radius \(R\) has metric \(ds^2 = R^2(d\theta^2 + \sin^2\theta\,d\phi^2)\). The non-zero Christoffel symbols:
\[
\Gamma^\theta{}_{\phi\phi} = -\sin\theta\cos\theta, \qquad \Gamma^\phi{}_{\theta\phi} = \Gamma^\phi{}_{\phi\theta} = \cot\theta
\]
These can be verified by the formula \(\Gamma^\rho{}_{\mu\nu} = \frac{1}{2}g^{\rho\sigma}(\partial_\mu g_{\nu\sigma} + \partial_\nu g_{\mu\sigma} - \partial_\sigma g_{\mu\nu})\). The geodesic equation \(\ddot x^\mu + \Gamma^\mu{}_{\nu\rho}\dot x^\nu\dot x^\rho = 0\) with these symbols gives great circles as the solutions — confirming that geodesics on a sphere are great circles.
</div>

---

### Chapter 15. Parallel Transport and Geodesics

**Parallel transport.** A vector \(V\) is parallel transported along a curve \(\gamma(\lambda)\) if:

\[
\nabla_{\dot\gamma} V = 0 \implies \frac{dV^\mu}{d\lambda} + \Gamma^\mu{}_{\nu\rho}\,\dot\gamma^\nu\, V^\rho = 0
\]

This is a system of ODEs: given \(V\) at one point, it propagates uniquely along the curve.

<div class="definition">
A <strong>geodesic</strong> is a curve whose tangent vector is parallel-transported along itself:

\[
\nabla_{\dot\gamma}\dot\gamma = 0 \implies \ddot x^\mu + \Gamma^\mu{}_{\nu\rho}\,\dot x^\nu \dot x^\rho = 0
\]
</div>

Geodesics are the "straightest possible curves." In Riemannian geometry they also extremize arc length. In GR, free particles follow timelike geodesics.

The professor illustrates with walking on a sphere keeping the nose forward without rotating the head: return to the starting point and the nose points in a different direction. This holonomy is governed by the Riemann tensor.

**Holonomy and curvature.** The angle by which a vector rotates when parallel-transported around a closed loop is called the *holonomy*. For a small loop enclosing area element \(\delta\Sigma^{\mu\nu}\), the rotation of a vector \(V^\rho\) is:

\[
\delta V^\rho = R^\rho{}_{\sigma\mu\nu}\, V^\sigma\, \delta\Sigma^{\mu\nu}
\]

This is the definition of curvature in terms of holonomy — entirely equivalent to the commutator definition. For a sphere of radius \(R\), a vector transported around a latitude circle at colatitude \(\theta\) rotates by \(2\pi\cos\theta\). At the equator (\(\theta = \pi/2\)): no rotation. At the pole (\(\theta = 0\)): rotation by \(2\pi\) (vector makes one full turn). The holonomy angle is \(2\pi(1-\cos\theta)\), equal to the solid angle subtended divided by \(R^2\) — directly related to the Gaussian curvature \(K = 1/R^2\).

**Geodesic completeness.** A spacetime is *geodesically complete* if every geodesic can be extended to arbitrary values of its affine parameter. Physical spacetimes are in general incomplete — geodesics that reach a singularity terminate. The Penrose-Hawking singularity theorems (1960s) prove that under reasonable energy conditions, gravitational collapse inevitably produces geodesic incompleteness — singularities are generic in GR, not just special cases like the Schwarzschild solution.

<svg viewBox="0 0 380 200" xmlns="http://www.w3.org/2000/svg" style="max-width:400px;display:block;margin:1.5em auto">
  <defs>
    <marker id="ah4" markerWidth="8" markerHeight="6" refX="6" refY="3" orient="auto">
      <polygon points="0 0,8 3,0 6" fill="currentColor"/>
    </marker>
  </defs>
  <ellipse cx="100" cy="100" rx="80" ry="80" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <ellipse cx="100" cy="100" rx="80" ry="25" fill="none" stroke="currentColor" stroke-width="1" stroke-dasharray="4,3"/>
  <path d="M 60 160 Q 100 80 140 160" fill="none" stroke="#3b82f6" stroke-width="2"/>
  <line x1="72" y1="148" x2="65" y2="128" stroke="#ef4444" stroke-width="2" marker-end="url(#ah4)"/>
  <line x1="100" y1="115" x2="100" y2="93" stroke="#ef4444" stroke-width="2" marker-end="url(#ah4)"/>
  <line x1="128" y1="148" x2="135" y2="128" stroke="#ef4444" stroke-width="2" marker-end="url(#ah4)"/>
  <rect x="240" y="40" width="130" height="130" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <line x1="260" y1="150" x2="350" y2="150" stroke="#3b82f6" stroke-width="2" marker-end="url(#ah4)"/>
  <line x1="270" y1="135" x2="270" y2="115" stroke="#ef4444" stroke-width="2" marker-end="url(#ah4)"/>
  <line x1="305" y1="135" x2="305" y2="115" stroke="#ef4444" stroke-width="2" marker-end="url(#ah4)"/>
  <line x1="340" y1="135" x2="340" y2="115" stroke="#ef4444" stroke-width="2" marker-end="url(#ah4)"/>
  <text x="100" y="195" text-anchor="middle" font-size="11" fill="currentColor">Curved: holonomy</text>
  <text x="305" y="195" text-anchor="middle" font-size="11" fill="currentColor">Flat: returns unchanged</text>
</svg>

---

### Chapter 16. Curvature: The Riemann Tensor

**Riemann tensor.** Measures the failure of covariant derivatives to commute:

\[
[\nabla_a, \nabla_b]\,\omega_c = R^d{}_{abc}\,\omega_d
\]

In components:

\[
R^\rho{}_{\sigma\mu\nu} = \partial_\mu \Gamma^\rho{}_{\nu\sigma} - \partial_\nu \Gamma^\rho{}_{\mu\sigma} + \Gamma^\rho{}_{\mu\lambda}\Gamma^\lambda{}_{\nu\sigma} - \Gamma^\rho{}_{\nu\lambda}\Gamma^\lambda{}_{\mu\sigma}
\]

**Symmetries (for Levi-Civita connection):**

\[
R_{abcd} = -R_{bacd} = -R_{abdc}, \qquad R_{[abc]d} = 0, \qquad \nabla_{[e}R_{ab]cd} = 0
\]

For \(n=4\): 20 algebraically independent components. The last identity is the differential Bianchi identity; contracted, it gives \(\nabla^a G_{ab} = 0\).

**Ricci tensor:** \(R_{ac} = R^b{}_{abc}\) (symmetric). **Ricci scalar:** \(R = g^{ac}R_{ac}\).

**Weyl tensor** \(C_{abcd}\): the traceless part of the Riemann tensor:

\[
R_{abcd} = C_{abcd} + \frac{1}{n-2}\left(g_{ac}R_{bd} - g_{bc}R_{ad} - g_{ad}R_{bc} + g_{bd}R_{ac}\right) - \frac{R}{(n-1)(n-2)}\left(g_{ac}g_{bd} - g_{ad}g_{bc}\right)
\]

The Weyl tensor encodes tidal deformation of shapes without volume change. In vacuum (where \(R_{ab} = 0\)), the Weyl tensor is the *only* nonzero part of the curvature — it carries gravitational wave content and tidal forces. The Schwarzschild metric has zero Ricci tensor but nonzero Weyl tensor; the gravitational field of a star in vacuum is pure Weyl curvature.

**Einstein tensor:**

\[
G_{ab} = R_{ab} - \frac{1}{2}Rg_{ab}, \qquad \nabla^a G_{ab} = 0 \;\text{(contracted Bianchi identity)}
\]

The contracted Bianchi identity \(\nabla^a G_{ab} = 0\) is an identity — it holds for any metric, without needing the Einstein equations. When the Einstein equations are imposed (\(G_{ab} = 8\pi G_N T_{ab}\)), it immediately implies \(\nabla^a T_{ab} = 0\): the stress-energy tensor is automatically conserved. This is not a separate assumption (Postulate 2) but rather a consequence of the geometric identity plus the Einstein equations.

**Geodesic deviation equation.** For two neighbouring geodesics with separation vector \(\xi^\mu\):

\[
\frac{D^2\xi^\mu}{d\tau^2} = R^\mu{}_{\nu\rho\sigma}\,u^\nu\, u^\rho\, \xi^\sigma
\]

The Riemann tensor is responsible for tidal forces — the geometric description of gravity. In Newtonian gravity, tidal acceleration between two nearby particles separated by \(\xi^i\) is \(\ddot\xi^i = -\partial^i\partial_j\Phi\,\xi^j\) (the tidal tensor is the second derivative of the potential). In GR, the Riemann tensor generalises this: the four-dimensional curvature encodes both the Newtonian tidal tensor and the magnetic part of the gravitational field (frame-dragging effects, gravitational waves).

<svg viewBox="0 0 380 200" xmlns="http://www.w3.org/2000/svg" style="max-width:400px;display:block;margin:1.5em auto">
  <defs>
    <marker id="ah7" markerWidth="8" markerHeight="6" refX="6" refY="3" orient="auto">
      <polygon points="0 0,8 3,0 6" fill="currentColor"/>
    </marker>
  </defs>
  <path d="M 40 160 Q 130 60 220 160" fill="none" stroke="#3b82f6" stroke-width="2.5"/>
  <path d="M 80 155 Q 160 70 240 155" fill="none" stroke="#ef4444" stroke-width="2" stroke-dasharray="5,3"/>
  <text x="40" y="178" font-size="11" fill="#3b82f6">geodesic 1</text>
  <text x="200" y="178" font-size="11" fill="#ef4444">geodesic 2</text>
  <line x1="80" y1="147" x2="90" y2="132" stroke="#10b981" stroke-width="2" marker-end="url(#ah7)"/>
  <line x1="130" y1="107" x2="140" y2="92" stroke="#10b981" stroke-width="2" marker-end="url(#ah7)"/>
  <line x1="180" y1="128" x2="190" y2="116" stroke="#10b981" stroke-width="2" marker-end="url(#ah7)"/>
  <text x="160" y="60" font-size="11" fill="#10b981">ξ (separation)</text>
  <text x="190" y="195" font-size="11" fill="currentColor" text-anchor="middle">D²ξ/dτ² = R·u·u·ξ (tidal acceleration)</text>
</svg>

---

### Chapter 17. Metric Manifolds and the Levi-Civita Connection

**Pseudo-Riemannian metric.** A symmetric non-degenerate \((0,2)\) tensor field \(g_{ab}\). For GR: Lorentzian signature \((-,+,+,+)\). Provides inner products (not positive definite), index raising/lowering, and lengths.

<div class="theorem">
<strong>Fundamental theorem of Riemannian geometry.</strong> Given a metric \(g\), there exists a unique connection that is torsion-free and metric-compatible (\(\nabla_\rho g_{\mu\nu} = 0\)) — the <strong>Levi-Civita connection</strong>:
\[
\Gamma^\rho{}_{\mu\nu} = \frac{1}{2}g^{\rho\sigma}\left(\partial_\mu g_{\nu\sigma} + \partial_\nu g_{\mu\sigma} - \partial_\sigma g_{\mu\nu}\right)
\]
</div>

Metric-compatibility means parallel transport preserves inner products. Geodesics remain timelike, spacelike, or null throughout.

**Proof of uniqueness.** Suppose \(\nabla\) is torsion-free and metric-compatible. Write three copies of \(\nabla_\rho g_{\mu\nu} = 0\) with cyclically permuted indices:
\begin{align}
\partial_\rho g_{\mu\nu} &= \Gamma^\sigma{}_{\rho\mu}g_{\sigma\nu} + \Gamma^\sigma{}_{\rho\nu}g_{\mu\sigma}\\
\partial_\mu g_{\nu\rho} &= \Gamma^\sigma{}_{\mu\nu}g_{\sigma\rho} + \Gamma^\sigma{}_{\mu\rho}g_{\nu\sigma}\\
\partial_\nu g_{\rho\mu} &= \Gamma^\sigma{}_{\nu\rho}g_{\sigma\mu} + \Gamma^\sigma{}_{\nu\mu}g_{\rho\sigma}
\end{align}

Take the combination (second + third − first), use torsion-freeness \(\Gamma^\sigma{}_{\mu\nu} = \Gamma^\sigma{}_{\nu\mu}\), and solve for \(\Gamma^\rho{}_{\mu\nu}\) to obtain the formula above. The derivation shows that the metric completely determines the connection — there are no free parameters.

**Geodesics as proper-length extrema.** For a Riemannian metric (positive definite), geodesics *minimise* arc length between nearby points. For a Lorentzian metric, timelike geodesics *maximise* proper time — the straightest worldline has the most elapsed proper time. This is why the twin who stays home (straight worldline) ages more than the twin who travels (bent worldline). For spacelike geodesics, the arc length is a saddle point in general.

**Proper distance and proper time.** Along a curve \(\gamma\) with tangent \(\dot\gamma\):

\[
L[\gamma] = \int \sqrt{|g_{\mu\nu}\dot x^\mu \dot x^\nu|}\, d\lambda
\]

This is reparametrisation-invariant. The convention is to use the arc length parameter (proper time \(\tau\) for timelike curves) so that \(g_{\mu\nu}u^\mu u^\nu = -c^2\) (our normalisation). The geodesic equation \(\nabla_{\dot\gamma}\dot\gamma = 0\) is equivalent to the Euler-Lagrange equations for this functional, with the affine parameter as a special choice that simplifies the resulting equation.

---

### Chapter 18. Isometries and Killing Vectors

**Isometry.** A diffeomorphism \(\phi: M \to M\) is an isometry if \(\phi^* g = g\). The one-parameter group generated by vector field \(k\) is a group of isometries if and only if \(k\) satisfies the **Killing equation**:

\[
\nabla_a k_b + \nabla_b k_a = 0
\]

For torsion-free connections, this is equivalent to \(\mathcal{L}_k g = 0\).

**Conserved quantities along geodesics.** If \(k^a\) is a Killing vector and \(v^a\) is tangent to a geodesic, then:

\[
Q = k_a v^a = \text{constant along the geodesic}
\]

*Proof.* Along the geodesic \(u^\mu = \dot x^\mu\):

\[
\frac{d}{d\tau}(k_\mu u^\mu) = u^\nu \nabla_\nu(k_\mu u^\mu) = u^\nu(\nabla_\nu k_\mu)u^\mu + k_\mu u^\nu \nabla_\nu u^\mu = u^\nu u^\mu \nabla_{(\nu}k_{\mu)} + 0
\]

The second term vanishes because \(u^\mu\) is geodesic (\(\nabla_u u = 0\)), and the first vanishes by the Killing equation (\(\nabla_{(\nu}k_{\mu)} = 0\)). QED.

This theorem is the backbone of practical calculations in GR. For the Schwarzschild metric, there are two Killing vectors (time translation \(\partial_t\) and azimuthal rotation \(\partial_\phi\)) giving two conserved quantities (energy \(E\) and angular momentum \(L\)) that reduce the geodesic equation to a one-dimensional problem.

**Killing vectors of Minkowski spacetime** (all 10):

| Generator | Symmetry | Conserved quantity |
|---|---|---|
| \(\partial_t\) | Time translation | Energy |
| \(\partial_x, \partial_y, \partial_z\) | Spatial translations | Momentum |
| \(y\partial_z - z\partial_y\), etc. | Rotations | Angular momentum |
| \(x\partial_t + t\partial_x\), etc. | Boosts | Centre-of-mass velocity |

The professor (Lecture 22) finds all 10 Killing vectors systematically by solving the Killing equation for the Minkowski metric \(\eta_{\mu\nu}\). The general solution is \(k_\mu = a_\mu + b_{\mu\nu}x^\nu\) where \(a_\mu\) is an arbitrary constant (4 parameters — translations) and \(b_{\mu\nu} = -b_{\nu\mu}\) is antisymmetric (6 parameters — Lorentz generators). This gives exactly 10 independent Killing vectors.

An \(n\)-dimensional manifold has at most \(n(n+1)/2\) independent Killing vectors. For \(n=4\): maximum 10, achieved by Minkowski spacetime and de Sitter/anti-de Sitter spacetimes (*maximally symmetric*).

**Stationary spacetimes:** a timelike Killing vector exists, so the metric does not depend on \(t\). **Static spacetimes:** additionally \(g_{0i} = 0\) — no rotational dragging. The Schwarzschild metric is static (outside the horizon). The Kerr metric (rotating black hole) is stationary but not static: the frame dragging means there is no timelike Killing vector that is also hypersurface-orthogonal.

**Conformal Killing vectors.** A vector field \(\xi\) is a *conformal Killing vector* if \(\mathcal{L}_\xi g_{\mu\nu} = \lambda\, g_{\mu\nu}\) for some function \(\lambda\). It generates a conformal isometry — a diffeomorphism that scales the metric by a position-dependent factor. Minkowski spacetime has 15 conformal Killing vectors (10 Poincaré + 4 special conformal transformations + 1 dilation), forming the conformal group \(SO(2,4)\).

---

## Part III — General Relativity

### Chapter 19. The Postulates of General Relativity

<div class="remark">
"Gravity is really weird. When you write Newton's second law, the acceleration depends on the force divided by the mass. For the electric force, the acceleration depends on charge and mass independently. For gravity, the gravitational mass and the inertial mass are the same — they cancel. The acceleration due to gravity does not depend on the mass of the object at all. This is ridiculous. And it is also the key to everything."
</div>

The Weak Equivalence Principle (WEP): all objects fall identically in a gravitational field, regardless of their composition. Einstein elevated this to a structural principle: locally, in a freely falling frame, all laws of physics look like special relativity. There is no local experiment that distinguishes free fall in a gravitational field from inertial motion in empty space.

The WEP has been tested to one part in \(10^{13}\) by Eötvös-type experiments. The MICROSCOPE satellite experiment (2022) confirmed it to \(10^{-15}\). General Relativity assumes it is exact. Extensions of GR (scalar-tensor theories like Brans-Dicke) can violate the Strong Equivalence Principle (which adds that gravitational self-energy also falls the same way) while preserving WEP.

**Tidal forces and the need for local frames.** There is a subtle but essential qualification to the equivalence principle: it can only hold *locally*. Consider a large enough falling elevator — particles near the floor and near the ceiling experience slightly different gravitational accelerations, since gravity weakens with distance. These *tidal forces*, caused by the non-uniformity of the field, are not removable by any choice of freely-falling frame. Two nearby freely-falling particles that begin at rest relative to each other will slowly drift apart (or together) as they fall, revealing the curvature lurking beneath the locally flat appearance of spacetime. Tidal forces measure the second derivative of the gravitational potential, which is precisely the Riemann curvature tensor. This is why the equivalence principle must be stated carefully: *in a sufficiently small, local* freely-falling frame, spacetime looks flat to first order. The word "local" carries the entire weight.

**The Pound-Rebka experiment.** The equivalence principle carries a sharp quantitative prediction — that clocks at different heights in a gravitational field tick at different rates — which can be derived without any differential geometry. The argument runs as follows. Consider observers \(A\) (at height \(h\)) and \(B\) (at height \(0\)) inside an accelerating rocket with acceleration \(g\). Let \(A\) emit a light signal of wavelength \(\lambda_A\). By the time the signal reaches \(B\), the rocket has accelerated, Doppler-shifting the signal. In the non-relativistic regime, the received wavelength is:

\[
\lambda_B = \lambda_A\!\left(1 - \frac{gh}{c^2}\right)
\]
The signal is *blue-shifted*: the lower observer receives more cycles per second than the upper one sends. By Einstein's Strong Equivalence Principle, a rocket stationary in a uniform gravitational field \(g\) must behave identically. A photon climbing *out* of a gravitational well is therefore red-shifted by the factor \(\Delta\lambda/\lambda \approx gh/c^2\). On the Earth's surface this is of order \(10^{-15}\). Pound and Rebka measured exactly this shift in 1959 using the Mössbauer effect, confirming the prediction to 10% precision. The result is profound: time itself runs slower deeper in a gravitational field, and this follows from nothing more than the equivalence principle.

**Early attempts at a relativistic theory of gravity.** Before arriving at general relativity in November 1915, Einstein had to navigate a thicket of plausible-but-wrong theories. The history is instructive because it shows that the tensor field equations were not logically inevitable — and that the key discriminating experiment was the bending of light.

In 1907, Nordstrom proposed the simplest scalar theory: replace the Newtonian Poisson equation with the covariant version

\[
\Box\,\phi = 4\pi G\, T^\alpha{}_\alpha
\]
where \(\Box = \eta^{\mu\nu}\partial_\mu\partial_\nu\) is the Minkowski d'Alembertian. The theory is linear and, problematically, gravity does not self-gravitate. Nordstrom revised it in 1913 to the nonlinear equation \(\Box\phi/\phi = 4\pi G\,T^\alpha{}_\alpha\), which at least admits self-interaction. In 1914, Einstein and Fokker showed this is equivalent to the geometric scalar theory \(R = \tilde T^\alpha{}_\alpha\) — a genuinely covariant and geometric gravity theory. Yet all of these scalar theories share a fatal flaw. Light has a trace-free stress-energy tensor, \(T^\alpha{}_\alpha = 0\) for electromagnetic radiation, so scalar-gravity predicts *no light bending at all*. Since the equivalence principle itself requires light to bend — the Pound-Rebka argument shows photons must gain and lose energy in a gravitational field — any theory with zero light bending is ruled out. Einstein's full tensor theory arrived in 1915, and Eddington's 1919 measurement of light deflection during a solar eclipse confirmed it decisively.

The lesson is clean: the source of gravity cannot be merely the trace of the stress-energy tensor. The full symmetric tensor \(T_{\mu\nu}\) must source the geometry, which is why the Einstein equations couple the Ricci tensor — not a scalar — to the complete stress-energy content of matter.

**The static weak-field metric.** The equivalence principle arguments also constrain the form of the metric in a weak, static gravitational field with Newtonian potential \(\phi\). Matching the Pound-Rebka time dilation to the \(g_{00}\) component, and requiring that the geodesic equation reduce to Newton's law \(\ddot{\vec{x}} = -\nabla\phi\), forces:

\[
d\tau^2 = \left(1 + \frac{2\phi}{c^2}\right)c^2\,dt^2 - \left(1 - \frac{2\phi}{c^2}\right)\!\left(dx^2 + dy^2 + dz^2\right)
\]
The \(g_{00}\) component encodes gravitational time dilation; the spatial components encode a position-dependent length scale. For \(\phi = -G_N M/r\), this is the \(R_s/r \ll 1\) limit of the Schwarzschild metric — a consistency check, and a hint that the exact solution must "exponentiate" the weak-field perturbation.

**From WEP to curved spacetime.** If freely-falling observers experience flat spacetime locally, then the geodesics of freely-falling test particles determine the geometry. Gravity is not a force but a manifestation of spacetime curvature: a ball thrown upward follows a geodesic in curved spacetime, and what we perceive as the "force of gravity" is really the curvature of that spacetime causing nearby geodesics to converge. The geodesic deviation equation captures this precisely: \(D^2\xi^\mu/d\tau^2 = R^\mu{}_{\nu\rho\sigma}u^\nu u^\rho \xi^\sigma\) is the GR version of Newton's tidal force equation \(\ddot\xi^i = (\partial_i\partial_j\Phi)\xi^j\).

<div class="definition">
<strong>Postulate 0.</strong> Gravity is curvature of spacetime. Gravitational forces result from geodesic deviation.
</div>

<div class="definition">
<strong>Postulate 1 (Local causality).</strong> Two events can exchange signals if and only if they can be connected by a causal curve (a curve with nowhere-spacelike tangent).
</div>

<div class="definition">
<strong>Postulate 2 (Stress-energy conservation).</strong> There exists a symmetric stress-energy tensor \(T^{ab}\) satisfying \(\nabla_b T^{ab} = 0\).
</div>

<div class="definition">
<strong>Postulate 3 (Einstein equations).</strong>
\[
R_{ab} - \frac{1}{2}R\,g_{ab} + \Lambda g_{ab} = \frac{8\pi G_N}{c^4}\,T_{ab}
\]
In natural units (\(c = 1\)): \(\;G_{ab} + \Lambda g_{ab} = 8\pi G_N\, T_{ab}\).
</div>

The left side is purely geometric; the right side encodes matter and energy. Matter tells spacetime how to curve; curved spacetime tells matter how to move.

---

### Chapter 20. The Stress-Energy Tensor and Energy Conditions

**Perfect fluid stress-energy tensor:**

\[
T_{ab} = (\rho + p)\,u_a u_b + p\,g_{ab}
\]

Conservation \(\nabla_b T^{ab} = 0\) gives the relativistic Euler equations. For dust (\(p=0\)): particles follow geodesics, confirming Postulate 0.

**Physical interpretation.** The stress-energy tensor \(T^{ab}\) has a direct physical meaning in any orthonormal frame:
- \(T^{00}\) = energy density measured by an observer with four-velocity \(u^\mu\)
- \(T^{0i}\) = momentum flux in the \(i\)-direction (also energy flux per unit area per unit time)
- \(T^{ij}\) = stress tensor (momentum flux in \(j\)-direction through a surface with normal in \(i\)-direction)

For a perfect fluid at rest, \(T^{ij} = p\delta^{ij}\) (isotropic pressure). For radiation (photon gas), the equation of state is \(p = \rho/3\), giving \(T = T^\mu{}_\mu = -\rho + 3p = 0\) — the trace vanishes. This is a consequence of conformal invariance for massless particles.

**Why \(8\pi G_N\) in the Einstein equations?** The coefficient is fixed by requiring the Newtonian limit. For a non-relativistic source with density \(\rho\) and small metric perturbation \(g_{\mu\nu} = \eta_{\mu\nu} + h_{\mu\nu}\) (with \(|h_{\mu\nu}| \ll 1\)), the \(00\)-component of the Einstein equations reduces to \(\nabla^2 h_{00} = -8\pi G_N \rho\). Comparing with the Poisson equation \(\nabla^2\Phi = 4\pi G_N \rho\) and the identification \(h_{00} = -2\Phi/c^2\) fixes the coefficient to be \(8\pi G_N/c^4\) (restoring \(c\)). The factor of 2 mismatch is precisely what gives the factor of 8 rather than 4\(\pi G_N\).

**Stress-energy tensor examples:**

- Scalar field of mass \(m\): \(T_{ab} = \nabla_a\phi\nabla_b\phi - \tfrac{1}{2}g_{ab}(\nabla^c\phi\nabla_c\phi + m^2\phi^2)\)
- Electromagnetic field: \(T_{ab} = \tfrac{1}{4\pi}(F_{ac}F_b{}^c - \tfrac{1}{4}g_{ab}F_{cd}F^{cd})\)

**Energy conditions** (not part of GR itself, but imposed to exclude pathological solutions):

<div class="definition">
<strong>Weak energy condition (WEC):</strong> \(T_{ab}v^a v^b \geq 0\) for all future-directed timelike \(v^a\).

<strong>Null energy condition (NEC):</strong> \(T_{ab}k^a k^b \geq 0\) for all null \(k^a\).

<strong>Strong energy condition (SEC):</strong> \((T_{ab} - \frac{1}{2}T\,g_{ab})v^a v^b \geq 0\) for all future-directed timelike \(v^a\).

<strong>Dominant energy condition (DEC):</strong> \(-T^a{}_b v^b\) is future-directed causal for all future-directed timelike \(v^a\).
</div>

Implication chain: \(\text{DEC} \Rightarrow \text{WEC} \Rightarrow \text{NEC}\), and \(\text{SEC} \Rightarrow \text{NEC}\).

Quantum fields generically violate the WEC — the Casimir effect provides a laboratory example of negative energy density. This is why quantum gravity is intimately connected to exotic solutions like wormholes.

**Energy conditions in cosmology.** The accelerated expansion of the universe (discovered 1998) requires the dark energy to violate the strong energy condition: \(\rho + 3p < 0\), i.e., \(w < -1/3\). A cosmological constant has \(w = -1\), violating SEC while preserving WEC. Phantom fields with \(w < -1\) violate even WEC, and could lead to a "Big Rip" where the scale factor diverges in finite proper time, tearing apart all bound structures.

**Hawking radiation preview.** The four laws of black hole thermodynamics are:

| Law | Thermodynamic | Black hole |
|---|---|---|
| 0th | Temperature constant in equilibrium | Surface gravity \(\kappa\) constant on horizon |
| 1st | \(dE = T\,dS + \text{work}\) | \(dM = \frac{\kappa}{8\pi G_N}dA + \Omega\,dJ + \Phi\,dQ\) |
| 2nd | Entropy never decreases | Horizon area never decreases (classical) |
| 3rd | Cannot reach \(T = 0\) | Cannot reach \(\kappa = 0\) (extremal BH) |

Hawking radiation promotes the 0th and 2nd laws to actual equalities: black hole temperature \(T_H = \hbar\kappa/(2\pi k_B c)\) and Bekenstein-Hawking entropy \(S_{BH} = k_B A/(4\ell_P^2)\).

---

### Chapter 21. The Schwarzschild Metric and Weak-Field Gravity

**Birkhoff's theorem.** The unique vacuum, spherically symmetric solution of the Einstein equations (up to diffeomorphism) is the Schwarzschild metric. Birkhoff's theorem also implies that the exterior field of any spherically symmetric body is Schwarzschild — even if the star is pulsating. There is no spherically symmetric gravitational radiation. This is the GR analogue of Newton's shell theorem.

\[
ds^2 = -\left(1 - \frac{R_s}{r}\right)c^2\,dt^2 + \left(1 - \frac{R_s}{r}\right)^{-1}dr^2 + r^2 d\Omega^2
\]

where \(d\Omega^2 = d\theta^2 + \sin^2\theta\,d\phi^2\). The metric is asymptotically flat: as \(r\to\infty\) it becomes Minkowski.

**Derivation.** It is worth understanding where this metric comes from — Schwarzschild obtained it within weeks of Einstein's November 1915 paper, while serving in the German army on the Eastern Front, before dying of illness the following year. The derivation is a beautiful illustration of how symmetry alone constrains a solution.

We seek the most general metric consistent with spherical symmetry and time-translational invariance (static field). Spherical symmetry forces the angular part to be \(r^2 d\Omega^2\). Staticity eliminates any \(dt\,dr\) cross terms (by time-reversal invariance). The most general ansatz is therefore:

\[
ds^2 = -e^{2\alpha(r)}\,dt^2 + e^{2\beta(r)}\,dr^2 + r^2\,d\Omega^2
\]
with two undetermined functions \(\alpha(r)\) and \(\beta(r)\). Outside the source there is no matter, so the vacuum Einstein equations \(R_{\mu\nu} = 0\) apply. Computing the Ricci tensor from the Christoffel symbols of this ansatz, the \(tt\) and \(rr\) components give:

\[
R_{tt} = 0 \implies e^{2(\alpha-\beta)}\!\left(\alpha'' + (\alpha')^2 - \alpha'\beta' + \frac{2\alpha'}{r}\right) = 0
\]
\[
R_{rr} = 0 \implies -\alpha'' - (\alpha')^2 + \alpha'\beta' + \frac{2\beta'}{r} = 0
\]
Adding the two equations (after multiplying the first through by \(e^{2(\beta-\alpha)}\)) the second-derivative terms cancel, leaving simply \(\alpha' + \beta' = 0\). Integrating and imposing the Minkowski boundary condition at infinity:

\[
\alpha(r) = -\beta(r)
\]
With this relation, the \(\theta\theta\) component \(R_{\theta\theta} = 0\) reduces to:

\[
\partial_r\!\left(r\, e^{2\alpha}\right) = 1
\]
Integrating: \(r\,e^{2\alpha} = r - R_s\) for an integration constant \(R_s\), so \(e^{2\alpha} = 1 - R_s/r\), and the metric follows. The constant is fixed by the weak-field limit: \(g_{tt} \approx -(1 + 2\phi/c^2)\) with \(\phi = -G_N M/r\) gives \(R_s = 2G_N M/c^2\). Birkhoff's theorem guarantees this is the *unique* vacuum spherically symmetric solution — even for a pulsating source.

**Newtonian limit.** For \(R_s/r \ll 1\), approximate \((1-R_s/r)^{-1} \approx 1 + R_s/r\) and match with the Newtonian potential \(\phi = -G_N M/r\):

\[
R_s = \frac{2G_N M}{c^2}
\]

Relativistic correction strength \(2|\phi|/c^2\): \(\sim 10^{-9}\) on Earth's surface, \(\sim 10^{-6}\) on the Sun, \(\sim 0.1\) on a neutron star.

**Geodesic equation from variational principle.** For a particle following a timelike geodesic in Schwarzschild geometry, vary \(S = -mc\int ds\). The Killing vectors give conserved quantities:

\[
E = -\left(1 - \frac{R_s}{r}\right)\dot t \quad\text{(energy)}, \qquad L = r^2\dot\phi \quad\text{(angular momentum)}
\]

The normalization constraint \(g_{\mu\nu}\dot x^\mu\dot x^\nu = -1\) gives an effective potential equation:

\[
\frac{1}{2}\dot r^2 + V(r) = \frac{1}{2}E^2, \qquad V(r) = \frac{1}{2} - \frac{G_N M}{r} + \frac{L^2}{2r^2} - \frac{G_N M L^2}{r^3}
\]

The last term is the GR correction; the rest matches Newtonian mechanics.

**Gravitational redshift.** Since the Schwarzschild metric is independent of \(t\), the vector field \(\xi^\mu = (1,0,0,0)\) is a Killing vector: \(\nabla_{(\mu}\xi_{\nu)} = 0\). For any photon moving along a null geodesic with four-momentum \(p^\mu\), the quantity \(\xi^\mu p_\mu\) is conserved along the geodesic. The proof is immediate: differentiating along the geodesic with tangent \(V^\mu\),

\[
\nabla_V(\xi^\mu p_\mu) = (\nabla_V \xi^\mu)p_\mu + \xi^\mu(\nabla_V p_\mu) = V^\alpha V^\beta \nabla_\alpha \xi_\beta + 0
\]
where the second term vanishes by the geodesic equation. The first term vanishes because \(\nabla_\alpha \xi_\beta\) is antisymmetric (Killing equation) while \(V^\alpha V^\beta\) is symmetric — their contraction is zero. Thus \(\xi^\mu p_\mu = \text{const}\) along any photon worldline.

Now consider a stationary observer at Schwarzschild radius \(r\). Their four-velocity is:

\[
u^\mu = \left(1 - \frac{R_s}{r}\right)^{-1/2}\!\xi^\mu
\]
(normalised so that \(g_{\mu\nu}u^\mu u^\nu = -1\)). The energy measured by this observer is \(E(r) = -u^\mu p_\mu\), so:

\[
E(r) = \left(1 - \frac{R_s}{r}\right)^{-1/2}\!(-\xi^\mu p_\mu)
\]
Since \(\xi^\mu p_\mu\) is the same at \(r_1\) and \(r_2\), the ratio of measured energies is:

\[
\frac{E_1}{E_2} = \sqrt{\frac{1 - R_s/r_2}{1 - R_s/r_1}}
\]
For two stationary observers at radii \(r_1 < r_2\):

\[
\frac{E_2}{E_1} = \sqrt{\frac{1 - R_s/r_1}{1 - R_s/r_2}}
\]
Since \(r_1 < r_2\), we have \(E_2 < E_1\): the photon loses energy climbing out of the gravitational well. Equivalently, \(\lambda_2 > \lambda_1\) — the wavelength is stretched, the light is red-shifted. In the weak-field limit \(R_s \ll r_{1,2}\), this reduces to \(E_2/E_1 \approx 1 - R_s(1/r_1 - 1/r_2)/2 \approx 1 + \Delta\phi/c^2\), recovering the Pound-Rebka result.

GPS correction: satellite clocks at \(r_2 \approx 4.2\times 10^7\) m run \(\approx 0.53\) ns/s faster than Earth clocks due to gravitational time dilation. There is also a competing special-relativistic effect: the satellite's orbital speed (\(v \approx 3.9\) km/s) causes time dilation that slows the clock by \(\approx -0.22\) ns/s. The net correction is \(+0.31\) ns/s. Accumulated over 24 hours: \(\approx 27 \mu\)s. At 30 cm per 1 ns timing error, ignoring GR would cause GPS to accumulate a position error of \(\sim 8\) km per day. GPS would be useless within hours without relativistic corrections.

**Precession of Mercury's perihelion.** The GR correction to the potential makes orbits precess. To leading order in \(G_N^2M^2/L^2\):

\[
\Delta\phi = \frac{6\pi G_N M}{(1-e^2)a}
\]

For Mercury: \(\Delta\phi \approx 43''\)/century. This matched the long-standing anomaly (the total observed precession is \(574''\)/century, of which \(531''\) is due to perturbations from other planets; the remaining \(43''\) was unexplained for decades) and became the first quantitative confirmation of GR.

**Derivation of perihelion precession.** The result \(\Delta\phi = 6\pi G_N M/[(1-e^2)a]\) is not obvious — it emerges from a perturbative analysis of the radial geodesic equation. Let us trace the argument.

The orbit lies in the equatorial plane \(\theta = \pi/2\). The Killing vectors give two conserved quantities along a timelike geodesic:

\[
E = \left(1 - \frac{R_s}{r}\right)\dot t, \qquad L = r^2\dot\phi
\]
The normalisation condition \(g_{\mu\nu}\dot x^\mu\dot x^\nu = -1\) yields, after multiplying through by \((1 - R_s/r)\):

\[
-E^2 + \dot r^2 + \frac{L^2}{r^2}\!\left(1 - \frac{R_s}{r}\right) = -\!\left(1 - \frac{R_s}{r}\right)
\]
Rearranging into the form of a one-dimensional energy equation:

\[
\frac{1}{2}\dot r^2 + V(r) = \mathcal{E}, \qquad V(r) = \frac{1}{2} - \frac{R_s}{2r} + \frac{L^2}{2r^2} - \frac{R_s L^2}{2r^3}, \qquad \mathcal{E} = \frac{1}{2}E^2
\]
The GR correction to the Newtonian effective potential is the last term \(-R_s L^2/(2r^3)\), which falls off faster than the \(1/r^2\) centrifugal barrier. To convert this to an orbit equation, write \(r\) as a function of \(\phi\) via \(\dot r = (dr/d\phi)\dot\phi = (dr/d\phi)L/r^2\), multiply through by \(\dot\phi^{-2} = r^4/L^2\), and introduce the substitution \(x = 2L^2/(R_s r)\). The orbit equation becomes:

\[
\frac{d^2 x}{d\phi^2} - 1 + x = \frac{3}{4}\frac{R_s^2}{L^2}\,x^2
\]
The right-hand side is the GR perturbation; in the Newtonian limit it vanishes and the equation is that of a simple harmonic oscillator in \(x\) (giving closed ellipses, \(x_0 = 1 + e\cos\phi\)). Treating the RHS as small, write \(x = x_0 + x_1\) and substitute. The driven harmonic oscillator equation for \(x_1\) has a resonant (secular) term \(\propto \cos\phi\) which causes the orbit to fail to close. Solving:

\[
x \approx 1 + e\cos\!\left[(1 - \alpha)\phi\right], \qquad \alpha = \frac{3}{4}\frac{R_s^2}{L^2} \approx \frac{3R_s}{(1-e^2)a}
\]
The perihelion advances by \(\Delta\phi = 2\pi\alpha\) per orbit, giving the formula above. The calculation is structurally identical to the secular perturbation theory used in celestial mechanics, but the perturbation now comes from the geometry of spacetime rather than from other planets.

**Stable and unstable circular orbits.** Setting \(dV/dr = 0\) and \(d^2V/dr^2 > 0\) for the effective potential, stable circular orbits in Schwarzschild exist for \(r > 3R_s\). The *innermost stable circular orbit* (ISCO) is at \(r_\text{ISCO} = 3R_s = 6G_N M/c^2\). Below this radius, only unstable circular orbits (saddle points) or plunging trajectories exist. The ISCO is crucial for accretion disk physics — matter spirals in and falls off the ISCO into the black hole, radiating away energy. The efficiency of accretion onto a Schwarzschild black hole is \(\eta = 1 - \sqrt{8/9} \approx 5.7\%\) of rest mass energy, far greater than nuclear fusion (\(\sim 0.7\%\)).

For null geodesics, the analogous unstable circular orbit (photon sphere) is at \(r = 3R_s/2\).

---

### Chapter 22. Orbital Mechanics and Deflection of Light

<div class="remark">
"You can solve orbital mechanics in GR without ever touching the geodesic equations, if you are clever about using conserved quantities. The Killing vectors do all the heavy lifting."
</div>

**Light deflection.** Light follows null geodesics (\(g_{\mu\nu}\dot x^\mu\dot x^\nu = 0\)). The same effective potential analysis applies with \(m=0\). The deflection angle for a ray grazing the Sun:

\[
\Delta\phi = \pi + \frac{4G_N M}{bc^2} + \mathcal{O}(G_N^2)
\]

where \(b = L/E\) is the impact parameter. The Newtonian prediction gives only *half* this angle. Eddington's 1919 solar eclipse measurement confirmed the GR value, making Einstein world-famous. The deflection for rays grazing the Sun is \(\approx 1.75''\).

**Derivation of light deflection.** The geodesic analysis for null rays parallels the timelike case but with the normalisation \(g_{\mu\nu}\dot x^\mu\dot x^\nu = 0\). For radial motion in the equatorial plane the conserved quantities are still \(E = (1 - R_s/r)\dot t\) and \(L = r^2\dot\phi\), and the null condition gives:

\[
\frac{1}{b^2} = \frac{\dot r^2}{L^2} + W_\text{eff}(r), \qquad W_\text{eff}(r) = \frac{1}{r^2}\!\left(1 - \frac{R_s}{r}\right)
\]
where \(b = L/E\) is the impact parameter (the perpendicular distance from the source to the undeflected ray at large \(r\)). For a ray approaching from \(r = \infty\), passing closest approach \(r_1\), and escaping to \(r = \infty\), the total angular change is:

\[
\Delta\phi = 2\int_{r_1}^{\infty} \frac{dr}{r^2}\!\left(\frac{1}{b^2} - W_\text{eff}(r)\right)^{-1/2}
\]
If there were no deflection, \(\Delta\phi = \pi\). The deflection angle is \(\delta\phi = \Delta\phi - \pi\). Expanding to first order in \(R_s/r\) (weak-field limit), the integral can be evaluated by treating \(R_s\) as a small parameter. Writing the unperturbed solution \(r = d/\sin\phi\) (straight-line trajectory with impact parameter \(d \approx b\)):

\[
\delta\phi = \frac{2R_s}{b} = \frac{4G_N M}{bc^2}
\]
The factor of 2 relative to the Newtonian result arises because both the \(g_{tt}\) and \(g_{rr}\) components of the metric contribute equally to the deflection — the spatial curvature doubles the answer. Newtonian gravity only modifies \(g_{tt}\) (the gravitational potential) but leaves spatial geometry flat; GR curves both time and space, giving the full deflection. Eddington's eclipse measurement was the first direct test of this spatial curvature contribution, and it gave a result consistent with GR and inconsistent with the Newtonian (half) value.

**Gravitational lensing.** Light deflection by massive objects acts like a gravitational lens. For a point mass lens at distance \(D_L\) with a source at \(D_S\), the angular radius of the Einstein ring (perfect alignment) is:

\[
\theta_E = \sqrt{\frac{4G_N M}{c^2}\frac{D_{LS}}{D_L D_S}}
\]

Gravitational lensing is used to map dark matter distributions in galaxy clusters, detect exoplanets via microlensing, and measure the Hubble constant through time delays.

**Effective potential for null geodesics.** For massless particles in Schwarzschild:

\[
V_\text{null}(r) = \frac{L^2}{2r^2}\left(1 - \frac{R_s}{r}\right)
\]

The maximum of \(V_\text{null}\) occurs at \(r = 3R_s/2\) — the *photon sphere*, where circular null geodesics exist. A photon with \(b < 3\sqrt{3}\,R_s/2\) is captured; with \(b > 3\sqrt{3}\,R_s/2\) it escapes. The photon sphere is the edge of the black hole shadow visible to distant observers.

**Einstein–Newton race.** Two observers — one jumping through a tunnel through the Earth, one flying in a sub-orbital arc — who arrives first? Newtonian gravity: both take approximately 42 minutes (a remarkable coincidence). GR predicts the tunnel traveller arrives *slightly later* by a few microseconds — a non-intuitive result driven by the greater proper time accumulated in stronger curvature.

<div class="example">
<strong>Detailed comparison (Lecture 27 exam problem).</strong> In the race, both travellers solve the geodesic equations in Schwarzschild with the same endpoints. The orbital traveller (at greater average \(r\)) experiences less gravitational time dilation but more Lorentz time dilation (moving faster). The tunnel traveller (at smaller \(r\)) experiences more gravitational time dilation. The calculation reveals that the orbital traveller's proper time is longer — they age slightly more during the journey and arrive at the end point of their worldline slightly later in their personal time, but whether "who arrives first" depends on the coordinate time or proper time being compared. The professor works through this explicitly as an exam problem.
</div>

<svg viewBox="0 0 380 210" xmlns="http://www.w3.org/2000/svg" style="max-width:400px;display:block;margin:1.5em auto">
  <circle cx="190" cy="110" r="80" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <line x1="110" y1="110" x2="270" y2="110" stroke="#3b82f6" stroke-width="2.5" stroke-dasharray="5,3"/>
  <path d="M 110 110 Q 190 20 270 110" fill="none" stroke="#ef4444" stroke-width="2.5"/>
  <circle cx="110" cy="110" r="4" fill="currentColor"/>
  <circle cx="270" cy="110" r="4" fill="currentColor"/>
  <text x="190" y="122" text-anchor="middle" font-size="11" fill="#3b82f6">tunnel (42 min + Δt)</text>
  <text x="190" y="55" text-anchor="middle" font-size="11" fill="#ef4444">orbital (42 min)</text>
  <text x="190" y="200" text-anchor="middle" font-size="11" fill="currentColor">GR: tunnel traveller arrives microseconds later</text>
</svg>

---

### Chapter 23. Schwarzschild Black Holes

**Distinguishing singularities.** The Schwarzschild metric diverges at \(r = R_s\) and \(r = 0\). Compute the Kretschmann scalar (coordinate-independent):

\[
K = R^{\mu\nu\rho\sigma}R_{\mu\nu\rho\sigma} = \frac{12 R_s^2}{r^6}
\]

At \(r = 0\): \(K \to \infty\) — genuine curvature singularity. At \(r = R_s\): \(K\) is finite — the divergence in Schwarzschild coordinates is a *coordinate singularity* (removable by changing coordinates, like the North Pole in longitude-latitude).

**Eddington-Finkelstein coordinates.** The coordinate singularity at \(r = R_s\) can be removed by a clever change of variables. The idea, due to Eddington (1924) and rediscovered by Finkelstein (1958), is to trade the Schwarzschild time \(t\) for a coordinate adapted to ingoing null geodesics.

Start with flat Minkowski space in spherical coordinates: \(ds^2 = -dt^2 + dr^2 + r^2 d\Omega^2\). Introduce \(v = t + r\); then \(dv = dt + dr\) and the metric becomes \(ds^2 = -dv^2 + 2\,dv\,dr + r^2 d\Omega^2\), which is regular everywhere. For the Schwarzschild spacetime the analogous substitution is:

\[
v = t + r + R_s\ln\!\left|\frac{r}{R_s} - 1\right|
\]
The logarithm is chosen precisely so that the singular factor \((1-R_s/r)^{-1}\) in the Schwarzschild \(dr^2\) coefficient cancels. In these ingoing Eddington-Finkelstein (EF) coordinates \((v, r, \theta, \phi)\), the metric becomes:

\[
ds^2 = -\!\left(1 - \frac{R_s}{r}\right)dv^2 + 2\,dv\,dr + r^2\,d\Omega^2
\]
The metric component \(g_{rr} = 0\) and \(g_{vr} = 1\); there is no factor of \((1-R_s/r)^{-1}\) anywhere. At \(r = R_s\) the metric is perfectly smooth. The matrix representation is:

\[
g_{\alpha\beta} = \begin{pmatrix}-(1-R_s/r) & 1 & 0 \\ 1 & 0 & 0 \\ 0 & 0 & r^2 \end{pmatrix}
\]
To understand the causal structure, look at radial null geodesics in EF coordinates (set \(d\Omega^2 = 0\)). The condition \(ds^2 = 0\) gives:

\[
\left(1 - \frac{R_s}{r}\right)dv^2 - 2\,dv\,dr = 0 \implies dv\!\left[\left(1 - \frac{R_s}{r}\right)dv - 2\,dr\right] = 0
\]
The two families of null rays are: (i) \(dv = 0\), i.e., \(v = \text{const}\) — these are the ingoing rays; (ii) \((1-R_s/r)\,dv = 2\,dr\), which integrates to \(v = 2r + 2R_s\ln|r - R_s| + \text{const}\). Outside the horizon (\(r > R_s\)) the second family moves outward. At the horizon (\(r = R_s\)) the equation becomes \(0 = 2\,dr\), so \(r = R_s\) is itself a null surface — the trapped null ray that hovers at the horizon forever. Inside (\(r < R_s\)), both families move toward decreasing \(r\). There is *no way* for a light signal emitted at \(r < R_s\) to escape to \(r > R_s\). The surface \(r = R_s\) is a one-way membrane — the **event horizon** — and EF coordinates make this causally transparent without any coordinate pathology.

The EF chart covers only the exterior region and the black hole interior (\(r > 0\)). It does not naturally describe the white hole region. To expose the full maximal extension — all four quadrants of the Kruskal diagram — one needs the Kruskal-Szekeres coordinates.

**Kruskal-Szekeres coordinates** \((T, X)\) are regular at the horizon:

\[
ds^2 = \frac{4R_s^3}{r}e^{-r/R_s}\left(-dT^2 + dX^2\right) + r^2 d\Omega^2
\]

The horizon \(r = R_s\) corresponds to \(T = \pm X\) — perfectly regular.

**Three-observer analysis:**

- *Alice* (infalling): reaches \(r = R_s\) in finite proper time \(\Delta\tau = \frac{2}{3}\frac{R_s}{c}\left(\frac{r_0}{R_s}\right)^{3/2}\) from initial radius \(r_0\), continues inside. At the horizon, nothing special happens locally — tidal forces for a stellar black hole (\(M \sim 10 M_\odot\)) are already enormous at the horizon; for a supermassive black hole (\(M \sim 10^9 M_\odot\)), they are negligible at the horizon.
- *Bob* (at infinity): sees Alice's light increasingly redshifted, her image frozen at the horizon, exponentially dimming. The time constant of dimming is \(\tau \sim R_s/c\). From Bob's perspective, Alice never crosses — but the signal becomes exponentially faint.
- *Carol* (stationary at finite \(r\)): also sees Alice's light redshift, but can actually see her pass through the horizon in Carol's proper time if \(r\) is large enough and Carol watches long enough. The coordinate description hides this — Kruskal coordinates reveal it clearly.

**Inside the horizon.** For \(r < R_s\), \(\partial_r\) is timelike and \(\partial_t\) is spacelike. The singularity at \(r=0\) is not in "another place" but in *Alice's future* — every timelike geodesic inside reaches \(r = 0\) in finite proper time. The singularity is inevitable.

Time for Alice to fall from the horizon to the singularity:

\[
\Delta\tau \approx \frac{\pi M}{c}\left(\frac{M}{M_\odot}\right) \times 10^{-5}\text{ s}
\]

For the most massive known black holes (\(\sim 10^{10} M_\odot\)): approximately 2.5 days of interior experience.

**Penrose diagrams.** A conformal compactification that brings infinity to finite distance, preserving causal structure. Light rays always travel at 45°.

<svg viewBox="0 0 320 280" xmlns="http://www.w3.org/2000/svg" style="max-width:320px;display:block;margin:1.5em auto">
  <polygon points="160,20 310,150 160,280 10,150" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <line x1="10" y1="150" x2="160" y2="20" stroke="#ef4444" stroke-width="3" stroke-dasharray="6,3"/>
  <line x1="160" y1="20" x2="310" y2="150" stroke="#ef4444" stroke-width="3" stroke-dasharray="6,3"/>
  <line x1="160" y1="280" x2="10" y2="150" stroke="#f59e0b" stroke-width="2.5"/>
  <line x1="160" y1="280" x2="310" y2="150" stroke="#f59e0b" stroke-width="2.5"/>
  <text x="245" y="160" font-size="11" fill="currentColor" text-anchor="middle">I (exterior)</text>
  <text x="80" y="160" font-size="11" fill="currentColor" text-anchor="middle">III</text>
  <text x="160" y="100" font-size="11" fill="currentColor" text-anchor="middle">II (interior)</text>
  <text x="160" y="250" font-size="11" fill="currentColor" text-anchor="middle">IV</text>
  <text x="160" y="14" text-anchor="middle" font-size="10" fill="#ef4444">singularity r=0</text>
  <text x="6" y="154" font-size="11" fill="currentColor" text-anchor="end">i⁰</text>
  <text x="314" y="154" font-size="11" fill="currentColor">i⁰</text>
  <text x="160" y="294" text-anchor="middle" font-size="11" fill="currentColor">i⁻</text>
</svg>

**Definition of a black hole.** In an asymptotically flat spacetime, a black hole is a region from which null geodesics cannot reach future null infinity \(\mathcal{I}^+\). The event horizon is the boundary of this region.

<div class="remark">
"The event horizon is a globally defined concept. You cannot know if you have crossed an event horizon without knowing the entire future of the universe. Alice falling into a black hole cannot tell when she crosses — locally nothing special happens. The horizon is defined by the entire causal structure of spacetime, not by any local measurement. This is deeply troubling for quantum mechanics, where information is supposed to be preserved locally."
</div>

**Hawking radiation.** Quantum field theory in curved spacetime predicts that black holes radiate thermally with temperature:

\[
T_H = \frac{\hbar c^3}{8\pi G_N M k_B} \approx \frac{6 \times 10^{-8}\,\text{K}}{M/M_\odot}
\]

For stellar black holes (\(M \sim 10 M_\odot\)), \(T_H \sim 10^{-9}\,\text{K}\) — far below the cosmic microwave background temperature. Hawking radiation is currently undetectable, but it has profound implications: black holes slowly evaporate, and the information paradox (does information fall in or come back out?) remains one of the deepest open problems in physics.

**Ergosphere (Kerr black holes).** Rotating black holes (Kerr metric, 1963) have an ergosphere — a region outside the horizon where no stationary observer can exist (the frame-dragging is so strong that you cannot remain at rest). The Penrose process extracts energy from the black hole's rotation by splitting a particle in the ergosphere: one fragment falls in carrying negative energy (as measured at infinity), the other escapes with more energy than the original particle had. The maximum extractable fraction of a Kerr black hole's mass is \(1 - 1/\sqrt{2} \approx 29\%\).

The Kerr metric in Boyer-Lindquist coordinates:

\[
ds^2 = -\left(1 - \frac{R_s r}{\Sigma}\right)c^2 dt^2 - \frac{2aR_s r \sin^2\theta}{\Sigma}c\, dt\, d\phi + \frac{\Sigma}{\Delta}dr^2 + \Sigma\, d\theta^2 + \left(r^2 + a^2 + \frac{aR_s r\sin^2\theta}{\Sigma}\right)\sin^2\theta\, d\phi^2
\]

where \(\Sigma = r^2 + a^2\cos^2\theta\), \(\Delta = r^2 - R_s r + a^2\), and \(a = J/(Mc)\) is the specific angular momentum. The First Image of a Black Hole (Event Horizon Telescope, M87*, 2019) is consistent with the Kerr metric.

---

## Part IV — Cosmology

### Chapter 24. The FLRW Metric and Friedmann Equations

**The dark night sky and the end of the static universe.** Up until the early twentieth century, scientists assumed the universe to be infinite, static, and eternal — a vast unchanging stage for local events. The first serious challenge to this picture came not from measurement but from a simple observation: the night sky is dark.

If the universe were infinite, uniform, and eternal, then every line of sight from Earth would eventually intersect the surface of a star. The night sky would be as bright as the surface of the Sun in every direction. This is **Olbers' paradox**, first formulated clearly in 1826, and it rules out the classical infinite static universe. One resolution is that the universe had a beginning — stars have finite ages and their light has had finite time to reach us — but in 1826 this seemed philosophically unacceptable.

The observational breakthrough came in stages. In 1912, Slipher measured Doppler shifts of nearby galaxies and found most were receding from us. In 1929, Hubble extended Slipher's work to greater distances, using Cepheid variable stars as standard candles, and found a striking linear relationship: the recession velocity of a galaxy is proportional to its distance. Written as \(v = H_0 d\), this is **Hubble's law**, with Hubble's original constant \(H_0 \approx 500\) km/s/Mpc (now revised to \(67\)–\(73\) km/s/Mpc). The implication was unavoidable: the space between galaxies is growing, all galaxies are moving away from each other, and the universe is not static. Running the film backward, everything must have been much closer together in the past — the universe has a beginning.

At this point, general relativity became the natural tool for studying the *evolution* of the universe as a whole. To apply it, one needs a metric that describes a homogeneous, isotropic, and expanding spacetime. The symmetry analysis that produces this metric also teaches us what "homogeneous and isotropic" means in the language of Killing vectors.

**The cosmological principle.** The universe is:
1. *Homogeneous*: no preferred locations
2. *Isotropic*: no preferred directions (for comoving observers)

These two demands, together with the requirement that the spacetime be time-orientable, strongly constrain the metric. Observational evidence comes from: (1) the nearly perfect isotropy of the cosmic microwave background (CMB) to one part in \(10^5\), (2) the large-scale galaxy surveys showing homogeneity on scales above \(\sim 300\) Mpc, and (3) the Copernican principle (we are not in a special location). The cosmological principle is an approximation — on small scales the universe is highly inhomogeneous (stars, galaxies, voids).

**Comoving coordinates and proper distance.** In FLRW, comoving coordinates \((r, \theta, \phi)\) are fixed to the matter distribution — they label galaxies by their positions at some reference time. The *proper distance* between two comoving points at time \(t\) is \(d(t) = a(t)r\). The *comoving distance* \(r\) is constant in time; the proper distance grows with the expansion. The *Hubble law* \(v = Hd\) arises from differentiating: \(\dot d = \dot a r = (a/a) ar = Hd\). The recession velocity can exceed \(c\) for large distances — this is not a violation of relativity because it is not a motion through space but an expansion of space itself. No information travels faster than light.

**Cosmological redshift.** A photon emitted with wavelength \(\lambda_e\) at scale factor \(a_e\) is received with wavelength \(\lambda_r\) at scale factor \(a_r\):

\[
1 + z = \frac{\lambda_r}{\lambda_e} = \frac{a_r}{a_e}
\]

The redshift \(z\) directly measures the ratio of scale factors, not a Doppler shift (though both descriptions are valid in the limit of small distances). The CMB was emitted at \(z \approx 1100\), when the universe was \(\approx 380\,000\) years old and the scale factor was \(1/1101\) of its present value.

**Maximal symmetry.** A manifold of dimension \(n\) can have at most \(n(n+1)/2\) independent Killing vectors. When this maximum is achieved, the space is called *maximally symmetric*. In that case, the Riemann tensor is completely determined by a single constant \(k\):

\[
R_{\alpha\beta\gamma\delta} = \frac{k}{n(n-1)}\left(g_{\alpha\gamma}g_{\beta\delta} - g_{\alpha\delta}g_{\beta\gamma}\right)
\]
For 3-dimensional space, the maximum is \(3 \cdot 4/2 = 6\) Killing vectors (3 rotations + 3 translations). The three maximally symmetric spaces are the flat Euclidean space \(\mathbb{R}^3\) (with \(k=0\)), the round 3-sphere \(S^3\) (with \(k > 0\)), and the hyperbolic space \(\mathcal{H}^3\) (with \(k < 0\)).

Homogeneity (6 translational Killing vectors from isotropy at every point, and 3 rotational ones) combined with isotropy forces the spatial sections to be maximally symmetric. This is not an assumption about the universe's large-scale geometry — it is a *consequence* of requiring that space looks the same from every location in every direction. The three possibilities are exactly \(k \in \{-1, 0, +1\}\), up to rescaling.

**Derivation of the FLRW metric.** Starting from the most general metric and imposing homogeneity and isotropy systematically:
1. Isotropy forces \(g_{0i} = 0\) (no preferred direction in space)
2. Homogeneity forces the spatial sections to have constant curvature \(k \in \{-1, 0, +1\}\)
3. The time dependence is encoded in a single function \(a(t)\) — the scale factor

The Friedmann–Lemaître–Robertson–Walker (FLRW) metric:

\[
ds^2 = -c^2\,dt^2 + a(t)^2\left[\frac{dr^2}{1-kr^2} + r^2 d\Omega^2\right]
\]

Three cases:

| \(k\) | Spatial geometry | Topology |
|---|---|---|
| \(+1\) | Closed (3-sphere) | Finite volume |
| \(0\) | Flat (Euclidean) | Infinite (likely) |
| \(-1\) | Open (hyperbolic) | Infinite |

Current observations favour \(k \approx 0\).

**The scale factor \(a(t)\).** Physical distances scale as \(a(t)\). The Hubble parameter \(H(t) = \dot a/a\) measures the rate of expansion. Today: \(H_0 \approx 67\)–\(73\) km/s/Mpc.

**Friedmann equations.** Apply Einstein equations to FLRW with a perfect fluid:

\[
\left(\frac{\dot a}{a}\right)^2 = \frac{8\pi G_N}{3}\rho - \frac{kc^2}{a^2} + \frac{\Lambda c^2}{3}
\]

\[
\frac{\ddot a}{a} = -\frac{4\pi G_N}{3}\left(\rho + \frac{3p}{c^2}\right) + \frac{\Lambda c^2}{3}
\]

The first is the Friedmann equation; the second is the Raychaudhuri acceleration equation.

**Equations of state and evolution.** The matter content of the universe is modelled as a perfect fluid with equation of state \(P = w\rho\). Each component has a characteristic \(w\):

| Component | \(w\) | \(\rho \propto\) | \(a(t) \propto\) |
|---|---|---|---|
| Dust (cold dark matter) | \(0\) | \(a^{-3}\) | \(t^{2/3}\) |
| Radiation | \(1/3\) | \(a^{-4}\) | \(t^{1/2}\) |
| Cosmological constant | \(-1\) | \(\text{const}\) | \(e^{Ht}\) (de Sitter) |
| "Curvature" | \(-1/3\) | \(a^{-2}\) | \(t\) |

The \(\rho \propto a^{-3(1+w)}\) scaling follows from stress-energy conservation \(\nabla_\mu T^{\mu\nu} = 0\) in the FLRW background, which reduces to \(\dot\rho + 3(\dot a/a)(\rho + P) = 0\). The physical interpretations are transparent: for dust, the energy density dilutes as the volume \(a^3\); for radiation, there is an extra factor of \(a^{-1}\) from the cosmological redshift of each photon's energy; for \(\Lambda\), the vacuum energy density is a constant property of spacetime itself.

Since \(\rho_R \propto a^{-4}\) and \(\rho_M \propto a^{-3}\), radiation dominates at early times (small \(a\)) and matter dominates at later times. Eventually, as \(a\) grows, the cosmological constant wins. The universe passes through three eras: radiation-dominated \(\to\) matter-dominated \(\to\) \(\Lambda\)-dominated — and we live near the transition between the latter two.

**The deceleration parameter.** It is useful to introduce the dimensionless deceleration parameter:

\[
q(t) = -\frac{a\ddot a}{\dot a^2} = -\frac{\ddot a/a}{H^2}
\]
A universe decelerating under gravity has \(q > 0\); one accelerating under dark energy has \(q < 0\). The Raychaudhuri equation shows \(q = \frac{1}{2}(1 + 3w)\Omega\) in a flat single-component universe — so matter (\(w=0\)) gives \(q = 1/2\) (decelerating), radiation (\(w=1/3\)) gives \(q = 1\) (more decelerating), and a cosmological constant (\(w=-1\)) gives \(q = -1\) (exponential acceleration). Current measurements give \(q_0 \approx -0.55\), confirming the accelerating expansion discovered by Riess, Perlmutter, and Schmidt in 1998.

**The Einstein Universe and the static solution.** Before Hubble's discovery, Einstein believed the universe to be static (\(\dot a = 0\)) and eternal. Substituting \(\dot a = \ddot a = 0\) and \(\dot\rho = 0\) into the Friedmann equations with a cosmological constant:

\[
\frac{k}{a_0^2} = \frac{8\pi G}{3}\rho_0 + \frac{\Lambda}{3}, \qquad 0 = -4\pi G(\rho_0 + 3P_0) + \Lambda
\]
For dust (\(P_0 = 0\)) the second equation gives \(\Lambda = 4\pi G\rho_0 > 0\), and the first then gives \(k = 1\) (a closed 3-sphere). The Einstein universe is a compact space with topology \(\mathbb{R} \times S^3\), held in equilibrium by the cosmological constant exactly balancing the gravitational attraction. Einstein introduced \(\Lambda\) for precisely this purpose — to permit a static solution. The solution is unstable: a small perturbation causes either unbounded expansion or collapse. When Hubble showed \(\dot a \neq 0\), Einstein called the cosmological constant "the greatest blunder of my life." It returned in 1998 — with the opposite implication.

**Fate of the universe.** The Raychaudhuri equation shows: The Raychaudhuri equation shows:
- Without \(\Lambda\): matter and radiation cause \(\ddot a < 0\) — decelerating expansion
- With positive \(\Lambda\): dark energy makes \(\ddot a > 0\) for sufficiently large \(a\) — accelerating expansion (observed since 1998)

<div class="remark">
"The cosmological constant has units of 1/length squared. It is the simplest modification to the Einstein equations consistent with all symmetries. Einstein added it to allow a static universe, removed it when Hubble discovered expansion, and it came back in 1998 when we found the expansion is accelerating. The fact that \(\Lambda \neq 0\) means the vacuum has energy — one of the greatest unsolved problems in physics. Quantum field theory predicts a value about 120 orders of magnitude larger than observed."
</div>

**Dark energy and energy condition violation.** The cosmological constant with \(p_\Lambda = -\rho_\Lambda c^2\) violates the Strong Energy Condition (\(\rho + 3p < 0\)). This is what allows accelerated expansion. More exotic dark energy models (quintessence, phantom fields) can violate even the WEC, connecting cosmology to the quantum field theory violation of energy conditions.

**Solving the Friedmann equations.** For a flat universe (\(k=0\)) with a single component of equation of state \(p = w\rho c^2\):
- Energy conservation \(\nabla_\mu T^{\mu 0} = 0\) gives \(\dot\rho + 3H(\rho + p/c^2) = 0\), so \(\rho \propto a^{-3(1+w)}\)
- Substituting into the Friedmann equation: \(H^2 = (8\pi G_N/3)\rho \propto a^{-3(1+w)}\)
- This integrates to \(a(t) \propto t^{2/3(1+w)}\) for \(w \neq -1\)

| Component | \(w\) | \(a(t)\) |
|---|---|---|
| Matter (dust) | \(0\) | \(t^{2/3}\) |
| Radiation | \(1/3\) | \(t^{1/2}\) |
| Cosmological constant | \(-1\) | \(e^{Ht}\) (de Sitter) |

**The cosmological constant problem.** The observed value of \(\Lambda\) corresponds to an energy density \(\rho_\Lambda \approx 7 \times 10^{-27}\) kg/m³. Quantum field theory predicts zero-point energy contributions of order \(\rho_\text{vac} \sim E_\text{Planck}^4/(\hbar c)^3 \approx 10^{97}\) kg/m³. The ratio is \(10^{124}\) — the worst fine-tuning problem in all of physics. No satisfactory resolution is known.

**The flatness problem and inflation.** The Friedmann equation can be written as:

\[
\Omega_\text{total} - 1 = \frac{kc^2}{a^2 H^2}
\]

For a matter-dominated universe, the right side grows as \(\propto t^{2/3}\), meaning any initial deviation from flatness is amplified. The observed flatness (\(|\Omega - 1| \lesssim 0.01\)) requires extraordinary fine-tuning at early times unless there is a period of inflation (\(w < -1/3\), so \(\ddot a > 0\)) that drives \(\Omega \to 1\) exponentially fast.

<svg viewBox="0 0 380 220" xmlns="http://www.w3.org/2000/svg" style="max-width:400px;display:block;margin:1.5em auto">
  <defs>
    <marker id="ah8" markerWidth="8" markerHeight="6" refX="6" refY="3" orient="auto">
      <polygon points="0 0,8 3,0 6" fill="currentColor"/>
    </marker>
  </defs>
  <line x1="40" y1="190" x2="360" y2="190" stroke="currentColor" stroke-width="1.5" marker-end="url(#ah8)"/>
  <line x1="40" y1="190" x2="40" y2="20" stroke="currentColor" stroke-width="1.5" marker-end="url(#ah8)"/>
  <text x="365" y="194" font-size="12" fill="currentColor">t</text>
  <text x="44" y="16" font-size="12" fill="currentColor">a(t)</text>
  <path d="M 50 185 Q 120 120 200 90 T 350 60" fill="none" stroke="#ef4444" stroke-width="2.5"/>
  <text x="355" y="56" font-size="11" fill="#ef4444">Λ > 0 (de Sitter)</text>
  <path d="M 50 185 Q 150 100 350 80" fill="none" stroke="#3b82f6" stroke-width="2"/>
  <text x="355" y="76" font-size="11" fill="#3b82f6">k=0 matter</text>
  <path d="M 50 185 Q 140 145 350 130" fill="none" stroke="#10b981" stroke-width="2" stroke-dasharray="5,4"/>
  <text x="355" y="126" font-size="11" fill="#10b981">radiation</text>
  <path d="M 50 185 Q 150 110 280 130 T 350 190" fill="none" stroke="#f59e0b" stroke-width="2" stroke-dasharray="3,3"/>
  <text x="280" y="140" font-size="11" fill="#f59e0b">k=+1 (recollapse)</text>
  <text x="200" y="212" font-size="11" fill="currentColor" text-anchor="middle">Cosmological expansion scenarios</text>
</svg>

---

---

## Part V — Advanced Topics

### Chapter 25. Gravitational Waves and Linearised Gravity

**Linearised gravity.** Write the metric as \(g_{\mu\nu} = \eta_{\mu\nu} + h_{\mu\nu}\) where \(|h_{\mu\nu}| \ll 1\). Work to first order in \(h\). Under an infinitesimal gauge transformation \(x^\mu \to x^\mu + \xi^\mu\):

\[
h_{\mu\nu} \to h_{\mu\nu} - \partial_\mu \xi_\nu - \partial_\nu \xi_\mu
\]

This is the linearised diffeomorphism invariance. By choosing appropriate \(\xi^\mu\) (*harmonic gauge*, also called Lorenz gauge), the linearised Einstein equations simplify to:

\[
\Box \bar h_{\mu\nu} = -\frac{16\pi G_N}{c^4} T_{\mu\nu}
\]

where \(\bar h_{\mu\nu} = h_{\mu\nu} - \frac{1}{2}\eta_{\mu\nu}h\) is the trace-reversed perturbation and \(\Box = \eta^{\mu\nu}\partial_\mu\partial_\nu\) is the flat-space d'Alembertian. This is a wave equation!

**Gravitational wave solutions.** In vacuum (\(T_{\mu\nu} = 0\)), plane wave solutions exist:

\[
h_{\mu\nu} = \text{Re}\left[A_{\mu\nu} e^{ik_\rho x^\rho}\right], \qquad k^\mu k_\mu = 0
\]

Residual gauge freedom allows us to impose *transverse-traceless (TT) gauge*: \(h^\mu{}_\nu k^\nu = 0\) and \(h^\mu{}_\mu = 0\). For a wave propagating in the \(z\)-direction, the only independent components are:

\[
h_+\begin{pmatrix}0&0&0&0\\0&1&0&0\\0&0&-1&0\\0&0&0&0\end{pmatrix}e^{i\omega(t-z/c)} + h_\times\begin{pmatrix}0&0&0&0\\0&0&1&0\\0&1&0&0\\0&0&0&0\end{pmatrix}e^{i\omega(t-z/c)}
\]

The two polarisations \(h_+\) and \(h_\times\) squeeze and stretch space perpendicular to the propagation direction.

**Effect on test masses.** The geodesic deviation equation in TT gauge gives the relative acceleration of two free particles separated by \(\xi^i\):

\[
\ddot\xi^x = \frac{1}{2}\ddot h_{xx}\xi^x, \qquad \ddot\xi^y = \frac{1}{2}\ddot h_{yy}\xi^y = -\frac{1}{2}\ddot h_{xx}\xi^y
\]

A ring of test particles in the \(x\)-\(y\) plane oscillates in the characteristic \(+\) pattern for the \(h_+\) polarisation. LIGO/Virgo detectors measure this strain: \(h = \Delta L/L \sim 10^{-21}\) for binary black hole mergers at cosmological distances.

**Quadrupole radiation formula.** For a slowly-moving source, the leading-order gravitational wave power is:

\[
P = \frac{G_N}{5c^5}\left\langle \dddot Q_{ij}\dddot Q^{ij}\right\rangle
\]

where \(Q_{ij} = \int \rho(x_i x_j - \frac{1}{3}\delta_{ij}r^2)\,d^3x\) is the mass quadrupole moment. This is analogous to the electric quadrupole radiation in electromagnetism (there is no gravitational *dipole* radiation because the dipole moment is the centre of mass, which is conserved by momentum conservation).

<div class="remark">
"The first detection of gravitational waves (LIGO, September 14, 2015) from the merger of two black holes of masses \(29 M_\odot\) and \(36 M_\odot\) at distance 1.3 billion light-years matched the GR prediction to extraordinary precision. The entire event released about 3 solar masses of energy as gravitational waves in 0.2 seconds — more power than all stars in the observable universe combined. The GR prediction required solving the two-body problem in full nonlinear GR using numerical relativity, a computation that required decades of methodological development."
</div>

---

## Appendix: Key Reference Formulas

**Christoffel symbols (Levi-Civita connection):**

\[
\Gamma^\rho{}_{\mu\nu} = \frac{1}{2}g^{\rho\sigma}\bigl(\partial_\mu g_{\nu\sigma} + \partial_\nu g_{\mu\sigma} - \partial_\sigma g_{\mu\nu}\bigr)
\]

**Riemann tensor:**

\[
R^\rho{}_{\sigma\mu\nu} = \partial_\mu \Gamma^\rho{}_{\nu\sigma} - \partial_\nu \Gamma^\rho{}_{\mu\sigma} + \Gamma^\rho{}_{\mu\lambda}\Gamma^\lambda{}_{\nu\sigma} - \Gamma^\rho{}_{\nu\lambda}\Gamma^\lambda{}_{\mu\sigma}
\]

**Ricci tensor:** \(R_{\mu\nu} = R^\rho{}_{\mu\rho\nu}\) (symmetric)

**Einstein tensor:** \(G_{\mu\nu} = R_{\mu\nu} - \frac{1}{2}Rg_{\mu\nu}\), satisfies \(\nabla^\mu G_{\mu\nu} = 0\)

**Einstein equations (natural units \(c=1\)):**

\[
G_{\mu\nu} + \Lambda g_{\mu\nu} = 8\pi G_N\, T_{\mu\nu}
\]

**Schwarzschild radius:** \(R_s = 2G_N M/c^2\)

**Geodesic equation:** \(\ddot x^\mu + \Gamma^\mu{}_{\nu\rho}\dot x^\nu \dot x^\rho = 0\)

**Killing equation:** \(\nabla_a k_b + \nabla_b k_a = 0\)

**Covariant derivative (vector):** \(\nabla_\mu V^\nu = \partial_\mu V^\nu + \Gamma^\nu{}_{\mu\rho}V^\rho\)

**Covariant derivative (one-form):** \(\nabla_\mu \omega_\nu = \partial_\mu \omega_\nu - \Gamma^\rho{}_{\mu\nu}\omega_\rho\)

**Four-velocity norm:** \(g_{\mu\nu}u^\mu u^\nu = -c^2\) (massive particle)

**FLRW metric:** \(ds^2 = -c^2 dt^2 + a(t)^2[dr^2/(1-kr^2) + r^2 d\Omega^2]\)

**Geodesic deviation:** \(D^2\xi^\mu/d\tau^2 = R^\mu{}_{\nu\rho\sigma}u^\nu u^\rho \xi^\sigma\)

**Bianchi identity:** \(\nabla_{[\mu}R_{\nu\rho]\sigma\lambda} = 0\) (differential); contracted: \(\nabla^\mu G_{\mu\nu} = 0\)

**Palatini identity:** \(\delta R^\mu{}_{\nu\rho\sigma} = \nabla_\rho(\delta\Gamma^\mu{}_{\sigma\nu}) - \nabla_\sigma(\delta\Gamma^\mu{}_{\rho\nu})\)

**Linearised gravity (harmonic gauge):** \(\Box\bar h_{\mu\nu} = -16\pi G_N T_{\mu\nu}/c^4\) where \(\bar h_{\mu\nu} = h_{\mu\nu} - \frac{1}{2}\eta_{\mu\nu}h\)

**Quadrupole formula:** \(P = \frac{G_N}{5c^5}\langle\dddot Q_{ij}\dddot Q^{ij}\rangle\)

**Bekenstein-Hawking entropy:** \(S_{BH} = k_B A/(4\ell_P^2)\), \(\ell_P = \sqrt{\hbar G_N/c^3} \approx 1.6 \times 10^{-35}\) m

**Hawking temperature:** \(T_H = \hbar c^3/(8\pi G_N M k_B)\)

**Hubble parameter:** \(H(t) = \dot a/a\); today \(H_0 \approx 67\)–\(73\) km/s/Mpc

**Friedmann equation:** \(H^2 = \frac{8\pi G_N}{3}\rho - \frac{kc^2}{a^2} + \frac{\Lambda c^2}{3}\)

**Scale factor evolution:** \(a(t) \propto t^{2/3}\) (matter), \(a(t) \propto t^{1/2}\) (radiation), \(a(t) \propto e^{Ht}\) (de Sitter / \(\Lambda\)-dominated)

---

---

## Summary: The Logical Architecture of GR

General Relativity is built in layers. Understanding the logical dependencies helps navigate the subject:

**Layer 0: Index notation.** All tensor equations are index equations. Mastery of Einstein summation, Kronecker delta, and Levi-Civita symbol is prerequisite for everything else.

**Layer 1: Special Relativity.** The Minkowski metric \(\eta_{\mu\nu} = \operatorname{diag}(-1,+1,+1,+1)\) encodes the causal structure of flat spacetime. Four-vectors, four-velocity, four-momentum, and the energy-momentum relation arise from Lorentz symmetry. The Euler-Lagrange formalism applied to the free-particle action produces the flat-space geodesic equation as a special case.

**Layer 2: Differential Geometry.** Manifolds provide the arena; tangent and cotangent spaces provide the mathematical home for vectors and one-forms; tensors of type \((r,s)\) unify these. The exterior derivative \(d\) and pullback \(\phi^*\) allow calculus without coordinates. The affine connection \(\nabla\) extends differentiation to curved spaces; the Riemann tensor measures curvature; the Levi-Civita connection is the unique metric-compatible torsion-free connection.

**Layer 3: General Relativity.**
- Postulate 0 (geodesic hypothesis): gravity is spacetime curvature, free particles follow geodesics
- Postulate 1 (causality): causal structure via the metric
- Postulate 2 (conservation): \(\nabla_b T^{ab} = 0\) follows from the Bianchi identity once the Einstein equations hold
- Postulate 3 (Einstein equations): \(G_{ab} + \Lambda g_{ab} = 8\pi G_N T_{ab}\) — ten second-order PDEs for the metric

**Layer 4: Solutions.** The Schwarzschild metric is the unique vacuum spherically symmetric solution. Its geodesics yield all the classical tests (time dilation, gravitational redshift, Mercury precession, light deflection). Black hole structure (horizon, singularity, Kruskal extension, Penrose diagrams) reveals the global causal structure. The FLRW metric describes homogeneous isotropic cosmology; the Friedmann equations govern the scale factor.

**Layer 5: Gravitational waves.** Linearised GR predicts wave solutions propagating at \(c\) with two polarisations. The quadrupole formula gives the radiated power for a slowly-moving source. LIGO/Virgo confirmed GR to high precision with binary black hole mergers (GW150914, 2015) and neutron star mergers (GW170817, 2017) — the latter also detected in electromagnetic waves, inaugurating multi-messenger astronomy.

**The road not taken in this course.** Kaluza-Klein theory (extra dimensions), string theory, loop quantum gravity, the full Penrose-Hawking singularity theorems, exact gravitational wave solutions (Bondi-Sachs), and numerical relativity required for LIGO waveform templates. These form graduate GR courses.

**Why GR matters.** Beyond its beauty, GR has technological consequences: GPS (requires relativistic corrections, \(\sim 27\,\mu\)s/day), gravitational lensing (used to map dark matter and detect exoplanets), gravitational wave astronomy (LIGO/Virgo detected binary mergers and neutron star collisions, enabling multi-messenger astronomy), cosmological observations (the CMB and large-scale structure are explained by FLRW + inflation + ΛCDM), and black hole imaging (Event Horizon Telescope, 2019). The subject of GR is not a historical curiosity — it is a working precision tool of 21st-century science.

**Open problems at the frontier:**
1. *Quantisation of gravity*: No complete, consistent quantum theory of gravity exists. String theory and loop quantum gravity are candidates but neither is experimentally confirmed.
2. *Information paradox*: If black holes evaporate via Hawking radiation, does information about infalling matter come back out? Unitary quantum mechanics says yes; naive semiclassical GR says no. Recent progress (island formula, Page curve) suggests unitarity is preserved, but the mechanism is not understood.
3. *Dark matter and dark energy*: \(\sim 27\%\) of the universe's energy budget is unknown dark matter (detected only gravitationally), and \(\sim 68\%\) is the cosmological constant or some dynamical dark energy field. Neither has been directly detected by non-gravitational means.
4. *Initial singularity*: Classical GR predicts the Big Bang singularity (\(a \to 0\)), where the theory breaks down. A quantum theory of gravity is needed to describe the Planck epoch (\(t \lesssim 10^{-43}\) s).

---

## Lecture Video Index

| Lecture | Topic |
|---|---|
| 1 | Index notation and Einstein summation |
| 2 | Covariance and contravariance |
| 4 | Special relativity postulates |
| 5 | Proper time |
| 6 | Minkowski metric |
| 7 | Poincaré group: translations |
| 8 | Lorentz group generators |
| 9 | Lorentz group in Mathematica (Thomas precession) |
| 10 | Hamilton's principle and Noether's theorem |
| 11 | Free particle dynamics, four-momentum |
| 12 | Collision examples (particle colliders) |
| 13 | Rindler coordinates and Bell's paradox |
| 14 | Introduction to manifolds |
| 15 | Curves and tangent vectors |
| 16 | One-forms and cotangent space |
| 17 | n-forms, exterior derivative, and integration |
| 18 | Pullbacks, pushforwards, and Lie derivatives |
| 19 | Affine connection and covariant derivative |
| 20 | Parallel transport, geodesics, and curvature |
| 21 | Riemannian manifolds and Levi-Civita connection |
| 22 | Isometries, Killing vectors, and Levi-Civita symbol |
| 23 | GR postulates |
| 24 | Stress-energy tensor and energy conditions |
| 25 | Schwarzschild metric |
| 26 | Orbital mechanics in GR |
| 27 | Einstein–Newton race (exam problem) |
| 28 | Black holes |
| 29 | Cosmology I: FLRW metric |
| 30 | Cosmology II: Friedmann equations |
