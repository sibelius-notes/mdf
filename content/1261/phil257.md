---
title: "PHIL 257: Philosophy of Mathematics"
prof: "Patricia Marino"
---

## Sources and References

**Primary readings** — Benacerraf, Paul, and Hilary Putnam, eds. *Philosophy of Mathematics: Selected Readings*, 2nd ed. Cambridge University Press, 1984. (Contains Hilbert, Heyting, and Benacerraf selections.)

**Supplementary texts** — Stillwell, John. *Roads to Infinity: The Mathematics of Truth and Proof*. A K Peters/CRC Press, 2010. — Shapiro, Stewart. *Thinking About Mathematics: The Philosophy of Mathematics*. Oxford University Press, 2000. — Iemhoff, Rosalie. "Intuitionism in the Philosophy of Mathematics." *Stanford Encyclopedia of Philosophy*, 2020. — Linnebo, Øystein. "Platonism in the Philosophy of Mathematics." *Stanford Encyclopedia of Philosophy*, 2018. — Friend, Michèle. *Introducing Philosophy of Mathematics*. Acumen, 2007.

**Online resources** — Stanford Encyclopedia of Philosophy (plato.stanford.edu): entries on Logicism and Neologicism, Hilbert's Program, Gödel's Incompleteness Theorems, Indispensability Arguments in the Philosophy of Mathematics, Naturalism in the Philosophy of Mathematics, Logical Pluralism, Philosophy of Mathematics (general entry). — Internet Encyclopedia of Philosophy: entries on Mathematical Platonism, Structuralism in the Philosophy of Mathematics.

---

# Chapter 1: Introduction to Philosophy of Mathematics

## 1.1 What Is Philosophy of Mathematics?

Philosophy of mathematics asks foundational questions about the nature, scope, and justification of mathematical knowledge. These questions are not mathematical — they are not solved by calculation or proof — but they concern mathematics at every level. Three clusters of questions organize the field.

The first cluster is **ontological**: What are mathematical objects? Do numbers, sets, and functions exist? If they exist, are they abstract (outside space and time, causally inert) or concrete? If they do not exist, what are mathematical statements about? This cluster leads directly to positions like Platonism (mathematical objects exist independently of minds), nominalism (they do not), and structuralism (mathematics is about structures, not objects).

The second cluster is **epistemological**: How do we know mathematical truths? If mathematical objects are abstract, we cannot perceive them or causally interact with them — so what explains mathematical knowledge? This question motivates much of the course, culminating in the Benacerraf dilemma (Chapter 4).

The third cluster is **semantic**: What do mathematical statements mean? Are they true or false? Is "2+2=4" true in the same sense that "there are brown dogs" is true? Or do mathematical sentences have a different semantic status — perhaps they are rules, or useful fictions, or tautologies?

## 1.2 Infinity, Paradox, and the Foundations Crisis

John Stillwell's *Roads to Infinity* frames the course's opening by tracing how mathematicians' attempts to handle infinity produced foundational crises that forced philosophical reconsideration of what mathematics is.

