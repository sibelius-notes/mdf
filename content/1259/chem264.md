---
title: "CHEM 264: Organic Chemistry 1"
subjects: "CHEM"
prof: "Steve Forsey"
---

## Sources and References

**Primary textbook** — Clayden, J., Greeves, N., Warren, S. *Organic Chemistry*, 2nd ed. Oxford University Press, 2012.
**Supplementary texts** — McMurry, J. *Organic Chemistry*, 9th ed. Cengage Learning, 2015; Kürti, L., Czakó, B. *Strategic Applications of Named Reactions in Organic Synthesis*. Elsevier, 2005.
**Online resources** — SDBS Spectral Database (sdbs.db.aist.go.jp); PubChem (pubchem.ncbi.nlm.nih.gov); NIST Chemistry WebBook (webbook.nist.gov); Organic Chemistry Portal (organic-chemistry.org).

---

# Chapter 1: Structure, Bonding, and Nomenclature

## Introduction to Organic Chemistry

Organic chemistry is the study of carbon-containing compounds — their structure, properties, reactions, and synthesis. The central role of carbon in this field is not arbitrary but reflects several unique features of the carbon atom that collectively enable an extraordinary diversity of molecular architecture. Carbon lies at the center of the second period of the periodic table, with a Pauling electronegativity of 2.5, placing it midway between strongly electropositive elements and strongly electronegative ones. This intermediate electronegativity means that carbon forms covalent bonds of moderate polarity with most elements it encounters, neither ionizing completely to a cation nor drawing electrons so strongly as to become anionic in ordinary compounds.

More fundamentally, carbon is unique in its ability to form stable bonds with other carbon atoms, creating chains, rings, and branched networks of indefinite complexity. This property — called **catenation** — arises from the C–C bond energy (approximately 346 kJ/mol) being large enough to resist thermal cleavage under ordinary conditions while not being so large as to prevent bond formation during synthesis. The Si–Si bond in silicon is weaker and far more reactive toward oxidation and hydrolysis, which is one reason silicon-based biochemistry does not exist naturally. Carbon also routinely forms double bonds (C=C, C=O, C=N) and triple bonds (C≡C, C≡N), enabling the planar and linear geometries essential for conjugation, aromaticity, and the spectroscopic transitions exploited in analytical chemistry. With these capabilities, carbon builds the molecules of life — proteins, nucleic acids, carbohydrates, and lipids — as well as the molecules of commerce — polymers, pharmaceuticals, fuels, and dyes.

The number of known organic compounds exceeds 60 million and grows daily as chemists create new materials and natural-products chemists isolate previously unknown compounds from biological sources. Understanding this vast chemical landscape requires not the memorization of individual compounds but the internalization of organizing principles: how structure determines reactivity, how electrons flow in reactions, how stereochemistry controls biological activity, and how functional groups dictate the transformations available to a molecule. These principles are the subject matter of CHEM 264, and they provide the foundation for all subsequent work in organic, biological, and medicinal chemistry.

---

## 1.1 Nomenclature of Organic Compounds

The International Union of Pure and Applied Chemistry (IUPAC) has established a systematic naming convention that unambiguously identifies any organic structure. Mastering nomenclature is not merely an exercise in vocabulary; it is training in reading and communicating structural information precisely and efficiently, a skill that underlies everything from database searching in drug discovery to correctly following a synthetic procedure in the laboratory.

<div class="definition">
A <strong>functional group</strong> is an atom or group of atoms within a molecule responsible for the characteristic chemical reactions of that molecule. Functional groups define the reactivity class to which a compound belongs and largely determine its physical properties, spectroscopic characteristics, and biological activity.
</div>

The IUPAC nomenclature system works hierarchically. For a given compound, the procedure involves: identifying the principal functional group (which determines the suffix); finding the longest continuous carbon chain containing the principal functional group (the parent chain, which determines the parent name); numbering the chain from the end nearest the principal functional group; identifying and naming all substituents with their locant numbers; and assembling the name in alphabetical order of substituents followed by the parent name with its suffix.

The parent chain name encodes the carbon count using Greek and Latin numerical roots: methane (C1), ethane (C2), propane (C3), butane (C4), pentane (C5), hexane (C6), heptane (C7), octane (C8), nonane (C9), decane (C10), and for larger chains undecane through eicosane (C20). The suffix encodes the principal functional group: -ane (alkane, no functional group), -ene (alkene, with locant), -yne (alkyne, with locant), -ol (alcohol), -al (aldehyde, always at C1 so no locant needed), -one (ketone, with locant), -oic acid (carboxylic acid, always at C1), -amine (amine). Substituents on the parent chain are named as prefixes with their locants: fluoro-, chloro-, bromo-, iodo- for halogens; methyl-, ethyl-, propyl-, isopropyl-, butyl-, tert-butyl- for alkyl groups.

When multiple substituents are present, they are listed alphabetically (ignoring multiplying prefixes di-, tri-, tetra-). When the same substituent appears multiple times, multiplying prefixes are used: dimethyl- (two methyls), trichloro- (three chlorines), etc. The locant set that gives the lowest numbers to the substituents as a whole is chosen when there is ambiguity. In a name like 2,3-dimethyl-4-ethylheptane, the heptane parent chain has an ethyl group at C4 and methyl groups at C2 and C3.

<div class="example">
<strong>Example 1.1: IUPAC Nomenclature Practice</strong>

Name the compound with structure CH₃CH(CH₃)CH₂CH(OH)CH₂CH₃ systematically.

<em>Solution:</em> The principal functional group is –OH, so the suffix is -ol. Find the longest chain containing the OH: counting along the main chain that includes the OH carbon gives 6 carbons (hexanol framework). Number from the end nearer the OH: the OH is at C3, and a methyl group is at C5. The compound is <strong>5-methylhexan-3-ol</strong>. Check: numbering from the other end would put OH at C4 and methyl at C2; since the OH has priority, we choose the numbering that places it at the lower locant (C3 vs. C4), so our first numbering is correct.

Alternative verification: draw the six-carbon chain, confirm OH at position 3, methyl branch at position 5. The name reads clearly as a hexanol (six carbons, alcohol) with a methyl substituent at carbon 5. This compound would be a secondary alcohol (OH on C3, which has two carbon substituents).
</div>

Cyclic compounds are named with the prefix cyclo- before the parent name: cyclopentane, cyclohexane, cyclobutanol, cyclohexanone. Aromatic compounds built on the benzene ring have retained trivial names (toluene for methylbenzene, aniline for aminobenzene, phenol for hydroxybenzene, aniline for aminobenzene, styrene for vinylbenzene, xylenes for dimethylbenzenes) alongside systematic names; both sets are acceptable in communication. For polysubstituted benzenes, the relative positions of substituents are indicated by numbering (1–6, giving lowest locant set) or by the classical prefixes ortho- (o-, 1,2-disubstitution), meta- (m-, 1,3-disubstitution), and para- (p-, 1,4-disubstitution).

---

## 1.2 Atoms, Bonding, and Molecular Structure

### 1.2.1 Valence Bond Theory and Hybridization

Carbon in its ground state has the electron configuration 1s²2s²2p², with two unpaired electrons in the 2p subshell. Yet carbon universally forms four bonds in organic compounds. The explanation lies in **hybridization**: the quantum mechanical mixing of atomic orbitals on the same atom to form hybrid orbitals better suited for bonding.

<div class="definition">
<strong>Hybridization</strong> is the mathematical combination of atomic wave functions (orbitals) on the same atom to produce a new set of equivalent orbitals (hybrid orbitals) with different shapes, energies, and directional properties. The number of hybrid orbitals always equals the number of atomic orbitals mixed.
</div>

**sp³ hybridization:** One 2s + three 2p orbitals mix to give four equivalent sp³ orbitals, each with 25% s character and 75% p character. The sp³ orbitals are directed toward the corners of a regular tetrahedron (bond angles 109.5°). Methane (CH₄), ethane (C₂H₆), and all saturated hydrocarbons have sp³ carbon atoms. The C–C single bond in ethane is a \(\sigma\) bond (formed by end-on overlap of sp³ orbitals) and is cylindrically symmetric — free rotation around this bond is possible (energy barrier ~12 kJ/mol from torsional strain in ethane, but conceptually free). Substituents with lone pairs and electronegative atoms perturb the tetrahedral angles: in water (O: two lone pairs, two O–H bonds), the H–O–H angle is 104.5°; in ammonia, the H–N–H angles are 107.3°, each reduced from the ideal 109.5° by the greater space demand of lone pairs.

