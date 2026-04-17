---
title: "CHEM 265: Organic Chemistry 2"
subjects: "CHEM"
prof: "Julie Goll"
---

## Sources and References
**Primary textbook** — *Organic Chemistry I & II* (Top Hat interactive platform, accessible from CHEM 264 purchase).
**Supplementary texts** — Clayden, J., Greeves, N. & Warren, S. *Organic Chemistry*, 2nd ed. Oxford University Press, 2012. | Silverstein, R.M., Webster, F.X. & Kiemle, D.J. *Spectrometric Identification of Organic Compounds*, 8th ed. Wiley, 2014.
**Online resources** — SDBS Spectral Database for Organic Structure Determination (sdbs.db.aist.go.jp); NIST WebBook (webbook.nist.gov); PubChem (pubchem.ncbi.nlm.nih.gov); Human Metabolome Database (hmdb.ca)

---

# Chapter 1: Spectroscopic Identification of Organic Compounds

## Section 1.1: The Role of Spectroscopy in Structure Elucidation

The determination of the structure of an unknown organic compound is one of the most rewarding intellectual exercises in chemistry. Rather than degrading the compound chemically (the classical approach of the nineteenth century), modern chemists expose a sample to electromagnetic radiation across different regions of the spectrum and interpret the resulting interactions to deduce the molecular structure with remarkable precision. The four principal spectroscopic techniques — **mass spectrometry (MS)**, **infrared spectroscopy (IR)**, **nuclear magnetic resonance spectroscopy (NMR)**, and UV-visible spectroscopy — provide complementary information, and their combined interpretation can often unambiguously establish the complete structure of a molecule.

The strategy for structure elucidation typically follows a logical hierarchy: mass spectrometry establishes the molecular formula and molecular weight; infrared identifies the functional groups present; NMR determines the carbon skeleton and the connectivity of hydrogen-bearing centres. Together these data uniquely specify the structure.

## Section 1.2: Infrared Spectroscopy

### Subsection 1.2.1: Physical Basis of Infrared Absorption

Molecules absorb infrared radiation when the frequency of the radiation matches the frequency of a molecular vibration and when that vibration produces a change in the molecule's **electric dipole moment**. The infrared region spans the wavenumber range 400–4000 cm\(^{-1}\) (recall that wavenumber \( \tilde{\nu} = 1/\lambda \)), a range that encompasses the fundamental vibrational frequencies of most organic functional groups.

A diatomic bond vibrating as a harmonic oscillator has a fundamental frequency

\[ \tilde{\nu}_{\text{vib}} = \frac{1}{2\pi c}\sqrt{\frac{k}{\mu}}, \]

where \( k \) is the **force constant** (a measure of bond stiffness) and \( \mu = m_1 m_2 / (m_1 + m_2) \) is the **reduced mass**. From this equation, two important trends emerge: stronger bonds (larger \( k \)) vibrate at higher frequencies, and heavier atoms (larger \( \mu \)) vibrate at lower frequencies. These trends allow the approximate positions of absorption bands to be predicted qualitatively.

### Subsection 1.2.2: Interpreting the IR Spectrum

An IR spectrum is conventionally divided into two regions with different interpretative functions. The **functional group region** (4000–1500 cm\(^{-1}\)) contains absorptions due to specific functional group vibrations that are diagnostic for the presence of particular bonding environments. The **fingerprint region** (1500–400 cm\(^{-1}\)) contains a complex mixture of overlapping C–C, C–O, C–N, and bending vibrations that give each compound a unique pattern, though this region is difficult to interpret in isolation.

Key diagnostic absorptions in the functional group region include:

The **O–H stretch** of alcohols appears as a broad absorption centered around 3200–3550 cm\(^{-1}\), characteristically broadened by hydrogen bonding. Carboxylic acids display an even broader O–H band (2500–3300 cm\(^{-1}\)) overlapping the C–H stretches. The **N–H stretch** of primary amines appears near 3300–3500 cm\(^{-1}\) as two bands (asymmetric and symmetric N–H stretches); secondary amines show one band.

