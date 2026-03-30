---
title: "PHIL 257: Philosophy of Mathematics"
prof: "Patricia Marino"
---

## Sources and References

**Primary anthology**
- Paul Benacerraf and Hilary Putnam (eds.), *Philosophy of Mathematics: Selected Readings*, 2nd ed. (Cambridge University Press, 1984)

**Supplementary texts**
- John Stillwell, *Roads to Infinity: The Mathematics of Truth and Proof* (CRC Press, 2010)

**Online resources**
- Stanford Encyclopedia of Philosophy — plato.stanford.edu (entries on Formalism, Hilbert's Program, Gödel's Incompleteness Theorems, Intuitionism, Indispensability Arguments)
- Primary journal articles: Benacerraf (1973), Maddy (1992), Tanswell (2015), De Toffoli (2021), Mangraviti (2024), Islami (2017), Finn (2021), Humphreys (2009), Calude & Longo (2017), Lehet (2021), Carter (2024)

---

# Chapter 1: Introduction — What Is Philosophy of Mathematics?

## Section 1.1: The Questions of the Field

Philosophy of mathematics is not concerned with proving theorems but with understanding what mathematical practice is, what mathematical objects are, and why mathematics has the features it does. Three clusters of questions organize the field.

The **ontological question** asks about the nature of mathematical objects: do numbers, sets, and geometric figures exist independently of human minds and language? If mathematical objects are abstract — non-spatial, non-temporal, causally inert — how do we gain knowledge of them? If they do not exist, how can mathematical statements be true?

The **epistemological question** asks how mathematical knowledge is possible. Mathematical justification standardly proceeds by proof from axioms, yet the foundations of those axioms remain contested. Can the axioms themselves be known, and if so, how?

The **applicability question** asks why mathematics is so useful in the natural sciences. Eugene Wigner famously described this as "the unreasonable effectiveness of mathematics" — the puzzle that mathematical structures developed with no empirical motivation routinely turn out to describe physical reality.

<div class="remark">
<strong>Historical orientation.</strong> These questions took their modern form in the late nineteenth and early twentieth centuries, when mathematicians became concerned about the foundations of analysis and set theory. The "foundations crisis" — triggered by Russell's Paradox and the non-Euclidean revolution — forced philosophers and mathematicians alike to re-examine what mathematics is. Hilbert, Frege, Brouwer, and Russell proposed incompatible answers; their debate defines the classical landscape.
</div>

## Section 1.2: Mathematical Truth and the Infinite — A First Look

John Stillwell's *Roads to Infinity* provides a bridge between mathematical practice and philosophical reflection. Cantor's discovery that some infinities are larger than others (the uncountable exceeds the countable) showed that informal intuition about infinity is unreliable. The hierarchy of infinite cardinals — \(\aleph_0, \aleph_1, \aleph_2, \ldots\) — arises from rigorous set-theoretic argument, yet the question of whether such sets "exist" independently of our axioms remains open.

Stillwell traces how the attempt to make mathematics rigorous — via set theory, logic, and axiomatics — paradoxically revealed deep incompleteness and undecidability. This trajectory frames the foundational programs discussed in Chapters 2–4.

## Section 1.3: The Unreasonable Effectiveness of Mathematics

Eugene Wigner's 1960 essay argues that mathematics developed for purely aesthetic or internal mathematical reasons repeatedly turns out to be exactly the language needed to describe physical phenomena. The complex numbers, invented to solve polynomial equations, are indispensable for quantum mechanics. Riemannian geometry, developed in the nineteenth century, turned out to be the geometry of spacetime.

Wigner's puzzle: if mathematical objects are mind-dependent or merely conventional, why should they describe a mind-independent physical world? If they are mind-independent abstract entities, the puzzle is different but equally sharp — why should human cognition track a realm of abstract objects well enough to produce applicable theories?

<div class="remark">
<strong>Two directions.</strong> Subsequent chapters address Wigner's puzzle from different angles. The indispensability argument (Chapter 7) tries to use the applicability of mathematics as evidence for the existence of mathematical objects. The philosophy of applied mathematics (Chapter 9) examines whether the match between mathematics and physics is as remarkable as Wigner claims.
</div>

---

# Chapter 2: Logicism — Is Mathematics Just Logic?

## Section 2.1: Frege's Project