**sp² hybridization:** One 2s + two 2p orbitals mix to give three sp² orbitals at 120° in a plane, leaving one unhybridized p orbital perpendicular to that plane. Alkenes, aldehydes, ketones, carboxylic acids, and all other carbonyl-containing compounds have sp²-hybridized carbon. The sp² \(\sigma\) framework is planar (all atoms in the double-bond system are coplanar), and the remaining p orbitals on adjacent sp² carbons overlap side-on to form the \(\pi\) bond. The \(\pi\) bond has two lobes (above and below the nodal plane) and a node in the plane of the molecule. Rotation about the C=C double bond requires breaking the \(\pi\) bond (costing ~270 kJ/mol), which is why geometric (cis/trans) isomerism is observed in alkenes.

**sp hybridization:** One 2s + one 2p orbital mix to give two sp orbitals at 180°, leaving two unhybridized p orbitals at 90° to each other and to the molecular axis. Alkynes and allenes have sp-hybridized carbon. Acetylene (H–C≡C–H) is linear; the C≡C triple bond consists of one \(\sigma\) bond and two mutually perpendicular \(\pi\) bonds. Terminal alkynes (R–C≡C–H) are weakly acidic (pKₐ ≈ 25) because the sp-hybridized C–H bond has greater s character, placing the bonding electrons closer to the nucleus — the resulting carbanion (RC≡C⁻) is stabilized by this high s character. This acidity allows alkynes to be deprotonated by NaNH₂ (pKₐ of NH₃ ≈ 38) to give acetylide anions (RC≡C⁻), which are powerful nucleophiles and bases used in synthesis to build carbon-carbon bonds via S_N2 reactions with primary alkyl halides.

### 1.2.2 Bond Polarity, Electronegativity, and Dipole Moments

The Pauling electronegativity values (O: 3.5, N: 3.0, Cl: 3.0, F: 4.0, C: 2.5, H: 2.1, S: 2.5, Br: 2.8, I: 2.5) allow estimation of bond polarity. A bond between atoms differing by more than ~0.5 electronegativity units is polar covalent; by more than ~2 units is essentially ionic. The C–O bond (electronegativity difference: 1.0) is polar, with \(\delta^+\) on C and \(\delta^-\) on O. The C–H bond (difference: 0.4) is weakly polar. The C–F bond (difference: 1.5) is strongly polar.

The molecular dipole moment is the vector sum of all bond dipoles. Molecules with symmetric geometries can have individual polar bonds but zero molecular dipole moment: CO₂ (linear, the two C=O dipoles point in opposite directions and cancel), CCl₄ (tetrahedral, all four C–Cl dipoles cancel by symmetry). Molecules lacking such symmetry have permanent dipole moments: H₂O (1.85 D), acetone (2.88 D), acetonitrile (3.92 D). Permanent dipole moments determine solubility in polar vs. nonpolar solvents, boiling points (molecules with larger dipoles experience stronger dipole-dipole intermolecular forces), and interaction with electromagnetic radiation in infrared spectroscopy (only vibrations that change the dipole moment are IR-active, by the selection rule \(\Delta\mu \neq 0\)).

---

## 1.3 Formal Charge and Resonance

### 1.3.1 Formal Charge

Formal charge is a bookkeeping device for electrons in Lewis structures:

\[
\text{Formal charge} = (\text{Group number}) - (\text{Number of lone-pair electrons}) - \frac{1}{2}(\text{Number of bonding electrons})
\]

Formal charges allow identification of the most important resonance structure (minimal formal charges, negative charges on electronegative atoms), help predict the site of reactivity (atoms with formal positive charge are electrophilic; atoms with formal negative charge are nucleophilic), and confirm that a Lewis structure has the correct total charge. The sum of formal charges over all atoms must equal the overall charge of the molecule or ion.

A systematic check: hydrogen always has a formal charge of 0 (one bond, no lone pairs; formal charge = 1 − 0 − ½(2) = 0). Carbon with four bonds and no lone pairs: formal charge = 4 − 0 − ½(8) = 0. Oxygen with two bonds and two lone pairs: formal charge = 6 − 4 − ½(4) = 0. Nitrogen with four bonds and no lone pairs (ammonium-like): formal charge = 5 − 0 − ½(8) = +1. Oxygen with one bond and three lone pairs (alkoxide-like): formal charge = 6 − 6 − ½(2) = −1. These standard values should become reflexive.

### 1.3.2 Resonance Theory

<div class="definition">
<strong>Resonance structures</strong> (contributing structures, resonance forms) are Lewis structures that differ only in the placement of electrons — not in the positions of atoms. They are connected by double-headed arrows (↔), which should never be confused with equilibrium arrows (⇌). No single resonance structure is real; the actual molecule is a quantum mechanical superposition of all resonance forms, called the <strong>resonance hybrid</strong>.
</div>

The electron delocalization described by resonance lowers the energy of the molecule below that of any single resonance structure — this energy lowering is the **resonance energy** or **delocalization energy**. The more resonance structures that can be drawn, and the more equivalent they are, the greater the delocalization and the greater the stabilization.

Rules for drawing resonance structures: (1) only electron pairs (lone pairs and \(\pi\) bonds) move — atoms stay fixed; (2) the number of electrons does not change; (3) the number of bonds can change (but typically increases or stays the same in good contributing structures); (4) major contributing structures have fewer formal charges, have negative formal charges on electronegative atoms (O > N > C), and have more covalent bonds.

<div class="example">
<strong>Example 1.2: Resonance in the Allyl Cation</strong>

The allyl cation CH₂=CH–CH₂⁺ has two equivalent resonance structures: CH₂=CH–CH₂⁺ ↔ ⁺CH₂–CH=CH₂. In each structure, one terminal carbon has a formal positive charge and the other is part of the double bond. The resonance hybrid shows equal partial positive charges on both terminal carbons and the \(\pi\) bond delocalized over all three carbons.

<em>Curved-arrow mechanism:</em> Starting from CH₂=CH–CH₂⁺: draw a curved arrow from the C=C \(\pi\) bond (electron source) to the empty p orbital on the adjacent CH₂⁺ (electron sink). This moves the \(\pi\) bond over one position, generating the second resonance structure ⁺CH₂–CH=CH₂.

The two resonance structures are equivalent (degenerate), so the resonance stabilization is large — the allyl cation is substantially more stable than the propyl cation (a localized primary carbocation). This stabilization is the basis for the Sₙ1 and E1 reactivity of allylic systems and for the unusual regioselectivity of S_N1 reactions of allylic substrates (nucleophilic capture can occur at either end of the allylic system).
</div>

The resonance energy of benzene — approximately 150 kJ/mol — is the most dramatic demonstration of resonance stabilization in organic chemistry. If benzene were a cyclohexadiene with three isolated double bonds (Kekulé structure), its heat of hydrogenation should be three times that of cyclohexene (3 × 120 = 360 kJ/mol). The observed heat of hydrogenation is only 208 kJ/mol — the difference of 152 kJ/mol is the resonance energy, the extra stability conferred by the delocalization of six \(\pi\) electrons over the entire ring.

---

# Chapter 2: Acid-Base Chemistry in Organic Systems

## 2.1 Brønsted-Lowry Acids and Bases

<div class="definition">
A <strong>Brønsted-Lowry acid</strong> is a proton (H⁺) donor; a <strong>Brønsted-Lowry base</strong> is a proton acceptor. Every Brønsted-Lowry acid-base reaction transfers a proton from the acid to the base. The acid becomes its <strong>conjugate base</strong>; the base becomes its <strong>conjugate acid</strong>.
</div>

In organic chemistry, acid-base reactions are not a separate topic but underlie the mechanism of almost every reaction class. Proton transfers set up leaving group abilities (protonation of –OH to give H₂O), activate nucleophiles (deprotonation of thiols, alcohols, amines), and determine which form of a molecule is reactive under given pH conditions. A chemist who cannot rapidly assess the relative acidity and basicity of organic functional groups cannot think clearly about mechanism.