The **C–H stretches** of saturated carbons appear between 2850 and 3000 cm\(^{-1}\), while the C–H stretches of alkenes (=C–H) and aromatic C–H bonds appear just above 3000 cm\(^{-1}\), and the terminal alkyne C–H stretch is sharp and appears near 3300 cm\(^{-1}\).

The **C=O stretch** is perhaps the single most diagnostic absorption in IR spectroscopy. Its position depends sensitively on the electronic environment of the carbonyl carbon: conjugation with a \( \pi \) system lowers the C=O stretching frequency (as the carbonyl character is partially delocalized), and electron withdrawal raises it. Characteristic positions are: carboxylic acids (~1710–1725 cm\(^{-1}\)), esters (~1735–1750 cm\(^{-1}\)), aldehydes (~1720–1740 cm\(^{-1}\)), ketones (~1705–1725 cm\(^{-1}\)), amides (~1630–1680 cm\(^{-1}\)), and anhydrides (two bands, ~1800 and ~1760 cm\(^{-1}\)).

The **C≡N stretch** of nitriles appears sharply near 2210–2260 cm\(^{-1}\), and the **C≡C stretch** of internal alkynes appears near 2100–2260 cm\(^{-1}\) (but may be absent if the alkyne is symmetric, because then the vibration produces no dipole change).

## Section 1.3: Mass Spectrometry

### Subsection 1.3.1: Principles and Ionization Methods

Mass spectrometry determines the **mass-to-charge ratio** (\( m/z \)) of ions derived from the molecule. In the most common ionization method for small organic molecules — **electron ionization (EI)** — the sample is bombarded by 70 eV electrons, which eject one electron from the molecule to give the **molecular ion** (radical cation) M\(^{+\bullet}\). The \( m/z \) of the molecular ion equals the exact molecular weight of the compound.

For larger, more polar molecules and biomolecules, **electrospray ionization (ESI)** and **matrix-assisted laser desorption/ionization (MALDI)** are preferred because they impart little excess energy and therefore produce intact molecules with minimal fragmentation.

### Subsection 1.3.2: Fragmentation Patterns and the Molecular Ion

The molecular ion M\(^{+\bullet}\) frequently fragments further, producing **fragment ions** whose \( m/z \) values provide structural information. Fragmentation follows predictable pathways governed by the stability of the resulting cationic and radical fragments. Key patterns include:

**Alpha-cleavage** (\( \alpha \)-cleavage) is the most common fragmentation pathway for heteroatom-containing compounds: the bond between the carbon alpha to the heteroatom and the adjacent carbon is cleaved homolytically. For a ketone R–CO–R', alpha cleavage produces acylium ions (R–C\(\equiv\)O\(^+\), very stable) at \( m/z = M - R' \) and/or \( m/z = M - R \). For amines, alpha cleavage gives an iminium ion. The diagnostic base peak (highest-intensity peak) in the spectrum is often the product of this alpha cleavage.

**McLafferty rearrangement** occurs in carbonyl compounds that have a gamma hydrogen: a six-membered cyclic transition state allows the gamma hydrogen to transfer to the carbonyl oxygen while the beta–gamma bond breaks, producing a radical cation of lower mass.

The **isotope pattern** of the molecular ion cluster reveals the molecular formula. Carbon has a \(^{13}\)C isotope at natural abundance 1.1%; for a compound with \( n \) carbons, the (M+1)\(^+\) peak is approximately \( 1.1n \% \) of the M\(^+\) peak. The presence of bromine (nearly equal abundance of \(^{79}\)Br and \(^{81}\)Br) gives a characteristic 1:1 doublet pattern separated by 2 mass units; one chlorine gives a 3:1 pattern.

---

# Chapter 2: Nuclear Magnetic Resonance Spectroscopy

