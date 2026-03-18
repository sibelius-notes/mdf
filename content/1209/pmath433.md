---
title: "PMATH 433/733 - Set Theory and Model Theory"
prof: "R. Moosa"
---
# Part I: Set Theory

## Lecture 1: First Axioms

The opening question of this course is deceptively simple: what is a natural number? In ordinary mathematics the natural numbers — <span>&#92;(0, 1, 2, 3, \ldots&#92;)</span> — are taken for granted. You learn them in school, you use them to count finite sets, and you never really pause to ask why they exist. You might have constructed the rationals from the integers, the reals from the rationals, and so on, but the natural numbers themselves usually go without explanation. In set theory, we want *everything* to be explained; nothing should go without justification. So this course begins, somewhat unusually, by building the natural numbers from scratch.

But this is not an end in itself. The deeper goal is to develop an **infinitary** analogue of the natural numbers — a framework for counting, ordering, and measuring infinite sets. The natural numbers serve two purposes: they let us *enumerate* (list or order) finite sets, and they let us *measure* the size of finite sets. For finite sets these two uses coincide; a list of five elements has exactly five elements. In the infinitary setting these two purposes diverge. One leads to **ordinals**, which allow us to enumerate and order infinite sets, and the other leads to **cardinals**, which allow us to measure the sizes of infinite sets. Developing ordinals and cardinals rigorously — so that we can do genuine set-theoretic computation — is the practical goal of Part I. Along the way, as Gödel's work in the twentieth century teaches us, we have to be careful about foundations: unchecked naïveté leads to contradictions.

### Building the Natural Numbers as Sets

We begin with two **undefined notions**: the notion of a **set**, and the binary relation of **membership**, written <span>&#92;(x &#92;in y&#92;)</span>. Intuitively a set is a collection of objects, but we leave this informal; what matters is that sets and membership are the raw material from which everything else is built.

With these notions in hand we can already sketch the construction. We define

<span>&#92;[0 := &#92;emptyset, &#92;quad 1 := &#92;{0&#92;}, &#92;quad 2 := &#92;{0, 1&#92;}, &#92;quad 3 := &#92;{0, 1, 2&#92;}, &#92;quad &#92;ldots&#92;]</span>

The pattern is clear: we go from <span>&#92;(n&#92;)</span> to its **successor** <span>&#92;(S(n) := n &#92;cup &#92;{n&#92;}&#92;)</span>, whose members are precisely the members of <span>&#92;(n&#92;)</span> together with <span>&#92;(n&#92;)</span> itself. Each natural number is thus the set of all the natural numbers before it.

This is elegant, but it immediately raises a question: *why do these sets exist?* We cannot construct a theory of mathematics on nothing. We need some unprovable starting points — **axioms** — and the axiomatic development of set theory is really just the discipline of keeping track of which assumptions we are making, even the very basic ones.

### The First Four Axioms

**Axiom 1 (Empty Set).** There exists a set <span>&#92;(&#92;emptyset&#92;)</span> with no members.

Without this axiom there is no justification at all for the existence of <span>&#92;(0&#92;)</span>. The empty set simply has to be declared to exist; there is no way to prove it from nothing.

**Axiom 2 (Pair Set).** For any sets <span>&#92;(x&#92;)</span> and <span>&#92;(y&#92;)</span> there exists a set <span>&#92;(&#92;{x, y&#92;}&#92;)</span> whose only members are <span>&#92;(x&#92;)</span> and <span>&#92;(y&#92;)</span>.

Formally, <span>&#92;(t &#92;in &#92;{x, y&#92;}&#92;)</span> if and only if <span>&#92;(t = x&#92;)</span> or <span>&#92;(t = y&#92;)</span>. When <span>&#92;(x = y&#92;)</span> this gives the singleton <span>&#92;(&#92;{x&#92;}&#92;)</span>, since both disjuncts reduce to <span>&#92;(t = x&#92;)</span>.

**Axiom 3 (Extensionality).** Two sets are equal if and only if they have the same members: for all sets <span>&#92;(x, y&#92;)</span>,
<span>&#92;[x = y &#92;iff &#92;forall t(t &#92;in x &#92;leftrightarrow t &#92;in y).&#92;]</span>

This is not an existence axiom like the first two. It is instead an **equality axiom**: it tells us when two sets are the same. Without it we could not identify the singleton <span>&#92;(\{x,x\}&#92;)</span> obtained from the pair set axiom with <span>&#92;(\{x\}&#92;)</span>. Both sets have exactly one member (namely <span>&#92;(x&#92;)</span>), so extensionality forces them to be equal.

**Axiom 4 (Union Set).** For any set <span>&#92;(x&#92;)</span> there exists a set <span>&#92;(&#92;bigcup x&#92;)</span> whose members are the members of the members of <span>&#92;(x&#92;)</span>:
<span>&#92;[t &#92;in &#92;bigcup x &#92;iff &#92;exists y(y &#92;in x &#92;wedge t &#92;in y).&#92;]</span>

Note the notation: we write <span>&#92;(&#92;bigcup x&#92;)</span> with the union symbol *in front of* a single set, not between two sets. The union of <span>&#92;(x&#92;)</span> collects all the members of all members of <span>&#92;(x&#92;)</span>. This is precisely what we need to pass from <span>&#92;(n&#92;)</span> to <span>&#92;(S(n)&#92;)</span>: given that <span>&#92;(n&#92;)</span> and <span>&#92;(\{n\}&#92;)</span> both exist (the latter from the pair set axiom), we form the pair <span>&#92;(\{n, \{n\}\}&#92;)</span> and then take its union, obtaining <span>&#92;(n &#92;cup &#92;{n&#92;} = S(n)&#92;)</span>.

With these four axioms, every individual natural number can be proved to exist. Starting from <span>&#92;(0 = &#92;emptyset&#92;)</span> (empty set axiom), we apply the pair set axiom twice and then the union set axiom to produce <span>&#92;(S(n)&#92;)</span> from <span>&#92;(n&#92;)</span>, with extensionality confirming all identifications. So <span>&#92;(0, 1, 2, 3, &#92;ldots&#92;)</span> all exist. But we do not yet have the **set** of all natural numbers.

### Definite Conditions

Before introducing more axioms, we must address a subtle constraint. Not just any statement can serve as an axiom; our existence axioms must have a specific form. We want to assert: *there exists a set <span>&#92;(n&#92;)</span> such that <span>&#92;(t &#92;in n&#92;)</span> if and only if <span>&#92;(P(t)&#92;)</span>*, and the condition <span>&#92;(P&#92;)</span> must be what we call **definite**.

Why is this constraint necessary? Consider the naive attempt to axiomatize the set of natural numbers by saying: <span>&#92;(t &#92;in &#92;mathbb{N}&#92;)</span> iff <span>&#92;(t = 0&#92;)</span> or <span>&#92;(t = 1&#92;)</span> or <span>&#92;(t = 2&#92;)</span> or <span>&#92;(\cdots&#92;)</span>. The dots here represent an infinite disjunction — and that is not allowed. As we will see rigorously later in the model theory portion of the course, a definite condition is a **first-order formula** in the language <span>&#92;(\{&#92;in, =&#92;}&#92;)</span>. For now we adopt a working definition:

A **definite condition** is built up inductively from the **atomic conditions** <span>&#92;(x &#92;in y&#92;)</span> and <span>&#92;(x = y&#92;)</span> by applying, in finitely many steps, the operations of **negation** (<span>&#92;(&#92;neg P&#92;)</span>), **conjunction** (<span>&#92;(P &#92;wedge Q&#92;)</span>), **disjunction** (<span>&#92;(P &#92;vee Q&#92;)</span>), **universal quantification** (<span>&#92;(&#92;forall x,P&#92;)</span>), and **existential quantification** (<span>&#92;(&#92;exists x,P&#92;)</span>).

The key phrase is *finitely many steps*. An infinite disjunction <span>&#92;(t = 0 &#92;vee t = 1 &#92;vee t = 2 &#92;vee &#92;cdots&#92;)</span> is therefore **not** a definite condition, no matter how natural it seems. This technical constraint prevents paradoxes, and it is exactly the constraint that motivates the subsequent axioms.

We also note that *implication* <span>&#92;(P &#92;Rightarrow Q&#92;)</span> is definite (it abbreviates <span>&#92;(&#92;neg P &#92;vee Q&#92;)</span>), and *biconditional* <span>&#92;(P &#92;leftrightarrow Q&#92;)</span> is definite as well. We can verify that all four axioms introduced so far — empty set, pair set, union set, extensionality — do indeed use only definite conditions, as the professor confirms at the start of Lecture 2.

---

## Lecture 2a: Natural Numbers (Part 1)

Returning to where we left off, we verify that the existential axioms stated in Lecture 1 all involve definite conditions. The **empty set axiom** asserts the existence of a set satisfying <span>&#92;(&#92;neg &#92;exists y(y &#92;in &#92;emptyset)&#92;)</span> — a negation of an existential, hence definite. The **pair set axiom** characterises <span>&#92;(\{x,y\}&#92;)</span> by: <span>&#92;(&#92;forall t(t &#92;in &#92;{x,y&#92;} &#92;leftrightarrow t = x &#92;vee t = y)&#92;)</span> — built from equality and membership by disjunction and quantification, hence definite. The **union set axiom** uses <span>&#92;(&#92;exists y(y &#92;in x &#92;wedge t &#92;in y)&#92;)</span> — also definite.

### The Infinity Axiom

The four axioms so far can produce each individual natural number, but they cannot produce the **set** of all natural numbers. To get that, the key insight is to characterize <span>&#92;(&#92;omega&#92;)</span> not by listing its elements, but by its **inductive property**: it is the *smallest* set containing <span>&#92;(0&#92;)</span> and closed under the successor operation. This characterization *can* be expressed with a definite condition.

Call a set <span>&#92;(I&#92;)</span> **inductive** if <span>&#92;(0 &#92;in I&#92;)</span> and for all <span>&#92;(x&#92;)</span>, if <span>&#92;(x &#92;in I&#92;)</span> then <span>&#92;(S(x) &#92;in I&#92;)</span>. The condition of being inductive is definite: saying that <span>&#92;(S(x) &#92;in I&#92;)</span> is a definite condition on <span>&#92;(x&#92;)</span> and <span>&#92;(I&#92;)</span>, because one can spell out that there exists a <span>&#92;(y &#92;in I&#92;)</span> such that <span>&#92;(&#92;forall t(t &#92;in y &#92;leftrightarrow t &#92;in x &#92;vee t = x)&#92;)</span>.

**Axiom 5 (Infinity).** There exists an inductive set <span>&#92;(I&#92;)</span>, i.e., a set satisfying:
<span>&#92;[0 &#92;in I &#92;quad &#92;text{and} &#92;quad &#92;forall x(x &#92;in I &#92;Rightarrow S(x) &#92;in I).&#92;]</span>

This is the first existence axiom that does not uniquely determine its set. The empty set was unique by extensionality; the pair set and union set were each uniquely determined by their defining membership condition. But the infinity axiom merely says *some* inductive set exists — there may be many. An inductive set might contain many "extra" elements beyond the natural numbers. We want the *smallest* inductive set.

### The Power Set and Separation Axioms

To extract the minimal inductive set from a given inductive set <span>&#92;(I&#92;)</span>, we need two further axioms. First, we need to talk about the *subsets* of <span>&#92;(I&#92;)</span>; then we need to isolate among them the *inductive* subsets.

**Axiom 6 (Power Set).** For any set <span>&#92;(A&#92;)</span> there exists a set <span>&#92;(&#92;mathcal{P}(A)&#92;)</span> whose members are exactly the subsets of <span>&#92;(A&#92;)</span>:
<span>&#92;[t &#92;in &#92;mathcal{P}(A) &#92;iff &#92;forall y(y &#92;in t &#92;Rightarrow y &#92;in A).&#92;]</span>

This is again a definite membership condition, so the set it produces is uniquely determined by extensionality.

**Axiom 7 (Bounded Separation).** For any set <span>&#92;(A&#92;)</span> and definite condition <span>&#92;(P&#92;)</span>, there exists a set
<span>&#92;[B = &#92;{t &#92;in A : P(t)&#92;}&#92;]</span>
whose members are exactly those elements of <span>&#92;(A&#92;)</span> satisfying <span>&#92;(P&#92;)</span>.

Two aspects of this axiom are essential. First, <span>&#92;(P&#92;)</span> must be definite — the axiom cannot be used with an infinitary or otherwise ill-formed condition. Second, the axiom is *bounded*: it does not assert the existence of all objects satisfying <span>&#92;(P&#92;)</span> in the universe, only those within the given set <span>&#92;(A&#92;)</span>. This boundedness is not a mere technicality; it is what prevents **Russell's Paradox**.

### Russell's Paradox

If we allowed **unbounded** separation — if we could take any definite condition <span>&#92;(P&#92;)</span> and form the collection of *all* sets satisfying <span>&#92;(P&#92;)</span> — we could define:
<span>&#92;[R := &#92;{t : t &#92;notin t&#92;}.&#92;]</span>
This is the **Russell class**: the collection of all sets that are not members of themselves. The condition <span>&#92;(t &#92;notin t&#92;)</span> is definite (a negation of a basic membership condition), so unbounded separation would make <span>&#92;(R&#92;)</span> a set. But then: is <span>&#92;(R &#92;in R&#92;)</span>? If yes, then <span>&#92;(R&#92;)</span> does not satisfy <span>&#92;(t &#92;notin t&#92;)</span>, so <span>&#92;(R &#92;notin R&#92;)</span> — a contradiction. If no, then <span>&#92;(R&#92;)</span> does satisfy the condition, so <span>&#92;(R &#92;in R&#92;)</span> — also a contradiction. The boundedness of our Separation Axiom avoids this: <span>&#92;(R&#92;)</span> simply does not exist as a set, because no axiom asserts it. (It will reappear as a proper *class* in Lecture 3.)

### Constructing <span>&#92;(&#92;omega&#92;)</span>

