---
title: "CIVE 303: Structural Analysis"
prof: "Robert Gracie"
subjects: "CIVE"
---

## Sources and References

- Leet, Uang, Lanning, *Fundamentals of Structural Analysis*, 6th ed., McGraw-Hill.
- Hibbeler, *Structural Analysis*, 10th ed., Pearson.
- Kassimali, *Structural Analysis*, 6th ed., Cengage.
- Ghali, Neville, Brown, *Structural Analysis: A Unified Classical and Matrix Approach*, 7th ed., CRC Press.
- Fish, Belytschko, *A First Course in Finite Elements*, Wiley, 2007.
- McGuire, Gallagher, Ziemian, *Matrix Structural Analysis*, 2nd ed.
- MIT OpenCourseWare 1.571 Structural Analysis and Control; Stanford CEE 121 Structural Analysis; Cambridge Engineering Tripos Part IB Structural Mechanics.

# Chapter 1: Determinacy, Stability, and the Scope of Structural Analysis

Structural analysis investigates how load effects propagate through an assembly of members and connections and manifests as reactions, internal forces, stresses, and deformations. CIVE 303 narrows that investigation to skeletal structures such as beams, trusses, and frames, and develops systematic methods for structures whose reactions cannot be obtained from equilibrium alone. The work proceeds in four movements: a review of determinate behaviour and deflection theory, the flexibility (force) method for indeterminate structures, influence lines for moving loads, and the matrix stiffness method culminating in finite-element-style computation. Commercial software such as SAP 2000 provides a laboratory in which hand calculations and theoretical predictions can be compared against numerical output.

A planar skeletal structure is **statically determinate** when the number of independent equilibrium equations equals the number of unknown reaction and internal-force components. For a two-dimensional rigid frame with \(r\) support reactions, \(m\) members, \(j\) joints, and \(c\) internal condition releases, the degree of static indeterminacy is

\[
\mathrm{DSI} \;=\; (3m + r) - (3j + c).
\]

When \(\mathrm{DSI}=0\) and the geometric arrangement is non-critical, the structure is both determinate and stable. When \(\mathrm{DSI}>0\), additional compatibility or constitutive information is needed; when \(\mathrm{DSI}<0\), the structure is a mechanism. Geometric instability must be checked independently: parallel or concurrent reaction lines can leave a structure unstable even when counts match.

The distinction between determinate and indeterminate behaviour is not cosmetic. Indeterminate structures redistribute loads through stiffness: a stiffer redundant draws more force, and settlement, temperature change, fabrication error, and member shortening all induce self-equilibrated internal forces that a determinate counterpart would simply accommodate. This redistribution is both the central challenge and the central benefit of indeterminacy. Redundancy provides alternate load paths and moderates peak stresses, at the cost of sensitivity to imposed deformations.

# Chapter 2: Deflections of Beams and Frames

Before any indeterminate method can be written down, deflection of determinate members must be mastered, because compatibility equations in the force method are expressed in terms of displacements. The governing relation for elastic bending of a prismatic Euler–Bernoulli beam is

\[
EI\,\frac{d^{2}v}{dx^{2}} \;=\; M(x),
\]

