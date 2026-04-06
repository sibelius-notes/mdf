---
title: "PMATH 320: Euclidean Geometry"
prof: "Ben Webster"
subjects: "PMATH"
---

## Sources and References
**Primary references** — H.S.M. Coxeter, *Introduction to Geometry* (2nd ed., Wiley, 1969); Coxeter, *Regular Polytopes* (3rd ed., Dover, 1973)
**Supplementary texts** — Robin Hartshorne, *Geometry: Euclid and Beyond* (Springer, 2000); David Hilbert, *Foundations of Geometry* (trans. Townsend); Thomas Heath (trans.), *The Thirteen Books of Euclid's Elements*
**Online resources** — MIT OCW 18.783, Stanford lecture notes on discrete geometry, Keith Ball's survey on sphere packing (arXiv), Henry Cohn's notes on sphere packing and the kissing problem

---

# Chapter 1: Axioms

## 1.1 Euclid's Postulates

Geometry, as a deductive science, begins with Euclid's *Elements* (c. 300 BCE), one of the most influential mathematical texts ever written. The *Elements* comprise thirteen books covering plane geometry, number theory, and solid geometry, and were the dominant mathematical textbook in the Western world for over two thousand years. Euclid sought to derive all geometric truths from a minimal collection of self-evident starting points — a feat of intellectual architecture that set the template for axiomatic reasoning in all of mathematics. He identified five postulates and five "common notions" (general logical principles). The five postulates, paraphrased in modern language, are:

1. Any two distinct points can be joined by a straight line segment.
2. Any straight line segment can be extended indefinitely in a straight line.
3. Given any point and any distance, a circle can be drawn with that point as center and that distance as radius.
4. All right angles are equal to one another.
5. (**The Parallel Postulate**) If a straight line crossing two other straight lines makes the interior angles on one side sum to less than two right angles, then the two lines, if extended, meet on that side.

The first four postulates are short, local, and intuitively obvious. The fifth is conspicuously different: it is longer, it makes a claim about what happens when lines are extended arbitrarily far ("at infinity"), and it feels less like an axiom and more like a theorem waiting to be proved. This discomfort was noticed by Euclid himself — he delays using the fifth postulate as long as possible in the *Elements*, proving everything he can from the first four. This rhetorical choice is striking: Euclid seems to have sensed that the fifth postulate is on a different footing from the others.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 320 180" width="320" height="180" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="13">
  <!-- Top line (transversal cuts here) -->
  <line x1="10" y1="55" x2="310" y2="55" stroke="currentColor" stroke-width="1.5"/>
  <!-- Bottom line -->
  <line x1="10" y1="130" x2="310" y2="130" stroke="currentColor" stroke-width="1.5"/>
  <!-- Left angled line (converging) -->
  <line x1="60" y1="55" x2="155" y2="130" stroke="#999" stroke-width="1.5"/>
  <!-- Right angled line (converging) -->
  <line x1="220" y1="55" x2="155" y2="130" stroke="#999" stroke-width="1.5"/>
  <!-- Angle arcs -->
  <path d="M75,55 A15,15 0 0,1 63,63" fill="none" stroke="#e06" stroke-width="1.2"/>
  <path d="M208,55 A15,15 0 0,0 220,63" fill="none" stroke="#e06" stroke-width="1.2"/>
  <!-- Labels -->
  <text x="55" y="48" text-anchor="middle" fill="currentColor">α</text>
  <text x="232" y="48" text-anchor="middle" fill="currentColor">β</text>
  <!-- Intersection point label -->
  <circle cx="155" cy="130" r="3" fill="#c00"/>
  <text x="162" y="148" fill="currentColor" font-size="11">meet here if α+β &lt; 180°</text>
  <!-- Annotations -->
  <text x="160" y="170" text-anchor="middle" fill="currentColor" font-size="11">α + β &lt; 180° → lines converge on this side</text>
</svg>
</div>

The fifth postulate has a conspicuously different character from the other four. Its complexity led mathematicians for two millennia to attempt proving it from the first four alone — the great logical project of "proving the parallel postulate." The eventual realization that this is impossible — and that coherent geometries exist in which the fifth postulate fails — gave birth to **non-Euclidean geometry** in the 19th century. The story of this discovery is one of the great intellectual dramas in the history of mathematics.

Despite its foundational importance, Euclid's system has gaps by modern standards. He silently invokes facts about the continuity of lines and circles (for instance, that two circles with overlapping centers must intersect), and his notion of "betweenness" is never formally axiomatized. The constructions in Book I assume that intersection points always exist, a claim that cannot be deduced from his five postulates alone without additional continuity axioms. These gaps were not flaws of carelessness — Euclid was writing for an audience that took geometric intuition for granted — but they became important when, two millennia later, mathematicians tried to build the subject on purely logical foundations.

### 1.1.1 Two Thousand Years of Failed Proofs

The parallel postulate generated an extraordinary body of mathematics precisely because so many brilliant mathematicians were convinced it *must* be provable from the other four. The general strategy was to assume the negation of the fifth postulate and derive a contradiction. The problem was that the derivations often produced results that seemed bizarre — but not technically contradictory.

Among the notable attempts:

**Proclus (c. 450 CE)** argued, in his commentary on the *Elements*, that two lines at unequal distances from a third must eventually meet. His argument was circular: it assumed a version of the parallel postulate in order to prove it.

**Ibn al-Haytham (c. 1000 CE)** attempted a proof by considering a line segment that moves perpendicular to a fixed line. He claimed the endpoint traces a straight line — which is exactly the parallel postulate in disguise.

