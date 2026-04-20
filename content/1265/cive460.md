---
title: "CIVE 460: Engineering Biomechanics"
subjects: "CIVE"
---

## Sources and References

**Primary texts** — Özkaya, N., Leger, D., Goldsheyder, D., and Nordin, M., *Fundamentals of Biomechanics*; Winter, D. A., *Biomechanics and Motor Control of Human Movement*.

**Supplementary texts** — Nordin, M. and Frankel, V. H., *Basic Biomechanics of the Musculoskeletal System*; Chaffin, D. B., Andersson, G. B. J., and Martin, B. J., *Occupational Biomechanics*; Fung, Y. C., *Biomechanics: Mechanical Properties of Living Tissues*.

**Online resources** — MIT OpenCourseWare HST.508 *Quantitative Genomics* and MIT 2.797 *Molecular, Cellular and Tissue Biomechanics*; Stanford *Mobility and Gait Analysis Lab* public tutorials; OpenSim project documentation and tutorials; ISB (International Society of Biomechanics) open recommendations on joint coordinate systems; PubMed Central open review articles on biotribology and gait.

---

# Chapter 1: Biological Form, Function, and Growth

Biological materials are not manufactured; they grow. Engineering biomechanics begins with the recognition that bones remodel in response to stress, muscles adapt to loading history, and cartilage and tendon stiffness depend on hydration and prior use. Any useful mechanical model of a living tissue is therefore a model of a dynamic, self-renewing structure.

## 1.1 Hierarchical Structure of Tissues

Bone, tendon, ligament, and cartilage share a hierarchical organization: collagen triple helices assemble into microfibrils, microfibrils into fibrils, fibrils into fibre bundles, and bundles into gross tissue. Mineralization with hydroxyapatite distinguishes bone from soft connective tissue. This hierarchy underlies the wide range of effective stiffness, from \(E \sim 10\ \text{MPa}\) for articular cartilage to \(E \sim 20\ \text{GPa}\) for cortical bone.

## 1.2 Wolff's Law and Adaptation

**Wolff's law** states that bone remodels in response to the loads it experiences. A mathematical expression of this idea is a rate equation for density \(\rho\):

\[
\frac{d\rho}{dt} = B\,(S - S_{\text{ref}})
\]

where \(S\) is a mechanical stimulus (often a strain energy density rate) and \(S_{\text{ref}}\) a homeostatic set point. Increases in loading drive bone formation; disuse drives resorption.

<div class="definition">
<strong>Functional adaptation.</strong> The process by which living tissues remodel their composition and geometry in response to the mechanical and chemical environment, seeking to minimize internal stress concentrations and maintain structural integrity.
</div>

# Chapter 2: Biomaterials

## 2.1 Mechanical Properties

Biological tissues are typically nonlinear, anisotropic, viscoelastic, and heterogeneous. A useful generalized constitutive relation is the quasi-linear viscoelastic (QLV) form introduced by Fung:

\[
\sigma(t) = \int_{-\infty}^{t} G(t-\tau)\,\frac{d\sigma^{(e)}[\varepsilon(\tau)]}{d\tau}\,d\tau
\]

where \(\sigma^{(e)}(\varepsilon)\) is the instantaneous elastic response and \(G(t)\) the reduced relaxation function. Tendon and ligament stress–strain curves exhibit a toe region (uncrimping of collagen), a linear region (collagen stretch), and a failure region.

## 2.2 Engineered Biomaterials

Implant materials include metals (titanium alloys, stainless steel), ceramics (alumina, zirconia, hydroxyapatite), and polymers (UHMWPE, PEEK, PMMA). Selection balances stiffness matching with bone to avoid **stress shielding**, corrosion and wear resistance, and biocompatibility. The elastic modulus of cortical bone (\(\sim 17\ \text{GPa}\)) is far lower than Ti-6Al-4V (\(\sim 110\ \text{GPa}\)), which motivates porous or lattice implants whose effective stiffness matches bone.

# Chapter 3: Kinematics and Neurology of Gait

## 3.1 Gait Cycle

The gait cycle is divided into stance (about 60%) and swing (about 40%). Stance contains heel strike, foot flat, mid-stance, heel off, and toe off; swing contains initial, mid, and terminal subphases. Ground reaction force during stance has a characteristic double-hump vertical trace, with peaks near heel strike and push-off each reaching roughly \(1.1\text{–}1.2\) times body weight at normal walking speed.

## 3.2 Inverse Dynamics

Inverse dynamics uses measured kinematics and ground reaction forces to compute joint moments. For a planar two-link limb, Newton–Euler recursion from the foot upwards gives the ankle moment

\[
M_{\text{ankle}} = I_{\text{foot}}\,\alpha_{\text{foot}} + m_{\text{foot}}\,\mathbf{r}_{\text{foot}}\times\mathbf{a}_{\text{foot}} - \mathbf{r}_{\text{GRF}}\times\mathbf{F}_{\text{GRF}}
\]

