---
title: "CHEM 265: Organic Chemistry 2"
subjects: CHEM
prof: Julie Goll
---

## Sources and References

**Primary textbook** — Clayden, Greeves & Warren, *Organic Chemistry* (2nd ed., Oxford University Press, 2012)
**Supplementary texts** — McMurry, *Organic Chemistry* (9th ed.); Klein, *Organic Chemistry* (3rd ed., Wiley)
**Online resources** — MIT OCW 5.12 Organic Chemistry I lecture notes; Khan Academy Organic Chemistry; Master Organic Chemistry (masterorganicchemistry.com)

---

# Chapter 1: Spectroscopic Methods — IR and Mass Spectrometry

## 1.1 Introduction to Infrared Spectroscopy

Infrared (IR) spectroscopy is one of the most powerful and routinely used techniques for identifying functional groups in organic molecules. The method exploits the fact that covalent bonds in molecules vibrate at characteristic frequencies. When infrared radiation of the appropriate frequency is incident on a molecule, the bond absorbs that radiation and transitions to a higher vibrational energy state. The absorbed frequencies appear as dips in a transmission spectrum plotted against wavenumber \( \tilde{\nu} \) (cm\(^{-1}\)), where wavenumber is the reciprocal of wavelength and is directly proportional to energy. The typical IR spectrum spans from approximately 4000 cm\(^{-1}\) down to 400 cm\(^{-1}\).

### 1.1.1 Molecular Vibrations

Bonds in molecules undergo two fundamental classes of vibration. **Stretching vibrations** involve periodic changes in the bond length along the bond axis, and can be either symmetric (both atoms move in opposite directions along the axis simultaneously) or asymmetric. **Bending vibrations** involve changes in bond angles, and include in-plane rocking and scissoring motions as well as out-of-plane wagging and twisting. Stretching vibrations generally appear at higher wavenumbers than bending vibrations of the same bond because stretching requires more energy.

The frequency of a vibrational mode depends on two factors: the force constant of the bond (a measure of bond stiffness) and the masses of the atoms involved. The relationship is analogous to a simple harmonic oscillator:

\[
\tilde{\nu} = \frac{1}{2\pi c} \sqrt{\frac{k}{\mu}}
\]

where \( k \) is the force constant and \( \mu \) is the reduced mass \( \mu = \frac{m_1 m_2}{m_1 + m_2} \). This equation predicts that stronger bonds (larger \( k \)) absorb at higher wavenumbers, and bonds involving lighter atoms (smaller \( \mu \)) also absorb at higher wavenumbers. Thus C≡C and C≡N triple bonds absorb near 2200 cm\(^{-1}\), C=O and C=C double bonds near 1600–1750 cm\(^{-1}\), and C–H single bonds near 2850–3000 cm\(^{-1}\).

### 1.1.2 IR-Active Bonds and the Dipole Requirement

Not all vibrational modes are IR-active. For a vibration to absorb IR radiation, the vibration must cause a change in the **dipole moment** of the molecule. Symmetric stretches of highly symmetric molecules — such as the symmetric C=C stretch in ethylene when both ends are equivalent — are IR-inactive or very weakly active. In contrast, polar bonds such as C=O, O–H, N–H, and C–F are strongly IR-active because their vibrations produce large oscillating dipoles. The intensity of an IR absorption is proportional to the square of the change in dipole moment during the vibration.

### 1.1.3 The Two Principal Spectral Regions

The IR spectrum is conventionally divided into two diagnostic regions. The **fingerprint region** (500–1500 cm\(^{-1}\)) contains a complex array of overlapping stretches and bends that are highly specific to the entire molecular structure. While difficult to interpret bond-by-bond, the fingerprint region is invaluable for confirming that two samples are identical compounds by direct comparison. The **functional group region** (1500–4000 cm\(^{-1}\)) contains absorptions that are characteristic of specific bond types and is the primary region used for functional group identification.

### 1.1.4 Key Diagnostic Absorptions

The following table summarizes the most important IR absorptions encountered in CHEM 265:

| Bond / Functional Group | Wavenumber (cm\(^{-1}\)) | Appearance |
|---|---|---|
| O–H (alcohol) | 3200–3550 | Broad, strong |
| O–H (carboxylic acid) | 2500–3300 | Very broad, strong |
| N–H (primary amine, 2 bands) | 3300–3500 | Medium, two peaks |
| N–H (secondary amine, 1 band) | 3310–3350 | Medium, one peak |
| C–H (sp\(^3\)) | 2850–2960 | Medium to strong |
| C–H (sp\(^2\), alkene/arene) | 3000–3100 | Medium |
| C–H (sp, terminal alkyne) | ~3300 | Strong, sharp |
| C≡C (alkyne) | 2100–2260 | Variable |
| C≡N (nitrile) | 2200–2260 | Strong, sharp |
| C=O (aldehyde) | 1720–1740 | Very strong |
| C=O (ketone) | 1705–1725 | Very strong |
| C=O (carboxylic acid) | 1700–1725 | Very strong |
| C=O (ester) | 1730–1750 | Very strong |
| C=O (amide) | 1630–1690 | Strong |
| C=O (acid chloride) | 1790–1815 | Very strong |
| C=C (alkene) | 1620–1680 | Variable |
| C–O (ester, two bands) | 1000–1300 | Strong |

The carbonyl stretching frequency is one of the most diagnostic signals in organic chemistry. A carbonyl adjacent to an electronegative atom (as in esters and acid chlorides) absorbs at higher wavenumbers because the inductive withdrawal of electron density increases the force constant. Conjugation with a C=C or an aromatic ring lowers the carbonyl frequency by approximately 20–40 cm\(^{-1}\) due to resonance delocalization that reduces the bond order of C=O.

### 1.1.5 Interpretation Strategy

A systematic approach to IR interpretation involves first scanning the functional group region for diagnostic signals. The presence or absence of a broad O–H absorption indicates whether an alcohol or carboxylic acid is present. The carbonyl region near 1700–1750 cm\(^{-1}\) is examined next; the precise position distinguishes ester from ketone from amide. N–H absorptions in the 3300–3500 cm\(^{-1}\) range indicate an amine or amide. After functional group identification, the fingerprint region can be compared with reference spectra for confirmation.

## 1.2 Mass Spectrometry

**Mass spectrometry (MS)** determines the molecular mass of a compound and provides structural information through characteristic fragmentation patterns. In a mass spectrometer, molecules are ionized, accelerated through a magnetic or electric field, and separated according to their mass-to-charge ratio \( m/z \). The resulting spectrum plots relative abundance versus \( m/z \).

### 1.2.1 Electron Ionization and the Molecular Ion

In **electron ionization (EI)**, high-energy electrons (typically 70 eV) bombard the vaporized sample, ejecting an electron from the molecule to produce a radical cation:

\[
M + e^- \rightarrow M^{+\bullet} + 2e^-
\]

The **molecular ion** \( M^{+\bullet} \) retains the same mass as the neutral molecule and appears at the highest \( m/z \) in the spectrum (excluding isotope peaks). Its mass corresponds directly to the molecular weight of the compound. The **base peak** is the most abundant ion in the spectrum (assigned relative abundance of 100%) and corresponds to the most stable fragment produced.

### 1.2.2 Isotope Patterns