from which double integration with boundary conditions produces slope \(v'(x)\) and deflection \(v(x)\). Axial shortening and shear deformation are usually neglected for slender beams and frames, which is a deliberate approximation appropriate to the geometry considered in CIVE 303.

The **moment-area theorems** reformulate double integration as geometric statements about the \(M/EI\) diagram. The first theorem equates the change in slope between two points on the elastic curve to the area of the \(M/EI\) diagram between those points; the second equates the tangential deviation of one point from a tangent drawn at another to the first moment of that area. For irregular moment diagrams the **conjugate beam method** is frequently more economical: a fictitious beam of the same length is loaded with the real beam's \(M/EI\) diagram, and the real slope and deflection appear as the conjugate shear and conjugate moment, with support conditions transformed so that zero real rotation maps to zero conjugate shear.

The most general and systematic of the classical tools is the **unit-load method**, a specialisation of the principle of virtual work. To compute a translation or rotation \(\Delta\) at a chosen point and direction on a structure loaded by a real system producing moments \(M(x)\), apply a dimensionless virtual unit force (or unit couple) at the point in that direction and compute the resulting virtual moment diagram \(m(x)\). Then

\[
1\cdot\Delta \;=\; \int \frac{M\,m}{EI}\,dx \;+\; \sum \frac{N\,n\,L}{AE} \;+\; \sum \frac{V\,v\,\kappa}{GA}\,dx.
\]

For flexure-dominated members only the first integral is retained. For trusses only the axial term survives, reducing to \(\Delta = \sum NnL/(AE)\). The unit-load method is indispensable because it yields any desired displacement component directly, accommodates arbitrary load combinations, and feeds cleanly into the force method that follows.

# Chapter 3: The Flexibility (Force) Method

The flexibility method — classically called the method of consistent deformations — resolves an indeterminate structure by temporarily removing redundants, analysing the resulting determinate **primary structure** under both the actual loads and unit values of each redundant, and enforcing the geometric condition that the true structure has no displacement inconsistency at the released points.

Suppose a structure has degree \(n\) of static indeterminacy. Select \(n\) redundant reaction or internal-force quantities \(X_{1},X_{2},\dots,X_{n}\) whose removal leaves a stable, determinate primary structure. Compute the displacements \(\delta_{i0}\) at the redundants' locations (and directions) due to the applied loads on the primary structure, and the flexibility coefficients \(\delta_{ij}\) equal to the displacement at point \(i\) due to a unit value of \(X_{j}\). Compatibility requires

\[
\delta_{i0} \;+\; \sum_{j=1}^{n}\delta_{ij}\,X_{j} \;=\; \Delta_{i},\qquad i=1,\dots,n,
\]

where \(\Delta_{i}\) is the prescribed displacement at the released degree of freedom (zero for an ordinary support, non-zero for support settlement). Writing this in matrix form,

\[
\left[\,\boldsymbol{\delta}\,\right]\left\{\mathbf{X}\right\} \;=\; \left\{\boldsymbol{\Delta}\right\} - \left\{\boldsymbol{\delta}_{0}\right\}.
\]

Maxwell's reciprocal theorem guarantees \(\delta_{ij}=\delta_{ji}\), so \(\boldsymbol{\delta}\) is symmetric. Each displacement is computed by the unit-load method on the primary structure. Once the redundants are solved, the full internal force state is obtained by superposition:

\[
M(x) \;=\; M_{0}(x) + \sum_{j} X_{j}\,m_{j}(x).
\]

The choice of primary structure is a matter of computational convenience rather than correctness. For a propped cantilever the roof reaction is a natural redundant; for a two-span continuous beam the intermediate support reaction or the interior bending moment are both workable, with the **three-moment equation** arising as the flexibility method applied to successive interior moments on a beam discretised into simply supported spans. Temperature change, fabrication errors, and support settlement are incorporated by supplementing \(\delta_{i0}\) with the corresponding non-mechanical contributions, so the method treats imposed deformations on equal footing with applied loads.

The flexibility method scales poorly with redundancy count because every additional redundant demands an additional full displacement computation on the primary structure. Its conceptual value, however, is durable: it exposes redistribution, makes load paths visible, and gives insight into how redundant selection shapes the conditioning of the problem.

# Chapter 4: Displacement Methods Preparing the Stiffness Formulation

The displacement (stiffness) approach inverts the unknowns. Instead of solving for redundant forces, it solves for the unknown joint displacements, writes member end forces as linear functions of those displacements through member stiffness relations, and enforces joint equilibrium. Two classical hand methods — the slope–deflection method and moment distribution — illustrate this thinking and bridge cleanly into the matrix stiffness method.

The **slope–deflection equation** for a prismatic beam segment of length \(L\), flexural rigidity \(EI\), with end rotations \(\theta_{n}\) and \(\theta_{f}\) at the near and far ends and relative transverse displacement \(\Delta\) (chord rotation \(\psi=\Delta/L\)), is

\[
M_{nf} \;=\; \frac{2EI}{L}\left(2\theta_{n} + \theta_{f} - 3\psi\right) + M^{\text{FEM}}_{nf},
\]

with \(M^{\text{FEM}}_{nf}\) the fixed-end moment from the applied span loading. Writing this expression at every member end and assembling joint equilibrium produces a linear system for the unknown joint rotations and sidesway displacements. Moment distribution, due to Hardy Cross, is an iterative relaxation of the same equilibrium equations: joints are locked, fixed-end moments are computed, and then joints are released one at a time, with the unbalanced moment distributed to framing members in proportion to their stiffness factors and carried over to the far ends. The iteration converges quickly for most frames because off-diagonal coupling in the equivalent stiffness matrix is weak.

Both methods are displacement methods. They treat joint rotations as primary unknowns, build stiffness relations from standard beam solutions, and impose equilibrium. The matrix stiffness method that follows is the same algorithm expressed in linear algebra, with a clean path to computer implementation and to finite elements.

# Chapter 5: Influence Lines for Determinate and Indeterminate Structures

A **bridge, crane rail, or floor system** sees loads whose position on the structure is not fixed. The classical tool for locating the worst placement is the influence line: a plot, as a function of load position \(x\), of the value of a single chosen response function (a reaction, a shear at a section, a bending moment at a section) caused by a unit moving load. Once the influence line is known, the maximum effect under a real moving load train is obtained by integrating the influence ordinate against the distributed load and summing the contributions of point loads placed at ordinate peaks.

For determinate structures, influence lines are piecewise linear and may be drawn directly from equilibrium. **Müller-Breslau's principle** provides a powerful geometric interpretation that extends to indeterminate structures: the influence line for a force quantity is, to a scale factor, the deflected shape produced by releasing the structure at that quantity's location and imposing a unit relative displacement (or rotation) in the quantity's direction. For a support reaction, release the support and push the released point upward by unity; the shape drawn by the rest of the structure, divided by the flexibility coefficient at the release, is the influence line. For indeterminate structures the deflected shape is smooth rather than piecewise linear, reflecting the stiffness-based redistribution of internal forces.

Computationally, influence ordinates for indeterminate structures may be produced by solving the flexibility or stiffness system at a series of load positions, or by using Müller-Breslau on the released structure. For continuous beams, a classical route is to compute the influence line for a chosen bending moment via the three-moment equation and then superpose. Envelopes of maximum positive and negative moments are then constructed by placing the live load only where the influence ordinate carries the desired sign, a technique of practical importance in bridge design under lane and truck loads.

# Chapter 6: The Matrix Stiffness Method

The matrix stiffness method is a systematic, computer-friendly implementation of the displacement approach. A structure is idealised as an assembly of line elements connected at joints (nodes). Each element contributes a small stiffness relation between its end forces and end displacements in a local coordinate frame. These local relations are transformed to a common global frame, assembled into a global stiffness matrix by summing contributions at shared nodes, and combined with loads and boundary conditions to form the equilibrium system

\[
\left[\mathbf{K}\right]\left\{\mathbf{d}\right\} \;=\; \left\{\mathbf{F}\right\}.
\]

For a prismatic two-dimensional beam element of length \(L\), axial rigidity \(EA\), and flexural rigidity \(EI\), the local stiffness matrix couples two axial displacements, two transverse displacements, and two end rotations, a \(6\times6\) symmetric matrix whose flexural block is the familiar

\[
\frac{EI}{L^{3}}\left[\begin{array}{cccc}
12 & 6L & -12 & 6L\\
6L & 4L^{2} & -6L & 2L^{2}\\
-12 & -6L & 12 & -6L\\
6L & 2L^{2} & -6L & 4L^{2}
\end{array}\right].
\]

The axial block is the standard \((EA/L)\) truss element. Transformation from local to global coordinates uses a rotation matrix \(\mathbf{T}\) built from direction cosines of the element axis, yielding \(\mathbf{k}^{\text{global}}=\mathbf{T}^{T}\mathbf{k}^{\text{local}}\mathbf{T}\). Element contributions are then scattered into the global matrix by the element connectivity, i.e., by adding each \(k_{ij}\) to the global row and column corresponding to the global degree of freedom of end \(i\) or \(j\).

Loads are assembled analogously. Distributed and span loads are converted to equivalent nodal loads via fixed-end forces with the sign convention reversed, so the equivalent nodal force represents what the element exerts back on the node. Support conditions are imposed by partitioning \(\mathbf{K}\) and \(\{\mathbf{F}\}\) into free and restrained degrees of freedom and solving only the free-free block,

\[
\left[\mathbf{K}_{ff}\right]\left\{\mathbf{d}_{f}\right\} \;=\; \left\{\mathbf{F}_{f}\right\} - \left[\mathbf{K}_{fr}\right]\left\{\mathbf{d}_{r}\right\}.
\]

Reactions on the supported degrees of freedom follow by back-substitution, and member end forces are recovered by applying each element's local stiffness to its computed end displacements, corrected for fixed-end forces. The method is exact within the beam-theory assumptions and is precisely the algorithm that commercial packages such as SAP 2000 execute on a much larger scale.

The practical significance of the matrix formulation is twofold. First, it unifies trusses, beams, and frames under a single notation and a single solution strategy. Second, it provides the natural stepping stone to the finite element method: the same scatter-and-solve logic, applied to higher-order elements built from shape functions and energy principles, yields solutions to plane stress, plate bending, and three-dimensional elasticity problems well beyond the scope of classical structural analysis. A principled implementation in MATLAB, with clearly separated routines for element stiffness, coordinate transformation, assembly, boundary condition application, and post-processing, produces a compact program that can analyse frames of arbitrary topology.

# Chapter 7: Connecting Theory, Software, and Engineering Judgement

A responsible analyst uses software as amplification of understanding rather than as a substitute for it. Hand methods and closed-form solutions for simple sub-assemblies remain the primary instrument for verifying commercial output: a portal frame under lateral load can be checked with portal or cantilever approximations; a continuous beam with the three-moment equation; a two-span symmetric frame with moment distribution. Order-of-magnitude deflection estimates from \(PL^{3}/(EI)\) scaling catch unit errors and mis-specified cross-sections before they propagate into drawings. Reviewing equilibrium of computed reactions against applied loads is a free and effective sanity check.

Modelling choices shape the quality of any analysis. Joint rigidity is idealised as fully fixed or perfectly pinned, yet real connections exhibit semi-rigid behaviour that can shift moment distributions noticeably. Axial and shear deformations, routinely neglected in slender members, become important in short stubby elements or in braced-frame diagonals. Second-order (\(P\)-\(\Delta\)) effects, ignored by the linear stiffness formulation developed here, are pertinent to slender columns and tall frames. Support conditions at foundations — pinned, fixed, or spring-supported — and the flexibility of diaphragms distributing lateral load to vertical elements both shape the outcomes of an analysis in ways the idealised model may misrepresent.

The arc of CIVE 303 is thus a progression from equilibrium of determinate members, through the geometry and energy of elastic deformation, into classical hand methods for indeterminacy, and finally into the matrix formulation that powers modern structural software. Each stage is mathematically self-consistent, and each is a tool whose appropriate use depends on the size and character of the problem. Fluency in all of them — from the back-of-envelope portal estimate to a full finite-element model — is the working vocabulary of structural engineering practice.