Iterating upwards yields knee and hip moments. These are the internal muscle torques that resist gravity and inertia.

## 3.3 Neural Control

Gait is coordinated by central pattern generators in the spinal cord, modulated by supraspinal input and peripheral feedback. Electromyography (EMG) shows characteristic on-off timing of hamstrings, quadriceps, gastrocnemius, and tibialis anterior across the cycle. Pathologies such as spastic diplegia or Parkinsonian gait disrupt this timing in diagnostic ways.

# Chapter 4: Joint Anatomy, Function, and Repair

## 4.1 Synovial Joints

A synovial joint consists of articular cartilage on bony ends, a synovial membrane and fluid, a capsule, and ligaments. Cartilage is a biphasic material: a solid collagen–proteoglycan matrix and an interstitial fluid. Under loading, fluid pressurization supports most of the load briefly, then consolidates over seconds to minutes following a confined-compression diffusion equation

\[
\frac{\partial u}{\partial t} = H_A k\,\frac{\partial^2 u}{\partial z^2}
\]

where \(H_A\) is the aggregate modulus, \(k\) the permeability, and \(u\) the axial displacement.

## 4.2 Biotribology

Articular cartilage achieves friction coefficients as low as 0.005 through mixed-mode lubrication: fluid-film lubrication under rapid loading, boundary lubrication via lubricin and hyaluronic acid under low speed, and weeping lubrication in which fluid is squeezed from cartilage under load. Prosthetic bearings — metal on UHMWPE, ceramic on ceramic — aim to mimic these regimes but produce wear debris implicated in osteolysis.

## 4.3 Repair and Replacement

Total joint arthroplasty for hip and knee is among the most successful orthopaedic interventions. Biomechanical design considerations include component alignment (abduction and anteversion of the acetabular cup), stem fixation (cemented versus cementless), and restoration of offset to preserve the abductor moment arm.

# Chapter 5: Occupational Biomechanics and Trauma Prevention

## 5.1 Low Back Loading

Lifting exposes the lumbar spine to compressive and shear loads. A simplified single-equivalent-muscle model estimates L5/S1 compression during a lift. If \(W\) is the load in hand at horizontal distance \(d_1\) from L5/S1, \(W_t\) is the upper-body weight at horizontal distance \(d_2\), and the erector spinae act at a short moment arm \(e \approx 0.05\ \text{m}\), moment equilibrium gives the muscle force

\[
F_m = \frac{W\,d_1 + W_t\,d_2}{e}
\]

and the compressive force on the disc is \(F_c \approx F_m + (W + W_t)\cos\theta\). Values exceeding roughly \(3.4\ \text{kN}\) are associated with increased risk of vertebral endplate damage (NIOSH action limit).

## 5.2 Manual Materials Handling

The NIOSH lifting equation gives a recommended weight limit

\[
\mathrm{RWL} = LC\cdot HM\cdot VM\cdot DM\cdot AM\cdot FM\cdot CM
\]

with a load constant \(LC = 23\ \text{kg}\) and multiplicative factors for horizontal, vertical, distance, asymmetry, frequency, and coupling conditions. The lifting index \(LI = L/\mathrm{RWL}\) quantifies risk.

## 5.3 Impact and Trauma

Head injury is characterized by the Head Injury Criterion

\[
\mathrm{HIC} = \max_{t_1,t_2}\left\{(t_2 - t_1)\left[\frac{1}{t_2 - t_1}\int_{t_1}^{t_2} a(t)\,dt\right]^{2.5}\right\}
\]

with \(\mathrm{HIC}_{15}\) thresholds used in automotive and helmet standards. Padding, crumple zones, and airbags reduce HIC by extending \(\Delta t\) and lowering peak acceleration.

# Chapter 6: Measurement and Modelling

## 6.1 Motion Capture and Force Measurement

Optoelectronic marker systems reconstruct three-dimensional trajectories at sub-millimetre accuracy. Force plates measure the three components of ground reaction force and the centre-of-pressure location. Data are filtered — typically with a fourth-order zero-phase Butterworth low-pass filter — before differentiation, because numerical differentiation amplifies high-frequency noise.

## 6.2 Musculoskeletal Models

Software such as OpenSim implements Hill-type muscle models with contractile, parallel elastic, and series elastic elements. The force–length–velocity relation

\[
F_m = F_{\max}\, a(t)\, f_L(\ell)\, f_V(\dot\ell)
\]

together with joint geometry, permits static optimization to solve the muscle-redundancy problem and infer individual muscle forces during tasks.

<div class="remark">
<strong>Validation.</strong> Every biomechanical model must be validated against independent measurements — instrumented implants, EMG activation timing, or imaging — before being used to drive design decisions for orthoses, prostheses, or ergonomic interventions.
</div>

The practice of engineering biomechanics combines continuum mechanics, dynamical systems, measurement science, and physiology. It is applied to injury prevention, rehabilitation, sports performance, prosthetic and orthotic design, and surgical planning, and it rests on the honest recognition that the living system is always adapting to the forces we apply to it.