Natural isotope abundances create characteristic patterns in mass spectra. Carbon exists as \( ^{12} \)C (98.9%) and \( ^{13} \)C (1.1%), producing an M+1 peak of approximately 1.1% per carbon atom. Chlorine exists as \( ^{35} \)Cl (75.8%) and \( ^{37} \)Cl (24.2%), producing an M+2 peak approximately one-third the height of the M peak, giving a distinctive 3:1 doublet. Bromine exists as \( ^{79} \)Br (50.7%) and \( ^{81} \)Br (49.3%), producing an M:M+2 ratio of approximately 1:1, giving a distinctive pair of equal-height peaks. These isotope patterns are unmistakable diagnostic indicators for the presence of chlorine or bromine.

### 1.2.3 Fragmentation Patterns

The excess energy deposited during EI causes the molecular ion to undergo **fragmentation** into smaller ions. Understanding common fragmentation pathways allows the chemist to deduce connectivity from the spectrum. **Alpha cleavage** (\( \alpha \)-cleavage) involves homolytic bond cleavage adjacent to a heteroatom or \( \pi \) system. The radical stabilization at the heteroatom drives the cleavage. For example, in aldehydes and ketones, cleavage of the bond adjacent to the carbonyl produces acylium ions (\( R\text{-}C\equiv O^+ \)) that are particularly stable. The **McLafferty rearrangement** occurs in carbonyl compounds possessing a \( \gamma \)-hydrogen: a six-membered cyclic transition state allows hydrogen transfer to the carbonyl oxygen with simultaneous \( \beta \)-cleavage, producing a neutral alkene and an enol radical cation. The **retro Diels-Alder** fragmentation is diagnostic for cyclohexene-containing structures, where the ring undergoes a retro [4+2] process to give a diene and a dienophile fragment.

### 1.2.4 The Nitrogen Rule

The **nitrogen rule** states that a compound containing an odd number of nitrogen atoms will have an odd molecular ion mass. Compounds with zero or an even number of nitrogens have even-numbered molecular weights. This is a rapid diagnostic: if \( M^{+\bullet} \) is an odd number, the compound contains one (or three, etc.) nitrogen atoms.

### 1.2.5 Degrees of Unsaturation

The **degree of unsaturation (DoU)** (also called index of hydrogen deficiency) quantifies the number of rings and \( \pi \) bonds in a molecular formula. For a compound with molecular formula \( C_c H_h N_n X_x O_o \) (where X = halogen):

\[
DoU = \frac{2C + 2 + N - H - X}{2}
\]

Oxygen and sulfur do not appear in the formula because they contribute two bonds without changing the hydrogen count. Each degree of unsaturation represents one ring or one \( \pi \) bond. A DoU of 4 or greater strongly suggests an aromatic ring. A DoU of 1 for a compound showing a carbonyl in the IR confirms a simple acyclic carbonyl compound with no rings or additional \( \pi \) bonds.

---

# Chapter 2: NMR Spectroscopy

## 2.1 Principles of Nuclear Magnetic Resonance

**Nuclear magnetic resonance (NMR) spectroscopy** is the single most informative spectroscopic technique available for determining the structure of organic molecules. It exploits the quantum mechanical property of nuclear spin. Nuclei with a spin quantum number \( I = \frac{1}{2} \) (spin-half nuclei) possess two possible energy states in an external magnetic field \( B_0 \): the alpha state (spin aligned with the field, lower energy) and the beta state (spin opposed to the field, higher energy). The energy gap between these states is:

\[
\Delta E = \frac{h \gamma B_0}{2\pi}
\]

where \( \gamma \) is the **gyromagnetic ratio**, a nucleus-specific constant. At the resonance frequency (the **Larmor frequency**), a radiofrequency pulse tips the net magnetization into the transverse plane; as it relaxes back, it induces a detectable signal. The two most important spin-half nuclei in organic chemistry are \( ^1 \)H (proton NMR) and \( ^{13} \)C (carbon NMR).

## 2.2 Chemical Shift

The **chemical shift** \( \delta \) (measured in parts per million, ppm) reflects the precise resonance frequency of a given nucleus relative to a standard reference. The standard reference is **tetramethylsilane (TMS)**, assigned \( \delta = 0 \) ppm, which provides a single sharp peak well away from most organic signals.

The chemical shift is determined by **shielding**: the electrons surrounding a nucleus create a small magnetic field that opposes \( B_0 \), reducing the effective field experienced by the nucleus. Shielded nuclei resonate at lower \( \delta \) values (upfield). Electron-withdrawing groups, anisotropic effects from \( \pi \) systems, and adjacent electronegative atoms all reduce electron density around a proton, causing **deshielding** and a shift to higher \( \delta \) values (downfield).

### 2.2.1 Typical H-1 Chemical Shifts

| Proton Environment | Approximate \( \delta \) (ppm) |
|---|---|
| TMS reference | 0.00 |
| Alkyl (CH\(_3\), CH\(_2\), CH) | 0.8–1.5 |
| Allylic (C=C–CH) | 1.6–2.0 |
| Benzylic (Ar–CH) | 2.2–2.5 |
| Alpha to carbonyl | 2.1–2.6 |
| Alkynyl (terminal C–H) | 1.8–3.1 |
| C–O (ether, alcohol) | 3.2–3.8 |
| Alkene (=CH) | 4.5–6.5 |
| Aromatic | 6.5–8.5 |
| Aldehyde | 9.4–10.0 |
| Carboxylic acid | 10.0–12.0 |

The aldehyde proton is particularly deshielded because it sits directly on the carbonyl carbon, experiencing both the inductive withdrawal of the oxygen and the anisotropy of the C=O \( \pi \) bond. Carboxylic acid OH protons appear very far downfield (10–12 ppm) due to hydrogen bonding in addition to the deshielding effect of the adjacent carbonyl.

## 2.3 Integration and Equivalent Protons

The area under each NMR peak (the **integral**) is directly proportional to the number of protons producing that signal. Protons that are **chemically equivalent** — related by a symmetry operation of the molecule — give a single signal. Integration ratios give the relative (not absolute) number of each type of proton. If the molecular formula is known, absolute proton counts can be assigned.

## 2.4 Spin-Spin Coupling

**Spin-spin coupling** (scalar coupling, J-coupling) arises because the spin of one nucleus is transmitted through bonding electrons to adjacent nuclei, slightly splitting their resonance frequencies. The result is the splitting of NMR signals into **multiplets**. The magnitude of the splitting is the **coupling constant** \( J \) (measured in Hz), which is independent of the magnetic field strength, unlike chemical shift.

### 2.4.1 The n+1 Rule

For a proton (or set of equivalent protons) coupled to \( n \) equivalent neighboring protons, the signal is split into \( n+1 \) lines with intensities following Pascal's triangle. A proton with no neighbors appears as a **singlet**; with one neighbor, a **doublet** (1:1); with two equivalent neighbors, a **triplet** (1:2:1); with three equivalent neighbors, a **quartet** (1:3:3:1). This rule applies strictly under **first-order conditions**, which require that the chemical shift difference between coupled protons (in Hz) greatly exceeds their coupling constant.

### 2.4.2 Coupling Constants

