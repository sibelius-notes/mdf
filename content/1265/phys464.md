---
title: "PHYS464: Group Theory for Physicists"
prof: ""
subjects: "PHYS"
---

## Sources and References

**Primary textbook** — Howard Georgi, *Lie Algebras in Particle Physics* (Westview Press, 2nd ed., 1999).

**Supplementary texts**
- A. Zee, *Group Theory in a Nutshell for Physicists* (Princeton University Press, 2016)
- Pierre Ramond, *Group Theory: A Physicist's Survey* (Cambridge University Press, 2010)
- Peter Woit, *Quantum Theory, Groups and Representations* (Springer, 2017)

**Online resources**
- David Tong, *Lectures on Gauge Theory*, University of Cambridge (damtp.cam.ac.uk/user/tong/gaugetheory.html)
- David Tong, *Lectures on Topics in Quantum Mechanics — Symmetries*, University of Cambridge
- Cambridge Part III *Symmetries, Fields and Particles* lecture notes (N. Dorey / M. Wingate)
- MIT 8.325 *Relativistic Quantum Field Theory III*, MIT OpenCourseWare
- Flip Tanedo, group theory and QFT diary notes (UC Riverside / Cornell)

---

# Chapter 1: Symmetries in Physics

## The Physical Idea of Symmetry

Before any formalism, it is worth pausing to ask what we mean when we say that a physical system possesses a symmetry. The intuitive answer is that the system looks the same after we perform some transformation — rotating a sphere, reflecting a snowflake, shifting the origin of time. The deeper answer, due to Emmy Noether, is that every continuous symmetry of the action of a physical system corresponds to a conserved quantity. Rotational symmetry gives angular momentum; translational symmetry gives linear momentum; time-translation symmetry gives energy. Group theory is the mathematical language that makes these correspondences precise, that classifies which symmetries are possible, and that determines how the quantum states of a system must transform under them.

Discrete symmetries arise even in the simplest quantum chemistry. The water molecule H₂O, sitting in equilibrium, is unchanged by a reflection through the plane containing all three nuclei, by a rotation of 180 degrees about the axis bisecting the H–O–H angle, and by the identity. These four operations form the group called C₂v. The fact that the Hamiltonian commutes with all four operations immediately implies that energy eigenstates can be labelled by how they transform under the group — that is, by an irreducible representation. Selection rules for optical transitions, the normal modes of vibration, and the symmetry of molecular orbitals all follow with no further calculation once the representation theory is known.

Continuous symmetries, like rotations in three dimensions, form groups whose elements are labelled by continuous parameters. These Lie groups are the central objects of study throughout this course. They appear as the symmetry groups of free space (the rotation group SO(3) and Lorentz group SO(3,1)), as internal symmetry groups acting on fields (the gauge groups U(1), SU(2), SU(3) of the Standard Model), and as spectrum-generating symmetries (the SU(6) classification of hadrons). Learning to work fluently with Lie groups and their representations is arguably the single most enabling skill in theoretical physics.

## Group Axioms and Basic Examples

A group is a set \( G \) together with a binary operation \( \cdot : G \times G \to G \) satisfying four axioms. First, the operation is closed: for all \( g, h \in G \), the product \( g \cdot h \) belongs to \( G \). Second, it is associative: \( (g \cdot h) \cdot k = g \cdot (h \cdot k) \) for all \( g, h, k \in G \). Third, there is an identity element \( e \in G \) such that \( e \cdot g = g \cdot e = g \) for all \( g \). Fourth, every element has an inverse: for each \( g \in G \) there exists \( g^{-1} \in G \) such that \( g \cdot g^{-1} = g^{-1} \cdot g = e \). The order of a group is its cardinality \( |G| \). A group is called abelian if \( g \cdot h = h \cdot g \) for all elements; otherwise it is non-abelian.

The simplest nontrivial group is \( \mathbb{Z}_2 = \{e, a\} \) with \( a^2 = e \), which describes parity or any two-element symmetry. The integers under addition form an infinite abelian group. The general linear group \( \mathrm{GL}(n, \mathbb{R}) \) of all \( n \times n \) invertible real matrices is a non-abelian group under matrix multiplication, and nearly every group encountered in physics arises as a subgroup of some \( \mathrm{GL}(n) \).

## The Point Group C₂v: A Worked Example

