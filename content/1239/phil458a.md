---
title: "PHIL 458a: Philosophy of Applied Mathematics"
prof: "Doreen Fraser"
subjects: "PHIL"
---

## Sources and References

**Primary texts**

- Wigner, Eugene. "The Unreasonable Effectiveness of Mathematics in the Natural Sciences." *Communications on Pure and Applied Mathematics* 13.1 (1960): 1–14.
- Steiner, Mark. *The Applicability of Mathematics as a Philosophical Problem*. Harvard University Press, 1998.
- Pincock, Christopher. *Mathematics and Scientific Representation*. Oxford University Press, 2012.
- Batterman, Robert. *The Devil in the Details: Asymptotic Reasoning in Explanation, Reduction, and Emergence*. Oxford University Press, 2002.
- Field, Hartry. *Science Without Numbers: A Defence of Nominalism*. Princeton University Press, 1980.
- Resnik, Michael. *Mathematics as a Science of Patterns*. Oxford University Press, 1997.
- Shapiro, Stewart. *Philosophy of Mathematics: Structure and Ontology*. Oxford University Press, 1997.
- Maddy, Penelope. *Naturalism in Mathematics*. Oxford University Press, 1997.
- Quine, W.V.O. *From a Logical Point of View*. Harvard University Press, 1953.
- Baker, Alan. "Are There Genuine Mathematical Explanations of Physical Phenomena?" *Mind* 114.454 (2005): 223–238.
- Bueno, Otávio. "An Easy Road to Nominalism." *Mind* 121.484 (2012): 967–982.
- Colyvan, Mark. *The Indispensability of Mathematics*. Oxford University Press, 2001.

**Online resources**

- Balaguer, Mark. "Platonism in Mathematics." *Stanford Encyclopedia of Philosophy* (SEP), 2016.
- Linnebo, Øystein. "Structuralism and the Notion of Dependence." *SEP*, 2017.
- Leng, Mary. "Fictionalism in the Philosophy of Mathematics." *SEP*, 2020.
- Colyvan, Mark. "Indispensability Arguments in the Philosophy of Mathematics." *SEP*, 2019.
- Irvine, Andrew David. "Epistemic Logicism and Russell's Regressive Method." *SEP*, 2015.

---

# Chapter 1: Why Does Mathematics Work? The Applicability Problem

## 1.1 Setting the Stage

One of the most striking features of modern science is the extent to which it is written in the language of mathematics (数学). We use differential equations to model the spread of disease, complex numbers to describe quantum states, and Riemannian geometry to articulate the curvature of spacetime. The sheer success of these applications demands philosophical explanation. Why should an abstract discipline — one pursued by mathematicians on grounds of logical necessity, elegance, and internal coherence — turn out to describe the concrete, contingent, physical world?

This question, which we will call the **applicability problem** (应用性问题), is the animating puzzle of this course. It sits at the intersection of epistemology (认识论), metaphysics (形而上学), and philosophy of science (科学哲学). To answer it requires engaging with deep questions about the nature of mathematical objects, the structure of scientific theories, and the relationship between abstract and concrete domains.

## 1.2 The Three Philosophical Problems of Applicability

Philosophers have found it useful to decompose the applicability problem into three structurally distinct sub-problems, each targeting a different dimension of the relationship between mathematics and the world.

<div class="definition">
<strong>The Ontological Problem:</strong> What must the world be like, and what must mathematical objects be like, in order for the former to be correctly described by the latter? If mathematical objects are abstract and causally inert — existing outside space and time — then their applicability to the concrete, spatiotemporal world is deeply puzzling. The ontological problem asks whether the structure of mathematical objects is in some way the structure of physical reality, or whether the two domains are fundamentally different kinds of thing.

<strong>The Semantic Problem:</strong> In what sense do mathematical statements, as they appear in scientific theories, refer to or represent the physical world? When a physicist writes \( F = ma \), are the variables ranging over physical quantities, abstract mathematical objects, or both? The semantic problem concerns how the language of mathematics manages to say something true about the physical world given that mathematical vocabulary was designed to talk about abstract structures.

<strong>The Epistemic Problem:</strong> How do we come to know that a given mathematical structure correctly represents a given physical system? If our knowledge of mathematics is a priori and our knowledge of physics is a posteriori, how do these two epistemic routes combine to yield knowledge of applied mathematical claims? The epistemic problem is the hardest: it sits at the interface of pure logical reasoning and empirical investigation.
</div>

These three problems are not fully independent. An ontological view that identifies mathematical structure with physical structure (as the Pythagoreans held) dissolves the semantic problem — mathematical language just describes physical structure directly — and transforms the epistemic problem into the general problem of scientific knowledge. Conversely, a sharp ontological gap between abstract mathematics and concrete physics sharpens both the semantic and epistemic problems.

## 1.3 Three Grades of Applicability

Not all applications of mathematics are philosophically equal. It is useful to distinguish three grades at the outset.

<div class="definition">
<strong>Grade 1 — Logical applicability:</strong> Mathematics applies whenever a domain has enough structure to be modeled by a mathematical system. Since any sufficiently regular domain can in principle be represented formally, this grade is near-trivial.

<strong>Grade 2 — Representational applicability:</strong> A specific mathematical structure maps accurately onto the quantitative features of a specific physical system. This is non-trivial and requires explanation.

<strong>Grade 3 — Heuristic applicability:</strong> Mathematical concepts developed for purely internal mathematical reasons turn out to guide the discovery of new physical laws. This is the deepest and most philosophically puzzling grade.
</div>

The history of physics is full of Grade 3 cases. Hermann Weyl's gauge symmetry, developed as a mathematical generalization of general relativity, later became the foundational framework for quantum electrodynamics. Paul Dirac's purely mathematical demand that the quantum-mechanical wave equation be linear in both space and time derivatives led him to predict the existence of the positron — a particle not yet observed at the time. These are not cases of mathematics being fitted to known data; they are cases of mathematics leading inquiry.

## 1.4 Historical Antecedents: Pythagoreanism and Galileo

The applicability problem has ancient roots. The **Pythagoreans** (毕达哥拉斯学派) held that numbers are the ultimate constituents of reality — that the world just *is* mathematical in its fundamental nature. This radical thesis dissolves the applicability problem rather than solving it: if the world is made of mathematical structure, no further explanation is needed for why mathematics applies.

Galileo Galilei famously declared that "the book of nature is written in the language of mathematics." His scientific practice embodied this conviction: by idealizing physical systems (ignoring friction, treating bodies as point masses), he discovered that the motion of projectiles follows a parabolic path, exactly as the geometry of conic sections dictates. The idealization is crucial — the real world is messy, but mathematical models of idealized systems capture something real.

<div class="remark">
The Galilean strategy of idealization raises its own puzzle: if the mathematical model is of an idealized, non-actual system, in what sense is it describing reality? This tension between abstraction and applicability will recur throughout the course, especially in our discussion of Batterman's work on asymptotic reasoning.
</div>

The nineteenth century added another layer to this history. The invention of non-Euclidean geometry by Gauss, Bolyai, and Lobachevsky was entirely internally motivated — mathematicians exploring the logical consequences of denying Euclid's parallel postulate. No one expected these geometries to be physically realized. Yet Riemann's generalization, developed in his 1854 Habilitationsschrift as pure mathematics, became the exact mathematical language Einstein needed for general relativity sixty years later. This is perhaps the single most compelling historical instance of what Wigner would later call the "unreasonable effectiveness" of mathematics: a mathematical structure invented in a purely abstract context, with no physical motivation, turning out to be precisely what physics required. James Clerk Maxwell's unification of electricity, magnetism, and optics via his equations also drew heavily on abstract mathematical developments (the vector calculus of Hamilton and Tait), again illustrating how formal mathematical tools developed in one context find unexpected physical applications.

## 1.5 The Structure of the Course