## Section 2.1: Physical Principles of NMR

**Nuclear magnetic resonance** exploits the quantum-mechanical property of **nuclear spin**. Nuclei with an odd number of protons or neutrons possess a non-zero nuclear spin quantum number \( I \). The most important nucleus in organic chemistry is \(^1\)H (proton), which has \( I = 1/2 \), and the next most important is \(^{13}\)C (also \( I = 1/2 \)).

When placed in an external magnetic field \( B_0 \), a nucleus with \( I = 1/2 \) can adopt one of two energy states: the lower-energy **\( \alpha \) state** (spin aligned with the field, \( m_I = +1/2 \)) or the higher-energy **\( \beta \) state** (spin opposed to the field, \( m_I = -1/2 \)). The energy difference between these states is

\[ \Delta E = \gamma \hbar B_0, \]

where \( \gamma \) is the **gyromagnetic ratio** (a nucleus-specific constant). A radio-frequency photon whose energy matches \( \Delta E \) will cause a transition from \( \alpha \) to \( \beta \), absorbing energy — this is the **resonance condition**. The resonant frequency is the **Larmor frequency**: \( \nu_0 = \gamma B_0 / (2\pi) \). For protons in a 400 MHz spectrometer, \( B_0 \approx 9.4 \) T.

## Section 2.2: Chemical Shift

Not all protons resonate at exactly the same frequency. The electrons surrounding each nucleus partially **shield** it from the applied magnetic field, so the effective field experienced by the nucleus is slightly reduced: \( B_{\text{eff}} = B_0(1 - \sigma) \), where \( \sigma \) is the shielding constant. More electron-dense environments produce more shielding and lower resonance frequencies (higher shielding, lower \( \delta \)); electron-withdrawing groups reduce shielding and shift the resonance to higher frequency (higher \( \delta \)).

<div class="definition">
The <strong>chemical shift</strong> \( \delta \) is a dimensionless quantity that measures the resonance frequency of a nucleus relative to a reference standard (tetramethylsilane, TMS, defined as \( \delta = 0 \) ppm for both \(^1\)H and \(^{13}\)C):
\[ \delta = \frac{\nu_{\text{sample}} - \nu_{\text{TMS}}}{\nu_{\text{spectrometer}}} \times 10^6 \, \text{ppm}. \]
Because \( \delta \) is a ratio, it is independent of the spectrometer field strength, allowing spectra acquired at different magnetic fields to be directly compared.
</div>

Characteristic \(^1\)H chemical shift ranges provide powerful diagnostic information. Protons attached to sp\(^3\) carbons (alkyl C–H) typically resonate at \( \delta \) 0.5–3 ppm. The presence of electronegative atoms moves them downfield: \( \alpha \) to a halogen or nitrogen appears at \( \delta \) 2–4 ppm, \( \alpha \) to oxygen at \( \delta \) 3–4 ppm for ethers and \( \delta \) 4–5 ppm for esters. Vinyl and aromatic protons are strongly deshielded by **ring current effects** and anisotropy of the \( \pi \) system: alkene protons appear at \( \delta \) 4.5–6.5 ppm, aromatic protons at \( \delta \) 6.5–8.5 ppm, and aldehyde protons at \( \delta \) 9–10 ppm. The O–H and N–H protons are exchangeable and appear at variable positions depending on concentration, solvent, and temperature.

## Section 2.3: Spin–Spin Coupling

Protons on adjacent (vicinal) carbons influence each other's resonance frequencies through **scalar (J) coupling** transmitted through the intervening bonds. This coupling causes the resonance of each proton to be split into a multiplet whose pattern encodes the number of neighboring protons.