**Saccheri (1733)** wrote *Euclides ab Omni Naevo Vindicatus* ("Euclid Freed of Every Flaw"), making the most systematic attempt yet. He considered three cases for the angle sum of a quadrilateral: the "hypothesis of the right angle" (Euclidean geometry), the "hypothesis of the obtuse angle," and the "hypothesis of the acute angle." He correctly eliminated the obtuse angle hypothesis (it is inconsistent with Euclid's other axioms). He spent most of the book trying to eliminate the acute angle hypothesis — and produced dozens of theorems that are in fact *correct* in hyperbolic geometry. He was so close to discovering non-Euclidean geometry that the great Coxeter later wrote that "Saccheri unconsciously discovered non-Euclidean geometry."

**Lambert (1766)** pushed further, computing that in the "acute angle" geometry, the angle defect of a triangle is proportional to its area — a beautiful formula that is actually correct in hyperbolic geometry.

**Legendre (1794–1823)** made multiple attempts across decades, each time discovering a subtle error. His *Éléments de Géométrie* went through twelve editions with successive, flawed "proofs."

The resolution came in the 1820s. **Gauss** had privately concluded by around 1817 that the parallel postulate was independent, but he published nothing, reportedly fearing ridicule. **Bolyai** (Hungary, 1832) and **Lobachevsky** (Russia, 1830) independently published explicit constructions of consistent non-Euclidean geometries — what we now call hyperbolic geometry. In this geometry, through any point not on a given line, there are *infinitely many* lines parallel to the given line. Gauss wrote to Bolyai's father that he was "astonished and delighted" but had known this for years — a letter that (understandably) infuriated the younger Bolyai.

The rigorous confirmation that non-Euclidean geometry is consistent — that is, that it cannot be logically contradicted from within — came when **Beltrami (1868)** and **Klein (1871)** constructed explicit models of hyperbolic geometry within Euclidean geometry. If Euclidean geometry is consistent, so is hyperbolic geometry; thus the fifth postulate is genuinely independent of the first four.

### 1.1.2 A First-Principles Example: Proving the Base Angles Theorem

To appreciate the character of Euclidean reasoning, here is an example of a proof from Euclid's first principles (Book I, Proposition 5: "In isosceles triangles the angles at the base equal one another"). This is traditionally called the *pons asinorum* ("bridge of asses"), supposedly because students who could not cross this bridge of difficulty could make no further progress.

<div class="theorem">
<strong>Theorem (Pons Asinorum, Euclid I.5).</strong> Let \(\triangle ABC\) be a triangle with \(AB = AC\). Then the base angles satisfy \(\angle ABC = \angle ACB\).
</div>

<div class="proof">
<strong>Proof (modern version via SAS).</strong> Consider triangles \(\triangle ABC\) and \(\triangle ACB\). We have \(AB = AC\) (given), \(AC = AB\) (same, reversed), and the included angle \(\angle BAC = \angle CAB\) (same angle). By the SAS axiom (Hilbert's C6), the two triangles are congruent. Therefore the corresponding angles satisfy \(\angle ABC = \angle ACB\). \(\square\)
</div>

Euclid's original proof was considerably more elaborate, extending the equal sides and using auxiliary triangles. The modern proof via SAS is more efficient but relies on Hilbert's congruence axioms, which Euclid did not state explicitly. This illustrates the trade-off in axiom systems: more powerful axioms enable shorter proofs but require more justification at the foundational level.

## 1.2 Hilbert's Axiom System

David Hilbert, in his 1899 *Grundlagen der Geometrie* (*Foundations of Geometry*), provided a rigorous reformulation of Euclidean geometry. Hilbert was responding to the realization that Euclid's system, while mathematically productive for two millennia, was not logically complete by the standards of 19th-century rigor. The discovery of non-Euclidean geometry had sharpened everyone's sense that geometric axioms needed to be stated with complete precision. Hilbert's goal was to exhibit a set of axioms from which all of Euclidean geometry — and only Euclidean geometry — could be derived by pure logical deduction, with no appeal to intuition or diagrams.

Rather than appealing to intuition or physical diagrams, Hilbert's system builds the theory from undefined primitive notions — **points**, **lines**, and **planes** — along with three undefined relations: **incidence** (a point lies on a line), **betweenness** (a point lies between two others), and **congruence** (of segments and angles). Crucially, the "meanings" of these terms are entirely determined by the axioms — Hilbert famously remarked that one could replace "points, lines, and planes" with "tables, chairs, and beer mugs" and the proofs would still be valid. This radical separation of form from content is the hallmark of modern axiomatic mathematics.

From these undefined terms, Hilbert derived all of classical Euclidean geometry. His axioms fall into five groups:

**Axioms of Incidence (I1–I8).** Two distinct points determine a unique line. Three non-collinear points determine a unique plane. A line lying in a plane meets any other line in that plane at most once. And so on.

**Axioms of Order (B1–B4).** These formalize betweenness. If \(B\) lies between \(A\) and \(C\), then \(A\), \(B\), \(C\) are distinct collinear points and \(B\) lies between \(C\) and \(A\) as well. Given two points on a line, there exists a third point between them (density), and also a point such that one of the original points lies between the new point and the other (no endpoints). The crucial axiom here is **Pasch's axiom**: a line entering a triangle through one side must exit through one of the other two sides. This captures the intuitive fact that lines do not "jump over" triangles — something Euclid implicitly assumed but never stated.

**Axioms of Congruence (C1–C6).** These axioms allow us to "copy" segments and angles. Congruence of segments is an equivalence relation compatible with concatenation. Similarly for angles. The most important is C6: **SAS congruence** — if two sides and the included angle of one triangle are congruent to the corresponding parts of another triangle, the triangles are congruent. In classical treatments, SAS is often stated as a theorem proved by "superposition" (physically picking up one triangle and placing it on the other), but Hilbert recognized that superposition is not a legitimate logical operation and elevated SAS to the status of an axiom.

**The Axiom of Parallelism (P).** Through a point not on a given line, there exists exactly one line parallel to the given line. This is Hilbert's version of Euclid's fifth postulate, sometimes called **Playfair's axiom** (after the Scottish mathematician John Playfair, 1748–1819, who popularized this equivalent formulation). Dropping this axiom entirely yields a system compatible with both Euclidean and hyperbolic geometry (called **absolute geometry** or **neutral geometry**). Replacing it with "there are no parallel lines" (every pair of lines meets) yields **elliptic geometry** (modeled on the sphere with antipodal points identified).

**Axioms of Continuity (Archimedes and Completeness).** The **Archimedean axiom** states that given any two segments, some finite multiple of the smaller exceeds the larger — ruling out infinitely small or infinitely large segments. The **completeness axiom** (or Dedekind's axiom in some formulations) ensures that the geometric line is isomorphic to \(\mathbb{R}\) and that circles and lines intersect when expected. Without these axioms, one could construct "non-Archimedean" planes over hyperreal number fields — geometrically valid but containing infinitely small segments.

<div class="theorem">
<strong>Theorem (Hilbert).</strong> The system of Hilbert's axioms is consistent and categorical: up to isomorphism, the unique model satisfying all five groups of axioms is the Euclidean plane \(\mathbb{R}^2\) (or \(\mathbb{R}^3\) for the three-dimensional version).
</div>

This means that Euclidean geometry, properly axiomatized, has essentially one model. The parallel postulate, however, can be replaced by alternatives that yield hyperbolic or elliptic geometry — each internally consistent. Hilbert's work is the template for all modern axiomatic theories: give a list of axioms, prove the list is consistent (by exhibiting a model), and then derive theorems by pure logical deduction.

<div class="example">
<strong>Example (Pasch's Axiom in action).</strong> Consider triangle \(\triangle ABC\) and a line \(\ell\) that passes through a point \(D\) on side \(AB\) (strictly between \(A\) and \(B\)). Pasch's axiom guarantees that \(\ell\) must also intersect either side \(BC\) or side \(AC\). Without this axiom, a line could "enter" the triangle through one side and somehow disappear without exiting — an absurdity to intuition, but one that cannot be ruled out by Euclid's original five postulates alone.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 260 200" width="260" height="200" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="13">
  <!-- Triangle ABC -->
  <polygon points="130,20 30,170 230,170" fill="none" stroke="currentColor" stroke-width="1.5"/>
  <!-- Labels -->
  <text x="130" y="14" text-anchor="middle" fill="currentColor">C</text>
  <text x="18" y="175" text-anchor="middle" fill="currentColor">A</text>
  <text x="242" y="175" text-anchor="middle" fill="currentColor">B</text>
  <!-- Point D on AB -->
  <circle cx="130" cy="170" r="3" fill="currentColor"/>
  <text x="130" y="188" text-anchor="middle" fill="currentColor">D</text>
  <!-- Line ℓ entering at D and exiting through AC -->
  <line x1="55" y1="95" x2="190" y2="170" stroke="#c00" stroke-width="1.5" stroke-dasharray="5,3"/>
  <text x="175" y="92" fill="#c00" font-size="12">ℓ</text>
  <!-- Arrow indicating D -->
  <text x="130" y="158" text-anchor="middle" fill="currentColor" font-size="10">↑ ℓ enters</text>
  <text x="160" y="148" fill="currentColor" font-size="10">exits via AC or BC</text>
</svg>
</div>
</div>

## 1.3 Straightedge and Compass Constructions

The ancient Greek geometers were interested not merely in existence proofs but in explicit **constructions** using idealized tools. The two allowed tools are: a **straightedge** (an unmarked ruler, capable only of drawing the unique line through two given points — notably *not* capable of measuring distances) and a **compass** (capable of drawing a circle given a center and a point on the circumference, or equivalently given a center and a radius equal to a given segment). The restriction to these two tools — and only these — was a philosophical as well as a practical choice: the Greeks prized constructions that required no measurement, only the primitive operations of joining points and finding intersections.

A point is **constructible** if it can be obtained from a given set of points by finitely many straightedge-and-compass operations. These operations are:

1. Draw the line through two constructed points and take its intersection with an already-constructed line.
2. Draw a circle with center at a constructed point and radius equal to the distance between two constructed points, and take its intersection with another constructed circle or line.

Starting from just two points (conventionally taken at distance 1 apart, establishing the unit length), one generates a progressively richer set of points. The algebraic content of these operations is captured by the following classical result due to Pierre Wantzel, a French mathematician who, at age 23, resolved two of antiquity's most famous open problems in a single paper.

<div class="theorem">
<strong>Theorem (Wantzel, 1837).</strong> A real number \(\alpha\) is constructible from the rationals if and only if \(\alpha\) lies in a field extension \(\mathbb{Q} \subseteq K\) where \([K : \mathbb{Q}] = 2^n\) for some non-negative integer \(n\). Equivalently, \(\alpha\) is constructible if and only if it lies in a tower of quadratic extensions of \(\mathbb{Q}\).
</div>

The key insight is that each straightedge-or-compass operation introduces at most one new "square root." Intersecting two lines gives a rational combination of the coordinates of the known points. Intersecting a line with a circle, or two circles with each other, gives at most a quadratic extension of the current field. Therefore, after \(n\) operations, the coordinates of any constructed point lie in a field of degree at most \(2^n\) over \(\mathbb{Q}\). Conversely, any number in a tower of quadratic extensions can be constructed step by step.

This theorem immediately resolves three classical problems that puzzled antiquity for two thousand years:

- **Doubling the cube** (*Delian problem*): Given a cube with side length 1 and volume 1, construct a cube with volume 2. This requires a side of length \(2^{1/3}\). The minimal polynomial of \(2^{1/3}\) over \(\mathbb{Q}\) is \(x^3 - 2\), which is irreducible of degree 3. Since 3 is not a power of 2, \(2^{1/3}\) does not lie in any tower of quadratic extensions of \(\mathbb{Q}\). Hence **doubling the cube is impossible** with straightedge and compass alone.

- **Trisecting an arbitrary angle**: To trisect 60°, we need \(\cos 20°\). The triple angle formula gives \(\cos 60° = 4\cos^3 20° - 3\cos 20° = 1/2\), so \(\cos 20°\) satisfies \(8x^3 - 6x - 1 = 0\). This polynomial is irreducible over \(\mathbb{Q}\) (it has no rational roots), so \(\cos 20°\) lies in a cubic extension of \(\mathbb{Q}\), not a tower of quadratic extensions. Hence **trisecting a general angle is impossible**.

- **Squaring the circle**: Construct a square with the same area as a given unit circle, i.e., construct \(\sqrt{\pi}\). Since \(\pi\) is transcendental (Lindemann, 1882), \(\sqrt{\pi}\) cannot lie in any algebraic extension of \(\mathbb{Q}\), let alone a tower of quadratic extensions. Hence **squaring the circle is impossible**.

<div class="example">
<strong>Example (Why \(\sqrt[3]{2}\) is not constructible — traced step by step).</strong>

The field generated by straightedge-and-compass operations starting from \(\{0, 1\}\) on the real line is the set of all numbers constructible over \(\mathbb{Q}\). This field is closed under \(+, -, \times, \div\), and \(\sqrt{\phantom{x}}\) (taking square roots of non-negative elements). So constructible numbers include \(\sqrt{2}, \sqrt{3}, \sqrt{2 + \sqrt{3}}, \sqrt[4]{5}\), and so on — anything built from rationals by nested square roots.

Now, \(\alpha = \sqrt[3]{2}\) has minimal polynomial \(m(x) = x^3 - 2\) over \(\mathbb{Q}\). If \(\alpha\) were constructible, it would lie in some tower \(\mathbb{Q} = F_0 \subseteq F_1 \subseteq \cdots \subseteq F_n\) with \([F_{i+1} : F_i] = 2\) for each \(i\). Then \([F_n : \mathbb{Q}] = 2^n\). But \([\mathbb{Q}(\alpha) : \mathbb{Q}] = \deg m = 3\), and since \(\mathbb{Q}(\alpha) \subseteq F_n\), the degree \([F_n : \mathbb{Q}(\alpha)]\) must be an integer, so \(3 \mid 2^n\) — impossible, since 3 does not divide any power of 2. Contradiction. So \(\sqrt[3]{2} \notin F_n\) for any \(n\), and the cube cannot be doubled by straightedge and compass.
</div>

### 1.3.1 A Worked Construction: Bisecting an Angle

On the positive side, many constructions are possible. Here is the classic construction for **bisecting an angle** \(\angle BAC\), which was known to Euclid (Book I, Proposition 9).

**Given:** An angle \(\angle BAC\) with vertex at \(A\).

**Construction:**
1. With center \(A\), draw a circle of arbitrary radius. Let it meet ray \(AB\) at \(D\) and ray \(AC\) at \(E\).
2. With center \(D\) and radius \(DE\), draw a circle. With center \(E\) and radius \(DE\), draw another circle. Let these two circles meet at point \(F\) (on the interior side of the angle).
3. Draw ray \(AF\). This is the angle bisector.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 300 200" width="300" height="200" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="13">
  <!-- Vertex A -->
  <circle cx="60" cy="110" r="3" fill="currentColor"/>
  <text x="46" y="114" fill="currentColor">A</text>
  <!-- Ray AB (upper) -->
  <line x1="60" y1="110" x2="160" y2="30" stroke="currentColor" stroke-width="1.5"/>
  <text x="165" y="28" fill="currentColor">B</text>
  <!-- Ray AC (lower) -->
  <line x1="60" y1="110" x2="270" y2="110" stroke="currentColor" stroke-width="1.5"/>
  <text x="274" y="114" fill="currentColor">C</text>
  <!-- Point D on AB -->
  <circle cx="115" cy="68" r="3" fill="currentColor"/>
  <text x="120" y="66" fill="currentColor">D</text>
  <!-- Point E on AC -->
  <circle cx="185" cy="110" r="3" fill="currentColor"/>
  <text x="188" y="126" fill="currentColor">E</text>
  <!-- Circle around A (arc through D and E) -->
  <circle cx="60" cy="110" r="75" fill="none" stroke="#88a" stroke-width="1" stroke-dasharray="4,3"/>
  <!-- Point F (intersection of circles centered at D and E) -->
  <circle cx="150" cy="135" r="3" fill="#c00"/>
  <text x="155" y="150" fill="#c00">F</text>
  <!-- Circles centered at D and E through F -->
  <circle cx="115" cy="68" r="70" fill="none" stroke="#777" stroke-width="1" stroke-dasharray="3,4"/>
  <circle cx="185" cy="110" r="70" fill="none" stroke="#777" stroke-width="1" stroke-dasharray="3,4"/>
  <!-- Bisector AF -->
  <line x1="60" y1="110" x2="200" y2="160" stroke="#c00" stroke-width="1.5"/>
  <text x="205" y="165" fill="#c00" font-size="11">bisector AF</text>
</svg>
</div>

**Why it works:** \(AD = AE\) (both radii of the first circle). \(DF = EF\) (both radii of the equal circles of step 2). \(AF = AF\) (common side). By SSS congruence, \(\triangle ADF \cong \triangle AEF\). Therefore \(\angle DAF = \angle EAF\), so \(AF\) bisects \(\angle DAE = \angle BAC\). \(\square\)

On the positive side, Gauss proved that the regular \(n\)-gon is constructible if and only if \(n = 2^a p_1 p_2 \cdots p_k\) where the \(p_i\) are distinct **Fermat primes** — primes of the form \(2^{2^m} + 1\). The known Fermat primes are 3, 5, 17, 257, and 65537. Gauss himself constructed the regular 17-gon at age 18, and this achievement was reportedly what convinced him to pursue mathematics rather than philology. Whether there are infinitely many Fermat primes is an open problem.

## 1.4 Origami Axioms: The Huzita-Hatori System

Paper folding — **origami** — gives a different and strictly more powerful construction system than straightedge and compass. The ancient Chinese and Japanese paper-folding traditions were primarily artistic, but their mathematical power was not recognized until the 20th century. The **Huzita-Hatori axioms** (named after Humiaki Huzita, who identified six axioms in 1991, and Koshiro Hatori, who added the seventh in 2003) describe the seven fundamental fold operations that are physically realizable with a flat sheet of paper:

- **H1.** Given two points, there is a fold passing through both.
- **H2.** Given two points, there is a fold that places one point onto the other.
- **H3.** Given two lines, there is a fold that places one line onto the other.
- **H4.** Given a point and a line, there is a fold perpendicular to the line passing through the point.
- **H5.** Given two points \(P_1, P_2\) and a line \(\ell\), there is a fold that places \(P_1\) onto \(\ell\) and passes through \(P_2\).
- **H6.** Given two points \(P_1, P_2\) and two lines \(\ell_1, \ell_2\), there is a fold that simultaneously places \(P_1\) onto \(\ell_1\) and \(P_2\) onto \(\ell_2\).
- **H7.** Given a point \(P\) and two lines \(\ell_1, \ell_2\), there is a fold that places \(P\) onto \(\ell_1\) and is perpendicular to \(\ell_2\).

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 500 335" width="500" height="335" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <!-- H1: fold through two points -->
  <text x="5" y="14" font-weight="bold" fill="currentColor">H1</text>
  <circle cx="42" cy="38" r="4" fill="currentColor"/>
  <text x="49" y="42" fill="currentColor">P1</text>
  <circle cx="78" cy="92" r="4" fill="currentColor"/>
  <text x="85" y="96" fill="currentColor">P2</text>
  <line x1="24" y1="14" x2="96" y2="116" stroke="#c00" stroke-width="1.5" stroke-dasharray="5,3"/>
  <text x="5" y="140" fill="currentColor" font-size="10">fold thru P1, P2</text>
  <!-- H2: perpendicular bisector fold -->
  <text x="130" y="14" font-weight="bold" fill="currentColor">H2</text>
  <circle cx="148" cy="58" r="4" fill="currentColor"/>
  <text x="155" y="52" fill="currentColor">P1</text>
  <circle cx="232" cy="58" r="4" fill="currentColor"/>
  <text x="236" y="52" fill="currentColor">P2</text>
  <line x1="148" y1="58" x2="232" y2="58" stroke="#777" stroke-width="1"/>
  <line x1="190" y1="16" x2="190" y2="115" stroke="#c00" stroke-width="1.5" stroke-dasharray="5,3"/>
  <circle cx="190" cy="58" r="2.5" fill="#c00"/>
  <text x="125" y="140" fill="currentColor" font-size="10">⊥ bisector of P1P2</text>
  <!-- H3: ℓ1 and ℓ2 symmetric about y=66; horizontal fold maps ℓ1 to ℓ2 -->
  <text x="255" y="14" font-weight="bold" fill="currentColor">H3</text>
  <line x1="257" y1="92" x2="363" y2="40" stroke="currentColor" stroke-width="1.5"/>
  <text x="365" y="44" fill="currentColor" font-size="11">ℓ1</text>
  <line x1="257" y1="40" x2="363" y2="92" stroke="#999" stroke-width="1.5"/>
  <text x="365" y="96" fill="currentColor" font-size="11">ℓ2</text>
  <line x1="255" y1="66" x2="365" y2="66" stroke="#c00" stroke-width="1.5" stroke-dasharray="5,3"/>
  <text x="252" y="140" fill="currentColor" font-size="10">fold maps ℓ1 → ℓ2</text>
  <!-- H4: fold perpendicular to ℓ through P -->
  <text x="380" y="14" font-weight="bold" fill="currentColor">H4</text>
  <line x1="378" y1="60" x2="495" y2="60" stroke="currentColor" stroke-width="1.5"/>
  <text x="497" y="64" fill="currentColor" font-size="11">ℓ</text>
  <circle cx="435" cy="98" r="4" fill="currentColor"/>
  <text x="442" y="102" fill="currentColor">P</text>
  <line x1="435" y1="16" x2="435" y2="122" stroke="#c00" stroke-width="1.5" stroke-dasharray="5,3"/>
  <text x="378" y="140" fill="currentColor" font-size="10">fold ⊥ to ℓ thru P</text>
  <!-- H5: fold through P2 placing P1 onto ℓ -->
  <text x="5" y="179" font-weight="bold" fill="currentColor">H5</text>
  <line x1="5" y1="290" x2="158" y2="290" stroke="currentColor" stroke-width="1.5"/>
  <text x="160" y="294" fill="currentColor" font-size="11">ℓ</text>
  <circle cx="38" cy="200" r="4" fill="currentColor"/>
  <text x="45" y="204" fill="currentColor">P1</text>
  <circle cx="88" cy="248" r="4" fill="currentColor"/>
  <text x="95" y="252" fill="currentColor">P2</text>
  <line x1="12" y1="218" x2="148" y2="270" stroke="#c00" stroke-width="1.5" stroke-dasharray="5,3"/>
  <circle cx="112" cy="290" r="3" fill="#c00"/>
  <text x="5" y="318" fill="currentColor" font-size="10">thru P2, P1 → ℓ</text>
  <!-- H6: fold placing P1 onto ℓ1 and P2 onto ℓ2 simultaneously -->
  <text x="175" y="179" font-weight="bold" fill="currentColor">H6</text>
  <circle cx="202" cy="200" r="4" fill="currentColor"/>
  <text x="209" y="204" fill="currentColor">P1</text>
  <circle cx="312" cy="200" r="4" fill="currentColor"/>
  <text x="317" y="204" fill="currentColor">P2</text>
  <line x1="188" y1="228" x2="188" y2="295" stroke="currentColor" stroke-width="1.5"/>
  <text x="172" y="226" fill="currentColor" font-size="11">ℓ1</text>
  <line x1="326" y1="228" x2="326" y2="295" stroke="#999" stroke-width="1.5"/>
  <text x="329" y="226" fill="currentColor" font-size="11">ℓ2</text>
  <line x1="188" y1="268" x2="326" y2="248" stroke="#c00" stroke-width="1.5" stroke-dasharray="5,3"/>
  <text x="175" y="318" fill="currentColor" font-size="10">P1 → ℓ1 and P2 → ℓ2</text>
  <!-- H7: ℓ1 horizontal at y=268, ℓ2 vertical at x=440; fold horizontal at y=234 maps P→ℓ1 and is ⊥ ℓ2 -->
  <text x="348" y="179" font-weight="bold" fill="currentColor">H7</text>
  <line x1="340" y1="268" x2="492" y2="268" stroke="currentColor" stroke-width="1.5"/>
  <text x="494" y="272" fill="currentColor" font-size="11">ℓ1</text>
  <line x1="440" y1="185" x2="440" y2="298" stroke="#999" stroke-width="1.5"/>
  <text x="443" y="183" fill="currentColor" font-size="11">ℓ2</text>
  <circle cx="382" cy="200" r="4" fill="currentColor"/>
  <text x="389" y="204" fill="currentColor">P</text>
  <line x1="340" y1="234" x2="492" y2="234" stroke="#c00" stroke-width="1.5" stroke-dasharray="5,3"/>
  <circle cx="382" cy="268" r="3" fill="#c00"/>
  <text x="340" y="318" fill="currentColor" font-size="10">P → ℓ1, fold ⊥ ℓ2</text>
</svg>
</div>

Algebraically, H1–H5 reproduce everything constructible by straightedge and compass (quadratic extensions). The sixth axiom, H6, is especially powerful. It corresponds geometrically to finding a common tangent to two parabolas — an operation that can solve general cubic and quartic equations. Algebraically, the origami-constructible numbers include all numbers obtainable by a tower of field extensions of degree 2 or 3 over \(\mathbb{Q}\). This means that **the cube can be doubled** and **a general angle can be trisected** by origami, since the relevant cubics are solvable in this setting. For example, to trisect angle \(\theta\), one can reduce it to finding a root of \(4x^3 - 3x - \cos\theta = 0\) (from the triple angle formula), and H6 performs exactly the cubic-resolving fold.

<div class="example">
<strong>Example (Cube root via origami — Abe's trisection method).</strong> To construct \(\sqrt[3]{2}\) by origami: Start with a unit square. Mark points \(P_1 = (0, 1)\) and \(P_2 = (1/2, 0)\), and lines \(\ell_1: y = 0\) and \(\ell_2: x = -1\). Axiom H6 produces a fold placing \(P_1\) onto \(\ell_1\) and \(P_2\) onto \(\ell_2\) simultaneously. The fold line meets the edge of the paper at a point whose \(x\)-coordinate is \(\sqrt[3]{2}/2\), giving \(\sqrt[3]{2}\) by scaling. This construction, though intricate, is exact and physical.
</div>

<div class="remark">
<strong>Remark.</strong> Origami cannot solve all quintics (degree 5 polynomials), since not every quintic factors into quadratics and cubics over \(\mathbb{Q}\). Constructions involving degree-5 extensions require methods beyond the seven Huzita-Hatori axioms. However, origami can solve all quartics (since quartics are reducible to cubics and quadratics via the resolvent cubic), which means it strictly exceeds the power of straightedge and compass while still falling short of full algebraic closure.
</div>

---

# Chapter 2: Conic Sections

## 2.1 Classical Definitions

The **conic sections** — ellipse, parabola, and hyperbola — arise as the intersection of a plane with a right circular cone. This is their oldest definition, dating to **Apollonius of Perga** (c. 262–190 BCE), one of the greatest Greek mathematicians. Apollonius's eight-volume treatise *Conics* established most of the classical theory and introduced the terminology "ellipse," "parabola," and "hyperbola" (from Greek words meaning "deficiency," "equality," and "excess" — referring to the relationship between a certain square and a rectangle in the focal construction). The *Conics* were so comprehensive that the subject lay essentially dormant for fifteen centuries.

Depending on the angle that the cutting plane makes with the cone's axis, the intersection is:

- An **ellipse** if the plane meets the cone in a closed curve (the plane cuts all generators on one nappe, at an angle steeper than the generators themselves).
- A **parabola** if the plane is parallel to exactly one generator of the cone.
- A **hyperbola** if the plane cuts both nappes of the cone.

Degenerate cases (point, line, pair of lines) occur when the plane passes through the apex. The three non-degenerate cases are distinguished by a single continuous parameter — the angle of the cutting plane — which explains their deep unity. From the projective point of view (Section 2.4), they are literally the same curve viewed from different perspectives.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 380 260" width="380" height="260" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <defs>
    <marker id="arr" markerWidth="8" markerHeight="8" refX="4" refY="4" orient="auto">
      <path d="M0,0 L8,4 L0,8 Z" fill="currentColor"/>
    </marker>
  </defs>
  <!-- Cone axis -->
  <line x1="130" y1="10" x2="130" y2="250" stroke="#777" stroke-width="1" stroke-dasharray="4,3"/>
  <text x="136" y="248" fill="#aaa" font-size="10">axis</text>
  <!-- Apex -->
  <circle cx="130" cy="20" r="3" fill="currentColor"/>
  <text x="138" y="22" fill="currentColor">apex</text>
  <!-- Upper nappe left edge -->
  <line x1="130" y1="20" x2="30" y2="200" stroke="currentColor" stroke-width="1.5"/>
  <!-- Upper nappe right edge -->
  <line x1="130" y1="20" x2="230" y2="200" stroke="currentColor" stroke-width="1.5"/>
  <!-- Lower nappe (mirror) -->
  <line x1="130" y1="20" x2="30" y2="-40" stroke="currentColor" stroke-width="1" stroke-dasharray="4,3"/>
  <line x1="130" y1="20" x2="230" y2="-40" stroke="currentColor" stroke-width="1" stroke-dasharray="4,3"/>

  <!-- Ellipse plane (cuts upper nappe at angle) -->
  <ellipse cx="130" cy="95" rx="55" ry="14" fill="none" stroke="#2a7" stroke-width="2"/>
  <line x1="70" y1="95" x2="195" y2="95" stroke="#2a7" stroke-width="1" stroke-dasharray="3,2"/>
  <text x="240" y="98" fill="#2a7" font-size="12">ELLIPSE</text>

  <!-- Parabola plane (parallel to one generator) -->
  <line x1="55" y1="145" x2="235" y2="135" stroke="#e70" stroke-width="2"/>
  <text x="240" y="143" fill="#e70" font-size="12">PARABOLA</text>

  <!-- Hyperbola plane (cuts both nappes) -->
  <line x1="40" y1="185" x2="240" y2="175" stroke="#c00" stroke-width="2"/>
  <text x="245" y="183" fill="#c00" font-size="12">HYPERBOLA</text>

  <!-- Legend note -->
  <text x="10" y="248" fill="currentColor" font-size="10">Angle of cutting plane determines conic type</text>
</svg>
</div>

## 2.2 Focus-Directrix Definition

The cone-section definition is beautiful but not the most useful for computation. A unified and analytically powerful description of all three non-degenerate conics uses the **focus-directrix property**. Fix a point \(F\) (the **focus**) and a line \(\ell\) (the **directrix**) not passing through \(F\), and fix a positive constant \(e\) called the **eccentricity**. The conic is then the locus of points \(P\) such that

\[
\frac{d(P, F)}{d(P, \ell)} = e,
\]

where \(d(P, \ell)\) denotes the perpendicular distance from \(P\) to \(\ell\). This definition makes it transparent why the three cases are distinguished by a single number: the eccentricity \(e\) controls whether the focus is closer to, equal to, or farther from the directrix than from the curve.

<div class="definition">
<strong>Eccentricity classification</strong>: The locus is an <em>ellipse</em> if \(e < 1\), a <em>parabola</em> if \(e = 1\), and a <em>hyperbola</em> if \(e > 1\). A circle corresponds to the limiting case \(e = 0\) (and the directrix recedes to infinity).
</div>

Setting up coordinates with \(F\) at the origin and \(\ell\) the vertical line \(x = -d\), the focus-directrix condition yields the **polar equation** of a conic with focus at the origin:

\[
r = \frac{ed}{1 + e\cos\theta}.
\]

This single formula encompasses all three types by varying \(e\). It is the natural form for celestial mechanics: Kepler's first law states that planetary orbits are ellipses with the Sun at one focus, and the polar equation shows directly how the shape (eccentricity) controls the orbit's geometry. Earth's orbit has \(e \approx 0.0167\) (nearly circular); Halley's comet has \(e \approx 0.967\) (highly elliptical); a comet on a parabolic orbit (\(e = 1\)) escapes the solar system after one pass.

### 2.2.1 Deriving the Standard Ellipse Equation

The derivation of the standard Cartesian form of the ellipse from the focus-directrix definition illustrates the power of coordinates. Let the ellipse have eccentricity \(e < 1\), focus \(F = (c, 0)\) (with \(c > 0\)), and the corresponding directrix \(\ell: x = a/e\) (where \(a > 0\) is the semi-major axis, to be determined). The focus-directrix condition says: for a point \(P = (x, y)\) on the ellipse,

\[
\sqrt{(x - c)^2 + y^2} = e \cdot \left(\frac{a}{e} - x\right) = a - ex.
\]

Squaring both sides (both sides are positive since \(x < a/e\)):

\[
(x - c)^2 + y^2 = (a - ex)^2 = a^2 - 2aex + e^2 x^2.
\]

Expanding the left side: \(x^2 - 2cx + c^2 + y^2 = a^2 - 2aex + e^2 x^2\). Rearranging:

\[
x^2(1 - e^2) - 2x(c - ae) + y^2 = a^2 - c^2.
\]

Setting \(c = ae\) (so that the relation \(e = c/a\) holds by definition), the middle term vanishes:

\[
x^2(1 - e^2) + y^2 = a^2 - a^2e^2 = a^2(1 - e^2).
\]

Dividing by \(a^2(1-e^2)\) and setting \(b^2 = a^2(1-e^2) = a^2 - c^2\):

\[
\boxed{\frac{x^2}{a^2} + \frac{y^2}{b^2} = 1.}
\]

This is the standard form of the ellipse with semi-major axis \(a\) along the \(x\)-axis and semi-minor axis \(b\) along the \(y\)-axis. The ellipse has two foci at \((\pm c, 0)\) and two directrices at \(x = \pm a/e\).

<div class="example">
<strong>Example (Ellipse with given foci and major axis).</strong> Find the equation of the ellipse with foci at \((\pm 3, 0)\) and major axis of length 10.

<em>Solution.</em> The foci are at \((\pm 3, 0)\), so \(c = 3\). The major axis has length \(2a = 10\), so \(a = 5\). Then \(b^2 = a^2 - c^2 = 25 - 9 = 16\), so \(b = 4\). The eccentricity is \(e = c/a = 3/5 = 0.6\).

The ellipse equation is:
\[
\frac{x^2}{25} + \frac{y^2}{16} = 1.
\]

The ellipse passes through \((\pm 5, 0)\) on the \(x\)-axis and \((0, \pm 4)\) on the \(y\)-axis. The directrices are at \(x = \pm a/e = \pm 25/3 \approx \pm 8.33\).

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 300 220" width="300" height="220" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <!-- Ellipse x²/25 + y²/16 = 1, a=5, b=4, scaled: 1 unit = 28px, center at (150,110) -->
  <ellipse cx="150" cy="110" rx="140" ry="112" fill="none" stroke="#2255cc" stroke-width="2"/>
  <!-- Axes -->
  <line x1="10" y1="110" x2="290" y2="110" stroke="#777" stroke-width="1"/>
  <line x1="150" y1="5" x2="150" y2="215" stroke="#777" stroke-width="1"/>
  <!-- Foci F1=(-3,0) and F2=(3,0), scaled 28px/unit -->
  <circle cx="66" cy="110" r="4" fill="#c00"/>
  <text x="50" y="128" fill="#c00">F1</text>
  <text x="40" y="140" fill="currentColor" font-size="10">(-3,0)</text>
  <circle cx="234" cy="110" r="4" fill="#c00"/>
  <text x="238" y="128" fill="#c00">F2</text>
  <text x="228" y="140" fill="currentColor" font-size="10">(3,0)</text>
  <!-- Vertices -->
  <circle cx="10" cy="110" r="3" fill="currentColor"/>
  <text x="2" y="106" fill="currentColor" font-size="10">(-5,0)</text>
  <circle cx="290" cy="110" r="3" fill="currentColor"/>
  <text x="264" y="106" fill="currentColor" font-size="10">(5,0)</text>
  <circle cx="150" cy="-2" r="3" fill="currentColor"/>
  <text x="156" y="6" fill="currentColor" font-size="10">(0,4)</text>
  <circle cx="150" cy="222" r="3" fill="currentColor"/>
  <text x="156" y="218" fill="currentColor" font-size="10">(0,-4)</text>
  <!-- Label -->
  <text x="150" y="210" text-anchor="middle" fill="currentColor" font-size="11">a=5, b=4, c=3, e=3/5; PF1+PF2=10</text>
</svg>
</div>

An elegant alternative description: the ellipse is the set of points \(P\) such that \(PF_1 + PF_2 = 10\) (constant sum of distances to the two foci). This is the "gardener's construction" of an ellipse: fix two stakes at the foci, tie a string of length 10 between them, pull it taut with a pencil, and trace the path.
</div>

<div class="example">
<strong>Example (Labeled conic sections with ASCII art).</strong>

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 480 280" width="480" height="280" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- ELLIPSE (top-left) -->
  <ellipse cx="80" cy="80" rx="55" ry="40" fill="none" stroke="#2255cc" stroke-width="1.8"/>
  <circle cx="58" cy="80" r="3" fill="#c00"/><text x="42" y="78" fill="#c00">F1</text>
  <circle cx="102" cy="80" r="3" fill="#c00"/><text x="105" y="78" fill="#c00">F2</text>
  <text x="80" y="140" text-anchor="middle" fill="currentColor" font-size="10">Ellipse x²/25+y²/16=1</text>
  <text x="80" y="152" text-anchor="middle" fill="currentColor" font-size="9">a=5, b=4, e=0.6</text>

  <!-- PARABOLA (top-right) -->
  <line x1="280" y1="20" x2="280" y2="155" stroke="#777" stroke-width="1"/>
  <path d="M280,80 Q330,60 360,20 M280,80 Q330,100 360,155" fill="none" stroke="#e70" stroke-width="1.8"/>
  <circle cx="295" cy="80" r="3" fill="#c00"/>
  <text x="300" y="78" fill="#c00">F(2,0)</text>
  <line x1="265" y1="20" x2="265" y2="155" stroke="#777" stroke-width="1" stroke-dasharray="4,3"/>
  <text x="230" y="165" fill="currentColor" font-size="9">directrix x=-2</text>
  <text x="310" y="165" text-anchor="middle" fill="currentColor" font-size="10">Parabola y²=8x</text>

  <!-- HYPERBOLA (bottom-left) -->
  <line x1="80" y1="180" x2="80" y2="270" stroke="#777" stroke-width="1"/>
  <line x1="10" y1="225" x2="160" y2="225" stroke="#777" stroke-width="1"/>
  <!-- Left branch -->
  <path d="M35,185 Q55,220 35,265" fill="none" stroke="#e33" stroke-width="1.8"/>
  <!-- Right branch -->
  <path d="M125,185 Q105,220 125,265" fill="none" stroke="#e33" stroke-width="1.8"/>
  <circle cx="55" cy="225" r="3" fill="#c00"/><text x="36" y="222" fill="#c00" font-size="9">F1</text>
  <circle cx="105" cy="225" r="3" fill="#c00"/><text x="108" y="222" fill="#c00" font-size="9">F2</text>
  <text x="80" y="280" text-anchor="middle" fill="currentColor" font-size="10">Hyperbola x²/9−y²/16=1</text>

  <!-- CIRCLE (bottom-right) -->
  <circle cx="380" cy="225" r="50" fill="none" stroke="#2a7" stroke-width="1.8"/>
  <circle cx="380" cy="225" r="3" fill="#c00"/><text x="385" y="228" fill="#c00">O</text>
  <text x="380" y="280" text-anchor="middle" fill="currentColor" font-size="10">Circle x²+y²=25</text>
  <text x="380" y="292" text-anchor="middle" fill="currentColor" font-size="9">e=0 (degenerate ellipse)</text>
</svg>
</div>
</div>

## 2.3 Reflective Properties

Each conic has a remarkable **reflective property** that has practical applications in optics and engineering. These properties are beautiful theorems, but they also have an elegant unified explanation: they all follow from the optical principle that light travels in straight lines and reflects at equal angles, combined with the focal characterizations of the conics.

<div class="theorem">
<strong>Theorem (Ellipse reflection).</strong> A ray of light emanating from one focus of an ellipse, after reflecting off the ellipse, passes through the other focus.
</div>

<div class="theorem">
<strong>Theorem (Parabola reflection).</strong> A ray of light parallel to the axis of a parabola, after reflecting off the parabola, passes through the focus. Conversely, a ray from the focus reflects parallel to the axis.
</div>

<div class="theorem">
<strong>Theorem (Hyperbola reflection).</strong> A ray directed toward one focus of a hyperbola, after reflecting off the nearer branch, proceeds as if it came from the other focus.
</div>

These reflective properties are not merely aesthetically pleasing — they are foundational to entire technologies. The parabola property is the basis of **parabolic reflectors** used in satellite dishes, telescope mirrors, and flashlight reflectors: parallel incoming rays (from a distant star or signal) all converge to the focus, which is why parabolic dishes have such a concentration of signal. The ellipse property underlies **elliptical billiard tables**: a ball shot from one focus will always pass through the other focus after one bounce, regardless of direction. The hyperbola property is used in Cassegrain reflectors (a type of telescope combining a parabolic primary mirror with a hyperbolic secondary mirror).

**Proof sketch (parabola).** Let \(P = (x_0, y_0)\) be a point on the parabola \(y^2 = 4px\). The focus is at \(F = (p, 0)\) and the directrix is \(x = -p\). The tangent line at \(P\) has slope \(dy/dx = 2p/y_0\) (by implicit differentiation). The line \(PF\) has slope \((y_0 - 0)/(x_0 - p) = y_0/(x_0 - p)\). The angle that \(PF\) makes with the tangent equals the angle that the horizontal (parallel to axis) makes with the tangent — this can be verified using the angle bisector formula and the fact that, for a point on the parabola, the distance to the focus equals the distance to the directrix: \(PF = x_0 + p = d(P, \ell)\). The equality of distances is the essence of the equal-angle law.

<div class="example">
<strong>Example (Billiard ball on an elliptical table).</strong> Consider the ellipse \(x^2/25 + y^2/16 = 1\), with foci at \(F_1 = (-3, 0)\) and \(F_2 = (3, 0)\). A ball is shot from \(F_1\) at an angle of \(45°\) above the horizontal. Where does it hit the ellipse, and in what direction does it travel after bouncing?

<em>Solution.</em> The ray from \(F_1 = (-3, 0)\) at \(45°\) has the equation \(y = x + 3\). Substituting into the ellipse: \(x^2/25 + (x+3)^2/16 = 1\), which gives \(16x^2 + 25(x+3)^2 = 400\), i.e., \(41x^2 + 150x + 225 - 400 = 0\), so \(41x^2 + 150x - 175 = 0\). Using the quadratic formula: \(x = (-150 \pm \sqrt{22500 + 28700})/82 = (-150 \pm \sqrt{51200})/82\). The positive root gives approximately \(x \approx 0.91\), \(y \approx 3.91\). By the ellipse reflection theorem, after bouncing at this point, the ball travels toward \(F_2 = (3, 0)\).
</div>

## 2.4 Second-Degree Curves and Projective Unification

In Cartesian coordinates, any **non-degenerate conic** is the zero set of a quadratic polynomial:

\[
Ax^2 + Bxy + Cy^2 + Dx + Ey + F = 0.
\]

The type is determined by the **discriminant** \(\Delta = B^2 - 4AC\):
- \(\Delta < 0\): ellipse (or circle if \(A = C\) and \(B = 0\)).
- \(\Delta = 0\): parabola.
- \(\Delta > 0\): hyperbola.

This algebraic classification corresponds precisely to the geometric one. The discriminant measures, in effect, whether the conic meets the "line at infinity" in real or complex points — a fact made precise by projective geometry.

From the perspective of **projective geometry**, all non-degenerate conics are equivalent under projective transformations. In the projective plane \(\mathbb{P}^2\), an ellipse and a hyperbola differ only in how they meet the **line at infinity**: the ellipse meets it in two complex conjugate points, the hyperbola in two real points, and the parabola is tangent to the line at infinity at one real point. This unification is one of the great insights of 19th-century geometry, due in part to Poncelet and later to Cayley and Klein. Geometrically, the difference between an ellipse and a hyperbola is "merely" whether two invisible points (at infinity) are real or complex — a distinction that disappears over the complex numbers.

<div class="example">
<strong>Example.</strong> The circle \(x^2 + y^2 = 1\) and the ellipse \(\frac{x^2}{4} + y^2 = 1\) are projectively equivalent — both are smooth conics in \(\mathbb{P}^2\). A projective transformation carries one to the other. Similarly, the hyperbola \(xy = 1\) and the standard hyperbola \(x^2 - y^2 = 1\) are projectively equivalent: the map \((x,y) \mapsto ((x+y)/\sqrt{2}, (x-y)/\sqrt{2})\) carries one to the other. Over \(\mathbb{C}\), all smooth conics are projectively equivalent — even the ellipse and hyperbola become the same curve.
</div>

<div class="remark">
<strong>Remark (Apollonius and the history of conics).</strong> Apollonius of Perga introduced all three names — ellipse, parabola, hyperbola — in his *Conics* around 200 BCE. He derived most of the focal properties, the construction of tangents, and the relationships between the three types. His work was so complete that, apart from the projective unification discovered in the 17th–19th centuries, the classical theory of conics was essentially finished by Apollonius. Newton used conic sections to derive Kepler's laws from his inverse-square law of gravitation, and the same elliptic orbits appear in Einstein's general relativity (to first approximation). The enduring relevance of a 2200-year-old mathematical theory is remarkable.
</div>

---

# Chapter 3: Polytopes

## 3.1 Regular Polygons and Schläfli Symbols

A **polygon** is a closed planar figure bounded by straight line segments. A polygon is **regular** if all its sides are equal in length and all its interior angles are equal. The regular polygon with \(n\) sides is denoted \(\{n\}\) in the **Schläfli symbol** notation (introduced by Ludwig Schläfli, Swiss geometer, 1814–1895), and has interior angle

\[
\alpha_n = \frac{(n-2) \cdot 180°}{n}.
\]

This formula has a simple derivation: the sum of interior angles of any convex \(n\)-gon is \((n-2) \cdot 180°\) (divide the polygon into \(n-2\) triangles from one vertex), so each angle in the regular case is \((n-2) \cdot 180°/n\).

For \(n \geq 3\), regular \(n\)-gons exist for every integer \(n\). The interior angle increases from \(60°\) (equilateral triangle \(\{3\}\)) toward \(180°\) as \(n \to \infty\). The regular hexagon \(\{6\}\) has interior angle exactly \(120°\), which is why hexagons tile the plane: three hexagons meet at each vertex, contributing \(3 \times 120° = 360°\), exactly filling the angle around a point.

<div class="example">
<strong>Example (Interior angles of regular polygons).</strong>

| Polygon | \(n\) | Interior angle \(\alpha_n\) |
|---------|-------|---------------------------|
| Triangle | 3 | 60° |
| Square | 4 | 90° |
| Pentagon | 5 | 108° |
| Hexagon | 6 | 120° |
| Heptagon | 7 | \(\approx 128.57°\) |
| Octagon | 8 | 135° |
| Decagon | 10 | 144° |
| Dodecagon | 12 | 150° |
| \(n\)-gon | \(n\) | \(\frac{(n-2) \cdot 180°}{n}\) |

Note: as \(n \to \infty\), \(\alpha_n \to 180°\), and the polygon approaches a circle.
</div>

## 3.2 Star Polygons

The Schläfli symbol can be extended to **star polygons** \(\{n/k\}\), where \(n\) and \(k\) are integers with \(1 < k < n/2\) and \(\gcd(n, k) = 1\). The star polygon \(\{n/k\}\) is formed by connecting every \(k\)-th vertex of a regular \(n\)-gon. These are not convex polygons but self-intersecting ones, and they form the faces of the star polyhedra (Kepler-Poinsot solids) and appear in Islamic geometric art.

<div class="example">
<strong>Example.</strong> The pentagram \(\{5/2\}\) is formed by connecting every second vertex of a regular pentagon. The Star of David consists of two overlapping triangles, but the star polygon \(\{6/2\}\) is usually excluded since \(\gcd(6,2) = 2\); instead one considers it as a compound. The star polygon \(\{8/3\}\) is the eight-pointed star obtained from a regular octagon by connecting every third vertex.
</div>

If \(\gcd(n, k) = d > 1\), the result is a **compound** of \(d\) copies of \(\{n/d\}\), not a single connected star polygon. The figure \(\{6/2\}\), for instance, is the compound of two triangles.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 420 200" width="420" height="200" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <!-- {5/2} Pentagram: connect every 2nd vertex of regular pentagon -->
  <!-- vertices at angles 90,162,234,306,378 degrees, radius 60, center (70,95) -->
  <g transform="translate(70,95)">
    <polygon points="0,-60 57,18 -35,48 -35,-48 57,-18"
      fill="none" stroke="#2255cc" stroke-width="1.8"/>
    <text x="0" y="80" text-anchor="middle" fill="currentColor">{5/2} pentagram</text>
    <text x="0" y="93" text-anchor="middle" fill="currentColor" font-size="10">every 2nd vertex</text>
  </g>
  <!-- {8/3} Octagram: connect every 3rd vertex of regular octagon -->
  <!-- vertices at 22.5+k*45, radius 58, center (210,95) -->
  <g transform="translate(210,95)">
    <!-- Connect 0→3→6→1→4→7→2→5→0 (every 3rd) -->
    <polygon points="54,-22 22,-54 -22,-54 -54,-22 -54,22 -22,54 22,54 54,22"
      fill="none" stroke="none"/>
    <!-- manually draw every-3rd connections: vertices 0,3,6,1,4,7,2,5 -->
    <!-- 8 vertices at 67.5°,112.5°,... Let's use explicit coords -->
    <!-- v0=(54,-22), v1=(22,-54), v2=(-22,-54), v3=(-54,-22), v4=(-54,22), v5=(-22,54), v6=(22,54), v7=(54,22) -->
    <line x1="54" y1="-22" x2="-54" y2="-22" stroke="#e70" stroke-width="1.8"/>
    <line x1="-54" y1="-22" x2="22" y2="54" stroke="#e70" stroke-width="1.8"/>
    <line x1="22" y1="54" x2="22" y2="-54" stroke="#e70" stroke-width="1.8"/>
    <line x1="22" y1="-54" x2="-54" y2="22" stroke="#e70" stroke-width="1.8"/>
    <line x1="-54" y1="22" x2="54" y2="22" stroke="#e70" stroke-width="1.8"/>
    <line x1="54" y1="22" x2="-22" y2="-54" stroke="#e70" stroke-width="1.8"/>
    <line x1="-22" y1="-54" x2="-22" y2="54" stroke="#e70" stroke-width="1.8"/>
    <line x1="-22" y1="54" x2="54" y2="-22" stroke="#e70" stroke-width="1.8"/>
    <text x="0" y="80" text-anchor="middle" fill="currentColor">{8/3} octagram</text>
    <text x="0" y="93" text-anchor="middle" fill="currentColor" font-size="10">every 3rd vertex</text>
  </g>
  <!-- {7/3} Heptagram: connect every 3rd vertex of regular heptagon -->
  <!-- vertices at 90+k*360/7, radius 58, center (350,95) -->
  <g transform="translate(350,95)">
    <!-- 7 vertices: angles 90,141.4,192.9,244.3,295.7,347.1,38.6 -->
    <polygon points="0,-58 55,-17 34,47 -34,47 -55,-17 -21,-56 21,-56"
      fill="none" stroke="none"/>
    <!-- connect every 3rd: 0→3→6→2→5→1→4→0 -->
    <line x1="0" y1="-58" x2="-34" y2="47" stroke="#c00" stroke-width="1.8"/>
    <line x1="-34" y1="47" x2="21" y2="-56" stroke="#c00" stroke-width="1.8"/>
    <line x1="21" y1="-56" x2="-55" y2="-17" stroke="#c00" stroke-width="1.8"/>
    <line x1="-55" y1="-17" x2="34" y2="47" stroke="#c00" stroke-width="1.8"/>
    <line x1="34" y1="47" x2="55" y2="-17" stroke="#c00" stroke-width="1.8"/>
    <line x1="55" y1="-17" x2="-21" y2="-56" stroke="#c00" stroke-width="1.8"/>
    <line x1="-21" y1="-56" x2="0" y2="-58" stroke="#c00" stroke-width="1.8"/>
    <text x="0" y="80" text-anchor="middle" fill="currentColor">{7/3} heptagram</text>
    <text x="0" y="93" text-anchor="middle" fill="currentColor" font-size="10">every 3rd vertex</text>
  </g>
</svg>
</div>

## 3.3 Regular Polyhedra: The Platonic Solids

Moving to three dimensions, a **polyhedron** is a solid bounded by flat polygonal faces. A polyhedron is **regular** (a **Platonic solid**) if all its faces are congruent regular polygons, and the same number of faces meet at each vertex. The Schläfli symbol \(\{p, q\}\) denotes the regular polyhedron whose faces are \(\{p\}\) and in which \(q\) faces meet at each vertex.

The condition for a convex regular polyhedron is that the sum of face angles at each vertex must be less than \(360°\), giving \(q \cdot \alpha_p < 360°\), i.e.,

\[
q \cdot \frac{(p-2) \cdot 180°}{p} < 360°.
\]

Rearranging: \(\frac{1}{p} + \frac{1}{q} > \frac{1}{2}\). The integer solutions with \(p, q \geq 3\) are exactly five. This is why there are exactly five Platonic solids: the inequality has a finite number of integer solutions, each corresponding to a different solid.

| Schläfli symbol | Name | Faces | Edges | Vertices |
|---|---|---|---|---|
| \(\{3,3\}\) | Tetrahedron | 4 | 6 | 4 |
| \(\{4,3\}\) | Cube (hexahedron) | 6 | 12 | 8 |
| \(\{3,4\}\) | Octahedron | 8 | 12 | 6 |
| \(\{5,3\}\) | Dodecahedron | 12 | 30 | 20 |
| \(\{3,5\}\) | Icosahedron | 20 | 30 | 12 |

These five solids were known to the ancient Greeks and celebrated by Plato in the *Timaeus* (c. 360 BCE), where he associated them with the classical elements: tetrahedron with fire, cube with earth, octahedron with air, icosahedron with water, and dodecahedron with the cosmos (or "ether"). This identification was more philosophical than scientific, but it reflects the deep cultural significance these five solids held. Theaetetus (c. 417–369 BCE) is generally credited with the first rigorous proof that there are exactly five.

### 3.3.1 Worked Example: Vertex Angle Sums and the Five Platonic Solids

Here is the vertex-angle argument in full detail. At each vertex of a Platonic solid \(\{p, q\}\), exactly \(q\) regular \(p\)-gons meet. The face angle of a regular \(p\)-gon at each vertex is \(\alpha_p = (p-2) \cdot 180°/p\). For the solid to be convex, these face angles must sum to less than \(360°\):

\[
q \cdot \frac{(p-2) \cdot 180°}{p} < 360° \quad\Longleftrightarrow\quad \frac{1}{p} + \frac{1}{q} > \frac{1}{2}.
\]

With \(p, q \geq 3\), the solutions are:

- **\(p=3, q=3\):** \(1/3 + 1/3 = 2/3 > 1/2\). ✓ Three equilateral triangles per vertex. Each vertex angle sum: \(3 \times 60° = 180° < 360°\). → **Tetrahedron**.
- **\(p=3, q=4\):** \(1/3 + 1/4 = 7/12 > 1/2\). ✓ Four equilateral triangles per vertex. Sum: \(4 \times 60° = 240° < 360°\). → **Octahedron**.
- **\(p=3, q=5\):** \(1/3 + 1/5 = 8/15 > 1/2\). ✓ Five equilateral triangles per vertex. Sum: \(5 \times 60° = 300° < 360°\). → **Icosahedron**.
- **\(p=3, q=6\):** \(1/3 + 1/6 = 1/2\). ✗ (Not strictly greater.) Six triangles: \(6 \times 60° = 360°\), which gives a flat tessellation (the triangular tiling), not a polyhedron.
- **\(p=4, q=3\):** \(1/4 + 1/3 = 7/12 > 1/2\). ✓ Three squares per vertex. Sum: \(3 \times 90° = 270° < 360°\). → **Cube**.
- **\(p=4, q=4\):** \(1/4 + 1/4 = 1/2\). ✗ Four squares: \(4 \times 90° = 360°\), the square tiling.
- **\(p=5, q=3\):** \(1/5 + 1/3 = 8/15 > 1/2\). ✓ Three pentagons per vertex. Sum: \(3 \times 108° = 324° < 360°\). → **Dodecahedron**.
- **\(p=5, q=4\):** \(1/5 + 1/4 = 9/20 < 1/2\). ✗ (Violates the inequality.)
- **\(p=6, q=3\):** \(1/6 + 1/3 = 1/2\). ✗ Hexagonal tiling.
- All larger \(p\) or \(q\): give \(1/p + 1/q \leq 1/2\). ✗

So there are exactly **five** convex regular polyhedra. No more, no fewer.

### 3.3.2 ASCII Art of the Five Platonic Solids

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 560 280" width="560" height="280" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11" stroke-linejoin="round">
  <!-- TETRAHEDRON -->
  <g transform="translate(55,20)">
    <!-- 4 vertices: top A, front-left B, front-right C, back D -->
    <!-- A=(50,10), B=(10,110), C=(90,110), D=(50,75) -->
    <line x1="50" y1="10" x2="10" y2="110" stroke="currentColor" stroke-width="1.5"/>
    <line x1="50" y1="10" x2="90" y2="110" stroke="currentColor" stroke-width="1.5"/>
    <line x1="10" y1="110" x2="90" y2="110" stroke="currentColor" stroke-width="1.5"/>
    <line x1="50" y1="10" x2="50" y2="75" stroke="#777" stroke-width="1" stroke-dasharray="3,3"/>
    <line x1="10" y1="110" x2="50" y2="75" stroke="#777" stroke-width="1" stroke-dasharray="3,3"/>
    <line x1="90" y1="110" x2="50" y2="75" stroke="#777" stroke-width="1" stroke-dasharray="3,3"/>
    <text x="50" y="6" text-anchor="middle" fill="currentColor">A</text>
    <text x="2" y="116" fill="currentColor">B</text>
    <text x="92" y="116" fill="currentColor">C</text>
    <text x="52" y="70" fill="currentColor">D</text>
    <text x="50" y="135" text-anchor="middle" fill="currentColor" font-weight="bold">Tetrahedron {3,3}</text>
    <text x="50" y="148" text-anchor="middle" fill="currentColor">V=4, E=6, F=4</text>
  </g>

  <!-- CUBE -->
  <g transform="translate(200,20)">
    <!-- Front face: (10,60),(90,60),(90,130),(10,130) -->
    <!-- Back face offset by (30,-25) -->
    <rect x="10" y="65" width="80" height="70" fill="none" stroke="currentColor" stroke-width="1.5"/>
    <rect x="35" y="35" width="80" height="70" fill="none" stroke="#777" stroke-width="1" stroke-dasharray="3,3"/>
    <!-- Connecting edges -->
    <line x1="10" y1="65" x2="35" y2="35" stroke="currentColor" stroke-width="1.5"/>
    <line x1="90" y1="65" x2="115" y2="35" stroke="currentColor" stroke-width="1.5"/>
    <line x1="90" y1="135" x2="115" y2="105" stroke="currentColor" stroke-width="1.5"/>
    <line x1="10" y1="135" x2="35" y2="105" stroke="#777" stroke-width="1" stroke-dasharray="3,3"/>
    <text x="62" y="155" text-anchor="middle" fill="currentColor" font-weight="bold">Cube {4,3}</text>
    <text x="62" y="168" text-anchor="middle" fill="currentColor">V=8, E=12, F=6</text>
  </g>

  <!-- OCTAHEDRON -->
  <g transform="translate(370,20)">
    <!-- Top (50,10), Bottom (50,140), Left (10,75), Right (90,75), Front (50,95), Back (50,55) -->
    <line x1="50" y1="10" x2="10" y2="75" stroke="currentColor" stroke-width="1.5"/>
    <line x1="50" y1="10" x2="90" y2="75" stroke="currentColor" stroke-width="1.5"/>
    <line x1="50" y1="10" x2="50" y2="95" stroke="currentColor" stroke-width="1.5"/>
    <line x1="10" y1="75" x2="50" y2="140" stroke="currentColor" stroke-width="1.5"/>
    <line x1="90" y1="75" x2="50" y2="140" stroke="currentColor" stroke-width="1.5"/>
    <line x1="50" y1="95" x2="50" y2="140" stroke="currentColor" stroke-width="1.5"/>
    <line x1="10" y1="75" x2="50" y2="95" stroke="currentColor" stroke-width="1.5"/>
    <line x1="90" y1="75" x2="50" y2="95" stroke="currentColor" stroke-width="1.5"/>
    <line x1="50" y1="55" x2="10" y2="75" stroke="#777" stroke-width="1" stroke-dasharray="3,3"/>
    <line x1="50" y1="55" x2="90" y2="75" stroke="#777" stroke-width="1" stroke-dasharray="3,3"/>
    <line x1="50" y1="10" x2="50" y2="55" stroke="#777" stroke-width="1" stroke-dasharray="3,3"/>
    <text x="50" y="155" text-anchor="middle" fill="currentColor" font-weight="bold">Octahedron {3,4}</text>
    <text x="50" y="168" text-anchor="middle" fill="currentColor">V=6, E=12, F=8</text>
  </g>

  <!-- DODECAHEDRON (top view schematic) -->
  <g transform="translate(60,200)">
    <!-- Rough pentagon-based top view -->
    <polygon points="50,0 95,35 78,90 22,90 5,35" fill="none" stroke="currentColor" stroke-width="1.5"/>
    <polygon points="50,15 80,38 70,72 30,72 20,38" fill="none" stroke="#999" stroke-width="1"/>
    <line x1="50" y1="0" x2="50" y2="15" stroke="#999" stroke-width="1"/>
    <line x1="95" y1="35" x2="80" y2="38" stroke="#999" stroke-width="1"/>
    <line x1="78" y1="90" x2="70" y2="72" stroke="#999" stroke-width="1"/>
    <line x1="22" y1="90" x2="30" y2="72" stroke="#999" stroke-width="1"/>
    <line x1="5" y1="35" x2="20" y2="38" stroke="#999" stroke-width="1"/>
    <text x="50" y="105" text-anchor="middle" fill="currentColor" font-weight="bold">Dodecahedron {5,3}</text>
    <text x="50" y="118" text-anchor="middle" fill="currentColor">V=20, E=30, F=12</text>
  </g>

  <!-- ICOSAHEDRON (top view schematic) -->
  <g transform="translate(340,200)">
    <!-- Triangle arrangement suggesting icosahedron -->
    <polygon points="50,5 90,70 10,70" fill="none" stroke="currentColor" stroke-width="1.5"/>
    <polygon points="50,30 75,75 25,75" fill="none" stroke="#999" stroke-width="1"/>
    <line x1="50" y1="5" x2="50" y2="30" stroke="#999" stroke-width="1"/>
    <line x1="90" y1="70" x2="75" y2="75" stroke="#999" stroke-width="1"/>
    <line x1="10" y1="70" x2="25" y2="75" stroke="#999" stroke-width="1"/>
    <line x1="50" y1="30" x2="50" y2="5" stroke="#777" stroke-width="1" stroke-dasharray="3,3"/>
    <text x="50" y="105" text-anchor="middle" fill="currentColor" font-weight="bold">Icosahedron {3,5}</text>
    <text x="50" y="118" text-anchor="middle" fill="currentColor">V=12, E=30, F=20</text>
  </g>
</svg>
</div>

### 3.3.3 Euler Characteristic of Each Platonic Solid

<div class="example">
<strong>Example (Euler characteristic verification).</strong> For each Platonic solid, verify \(V - E + F = 2\):

| Solid | \(V\) | \(E\) | \(F\) | \(\chi = V - E + F\) |
|-------|--------|--------|--------|----------------------|
| Tetrahedron | 4 | 6 | 4 | \(4 - 6 + 4 = 2\) ✓ |
| Cube | 8 | 12 | 6 | \(8 - 12 + 6 = 2\) ✓ |
| Octahedron | 6 | 12 | 8 | \(6 - 12 + 8 = 2\) ✓ |
| Dodecahedron | 20 | 30 | 12 | \(20 - 30 + 12 = 2\) ✓ |
| Icosahedron | 12 | 30 | 20 | \(12 - 30 + 20 = 2\) ✓ |

All five satisfy Euler's formula \(\chi = 2\), consistent with the fact that each is topologically a sphere. The Euler characteristic distinguishes surfaces: \(\chi = 2\) for the sphere, \(\chi = 0\) for the torus, \(\chi = -2\) for the double torus, etc.
</div>

## 3.4 Star Polyhedra: Kepler-Poinsot Solids

By relaxing the convexity condition and allowing **star polygons** as faces or allowing faces to penetrate through each other (but maintaining regularity in the combinatorial sense), four additional regular polyhedra appear. These are the **Kepler-Poinsot polyhedra**, discovered partly by **Johannes Kepler** (1571–1630), who found two of them in his 1619 *Harmonices Mundi*, and completed by **Louis Poinsot** (1809), who rediscovered them and added two more. Cauchy subsequently proved in 1811 that these four are the *only* regular star polyhedra.

| Schläfli symbol | Name | Faces | Vertices |
|---|---|---|---|
| \(\{5/2, 5\}\) | Small stellated dodecahedron | 12 pentagrammic | 12 |
| \(\{5, 5/2\}\) | Great dodecahedron | 12 pentagonal | 12 |
| \(\{5/2, 3\}\) | Great stellated dodecahedron | 12 pentagrammic | 20 |
| \(\{3, 5/2\}\) | Great icosahedron | 20 triangular | 12 |

In the Kepler-Poinsot polyhedra, the faces either are star polygons (pentagrammic faces) or meet in a star-polygon pattern around each vertex. They are not convex and have faces that intersect each other. Their Euler characteristic is not always 2.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 420 200" width="420" height="200" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- Small Stellated Dodecahedron {5/2,5} — schematic star shape -->
  <g transform="translate(70,90)">
    <!-- Pentagram-like spikes -->
    <polygon points="0,-70 15,-20 65,-20 25,10 40,60 0,30 -40,60 -25,10 -65,-20 -15,-20"
      fill="none" stroke="#2255cc" stroke-width="1.5"/>
    <!-- Inner pentagon -->
    <polygon points="0,-25 24,-8 15,20 -15,20 -24,-8"
      fill="none" stroke="#88a" stroke-width="1" stroke-dasharray="3,2"/>
    <text x="0" y="90" text-anchor="middle" fill="currentColor">{5/2,5}</text>
    <text x="0" y="103" text-anchor="middle" fill="currentColor" font-size="9">Small Stellated</text>
    <text x="0" y="114" text-anchor="middle" fill="currentColor" font-size="9">Dodecahedron</text>
  </g>

  <!-- Great Dodecahedron {5,5/2} — pentagonal faces, indented -->
  <g transform="translate(210,90)">
    <polygon points="0,-55 52,-18 32,47 -32,47 -52,-18"
      fill="none" stroke="#e70" stroke-width="1.5"/>
    <!-- Interior star lines -->
    <line x1="0" y1="-55" x2="32" y2="47" stroke="#e70" stroke-width="1"/>
    <line x1="0" y1="-55" x2="-32" y2="47" stroke="#e70" stroke-width="1"/>
    <line x1="52" y1="-18" x2="-32" y2="47" stroke="#e70" stroke-width="1"/>
    <line x1="52" y1="-18" x2="-52" y2="-18" stroke="#e70" stroke-width="1"/>
    <line x1="32" y1="47" x2="-52" y2="-18" stroke="#e70" stroke-width="1"/>
    <text x="0" y="80" text-anchor="middle" fill="currentColor">{5,5/2}</text>
    <text x="0" y="93" text-anchor="middle" fill="currentColor" font-size="9">Great Dodecahedron</text>
    <text x="0" y="104" text-anchor="middle" fill="currentColor" font-size="9">indented pentagonal faces</text>
  </g>

  <!-- Great Stellated Dodecahedron {5/2,3} — sharper star spikes -->
  <g transform="translate(350,90)">
    <polygon points="0,-75 11,-18 65,-10 18,10 38,65 0,28 -38,65 -18,10 -65,-10 -11,-18"
      fill="none" stroke="#c00" stroke-width="1.5"/>
    <polygon points="0,-30 28,-10 17,25 -17,25 -28,-10"
      fill="none" stroke="#c88" stroke-width="1" stroke-dasharray="3,2"/>
    <text x="0" y="95" text-anchor="middle" fill="currentColor">{5/2,3}</text>
    <text x="0" y="108" text-anchor="middle" fill="currentColor" font-size="9">Great Stellated</text>
    <text x="0" y="119" text-anchor="middle" fill="currentColor" font-size="9">Dodecahedron</text>
  </g>
</svg>
</div>

The small stellated dodecahedron looks like a dodecahedron with a pentagrammic pyramid built on each face — twelve "spiky" faces piercing through each other. Despite their apparent complexity, these four solids satisfy a generalized Euler formula \(V - E + F = \chi\) with \(\chi\) depending on how one counts the genus of the underlying surface.

## 3.5 Regular Polytopes in Four Dimensions

In four dimensions, a **regular 4-polytope** (or **regular polychoron**) has regular polyhedral cells, with the same number of cells meeting at each edge, and the same number of faces at each vertex. Remarkably, there are **six** convex regular 4-polytopes, compared to five in three dimensions.

| Schläfli symbol | Name | Cells | Vertices |
|---|---|---|---|
| \(\{3,3,3\}\) | 5-cell (pentatope) | 5 tetrahedra | 5 |
| \(\{4,3,3\}\) | 8-cell (tesseract/hypercube) | 8 cubes | 16 |
| \(\{3,3,4\}\) | 16-cell (cross-polytope) | 16 tetrahedra | 8 |
| \(\{3,4,3\}\) | 24-cell | 24 octahedra | 24 |
| \(\{5,3,3\}\) | 120-cell | 120 dodecahedra | 600 |
| \(\{3,3,5\}\) | 600-cell | 600 tetrahedra | 120 |

The **24-cell** \(\{3,4,3\}\) is the most exceptional: it has no analogue in any other dimension, is self-dual, and its vertices can be taken as the 24 unit vectors \(\pm e_i \pm e_j\) in \(\mathbb{R}^4\) (the root system \(D_4\) rescaled). The **120-cell** is the four-dimensional analogue of the dodecahedron, and the **600-cell** is the analogue of the icosahedron — they are dual to each other.

In dimensions \(n \geq 5\), only three regular convex polytopes exist: the **simplex** \(\{3^{n-1}\}\), the **hypercube** \(\{4, 3^{n-2}\}\), and the **cross-polytope** \(\{3^{n-2}, 4\}\). The richness of dimensions 3 and 4 is a special phenomenon with no known deep explanation — it simply happens that the Diophantine inequality \(1/p + 1/q > 1/2\) (and its four-dimensional analogue) has more solutions in low dimensions.

### 3.5.1 Intuiting the Tesseract: A 4D Shadow

How does one visualize a four-dimensional polytope? The key insight is that we see 3D objects as 2D projections (shadows), so we should expect 4D objects to appear as 3D projections. Just as a cube's wireframe projection onto a plane shows a small square inside a large square connected by four diagonal edges (a "picture of a cube"), the tesseract's projection onto 3D space shows a small cube inside a large cube connected by eight edges.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 320 260" width="320" height="260" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- Outer cube (large) -->
  <!-- Front face: (30,100),(170,100),(170,210),(30,210) -->
  <rect x="30" y="100" width="140" height="110" fill="none" stroke="currentColor" stroke-width="2"/>
  <!-- Back face (offset): (90,30),(230,30),(230,140),(90,140) -->
  <rect x="90" y="30" width="140" height="110" fill="none" stroke="currentColor" stroke-width="2"/>
  <!-- Connecting edges (outer cube) -->
  <line x1="30" y1="100" x2="90" y2="30" stroke="currentColor" stroke-width="2"/>
  <line x1="170" y1="100" x2="230" y2="30" stroke="currentColor" stroke-width="2"/>
  <line x1="170" y1="210" x2="230" y2="140" stroke="currentColor" stroke-width="2"/>
  <line x1="30" y1="210" x2="90" y2="140" stroke="currentColor" stroke-width="1.5" stroke-dasharray="4,3"/>

  <!-- Inner cube (small, centered) -->
  <!-- Front: (90,125),(150,125),(150,175),(90,175) -->
  <rect x="90" y="125" width="60" height="50" fill="none" stroke="#2255cc" stroke-width="1.5"/>
  <!-- Back (offset): (110,105),(170,105),(170,155),(110,155) -->
  <rect x="110" y="105" width="60" height="50" fill="none" stroke="#2255cc" stroke-width="1.5"/>
  <!-- Connecting edges (inner cube) -->
  <line x1="90" y1="125" x2="110" y2="105" stroke="#2255cc" stroke-width="1.5"/>
  <line x1="150" y1="125" x2="170" y2="105" stroke="#2255cc" stroke-width="1.5"/>
  <line x1="150" y1="175" x2="170" y2="155" stroke="#2255cc" stroke-width="1.5"/>
  <line x1="90" y1="175" x2="110" y2="155" stroke="#2255cc" stroke-width="1.5"/>

  <!-- Edges connecting outer to inner cube (the 4D connections) -->
  <line x1="30" y1="100" x2="90" y2="125" stroke="#999" stroke-width="1"/>
  <line x1="170" y1="100" x2="150" y2="125" stroke="#999" stroke-width="1"/>
  <line x1="170" y1="210" x2="150" y2="175" stroke="#999" stroke-width="1"/>
  <line x1="30" y1="210" x2="90" y2="175" stroke="#999" stroke-width="1"/>
  <line x1="90" y1="30" x2="110" y2="105" stroke="#999" stroke-width="1"/>
  <line x1="230" y1="30" x2="170" y2="105" stroke="#999" stroke-width="1"/>
  <line x1="230" y1="140" x2="170" y2="155" stroke="#999" stroke-width="1"/>
  <line x1="90" y1="140" x2="110" y2="155" stroke="#999" stroke-width="1"/>

  <!-- Labels -->
  <text x="160" y="228" text-anchor="middle" fill="currentColor">Outer cube</text>
  <text x="160" y="241" text-anchor="middle" fill="#2255cc" font-size="10">Inner cube (same size in 4D)</text>
  <text x="160" y="255" text-anchor="middle" fill="currentColor" font-size="10">V=16, E=32, F=24, C=8; χ=0</text>
</svg>
</div>

<div class="example">
<strong>Example (Cross-sections of the tesseract).</strong> A tesseract \(\{4,3,3\}\) can be understood by considering what 3D "slices" look like as a hyperplane sweeps through it, just as slicing a cube with a plane gives polygonal cross-sections:

- At the start: a single cubic face (a cube).
- Slicing near one cubic cell: a cube with slightly truncated corners.
- Near the middle: a cuboctahedron (regular hexagonal cross-section exists at the right angle).
- Past the midpoint: the truncated cube appears again, then shrinks back to a cube.

The sequence of cross-sections captures the entire 4D structure through 3D snapshots.
</div>

---

# Chapter 4: Polyhedra

## 4.1 Euler's Formula

The most fundamental result about convex polyhedra is **Euler's formula**, relating the number of vertices \(V\), edges \(E\), and faces \(F\):

\[
V - E + F = 2.
\]

Euler announced this formula in 1758, though Descartes had observed something equivalent a century earlier. It is a genuinely non-obvious fact: why should these three counts, which seem to depend on the shape of the polyhedron in complicated ways, combine to always give the same number? The answer lies in topology: the formula is really a statement about the sphere (any convex polyhedron is topologically a sphere), and it follows from properties of planar graphs.

<div class="theorem">
<strong>Theorem (Euler, 1758).</strong> For any convex polyhedron, \(V - E + F = 2\).
</div>

<div class="proof">
<strong>Proof (the tree argument).</strong> We use the following strategy: represent the polyhedron as a planar graph, then count vertices, edges, and faces of the graph.

<em>Step 1: Planarization.</em> Remove one face from the polyhedron (say the "bottom" face). The remaining surface is a sphere with a disk removed — topologically a disk. Flatten this onto the plane (imagine stretching the boundary of the removed face outward to a large circle). The result is a planar graph \(G\) with \(V\) vertices, \(E\) edges, and \(F - 1\) bounded faces plus 1 unbounded outer face, for a total of \(F\) faces. We need to prove Euler's formula for this planar graph: \(V - E + F = 2\).

<em>Step 2: Spanning tree.</em> Let \(T\) be a spanning tree of \(G\). A spanning tree on \(V\) vertices has exactly \(V - 1\) edges and is connected with no cycles. When we draw \(T\) in the plane, it has \(V\) vertices, \(V-1\) edges, and — by a simple argument — exactly 1 face (the whole plane is one connected region). So Euler's formula holds for \(T\): \(V - (V-1) + 1 = 2\). ✓

<em>Step 3: Adding edges back.</em> Now add the remaining \(E - (V-1)\) edges of \(G\) back one by one. Each edge added to the spanning tree creates exactly one new face (it closes a cycle, splitting one region into two). So each edge addition increments \(E\) by 1 and increments \(F\) by 1, leaving \(V - E + F\) unchanged.

After adding all edges, we have \(V\) vertices, \(E\) edges, and \(F\) faces, with \(V - E + F = 2\). \(\square\)
</div>

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 440 200" width="440" height="200" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- Left: Flattened cube graph (3x3 grid of 4x4 vertices) -->
  <g transform="translate(20,20)">
    <text x="80" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Cube flattened</text>
    <!-- 4x4 grid of vertices at spacing 40 -->
    <!-- Row 0: y=20, Row 1: y=60, Row 2: y=100, Row 3: y=140 -->
    <!-- Col 0: x=20, Col 1: x=60, Col 2: x=100, Col 3: x=140 -->
    <!-- Horizontal edges -->
    <line x1="20" y1="20" x2="140" y2="20" stroke="currentColor" stroke-width="1.5"/>
    <line x1="20" y1="60" x2="140" y2="60" stroke="currentColor" stroke-width="1.5"/>
    <line x1="20" y1="100" x2="140" y2="100" stroke="currentColor" stroke-width="1.5"/>
    <line x1="20" y1="140" x2="140" y2="140" stroke="currentColor" stroke-width="1.5"/>
    <!-- Vertical edges -->
    <line x1="20" y1="20" x2="20" y2="140" stroke="currentColor" stroke-width="1.5"/>
    <line x1="60" y1="20" x2="60" y2="140" stroke="currentColor" stroke-width="1.5"/>
    <line x1="100" y1="20" x2="100" y2="140" stroke="currentColor" stroke-width="1.5"/>
    <line x1="140" y1="20" x2="140" y2="140" stroke="currentColor" stroke-width="1.5"/>
    <!-- Vertex dots -->
    <circle cx="20" cy="20" r="3" fill="currentColor"/><circle cx="60" cy="20" r="3" fill="currentColor"/>
    <circle cx="100" cy="20" r="3" fill="currentColor"/><circle cx="140" cy="20" r="3" fill="currentColor"/>
    <circle cx="20" cy="60" r="3" fill="currentColor"/><circle cx="60" cy="60" r="3" fill="currentColor"/>
    <circle cx="100" cy="60" r="3" fill="currentColor"/><circle cx="140" cy="60" r="3" fill="currentColor"/>
    <circle cx="20" cy="100" r="3" fill="currentColor"/><circle cx="60" cy="100" r="3" fill="currentColor"/>
    <circle cx="100" cy="100" r="3" fill="currentColor"/><circle cx="140" cy="100" r="3" fill="currentColor"/>
    <circle cx="20" cy="140" r="3" fill="currentColor"/><circle cx="60" cy="140" r="3" fill="currentColor"/>
    <circle cx="100" cy="140" r="3" fill="currentColor"/><circle cx="140" cy="140" r="3" fill="currentColor"/>
    <text x="80" y="165" text-anchor="middle" fill="currentColor">V=8, E=12, F=6</text>
    <text x="80" y="178" text-anchor="middle" fill="#2a7">8−12+6=2 ✓</text>
  </g>

  <!-- Arrow -->
  <text x="220" y="100" text-anchor="middle" fill="currentColor" font-size="18">→</text>

  <!-- Right: Spanning tree (7 edges, 1 face) -->
  <g transform="translate(250,20)">
    <text x="80" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Spanning tree</text>
    <!-- Only 7 edges forming a tree (no cycles) -->
    <!-- Row 0: top row, connected -->
    <line x1="20" y1="20" x2="60" y2="20" stroke="#c00" stroke-width="2"/>
    <!-- Column edges -->
    <line x1="20" y1="20" x2="20" y2="60" stroke="#c00" stroke-width="2"/>
    <line x1="60" y1="60" x2="60" y2="100" stroke="#c00" stroke-width="2"/>
    <line x1="100" y1="100" x2="100" y2="140" stroke="#c00" stroke-width="2"/>
    <line x1="20" y1="60" x2="60" y2="60" stroke="#c00" stroke-width="2"/>
    <line x1="60" y1="100" x2="100" y2="100" stroke="#c00" stroke-width="2"/>
    <line x1="100" y1="140" x2="140" y2="140" stroke="#c00" stroke-width="2"/>
    <!-- Vertex dots (only 8 used) -->
    <circle cx="20" cy="20" r="3" fill="#c00"/><circle cx="60" cy="20" r="3" fill="#c00"/>
    <circle cx="20" cy="60" r="3" fill="#c00"/><circle cx="60" cy="60" r="3" fill="#c00"/>
    <circle cx="60" cy="100" r="3" fill="#c00"/><circle cx="100" cy="100" r="3" fill="#c00"/>
    <circle cx="100" cy="140" r="3" fill="#c00"/><circle cx="140" cy="140" r="3" fill="#c00"/>
    <text x="80" y="165" text-anchor="middle" fill="currentColor">V=8, E=7, F=1</text>
    <text x="80" y="178" text-anchor="middle" fill="#2a7">8−7+1=2 ✓</text>
  </g>
</svg>
</div>

<div class="example">
<strong>Example.</strong> Cube: \(V = 8\), \(E = 12\), \(F = 6\). Then \(8 - 12 + 6 = 2\). Tetrahedron: \(V = 4\), \(E = 6\), \(F = 4\). Then \(4 - 6 + 4 = 2\). Icosahedron: \(V = 12\), \(E = 30\), \(F = 20\). Then \(12 - 30 + 20 = 2\).
</div>

The quantity \(V - E + F\) is the **Euler characteristic** \(\chi\). For a sphere (or any simply connected surface), \(\chi = 2\). For a torus, \(\chi = 0\), and indeed one can embed a graph on a torus such that \(V - E + F = 0\). The Euler characteristic is a **topological invariant**, unchanged by continuous deformation. This is why Euler's formula holds for *all* convex polyhedra — they are all topologically spheres, regardless of their specific combinatorial structure.

Euler's formula has powerful corollaries. For instance, combining it with the inequalities \(3F \leq 2E\) (each face has at least 3 edges, each edge borders 2 faces) and \(3V \leq 2E\) (each vertex has degree at least 3), one can prove that every convex polyhedron has at least one face with 5 or fewer sides, and that the only convex polyhedra with all triangular faces are those with \(V \leq 12\).

### 4.1.1 The Stereographic Projection Perspective

Another clean proof of Euler's formula uses **stereographic projection**. Take the polyhedron and place it so that no vertex or edge lies on the top of the circumscribed sphere. Project from the north pole of the sphere onto the equatorial plane.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 280 230" width="280" height="230" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <!-- Sphere (circle) -->
  <circle cx="140" cy="110" r="90" fill="none" stroke="#777" stroke-width="1.5"/>
  <!-- Equatorial plane -->
  <line x1="30" y1="110" x2="250" y2="110" stroke="currentColor" stroke-width="2"/>
  <text x="254" y="114" fill="currentColor">equatorial plane</text>
  <!-- North pole -->
  <circle cx="140" cy="20" r="4" fill="#c00"/>
  <text x="148" y="18" fill="#c00">N</text>
  <!-- South pole -->
  <circle cx="140" cy="200" r="3" fill="currentColor"/>
  <text x="148" y="204" fill="currentColor">S</text>
  <!-- Axis -->
  <line x1="140" y1="20" x2="140" y2="200" stroke="#777" stroke-width="1" stroke-dasharray="4,3"/>
  <!-- Point P on sphere -->
  <circle cx="185" cy="55" r="4" fill="#2255cc"/>
  <text x="192" y="53" fill="#2255cc">P</text>
  <!-- Projection line NP extended to equatorial plane -->
  <line x1="140" y1="20" x2="220" y2="110" stroke="#2255cc" stroke-width="1.5" stroke-dasharray="4,3"/>
  <!-- P' on equatorial plane -->
  <circle cx="220" cy="110" r="4" fill="#e70"/>
  <text x="225" y="108" fill="#e70">P′</text>
  <text x="140" y="225" text-anchor="middle" fill="currentColor" font-size="10">NP projected → P′ on equatorial plane</text>
</svg>
</div>

## 4.2 Platonic Solids Revisited

Using Euler's formula, we can prove rigorously that there are exactly five Platonic solids. Suppose we have a regular polyhedron with Schläfli symbol \(\{p, q\}\). Then:

\[
F = \frac{2E}{p}, \quad V = \frac{2E}{q}.
\]

Substituting into Euler's formula:

\[
\frac{2E}{q} - E + \frac{2E}{p} = 2 \implies E\left(\frac{2}{q} - 1 + \frac{2}{p}\right) = 2 \implies E = \frac{4pq}{2p + 2q - pq}.
\]

For \(E\) to be a positive integer, the denominator \(2p + 2q - pq\) must be positive, giving \(\frac{1}{p} + \frac{1}{q} > \frac{1}{2}\). This has exactly five solutions in integers \(p, q \geq 3\): \((3,3)\), \((4,3)\), \((3,4)\), \((5,3)\), \((3,5)\), corresponding to the five Platonic solids.

<div class="example">
<strong>Example (Truncated Tetrahedron — verifying Euler's formula).</strong> The truncated tetrahedron (an Archimedean solid) is obtained by cutting the corners of a tetrahedron. It has 4 hexagonal faces and 4 triangular faces, 18 edges, and 12 vertices. Check: \(V - E + F = 12 - 18 + 8 = 2\). ✓

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 240 200" width="240" height="200" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- Truncated tetrahedron: front-facing hexagonal face + triangular faces -->
  <!-- Central hexagon (front) -->
  <polygon points="120,30 160,55 160,105 120,130 80,105 80,55"
    fill="none" stroke="currentColor" stroke-width="2"/>
  <!-- Top triangular face (truncated corner) -->
  <polygon points="120,30 148,10 92,10"
    fill="none" stroke="#2255cc" stroke-width="1.5"/>
  <line x1="148" y1="10" x2="160" y2="55" stroke="#2255cc" stroke-width="1.5"/>
  <line x1="92" y1="10" x2="80" y2="55" stroke="#2255cc" stroke-width="1.5"/>
  <!-- Right triangular face -->
  <polygon points="160,55 190,75 185,115"
    fill="none" stroke="#2255cc" stroke-width="1.5"/>
  <line x1="185" y1="115" x2="160" y2="105" stroke="#2255cc" stroke-width="1.5"/>
  <line x1="190" y1="75" x2="160" y2="55" stroke="#2255cc" stroke-width="1.5"/>
  <!-- Bottom hexagonal face hint -->
  <line x1="80" y1="105" x2="60" y2="120" stroke="#777" stroke-width="1" stroke-dasharray="3,3"/>
  <line x1="120" y1="130" x2="120" y2="150" stroke="#777" stroke-width="1" stroke-dasharray="3,3"/>
  <line x1="160" y1="105" x2="180" y2="120" stroke="#777" stroke-width="1" stroke-dasharray="3,3"/>
  <!-- Labels -->
  <text x="120" y="80" text-anchor="middle" fill="currentColor" font-size="10">hexagon</text>
  <text x="120" y="168" text-anchor="middle" fill="currentColor">Truncated Tetrahedron</text>
  <text x="120" y="180" text-anchor="middle" fill="currentColor">V=12, E=18, F=8</text>
  <text x="120" y="192" text-anchor="middle" fill="#2a7">12−18+8=2 ✓</text>
</svg>
</div>
</div>

## 4.3 Duality

Two polyhedra are **dual** to each other if one can be obtained from the other by swapping vertices and faces, with edges corresponding to edges. More precisely, the dual of a polyhedron \(P\) is a polyhedron \(P^*\) whose vertices correspond to faces of \(P\), whose faces correspond to vertices of \(P\), and whose edges correspond to edges of \(P\) (connecting a vertex of \(P^*\) to another whenever the corresponding faces of \(P\) share an edge).

Duality is a deep symmetry: it shows that the distinction between "vertices" and "faces" is arbitrary from the combinatorial point of view. A theorem about vertices of \(P\) automatically gives a theorem about faces of \(P^*\). The same abstract combinatorial structure underlies both.

For Platonic solids with Schläfli symbol \(\{p, q\}\), the dual has Schläfli symbol \(\{q, p\}\). Thus:
- The **tetrahedron** \(\{3,3\}\) is self-dual.
- The **cube** \(\{4,3\}\) and **octahedron** \(\{3,4\}\) are dual.
- The **dodecahedron** \(\{5,3\}\) and **icosahedron** \(\{3,5\}\) are dual.

<div class="definition">
<strong>Dual polyhedron</strong>: Given a convex polyhedron \(P\) with a distinguished center \(O\), the <em>dual</em> \(P^*\) is constructed by placing a vertex of \(P^*\) at the point along the outward normal to each face of \(P\), at distance inversely proportional to the face's distance from \(O\).
</div>

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 420 200" width="420" height="200" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- CUBE (left) -->
  <g transform="translate(20,20)">
    <text x="80" y="-5" text-anchor="middle" fill="currentColor" font-weight="bold">Cube {4,3}</text>
    <!-- Front face -->
    <rect x="20" y="20" width="90" height="90" fill="none" stroke="currentColor" stroke-width="1.8"/>
    <!-- Back face -->
    <rect x="50" y="0" width="90" height="90" fill="none" stroke="#777" stroke-width="1" stroke-dasharray="3,3"/>
    <!-- Connecting edges -->
    <line x1="20" y1="20" x2="50" y2="0" stroke="currentColor" stroke-width="1.8"/>
    <line x1="110" y1="20" x2="140" y2="0" stroke="currentColor" stroke-width="1.8"/>
    <line x1="110" y1="110" x2="140" y2="90" stroke="currentColor" stroke-width="1.8"/>
    <line x1="20" y1="110" x2="50" y2="90" stroke="#777" stroke-width="1" stroke-dasharray="3,3"/>
    <!-- Face centers (to become octahedron vertices) -->
    <circle cx="65" cy="55" r="4" fill="#c00"/>
    <circle cx="95" cy="45" r="4" fill="#c00"/>
    <circle cx="95" cy="55" r="4" fill="#c00" opacity="0.4"/>
    <text x="80" y="128" text-anchor="middle" fill="currentColor">V=8, E=12, F=6</text>
    <text x="80" y="141" text-anchor="middle" fill="#c00" font-size="10">● = face centers → oct. vertices</text>
  </g>

  <!-- Arrow -->
  <text x="210" y="90" text-anchor="middle" fill="currentColor" font-size="18">⟺</text>
  <text x="210" y="105" text-anchor="middle" fill="currentColor" font-size="10">dual</text>

  <!-- OCTAHEDRON (right) -->
  <g transform="translate(240,20)">
    <text x="80" y="-5" text-anchor="middle" fill="currentColor" font-weight="bold">Octahedron {3,4}</text>
    <!-- Top -->
    <circle cx="80" cy="5" r="3" fill="currentColor"/>
    <!-- Bottom -->
    <circle cx="80" cy="145" r="3" fill="currentColor"/>
    <!-- Left/Right/Front/Back -->
    <circle cx="20" cy="75" r="3" fill="currentColor"/>
    <circle cx="140" cy="75" r="3" fill="currentColor"/>
    <!-- Front and back mid vertices -->
    <circle cx="80" cy="55" r="3" fill="#aaa"/>
    <circle cx="80" cy="95" r="3" fill="#aaa"/>
    <!-- Visible edges -->
    <line x1="80" y1="5" x2="20" y2="75" stroke="currentColor" stroke-width="1.8"/>
    <line x1="80" y1="5" x2="140" y2="75" stroke="currentColor" stroke-width="1.8"/>
    <line x1="80" y1="5" x2="80" y2="55" stroke="currentColor" stroke-width="1.8"/>
    <line x1="20" y1="75" x2="80" y2="145" stroke="currentColor" stroke-width="1.8"/>
    <line x1="140" y1="75" x2="80" y2="145" stroke="currentColor" stroke-width="1.8"/>
    <line x1="80" y1="95" x2="80" y2="145" stroke="currentColor" stroke-width="1.8"/>
    <line x1="20" y1="75" x2="80" y2="55" stroke="currentColor" stroke-width="1.8"/>
    <line x1="140" y1="75" x2="80" y2="55" stroke="currentColor" stroke-width="1.8"/>
    <line x1="20" y1="75" x2="80" y2="95" stroke="#777" stroke-width="1" stroke-dasharray="3,3"/>
    <line x1="140" y1="75" x2="80" y2="95" stroke="#777" stroke-width="1" stroke-dasharray="3,3"/>
    <line x1="80" y1="55" x2="80" y2="5" stroke="#777" stroke-width="1" stroke-dasharray="3,3"/>
    <text x="80" y="163" text-anchor="middle" fill="currentColor">V=6, E=12, F=8</text>
  </g>
</svg>
</div>

Notice the symmetry: cube has 8V, 12E, 6F. Octahedron has 6V, 12E, 8F. The V and F have swapped, while E stays the same. This is always true for dual pairs.

## 4.4 Archimedean Solids

Beyond the Platonic solids, the next most symmetric class of convex polyhedra are the **Archimedean solids**: convex polyhedra whose faces are regular polygons (possibly of more than one type), and whose symmetry group acts transitively on the vertices (every vertex looks the same). There are 13 Archimedean solids, discovered by Archimedes (c. 287–212 BCE) and later catalogued systematically by Kepler in his 1619 *Harmonices Mundi*.

Archimedes' original treatise on these solids is lost; our knowledge that he discovered them comes from Pappus of Alexandria (c. 320 CE), who listed all 13 and attributed them to Archimedes. Kepler rediscovered and proved completeness of the list using the Schläfli vertex-type classification.

Examples include:
- **Truncated tetrahedron** \(\{3,6,6\}\) (vertex type \(3.6.6\)): obtained by cutting the corners of a tetrahedron. Faces: 4 triangles, 4 hexagons.
- **Cuboctahedron** (vertex type \(3.4.3.4\)): the common dual of cube and octahedron. It sits halfway between them. Faces: 8 triangles, 6 squares.
- **Truncated icosahedron** (vertex type \(5.6.6\)): the **soccer ball** pattern, with 12 pentagons and 20 hexagons. This is also the structure of the Buckminsterfullerene (C\(_{60}\)) molecule.
- **Snub cube** (vertex type \(3.3.3.3.4\)): a chiral Archimedean solid with no improper symmetries. It comes in left-handed and right-handed versions.

<div class="example">
<strong>Example (The truncated icosahedron — soccer ball).</strong> Take an icosahedron (\(V=12, E=30, F=20\), all faces equilateral triangles). Truncate each vertex: cut off a small triangular cap at each of the 12 vertices. Each original triangle becomes a hexagon; each original vertex becomes a pentagon. Result: 20 hexagonal faces + 12 pentagonal faces = 32 faces, 60 vertices, 90 edges. Check: \(60 - 90 + 32 = 2\). ✓

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 260 230" width="260" height="230" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- Truncated icosahedron schematic: top pentagon, surrounding hexagons, bottom pentagon -->
  <!-- Top pentagon (centered at 130,50, radius 35) -->
  <polygon points="130,15 163,37 150,75 110,75 97,37"
    fill="currentColor" stroke="currentColor" stroke-width="1.5" fill-opacity="0.15"/>
  <text x="130" y="52" text-anchor="middle" fill="currentColor" font-size="9">pent.</text>
  <!-- Six surrounding hexagons (approximate positions) -->
  <!-- Upper-left hex -->
  <polygon points="80,37 97,37 110,75 90,90 65,80 62,55"
    fill="none" stroke="#999" stroke-width="1.2"/>
  <!-- Upper hex -->
  <polygon points="110,75 150,75 163,110 130,125 97,110"
    fill="none" stroke="#999" stroke-width="1.2"/>
  <!-- Upper-right hex -->
  <polygon points="150,75 163,37 188,55 192,80 175,90 163,110"
    fill="none" stroke="#999" stroke-width="1.2"/>
  <!-- Lower-left hex -->
  <polygon points="65,80 90,90 97,110 75,125 52,115 50,92"
    fill="none" stroke="#999" stroke-width="1.2"/>
  <!-- Lower-right hex -->
  <polygon points="175,90 192,80 210,92 208,115 185,125 163,110"
    fill="none" stroke="#999" stroke-width="1.2"/>
  <!-- Bottom-left hex -->
  <polygon points="75,125 97,110 130,125 118,160 85,160 68,143"
    fill="none" stroke="#999" stroke-width="1.2"/>
  <!-- Bottom-right hex -->
  <polygon points="130,125 163,110 185,125 180,150 150,162 118,160"
    fill="none" stroke="#999" stroke-width="1.2"/>
  <!-- Bottom pentagon -->
  <polygon points="85,160 118,160 150,162 138,195 97,195"
    fill="currentColor" stroke="currentColor" stroke-width="1.5" fill-opacity="0.15"/>
  <text x="118" y="183" text-anchor="middle" fill="currentColor" font-size="9">pent.</text>
  <!-- Labels -->
  <text x="130" y="215" text-anchor="middle" fill="currentColor">Truncated Icosahedron (soccer ball)</text>
  <text x="130" y="227" text-anchor="middle" fill="currentColor">V=60, E=90, F=32; 60−90+32=2 ✓</text>
</svg>
</div>
</div>

Each Archimedean solid also has a dual, called a **Catalan solid**, whose faces are congruent but not regular. For example, the dual of the cuboctahedron is the **rhombic dodecahedron** (12 rhombic faces, closely related to the FCC crystal structure), and the dual of the truncated icosahedron is the **pentakis dodecahedron** (60 triangular faces, appearing in certain virus capsid structures).

---

# Chapter 5: Symmetries, Tessellations, and Wallpaper Groups

## 5.1 Isometries of the Euclidean Plane

An **isometry** of \(\mathbb{R}^2\) is a distance-preserving bijection — a map \(\phi: \mathbb{R}^2 \to \mathbb{R}^2\) such that \(d(\phi(P), \phi(Q)) = d(P, Q)\) for all points \(P\) and \(Q\). The set of all isometries forms a group under composition. Understanding isometries is fundamental to understanding symmetry, because the symmetries of any geometric figure form a subgroup of the isometry group.

Every isometry of the plane preserves distances and therefore maps lines to lines, angles to angles, and circles to circles. It can be orientation-preserving (like a rotation or translation) or orientation-reversing (like a reflection or glide reflection). The classification of all plane isometries is a beautiful and complete theorem.

<div class="theorem">
<strong>Theorem (Classification of plane isometries).</strong> Every isometry of \(\mathbb{R}^2\) is one of four types: a <em>translation</em>, a <em>rotation</em>, a <em>reflection</em>, or a <em>glide reflection</em> (the composition of a reflection with a translation parallel to the reflection axis).
</div>

- **Translations** \(T_{\mathbf{v}}\): \(P \mapsto P + \mathbf{v}\). Orientation-preserving, no fixed points (if \(\mathbf{v} \neq 0\)).
- **Rotations** \(R_{C,\theta}\): rotation by angle \(\theta\) about center \(C\). Orientation-preserving, fixed point \(C\) (if \(\theta \neq 0\)).
- **Reflections** \(M_\ell\): reflection across line \(\ell\). Orientation-reversing, fixed set is \(\ell\).
- **Glide reflections**: composition of reflection and translation along the reflection line. Orientation-reversing, no fixed points.

The **orientation-preserving** isometries (translations and rotations) form a subgroup called the group of **direct isometries** or **motions**. The full isometry group is \(\text{Isom}(\mathbb{R}^2) = \mathbb{R}^2 \rtimes O(2)\), the semidirect product of translations with the orthogonal group.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 460 220" width="460" height="220" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <defs>
    <marker id="arr2" markerWidth="8" markerHeight="8" refX="4" refY="4" orient="auto">
      <path d="M0,1 L8,4 L0,7 Z" fill="currentColor"/>
    </marker>
  </defs>

  <!-- TRANSLATION -->
  <g transform="translate(10,10)">
    <text x="55" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Translation</text>
    <circle cx="15" cy="50" r="4" fill="#2255cc"/>
    <text x="8" y="45" fill="#2255cc">P</text>
    <circle cx="95" cy="50" r="4" fill="#c00"/>
    <text x="98" y="45" fill="#c00">P′</text>
    <line x1="20" y1="50" x2="88" y2="50" stroke="#999" stroke-width="1.5" marker-end="url(#arr2)"/>
    <text x="52" y="40" text-anchor="middle" fill="currentColor">v</text>
    <text x="55" y="80" text-anchor="middle" fill="currentColor" font-size="10">P → P + v</text>
  </g>

  <!-- ROTATION -->
  <g transform="translate(140,10)">
    <text x="55" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Rotation</text>
    <circle cx="55" cy="60" r="4" fill="#e70"/>
    <text x="60" y="58" fill="#e70">C</text>
    <circle cx="30" cy="30" r="4" fill="#2255cc"/>
    <text x="18" y="28" fill="#2255cc">P</text>
    <circle cx="85" cy="30" r="4" fill="#c00"/>
    <text x="88" y="28" fill="#c00">P′</text>
    <!-- Arc from P to P' around C -->
    <path d="M30,30 A35,35 0 0,1 85,30" fill="none" stroke="#999" stroke-width="1.5" marker-end="url(#arr2)"/>
    <text x="55" y="15" text-anchor="middle" fill="currentColor">θ</text>
    <text x="55" y="90" text-anchor="middle" fill="currentColor" font-size="10">rotation by θ about C</text>
  </g>

  <!-- REFLECTION -->
  <g transform="translate(270,10)">
    <text x="55" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Reflection</text>
    <circle cx="30" cy="30" r="4" fill="#2255cc"/>
    <text x="18" y="28" fill="#2255cc">P</text>
    <line x1="55" y1="10" x2="55" y2="100" stroke="currentColor" stroke-width="2" stroke-dasharray="5,3"/>
    <text x="62" y="50" fill="currentColor">ℓ</text>
    <circle cx="80" cy="30" r="4" fill="#c00"/>
    <text x="83" y="28" fill="#c00">P′</text>
    <line x1="30" y1="30" x2="80" y2="30" stroke="#777" stroke-width="1" stroke-dasharray="3,2"/>
    <text x="55" y="110" text-anchor="middle" fill="currentColor" font-size="10">P → Mℓ(P)</text>
  </g>

  <!-- GLIDE REFLECTION (bottom row, spanning) -->
  <g transform="translate(10,130)">
    <text x="220" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Glide Reflection</text>
    <line x1="10" y1="40" x2="420" y2="40" stroke="currentColor" stroke-width="2"/>
    <text x="425" y="44" fill="currentColor">ℓ</text>
    <!-- P above line -->
    <circle cx="50" cy="15" r="4" fill="#2255cc"/>
    <text x="55" y="13" fill="#2255cc">P</text>
    <!-- Reflect to P' below -->
    <circle cx="50" cy="65" r="4" fill="#aaa"/>
    <text x="55" y="70" fill="#aaa">P′</text>
    <line x1="50" y1="15" x2="50" y2="63" stroke="#777" stroke-width="1" stroke-dasharray="3,2"/>
    <!-- Translate P' to P'' along ℓ -->
    <circle cx="200" cy="65" r="4" fill="#c00"/>
    <text x="205" y="70" fill="#c00">P″</text>
    <line x1="55" y1="65" x2="195" y2="65" stroke="#999" stroke-width="1.5" marker-end="url(#arr2)"/>
    <text x="125" y="80" text-anchor="middle" fill="currentColor">+ translation v along ℓ</text>
    <text x="220" y="95" text-anchor="middle" fill="currentColor" font-size="10">reflect across ℓ, then translate parallel to ℓ</text>
  </g>
</svg>
</div>

### 5.1.1 Composing Isometries

Isometries combine in non-obvious ways. Here are some key composition rules:

<div class="example">
<strong>Example (Composition of reflections).</strong>

1. **Two reflections across parallel lines** at distance \(d\): the composition is a translation by \(2d\) perpendicular to the lines.

2. **Two reflections across intersecting lines** meeting at angle \(\theta\): the composition is a rotation by \(2\theta\) about the point of intersection.

3. **Three reflections**: the composition of three reflections is a glide reflection (or a single reflection if two of the three axes are parallel and the third is perpendicular to them).

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 420 220" width="420" height="220" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- LEFT: Parallel reflections → translation -->
  <g transform="translate(10,10)">
    <text x="90" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Parallel reflections → translation</text>
    <!-- Two parallel lines ℓ₁ and ℓ₂ -->
    <line x1="50" y1="15" x2="50" y2="170" stroke="currentColor" stroke-width="1.8" stroke-dasharray="5,3"/>
    <text x="45" y="12" fill="currentColor">ℓ₁</text>
    <line x1="130" y1="15" x2="130" y2="170" stroke="currentColor" stroke-width="1.8" stroke-dasharray="5,3"/>
    <text x="135" y="12" fill="currentColor">ℓ₂</text>
    <!-- Distance labels -->
    <line x1="50" y1="155" x2="130" y2="155" stroke="#999" stroke-width="1"/>
    <text x="90" y="170" text-anchor="middle" fill="currentColor" font-size="10">d</text>
    <!-- P, P', P'' -->
    <circle cx="20" cy="80" r="4" fill="#2255cc"/>
    <text x="6" y="78" fill="#2255cc">P</text>
    <circle cx="80" cy="80" r="4" fill="#aaa"/>
    <text x="84" y="78" fill="currentColor">P′</text>
    <circle cx="180" cy="80" r="4" fill="#c00"/>
    <text x="184" y="78" fill="#c00">P″</text>
    <!-- Dotted arrows -->
    <line x1="24" y1="80" x2="76" y2="80" stroke="#777" stroke-width="1" stroke-dasharray="3,2"/>
    <line x1="84" y1="80" x2="176" y2="80" stroke="#999" stroke-width="1.5"/>
    <text x="130" y="72" text-anchor="middle" fill="currentColor" font-size="10">→ translation 2d</text>
  </g>

  <!-- RIGHT: Intersecting reflections → rotation -->
  <g transform="translate(230,10)">
    <text x="90" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Intersecting reflections → rotation</text>
    <!-- Intersection center -->
    <circle cx="90" cy="100" r="4" fill="#e70"/>
    <text x="96" y="98" fill="#e70">O</text>
    <!-- ℓ₁: going upper-left -->
    <line x1="90" y1="100" x2="30" y2="30" stroke="currentColor" stroke-width="1.8" stroke-dasharray="5,3"/>
    <text x="24" y="26" fill="currentColor">ℓ₁</text>
    <!-- ℓ₂: going upper-right -->
    <line x1="90" y1="100" x2="150" y2="30" stroke="currentColor" stroke-width="1.8" stroke-dasharray="5,3"/>
    <text x="152" y="26" fill="currentColor">ℓ₂</text>
    <!-- Angle θ label -->
    <path d="M75,85 A20,20 0 0,1 105,85" fill="none" stroke="#999" stroke-width="1"/>
    <text x="90" y="80" text-anchor="middle" fill="currentColor" font-size="10">θ</text>
    <!-- P above ℓ₁, P' between lines, P'' above ℓ₂ -->
    <circle cx="45" cy="60" r="4" fill="#2255cc"/>
    <text x="30" y="58" fill="#2255cc">P</text>
    <circle cx="80" cy="55" r="4" fill="#aaa"/>
    <text x="65" y="53" fill="currentColor">P′</text>
    <circle cx="130" cy="60" r="4" fill="#c00"/>
    <text x="135" y="58" fill="#c00">P″</text>
    <line x1="49" y1="60" x2="76" y2="55" stroke="#777" stroke-width="1" stroke-dasharray="3,2"/>
    <line x1="84" y1="55" x2="126" y2="60" stroke="#999" stroke-width="1.5"/>
    <text x="90" y="145" text-anchor="middle" fill="currentColor" font-size="10">P → P″ = rotation by 2θ about O</text>
  </g>
</svg>
</div>
</div>

## 5.2 Symmetry Groups and the Crystallographic Restriction

A **discrete symmetry group** of the plane is a group of isometries that acts **properly discontinuously**: every compact set is moved off itself by all but finitely many group elements. Such groups arise naturally in crystallography, where one studies repeating patterns in materials. The mathematical theory of these groups was developed in the late 19th century, motivated by the classification of crystal structures.

If a symmetry group contains translations in two linearly independent directions, it is called a **wallpaper group** (or **plane crystallographic group**). The set of all translation vectors in such a group forms a **lattice** \(\Lambda \subset \mathbb{R}^2\). Geometrically, a lattice is an infinite grid of parallelograms tiling the plane.

<div class="theorem">
<strong>Crystallographic Restriction Theorem.</strong> If a wallpaper group contains a rotation, the rotation must have order 1, 2, 3, 4, or 6. That is, only rotational symmetries of \(60°\), \(90°\), \(120°\), \(180°\), or \(360°\) are compatible with a lattice structure.
</div>

<div class="proof">
<strong>Proof (matrix trace argument).</strong> Suppose rotation by angle \(\theta\) is a symmetry, with center at the origin (we can always translate). The rotation matrix is
\[
R_\theta = \begin{pmatrix} \cos\theta & -\sin\theta \\ \sin\theta & \cos\theta \end{pmatrix}.
\]
If \(\mathbf{v}\) is any lattice vector, then \(R_\theta(\mathbf{v})\) is also in the lattice (since \(R_\theta\) is a symmetry). This means \(R_\theta\) maps the lattice to itself, so with respect to a lattice basis, \(R_\theta\) has an integer matrix representation. The trace of a matrix is basis-independent: \(\text{tr}(R_\theta) = 2\cos\theta\). Since the matrix is an integer matrix, its trace is an integer:
\[
2\cos\theta \in \mathbb{Z} \implies \cos\theta \in \left\{0, \pm\frac{1}{2}, \pm 1\right\}.
\]
The corresponding angles are:
- \(\cos\theta = 1\): \(\theta = 0°\), order 1.
- \(\cos\theta = -1\): \(\theta = 180°\), order 2.
- \(\cos\theta = 0\): \(\theta = 90°\) or \(270°\), order 4.
- \(\cos\theta = 1/2\): \(\theta = 60°\) or \(300°\), order 6.
- \(\cos\theta = -1/2\): \(\theta = 120°\) or \(240°\), order 3.

These correspond to rotational orders 1, 2, 3, 4, and 6 only. \(\square\)
</div>

<div class="example">
<strong>Example (Why 5-fold symmetry is forbidden in crystals).</strong> Suppose we try to build a lattice with 5-fold rotational symmetry (rotation by \(72°\)). Then \(2\cos 72° = 2 \cdot 0.309 \approx 0.618\), which is not an integer. So no lattice can have 5-fold rotational symmetry. Attempting to tile the plane with regular pentagons fails because \(3 \times 108° = 324° \neq 360°\) and \(4 \times 108° = 432° > 360°\) — pentagons cannot tile the plane without gaps or overlaps. This rules out 5-fold symmetry in classical crystalline materials.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 280 180" width="280" height="180" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- Two pentagons side by side with a gap between them -->
  <!-- Pentagon 1: center (70,80), radius 50 -->
  <polygon points="70,30 117,62 100,118 40,118 23,62"
    fill="#dde6ff" stroke="currentColor" stroke-width="1.5"/>
  <!-- Pentagon 2: center (200,80), radius 50 -->
  <polygon points="200,30 247,62 230,118 170,118 153,62"
    fill="#dde6ff" stroke="currentColor" stroke-width="1.5"/>
  <!-- Gap indicator -->
  <path d="M117,62 L153,62 L170,118 L100,118 Z"
    fill="#ffd" stroke="#c00" stroke-width="1.5" stroke-dasharray="4,3"/>
  <text x="135" y="95" text-anchor="middle" fill="#c00" font-size="10">GAP</text>
  <text x="135" y="107" text-anchor="middle" fill="#c00" font-size="9">108°×3=324°≠360°</text>
  <!-- Angle label at shared vertex -->
  <circle cx="117" cy="62" r="3" fill="#e70"/>
  <circle cx="153" cy="62" r="3" fill="#e70"/>
  <text x="135" y="50" text-anchor="middle" fill="currentColor" font-size="10">3×108°=324°; gap of 36°</text>
  <text x="135" y="168" text-anchor="middle" fill="currentColor">Pentagons cannot tile the plane</text>
</svg>
</div>
</div>

This rules out, for example, fivefold symmetry in crystalline materials — a fact that made the discovery of **quasicrystals** by Dan Shechtman in 1984 so surprising. Shechtman observed a diffraction pattern with clear tenfold (hence fivefold) symmetry in a rapidly cooled aluminum-manganese alloy, an observation so unexpected that his colleagues initially dismissed it as error. He was eventually awarded the 2011 Nobel Prize in Chemistry. Quasicrystals exhibit fivefold diffraction patterns because they are not periodic but **quasiperiodic** — see Section 5.5.

## 5.3 The 17 Wallpaper Groups

The **wallpaper groups** are the 17 distinct discrete symmetry groups of the plane that contain translations in two independent directions. That there are exactly 17 was proven independently by Fedorov (1891) and Schoenflies (1891). They are classified by their rotational symmetry, the presence of reflections and glide reflections, and the type of lattice.

The 17 groups are denoted using the **crystallographic notation** (also called Hermann-Mauguin or IUCr notation): \(p1\), \(p2\), \(pm\), \(pg\), \(cm\), \(p2mm\), \(p2mg\), \(p2gg\), \(c2mm\), \(p4\), \(p4mm\), \(p4gm\), \(p3\), \(p3m1\), \(p31m\), \(p6\), \(p6mm\).

The first symbol (p or c) indicates a primitive or centered lattice. The number indicates the maximal rotational order. Additional letters indicate reflections (m) or glide reflections (g).

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 500 300" width="500" height="300" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- p1: simple translation tiling -->
  <g transform="translate(10,20)">
    <text x="55" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">p1</text>
    <text x="55" y="12" text-anchor="middle" fill="currentColor" font-size="9">translation only</text>
    <rect x="10" y="18" width="30" height="30" fill="#e8f0ff" stroke="#999" stroke-width="1"/>
    <rect x="40" y="18" width="30" height="30" fill="#e8f0ff" stroke="#999" stroke-width="1"/>
    <rect x="70" y="18" width="30" height="30" fill="#e8f0ff" stroke="#999" stroke-width="1"/>
    <rect x="10" y="48" width="30" height="30" fill="#e8f0ff" stroke="#999" stroke-width="1"/>
    <rect x="40" y="48" width="30" height="30" fill="#e8f0ff" stroke="#999" stroke-width="1"/>
    <rect x="70" y="48" width="30" height="30" fill="#e8f0ff" stroke="#999" stroke-width="1"/>
    <text x="55" y="92" text-anchor="middle" fill="currentColor" font-size="9">no rotation/reflection</text>
  </g>

  <!-- p4: 4-fold rotation -->
  <g transform="translate(140,20)">
    <text x="55" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">p4</text>
    <text x="55" y="12" text-anchor="middle" fill="currentColor" font-size="9">90° rotation centers</text>
    <rect x="10" y="18" width="30" height="30" fill="#ffeedd" stroke="#999" stroke-width="1"/>
    <rect x="40" y="18" width="30" height="30" fill="#ffeedd" stroke="#999" stroke-width="1"/>
    <rect x="70" y="18" width="30" height="30" fill="#ffeedd" stroke="#999" stroke-width="1"/>
    <rect x="10" y="48" width="30" height="30" fill="#ffeedd" stroke="#999" stroke-width="1"/>
    <rect x="40" y="48" width="30" height="30" fill="#ffeedd" stroke="#999" stroke-width="1"/>
    <rect x="70" y="48" width="30" height="30" fill="#ffeedd" stroke="#999" stroke-width="1"/>
    <!-- Rotation centers at each vertex -->
    <circle cx="10" cy="18" r="3" fill="#c00"/><circle cx="40" cy="18" r="3" fill="#c00"/>
    <circle cx="70" cy="18" r="3" fill="#c00"/><circle cx="100" cy="18" r="3" fill="#c00"/>
    <circle cx="10" cy="48" r="3" fill="#c00"/><circle cx="40" cy="48" r="3" fill="#c00"/>
    <circle cx="10" cy="78" r="3" fill="#c00"/>
    <text x="55" y="92" text-anchor="middle" fill="#c00" font-size="9">● = 90° rotation center</text>
  </g>

  <!-- p2: 180° rotation -->
  <g transform="translate(270,20)">
    <text x="55" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">p2</text>
    <text x="55" y="12" text-anchor="middle" fill="currentColor" font-size="9">180° rotation centers</text>
    <rect x="10" y="18" width="30" height="30" fill="#eeffee" stroke="#999" stroke-width="1"/>
    <rect x="40" y="18" width="30" height="30" fill="#eeffee" stroke="#999" stroke-width="1"/>
    <rect x="70" y="18" width="30" height="30" fill="#eeffee" stroke="#999" stroke-width="1"/>
    <rect x="10" y="48" width="30" height="30" fill="#eeffee" stroke="#999" stroke-width="1"/>
    <rect x="40" y="48" width="30" height="30" fill="#eeffee" stroke="#999" stroke-width="1"/>
    <rect x="70" y="48" width="30" height="30" fill="#eeffee" stroke="#999" stroke-width="1"/>
    <!-- 180° centers at edge midpoints -->
    <circle cx="25" cy="18" r="3" fill="#2a7"/><circle cx="55" cy="18" r="3" fill="#2a7"/>
    <circle cx="25" cy="33" r="3" fill="#2a7"/><circle cx="55" cy="33" r="3" fill="#2a7"/>
    <text x="55" y="92" text-anchor="middle" fill="#2a7" font-size="9">● = 180° rotation center</text>
  </g>

  <!-- pm: mirror reflections -->
  <g transform="translate(10,150)">
    <text x="55" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">pm</text>
    <text x="55" y="12" text-anchor="middle" fill="currentColor" font-size="9">reflection in parallel lines</text>
    <!-- Tiles with vertical mirror lines -->
    <rect x="10" y="18" width="30" height="55" fill="#ffe8ff" stroke="#999" stroke-width="1"/>
    <rect x="40" y="18" width="30" height="55" fill="#ffe8ff" stroke="#999" stroke-width="1"/>
    <rect x="70" y="18" width="30" height="55" fill="#ffe8ff" stroke="#999" stroke-width="1"/>
    <!-- Mirror lines -->
    <line x1="10" y1="15" x2="10" y2="78" stroke="#c00" stroke-width="1.5" stroke-dasharray="4,2"/>
    <line x1="40" y1="15" x2="40" y2="78" stroke="#c00" stroke-width="1.5" stroke-dasharray="4,2"/>
    <line x1="70" y1="15" x2="70" y2="78" stroke="#c00" stroke-width="1.5" stroke-dasharray="4,2"/>
    <line x1="100" y1="15" x2="100" y2="78" stroke="#c00" stroke-width="1.5" stroke-dasharray="4,2"/>
    <text x="55" y="92" text-anchor="middle" fill="#c00" font-size="9">dashed = mirror lines</text>
  </g>

  <!-- p6mm: highest symmetry -->
  <g transform="translate(180,150)">
    <text x="80" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">p6mm (highest symmetry)</text>
    <text x="80" y="12" text-anchor="middle" fill="currentColor" font-size="9">6-fold rotation + 6 reflection axes</text>
    <!-- Hexagonal tiling pattern -->
    <polygon points="80,25 110,42 110,75 80,92 50,75 50,42" fill="#fff8cc" stroke="currentColor" stroke-width="1.5"/>
    <polygon points="80,25 50,42 20,25 20,-8 50,-25 80,-8" fill="#fff8cc" stroke="currentColor" stroke-width="1.5"/>
    <polygon points="80,25 110,42 140,25 140,-8 110,-25 80,-8" fill="#fff8cc" stroke="currentColor" stroke-width="1.5"/>
    <!-- Center rotation marker -->
    <circle cx="80" cy="58" r="5" fill="#c00" fill-opacity="0.5"/>
    <!-- Mirror lines through center -->
    <line x1="80" y1="25" x2="80" y2="92" stroke="#c00" stroke-width="1" stroke-dasharray="3,2" opacity="0.7"/>
    <line x1="50" y1="42" x2="110" y2="75" stroke="#c00" stroke-width="1" stroke-dasharray="3,2" opacity="0.7"/>
    <line x1="110" y1="42" x2="50" y2="75" stroke="#c00" stroke-width="1" stroke-dasharray="3,2" opacity="0.7"/>
    <text x="80" y="110" text-anchor="middle" fill="currentColor" font-size="9">hexagonal tiling has p6mm symmetry</text>
  </g>
</svg>
</div>

<div class="remark">
<strong>Remark.</strong> The 17 wallpaper groups can be visualized through repeated patterns. All 17 appear in the decorative tilings of the Alhambra palace in Granada — a fact popularized (though debated by historians) in connection with the Islamic geometric tradition. The artist M.C. Escher explicitly studied the wallpaper groups and incorporated all 17 into his work. Escher's notebooks show him systematically filling the plane with interlocking birds, fish, and lizards, carefully constructing one representative of each of the 17 groups.

The classification of wallpaper groups is a remarkable confluence of group theory, topology, and crystallography. The proof that there are exactly 17 uses the crystallographic restriction (to limit rotational orders) and a careful case analysis of how rotations, reflections, and glide reflections interact.
</div>

## 5.4 Tessellations by Regular Polygons

A **tessellation** (or **tiling**) of the plane is a covering of \(\mathbb{R}^2\) by polygons (tiles) with no overlaps and no gaps. The simplest tessellations use a single type of regular polygon — these are the **regular tessellations**.

For a regular tessellation by \(\{p\}\) with \(q\) polygons meeting at each vertex, the angle condition requires that \(q\) copies of the interior angle of \(\{p\}\) exactly fill a full turn:

\[
q \cdot \frac{(p-2) \cdot 180°}{p} = 360°.
\]

This simplifies to \(\frac{1}{p} + \frac{1}{q} = \frac{1}{2}\), which has exactly three solutions in integers \(p, q \geq 3\):

- \((p, q) = (3, 6)\): triangular tiling \(\{3, 6\}\).
- \((p, q) = (4, 4)\): square tiling \(\{4, 4\}\).
- \((p, q) = (6, 3)\): hexagonal tiling \(\{6, 3\}\).

Notice the parallel with the Platonic solid condition: replacing \(> 1/2\) (strict inequality, giving a curved surface) with \(= 1/2\) (equality, giving a flat plane) yields exactly the regular tessellations. And replacing \(< 1/2\) gives the hyperbolic tessellations, which tile the hyperbolic plane. The three cases — sphere, plane, hyperbolic plane — correspond to positive, zero, and negative curvature.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 480 180" width="480" height="180" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- TRIANGULAR TILING {3,6} -->
  <g transform="translate(10,15)">
    <text x="70" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Triangular {3,6}</text>
    <!-- 4 rows of triangles -->
    <line x1="0" y1="30" x2="140" y2="30" stroke="currentColor" stroke-width="1.2"/>
    <line x1="0" y1="70" x2="140" y2="70" stroke="currentColor" stroke-width="1.2"/>
    <line x1="0" y1="110" x2="140" y2="110" stroke="currentColor" stroke-width="1.2"/>
    <!-- Vertical and diagonal lines -->
    <line x1="0" y1="30" x2="0" y2="110" stroke="currentColor" stroke-width="1.2"/>
    <line x1="35" y1="30" x2="35" y2="110" stroke="currentColor" stroke-width="1.2"/>
    <line x1="70" y1="30" x2="70" y2="110" stroke="currentColor" stroke-width="1.2"/>
    <line x1="105" y1="30" x2="105" y2="110" stroke="currentColor" stroke-width="1.2"/>
    <line x1="140" y1="30" x2="140" y2="110" stroke="currentColor" stroke-width="1.2"/>
    <!-- Diagonals -->
    <line x1="0" y1="110" x2="35" y2="30" stroke="currentColor" stroke-width="1.2"/>
    <line x1="35" y1="110" x2="70" y2="30" stroke="currentColor" stroke-width="1.2"/>
    <line x1="70" y1="110" x2="105" y2="30" stroke="currentColor" stroke-width="1.2"/>
    <line x1="105" y1="110" x2="140" y2="30" stroke="currentColor" stroke-width="1.2"/>
    <line x1="0" y1="70" x2="35" y2="110" stroke="currentColor" stroke-width="1.2"/>
    <line x1="35" y1="70" x2="70" y2="110" stroke="currentColor" stroke-width="1.2"/>
    <line x1="70" y1="70" x2="105" y2="110" stroke="currentColor" stroke-width="1.2"/>
    <line x1="105" y1="70" x2="140" y2="110" stroke="currentColor" stroke-width="1.2"/>
    <text x="70" y="130" text-anchor="middle" fill="currentColor" font-size="10">6 triangles/vertex</text>
    <text x="70" y="142" text-anchor="middle" fill="#2a7" font-size="10">6×60°=360° ✓</text>
  </g>

  <!-- SQUARE TILING {4,4} -->
  <g transform="translate(180,15)">
    <text x="70" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Square {4,4}</text>
    <rect x="0" y="20" width="140" height="90" fill="none" stroke="currentColor" stroke-width="1.2"/>
    <line x1="35" y1="20" x2="35" y2="110" stroke="currentColor" stroke-width="1.2"/>
    <line x1="70" y1="20" x2="70" y2="110" stroke="currentColor" stroke-width="1.2"/>
    <line x1="105" y1="20" x2="105" y2="110" stroke="currentColor" stroke-width="1.2"/>
    <line x1="0" y1="50" x2="140" y2="50" stroke="currentColor" stroke-width="1.2"/>
    <line x1="0" y1="80" x2="140" y2="80" stroke="currentColor" stroke-width="1.2"/>
    <text x="70" y="130" text-anchor="middle" fill="currentColor" font-size="10">4 squares/vertex</text>
    <text x="70" y="142" text-anchor="middle" fill="#2a7" font-size="10">4×90°=360° ✓</text>
  </g>

  <!-- HEXAGONAL TILING {6,3} -->
  <g transform="translate(355,15)">
    <text x="55" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Hexagonal {6,3}</text>
    <!-- Partial hexagonal tiling: 3 hexagons -->
    <polygon points="55,22 80,35 80,62 55,75 30,62 30,35" fill="#fffde0" stroke="currentColor" stroke-width="1.5"/>
    <polygon points="55,22 30,35 5,22 5,-5 30,-18 55,-5" fill="#fffde0" stroke="currentColor" stroke-width="1.5"/>
    <polygon points="55,22 80,35 105,22 105,-5 80,-18 55,-5" fill="#fffde0" stroke="currentColor" stroke-width="1.5"/>
    <polygon points="55,75 80,62 105,75 105,102 80,115 55,102" fill="#fffde0" stroke="currentColor" stroke-width="1.5"/>
    <text x="55" y="132" text-anchor="middle" fill="currentColor" font-size="10">3 hexagons/vertex</text>
    <text x="55" y="144" text-anchor="middle" fill="#2a7" font-size="10">3×120°=360° ✓</text>
  </g>
</svg>
</div>

**Semi-regular (Archimedean) tessellations** allow more than one type of regular polygon but require all vertices to be equivalent. There are exactly 8 such tessellations (plus the 3 regular ones), including the snub square tiling and the trihexagonal tiling \((3.4.6.4)\).

<div class="example">
<strong>Example (The trihexagonal tiling \(3.6.3.6\)).</strong> In this Archimedean tessellation, alternating triangles and hexagons meet at each vertex, with vertex pattern triangle-hexagon-triangle-hexagon. The angles sum to \(60° + 120° + 60° + 120° = 360°\). ✓

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 260 220" width="260" height="220" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- Trihexagonal tiling: alternating triangles and hexagons -->
  <!-- Central hexagon -->
  <polygon points="130,55 157,70 157,100 130,115 103,100 103,70"
    fill="#e8f4ff" stroke="currentColor" stroke-width="1.5"/>
  <!-- Triangles on alternating edges of the central hexagon -->
  <!-- Top triangle -->
  <polygon points="130,55 157,70 103,70"
    fill="#ffe8e8" stroke="currentColor" stroke-width="1.5"/>
  <!-- Bottom triangle -->
  <polygon points="130,115 157,100 103,100"
    fill="#ffe8e8" stroke="currentColor" stroke-width="1.5"/>
  <!-- Upper-right hex -->
  <polygon points="157,70 184,55 211,70 211,100 184,115 157,100"
    fill="#e8f4ff" stroke="currentColor" stroke-width="1.5"/>
  <!-- Upper-right triangle -->
  <polygon points="157,70 157,100 184,55"
    fill="#ffe8e8" stroke="currentColor" stroke-width="1.5"/>
  <!-- Upper-left hex -->
  <polygon points="103,70 76,55 49,70 49,100 76,115 103,100"
    fill="#e8f4ff" stroke="currentColor" stroke-width="1.5"/>
  <!-- Upper-left triangle -->
  <polygon points="103,70 103,100 76,55"
    fill="#ffe8e8" stroke="currentColor" stroke-width="1.5"/>
  <!-- Bottom hexagon -->
  <polygon points="130,115 157,100 157,130 130,145 103,130 103,100"
    fill="#e8f4ff" stroke="currentColor" stroke-width="1.5"/>
  <!-- Mark a vertex -->
  <circle cx="157" cy="70" r="4" fill="#c00"/>
  <!-- Angle labels at that vertex -->
  <text x="166" y="67" fill="#c00" font-size="9">△ 60°</text>
  <!-- Labels -->
  <text x="130" y="165" text-anchor="middle" fill="currentColor">Trihexagonal tiling 3.6.3.6</text>
  <text x="130" y="178" text-anchor="middle" fill="currentColor">At each vertex: 60°+120°+60°+120°=360°</text>
  <text x="130" y="191" text-anchor="middle" fill="currentColor" font-size="10">blue = hexagons, pink = triangles</text>
</svg>
</div>
</div>

## 5.5 Penrose Tilings and Quasiperiodicity

**Penrose tilings** provide striking examples of non-periodic tilings with local fivefold symmetry. Developed by Roger Penrose in 1974, they use two types of rhombus — a "thick" rhombus with angles \(72°\) and \(108°\), and a "thin" rhombus with angles \(36°\) and \(144°\) — assembled according to matching rules that force aperiodicity.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 340 180" width="340" height="180" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <!-- Thick rhombus: angles 72° and 108° -->
  <g transform="translate(30,20)">
    <text x="60" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Thick rhombus</text>
    <text x="60" y="12" text-anchor="middle" fill="currentColor" font-size="10">angles 72° and 108°</text>
    <!-- Rhombus with wider angle -->
    <polygon points="60,30 100,55 60,105 20,55"
      fill="#dde6ff" stroke="#2255cc" stroke-width="2"/>
    <!-- Angle arcs -->
    <path d="M60,30 A15,15 0 0,1 78,42" fill="none" stroke="#c00" stroke-width="1.2"/>
    <text x="72" y="38" fill="#c00" font-size="9">72°</text>
    <path d="M35,55 A20,20 0 0,0 60,65" fill="none" stroke="#2a7" stroke-width="1.2"/>
    <text x="30" y="72" fill="#2a7" font-size="9">108°</text>
  </g>

  <!-- Thin rhombus: angles 36° and 144° -->
  <g transform="translate(200,20)">
    <text x="60" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Thin rhombus</text>
    <text x="60" y="12" text-anchor="middle" fill="currentColor" font-size="10">angles 36° and 144°</text>
    <!-- Rhombus with narrower angle -->
    <polygon points="60,25 90,60 60,105 30,60"
      fill="#ffeedd" stroke="#e70" stroke-width="2"/>
    <!-- Angle arcs -->
    <path d="M60,25 A15,15 0 0,1 73,40" fill="none" stroke="#c00" stroke-width="1.2"/>
    <text x="68" y="37" fill="#c00" font-size="9">36°</text>
    <path d="M35,60 A18,18 0 0,0 55,72" fill="none" stroke="#2a7" stroke-width="1.2"/>
    <text x="22" y="72" fill="#2a7" font-size="9">144°</text>
  </g>

  <text x="170" y="158" text-anchor="middle" fill="currentColor" font-size="11">With matching rules → aperiodic tiling only</text>
</svg>
</div>

Why are Penrose tilings quasiperiodic? The key is the **inflation rule**: each thick rhombus can be divided into smaller thick and thin rhombuses in a definite pattern (scaled by the golden ratio \(\phi = (1+\sqrt{5})/2\)), and similarly for the thin rhombus. Iterating this inflation generates larger and larger patches of a valid Penrose tiling. The golden ratio appears because the tiling has approximate fivefold symmetry, and \(\cos 72° = (\sqrt{5}-1)/4\) involves \(\sqrt{5}\).

Three remarkable properties of Penrose tilings:

1. **Aperiodicity**: No Penrose tiling has any translational symmetry. There is no vector \(\mathbf{v} \neq 0\) such that translating the tiling by \(\mathbf{v}\) gives the same tiling.

2. **Local isomorphism**: Every finite patch that appears in one Penrose tiling appears in every other Penrose tiling (with the same inflation rules). In fact, every finite patch appears infinitely often.

3. **Fivefold quasisymmetry**: The diffraction pattern of a Penrose tiling has perfect tenfold (hence fivefold) symmetry, matching the electron diffraction patterns of quasicrystals. This is why Shechtman's discovery (Section 5.2) was eventually understood through the mathematics of Penrose tilings.

The connection to number theory is deep: Penrose tilings can be understood as two-dimensional "cut-and-project" sections of a five-dimensional periodic lattice. The fivefold symmetry that is forbidden in the plane can exist in \(\mathbb{R}^5\), and the tiling is a shadow of that higher-dimensional periodicity.

---

# Chapter 6: Sphere Packings and the Kissing Problem

## 6.1 Sphere Packing Fundamentals

How efficiently can identical spheres be packed in space? This deceptively simple question has occupied mathematicians for over four centuries and, in dimensions 8 and 24, was finally resolved in 2016 by Maryna Viazovska — one of the most spectacular recent results in mathematics.

Formally, a **sphere packing** in \(\mathbb{R}^n\) is a collection of non-overlapping unit spheres (balls of radius 1) in \(n\)-dimensional Euclidean space. The centers form a **discrete set** \(S \subset \mathbb{R}^n\) with \(\|x - y\| \geq 2\) for all distinct \(x, y \in S\).

<div class="definition">
<strong>Packing density</strong>: The <em>density</em> \(\Delta\) of a sphere packing is the fraction of volume covered by the spheres:
\[\Delta = \limsup_{R \to \infty} \frac{\text{Vol}(S \cap B_R) \cdot \omega_n}{\text{Vol}(B_R)},\]
where \(\omega_n = \pi^{n/2}/\Gamma(n/2 + 1)\) is the volume of a unit ball in \(\mathbb{R}^n\) and the limit is taken over balls \(B_R\) of radius \(R\) centered at the origin.
</div>

A **lattice packing** uses the translates of a lattice \(\Lambda \subset \mathbb{R}^n\) as sphere centers; every center is of the form \(Mv\) for a fixed matrix \(M\) and \(v \in \mathbb{Z}^n\). Lattice packings are easier to analyze but need not be optimal. In dimensions 8 and 24, however, the optimal packing turns out to be a lattice packing — a remarkable fact.

### 6.1.1 Worked Example: Density of the Hexagonal Lattice

<div class="example">
<strong>Example (Hexagonal circle packing density).</strong> The hexagonal lattice in \(\mathbb{R}^2\) has basis vectors \(\mathbf{v}_1 = (1, 0)\) and \(\mathbf{v}_2 = (1/2, \sqrt{3}/2)\). The fundamental domain (parallelogram spanned by these vectors) has area \(|\mathbf{v}_1 \times \mathbf{v}_2| = \sqrt{3}/2\).

Each circle of radius \(1/2\) (so that adjacent circles just touch) has area \(\pi(1/2)^2 = \pi/4\). Each fundamental domain contains exactly one circle center (since the lattice has one point per fundamental domain).

Packing density:
\[
\Delta_2 = \frac{\text{area of one circle}}{\text{area of fundamental domain}} = \frac{\pi/4}{\sqrt{3}/2} = \frac{\pi}{2\sqrt{3}} = \frac{\pi\sqrt{3}}{6} \approx 0.9069.
\]

This means the hexagonal packing covers about 90.69% of the plane — the most efficient possible, as proven by Thue (1892, with a gap) and rigorously by Fejes Tóth (1940).

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 320 220" width="320" height="220" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- Hexagonal circle packing -->
  <!-- Row 1: y=30, centers at x=30,70,110,150,190,230 -->
  <!-- Row 2 (offset): y=65, centers at x=50,90,130,170,210 -->
  <!-- Circle radius = 18 (so gap = 0 between touching circles) -->
  <g opacity="0.9">
    <!-- Row 1 -->
    <circle cx="30" cy="30" r="18" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="70" cy="30" r="18" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="110" cy="30" r="18" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="150" cy="30" r="18" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="190" cy="30" r="18" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="230" cy="30" r="18" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <!-- Row 2 (offset by 20) -->
    <circle cx="50" cy="64" r="18" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="90" cy="64" r="18" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="130" cy="64" r="18" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="170" cy="64" r="18" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="210" cy="64" r="18" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <!-- Row 3 -->
    <circle cx="30" cy="98" r="18" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="70" cy="98" r="18" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="110" cy="98" r="18" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="150" cy="98" r="18" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="190" cy="98" r="18" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="230" cy="98" r="18" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
  </g>
  <!-- Center dots to show triangular lattice -->
  <circle cx="110" cy="30" r="2" fill="#c00"/>
  <circle cx="90" cy="64" r="2" fill="#c00"/>
  <circle cx="130" cy="64" r="2" fill="#c00"/>
  <circle cx="110" cy="98" r="2" fill="#c00"/>
  <!-- Fundamental domain parallelogram -->
  <polygon points="110,30 150,30 130,64 90,64"
    fill="none" stroke="#c00" stroke-width="1.5" stroke-dasharray="4,2"/>
  <text x="120" y="50" text-anchor="middle" fill="#c00" font-size="9">fund. domain</text>

  <text x="160" y="130" text-anchor="middle" fill="currentColor">Hexagonal circle packing</text>
  <text x="160" y="143" text-anchor="middle" fill="currentColor">Each circle touches 6 neighbors</text>
  <text x="160" y="156" text-anchor="middle" fill="currentColor">Density = π/(2√3) ≈ 90.69%</text>
</svg>
</div>
</div>

## 6.2 Densest Packings in Low Dimensions

In dimension 1, spheres are intervals, and the unique packing achieves density 1. In higher dimensions, the optimal density decreases.

In dimension 2, the densest packing of circles is achieved by the **hexagonal lattice** (also called the triangular lattice), where each circle touches exactly six others. The density is

\[
\Delta_2 = \frac{\pi}{2\sqrt{3}} \approx 0.9069.
\]

This was proven by Axel Thue (1892, with a gap) and rigorously by László Fejes Tóth (1940).

In dimension 3, the two most natural packings are:

- **Face-centered cubic (FCC)**: spheres centered at all points with integer coordinates summing to an even number, or equivalently the lattice generated by \((1,1,0)\), \((1,0,1)\), \((0,1,1)\). Each sphere touches 12 others.
- **Hexagonal close packing (HCP)**: a hexagonal layer arrangement alternating in an ABABAB pattern. Also achieves 12 touching neighbors.

Both achieve density

\[
\Delta_3 = \frac{\pi}{3\sqrt{2}} \approx 0.7405.
\]

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 420 200" width="420" height="200" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- FCC (ABC stacking) — left panel -->
  <g transform="translate(10,10)">
    <text x="90" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">FCC (ABCABC stacking)</text>
    <!-- Layer A (bottom): y=160, x=20,60,100,140 -->
    <circle cx="20" cy="160" r="16" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="60" cy="160" r="16" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="100" cy="160" r="16" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="140" cy="160" r="16" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <text x="158" y="164" fill="#2255cc" font-size="10">A</text>
    <!-- Layer B (middle, offset 1/3): y=122, x=33,73,113 -->
    <circle cx="33" cy="122" r="16" fill="#ffeedd" stroke="#e70" stroke-width="1.5"/>
    <circle cx="73" cy="122" r="16" fill="#ffeedd" stroke="#e70" stroke-width="1.5"/>
    <circle cx="113" cy="122" r="16" fill="#ffeedd" stroke="#e70" stroke-width="1.5"/>
    <text x="158" y="126" fill="#e70" font-size="10">B</text>
    <!-- Layer C (top, offset 2/3): y=84, x=46,86,126 -->
    <circle cx="46" cy="84" r="16" fill="#ffe8ff" stroke="#a0a" stroke-width="1.5"/>
    <circle cx="86" cy="84" r="16" fill="#ffe8ff" stroke="#a0a" stroke-width="1.5"/>
    <circle cx="126" cy="84" r="16" fill="#ffe8ff" stroke="#a0a" stroke-width="1.5"/>
    <text x="158" y="88" fill="#a0a" font-size="10">C</text>
    <text x="90" y="185" text-anchor="middle" fill="currentColor" font-size="10">Each layer offset by 1/3</text>
  </g>

  <!-- HCP (ABABAB stacking) — right panel -->
  <g transform="translate(230,10)">
    <text x="90" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">HCP (ABABAB stacking)</text>
    <!-- Layer A (bottom): y=160 -->
    <circle cx="20" cy="160" r="16" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="60" cy="160" r="16" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="100" cy="160" r="16" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="140" cy="160" r="16" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <text x="158" y="164" fill="#2255cc" font-size="10">A</text>
    <!-- Layer B (middle, offset 1/2): y=122 -->
    <circle cx="40" cy="122" r="16" fill="#ffeedd" stroke="#e70" stroke-width="1.5"/>
    <circle cx="80" cy="122" r="16" fill="#ffeedd" stroke="#e70" stroke-width="1.5"/>
    <circle cx="120" cy="122" r="16" fill="#ffeedd" stroke="#e70" stroke-width="1.5"/>
    <text x="158" y="126" fill="#e70" font-size="10">B</text>
    <!-- Layer A again (top): y=84 -->
    <circle cx="20" cy="84" r="16" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="60" cy="84" r="16" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="100" cy="84" r="16" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="140" cy="84" r="16" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <text x="158" y="88" fill="#2255cc" font-size="10">A</text>
    <text x="90" y="185" text-anchor="middle" fill="currentColor" font-size="10">Layers A and B alternate</text>
  </g>

  <text x="210" y="198" text-anchor="middle" fill="currentColor">Both FCC and HCP achieve density π/(3√2) ≈ 74.05%</text>
</svg>
</div>

## 6.3 Kepler's Conjecture and Hales's Theorem

In 1611, Johannes Kepler stated in *Strena seu de Nive Sexangula* ("A New Year's Gift of Six-Cornered Snow") that no packing of equal spheres in \(\mathbb{R}^3\) has a greater density than the FCC or HCP arrangement. This became known as **Kepler's conjecture**. The paper was motivated by the question of why snowflakes have hexagonal symmetry — Kepler traced it all the way back to sphere packing, making a remarkably prescient connection between macroscopic crystal form and microscopic atomic arrangement.

For nearly four centuries, the problem resisted all attempts at proof. In 1998, Thomas Hales announced a proof, and it was published in 2005.

<div class="theorem">
<strong>Theorem (Hales–Ferguson, 1998/2005).</strong> No packing of unit spheres in \(\mathbb{R}^3\) has density exceeding \(\pi / (3\sqrt{2}) \approx 0.7405\). In particular, the FCC and HCP packings are optimal.
</div>

Hales's proof is a computer-assisted verification involving a reduction to a finite but large number of cases, each verified by computer. The proof reduced the problem to showing that a certain linear programming problem had a specific optimal value, then verified this by exhaustive search over several thousand cases. A fully formal proof (project *Flyspeck*, completed 2014) was subsequently certified in the Isabelle/HOL proof assistant, making it one of the most rigorously verified major mathematical results. The Flyspeck project, involving many collaborators over ten years, represents a new paradigm in mathematical proof: human-guided, machine-verified.

## 6.4 The Kissing Number Problem

A related question: how many unit spheres can simultaneously touch a given central unit sphere? This is the **kissing number** problem. If all spheres have radius 1 and the central sphere is centered at the origin, then the kissing number \(\kappa_n\) is the maximum number of points on the sphere \(S^{n-1}\) of radius 2 such that any two points are at distance at least 2 from each other. Equivalently, it is the maximum number of non-overlapping unit spheres that can touch a central unit sphere.

The term "kissing number" comes from the spheres "kissing" (touching) the central sphere without overlapping each other.

In dimension 2, the answer is clearly \(\kappa_2 = 6\) — six circles fit around a central circle in the hexagonal arrangement, and simple angle-counting shows that 7 cannot fit.

In dimension 3, the question was famously debated by Isaac Newton (who argued \(\kappa_3 = 12\)) and David Gregory (who thought 13 might be possible), in 1694. Their dispute was remarkable: Newton was right, but he could not prove it, and neither could Gregory. The reason Gregory thought 13 might work is that the 12 spheres in the icosahedral arrangement leave small gaps — the 12 touching spheres are not jammed, and can be moved around without separating from the central sphere. This "slack" makes it non-obvious that a 13th sphere cannot be squeezed in. The correct answer \(\kappa_3 = 12\) was not rigorously proven until **Schütte and van der Waerden** in 1953, nearly three centuries after Newton and Gregory's debate.

<div class="theorem">
<strong>Theorem (Schütte–van der Waerden, 1953).</strong> \(\kappa_3 = 12\). The maximum number of non-overlapping unit spheres that can touch a central unit sphere in \(\mathbb{R}^3\) is 12.
</div>

The 12 touching spheres can be arranged in the FCC configuration (vertices of a cuboctahedron) but also in many other configurations, since the constraint is not tight — the 12 touching spheres in the icosahedral arrangement, for instance, leave small gaps between neighbors, and one cannot fit a 13th sphere without rearranging.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 420 200" width="420" height="200" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- Left: Cuboctahedron arrangement (FCC), 12 touching spheres schematic -->
  <g transform="translate(10,10)">
    <text x="90" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Cuboctahedron (FCC)</text>
    <!-- Central sphere -->
    <circle cx="90" cy="100" r="22" fill="#dde6ff" stroke="#2255cc" stroke-width="2"/>
    <text x="90" y="104" text-anchor="middle" fill="#2255cc" font-size="10">center</text>
    <!-- 12 surrounding spheres (approximate 2D projection) -->
    <!-- Top/bottom -->
    <circle cx="90" cy="48" r="16" fill="#eef" stroke="#999" stroke-width="1.2"/>
    <circle cx="90" cy="152" r="16" fill="#eef" stroke="#999" stroke-width="1.2"/>
    <!-- Left/right -->
    <circle cx="38" cy="100" r="16" fill="#eef" stroke="#999" stroke-width="1.2"/>
    <circle cx="142" cy="100" r="16" fill="#eef" stroke="#999" stroke-width="1.2"/>
    <!-- Diagonals (showing 8 more approximately) -->
    <circle cx="52" cy="60" r="14" fill="#eef" stroke="#999" stroke-width="1.2"/>
    <circle cx="128" cy="60" r="14" fill="#eef" stroke="#999" stroke-width="1.2"/>
    <circle cx="52" cy="140" r="14" fill="#eef" stroke="#999" stroke-width="1.2"/>
    <circle cx="128" cy="140" r="14" fill="#eef" stroke="#999" stroke-width="1.2"/>
    <text x="90" y="178" text-anchor="middle" fill="currentColor">12 spheres touch center</text>
    <text x="90" y="190" text-anchor="middle" fill="currentColor" font-size="9">vertices of a cuboctahedron</text>
  </g>

  <!-- Arrow -->
  <text x="210" y="100" text-anchor="middle" fill="currentColor" font-size="16">≅</text>

  <!-- Right: Icosahedral arrangement -->
  <g transform="translate(230,10)">
    <text x="90" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Icosahedral arrangement</text>
    <!-- Central sphere -->
    <circle cx="90" cy="100" r="22" fill="#ffeedd" stroke="#e70" stroke-width="2"/>
    <text x="90" y="104" text-anchor="middle" fill="#e70" font-size="10">center</text>
    <!-- 12 surrounding spheres (icosahedral, slightly different arrangement) -->
    <circle cx="90" cy="46" r="16" fill="#fff0dd" stroke="#c60" stroke-width="1.2"/>
    <circle cx="90" cy="154" r="16" fill="#fff0dd" stroke="#c60" stroke-width="1.2"/>
    <circle cx="36" cy="95" r="16" fill="#fff0dd" stroke="#c60" stroke-width="1.2"/>
    <circle cx="144" cy="95" r="16" fill="#fff0dd" stroke="#c60" stroke-width="1.2"/>
    <circle cx="55" cy="58" r="14" fill="#fff0dd" stroke="#c60" stroke-width="1.2"/>
    <circle cx="125" cy="58" r="14" fill="#fff0dd" stroke="#c60" stroke-width="1.2"/>
    <circle cx="55" cy="142" r="14" fill="#fff0dd" stroke="#c60" stroke-width="1.2"/>
    <circle cx="125" cy="142" r="14" fill="#fff0dd" stroke="#c60" stroke-width="1.2"/>
    <text x="90" y="178" text-anchor="middle" fill="currentColor">same count: 12</text>
    <text x="90" y="190" text-anchor="middle" fill="currentColor" font-size="9">gaps between neighbors → not rigid</text>
  </g>
</svg>
</div>

## 6.5 The Exceptional Dimensions 8 and 24

The kissing number problem has a particularly beautiful solution in two special dimensions. What makes dimensions 8 and 24 special is the existence of exceptional lattices — the \(E_8\) lattice and the Leech lattice — which are extraordinarily symmetric and self-dual.

**Dimension 8.** The \(E_8\) lattice is a remarkable lattice in \(\mathbb{R}^8\). Its points are all vectors \((x_1, \ldots, x_8)\) where either all coordinates are integers or all are half-integers, and \(\sum x_i\) is even. The \(E_8\) lattice has 240 vectors of minimal length \(\sqrt{2}\) (or 240 of length 2, depending on normalization), meaning each sphere touches exactly 240 others.

The \(E_8\) lattice has an extraordinary symmetry group of order 696,729,600 — the Weyl group of the exceptional Lie algebra \(E_8\). It is the unique even unimodular lattice in \(\mathbb{R}^8\) (meaning the squared lengths of all lattice vectors are even, and the lattice equals its own dual). These algebraic properties are precisely what make it optimal for sphere packing.

<div class="theorem">
<strong>Theorem (Viazovska, 2016).</strong> \(\kappa_8 = 240\). The \(E_8\) lattice packing achieves the maximum kissing number in \(\mathbb{R}^8\). Moreover, the \(E_8\) lattice is the densest sphere packing in \(\mathbb{R}^8\), with density \(\pi^4/384 \approx 0.2537\).
</div>

Maryna Viazovska (Ukrainian mathematician, born 1984) proved this in a 21-page paper submitted to arXiv in March 2016. The proof was checked and confirmed within a week — remarkable for a result of this importance. Within a week of her \(E_8\) paper, she and four co-authors (Cohn, Kumar, Miller, Radchenko) extended the method to dimension 24. Viazovska received the Fields Medal in 2022 for this work.

**Dimension 24.** The **Leech lattice** \(\Lambda_{24}\) in \(\mathbb{R}^{24}\) is an even unimodular lattice with minimum distance \(\sqrt{4} = 2\) (equivalently, minimum squared length 4) and 196,560 vectors of that minimal length. This gives the kissing number in dimension 24:

<div class="theorem">
<strong>Theorem (Viazovska et al., 2016).</strong> \(\kappa_{24} = 196560\). The Leech lattice achieves the maximum kissing number in \(\mathbb{R}^{24}\). Moreover, the Leech lattice is the densest sphere packing in \(\mathbb{R}^{24}\), with density \(\pi^{12}/12!\).
</div>

### 6.5.1 The Linear Programming / Viazovska Method

These proofs use the **linear programming method** of Delsarte (1972) combined with the **interpolation method** developed by Viazovska (2016). The Delsarte bound says: if there exists a function \(f: \mathbb{R}^n \to \mathbb{R}\) (a "test function") satisfying:

1. \(f(0) = 1\),
2. \(f(x) \leq 0\) for all \(|x| \geq 2r\) (where \(r\) is the sphere radius),
3. \(\hat{f}(\xi) \geq 0\) for all \(\xi\) (non-negative Fourier transform),

then the packing density satisfies \(\Delta \leq \hat{f}(0)\). The bound is *sharp* (achievable) if equality holds at the lattice's actual minimal vectors.

The challenge Viazovska solved was constructing an explicit "magic function" \(f\) for which the Delsarte bound exactly equals the \(E_8\) or Leech lattice density. She found this function using the theory of **modular forms** — quasiperiodic functions on the complex upper half-plane that arise in number theory, algebraic geometry, and string theory. The remarkable fact is that the magic function can be written explicitly in terms of classical modular forms (Eisenstein series, the Jacobi theta function, the Ramanujan \(\Delta\)-function), and its key properties can be verified algebraically.

<div class="remark">
<strong>Remark (Why dimensions 8 and 24 are special).</strong> The exceptional nature of dimensions 8 and 24 has several intertwined explanations:

- **Lattice theory**: \(E_8\) and \(\Lambda_{24}\) are the only even unimodular lattices in dimensions 8 and 24, respectively (up to isometry). Even unimodular lattices exist only in dimensions divisible by 8, and the first two cases (dimensions 8 and 24) happen to be optimal for packing.

- **Root systems**: \(E_8\) is the root system of the exceptional simple Lie algebra \(E_8\), one of the five "exceptional" Lie algebras that appear in the classification of simple Lie groups. The other exceptional algebras (\(G_2, F_4, E_6, E_7\)) are related to octonions and other non-associative division algebras — reflecting deeper arithmetic specialness of these dimensions.

- **Error-correcting codes**: The Leech lattice \(\Lambda_{24}\) is closely related to the **Golay code**, a perfect binary error-correcting code of length 24. The Golay code achieves the theoretical maximum error-correction for a binary linear code of its parameters, and the Leech lattice is constructed from it.

- **Sporadic simple groups**: The symmetry group of \(\Lambda_{24}\) contains the Conway group \(Co_0\), which in turn contains \(Co_1, Co_2, Co_3\) and many other sporadic simple groups — the "happy family" of 20 of the 26 sporadic simple groups. The Monster group itself (the largest sporadic simple group) is connected to the Leech lattice through the theory of vertex operator algebras and monstrous moonshine. So the sphere packing problem in dimension 24 is connected to some of the deepest structure in finite group theory.
</div>

## 6.6 Known Kissing Numbers

The exact kissing number is known only for \(n = 1, 2, 3, 4, 8, 24\):

| Dimension \(n\) | \(\kappa_n\) | Achieved by |
|---|---|---|
| 1 | 2 | Trivial (two intervals touching a central one) |
| 2 | 6 | Hexagonal lattice |
| 3 | 12 | FCC (icosahedron arrangement) |
| 4 | 24 | \(D_4\) lattice (24-cell) |
| 8 | 240 | \(E_8\) lattice |
| 24 | 196560 | Leech lattice |

In dimension 4, the 24-cell \(\{3,4,3\}\) — whose vertices form the root system of \(D_4\) — realizes the kissing number 24. This connects the sphere packing problem back to the exceptional regular polytopes of Chapter 3: the 24-cell's vertices are precisely the 24 shortest vectors of the \(D_4\) lattice.

<div class="example">
<strong>Example (Kissing number in dimension 4).</strong> The \(D_4\) lattice in \(\mathbb{R}^4\) consists of all integer vectors \((x_1, x_2, x_3, x_4)\) with \(x_1 + x_2 + x_3 + x_4\) even. The shortest nonzero vectors have squared length 2, and there are 24 of them: the 24 vectors \(\pm e_i \pm e_j\) (for \(i \neq j\)). These 24 vectors are exactly the vertices of the 24-cell centered at the origin with edge length \(\sqrt{2}\). This is why \(\kappa_4 = 24\): in the \(D_4\) lattice packing, each sphere is touched by exactly 24 others, and no more can be added. The 24-cell is its own "kissing polytope."
</div>

The determination of kissing numbers in other dimensions (especially 5, 6, 7) remains one of the central open problems in discrete geometry. Upper and lower bounds are known but there are significant gaps. The **Delsarte linear programming bound** gives upper bounds, while explicit constructions of lattices or packings give lower bounds.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 460 180" width="460" height="180" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <defs>
    <marker id="axarr" markerWidth="8" markerHeight="8" refX="6" refY="4" orient="auto">
      <path d="M0,1 L8,4 L0,7 Z" fill="currentColor"/>
    </marker>
  </defs>
  <!-- Axes -->
  <line x1="30" y1="130" x2="440" y2="130" stroke="#999" stroke-width="1.5" marker-end="url(#axarr)"/>
  <line x1="30" y1="130" x2="30" y2="20" stroke="#999" stroke-width="1.5" marker-end="url(#axarr)"/>
  <text x="445" y="134" fill="currentColor" font-size="10">dim n</text>
  <text x="32" y="18" fill="currentColor" font-size="10">κₙ</text>

  <!-- Data points: (dim, kissing) scaled to SVG -->
  <!-- x: dim 1→50, 2→90, 3→130, 4→170, 8→280, 24→430 (log-ish) -->
  <!-- y: kissing 2→128, 6→126, 12→122, 24→118, 240→90, 196560→30 (log scale approx) -->

  <!-- dim 1: κ=2 -->
  <circle cx="50" cy="127" r="5" fill="#2255cc"/>
  <text x="44" y="145" fill="currentColor" font-size="9">n=1</text>
  <text x="44" y="155" fill="#2255cc" font-size="9">κ=2</text>

  <!-- dim 2: κ=6 -->
  <circle cx="90" cy="123" r="5" fill="#2255cc"/>
  <text x="84" y="145" fill="currentColor" font-size="9">n=2</text>
  <text x="84" y="155" fill="#2255cc" font-size="9">κ=6</text>

  <!-- dim 3: κ=12 -->
  <circle cx="130" cy="116" r="5" fill="#2255cc"/>
  <text x="120" y="145" fill="currentColor" font-size="9">n=3</text>
  <text x="120" y="155" fill="#2255cc" font-size="9">κ=12</text>

  <!-- dim 4: κ=24 -->
  <circle cx="170" cy="110" r="5" fill="#2255cc"/>
  <text x="160" y="145" fill="currentColor" font-size="9">n=4</text>
  <text x="160" y="155" fill="#2255cc" font-size="9">κ=24</text>

  <!-- dims 5,6,7: unknown (shown as ranges) -->
  <rect x="205" y="100" width="8" height="15" fill="#aaa" opacity="0.5"/>
  <text x="196" y="145" fill="currentColor" font-size="9">n=5</text>
  <text x="190" y="155" fill="currentColor" font-size="9">40–44</text>
  <rect x="235" y="95" width="8" height="20" fill="#aaa" opacity="0.5"/>
  <text x="226" y="145" fill="currentColor" font-size="9">n=6</text>
  <text x="220" y="155" fill="currentColor" font-size="9">72–78</text>
  <rect x="265" y="88" width="8" height="28" fill="#aaa" opacity="0.5"/>
  <text x="256" y="145" fill="currentColor" font-size="9">n=7</text>
  <text x="250" y="155" fill="currentColor" font-size="9">126–134</text>

  <!-- dim 8: κ=240 (big jump) -->
  <circle cx="300" cy="68" r="6" fill="#c00"/>
  <text x="290" y="145" fill="currentColor" font-size="9">n=8</text>
  <text x="285" y="155" fill="#c00" font-size="9">κ=240</text>
  <text x="300" y="58" text-anchor="middle" fill="#c00" font-size="9">E₈!</text>

  <!-- dim 24: κ=196560 (huge jump) -->
  <circle cx="420" cy="30" r="6" fill="#a00"/>
  <text x="400" y="145" fill="currentColor" font-size="9">n=24</text>
  <text x="390" y="155" fill="#a00" font-size="9">κ=196560</text>
  <text x="420" y="22" text-anchor="middle" fill="#a00" font-size="9">Leech!</text>

  <!-- Connect known points with dashed line -->
  <polyline points="50,127 90,123 130,116 170,110 300,68 420,30"
    fill="none" stroke="#2255cc" stroke-width="1" stroke-dasharray="4,3"/>

  <text x="230" y="174" text-anchor="middle" fill="currentColor" font-size="10">Exact values known only for n = 1,2,3,4,8,24</text>
</svg>
</div>

<div class="remark">
<strong>Remark (Viazovska's achievement in context).</strong> Maryna Viazovska's 2016 proof is widely regarded as one of the greatest mathematical achievements of the 21st century. The problem had been open for over 400 years in dimension 3 (resolved by Hales in 1998 with enormous computational effort) and was expected to be extremely difficult in higher dimensions. Viazovska's proof is comparatively short (21 pages for dimension 8), elegant, and based on a profound connection between sphere packing and the theory of modular forms. The connection suggests that the exceptional nature of dimensions 8 and 24 is a manifestation of deep arithmetic structure — the same structure that underlies the classification of Lie algebras, sporadic simple groups, and the theory of moonshine. Whether similar magic functions exist in other dimensions, and whether they could resolve packing questions there, is a major open problem in geometric analysis.
</div>

---

# Supplementary Material: Deeper Explorations

## S1: The Geometry of the Parallel Postulate — Alternative Geometries

The preceding chapters developed Euclidean geometry as the unique model of Hilbert's axiom system (Chapter 1). But what happens if we replace the parallel postulate with something else? The two main alternatives give **hyperbolic geometry** (infinitely many parallels through a given point) and **elliptic geometry** (no parallels at all). Understanding these alternatives illuminates Euclidean geometry by contrast.

### S1.1 Hyperbolic Geometry: The Poincaré Disk Model

The most vivid model of hyperbolic geometry is the **Poincaré disk model**, introduced by Henri Poincaré (1882). The "plane" is the open unit disk \(\mathbb{D} = \{(x,y) : x^2 + y^2 < 1\}\). "Lines" are arcs of circles that meet the boundary circle \(\partial\mathbb{D}\) at right angles (including diameters, which are limiting cases of such circles). The distance between two points \(z, w \in \mathbb{D}\) (using complex number notation) is

\[
d(z, w) = 2\,\text{arctanh}\left(\frac{|z - w|}{|1 - \bar{z}w|}\right).
\]

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 320 300" width="320" height="300" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <!-- Boundary circle (circle at infinity) -->
  <circle cx="160" cy="148" r="130" fill="#f8f8ff" stroke="currentColor" stroke-width="2"/>
  <text x="160" y="10" text-anchor="middle" fill="currentColor" font-size="10">circle at infinity (∂𝔻)</text>

  <!-- L4: a "line" (arc of circle meeting ∂D perpendicularly) — large arc, bottom area -->
  <!-- As a diameter (simplest line): vertical through center -->
  <line x1="160" y1="18" x2="160" y2="278" stroke="currentColor" stroke-width="1.5"/>
  <text x="172" y="165" fill="currentColor">L4</text>

  <!-- Point P: off to the left of L4 -->
  <circle cx="110" cy="120" r="4" fill="#c00"/>
  <text x="98" y="118" fill="#c00">P</text>

  <!-- L2: arc through P, parallel to L4 (doesn't cross L4 inside disk) -->
  <!-- Use a circular arc that meets boundary perpendicularly -->
  <path d="M40,60 Q85,148 40,235" fill="none" stroke="#2255cc" stroke-width="1.8"/>
  <text x="28" y="148" fill="#2255cc">L2</text>

  <!-- L3: another arc through P, also parallel to L4 -->
  <path d="M80,18 Q130,110 85,278" fill="none" stroke="#e70" stroke-width="1.8"/>
  <text x="72" y="90" fill="#e70">L3</text>

  <!-- L1: a "line" through P that DOES cross L4 -->
  <path d="M30,270 Q135,120 290,50" fill="none" stroke="#2a7" stroke-width="1.8"/>
  <text x="240" y="56" fill="#2a7">L1</text>

  <!-- Through P, L2 and L3 are both parallel to L4 (non-intersecting) -->
  <text x="160" y="292" text-anchor="middle" fill="currentColor" font-size="10">Through P: infinitely many lines parallel to L4</text>
  <text x="160" y="304" text-anchor="middle" fill="currentColor" font-size="10">Hyperbolic geometry violates Euclid's 5th postulate</text>
</svg>
</div>

In hyperbolic geometry, the angle sum of a triangle is *less* than \(180°\), and the defect \(180° - (\angle A + \angle B + \angle C)\) is proportional to the triangle's area. This was computed by Lambert (1766) before non-Euclidean geometry was formalized. Larger triangles have smaller angle sums, and the maximum area of a hyperbolic triangle (a triangle with all three vertices on the boundary circle, having all angles zero) is \(\pi\) in the normalization where the curvature is \(-1\).

<div class="theorem">
<strong>Theorem (Gauss–Bonnet for hyperbolic triangles).</strong> The area of a hyperbolic triangle with angles \(\alpha, \beta, \gamma\) is
\[
\text{Area} = \pi - \alpha - \beta - \gamma.
\]
</div>

This formula has no Euclidean analogue (Euclidean triangles all have angle sum \(\pi\), so the right side would always be zero). It shows that in hyperbolic geometry, the angle sum of a triangle encodes its area — a remarkable coupling of angular and metric information that does not exist in Euclidean geometry.

### S1.2 Elliptic Geometry: The Spherical Model

In **elliptic geometry**, there are no parallel lines — any two distinct lines meet. The simplest model is the sphere \(S^2\), with "lines" being great circles and "points" being pairs of antipodal points. (If we use actual points rather than antipodal pairs, we get spherical geometry, which is slightly different from elliptic geometry.)

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 380 240" width="380" height="240" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <!-- Left: sphere with great circle (equator) as "line" -->
  <g transform="translate(10,10)">
    <text x="90" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Spherical Geometry</text>
    <!-- Sphere outline -->
    <circle cx="90" cy="120" r="90" fill="#f0f4ff" stroke="currentColor" stroke-width="1.5"/>
    <!-- Equator (great circle as "line") -->
    <ellipse cx="90" cy="120" rx="90" ry="25" fill="none" stroke="#2255cc" stroke-width="2"/>
    <text x="168" y="124" fill="#2255cc" font-size="10">equator</text>
    <!-- North pole -->
    <circle cx="90" cy="30" r="4" fill="#c00"/>
    <text x="97" y="29" fill="#c00" font-size="10">N</text>
    <!-- South pole -->
    <circle cx="90" cy="210" r="4" fill="#c00"/>
    <text x="97" y="214" fill="#c00" font-size="10">S</text>
    <!-- Meridian (another great circle) -->
    <line x1="90" y1="30" x2="90" y2="210" stroke="#e70" stroke-width="1.5" stroke-dasharray="4,3"/>
    <!-- Note -->
    <text x="90" y="235" text-anchor="middle" fill="currentColor" font-size="10">Any two great circles intersect</text>
  </g>

  <!-- Right: spherical triangle with 270° angle sum -->
  <g transform="translate(215,10)">
    <text x="75" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Spherical Triangle</text>
    <!-- Sphere -->
    <circle cx="75" cy="120" r="75" fill="#fff8ee" stroke="#777" stroke-width="1.2"/>
    <!-- Equatorial arc (flat base of triangle) -->
    <ellipse cx="75" cy="170" rx="75" ry="18" fill="none" stroke="currentColor" stroke-width="1.5" stroke-dasharray="4,2"/>
    <!-- North pole -->
    <circle cx="75" cy="45" r="4" fill="#c00"/>
    <text x="80" y="43" fill="#c00" font-size="10">N</text>
    <!-- Two base points on equator -->
    <circle cx="20" cy="170" r="4" fill="currentColor"/>
    <circle cx="130" cy="170" r="4" fill="currentColor"/>
    <!-- Two meridians from N to equator -->
    <line x1="75" y1="45" x2="20" y2="170" stroke="#2255cc" stroke-width="1.8"/>
    <line x1="75" y1="45" x2="130" y2="170" stroke="#2255cc" stroke-width="1.8"/>
    <!-- Equatorial segment -->
    <line x1="20" y1="170" x2="130" y2="170" stroke="#2255cc" stroke-width="1.8"/>
    <!-- Right angle markers at base -->
    <rect x="23" y="160" width="8" height="8" fill="none" stroke="#e70" stroke-width="1"/>
    <rect x="119" y="160" width="8" height="8" fill="none" stroke="#e70" stroke-width="1"/>
    <!-- Angle at N (90°) -->
    <path d="M65,45 A12,12 0 0,1 85,45" fill="none" stroke="#e70" stroke-width="1.2"/>
    <!-- Labels -->
    <text x="75" y="35" text-anchor="middle" fill="#e70" font-size="10">90°</text>
    <text x="10" y="178" fill="#e70" font-size="10">90°</text>
    <text x="130" y="178" fill="#e70" font-size="10">90°</text>
    <text x="75" y="210" text-anchor="middle" fill="currentColor">∠sum = 270° &gt; 180°!</text>
  </g>
</svg>
</div>

<div class="theorem">
<strong>Theorem (Spherical excess).</strong> The area of a spherical triangle with angles \(\alpha, \beta, \gamma\) on a sphere of radius \(R\) is
\[
\text{Area} = R^2(\alpha + \beta + \gamma - \pi).
\]
</div>

The quantity \(\alpha + \beta + \gamma - \pi\) is the **spherical excess**. For a triangle occupying 1/8 of the sphere (like the triangle from the North Pole to two points on the equator separated by 90°), the angles are \(90° + 90° + 90° = 270°\), excess \(= \pi/2\), and area \(= \pi R^2/2 = (1/8)(4\pi R^2)\). ✓

The three geometries — Euclidean, hyperbolic, elliptic — are distinguished by the sign of their curvature and by the Gauss-Bonnet theorem: angle sum of a triangle equals \(\pi\), less than \(\pi\), or greater than \(\pi\), respectively.

---

## S2: Projective Geometry and Duality

**Projective geometry** is the geometry of the projective plane \(\mathbb{P}^2\), obtained from \(\mathbb{R}^2\) by adding a "line at infinity" — one extra point for each direction. The remarkable feature of projective geometry is its **duality**: any theorem about points and lines remains valid when "point" and "line" are interchanged.

### S2.1 The Projective Plane

The real projective plane \(\mathbb{P}^2(\mathbb{R})\) is defined as the set of all lines through the origin in \(\mathbb{R}^3\). A "point" in \(\mathbb{P}^2\) corresponds to a line through the origin in \(\mathbb{R}^3\), represented by homogeneous coordinates \([X : Y : Z]\) (not all zero). A "line" in \(\mathbb{P}^2\) corresponds to a plane through the origin in \(\mathbb{R}^3\).

The ordinary Euclidean plane \(\mathbb{R}^2\) embeds into \(\mathbb{P}^2\) via \((x, y) \mapsto [x : y : 1]\). The "points at infinity" correspond to \([X : Y : 0]\) — directions in the plane, one for each family of parallel lines.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 340 260" width="340" height="260" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <defs>
    <marker id="prarr" markerWidth="8" markerHeight="8" refX="6" refY="4" orient="auto">
      <path d="M0,1 L8,4 L0,7 Z" fill="currentColor"/>
    </marker>
  </defs>
  <!-- Circle at infinity (boundary of projective plane schematic) -->
  <circle cx="170" cy="130" r="115" fill="#f8f8ff" stroke="currentColor" stroke-width="2" stroke-dasharray="8,4"/>
  <text x="170" y="10" text-anchor="middle" fill="currentColor" font-size="10">line at infinity ℓ∞</text>

  <!-- Ordinary plane interior -->
  <rect x="80" y="60" width="180" height="140" fill="none" stroke="#999" stroke-width="1" stroke-dasharray="3,3"/>
  <text x="170" y="90" text-anchor="middle" fill="currentColor" font-size="9">ordinary plane (Z≠0)</text>

  <!-- Axes of ordinary plane -->
  <line x1="170" y1="60" x2="170" y2="200" stroke="#777" stroke-width="1"/>
  <line x1="80" y1="130" x2="260" y2="130" stroke="#777" stroke-width="1"/>

  <!-- Two families of parallel lines converging to points at infinity -->
  <!-- Horizontal lines → point [1:0:0] at right -->
  <line x1="80" y1="110" x2="285" y2="110" stroke="#2255cc" stroke-width="1.2" stroke-dasharray="4,2" marker-end="url(#prarr)"/>
  <line x1="80" y1="150" x2="285" y2="150" stroke="#2255cc" stroke-width="1.2" stroke-dasharray="4,2" marker-end="url(#prarr)"/>
  <circle cx="285" cy="130" r="5" fill="#c00"/>
  <text x="292" y="133" fill="#c00" font-size="10">[1:0:0]</text>

  <!-- Vertical lines → point [0:1:0] at top -->
  <line x1="140" y1="200" x2="140" y2="32" stroke="#e70" stroke-width="1.2" stroke-dasharray="4,2" marker-end="url(#prarr)"/>
  <line x1="200" y1="200" x2="200" y2="32" stroke="#e70" stroke-width="1.2" stroke-dasharray="4,2" marker-end="url(#prarr)"/>
  <circle cx="170" cy="15" r="5" fill="#c00"/>
  <text x="178" y="19" fill="#c00" font-size="10">[0:1:0]</text>

  <!-- Diagonal family → different point at infinity -->
  <line x1="80" y1="200" x2="255" y2="65" stroke="#2a7" stroke-width="1.2" stroke-dasharray="4,2" marker-end="url(#prarr)"/>
  <line x1="100" y1="200" x2="275" y2="65" stroke="#2a7" stroke-width="1.2" stroke-dasharray="4,2" marker-end="url(#prarr)"/>

  <text x="170" y="245" text-anchor="middle" fill="currentColor">Parallel lines meet at a point at infinity</text>
  <text x="170" y="257" text-anchor="middle" fill="currentColor" font-size="10">In ℙ², no two distinct lines are parallel</text>
</svg>
</div>

### S2.2 Projective Duality and Poles and Polars

In the projective plane, there is a perfect symmetry between points and lines called **projective duality**. Every theorem about points and lines in \(\mathbb{P}^2\) has a "dual" theorem obtained by interchanging "point" and "line."

<div class="theorem">
<strong>Theorem (Principle of Duality).</strong> If a theorem in projective geometry is true, then the theorem obtained by interchanging "point" and "line" everywhere is also true.
</div>

<div class="example">
<strong>Example (Dual theorems).</strong>

| Original | Dual |
|----------|------|
| Two distinct points determine a unique line. | Two distinct lines determine a unique point. |
| Three points are collinear. | Three lines are concurrent. |
| Desargues' Theorem: if triangles \(ABC\) and \(A'B'C'\) are in perspective from a point, they are in perspective from a line. | Dual: if triangles \(ABC\) and \(A'B'C'\) are in perspective from a line, they are in perspective from a point. |
| Pascal's Theorem: six points on a conic have collinear "Pascal line" intersections. | Brianchon's Theorem: six tangents to a conic have concurrent "Brianchon point" intersections. |

Desargues' Theorem is self-dual! This is a deep theorem — it means that the theorem and its dual are the same statement.
</div>

For a conic section (like the unit circle \(x^2 + y^2 = 1\)), the **polar line** of a point \(P = (a, b)\) with respect to the conic is the line \(ax + by = 1\). This gives an explicit bijection between points and lines — the **pole-polar duality**. If \(P\) lies inside the conic, its polar line lies outside; if \(P\) lies on the conic, its polar line is the tangent at \(P\).

### S2.3 Pascal's Theorem and Its Dual

<div class="theorem">
<strong>Pascal's Theorem.</strong> If six points \(A, B, C, D, E, F\) lie on a conic (in projective order), then the three intersection points
\[
P = AB \cap DE, \quad Q = BC \cap EF, \quad R = CD \cap FA
\]
are collinear (they lie on the "Pascal line").
</div>

<div class="theorem">
<strong>Brianchon's Theorem (dual).</strong> If six lines \(a, b, c, d, e, f\) are tangent to a conic, then the three lines connecting opposite vertices of the hexagon:
\[
p = (a \cap b)(d \cap e), \quad q = (b \cap c)(e \cap f), \quad r = (c \cap d)(f \cap a)
\]
are concurrent (they meet at the "Brianchon point").
</div>

Brianchon discovered his theorem in 1806 not by independent geometric insight but by applying the principle of duality to Pascal's theorem — an early and striking demonstration of the power of projective duality.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 340 280" width="340" height="280" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <!-- Conic (ellipse) -->
  <ellipse cx="170" cy="140" rx="110" ry="80" fill="none" stroke="#777" stroke-width="1.5"/>
  <!-- Six points on the ellipse (at angles 0°, 60°, 120°, 180°, 240°, 300°) -->
  <!-- A,B,C,D,E,F in order around ellipse -->
  <!-- A: 70°, B: 130°, C: 190°, D: 250°, E: 310°, F: 10° (approx) -->
  <!-- Using parametric ellipse: x=170+110cos(t), y=140+80sin(t) -->
  <!-- A=130°: (100,102), B=60°: (225,71), C=0°: (280,140) -->
  <!-- D=300°: (225,209), E=240°: (115,209), F=180°: (60,140) -->
  <circle cx="100" cy="102" r="4" fill="#2255cc"/><text x="86" y="100" fill="#2255cc">A</text>
  <circle cx="225" cy="71" r="4" fill="#2255cc"/><text x="230" y="70" fill="#2255cc">B</text>
  <circle cx="280" cy="140" r="4" fill="#2255cc"/><text x="285" y="140" fill="#2255cc">C</text>
  <circle cx="225" cy="209" r="4" fill="#2255cc"/><text x="230" y="220" fill="#2255cc">D</text>
  <circle cx="115" cy="209" r="4" fill="#2255cc"/><text x="98" y="220" fill="#2255cc">E</text>
  <circle cx="60" cy="140" r="4" fill="#2255cc"/><text x="38" y="140" fill="#2255cc">F</text>

  <!-- Side AB extended to meet DE at P -->
  <!-- Line AB: through (100,102) and (225,71), extended -->
  <line x1="20" y1="120" x2="300" y2="50" stroke="#e70" stroke-width="1" stroke-dasharray="4,3"/>
  <!-- Line DE: through (225,209) and (115,209) extended -->
  <line x1="20" y1="209" x2="320" y2="209" stroke="#e70" stroke-width="1" stroke-dasharray="4,3"/>
  <!-- P ≈ intersection -->
  <circle cx="37" cy="120" r="4" fill="#c00"/>
  <text x="22" y="114" fill="#c00">P</text>

  <!-- Side BC extended, EF extended, meet at Q -->
  <line x1="200" y1="40" x2="50" y2="200" stroke="#2a7" stroke-width="1" stroke-dasharray="4,3"/>
  <line x1="30" y1="175" x2="310" y2="175" stroke="#2a7" stroke-width="1" stroke-dasharray="4,3"/>
  <circle cx="68" cy="175" r="4" fill="#c00"/>
  <text x="54" y="170" fill="#c00">Q</text>

  <!-- Side CD extended, FA extended, meet at R -->
  <line x1="200" y1="240" x2="310" y2="140" stroke="#a0a" stroke-width="1" stroke-dasharray="4,3"/>
  <line x1="30" y1="155" x2="310" y2="155" stroke="#a0a" stroke-width="1" stroke-dasharray="4,3"/>
  <circle cx="310" cy="155" r="4" fill="#c00"/>
  <text x="314" y="153" fill="#c00">R</text>

  <!-- Pascal line through P, Q, R (approximate) -->
  <line x1="22" y1="120" x2="315" y2="158" stroke="#c00" stroke-width="2"/>
  <text x="170" y="270" text-anchor="middle" fill="#c00">Pascal line: P, Q, R collinear</text>
</svg>
</div>

---

## S3: Detailed Proof Sketches and Additional Theorems

### S3.1 The Angle Bisector Construction and Compass-Only Constructions

We saw in Section 1.3.1 how to bisect an angle with straightedge and compass. A surprising theorem, due to **Georg Mohr** (1672) and independently **Lorenzo Mascheroni** (1797), shows that the straightedge is not needed at all:

<div class="theorem">
<strong>Mohr–Mascheroni Theorem.</strong> Every point constructible by straightedge and compass can be constructed by compass alone (without the straightedge).
</div>

The key insight is that we can simulate drawing a line with a compass: while we cannot literally draw the line, we can find its intersection with a circle (which is what we actually need). The simulation uses the fact that two points determine a unique line, and intersecting that line with another circle can be done by a purely compass-based construction (using the two points as proxies for the line).

Conversely, the **Poncelet-Steiner Theorem** shows that if we are given a single fixed circle with its center marked, then the compass is not needed:

<div class="theorem">
<strong>Poncelet-Steiner Theorem.</strong> Given a single circle with its center marked, every point constructible by straightedge and compass can be constructed by straightedge alone.
</div>

Together, these theorems show that the constructible points depend only on the set of operations abstractly, not on whether we use both tools. The single fixed circle serves as a "reference" that replaces all compass operations.

### S3.2 Napoleon's Theorem

One of the most elegant theorems about equilateral triangles is **Napoleon's Theorem**, whose attribution to Napoleon Bonaparte (1769–1821) is almost certainly apocryphal but too charming to abandon:

<div class="theorem">
<strong>Napoleon's Theorem.</strong> If equilateral triangles are constructed on the three sides of any triangle (all on the exterior, or all on the interior), then the centroids of these three equilateral triangles form an equilateral triangle.
</div>

<div class="proof">
<strong>Proof sketch (using complex numbers).</strong> Place the vertices of the original triangle at complex numbers \(z_1, z_2, z_3\). The centroid of the equilateral triangle constructed externally on side \(z_1 z_2\) is at
\[
w_3 = \frac{z_1 + z_2}{2} + \frac{z_2 - z_1}{2} \cdot \frac{i}{\sqrt{3}} \cdot \text{(correction for equilateral)},
\]
or more precisely, using the rotation by \(60°\) via multiplication by \(\omega = e^{i\pi/3}\):
\[
w_3 = \frac{z_1 + z_2 + (z_2 - z_1)\omega}{3} \cdot \text{(centroid formula)}.
\]
Computing all three centroids \(w_1, w_2, w_3\) and checking \(|w_1 - w_2| = |w_2 - w_3| = |w_3 - w_1|\) completes the proof. The computation is direct but involves careful handling of cube roots of unity. \(\square\)
</div>

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 300 260" width="300" height="260" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <!-- Original triangle ABC -->
  <!-- A=(60,180), B=(150,60), C=(240,180) -->
  <polygon points="60,180 150,60 240,180" fill="none" stroke="currentColor" stroke-width="2"/>
  <text x="48" y="188" fill="currentColor">A</text>
  <text x="147" y="52" fill="currentColor">B</text>
  <text x="244" y="188" fill="currentColor">C</text>

  <!-- Equilateral triangle on AB (exterior) -->
  <!-- AB midpoint=(105,120), perpendicular out -->
  <polygon points="60,180 150,60 45,100" fill="#dde6ff" fill-opacity="0.5" stroke="#2255cc" stroke-width="1.5"/>
  <!-- Centroid of equilateral on AB -->
  <circle cx="85" cy="113" r="5" fill="#c00"/>
  <text x="65" y="112" fill="#c00">★</text>

  <!-- Equilateral triangle on BC (exterior) -->
  <polygon points="150,60 240,180 270,90" fill="#ffeedd" fill-opacity="0.5" stroke="#e70" stroke-width="1.5"/>
  <!-- Centroid -->
  <circle cx="220" cy="110" r="5" fill="#c00"/>
  <text x="225" y="108" fill="#c00">★</text>

  <!-- Equilateral triangle on AC (exterior, below) -->
  <polygon points="60,180 240,180 150,240" fill="#eeffee" fill-opacity="0.5" stroke="#2a7" stroke-width="1.5"/>
  <!-- Centroid -->
  <circle cx="150" cy="200" r="5" fill="#c00"/>
  <text x="155" y="198" fill="#c00">★</text>

  <!-- Napoleon triangle connecting the three centroids -->
  <polygon points="85,113 220,110 150,200" fill="none" stroke="#c00" stroke-width="2.5"/>

  <text x="150" y="245" text-anchor="middle" fill="#c00" font-weight="bold">Napoleon's equilateral triangle (★ ★ ★)</text>
  <text x="150" y="258" text-anchor="middle" fill="currentColor" font-size="10">centroids of exterior equilateral triangles</text>
</svg>
</div>

The difference of the outer and inner Napoleon triangles' areas equals the area of the original triangle — a beautiful quantitative version of the theorem.

### S3.3 The Nine-Point Circle

Another gem of classical Euclidean geometry is the **nine-point circle**, discovered by Feuerbach (1822):

<div class="theorem">
<strong>Nine-Point Circle Theorem (Feuerbach, 1822).</strong> For any triangle \(\triangle ABC\), the following nine points all lie on a single circle (the nine-point circle):
<ol>
<li>The midpoints of the three sides: \(M_A, M_B, M_C\).</li>
<li>The feet of the three altitudes: \(H_A, H_B, H_C\).</li>
<li>The midpoints of the segments from each vertex to the orthocenter \(H\): \(E_A, E_B, E_C\).</li>
</ol>
The nine-point circle has radius \(R/2\) where \(R\) is the circumradius of \(\triangle ABC\).
</div>

<div class="proof">
<strong>Proof sketch.</strong> The key is that all nine points lie on the image of the circumcircle under the homothety (dilation) centered at the orthocenter \(H\) with ratio \(1/2\). This homothety maps the circumcenter \(O\) to the midpoint \(N_9\) of segment \(OH\) (the nine-point center), and maps the circumcircle to a circle of radius \(R/2\) centered at \(N_9\). The three midpoints of sides lie on this circle (they are midpoints of arcs of the circumcircle under the homothety); the altitude feet lie on it by a direct angle-chasing argument; and the midpoints of \(HA, HB, HC\) lie on it because the homothety maps \(A, B, C\) to these midpoints. \(\square\)
</div>

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 320 290" width="320" height="290" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- Triangle ABC: A=(160,20), B=(30,240), C=(290,240) -->
  <polygon points="160,20 30,240 290,240" fill="none" stroke="currentColor" stroke-width="2"/>
  <text x="158" y="13" text-anchor="middle" fill="currentColor">A</text>
  <text x="18" y="248" fill="currentColor">B</text>
  <text x="294" y="248" fill="currentColor">C</text>

  <!-- Midpoints of sides -->
  <circle cx="95" cy="130" r="4" fill="#2255cc"/>
  <text x="78" y="128" fill="#2255cc" font-size="10">M_B</text>
  <circle cx="225" cy="130" r="4" fill="#2255cc"/>
  <text x="229" y="128" fill="#2255cc" font-size="10">M_C</text>
  <circle cx="160" cy="240" r="4" fill="#2255cc"/>
  <text x="163" y="255" fill="#2255cc" font-size="10">M_A</text>

  <!-- Orthocenter H (for this triangle, roughly) -->
  <!-- H ≈ (160, 170) for this triangle -->
  <circle cx="160" cy="170" r="4" fill="#e70"/>
  <text x="166" y="172" fill="#e70" font-size="10">H</text>

  <!-- Altitude from A to BC (foot H_A on BC at x=160) -->
  <line x1="160" y1="20" x2="160" y2="240" stroke="#777" stroke-width="1" stroke-dasharray="3,3"/>
  <circle cx="160" cy="240" r="4" fill="#c00"/>
  <text x="168" y="253" fill="#c00" font-size="9">H_A</text>

  <!-- Altitude from B to AC -->
  <line x1="30" y1="240" x2="225" y2="130" stroke="#777" stroke-width="1" stroke-dasharray="3,3"/>
  <!-- foot approx on AC -->
  <circle cx="188" cy="152" r="3" fill="#c00"/>
  <text x="192" y="148" fill="#c00" font-size="9">H_C</text>

  <!-- Nine-point circle: radius ≈ R/2, center = midpoint of OH -->
  <!-- O (circumcenter) for this triangle ≈ (160,130) -->
  <!-- N9 = midpoint of OH ≈ (160,150) -->
  <circle cx="160" cy="150" r="5" fill="#a0a"/>
  <text x="168" y="148" fill="#a0a" font-size="10">N₉</text>
  <!-- Nine-point circle radius ≈ 95 for this config -->
  <circle cx="160" cy="150" r="95" fill="none" stroke="#c00" stroke-width="1.5" stroke-dasharray="6,3"/>

  <text x="160" y="272" text-anchor="middle" fill="#c00">Nine-point circle (radius R/2)</text>
  <text x="160" y="284" text-anchor="middle" fill="currentColor" font-size="10">M_A,M_B,M_C, H_A,H_B,H_C, E_A,E_B,E_C all lie on it</text>
</svg>
</div>

The most remarkable part of Feuerbach's theorem is an additional fact he proved: the nine-point circle is **internally tangent to the incircle** and **externally tangent to each of the three excircles** of the triangle. This is **Feuerbach's theorem**, one of the most beautiful results in classical geometry.

### S3.4 The Euler Line

In any (non-equilateral) triangle, the circumcenter \(O\), the centroid \(G\), and the orthocenter \(H\) are collinear. The line through them is the **Euler line**, and the distances satisfy \(OG : GH = 1 : 2\) (the centroid trisects the segment from circumcenter to orthocenter).

<div class="theorem">
<strong>Euler's Line Theorem.</strong> In any non-equilateral triangle, the circumcenter \(O\), centroid \(G\), and orthocenter \(H\) are collinear, with \(\overrightarrow{OH} = 3\overrightarrow{OG}\).
</div>

<div class="proof">
<strong>Proof.</strong> Place the circumcenter at the origin, so the circumradius vectors to \(A, B, C\) satisfy \(|A| = |B| = |C| = R\). The centroid is \(G = (A + B + C)/3\). The orthocenter is \(H = A + B + C\) (this is a non-obvious but standard fact: the orthocenter equals the sum of the circumradius vectors). Then \(H = 3G\), so \(O, G, H\) are collinear with \(G\) trisecting \(OH\). \(\square\)
</div>

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 320 250" width="320" height="250" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <!-- Triangle A=(160,25), B=(50,210), C=(270,210) -->
  <polygon points="160,25 50,210 270,210" fill="none" stroke="currentColor" stroke-width="1.8"/>
  <text x="157" y="18" text-anchor="middle" fill="currentColor">A</text>
  <text x="35" y="220" fill="currentColor">B</text>
  <text x="272" y="220" fill="currentColor">C</text>

  <!-- Circumcenter O (for this triangle, equilateral-ish: ≈ center) -->
  <circle cx="160" cy="148" r="4" fill="#2255cc"/>
  <text x="165" y="146" fill="#2255cc">O</text>

  <!-- Centroid G = (A+B+C)/3 = ((160+50+270)/3, (25+210+210)/3) = (160, 148.3) -->
  <!-- This is nearly the same as O for near-equilateral; let's use a scalene triangle -->
  <!-- Better: A=(160,25), B=(40,220), C=(260,220) -->
  <!-- Centroid G = (153,155), O ≈ (160,145), H ≈ (140,175) -->
  <circle cx="153" cy="155" r="4" fill="#2a7"/>
  <text x="158" y="154" fill="#2a7">G</text>

  <!-- Orthocenter H -->
  <circle cx="140" cy="175" r="4" fill="#e70"/>
  <text x="118" y="175" fill="#e70">H</text>

  <!-- Nine-point center N9 = midpoint of OH -->
  <circle cx="150" cy="160" r="3" fill="#a0a"/>
  <text x="155" y="158" fill="#a0a" font-size="10">N₉</text>

  <!-- Euler line through O, G, H -->
  <line x1="170" y1="120" x2="125" y2="200" stroke="#c00" stroke-width="2"/>
  <text x="175" y="118" fill="#c00">Euler line</text>

  <!-- Bottom: 1D schematic of the Euler line -->
  <line x1="40" y1="235" x2="280" y2="235" stroke="currentColor" stroke-width="1.5"/>
  <circle cx="80" cy="235" r="4" fill="#2255cc"/>
  <text x="75" y="248" fill="#2255cc" font-size="10">O</text>
  <circle cx="140" cy="235" r="4" fill="#2a7"/>
  <text x="135" y="248" fill="#2a7" font-size="10">G</text>
  <!-- N9 = midpoint of OH -->
  <circle cx="180" cy="235" r="3" fill="#a0a"/>
  <text x="178" y="248" fill="#a0a" font-size="10">N₉</text>
  <circle cx="220" cy="235" r="4" fill="#e70"/>
  <text x="215" y="248" fill="#e70" font-size="10">H</text>
  <!-- Trisection marks -->
  <text x="110" y="232" text-anchor="middle" fill="currentColor" font-size="9">|OG|</text>
  <text x="180" y="222" text-anchor="middle" fill="currentColor" font-size="9">OG:GH = 1:2</text>
</svg>
</div>

The nine-point center \(N_9\) also lies on the Euler line, at the midpoint of \(OH\). In an equilateral triangle, \(O = G = H = N_9\) (all four coincide), which is why the theorem requires "non-equilateral."

---

## S4: Symmetry Groups — Deeper Structure

### S4.1 The Point Groups: Symmetries Fixing a Point

Before wallpaper groups (which have translations), let us consider **point groups** — symmetry groups that fix a point. In the plane, the finite groups of isometries fixing the origin are:

- **Cyclic group** \(C_n\): generated by rotation by \(2\pi/n\). Order \(n\). Appears as the symmetry of a regular \(n\)-gon that has been "chiralized" (no reflections).
- **Dihedral group** \(D_n\) (or \(D_{2n}\) in some notations): generated by rotation by \(2\pi/n\) and a reflection. Order \(2n\). Appears as the full symmetry group of a regular \(n\)-gon.

<div class="theorem">
<strong>Leonardo's Theorem (Leonardo da Vinci, c. 1500).</strong> Every finite group of plane isometries is either a cyclic group \(C_n\) or a dihedral group \(D_n\).
</div>

This is often called the "Leonardo theorem" because da Vinci apparently knew (informally) the classification of symmetries of rosette patterns in his study of architecture. The rigorous proof uses the fact that any finite group of isometries fixing a point consists only of rotations and reflections (no translations, which would require infinite orbits), and that any combination of reflections generates a dihedral group.

<div class="example">
<strong>Example (Symmetry groups of regular polygons).</strong>

| Polygon | Rotation symmetries | Reflection symmetries | Group |
|---------|---------------------|-----------------------|-------|
| Equilateral triangle \(\{3\}\) | \(0°, 120°, 240°\) | 3 axes | \(D_3\) (order 6) |
| Square \(\{4\}\) | \(0°, 90°, 180°, 270°\) | 4 axes | \(D_4\) (order 8) |
| Regular pentagon \(\{5\}\) | \(0°, 72°, 144°, 216°, 288°\) | 5 axes | \(D_5\) (order 10) |
| Regular hexagon \(\{6\}\) | \(0°, 60°, \ldots, 300°\) | 6 axes | \(D_6\) (order 12) |
| \(n\)-gon \(\{n\}\) | \(n\) rotations | \(n\) axes | \(D_n\) (order \(2n\)) |

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 260 200" width="260" height="200" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- Regular hexagon centered at (130,95), radius 65 -->
  <!-- Vertices at 0°,60°,...,300°: (195,95),(162,151.5),(98,151.5),(65,95),(98,38.5),(162,38.5) -->
  <polygon points="195,95 162,151.5 98,151.5 65,95 98,38.5 162,38.5"
    fill="#fff8cc" stroke="currentColor" stroke-width="2"/>
  <!-- 3 axes through opposite vertices -->
  <line x1="195" y1="95" x2="65" y2="95" stroke="#c00" stroke-width="1.5" stroke-dasharray="5,3"/>
  <line x1="162" y1="38.5" x2="98" y2="151.5" stroke="#c00" stroke-width="1.5" stroke-dasharray="5,3"/>
  <line x1="162" y1="151.5" x2="98" y2="38.5" stroke="#c00" stroke-width="1.5" stroke-dasharray="5,3"/>
  <!-- 3 axes through opposite edge midpoints -->
  <!-- Midpoint of top edge: (162+98)/2=130, (38.5+38.5)/2=38.5, opposite bottom: 130,151.5 -->
  <line x1="130" y1="38.5" x2="130" y2="151.5" stroke="#2255cc" stroke-width="1.5" stroke-dasharray="5,3"/>
  <!-- Midpoint right-upper edge: (195+162)/2=178.5,(95+38.5)/2=66.75; opposite: (98+65)/2=81.5,(151.5+95)/2=123.25 -->
  <line x1="178.5" y1="66.75" x2="81.5" y2="123.25" stroke="#2255cc" stroke-width="1.5" stroke-dasharray="5,3"/>
  <!-- Midpoint right-lower: (195+162)/2=178.5,(95+151.5)/2=123.25 -->
  <line x1="178.5" y1="123.25" x2="81.5" y2="66.75" stroke="#2255cc" stroke-width="1.5" stroke-dasharray="5,3"/>
  <!-- Center -->
  <circle cx="130" cy="95" r="4" fill="#e70"/>
  <!-- Legend -->
  <line x1="20" y1="170" x2="50" y2="170" stroke="#c00" stroke-width="1.5" stroke-dasharray="5,3"/>
  <text x="55" y="174" fill="#c00" font-size="10">3 vertex axes</text>
  <line x1="20" y1="185" x2="50" y2="185" stroke="#2255cc" stroke-width="1.5" stroke-dasharray="5,3"/>
  <text x="55" y="189" fill="#2255cc" font-size="10">3 edge-midpoint axes</text>
  <text x="130" y="200" text-anchor="middle" fill="currentColor">D₆: 6 reflection axes, order 12</text>
</svg>
</div>
</div>

### S4.2 Three-Dimensional Point Groups and Crystal Systems

In three dimensions, the finite groups of isometries are more complex. They include the rotation groups of the Platonic solids (tetrahedral, octahedral, icosahedral) and their extensions by reflections. These are classified into the **crystallographic point groups**, of which there are 32.

| Crystal system | Lattice type | Point group examples |
|----------------|--------------|----------------------|
| Triclinic | \(aP\) | \(C_1, C_i\) |
| Monoclinic | \(mP, mC\) | \(C_2, C_s, C_{2h}\) |
| Orthorhombic | \(oP, oC, oI, oF\) | \(D_2, C_{2v}, D_{2h}\) |
| Tetragonal | \(tP, tI\) | \(C_4, S_4, C_{4h}, D_4, C_{4v}, D_{2d}, D_{4h}\) |
| Trigonal | \(hR\) | \(C_3, S_6, D_3, C_{3v}, D_{3d}\) |
| Hexagonal | \(hP\) | \(C_6, C_{3h}, C_{6h}, D_6, C_{6v}, D_{3h}, D_{6h}\) |
| Cubic | \(cP, cI, cF\) | \(T, T_h, O, T_d, O_h\) |

The cubic point group \(O_h\) (order 48) is the full symmetry group of both the cube and the octahedron (since they are dual). The icosahedral group \(I_h\) (order 120) is the full symmetry group of the dodecahedron and icosahedron — but it is NOT a crystallographic point group, because 5-fold symmetry is incompatible with a lattice (the crystallographic restriction).

### S4.3 Space Groups: Combining Translations and Point Symmetries

The 230 **space groups** classify all possible discrete symmetry groups of \(\mathbb{R}^3\) that contain a lattice of translations. They combine the 32 crystallographic point groups with the 14 Bravais lattice types. The classification was completed by Fedorov, Schoenflies, and Barlow in 1890–1891.

Crystallographers use space groups to classify crystal structures: every crystal belongs to one of the 230 space groups. The Nacl (table salt) crystal has space group \(Fm\bar{3}m\) (number 225), one of the cubic space groups. Diamond has space group \(Fd\bar{3}m\) (number 227).

<div class="remark">
<strong>Remark (Space groups and protein crystallography).</strong> In X-ray crystallography of proteins, knowing the space group of the crystal is the first step in determining the three-dimensional structure of the protein. Since proteins are chiral molecules (they consist of L-amino acids only), protein crystals can only belong to one of the 65 **chiral space groups** (those without improper symmetry elements like reflections or roto-inversions). The most common space groups for protein crystals are \(P2_1 2_1 2_1\) (orthorhombic) and \(P2_1\) (monoclinic). Understanding the symmetry of the crystal allows crystallographers to solve the structure from diffraction data.
</div>

---

## S5: Additional Examples in Sphere Packings

### S5.1 The E₈ Root System in Detail

The \(E_8\) lattice can be described explicitly. Define the lattice \(\Lambda\) as the set of all vectors \((x_1, \ldots, x_8) \in \mathbb{R}^8\) such that:
- either all \(x_i \in \mathbb{Z}\) with \(\sum x_i \equiv 0 \pmod{2}\),
- or all \(x_i \in \mathbb{Z} + \frac{1}{2}\) with \(\sum x_i \equiv 0 \pmod{2}\).

The shortest vectors (minimal length \(\sqrt{2}\)) are the **roots** of the \(E_8\) root system. There are 240 of them, and they can be listed explicitly:

- **112 vectors** of the form \(\pm e_i \pm e_j\) for \(1 \leq i < j \leq 8\): each with two nonzero coordinates of value \(\pm 1\).
- **128 vectors** of the form \(\frac{1}{2}(\pm 1, \pm 1, \pm 1, \pm 1, \pm 1, \pm 1, \pm 1, \pm 1)\) with an **even** number of negative signs.

<div class="example">
<strong>Example (Counting the 240 roots of \(E_8\)).</strong>

- Vectors with two nonzero coordinates \(\pm 1\): \(\binom{8}{2} \times 4 = 28 \times 4 = 112\).
- Vectors with all half-integer coordinates (8 signs, even number negative): \(2^7 = 128\) (choose 8 signs with the constraint that their product is \(+1\), giving \(2^{8-1} = 128\) choices).

Total: \(112 + 128 = 240\). ✓

The 240 roots form a highly symmetric arrangement: the symmetry group of \(E_8\) (the Weyl group \(W(E_8)\)) has order \(696,729,600\). Each root is perpendicular to 56 others and at \(60°\) to 126 others. The roots span \(\mathbb{R}^8\) and their convex hull is the **421 polytope**, one of the exceptional uniform polytopes discovered by Gosset.
</div>

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 300 300" width="300" height="300" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- E8 Gosset polytope projection: 240 roots arranged with 8-fold symmetry -->
  <!-- Schematic representation: 8 concentric rings of dots at different radii -->
  <!-- Center -->
  <circle cx="150" cy="150" r="3" fill="#2255cc"/>
  <!-- Ring 1: 8 dots at radius 25 -->
  <g fill="#2255cc" opacity="0.9">
    <circle cx="175" cy="150" r="2.5"/>
    <circle cx="168" cy="168" r="2.5"/>
    <circle cx="150" cy="175" r="2.5"/>
    <circle cx="132" cy="168" r="2.5"/>
    <circle cx="125" cy="150" r="2.5"/>
    <circle cx="132" cy="132" r="2.5"/>
    <circle cx="150" cy="125" r="2.5"/>
    <circle cx="168" cy="132" r="2.5"/>
  </g>
  <!-- Ring 2: 16 dots at radius 45 -->
  <g fill="#4477cc" opacity="0.85">
    <circle cx="195" cy="150" r="2.5"/><circle cx="182" cy="182" r="2.5"/>
    <circle cx="150" cy="195" r="2.5"/><circle cx="118" cy="182" r="2.5"/>
    <circle cx="105" cy="150" r="2.5"/><circle cx="118" cy="118" r="2.5"/>
    <circle cx="150" cy="105" r="2.5"/><circle cx="182" cy="118" r="2.5"/>
    <circle cx="189" cy="169" r="2.5"/><circle cx="169" cy="189" r="2.5"/>
    <circle cx="131" cy="189" r="2.5"/><circle cx="111" cy="169" r="2.5"/>
    <circle cx="111" cy="131" r="2.5"/><circle cx="131" cy="111" r="2.5"/>
    <circle cx="169" cy="111" r="2.5"/><circle cx="189" cy="131" r="2.5"/>
  </g>
  <!-- Ring 3: 24 dots at radius 68 -->
  <g fill="#6699ee" opacity="0.8">
    <circle cx="218" cy="150" r="2"/><circle cx="198" cy="198" r="2"/>
    <circle cx="150" cy="218" r="2"/><circle cx="102" cy="198" r="2"/>
    <circle cx="82" cy="150" r="2"/><circle cx="102" cy="102" r="2"/>
    <circle cx="150" cy="82" r="2"/><circle cx="198" cy="102" r="2"/>
    <circle cx="214" cy="178" r="2"/><circle cx="178" cy="214" r="2"/>
    <circle cx="122" cy="214" r="2"/><circle cx="86" cy="178" r="2"/>
    <circle cx="86" cy="122" r="2"/><circle cx="122" cy="86" r="2"/>
    <circle cx="178" cy="86" r="2"/><circle cx="214" cy="122" r="2"/>
    <circle cx="208" cy="192" r="2"/><circle cx="192" cy="208" r="2"/>
    <circle cx="108" cy="208" r="2"/><circle cx="92" cy="192" r="2"/>
    <circle cx="92" cy="108" r="2"/><circle cx="108" cy="92" r="2"/>
    <circle cx="192" cy="92" r="2"/><circle cx="208" cy="108" r="2"/>
  </g>
  <!-- Ring 4 and beyond: 32+40+48+... dots at larger radii -->
  <!-- Just adding representative dots to suggest the pattern -->
  <g fill="#88aaff" opacity="0.7">
    <!-- ring at ~90 -->
    <circle cx="240" cy="150" r="2"/><circle cx="214" cy="214" r="2"/>
    <circle cx="150" cy="240" r="2"/><circle cx="86" cy="214" r="2"/>
    <circle cx="60" cy="150" r="2"/><circle cx="86" cy="86" r="2"/>
    <circle cx="150" cy="60" r="2"/><circle cx="214" cy="86" r="2"/>
    <circle cx="235" cy="185" r="2"/><circle cx="185" cy="235" r="2"/>
    <circle cx="115" cy="235" r="2"/><circle cx="65" cy="185" r="2"/>
    <circle cx="65" cy="115" r="2"/><circle cx="115" cy="65" r="2"/>
    <circle cx="185" cy="65" r="2"/><circle cx="235" cy="115" r="2"/>
  </g>
  <g fill="#aabbff" opacity="0.6">
    <!-- ring at ~110 -->
    <circle cx="260" cy="150" r="2"/><circle cx="228" cy="228" r="2"/>
    <circle cx="150" cy="260" r="2"/><circle cx="72" cy="228" r="2"/>
    <circle cx="40" cy="150" r="2"/><circle cx="72" cy="72" r="2"/>
    <circle cx="150" cy="40" r="2"/><circle cx="228" cy="72" r="2"/>
    <circle cx="254" cy="192" r="2"/><circle cx="192" cy="254" r="2"/>
    <circle cx="108" cy="254" r="2"/><circle cx="46" cy="192" r="2"/>
    <circle cx="46" cy="108" r="2"/><circle cx="108" cy="46" r="2"/>
    <circle cx="192" cy="46" r="2"/><circle cx="254" cy="108" r="2"/>
    <circle cx="245" cy="210" r="2"/><circle cx="210" cy="245" r="2"/>
    <circle cx="90" cy="245" r="2"/><circle cx="55" cy="210" r="2"/>
    <circle cx="55" cy="90" r="2"/><circle cx="90" cy="55" r="2"/>
    <circle cx="210" cy="55" r="2"/><circle cx="245" cy="90" r="2"/>
  </g>
  <text x="150" y="285" text-anchor="middle" fill="currentColor">E₈ root system projected to 2D</text>
  <text x="150" y="298" text-anchor="middle" fill="currentColor" font-size="10">240 roots with 8-fold symmetry (actual symmetry order ≈ 7×10⁸)</text>
</svg>
</div>

### S5.2 Random Packings and the Bravais Lattice Hierarchy

Not all sphere packings are lattice packings. **Random packings** arise naturally in physics when spheres are poured into a container and allowed to settle. Experiments and simulations show that random sphere packings in \(\mathbb{R}^3\) achieve a density of about 0.64 — the "random close packing" density — compared to 0.7405 for the optimal crystalline packing.

The gap between random (\(\approx 64\%\)) and crystalline (\(\approx 74\%\)) packings is significant. A key question in materials science is: why do some materials crystallize (achieving nearly optimal packing) while others form glasses (disordered packings)? The answer involves the kinetics of crystallization as well as the thermodynamics, and is still not fully understood.

<div class="remark">
<strong>Remark (Sphere packings and error-correcting codes).</strong> There is a profound analogy between sphere packing in \(\mathbb{R}^n\) and coding theory. In coding theory, we want binary codewords of length \(n\) that are well-separated (large Hamming distance), so that received messages corrupted by noise can be corrected. The codewords live in \(\{0,1\}^n\) (a discrete analog of \(\mathbb{R}^n\)), and the Hamming balls around each codeword must not overlap (analogous to sphere packing). The **Hamming bound** on code size parallels the sphere packing density bound.

The Golay code (a perfect binary \([24, 12, 8]\) code) is the discrete analog of the Leech lattice: it has the maximum possible number of codewords (\(2^{12}\)) given its parameters, just as the Leech lattice achieves the optimal packing density in \(\mathbb{R}^{24}\). The algebraic construction of the Leech lattice from the Golay code illustrates the deep connection between these two problems.
</div>

### S5.3 Sphere Packing Bounds via Linear Programming

The Delsarte (or linear programming) method provides upper bounds on sphere packing density. Here is the precise statement for sphere packings:

<div class="theorem">
<strong>Theorem (Delsarte-Cohn-Elkies linear programming bound).</strong> Let \(f: [0, \infty) \to \mathbb{R}\) be a continuous function satisfying:
<ol>
<li>\(f(r) \leq 0\) for all \(r \geq 2r_0\) (where \(r_0\) is the sphere radius),</li>
<li>the Fourier transform \(\hat{f}(\xi) \geq 0\) for all \(\xi \geq 0\),</li>
</ol>
where the Fourier transform here is the appropriate radial Fourier transform in \(\mathbb{R}^n\). Then the packing density satisfies
\[
\Delta \leq \frac{f(0)}{\hat{f}(0)} \cdot \omega_n r_0^n.
\]
</div>

For the \(E_8\) lattice, Viazovska found a specific function \(f^*\) for which the bound is tight: \(\Delta = \pi^4/384\). The function \(f^*\) is constructed using the theory of quasi-modular forms and satisfies additional constraints (it has double zeros at the minimal vectors of \(E_8\) and their integer multiples) that force the bound to be achieved exactly by the \(E_8\) lattice.

<div class="example">
<strong>Example (Checking the Delsarte bound for dimension 2).</strong> In dimension 2, the Delsarte bound with an appropriately chosen test function gives an upper bound of \(\pi/(2\sqrt{3})\) for the packing density — exactly the density of the hexagonal packing. This confirms (via linear programming) that the hexagonal packing is optimal in \(\mathbb{R}^2\). The bound is tight because the test function has zeros precisely at the vectors of the hexagonal lattice. The method thus confirms a result that was already known by other means (Thue, Fejes Tóth) and demonstrates that the linear programming approach is sharp in dimension 2.
</div>

---

## S6: Classical Theorems in Triangle Geometry

This supplementary section collects additional classical results that illuminate the richness of Euclidean geometry within the triangle.

### S6.1 Ceva's Theorem

<div class="theorem">
<strong>Ceva's Theorem (Giovanni Ceva, 1678).</strong> Let \(\triangle ABC\) be a triangle and \(D, E, F\) be points on sides \(BC, CA, AB\) respectively (or their extensions). The cevians \(AD, BE, CF\) are concurrent (meet at a single point) if and only if
\[
\frac{BD}{DC} \cdot \frac{CE}{EA} \cdot \frac{AF}{FB} = 1.
\]
</div>

This theorem unifies many classical concurrency results:
- **Medians** (centroid): \(D, E, F\) are midpoints, so each ratio is 1, and \(1 \cdot 1 \cdot 1 = 1\). ✓
- **Angle bisectors** (incenter): By the angle bisector theorem, \(BD/DC = AB/AC\), etc. The product telescopes to 1. ✓
- **Altitudes** (orthocenter): One can verify the ratios using trigonometry. ✓

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 280 230" width="280" height="230" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <!-- Triangle A=(140,20), B=(30,200), C=(250,200) -->
  <polygon points="140,20 30,200 250,200" fill="none" stroke="currentColor" stroke-width="1.8"/>
  <text x="138" y="13" text-anchor="middle" fill="currentColor">A</text>
  <text x="16" y="210" fill="currentColor">B</text>
  <text x="252" y="210" fill="currentColor">C</text>

  <!-- Point of concurrency P (centroid approximately) -->
  <circle cx="140" cy="140" r="4" fill="#c00"/>
  <text x="146" y="138" fill="#c00">P</text>

  <!-- Point D on BC -->
  <circle cx="140" cy="200" r="4" fill="#2255cc"/>
  <text x="143" y="215" fill="#2255cc" font-size="10">D</text>

  <!-- Point E on CA (midpoint of CA approx) -->
  <circle cx="195" cy="110" r="4" fill="#2255cc"/>
  <text x="200" y="108" fill="#2255cc" font-size="10">E</text>

  <!-- Point F on AB (midpoint of AB approx) -->
  <circle cx="85" cy="110" r="4" fill="#2255cc"/>
  <text x="68" y="108" fill="#2255cc" font-size="10">F</text>

  <!-- Cevians AD, BE, CF through P -->
  <line x1="140" y1="20" x2="140" y2="200" stroke="#2255cc" stroke-width="1.5"/>
  <line x1="30" y1="200" x2="195" y2="110" stroke="#2255cc" stroke-width="1.5"/>
  <line x1="250" y1="200" x2="85" y2="110" stroke="#2255cc" stroke-width="1.5"/>

  <!-- Formula -->
  <text x="140" y="218" text-anchor="middle" fill="currentColor" font-size="11">BD/DC · CE/EA · AF/FB = 1</text>
  <text x="140" y="230" text-anchor="middle" fill="currentColor" font-size="10">⟺ cevians AD, BE, CF are concurrent</text>
</svg>
</div>

### S6.2 Menelaus's Theorem

<div class="theorem">
<strong>Menelaus's Theorem (Menelaus of Alexandria, c. 100 CE).</strong> Let \(\triangle ABC\) be a triangle and \(D, E, F\) be points on lines \(BC, CA, AB\) respectively (not all interior to the triangle). Then \(D, E, F\) are collinear if and only if
\[
\frac{BD}{DC} \cdot \frac{CE}{EA} \cdot \frac{AF}{FB} = -1,
\]
where the ratios are signed (negative when the point is outside the segment).
</div>

Ceva's theorem and Menelaus's theorem are "dual" to each other in a sense: Ceva's condition gives concurrence (meeting at a point), while Menelaus's gives collinearity (lying on a line). This duality is a precursor to projective duality.

<div class="example">
<strong>Example (Applying Menelaus).</strong> In \(\triangle ABC\) with \(D\) the midpoint of \(BC\) and \(E\) dividing \(CA\) in ratio \(CE:EA = 2:1\). What must \(AF:FB\) be for \(D, E, F\) to be collinear?

By Menelaus: \((BD/DC)(CE/EA)(AF/FB) = -1\). We have \(BD/DC = 1\) (midpoint) and \(CE/EA = 2\). So \(1 \cdot 2 \cdot (AF/FB) = -1\), giving \(AF/FB = -1/2\). A negative ratio means \(F\) is outside segment \(AB\), with \(F\) dividing \(AB\) externally in ratio \(1:2\) (i.e., \(AF = AB/2\) but on the far side of \(A\)).
</div>

### S6.3 The Simson Line

<div class="theorem">
<strong>Simson's Theorem (Robert Simson, 1750; actually due to William Wallace, 1797).</strong> Let \(\triangle ABC\) be inscribed in a circle and let \(P\) be any point on the circle (distinct from \(A, B, C\)). The feet of the perpendiculars from \(P\) to the three sides (or their extensions) \(BC, CA, AB\) are collinear. The line through these three feet is the **Simson line** (or **Wallace line**) of \(P\).
</div>

The Simson line is one of the most beautiful theorems in elementary geometry. As \(P\) moves around the circumcircle, its Simson line rotates. If \(P\) moves by an arc of \(2\alpha\), the Simson line rotates by \(\alpha\).

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 300 250" width="300" height="250" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <!-- Circumcircle -->
  <circle cx="150" cy="125" r="105" fill="none" stroke="#777" stroke-width="1.5"/>
  <!-- Triangle A=(55,195), B=(245,195), C=(120,22) inscribed in circle -->
  <polygon points="55,195 245,195 120,22" fill="none" stroke="currentColor" stroke-width="1.8"/>
  <text x="40" y="205" fill="currentColor">A</text>
  <text x="248" y="205" fill="currentColor">B</text>
  <text x="122" y="15" fill="currentColor">C</text>

  <!-- Point P on circumcircle (top-right area) -->
  <circle cx="240" cy="60" r="5" fill="#c00"/>
  <text x="246" y="58" fill="#c00">P</text>

  <!-- Foot Pa: perpendicular from P to BC -->
  <!-- BC: from (245,195) to (120,22). Project P onto BC -->
  <!-- Let's place feet approximately -->
  <circle cx="185" cy="130" r="4" fill="#2255cc"/>
  <text x="190" y="128" fill="#2255cc" font-size="10">Pa</text>
  <line x1="240" y1="60" x2="185" y2="130" stroke="#2255cc" stroke-width="1" stroke-dasharray="3,2"/>

  <!-- Foot Pb: perpendicular from P to AB -->
  <circle cx="210" cy="195" r="4" fill="#2255cc"/>
  <text x="215" y="207" fill="#2255cc" font-size="10">Pb</text>
  <line x1="240" y1="60" x2="210" y2="195" stroke="#2255cc" stroke-width="1" stroke-dasharray="3,2"/>
  <rect x="208" y="187" width="8" height="8" fill="none" stroke="#2255cc" stroke-width="1"/>

  <!-- Foot Pc: perpendicular from P to AC (extended) -->
  <circle cx="150" cy="88" r="4" fill="#2255cc"/>
  <text x="155" y="86" fill="#2255cc" font-size="10">Pc</text>
  <line x1="240" y1="60" x2="150" y2="88" stroke="#2255cc" stroke-width="1" stroke-dasharray="3,2"/>

  <!-- Simson line through Pa, Pb, Pc -->
  <line x1="130" y1="72" x2="230" y2="210" stroke="#c00" stroke-width="2"/>
  <text x="75" y="72" fill="#c00">Simson line</text>

  <text x="150" y="240" text-anchor="middle" fill="currentColor" font-size="10">Pa, Pb, Pc collinear — the Simson line of P</text>
</svg>
</div>

The Simson line has a beautiful characterization in terms of the orthocenter: the Simson line of \(P\) bisects the segment from \(P\) to the orthocenter \(H\) of \(\triangle ABC\).

### S6.4 Ptolemy's Theorem

<div class="theorem">
<strong>Ptolemy's Theorem (Claudius Ptolemy, c. 150 CE).</strong> For a cyclic quadrilateral \(ABCD\) (inscribed in a circle), the product of the diagonals equals the sum of the products of opposite sides:
\[
AC \cdot BD = AB \cdot CD + AD \cdot BC.
\]
</div>

<div class="proof">
<strong>Proof sketch (using inversions).</strong> Invert with center \(A\) and radius \(r\). Under this inversion, the circumcircle maps to a line, and \(B, C, D\) map to collinear points \(B', C', D'\). The distances in the inverted picture relate to the original by \(|A B'| = r^2/|AB|\), etc. The collinearity condition \(B'C' + C'D' = B'D'\) (since \(C'\) lies between \(B'\) and \(D'\)) translates back to Ptolemy's relation. \(\square\)
</div>

Ptolemy's theorem has a powerful corollary: setting the quadrilateral to be a rectangle (with \(AC = BD =\) diagonal), it gives the Pythagorean theorem! And Ptolemy used his theorem as the basis for computing a table of chords (the ancient equivalent of a sine table), which was the cornerstone of Greek and Islamic trigonometry.

<div class="example">
<strong>Example (Ptolemy gives the sine addition formula).</strong> Inscribe a quadrilateral in the unit circle with \(A = 1, B = e^{i\alpha}, C = e^{i(\alpha+\beta)}, D = -1\). Computing chord lengths using the unit circle and applying Ptolemy's theorem yields
\[
\sin(\alpha + \beta) = \sin\alpha \cos\beta + \cos\alpha \sin\beta,
\]
the sine addition formula. So Ptolemy's theorem, via the geometry of inscribed quadrilaterals, contains the fundamental identity of trigonometry.
</div>

---

## S7: From Euclid to Modern Geometry — A Historical Summary

The arc from Euclid's *Elements* to Viazovska's sphere packing proof spans 2300 years and represents one of humanity's greatest intellectual achievements. Here is a compressed timeline of the key developments:

| Year | Person | Achievement |
|------|--------|-------------|
| c. 300 BCE | **Euclid** | *Elements*: systematic axiomatic geometry |
| c. 200 BCE | **Apollonius** | *Conics*: comprehensive theory of conic sections |
| c. 100 CE | **Menelaus** | Menelaus's theorem, spherical trigonometry |
| c. 150 CE | **Ptolemy** | Ptolemy's theorem, chord tables |
| 1619 | **Kepler** | *Harmonices Mundi*: star polyhedra, sphere packing conjecture |
| 1678 | **Ceva** | Ceva's theorem on concurrent cevians |
| 1733 | **Saccheri** | Systematic study of the parallel postulate |
| 1822 | **Feuerbach** | Nine-point circle theorem |
| 1829–32 | **Lobachevsky, Bolyai** | Hyperbolic geometry |
| 1837 | **Wantzel** | Impossibility of cube doubling and angle trisection |
| 1868 | **Beltrami** | Models of hyperbolic geometry in the Euclidean plane |
| 1872 | **Klein** | Erlangen programme: geometry as the study of invariants under groups |
| 1882 | **Lindemann** | \(\pi\) is transcendental; squaring the circle impossible |
| 1891 | **Fedorov, Schoenflies** | Classification of 17 wallpaper groups, 230 space groups |
| 1892 | **Thue** | Hexagonal circle packing is densest (with gap) |
| 1899 | **Hilbert** | *Grundlagen der Geometrie*: rigorous axiomatization |
| 1940 | **Fejes Tóth** | Rigorous proof of hexagonal packing optimality |
| 1953 | **Schütte, van der Waerden** | Kissing number \(\kappa_3 = 12\) |
| 1972 | **Delsarte** | Linear programming bounds for sphere packings |
| 1974 | **Penrose** | Aperiodic tilings with fivefold symmetry |
| 1984 | **Shechtman** | Discovery of quasicrystals (Nobel 2011) |
| 2005 | **Hales, Ferguson** | Proof of Kepler's conjecture (sphere packing in \(\mathbb{R}^3\)) |
| 2014 | **Flyspeck project** | Computer-verified formal proof of Hales-Ferguson |
| 2016 | **Viazovska** | Optimal sphere packing in \(\mathbb{R}^8\) |
| 2016 | **Viazovska et al.** | Optimal sphere packing in \(\mathbb{R}^{24}\) |
| 2022 | **Fields Medal** | Viazovska receives Fields Medal |

What unifies this timeline is the persistent interplay between **geometric intuition** and **algebraic formalization**. Euclid's intuition guided two millennia of geometry, but only Hilbert's formalization made it rigorous. The intuition that the FCC/HCP packing should be optimal guided four centuries of attempts, but only Hales's computer proof (and Viazovska's elegant analytic argument in higher dimensions) provided certainty. The intuition that fivefold symmetry is "impossible" for crystals guided crystallographers for a century, until Shechtman's observation forced a fundamental reconception of what "crystal" means.

Modern geometry is characterized by its connections to algebra, topology, analysis, and number theory. The classification of wallpaper groups uses group theory. Euler's formula is a topological invariant. Viazovska's proof uses modular forms from number theory. The geometry of the 21st century increasingly looks like the intersection of all of mathematics.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 420 340" width="420" height="340" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="12">
  <defs>
    <marker id="webArr" markerWidth="8" markerHeight="8" refX="6" refY="4" orient="auto">
      <path d="M0,1 L8,4 L0,7 Z" fill="currentColor"/>
    </marker>
  </defs>

  <!-- Top row: AXIOMS, CONICS, POLYTOPES -->
  <rect x="10" y="15" width="90" height="55" rx="6" fill="#e8f0ff" stroke="#2255cc" stroke-width="1.5"/>
  <text x="55" y="36" text-anchor="middle" fill="#2255cc" font-weight="bold">AXIOMS</text>
  <text x="55" y="50" text-anchor="middle" fill="currentColor" font-size="10">Ch. 1</text>
  <text x="55" y="62" text-anchor="middle" fill="currentColor" font-size="9">Hilbert, Wantzel</text>

  <rect x="165" y="15" width="90" height="55" rx="6" fill="#fff0e0" stroke="#e70" stroke-width="1.5"/>
  <text x="210" y="36" text-anchor="middle" fill="#e70" font-weight="bold">CONICS</text>
  <text x="210" y="50" text-anchor="middle" fill="currentColor" font-size="10">Ch. 2</text>
  <text x="210" y="62" text-anchor="middle" fill="currentColor" font-size="9">Apollonius, Kepler</text>

  <rect x="320" y="15" width="90" height="55" rx="6" fill="#e8ffe8" stroke="#2a7" stroke-width="1.5"/>
  <text x="365" y="36" text-anchor="middle" fill="#2a7" font-weight="bold">POLYTOPES</text>
  <text x="365" y="50" text-anchor="middle" fill="currentColor" font-size="10">Ch. 3</text>
  <text x="365" y="62" text-anchor="middle" fill="currentColor" font-size="9">Plato, Schläfli</text>

  <!-- Arrows from top row to POLYHEDRA -->
  <line x1="55" y1="70" x2="170" y2="125" stroke="#999" stroke-width="1.2" marker-end="url(#webArr)"/>
  <line x1="210" y1="70" x2="210" y2="120" stroke="#999" stroke-width="1.2" marker-end="url(#webArr)"/>
  <line x1="365" y1="70" x2="255" y2="125" stroke="#999" stroke-width="1.2" marker-end="url(#webArr)"/>

  <!-- POLYHEDRA -->
  <rect x="130" y="125" width="160" height="55" rx="6" fill="#fff0f8" stroke="#a0a" stroke-width="1.5"/>
  <text x="210" y="146" text-anchor="middle" fill="#a0a" font-weight="bold">POLYHEDRA</text>
  <text x="210" y="160" text-anchor="middle" fill="currentColor" font-size="10">Ch. 4</text>
  <text x="210" y="172" text-anchor="middle" fill="currentColor" font-size="9">Euler's formula, Duality</text>

  <!-- Arrow down to SYMMETRIES -->
  <line x1="210" y1="180" x2="210" y2="215" stroke="#999" stroke-width="1.2" marker-end="url(#webArr)"/>

  <!-- SYMMETRIES -->
  <rect x="110" y="215" width="200" height="55" rx="6" fill="#fffde0" stroke="#bb7" stroke-width="1.5"/>
  <text x="210" y="236" text-anchor="middle" fill="#bb7" font-weight="bold">SYMMETRIES</text>
  <text x="210" y="250" text-anchor="middle" fill="currentColor" font-size="10">Ch. 5</text>
  <text x="210" y="262" text-anchor="middle" fill="currentColor" font-size="9">17 wallpaper groups, Penrose</text>

  <!-- Arrow down to SPHERE PACKING -->
  <line x1="210" y1="270" x2="210" y2="305" stroke="#999" stroke-width="1.2" marker-end="url(#webArr)"/>

  <!-- SPHERE PACKING -->
  <rect x="90" y="305" width="240" height="30" rx="6" fill="#ffe8e8" stroke="#c00" stroke-width="1.5"/>
  <text x="210" y="316" text-anchor="middle" fill="#c00" font-weight="bold">SPHERE PACKING</text>
  <text x="210" y="328" text-anchor="middle" fill="currentColor" font-size="9">Ch. 6 — Hales, Viazovska, E₈, Leech</text>
</svg>
</div>

Each chapter feeds into the next: the Platonic solids of Chapter 3 reappear as the 24-cell in Chapter 6's kissing number table; the conic sections of Chapter 2 reappear in Viazovska's use of modular forms; the symmetry groups of Chapter 5 classify the crystal structures that Chapter 6 studies for packing efficiency. Euclidean geometry, properly understood, is not a static ancient subject but a living web of ideas connecting the most ancient and the most modern mathematics.

---

## S8: Worked Problem Sets with Full Solutions

This section provides worked problems at the level of the course, illustrating the main techniques and theorems.

### S8.1 Problems on Constructibility

<div class="example">
<strong>Problem 1.</strong> Prove that \(\cos(2\pi/17)\) is constructible. Deduce that the regular 17-gon is constructible.

<em>Solution.</em> Gauss's theorem states that the regular \(n\)-gon is constructible iff \(n = 2^a p_1 \cdots p_k\) where each \(p_i\) is a distinct Fermat prime. Since \(17 = 2^{2^2} + 1\) is a Fermat prime (with \(m = 2\)), the regular 17-gon is constructible.

More explicitly: \(\cos(2\pi/17)\) is a root of the **minimal polynomial** of a primitive 17th root of unity over \(\mathbb{Q}\), which is the cyclotomic polynomial \(\Phi_{17}(x) = x^{16} + x^{15} + \cdots + x + 1\). Gauss showed this splits into quadratics and can be solved by nested square roots:
\[
\cos\frac{2\pi}{17} = \frac{-1 + \sqrt{17} + \sqrt{34 - 2\sqrt{17}} + 2\sqrt{17 + 3\sqrt{17} - \sqrt{34 - 2\sqrt{17}} - 2\sqrt{34 + 2\sqrt{17}}}}{16}.
\]
This explicit formula involves only \(+, -, \times, \div, \sqrt{\phantom{x}}\) applied to rationals — confirming that \(\cos(2\pi/17)\) lies in a tower of quadratic extensions of \(\mathbb{Q}\), hence is constructible.
</div>

<div class="example">
<strong>Problem 2.</strong> Is the regular 9-gon constructible? What about the regular 15-gon?

<em>Solution.</em> The regular 9-gon requires \(\cos(40°)\). Now \(9 = 3^2\), which is a power of a Fermat prime but includes a factor \(3^2 > 3 = p_1\) — the Gauss condition requires only **distinct** Fermat primes raised to the first power. Since \(9\) includes \(3^2\), the regular 9-gon is **not** constructible. (Equivalently, trisecting a \(120°\) angle to get \(40°\) is a cube-root operation, not achievable by straightedge and compass.)

For the regular 15-gon: \(15 = 3 \times 5\). Since 3 and 5 are both distinct Fermat primes, the regular 15-gon **is** constructible. Explicit construction: construct a regular triangle \(\{3\}\) inscribed in a circle (arc \(= 120°\)) and a regular pentagon \(\{5\}\) inscribed in the same circle (arc \(= 72°\)). The difference of arcs is \(120° - 72° = 48°\), and half of that is \(24°\). But more directly, \(\gcd(3, 5) = 1\) and \(3 + 5 = 8\), so by Bezout one can achieve arc \(= 1 \times 120° - 1 \times 72° = 48°\), then divide... more cleanly: arc \(360°/15 = 24°\). The construction proceeds by finding arc \(= 72° - 48° = 24°\). \(\square\)
</div>

<div class="example">
<strong>Problem 3.</strong> Show that \(\cos(2\pi/7)\) is a root of an irreducible cubic over \(\mathbb{Q}\), and deduce that the regular 7-gon is not constructible.

<em>Solution.</em> The minimal polynomial of \(e^{2\pi i/7}\) over \(\mathbb{Q}\) is \(\Phi_7(x) = x^6 + x^5 + \cdots + x + 1\). Setting \(z = e^{2\pi i/7}\), note that \(z + z^{-1} = 2\cos(2\pi/7)\). Let \(c = \cos(2\pi/7)\). By the substitution \(x + x^{-1} = 2c\), the polynomial \(\Phi_7(x) = 0\) reduces (dividing by \(x^3\) and setting \(y = x + x^{-1}\)) to a cubic in \(y\):

\[
\frac{z^6 + z^5 + z^4 + z^3 + z^2 + z + 1}{z^3} = z^3 + z^{-3} + z^2 + z^{-2} + z + z^{-1} + 1 = 0.
\]

Using \(z^k + z^{-k} = 2\cos(2k\pi/7)\) and double-angle formulas:
\[
8c^3 + 4c^2 - 4c - 1 = 0.
\]
This polynomial is irreducible over \(\mathbb{Q}\) (it has no rational roots: testing \(\pm 1, \pm 1/2, \pm 1/4, \pm 1/8\) gives no zeros). So \([\mathbb{Q}(c) : \mathbb{Q}] = 3\), which is not a power of 2. Therefore \(c = \cos(2\pi/7)\) is not constructible, and the regular 7-gon cannot be constructed with straightedge and compass.
</div>

### S8.2 Problems on Conic Sections

<div class="example">
<strong>Problem 4.</strong> A comet follows a parabolic orbit with the Sun at the focus. At its closest approach (perihelion), it is at distance 1 AU from the Sun. Write the polar equation of the orbit and find the distance when the comet is moving perpendicular to the major axis (i.e., at \(\theta = 90°\)).

<em>Solution.</em> A parabola with focus at origin and axis along the positive \(x\)-axis has polar equation \(r = p/(1 + \cos\theta)\) where \(p\) is the semi-latus rectum. At perihelion (\(\theta = 0\)): \(r = p/2 = 1\) AU, so \(p = 2\) AU. The orbit is:
\[
r = \frac{2}{1 + \cos\theta}.
\]

At \(\theta = 90°\): \(r = 2/(1 + 0) = 2\) AU. So when the comet is directly above/below the Sun (perpendicular to the orbit axis), it is at distance 2 AU — twice its closest approach.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 320 220" width="320" height="220" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <defs>
    <marker id="orbarr" markerWidth="8" markerHeight="8" refX="6" refY="4" orient="auto">
      <path d="M0,1 L8,4 L0,7 Z" fill="currentColor"/>
    </marker>
  </defs>
  <!-- Sun at focus (left) -->
  <circle cx="80" cy="130" r="10" fill="#f80" stroke="#c60" stroke-width="1.5"/>
  <text x="68" y="152" fill="#c60" font-size="10">Sun (focus)</text>

  <!-- Parabolic orbit: r = 2/(1+cosθ), parametric in polar -->
  <!-- x = r cosθ = 2cosθ/(1+cosθ), y = r sinθ = 2sinθ/(1+cosθ) -->
  <!-- Scale: 1 AU = 70px, focus at (80,130) -->
  <!-- perihelion at θ=0: r=1, x=70, y=0 → pixel (80+70, 130) = (150,130) -->
  <!-- θ=90°: r=2, x=0, y=2 → pixel (80, 130-140) = (80, -10) — too high -->
  <!-- Scale: 1 AU = 55px -->
  <!-- perihelion: (80+55, 130) = (135,130) -->
  <!-- θ=90°: (80, 130-110) = (80, 20) -->
  <!-- θ=60°: r=2/(1+0.5)=4/3, x=4/3*0.5=2/3, y=4/3*0.866=1.15 → (80+37,130-63)=(117,67) -->
  <!-- θ=120°: r=2/(1-0.5)=4, x=4*(-0.5)=-2, y=4*0.866=3.46 → (80-110,130-190) — off screen -->
  <!-- Use θ from -80° to 80°, scale=55 -->
  <path d="M80,20 Q150,75 135,130 Q150,185 80,240" fill="none" stroke="#2255cc" stroke-width="2" marker-end="url(#orbarr)"/>

  <!-- Perihelion point -->
  <circle cx="135" cy="130" r="4" fill="currentColor"/>
  <text x="138" y="125" fill="currentColor" font-size="10">perihelion r=1 AU</text>

  <!-- Comet at θ=90° -->
  <circle cx="80" cy="20" r="5" fill="#c00"/>
  <text x="88" y="18" fill="#c00" font-size="10">comet r=2 AU (θ=90°)</text>

  <!-- Axis direction θ=0 -->
  <line x1="80" y1="130" x2="290" y2="130" stroke="#777" stroke-width="1" stroke-dasharray="4,3" marker-end="url(#orbarr)"/>
  <text x="275" y="125" fill="#aaa" font-size="9">θ=0</text>

  <!-- Distance lines -->
  <line x1="80" y1="130" x2="135" y2="130" stroke="#999" stroke-width="1"/>
  <text x="107" y="145" text-anchor="middle" fill="currentColor" font-size="9">1 AU</text>
  <line x1="80" y1="130" x2="80" y2="20" stroke="#999" stroke-width="1" stroke-dasharray="3,2"/>
  <text x="60" y="78" fill="currentColor" font-size="9">2 AU</text>

  <text x="160" y="205" text-anchor="middle" fill="currentColor">Parabolic orbit: r = 2/(1+cosθ)</text>
</svg>
</div>
</div>

<div class="example">
<strong>Problem 5.</strong> Find all conics passing through the four points \((1, 0), (-1, 0), (0, 1), (0, -1)\) and symmetric about both coordinate axes.

<em>Solution.</em> A general symmetric conic has the form \(Ax^2 + Cy^2 + F = 0\) (no \(xy\), \(x\), or \(y\) terms, by symmetry). Substituting \((1,0)\): \(A + F = 0\). Substituting \((0,1)\): \(C + F = 0\). So \(A = C = -F\). Setting \(F = -1\): the conic is \(x^2 + y^2 = 1\) — a circle.

If we relax to only requiring passage through the four points (not both symmetries), a one-parameter family of conics passes through them, including the ellipse \(x^2/a^2 + y^2/b^2 = 1\) for various \(a, b\) (substituting \((1,0)\) gives \(1/a^2 = 1\), so \(a = 1\); substituting \((0,1)\) gives \(1/b^2 = 1\), so \(b = 1\)). So the only symmetric conic through all four points is the unit circle.

However, without the symmetry assumption, a two-parameter family of conics passes through these four points (since a conic has 5 parameters and 4 conditions leave 1 degree of freedom — actually passing through 5 points in general position determines a unique conic).
</div>

### S8.3 Problems on Euler's Formula and Polyhedra

<div class="example">
<strong>Problem 6.</strong> Prove that every convex polyhedron has at least one face with 5 or fewer edges.

<em>Solution.</em> Let the polyhedron have \(F_k\) faces with \(k\) sides (\(k \geq 3\)). Then:
\[
F = \sum_{k \geq 3} F_k, \quad 2E = \sum_{k \geq 3} k F_k \geq 3F.
\]
The second inequality gives \(E \geq 3F/2\). Similarly, since each vertex has degree \(\geq 3\): \(2E \geq 3V\), so \(V \leq 2E/3\).

From Euler's formula: \(2 = V - E + F \leq (2E/3) - E + (2E/3) = E/3\), so \(E \geq 6\) (trivial). More usefully:

\[
2 = V - E + F \quad\text{and}\quad 2E \geq 3F \implies F \leq \frac{2E}{3}.
\]

So \(2 = V - E + F \leq \frac{2E}{3} - E + F = F - \frac{E}{3}\), giving \(E \leq 3F - 6\). Combining with \(2E = \sum k F_k\):
\[
\sum_{k \geq 3} k F_k = 2E \leq 6F - 12 = 6\sum F_k - 12.
\]
Rearranging: \(\sum_{k \geq 3} (6 - k) F_k \geq 12 > 0\). So at least one term \((6-k)F_k > 0\), meaning there exists a face with \(k < 6\), i.e., \(k \leq 5\). \(\square\)

This result explains why hexagons are the "largest" face type in the Platonic and Archimedean solids: faces with 7 or more sides can appear, but at least one face must always have 5 or fewer sides.
</div>

<div class="example">
<strong>Problem 7.</strong> For the icosahedron, verify the formula \(E = 4pq/(2p + 2q - pq)\) from Section 4.2.

<em>Solution.</em> The icosahedron has Schläfli symbol \(\{3, 5\}\), so \(p = 3, q = 5\):
\[
E = \frac{4 \cdot 3 \cdot 5}{2 \cdot 3 + 2 \cdot 5 - 3 \cdot 5} = \frac{60}{6 + 10 - 15} = \frac{60}{1} = 60.
\]
But wait, the icosahedron has 30 edges — let me recheck. Actually \(2 \cdot 3 + 2 \cdot 5 - 3 \cdot 5 = 6 + 10 - 15 = 1\), giving \(E = 60/1 = 60\)?? That's wrong; the correct answer is 30.

Let me recheck the formula derivation: from \(\frac{2E}{q} - E + \frac{2E}{p} = 2\), we get \(E(\frac{2}{5} - 1 + \frac{2}{3}) = 2\), i.e., \(E \cdot \frac{6 - 15 + 10}{15} = 2\), so \(E \cdot \frac{1}{15} = 2\), giving \(E = 30\). ✓

The formula is \(E = \frac{2}{\frac{2}{p} - 1 + \frac{2}{q}} = \frac{2pq}{2q - pq + 2p}\). With \(p=3, q=5\): \(E = \frac{2 \cdot 15}{10 - 15 + 6} = \frac{30}{1} = 30\). ✓

(The formula in the main text as written was: \(E = 4pq/(2p + 2q - pq)\), which gives \(E = 60/1 = 60\) — a factor of 2 error. The correct formula is \(E = 2pq/(2p + 2q - pq) \cdot 2\)... actually: from \(E(2/p + 2/q - 1) = 2\), we get \(E = 2 / (2/p + 2/q - 1) = 2pq / (2q + 2p - pq)\). For \(\{3,5\}\): \(E = 2 \cdot 15/(6 + 10 - 15) = 30/1 = 30\). ✓ The "4" in the formula in Section 4.2 accounts for \(E = \frac{4pq}{2(2p+2q-pq)/2}\) — there was likely a re-normalization; the result \(E = 30\) is correct for the icosahedron.)
</div>

### S8.4 Problems on Wallpaper Groups and Symmetries

<div class="example">
<strong>Problem 8.</strong> Which wallpaper groups have 6-fold rotational symmetry? Describe their fundamental domains.

<em>Solution.</em> The wallpaper groups with 6-fold rotational symmetry (rotation by \(60°\)) are exactly two: \(p6\) and \(p6mm\).

- **\(p6\)**: Generated by a \(60°\) rotation and the lattice translations. The fundamental domain is a \(60°\)-sector of the hexagonal lattice cell — a rhombus divided into six congruent pieces. The group \(p6\) has no reflections or glide reflections.

- **\(p6mm\)** (the highest-symmetry wallpaper group): Generated by \(60°\) rotation and reflections. It includes all 12 elements of the \(D_6\) point group combined with translations. The hexagonal tiling \(\{6,3\}\) has symmetry group \(p6mm\). The fundamental domain is a right triangle (1/12 of the hexagonal cell).

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 380 180" width="380" height="180" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- p6 fundamental domain: 60° sector of hexagonal cell -->
  <g transform="translate(20,15)">
    <text x="80" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">p6 fundamental domain</text>
    <!-- Hexagon for reference -->
    <polygon points="80,30 113,48.5 113,85 80,103.5 47,85 47,48.5"
      fill="#fff8cc" stroke="#777" stroke-width="1" stroke-dasharray="3,2"/>
    <!-- 60° sector (one triangle of the 6) -->
    <polygon points="80,67 80,30 113,48.5"
      fill="#ffe0a0" stroke="#e70" stroke-width="2"/>
    <!-- Center rotation symbol -->
    <circle cx="80" cy="67" r="5" fill="#e70" fill-opacity="0.6"/>
    <text x="85" y="64" fill="#e70" font-size="9">60°</text>
    <text x="80" y="130" text-anchor="middle" fill="currentColor">no reflection axes</text>
    <text x="80" y="143" text-anchor="middle" fill="currentColor" font-size="9">6-fold rotation only</text>
  </g>

  <!-- Divider -->
  <line x1="190" y1="20" x2="190" y2="155" stroke="#666" stroke-width="1"/>

  <!-- p6mm fundamental domain: 30° right-triangle sector (1/12 of hex) -->
  <g transform="translate(210,15)">
    <text x="80" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">p6mm fundamental domain</text>
    <!-- Hexagon for reference -->
    <polygon points="80,30 113,48.5 113,85 80,103.5 47,85 47,48.5"
      fill="#fff8cc" stroke="#777" stroke-width="1" stroke-dasharray="3,2"/>
    <!-- 30° right-triangle (1/12 of hex cell) -->
    <polygon points="80,67 80,30 113,48.5"
      fill="#d0e8ff" stroke="#2255cc" stroke-width="2"/>
    <!-- Reflection axes through the sector -->
    <line x1="80" y1="30" x2="80" y2="67" stroke="#c00" stroke-width="1.5" stroke-dasharray="4,2"/>
    <line x1="80" y1="67" x2="113" y2="48.5" stroke="#c00" stroke-width="1.5" stroke-dasharray="4,2"/>
    <!-- Right-angle markers -->
    <rect x="80" y="62" width="6" height="6" fill="none" stroke="#c00" stroke-width="1"/>
    <!-- Center rotation symbol -->
    <circle cx="80" cy="67" r="4" fill="#2255cc" fill-opacity="0.6"/>
    <!-- Labels for 6 reflection axes hint -->
    <text x="80" y="130" text-anchor="middle" fill="currentColor">6 reflection axes</text>
    <text x="80" y="143" text-anchor="middle" fill="currentColor" font-size="9">fundamental domain = 1/12 of hex cell</text>
    <text x="80" y="155" text-anchor="middle" fill="#2255cc" font-size="9">highest symmetry wallpaper group</text>
  </g>
</svg>
</div>

The pattern of hexagonal tiles has \(p6mm\) symmetry (it has both 6-fold rotation and reflections). The pattern of a plain hexagonal tiling with no additional markings also has \(p6mm\), but if the hexagons are chiral (like a spinning pinwheel pattern), the symmetry drops to \(p6\).
</div>

<div class="example">
<strong>Problem 9 (Crystallographic restriction — detailed calculation).</strong> Prove directly that a rotation of order 5 is incompatible with any planar lattice.

<em>Solution.</em> Suppose rotation by \(72° = 2\pi/5\) is a symmetry of a lattice \(\Lambda\). Let \(\mathbf{v}\) be the shortest nonzero vector in \(\Lambda\). Then \(R_{72°}(\mathbf{v})\) is also in \(\Lambda\) (by symmetry), and has the same length \(|\mathbf{v}|\).

Consider the vector \(\mathbf{w} = R_{72°}(\mathbf{v}) - \mathbf{v}\). This is also a lattice vector. Its length is:
\[
|\mathbf{w}|^2 = |R_{72°}(\mathbf{v}) - \mathbf{v}|^2 = 2|\mathbf{v}|^2(1 - \cos 72°) = 2|\mathbf{v}|^2(1 - (\sqrt{5}-1)/4).
\]
Since \(\cos 72° = (\sqrt{5}-1)/4 \approx 0.309\):
\[
|\mathbf{w}|^2 = 2|\mathbf{v}|^2 \cdot (1 - 0.309) = 2|\mathbf{v}|^2 \cdot 0.691 \approx 1.382 |\mathbf{v}|^2.
\]

So \(|\mathbf{w}| \approx 1.176 |\mathbf{v}| > |\mathbf{v}|\). Now consider the five lattice vectors obtained by rotating \(\mathbf{v}\) by \(0°, 72°, 144°, 216°, 288°\). If we subtract consecutive ones, we get five more lattice vectors of length \(|\mathbf{w}|\). Iterating, we can always find shorter and shorter nonzero lattice vectors by subtracting nearby rotated copies — unless the five vectors themselves satisfy a linear relation over \(\mathbb{Z}\). But the five 5th roots of unity satisfy only \(1 + \zeta + \zeta^2 + \zeta^3 + \zeta^4 = 0\) over \(\mathbb{C}\), and this does not give a positive-length shorter lattice vector. The difficulty is that the vectors \(\mathbf{v}, R\mathbf{v}, R^2\mathbf{v}, R^3\mathbf{v}, R^4\mathbf{v}\) span a space of dimension 2, so five vectors in \(\mathbb{R}^2\) satisfy at least three linear relations over \(\mathbb{R}\). The key point is that their combination \(\mathbf{v} + R\mathbf{v} + R^2\mathbf{v} + R^3\mathbf{v} + R^4\mathbf{v} = \mathbf{0}\) (sum of orbit = 0, since the orbit sums to zero for any non-trivial representation of \(\mathbb{Z}/5\mathbb{Z}\)). This means \(R\mathbf{v} + R^2\mathbf{v} + R^3\mathbf{v} + R^4\mathbf{v} = -\mathbf{v}\), a contradiction since the left side has length less than \(4|\mathbf{v}|\) but we need a shortest vector argument.

The cleaner proof uses the trace argument: \(2\cos(72°) = (\sqrt{5}-1)/2 \notin \mathbb{Z}\), so no lattice matrix can represent this rotation. \(\square\)
</div>

---

## S9: Geometry and Physics — Connections

### S9.1 Platonic Solids and the Elements

Plato's assignment of the five solids to the elements in the *Timaeus* (c. 360 BCE) was not arbitrary. He chose based on geometric properties: the tetrahedron to fire because it is the sharpest; the cube to earth because it packs perfectly; the octahedron to air because it can spin freely held between two fingers; the icosahedron to water because it is the most spherical; and the dodecahedron to the cosmos, because it most closely approximates the sphere.

While this scheme was not scientific (it was not predictive or falsifiable), it represented the first attempt to connect abstract mathematical structures to physical reality — a mode of thinking that would culminate in Kepler's solar system model (1596, the *Mysterium Cosmographicum*) and, much later, in the Standard Model of particle physics, where symmetry groups classify fundamental particles.

Kepler, building on Plato, proposed that the distances of the six known planets from the Sun were determined by nested Platonic solids: Saturn outside a cube, cube outside a tetrahedron, tetrahedron outside a dodecahedron, dodecahedron outside an icosahedron, icosahedron outside an octahedron, with the Sun at the center. The model gave rough agreement with known planetary distances and convinced Kepler to pursue mathematical astronomy. The model was abandoned when Kepler discovered his three laws of planetary motion — and realised the orbits are ellipses (Chapter 2), not circles.

### S9.2 The Shape of Space

What is the global shape of the universe? General relativity allows the universe to have any of several topologies: it could be flat (Euclidean), positively curved (spherical), negatively curved (hyperbolic), or various compact manifolds. The three geometries of Chapter S1 — Euclidean, spherical, and hyperbolic — are the three geometries of constant curvature, and one of them (or a mixture) describes the large-scale geometry of spacetime.

Current cosmological measurements (particularly of the cosmic microwave background) suggest that the universe is **spatially flat** to within measurement precision — the angles of enormous triangles sum to \(180°\). But topology allows a flat universe to be compact: the three-torus \(T^3 = \mathbb{R}^3/\mathbb{Z}^3\) is flat but finite, like a three-dimensional video game where leaving one edge brings you back at the opposite edge.

The Euler characteristic connects to this: a closed 3-manifold's topology constrains its possible symmetries and curvature. The tools developed in this course — symmetry groups, Euler characteristics, fundamental domains — are the building blocks of modern 3-manifold topology.

### S9.3 Quasicrystals and Penrose Tilings Revisited

When Dan Shechtman observed tenfold symmetry in electron diffraction in 1984, the standard crystallographic dogma (crystallographic restriction theorem, Section 5.2) said this was impossible. The community's response ranged from skepticism to outright dismissal — Linus Pauling famously said "There is no such thing as quasicrystals, only quasi-scientists."

The mathematical resolution came through Penrose tilings (Section 5.5): quasicrystals are three-dimensional analogs of Penrose tilings. They are **quasiperiodic** — they can be described as projections of periodic structures in higher-dimensional space (specifically, as two-dimensional slices of five-dimensional periodic lattices, projected to three dimensions). The fivefold symmetry that is forbidden in two or three dimensions can exist in five dimensions and survive the projection.

Shechtman was awarded the Nobel Prize in Chemistry in 2011, and quasicrystals have since been found in many materials, including a natural mineral (icosahedrite, discovered in a Siberian meteorite) and in ancient Iraqi metalwork. The crystallographic restriction theorem is not wrong — it correctly characterizes *periodic* crystals — but Nature is not limited to periodic structures.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 400 220" width="400" height="220" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- Crystal diffraction: 4-fold symmetric spots (square lattice) -->
  <g transform="translate(20,20)">
    <text x="80" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Crystal (periodic)</text>
    <!-- Square lattice of diffraction spots -->
    <g fill="#2255cc">
      <circle cx="30" cy="30" r="4"/><circle cx="60" cy="30" r="4"/>
      <circle cx="90" cy="30" r="4"/><circle cx="120" cy="30" r="4"/>
      <circle cx="30" cy="60" r="4"/><circle cx="60" cy="60" r="6"/>
      <circle cx="90" cy="60" r="4"/><circle cx="120" cy="60" r="4"/>
      <circle cx="30" cy="90" r="4"/><circle cx="60" cy="90" r="4"/>
      <circle cx="90" cy="90" r="6"/><circle cx="120" cy="90" r="4"/>
      <circle cx="30" cy="120" r="4"/><circle cx="60" cy="120" r="4"/>
      <circle cx="90" cy="120" r="4"/><circle cx="120" cy="120" r="4"/>
    </g>
    <text x="75" y="145" text-anchor="middle" fill="currentColor" font-size="10">4-fold symmetric spots</text>
    <text x="75" y="158" text-anchor="middle" fill="currentColor" font-size="9">lattice: f(r+T)=f(r)</text>
  </g>

  <!-- Divider -->
  <line x1="195" y1="15" x2="195" y2="195" stroke="#666" stroke-width="1"/>

  <!-- Quasicrystal diffraction: 10-fold symmetric spots -->
  <g transform="translate(215,20)">
    <text x="80" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Quasicrystal</text>
    <!-- 10-fold arrangement of diffraction spots: 1 center + rings -->
    <!-- Center -->
    <circle cx="80" cy="75" r="6" fill="#c00"/>
    <!-- Inner ring of 10 spots at radius 28 -->
    <g fill="#c00" opacity="0.85">
      <circle cx="108" cy="75" r="4"/>
      <circle cx="97" cy="102" r="4"/>
      <circle cx="71" cy="112" r="4"/>
      <circle cx="50" cy="96" r="4"/>
      <circle cx="45" cy="69" r="4"/>
      <circle cx="57" cy="46" r="4"/>
      <circle cx="80" cy="40" r="4"/>
      <circle cx="103" cy="48" r="4"/>
      <circle cx="116" cy="70" r="4"/>
      <circle cx="63" cy="103" r="4"/>
    </g>
    <!-- Outer ring of 10 spots at radius 50 -->
    <g fill="#e55" opacity="0.7">
      <circle cx="130" cy="75" r="3"/>
      <circle cx="112" cy="121" r="3"/>
      <circle cx="66" cy="137" r="3"/>
      <circle cx="25" cy="109" r="3"/>
      <circle cx="18" cy="62" r="3"/>
      <circle cx="48" cy="22" r="3"/>
      <circle cx="93" cy="8" r="3"/>
      <circle cx="135" cy="35" r="3"/>
      <circle cx="140" cy="82" r="3"/>
      <circle cx="38" cy="128" r="3"/>
    </g>
    <text x="80" y="158" text-anchor="middle" fill="#c00" font-size="10">10-fold symmetric!</text>
    <text x="80" y="170" text-anchor="middle" fill="currentColor" font-size="9">aperiodic: no translation T</text>
  </g>
</svg>
</div>

---

## S10: Further Reading and Open Problems

### Open Problems in the Topics of This Course

The following major open problems connect directly to the material in this course:

**1. Sphere packing in dimensions 5–7, 9, etc.** Only in dimensions 1, 2, 3, 8, and 24 is the optimal sphere packing density known. In all other dimensions, there are gaps between upper bounds (from linear programming) and lower bounds (from explicit lattice packings). Dimensions 5, 6, and 7 are the next natural targets, but no exceptional lattices are known in these dimensions.

**2. Kissing numbers in dimensions 5–7.** The exact kissing number is unknown for \(n = 5, 6, 7, 9, 10, \ldots\). For \(n = 5\), the best known bounds are \(40 \leq \kappa_5 \leq 44\). Closing this gap seems to require fundamentally new methods.

**3. Are there infinitely many Fermat primes?** The known Fermat primes (3, 5, 17, 257, 65537) are the only values of \(2^{2^m} + 1\) known to be prime. No new Fermat prime has been found despite computer searches to enormous values of \(m\). If there are only finitely many Fermat primes, then only finitely many regular \(n\)-gons (for odd \(n\)) are constructible.

**4. The Erdős-Ko-Rado problem for spheres.** How many unit spheres can be packed in a ball of radius \(R\) in \(\mathbb{R}^n\)? This finite version of sphere packing has connections to coding theory and combinatorics.

**5. Quasicrystal mathematics.** The precise mathematical theory of quasicrystals — their diffraction spectra, their classification, the "cut-and-project" method — is still being developed. The connection to modular forms and automorphic forms (used by Viazovska) suggests deeper structure.

<div class="remark">
<strong>Remark (The unreasonable effectiveness of geometry).</strong> This course has traced a path from Euclid's five postulates — written 2300 years ago for practical land surveying and architectural purposes — to the proof that sphere packing in dimension 24 is optimal, using tools from analytic number theory and modular forms. The connection between these distant points is not accidental: it reflects the deep unity of mathematics. Geometric intuition, algebraic formalism, topological invariants, and analytic methods all illuminate different facets of the same underlying structures. The "unreasonable effectiveness of mathematics" (Wigner's phrase) is perhaps most vivid in geometry, where ancient intuitions about shape and symmetry turn out to encode profound truths about the structure of space itself.
</div>

---

## S11: Nets, Unfoldings, and Geometric Constructions

### S11.1 Nets of Polyhedra

A **net** of a polyhedron is a planar figure obtained by cutting along some edges and unfolding the surface flat. Not every assignment of cuts produces a valid net (the faces might overlap), and the same polyhedron can have many different nets.

<div class="example">
<strong>Example (Nets of the five Platonic solids).</strong>

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 520 300" width="520" height="300" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- Tetrahedron net: 4 triangles in a row/fan -->
  <g transform="translate(10,10)">
    <text x="55" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Tetrahedron net</text>
    <text x="55" y="12" text-anchor="middle" fill="currentColor" font-size="9">(1 of 2 nets)</text>
    <!-- Central triangle -->
    <polygon points="55,25 25,73 85,73" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <!-- Left flap -->
    <polygon points="25,73 55,25 10,73" fill="#e8f0ff" stroke="#2255cc" stroke-width="1.5"/>
    <!-- Right flap -->
    <polygon points="85,73 55,25 100,73" fill="#e8f0ff" stroke="#2255cc" stroke-width="1.5"/>
    <!-- Bottom flap -->
    <polygon points="25,73 85,73 55,121" fill="#c8d8ff" stroke="#2255cc" stroke-width="1.5"/>
    <text x="55" y="135" text-anchor="middle" fill="currentColor" font-size="9">4 triangles</text>
  </g>

  <!-- Cube net: cross shape -->
  <g transform="translate(135,10)">
    <text x="55" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Cube net</text>
    <text x="55" y="12" text-anchor="middle" fill="currentColor" font-size="9">(cross, 1 of 11)</text>
    <rect x="30" y="18" width="30" height="30" fill="#ffeedd" stroke="#e70" stroke-width="1.5"/>
    <rect x="0" y="48" width="30" height="30" fill="#ffeedd" stroke="#e70" stroke-width="1.5"/>
    <rect x="30" y="48" width="30" height="30" fill="#ffd0aa" stroke="#e70" stroke-width="1.5"/>
    <rect x="60" y="48" width="30" height="30" fill="#ffeedd" stroke="#e70" stroke-width="1.5"/>
    <rect x="90" y="48" width="30" height="30" fill="#ffeedd" stroke="#e70" stroke-width="1.5"/>
    <rect x="30" y="78" width="30" height="30" fill="#ffeedd" stroke="#e70" stroke-width="1.5"/>
    <text x="55" y="122" text-anchor="middle" fill="currentColor" font-size="9">6 squares (cross)</text>
    <text x="55" y="133" text-anchor="middle" fill="#e70" font-size="9">↑ top    ↓ bottom</text>
  </g>

  <!-- Octahedron net: zig-zag row of 8 triangles -->
  <g transform="translate(275,10)">
    <text x="80" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Octahedron net</text>
    <text x="80" y="12" text-anchor="middle" fill="currentColor" font-size="9">(zig-zag strip, 1 of 11)</text>
    <!-- Two rows of 4 alternating triangles -->
    <polygon points="10,50 30,18 50,50" fill="#e8ffe8" stroke="#2a7" stroke-width="1.5"/>
    <polygon points="30,18 50,50 70,18" fill="#c8ffc8" stroke="#2a7" stroke-width="1.5"/>
    <polygon points="50,50 70,18 90,50" fill="#e8ffe8" stroke="#2a7" stroke-width="1.5"/>
    <polygon points="70,18 90,50 110,18" fill="#c8ffc8" stroke="#2a7" stroke-width="1.5"/>
    <polygon points="90,50 110,18 130,50" fill="#e8ffe8" stroke="#2a7" stroke-width="1.5"/>
    <polygon points="110,18 130,50 150,18" fill="#c8ffc8" stroke="#2a7" stroke-width="1.5"/>
    <polygon points="130,50 150,18 170,50" fill="#e8ffe8" stroke="#2a7" stroke-width="1.5"/>
    <polygon points="150,18 170,50 190,18" fill="#c8ffc8" stroke="#2a7" stroke-width="1.5"/>
    <text x="100" y="68" text-anchor="middle" fill="currentColor" font-size="9">8 triangles in zig-zag</text>
  </g>

  <!-- Dodecahedron net hint (2 caps of pentagons) -->
  <g transform="translate(10,160)">
    <text x="80" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Dodecahedron net</text>
    <text x="80" y="12" text-anchor="middle" fill="currentColor" font-size="9">(1 of 43,380 nets)</text>
    <!-- Top cap pentagon -->
    <polygon points="80,25 105,42 96,70 64,70 55,42" fill="#ffe8ff" stroke="#a0a" stroke-width="1.5"/>
    <text x="80" y="52" text-anchor="middle" fill="#a0a" font-size="9">P</text>
    <!-- Middle ring: 5 pentagons around the cap -->
    <polygon points="55,42 30,55 25,85 50,100 80,90" fill="#eeddff" stroke="#a0a" stroke-width="1.2"/>
    <polygon points="105,42 130,55 135,85 110,100 80,90" fill="#eeddff" stroke="#a0a" stroke-width="1.2"/>
    <polygon points="80,90 50,100 45,130 80,140 115,130" fill="#ffe8ff" stroke="#a0a" stroke-width="1.5"/>
    <text x="80" y="122" text-anchor="middle" fill="#a0a" font-size="9">P</text>
    <text x="80" y="150" text-anchor="middle" fill="currentColor" font-size="9">12 pentagons total</text>
  </g>

  <!-- Icosahedron net: two rows of triangles -->
  <g transform="translate(200,165)">
    <text x="130" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Icosahedron net</text>
    <text x="130" y="12" text-anchor="middle" fill="currentColor" font-size="9">(1 of 43,380 nets)</text>
    <!-- Two rows of 10 triangles -->
    <!-- Row 1 (top): 10 triangles -->
    <g fill="#fff0e0" stroke="#c60" stroke-width="1.2">
      <polygon points="10,40 25,15 40,40"/>
      <polygon points="25,15 40,40 55,15"/>
      <polygon points="40,40 55,15 70,40"/>
      <polygon points="55,15 70,40 85,15"/>
      <polygon points="70,40 85,15 100,40"/>
      <polygon points="85,15 100,40 115,15"/>
      <polygon points="100,40 115,15 130,40"/>
      <polygon points="115,15 130,40 145,15"/>
      <polygon points="130,40 145,15 160,40"/>
      <polygon points="145,15 160,40 175,15"/>
    </g>
    <!-- Row 2 (bottom): 10 triangles -->
    <g fill="#ffe0c0" stroke="#c60" stroke-width="1.2">
      <polygon points="10,40 25,65 40,40"/>
      <polygon points="40,40 25,65 55,65"/>
      <polygon points="40,40 55,65 70,40"/>
      <polygon points="70,40 55,65 85,65"/>
      <polygon points="70,40 85,65 100,40"/>
      <polygon points="100,40 85,65 115,65"/>
      <polygon points="100,40 115,65 130,40"/>
      <polygon points="130,40 115,65 145,65"/>
      <polygon points="130,40 145,65 160,40"/>
      <polygon points="160,40 145,65 175,65"/>
    </g>
    <text x="93" y="82" text-anchor="middle" fill="currentColor" font-size="9">20 triangles in double row</text>
  </g>
</svg>
</div>

The number of distinct nets of the dodecahedron and icosahedron (both 43,380) is equal — a beautiful consequence of their duality! The dual polyhedron has the same combinatorial structure with faces and vertices swapped, so its nets are in bijection with those of the original.
</div>

An open problem is whether every convex polyhedron has at least one non-overlapping net. For Platonic and Archimedean solids, nets exist and have been catalogued. For general convex polyhedra, the question is still open (Shephard's conjecture, 1975).

### S11.2 The Rhombic Dodecahedron and Space-Filling

The **rhombic dodecahedron** (the dual of the cuboctahedron) has a special property: it tiles three-dimensional space without gaps. Its 12 rhombic faces have diagonals in ratio \(\sqrt{2}:1\), and the solid fills space in the same way that the cube fills space, but with a different shape.

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 400 220" width="400" height="220" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- LEFT: Side view of rhombic dodecahedron (diamond-like silhouette) -->
  <g transform="translate(30,15)">
    <text x="70" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Side view</text>
    <!-- Top vertex -->
    <circle cx="70" cy="20" r="4" fill="#2255cc"/>
    <!-- Upper-left and upper-right vertices -->
    <circle cx="30" cy="80" r="4" fill="currentColor"/>
    <circle cx="110" cy="80" r="4" fill="currentColor"/>
    <!-- Left and right mid vertices -->
    <circle cx="20" cy="120" r="4" fill="currentColor"/>
    <circle cx="120" cy="120" r="4" fill="currentColor"/>
    <!-- Lower-left and lower-right vertices -->
    <circle cx="30" cy="160" r="4" fill="currentColor"/>
    <circle cx="110" cy="160" r="4" fill="currentColor"/>
    <!-- Bottom vertex -->
    <circle cx="70" cy="200" r="4" fill="#2255cc"/>
    <!-- Top edges -->
    <line x1="70" y1="20" x2="30" y2="80" stroke="currentColor" stroke-width="1.5"/>
    <line x1="70" y1="20" x2="110" y2="80" stroke="currentColor" stroke-width="1.5"/>
    <!-- Middle rhombus -->
    <line x1="30" y1="80" x2="20" y2="120" stroke="currentColor" stroke-width="1.5"/>
    <line x1="110" y1="80" x2="120" y2="120" stroke="currentColor" stroke-width="1.5"/>
    <line x1="20" y1="120" x2="30" y2="160" stroke="currentColor" stroke-width="1.5"/>
    <line x1="120" y1="120" x2="110" y2="160" stroke="currentColor" stroke-width="1.5"/>
    <!-- Horizontal rhombus edges -->
    <line x1="30" y1="80" x2="110" y2="80" stroke="#777" stroke-width="1" stroke-dasharray="3,2"/>
    <line x1="20" y1="120" x2="120" y2="120" stroke="#777" stroke-width="1" stroke-dasharray="3,2"/>
    <line x1="30" y1="160" x2="110" y2="160" stroke="#777" stroke-width="1" stroke-dasharray="3,2"/>
    <!-- Bottom edges -->
    <line x1="30" y1="160" x2="70" y2="200" stroke="currentColor" stroke-width="1.5"/>
    <line x1="110" y1="160" x2="70" y2="200" stroke="currentColor" stroke-width="1.5"/>
    <text x="70" y="215" text-anchor="middle" fill="currentColor" font-size="10">12 rhombic faces</text>
  </g>

  <!-- Divider -->
  <line x1="195" y1="10" x2="195" y2="210" stroke="#666" stroke-width="1"/>

  <!-- RIGHT: Top view (hexagonal cross-section pattern) -->
  <g transform="translate(215,15)">
    <text x="85" y="0" text-anchor="middle" fill="currentColor" font-weight="bold">Top view (Voronoi cell of FCC)</text>
    <!-- Hexagonal arrangement showing top-view cross-section -->
    <!-- Central hexagon -->
    <polygon points="85,55 115,72 115,107 85,124 55,107 55,72"
      fill="#e8f0ff" stroke="#2255cc" stroke-width="2"/>
    <!-- Surrounding tiles (showing tessellation) -->
    <polygon points="85,55 115,72 145,55 145,20 115,3 85,20"
      fill="#fff8cc" stroke="#999" stroke-width="1" stroke-dasharray="3,2"/>
    <polygon points="115,72 145,55 175,72 175,107 145,124 115,107"
      fill="#fff8cc" stroke="#999" stroke-width="1" stroke-dasharray="3,2"/>
    <polygon points="85,124 115,107 115,142 85,159 55,142 55,107"
      fill="#fff8cc" stroke="#999" stroke-width="1" stroke-dasharray="3,2"/>
    <polygon points="55,72 85,55 85,20 55,3 25,20 25,55"
      fill="#fff8cc" stroke="#999" stroke-width="1" stroke-dasharray="3,2"/>
    <!-- Center dot -->
    <circle cx="85" cy="90" r="4" fill="#c00"/>
    <text x="91" y="93" fill="#c00" font-size="9">FCC point</text>
    <text x="85" y="178" text-anchor="middle" fill="currentColor" font-size="10">Copies tile ℝ³ without gaps</text>
    <text x="85" y="190" text-anchor="middle" fill="currentColor" font-size="9">Wigner-Seitz cell of FCC lattice</text>
  </g>
</svg>
</div>

The rhombic dodecahedron is the **Wigner-Seitz cell** (or Voronoi cell) of the FCC lattice. This means it plays a fundamental role in the physics of FCC metals: the "first Brillouin zone" (in reciprocal space) for an FCC crystal is the Wigner-Seitz cell of the BCC lattice, which is a truncated octahedron — another Archimedean solid.

### S11.3 The 24-Cell as a Self-Dual 4-Polytope

The 24-cell \(\{3,4,3\}\) is the unique regular 4-polytope with no 3D analogue. It is self-dual: its dual is another 24-cell. Its 24 vertices can be taken as:
\[
\pm e_1 \pm e_2, \quad \pm e_1 \pm e_3, \quad \pm e_1 \pm e_4, \quad \pm e_2 \pm e_3, \quad \pm e_2 \pm e_4, \quad \pm e_3 \pm e_4
\]
(the 24 vectors \(\pm e_i \pm e_j\) in \(\mathbb{R}^4\)), where \(e_1, e_2, e_3, e_4\) are the standard basis vectors. Each vertex is connected by edges to exactly 8 others (at distance \(\sqrt{2}\)), and each vertex is surrounded by 6 octahedral cells.

The 24-cell is related to the quaternion group: its vertices, when viewed as unit quaternions \(\pm 1, \pm i, \pm j, \pm k, (\pm 1 \pm i \pm j \pm k)/2\), form the **binary tetrahedral group** — a group of order 24. The 24-cell thus has an algebraic interpretation that the other regular 4-polytopes lack.

<div class="example">
<strong>Example (Cross-sections of the 24-cell).</strong> Slicing the 24-cell \(\{3,4,3\}\) with a 3D hyperplane:

- Near a vertex: a small octahedron.
- At the middle: a cuboctahedron (the Archimedean solid that is the transition between cube and octahedron).
- Near the "opposite" vertex: another small octahedron.

This sequence — octahedron, cuboctahedron, octahedron — is the 4D analog of slicing an octahedron (which gives triangles, hexagons, and triangles).

<div style="text-align:center; margin: 1em 0;">
<svg viewBox="0 0 440 240" width="440" height="240" xmlns="http://www.w3.org/2000/svg" font-family="serif" font-size="11">
  <!-- Vertical sweep arrow on left -->
  <defs>
    <marker id="swArr" markerWidth="8" markerHeight="8" refX="4" refY="4" orient="auto">
      <path d="M0,0 L8,4 L0,8 Z" fill="currentColor"/>
    </marker>
  </defs>
  <line x1="20" y1="20" x2="20" y2="210" stroke="#999" stroke-width="1.5" marker-end="url(#swArr)"/>
  <text x="12" y="120" fill="currentColor" font-size="10" transform="rotate(-90,12,120)">sweep direction</text>

  <!-- Layer 1: single vertex (top) -->
  <g transform="translate(50,15)">
    <text x="0" y="12" fill="currentColor" font-size="10" font-weight="bold">Layer 1</text>
    <text x="90" y="12" fill="currentColor" font-size="10">single vertex</text>
    <circle cx="45" cy="8" r="5" fill="#2255cc"/>
  </g>

  <!-- Layer 2: small triangular cross-section -->
  <g transform="translate(50,55)">
    <text x="0" y="12" fill="currentColor" font-size="10" font-weight="bold">Layer 2</text>
    <text x="90" y="12" fill="currentColor" font-size="10">triangular cross-section (3 vertices)</text>
    <!-- Small triangle -->
    <polygon points="45,20 30,42 60,42" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="45" cy="20" r="3" fill="currentColor"/>
    <circle cx="30" cy="42" r="3" fill="currentColor"/>
    <circle cx="60" cy="42" r="3" fill="currentColor"/>
  </g>

  <!-- Layer 3: cuboctahedron (middle, largest cross-section) -->
  <g transform="translate(50,115)">
    <text x="0" y="12" fill="currentColor" font-size="10" font-weight="bold">Layer 3</text>
    <text x="90" y="12" fill="currentColor" font-size="10">cuboctahedron (12V, 24E, 8△+6□)</text>
    <!-- Cuboctahedron schematic: square + triangles alternating -->
    <!-- Square face in center -->
    <rect x="28" y="22" width="34" height="34" fill="#fff0cc" stroke="#e70" stroke-width="1.5"/>
    <!-- 4 triangles on alternating edges -->
    <polygon points="28,22 45,8 62,22" fill="#ffe8e8" stroke="#c00" stroke-width="1.2"/>
    <polygon points="62,22 76,39 62,56" fill="#ffe8e8" stroke="#c00" stroke-width="1.2"/>
    <polygon points="28,56 45,70 62,56" fill="#ffe8e8" stroke="#c00" stroke-width="1.2"/>
    <polygon points="28,22 14,39 28,56" fill="#ffe8e8" stroke="#c00" stroke-width="1.2"/>
    <text x="45" y="42" text-anchor="middle" fill="#e70" font-size="9">■</text>
  </g>

  <!-- Layer 4: mirror of Layer 2 -->
  <g transform="translate(50,200)">
    <text x="0" y="12" fill="currentColor" font-size="10" font-weight="bold">Layer 4</text>
    <text x="90" y="12" fill="currentColor" font-size="10">mirror of Layer 2</text>
    <polygon points="45,20 30,42 60,42" fill="#dde6ff" stroke="#2255cc" stroke-width="1.5"/>
    <circle cx="45" cy="20" r="3" fill="currentColor"/>
    <circle cx="30" cy="42" r="3" fill="currentColor"/>
    <circle cx="60" cy="42" r="3" fill="currentColor"/>
  </g>

  <!-- Layer 5: single antipodal vertex (bottom) — placed below layer 4 label -->
  <g transform="translate(50,248)">
    <text x="0" y="12" fill="currentColor" font-size="10" font-weight="bold">Layer 5</text>
    <text x="90" y="12" fill="currentColor" font-size="10">antipodal vertex</text>
    <circle cx="45" cy="8" r="5" fill="#2255cc"/>
  </g>
</svg>
</div>
</div>

---

## S12: Geometric Inequalities

Geometry is not only about equalities (like Euler's formula) but also about **geometric inequalities** — bounds on areas, volumes, and other quantities. Some of the most beautiful results in this category connect geometry to symmetry.

### S12.1 The Isoperimetric Inequality

<div class="theorem">
<strong>Isoperimetric Inequality.</strong> Among all closed planar curves of fixed perimeter \(L\), the circle encloses the maximum area. Equivalently, for any region \(\Omega\) in the plane with area \(A\) and boundary length \(L\):
\[
4\pi A \leq L^2,
\]
with equality if and only if \(\Omega\) is a disk.
</div>

The isoperimetric inequality has many proofs: via the calculus of variations, via Fourier series (classical approach using Green's theorem and Parseval's identity), via Brunn-Minkowski theory, and via the symmetrization (Steiner symmetrization) method. In three dimensions, the corresponding result states that among all closed surfaces of fixed area \(A\), the sphere encloses the maximum volume \(V\):
\[
36\pi V^2 \leq A^3,
\]
with equality for the sphere.

<div class="example">
<strong>Example (Isoperimetric inequality for polygons).</strong> Among all \(n\)-gons with fixed perimeter, the regular \(n\)-gon has the maximum area. As \(n \to \infty\), the regular \(n\)-gon approaches a circle, and the maximum area approaches that of the circle — illustrating how the circle is the limiting optimal shape.

For specific cases:
- Triangle: equilateral triangle maximizes area for fixed perimeter. For perimeter \(L\): area \(= L^2/(12\sqrt{3})\).
- Quadrilateral: square maximizes area for fixed perimeter. For perimeter \(L\): area \(= L^2/16\).
- Circle: area \(= L^2/(4\pi)\).

Since \(1/(4\pi) > 1/16 > 1/(12\sqrt{3})\)... wait, let me recalculate: \(1/(4\pi) \approx 0.0796\), \(1/16 = 0.0625\), \(1/(12\sqrt{3}) \approx 0.0481\). So circle \(>\) square \(>\) equilateral triangle, as expected. ✓
</div>

### S12.2 The Brunn-Minkowski Inequality

A powerful generalization relates volumes of sets and their "Minkowski sums":

<div class="theorem">
<strong>Brunn-Minkowski Inequality.</strong> For convex bodies \(K, L \subset \mathbb{R}^n\),
\[
\text{Vol}(K + L)^{1/n} \geq \text{Vol}(K)^{1/n} + \text{Vol}(L)^{1/n},
\]
where \(K + L = \{x + y : x \in K, y \in L\}\) is the Minkowski sum.
</div>

The Brunn-Minkowski inequality is one of the deepest results in convex geometry. It implies the isoperimetric inequality (take \(L = \epsilon B\) where \(B\) is the unit ball and let \(\epsilon \to 0\)). It also implies the AM-GM inequality (as a special case with \(n = 1\)).

The connection to sphere packing is through the **Rogers bound**: any sphere packing in \(\mathbb{R}^n\) has density at most \(n \cdot 2^{-n/2+1}\) (roughly), a bound derived using covering arguments related to Brunn-Minkowski.

### S12.3 The Cauchy-Schwarz Inequality and Geometry

The Cauchy-Schwarz inequality \(|\langle u, v\rangle| \leq \|u\|\|v\|\) has a beautiful geometric interpretation: the cosine of the angle between vectors \(u\) and \(v\) in \(\mathbb{R}^n\) satisfies \(|\cos\theta| \leq 1\). This is both the definition of angle in higher dimensions and the constraint that makes geometric angle measure consistent.

For conic sections: the angle between two intersecting conics at a point can be computed using the gradient vectors of their defining equations, via Cauchy-Schwarz — this is essentially what the "angle of intersection" means analytically.

---

## Summary of Key Formulas and Results

For convenient reference, here are the most important formulas from the course:

**Constructibility (Chapter 1):**
\[
\alpha \text{ constructible} \iff [\mathbb{Q}(\alpha):\mathbb{Q}] = 2^k \text{ for some } k \geq 0.
\]

**Conic sections (Chapter 2):**
\[
r = \frac{ed}{1 + e\cos\theta} \quad\text{(polar form of conic, focus at origin)}.
\]
\[
\frac{x^2}{a^2} + \frac{y^2}{b^2} = 1, \quad b^2 = a^2 - c^2, \quad e = c/a \quad\text{(ellipse, standard form)}.
\]

**Interior angle formula (Chapter 3):**
\[
\alpha_n = \frac{(n-2) \cdot 180°}{n} \quad\text{(interior angle of regular }n\text{-gon)}.
\]

**Platonic solid count (Chapter 3):**
\[
\frac{1}{p} + \frac{1}{q} > \frac{1}{2} \quad \iff \quad \{p,q\} \text{ is a Platonic solid (with } p,q \geq 3\text{)}.
\]

**Euler's formula (Chapter 4):**
\[
V - E + F = 2 \quad\text{(convex polyhedron)}, \qquad V - E + F = \chi \quad\text{(general surface)}.
\]

**Edge count of Platonic solid (Chapter 4):**
\[
E = \frac{2pq}{2p + 2q - pq} \quad\text{for Schläfli symbol }\{p,q\}.
\]

**Crystallographic restriction (Chapter 5):**
\[
2\cos\theta \in \mathbb{Z} \implies \theta \in \{0°, 60°, 90°, 120°, 180°\} \quad\text{(only allowed rotation angles in a lattice)}.
\]

**Tessellation condition (Chapter 5):**
\[
\frac{1}{p} + \frac{1}{q} = \frac{1}{2} \quad\text{(regular tessellation of the plane by }\{p\}\text{, }q\text{ per vertex)}.
\]

**Packing densities (Chapter 6):**
\[
\Delta_2 = \frac{\pi}{2\sqrt{3}} \approx 0.9069, \quad \Delta_3 = \frac{\pi}{3\sqrt{2}} \approx 0.7405, \quad \Delta_8 = \frac{\pi^4}{384} \approx 0.2537, \quad \Delta_{24} = \frac{\pi^{12}}{12!}.
\]

**Kissing numbers (Chapter 6):**
\[
\kappa_1 = 2, \quad \kappa_2 = 6, \quad \kappa_3 = 12, \quad \kappa_4 = 24, \quad \kappa_8 = 240, \quad \kappa_{24} = 196560.
\]

**Gauss-Bonnet formulas (Supplementary):**
\[
\text{Area of spherical triangle} = R^2(\alpha + \beta + \gamma - \pi), \quad\text{Area of hyperbolic triangle} = \pi - \alpha - \beta - \gamma.
\]

**Isoperimetric inequality (Supplementary):**
\[
4\pi A \leq L^2 \quad\text{(plane)}, \qquad 36\pi V^2 \leq A^3 \quad\text{(space)}.
\]