With axioms 1–7 we can now construct the set of natural numbers. Note first that intersections do not require a new axiom: given a *non-empty* set <span>&#92;(x&#92;)</span>, we can form
<span>&#92;[&#92;bigcap x := &#92;{t &#92;in &#92;bigcup x : &#92;forall y(y &#92;in x &#92;Rightarrow t &#92;in y)&#92;}&#92;]</span>
using only bounded separation (the bound being <span>&#92;(&#92;bigcup x&#92;)</span>) — so intersections are free. (The empty intersection does not exist as a set, for good reason: it would have to contain every set in the universe.)

**Definition 1.9.** Fix an inductive set <span>&#92;(I&#92;)</span> (which exists by Axiom 5). Define
<span>&#92;[&#92;omega := &#92;bigcap &#92;{J &#92;in &#92;mathcal{P}(I) : 0 &#92;in J &#92;text{ and } &#92;forall x(x &#92;in J &#92;Rightarrow S(x) &#92;in J)&#92;}.&#92;]</span>

This is the intersection of all *inductive* subsets of <span>&#92;(I&#92;)</span>. The set <span>&#92;(&#92;\mathcal{P}(I)&#92;)</span> exists by Axiom 6, and the collection of inductive subsets of <span>&#92;(I&#92;)</span> is obtained from it by bounded separation (Axiom 7) using the definite condition of being inductive. The intersection is non-empty (it contains <span>&#92;(I&#92;)</span> itself) and exists as shown above.

Why is this <span>&#92;(&#92;omega&#92;)</span>? Intuitively: every inductive subset of <span>&#92;(I&#92;)</span> must contain <span>&#92;(0&#92;)</span>, and is closed under successors, so their intersection is itself inductive and contains only what it is *forced* to contain. The extraneous elements from <span>&#92;(I&#92;)</span> are removed by intersecting.

Moreover, <span>&#92;(&#92;omega&#92;)</span> is independent of the choice of <span>&#92;(I&#92;)</span>: if <span>&#92;(I&#92;)</span> and <span>&#92;(I'&#92;)</span> are both inductive sets, the corresponding intersections are equal. This is a good exercise using the definition directly.

The **induction principle** follows immediately from the definition: if <span>&#92;(J &#92;subseteq &#92;omega&#92;)</span> is inductive (contains <span>&#92;(0&#92;)</span> and is closed under successors), then <span>&#92;(J = &#92;omega&#92;)</span>. For <span>&#92;(J&#92;)</span> is an inductive subset of <span>&#92;(I&#92;)</span> (since <span>&#92;(&#92;omega &#92;subseteq I&#92;)</span>), so <span>&#92;(&#92;omega &#92;subseteq J&#92;)</span> by definition of <span>&#92;(&#92;omega&#92;)</span> as the intersection.

---

## Lecture 2b: Natural Numbers (Part 2)

### The Replacement Axiom

There is one more axiom that did not arise in the construction of <span>&#92;(&#92;omega&#92;)</span> but is essential for later work with ordinals and cardinals.

**Axiom 8 (Replacement).** Suppose <span>&#92;(P(x, y)&#92;)</span> is a definite binary condition that is **functional**: for every set <span>&#92;(x&#92;)</span> there is a unique set <span>&#92;(y&#92;)</span> such that <span>&#92;(P(x, y)&#92;)</span). Then for any set <span>&#92;(A&#92;)</span>, there exists a set
<span>&#92;[B = &#92;{y : &#92;exists x &#92;in A,\, P(x, y)&#92;}.&#92;]</span>

In other words, the **image** of any set under any definite operation is again a set. The name is apt: we start with a set <span>&#92;(A&#92;)</span> and *replace* each element <span>&#92;(x &#92;in A&#92;)</span> with <span>&#92;(f(x)&#92;)</span>; the resulting collection forms a set. This will be used, for instance, to form the set of ordinals <span>&#92;(\{f(\alpha) : \alpha \in A\}&#92;)</span> when <span>&#92;(f&#92;)</span> is a definite operation on ordinals.

These eight axioms together constitute **Zermelo-Fraenkel set theory**, denoted **ZF**. (In the literature one also finds a ninth axiom, **Regularity** or Foundation, asserting that every non-empty set has a membership-minimal element. We will not assume Regularity; it turns out to be unnecessary for the development of ordinals and cardinals pursued here.) The remarkable fact — and the punchline of these two lectures — is that all of modern mathematics can be developed within this framework. What seemed at first like a growing list of ad hoc axioms, each thrown in to solve a specific obstruction in the construction of <span>&#92;(&#92;omega&#92;)</span>, turns out to be a complete and sufficient foundation.

---

## Lecture 3: Classes and Definite Operations

### Classes

Now that we have the Zermelo-Fraenkel axioms in place, we can step back and think more carefully about the collections we are implicitly dealing with. When we proved Russell's Paradox showed that <span>&#92;(R = &#92;{t : t &#92;notin t&#92;}&#92;)</span> is not a set, we did not mean that such a collection is meaningless — only that it is not a *set* in the sense of our axioms. Collections that may be too large to be sets deserve their own name.

A **class** is, informally, a collection of sets satisfying some definite property. More precisely: if <span>&#92;(P&#92;)</span> is a definite condition, then the class
<span>&#92;[&#92;llbracket z : P(z) &#92;rrbracket&#92;]</span>
is the collection of all sets satisfying <span>&#92;(P&#92;)</span>. A class is really just another way of talking about the definite condition itself. We use the double-bracket notation (rather than curly braces) to emphasize that this need not be a set.

Several basic observations follow. First, **every set is a class**: given a set <span>&#92;(X&#92;)</span>, we can view it as the class <span>&#92;(&#92;llbracket z : z &#92;in X &#92;rrbracket&#92;)</span>, using the membership condition <span>&#92;(z &#92;in X&#92;)</span> which is definite. Second, some classes are sets and some are not. The class <span>&#92;(&#92;llbracket z : z &#92;in &#92;omega &#92;rrbracket&#92;)</span> is just <span>&#92;(&#92;omega&#92;)</span> itself — a set. But the **Russell class** <span>&#92;(R = &#92;llbracket z : z &#92;notin z &#92;rrbracket&#92;)</span> is not a set (as we proved), and is called a **proper class**.

The **universal class**
<span>&#92;[U := &#92;llbracket z : z = z &#92;rrbracket&#92;]</span>
— the collection of all sets — is also a proper class. Why? If <span>&#92;(U&#92;)</span> were a set, then <span>&#92;(R = &#92;{t &#92;in U : t &#92;notin t&#92;}&#92;)</span> would exist by bounded separation, contradicting Russell's Paradox. In fact, if <span>&#92;(U&#92;)</span> were a set, every class would be a set (by bounding each class with <span>&#92;(U&#92;)</span>), so the existence of even one proper class forces <span>&#92;(U&#92;)</span> to be proper.

Two classes are equal if and only if they have the same members — this is the extension principle for classes, analogous to the extensionality axiom for sets. **Membership** for classes is a binary relation between a *set* and a *class*: we write <span>&#92;(x &#92;in C&#92;)</span> when <span>&#92;(x&#92;)</span> is a set and <span>&#92;(C&#92;)</span> is a class. It makes no sense to ask whether a class is a member of another class — this is not ill-formed by accident; it is precisely what prevents a class-level version of Russell's Paradox. Since membership does not relate classes to classes, one cannot even formulate the question "is the class <span>&#92;(C&#92;)</span> a member of itself?"

### Ordered Pairs and Cartesian Products

Before restating the Replacement Axiom in its cleanest form, we need the machinery of ordered pairs and functions. Given sets <span>&#92;(x&#92;)</span> and <span>&#92;(y&#92;)</span>, the **ordered pair** is defined as
<span>&#92;[(x, y) := &#92;{&#92;{x&#92;}, &#92;{x, y&#92;}&#92;}.&#92;]</span>

This set exists by the pair set axiom applied twice. The crucial property is:
<span>&#92;[(x, y) = (x', y') &#92;iff x = x' &#92;text{ and } y = y'.&#92;]</span>
This distinguishes ordered pairs from unordered pairs: <span>&#92;(\{1, 2\} = \{2, 1\}&#92;)</span> as sets, but <span>&#92;((1, 2) &#92;neq (2, 1)&#92;)</span> as ordered pairs (assuming <span>&#92;(1 &#92;neq 2&#92;)</span>).

Given classes <span>&#92;(X&#92;)</span> and <span>&#92;(Y&#92;)</span>, the **Cartesian product** <span>&#92;(X &#92;times Y&#92;)</span> is the class of all ordered pairs <span>&#92;((x, y)&#92;)</span> with <span>&#92;(x &#92;in X&#92;)</span> and <span>&#92;(y &#92;in Y&#92;)</span>. This is a class because the condition of being an ordered pair of elements from definite classes is itself definite. When <span>&#92;(X&#92;)</span> and <span>&#92;(Y&#92;)</span> happen to be sets, <span>&#92;(X &#92;times Y&#92;)</span> is also a set: every ordered pair <span>&#92;((x, y)&#92;)</span> is an element of <span>&#92;(&#92;\mathcal{P}(&#92;\mathcal{P}(X &#92;cup Y))&#92;)</span>, so one can bound the separation and apply Axiom 7.

A key observation about classes and sets: **a subclass of a set is a set**. If <span>&#92;(B&#92;)</span> is a set and <span>&#92;(A &#92;subseteq B&#92;)</span> is a class, then <span>&#92;(A&#92;)</span> is also a set. The reason: since <span>&#92;(A &#92;subseteq B&#92;)</span>, the unbounded class definition of <span>&#92;(A&#92;)</span> can be replaced by the bounded form <span>&#92;(A = &#92;{t &#92;in B : P(t)&#92;}&#92;)</span>, which is a set by Axiom 7.

### Definite Operations

A **definite operation** <span>&#92;(f : X &#92;to Y&#92;)</span> between classes <span>&#92;(X&#92;)</span> and <span>&#92;(Y&#92;)</span> is, formally, a subclass <span>&#92;(&#92;Gamma_f &#92;subseteq X &#92;times Y&#92;)</span> — the *graph* of <span>&#92;(f&#92;)</span> — satisfying the **vertical line test**: for every <span>&#92;(x &#92;in X&#92;)</span> there is a unique <span>&#92;(y &#92;in Y&#92;)</span> such that <span>&#92;((x, y) &#92;in &#92;Gamma_f&#92;)</span>. We call it "definite" because <span>&#92;(&#92;Gamma_f&#92;)</span> must be defined by a definite condition (i.e., it is a class). We write <span>&#92;(f(x) = y&#92;)</span> as notation for <span>&#92;((x, y) &#92;in &#92;Gamma_f&#92;)</span>. When <span>&#92;(X&#92;)</span> and <span>&#92;(Y&#92;)</span> are sets, the graph <span>&#92;(&#92;Gamma_f&#92;)</span> is a set (as a subclass of the set <span>&#92;(X &#92;times Y&#92;)</span>), and <span>&#92;(f&#92;)</span> is simply a **function**.

A prototypical example of a definite operation with a proper-class domain is the **successor function** <span>&#92;(S : U &#92;to U&#92;)</span>, defined by <span>&#92;(S(x) = x &#92;cup &#92;{x&#92;}&#92;)</span>. Its graph is the class of pairs <span>&#92;((x, y)&#92;)</span> such that <span>&#92;(&#92;forall t(t &#92;in y &#92;leftrightarrow t &#92;in x &#92;vee t = x)&#92;)</span> — a definite condition. The domain is the class of all sets; no single set can bound it.

### Replacement Restated

With this language of classes and definite operations, the Replacement Axiom can be stated much more cleanly: **if <span>&#92;(f : U &#92;to U&#92;)</span> is a definite operation and <span>&#92;(A&#92;)</span> is a set, then the image <span>&#92;(f[A] = &#92;{f(a) : a &#92;in A&#92;}&#92;)</span> is a set.** The set <span>&#92;(f[A]&#92;)</span> is characterized by: <span>&#92;(y &#92;in f[A] &#92;iff &#92;exists a &#92;in A,\, y = f(a)&#92;)</span>, which is a definite condition, so this is a legitimate existence assertion.

---

## Lecture 4: Ordering the Natural Numbers

### The Induction Principle in Action

We have constructed <span>&#92;(&#92;omega&#92;)</span> and observed that it satisfies the induction principle. Now we put induction to work by establishing a series of structural properties of the natural numbers. The strategy in each proof is the same: define <span>&#92;(J&#92;)</span> to be the set of natural numbers satisfying the desired property (using bounded separation, with <span>&#92;(&#92;omega&#92;)</span> as the bound), prove that <span>&#92;(J&#92;)</span> is inductive, and conclude by the induction principle that <span>&#92;(J = &#92;omega&#92;)</span>.

**Lemma 1.12.** *For any <span>&#92;(n &#92;in &#92;omega&#92;)</span>:*
*(a) every element of <span>&#92;(n&#92;)</span> is an element of <span>&#92;(&#92;omega&#92;)</span>;*
*(b) every element of <span>&#92;(n&#92;)</span> is a subset of <span>&#92;(n&#92;)</span>;*
*(c) <span>&#92;(n &#92;notin n&#92;)</span>;*
*(d) either <span>&#92;(n = 0&#92;)</span> or <span>&#92;(0 &#92;in n&#92;)</span>;*
*(e) if <span>&#92;(y &#92;in n&#92;)</span> then either <span>&#92;(S(y) &#92;in n&#92;)</span> or <span>&#92;(S(y) = n&#92;)</span>.*

*Proof of (a).* Let <span>&#92;(J = &#92;{n &#92;in &#92;omega : n &#92;subseteq &#92;omega&#92;}&#92;)</span> (those natural numbers that are subsets of <span>&#92;(&#92;omega&#92;)</span>). We check <span>&#92;(J&#92;)</span> is inductive. Base case: <span>&#92;(0 = &#92;emptyset &#92;subseteq &#92;omega&#92;)</span> since the empty set is a subset of every set, so <span>&#92;(0 &#92;in J&#92;)</span>. Inductive step: suppose <span>&#92;(n &#92;in J&#92;)</span>, so <span>&#92;(n &#92;subseteq &#92;omega&#92;)</span> and <span>&#92;(n &#92;in &#92;omega&#92;)</span>. Then <span>&#92;(S(n) = n &#92;cup &#92;\{n\}&#92;)</span>: its elements are either elements of <span>&#92;(n&#92;)</span> (which are in <span>&#92;(&#92;omega&#92;)</span> since <span>&#92;(n &#92;subseteq &#92;omega&#92;)</span>) or equal to <span>&#92;(n&#92;)</span> itself (which is in <span>&#92;(&#92;omega&#92;)</span>). So <span>&#92;(S(n) &#92;subseteq &#92;omega&#92;)</span>, i.e., <span>&#92;(S(n) &#92;in J&#92;)</span>. By induction, <span>&#92;(J = &#92;omega&#92;)</span>. <span>&#92;(\square&#92;)</span>

*Proof of (b).* Let <span>&#92;(J = &#92;{n &#92;in &#92;omega : &#92;forall x &#92;in n,\, x &#92;subseteq n&#92;}&#92;)</span>. Base case: <span>&#92;(0&#92;)</span> satisfies the condition vacuously. Inductive step: suppose <span>&#92;(n &#92;in J&#92;)</span> and let <span>&#92;(x &#92;in S(n) = n &#92;cup &#92;\{n\}&#92;)</span>. Either <span>&#92;(x = n&#92;)</span>, in which case <span>&#92;(x = n &#92;subseteq S(n)&#92;)</span> (since <span>&#92;(n &#92;subseteq S(n)&#92;)</span> by construction); or <span>&#92;(x &#92;in n&#92;)</span>, in which case <span>&#92;(x &#92;subseteq n&#92;)</span> (since <span>&#92;(n &#92;in J&#92;)</span>) and <span>&#92;(n &#92;subseteq S(n)&#92;)</span>, so <span>&#92;(x &#92;subseteq S(n)&#92;)</span>. Thus <span>&#92;(S(n) &#92;in J&#92;)</span>, and by induction <span>&#92;(J = &#92;omega&#92;)</span>. <span>&#92;(\square&#92;)</span>

Parts (c), (d), and (e) are all proved by similar induction arguments, which the professor sketches in lecture and which have full details in the written notes.

Note how striking part (b) is: the elements of any natural number are also subsets of it. This conflation of membership and inclusion — of "being in" and "being contained in" — is a special feature of our set-theoretic construction of the natural numbers, and it will be the key to defining ordinals.

### Strict Partial Orderings and Well-Orderings

Before we can describe the ordering on <span>&#92;(&#92;omega&#92;)</span> induced by membership, we pause to fix the relevant definitions. A **strict partial ordering** on a set <span>&#92;(E&#92;)</span> is a binary relation <span>&#92;(R&#92;)</span> satisfying:

1. *Antireflexivity*: <span>&#92;(&#92;neg(x R x)&#92;)</span> for all <span>&#92;(x &#92;in E&#92;)</span>.
2. *Antisymmetry*: if <span>&#92;(x R y&#92;)</span> and <span>&#92;(y R x&#92;)</span> then <span>&#92;(x = y&#92;)</span>.
3. *Transitivity*: if <span>&#92;(x R y&#92;)</span> and <span>&#92;(y R z&#92;)</span> then <span>&#92;(x R z&#92;)</span>.

A strict partial ordering is **linear** (or **total**) if for all <span>&#92;(x, y &#92;in E&#92;)</span>, at least one of <span>&#92;(x R y&#92;)</span>, <span>&#92;(x = y&#92;)</span>, <span>&#92;(y R x&#92;)</span> holds. A linear ordering is a **well-ordering** if every non-empty subset of <span>&#92;(E&#92;)</span> has a least element (i.e., an element related to all others).

**Proposition 1.13.** *<span>&#92;((&#92;omega, &#92;in)&#92;)</span> is a strictly linearly ordered set.*

*Proof.* Antireflexivity is Lemma 1.12(c). For antisymmetry, suppose <span>&#92;(n &#92;in m&#92;)</span> and <span>&#92;(m &#92;in n&#92;)</span>. By Lemma 1.12(b), <span>&#92;(n &#92;in m&#92;)</span> implies <span>&#92;(n &#92;subseteq m&#92;)</span), and <span>&#92;(m &#92;in n&#92;)</span> implies <span>&#92;(m &#92;subseteq n&#92;)</span>. By extensionality, <span>&#92;(n = m&#92;)</span>. For transitivity, if <span>&#92;(l &#92;in m&#92;)</span> and <span>&#92;(m &#92;in n&#92;)</span>, then Lemma 1.12(b) gives <span>&#92;(m &#92;subseteq n&#92;)</span>, so <span>&#92;(l &#92;in n&#92;)</span>. Linearity is proved by induction: fix <span>&#92;(n &#92;in &#92;omega&#92;)</span> and let <span>&#92;(J&#92;)</span> be the set of all <span>&#92;(m &#92;in &#92;omega&#92;)</span> satisfying <span>&#92;(m &#92;in n&#92;)</span> or <span>&#92;(m = n&#92;)</span> or <span>&#92;(n &#92;in m&#92;)</span>. One verifies (using parts (d) and (e) of Lemma 1.12) that <span>&#92;(J&#92;)</span> is inductive, so <span>&#92;(J = &#92;omega&#92;)</span>. <span>&#92;(\square&#92;)</span>

The fact that *membership* is the ordering relation here is philosophically striking. In ordinary mathematics we are given a set and then an ordering is imposed on it from outside. Here the ordering is intrinsic to the very structure of the natural numbers as sets.

---

## Lecture 5a: Ordinals (Part 1)

### Well-Ordering <span>&#92;(&#92;omega&#92;)</span>

Linear ordering alone is not enough — what we really want, and what enables transfinite induction, is a **well-ordering**. The key additional property is:

**Proposition 1.13 (continued).** *<span>&#92;((&#92;omega, &#92;in)&#92;)</span> is a strict well-ordering.*

*Proof.* We must show that every non-empty <span>&#92;(X &#92;subseteq &#92;omega&#92;)</span> has a membership-least element. Suppose for contradiction that <span>&#92;(X&#92;)</span> has no membership-least element. Define
<span>&#92;[J = &#92;{n &#92;in &#92;omega : S(n) &#92;cap X = &#92;emptyset&#92;}&#92;]</span>
by bounded separation. We show <span>&#92;(J&#92;)</span> is inductive, hence <span>&#92;(J = &#92;omega&#92;)</span>, and then derive that <span>&#92;(X = &#92;emptyset&#92;)</span>.

*Base case*: <span>&#92;(0 &#92;in J&#92;)</span>. If not, then <span>&#92;(S(0) &#92;cap X &#92;neq &#92;emptyset&#92;)</span>. But <span>&#92;(S(0) = 1 = &#92;\{0\}&#92;)</span>, so <span>&#92;(0 &#92;in X&#92;)</span>. By Lemma 1.12(d), every natural number either is <span>&#92;(0&#92;)</span> or contains <span>&#92;(0&#92;)</span>, so <span>&#92;(0&#92;)</span> is membership-least in all of <span>&#92;(&#92;omega&#92;)</span>, and hence membership-least in <span>&#92;(X&#92;)</span> — contradicting our assumption.

*Inductive step*: suppose <span>&#92;(n &#92;in J&#92;)</span>, i.e., <span>&#92;(S(n) &#92;cap X = &#92;emptyset&#92;)</span>. We want <span>&#92;(S(S(n)) &#92;cap X = &#92;emptyset&#92;)</span>. An element of <span>&#92;(S(S(n))&#92;)</span> is either in <span>&#92;(S(n)&#92;)</span> or equals <span>&#92;(S(n)&#92;)</span>. By hypothesis no element of <span>&#92;(S(n)&#92;)</span> is in <span>&#92;(X&#92;)</span>. If <span>&#92;(S(n) &#92;in X&#92;)</span>, then since every element of <span>&#92;(S(n)&#92;)</span> is outside <span>&#92;(X&#92;)</span>, the element <span>&#92;(S(n)&#92;)</span> would be membership-least in <span>&#92;(X&#92;)</span> — a contradiction. So <span>&#92;(S(n) &#92;notin X&#92;)</span> and <span>&#92;(S(S(n)) &#92;cap X = &#92;emptyset&#92;)</span>, giving <span>&#92;(S(n) &#92;in J&#92;)</span>.

By induction <span>&#92;(J = &#92;omega&#92;)</span>. For any <span>&#92;(n &#92;in &#92;omega&#92;)</span>, we have <span>&#92;(n &#92;in S(n)&#92;)</span>, and since <span>&#92;(S(n) &#92;cap X = &#92;emptyset&#92;)</span>, it follows that <span>&#92;(n &#92;notin X&#92;)</span>. Thus <span>&#92;(X = &#92;emptyset&#92;)</span>. <span>&#92;(\square&#92;)</span>

We have now established that <span>&#92;(&#92;omega&#92;)</span>, with its membership ordering, behaves exactly as our pre-theoretic picture of the natural numbers suggests: it is a strict well-ordering. The ordering is not imposed from outside; it is encoded in the very set-membership structure of the construction. This is our intuition vindicated.

### Defining Ordinals

With the natural numbers in hand and their membership well-ordering proved, we abstract the two key properties of <span>&#92;(&#92;omega&#92;)</span> that drove everything:

(1) Every element of <span>&#92;(&#92;omega&#92;)</span> is a subset of <span>&#92;(&#92;omega&#92;)</span> — Lemma 1.12(a) and (b).

(2) The membership relation is a well-ordering on <span>&#92;(&#92;omega&#92;)</span> — Proposition 1.13.

**Definition 1.14.** An **ordinal** is a set <span>&#92;(&#92;alpha&#92;)</span> satisfying:
1. Every member of <span>&#92;(&#92;alpha&#92;)</span> is a subset of <span>&#92;(&#92;alpha&#92;)</span>.
2. The membership relation <span>&#92;(&#92;in&#92;)</span> is a strict well-ordering on <span>&#92;(&#92;alpha&#92;)</span>.

When working with elements of an ordinal, we write <span>&#92;(x < y&#92;)</span> as notation for <span>&#92;(x &#92;in y&#92;)</span>. This is purely notational; the underlying relation is always membership. The class of all ordinals is denoted <span>&#92;(&#92;mathrm{Ord}&#92;)</span>.

What is unusual about this definition is what it does *not* say: an ordinal is not defined as an ordered set with some extra structure given from outside. It is just a set, with conditions on its internal membership structure. Condition (1) is often called **transitivity** (as a set, <span>&#92;(&#92;alpha&#92;)</span> is "transitive": elements of elements are elements). Condition (2) says the membership relation provides a well-ordering for free.

The first examples are:

- Every natural number <span>&#92;(n &#92;in &#92;omega&#92;)</span> is an ordinal. Condition (1) is Lemma 1.12(b). Condition (2) follows because <span>&#92;(n &#92;subseteq &#92;omega&#92;)</span> (by Lemma 1.12(a)), and well-ordering is inherited by subsets: if <span>&#92;((E, <)&#92;)</span> is a well-ordering and <span>&#92;(F &#92;subseteq E&#92;)</span>, then <span>&#92;((F, <)&#92;)</span> is also a well-ordering (all the axioms being universal statements or about subsets of <span>&#92;(F&#92;)</span>).

- <span>&#92;(&#92;omega&#92;)</span> itself is an ordinal, by Proposition 1.13 and Lemma 1.12(a).

We call the natural numbers the **finite ordinals**. The ordinal <span>&#92;(&#92;omega&#92;)</span> is the first *infinite* ordinal. Many more ordinals await.

---

## Lecture 5b: Ordinals (Part 2)

### Ordinal Subsets and a Key Lemma

We have observed that every *element* of an ordinal is a *subset*. Is the converse true — is every subset of an ordinal also an element? Not in general: one can produce subsets of <span>&#92;(&#92;omega&#92;)</span> (e.g., the set of even natural numbers) that are not natural numbers, hence not elements of <span>&#92;(&#92;omega&#92;)</span>. However, if the subset is itself an ordinal, it must be an element:

**Lemma 1.16.** *If <span>&#92;(&#92;alpha&#92;)</span> and <span>&#92;(&#92;beta&#92;)</span> are ordinals with <span>&#92;(&#92;alpha &#92;subsetneq &#92;beta&#92;)</span>, then <span>&#92;(&#92;alpha &#92;in &#92;beta&#92;)</span>.*

*Proof.* The proof beautifully illustrates how the well-ordering structure of <span>&#92;(&#92;beta&#92;)</span> and the transitivity property of <span>&#92;(&#92;alpha&#92;)</span> interact. Let <span>&#92;(D = &#92;beta &#92;setminus &#92;alpha&#92;)</span>. Since <span>&#92;(&#92;alpha &#92;subsetneq &#92;beta&#92;)</span>, we have <span>&#92;(D &#92;neq &#92;emptyset&#92;)</span>. The set <span>&#92;(D&#92;)</span> exists by bounded separation (bounded by <span>&#92;(&#92;beta&#92;)</span>) and is a non-empty subset of <span>&#92;(&#92;beta&#92;)</span>. Since <span>&#92;(&#92;beta&#92;)</span> is an ordinal, its membership relation is a well-ordering, so <span>&#92;(D&#92;)</span> has a least element; call it <span>&#92;(d&#92;)</span>.

*Claim*: <span>&#92;(&#92;alpha = d&#92;)</span>. We prove two inclusions.

<span>&#92;(d &#92;subseteq &#92;alpha&#92;)</span>: Suppose for contradiction there exists <span>&#92;(x &#92;in d &#92;setminus &#92;alpha&#92;)</span>. Then <span>&#92;(x &#92;in d &#92;subseteq &#92;beta&#92;&#92;)</span> and <span>&#92;(x &#92;notin &#92;alpha&#92;)</span>, so <span>&#92;(x &#92;in D&#92;)</span>. But <span>&#92;(d &#92;in &#92;beta&#92;)</span> is an ordinal (as a member of an ordinal; we leave this property to Proposition 1.17(a)), so <span>&#92;(x &#92;in d&#92;)</span> implies <span>&#92;(x &#92;subseteq d&#92;)</span>, i.e., <span>&#92;(x < d&#92;)</span> in <span>&#92;(&#92;beta&#92;)</span>. This contradicts <span>&#92;(d&#92;)</span> being least in <span>&#92;(D&#92;)</span>.

<span>&#92;(&#92;alpha &#92;subseteq d&#92;)</span>: Take any <span>&#92;(x &#92;in &#92;alpha&#92;)</span>. Both <span>&#92;(x&#92;)</span> and <span>&#92;(d&#92;)</span> are elements of <span>&#92;(&#92;beta&#92;)</span>, so by linearity of the ordering on <span>&#92;(&#92;beta&#92;)</span>, either <span>&#92;(x < d&#92;)</span>, <span>&#92;(x = d&#92;)</span>, or <span>&#92;(d < x&#92;)</span>. We rule out the last two. If <span>&#92;(x = d&#92;)</span>, then <span>&#92;(d &#92;in &#92;alpha&#92;)</span>, contradicting <span>&#92;(d &#92;in D = &#92;beta &#92;setminus &#92;alpha&#92;)</span>. If <span>&#92;(d < x&#92;)</span>, i.e., <span>&#92;(d &#92;in x&#92;)</span>: since <span>&#92;(&#92;alpha&#92;)</span> is an ordinal and <span>&#92;(x &#92;in &#92;alpha&#92;)</span>, condition (1) of the ordinal definition gives <span>&#92;(x &#92;subseteq &#92;alpha&#92;)</span>. So <span>&#92;(d &#92;in x &#92;subseteq &#92;alpha&#92;)</span>, giving <span>&#92;(d &#92;in &#92;alpha&#92;)</span> — again contradicting <span>&#92;(d &#92;in D&#92;)</span>. (Note: this is the one place where we use that <span>&#92;(&#92;alpha&#92;)</span> is an ordinal, not merely a subset of <span>&#92;(&#92;beta&#92;)</span>. Without this, one could mistake "transitivity" for a ready-made application, but <span>&#92;(&#92;alpha&#92;)</span> is not known to be in <span>&#92;(&#92;beta&#92;)</span> — that is exactly what we are proving.) Therefore <span>&#92;(x < d&#92;)</span>, i.e., <span>&#92;(x &#92;in d&#92;)</span>.

We have shown <span>&#92;(&#92;alpha = d &#92;in &#92;beta&#92;)</span>. <span>&#92;(\square&#92;)</span>

A beautiful consequence: an ordinal <span>&#92;(&#92;alpha&#92;)</span> equals the set of all ordinals strictly less than it. This "self-reflexive" property — that <span>&#92;(&#92;alpha&#92;)</span> is the least element of <span>&#92;(&#92;beta &#92;setminus &#92;alpha&#92;)</span> — gives ordinals a remarkably canonical structure.

### Further Properties of Ordinals

The following propositions collect the essential structural facts. Their proofs use Lemma 1.16 together with the definitions.

**Proposition 1.17.**
*(a) Every member of an ordinal is an ordinal.*
*(b) No ordinal is a member of itself.*
*(c) If <span>&#92;(&#92;alpha &#92;in &#92;mathrm{Ord}&#92;)</span>, then its **successor** <span>&#92;(S(&#92;alpha) := &#92;alpha &#92;cup &#92;\{&#92;alpha\}&#92;)</span> is an ordinal.*
*(d) The intersection of two ordinals is an ordinal.*

**Proposition 1.18.**
*(a) For any <span>&#92;(&#92;alpha, &#92;beta &#92;in &#92;mathrm{Ord}&#92;)</span>, exactly one of <span>&#92;(&#92;alpha &#92;in &#92;beta&#92;)</span>, <span>&#92;(&#92;alpha = &#92;beta&#92;)</span>, <span>&#92;(&#92;beta &#92;in &#92;alpha&#92;)</span> holds (trichotomy).*
*(b) Every set of ordinals is strictly well-ordered by <span>&#92;(&#92;in&#92;)</span>.*
*(c) If <span>&#92;(E &#92;subseteq &#92;mathrm{Ord}&#92;)</span> is a set, then <span>&#92;(&#92;sup E := &#92;bigcup E&#92;)</span> is an ordinal.*
*(d) <span>&#92;(&#92;mathrm{Ord}&#92;)</span> is a proper class.*

Part (d) deserves comment. We already know that <span>&#92;(&#92;mathrm{Ord}&#92;)</span> is a class — being an ordinal is a definite condition (all the requirements of Definition 1.14 can be expressed as first-order formulas). But <span>&#92;(&#92;mathrm{Ord}&#92;)</span> cannot be a set, for if it were, it would itself be an ordinal (by part (b), it is a transitive class well-ordered by membership), and then <span>&#92;(&#92;mathrm{Ord} &#92;in &#92;mathrm{Ord}&#92;)</span>, contradicting part (b). This is the **Burali-Forti paradox**, resolved here by recognizing that <span>&#92;(&#92;mathrm{Ord}&#92;)</span> is a proper class.

### Successor and Limit Ordinals

**Lemma 1.20.**
*(a) There is no ordinal strictly between <span>&#92;(&#92;alpha&#92;)</span> and <span>&#92;(S(&#92;alpha)&#92;)</span>.*
*(b) If <span>&#92;(E &#92;subseteq &#92;mathrm{Ord}&#92;)</span> is a nonempty set, then <span>&#92;(&#92;sup E = &#92;bigcup E&#92;)</span> is the least upper bound of <span>&#92;(E&#92;)</span>.*
*(c) For every set of ordinals <span>&#92;(E&#92;)</span>, there is a least ordinal not in <span>&#92;(E&#92;)</span>.*

Part (a) says the successor operation has no gaps: <span>&#92;(S(&#92;alpha)&#92;)</span> is the *immediate* successor of <span>&#92;(&#92;alpha&#92;)</span> in the ordering on <span>&#92;(&#92;mathrm{Ord}&#92;)</span>. This mirrors the familiar fact that there is no natural number between <span>&#92;(n&#92;)</span> and <span>&#92;(n+1&#92;)</span>.

**Definition 1.21.** An ordinal <span>&#92;(&#92;alpha&#92;)</span> is a **successor ordinal** if <span>&#92;(&#92;alpha = S(&#92;beta)&#92;)</span> for some ordinal <span>&#92;(&#92;beta&#92;)</span>. An ordinal that is not a successor is a **limit ordinal**.

The ordinal <span>&#92;(0 = &#92;emptyset&#92;)</span> is a limit ordinal — vacuously, since there is no <span>&#92;(&#92;beta&#92;)</span> such that <span>&#92;(0 = S(&#92;beta)&#92;)</span>. The natural numbers <span>&#92;(1, 2, 3, &#92;ldots&#92;)</span> are all successor ordinals. The ordinal <span>&#92;(&#92;omega&#92;)</span> is the smallest **infinite** limit ordinal: it has no immediate predecessor among the ordinals, and every finite ordinal is a proper initial segment of <span>&#92;(&#92;omega&#92;)</span>. Beyond <span>&#92;(&#92;omega&#92;)</span> lie <span>&#92;(&#92;omega + 1 = S(&#92;omega)&#92;)</span>, <span>&#92;(&#92;omega + 2&#92;)</span>, and so on — the transfinite ordinals that will occupy our next set of lectures.

The central insight of Part I can be summarized as follows. We began with nothing but undefined notions of set and membership, introduced eight axioms motivated solely by the desire to construct the natural numbers, and have arrived at a rich and canonical hierarchy of well-ordered sets — the ordinals — that will serve as the backbone for all transfinite arithmetic to come.
## Lecture 6: Ordering the Ordinals

Where were we? In the previous lecture the ordinals were introduced and defined: a set <span>&#92;(\alpha&#92;)</span> is an **ordinal** if every element of <span>&#92;(\alpha&#92;)</span> is a subset of <span>&#92;(\alpha&#92;)</span> (the *transitivity* condition), and the membership relation restricts to a strict well-ordering on <span>&#92;(\alpha&#92;)</span>. The prototype was <span>&#92;(\omega&#92;)</span>, the set of natural numbers, and we saw that these two conditions are modelled precisely on what <span>&#92;(\omega&#92;)</span> satisfies. Today we establish further properties of ordinals (Proposition 1.17 in the notes), culminating in the result that ordinals are *linearly ordered* by membership and that the class <span>&#92;(\mathrm{Ord}&#92;)</span> of all ordinals is itself a proper class.

**Proposition 1.17.** *(a) Every member of an ordinal is an ordinal. (b) No ordinal is a member of itself. (c) If <span>&#92;(\alpha \in \mathrm{Ord}&#92;)</span> then <span>&#92;(S(\alpha) = \alpha \cup \{\alpha\}&#92;)</span> is an ordinal. (d) If <span>&#92;(\alpha, \beta \in \mathrm{Ord}&#92;)</span> then <span>&#92;(\alpha \cap \beta&#92;)</span> is an ordinal.*

For part (a), suppose <span>&#92;(\alpha&#92;)</span> is an ordinal and <span>&#92;(z \in \alpha&#92;)</span>. We need to show <span>&#92;(z&#92;)</span> is an ordinal. First, since <span>&#92;(z \in \alpha&#92;)</span> and every member of an ordinal is a subset, <span>&#92;(z \subseteq \alpha&#92;)</span>, so any <span>&#92;(x \in z&#92;)</span> also lies in <span>&#92;(\alpha&#92;)</span>. Similarly, any <span>&#92;(y \in x&#92;)</span> lies in <span>&#92;(\alpha&#92;)</span>. Since <span>&#92;(x, y, z \in \alpha&#92;)</span> and <span>&#92;(\alpha&#92;)</span> is strictly well-ordered by membership, transitivity gives <span>&#92;(y \in z&#92;)</span>, verifying that every element of <span>&#92;(z&#92;)</span> is a subset. The second condition — that membership well-orders <span>&#92;(z&#92;)</span> — is immediate, because <span>&#92;(z \subseteq \alpha&#92;)</span> and the property of being a strict well-ordering is preserved by passing to subsets. Parts (c) and (d) are left as exercises; the key ideas are that <span>&#92;(\alpha \cup \{\alpha\}&#92;)</span> and <span>&#92;(\alpha \cap \beta&#92;)</span> each satisfy the two defining conditions for an ordinal.

For part (b), suppose for contradiction that <span>&#92;(\alpha \in \alpha&#92;)</span>. Then <span>&#92;(\alpha&#92;)</span> is a member of itself, so anti-reflexivity of the strict well-ordering on <span>&#92;(\alpha&#92;)</span> applies to <span>&#92;(\alpha&#92;)</span>, giving <span>&#92;(\alpha \notin \alpha&#92;)</span>. This is the desired contradiction.

**Proposition 1.18.** *(a) Any two ordinals <span>&#92;(\alpha, \beta&#92;)</span> satisfy exactly one of <span>&#92;(\alpha = \beta&#92;)</span>, <span>&#92;(\alpha \in \beta&#92;)</span>, or <span>&#92;(\beta \in \alpha&#92;)</span>. (b) Every set of ordinals is strictly well-ordered by membership. (c) If <span>&#92;(E&#92;)</span> is a set of ordinals then <span>&#92;(\sup E := \bigcup E&#92;)</span> is an ordinal. (d) <span>&#92;(\mathrm{Ord}&#92;)</span> is a proper class.*

For part (a), consider <span>&#92;(\alpha \cap \beta&#92;)</span>, which is an ordinal by 1.17(d) and a subset of both <span>&#92;(\alpha&#92;)</span> and <span>&#92;(\beta&#92;)</span>. By Lemma 1.16 (proved in the previous lecture), a proper ordinal subset of an ordinal must be a *member* of that ordinal. Suppose <span>&#92;(\alpha \cap \beta \neq \alpha&#92;)</span> and <span>&#92;(\alpha \cap \beta \neq \beta&#92;)</span>. Then the intersection is a proper subset of each, so <span>&#92;(\alpha \cap \beta \in \alpha&#92;)</span> and <span>&#92;(\alpha \cap \beta \in \beta&#92;)</span>, hence <span>&#92;(\alpha \cap \beta \in \alpha \cap \beta&#92;)</span>. But no ordinal is a member of itself — contradiction. So either <span>&#92;(\alpha \cap \beta = \alpha&#92;)</span>, meaning <span>&#92;(\alpha \subseteq \beta&#92;)</span>, or <span>&#92;(\alpha \cap \beta = \beta&#92;)</span>, meaning <span>&#92;(\beta \subseteq \alpha&#92;)</span>. In the first case <span>&#92;(\alpha = \beta&#92;)</span> or <span>&#92;(\alpha \in \beta&#92;)</span> by Lemma 1.16; in the second, <span>&#92;(\beta = \alpha&#92;)</span> or <span>&#92;(\beta \in \alpha&#92;)</span>. This yields exactly the trichotomy.

Part (b) says membership is a strict well-ordering on any *set* <span>&#92;(E&#92;)</span> of ordinals. Anti-reflexivity holds because no ordinal is a member of itself; transitivity holds because <span>&#92;(\beta \in \gamma&#92;)</span> implies <span>&#92;(\beta \subseteq \gamma&#92;)</span> (since <span>&#92;(\gamma&#92;)</span> is an ordinal), so <span>&#92;(\alpha \in \beta \in \gamma&#92;)</span> gives <span>&#92;(\alpha \in \gamma&#92;)</span>; linearity is part (a). For well-foundedness: given a non-empty subset <span>&#92;(A \subseteq E&#92;)</span>, pick any <span>&#92;(\alpha \in A&#92;)</span>. If <span>&#92;(\alpha \cap A = \emptyset&#92;)</span> then <span>&#92;(\alpha&#92;)</span> is already least. Otherwise <span>&#92;(\alpha \cap A&#92;)</span> is a non-empty subset of the ordinal <span>&#92;(\alpha&#92;)</span>, so it has a least element <span>&#92;(a&#92;)</span>; one checks that <span>&#92;(a&#92;)</span> is least in <span>&#92;(A&#92;)</span>.

For part (c): <span>&#92;(\bigcup E&#92;)</span> is a set by the Union axiom, its elements are members of members of <span>&#92;(E&#92;)</span>, hence ordinals by 1.17(a). By part (b) it is strictly well-ordered by membership. For the transitivity condition, take any <span>&#92;(\alpha \in \bigcup E&#92;)</span>: then <span>&#92;(\alpha \in \gamma&#92;)</span> for some <span>&#92;(\gamma \in E&#92;)</span>, so <span>&#92;(\alpha \subseteq \gamma \subseteq \bigcup E&#92;)</span>, confirming that every element of <span>&#92;(\bigcup E&#92;)</span> is a subset.

For part (d): suppose <span>&#92;(\mathrm{Ord}&#92;)</span> were a set. By part (b) it would be strictly well-ordered by membership, and by 1.17(a) every element of <span>&#92;(\mathrm{Ord}&#92;)</span> is a subset of <span>&#92;(\mathrm{Ord}&#92;)</span>. So <span>&#92;(\mathrm{Ord}&#92;)</span> would satisfy both conditions of being an ordinal, giving <span>&#92;(\mathrm{Ord} \in \mathrm{Ord}&#92;)</span>. But by 1.17(b) no ordinal is a member of itself — contradiction. Hence <span>&#92;(\mathrm{Ord}&#92;)</span> is a proper class.

The content of this proposition is profound: except for the defect of being a proper class, <span>&#92;(\mathrm{Ord}&#92;)</span> behaves exactly like an ordinal. We now write <span>&#92;(\alpha < \beta&#92;)</span> as shorthand for <span>&#92;(\alpha \in \beta&#92;)</span>, giving a canonical **class-ordering** on <span>&#92;(\mathrm{Ord}&#92;)</span>. With this ordering in place, <span>&#92;(\bigcup E&#92;)</span> is not merely some ordinal — it will be the *least upper bound* of <span>&#92;(E&#92;)</span> in this ordering, a fact we justify in the next lecture.

---

## Lecture 7a: Sups, Successors and Limits

Recall from last time that membership well-orders the class of ordinals to the extent that makes sense: any *set* of ordinals is strictly well-ordered by <span>&#92;(\in&#92;)</span>, and we write <span>&#92;(\alpha < \beta&#92;)</span iff <span>&#92;(\alpha \in \beta&#92;)</span>. Today we prove two further lemmas that will be indispensable: that <span>&#92;(S(\alpha)&#92;)</span> really is a "next" ordinal with nothing in between, that <span>&#92;(\bigcup E&#92;)</span> really is the *least upper bound*, and that every set of ordinals has a least ordinal *not* in it.

**Lemma 1.19.** *(a) For any ordinal <span>&#92;(\alpha&#92;)</span>, <span>&#92;(\alpha < S(\alpha)&#92;)</span> and there is no ordinal <span>&#92;(\gamma&#92;)</span> with <span>&#92;(\alpha < \gamma < S(\alpha)&#92;)</span>. (b) If <span>&#92;(E&#92;)</span> is a set of ordinals, then <span>&#92;(\sup E = \bigcup E&#92;)</span> is the least upper bound of <span>&#92;(E&#92;)</span>. (c) For any set of ordinals <span>&#92;(E&#92;)</span>, there exists a least ordinal not in <span>&#92;(E&#92;)</span>.*

For part (a): since <span>&#92;(S(\alpha) = \alpha \cup \{\alpha\}&#92;)</span>, we see directly that <span>&#92;(\alpha \in S(\alpha)&#92;)</span>, i.e., <span>&#92;(\alpha < S(\alpha)&#92;)</span>. If <span>&#92;(\gamma < S(\alpha)&#92;)</span> then <span>&#92;(\gamma \in S(\alpha) = \alpha \cup \{\alpha\}&#92;)</span>, so either <span>&#92;(\gamma \in \alpha&#92;)</span> (i.e., <span>&#92;(\gamma < \alpha&#92;)</span>) or <span>&#92;(\gamma = \alpha&#92;)</span>. Nothing can lie strictly between <span>&#92;(\alpha&#92;)</span> and its successor.

For part (b): first, every <span>&#92;(\alpha \in E&#92;)</span> is a subset of <span>&#92;(\bigcup E&#92;)</span> (by definition of union), so <span>&#92;(\alpha \leq \bigcup E&#92;)</span> in the sense that <span>&#92;(\alpha \subseteq \bigcup E&#92;)</span>, which means <span>&#92;(\alpha \leq \sup E&#92;)</span>. If <span>&#92;(\sup E&#92;)</span> were not an upper bound, there would be some <span>&#92;(\alpha \in E&#92;)</span> with <span>&#92;(\sup E < \alpha&#92;)</span>; but then <span>&#92;(\sup E \in \alpha \subseteq \bigcup E = \sup E&#92;)</span>, contradicting 1.17(b). For minimality: any <span>&#92;(\gamma < \sup E&#92;)</span> satisfies <span>&#92;(\gamma \in \bigcup E&#92;)</span>, meaning <span>&#92;(\gamma \in \alpha&#92;)</span> for some <span>&#92;(\alpha \in E&#92;)</span>, so <span>&#92;(\gamma < \alpha&#92;)</span> and <span>&#92;(\gamma&#92;)</span> is not an upper bound for <span>&#92;(E&#92;)</span>.

For part (c): the naive approach — taking the least element of the complement <span>&#92;(\mathrm{Ord} \setminus E&#92;)</span> — fails because <span>&#92;(\mathrm{Ord}&#92;)</span> is a proper class and we cannot apply well-ordering to a class. The fix is to find a set-theoretic upper bound. One verifies that <span>&#92;(S(S(\sup E))&#92;)</span> is an ordinal that strictly contains <span>&#92;(E&#92;)</span> as a proper subset. (Taking just <span>&#92;(\sup E&#92;)</span> or <span>&#92;(S(\sup E)&#92;)</span> can fail: <span>&#92;(\sup E&#92;)</span> may already be in <span>&#92;(E&#92;)</span>, and <span>&#92;(S(\sup E)&#92;)</span> can coincide with <span>&#92;(E&#92;)</span> as a set.) Once we have an ordinal <span>&#92;(\alpha&#92;)</span> with <span>&#92;(E \subsetneq \alpha&#92;)</span>, the set <span>&#92;(\alpha \setminus E&#92;)</span> is a non-empty set of ordinals, hence has a least element, which is the least ordinal not in <span>&#92;(E&#92;)</span>.

**Terminology.** We call <span>&#92;(\alpha&#92;)</span> a **successor ordinal** if <span>&#92;(\alpha = S(\beta)&#92;)</span> for some ordinal <span>&#92;(\beta&#92;)</span>, and a **limit ordinal** otherwise. Under this definition, <span>&#92;(0 = \emptyset&#92;)</span> is a limit ordinal (it is not the successor of anything), as is <span>&#92;(\omega&#92;)</span> — proving that <span>&#92;(\omega&#92;)</span> is not a successor is a worthwhile exercise: if <span>&#92;(\omega = S(\beta)&#92;)</span> for some ordinal <span>&#92;(\beta&#92;)</span>, then <span>&#92;(\beta \in \omega&#92;)</span> so <span>&#92;(\beta&#92;)</span> is a finite natural number, and one checks that no natural number has <span>&#92;(\omega&#92;)</span> as its successor. With this trichotomy in hand — zero, successor ordinals, non-zero limit ordinals — the stage is set for transfinite induction.

---

## Lecture 7b: Transfinite Induction (continued)

The camera in the recording studio died mid-lecture, so this is the second part of Lecture 7. We are now ready to state and prove the central proof technique for the class of ordinals.

Transfinite induction is a *proof* technique: it tells us how to establish that some definite condition <span>&#92;(P&#92;)</span> holds for every ordinal. The key observation, which makes the whole method work, is that the ordinals are well-ordered, so if <span>&#92;(P&#92;)</span> ever fails there is a *least* counterexample, and the recursive hypothesis then derives a contradiction.

**Theorem 1.23 (Transfinite Induction).** *Suppose <span>&#92;(P(x)&#92;)</span> is a definite condition satisfying the following property <span>&#92;((\star)&#92;)</span>: for every ordinal <span>&#92;(\alpha&#92;)</span>, if <span>&#92;(P(\beta)&#92;)</span> holds for all <span>&#92;(\beta < \alpha&#92;)</span>, then <span>&#92;(P(\alpha)&#92;)</span> holds. Then <span>&#92;(P(\alpha)&#92;)</span> holds for all ordinals <span>&#92;(\alpha&#92;)</span>.*

*Proof.* Suppose not: suppose <span>&#92;(P(\alpha)&#92;)</span> fails for some ordinal <span>&#92;(\alpha&#92;)</span>. Let <span>&#92;(D = \{\beta \in S(\alpha) : \lnot P(\beta)\}&#92;)</span>, the set of counterexamples up to <span>&#92;(\alpha&#92;)</span>. Since <span>&#92;(\alpha \in D&#92;)</span>, the set <span>&#92;(D&#92;)</span> is non-empty. Note <span>&#92;(D&#92;)</span> is a set by bounded separation (being a subset of the ordinal <span>&#92;(S(\alpha)&#92;)</span> defined by a definite condition). As a non-empty set of ordinals, <span>&#92;(D&#92;)</span> has a least element; call it <span>&#92;(\alpha_0&#92;)</span>. Then <span>&#92;(P(\beta)&#92;)</span> holds for all <span>&#92;(\beta < \alpha_0&#92;)</span> (since <span>&#92;(\alpha_0&#92;)</span> is the least counterexample), so by <span>&#92;((\star)&#92;)</span>, <span>&#92;(P(\alpha_0)&#92;)</span> holds. Contradiction. <span>&#92;(\square&#92;)</span>

This proof is really a *least counterexample* argument: the well-ordering of the ordinals guarantees that any non-empty set of counterexamples has a least element, and the hypothesis <span>&#92;((\star)&#92;)</span> prevents such a least element from existing. Note also that the base case <span>&#92;(P(0)&#92;)</span> is *automatically* subsumed: since there are no ordinals less than <span>&#92;(0&#92;)</span>, the hypothesis of <span>&#92;((\star)&#92;)</span> holds vacuously for <span>&#92;(\alpha = 0&#92;)</span>, giving <span>&#92;(P(0)&#92;)</span> for free.

The theorem as stated is the "strong" form. In practice we often use a three-case decomposition that is more familiar from ordinary induction.

**Corollary 1.24 (Second Form — Three Cases).** *Suppose <span>&#92;(P(x)&#92;)</span> is a definite condition satisfying:*
1. *<span>&#92;(P(0)&#92;)</span> holds;*
2. *For all ordinals <span>&#92;(\beta&#92;)</span>: <span>&#92;(P(\beta) \Rightarrow P(S(\beta))&#92;)</span>;*
3. *For all limit ordinals <span>&#92;(\alpha > 0&#92;)</span>: if <span>&#92;(P(\beta)&#92;)</span> holds for all <span>&#92;(\beta < \alpha&#92;)</span>, then <span>&#92;(P(\alpha)&#92;)</span>.*

*Then <span>&#92;(P(\alpha)&#92;)</span> holds for all ordinals <span>&#92;(\alpha&#92;)</span>.*

This is a corollary of Theorem 1.23: given (1)–(3), one verifies that condition <span>&#92;((\star)&#92;)</span> holds for <span>&#92;(P&#92;)</span>, and the theorem applies. The three-case form is how transfinite induction looks in most applications: prove the property at <span>&#92;(0&#92;)</span>, show it propagates through successors, and show it propagates through limits.

Transfinite induction gives us the tool to *prove* things about ordinals. The dual tool, for *constructing* operations on ordinals, is transfinite recursion, which we take up next.

---

## Lecture 8: Transfinite Recursion

Today we prove the **Transfinite Recursion Theorem**, the companion to transfinite induction. Where induction lets us *prove* that all ordinals satisfy some property, recursion lets us *construct* a definite operation on <span>&#92;(\mathrm{Ord}&#92;)</span> satisfying a given recursive specification. This is significantly harder than induction; importantly, it is our first use of the Axiom of Replacement.

Let <span>&#92;(\mathcal{X}&#92;)</span> denote the class of all functions whose domain is an ordinal — that is, all sets of the form <span>&#92;(\gamma \subseteq \alpha \times Y&#92;)</span> that are graphs of functions, where <span>&#92;(\alpha&#92;)</span> is an ordinal and <span>&#92;(Y&#92;)</span> is any set. This is a definite class.

**Theorem 1.25 (Transfinite Recursion).** *Let <span>&#92;(G : \mathcal{X} \to \mathrm{Set}&#92;)</span> be a definite operation. Then there is a unique definite operation <span>&#92;(F : \mathrm{Ord} \to \mathrm{Set}&#92;)</span> satisfying*
<span>&#92;[ F(\alpha) = G(F \upharpoonright \alpha) \quad \text{for all } \alpha \in \mathrm{Ord}. &#92;]</span>

Here <span>&#92;(F \upharpoonright \alpha&#92;)</span> denotes the restriction of <span>&#92;(F&#92;)</span> to <span>&#92;(\alpha&#92;)</span>, which is a function with domain the ordinal <span>&#92;(\alpha&#92;)</span> and hence an element of <span>&#92;(\mathcal{X}&#92;)</span>. The rule says: the value of <span>&#92;(F&#92;)</span> at <span>&#92;(\alpha&#92;)</span> is determined by the values of <span>&#92;(F&#92;)</span> on all ordinals *less than* <span>&#92;(\alpha&#92;)</span>. This is the recursive character: each value is computed from previous values, with <span>&#92;(G&#92;)</span> encoding the rule.

**Proof sketch.** *Uniqueness* is proved by transfinite induction: if <span>&#92;(F&#92;)</span> and <span>&#92;(F'&#92;)</span> both satisfy the equation, then proving <span>&#92;(F(\alpha) = F'(\alpha)&#92;)</span> for all <span>&#92;(\alpha&#92;)</span> requires only showing that agreement on all <span>&#92;(\beta < \alpha&#92;)</span> implies <span>&#92;(F \upharpoonright \alpha = F' \upharpoonright \alpha&#92;)</span>, whence <span>&#92;(G(F \upharpoonright \alpha) = G(F' \upharpoonright \alpha)&#92;)</span> gives <span>&#92;(F(\alpha) = F'(\alpha)&#92;)</span>.

*Existence* is harder. Call a function <span>&#92;(t&#92;)</span> with domain <span>&#92;(\alpha&#92;)</span> an **<span>&#92;(\alpha&#92;)</span>-approximation** (defined by <span>&#92;(G&#92;)</span>) if <span>&#92;(t(\beta) = G(t \upharpoonright \beta)&#92;)</span> for all <span>&#92;(\beta < \alpha&#92;)</span>. Two key observations follow from uniqueness: (i) if an <span>&#92;(\alpha&#92;)</span>-approximation exists it is unique (call it <span>&#92;(t_\alpha&#92;)</span>), and (ii) if <span>&#92;(\alpha < \beta&#92;)</span> then <span>&#92;(t_\beta \supseteq t_\alpha&#92;)</span> (the approximation on the larger ordinal extends the one on the smaller). We then prove by transfinite induction that <span>&#92;(t_\alpha&#92;)</span> exists for every ordinal <span>&#92;(\alpha&#92;)</span>:

- *Base case <span>&#92;(\alpha = 0&#92;)</span>*: the empty function is the unique <span>&#92;(0&#92;)</span>-approximation; the defining condition is vacuous.
- *Successor step*: given <span>&#92;(t_\alpha&#92;)</span>, extend it to domain <span>&#92;(S(\alpha) = \alpha \cup \{\alpha\}&#92;)</span> by setting the value at <span>&#92;(\alpha&#92;)</span> itself to <span>&#92;(G(t_\alpha)&#92;)</span>. This produces <span>&#92;(t_{S(\alpha)}&#92;)</span>.
- *Limit step*: given <span>&#92;(t_\alpha&#92;)</span> for all <span>&#92;(\alpha < \beta&#92;)</span> where <span>&#92;(\beta&#92;)</span> is a limit ordinal, set <span>&#92;(t_\beta = \bigcup_{\alpha < \beta} t_\alpha&#92;)</span>. **This is where the Axiom of Replacement is used for the first time**: the collection <span>&#92;(\{t_\alpha : \alpha < \beta\}&#92;)</span> is the image of the definite operation <span>&#92;(\alpha \mapsto t_\alpha&#92;)</span> applied to the set <span>&#92;(\beta&#92;)</span>, so Replacement ensures it is a set, and we may take its union.

Finally, define <span>&#92;(F = \bigcup_{\alpha \in \mathrm{Ord}} t_\alpha&#92;)</span> (a union over a class, which is again a class). Since the <span>&#92;(t_\alpha&#92;)</span> form a chain of extensions, <span>&#92;(F&#92;)</span> is a well-defined definite operation on <span>&#92;(\mathrm{Ord}&#92;)</span>, and it satisfies the recursion equation. <span>&#92;(\square&#92;)</span>

In applications we almost always use the following more explicit form.

**Corollary 1.28 (Second Form of Transfinite Recursion).** *Given a set <span>&#92;(G_1&#92;)</span>, a definite operation <span>&#92;(G_2 : \mathrm{Set} \to \mathrm{Set}&#92;)</span>, and a definite operation <span>&#92;(G_3 : \mathcal{X} \to \mathrm{Set}&#92;)</span>, there is a unique definite operation <span>&#92;(F : \mathrm{Ord} \to \mathrm{Set}&#92;)</span> satisfying:*
1. *<span>&#92;(F(0) = G_1&#92;)</span>;*
2. *<span>&#92;(F(S(\alpha)) = G_2(F(\alpha))&#92;)</span> for all ordinals <span>&#92;(\alpha&#92;)</span>;*
3. *<span>&#92;(F(\alpha) = G_3(F \upharpoonright \alpha)&#92;)</span> for all limit ordinals <span>&#92;(\alpha > 0&#92;)</span>.*

*Proof.* Define a single <span>&#92;(G : \mathcal{X} \to \mathrm{Set}&#92;)</span> by cases: <span>&#92;(G(f) = G_1&#92;)</span> if <span>&#92;(\mathrm{dom}(f) = 0&#92;)</span>; <span>&#92;(G(f) = G_2(f(\alpha))&#92;)</span> if <span>&#92;(\mathrm{dom}(f) = S(\alpha)&#92;)</span>; and <span>&#92;(G(f) = G_3(f)&#92;)</span> if <span>&#92;(\mathrm{dom}(f)&#92;)</span> is a non-zero limit ordinal. Apply Theorem 1.25 to this <span>&#92;(G&#92;)</span>. One checks that the resulting <span>&#92;(F&#92;)</span> satisfies conditions (1)–(3), and uniqueness follows because any <span>&#92;(F'&#92;)</span> satisfying (1)–(3) satisfies the single recursion equation for <span>&#92;(G&#92;)</span>. <span>&#92;(\square&#92;)</span>

The second form is more concrete: to define a definite operation on ordinals, one simply specifies the value at <span>&#92;(0&#92;)</span> (a set), a rule for advancing from <span>&#92;(\alpha&#92;)</span> to <span>&#92;(S(\alpha)&#92;)</span> (a definite operation on sets), and a rule for assembling the value at a limit ordinal from all previous values (a definite operation on functions with ordinal domain). As we will see immediately, all three pieces of ordinal arithmetic are defined this way.

---

## Lecture 9: Ordinal Arithmetic

Last time we established transfinite recursion; today we put it to work. The goal is to extend the familiar arithmetic operations — addition, multiplication, exponentiation — from the natural numbers to all ordinals. The guiding principle in each case is the same: at successors we apply the natural "next step" rule, and at limit ordinals we take the supremum of all previously computed values.

### Ordinal Addition

Fix an ordinal <span>&#92;(\beta&#92;)</span>. We define the function <span>&#92;(\alpha \mapsto \beta + \alpha&#92;)</span> by Corollary 1.28 with <span>&#92;(G_1 = \beta&#92;)</span>, <span>&#92;(G_2 = S&#92;)</span> (the successor operation), and <span>&#92;(G_3(f) = \sup(\mathrm{im}(f))&#92;)</span>.

**Definition 1.30 (Ordinal Addition).** For ordinals <span>&#92;(\alpha, \beta&#92;)</span>:
<span>&#92;[ \beta + 0 = \beta, \qquad \beta + S(\alpha) = S(\beta + \alpha), \qquad \beta + \alpha = \sup\{\beta + \gamma : \gamma < \alpha\} \text{ (limit } \alpha > 0). &#92;]</span>

At limit ordinals the set <span>&#92;(\{\beta + \gamma : \gamma < \alpha\}&#92;)</span> is the image of the already-constructed function <span>&#92;(\gamma \mapsto \beta + \gamma&#92;)</span> (for <span>&#92;(\gamma < \alpha&#92;)</span>) under the Replacement axiom, so it is indeed a set. A first observation: <span>&#92;(\beta + 1 = \beta + S(0) = S(\beta + 0) = S(\beta)&#92;)</span>, so *adding 1 is the same as taking the successor*. This perfectly extends the familiar fact that the successor of a natural number <span>&#92;(n&#92;)</span> is <span>&#92;(n + 1&#92;)</span>.

A critical warning: ordinal addition is **not commutative**. Consider <span>&#92;(\omega + 1 = S(\omega)&#92;)</span>, the successor of <span>&#92;(\omega&#92;)</span>, versus
<span>&#92;[ 1 + \omega = \sup\{1 + n : n < \omega\} = \sup\{1, 2, 3, \ldots\} = \omega. &#92;]</span>
Since <span>&#92;(S(\omega) \neq \omega&#92;)</span>, we have <span>&#92;(1 + \omega = \omega \neq \omega + 1&#92;)</span>. This is not a mere technicality. Think of ordinals as order types of well-orderings: <span>&#92;(\beta + \alpha&#92;)</span> corresponds to *concatenating* the well-ordering of type <span>&#92;(\beta&#92;)</span> before the well-ordering of type <span>&#92;(\alpha&#92;)</span>. So <span>&#92;(\omega + 1&#92;)</span> is a copy of <span>&#92;(\omega&#92;)</span> followed by a single element on top — a well-ordering with a greatest element — while <span>&#92;(1 + \omega&#92;)</span> is a single element followed by a copy of <span>&#92;(\omega&#92;)</span>, which is just isomorphic to <span>&#92;(\omega&#92;)</span> itself. Placing a finite piece at the beginning of an infinite chain does not change the order type; placing it at the end does.

Using addition one builds the ordinal hierarchy by alternating successors and suprema: <span>&#92;(\omega, \omega+1, \omega+2, \ldots&#92;)</span> terminate at <span>&#92;(\omega + \omega = \omega \cdot 2&#92;)</span>, then <span>&#92;(\omega \cdot 2 + 1, \omega \cdot 2 + 2, \ldots&#92;)</span>, and so on.

### Ordinal Multiplication

Fix <span>&#92;(\beta&#92;)</span>. Set <span>&#92;(G_1 = 0&#92;)</span>, <span>&#92;(G_2(x) = x + \beta&#92;)</span>, and <span>&#92;(G_3 = \sup \circ\, \mathrm{im}&#92;)</span>.

**Definition 1.32 (Ordinal Multiplication).** For ordinals <span>&#92;(\alpha, \beta&#92;)</span>:
<span>&#92;[ \beta \cdot 0 = 0, \qquad \beta \cdot S(\alpha) = \beta \cdot \alpha + \beta, \qquad \beta \cdot \alpha = \sup\{\beta \cdot \gamma : \gamma < \alpha\} \text{ (limit } \alpha > 0). &#92;]</span>

One verifies: <span>&#92;(\beta \cdot 1 = \beta \cdot S(0) = \beta \cdot 0 + \beta = 0 + \beta = \beta&#92;)</span>, and <span>&#92;(\beta \cdot 2 = \beta + \beta&#92;)</span>. Multiplication is also non-commutative: <span>&#92;(\omega \cdot 2 = \omega + \omega&#92;)</span>, but <span>&#92;(2 \cdot \omega = \sup\{2 \cdot n : n < \omega\} = \sup\{0, 2, 4, \ldots\} = \omega&#92;)</span>. Informally, <span>&#92;(\beta \cdot \alpha&#92;)</span> corresponds to the well-ordering obtained by replacing each element of <span>&#92;(\alpha&#92;)</span> with a copy of <span>&#92;(\beta&#92;)</span>.

### Ordinal Exponentiation

**Definition 1.33 (Ordinal Exponentiation).** For ordinals <span>&#92;(\alpha, \beta&#92;)</span>:
<span>&#92;[ \beta^0 = 1, \qquad \beta^{S(\alpha)} = \beta^\alpha \cdot \beta, \qquad \beta^\alpha = \sup\{\beta^\gamma : \gamma < \alpha\} \text{ (limit } \alpha > 0). &#92;]</span>

These recursion schemes allow the hierarchy to be extended far beyond <span>&#92;(\omega \cdot 2&#92;)</span>: we reach <span>&#92;(\omega^2, \omega^3, \ldots, \omega^\omega, \omega^{\omega^\omega}, \ldots&#92;)</span>

### Properties of Ordinal Arithmetic

**Proposition 1.34.** *For all <span>&#92;(\alpha, \beta, \delta \in \mathrm{Ord}&#92;)</span>:*
- *(a) <span>&#92;(\alpha < \beta \iff \delta + \alpha < \delta + \beta&#92;)</span> (addition is strictly left-monotone and left-cancellable);*
- *(b) Addition is associative: <span>&#92;((\alpha + \beta) + \delta = \alpha + (\beta + \delta)&#92;)</span>;*
- *(c) For <span>&#92;(\delta \neq 0&#92;)</span>: <span>&#92;(\alpha < \beta \iff \delta \cdot \alpha < \delta \cdot \beta&#92;)</span> (multiplication by a non-zero ordinal on the left is strictly monotone and left-cancellable);*
- *(d) Multiplication is associative: <span>&#92;((\alpha \cdot \beta) \cdot \delta = \alpha \cdot (\beta \cdot \delta)&#92;)</span>.*

All four parts are proved by transfinite induction. Note that right-cancellation and right-monotonicity fail in general: <span>&#92;(1 + \omega = \omega = 0 + \omega&#92;)</span> but <span>&#92;(1 \neq 0&#92;)</span>. The ordinal hierarchy built by these operations is the subject of much of what follows.

---

## Lecture 10: Well-orderings and Ordinals

This is the beginning of the fourth week. Today we prove the central representation theorem: every strict well-ordering is isomorphic to a unique ordinal. This closes Part 1 of the chapter by connecting our set-theoretic development of ordinals to the more intuitive picture of ordinals as "order types of well-orderings."

The proof has two components: uniqueness (which follows from general rigidity properties of well-orderings) and existence (which uses transfinite recursion and Replacement).

### Rigidity of Well-orderings

We begin with two lemmas that will be used repeatedly. Recall that an **isomorphism of strict well-orderings** <span>&#92;((E, \prec)&#92;)</span> and <span>&#92;((E', \prec')&#92;)</span> is a bijection <span>&#92;(f : E \to E'&#92;)</span> such that <span>&#92;(a \prec b \iff f(a) \prec' f(b)&#92;)</span> for all <span>&#92;(a, b \in E&#92;)</span>. An **automorphism** is an isomorphism from a structure to itself.

**Lemma 1.5(a) (Rigidity).** *The only automorphism of a strict well-ordering <span>&#92;((E, \prec)&#92;)</span> is the identity.*

*Proof.* Let <span>&#92;(f : E \to E&#92;)</span> be an automorphism and suppose <span>&#92;(f \neq \mathrm{id}&#92;)</span>. Let <span>&#92;(D = \{x \in E : f(x) \neq x\}&#92;)</span>; by assumption <span>&#92;(D&#92;)</span> is non-empty, so it has a least element <span>&#92;(a \in D&#92;)</span>. Since <span>&#92;(a&#92;)</span> is least, all <span>&#92;(b \prec a&#92;)</span> satisfy <span>&#92;(f(b) = b&#92;)</span>. Now <span>&#92;(f(a) \neq a&#92;)</span>, so either <span>&#92;(f(a) \prec a&#92;)</span> or <span>&#92;(a \prec f(a)&#92;)</span>. In the first case, <span>&#92;(f(a) \notin D&#92;)</span> (since <span>&#92;(f(a) \prec a&#92;)</span> and <span>&#92;(a&#92;)</span> is least in <span>&#92;(D&#92;)</span>), so <span>&#92;(f(f(a)) = f(a)&#92;)</span>, but injectivity of <span>&#92;(f&#92;)</span> then gives <span>&#92;(f(a) = a&#92;)</span>, a contradiction. In the second case, apply <span>&#92;(f^{-1}&#92;)</span> (which preserves order) to get <span>&#92;(f^{-1}(a) \prec a&#92;)</span>, so <span>&#92;(f^{-1}(a) \notin D&#92;)</span> and <span>&#92;(f(f^{-1}(a)) = f^{-1}(a)&#92;)</span>, giving <span>&#92;(a = f^{-1}(a)&#92;)</span>, contradicting <span>&#92;(f^{-1}(a) \prec a&#92;)</span>. Both cases are impossible. <span>&#92;(\square&#92;)</span>

**Lemma 1.5(b).** *A strict well-ordering is never isomorphic to any of its proper initial segments.*

Here an **initial segment** (always proper in our usage) is a set of the form <span>&#92;(E_{\prec b} = \{e \in E : e \prec b\}&#92;)</span> for some <span>&#92;(b \in E&#92;)</span>. The proof is similar to Lemma 1.5(a): suppose <span>&#92;(f : E \to E_{\prec b}&#92;)</span> is an isomorphism and form <span>&#92;(D = \{x \in E : f(x) \neq x\}&#92;)</span>. Since <span>&#92;(f(b) \prec b&#92;)</span> and <span>&#92;(b \notin E_{\prec b}&#92;)</span>, we have <span>&#92;(b \in D&#92;)</span>, so <span>&#92;(D&#92;)</span> is non-empty. The rest of the argument mirrors the automorphism case; one must be careful to only apply <span>&#92;(f^{-1}&#92;)</span> to elements of <span>&#92;(E_{\prec b}&#92;)</span>, but those turn out to be exactly the relevant elements.

This rigidity is a feature of well-orderings that fails for denser orders: the intervals <span>&#92;((0,1)&#92;)</span> and <span>&#92;((0, \tfrac{1}{2})&#92;)</span> in <span>&#92;(\mathbb{R}&#92;)</span> are isomorphic as orderings (via <span>&#92;(x \mapsto x/2&#92;)</span>), but <span>&#92;(\mathbb{R}&#92;)</span> is not well-ordered. Well-orderings have no such flexibility.

### The Representation Theorem

**Theorem 1.37.** *Every strict well-ordering <span>&#92;((E, \prec)&#92;)</span> is isomorphic to a unique ordinal, and the isomorphism is unique.*

*Proof of uniqueness.* Suppose <span>&#92;(f : (E, \prec) \to (\alpha, \in)&#92;)</span> and <span>&#92;(g : (E, \prec) \to (\beta, \in)&#92;)</span> are isomorphisms. If <span>&#92;(\alpha \neq \beta&#92;)</span>, say <span>&#92;(\alpha \in \beta&#92;)</span> (so <span>&#92;(\alpha&#92;)</span> is an initial segment of <span>&#92;(\beta&#92;)</span> by the properties of ordinals), then <span>&#92;(g^{-1} \circ f : (\beta, \in) \to (\beta, \in)|_\alpha&#92;)</span> would be an isomorphism between <span>&#92;(\beta&#92;)</span> and one of its initial segments, contradicting Lemma 1.5(b). So <span>&#92;(\alpha = \beta&#92;)</span>. Uniqueness of the isomorphism then follows from rigidity (Lemma 1.5(a)): <span>&#92;(g^{-1} \circ f&#92;)</span> would be an automorphism of <span>&#92;((\alpha, \in)&#92;)</span>, hence the identity, giving <span>&#92;(f = g&#92;)</span>.

*Proof of existence.* We may assume <span>&#92;(E \neq \emptyset&#92;)</span>, since the empty well-ordering is isomorphic to <span>&#92;(0 = \emptyset&#92;)</span>. For each <span>&#92;(x \in E&#92;)</span> let <span>&#92;(E_{\prec x} = \{e \in E : e \prec x\}&#92;)</span> be the initial segment below <span>&#92;(x&#92;)</span>. Let
<span>&#92;[ A = \{x \in E : (E_{\prec x}, \prec) \cong \text{some ordinal}\}. &#92;]</span>
The condition is definite (it involves the existence of a bijection satisfying a set-theoretic condition), so <span>&#92;(A&#92;)</span> is a set by Bounded Separation. The least element of <span>&#92;(E&#92;)</span> lies in <span>&#92;(A&#92;)</span> (its initial segment is empty, isomorphic to <span>&#92;(0&#92;)</span>), so <span>&#92;(A \neq \emptyset&#92;)</span>.

By the uniqueness part already proved, for each <span>&#92;(x \in A&#92;)</span> there is a *unique* ordinal <span>&#92;(f(x)&#92;)</span> such that <span>&#92;((E_{\prec x}, \prec) \cong (f(x), \in)&#92;)</span>. This defines a definite operation <span>&#92;(f : A \to \mathrm{Ord}&#92;)</span>. By the Axiom of Replacement, the image <span>&#92;(\mathrm{im}(f)&#92;)</span> is a set of ordinals. Let <span>&#92;(\alpha&#92;)</span> be the least ordinal not in <span>&#92;(\mathrm{im}(f)&#92;)</span> (which exists by Lemma 1.19(c)). One then establishes the following in sequence: (i) <span>&#92;(A&#92;)</span> is downward closed (if <span>&#92;(x \in A&#92;)</span> and <span>&#92;(y \prec x&#92;)</span> then <span>&#92;(y \in A&#92;)</span>); (ii) <span>&#92;(f&#92;)</span> is order-preserving on <span>&#92;(A&#92;)</span>; (iii) <span>&#92;(\mathrm{im}(f) = \alpha&#92;)</span> as a set; (iv) <span>&#92;(f&#92;)</span> is injective; (v) <span>&#92;(A = E&#92;)</span>. Steps (i)–(v) together show that <span>&#92;(f : (E, \prec) \to (\alpha, \in)&#92;)</span> is the desired isomorphism. <span>&#92;(\square&#92;)</span>

The key role of Replacement is visible in step (iii): the set <span>&#92;(\mathrm{im}(f)&#92;)</span> would not be known to exist without it.

**Definition.** The unique ordinal isomorphic to a strict well-ordering <span>&#92;((E, \prec)&#92;)</span> is called the **order type** of <span>&#92;((E, \prec)&#92;)</span>.

This theorem brings Part 1 of the chapter to a close. We defined ordinals as a special class of well-orderings — those in which the ordering is membership itself. The Representation Theorem says this was no restriction at all: every well-ordering is uniquely and canonically isomorphic to an ordinal. When we study ordinals, we are really studying all well-orderings up to isomorphism, with the crucial advantage that ordinals carry a canonical, set-theoretically intrinsic structure. This perspective will be essential in the next part of the course when we turn to cardinals and cardinality.

---
# Part II: Cardinals and the Axiom of Choice

## Lecture 11: Equinumerosity

### From Listing to Measuring

We spent the whole of Chapter 1 building the ordinals, culminating in the theorem that every strict well-ordering is isomorphic — as an ordering — to a unique ordinal, via a unique isomorphism. The professor opened Lecture 11 by reflecting on what this accomplishment actually means:

> "We wanted the ordinals to be an infinite analogue of the natural numbers. And what do the natural numbers do? They enumerate finite sets — every finite set, once ordered, is canonically isomorphic to some natural number. But now that is true for any well-ordering, not just finite ones. Given any infinite set, if you well-order it, then that listing is canonically isomorphic to some ordinal. The ordinal captures the enumeration of any set."

But right from the start of the course there were *two* things we wanted to do: enumerate sets, and measure their size. For finite sets these amount to the same thing. For infinite sets, they do not — and Chapter 2 is where we confront this difference head-on.

The starting point is the right definition of "same size."

**Definition 2.1.** Two sets <span>&#92;(A&#92;)</span> and <span>&#92;(B&#92;)</span> are **equinumerous** (written <span>&#92;(A \sim B&#92;)</span>) if there exists a **bijection** <span>&#92;(f : A \to B&#92;)</span>. A set is **finite** if it is equinumerous to some <span>&#92;(n \in \omega&#92;)</span>. A set is **countable** if it is finite or equinumerous to <span>&#92;(\omega&#92;)</span>. A set is **infinite** if it is not finite; **uncountable** if it is not countable.

Equinumerosity asks for the existence of a bijection — any bijection at all. There is no order to preserve. As the professor emphasised: when we later check whether ordinals are equinumerous, there are orderings lying around, but we deliberately ignore them.

### The Schröder-Bernstein Theorem

In practice, finding an explicit bijection between two sets is often hard. The following theorem says it is enough to find injections in both directions — even if they have nothing to do with each other.

**Proposition 2.2 (Schröder-Bernstein).** <span>&#92;(A&#92;)</span> and <span>&#92;(B&#92;)</span> are equinumerous if and only if there exist injections <span>&#92;(A \to B&#92;)</span> and <span>&#92;(B \to A&#92;)</span>.

The professor called this "a kind of combinatorial proof — writing it out properly is a bit painful, but the intuition is not very hard. It is a simple trick." Here is the idea he presented.

*Proof sketch.* Given injections <span>&#92;(i : A \to B&#92;)</span> and <span>&#92;(j : B \to A&#92;)</span>, set <span>&#92;(f = j \circ i : A \to A&#92;)</span>. It suffices to prove the following claim: if <span>&#92;(f : X \to X&#92;)</span> is injective and <span>&#92;(f(X) \subseteq Y \subseteq X&#92;)</span>, then <span>&#92;(X \sim Y&#92;)</span>. One then applies this with <span>&#92;(X = A&#92;)</span> and <span>&#92;(Y = j(B)&#92;)</span>.

To prove the claim, build the chain
<span>&#92;[X \supseteq Y \supseteq f(X) \supseteq f(Y) \supseteq f^2(X) \supseteq f^2(Y) \supseteq \cdots&#92;]</span>
Let <span>&#92;(Z = \bigcup_{n \geq 0}(f^n(X) \setminus f^n(Y))&#92;)</span> and <span>&#92;(W = X \setminus Z&#92;)</span>. Then <span>&#92;(X = Z \sqcup W&#92;)</span> (disjoint). Moreover <span>&#92;(Y = f(Z) \sqcup W&#92;)</span>: the action of <span>&#92;(f&#92;)</span> on <span>&#92;(Z&#92;)</span> simply shifts each "gap" <span>&#92;(f^n(X) \setminus f^n(Y)&#92;)</span> one step to the right, to <span>&#92;(f^{n+1}(X) \setminus f^{n+1}(Y)&#92;)</span>, so you lose the first gap but add nothing new to <span>&#92;(W&#92;)</span>. Define <span>&#92;(g : X \to Y&#92;)</span> by <span>&#92;(g(x) = f(x)&#92;)</span> for <span>&#92;(x \in Z&#92;)</span> and <span>&#92;(g(x) = x&#92;)</span> for <span>&#92;(x \in W&#92;)</span>. This is a bijection: <span>&#92;(f&#92;)</span> is a bijection from <span>&#92;(Z&#92;)</span> onto <span>&#92;(f(Z)&#92;)</span>, and the identity is a bijection from <span>&#92;(W&#92;)</span> to itself, and since the decompositions are disjoint the union is a bijection from <span>&#92;(X&#92;)</span> to <span>&#92;(f(Z) \cup W = Y&#92;)</span>. <span>&#92;(\square&#92;)</span>

As the professor put it: "Basically, by applying <span>&#92;(f&#92;)</span> on <span>&#92;(Z&#92;)</span> and on <span>&#92;(W&#92;)</span> doing nothing — that is my bijection. To find a bijection, it suffices to find injections in each direction. It is often much easier."

### Ordinals Do Not Measure Size

The following lemma is both simple and catastrophic for the idea that ordinals might serve as size measurements.

**Lemma 2.4.** *For every infinite ordinal <span>&#92;(\alpha&#92;)</span>, <span>&#92;(\alpha&#92;)</span> and <span>&#92;(\alpha + 1&#92;)</span> are equinumerous.*

*Proof.* Since <span>&#92;(\alpha&#92;)</span> is infinite, <span>&#92;(\omega \leq \alpha&#92;)</span> as ordinals, so <span>&#92;(\omega \subseteq \alpha&#92;)</span>. Define <span>&#92;(f : \alpha + 1 \to \alpha&#92;)</span> by:
<span>&#92;[f(x) = \begin{cases} x + 1 & \text{if } x \in \omega, \\ 0 & \text{if } x = \alpha, \\ x & \text{otherwise.}\end{cases}&#92;]</span>
Because <span>&#92;(\alpha&#92;)</span> is infinite (in particular, <span>&#92;(\alpha \notin \omega&#92;)</span>), these three cases cover disjoint parts of <span>&#92;(\alpha + 1&#92;)</span>, and the definition is well-posed. On <span>&#92;(\omega&#92;)</span>, <span>&#92;(f&#92;)</span> shifts by one, freeing up the element <span>&#92;(0&#92;)</span>; the new top element <span>&#92;(\alpha&#92;)</span> is sent to <span>&#92;(0&#92;)</span>; everything else is fixed. This is a bijection from <span>&#92;(\alpha + 1&#92;)</span> onto <span>&#92;(\alpha&#92;)</span>. <span>&#92;(\square&#92;)</span>

The professor drew the lesson starkly: "Ordinals are not good at measuring size. Alpha and alpha-plus-one are definitely distinct ordinals — this is strictly bigger than this — but they have the same size. We need to do something else." Note that the bijection cannot be order-preserving, since every initial segment of a well-ordering is strictly shorter. We had to deliberately violate the ordering to produce the bijection.

This pathology is not confined to successor ordinals. For example, <span>&#92;(\omega \cdot 2&#92;)</span> (two copies of <span>&#92;(\omega&#92;)</span> end-to-end) is a limit ordinal, yet it is equinumerous with <span>&#92;(\omega&#92;)</span> via the even-odd interleaving bijection: <span>&#92;(\omega \cdot 2&#92;)</span> is countable. So even many limit ordinals fail to be "new" sizes.

### Cardinals

The solution is to single out exactly those ordinals that genuinely represent new sizes.

**Definition 2.5.** An ordinal <span>&#92;(\alpha&#92;)</span> is a **cardinal** if it is not equinumerous to any <span>&#92;(\beta < \alpha&#92;)</span>. We write <span>&#92;(\mathrm{Card}&#92;)</span> for the class of all cardinals.

Cardinals are a subclass of ordinals with a special property. By Lemma 2.4, no infinite successor ordinal is a cardinal — so:

> "Every infinite cardinal is a limit ordinal."

But the converse fails: not every limit ordinal is a cardinal. The professor gave <span>&#92;(\omega \cdot 2&#92;)</span> as an explicit counterexample. The cardinals we know so far are: each natural number <span>&#92;(n \in \omega&#92;)</span> (requiring proof by induction that finite bijections cannot collapse size), and <span>&#92;(\omega&#92;)</span> itself. Every other ordinal we have constructed — <span>&#92;(\omega + 1, \omega + 2, \omega \cdot 2, \omega^2, \omega^\omega&#92;)</span> — is equinumerous with <span>&#92;(\omega&#92;)</span>, hence not a new cardinal.

### The <span>&#92;(h&#92;)</span> Operator: Producing New Cardinals

To prove that uncountable cardinals exist, we need a systematic construction.

**Proposition 2.6.** *For every set <span>&#92;(E&#92;)</span>, there exists a unique cardinal <span>&#92;(h(E)&#92;)</span>, namely the least ordinal not equinumerous with any subset of <span>&#92;(E&#92;)</span>.*

The proof is a careful application of Bounded Separation and Replacement. Consider the set
<span>&#92;[W = \{(A, {\prec}) : A \subseteq E \text{ and } {\prec} \text{ is a strict well-ordering of } A\}.&#92;]</span>
This is a set (not merely a class) because: any such pair has first coordinate in <span>&#92;(\mathcal{P}(E)&#92;)</span> and second coordinate in <span>&#92;(\mathcal{P}(E \times E)&#92;)</span>, giving a bound for Separation. By the main theorem of Chapter 1, each element of <span>&#92;(W&#92;)</span> is canonically isomorphic to a unique ordinal; let <span>&#92;(F : W \to \mathrm{Ord}&#92;)</span> send each well-ordering to its ordinal type. By Replacement, the image <span>&#92;(X = F(W)&#92;)</span> is a set. One verifies that <span>&#92;(X&#92;)</span> is exactly the class of ordinals equinumerous with some subset of <span>&#92;(E&#92;)</span>: on one hand, every element of <span>&#92;(F(W)&#92;)</span> is in bijection with some subset of <span>&#92;(E&#92;)</span>; on the other, if <span>&#92;(\alpha \sim A \subseteq E&#92;)</span>, one can transport the membership ordering on <span>&#92;(\alpha&#92;)</span> to make <span>&#92;(A&#92;)</span> a well-ordered subset of <span>&#92;(E&#92;)</span>, landing in <span>&#92;(W&#92;)</span>.

Since <span>&#92;(X&#92;)</span> is a set of ordinals, it has a least ordinal not in it; call it <span>&#92;(h(E)&#92;)</span>. That <span>&#92;(h(E)&#92;)</span> is a cardinal follows from minimality: if some <span>&#92;(\alpha < h(E)&#92;)</span> were equinumerous to <span>&#92;(h(E)&#92;)</span>, composing bijections would place <span>&#92;(h(E)&#92;)</span> in <span>&#92;(X&#92;)</span), a contradiction.

In particular, <span>&#92;(h(\omega)&#92;)</span> is an uncountable cardinal — the first one. But we need more to make cardinals a complete measure of arbitrary sets.

---

## Lecture 12: Axiom of Choice

### Why We Need a New Axiom

Reviewing where we stood at the start of Lecture 12: we have ordinals for enumeration, and cardinals as the right notion of size. But there is a gap. For cardinals to serve their purpose — measuring the size of *every* set — every set must be equinumerous to some cardinal. The professor traced the logical chain:

> "If every set were equinumerous with a cardinal, then in particular every set would be equinumerous with an ordinal. I can use that bijection to transport the membership ordering on the ordinal back to the set, making the set well-orderable. So the assumption that every set has a cardinal size implies the Well-ordering Principle: every set admits a well-ordering."

The Well-ordering Principle is not provable in ZF alone. Hence we need a new axiom.

### Choice Functions and the Axiom of Choice

**Definition 2.7.** A **choice function** on a family of sets <span>&#92;(\mathcal{F}&#92;)</span> is a function <span>&#92;(c : \mathcal{F} \to \bigcup \mathcal{F}&#92;)</span> such that <span>&#92;(c(F) \in F&#92;)</span> for every <span>&#92;(F \in \mathcal{F}&#92;)</span>. (One cannot have a choice function if <span>&#92;(\emptyset \in \mathcal{F}&#92;)</span>, since there is no element to choose from the empty set.)

**Axiom 9 (Axiom of Choice, AC).** For any set <span>&#92;(\mathcal{F}&#92;)</span> with <span>&#92;(\emptyset \notin \mathcal{F}&#92;)</span>, there exists a choice function on <span>&#92;(\mathcal{F}&#92;)</span>.

The professor placed this in context as a set-existence axiom of the usual kind: the choice function is a set (its graph) defined by a definite condition, and it fits the same mold as the other eight axioms.

He was emphatic about a common misconception:

> "A lot of people — not just students but working mathematicians — think that whenever you take an element from a set, you are using the axiom of choice. That is not true. The axiom of choice is a specific statement: it asserts the existence of a choice function. But a choice function may already exist for other reasons, and then you do not need AC. If you can *construct* the choice function, you are probably not using AC. You use AC precisely when you cannot construct it — when you just know it must exist."

Two key examples where AC is not needed: (i) when <span>&#92;(\mathcal{F}&#92;)</span> is a finite collection (one builds the choice function by iterating the axiom of the non-empty set finitely many times); (ii) when the sets in <span>&#92;(\mathcal{F}&#92;)</span> carry a well-ordering (one takes the least element of each). It is for an *arbitrary* infinite collection of sets, with no additional structure, that AC becomes genuinely necessary.

### The Three-Way Equivalence

The payoff of introducing AC is a fundamental theorem:

**Theorem 2.8.** *In ZF, the following are equivalent:*
1. *The Axiom of Choice (AC).*
2. *The Well-ordering Principle: every set admits a well-ordering.*
3. *Zorn's Lemma: if <span>&#92;((E, \prec)&#92;)</span> is a nonempty poset in which every chain (totally ordered subset) has an upper bound in <span>&#92;(E&#92;)</span>, then <span>&#92;(E&#92;)</span> has a maximal element.*

The full proof is given in the notes. The professor worked through the main direction in lecture and gave sketches of the others.

*Proof that AC implies Well-ordering.* Let <span>&#92;(A&#92;)</span> be any set. By AC, there is a choice function <span>&#92;(c&#92;)</span> on the collection of all nonempty subsets of <span>&#92;(A&#92;)</span>. (This is a genuine use of AC: we know nothing about <span>&#92;(A&#92;)</span>, so we cannot construct <span>&#92;(c&#92;)</span> from other information.) Fix an ordinal <span>&#92;(\zeta \notin A&#92;)</span>. By transfinite recursion, define <span>&#92;(F : \mathrm{Ord} \to A \cup \{\zeta\}&#92;)</span>:
<span>&#92;[F(\alpha) = \begin{cases} c(A \setminus \mathrm{Im}(F \upharpoonright \alpha)) & \text{if } A \setminus \mathrm{Im}(F \upharpoonright \alpha) \neq \emptyset, \\ \zeta & \text{otherwise.}\end{cases}&#92;]</span>
Intuitively: at each stage, if there are still elements of <span>&#92;(A&#92;)</span> not yet enumerated, choose one; otherwise output the dummy value <span>&#92;(\zeta&#92;)</span> to signal that the process has halted. The function <span>&#92;(F&#92;)</span> must eventually take the value <span>&#92;(\zeta&#92;)</span>: if it never did, then <span>&#92;(F&#92;)</span> restricted to <span>&#92;(h(A)&#92;)</span> would be injective (each <span>&#92;(F(\alpha)&#92;)</span> is chosen outside the image of all previous values) with image in <span>&#92;(A&#92;)</span>, contradicting the definition of <span>&#92;(h(A)&#92;)</span> as the least ordinal not embeddable into any subset of <span>&#92;(A&#92;)</span>. Let <span>&#92;(\alpha_0&#92;)</span> be the least ordinal with <span>&#92;(F(\alpha_0) = \zeta&#92;)</span>. Then <span>&#92;(F \upharpoonright \alpha_0 : \alpha_0 \xrightarrow{\,\sim\,} A&#92;)</span> is a bijection, and transporting the membership ordering on <span>&#92;(\alpha_0&#92;)</span> back to <span>&#92;(A&#92;)</span> gives a well-ordering of <span>&#92;(A&#92;)</span>. <span>&#92;(\square&#92;)</span>

*Sketch that Well-ordering implies Zorn's Lemma.* Suppose <span>&#92;((E, \prec)&#92;)</span> satisfies the chain-upper-bound condition (call it <span>&#92;(\star&#92;)</span>) but has no maximal element. Well-order <span>&#92;(E&#92;)</span> (using the Well-ordering Principle), thereby obtaining a choice function on all nonempty subsets of <span>&#92;(E&#92;)</span> by taking least elements. By transfinite recursion, build <span>&#92;(F : h(E) \to E&#92;)</span> as a strictly <span>&#92;(\prec&#92;)</span>-increasing function: at successor stages, use the fact that the current element is not maximal to pick something strictly bigger; at limit stages, use <span>&#92;(\star&#92;)</span> to pick an upper bound for the chain built so far. This embeds <span>&#92;(h(E)&#92;)</span> injectively into <span>&#92;(E&#92;)</span>, contradicting the definition of <span>&#92;(h(E)&#92;)</span>.

*Sketch that Zorn's Lemma implies AC.* Given a family <span>&#92;(\mathcal{F}&#92;)</span> of nonempty sets, let <span>&#92;(\Lambda&#92;)</span> be the poset of all *partial* choice functions on <span>&#92;(\mathcal{F}&#92;)</span> (choice functions defined on some sub-family <span>&#92;(\mathcal{G} \subseteq \mathcal{F}&#92;)</span>), ordered by inclusion (i.e., extension of functions). The empty function is a partial choice function, so <span>&#92;(\Lambda \neq \emptyset&#92;)</span>. Every chain of partial choice functions has an upper bound in <span>&#92;(\Lambda&#92;)</span> (namely its union), so by Zorn's Lemma <span>&#92;(\Lambda&#92;)</span> has a maximal element. A maximal partial choice function must have domain all of <span>&#92;(\mathcal{F}&#92;)</span>: if it omitted some <span>&#92;(F \in \mathcal{F}&#92;)</span>, one could extend it by choosing any element of <span>&#92;(F&#92;)</span> (this requires only one choice from one non-empty set — no AC needed), contradicting maximality. <span>&#92;(\square&#92;)</span>

---

## Lectures 13a & 13b: Cardinality

### Cardinals as a Complete Measure of Size

With AC in hand, the programme of measuring size can be carried out. The professor set the scene at the start of Lecture 13:

> "We proved that AC implies the Well-ordering Principle. In the notes you will also see that the Well-ordering Principle implies Zorn's Lemma, and Zorn's Lemma implies AC. So all three are equivalent. Now let us spell out what choice gives us about cardinals."

From this point forward we work in **ZFC** — Zermelo-Fraenkel set theory with the Axiom of Choice — without explicitly invoking AC at each step.

**Proposition 2.10 (Working with AC).** *Assume ZFC.*
- *(a) Every set is equinumerous with a unique cardinal. We write <span>&#92;(|A|&#92;)</span> for the unique cardinal equinumerous to <span>&#92;(A&#92;)</span>, called the* **cardinality** *of <span>&#92;(A&#92;)</span>.*
- *(b) <span>&#92;(|A| \leq |B|&#92;)</span> if and only if there is an injection <span>&#92;(A \hookrightarrow B&#92;)</span>.*
- *(c) For any sets <span>&#92;(A, B&#92;)</span>, either there is an injection <span>&#92;(A \hookrightarrow B&#92;)</span> or an injection <span>&#92;(B \hookrightarrow A&#92;)</span> (or both).*
- *(d) If <span>&#92;(f&#92;)</span> is a function with domain <span>&#92;(A&#92;)</span>, then <span>&#92;(|\mathrm{Im}(f)| \leq |A|&#92;)</span>.*
- *(e) A countable union of countable sets is countable.*

*Proof of (a).* By the Well-ordering Principle, <span>&#92;(A&#92;)</span> admits a well-ordering, and by Theorem 1.37 that well-ordering is isomorphic to some ordinal <span>&#92;(\alpha&#92;)</span>, giving a bijection <span>&#92;(A \sim \alpha&#92;)</span>. The set <span>&#92;(S = \{\beta \leq \alpha : A \sim \beta\}&#92;)</span> is nonempty (it contains <span>&#92;(\alpha&#92;)</span>), so it has a least element <span>&#92;(\alpha_0&#92;)</span>. This <span>&#92;(\alpha_0&#92;)</span> is a cardinal: if some <span>&#92;(\beta < \alpha_0&#92;)</span> were equinumerous to <span>&#92;(\alpha_0&#92;)</span>, then by transitivity of equinumerosity <span>&#92;(\beta \sim A&#92;)</span>, placing <span>&#92;(\beta&#92;)</span> in <span>&#92;(S&#92;)</span> and contradicting the minimality of <span>&#92;(\alpha_0&#92;)</span>. Uniqueness: two distinct cardinals cannot be equinumerous, since by definition a cardinal is not equinumerous to any smaller ordinal, and one of them would have to be smaller.

*Proof of (b).* If <span>&#92;(|A| = \kappa \leq \lambda = |B|&#92;)</span>, the inclusion <span>&#92;(\kappa \subseteq \lambda&#92;)</span> composed with the bijection <span>&#92;(\lambda \to B&#92;)</span> and the inverse bijection <span>&#92;(A \to \kappa&#92;)</span> gives an injection <span>&#92;(A \hookrightarrow B&#92;)</span>. Conversely, suppose <span>&#92;(f : A \hookrightarrow B&#92;)</span>. Then the composition <span>&#92;(\kappa \xrightarrow{\sim} A \xrightarrow{f} B \xrightarrow{\sim} \lambda&#92;)</span> is an injection from <span>&#92;(\kappa&#92;)</span> into <span>&#92;(\lambda&#92;)</span>. If <span>&#92;(\lambda < \kappa&#92;)</span> then the inclusion <span>&#92;(\lambda \hookrightarrow \kappa&#92;)</span> together with this injection would, by Schröder-Bernstein, give <span>&#92;(\kappa \sim \lambda&#92;)</span> — impossible since both are cardinals and distinct cardinals are never equinumerous. Hence <span>&#92;(\kappa \leq \lambda&#92;)</span>.

*Proof of (d).* The operation assigning to each <span>&#92;(b \in \mathrm{Im}(f)&#92;)</span> its fiber <span>&#92;(f^{-1}(b) = \{a \in A : f(a) = b\}&#92;)</span> is a definite operation producing a family of nonempty subsets of <span>&#92;(A&#92;)</span>. By AC, there is a choice function selecting one element from each fiber. This gives an injection <span>&#92;(\mathrm{Im}(f) \hookrightarrow A&#92;)</span> (distinct elements of <span>&#92;(\mathrm{Im}(f)&#92;)</span> have disjoint fibers, so their chosen preimages are distinct). Hence <span>&#92;(|\mathrm{Im}(f)| \leq |A|&#92;)</span> by (b). (The function that constructs a section of <span>&#92;(f&#92;)</span> is, in fact, equivalent to AC.)

**Remark 2.11.** The cardinality function behaves exactly as intuition demands: <span>&#92;(|A| = |B|&#92;)</span> if and only if <span>&#92;(A \sim B&#92;)</span>; <span>&#92;(|A| \leq |B|&#92;)</span> if and only if <span>&#92;(A&#92;)</span> embeds into <span>&#92;(B&#92;)</span>. A set is finite iff <span>&#92;(|A| < \omega&#92;)</span>, and countable iff <span>&#92;(|A| \leq \omega&#92;)</span>. Note also that part (c) is comparability of cardinals: under AC, any two sets are comparable in size, which is itself equivalent to AC.

---

# Part III: Cardinal Arithmetic

## Lectures 14a & 14b: Enumerating Cardinals

### The Cardinal Successor and the Aleph Hierarchy

The professor opened Lecture 14 by observing that the <span>&#92;(h&#92;)</span>-operator, which we used to produce <span>&#92;(h(\omega)&#92;)</span> as the first uncountable cardinal, has a cleaner interpretation when applied to a cardinal.

**Notation 3.1.** For any cardinal <span>&#92;(\kappa&#92;)</span>, write <span>&#92;(\kappa^+&#92;)</span> for <span>&#92;(h(\kappa)&#92;)</span>.

The claim is that <span>&#92;(\kappa^+&#92;)</span> is the *least* cardinal strictly greater than <span>&#92;(\kappa&#92;)</span>. To see why: if <span>&#92;(\lambda > \kappa&#92;)</span> is any cardinal, then since <span>&#92;(\lambda&#92;)</span> is a cardinal its cardinality is itself, and since <span>&#92;(\kappa&#92;)</span> is a cardinal its cardinality is itself; so <span>&#92;(|\lambda| = \lambda > \kappa = |\kappa|&#92;)</span>, meaning by Proposition 2.10(b) there is no injection <span>&#92;(\lambda \hookrightarrow \kappa&#92;)</span), i.e., <span>&#92;(\lambda&#92;)</span> is not equinumerous with any subset of <span>&#92;(\kappa&#92;)</span>. So every cardinal greater than <span>&#92;(\kappa&#92;)</span> satisfies the defining property of <span>&#92;(h(\kappa)&#92;)</span>, and <span>&#92;(\kappa^+&#92;)</span> is the smallest such. The professor underlined a terminological warning:

> "Do not mix up the two successor operations: <span>&#92;(\kappa + 1&#92;)</span> is the ordinal successor — the least ordinal bigger than <span>&#92;(\kappa&#92;)</span> — while <span>&#92;(\kappa^+&#92;)</span> is the cardinal successor — the least cardinal bigger than <span>&#92;(\kappa&#92;)</span>. For natural numbers the two coincide, but for infinite cardinals <span>&#92;(\kappa + 1&#92;)</span> is not even a cardinal: it is equinumerous with <span>&#92;(\kappa&#92;)</span> by Lemma 2.4."

The cardinal successor operation allows us to enumerate all infinite cardinals systematically.

**Definition 3.2.** The **aleph hierarchy** is defined by transfinite recursion:
<span>&#92;[&#92;aleph_0 = \omega, \quad \aleph_{\alpha+1} = \aleph_\alpha^+, \quad \aleph_\alpha = \sup\{\aleph_\beta : \beta < \alpha\} \text{ (for limit } \alpha).&#92;]</span>

At successor stages, we take the next cardinal. At limit stages, we take the supremum — recalling that the supremum of a set of ordinals is itself an ordinal. The definition is an instance of transfinite recursion and is a definite operation from <span>&#92;(\mathrm{Ord}&#92;)</span> to <span>&#92;(\mathrm{Card}&#92;)</span>.

**Lemma 3.3.** *Each <span>&#92;(\aleph_\alpha&#92;)</span> is an infinite cardinal.*

*Proof.* That each <span>&#92;(\aleph_\alpha&#92;)</span> is infinite is clear: the hierarchy starts at <span>&#92;(\omega&#92;)</span> and only increases. For cardinalhood, the base case <span>&#92;(\aleph_0 = \omega&#92;)</span> and successor case <span>&#92;(\aleph_{\alpha+1} = \aleph_\alpha^+&#92;)</span> are immediate (by definition, <span>&#92;(\kappa^+&#92;)</span> is a cardinal). For a limit ordinal <span>&#92;(\beta&#92;)</span>, let <span>&#92;(\alpha < \aleph_\beta&#92;)</span>. Since <span>&#92;(\aleph_\beta = \bigcup_{\gamma < \beta} \aleph_\gamma&#92;)</span>, we have <span>&#92;(\alpha \in \aleph_\gamma&#92;)</span> for some <span>&#92;(\gamma < \beta&#92;)</span>. By the induction hypothesis, <span>&#92;(\aleph_\gamma&#92;)</span> is a cardinal, so <span>&#92;(|\alpha| < \aleph_\gamma \leq \aleph_\beta&#92;)</span>. Hence <span>&#92;(\alpha \not\sim \aleph_\beta&#92;)</span> (they have different cardinalities). Since <span>&#92;(\alpha&#92;)</span> was arbitrary, <span>&#92;(\aleph_\beta&#92;)</span> is a cardinal. <span>&#92;(\square&#92;)</span>

**Lemma 3.4.** *For all ordinals <span>&#92;(\alpha < \beta&#92;)</span>, we have <span>&#92;(\aleph_\alpha < \aleph_\beta&#92;)</span>.*

This is proved by transfinite induction on <span>&#92;(\beta&#92;)</span>. The successor step is immediate (each <span>&#92;(\aleph_{\beta+1} = \aleph_\beta^+&#92;)</span> is strictly larger). The limit step requires checking that <span>&#92;(\aleph_\beta = \sup_{\gamma < \beta} \aleph_\gamma&#92;)</span> is strictly above each <span>&#92;(\aleph_\alpha&#92;)</span> with <span>&#92;(\alpha < \beta&#92;)</span); this uses the induction hypothesis and the fact that a cardinal <span>&#92;(\aleph_\alpha&#92;)</span> cannot equal its own supremum at a limit. (Exercise; details in the notes.)

**Lemma 3.5.** *For all ordinals <span>&#92;(\alpha&#92;)</span>, we have <span>&#92;(\alpha \leq \aleph_\alpha&#92;)</span>.*

Again by induction: <span>&#92;(0 \leq \aleph_0 = \omega&#92;)</span>; if <span>&#92;(\alpha \leq \aleph_\alpha&#92;)</span> then <span>&#92;(\alpha + 1 \leq \aleph_\alpha + 1 \leq \aleph_\alpha^+ = \aleph_{\alpha+1}&#92;)</span> (strict inequality at successor stages); and at limits the sup of the left side is at most the sup of the right side.

The professor made the subtle remark that this inequality can occasionally become an *equality*, and only at certain limit ordinals. The example he gave: define a sequence by <span>&#92;(\alpha_0 = 0&#92;)</span> and <span>&#92;(\alpha_{n+1} = \aleph_{\alpha_n}&#92;)</span>. Let <span>&#92;(\alpha = \sup_n \alpha_n&#92;)</span>. Then <span>&#92;(\aleph_\alpha = \alpha&#92;)</span>: the indices are growing exactly as fast as the cardinals they index, and at the limit they coincide. This phenomenon is connected to cofinality and regularity, discussed below.

### Every Infinite Cardinal Is an Aleph

**Proposition 3.7.** *Every infinite cardinal is of the form <span>&#92;(\aleph_\alpha&#92;)</span> for some ordinal <span>&#92;(\alpha&#92;)</span>.*

*Proof.* By Lemma 3.5, any infinite cardinal <span>&#92;(\kappa&#92;)</span> satisfies <span>&#92;(\kappa \leq \aleph_\kappa < \aleph_{\kappa+1}&#92;)</span>. So it suffices to prove: for every ordinal <span>&#92;(\beta&#92;)</span>, every infinite cardinal <span>&#92;(\kappa < \aleph_\beta&#92;)</span> is some <span>&#92;(\aleph_\alpha&#92;)</span>. Prove this by induction on <span>&#92;(\beta&#92;)</span>:
- *Base case <span>&#92;(\beta = 0&#92;)</span>:* There are no infinite cardinals below <span>&#92;(\aleph_0 = \omega&#92;)</span>, so the statement is vacuous.
- *Successor <span>&#92;(\beta = \alpha + 1&#92;)</span>:* Any <span>&#92;(\kappa < \aleph_{\alpha+1} = \aleph_\alpha^+&#92;)</span> satisfies <span>&#92;(\kappa \leq \aleph_\alpha&#92;)</span>. Either <span>&#92;(\kappa = \aleph_\alpha&#92;)</span> (done) or <span>&#92;(\kappa < \aleph_\alpha&#92;)</span>, and the induction hypothesis applies.
- *Limit <span>&#92;(\beta > 0&#92;)</span>:* If <span>&#92;(\kappa < \aleph_\beta = \sup_{\gamma < \beta} \aleph_\gamma&#92;)</span>, then <span>&#92;(\kappa < \aleph_\gamma&#92;)</span> for some <span>&#92;(\gamma < \beta&#92;)</span>, and the induction hypothesis applies. <span>&#92;(\square&#92;)</span>

A cardinal of the form <span>&#92;(\aleph_{\alpha+1}&#92;)</span> is called a **successor cardinal**; a cardinal <span>&#92;(\aleph_\alpha&#92;)</span> for limit <span>&#92;(\alpha&#92;)</span> is a **limit cardinal** (e.g., <span>&#92;(\aleph_0, \aleph_\omega&#92;)</span>). The enumeration <span>&#92;(\alpha \mapsto \aleph_\alpha&#92;)</span> is a strictly increasing surjection from <span>&#92;(\mathrm{Ord}&#92;)</span> onto the class of infinite cardinals. We can now prove things about all infinite cardinals by induction on the index.

### The Continuum Hypothesis

**Theorem 3.8 (Cantor's Diagonalisation).** *For every set <span>&#92;(E&#92;)</span>, <span>&#92;(|E| < |\mathcal{P}(E)|&#92;)</span>.*

*Proof.* The map <span>&#92;(x \mapsto \{x\}&#92;)</span> embeds <span>&#92;(E&#92;)</span> into <span>&#92;(\mathcal{P}(E)&#92;)</span>, so <span>&#92;(|E| \leq |\mathcal{P}(E)|&#92;)</span>. No surjection <span>&#92;(f : E \to \mathcal{P}(E)&#92;)</span> can exist: given any <span>&#92;(f&#92;)</span>, let <span>&#92;(\Delta = \{x \in E : x \notin f(x)\} \in \mathcal{P}(E)&#92;)</span>. If <span>&#92;(\Delta = f(x_0)&#92;)</span>, then <span>&#92;(x_0 \in \Delta \iff x_0 \notin f(x_0) = \Delta&#92;)</span>, a contradiction. Hence <span>&#92;(|E| \neq |\mathcal{P}(E)|&#92;)</span>, and therefore <span>&#92;(|E| < |\mathcal{P}(E)|&#92;)</span>. <span>&#92;(\square&#92;)</span>

The professor called this "a beautiful bit of mathematics from the turn of the century that really got set theory going." It has an immediate consequence: <span>&#92;(|\mathcal{P}(\aleph_0)| > \aleph_0&#92;)</span>, so <span>&#92;(\mathcal{P}(\aleph_0)&#92;)</span> is uncountable and its cardinality is some <span>&#92;(\aleph_\alpha&#92;)</span> with <span>&#92;(\alpha \geq 1&#92;)</span>. But *which* aleph?

The **Continuum Hypothesis (CH)** asserts:
<span>&#92;[|\mathcal{P}(\aleph_0)| = \aleph_1.&#92;]</span>
It says that the power set of the naturals is as small as it could possibly be — the very next cardinal after <span>&#92;(\aleph_0&#92;)</span>. The **Generalised Continuum Hypothesis (GCH)** extends this to all infinite cardinals:
<span>&#92;[|\mathcal{P}(\kappa)| = \kappa^+ \quad \text{for all infinite cardinals } \kappa.&#92;]</span>

Both are **independent of ZFC** — as the professor put it:

> "You cannot prove that it is true and you cannot prove that it is false. ZFC is agnostic. Cohen, in the 1960s, developed the machinery of forcing to prove this independence. This is very deep work and the starting point of modern set theory. We will not touch it here."

The professor drew a sharp contrast with the Axiom of Choice:

> "Mainstream mathematics assumes AC — you just assume it and you do not announce it. Mainstream mathematics does *not* assume CH. There are as many interesting statements provable by assuming CH is false as by assuming it is true. So we work independently of CH, and if you ever do use it you say so explicitly."

We do not assume CH or GCH in this course.

---

## Lectures 15a & 15b: Cardinal Arithmetic

### Addition and Multiplication of Cardinals

The purpose of cardinal arithmetic is practical: when working in mathematics, one constantly needs to compute the sizes of unions, products, and function spaces. The definitions are grounded in these geometric intuitions.

**Definition 3.10.** For cardinals <span>&#92;(\kappa_1, \kappa_2&#92;)</span>, choose disjoint sets <span>&#92;(X_1, X_2&#92;)</span> with <span>&#92;(|X_i| = \kappa_i&#92;)</span>. Define:
<span>&#92;[\kappa_1 + \kappa_2 = |X_1 \cup X_2|, \qquad \kappa_1 \cdot \kappa_2 = |X_1 \times X_2|.&#92;]</span>

These are well-defined: any two sets of cardinality <span>&#92;(\kappa_i&#92;)</span> are equinumerous, so the bijections compose to show independence of the choice of <span>&#92;(X_i&#92;)</span>. For addition, we need disjointness to avoid double-counting; for multiplication, the Cartesian product definition has no such requirement and one may as well take <span>&#92;(X_i = \kappa_i&#92;)</span> directly.

The professor emphasised a persistent notational ambiguity: "Plus and times are used for both ordinal and cardinal arithmetic. Omega plus omega as an ordinal is omega-two, a countable ordinal and not a cardinal. Omega plus omega as a cardinal is a cardinal by definition — and it equals <span>&#92;(\aleph_0&#92;)</span>, as we will see. The context tells you which you mean."

For finite cardinals, cardinal arithmetic coincides with ordinary arithmetic. For infinite cardinals, something remarkable happens:

**Theorem 3.13.** *For every infinite cardinal <span>&#92;(\kappa&#92;)</span>, <span>&#92;(\kappa \cdot \kappa = \kappa&#92;)</span>.*

*Proof.* We exhibit a well-ordering of <span>&#92;(\kappa \times \kappa&#92;)</span> of order-type at most <span>&#92;(\kappa&#92;)</span). Define: <span>&#92;((x,y) \prec (x',y')&#92;)</span> iff either <span>&#92;(\max\{x,y\} < \max\{x',y'\}&#92;)</span>, or they have the same max with lexicographic tie-breaking. This is a well-ordering; let its order-type be <span>&#92;(\gamma&#92;)</span>. Suppose for contradiction that <span>&#92;(\kappa \cdot \kappa > \kappa&#92;)</span>, i.e., <span>&#92;(\gamma > \kappa&#92;)</span). Then <span>&#92;(\kappa&#92;)</span> is a proper initial segment of <span>&#92;(\gamma&#92;)</span>, isomorphic to <span>&#92;(\{(x,y) : (x,y) \prec (x_0,y_0)\}&#92;)</span> for some <span>&#92;((x_0, y_0) \in \kappa \times \kappa&#92;)</span). Setting <span>&#92;(\zeta = \max\{x_0, y_0\} + 1 < \kappa&#92;)</span>, this initial segment lies inside <span>&#92;(\zeta \times \zeta&#92;)</span). Its cardinality is at most <span>&#92;(|\zeta \times \zeta| = |\zeta| \cdot |\zeta|&#92;)</span>. By induction on <span>&#92;(\kappa&#92;)</span>, <span>&#92;(|\zeta| \cdot |\zeta| = |\zeta| < \kappa&#92;)</span), contradicting the assumption that this segment has cardinality <span>&#92;(\kappa&#92;)</span>. <span>&#92;(\square&#92;)</span>

**Corollary 3.14.** *For infinite <span>&#92;(\kappa_2&#92;)</span> and nonzero <span>&#92;(\kappa_1 \leq \kappa_2&#92;)</span>:*
*(a) <span>&#92;(\kappa_1 \cdot \kappa_2 = \kappa_2&#92;)</span>; (b) <span>&#92;(\kappa_1 + \kappa_2 = \kappa_2&#92;)</span>.*

In other words, for infinite cardinals: <span>&#92;(\aleph_\alpha + \aleph_\beta = \aleph_\alpha \cdot \aleph_\beta = \max(\aleph_\alpha, \aleph_\beta)&#92;)</span>. The professor commented: "An infinite cardinal has enough room. You can shift things, create space to embed the other cardinal in. The disjoint union has the same size as the bigger of the two. So these operations trivialize: they just compute the maximum."

### Generalised Sums and Products

For many applications — for instance, sizing a product of infinitely many spaces — we need infinite cardinal arithmetic.

**Definition 3.16.** Let <span>&#92;((\kappa_i : i \in I)&#92;)</span> be an <span>&#92;(I&#92;)</span>-indexed sequence of cardinals (formally, a function <span>&#92;(f : I \to \mathrm{Card}&#92;)</span> with <span>&#92;(f(i) = \kappa_i&#92;)</span>). Choose pairwise disjoint sets <span>&#92;((X_i : i \in I)&#92;)</span> with <span>&#92;(|X_i| = \kappa_i&#92;)</span>. Define:
<span>&#92;[\sum_{i \in I} \kappa_i = \left|\bigcup_{i \in I} X_i\right|, \qquad \prod_{i \in I} \kappa_i = \left|\bigtimes_{i \in I} X_i\right|&#92;]</span>
where <span>&#92;(\bigtimes_{i \in I} X_i = \{f : I \to \bigcup_i X_i : f(i) \in X_i \text{ for all } i\}&#92;)</span> is the generalised Cartesian product. The union of the sequence is the union of the image of <span>&#92;(f&#92;)</span>, in set-theoretic terms. Both definitions are well-defined (independent of the choice of the <span>&#92;(X_i&#92;)</span>). Note that by AC, as long as each <span>&#92;(X_i \neq \emptyset&#92;)</span), the generalised Cartesian product is nonempty.

**Proposition 3.20.** *If <span>&#92;(I&#92;)</span> is an infinite index set and each <span>&#92;(\kappa_i > 0&#92;)</span>, then:*
*(a) <span>&#92;(\sup_{i \in I} \kappa_i&#92;)</span> is a cardinal;*
*(b) <span>&#92;(\displaystyle\sum_{i \in I} \kappa_i = \max\!\left(|I|,\, \sup_{i \in I} \kappa_i\right)&#92;)</span>.*

The sum trivialises again: you need to account for how many terms you are adding (the size of the index set), but once you do, the answer is just the larger of the index size and the supremum of the terms. The professor gave the intuition: "If all the <span>&#92;(\kappa_i&#92;)</span> are one, and you add them up over an infinite index set, you should not expect the answer to be one — you are adding infinitely many of them. The index set size must enter. But that is all that enters, beyond the supremum."

**Definition 3.21 (Cardinal Exponentiation).** For cardinals <span>&#92;(\kappa, \lambda&#92;)</span>, define:
<span>&#92;[\kappa^\lambda = |\{f : \lambda \to \kappa\}|&#92;]</span>
the cardinality of the set of all functions from <span>&#92;(\lambda&#92;)</span> to <span>&#92;(\kappa&#92;)</span>. This is precisely the generalised product of a constant sequence: <span>&#92;(\kappa^\lambda = \prod_{i \in \lambda} \kappa&#92;)</span>.

The key example: what is <span>&#92;(2^\lambda&#92;)</span>? A function <span>&#92;(f : \lambda \to 2 = \{0,1\}&#92;)</span> is a characteristic function, and it corresponds bijectively to the subset <span>&#92;(\{i \in \lambda : f(i) = 1\} \subseteq \lambda&#92;)</span>. Hence:
<span>&#92;[2^\lambda = |\mathcal{P}(\lambda)|.&#92;]</span>
By Cantor's theorem, this is strictly greater than <span>&#92;(\lambda&#92;)</span>. The generalised product does *not* trivialise in general — a stark contrast to sums. The professor noted: "Here for the first time we get something new and interesting, even at the infinite level. The sum trivialises. The product does not. It gives you something strictly bigger."

**Lemma 3.22 (Properties of Cardinal Exponentiation).** *The following hold for all cardinals:*
*(a) If <span>&#92;(\lambda \leq \mu&#92;)</span>, then <span>&#92;(\kappa^\lambda \leq \kappa^\mu&#92;)</span>.*
*(b) If <span>&#92;(\kappa \leq \lambda&#92;)</span>, then <span>&#92;(\kappa^\mu \leq \lambda^\mu&#92;)</span>.*
*(c) <span>&#92;(\kappa^{\lambda + \mu} = \kappa^\lambda \cdot \kappa^\mu&#92;)</span> (cardinal arithmetic).*
*(d) <span>&#92;((\kappa^\lambda)^\mu = \kappa^{\lambda \cdot \mu}&#92;)</span> (cardinal arithmetic).*

These match the familiar identities for exponentiation and hold for this definition; see the notes for proofs.

### König's Theorem

The following theorem is the central non-trivial inequality of infinite cardinal arithmetic. It is a vast generalisation of Cantor's diagonalisation.

**Theorem 3.25 (König's Theorem).** *Suppose <span>&#92;(\kappa_i < \lambda_i&#92;)</span> for all <span>&#92;(i \in I&#92;)</span>. Then:*
<span>&#92;[\sum_{i \in I} \kappa_i < \prod_{i \in I} \lambda_i.&#92;]</span>

The professor described this as "Cantor's diagonalisation squeezed for all it's worth."

*Proof sketch.* Choose sets <span>&#92;(X_i, Y_i&#92;)</span> with <span>&#92;(|X_i| = \kappa_i < \lambda_i = |Y_i|&#92;)</span), and fix injections <span>&#92;(\pi_i : X_i \hookrightarrow Y_i&#92;)</span>. An injection <span>&#92;(\bigsqcup_i X_i \hookrightarrow \prod_i Y_i&#92;)</span> is straightforward to construct. To see there is no surjection in this direction, suppose <span>&#92;(h : \bigsqcup_i X_i \to \prod_i Y_i&#92;)</span> is any function. For each <span>&#92;(i&#92;)</span>, the restriction <span>&#92;(h_i := h \upharpoonright X_i&#92;)</span> followed by projection onto the <span>&#92;(i&#92;)</span>-th coordinate is a function <span>&#92;(X_i \to Y_i&#92;)</span> which, since <span>&#92;(|X_i| < |Y_i|&#92;)</span>, cannot be surjective. So for each <span>&#92;(i&#92;)</span>, choose <span>&#92;(c_i \in Y_i \setminus \{\mathrm{pr}_i(h(x)) : x \in X_i\}&#92;)</span>. The element <span>&#92;((c_i)_{i \in I} \in \prod_i Y_i&#92;)</span> is not in the image of <span>&#92;(h&#92;)</span> (it evades every <span>&#92;(h(x)&#92;)</span> in the <span>&#92;(i&#92;)</span>-th coordinate for each <span>&#92;(x \in X_i&#92;)</span>). This is the diagonalisation. <span>&#92;(\square&#92;)</span>

### Regularity and Cofinality

The final topic in Chapter 3 concerns a subtle internal structure of infinite cardinals.

**Definition 3.27.** A cardinal <span>&#92;(\kappa&#92;)</span> is **regular** if every subset <span>&#92;(X \subseteq \kappa&#92;)</span> of cardinality less than <span>&#92;(\kappa&#92;)</span> has <span>&#92;(\sup X < \kappa&#92;)</span>. Equivalently, <span>&#92;(\kappa&#92;)</span> cannot be written as a union of fewer than <span>&#92;(\kappa&#92;)</span> sets each of size less than <span>&#92;(\kappa&#92;)</span). A cardinal that is not regular is **singular**.

**Definition 3.28.** The **cofinality** of an ordinal <span>&#92;(\alpha&#92;)</span>, written <span>&#92;(\mathrm{cof}(\alpha)&#92;)</span>, is the least ordinal <span>&#92;(\beta&#92;)</span> for which there exists a strictly increasing function <span>&#92;(f : \beta \to \alpha&#92;)</span> whose image is unbounded in <span>&#92;(\alpha&#92;)</span).

For example, <span>&#92;(\mathrm{cof}(\aleph_\omega) = \aleph_0&#92;)</span): the sequence <span>&#92;(\aleph_0 < \aleph_1 < \aleph_2 < \cdots&#92;)</span> is unbounded in <span>&#92;(\aleph_\omega&#92;)</span>, and no finite sequence can be unbounded in an infinite cardinal. In particular, <span>&#92;(\aleph_\omega&#92;)</span> is singular: it is the union of countably many smaller cardinals <span>&#92;(\aleph_n&#92;)</span>.

**Lemma 3.29.** *<span>&#92;(\mathrm{cof}(\alpha)&#92;)</span> is always a cardinal, and <span>&#92;(\mathrm{cof}(\mathrm{cof}(\alpha)) = \mathrm{cof}(\alpha)&#92;)</span>.*

**Proposition 3.31.** *A cardinal <span>&#92;(\kappa&#92;)</span> is regular if and only if <span>&#92;(\mathrm{cof}(\kappa) = \kappa&#92;)</span>.*

Every successor cardinal is regular (Exercise 3.32): intuitively, <span>&#92;(\kappa^+&#92;)</span> is so much larger than everything below it that no sequence of length less than <span>&#92;(\kappa^+&#92;)</span> can be unbounded in it. Infinite limit cardinals such as <span>&#92;(\aleph_\omega&#92;)</span> are singular because the cofinality is strictly smaller.

The cofinality is the key to understanding the constraints on cardinal exponentiation. The following is a non-trivial consequence of König's Theorem:

**Proposition 3.33.** *For all infinite cardinals <span>&#92;(\kappa&#92;)</span>, <span>&#92;(\mathrm{cof}(2^\kappa) > \kappa&#92;)</span>.*

*Proof.* Suppose <span>&#92;(f : \lambda \to 2^\kappa&#92;)</span> is a strictly increasing unbounded function with <span>&#92;(\lambda \leq \kappa&#92;)</span>. Then:
<span>&#92;[2^\kappa = \left|\bigcup_{\alpha < \lambda} f(\alpha)\right| \leq \sum_{\alpha < \lambda} |f(\alpha)| < \prod_{\alpha < \lambda} 2^\kappa = (2^\kappa)^\lambda = 2^{\kappa \cdot \lambda} = 2^\kappa,&#92;]</span>
where König's Theorem is used for the strict inequality (since each <span>&#92;(|f(\alpha)| < 2^\kappa&#92;)</span>) and the identities use cardinal exponentiation laws. The resulting <span>&#92;(2^\kappa < 2^\kappa&#92;)</span> is a contradiction. Hence no such <span>&#92;(\lambda \leq \kappa&#92;)</span> can be the cofinality of <span>&#92;(2^\kappa&#92;)</span>. <span>&#92;(\square&#92;)</span>

**Corollary 3.34.** <span>&#92;(2^{\aleph_0} \neq \aleph_\omega&#92;)</span>.

*Proof.* <span>&#92;(\mathrm{cof}(\aleph_\omega) = \aleph_0&#92;)</span>, but by Proposition 3.33 <span>&#92;(\mathrm{cof}(2^{\aleph_0}) > \aleph_0&#92;)</span>. Since the cofinalities differ, <span>&#92;(2^{\aleph_0} \neq \aleph_\omega&#92;)</span). <span>&#92;(\square&#92;)</span>

This is one of the few unconditional results we can prove about <span>&#92;(2^{\aleph_0}&#92;)</span> without assuming the Continuum Hypothesis or its negation: no matter what, <span>&#92;(2^{\aleph_0}&#92;)</span> cannot be the limit cardinal <span>&#92;(\aleph_\omega&#92;)</span>. The theory of cofinality and regularity, while far from exhausted here, is genuinely interesting and the notes contain more; the professor recommended it as worthwhile reading.

With this, the set theory component of the course draws to a close. The theory of ordinals and cardinals — built up from the axioms of ZFC with transfinite induction and recursion as the central tools — provides the foundational arithmetic needed for the rest of the course. When we return from the break, we enter model theory, which in some sense picks up where this leaves off: asking not just about the *size* of mathematical structures, but about what can and cannot be said about them in a formal language.

---
# Part IV: First-order Logic and Model Theory

## Lecture 16: Structures

After reading week and Thanksgiving, we begin something entirely new. The first three parts of this course developed axiomatic set theory: ordinals, cardinals, transfinite induction, and cardinal arithmetic. We now turn to **model theory**, which is still part of mathematical logic, but a different part. As the professor put it at the start of lecture: model theory is a kind of *metamathematical* subject — it gives us a formal framework for studying mathematical objects that arise anywhere in mathematics. While we will occasionally use cardinal arithmetic and transfinite induction as tools (as one does in any area of mathematics), the model theory part of the course carries no direct logical dependence on the set theory part.

The central objects of model theory are **structures**. The idea is that anything one encounters in mathematics — a group, a ring, a vector space, a partially ordered set, an ordered field — can be described as a structure in the logical sense. We are going to make this precise.

### Structures

**Definition 4.1.** A **structure** <span>&#92;(\mathcal{M}&#92;)</span> consists of a nonempty set <span>&#92;(M&#92;)</span> called the **universe** of <span>&#92;(\mathcal{M}&#92;)</span>, together with the following data:

- a sequence <span>&#92;((c_i : i \in I_{\mathrm{con}})&#92;)</span> of **constants**, where each <span>&#92;(c_i \in M&#92;)</span>;
- a sequence <span>&#92;((f_i : M^{n_i} \to M : i \in I_{\mathrm{fun}})&#92;)</span> of **basic functions**, each of some **arity** <span>&#92;(n_i \geq 1&#92;)</span>;
- a sequence <span>&#92;((R_i \subseteq M^{k_i} : i \in I_{\mathrm{rel}})&#92;)</span> of **basic relations**, each of some arity <span>&#92;(k_i \geq 1&#92;)</span>.

The triple of these sequences — the constants, basic functions, and basic relations — is called the **signature** of <span>&#92;(\mathcal{M}&#92;)</span>. The index sets <span>&#92;(I_{\mathrm{con}}, I_{\mathrm{fun}}, I_{\mathrm{rel}}&#92;)</span> may all be empty (in which case the structure is just a nonempty set), and they need not be finite.

In this definition we write the universe using the same Roman letter as the script letter for the structure, so the universe of <span>&#92;(\mathcal{M}&#92;)</span> is <span>&#92;(M&#92;)</span>, the universe of <span>&#92;(\mathcal{N}&#92;)</span> is <span>&#92;(N&#92;)</span>, and so on.

**Remark 4.2 (Zero-ary functions are constants).** The requirement that basic functions have arity at least 1 deserves a word of explanation. In set theory, <span>&#92;(M^0 = \{&#92;emptyset\}&#92;)</span> is a singleton: there is exactly one function from the empty set to any set, namely the empty function. So a zero-ary function <span>&#92;(f : M^0 \to M&#92;)</span> is entirely determined by which element of <span>&#92;(M&#92;)</span> it picks out — it is, in all but name, just a constant. One could therefore do away with the sequence of constants entirely and treat them as zero-ary functions. We do not do this; it is natural in mathematical practice to think about constants and functions separately. But the conceptual point is that the two notions coincide at arity zero, and so we simply decree that basic functions have arity at least 1 and keep constants as a separate piece of the data.

**Remark 4.3 (Nonemptiness).** The condition that the universe <span>&#92;(M&#92;)</span> be nonempty is a technical convenience. Allowing the empty universe would introduce annoying case analyses into theorem statements throughout. The index sets, however, are free to be empty: a structure with no constants, no basic functions, and no basic relations is perfectly legal — it is just a nonempty set.

The real content of the definition is that you choose which data to put on a set depending on what you want to study. The professor's examples from lecture make this vivid.

**Example 4.4 (The reals with various signatures).** Consider the set <span>&#92;(&#92;mathbb{R}&#92;)</span> of real numbers as the common universe for the following structures:

1. *The reals as a linearly ordered set.* Take no constants, no basic functions, and one basic binary relation <span>&#92;(<&#92;)</span> — more precisely, the set <span>&#92;(\{(a,b) \in &#92;mathbb{R}^2 : a < b\}&#92;)</span>. The resulting structure is <span>&#92;((&#92;mathbb{R},\,<)&#92;)</span>.

2. *The reals as an additive group.* Here we want one constant (the additive identity), a binary function (addition), and a unary function (additive inverse). The structure is <span>&#92;((&#92;mathbb{R},\, 0,\, +,\, -)&#92;)</span>, where <span>&#92;(-&#92;)</span> denotes the unary function <span>&#92;(x &#92;mapsto -x&#92;)</span>, not binary subtraction.

3. *The reals as a ring.* We add the multiplicative identity and multiplication: <span>&#92;((&#92;mathbb{R},\, 0,\, 1,\, +,\, -,\, &#92;times)&#92;)</span>. Two constants, three basic functions, no basic relations.

4. *The reals as an ordered ring.* Combine ring structure and order: <span>&#92;((&#92;mathbb{R},\, 0,\, 1,\, +,\, -,\, &#92;times,\, <)&#92;)</span>. Two constants, three basic functions, one basic relation.

All four structures share the same universe but differ in their signatures. The choice of signature encodes precisely which aspects of <span>&#92;(&#92;mathbb{R}&#92;)</span> we intend to study.

The juxtaposition of Examples 3 and 4 suggests a general pattern.

**Definition 4.5 (Expansion and reduct).** Suppose <span>&#92;(&#92;mathcal{M}&#92;)</span> and <span>&#92;(&#92;mathcal{N}&#92;)</span> are two structures with the same universe. We say <span>&#92;(&#92;mathcal{N}&#92;)</span> is an **expansion** of <span>&#92;(&#92;mathcal{M}&#92;)</span> — equivalently, <span>&#92;(&#92;mathcal{M}&#92;)</span> is a **reduct** of <span>&#92;(&#92;mathcal{N}&#92;)</span> — if the signature of <span>&#92;(&#92;mathcal{M}&#92;)</span> is contained in the signature of <span>&#92;(&#92;mathcal{N}&#92;)</span>. Formally, each of the sequences of constants, basic functions, and basic relations of <span>&#92;(&#92;mathcal{M}&#92;)</span> is a subsequence of the corresponding sequences of <span>&#92;(&#92;mathcal{N}&#92;)</span>.

In the running example: the additive group <span>&#92;((&#92;mathbb{R}, 0, +, -)&#92;)</span> is a reduct of the ring <span>&#92;((&#92;mathbb{R}, 0, 1, +, -, &#92;times)&#92;)</span>, which is in turn a reduct of the ordered ring <span>&#92;((&#92;mathbb{R}, 0, 1, +, -, &#92;times, <)&#92;)</span>. The ordered set <span>&#92;((&#92;mathbb{R}, <)&#92;)</span> is a reduct of the ordered ring but is *not* a reduct of the ring or the group, since neither of those carry the ordering.

This expansion/reduct vocabulary is the natural language for a recurring theme in model theory: given a reduct, can we *recover* the larger structure from the smaller one? For the ring and the group, the answer is no — the ring structure of <span>&#92;(&#92;mathbb{R}&#92;)</span> cannot be recovered (in a precise sense we will define) from the additive group alone. But the ordered ring structure can be recovered from the ring without the order, because the order on <span>&#92;(&#92;mathbb{R}&#92;)</span> is already *definable* in the ring: <span>&#92;(a < b&#92;)</span> if and only if <span>&#92;(b - a&#92;)</span> is a nonzero square. These matters will become precise once we have introduced languages, formulas, and definability.

### Languages and <span>&#92;(L&#92;)</span>-structures

The examples above all involved the same universe with different signatures. To compare structures that may have *different* universes but the same "shape" of signature, we need the notion of a **language**.

**Definition 4.6.** A **language** <span>&#92;(L&#92;)</span> consists of three sets of symbols:
- <span>&#92;(L_{\mathrm{con}}&#92;)</span>: a set of **constant symbols**;
- <span>&#92;(L_{\mathrm{fun}}&#92;)</span>: a set of **function symbols**, each equipped with a positive integer arity;
- <span>&#92;(L_{\mathrm{rel}}&#92;)</span>: a set of **relation symbols**, each equipped with a positive integer arity.

A language is a purely *syntactic* object. The symbols carry no intrinsic meaning — they are not actually constants, functions, or relations; they are just symbols. An **<span>&#92;(L&#92;)</span>-structure** is then a structure <span>&#92;(&#92;mathcal{M}&#92;)</span> together with an **interpretation**: a bijective correspondence between the symbols of <span>&#92;(L&#92;)</span> and the constants, basic functions, and basic relations of <span>&#92;(&#92;mathcal{M}&#92;)</span>, preserving arities. Concretely, to each constant symbol <span>&#92;(c \in L_{\mathrm{con}}&#92;)</span> there corresponds an element <span>&#92;(c^&#92;mathcal{M} \in M&#92;)</span> (the *interpretation* of <span>&#92;(c&#92;)</span> in <span>&#92;(&#92;mathcal{M}&#92;)</span>); to each <span>&#92;(n&#92;)</span>-ary function symbol <span>&#92;(f \in L_{\mathrm{fun}}&#92;)</span> there corresponds a basic function <span>&#92;(f^&#92;mathcal{M} : M^n \to M&#92;)</span>; and to each <span>&#92;(k&#92;)</span>-ary relation symbol <span>&#92;(R \in L_{\mathrm{rel}}&#92;)</span> there corresponds a basic relation <span>&#92;(R^&#92;mathcal{M} &#92;subseteq M^k&#92;)</span>.

The language is the **blueprint**; a structure is one particular **instance** of that blueprint. This is the critical distinction at the heart of model theory, and it corresponds to the distinction between *syntax* — the formal symbols and their grammar — and *semantics* — the actual mathematical objects those symbols refer to in a given structure. In practice we often suppress the superscript and write, say, <span>&#92;(+&#92;)</span> for both the function symbol in <span>&#92;(L&#92;)</span> and its interpretation in a structure. This is an abuse of notation that is universal in the literature, but one should always remember that the symbol and its interpretation are conceptually distinct.

**Example 4.7 (Language of (additive) groups).** The **language of additive groups** is <span>&#92;(L = \{0, +, -\}&#92;)</span> with one constant symbol <span>&#92;(0&#92;)</span>, one binary function symbol <span>&#92;(+&#92;)</span>, and one unary function symbol <span>&#92;(-&#92;)</span>. Both <span>&#92;((&#92;mathbb{R}, 0, +, -)&#92;)</span> and <span>&#92;(&#92;mathbb{Z}/4&#92;mathbb{Z}&#92;)</span> (with the obvious interpretations) are <span>&#92;(L&#92;)</span>-structures. Crucially, *not every* <span>&#92;(L&#92;)</span>-structure is a group — the definition of an <span>&#92;(L&#92;)</span>-structure imposes no axioms, only that the symbols be interpreted by objects of the right type and arity. For example, one can take the integers as universe, interpret <span>&#92;(0&#92;)</span> as the integer 1731, interpret <span>&#92;(+&#92;)</span> as the maximum function, and interpret <span>&#92;(-&#92;)</span> as the constant-zero function. This is a perfectly valid <span>&#92;(L&#92;)</span>-structure even though it satisfies no group axioms. Group axioms will enter later, when we discuss theories.

**Example 4.8 (Language of rings).** The **language of rings** is <span>&#92;(L = \{0, 1, +, -, &#92;times\}&#92;)</span> with two constant symbols and three function symbols. Both <span>&#92;((&#92;mathbb{R}, 0, 1, +, -, &#92;times)&#92;)</span> and <span>&#92;((&#92;mathbb{F}_5, 0, 1, +, -, &#92;times)&#92;)</span> are <span>&#92;(L&#92;)</span>-structures.

**Example 4.9 (Language of <span>&#92;(F&#92;)</span>-vector spaces).** Fix a field <span>&#92;(F&#92;)</span>. The **language of <span>&#92;(F&#92;)</span>-vector spaces** is <span>&#92;(L = \{0, +, -, &#92;lambda_a : a \in F\}&#92;)</span>, where each <span>&#92;(&#92;lambda_a&#92;)</span> is a unary function symbol intended to denote scalar multiplication by <span>&#92;(a&#92;)</span>. This is our first example of a language that may be *infinite*: if <span>&#92;(F = &#92;mathbb{R}&#92;)</span>, then <span>&#92;(L&#92;)</span> has uncountably many unary function symbols.

The reason for encoding scalar multiplication as a family of unary functions rather than a single binary function <span>&#92;(F &#92;times V &#92;to V&#92;)</span> is that our logic is **one-sorted**: basic functions must go from Cartesian powers of the universe to the universe. There is only one universe (the vector space <span>&#92;(V&#92;)</span>), so the field <span>&#92;(F&#92;)</span> cannot appear as a separate sort; it becomes part of the *language*. This has a pleasant consequence: the <span>&#92;(L&#92;)</span>-substructures of an <span>&#92;(F&#92;)</span>-vector space <span>&#92;(V&#92;)</span> are precisely its **subspaces** (nonempty subsets closed under addition and under each <span>&#92;(&#92;lambda_a&#92;)</span>), matching the mathematical notion exactly. This illustrates the general principle: the right choice of language is the one that makes the substructure notion agree with the algebraic notion you care about.

---

## Lecture 17: Embeddings

### The Syntax/Semantics Distinction in Practice

Recall the definition: a language <span>&#92;(L&#92;)</span> is a collection of symbols with no intrinsic meaning. An <span>&#92;(L&#92;)</span>-structure assigns meaning to those symbols via an interpretation that preserves arity. The symbols are the syntax; the interpretations are the semantics. The whole enterprise of model theory rests on keeping this distinction visible and exploiting it.

As the professor observed in lecture 17: "The language is just a set of symbols. It doesn't have any intrinsic meaning. And then a structure is where you take those symbols and you give them meaning." In practice, we suppress the superscript that distinguishes a symbol from its interpretation — we write <span>&#92;(+&#92;)</span> both for the function symbol in <span>&#92;(L&#92;)</span> and for the actual addition in a ring. But this notational abuse, while universal, should never obscure the conceptual point.

### <span>&#92;(L&#92;)</span>-Embeddings and Substructures

We now fix a language and vary the universe. This leads to morphisms between <span>&#92;(L&#92;)</span>-structures.

**Definition 4.10 (Embedding).** Let <span>&#92;(&#92;mathcal{M}&#92;)</span> and <span>&#92;(&#92;mathcal{N}&#92;)</span> be <span>&#92;(L&#92;)</span>-structures. An **<span>&#92;(L&#92;)</span>-embedding** <span>&#92;(j : &#92;mathcal{M} &#92;to &#92;mathcal{N}&#92;)</span> is an injective map <span>&#92;(j : M &#92;to N&#92;)</span> such that:

1. <span>&#92;(j(c^&#92;mathcal{M}) = c^&#92;mathcal{N}&#92;)</span> for every constant symbol <span>&#92;(c \in L_{\mathrm{con}}&#92;)</span>;
2. <span>&#92;(j(f^&#92;mathcal{M}(a_1, &#92;ldots, a_n)) = f^&#92;mathcal{N}(j(a_1), &#92;ldots, j(a_n))&#92;)</span> for every <span>&#92;(n&#92;)</span>-ary function symbol <span>&#92;(f \in L_{\mathrm{fun}}&#92;)</span> and all <span>&#92;(a_1, &#92;ldots, a_n \in M&#92;)</span>;
3. <span>&#92;((a_1, &#92;ldots, a_k) \in R^&#92;mathcal{M} &#92;iff (j(a_1), &#92;ldots, j(a_k)) \in R^&#92;mathcal{N}&#92;)</span> for every <span>&#92;(k&#92;)</span>-ary relation symbol <span>&#92;(R \in L_{\mathrm{rel}}&#92;)</span> and all <span>&#92;(a_1, &#92;ldots, a_k \in M&#92;)</span>.

A surjective <span>&#92;(L&#92;)</span>-embedding is an **<span>&#92;(L&#92;)</span>-isomorphism**. We write <span>&#92;(&#92;mathcal{M} &#92;cong &#92;mathcal{N}&#92;)</span> when an isomorphism exists.

Why injectivity, and why "embedding" rather than "homomorphism"? The answer is that in classical model theory, equality is always implicitly present. Even if <span>&#92;(=&#92;)</span> is not an explicit relation symbol in <span>&#92;(L&#92;)</span>, we think of it as always being there. Condition 3 with <span>&#92;(R&#92;)</span> interpreted as equality immediately forces <span>&#92;(j&#92;)</span> to be injective. Insisting on injectivity in the definition is therefore a way of reflecting the conceptual fact that equality is never forgotten, regardless of whether we have explicitly included it in the language.

Note also the biconditional in condition 3. For functions (condition 2), we only require that <span>&#92;(j&#92;)</span> commutes with the function; we do not need an "only if" direction because functions are deterministic. For relations, however, the biconditional says that <span>&#92;(j&#92;)</span> preserves membership *in both directions*: a tuple satisfies the relation in <span>&#92;(&#92;mathcal{M}&#92;)</span> if and only if its image satisfies the relation in <span>&#92;(&#92;mathcal{N}&#92;)</span>.

**Definition 4.11 (Substructure).** If <span>&#92;(M &#92;subseteq N&#92;)</span> and the inclusion map is an <span>&#92;(L&#92;)</span>-embedding, we say <span>&#92;(&#92;mathcal{M}&#92;)</span> is a **substructure** of <span>&#92;(&#92;mathcal{N}&#92;)</span> and write <span>&#92;(&#92;mathcal{M} &#92;subseteq &#92;mathcal{N}&#92;)</span>. Equivalently, <span>&#92;(&#92;mathcal{N}&#92;)</span> is an **extension** of <span>&#92;(&#92;mathcal{M}&#92;)</span>.

Unpacking the embedding conditions for the inclusion map, <span>&#92;(&#92;mathcal{M} &#92;subseteq &#92;mathcal{N}&#92;)</span> means:

1. <span>&#92;(c^&#92;mathcal{M} = c^&#92;mathcal{N}&#92;)</span> for every constant symbol;
2. <span>&#92;(f^&#92;mathcal{N} &#92;upharpoonright M^n = f^&#92;mathcal{M}&#92;)</span> for every <span>&#92;(n&#92;)</span>-ary function symbol (the restriction of the function in <span>&#92;(&#92;mathcal{N}&#92;)</span> to the smaller universe gives the function in <span>&#92;(&#92;mathcal{M}&#92;)</span>);
3. <span>&#92;(R^&#92;mathcal{N} &#92;cap M^k = R^&#92;mathcal{M}&#92;)</span> for every <span>&#92;(k&#92;)</span>-ary relation symbol.

Contrast this with the expansion/reduct notion from Lecture 16: there we fixed the universe and varied the signature. Here we fix the language and vary the universe. "Extension versus substructure" and "expansion versus reduct" are the two orthogonal ways of comparing structures.

**Proposition 4.12 (Criterion for substructures).** Let <span>&#92;(&#92;mathcal{N}&#92;)</span> be an <span>&#92;(L&#92;)</span>-structure and let <span>&#92;(A &#92;subseteq N&#92;)</span> be a nonempty subset of its universe. Then <span>&#92;(A&#92;)</span> is the universe of an <span>&#92;(L&#92;)</span>-substructure of <span>&#92;(&#92;mathcal{N}&#92;)</span> if and only if:
- <span>&#92;(c^&#92;mathcal{N} \in A&#92;)</span> for every constant symbol <span>&#92;(c \in L_{\mathrm{con}}&#92;)</span>, and
- <span>&#92;(f^&#92;mathcal{N}(a_1, &#92;ldots, a_n) \in A&#92;)</span> for every function symbol <span>&#92;(f&#92;)</span> and every <span>&#92;(a_1, &#92;ldots, a_n \in A&#92;)</span>.

When this holds, there is a **unique** <span>&#92;(L&#92;)</span>-substructure with universe <span>&#92;(A&#92;)</span>: the interpretations of function and constant symbols are inherited from <span>&#92;(&#92;mathcal{N}&#92;)</span>, and each relation <span>&#92;(R^&#92;mathcal{M} = R^&#92;mathcal{N} &#92;cap A^k&#92;)</span>.

The key observation is that *relations impose no closure condition*. One can always restrict a relation to a subset. Functions and constants, however, must actually land inside <span>&#92;(A&#92;)</span>, which is the substantive condition.

**Example 4.13 (Substructures and language sensitivity).** The following table illustrates how the substructure notion depends on the choice of language, all for subsets of <span>&#92;(&#92;mathbb{R}&#92;)</span>:

| Language | Substructures of <span>&#92;(&#92;mathbb{R}&#92;)</span> are... |
|---|---|
| <span>&#92;(L = &#92;emptyset&#92;)</span> (empty language) | all nonempty subsets |
| <span>&#92;(L = \{0, +\}&#92;)</span> (additive monoid) | nonempty subsets containing 0 and closed under addition (monoids/semigroups) |
| <span>&#92;(L = \{0, +, -\}&#92;)</span> (additive group) | subgroups of <span>&#92;((&#92;mathbb{R}, +)&#92;)</span> |
| <span>&#92;(L = \{0, 1, +, -, &#92;times\}&#92;)</span> (ring) | subrings of <span>&#92;(&#92;mathbb{R}&#92;)</span> |
| <span>&#92;(L = \{<\}&#92;)</span> (order) | all nonempty subsets (with induced ordering) |

This is why the language of groups includes the unary negation symbol: if it were omitted, the substructures of a group would be its sub-monoids, not its subgroups. The "right" language for studying groups is the one that makes the logical notion of substructure agree with the algebraic notion. The same principle applies to rings: including both 0, 1 and the three operations <span>&#92;(+, -, &#92;times&#92;)</span> ensures that substructures are exactly subrings.

**Observation 4.14 (Embeddings reduce to substructures).** If <span>&#92;(j : &#92;mathcal{M} &#92;to &#92;mathcal{N}&#92;)</span> is an <span>&#92;(L&#92;)</span>-embedding, let <span>&#92;(A = j(M) &#92;subseteq N&#92;)</span> be the image. One can verify that <span>&#92;(A&#92;)</span> satisfies the criterion of Proposition 4.12, so there is a unique substructure <span>&#92;(&#92;mathcal{A} &#92;subseteq &#92;mathcal{N}&#92;)</span> with universe <span>&#92;(A&#92;)</span>. Moreover, <span>&#92;(j : &#92;mathcal{M} &#92;to &#92;mathcal{A}&#92;)</span> is an isomorphism. In other words, to study <span>&#92;(L&#92;)</span>-embeddings it suffices to study substructures: every embedding identifies its domain with a substructure of its codomain.

---

## Lecture 18: Terms

### Why Formulas?

We now shift from semantics (structures) to syntax (formal expressions). There are two reasons to develop a formal language of formulas. First, formulas are used to *describe properties of structures*: to say "let <span>&#92;(&#92;mathcal{M}&#92;)</span> be a partial order" one needs a way to express the partial order axioms, and those axioms will be formulas. Second, formulas are used to *define subsets* of a given structure. For example, within a ring one might want to isolate the multiplicative units — the elements <span>&#92;(x&#92;)</span> for which there exists a <span>&#92;(y&#92;)</span> with <span>&#92;(xy = 1&#92;)</span>. That defining condition is a formula, and the set of units is the set of elements of the ring that *realize* it.

These two uses — describing classes of structures and defining subsets of a fixed structure — are, in a broad sense, what model theory is about.

### Variables

Before defining terms, we fix once and for all a countably infinite set <span>&#92;(&#92;mathrm{Var} = \{v_0, v_1, v_2, &#92;ldots\}&#92;)</span> of **variable symbols**. Like language symbols, variables are purely syntactic: they are symbols, not elements of any structure. The countability is a convention; in any given context only finitely many variables appear.

### Terms

Fix a language <span>&#92;(L&#92;)</span>.

**Definition 4.15 (Term).** The set of **<span>&#92;(L&#92;)</span>-terms** is the smallest collection of finite strings of symbols from <span>&#92;(&#92;mathrm{Var} &#92;cup L_{\mathrm{con}} &#92;cup L_{\mathrm{fun}} &#92;cup \{(,\, ),\, ,\}&#92;)</span> satisfying:

1. Every variable symbol is an <span>&#92;(L&#92;)</span>-term.
2. Every constant symbol <span>&#92;(c \in L_{\mathrm{con}}&#92;)</span> is an <span>&#92;(L&#92;)</span>-term.
3. If <span>&#92;(f \in L_{\mathrm{fun}}&#92;)</span> has arity <span>&#92;(n&#92;)</span> and <span>&#92;(t_1, &#92;ldots, t_n&#92;)</span> are <span>&#92;(L&#92;)</span>-terms, then the string <span>&#92;(f(t_1, &#92;ldots, t_n)&#92;)</span> is an <span>&#92;(L&#92;)</span>-term.

Items 1 and 2 are the *base cases* (complexity 0), and item 3 is the *recursive step*: it takes terms already built and produces a new term of strictly greater complexity. One can alternatively characterize the set of <span>&#92;(L&#92;)</span>-terms as the smallest collection of strings containing all variables and constant symbols and closed under the operation of item 3. Note that relation symbols do not appear in the definition of terms — relations are not used to form terms.

The terms are, in the professor's phrase, **"syntactic polynomials"**: they are formal expressions built from variables and constants using the function symbols of the language. In the language of rings <span>&#92;(L = \{0, 1, +, -, &#92;times\}&#92;)</span>, every <span>&#92;(L&#92;)</span>-term (when interpreted in a ring) behaves like a polynomial with integer coefficients, and every such polynomial arises as the interpretation of some term. For instance, the term <span>&#92;(+(x_1,\, -(x_2),\, &#92;times(1, x_2))&#92;)</span> is the formally-correct but unreadable syntactic object that we would naturally write as <span>&#92;(x_1 - x_2 &#92;cdot 1x_2&#92;)</span> — though even here one must be careful: the abridgement from <span>&#92;(1 &#92;cdot x_2&#92;)</span> to <span>&#92;(x_2&#92;)</span> is *not* permitted at the syntactic level, because it uses the fact that 1 is a multiplicative identity, which is an axiom, not a logical truth.

We write <span>&#92;(t(x_1, &#92;ldots, x_n)&#92;)</span> to mean that all variables appearing in <span>&#92;(t&#92;)</span> come from the list <span>&#92;(x_1, &#92;ldots, x_n&#92;)</span>. Not all listed variables need actually appear in <span>&#92;(t&#92;)</span> — there may be dummy variables, just as one writes "a polynomial in three variables" even if one of the variables does not appear.

### Interpreting Terms

A term by itself has no meaning. To give it meaning, we need to fix a structure and a tuple of elements to plug in for the variables.

**Definition 4.16 (Interpretation of a term).** Let <span>&#92;(&#92;mathcal{M}&#92;)</span> be an <span>&#92;(L&#92;)</span>-structure and let <span>&#92;(t(x_1, &#92;ldots, x_n)&#92;)</span> be an <span>&#92;(L&#92;)</span>-term. The **interpretation** <span>&#92;(t^&#92;mathcal{M} : M^n &#92;to M&#92;)</span> is defined recursively:

1. If <span>&#92;(t = x_i&#92;)</span>, then <span>&#92;(t^&#92;mathcal{M}(a_1, &#92;ldots, a_n) = a_i&#92;)</span> (projection onto the <span>&#92;(i&#92;)</span>-th coordinate).
2. If <span>&#92;(t = c&#92;)</span> is a constant symbol, then <span>&#92;(t^&#92;mathcal{M}(a_1, &#92;ldots, a_n) = c^&#92;mathcal{M}&#92;)</span> (constant function with value the interpretation of <span>&#92;(c&#92;)</span>).
3. If <span>&#92;(t = f(t_1, &#92;ldots, t_l)&#92;)</span> where <span>&#92;(f&#92;)</span> is an <span>&#92;(l&#92;)</span>-ary function symbol, then
<span>&#92;[t^&#92;mathcal{M}(a_1, &#92;ldots, a_n) = f^&#92;mathcal{M}\bigl(t_1^&#92;mathcal{M}(a_1,&#92;ldots,a_n),\; &#92;ldots,\; t_l^&#92;mathcal{M}(a_1,&#92;ldots,a_n)\bigr).&#92;]</span>

A subtle point: the interpretation <span>&#92;(t^&#92;mathcal{M}&#92;)</span> depends not only on the term <span>&#92;(t&#92;)</span> and the structure <span>&#92;(&#92;mathcal{M}&#92;)</span>, but also on the *presentation* of <span>&#92;(t&#92;)</span> — on which variables are listed and in which order. Consider the single-variable term <span>&#92;(t = x&#92;)</span>. Presented as <span>&#92;(t(x)&#92;)</span>, its interpretation is the identity map <span>&#92;(M &#92;to M&#92;)</span>. Presented as <span>&#92;(t(x, y)&#92;)</span>, its interpretation is <span>&#92;(M^2 &#92;to M&#92;)</span>, <span>&#92;((a,b) &#92;mapsto a&#92;)</span>. Presented as <span>&#92;(t(y, x)&#92;)</span>, it is <span>&#92;((a,b) &#92;mapsto b&#92;)</span>. This is the same phenomenon as viewing a polynomial in one variable as a polynomial in two or three variables: the underlying expression is the same, but the "type" of the function it represents changes.

The collection <span>&#92;(&#92;mathcal{T}&#92;)</span> of all interpretations <span>&#92;(\{t^&#92;mathcal{M} : t &#92;text{ an } L&#92;text{-term, any presentation}\}&#92;)</span> is the smallest collection of functions on Cartesian powers of <span>&#92;(M&#92;)</span> that contains all coordinate projections and all constant functions with value <span>&#92;(c^&#92;mathcal{M}&#92;)</span> (for constant symbols <span>&#92;(c&#92;)</span>), and that is closed under composition. In other words, the terms generate precisely the algebra of functions produced from the basic functions and constants via composition and projection. This makes precise the sense in which terms are "syntactic polynomials."

**Exercise 4.17.** A nonempty subset <span>&#92;(A &#92;subseteq M&#92;)</span> is the universe of an <span>&#92;(L&#92;)</span>-substructure if and only if <span>&#92;(t^&#92;mathcal{N}(A^n) &#92;subseteq A&#92;)</span> for every <span>&#92;(L&#92;)</span>-term <span>&#92;(t&#92;)</span> in <span>&#92;(n&#92;)</span> variables. (This extends the earlier closure condition from basic functions to all terms, since closed under basic functions and constants implies closed under all terms.)

### Atomic Formulas

Terms are the building blocks for the simplest kind of formula.

**Definition 4.18 (Atomic formula).** An **atomic <span>&#92;(L&#92;)</span>-formula** is a string of one of the following two forms:

1. <span>&#92;((t_1 = t_2)&#92;)</span>, where <span>&#92;(t_1&#92;)</span> and <span>&#92;(t_2&#92;)</span> are <span>&#92;(L&#92;)</span>-terms. This uses the **equality symbol**, which is a logical symbol always present in our formalism regardless of the language.
2. <span>&#92;(R(t_1, &#92;ldots, t_k)&#92;)</span>, where <span>&#92;(R \in L_{\mathrm{rel}}&#92;)</span> is a <span>&#92;(k&#92;)</span>-ary relation symbol and <span>&#92;(t_1, &#92;ldots, t_k&#92;)</span> are <span>&#92;(L&#92;)</span>-terms.

So atomic formulas express either that two terms are equal, or that a tuple of terms stands in one of the basic relations of the language. They are the simplest non-trivial assertions one can make: "these two expressions evaluate to the same element" or "this tuple belongs to this relation." All more complex formulas are built from atomic ones.

---

## Lecture 19: Formulae

### Building Formulas from Atomic Ones

With terms and atomic formulas in hand, we can now define the full class of <span>&#92;(L&#92;)</span>-formulas. As with terms, the definition is inductive.

**Definition 4.19 (Formula).** The set of **<span>&#92;(L&#92;)</span>-formulas** is the smallest collection of finite strings of symbols from
<span>&#92;[&#92;mathrm{Var} &#92;cup L_{\mathrm{con}} &#92;cup L_{\mathrm{fun}} &#92;cup L_{\mathrm{rel}} &#92;cup \{=,\; (,\; ),\; ,\; &#92;neg,\; &#92;wedge,\; &#92;vee,\; &#92;forall,\; &#92;exists\}&#92;]</span>
satisfying:

1. Every atomic <span>&#92;(L&#92;)</span>-formula is an <span>&#92;(L&#92;)</span>-formula.
2. If <span>&#92;(&#92;varphi&#92;)</span> and <span>&#92;(&#92;psi&#92;)</span> are <span>&#92;(L&#92;)</span>-formulas, then so are <span>&#92;((&#92;neg &#92;varphi)&#92;)</span>, <span>&#92;((&#92;varphi &#92;wedge &#92;psi)&#92;)</span>, and <span>&#92;((&#92;varphi &#92;vee &#92;psi)&#92;)</span>.
3. If <span>&#92;(&#92;varphi&#92;)</span> is an <span>&#92;(L&#92;)</span>-formula and <span>&#92;(x \in &#92;mathrm{Var}&#92;)</span>, then <span>&#92;((&#92;forall x\, &#92;varphi)&#92;)</span> and <span>&#92;((&#92;exists x\, &#92;varphi)&#92;)</span> are <span>&#92;(L&#92;)</span>-formulas.

We introduce standard abbreviations: <span>&#92;((&#92;varphi &#92;to &#92;psi)&#92;)</span> for <span>&#92;((&#92;neg &#92;varphi &#92;vee &#92;psi)&#92;)</span>, and <span>&#92;((&#92;varphi &#92;leftrightarrow &#92;psi)&#92;)</span> for <span>&#92;(((&#92;varphi &#92;to &#92;psi) &#92;wedge (&#92;psi &#92;to &#92;varphi))&#92;)</span>. Although one could in principle express everything using just <span>&#92;(&#92;neg&#92;)</span> and <span>&#92;(&#92;wedge&#92;)</span> (since <span>&#92;(&#92;varphi &#92;vee &#92;psi&#92;)</span> is equivalent to <span>&#92;(&#92;neg(&#92;neg &#92;varphi &#92;wedge &#92;neg &#92;psi)&#92;)</span>), we include all three connectives from the start.

As always, these are strings of symbols — they have no meaning until we fix a structure and a tuple in which to interpret them.

**Example 4.20 (Set theory).** In the **language of set theory** <span>&#92;(L = \{&#92;in\}&#92;)</span> — a single binary relation symbol — the terms are just the variables (since there are no constant or function symbols). The atomic formulas are of the form <span>&#92;(x = y&#92;)</span> or <span>&#92;(x &#92;in y&#92;)</span>, where <span>&#92;(x, y&#92;)</span> are variables. The full class of <span>&#92;(L&#92;)</span>-formulas in this language is exactly the **definite conditions** introduced in the set theory part of the course. In particular, every axiom of ZFC is an <span>&#92;(L&#92;)</span>-sentence in this language (a formula with no free variables). For instance, the Axiom of Empty Set can be written <span>&#92;(&#92;exists x\, &#92;forall y\, (&#92;neg(y &#92;in x))&#92;)</span>, and the formula
<span>&#92;[(x &#92;in y) &#92;wedge &#92;forall z\bigl((z &#92;in x) &#92;to (z &#92;in y)\bigr) &#92;wedge &#92;forall z\bigl((z &#92;in y) &#92;to \bigl((z &#92;in x) &#92;vee (z = x)\bigr)\bigr)&#92;]</span>
expresses "y is the successor of x" and has free variables x and y.

This connection is not a coincidence: the definition of "definite condition" in ZFC was precisely the definition of a formula in the language of set theory. We have now generalized it to arbitrary languages.

### Free and Bound Variables

The quantifiers <span>&#92;(&#92;forall&#92;)</span> and <span>&#92;(&#92;exists&#92;)</span> *capture* variable occurrences. This distinction is important.

**Definition 4.21 (Free and bound variables).** An **occurrence** of a variable <span>&#92;(x&#92;)</span> in a formula <span>&#92;(&#92;varphi&#92;)</span> is **bound** if it appears within the scope of a quantifier <span>&#92;(&#92;forall x&#92;)</span> or <span>&#92;(&#92;exists x&#92;)</span>; otherwise the occurrence is **free**. A formula with no free variable occurrences is an **<span>&#92;(L&#92;)</span>-sentence**.

We write <span>&#92;(&#92;varphi(x_1, &#92;ldots, x_n)&#92;)</span> to mean that all free occurrences of variables in <span>&#92;(&#92;varphi&#92;)</span> come from the list <span>&#92;(x_1, &#92;ldots, x_n&#92;)</span>. As with terms, not all listed variables need actually appear freely; there may be dummy variables.

The intuition is sharp: a free variable is one about which the formula makes a statement; a bound variable is a dummy used purely to express a quantified condition. In the successor-of formula above, <span>&#92;(x&#92;)</span> and <span>&#92;(y&#92;)</span> are free (the formula says something about them) and <span>&#92;(z&#92;)</span> is bound (it is used only to say "every element of <span>&#92;(x&#92;)</span> is in <span>&#92;(y&#92;)</span>", with no residual dependence on <span>&#92;(z&#92;)</span>).

If the same variable <span>&#92;(x&#92;)</span> appears both free and bound in a formula, we can always rename the bound occurrences with a fresh variable to obtain a logically equivalent formula (in any structure) in which each variable appears either only freely or only bound. We will always assume, without loss of generality, that no variable appears both free and bound in any formula we consider.

**Definition 4.22 (Special classes of formulas).** An <span>&#92;(L&#92;)</span>-formula is:
- **quantifier-free** if it contains no quantifiers (built from atomic formulas using only <span>&#92;(&#92;neg, &#92;wedge, &#92;vee&#92;)</span>);
- **existential** if it is of the form <span>&#92;(&#92;exists y_1 &#92;cdots &#92;exists y_m\, &#92;psi&#92;)</span> with <span>&#92;(&#92;psi&#92;)</span> quantifier-free;
- **universal** if it is of the form <span>&#92;(&#92;forall y_1 &#92;cdots &#92;forall y_m\, &#92;psi&#92;)</span> with <span>&#92;(&#92;psi&#92;)</span> quantifier-free.

These three classes will play a central role in Proposition 4.27 below.

---

## Lecture 20: Truth

### Satisfaction and the Semantics of Formulas

Formulas are strings of symbols; a formula becomes meaningful only when it is *interpreted* in a structure with a particular tuple substituted for its free variables. The definition of what it means for a tuple to satisfy a formula is the semantic counterpart to the syntactic definition of formulas, and it is likewise inductive.

Thinking about it concretely: suppose I have the formula <span>&#92;(&#92;varphi(x)&#92;)</span> that says "there exists a <span>&#92;(z&#92;)</span> such that <span>&#92;(z &#92;cdot z = x&#92;)</span>" (i.e., <span>&#92;(x&#92;)</span> is a perfect square). To ask whether the real number 2 satisfies this formula, I need to know: (a) which structure I am working in (the reals as a ring, say), and (b) whether there exists an element <span>&#92;(b&#92;)</span> in that structure such that <span>&#92;(b &#92;cdot b = 2&#92;)</span>. The answer is yes in <span>&#92;((&#92;mathbb{R}, 0, 1, +, -, &#92;times)&#92;)</span>, no in <span>&#92;((&#92;mathbb{Q}, 0, 1, +, -, &#92;times)&#92;)</span>, and yes in <span>&#92;((&#92;mathbb{C}, 0, 1, +, -, &#92;times)&#92;)</span>. The formula is the same; the answer depends on both the structure and the element being tested.

**Definition 4.23 (Satisfaction / Truth).** Let <span>&#92;(&#92;mathcal{M}&#92;)</span> be an <span>&#92;(L&#92;)</span>-structure, let <span>&#92;(&#92;varphi(x_1, &#92;ldots, x_n)&#92;)</span> be an <span>&#92;(L&#92;)</span>-formula, and let <span>&#92;(\mathbf{a} = (a_1, &#92;ldots, a_n) \in M^n&#92;)</span>. We define <span>&#92;(&#92;mathcal{M} &#92;models &#92;varphi(\mathbf{a})&#92;)</span> — read "<span>&#92;(&#92;mathcal{M}&#92;)</span> **satisfies** (or **realizes**, or **models**) <span>&#92;(&#92;varphi&#92;)</span> at <span>&#92;(\mathbf{a}&#92;)</span>" — by induction on the complexity of <span>&#92;(&#92;varphi&#92;)</span>:

**Atomic cases:**
- If <span>&#92;(&#92;varphi&#92;)</span> is <span>&#92;((t_1 = t_2)&#92;)</span>: <span>&#92;(&#92;mathcal{M} &#92;models &#92;varphi(\mathbf{a})&#92;)</span> iff <span>&#92;(t_1^&#92;mathcal{M}(\mathbf{a}) = t_2^&#92;mathcal{M}(\mathbf{a})&#92;)</span> (the two interpretations agree as elements of <span>&#92;(M&#92;)</span>).
- If <span>&#92;(&#92;varphi&#92;)</span> is <span>&#92;(R(t_1, &#92;ldots, t_k)&#92;)</span>: <span>&#92;(&#92;mathcal{M} &#92;models &#92;varphi(\mathbf{a})&#92;)</span> iff <span>&#92;\bigl(t_1^&#92;mathcal{M}(\mathbf{a}), &#92;ldots, t_k^&#92;mathcal{M}(\mathbf{a})\bigr) \in R^&#92;mathcal{M}&#92;)</span>.

**Boolean cases:** (assuming the statement is already defined for simpler formulas <span>&#92;(&#92;psi, &#92;theta&#92;)</span>)
- <span>&#92;(&#92;mathcal{M} &#92;models (&#92;neg &#92;psi)(\mathbf{a})&#92;)</span> iff <span>&#92;(&#92;mathcal{M} &#92;not&#92;models &#92;psi(\mathbf{a})&#92;)</span>.
- <span>&#92;(&#92;mathcal{M} &#92;models (&#92;psi &#92;wedge &#92;theta)(\mathbf{a})&#92;)</span> iff <span>&#92;(&#92;mathcal{M} &#92;models &#92;psi(\mathbf{a})&#92;)</span> and <span>&#92;(&#92;mathcal{M} &#92;models &#92;theta(\mathbf{a})&#92;)</span>.
- <span>&#92;(&#92;mathcal{M} &#92;models (&#92;psi &#92;vee &#92;theta)(\mathbf{a})&#92;)</span> iff <span>&#92;(&#92;mathcal{M} &#92;models &#92;psi(\mathbf{a})&#92;)</span> or <span>&#92;(&#92;mathcal{M} &#92;models &#92;theta(\mathbf{a})&#92;)</span> (inclusive or).

**Quantifier cases:** (where <span>&#92;(y&#92;)</span> is a variable that may or may not appear in <span>&#92;(&#92;psi&#92;)</span>)
- <span>&#92;(&#92;mathcal{M} &#92;models (&#92;exists y\, &#92;psi)(\mathbf{a})&#92;)</span> iff there exists <span>&#92;(b \in M&#92;)</span> such that <span>&#92;(&#92;mathcal{M} &#92;models &#92;psi(\mathbf{a}, b)&#92;)</span>.
- <span>&#92;(&#92;mathcal{M} &#92;models (&#92;forall y\, &#92;psi)(\mathbf{a})&#92;)</span> iff for all <span>&#92;(b \in M&#92;)</span>, <span>&#92;(&#92;mathcal{M} &#92;models &#92;psi(\mathbf{a}, b)&#92;)</span>.

Each case takes the connective or quantifier at face value: the conjunction symbol means "and", the existential quantifier means "there exists an element in the universe." This is the natural definition — the structure gives meaning to the symbols.

**Definition 4.24 (Definable sets and sentences).** Given <span>&#92;(&#92;mathcal{M}&#92;)</span> and <span>&#92;(&#92;varphi(x_1, &#92;ldots, x_n)&#92;)</span>, define
<span>&#92;[&#92;varphi^&#92;mathcal{M} = \{(a_1, &#92;ldots, a_n) \in M^n : &#92;mathcal{M} &#92;models &#92;varphi(\mathbf{a})\}&#92;]</span>
to be the **set defined by <span>&#92;(&#92;varphi&#92;)</span> in <span>&#92;(&#92;mathcal{M}&#92;)</span>**, also called the **set of realizations** of <span>&#92;(&#92;varphi&#92;)</span>. This is a subset of <span>&#92;(M^n&#92;)</span>, and it depends on the presentation of the free variables.

When <span>&#92;(n = 0&#92;)</span>, <span>&#92;(&#92;varphi&#92;)</span> is a sentence and there are no variables to plug in. Then <span>&#92;(&#92;mathcal{M} &#92;models &#92;varphi&#92;)</span> is simply true or false — a **truth value**. We say <span>&#92;(&#92;varphi&#92;)</span> is **true in <span>&#92;(&#92;mathcal{M}&#92;)</span>** and write <span>&#92;(&#92;mathcal{M} &#92;models &#92;varphi&#92;)</span>. By the definition of negation, for any sentence <span>&#92;(&#92;varphi&#92;)</span>, exactly one of <span>&#92;(&#92;mathcal{M} &#92;models &#92;varphi&#92;)</span> and <span>&#92;(&#92;mathcal{M} &#92;models &#92;neg &#92;varphi&#92;)</span> holds. There is no middle ground.

**Example 4.25.** In the language of rings, let <span>&#92;(&#92;varphi(x)&#92;)</span> be the formula <span>&#92;(&#92;exists z\, (z &#92;cdot z = x)&#92;)</span> (asserting that <span>&#92;(x&#92;)</span> is a square).

- In <span>&#92;((&#92;mathbb{R}, 0, 1, +, -, &#92;times)&#92;)</span>: the set <span>&#92;(&#92;varphi^&#92;mathbb{R} = [0, &#92;infty)&#92;)</span> — exactly the nonnegative reals. In particular, the sentence <span>&#92;(&#92;forall x\, &#92;varphi(x)&#92;)</span> is false in <span>&#92;(&#92;mathbb{R}&#92;)</span>, since <span>&#92;(-1&#92;)</span> has no square root.
- In <span>&#92;((&#92;mathbb{Q}, 0, 1, +, -, &#92;times)&#92;)</span>: the set <span>&#92;(&#92;varphi^&#92;mathbb{Q}&#92;)</span> is the set of perfect-square rationals <span>&#92;(\{n^2/m^2 : n,m \in &#92;mathbb{Z},\, m &#92;neq 0\}&#92;)</span>. This is smaller than the set of nonnegative rationals: for example, 2 is nonnegative but has no rational square root.
- In <span>&#92;((&#92;mathbb{C}, 0, 1, +, -, &#92;times)&#92;)</span>: the sentence <span>&#92;(&#92;forall x\, &#92;varphi(x)&#92;)</span> is *true*, since every complex number has a square root. Equivalently, <span>&#92;(&#92;varphi^&#92;mathbb{C} = &#92;mathbb{C}&#92;)</span>.

The same formula defines a different subset in each structure. This is the fundamental point: the meaning of a formula is not fixed; it depends on the structure.

### Quantifiers, Substructures, and the Preservation Theorem

The example above hints at a deeper phenomenon. Consider the integers <span>&#92;(&#92;mathcal{Z} = (&#92;mathbb{Z}, 0, +, -)&#92;)</span> as a substructure of the rationals <span>&#92;(&#92;mathcal{Q} = (&#92;mathbb{Q}, 0, +, -)&#92;)</span> in the language of additive groups. Let <span>&#92;(&#92;psi(x, y)&#92;)</span> be the atomic formula <span>&#92;(y + y = x&#92;)</span> (asserting <span>&#92;(x = 2y&#92;)</span>). For integer inputs, <span>&#92;(&#92;mathcal{Z} &#92;models &#92;psi(a, b)&#92;)</span> if and only if <span>&#92;(&#92;mathcal{Q} &#92;models &#92;psi(a, b)&#92;)</span>: both structures agree that <span>&#92;(a = 2b&#92;)</span>. This is the quantifier-free case.

Now let <span>&#92;(&#92;varphi(x) = &#92;exists y\, &#92;psi(x,y)&#92;)</span>, asserting "there exists <span>&#92;(y&#92;)</span> such that <span>&#92;(x = 2y&#92;)</span>." For <span>&#92;(x = 1&#92;)</span>: <span>&#92;(&#92;mathcal{Q} &#92;models &#92;varphi(1)&#92;)</span> (take <span>&#92;(y = 1/2&#92;)</span>), but <span>&#92;(&#92;mathcal{Z} &#92;not&#92;models &#92;varphi(1)&#92;)</span> (no integer <span>&#92;(y&#92;)</span> satisfies <span>&#92;(2y = 1&#92;)</span>). The existential quantifier ranges over the universe of the structure being evaluated in, so enlarging the universe can create new witnesses.

This discrepancy is precisely what the following proposition codifies. It is the first substantial theorem of model theory and the proof illustrates the inductive method on formulas.

**Proposition 4.26 (Preservation Theorem).** *Let <span>&#92;(&#92;mathcal{M} &#92;subseteq &#92;mathcal{N}&#92;)</span> be <span>&#92;(L&#92;)</span>-structures, let <span>&#92;(&#92;varphi(\mathbf{x})&#92;)</span> be an <span>&#92;(L&#92;)</span>-formula, and let <span>&#92;(\mathbf{a} \in M^n&#92;)</span>. Then:*

*(a) If <span>&#92;(&#92;varphi&#92;)</span> is quantifier-free: <span>&#92;(&#92;mathcal{M} &#92;models &#92;varphi(\mathbf{a}) &#92;iff &#92;mathcal{N} &#92;models &#92;varphi(\mathbf{a})&#92;)</span>.*

*(b) If <span>&#92;(&#92;varphi&#92;)</span> is existential: <span>&#92;(&#92;mathcal{M} &#92;models &#92;varphi(\mathbf{a}) &#92;Rightarrow &#92;mathcal{N} &#92;models &#92;varphi(\mathbf{a})&#92;)</span>.*

*(c) If <span>&#92;(&#92;varphi&#92;)</span> is universal: <span>&#92;(&#92;mathcal{N} &#92;models &#92;varphi(\mathbf{a}) &#92;Rightarrow &#92;mathcal{M} &#92;models &#92;varphi(\mathbf{a})&#92;)</span>.*

In summary: quantifier-free formulas are preserved in both directions between a substructure and an extension; existential formulas are preserved going *up* (to extensions); universal formulas are preserved going *down* (to substructures).

*Proof.* The argument has two layers of induction: first on terms, then on formulas.

**Claim (Term invariance).** For every <span>&#92;(L&#92;)</span>-term <span>&#92;(t(x_1, &#92;ldots, x_n)&#92;)</span> and every <span>&#92;(\mathbf{a} \in M^n&#92;)</span>,
<span>&#92;[t^&#92;mathcal{N}(\mathbf{a}) = t^&#92;mathcal{M}(\mathbf{a}).&#92;]</span>
That is, the interpretation of a term in the extension, evaluated at elements from the substructure, agrees with its interpretation in the substructure.

*Proof of Claim.* By induction on the complexity of <span>&#92;(t&#92;)</span>.

**Base case <span>&#92;(t = x_i&#92;)</span>.** Then <span>&#92;(t^&#92;mathcal{N}(\mathbf{a}) = a_i = t^&#92;mathcal{M}(\mathbf{a})&#92;)</span> by definition (both are projections onto the <span>&#92;(i&#92;)</span>-th coordinate, which of course agree on the same input).

**Base case <span>&#92;(t = c&#92;)</span> a constant symbol.** Then <span>&#92;(t^&#92;mathcal{N}(\mathbf{a}) = c^&#92;mathcal{N}&#92;)</span> and <span>&#92;(t^&#92;mathcal{M}(\mathbf{a}) = c^&#92;mathcal{M}&#92;)</span>. Since <span>&#92;(&#92;mathcal{M} &#92;subseteq &#92;mathcal{N}&#92;)</span>, condition 1 of the substructure definition gives <span>&#92;(c^&#92;mathcal{M} = c^&#92;mathcal{N}&#92;)</span>. So both sides agree.

**Inductive case <span>&#92;(t = f(t_1, &#92;ldots, t_l)&#92;)</span>.** The terms <span>&#92;(t_1, &#92;ldots, t_l&#92;)</span> have strictly lower complexity, so the claim holds for each of them by induction hypothesis. Evaluating at <span>&#92;(\mathbf{a} \in M^n&#92;)</span>:
<span>&#92;[t^&#92;mathcal{N}(\mathbf{a}) = f^&#92;mathcal{N}\bigl(t_1^&#92;mathcal{N}(\mathbf{a}), &#92;ldots, t_l^&#92;mathcal{N}(\mathbf{a})\bigr) = f^&#92;mathcal{N}\bigl(t_1^&#92;mathcal{M}(\mathbf{a}), &#92;ldots, t_l^&#92;mathcal{M}(\mathbf{a})\bigr),&#92;]</span>
using the induction hypothesis in the second step. Now each <span>&#92;(t_i^&#92;mathcal{M}(\mathbf{a}) \in M&#92;)</span>, since the substructure is closed under interpretations of terms (Exercise 4.17). Since <span>&#92;(&#92;mathcal{M} &#92;subseteq &#92;mathcal{N}&#92;)</span>, condition 2 of the substructure definition says <span>&#92;(f^&#92;mathcal{N} &#92;upharpoonright M^l = f^&#92;mathcal{M}&#92;)</span>. Applying this:
<span>&#92;[f^&#92;mathcal{N}\bigl(t_1^&#92;mathcal{M}(\mathbf{a}), &#92;ldots, t_l^&#92;mathcal{M}(\mathbf{a})\bigr) = f^&#92;mathcal{M}\bigl(t_1^&#92;mathcal{M}(\mathbf{a}), &#92;ldots, t_l^&#92;mathcal{M}(\mathbf{a})\bigr) = t^&#92;mathcal{M}(\mathbf{a}).&#92;]</span>
This completes the proof of the claim. <span>&#92;(\square&#92;)</span> (claim)

**Part (a): Quantifier-free formulas.** By induction on the complexity of <span>&#92;(&#92;varphi&#92;)</span>.

*Atomic case <span>&#92;(&#92;varphi = (t_1 = t_2)&#92;)</span>.* <span>&#92;(&#92;mathcal{M} &#92;models &#92;varphi(\mathbf{a})&#92;)</span> iff <span>&#92;(t_1^&#92;mathcal{M}(\mathbf{a}) = t_2^&#92;mathcal{M}(\mathbf{a})&#92;)</span>; by the claim, this is iff <span>&#92;(t_1^&#92;mathcal{N}(\mathbf{a}) = t_2^&#92;mathcal{N}(\mathbf{a})&#92;)</span>, which is iff <span>&#92;(&#92;mathcal{N} &#92;models &#92;varphi(\mathbf{a})&#92;)</span>.

*Atomic case <span>&#92;(&#92;varphi = R(t_1, &#92;ldots, t_k)&#92;)</span>.* By the claim, <span>&#92;(t_i^&#92;mathcal{M}(\mathbf{a}) = t_i^&#92;mathcal{N}(\mathbf{a})&#92;)</span> for all <span>&#92;(i&#92;)</span>. The substructure condition 3 gives <span>&#92;(R^&#92;mathcal{N} &#92;cap M^k = R^&#92;mathcal{M}&#92;)</span>, and the <span>&#92;(k&#92;)</span>-tuple <span>&#92;\bigl(t_1^&#92;mathcal{M}(\mathbf{a}), &#92;ldots, t_k^&#92;mathcal{M}(\mathbf{a})\bigr) \in M^k&#92;)</span>. So membership in <span>&#92;(R^&#92;mathcal{M}&#92;)</span> and in <span>&#92;(R^&#92;mathcal{N}&#92;)</span> are equivalent, giving the biconditional.

*Boolean cases.* These are immediate from the definitions: <span>&#92;(&#92;mathcal{M} &#92;models (&#92;neg &#92;psi)(\mathbf{a})&#92;)</span> iff <span>&#92;(&#92;mathcal{M} &#92;not&#92;models &#92;psi(\mathbf{a})&#92;)</span>, which by induction is iff <span>&#92;(&#92;mathcal{N} &#92;not&#92;models &#92;psi(\mathbf{a})&#92;)</span>, which is iff <span>&#92;(&#92;mathcal{N} &#92;models (&#92;neg&#92;psi)(\mathbf{a})&#92;)</span>. And and or are handled symmetrically.

**Part (b): Existential formulas.** Write <span>&#92;(&#92;varphi = &#92;exists y_1 &#92;cdots &#92;exists y_m\, &#92;psi&#92;)</span> with <span>&#92;(&#92;psi&#92;)</span> quantifier-free. If <span>&#92;(&#92;mathcal{M} &#92;models &#92;varphi(\mathbf{a})&#92;)</span>, then there exist <span>&#92;(\mathbf{b} = (b_1, &#92;ldots, b_m) \in M^m&#92;)</span> such that <span>&#92;(&#92;mathcal{M} &#92;models &#92;psi(\mathbf{a}, \mathbf{b})&#92;)</span>. Since <span>&#92;(&#92;psi&#92;)</span> is quantifier-free and <span>&#92;((\mathbf{a}, \mathbf{b}) \in M^{n+m}&#92;)</span>, part (a) gives <span>&#92;(&#92;mathcal{N} &#92;models &#92;psi(\mathbf{a}, \mathbf{b})&#92;)</span>. Since <span>&#92;(\mathbf{b} \in M &#92;subseteq N&#92;)</span>, the same tuple witnesses <span>&#92;(&#92;mathcal{N} &#92;models &#92;varphi(\mathbf{a})&#92;)</span>.

**Part (c): Universal formulas.** Write <span>&#92;(&#92;varphi = &#92;forall y_1 &#92;cdots &#92;forall y_m\, &#92;psi&#92;)</span> with <span>&#92;(&#92;psi&#92;)</span> quantifier-free. If <span>&#92;(&#92;mathcal{N} &#92;models &#92;varphi(\mathbf{a})&#92;)</span>, then for every <span>&#92;(\mathbf{b} \in N^m&#92;)</span>, <span>&#92;(&#92;mathcal{N} &#92;models &#92;psi(\mathbf{a}, \mathbf{b})&#92;)</span>. In particular this holds for every <span>&#92;(\mathbf{b} \in M^m &#92;subseteq N^m&#92;)</span>. By part (a), <span>&#92;(&#92;mathcal{M} &#92;models &#92;psi(\mathbf{a}, \mathbf{b})&#92;)</span> for every such <span>&#92;(\mathbf{b}&#92;)</span>, hence <span>&#92;(&#92;mathcal{M} &#92;models &#92;varphi(\mathbf{a})&#92;)</span>. <span>&#92;(&#92;square&#92;)</span>

The essential content of the proof is that quantifier-free truth is "algebraic" — it depends only on the operations of the structure applied to a fixed tuple, and substructures inherit those operations faithfully. As soon as we introduce an existential quantifier, we ask "does there *exist* a witness in the universe?", and passing to a larger universe can only create more witnesses, not destroy them. Conversely, a universal statement asks "does *every* element of the universe satisfy this?", which can only be easier to satisfy in a smaller universe.

---
## Lectures 21a & 21b: Elementary Substructures

### From Substructures to Elementary Substructures

One of the first substantial theorems in this part of the course is a clean description of how truth behaves when you pass between a structure and a substructure. Before introducing the central new concept, it is worth recalling what we already know. A substructure is the model-theoretic generalisation of a subgroup, a subring, a subfield, and so on: the universe of <span>&#92;(\mathcal{M}&#92;)</span> sits inside the universe of <span>&#92;(\mathcal{N}&#92;)</span>, and every basic function and relation of <span>&#92;(L&#92;)</span> restricts correctly. We proved:

**Proposition 4.21 (Substructures and quantifier-free truth).** *If <span>&#92;(\mathcal{M} \subseteq \mathcal{N}&#92;)</span> is an <span>&#92;(L&#92;)</span>-substructure, <span>&#92;(\varphi(\mathbf{x})&#92;)</span> is a quantifier-free <span>&#92;(L&#92;)</span>-formula, and <span>&#92;(\mathbf{a} \in M^n&#92;)</span>, then <span>&#92;(\mathcal{M} \models \varphi(\mathbf{a}) \iff \mathcal{N} \models \varphi(\mathbf{a})&#92;)</span>.*

The proof goes by induction on formula complexity. The key input is the **Claim**: for any <span>&#92;(L&#92;)</span>-term <span>&#92;(t(\mathbf{x})&#92;)</span> and <span>&#92;(\mathbf{a} \in M^n&#92;)</span>, the interpretation of <span>&#92;(t&#92;)</span> in <span>&#92;(\mathcal{M}&#92;)</span> evaluated at <span>&#92;(\mathbf{a}&#92;)</span> coincides with its interpretation in <span>&#92;(\mathcal{N}&#92;)</span> evaluated at <span>&#92;(\mathbf{a}&#92;)</span>. This is exactly what you would expect: the algebra of the substructure is just the restriction of the algebra of the larger structure, so terms — which encode that algebra — agree. The atomic case (which comes in two flavours: equality of terms, and a relation applied to terms) reduces immediately to the Claim. Then negation, conjunction, and disjunction pass through by straightforward induction. Since we only have quantifier-free formulas there is no quantifier step.

We also proved a refinement: if <span>&#92;(\varphi(\mathbf{x})&#92;)</span> is an **existential** formula (a block of existential quantifiers followed by a quantifier-free formula), then <span>&#92;(\mathcal{M} \models \varphi(\mathbf{a})&#92;)</span> implies <span>&#92;(\mathcal{N} \models \varphi(\mathbf{a})&#92;)</span> — but not necessarily the other direction. The intuition is transparent: if something exists in the smaller structure, it surely exists in the bigger one. Conversely, **universal** formulas (a block of universals followed by quantifier-free) travel in the opposite direction: truth in the extension implies truth in the substructure. If something holds everywhere in the big universe, it holds in particular everywhere in the small one.

These observations apply equally to any <span>&#92;(L&#92;)</span>-embedding <span>&#92;(j : \mathcal{M} \to \mathcal{N}&#92;)</span>, not just substructures; one just puts <span>&#92;(j(\mathbf{a})&#92;)</span> in place of <span>&#92;(\mathbf{a}&#92;)</span> on the right-hand side. But for a general formula — one where existential and universal quantifiers alternate — neither direction is guaranteed. As Prof. Moosa put it in lecture: the complication in syntax comes precisely from the **alternation** of quantifiers. That is where the interesting logic lives.

### Elementary Embeddings and Elementary Substructures

This motivates the central definition of the unit.

**Definition 4.23.** An <span>&#92;(L&#92;)</span>-embedding <span>&#92;(j : \mathcal{M} \to \mathcal{N}&#92;)</span> is an **elementary embedding** if for all <span>&#92;(L&#92;)</span>-formulas <span>&#92;(\varphi(\mathbf{x})&#92;)</span> and all <span>&#92;(\mathbf{a} \in M^n&#92;)</span>:
<span>&#92;[\mathcal{M} &#92;models &#92;varphi(\mathbf{a}) &#92;iff &#92;mathcal{N} &#92;models &#92;varphi(j(\mathbf{a})).&#92;]</span>
If <span>&#92;(\mathcal{M} \subseteq \mathcal{N}&#92;)</span> and the inclusion map is an elementary embedding, we say <span>&#92;(\mathcal{M}&#92;)</span> is an **elementary substructure** of <span>&#92;(\mathcal{N}&#92;)</span>, written <span>&#92;(\mathcal{M} \prec \mathcal{N}&#92;)</span>.

The notation <span>&#92;(\prec&#92;)</span> is chosen to echo <span>&#92;(\subseteq&#92;)</span> but to signal that something much stronger is at work. A substructure is an algebraic notion — it is exactly what a group theorist or ring theorist would call a subobject. An elementary substructure is something coming out of model theory itself: not only must the basic algebra be compatible, but every first-order truth about elements of <span>&#92;(M&#92;)</span> must be the same whether computed in <span>&#92;(\mathcal{M}&#92;)</span> or in <span>&#92;(\mathcal{N}&#92;)</span>.

There is a useful special case to note immediately: taking <span>&#92;(n = 0&#92;)</span>, i.e., considering <span>&#92;(L&#92;)</span>-sentences (formulas with no free variables), the definition says that <span>&#92;(\mathcal{M}&#92;)</span> and <span>&#92;(\mathcal{N}&#92;)</span> satisfy exactly the same <span>&#92;(L&#92;)</span>-sentences. Elementary substructures are not just algebraically compatible — they are indistinguishable by any first-order property.

**Corollary 4.24 (Isomorphisms are elementary).** *Every <span>&#92;(L&#92;)</span>-isomorphism is an elementary embedding.*

*Proof.* Let <span>&#92;(j : \mathcal{M} \to \mathcal{N}&#92;)</span> be an isomorphism. We prove <span>&#92;(\mathcal{M} \models \varphi(\mathbf{a}) \iff \mathcal{N} \models \varphi(j(\mathbf{a}))&#92;)</span> by induction on the complexity of <span>&#92;(\varphi&#92;)</span>. The atomic and quantifier-free cases are immediate from the embedding property. Boolean connectives are trivial by induction. For the existential step: <span>&#92;(\mathcal{M} \models \exists y\, \psi(\mathbf{a}, y)&#92;)</span> iff some <span>&#92;(b \in M&#92;)</span> witnesses <span>&#92;(\mathcal{M} \models \psi(\mathbf{a}, b)&#92;)</span>, which by induction gives <span>&#92;(\mathcal{N} \models \psi(j(\mathbf{a}), j(b))&#92;)</span>. Conversely, if some <span>&#92;(c \in N&#92;)</span> satisfies <span>&#92;(\mathcal{N} \models \psi(j(\mathbf{a}), c)&#92;)</span>, surjectivity gives <span>&#92;(c = j(b)&#92;)</span> for some <span>&#92;(b \in M&#92;)</span>, and then by induction <span>&#92;(\mathcal{M} \models \psi(\mathbf{a}, b)&#92;)</span>. Universal quantifiers follow by taking negations. <span>&#92;(\square&#92;)</span>

It is surjectivity that makes the existential step work in both directions. For a mere embedding — injective but not surjective — you only get one direction, as we saw with existential formulas above.

### The Example: <span>&#92;(\mathbb{Z} \subseteq \mathbb{Q}&#92;)</span> but <span>&#92;(\mathbb{Z} \not\prec \mathbb{Q}&#92;)</span>

The cleanest illustration of the gap between substructures and elementary substructures is the additive groups <span>&#92;((\mathbb{Z}, 0, +, -)&#92;)</span> and <span>&#92;((\mathbb{Q}, 0, +, -)&#92;)</span>. The integers are certainly a subgroup of the rationals — a substructure in the language of groups. But they fail to be an elementary substructure. The witnessing formula is simple:
<span>&#92;[\varphi(x) :\equiv \exists y\,(y + y = x).&#92;]</span>
This says "x is twice some y," or equivalently, "x is even" in the group-theoretic sense. Take <span>&#92;(x = 1&#92;)</span>. Then <span>&#92;(\mathbb{Q} \models \varphi(1)&#92;)</span>, since <span>&#92;(y = \tfrac{1}{2}&#92;)</span> is a witness. But <span>&#92;(\mathbb{Z} \not\models \varphi(1)&#92;)</span>, since no integer when added to itself gives 1. Here <span>&#92;(1&#92;)</span> is an element of the smaller structure, and the two structures disagree on what <span>&#92;(\varphi&#92;)</span> says about it. This is precisely what the definition forbids.

This single counterexample settles the question. But the professor pushed further in Lecture 21b, proving the following striking theorem:

**Proposition (No proper elementary subgroups of <span>&#92;(\mathbb{Q}&#92;)</span>).** *The additive group <span>&#92;((\mathbb{Q}, 0, +, -)&#92;)</span> has no proper elementary subgroups.*

*Proof.* Suppose <span>&#92;(\mathcal{G} \prec (\mathbb{Q}, 0, +, -)&#92;)</span> with <span>&#92;(\mathcal{G} = (G, 0, +, -)&#92;)</span>. We show <span>&#92;(G = \mathbb{Q}&#92;)</span>.

Since <span>&#92;(\mathbb{Q} \models \exists x (x \neq 0)&#92;)</span> is an <span>&#92;(L&#92;)</span>-sentence, and the <span>&#92;(n = 0&#92;)</span> case of the elementary substructure definition says both structures satisfy the same sentences, we get <span>&#92;(\mathcal{G} \models \exists x(x \neq 0)&#92;)</span>, so there is some non-zero <span>&#92;(a \in G&#92;)</span>. Writing <span>&#92;(a = n/m&#92;)</span> with <span>&#92;(n, m > 0&#92;)</span> (we may assume positivity since <span>&#92;(\mathcal{G}&#92;)</span> is a subgroup and closed under negation), note that since <span>&#92;(\mathcal{G}&#92;)</span> is a subgroup, <span>&#92;(a + a + \cdots + a&#92;)</span> (<span>&#92;(m&#92;)</span> times) lies in <span>&#92;(G&#92;)</span>; this equals <span>&#92;(n \in \mathbb{Z}&#92;)</span>. So <span>&#92;(G&#92;)</span> contains a positive integer, call it <span>&#92;(N&#92;)</span>.

Now the rationals are <span>&#92;(N&#92;)</span>-divisible: for the sentence <span>&#92;(\sigma_N \equiv \forall x \exists y (y + y + \cdots + y = x)&#92;)</span> (<span>&#92;(N&#92;)</span> copies of <span>&#92;(y&#92;)</span>), we have <span>&#92;(\mathbb{Q} \models \sigma_N&#92;)</span>. Since <span>&#92;(\mathcal{G} \prec \mathbb{Q}&#92;)</span>, also <span>&#92;(\mathcal{G} \models \sigma_N&#92;)</span>. Applying this to the element <span>&#92;(N \in G&#92;)</span>: <span>&#92;(\mathbb{Q} \models \exists y (y + \cdots + y = N)&#92;)</span> (this is a statement about an element of <span>&#92;(G&#92;)</span> that is true in <span>&#92;(\mathbb{Q}&#92;)</span>), so by the definition of <span>&#92;(\prec&#92;)</span> there exists <span>&#92;(L \in G&#92;)</span> with <span>&#92;(\mathbb{Q} \models N \cdot L = N&#92;)</span>. In the rationals, the unique solution is <span>&#92;(L = 1&#92;)</span>. So <span>&#92;(1 \in G&#92;)</span>.

A subgroup containing <span>&#92;(1&#92;)</span> contains all integers. And for each positive integer <span>&#92;(k&#92;)</span>, the sentence <span>&#92;(\tau_k \equiv \forall x \exists y (y + \cdots + y = x)&#92;)</span> (<span>&#92;(k&#92;)</span> copies) is true in <span>&#92;(\mathbb{Q}&#92;)</span>, hence true in <span>&#92;(\mathcal{G}&#92;)</span> since <span>&#92;(\mathcal{G} \prec \mathbb{Q}&#92;)</span>. So <span>&#92;(\mathcal{G}&#92;)</span> is <span>&#92;(k&#92;)</span>-divisible for every <span>&#92;(k&#92;)</span>, and contains <span>&#92;(\mathbb{Z}&#92;)</span>. But <span>&#92;(\mathbb{Q}&#92;)</span> is precisely the divisible hull of <span>&#92;(\mathbb{Z}&#92;)</span>: every rational <span>&#92;(a/k&#92;)</span> lies in <span>&#92;(G&#92;)</span> because <span>&#92;(a \in G&#92;)</span> and <span>&#92;(k&#92;)</span>-divisibility gives a preimage. Hence <span>&#92;(G = \mathbb{Q}&#92;)</span>. <span>&#92;(\square&#92;)</span>

The key moment in the proof deserves emphasis. We use the sentence <span>&#92;(\exists y (y + \cdots + y = N)&#92;)</span> — an existential formula — and we descend from <span>&#92;(\mathbb{Q}&#92;)</span> to <span>&#92;(\mathcal{G}&#92;)</span>. For a plain substructure, existential truth only goes upward. The whole power of the elementary condition is precisely that existential witnesses can also be pulled downward.

---

## Lectures 22a & 22b: Tarski-Vaught and Downward Löwenheim-Skolem

### Isomorphisms Are Elementary: A First Observation

Before proceeding to the main theorem of Lecture 22, the professor noted something that should have been said from the start: isomorphisms are a natural, ever-present source of elementary embeddings (Corollary 4.24 above). In particular, the identity map on any structure is an automorphism, hence an elementary embedding, so every structure is an elementary substructure of itself. Elementary substructures are common at the trivial end; the interesting question is when non-trivial, proper elementary substructures exist.

### The Tarski-Vaught Test

The central difficulty with checking that <span>&#92;(\mathcal{M} \prec \mathcal{N}&#92;)</span> directly is that one must verify a condition for every formula of every complexity. The **Tarski-Vaught Test** reduces this infinite task to a single, elegant criterion. Its intuition is already visible in the <span>&#92;(\mathbb{Z} \subseteq \mathbb{Q}&#92;)</span> example: what went wrong there was precisely that an existential statement — "there exists a <span>&#92;(y&#92;)</span> such that <span>&#92;(y + y = 1&#92;)</span>" — was true in <span>&#92;(\mathbb{Q}&#92;)</span> with a parameter from <span>&#92;(\mathbb{Z}&#92;)</span>, but had no witness in <span>&#92;(\mathbb{Z}&#92;)</span> itself. That pattern is not just an example; it is the only thing that can fail.

**Proposition 4.26 (Tarski-Vaught Test).** *Suppose <span>&#92;(\mathcal{M} \subseteq \mathcal{N}&#92;)</span>. Then <span>&#92;(\mathcal{M} \prec \mathcal{N}&#92;)</span> if and only if the following condition holds:*

*<span>&#92;((\star)&#92;)</span>: For every <span>&#92;(L&#92;)</span>-formula <span>&#92;(\varphi(\mathbf{x}, y)&#92;)</span> and every <span>&#92;(\mathbf{a} \in M^n&#92;)</span>, if <span>&#92;(\mathcal{N} \models \exists y\, \varphi(\mathbf{a}, y)&#92;)</span>, then there exists <span>&#92;(b \in M&#92;)</span> such that <span>&#92;(\mathcal{N} \models \varphi(\mathbf{a}, b)&#92;)</span>.*

Condition <span>&#92;((\star)&#92;)</span> should be read as: whenever <span>&#92;(\mathcal{N}&#92;)</span> believes that a solution to a formula with parameters from <span>&#92;(M&#92;)</span> exists, it already has a witness inside <span>&#92;(M&#92;)</span>. Truth is always computed in the big structure <span>&#92;(\mathcal{N}&#92;)</span>; the point is that the witnesses can be found in the small one.

*Proof.*

<span>&#92;((\Rightarrow)&#92;)</span>: Assume <span>&#92;(\mathcal{M} \prec \mathcal{N}&#92;)</span> and <span>&#92;(\mathcal{N} \models \exists y\, \varphi(\mathbf{a}, y)&#92;)</span>. Let <span>&#92;(\psi(\mathbf{x}) \equiv \exists y\, \varphi(\mathbf{x}, y)&#92;)</span>. Then <span>&#92;(\mathcal{N} \models \psi(\mathbf{a})&#92;)</span>. By the elementary substructure condition applied to <span>&#92;(\psi&#92;)</span>, we get <span>&#92;(\mathcal{M} \models \psi(\mathbf{a})&#92;)</span>, i.e., some <span>&#92;(b \in M&#92;)</span> satisfies <span>&#92;(\mathcal{M} \models \varphi(\mathbf{a}, b)&#92;)</span>. Since <span>&#92;(\mathcal{M} \prec \mathcal{N}&#92;)</span>, also <span>&#92;(\mathcal{N} \models \varphi(\mathbf{a}, b)&#92;)</span>.

<span>&#92;((\Leftarrow)&#92;)</span>: Assume <span>&#92;((\star)&#92;)</span>. We prove <span>&#92;(\mathcal{M} \models \theta(\mathbf{a}) \iff \mathcal{N} \models \theta(\mathbf{a})&#92;)</span> for all formulas <span>&#92;(\theta&#92;)</span> and <span>&#92;(\mathbf{a} \in M^n&#92;)</span>, by induction on complexity. The base case (quantifier-free) is Proposition 4.21: substructures agree on all quantifier-free truth. Boolean connectives are trivial. The only hard case is <span>&#92;(\theta(\mathbf{x}) = \exists y\, \varphi(\mathbf{x}, y)&#92;)</span>.

If <span>&#92;(\mathcal{M} \models \theta(\mathbf{a})&#92;)</span>, pick <span>&#92;(b \in M&#92;)</span> with <span>&#92;(\mathcal{M} \models \varphi(\mathbf{a}, b)&#92;)</span>; by induction (since <span>&#92;(\varphi&#92;)</span> is simpler than <span>&#92;(\theta&#92;)</span>) we get <span>&#92;(\mathcal{N} \models \varphi(\mathbf{a}, b)&#92;)</span>, so <span>&#92;(\mathcal{N} \models \theta(\mathbf{a})&#92;)</span>.

Conversely, if <span>&#92;(\mathcal{N} \models \theta(\mathbf{a})&#92;)</span>, that is, <span>&#92;(\mathcal{N} \models \exists y\, \varphi(\mathbf{a}, y)&#92;)</span>: condition <span>&#92;((\star)&#92;)</span> gives <span>&#92;(b \in M&#92;)</span> with <span>&#92;(\mathcal{N} \models \varphi(\mathbf{a}, b)&#92;)</span>. By induction again (applied to <span>&#92;(\varphi&#92;)</span>), <span>&#92;(\mathcal{M} \models \varphi(\mathbf{a}, b)&#92;)</span>, so <span>&#92;(\mathcal{M} \models \theta(\mathbf{a})&#92;)</span>. Universal quantifiers follow by the logical equivalence <span>&#92;(\forall y = \neg \exists y \neg&#92;)</span>. <span>&#92;(\square&#92;)</span>

A practically very useful reformulation emerges when one uses the parameter language <span>&#92;(L_M&#92;)</span>: <span>&#92;(\mathcal{M} \prec \mathcal{N}&#92;)</span> if and only if for every <span>&#92;(L_M&#92;)</span>-formula <span>&#92;(\varphi(y)&#92;)</span> in one free variable, if <span>&#92;(\mathcal{N} \models \exists y\, \varphi(y)&#92;)</span> then there is a witness <span>&#92;(b \in M&#92;)</span>. The parameters are buried inside the <span>&#92;(L_M&#92;)</span>-formula rather than displayed explicitly, making the condition cleaner.

The Tarski-Vaught Test can also be rephrased as a criterion for a subset to be the universe of an elementary substructure. If <span>&#92;(A \subseteq M&#92;)</span>, then <span>&#92;(A&#92;)</span> is the universe of an elementary substructure of <span>&#92;(\mathcal{M}&#92;)</span> if and only if for every formula <span>&#92;(\varphi(\mathbf{x}, y)&#92;)</span> and <span>&#92;(\mathbf{a} \in A^n&#92;)</span>, if <span>&#92;(\mathcal{M} \models \exists y\, \varphi(\mathbf{a}, y)&#92;)</span> then there exists <span>&#92;(b \in A&#92;)</span> with <span>&#92;(\mathcal{M} \models \varphi(\mathbf{a}, b)&#92;)</span>. In other words: <span>&#92;(A&#92;)</span> is **closed under witnesses to existential truths** (where truth is computed in <span>&#92;(\mathcal{M}&#92;)</span>). The special formulas <span>&#92;(\varphi(y) \equiv (y = y)&#92;)</span>, <span>&#92;(\varphi(y) \equiv (y = c)&#92;)</span> for constants <span>&#92;(c&#92;)</span>, and <span>&#92;(\varphi(y) \equiv (y = f(\mathbf{a}))&#92;)</span> for function symbols <span>&#92;(f&#92;)</span> already force <span>&#92;(A&#92;)</span> to be non-empty, to contain all constants, and to be closed under all basic functions — confirming that the condition subsumes the substructure requirement.

### Downward Löwenheim-Skolem

The Tarski-Vaught criterion leads immediately to a fundamental theorem of model theory, which, as the professor noted, predates much of the framework we have been building — it goes back to Löwenheim (1915) and Skolem (1920), though phrased in modern language by Tarski. Its conceptual import is striking: however large a structure may be, it always has a *small* elementary substructure.

**Theorem 4.27 (Downward Löwenheim-Skolem).** *Let <span>&#92;(\mathcal{M}&#92;)</span> be an <span>&#92;(L&#92;)</span>-structure and <span>&#92;(A \subseteq M&#92;)</span>. Set <span>&#92;(\kappa = \max\{|A|, |L|, \aleph_0\}&#92;)</span>. Then there exists an elementary substructure <span>&#92;(\mathcal{N} \prec \mathcal{M}&#92;)</span> with <span>&#92;(A \subseteq N&#92;)</span> and <span>&#92;(|N| \leq \kappa&#92;)</span>.*

In particular, if <span>&#92;(L&#92;)</span> is countable and <span>&#92;(A = \emptyset&#92;)</span>, then <span>&#92;(\kappa = \aleph_0&#92;)</span> and every <span>&#92;(L&#92;)</span>-structure has a countable elementary substructure.

The cardinality bound <span>&#92;(\kappa&#92;)</span> is sharp: one cannot do better than <span>&#92;|A|&#92;)</span> (the substructure must contain the seed set), nor better than <span>&#92;|L|&#92;)</span> (it must contain all interpretations of constant symbols and be closed under function symbols), nor make it finite (a finite elementary substructure would force the whole structure to be finite). Adding <span>&#92;(\aleph_0&#92;)</span> ensures the bound is infinite even when the language and seed are finite.

*Proof sketch.* The construction is a "Skolem closure." Set <span>&#92;(A_0 = A&#92;)</span>. Given <span>&#92;(A_i&#92;)</span>, let <span>&#92;(A_{i+1}&#92;)</span> be <span>&#92;(A_i&#92;)</span> together with, for each formula <span>&#92;(\varphi(\mathbf{x}, y)&#92;)</span> and each <span>&#92;(\mathbf{a} \in A_i^n&#92;)</span> with <span>&#92;(\mathcal{M} \models \exists y\, \varphi(\mathbf{a}, y)&#92;)</span>, a chosen witness. The number of pairs <span>&#92;((\varphi, \mathbf{a})&#92;)</span> at stage <span>&#92;(i&#92;)</span> is bounded by <span>&#92;(\kappa&#92;)</span> (there are at most <span>&#92;(\kappa&#92;)</span>-many formulas, since they are finite strings from a set of symbols of size <span>&#92;(\kappa&#92;)</span>, and at most <span>&#92;(\kappa&#92;)</span>-many tuples from <span>&#92;(A_i&#92;)</span> which by induction has size <span>&#92;(\leq \kappa&#92;)</span>), so <span>&#92;(|A_{i+1}| \leq \kappa&#92;)</span>. Put <span>&#92;(B = \bigcup_{i < \omega} A_i&#92;)</span>. Then <span>&#92;(|B| \leq \kappa \cdot \aleph_0 = \kappa&#92;)</span>. By construction, <span>&#92;(B&#92;)</span> satisfies the Tarski-Vaught criterion: any finite tuple from <span>&#92;(B&#92;)</span> lies in some <span>&#92;(A_i&#92;)</span>, and witnesses are added at stage <span>&#92;(A_{i+1} \subseteq B&#92;)</span>. By the corollary to the Tarski-Vaught Test, <span>&#92;(B&#92;)</span> is the universe of an elementary substructure <span>&#92;(\mathcal{N} \prec \mathcal{M}&#92;)</span> with <span>&#92;(A \subseteq B = N&#92;)</span>. <span>&#92;(\square&#92;)</span>

Note how non-constructive this is: one ranges over all formulas and all tuples and throws in witnesses without any control over which witnesses are chosen. The theorem does not tell you which elementary substructure you get — it only guarantees one exists. That is precisely why more specific results (such as the fact that <span>&#92;((\mathbb{Q}, 0, +, -)&#92;)</span> is an elementary subgroup of <span>&#92;((\mathbb{R}, 0, +, -)&#92;)</span>) require separate arguments. As the professor remarked: the rationals are countable, and the reals have a countable elementary subgroup by the theorem, but the theorem does not tell you it is the rationals.

---

## Lecture 23: Definable Sets and Parameters

### Naming Constants — the Language <span>&#92;(L_B&#92;)</span>

So far we have been studying what can be said in a fixed language <span>&#92;(L&#92;)</span> about the elements of a structure. But it is very natural to want to refer to specific elements of the universe — for instance, to say "x is bigger than <span>&#92;(\pi&#92;)</span>" in the ordered ring of reals, or to define the interval <span>&#92;((0, \pi)&#92;)</span>. Since <span>&#92;(\pi&#92;)</span> is not a constant in the language of rings, we need to extend the language.

The solution is elegant and simple. Let <span>&#92;(\mathcal{M}&#92;)</span> be an <span>&#92;(L&#92;)</span>-structure and <span>&#92;(B \subseteq M&#92;)</span>. The language <span>&#92;(L_B&#92;)</span> is obtained by adding a new constant symbol <span>&#92;(\bar{b}&#92;)</span> for each <span>&#92;(b \in B&#92;)</span> (distinct elements get distinct new symbols, all distinct from symbols already in <span>&#92;(L&#92;)</span>). We then expand <span>&#92;(\mathcal{M}&#92;)</span> to an <span>&#92;(L_B&#92;)</span>-structure <span>&#92;(\mathcal{M}_B&#92;)</span> by interpreting <span>&#92;(\bar{b}&#92;)</span> as <span>&#92;(b&#92;)</span> and leaving all <span>&#92;(L&#92;)</span>-symbols unchanged. This is the canonical expansion. (There are many other ways to make <span>&#92;(\mathcal{M}&#92;)</span> into an <span>&#92;(L_B&#92;)</span>-structure, but this is the right one.) In practice, we almost always drop the bar and write <span>&#92;(b&#92;)</span> both for the element and its name, relying on context to resolve the syntax/semantics distinction.

The Tarski-Vaught Test can be rephrased neatly: <span>&#92;(\mathcal{M} \prec \mathcal{N}&#92;)</span> if and only if for every <span>&#92;(L_M&#92;)</span>-formula <span>&#92;(\varphi(y)&#92;)</span> in one free variable, <span>&#92;(\mathcal{N} \models \exists y\, \varphi(y)&#92;)</span> implies there is a witness <span>&#92;(b \in M&#92;)</span>. The parameters are now hidden inside the language, and the test reads: <span>&#92;(M&#92;)</span> is closed under witnesses to existential <span>&#92;(L_M&#92;)</span>-truths (where truth is computed in <span>&#92;(\mathcal{N}&#92;)</span>).

### Definable Sets

**Definition 4.29 (Definable set).** Let <span>&#92;(\mathcal{M}&#92;)</span> be an <span>&#92;(L&#92;)</span>-structure and <span>&#92;(B \subseteq M&#92;)</span>. A set <span>&#92;(X \subseteq M^n&#92;)</span> is **<span>&#92;(B&#92;)</span>-definable** in <span>&#92;(\mathcal{M}&#92;)</span> if there exists an <span>&#92;(L_B&#92;)</span>-formula <span>&#92;(\varphi(\mathbf{x})&#92;)</span> such that
<span>&#92;[X = \varphi^{\mathcal{M}} = \{\mathbf{a} \in M^n : \mathcal{M}_B \models \varphi(\mathbf{a})\}.&#92;]</span>
Equivalently, in terms of the original language <span>&#92;(L&#92;)</span>: there exist an <span>&#92;(L&#92;)</span>-formula <span>&#92;(\psi(\mathbf{x}, \mathbf{y})&#92;)</span> and parameters <span>&#92;(\mathbf{b} \in B^m&#92;)</span> such that <span>&#92;(X = \{\mathbf{a} \in M^n : \mathcal{M} \models \psi(\mathbf{a}, \mathbf{b})\}&#92;)</span>. We say <span>&#92;(X&#92;)</span> is **definable** (in <span>&#92;(\mathcal{M}&#92;)</span>) if it is <span>&#92;(M&#92;)</span>-definable, and **0-definable** or **parameter-free** if it is <span>&#92;(\emptyset&#92;)</span>-definable.

Every definable set is <span>&#92;(B&#92;)</span>-definable for some finite <span>&#92;(B&#92;)</span>, since formulas are finite objects and can only involve finitely many parameter symbols.

### Examples of Definable Sets

The motivating example with which the professor opened Lecture 23 is the ordered ring of real numbers. One can define the interval <span>&#92;((0,1)&#92;)</span> as the solution set of <span>&#92;(0 < x \wedge x < 1&#92;)</span>, where 0 and 1 are constants. The interval <span>&#92;((0, \tfrac{1}{2})&#92;)</span> can be defined without a name for <span>&#92;(\tfrac{1}{2}&#92;)</span>: the formula <span>&#92;(\exists y (y + y = 1 \wedge x < y)&#92;)</span> in one free variable <span>&#92;(x&#92;)</span> says "there exists a half and I am less than it," giving exactly <span>&#92;((0, \tfrac{1}{2})&#92;)</span>. General rational endpoints are reachable by similar tricks. But the interval <span>&#92;((0, \pi)&#92;)</span> requires naming <span>&#92;(\pi&#92;)</span> explicitly — one must work in the expanded language <span>&#92;(L_{\{\pi\}}&#92;)</span> to write <span>&#92;(0 < x \wedge x < \bar{\pi}&#92;)</span>.

The broader picture of definable sets in rings is laid out in Examples 4.31–4.34 of the notes:

*Example 4.31 (Algebraic sets).* In any commutative unitary ring <span>&#92;(\mathcal{R}&#92;)</span>, the common zero set of polynomials <span>&#92;(p_1, \ldots, p_\ell \in R[X_1, \ldots, X_n]&#92;)</span>,
<span>&#92;[V(p_1, \ldots, p_\ell) = \{\mathbf{a} \in R^n : p_1(\mathbf{a}) = \cdots = p_\ell(\mathbf{a}) = 0\},&#92;]</span>
is quantifier-free definable by the conjunction <span>&#92;(\bigwedge_i (p_i(x_1, \ldots, x_n) = 0)&#92;)</span>. These are called **algebraic sets** or Zariski-closed sets, and their finite Boolean combinations are the **Zariski-constructible sets** — which are exactly the quantifier-free definable sets in any commutative unitary ring.

*Example 4.32 (Ordering in <span>&#92;(\mathbb{R}&#92;)</span> is existentially definable).* In <span>&#92;((\mathbb{R}, 0, 1, +, -, \times)&#92;)</span>, the non-negative reals are defined by <span>&#92;(\exists z(z^2 = x)&#92;)</span> — a real number has a square root iff it is non-negative. Consequently, the ordering is recovered by <span>&#92;(x < y \iff \exists z ((z \neq 0) \wedge (y - x = z^2))&#92;)</span>. This is a quantifier-bearing formula, and it cannot be replaced by one without: the positive reals are not Zariski-constructible in one variable (they are infinite and co-infinite).

*Example 4.33 (Ordering in <span>&#92;(\mathbb{Z}&#92;)</span> via Lagrange).* By Lagrange's four-square theorem, every non-negative integer is a sum of four squares. Hence in <span>&#92;((\mathbb{Z}, 0, 1, +, -, \times)&#92;)</span>, the ordering is 0-definable: <span>&#92;(m < n \iff \exists z_1 z_2 z_3 z_4 ((z_1 \neq 0) \wedge (n - m = z_1^2 + z_2^2 + z_3^2 + z_4^2))&#92;)</span>.

### Automorphisms Preserve Definable Sets

The proposition below is one of the most useful tools for proving that sets are *not* definable. Its proof is a two-line unwinding of definitions, but its consequences are substantial.

**Lemma 4.37 (Automorphisms and definability).** *If <span>&#92;(X \subseteq M^n&#92;)</span> is <span>&#92;(B&#92;)</span>-definable and <span>&#92;(f&#92;)</span> is an <span>&#92;(L&#92;)</span>-automorphism of <span>&#92;(\mathcal{M}&#92;)</span> fixing every element of <span>&#92;(B&#92;)</span> pointwise, then <span>&#92;(f(X) = X&#92;)</span>.*

*Proof.* Write <span>&#92;(X = \{\mathbf{a} : \mathcal{M} \models \psi(\mathbf{a}, \mathbf{b})\}&#92;)</span> for an <span>&#92;(L&#92;)</span>-formula <span>&#92;(\psi&#92;)</span> and <span>&#92;(\mathbf{b} \in B&#92;)</span>. Since <span>&#92;(f&#92;)</span> is an isomorphism it is elementary (Corollary 4.24), so <span>&#92;(\mathcal{M} \models \psi(\mathbf{a}, \mathbf{b}) \iff \mathcal{M} \models \psi(f(\mathbf{a}), f(\mathbf{b}))&#92;)</span>. Since <span>&#92;(f&#92;)</span> fixes <span>&#92;(\mathbf{b}&#92;)</span>, this becomes <span>&#92;(\mathcal{M} \models \psi(\mathbf{a}, \mathbf{b}) \iff \mathcal{M} \models \psi(f(\mathbf{a}), \mathbf{b})&#92;)</span>, i.e., <span>&#92;(\mathbf{a} \in X \iff f(\mathbf{a}) \in X&#92;)</span>. <span>&#92;(\square&#92;)</span>

**Application 1 (The interval <span>&#92;((0,1)&#92;)</span> is not 0-definable in <span>&#92;((\mathbb{R}, <)&#92;)</span>).** The map <span>&#92;(j : x \mapsto x + 1&#92;)</span> is an automorphism of <span>&#92;((\mathbb{R}, <)&#92;)</span> — shifting by 1 is a bijection that preserves order. If <span>&#92;((0,1)&#92;)</span> were 0-definable, Lemma 4.37 with <span>&#92;(B = \emptyset&#92;)</span> would force <span>&#92;(j((0,1)) = (0,1)&#92;)</span>. But <span>&#92;(j((0,1)) = (1,2) \neq (0,1)&#92;)</span>. So <span>&#92;((0,1)&#92;)</span> is not 0-definable. (It is, of course, <span>&#92;(\{0,1\}&#92;)</span>-definable, as <span>&#92;(0 < x \wedge x < 1&#92;)</span>.)

**Application 2 (Addition is not definable in <span>&#92;((\mathbb{R}, <)&#92;)</span>).** The graph of addition <span>&#92;(\{(x, y, z) : x + y = z\} \subseteq \mathbb{R}^3&#92;)</span> is not definable in the pure ordering, even with parameters. Suppose it were definable with parameters <span>&#92;(b_1 < b_2 < \cdots < b_m&#92;)</span>. Choose <span>&#92;(c > b_m&#92;)</span> and define <span>&#92;(j&#92;)</span> to be the identity on <span>&#92;((-\infty, c]&#92;)</span> and <span>&#92;(x \mapsto c + \tfrac{x-c}{2}&#92;)</span> on <span>&#92;((c, \infty)&#92;)</span> (squeezing everything above <span>&#92;(c&#92;)</span> toward <span>&#92;(c&#92;)</span> by a factor of 2). This is an automorphism of <span>&#92;((\mathbb{R}, <)&#92;)</span> fixing all <span>&#92;(b_i&#92;)</span>. But it does not preserve the graph of addition: if <span>&#92;((c+1, c+1, 2c+2)&#92;)</span> is in the graph (and it is), then its image under <span>&#92;(j&#92;)</span> is <span>&#92;((c + \tfrac{1}{2}, c + \tfrac{1}{2}, c + 1)&#92;)</span>, and <span>&#92;((c + \tfrac{1}{2}) + (c + \tfrac{1}{2}) = 2c + 1 \neq c + 1&#92;)</span>. So the graph of addition is not in this set, contradiction.

This shows that the ordering of the reals, by itself, carries no information about the ring structure. The ring structure is genuinely extra data.

**Corollary 4.38 (<span>&#92;(\mathbb{R}&#92;)</span> is not definable in <span>&#92;(\mathbb{C}&#92;)</span>).** The field <span>&#92;(\mathbb{R}&#92;)</span> (as a subset of <span>&#92;(\mathbb{C}&#92;)</span>) is not definable in <span>&#92;((\mathbb{C}, 0, 1, +, -, \times)&#92;)</span>. Any would-be definition involves a finite parameter set <span>&#92;(B&#92;)</span>. Since <span>&#92;(\mathbb{C}&#92;)</span> has transcendence degree <span>&#92;(\geq 1&#92;)</span> over <span>&#92;(\mathbb{Q}(B)^{\mathrm{alg}}&#92;)</span>, one can construct an automorphism of <span>&#92;(\mathbb{C}&#92;)</span> fixing <span>&#92;(B&#92;)</span> but moving some element of <span>&#92;(\mathbb{R}&#92;)</span> outside <span>&#92;(\mathbb{R}&#92;)</span>. By Lemma 4.37, this contradicts definability.

The deeper reason is that <span>&#92;(\mathbb{C}&#92;)</span>, being algebraically closed, has many automorphisms (in fact <span>&#92;(2^{2^{\aleph_0}}&#92;)</span>-many over <span>&#92;(\mathbb{Q}&#92;)</span>), and these automorphisms act richly on transcendental elements. No first-order formula can pin down <span>&#92;(\mathbb{R}&#92;)</span> inside <span>&#92;(\mathbb{C}&#92;)</span> because the automorphism group is too large.

Finally, we record the general characterisation of definable sets in terms of closure operations:

**Proposition 4.40.** *The collection <span>&#92;(\mathrm{Def}(\mathcal{M})&#92;)</span> of all definable subsets of all Cartesian powers of <span>&#92;(M&#92;)</span> is the smallest collection closed under: graphs of basic functions and relations; diagonals <span>&#92;(\{(a_1,\ldots,a_n): a_i = a_j\}&#92;)</span>; products <span>&#92;(X \times M&#92;)</span>; Boolean operations; projections; and taking fibres <span>&#92;(X_\mathbf{b} = \{\mathbf{a}: (\mathbf{a},\mathbf{b}) \in X\}&#92;)</span>.*

---

## Lectures 24a & 24b: Algebraic and Semi-algebraic Sets

### The Geometry of Definable Sets in Rings

In Lectures 24a and 24b the professor stepped back to survey the landscape of definable sets in rings, asking a natural and far-reaching question: given a commutative unitary ring <span>&#92;(\mathcal{R} = (R, 0, 1, +, -, \times)&#92;)</span>, what are all its definable sets?

We have already identified the quantifier-free definable sets. An **algebraic set** is the common zero set of finitely many polynomials <span>&#92;(p_1, \ldots, p_\ell \in R[X_1, \ldots, X_n]&#92;)</span>:
<span>&#92;[V(p_1, \ldots, p_\ell) = \{\mathbf{a} \in R^n : p_1(\mathbf{a}) = \cdots = p_\ell(\mathbf{a}) = 0\}.&#92;]</span>
These form the closed sets of the **Zariski topology** on <span>&#92;(R^n&#92;)</span>. Their finite Boolean combinations are the **Zariski-constructible sets**. The key point (which uses the fact that <span>&#92;(L_R&#92;)</span>-terms in <span>&#92;(n&#92;)</span> variables agree precisely with polynomials in <span>&#92;(n&#92;)</span> variables over <span>&#92;(R&#92;)</span>, generalising the homework exercise on integer-coefficient terms) is:

**Fact.** *In any commutative unitary ring, the quantifier-free definable sets are exactly the Zariski-constructible sets.*

The argument: atomic <span>&#92;(L_R&#92;)</span>-formulas are of the form <span>&#92;(t(\mathbf{x}) = s(\mathbf{x})&#92;)</span> for terms <span>&#92;(t, s&#92;)</span>, i.e., <span>&#92;((t-s)(\mathbf{x}) = 0&#92;)</span> for a polynomial <span>&#92;(t - s&#92;)</span>. So the atomically definable sets are the hypersurfaces. Quantifier-free definable sets are Boolean combinations of hypersurfaces. By disjunctive normal form, every such Boolean combination can be written as a finite union <span>&#92;(\bigcup_i (V_i \setminus W_i)&#92;)</span> with <span>&#92;(W_i \subseteq V_i&#92;)</span> algebraic — exactly the constructible sets.

The definable sets in the ring language are at least as complex as the quantifier-free ones. The dramatic question is whether quantifiers can produce genuinely new sets. In two landmark cases, the answer is no:

### Algebraically Closed Fields: Tarski's Quantifier Elimination

**Theorem (Tarski, ACF).** *Every definable set in an algebraically closed field is quantifier-free definable, i.e., is Zariski-constructible.*

This is the statement that algebraically closed fields (ACF) admit **quantifier elimination**. It will be proved later in the course, using the algebraic theory of polynomials. Its practical import is that the definable sets in, say, <span>&#92;(\mathbb{C}&#92;)</span> (viewed as a ring) are exactly the Zariski-constructible sets — the very objects studied by algebraic geometry. From this perspective, algebraic geometry *is* the model theory of algebraically closed fields.

A striking corollary concerns one-dimensional definable sets:

**Corollary.** *Every definable subset of <span>&#92;(F&#92;)</span> (in one variable) in an algebraically closed field <span>&#92;(F&#92;)</span> is either finite or co-finite.*

This follows because the quantifier-free definable subsets of <span>&#92;(F^1&#92;)</span> are Boolean combinations of zero sets of univariate polynomials, and such a zero set is either all of <span>&#92;(F&#92;)</span> (the trivial polynomial) or a finite set (bounded by the degree). Boolean combinations of finite sets and <span>&#92;(F&#92;)</span> itself are finite or co-finite.

In contrast, take the real ring <span>&#92;((\mathbb{R}, 0, 1, +, -, \times)&#92;)</span>. The formula <span>&#92;(\exists y (y^2 = x)&#92;)</span> defines the non-negative reals — infinite and co-infinite, hence not Zariski-constructible. So the real ring does not have quantifier elimination. This is exactly as expected: the real numbers are *not* algebraically closed. The theorem of McIntyre (1970s) pins down exactly which rings admit QE:

**Theorem (McIntyre).** *A ring admitting quantifier elimination in the ring language is an algebraically closed field.*

So ACF is the complete answer for quantifier elimination in the ring language.

### Real Closed Fields: Semi-algebraic Sets

The real numbers are not algebraically closed, but they have a rich and well-behaved theory of their own. The key observation from Lecture 24a is that the ordering on <span>&#92;(\mathbb{R}&#92;)</span> is definable in the ring language: <span>&#92;(x < y \iff \exists z ((z \neq 0) \wedge (y - x = z^2))&#92;)</span>. This uses a quantifier and cannot be replaced by a quantifier-free formula (since the positive reals are not Zariski-constructible). But once we *add the ordering to the language*, making the structure <span>&#92;((\mathbb{R}, 0, 1, +, -, \times, <)&#92;)</span>, the ordering becomes atomic (it is now a basic relation symbol), and Tarski's second theorem applies:

**Theorem (Tarski, RCF).** *Every definable set in the ordered real field <span>&#92;((\mathbb{R}, 0, 1, +, -, \times, <)&#92;)</span> is quantifier-free definable in the ordered language.*

In the ordered ring language, the atomic formulas are either polynomial equalities <span>&#92;(p(\mathbf{x}) = 0&#92;)</span> or polynomial inequalities <span>&#92;(p(\mathbf{x}) > 0&#92;)</span>. The quantifier-free definable sets are therefore finite Boolean combinations of sets of the form <span>&#92;(\{p(\mathbf{x}) = 0\}&#92;)</span> or <span>&#92;(\{p(\mathbf{x}) > 0\}&#92;)</span>. Such sets are called **semi-algebraic sets**, and they are the central objects of **real algebraic geometry**.

The corollary for the ring language is:

**Corollary.** *Every definable set in <span>&#92;((\mathbb{R}, 0, 1, +, -, \times)&#92;)</span> is semi-algebraic.*

*Proof.* A set definable in the ring language is definable in the expanded ordered language (it is a bigger language). But in the ordered language, every definable set is quantifier-free definable by Tarski's theorem, hence semi-algebraic. <span>&#92;(\square&#92;)</span>

The ring language and the ordered ring language have the same definable sets (since the ordering is definable in the ring language), but different quantifier-free definable sets — this is the precise sense in which the ring language lacks quantifier elimination while the ordered ring language has it.

### The Big Picture

These two theorems — quantifier elimination for ACF and for RCF — give complete, geometric descriptions of definable sets in the two most important field structures in mathematics. In the algebraically closed case, the definable sets are exactly the algebraic geometry objects: algebraic varieties and their Boolean combinations. In the real closed case, they are the semi-algebraic sets, the objects of real algebraic geometry. Both are "tame" theories.

The contrast with the integers is instructive. In <span>&#92;((\mathbb{Z}, 0, 1, +, -, \times)&#92;)</span>, the definable sets are extraordinarily wild: by Gödel's work, all of mathematics can be encoded in the first-order theory of the integers, and there is provably no clean description of the definable sets. The integers are "wild." The miracle is that the two most natural continuous structures — <span>&#92;(\mathbb{C}&#92;)</span> and <span>&#92;(\mathbb{R}&#92;)</span> — happen to be tame.

---

## Lecture 25: Theories and Models

### Two Faces of Model Theory

Prof. Moosa opened the final lecture of this part of the course by observing that model theory has two complementary aspects. The first is geometric: fix a structure and study its definable sets, asking what can be said about a particular mathematical universe. This is the perspective of Lectures 21–24. The second is algebraic-logical: instead of fixing a structure, one looks at a *class* of structures sharing the same first-order properties, studying what can be said about the class as a whole. That second perspective is the subject of Lecture 25.

### Theories and Models

**Definition 4.42.** An **<span>&#92;(L&#92;)</span>-theory** <span>&#92;(T&#92;)</span> is any set of <span>&#92;(L&#92;)</span>-sentences. A **model** of <span>&#92;(T&#92;)</span> is an <span>&#92;(L&#92;)</span>-structure <span>&#92;(\mathcal{M}&#92;)</span> with <span>&#92;(\mathcal{M} \models \sigma&#92;)</span> for every <span>&#92;(\sigma \in T&#92;)</span>; write <span>&#92;(\mathcal{M} \models T&#92;)</span>. We denote the class of all models of <span>&#92;(T&#92;)</span> by <span>&#92;(\mathrm{Mod}(T)&#92;)</span>. The theory <span>&#92;(T&#92;)</span> is **consistent** if it has a model. A class <span>&#92;(\mathcal{K}&#92;)</span> of <span>&#92;(L&#92;)</span>-structures is **elementary** (or **axiomatisable**) if <span>&#92;(\mathcal{K} = \mathrm{Mod}(T)&#92;)</span> for some <span>&#92;(T&#92;)</span>.

Consistency here is the semantic notion: a theory is consistent if there is some mathematical universe in which all its sentences are simultaneously true. This differs from the proof-theoretic notion (no derivation of a contradiction), though Gödel's completeness theorem — which we do not prove in this course — says they coincide.

**Examples 4.43.** The following classes are all elementary.

- *Groups.* In the multiplicative language <span>&#92;(L = \{e, \cdot, {}^{-1}\}&#92;)</span>, the group axioms (associativity, identity, inverse) are sentences. So groups, abelian groups, and groups of fixed exponent <span>&#92;(n&#92;)</span> (add the sentence <span>&#92;(\forall x (x^n = e)&#92;)</span>) are all finitely axiomatisable. Torsion-free groups are axiomatisable by the infinite family <span>&#92;(\{\sigma_n\}_{n \geq 1}&#92;)</span>, where <span>&#92;(\sigma_n \equiv \forall x ((x^n = e) \to (x = e))&#92;)</span> says there is no <span>&#92;(n&#92;)</span>-torsion. Similarly, divisible groups are axiomatised by <span>&#92;(\{\tau_k\}_{k \geq 1}&#92;)</span>, where <span>&#92;(\tau_k \equiv \forall x \exists y (y^k = x)&#92;)</span>.

- *Rings and fields.* In <span>&#92;(L = \{0, 1, +, -, \times\}&#92;)</span>, rings, integral domains, fields, and algebraically closed fields (ACF) are all elementary. Being algebraically closed is expressed by sentences <span>&#92;(\forall a_0 \cdots \forall a_{n-1} \exists x (x^n + a_{n-1} x^{n-1} + \cdots + a_0 = 0)&#92;)</span>, one for each degree <span>&#92;(n \geq 1&#92;)</span>. ACF in characteristic <span>&#92;(p&#92;)</span> adds the sentence <span>&#92;(1 + \cdots + 1 = 0&#92;)</span> (<span>&#92;(p&#92;)</span> ones), and ACF in characteristic 0 adds <span>&#92;(\neg(1 + \cdots + 1 = 0)&#92;)</span> for each <span>&#92;(n \geq 1&#92;)</span>.

- *Linear orders.* In <span>&#92;(L = \{<\}&#92;)</span>, the theory of **dense linear orders without endpoints** (DLO) is axiomatised by the dense linear order axioms: irreflexivity, transitivity, totality, density (<span>&#92;(\forall x \forall y (x < y \to \exists z (x < z \wedge z < y))&#92;)</span>), and no endpoints (<span>&#92;(\forall x \exists y (y < x)&#92;)</span> and <span>&#92;(\forall x \exists y (x < y)&#92;)</span>).

- *Set theory.* In <span>&#92;(L = \{\in\}&#92;)</span>, the models of ZF form an elementary class.

Not every class is elementary. The class of torsion groups (every element has finite order) is *not* axiomatisable, despite being the complement of torsion-free groups in the class of groups. The reason is that there is no first-order sentence that says "there exists an element of some finite order, without bounding that order." One would need an infinite disjunction or a quantifier over the natural numbers — neither of which is available. Finite groups are likewise not an elementary class (for each fixed <span>&#92;(n&#92;)</span>, the class of groups of size <span>&#92;(n&#92;)</span> is elementary, but the class of all finite groups requires an infinite disjunction over <span>&#92;(n&#92;)</span>). The proofs that these classes are not elementary will follow from the Compactness Theorem.

### The Theory of a Structure and Elementary Equivalence

**Definition.** Given an <span>&#92;(L&#92;)</span>-structure <span>&#92;(\mathcal{M}&#92;)</span>, its **theory** is:
<span>&#92;[\mathrm{Th}(\mathcal{M}) = \{\sigma : \sigma \text{ an } L\text{-sentence}, \mathcal{M} \models \sigma\}.&#92;]</span>

This is the complete first-order description of <span>&#92;(\mathcal{M}&#92;)</span> — all sentences that are true in it. It is always infinite (one can always find new sentences), and it always includes the axioms of any class <span>&#92;(\mathcal{M}&#92;)</span> belongs to. For instance, <span>&#92;(\mathrm{Th}(\mathbb{Q}, 0, +, -)&#92;)</span> includes all the divisibility sentences <span>&#92;(\sigma_n&#92;)</span>, not just the group axioms.

**Definition 4.43.** Two <span>&#92;(L&#92;)</span>-structures <span>&#92;(\mathcal{M}&#92;)</span> and <span>&#92;(\mathcal{N}&#92;)</span> are **elementarily equivalent**, written <span>&#92;(\mathcal{M} \equiv \mathcal{N}&#92;)</span>, if <span>&#92;(\mathrm{Th}(\mathcal{M}) = \mathrm{Th}(\mathcal{N})&#92;)</span> — i.e., they satisfy exactly the same <span>&#92;(L&#92;)</span>-sentences. A theory <span>&#92;(T&#92;)</span> **entails** a sentence <span>&#92;(\sigma&#92;)</span>, written <span>&#92;(T \models \sigma&#92;)</span>, if <span>&#92;(\mathcal{M} \models \sigma&#92;)</span> for every <span>&#92;(\mathcal{M} \models T&#92;)</span>. A theory is **complete** if for every sentence <span>&#92;(\sigma&#92;)</span>, either <span>&#92;(T \models \sigma&#92;)</span> or <span>&#92;(T \models \neg\sigma&#92;)</span>.

**Lemma 4.44.**
- *(a)* For any <span>&#92;(\mathcal{M}&#92;)</span>, <span>&#92;(\mathrm{Th}(\mathcal{M})&#92;)</span> is a complete consistent theory.
- *(b)* A consistent theory <span>&#92;(T&#92;)</span> is complete iff all its models are elementarily equivalent, iff the consequences of <span>&#92;(T&#92;)</span> form <span>&#92;(\mathrm{Th}(\mathcal{M})&#92;)</span> for any <span>&#92;(\mathcal{M} \models T&#92;)</span>.
- *(c)* If <span>&#92;(j : \mathcal{M} \to \mathcal{N}&#92;)</span> is an elementary embedding then <span>&#92;(\mathcal{M} \equiv \mathcal{N}&#92;)</span>. In particular, isomorphic structures are elementarily equivalent.

Part (c) follows immediately from the <span>&#92;(n = 0&#92;)</span> case of the definition of elementary embedding. The converse of (c) is emphatically false in general: elementary equivalence is far weaker than the existence of an elementary embedding, which in turn is far weaker than isomorphism.

### Elementary Equivalence vs. Elementary Substructures

A common source of confusion is the relationship between elementary equivalence and elementary substructures. The professor gave a precise example to clarify.

Let <span>&#92;(\mathcal{M} = (\mathbb{N} \setminus \{0\}, <)&#92;)</span> (positive naturals with the usual ordering) and <span>&#92;(\mathcal{N} = (\mathbb{N}, <)&#92;)</span> (all naturals with the usual ordering). Then <span>&#92;(\mathcal{M}&#92;)</span> is a substructure of <span>&#92;(\mathcal{N}&#92;)</span> (purely relational language, so any subset is a substructure). Moreover, the map <span>&#92;(n \mapsto n - 1&#92;)</span> is an isomorphism from <span>&#92;(\mathcal{M}&#92;)</span> to <span>&#92;(\mathcal{N}&#92;)</span> (shifting back by one preserves order and is a bijection). Since isomorphisms are elementary embeddings, <span>&#92;(\mathcal{M} \equiv \mathcal{N}&#92;)</span>. Yet <span>&#92;(\mathcal{M} \not\prec \mathcal{N}&#92;)</span>, because <span>&#92;(\mathcal{N} \models \exists y (y < 1)&#92;)</span> (take <span>&#92;(y = 0&#92;)</span>) while <span>&#92;(\mathcal{M} \not\models \exists y (y < 1)&#92;)</span> (1 is the minimum of <span>&#92;(\mathcal{M}&#92;)</span>). The formula <span>&#92;(\exists y (y < 1)&#92;)</span> is an <span>&#92;(L_M&#92;)</span>-sentence (using the parameter 1 from <span>&#92;(M&#92;)</span>), not an <span>&#92;(L&#92;)</span>-sentence, and the two structures differ on it.

This illustrates the precise distinction: elementary equivalence concerns <span>&#92;(L&#92;)</span>-sentences; elementary substructure concerns <span>&#92;(L_M&#92;)</span>-sentences (with parameters from the smaller structure). These are genuinely different conditions. The clean characterisation is:

If <span>&#92;(\mathcal{M} \subseteq \mathcal{N}&#92;)</span>, then <span>&#92;(\mathcal{M} \prec \mathcal{N}&#92;)</span> if and only if <span>&#92;(\mathcal{M}_M \equiv \mathcal{N}_M&#92;)</span> as <span>&#92;(L_M&#92;)</span>-structures (naming all elements of <span>&#92;(M&#92;)</span>).

### Elementary Embeddings and Models of <span>&#92;(\mathrm{Th}(\mathcal{M}_M)&#92;)</span>

**Proposition 4.45.** *There exists an elementary embedding <span>&#92;(j : \mathcal{M} \hookrightarrow \mathcal{N}&#92;)</span> if and only if <span>&#92;(\mathcal{N}&#92;)</span> can be expanded to an <span>&#92;(L_M&#92;)</span>-structure that is a model of <span>&#92;(\mathrm{Th}(\mathcal{M}_M)&#92;)</span>.*

The proof shows how the two directions are inverse operations. Given <span>&#92;(j&#92;)</span>, expand <span>&#92;(\mathcal{N}&#92;)</span> to an <span>&#92;(L_M&#92;)</span>-structure <span>&#92;(\mathcal{N}'&#92;)</span> by interpreting each constant <span>&#92;(\bar{a}&#92;)</span> (for <span>&#92;(a \in M&#92;)</span>) as <span>&#92;(j(a)&#92;)</span>; the elementariness of <span>&#92;(j&#92;)</span> ensures <span>&#92;(\mathcal{N}' \models \mathrm{Th}(\mathcal{M}_M)&#92;)</span>. Conversely, given such an expansion <span>&#92;(\mathcal{N}'&#92;)</span>, define <span>&#92;(j(a) = \bar{a}^{\mathcal{N}'}&#92;)</span>; the fact that <span>&#92;(\mathcal{N}' \models \mathrm{Th}(\mathcal{M}_M)&#92;)</span> guarantees that <span>&#92;(j&#92;)</span> is an elementary embedding.

### Partial Elementary Maps

**Definition 4.47.** A **partial elementary map** (p.e.m.) from <span>&#92;(\mathcal{M}&#92;)</span> to <span>&#92;(\mathcal{N}&#92;)</span> is a function <span>&#92;(f : A \to N&#92;)</span> (with <span>&#92;(A \subseteq M&#92;)</span>, possibly empty) such that for all <span>&#92;(L&#92;)</span>-formulas <span>&#92;(\varphi(\mathbf{x})&#92;)</span> and <span>&#92;(\mathbf{a} \in A&#92;)</span>:
<span>&#92;[\mathcal{M} &#92;models &#92;varphi(\mathbf{a}) &#92;iff &#92;mathcal{N} &#92;models &#92;varphi(f(\mathbf{a})).&#92;]</span>
The empty function is a p.e.m. iff <span>&#92;(\mathcal{M} \equiv \mathcal{N}&#92;)</span>; a total p.e.m. is precisely an elementary embedding.

### Finite Structures Are Determined by Their Theory

**Proposition 4.46.** *If <span>&#92;(\mathcal{M}&#92;)</span> and <span>&#92;(\mathcal{N}&#92;)</span> are finite <span>&#92;(L&#92;)</span>-structures, then <span>&#92;(\mathcal{M} \equiv \mathcal{N} \iff \mathcal{M} \cong \mathcal{N}&#92;)</span>.*

*Proof.* One direction is Lemma 4.44(c): isomorphic structures are elementarily equivalent. For the converse: if <span>&#92;(\mathcal{M} \equiv \mathcal{N}&#92;)</span>, then in particular they satisfy the same sentences asserting their exact cardinality, so <span>&#92;(|M| = |N|&#92;)</span>. Enumerate <span>&#92;(M = \{a_1, \ldots, a_n\}&#92;)</span>. The conjunction of all atomic and negated atomic sentences true of <span>&#92;((a_1, \ldots, a_n)&#92;)</span> in <span>&#92;(\mathcal{M}&#92;)</span> is a single sentence which says precisely what the <span>&#92;(n&#92;)</span>-tuple looks like. By elementary equivalence, <span>&#92;(\mathcal{N}&#92;)</span> satisfies this sentence, so there is an <span>&#92;(n&#92;)</span>-tuple <span>&#92;((b_1, \ldots, b_n)&#92;)</span> in <span>&#92;(\mathcal{N}&#92;)</span> satisfying all the same atomic relations. Since <span>&#92;(|N| = n&#92;)</span>, this tuple is an enumeration of all of <span>&#92;(N&#92;)</span>, and the map <span>&#92;(a_i \mapsto b_i&#92;)</span> is an isomorphism. <span>&#92;(\square&#92;)</span>

The proposition shows that for finite structures, elementary equivalence collapses to isomorphism — there is nothing interesting to say. First-order logic completely determines finite structures, up to isomorphism. This is why model theory, properly speaking, is about infinite structures: it is only there that elementary equivalence and isomorphism genuinely diverge, and it is only there that the rich landscape of theories, types, and compactness arguments opens up.

### A Glance at What Lies Ahead

Lecture 25 is the last lecture of this portion of the course. The theorems proved in Lectures 21–25 — the Tarski-Vaught Test, Downward Löwenheim-Skolem, automorphism invariance of definable sets, quantifier elimination for algebraically closed and real closed fields (to be proved), the basic theory of elementary equivalence — form a coherent foundation. They show that first-order logic, despite its syntactic simplicity, is extraordinarily powerful as a tool for studying mathematical structures.

The chapters that lie beyond these lectures — compactness, the Upward Löwenheim-Skolem theorem, type spaces, quantifier elimination proofs, stability theory — develop this foundation into a full-fledged mathematical discipline. But the core ideas are all here: the way truth interacts with substructures, the way small witnesses can determine large-scale properties, the way automorphisms constrain definability. These themes run through all of modern model theory, from Tarski's early theorems to the geometric stability theory of the 21st century.

---

*These notes were compiled from Prof. Moosa's lecture recordings (Fall 2020) and the reference notes* modeltheory-notes-v5.pdf *by R. Moosa.*