The ancient Greek tradition avoided actual infinity (a completed infinite totality) in favor of potential infinity (the inexhaustible continuation of a process). This restriction was philosophically motivated: actual infinity seemed paradoxical (Zeno's paradoxes of motion; the problem of infinite divisibility).

The nineteenth century changed everything. Cantor's development of set theory gave mathematics a precise language for actual infinities. He proved that infinite sets come in different sizes: the natural numbers \(\mathbb{N}\) are **countably infinite**, while the real numbers \(\mathbb{R}\) are **uncountably infinite** — strictly larger. The diagonal argument establishing this is one of the most celebrated in all of mathematics.

<div class="theorem">
<strong>Cantor's Theorem.</strong> For any set \(S\), the power set \(\mathcal{P}(S)\) (the set of all subsets of \(S\)) has strictly greater cardinality than \(S\). In particular, \(|\mathcal{P}(\mathbb{N})| > |\mathbb{N}|\).
</div>

But Cantor's paradise came with serpents. Russell's paradox (1901) showed that naive set comprehension — the principle that any predicate defines a set — is contradictory.

<div class="example">
<strong>Russell's Paradox.</strong> Let \(R = \{x : x \notin x\}\) be the set of all sets that do not contain themselves. Then \(R \in R \iff R \notin R\), a contradiction. Naive set theory is inconsistent.
</div>

This paradox, along with Burali-Forti's paradox about the set of all ordinals and related antinomies, precipitated the **foundations crisis** of the early twentieth century. Three major programs emerged as responses: logicism (reduce mathematics to logic), formalism (treat mathematics as a formal game with symbols), and intuitionism (reconstruct mathematics on constructive, finitary grounds). Chapters 2 and 3 examine formalism and intuitionism in detail.

## 1.3 Gödel's Results: A Preview

Stillwell's chapters on Gödel prepare the reader for the most dramatic result of the foundations crisis. In 1931, Kurt Gödel proved two incompleteness theorems that shattered Hilbert's formalist program. The first shows that any consistent formal system strong enough to express elementary arithmetic contains true statements that cannot be proved within the system. The second shows that no such system can prove its own consistency. These results are examined philosophically in Chapter 2.

<div class="remark">
The course returns repeatedly to a single overarching tension: mathematics seems to be both <strong>certain</strong> (we feel we cannot be wrong about 2+2=4) and <strong>mysterious</strong> (we cannot fully explain how we know it, or what it is about). The foundational crisis, Gödel's theorems, the Benacerraf dilemma, and debates about proof and explanation are all attempts to negotiate this tension.
</div>

---

# Chapter 2: Hilbert's Formalism and Gödel's Incompleteness Theorems

## 2.1 Hilbert's Program

David Hilbert's "On the Infinite" (1926) is the canonical statement of **mathematical formalism** and the ambitions of what came to be called **Hilbert's program**. Writing against the backdrop of the foundations crisis, Hilbert sought a definitive resolution: mathematics would be placed on an unassailable foundation by formalizing all of mathematics into a rigorous axiomatic system and then proving — by purely finitary, combinatorial means — that this system is consistent.

Hilbert distinguished three modes of mathematical existence:

1. **Finitary mathematics** — arithmetic of concrete, finite operations on finite strings of symbols. This is the bedrock, the content of which is indubitable.
2. **Ideal mathematics** — classical mathematics extended with infinite totalities (actual infinities, the law of excluded middle applied to infinite domains). This is where real analysis, set theory, and most of modern mathematics lives.
3. **Metamathematics** — the study of formal systems themselves, using finitary means to prove properties (consistency, completeness) of the formal systems used for ideal mathematics.

The goal: show that ideal mathematics, though it speaks of infinite objects, is a **conservative extension** of finitary mathematics — it never produces false finitary results, even if its internal "objects" are fictions. In Hilbert's famous phrase, "no one shall drive us from the paradise that Cantor has created for us."

<div class="definition">
<strong>Consistency and Completeness.</strong> A formal system is <strong>consistent</strong> if it does not prove both a statement \(\phi\) and its negation \(\neg\phi\). A system is <strong>complete</strong> if for every statement \(\phi\) in its language, either \(\phi\) or \(\neg\phi\) is provable.
</div>

Hilbert's program required both: a system complete enough to decide all mathematical questions, and consistent enough that its results could be trusted.

## 2.2 Gödel's Incompleteness Theorems

In 1931, Kurt Gödel published his incompleteness results and demolished Hilbert's program. The two incompleteness theorems are among the most philosophically significant results in the history of mathematics.

<div class="theorem">
<strong>Gödel's First Incompleteness Theorem.</strong> Any consistent formal system \(F\) that is sufficiently expressive (capable of representing basic arithmetic) is <strong>incomplete</strong>: there exists a sentence \(G_F\) in the language of \(F\) such that neither \(G_F\) nor \(\neg G_F\) is provable in \(F\).
</div>

The key technical innovation is **Gödel numbering**: assigning a natural number to every symbol, formula, and proof in the system, so that statements about the formal system can be encoded as arithmetic statements. This allows the system to "talk about itself." The Gödel sentence \(G_F\) essentially says "I am not provable in \(F\)." If \(F\) is consistent, \(G_F\) must be true but unprovable.

<div class="theorem">
<strong>Gödel's Second Incompleteness Theorem.</strong> No consistent formal system \(F\) satisfying the above conditions can prove its own consistency. That is, \(\text{Con}(F)\) is not provable in \(F\).
</div>

This directly refutes Hilbert's program: the consistency proof Hilbert sought cannot be carried out within the very system whose consistency is in question. Any consistency proof requires a stronger system — which itself cannot prove its own consistency, and so on.

## 2.3 Philosophical Significance: Feferman's Analysis

Solomon Feferman's paper "The Nature and Significance of Gödel's Incompleteness Theorems" is a careful philosophical assessment of what the results do and do not show.

Feferman argues against several overreaching interpretations:

- **The results do not refute formalism tout court.** They show that no single formal system captures all mathematical truth, but formalists can respond by accepting a hierarchy of systems.
- **The results do not show that human mathematical intuition transcends all formal systems** (as J.R. Lucas and Roger Penrose famously argued). The Gödelian argument shows that for any given system we accept, we can construct a stronger one — but this iteration is itself formalizable.
- **The results do not establish Platonism.** That the Gödel sentence is "true" presupposes a standard model of arithmetic; a formalist can deny that this presupposition is coherent.

What the results do establish is more modest but profound: the mathematical universe cannot be exhausted by any single, finitely specifiable set of axioms. There is an irreducible **openness** to mathematical truth. For Hilbert's goal of a complete, decidable axiomatization of all mathematics, Gödel's theorems are fatal.

<div class="remark">
The incompleteness theorems also sharpen the epistemological puzzle at the heart of the course. If there are true mathematical statements that cannot be proved in any given system, then mathematical truth outruns provability — and the question of how we know mathematical truths becomes more urgent, not less. This connects directly to the Benacerraf dilemma in Chapter 4.
</div>

---

# Chapter 3: Mathematical Intuitionism and Constructivism

## 3.1 Brouwer's Intuitionism

**Intuitionism** is the most radical of the three foundational schools. Its founder, L.E.J. Brouwer, held that mathematics is a languageless mental construction: mathematical objects are mental constructions, mathematical truth is constructibility, and the logic of mathematics must be revised to reflect this.

Brouwer's key claims:

1. **Mathematics is independent of language.** Mathematical objects do not exist in a Platonic realm, nor are they defined by formal systems — they are mental constructions. Language and formal systems are merely secondary, imperfect attempts to communicate these constructions.
2. **A mathematical statement is true only if there exists a mental construction that verifies it.** This replaces the classical conception of truth (a statement is true if it corresponds to mathematical reality) with a constructive one.
3. **The principle of excluded middle (\(P \lor \neg P\)) is not generally valid.** For Brouwer, asserting \(P \lor \neg P\) requires either a proof of \(P\) or a proof of \(\neg P\). For statements about infinite collections, neither may be available. Classical logic is therefore not a correct logic for infinite mathematics.

<div class="example">
<strong>Goldbach's Conjecture.</strong> Every even number greater than 2 is the sum of two primes. This is currently unproved. A classical mathematician says it is either true or false. An intuitionist says neither can be asserted until a proof or a disproof is constructed.
</div>

## 3.2 Heyting's Formalization

Arend Heyting, Brouwer's student, gave intuitionism its formal shape. His two assigned texts — "The Intuitionistic Foundations of Mathematics" and "Disputation" — present the intuitionistic position both rigorously and accessibly.

In "Disputation," Heyting employs a dialogue between a classical mathematician ("Class") and an intuitionist ("Int") to dramatize the philosophical disagreements. The dialogue reveals that the dispute is not merely about which axioms to adopt, but about the meaning of mathematical language. For Int, logical connectives have different meanings than for Class:

<div class="definition">
<strong>Brouwer-Heyting-Kolmogorov (BHK) Interpretation.</strong> In intuitionistic logic, the meaning of logical connectives is given by what constitutes a proof:
<ul>
  <li>A proof of \(P \land Q\) is a proof of \(P\) together with a proof of \(Q\).</li>
  <li>A proof of \(P \lor Q\) is either a proof of \(P\) or a proof of \(Q\) (with a specification of which).</li>
  <li>A proof of \(P \to Q\) is a method that transforms any proof of \(P\) into a proof of \(Q\).</li>
  <li>A proof of \(\neg P\) is a method that transforms any hypothetical proof of \(P\) into a contradiction.</li>
  <li>There is no proof of \(\bot\) (absurdity).</li>
</ul>
</div>

Under this interpretation, \(P \lor \neg P\) is not a logical law: having neither a proof of \(P\) nor a refutation of \(P\) means \(P \lor \neg P\) is not assertible.

## 3.3 Constructive Mathematics and Its Consequences

**Constructivism** is broader than Brouwer's intuitionism: it includes any approach that requires explicit constructions as witnesses for existential claims. The constructive requirement has significant bite:

<div class="example">
<strong>A non-constructive existence proof.</strong> Classical proof: "Either \(\sqrt{2}^{\sqrt{2}}\) is rational or it is irrational. If it is rational, take \(a = b = \sqrt{2}\). If it is irrational, take \(a = \sqrt{2}^{\sqrt{2}}\) and \(b = \sqrt{2}\); then \(a^b = 2\), which is rational." This proves there exist irrationals \(a, b\) with \(a^b\) rational, without identifying which case holds. A constructivist rejects this as an adequate existence proof.
</div>

Constructivism is motivated by the view that mathematical existence claims require a witness, not merely the logical impossibility of non-existence. This connects to the epistemology of mathematics — a constructive proof provides an explicit reason to believe the conclusion, while a non-constructive proof merely establishes that denial leads to contradiction.

The price of constructivism is substantial: large parts of classical analysis, topology, and algebra must be either abandoned or extensively reworked. Among the classically valid principles that intuitionistic logic rejects: the law of excluded middle, proof by contradiction (in certain forms), and the axiom of choice (in its unrestricted form).

<div class="remark">
Intuitionism's revision of logic anticipates the logical pluralism discussed in Chapter 6. If different domains of discourse (finite vs. infinite mathematics) require different logics, the question arises whether there is a single correct logic at all. Heyting's work is thus both a contribution to the foundations crisis and a precursor to later debates about logical normativity.
</div>

---

# Chapter 4: Mathematical Truth and the Benacerraf Dilemma

## 4.1 The Semantic Requirement

Paul Benacerraf's 1973 paper "Mathematical Truth" remains the single most influential paper in the philosophy of mathematics. Its central argument — the **Benacerraf dilemma** — sets the agenda for virtually all subsequent work in the field.

Benacerraf begins with a semantic constraint: any adequate account of mathematical truth must conform to the same semantic framework governing all natural language sentences. Mathematical sentences like "There are prime numbers greater than 100" should be true in the same compositional, referential sense as empirical sentences like "There are brown dogs."

This Tarskian requirement is not merely conventional. If mathematical sentences had a fundamentally different semantic structure, we would need a special semantics for mathematics. This would be philosophically suspicious: why should mathematics require different semantic treatment? If we apply uniform semantics, the sentence "There are prime numbers greater than 100" is true in virtue of there being objects — numbers — with certain properties. Mathematical truth requires mathematical objects.

## 4.2 The Epistemological Requirement

The second constraint is epistemological: any adequate account of mathematical knowledge must fit into a general theory of knowledge. Benacerraf adopts a broadly **causal theory of knowledge**: for S to know that P, S must be appropriately causally connected to the facts that make P true.

This is a plausible constraint on empirical knowledge. I know there is a tree in my garden because light reflected from the tree causes visual experiences in me; my belief is causally connected to its truth-maker. For mathematical knowledge, the causal account requires that mathematicians be causally connected to mathematical truth-makers.

## 4.3 The Dilemma

The two requirements are in tension:

<div class="theorem">
<strong>The Benacerraf Dilemma.</strong>
<ol>
  <li>(Semantic constraint) Mathematical sentences are true in virtue of abstract mathematical objects.</li>
  <li>(Epistemological constraint) Mathematical knowledge requires causal connection to mathematical truth-makers.</li>
  <li>Abstract objects are non-spatial, non-temporal, and causally inert.</li>
  <li>Therefore, mathematicians cannot be causally connected to mathematical truth-makers.</li>
  <li>Therefore, mathematicians cannot have mathematical knowledge.</li>
  <li>But mathematicians clearly do have mathematical knowledge. Contradiction.</li>
</ol>
</div>

Neither horn of the dilemma is comfortable:

- **Platonism** (accept horn 1, reject horn 2): Mathematical objects exist as abstract entities. This honors the semantic constraint but requires either abandoning the causal epistemology or positing a mysterious special faculty of "mathematical intuition" — an epistemic faculty connecting minds to abstract, causally inert objects. What is this faculty? How did it evolve? Why should we trust it?

- **Formalism or nominalism** (accept horn 2, reject horn 1): Mathematics is formal symbol manipulation with no real referents. This makes mathematical knowledge tractable (it is rule-following) but destroys the semantic parallel with empirical language. "2+2=4" turns out not to be true in any robust sense — it is merely a theorem of a formal system. But this seems to misrepresent mathematical practice and mathematical truth.

## 4.4 Structuralism and Other Responses

Benacerraf elsewhere (in "What Numbers Could Not Be," 1965) argues that numbers cannot be identified with any particular set-theoretic construction. The von Neumann ordinals and the Zermelo numerals both correctly model the natural numbers — yet they are different sets. If numbers were sets, there would be a fact about which construction they are. Since there is no such fact, numbers are not sets.

This suggests **structuralism**: mathematics is not about particular objects but about **structural positions** within abstract structures. The number 2 is not the set \(\{\emptyset, \{\emptyset\}\}\) but rather the role played by whatever occupies the second position in any \(\omega\)-sequence. Structuralism attempts to honor the semantic constraint (there are genuine mathematical facts) while making the epistemological constraint more tractable (we access structures through pattern recognition and abstraction, not perception of abstract objects).

<div class="remark">
No response to the Benacerraf dilemma is entirely satisfying, and this is a genuine feature of the problem, not a failure of philosophical imagination. The dilemma reveals that our best theories of meaning and knowledge, when applied to mathematics, generate contradictions. This motivates the naturalist turn examined in the next chapter.
</div>

---

# Chapter 5: Indispensability, Naturalism, and Mathematical Practice

## 5.1 The Quine-Putnam Indispensability Argument

One influential response to the Benacerraf dilemma bypasses the causal epistemology entirely. The **Quine-Putnam indispensability argument** argues that we are justified in believing in mathematical entities for the same reason we are justified in believing in electrons and quarks: they are indispensable to our best scientific theories.

<div class="definition">
<strong>Indispensability Argument.</strong>
<ol>
  <li>We ought to believe in the existence of entities that are indispensable to our best confirmed scientific theories.</li>
  <li>Mathematical entities (numbers, sets, functions) are indispensable to our best confirmed scientific theories.</li>
  <li>Therefore, we ought to believe in mathematical entities.</li>
</ol>
</div>

The argument is naturalistic in spirit: it grounds mathematical ontology in scientific practice rather than in a priori philosophical reasoning. It avoids the causal epistemology problem by treating mathematics like theoretical physics — justified holistically by the success of the theories in which it appears. On Quine's holism, the whole web of belief (including mathematics) is confirmed or disconfirmed together by experience.

## 5.2 Maddy's Critique: The Argument from Scientific Practice

Penelope Maddy's 1992 paper "Indispensability and Practice" is a sustained attack on the indispensability argument from the perspective of what scientists and mathematicians actually do.

Maddy's first objection concerns **idealization**. Scientists routinely use mathematical structures they do not believe accurately describe physical reality:

- Continuous fluid dynamics treats fluids as infinitely divisible, though physicists know fluids are molecular.
- Perfectly rigid bodies appear in classical mechanics, though no physical body is perfectly rigid.
- Infinite populations are used in population genetics, though all real populations are finite.

If scientists do not believe their own idealizations, the mathematics employed in those idealizations is not genuinely indispensable — it is a **convenient fiction**. Quine's confirmation holism — the assumption that the whole theory is confirmed together — is empirically false: different parts of a scientific theory carry different epistemic weights. The mathematical structure of a successful theory may reflect idealization, not ontology.

Maddy's second objection concerns **set-theoretic excess**. If the indispensability argument were correct, we should believe only in the mathematics actually used in physics. But mathematicians take seriously large cardinal axioms (inaccessible cardinals, measurable cardinals, Woodin cardinals) that vastly exceed what any physical application requires. Set theorists pursue these structures because they are mathematically interesting and illuminating, not because they are indispensable to physics.

<div class="example">
<strong>Large cardinals.</strong> A measurable cardinal is an uncountable cardinal \(\kappa\) admitting a countably complete nonprincipal ultrafilter. Their existence cannot be proved in ZFC. Yet set theorists investigate their properties extensively — not because physics needs them, but because they illuminate the structure of the set-theoretic universe. The indispensability argument would label this investigation unjustified; mathematicians do not agree.
</div>

## 5.3 Maddy's Naturalism

Maddy is herself a naturalist — she holds that philosophy should defer to scientific and mathematical practice rather than imposing prior philosophical constraints on them. Her critique of the indispensability argument is thus an internal critique: she argues that genuine attention to practice, rather than a schematic philosophical argument about practice, undermines the argument's premises.

In "Three Forms of Naturalism," Maddy distinguishes:

1. **Ontological naturalism**: only natural entities exist (motivates the indispensability argument).
2. **Methodological naturalism**: philosophical method should follow scientific method.
3. **Mathematical naturalism**: mathematical practice has its own standards of justification that philosophy should respect, not override.

Mathematical naturalism is Maddy's preferred position. It implies that the correct account of mathematical existence and justification must emerge from careful study of mathematical practice — what mathematicians do, what questions they pursue, what standards they apply — rather than from external philosophical arguments. This approach places philosophy of mathematics in dialogue with the sociology and history of mathematics in a way that earlier, more a priori approaches did not.

---

# Chapter 6: Logical Pluralism and Its Limits

## 6.1 What Is Logical Pluralism?

**Logical pluralism** is the view that there is more than one correct logic — more than one system of inference that is genuinely valid. This is a surprising thesis: logic is usually conceived as the science of what follows from what, implying a unique answer. Pluralism challenges this.

The main pluralist position in contemporary philosophy is **Beall and Restall's**: logical validity is truth-preservation in all cases, where what counts as a "case" can vary. Different logics correspond to different precisifications of "case":

- **Classical logic**: valid inferences preserve truth in all possible worlds.
- **Intuitionistic logic**: valid inferences preserve truth across all stages of constructive inquiry.
- **Relevant logic**: valid inferences preserve truth in all situations (information states that may be incomplete).

On this view, all three logics are correct — they are correct relative to their respective case types. Logical pluralism is not relativism but the recognition that "follows from" has multiple coherent precisifications.

## 6.2 Finn's Constraint: Modus Ponens and Universal Instantiation

Suki Finn's 2021 paper "Limiting Logical Pluralism" accepts that some pluralism is defensible but argues it cannot be unlimited. Her thesis: any candidate for a logic must validate **modus ponens** (MP) and **universal instantiation** (UI) as necessary conditions for counting as a logic in the relevant sense.

<div class="definition">
<strong>Modus Ponens (MP).</strong> From \(P\) and \(P \to Q\), infer \(Q\).
</div>

<div class="definition">
<strong>Universal Instantiation (UI).</strong> From \(\forall x\, F(x)\), infer \(F(a)\) for any term \(a\) in the domain.
</div>

Finn's argument for MP: without MP, the concept of logical consequence collapses. MP is what makes conditional reasoning possible — it is the core of deductive inference. A formal system that rejects MP is not recognizable as a system for determining what follows from what; it is some other kind of formal system.

Finn's argument for UI: without UI, generality is undermined. Logical reasoning applies to all instances of a general claim. Without UI, universal quantification loses its force. The generality that characterizes logical reasoning — that valid inference holds in all cases — requires UI.

## 6.3 Implications: Moderate Pluralism

The constraint rules out the most radical candidate logics while preserving the standard alternatives:

| Logic | Validates MP? | Validates UI? | Finn's verdict |
|---|---|---|---|
| Classical logic | Yes | Yes | Legitimate |
| Intuitionistic logic | Yes | Yes | Legitimate |
| Relevant logic | Yes | Yes | Legitimate |
| Some radical paraconsistent systems | Restricted | Restricted | Not legitimate logics |
| Some fuzzy logics | Qualified | Qualified | Case-by-case |

What is ruled out is the unlimited proliferation of "logics" to include any deviant formal system. Pluralism is true — classical, intuitionistic, and relevant logic are all legitimate — but it is bounded by meta-logical constraints defining what a logic is.

<div class="remark">
Finn's result connects to a broader theme in the course: even revisionary or pluralist positions in the philosophy of mathematics and logic are constrained by structural requirements that cannot be abandoned without changing the subject. Mangraviti's framework in Chapter 9 identifies seven dimensions of dominant mathematics; Finn identifies the non-negotiable core of logical systems. Both show that pluralism has limits.
</div>

---

# Chapter 7: The Applicability of Mathematics

## 7.1 Wigner's Puzzle

Eugene Wigner's 1960 paper "The Unreasonable Effectiveness of Mathematics in the Natural Sciences" identifies one of the deepest and least understood facts about the relationship between mathematics and physics. Wigner was a physicist; his examples are drawn from the history of theoretical physics, and his tone is one of genuine intellectual astonishment.

The phenomenon Wigner identifies: mathematical structures developed for purely aesthetic or abstract reasons, with no scientific application in mind, turn out to be precisely the tools needed to describe physical reality. His canonical examples:

- **Complex numbers**, developed to solve cubic equations, became indispensable for quantum mechanics. The wave function of quantum mechanics is irreducibly complex-valued.
- **Non-Euclidean geometries**, developed by Gauss, Lobachevsky, and Riemann as abstract alternatives to Euclidean geometry, turned out to describe the curvature of spacetime in general relativity.
- **Matrix algebra**, developed by Cayley for abstract algebraic reasons, was the mathematical structure Heisenberg needed for his matrix mechanics formulation of quantum mechanics.

Wigner distinguishes two miracles. The first is that nature is governed by mathematical laws at all — that physical regularities can be expressed in mathematical form. The second, deeper miracle is that abstract mathematical structures, developed without reference to physics, turn out to be exactly the right structures for physics.

<div class="definition">
<strong>The Unreasonable Effectiveness Thesis (Wigner).</strong> The applicability of mathematics to physics vastly exceeds what could be explained by (a) mathematics being abstracted from physical experience, (b) selection bias in noticing when mathematics applies, or (c) coincidence. No satisfactory explanation of this phenomenon exists.
</div>

Wigner explicitly declines to offer a resolution, calling the effectiveness a "gift" that "we neither understand nor deserve."

## 7.2 Islami's Response: Invariance

Arezoo Islami's 2017 paper "A Match Not Made in Heaven" reframes Wigner's puzzle as an **epistemological** rather than metaphysical problem. The question is not "why does abstract mathematics objectively fit physical reality?" but "why are we able to find the right mathematical tools?" And this question has a tractable answer: **invariance**.

Physical laws are covariant — they have the same mathematical form regardless of coordinate system, reference frame, or observer. This is not accidental: what counts as a physical law is precisely what is invariant under the relevant symmetry transformations. The requirement that physical laws be covariant is a deep constraint on the mathematics that can represent them.

The mathematics that encodes invariance — **Lie groups**, **representations of symmetry groups**, **tensor calculus** — is therefore not coincidentally applicable to physics. It is the mathematics of invariance, and physics requires invariance mathematics. When mathematicians developed group theory or Riemannian geometry, they were (often unknowingly) studying structures physically relevant because they are invariance structures.

<div class="example">
<strong>Noether's Theorem.</strong> Every continuous symmetry of a physical system corresponds to a conserved quantity. Time-translation symmetry yields conservation of energy; spatial-translation symmetry yields conservation of momentum. The Lie group framework captures these systematically. The mathematics is applicable because both mathematics and physics are tracking the same invariance structure.
</div>

Islami's argument shifts what remains mysterious: not "why does abstract math fit physics?" but "why does nature have the symmetry structure it has?" The latter is a residual mystery, but a better-posed and more tractable question.

## 7.3 What Remains Puzzling

Even after invariance is invoked, Islami does not claim to dissolve all of Wigner's puzzle. She shifts the residual mystery from epistemology to metaphysics: the question of why the physical world has the particular symmetry structure it does remains open. A realist can say that nature's symmetries are objective features that mathematics captures; an anti-realist can say that symmetry requirements are constraints we impose, and the applicable mathematics follows from our representational choices.

The exchange between Wigner and Islami illustrates a general philosophical methodology: careful description of a phenomenon (Wigner) followed by principled theoretical explanation (invariance) that restructures the question without necessarily answering it completely.

---

# Chapter 8: Proofs, Formal Derivations, and Fallibilism

## 8.1 Two Conceptions of Proof

The concept of **proof** is central to mathematics. But there are two distinct pictures of what a proof is:

1. **Formal proof**: a finite sequence of symbols where each line is either an axiom or follows from previous lines by an explicit inference rule. Formal proofs are syntactic objects — they can be mechanically verified.
2. **Informal proof**: the proofs published in mathematical journals and textbooks, which use natural language, diagrams, appeals to intuition, and high-level reasoning that presupposes shared mathematical knowledge.

The relationship between these two notions — whether informal proofs are reliable in virtue of being translatable into formal derivations — is the subject of the two assigned papers.

## 8.2 Tanswell: The Overgeneration Problem

Fenner Tanswell's 2015 paper "A Problem with the Dependence of Informal Proofs on Formal Proofs" targets **derivationism**: the view that informal proofs are correct in virtue of being translatable into formal derivations in a system like ZFC.

The **overgeneration problem**: formal derivation systems sanction far more "proofs" than working mathematicians recognize as genuine.

- **Automated theorem provers** can generate formal derivations of many theorems, but these derivations — potentially millions of lines of symbol manipulation — are not recognized by mathematicians as proofs in any meaningful sense. They are formally correct but epistemically useless.
- **Redundant derivations**: in any standard proof system, infinitely many trivially equivalent "proofs" of any theorem can be generated by inserting redundant steps. All are formally correct; only some are genuine proofs.
- **Surveyability concerns**: the four-color theorem (Appel-Haken 1976) and the Kepler conjecture (Hales 1998) were initially proved by computer-assisted methods. Mathematicians were reluctant to accept these as proofs precisely because no human could survey the reasoning. This resistance was not a failure to recognize formal correctness — it was a recognition that something beyond formal correctness is required.

Tanswell also identifies an **undergeneration problem**: some informal arguments that mathematicians accept as genuine proofs have no corresponding formal derivation in standard systems — or the derivation is so complex that it cannot be said to "exist" in any practical sense. Some mathematical reasoning uses diagrams, topological intuition, or geometric argumentation in ways not transparently formalizable.

<div class="remark">
Together, overgeneration and undergeneration show that formal derivability is neither necessary nor sufficient for mathematical proof as practiced. The standards of acceptable proof are richer, more contextual, and more community-dependent than derivationism allows.
</div>

## 8.3 De Toffoli: Fallibilism and Simil-Proofs

Silvia De Toffoli's 2021 paper "Groundwork for a Fallibilist Account of Mathematics" challenges the assumption that mathematical knowledge is infallible — that proved theorems are known with certainty.

The empirical case against infallibilism: mathematical history is full of published "proofs" later found to be flawed. The Jordan Curve Theorem, the classification of finite simple groups, and many results in algebraic topology had proofs that were believed, extensively cited, and later corrected. If infallibilism were correct, none of these constituted genuine knowledge at the time — but this contradicts the epistemic reality that mathematicians were rational to believe them.

De Toffoli's positive account centers on the concept of a **simil-proof**:

<div class="definition">
<strong>Simil-proof.</strong> A mathematical argument that (a) is convincing to competent practitioners; (b) provides genuine epistemic reasons to believe the conclusion; (c) does not meet the full formal standards of a complete proof — it may be a sketch, a visual argument, a computer-assisted result, or a proof with minor gaps that the community accepts as closeable.
</div>

Simil-proofs are not defective proofs awaiting completion — they are a legitimate epistemic category with their own standards. The standards are social and contextual: what the mathematical community at a given time accepts as constituting adequate grounds for a conclusion. This is not relativism — there are objective standards for good mathematical reasoning — but the standards are richer than formalization captures.

The fallibilist account holds that mathematical justification comes in degrees. The highest degree does not require the absence of all possibility of error, but the absence of reasonable doubt given available evidence. A simil-proof provides genuine (if defeasible) justification. This positions De Toffoli's work as a companion piece to Tanswell's: where Tanswell shows that derivationism fails descriptively, De Toffoli provides the positive account of what informal mathematical justification actually is.

---

# Chapter 9: Alternative Mathematics and Indigenous Perspectives

## 9.1 Dominant Mathematics and Its Ideology

Philosophy of mathematics has historically focused on a single conception of mathematics: abstract, deductive, formal, universal, and value-neutral. The readings for this section examine challenges to this conception from two directions — a systematic framework for alternative mathematics, and an Indigenous epistemological critique of STEM education.

Franci Mangraviti's 2024 paper "Critical Math Kinds: A Framework for the Philosophy of Alternative Mathematics" provides a systematic analysis. Mangraviti identifies seven **dimensions of dominant mathematics** — features that mainstream mathematical culture treats as constitutive of mathematics itself:

| Dimension | Content |
|---|---|
| Deductive justification | Proofs are the gold standard; informal or inductive justification is subordinate |
| Formalizability | Mathematics is in principle expressible in a formal language |
| Classical logic | The law of excluded middle and other classical principles hold |
| Set-theoretic grounding | Mathematical objects are ultimately sets or set-like entities |
| Pure/applied worldliness | Pure mathematics is distinct from and epistemically prior to applications |
| Objectivity | Mathematical truths are mind-independent |
| Ethical neutrality | Mathematics is value-free; ethics is external to mathematical practice |

These seven dimensions are not logically independent — a challenge to one often implicates others — but they provide a principled taxonomy of what counts as mainstream mathematical ideology.

## 9.2 Critical Math Kinds

Mangraviti defines a **critical math kind** (CMK) as a mathematical practice whose practitioners collectively and self-consciously destabilize one or more of these seven dimensions in a way that is visible and contested within the mathematical community. The definition is explicitly relative to time and society: what is a CMK in one context may be absorbed into the mainstream in another.

Four critical levels:

1. **Inert**: nominally deviating from one dimension without genuine challenge.
2. **Conservative**: challenging one dimension in a way largely compatible with the others.
3. **Progressive**: challenging multiple dimensions simultaneously.
4. **Radical**: seeking to overturn the dominant ideology comprehensively.

The framework distinguishes genuine CMKs from alternatives that were merely temporarily heterodox. Non-well-founded set theory and nonstandard analysis challenged the set-theoretic grounding dimension but were ultimately absorbed into mainstream mathematics without disrupting other dimensions — they are not genuine CMKs. By contrast:

- **Constructive mathematics as ideological critique** challenges formalizability, classical logic, and objectivity simultaneously — a progressive CMK.
- **Feminist philosophy of mathematics** challenges objectivity and ethical neutrality — a progressive CMK.
- **Paraconsistent mathematics** challenges classical logic and the primacy of consistency — potentially a progressive CMK.

## 9.3 STEM as Place: Indigenous Perspectives

Nicol, Thom, Doolittle, Glanfield, and Ghostkeeper's 2023 paper "Mathematics Education for STEM as Place" argues for a fundamental reconceptualization of STEM education drawing on Canadian Indigenous epistemologies.

The **critique of dominant STEM ideology**: mainstream STEM education is framed around economic growth, national competitiveness, and technological innovation. This ideology treats the natural world as a resource — raw material for human projects. It is both ethically problematic (extractive and anthropocentric) and epistemically narrow (excluding non-Western and non-human forms of knowledge).

The **alternative — STEM as place**: in Indigenous epistemologies, land, water, and living systems are not merely contexts for learning but are themselves sources of knowledge and partners in inquiry. Mathematical ideas arise from and are embedded in specific places. This is a stronger claim than "use real-world contexts for motivation": place has epistemic authority.

<div class="example">
<strong>More-than-human intelligence.</strong> Mycelial networks exhibit distributed computation and nutrient transfer resembling graph-theoretic optimization. Lotus leaves exhibit superhydrophobicity arising from geometric surface structure. Peacock feathers produce structural color via photonic crystal geometry. Coral reefs display fractal growth patterns and cooperative construction. The paper treats these as genuine mathematical and engineering knowledge distributed across species and ecosystems — not metaphors for mathematics, but instances of it.
</div>

The criterion of educational success shifts from **productivity and economic value-creation** to **continuity of life** — whether practices sustain ecosystems, promote reciprocity, and support long-term flourishing.

In Mangraviti's terms, the "STEM as place" vision is a progressive CMK: it simultaneously challenges objectivity (mathematical knowledge is embedded in place), ethical neutrality (STEM is always already value-laden), and pure/applied worldliness (the distinction between pure mathematics and its ecological applications is itself ideologically motivated).

---

# Chapter 10: Computer Simulation, Machine Learning, and Big Data

## 10.1 Computer Simulation as a New Method

Paul Humphreys' 2009 paper "The Philosophical Novelty of Computer Simulation Methods" argues that computer simulation is a genuinely new kind of scientific method — not reducible to either classical experiment or mathematical analysis.

- **Classical experiment**: manipulates actual physical systems to observe outcomes. The world itself provides the data.
- **Mathematical analysis**: derives conclusions from equations analytically. The mathematician can, in principle, trace every step.
- **Computer simulation**: constructs a mathematical model, implements it computationally, and generates output interpreted as representing system behavior. Unlike experiment, it manipulates no actual physical system. Unlike analytical mathematics, its conclusions are not derived by tracing through equations — they emerge from computation.

The philosophically significant feature is what Humphreys calls **essential epistemic opacity**: in a complex simulation (weather modeling, protein folding, fluid turbulence), output is generated by billions of computational steps that no human can individually examine. The opacity is not contingent — it is essential. Simulations are used precisely because analytical solution is impossible, and such systems are necessarily complex enough to be opaque.

<div class="definition">
<strong>Essential Epistemic Opacity.</strong> A computational process is essentially epistemically opaque if it is impossible for any human to trace the full causal path from inputs to outputs — not merely practically difficult, but impossible given the volume and complexity of operations involved.
</div>

Standard scientific verification requires being able to trace the reasoning from assumptions to conclusion. Essential opacity undermines this in a novel way: unlike a proof with a gap, a simulation's output cannot in principle be verified by tracing through the steps. This requires new epistemological standards — cross-model comparison, sensitivity analysis, benchmarking against known cases — that represent a genuine departure from pre-computational science.

## 10.2 The Deluge of Spurious Correlations

Cristian Calude and Giuseppe Longo's 2017 paper "The Deluge of Spurious Correlations in Big Data" offers a mathematically grounded critique of the "end of theory" thesis — the claim (associated with Chris Anderson's 2008 *Wired* essay) that big data renders scientific theorizing obsolete. With enough data, the thesis holds, correlation replaces causation and theory is unnecessary.

