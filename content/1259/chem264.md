---
title: "CHEM 264: Organic Chemistry 1"
subjects: "CHEM"
prof: "Steve Forsey"
---

## Sources and References
**Primary textbook** — *Organic Chemistry I & II: A Live Interactive Textbook* (Top Hat platform, 2025 edition).
**Supplementary texts** — Clayden, J., Greeves, N. & Warren, S. *Organic Chemistry*, 2nd ed. Oxford University Press, 2012. | McMurry, J. *Organic Chemistry*, 10th ed. Cengage, 2019.
**Online resources** — SDBS Spectral Database (sdbs.db.aist.go.jp); PubChem (pubchem.ncbi.nlm.nih.gov); ChemDraw JS (cloud drawing tool)

---

# Chapter 1: Nomenclature of Organic Compounds

## Section 1.1: The Logic of Systematic Naming

Organic chemistry encompasses millions of distinct compounds, and the ability to communicate unambiguously about any one of them requires a systematic, universally accepted naming convention. The **IUPAC nomenclature** (from the International Union of Pure and Applied Chemistry) provides precisely this system — a set of rules that encodes the complete structural information of a molecule into a unique name, and conversely allows any correct IUPAC name to be decoded into an unambiguous structural formula.

The IUPAC approach to naming saturated hydrocarbons begins with identifying the **longest continuous carbon chain** (the parent chain), which is then named according to the Greek prefixes for the chain length: methane (1C), ethane (2C), propane (3C), butane (4C), pentane (5C), hexane (6C), heptane (7C), octane (8C), nonane (9C), and decane (10C). Any branches hanging off the parent chain are named as **substituents** or **alkyl groups** by replacing the suffix -ane with -yl: a one-carbon branch is a methyl group (–CH\(_3\)), a two-carbon branch is an ethyl group (–CH\(_2\)CH\(_3\)), and so on.

Once the parent chain is identified, the carbons are numbered from the end that gives the substituents the **lowest possible locants** (position numbers). The substituent positions and names are cited as prefixes in alphabetical order (ignoring multiplying prefixes like di-, tri-) before the parent chain name. For branched substituents, the prefix iso- or the full IUPAC name of the substituent is used. When identical substituents appear multiple times, the multiplying prefixes di-, tri-, tetra- are used with repeated locants.

## Section 1.2: Functional Group Families

Organic chemistry is organized around **functional groups** — characteristic arrangements of atoms that confer predictable reactivity. The identity of the functional group determines how a molecule behaves chemically far more than the size or shape of the carbon skeleton to which it is attached. A student who understands the reactivity of an aldehyde functional group can predict the reactions of ethanal, butanal, and benzaldehyde without memorizing each individually.