The course proceeds in three broad movements. First, we survey the main positions in the **philosophy of mathematics** proper — Platonism, structuralism, and fictionalism — asking what mathematical objects are and whether they exist. Second, we examine accounts of how mathematics *represents* physical reality, focusing on Pincock's mapping account and Batterman's analysis of idealization. Third, we assess the major arguments about the relationship between mathematics and science: Wigner's puzzle about unreasonable effectiveness, the Quine-Putnam indispensability argument, Field's nominalist response, and Baker's enhanced indispensability argument from mathematical explanation.

---

# Chapter 2: Philosophy of Mathematics — Platonism, Structuralism, Fictionalism

## 2.1 The Ontological Question

Before we can understand how mathematics applies to the world, we need a view about what mathematics is. The central ontological question in philosophy of mathematics is: what are mathematical objects, and do they exist?

**Platonism** (柏拉图主义), **structuralism** (结构主义), and **fictionalism** (虚构主义) represent three fundamentally different answers. Each carries different implications for the applicability problem.

## 2.2 Platonism

Mathematical Platonism holds that mathematical objects — numbers, sets, functions, geometric figures — are **abstract objects** (抽象对象) that exist independently of minds, language, and the physical world. The number \( \pi \) exists whether or not any physical circle exists, and whether or not any mathematician has ever contemplated it.

<div class="definition">
<strong>Mathematical Platonism</strong> is the conjunction of three theses:
<ol>
<li><em>Existence:</em> Mathematical objects exist.</li>
<li><em>Abstractness:</em> Mathematical objects are abstract — causally inert, non-spatiotemporal.</li>
<li><em>Independence:</em> Mathematical truths are independent of the mental and linguistic activities of mathematicians.</li>
</ol>
</div>

The epistemological challenge for Platonism is severe, and it is crystallized most sharply in what is now called the **Benacerraf dilemma** (贝纳塞拉夫困境), presented in Paul Benacerraf's landmark 1973 paper "Mathematical Truth." Benacerraf identified a tension between two equally desirable but apparently incompatible requirements on a philosophy of mathematics:

<div class="definition">
<strong>The Benacerraf Dilemma:</strong> A satisfactory philosophy of mathematics must satisfy two conditions simultaneously:
<ol>
<li><em>Semantic uniformity:</em> The semantics of mathematical statements should be continuous with the semantics of ordinary empirical statements. "There are at least three perfect numbers greater than 17" should be analyzed in the same way as "There are at least three large mammals in Africa" — as making genuine existential claims that are true or false depending on whether the relevant objects exist.</li>
<li><em>Epistemic access:</em> Our account of mathematical knowledge should mesh with a plausible general account of human knowledge. On a broadly causal theory of knowledge, knowing that \( p \) requires that the truth-makers of \( p \) stand in an appropriate causal relation to the knower.</li>
</ol>
These two requirements conflict: satisfying (1) commits us to the existence of abstract mathematical objects, but satisfying (2) requires causal access to what we know about, and abstract objects, being causally inert, are inaccessible.
</div>

The force of the dilemma is that any response seems to sacrifice one horn. Non-standard semantic approaches — such as treating mathematical statements as not making genuine existential claims — preserve epistemic access but abandon uniform semantics. Full-blooded Platonism preserves uniform semantics but requires an account of how we acquire knowledge of abstract, causally inert objects.

Defenders of Platonism have responded in several ways. Gödel appealed to a faculty of **mathematical intuition** (数学直觉) — a quasi-perceptual capacity that provides direct epistemic access to mathematical structures. This preserves both horns but requires positing a mysterious cognitive faculty that few philosophers find credible. More sophisticated Platonists, such as Jerrold Katz and Penelope Maddy (in her earlier phase), have argued that the causal constraint on knowledge is simply not a necessary condition — we can have reliable methods of belief-formation that do not require causal contact with the objects known. The mathematical community's remarkable degree of convergence on mathematical results, despite the absence of causal contact with abstract objects, is offered as evidence that such non-causal knowledge is possible.

## 2.3 Structuralism

Structuralism, developed most systematically by Resnik and Shapiro, holds that mathematics is not about objects at all, but about **structures** (结构) — patterns of relations abstracted away from any particular instantiation.

<div class="definition">
<strong>Ante rem structuralism</strong> (Shapiro): Structures exist as abstract universals prior to and independently of any systems that instantiate them. The natural number structure exists independently of whether any concrete or abstract systems exemplify it. On this view, ante rem structuralism is a form of Platonism — it posits abstract structures — but shifts the ontological weight from individual objects (the number 3, the set \( \{\emptyset, \{\emptyset\}, \{\emptyset, \{\emptyset\}\}\} \)) to the holistic structure (the omega-sequence). Individual mathematical objects, like the number 3, are simply positions or roles within a structure: they have no intrinsic nature beyond their structural relations.

<strong>In re structuralism</strong> (Resnik): Structures exist only insofar as they are instantiated in concrete or abstract systems. There is no structure without a system to bear it. This view is more ontologically parsimonious but raises the question: what if a mathematical structure has no actual instances? If the relevant physical or mathematical systems do not exist, does the structure fail to exist? This threatens to make the existence of mathematical structures contingent on accidents of physical history.

<strong>Eliminative structuralism</strong>: Mathematical statements are implicitly general — "2 + 2 = 4" means "in any system satisfying the Peano axioms, the successor of the successor of zero added to itself equals the successor of the successor of the successor of zero." This view eliminates reference to structures entirely in favor of universal quantification over systems, but faces the objection that it requires an infinity of background systems to avoid vacuous truth — if no system satisfies the Peano axioms, all arithmetical statements come out trivially true.
</div>

The structuralist slogan is: *mathematical objects have no properties beyond their structural properties*. The number 2 has no intrinsic nature beyond being the object that comes after 1 and before 3 in the natural number structure. This view elegantly handles one of Benacerraf's two puzzles — his earlier puzzle (1965) about multiple reductions. Benacerraf observed that numbers can be identified with different sets: in von Neumann's reduction, 3 is \( \{0, 1, 2\} = \{\emptyset, \{\emptyset\}, \{\emptyset, \{\emptyset\}\}\} \); in Zermelo's reduction, 3 is \( \{\{\{\emptyset\}\}\} \). Since there is no principled reason to prefer one reduction over the other, neither identification can capture what numbers *are*. The structuralist response is that numbers are not any particular set; they are positions in the natural number structure, and any system that instantiates that structure equally well "is" the natural numbers. Identity across structures is not defined — asking whether the number 3 is identical to \( \{0, 1, 2\} \) is like asking whether the pawn in chess is the same object as the white pawn on the board — a category mistake.

For the applicability problem, structuralism offers a natural suggestion: physical systems that instantiate a mathematical structure are automatically described by the mathematics of that structure. The challenge is to explain why physical reality is so mathematically structured in the first place — why the deep structure of the universe should be the kind of structure that satisfies the axioms of our mathematical theories.

The **in re / ante rem** distinction also bears on applicability. The ante rem structuralist can say that physical structure instantiates pre-existing mathematical structure — the electromagnetic field equations describe the ante rem relational structure of the field. The in re structuralist cannot easily say this, because the structure exists only in the physical instantiation; there is no independent mathematical structure for the physics to "fit." This may make in re structuralism more deflationary about applicability but less prone to the epistemic access problem that afflicts ante rem views.

## 2.4 Fictionalism

Fictionalism, associated with Hartry Field, holds that mathematical statements are **false** (or, in a more nuanced formulation, neither true nor false but part of a useful fiction). Mathematical objects do not exist; statements purporting to refer to them are false in the same way that "Sherlock Holmes lived at 221B Baker Street" is false.

<div class="definition">
<strong>Mathematical fictionalism:</strong> Mathematical sentences that appear to make existential claims about abstract objects are literally false. Accepting mathematics for scientific purposes does not require believing it to be true; it requires only recognizing it as a useful instrument or fiction.
</div>