The authors' central argument: as datasets grow, the proportion of discovered correlations that are spurious necessarily increases. This is a mathematical theorem, not a contingent fact about statistical methods.

<div class="theorem">
<strong>Ramsey-theoretic foundation (Van der Waerden's theorem).</strong> For any positive integers \(r\) and \(k\), there exists \(W(r,k)\) such that any partition of \(\{1, 2, \ldots, W(r,k)\}\) into \(r\) color classes contains a monochromatic arithmetic progression of length \(k\). More generally: any sufficiently large dataset must contain structured sub-patterns regardless of the generating process.
</div>

These patterns are combinatorially necessary — they arise from dataset size, not from real structure in the domain. Calude and Longo give a precise criterion for spuriousness:

<div class="definition">
<strong>Spurious Correlation.</strong> A correlation discovered in a dataset is spurious if it also appears in an algorithmically random database of the same size and type — a database that is maximally incompressible in the Kolmogorov-Chaitin sense, containing no real structure. Ramsey results guarantee that even maximally random datasets contain such patterns at sufficient size.
</div>

The practical implication: as data volume grows, absolute numbers of spurious correlations grow faster than meaningful ones. Statistical significance testing cannot fix this — the multiple comparisons problem explodes with dataset size. The **need for theoretical guidance increases with data volume**. The "end of theory" is mathematically impossible.

<div class="remark">
Humphreys and Calude-Longo converge on a theme: the epistemological demands of computational and data-driven science are not reduced by scale — they are intensified. More mathematics, more theory, and more principled analysis are required, not less. This bears on the course's broader examination of the role of mathematical knowledge in science and the relationship between formal structure and empirical inquiry.
</div>

---

# Chapter 11: Mathematical Explanation and Understanding

## 11.1 Explanation Beyond Proof

The course closes by asking: what is it to understand mathematics, and what makes a mathematical argument explanatory? These questions distinguish between knowing that a theorem is true (having a proof) and understanding why it is true. Not every proof explains.

<div class="example">
<strong>Two proofs of the triangular number formula \(\sum_{k=1}^{n} k = \frac{n(n+1)}{2}\).</strong>

<em>Proof by induction:</em> Base case \(n=1\): \(1 = \frac{1 \cdot 2}{2}\). Inductive step: assume true for \(n\); then \(\sum_{k=1}^{n+1} k = \frac{n(n+1)}{2} + (n+1) = \frac{(n+1)(n+2)}{2}\). The proof is valid but many find it uninformative — it verifies without explaining.

<em>Gauss's pairing argument:</em> Pair up the terms symmetrically: \((1 + n),\, (2 + (n-1)),\, \ldots\). Each pair sums to \(n+1\), and there are \(\frac{n}{2}\) such pairs. Total: \(\frac{n(n+1)}{2}\). This argument reveals <em>why</em> the formula has the form it does — the structure of the pairing is the explanation.
</div>

The distinction motivates a philosophy of mathematical explanation that goes beyond formal derivability.

## 11.2 Lehet's Framework: Familiarity and Understanding

Ellen Lehet's 2021 paper "Mathematical Explanation in Practice" develops an **understanding-first** approach. Following Inglis and Mejía-Ramos, Lehet holds that mathematical explanation is whatever produces mathematical understanding — so the right question is: what is mathematical understanding?

Lehet's answer: mathematical understanding is **familiarity** with mathematical objects, structures, and their context — knowing how things connect, what properties matter, what techniques apply, and how a result fits into the broader mathematical landscape. Understanding is an orientation to the mathematical terrain.

This reframes the explanatory question. Instead of asking "Why is this true?" (which is often answered by a valid but non-illuminating proof), understanding-seeking asks **"What is going on here?"** This question prompts broader orientation: it connects the result to related results, techniques, and structures.

Lehet's key innovation: explanation is not limited to proofs. **Definitions** can be independently explanatory — a definition is explanatory when it reveals mathematical structure, increases familiarity, and clarifies what is mathematically essential. Different definitions of the same concept can have different explanatory value in different contexts.

**Diagrams** are also independently explanatory. Lehet's examples include:

- **Stereographic projection**: reveals the topological structure of the sphere in a way that symbolic descriptions do not.
- **The triangular number diagram** (dots arranged in a triangle): makes the sum formula geometrically visible — the pairing argument is a diagram argument.
- **Virtual-knot diagrams**: illuminate knot-theoretic structure in ways that symbolic notation cannot.

These diagrams answer "What is going on here?" independently of formal justification. They are not mere heuristic aids but genuine sources of mathematical understanding.

## 11.3 Carter's Five-Dimensional Framework

Jessica Carter's 2024 paper "Mathematical Understanding — Common Themes in Philosophy and Mathematics Education" maps the concept of understanding across three communities: philosophers of mathematics, mathematical practitioners, and mathematics educators. The survey reveals genuine diversity that Carter organizes using a five-dimensional framework:

| Dimension | Questions it tracks |
|---|---|
| Agent | Who understands? (Individual, community, student?) |
| Mathematics | What is understood? (Proof, concept, result, theory, method?) |
| Purpose | Why does understanding matter? (Practice, justification, teaching?) |
| Quality | What does understanding consist in? (Cognitive grasp, reliability, relational knowledge?) |
| Temporality | Is understanding a state or a process? (Achieved vs. ongoing) |

The framework explains apparent contradictions between accounts. A philosopher focused on explanatory proofs and a mathematics educator focused on procedural vs. conceptual understanding are not contradicting each other — they are addressing different dimensions (Quality and Purpose, respectively).

Despite the diversity, Carter identifies two convergences across all three communities:

1. **Relations**: Understanding is repeatedly characterized as seeing **connections** — between results, methods, representations, concepts. Isolated knowledge of facts is not understanding; understanding involves grasping how things hang together.
2. **Visual re-presentation**: Multiple traditions converge on the importance of re-presenting mathematical content visually as a powerful route to understanding. This connects directly to Lehet's account of explanatory diagrams and to De Toffoli's work on visual reasoning as a form of simil-proof.

## 11.4 Synthesis: The Epistemology of Mathematical Practice

The readings across Chapters 8 through 11 converge on a revised picture of mathematical epistemology:

1. **Mathematical knowledge is not reducible to formal proof.** Definitions, diagrams, sketches, analogies, and contextual orientation all contribute independently to mathematical understanding and justification (Lehet, Carter, De Toffoli).
2. **Mathematical justification is fallible and graded.** The highest degree of justification does not require the absence of all possibility of error (De Toffoli). Mathematical history confirms this: genuine knowledge can precede complete proof.
3. **Standards of proof and understanding are social and contextual.** What counts as an explanation, an adequate proof, or an illuminating definition depends on the standards of the mathematical community at a given time — not as a form of relativism, but as recognition that mathematical practice has a richer structure than any single formal criterion captures (Tanswell, De Toffoli, Carter).
4. **Visual reasoning is epistemically legitimate.** Diagrams are not merely heuristic — they constitute genuine understanding and genuine justification (Lehet, Carter).

<div class="remark">
The philosophy of mathematics that emerges across this course is simultaneously more epistemically humble and more philosophically rich than the traditional infallibilist conception. Mathematical knowledge is genuine, but it is fallible, contextual, partially social, and achieved through a variety of epistemic means — formal proofs, simil-proofs, definitions, diagrams, analogies, and the cultivated familiarity of the working mathematician. The foundational questions with which the course began — What are mathematical objects? How do we know mathematical truths? What do mathematical sentences mean? — remain open. But the course has equipped us with the tools and positions through which these questions can be approached with rigor and precision.
</div>
