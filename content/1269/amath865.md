---
title: "AMATH 865: Geophysical Fluid Dynamics"
subjects: "AMATH"
---

*These notes synthesize material from J. Pedlosky, Geophysical Fluid Dynamics (2nd ed., Springer); G.K. Vallis, Atmospheric and Oceanic Fluid Dynamics (2nd ed., Cambridge University Press); B. Cushman-Roisin and J.-M. Beckers, Introduction to Geophysical Fluid Dynamics (Academic Press); A.E. Gill, Atmosphere-Ocean Dynamics (Academic Press); and lecture notes from MIT OCW 12.800 (R. Ferrari, G. Flierl) and Cambridge DAMTP Fluid Dynamics of Climate.*

---

## Chapter 1: Equations of Motion on a Rotating Earth

The atmosphere and ocean are thin shells of fluid on a rapidly rotating, nearly spherical planet. Any serious study of large-scale geophysical flows must therefore begin with the Navier-Stokes equations written in a non-inertial reference frame attached to the rotating Earth. This chapter develops the fundamental governing equations, introduces the key approximations that make geophysical fluid dynamics tractable, and establishes the notation used throughout these notes.

### 1.1 Navier-Stokes Equations in a Rotating Frame

Consider a reference frame rotating with constant angular velocity \(\boldsymbol{\Omega}\) relative to an inertial frame. The velocity of a fluid parcel measured in the rotating frame is \(\mathbf{u}\). The momentum equation in the rotating frame takes the form

\[
\frac{D\mathbf{u}}{Dt} + 2\boldsymbol{\Omega} \times \mathbf{u} = -\frac{1}{\rho}\nabla p - \nabla\Phi + \nu\nabla^2\mathbf{u},
\]

where \(\frac{D}{Dt} = \frac{\partial}{\partial t} + \mathbf{u}\cdot\nabla\) is the material derivative, \(\rho\) is the fluid density, \(p\) is the pressure, \(\nu\) is the kinematic viscosity, and \(\Phi\) is the geopotential that absorbs both gravitational and centrifugal effects.

<div class="definition">
<strong>Definition 1.1 (Geopotential).</strong> The <em>geopotential</em> \(\Phi\) is defined by

\[
\Phi = \Phi_g - \frac{1}{2}|\boldsymbol{\Omega}\times\mathbf{r}|^2,
\]
where \(\Phi_g\) is the gravitational potential and \(\mathbf{r}\) is the position vector from the Earth's centre. Surfaces of constant \(\Phi\) define the local "horizontal," and \(-\nabla\Phi\) defines the effective gravity \(\mathbf{g}\).
</div>

The centrifugal acceleration \(-\boldsymbol{\Omega}\times(\boldsymbol{\Omega}\times\mathbf{r})\) is conservative and can be absorbed into the pressure gradient by redefining the geopotential, so it does not appear explicitly in the equations of motion. What remains is the Coriolis acceleration \(-2\boldsymbol{\Omega}\times\mathbf{u}\), which is the dominant rotational effect on large-scale flows.

<div class="remark">
<strong>Remark 1.1.</strong> The centrifugal distortion flattens the Earth slightly (oblateness \(\approx 1/300\)), causing geopotential surfaces to be oblate spheroids rather than spheres. In practice, this is absorbed into the coordinate system, and we treat geopotential surfaces as if they were spherical.
</div>

### 1.2 Coriolis and Centrifugal Forces

To develop physical intuition, it is helpful to decompose the non-inertial accelerations into their distinct roles. The centrifugal term modifies the shape of the geopotential (and hence our notion of "horizontal" and "vertical") but does not affect the dynamics of horizontal motion. The Coriolis term, by contrast, fundamentally alters the character of every horizontal flow on the rotating Earth.

The Coriolis acceleration \(-2\boldsymbol{\Omega}\times\mathbf{u}\) acts perpendicular to the velocity and therefore does no work. Nevertheless, it profoundly alters the character of fluid motion by imposing a tendency toward two-dimensionality along the rotation axis. On the Earth, with \(\boldsymbol{\Omega} = \Omega\hat{\mathbf{k}}_{\text{pole}}\) where \(\Omega = 7.292\times 10^{-5}\;\text{s}^{-1}\), the Coriolis acceleration in local Cartesian coordinates \((x, y, z)\) at latitude \(\phi\) has components

\[
-2\boldsymbol{\Omega}\times\mathbf{u} = \begin{pmatrix} 2\Omega v\sin\phi - 2\Omega w\cos\phi \\ -2\Omega u\sin\phi \\ 2\Omega u\cos\phi \end{pmatrix}.
\]

<div class="definition">
<strong>Definition 1.2 (Coriolis Parameter).</strong> The <em>Coriolis parameter</em> is defined as

\[
f = 2\Omega\sin\phi,
\]
where \(\phi\) is the latitude. At the poles \(f = \pm 2\Omega \approx \pm 1.46\times 10^{-4}\;\text{s}^{-1}\), and at the equator \(f = 0\).
</div>

For large-scale motions in which horizontal velocities greatly exceed vertical velocities, and horizontal scales greatly exceed the vertical scale, the terms involving \(\cos\phi\) are small compared to those involving \(\sin\phi\). This is the traditional approximation, and under it the horizontal Coriolis terms simplify to \(fv\) and \(-fu\) in the zonal and meridional momentum equations, respectively.

### 1.3 The f-Plane and Beta-Plane Approximations

When the horizontal scale \(L\) of a flow is small compared to the Earth's radius \(a \approx 6371\;\text{km}\), we may use a local tangent-plane approximation centred at latitude \(\phi_0\).

<div class="definition">
<strong>Definition 1.3 (f-Plane Approximation).</strong> On the <em>f-plane</em>, the Coriolis parameter is treated as a constant:

\[
f = f_0 = 2\Omega\sin\phi_0.
\]
This approximation neglects the meridional variation of \(f\) entirely.
</div>

The f-plane is adequate for studying phenomena whose meridional extent is much smaller than the scale over which \(f\) varies significantly, namely \(L \ll a\). However, many of the most important phenomena in geophysical fluid dynamics — Rossby waves, the westward intensification of ocean currents — depend essentially on the variation of \(f\) with latitude. This motivates the next level of approximation.

<div class="definition">
<strong>Definition 1.4 (Beta-Plane Approximation).</strong> On the <em>beta-plane</em>, the Coriolis parameter is linearised about a reference latitude:

\[
f = f_0 + \beta y, \quad \beta = \frac{df}{dy}\bigg|_{\phi_0} = \frac{2\Omega\cos\phi_0}{a},
\]
where \(y\) measures northward displacement from the reference latitude. At mid-latitudes (\(\phi_0 \approx 45°\)), \(\beta \approx 1.6\times 10^{-11}\;\text{m}^{-1}\,\text{s}^{-1}\).
</div>

The beta-plane captures the leading-order effect of the Earth's curvature on the dynamics and is the minimal framework in which Rossby waves and the Sverdrup balance emerge. We shall use it extensively in Chapters 4, 5, and 7.

### 1.4 The Boussinesq Approximation

In the ocean and in much of the atmosphere, density variations are small compared to a reference density \(\rho_0\). The Boussinesq approximation exploits this by retaining density variations only where they are multiplied by gravity (i.e., in the buoyancy term), while treating the fluid as incompressible otherwise.

<div class="definition">
<strong>Definition 1.5 (Boussinesq Approximation).</strong> Write \(\rho = \rho_0 + \rho'(x,y,z,t)\) with \(|\rho'| \ll \rho_0\). The <em>Boussinesq equations</em> are

\[
\frac{D\mathbf{u}}{Dt} + f\hat{\mathbf{z}}\times\mathbf{u} = -\frac{1}{\rho_0}\nabla p' + b\hat{\mathbf{z}} + \nu\nabla^2\mathbf{u},
\]

\[
\nabla\cdot\mathbf{u} = 0,
\]
where \(b = -g\rho'/\rho_0\) is the buoyancy and \(p'\) is the pressure perturbation from hydrostatic balance with the reference density.
</div>

The incompressibility condition \(\nabla\cdot\mathbf{u} = 0\) is a tremendous simplification: it filters out acoustic waves, which propagate far too fast to be relevant for weather and ocean dynamics. At the same time, the buoyancy term retains the essential coupling between density stratification and vertical motion.

<div class="example">
<strong>Example 1.1.</strong> In the ocean, a typical density anomaly is \(\rho' \sim 2\;\text{kg}\,\text{m}^{-3}\) on a background of \(\rho_0 \approx 1025\;\text{kg}\,\text{m}^{-3}\), so \(\rho'/\rho_0 \sim 0.002\). The Boussinesq approximation is thus extremely well justified. In the atmosphere, density varies by order unity over the full depth, but for motions confined to the troposphere (depth \(\sim 10\;\text{km}\)), density variations are \(\sim 30\%\) and the approximation is still useful, especially when combined with an anelastic or pseudo-incompressible formulation.
</div>

### 1.5 Buoyancy Frequency

The stability of a stratified fluid to vertical displacements is measured by the buoyancy frequency, which is the natural oscillation frequency of a displaced parcel in a stably stratified environment.

<div class="definition">
<strong>Definition 1.6 (Buoyancy Frequency).</strong> The <em>buoyancy frequency</em> (or Brunt-Vaisala frequency) is

\[
N^2 = \frac{\partial b}{\partial z} = -\frac{g}{\rho_0}\frac{\partial\rho}{\partial z},
\]
where the derivative is taken of the background (reference) density profile. The fluid is stably stratified when \(N^2 > 0\), neutrally stratified when \(N^2 = 0\), and unstably stratified (convectively unstable) when \(N^2 < 0\).
</div>

A fluid parcel displaced vertically by a small distance \(\delta z\) from its equilibrium level in a stably stratified fluid experiences a restoring buoyancy force \(-N^2\delta z\), leading to oscillations at frequency \(N\). Typical values are \(N \sim 10^{-2}\;\text{s}^{-1}\) in the ocean thermocline and \(N \sim 10^{-2}\;\text{s}^{-1}\) in the troposphere, corresponding to oscillation periods of order 10 minutes.

<div class="example">
<strong>Example 1.2.</strong> In the main oceanic thermocline, the temperature drops from roughly \(20°\text{C}\) at the surface to \(4°\text{C}\) at \(1000\;\text{m}\) depth. Using a thermal expansion coefficient \(\alpha \approx 2\times 10^{-4}\;\text{K}^{-1}\), the density gradient is \(\partial\rho/\partial z \approx -\rho_0\alpha\,\Delta T/\Delta z \approx -3.3\times 10^{-3}\;\text{kg}\,\text{m}^{-4}\), giving \(N^2 \approx 3.2\times 10^{-5}\;\text{s}^{-2}\) and \(N \approx 5.7\times 10^{-3}\;\text{s}^{-1}\), or a period of about 18 minutes.
</div>

### 1.6 Hydrostatic Balance

For motions whose horizontal scale \(L\) is much larger than their vertical scale \(H\), the vertical momentum equation simplifies dramatically. Scale analysis shows that the vertical acceleration \(Dw/Dt\) is smaller than the gravitational and pressure gradient terms by a factor of \((H/L)^2\), which for large-scale flows is typically \(10^{-4}\) or smaller.

<div class="definition">
<strong>Definition 1.7 (Hydrostatic Balance).</strong> The <em>hydrostatic balance</em> is

\[
\frac{\partial p}{\partial z} = -\rho g,
\]
or equivalently in the Boussinesq system,