The **acid dissociation constant** \(K_a\) and its logarithmic transform \(\text{p}K_a = -\log K_a\) provide a numerical scale of acid strength. Lower pKₐ means stronger acid (higher tendency to donate protons). Some reference values: HCl (pKₐ ≈ −7), H₃O⁺ (pKₐ = 0), acetic acid (pKₐ 4.75), carbonic acid (pKₐ 6.4), phenol (pKₐ 10), water (pKₐ 15.7), aliphatic alcohols (pKₐ 16–18), acetone (pKₐ 20, α-H next to carbonyl), terminal alkynes (pKₐ 25), ammonia (pKₐ 38), alkanes (pKₐ ≈ 50). These reference values allow predictions about which direction proton-transfer equilibria favor and which bases are strong enough to deprotonate which acids.

The Henderson-Hasselbalch equation, \(\text{pH} = \text{p}K_a + \log\left(\frac{[\text{A}^-]}{[\text{HA}]}\right)\), relates the pH of a buffered solution to the pKₐ and the ratio of conjugate base to acid. This equation is essential for understanding reactivity in biological systems, where reactions occur at physiological pH (≈ 7.4). A functional group with pKₐ < 7.4 is predominantly in its deprotonated (base) form at physiological pH; a group with pKₐ > 7.4 is predominantly protonated (acid form). Thus carboxylate groups (pKₐ ≈ 4–5) are anionic (−COO⁻) at physiological pH, while aliphatic ammonium groups (pKₐ ≈ 10–11) are cationic (−NH₃⁺) at physiological pH — a fact fundamental to the mechanism of enzyme catalysis and the binding of drug molecules to their biological targets.

### 2.1.1 Four Factors Governing Organic Acid Strength

**Electronegativity of the acidic atom:** Across Period 2, acidity of binary hydrides increases: CH₄ (pKₐ ≈ 50) << NH₃ (pKₐ ≈ 38) << H₂O (pKₐ 15.7) << HF (pKₐ 3.2). More electronegative atoms stabilize the conjugate base anion more effectively by concentrating the negative charge on the atom where it is most stabilized.

**Resonance delocalization:** The single most powerful factor in organic acid chemistry. When the conjugate base can delocalize the negative charge over multiple atoms through \(\pi\) electron delocalization, the base is greatly stabilized and the acid is much stronger than would be predicted from electronegativity alone. Acetic acid (pKₐ 4.75) vs. ethanol (pKₐ 16): the acetate ion distributes negative charge equally over two oxygen atoms through resonance; the ethoxide ion concentrates it on one oxygen. The more dispersed charge is more stable — acetic acid is ca. 10¹¹ times more acidic than ethanol. Phenol (pKₐ 10) is far more acidic than cyclohexanol (pKₐ 16) because phenoxide delocalizes charge into the benzene ring (five resonance structures distributing the negative charge over the ring carbons). Nitrophenol is even more acidic (para-nitrophenol pKₐ 7.2) because the nitro group provides additional electron withdrawal and resonance delocalization into the nitro group itself.

**Inductive and field effects:** Electronegative substituents near (but not conjugated with) the acidic center stabilize the conjugate base by withdrawing electron density through \(\sigma\) bonds (and through space). The effect is transmitted through bonds but attenuates quickly with distance. Chloroacetic acid (pKₐ 2.86) > dichloroacetic acid (pKₐ 1.48) > trichloroacetic acid (pKₐ 0.70); each additional electronegative chlorine stabilizes the carboxylate anion more. Trifluoroacetic acid (CF₃COOH, pKₐ 0.5) is among the strongest organic carboxylic acids because the three fluorines have maximum inductive power, yet fluoroacetic acid (FCH₂COOH, pKₐ 2.59) is much weaker than chloroacetic acid despite fluorine being more electronegative — because fluorine's effect is transmitted through more bonds (FCH₂ vs. FCO, the F is not directly on the acidic carbon). The distance dependence is diagnostic.

**Polarizability (size) effects — down a group:** Despite lower electronegativity, larger, more polarizable atoms accommodate negative charge better by spreading it over a larger electronic cloud. HI >> HBr >> HCl >> HF in aqueous acidity, despite F being the most electronegative halogen, because polarizability (the ability of the electron cloud to distort and spread charge) increases down the group and dominates the thermodynamics of solvation. Similarly, thiophenol (PhSH, pKₐ 6.6) is more acidic than phenol (PhOH, pKₐ 10) partly because sulfur is more polarizable than oxygen. In polar protic solvents, the larger, more diffuse anion (like I⁻) is less strongly solvated and its stability advantage from polarizability translates directly into acidity of HI.

<div class="example">
<strong>Example 2.1: Ranking Acid Strengths with Explanation</strong>

Rank in order of increasing pKₐ (weakest to strongest acid): ethanol, trifluoroethanol, phenol, 4-nitrophenol, acetic acid, trichloroacetic acid.

<em>Solution:</em> Ethanol (pKₐ 16): no resonance, no inductive effect, isolated alkoxide. Phenol (pKₐ 10): resonance into ring, but charge still primarily on O. Trifluoroethanol (pKₐ 12.4): inductive effect of three F, no resonance. 4-Nitrophenol (pKₐ 7.2): resonance into ring plus nitro group provides additional delocalization. Acetic acid (pKₐ 4.75): resonance over two equivalent oxygens — much stronger. Trichloroacetic acid (pKₐ 0.70): resonance over two O plus powerful inductive effect of three Cl — strongest.

Order (increasing acid strength, increasing pKₐ listed in reverse): trichloroacetic (strongest, pKₐ 0.70) > acetic (4.75) > 4-nitrophenol (7.2) > trifluoroethanol (12.4) > phenol (10) — wait, 10 > 7.2 so phenol is weaker than 4-nitrophenol. Correcting: weakest acid first: ethanol (16) < phenol (10) < trifluoroethanol (12.4) — no, trifluoroethanol has pKₐ 12.4 which is MORE acidic than phenol at pKₐ 10, so trifluoroethanol should appear between ethanol and phenol. Final ranking from weakest to strongest: ethanol (16) < trifluoroethanol (12.4) < phenol (10) < 4-nitrophenol (7.2) < acetic acid (4.75) < trichloroacetic acid (0.70).
</div>

## 2.2 Lewis Acids and Bases

<div class="definition">
A <strong>Lewis acid</strong> is an electron-pair <em>acceptor</em>; a <strong>Lewis base</strong> is an electron-pair <em>donor</em>. Lewis acid-base theory is more general than Brønsted-Lowry theory because it encompasses reactions that do not involve proton transfer.
</div>

Common Lewis acids in organic chemistry: BF₃ (boron has only 6 valence electrons, accepts lone pair from N or O donor), AlCl₃ (strong Lewis acid catalyst in Friedel-Crafts reactions, activates alkyl halides and acyl halides toward electrophilic attack on arenes), FeBr₃, TiCl₄, SnCl₄, ZnCl₂, and protons (H⁺). Common Lewis bases: amines (lone pair on N), ethers (lone pairs on O), alcohols, thiols, halide ions (lone pairs on halogen), and the \(\pi\) bonds of alkenes and aromatic rings (electron density available for donation to Lewis acids — the basis of electrophilic aromatic substitution).

The Lewis acid-base framework unifies the understanding of many reactions that might otherwise seem unrelated. In nucleophilic substitution (S_N2), the nucleophile is a Lewis base donating its electron pair to the electrophilic carbon (Lewis acid). In electrophilic addition to alkenes, the alkene is the Lewis base (\(\pi\) electrons) and the electrophile is the Lewis acid. In Friedel-Crafts acylation, AlCl₃ (Lewis acid) activates the acyl chloride by coordinating to the chlorine, generating a highly electrophilic acylium cation (or acyl-Al complex) that is attacked by the arene (Lewis base). The unifying theme — Lewis base donates electrons to Lewis acid — provides a powerful organizing framework.

---

# Chapter 3: Stereochemistry

## 3.1 Constitutional Isomers, Stereoisomers, and Their Classification

<div class="definition">
<strong>Constitutional isomers</strong> (structural isomers) have the same molecular formula but differ in the connectivity of atoms — which atoms are bonded to which. <strong>Stereoisomers</strong> have the same molecular formula and the same connectivity but differ in the spatial arrangement of atoms. Stereoisomers are further divided: <strong>enantiomers</strong> are non-superimposable mirror images; <strong>diastereomers</strong> are stereoisomers that are not mirror images.
</div>