The most important functional group families in first-year organic chemistry include **alkanes** (C–C and C–H bonds only, the baseline of chemical inertness), **alkenes** (one or more C=C double bonds, sites of electrophilic addition), **alkynes** (C≡C triple bonds), **aromatic compounds** (delocalized \( \pi \) systems following Hückel's rule), **alcohols** (–OH), **ethers** (C–O–C), **aldehydes** (–CHO), **ketones** (C=O flanked by carbon), **carboxylic acids** (–COOH), **esters** (–COOR), **amines** (–NH\(_2\), –NHR, –NR\(_2\)), and **alkyl halides** (C–X, where X = F, Cl, Br, I).

IUPAC nomenclature for each family follows the same logical structure but uses characteristic suffixes: -ol for alcohols, -al for aldehydes, -one for ketones, -oic acid for carboxylic acids, -oate for esters, -amine for amines. These suffixes replace the terminal -e of the parent alkane name (so butanol, butanal, butanone, butanoic acid, butanoate, butanamine arise from butane).

---

# Chapter 2: Atomic Structure, Bonding, and Molecular Properties

## Section 2.1: Atomic Orbitals and Electron Configuration

The electronic structure of carbon determines the entire landscape of organic chemistry. Carbon's ground-state configuration is \( 1s^2\,2s^2\,2p^2 \), with the four valence electrons available for bonding. The four atomic orbitals of the valence shell — one \( 2s \) and three \( 2p \) orbitals — combine through **hybridization** to produce directional bonding orbitals whose geometry dictates the three-dimensional shape of organic molecules.

In **sp³ hybridization**, the \( 2s \) orbital mixes with all three \( 2p \) orbitals to form four equivalent \( sp^3 \) hybrid orbitals pointing toward the corners of a regular tetrahedron, separated by angles of 109.5°. This geometry characterizes all saturated carbon centres (alkanes, alkyl groups). Each \( sp^3 \) orbital participates in a **sigma (\( \sigma \)) bond** by end-to-end overlap with an orbital from the adjacent atom. Sigma bonds allow free rotation about the bond axis because the electron density is cylindrically symmetric.

In **sp² hybridization**, the \( 2s \) and two \( 2p \) orbitals combine to form three equivalent \( sp^2 \) hybrid orbitals arranged trigonally in a plane (120° angles), leaving one unhybridized \( 2p \) orbital perpendicular to the plane. The \( sp^2 \) orbitals form the sigma framework of the molecule, while the remaining \( p \) orbitals on adjacent \( sp^2 \) carbons overlap sideways to form a **pi (\( \pi \)) bond**. The C=C double bond thus consists of one \( \sigma \) and one \( \pi \) bond; rotation about the double bond is restricted because it would require breaking the \( \pi \) bond, a requirement that gives rise to E/Z isomerism.

**sp hybridization** combines the \( 2s \) with one \( 2p \) orbital to give two \( sp \) hybrid orbitals oriented linearly (180°), with two unhybridized \( p \) orbitals perpendicular to the bond axis. Two \( \pi \) bonds form alongside the \( \sigma \) bond, giving the C≡C triple bond of alkynes.

## Section 2.2: Formal Charge and Resonance

### Subsection 2.2.1: Formal Charge

The **formal charge** on an atom in a Lewis structure is the charge that atom would carry if all bonding electrons were shared equally between the bonded atoms:

\[ \text{Formal charge} = (\text{valence electrons}) - (\text{lone pair electrons}) - \frac{1}{2}(\text{bonding electrons}). \]

Formal charges are bookkeeping devices; they do not represent actual charge distributions (which are described better by partial charges from electronegativity differences). A valid Lewis structure has formal charges as close to zero as possible, and where non-zero charges exist, negative formal charge should reside on the more electronegative atom.

### Subsection 2.2.2: Resonance Structures

Many molecules and ions cannot be adequately described by a single Lewis structure. **Resonance** is the representation of the actual electronic structure as a weighted average (superposition) of two or more Lewis structures, called **resonance contributors** or resonance forms. The contributors are connected by double-headed arrows (\( \leftrightarrow \)), and the actual structure — the **resonance hybrid** — is distinct from any individual contributor.

<div class="definition">
<strong>Resonance contributors</strong> are valid Lewis structures for the same molecular connectivity that differ only in the placement of electrons (lone pairs and \( \pi \) bonds), never in the arrangement of atoms. The hybrid structure represents the true electron distribution and is lower in energy than any individual contributor, a stabilization known as <strong>delocalization energy</strong> or resonance stabilization.
</div>

**Rules for drawing resonance contributors:** (1) the molecular skeleton (atom connectivity) never changes; (2) only electrons move — lone pairs or \( \pi \) electrons shift; (3) all contributors must have the same number of paired and unpaired electrons; (4) the more stable contributor is the one with more complete octets, more bonds, and formal charges on the more electronegative atoms. The **major contributor** (lowest-energy resonance form) dominates the true structure of the hybrid.

The carboxylate anion (–COO\(^-\)) is a canonical example: the two oxygen atoms are equivalent in the resonance hybrid because the negative charge is delocalized equally between them. This symmetry explains why carboxylate anions are much more stable (higher \( pK_a \)) than simple alkoxide anions, where the charge cannot be delocalized.

---

# Chapter 3: Acids and Bases in Organic Chemistry

## Section 3.1: Brønsted–Lowry Acidity and Basicity

Acid–base chemistry is foundational to understanding organic reactivity. In the **Brønsted–Lowry** framework, an **acid** is a proton donor and a **base** is a proton acceptor. The equilibrium for an acid HA dissociating in water is

\[ \mathrm{HA} + \mathrm{H_2O} \rightleftharpoons \mathrm{A}^- + \mathrm{H_3O}^+, \]

and the **acid dissociation constant** is \( K_a = \frac{[\mathrm{A}^-][\mathrm{H_3O}^+]}{[\mathrm{HA}]} \). The **\( pK_a \)** is defined as \( pK_a = -\log_{10} K_a \); a lower \( pK_a \) corresponds to a stronger acid. The relationship between a conjugate acid–base pair \( pK_a + pK_b = pK_w = 14 \) (at 25°C) connects the strength of an acid to the strength of its conjugate base.

## Section 3.2: Factors Governing Acidity

Four interacting factors govern how readily a molecule donates a proton: the **identity of the atom** bearing the acidic hydrogen, **inductive effects**, **resonance stabilization of the conjugate base**, and **hybridization** of the atom bearing the proton.

**Electronegativity and atomic size** govern the acidity trend across the periodic table. Along a period (left to right), increasing electronegativity makes the O–H bond more polar and the conjugate base more stable (water is more acidic than ammonia, which is more acidic than methane). Down a group, increasing atomic radius dominates: the bond becomes longer and weaker, making donation of H\(^+\) easier even though electronegativity decreases (HI is more acidic than HCl, despite iodine being less electronegative than chlorine).

**Inductive effects** arise from the through-bond transmission of electron density by electronegative substituents. Introducing an electronegative group such as –F or –Cl near the acidic site stabilizes the negative charge on the conjugate base by withdrawing electron density, thereby strengthening the acid. Trifluoroacetic acid (CF\(_3\)COOH, \( pK_a \approx 0.5 \)) is far more acidic than acetic acid (CH\(_3\)COOH, \( pK_a \approx 4.75 \)) because three fluorine atoms inductively stabilize the carboxylate anion.

**Resonance stabilization** of the conjugate base is often the dominant factor. A carboxylic acid (\( pK_a \sim 5 \)) is enormously more acidic than an alcohol (\( pK_a \sim 16 \)) because the carboxylate anion delocalizes the negative charge over two electronegative oxygen atoms, while the alkoxide bears the charge on a single oxygen. The greater the delocalization of negative charge in the conjugate base, the more stable it is and the stronger the parent acid.

**Hybridization** affects acidity because \( s \)-character correlates with electronegativity of the carbon. An \( sp \)-hybridized carbon (50% \( s \)-character, as in an alkyne C–H) holds its electron density closer to the nucleus and more effectively stabilizes an adjacent negative charge than an \( sp^2 \) carbon (33% \( s \)-character) or \( sp^3 \) carbon (25% \( s \)-character). Accordingly, the terminal alkyne C–H (\( pK_a \approx 25 \)) is far more acidic than an alkene C–H (\( pK_a \approx 44 \)) or an alkane C–H (\( pK_a \approx 50 \)).

---

# Chapter 4: Stereochemistry

## Section 4.1: Molecular Three-Dimensionality and Constitutional Isomers

Molecules exist in three dimensions, and the spatial arrangement of atoms profoundly affects physical properties, biological activity, and chemical reactivity. **Constitutional isomers** (also called structural isomers) share the same molecular formula but differ in the connectivity of their atoms — for example, butane (CH\(_3\)CH\(_2\)CH\(_2\)CH\(_3\)) and isobutane (2-methylpropane) are constitutional isomers of C\(_4\)H\(_{10}\). Constitutional isomers are distinct compounds with different names, different physical properties, and generally different chemical behaviors.

## Section 4.2: Conformational Analysis

**Conformations** are the different spatial arrangements of a molecule that can be interconverted by rotation about single bonds without breaking any bonds. Because the rotation requires only modest thermal energy (a few kJ mol\(^{-1}\)), conformers rapidly interconvert at room temperature and are not isolable as separate compounds. The **Newman projection** provides a clear way to visualize conformations of a bond by looking directly along the C–C axis, with the front carbon shown as a point and the back carbon as a circle.

For ethane, rotation about the C–C bond sweeps from the **staggered** conformation (where H–C–C–H dihedral angles are 60°) to the **eclipsed** conformation (dihedral angles 0°). The staggered conformation is lower in energy by approximately 12 kJ mol\(^{-1}\) due to **torsional strain** (destabilization in the eclipsed form arises from the repulsion between the electron clouds of the aligned C–H bonds).

For butane, the situation is more complex because the two methyl groups interact sterically. The four key conformations, as the \( \mathrm{C_2}\)–\( \mathrm{C_3} \) bond rotates, are the **anti** (dihedral 180°, most stable), **gauche** (dihedral 60°, gauche strain from methyl–methyl steric interaction ~3.8 kJ mol\(^{-1}\)), **eclipsed** (dihedral 120°, moderate strain), and **fully eclipsed** (dihedral 0°, most strained, ~19 kJ mol\(^{-1}\) above anti).

**Cyclohexane** can adopt the **chair conformation**, which is free of all angle strain (all C–C–C angles = 109.5°), torsional strain (all adjacent bonds staggered), and virtually free of steric strain. The chair has two types of positions: **axial** (bonds alternating up and down, parallel to the ring axis) and **equatorial** (bonds projecting outward roughly in the plane of the ring). **Ring flip** interconverts two chair conformations, converting axial substituents to equatorial and vice versa. A large substituent strongly prefers the equatorial position to minimize 1,3-diaxial interactions, and the population ratio at equilibrium is governed by the Boltzmann distribution \( K = e^{-\Delta G^\circ/RT} \).

## Section 4.3: Stereoisomers and Chirality

**Stereoisomers** share the same connectivity but differ in the spatial arrangement of their atoms. They cannot be interconverted by bond rotation, only by bond breaking. The two main classes are **enantiomers** (non-superimposable mirror images) and **diastereomers** (stereoisomers that are not mirror images of each other).

<div class="definition">
A molecule is <strong>chiral</strong> (from the Greek for "hand") if it is non-superimposable on its mirror image. The most common source of chirality is a <strong>stereogenic centre</strong> (historically called a chiral centre or asymmetric carbon) — a carbon atom bearing four different substituents. A chiral molecule that has been separated from its mirror image is called an <strong>enantiomer</strong>.
</div>

The absolute configuration of a stereogenic centre is assigned using the **Cahn–Ingold–Prelog (CIP) priority rules**: the four substituents are ranked by atomic number (highest priority = 1, lowest = 4). With the lowest-priority group pointing away from the viewer, if the sequence 1 → 2 → 3 traces a clockwise arc, the configuration is **R** (*rectus*, Latin for right); if counterclockwise, it is **S** (*sinister*, left).

**Enantiomers** are identical in all physical properties except the direction in which they rotate plane-polarized light. If enantiomer A rotates light clockwise by an angle \( \alpha \), enantiomer B rotates it counterclockwise by \( -\alpha \). A **racemic mixture** (50:50 mixture of enantiomers) is optically inactive. The **specific rotation** \( [\alpha]_D \) is a characteristic physical property of an enantiopure compound: \( [\alpha]_D = \alpha / (c \cdot l) \), where \( c \) is concentration in g mL\(^{-1}\) and \( l \) is path length in dm.

**Diastereomers** differ in configuration at one or more (but not all) stereogenic centres and have different physical properties (different melting points, boiling points, solubilities), making them separable by conventional techniques. **Meso compounds** are internally compensated: they contain stereogenic centres but are achiral because an internal mirror plane renders the molecule superimposable on its mirror image.

---

# Chapter 5: Reactivity and Reaction Mechanisms

## Section 5.1: The Curved Arrow Formalism

Understanding reaction mechanisms is at the heart of organic chemistry — it allows prediction of the products of reactions that have never been performed, without memorizing lists of disconnected facts. The **curved arrow** (or "electron-pushing") formalism tracks the movement of electron pairs during a reaction: each arrow represents the flow of two electrons, from a region of high electron density (a lone pair or a bond) to a region of lower electron density (an electrophilic site or an empty orbital).

<div class="definition">
An <strong>electrophile</strong> is an electron-deficient species that accepts an electron pair — a Lewis acid. A <strong>nucleophile</strong> is an electron-rich species that donates an electron pair — a Lewis base. Most organic reactions involve the interaction of a nucleophilic site with an electrophilic site, with the curved arrows tracking the electron flow.
</div>

The **thermodynamics** of a reaction (whether the products are more or less stable than the reactants) tells us whether a reaction is favorable at equilibrium. The **kinetics** of a reaction (the height of the energy barrier) tells us how fast the reaction occurs. These two aspects are often independent: a thermodynamically favorable reaction may be kinetically slow if the transition state is high in energy.

---

# Chapter 6: Substitution Reactions

## Section 6.1: The SN2 Mechanism

The **bimolecular nucleophilic substitution** (S\(_N\)2) reaction is a one-step concerted process in which a nucleophile attacks the back face of the carbon bearing the leaving group, simultaneously displacing the leaving group. The energy profile shows a single, smooth energy barrier with a transition state in which the central carbon is pentacoordinate, with the incoming nucleophile and departing leaving group both partially bonded:

\[ \mathrm{Nu}^- + \mathrm{R{-}LG} \rightarrow \left[\mathrm{Nu}{\cdots}\mathrm{C}{\cdots}\mathrm{LG}\right]^{\ddagger} \rightarrow \mathrm{Nu{-}R} + \mathrm{LG}^-. \]

The rate law is second-order overall: \( \text{rate} = k[\text{substrate}][\text{Nu}^-] \), reflecting the bimolecular nature of the transition state. The **stereochemical outcome** of S\(_N\)2 at a stereogenic centre is complete **inversion of configuration** (Walden inversion), because the nucleophile must approach from the back while the leaving group departs from the front, inverting all three remaining substituents like an umbrella in a storm. S\(_N\)2 reactions are strongly disfavored by **steric hindrance** at the electrophilic carbon: the reaction proceeds readily at methyl and primary carbons, more slowly at secondary, and essentially not at all at tertiary or highly hindered positions.

Good **leaving groups** are those whose conjugate acids are strong: halides (Cl\(^-\), Br\(^-\), I\(^-\)), tosylate (TsO\(^-\)), and mesylate (MsO\(^-\)) are excellent leaving groups; hydroxide (HO\(^-\)) and alkoxide (RO\(^-\)) are poor leaving groups because their conjugate acids (water and alcohols) are too acidic to make good leaving groups by direct displacement.

## Section 6.2: The SN1 Mechanism

The **unimolecular nucleophilic substitution** (S\(_N\)1) reaction proceeds in two distinct steps: (1) ionization of the substrate to form a **carbocation** intermediate and the expelled leaving group, followed by (2) capture of the carbocation by the nucleophile. Because the first step — ionization — is slow and rate-determining, the rate law depends only on the substrate concentration: \( \text{rate} = k[\text{substrate}] \). The rate is independent of the nucleophile concentration.

**Carbocation stability** is the central determinant of S\(_N\)1 reactivity. The order of carbocation stability is tertiary > secondary > primary > methyl, owing to **hyperconjugation** (delocalization of \( \sigma \) C–H bonding electrons into the empty \( p \) orbital) and **inductive stabilization** (the electron density of the adjacent alkyl groups). Carbocations are also stabilized by adjacent lone pairs (as in \( \alpha \)-haloethers and \( \alpha \)-amino carbons) or by adjacent \( \pi \) systems (allylic and benzylic carbocations, which are resonance-stabilized).

The **stereochemical outcome** of S\(_N\)1 is typically partial or complete **racemization** at the stereogenic centre, because the planar (or near-planar) carbocation intermediate is achiral and can be attacked from either face. In practice, partial inversion is often observed because the leaving group partially blocks one face of the planar intermediate before it fully escapes.

---

# Chapter 7: Elimination Reactions

## Section 7.1: E2 Elimination

**Bimolecular elimination** (E2) is a one-step concerted reaction in which a base abstracts a proton from a carbon adjacent (beta) to the leaving group, while the leaving group simultaneously departs, forming a \( \pi \) bond. The mechanism is concerted and the rate is second-order: \( \text{rate} = k[\text{substrate}][\text{base}] \). The crucial **stereoelectronic requirement** for E2 is that the H and the leaving group must be **anti-periplanar** (dihedral angle 180°), meaning they must be on opposite sides of the C–C bond and able to achieve the all-eclipsed transition state in which the breaking \( \sigma \) bonds are aligned with the forming \( \pi \) bond.

In cyclohexane systems, the anti-periplanar requirement mandates that both the leaving group and the abstracted proton occupy **axial** positions, since only axial–axial dihedral angles satisfy the 180° requirement. This provides a powerful tool for predicting which elimination products form and which substrates cannot undergo E2 at all.

**Zaitsev's rule** predicts the major elimination product: the more substituted (more stable) alkene predominates when the conditions allow. However, when a bulky base is used (such as potassium tert-butoxide, KO\(^t\)Bu), steric effects favor abstraction of the less hindered hydrogen, giving the less substituted (Hofmann) product preferentially.

## Section 7.2: E1 Elimination

**Unimolecular elimination** (E1) shares its first step with S\(_N\)1: formation of a carbocation by ionization. In the second step, a base (which can be solvent) abstracts a proton from a beta carbon adjacent to the carbocation, forming the double bond. The rate-determining step is ionization, so the rate depends only on the substrate: \( \text{rate} = k[\text{substrate}] \). E1 and S\(_N\)1 are competing pathways from the same carbocation intermediate; higher temperature and weaker nucleophiles/bases favor elimination over substitution.

---

# Chapter 8: Alkenes, Alkynes, and Addition Reactions

## Section 8.1: Structure and Stability of Alkenes

Alkenes contain at least one C=C double bond, comprising a \( \sigma \) bond (from \( sp^2 \)–\( sp^2 \) overlap) and a \( \pi \) bond (from lateral \( 2p \)–\( 2p \) overlap). The restricted rotation about the double bond gives rise to **geometric (E/Z) isomerism**: in E (*entgegen*, "opposite") alkenes, the higher-priority substituents on each carbon are on opposite sides; in Z (*zusammen*, "together"), they are on the same side. Priorities are assigned by the same CIP rules used for chirality.

The **thermodynamic stability** of alkenes increases with increasing substitution: more alkyl substituents donate electron density into the \( \pi \) system through hyperconjugation, lowering the energy. The stability order is tetra- > tri- > di- > mono-substituted alkene. This is reflected in the heats of hydrogenation (more stable alkenes release less heat on hydrogenation to give the same alkane).

## Section 8.2: Electrophilic Addition to Alkenes

The electron-rich \( \pi \) bond of an alkene is an excellent nucleophile toward electrophiles. The general pattern is **electrophilic addition**: the electrophile (E\(^+\)) attacks the \( \pi \) electrons to form a carbocation intermediate (for proton-initiated additions) or a cyclic onium ion (for halogen additions), followed by capture by a nucleophile (Nu\(^-\)) to complete the addition.

**Addition of HX** (hydrogen halides) follows **Markovnikov's rule**: the proton (the electrophile) adds to the carbon that already bears more hydrogens, producing the more stable (more substituted) carbocation intermediate, which is then captured by X\(^-\). The mechanistic justification for Markovnikov's rule is therefore carbocation stability, not a memorized empirical rule.

**Addition of Br\(_2\) (or Cl\(_2\))** proceeds through a **bromonium ion** intermediate — a cyclic three-membered ring with a positively charged bromine bridging the two carbons. The bromonium ion is then opened by bromide acting as a nucleophile from the **anti** face (back-side attack at one of the two carbons). This anti addition gives a characteristic **trans (anti)** stereochemical outcome: if both carbons of the double bond are prochiral, the product is the anti-addition stereoisomer, specifically a racemic mixture of the two enantiomers where the two bromines are anti to each other.

---

# Chapter 9: Alcohols and Ethers

## Section 9.1: Properties and Reactivity of Alcohols

**Alcohols** (general formula R–OH) are among the most versatile functional groups in organic chemistry: they can act as acids (donating the O–H proton), as bases (accepting a proton on oxygen), as nucleophiles (using the lone pairs on oxygen), and as leaving group precursors (once the OH has been converted to a better leaving group). The O–H bond is strongly polarized toward oxygen, and the lone pairs on oxygen make alcohols excellent hydrogen-bond donors and acceptors, giving them high boiling points relative to alkanes of similar molecular weight.

The **acidity** of alcohols (\( pK_a \sim 16 \)) lies between water (\( pK_a = 15.7 \)) and simple alkanes (\( pK_a \sim 50 \)). Electron-withdrawing groups near the oxygen lower the \( pK_a \) (increase acidity) by inductively stabilizing the alkoxide anion. Alkoxides (RO\(^-\)), generated by reacting alcohols with strong bases or alkali metals, are excellent nucleophiles and moderately strong bases.

Alcohols can be converted to alkyl halides (via reaction with SOCl\(_2\), PBr\(_3\), or HX), to tosylates or mesylates (excellent leaving groups, by reaction with TsCl or MsCl in pyridine), to ethers (Williamson ether synthesis: reaction of an alkoxide with a primary alkyl halide via S\(_N\)2), and to carbonyl compounds (by oxidation). Primary alcohols oxidize to aldehydes (with PCC, a mild oxidant) or carboxylic acids (with KMnO\(_4\) or CrO\(_3\)/H\(_2\)SO\(_4\)); secondary alcohols oxidize to ketones; tertiary alcohols cannot be oxidized under mild conditions because there is no H on the carbon bearing the OH.

## Section 9.2: Ethers

**Ethers** (R–O–R') are relatively unreactive compounds because the C–O bonds are not particularly polarized and the oxygen bears no leaving group. They are commonly used as solvents (diethyl ether, THF, dioxane) precisely because of their chemical inertness toward most reagents. The one important reaction of ethers is their cleavage by strong acids (HBr, HI) at elevated temperatures: the ether oxygen is protonated to give an oxonium ion, which then undergoes S\(_N\)2 or S\(_N\)1 cleavage.

**Epoxides** (three-membered cyclic ethers) are far more reactive than acyclic ethers because of the ring strain in the three-membered ring. Nucleophilic ring-opening can occur under either basic conditions (where the free nucleophile attacks the less hindered carbon via S\(_N\)2) or under acidic conditions (where the protonated epoxide accumulates positive charge on the more substituted carbon, making it more electrophilic, so the nucleophile attacks there — following Markovnikov-like selectivity).

---

# Chapter 10: Radicals

## Section 10.1: Radical Reactions

**Free radicals** are species with one or more unpaired electrons. Unlike the ionic and polar mechanisms encountered in the bulk of this course, radical reactions are governed by homolytic bond cleavage, in which each atom takes one electron from the bond being broken. Radicals are generated photochemically (by UV irradiation) or thermally from weak bonds such as the O–O bond of peroxides.

**Radical halogenation** of alkanes (chlorination, bromination) proceeds by a **chain mechanism** with three stages: (1) **initiation** — homolysis of the halogen molecule (Cl\(_2\) or Br\(_2\)) by heat or light to produce two halogen radical atoms; (2) **propagation** — the halogen radical abstracts a hydrogen from the substrate to give an alkyl radical plus HX, and the alkyl radical then reacts with another X\(_2\) molecule to give the product R–X plus another X•, regenerating a radical; (3) **termination** — two radicals combine to quench the chain. The process is self-sustaining as long as radical concentration is maintained.

**Selectivity** in radical halogenation is governed by the stability of the intermediate radical (tertiary > secondary > primary) and the reactivity of the halogen atom. Chlorine is highly reactive and relatively unselective; bromine is less reactive but far more selective (it reacts preferentially at tertiary C–H bonds where the transition state is stabilized by forming the more stable tertiary radical). This selectivity difference arises because the bromine hydrogen-abstraction step is endothermic and the Hammond postulate dictates that the transition state resembles the product (the alkyl radical), so its stability strongly influences the rate.