The fictionalist faces an obvious challenge: if mathematics is false, why is it so successful in science? Field's answer, developed in *Science Without Numbers*, is a two-step strategy. First, show that science can be nominalized — reformulated without quantification over abstract mathematical objects. Second, explain the utility of mathematics as a **conservative extension** (保守延伸) of the nominalistic theory: adding mathematical apparatus yields no new nominalistic consequences, so it is useful but not truth-apt in the relevant sense.

A second challenge for fictionalism concerns the semantics of mixed statements — statements that combine mathematical vocabulary with empirical vocabulary. When a physicist says "the electron has charge \( -1.6 \times 10^{-19} \) coulombs," is this statement true or false? The fictionalist must explain how a statement embedding a fiction (a real number) in an empirical claim can be true or warrant asserting. Some fictionalists, following Yablo, distinguish between **figurative** and **literal** content: the literal content of such statements may be false (because it quantifies over numbers), but the figurative content — what we are actually communicating — can be correct. This move preserves the pragmatic utility of mathematical talk while maintaining fictionalism about its literal content.

A third variant of fictionalism, developed by Mary Leng, argues for what she calls **mathematical fictionalism as a research program**: we should not merely tolerate mathematical fictions but actively investigate which fictions are useful, why they are useful, and what their structure reveals about the underlying nominalistic facts. On this view, the philosophy of applied mathematics is not a problem to be dissolved but a productive research program for understanding the relationship between mathematical structure and physical reality.

---

# Chapter 3: Wigner's Puzzle — The Unreasonable Effectiveness of Mathematics

## 3.1 Wigner's Argument

In his 1960 paper, physicist Eugene Wigner articulated what has become the canonical statement of the applicability puzzle. His central claim is worth quoting at length:

> "The miracle of the appropriateness of the language of mathematics for the formulation of the laws of physics is a wonderful gift which we neither understand nor deserve."

Wigner identifies two specific phenomena as puzzling. First, mathematical concepts developed without any physical application in mind regularly turn out to be precisely what physics needs. Second, physical theories formulated in a given mathematical framework typically yield predictions far beyond the original domain of application with uncanny precision.

<div class="example">
<strong>Example — complex numbers in quantum mechanics:</strong> Complex numbers were introduced to solve algebraic equations like \( x^2 + 1 = 0 \). There is no obvious sense in which physical quantities should be complex-valued. Yet quantum mechanics requires the wavefunction \( \psi \) to be a complex-valued function, and the interference phenomena that result — which have been experimentally confirmed to extraordinary precision — depend essentially on the complex phase. The complex number \( e^{i\theta} \) is not a mere notational convenience; it does physical work.

<strong>Example — non-Euclidean geometry in general relativity:</strong> Riemannian geometry was developed in the nineteenth century as pure mathematics, exploring the logical consequences of relaxing Euclid's parallel postulate. Einstein found, four decades later, that Riemannian geometry is precisely the right tool for describing a curved spacetime. The curvature tensor \[ R_{\mu\nu} - \frac{1}{2} g_{\mu\nu} R + \Lambda g_{\mu\nu} = \frac{8\pi G}{c^4} T_{\mu\nu} \] had been lying in wait, as it were, for a physical application.
</div>

## 3.2 Diagnosing the Puzzle

What exactly is puzzling? Several diagnoses are possible.

The **selection bias objection** holds that Wigner's examples are cherry-picked. For every case of mathematics developed independently that later found a physical application, there are countless mathematical structures — abstract algebra built around exotic algebraic varieties, higher-dimensional topology, combinatorics of infinite cardinals — that have found no physical application at all. The archive of pure mathematics vastly outstrips the mathematical vocabulary of physics. If we count only the successes, we will naturally be impressed; but a rational assessment requires acknowledging the base rate of failures.

Wigner was aware of this objection and responded that even the successes are too numerous and too precise to be accounted for by selection bias alone. The laws of physics are not merely approximate descriptions; they are extraordinarily accurate over vast ranges of scales and conditions. The accuracy of quantum electrodynamics, for instance, matches experiment to one part in \( 10^{12} \). Selection bias might explain why mathematics and physics occasionally connect; it does not explain why the connections are quantitatively exact and predictively powerful across previously untested regimes.

The **anthropic objection** suggests that creatures capable of doing science would inevitably find the universe mathematically tractable, since the ability to do science requires mathematical thinking. This response is less convincing: it explains why we would *notice* mathematical regularities, but not why they exist in the first place. The anthropic consideration explains epistemic selection (we notice what we can understand) but not metaphysical facts about the structure of reality.

## 3.3 Steiner's Extension: Pythagorean Heuristics

Mark Steiner's *The Applicability of Mathematics as a Philosophical Problem* (1998) extends Wigner's puzzle in a philosophically precise direction. Steiner distinguishes between **applicability** in a thin sense (mathematical structures happen to describe physical ones) and a thick sense involving **Pythagorean heuristics** — the use of purely mathematical, non-physical analogies to guide the discovery of new physical laws.

<div class="definition">
<strong>Pythagorean heuristic</strong> (Steiner): A heuristic strategy for discovering physical laws that proceeds by exploiting the formal or aesthetic properties of the mathematics used to describe known physical laws — properties that have no physical significance — to conjecture new laws.
</div>