The distinction between structural and stereochemical relationships is not merely academic — it is biologically and pharmacologically crucial. Biological systems interact with molecules in three dimensions: enzymes bind specific substrates at active sites with precise geometric complementarity; receptors are activated by one enantiomer of a chiral ligand but not (or differently) by the other. The two enantiomers of a drug molecule can have radically different activities. Thalidomide provides the most notorious historical example: the (R)-enantiomer is a sedative, while the (S)-enantiomer causes teratogenesis (birth defects). Even when the two enantiomers are individually prepared, they interconvert in the body by racemization, so this tragic case also illustrates the need for understanding chemical stability of chiral centers. Ibuprofen, a common analgesic, is administered as a racemate: only (S)-ibuprofen is pharmacologically active (inhibits COX-1 and COX-2 enzymes), but the (R)-enantiomer is converted in the body to the (S)-form. L-DOPA (used in treatment of Parkinson's disease) must be the L (S) enantiomer — the D (R) enantiomer is toxic.

## 3.2 Conformational Analysis

**Conformational isomers** (conformers) are rapidly interconverting arrangements of a molecule arising from rotation about single bonds. Since conformers interconvert without breaking bonds, they are the same compound — not different stereoisomers. However, the conformational preferences of a molecule profoundly influence its reactivity: reactions proceed through specific conformational arrangements (e.g., E2 elimination requires anti-periplanar H and LG), and the most populated conformation is often the most reactive one in solution.

**Newman projections** provide the clearest representation of conformations about a C–C bond. The molecule is viewed along the axis of the bond of interest. The front carbon is represented by a dot or the center of the circle, and its three substituents radiate outward; the back carbon is represented by the circle, and its three substituents emerge from behind the circle. The dihedral angle \(\phi\) between any two substituents (one on front, one on back carbon) is measured by the angle between the two bonds as drawn in the Newman projection.

For **ethane** (the simplest case): the fully staggered conformation (\(\phi = 60°\), where all three H–H pairs are staggered) has the lowest energy; the fully eclipsed conformation (\(\phi = 0°\), where all H–H pairs are eclipsed) has the highest energy, with a barrier of approximately 12 kJ/mol. This barrier arises primarily from **torsional strain** — the electronic repulsion between bonding electron pairs in the C–H bonds on adjacent carbons when they are eclipsed (partially overlapping). The barrier is small enough that ethane's conformers interconvert thousands of times per second at room temperature.

For **butane** (Newman projection along the C2–C3 bond): four distinct staggered and three eclipsed conformations exist. The **anti** conformation (CH₃ groups at \(\phi = 180°\)) is the most stable; the two equivalent **gauche** conformations (CH₃ at \(\phi = 60°\) or \(300°\)) are higher in energy by approximately 3.8 kJ/mol per gauche interaction, due to **steric strain** between the methyl groups at 60° to each other. Two additional eclipsed conformations exist (at \(\phi = 0°\) and \(120°\)); the \(\phi = 0°\) conformation (both CH₃ groups eclipsed) has the highest energy. The gauche interaction energy (~3.8 kJ/mol) provides a numerical anchor for estimating steric costs in conformational analysis.

### 3.2.1 Cyclohexane Conformations and the Chair

Cycloalkanes cannot freely rotate about their C–C bonds without changing ring geometry. The simplest monocyclic alkane, **cyclopropane**, is planar (no other option) and exhibits severe **angle strain** (bond angles 60° vs. ideal 109.5°) as well as **torsional strain** (all adjacent bonds eclipsed in the plane). Cyclopropane's ring strain (∼115 kJ/mol) makes it significantly more reactive than unstrained cyclic or acyclic alkanes.

**Cyclohexane** adopts the **chair conformation** to minimize both angle strain and torsional strain simultaneously. In the chair, all C–C–C bond angles are approximately 111° (close to tetrahedral), and all adjacent C–H bonds are staggered. Two chair conformations exist for any cyclohexane; they interconvert by **ring flip** (conformational change through the boat and half-chair) with an activation barrier of approximately 45 kJ/mol.

<div class="definition">
In the cyclohexane chair conformation, each carbon bears one <strong>axial</strong> bond (pointing approximately straight up or down, parallel to the ring's axis of symmetry) and one <strong>equatorial</strong> bond (pointing outward at roughly 109.5° from the axial direction, in a belt around the ring's equator). Ring flip interconverts axial and equatorial positions: axial bonds become equatorial and equatorial become axial.
</div>

Substituents on cyclohexane prefer the **equatorial** position to minimize **1,3-diaxial interactions** — steric repulsions between an axial substituent at one carbon and the axial H atoms (or other axial substituents) at the 1,3-positions on the same face of the ring. These 1,3-diaxial interactions are geometrically similar to gauche interactions. The quantitative preference for equatorial over axial is expressed as the **A-value** (conformational free energy): for methyl, A = 7.3 kJ/mol; for ethyl, ~8 kJ/mol; for isopropyl, ~9.2 kJ/mol; for tert-butyl, ~23 kJ/mol (so large that cyclohexane with an equatorial tert-butyl is essentially locked in that conformation, with >99.9% in equatorial form). A-values are approximately additive for weakly interacting substituents; the predominant conformation of a polysubstituted cyclohexane has the largest groups equatorial.

Trans-1,4-disubstituted cyclohexane has both substituents equatorial in one chair and both axial in the other — strongly preferring the diequatorial form. Cis-1,4-disubstituted cyclohexane has one equatorial and one axial substituent in both chairs, so the two chairs are equal in energy if substituents are the same, or favor the one with the larger group equatorial if substituents differ. These conformational preferences directly influence the reactivity and selectivity of reactions involving cyclohexyl systems.

## 3.3 Chirality and Absolute Configuration

<div class="definition">
A molecule is <strong>chiral</strong> if it is non-superimposable on its mirror image. A molecule is <strong>achiral</strong> if it is superimposable on its mirror image. The most common source of molecular chirality is a <strong>stereocenter</strong> — a carbon atom bonded to four different substituents — though chirality can also arise from axial chirality (restricted rotation) and other structural features.
</div>

The practical test for chirality: does the molecule have a plane of symmetry, a center of inversion, or any other improper symmetry element? If yes, the molecule is achiral. If no, the molecule is chiral. For organic molecules with tetrahedral stereocenters, the absence of any symmetry plane through the molecule (ignoring the stereocenter itself) correlates with chirality. However, meso compounds have stereocenters but are overall achiral because an internal symmetry plane makes the molecule superimposable on its mirror image.

The **Cahn-Ingold-Prelog (CIP) priority system** assigns an absolute configuration designation (R or S) to each stereocenter:

1. Assign priorities 1 (highest) through 4 (lowest) to the four substituents based on the atomic numbers of the atoms directly attached to the stereocenter. Ties are broken by going to the next attached atoms; double bonds are treated as if each atom is duplicated (C=O means C is bonded to two O atoms and O is bonded to two C atoms for priority purposes).
2. Orient the molecule (or mentally) so that the group of lowest priority (4) points away from the viewer.
3. Trace the path 1 → 2 → 3. If this trace is clockwise, the configuration is **R** (Latin: rectus, right). If counterclockwise, the configuration is **S** (Latin: sinister, left).

<div class="example">
<strong>Example 3.1: Assigning Configuration to (R)-Alanine</strong>

L-Alanine (the biologically prevalent enantiomer of the amino acid alanine) is (S)-alanine. Determine the priorities at the α-carbon (C2) of alanine (H₂N–CH(CH₃)–COOH).

<em>Groups attached to C2:</em> –NH₂ (N, atomic number 7), –COOH (C with two O attached by double bond; the double bond C=O means the C counts as bonded to two oxygens — highest priority C-containing group), –CH₃ (C bonded to three H), –H (H, atomic number 1).

<em>Priority order:</em> (1) –NH₂ (N: atomic number 7, highest single-atom substituent), (2) –COOH (C with double bond to O, treated as C bonded to O, O; higher priority than CH₃), (3) –CH₃ (C bonded to H, H, H), (4) –H (lowest).

<em>Configuration:</em> With H pointing away from the viewer, trace 1(–NH₂) → 2(–COOH) → 3(–CH₃): this is counterclockwise → S configuration. L-Alanine is indeed (S)-alanine, confirming that L-amino acids (the biologically occurring form in proteins) generally have S configurations (except L-cysteine, where the high atomic number of S in the side chain reverses the priority order to give R configuration despite being the same absolute spatial arrangement as the other L-amino acids).
</div>

### 3.3.1 Optical Activity and the Polarimeter

Chiral compounds rotate the plane of polarized light — they are **optically active**. A **polarimeter** measures the angle of rotation \(\alpha\) of monochromatic (usually sodium D line, 589 nm) polarized light passing through a solution of known concentration and path length. The **specific rotation** \([\alpha]_D^{20}\) is defined as:

\[
[\alpha]_D^{20} = \frac{\alpha}{l \times c}
\]

where \(\alpha\) is the observed rotation in degrees, \(l\) is the path length in decimeters, and \(c\) is the concentration in g/mL. The specific rotation is a characteristic physical property of a pure chiral compound. A positive value (dextrorotatory, +) means the plane of polarized light is rotated clockwise when viewed facing the oncoming light beam; negative (levorotatory, −) means counterclockwise. The sign and magnitude of specific rotation cannot be predicted from R/S designation — they must be measured experimentally.

An **enantiomeric excess (ee)** is the difference in the mole fractions of the two enantiomers: \(\text{ee} = |f_R - f_S| \times 100\%\). A pure enantiomer has ee = 100%; a racemic mixture (equal amounts of both enantiomers) has ee = 0% and is optically inactive. The observed rotation of a mixture is proportional to the ee.

### 3.3.2 Compounds with Multiple Stereocenters

For a molecule with \(n\) stereocenters, the maximum number of stereoisomers is \(2^n\), divided into \(2^{n-1}\) enantiomeric pairs. The actual number may be less if the molecule has internal symmetry (**meso** forms).

The four stereoisomers of 2,3-dibromobutane (two stereocenters, four possible combinations of R and S) are: (2R,3R)-2,3-dibromobutane; (2S,3S)-2,3-dibromobutane (these two are enantiomers); (2R,3S)-2,3-dibromobutane (meso, achiral — the molecule has an internal mirror plane making C2 and C3 mirror images of each other); and since (2R,3S) and (2S,3R) are the same compound (meso), there are only three distinct stereoisomers. The meso compound is a diastereomer of the (2R,3R)/(2S,3S) enantiomeric pair and has different physical properties (different melting point, different specific rotation of zero, different NMR spectrum in chiral environments).

**Diastereomers** differ in all physical properties and can be separated by conventional techniques. The separation of diastereomers is used synthetically to resolve (separate) enantiomers: treat the racemic mixture with a chiral resolving agent to form diastereomeric salts (or derivatives), separate by crystallization or chromatography, then remove the resolving agent to recover the individual enantiomers.

---

# Chapter 4: Reactivity and Reaction Mechanisms

## 4.1 The Curved-Arrow Formalism

Organic reaction mechanisms are written using **curved arrows** to show the movement of electron pairs. Each double-headed curved arrow represents the movement of one pair (two electrons). The arrow's tail begins at the electron source (lone pair, bond, anion) and the head points toward the electron destination (atom forming a new bond, or lone pair forming on an atom). Single-headed (fishhook) arrows represent single-electron movements in radical mechanisms.

<div class="definition">
In a <strong>polar mechanism</strong>, all steps involve the heterolytic (unequal) cleavage or formation of bonds, where one atom retains both electrons. The fundamental driving forces are the stabilization of opposite formal charges, the relief of strain, and the formation of stronger bonds at the expense of weaker ones.
</div>

The cardinal rules: (1) electrons always flow from nucleophile (electron-rich) to electrophile (electron-poor); (2) each arrow represents exactly two electrons; (3) arrows that break bonds remove electrons from those bonds (the bond disappears from the structure); (4) arrows that form bonds place electrons into new bonds; (5) the octet rule must be obeyed in all intermediate structures (carbon should have at most 8 electrons around it in standard organic intermediates, though hypervalent carbon species do not exist). A complete mechanism shows every electron movement in every elementary step, with each intermediate fully drawn.

## 4.2 Types of Bond-Breaking: Homolysis and Heterolysis

Bonds can break in two fundamentally different ways. **Homolysis** (homolytic cleavage) divides the electron pair equally — one electron goes to each atom — producing two radicals (species with unpaired electrons). This is indicated by two fishhook arrows in opposite directions. **Heterolysis** (heterolytic cleavage) gives both electrons to one atom — producing an ion pair (a cation and an anion). This is indicated by one double-headed curved arrow.

The type of cleavage that predominates depends on the reaction conditions and the nature of the bond. Polar bonds (C–O, C–N, C–halogen) in polar solvents cleave heterolytically (giving carbocations and anions). Non-polar bonds (C–H, C–C) in the gas phase or under radical-initiating conditions (UV light, ROOR) cleave homolytically. These two modes of bond cleavage define the two major divisions of organic reactivity: polar (ionic) reactions and radical (free radical) reactions.

---

# Chapter 5: Nucleophilic Substitution Reactions

## 5.1 The S_N2 Mechanism

<div class="definition">
The <strong>S_N2 reaction</strong> (Substitution, Nucleophilic, Bimolecular) is a one-step, concerted mechanism. The nucleophile attacks the electrophilic carbon (bearing the leaving group) from the back side (anti, 180° to the leaving group), simultaneously forming the new bond and breaking the old C–LG bond. The rate law is: <strong>rate</strong> = k[substrate][nucleophile]. The reaction proceeds with complete <strong>inversion of configuration</strong> (Walden inversion) at the carbon.
</div>

The mechanistic features of S_N2 are beautifully interconnected. The back-side attack requirement arises from orbital symmetry: the nucleophile's HOMO (filled orbital) overlaps best with the C–LG \(\sigma\)* antibonding orbital (LUMO), which has its largest lobe on the back side of the carbon atom, opposite the leaving group. The trigonal bipyramidal transition state has partial bonds to both nucleophile and leaving group, and the three non-reacting substituents on carbon are in a plane at 120° angles. As the TS is traversed, these substituents flip through the plane like an umbrella inverting — the inversion of configuration. This stereochemical outcome is the defining diagnostic test for S_N2.

The energy diagram shows a single smooth curve from reactants through a single TS (energy maximum) to products — no intermediate is present. The activation energy is the height of the TS above the reactant level. Factors that raise the TS energy decrease the rate; factors that lower it increase the rate.

### 5.1.1 Steric Effects: The Critical Determinant

Steric bulk around the carbon undergoing substitution is the most important factor determining S_N2 reactivity. The approaching nucleophile must achieve the trigonal bipyramidal arrangement, bringing its electron pair into proximity with all three non-leaving substituents. Increasing the size or number of these substituents raises the energy of the TS (steric compression) and dramatically slows the reaction.

The relative rates of S_N2 reactions for a methyl, primary, secondary, and tertiary substrate (same nucleophile and leaving group) are approximately 10⁶ : 10⁴ : 1 : effectively zero. This four-order-of-magnitude span from primary to tertiary is the most dramatic example of steric effects in organic chemistry. The implication is practical: S_N2 reactions are reliable for methyl and primary substrates, sometimes useful for secondary, and essentially useless for tertiary.

**Branching at the β-carbon** also reduces S_N2 reactivity: neopentyl bromide ((CH₃)₃C–CH₂–Br, a primary substrate) reacts by S_N2 approximately 10,000-fold slower than n-propyl bromide because the three methyl groups on the adjacent (β) carbon crowd the back face of the C–Br carbon, even though the α-carbon is primary.

### 5.1.2 Nucleophilicity

Nucleophilicity is the kinetic measure of how rapidly a species attacks an electrophile. It is distinct from basicity (the thermodynamic tendency to accept a proton). A species can be a strong nucleophile but a weak base, or vice versa.

In polar protic solvents (water, alcohols), where the nucleophile is solvated: nucleophilicity increases down a group (I⁻ > Br⁻ > Cl⁻ > F⁻) because larger anions are less tightly solvated and thus more available to react; nucleophilicity decreases with increasing solvation. In polar aprotic solvents (DMSO, DMF, acetonitrile, acetone): nucleophilicity correlates better with basicity, since nucleophiles are not strongly solvated and are "naked." This solvent effect is enormously important in synthesis: switching from ethanol to DMSO can increase the rate of S_N2 reactions by factors of 10³ to 10⁵.

Neutral nucleophiles (amines, alcohols, thiols) react more slowly than anionic nucleophiles (alkoxide, iodide, cyanide, azide, thiolate). Among common anionic nucleophiles for S_N2: I⁻, CN⁻, N₃⁻ (azide), RS⁻ (thiolate), and Ph₃P (triphenylphosphine, a neutral but powerful nucleophile) are particularly good. F⁻ is a poor nucleophile in protic solvents (strongly solvated) but an excellent base.

### 5.1.3 Leaving Group Ability

The leaving group must depart as a relatively stable, weak base. The leaving group ability parallels the acidity of the conjugate acid: a leaving group HA with pKₐ < 0 (strong acid conjugate base) is a good leaving group; pKₐ > 0 is progressively worse. Good leaving groups: I⁻ (HI pKₐ ≈ −10), Br⁻ (pKₐ ≈ −9), Cl⁻ (pKₐ ≈ −7), sulfonates such as OTs⁻ (tosylate, pKₐ ≈ −1), OTf⁻ (triflate, pKₐ ≈ −14), and H₂O (when OH is protonated, pKₐ of H₃O⁺ = 0). Moderate leaving groups: Br⁻ > Cl⁻. Poor leaving groups: F⁻ (pKₐ of HF = 3.2), RO⁻ (pKₐ of ROH ≈ 16), HO⁻ (pKₐ of H₂O = 15.7), CN⁻ (pKₐ of HCN ≈ 9 — moderate), NR₂⁻ (pKₐ of NHR₂ ≈ 35–38, terrible).

Tosylate (OTs, p-toluenesulfonate) esters are valuable synthetic intermediates: treating an alcohol with TsCl/pyridine converts –OH (poor leaving group) to –OTs (excellent leaving group) with retention of configuration at the carbon, allowing subsequent S_N2 reactions to proceed with net inversion of the original alcohol.

<div class="example">
<strong>Example 5.1: S_N2 Reaction — Synthesis of a Nitrile</strong>

Propose a synthesis of pentanenitrile (CH₃CH₂CH₂CH₂CN) from 1-bromobutane.

<em>Solution:</em> 1-Bromobutane (primary alkyl bromide) + NaCN (sodium cyanide, excellent nucleophile, CN⁻) in DMSO (polar aprotic solvent to maximize nucleophilicity of CN⁻) → pentanenitrile + NaBr.

Mechanism: CN⁻ attacks the C1 of 1-bromobutane from the back side of the C–Br bond (S_N2), Br⁻ departs simultaneously. Since the substrate is primary, S_N2 is facile. The carbon undergoes inversion (but since C1 of 1-bromobutane has two H substituents, inversion is not stereochemically observable). The product is pentanenitrile, in which the new C–C bond has been formed and the chain has been extended by one carbon. This reaction — alkyl halide + NaCN → nitrile — is a reliable method for chain elongation by one carbon, and the nitrile can subsequently be hydrolyzed to carboxylic acid or reduced to amine.
</div>

## 5.2 The S_N1 Mechanism

<div class="definition">
The <strong>S_N1 reaction</strong> (Substitution, Nucleophilic, Unimolecular) proceeds in two distinct steps: (1) ionization of the substrate to give a free carbocation intermediate (slow, rate-determining); (2) capture of the carbocation by the nucleophile (fast). The rate law is: <strong>rate</strong> = k[substrate] (first order, independent of nucleophile concentration). The reaction proceeds with <strong>racemization</strong> (or partial racemization) at the stereocenter.
</div>

The energy diagram shows two maxima (two transition states) and one minimum (the carbocation intermediate). The rate-determining step is the first (ionization) step: the nucleophile does not appear in the rate law because the carbocation is already formed before the nucleophile attacks. The rate depends on how easily the substrate ionizes, which in turn depends on the stability of the carbocation formed.

The carbocation intermediate is planar and sp²-hybridized at the positive carbon; its empty p orbital can be attacked from either face. If the substrate is chiral (with the stereocenter at the carbocation carbon), attack from the two faces gives opposite enantiomers in proportion to face accessibility, giving a racemic or partially racemic product. Pure racemization is observed when the planar carbocation is attacked equally from both faces; partial racemization (some inversion plus some retention) occurs when the ion pair has not fully separated before nucleophilic attack.

### 5.2.1 Carbocation Stability and the Rate of S_N1

The driving force for ionization is the stability of the resulting carbocation. The stability order (tertiary > secondary > allylic/benzylic > primary > methyl) directly determines the rate of S_N1 ionization. Tertiary alkyl halides and tosylates in polar protic solvents (which solvate the developing cation) are the prototypical S_N1 substrates. Secondary allylic or benzylic systems also react via S_N1.

The allylic cation (R–CH=CH–CH₂⁺ ↔ R–CH⁺–CH=CH₂) is stabilized by charge delocalization over three carbons. When S_N1 occurs on an allylic substrate, the nucleophile can attack either end of the allylic system, giving a mixture of products — **allylic rearrangement** (SN1) is diagnostic of allylic carbocations. Similarly, homoallylic and propargylic systems show distinctive rearrangements.

### 5.2.2 Neighboring Group Participation

An intriguing variant of S_N1 involves **neighboring group participation** (or **anchimeric assistance**): an adjacent lone pair or \(\pi\) bond assists the departure of the leaving group by providing internal nucleophilic assistance, forming a bridged intermediate (cyclic cation) that is more stable than the open carbocation. This is characterized by retention of configuration at the carbon undergoing substitution (rather than racemization), a faster rate than expected for simple S_N1, and specific stereochemical outcomes dictated by the geometry of the bridged intermediate.

---

# Chapter 6: Elimination Reactions

## 6.1 The E2 Mechanism

<div class="definition">
The <strong>E2 mechanism</strong> (Elimination, Bimolecular) is a concerted, one-step process: a base abstracts a \(\beta\)-hydrogen as the leaving group departs and the new \(\pi\) bond forms — all in one elementary step. Rate = k[base][substrate]. The geometrical requirement is that the H being removed and the leaving group must be <strong>anti-periplanar</strong> (\(\phi = 180°\)) for maximum orbital overlap in the transition state.
</div>

The anti-periplanar requirement has a stereoelectronic basis: the C–H \(\sigma\) bonding orbital must align with the C–LG \(\sigma\)* antibonding orbital for optimal overlap as the concerted bond changes occur. This alignment is achieved at the anti arrangement (180°) because the \(\sigma\) bond and the \(\sigma\)* LUMO have the same spatial orientation as the new \(\pi\) bond that forms. In acyclic systems, achieving anti-periplanar geometry simply requires a conformation with H and LG anti; in cyclic systems, this constraint can severely limit which protons can undergo E2.

The transition state for E2 has partial bonds (C–H bond partially broken, C–LG bond partially broken, C=C bond partially formed) and resembles both the substrate and the products, with the extent of bond breaking/forming depending on whether the TS is early (more substrate-like, endothermic proton transfer step) or late (more product-like). With strong bases where proton transfer is essentially thermoneutral or exothermic, the TS tends to be early and less selective.

### 6.1.1 Zaitsev's Rule, Hofmann's Rule, and the Role of Base Size

When multiple β-hydrogens exist, **Zaitsev's rule** predicts the major product is the more substituted alkene. This follows thermodynamically: more substituted alkenes are more stable (hyperconjugation from adjacent C–H bonds stabilizes the \(\pi\) system) and the TS resembles the product (Hammond's postulate for exothermic reactions: early TS resembles reactants, but the thermodynamic alkene stability still influences the kinetics).