<div class="definition">
The <strong>n+1 rule</strong> (for first-order spectra): a proton coupled to <em>n</em> equivalent neighboring protons appears as a multiplet of \( n+1 \) lines with relative intensities given by the coefficients of \( (1+x)^n \) (Pascal's triangle). One neighbor gives a doublet (1:1), two give a triplet (1:2:1), three give a quartet (1:3:3:1), four give a quintet (1:4:6:4:1), and so on.
</div>

The **coupling constant** \( J \) (in Hz) is the separation between the lines of the multiplet and is independent of the applied magnetic field strength. The vicinal coupling constant \( ^3J_{\text{HH}} \) depends on the dihedral angle \( \phi \) between the two C–H bonds according to the **Karplus equation**: \( ^3J = A\cos^2\phi - B\cos\phi + C \), with \( A \approx 7, B \approx 1, C \approx 5 \) Hz for typical systems. This angular dependence makes vicinal coupling constants extremely useful for determining the three-dimensional structure of organic molecules, and it is one of the most powerful tools in the elucidation of ring conformations and peptide backbone geometry.

The **integration** of NMR signals (the area under each peak) is proportional to the number of protons giving rise to that signal. Together with the chemical shift and the multiplicity, integration provides the information needed to deduce the complete \(^1\)H NMR spectrum.

---

# Chapter 3: Carbonyl Chemistry — Aldehydes and Ketones

## Section 3.1: Structure and Electrophilicity of the Carbonyl Group

The **carbonyl group** (C=O) is the most important functional group in organic chemistry, not only because of its direct reactivity but because it underlies the chemistry of carboxylic acids, esters, amides, and other acyl derivatives. The sp\(^2\) hybridization of the carbonyl carbon gives a planar geometry (120° bond angles) and a \( \pi \) bond formed by overlap of the carbon and oxygen \( p \) orbitals. The C=O \( \pi \) bond is strongly polarized toward the electronegative oxygen, making the carbonyl carbon an **electrophile**.

<div class="definition">
The resonance representation of the carbonyl group captures this polarity: the neutral form C=O (major contributor) resonates with the zwitterionic form \( \mathrm{C}^+-\mathrm{O}^- \) (minor contributor). While the minor contributor describes the true partial charges, it indicates why the carbonyl carbon is susceptible to nucleophilic attack and why the oxygen can act as a Lewis base (proton acceptor).
</div>

**Aldehydes** (R–CHO) are more electrophilic and more reactive toward nucleophilic addition than **ketones** (R–CO–R') for two reasons. First, there are fewer electron-donating alkyl groups on the carbonyl carbon of an aldehyde (only one, vs. two in a ketone), so the carbonyl is less stabilized by hyperconjugation and inductive donation. Second, the nucleophile experiences less steric hindrance when attacking an aldehyde.

## Section 3.2: Nucleophilic Addition Reactions

The hallmark reaction of aldehydes and ketones is **nucleophilic addition** to the carbonyl carbon: the nucleophile attacks the electrophilic carbon from above or below the plane of the carbonyl, breaking the C=O \( \pi \) bond and generating an alkoxide (or protonated immediately to an alcohol) as the product.

**Addition of water** gives a **geminal diol** (hydrate): R\(_2\)C=O + H\(_2\)O \( \rightleftharpoons \) R\(_2\)C(OH)\(_2\). The equilibrium is generally unfavorable for ketones but favorable for electron-poor aldehydes (formaldehyde and chloral are extensively hydrated in aqueous solution). The gem-diol is stabilized by electron-withdrawing groups on the carbonyl carbon because they destabilize the charged carbonyl resonance contributor.

**Addition of alcohols** gives **hemiacetals** (one equivalent) or **acetals** (two equivalents, under acid catalysis with removal of water). Acetal formation is reversible and acid-catalyzed: the carbonyl oxygen is protonated to give an oxocarbenium ion, the alcohol attacks, and proton transfers and loss of water complete the transformation. Acetals are stable under basic conditions and are extensively used as **protecting groups** for aldehydes and ketones in multi-step synthesis, because they can be selectively removed under mild acid conditions at the end of the synthesis.

**Addition of amines** (primary amines R–NH\(_2\)) gives an unstable **hemiaminal** (carbinolamine) intermediate, which loses water under acid catalysis to give an **imine** (Schiff base, R\(_2\)C=NR'). Imines are key intermediates in biological transamination reactions (pyridoxal phosphate chemistry) and in the reductive amination route to amines. Secondary amines (R\(_2\)NH) give **enamines** instead of imines, because the nitrogen has no remaining H to lose after the hemiaminal forms.

**Cyanohydrin formation**: addition of HCN (or \(^-\)CN/HCN in buffer) to an aldehyde or ketone gives a \( \alpha \)-hydroxy nitrile. The nitrile can be hydrolyzed to a carboxylic acid or reduced to an amine, making this reaction a route to \( \alpha \)-hydroxy acids and \( \beta \)-amino alcohols from simple ketones.

## Section 3.3: Alpha-Carbon Chemistry

The protons on the carbon \( \alpha \) to the carbonyl group are significantly more acidic than ordinary C–H protons (typically \( pK_a \approx 20 \) for ketones, compared to \( pK_a \approx 50 \) for alkanes) because the resulting **enolate anion** is stabilized by delocalization of the negative charge onto the electronegative oxygen. This creates the **enolate**, the carbon nucleophile central to much of synthetic organic chemistry.

The **aldol reaction** is the self-condensation (or mixed condensation) of two carbonyl compounds mediated by the enolate of one reacting with the carbonyl of the other. Under basic conditions, an \( \alpha \)-carbon is deprotonated to give an enolate, which then attacks the carbonyl of a second molecule (or the same molecule) to give a \( \beta \)-hydroxy aldehyde or ketone (the aldol product). Under acid catalysis, the enol tautomer is the reactive nucleophile. **Aldol condensation** refers to the further dehydration of the aldol product (facilitated by the extended conjugation of the resulting enone), giving an \( \alpha,\beta \)-unsaturated carbonyl compound.

---

# Chapter 4: Carboxylic Acids and Their Derivatives

## Section 4.1: Carboxylic Acids

**Carboxylic acids** (R–COOH) are unique among carbonyl compounds in their ability to form very strong **intermolecular hydrogen bonds**: two carboxylic acid molecules associate in a head-to-head hydrogen-bonding dimer stabilized by two O–H···O hydrogen bonds, making liquid carboxylic acids have particularly high boiling points for their molecular weight. The O–H stretching band in the IR spectrum of carboxylic acids is notably broad (2500–3300 cm\(^{-1}\)) due to this strong hydrogen bonding.

The \( pK_a \) of simple aliphatic carboxylic acids lies in the range 4–5, reflecting the substantial resonance stabilization of the carboxylate anion, in which the negative charge is delocalized equally over both oxygen atoms. Electron-withdrawing substituents dramatically increase the acidity: \( \alpha \)-fluorocarboxylic acids are stronger acids by several pK units.

Carboxylic acids can be converted to acyl derivatives — acyl chlorides, anhydrides, esters, and amides — by reactions that substitute the –OH with different leaving groups. The **relative reactivity** order of acyl derivatives toward nucleophilic acyl substitution is: acyl chlorides > anhydrides > esters ≈ carboxylic acids > amides >> carboxylate anions. This order reflects both the leaving group ability and the resonance stabilization of the functional group's carbonyl.

## Section 4.2: Nucleophilic Acyl Substitution

The mechanism of reactions at carbonyl carbons in acyl derivatives follows a universal two-step pathway: (1) **nucleophilic addition** to the carbonyl gives a **tetrahedral intermediate** (not a stable compound, but a transition-state-like intermediate); (2) **elimination** of the leaving group from the tetrahedral intermediate regenerates a carbonyl compound. The overall result is substitution at the carbonyl carbon with retention of the C=O.

<div class="definition">
The <strong>tetrahedral intermediate</strong> in nucleophilic acyl substitution is an alkoxide-like species with an sp\(^3\) carbon bearing four different substituents (the original two groups on the acyl carbon, the incoming nucleophile, and the leaving group). It collapses by expelling the weaker base (better leaving group) to give the product.
</div>

**Ester hydrolysis** illustrates the mechanism clearly. Under basic conditions (saponification), hydroxide ion attacks the ester carbonyl to give a tetrahedral intermediate; the alkoxide departs to give a carboxylate and an alcohol. The reaction is irreversible because the carboxylate is resonance-stabilized and too basic to re-attack the ester. Under acid conditions, the mechanism is similar but involves protonation of the carbonyl oxygen before nucleophilic attack of water.

**Amide bond formation** is thermodynamically favorable (amides are more stable than esters of similar structure) but kinetically slow because the nitrogen lone pair stabilizes the carbonyl through resonance, reducing its electrophilicity. In biological systems, amide (peptide) bonds are formed at the ribosome with the help of activation at the carboxylic acid (as an aminoacyl-tRNA ester). In synthetic chemistry, acyl chlorides or anhydrides react readily with amines to form amides because the better leaving group (Cl\(^-\) or carboxylate) makes the carbonyl highly reactive.

---

# Chapter 5: Conjugated Systems and Aromatic Compounds

## Section 5.1: Conjugated Dienes

When two or more \( \pi \) systems are separated by a single bond, the result is a **conjugated** system in which the \( \pi \) electrons are delocalized over all the contributing atoms. The molecular orbital treatment of 1,3-butadiene gives four \( \pi \) MOs: \( \psi_1 \) (all bonding, lowest energy), \( \psi_2 \) (one node, HOMO), \( \psi_3 \) (two nodes, LUMO), and \( \psi_4 \) (three nodes, highest energy). Conjugation stabilizes the ground state (delocalization energy) and dramatically affects photochemical and thermal reactivity.

The **Diels–Alder reaction** is the premier reaction of conjugated dienes: a [4+2] cycloaddition between a **diene** (the 4\( \pi \) component) and a **dienophile** (the 2\( \pi \) component, typically an electron-poor alkene activated by a carbonyl or cyano group). The diene must be in the **s-cis conformation** for the reaction to proceed (the \( s \)-cis conformer allows the two terminal carbons of the diene to reach the two carbons of the dienophile simultaneously). The reaction is **stereospecific**: substituents that are cis on the dienophile end up cis in the product (**syn addition** to the dienophile), and the endo product — where the bulky electron-withdrawing group of the dienophile points toward the diene — is kinetically preferred (endo rule).

## Section 5.2: Aromaticity

**Aromaticity** is the exceptional stability of cyclic conjugated \( \pi \) systems that satisfy **Hückel's rule**: a planar, monocyclic, conjugated system is aromatic if it contains \( 4n + 2 \) \( \pi \) electrons (where \( n = 0, 1, 2, \ldots \)). Benzene (\( 6\pi \) electrons, \( n = 1 \)) is the archetypal aromatic compound, with a resonance stabilization energy of approximately 150 kJ mol\(^{-1}\) relative to three hypothetical isolated double bonds. Cyclopentadienyl anion (\( 6\pi \)), cycloheptatrienyl cation (tropylium, \( 6\pi \)), and naphthalene (\( 10\pi \)) are further examples. Antiaromatic compounds contain \( 4n \) \( \pi \) electrons and are strongly destabilized relative to the acyclic analogues.

## Section 5.3: Electrophilic Aromatic Substitution

The high \( \pi \) electron density of the aromatic ring makes it an excellent nucleophile toward electrophiles, but unlike simple alkenes (which undergo addition), benzene undergoes **substitution**, because this preserves the aromatic system. The general mechanism for **electrophilic aromatic substitution (EAS)** has two steps: (1) attack of the electrophile E\(^+\) on the \( \pi \) system gives the **arenium ion** (sigma complex or Wheland intermediate) — a cyclohexadienyl cation in which the ipso carbon has become sp\(^3\) and aromaticity is lost; (2) loss of a proton from the ipso carbon restores aromaticity and gives the substitution product.

**Substituent effects** on EAS are crucial to understanding the regioselectivity of the reaction. Substituents already on the ring are classified as **activators** (which make the ring more reactive than benzene) or **deactivators** (which make it less reactive). Activators are **ortho/para directors** — they direct the incoming electrophile to the ortho and para positions relative to themselves. Deactivators are mostly **meta directors**, with the exception of halogens (which are deactivating but ortho/para directing). The mechanistic explanation uses the relative stabilities of the arenium ion intermediates: substituents that can donate electron density by resonance directly to the ortho and para positions of the arenium ion stabilize those intermediates and therefore accelerate attack at those positions.

Important EAS reactions include **nitration** (electrophile: NO\(_2^+\), generated from HNO\(_3\)/H\(_2\)SO\(_4\)), **halogenation** (electrophile: Br\(^+\) or Cl\(^+\), generated using a Lewis acid catalyst such as FeBr\(_3\)), **sulfonation** (electrophile: SO\(_3\)), **Friedel–Crafts alkylation** (electrophile: a carbocation generated from R–Cl and AlCl\(_3\)), and **Friedel–Crafts acylation** (electrophile: an acylium ion R–CO\(^+\) from an acyl chloride and AlCl\(_3\)).

---

# Chapter 6: Amines

## Section 6.1: Structure and Properties

**Amines** are organic derivatives of ammonia in which one, two, or three of the N–H bonds have been replaced by N–C bonds. They are classified as **primary** (RNH\(_2\)), **secondary** (R\(_2\)NH), or **tertiary** (R\(_3\)N), depending on the number of carbon substituents on nitrogen. The nitrogen in a simple aliphatic amine is sp\(^3\)-hybridized with a lone pair occupying the fourth tetrahedral position. The nitrogen is a pyramidal centre and, in principle, a chiral amine should exist as two enantiomers — in practice, however, **nitrogen inversion** (the umbrella flipping of the three substituents through a planar transition state) is rapid at room temperature, interconverting the two enantiomers and precluding isolation.

The **basicity** of amines (their ability to accept a proton on the lone pair of nitrogen) is the defining chemical property that distinguishes them from most other organic functional groups. Simple aliphatic amines have \( pK_{aH} \approx 10{-}11 \) (their conjugate acid, the ammonium salt, has a \( pK_a \) of 10–11), making them moderate bases. Aromatic amines (anilines) are far weaker bases (\( pK_{aH} \approx 4{-}5 \)) because the nitrogen lone pair is delocalized into the aromatic ring by resonance, reducing its availability for proton acceptance.

## Section 6.2: Reactions of Amines

Amines react as **nucleophiles** (using the nitrogen lone pair) in a wide variety of transformations. They undergo alkylation (reaction with alkyl halides via S\(_N\)2), acylation (reaction with acyl chlorides or anhydrides to give amides), and condensation with aldehydes and ketones (to give imines or enamines, as discussed in Chapter 3). The **Hofmann elimination** of quaternary ammonium salts (heated with AgOH) gives the less substituted alkene selectively (Hofmann product), complementing Zaitsev's rule of ordinary amine reactions.

**Diazotization** of primary aromatic amines is a particularly important transformation: reaction of ArNH\(_2\) with NaNO\(_2\)/HCl at 0–5°C gives an **aryldiazonium salt** (Ar–N\(\equiv^+\)N Cl\(^-\)), which is stable at low temperature but highly reactive. Diazonium salts are versatile intermediates: they undergo the **Sandmeyer reaction** (replacement of –N\(_2^+\) by CN\(^-\), Cl\(^-\), Br\(^-\), or I\(^-\) using appropriate copper catalysts), coupling with activated aromatic rings to give **azo dyes** (Ar–N=N–Ar'), and reduction to give aromatic hydrazines.
