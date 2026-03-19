---
title: "PMATH 433/733 - Set Theory and Model Theory"
prof: "R. Moosa"
---
# Part I: Set Theory

## Lecture 1: First Axioms

The opening question of this course is deceptively simple: what is a natural number? In ordinary mathematics the natural numbers — \(0, 1, 2, 3, \ldots\) — are taken for granted. You learn them in school, you use them to count finite sets, and you never really pause to ask why they exist. You might have constructed the rationals from the integers, the reals from the rationals, and so on, but the natural numbers themselves usually go without explanation. In set theory, we want *everything* to be explained; nothing should go without justification. So this course begins, somewhat unusually, by building the natural numbers from scratch.

But this is not an end in itself. The deeper goal is to develop an **infinitary** analogue of the natural numbers — a framework for counting, ordering, and measuring infinite sets. The natural numbers serve two purposes: they let us *enumerate* (list or order) finite sets, and they let us *measure* the size of finite sets. For finite sets these two uses coincide; a list of five elements has exactly five elements. In the infinitary setting these two purposes diverge. One leads to **ordinals**, which allow us to enumerate and order infinite sets, and the other leads to **cardinals**, which allow us to measure the sizes of infinite sets. Developing ordinals and cardinals rigorously — so that we can do genuine set-theoretic computation — is the practical goal of Part I. Along the way, as Gödel's work in the twentieth century teaches us, we have to be careful about foundations: unchecked naïveté leads to contradictions.

### Building the Natural Numbers as Sets

We begin with two **undefined notions**: the notion of a **set**, and the binary relation of **membership**, written \(x \in y\). Intuitively a set is a collection of objects, but we leave this informal; what matters is that sets and membership are the raw material from which everything else is built.

With these notions in hand we can already sketch the construction. We define

\[0 := \emptyset, \quad 1 := \{0\}, \quad 2 := \{0, 1\}, \quad 3 := \{0, 1, 2\}, \quad \ldots\]

The pattern is clear: we go from \(n\) to its **successor** \(S(n) := n \cup \{n\}\), whose members are precisely the members of \(n\) together with \(n\) itself. Each natural number is thus the set of all the natural numbers before it.

This is elegant, but it immediately raises a question: *why do these sets exist?* We cannot construct a theory of mathematics on nothing. We need some unprovable starting points — **axioms** — and the axiomatic development of set theory is really just the discipline of keeping track of which assumptions we are making, even the very basic ones.

### The First Four Axioms

**Axiom 1 (Empty Set).** There exists a set \(\emptyset\) with no members.

Without this axiom there is no justification at all for the existence of \(0\). The empty set simply has to be declared to exist; there is no way to prove it from nothing.

**Axiom 2 (Pair Set).** For any sets \(x\) and \(y\) there exists a set \(\{x, y\}\) whose only members are \(x\) and \(y\).

Formally, \(t \in \{x, y\}\) if and only if \(t = x\) or \(t = y\). When \(x = y\) this gives the singleton \(\{x\}\), since both disjuncts reduce to \(t = x\).

**Axiom 3 (Extensionality).** Two sets are equal if and only if they have the same members: for all sets \(x, y\),
\[x = y \iff \forall t(t \in x \leftrightarrow t \in y).\]