**Hofmann's rule** predicts the less substituted alkene as the major product when large, hindered bases are used (potassium tert-butoxide, LDA). The bulky base preferentially removes the proton that is most sterically accessible — the primary (terminal) \(\beta\)-hydrogen rather than the secondary (internal) one — giving the less substituted alkene regardless of thermodynamic preference. The Hofmann product is the **kinetic product** when steric effects in the TS dominate.

The synthetic significance: having both Zaitsev and Hofmann conditions available means the chemist can direct elimination to either the more or less substituted alkene by choice of base. This level of control is essential in multi-step synthesis where a specific alkene isomer is needed for subsequent reactions.

<div class="example">
<strong>Example 6.1: E2 Stereochemistry in Cyclohexyl Systems</strong>

Trans-1-chloro-4-methylcyclohexane undergoes E2 with KOH/ethanol. Determine which product(s) form.

<em>Analysis:</em> For E2, the H and Cl must be anti-periplanar (axial-axial relationship in cyclohexane). In the chair conformation with Cl equatorial (more stable), the Cl is equatorial and no H is anti-periplanar to it. In the chair conformation with Cl axial, the Cl is axial; the H atoms at the 2-position trans to Cl (i.e., axial H at C2) are anti-periplanar. In this conformation (Cl axial), an H₂ is available on both adjacent carbons. Elimination gives 4-methylcyclohex-1-ene (and also 4-methylcyclohex-2-ene, though the ring constraint makes analysis more specific). The point: only axial H atoms can be removed in E2 of cyclohexyl substrates, because only axial H — axial LG pairs are anti-periplanar. This principle explains why trans-4-tert-butylcyclohexyl chloride (Cl axial, tert-Bu equatorial, locked conformation) undergoes E2 readily, while cis-4-tert-butylcyclohexyl chloride (Cl equatorial, locked) undergoes E2 far more slowly (must go through the much less stable conformer or react by E1).
</div>