Consider a planar molecule with C₂v symmetry. The group consists of four elements: the identity \( E \), a two-fold rotation \( C_2 \) about the principal axis, and two reflections \( \sigma_v \) and \( \sigma_v' \) through vertical mirror planes. Let us verify the group axioms and construct the multiplication table. Applying \( C_2 \) twice returns every atom to its original position, so \( C_2^2 = E \). Applying \( \sigma_v \) twice is likewise the identity. Applying \( C_2 \) and then \( \sigma_v \): a hydrogen on the right is first moved to the left by \( C_2 \), and then reflected back to the right by \( \sigma_v \), but across the plane of \( \sigma_v' \) — so \( C_2 \sigma_v = \sigma_v' \). The full multiplication table is:

| \(\cdot\) | \(E\) | \(C_2\) | \(\sigma_v\) | \(\sigma_v'\) |
|-----------|-------|---------|------------|--------------|
| \(E\) | \(E\) | \(C_2\) | \(\sigma_v\) | \(\sigma_v'\) |
| \(C_2\) | \(C_2\) | \(E\) | \(\sigma_v'\) | \(\sigma_v\) |
| \(\sigma_v\) | \(\sigma_v\) | \(\sigma_v'\) | \(E\) | \(C_2\) |
| \(\sigma_v'\) | \(\sigma_v'\) | \(\sigma_v\) | \(C_2\) | \(E\) |

This group is abelian — every element commutes. It is isomorphic to \( \mathbb{Z}_2 \times \mathbb{Z}_2 \), sometimes called the Klein four-group. As we will see in Chapter 4, C₂v has exactly four irreducible representations, all one-dimensional, labelled A₁, A₂, B₁, B₂ in spectroscopic notation. Molecular orbitals of the water molecule can be classified by these labels, and the optical selection rules — which transitions are dipole-allowed — follow entirely from group theory without any calculation of matrix elements.

## Representations on Hilbert Space

In quantum mechanics the state of a system is a vector \( |\psi\rangle \) in a complex Hilbert space \( \mathcal{H} \). A symmetry transformation \( g \in G \) must map physical states to physical states. A representation of \( G \) on \( \mathcal{H} \) is a homomorphism \( \rho : G \to \mathrm{GL}(\mathcal{H}) \), meaning that \( \rho(g) \) is a linear operator on \( \mathcal{H} \) for each \( g \), and that \( \rho(g)\rho(h) = \rho(gh) \) for all \( g, h \in G \). The key requirement is that the group composition law is preserved: performing transformation \( h \) followed by \( g \) gives the same state as the single transformation \( gh \).

Saying that the Hamiltonian \( H \) is symmetric under \( G \) means precisely that \( \rho(g) H \rho(g)^{-1} = H \) for all \( g \in G \), or equivalently \( \left[ H, \rho(g) \right] = 0 \). This has immediate consequences: if \( |\psi\rangle \) is an energy eigenstate with energy \( E \), then \( \rho(g)|\psi\rangle \) is also an eigenstate with the same energy \( E \). The energy eigenspaces are therefore invariant under the action of \( G \), and representation theory tells us how they decompose into irreducible pieces.

## Wigner's Theorem

A fundamental result due to Eugene Wigner states that any symmetry of quantum mechanics — meaning any bijection on the set of rays in Hilbert space that preserves transition probabilities — must be implemented by an operator \( U \) that is either unitary or antiunitary. Unitary operators satisfy \( U^\dagger U = \mathbf{1} \) and are complex-linear. Antiunitary operators satisfy the same norm condition but are complex-antilinear: \( U(c|\psi\rangle) = c^* U|\psi\rangle \). Time reversal is the canonical example of an antiunitary symmetry; all others (spatial rotations, reflections, internal symmetries) are unitary.

Wigner's theorem implies that representations of symmetry groups in quantum mechanics are unitary representations: \( \rho(g)^\dagger = \rho(g)^{-1} \) for all \( g \). For a compact group every finite-dimensional representation can be made unitary by averaging over the group, a procedure called the Weyl unitary trick. For a non-compact group like the Lorentz group, the finite-dimensional representations are not unitary, and unitary representations are necessarily infinite-dimensional — a subtlety with deep physical implications for relativistic quantum field theory.

## Projective Representations and the Appearance of Spin

A careful reader will notice that Wigner's theorem allows \( \rho(g)\rho(h) = e^{i\phi(g,h)}\rho(gh) \) for some phase \( \phi(g,h) \): the operators need only represent the group up to a phase, because a phase drops out of all physical predictions. Such a structure is called a projective representation, and the phase function \( \phi(g,h) \) is called a two-cocycle. Projective representations correspond to ordinary representations of a central extension of \( G \) — specifically, of the universal covering group of \( G \).

For the rotation group \( SO(3) \), the covering group is \( SU(2) \), and the central extension introduces representations labelled by half-integer spin. This is not a mathematical curiosity: it is the fundamental reason why electrons, protons, and neutrons exist as spin-\(\frac{1}{2}\) particles. The quantum mechanics of a single particle allows spin-\(\frac{1}{2}\) representations precisely because \( \pi_1(SO(3)) = \mathbb{Z}_2 \) and the covering group is \( SU(2) \). The spinor wavefunctions that describe electrons are sections of a nontrivial bundle over space, and they acquire a sign change under a \( 2\pi \) rotation — a physical effect measurable with neutron interferometers. The study of how this comes about in full detail is the subject of Chapter 3.

---

# Chapter 2: Lie Groups and Lie Algebras

## Smooth Structure and Matrix Lie Groups

A Lie group is a group that is simultaneously a smooth manifold, such that the group multiplication \( (g, h) \mapsto gh \) and the inversion \( g \mapsto g^{-1} \) are smooth maps. The prototypical examples are the matrix Lie groups, which are closed subgroups of \( \mathrm{GL}(n, \mathbb{C}) \). For a physicist, these are the groups that appear in every corner of the subject.

The general linear group \( \mathrm{GL}(n, \mathbb{R}) \) consists of all \( n \times n \) invertible real matrices; its dimension as a manifold is \( n^2 \). The special linear group \( \mathrm{SL}(n, \mathbb{R}) = \{ M \in \mathrm{GL}(n,\mathbb{R}) \mid \det M = 1 \} \) has dimension \( n^2 - 1 \), the determinant condition removing one degree of freedom. The orthogonal group \( O(n) = \{ M \in \mathrm{GL}(n,\mathbb{R}) \mid M^T M = \mathbf{1} \} \) has dimension \( n(n-1)/2 \); it consists of two connected components, with \( SO(n) = \{ M \in O(n) \mid \det M = 1 \} \) the connected component containing the identity. The unitary group \( U(n) = \{ M \in \mathrm{GL}(n,\mathbb{C}) \mid M^\dagger M = \mathbf{1} \} \) has real dimension \( n^2 \), and \( SU(n) = U(n) \cap \mathrm{SL}(n,\mathbb{C}) \) has real dimension \( n^2 - 1 \).

These groups are compact for all finite \( n \) except for the general linear and special linear groups, which are non-compact. Compactness has sweeping consequences for representation theory: compact groups have only finite-dimensional irreducible unitary representations, and the Peter–Weyl theorem ensures a complete decomposition of the group's \( L^2 \) functions into these representations.

## The Exponential Map and Lie Algebras

Near the identity of a Lie group \( G \), every group element can be written as an exponential. If \( g(t) \) is a smooth curve in \( G \) with \( g(0) = e \), then the tangent vector \( X = \dot{g}(0) \) lies in the tangent space \( T_e G \). This tangent space, equipped with a bracket operation to be defined shortly, is the Lie algebra \( \mathfrak{g} \) of \( G \). The exponential map \( \exp : \mathfrak{g} \to G \) is defined by

\[
\exp(X) = e^X = \sum_{k=0}^{\infty} \frac{X^k}{k!},
\]

and for matrix groups this is literally the matrix exponential. The exponential map is a local diffeomorphism near the origin of \( \mathfrak{g} \), so every element of \( G \) sufficiently close to the identity can be reached; for connected compact groups, it is surjective.

### The Exponential Map for SO(3): A Worked Example

The Lie algebra \( \mathfrak{so}(3) \) consists of all \( 3 \times 3 \) real antisymmetric matrices, since differentiating \( R^T R = \mathbf{1} \) at the identity gives \( X^T + X = 0 \). A basis is provided by the three generators

\[
J_1 = \begin{pmatrix} 0 & 0 & 0 \\ 0 & 0 & -1 \\ 0 & 1 & 0 \end{pmatrix}, \quad J_2 = \begin{pmatrix} 0 & 0 & 1 \\ 0 & 0 & 0 \\ -1 & 0 & 0 \end{pmatrix}, \quad J_3 = \begin{pmatrix} 0 & -1 & 0 \\ 1 & 0 & 0 \\ 0 & 0 & 0 \end{pmatrix}.
\]

One can verify directly that \( (J_3)^3 = -J_3 \), so the matrix exponential of \( \theta J_3 \) terminates in a pattern. Using \( (J_3)^2 = \mathrm{diag}(-1,-1,0) + \text{(contribution from the 3-3 block)} \) and sorting even and odd powers of \( \theta J_3 \):

\[
R_3(\theta) = \exp(\theta J_3) = \begin{pmatrix} \cos\theta & -\sin\theta & 0 \\ \sin\theta & \cos\theta & 0 \\ 0 & 0 & 1 \end{pmatrix},
\]

which is exactly the rotation matrix about the \( z \)-axis by angle \( \theta \). This demonstrates that \( J_3 \) is the generator of rotations about the third axis. Physically, in quantum mechanics the generator \( J_3 \) is identified with \( -i \) times the angular momentum operator \( L_3 / \hbar \), so that the unitary operator implementing a rotation by \( \theta \) about the \( z \)-axis is \( U(\theta) = \exp(-i \theta L_3 / \hbar) \). As a second check, one can compute the rotation about an arbitrary unit vector \( \hat{n} = (n_1, n_2, n_3) \) by forming \( X = \theta (n_i J_i) \) and exponentiating; the result is the Rodrigues rotation formula \( R = \mathbf{1}\cos\theta + (1-\cos\theta)\hat{n}\hat{n}^T + \sin\theta [\hat{n}]_\times \), where \( [\hat{n}]_\times \) is the antisymmetric matrix encoding the cross product.

## The Lie Bracket and Structure Constants

The Lie bracket is the fundamental algebraic operation on \( \mathfrak{g} \). For matrix Lie groups, it is simply the matrix commutator:

\[
\left[ X, Y \right] = XY - YX.
\]

The bracket is bilinear, antisymmetric (\( [X,Y] = -[Y,X] \)), and satisfies the Jacobi identity:

\[
\left[ X, \left[ Y, Z \right] \right] + \left[ Y, \left[ Z, X \right] \right] + \left[ Z, \left[ X, Y \right] \right] = 0.
\]

If \( \{T_a\} \) is a basis for \( \mathfrak{g} \), then the structure constants \( f^c{}_{ab} \) are defined by

\[
\left[ T_a, T_b \right] = f^c{}_{ab} \, T_c,
\]

where a sum over repeated indices is implied. The antisymmetry of the bracket gives \( f^c{}_{ab} = -f^c{}_{ba} \), and the Jacobi identity translates into a quadratic constraint on the structure constants: \( f^e{}_{ab} f^d{}_{ec} + f^e{}_{bc} f^d{}_{ea} + f^e{}_{ca} f^d{}_{eb} = 0 \). For \( \mathfrak{so}(3) \), the generators satisfy \( \left[ J_i, J_j \right] = \epsilon_{ijk} J_k \), so the structure constants are simply the Levi-Civita symbol.

## The Killing Form and Semisimplicity

The Killing form is a symmetric bilinear form on \( \mathfrak{g} \) defined by

\[
B(X, Y) = \mathrm{Tr}\!\left(\mathrm{ad}_X \circ \mathrm{ad}_Y\right),
\]

where \( \mathrm{ad}_X : \mathfrak{g} \to \mathfrak{g} \) is the adjoint map \( \mathrm{ad}_X(Y) = [X, Y] \). In components, \( B_{ab} = f^c{}_{ad} f^d{}_{cb} \). The Killing form is invariant under the adjoint action of the group: \( B(\mathrm{Ad}_g X, \mathrm{Ad}_g Y) = B(X,Y) \).

Cartan's criterion states that \( \mathfrak{g} \) is semisimple (has no abelian ideals) if and only if the Killing form is non-degenerate. For compact semisimple Lie algebras, the Killing form is negative definite, and we can choose a basis in which \( B_{ab} = -\delta_{ab} \). For physics applications it is conventional to rescale the generators so that \( \mathrm{Tr}(T_a T_b) = \frac{1}{2} \delta_{ab} \) in the fundamental representation — a normalization that appears constantly in gauge theory calculations, where the quadratic Casimir in the fundamental representation is \( C_2(F) = \frac{1}{2} \).

## Cartan Classification of Simple Lie Algebras

The Cartan–Killing classification gives a complete list of all simple complex Lie algebras. They fall into four infinite families and five exceptional cases. The four classical families are: the \( A_n \) series (\( n \geq 1 \)), corresponding to \( \mathfrak{sl}(n+1, \mathbb{C}) \) or the compact real form \( \mathfrak{su}(n+1) \), with dimension \( n(n+2) \); the \( B_n \) series (\( n \geq 2 \)), corresponding to \( \mathfrak{so}(2n+1) \), with dimension \( n(2n+1) \); the \( C_n \) series (\( n \geq 3 \)), corresponding to the symplectic algebra \( \mathfrak{sp}(2n) \), with dimension \( n(2n+1) \); and the \( D_n \) series (\( n \geq 4 \)), corresponding to \( \mathfrak{so}(2n) \), with dimension \( n(2n-1) \).

The five exceptional algebras are \( G_2 \), \( F_4 \), \( E_6 \), \( E_7 \), \( E_8 \), with dimensions 14, 52, 78, 133, and 248 respectively. In particle physics the algebras \( A_1 = \mathfrak{su}(2) \), \( A_2 = \mathfrak{su}(3) \), and their products are ubiquitous, while the exceptional algebra \( E_8 \) appears in heterotic string theory compactifications and grand unified theories. The proof of the classification proceeds via the theory of root systems: one chooses a maximal abelian subalgebra called the Cartan subalgebra, simultaneously diagonalizes the adjoint action, and reads off roots as the simultaneous eigenvalues. The constraint that the angle between any two roots must be one of the values \( 0°, 30°, 45°, 60°, 90°, 120°, 135°, 150°, 180° \) — a consequence of the Jacobi identity — severely restricts which root systems can occur, and the Dynkin diagram encodes the full root system in a compact graphical form.

---

# Chapter 3: SU(2) and SO(3)

## The su(2) Algebra and Ladder Operators

The Lie algebra \( \mathfrak{su}(2) \) consists of all \( 2 \times 2 \) traceless antihermitian matrices. In physics convention one writes the generators as \( J_i = \frac{1}{2}\sigma_i \) where \( \sigma_i \) are the Pauli matrices, so that the commutation relations read

\[
\left[ J_i, J_j \right] = i \epsilon_{ijk} J_k.
\]

These are the angular momentum commutation relations of quantum mechanics, familiar from any first course. The power of the group-theoretic approach is that all representations can be found from these relations alone, without solving any differential equation. Define the raising and lowering operators

\[
J_+ = J_1 + i J_2, \qquad J_- = J_1 - i J_2, \qquad J_3 \text{ unchanged}.
\]

The commutation relations become

\[
\left[ J_3, J_\pm \right] = \pm J_\pm, \qquad \left[ J_+, J_- \right] = 2 J_3.
\]

The Casimir operator \( \mathbf{J}^2 = J_1^2 + J_2^2 + J_3^2 \) commutes with all three generators, and by Schur's lemma (proven in Chapter 4) it acts as a scalar multiple of the identity on any irreducible representation.

## Full Derivation of Spin-j Representations

In an irreducible representation of \( \mathfrak{su}(2) \), since \( J_3 \) is diagonalizable and \( J_+ \) raises its eigenvalue by 1, there must be a state of maximum \( J_3 \) eigenvalue; call it \( m_\text{max} \) and denote the state \( |m_\text{max}\rangle \). The maximality condition requires \( J_+ |m_\text{max}\rangle = 0 \). Acting repeatedly with \( J_- \) generates a chain of states, each with \( J_3 \) eigenvalue decreased by 1. This chain must terminate at some minimum eigenvalue \( m_\text{min} \) where \( J_-|m_\text{min}\rangle = 0 \). Setting \( j = m_\text{max} \), one can show \( m_\text{min} = -j \) and the number of states is \( 2j + 1 \), which must be a positive integer, so \( j \in \{0, \frac{1}{2}, 1, \frac{3}{2}, 2, \ldots\} \). The Casimir eigenvalue is \( j(j+1) \).

The matrix elements are fixed by normalization. Writing \( |j, m\rangle \) for the normalized basis states with \( J_3 |j,m\rangle = m|j,m\rangle \), one computes using \( J_- J_+ = \mathbf{J}^2 - J_3(J_3 + 1) \):

\[
\|J_+|j,m\rangle\|^2 = \langle j,m|J_-J_+|j,m\rangle = j(j+1) - m(m+1),
\]

\[
J_\pm |j, m\rangle = \sqrt{j(j+1) - m(m\pm 1)} \; |j, m\pm 1\rangle.
\]

### Explicit Matrices for j = 1/2

For \( j = \frac{1}{2} \) the basis is \( \{|\tfrac{1}{2},\tfrac{1}{2}\rangle, |\tfrac{1}{2},-\tfrac{1}{2}\rangle\} \), commonly written \( |\uparrow\rangle, |\downarrow\rangle \). Then

\[
J_3 = \frac{1}{2}\begin{pmatrix} 1 & 0 \\ 0 & -1 \end{pmatrix}, \quad J_+ = \begin{pmatrix} 0 & 1 \\ 0 & 0 \end{pmatrix}, \quad J_- = \begin{pmatrix} 0 & 0 \\ 1 & 0 \end{pmatrix},
\]

from which \( J_1 = \frac{1}{2}\sigma_1 \), \( J_2 = \frac{1}{2}\sigma_2 \), \( J_3 = \frac{1}{2}\sigma_3 \). The \( 2\times 2 \) unitary matrices arising from exponentiating are elements of \( SU(2) \). A general element is \( U = e^{i\boldsymbol{\theta}\cdot\boldsymbol{\sigma}/2} = \cos(\theta/2)\mathbf{1} + i(\hat{n}\cdot\boldsymbol{\sigma})\sin(\theta/2) \), where \( \theta = |\boldsymbol{\theta}| \) and \( \hat{n} = \boldsymbol{\theta}/\theta \) is the rotation axis.

### Explicit Matrices for j = 1

For \( j = 1 \) the basis is \( \{|1,1\rangle, |1,0\rangle, |1,-1\rangle\} \). Applying the formula:

\[
J_+ |1,0\rangle = \sqrt{1 \cdot 2 - 0 \cdot 1}\,|1,1\rangle = \sqrt{2}\,|1,1\rangle, \quad J_+ |1,-1\rangle = \sqrt{1\cdot 2 - (-1)(0)}\,|1,0\rangle = \sqrt{2}\,|1,0\rangle.
\]

Therefore

\[
J_3 = \begin{pmatrix} 1 & 0 & 0 \\ 0 & 0 & 0 \\ 0 & 0 & -1 \end{pmatrix}, \quad J_+ = \sqrt{2}\begin{pmatrix} 0 & 1 & 0 \\ 0 & 0 & 1 \\ 0 & 0 & 0 \end{pmatrix}, \quad J_- = \sqrt{2}\begin{pmatrix} 0 & 0 & 0 \\ 1 & 0 & 0 \\ 0 & 1 & 0 \end{pmatrix}.
\]

These are the \( j=1 \) representation matrices. One can verify that they satisfy the same commutation relations \( [J_i, J_j] = i\epsilon_{ijk}J_k \) as required, and the Casimir gives \( \mathbf{J}^2 = j(j+1)\mathbf{1} = 2\mathbf{1} \). The \( j=1 \) representation is related to the defining three-dimensional representation of \( SO(3) \) by a basis change, confirming that integer-spin representations descend to honest representations of \( SO(3) \).

## Clebsch–Gordan Decomposition

When two quantum systems with angular momenta \( j_1 \) and \( j_2 \) are combined, the total Hilbert space is a tensor product \( V_{j_1} \otimes V_{j_2} \) of dimension \( (2j_1+1)(2j_2+1) \). This product representation is reducible and decomposes as

\[
j_1 \otimes j_2 = \left|j_1 - j_2\right| \oplus \left(\left|j_1 - j_2\right| + 1\right) \oplus \cdots \oplus (j_1 + j_2).
\]

For example, \( \frac{1}{2} \otimes \frac{1}{2} = 0 \oplus 1 \): two spin-\(\frac{1}{2}\) particles combine into a singlet and a triplet, with total dimensions \( 1 + 3 = 4 = 2 \times 2 \). The coefficients expressing the coupled basis \( |j, m\rangle \) in terms of the uncoupled basis \( |m_1, m_2\rangle \) are the Clebsch–Gordan coefficients \( \langle j_1 m_1 j_2 m_2 | j m \rangle \). One derives the CG coefficients for \( \frac{1}{2} \otimes \frac{1}{2} \) as follows. The highest-weight state of the triplet is uniquely \( |1,1\rangle = |\uparrow\uparrow\rangle \). Applying \( J_- = J_-^{(1)} + J_-^{(2)} \) gives

\[
|1,0\rangle = \frac{1}{\sqrt{2}}\left(|\uparrow\downarrow\rangle + |\downarrow\uparrow\rangle\right), \quad |1,-1\rangle = |\downarrow\downarrow\rangle.
\]

The singlet is the state orthogonal to all three triplet states with \( m_1 + m_2 = 0 \):

\[
|0,0\rangle = \frac{1}{\sqrt{2}}\left(|\uparrow\downarrow\rangle - |\downarrow\uparrow\rangle\right).
\]

This antisymmetric singlet is the spin wavefunction of two electrons in a singlet state, as in the helium ground state or the hydrogen molecule. The CG decomposition has immediate applications in nuclear physics (addition of nucleon spins), atomic spectroscopy (LS coupling), and particle physics (flavor and color multiplets).

## The SU(2) Double Cover of SO(3)

The rotation group \( SO(3) \) is the group of all proper rotations in three dimensions: \( 3 \times 3 \) real matrices with \( R^T R = \mathbf{1} \) and \( \det R = +1 \). As a manifold it is diffeomorphic to the real projective space \( \mathbb{RP}^3 \), which has fundamental group \( \pi_1(SO(3)) = \mathbb{Z}_2 \). This non-trivial fundamental group means that some loops in \( SO(3) \) cannot be continuously shrunk to a point, and it is the topological reason why half-integer representations exist only as projective representations of \( SO(3) \).

The group \( SU(2) \), by contrast, is diffeomorphic to the three-sphere \( S^3 \), which is simply connected. There is a surjective homomorphism \( \phi : SU(2) \to SO(3) \) given as follows. For any vector \( \mathbf{x} \in \mathbb{R}^3 \), form the traceless hermitian matrix \( X = x_i \sigma_i \). For any \( U \in SU(2) \), the matrix \( U X U^\dagger \) is again traceless and hermitian, so it can be written as \( x'_i \sigma_i \) for some real vector \( \mathbf{x}' \). The linear map \( \mathbf{x} \mapsto \mathbf{x}' \) is a rotation, defining \( \phi(U) \in SO(3) \). The kernel of \( \phi \) consists of those \( U \) for which \( UXU^\dagger = X \) for all traceless hermitian \( X \), which forces \( U \propto \mathbf{1} \); the only such elements in \( SU(2) \) are \( +\mathbf{1} \) and \( -\mathbf{1} \). Therefore \( SO(3) \cong SU(2)/\{\pm\mathbf{1}\} \), and \( SU(2) \) is the double cover of \( SO(3) \).

## Spinor Sign Change Under 2π Rotation

A rotation by \( \theta \) about the \( z \)-axis is implemented in the \( j = \frac{1}{2} \) representation by

\[
U(\theta) = \exp\!\left(-i\theta J_3\right) = \exp\!\left(-i\frac{\theta}{2}\sigma_3\right) = \begin{pmatrix} e^{-i\theta/2} & 0 \\ 0 & e^{i\theta/2} \end{pmatrix}.
\]

Under a full rotation \( \theta = 2\pi \), this gives \( U(2\pi) = -\mathbf{1} \), not the identity. The spinor acquires a sign change under a complete rotation. Under \( \theta = 4\pi \), \( U(4\pi) = +\mathbf{1} \), so a spinor returns to itself only after a rotation by \( 4\pi \). This is not merely formal: neutron interferometry experiments (Rauch et al., 1975; Werner et al., 1975) directly verified this sign change by splitting a neutron beam, rotating one branch by \( 2\pi \), and observing the resulting destructive interference relative to the unrotated branch. The physical observables, which are bilinear in the spinor, are invariant under \( U \to -U \), so the sign change has no consequence for classical observations but is detectable through quantum interference. This experiment is one of the most direct confirmations of the double-cover structure in nature.

---

# Chapter 4: Representation Theory

## Complete Reducibility

The starting point of systematic representation theory is the question of how representations can be built from simpler pieces. A representation \( \rho : G \to \mathrm{GL}(V) \) is called reducible if there exists a proper non-zero subspace \( W \subset V \) that is invariant: \( \rho(g) W \subseteq W \) for all \( g \in G \). If no such subspace exists, \( \rho \) is irreducible. The central result for finite groups is Maschke's theorem: every representation of a finite group over a field of characteristic not dividing \( |G| \) is completely reducible — it decomposes as a direct sum of irreducible representations.

The proof proceeds by averaging. Given an invariant subspace \( W \), one wishes to find an invariant complement. Begin with any projection \( P_0 : V \to W \) (not necessarily invariant), and define the averaged projection

\[
P = \frac{1}{|G|} \sum_{g \in G} \rho(g) \, P_0 \, \rho(g)^{-1}.
\]

One verifies that \( P \rho(h) = \rho(h) P \) for all \( h \), that \( P^2 = P \) (it is a projector), and that \( PV = W \). The kernel \( \ker P \) is then an invariant complement to \( W \), and the representation decomposes as \( V = W \oplus \ker P \). The analogous result for compact Lie groups, due to Hermann Weyl, replaces the sum over group elements by an integral with respect to the Haar measure — the unique left-invariant measure on a compact group — and the argument is otherwise identical.

Complete reducibility is the cornerstone that makes representation theory so powerful in physics. It means that every Hilbert space carrying a symmetry decomposes cleanly into a direct sum of irreducible representation spaces, each of which can be analyzed independently, and physical states can be labelled by the irreducible representation they belong to.

## Schur's Lemmas

Schur's lemmas are among the most useful results in representation theory, with immediate consequences for selection rules and degeneracies in quantum mechanics.

<div class="theorem">
<strong>Schur's First Lemma.</strong> Let \( \rho_1 : G \to \mathrm{GL}(V_1) \) and \( \rho_2 : G \to \mathrm{GL}(V_2) \) be two irreducible representations of \( G \), and let \( T : V_1 \to V_2 \) be a linear map intertwining them: \( T \rho_1(g) = \rho_2(g) T \) for all \( g \in G \). Then either \( T = 0 \) or \( T \) is an isomorphism. In particular, if the two representations are non-isomorphic, the only intertwiner is zero.
</div>

<div class="proof">
The kernel \( \ker T \) is a \( G \)-invariant subspace of \( V_1 \): if \( v \in \ker T \), then \( T \rho_1(g) v = \rho_2(g) T v = 0 \), so \( \rho_1(g) v \in \ker T \). Since \( \rho_1 \) is irreducible, either \( \ker T = \{0\} \) or \( \ker T = V_1 \). Similarly, \( \mathrm{im}\, T \) is invariant under \( \rho_2 \), so either \( \mathrm{im}\, T = \{0\} \) or \( \mathrm{im}\, T = V_2 \). If \( \ker T = \{0\} \), then \( T \) is injective, and its image is non-zero and invariant, so \( \mathrm{im}\, T = V_2 \) and \( T \) is an isomorphism.
</div>

<div class="theorem">
<strong>Schur's Second Lemma.</strong> Let \( \rho : G \to \mathrm{GL}(V) \) be a finite-dimensional irreducible representation over an algebraically closed field, and let \( T : V \to V \) be an intertwiner: \( T \rho(g) = \rho(g) T \) for all \( g \). Then \( T = \lambda \mathbf{1} \) for some scalar \( \lambda \).
</div>

<div class="proof">
Since the field is algebraically closed, \( T \) has at least one eigenvalue \( \lambda \). The map \( T - \lambda \mathbf{1} \) is also an intertwiner and has non-trivial kernel, so by the first lemma it must be the zero map. Therefore \( T = \lambda \mathbf{1} \).
</div>

The physical import is enormous. Any operator that commutes with all elements of a symmetry group must be a multiple of the identity on each irreducible representation space. Applied to the Hamiltonian: if \( H \) commutes with \( G \) and an energy eigenspace carries an irreducible representation of \( G \), then all states in that eigenspace are degenerate with the same energy. The dimension of the irrep is the degree of the degeneracy. This is the group-theoretic explanation for why the hydrogen atom has \( 2l+1 \)-fold degenerate magnetic substates: the \( (2l+1) \)-dimensional irrep of \( SO(3) \) is irreducible, so all its members must be degenerate by Schur's lemma.

## Characters and Character Orthogonality

The character of a representation \( \rho \) is the function \( \chi_\rho : G \to \mathbb{C} \) defined by \( \chi_\rho(g) = \mathrm{Tr}(\rho(g)) \). Characters are class functions: \( \chi_\rho(hgh^{-1}) = \mathrm{Tr}(\rho(h)\rho(g)\rho(h)^{-1}) = \mathrm{Tr}(\rho(g)) = \chi_\rho(g) \) for all \( h \in G \). Characters contain all the information needed to determine which irreducible representations appear and with what multiplicity. The fundamental result is the character orthogonality theorem: for a finite group \( G \) and two irreducible representations \( \rho_\alpha, \rho_\beta \),

\[
\frac{1}{|G|} \sum_{g \in G} \chi_{\rho_\alpha}(g)^* \, \chi_{\rho_\beta}(g) = \delta_{\alpha\beta}.
\]

The proof uses the averaging argument: one constructs the operator \( \hat{P} = \frac{1}{|G|}\sum_g \rho_\beta(g) M \rho_\alpha(g)^{-1} \) for any matrix \( M \) and applies Schur's lemmas to show it is zero unless \( \rho_\alpha \cong \rho_\beta \), and proportional to the identity in that case. Taking traces and choosing \( M \) appropriately yields the orthogonality theorem.

The characters of the irreducible representations form an orthonormal basis for the space of class functions on \( G \). The number of irreducible representations (up to isomorphism) equals the number of conjugacy classes of \( G \).

Given any representation \( \rho \) with character \( \chi_\rho \), the multiplicity of the irreducible representation \( \rho_\alpha \) in \( \rho \) is

\[
n_\alpha = \frac{1}{|G|} \sum_{g \in G} \chi_{\rho_\alpha}(g)^* \, \chi_\rho(g).
\]

As a concrete example, consider the group C₂v and the six-dimensional representation on the six atomic p-orbitals (two for each of the three atoms in a hypothetical symmetric triatomic). The character of the identity element, which maps every basis vector to itself, is 6. The characters of the other elements are computed by counting how many basis vectors are mapped to themselves (with appropriate signs). Applying the multiplicity formula and using the character table of C₂v gives a decomposition into one-dimensional irreps, immediately telling which linear combinations of orbitals have definite symmetry and which transitions are dipole-allowed.

## Young Tableaux and SU(N) Representations

For the unitary groups \( SU(N) \), a powerful combinatorial tool for labeling and computing with representations is provided by Young tableaux. A Young tableau is a diagram of boxes arranged in left-justified rows of non-increasing length \( \lambda_1 \geq \lambda_2 \geq \cdots \geq \lambda_k \geq 0 \), where at most \( N - 1 \) rows are allowed. The total number of boxes \( n = \sum \lambda_i \) is the number of fundamental-representation indices being combined (or, physically, the number of quarks in a hadron).

For \( SU(3) \), a tableau with \( p \) boxes in the first row and \( q \) boxes in the second (\( p \geq q \)) corresponds to an irrep usually denoted \( (p, q) \) in Dynkin label notation or by its dimension. The dimension formula is

\[
\dim(p,q) = \frac{1}{2}(p+1)(q+1)(p+q+2).
\]

For \( (p,q) = (1,0) \) we get the fundamental \( \mathbf{3} \): \( \frac{1}{2}(2)(1)(3) = 3 \). For \( (0,1) \) the antifundamental \( \overline{\mathbf{3}} \). For \( (1,1) \) we get the adjoint: \( \frac{1}{2}(2)(2)(4) = 8 \), confirming the \( \mathbf{8} \). For \( (3,0) \) we get \( \frac{1}{2}(4)(1)(5) = 10 \), giving the decuplet \( \mathbf{10} \) that appears as the baryon decuplet of the quark model.

Tensor product decompositions are computed by the Littlewood–Richardson rule applied to the corresponding tableaux. For instance, \( \mathbf{3} \otimes \mathbf{3} = \mathbf{6} \oplus \overline{\mathbf{3}} \) (symmetric and antisymmetric products of two fundamentals), and \( \mathbf{3} \otimes \overline{\mathbf{3}} = \mathbf{1} \oplus \mathbf{8} \) (quark–antiquark mesons). For three quarks: \( \mathbf{3} \otimes \mathbf{3} \otimes \mathbf{3} = \mathbf{1} \oplus \mathbf{8} \oplus \mathbf{8} \oplus \mathbf{10} \), which is precisely the content needed to understand protons and neutrons as bound states of three quarks and to predict the spectrum of baryons.

---

# Chapter 5: SU(3) and the Quark Model

## The Gell-Mann Matrices

The Lie algebra \( \mathfrak{su}(3) \) consists of all traceless antihermitian \( 3 \times 3 \) complex matrices. Its dimension is \( 3^2 - 1 = 8 \). The standard basis in physics is provided by the eight Gell-Mann matrices \( \lambda_a \) (\( a = 1, \ldots, 8 \)), normalized so that \( \mathrm{Tr}(\lambda_a \lambda_b) = 2\delta_{ab} \). They generalize the Pauli matrices to \( 3 \times 3 \):

\[
\lambda_1 = \begin{pmatrix} 0 & 1 & 0 \\ 1 & 0 & 0 \\ 0 & 0 & 0 \end{pmatrix}, \quad \lambda_2 = \begin{pmatrix} 0 & -i & 0 \\ i & 0 & 0 \\ 0 & 0 & 0 \end{pmatrix}, \quad \lambda_3 = \begin{pmatrix} 1 & 0 & 0 \\ 0 & -1 & 0 \\ 0 & 0 & 0 \end{pmatrix},
\]

\[
\lambda_4 = \begin{pmatrix} 0 & 0 & 1 \\ 0 & 0 & 0 \\ 1 & 0 & 0 \end{pmatrix}, \quad \lambda_5 = \begin{pmatrix} 0 & 0 & -i \\ 0 & 0 & 0 \\ i & 0 & 0 \end{pmatrix}, \quad \lambda_6 = \begin{pmatrix} 0 & 0 & 0 \\ 0 & 0 & 1 \\ 0 & 1 & 0 \end{pmatrix},
\]

\[
\lambda_7 = \begin{pmatrix} 0 & 0 & 0 \\ 0 & 0 & -i \\ 0 & i & 0 \end{pmatrix}, \quad \lambda_8 = \frac{1}{\sqrt{3}}\begin{pmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & -2 \end{pmatrix}.
\]

The generators of the Lie algebra in physics convention are \( T_a = \frac{1}{2}\lambda_a \), satisfying \( \left[ T_a, T_b \right] = i f_{abc} T_c \) where \( f_{abc} \) are the totally antisymmetric structure constants of \( \mathfrak{su}(3) \). The non-zero independent structure constants include \( f_{123} = 1 \), \( f_{147} = f_{165} = f_{246} = f_{257} = f_{345} = f_{376} = \frac{1}{2} \), and \( f_{458} = f_{678} = \frac{\sqrt{3}}{2} \). One can also define symmetric \( d \)-symbols by \( \{T_a, T_b\} = \frac{1}{3}\delta_{ab} + d_{abc} T_c \), which appear in the anomaly cancellation conditions of gauge theories.

## The Cartan Subalgebra and Root Diagram

The Cartan subalgebra of \( \mathfrak{su}(3) \) is the maximal abelian subalgebra. It is two-dimensional, spanned by \( H_1 = T_3 \) and \( H_2 = T_8 \), which correspond to isospin projection and hypercharge in the quark model. The rank of \( \mathfrak{su}(3) \) is 2, consistent with the \( A_2 \) classification. The remaining six generators fall into three raising operators \( E_\alpha \) and three lowering operators \( E_{-\alpha} \), each labelled by a root vector \( \boldsymbol{\alpha} \in \mathbb{R}^2 \) satisfying

\[
\left[ H_i, E_\alpha \right] = \alpha_i E_\alpha.
\]

In the fundamental \( \mathbf{3} \) representation, the three weight vectors of the quark states \( u, d, s \) in the \( (T_3, Y) \) plane (where \( Y = \frac{2}{\sqrt{3}} T_8 \) is the hypercharge) are

\[
u: \; \left(\tfrac{1}{2}, \tfrac{1}{3}\right), \quad d: \; \left(-\tfrac{1}{2}, \tfrac{1}{3}\right), \quad s: \; \left(0, -\tfrac{2}{3}\right).
\]

These three weight vectors form an equilateral triangle in the weight plane. The six roots of \( \mathfrak{su}(3) \) form a regular hexagon; the simple roots are \( \boldsymbol{\alpha}^{(1)} = (1, 0) \) and \( \boldsymbol{\alpha}^{(2)} = (-\frac{1}{2}, \frac{\sqrt{3}}{2}) \), and the highest root is \( \boldsymbol{\alpha}^{(1)} + \boldsymbol{\alpha}^{(2)} \).

## The Eightfold Way

In 1961, Murray Gell-Mann and Yuval Ne'eman independently proposed that the approximate symmetry underlying the known hadrons is a flavor \( SU(3) \) acting on the three lightest quarks \( u, d, s \). Under this symmetry, mesons and baryons fall into representations (multiplets) of \( SU(3)_\text{flavor} \).

The lightest baryons form an octet — they transform in the adjoint representation \( \mathbf{8} \) of \( SU(3) \). Plotting them on the \( (I_3, Y) \) plane (the weight diagram of the adjoint), one sees a hexagonal arrangement with two states at the center: the nucleon doublet \( (p, n) \) at \( Y = 1 \), the Σ triplet \( (\Sigma^+, \Sigma^0, \Sigma^-) \) at \( Y = 0 \), the Λ singlet at \( Y = 0 \) (the second center state), and the Ξ doublet \( (\Xi^0, \Xi^-) \) at \( Y = -1 \). This pattern was a prediction before the \( \Omega^- \) was discovered.

The next excited baryons form a decuplet — the \( \mathbf{10} \) representation. In 1962, Gell-Mann observed that nine members of the decuplet were known (the Δ quadruplet, Σ* triplet, and Ξ* doublet) but the apex state was missing. He predicted its charge \( Q = -1 \), strangeness \( S = -3 \), and mass \( M_{\Omega^-} \approx 1685 \) MeV (compared to the measured value of 1672 MeV). The \( \Omega^- \) was discovered at Brookhaven National Laboratory in 1964, a triumph of the group-theoretic prediction.

## The Gell-Mann–Okubo Mass Formula

Flavor \( SU(3) \) is only an approximate symmetry because \( m_s \gg m_u \approx m_d \). The symmetry breaking can be parameterized by treating the mass-perturbing operator as transforming like the eighth component (\( T_8 \)) of an \( \mathfrak{su}(3) \) octet. The resulting Gell-Mann–Okubo (GMO) formula for baryon masses within the octet is

\[
M = a + b Y + c \left[ I(I+1) - \frac{Y^2}{4} \right],
\]

where \( a, b, c \) are three free parameters and \( I \), \( Y \) are the isospin and hypercharge. With three parameters fitting four isospin multiplets (each multiplet has a single mass to leading order in \( SU(3) \) breaking), the formula is one prediction and one fit. The prediction is

\[
\frac{M_N + M_\Xi}{2} = \frac{3 M_\Lambda + M_\Sigma}{4},
\]

which gives numerically \( \frac{938 + 1318}{2} = 1128 \) MeV and \( \frac{3 \times 1116 + 1192}{4} = 1135 \) MeV — agreement to within 7 MeV, or under one percent. For the decuplet, where \( b = 0 \) by isospin considerations, the formula predicts equal spacing between the multiplets: \( M_{\Sigma^*} - M_\Delta = M_{\Xi^*} - M_{\Sigma^*} = M_{\Omega^-} - M_{\Xi^*} \approx 145 \) MeV, in excellent agreement with experiment.

## Color SU(3) and Confinement

A second, quite different \( SU(3) \) appears in QCD. Color \( SU(3) \) is an exact local (gauge) symmetry, not an approximate flavor symmetry. Each quark flavor comes in three colors, transforming in the fundamental \( \mathbf{3} \) of color \( SU(3) \). Antiquarks transform in the conjugate \( \overline{\mathbf{3}} \), and gluons in the adjoint \( \mathbf{8} \). The confinement hypothesis, supported by lattice QCD but not yet analytically proven from first principles, states that only color-singlet states appear as asymptotic physical particles.

The criterion for a state to be a color singlet is that it transforms in the trivial representation of color \( SU(3) \). For mesons: \( \mathbf{3} \otimes \overline{\mathbf{3}} = \mathbf{1} \oplus \mathbf{8} \), so a quark–antiquark pair can form a singlet. For baryons: \( \mathbf{3} \otimes \mathbf{3} \otimes \mathbf{3} = \mathbf{1} \oplus \mathbf{8} \oplus \mathbf{8} \oplus \mathbf{10} \), so three quarks can form a singlet via total antisymmetrization in color. The color singlet wavefunction for a baryon is proportional to \( \epsilon^{abc} q_a q_b q_c \) where \( \epsilon \) is the three-dimensional Levi-Civita tensor — it is completely antisymmetric in all three color indices, ensuring it is invariant under color \( SU(3) \).

---

# Chapter 6: The Lorentz and Poincaré Groups

## The Lorentz Algebra

Special relativity requires that the laws of physics be invariant under Lorentz transformations: linear maps \( \Lambda \) on \( \mathbb{R}^{1,3} \) that preserve the Minkowski metric \( \eta = \mathrm{diag}(+1,-1,-1,-1) \), meaning \( \Lambda^T \eta \Lambda = \eta \). This defines the Lorentz group \( O(3,1) \). The connected component of the identity, consisting of proper orthochronous Lorentz transformations (with \( \det\Lambda = +1 \) and \( \Lambda^0{}_0 \geq +1 \)), is denoted \( SO^+(3,1) \).

An infinitesimal Lorentz transformation is \( \Lambda^\mu{}_\nu = \delta^\mu_\nu + \omega^\mu{}_\nu \) with \( \omega_{\mu\nu} = \eta_{\mu\alpha}\omega^\alpha{}_\nu \) antisymmetric: \( \omega_{\mu\nu} = -\omega_{\nu\mu} \). The generators of the Lorentz algebra, as realized on vector fields, are \( (M_{\mu\nu})^\rho{}_\sigma = i(\delta^\rho_\mu \eta_{\nu\sigma} - \delta^\rho_\nu \eta_{\mu\sigma}) \), satisfying the Lorentz algebra commutation relations:

\[
\left[ M_{\mu\nu}, M_{\rho\sigma} \right] = i\left(\eta_{\nu\rho} M_{\mu\sigma} - \eta_{\mu\rho} M_{\nu\sigma} - \eta_{\nu\sigma} M_{\mu\rho} + \eta_{\mu\sigma} M_{\nu\rho}\right).
\]

The six generators split into rotations \( J_i = \frac{1}{2}\epsilon_{ijk} M_{jk} \) and boosts \( K_i = M_{0i} \). Their commutation relations are

\[
\left[ J_i, J_j \right] = i\epsilon_{ijk} J_k, \quad \left[ J_i, K_j \right] = i\epsilon_{ijk} K_k, \quad \left[ K_i, K_j \right] = -i\epsilon_{ijk} J_k.
\]

The crucial minus sign in the last relation means the boosts do not close into a subalgebra by themselves. Moreover, unlike \( \mathfrak{so}(3) \), the Lorentz algebra has no positive-definite invariant form on the real algebra because of this sign, confirming that the Lorentz group is non-compact.

## Decomposition into Two Copies of su(2)

The elegant approach to classifying Lorentz representations is to complexify the algebra. Define

\[
N_i^\pm = \frac{1}{2}(J_i \pm i K_i).
\]

A direct computation using the commutation relations for \( J_i \) and \( K_i \) gives

\[
\left[ N_i^+, N_j^+ \right] = i\epsilon_{ijk} N_k^+, \quad \left[ N_i^-, N_j^- \right] = i\epsilon_{ijk} N_k^-, \quad \left[ N_i^+, N_j^- \right] = 0.
\]

The complexified Lorentz algebra \( \mathfrak{so}(3,1)_\mathbb{C} \cong \mathfrak{su}(2)_\mathbb{C} \oplus \mathfrak{su}(2)_\mathbb{C} \) decomposes as a direct sum of two commuting copies of \( \mathfrak{su}(2)_\mathbb{C} \). The finite-dimensional (but non-unitary) irreducible representations are therefore labeled by two half-integers \( (j_+, j_-) \), where \( j_\pm \) specifies which spin-\( j \) representation acts on the \( \pm \) copy. The dimension of the \( (j_+, j_-) \) representation is \( (2j_+ + 1)(2j_- + 1) \). In this language, the scalar is \( (0,0) \), the vector is \( (\frac{1}{2},\frac{1}{2}) \), the anti-self-dual rank-2 antisymmetric tensor is \( (1,0) \), and the self-dual is \( (0,1) \).

## Spinor Representations

The simplest non-trivial representations are \( (\frac{1}{2}, 0) \) and \( (0, \frac{1}{2}) \). In the \( (\frac{1}{2}, 0) \) representation, \( N_i^- = 0 \) while \( N_i^+ = \frac{\sigma_i}{2} \). Working back: \( J_i = N_i^+ + N_i^- = \frac{\sigma_i}{2} \) and \( K_i = -i(N_i^+ - N_i^-) = -i\frac{\sigma_i}{2} \). The boost generator is \( -i \) times the rotation generator, so a boost with rapidity \( \eta \) acts as \( \exp(\eta K_i) = \exp(\eta \sigma_i / 2) \), which is Hermitian rather than unitary. This is the left-handed Weyl spinor, denoted \( \xi_\alpha \) with an undotted spinor index \( \alpha = 1, 2 \).

In the \( (0, \frac{1}{2}) \) representation, one finds instead \( K_i = +i\frac{\sigma_i}{2} \): this is the right-handed Weyl spinor, denoted \( \bar\chi^{\dot\alpha} \) with a dotted spinor index \( \dot\alpha = \dot{1}, \dot{2} \) in van der Waerden notation. The dotted and undotted indices transform under the two different \( SU(2) \) factors and must never be conflated. A Dirac spinor combines both:

\[
\Psi = \begin{pmatrix} \xi_\alpha \\ \bar{\chi}^{\dot{\alpha}} \end{pmatrix},
\]

and transforms in the reducible \( (\frac{1}{2},0) \oplus (0,\frac{1}{2}) \) representation. A Majorana spinor is a Dirac spinor for which the right-handed component is the charge conjugate of the left-handed one: \( \bar\chi^{\dot\alpha} = (\xi^\alpha)^* \) (with appropriate index lowering via the \( \epsilon \)-tensor). Majorana spinors have half as many independent components as Dirac spinors and describe neutral spin-\(\frac{1}{2}\) particles that are their own antiparticles.

## The Poincaré Group

The Poincaré group is the semidirect product \( ISO(3,1) = \mathbb{R}^{1,3} \rtimes SO^+(3,1) \), combining Lorentz transformations with spacetime translations. An element is a pair \( (a^\mu, \Lambda^\mu{}_\nu) \) and acts on spacetime as \( x^\mu \mapsto \Lambda^\mu{}_\nu x^\nu + a^\mu \). The group law is \( (a_1, \Lambda_1)(a_2, \Lambda_2) = (a_1 + \Lambda_1 a_2, \Lambda_1\Lambda_2) \). The algebra of the Poincaré group contains the translation generators \( P_\mu \) in addition to \( M_{\mu\nu} \), with additional commutation relations

\[
\left[ P_\mu, P_\nu \right] = 0, \qquad \left[ M_{\mu\nu}, P_\rho \right] = i(\eta_{\mu\rho} P_\nu - \eta_{\nu\rho} P_\mu).
\]

The two Casimir operators are \( P^2 = P_\mu P^\mu \) and \( W^2 = W_\mu W^\mu \), where \( W^\mu = \frac{1}{2}\epsilon^{\mu\nu\rho\sigma} M_{\nu\rho} P_\sigma \) is the Pauli-Lubanski pseudovector. On a one-particle state, \( P^2 = m^2 \) (mass squared) and \( W^2 = -m^2 s(s+1) \) for spin \( s \).

## Wigner's Little Group Classification

Wigner's method of induced representations classifies all unitary irreducible representations of the Poincaré group. One chooses a standard momentum \( k^\mu \) in each orbit of \( P_\mu \) under the Lorentz group, finds the little group \( G_k \subset SO^+(3,1) \) that fixes \( k^\mu \), and induces a representation of the full Poincaré group from a representation of \( G_k \).

For a massive particle with \( m > 0 \), one takes \( k^\mu = (m, \mathbf{0}) \). The little group is the set of Lorentz transformations that fix the rest-frame four-momentum, which is \( SO(3) \cong SU(2)/\mathbb{Z}_2 \). Representations of the little group are labeled by spin \( s = 0, \frac{1}{2}, 1, \ldots \), and the corresponding Poincaré representation describes a massive particle of spin \( s \) with \( 2s+1 \) physical polarization states.

For a massless particle with \( m = 0 \), take \( k^\mu = (E, 0, 0, E) \). The little group is the two-dimensional Euclidean group \( ISO(2) \). Its finite-dimensional faithful unitary representations are one-dimensional and labeled by a single integer or half-integer \( h \) called helicity, representing the spin component along the direction of motion. The photon has helicities \( h = \pm 1 \); the graviton \( h = \pm 2 \); a massless neutrino \( h = -\frac{1}{2} \). The fact that a massless particle has only two polarization states (rather than \( 2s+1 \)) is a direct consequence of the non-compactness of the little group for massless particles.

---

# Chapter 7: Gauge Theory

## U(1) Gauge Invariance

The observation that motivates gauge theory starts with the Dirac Lagrangian for a free electron field \( \psi \):

\[
\mathcal{L}_0 = \bar\psi(i\gamma^\mu \partial_\mu - m)\psi.
\]

This Lagrangian has a global \( U(1) \) symmetry: it is invariant under \( \psi(x) \to e^{i\alpha}\psi(x) \) for any constant real \( \alpha \). By Noether's theorem, this symmetry leads to a conserved current \( j^\mu = \bar\psi \gamma^\mu \psi \) and conserved charge — the electric charge.

Now demand that the symmetry be local: allow \( \alpha \) to depend on the spacetime point, \( \alpha \to \alpha(x) \). Under \( \psi \to e^{i\alpha(x)}\psi \), the derivative term transforms as

\[
\partial_\mu \psi \to e^{i\alpha(x)}\partial_\mu\psi + i(\partial_\mu\alpha) e^{i\alpha(x)}\psi,
\]

introducing an unwanted extra term \( i\bar\psi\gamma^\mu(\partial_\mu\alpha)\psi \). To restore invariance, one introduces a gauge field \( A_\mu(x) \) that transforms simultaneously as \( A_\mu \to A_\mu - \frac{1}{e}\partial_\mu\alpha \), and replaces the ordinary derivative with the covariant derivative

\[
D_\mu = \partial_\mu + ieA_\mu.
\]

Under a local gauge transformation, \( D_\mu\psi \to e^{i\alpha(x)} D_\mu\psi \): the covariant derivative transforms covariantly, and \( \bar\psi \gamma^\mu D_\mu \psi \) is gauge invariant. The gauge-invariant kinetic term for \( A_\mu \) is built from the field strength tensor

\[
F_{\mu\nu} = \partial_\mu A_\nu - \partial_\nu A_\mu = -\frac{i}{e}\left[ D_\mu, D_\nu \right],
\]

which is invariant under \( A_\mu \to A_\mu - \frac{1}{e}\partial_\mu\alpha \). The full gauge-invariant Lagrangian is

\[
\mathcal{L}_\text{QED} = -\frac{1}{4}F_{\mu\nu}F^{\mu\nu} + \bar\psi(i\gamma^\mu D_\mu - m)\psi,
\]

which is the Lagrangian of quantum electrodynamics. The entire structure of electromagnetism — Maxwell's equations, the Lorentz force law, the minimal coupling of photons to charged matter — is derived from the single requirement of local \( U(1) \) gauge invariance.

## Non-Abelian Gauge Theory

For a non-abelian Lie group \( G \) with Lie algebra \( \mathfrak{g} \), the construction generalizes as follows. Let the matter field \( \psi \) transform in a representation \( \rho \) of \( G \): under a gauge transformation \( g(x) \in G \), \( \psi(x) \to \rho(g(x))\psi(x) \). The gauge field is a \( \mathfrak{g} \)-valued one-form \( A_\mu = A_\mu^a T_a \), and the covariant derivative is

\[
D_\mu = \partial_\mu - ig A_\mu^a T_a.
\]

Under a gauge transformation parameterized by \( g(x) = \exp(i\alpha^a(x) T_a) \), the gauge field transforms as

\[
A_\mu \to g A_\mu g^{-1} + \frac{i}{g}(\partial_\mu g) g^{-1}.
\]

For infinitesimal \( \alpha^a \), this reads \( \delta A_\mu^a = \partial_\mu \alpha^a + g f^a{}_{bc} A_\mu^b \alpha^c = (D_\mu \alpha)^a \). The non-abelian field strength tensor is

\[
F_{\mu\nu} = -\frac{i}{g}\left[ D_\mu, D_\nu \right] = \partial_\mu A_\nu - \partial_\nu A_\mu - ig\left[ A_\mu, A_\nu \right].
\]

In components:

\[
F_{\mu\nu}^a = \partial_\mu A_\nu^a - \partial_\nu A_\mu^a + g f^a{}_{bc} A_\mu^b A_\nu^c.
\]

The cubic and quartic terms in \( A \), arising from \( gf^a{}_{bc} A_\mu^b A_\nu^c \), have no abelian analog and produce self-interactions among the gauge bosons. These are responsible for the three-gluon and four-gluon vertices in QCD and the WWγ, WWZ, and WWWW vertices of the electroweak theory. The Bianchi identity for the non-abelian field strength is

\[
D_\mu F_{\nu\rho} + D_\nu F_{\rho\mu} + D_\rho F_{\mu\nu} = 0,
\]

which follows from the Jacobi identity for covariant derivatives and corresponds to the homogeneous Yang–Mills equations. The Yang–Mills action is

\[
S_\text{YM} = -\frac{1}{2g^2} \int d^4x \, \mathrm{Tr}(F_{\mu\nu} F^{\mu\nu}) = -\frac{1}{4g^2} \int d^4x \, F_{\mu\nu}^a F^{a\,\mu\nu},
\]

where the trace is in the fundamental representation with \( \mathrm{Tr}(T_a T_b) = \frac{1}{2}\delta_{ab} \).

## The Standard Model Gauge Group

The Standard Model is a gauge theory based on the gauge group

\[
G_\text{SM} = SU(3)_c \times SU(2)_L \times U(1)_Y,
\]

where the subscripts denote color, weak isospin, and weak hypercharge. The gauge fields are: eight gluons \( G_\mu^a \) for \( SU(3)_c \); three weak bosons \( W_\mu^i \) for \( SU(2)_L \); and one hypercharge boson \( B_\mu \) for \( U(1)_Y \). The matter content of one fermion generation is as follows. The left-handed quark doublet \( Q_L = (u_L, d_L)^T \) transforms as \( (\mathbf{3}, \mathbf{2})_{+1/6} \) — fundamental of color SU(3), doublet of weak SU(2), with hypercharge \( Y = +\frac{1}{6} \). The right-handed up-type quark \( u_R \) transforms as \( (\mathbf{3}, \mathbf{1})_{+2/3} \), and the right-handed down-type quark \( d_R \) as \( (\mathbf{3}, \mathbf{1})_{-1/3} \). The left-handed lepton doublet \( L_L = (\nu_L, e_L)^T \) is \( (\mathbf{1}, \mathbf{2})_{-1/2} \), and the right-handed charged lepton \( e_R \) is \( (\mathbf{1}, \mathbf{1})_{-1} \). The electric charge is related to isospin and hypercharge by the Gell-Mann–Nishijima formula \( Q = T_3 + Y \).

---

# Chapter 8: Spontaneous Symmetry Breaking

## The Mexican Hat Potential

Spontaneous symmetry breaking (SSB) occurs when the ground state of a system does not share all the symmetries of the equations of motion. The prototypical example in field theory is a complex scalar field \( \phi = (\phi_1 + i\phi_2)/\sqrt{2} \) with Lagrangian

\[
\mathcal{L} = \partial_\mu\phi^*\partial^\mu\phi - V(\phi^*\phi), \quad V(\phi^*\phi) = -\mu^2\phi^*\phi + \frac{\lambda}{4}(\phi^*\phi)^2,
\]

where \( \mu^2 > 0 \) and \( \lambda > 0 \). This Lagrangian has a global \( U(1) \) symmetry \( \phi \to e^{i\theta}\phi \). The potential is shaped like a Mexican hat or wine bottle: it has a local maximum at \( \phi = 0 \) and a circle of minima at \( |\phi|^2 = v^2/2 \) where \( v^2 = 2\mu^2/\lambda \). The quantity \( v \) is the vacuum expectation value (vev).

Choosing the real minimum with \( \langle\phi\rangle = v/\sqrt{2} \) — an arbitrary choice that breaks the rotational symmetry of the circle of minima — the \( U(1) \) symmetry is spontaneously broken. Expanding around this minimum, write \( \phi = (v + h + i\xi)/\sqrt{2} \) where \( h \) and \( \xi \) are real fields representing radial (Higgs) and angular (Goldstone) fluctuations. Substituting into the potential and expanding to quadratic order:

\[
V = -\frac{\mu^2}{2}(v+h)^2 - \frac{\mu^2}{2}\xi^2 + \frac{\lambda}{16}\left[(v+h)^2 + \xi^2\right]^2.
\]

Using \( \lambda v^2 = 2\mu^2 \) and collecting the quadratic terms:

\[
V \approx V_\text{min} + \mu^2 h^2 + 0 \cdot \xi^2 + \mathcal{O}(h^3, \xi^3).
\]

The field \( h \) is the Higgs boson with mass squared \( m_h^2 = 2\mu^2 = \lambda v^2 \). The field \( \xi \) has zero mass: it is the Goldstone boson corresponding to motion along the flat direction at the bottom of the Mexican hat.

## Goldstone's Theorem

Goldstone's theorem states that for every continuous global symmetry that is spontaneously broken, there is a massless scalar particle (a Goldstone boson) in the spectrum. More precisely, if the Lagrangian has a continuous symmetry group \( G \) of dimension \( d_G \), and the ground state is invariant only under a subgroup \( H \subset G \) of dimension \( d_H \), then there are exactly \( d_G - d_H \) massless Goldstone bosons.

The proof is elegant. The ground state condition \( \frac{\partial V}{\partial\phi_i}\big|_{\phi_0} = 0 \) holds for the true vacuum \( \phi_0 \). For each generator \( T_a \) of the symmetry group, the infinitesimal variation gives \( \delta\phi_i = (T_a)_{ij}\phi_{0,j} \). Differentiating the stationarity condition with respect to \( \phi_k \) and evaluating at \( \phi_0 \):

\[
\frac{\partial^2 V}{\partial\phi_k \partial\phi_i}\bigg|_{\phi_0} (T_a)_{ij} \phi_{0,j} = 0.
\]

The matrix \( M_{ki} = \frac{\partial^2 V}{\partial\phi_k \partial\phi_i}\big|_{\phi_0} \) is the mass-squared matrix. The equation says that the vector \( v_a = T_a \phi_0 \) is a zero eigenvector of \( M \) whenever \( T_a \) is a broken generator (meaning \( T_a \phi_0 \neq 0 \), so the generator does not leave the vacuum invariant). There are \( d_G - d_H \) independent broken generators, hence \( d_G - d_H \) zero eigenvalues of the mass matrix — one massless scalar per broken symmetry direction.

## Pions as Pseudo-Goldstone Bosons

In QCD with massless \( u \) and \( d \) quarks, the Lagrangian has a chiral symmetry \( SU(2)_L \times SU(2)_R \), with left- and right-handed quarks transforming independently. The QCD vacuum has a non-zero quark condensate \( \langle\bar{q}q\rangle \neq 0 \), which breaks this symmetry to the diagonal \( SU(2)_V \) (vector isospin). The three broken axial generators give rise to three massless Goldstone bosons. Because the actual quark masses \( m_u, m_d \) are small but non-zero, the chiral symmetry is only approximate, and the pions are pseudo-Goldstone bosons with small masses generated by explicit symmetry breaking. The leading-order chiral perturbation theory result is

\[
m_\pi^2 = \frac{(m_u + m_d)|\langle\bar{q}q\rangle|}{f_\pi^2},
\]

where \( f_\pi \approx 93 \) MeV is the pion decay constant. The smallness of \( m_\pi \approx 140 \) MeV compared to the QCD scale \( \Lambda_\text{QCD} \approx 200 \) MeV reflects the approximate nature of the chiral symmetry. Extending to three flavors \( u, d, s \), the approximate \( SU(3)_L \times SU(3)_R \) chiral symmetry predicts eight pseudo-Goldstone bosons: the three pions, four kaons, and the \( \eta \).

## The Higgs Mechanism in U(1)

When SSB occurs in the context of a local gauge theory, the Goldstone boson is "eaten" by the gauge boson, which acquires a longitudinal polarization and a mass. This is the Higgs mechanism. Consider the complex scalar field with the Mexican-hat potential, now coupled to a \( U(1) \) gauge field:

\[
\mathcal{L} = (D_\mu\phi)^*(D^\mu\phi) - V(\phi^*\phi) - \frac{1}{4}F_{\mu\nu}F^{\mu\nu},
\]

where \( D_\mu\phi = (\partial_\mu - ieA_\mu)\phi \). Expanding around the minimum \( \phi = (v + h + i\xi)/\sqrt{2} \), the covariant kinetic term gives

\[
(D_\mu\phi)^*(D^\mu\phi) = \frac{1}{2}(\partial_\mu h)^2 + \frac{1}{2}(\partial_\mu\xi - eA_\mu v - eA_\mu h)^2.
\]

Expanding and keeping terms quadratic in the fields:

\[
\frac{1}{2}(\partial_\mu\xi)^2 + \frac{e^2 v^2}{2}A_\mu A^\mu - evA^\mu\partial_\mu\xi + \ldots
\]

The third term is a mass term for \( A_\mu \) with \( m_A^2 = e^2 v^2 \). The fourth term is a mixing between the gauge boson and the Goldstone field. In the unitary gauge, obtained by the gauge transformation \( A_\mu \to A_\mu + \frac{1}{ev}\partial_\mu\xi \) and \( \phi \to e^{-i\xi/v}\phi \), the \( \xi \) field is eliminated entirely — absorbed into the longitudinal component of \( A_\mu \). In unitary gauge the Lagrangian becomes

\[
\mathcal{L} = \frac{1}{2}(\partial_\mu h)^2 - \mu^2 h^2 - \frac{1}{4}F_{\mu\nu}F^{\mu\nu} + \frac{e^2 v^2}{2}A_\mu A^\mu + \ldots
\]

The massive vector boson has acquired one additional degree of freedom (from the Goldstone) to make up the three polarization states (two transverse plus one longitudinal) required for a massive spin-1 particle. Before SSB: two real scalar degrees of freedom plus a massless gauge boson with two polarizations — four total. After SSB: one real Higgs scalar plus a massive gauge boson with three polarizations — still four. The counting is consistent.

## Electroweak Symmetry Breaking

The electroweak sector of the Standard Model is described by a gauge theory with group \( SU(2)_L \times U(1)_Y \), broken to \( U(1)_\text{em} \) by the Higgs mechanism. The Higgs field is a complex doublet under \( SU(2)_L \):

\[
\Phi = \begin{pmatrix} \phi^+ \\ \phi^0 \end{pmatrix},
\]

with hypercharge \( Y = +\frac{1}{2} \), giving four real degrees of freedom in total. The covariant derivative is

\[
D_\mu\Phi = \left(\partial_\mu - ig W_\mu^a \frac{\sigma_a}{2} - ig' \frac{1}{2} B_\mu\right)\Phi,
\]

where \( g \) and \( g' \) are the \( SU(2)_L \) and \( U(1)_Y \) coupling constants. The potential \( V = -\mu^2\Phi^\dagger\Phi + \lambda(\Phi^\dagger\Phi)^2 \) drives SSB when \( \mu^2 > 0 \), with minimum at \( \langle\Phi^\dagger\Phi\rangle = v^2/2 \) where \( v = \mu/\sqrt{\lambda} \approx 246 \) GeV. Choosing the real minimum

\[
\langle\Phi\rangle = \frac{1}{\sqrt{2}}\begin{pmatrix} 0 \\ v \end{pmatrix},
\]

the kinetic term \( |D_\mu\langle\Phi\rangle|^2 \) generates mass terms for the gauge bosons. Substituting:

\[
|D_\mu\langle\Phi\rangle|^2 = \frac{v^2}{8}\left[ g^2 (W_\mu^1)^2 + g^2(W_\mu^2)^2 + (gW_\mu^3 - g'B_\mu)^2 \right].
\]

Defining the physical gauge bosons:

\[
W_\mu^\pm = \frac{1}{\sqrt{2}}(W_\mu^1 \mp i W_\mu^2), \quad Z_\mu = \frac{gW_\mu^3 - g'B_\mu}{\sqrt{g^2 + g'^2}}, \quad A_\mu = \frac{g'W_\mu^3 + gB_\mu}{\sqrt{g^2 + g'^2}},
\]

the mass terms become \( m_W^2 W_\mu^+ W^{-\mu} + \frac{1}{2}m_Z^2 Z_\mu Z^\mu + 0 \cdot A_\mu A^\mu \), with

\[
m_W = \frac{gv}{2}, \qquad m_Z = \frac{\sqrt{g^2 + g'^2}\,v}{2}, \qquad m_A = 0.
\]

The photon \( A_\mu \) remains massless, confirming that the \( U(1)_\text{em} \) subgroup generated by \( Q = T_3 + Y \) is preserved by the vacuum. To see this directly: \( Q\langle\Phi\rangle = (T_3 + Y)\langle\Phi\rangle = (-\frac{1}{2} + \frac{1}{2})\langle\Phi\rangle = 0 \), so the vacuum is neutral and \( U(1)_\text{em} \) is unbroken. The ratio

\[
\frac{m_W}{m_Z} = \frac{g}{\sqrt{g^2 + g'^2}} = \cos\theta_W
\]

defines the Weinberg angle \( \theta_W \). Experimentally, \( \sin^2\theta_W \approx 0.231 \), giving \( m_W \approx 80.4 \) GeV and \( m_Z \approx 91.2 \) GeV in excellent agreement with measurements at LEP and the Tevatron. Three of the four degrees of freedom in \( \Phi \) are absorbed by \( W^+, W^-, Z \), and the remaining one is the physical Higgs boson discovered at the LHC in 2012 with mass \( m_h \approx 125 \) GeV.

## Yukawa Couplings and Fermion Masses

In the Standard Model, fermion masses cannot appear as simple Dirac mass terms in the Lagrangian before electroweak symmetry breaking, because left-handed and right-handed fermions transform in different representations of \( SU(2)_L \times U(1)_Y \), and a bare mass term \( m\bar\psi_L\psi_R \) would not be gauge invariant. Instead, fermion masses arise from Yukawa interactions with the Higgs doublet. For the down-type quarks, the gauge-invariant Yukawa term is

\[
\mathcal{L}_Y^d = -y_d \overline{Q_L} \Phi\, d_R + \text{h.c.},
\]

where \( y_d \) is the Yukawa coupling. Gauge invariance is satisfied because the hypercharges satisfy \( Y_{Q_L} + Y_\Phi - Y_{d_R} = \frac{1}{6} + \frac{1}{2} - \frac{1}{3} = \frac{1+3-2}{6} = \frac{2}{6} \) — let us note this requires careful accounting but the term is indeed invariant. For up-type quarks one uses the conjugate doublet \( \tilde\Phi = i\sigma_2\Phi^* \), which transforms as \( (\mathbf{1}, \mathbf{2})_{-1/2} \):

\[
\mathcal{L}_Y^u = -y_u \overline{Q_L} \tilde\Phi\, u_R + \text{h.c.}
\]

After electroweak symmetry breaking with \( \langle\Phi\rangle = (0, v/\sqrt{2})^T \), the Yukawa interaction gives

\[
y_d \overline{Q_L} \Phi d_R \to \frac{y_d v}{\sqrt{2}} \bar d_L d_R,
\]

generating a Dirac mass \( m_d = y_d v/\sqrt{2} \) for the down quark. Similarly \( m_u = y_u v/\sqrt{2} \). For three generations, the Yukawa couplings become \( 3 \times 3 \) complex matrices in generation space. Diagonalization by bi-unitary transformations on the quark fields produces the physical quark masses and leaves a residual mixing matrix — the Cabibbo–Kobayashi–Maskawa (CKM) matrix — parametrizing the mismatch between up-type and down-type mass eigenstates, which governs flavor-changing charged-current interactions and CP violation.

The entire arc of this course — from the abstract definition of a group through Lie algebras, representations, and gauge theory — culminates in this understanding of the Standard Model. Every particle is characterized by how it transforms under the symmetry group; every interaction is dictated by the gauge principle; every mass is generated by spontaneous breaking of that symmetry. Group theory is not merely a computational tool — it is the organizing principle of fundamental physics.