Gottlob Frege's *Foundations of Arithmetic* (1884) proposes that arithmetic is reducible to pure logic. If every arithmetical concept can be defined in purely logical terms and every arithmetical theorem derived from purely logical axioms, then arithmetic has the same epistemic status as logic — knowable a priori, necessarily true, and not dependent on spatial or temporal intuition.

Frege's key move is to define number in terms of the concept of **equinumerosity**: two concepts \(F\) and \(G\) are equinumerous if there is a one-to-one correspondence between their extensions. The number \(n\) is then defined as the extension of the concept "equinumerous with \(F\)," for any \(F\) that has \(n\) members. This is **Hume's Principle**: the number of \(F\)s equals the number of \(G\)s if and only if \(F\) and \(G\) are equinumerous.

<div class="definition">
<strong>Frege's logicism.</strong> Arithmetic (and by extension all of mathematics) is reducible to logic: all mathematical truths are logical truths, and all mathematical objects are definable in purely logical terms.
</div>

Frege's argument that numbers are **objects** (not properties or concepts) relies on the grammatical parallel between "the number of planets is eight" and "the capital of France is Paris." Just as "Paris" refers to an object, "eight" refers to an object. Numbers are abstract objects — they have no spatial location, no causal powers — but they are genuinely objects.

## Section 2.2: The Problem of Mathematical Objects

Frege's logicism raises the question: what *kind* of objects are numbers? They cannot be physical objects — the number 3 does not occupy any region of space. Frege says they are **abstract objects** that exist in a "third realm" distinct from both the physical world and the mental world of subjective ideas.

This position is called **Platonism** (or mathematical realism): mathematical objects exist independently of minds and language, in an abstract domain.

<div class="remark">
<strong>The epistemological problem.</strong> Abstract objects pose an immediate epistemological puzzle. Our ordinary routes to knowledge involve causal interaction with the world: perception, testimony, inference from physical evidence. But abstract objects are causally inert — they have no powers and do not enter into causal relations. How, then, can we have knowledge of them? This is the kernel of Benacerraf's challenge (Chapter 5).
</div>

## Section 2.3: Russell's Paradox and the Collapse of Naïve Logicism

In 1902 Bertrand Russell discovered a contradiction at the heart of Frege's system. Consider the set of all sets that do not contain themselves:

\[ R = \{x : x \notin x\} \]

If \(R \in R\), then by definition \(R \notin R\). If \(R \notin R\), then by definition \(R \in R\). Either assumption leads to its negation — a contradiction.

Russell's Paradox shows that **unrestricted comprehension** — the principle that any predicate defines a set — is inconsistent. Frege's Basic Law V, which asserts that every concept has an extension (a set of objects falling under it), is inconsistent.

The paradox forced a fundamental revision of the foundations of logic. Russell's own response was the **theory of types**: sets are arranged in a hierarchy of types, and a set can only contain objects of lower type, blocking the self-referential construction. This avoids the paradox but introduces significant complexity.

<div class="remark">
<strong>Impact on logicism.</strong> Russell's Paradox did not immediately refute logicism, but it showed that the relevant "logic" must be a structured, type-theoretic system — not the simple, universal logic Frege had envisioned. Whether type theory counts as "logic" in any illuminating sense became contentious.
</div>

---

# Chapter 3: Formalism — Is Mathematics Symbol Manipulation?

## Section 3.1: Hilbert's Program