## 6.2 The E1 Mechanism and E1/S_N1 Competition

The **E1 mechanism** (Elimination, Unimolecular) is the two-step elimination analog of S_N1: (1) ionization of the substrate to give a carbocation (rate-determining); (2) deprotonation of the carbocation by base (or solvent) to give the alkene. Rate = k[substrate] (first order). E1 always competes with S_N1 because they share the same carbocation intermediate.

Since both E1 and S_N1 go through the same intermediate, they are mechanistically parallel and their relative rates cannot be explained by the formation step. The partitioning between S_N1 (nucleophilic capture of the cation) and E1 (deprotonation of the cation) depends on: whether the attacking species acts as a nucleophile or as a base (which is related to structure); temperature (higher temperature favors E1 because elimination is entropically favored — two product molecules from one); and the stability of the alkene produced (driving E1 forward).

The selectivity rules for competing reactions are: primary substrates + strong nucleophile → S_N2; primary substrates + strong, bulky base → E2; secondary substrates + nucleophile → S_N2 or E2; secondary substrates + strong base → E2 dominates; tertiary substrates + any base/nucleophile → E2 (with strong base) or S_N1/E1 (polar protic, weak nucleophile, high temperature).

---

# Chapter 7: Reactions of Alkenes and Alkynes

## 7.1 Electrophilic Addition: The Markovnikov Framework