The **vicinal coupling constant** \( ^3 J_{HH} \) for protons on adjacent sp\(^3\) carbons is typically 6–8 Hz in freely rotating systems. The **geminal coupling constant** \( ^2 J_{HH} \) for protons on the same carbon varies widely (0–18 Hz) depending on hybridization and substituents. **Long-range coupling** over four or more bonds is generally small (less than 3 Hz) and observed mainly in rigid or \( \pi \)-containing systems. The **Karplus relationship** describes how \( ^3 J \) depends on the dihedral angle between the two C–H bonds: coupling is largest (~10 Hz) when the dihedral is 0° or 180°, and smallest (~0 Hz) when the dihedral is 90°.

## 2.5 C-13 NMR Spectroscopy

**C-13 NMR** provides a signal for each unique carbon atom in the molecule. Because \( ^{13} \)C has a natural abundance of only 1.1%, the probability of two adjacent \( ^{13} \)C nuclei is negligible, so carbon-carbon coupling is not observed. In **broadband-decoupled** (proton-decoupled) \( ^{13} \)C NMR, all H–C coupling is eliminated by continuous irradiation at the proton frequency, giving a spectrum of single lines. Each chemically distinct carbon appears as one line, making \( ^{13} \)C ideal for counting unique carbons.

### 2.5.1 DEPT

The **DEPT (Distortionless Enhancement by Polarization Transfer)** experiment distinguishes CH, CH\(_2\), and CH\(_3\) carbons. In DEPT-135, CH and CH\(_3\) carbons appear as positive peaks, CH\(_2\) carbons appear as negative peaks, and quaternary carbons give no signal. DEPT is therefore essential for carbon type assignment.

## 2.6 Two-Dimensional NMR

**COSY (Correlation Spectroscopy)** is a 2D \( ^1 \)H–\( ^1 \)H experiment displaying a diagonal line of normal proton peaks with off-diagonal **cross-peaks** connecting protons that are coupled to each other. COSY maps the connectivity of the carbon skeleton through vicinal H–H coupling. **HSQC (Heteronuclear Single Quantum Coherence)** is a 2D experiment correlating each proton with the carbon to which it is directly bonded, providing direct \( ^1 \)H–\( ^{13} \)C one-bond connectivity information. Together, COSY and HSQC allow complete assignment of complex molecules.

## 2.7 Structure Elucidation Strategy

A systematic approach to structure elucidation from spectral data integrates all available information. Begin with the molecular formula to calculate DoU. Next, examine the mass spectrum for the molecular ion and major fragments. Interpret IR for functional groups, focusing on the carbonyl region and the O–H / N–H region. Then analyze \( ^1 \)H NMR: identify the number of chemically distinct proton environments, their chemical shifts (to assign functional group context), integrations (to count protons), and coupling patterns (to identify adjacent protons). Assign \( ^{13} \)C signals. Assemble fragments identified from each technique into a consistent proposed structure, verifying that all data are mutually consistent.

<div class="remark">
<strong>Remark:</strong> In CHEM 265, the most common error in NMR interpretation is misapplying the n+1 rule when protons on adjacent carbons are <em>not</em> equivalent to each other. When a CH<sub>2</sub> group is flanked on one side by a CH and on the other by a CH<sub>3</sub>, the CH<sub>2</sub> signal is split by both neighbors. In a first-order system with different coupling constants, the result is a doublet of quartets, not a simple quintet.
</div>

---

# Chapter 3: Aldehydes and Ketones

## 3.1 Structure and Nomenclature