This is not an existence axiom like the first two. It is instead an **equality axiom**: it tells us when two sets are the same. Without it we could not identify the singleton \(\{x,x\}\) obtained from the pair set axiom with \(\{x\}\). Both sets have exactly one member (namely \(x\), so extensionality forces them to be equal.

**Axiom 4 (Union Set).** For any set \(x\) there exists a set \(\bigcup x\) whose members are the members of the members of \(x\):
\[t \in \bigcup x \iff \exists y(y \in x \wedge t \in y).\]

Note the notation: we write \(\bigcup x\) with the union symbol *in front of* a single set, not between two sets. The union of \(x\) collects all the members of all members of \(x\). This is precisely what we need to pass from \(n\) to \(S(n)\): given that \(n\) and \(\{n\}\) both exist (the latter from the pair set axiom), we form the pair \(\{n, \{n\}\}\) and then take its union, obtaining \(n \cup \{n\} = S(n)\).

With these four axioms, every individual natural number can be proved to exist. Starting from \(0 = \emptyset\) (empty set axiom), we apply the pair set axiom twice and then the union set axiom to produce \(S(n)\) from \(n\), with extensionality confirming all identifications. So \(0, 1, 2, 3, \ldots\) all exist. But we do not yet have the **set** of all natural numbers.

### Definite Conditions

Before introducing more axioms, we must address a subtle constraint. Not just any statement can serve as an axiom; our existence axioms must have a specific form. We want to assert: *there exists a set \(n\) such that \(t \in n\) if and only if \(P(t)\)*, and the condition \(P\) must be what we call **definite**.

Why is this constraint necessary? Consider the naive attempt to axiomatize the set of natural numbers by saying: \(t \in \mathbb{N}\) iff \(t = 0\) or \(t = 1\) or \(t = 2\) or \(\cdots\). The dots here represent an infinite disjunction — and that is not allowed. As we will see rigorously later in the model theory portion of the course, a definite condition is a **first-order formula** in the language \(\{\in, =\}\). For now we adopt a working definition:

A **definite condition** is built up inductively from the **atomic conditions** \(x \in y\) and \(x = y\) by applying, in finitely many steps, the operations of **negation** (\(\neg P\), **conjunction** (\(P \wedge Q\), **disjunction** (\(P \vee Q\), **universal quantification** (\(\forall x,P\), and **existential quantification** (\(\exists x,P\).

The key phrase is *finitely many steps*. An infinite disjunction \(t = 0 \vee t = 1 \vee t = 2 \vee \cdots\) is therefore **not** a definite condition, no matter how natural it seems. This technical constraint prevents paradoxes, and it is exactly the constraint that motivates the subsequent axioms.

We also note that *implication* \(P \Rightarrow Q\) is definite (it abbreviates \(\neg P \vee Q\), and *biconditional* \(P \leftrightarrow Q\) is definite as well. We can verify that all four axioms introduced so far — empty set, pair set, union set, extensionality — do indeed use only definite conditions, as the professor confirms at the start of Lecture 2.

---

## Lecture 2a: Natural Numbers (Part 1)

Returning to where we left off, we verify that the existential axioms stated in Lecture 1 all involve definite conditions. The **empty set axiom** asserts the existence of a set satisfying \(\neg \exists y(y \in \emptyset)\) — a negation of an existential, hence definite. The **pair set axiom** characterises \(\{x,y\}\) by: \(\forall t(t \in \{x,y\} \leftrightarrow t = x \vee t = y)\) — built from equality and membership by disjunction and quantification, hence definite. The **union set axiom** uses \(\exists y(y \in x \wedge t \in y)\) — also definite.

### The Infinity Axiom

The four axioms so far can produce each individual natural number, but they cannot produce the **set** of all natural numbers. To get that, the key insight is to characterize \(\omega\) not by listing its elements, but by its **inductive property**: it is the *smallest* set containing \(0\) and closed under the successor operation. This characterization *can* be expressed with a definite condition.

Call a set \(I\) **inductive** if \(0 \in I\) and for all \(x\), if \(x \in I\) then \(S(x) \in I\). The condition of being inductive is definite: saying that \(S(x) \in I\) is a definite condition on \(x\) and \(I\), because one can spell out that there exists a \(y \in I\) such that \(\forall t(t \in y \leftrightarrow t \in x \vee t = x)\).

**Axiom 5 (Infinity).** There exists an inductive set \(I\), i.e., a set satisfying:
\[0 \in I \quad \text{and} \quad \forall x(x \in I \Rightarrow S(x) \in I).\]

This is the first existence axiom that does not uniquely determine its set. The empty set was unique by extensionality; the pair set and union set were each uniquely determined by their defining membership condition. But the infinity axiom merely says *some* inductive set exists — there may be many. An inductive set might contain many "extra" elements beyond the natural numbers. We want the *smallest* inductive set.

### The Power Set and Separation Axioms

To extract the minimal inductive set from a given inductive set \(I\), we need two further axioms. First, we need to talk about the *subsets* of \(I\); then we need to isolate among them the *inductive* subsets.

**Axiom 6 (Power Set).** For any set \(A\) there exists a set \(\mathcal{P}(A)\) whose members are exactly the subsets of \(A\):
\[t \in \mathcal{P}(A) \iff \forall y(y \in t \Rightarrow y \in A).\]

This is again a definite membership condition, so the set it produces is uniquely determined by extensionality.

**Axiom 7 (Bounded Separation).** For any set \(A\) and definite condition \(P\), there exists a set
\[B = \{t \in A : P(t)\}\]
whose members are exactly those elements of \(A\) satisfying \(P\).

Two aspects of this axiom are essential. First, \(P\) must be definite — the axiom cannot be used with an infinitary or otherwise ill-formed condition. Second, the axiom is *bounded*: it does not assert the existence of all objects satisfying \(P\) in the universe, only those within the given set \(A\). This boundedness is not a mere technicality; it is what prevents **Russell's Paradox**.

### Russell's Paradox

If we allowed **unbounded** separation — if we could take any definite condition \(P\) and form the collection of *all* sets satisfying \(P\) — we could define:
\[R := \{t : t \notin t\}.\]
This is the **Russell class**: the collection of all sets that are not members of themselves. The condition \(t \notin t\) is definite (a negation of a basic membership condition), so unbounded separation would make \(R\) a set. But then: is \(R \in R\)? If yes, then \(R\) does not satisfy \(t \notin t\), so \(R \notin R\) — a contradiction. If no, then \(R\) does satisfy the condition, so \(R \in R\) — also a contradiction. The boundedness of our Separation Axiom avoids this: \(R\) simply does not exist as a set, because no axiom asserts it. (It will reappear as a proper *class* in Lecture 3.)

### Constructing \(\omega\)

With axioms 1–7 we can now construct the set of natural numbers. Note first that intersections do not require a new axiom: given a *non-empty* set \(x\), we can form
\[\bigcap x := \{t \in \bigcup x : \forall y(y \in x \Rightarrow t \in y)\}\]
using only bounded separation (the bound being \(\bigcup x\) — so intersections are free. (The empty intersection does not exist as a set, for good reason: it would have to contain every set in the universe.)

**Definition 1.9.** Fix an inductive set \(I\) (which exists by Axiom 5). Define
\[\omega := \bigcap \{J \in \mathcal{P}(I) : 0 \in J \text{ and } \forall x(x \in J \Rightarrow S(x) \in J)\}.\]

This is the intersection of all *inductive* subsets of \(I\). The set \(\mathcal{P}(I)\) exists by Axiom 6, and the collection of inductive subsets of \(I\) is obtained from it by bounded separation (Axiom 7) using the definite condition of being inductive. The intersection is non-empty (it contains \(I\) itself) and exists as shown above.

Why is this \(\omega\)? Intuitively: every inductive subset of \(I\) must contain \(0\), and is closed under successors, so their intersection is itself inductive and contains only what it is *forced* to contain. The extraneous elements from \(I\) are removed by intersecting.

Moreover, \(\omega\) is independent of the choice of \(I\): if \(I\) and \(I'\) are both inductive sets, the corresponding intersections are equal. This is a good exercise using the definition directly.

The **induction principle** follows immediately from the definition: if \(J \subseteq \omega\) is inductive (contains \(0\) and is closed under successors), then \(J = \omega\). For \(J\) is an inductive subset of \(I\) (since \(\omega \subseteq I\), so \(\omega \subseteq J\) by definition of \(\omega\) as the intersection.

---

## Lecture 2b: Natural Numbers (Part 2)

### The Replacement Axiom

There is one more axiom that did not arise in the construction of \(\omega\) but is essential for later work with ordinals and cardinals.

**Axiom 8 (Replacement).** Suppose \(P(x, y)\) is a definite binary condition that is **functional**: for every set \(x\) there is a unique set \(y\) such that \(P(x, y)\). Then for any set \(A\), there exists a set
\[B = \{y : \exists x \in A,\, P(x, y)\}.\]

In other words, the **image** of any set under any definite operation is again a set. The name is apt: we start with a set \(A\) and *replace* each element \(x \in A\) with \(f(x)\); the resulting collection forms a set. This will be used, for instance, to form the set of ordinals \(\{f(\alpha) : \alpha \in A\}\) when \(f\) is a definite operation on ordinals.

These eight axioms together constitute **Zermelo-Fraenkel set theory**, denoted **ZF**. (In the literature one also finds a ninth axiom, **Regularity** or Foundation, asserting that every non-empty set has a membership-minimal element. We will not assume Regularity; it turns out to be unnecessary for the development of ordinals and cardinals pursued here.) The remarkable fact — and the punchline of these two lectures — is that all of modern mathematics can be developed within this framework. What seemed at first like a growing list of ad hoc axioms, each thrown in to solve a specific obstruction in the construction of \(\omega\), turns out to be a complete and sufficient foundation.

---

## Lecture 3: Classes and Definite Operations

### Classes

Now that we have the Zermelo-Fraenkel axioms in place, we can step back and think more carefully about the collections we are implicitly dealing with. When we proved Russell's Paradox showed that \(R = \{t : t \notin t\}\) is not a set, we did not mean that such a collection is meaningless — only that it is not a *set* in the sense of our axioms. Collections that may be too large to be sets deserve their own name.

A **class** is, informally, a collection of sets satisfying some definite property. More precisely: if \(P\) is a definite condition, then the class
\[\llbracket z : P(z) \rrbracket\]
is the collection of all sets satisfying \(P\). A class is really just another way of talking about the definite condition itself. We use the double-bracket notation (rather than curly braces) to emphasize that this need not be a set.

Several basic observations follow. First, **every set is a class**: given a set \(X\), we can view it as the class \(\llbracket z : z \in X \rrbracket\), using the membership condition \(z \in X\) which is definite. Second, some classes are sets and some are not. The class \(\llbracket z : z \in \omega \rrbracket\) is just \(\omega\) itself — a set. But the **Russell class** \(R = \llbracket z : z \notin z \rrbracket\) is not a set (as we proved), and is called a **proper class**.

The **universal class**
\[U := \llbracket z : z = z \rrbracket\]
— the collection of all sets — is also a proper class. Why? If \(U\) were a set, then \(R = \{t \in U : t \notin t\}\) would exist by bounded separation, contradicting Russell's Paradox. In fact, if \(U\) were a set, every class would be a set (by bounding each class with \(U\), so the existence of even one proper class forces \(U\) to be proper.

Two classes are equal if and only if they have the same members — this is the extension principle for classes, analogous to the extensionality axiom for sets. **Membership** for classes is a binary relation between a *set* and a *class*: we write \(x \in C\) when \(x\) is a set and \(C\) is a class. It makes no sense to ask whether a class is a member of another class — this is not ill-formed by accident; it is precisely what prevents a class-level version of Russell's Paradox. Since membership does not relate classes to classes, one cannot even formulate the question "is the class \(C\) a member of itself?"

### Ordered Pairs and Cartesian Products

Before restating the Replacement Axiom in its cleanest form, we need the machinery of ordered pairs and functions. Given sets \(x\) and \(y\), the **ordered pair** is defined as
\[(x, y) := \{\{x\}, \{x, y\}\}.\]

This set exists by the pair set axiom applied twice. The crucial property is:
\[(x, y) = (x', y') \iff x = x' \text{ and } y = y'.\]
This distinguishes ordered pairs from unordered pairs: \(\{1, 2\} = \{2, 1\}\) as sets, but \((1, 2) \neq (2, 1)\) as ordered pairs (assuming \(1 \neq 2\).

Given classes \(X\) and \(Y\), the **Cartesian product** \(X \times Y\) is the class of all ordered pairs \((x, y)\) with \(x \in X\) and \(y \in Y\). This is a class because the condition of being an ordered pair of elements from definite classes is itself definite. When \(X\) and \(Y\) happen to be sets, \(X \times Y\) is also a set: every ordered pair \((x, y)\) is an element of \(\mathcal{P}(\mathcal{P}(X \cup Y))\), so one can bound the separation and apply Axiom 7.

A key observation about classes and sets: **a subclass of a set is a set**. If \(B\) is a set and \(A \subseteq B\) is a class, then \(A\) is also a set. The reason: since \(A \subseteq B\), the unbounded class definition of \(A\) can be replaced by the bounded form \(A = \{t \in B : P(t)\}\), which is a set by Axiom 7.

### Definite Operations

A **definite operation** \(f : X \to Y\) between classes \(X\) and \(Y\) is, formally, a subclass \(\Gamma_f \subseteq X \times Y\) — the *graph* of \(f\) — satisfying the **vertical line test**: for every \(x \in X\) there is a unique \(y \in Y\) such that \((x, y) \in \Gamma_f\). We call it "definite" because \(\Gamma_f\) must be defined by a definite condition (i.e., it is a class). We write \(f(x) = y\) as notation for \((x, y) \in \Gamma_f\). When \(X\) and \(Y\) are sets, the graph \(\Gamma_f\) is a set (as a subclass of the set \(X \times Y\), and \(f\) is simply a **function**.

A prototypical example of a definite operation with a proper-class domain is the **successor function** \(S : U \to U\), defined by \(S(x) = x \cup \{x\}\). Its graph is the class of pairs \((x, y)\) such that \(\forall t(t \in y \leftrightarrow t \in x \vee t = x)\) — a definite condition. The domain is the class of all sets; no single set can bound it.

### Replacement Restated

With this language of classes and definite operations, the Replacement Axiom can be stated much more cleanly: **if \(f : U \to U\) is a definite operation and \(A\) is a set, then the image \(f[A] = \{f(a) : a \in A\}\) is a set.** The set \(f[A]\) is characterized by: \(y \in f[A] \iff \exists a \in A,\, y = f(a)\), which is a definite condition, so this is a legitimate existence assertion.

---

## Lecture 4: Ordering the Natural Numbers

### The Induction Principle in Action

We have constructed \(\omega\) and observed that it satisfies the induction principle. Now we put induction to work by establishing a series of structural properties of the natural numbers. The strategy in each proof is the same: define \(J\) to be the set of natural numbers satisfying the desired property (using bounded separation, with \(\omega\) as the bound), prove that \(J\) is inductive, and conclude by the induction principle that \(J = \omega\).

**Lemma 1.12.** *For any \(n \in \omega\):*
*(a) every element of \(n\) is an element of \(\omega\);*
*(b) every element of \(n\) is a subset of \(n\);*
*(c) \(n \notin n\);*
*(d) either \(n = 0\) or \(0 \in n\);*
*(e) if \(y \in n\) then either \(S(y) \in n\) or \(S(y) = n\).*

*Proof of (a).* Let \(J = \{n \in \omega : n \subseteq \omega\}\) (those natural numbers that are subsets of \(\omega\). We check \(J\) is inductive. Base case: \(0 = \emptyset \subseteq \omega\) since the empty set is a subset of every set, so \(0 \in J\). Inductive step: suppose \(n \in J\), so \(n \subseteq \omega\) and \(n \in \omega\). Then \(S(n) = n \cup \{n\}\): its elements are either elements of \(n\) (which are in \(\omega\) since \(n \subseteq \omega\) or equal to \(n\) itself (which is in \(\omega\). So \(S(n) \subseteq \omega\), i.e., \(S(n) \in J\). By induction, \(J = \omega\). \(\square\)

*Proof of (b).* Let \(J = \{n \in \omega : \forall x \in n,\, x \subseteq n\}\). Base case: \(0\) satisfies the condition vacuously. Inductive step: suppose \(n \in J\) and let \(x \in S(n) = n \cup \{n\}\). Either \(x = n\), in which case \(x = n \subseteq S(n)\) (since \(n \subseteq S(n)\) by construction); or \(x \in n\), in which case \(x \subseteq n\) (since \(n \in J\) and \(n \subseteq S(n)\), so \(x \subseteq S(n)\). Thus \(S(n) \in J\), and by induction \(J = \omega\). \(\square\)

Parts (c), (d), and (e) are all proved by similar induction arguments, which the professor sketches in lecture and which have full details in the written notes.

Note how striking part (b) is: the elements of any natural number are also subsets of it. This conflation of membership and inclusion — of "being in" and "being contained in" — is a special feature of our set-theoretic construction of the natural numbers, and it will be the key to defining ordinals.

### Strict Partial Orderings and Well-Orderings

Before we can describe the ordering on \(\omega\) induced by membership, we pause to fix the relevant definitions. A **strict partial ordering** on a set \(E\) is a binary relation \(R\) satisfying:

1. *Antireflexivity*: \(\neg(x R x)\) for all \(x \in E\).
2. *Antisymmetry*: if \(x R y\) and \(y R x\) then \(x = y\).
3. *Transitivity*: if \(x R y\) and \(y R z\) then \(x R z\).

A strict partial ordering is **linear** (or **total**) if for all \(x, y \in E\), at least one of \(x R y\), \(x = y\), \(y R x\) holds. A linear ordering is a **well-ordering** if every non-empty subset of \(E\) has a least element (i.e., an element related to all others).

**Proposition 1.13.** *\((\omega, \in)\) is a strictly linearly ordered set.*

*Proof.* Antireflexivity is Lemma 1.12(c). For antisymmetry, suppose \(n \in m\) and \(m \in n\). By Lemma 1.12(b), \(n \in m\) implies \(n \subseteq m\), and \(m \in n\) implies \(m \subseteq n\). By extensionality, \(n = m\). For transitivity, if \(l \in m\) and \(m \in n\), then Lemma 1.12(b) gives \(m \subseteq n\), so \(l \in n\). Linearity is proved by induction: fix \(n \in \omega\) and let \(J\) be the set of all \(m \in \omega\) satisfying \(m \in n\) or \(m = n\) or \(n \in m\). One verifies (using parts (d) and (e) of Lemma 1.12) that \(J\) is inductive, so \(J = \omega\). \(\square\)

The fact that *membership* is the ordering relation here is philosophically striking. In ordinary mathematics we are given a set and then an ordering is imposed on it from outside. Here the ordering is intrinsic to the very structure of the natural numbers as sets.

---

## Lecture 5a: Ordinals (Part 1)

### Well-Ordering \(\omega\)

Linear ordering alone is not enough — what we really want, and what enables transfinite induction, is a **well-ordering**. The key additional property is:

**Proposition 1.13 (continued).** *\((\omega, \in)\) is a strict well-ordering.*

*Proof.* We must show that every non-empty \(X \subseteq \omega\) has a membership-least element. Suppose for contradiction that \(X\) has no membership-least element. Define
\[J = \{n \in \omega : S(n) \cap X = \emptyset\}\]
by bounded separation. We show \(J\) is inductive, hence \(J = \omega\), and then derive that \(X = \emptyset\).

*Base case*: \(0 \in J\). If not, then \(S(0) \cap X \neq \emptyset\). But \(S(0) = 1 = \{0\}\), so \(0 \in X\). By Lemma 1.12(d), every natural number either is \(0\) or contains \(0\), so \(0\) is membership-least in all of \(\omega\), and hence membership-least in \(X\) — contradicting our assumption.

*Inductive step*: suppose \(n \in J\), i.e., \(S(n) \cap X = \emptyset\). We want \(S(S(n)) \cap X = \emptyset\). An element of \(S(S(n))\) is either in \(S(n)\) or equals \(S(n)\). By hypothesis no element of \(S(n)\) is in \(X\). If \(S(n) \in X\), then since every element of \(S(n)\) is outside \(X\), the element \(S(n)\) would be membership-least in \(X\) — a contradiction. So \(S(n) \notin X\) and \(S(S(n)) \cap X = \emptyset\), giving \(S(n) \in J\).

By induction \(J = \omega\). For any \(n \in \omega\), we have \(n \in S(n)\), and since \(S(n) \cap X = \emptyset\), it follows that \(n \notin X\). Thus \(X = \emptyset\). \(\square\)

We have now established that \(\omega\), with its membership ordering, behaves exactly as our pre-theoretic picture of the natural numbers suggests: it is a strict well-ordering. The ordering is not imposed from outside; it is encoded in the very set-membership structure of the construction. This is our intuition vindicated.

### Defining Ordinals

With the natural numbers in hand and their membership well-ordering proved, we abstract the two key properties of \(\omega\) that drove everything:

(1) Every element of \(\omega\) is a subset of \(\omega\) — Lemma 1.12(a) and (b).

(2) The membership relation is a well-ordering on \(\omega\) — Proposition 1.13.

**Definition 1.14.** An **ordinal** is a set \(\alpha\) satisfying:
1. Every member of \(\alpha\) is a subset of \(\alpha\).
2. The membership relation \(\in\) is a strict well-ordering on \(\alpha\).

When working with elements of an ordinal, we write \(x < y\) as notation for \(x \in y\). This is purely notational; the underlying relation is always membership. The class of all ordinals is denoted \(\mathrm{Ord}\).

What is unusual about this definition is what it does *not* say: an ordinal is not defined as an ordered set with some extra structure given from outside. It is just a set, with conditions on its internal membership structure. Condition (1) is often called **transitivity** (as a set, \(\alpha\) is "transitive": elements of elements are elements). Condition (2) says the membership relation provides a well-ordering for free.

The first examples are:

- Every natural number \(n \in \omega\) is an ordinal. Condition (1) is Lemma 1.12(b). Condition (2) follows because \(n \subseteq \omega\) (by Lemma 1.12(a)), and well-ordering is inherited by subsets: if \((E, <)\) is a well-ordering and \(F \subseteq E\), then \((F, <)\) is also a well-ordering (all the axioms being universal statements or about subsets of \(F\).

- \(\omega\) itself is an ordinal, by Proposition 1.13 and Lemma 1.12(a).

We call the natural numbers the **finite ordinals**. The ordinal \(\omega\) is the first *infinite* ordinal. Many more ordinals await.

---

## Lecture 5b: Ordinals (Part 2)

### Ordinal Subsets and a Key Lemma

We have observed that every *element* of an ordinal is a *subset*. Is the converse true — is every subset of an ordinal also an element? Not in general: one can produce subsets of \(\omega\) (e.g., the set of even natural numbers) that are not natural numbers, hence not elements of \(\omega\). However, if the subset is itself an ordinal, it must be an element:

**Lemma 1.16.** *If \(\alpha\) and \(\beta\) are ordinals with \(\alpha \subsetneq \beta\), then \(\alpha \in \beta\).*

*Proof.* The proof beautifully illustrates how the well-ordering structure of \(\beta\) and the transitivity property of \(\alpha\) interact. Let \(D = \beta \setminus \alpha\). Since \(\alpha \subsetneq \beta\), we have \(D \neq \emptyset\). The set \(D\) exists by bounded separation (bounded by \(\beta\) and is a non-empty subset of \(\beta\). Since \(\beta\) is an ordinal, its membership relation is a well-ordering, so \(D\) has a least element; call it \(d\).

*Claim*: \(\alpha = d\). We prove two inclusions.

\(d \subseteq \alpha\): Suppose for contradiction there exists \(x \in d \setminus \alpha\). Then \(x \in d \subseteq \beta\\) and \(x \notin \alpha\), so \(x \in D\). But \(d \in \beta\) is an ordinal (as a member of an ordinal; we leave this property to Proposition 1.17(a)), so \(x \in d\) implies \(x \subseteq d\), i.e., \(x < d\) in \(\beta\). This contradicts \(d\) being least in \(D\).

\(\alpha \subseteq d\): Take any \(x \in \alpha\). Both \(x\) and \(d\) are elements of \(\beta\), so by linearity of the ordering on \(\beta\), either \(x < d\), \(x = d\), or \(d < x\). We rule out the last two. If \(x = d\), then \(d \in \alpha\), contradicting \(d \in D = \beta \setminus \alpha\). If \(d < x\), i.e., \(d \in x\): since \(\alpha\) is an ordinal and \(x \in \alpha\), condition (1) of the ordinal definition gives \(x \subseteq \alpha\). So \(d \in x \subseteq \alpha\), giving \(d \in \alpha\) — again contradicting \(d \in D\). (Note: this is the one place where we use that \(\alpha\) is an ordinal, not merely a subset of \(\beta\). Without this, one could mistake "transitivity" for a ready-made application, but \(\alpha\) is not known to be in \(\beta\) — that is exactly what we are proving.) Therefore \(x < d\), i.e., \(x \in d\).

We have shown \(\alpha = d \in \beta\). \(\square\)

A beautiful consequence: an ordinal \(\alpha\) equals the set of all ordinals strictly less than it. This "self-reflexive" property — that \(\alpha\) is the least element of \(\beta \setminus \alpha\) — gives ordinals a remarkably canonical structure.

### Further Properties of Ordinals

The following propositions collect the essential structural facts. Their proofs use Lemma 1.16 together with the definitions.

**Proposition 1.17.**
*(a) Every member of an ordinal is an ordinal.*
*(b) No ordinal is a member of itself.*
*(c) If \(\alpha \in \mathrm{Ord}\), then its **successor** \(S(\alpha) := \alpha \cup \{\alpha\}\) is an ordinal.*
*(d) The intersection of two ordinals is an ordinal.*

**Proposition 1.18.**
*(a) For any \(\alpha, \beta \in \mathrm{Ord}\), exactly one of \(\alpha \in \beta\), \(\alpha = \beta\), \(\beta \in \alpha\) holds (trichotomy).*
*(b) Every set of ordinals is strictly well-ordered by \(\in\).*
*(c) If \(E \subseteq \mathrm{Ord}\) is a set, then \(\sup E := \bigcup E\) is an ordinal.*
*(d) \(\mathrm{Ord}\) is a proper class.*

Part (d) deserves comment. We already know that \(\mathrm{Ord}\) is a class — being an ordinal is a definite condition (all the requirements of Definition 1.14 can be expressed as first-order formulas). But \(\mathrm{Ord}\) cannot be a set, for if it were, it would itself be an ordinal (by part (b), it is a transitive class well-ordered by membership), and then \(\mathrm{Ord} \in \mathrm{Ord}\), contradicting part (b). This is the **Burali-Forti paradox**, resolved here by recognizing that \(\mathrm{Ord}\) is a proper class.

### Successor and Limit Ordinals

**Lemma 1.20.**
*(a) There is no ordinal strictly between \(\alpha\) and \(S(\alpha)\).*
*(b) If \(E \subseteq \mathrm{Ord}\) is a nonempty set, then \(\sup E = \bigcup E\) is the least upper bound of \(E\).*
*(c) For every set of ordinals \(E\), there is a least ordinal not in \(E\).*

Part (a) says the successor operation has no gaps: \(S(\alpha)\) is the *immediate* successor of \(\alpha\) in the ordering on \(\mathrm{Ord}\). This mirrors the familiar fact that there is no natural number between \(n\) and \(n+1\).

**Definition 1.21.** An ordinal \(\alpha\) is a **successor ordinal** if \(\alpha = S(\beta)\) for some ordinal \(\beta\). An ordinal that is not a successor is a **limit ordinal**.

The ordinal \(0 = \emptyset\) is a limit ordinal — vacuously, since there is no \(\beta\) such that \(0 = S(\beta)\). The natural numbers \(1, 2, 3, \ldots\) are all successor ordinals. The ordinal \(\omega\) is the smallest **infinite** limit ordinal: it has no immediate predecessor among the ordinals, and every finite ordinal is a proper initial segment of \(\omega\). Beyond \(\omega\) lie \(\omega + 1 = S(\omega)\), \(\omega + 2\), and so on — the transfinite ordinals that will occupy our next set of lectures.

The central insight of Part I can be summarized as follows. We began with nothing but undefined notions of set and membership, introduced eight axioms motivated solely by the desire to construct the natural numbers, and have arrived at a rich and canonical hierarchy of well-ordered sets — the ordinals — that will serve as the backbone for all transfinite arithmetic to come.
## Lecture 6: Ordering the Ordinals

Where were we? In the previous lecture the ordinals were introduced and defined: a set \(\alpha\) is an **ordinal** if every element of \(\alpha\) is a subset of \(\alpha\) (the *transitivity* condition), and the membership relation restricts to a strict well-ordering on \(\alpha\). The prototype was \(\omega\), the set of natural numbers, and we saw that these two conditions are modelled precisely on what \(\omega\) satisfies. Today we establish further properties of ordinals (Proposition 1.17 in the notes), culminating in the result that ordinals are *linearly ordered* by membership and that the class \(\mathrm{Ord}\) of all ordinals is itself a proper class.

**Proposition 1.17.** *(a) Every member of an ordinal is an ordinal. (b) No ordinal is a member of itself. (c) If \(\alpha \in \mathrm{Ord}\) then \(S(\alpha) = \alpha \cup \{\alpha\}\) is an ordinal. (d) If \(\alpha, \beta \in \mathrm{Ord}\) then \(\alpha \cap \beta\) is an ordinal.*

For part (a), suppose \(\alpha\) is an ordinal and \(z \in \alpha\). We need to show \(z\) is an ordinal. First, since \(z \in \alpha\) and every member of an ordinal is a subset, \(z \subseteq \alpha\), so any \(x \in z\) also lies in \(\alpha\). Similarly, any \(y \in x\) lies in \(\alpha\). Since \(x, y, z \in \alpha\) and \(\alpha\) is strictly well-ordered by membership, transitivity gives \(y \in z\), verifying that every element of \(z\) is a subset. The second condition — that membership well-orders \(z\) — is immediate, because \(z \subseteq \alpha\) and the property of being a strict well-ordering is preserved by passing to subsets. Parts (c) and (d) are left as exercises; the key ideas are that \(\alpha \cup \{\alpha\}\) and \(\alpha \cap \beta\) each satisfy the two defining conditions for an ordinal.

For part (b), suppose for contradiction that \(\alpha \in \alpha\). Then \(\alpha\) is a member of itself, so anti-reflexivity of the strict well-ordering on \(\alpha\) applies to \(\alpha\), giving \(\alpha \notin \alpha\). This is the desired contradiction.

**Proposition 1.18.** *(a) Any two ordinals \(\alpha, \beta\) satisfy exactly one of \(\alpha = \beta\), \(\alpha \in \beta\), or \(\beta \in \alpha\). (b) Every set of ordinals is strictly well-ordered by membership. (c) If \(E\) is a set of ordinals then \(\sup E := \bigcup E\) is an ordinal. (d) \(\mathrm{Ord}\) is a proper class.*

For part (a), consider \(\alpha \cap \beta\), which is an ordinal by 1.17(d) and a subset of both \(\alpha\) and \(\beta\). By Lemma 1.16 (proved in the previous lecture), a proper ordinal subset of an ordinal must be a *member* of that ordinal. Suppose \(\alpha \cap \beta \neq \alpha\) and \(\alpha \cap \beta \neq \beta\). Then the intersection is a proper subset of each, so \(\alpha \cap \beta \in \alpha\) and \(\alpha \cap \beta \in \beta\), hence \(\alpha \cap \beta \in \alpha \cap \beta\). But no ordinal is a member of itself — contradiction. So either \(\alpha \cap \beta = \alpha\), meaning \(\alpha \subseteq \beta\), or \(\alpha \cap \beta = \beta\), meaning \(\beta \subseteq \alpha\). In the first case \(\alpha = \beta\) or \(\alpha \in \beta\) by Lemma 1.16; in the second, \(\beta = \alpha\) or \(\beta \in \alpha\). This yields exactly the trichotomy.

Part (b) says membership is a strict well-ordering on any *set* \(E\) of ordinals. Anti-reflexivity holds because no ordinal is a member of itself; transitivity holds because \(\beta \in \gamma\) implies \(\beta \subseteq \gamma\) (since \(\gamma\) is an ordinal), so \(\alpha \in \beta \in \gamma\) gives \(\alpha \in \gamma\); linearity is part (a). For well-foundedness: given a non-empty subset \(A \subseteq E\), pick any \(\alpha \in A\). If \(\alpha \cap A = \emptyset\) then \(\alpha\) is already least. Otherwise \(\alpha \cap A\) is a non-empty subset of the ordinal \(\alpha\), so it has a least element \(a\); one checks that \(a\) is least in \(A\).

For part (c): \(\bigcup E\) is a set by the Union axiom, its elements are members of members of \(E\), hence ordinals by 1.17(a). By part (b) it is strictly well-ordered by membership. For the transitivity condition, take any \(\alpha \in \bigcup E\): then \(\alpha \in \gamma\) for some \(\gamma \in E\), so \(\alpha \subseteq \gamma \subseteq \bigcup E\), confirming that every element of \(\bigcup E\) is a subset.

For part (d): suppose \(\mathrm{Ord}\) were a set. By part (b) it would be strictly well-ordered by membership, and by 1.17(a) every element of \(\mathrm{Ord}\) is a subset of \(\mathrm{Ord}\). So \(\mathrm{Ord}\) would satisfy both conditions of being an ordinal, giving \(\mathrm{Ord} \in \mathrm{Ord}\). But by 1.17(b) no ordinal is a member of itself — contradiction. Hence \(\mathrm{Ord}\) is a proper class.

The content of this proposition is profound: except for the defect of being a proper class, \(\mathrm{Ord}\) behaves exactly like an ordinal. We now write \(\alpha < \beta\) as shorthand for \(\alpha \in \beta\), giving a canonical **class-ordering** on \(\mathrm{Ord}\). With this ordering in place, \(\bigcup E\) is not merely some ordinal — it will be the *least upper bound* of \(E\) in this ordering, a fact we justify in the next lecture.

---

## Lecture 7a: Sups, Successors and Limits

Recall from last time that membership well-orders the class of ordinals to the extent that makes sense: any *set* of ordinals is strictly well-ordered by \(\in\), and we write \(\alpha < \beta\)</span iff \(\alpha \in \beta\). Today we prove two further lemmas that will be indispensable: that \(S(\alpha)\) really is a "next" ordinal with nothing in between, that \(\bigcup E\) really is the *least upper bound*, and that every set of ordinals has a least ordinal *not* in it.

**Lemma 1.19.** *(a) For any ordinal \(\alpha\), \(\alpha < S(\alpha)\) and there is no ordinal \(\gamma\) with \(\alpha < \gamma < S(\alpha)\). (b) If \(E\) is a set of ordinals, then \(\sup E = \bigcup E\) is the least upper bound of \(E\). (c) For any set of ordinals \(E\), there exists a least ordinal not in \(E\).*

For part (a): since \(S(\alpha) = \alpha \cup \{\alpha\}\), we see directly that \(\alpha \in S(\alpha)\), i.e., \(\alpha < S(\alpha)\). If \(\gamma < S(\alpha)\) then \(\gamma \in S(\alpha) = \alpha \cup \{\alpha\}\), so either \(\gamma \in \alpha\) (i.e., \(\gamma < \alpha\) or \(\gamma = \alpha\). Nothing can lie strictly between \(\alpha\) and its successor.

For part (b): first, every \(\alpha \in E\) is a subset of \(\bigcup E\) (by definition of union), so \(\alpha \leq \bigcup E\) in the sense that \(\alpha \subseteq \bigcup E\), which means \(\alpha \leq \sup E\). If \(\sup E\) were not an upper bound, there would be some \(\alpha \in E\) with \(\sup E < \alpha\); but then \(\sup E \in \alpha \subseteq \bigcup E = \sup E\), contradicting 1.17(b). For minimality: any \(\gamma < \sup E\) satisfies \(\gamma \in \bigcup E\), meaning \(\gamma \in \alpha\) for some \(\alpha \in E\), so \(\gamma < \alpha\) and \(\gamma\) is not an upper bound for \(E\).

For part (c): the naive approach — taking the least element of the complement \(\mathrm{Ord} \setminus E\) — fails because \(\mathrm{Ord}\) is a proper class and we cannot apply well-ordering to a class. The fix is to find a set-theoretic upper bound. One verifies that \(S(S(\sup E))\) is an ordinal that strictly contains \(E\) as a proper subset. (Taking just \(\sup E\) or \(S(\sup E)\) can fail: \(\sup E\) may already be in \(E\), and \(S(\sup E)\) can coincide with \(E\) as a set.) Once we have an ordinal \(\alpha\) with \(E \subsetneq \alpha\), the set \(\alpha \setminus E\) is a non-empty set of ordinals, hence has a least element, which is the least ordinal not in \(E\).

**Terminology.** We call \(\alpha\) a **successor ordinal** if \(\alpha = S(\beta)\) for some ordinal \(\beta\), and a **limit ordinal** otherwise. Under this definition, \(0 = \emptyset\) is a limit ordinal (it is not the successor of anything), as is \(\omega\) — proving that \(\omega\) is not a successor is a worthwhile exercise: if \(\omega = S(\beta)\) for some ordinal \(\beta\), then \(\beta \in \omega\) so \(\beta\) is a finite natural number, and one checks that no natural number has \(\omega\) as its successor. With this trichotomy in hand — zero, successor ordinals, non-zero limit ordinals — the stage is set for transfinite induction.

---

## Lecture 7b: Transfinite Induction (continued)

The camera in the recording studio died mid-lecture, so this is the second part of Lecture 7. We are now ready to state and prove the central proof technique for the class of ordinals.

Transfinite induction is a *proof* technique: it tells us how to establish that some definite condition \(P\) holds for every ordinal. The key observation, which makes the whole method work, is that the ordinals are well-ordered, so if \(P\) ever fails there is a *least* counterexample, and the recursive hypothesis then derives a contradiction.

**Theorem 1.23 (Transfinite Induction).** *Suppose \(P(x)\) is a definite condition satisfying the following property \((\star)\): for every ordinal \(\alpha\), if \(P(\beta)\) holds for all \(\beta < \alpha\), then \(P(\alpha)\) holds. Then \(P(\alpha)\) holds for all ordinals \(\alpha\).*

*Proof.* Suppose not: suppose \(P(\alpha)\) fails for some ordinal \(\alpha\). Let \(D = \{\beta \in S(\alpha) : \lnot P(\beta)\}\), the set of counterexamples up to \(\alpha\). Since \(\alpha \in D\), the set \(D\) is non-empty. Note \(D\) is a set by bounded separation (being a subset of the ordinal \(S(\alpha)\) defined by a definite condition). As a non-empty set of ordinals, \(D\) has a least element; call it \(\alpha_0\). Then \(P(\beta)\) holds for all \(\beta < \alpha_0\) (since \(\alpha_0\) is the least counterexample), so by \((\star)\), \(P(\alpha_0)\) holds. Contradiction. \(\square\)

This proof is really a *least counterexample* argument: the well-ordering of the ordinals guarantees that any non-empty set of counterexamples has a least element, and the hypothesis \((\star)\) prevents such a least element from existing. Note also that the base case \(P(0)\) is *automatically* subsumed: since there are no ordinals less than \(0\), the hypothesis of \((\star)\) holds vacuously for \(\alpha = 0\), giving \(P(0)\) for free.

The theorem as stated is the "strong" form. In practice we often use a three-case decomposition that is more familiar from ordinary induction.

**Corollary 1.24 (Second Form — Three Cases).** *Suppose \(P(x)\) is a definite condition satisfying:*
1. *\(P(0)\) holds;*
2. *For all ordinals \(\beta\): \(P(\beta) \Rightarrow P(S(\beta))\);*
3. *For all limit ordinals \(\alpha > 0\): if \(P(\beta)\) holds for all \(\beta < \alpha\), then \(P(\alpha)\).*

*Then \(P(\alpha)\) holds for all ordinals \(\alpha\).*

This is a corollary of Theorem 1.23: given (1)–(3), one verifies that condition \((\star)\) holds for \(P\), and the theorem applies. The three-case form is how transfinite induction looks in most applications: prove the property at \(0\), show it propagates through successors, and show it propagates through limits.

Transfinite induction gives us the tool to *prove* things about ordinals. The dual tool, for *constructing* operations on ordinals, is transfinite recursion, which we take up next.

---

## Lecture 8: Transfinite Recursion

Today we prove the **Transfinite Recursion Theorem**, the companion to transfinite induction. Where induction lets us *prove* that all ordinals satisfy some property, recursion lets us *construct* a definite operation on \(\mathrm{Ord}\) satisfying a given recursive specification. This is significantly harder than induction; importantly, it is our first use of the Axiom of Replacement.

Let \(\mathcal{X}\) denote the class of all functions whose domain is an ordinal — that is, all sets of the form \(\gamma \subseteq \alpha \times Y\) that are graphs of functions, where \(\alpha\) is an ordinal and \(Y\) is any set. This is a definite class.

**Theorem 1.25 (Transfinite Recursion).** *Let \(G : \mathcal{X} \to \mathrm{Set}\) be a definite operation. Then there is a unique definite operation \(F : \mathrm{Ord} \to \mathrm{Set}\) satisfying*
\[ F(\alpha) = G(F \upharpoonright \alpha) \quad \text{for all } \alpha \in \mathrm{Ord}. \]

Here \(F \upharpoonright \alpha\) denotes the restriction of \(F\) to \(\alpha\), which is a function with domain the ordinal \(\alpha\) and hence an element of \(\mathcal{X}\). The rule says: the value of \(F\) at \(\alpha\) is determined by the values of \(F\) on all ordinals *less than* \(\alpha\). This is the recursive character: each value is computed from previous values, with \(G\) encoding the rule.

**Proof sketch.** *Uniqueness* is proved by transfinite induction: if \(F\) and \(F'\) both satisfy the equation, then proving \(F(\alpha) = F'(\alpha)\) for all \(\alpha\) requires only showing that agreement on all \(\beta < \alpha\) implies \(F \upharpoonright \alpha = F' \upharpoonright \alpha\), whence \(G(F \upharpoonright \alpha) = G(F' \upharpoonright \alpha)\) gives \(F(\alpha) = F'(\alpha)\).

*Existence* is harder. Call a function \(t\) with domain \(\alpha\) an **\(\alpha\)-approximation** (defined by \(G\) if \(t(\beta) = G(t \upharpoonright \beta)\) for all \(\beta < \alpha\). Two key observations follow from uniqueness: (i) if an \(\alpha\)-approximation exists it is unique (call it \(t_\alpha\), and (ii) if \(\alpha < \beta\) then \(t_\beta \supseteq t_\alpha\) (the approximation on the larger ordinal extends the one on the smaller). We then prove by transfinite induction that \(t_\alpha\) exists for every ordinal \(\alpha\):

- *Base case \(\alpha = 0\)*: the empty function is the unique \(0\)-approximation; the defining condition is vacuous.
- *Successor step*: given \(t_\alpha\), extend it to domain \(S(\alpha) = \alpha \cup \{\alpha\}\) by setting the value at \(\alpha\) itself to \(G(t_\alpha)\). This produces \(t_{S(\alpha)}\).
- *Limit step*: given \(t_\alpha\) for all \(\alpha < \beta\) where \(\beta\) is a limit ordinal, set \(t_\beta = \bigcup_{\alpha < \beta} t_\alpha\). **This is where the Axiom of Replacement is used for the first time**: the collection \(\{t_\alpha : \alpha < \beta\}\) is the image of the definite operation \(\alpha \mapsto t_\alpha\) applied to the set \(\beta\), so Replacement ensures it is a set, and we may take its union.

Finally, define \(F = \bigcup_{\alpha \in \mathrm{Ord}} t_\alpha\) (a union over a class, which is again a class). Since the \(t_\alpha\) form a chain of extensions, \(F\) is a well-defined definite operation on \(\mathrm{Ord}\), and it satisfies the recursion equation. \(\square\)

In applications we almost always use the following more explicit form.

**Corollary 1.28 (Second Form of Transfinite Recursion).** *Given a set \(G_1\), a definite operation \(G_2 : \mathrm{Set} \to \mathrm{Set}\), and a definite operation \(G_3 : \mathcal{X} \to \mathrm{Set}\), there is a unique definite operation \(F : \mathrm{Ord} \to \mathrm{Set}\) satisfying:*
1. *\(F(0) = G_1\);*
2. *\(F(S(\alpha)) = G_2(F(\alpha))\) for all ordinals \(\alpha\);*
3. *\(F(\alpha) = G_3(F \upharpoonright \alpha)\) for all limit ordinals \(\alpha > 0\).*

*Proof.* Define a single \(G : \mathcal{X} \to \mathrm{Set}\) by cases: \(G(f) = G_1\) if \(\mathrm{dom}(f) = 0\); \(G(f) = G_2(f(\alpha))\) if \(\mathrm{dom}(f) = S(\alpha)\); and \(G(f) = G_3(f)\) if \(\mathrm{dom}(f)\) is a non-zero limit ordinal. Apply Theorem 1.25 to this \(G\). One checks that the resulting \(F\) satisfies conditions (1)–(3), and uniqueness follows because any \(F'\) satisfying (1)–(3) satisfies the single recursion equation for \(G\). \(\square\)

The second form is more concrete: to define a definite operation on ordinals, one simply specifies the value at \(0\) (a set), a rule for advancing from \(\alpha\) to \(S(\alpha)\) (a definite operation on sets), and a rule for assembling the value at a limit ordinal from all previous values (a definite operation on functions with ordinal domain). As we will see immediately, all three pieces of ordinal arithmetic are defined this way.

---

## Lecture 9: Ordinal Arithmetic

Last time we established transfinite recursion; today we put it to work. The goal is to extend the familiar arithmetic operations — addition, multiplication, exponentiation — from the natural numbers to all ordinals. The guiding principle in each case is the same: at successors we apply the natural "next step" rule, and at limit ordinals we take the supremum of all previously computed values.

### Ordinal Addition

Fix an ordinal \(\beta\). We define the function \(\alpha \mapsto \beta + \alpha\) by Corollary 1.28 with \(G_1 = \beta\), \(G_2 = S\) (the successor operation), and \(G_3(f) = \sup(\mathrm{im}(f))\).

**Definition 1.30 (Ordinal Addition).** For ordinals \(\alpha, \beta\):
\[ \beta + 0 = \beta, \qquad \beta + S(\alpha) = S(\beta + \alpha), \qquad \beta + \alpha = \sup\{\beta + \gamma : \gamma < \alpha\} \text{ (limit } \alpha > 0). \]

At limit ordinals the set \(\{\beta + \gamma : \gamma < \alpha\}\) is the image of the already-constructed function \(\gamma \mapsto \beta + \gamma\) (for \(\gamma < \alpha\) under the Replacement axiom, so it is indeed a set. A first observation: \(\beta + 1 = \beta + S(0) = S(\beta + 0) = S(\beta)\), so *adding 1 is the same as taking the successor*. This perfectly extends the familiar fact that the successor of a natural number \(n\) is \(n + 1\).

A critical warning: ordinal addition is **not commutative**. Consider \(\omega + 1 = S(\omega)\), the successor of \(\omega\), versus
\[ 1 + \omega = \sup\{1 + n : n < \omega\} = \sup\{1, 2, 3, \ldots\} = \omega. \]
Since \(S(\omega) \neq \omega\), we have \(1 + \omega = \omega \neq \omega + 1\). This is not a mere technicality. Think of ordinals as order types of well-orderings: \(\beta + \alpha\) corresponds to *concatenating* the well-ordering of type \(\beta\) before the well-ordering of type \(\alpha\). So \(\omega + 1\) is a copy of \(\omega\) followed by a single element on top — a well-ordering with a greatest element — while \(1 + \omega\) is a single element followed by a copy of \(\omega\), which is just isomorphic to \(\omega\) itself. Placing a finite piece at the beginning of an infinite chain does not change the order type; placing it at the end does.

Using addition one builds the ordinal hierarchy by alternating successors and suprema: \(\omega, \omega+1, \omega+2, \ldots\) terminate at \(\omega + \omega = \omega \cdot 2\), then \(\omega \cdot 2 + 1, \omega \cdot 2 + 2, \ldots\), and so on.

### Ordinal Multiplication

Fix \(\beta\). Set \(G_1 = 0\), \(G_2(x) = x + \beta\), and \(G_3 = \sup \circ\, \mathrm{im}\).

**Definition 1.32 (Ordinal Multiplication).** For ordinals \(\alpha, \beta\):
\[ \beta \cdot 0 = 0, \qquad \beta \cdot S(\alpha) = \beta \cdot \alpha + \beta, \qquad \beta \cdot \alpha = \sup\{\beta \cdot \gamma : \gamma < \alpha\} \text{ (limit } \alpha > 0). \]

One verifies: \(\beta \cdot 1 = \beta \cdot S(0) = \beta \cdot 0 + \beta = 0 + \beta = \beta\), and \(\beta \cdot 2 = \beta + \beta\). Multiplication is also non-commutative: \(\omega \cdot 2 = \omega + \omega\), but \(2 \cdot \omega = \sup\{2 \cdot n : n < \omega\} = \sup\{0, 2, 4, \ldots\} = \omega\). Informally, \(\beta \cdot \alpha\) corresponds to the well-ordering obtained by replacing each element of \(\alpha\) with a copy of \(\beta\).

### Ordinal Exponentiation

**Definition 1.33 (Ordinal Exponentiation).** For ordinals \(\alpha, \beta\):
\[ \beta^0 = 1, \qquad \beta^{S(\alpha)} = \beta^\alpha \cdot \beta, \qquad \beta^\alpha = \sup\{\beta^\gamma : \gamma < \alpha\} \text{ (limit } \alpha > 0). \]

These recursion schemes allow the hierarchy to be extended far beyond \(\omega \cdot 2\): we reach \(\omega^2, \omega^3, \ldots, \omega^\omega, \omega^{\omega^\omega}, \ldots\)

### Properties of Ordinal Arithmetic

**Proposition 1.34.** *For all \(\alpha, \beta, \delta \in \mathrm{Ord}\):*
- *(a) \(\alpha < \beta \iff \delta + \alpha < \delta + \beta\) (addition is strictly left-monotone and left-cancellable);*
- *(b) Addition is associative: \((\alpha + \beta) + \delta = \alpha + (\beta + \delta)\);*
- *(c) For \(\delta \neq 0\): \(\alpha < \beta \iff \delta \cdot \alpha < \delta \cdot \beta\) (multiplication by a non-zero ordinal on the left is strictly monotone and left-cancellable);*
- *(d) Multiplication is associative: \((\alpha \cdot \beta) \cdot \delta = \alpha \cdot (\beta \cdot \delta)\).*

All four parts are proved by transfinite induction. Note that right-cancellation and right-monotonicity fail in general: \(1 + \omega = \omega = 0 + \omega\) but \(1 \neq 0\). The ordinal hierarchy built by these operations is the subject of much of what follows.

---

## Lecture 10: Well-orderings and Ordinals

This is the beginning of the fourth week. Today we prove the central representation theorem: every strict well-ordering is isomorphic to a unique ordinal. This closes Part 1 of the chapter by connecting our set-theoretic development of ordinals to the more intuitive picture of ordinals as "order types of well-orderings."

The proof has two components: uniqueness (which follows from general rigidity properties of well-orderings) and existence (which uses transfinite recursion and Replacement).

### Rigidity of Well-orderings

We begin with two lemmas that will be used repeatedly. Recall that an **isomorphism of strict well-orderings** \((E, \prec)\) and \((E', \prec')\) is a bijection \(f : E \to E'\) such that \(a \prec b \iff f(a) \prec' f(b)\) for all \(a, b \in E\). An **automorphism** is an isomorphism from a structure to itself.

**Lemma 1.5(a) (Rigidity).** *The only automorphism of a strict well-ordering \((E, \prec)\) is the identity.*

*Proof.* Let \(f : E \to E\) be an automorphism and suppose \(f \neq \mathrm{id}\). Let \(D = \{x \in E : f(x) \neq x\}\); by assumption \(D\) is non-empty, so it has a least element \(a \in D\). Since \(a\) is least, all \(b \prec a\) satisfy \(f(b) = b\). Now \(f(a) \neq a\), so either \(f(a) \prec a\) or \(a \prec f(a)\). In the first case, \(f(a) \notin D\) (since \(f(a) \prec a\) and \(a\) is least in \(D\), so \(f(f(a)) = f(a)\), but injectivity of \(f\) then gives \(f(a) = a\), a contradiction. In the second case, apply \(f^{-1}\) (which preserves order) to get \(f^{-1}(a) \prec a\), so \(f^{-1}(a) \notin D\) and \(f(f^{-1}(a)) = f^{-1}(a)\), giving \(a = f^{-1}(a)\), contradicting \(f^{-1}(a) \prec a\). Both cases are impossible. \(\square\)

**Lemma 1.5(b).** *A strict well-ordering is never isomorphic to any of its proper initial segments.*

Here an **initial segment** (always proper in our usage) is a set of the form \(E_{\prec b} = \{e \in E : e \prec b\}\) for some \(b \in E\). The proof is similar to Lemma 1.5(a): suppose \(f : E \to E_{\prec b}\) is an isomorphism and form \(D = \{x \in E : f(x) \neq x\}\). Since \(f(b) \prec b\) and \(b \notin E_{\prec b}\), we have \(b \in D\), so \(D\) is non-empty. The rest of the argument mirrors the automorphism case; one must be careful to only apply \(f^{-1}\) to elements of \(E_{\prec b}\), but those turn out to be exactly the relevant elements.

This rigidity is a feature of well-orderings that fails for denser orders: the intervals \((0,1)\) and \((0, \tfrac{1}{2})\) in \(\mathbb{R}\) are isomorphic as orderings (via \(x \mapsto x/2\), but \(\mathbb{R}\) is not well-ordered. Well-orderings have no such flexibility.

### The Representation Theorem

**Theorem 1.37.** *Every strict well-ordering \((E, \prec)\) is isomorphic to a unique ordinal, and the isomorphism is unique.*

*Proof of uniqueness.* Suppose \(f : (E, \prec) \to (\alpha, \in)\) and \(g : (E, \prec) \to (\beta, \in)\) are isomorphisms. If \(\alpha \neq \beta\), say \(\alpha \in \beta\) (so \(\alpha\) is an initial segment of \(\beta\) by the properties of ordinals), then \(g^{-1} \circ f : (\beta, \in) \to (\beta, \in)|_\alpha\) would be an isomorphism between \(\beta\) and one of its initial segments, contradicting Lemma 1.5(b). So \(\alpha = \beta\). Uniqueness of the isomorphism then follows from rigidity (Lemma 1.5(a)): \(g^{-1} \circ f\) would be an automorphism of \((\alpha, \in)\), hence the identity, giving \(f = g\).

*Proof of existence.* We may assume \(E \neq \emptyset\), since the empty well-ordering is isomorphic to \(0 = \emptyset\). For each \(x \in E\) let \(E_{\prec x} = \{e \in E : e \prec x\}\) be the initial segment below \(x\). Let
\[ A = \{x \in E : (E_{\prec x}, \prec) \cong \text{some ordinal}\}. \]
The condition is definite (it involves the existence of a bijection satisfying a set-theoretic condition), so \(A\) is a set by Bounded Separation. The least element of \(E\) lies in \(A\) (its initial segment is empty, isomorphic to \(0\), so \(A \neq \emptyset\).

By the uniqueness part already proved, for each \(x \in A\) there is a *unique* ordinal \(f(x)\) such that \((E_{\prec x}, \prec) \cong (f(x), \in)\). This defines a definite operation \(f : A \to \mathrm{Ord}\). By the Axiom of Replacement, the image \(\mathrm{im}(f)\) is a set of ordinals. Let \(\alpha\) be the least ordinal not in \(\mathrm{im}(f)\) (which exists by Lemma 1.19(c)). One then establishes the following in sequence: (i) \(A\) is downward closed (if \(x \in A\) and \(y \prec x\) then \(y \in A\); (ii) \(f\) is order-preserving on \(A\); (iii) \(\mathrm{im}(f) = \alpha\) as a set; (iv) \(f\) is injective; (v) \(A = E\). Steps (i)–(v) together show that \(f : (E, \prec) \to (\alpha, \in)\) is the desired isomorphism. \(\square\)

The key role of Replacement is visible in step (iii): the set \(\mathrm{im}(f)\) would not be known to exist without it.

**Definition.** The unique ordinal isomorphic to a strict well-ordering \((E, \prec)\) is called the **order type** of \((E, \prec)\).

This theorem brings Part 1 of the chapter to a close. We defined ordinals as a special class of well-orderings — those in which the ordering is membership itself. The Representation Theorem says this was no restriction at all: every well-ordering is uniquely and canonically isomorphic to an ordinal. When we study ordinals, we are really studying all well-orderings up to isomorphism, with the crucial advantage that ordinals carry a canonical, set-theoretically intrinsic structure. This perspective will be essential in the next part of the course when we turn to cardinals and cardinality.

---
# Part II: Cardinals and the Axiom of Choice

## Lecture 11: Equinumerosity

### From Listing to Measuring

We spent the whole of Chapter 1 building the ordinals, culminating in the theorem that every strict well-ordering is isomorphic — as an ordering — to a unique ordinal, via a unique isomorphism. The professor opened Lecture 11 by reflecting on what this accomplishment actually means:

> "We wanted the ordinals to be an infinite analogue of the natural numbers. And what do the natural numbers do? They enumerate finite sets — every finite set, once ordered, is canonically isomorphic to some natural number. But now that is true for any well-ordering, not just finite ones. Given any infinite set, if you well-order it, then that listing is canonically isomorphic to some ordinal. The ordinal captures the enumeration of any set."

But right from the start of the course there were *two* things we wanted to do: enumerate sets, and measure their size. For finite sets these amount to the same thing. For infinite sets, they do not — and Chapter 2 is where we confront this difference head-on.

The starting point is the right definition of "same size."

**Definition 2.1.** Two sets \(A\) and \(B\) are **equinumerous** (written \(A \sim B\) if there exists a **bijection** \(f : A \to B\). A set is **finite** if it is equinumerous to some \(n \in \omega\). A set is **countable** if it is finite or equinumerous to \(\omega\). A set is **infinite** if it is not finite; **uncountable** if it is not countable.

Equinumerosity asks for the existence of a bijection — any bijection at all. There is no order to preserve. As the professor emphasised: when we later check whether ordinals are equinumerous, there are orderings lying around, but we deliberately ignore them.

### The Schröder-Bernstein Theorem

In practice, finding an explicit bijection between two sets is often hard. The following theorem says it is enough to find injections in both directions — even if they have nothing to do with each other.

**Proposition 2.2 (Schröder-Bernstein).** \(A\) and \(B\) are equinumerous if and only if there exist injections \(A \to B\) and \(B \to A\).

The professor called this "a kind of combinatorial proof — writing it out properly is a bit painful, but the intuition is not very hard. It is a simple trick." Here is the idea he presented.

*Proof sketch.* Given injections \(i : A \to B\) and \(j : B \to A\), set \(f = j \circ i : A \to A\). It suffices to prove the following claim: if \(f : X \to X\) is injective and \(f(X) \subseteq Y \subseteq X\), then \(X \sim Y\). One then applies this with \(X = A\) and \(Y = j(B)\).

To prove the claim, build the chain
\[X \supseteq Y \supseteq f(X) \supseteq f(Y) \supseteq f^2(X) \supseteq f^2(Y) \supseteq \cdots\]
Let \(Z = \bigcup_{n \geq 0}(f^n(X) \setminus f^n(Y))\) and \(W = X \setminus Z\). Then \(X = Z \sqcup W\) (disjoint). Moreover \(Y = f(Z) \sqcup W\): the action of \(f\) on \(Z\) simply shifts each "gap" \(f^n(X) \setminus f^n(Y)\) one step to the right, to \(f^{n+1}(X) \setminus f^{n+1}(Y)\), so you lose the first gap but add nothing new to \(W\). Define \(g : X \to Y\) by \(g(x) = f(x)\) for \(x \in Z\) and \(g(x) = x\) for \(x \in W\). This is a bijection: \(f\) is a bijection from \(Z\) onto \(f(Z)\), and the identity is a bijection from \(W\) to itself, and since the decompositions are disjoint the union is a bijection from \(X\) to \(f(Z) \cup W = Y\). \(\square\)

As the professor put it: "Basically, by applying \(f\) on \(Z\) and on \(W\) doing nothing — that is my bijection. To find a bijection, it suffices to find injections in each direction. It is often much easier."

### Ordinals Do Not Measure Size

The following lemma is both simple and catastrophic for the idea that ordinals might serve as size measurements.

**Lemma 2.4.** *For every infinite ordinal \(\alpha\), \(\alpha\) and \(\alpha + 1\) are equinumerous.*

*Proof.* Since \(\alpha\) is infinite, \(\omega \leq \alpha\) as ordinals, so \(\omega \subseteq \alpha\). Define \(f : \alpha + 1 \to \alpha\) by:
\[f(x) = \begin{cases} x + 1 & \text{if } x \in \omega, \\ 0 & \text{if } x = \alpha, \\ x & \text{otherwise.}\end{cases}\]
Because \(\alpha\) is infinite (in particular, \(\alpha \notin \omega\), these three cases cover disjoint parts of \(\alpha + 1\), and the definition is well-posed. On \(\omega\), \(f\) shifts by one, freeing up the element \(0\); the new top element \(\alpha\) is sent to \(0\); everything else is fixed. This is a bijection from \(\alpha + 1\) onto \(\alpha\). \(\square\)

The professor drew the lesson starkly: "Ordinals are not good at measuring size. Alpha and alpha-plus-one are definitely distinct ordinals — this is strictly bigger than this — but they have the same size. We need to do something else." Note that the bijection cannot be order-preserving, since every initial segment of a well-ordering is strictly shorter. We had to deliberately violate the ordering to produce the bijection.

This pathology is not confined to successor ordinals. For example, \(\omega \cdot 2\) (two copies of \(\omega\) end-to-end) is a limit ordinal, yet it is equinumerous with \(\omega\) via the even-odd interleaving bijection: \(\omega \cdot 2\) is countable. So even many limit ordinals fail to be "new" sizes.

### Cardinals

The solution is to single out exactly those ordinals that genuinely represent new sizes.

**Definition 2.5.** An ordinal \(\alpha\) is a **cardinal** if it is not equinumerous to any \(\beta < \alpha\). We write \(\mathrm{Card}\) for the class of all cardinals.

Cardinals are a subclass of ordinals with a special property. By Lemma 2.4, no infinite successor ordinal is a cardinal — so:

> "Every infinite cardinal is a limit ordinal."

But the converse fails: not every limit ordinal is a cardinal. The professor gave \(\omega \cdot 2\) as an explicit counterexample. The cardinals we know so far are: each natural number \(n \in \omega\) (requiring proof by induction that finite bijections cannot collapse size), and \(\omega\) itself. Every other ordinal we have constructed — \(\omega + 1, \omega + 2, \omega \cdot 2, \omega^2, \omega^\omega\) — is equinumerous with \(\omega\), hence not a new cardinal.

### The \(h\) Operator: Producing New Cardinals

To prove that uncountable cardinals exist, we need a systematic construction.

**Proposition 2.6.** *For every set \(E\), there exists a unique cardinal \(h(E)\), namely the least ordinal not equinumerous with any subset of \(E\).*

The proof is a careful application of Bounded Separation and Replacement. Consider the set
\[W = \{(A, {\prec}) : A \subseteq E \text{ and } {\prec} \text{ is a strict well-ordering of } A\}.\]
This is a set (not merely a class) because: any such pair has first coordinate in \(\mathcal{P}(E)\) and second coordinate in \(\mathcal{P}(E \times E)\), giving a bound for Separation. By the main theorem of Chapter 1, each element of \(W\) is canonically isomorphic to a unique ordinal; let \(F : W \to \mathrm{Ord}\) send each well-ordering to its ordinal type. By Replacement, the image \(X = F(W)\) is a set. One verifies that \(X\) is exactly the class of ordinals equinumerous with some subset of \(E\): on one hand, every element of \(F(W)\) is in bijection with some subset of \(E\); on the other, if \(\alpha \sim A \subseteq E\), one can transport the membership ordering on \(\alpha\) to make \(A\) a well-ordered subset of \(E\), landing in \(W\).

Since \(X\) is a set of ordinals, it has a least ordinal not in it; call it \(h(E)\). That \(h(E)\) is a cardinal follows from minimality: if some \(\alpha < h(E)\) were equinumerous to \(h(E)\), composing bijections would place \(h(E)\) in \(X\), a contradiction.

In particular, \(h(\omega)\) is an uncountable cardinal — the first one. But we need more to make cardinals a complete measure of arbitrary sets.

---

## Lecture 12: Axiom of Choice

### Why We Need a New Axiom

Reviewing where we stood at the start of Lecture 12: we have ordinals for enumeration, and cardinals as the right notion of size. But there is a gap. For cardinals to serve their purpose — measuring the size of *every* set — every set must be equinumerous to some cardinal. The professor traced the logical chain:

> "If every set were equinumerous with a cardinal, then in particular every set would be equinumerous with an ordinal. I can use that bijection to transport the membership ordering on the ordinal back to the set, making the set well-orderable. So the assumption that every set has a cardinal size implies the Well-ordering Principle: every set admits a well-ordering."

The Well-ordering Principle is not provable in ZF alone. Hence we need a new axiom.

### Choice Functions and the Axiom of Choice

**Definition 2.7.** A **choice function** on a family of sets \(\mathcal{F}\) is a function \(c : \mathcal{F} \to \bigcup \mathcal{F}\) such that \(c(F) \in F\) for every \(F \in \mathcal{F}\). (One cannot have a choice function if \(\emptyset \in \mathcal{F}\), since there is no element to choose from the empty set.)

**Axiom 9 (Axiom of Choice, AC).** For any set \(\mathcal{F}\) with \(\emptyset \notin \mathcal{F}\), there exists a choice function on \(\mathcal{F}\).

The professor placed this in context as a set-existence axiom of the usual kind: the choice function is a set (its graph) defined by a definite condition, and it fits the same mold as the other eight axioms.

He was emphatic about a common misconception:

> "A lot of people — not just students but working mathematicians — think that whenever you take an element from a set, you are using the axiom of choice. That is not true. The axiom of choice is a specific statement: it asserts the existence of a choice function. But a choice function may already exist for other reasons, and then you do not need AC. If you can *construct* the choice function, you are probably not using AC. You use AC precisely when you cannot construct it — when you just know it must exist."

Two key examples where AC is not needed: (i) when \(\mathcal{F}\) is a finite collection (one builds the choice function by iterating the axiom of the non-empty set finitely many times); (ii) when the sets in \(\mathcal{F}\) carry a well-ordering (one takes the least element of each). It is for an *arbitrary* infinite collection of sets, with no additional structure, that AC becomes genuinely necessary.

### The Three-Way Equivalence

The payoff of introducing AC is a fundamental theorem:

**Theorem 2.8.** *In ZF, the following are equivalent:*
1. *The Axiom of Choice (AC).*
2. *The Well-ordering Principle: every set admits a well-ordering.*
3. *Zorn's Lemma: if \((E, \prec)\) is a nonempty poset in which every chain (totally ordered subset) has an upper bound in \(E\), then \(E\) has a maximal element.*

The full proof is given in the notes. The professor worked through the main direction in lecture and gave sketches of the others.

*Proof that AC implies Well-ordering.* Let \(A\) be any set. By AC, there is a choice function \(c\) on the collection of all nonempty subsets of \(A\). (This is a genuine use of AC: we know nothing about \(A\), so we cannot construct \(c\) from other information.) Fix an ordinal \(\zeta \notin A\). By transfinite recursion, define \(F : \mathrm{Ord} \to A \cup \{\zeta\}\):
\[F(\alpha) = \begin{cases} c(A \setminus \mathrm{Im}(F \upharpoonright \alpha)) & \text{if } A \setminus \mathrm{Im}(F \upharpoonright \alpha) \neq \emptyset, \\ \zeta & \text{otherwise.}\end{cases}\]
Intuitively: at each stage, if there are still elements of \(A\) not yet enumerated, choose one; otherwise output the dummy value \(\zeta\) to signal that the process has halted. The function \(F\) must eventually take the value \(\zeta\): if it never did, then \(F\) restricted to \(h(A)\) would be injective (each \(F(\alpha)\) is chosen outside the image of all previous values) with image in \(A\), contradicting the definition of \(h(A)\) as the least ordinal not embeddable into any subset of \(A\). Let \(\alpha_0\) be the least ordinal with \(F(\alpha_0) = \zeta\). Then \(F \upharpoonright \alpha_0 : \alpha_0 \xrightarrow{\,\sim\,} A\) is a bijection, and transporting the membership ordering on \(\alpha_0\) back to \(A\) gives a well-ordering of \(A\). \(\square\)

*Sketch that Well-ordering implies Zorn's Lemma.* Suppose \((E, \prec)\) satisfies the chain-upper-bound condition (call it \(\star\) but has no maximal element. Well-order \(E\) (using the Well-ordering Principle), thereby obtaining a choice function on all nonempty subsets of \(E\) by taking least elements. By transfinite recursion, build \(F : h(E) \to E\) as a strictly \(\prec\)-increasing function: at successor stages, use the fact that the current element is not maximal to pick something strictly bigger; at limit stages, use \(\star\) to pick an upper bound for the chain built so far. This embeds \(h(E)\) injectively into \(E\), contradicting the definition of \(h(E)\).

*Sketch that Zorn's Lemma implies AC.* Given a family \(\mathcal{F}\) of nonempty sets, let \(\Lambda\) be the poset of all *partial* choice functions on \(\mathcal{F}\) (choice functions defined on some sub-family \(\mathcal{G} \subseteq \mathcal{F}\), ordered by inclusion (i.e., extension of functions). The empty function is a partial choice function, so \(\Lambda \neq \emptyset\). Every chain of partial choice functions has an upper bound in \(\Lambda\) (namely its union), so by Zorn's Lemma \(\Lambda\) has a maximal element. A maximal partial choice function must have domain all of \(\mathcal{F}\): if it omitted some \(F \in \mathcal{F}\), one could extend it by choosing any element of \(F\) (this requires only one choice from one non-empty set — no AC needed), contradicting maximality. \(\square\)

---

## Lectures 13a & 13b: Cardinality

### Cardinals as a Complete Measure of Size

With AC in hand, the programme of measuring size can be carried out. The professor set the scene at the start of Lecture 13:

> "We proved that AC implies the Well-ordering Principle. In the notes you will also see that the Well-ordering Principle implies Zorn's Lemma, and Zorn's Lemma implies AC. So all three are equivalent. Now let us spell out what choice gives us about cardinals."

From this point forward we work in **ZFC** — Zermelo-Fraenkel set theory with the Axiom of Choice — without explicitly invoking AC at each step.

**Proposition 2.10 (Working with AC).** *Assume ZFC.*
- *(a) Every set is equinumerous with a unique cardinal. We write \(|A|\) for the unique cardinal equinumerous to \(A\), called the* **cardinality** *of \(A\).*
- *(b) \(|A| \leq |B|\) if and only if there is an injection \(A \hookrightarrow B\).*
- *(c) For any sets \(A, B\), either there is an injection \(A \hookrightarrow B\) or an injection \(B \hookrightarrow A\) (or both).*
- *(d) If \(f\) is a function with domain \(A\), then \(|\mathrm{Im}(f)| \leq |A|\).*
- *(e) A countable union of countable sets is countable.*

*Proof of (a).* By the Well-ordering Principle, \(A\) admits a well-ordering, and by Theorem 1.37 that well-ordering is isomorphic to some ordinal \(\alpha\), giving a bijection \(A \sim \alpha\). The set \(S = \{\beta \leq \alpha : A \sim \beta\}\) is nonempty (it contains \(\alpha\), so it has a least element \(\alpha_0\). This \(\alpha_0\) is a cardinal: if some \(\beta < \alpha_0\) were equinumerous to \(\alpha_0\), then by transitivity of equinumerosity \(\beta \sim A\), placing \(\beta\) in \(S\) and contradicting the minimality of \(\alpha_0\). Uniqueness: two distinct cardinals cannot be equinumerous, since by definition a cardinal is not equinumerous to any smaller ordinal, and one of them would have to be smaller.

*Proof of (b).* If \(|A| = \kappa \leq \lambda = |B|\), the inclusion \(\kappa \subseteq \lambda\) composed with the bijection \(\lambda \to B\) and the inverse bijection \(A \to \kappa\) gives an injection \(A \hookrightarrow B\). Conversely, suppose \(f : A \hookrightarrow B\). Then the composition \(\kappa \xrightarrow{\sim} A \xrightarrow{f} B \xrightarrow{\sim} \lambda\) is an injection from \(\kappa\) into \(\lambda\). If \(\lambda < \kappa\) then the inclusion \(\lambda \hookrightarrow \kappa\) together with this injection would, by Schröder-Bernstein, give \(\kappa \sim \lambda\) — impossible since both are cardinals and distinct cardinals are never equinumerous. Hence \(\kappa \leq \lambda\).

*Proof of (d).* The operation assigning to each \(b \in \mathrm{Im}(f)\) its fiber \(f^{-1}(b) = \{a \in A : f(a) = b\}\) is a definite operation producing a family of nonempty subsets of \(A\). By AC, there is a choice function selecting one element from each fiber. This gives an injection \(\mathrm{Im}(f) \hookrightarrow A\) (distinct elements of \(\mathrm{Im}(f)\) have disjoint fibers, so their chosen preimages are distinct). Hence \(|\mathrm{Im}(f)| \leq |A|\) by (b). (The function that constructs a section of \(f\) is, in fact, equivalent to AC.)

**Remark 2.11.** The cardinality function behaves exactly as intuition demands: \(|A| = |B|\) if and only if \(A \sim B\); \(|A| \leq |B|\) if and only if \(A\) embeds into \(B\). A set is finite iff \(|A| < \omega\), and countable iff \(|A| \leq \omega\). Note also that part (c) is comparability of cardinals: under AC, any two sets are comparable in size, which is itself equivalent to AC.

---

# Part III: Cardinal Arithmetic

## Lectures 14a & 14b: Enumerating Cardinals

### The Cardinal Successor and the Aleph Hierarchy

The professor opened Lecture 14 by observing that the \(h\)-operator, which we used to produce \(h(\omega)\) as the first uncountable cardinal, has a cleaner interpretation when applied to a cardinal.

**Notation 3.1.** For any cardinal \(\kappa\), write \(\kappa^+\) for \(h(\kappa)\).

The claim is that \(\kappa^+\) is the *least* cardinal strictly greater than \(\kappa\). To see why: if \(\lambda > \kappa\) is any cardinal, then since \(\lambda\) is a cardinal its cardinality is itself, and since \(\kappa\) is a cardinal its cardinality is itself; so \(|\lambda| = \lambda > \kappa = |\kappa|\), meaning by Proposition 2.10(b) there is no injection \(\lambda \hookrightarrow \kappa\), i.e., \(\lambda\) is not equinumerous with any subset of \(\kappa\). So every cardinal greater than \(\kappa\) satisfies the defining property of \(h(\kappa)\), and \(\kappa^+\) is the smallest such. The professor underlined a terminological warning:

> "Do not mix up the two successor operations: \(\kappa + 1\) is the ordinal successor — the least ordinal bigger than \(\kappa\) — while \(\kappa^+\) is the cardinal successor — the least cardinal bigger than \(\kappa\). For natural numbers the two coincide, but for infinite cardinals \(\kappa + 1\) is not even a cardinal: it is equinumerous with \(\kappa\) by Lemma 2.4."

The cardinal successor operation allows us to enumerate all infinite cardinals systematically.

**Definition 3.2.** The **aleph hierarchy** is defined by transfinite recursion:
\[\aleph_0 = \omega, \quad \aleph_{\alpha+1} = \aleph_\alpha^+, \quad \aleph_\alpha = \sup\{\aleph_\beta : \beta < \alpha\} \text{ (for limit } \alpha).\]

At successor stages, we take the next cardinal. At limit stages, we take the supremum — recalling that the supremum of a set of ordinals is itself an ordinal. The definition is an instance of transfinite recursion and is a definite operation from \(\mathrm{Ord}\) to \(\mathrm{Card}\).

**Lemma 3.3.** *Each \(\aleph_\alpha\) is an infinite cardinal.*

*Proof.* That each \(\aleph_\alpha\) is infinite is clear: the hierarchy starts at \(\omega\) and only increases. For cardinalhood, the base case \(\aleph_0 = \omega\) and successor case \(\aleph_{\alpha+1} = \aleph_\alpha^+\) are immediate (by definition, \(\kappa^+\) is a cardinal). For a limit ordinal \(\beta\), let \(\alpha < \aleph_\beta\). Since \(\aleph_\beta = \bigcup_{\gamma < \beta} \aleph_\gamma\), we have \(\alpha \in \aleph_\gamma\) for some \(\gamma < \beta\). By the induction hypothesis, \(\aleph_\gamma\) is a cardinal, so \(|\alpha| < \aleph_\gamma \leq \aleph_\beta\). Hence \(\alpha \not\sim \aleph_\beta\) (they have different cardinalities). Since \(\alpha\) was arbitrary, \(\aleph_\beta\) is a cardinal. \(\square\)

**Lemma 3.4.** *For all ordinals \(\alpha < \beta\), we have \(\aleph_\alpha < \aleph_\beta\).*

This is proved by transfinite induction on \(\beta\). The successor step is immediate (each \(\aleph_{\beta+1} = \aleph_\beta^+\) is strictly larger). The limit step requires checking that \(\aleph_\beta = \sup_{\gamma < \beta} \aleph_\gamma\) is strictly above each \(\aleph_\alpha\) with \(\alpha < \beta\); this uses the induction hypothesis and the fact that a cardinal \(\aleph_\alpha\) cannot equal its own supremum at a limit. (Exercise; details in the notes.)

**Lemma 3.5.** *For all ordinals \(\alpha\), we have \(\alpha \leq \aleph_\alpha\).*

Again by induction: \(0 \leq \aleph_0 = \omega\); if \(\alpha \leq \aleph_\alpha\) then \(\alpha + 1 \leq \aleph_\alpha + 1 \leq \aleph_\alpha^+ = \aleph_{\alpha+1}\) (strict inequality at successor stages); and at limits the sup of the left side is at most the sup of the right side.

The professor made the subtle remark that this inequality can occasionally become an *equality*, and only at certain limit ordinals. The example he gave: define a sequence by \(\alpha_0 = 0\) and \(\alpha_{n+1} = \aleph_{\alpha_n}\). Let \(\alpha = \sup_n \alpha_n\). Then \(\aleph_\alpha = \alpha\): the indices are growing exactly as fast as the cardinals they index, and at the limit they coincide. This phenomenon is connected to cofinality and regularity, discussed below.

### Every Infinite Cardinal Is an Aleph

**Proposition 3.7.** *Every infinite cardinal is of the form \(\aleph_\alpha\) for some ordinal \(\alpha\).*

*Proof.* By Lemma 3.5, any infinite cardinal \(\kappa\) satisfies \(\kappa \leq \aleph_\kappa < \aleph_{\kappa+1}\). So it suffices to prove: for every ordinal \(\beta\), every infinite cardinal \(\kappa < \aleph_\beta\) is some \(\aleph_\alpha\). Prove this by induction on \(\beta\):
- *Base case \(\beta = 0\):* There are no infinite cardinals below \(\aleph_0 = \omega\), so the statement is vacuous.
- *Successor \(\beta = \alpha + 1\):* Any \(\kappa < \aleph_{\alpha+1} = \aleph_\alpha^+\) satisfies \(\kappa \leq \aleph_\alpha\). Either \(\kappa = \aleph_\alpha\) (done) or \(\kappa < \aleph_\alpha\), and the induction hypothesis applies.
- *Limit \(\beta > 0\):* If \(\kappa < \aleph_\beta = \sup_{\gamma < \beta} \aleph_\gamma\), then \(\kappa < \aleph_\gamma\) for some \(\gamma < \beta\), and the induction hypothesis applies. \(\square\)

A cardinal of the form \(\aleph_{\alpha+1}\) is called a **successor cardinal**; a cardinal \(\aleph_\alpha\) for limit \(\alpha\) is a **limit cardinal** (e.g., \(\aleph_0, \aleph_\omega\). The enumeration \(\alpha \mapsto \aleph_\alpha\) is a strictly increasing surjection from \(\mathrm{Ord}\) onto the class of infinite cardinals. We can now prove things about all infinite cardinals by induction on the index.

### The Continuum Hypothesis

**Theorem 3.8 (Cantor's Diagonalisation).** *For every set \(E\), \(|E| < |\mathcal{P}(E)|\).*

*Proof.* The map \(x \mapsto \{x\}\) embeds \(E\) into \(\mathcal{P}(E)\), so \(|E| \leq |\mathcal{P}(E)|\). No surjection \(f : E \to \mathcal{P}(E)\) can exist: given any \(f\), let \(\Delta = \{x \in E : x \notin f(x)\} \in \mathcal{P}(E)\). If \(\Delta = f(x_0)\), then \(x_0 \in \Delta \iff x_0 \notin f(x_0) = \Delta\), a contradiction. Hence \(|E| \neq |\mathcal{P}(E)|\), and therefore \(|E| < |\mathcal{P}(E)|\). \(\square\)

The professor called this "a beautiful bit of mathematics from the turn of the century that really got set theory going." It has an immediate consequence: \(|\mathcal{P}(\aleph_0)| > \aleph_0\), so \(\mathcal{P}(\aleph_0)\) is uncountable and its cardinality is some \(\aleph_\alpha\) with \(\alpha \geq 1\). But *which* aleph?

The **Continuum Hypothesis (CH)** asserts:
\[|\mathcal{P}(\aleph_0)| = \aleph_1.\]
It says that the power set of the naturals is as small as it could possibly be — the very next cardinal after \(\aleph_0\). The **Generalised Continuum Hypothesis (GCH)** extends this to all infinite cardinals:
\[|\mathcal{P}(\kappa)| = \kappa^+ \quad \text{for all infinite cardinals } \kappa.\]

Both are **independent of ZFC** — as the professor put it:

> "You cannot prove that it is true and you cannot prove that it is false. ZFC is agnostic. Cohen, in the 1960s, developed the machinery of forcing to prove this independence. This is very deep work and the starting point of modern set theory. We will not touch it here."

The professor drew a sharp contrast with the Axiom of Choice:

> "Mainstream mathematics assumes AC — you just assume it and you do not announce it. Mainstream mathematics does *not* assume CH. There are as many interesting statements provable by assuming CH is false as by assuming it is true. So we work independently of CH, and if you ever do use it you say so explicitly."

We do not assume CH or GCH in this course.

---

## Lectures 15a & 15b: Cardinal Arithmetic

### Addition and Multiplication of Cardinals

The purpose of cardinal arithmetic is practical: when working in mathematics, one constantly needs to compute the sizes of unions, products, and function spaces. The definitions are grounded in these geometric intuitions.

**Definition 3.10.** For cardinals \(\kappa_1, \kappa_2\), choose disjoint sets \(X_1, X_2\) with \(|X_i| = \kappa_i\). Define:
\[\kappa_1 + \kappa_2 = |X_1 \cup X_2|, \qquad \kappa_1 \cdot \kappa_2 = |X_1 \times X_2|.\]

These are well-defined: any two sets of cardinality \(\kappa_i\) are equinumerous, so the bijections compose to show independence of the choice of \(X_i\). For addition, we need disjointness to avoid double-counting; for multiplication, the Cartesian product definition has no such requirement and one may as well take \(X_i = \kappa_i\) directly.

The professor emphasised a persistent notational ambiguity: "Plus and times are used for both ordinal and cardinal arithmetic. Omega plus omega as an ordinal is omega-two, a countable ordinal and not a cardinal. Omega plus omega as a cardinal is a cardinal by definition — and it equals \(\aleph_0\), as we will see. The context tells you which you mean."

For finite cardinals, cardinal arithmetic coincides with ordinary arithmetic. For infinite cardinals, something remarkable happens:

**Theorem 3.13.** *For every infinite cardinal \(\kappa\), \(\kappa \cdot \kappa = \kappa\).*

*Proof.* We exhibit a well-ordering of \(\kappa \times \kappa\) of order-type at most \(\kappa\). Define: \((x,y) \prec (x',y')\) iff either \(\max\{x,y\} < \max\{x',y'\}\), or they have the same max with lexicographic tie-breaking. This is a well-ordering; let its order-type be \(\gamma\). Suppose for contradiction that \(\kappa \cdot \kappa > \kappa\), i.e., \(\gamma > \kappa\). Then \(\kappa\) is a proper initial segment of \(\gamma\), isomorphic to \(\{(x,y) : (x,y) \prec (x_0,y_0)\}\) for some \((x_0, y_0) \in \kappa \times \kappa\). Setting \(\zeta = \max\{x_0, y_0\} + 1 < \kappa\), this initial segment lies inside \(\zeta \times \zeta\). Its cardinality is at most \(|\zeta \times \zeta| = |\zeta| \cdot |\zeta|\). By induction on \(\kappa\), \(|\zeta| \cdot |\zeta| = |\zeta| < \kappa\), contradicting the assumption that this segment has cardinality \(\kappa\). \(\square\)

**Corollary 3.14.** *For infinite \(\kappa_2\) and nonzero \(\kappa_1 \leq \kappa_2\):*
*(a) \(\kappa_1 \cdot \kappa_2 = \kappa_2\); (b) \(\kappa_1 + \kappa_2 = \kappa_2\).*

In other words, for infinite cardinals: \(\aleph_\alpha + \aleph_\beta = \aleph_\alpha \cdot \aleph_\beta = \max(\aleph_\alpha, \aleph_\beta)\). The professor commented: "An infinite cardinal has enough room. You can shift things, create space to embed the other cardinal in. The disjoint union has the same size as the bigger of the two. So these operations trivialize: they just compute the maximum."

### Generalised Sums and Products

For many applications — for instance, sizing a product of infinitely many spaces — we need infinite cardinal arithmetic.

**Definition 3.16.** Let \((\kappa_i : i \in I)\) be an \(I\)-indexed sequence of cardinals (formally, a function \(f : I \to \mathrm{Card}\) with \(f(i) = \kappa_i\). Choose pairwise disjoint sets \((X_i : i \in I)\) with \(|X_i| = \kappa_i\). Define:
\[\sum_{i \in I} \kappa_i = \left|\bigcup_{i \in I} X_i\right|, \qquad \prod_{i \in I} \kappa_i = \left|\bigtimes_{i \in I} X_i\right|\]
where \(\bigtimes_{i \in I} X_i = \{f : I \to \bigcup_i X_i : f(i) \in X_i \text{ for all } i\}\) is the generalised Cartesian product. The union of the sequence is the union of the image of \(f\), in set-theoretic terms. Both definitions are well-defined (independent of the choice of the \(X_i\). Note that by AC, as long as each \(X_i \neq \emptyset\), the generalised Cartesian product is nonempty.

**Proposition 3.20.** *If \(I\) is an infinite index set and each \(\kappa_i > 0\), then:*
*(a) \(\sup_{i \in I} \kappa_i\) is a cardinal;*
*(b) \(\displaystyle\sum_{i \in I} \kappa_i = \max\!\left(|I|,\, \sup_{i \in I} \kappa_i\right)\).*

The sum trivialises again: you need to account for how many terms you are adding (the size of the index set), but once you do, the answer is just the larger of the index size and the supremum of the terms. The professor gave the intuition: "If all the \(\kappa_i\) are one, and you add them up over an infinite index set, you should not expect the answer to be one — you are adding infinitely many of them. The index set size must enter. But that is all that enters, beyond the supremum."

**Definition 3.21 (Cardinal Exponentiation).** For cardinals \(\kappa, \lambda\), define:
\[\kappa^\lambda = |\{f : \lambda \to \kappa\}|\]
the cardinality of the set of all functions from \(\lambda\) to \(\kappa\). This is precisely the generalised product of a constant sequence: \(\kappa^\lambda = \prod_{i \in \lambda} \kappa\).

The key example: what is \(2^\lambda\)? A function \(f : \lambda \to 2 = \{0,1\}\) is a characteristic function, and it corresponds bijectively to the subset \(\{i \in \lambda : f(i) = 1\} \subseteq \lambda\). Hence:
\[2^\lambda = |\mathcal{P}(\lambda)|.\]
By Cantor's theorem, this is strictly greater than \(\lambda\). The generalised product does *not* trivialise in general — a stark contrast to sums. The professor noted: "Here for the first time we get something new and interesting, even at the infinite level. The sum trivialises. The product does not. It gives you something strictly bigger."

**Lemma 3.22 (Properties of Cardinal Exponentiation).** *The following hold for all cardinals:*
*(a) If \(\lambda \leq \mu\), then \(\kappa^\lambda \leq \kappa^\mu\).*
*(b) If \(\kappa \leq \lambda\), then \(\kappa^\mu \leq \lambda^\mu\).*
*(c) \(\kappa^{\lambda + \mu} = \kappa^\lambda \cdot \kappa^\mu\) (cardinal arithmetic).*
*(d) \((\kappa^\lambda)^\mu = \kappa^{\lambda \cdot \mu}\) (cardinal arithmetic).*

These match the familiar identities for exponentiation and hold for this definition; see the notes for proofs.

### König's Theorem

The following theorem is the central non-trivial inequality of infinite cardinal arithmetic. It is a vast generalisation of Cantor's diagonalisation.

**Theorem 3.25 (König's Theorem).** *Suppose \(\kappa_i < \lambda_i\) for all \(i \in I\). Then:*
\[\sum_{i \in I} \kappa_i < \prod_{i \in I} \lambda_i.\]

The professor described this as "Cantor's diagonalisation squeezed for all it's worth."

*Proof sketch.* Choose sets \(X_i, Y_i\) with \(|X_i| = \kappa_i < \lambda_i = |Y_i|\), and fix injections \(\pi_i : X_i \hookrightarrow Y_i\). An injection \(\bigsqcup_i X_i \hookrightarrow \prod_i Y_i\) is straightforward to construct. To see there is no surjection in this direction, suppose \(h : \bigsqcup_i X_i \to \prod_i Y_i\) is any function. For each \(i\), the restriction \(h_i := h \upharpoonright X_i\) followed by projection onto the \(i\)-th coordinate is a function \(X_i \to Y_i\) which, since \(|X_i| < |Y_i|\), cannot be surjective. So for each \(i\), choose \(c_i \in Y_i \setminus \{\mathrm{pr}_i(h(x)) : x \in X_i\}\). The element \((c_i)_{i \in I} \in \prod_i Y_i\) is not in the image of \(h\) (it evades every \(h(x)\) in the \(i\)-th coordinate for each \(x \in X_i\). This is the diagonalisation. \(\square\)

### Regularity and Cofinality

The final topic in Chapter 3 concerns a subtle internal structure of infinite cardinals.

**Definition 3.27.** A cardinal \(\kappa\) is **regular** if every subset \(X \subseteq \kappa\) of cardinality less than \(\kappa\) has \(\sup X < \kappa\). Equivalently, \(\kappa\) cannot be written as a union of fewer than \(\kappa\) sets each of size less than \(\kappa\). A cardinal that is not regular is **singular**.

**Definition 3.28.** The **cofinality** of an ordinal \(\alpha\), written \(\mathrm{cof}(\alpha)\), is the least ordinal \(\beta\) for which there exists a strictly increasing function \(f : \beta \to \alpha\) whose image is unbounded in \(\alpha\).

For example, \(\mathrm{cof}(\aleph_\omega) = \aleph_0\): the sequence \(\aleph_0 < \aleph_1 < \aleph_2 < \cdots\) is unbounded in \(\aleph_\omega\), and no finite sequence can be unbounded in an infinite cardinal. In particular, \(\aleph_\omega\) is singular: it is the union of countably many smaller cardinals \(\aleph_n\).

**Lemma 3.29.** *\(\mathrm{cof}(\alpha)\) is always a cardinal, and \(\mathrm{cof}(\mathrm{cof}(\alpha)) = \mathrm{cof}(\alpha)\).*

**Proposition 3.31.** *A cardinal \(\kappa\) is regular if and only if \(\mathrm{cof}(\kappa) = \kappa\).*

Every successor cardinal is regular (Exercise 3.32): intuitively, \(\kappa^+\) is so much larger than everything below it that no sequence of length less than \(\kappa^+\) can be unbounded in it. Infinite limit cardinals such as \(\aleph_\omega\) are singular because the cofinality is strictly smaller.

The cofinality is the key to understanding the constraints on cardinal exponentiation. The following is a non-trivial consequence of König's Theorem:

**Proposition 3.33.** *For all infinite cardinals \(\kappa\), \(\mathrm{cof}(2^\kappa) > \kappa\).*

*Proof.* Suppose \(f : \lambda \to 2^\kappa\) is a strictly increasing unbounded function with \(\lambda \leq \kappa\). Then:
\[2^\kappa = \left|\bigcup_{\alpha < \lambda} f(\alpha)\right| \leq \sum_{\alpha < \lambda} |f(\alpha)| < \prod_{\alpha < \lambda} 2^\kappa = (2^\kappa)^\lambda = 2^{\kappa \cdot \lambda} = 2^\kappa,\]
where König's Theorem is used for the strict inequality (since each \(|f(\alpha)| < 2^\kappa\) and the identities use cardinal exponentiation laws. The resulting \(2^\kappa < 2^\kappa\) is a contradiction. Hence no such \(\lambda \leq \kappa\) can be the cofinality of \(2^\kappa\). \(\square\)

**Corollary 3.34.** \(2^{\aleph_0} \neq \aleph_\omega\).

*Proof.* \(\mathrm{cof}(\aleph_\omega) = \aleph_0\), but by Proposition 3.33 \(\mathrm{cof}(2^{\aleph_0}) > \aleph_0\). Since the cofinalities differ, \(2^{\aleph_0} \neq \aleph_\omega\). \(\square\)

This is one of the few unconditional results we can prove about \(2^{\aleph_0}\) without assuming the Continuum Hypothesis or its negation: no matter what, \(2^{\aleph_0}\) cannot be the limit cardinal \(\aleph_\omega\). The theory of cofinality and regularity, while far from exhausted here, is genuinely interesting and the notes contain more; the professor recommended it as worthwhile reading.

With this, the set theory component of the course draws to a close. The theory of ordinals and cardinals — built up from the axioms of ZFC with transfinite induction and recursion as the central tools — provides the foundational arithmetic needed for the rest of the course. When we return from the break, we enter model theory, which in some sense picks up where this leaves off: asking not just about the *size* of mathematical structures, but about what can and cannot be said about them in a formal language.

---
# Part IV: First-order Logic and Model Theory

## Lecture 16: Structures

After reading week and Thanksgiving, we begin something entirely new. The first three parts of this course developed axiomatic set theory: ordinals, cardinals, transfinite induction, and cardinal arithmetic. We now turn to **model theory**, which is still part of mathematical logic, but a different part. As the professor put it at the start of lecture: model theory is a kind of *metamathematical* subject — it gives us a formal framework for studying mathematical objects that arise anywhere in mathematics. While we will occasionally use cardinal arithmetic and transfinite induction as tools (as one does in any area of mathematics), the model theory part of the course carries no direct logical dependence on the set theory part.

The central objects of model theory are **structures**. The idea is that anything one encounters in mathematics — a group, a ring, a vector space, a partially ordered set, an ordered field — can be described as a structure in the logical sense. We are going to make this precise.

### Structures

**Definition 4.1.** A **structure** \(\mathcal{M}\) consists of a nonempty set \(M\) called the **universe** of \(\mathcal{M}\), together with the following data:

- a sequence \((c_i : i \in I_{\mathrm{con}})\) of **constants**, where each \(c_i \in M\);
- a sequence \((f_i : M^{n_i} \to M : i \in I_{\mathrm{fun}})\) of **basic functions**, each of some **arity** \(n_i \geq 1\);
- a sequence \((R_i \subseteq M^{k_i} : i \in I_{\mathrm{rel}})\) of **basic relations**, each of some arity \(k_i \geq 1\).

The triple of these sequences — the constants, basic functions, and basic relations — is called the **signature** of \(\mathcal{M}\). The index sets \(I_{\mathrm{con}}, I_{\mathrm{fun}}, I_{\mathrm{rel}}\) may all be empty (in which case the structure is just a nonempty set), and they need not be finite.

In this definition we write the universe using the same Roman letter as the script letter for the structure, so the universe of \(\mathcal{M}\) is \(M\), the universe of \(\mathcal{N}\) is \(N\), and so on.

**Remark 4.2 (Zero-ary functions are constants).** The requirement that basic functions have arity at least 1 deserves a word of explanation. In set theory, \(M^0 = \{\emptyset\}\) is a singleton: there is exactly one function from the empty set to any set, namely the empty function. So a zero-ary function \(f : M^0 \to M\) is entirely determined by which element of \(M\) it picks out — it is, in all but name, just a constant. One could therefore do away with the sequence of constants entirely and treat them as zero-ary functions. We do not do this; it is natural in mathematical practice to think about constants and functions separately. But the conceptual point is that the two notions coincide at arity zero, and so we simply decree that basic functions have arity at least 1 and keep constants as a separate piece of the data.

**Remark 4.3 (Nonemptiness).** The condition that the universe \(M\) be nonempty is a technical convenience. Allowing the empty universe would introduce annoying case analyses into theorem statements throughout. The index sets, however, are free to be empty: a structure with no constants, no basic functions, and no basic relations is perfectly legal — it is just a nonempty set.

The real content of the definition is that you choose which data to put on a set depending on what you want to study. The professor's examples from lecture make this vivid.

**Example 4.4 (The reals with various signatures).** Consider the set \(\mathbb{R}\) of real numbers as the common universe for the following structures:

1. *The reals as a linearly ordered set.* Take no constants, no basic functions, and one basic binary relation \(<\) — more precisely, the set \(\{(a,b) \in \mathbb{R}^2 : a < b\}\). The resulting structure is \((\mathbb{R},\,<)\).

2. *The reals as an additive group.* Here we want one constant (the additive identity), a binary function (addition), and a unary function (additive inverse). The structure is \((\mathbb{R},\, 0,\, +,\, -)\), where \(-\) denotes the unary function \(x \mapsto -x\), not binary subtraction.

3. *The reals as a ring.* We add the multiplicative identity and multiplication: \((\mathbb{R},\, 0,\, 1,\, +,\, -,\, \times)\). Two constants, three basic functions, no basic relations.

4. *The reals as an ordered ring.* Combine ring structure and order: \((\mathbb{R},\, 0,\, 1,\, +,\, -,\, \times,\, <)\). Two constants, three basic functions, one basic relation.

All four structures share the same universe but differ in their signatures. The choice of signature encodes precisely which aspects of \(\mathbb{R}\) we intend to study.

The juxtaposition of Examples 3 and 4 suggests a general pattern.

**Definition 4.5 (Expansion and reduct).** Suppose \(\mathcal{M}\) and \(\mathcal{N}\) are two structures with the same universe. We say \(\mathcal{N}\) is an **expansion** of \(\mathcal{M}\) — equivalently, \(\mathcal{M}\) is a **reduct** of \(\mathcal{N}\) — if the signature of \(\mathcal{M}\) is contained in the signature of \(\mathcal{N}\). Formally, each of the sequences of constants, basic functions, and basic relations of \(\mathcal{M}\) is a subsequence of the corresponding sequences of \(\mathcal{N}\).

In the running example: the additive group \((\mathbb{R}, 0, +, -)\) is a reduct of the ring \((\mathbb{R}, 0, 1, +, -, \times)\), which is in turn a reduct of the ordered ring \((\mathbb{R}, 0, 1, +, -, \times, <)\). The ordered set \((\mathbb{R}, <)\) is a reduct of the ordered ring but is *not* a reduct of the ring or the group, since neither of those carry the ordering.

This expansion/reduct vocabulary is the natural language for a recurring theme in model theory: given a reduct, can we *recover* the larger structure from the smaller one? For the ring and the group, the answer is no — the ring structure of \(\mathbb{R}\) cannot be recovered (in a precise sense we will define) from the additive group alone. But the ordered ring structure can be recovered from the ring without the order, because the order on \(\mathbb{R}\) is already *definable* in the ring: \(a < b\) if and only if \(b - a\) is a nonzero square. These matters will become precise once we have introduced languages, formulas, and definability.

### Languages and \(L\)-structures

The examples above all involved the same universe with different signatures. To compare structures that may have *different* universes but the same "shape" of signature, we need the notion of a **language**.

**Definition 4.6.** A **language** \(L\) consists of three sets of symbols:
- \(L_{\mathrm{con}}\): a set of **constant symbols**;
- \(L_{\mathrm{fun}}\): a set of **function symbols**, each equipped with a positive integer arity;
- \(L_{\mathrm{rel}}\): a set of **relation symbols**, each equipped with a positive integer arity.

A language is a purely *syntactic* object. The symbols carry no intrinsic meaning — they are not actually constants, functions, or relations; they are just symbols. An **\(L\)-structure** is then a structure \(\mathcal{M}\) together with an **interpretation**: a bijective correspondence between the symbols of \(L\) and the constants, basic functions, and basic relations of \(\mathcal{M}\), preserving arities. Concretely, to each constant symbol \(c \in L_{\mathrm{con}}\) there corresponds an element \(c^\mathcal{M} \in M\) (the *interpretation* of \(c\) in \(\mathcal{M}\); to each \(n\)-ary function symbol \(f \in L_{\mathrm{fun}}\) there corresponds a basic function \(f^\mathcal{M} : M^n \to M\); and to each \(k\)-ary relation symbol \(R \in L_{\mathrm{rel}}\) there corresponds a basic relation \(R^\mathcal{M} \subseteq M^k\).

The language is the **blueprint**; a structure is one particular **instance** of that blueprint. This is the critical distinction at the heart of model theory, and it corresponds to the distinction between *syntax* — the formal symbols and their grammar — and *semantics* — the actual mathematical objects those symbols refer to in a given structure. In practice we often suppress the superscript and write, say, \(+\) for both the function symbol in \(L\) and its interpretation in a structure. This is an abuse of notation that is universal in the literature, but one should always remember that the symbol and its interpretation are conceptually distinct.

**Example 4.7 (Language of (additive) groups).** The **language of additive groups** is \(L = \{0, +, -\}\) with one constant symbol \(0\), one binary function symbol \(+\), and one unary function symbol \(-\). Both \((\mathbb{R}, 0, +, -)\) and \(\mathbb{Z}/4\mathbb{Z}\) (with the obvious interpretations) are \(L\)-structures. Crucially, *not every* \(L\)-structure is a group — the definition of an \(L\)-structure imposes no axioms, only that the symbols be interpreted by objects of the right type and arity. For example, one can take the integers as universe, interpret \(0\) as the integer 1731, interpret \(+\) as the maximum function, and interpret \(-\) as the constant-zero function. This is a perfectly valid \(L\)-structure even though it satisfies no group axioms. Group axioms will enter later, when we discuss theories.

**Example 4.8 (Language of rings).** The **language of rings** is \(L = \{0, 1, +, -, \times\}\) with two constant symbols and three function symbols. Both \((\mathbb{R}, 0, 1, +, -, \times)\) and \((\mathbb{F}_5, 0, 1, +, -, \times)\) are \(L\)-structures.

**Example 4.9 (Language of \(F\)-vector spaces).** Fix a field \(F\). The **language of \(F\)-vector spaces** is \(L = \{0, +, -, \lambda_a : a \in F\}\), where each \(\lambda_a\) is a unary function symbol intended to denote scalar multiplication by \(a\). This is our first example of a language that may be *infinite*: if \(F = \mathbb{R}\), then \(L\) has uncountably many unary function symbols.

The reason for encoding scalar multiplication as a family of unary functions rather than a single binary function \(F \times V \to V\) is that our logic is **one-sorted**: basic functions must go from Cartesian powers of the universe to the universe. There is only one universe (the vector space \(V\), so the field \(F\) cannot appear as a separate sort; it becomes part of the *language*. This has a pleasant consequence: the \(L\)-substructures of an \(F\)-vector space \(V\) are precisely its **subspaces** (nonempty subsets closed under addition and under each \(\lambda_a\), matching the mathematical notion exactly. This illustrates the general principle: the right choice of language is the one that makes the substructure notion agree with the algebraic notion you care about.

---

## Lecture 17: Embeddings

### The Syntax/Semantics Distinction in Practice

Recall the definition: a language \(L\) is a collection of symbols with no intrinsic meaning. An \(L\)-structure assigns meaning to those symbols via an interpretation that preserves arity. The symbols are the syntax; the interpretations are the semantics. The whole enterprise of model theory rests on keeping this distinction visible and exploiting it.

As the professor observed in lecture 17: "The language is just a set of symbols. It doesn't have any intrinsic meaning. And then a structure is where you take those symbols and you give them meaning." In practice, we suppress the superscript that distinguishes a symbol from its interpretation — we write \(+\) both for the function symbol in \(L\) and for the actual addition in a ring. But this notational abuse, while universal, should never obscure the conceptual point.

### \(L\)-Embeddings and Substructures

We now fix a language and vary the universe. This leads to morphisms between \(L\)-structures.

**Definition 4.10 (Embedding).** Let \(\mathcal{M}\) and \(\mathcal{N}\) be \(L\)-structures. An **\(L\)-embedding** \(j : \mathcal{M} \to \mathcal{N}\) is an injective map \(j : M \to N\) such that:

1. \(j(c^\mathcal{M}) = c^\mathcal{N}\) for every constant symbol \(c \in L_{\mathrm{con}}\);
2. \(j(f^\mathcal{M}(a_1, \ldots, a_n)) = f^\mathcal{N}(j(a_1), \ldots, j(a_n))\) for every \(n\)-ary function symbol \(f \in L_{\mathrm{fun}}\) and all \(a_1, \ldots, a_n \in M\);
3. \((a_1, \ldots, a_k) \in R^\mathcal{M} \iff (j(a_1), \ldots, j(a_k)) \in R^\mathcal{N}\) for every \(k\)-ary relation symbol \(R \in L_{\mathrm{rel}}\) and all \(a_1, \ldots, a_k \in M\).

A surjective \(L\)-embedding is an **\(L\)-isomorphism**. We write \(\mathcal{M} \cong \mathcal{N}\) when an isomorphism exists.

Why injectivity, and why "embedding" rather than "homomorphism"? The answer is that in classical model theory, equality is always implicitly present. Even if \(=\) is not an explicit relation symbol in \(L\), we think of it as always being there. Condition 3 with \(R\) interpreted as equality immediately forces \(j\) to be injective. Insisting on injectivity in the definition is therefore a way of reflecting the conceptual fact that equality is never forgotten, regardless of whether we have explicitly included it in the language.

Note also the biconditional in condition 3. For functions (condition 2), we only require that \(j\) commutes with the function; we do not need an "only if" direction because functions are deterministic. For relations, however, the biconditional says that \(j\) preserves membership *in both directions*: a tuple satisfies the relation in \(\mathcal{M}\) if and only if its image satisfies the relation in \(\mathcal{N}\).

**Definition 4.11 (Substructure).** If \(M \subseteq N\) and the inclusion map is an \(L\)-embedding, we say \(\mathcal{M}\) is a **substructure** of \(\mathcal{N}\) and write \(\mathcal{M} \subseteq \mathcal{N}\). Equivalently, \(\mathcal{N}\) is an **extension** of \(\mathcal{M}\).

Unpacking the embedding conditions for the inclusion map, \(\mathcal{M} \subseteq \mathcal{N}\) means:

1. \(c^\mathcal{M} = c^\mathcal{N}\) for every constant symbol;
2. \(f^\mathcal{N} \upharpoonright M^n = f^\mathcal{M}\) for every \(n\)-ary function symbol (the restriction of the function in \(\mathcal{N}\) to the smaller universe gives the function in \(\mathcal{M}\);
3. \(R^\mathcal{N} \cap M^k = R^\mathcal{M}\) for every \(k\)-ary relation symbol.

Contrast this with the expansion/reduct notion from Lecture 16: there we fixed the universe and varied the signature. Here we fix the language and vary the universe. "Extension versus substructure" and "expansion versus reduct" are the two orthogonal ways of comparing structures.

**Proposition 4.12 (Criterion for substructures).** Let \(\mathcal{N}\) be an \(L\)-structure and let \(A \subseteq N\) be a nonempty subset of its universe. Then \(A\) is the universe of an \(L\)-substructure of \(\mathcal{N}\) if and only if:
- \(c^\mathcal{N} \in A\) for every constant symbol \(c \in L_{\mathrm{con}}\), and
- \(f^\mathcal{N}(a_1, \ldots, a_n) \in A\) for every function symbol \(f\) and every \(a_1, \ldots, a_n \in A\).

When this holds, there is a **unique** \(L\)-substructure with universe \(A\): the interpretations of function and constant symbols are inherited from \(\mathcal{N}\), and each relation \(R^\mathcal{M} = R^\mathcal{N} \cap A^k\).

The key observation is that *relations impose no closure condition*. One can always restrict a relation to a subset. Functions and constants, however, must actually land inside \(A\), which is the substantive condition.

**Example 4.13 (Substructures and language sensitivity).** The following table illustrates how the substructure notion depends on the choice of language, all for subsets of \(\mathbb{R}\):

| Language | Substructures of \(\mathbb{R}\) are... |
|---|---|
| \(L = \emptyset\) (empty language) | all nonempty subsets |
| \(L = \{0, +\}\) (additive monoid) | nonempty subsets containing 0 and closed under addition (monoids/semigroups) |
| \(L = \{0, +, -\}\) (additive group) | subgroups of \((\mathbb{R}, +)\) |
| \(L = \{0, 1, +, -, \times\}\) (ring) | subrings of \(\mathbb{R}\) |
| \(L = \{<\}\) (order) | all nonempty subsets (with induced ordering) |

This is why the language of groups includes the unary negation symbol: if it were omitted, the substructures of a group would be its sub-monoids, not its subgroups. The "right" language for studying groups is the one that makes the logical notion of substructure agree with the algebraic notion. The same principle applies to rings: including both 0, 1 and the three operations \(+, -, \times\) ensures that substructures are exactly subrings.

**Observation 4.14 (Embeddings reduce to substructures).** If \(j : \mathcal{M} \to \mathcal{N}\) is an \(L\)-embedding, let \(A = j(M) \subseteq N\) be the image. One can verify that \(A\) satisfies the criterion of Proposition 4.12, so there is a unique substructure \(\mathcal{A} \subseteq \mathcal{N}\) with universe \(A\). Moreover, \(j : \mathcal{M} \to \mathcal{A}\) is an isomorphism. In other words, to study \(L\)-embeddings it suffices to study substructures: every embedding identifies its domain with a substructure of its codomain.

---

## Lecture 18: Terms

### Why Formulas?

We now shift from semantics (structures) to syntax (formal expressions). There are two reasons to develop a formal language of formulas. First, formulas are used to *describe properties of structures*: to say "let \(\mathcal{M}\) be a partial order" one needs a way to express the partial order axioms, and those axioms will be formulas. Second, formulas are used to *define subsets* of a given structure. For example, within a ring one might want to isolate the multiplicative units — the elements \(x\) for which there exists a \(y\) with \(xy = 1\). That defining condition is a formula, and the set of units is the set of elements of the ring that *realize* it.

These two uses — describing classes of structures and defining subsets of a fixed structure — are, in a broad sense, what model theory is about.

### Variables

Before defining terms, we fix once and for all a countably infinite set \(\mathrm{Var} = \{v_0, v_1, v_2, \ldots\}\) of **variable symbols**. Like language symbols, variables are purely syntactic: they are symbols, not elements of any structure. The countability is a convention; in any given context only finitely many variables appear.

### Terms

Fix a language \(L\).

**Definition 4.15 (Term).** The set of **\(L\)-terms** is the smallest collection of finite strings of symbols from \(\mathrm{Var} \cup L_{\mathrm{con}} \cup L_{\mathrm{fun}} \cup \{(,\, ),\, ,\}\) satisfying:

1. Every variable symbol is an \(L\)-term.
2. Every constant symbol \(c \in L_{\mathrm{con}}\) is an \(L\)-term.
3. If \(f \in L_{\mathrm{fun}}\) has arity \(n\) and \(t_1, \ldots, t_n\) are \(L\)-terms, then the string \(f(t_1, \ldots, t_n)\) is an \(L\)-term.

Items 1 and 2 are the *base cases* (complexity 0), and item 3 is the *recursive step*: it takes terms already built and produces a new term of strictly greater complexity. One can alternatively characterize the set of \(L\)-terms as the smallest collection of strings containing all variables and constant symbols and closed under the operation of item 3. Note that relation symbols do not appear in the definition of terms — relations are not used to form terms.

The terms are, in the professor's phrase, **"syntactic polynomials"**: they are formal expressions built from variables and constants using the function symbols of the language. In the language of rings \(L = \{0, 1, +, -, \times\}\), every \(L\)-term (when interpreted in a ring) behaves like a polynomial with integer coefficients, and every such polynomial arises as the interpretation of some term. For instance, the term \(+(x_1,\, -(x_2),\, \times(1, x_2))\) is the formally-correct but unreadable syntactic object that we would naturally write as \(x_1 - x_2 \cdot 1x_2\) — though even here one must be careful: the abridgement from \(1 \cdot x_2\) to \(x_2\) is *not* permitted at the syntactic level, because it uses the fact that 1 is a multiplicative identity, which is an axiom, not a logical truth.

We write \(t(x_1, \ldots, x_n)\) to mean that all variables appearing in \(t\) come from the list \(x_1, \ldots, x_n\). Not all listed variables need actually appear in \(t\) — there may be dummy variables, just as one writes "a polynomial in three variables" even if one of the variables does not appear.

### Interpreting Terms

A term by itself has no meaning. To give it meaning, we need to fix a structure and a tuple of elements to plug in for the variables.

**Definition 4.16 (Interpretation of a term).** Let \(\mathcal{M}\) be an \(L\)-structure and let \(t(x_1, \ldots, x_n)\) be an \(L\)-term. The **interpretation** \(t^\mathcal{M} : M^n \to M\) is defined recursively:

1. If \(t = x_i\), then \(t^\mathcal{M}(a_1, \ldots, a_n) = a_i\) (projection onto the \(i\)-th coordinate).
2. If \(t = c\) is a constant symbol, then \(t^\mathcal{M}(a_1, \ldots, a_n) = c^\mathcal{M}\) (constant function with value the interpretation of \(c\).
3. If \(t = f(t_1, \ldots, t_l)\) where \(f\) is an \(l\)-ary function symbol, then
\[t^\mathcal{M}(a_1, \ldots, a_n) = f^\mathcal{M}\bigl(t_1^\mathcal{M}(a_1,\ldots,a_n),\; \ldots,\; t_l^\mathcal{M}(a_1,\ldots,a_n)\bigr).\]

A subtle point: the interpretation \(t^\mathcal{M}\) depends not only on the term \(t\) and the structure \(\mathcal{M}\), but also on the *presentation* of \(t\) — on which variables are listed and in which order. Consider the single-variable term \(t = x\). Presented as \(t(x)\), its interpretation is the identity map \(M \to M\). Presented as \(t(x, y)\), its interpretation is \(M^2 \to M\), \((a,b) \mapsto a\). Presented as \(t(y, x)\), it is \((a,b) \mapsto b\). This is the same phenomenon as viewing a polynomial in one variable as a polynomial in two or three variables: the underlying expression is the same, but the "type" of the function it represents changes.

The collection \(\mathcal{T}\) of all interpretations \(\{t^\mathcal{M} : t \text{ an } L\text{-term, any presentation}\}\) is the smallest collection of functions on Cartesian powers of \(M\) that contains all coordinate projections and all constant functions with value \(c^\mathcal{M}\) (for constant symbols \(c\), and that is closed under composition. In other words, the terms generate precisely the algebra of functions produced from the basic functions and constants via composition and projection. This makes precise the sense in which terms are "syntactic polynomials."

**Exercise 4.17.** A nonempty subset \(A \subseteq M\) is the universe of an \(L\)-substructure if and only if \(t^\mathcal{N}(A^n) \subseteq A\) for every \(L\)-term \(t\) in \(n\) variables. (This extends the earlier closure condition from basic functions to all terms, since closed under basic functions and constants implies closed under all terms.)

### Atomic Formulas

Terms are the building blocks for the simplest kind of formula.

**Definition 4.18 (Atomic formula).** An **atomic \(L\)-formula** is a string of one of the following two forms:

1. \((t_1 = t_2)\), where \(t_1\) and \(t_2\) are \(L\)-terms. This uses the **equality symbol**, which is a logical symbol always present in our formalism regardless of the language.
2. \(R(t_1, \ldots, t_k)\), where \(R \in L_{\mathrm{rel}}\) is a \(k\)-ary relation symbol and \(t_1, \ldots, t_k\) are \(L\)-terms.

So atomic formulas express either that two terms are equal, or that a tuple of terms stands in one of the basic relations of the language. They are the simplest non-trivial assertions one can make: "these two expressions evaluate to the same element" or "this tuple belongs to this relation." All more complex formulas are built from atomic ones.

---

## Lecture 19: Formulae

### Building Formulas from Atomic Ones

With terms and atomic formulas in hand, we can now define the full class of \(L\)-formulas. As with terms, the definition is inductive.

**Definition 4.19 (Formula).** The set of **\(L\)-formulas** is the smallest collection of finite strings of symbols from
\[\mathrm{Var} \cup L_{\mathrm{con}} \cup L_{\mathrm{fun}} \cup L_{\mathrm{rel}} \cup \{=,\; (,\; ),\; ,\; \neg,\; \wedge,\; \vee,\; \forall,\; \exists\}\]
satisfying:

1. Every atomic \(L\)-formula is an \(L\)-formula.
2. If \(\varphi\) and \(\psi\) are \(L\)-formulas, then so are \((\neg \varphi)\), \((\varphi \wedge \psi)\), and \((\varphi \vee \psi)\).
3. If \(\varphi\) is an \(L\)-formula and \(x \in \mathrm{Var}\), then \((\forall x\, \varphi)\) and \((\exists x\, \varphi)\) are \(L\)-formulas.

We introduce standard abbreviations: \((\varphi \to \psi)\) for \((\neg \varphi \vee \psi)\), and \((\varphi \leftrightarrow \psi)\) for \(((\varphi \to \psi) \wedge (\psi \to \varphi))\). Although one could in principle express everything using just \(\neg\) and \(\wedge\) (since \(\varphi \vee \psi\) is equivalent to \(\neg(\neg \varphi \wedge \neg \psi)\), we include all three connectives from the start.

As always, these are strings of symbols — they have no meaning until we fix a structure and a tuple in which to interpret them.

**Example 4.20 (Set theory).** In the **language of set theory** \(L = \{\in\}\) — a single binary relation symbol — the terms are just the variables (since there are no constant or function symbols). The atomic formulas are of the form \(x = y\) or \(x \in y\), where \(x, y\) are variables. The full class of \(L\)-formulas in this language is exactly the **definite conditions** introduced in the set theory part of the course. In particular, every axiom of ZFC is an \(L\)-sentence in this language (a formula with no free variables). For instance, the Axiom of Empty Set can be written \(\exists x\, \forall y\, (\neg(y \in x))\), and the formula
\[(x \in y) \wedge \forall z\bigl((z \in x) \to (z \in y)\bigr) \wedge \forall z\bigl((z \in y) \to \bigl((z \in x) \vee (z = x)\bigr)\bigr)\]
expresses "y is the successor of x" and has free variables x and y.

This connection is not a coincidence: the definition of "definite condition" in ZFC was precisely the definition of a formula in the language of set theory. We have now generalized it to arbitrary languages.

### Free and Bound Variables

The quantifiers \(\forall\) and \(\exists\) *capture* variable occurrences. This distinction is important.

**Definition 4.21 (Free and bound variables).** An **occurrence** of a variable \(x\) in a formula \(\varphi\) is **bound** if it appears within the scope of a quantifier \(\forall x\) or \(\exists x\); otherwise the occurrence is **free**. A formula with no free variable occurrences is an **\(L\)-sentence**.

We write \(\varphi(x_1, \ldots, x_n)\) to mean that all free occurrences of variables in \(\varphi\) come from the list \(x_1, \ldots, x_n\). As with terms, not all listed variables need actually appear freely; there may be dummy variables.

The intuition is sharp: a free variable is one about which the formula makes a statement; a bound variable is a dummy used purely to express a quantified condition. In the successor-of formula above, \(x\) and \(y\) are free (the formula says something about them) and \(z\) is bound (it is used only to say "every element of \(x\) is in \(y\)", with no residual dependence on \(z\).

If the same variable \(x\) appears both free and bound in a formula, we can always rename the bound occurrences with a fresh variable to obtain a logically equivalent formula (in any structure) in which each variable appears either only freely or only bound. We will always assume, without loss of generality, that no variable appears both free and bound in any formula we consider.

**Definition 4.22 (Special classes of formulas).** An \(L\)-formula is:
- **quantifier-free** if it contains no quantifiers (built from atomic formulas using only \(\neg, \wedge, \vee\);
- **existential** if it is of the form \(\exists y_1 \cdots \exists y_m\, \psi\) with \(\psi\) quantifier-free;
- **universal** if it is of the form \(\forall y_1 \cdots \forall y_m\, \psi\) with \(\psi\) quantifier-free.

These three classes will play a central role in Proposition 4.27 below.

---

## Lecture 20: Truth

### Satisfaction and the Semantics of Formulas

Formulas are strings of symbols; a formula becomes meaningful only when it is *interpreted* in a structure with a particular tuple substituted for its free variables. The definition of what it means for a tuple to satisfy a formula is the semantic counterpart to the syntactic definition of formulas, and it is likewise inductive.

Thinking about it concretely: suppose I have the formula \(\varphi(x)\) that says "there exists a \(z\) such that \(z \cdot z = x\)" (i.e., \(x\) is a perfect square). To ask whether the real number 2 satisfies this formula, I need to know: (a) which structure I am working in (the reals as a ring, say), and (b) whether there exists an element \(b\) in that structure such that \(b \cdot b = 2\). The answer is yes in \((\mathbb{R}, 0, 1, +, -, \times)\), no in \((\mathbb{Q}, 0, 1, +, -, \times)\), and yes in \((\mathbb{C}, 0, 1, +, -, \times)\). The formula is the same; the answer depends on both the structure and the element being tested.

**Definition 4.23 (Satisfaction / Truth).** Let \(\mathcal{M}\) be an \(L\)-structure, let \(\varphi(x_1, \ldots, x_n)\) be an \(L\)-formula, and let \(\mathbf{a} = (a_1, \ldots, a_n) \in M^n\). We define \(\mathcal{M} \models \varphi(\mathbf{a})\) — read "\(\mathcal{M}\) **satisfies** (or **realizes**, or **models**) \(\varphi\) at \(\mathbf{a}\)" — by induction on the complexity of \(\varphi\):

**Atomic cases:**
- If \(\varphi\) is \((t_1 = t_2)\): \(\mathcal{M} \models \varphi(\mathbf{a})\) iff \(t_1^\mathcal{M}(\mathbf{a}) = t_2^\mathcal{M}(\mathbf{a})\) (the two interpretations agree as elements of \(M\).
- If \(\varphi\) is \(R(t_1, \ldots, t_k)\): \(\mathcal{M} \models \varphi(\mathbf{a})\) iff \bigl(t_1^\mathcal{M}(\mathbf{a}), \ldots, t_k^\mathcal{M}(\mathbf{a})\bigr) \in R^\mathcal{M}\).

**Boolean cases:** (assuming the statement is already defined for simpler formulas \(\psi, \theta\)
- \(\mathcal{M} \models (\neg \psi)(\mathbf{a})\) iff \(\mathcal{M} \not\models \psi(\mathbf{a})\).
- \(\mathcal{M} \models (\psi \wedge \theta)(\mathbf{a})\) iff \(\mathcal{M} \models \psi(\mathbf{a})\) and \(\mathcal{M} \models \theta(\mathbf{a})\).
- \(\mathcal{M} \models (\psi \vee \theta)(\mathbf{a})\) iff \(\mathcal{M} \models \psi(\mathbf{a})\) or \(\mathcal{M} \models \theta(\mathbf{a})\) (inclusive or).

**Quantifier cases:** (where \(y\) is a variable that may or may not appear in \(\psi\)
- \(\mathcal{M} \models (\exists y\, \psi)(\mathbf{a})\) iff there exists \(b \in M\) such that \(\mathcal{M} \models \psi(\mathbf{a}, b)\).
- \(\mathcal{M} \models (\forall y\, \psi)(\mathbf{a})\) iff for all \(b \in M\), \(\mathcal{M} \models \psi(\mathbf{a}, b)\).

Each case takes the connective or quantifier at face value: the conjunction symbol means "and", the existential quantifier means "there exists an element in the universe." This is the natural definition — the structure gives meaning to the symbols.

**Definition 4.24 (Definable sets and sentences).** Given \(\mathcal{M}\) and \(\varphi(x_1, \ldots, x_n)\), define
\[\varphi^\mathcal{M} = \{(a_1, \ldots, a_n) \in M^n : \mathcal{M} \models \varphi(\mathbf{a})\}\]
to be the **set defined by \(\varphi\) in \(\mathcal{M}\)**, also called the **set of realizations** of \(\varphi\). This is a subset of \(M^n\), and it depends on the presentation of the free variables.

When \(n = 0\), \(\varphi\) is a sentence and there are no variables to plug in. Then \(\mathcal{M} \models \varphi\) is simply true or false — a **truth value**. We say \(\varphi\) is **true in \(\mathcal{M}\)** and write \(\mathcal{M} \models \varphi\). By the definition of negation, for any sentence \(\varphi\), exactly one of \(\mathcal{M} \models \varphi\) and \(\mathcal{M} \models \neg \varphi\) holds. There is no middle ground.

**Example 4.25.** In the language of rings, let \(\varphi(x)\) be the formula \(\exists z\, (z \cdot z = x)\) (asserting that \(x\) is a square).

- In \((\mathbb{R}, 0, 1, +, -, \times)\): the set \(\varphi^\mathbb{R} = [0, \infty)\) — exactly the nonnegative reals. In particular, the sentence \(\forall x\, \varphi(x)\) is false in \(\mathbb{R}\), since \(-1\) has no square root.
- In \((\mathbb{Q}, 0, 1, +, -, \times)\): the set \(\varphi^\mathbb{Q}\) is the set of perfect-square rationals \(\{n^2/m^2 : n,m \in \mathbb{Z},\, m \neq 0\}\). This is smaller than the set of nonnegative rationals: for example, 2 is nonnegative but has no rational square root.
- In \((\mathbb{C}, 0, 1, +, -, \times)\): the sentence \(\forall x\, \varphi(x)\) is *true*, since every complex number has a square root. Equivalently, \(\varphi^\mathbb{C} = \mathbb{C}\).

The same formula defines a different subset in each structure. This is the fundamental point: the meaning of a formula is not fixed; it depends on the structure.

### Quantifiers, Substructures, and the Preservation Theorem

The example above hints at a deeper phenomenon. Consider the integers \(\mathcal{Z} = (\mathbb{Z}, 0, +, -)\) as a substructure of the rationals \(\mathcal{Q} = (\mathbb{Q}, 0, +, -)\) in the language of additive groups. Let \(\psi(x, y)\) be the atomic formula \(y + y = x\) (asserting \(x = 2y\). For integer inputs, \(\mathcal{Z} \models \psi(a, b)\) if and only if \(\mathcal{Q} \models \psi(a, b)\): both structures agree that \(a = 2b\). This is the quantifier-free case.

Now let \(\varphi(x) = \exists y\, \psi(x,y)\), asserting "there exists \(y\) such that \(x = 2y\)." For \(x = 1\): \(\mathcal{Q} \models \varphi(1)\) (take \(y = 1/2\), but \(\mathcal{Z} \not\models \varphi(1)\) (no integer \(y\) satisfies \(2y = 1\). The existential quantifier ranges over the universe of the structure being evaluated in, so enlarging the universe can create new witnesses.

This discrepancy is precisely what the following proposition codifies. It is the first substantial theorem of model theory and the proof illustrates the inductive method on formulas.

**Proposition 4.26 (Preservation Theorem).** *Let \(\mathcal{M} \subseteq \mathcal{N}\) be \(L\)-structures, let \(\varphi(\mathbf{x})\) be an \(L\)-formula, and let \(\mathbf{a} \in M^n\). Then:*

*(a) If \(\varphi\) is quantifier-free: \(\mathcal{M} \models \varphi(\mathbf{a}) \iff \mathcal{N} \models \varphi(\mathbf{a})\).*

*(b) If \(\varphi\) is existential: \(\mathcal{M} \models \varphi(\mathbf{a}) \Rightarrow \mathcal{N} \models \varphi(\mathbf{a})\).*

*(c) If \(\varphi\) is universal: \(\mathcal{N} \models \varphi(\mathbf{a}) \Rightarrow \mathcal{M} \models \varphi(\mathbf{a})\).*

In summary: quantifier-free formulas are preserved in both directions between a substructure and an extension; existential formulas are preserved going *up* (to extensions); universal formulas are preserved going *down* (to substructures).

*Proof.* The argument has two layers of induction: first on terms, then on formulas.

**Claim (Term invariance).** For every \(L\)-term \(t(x_1, \ldots, x_n)\) and every \(\mathbf{a} \in M^n\),
\[t^\mathcal{N}(\mathbf{a}) = t^\mathcal{M}(\mathbf{a}).\]
That is, the interpretation of a term in the extension, evaluated at elements from the substructure, agrees with its interpretation in the substructure.

*Proof of Claim.* By induction on the complexity of \(t\).

**Base case \(t = x_i\).** Then \(t^\mathcal{N}(\mathbf{a}) = a_i = t^\mathcal{M}(\mathbf{a})\) by definition (both are projections onto the \(i\)-th coordinate, which of course agree on the same input).

**Base case \(t = c\) a constant symbol.** Then \(t^\mathcal{N}(\mathbf{a}) = c^\mathcal{N}\) and \(t^\mathcal{M}(\mathbf{a}) = c^\mathcal{M}\). Since \(\mathcal{M} \subseteq \mathcal{N}\), condition 1 of the substructure definition gives \(c^\mathcal{M} = c^\mathcal{N}\). So both sides agree.

**Inductive case \(t = f(t_1, \ldots, t_l)\).** The terms \(t_1, \ldots, t_l\) have strictly lower complexity, so the claim holds for each of them by induction hypothesis. Evaluating at \(\mathbf{a} \in M^n\):
\[t^\mathcal{N}(\mathbf{a}) = f^\mathcal{N}\bigl(t_1^\mathcal{N}(\mathbf{a}), \ldots, t_l^\mathcal{N}(\mathbf{a})\bigr) = f^\mathcal{N}\bigl(t_1^\mathcal{M}(\mathbf{a}), \ldots, t_l^\mathcal{M}(\mathbf{a})\bigr),\]
using the induction hypothesis in the second step. Now each \(t_i^\mathcal{M}(\mathbf{a}) \in M\), since the substructure is closed under interpretations of terms (Exercise 4.17). Since \(\mathcal{M} \subseteq \mathcal{N}\), condition 2 of the substructure definition says \(f^\mathcal{N} \upharpoonright M^l = f^\mathcal{M}\). Applying this:
\[f^\mathcal{N}\bigl(t_1^\mathcal{M}(\mathbf{a}), \ldots, t_l^\mathcal{M}(\mathbf{a})\bigr) = f^\mathcal{M}\bigl(t_1^\mathcal{M}(\mathbf{a}), \ldots, t_l^\mathcal{M}(\mathbf{a})\bigr) = t^\mathcal{M}(\mathbf{a}).\]
This completes the proof of the claim. \(\square\) (claim)

**Part (a): Quantifier-free formulas.** By induction on the complexity of \(\varphi\).

*Atomic case \(\varphi = (t_1 = t_2)\).* \(\mathcal{M} \models \varphi(\mathbf{a})\) iff \(t_1^\mathcal{M}(\mathbf{a}) = t_2^\mathcal{M}(\mathbf{a})\); by the claim, this is iff \(t_1^\mathcal{N}(\mathbf{a}) = t_2^\mathcal{N}(\mathbf{a})\), which is iff \(\mathcal{N} \models \varphi(\mathbf{a})\).

*Atomic case \(\varphi = R(t_1, \ldots, t_k)\).* By the claim, \(t_i^\mathcal{M}(\mathbf{a}) = t_i^\mathcal{N}(\mathbf{a})\) for all \(i\). The substructure condition 3 gives \(R^\mathcal{N} \cap M^k = R^\mathcal{M}\), and the \(k\)-tuple \bigl(t_1^\mathcal{M}(\mathbf{a}), \ldots, t_k^\mathcal{M}(\mathbf{a})\bigr) \in M^k\). So membership in \(R^\mathcal{M}\) and in \(R^\mathcal{N}\) are equivalent, giving the biconditional.

*Boolean cases.* These are immediate from the definitions: \(\mathcal{M} \models (\neg \psi)(\mathbf{a})\) iff \(\mathcal{M} \not\models \psi(\mathbf{a})\), which by induction is iff \(\mathcal{N} \not\models \psi(\mathbf{a})\), which is iff \(\mathcal{N} \models (\neg\psi)(\mathbf{a})\). And and or are handled symmetrically.

**Part (b): Existential formulas.** Write \(\varphi = \exists y_1 \cdots \exists y_m\, \psi\) with \(\psi\) quantifier-free. If \(\mathcal{M} \models \varphi(\mathbf{a})\), then there exist \(\mathbf{b} = (b_1, \ldots, b_m) \in M^m\) such that \(\mathcal{M} \models \psi(\mathbf{a}, \mathbf{b})\). Since \(\psi\) is quantifier-free and \((\mathbf{a}, \mathbf{b}) \in M^{n+m}\), part (a) gives \(\mathcal{N} \models \psi(\mathbf{a}, \mathbf{b})\). Since \(\mathbf{b} \in M \subseteq N\), the same tuple witnesses \(\mathcal{N} \models \varphi(\mathbf{a})\).

**Part (c): Universal formulas.** Write \(\varphi = \forall y_1 \cdots \forall y_m\, \psi\) with \(\psi\) quantifier-free. If \(\mathcal{N} \models \varphi(\mathbf{a})\), then for every \(\mathbf{b} \in N^m\), \(\mathcal{N} \models \psi(\mathbf{a}, \mathbf{b})\). In particular this holds for every \(\mathbf{b} \in M^m \subseteq N^m\). By part (a), \(\mathcal{M} \models \psi(\mathbf{a}, \mathbf{b})\) for every such \(\mathbf{b}\), hence \(\mathcal{M} \models \varphi(\mathbf{a})\). \(\square\)

The essential content of the proof is that quantifier-free truth is "algebraic" — it depends only on the operations of the structure applied to a fixed tuple, and substructures inherit those operations faithfully. As soon as we introduce an existential quantifier, we ask "does there *exist* a witness in the universe?", and passing to a larger universe can only create more witnesses, not destroy them. Conversely, a universal statement asks "does *every* element of the universe satisfy this?", which can only be easier to satisfy in a smaller universe.

---
## Lectures 21a & 21b: Elementary Substructures

### From Substructures to Elementary Substructures

One of the first substantial theorems in this part of the course is a clean description of how truth behaves when you pass between a structure and a substructure. Before introducing the central new concept, it is worth recalling what we already know. A substructure is the model-theoretic generalisation of a subgroup, a subring, a subfield, and so on: the universe of \(\mathcal{M}\) sits inside the universe of \(\mathcal{N}\), and every basic function and relation of \(L\) restricts correctly. We proved:

**Proposition 4.21 (Substructures and quantifier-free truth).** *If \(\mathcal{M} \subseteq \mathcal{N}\) is an \(L\)-substructure, \(\varphi(\mathbf{x})\) is a quantifier-free \(L\)-formula, and \(\mathbf{a} \in M^n\), then \(\mathcal{M} \models \varphi(\mathbf{a}) \iff \mathcal{N} \models \varphi(\mathbf{a})\).*

The proof goes by induction on formula complexity. The key input is the **Claim**: for any \(L\)-term \(t(\mathbf{x})\) and \(\mathbf{a} \in M^n\), the interpretation of \(t\) in \(\mathcal{M}\) evaluated at \(\mathbf{a}\) coincides with its interpretation in \(\mathcal{N}\) evaluated at \(\mathbf{a}\). This is exactly what you would expect: the algebra of the substructure is just the restriction of the algebra of the larger structure, so terms — which encode that algebra — agree. The atomic case (which comes in two flavours: equality of terms, and a relation applied to terms) reduces immediately to the Claim. Then negation, conjunction, and disjunction pass through by straightforward induction. Since we only have quantifier-free formulas there is no quantifier step.

We also proved a refinement: if \(\varphi(\mathbf{x})\) is an **existential** formula (a block of existential quantifiers followed by a quantifier-free formula), then \(\mathcal{M} \models \varphi(\mathbf{a})\) implies \(\mathcal{N} \models \varphi(\mathbf{a})\) — but not necessarily the other direction. The intuition is transparent: if something exists in the smaller structure, it surely exists in the bigger one. Conversely, **universal** formulas (a block of universals followed by quantifier-free) travel in the opposite direction: truth in the extension implies truth in the substructure. If something holds everywhere in the big universe, it holds in particular everywhere in the small one.

These observations apply equally to any \(L\)-embedding \(j : \mathcal{M} \to \mathcal{N}\), not just substructures; one just puts \(j(\mathbf{a})\) in place of \(\mathbf{a}\) on the right-hand side. But for a general formula — one where existential and universal quantifiers alternate — neither direction is guaranteed. As Prof. Moosa put it in lecture: the complication in syntax comes precisely from the **alternation** of quantifiers. That is where the interesting logic lives.

### Elementary Embeddings and Elementary Substructures

This motivates the central definition of the unit.

**Definition 4.23.** An \(L\)-embedding \(j : \mathcal{M} \to \mathcal{N}\) is an **elementary embedding** if for all \(L\)-formulas \(\varphi(\mathbf{x})\) and all \(\mathbf{a} \in M^n\):
\[\mathcal{M} \models \varphi(\mathbf{a}) \iff \mathcal{N} \models \varphi(j(\mathbf{a})).\]
If \(\mathcal{M} \subseteq \mathcal{N}\) and the inclusion map is an elementary embedding, we say \(\mathcal{M}\) is an **elementary substructure** of \(\mathcal{N}\), written \(\mathcal{M} \prec \mathcal{N}\).

The notation \(\prec\) is chosen to echo \(\subseteq\) but to signal that something much stronger is at work. A substructure is an algebraic notion — it is exactly what a group theorist or ring theorist would call a subobject. An elementary substructure is something coming out of model theory itself: not only must the basic algebra be compatible, but every first-order truth about elements of \(M\) must be the same whether computed in \(\mathcal{M}\) or in \(\mathcal{N}\).

There is a useful special case to note immediately: taking \(n = 0\), i.e., considering \(L\)-sentences (formulas with no free variables), the definition says that \(\mathcal{M}\) and \(\mathcal{N}\) satisfy exactly the same \(L\)-sentences. Elementary substructures are not just algebraically compatible — they are indistinguishable by any first-order property.

**Corollary 4.24 (Isomorphisms are elementary).** *Every \(L\)-isomorphism is an elementary embedding.*

*Proof.* Let \(j : \mathcal{M} \to \mathcal{N}\) be an isomorphism. We prove \(\mathcal{M} \models \varphi(\mathbf{a}) \iff \mathcal{N} \models \varphi(j(\mathbf{a}))\) by induction on the complexity of \(\varphi\). The atomic and quantifier-free cases are immediate from the embedding property. Boolean connectives are trivial by induction. For the existential step: \(\mathcal{M} \models \exists y\, \psi(\mathbf{a}, y)\) iff some \(b \in M\) witnesses \(\mathcal{M} \models \psi(\mathbf{a}, b)\), which by induction gives \(\mathcal{N} \models \psi(j(\mathbf{a}), j(b))\). Conversely, if some \(c \in N\) satisfies \(\mathcal{N} \models \psi(j(\mathbf{a}), c)\), surjectivity gives \(c = j(b)\) for some \(b \in M\), and then by induction \(\mathcal{M} \models \psi(\mathbf{a}, b)\). Universal quantifiers follow by taking negations. \(\square\)

It is surjectivity that makes the existential step work in both directions. For a mere embedding — injective but not surjective — you only get one direction, as we saw with existential formulas above.

### The Example: \(\mathbb{Z} \subseteq \mathbb{Q}\) but \(\mathbb{Z} \not\prec \mathbb{Q}\)

The cleanest illustration of the gap between substructures and elementary substructures is the additive groups \((\mathbb{Z}, 0, +, -)\) and \((\mathbb{Q}, 0, +, -)\). The integers are certainly a subgroup of the rationals — a substructure in the language of groups. But they fail to be an elementary substructure. The witnessing formula is simple:
\[\varphi(x) :\equiv \exists y\,(y + y = x).\]
This says "x is twice some y," or equivalently, "x is even" in the group-theoretic sense. Take \(x = 1\). Then \(\mathbb{Q} \models \varphi(1)\), since \(y = \tfrac{1}{2}\) is a witness. But \(\mathbb{Z} \not\models \varphi(1)\), since no integer when added to itself gives 1. Here \(1\) is an element of the smaller structure, and the two structures disagree on what \(\varphi\) says about it. This is precisely what the definition forbids.

This single counterexample settles the question. But the professor pushed further in Lecture 21b, proving the following striking theorem:

**Proposition (No proper elementary subgroups of \(\mathbb{Q}\).** *The additive group \((\mathbb{Q}, 0, +, -)\) has no proper elementary subgroups.*

*Proof.* Suppose \(\mathcal{G} \prec (\mathbb{Q}, 0, +, -)\) with \(\mathcal{G} = (G, 0, +, -)\). We show \(G = \mathbb{Q}\).

Since \(\mathbb{Q} \models \exists x (x \neq 0)\) is an \(L\)-sentence, and the \(n = 0\) case of the elementary substructure definition says both structures satisfy the same sentences, we get \(\mathcal{G} \models \exists x(x \neq 0)\), so there is some non-zero \(a \in G\). Writing \(a = n/m\) with \(n, m > 0\) (we may assume positivity since \(\mathcal{G}\) is a subgroup and closed under negation), note that since \(\mathcal{G}\) is a subgroup, \(a + a + \cdots + a\) (\(m\) times) lies in \(G\); this equals \(n \in \mathbb{Z}\). So \(G\) contains a positive integer, call it \(N\).

Now the rationals are \(N\)-divisible: for the sentence \(\sigma_N \equiv \forall x \exists y (y + y + \cdots + y = x)\) (\(N\) copies of \(y\), we have \(\mathbb{Q} \models \sigma_N\). Since \(\mathcal{G} \prec \mathbb{Q}\), also \(\mathcal{G} \models \sigma_N\). Applying this to the element \(N \in G\): \(\mathbb{Q} \models \exists y (y + \cdots + y = N)\) (this is a statement about an element of \(G\) that is true in \(\mathbb{Q}\), so by the definition of \(\prec\) there exists \(L \in G\) with \(\mathbb{Q} \models N \cdot L = N\). In the rationals, the unique solution is \(L = 1\). So \(1 \in G\).

A subgroup containing \(1\) contains all integers. And for each positive integer \(k\), the sentence \(\tau_k \equiv \forall x \exists y (y + \cdots + y = x)\) (\(k\) copies) is true in \(\mathbb{Q}\), hence true in \(\mathcal{G}\) since \(\mathcal{G} \prec \mathbb{Q}\). So \(\mathcal{G}\) is \(k\)-divisible for every \(k\), and contains \(\mathbb{Z}\). But \(\mathbb{Q}\) is precisely the divisible hull of \(\mathbb{Z}\): every rational \(a/k\) lies in \(G\) because \(a \in G\) and \(k\)-divisibility gives a preimage. Hence \(G = \mathbb{Q}\). \(\square\)

The key moment in the proof deserves emphasis. We use the sentence \(\exists y (y + \cdots + y = N)\) — an existential formula — and we descend from \(\mathbb{Q}\) to \(\mathcal{G}\). For a plain substructure, existential truth only goes upward. The whole power of the elementary condition is precisely that existential witnesses can also be pulled downward.

---

## Lectures 22a & 22b: Tarski-Vaught and Downward Löwenheim-Skolem

### Isomorphisms Are Elementary: A First Observation

Before proceeding to the main theorem of Lecture 22, the professor noted something that should have been said from the start: isomorphisms are a natural, ever-present source of elementary embeddings (Corollary 4.24 above). In particular, the identity map on any structure is an automorphism, hence an elementary embedding, so every structure is an elementary substructure of itself. Elementary substructures are common at the trivial end; the interesting question is when non-trivial, proper elementary substructures exist.

### The Tarski-Vaught Test

The central difficulty with checking that \(\mathcal{M} \prec \mathcal{N}\) directly is that one must verify a condition for every formula of every complexity. The **Tarski-Vaught Test** reduces this infinite task to a single, elegant criterion. Its intuition is already visible in the \(\mathbb{Z} \subseteq \mathbb{Q}\) example: what went wrong there was precisely that an existential statement — "there exists a \(y\) such that \(y + y = 1\)" — was true in \(\mathbb{Q}\) with a parameter from \(\mathbb{Z}\), but had no witness in \(\mathbb{Z}\) itself. That pattern is not just an example; it is the only thing that can fail.

**Proposition 4.26 (Tarski-Vaught Test).** *Suppose \(\mathcal{M} \subseteq \mathcal{N}\). Then \(\mathcal{M} \prec \mathcal{N}\) if and only if the following condition holds:*

*\((\star)\): For every \(L\)-formula \(\varphi(\mathbf{x}, y)\) and every \(\mathbf{a} \in M^n\), if \(\mathcal{N} \models \exists y\, \varphi(\mathbf{a}, y)\), then there exists \(b \in M\) such that \(\mathcal{N} \models \varphi(\mathbf{a}, b)\).*

Condition \((\star)\) should be read as: whenever \(\mathcal{N}\) believes that a solution to a formula with parameters from \(M\) exists, it already has a witness inside \(M\). Truth is always computed in the big structure \(\mathcal{N}\); the point is that the witnesses can be found in the small one.

*Proof.*

\((\Rightarrow)\): Assume \(\mathcal{M} \prec \mathcal{N}\) and \(\mathcal{N} \models \exists y\, \varphi(\mathbf{a}, y)\). Let \(\psi(\mathbf{x}) \equiv \exists y\, \varphi(\mathbf{x}, y)\). Then \(\mathcal{N} \models \psi(\mathbf{a})\). By the elementary substructure condition applied to \(\psi\), we get \(\mathcal{M} \models \psi(\mathbf{a})\), i.e., some \(b \in M\) satisfies \(\mathcal{M} \models \varphi(\mathbf{a}, b)\). Since \(\mathcal{M} \prec \mathcal{N}\), also \(\mathcal{N} \models \varphi(\mathbf{a}, b)\).

\((\Leftarrow)\): Assume \((\star)\). We prove \(\mathcal{M} \models \theta(\mathbf{a}) \iff \mathcal{N} \models \theta(\mathbf{a})\) for all formulas \(\theta\) and \(\mathbf{a} \in M^n\), by induction on complexity. The base case (quantifier-free) is Proposition 4.21: substructures agree on all quantifier-free truth. Boolean connectives are trivial. The only hard case is \(\theta(\mathbf{x}) = \exists y\, \varphi(\mathbf{x}, y)\).

If \(\mathcal{M} \models \theta(\mathbf{a})\), pick \(b \in M\) with \(\mathcal{M} \models \varphi(\mathbf{a}, b)\); by induction (since \(\varphi\) is simpler than \(\theta\) we get \(\mathcal{N} \models \varphi(\mathbf{a}, b)\), so \(\mathcal{N} \models \theta(\mathbf{a})\).

Conversely, if \(\mathcal{N} \models \theta(\mathbf{a})\), that is, \(\mathcal{N} \models \exists y\, \varphi(\mathbf{a}, y)\): condition \((\star)\) gives \(b \in M\) with \(\mathcal{N} \models \varphi(\mathbf{a}, b)\). By induction again (applied to \(\varphi\), \(\mathcal{M} \models \varphi(\mathbf{a}, b)\), so \(\mathcal{M} \models \theta(\mathbf{a})\). Universal quantifiers follow by the logical equivalence \(\forall y = \neg \exists y \neg\). \(\square\)

A practically very useful reformulation emerges when one uses the parameter language \(L_M\): \(\mathcal{M} \prec \mathcal{N}\) if and only if for every \(L_M\)-formula \(\varphi(y)\) in one free variable, if \(\mathcal{N} \models \exists y\, \varphi(y)\) then there is a witness \(b \in M\). The parameters are buried inside the \(L_M\)-formula rather than displayed explicitly, making the condition cleaner.

The Tarski-Vaught Test can also be rephrased as a criterion for a subset to be the universe of an elementary substructure. If \(A \subseteq M\), then \(A\) is the universe of an elementary substructure of \(\mathcal{M}\) if and only if for every formula \(\varphi(\mathbf{x}, y)\) and \(\mathbf{a} \in A^n\), if \(\mathcal{M} \models \exists y\, \varphi(\mathbf{a}, y)\) then there exists \(b \in A\) with \(\mathcal{M} \models \varphi(\mathbf{a}, b)\). In other words: \(A\) is **closed under witnesses to existential truths** (where truth is computed in \(\mathcal{M}\). The special formulas \(\varphi(y) \equiv (y = y)\), \(\varphi(y) \equiv (y = c)\) for constants \(c\), and \(\varphi(y) \equiv (y = f(\mathbf{a}))\) for function symbols \(f\) already force \(A\) to be non-empty, to contain all constants, and to be closed under all basic functions — confirming that the condition subsumes the substructure requirement.

### Downward Löwenheim-Skolem

The Tarski-Vaught criterion leads immediately to a fundamental theorem of model theory, which, as the professor noted, predates much of the framework we have been building — it goes back to Löwenheim (1915) and Skolem (1920), though phrased in modern language by Tarski. Its conceptual import is striking: however large a structure may be, it always has a *small* elementary substructure.

**Theorem 4.27 (Downward Löwenheim-Skolem).** *Let \(\mathcal{M}\) be an \(L\)-structure and \(A \subseteq M\). Set \(\kappa = \max\{|A|, |L|, \aleph_0\}\). Then there exists an elementary substructure \(\mathcal{N} \prec \mathcal{M}\) with \(A \subseteq N\) and \(|N| \leq \kappa\).*

In particular, if \(L\) is countable and \(A = \emptyset\), then \(\kappa = \aleph_0\) and every \(L\)-structure has a countable elementary substructure.

The cardinality bound \(\kappa\) is sharp: one cannot do better than \|A|\) (the substructure must contain the seed set), nor better than \|L|\) (it must contain all interpretations of constant symbols and be closed under function symbols), nor make it finite (a finite elementary substructure would force the whole structure to be finite). Adding \(\aleph_0\) ensures the bound is infinite even when the language and seed are finite.

*Proof sketch.* The construction is a "Skolem closure." Set \(A_0 = A\). Given \(A_i\), let \(A_{i+1}\) be \(A_i\) together with, for each formula \(\varphi(\mathbf{x}, y)\) and each \(\mathbf{a} \in A_i^n\) with \(\mathcal{M} \models \exists y\, \varphi(\mathbf{a}, y)\), a chosen witness. The number of pairs \((\varphi, \mathbf{a})\) at stage \(i\) is bounded by \(\kappa\) (there are at most \(\kappa\)-many formulas, since they are finite strings from a set of symbols of size \(\kappa\), and at most \(\kappa\)-many tuples from \(A_i\) which by induction has size \(\leq \kappa\), so \(|A_{i+1}| \leq \kappa\). Put \(B = \bigcup_{i < \omega} A_i\). Then \(|B| \leq \kappa \cdot \aleph_0 = \kappa\). By construction, \(B\) satisfies the Tarski-Vaught criterion: any finite tuple from \(B\) lies in some \(A_i\), and witnesses are added at stage \(A_{i+1} \subseteq B\). By the corollary to the Tarski-Vaught Test, \(B\) is the universe of an elementary substructure \(\mathcal{N} \prec \mathcal{M}\) with \(A \subseteq B = N\). \(\square\)

Note how non-constructive this is: one ranges over all formulas and all tuples and throws in witnesses without any control over which witnesses are chosen. The theorem does not tell you which elementary substructure you get — it only guarantees one exists. That is precisely why more specific results (such as the fact that \((\mathbb{Q}, 0, +, -)\) is an elementary subgroup of \((\mathbb{R}, 0, +, -)\) require separate arguments. As the professor remarked: the rationals are countable, and the reals have a countable elementary subgroup by the theorem, but the theorem does not tell you it is the rationals.

---

## Lecture 23: Definable Sets and Parameters

### Naming Constants — the Language \(L_B\)

So far we have been studying what can be said in a fixed language \(L\) about the elements of a structure. But it is very natural to want to refer to specific elements of the universe — for instance, to say "x is bigger than \(\pi\)" in the ordered ring of reals, or to define the interval \((0, \pi)\). Since \(\pi\) is not a constant in the language of rings, we need to extend the language.

The solution is elegant and simple. Let \(\mathcal{M}\) be an \(L\)-structure and \(B \subseteq M\). The language \(L_B\) is obtained by adding a new constant symbol \(\bar{b}\) for each \(b \in B\) (distinct elements get distinct new symbols, all distinct from symbols already in \(L\). We then expand \(\mathcal{M}\) to an \(L_B\)-structure \(\mathcal{M}_B\) by interpreting \(\bar{b}\) as \(b\) and leaving all \(L\)-symbols unchanged. This is the canonical expansion. (There are many other ways to make \(\mathcal{M}\) into an \(L_B\)-structure, but this is the right one.) In practice, we almost always drop the bar and write \(b\) both for the element and its name, relying on context to resolve the syntax/semantics distinction.

The Tarski-Vaught Test can be rephrased neatly: \(\mathcal{M} \prec \mathcal{N}\) if and only if for every \(L_M\)-formula \(\varphi(y)\) in one free variable, \(\mathcal{N} \models \exists y\, \varphi(y)\) implies there is a witness \(b \in M\). The parameters are now hidden inside the language, and the test reads: \(M\) is closed under witnesses to existential \(L_M\)-truths (where truth is computed in \(\mathcal{N}\).

### Definable Sets

**Definition 4.29 (Definable set).** Let \(\mathcal{M}\) be an \(L\)-structure and \(B \subseteq M\). A set \(X \subseteq M^n\) is **\(B\)-definable** in \(\mathcal{M}\) if there exists an \(L_B\)-formula \(\varphi(\mathbf{x})\) such that
\[X = \varphi^{\mathcal{M}} = \{\mathbf{a} \in M^n : \mathcal{M}_B \models \varphi(\mathbf{a})\}.\]
Equivalently, in terms of the original language \(L\): there exist an \(L\)-formula \(\psi(\mathbf{x}, \mathbf{y})\) and parameters \(\mathbf{b} \in B^m\) such that \(X = \{\mathbf{a} \in M^n : \mathcal{M} \models \psi(\mathbf{a}, \mathbf{b})\}\). We say \(X\) is **definable** (in \(\mathcal{M}\) if it is \(M\)-definable, and **0-definable** or **parameter-free** if it is \(\emptyset\)-definable.

Every definable set is \(B\)-definable for some finite \(B\), since formulas are finite objects and can only involve finitely many parameter symbols.

### Examples of Definable Sets

The motivating example with which the professor opened Lecture 23 is the ordered ring of real numbers. One can define the interval \((0,1)\) as the solution set of \(0 < x \wedge x < 1\), where 0 and 1 are constants. The interval \((0, \tfrac{1}{2})\) can be defined without a name for \(\tfrac{1}{2}\): the formula \(\exists y (y + y = 1 \wedge x < y)\) in one free variable \(x\) says "there exists a half and I am less than it," giving exactly \((0, \tfrac{1}{2})\). General rational endpoints are reachable by similar tricks. But the interval \((0, \pi)\) requires naming \(\pi\) explicitly — one must work in the expanded language \(L_{\{\pi\}}\) to write \(0 < x \wedge x < \bar{\pi}\).

The broader picture of definable sets in rings is laid out in Examples 4.31–4.34 of the notes:

*Example 4.31 (Algebraic sets).* In any commutative unitary ring \(\mathcal{R}\), the common zero set of polynomials \(p_1, \ldots, p_\ell \in R[X_1, \ldots, X_n]\),
\[V(p_1, \ldots, p_\ell) = \{\mathbf{a} \in R^n : p_1(\mathbf{a}) = \cdots = p_\ell(\mathbf{a}) = 0\},\]
is quantifier-free definable by the conjunction \(\bigwedge_i (p_i(x_1, \ldots, x_n) = 0)\). These are called **algebraic sets** or Zariski-closed sets, and their finite Boolean combinations are the **Zariski-constructible sets** — which are exactly the quantifier-free definable sets in any commutative unitary ring.

*Example 4.32 (Ordering in \(\mathbb{R}\) is existentially definable).* In \((\mathbb{R}, 0, 1, +, -, \times)\), the non-negative reals are defined by \(\exists z(z^2 = x)\) — a real number has a square root iff it is non-negative. Consequently, the ordering is recovered by \(x < y \iff \exists z ((z \neq 0) \wedge (y - x = z^2))\). This is a quantifier-bearing formula, and it cannot be replaced by one without: the positive reals are not Zariski-constructible in one variable (they are infinite and co-infinite).

*Example 4.33 (Ordering in \(\mathbb{Z}\) via Lagrange).* By Lagrange's four-square theorem, every non-negative integer is a sum of four squares. Hence in \((\mathbb{Z}, 0, 1, +, -, \times)\), the ordering is 0-definable: \(m < n \iff \exists z_1 z_2 z_3 z_4 ((z_1 \neq 0) \wedge (n - m = z_1^2 + z_2^2 + z_3^2 + z_4^2))\).

### Automorphisms Preserve Definable Sets

The proposition below is one of the most useful tools for proving that sets are *not* definable. Its proof is a two-line unwinding of definitions, but its consequences are substantial.

**Lemma 4.37 (Automorphisms and definability).** *If \(X \subseteq M^n\) is \(B\)-definable and \(f\) is an \(L\)-automorphism of \(\mathcal{M}\) fixing every element of \(B\) pointwise, then \(f(X) = X\).*

*Proof.* Write \(X = \{\mathbf{a} : \mathcal{M} \models \psi(\mathbf{a}, \mathbf{b})\}\) for an \(L\)-formula \(\psi\) and \(\mathbf{b} \in B\). Since \(f\) is an isomorphism it is elementary (Corollary 4.24), so \(\mathcal{M} \models \psi(\mathbf{a}, \mathbf{b}) \iff \mathcal{M} \models \psi(f(\mathbf{a}), f(\mathbf{b}))\). Since \(f\) fixes \(\mathbf{b}\), this becomes \(\mathcal{M} \models \psi(\mathbf{a}, \mathbf{b}) \iff \mathcal{M} \models \psi(f(\mathbf{a}), \mathbf{b})\), i.e., \(\mathbf{a} \in X \iff f(\mathbf{a}) \in X\). \(\square\)

**Application 1 (The interval \((0,1)\) is not 0-definable in \((\mathbb{R}, <)\).** The map \(j : x \mapsto x + 1\) is an automorphism of \((\mathbb{R}, <)\) — shifting by 1 is a bijection that preserves order. If \((0,1)\) were 0-definable, Lemma 4.37 with \(B = \emptyset\) would force \(j((0,1)) = (0,1)\). But \(j((0,1)) = (1,2) \neq (0,1)\). So \((0,1)\) is not 0-definable. (It is, of course, \(\{0,1\}\)-definable, as \(0 < x \wedge x < 1\).)

**Application 2 (Addition is not definable in \((\mathbb{R}, <)\).** The graph of addition \(\{(x, y, z) : x + y = z\} \subseteq \mathbb{R}^3\) is not definable in the pure ordering, even with parameters. Suppose it were definable with parameters \(b_1 < b_2 < \cdots < b_m\). Choose \(c > b_m\) and define \(j\) to be the identity on \((-\infty, c]\) and \(x \mapsto c + \tfrac{x-c}{2}\) on \((c, \infty)\) (squeezing everything above \(c\) toward \(c\) by a factor of 2). This is an automorphism of \((\mathbb{R}, <)\) fixing all \(b_i\). But it does not preserve the graph of addition: if \((c+1, c+1, 2c+2)\) is in the graph (and it is), then its image under \(j\) is \((c + \tfrac{1}{2}, c + \tfrac{1}{2}, c + 1)\), and \((c + \tfrac{1}{2}) + (c + \tfrac{1}{2}) = 2c + 1 \neq c + 1\). So the graph of addition is not in this set, contradiction.

This shows that the ordering of the reals, by itself, carries no information about the ring structure. The ring structure is genuinely extra data.

**Corollary 4.38 (\(\mathbb{R}\) is not definable in \(\mathbb{C}\).** The field \(\mathbb{R}\) (as a subset of \(\mathbb{C}\) is not definable in \((\mathbb{C}, 0, 1, +, -, \times)\). Any would-be definition involves a finite parameter set \(B\). Since \(\mathbb{C}\) has transcendence degree \(\geq 1\) over \(\mathbb{Q}(B)^{\mathrm{alg}}\), one can construct an automorphism of \(\mathbb{C}\) fixing \(B\) but moving some element of \(\mathbb{R}\) outside \(\mathbb{R}\). By Lemma 4.37, this contradicts definability.

The deeper reason is that \(\mathbb{C}\), being algebraically closed, has many automorphisms (in fact \(2^{2^{\aleph_0}}\)-many over \(\mathbb{Q}\), and these automorphisms act richly on transcendental elements. No first-order formula can pin down \(\mathbb{R}\) inside \(\mathbb{C}\) because the automorphism group is too large.

Finally, we record the general characterisation of definable sets in terms of closure operations:

**Proposition 4.40.** *The collection \(\mathrm{Def}(\mathcal{M})\) of all definable subsets of all Cartesian powers of \(M\) is the smallest collection closed under: graphs of basic functions and relations; diagonals \(\{(a_1,\ldots,a_n): a_i = a_j\}\); products \(X \times M\); Boolean operations; projections; and taking fibres \(X_\mathbf{b} = \{\mathbf{a}: (\mathbf{a},\mathbf{b}) \in X\}\).*

---

## Lectures 24a & 24b: Algebraic and Semi-algebraic Sets

### The Geometry of Definable Sets in Rings

In Lectures 24a and 24b the professor stepped back to survey the landscape of definable sets in rings, asking a natural and far-reaching question: given a commutative unitary ring \(\mathcal{R} = (R, 0, 1, +, -, \times)\), what are all its definable sets?

We have already identified the quantifier-free definable sets. An **algebraic set** is the common zero set of finitely many polynomials \(p_1, \ldots, p_\ell \in R[X_1, \ldots, X_n]\):
\[V(p_1, \ldots, p_\ell) = \{\mathbf{a} \in R^n : p_1(\mathbf{a}) = \cdots = p_\ell(\mathbf{a}) = 0\}.\]
These form the closed sets of the **Zariski topology** on \(R^n\). Their finite Boolean combinations are the **Zariski-constructible sets**. The key point (which uses the fact that \(L_R\)-terms in \(n\) variables agree precisely with polynomials in \(n\) variables over \(R\), generalising the homework exercise on integer-coefficient terms) is:

**Fact.** *In any commutative unitary ring, the quantifier-free definable sets are exactly the Zariski-constructible sets.*

The argument: atomic \(L_R\)-formulas are of the form \(t(\mathbf{x}) = s(\mathbf{x})\) for terms \(t, s\), i.e., \((t-s)(\mathbf{x}) = 0\) for a polynomial \(t - s\). So the atomically definable sets are the hypersurfaces. Quantifier-free definable sets are Boolean combinations of hypersurfaces. By disjunctive normal form, every such Boolean combination can be written as a finite union \(\bigcup_i (V_i \setminus W_i)\) with \(W_i \subseteq V_i\) algebraic — exactly the constructible sets.

The definable sets in the ring language are at least as complex as the quantifier-free ones. The dramatic question is whether quantifiers can produce genuinely new sets. In two landmark cases, the answer is no:

### Algebraically Closed Fields: Tarski's Quantifier Elimination

**Theorem (Tarski, ACF).** *Every definable set in an algebraically closed field is quantifier-free definable, i.e., is Zariski-constructible.*

This is the statement that algebraically closed fields (ACF) admit **quantifier elimination**. It will be proved later in the course, using the algebraic theory of polynomials. Its practical import is that the definable sets in, say, \(\mathbb{C}\) (viewed as a ring) are exactly the Zariski-constructible sets — the very objects studied by algebraic geometry. From this perspective, algebraic geometry *is* the model theory of algebraically closed fields.

A striking corollary concerns one-dimensional definable sets:

**Corollary.** *Every definable subset of \(F\) (in one variable) in an algebraically closed field \(F\) is either finite or co-finite.*

This follows because the quantifier-free definable subsets of \(F^1\) are Boolean combinations of zero sets of univariate polynomials, and such a zero set is either all of \(F\) (the trivial polynomial) or a finite set (bounded by the degree). Boolean combinations of finite sets and \(F\) itself are finite or co-finite.

In contrast, take the real ring \((\mathbb{R}, 0, 1, +, -, \times)\). The formula \(\exists y (y^2 = x)\) defines the non-negative reals — infinite and co-infinite, hence not Zariski-constructible. So the real ring does not have quantifier elimination. This is exactly as expected: the real numbers are *not* algebraically closed. The theorem of McIntyre (1970s) pins down exactly which rings admit QE:

**Theorem (McIntyre).** *A ring admitting quantifier elimination in the ring language is an algebraically closed field.*

So ACF is the complete answer for quantifier elimination in the ring language.

### Real Closed Fields: Semi-algebraic Sets

The real numbers are not algebraically closed, but they have a rich and well-behaved theory of their own. The key observation from Lecture 24a is that the ordering on \(\mathbb{R}\) is definable in the ring language: \(x < y \iff \exists z ((z \neq 0) \wedge (y - x = z^2))\). This uses a quantifier and cannot be replaced by a quantifier-free formula (since the positive reals are not Zariski-constructible). But once we *add the ordering to the language*, making the structure \((\mathbb{R}, 0, 1, +, -, \times, <)\), the ordering becomes atomic (it is now a basic relation symbol), and Tarski's second theorem applies:

**Theorem (Tarski, RCF).** *Every definable set in the ordered real field \((\mathbb{R}, 0, 1, +, -, \times, <)\) is quantifier-free definable in the ordered language.*

In the ordered ring language, the atomic formulas are either polynomial equalities \(p(\mathbf{x}) = 0\) or polynomial inequalities \(p(\mathbf{x}) > 0\). The quantifier-free definable sets are therefore finite Boolean combinations of sets of the form \(\{p(\mathbf{x}) = 0\}\) or \(\{p(\mathbf{x}) > 0\}\). Such sets are called **semi-algebraic sets**, and they are the central objects of **real algebraic geometry**.

The corollary for the ring language is:

**Corollary.** *Every definable set in \((\mathbb{R}, 0, 1, +, -, \times)\) is semi-algebraic.*

*Proof.* A set definable in the ring language is definable in the expanded ordered language (it is a bigger language). But in the ordered language, every definable set is quantifier-free definable by Tarski's theorem, hence semi-algebraic. \(\square\)

The ring language and the ordered ring language have the same definable sets (since the ordering is definable in the ring language), but different quantifier-free definable sets — this is the precise sense in which the ring language lacks quantifier elimination while the ordered ring language has it.

### The Big Picture

These two theorems — quantifier elimination for ACF and for RCF — give complete, geometric descriptions of definable sets in the two most important field structures in mathematics. In the algebraically closed case, the definable sets are exactly the algebraic geometry objects: algebraic varieties and their Boolean combinations. In the real closed case, they are the semi-algebraic sets, the objects of real algebraic geometry. Both are "tame" theories.

The contrast with the integers is instructive. In \((\mathbb{Z}, 0, 1, +, -, \times)\), the definable sets are extraordinarily wild: by Gödel's work, all of mathematics can be encoded in the first-order theory of the integers, and there is provably no clean description of the definable sets. The integers are "wild." The miracle is that the two most natural continuous structures — \(\mathbb{C}\) and \(\mathbb{R}\) — happen to be tame.

---

## Lecture 25: Theories and Models

### Two Faces of Model Theory

Prof. Moosa opened the final lecture of this part of the course by observing that model theory has two complementary aspects. The first is geometric: fix a structure and study its definable sets, asking what can be said about a particular mathematical universe. This is the perspective of Lectures 21–24. The second is algebraic-logical: instead of fixing a structure, one looks at a *class* of structures sharing the same first-order properties, studying what can be said about the class as a whole. That second perspective is the subject of Lecture 25.

### Theories and Models

**Definition 4.42.** An **\(L\)-theory** \(T\) is any set of \(L\)-sentences. A **model** of \(T\) is an \(L\)-structure \(\mathcal{M}\) with \(\mathcal{M} \models \sigma\) for every \(\sigma \in T\); write \(\mathcal{M} \models T\). We denote the class of all models of \(T\) by \(\mathrm{Mod}(T)\). The theory \(T\) is **consistent** if it has a model. A class \(\mathcal{K}\) of \(L\)-structures is **elementary** (or **axiomatisable**) if \(\mathcal{K} = \mathrm{Mod}(T)\) for some \(T\).

Consistency here is the semantic notion: a theory is consistent if there is some mathematical universe in which all its sentences are simultaneously true. This differs from the proof-theoretic notion (no derivation of a contradiction), though Gödel's completeness theorem — which we do not prove in this course — says they coincide.

**Examples 4.43.** The following classes are all elementary.

- *Groups.* In the multiplicative language \(L = \{e, \cdot, {}^{-1}\}\), the group axioms (associativity, identity, inverse) are sentences. So groups, abelian groups, and groups of fixed exponent \(n\) (add the sentence \(\forall x (x^n = e)\) are all finitely axiomatisable. Torsion-free groups are axiomatisable by the infinite family \(\{\sigma_n\}_{n \geq 1}\), where \(\sigma_n \equiv \forall x ((x^n = e) \to (x = e))\) says there is no \(n\)-torsion. Similarly, divisible groups are axiomatised by \(\{\tau_k\}_{k \geq 1}\), where \(\tau_k \equiv \forall x \exists y (y^k = x)\).

- *Rings and fields.* In \(L = \{0, 1, +, -, \times\}\), rings, integral domains, fields, and algebraically closed fields (ACF) are all elementary. Being algebraically closed is expressed by sentences \(\forall a_0 \cdots \forall a_{n-1} \exists x (x^n + a_{n-1} x^{n-1} + \cdots + a_0 = 0)\), one for each degree \(n \geq 1\). ACF in characteristic \(p\) adds the sentence \(1 + \cdots + 1 = 0\) (\(p\) ones), and ACF in characteristic 0 adds \(\neg(1 + \cdots + 1 = 0)\) for each \(n \geq 1\).

- *Linear orders.* In \(L = \{<\}\), the theory of **dense linear orders without endpoints** (DLO) is axiomatised by the dense linear order axioms: irreflexivity, transitivity, totality, density (\(\forall x \forall y (x < y \to \exists z (x < z \wedge z < y))\), and no endpoints (\(\forall x \exists y (y < x)\) and \(\forall x \exists y (x < y)\).

- *Set theory.* In \(L = \{\in\}\), the models of ZF form an elementary class.

Not every class is elementary. The class of torsion groups (every element has finite order) is *not* axiomatisable, despite being the complement of torsion-free groups in the class of groups. The reason is that there is no first-order sentence that says "there exists an element of some finite order, without bounding that order." One would need an infinite disjunction or a quantifier over the natural numbers — neither of which is available. Finite groups are likewise not an elementary class (for each fixed \(n\), the class of groups of size \(n\) is elementary, but the class of all finite groups requires an infinite disjunction over \(n\). The proofs that these classes are not elementary will follow from the Compactness Theorem.

### The Theory of a Structure and Elementary Equivalence

**Definition.** Given an \(L\)-structure \(\mathcal{M}\), its **theory** is:
\[\mathrm{Th}(\mathcal{M}) = \{\sigma : \sigma \text{ an } L\text{-sentence}, \mathcal{M} \models \sigma\}.\]

This is the complete first-order description of \(\mathcal{M}\) — all sentences that are true in it. It is always infinite (one can always find new sentences), and it always includes the axioms of any class \(\mathcal{M}\) belongs to. For instance, \(\mathrm{Th}(\mathbb{Q}, 0, +, -)\) includes all the divisibility sentences \(\sigma_n\), not just the group axioms.

**Definition 4.43.** Two \(L\)-structures \(\mathcal{M}\) and \(\mathcal{N}\) are **elementarily equivalent**, written \(\mathcal{M} \equiv \mathcal{N}\), if \(\mathrm{Th}(\mathcal{M}) = \mathrm{Th}(\mathcal{N})\) — i.e., they satisfy exactly the same \(L\)-sentences. A theory \(T\) **entails** a sentence \(\sigma\), written \(T \models \sigma\), if \(\mathcal{M} \models \sigma\) for every \(\mathcal{M} \models T\). A theory is **complete** if for every sentence \(\sigma\), either \(T \models \sigma\) or \(T \models \neg\sigma\).

**Lemma 4.44.**
- *(a)* For any \(\mathcal{M}\), \(\mathrm{Th}(\mathcal{M})\) is a complete consistent theory.
- *(b)* A consistent theory \(T\) is complete iff all its models are elementarily equivalent, iff the consequences of \(T\) form \(\mathrm{Th}(\mathcal{M})\) for any \(\mathcal{M} \models T\).
- *(c)* If \(j : \mathcal{M} \to \mathcal{N}\) is an elementary embedding then \(\mathcal{M} \equiv \mathcal{N}\). In particular, isomorphic structures are elementarily equivalent.

Part (c) follows immediately from the \(n = 0\) case of the definition of elementary embedding. The converse of (c) is emphatically false in general: elementary equivalence is far weaker than the existence of an elementary embedding, which in turn is far weaker than isomorphism.

### Elementary Equivalence vs. Elementary Substructures

A common source of confusion is the relationship between elementary equivalence and elementary substructures. The professor gave a precise example to clarify.

Let \(\mathcal{M} = (\mathbb{N} \setminus \{0\}, <)\) (positive naturals with the usual ordering) and \(\mathcal{N} = (\mathbb{N}, <)\) (all naturals with the usual ordering). Then \(\mathcal{M}\) is a substructure of \(\mathcal{N}\) (purely relational language, so any subset is a substructure). Moreover, the map \(n \mapsto n - 1\) is an isomorphism from \(\mathcal{M}\) to \(\mathcal{N}\) (shifting back by one preserves order and is a bijection). Since isomorphisms are elementary embeddings, \(\mathcal{M} \equiv \mathcal{N}\). Yet \(\mathcal{M} \not\prec \mathcal{N}\), because \(\mathcal{N} \models \exists y (y < 1)\) (take \(y = 0\) while \(\mathcal{M} \not\models \exists y (y < 1)\) (1 is the minimum of \(\mathcal{M}\). The formula \(\exists y (y < 1)\) is an \(L_M\)-sentence (using the parameter 1 from \(M\), not an \(L\)-sentence, and the two structures differ on it.

This illustrates the precise distinction: elementary equivalence concerns \(L\)-sentences; elementary substructure concerns \(L_M\)-sentences (with parameters from the smaller structure). These are genuinely different conditions. The clean characterisation is:

If \(\mathcal{M} \subseteq \mathcal{N}\), then \(\mathcal{M} \prec \mathcal{N}\) if and only if \(\mathcal{M}_M \equiv \mathcal{N}_M\) as \(L_M\)-structures (naming all elements of \(M\).

### Elementary Embeddings and Models of \(\mathrm{Th}(\mathcal{M}_M)\)

**Proposition 4.45.** *There exists an elementary embedding \(j : \mathcal{M} \hookrightarrow \mathcal{N}\) if and only if \(\mathcal{N}\) can be expanded to an \(L_M\)-structure that is a model of \(\mathrm{Th}(\mathcal{M}_M)\).*

The proof shows how the two directions are inverse operations. Given \(j\), expand \(\mathcal{N}\) to an \(L_M\)-structure \(\mathcal{N}'\) by interpreting each constant \(\bar{a}\) (for \(a \in M\) as \(j(a)\); the elementariness of \(j\) ensures \(\mathcal{N}' \models \mathrm{Th}(\mathcal{M}_M)\). Conversely, given such an expansion \(\mathcal{N}'\), define \(j(a) = \bar{a}^{\mathcal{N}'}\); the fact that \(\mathcal{N}' \models \mathrm{Th}(\mathcal{M}_M)\) guarantees that \(j\) is an elementary embedding.

### Partial Elementary Maps

**Definition 4.47.** A **partial elementary map** (p.e.m.) from \(\mathcal{M}\) to \(\mathcal{N}\) is a function \(f : A \to N\) (with \(A \subseteq M\), possibly empty) such that for all \(L\)-formulas \(\varphi(\mathbf{x})\) and \(\mathbf{a} \in A\):
\[\mathcal{M} \models \varphi(\mathbf{a}) \iff \mathcal{N} \models \varphi(f(\mathbf{a})).\]
The empty function is a p.e.m. iff \(\mathcal{M} \equiv \mathcal{N}\); a total p.e.m. is precisely an elementary embedding.

### Finite Structures Are Determined by Their Theory

**Proposition 4.46.** *If \(\mathcal{M}\) and \(\mathcal{N}\) are finite \(L\)-structures, then \(\mathcal{M} \equiv \mathcal{N} \iff \mathcal{M} \cong \mathcal{N}\).*

*Proof.* One direction is Lemma 4.44(c): isomorphic structures are elementarily equivalent. For the converse: if \(\mathcal{M} \equiv \mathcal{N}\), then in particular they satisfy the same sentences asserting their exact cardinality, so \(|M| = |N|\). Enumerate \(M = \{a_1, \ldots, a_n\}\). The conjunction of all atomic and negated atomic sentences true of \((a_1, \ldots, a_n)\) in \(\mathcal{M}\) is a single sentence which says precisely what the \(n\)-tuple looks like. By elementary equivalence, \(\mathcal{N}\) satisfies this sentence, so there is an \(n\)-tuple \((b_1, \ldots, b_n)\) in \(\mathcal{N}\) satisfying all the same atomic relations. Since \(|N| = n\), this tuple is an enumeration of all of \(N\), and the map \(a_i \mapsto b_i\) is an isomorphism. \(\square\)

The proposition shows that for finite structures, elementary equivalence collapses to isomorphism — there is nothing interesting to say. First-order logic completely determines finite structures, up to isomorphism. This is why model theory, properly speaking, is about infinite structures: it is only there that elementary equivalence and isomorphism genuinely diverge, and it is only there that the rich landscape of theories, types, and compactness arguments opens up.

### A Glance at What Lies Ahead

Lecture 25 is the last lecture of this portion of the course. The theorems proved in Lectures 21–25 — the Tarski-Vaught Test, Downward Löwenheim-Skolem, automorphism invariance of definable sets, quantifier elimination for algebraically closed and real closed fields (to be proved), the basic theory of elementary equivalence — form a coherent foundation. They show that first-order logic, despite its syntactic simplicity, is extraordinarily powerful as a tool for studying mathematical structures.

The chapters that lie beyond these lectures — compactness, the Upward Löwenheim-Skolem theorem, type spaces, quantifier elimination proofs, stability theory — develop this foundation into a full-fledged mathematical discipline. But the core ideas are all here: the way truth interacts with substructures, the way small witnesses can determine large-scale properties, the way automorphisms constrain definability. These themes run through all of modern model theory, from Tarski's early theorems to the geometric stability theory of the 21st century.

---

*These notes were compiled from Prof. Moosa's lecture recordings (Fall 2020) and the reference notes* modeltheory-notes-v5.pdf *by R. Moosa.*