David Hilbert proposed an alternative response to the foundations crisis. Rather than reducing mathematics to logic (Frege's approach), Hilbert proposed to **formalize** mathematics and then prove, within a restricted "finitist" meta-mathematics, that the formal system is consistent.

Hilbert's essay "On the Infinite" (1926) argues that the infinite does not exist in physical reality — there is no physically infinite collection — but that infinite mathematics is nonetheless legitimate as a **formal game** with symbols. The "real" mathematics is the finite, contentful part; infinite mathematics is an "ideal" extension that is justified instrumentally, because it allows us to prove real results more efficiently.

<div class="definition">
<strong>Hilbert's formalism.</strong> Mathematical theories are formal axiomatic systems — collections of symbols and rules for manipulating them. Mathematical truth, within a system, means formal derivability. The task of foundational research is to prove, by finitary means, that formal systems are consistent (do not derive a contradiction).
</div>

Hilbert's program has two parts:
1. **Formalization**: Axiomatize all of mathematics in a complete, consistent formal system.
2. **Consistency proof**: Using only finitary, combinatorial reasoning (reasoning about finite symbol strings), prove that the formal system cannot derive \(P \wedge \neg P\) for any statement \(P\).

The appeal of this program is that it promises to secure the infinite parts of mathematics without requiring a metaphysically loaded commitment to the existence of infinite sets.

## Section 3.2: Gödel's Incompleteness Theorems

In 1931, Kurt Gödel proved two results that decisively undermined Hilbert's program.

<div class="theorem">
<strong>Gödel's First Incompleteness Theorem.</strong> Any consistent formal system \(S\) that is sufficiently strong to express basic arithmetic contains a statement \(G_S\) that is true (in the standard model of arithmetic) but not provable within \(S\). That is, \(S\) is necessarily <em>incomplete</em>.
</div>

<div class="theorem">
<strong>Gödel's Second Incompleteness Theorem.</strong> No consistent formal system \(S\) sufficiently strong to express basic arithmetic can prove its own consistency within \(S\).
</div>

The second theorem directly defeats Hilbert's program: the consistency proof Hilbert sought cannot be carried out within the formal system itself. Any proof of consistency for a system \(S\) must use a stronger system \(S'\), whose own consistency cannot then be proved within \(S'\).

Solomon Feferman's commentary clarifies the scope and limits of Gödel's results. The theorems apply specifically to formal systems; they do not show that mathematics is "uncertain" in any intuitive sense, nor that every mathematical truth is beyond proof. They do show that no single formal system captures all mathematical truth.

<div class="remark">
<strong>Philosophical implications.</strong> For the philosophy of mathematics, Gödel's theorems raise the question: what do we mean by "mathematical truth"? If there are truths that outrun formal provability, then mathematical truth cannot be identified with formal derivability. Gödel himself took this as evidence for Platonism — the mind can "see" truths that the formal system cannot prove — though this inference is controversial.
</div>

## Section 3.3: The Relationship Between Truth and Proof

The incompleteness results force a distinction between:

- **Syntactic truth** (formal provability within a system): \(\vdash_S P\)
- **Semantic truth** (truth in the standard model): \(\vDash P\)

In a complete system these coincide; Gödel shows no sufficiently strong system is complete. This distinction underlies all subsequent debates about mathematical realism: does "mathematical truth" mean formal provability, or truth in some intended interpretation?

---

# Chapter 4: Intuitionism — Are Mathematical Objects Mental Constructions?

## Section 4.1: Brouwer's Intuitionism

L. E. J. Brouwer, the founder of mathematical intuitionism, rejected both logicism and formalism. For Brouwer, mathematics is a **mental activity**: mathematical objects are constructions in the mathematician's mind, not abstract entities discovered in a Platonic realm, and not symbols manipulated according to rules. A mathematical object exists only if it has been constructed; a mathematical truth holds only if a construction (proof) for it exists.

This position has radical consequences for classical logic. The **law of excluded middle** — \(P \vee \neg P\) — is not a logical truth for the intuitionist. To assert \(P \vee \neg P\) for an arbitrary mathematical statement \(P\) would be to claim that either a proof of \(P\) or a proof of \(\neg P\) exists — but there is no reason, in general, to expect one to exist.

<div class="definition">
<strong>Intuitionism.</strong> Mathematics is a languageless mental activity; mathematical objects are constructed in intuition; a mathematical statement is true only if there is a constructive proof of it. Existence claims require the exhibition of a specific object, not merely a proof that the assumption of non-existence leads to contradiction.
</div>

## Section 4.2: Heyting and Intuitionistic Logic

Arend Heyting formalized the intuitionist position in a way that could be compared with classical logic. In his essay "The Intuitionistic Foundations of Mathematics" (in Benacerraf and Putnam), Heyting articulates the **proof interpretation** (also called the BHK interpretation) of the logical connectives:

- A proof of \(P \wedge Q\) is a pair consisting of a proof of \(P\) and a proof of \(Q\).
- A proof of \(P \vee Q\) is either a proof of \(P\) or a proof of \(Q\) (with an indication of which).
- A proof of \(P \to Q\) is a method that transforms any proof of \(P\) into a proof of \(Q\).
- A proof of \(\neg P\) is a proof that \(P \to \bot\) (that \(P\) leads to contradiction).
- \(\exists x\, P(x)\) requires the construction of a specific \(x\) together with a proof that \(P(x)\).
- \(\forall x\, P(x)\) requires a method that, given any \(x\), produces a proof that \(P(x)\).

<div class="remark">
<strong>Non-classical theorems.</strong> Intuitionistic mathematics differs from classical mathematics in surprising ways. For instance, it is intuitionistically consistent to assert that all functions from \(\mathbb{R}\) to \(\mathbb{R}\) are continuous — a statement false classically. The constructive universe is in some sense "smoother" than the classical one.
</div>

Heyting's "Disputation" (a dialogue between an intuitionist and a classical mathematician) dramatizes the disagreement: the intuitionist challenges every non-constructive existence proof, while the classical mathematician sees the intuitionist's restrictions as unmotivated.

## Section 4.3: Constructivism and Its Legacy

Contemporary constructivism — represented by Bishop's constructive analysis and Martin-Löf type theory — has moved beyond Brouwer's mentalism while retaining the commitment to constructive proof. From a philosophical perspective, intuitionism raises a fundamental question about the nature of mathematical existence:

**The existence question**: Is it enough to prove that the non-existence of a mathematical object leads to contradiction (a "non-constructive existence proof"), or must one actually exhibit the object?

Classical mathematics accepts the former; constructivism requires the latter. The choice reflects deeper commitments about what mathematics is *about*.

---

# Chapter 5: Mathematical Truth and the Epistemological Problem

## Section 5.1: Benacerraf's Challenge

Paul Benacerraf's 1973 paper "Mathematical Truth" poses a dilemma that has structured much of subsequent philosophy of mathematics. Benacerraf begins with two constraints on an adequate theory of mathematical truth:

1. **Semantic constraint**: The theory of mathematical truth should be continuous with our general semantic theory. If "Caesar conquered Gaul" is true because Caesar performed a certain action and Gaul was the object of that action, then "7 + 5 = 12" should be true in a similar way — by virtue of numbers standing in a relation.

2. **Epistemological constraint**: The theory should be compatible with a plausible account of how we can *know* mathematical truths. An account that requires causal access to mathematical objects is problematic, since abstract objects have no causal powers.

<div class="theorem">
<strong>Benacerraf's Dilemma.</strong> The two constraints pull in opposite directions. The semantic constraint pushes toward Platonism (numbers are objects, and mathematical truths hold in virtue of relations among those objects). But Platonism makes mathematical knowledge mysterious: abstract objects are causally inert, and our standard epistemological theories require that knowledge of external objects arise through some causal connection with them. Either semantic continuity fails or the epistemology is inadequate.
</div>

## Section 5.2: Responses to the Dilemma

Benacerraf's paper did not propose a solution — it articulated the problem. Subsequent positions in the philosophy of mathematics can be read as responses:

- **Rationalist Platonism** (Gödel): Mathematical intuition provides non-causal access to abstract objects. Just as sensory intuition gives access to physical objects, intellectual intuition gives access to mathematical objects. Criticized for lack of a mechanism.
- **Structuralism** (Benacerraf, Shapiro): Mathematics is not about specific objects (numbers, sets) but about *structures* — patterns of relations. On this view, "2" does not refer to a unique object but to a position in any \(\omega\)-sequence. This sidesteps the reference question.
- **Fictionalism**: Mathematical statements are false (or neither true nor false) because there are no mathematical objects. Mathematical discourse is useful fiction. (Developed in Chapter 6.)
- **Naturalism and indispensability**: Mathematical objects exist because mathematics is indispensable to scientific explanation. We should believe in whatever our best scientific theories quantify over. (Developed in Chapter 7.)

---

# Chapter 6: Fictionalism — Are Mathematical Statements Not True After All?

## Section 6.1: The Fictionalist Position

Fictionalism holds that mathematical statements should be interpreted at face value — "there are infinitely many prime numbers" does indeed assert the existence of infinitely many prime numbers — but since no such objects exist, the statement is **false** (or more carefully, true only within a fiction, just as "Sherlock Holmes lived at 221B Baker Street" is true within Conan Doyle's fiction).

The fictionalist motivation is epistemological: if abstract objects would be unknowable, the most parsimonious response is to deny that they exist, while explaining why mathematical discourse is nonetheless useful.

## Section 6.2: Yablo — The Myth of the Seven

Stephen Yablo's "The Myth of the Seven" (in *Fictionalism in Metaphysics*, Oxford, 2005) develops a sophisticated fictionalist position. Yablo distinguishes between:

- **Literal content**: What is literally asserted (e.g., that a certain number exists).
- **Real content**: The concrete, nominalistic fact the assertion is being used to communicate.

Consider "The number of planets is eight." The real content is a claim about how many planets there are, which could in principle be stated without numbers. The reference to the number 8 is a **convenient representational aid**, not a genuine ontological commitment. Mathematical objects function like the characters of a myth — indispensable for organizing and communicating thought, but not literally real.

<div class="remark">
<strong>Hermeneutic vs. revolutionary fictionalism.</strong> Yablo's version is <em>hermeneutic</em>: he claims that ordinary speakers are not actually committed to the existence of numbers, because the real content of their assertions does not require numbers. <em>Revolutionary</em> fictionalism, by contrast, holds that speakers are mistakenly committed to numbers and should revise their beliefs.
</div>

## Section 6.3: Burgess — The Challenge to Fictionalism

John Burgess's "Mathematics and Bleak House" (*Philosophia Mathematica*, 2004) presses fictionalism from two angles.

First, **the Dickens objection**: In Bleak House, the legal case is treated as real within the fiction; no reader thinks it is literally unresolved. But mathematical "fictions" are not treated as fictions by mathematicians — they are asserted sincerely and relied upon in scientific inference. The fictionalist must explain why mathematical assertions differ from sincere first-person assertions.

Second, **the nominalization challenge**: Fictionalists owe us a complete nominalistic reformulation of scientific theories — a version of physics, chemistry, and biology that quantifies only over physical, concrete objects. Hartry Field attempted this for Newtonian mechanics, but the project faces immense technical difficulties for modern physics.

Burgess concludes that fictionalism is a philosophical position that cannot be adequately defended without a completed nominalization program, which remains unachieved.

---

# Chapter 7: Naturalism and Indispensability

## Section 7.1: The Indispensability Argument

The indispensability argument (associated with Quine and Putnam, elaborated by Maddy) argues that we ought to believe in the existence of mathematical objects because they are indispensable to our best scientific theories. The argument runs:

1. We ought to believe in the existence of all and only those entities that are indispensable to our best scientific theories.
2. Mathematical objects are indispensable to our best scientific theories.
3. Therefore, we ought to believe in the existence of mathematical objects.

Penelope Maddy's "Indispensability and Practice" (*Journal of Philosophy*, 1992) examines the argument in detail and finds it wanting. Her key objection: **scientists do not always believe the literal content of the mathematics they use**. Physicists routinely use idealizations they know to be false (point masses, infinite populations, continuous fluids) because they are mathematically tractable, not because they are literally true. If scientists themselves do not treat mathematical entities as genuinely real entities that their theories are committed to, the indispensability argument loses its force.

## Section 7.2: Naturalism — Mathematics Through the Lens of Scientific Practice

Maddy's "Three Forms of Naturalism" (*Oxford Handbook of Philosophy of Mathematics and Logic*) develops a **naturalist** account of mathematical methodology that does not rely on the indispensability argument.

<div class="definition">
<strong>Mathematical naturalism (Maddy).</strong> The philosopher has no special authority to criticize or revise mathematical practice from the outside. Mathematical methods — the axioms chosen, the standards of proof accepted, the questions pursued — are justified by the internal norms of mathematics itself, not by external philosophical criteria.
</div>

Maddy identifies three forms:

1. **Ontological naturalism**: We ought to believe what our best science says, including its mathematical commitments. (Close to Quine's view.)
2. **Methodological naturalism**: Mathematical methods are self-justifying; there is no external standpoint from which to evaluate them.
3. **Second-philosophy**: Philosophy should proceed like natural science — empirically, without a priori commitments. Mathematical ontology is to be assessed the same way as scientific ontology: by examining the theoretical role that positing mathematical objects plays.

Maddy ultimately favors a form of methodological naturalism that takes mathematical practice as the primary data for the philosophy of mathematics, while remaining agnostic about the metaphysics of mathematical objects.

<div class="remark">
<strong>Implication for foundational debates.</strong> If mathematical methods are self-justifying, the classical foundational debates (logicism, formalism, intuitionism) look like philosophical overreach: they tried to ground mathematics in something outside mathematics (logic, finitism, mental construction). Naturalism suggests this project was misconceived.
</div>

---

# Chapter 8: Logical Pluralism — Is There One True Logic?

## Section 8.1: The Question of Logical Pluralism

Classical logic assumes a determinate, language-independent set of logical laws — including the law of excluded middle (\(P \vee \neg P\)) and the law of non-contradiction (\(\neg(P \wedge \neg P)\)). Intuitionism (Chapter 4) rejects the law of excluded middle. Paraconsistent logics reject the law of non-contradiction. Relevance logics reject the paradoxes of material implication.

**Logical pluralism** is the view that there is no single correct logic — different logical systems may all be correct relative to different standards, purposes, or domains.

<div class="definition">
<strong>Logical pluralism.</strong> There is more than one correct logic. Different inference relations (classical, intuitionistic, paraconsistent) are all valid relative to different notions of consequence or different purposes.
</div>

## Section 8.2: Finn on Limiting Logical Pluralism

Suki Finn's "Limiting Logical Pluralism" (*Synthese*, 2021) argues for a constrained version of logical pluralism. Finn accepts that multiple logical systems can be legitimate but argues that pluralism must be bounded:

- **Too permissive pluralism** (anything goes) is self-undermining: if every logic is correct, the claim "classical logic is incorrect" can be made in some logic, but so can "classical logic is correct," making pluralism trivial.
- **Limiting pluralism** holds that some logics are correct in their domains and for their purposes, while others are not. The limits are set by the internal standards of the domains in which logics are used.

For the philosophy of mathematics, this raises the question: is classical logic the correct logic for mathematics, or does mathematics require a constructive (intuitionistic) logic? Finn's framework suggests the answer may depend on what we take mathematics to be about.

<div class="remark">
<strong>Connection to foundations.</strong> The choice of logic is not independent of the choice of foundational position. Intuitionism requires a change of logic; formalism is neutral on questions of mathematical ontology but restricts metamathematics to finitary reasoning; logicism requires classical logic. Pluralism raises the possibility that these foundational debates are partly disputes about which logic to use in different contexts.
</div>

---

# Chapter 9: The Applicability of Mathematics

## Section 9.1: Wigner's Puzzle Revisited

Wigner's 1959 essay raises the puzzle in its classical form: the complex number system was invented to solve polynomial equations and then turned out to be essential for quantum mechanics; Riemannian geometry was a pure mathematical exercise and then became the language of general relativity. These "unreasonable" applications suggest a deep harmony between mathematical structure and physical reality.

Sorin Bangu's "Wigner's Puzzle for Mathematical Naturalism" (*International Studies in the Philosophy of Science*, 2009) argues that **mathematical naturalism** — the view that mathematics is justified by internal mathematical norms — has no satisfying answer to Wigner's puzzle. If mathematics is justified purely internally, there is no reason to expect it to describe the external world. The applicability of mathematics is evidence that mathematical truth is not merely conventional or internal.

## Section 9.2: Islami — Against the Miracle Narrative

Arezoo Islami's "A Match Not Made in Heaven: On the Applicability of Mathematics in Physics" (*Synthese*, 2017) challenges the premises of Wigner's puzzle.

Islami argues that the "unreasonable effectiveness" narrative depends on several assumptions that do not withstand scrutiny:

1. **Selection bias**: We notice and celebrate the cases where mathematical structures turn out to be applicable. We do not equally notice the vast mathematical structures that have no physical application.

2. **Feedback between mathematics and physics**: Physics has historically guided the development of mathematics (calculus was developed *for* mechanics; distribution theory was developed *for* quantum mechanics). The supposed independence of mathematical development from physical motivation is exaggerated.

3. **The "match" is not as perfect as claimed**: Mathematical models of physical systems are always approximations. The claim that mathematics "exactly" describes physical reality masks the fact that every physical model involves idealization.

<div class="remark">
<strong>Philosophical upshot.</strong> If Islami is right, Wigner's puzzle rests on a distorted history of mathematics and physics. The "miracle" dissolves when we attend to the actual practice of applying mathematics: it involves active adjustment, approximation, and selection — not a mysterious pre-established harmony.
</div>

---

# Chapter 10: The Nature of Mathematical Proof

## Section 10.1: Formal vs. Informal Proof

A standard view of mathematical proof is that a proof is valid if and only if it can be formalized — represented as a derivation in a formal system. But the proofs mathematicians actually write and accept are not formal derivations; they are informal arguments in natural language mixed with mathematical notation. The connection between informal and formal proof is not transparent.

Fenner Tanswell's "A Problem with the Dependence of Informal Proofs on Formal Proofs" (*Philosophia Mathematica*, 2015) argues against the **formalizability thesis** — the claim that a proof is valid iff it can in principle be formalized. Tanswell's problem: informal proofs are not merely abbreviated formal proofs. They contain semantic information (references to concepts, diagrams, intuitions) that formal proofs do not capture. The relationship between them is not one of abbreviation but of **representation** — and the representation is lossy.

<div class="definition">
<strong>The formalizability thesis.</strong> An informal mathematical proof is valid if and only if it could in principle be expanded into a formal derivation in an appropriate formal system.
</div>

Tanswell's objection: informal proofs are evaluated by mathematicians using criteria that go beyond formal derivability — including **explanatory power**, **fruitfulness**, and **perspicuity**. A valid formal derivation that no one can understand is not a satisfactory proof in the mathematical sense.

## Section 10.2: Fallibilism About Mathematical Knowledge

Silvia De Toffoli's "Groundwork for a Fallibilist Account of Mathematics" (*The Philosophical Quarterly*, 2021) argues for a fallibilist epistemology of mathematics: mathematical knowledge is not infallible, even in the presence of proof.

<div class="definition">
<strong>Mathematical fallibilism.</strong> Mathematical knowledge is subject to revision. Even accepted proofs may turn out to be incorrect upon closer inspection; the community may have accepted a gap or an error that is later discovered.
</div>

De Toffoli's evidence: the history of mathematics contains many proofs initially accepted and later found to be flawed (Cauchy's "proof" that the limit of continuous functions is continuous; early proofs in algebraic topology that required correction). Fallibilism about mathematical knowledge is compatible with recognizing that mathematics is highly reliable — it is merely not *infallible*.

Philosophical implication: if mathematical knowledge is fallible, the contrast between mathematical certainty and empirical uncertainty is one of degree, not kind. This supports a naturalist view of mathematics as continuous with empirical science.

---

# Chapter 11: Alternative and Critical Mathematics

## Section 11.1: Could Mathematics Be Fundamentally Different?

The question "could there be a different mathematics?" has two distinct senses:

1. **Formal alternatives**: Could there be a consistent formal system with different axioms that is equally well-founded? (Yes — e.g., non-Euclidean geometries, set theories with or without the Axiom of Choice.)
2. **Deep alternatives**: Could there be a mathematics based on fundamentally different logical and conceptual principles, reflecting a different relationship between humans and the world?

Franci Mangraviti's "Critical Math Kinds: A Framework for the Philosophy of Alternative Mathematics" (*Erkenntnis*, 2024) addresses the second sense. Mangraviti distinguishes between:

- **Formal alternatives**: Consistent formal systems that differ from standard mathematics.
- **Critical math kinds**: Mathematical frameworks that arise from and respond to different cultural, social, or epistemological contexts — not merely different axioms but different foundational commitments and goals.

<div class="remark">
<strong>Example.</strong> Indigenous mathematical traditions may structure relationships between quantities, spaces, and patterns according to principles that are not straightforwardly encodable in standard set-theoretic mathematics. Whether such traditions constitute "alternative mathematics" in Mangraviti's sense, or whether they are better described as different mathematical applications, is itself a philosophical question.
</div>

## Section 11.2: Indigenous Perspectives and Mathematics Education

Nicol, Thom, Doolittle, Glanfield, and Ghostkeeper's "Mathematics Education for STEM as Place" (*ZDM–Mathematics Education*, 2023) examines the relationship between mathematical knowledge and place — specifically, the ways in which Indigenous communities organize mathematical knowledge in relation to land, community, and practice.

The paper argues that mathematics education framed entirely within Western set-theoretic and formal traditions excludes other legitimate ways of knowing and relating to mathematical structure. This is connected to the broader question of **mathematical pluralism** — whether there are multiple legitimate mathematical traditions — and to Canada's Calls to Action regarding Indigenous education.

For the philosophy of mathematics, this raises the question: if mathematics is, as the naturalist says, characterized by its internal norms and practices, and if different communities have different norms and practices, is there a single mathematics or many?

---

# Chapter 12: Philosophy of Data-Driven Science

## Section 12.1: Computer Simulation as a New Method

Paul Humphreys's "The Philosophical Novelty of Computer Simulation Methods" (*Synthese*, 2009) argues that computer simulation represents a genuinely new epistemic method that challenges traditional accounts of scientific inference.

Classical scientific inference proceeds either from theory to observation (deduction) or from observations to theory (induction). Computer simulation occupies an intermediate position:

- The simulation is run on a model that encodes theoretical assumptions.
- The simulation produces output that can be compared with empirical data.
- But the simulation also explores consequences of the model that cannot be derived analytically — it functions as a kind of **computational experiment**.

<div class="remark">
<strong>Implications for mathematics.</strong> Simulation raises new questions about the role of mathematics in science. The mathematical structures used in simulations are discretized and approximate — the continuous differential equations of physics are replaced by difference equations on a grid. Does this affect the philosophical analysis of applicability (Chapter 9)? Does it affect questions of understanding and explanation (Chapter 13)?
</div>

## Section 12.2: Spurious Correlations and the Limits of Data

Cristian Calude and Giuseppe Longo's "The Deluge of Spurious Correlations in Big Data" (*Foundations of Science*, 2017) argues that large datasets systematically generate spurious statistical correlations — patterns that appear significant but have no explanatory value.

The mathematical argument: given a large enough dataset and a wide enough range of variables, the probability of finding *some* statistically significant correlation is essentially 1 — even if the variables are causally independent. The standard threshold for statistical significance (p < 0.05) provides weaker protection as data sets grow.

<div class="definition">
<strong>Spurious correlation.</strong> A statistically significant correlation between two variables that arises by chance (or due to a common cause, selection bias, or data-dredging) rather than from a genuine causal or explanatory relationship.
</div>

Philosophical implications:
- Big data mining is not theory-neutral: the choice of what variables to collect and what correlations to search for reflects prior theoretical commitments.
- Statistical significance is not the same as scientific significance: a correlation can be statistically improbable and scientifically meaningless.
- The epistemological norms of data science are not the same as those of theory-driven science; the differences deserve explicit philosophical analysis.

---

# Chapter 13: Mathematical Explanation and Understanding

## Section 13.1: What Makes a Mathematical Explanation Explanatory?

Mathematics is used in science in at least two ways: as a tool for calculation and as providing genuine **explanations**. When we explain why cicadas have prime-number life cycles by appealing to number theory, or why honeycombs are hexagonal by appealing to the geometry of optimal packings, is the mathematical content doing explanatory work, or merely redescribing the phenomenon?

Ellen Lehet's "Mathematical Explanation in Practice" (*Axiomathes*, 2021) examines how mathematical explanations function in actual mathematical practice — not just as they appear in finished published proofs, but as mathematicians work through problems.

Lehet distinguishes between:
- **Proofs that merely establish** a result (a derivation one follows without seeing *why* it is true).
- **Proofs that explain** a result (a derivation that reveals the underlying structure that makes the result necessary).

The explanatory proofs tend to involve **generalization** — showing that the result follows from more general principles — and **connection** — revealing how the result is related to other known results. Explanatory proofs increase mathematical *understanding*.

## Section 13.2: Mathematical Understanding

Jessica Carter's "Mathematical Understanding — Common Themes in Philosophy and Mathematics Education" (*Journal of Mathematical Behavior*, 2024) examines the concept of mathematical understanding from both philosophical and pedagogical angles.

<div class="definition">
<strong>Mathematical understanding.</strong> A mathematician understands a result when they can: (a) connect it to other results and principles; (b) apply it in new contexts; (c) recognize why it must be true, not merely that it is true; and (d) identify the key ideas that make the proof work.
</div>

Carter argues that understanding is not the same as being able to verify a proof. A student may be able to follow each step of a proof — checking that each inference is valid — without understanding *why* those steps work or what the result means. Understanding involves a richer cognitive relationship with the mathematical content.

**Connection to AI**: The rise of AI-assisted proof verification (e.g., Lean, Coq) raises the question of whether a verified proof constitutes mathematical knowledge or understanding. A proof assistant can verify that a derivation is formally valid without having any understanding of it. This challenges the identification of mathematical knowledge with formal provability and highlights the distinctively human character of mathematical understanding.

<div class="remark">
<strong>Implications for philosophy of mathematics.</strong> If mathematical understanding is irreducible to formal derivability, then formal proofs do not exhaust what mathematics is about. This supports fallibilism (Chapter 10) — informal, understanding-generating proofs are epistemically valuable in a way that formal derivations are not — and raises questions about what it means for AI systems to "do mathematics."
</div>