Alkenes are electron-rich (the \(\pi\) electrons are available for donation to electrophiles) and undergo **electrophilic addition** as their characteristic reaction. The overall change: a \(\pi\) bond and a reagent A–B add across the double bond to give A–C–C–B (where the two carbons of the double bond acquire A and B respectively).

<div class="definition">
<strong>Markovnikov's rule</strong> (as understood mechanistically): In electrophilic addition of H–X to an unsymmetric alkene, proton addition goes to the less substituted carbon (forming the C–H bond at the position with more H already), generating the more stable (more substituted) carbocation at the more substituted carbon; X⁻ then adds to this more substituted carbon. The product has X at the more substituted position.
</div>

The modern mechanistic rationale: step 1 (protonation of the alkene) is the slow, rate-determining step. The proton can add to either carbon of the double bond, and the two transition states differ in energy by the stability difference between the two possible carbocations. The more substituted carbocation is more stable; its TS is lower in energy (Hammond's postulate: the TS for an endothermic step resembles the product — the less stable carbocation TS is reached first but leads to a higher-energy product). Therefore, the Markovnikov product (X on the more substituted carbon) is kinetically and thermodynamically favored.

### 7.1.1 Hydrohalogenation (Addition of HX)

In HCl or HBr addition to propene: H adds to C1 (less substituted), giving the secondary carbocation at C2; Cl⁻ or Br⁻ captures C2, giving 2-chloropropane or 2-bromopropane (Markovnikov product). For HI addition to 2-methylpropene (isobutylene), H adds to the terminal =CH₂ and I⁻ adds to the tertiary carbon, giving tert-butyl iodide (2-iodo-2-methylpropane). These predictions are reliable for purely Brønsted-acid addition in polar, non-radical conditions.

**Anti-Markovnikov (radical) addition:** In the presence of radical initiators (peroxides, ROOR) and HBr, the mechanism switches to a radical chain. A bromine radical adds to the terminal carbon of propene (the more substituted carbon would give a secondary radical, but Br• preferentially adds to the less hindered terminal carbon, giving the more stable secondary carbon radical). Hydrogen then adds to the radical center (more substituted carbon) via H-abstraction from HBr. Result: Br at C1, H at C2 — anti-Markovnikov! Peroxide-initiated radical addition applies only to HBr (not HCl or HI, which have unsuitable radical chain thermodynamics) and reverses the regiochemistry. The term "anti-Markovnikov" in this context specifically refers to the peroxide effect on HBr addition.

### 7.1.2 Acid-Catalyzed Hydration

Alkenes add water in the presence of strong acid (H₂SO₄, H₃PO₄) to give alcohols. Mechanism: (1) protonation of the alkene to give the Markovnikov carbocation; (2) attack of water (nucleophile) on the carbocation; (3) deprotonation to give the alcohol. This gives the Markovnikov alcohol (OH at the more substituted carbon). The reaction is reversible (alcohol dehydration is the reverse); the equilibrium favors alcohol at low temperature with dilute acid, and alkene at high temperature with concentrated acid.

**Acid-catalyzed hydration is prone to carbocation rearrangements:** if the initially formed carbocation can rearrange (1,2-hydride shift or 1,2-methyl shift) to a more stable carbocation, the rearranged product predominates. This must be considered in synthesis planning.

### 7.1.3 Halogenation: The Bromonium Ion

Addition of Br₂ or Cl₂ to alkenes proceeds through a **bridged halonium ion** (bromonium or chloronium ion) intermediate. As one Br₂ molecule approaches the alkene, the \(\pi\) electrons push back on the far end of Br–Br, polarizing the Br–Br bond further and ultimately forming a three-membered bromonium ring where one Br bridges the two alkene carbons. This cyclic intermediate (not a simple carbocation) is opened by Br⁻ from the back side — an intramolecular S_N2 on the more electrophilic carbon of the bromonium.

The critical consequence: **anti addition** — both bromines add to opposite faces of the double bond. This is the definitive stereochemical proof for the bromonium intermediate. For cyclohexene + Br₂: the bromonium opens to give trans-1,2-dibromocyclohexane exclusively (both Br atoms added anti). For (Z)-but-2-ene (cis-2-butene) + Br₂: anti addition gives (2R,3S)-2,3-dibromobutane and (2S,3R)-2,3-dibromobutane — the meso compound (since the molecule has a plane of symmetry). For (E)-but-2-ene (trans-2-butene) + Br₂: anti addition gives the (2R,3R) and (2S,3S) enantiomers (racemic mixture, not meso). This distinction between cis- and trans-2-butene bromination (giving different stereoisomers as products) is a classic demonstration of the bromonium mechanism.

### 7.1.4 Hydroboration-Oxidation: Syn, Anti-Markovnikov Addition of Water

**Borane (BH₃)** adds to alkenes by a concerted, four-centered transition state in which B and H add simultaneously to the same face of the double bond (**syn addition**). Regiochemistry: B adds to the less substituted carbon (anti-Markovnikov) because the bulkier B prefers the less hindered carbon. After hydroboration, **oxidation with H₂O₂/NaOH** converts C–B to C–OH with **retention of configuration** at each carbon. The net result over both steps: OH is placed on the less substituted carbon with syn stereochemistry relative to the H that was added — the anti-Markovnikov, syn addition of "water."

Hydroboration-oxidation (developed by H.C. Brown, Nobel Prize 1979) and acid-catalyzed hydration are **complementary** methods: together they give the chemist access to either the Markovnikov or anti-Markovnikov alcohol from any given alkene, with predictable stereochemistry.

### 7.1.5 Oxidation Reactions of Alkenes

Alkenes are oxidized by a variety of reagents to give different products depending on the oxidant and conditions:

**Cold, dilute KMnO₄** (or OsO₄): syn-dihydroxylation — both OH groups added to the same face, giving a cis-1,2-diol. The Mn(VII) or Os(VIII) reagent forms a cyclic osmate/manganate ester with the alkene, then the ester hydrolyzes to the diol with retention at both carbons.

**Hot, concentrated KMnO₄ or ozone (O₃) followed by H₂O₂**: oxidative cleavage — the double bond is broken and both carbons are oxidized. Internal alkenes give two carboxylic acids (or ketones if the carbon had two R substituents). Terminal alkenes give a carboxylic acid (or ketone) plus CO₂ (from the terminal =CH₂, which becomes formaldehyde, then oxidized to CO₂ and H₂O). Ozonolysis followed by reductive workup (DMS, Me₂S) gives aldehydes (not further oxidized). These cleavage reactions are used to determine the position of double bonds in unknown structures by identifying the carbonyl-containing fragments.

---

# Chapter 8: Alcohols and Ethers

## 8.1 Structure and Physical Properties of Alcohols

Alcohols (R–OH) have the hydroxyl group bonded to sp³-hybridized carbon. The O–H bond is strongly polarized (bond dipole ≈ 1.5 D), and oxygen has two lone pairs available for hydrogen bonding both as donor (O–H to acceptor) and acceptor (lone pair from O to donor). This extensive hydrogen bonding raises boiling points dramatically: methanol (bp 65°C, MW 32) vs. ethane (bp −89°C, MW 30). The longer the alkyl chain, the more hydrophobic character dominates and the less water-miscible the alcohol becomes.

Alcohols are amphiprotic — both weakly acidic (donating the O–H proton to strong bases) and weakly basic (accepting a proton on oxygen from strong acids). Their pKₐ values (~16 for primary aliphatic alcohols) make them much weaker acids than water is thought to be (pKₐ 15.7), and secondary and tertiary alcohols are slightly less acidic than primary because the alkyl groups donate electron density to oxygen, making the O–H bond less polar and more reluctant to donate H⁺.

## 8.2 Reactions of Alcohols

**Conversion to alkyl halides:** Primary and secondary alcohols react with HX to give alkyl halides. With HBr or HI, the mechanism is S_N2 for primary and secondary substrates (after protonation of OH to give H₂O as leaving group): R–OH + H–Br → R–OH₂⁺ + Br⁻ → R–Br + H₂O (S_N2). With HCl and tertiary alcohols, or with secondary substrates under strongly acidic conditions, S_N1 intervenes. The Lucas test (ZnCl₂/HCl) exploits these mechanistic differences for qualitative distinction: tertiary alcohols react immediately (fast S_N1, giving turbidity from insoluble RCl), secondary take several minutes (slower S_N1 or S_N2), primary do not react at room temperature (S_N2 too slow for ZnCl₂ activation; HCl without ZnCl₂ is needed).

Thionyl chloride (SOCl₂) with pyridine converts alcohols to alkyl chlorides with **retention** of configuration (through a chlorosulfite intermediate that undergoes internal backside S_Ni attack) or with **inversion** (when pyridine displaces the chlorosulfite in an SN2). SOCl₂ reacts with both primary and secondary alcohols without carbocation formation, avoiding rearrangements. Phosphorus tribromide (PBr₃) similarly converts alcohols to alkyl bromides with inversion.

**Oxidation of alcohols:** Primary alcohols (RCH₂OH) are oxidized by Cr(VI) reagents (CrO₃, Na₂Cr₂O₇/H₂SO₄, PCC — pyridinium chlorochromate, PDC — pyridinium dichromate) to give aldehydes (with mild reagents like PCC in CH₂Cl₂, which cannot further oxidize the aldehyde) or carboxylic acids (with strong Cr(VI) in aqueous acid, which oxidizes the aldehyde further through the hydrate). Secondary alcohols (R₂CHOH) are oxidized by any Cr(VI) reagent to ketones (which cannot be further oxidized). Tertiary alcohols (R₃COH) are not oxidized by Cr(VI) (no α-H available for the mechanism).

The **Swern oxidation** (oxalyl chloride, DMSO, Et₃N at −78°C) and **Dess-Martin periodinane** are modern, mild, selective oxidants for primary and secondary alcohols, particularly useful for sensitive substrates that might not tolerate acidic Cr(VI) conditions.

## 8.3 Ethers: Synthesis and Reactions

Ethers (R–O–R') are generally unreactive under mild conditions. The two most important reactions are **Williamson ether synthesis** (for preparation) and **acid-catalyzed cleavage** (for reactions).

**Williamson synthesis:** Alkoxide ion (R–O⁻, prepared from alcohol + NaH or Na metal) + primary alkyl halide (R'–X) → R–O–R' + X⁻ (S_N2). For unsymmetric ethers, choose the alkoxide from the more sterically hindered alcohol and the primary alkyl halide from the less hindered alcohol: this avoids E2 elimination (which competes with S_N2 for secondary or tertiary alkyl halides with alkoxide base). For example, to make methyl tert-butyl ether: use tert-butoxide (from tert-butanol + NaH) and methyl iodide (methyl is primary, no risk of E2). Using the reverse combination (methoxide + tert-butyl bromide) would give elimination (E2) rather than substitution.

**Acid-catalyzed cleavage:** HI or HBr (strong acid + good nucleophile) cleave ethers. Step 1: protonation of the ether oxygen gives an oxonium ion (R–O⁺H–R', good leaving group). Step 2: nucleophilic attack by I⁻ (S_N2 for primary, S_N1 for tertiary). Cleavage of methyl or primary ethers proceeds rapidly by S_N2 with HI/HBr. Dialkyl ethers give two equivalents of alkyl iodide with excess HI.

---

# Chapter 9: Free Radical Reactions

## 9.1 Radical Chain Mechanisms: Halogenation of Alkanes

Free radical reactions involve species with unpaired electrons (radicals). Unlike carbocations, radicals are neutral and do not form in polar/ionic reactions under ordinary conditions; they are generated by homolysis (using heat or UV light).

**Chlorination of methane (mechanism):**

*Initiation:* Cl–Cl + hν → 2 Cl• (UV homolysis of Cl₂; each Cl atom receives one electron)

*Propagation (the chain-carrying steps):*
- Cl• + CH₄ → HCl + •CH₃ (H abstraction; Cl radical takes a hydrogen from methane, forming a carbon radical)
- •CH₃ + Cl₂ → CH₃Cl + Cl• (halogen abstraction; methyl radical takes a Cl from Cl₂, forming the product chloromethane and regenerating Cl•)

*Termination (combination of two radicals):*
- Cl• + •CH₃ → CH₃Cl
- •CH₃ + •CH₃ → C₂H₆
- Cl• + Cl• → Cl₂

The chain length (number of propagation cycles per initiation event) is typically 10³–10⁵, so termination events are rare relative to propagation.

### 9.1.1 Selectivity: Chlorination vs. Bromination

For the radical halogenation of propane (which gives 1-halopropane from abstraction of primary H, and 2-halopropane from abstraction of secondary H), the selectivity of chlorination vs. bromination differs dramatically:

**Chlorination** at 25°C: primary:secondary = 1:4.5 (per H), corresponding to relative radical stabilities (krel per H): secondary (1.0) vs. primary (0.22). The low selectivity of Cl• arises because the H-abstraction step is highly exothermic for Cl• (BDE of H–Cl ≈ 431 kJ/mol >> BDE of C–H ≈ 410 kJ/mol for secondary C–H), so the TS is early (Hammond's postulate: early TS resembles reactants, stability differences matter less → low selectivity).

**Bromination** at 25°C: primary:secondary ≈ 1:97 (per H). Br• is much more selective because H-abstraction by Br• is endothermic (BDE of H–Br ≈ 366 kJ/mol << BDE of secondary C–H ≈ 410 kJ/mol), giving a late TS that resembles the radical product — the stability of the carbon radical strongly influences the TS energy. Tertiary:secondary:primary relative reactivities for Br• are approximately 1640:82:1.

The synthetic consequence: bromination is regioselective for the most substituted (most stable) radical position; chlorination is not. Bromination of 2-methylpropane gives 2-bromo-2-methylpropane (tert-butyl bromide) almost exclusively. NBS (N-bromosuccinimide) under radical conditions is used for allylic bromination at low Br₂ concentration (avoiding addition to the double bond).

<div class="remark">
The conceptual framework developed in CHEM 264 — resonance and delocalization, the factors controlling acid/base strength, three-dimensional stereochemical analysis, and the competing mechanistic pathways of S_N1/S_N2/E1/E2/radical reactions — is the foundation for all subsequent organic chemistry. Each reaction class is governed by the same principles: electrons flow from nucleophile to electrophile; the most stable intermediate or transition state determines the outcome; steric and electronic effects control regioselectivity and stereoselectivity; and thermodynamic versus kinetic control determines whether the equilibrium product or the fastest-forming product predominates. These principles are not specific to any one reaction but are universal tools for analyzing and predicting the behavior of organic molecules, which will be extended to carbonyl chemistry, aromatic substitution, and multi-step synthesis in CHEM 265.
</div>