**Aldehydes** contain a carbonyl group at the terminus of a carbon chain (–CHO), while **ketones** have the carbonyl group between two carbon substituents (R–CO–R'). In IUPAC nomenclature, aldehydes are named by replacing the terminal -e of the parent alkane with **-al** (e.g., ethanal, propanal, benzaldehyde). Ketones replace -e with **-one** (e.g., propanone, pentan-2-one). Common names are frequently used: formaldehyde (methanal), acetaldehyde (ethanal), acetone (propanone), benzaldehyde.

## 3.2 The Carbonyl Group: Reactivity

The carbonyl group (C=O) is the defining reactive feature of aldehydes and ketones. The oxygen is significantly more electronegative than carbon, creating a large **bond dipole** with partial negative charge on oxygen and partial positive charge on carbon. This electrophilic carbonyl carbon is susceptible to attack by nucleophiles. The \( \pi \) bond of the carbonyl is weaker than the \( \sigma \) bond and more accessible, so nucleophiles add across the C=O \( \pi \) bond. The key resonance contributor places a formal positive charge on carbon and negative charge on oxygen, reinforcing the electrophilicity of carbon.

### 3.2.1 General Nucleophilic Addition Mechanism

Nucleophilic addition to a carbonyl proceeds through a **tetrahedral intermediate**. In the first step, the nucleophile attacks the electrophilic carbonyl carbon, converting the sp\(^2\) carbonyl carbon to an sp\(^3\) alkoxide intermediate. In the second step, protonation of the alkoxide (by solvent, acid catalyst, or proton transfer) gives the alcohol product. The overall process converts C=O (planar, sp\(^2\)) to C–OH (tetrahedral, sp\(^3\)).

Aldehydes are more reactive than ketones toward nucleophilic addition for two reasons: steric and electronic. Aldehydes have only one alkyl substituent attached to the carbonyl carbon, while ketones have two, creating more steric hindrance to nucleophilic approach. Electronically, alkyl groups are weakly electron-donating by hyperconjugation, slightly destabilizing the partial positive charge on the carbonyl carbon; two alkyl groups (in ketones) reduce electrophilicity more than one (in aldehydes).

## 3.3 Hydration and Hemiacetal/Acetal Formation

### 3.3.1 Hydration: Gem-Diol Formation

Water is a nucleophile and adds reversibly to aldehydes and ketones to form **gem-diols** (also called hydrates). The equilibrium strongly favors the carbonyl form for most aldehydes and ketones, but formaldehyde is extensively hydrated in aqueous solution (>99% gem-diol) due to its minimal steric bulk and highly electrophilic carbonyl. Acetone, by contrast, is only about 0.1% hydrated at equilibrium.

### 3.3.2 Hemiacetal and Acetal Formation

Alcohols add to aldehydes and ketones under acid catalysis in a stepwise process. In the first step, the alcohol adds to give a **hemiacetal** (R–CH(OH)(OR')). In the second step, acid protonates the hydroxyl group, converting it to a good leaving group (water), and a second equivalent of alcohol attacks the resulting oxocarbenium ion to give an **acetal** (R–CH(OR')\(_2\)). The overall transformation is acid-catalyzed, proceeds through an oxocarbenium ion intermediate, and is reversible under aqueous acidic conditions. Under anhydrous conditions, the acetal is stable to base, making it an excellent **protecting group** for carbonyl compounds. Cyclic acetals formed from diols (e.g., ethylene glycol) are particularly stable due to the entropic advantage of the intramolecular second alcohol attack.

## 3.4 Imine and Enamine Formation

### 3.4.1 Imine Formation with Primary Amines

**Primary amines** (R–NH\(_2\)) add to aldehydes and ketones to give **imines** (also called Schiff bases, R–CH=NR'). The mechanism involves nucleophilic addition of the amine nitrogen to the carbonyl carbon, giving a **hemiaminal** (carbinolamine) intermediate, followed by acid-catalyzed dehydration. The reaction is pH-dependent: at very low pH, the amine is fully protonated and unreactive; at very high pH, the dehydration step is slow. Optimal conditions are mildly acidic (pH 4–5), which maintains a sufficient concentration of free amine while activating the hemiaminal for dehydration.

### 3.4.2 Enamine Formation with Secondary Amines

**Secondary amines** (R\(_2\)NH) add to aldehydes and ketones similarly to give the hemiaminal intermediate, but dehydration yields an **enamine** (R\(_2\)N–CR'=CR''R''') rather than an imine, because no N–H bond is available to form the imine C=N. Enamines are nucleophilic at the beta-carbon and serve as useful synthetic equivalents of enolates.

## 3.5 The Wittig Reaction

The **Wittig reaction** converts a carbonyl compound to an alkene by reaction with a **phosphonium ylide**. Phosphonium ylides are prepared by treating a phosphonium salt (R\(_3\)P\(^+\)–CH\(_2\)R', prepared from triphenylphosphine and an alkyl halide) with a strong base (e.g., n-BuLi or NaH). The ylide carbon, bearing adjacent phosphorus, is nucleophilic due to carbanion character stabilized by the phosphorus d-orbitals.

The mechanism proceeds through a four-membered **oxaphosphetane** intermediate formed by [2+2] cycloaddition of the ylide with the carbonyl. The oxaphosphetane then undergoes a retro [2+2] elimination to give the alkene and triphenylphosphine oxide (Ph\(_3\)P=O), which is the thermodynamic driving force due to the very strong P=O bond.

**Stereoselectivity:** Non-stabilized ylides (alkyl substituents on the ylide carbon) give predominantly the **Z (cis) alkene** via the cis-oxaphosphetane intermediate under standard conditions. Stabilized ylides (carbonyl or vinyl groups on the ylide carbon, which delocalize the carbanion) give predominantly the **E (trans) alkene** via the more stable trans-oxaphosphetane. The Wittig reaction is highly valuable because it establishes the exact position of the double bond — there is no ambiguity about regiochemistry, unlike elimination reactions.

## 3.6 Reductions of Aldehydes and Ketones

**Sodium borohydride (NaBH\(_4\))** is a mild, selective reducing agent that reduces aldehydes and ketones to primary and secondary alcohols, respectively, in protic solvents (methanol, ethanol). It does not reduce esters, amides, carboxylic acids, or isolated C=C double bonds under standard conditions. The hydride (H\(^-\)) is delivered from boron to the electrophilic carbonyl carbon.

**Lithium aluminum hydride (LiAlH\(_4\))** is a powerful reducing agent capable of reducing essentially all carbonyl-containing functional groups, including esters, amides, carboxylic acids, and nitriles, in addition to aldehydes and ketones. It must be used in dry aprotic solvents (diethyl ether, THF) because it reacts violently with water. Aqueous workup after reaction yields the alcohol product.

## 3.7 Baeyer-Villiger Oxidation

The **Baeyer-Villiger oxidation** converts ketones to esters (and aldehydes to formate esters) using a **peracid** (e.g., mCPBA, peracetic acid). The reaction proceeds through a **Criegee intermediate** (a tetrahedral adduct of the peracid oxygen with the carbonyl carbon), followed by a 1,2-migration in which one of the alkyl groups migrates to oxygen as the O–O bond breaks. The **migratory aptitude** of groups follows: tertiary > cyclohexyl > secondary > aryl > primary > methyl. The group with the greatest ability to stabilize positive charge migrates preferentially.

## 3.8 The Aldol Condensation

The **aldol reaction** is one of the most important carbon-carbon bond-forming reactions in organic chemistry. Under basic conditions, an alpha-carbon of an aldehyde or ketone is deprotonated to give an **enolate**, which then adds to the carbonyl carbon of a second molecule of the same (or different) carbonyl compound. The product is a beta-hydroxy carbonyl compound (**aldol product**). Heating the aldol product under acidic or basic conditions promotes **dehydration** to give an alpha,beta-unsaturated carbonyl compound (**aldol condensation product**). The condensation product is stabilized by conjugation of the C=C with the C=O.

The **directed aldol reaction** using **LDA (lithium diisopropylamide)** at –78°C generates the kinetic enolate quantitatively and irreversibly (LDA is a hindered, non-nucleophilic strong base, pKa ~36). This allows cross-aldol reactions between different carbonyl compounds with controlled regioselectivity and often high stereoselectivity.

<div class="example">
<strong>Example — Aldol Condensation:</strong> Treatment of acetaldehyde (ethanal) with dilute NaOH gives 3-hydroxybutanal (the aldol product). On heating, water is eliminated to give but-2-enal (crotonaldehyde), an <em>alpha,beta</em>-unsaturated aldehyde with the characteristic <em>trans</em> configuration due to thermodynamic control.
</div>

---

# Chapter 4: Carboxylic Acids and Derivatives

## 4.1 Carboxylic Acids: Structure and Acidity

**Carboxylic acids** (R–COOH) owe their acidity (\( \text{p}K_a \approx 4.5\text{–}5 \)) primarily to the **resonance stabilization** of the carboxylate anion (R–COO\(^-\)), in which the negative charge is delocalized over both oxygen atoms equally. The two equivalent C–O bonds in the carboxylate (bond order 1.5) are shorter than a normal C–O single bond. Inductive effects also modulate acidity: electron-withdrawing groups (e.g., halogens, carbonyl groups) in the alpha position stabilize the negative charge by induction and increase acidity significantly. For example, trichloroacetic acid (CCl\(_3\)COOH) has \( \text{p}K_a \approx 0.7 \), vastly more acidic than acetic acid (\( \text{p}K_a \approx 4.75 \)).

## 4.2 Relative Reactivity of Carboxylic Acid Derivatives

**Carboxylic acid derivatives** share the common feature of an acyl group (RC=O) with a leaving group attached to the carbonyl carbon. Their reactivity toward nucleophilic acyl substitution follows the leaving group ability. The order of reactivity is:

\[
\text{acid chloride} > \text{anhydride} > \text{ester} \approx \text{thioester} > \text{amide}
\]

This order reflects the relative stability (and thus leaving group ability) of the departing group: Cl\(^-\) is an excellent leaving group (conjugate acid HCl, \( \text{p}K_a \approx -7 \)); carboxylate is a reasonable leaving group; alkoxide is poor; amide ion is the worst. The overall rule is: less stable leaving group corresponds to a less reactive derivative.

## 4.3 Nucleophilic Acyl Substitution Mechanism

The general mechanism of **nucleophilic acyl substitution** proceeds in two steps. In step 1, the nucleophile adds to the electrophilic carbonyl carbon to produce a **tetrahedral intermediate** (the carbon is now sp\(^3\) with four different groups). In step 2, the tetrahedral intermediate collapses by expelling the leaving group, restoring the carbonyl \( \pi \) bond (sp\(^2\)). The overall result is substitution: the incoming nucleophile replaces the leaving group on the acyl carbon. This contrasts with simple nucleophilic addition to aldehydes and ketones, where no leaving group departs.

<div class="definition">
<strong>Definition — Tetrahedral Intermediate:</strong> In nucleophilic acyl substitution, the tetrahedral intermediate is the sp<sup>3</sup> carbon species formed after nucleophile addition. Unlike SN2 reactions, this intermediate has a finite lifetime (it is not a transition state). The stability of this intermediate is influenced by the substituents on the carbonyl carbon.
</div>

## 4.4 Fischer Esterification

**Fischer esterification** is the acid-catalyzed condensation of a carboxylic acid with an alcohol to give an ester and water:

\[
\text{RCOOH} + \text{R'OH} \underset{\Delta}{\overset{H^+}{\rightleftharpoons}} \text{RCOOR'} + \text{H}_2\text{O}
\]

The mechanism begins with protonation of the carbonyl oxygen by the acid catalyst, making the carbonyl carbon more electrophilic. The alcohol attacks the activated carbonyl to give a tetrahedral intermediate, which loses a proton and then loses water (after protonation of a hydroxyl) to give the ester. The reaction is an equilibrium, and **Le Chatelier's principle** is exploited to drive it toward ester: using excess alcohol (if it is the cheaper reactant) or removing water (e.g., using a Dean-Stark trap with a high-boiling solvent such as toluene). The reverse reaction (acid-catalyzed ester hydrolysis) is simply the same mechanism run in reverse with excess water.

## 4.5 Ester Hydrolysis

Esters can be hydrolyzed under both acidic and basic conditions. **Acid-catalyzed hydrolysis** is the microscopic reverse of Fischer esterification and is an equilibrium; excess water drives the reaction toward carboxylic acid and alcohol. **Base-catalyzed hydrolysis (saponification)** is irreversible because the product carboxylate ion is thermodynamically stable and does not react further with base. Saponification proceeds by hydroxide attack on the ester carbonyl, giving a tetrahedral intermediate that collapses to expel alkoxide, which is then immediately protonated by the carboxylic acid product. The irreversibility makes saponification synthetically useful when complete hydrolysis is required.

## 4.6 Amide Formation and Hydrolysis

Amides are the least reactive of the common carboxylic acid derivatives because the nitrogen lone pair is delocalized into the carbonyl, giving the C–N bond partial double-bond character. This resonance donation elevates the activation energy for both nucleophilic attack (by reducing electrophilicity) and leaving group departure (by destabilizing N\(^-\) as a leaving group). Direct amide formation from carboxylic acids and amines requires activation: typically the acid is converted to an acid chloride, anhydride, or activated ester first, which is then treated with the amine. **Amide hydrolysis** requires forcing conditions — either concentrated strong acid or base with heat — due to the resonance stabilization of the amide bond.

## 4.7 The Claisen Condensation

The **Claisen condensation** is the base-mediated reaction of two ester molecules to give a beta-ketoester. Under the influence of one equivalent of alkoxide base, the alpha-carbon of one ester molecule is deprotonated to give an **ester enolate**. The enolate acts as a nucleophile and attacks the carbonyl carbon of a second ester molecule, giving a tetrahedral intermediate that collapses by expelling alkoxide to give the beta-ketoester product. The reaction is driven to completion by the irreversible deprotonation of the beta-ketoester product (which is more acidic, \( \text{p}K_a \approx 11 \), than the starting ester due to the second flanking carbonyl) by the alkoxide base.

For the crossed Claisen condensation to be synthetically useful, one partner should have no alpha-hydrogens (e.g., ethyl benzoate, ethyl formate, diethyl oxalate) so that it can only act as the electrophilic component.

### 4.7.1 Dieckmann Cyclization

The **Dieckmann cyclization** is the intramolecular version of the Claisen condensation applied to diesters. A diester with appropriate chain length undergoes intramolecular ester enolate attack on the second ester group to form a cyclic beta-ketoester. The reaction is particularly effective for forming 5- and 6-membered rings.

## 4.8 Decarboxylation and Malonic Ester Synthesis

**Beta-ketoacids** undergo facile **decarboxylation** (loss of CO\(_2\)) upon heating. The mechanism involves a six-membered cyclic transition state in which the beta-carbonyl accepts the electrons from the breaking C–C bond while CO\(_2\) departs, giving an enol that tautomerizes to the ketone. This is why malonic acid and beta-ketoacids decarboxylate readily while simple acids do not.

The **malonic ester synthesis** exploits this decarboxylation to prepare substituted acetic acids. Diethyl malonate (a 1,3-diester) is deprotonated at the active methylene (flanked by two carbonyls), alkylated with an alkyl halide, and then hydrolyzed under aqueous acid and heated to decarboxylate one of the carboxylic acids, giving a monosubstituted acetic acid (RCH\(_2\)COOH). Double alkylation gives disubstituted acetic acids. The **acetoacetic ester synthesis** follows the same logic but uses ethyl acetoacetate to prepare substituted methyl ketones.

## 4.9 Reactions of Acid Chlorides

**Acid chlorides** (acyl chlorides, RCOCl) are the most reactive acyl derivatives and serve as versatile acylating agents. With water, they hydrolyze rapidly to give the carboxylic acid and HCl. With alcohols, they give esters and HCl (useful when Fischer esterification equilibrium is unfavorable). With amines, they give amides and HCl (the HCl is typically neutralized by a second equivalent of amine or an added base such as triethylamine). With organolithium or Grignard reagents, acid chlorides give ketones initially, but since ketones are also reactive toward these strong nucleophiles, over-addition can give tertiary alcohols; careful control (using one equiv. at low temperature or using organocadmium reagents for selectivity) is needed if ketone is the desired product.

<div class="remark">
<strong>Remark:</strong> The Friedel-Crafts acylation (Chapter 5) uses acid chlorides with Lewis acid catalysts to acylate aromatic rings. Because the product ketone is deactivated toward further electrophilic attack (unlike Friedel-Crafts alkylation products), the acylation gives a clean monosubstituted product. The carbonyl can subsequently be reduced to CH<sub>2</sub> using Clemmensen reduction (Zn(Hg)/HCl, acidic conditions) or Wolff-Kishner reduction (NH<sub>2</sub>NH<sub>2</sub>/KOH/heat, basic conditions), allowing the net introduction of an alkyl group without the rearrangement problems of direct Friedel-Crafts alkylation.
</div>

---

# Chapter 5: Conjugated and Aromatic Systems

## 5.1 Conjugated Dienes

**Conjugated dienes** have alternating double and single bonds (e.g., 1,3-butadiene, CH\(_2\)=CH–CH=CH\(_2\)), allowing the four p orbitals to overlap continuously. This delocalization lowers the energy of the system relative to two isolated double bonds: the **heat of hydrogenation** of 1,3-butadiene is less than twice that of a monoalkene, indicating extra stability. In MO terms, conjugation produces four \( \pi \) molecular orbitals (\( \psi_1 \) through \( \psi_4 \)); the two lowest (\( \psi_1, \psi_2 \)) are filled in the ground state.

### 5.1.1 1,2- vs 1,4-Addition

Electrophilic addition of HBr to 1,3-butadiene can give two regioisomeric products. **1,2-Addition** gives the product where H and Br add to adjacent carbons (C1 and C2), while **1,4-addition** gives the product where H adds to C1 and Br adds to C4, with a new double bond between C2 and C3. Both products arise from the same delocalized allylic carbocation intermediate (with positive charge shared between C2 and C4).

**Kinetic control** (low temperature, –80°C) favors the **1,2-addition product** because the allylic carbocation is attacked more rapidly at the less hindered C2 position. **Thermodynamic control** (higher temperature, or prolonged reaction at room temperature with reversible conditions) favors the **1,4-addition product** because the internal, more substituted alkene is more stable. This kinetic vs. thermodynamic control is a central concept in CHEM 265 and illustrates that the fastest reaction and the most thermodynamically stable product are not always the same.

### 5.1.2 UV-Vis Absorption and Extended Conjugation

Conjugated systems absorb UV-Vis light at longer wavelengths than isolated double bonds because the HOMO-LUMO gap decreases as conjugation extends. 1,3-Butadiene absorbs at \( \lambda_{\text{max}} \approx 217 \) nm. Each additional conjugated double bond shifts \( \lambda_{\text{max}} \) bathochromically by approximately 30 nm. Long polyene chains eventually absorb in the visible region, giving rise to color (e.g., beta-carotene, lycopene).

## 5.2 The Diels-Alder Reaction

The **Diels-Alder reaction** is a [4+2] cycloaddition between a **diene** (4 \( \pi \) electrons) and a **dienophile** (2 \( \pi \) electrons) to form a six-membered ring. It is a **concerted**, thermally allowed pericyclic reaction occurring through a cyclic transition state with no intermediates. The reaction forms two new sigma bonds simultaneously.

### 5.2.1 Requirements for Reactivity

An electron-rich diene reacts most readily. The **diene must be in the s-cis conformation** (the single bond between the two double bonds must adopt the cis conformation to bring the terminal carbons close enough to react). Dienes locked in the s-cis conformation (e.g., cyclopentadiene, furan) are highly reactive. The **dienophile** must be electron-poor; electron-withdrawing groups (C=O, NO\(_2\), CN, C=C conjugated with EWG) on the dienophile accelerate the reaction by lowering the LUMO energy, improving overlap with the diene HOMO.

### 5.2.2 Stereochemistry: The Endo Rule

The Diels-Alder reaction is a **syn addition**: both new sigma bonds form on the same face of the diene, and the relative stereochemistry of substituents on the dienophile is retained in the product (cis-substituents on the dienophile give cis-substituents in the product). When the dienophile bears substituents, two possible transition states exist: **endo** (substituents point toward the diene) and **exo** (substituents point away). The **endo product is kinetically favored** due to secondary orbital interactions between the carbonyl orbitals of the substituents and the diene \( \pi \) system in the endo transition state, stabilizing it despite greater steric strain compared to the exo transition state. The exo product is typically more thermodynamically stable.

## 5.3 Aromaticity

**Aromaticity** imparts exceptional stability to cyclic, planar, fully conjugated systems. The **Hückel rule** states that a monocyclic, planar system is aromatic if it contains \( (4n+2) \) \( \pi \) electrons (where \( n = 0, 1, 2, \ldots \)). For \( n=1 \), benzene (6 \( \pi \) electrons) is the archetypal aromatic compound. Systems with \( 4n \) \( \pi \) electrons are **antiaromatic** (destabilized).

The **cyclopentadienyl anion** (C\(_5\)H\(_5^-\)) is aromatic: it has 6 \( \pi \) electrons (the lone pair on C\(^-\) plus two double bonds), a planar ring, and cyclic conjugation. In contrast, the **cyclopentadienyl cation** (C\(_5\)H\(_5^+\)) is antiaromatic (4 \( \pi \) electrons) and is highly destabilized.

### 5.3.1 Aromatic Heterocycles

**Pyridine** is a six-membered aromatic heterocycle with nitrogen in place of one CH group. The ring nitrogen contributes two electrons to the \( \pi \) system from the p-orbital (total: 6 \( \pi \) electrons, aromatic). The lone pair on nitrogen is in the plane of the ring (sp\(^2\) orbital) and is not part of the \( \pi \) system; this lone pair is responsible for pyridine's basicity (\( \text{p}K_a \) of conjugate acid ~5.2).

**Pyrrole** is a five-membered aromatic heterocycle with NH. The nitrogen's lone pair is part of the \( \pi \) system (6 \( \pi \) electrons total), making pyrrole aromatic. Because the lone pair is delocalized into the ring, pyrrole is a very weak base (\( \text{p}K_a \) of conjugate acid ~0.4, much weaker than pyridine). Protonation on nitrogen would disrupt aromaticity, so pyrrole is protonated on carbon (C-2) instead.

## 5.4 Electrophilic Aromatic Substitution (EAS)

The stability of the aromatic \( \pi \) system means that benzene reacts with electrophiles not by addition (which would destroy aromaticity) but by **substitution** (which restores aromaticity in the product). The general EAS mechanism has two steps.

**Step 1 — Formation of the arenium ion (Wheland intermediate):** The electrophile E\(^+\) attacks one carbon of the aromatic ring, forming a new sigma bond and generating a delocalized carbocation (the **sigma complex** or **arenium ion**). At this point, the ring is no longer aromatic — the sp\(^3\) carbon disrupts conjugation.

**Step 2 — Deprotonation:** A base (often the counterion of the electrophile or solvent) removes the proton from the sp\(^3\) carbon, restoring the aromatic \( \pi \) system and giving the substitution product.

### 5.4.1 Halogenation

Benzene reacts with Br\(_2\) in the presence of a Lewis acid catalyst **FeBr\(_3\)** (or AlCl\(_3\) for chlorination). FeBr\(_3\) activates Br\(_2\) by coordinating to one bromine, making the other highly electrophilic (Br\(^+\) equivalent). The product is bromobenzene (aryl bromide) and HBr. For benzylic bromination, **NBS (N-bromosuccinimide)** with radical initiator (light or AIBN) is used; this is a radical chain reaction targeting the sp\(^3\) C–H adjacent to the ring, not EAS.

### 5.4.2 Nitration

Nitration uses a mixture of concentrated HNO\(_3\) and H\(_2\)SO\(_4\) to generate the nitronium ion (**NO\(_2^+\)**), the electrophile. H\(_2\)SO\(_4\) protonates HNO\(_3\), which then loses water to give NO\(_2^+\). Nitrobenzene is the product; further nitration requires stronger conditions due to deactivation by the nitro group.

### 5.4.3 Sulfonation

Sulfonation of benzene uses fuming H\(_2\)SO\(_4\) (oleum, containing SO\(_3\)). The electrophile is SO\(_3\). Unlike other EAS reactions, sulfonation is **reversible**: heating benzenesulfonic acid in dilute acid regenerates benzene. This reversibility is exploited in synthesis to temporarily block a position.

### 5.4.4 Friedel-Crafts Alkylation and Acylation

**Friedel-Crafts alkylation** uses RCl + AlCl\(_3\) to generate a carbocation (or tight ion pair), which attacks the ring. Problems include **carbocation rearrangements** (a primary carbocation may rearrange to secondary before attacking), **polyalkylation** (product is more nucleophilic than starting benzene), and the inability to add primary alkyl groups without rearrangement.

**Friedel-Crafts acylation** uses RCOCl + AlCl\(_3\) to generate an **acylium ion** (RC=O\(^+\)), which is resonance-stabilized and does not rearrange. The product ketone is deactivated toward further EAS, ensuring mono-acylation. The carbonyl group is subsequently removable by **Clemmensen reduction** (Zn(Hg)/HCl, acidic conditions) or **Wolff-Kishner reduction** (NH\(_2\)NH\(_2\), KOH, heat, basic conditions), providing an indirect route to alkylbenzenes without rearrangement.

### 5.4.5 Directing Effects

Substituents on the benzene ring direct incoming electrophiles to specific positions and activate or deactivate the ring. **Ortho/para directors** stabilize the arenium ion when the electrophile attacks ortho or para to them, either by electron donation through resonance (OH, OR, NR\(_2\), NH\(_2\)) or by a combination of induction and resonance (alkyl groups, halogens — halogens are weakly deactivating but o/p-directing due to resonance donation despite inductive withdrawal). **Meta directors** are electron-withdrawing groups (NO\(_2\), CN, CHO, COR, COOH, COOR, SO\(_3\)H) that destabilize the arenium ion at ortho and para positions more than at meta, directing attack to meta by default (not activation, but relative deactivation).

<div class="definition">
<strong>Definition — Activating and Deactivating Groups:</strong> An <em>activating group</em> makes the ring more reactive than benzene (faster EAS) by donating electron density to the ring. A <em>deactivating group</em> makes the ring less reactive than benzene by withdrawing electron density. All ortho/para directors except halogens are activating; all meta directors are deactivating; halogens are deactivating but ortho/para directing.
</div>

### 5.4.6 Nucleophilic Aromatic Substitution

**Nucleophilic aromatic substitution (SNAr)** occurs when the ring bears strongly electron-withdrawing groups ortho and/or para to a leaving group. The mechanism proceeds through an **addition-elimination** pathway via a **Meisenheimer complex** (anionic sigma complex). The strong EWGs stabilize the negative charge in the Meisenheimer complex. Common substrates include 2,4-dinitrochlorobenzene reacting with amines or alkoxides. The reaction requires at least one strong EWG ortho or para to the leaving group; meta-substituted EWGs are ineffective because they do not stabilize the negative charge in the sigma complex.

---

# Chapter 6: Amines

## 6.1 Structure, Classification, and Nomenclature

**Amines** are organic derivatives of ammonia in which one, two, or three hydrogen atoms are replaced by organic groups. A **primary amine** (1°) has one organic group on nitrogen (RNH\(_2\)). A **secondary amine** (2°) has two (R\(_2\)NH). A **tertiary amine** (3°) has three (R\(_3\)N). A **quaternary ammonium salt** has four organic groups on a positively charged nitrogen (R\(_4\)N\(^+\)) and is a permanent cation with no lone pair.

In IUPAC nomenclature, simple amines are named as alkanamines (e.g., ethanamine, propan-2-amine). Complex amines are named as N-substituted derivatives. Common names are frequently used: methylamine, dimethylamine, aniline (for aminobenzene), aniline derivatives as substituted anilines.

The nitrogen in amines is sp\(^3\) hybridized (roughly) with a lone pair in an sp\(^3\) orbital. Amines are pyramidal. The inversion barrier at nitrogen is very low (~6 kcal/mol), so nitrogen rapidly inverts through a planar transition state at room temperature, making simple chiral amines racemize rapidly (unlike sulfoxides or phosphines).

## 6.2 Basicity of Amines

Amines are Brønsted bases because the nitrogen lone pair accepts a proton:

\[
\text{RNH}_2 + \text{H}_2\text{O} \rightleftharpoons \text{RNH}_3^+ + \text{OH}^-
\]

Basicity is usually discussed in terms of the pKa of the conjugate acid (ammonium ion), since higher pKa of the conjugate acid means stronger base. **Aliphatic amines** are moderately basic (pKa of conjugate acid ~10–11) because alkyl groups are electron-donating by induction, increasing electron density on nitrogen and stabilizing the ammonium ion through hyperconjugation and solvation.

**Aniline (aminobenzene)** is much less basic (pKa of conjugate acid ~4.6) than aliphatic amines. The nitrogen lone pair in aniline is delocalized into the aromatic ring through resonance, as shown by the several resonance contributors placing positive charge on nitrogen. This delocalization reduces the availability of the lone pair for protonation. Upon protonation of aniline, the positive charge is localized on nitrogen, disrupting the resonance stabilization; the anilinium ion is therefore less stabilized relative to aniline than alkylammonium relative to alkylamine. Electron-donating substituents on the ring (para-OCH\(_3\)) increase aniline basicity; electron-withdrawing substituents (para-NO\(_2\)) dramatically decrease it.

**Pyridine** (\( \text{p}K_a \approx 5.2 \)) is a weak base; its in-plane lone pair is in an sp\(^2\) orbital (more electronegative than sp\(^3\)), reducing basicity relative to aliphatic amines. **Pyrrole** is an extremely weak base (\( \text{p}K_a \approx 0.4 \)) because protonation would require disrupting aromaticity.

## 6.3 Preparation of Amines

### 6.3.1 Gabriel Synthesis

The **Gabriel synthesis** provides a clean route to primary amines without contamination by secondary or tertiary amines. Phthalimide (a cyclic imide) is deprotonated by KOH to give potassium phthalimide (pKa of phthalimide ~8.3). This nitrogen nucleophile undergoes SN2 alkylation with a primary alkyl halide or tosylate to give N-alkylphthalimide. Aqueous hydrazine (or aqueous KOH with heating) then cleaves the imide via nucleophilic acyl substitution to release the primary amine and phthalhydrazide (or phthalate). The method is reliable but cannot be used with secondary alkyl halides (elimination competes) and requires an extra step for deprotection.

### 6.3.2 Reductive Amination

**Reductive amination** is the most versatile synthesis of amines. An aldehyde or ketone is reacted with a primary or secondary amine to give an imine or iminium ion, which is then reduced in situ by a mild hydride source, typically **sodium cyanoborohydride (NaBH\(_3\)CN)** or **sodium triacetoxyborohydride (NaBH(OAc)\(_3\))** at mildly acidic pH. These reducing agents are selective for iminium ions over aldehydes/ketones under mild conditions. The net result is replacement of C=O with C–NR\(_2\). Reductive amination with ammonia (from NH\(_4^+\) salt and NaBH\(_3\)CN) gives primary amines.

### 6.3.3 Reduction of Nitro Groups

**Aromatic nitro compounds** are readily reduced to anilines. Classical methods use **Fe (or Sn) with HCl** (the original Baeyer synthesis), which reduces NO\(_2\) to NH\(_2\) via a series of nitroso and hydroxylamine intermediates. **Catalytic hydrogenation** (H\(_2\)/Pd-C) also works efficiently. These methods are important because aromatic nitro compounds are easily prepared by nitration of benzene, making anilines accessible from benzene via nitration/reduction.

## 6.4 Reactions of Amines

### 6.4.1 Alkylation

Direct alkylation of amines with alkyl halides is synthetically problematic because primary amines give mixtures of secondary and tertiary amines and quaternary ammonium salts (**over-alkylation**). The primary amine product is more nucleophilic than the starting amine (less hindered, or comparable nucleophilicity), leading to further reaction. This problem is circumvented by the Gabriel synthesis, reductive amination, or acylation strategies.

### 6.4.2 Acylation

Amines react cleanly with acid chlorides and anhydrides to give amides. Primary amines give primary amides, secondary amines give secondary (N-substituted) amides. The reaction is fast and often used to **protect amines**: an amine is converted to an amide, which has dramatically altered reactivity (it is no longer nucleophilic and no longer basic at nitrogen). After the desired transformation elsewhere in the molecule, the amide can be hydrolyzed back to the amine under acid or base conditions.

### 6.4.3 The Hinsberg Test

The **Hinsberg test** distinguishes primary, secondary, and tertiary amines using **benzenesulfonyl chloride** (PhSO\(_2\)Cl) in base. Primary amines give sulfonamides with an N–H that is still acidic (deprotonated by base) — the sulfonamide dissolves in base. Secondary amines give sulfonamides with no N–H — insoluble in base. Tertiary amines do not react (no N–H to form the sulfonamide), and the amine may react reversibly or not at all, remaining as a separate layer. This behavior allows classification of the three types of amines.

## 6.5 Reactions with Nitrous Acid (Diazotization)

The reaction of amines with **nitrous acid (HNO\(_2\))**, generated in situ from NaNO\(_2\) + HCl at 0–5°C, produces different products depending on the amine type.

**Primary aliphatic amines** react with HNO\(_2\) to give aliphatic diazonium salts (R–N\(^+\)≡N), which are extremely unstable at room temperature and decompose rapidly by loss of N\(_2\) to give a mixture of substitution, elimination, and rearrangement products. This reaction has little synthetic utility due to the mixture of products.

**Primary aromatic amines** react with HNO\(_2\) at 0–5°C to give **arenediazonium salts** (Ar–N\(^+\)≡N X\(^-\)), which are stabilized by resonance delocalization of the positive charge into the aromatic ring. Arenediazonium salts are stable at 0–5°C in aqueous solution (though still reactive) and are extremely valuable synthetic intermediates.

**Secondary amines** (both aliphatic and aromatic) react with HNO\(_2\) to give **N-nitroso compounds** (nitrosamines, R\(_2\)N–N=O), which are yellow oils. Nitrosamines are known carcinogens. No C–N bond cleavage occurs.

**Tertiary aliphatic amines** do not react in a useful way with HNO\(_2\). Tertiary aromatic amines undergo ring nitrosation at the para position.

## 6.6 Diazonium Chemistry: The Sandmeyer Reactions

The **Sandmeyer reactions** convert arenediazonium salts to aryl halides, nitriles, and other compounds with retention of the arene skeleton, enabling replacement of the amino group (introduced via nitration/reduction) with a variety of substituents that cannot be installed directly by EAS. This is a powerful strategy for preparing polysubstituted benzenes.

| Reagent | Product |
|---|---|
| CuCl / HCl | ArCl |
| CuBr / HBr | ArBr |
| CuCN / KCN | ArCN |
| KI | ArI |
| HBF\(_4\) (Schiemann reaction) | ArF |
| H\(_2\)O / heat | ArOH |
| H\(_3\)PO\(_2\) or EtOH | ArH (reductive removal) |

The Sandmeyer reactions with CuX (halide) and CuCN proceed through a radical mechanism involving Cu(I)/Cu(II) redox. The fluoride synthesis (Balz-Schiemann reaction) requires isolation of the diazonium tetrafluoroborate salt, followed by dry thermal decomposition. The conversion to ArI is accomplished simply by addition of KI directly to the diazonium salt at room temperature. The reductive removal of the diazonium group (replacement with H) is strategically useful for temporary amino group installation to direct EAS, followed by removal.

## 6.7 Azo Dyes and Coupling Reactions

**Azo coupling** is the reaction of an arenediazonium salt with an activated aromatic ring (electron-rich arene such as a phenol or arylamino compound) to form an **azo compound** (Ar–N=N–Ar'). The diazonium ion acts as a weak electrophile in this EAS reaction; it is only reactive enough to attack very electron-rich arenes. Coupling with phenol occurs preferentially at the para position (or ortho if para is blocked) under mildly basic conditions (pH ~9, where phenol exists as the more nucleophilic phenoxide). Coupling with aromatic amines occurs under mildly acidic conditions (to keep the amine protonated enough to prevent further diazotization, yet still nucleophilic at the ring).

**Azo dyes** are colored because the extended conjugated system (Ar–N=N–Ar') absorbs visible light. The chromophore can be tuned by modifying the electron-donating and electron-withdrawing substituents on the two aromatic rings, shifting the absorption wavelength and thus the observed color. Para red (p-hydroxyazobenzene based) and methyl orange (a para-aminoazobenzene with sulfonate) are classical examples. The large-scale synthesis of azo dyes from aniline derivatives via diazotization and coupling was historically the foundation of the synthetic dye industry.

<div class="example">
<strong>Example — Synthesis of an Azo Dye:</strong> Sulfanilic acid (4-aminobenzenesulfonic acid) is diazotized with NaNO<sub>2</sub>/HCl at 0°C to give the diazonium salt. This is then coupled with N,N-dimethylaniline at pH 4–5 to give methyl orange (an orange-red azo dye with p<em>K</em><sub>a</sub> ~3.5, used as an acid-base indicator). At pH below 3.5, the azo group is protonated, shifting the absorbance and changing the color to red. Above pH 4.4, the neutral azo form is yellow-orange.
</div>

<div class="remark">
<strong>Remark:</strong> The Sandmeyer reaction and azo coupling together illustrate a powerful strategy in aromatic synthesis: the amino group (–NH<sub>2</sub>) acts as a <em>traceless directing group</em> that can be installed via nitration/reduction, used to direct further substitution or as a handle for Sandmeyer/coupling chemistry, and then either retained in the product or removed reductively if no longer needed.
</div>

---

## Summary of Key Reaction Types by Chapter

The following table provides a concise cross-reference of the major reaction types covered in CHEM 265, organized by chapter and mechanism class.

| Chapter | Reaction | Mechanism Class | Key Reagents |
|---|---|---|---|
| 3 | Nucleophilic addition to C=O | Addition | NaBH\(_4\), LiAlH\(_4\), RMgX |
| 3 | Acetal formation | Addition-elimination | ROH / H\(^+\) (cat.) |
| 3 | Imine / Enamine formation | Addition-elimination | RNH\(_2\) / R\(_2\)NH, H\(^+\) |
| 3 | Wittig reaction | Concerted / [2+2] | Ph\(_3\)P=CHR |
| 3 | Aldol condensation | Enolate addition | NaOH, LDA |
| 3 | Baeyer-Villiger | Oxidation / 1,2-shift | mCPBA |
| 4 | Nucleophilic acyl substitution | Addition-elimination | H\(_2\)O, ROH, RNH\(_2\) |
| 4 | Fischer esterification | Addition-elimination | H\(^+\) (cat.), ROH, heat |
| 4 | Saponification | Addition-elimination | NaOH (aq.) |
| 4 | Claisen condensation | Enolate addition | NaOR, ester |
| 4 | Malonic ester synthesis | Alkylation, decarboxylation | NaOEt, RX, H\(_3\)O\(^+\), heat |
| 5 | Diels-Alder | Concerted [4+2] | Diene + dienophile |
| 5 | EAS | Addition-elimination | E\(^+\), Lewis acid |
| 5 | SNAr | Addition-elimination | Nu\(^-\), EWG on ring |
| 6 | Reductive amination | Addition + reduction | RCHO, RNH\(_2\), NaBH\(_3\)CN |
| 6 | Sandmeyer | Radical / ionic | NaNO\(_2\)/HCl, CuX |
| 6 | Azo coupling | EAS (weak electrophile) | ArN\(_2^+\), activated arene |

This table does not substitute for the detailed mechanistic understanding required in CHEM 265; each entry represents a multi-step process that must be mastered at the level of electron-pushing arrow mechanisms.

---

*End of CHEM 265: Organic Chemistry 2 Notes — Winter 2026*