\[
\frac{\partial p'}{\partial z} = \rho_0 b.
\]
</div>

Hydrostatic balance is not a separate physical law but a consequence of the extreme aspect ratio of large-scale geophysical flows. It is one of the most robust approximations in geophysical fluid dynamics and holds for essentially all motions with horizontal scales exceeding a few kilometres.

<div class="remark">
<strong>Remark 1.2.</strong> The hydrostatic approximation filters out vertically propagating acoustic waves and high-frequency internal gravity waves whose aspect ratios are of order unity. It does not filter the low-frequency internal gravity waves that are important for the ocean and atmosphere, as these have \(H/L \ll 1\) and remain hydrostatic.
</div>

The set of Boussinesq, hydrostatic equations on the beta-plane, together with the incompressibility condition and a thermodynamic equation for the evolution of buoyancy, forms the primitive equations — the starting point for most of large-scale geophysical fluid dynamics and the basis of modern weather and climate models.

<div class="definition">
<strong>Definition 1.8 (Primitive Equations).</strong> The <em>primitive equations</em> in the Boussinesq, hydrostatic approximation on the beta-plane are:

\[
\frac{Du}{Dt} - fv = -\frac{1}{\rho_0}\frac{\partial p'}{\partial x} + \mathcal{F}_x, \qquad \frac{Dv}{Dt} + fu = -\frac{1}{\rho_0}\frac{\partial p'}{\partial y} + \mathcal{F}_y,
\]

\[
\frac{\partial p'}{\partial z} = \rho_0 b, \qquad \frac{\partial u}{\partial x} + \frac{\partial v}{\partial y} + \frac{\partial w}{\partial z} = 0, \qquad \frac{Db}{Dt} + N^2 w = \mathcal{Q},
\]
where \(\mathcal{F}_x, \mathcal{F}_y\) represent frictional forces and \(\mathcal{Q}\) represents diabatic heating or diffusive buoyancy sources.
</div>

These five equations for five unknowns \((u, v, w, p', b)\) — supplemented by appropriate initial and boundary conditions — form a complete dynamical system. They are the equations solved (in various discretised forms) by operational weather prediction and climate models. All of the subsequent theory in these notes can be derived as approximations to the primitive equations in specific parameter regimes.

<div class="example">
<strong>Example 1.3.</strong> The aspect ratio \(H/L\) provides a useful organising parameter for different flow regimes. For synoptic-scale weather systems, \(H \sim 10\;\text{km}\) and \(L \sim 1000\;\text{km}\), giving \(H/L \sim 0.01\). For ocean mesoscale eddies, \(H \sim 1\;\text{km}\) and \(L \sim 100\;\text{km}\), giving a similar ratio. For deep convective clouds, \(H \sim L \sim 10\;\text{km}\), and the hydrostatic approximation breaks down. For tsunamis in the deep ocean, \(H \sim 4\;\text{km}\) and \(L \sim 200\;\text{km}\), so \(H/L \sim 0.02\) and the shallow water (hydrostatic) approximation is excellent.
</div>

---

## Chapter 2: Geostrophic Balance and Thermal Wind

The most striking feature of large-scale atmospheric and oceanic flow is its near-horizontal, nearly non-divergent character. Winds and currents are overwhelmingly in geostrophic balance: the pressure gradient force is almost exactly balanced by the Coriolis force. Understanding why this balance holds, and what it implies for the vertical structure of flow, is the central task of this chapter.

### 2.1 The Rossby Number

The relative importance of advective acceleration to the Coriolis acceleration is measured by a single dimensionless number.

<div class="definition">
<strong>Definition 2.1 (Rossby Number).</strong> The <em>Rossby number</em> is

\[
\text{Ro} = \frac{U}{fL},
\]
where \(U\) is a characteristic horizontal velocity and \(L\) is a characteristic horizontal length scale.
</div>

For mid-latitude synoptic-scale atmospheric motions (\(U \sim 10\;\text{m}\,\text{s}^{-1}\), \(L \sim 10^6\;\text{m}\), \(f \sim 10^{-4}\;\text{s}^{-1}\)), \(\text{Ro} \sim 0.1\). For the Gulf Stream (\(U \sim 1\;\text{m}\,\text{s}^{-1}\), \(L \sim 10^5\;\text{m}\)), \(\text{Ro} \sim 0.1\). The smallness of the Rossby number indicates that rotational effects dominate inertial effects at large scales, and motivates a perturbation expansion in powers of Ro.

### 2.2 Geostrophic Equations

Setting \(\text{Ro} = 0\) in the horizontal momentum equations — equivalently, neglecting the material derivative of horizontal velocity — yields the geostrophic balance.

<div class="definition">
<strong>Definition 2.2 (Geostrophic Balance).</strong> The <em>geostrophic equations</em> are

\[
fv_g = \frac{1}{\rho_0}\frac{\partial p}{\partial x}, \qquad fu_g = -\frac{1}{\rho_0}\frac{\partial p}{\partial y},
\]
or in vector form, \(f\hat{\mathbf{z}}\times\mathbf{u}_g = -\frac{1}{\rho_0}\nabla_H p\), where \(\nabla_H\) is the horizontal gradient. The <em>geostrophic velocity</em> \(\mathbf{u}_g = (u_g, v_g)\) is the leading-order horizontal velocity.
</div>

Geostrophic flow is parallel to isobars (lines of constant pressure), with low pressure to the left in the Northern Hemisphere. This is immediately recognisable on any weather map: winds circulate anticlockwise around low-pressure systems and clockwise around high-pressure systems (in the Northern Hemisphere), rather than flowing directly down the pressure gradient as one might naively expect.

<div class="example">
<strong>Example 2.1.</strong> A pressure gradient of \(\partial p/\partial x = 10^{-3}\;\text{Pa}\,\text{m}^{-1}\) at mid-latitudes (\(f = 10^{-4}\;\text{s}^{-1}\), \(\rho_0 = 1.2\;\text{kg}\,\text{m}^{-3}\)) gives a geostrophic wind \(v_g = \frac{1}{\rho_0 f}\frac{\partial p}{\partial x} \approx 8.3\;\text{m}\,\text{s}^{-1}\). This is a typical synoptic-scale wind speed, confirming the relevance of geostrophic balance.
</div>

It is worth pausing to appreciate the physical content of geostrophic balance. In everyday experience, objects accelerate in the direction of the net force acting on them. In a rotating frame, the Coriolis force acts perpendicular to the motion and is proportional to the speed. When a fluid parcel begins to move down the pressure gradient, the Coriolis force deflects it to the right (in the Northern Hemisphere). The parcel turns until it is moving perpendicular to the pressure gradient, at which point the Coriolis force exactly opposes the pressure gradient force and a steady state is reached. This equilibrium is geostrophic balance. The adjustment process by which this balance is established — geostrophic adjustment — is explored in detail in Chapter 3.

An important property of geostrophic flow is that it is non-divergent in two dimensions:

\[
\frac{\partial u_g}{\partial x} + \frac{\partial v_g}{\partial y} = 0,
\]

which follows directly from cross-differentiating the geostrophic relations (assuming \(f\) is constant). This permits the introduction of a geostrophic streamfunction \(\psi = p/(\rho_0 f)\) so that \(u_g = -\partial\psi/\partial y\) and \(v_g = \partial\psi/\partial x\).

### 2.3 Thermal Wind Relation

Combining geostrophic balance with hydrostatic balance produces a fundamental relationship between the vertical shear of the geostrophic wind and the horizontal density (or temperature) gradient.

<div class="theorem">
<strong>Theorem 2.1 (Thermal Wind Relation).</strong> Under geostrophic and hydrostatic balance in a Boussinesq fluid,

\[
f\frac{\partial u_g}{\partial z} = -\frac{\partial b}{\partial y}, \qquad f\frac{\partial v_g}{\partial z} = \frac{\partial b}{\partial x},
\]
or in vector form,

\[
f\frac{\partial\mathbf{u}_g}{\partial z} = \hat{\mathbf{z}}\times\nabla_H b.
\]
</div>

<div class="proof">
<strong>Proof.</strong> From the geostrophic relations, \(fu_g = -\frac{1}{\rho_0}\frac{\partial p'}{\partial y}\). Differentiating with respect to \(z\) gives \(f\frac{\partial u_g}{\partial z} = -\frac{1}{\rho_0}\frac{\partial^2 p'}{\partial y\partial z}\). From the hydrostatic relation \(\frac{\partial p'}{\partial z} = \rho_0 b\), we obtain \(\frac{\partial^2 p'}{\partial y\partial z} = \rho_0\frac{\partial b}{\partial y}\). Substituting yields \(f\frac{\partial u_g}{\partial z} = -\frac{\partial b}{\partial y}\). The relation for \(v_g\) follows analogously. \(\square\)
</div>

The thermal wind relation is one of the most powerful diagnostic tools in geophysical fluid dynamics. It tells us that horizontal density gradients imply vertical shear in the geostrophic flow, and conversely. The atmospheric jet stream, which strengthens with altitude in the upper troposphere, is a direct consequence of the equator-to-pole temperature gradient via the thermal wind relation.

<div class="example">
<strong>Example 2.2.</strong> The mid-latitude troposphere has a meridional temperature gradient of roughly \(\partial T/\partial y \approx -7\times 10^{-6}\;\text{K}\,\text{m}^{-1}\) (temperature decreasing poleward). With \(b = g\alpha_T T\) (where \(\alpha_T \approx 1/T_0 \approx 1/250\;\text{K}^{-1}\)), we get \(\partial b/\partial y \approx -2.7\times 10^{-7}\;\text{s}^{-2}\). Then \(\frac{\partial u_g}{\partial z} = -\frac{1}{f}\frac{\partial b}{\partial y} \approx 2.7\times 10^{-3}\;\text{s}^{-1}\). Over a tropospheric depth of \(10\;\text{km}\), this gives an increase in westerly wind of \(\sim 27\;\text{m}\,\text{s}^{-1}\), consistent with observed jet stream speeds.
</div>

### 2.4 The Taylor-Proudman Theorem

In the limit of rapid rotation (Ro \(\to 0\)) with a homogeneous (unstratified) fluid, the flow becomes independent of the coordinate parallel to the rotation axis.

<div class="theorem">
<strong>Theorem 2.2 (Taylor-Proudman Theorem).</strong> In a homogeneous, incompressible, inviscid fluid in geostrophic and hydrostatic balance,

\[
\frac{\partial\mathbf{u}}{\partial z} = 0 \quad \text{and} \quad \frac{\partial w}{\partial z} = 0.
\]
That is, the velocity field is independent of the coordinate along the rotation axis.
</div>

<div class="proof">
<strong>Proof.</strong> In a homogeneous fluid, \(b = 0\) everywhere. The thermal wind relation immediately gives \(\frac{\partial\mathbf{u}_g}{\partial z} = 0\). The incompressibility condition \(\nabla\cdot\mathbf{u} = 0\) then requires \(\frac{\partial w}{\partial z} = -\frac{\partial u}{\partial x} - \frac{\partial v}{\partial y}\), and since the right-hand side is independent of \(z\), so is \(w\). If \(w = 0\) on a boundary, then \(w = 0\) everywhere. \(\square\)
</div>

The Taylor-Proudman theorem explains the remarkable rigidity of rapidly rotating flows. In the classic Taylor column experiment, a slowly moving obstacle at the bottom of a rapidly rotating tank produces a stagnant column of fluid extending above it through the entire depth, as if the obstacle's influence were communicated instantaneously along the rotation axis. This profound constraint is broken in geophysical flows by stratification, which allows vertical shear through the thermal wind mechanism.

<div class="example">
<strong>Example 2.3.</strong> In G.I. Taylor's original 1923 experiment, a cylinder was slowly dragged along the bottom of a rapidly rotating tank of water. Dye injected above the cylinder revealed a stagnant column of fluid — a "Taylor column" — extending from the obstacle to the free surface. The flow divided around this column as if it were a solid body, even though no physical barrier existed above the bottom obstacle. This striking demonstration confirmed the two-dimensional tendency predicted by the theorem and remains one of the most celebrated experiments in fluid dynamics.
</div>

### 2.5 Geostrophic Degeneracy

Geostrophic balance, while providing the dominant balance in the momentum equations, does not by itself form a closed predictive system. The geostrophic velocity is determined diagnostically from the pressure field, but geostrophic balance alone does not tell us how the pressure field evolves. This is the problem of geostrophic degeneracy.

<div class="remark">
<strong>Remark 2.1.</strong> The geostrophic equations constitute a diagnostic (constraint) relationship, not a prognostic (evolution) equation. To predict how geostrophic flows evolve in time, one must go to the next order in the Rossby number expansion. This leads to the quasi-geostrophic theory developed in Chapter 5, in which the ageostrophic velocity and the vorticity equation together close the system.
</div>

The resolution of geostrophic degeneracy is one of the great achievements of geophysical fluid dynamics. The key insight, developed by Charney, Obukhov, and others in the late 1940s, is that the evolution of geostrophic flow is governed by conservation of potential vorticity — a single scalar equation that replaces the full set of primitive equations in the limit of small Rossby number.

<div class="definition">
<strong>Definition 2.3 (Ekman Number).</strong> The <em>Ekman number</em> measures the ratio of viscous forces to Coriolis forces:

\[
\text{Ek} = \frac{\nu}{fL^2},
\]
where \(\nu\) is the kinematic viscosity and \(L\) is a characteristic length scale. For large-scale flows, \(\text{Ek} \sim 10^{-15}\) using molecular viscosity, confirming that friction is negligible in the interior. Near boundaries, however, the effective length scale is the boundary layer depth, and the Ekman number becomes order unity, defining the Ekman boundary layer (Chapter 7).
</div>

Together, the Rossby number, the Ekman number, and the Burger number \(\text{Bu} = (L_R/L)^2\) form the fundamental triad of dimensionless parameters that organise the parameter space of geophysical fluid dynamics. Different regimes of these parameters correspond to qualitatively different dynamics, and the art of geophysical fluid dynamics lies in identifying which regime applies to a given phenomenon.

---

## Chapter 3: Shallow Water Theory

The shallow water equations describe the motion of a thin layer of homogeneous, incompressible fluid under gravity and rotation. Despite their simplicity, they capture many essential features of large-scale geophysical flows, including Rossby waves, geostrophic adjustment, and the interplay between rotation and gravity waves. The shallow water system serves as a conceptual laboratory for developing intuition before confronting the full complexity of continuously stratified fluids.

### 3.1 Shallow Water Equations Derivation

Consider a layer of fluid with a free surface at \(z = h(x,y,t)\) over a flat bottom at \(z = 0\). The fluid is homogeneous with constant density \(\rho_0\), and we assume hydrostatic balance in the vertical. Under these conditions, the pressure at any depth is \(p = \rho_0 g(h - z)\), and the horizontal pressure gradient is independent of depth: \(\nabla_H p = \rho_0 g\nabla_H h\).

<div class="definition">
<strong>Definition 3.1 (Shallow Water Equations).</strong> The <em>rotating shallow water equations</em> on the f-plane are

\[
\frac{\partial u}{\partial t} + u\frac{\partial u}{\partial x} + v\frac{\partial u}{\partial y} - fv = -g\frac{\partial h}{\partial x},
\]

\[
\frac{\partial v}{\partial t} + u\frac{\partial v}{\partial x} + v\frac{\partial v}{\partial y} + fu = -g\frac{\partial h}{\partial y},
\]

\[
\frac{\partial h}{\partial t} + \frac{\partial(hu)}{\partial x} + \frac{\partial(hv)}{\partial y} = 0.
\]
The first two are the momentum equations and the third is the continuity (mass conservation) equation.
</div>

The shallow water equations can be written more compactly in vector form as

\[
\frac{D\mathbf{u}}{Dt} + f\hat{\mathbf{z}}\times\mathbf{u} = -g\nabla_H h, \qquad \frac{Dh}{Dt} + h\nabla_H\cdot\mathbf{u} = 0.
\]

These equations constitute a closed system of three equations for three unknowns \((u, v, h)\) and are hyperbolic, admitting wave solutions.

### 3.2 Conservation Laws

The shallow water equations possess several important conservation laws. The energy (per unit area) is the sum of kinetic and potential contributions:

\[
E = \frac{1}{2}\rho_0 h|\mathbf{u}|^2 + \frac{1}{2}\rho_0 g h^2.
\]

<div class="theorem">
<strong>Theorem 3.1 (Energy Conservation).</strong> For the rotating shallow water equations with no forcing or dissipation,

\[
\frac{\partial E}{\partial t} + \nabla_H\cdot\left[\mathbf{u}\left(E + \frac{1}{2}\rho_0 g h^2\right)\right] = 0.
\]
In a closed or periodic domain, the total energy \(\iint E\,dx\,dy\) is conserved.
</div>

The momentum and mass conservation laws together imply an even more fundamental conservation law for the circulation. Kelvin's circulation theorem, adapted to the rotating frame, states that the absolute circulation \(\Gamma_a = \oint (\mathbf{u} + \boldsymbol{\Omega}\times\mathbf{r})\cdot d\mathbf{l}\) around a material circuit is conserved. When applied to the shallow water system, it leads directly to the conservation of potential vorticity.

Perhaps the most important conservation law in geophysical fluid dynamics is the conservation of potential vorticity, which is a material invariant of the shallow water equations.

### 3.3 Potential Vorticity and Kelvin's Theorem

<div class="definition">
<strong>Definition 3.2 (Shallow Water Potential Vorticity).</strong> The <em>potential vorticity</em> (PV) of the shallow water system is

\[
q = \frac{\zeta + f}{h},
\]
where \(\zeta = \frac{\partial v}{\partial x} - \frac{\partial u}{\partial y}\) is the relative vorticity.
</div>

The numerator \(\zeta + f\) is the absolute vorticity — the total vertical component of vorticity in an inertial frame. The denominator \(h\) represents the depth of the fluid column, which plays the role of an effective "vortex tube length." The conservation of PV can be understood as a consequence of Kelvin's circulation theorem applied to material fluid columns.

<div class="theorem">
<strong>Theorem 3.2 (Potential Vorticity Conservation, Rossby 1936).</strong> For inviscid, unforced shallow water flow (with \(f\) possibly varying with \(y\)),

\[
\frac{Dq}{Dt} = 0.
\]
Each fluid parcel preserves its potential vorticity as it moves.
</div>

<div class="proof">
<strong>Proof.</strong> Take the curl of the momentum equations to obtain the vorticity equation:

\[
\frac{D(\zeta + f)}{Dt} = -(\zeta + f)\nabla_H\cdot\mathbf{u}.
\]
The continuity equation gives \(\nabla_H\cdot\mathbf{u} = -\frac{1}{h}\frac{Dh}{Dt}\). Substituting:

\[
\frac{D(\zeta + f)}{Dt} = \frac{(\zeta + f)}{h}\frac{Dh}{Dt}.
\]
Dividing both sides by \(h\):

\[
\frac{1}{h}\frac{D(\zeta + f)}{Dt} - \frac{(\zeta + f)}{h^2}\frac{Dh}{Dt} = \frac{D}{Dt}\left(\frac{\zeta + f}{h}\right) = 0. \quad \square
\]
</div>

PV conservation is arguably the single most important result in geophysical fluid dynamics. It reduces the problem of predicting the evolution of a fluid from solving partial differential equations to tracking the rearrangement of a scalar field by the flow — a profound conceptual simplification.

<div class="example">
<strong>Example 3.1.</strong> Consider a fluid column of initial depth \(h_0\) at rest on the f-plane. Its PV is \(q_0 = f/h_0\). If this column is stretched to depth \(h_1 > h_0\) (for instance by convergent flow), conservation of PV requires \((\zeta + f)/h_1 = f/h_0\), giving \(\zeta = f(h_1/h_0 - 1) > 0\). The column acquires cyclonic (anticlockwise in the Northern Hemisphere) relative vorticity — the fluid equivalent of a spinning ice skater pulling in her arms.
</div>

### 3.4 Geostrophic Adjustment (Rossby Adjustment)

One of the most illuminating problems in rotating fluid dynamics asks: given an initial imbalance between the velocity and pressure fields, how does the fluid adjust to reach geostrophic balance?

<div class="example">
<strong>Example 3.2 (Rossby Adjustment Problem).</strong> Consider an infinite channel on the f-plane, initially at rest, with a step discontinuity in surface height:

\[
h(x, 0) = \begin{cases} H + \eta_0 & x < 0, \\ H - \eta_0 & x > 0, \end{cases} \quad u = v = 0.
\]
This state is not in geostrophic balance. The fluid adjusts by radiating inertia-gravity waves away from the discontinuity, leaving behind a geostrophically balanced jet flowing in the \(y\)-direction with a surface displacement that decays exponentially away from \(x = 0\) on the Rossby deformation radius scale.
</div>

<div class="definition">
<strong>Definition 3.3 (Rossby Deformation Radius).</strong> The <em>barotropic Rossby deformation radius</em> is

\[
L_R = \frac{\sqrt{gH}}{|f|} = \frac{c}{|f|},
\]
where \(c = \sqrt{gH}\) is the gravity wave speed. For the ocean (\(H \sim 4\;\text{km}\)), \(L_R \sim 2000\;\text{km}\). For the equivalent depth of the first baroclinic mode (\(c \sim 2\;\text{m}\,\text{s}^{-1}\)), \(L_R \sim 20\;\text{km}\) at mid-latitudes.
</div>

The Rossby deformation radius is the fundamental length scale of rotating, stratified fluid dynamics. It marks the transition between small scales where gravity waves dominate and large scales where rotational effects dominate. Features smaller than \(L_R\) adjust primarily through gravity waves; features larger than \(L_R\) adjust by modifying the velocity field while leaving the mass field nearly unchanged. The key insight of Rossby adjustment is that PV is conserved throughout the process — it is only the partitioning between velocity and height that changes.

The final state of the Rossby adjustment problem can be computed directly from PV conservation without solving the time-dependent equations. The initial PV is \(q = f/h(x, 0)\), and since PV is conserved by each parcel while waves are radiated away, the balanced final state must have this same PV distribution (in a Lagrangian sense). In the linear case, the final surface displacement decays exponentially as \(\eta \propto e^{-|x|/L_R}\), and the associated geostrophic jet has width \(\sim L_R\). The energy radiated away in the gravity waves equals the difference between the initial and final potential energies — this energy is irreversibly lost from the balanced flow.

### 3.5 Kelvin Waves

<div class="definition">
<strong>Definition 3.4 (Kelvin Wave).</strong> A <em>Kelvin wave</em> is a non-dispersive gravity wave that propagates along a lateral boundary (or the equator) with the boundary to its right in the Northern Hemisphere (to its left in the Southern Hemisphere). The cross-wave velocity component vanishes identically.
</div>

For a straight coastline along \(y\), with the ocean at \(x > 0\) and \(f > 0\), the Kelvin wave solution is

\[
v = 0, \quad u = u_0\,e^{-x/L_R}\cos(ky - \omega t), \quad \eta = \frac{f L_R}{g} u_0\,e^{-x/L_R}\cos(ky - \omega t),
\]

with dispersion relation \(\omega = -\sqrt{gH}\,k\) (propagation with the coast to the right, i.e., in the negative \(y\)-direction for \(k > 0\)). The decay scale \(L_R\) away from the boundary is precisely the Rossby deformation radius.

<div class="remark">
<strong>Remark 3.1.</strong> Kelvin waves are crucial for coastal oceanography and equatorial dynamics. Coastal Kelvin waves propagate storm surges and tidal signals along coastlines. Equatorial Kelvin waves (Chapter 8) are trapped to the equator rather than to a coast and play a key role in the dynamics of El Nino.
</div>

### 3.6 Poincare (Inertia-Gravity) Waves

Linearising the shallow water equations about a state of rest with uniform depth \(H\) on the f-plane yields the dispersion relation for small-amplitude waves.

<div class="theorem">
<strong>Theorem 3.3 (Poincare Wave Dispersion Relation).</strong> The dispersion relation for linear waves in the rotating shallow water system is

\[
\omega^2 = f^2 + gH(k^2 + l^2),
\]
where \((k, l)\) is the horizontal wavenumber vector. These are <em>Poincare waves</em> (also called inertia-gravity waves). The minimum frequency is \(|\omega| = |f|\), achieved in the limit of infinite wavelength.
</div>

At high frequencies (\(\omega \gg f\)), these waves behave like ordinary shallow water gravity waves with \(\omega \approx \sqrt{gH}\,|\mathbf{k}|\). At low frequencies, the Coriolis effect becomes important and the waves become more rotational in character, with particle orbits that are inertial circles modified by the restoring force of gravity.

<div class="example">
<strong>Example 3.3.</strong> For the barotropic mode in a \(4\;\text{km}\) deep ocean, \(c = \sqrt{gH} \approx 200\;\text{m}\,\text{s}^{-1}\). A Poincare wave with wavelength \(100\;\text{km}\) has \(|\mathbf{k}| \approx 6.3\times 10^{-5}\;\text{m}^{-1}\) and \(\omega = \sqrt{f^2 + c^2 k^2} \approx 0.013\;\text{s}^{-1}\), corresponding to a period of about 8 minutes. This is much shorter than the inertial period \(2\pi/f \approx 17\;\text{hours}\), confirming that these short barotropic waves are essentially gravity waves.
</div>

The separation of time scales between fast inertia-gravity waves and slow Rossby waves (Chapter 4) is a central feature of rotating dynamics and underlies the success of balanced models such as quasi-geostrophic theory.

<div class="remark">
<strong>Remark 3.2.</strong> The linearised shallow water equations on the f-plane admit three types of wave modes: two fast Poincare (inertia-gravity) modes with frequencies \(\omega \ge |f|\), and one slow geostrophic mode with \(\omega = 0\) (on the f-plane). When the beta-effect is included, the geostrophic mode acquires a small frequency and becomes the Rossby wave. The clean separation between \(O(f)\) fast waves and \(O(\beta L)\) slow waves is the foundation for filtering the fast waves from the dynamics, which is what the quasi-geostrophic approximation accomplishes.
</div>

<div class="example">
<strong>Example 3.4.</strong> The ratio of the Rossby wave frequency to the inertia-gravity wave frequency provides a measure of the time-scale separation. For a wave with wavenumber \(k \sim 1/L_R\), the Rossby wave frequency is \(\omega_R \sim \beta L_R\) and the Poincare wave frequency is \(\omega_{IG} \sim f\). Their ratio is \(\omega_R/\omega_{IG} \sim \beta L_R/f \sim \text{Ro}\), which is small by assumption. For mid-latitude oceanic mesoscale eddies (\(L_R \sim 50\;\text{km}\)), the Rossby wave period is months while the inertia-gravity wave period is hours — a separation of two to three orders of magnitude.
</div>

---

## Chapter 4: Rossby Waves

Rossby waves are the most important class of large-scale waves in the atmosphere and ocean. They owe their existence to the variation of the Coriolis parameter with latitude — the beta-effect — and propagate information about changes in vorticity across planetary scales. Their role in weather patterns, jet stream meanders, and ocean circulation is fundamental.

### 4.1 Beta-Effect and Planetary Vorticity Gradient

The essential ingredient for Rossby waves is the presence of a gradient in the background potential vorticity. On the beta-plane, the simplest such gradient is provided by the variation of \(f\) with latitude. In the shallow water system, the background PV gradient also has contributions from variations in the mean depth (topography), but the planetary beta-effect alone suffices to support Rossby waves.

Consider the linearised barotropic vorticity equation on the beta-plane. A fluid parcel displaced northward (where \(f\) is larger) must decrease its relative vorticity to conserve PV, and vice versa. This creates a vorticity anomaly pattern that propagates westward — the Rossby wave. The westward propagation can be understood heuristically: a northward-displaced parcel acquires anticyclonic (negative) relative vorticity, which induces a velocity field that pushes the fluid to its west northward and the fluid to its east southward, so the wave pattern migrates to the west.

Carl-Gustaf Rossby first identified these waves in the late 1930s, and his dispersion relation remains one of the most important results in atmospheric science. Rossby waves are responsible for the large-scale meanders of the jet stream, the propagation of weather disturbances, and the communication of climate signals across ocean basins.

<div class="definition">
<strong>Definition 4.1 (Absolute Vorticity Gradient).</strong> On the beta-plane, the meridional gradient of absolute vorticity for a zonal mean flow \(\bar{u}(y)\) is

\[
\bar{q}_y = \beta - \frac{\partial^2\bar{u}}{\partial y^2}.
\]
In the absence of a mean flow, this reduces to \(\beta\).
</div>

### 4.2 Barotropic Rossby Wave Dispersion Relation

We derive the Rossby wave dispersion relation from the linearised barotropic vorticity equation. Consider small perturbations to a state of rest on the beta-plane, with the streamfunction \(\psi' = \text{Re}[\hat{\psi}\,e^{i(kx + ly - \omega t)}]\).

<div class="theorem">
<strong>Theorem 4.1 (Barotropic Rossby Wave Dispersion Relation).</strong> The dispersion relation for barotropic Rossby waves on the beta-plane is

\[
\omega = -\frac{\beta k}{k^2 + l^2 + L_R^{-2}},
\]
where \(L_R\) is the Rossby deformation radius. In the purely barotropic limit (\(L_R \to \infty\)),

\[
\omega = -\frac{\beta k}{k^2 + l^2}.
\]
</div>

<div class="proof">
<strong>Proof.</strong> The linearised quasi-geostrophic potential vorticity equation about a state of rest is

\[
\frac{\partial}{\partial t}\left(\nabla^2\psi - L_R^{-2}\psi\right) + \beta\frac{\partial\psi}{\partial x} = 0.
\]
Substituting the plane wave ansatz \(\psi = \hat{\psi}\,e^{i(kx+ly-\omega t)}\), we obtain

\[
-i\omega\left(-(k^2+l^2) - L_R^{-2}\right)\hat{\psi} + i\beta k\hat{\psi} = 0.
\]
Since \(\hat{\psi} \neq 0\), solving for \(\omega\) gives the result. \(\square\)
</div>

Several properties of the Rossby wave dispersion relation deserve emphasis. First, \(\omega/k < 0\) always: Rossby waves have westward phase propagation, regardless of their orientation. This westward propagation is a universal feature tied to the northward increase of planetary vorticity. Second, the frequency is bounded: \(|\omega| \le \beta L_R/2\) for waves with the \(L_R^{-2}\) term included, so Rossby waves are intrinsically low-frequency phenomena. Third, in the long-wave limit (\(k^2 + l^2 \ll L_R^{-2}\)), the waves are non-dispersive with westward phase speed \(c_{px} \approx -\beta L_R^2\), while in the short-wave limit (\(k^2 + l^2 \gg L_R^{-2}\)), the dispersion relation reduces to that of the purely barotropic case.

The physical mechanism of Rossby wave propagation can be understood through PV conservation. Consider a chain of fluid parcels aligned in the east-west direction. If a parcel is displaced northward, it enters a region of higher planetary vorticity \(f\) and must acquire negative relative vorticity to conserve PV. This negative vorticity anomaly induces a southward velocity to its east and a northward velocity to its west. The northward velocity to the west displaces the next parcel northward, propagating the pattern westward. This vorticity-induction mechanism is the essence of the Rossby wave restoring force.

### 4.3 Phase and Group Velocity

<div class="definition">
<strong>Definition 4.2 (Phase and Group Velocity).</strong> The <em>zonal phase velocity</em> is

\[
c_{px} = \frac{\omega}{k} = -\frac{\beta}{k^2 + l^2 + L_R^{-2}} < 0.
\]
The <em>group velocity</em> components (for the barotropic case \(L_R^{-2} = 0\)) are

\[
c_{gx} = \frac{\partial\omega}{\partial k} = \frac{\beta(k^2 - l^2)}{(k^2 + l^2)^2}, \qquad c_{gy} = \frac{\partial\omega}{\partial l} = \frac{2\beta k l}{(k^2 + l^2)^2}.
\]
</div>

The phase velocity is always westward. However, the group velocity — and hence the energy propagation — can be eastward when \(k^2 > l^2\), i.e., when the zonal wavelength is shorter than the meridional wavelength. This distinction between westward phase propagation and potentially eastward energy propagation is crucial for understanding the downstream development of weather systems.

<div class="example">
<strong>Example 4.1.</strong> A Rossby wave with zonal wavelength \(6000\;\text{km}\) (\(k = 2\pi/6\times 10^6 \approx 10^{-6}\;\text{m}^{-1}\)) and \(l = 0\) on the beta-plane (\(\beta = 1.6\times 10^{-11}\;\text{m}^{-1}\,\text{s}^{-1}\)) has phase speed \(c_{px} = -\beta/k^2 \approx -16\;\text{m}\,\text{s}^{-1}\) and group velocity \(c_{gx} = +\beta/k^2 \approx +16\;\text{m}\,\text{s}^{-1}\). The phase propagates westward but the energy propagates eastward, both at \(16\;\text{m}\,\text{s}^{-1}\). These waves carry energy downstream (eastward) while their phase pattern drifts westward — a distinctive signature of Rossby wave dynamics.
</div>

### 4.4 Rossby Wave Propagation and Energy Flux

The propagation characteristics of Rossby waves are elegantly visualised using the Rossby wave dispersion surface in wavenumber space. The frequency contours in the \((k, l)\)-plane are circles centred at \((-\beta/(2\omega), 0)\) with radius \(\beta/(2|\omega|)\) — these are the Longuet-Higgins circles. The group velocity is perpendicular to these circles, pointing outward, which provides a geometric construction for determining the direction of energy propagation.

<div class="remark">
<strong>Remark 4.1.</strong> The energy flux for Rossby waves can be shown to be in the direction of the group velocity. For a wave packet centred on wavenumber \((k_0, l_0)\), the energy propagates at the group velocity \(\mathbf{c}_g = (c_{gx}, c_{gy})\), which in general differs in both magnitude and direction from the phase velocity. This is the standard result for dispersive waves.
</div>

### 4.5 Stationary Rossby Waves

When a mean zonal flow \(\bar{u}\) is present, the dispersion relation becomes

\[
\omega = \bar{u}\,k - \frac{\beta k}{k^2 + l^2 + L_R^{-2}}.
\]

A wave is stationary (\(\omega = 0\)) when the mean flow Doppler-shifts the intrinsic westward phase speed to zero.

<div class="theorem">
<strong>Theorem 4.2 (Stationary Rossby Wave Condition).</strong> Rossby waves are stationary relative to the ground when

\[
k^2 + l^2 = K_s^2 \equiv \frac{\beta}{\bar{u}} - L_R^{-2}.
\]
Stationary waves exist only for \(\bar{u} > 0\) (westerly mean flow) and \(\bar{u} < \beta L_R^2\). The quantity \(K_s\) is the <em>stationary wavenumber</em>.
</div>

Stationary Rossby waves are responsible for the large-scale standing wave patterns in the wintertime atmosphere (planetary waves) forced by orography and land-sea thermal contrasts. They are also central to the theory of atmospheric teleconnections, whereby forcing in one region (e.g., tropical heating) produces a stationary wave response that affects remote regions.

<div class="example">
<strong>Example 4.2.</strong> With \(\bar{u} = 15\;\text{m}\,\text{s}^{-1}\) and \(\beta = 1.6\times 10^{-11}\;\text{m}^{-1}\,\text{s}^{-1}\), the stationary wavenumber is \(K_s = \sqrt{\beta/\bar{u}} \approx 1.03\times 10^{-6}\;\text{m}^{-1}\), corresponding to a wavelength of \(2\pi/K_s \approx 6100\;\text{km}\), or roughly zonal wavenumber 4 to 5 at mid-latitudes. This matches the observed dominant planetary wave scales.
</div>

### 4.6 Topographic Rossby Waves

Rossby waves can also arise from gradients in the background PV due to variations in bottom topography, rather than the beta-effect. Consider the shallow water equations with a gently sloping bottom \(h_B(y)\) and total depth \(H - h_B(y)\).

<div class="definition">
<strong>Definition 4.3 (Topographic Rossby Waves).</strong> Over a bottom slope \(\partial h_B/\partial y \neq 0\), the background PV gradient is

\[
\frac{\partial\bar{q}}{\partial y} = \frac{\beta}{H} + \frac{f_0}{H^2}\frac{\partial h_B}{\partial y}.
\]
<em>Topographic Rossby waves</em> propagate with the shallow water to their right in the Northern Hemisphere (analogous to keeping high PV to the right). On a continental shelf with depth decreasing shoreward, they propagate with the coast to the right.
</div>

Topographic Rossby waves are important in the coastal ocean and over continental shelves, where bottom slopes are strong. They are also relevant to the ocean's deep western boundary currents and to the dynamics of seamounts and ridges.

<div class="example">
<strong>Example 4.3.</strong> On a continental shelf with slope \(\partial h_B/\partial y = -0.001\) (depth decreasing northward), mean depth \(H = 100\;\text{m}\), and \(f_0 = 10^{-4}\;\text{s}^{-1}\), the topographic contribution to the PV gradient is \(f_0 H^{-2}\partial h_B/\partial y = -10^{-8}\;\text{m}^{-1}\,\text{s}^{-1}\), which is roughly 1000 times larger than \(\beta/H \approx 1.6\times 10^{-13}\;\text{m}^{-1}\,\text{s}^{-1}\). Topographic beta completely dominates planetary beta in this regime, and topographic Rossby waves with periods of days are commonly observed on continental shelves.
</div>

---

## Chapter 5: Quasi-Geostrophic Theory

The quasi-geostrophic (QG) equations provide the leading-order dynamical theory for flows with small Rossby number. They resolve the geostrophic degeneracy identified in Chapter 2 by deriving a single evolution equation for the potential vorticity, from which the entire flow field can be reconstructed. QG theory is the intellectual foundation of dynamical meteorology and physical oceanography.

### 5.1 Scale Analysis and the QG Scaling

The development of quasi-geostrophic theory was a watershed moment in the history of geophysical fluid dynamics. Prior to the work of Charney (1948) and Obukhov (1949), it was not understood how to make quantitative predictions of the evolution of large-scale atmospheric flow. The primitive equations contain both slow, meteorologically significant motions (Rossby waves, baroclinic eddies) and fast, meteorologically insignificant motions (inertia-gravity waves, acoustic waves). The QG approximation filters the fast waves while retaining the slow dynamics, producing a system that is both physically transparent and computationally tractable.

We begin with a systematic scale analysis of the Boussinesq primitive equations on the beta-plane. The key assumptions are:

(i) The Rossby number is small: \(\text{Ro} = U/(f_0 L) \ll 1\).

(ii) The Burger number is order one: \(\text{Bu} = (NH)^2/(f_0 L)^2 = (L_R/L)^2 \sim O(1)\), where \(L_R = NH/f_0\) is the baroclinic deformation radius.

(iii) The beta-effect is of the same order as the advective terms: \(\beta L/f_0 \sim \text{Ro}\).

(iv) Time scales are advective: \(T \sim L/U\).

Under these scalings, the flow is nearly geostrophic at leading order, and the departure from geostrophy enters at order Ro.

<div class="definition">
<strong>Definition 5.1 (QG Scaling Regime).</strong> The <em>quasi-geostrophic scaling</em> is the asymptotic regime in which \(\text{Ro} \to 0\) and \(\text{Bu} = O(1)\). The flow is expanded as

\[
\mathbf{u} = \mathbf{u}_g + \text{Ro}\,\mathbf{u}_a + \cdots, \quad p = p_g + \text{Ro}\,p_a + \cdots,
\]
where subscripts \(g\) and \(a\) denote geostrophic and ageostrophic components respectively.
</div>

### 5.2 Quasi-Geostrophic Potential Vorticity Equation

The derivation proceeds by expanding the vorticity equation and using the thermodynamic equation to eliminate the ageostrophic vertical velocity. The result is a single evolution equation for the QG potential vorticity.

<div class="theorem">
<strong>Theorem 5.1 (QG Potential Vorticity Equation).</strong> In the quasi-geostrophic approximation, the flow evolution is governed by

\[
\frac{D_g q}{Dt} \equiv \left(\frac{\partial}{\partial t} + u_g\frac{\partial}{\partial x} + v_g\frac{\partial}{\partial y}\right)q = 0,
\]
where the QG potential vorticity is

\[
q = \nabla_H^2\psi + \frac{\partial}{\partial z}\left(\frac{f_0^2}{N^2}\frac{\partial\psi}{\partial z}\right) + \beta y,
\]
and \(\psi = p'/(f_0\rho_0)\) is the geostrophic streamfunction. The advection is by the geostrophic velocity \(\mathbf{u}_g = (-\partial\psi/\partial y, \partial\psi/\partial x)\) only.
</div>

<div class="proof">
<strong>Proof.</strong> Starting from the Boussinesq vorticity equation linearised about the beta-plane, the leading-order balance is geostrophic. At the next order in Ro, the vorticity equation becomes

\[
\frac{D_g\zeta_g}{Dt} + \beta v_g = f_0\frac{\partial w}{\partial z},
\]
where \(\zeta_g = \nabla_H^2\psi\) is the geostrophic relative vorticity and \(w\) is the ageostrophic vertical velocity. The thermodynamic equation at leading order is

\[
\frac{D_g b}{Dt} + N^2 w = 0,
\]
where \(b = f_0\frac{\partial\psi}{\partial z}\) from thermal wind and hydrostatic balance. Solving for \(w\) and substituting:

\[
f_0\frac{\partial w}{\partial z} = -f_0\frac{\partial}{\partial z}\left(\frac{1}{N^2}\frac{D_g b}{Dt}\right) = -\frac{D_g}{Dt}\frac{\partial}{\partial z}\left(\frac{f_0^2}{N^2}\frac{\partial\psi}{\partial z}\right).
\]
Combining with the vorticity equation gives \(\frac{D_g}{Dt}\left[\nabla_H^2\psi + \frac{\partial}{\partial z}\left(\frac{f_0^2}{N^2}\frac{\partial\psi}{\partial z}\right) + \beta y\right] = 0\). \(\square\)
</div>

The QG PV equation is a masterpiece of physical applied mathematics. It is a single equation in a single unknown (\(\psi\)), from which all components of the velocity and buoyancy fields can be diagnosed. The three-dimensional inversion problem — given \(q\), find \(\psi\) by solving

\[
\nabla_H^2\psi + \frac{\partial}{\partial z}\left(\frac{f_0^2}{N^2}\frac{\partial\psi}{\partial z}\right) = q - \beta y
\]

with appropriate boundary conditions — is an elliptic problem that is well-posed and efficiently solvable.

### 5.3 QG Shallow Water

In the shallow water context, the QG PV equation takes a particularly clean form. Linearising the shallow water PV about a rest state with depth \(H\):

<div class="definition">
<strong>Definition 5.2 (QG Shallow Water PV).</strong> The <em>QG potential vorticity in shallow water</em> is

\[
q = \nabla_H^2\psi - \frac{\psi}{L_R^2} + \beta y,
\]
where \(L_R = \sqrt{gH}/f_0\) is the deformation radius and \(\psi = g\eta/f_0\) with \(\eta\) the surface elevation perturbation. The term \(-\psi/L_R^2 = -f_0\eta/H\) represents the vortex stretching due to variations in fluid column depth.
</div>

This single equation encodes all the wave and vortex dynamics of the shallow water system at low Rossby number: Rossby waves (Chapter 4), geostrophic adjustment (with the adjustment happening at the deformation radius scale), and nonlinear vortex interactions.

### 5.4 Conservation of QG Potential Vorticity

The material conservation of QG PV implies a host of integral conservation laws that constrain the evolution of the flow.

<div class="theorem">
<strong>Theorem 5.2 (Casimir Conservation).</strong> For any function \(F(q)\), the integral

\[
\mathcal{C}[F] = \iint F(q)\,dx\,dy
\]
is conserved by the QG dynamics (in a periodic or unbounded domain). In particular, the total enstrophy \(\frac{1}{2}\iint q^2\,dx\,dy\) and the total energy \(\frac{1}{2}\iint\left[|\nabla_H\psi|^2 + \frac{f_0^2}{N^2}\left(\frac{\partial\psi}{\partial z}\right)^2\right]dx\,dy\,dz\) are conserved.
</div>

The simultaneous conservation of energy and enstrophy in two-dimensional and QG flows leads to the remarkable phenomenon of the dual cascade: energy cascades to larger scales while enstrophy cascades to smaller scales. This is the opposite of three-dimensional turbulence, where energy cascades to small scales, and it explains why large-scale coherent structures (cyclones, anticyclones, jets) spontaneously emerge in geophysical flows.

<div class="example">
<strong>Example 5.2.</strong> The dual cascade can be motivated by considering a simple triad interaction. Suppose energy is injected at some intermediate wavenumber \(k_f\). Conservation of energy and enstrophy requires that if energy moves to wavenumber \(k_1 < k_f\) (larger scale) and \(k_2 > k_f\) (smaller scale), then \(E_1 + E_2 = \Delta E\) and \(k_1^2 E_1 + k_2^2 E_2 = k_f^2\Delta E\). Solving these constraints shows that most of the energy goes to \(k_1\) (large scale) while most of the enstrophy (\(k^2 E\)) goes to \(k_2\) (small scale). This is the fundamental reason why two-dimensional and QG turbulence organises into large-scale coherent structures rather than dissipating at small scales as in three-dimensional turbulence.
</div>

### 5.5 QG as the Leading-Order Dynamics

<div class="remark">
<strong>Remark 5.1.</strong> The QG equations are formally valid only for \(\text{Ro} \ll 1\) and \(\text{Bu} \sim O(1)\). They fail near the equator (where \(f \to 0\) and Ro becomes large), in frontal regions (where horizontal gradients are large), in convective regions (where vertical velocities are large), and for phenomena such as tropical cyclones (where Ro \(\sim 1\)). Nevertheless, QG theory provides the correct qualitative picture for an enormous range of mid-latitude dynamical phenomena and remains the indispensable conceptual framework of the field.
</div>

<div class="example">
<strong>Example 5.1.</strong> Consider the QG PV equation in shallow water, linearised about a state of rest: \(\frac{\partial}{\partial t}\left(\nabla^2\psi - L_R^{-2}\psi\right) + \beta\frac{\partial\psi}{\partial x} = 0\). Substituting the plane wave ansatz \(\psi \propto e^{i(kx+ly-\omega t)}\) recovers the Rossby wave dispersion relation \(\omega = -\beta k/(k^2+l^2+L_R^{-2})\), confirming that the QG framework correctly captures Rossby wave dynamics.
</div>

---

## Chapter 6: Baroclinic and Barotropic Instability

The general circulation of the atmosphere and ocean is maintained against friction by the conversion of potential energy (ultimately derived from differential solar heating) into kinetic energy. Baroclinic instability is the primary mechanism by which this conversion occurs in mid-latitudes: it extracts energy from the available potential energy stored in the meridional temperature gradient (equivalently, the vertical shear of the mean wind via thermal wind) and converts it into the kinetic energy of synoptic-scale eddies — the weather systems of daily experience. Barotropic instability, by contrast, extracts energy from the horizontal shear of the mean flow.

### 6.1 Necessary Conditions for Instability

Before computing specific growth rates, we establish general conditions under which instability is possible. These are obtained from integral constraints on the perturbation energy.

<div class="theorem">
<strong>Theorem 6.1 (Charney-Stern Theorem, 1962).</strong> A necessary condition for instability of a zonal flow \(\bar{u}(y, z)\) in the QG framework is that the meridional gradient of QG potential vorticity,

\[
\bar{q}_y = \beta - \frac{\partial^2\bar{u}}{\partial y^2} - \frac{\partial}{\partial z}\left(\frac{f_0^2}{N^2}\frac{\partial\bar{u}}{\partial z}\right),
\]
must change sign somewhere in the interior of the domain, or the boundary temperature gradient must have the appropriate sign relative to the interior PV gradient. More precisely, instability requires that

\[
\iint \frac{\bar{q}_y\,|\hat{\psi}|^2}{\bar{u} - c}\,dy\,dz
\]
has a vanishing imaginary part, where \(c\) is the complex phase speed and \(\hat{\psi}\) is the perturbation streamfunction amplitude.
</div>

<div class="proof">
<strong>Proof.</strong> Linearise the QG PV equation about the zonal flow \(\bar{u}(y,z)\). For perturbations of the form \(\psi' = \text{Re}[\hat{\psi}(y,z)\,e^{ik(x - ct)}]\), we obtain the eigenvalue problem

\[
(\bar{u} - c)\left[\frac{\partial^2\hat{\psi}}{\partial y^2} - k^2\hat{\psi} + \frac{\partial}{\partial z}\left(\frac{f_0^2}{N^2}\frac{\partial\hat{\psi}}{\partial z}\right)\right] + \bar{q}_y\hat{\psi} = 0.
\]
Multiply by \(\hat{\psi}^*/(\bar{u} - c)\), integrate over the domain, and take the imaginary part. The imaginary part of \(c\) must satisfy

\[
c_i\iint\frac{\bar{q}_y\,|\hat{\psi}|^2}{|\bar{u} - c|^2}\,dy\,dz = 0.
\]
For \(c_i \neq 0\) (instability), the integral must vanish, which requires \(\bar{q}_y\) to change sign. When boundary contributions from thermal wind at upper and lower boundaries are included, the condition generalises to allow sign changes between interior PV gradients and boundary temperature gradients. \(\square\)
</div>

The Charney-Stern theorem is a necessary condition, not sufficient. Not every flow satisfying it is unstable. Nevertheless, it provides deep insight: baroclinic instability arises because the vertical shear of the mean wind, through the thermal wind relation, creates a reversal in the PV gradient between the interior and the boundaries.

<div class="remark">
<strong>Remark 6.1.</strong> The Charney-Stern theorem can be interpreted in terms of counter-propagating Rossby waves (CRW theory, Hoskins et al. 1985, Heifetz et al. 2004). Each sign change in the PV gradient supports a Rossby wave propagating along that gradient. When two such waves are close enough to interact and are phase-locked by the mean shear, they can mutually amplify each other, leading to exponential growth. This CRW perspective provides powerful physical intuition for understanding not only normal-mode instability but also non-modal growth and optimal perturbations.
</div>

### 6.2 Eady Model of Baroclinic Instability

The Eady (1949) model is the simplest analytically tractable model of baroclinic instability. It considers a uniformly sheared zonal flow with constant stratification and no interior PV gradient.

<div class="definition">
<strong>Definition 6.1 (Eady Model Setup).</strong> The <em>Eady model</em> consists of:
- A channel on the f-plane (\(\beta = 0\)) with rigid horizontal boundaries at \(z = 0\) and \(z = H\).
- A uniform zonal shear: \(\bar{u} = \Lambda z\), where \(\Lambda = U_0/H\) is the shear rate.
- Constant stratification \(N\).
- The interior QG PV gradient vanishes: \(\bar{q}_y = 0\).
</div>

Since \(\bar{q}_y = 0\) in the interior, the perturbation satisfies \((\nabla^2 + \frac{f_0^2}{N^2}\frac{\partial^2}{\partial z^2})\hat{\psi} = 0\) with boundary conditions from the linearised thermodynamic equation at \(z = 0\) and \(z = H\). Despite the absence of an interior PV gradient, instability arises because of the temperature gradients on the upper and lower boundaries, which act as "PV sheets."

<div class="theorem">
<strong>Theorem 6.2 (Eady Growth Rate).</strong> The Eady problem yields a dispersion relation whose most unstable mode has growth rate

\[
\sigma_{\max} = 0.3098\,\frac{f_0\Lambda}{N} = 0.3098\,\frac{f_0 U_0}{NH},
\]
achieved at a horizontal wavenumber \(k_{\max} \approx 1.61/L_R\), where \(L_R = NH/(f_0)\) is the Rossby deformation radius. The short-wave cutoff occurs at \(k_c = 2.399/L_R\).
</div>

<div class="example">
<strong>Example 6.1.</strong> For the mid-latitude troposphere: \(f_0 = 10^{-4}\;\text{s}^{-1}\), \(N = 10^{-2}\;\text{s}^{-1}\), \(H = 10\;\text{km}\), and \(\Lambda = 3\times 10^{-3}\;\text{s}^{-1}\) (corresponding to a jet speed difference of \(30\;\text{m}\,\text{s}^{-1}\) across the troposphere). Then \(L_R = NH/f_0 = 1000\;\text{km}\), the most unstable wavelength is \(2\pi/(1.61/L_R) \approx 3900\;\text{km}\), and the growth rate is \(\sigma_{\max} \approx 0.3098\times 10^{-4}\times 3\times 10^{-3}/10^{-2} \approx 9.3\times 10^{-6}\;\text{s}^{-1}\), corresponding to an e-folding time of about 1.2 days. These values match the observed scales and growth rates of mid-latitude cyclones remarkably well.
</div>

### 6.3 Phillips Two-Layer Model

The Phillips (1954) model discretises the vertical structure into two layers, making the mathematics algebraic rather than involving ODEs in the vertical.

<div class="definition">
<strong>Definition 6.2 (Phillips Two-Layer Model).</strong> The domain consists of two QG layers of equal depth \(H/2\), with streamfunctions \(\psi_1\) (upper) and \(\psi_2\) (lower). The mean flow is \(\bar{u}_1 = U_1\) and \(\bar{u}_2 = U_2\) (constants). The linearised QG PV equations for perturbations \(\psi_n' \propto e^{ik(x-ct)}\) are

\[
(U_1 - c)\left[-k^2\hat{\psi}_1 - \frac{1}{2}L_R^{-2}(\hat{\psi}_1 - \hat{\psi}_2)\right] + \left(\beta + \frac{1}{2}L_R^{-2}(U_1 - U_2)\right)\hat{\psi}_1 = 0,
\]

\[
(U_2 - c)\left[-k^2\hat{\psi}_2 + \frac{1}{2}L_R^{-2}(\hat{\psi}_1 - \hat{\psi}_2)\right] + \left(\beta - \frac{1}{2}L_R^{-2}(U_1 - U_2)\right)\hat{\psi}_2 = 0,
\]
where \(L_R^{-2} = f_0^2/(g'H/2)\) and \(g'\) is the reduced gravity between the layers.
</div>

This model admits both barotropic (in-phase) and baroclinic (out-of-phase) modes. The barotropic mode has \(\hat{\psi}_1 = \hat{\psi}_2\) (same sign streamfunction in both layers) and represents depth-independent motion. The baroclinic mode has \(\hat{\psi}_1 = -\hat{\psi}_2\) (opposite sign) and represents vertically sheared motion. The baroclinic mode becomes unstable when the vertical shear \(U_s = U_1 - U_2\) exceeds a critical value that depends on \(\beta\) and \(L_R\). The Phillips model elegantly demonstrates that baroclinic instability requires the interaction between PV gradients of opposite sign in the two layers: the upper-layer PV gradient is \(\beta + \frac{1}{2}L_R^{-2}U_s\) and the lower-layer gradient is \(\beta - \frac{1}{2}L_R^{-2}U_s\), so a sign reversal occurs when \(U_s > 2\beta L_R^2\).

<div class="theorem">
<strong>Theorem 6.3 (Phillips Model Instability Criterion).</strong> The baroclinic mode in the Phillips two-layer model is unstable when the shear satisfies

\[
U_s = U_1 - U_2 > \frac{2\beta L_R^2}{1} = \frac{\beta}{k_d^2/2},
\]
for some range of wavenumbers, where \(k_d = L_R^{-1}\). The most unstable wavenumber and growth rate depend on \(U_s/({\beta L_R^2})\).
</div>

### 6.4 Barotropic Instability

Barotropic instability extracts kinetic energy from the horizontal shear of the mean flow. The classical result is the Rayleigh-Kuo criterion, which generalises Rayleigh's inflection point theorem to the rotating case.

<div class="theorem">
<strong>Theorem 6.4 (Rayleigh-Kuo Criterion).</strong> A necessary condition for barotropic instability of a zonal flow \(\bar{u}(y)\) on the beta-plane is that

\[
\bar{q}_y = \beta - \frac{\partial^2\bar{u}}{\partial y^2}
\]
must change sign somewhere in the domain.
</div>

<div class="proof">
<strong>Proof.</strong> This is the barotropic (depth-independent) case of the Charney-Stern theorem. The linearised barotropic vorticity equation for perturbations \(\psi' = \text{Re}[\hat{\psi}(y)\,e^{ik(x-ct)}]\) is

\[
(\bar{u} - c)\left(\frac{d^2\hat{\psi}}{dy^2} - k^2\hat{\psi}\right) + \bar{q}_y\hat{\psi} = 0.
\]
Multiplying by \(\hat{\psi}^*/(\bar{u} - c)\), integrating over \(y\), and taking the imaginary part gives

\[
c_i\int\frac{\bar{q}_y\,|\hat{\psi}|^2}{|\bar{u} - c|^2}\,dy = 0.
\]
For \(c_i > 0\) (growing mode), the integral must vanish, requiring \(\bar{q}_y\) to change sign. \(\square\)
</div>

The Rayleigh-Kuo criterion shows that the planetary vorticity gradient \(\beta\) acts as a stabilising influence: a flow that would be barotropically unstable on the f-plane may be stabilised by the beta-effect if the curvature \(\partial^2\bar{u}/\partial y^2\) never exceeds \(\beta\). The tropical easterly jet and certain ocean currents are examples of flows subject to barotropic instability.

<div class="example">
<strong>Example 6.3.</strong> Consider the Bickley jet profile \(\bar{u}(y) = U_0\,\text{sech}^2(y/L)\). The curvature is \(\frac{\partial^2\bar{u}}{\partial y^2} = \frac{2U_0}{L^2}(3\,\text{tanh}^2(y/L) - 1)\,\text{sech}^2(y/L)\), which achieves its maximum value of \(2U_0/L^2\) at \(y = 0\). On the f-plane (\(\beta = 0\)), the PV gradient \(\bar{q}_y = -\partial^2\bar{u}/\partial y^2\) changes sign, and the jet is barotropically unstable. On the beta-plane, if \(\beta > 2U_0/L^2\), then \(\bar{q}_y > 0\) everywhere and the necessary condition for barotropic instability is not met. For a jet with \(U_0 = 20\;\text{m}\,\text{s}^{-1}\) and \(L = 500\;\text{km}\), the critical \(\beta\) is \(1.6\times 10^{-10}\;\text{m}^{-1}\,\text{s}^{-1}\), which is about ten times the Earth's value at mid-latitudes, so the jet is barotropically unstable despite the beta-effect.
</div>

### 6.5 Energetics: Available Potential Energy Conversion

The energetics of baroclinic and barotropic instability provide physical insight into the mechanisms at work.

<div class="definition">
<strong>Definition 6.3 (Energy Conversion Terms).</strong> In the QG framework, the eddy kinetic energy (EKE) and eddy available potential energy (EAPE) budgets involve the conversion terms:

\[
C_{BT} = -\overline{u'v'}\frac{\partial\bar{u}}{\partial y} \quad (\text{barotropic conversion: mean KE} \to \text{EKE}),
\]

\[
C_{BC} = -\frac{f_0^2}{N^2}\overline{v'\frac{\partial\psi'}{\partial z}}\frac{\partial\bar{u}}{\partial z} \quad (\text{baroclinic conversion: mean APE} \to \text{EAPE}).
\]
Positive values indicate energy transfer from the mean flow to the eddies.
</div>

In baroclinic instability, the dominant energy conversion is from mean available potential energy (stored in the meridional temperature gradient) to eddy APE and then to eddy KE. The net effect is to flatten isotherms (reduce the temperature gradient), which reduces the available potential energy and increases the kinetic energy of synoptic eddies. In barotropic instability, the conversion is directly from mean kinetic energy to eddy kinetic energy, and the mechanism involves the Reynolds stress \(\overline{u'v'}\) acting against the mean shear.

The concept of available potential energy (APE), introduced by Lorenz (1955), is central to this energetic picture. The total potential energy of the atmosphere is enormous, but most of it is unavailable for conversion to kinetic energy because it would require the fluid to rearrange itself into a state of lower potential energy. The APE is defined as the difference between the actual potential energy and the minimum potential energy achievable by adiabatic rearrangement. In the atmosphere, only about 0.5% of the total potential energy is available, and it is this small fraction that drives the general circulation.

<div class="example">
<strong>Example 6.2.</strong> In the Eady model, \(\bar{q}_y = 0\) in the interior, so \(C_{BT} = 0\) identically — there is no barotropic conversion. All energy comes from the baroclinic conversion \(C_{BC}\). The growing Eady mode has a westward phase tilt with height (warm air rising, cold air sinking in the wave), which gives a positive heat flux \(\overline{v'T'} > 0\) and drives the conversion of mean APE to EKE. This is the essence of the mid-latitude storm track: synoptic eddies transport heat poleward and upward, reducing the baroclinicity of the atmosphere.
</div>

---

## Chapter 7: Wind-Driven Ocean Circulation

The large-scale circulation of the upper ocean is primarily driven by the wind. The frictional stress exerted by the wind on the ocean surface drives currents in a thin boundary layer (the Ekman layer), and the divergence of this Ekman transport drives vertical motion (Ekman pumping), which in turn forces the interior flow through the vorticity equation. This chain of processes, combined with the beta-effect, explains the great oceanic gyres, the intensification of western boundary currents like the Gulf Stream, and the abyssal circulation.

### 7.1 Ekman Layer Theory

<div class="definition">
<strong>Definition 7.1 (Ekman Layer).</strong> The <em>Ekman layer</em> is the thin frictional boundary layer at the ocean surface (or bottom) in which the Coriolis force, pressure gradient, and turbulent stress are all important. Its characteristic depth scale is

\[
\delta_E = \sqrt{\frac{2\nu_e}{|f|}},
\]
where \(\nu_e\) is an eddy viscosity. For \(\nu_e \sim 10^{-2}\;\text{m}^2\,\text{s}^{-1}\) and \(f = 10^{-4}\;\text{s}^{-1}\), \(\delta_E \sim 14\;\text{m}\).
</div>

The steady-state momentum balance in the Ekman layer, with the pressure gradient assumed to be in geostrophic balance with the interior flow, is

\[
-fv_E = \nu_e\frac{\partial^2 u_E}{\partial z^2}, \qquad fu_E = \nu_e\frac{\partial^2 v_E}{\partial z^2},
\]

where \((u_E, v_E)\) is the ageostrophic Ekman velocity. With boundary conditions that the stress \(\rho_0\nu_e\partial\mathbf{u}/\partial z = \boldsymbol{\tau}\) at \(z = 0\) (the surface) and that \(\mathbf{u}_E \to 0\) as \(z \to -\infty\), the solution exhibits the celebrated Ekman spiral.

<div class="theorem">
<strong>Theorem 7.1 (Ekman Spiral).</strong> The Ekman velocity components for a surface wind stress in the \(x\)-direction, \(\boldsymbol{\tau} = \tau_0\hat{\mathbf{x}}\), with \(f > 0\), are

\[
u_E = V_0\,e^{z/\delta_E}\cos\left(\frac{z}{\delta_E} - \frac{\pi}{4}\right), \qquad v_E = V_0\,e^{z/\delta_E}\sin\left(\frac{z}{\delta_E} - \frac{\pi}{4}\right),
\]
where \(V_0 = \frac{\tau_0}{\rho_0 f\delta_E}\) and \(z \le 0\). The surface current is directed 45 degrees to the right of the wind (in the Northern Hemisphere), and the velocity vector rotates clockwise with depth while decaying exponentially.
</div>

<div class="example">
<strong>Example 7.1.</strong> A wind stress \(\tau_0 = 0.1\;\text{N}\,\text{m}^{-2}\) with \(\rho_0 = 1025\;\text{kg}\,\text{m}^{-3}\), \(f = 10^{-4}\;\text{s}^{-1}\), and \(\delta_E = 14\;\text{m}\) gives a surface Ekman velocity \(V_0 = 0.1/(1025\times 10^{-4}\times 14) \approx 0.07\;\text{m}\,\text{s}^{-1}\), or about \(7\;\text{cm}\,\text{s}^{-1}\). This is consistent with observed near-surface drift currents.
</div>

The vertically integrated Ekman transport is perhaps more important than the details of the spiral itself.

<div class="definition">
<strong>Definition 7.2 (Ekman Transport).</strong> The <em>Ekman transport</em> per unit length is

\[
\mathbf{M}_E = \int_{-\infty}^{0}\rho_0\mathbf{u}_E\,dz = \frac{\hat{\mathbf{z}}\times\boldsymbol{\tau}}{f}.
\]
The transport is exactly 90 degrees to the right of the wind stress in the Northern Hemisphere.
</div>

### 7.2 Ekman Pumping

The convergence or divergence of the Ekman transport drives vertical motion at the base of the Ekman layer, which is the crucial link between surface wind forcing and the interior ocean circulation.

<div class="definition">
<strong>Definition 7.3 (Ekman Pumping).</strong> The <em>Ekman pumping velocity</em> at the base of the surface Ekman layer is

\[
w_E = \frac{1}{\rho_0}\text{curl}\left(\frac{\boldsymbol{\tau}}{f}\right) = \frac{1}{\rho_0}\left[\frac{\partial}{\partial x}\left(\frac{\tau_y}{f}\right) - \frac{\partial}{\partial y}\left(\frac{\tau_x}{f}\right)\right].
\]
</div>

In the subtropical gyres, the wind stress curl is negative (in the Northern Hemisphere), producing Ekman convergence and downward Ekman pumping. This depresses the thermocline and drives the equatorward interior flow that is returned poleward in the western boundary current.

<div class="example">
<strong>Example 7.2.</strong> A sinusoidal zonal wind stress \(\tau_x = -\tau_0\cos(\pi y/L)\) with \(\tau_y = 0\) gives \(w_E = -\frac{\tau_0\pi}{\rho_0 f L}\sin(\pi y/L)\). At \(y = L/2\) (centre of the gyre), with \(\tau_0 = 0.1\;\text{N}\,\text{m}^{-2}\), \(L = 3000\;\text{km}\), \(f = 10^{-4}\;\text{s}^{-1}\), and \(\rho_0 = 1025\;\text{kg}\,\text{m}^{-3}\): \(w_E \approx -3.2\times 10^{-6}\;\text{m}\,\text{s}^{-1}\) or about \(-0.1\;\text{m}\,\text{day}^{-1}\). Though tiny, this persistent pumping over the basin drives the entire gyre circulation.
</div>

### 7.3 Sverdrup Balance

The Sverdrup balance relates the meridional transport of the interior ocean to the wind stress curl and is one of the most fundamental results in physical oceanography.

<div class="theorem">
<strong>Theorem 7.2 (Sverdrup Balance, 1947).</strong> In the interior of a wind-driven ocean basin, the vertically integrated meridional transport is given by

\[
\beta V = \frac{1}{\rho_0}\text{curl}\,\boldsymbol{\tau} = \frac{1}{\rho_0}\left(\frac{\partial\tau_y}{\partial x} - \frac{\partial\tau_x}{\partial y}\right),
\]
where \(V = \int_{-H}^{0}v\,dz\) is the total meridional transport per unit zonal distance.
</div>

<div class="proof">
<strong>Proof.</strong> In the steady-state vorticity equation, the leading-order balance for the interior (away from boundaries and the Ekman layer) is between the beta-effect and the vortex stretching driven by Ekman pumping:

\[
\beta v = f\frac{\partial w}{\partial z}.
\]
Integrating vertically from the bottom (\(w = 0\)) to the base of the Ekman layer (\(w = w_E\)):

\[
\beta V = fw_E = \frac{f}{\rho_0}\,\text{curl}\left(\frac{\boldsymbol{\tau}}{f}\right) \approx \frac{1}{\rho_0}\,\text{curl}\,\boldsymbol{\tau},
\]
where the last approximation holds when the length scale of the wind variation is much smaller than the scale over which \(f\) varies. \(\square\)
</div>

The Sverdrup relation is remarkable: the steady interior ocean flow is determined entirely by the local wind stress curl, regardless of the details of stratification, equation of state, or basin geometry (except through boundary conditions). In the subtropical North Atlantic, \(\text{curl}\,\boldsymbol{\tau} < 0\), giving \(V < 0\) (equatorward flow), consistent with the broad, slow equatorward drift observed in the ocean interior.

### 7.4 Western Boundary Currents

The Sverdrup interior flow is equatorward in the subtropical gyres, so to close the mass budget there must be a compensating poleward flow somewhere. The Sverdrup solution itself cannot satisfy the no-normal-flow condition at the western boundary, indicating the existence of a narrow, intense western boundary current.

<div class="definition">
<strong>Definition 7.4 (Stommel Model).</strong> The <em>Stommel model</em> (1948) adds bottom friction to the barotropic vorticity equation:

\[
\beta v = \frac{1}{\rho_0}\,\text{curl}\,\boldsymbol{\tau} - r\zeta,
\]
where \(r\) is a linear bottom drag coefficient. This yields a western boundary layer of width \(\delta_S = r/\beta\) in which the interior transport is returned poleward.
</div>

The key insight is that friction alone does not explain western intensification. It is the beta-effect — the increase of \(f\) with latitude — that breaks the east-west symmetry. In the Stommel model, a current flowing poleward along the western boundary generates negative (anticyclonic) relative vorticity through friction, which is compensated by the positive (cyclonic) vorticity tendency from the poleward advection of planetary vorticity (\(\beta v > 0\)). No such balance is possible at the eastern boundary, where poleward flow would enhance rather than reduce vorticity.

<div class="remark">
<strong>Remark 7.2.</strong> One way to understand western intensification is through vorticity balance. In the Sverdrup interior, the wind stress curl inputs negative vorticity (in the subtropical gyre). This vorticity must be dissipated somewhere for a steady state to exist. At the western boundary, the strong poleward flow has a large positive relative vorticity gradient, and friction (or lateral viscosity) can dissipate the vorticity input. The western boundary layer width adjusts so that the total frictional dissipation matches the wind-driven vorticity input. No corresponding mechanism operates at an eastern boundary, which is why the return flow must occur in the west.
</div>

<div class="definition">
<strong>Definition 7.5 (Munk Model).</strong> The <em>Munk model</em> (1950) replaces bottom friction with lateral viscosity:

\[
\beta v = \frac{1}{\rho_0}\,\text{curl}\,\boldsymbol{\tau} + A_H\nabla^4\psi,
\]
where \(A_H\) is a lateral eddy viscosity. The western boundary layer has width \(\delta_M = (A_H/\beta)^{1/3}\). For \(A_H \sim 10^4\;\text{m}^2\,\text{s}^{-1}\), \(\delta_M \approx 85\;\text{km}\).
</div>

<div class="example">
<strong>Example 7.3.</strong> The Gulf Stream has a transport of approximately 30 Sv (1 Sv = \(10^6\;\text{m}^3\,\text{s}^{-1}\)) near Florida, increasing to roughly 150 Sv downstream as it entrains recirculation water. The Sverdrup transport integrated across the North Atlantic basin (\(\sim 6000\;\text{km}\)) is approximately 30 Sv, in good agreement with the Florida Straits transport. The increase downstream is attributed to inertial recirculation, which is beyond the linear Stommel and Munk models. The Kuroshio in the Pacific is the analogous western boundary current, with comparable transport.
</div>

### 7.5 Abyssal Circulation

The deep ocean circulation, driven by deep water formation at high latitudes and mixing in the interior, was first modelled by Stommel and Arons (1960).

<div class="definition">
<strong>Definition 7.6 (Stommel-Arons Model).</strong> The <em>Stommel-Arons model</em> assumes a uniform upwelling \(w_0\) from the abyss into the upper ocean, balanced by localised deep water formation (sinking) at high latitudes. The abyssal flow satisfies the Sverdrup-like balance

\[
\beta v = f\frac{\partial w}{\partial z} \approx \frac{fw_0}{D},
\]
where \(D\) is the abyssal layer depth. Since \(fw_0/D > 0\), the interior abyssal flow is poleward in both hemispheres.
</div>

The counter-intuitive result of the Stommel-Arons model is that the interior abyssal flow is poleward (toward the sources of deep water), not equatorward (away from them). The newly formed deep water reaches the rest of the ocean via deep western boundary currents, which flow equatorward to supply the poleward interior flow. This prediction has been confirmed by observations of deep western boundary currents along the western margins of all ocean basins.

<div class="example">
<strong>Example 7.4.</strong> North Atlantic Deep Water (NADW) is formed in the Labrador Sea and the Nordic Seas at a rate of approximately 15 to 20 Sv. It sinks to depths of 2000 to 4000 m and flows equatorward in a deep western boundary current along the American continental margin, eventually reaching the Southern Ocean. The Stommel-Arons model predicts the existence and direction of this current. Observations from tracer distributions (chlorofluorocarbons, dissolved oxygen) confirm the equatorward transport along the western boundary and the slow poleward return flow in the interior.
</div>

<div class="remark">
<strong>Remark 7.1.</strong> The Stommel-Arons model is highly idealised: it assumes uniform upwelling, ignores topography, and parameterises mixing crudely. Modern understanding of the abyssal circulation emphasises the role of topographically enhanced mixing near mid-ocean ridges and the diapycnal transformation of water masses, but the basic dynamical picture of poleward interior flow and equatorward deep western boundary currents remains valid.
</div>

---

## Chapter 8: Equatorial Dynamics and Tropical Meteorology

The tropics present fundamentally different dynamical regimes from mid-latitudes. As the equator is approached, the Coriolis parameter \(f\) vanishes, the Rossby number becomes large, and the quasi-geostrophic framework breaks down. New classes of waves appear — equatorial Kelvin waves, mixed Rossby-gravity waves, and equatorial Rossby waves — that are trapped near the equator and play crucial roles in tropical weather and climate, including the Madden-Julian Oscillation, the Quasi-Biennial Oscillation, and the El Nino-Southern Oscillation.

### 8.1 Equatorial Beta-Plane

Near the equator, \(f \approx \beta_0 y\) where \(\beta_0 = 2\Omega/a \approx 2.3\times 10^{-11}\;\text{m}^{-1}\,\text{s}^{-1}\), and the beta-plane is centred at the equator itself.

<div class="definition">
<strong>Definition 8.1 (Equatorial Deformation Radius).</strong> The <em>equatorial Rossby radius of deformation</em> is

\[
L_{eq} = \left(\frac{c}{\beta_0}\right)^{1/2},
\]
where \(c\) is the gravity wave speed (either barotropic or for the relevant baroclinic mode). For the first baroclinic mode (\(c \approx 2.5\;\text{m}\,\text{s}^{-1}\)), \(L_{eq} \approx 330\;\text{km}\), or about 3 degrees of latitude.
</div>

The equatorial deformation radius sets the meridional trapping scale for equatorial waves. It is the equatorial analogue of the mid-latitude Rossby deformation radius but emerges from a different balance: rather than \(c/f\), it is \(\sqrt{c/\beta_0}\) because \(f\) is zero at the equator and must be replaced by the beta-effect.

The linearised shallow water equations on the equatorial beta-plane, with \(f = \beta_0 y\), are

\[
\frac{\partial u}{\partial t} - \beta_0 y v = -g\frac{\partial\eta}{\partial x}, \qquad \frac{\partial v}{\partial t} + \beta_0 y u = -g\frac{\partial\eta}{\partial y}, \qquad \frac{\partial\eta}{\partial t} + H\left(\frac{\partial u}{\partial x} + \frac{\partial v}{\partial y}\right) = 0.
\]

These can be combined into a single equation for \(v\), which has the form of a quantum harmonic oscillator in the meridional direction.

The structure of the equatorial wave equation is mathematically identical to the Schrodinger equation for the quantum harmonic oscillator. The eigensolutions are parabolic cylinder functions (Hermite functions), with meridional mode number \(n = 0, 1, 2, \ldots\) The dispersion relation for each mode is a cubic in \(\omega\), which yields three roots: two high-frequency inertia-gravity wave branches and one low-frequency Rossby wave branch (for \(n \ge 1\)).

### 8.2 Equatorial Kelvin Waves

<div class="definition">
<strong>Definition 8.2 (Equatorial Kelvin Wave).</strong> The <em>equatorial Kelvin wave</em> is a solution with \(v = 0\) identically, trapped to the equator with Gaussian meridional structure:

\[
u = u_0\,\exp\left(-\frac{\beta_0 y^2}{2c}\right)\cos(kx - \omega t), \qquad \eta = \frac{c}{g}u,
\]
with the dispersion relation \(\omega = ck\), where \(c = \sqrt{gH}\). The wave is non-dispersive and propagates eastward only.
</div>

The equatorial Kelvin wave is the equatorial analogue of the coastal Kelvin wave, with the equator playing the role of the boundary. The Gaussian trapping decays on the scale \(L_{eq}\), so the wave is effectively confined to a band of width \(\sim 2L_{eq}\) about the equator. Equatorial Kelvin waves play a central role in the dynamics of El Nino (propagating thermocline anomalies eastward across the Pacific) and in the stratospheric Quasi-Biennial Oscillation.

<div class="example">
<strong>Example 8.1.</strong> For the first baroclinic mode with \(c = 2.5\;\text{m}\,\text{s}^{-1}\), an equatorial Kelvin wave crosses the Pacific Ocean (width \(\sim 15{,}000\;\text{km}\)) in approximately \(15{,}000\times 10^3/2.5 \approx 6\times 10^6\;\text{s} \approx 70\;\text{days}\). This time scale is consistent with observations of subsurface temperature anomalies propagating eastward during El Nino events.
</div>

### 8.3 Mixed Rossby-Gravity (Yanai) Waves

<div class="definition">
<strong>Definition 8.3 (Yanai Wave).</strong> The <em>mixed Rossby-gravity wave</em> (or Yanai wave) corresponds to the \(n = 0\) meridional mode of the equatorial wave equation. Its dispersion relation is

\[
\omega = \frac{k c}{2}\left(1 + \sqrt{1 + \frac{4\beta_0}{k^2 c}}\right).
\]
For \(k > 0\) (eastward-propagating), it behaves like an inertia-gravity wave; for \(k < 0\) (westward), it resembles a Rossby wave. It has no zero-frequency point: \(\omega > 0\) for all \(k\).
</div>

The Yanai wave is a hybrid mode that connects the gravity wave and Rossby wave branches of the equatorial wave spectrum. Its meridional structure involves \(v\) proportional to a Gaussian (the zeroth Hermite function), and \(u\) and \(\eta\) proportional to the first Hermite function. Yanai waves are observed in the equatorial Pacific and are thought to play a role in the excitation of tropical instability waves.

<div class="remark">
<strong>Remark 8.1.</strong> The equatorial wave spectrum can be organised by the meridional mode number \(n\). For \(n \ge 1\), each mode gives rise to two inertia-gravity wave branches (eastward and westward) and one Rossby wave branch (westward only). The \(n = 0\) mode is the Yanai wave, and the \(n = -1\) mode (with \(v = 0\)) is the Kelvin wave. This classification, due to Matsuno (1966), is the cornerstone of equatorial wave theory.
</div>

### 8.4 Equatorial Rossby Waves

<div class="theorem">
<strong>Theorem 8.1 (Equatorial Rossby Wave Dispersion).</strong> For meridional mode number \(n \ge 1\), the equatorial Rossby wave dispersion relation in the long-wave limit (\(k^2 c/\beta_0 \ll 2n+1\)) is

\[
\omega \approx -\frac{\beta_0 k}{k^2 + (2n+1)\beta_0/c}.
\]
These waves propagate westward with phase speed \(c_{px} = -c/(2n+1)\) in the long-wave limit.
</div>

Equatorial Rossby waves are the low-frequency, long-wavelength part of each meridional mode. They propagate westward, with the \(n = 1\) mode travelling at one-third the Kelvin wave speed. Their role in the ocean's equatorial adjustment is complementary to that of the Kelvin wave: after a wind perturbation in the central Pacific, Kelvin waves carry the signal eastward and Rossby waves carry it westward, with the combined response determining the adjustment to a new equatorial thermocline state.

<div class="example">
<strong>Example 8.2.</strong> The \(n = 1\) equatorial Rossby wave with \(c = 2.5\;\text{m}\,\text{s}^{-1}\) has a long-wave phase speed of \(c/(2\times 1 + 1) = 2.5/3 \approx 0.83\;\text{m}\,\text{s}^{-1}\). Crossing the Pacific basin (width \(\sim 15{,}000\;\text{km}\)) takes approximately \(15{,}000\times 10^3/0.83 \approx 210\;\text{days}\). This is roughly three times the Kelvin wave crossing time, and the combined Kelvin-Rossby response sets the time scale for equatorial adjustment of about 6 to 9 months.
</div>

### 8.5 Matsuno-Gill Model

The Matsuno-Gill model describes the steady-state equatorial response to a localised heat source, providing the theoretical basis for understanding the Walker and Hadley circulations.

<div class="definition">
<strong>Definition 8.4 (Matsuno-Gill Model).</strong> The <em>Matsuno-Gill model</em> (Matsuno 1966, Gill 1980) solves the linearised equatorial shallow water equations with a prescribed mass sink \(Q(x, y)\) (representing diabatic heating) and linear Rayleigh damping \(\epsilon\):

\[
-\beta_0 yv + \epsilon u = -g\frac{\partial\eta}{\partial x}, \qquad \beta_0 yu + \epsilon v = -g\frac{\partial\eta}{\partial y}, \qquad \epsilon\eta + H\left(\frac{\partial u}{\partial x} + \frac{\partial v}{\partial y}\right) = -Q.
\]
</div>

For a symmetric heat source centred on the equator, the steady-state response consists of:

(i) An eastward-propagating Kelvin wave response to the east of the heating, characterised by easterly (westward) surface winds, equatorial convergence, and a low-pressure anomaly.

(ii) A westward-propagating Rossby wave response to the west of the heating, with a pair of off-equatorial cyclonic circulations (Rossby gyres) and westerly (eastward) surface winds on the equator.

<div class="example">
<strong>Example 8.3.</strong> The Matsuno-Gill model, when forced by a heat source representing the warm pool convection over the western Pacific, produces a pattern that closely resembles the observed Walker circulation: westerly surface winds to the west of the heating (over the Indian Ocean), easterly surface winds to the east (over the central and eastern Pacific), and low-level convergence at the heating source. The off-equatorial anticyclonic gyres in the Kelvin wave response and the cyclonic gyres in the Rossby wave response are also observed features of the tropical circulation.
</div>

### 8.6 Walker Circulation

The Walker circulation is the thermally direct, zonally overturning cell in the tropical Pacific, driven by the east-west gradient of sea surface temperature (SST). In the climatological mean state, the western Pacific warm pool (\(\text{SST} \sim 29°\text{C}\)) drives deep convection and ascending motion, while the eastern Pacific cold tongue (\(\text{SST} \sim 22°\text{C}\)) is associated with subsidence. The low-level easterlies (trade winds) and upper-level westerlies complete the cell.

The Matsuno-Gill model provides a dynamical framework for understanding the Walker circulation: the warm pool heating generates the Kelvin and Rossby wave responses described above, and the superposition of these responses produces the observed pattern of surface winds, pressure, and convergence/divergence. The zonal scale of the response is set by the ratio of wave speed to damping rate, \(c/\epsilon\), which for typical tropical values gives a response extending several thousand kilometres to the east and west of the heating.

<div class="example">
<strong>Example 8.6.</strong> In the atmosphere, taking \(c \approx 50\;\text{m}\,\text{s}^{-1}\) (for the dominant baroclinic mode) and a Rayleigh damping time scale of \(1/\epsilon \approx 5\;\text{days}\), the zonal decay scale of the Kelvin wave response is \(c/\epsilon \approx 50\times 5\times 86400 \approx 20{,}000\;\text{km}\), comparable to the circumference of the tropics. This means that tropical heating in the warm pool produces a response that extends globally, explaining why tropical convection has far-reaching effects on the atmospheric circulation.
</div>

<div class="remark">
<strong>Remark 8.2.</strong> The Walker circulation is part of a coupled ocean-atmosphere system. The trade winds drive equatorial upwelling and westward advection of cold water, maintaining the cold tongue that suppresses convection in the east. This positive feedback between the SST gradient and the wind is the foundation of the Bjerknes feedback, which is central to the dynamics of ENSO.
</div>

### 8.7 El Nino-Southern Oscillation

The El Nino-Southern Oscillation (ENSO) is the dominant mode of interannual climate variability, with global impacts on weather, agriculture, and ecosystems. A qualitative understanding of its dynamics draws together many of the concepts developed in this chapter.

<div class="definition">
<strong>Definition 8.5 (ENSO).</strong> <em>El Nino-Southern Oscillation (ENSO)</em> is a coupled ocean-atmosphere phenomenon centred in the tropical Pacific, characterised by:
- <em>El Nino</em>: anomalous warming of SST in the central and eastern equatorial Pacific, weakening of the trade winds, and deepening of the eastern Pacific thermocline.
- <em>La Nina</em>: anomalous cooling of SST in the central and eastern equatorial Pacific, strengthening of the trade winds, and shoaling of the eastern Pacific thermocline.
- <em>Southern Oscillation</em>: the atmospheric component, measured by the sea-level pressure difference between Tahiti and Darwin.
</div>

The essential dynamics of ENSO can be understood through the delayed oscillator mechanism (Suarez and Schopf, 1988; Battisti and Hirst, 1989). When westerly wind anomalies occur in the western-central Pacific, they excite a downwelling (deepened thermocline) equatorial Kelvin wave that propagates eastward, warming the eastern Pacific and reinforcing the initial wind anomaly (Bjerknes positive feedback). Simultaneously, upwelling (shoaled thermocline) Rossby waves propagate westward, reflect off the western boundary as an upwelling Kelvin wave, and eventually reach the eastern Pacific to terminate the warm event and initiate a cold (La Nina) phase.

<div class="example">
<strong>Example 8.4.</strong> The ENSO time scale can be estimated from the equatorial wave crossing times. A Kelvin wave crosses the Pacific in about 2 months, and the \(n = 1\) Rossby wave takes about 6 months to return west. After reflection, the return Kelvin wave takes another 2 months. The total round-trip time is roughly 10 months, but dissipation and the spatial structure of wind forcing extend the period to 2 to 7 years, with an average of about 4 years. This crude estimate captures the correct order of magnitude for the observed ENSO period.
</div>

<div class="remark">
<strong>Remark 8.3.</strong> The delayed oscillator is one of several theoretical frameworks for ENSO. Others include the recharge oscillator (Jin, 1997), which emphasises the role of equatorial heat content (warm water volume) rather than wave reflections, and the advective-reflective oscillator. All of these capture aspects of the observed ENSO behaviour, and the real system likely involves elements of each mechanism. The richness and complexity of ENSO dynamics remain active areas of research in tropical climate science.
</div>

### 8.8 Summary of Equatorial Wave Speeds

The following table summarises the key wave types and their properties for the first baroclinic mode (\(c \approx 2.5\;\text{m}\,\text{s}^{-1}\)) in the equatorial Pacific:

<div class="remark">
<strong>Remark 8.4.</strong> The equatorial Kelvin wave propagates eastward at speed \(c \approx 2.5\;\text{m}\,\text{s}^{-1}\) (Pacific crossing time \(\sim 70\) days). The \(n = 1\) equatorial Rossby wave propagates westward at \(c/3 \approx 0.83\;\text{m}\,\text{s}^{-1}\) (crossing time \(\sim 210\) days). These two wave types dominate the low-frequency equatorial adjustment and are the building blocks of ENSO theory. The Yanai wave has minimum group velocity of order \(c/2\), intermediate between the Kelvin and Rossby wave speeds. Higher meridional modes (\(n \ge 2\)) have progressively slower Rossby wave speeds (\(c/(2n+1)\)) and wider meridional structure (\(\sim\sqrt{n}\,L_{eq}\)).
</div>

<div class="example">
<strong>Example 8.5.</strong> The recharge oscillator model (Jin 1997) provides an alternative and complementary view of ENSO to the delayed oscillator. In this framework, the key variable is the equatorial warm water volume (thermocline depth averaged over the equatorial Pacific). During an El Nino, the eastward shift of warm water reduces the total equatorial heat content (the "discharge" phase). This discharged state preconditions the basin for La Nina by leaving a shallow thermocline. During La Nina, the westward shift of warm water refills the equatorial heat content (the "recharge" phase), preconditioning for the next El Nino. The oscillation period is set by the adjustment time of the equatorial ocean, which is governed by the Rossby wave transit time and the efficiency of western boundary reflection.
</div>

The equatorial wave theory developed in this chapter, combined with the understanding of geostrophic dynamics from earlier chapters, provides a unified framework for understanding the large-scale dynamics of the atmosphere and ocean across all latitudes — from the quasi-geostrophic mid-latitudes to the ageostrophic, wave-dominated tropics. The progression from the rotating Navier-Stokes equations through geostrophic balance, shallow water theory, Rossby waves, quasi-geostrophic theory, baroclinic instability, wind-driven circulation, and equatorial dynamics traces the logical development of the subject and reveals the deep connections between seemingly disparate phenomena — all unified by the interplay of rotation, stratification, and the conservation of potential vorticity.