Steiner supplies several compelling examples. The **Dirac equation** arose when Dirac demanded a relativistic wave equation that was first-order in the time derivative (to match Schrödinger's non-relativistic equation in form). The Klein-Gordon equation, which is second-order, seemed physically inelegant — not because of any known physical problem, but because of the *mathematical* asymmetry between the treatment of time and space in a first-order versus second-order equation. Demanding first-order linearity in all four spacetime derivatives forced Dirac to introduce the \( 4 \times 4 \) gamma matrices, which automatically encoded spin-\( 1/2 \) particles and, as a mathematical by-product, predicted the existence of antiparticles. The antielectron (positron) was discovered experimentally by Anderson in 1932, confirming Dirac's mathematically motivated prediction.

A second example is **Maxwell's displacement current**. Maxwell noticed that Ampère's law, as stated, was mathematically inconsistent when applied to circuits with capacitors (the divergence of current density is not zero in a time-varying field). He added a term — the displacement current — not because of any direct experimental evidence, but because mathematical consistency required it. The term predicted electromagnetic waves traveling at the speed of light, which Maxwell recognized as identifying light with electromagnetic radiation.

A third Steinerian example is the use of **group representation theory** in particle physics. The symmetry group of spacetime (the Poincaré group) and the gauge symmetry groups (SU(3) × SU(2) × U(1)) classify elementary particles by their transformation properties under these groups. Gell-Mann's prediction of the omega-minus particle used the mathematical structure of SU(3) representations — specifically, the 10-dimensional representation of the group — to predict the existence of a particle before its experimental detection. The mathematics of group theory, developed for internal mathematical reasons, served as the heuristic guide to new physics.

Steiner's argument is that if the universe were not, in some deep sense, "mathematically friendly," Pythagorean heuristics would not work. They would be as likely to mislead as to guide. Their track record of success is therefore evidence that the universe is responsive to mathematical form in a way that exceeds any mundane explanation.

<div class="remark">
Steiner's conclusion is quasi-anthropocentric: the universe is friendly to <em>human</em> mathematical thinking. Critics have charged that this involves a suspicious privileging of human cognitive categories. Why should the universe care about what strikes human mathematicians as elegant or natural? This connects to broader debates about the anthropic principle and cognitive science. Colyvan (2001) responds that Steiner's conclusion does not require anthropocentrism: the Pythagorean heuristics succeed not because the universe cares about human aesthetics, but because the mathematical properties exploited by those heuristics track genuine deep symmetries in the physical world. The elegance is tracking something real, even if it was not designed for human consumption.
</div>

---

# Chapter 4: Mapping Accounts of Applied Mathematics

## 4.1 The Representational Turn

Christopher Pincock's *Mathematics and Scientific Representation* (2012) approaches the applicability problem from a philosophy-of-science perspective. Rather than asking metaphysical questions about what mathematical objects are, Pincock asks: what is the relationship between a mathematical model and the physical system it represents?

His answer is a **mapping account** (映射账户): a mathematical structure represents a physical system by virtue of a **partial morphism** (部分同态) — a structure-preserving map from a domain of mathematical objects to features of the physical system.

## 4.2 Structure-Mapping and Partial Morphisms

<div class="definition">
Let \( M = \langle D_M, R_M \rangle \) be a mathematical structure with domain \( D_M \) and relations \( R_M \), and let \( P = \langle D_P, R_P \rangle \) be a physical system similarly construed. A <strong>partial morphism</strong> from \( M \) to \( P \) is a function \( f: D_M \to D_P \) such that for some (not necessarily all) relations \( R \in R_M \), if \( R(x_1, \ldots, x_n) \) holds in \( M \), then \( R'(f(x_1), \ldots, f(x_n)) \) holds in \( P \), where \( R' \) is the corresponding physical relation.
</div>

The partiality is essential: we do not require a full isomorphism, because mathematical models are always idealized. The model of a projectile as a point mass moving in a uniform gravitational field does not perfectly represent any actual projectile, but it captures enough structural features to generate accurate predictions within certain ranges.

<div class="example">
<strong>The heat equation:</strong> Consider Fourier's model of heat conduction. The mathematical structure is given by the partial differential equation \[ \frac{\partial T}{\partial t} = \alpha \nabla^2 T \] where \( T \) is temperature and \( \alpha \) is thermal diffusivity. The mapping assigns mathematical variables to measurable physical quantities (temperature at each point), and the equation's solutions map onto the temporal evolution of the temperature field. The mapping is partial because the equation assumes a continuous, homogeneous medium — an idealization no real material satisfies exactly.
</div>

## 4.3 The Varieties of Mathematical Representation

Pincock distinguishes several modes of mathematical representation, each making different demands on the mapping relation.

**Causal representation** occurs when the mathematical structure mirrors causal structure in the physical system. Newton's second law \( F = ma \) represents the causal relationship between net force, mass, and acceleration. The differential equation is not merely correlational; it encodes a causal generalization.

**Constitutive representation** occurs when mathematics defines or constitutes the very quantities it represents. Temperature, for instance, is not independently defined and then measured by thermometers; its definition is embedded in statistical mechanics and thermodynamics.

**Structural representation** is the most general case: mathematics represents the relational structure of a physical domain without necessarily capturing causal or constitutive features.

## 4.4 Batterman's Criticism of the Mapping Account

Robert Batterman has pressed what is perhaps the most incisive criticism of Pincock's mapping account. Batterman argues that many of the most important and explanatory uses of mathematics in physics do not involve finding a good map between a mathematical structure and a physical system. Instead, they involve **asymptotic analysis** — the mathematical investigation of how a family of models behaves as some parameter approaches a limit — and the explanatory work is done by the mathematics of the limiting behavior, not by the mapping to any particular physical system.

The critical point concerns what counts as a good representation. On Pincock's account, a representation is good when the partial morphism captures the relevant physical structure. But Batterman notes that in cases of universality and phase transitions, the mathematical structure that does the explanatory work — the fixed-point structure of the renormalization group — does not correspond to any actual physical system. It is a feature of an idealized infinite-system limit. The mapping account, Batterman charges, is a picture of applied mathematics that fits paradigm cases (Newtonian mechanics, simple wave equations) but breaks down precisely where the applications become most interesting and most explanatory.

<div class="remark">
Pincock has responded by distinguishing between <em>accurate</em> and <em>abstract</em> representations. Accurate representations satisfy partial morphisms tightly; abstract representations invoke mathematical structures that capture only very high-level features of a physical system and are not expected to map onto it in fine-grained detail. He allows that some applications proceed via abstract representation. Batterman's rejoinder is that even this extension does not capture cases where the mathematical work is done in a limit, because there is no physical system at the limit — the infinite system is not a physical system at all, not even an abstract one.
</div>

**What counts as a good map?** This question, which might seem like a technical detail, turns out to have deep philosophical significance. If any structure-preserving function, however partial, constitutes a representation, then the mapping account is so permissive as to allow almost anything to represent anything. A genuine theory of mathematical representation must say which morphisms are representationally significant — which physical relations are the ones that mathematical relations are supposed to track — and this requires an account of the purposes and pragmatics of scientific modeling that goes beyond the purely formal characterization of structure-preservation.

## 4.5 Challenges for the Mapping Account

The mapping account faces several challenges.

The **surplus structure problem** arises when a mathematical formalism contains features that have no physical correlate. In classical electrodynamics formulated using potentials, the vector potential \( \mathbf{A} \) has gauge freedom: two potentials \( \mathbf{A} \) and \( \mathbf{A} + \nabla \chi \) yield the same electric and magnetic fields. The gauge freedom appears to be surplus mathematical structure with no direct physical significance. Yet in quantum mechanics, the Aharonov-Bohm effect shows that the potential has genuine physical significance even in field-free regions.

<div class="remark">
The surplus structure problem suggests that the line between "mere" mathematical machinery and physically significant structure is blurry and may shift as theories develop. This has implications for scientific realism: if we cannot cleanly separate representational from surplus structure, we cannot straightforwardly read ontology off of our best theories.
</div>

---

# Chapter 5: Idealization and Approximation in Scientific Models

## 5.1 Batterman's Challenge

Robert Batterman's *The Devil in the Details* (2002) poses a deep challenge to simple mapping accounts. Batterman argues that the most important and explanatory applications of mathematics in physics involve **asymptotic methods** (渐近方法) — mathematical techniques that work precisely in limiting cases, often involving idealizations that are strictly speaking false of the physical system.

The key insight is that many physical explanations proceed not by identifying the physical system with a mathematical model, but by analyzing the behavior of a family of models in a limit — a limit that may not be physically realized.

## 5.2 Asymptotic Reasoning and Emergence

<div class="definition">
An <strong>asymptotic expansion</strong> of a function \( f(\epsilon) \) as \( \epsilon \to 0 \) is a formal series \[ f(\epsilon) \sim \sum_{n=0}^{\infty} a_n \epsilon^n \] that need not converge, but whose partial sums provide increasingly accurate approximations for small \( \epsilon \).
</div>

Batterman's central example is the phenomenon of **universality** in critical phenomena. Near a phase transition (say, the liquid-gas transition), many different physical systems exhibit the same scaling behavior, characterized by **critical exponents** (临界指数). The correlation length \( \xi \) diverges as \[ \xi \sim |T - T_c|^{-\nu} \] where \( \nu \) is a critical exponent that takes the same value across a vast **universality class** of physically very different systems — different fluids, different magnets, even biological systems.

The explanation of universality proceeds via the **renormalization group** (重整化群). The basic idea is to analyze how the behavior of a statistical mechanical system changes as we coarse-grain — averaging over short-distance degrees of freedom to obtain an effective description at longer length scales. Formally, the renormalization group transformation \( \mathcal{R} \) maps a Hamiltonian \( H \) (a specification of the system's interactions at a given scale) to a new Hamiltonian \( H' = \mathcal{R}(H) \) at a coarser scale. Under repeated application of \( \mathcal{R} \), trajectories in Hamiltonian space flow toward **fixed points** \( H^* \) satisfying \( \mathcal{R}(H^*) = H^* \). Different systems that flow to the same fixed point exhibit identical critical behavior — this is the mathematical explanation of why universality holds.

Crucially, this explanation proceeds by taking the limit as the system size \( L \to \infty \) and the lattice spacing \( a \to 0 \). This is a doubly idealized limit: real systems are finite and discrete. Yet the explanation of universality essentially involves taking this limit, because fixed points only exist in the infinite-system limit. For a finite system, there are no fixed points, no universality, and the renormalization group transformation does not apply cleanly. The mathematical object that does the explanatory work — the fixed point of \( \mathcal{R} \) — literally does not correspond to any physical system.

## 5.3 Batterman's Asymptotic Explanation and Its Philosophical Significance

Batterman calls explanations that proceed through idealized limits **asymptotic explanations** (渐近解释). Their distinctive feature is that the explanatory structure is located in the mathematics of the limit, not in the mathematics of any particular physical model. This has two important philosophical implications.

First, it challenges what Batterman calls the **simple mapping account**: the view that a successful scientific model is one that accurately maps the mathematical formalism onto the physical system. Asymptotic explanations work precisely by abandoning accuracy in favor of a different mathematical relationship — the flow toward a fixed point that only exists in the limit.

Second, it challenges the idea that explanations must bottom out in facts about real, non-idealized systems. The explanation of universality does not bottom out in facts about any actual fluid or magnet; it bottoms out in facts about the mathematical structure of the renormalization group in the infinite-size limit. This is a case where the idealized model — and specifically the mathematics of its limiting behavior — is more explanatory than any non-idealized, physically accurate model.

<div class="remark">
Batterman draws a sharp conclusion: some of the most important and ineliminable applications of mathematics in physics involve idealizations that cannot be "cashed out" by mapping to a better, more accurate model. The infinite-system limit is not a mere calculational convenience; it does genuine explanatory work. This suggests that the representational role of mathematics is more complex than any simple isomorphism or partial morphism account can capture.
</div>

This challenges **reductive** accounts of idealization, which hold that idealized models are always in principle replaceable by more accurate, non-idealized models. For Batterman, some idealizations are **explanatorily essential** (解释性必要的): the idealized limit picks out the relevant structure — the fixed point of the renormalization group transformation — that explains why universality holds.

## 5.4 The Explanatory Power of Idealized Models

The renormalization group example raises a more general question: what explains the explanatory power of idealized models? Several accounts have been proposed.

The **irrelevance account** holds that the idealization renders certain details irrelevant to the phenomenon being explained. What makes the renormalization group explanation informative is precisely that it shows why, at the fixed point, all the microscopic details that distinguish different physical systems — whether the system is a fluid or a magnet, whether the interactions are short-range or long-range — become irrelevant. The fixed point washes out the details, revealing a common structure. The idealization does not misrepresent by omitting the details; it explains by showing that those details do not matter for the phenomenon.

The **nomological account** holds that idealized models represent not individual systems but natural kinds or nomological patterns: the Hardy-Weinberg model represents the mathematical law governing genetic transmission in the absence of evolutionary forces; the ideal gas law represents the behavior of gases in the thermodynamic limit. Idealized models are true of ideal systems, and the relationship between ideal and actual systems is lawlike: real systems approximate ideal ones to the degree that the conditions for idealization are approximately satisfied.

## 5.5 Idealization and Ontology

The practice of idealization raises ontological questions. When we assert that "water boils at \( 100^\circ \text{C} \)," we are making a claim about an idealized system — pure water at standard pressure. No actual water sample is pure; no actual environment is at exactly standard pressure. Are such claims true? False? True-of-idealized-systems but not of actual systems?

Marc Lange and others have argued for a **counterfactual account**: idealized claims are counterfactual — they describe how the system would behave under conditions that are approached but never reached. On this view, mathematical models do represent reality, but via idealized counterfactuals rather than direct mappings.

---

# Chapter 6: Mathematical Explanation in Science

## 6.1 What Is Mathematical Explanation?

The question of **mathematical explanation** (数学解释) in science concerns whether mathematics can be genuinely explanatory — whether the mathematical structure of a model can explain physical facts, not merely predict or describe them. This question has significant implications for debates about scientific realism and the indispensability of mathematics.

## 6.2 The Deductive-Nomological Model and Its Limits

The classic **deductive-nomological** (D-N) model of scientific explanation (Hempel and Oppenheim) holds that an explanation is a sound deductive argument from laws and initial conditions to the explanandum. Mathematics enters as part of the logical machinery of the deduction.

On this view, mathematics is explanatorily inert: it helps structure the derivation, but the explanatory work is done by the physical laws. The mathematical form of a law like \( F = Gm_1 m_2 / r^2 \) is merely representational; the physics is in the universal gravitational constant \( G \) and the inverse-square dependence on distance, not in the algebraic manipulation.

Critics of the D-N model — including Batterman, whom we have already encountered — argue that this account misses genuinely mathematical explanations that do not fit the D-N pattern.

## 6.3 Baker's Honeybee Case

Alan Baker's "Are There Genuine Mathematical Explanations of Physical Phenomena?" (2005) provides what has become the canonical example of **mathematical scientific explanation**: the hexagonal structure of the honeycomb.

<div class="example">
<strong>The Honeycomb Theorem:</strong> Why do bees build their combs in a hexagonal lattice? The biological explanation appeals to evolutionary fitness — bees minimize the wax used to construct cells of a given volume. The mathematical explanation identifies the relevant structural fact: among all tilings of the plane by polygons of equal area, the regular hexagonal tiling has the least perimeter. Formally, if \( P \) is the perimeter and \( A \) the area of each cell, the hexagonal tiling minimizes \( P/\sqrt{A} \).

The explanation of the hexagonal structure thus essentially invokes a mathematical theorem — the Honeycomb Conjecture, proved by Thomas Hales in 1999 — not merely as a computational device but as the reason why the behavior occurs. The mathematical fact explains the physical fact.
</div>

Baker argues that this constitutes a **genuine mathematical explanation** because: (1) the mathematical theorem is essential to the explanation; (2) it cannot be replaced by a purely physical explanation; and (3) it licenses the inference to the existence of the mathematical structure invoked.

## 6.4 The Enhanced Indispensability Argument

Baker's case study motivates what he calls the **enhanced indispensability argument** (增强的不可缺少性论证):

<div class="definition">
<strong>The Enhanced Indispensability Argument (Baker):</strong>
<ol>
<li>We ought to believe in the existence of any entity that plays an indispensable explanatory role in our best scientific theories.</li>
<li>Mathematical entities play an indispensable explanatory role in our best scientific theories (e.g., the Honeycomb Theorem).</li>
<li>Therefore, we ought to believe in the existence of mathematical entities.</li>
</ol>
</div>

This argument differs from the Quine-Putnam indispensability argument (discussed in Chapter 7) in that it grounds mathematical ontology not merely in quantificational indispensability but in *explanatory* indispensability. The mathematical entity must be doing genuine explanatory work.

## 6.5 Melia's Response and the Weaseling Strategy

Joseph Melia has developed one of the most influential nominalist responses to indispensability arguments, including Baker's enhanced version. Melia's strategy is what he calls **weaseling** (weaseling出去): the nominalist can accept the full mathematical content of scientific theories as part of the theoretical apparatus, then "take back" the ontological implications by explicitly denying that the mathematics quantifies over genuinely existing abstract objects.

Melia's argument is that this is not incoherent. We regularly make claims that are, taken strictly, in tension — we might say "the average family has 2.4 children, but of course there is no such thing as 0.4 of a child." The mathematical content is asserted for its representational utility; the ontological implication is retracted. The question for the indispensability argument is whether the retraction is available to the nominalist without undermining the explanatory content. Melia argues it is, because what the bees are responding to is not the abstract mathematical theorem but the physical fact that hexagonal arrangements minimize wax use — the theorem is a convenient representation of that physical fact, not an additional entity over and above it.

Baker responds that Melia's weaseling is available only if there is a purely nominalistic re-description of the explanatory content — and that for some mathematical explanations, no such re-description exists. The genuine mathematical character of the Honeycomb Theorem is not eliminable from the explanation: there is no non-mathematical way of saying why the hexagonal tiling is optimal among all possible tilings.

## 6.6 A Second Case Study: Prime Numbers and Cicada Periodicity

A second case study, also developed by Baker, concerns the **periodicity of periodical cicadas** (周期蝉). Cicadas of certain North American species emerge from the ground every 13 or 17 years — both prime numbers. Baker argues that the best explanation of this periodicity essentially invokes number-theoretic facts.

<div class="example">
<strong>The Prime Periodicity Explanation:</strong> Why would prime-numbered life cycles be evolutionarily advantageous? The biological hypothesis is that a prime-period cycle minimizes coincidence with predators and competitors that have shorter cycles. If a cicada has a period of \( n \) years and a predator has a period of \( k \) years, the two coincide every \( \text{lcm}(n, k) \) years. If \( n \) is prime and \( k < n \), then \( \text{lcm}(n, k) = n \cdot k \) — a much longer interval than if \( n \) is composite. The primeness of the cicada's period is thus a mathematically optimal strategy for minimizing predator coincidence.

The explanation invokes the purely mathematical property of primeness and the number-theoretic fact about least common multiples — facts that have no physical content beyond their mathematical form. This parallels Baker's honeybee case in structure and strengthens the case that mathematical properties can do genuine explanatory work in biology.
</div>

Responses from nominalists include: (a) denying that the Honeycomb Theorem and the prime periodicity theorem are genuinely explanatory rather than merely representational; (b) arguing that the evolutionary explanation is primary and the mathematics is a re-description of it; (c) appealing to fictionalist accounts of mathematical explanation (Leng).

---

# Chapter 7: The Indispensability Argument

## 7.1 Quine's Holism and Putnam's Contribution

The **indispensability argument** (不可缺少性论证) for mathematical Platonism is one of the most influential arguments in philosophy of mathematics. It derives its force from two sources: W.V.O. Quine's **confirmational holism** (确认整体论) and his **ontological naturalism** (本体论自然主义), combined with Hilary Putnam's point about the central role of mathematics in scientific theorizing.

<div class="definition">
<strong>Quine's Confirmational Holism:</strong> Scientific theories face the tribunal of experience as a corporate body — no individual statement is confirmed or disconfirmed in isolation. All components of a theory, including its mathematical components, are confirmed when the theory as a whole is confirmed.

<strong>Quine's Ontological Naturalism:</strong> We should believe in the existence of all and only those entities that are quantified over in our best-confirmed scientific theories. There is no first philosophy; ontology is continuous with science.
</div>

Quine's holism is grounded in his philosophy of language, particularly his views on the **web of belief**: all of our beliefs form an interconnected network, and experience impinges on the network at its periphery (the observational claims), causing adjustments that propagate inward to increasingly theoretical claims. No statement is immune from revision in response to experience — not even the laws of logic — but by the same token, no statement (including a mathematical statement) is confirmable or disconfirmable in isolation. When quantum mechanics is confirmed by experiment, every statement in the theory — including the statement that there exist Hilbert spaces — is, to that degree, confirmed.

Putnam adds that mathematics is **indispensable** to science: scientific theories cannot be stated, let alone confirmed, without the mathematical apparatus they employ. We cannot state Newton's law of gravitation \[ F = G \frac{m_1 m_2}{r^2} \] without employing real numbers, and we cannot confirm the law without treating those numbers as genuinely referring. Therefore, by Quinean naturalism and holism, we are committed to the existence of real numbers.

## 7.2 The Standard Formulation

<div class="definition">
<strong>The Quine-Putnam Indispensability Argument:</strong>
<ol>
<li>We ought to have ontological commitment to all and only the entities indispensable to our best scientific theories.</li>
<li>Mathematical entities are indispensable to our best scientific theories.</li>
<li>Therefore, we ought to have ontological commitment to mathematical entities.</li>
</ol>
</div>

The argument has a clean logical structure, but each premise is contestable.

## 7.3 Maddy's Objections: Mathematical Practice

Penelope Maddy has mounted the most sustained and technically developed critique of the Quine-Putnam argument, drawing on careful attention to what scientists and mathematicians actually do. Her objections target both the holism premise and the indispensability premise.

**The holism objection:** Maddy argues that actual scientific practice does not conform to Quinean holism. Scientists routinely make idealized assumptions they know to be false — treating the Earth as a spherical mass in a vacuum, treating water as a continuous fluid, treating populations as infinitely large — and they do not take confirmation of predictions to confirm these idealizations. If we ask a fluid dynamicist whether she believes in a continuous fluid, she will say the assumption is useful but false: real fluids are discrete at the molecular scale. The scientist's attitude toward her mathematical idealizations is similarly instrumental: the mathematical objects invoked are tools, not beliefs. If scientists themselves do not treat confirmation holistically — if they discriminate between which components of a confirmed theory they actually believe — then the holistic inference to mathematical ontology misfires.

**The practice objection:** More fundamentally, Maddy argues that the Quine-Putnam argument imposes a philosophical criterion — quantification in a confirmed theory — on mathematics that no practicing mathematician follows or endorses. Mathematicians do not investigate whether their subject matter exists in the same sense that physicists investigate whether quarks exist. Mathematical existence questions are settled by proof within a formal system, not by empirical confirmation. The Quinean approach treats mathematics as a branch of natural science subject to empirical revision; Maddy's naturalism takes the internal practices of mathematics as authoritative about mathematical existence.

<div class="remark">
Maddy's naturalism takes the internal practices of science and mathematics as the primary data. She argues that mathematicians do not treat existence questions as empirical, and they should not be required to. The indispensability argument imposes a philosophical standard — Quinean holism — that no practicing scientist or mathematician actually follows. A truly naturalist philosophy of mathematics should defer to mathematical practice, not override it.
</div>

## 7.4 Colyvan's Defense

Mark Colyvan's *The Indispensability of Mathematics* (2001) offers the most systematic defense of the Quine-Putnam argument. Colyvan argues that the objections from scientific practice are overstated and that a refined holism — which attends to the structure of confirmation while not requiring naive holism — supports the indispensability argument.

Colyvan distinguishes between **quantificational indispensability** (the entities must be quantified over) and **explanatory indispensability** (the entities must do genuine explanatory work). Baker's enhanced argument, discussed above, is one response to Maddy's challenge: it grounds the argument in explanatory role rather than mere quantification.

Against Maddy's holism objection, Colyvan argues that the relevant form of holism is not the claim that all parts of a theory are confirmed equally, but the more modest claim that confirmation accrues to a theory as a whole, and that we cannot segregate the mathematical from the physical components. Even if scientists adopt an instrumentalist attitude toward their mathematical idealizations, the philosopher can note that such an attitude is not rationally justified given the evidential situation: there is no principled way to separate which components of a confirmed theory we should believe.

Against Maddy's practice objection, Colyvan argues that naturalism cuts both ways: if we defer to scientific practice on ontological questions, we should also take seriously the fact that scientists regularly commit to the existence of entities postulated by their theories. Physicists do not hesitate to say that electrons and quarks exist; the question is why the same attitude should not extend to the mathematical objects their theories invoke.

---

# Chapter 8: Fictionalism and Applicability

## 8.1 Field's Nominalization Program

Hartry Field's *Science Without Numbers* (1980) is the most sustained and influential attempt to defend **nominalism** (名义论) about mathematics while accounting for its scientific utility. Field's strategy is twofold: (i) show that mathematics is **conservative** over nominalistic theories, and (ii) actually carry out a nominalization of a significant physical theory.

<div class="definition">
<strong>Conservativeness (Field):</strong> A mathematical theory \( M \) is conservative over a nominalistic theory \( N \) if and only if every nominalistic consequence of \( N + M \) is already a consequence of \( N \) alone. That is, adding mathematics to a physical theory yields no new facts about the physical (concrete) world.
</div>

Conservativeness explains why mathematics is useful without being true: it serves as a powerful representational and inferential tool that allows us to derive nominalistically statable conclusions more easily than we could without it. It is, in Field's phrase, a "useful fiction" (有用的虚构).

## 8.2 The Conservativeness Proof Sketch

Field's claim that mathematics is conservative over nominalistic science is not merely asserted; he provides a proof sketch grounded in model-theoretic considerations. The key technical result is a consequence of Gödel's completeness theorem and the compactness theorem for first-order logic.

<div class="definition">
<strong>Field's Conservativeness Proof (sketch):</strong> Suppose \( M \) is a mathematical theory (such as ZFC set theory) and \( N \) is a nominalistic physical theory, and suppose \( N + M \vdash \phi \) where \( \phi \) is a nominalistic sentence (quantifying only over concrete objects). We want to show \( N \vdash \phi \).

By the completeness theorem, if \( N + M \vdash \phi \), then every model of \( N + M \) is a model of \( \phi \). Field argues that any model of \( N \) can be extended to a model of \( N + M \) by adding the abstract objects of the mathematical theory as an auxiliary domain — the nominalistic and mathematical domains are distinct and do not interact causally. Since the abstract objects do not constrain the concrete objects (by the nominalist's lights), the extension is always available. Therefore, if \( N \) has a model satisfying \( \neg\phi \), that model can be extended to a model of \( N + M \) satisfying \( \neg\phi \), contradicting \( N + M \vdash \phi \). Hence \( N \vdash \phi \).
</div>

Critics have pressed Field on the details of this proof. The key assumption — that any model of \( N \) can be freely extended by adding mathematical objects — requires that there be enough abstract objects available to form the mathematical domain, and that these objects be genuinely independent of the physical domain. The first requirement raises the question of whether the proof is circular: if mathematical objects do not exist, there are no abstract objects to add. The second requirement — independence — is precisely what Benacerraf's epistemic challenge calls into question from the other direction.

## 8.3 The Nominalization of Newtonian Gravitation

Field's most impressive technical achievement is a nominalization of Newtonian gravitational theory. The key idea is to replace quantification over real numbers with **comparative predicates** — physical relations that express that one region of spacetime has a greater or lesser gravitational potential than another, without invoking numbers to measure the degree.

Using Hilbert's axioms for geometry and Adolf Grünbaum's work on intrinsic spacetime structure, Field constructs a theory in which the content of Newton's gravitational theory is expressed using only variables ranging over spacetime points and regions, and predicates expressing betweenness, congruence, and their analogues for the gravitational potential field.

<div class="example">
Where Newton writes \[ \nabla^2 \phi = 4\pi G \rho \] quantifying over real-valued functions \( \phi \) and \( \rho \), Field's nominalized version expresses the same content using intrinsic spacetime relations: instead of saying that the gravitational potential at a point has a certain real-valued gradient, one says that certain spacetime regions stand in certain comparative potential relations that are geometrically expressible.
</div>

## 8.4 Challenges to Field's Program

Field's nominalization faces serious obstacles.

**The quantum mechanics objection:** Field's technique works for classical field theories formulated on a manifold. It is unclear how to nominalize quantum mechanics, where the relevant state space is an infinite-dimensional Hilbert space. Hilbert space has no obvious intrinsic physical analog of the kind Field used for spacetime geometry.

**The modal objection:** Field's conservativeness claim requires that there *could* exist enough spacetime points and regions to represent all of the mathematical structures needed. This appeal to modality (possibility) raises its own ontological questions — are possible spacetime points abstract objects?

**The ease of use:** Even if nominalization is in principle possible, the nominalized theory is vastly more complex and harder to use than the mathematized original. If the goal of science is to generate predictions efficiently, the nominalized theory seems worse by every pragmatic standard.

**Balaguer's challenge:** Mark Balaguer has argued, from within a broadly Platonist framework, that Field's conservativeness result actually undermines the motivation for Platonism rather than saving nominalism. If mathematics is conservative — if it adds no new physical consequences — then there is a sense in which the choice between Platonism and nominalism is empirically indeterminate: the Platonist world and the nominalist world are observationally equivalent. Balaguer calls this **full-blooded Platonism** (FBP): all mathematically consistent structures exist, and which ones apply to the physical world is a matter of the physical world's structure, not of which abstract objects happen to exist. On FBP, the indispensability argument fails because there is no unique set of abstract objects that science is committed to. But FBP also undermines nominalism's motivation: if Platonism is consistent and conservative, the nominalist cannot claim any scientific or ontological advantage for her position.

## 8.5 Easy Road Nominalism: Bueno's Approach

Otávio Bueno's "easy road nominalism" (2012) argues that Field's hard road — actually carrying out nominalization — is unnecessary. The fictionalist can simply accept that mathematical statements are useful fictions and that their application in science is a matter of **partial structures** and **partial truth**.

<div class="definition">
<strong>Partial structures (da Costa and French):</strong> A partial structure is a structure \( \langle D, R_i \rangle \) where each relation \( R_i \) is a triple \( \langle R_i^+, R_i^-, R_i^? \rangle \): the extension of \( R_i \) (elements known to satisfy it), the anti-extension (elements known not to satisfy it), and a set of elements for which the relation is undetermined. Models in science are always partial in this sense.
</div>

The easy road nominalist holds that mathematical structures are applied to physical systems via **partial morphisms** (following Bueno and French) — mappings that need not be full structure-preserving maps. This allows the fictionalist to explain the utility of mathematics without requiring it to be true or to fully represent the physical system.

Bueno's approach has the advantage of not requiring the technically demanding project of nominalization. The fictionalist can use all of standard mathematics while maintaining that mathematical statements are ultimately false. The application of mathematics consists in establishing partial morphisms between mathematical structures and physical systems, and these morphisms are truth-valued (they either hold or fail to hold between the relevant domains), even if the mathematical domain itself is fictional.

The objection to easy road nominalism is that it is too easy: by decoupling the truth of mathematics from its utility, the fictionalist loses the ability to explain *why* the specific mathematical structures that apply are the ones that do. If mathematics is fiction, any consistent mathematical structure is a possible fiction; but not all consistent mathematical structures apply to the physical world. The easy road fictionalist owes an account of why the right fictions are the ones that happen to correspond to physical reality — and this account seems to require appealing to something like the structural features of the physical world, which threatens to collapse back into a form of structuralism.

---

# Chapter 9: Case Studies — Physics, Biology, and Economics

## 9.1 Why Case Studies Matter

Abstract philosophical arguments about applicability must be tested against the details of actual scientific practice. The three case studies examined in this chapter — quantum field theory in physics, population genetics in biology, and expected utility theory in economics — illustrate different modes of mathematical application and pose different challenges for the positions surveyed in earlier chapters.

## 9.2 Case Study I: Quantum Field Theory and Renormalization

Quantum field theory (QFT) is the most empirically successful physical theory ever developed. Quantum electrodynamics (QED) predicts the anomalous magnetic moment of the electron as \[ a_e = \frac{g-2}{2} \approx 1.001\,159\,652\,181\,643 \] in perfect agreement with experiment to twelve significant figures. Yet QFT is mathematically problematic in ways that raise deep philosophical issues.

The **ultraviolet divergences** of QFT — the appearance of infinite quantities in perturbative calculations — are handled by the procedure of **renormalization** (重整化). In its original form, renormalization involves subtracting infinities from infinities to get finite, experimentally confirmed answers. This procedure troubled even its creators: Dirac called it "just not sensible mathematics."

<div class="remark">
The philosophical puzzle is multi-layered. First, if QFT in its unrenormalized form is mathematically ill-defined, in what sense does it represent anything? Second, the success of renormalized QFT is perhaps the strongest existing example of mathematical application yielding knowledge — yet it rests on mathematical procedures that are, strictly speaking, illegitimate. Batterman's notion of explanatory idealization is directly relevant here.
</div>

The **renormalization group** (重整化群), developed by Wilson and others, provides a more principled understanding: the divergences arise because QFT is an effective field theory valid only up to some energy scale \( \Lambda \), and renormalization amounts to specifying how the theory's parameters depend on the choice of scale. Concretely, when we compute the one-loop correction to the electron propagator, we encounter an integral of the form \[ \int_0^\infty \frac{d^4 k}{k^2 - m^2} \] which diverges at large \( k \) (the ultraviolet region). The renormalization procedure introduces a cutoff \( \Lambda \), computes the integral up to \( \Lambda \), and absorbs the \( \Lambda \)-dependent terms into redefined (renormalized) parameters — the physical electron mass \( m_{\text{phys}} \) and charge \( e_{\text{phys}} \) — whose values are taken from experiment rather than derived from the theory. The mathematics of fixed points and universality classes (from Chapter 5) reappears here: different choices of \( \Lambda \) define different effective theories that are related by the renormalization group transformation, and the physical predictions are those that lie on the renormalization group trajectory — independent of the arbitrary cutoff. The deep philosophical point is that the mathematical mechanism of renormalization is not ad hoc but reflects a genuine physical fact: the physics at the scale of atomic structure is effectively decoupled from the physics at the Planck scale.

## 9.3 Case Study II: Population Genetics and Hardy-Weinberg

In biology, the **Hardy-Weinberg law** provides a foundational example of mathematical modeling. For a population with two alleles \( A \) and \( a \) at frequencies \( p \) and \( q = 1 - p \), the Hardy-Weinberg law states that under idealized conditions (random mating, no selection, no mutation, no genetic drift, infinite population), the genotype frequencies \( AA, Aa, aa \) are given by \[ p^2, \quad 2pq, \quad q^2 \] and remain constant across generations.

The idealization is extreme: no real population is infinite, no mating is perfectly random, and selection is ubiquitous. Yet the Hardy-Weinberg law is not empirically useless — real populations approximate it when departures from idealization are small, and deviations from it signal the presence of evolutionary forces worth investigating.

The Hardy-Weinberg law was discovered independently by G.H. Hardy (a mathematician) and Wilhelm Weinberg (a physician) in 1908. Hardy's derivation was published as a letter to *Science* in response to a question about whether dominant alleles would inevitably increase in frequency under Mendelian inheritance. His answer — demonstrating algebraically that allele frequencies are preserved under random mating — used nothing more than elementary algebra, yet established a fundamental result of population genetics. This historical case illustrates how mathematical reasoning (algebraic manipulation of frequency equations) can yield non-trivial biological insights without any empirical input beyond the Mendelian assumptions.

<div class="example">
<strong>The Applicability Lesson:</strong> The Hardy-Weinberg law illustrates Pincock's point about partial morphisms particularly well. The mapping from the mathematical model to the real population is partial: the model captures the combinatorial structure of allele transmission while abstracting away all population dynamics. Its utility lies precisely in this strategic abstraction. A fictionalist would say the model is false but useful; a structuralist would say it captures the relevant structural features of the population; a Platonist would say it describes an abstract structure that the real population approximately instantiates.
</div>

## 9.4 Case Study III: Expected Utility Theory in Economics

**Expected utility theory** (期望效用理论) holds that rational agents maximize expected utility:

\[
EU(A) = \sum_i p_i \cdot u(x_i)
\]
where \( p_i \) are probabilities of outcomes \( x_i \) under action \( A \), and \( u \) is a utility function. This theory is the basis of rational choice theory and much of economic modeling.

The mathematical apparatus — real-valued utility functions, subjective probability measures, the expectation operator — is essential to the theory's formulation. The von Neumann-Morgenstern representation theorem provides the mathematical foundation: if a preference relation \( \succsim \) over lotteries satisfies four axioms (completeness, transitivity, continuity, and independence), then there exists a utility function \( u \) such that \[ A \succsim B \iff EU(A) \geq EU(B) \] The function \( u \) is unique up to positive affine transformation. This is a purely mathematical result — it establishes the representability of rational preferences by a real-valued function given the axioms — and its applicability in economics rests on the assumption that rational agents' preferences satisfy the axioms.

Yet the empirical record is mixed: the Allais paradox, the Ellsberg paradox, and a wealth of behavioral economics results show that actual human agents systematically violate the axioms of expected utility theory. The Allais paradox demonstrates that subjects' choices between lotteries violate the independence axiom in predictable ways. The Ellsberg paradox shows that agents prefer bets on known probabilities over structurally equivalent bets on unknown probabilities — a phenomenon called ambiguity aversion that EUT cannot accommodate.

This raises a sharp version of the applicability question. If the mathematics is not even approximately true of human behavior, in what sense is it being applied? The answer suggested by the case study is that mathematics in economics sometimes functions **normatively** (规范性地) rather than descriptively: it specifies how rational agents should behave, not how they do behave.

<div class="remark">
This normative role of mathematics in economics is not captured by any of the standard accounts of applicability, which focus on descriptive or explanatory roles. A complete account of mathematical applicability must accommodate the normative dimension — the use of mathematical structures as idealized standards of rationality against which actual behavior is measured.
</div>

## 9.5 Synthesis: What Do the Case Studies Show?

Several lessons emerge from these three case studies.

**Mathematics is never applied naively.** In each case, the mathematical model is an idealization, and the relationship between model and system is mediated by background assumptions, idealizing conditions, and interpretive choices. The mapping accounts of Chapter 4 must be supplemented by an analysis of the pragmatics of model use.

**Explanatory and representational roles come apart.** In QFT, the renormalized mathematics represents the physical system to extraordinary precision; in expected utility theory, the mathematics functions normatively rather than representationally. Baker's enhanced indispensability argument applies most naturally to the biological case, where the mathematics appears to be genuinely explanatory.

**Different philosophical positions have different strengths by domain.** Structuralism handles the biological case naturally: the Hardy-Weinberg law describes a structure that real populations approximate. Batterman's idealization framework handles the QFT case most naturally — the renormalization group analysis is a paradigm of asymptotic explanation. And fictionalism handles the normative economics case well: the expected utility model is a useful fiction, a benchmark for evaluating behavior rather than a description of it.

**The role of mathematics is pluralistic.** No single account — mapping, explanation, conservation, fiction — captures all the ways mathematics is applied in science. The philosophy of applied mathematics must be a pluralist discipline, recognizing that the mathematical-physical relationship takes different forms in different scientific contexts.

---

## Concluding Remarks

The philosophy of applied mathematics is not a single problem but a family of interrelated problems, unified by the central puzzle Wigner articulated: why does mathematics — invented by humans, pursued on grounds of internal coherence and elegance — describe the physical world with such extraordinary success?

We have surveyed three main positions in the ontology of mathematics. **Platonism** (柏拉图主义) grounds mathematical truth in abstract objects but struggles with epistemology — the Benacerraf dilemma crystallizes the tension between semantic uniformity and epistemic access. **Structuralism** (结构主义) identifies mathematics with abstract patterns, offering a natural picture of how physical systems instantiate mathematical structure, while the in re / ante rem distinction captures different commitments about the dependence of structure on instantiation. **Fictionalism** (虚构主义) denies mathematical truth while explaining utility via conservativeness or partial structures, at the cost of making mathematical explanation puzzling.

On the side of application, Pincock's mapping accounts give a framework for understanding representational success, while Batterman's analysis of idealization shows that the most important applications often involve non-removable idealizations — such as the infinite-system limit in renormalization group theory — that do genuine explanatory work. Baker's enhanced indispensability argument tries to leverage explanatory success into ontological commitment, while Field's nominalization program, Balaguer's FBP challenge, and Bueno's easy road offer a range of fictionalist responses.

No position emerges from this survey fully victorious. The applicability problem retains its depth precisely because it sits at the intersection of ontology, epistemology, and the philosophy of science — three areas where our philosophical understanding remains genuinely incomplete. The most honest conclusion may be Wigner's own: the appropriateness of mathematics for describing the physical world is, and perhaps will remain, a profound mystery.
