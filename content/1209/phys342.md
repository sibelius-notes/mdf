---
title: "PHYS 342: Electricity and Magnetism 2"
prof: "Dr. Matteo Mariantoni"
subjects: "PHYS"
---

> **Video lectures**: These notes draw on the lecture recordings by Dr. Matteo Mariantoni, available at the [PHYS 342 Fall 2020 YouTube playlist](https://youtube.com/playlist?list=PLXD4WWpHMeSyMteCM89uW-_OsPK1yEqRf).

---

# Part I: The Laws of Electromagnetism in Statics

## Chapter 1: Maxwell's Equations — Three Equivalent Formulations

The central pillar of this course is Maxwell's four equations, which together encode the complete classical theory of electromagnetism. Before studying specific phenomena, it is essential to understand that these laws are not a single monolithic set: they exist in three distinct mathematical forms, each valid under different smoothness conditions. Understanding when to use each form is as important as knowing the equations themselves.

**The integral form** is the most general. It places no assumptions on the charge distribution and remains valid even when \(\rho\) has discontinuities — across a charged surface, for instance. The five independent laws are:

\[
\oiint_\Sigma \vec{E} \cdot \hat{n}\, dA = \frac{1}{\varepsilon_0} \iiint_\tau \rho\, dV \qquad \text{(Gauss's law)}
\]

\[
\oiint_\Sigma \vec{B} \cdot \hat{n}\, dA = 0 \qquad \text{(no magnetic monopoles)}
\]

\[
\oiint_\Sigma \vec{J} \cdot \hat{n}\, dA = -\frac{d}{dt} \iiint_\tau \rho\, dV \qquad \text{(charge conservation)}
\]

\[
\oint_\gamma \vec{E} \cdot \hat{t}\, d\ell = 0 \qquad \text{(electrostatic irrotationality)}
\]

\[
\oint_\gamma \vec{B} \cdot \hat{t}\, d\ell = \mu_0 I_\text{linked} \qquad \text{(Ampère's law)}
\]

**Gauss's law — the spherical Gaussian surface**: The most common application is a point charge \(q\) at the origin. By spherical symmetry, \(\vec{E}\) points radially and has constant magnitude on any sphere of radius \(r\). The integral becomes \(E \cdot 4\pi r^2 = q/\varepsilon_0\):

```
        Gaussian surface for a point charge q:

                     n̂ (outward normal)
                      ↑
                  . ←─┼─→ .
               .    ↖ | ↗    .
              .   ←──(q)──→   .     ← sphere Σ, radius r
               .    ↙ | ↘    .
                  . ←─┼─→ .
                      ↓
        ∮ E·n dA = E(r) · 4πr² = q/ε₀
        ∴ E(r) = q/(4πε₀r²)   ← Coulomb's law
```

**Ampère's law — the circular Amperian loop**: For an infinite wire carrying current \(I\) along the \(z\)-axis, cylindrical symmetry forces \(\vec{B}\) to be circumferential with constant magnitude at radius \(r\):

```
        Amperian loop around an infinite wire:

                   × × × ×   (wire, current into page)
                  ×    ↑    ×
                ×     B →     ×    ← circular loop γ, radius r
                  ×    ↓    ×
                   × × × ×
        ∮ B·t dl = B(r) · 2πr = μ₀I
        ∴ B(r) = μ₀I/(2πr)
```

**The differential form** applies wherever the fields and charge densities are continuously differentiable. Converting the integral laws via the divergence and Stokes theorems gives the four canonical equations:

\[
\nabla \cdot \vec{E} = \frac{\rho}{\varepsilon_0}, \qquad \nabla \cdot \vec{B} = 0, \qquad \nabla \times \vec{E} = 0, \qquad \nabla \times \vec{B} = \mu_0 \vec{J}
\]

**The local form (boundary conditions)** applies at a surface \(\Sigma\) where fields have jump discontinuities. One applies the integral laws to a thin **pillbox** (for normal components) or a thin **rectangular loop** (for tangential components):

```
        Deriving boundary conditions at interface Σ:

        PILLBOX (for normal components):        RECTANGULAR LOOP (for tangential):

          region 2         n̂ ↑                  region 2
         ─────────────────────────────          ────────────────────────────
                  ┌───────────┐                  →   →   →   dl (top, length ℓ)
          h→0     │           │  A               ↑               ↑  h→0
         ─────────┴───────────┴─────────         ─────────────────────────────
          region 1     (pillbox, area A)          →   →   →   dl (bottom, ℓ)
                                                  region 1

        Gauss on pillbox:    (E_n2 - E_n1)·A = σ·A/ε₀       ∴ ε₀(E_n2 - E_n1) = σ
        Stokes on loop:      (E_t1 - E_t2)·ℓ = 0 (Stokes on curl E=0)  ∴ E_t1 = E_t2
```

| Condition | Result | Derived from |
|---|---|---|
| Normal **E** across surface charge \(\sigma\) | \(\varepsilon_0(E_{n2} - E_{n1}) = \sigma\) | Gauss pillbox |
| Tangential **E** (always) | \(E_{t1} = E_{t2}\) | Stokes loop on \(\nabla\!\times\!\vec{E}=0\) |
| Normal **B** (always) | \(B_{n1} = B_{n2}\) | Gauss pillbox on \(\nabla\!\cdot\!\vec{B}=0\) |
| Tangential **B** across surface current \(\vec{J}_s\) | \((\vec{B}_1 - \vec{B}_2) \times \hat{n} = \mu_0 \vec{J}_s\) | Stokes loop on Ampère |

## Chapter 2: The Electrostatic Field and Its Potential

In electrostatics all charges are at rest and no fields change in time. The vanishing of \(\nabla \times \vec{E} = 0\) makes the electric field **conservative** (irrotational). By Poincaré's lemma, \(\vec{E}\) is the gradient of a scalar **electrostatic potential** \(\phi\):

\[
\vec{E} = -\nabla \phi
\]

The minus sign makes the potential decrease in the direction the field points (positive charges flow "downhill" in \(\phi\)). Substituting into Gauss's law:

\[
\nabla^2 \phi = -\frac{\rho}{\varepsilon_0} \qquad \text{(Poisson equation)}
\]

In a charge-free region (\(\rho = 0\)) this reduces to the **Laplace equation** \(\nabla^2 \phi = 0\).

```
        Potential profile φ(x) and field E(x) between two charged plates:

        φ ↑                              E ↑
          │                               │  ──────────
       V  │────                           │
          │   ↘                           │
       V/2│    ↘ (linear, from Laplace)   │  ─────── E = V/d = const
          │     ↘                         │
        0 │──────────                     └──────────────→ x
          0      d    x         E = -dφ/dx points from + plate to - plate

        φ satisfies ∇²φ = 0 between plates → d²φ/dx² = 0 → φ linear in x.
```

```
        E field lines (solid) and equipotentials (dashed)
        between two point charges +q and −q:

                    +q       →  →  →      −q
                  (source)  ↗        ↘  (sink)
               ↗ → → → → →    →   → → → → ↘
             ↗                               ↘
           ↑       equipotentials             ↑
             ↘   (perpendicular to E)       ↗
               ↘ ← ← ← ←    ←   ← ← ← ↗
                  ↘ ← ← ← ←  ←  ← ← ↗
```

## Chapter 3: The Magnetostatic Field and the Vector Potential

The magnetostatic partner of Gauss's law is \(\nabla \cdot \vec{B} = 0\): **B** field lines always close on themselves. There are no magnetic monopoles. The solenoidal property means we can write:

\[
\vec{B} = \nabla \times \vec{A}
\]

Adding any gradient \(\nabla \psi\) to \(\vec{A}\) leaves \(\vec{B}\) unchanged — this is **gauge invariance**.

```
        Closed B field lines — solenoid and straight wire:

        Solenoid (cross-section):            Infinite wire (end-on):

         →→→→→→→→→→→  (B inside, uniform)      × (wire, current into page)
        ┌─────────────┐                          B circles:
        │→→→→→→→→→→→ │                         .  .  .
        └─────────────┘                       .    ●    .
         ←←←←←←←←←←←  (outside, B≈0)         .  .  .
                                            B loops close → no magnetic monopoles
        B lines close through end caps;
        no lines begin or end.
```

In the Coulomb gauge (\(\nabla \cdot \vec{A} = 0\)):

\[
\nabla^2 \vec{A} = -\mu_0 \vec{J} \implies \vec{A}(\vec{r}) = \frac{\mu_0}{4\pi} \iiint \frac{\vec{J}(\vec{r}')}{|\vec{r} - \vec{r}'|} dV'
\]

Taking the curl recovers the **Biot-Savart law**. The duality between electrostatics and magnetostatics is exact: \(\phi \leftrightarrow \vec{A}\), \(\rho \leftrightarrow \mu_0\vec{J}\), \(\vec{E} \leftrightarrow \vec{B}\).

---

# Part II: Conductors and the Dirichlet Problem

## Chapter 4: Perfect Conductors

A **perfect conductor** (\(\eta = 0\)) has free electrons that redistribute instantaneously. At equilibrium:

- **\(\vec{E} = 0\) inside**: Any field would drive unbounded current (\(\vec{J} = \vec{E}/\eta \to \infty\)).
- **\(\rho = 0\) inside**: Gauss's law with \(\vec{E} = 0\) forces \(\rho = 0\). All charge on surface.
- **\(\phi = \text{const}\)**: No field means no potential gradient.
- **Coulomb's theorem**: \(\vec{E}|_\text{surface} = (\sigma/\varepsilon_0)\hat{n}\)

```
        Conductor at equilibrium — charge distribution and field:

            external E field →  →  →  →  →  →
                                    ↓↓↓↓  (E perpendicular to surface)
         ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─   ← surface charges (+ or -)
        |                                           |   (σ = ε₀ E·n̂)
        |       E = 0    ρ = 0    φ = const        |
        |                                           |
         ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─   ← surface charges

        Coulomb's theorem: E_n = σ/ε₀   E_t = 0 (equipotential surface)
```

```
        Faraday cage — electrostatic shielding:

          External charges (any arrangement)
               +   -  +  -  +
                 ↓ ↗ ↘ ↗ ↓
         ╔══════════════════════╗
         ║                      ║ ← metal shell
         ║   E = 0    φ = C     ║   (induced charges on outer surface
         ║   completely shielded ║    cancel external field inside)
         ╚══════════════════════╝

        The exterior field is completely excluded.
        Interior Laplace problem: ∇²φ = 0 with φ = C on shell → unique solution φ = C throughout.
```

**Electrostatic shielding**: The interior of any closed conductor is completely decoupled from all external charges. This is not just a macroscopic approximation — it is exact from the uniqueness theorem applied to the interior Dirichlet problem.

## Chapter 5: The Dirichlet Problem for Conductors

The **Dirichlet problem** finds the electrostatic potential in the region between conductors held at specified potentials. The five-step procedure:

1. Define the conductors \(C_1, \ldots, C_n\) and region \(\Omega\) between them.
2. Assign potential \(\phi_i\) to each \(C_i\) (boundary condition).
3. Solve \(\nabla^2 \phi = 0\) in \(\Omega\).
4. Compute surface charges: \(\sigma = -\varepsilon_0 \partial\phi/\partial n\).
5. Derive energy, capacitance, forces.

```
        Example: spherical capacitor (inner radius a, outer radius b):

                       ─────────
                   ─ ─         ─ ─
                 ─     ─ ─ ─ ─     ─
                ─   ─ ─         ─ ─ ─
               ─  ─  φ=V₁ (inner)   ─  ─
               ─ ─      ───────      ─ ─
               ─ ─   ──       ──     ─ ─
                ─  ─ ─  E (radial) ─ ─ ─
                 ─     ─ ─ ─ ─     ─
                   ─ ─         ─ ─
                       ─────────
                     φ = 0 (outer, r=b)

        ∇²φ = 0 in spherical symmetry → φ(r) = A/r + B
        Apply BCs: φ(a)=V₁, φ(b)=0 → A, B determined.
        C = 4πε₀ ab/(b-a)
```

The uniqueness theorem guarantees exactly one solution. A key implication: if you can *guess* a function that satisfies Laplace's equation and matches all boundary values, you have the exact answer — no further verification is needed. This is the mathematical license behind the method of images.

## Chapter 6: Systems of Conductors and Capacitance

For \(n\) conductors, linearity of Laplace's equation implies:

\[
q_i = \sum_{j=1}^n C_{ij} \phi_j
\]

The symmetric **capacitance matrix** \(C_{ij}\) stores all electrostatic information about the conductor geometry. The stored energy:

\[
U = \frac{1}{2} \sum_{i,j} C_{ij} \phi_i \phi_j
\]

**Feynman's variational method**: The true \(\phi\) minimizes the energy functional \(W[\phi] = \frac{\varepsilon_0}{2}\iiint |\nabla\phi|^2\, dV\). Any trial function satisfying the same boundary conditions gives \(W_\text{trial} \geq W_\text{true}\), hence an upper bound on \(C\). This principle underlies all numerical (finite-element) solvers.

```
        Parallel plate capacitor — energy and field:

         +Q plate                −Q plate
          │ + + + + + + + +      │
          │ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓     │ ← E = σ/ε₀ = Q/(ε₀A), uniform
          │ ↓ ↓ E  ↓ ↓ ↓ ↓ ↓     │
          │ ↓ ↓ ↓ ↓ ↓ ↓ ↓ ↓     │
          │ − − − − − − − −      │
          ├──────────────────────┤
          0          d

        V = E·d = Qd/(ε₀A)
        C = Q/V = ε₀A/d
        U = Q²/(2C) = ½CV²
        Pressure on plates: P = σ²/(2ε₀) (attractive)
```

---

# Part III: Currents, Magnetostatics, and Induction

## Chapter 7: Electric Currents and Ohm's Law

**Electric current** is the net charge flow per unit time. The current density \(\vec{J}\) relates to the free charge density \(\rho_f\) and drift velocity \(\vec{v}\) by:

\[
\vec{J} = \rho_f \vec{v}, \qquad i(t) = \iint_\Sigma \vec{J} \cdot \hat{n}\, dA
\]

The **continuity equation** expresses charge conservation:

\[
\nabla \cdot \vec{J} = -\frac{\partial \rho}{\partial t}
\]

For **stationary (DC) currents**, \(\partial\rho/\partial t = 0\), so \(\nabla \cdot \vec{J}_c = 0\) — current lines close on themselves.

```
        Continuity equation — current tube at a junction:

              J₁ →  ──────────────┐
                                  ├──  J₃ →
              J₂ →  ──────────────┘

        ∇·J = 0  →  no accumulation at junction:  J₁·A₁ + J₂·A₂ = J₃·A₃
        (Kirchhoff's current law is the integral form of ∇·J = 0)
```

**Ohm's law** in microscopic form:

\[
\vec{J}_c = \sigma \vec{E} \quad \text{(conductivity } \sigma\text{)}, \qquad \text{equivalently} \quad \vec{E} = \eta \vec{J}_c \quad \text{(resistivity } \eta = 1/\sigma\text{)}
\]

```
        Microscopic Ohm's law in a resistor:

          V₁ (high potential)    V₂ (low potential)
           │+ + + + + + + +│─ ─ ─ ─ ─ ─ ─ ─ ─ ─ │
           │ E →   →   →  →│ J →  →  →  →  →   →│
           │  (free e⁻ drift opposite to E)       │
           │─ ─ ─ ─ ─ ─ ─ ─│+ + + + + + + + + + │

        E = η J  →  V = (ηℓ/A) I = R·I   (macroscopic Ohm's law)
        R = ηℓ/A   (resistance from geometry and material)
```

## Chapter 8: Magnetism as a Relativistic Effect of Electrostatics

Magnetism is **not** an independent phenomenon — it is electrostatics seen from a moving reference frame. Consider a test charge \(q\) moving at velocity \(\vec{v}\) parallel to a current-carrying wire:

```
        Lab frame:                       Rest frame of test charge q:

         + + + + + + + (ions, at rest)    + + + + + + + + (ions, Lorentz-contracted)
         − − − − − − − (e⁻, moving ←)   − − − − − − (e⁻, at rest → more spread out)
         ─────────────────────────────    ─────────────────────────────
                neutral wire              net + charge density!
                                          → electric force on q ≡ magnetic force in lab

         q →  (test charge, no E force)  q  (at rest, feels Coulomb force)
```

The relativistic transformation of charge density (\(\rho' = \gamma\rho\)) creates a net charge density in \(q\)'s rest frame, producing an electric force. Transforming back to the lab frame gives the Lorentz force \(\vec{F} = q(\vec{E} + \vec{v} \times \vec{B})\). This insight shows that \(\mu_0\varepsilon_0 = 1/c^2\) is not an accident — it is the relativistic connection between electric and magnetic scales.

**Two gauge choices for uniform** \(\vec{B} = B_0\hat{z}\):

| Gauge | \(\vec{A}\) | \(\vec{B} = \nabla\times\vec{A}\) |
|---|---|---|
| "Landau" | \(\vec{A}_1 = B_0 x\,\hat{y}\) | \(\nabla\times(B_0 x\hat{y}) = B_0\hat{z}\) ✓ |
| Symmetric | \(\vec{A}_2 = \tfrac{B_0}{2}(-y, x, 0)\) | same \(B_0\hat{z}\) ✓ |

Both are equally valid; neither is physically distinguished.

## Chapter 9: Neumann's Formula and Self-Inductance

For two closed filiform circuits \(\gamma_1\) and \(\gamma_2\), the **mutual inductance** is given by the **Neumann formula**:

\[
M_{12} = \frac{\mu_0}{4\pi} \oint_{\gamma_1} \oint_{\gamma_2} \frac{d\vec{\ell}_1 \cdot d\vec{\ell}_2}{|\vec{r}_1 - \vec{r}_2|}
\]

```
        Neumann formula — two coupled circuits:

                    γ₁               γ₂
                ┌────────┐       ┌────────┐
                │ ι₁ →   │       │        │
                │        │  M₁₂  │        │
                └────────┘  ←→   └────────┘
                         r₁₂ (distance between line elements)

        dℓ₁ · dℓ₂ / r₁₂ integrated over both loops.
        Symmetry: M₁₂ = M₂₁ (manifest from formula).
        Flux linkage: Φ₁₂ = M₁₂ ι₁  →  EMF₂ = -M dι₁/dt
```

This is manifestly symmetric, proving \(M_{12} = M_{21}\). **Self-inductance** of a circular loop of radius \(R\), wire radius \(a \ll R\):

\[
L \approx \mu_0 R \left[\ln\!\left(\frac{8R}{a}\right) - 2\right]
\]

Inductance is purely geometric — it depends on shape, not on current. A fatter wire (\(a\) larger) reduces \(L\) because the flux linking the wire itself is smaller.

## Chapter 10: Forces on Conductors and Circuits

Forces on conductors in fields depend on which thermodynamic constraint is imposed:

\[
\vec{F} = -\nabla_x U_m\big|_\Phi \quad\text{(constant flux)} \qquad \vec{F} = +\nabla_x U_m\big|_\iota \quad\text{(constant current)}
\]

The sign reversal at constant current occurs because the battery must supply extra energy to maintain \(\iota\): of the work \(dW_\text{battery}\), half goes to the conductor (kinetic energy) and half is "wasted" replenishing the magnetic field energy.

**Force between two parallel wires** separated by \(d\):

\[
\frac{F}{\ell} = \frac{\mu_0 i_1 i_2}{2\pi d}
\]

```
        Parallel wires — force direction:

         Parallel currents (same direction):    Antiparallel (opposite):

         i₁ ↑    i₂ ↑                          i₁ ↑    i₂ ↓
            │    │                                │    │
            │←F→ │  (attractive)                  │ F→  ← F  (repulsive)
            │    │                                │    │
         wire 1  wire 2                         wire 1  wire 2

        The wire 1 field at wire 2: B₁(d) = μ₀i₁/(2πd) (into page for ↑ current)
        Force on wire 2: F/ℓ = i₂ B₁ = μ₀i₁i₂/(2πd)
```

---

# Part IV: Multipole Expansions

## Chapter 11: The Electric Multipole Expansion

When \(r \gg r'\) (observer far from source), expand \(1/|\vec{r}-\vec{r}'|\) using Legendre polynomials:

\[
\frac{1}{|\vec{r} - \vec{r}'|} = \sum_{n=0}^\infty \frac{r'^n}{r^{n+1}} P_n(\cos\theta')
\]

```
        Multipole expansion geometry:

                  P (observer)
                  ↑
                r  │  (r >> r')
                   │
                   │← θ' (angle between r and r')
                   │  r' ↗
                   ●─────── source charge dq at r'
                  O (origin, near source)

        1/|r - r'| ≈ 1/r · [1 + (r'/r)P₁(cosθ') + (r'/r)²P₂(cosθ') + ...]
                         monopole    dipole          quadrupole
                         ~1/r        ~1/r²           ~1/r³
```

The potential hierarchy:

\[
V(\vec{r}) = \frac{1}{4\pi\varepsilon_0} \left[ \underbrace{\frac{Q}{r}}_{\text{monopole}} + \underbrace{\frac{\vec{r}\cdot\vec{p}}{r^3}}_{\text{dipole}} + \underbrace{\frac{1}{r^5}\cdots}_{\text{quadrupole}} + \cdots \right]
\]

| Term | Falloff | Non-zero when |
|---|---|---|
| Monopole \(Q\) | \(1/r\) | Net charge \(\neq 0\) |
| Dipole \(\vec{p}\) | \(1/r^2\) | Charge center \(\neq\) mass center |
| Quadrupole | \(1/r^3\) | Non-spherical distribution |

A neutral atom (\(Q = 0\)) is characterized by its dipole moment at large distances; a symmetric molecule (\(Q = 0\), \(\vec{p} = 0\)) by its quadrupole moment.

## Chapter 12: The Electric Dipole

The **ideal electric dipole** is the limit \(d \to 0\), \(q \to \infty\) with \(\vec{p} = q\vec{d} = \text{const}\). The potential and field:

\[
V = \frac{p\cos\theta}{4\pi\varepsilon_0 r^2}, \qquad E_r = \frac{2p\cos\theta}{4\pi\varepsilon_0 r^3}, \qquad E_\theta = \frac{p\sin\theta}{4\pi\varepsilon_0 r^3}
\]

```
        Dipole field lines and equipotentials (p pointing up):

                         ↑  p
                    +q  (●)   ← source
                       ↗ ↑ ↖
                     ↗   │   ↖
                   ↗     │     ↖
              ────●──────┼──────●────  (θ=π/2, zero potential plane)
                   ↘     │     ↗
                     ↘   ↓   ↗
                       ↘ ↓ ↗
                    -q  (●)   ← sink

        Along axis (θ=0):   E = 2p/(4πε₀r³)  ↑
        Perpendicular (θ=π/2): E = p/(4πε₀r³) ↓ (opposes p)
        Potential V=0 on the equatorial plane.
```

**Dipole in external field**: torque aligns the dipole with the field; a gradient pulls or pushes it.

```
        Torque on dipole p in field E₀:

               E₀ →    →    →    →    →

                    + ←── d ──→ −
                    │ ←── p ──→         τ = p × E₀ = pE₀ sinθ
                   F↑             F↓    (restoring torque toward alignment)
                   =qE             =qE
                   (net force = 0 in uniform E₀;
                    net torque ≠ 0 if p ∦ E₀)
```

## Chapter 13: Electrostatic Induction and the Method of Images

When a point charge \(q\) is placed near a grounded conductor (\(\phi = 0\)), charges redistribute on the conductor surface, with total induced charge \(-q\). The **method of images** replaces the conductor with an image charge to generate the correct boundary condition:

```
        Method of images — fields and surface charge:

             q (+)    at height d/2
              ●
              │↘ field lines curve
              │  toward conductor
        ──────┼──────────────────────  φ = 0 (grounded plane)
              │  (image charge, NOT physical — below the plane)
              ●
             -q at depth d/2

        Surface charge density:   σ(r) = −qd / [4π((d/2)² + r²)^(3/2)]
        Most negative directly below q, spreads out and → 0 as r → ∞.

          σ(r)
           0 ─────────────────────────────
             \
              \__ (negative peak at r=0)
                \_______________________

        Force on q:  F = q²/(4πε₀d²)  ← same as Coulomb force to image
```

The field lines between \(q\) and the plane are identical to those between \(q\) and \(-q\) at distance \(d\), for \(z \geq 0\). Below the plane there is no field (conductor interior).

## Chapter 14: Magnetic Multipoles and the Ideal Magnetic Dipole

The magnetic monopole term vanishes identically for any closed current loop (\(\oint \vec{J}\, dV' = 0\)). The leading term is the **magnetic dipole**:

\[
\vec{m} = i A \hat{n} \quad \text{(current loop of area } A\text{)}
\]

```
        Current loop — magnetic dipole moment:

              ↑ m̂  (right-hand rule: curl fingers with current)
              │
           ───────────
          /  →→→→→→   \     i (current)
         /     loop     \
          \  ←←←←←←   /
           ───────────
                │
                ↓
        m = i·A·n̂  (area A, normal n̂ by right-hand rule)

        Far field (r >> loop size):   identical to electric dipole field
        with ε₀ → 1/μ₀,  p → m.

        Torque: τ = m × B  (aligns loop with B)
        Energy: U = -m·B  (minimum when m ∥ B)
```

In an external field \(\vec{B}\), the torque \(\vec{\tau} = \vec{m} \times \vec{B}\) aligns the loop. This is why a compass needle (magnetic dipole) aligns with Earth's field.

---

# Part V: Matter in Fields — Dielectrics and Magnetic Materials

## Chapter 15: Dielectric Polarization

A **dielectric** is an insulator where charges are bound. An applied field shifts positive and negative charge centers, creating microscopic dipoles. The **polarization** \(\vec{P}\) is the volume density of dipole moments:

\[
\vec{P} = \lim_{\Delta V \to 0} \frac{\Delta \vec{p}}{\Delta V} \quad [\text{C/m}^2]
\]

```
        Microscopic origin of polarization:

        Without E:                    With E₀ applied →:
           (●)(●)(●)(●)                (●+)(−●)(●+)(−●)
           molecules: no net dipole     each molecule → dipole moment p = αE₀
                                        (α = molecular polarizability)

        Volume charge cancellation in interior (uniform P):

         −(+)(−)(+)(−)(+)(−)(+)−  → interior: + cancels −, net charge = 0
          │                     │
          ↑ surface −σ_p         ↑ surface +σ_p   (= P·n̂)
```

The bound charge densities:

- **Volume**: \(\rho_p = -\nabla \cdot \vec{P}\) — nonuniform polarization creates a net volume charge.
- **Surface**: \(\sigma_p = \vec{P} \cdot \hat{n}\) — the "last row" of dipoles has no partner to cancel against.

```
        Polarization charges — slab with uniform P:

        ─────────────────────────────────
         − σ_p  ← left surface (P·(−n̂) = −P)
        ─────────────────────────────────
         →→→  →→→  →→→  →→→  (P uniform)
              interior: ρ_p = -∇·P = 0
         →→→  →→→  →→→  →→→
        ─────────────────────────────────
         + σ_p  ← right surface (P·(+n̂) = +P)
        ─────────────────────────────────

        The surface charges produce a "depolarization field"
        E_p = −P/ε₀ opposing the polarization.
```

## Chapter 16: The Displacement Field and Macroscopic Electrostatics

Separating free charge \(\rho_f\) from bound charge \(\rho_p = -\nabla\cdot\vec{P}\) in Gauss's law motivates the **displacement field**:

\[
\vec{D} = \varepsilon_0 \vec{E} + \vec{P}, \qquad \nabla \cdot \vec{D} = \rho_f
\]

\(\vec{D}\) is sourced by free charges only — the polarization bound charges are "absorbed" into \(\vec{D}\).

```
        Boundary conditions for D at a dielectric interface:

        PILLBOX for D (normal BC):           LOOP for E (tangential BC):

         medium 2, ε₂                         region 2
        ──────────────────                    ──────────────────
                ┌──────┐                     ┌──E_t2──────────┐
         h→0   │  σ_f  │                 h→0 └──E_t1──────────┘
        ──────────────────                    ──────────────────
         medium 1, ε₁                         region 1

        ∮D·ndA: (D_n2 − D_n1)A = σ_f·A       ∮E·tdℓ = 0: E_t1 = E_t2
        ∴ D_n2 − D_n1 = σ_f                  (tangential E is always continuous)
```

**Refraction of field lines** at a dielectric interface (no free surface charge):

\[
\frac{\tan\theta_1}{\tan\theta_2} = \frac{\varepsilon_1}{\varepsilon_2}
\]

```
        Field line refraction at dielectric interface (ε₂ > ε₁):

         medium 1 (ε₁)    │    medium 2 (ε₂ > ε₁)
                           │
              /  θ₁        │            /  θ₂
             /             │           /        θ₂ > θ₁
         ─ ─/─ ─ ─ ─ ─ ─ ─│─ ─ ─ ─ ─/─ ─ ─ ─  (interface)
                           │
        D_n1 = D_n2:  ε₁E₁cosθ₁ = ε₂E₂cosθ₂
        E_t1 = E_t2:  E₁sinθ₁ = E₂sinθ₂
        → tanθ₂/tanθ₁ = ε₂/ε₁  (field bends toward normal in low-ε medium)
```

## Chapter 17: Linear Dielectrics and Applications

For **ILH** (isotropic, linear, homogeneous) dielectrics:

\[
\vec{P} = \chi_e \vec{E}, \quad \vec{D} = \varepsilon \vec{E} = \varepsilon_0\varepsilon_r\vec{E}, \quad \varepsilon_r = 1 + \chi_e/\varepsilon_0 > 1
\]

In charge-free ILH material: \(\nabla\cdot\vec{D} = 0 \Rightarrow \nabla\cdot\vec{E} = 0 \Rightarrow \nabla^2\phi = 0\) — Laplace's equation holds exactly as in vacuum. The material enters only through the boundary conditions.

**Depolarization field** for various geometries:

```
        Depolarization fields for uniformly polarized bodies:

        SPHERE (P upward):          SLAB (P perpendicular):    CYLINDER (P along axis):

              ↑P                         ↑P                          ↑P
           ________                  ─────────                     ┌───┐
          /        \                  + + + +                      │+ +│
         │  E_p↓   │     E_p = -P/3ε₀│       │E_p = -P/ε₀        │↓E_p│
          \        /                  - - - -                      │- -│
           ────────                  ─────────                     └───┘
                                                         E_p = -P/(2ε₀)
```

**Dielectric sphere in uniform field** \(\vec{E}_0\): solved by Laplace + matching BCs at \(r=R\):

\[
\vec{E}_\text{inside} = \frac{3}{2+\varepsilon_r}\vec{E}_0, \qquad \vec{P} = \frac{3(\varepsilon_r-1)}{2+\varepsilon_r}\varepsilon_0\vec{E}_0
\]

```
        Dielectric sphere in E₀ — field lines:

                 E₀ →  →  →  →  →  →  →
                                 ______
          E₀ →  →  →    _______/      \_______    →  →  →
                        ↓↓ E_in < E₀ ↓↓
          E₀ →  →  →   │  (weakened field) │    →  →  →
                        ↑↑               ↑↑
          E₀ →  →  →    ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾     →  →  →

        Inside: uniform field = 3E₀/(2+εᵣ)  < E₀  (shielded)
        Outside: E₀ + dipole field (P uniform inside → dipole-like outside)
        Surface charges: σ_p = P·n̂ = P cosθ  (+right, -left for P = Px̂)
```

**Parallel-plate capacitor with dielectric slab** (slab of thickness \(\ell_1\), relative permittivity \(\varepsilon_{r1}\), between air gaps \(\ell_0\) each):

\[
C = \frac{\varepsilon_0\varepsilon_{r1} A}{\ell_1 + 2\varepsilon_{r1}\ell_0}
\]

```
        Piecewise dielectric in parallel-plate capacitor:

         ╔═══════════╦═════════════════╦═══════════╗
         ║++++++++++║   air gap ℓ₀   ║           ║  ← plate A (+)
         ╠═══════════╬════════════════╬═══════════╣
         ║           ║ dielectric ε_r ║           ║  ← slab
         ╠═══════════╬════════════════╬═══════════╣
         ║           ║   air gap ℓ₀  ║−−−−−−−−−−║  ← plate B (−)
         ╚═══════════╩════════════════╩═══════════╝

        D_n continuous: ε₀E_air = ε₀εᵣ E_diel   → E_diel = E_air/εᵣ
        V = E_air·ℓ₀ + E_diel·ℓ₁ + E_air·ℓ₀ = E_air(2ℓ₀ + ℓ₁/εᵣ)
        C = Q/V = ε₀εᵣA/(ℓ₁ + 2εᵣℓ₀)
```

## Chapter 18: Magnetic Materials and the Bohr Magneton

Atomic magnetic dipoles arise from orbiting electrons. The **Rutherford-Bohr model** gives:

```
        Bohr magneton — orbital magnetic moment:

               +Ze nucleus (fixed)
                    ●
                  ↗   ↘  ← orbit of radius r_n, period T
               e⁻(-)    velocity v (counter-clockwise)
                  ↘   ↗
               current i = e/T (clockwise: − charge goes counter-CW → conventional i CW)
               magnetic moment m_el = i·πr_n² = e·πr_n²/T

        Using angular momentum quantization ℏ = m_e v r_n:
                   m_el = eℏ/(2m_e) ≡ μ_B = 9.27 × 10⁻²⁴ J/T  (Bohr magneton)

        Electron spin adds another ~μ_B (Dirac theory gives factor g≈2).
```

The **magnetization** \(\vec{M}\) is the volume density of these atomic moments:

\[
\vec{M} = \lim_{\Delta V \to 0} \frac{\Delta\vec{m}}{\Delta V} = N\bar{\vec{m}} \quad [\text{A/m}]
\]

## Chapter 19: Magnetization Currents and the H Field

Magnetized matter carries **bound currents** that affect the macroscopic \(\vec{B}\):

\[
\vec{J}_m = \nabla \times \vec{M} \quad \text{(volume)}, \qquad \vec{J}_{ms} = (\vec{M}_1 - \vec{M}_2) \times \hat{n} \quad \text{(surface)}
\]

Including these in Ampère's law and rearranging motivates the **auxiliary field**:

\[
\vec{H} = \frac{\vec{B}}{\mu_0} - \vec{M}, \qquad \oint_\gamma \vec{H} \cdot \hat{t}\, d\ell = I_c
\]

\(\vec{H}\) is sourced by **free currents only** — the most useful form for practical calculations.

```
        H field in a toroidal solenoid (all B confined inside):

                  ┌───────────────────┐
                  │   →→→ winding →→→ │  N turns, current I
                  │  ┌─────────────┐  │
                  │  │             │  │
                  │  │  B = μ₀μᵣH  │  │  ← material fills core
                  │  │      ↺      │  │
                  │  └─────────────┘  │
                  └───────────────────┘

        Amperian loop inside core (radius r):
        ∮ H·t dl = H · 2πr = N·I
        → H = NI/(2πr)
        → B = μ₀μᵣ H = μ₀μᵣNI/(2πr)

        Key: H depends only on I (free current), not on μᵣ.
        B depends on both (through μᵣ).
```

```
        Comparison: B, H, M for an infinite solenoid with magnetic core:

                     solenoid (n turns/m, current I)
                     ─────────────────────────────────
         outside:  B = 0         H = 0         M = 0
         inside:   B = μ₀μᵣnI   H = nI         M = (μᵣ-1)nI
                                (= B/μ₀ - M)
                              ↑ H does NOT depend on μᵣ ↑
```

## Chapter 20: Classification of Magnetic Materials

| Type | \(\chi_m\) | \(\mu_r\) | Microscopic origin |
|---|---|---|---|
| **Diamagnetic** | \(\approx -10^{-5}\) | \(<1\) | Lenz induction in orbital currents |
| **Paramagnetic** | \(\approx +10^{-4}\) | \(>1\) | Thermal alignment of spin moments |
| **Ferromagnetic** | \(\gg 1\), nonlinear | \(\gg 1\) | Quantum exchange interaction; domains |

**Ferromagnetic B-H hysteresis loop**:

```
        B-H hysteresis loop for a ferromagnet:

         B ↑                     Saturation (all domains aligned)
           │              ●─────────────────●
           │           ↗                     ↘    (decreasing H)
       Bᵣ ─┼──────────●                       ●──── (increasing H)
           │         ↑                         ↓
     ───────┼──────────────────────────────────────→ H
           │    −Hc  ↑                         │ Hc
        -Bᵣ─┼────────●                         ●
           │           ↘                     ↗
           │              ●─────────────────●

        Bᵣ = remanent magnetization (B at H=0, "permanent magnet")
        Hc = coercive field (H needed to demagnetize)
        Loop area = energy dissipated per cycle (hysteresis loss)
        Soft: small loop → transformers; Hard: large loop → data storage
```

**Magnetic domains** explain why a demagnetized iron bar has zero net \(\vec{M}\) even though each atom is magnetic: the domains point in random directions and cancel.

```
        Domain structure (schematic, demagnetized vs. magnetized):

        DEMAGNETIZED:          MAGNETIZED by external H:

        ↑↑↑ │ ↓↓↓ │ →→→       ↑↑↑ ↑↑↑ ↑↑↑  (domains aligned)
        ↑↑↑ │ ↓↓↓ │ →→→       ↑↑↑ ↑↑↑ ↑↑↑
        ↑↑↑ │ ↓↓↓ │ →→→       ↑↑↑ ↑↑↑ ↑↑↑
        (domains cancel → M=0)  (domain walls swept → large M)
```

## Chapter 21: Permanent Magnets — Geometry and Demagnetization

A permanent magnet carries uniform magnetization \(\vec{M}\). The surface magnetization current \(\vec{J}_{ms} = \vec{M} \times \hat{n}\) acts as an equivalent current sheet.

**Cylindrical magnet \(\equiv\) finite solenoid**:

```
        Cylindrical bar magnet — surface current equivalence:

            ↑ M (axial)
           ┌─────────────┐
           │             │ ← J_ms = M × n̂ flows circumferentially
           │  B = μ₀M    │   (same as surface current of solenoid!)
           │  inside     │
           │             │
           └─────────────┘

        Outside: B falls off as dipole field (just like solenoid)
        Maximum internal field: |B| ≤ μ₀|M|  (set by bound currents alone)
```

**Spherical permanent magnet** — solved via magnetic scalar potential \(\phi_m\) satisfying \(\nabla^2\phi_m = 0\) outside and \(\nabla^2\phi_m = -\rho_m\) (with \(\rho_m = \nabla\cdot\vec{M}\)) inside:

\[
\vec{H}_\text{inside} = -\tfrac{1}{3}\vec{M}, \qquad \vec{B}_\text{inside} = \tfrac{2}{3}\mu_0\vec{M}
\]

```
        Spherical magnet — B and H field lines:

               outside (dipole):                inside:
                  B and H                        B = 2μ₀M/3 (↑, uniform)
                  are both                       H = -M/3   (↓, demagnetizing!)
                  dipole-like                    (H opposes M inside sphere)
                  pointing ↑

             B lines:  continuous through surface, close outside
             H lines:  discontinuous at surface (H not solenoidal)
                       outside: same as B; inside: reversed direction
```

**Demagnetization factors** for uniform geometries:

| Shape | \(S\) | \(\vec{H}_\text{demag} = -S\vec{M}\) |
|---|---|---|
| Sphere | \(1/3\) | \(\vec{H} = -\vec{M}/3\) |
| Infinite cylinder (field ⊥ axis) | \(1/2\) | |
| Infinite slab (field ⊥ surface) | \(1\) | \(\vec{H} = -\vec{M}\) → \(\vec{B} = 0\) |
| Infinite slab (field ∥ surface) | \(0\) | no demagnetization |

---

# Part VI: Electrodynamics — Maxwell's Synthesis

## Chapter 22: The Complete Maxwell's Equations

Maxwell's synthesis couples time-varying \(\vec{E}\) and \(\vec{B}\) into a self-sustaining system. The **five integral form laws in vacuum**:

\[
\oiint \vec{E}\cdot\hat{n}\, dA = \frac{q}{\varepsilon_0}, \qquad \oiint \vec{B}\cdot\hat{n}\, dA = 0
\]

\[
\oiint \vec{J}\cdot\hat{n}\, dA = -\frac{dq}{dt}
\]

\[
\oint \vec{E}\cdot\hat{t}\, d\ell = -\frac{d\Phi_B}{dt} \quad \text{(Faraday-Neumann)}
\]

\[
\oint \vec{B}\cdot\hat{t}\, d\ell = \mu_0 I + \mu_0\varepsilon_0\frac{d\Phi_E}{dt} \quad \text{(Ampère-Maxwell)}
\]

The solenoidal property of \(\vec{G} = \vec{J} + \varepsilon_0\partial\vec{E}/\partial t\) is not an assumption — it follows from combining Gauss's law with charge conservation. This is the mathematical consistency condition that **forced** Maxwell to add \(\varepsilon_0\partial\vec{E}/\partial t\) to Ampère's law.

```
        How the displacement current makes Maxwell's equations consistent:

        Without displacement current:
           ∮B·dl = μ₀I_conduction
           Apply to capacitor being charged: pick two surfaces bounded by same loop γ
           Surface S₁ (cuts wire): gives I_c ≠ 0
           Surface S₂ (between plates): gives 0   ← CONTRADICTION

        With displacement current (∂E/∂t between plates):
           J_d = ε₀ ∂E/∂t = I_c/A = J_c in wire   ← CONSISTENT
           ∮B·dl = μ₀(I_c + I_d) = μ₀I_c regardless of surface choice
```

## Chapter 23: Electromagnetic Induction and Lenz's Law

**Faraday-Neumann law**: the EMF around a loop \(\gamma\) equals the negative rate of change of magnetic flux:

\[
\mathcal{E}_\gamma = \oint_\gamma \vec{E}\cdot\hat{t}\, d\ell = -\frac{d}{dt}\iint_{\Sigma_\gamma} \vec{B}\cdot\hat{n}\, dA
\]

```
        Faraday induction — flux through a loop:

                γ (circuit loop)
               ┌──────────────┐
               │   Σ_γ        │
               │ ↗ ↑ ↑ ↑ ↗   │  ← Φ_B = ∫∫ B·n dA (flux through Σ_γ)
               │   ↑ B ↑     │
               └──────────────┘
                  induced EMF = −dΦ_B/dt
                  (EMF drives current if loop is closed)

        Sign (Lenz's law): induced current opposes flux change.
        B increasing upward → induced current creates B downward → opposes increase.
```

**Lenz's law** is energy conservation: if the induced current *helped* the flux increase, it would amplify itself endlessly, creating energy from nothing.

**Barlow's wheel** — rotating disk in uniform \(\vec{B} = B\hat{z}\):

\[
\mathcal{E} = \int_0^R (\vec{v} \times \vec{B})\cdot d\vec{\ell} = \int_0^R \omega r B\, dr = \frac{1}{2}\omega B R^2
\]

```
        Barlow's wheel (top view, B out of page ⊙):

               Ammeter
                  │
               ───┼───      rotating disk, angular velocity ω
              /   │   \
             │    ●    │  ← B ⊙ (out of page)
              \   │   /
               ───┼───
                  │
                 rim contact

        Each spoke element dr at radius r moves at v = ωr
        Lorentz force: F = qv×B = qωrB  (outward on + charges)
        EMF = ∫₀ᴿ ωrB dr = ½ωBR²
        (motional EMF — field constant, conductor moving)
```

## Chapter 24: The Displacement Current

The **displacement current density** \(\vec{J}_d = \varepsilon_0\partial\vec{E}/\partial t\) completes the generalized current:

```
        Displacement current — charging capacitor:

          battery      wire        gap
          ╔═════╗ ─────┤──────────┐  │  ┌───── ─────╗
          ║     ║ I_c →│          │+ │  │−│          ║
          ║  ε  ║      │  plate A │  │  │ │ plate B  ║
          ║     ║ ─────┤──────────┘  │  └───── ─────╝
          ╚═════╝
                        ← d →
                     E growing: J_d = ε₀ ∂E/∂t

        In wire:      I_c = current flowing in
        Between plates: J_d = ε₀ ∂E/∂t,  total: I_d = ε₀ ∂E/∂t · A = I_c ✓
        Magnetic field B circles both I_c and I_d consistently.
```

## Chapter 25: Maxwell's Equations in Materials

In materials, free charges are separated from bound charges via \(\vec{D}\) and \(\vec{H}\). The full set in integral form:

\[
\oiint \vec{D}\cdot\hat{n}\, dA = q_f, \quad \oiint \vec{B}\cdot\hat{n}\, dA = 0
\]

\[
\oint \vec{E}\cdot\hat{t}\, d\ell = -\frac{d\Phi_B}{dt}, \quad \oint \vec{H}\cdot\hat{t}\, d\ell = I_c + \frac{d\Psi_D}{dt}
\]

The **constitutive relations** close the system:

\[
\vec{D} = \varepsilon\vec{E}, \quad \vec{B} = \mu\vec{H}, \quad \vec{J}_c = \sigma(\vec{E} + \vec{E}_m + \vec{u}\times\vec{B})
\]

**Differential form in materials**:

\[
\nabla\times\vec{E} = -\frac{\partial\vec{B}}{\partial t}, \quad \nabla\times\vec{H} = \vec{J}_c + \frac{\partial\vec{D}}{\partial t}, \quad \nabla\cdot\vec{D} = \rho_f, \quad \nabla\cdot\vec{B} = 0
\]

**Perfect conductor in electrodynamics**: \(\eta = 0\) implies \(\vec{E} = 0\) inside (always). Faraday then gives \(\partial\vec{B}/\partial t = 0\) — \(\vec{B}\) is frozen. If \(\vec{B}(t=0) = 0\), then \(\vec{B} = 0\) always inside (Meissner-like). Boundary conditions:

```
        Perfect conductor surface (electrodynamic case):

        OUTSIDE the conductor:           n̂·E = σ/ε₀   (Coulomb's theorem)
                                         n̂×E = 0       (equipotential surface)
                                         n̂·B = 0       (B field tangent to surface)
                                         n̂×B = J_cs    (surface current tangent to surface)

        INSIDE the conductor:
                                         E = 0,   B = 0  (if initially unmagnetized)
                                         J is finite (surface current only)
```

## Chapter 26: Electromagnetic Potentials and Gauge Conditions

Since \(\nabla\cdot\vec{B} = 0\), we write \(\vec{B} = \nabla\times\vec{A}\). Faraday's law then gives \(\nabla\times(\vec{E} + \partial\vec{A}/\partial t) = 0\), so:

\[
\vec{E} = -\frac{\partial\vec{A}}{\partial t} - \nabla V
\]

**Gauge freedom**: any transformation \(\vec{A}' = \vec{A} + \nabla\psi\), \(V' = V - \partial\psi/\partial t\) leaves \(\vec{E}\) and \(\vec{B}\) unchanged.

```
        Gauge invariance — "redundancy" in the potentials:

        Physical fields (E, B):  unique and measurable
               ↑                        ↑
        encoded by (V, A):  NOT unique — infinitely many choices
               ↑
        related by gauge: (V, A) → (V − ∂ψ/∂t,  A + ∇ψ)  for any ψ(r,t)

        Choosing a gauge = fixing ψ = removing the redundancy.
        Two standard choices:
        ┌────────────────────────────────────────────────────────┐
        │ Coulomb gauge:  ∇·A = 0                               │
        │   → ∇²V = -ρ/ε₀   (Poisson, same as electrostatics)  │
        │   → V is "instantaneous" (apparent action-at-distance) │
        ├────────────────────────────────────────────────────────┤
        │ Lorentz gauge:  ∇·A + μ₀ε₀ ∂V/∂t = 0               │
        │   → □²V = -ρ/ε₀    (wave equation, □² = ∇² − ∂²/c²∂t²) │
        │   → □²A = -μ₀J     (wave equation)                    │
        │   → speed c = 1/√(μ₀ε₀) appears naturally           │
        └────────────────────────────────────────────────────────┘
```

The **Lorentz-gauge wave equations**:

\[
\nabla^2 V_1 - \mu_0\varepsilon_0\frac{\partial^2 V_1}{\partial t^2} = -\frac{\rho}{\varepsilon_0}, \qquad \nabla^2\vec{A}_1 - \mu_0\varepsilon_0\frac{\partial^2\vec{A}_1}{\partial t^2} = -\mu_0\vec{J}
\]

These are the **fundamental wave equations of electromagnetism**. The speed of light \(c = 1/\sqrt{\mu_0\varepsilon_0}\) was hidden in Coulomb's and Ampère's constants all along — Maxwell revealed it in 1865 and identified light as an electromagnetic wave.

```
        Wave equation schematic:
        (Lorentz gauge, source-free: ρ=0, J=0)

        ∇²V = (1/c²) ∂²V/∂t²    ← wave propagates at speed c

              V(x,t) = V₀ sin(kx − ωt)   where ω/k = c

         V ↑    t=0          t=T/4
           │  /‾\             │ /‾\
           │ /   \            │/   \
        ───┼────────→ x    ───┼────────→ x
           │      \      /         \   /
           │       ‾‾‾/‾‾           ‾‾‾
         Wave moves to the right at speed c = 3×10⁸ m/s = speed of light.
```

---

# Part VII: Energy, Poynting's Theorem, and Oscillations

## Chapter 27: Magnetic Field Energy

For a general volume current distribution, the magnetic energy generalizes to:

\[
U_m = \frac{1}{2}\iiint \vec{J}\cdot\vec{A}\, dV = \frac{1}{2}\iiint \vec{H}\cdot\vec{B}\, dV
\]

The **magnetic energy density** is:

\[
u_m = \frac{1}{2}\vec{H}\cdot\vec{B} = \frac{B^2}{2\mu} \quad \text{(linear material)}, \qquad u_m = \frac{B^2}{2\mu_0} \quad \text{(vacuum)}
\]

```
        Magnetic energy storage in an inductor:

            ε (battery)          L (inductor)
             ────────────────────────────
            │ +  ─────────────   ╔════╗ │
            │                    ║ B  ║ │  ← field energy stored in L
            │ −  ─────────────   ╚════╝ │
             ────────────────────────────
                                R (resistor, dissipates energy)

        RL circuit:  ε = Ri + L di/dt
        Solution:  i(t) = I₀(1 − e^{−t/τ}),  τ = L/R,  I₀ = ε/R

         i ↑   I₀ ──────────────────────
           │      ╱
           │     ╱  ← 63% at t = τ
           │   ╱
           │  ╱
           │ ╱
           │╱
           └───────────────────────→ t
                    τ      2τ    3τ

        At t → ∞: all energy input goes to Joule heating (RI₀²).
        During transient: energy splits between field (½LI²) and heat.
```

Comparing electric and magnetic energy densities:

| Quantity | Electric | Magnetic |
|---|---|---|
| Field energy density | \(u_e = \frac{1}{2}\varepsilon E^2\) | \(u_m = \frac{B^2}{2\mu}\) |
| Stored in component | Capacitor \(U = \frac{1}{2}CV^2\) | Inductor \(U = \frac{1}{2}L\iota^2\) |
| Sources | Free charges \(\rho_f\) | Free currents \(\vec{J}_c\) |

## Chapter 28: Poynting's Theorem — Energy Flow in Electromagnetic Fields

Starting from Maxwell's equations in materials, dotting with \(\vec{H}\) and \(\vec{E}\) respectively and subtracting:

\[
\nabla\cdot(\vec{E}\times\vec{H}) = -\frac{\partial}{\partial t}\left(\frac{B^2}{2\mu} + \frac{\varepsilon E^2}{2}\right) - \vec{E}\cdot\vec{J}_c
\]

Integrating over volume \(\Omega\):

\[
\oiint_\Sigma (\vec{E}\times\vec{H})\cdot\hat{n}\, dA = -\frac{d}{dt}\iiint_\Omega u_\text{em}\, dV - \iiint_\Omega \vec{E}\cdot\vec{J}_c\, dV
\]

The **Poynting vector** \(\vec{\mathscr{P}} = \vec{E}\times\vec{H}\) is the electromagnetic power flux density [W/m²]. **Poynting's theorem** in words:

> Power flowing out through \(\Sigma\) = decrease in stored EM energy − Joule heating

```
        Poynting vector — direction of energy flow:

        RESISTOR:                          CAPACITOR (charging):

         I →                                 + plate  − plate
        ┌────────────────────┐               │+ + + + │− − − −│
        │E→ (along wire)     │               │  E→    │       │
        │ B: into page (top) │               │ ⊗ B (  │       │
        │ out of page (bot.) │               │circles)│       │
        └────────────────────┘

         P = E × H:                          P = E × H:
         points INWARD (−r direction)        points INWARD between plates
         energy flows FROM field INTO wire   EM energy is being STORED

        In both cases, energy flows into the device via the electromagnetic field,
        not along the current-carrying wires!
```

**Example — resistor**: cylindrical conductor, length \(\ell\), radius \(a\), current \(I\):
- \(E = \eta J_c\) (along axis)
- \(B(a) = \mu_0 J_c a/2\) (circumferential)
- \(\mathscr{P} = E \cdot B/\mu_0 = \eta J_c^2 a/2\) (radially inward)
- Flux: \(\Phi_\Sigma = -RI^2\) (confirms: power in = Joule heating \(RI^2\))

```
        Poynting vector for resistor (cross-section):

                   E →  (axial)
              ─────────────────
             │                 │
             │  ↓P  ↓P  ↓P   │  ← P = E × H points radially inward
             │                 │     (H circles around wire: ⊗ top, ⊙ bottom)
              ─────────────────
                  B ⊗ (into page, top half)

        Energy enters the resistor through its lateral surface,
        not through its end faces! This is Poynting's deep insight:
        energy travels through the electromagnetic field, guided by wires.
```

## Chapter 29: Magnetic Energy in Circuits — the RL Circuit

For an RL circuit with battery EMF \(\mathcal{E}_0\):

\[
\mathcal{E}_0 = R\iota + L\frac{d\iota}{dt} \implies \iota(t) = I_0\left(1 - e^{-t/\tau}\right), \quad \tau = \frac{L}{R}, \quad I_0 = \frac{\mathcal{E}_0}{R}
\]

For **two coupled circuits** carrying \(\iota_1\) and \(\iota_2\):

\[
U_m = \frac{1}{2}L_1\iota_1^2 + M\iota_1\iota_2 + \frac{1}{2}L_2\iota_2^2
\]

The cross term \(M\iota_1\iota_2\) can be positive or negative depending on relative orientation.

```
        RL transient — energy budget:

         Energy from battery: W_bat = ε₀·q (total charge delivered)
         Energy dissipated:   W_R = ½LI₀²  (equals energy stored in L)
         Energy stored in L:  U_m = ½LI₀²

         W_bat = W_R + U_m  (energy conservation)
         i.e., half of battery work → heat, half → magnetic field

         ε₀ → [R] → [L]       (at t→∞: dι/dt=0, all ε₀ across R → only Joule heating)
              [heat]  [field]
```

## Chapter 30: The LC Oscillating Circuit

An ideal **LC circuit** (no resistance) is the electromagnetic harmonic oscillator. Faraday-Neumann applied to the closed loop with capacitor voltage \(v_c\) and inductor flux \(\Phi_\gamma = L\iota\):

\[
v_c = -L\frac{d\iota}{dt}, \quad \iota = C\frac{dv_c}{dt} \implies v_c(t) = -LC\frac{d^2 v_c}{dt^2}
\]

**Harmonic oscillator equation**. With initial conditions \(v_c(0) = V_0\), \(\iota(0) = 0\):

\[
v_c(t) = V_0\cos(\omega t), \quad \iota(t) = -\omega CV_0\sin(\omega t), \quad \omega = \frac{1}{\sqrt{LC}}
\]

```
        LC oscillator — phase space diagram:

         ι ↑   (current)
           │     ●  (t=T/4: max current, zero voltage)
           │   ↗   ↘
           │ ↗       ↘
           ●           ●──→ v_c
      (t=T/2)         (t=0: max voltage V₀, zero current)
           │ ↖       ↗
           │   ↘   ↗
           │     ●  (t=3T/4)
           │
        Ellipse in (v_c, ι) plane — energy conserved:
        ½Cv_c² + ½Lι² = ½CV₀² = const  (circle when scaled)
```

```
        Energy oscillation in LC circuit:

         U ↑   ½CV₀²─────────────────────────
           │                  ╱╲      ╱╲
           │         ╱╲      ╱  ╲    ╱  ╲
           │        ╱  ╲    ╱    ╲  ╱    ╲   ← U_L = ½Lι²
           │       ╱    ╲  ╱      ╲╱      ╲
           │  ╲   ╱      ╲╱                  ← U_C = ½Cv_c²
           │   ╲ ╱
           └────────────────────────────→ t
                   T/2    T    3T/2    2T
         U_C + U_L = ½CV₀² = const  (no dissipation)
```

The period \(T = 2\pi\sqrt{LC}\) and resonant frequency \(\omega_0 = 1/\sqrt{LC}\). For superconducting qubits in quantum computers, \(L \sim 10\text{ nH}\) and \(C \sim 100\text{ fF}\) give \(\omega_0/(2\pi) \approx 5\text{ GHz}\) — in the microwave regime where quantum effects are accessible at millikelvin temperatures.

---

# Summary: Maxwell's Equations and the Structure of the Course

Every phenomenon in this course follows from four equations. In **differential form in vacuum**:

\[
\nabla\cdot\vec{E} = \frac{\rho}{\varepsilon_0}, \qquad \nabla\cdot\vec{B} = 0
\]

\[
\nabla\times\vec{E} = -\frac{\partial\vec{B}}{\partial t}, \qquad \nabla\times\vec{B} = \mu_0\vec{J} + \mu_0\varepsilon_0\frac{\partial\vec{E}}{\partial t}
\]

Together with the Lorentz force \(\vec{F} = q(\vec{E} + \vec{v}\times\vec{B})\), these are the complete classical theory of electromagnetism.

```
        The electromagnetic wave — Maxwell's great prediction:

         E ↑                             B ↑
           │  /‾\     /‾\                  │  /‾\     /‾\
           │ /   \   /   \                 │ /   \   /   \
           │/     \ /     \    →      →    │/     \ /     \
        ───┼────────────────── z   ──────┼────────────────── z
           │        \/                    │        \/

        E and B perpendicular to each other and to propagation.
        Speed c = 1/√(μ₀ε₀) = 299,792,458 m/s ← speed of light.
        "Therein lies the velocity of light." — Maxwell, 1865.
```

```
        Conceptual map of the course:

        ELECTROSTATICS             MAGNETOSTATICS
        ∇·E = ρ/ε₀                ∇·B = 0
        ∇×E = 0                   ∇×B = μ₀J
           │                         │
           │ Poisson: ∇²φ = -ρ/ε₀   │ Vector Poisson: ∇²A = -μ₀J
           │ Multipoles              │ Biot-Savart, inductance
           │ Conductors, images      │ Forces, energy
           │ Dielectrics (D,P)       │ Magnetic materials (H,M)
           │                         │
           └───────────┬─────────────┘
                       │ Maxwell's synthesis (+ displacement current)
                       ↓
        ELECTRODYNAMICS
        ∇×E = −∂B/∂t   (Faraday)
        ∇×B = μ₀J + μ₀ε₀∂E/∂t   (Ampère-Maxwell)
           │
           ├── Potentials (V, A), gauge freedom (Coulomb, Lorentz)
           ├── Wave equations → speed c = 1/√(μ₀ε₀) = speed of light
           ├── Poynting theorem → energy transport in fields
           └── LC circuit → electromagnetic resonance
```
