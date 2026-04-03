---
title: "PMATH 432: Mathematical Logic"
prof: "Andrew Zucker"
subjects: "PMATH"
---

## Sources and References

**Primary textbooks**

- Ebbinghaus, H.-D., Flum, J., and Thomas, W. *Mathematical Logic*, 3rd edition. Springer, 2021. (Cited as EFT throughout.)
- Marker, David. *An Invitation to Mathematical Logic*. Graduate Texts in Mathematics 301, Springer, 2024. (Cited as Marker throughout.)

**Online resources**

- Levin, Oscar. *Discrete Mathematics: An Open Introduction*, for background on formal grammars and induction.
- MIT OpenCourseWare 18.510: Introduction to Mathematical Logic (lecture notes and problem sets).
- Stanford Math 161 (Mathematical Logic) course materials.
- Cambridge Part III Logic lecture notes (Forster and successors).
- Enderton, H. B. *A Mathematical Introduction to Logic*, 2nd ed., Academic Press, 2001 — supplementary classical reference.

---

# Chapter 1: First-Order Logic — Language and Structures

## 1.1 Why Formalize?

Mathematics proceeds by reasoning from axioms to conclusions. But what *is* reasoning? What *is* an axiom? Mathematical logic makes these notions precise. The program, begun by Frege and Hilbert and carried through by Gödel, Tarski, and Turing, has three interlocking goals:

1. **Syntax**: define a formal language and a notion of proof that can be checked mechanically.
2. **Semantics**: define what it means for a sentence to be *true* in a mathematical structure.
3. **Metatheory**: prove theorems *about* the logical system — soundness, completeness, compactness, and ultimately the incompleteness theorems.

First-order logic (FOL) is the lingua franca. It is expressive enough to axiomatize essentially all of classical mathematics, yet it admits the completeness theorem (Gödel 1930) — a feature lost in second-order logic.

## 1.2 Signatures and First-Order Languages

<div class="definition">
A <strong>signature</strong> (also called a <strong>vocabulary</strong> or <strong>similarity type</strong>) is a triple \( \sigma = (F, R, \mathrm{ar}) \) where
<ul>
  <li>\( F \) is a set of <strong>function symbols</strong>,</li>
  <li>\( R \) is a set of <strong>relation symbols</strong> (disjoint from \( F \)),</li>
  <li>\( \mathrm{ar} : F \cup R \to \mathbb{N} \) assigns to each symbol its <strong>arity</strong>.</li>
</ul>
Function symbols of arity 0 are <strong>constant symbols</strong>. Relation symbols of arity 0 are <strong>propositional atoms</strong> (rarely used in FOL proper).
</div>

**Examples of signatures.**

- **Groups**: \( \sigma_{\mathrm{grp}} = (\{\cdot, e, {}^{-1}\}, \emptyset, \mathrm{ar}) \) where \( \mathrm{ar}(\cdot)=2 \), \( \mathrm{ar}(e)=0 \), \( \mathrm{ar}({}^{-1})=1 \).
- **Ordered fields**: \( \sigma_{\mathrm{of}} = (\{+,\cdot,0,1,-\}, \{<\}, \mathrm{ar}) \).
- **Graphs**: \( \sigma_{\mathrm{gr}} = (\emptyset, \{E\}, \mathrm{ar}) \) with \( \mathrm{ar}(E)=2 \).
- **Pure sets** (set theory): \( \sigma_{\in} = (\emptyset, \{\in\}, \mathrm{ar}) \) with \( \mathrm{ar}(\in)=2 \).

### 1.2.1 Terms

Fix a countably infinite set \( \mathrm{Var} = \{v_0, v_1, v_2, \ldots\} \) of **variables** (always disjoint from the signature symbols and logical symbols).

<div class="definition">
The set of <strong>\( \sigma \)-terms</strong>, written \( \mathrm{Term}(\sigma) \), is defined inductively:
<ol>
  <li>Every variable \( x \in \mathrm{Var} \) is a term.</li>
  <li>If \( c \in F \) with \( \mathrm{ar}(c)=0 \), then \( c \) is a term.</li>
  <li>If \( f \in F \) with \( \mathrm{ar}(f)=n \geq 1 \) and \( t_1,\ldots,t_n \) are terms, then \( f(t_1,\ldots,t_n) \) is a term.</li>
</ol>
Nothing else is a term.
</div>

Terms represent *individuals* — elements of the universe of discourse. They do not carry a truth value.

### 1.2.2 Atomic Formulas and Formulas

<div class="definition">
An <strong>atomic \( \sigma \)-formula</strong> is an expression of one of the following forms:
<ul>
  <li>\( t_1 \doteq t_2 \) (equality), where \( t_1, t_2 \in \mathrm{Term}(\sigma) \).</li>
  <li>\( R(t_1,\ldots,t_n) \) where \( R \in \mathcal{R} \) has arity \( n \) and \( t_1,\ldots,t_n \) are terms.</li>
</ul>
</div>

<div class="definition">
The set of <strong>\( \sigma \)-formulas</strong>, written \( \mathrm{For}(\sigma) \), is the smallest set such that:
<ol>
  <li>Every atomic formula is in \( \mathrm{For}(\sigma) \).</li>
  <li>If \( \varphi \in \mathrm{For}(\sigma) \), then \( \lnot \varphi \in \mathrm{For}(\sigma) \).</li>
  <li>If \( \varphi, \psi \in \mathrm{For}(\sigma) \), then \( (\varphi \land \psi), (\varphi \lor \psi), (\varphi \to \psi), (\varphi \leftrightarrow \psi) \in \mathrm{For}(\sigma) \).</li>
  <li>If \( \varphi \in \mathrm{For}(\sigma) \) and \( x \in \mathrm{Var} \), then \( \forall x\, \varphi \) and \( \exists x\, \varphi \) are in \( \mathrm{For}(\sigma) \).</li>
</ol>
</div>

<div class="remark">
We treat \( \bot \) (falsum) as an abbreviation for \( v_0 \doteq v_1 \land \lnot (v_0 \doteq v_1) \), and \( \top \) (verum) as \( \lnot \bot \). We also allow the abbreviation \( \exists! x\, \varphi \) for "there exists a unique \( x \) such that \( \varphi \)", defined as \( \exists x(\varphi \land \forall y(\varphi[y/x] \to y \doteq x)) \).
</div>

### 1.2.3 Free and Bound Variables

<div class="definition">
The set \( \mathrm{free}(\varphi) \) of <strong>free variables</strong> of \( \varphi \) is defined inductively:
<ul>
  <li>For an atomic formula \( \varphi \): \( \mathrm{free}(\varphi) \) is the set of variables occurring in \( \varphi \).</li>
  <li>\( \mathrm{free}(\lnot \varphi) = \mathrm{free}(\varphi) \).</li>
  <li>\( \mathrm{free}(\varphi \ast \psi) = \mathrm{free}(\varphi) \cup \mathrm{free}(\psi) \) for binary connectives \( \ast \).</li>
  <li>\( \mathrm{free}(\forall x\, \varphi) = \mathrm{free}(\exists x\, \varphi) = \mathrm{free}(\varphi) \setminus \{x\} \).</li>
</ul>
A formula with no free variables is called a <strong>sentence</strong>. A formula \( \varphi(x_1,\ldots,x_n) \) indicates that \( \mathrm{free}(\varphi) \subseteq \{x_1,\ldots,x_n\} \).
</div>

**Example.** In \( \forall x\, (x < y \to \exists z\, (x < z \land z < y)) \), the variable \( y \) is free and \( x, z \) are bound. This expresses (in the language of orders) "between \( x \) and \( y \) there exists a \( z \)", but only \( y \) is a "parameter".

### 1.2.4 Substitution

<div class="definition">
For a term \( t \) and variable \( x \), the substitution \( \varphi[t/x] \) (read: replace \( x \) by \( t \) in \( \varphi \)) is defined inductively. The term \( t \) is <strong>free for \( x \) in \( \varphi \)</strong> if no free occurrence of \( x \) in \( \varphi \) lies in the scope of a quantifier \( \forall y \) or \( \exists y \) where \( y \) occurs in \( t \). When \( t \) is free for \( x \) in \( \varphi \), the substitution is capture-free.
</div>

Capture-freeness can always be arranged by renaming bound variables — an operation called **alpha-renaming** — which preserves meaning.

## 1.3 Structures and Interpretations

<div class="definition">
A <strong>\( \sigma \)-structure</strong> \( \mathfrak{A} \) (or <strong>model</strong> of signature \( \sigma \)) consists of:
<ul>
  <li>A nonempty set \( A \), the <strong>universe</strong> (or <strong>domain</strong>), also written \( |\mathfrak{A}| \).</li>
  <li>For each \( n \)-ary function symbol \( f \in F \): a function \( f^{\mathfrak{A}} : A^n \to A \).</li>
  <li>For each \( n \)-ary relation symbol \( R \in \mathcal{R} \): a relation \( R^{\mathfrak{A}} \subseteq A^n \).</li>
</ul>
</div>

**Examples.**

- The structure \( (\mathbb{Z}, +^{\mathbb{Z}}, \cdot^{\mathbb{Z}}, 0^{\mathbb{Z}}, 1^{\mathbb{Z}}, <^{\mathbb{Z}}) \) is a \( \sigma_{\mathrm{of}} \)-structure interpreting the ordered ring of integers.
- The structure \( (\mathbb{N}, S, 0) \) with \( S(n)=n+1 \) is a structure for the signature \( (\{S,0\}, \emptyset) \), the setting for Peano arithmetic.
- Any group \( (G, \cdot, e, {}^{-1}) \) is a \( \sigma_{\mathrm{grp}} \)-structure.

### 1.3.1 Assignments and Interpretations of Terms

<div class="definition">
An <strong>assignment</strong> (or <strong>variable assignment</strong>) into \( \mathfrak{A} \) is a function \( \alpha : \mathrm{Var} \to A \). The value \( t^{\mathfrak{A}}[\alpha] \) of a term \( t \) under \( (\mathfrak{A}, \alpha) \) is defined by:
<ul>
  <li>\( x^{\mathfrak{A}}[\alpha] = \alpha(x) \) for variables \( x \).</li>
  <li>\( c^{\mathfrak{A}}[\alpha] = c^{\mathfrak{A}} \) for constants \( c \).</li>
  <li>\( f(t_1,\ldots,t_n)^{\mathfrak{A}}[\alpha] = f^{\mathfrak{A}}(t_1^{\mathfrak{A}}[\alpha], \ldots, t_n^{\mathfrak{A}}[\alpha]) \).</li>
</ul>
</div>

### 1.3.2 Satisfaction

<div class="definition">
The <strong>satisfaction relation</strong> \( \mathfrak{A} \models \varphi[\alpha] \) (read: \( \mathfrak{A} \) satisfies \( \varphi \) under \( \alpha \)) is defined inductively on the structure of \( \varphi \):
<ul>
  <li>\( \mathfrak{A} \models (t_1 \doteq t_2)[\alpha] \) iff \( t_1^{\mathfrak{A}}[\alpha] = t_2^{\mathfrak{A}}[\alpha] \).</li>
  <li>\( \mathfrak{A} \models R(t_1,\ldots,t_n)[\alpha] \) iff \( (t_1^{\mathfrak{A}}[\alpha],\ldots,t_n^{\mathfrak{A}}[\alpha]) \in R^{\mathfrak{A}} \).</li>
  <li>\( \mathfrak{A} \models (\lnot\varphi)[\alpha] \) iff \( \mathfrak{A} \not\models \varphi[\alpha] \).</li>
  <li>\( \mathfrak{A} \models (\varphi \land \psi)[\alpha] \) iff \( \mathfrak{A} \models \varphi[\alpha] \) and \( \mathfrak{A} \models \psi[\alpha] \).</li>
  <li>\( \mathfrak{A} \models (\varphi \lor \psi)[\alpha] \) iff \( \mathfrak{A} \models \varphi[\alpha] \) or \( \mathfrak{A} \models \psi[\alpha] \).</li>
  <li>\( \mathfrak{A} \models (\varphi \to \psi)[\alpha] \) iff \( \mathfrak{A} \not\models \varphi[\alpha] \) or \( \mathfrak{A} \models \psi[\alpha] \).</li>
  <li>\( \mathfrak{A} \models (\forall x\, \varphi)[\alpha] \) iff for all \( a \in A \): \( \mathfrak{A} \models \varphi[\alpha(x|a)] \).</li>
  <li>\( \mathfrak{A} \models (\exists x\, \varphi)[\alpha] \) iff there exists \( a \in A \): \( \mathfrak{A} \models \varphi[\alpha(x|a)] \).</li>
</ul>
Here \( \alpha(x|a) \) denotes the assignment that agrees with \( \alpha \) except that \( x \mapsto a \).
</div>

<div class="remark">
The <strong>coincidence lemma</strong>: the truth value of \( \mathfrak{A} \models \varphi[\alpha] \) depends only on the values of \( \alpha \) on \( \mathrm{free}(\varphi) \). Hence for sentences \( \varphi \), satisfaction is independent of \( \alpha \) and we write simply \( \mathfrak{A} \models \varphi \).
</div>

<div class="theorem">
<strong>(Coincidence Lemma)</strong> If \( \alpha \) and \( \beta \) are assignments that agree on all free variables of \( \varphi \), then
\[ \mathfrak{A} \models \varphi[\alpha] \iff \mathfrak{A} \models \varphi[\beta]. \]
</div>

<div class="proof">
By structural induction on \( \varphi \). The base case for atomic formulas follows since term values depend only on the values of their variables (by an analogous induction on terms). The inductive cases for connectives are immediate. For quantifiers: if \( \varphi = \forall x\, \psi \) and \( \alpha, \beta \) agree on \( \mathrm{free}(\forall x\, \psi) = \mathrm{free}(\psi) \setminus \{x\} \), then for any \( a \in A \), the assignments \( \alpha(x|a) \) and \( \beta(x|a) \) agree on all of \( \mathrm{free}(\psi) \), so by the induction hypothesis they give the same truth value for \( \psi \). Taking the universal quantifier over all \( a \) completes the argument.
</div>

### 1.3.3 Models, Validity, and Entailment

<div class="definition">
<ul>
  <li>\( \mathfrak{A} \) is a <strong>model</strong> of a sentence \( \varphi \) if \( \mathfrak{A} \models \varphi \).</li>
  <li>\( \mathfrak{A} \) is a <strong>model</strong> of a set of sentences \( T \) (written \( \mathfrak{A} \models T \)) if \( \mathfrak{A} \models \varphi \) for all \( \varphi \in T \). We then say \( \mathfrak{A} \) is a <strong>model of the theory</strong> \( T \).</li>
  <li>A sentence \( \varphi \) is <strong>logically valid</strong> (written \( \models \varphi \)) if every \( \sigma \)-structure satisfies it.</li>
  <li>A set \( T \) of sentences <strong>logically entails</strong> \( \varphi \) (written \( T \models \varphi \)) if every model of \( T \) is also a model of \( \varphi \).</li>
  <li>A set \( T \) is <strong>satisfiable</strong> if it has at least one model.</li>
</ul>
</div>

## 1.4 Homomorphisms and Embeddings

<div class="definition">
Let \( \mathfrak{A}, \mathfrak{B} \) be \( \sigma \)-structures. A function \( h : A \to B \) is a <strong>homomorphism</strong> \( h : \mathfrak{A} \to \mathfrak{B} \) if:
<ul>
  <li>For each \( n \)-ary function symbol \( f \): \( h(f^{\mathfrak{A}}(a_1,\ldots,a_n)) = f^{\mathfrak{B}}(h(a_1),\ldots,h(a_n)) \).</li>
  <li>For each \( n \)-ary relation symbol \( R \): \( (a_1,\ldots,a_n) \in R^{\mathfrak{A}} \Rightarrow (h(a_1),\ldots,h(a_n)) \in R^{\mathfrak{B}} \).</li>
</ul>
</div>

<div class="definition">
A homomorphism \( h : \mathfrak{A} \to \mathfrak{B} \) is an <strong>embedding</strong> if it is injective and the condition for relations is strengthened to a biconditional:
\[ (a_1,\ldots,a_n) \in R^{\mathfrak{A}} \iff (h(a_1),\ldots,h(a_n)) \in R^{\mathfrak{B}}. \]
An embedding is an <strong>isomorphism</strong> if it is additionally surjective. We write \( \mathfrak{A} \cong \mathfrak{B} \) if an isomorphism exists.
</div>

<div class="theorem">
<strong>(Isomorphism Theorem)</strong> If \( h : \mathfrak{A} \to \mathfrak{B} \) is an isomorphism and \( \varphi(x_1,\ldots,x_n) \) is any formula, then for all \( a_1,\ldots,a_n \in A \):
\[ \mathfrak{A} \models \varphi[a_1,\ldots,a_n] \iff \mathfrak{B} \models \varphi[h(a_1),\ldots,h(a_n)]. \]
In particular, isomorphic structures satisfy the same sentences.
</div>

<div class="proof">
By structural induction on \( \varphi \). The base cases follow from the embedding condition. The connective cases are straightforward. For \( \varphi = \forall x\, \psi \): \( \mathfrak{A} \models \forall x\, \psi[\vec{a}] \) iff for all \( b \in A \), \( \mathfrak{A} \models \psi[b,\vec{a}] \). Since \( h \) is surjective, the elements of \( B \) are exactly the \( h(b) \), so \( \mathfrak{B} \models \forall x\, \psi[h(b),h(\vec{a})] \) iff for all \( b \in A \), \( \mathfrak{B} \models \psi[h(b),h(\vec{a})] \), which by induction hypothesis holds iff \( \mathfrak{A} \models \psi[b,\vec{a}] \). The case for \( \exists \) is similar.
</div>

## 1.5 Substructures and Elementary Substructures

<div class="definition">
\( \mathfrak{A} \) is a <strong>substructure</strong> of \( \mathfrak{B} \) (written \( \mathfrak{A} \subseteq \mathfrak{B} \)) if \( A \subseteq B \), every function symbol is interpreted consistently (\( f^{\mathfrak{A}} = f^{\mathfrak{B}} \upharpoonright A^n \)), and \( R^{\mathfrak{A}} = R^{\mathfrak{B}} \cap A^n \) for every relation symbol \( R \).
</div>

Note: for a substructure, we need \( A \) to be closed under the functions of \( \mathfrak{B} \).

<div class="definition">
\( \mathfrak{A} \) is an <strong>elementary substructure</strong> of \( \mathfrak{B} \) (written \( \mathfrak{A} \preccurlyeq \mathfrak{B} \)) if \( \mathfrak{A} \subseteq \mathfrak{B} \) and for every formula \( \varphi(x_1,\ldots,x_n) \) and every \( a_1,\ldots,a_n \in A \):
\[ \mathfrak{A} \models \varphi[a_1,\ldots,a_n] \iff \mathfrak{B} \models \varphi[a_1,\ldots,a_n]. \]
</div>

<div class="theorem">
<strong>(Tarski–Vaught Test)</strong> Let \( \mathfrak{A} \subseteq \mathfrak{B} \). Then \( \mathfrak{A} \preccurlyeq \mathfrak{B} \) if and only if for every formula \( \varphi(x, y_1,\ldots,y_n) \) and every \( a_1,\ldots,a_n \in A \): if \( \mathfrak{B} \models \exists x\, \varphi[a_1,\ldots,a_n] \), then there exists \( a \in A \) such that \( \mathfrak{B} \models \varphi[a, a_1,\ldots,a_n] \).
</div>

<div class="proof">
The forward direction is clear from the definition. For the backward direction, induct on formula complexity. Atomic formulas and Boolean combinations are immediate since \( \mathfrak{A} \subseteq \mathfrak{B} \). For \( \varphi = \exists x\, \psi \): if \( \mathfrak{B} \models \exists x\, \psi[\vec{a}] \), the Tarski–Vaught condition gives \( a \in A \) with \( \mathfrak{B} \models \psi[a,\vec{a}] \), and by induction \( \mathfrak{A} \models \psi[a,\vec{a}] \), so \( \mathfrak{A} \models \exists x\, \psi[\vec{a}] \). Conversely, if \( \mathfrak{A} \models \exists x\, \psi[\vec{a}] \), then there is \( a \in A \subseteq B \) with \( \mathfrak{A} \models \psi[a,\vec{a}] \), and by induction \( \mathfrak{B} \models \psi[a,\vec{a}] \), so \( \mathfrak{B} \models \exists x\, \psi[\vec{a}] \).
</div>

---

# Chapter 2: Proof Theory and Completeness

## 2.1 Formal Proof Systems

There are several equivalent proof systems for first-order logic: Hilbert-style axiom systems, natural deduction, sequent calculus (Gentzen's \( \mathbf{LK} \)), and tableaux. We present the Hilbert-style system following EFT, which trades ease of use for minimality of primitives.

### 2.1.1 The Hilbert Calculus

Fix a signature \( \sigma \). The **logical axioms** of the Hilbert calculus \( \mathcal{H} \) include:

**Propositional axioms:**
\[ \varphi \to (\psi \to \varphi) \]
\[ (\varphi \to (\psi \to \chi)) \to ((\varphi \to \psi) \to (\varphi \to \chi)) \]
\[ (\lnot \psi \to \lnot \varphi) \to (\varphi \to \psi) \]

**Quantifier axioms** (where \( t \) is free for \( x \) in \( \varphi \)):
\[ \forall x\, \varphi \to \varphi[t/x] \]
\[ \varphi[t/x] \to \exists x\, \varphi \]

**Quantifier distribution:**
\[ \forall x\, (\varphi \to \psi) \to (\forall x\, \varphi \to \forall x\, \psi) \]
\[ \forall x\, (\varphi \to \psi) \to (\exists x\, \varphi \to \exists x\, \psi) \]

**Vacuous quantification** (\( x \notin \mathrm{free}(\varphi) \)):
\[ \varphi \to \forall x\, \varphi \]

**Equality axioms:**
\[ x \doteq x \]
\[ x \doteq y \to (\varphi(x) \to \varphi(y)) \quad \text{(for atomic } \varphi \text{)} \]

The sole **rule of inference** is Modus Ponens: from \( \varphi \) and \( \varphi \to \psi \), derive \( \psi \). There are also the **generalization rule**: from \( \varphi \), derive \( \forall x\, \varphi \).

<div class="definition">
A <strong>derivation</strong> (or <strong>proof</strong>) from a set of premises \( \Phi \) is a finite sequence \( \varphi_1, \varphi_2, \ldots, \varphi_n \) where each \( \varphi_i \) is either (i) a logical axiom, (ii) a member of \( \Phi \), or (iii) obtained from earlier formulas by modus ponens or generalization. We write \( \Phi \vdash \varphi \) if there exists a derivation from \( \Phi \) with last line \( \varphi \).
</div>

<div class="remark">
The generalization rule must be applied with care: \( \Phi \vdash \forall x\, \varphi \) if the last step uses generalization only when \( x \) is not free in any formula of \( \Phi \) actually used in the derivation. This restriction prevents proving \( \forall x\, x = c \) from the premise \( x = c \).
</div>

### 2.1.2 Derived Rules and Metatheorems

<div class="theorem">
<strong>(Deduction Theorem)</strong> \( \Phi \cup \{\psi\} \vdash \varphi \) if and only if \( \Phi \vdash \psi \to \varphi \), provided that \( x \) is not free in \( \psi \) whenever generalization on \( x \) is used in the derivation.
</div>

The deduction theorem allows us to reason informally with hypotheses in the usual way.

### 2.1.3 Natural Deduction (Brief Overview)

In Gentzen's natural deduction system \( \mathbf{NK} \), we have introduction and elimination rules for each connective:

- \( \land \)-Intro: from \( \varphi \) and \( \psi \), derive \( \varphi \land \psi \).
- \( \land \)-Elim: from \( \varphi \land \psi \), derive \( \varphi \) (or \( \psi \)).
- \( \to \)-Intro: if \( \varphi \) proves \( \psi \) (closing an assumption), derive \( \varphi \to \psi \).
- \( \forall \)-Intro: if \( \varphi(c) \) is proved with \( c \) a fresh constant (an **eigenvariable**), derive \( \forall x\, \varphi(x) \).
- \( \forall \)-Elim: from \( \forall x\, \varphi \), derive \( \varphi[t/x] \).

Natural deduction is more intuitive and is the basis of the Curry–Howard correspondence with type theory.

## 2.2 Soundness

<div class="theorem">
<strong>(Soundness Theorem)</strong> If \( \Phi \vdash \varphi \), then \( \Phi \models \varphi \).
</div>

<div class="proof">
By induction on the length of the derivation. We check that each logical axiom is logically valid, i.e., true in every structure under every assignment. We then check that modus ponens and generalization preserve truth in every structure.

<em>Logical axioms:</em> We verify a few. For \( \varphi \to (\psi \to \varphi) \): if \( \mathfrak{A} \models \varphi[\alpha] \), then certainly \( \mathfrak{A} \models \psi \to \varphi[\alpha] \) regardless of \( \psi \). The quantifier axiom \( \forall x\, \varphi \to \varphi[t/x] \): if \( \mathfrak{A} \models \forall x\, \varphi[\alpha] \), then in particular substituting the value of \( t \) under \( \alpha \) gives \( \mathfrak{A} \models \varphi[t^{\mathfrak{A}}[\alpha]/x][\alpha] \). The equality axiom \( x \doteq y \to (\varphi(x) \to \varphi(y)) \) follows from Leibniz's law.

<em>Modus Ponens:</em> If \( \mathfrak{A} \models \Phi \), \( \mathfrak{A} \models \varphi[\alpha] \), and \( \mathfrak{A} \models (\varphi \to \psi)[\alpha] \), then \( \mathfrak{A} \models \psi[\alpha] \).

<em>Generalization:</em> Suppose \( \Phi \vdash \varphi \) with \( x \notin \mathrm{free}(\psi) \) for any \( \psi \in \Phi \) used. By the induction hypothesis, \( \Phi \models \varphi \). Given \( \mathfrak{A} \models \Phi \) and any \( a \in A \): the assignment \( \alpha(x|a) \) still satisfies \( \Phi \) (since \( x \) is not free in \( \Phi \)), so \( \mathfrak{A} \models \varphi[\alpha(x|a)] \). Since \( a \) was arbitrary, \( \mathfrak{A} \models \forall x\, \varphi[\alpha] \).
</div>

**Corollary.** If \( \varphi \) is provable (\( \emptyset \vdash \varphi \)), then \( \varphi \) is logically valid. In particular, if \( T \vdash \varphi \) and \( T \) has a model, then \( \varphi \) is true in that model.

**Corollary (Consistency).** If \( T \) has a model, then \( T \) is **consistent** — i.e., \( T \not\vdash \bot \).

## 2.3 The Completeness Theorem

The completeness theorem is the deepest result about first-order logic. It establishes that the proof system captures precisely the semantically valid consequences.

<div class="theorem">
<strong>(Gödel's Completeness Theorem, 1930)</strong> Let \( \sigma \) be a countable signature and \( \Phi \) a set of \( \sigma \)-sentences. For any sentence \( \varphi \):
\[ \Phi \models \varphi \iff \Phi \vdash \varphi. \]
Equivalently, every consistent set of sentences has a model.
</div>

We prove the completeness theorem via the **Henkin method**, constructing a canonical model from the proof system itself.

### 2.3.1 Henkin Constants and Extensions

<div class="definition">
A set \( \Phi \) of sentences is <strong>consistent</strong> if \( \Phi \not\vdash \bot \). It is <strong>maximally consistent</strong> if it is consistent and no proper extension (adding any sentence not already in \( \Phi \)) remains consistent.
</div>

<div class="definition">
A maximally consistent set \( \Phi \) has the <strong>witness property</strong> if for every formula \( \varphi(x) \) and sentence \( \exists x\, \varphi(x) \in \Phi \), there exists a constant \( c \) (a <strong>Henkin witness</strong>) such that \( \varphi(c) \in \Phi \).
</div>

**Step 1: Extend the signature.** Given a consistent \( \Phi \) in signature \( \sigma \), form \( \sigma' = \sigma \cup \{c_\varphi : \varphi(x) \in \mathrm{For}(\sigma)\} \) — adding one new constant for each formula with one free variable.

**Step 2: Add Henkin axioms.** Let \( \Phi' = \Phi \cup \{\exists x\, \varphi(x) \to \varphi(c_\varphi) : \varphi(x) \in \mathrm{For}(\sigma)\} \). One verifies that \( \Phi' \) is still consistent (adding a finitely many axioms at a time preserves consistency since inconsistency requires a finite derivation).

**Step 3: Maximal extension (Lindenbaum's lemma).** Enumerate all \( \sigma' \)-sentences as \( \psi_0, \psi_1, \psi_2, \ldots \) (possible since \( \sigma' \) is countable). Define:
\[ \Phi_0 = \Phi', \quad \Phi_{n+1} = \begin{cases} \Phi_n \cup \{\psi_n\} & \text{if this is consistent,} \\ \Phi_n \cup \{\lnot \psi_n\} & \text{otherwise.} \end{cases} \]
Set \( \Delta = \bigcup_{n} \Phi_n \). Then \( \Delta \) is maximally consistent and has the witness property.

<div class="theorem">
<strong>(Lindenbaum's Lemma)</strong> Every consistent set of sentences can be extended to a maximally consistent set.
</div>

### 2.3.2 The Canonical (Term) Model

From \( \Delta \) (maximally consistent with witness property), build the **canonical structure** \( \mathfrak{A}_\Delta \):

- **Universe**: the set of closed \( \sigma' \)-terms, modulo the equivalence \( s \sim t \) iff \( (s \doteq t) \in \Delta \). Write \( [t] \) for the equivalence class of \( t \).
- **Functions**: \( f^{\mathfrak{A}_\Delta}([t_1],\ldots,[t_n]) = [f(t_1,\ldots,t_n)] \) (well-defined since \( \Delta \) contains the relevant equality axioms).
- **Relations**: \( ([t_1],\ldots,[t_n]) \in R^{\mathfrak{A}_\Delta} \) iff \( R(t_1,\ldots,t_n) \in \Delta \).

<div class="theorem">
<strong>(Truth Lemma)</strong> For every closed \( \sigma' \)-formula \( \varphi \):
\[ \mathfrak{A}_\Delta \models \varphi \iff \varphi \in \Delta. \]
</div>

<div class="proof">
By induction on \( \varphi \). Atomic: \( \mathfrak{A}_\Delta \models R(t_1,\ldots,t_n) \) iff \( R(t_1,\ldots,t_n) \in \Delta \) by definition. Equality similarly. \( \lnot \): Since \( \Delta \) is maximally consistent, \( \lnot \varphi \in \Delta \) iff \( \varphi \notin \Delta \). Conjunction: \( (\varphi \land \psi) \in \Delta \) iff both \( \varphi \in \Delta \) and \( \psi \in \Delta \) (since \( \Delta \) is maximal and consistent). Existential: \( \exists x\, \varphi(x) \in \Delta \) iff (by the witness property) \( \varphi(c_{\varphi}) \in \Delta \), and by induction \( \mathfrak{A}_\Delta \models \varphi(c_\varphi) \), so \( \mathfrak{A}_\Delta \models \exists x\, \varphi(x) \).
</div>

**Proof of Completeness.** Suppose \( \Phi \not\vdash \varphi \). Then \( \Phi \cup \{\lnot \varphi\} \) is consistent. Extend to \( \Delta \) (maximally consistent with witness property) in \( \sigma' \supseteq \sigma \). The canonical model \( \mathfrak{A}_\Delta \) satisfies \( \Phi \) (since \( \Phi \subseteq \Delta \)) and satisfies \( \lnot \varphi \) (since \( \lnot \varphi \in \Delta \)), so \( \Phi \not\models \varphi \). By contrapositive: \( \Phi \models \varphi \Rightarrow \Phi \vdash \varphi \). \(\square\)

## 2.4 Compactness

<div class="theorem">
<strong>(Compactness Theorem)</strong> A set \( \Phi \) of sentences is satisfiable if and only if every finite subset of \( \Phi \) is satisfiable.
</div>

<div class="proof">
One direction is trivial: if \( \Phi \) has a model \( \mathfrak{A} \), then so does every finite subset. For the other direction: if every finite subset of \( \Phi \) is satisfiable, then every finite subset is consistent (by soundness). Hence \( \Phi \) itself is consistent (since any derivation of \( \bot \) from \( \Phi \) uses only finitely many premises). By completeness, \( \Phi \) has a model.
</div>

**Remark.** The compactness theorem can also be proved directly via ultraproducts (see Chapter 3), giving an independent proof that does not go through the proof system.

### 2.4.1 Applications of Compactness

**Example 1: Non-standard models of arithmetic.** Let \( T = \mathrm{Th}(\mathbb{N}) \) be the complete theory of the standard natural numbers, in the signature \( (0, S, +, \cdot, <) \). Add a new constant symbol \( c \) and the sentences \( \{c > \overline{n} : n \in \mathbb{N}\} \) (where \( \overline{n} = S^n(0) \)). Every finite subset of this extended set is satisfiable (interpret \( c \) as a sufficiently large natural number). By compactness, there is a model where \( c \) is "infinitely large". This is a **non-standard model of arithmetic**.

**Example 2: Torsion groups.** Let \( T_{\mathrm{grp}} \) be the group axioms and suppose \( T_{\mathrm{grp}} \models \varphi \) for every sentence \( \varphi \) of the form "every element has finite order". Then the class of groups in which every element has finite order (torsion groups) cannot be axiomatized by a first-order theory alone — a compactness argument shows any axiomatization has models with elements of infinite order.

**Example 3: Finite fields have characteristic-zero extensions.** The theory \( T_{\mathrm{ACF}_0} \) of algebraically closed fields of characteristic 0 (see Chapter 3) is the limit of theories \( T_{\mathrm{ACF}_p} \) in the following sense: if \( \varphi \) holds in all \( \mathrm{ACF}_p \) for all sufficiently large primes \( p \), then \( \varphi \) holds in \( \mathrm{ACF}_0 \). This follows from compactness by adding axioms \( \mathrm{char} \neq p \) for each prime \( p \).

---

# Chapter 3: Model Theory

## 3.1 Theories and Elementary Equivalence

<div class="definition">
The <strong>complete theory</strong> (or <strong>theory</strong>) of a structure \( \mathfrak{A} \) is
\[ \mathrm{Th}(\mathfrak{A}) = \{\varphi : \varphi \text{ is a sentence and } \mathfrak{A} \models \varphi\}. \]
Two structures \( \mathfrak{A} \) and \( \mathfrak{B} \) are <strong>elementarily equivalent</strong> (written \( \mathfrak{A} \equiv \mathfrak{B} \)) if \( \mathrm{Th}(\mathfrak{A}) = \mathrm{Th}(\mathfrak{B}) \).
</div>

<div class="remark">
Isomorphic structures are elementarily equivalent (Isomorphism Theorem), but the converse fails: \( (\mathbb{Q}, <) \equiv (\mathbb{R}, <) \) since both are dense linear orders without endpoints, but they are not isomorphic (different cardinalities).
</div>

<div class="definition">
A theory \( T \) is <strong>complete</strong> if for every sentence \( \varphi \), either \( T \vdash \varphi \) or \( T \vdash \lnot \varphi \) (equivalently, \( T \models \varphi \) or \( T \models \lnot \varphi \)). Equivalently, all models of \( T \) are elementarily equivalent.
</div>

## 3.2 Löwenheim–Skolem Theorems

<div class="theorem">
<strong>(Downward Löwenheim–Skolem Theorem)</strong> Let \( \mathfrak{A} \) be a \( \sigma \)-structure with \( |A| \geq \aleph_0 \) and let \( X \subseteq A \) with \( |X| \leq \kappa \) for some infinite cardinal \( \kappa \geq |\sigma| \). Then there is an elementary substructure \( \mathfrak{B} \preccurlyeq \mathfrak{A} \) with \( X \subseteq B \) and \( |B| \leq \kappa \).
</div>

<div class="proof">
We build \( B \) using a **Skolem hull** construction. Start with \( B_0 = X \cup \{f^{\mathfrak{A}}(\vec{a}) : f \in F, \vec{a} \in X^{\mathrm{ar}(f)}\} \) — the closure of \( X \) under all function symbols. Iterate: at each step \( n \), for each formula \( \varphi(x, \vec{y}) \) and each tuple \( \vec{a} \in B_n^{|\vec{y}|} \), if \( \mathfrak{A} \models \exists x\, \varphi(x, \vec{a}) \), pick a witness \( b \in A \) and add it to \( B_{n+1} \). Set \( B = \bigcup_n B_n \). The Tarski–Vaught criterion is satisfied by construction: any existential witness required is present. The size \( |B| \leq \max(|X|, |\sigma|, \aleph_0) = \kappa \) since at each step we add at most \( |\mathrm{For}(\sigma)| \cdot |B_n| = \kappa \) many elements.
</div>

<div class="theorem">
<strong>(Upward Löwenheim–Skolem Theorem)</strong> Let \( \mathfrak{A} \) be an infinite \( \sigma \)-structure. Then for every cardinal \( \lambda \geq |A| + |\sigma| + \aleph_0 \), there exists \( \mathfrak{B} \equiv \mathfrak{A} \) with \( |B| = \lambda \).
</div>

<div class="proof">
Add \( \lambda \) new constant symbols \( \{c_i : i < \lambda\} \) to \( \sigma \). Expand the theory to \( T' = \mathrm{Th}(\mathfrak{A}) \cup \{c_i \neq c_j : i < j < \lambda\}. \) Every finite subset of \( T' \) is satisfiable (interpret finitely many \( c_i \) as distinct elements of the infinite domain \( A \)). By compactness, \( T' \) has a model \( \mathfrak{B}' \). The reduct \( \mathfrak{B} = \mathfrak{B}' \upharpoonright \sigma \) is a model of \( \mathrm{Th}(\mathfrak{A}) \) with \( |B| \geq \lambda \). Taking an elementary substructure of cardinality exactly \( \lambda \) (using the downward theorem) completes the proof.
</div>

**Corollary (Skolem's Paradox).** The theory ZFC has a countable model (by the downward Löwenheim–Skolem theorem), even though it proves the existence of uncountable sets. There is no contradiction: the model is countable from the outside, but "sees" itself as uncountable from the inside (no internal bijection with \( \omega \) exists within the model).

## 3.3 Vaught's Test

<div class="theorem">
<strong>(Vaught's Test)</strong> Let \( T \) be a satisfiable theory with no finite models. Suppose that all models of \( T \) of some infinite cardinality \( \kappa \geq |\sigma| + \aleph_0 \) are isomorphic. Then \( T \) is complete.
</div>

<div class="proof">
Suppose \( T \) is not complete. Then there is a sentence \( \varphi \) such that both \( T \cup \{\varphi\} \) and \( T \cup \{\lnot\varphi\} \) are satisfiable. By Löwenheim–Skolem, both have models of cardinality \( \kappa \). But these models satisfy different sentences, hence are not isomorphic — contradicting \( \kappa \)-categoricity.
</div>

**Example.** The theory \(\mathrm{DLO}\) of **dense linear orders without endpoints** (axioms: linear order, density \( \forall x \forall y (x < y \to \exists z (x < z \land z < y)) \), no endpoints) is \( \aleph_0 \)-categorical. All countable dense linear orders without endpoints are isomorphic to \( (\mathbb{Q}, <) \) by a back-and-forth argument (Cantor, 1895). By Vaught's test, \(\mathrm{DLO}\) is complete.

### 3.3.1 Back-and-Forth Systems

<div class="definition">
Let \( \mathfrak{A}, \mathfrak{B} \) be countable \( \sigma \)-structures. A <strong>back-and-forth system</strong> is a nonempty family \( \mathcal{I} \) of finite partial isomorphisms (injections \( p : A_0 \to B_0 \) with \( A_0 \subseteq A, B_0 \subseteq B \) preserving all atomic formulas) such that:
<ul>
  <li>(Forth) For every \( p \in \mathcal{I} \) and \( a \in A \), there exists \( q \in \mathcal{I} \) extending \( p \) with \( a \in \mathrm{dom}(q) \).</li>
  <li>(Back) For every \( p \in \mathcal{I} \) and \( b \in B \), there exists \( q \in \mathcal{I} \) extending \( p \) with \( b \in \mathrm{ran}(q) \).</li>
</ul>
If a back-and-forth system exists, then \( \mathfrak{A} \cong \mathfrak{B} \) (when both are countable).
</div>

## 3.4 Algebraically Closed Fields

<div class="definition">
A field \( K \) is <strong>algebraically closed</strong> if every nonconstant polynomial \( f \in K[x] \) has a root in \( K \).
</div>

The theory \(\mathrm{ACF}\) of algebraically closed fields is axiomatized in the language \( \{+, \cdot, -, 0, 1\} \) by:
- Field axioms.
- For each \( n \geq 1 \): \( \forall a_0 \cdots a_n\, \exists x\, (x^n + a_{n-1}x^{n-1} + \cdots + a_0 = 0) \) (every monic polynomial of degree \( n \) has a root).

For a prime \( p \), the theory \(\mathrm{ACF}_p = \mathrm{ACF} \cup \{\underbrace{1+\cdots+1}_{p} = 0\}\). The theory \(\mathrm{ACF}_0 = \mathrm{ACF} \cup \{n \cdot 1 \neq 0 : n \geq 1\}\).

<div class="theorem">
For each prime \( p \) and for \( p = 0 \), the theory \( \mathrm{ACF}_p \) is complete and is \( \kappa \)-categorical for every uncountable cardinal \( \kappa \).
</div>

<div class="proof">
Two algebraically closed fields of characteristic \( p \) with the same uncountable transcendence degree over their prime field are isomorphic (classical algebra). For uncountable \( \kappa \), all models of \( \mathrm{ACF}_p \) of cardinality \( \kappa \) have transcendence degree \( \kappa \) over the prime field, so they are all isomorphic. By Vaught's test (applied to any uncountable \( \kappa \)), \( \mathrm{ACF}_p \) is complete.
</div>

**Corollary (Chevalley–Tarski).** A statement expressible as a first-order sentence in the language of fields is true in \( \mathbb{C} \) if and only if it is true in every algebraically closed field of characteristic 0. More strikingly: a first-order sentence true in \( \mathbb{C} \) is also true in \( \overline{\mathbb{F}_p} \) for all sufficiently large primes \( p \).

**Example: Ax's theorem.** If a polynomial map \( f : \mathbb{C}^n \to \mathbb{C}^n \) is injective, then it is surjective. (This is false over \( \mathbb{R} \).) This can be proved by first showing it over finite fields \( \mathbb{F}_q \) (where injectivity trivially implies surjectivity), then transferring via compactness and completeness of \( \mathrm{ACF}_0 \).

## 3.5 Quantifier Elimination

<div class="definition">
A theory \( T \) admits <strong>quantifier elimination</strong> if for every formula \( \varphi(\vec{x}) \) there is a quantifier-free formula \( \psi(\vec{x}) \) such that \( T \models \varphi(\vec{x}) \leftrightarrow \psi(\vec{x}) \).
</div>

<div class="theorem">
<strong>(Tarski)</strong> \( \mathrm{ACF}_p \) admits quantifier elimination. Consequently, the definable sets in an algebraically closed field are exactly the constructible sets (Boolean combinations of algebraic varieties).
</div>

<div class="theorem">
<strong>(Tarski)</strong> The theory \( \mathrm{RCF} \) of real closed fields (ordered fields in which every positive element has a square root and every odd-degree polynomial has a root) admits quantifier elimination in the language \( \{+, \cdot, -, 0, 1, <\} \). In particular, the definable sets in \( \mathbb{R} \) are exactly the semialgebraic sets.
</div>

**Corollary.** Since \( \mathrm{RCF} \) admits quantifier elimination and is complete (as \( \mathbb{R} \) is a real closed field), the first-order theory of \( \mathbb{R} \) (as an ordered field) is decidable. This is in sharp contrast to the theory of \( \mathbb{N} \), which is undecidable (Gödel).

## 3.6 Types

<div class="definition">
Let \( T \) be a complete theory and \( A \subseteq M \models T \). An <strong>\( n \)-type</strong> over \( A \) is a set \( p(\vec{x}) \) of formulas with parameters from \( A \) such that \( T \cup \mathrm{diagram}(A) \cup p(\vec{x}) \) is satisfiable. The type is <strong>complete</strong> if for every formula \( \varphi(\vec{x}) \) over \( A \), either \( \varphi \in p \) or \( \lnot \varphi \in p \).

The <strong>type space</strong> \( S_n(A) \) is the set of complete \( n \)-types over \( A \), topologized by the basis \( [\varphi] = \{p \in S_n(A) : \varphi \in p\} \). This is the <strong>Stone space</strong> of the Lindenbaum–Tarski algebra.
</div>

<div class="definition">
A type \( p \in S_n(M) \) is <strong>realized</strong> in \( M \) if there is \( \vec{a} \in M^n \) with \( M \models \varphi(\vec{a}) \) for all \( \varphi \in p \). A model \( M \) is <strong>\( \omega \)-saturated</strong> if every type over a finite subset of \( M \) is realized in \( M \).
</div>

## 3.7 Fraïssé Theory

Fraïssé's theorem provides a way to build canonical countable structures as limits of finite approximations.

<div class="definition">
Let \( \mathcal{K} \) be a class of finite \( \sigma \)-structures. We say \( \mathcal{K} \) is a <strong>Fraïssé class</strong> if it satisfies:
<ol>
  <li><strong>Hereditary property (HP):</strong> If \( \mathfrak{A} \in \mathcal{K} \) and \( \mathfrak{B} \) embeds into \( \mathfrak{A} \), then \( \mathfrak{B} \in \mathcal{K} \).</li>
  <li><strong>Joint embedding property (JEP):</strong> For any \( \mathfrak{A}, \mathfrak{B} \in \mathcal{K} \), there exists \( \mathfrak{C} \in \mathcal{K} \) into which both embed.</li>
  <li><strong>Amalgamation property (AP):</strong> For any \( \mathfrak{A}, \mathfrak{B}, \mathfrak{C} \in \mathcal{K} \) and embeddings \( f : \mathfrak{A} \to \mathfrak{B} \), \( g : \mathfrak{A} \to \mathfrak{C} \), there exists \( \mathfrak{D} \in \mathcal{K} \) and embeddings \( f' : \mathfrak{B} \to \mathfrak{D} \), \( g' : \mathfrak{C} \to \mathfrak{D} \) with \( f' \circ f = g' \circ g \).</li>
  <li><strong>Essential countability:</strong> \( \mathcal{K} \) has countably many isomorphism types.</li>
</ol>
</div>

<div class="theorem">
<strong>(Fraïssé's Theorem)</strong> For every Fraïssé class \( \mathcal{K} \), there exists a unique (up to isomorphism) countable structure \( \mathfrak{F} \), called the <strong>Fraïssé limit</strong> of \( \mathcal{K} \), such that:
<ul>
  <li>Every finite substructure of \( \mathfrak{F} \) is in \( \mathcal{K} \).</li>
  <li>Every \( \mathfrak{A} \in \mathcal{K} \) embeds into \( \mathfrak{F} \).</li>
  <li>\( \mathfrak{F} \) is <strong>homogeneous</strong>: every isomorphism between finite substructures of \( \mathfrak{F} \) extends to an automorphism of \( \mathfrak{F} \).</li>
</ul>
</div>

**Examples of Fraïssé limits.**

- The Fraïssé limit of the class of all finite linear orders is \( (\mathbb{Q}, <) \).
- The Fraïssé limit of the class of all finite graphs is the **random graph** (Rado graph), which is \( \aleph_0 \)-categorical.
- The Fraïssé limit of the class of all finite sets (empty signature) is a countably infinite set.
- The Fraïssé limit of finite triangle-free graphs is the **Henson graph** \( H_3 \).

---

# Chapter 4: Set Theory

## 4.1 Motivation and the Cumulative Hierarchy

Cantor's paradise of infinite sets requires an axiomatic foundation to avoid paradoxes (Russell, Burali-Forti). The **Zermelo–Fraenkel axioms with Choice** (ZFC) provide the standard foundation. All mathematical objects are *sets*; the only primitive relation is \( \in \) (membership).

The **cumulative hierarchy** is the universe of sets built inductively:
\[ V_0 = \emptyset, \quad V_{\alpha+1} = \mathcal{P}(V_\alpha), \quad V_\lambda = \bigcup_{\alpha < \lambda} V_\alpha \text{ (for limit } \lambda). \]
The universe of all sets is \( V = \bigcup_\alpha V_\alpha \). Every set \( x \) belongs to some \( V_\alpha \); the least such \( \alpha \) is the **rank** of \( x \).

## 4.2 The ZFC Axioms

All axioms are sentences in the language \( \{\in\} \):

**1. Extensionality:**
\[ \forall x\, \forall y\, (\forall z\, (z \in x \leftrightarrow z \in y) \to x = y). \]
A set is determined by its elements.

**2. Empty Set:**
\[ \exists x\, \forall y\, \lnot (y \in x). \]
There is an empty set \( \emptyset \).

**3. Pairing:**
\[ \forall x\, \forall y\, \exists z\, \forall w\, (w \in z \leftrightarrow w = x \lor w = y). \]
For any \( x, y \) there is the set \( \{x, y\} \).

**4. Union:**
\[ \forall \mathcal{F}\, \exists A\, \forall x\, (x \in A \leftrightarrow \exists B\, (B \in \mathcal{F} \land x \in B)). \]
For any family \( \mathcal{F} \), the union \( \bigcup \mathcal{F} \) exists.

**5. Power Set:**
\[ \forall x\, \exists y\, \forall z\, (z \in y \leftrightarrow z \subseteq x). \]
The power set \( \mathcal{P}(x) \) exists.

**6. Separation Schema (Aussonderung):** For each formula \( \varphi(x, p) \):
\[ \forall A\, \forall p\, \exists B\, \forall x\, (x \in B \leftrightarrow x \in A \land \varphi(x, p)). \]
We can form \( \{x \in A : \varphi(x, p)\} \).

**7. Replacement Schema (Fraenkel):** For each formula \( \varphi(x, y, p) \):
\[ \forall A\, \forall p\, \left(\forall x \in A\, \exists! y\, \varphi(x,y,p)\right) \to \exists B\, \forall x \in A\, \exists y \in B\, \varphi(x,y,p). \]
The image of a set under a definable function is a set.

**8. Infinity:**
\[ \exists x\, (\emptyset \in x \land \forall y \in x\, (y \cup \{y\} \in x)). \]
An inductive set exists (its smallest element is \( \omega = \mathbb{N} \)).

**9. Foundation (Regularity):**
\[ \forall x\, (x \neq \emptyset \to \exists y \in x\, (y \cap x = \emptyset)). \]
Every nonempty set has a \( \in \)-minimal element. Equivalently: there is no infinite descending \( \in \)-chain.

**10. Choice (AC):**
\[ \forall \mathcal{F}\, \left(\emptyset \notin \mathcal{F} \to \exists f\, (f : \mathcal{F} \to \bigcup \mathcal{F} \land \forall A \in \mathcal{F}\, f(A) \in A)\right). \]
Every family of nonempty sets has a choice function.

## 4.3 Ordinals

<div class="definition">
A set \( \alpha \) is an <strong>ordinal</strong> if:
<ol>
  <li>\( \alpha \) is transitive: \( \forall x \in \alpha\, x \subseteq \alpha \).</li>
  <li>\( \in \) is a strict linear order on \( \alpha \).</li>
</ol>
(By foundation, this order is well-founded.) We write \( \mathbf{ON} \) for the class of all ordinals.
</div>

**Basic facts about ordinals:**
- Every element of an ordinal is an ordinal.
- For ordinals \( \alpha, \beta \): \( \alpha < \beta \iff \alpha \in \beta \iff \alpha \subsetneq \beta \).
- Every well-ordered set is order-isomorphic to a unique ordinal.
- The smallest ordinals are \( 0 = \emptyset, 1 = \{0\}, 2 = \{0,1\}, \ldots, \omega = \{0,1,2,\ldots\}, \omega+1 = \omega \cup \{\omega\}, \ldots \)
- **Successor ordinals**: \( \alpha + 1 = \alpha \cup \{\alpha\} \).
- **Limit ordinals**: \( \lambda \neq 0 \) with no predecessor; \( \lambda = \sup_{\alpha < \lambda} \alpha = \bigcup \lambda \).

<div class="theorem">
<strong>(Transfinite Induction)</strong> Let \( P(\alpha) \) be a property of ordinals. If \( P(0) \), and whenever \( P(\beta) \) for all \( \beta < \alpha \) implies \( P(\alpha) \), then \( P(\alpha) \) holds for all ordinals \( \alpha \).
</div>

<div class="theorem">
<strong>(Transfinite Recursion)</strong> For any operation \( G : V \to V \), there is a unique function \( F : \mathbf{ON} \to V \) such that \( F(\alpha) = G(F \upharpoonright \alpha) \) for all ordinals \( \alpha \).
</div>

### 4.3.1 Ordinal Arithmetic

Ordinal addition, multiplication, and exponentiation are defined by transfinite recursion:

- \( \alpha + 0 = \alpha \), \( \alpha + (\beta+1) = (\alpha + \beta) + 1 \), \( \alpha + \lambda = \sup_{\beta<\lambda}(\alpha+\beta) \) for limit \( \lambda \).
- \( \alpha \cdot 0 = 0 \), \( \alpha \cdot (\beta+1) = (\alpha \cdot \beta) + \alpha \), \( \alpha \cdot \lambda = \sup_{\beta<\lambda}(\alpha \cdot \beta) \) for limit \( \lambda \).

**Warning:** Ordinal arithmetic is not commutative. For example, \( 1 + \omega = \omega \neq \omega + 1 \).

### 4.3.2 Cantor Normal Form

<div class="theorem">
<strong>(Cantor Normal Form)</strong> Every nonzero ordinal \( \alpha \) can be written uniquely in the form
\[ \alpha = \omega^{\beta_1} \cdot k_1 + \omega^{\beta_2} \cdot k_2 + \cdots + \omega^{\beta_n} \cdot k_n \]
where \( \beta_1 > \beta_2 > \cdots > \beta_n \) are ordinals and \( k_1, k_2, \ldots, k_n \) are positive integers.
</div>

## 4.4 Cardinals

<div class="definition">
A <strong>cardinal</strong> is an ordinal \( \kappa \) such that \( |\kappa| \neq |\alpha| \) for all \( \alpha < \kappa \) (i.e., no smaller ordinal has the same cardinality). Under AC, every set is in bijection with a unique cardinal.
</div>

The sequence of infinite cardinals: \( \aleph_0 = \omega < \aleph_1 < \aleph_2 < \cdots \). For limit ordinals \( \lambda \): \( \aleph_\lambda = \sup_{\alpha<\lambda} \aleph_\alpha \).

<div class="theorem">
<strong>(Cantor's Theorem)</strong> For every set \( X \): \( |X| < |\mathcal{P}(X)| \).
</div>

<div class="proof">
There is no surjection from \( X \) onto \( \mathcal{P}(X) \). Suppose \( f : X \to \mathcal{P}(X) \) is any function. Define \( D = \{x \in X : x \notin f(x)\} \in \mathcal{P}(X) \). For any \( x \in X \): if \( x \in D \) then \( x \notin f(x) \) so \( f(x) \neq D \); if \( x \notin D \) then \( x \in f(x) \) so \( f(x) \neq D \). Thus \( D \notin \mathrm{ran}(f) \), so \( f \) is not surjective.
</div>

**Corollary.** The cardinals form a proper class: \( \aleph_0 < 2^{\aleph_0} < 2^{2^{\aleph_0}} < \cdots \)

### 4.4.1 Cardinal Arithmetic

Under AC:
- \( \kappa + \lambda = \lambda + \kappa = \kappa \cdot \lambda = \kappa \cdot \lambda = \max(\kappa, \lambda) \) for infinite cardinals.
- Cardinal exponentiation \( \kappa^\lambda \) is more subtle. The **continuum hypothesis (CH)** states \( 2^{\aleph_0} = \aleph_1 \). Gödel showed CH is consistent with ZFC (1938); Cohen showed its negation is also consistent (1963). Thus CH is independent of ZFC.

### 4.4.2 Cofinality

<div class="definition">
The <strong>cofinality</strong> \( \mathrm{cf}(\kappa) \) of a cardinal \( \kappa \) is the least cardinality of a cofinal subset: a subset \( X \subseteq \kappa \) such that \( \sup X = \kappa \). A cardinal is <strong>regular</strong> if \( \mathrm{cf}(\kappa) = \kappa \), and <strong>singular</strong> otherwise.
</div>

**Facts:** \( \aleph_0 \) and all successor cardinals \( \aleph_{\alpha+1} \) are regular. \( \aleph_\omega \) is singular with \( \mathrm{cf}(\aleph_\omega) = \aleph_0 \).

---

# Chapter 5: Computability Theory and Gödel's Incompleteness Theorems

## 5.1 Primitive Recursive and Recursive Functions

<div class="definition">
The class of <strong>primitive recursive functions</strong> \( f : \mathbb{N}^k \to \mathbb{N} \) is the smallest class containing:
<ol>
  <li>The zero function \( Z(n) = 0 \).</li>
  <li>The successor function \( S(n) = n+1 \).</li>
  <li>The projection functions \( \pi^k_i(n_1,\ldots,n_k) = n_i \).</li>
</ol>
and closed under:
<ul>
  <li><strong>Composition:</strong> if \( g : \mathbb{N}^m \to \mathbb{N} \) and \( h_1,\ldots,h_m : \mathbb{N}^k \to \mathbb{N} \) are primitive recursive, so is \( f(\vec{n}) = g(h_1(\vec{n}),\ldots,h_m(\vec{n})) \).</li>
  <li><strong>Primitive recursion:</strong> if \( g : \mathbb{N}^k \to \mathbb{N} \) and \( h : \mathbb{N}^{k+2} \to \mathbb{N} \) are primitive recursive, then so is \( f \) defined by \( f(\vec{n}, 0) = g(\vec{n}) \) and \( f(\vec{n}, m+1) = h(\vec{n}, m, f(\vec{n}, m)) \).</li>
</ul>
</div>

**Examples.** Addition, multiplication, exponentiation, the predecessor function, and all bounded quantifications are primitive recursive. The Ackermann function is recursive but not primitive recursive.

<div class="definition">
The class of <strong>partial recursive functions</strong> (equivalently, **Turing-computable** functions) is the smallest class extending the primitive recursive functions and closed under the \( \mu \)-operator (minimization): given total recursive \( g : \mathbb{N}^{k+1} \to \mathbb{N} \), the function \( f(\vec{n}) = \mu m\, [g(\vec{n},m)=0] \) (the least \( m \) such that \( g(\vec{n},m)=0 \), if it exists) is partial recursive.
</div>

**Church–Turing Thesis.** Every effectively computable function (in the informal sense) is partial recursive. This is a philosophical thesis, not a theorem, but is universally accepted.

## 5.2 Gödel Numbering

<div class="definition">
A <strong>Gödel numbering</strong> is an effective bijection (or injection) from syntactic objects (terms, formulas, proofs, sequences of formulas) to \( \mathbb{N} \). Fix such a numbering \( \ulcorner \cdot \urcorner \); we write \( \ulcorner \varphi \urcorner \) for the Gödel number of \( \varphi \).
</div>

A specific numbering for formulas in signature \( \sigma_{\mathrm{arith}} = \{0, S, +, \cdot\} \):
Assign codes to symbols, then encode sequences by prime factorization or by pairing functions. The key properties:
- The set of Gödel numbers of well-formed formulas is primitive recursive.
- The substitution operation \( (\varphi, x, t) \mapsto \varphi[t/x] \) is primitive recursive (on Gödel numbers).

### 5.2.1 Representability in PA

**Peano Arithmetic (PA)** is the theory in signature \( \{0, S, +, \cdot\} \) with the following axioms:
1. \( \forall x\, \lnot (S(x) = 0) \)
2. \( \forall x \forall y\, (S(x) = S(y) \to x = y) \)
3. \( \forall x\, (x + 0 = x) \), \( \forall x \forall y\, (x + S(y) = S(x+y)) \)
4. \( \forall x\, (x \cdot 0 = 0) \), \( \forall x \forall y\, (x \cdot S(y) = x \cdot y + x) \)
5. **Induction schema**: for each formula \( \varphi(x) \):
\[ (\varphi(0) \land \forall x\, (\varphi(x) \to \varphi(S(x)))) \to \forall x\, \varphi(x). \]

<div class="definition">
A relation \( R \subseteq \mathbb{N}^k \) is <strong>representable</strong> in PA if there is a formula \( \varphi(x_1,\ldots,x_k) \) such that for all \( n_1,\ldots,n_k \in \mathbb{N} \):
<ul>
  <li>If \( R(n_1,\ldots,n_k) \), then \( PA \vdash \varphi(\overline{n_1},\ldots,\overline{n_k}) \).</li>
  <li>If \( \lnot R(n_1,\ldots,n_k) \), then \( PA \vdash \lnot\varphi(\overline{n_1},\ldots,\overline{n_k}) \).</li>
</ul>
</div>

<div class="theorem">
Every primitive recursive (indeed, every recursive) relation is representable in PA.
</div>

This is proved by showing addition and multiplication are representable, then using the Gödel \( \beta \)-function to encode sequences, allowing the simulation of recursion within PA.

## 5.3 Decidability and Undecidability

<div class="definition">
A theory \( T \) is <strong>decidable</strong> if the set \( \{\ulcorner \varphi \urcorner : T \vdash \varphi\} \) is a recursive set. It is <strong>undecidable</strong> otherwise.
</div>

<div class="definition">
A set \( S \subseteq \mathbb{N} \) is <strong>recursively enumerable (r.e.)</strong> (or <strong>computably enumerable, c.e.</strong>) if it is the domain of a partial recursive function, equivalently, the range of a total recursive function (or empty).
</div>

<div class="theorem">
<strong>(Halting Problem)</strong> The set \( K = \{e : \phi_e(e) \downarrow\} \) (where \( \phi_e \) is the \( e \)-th partial recursive function) is r.e. but not recursive. Equivalently, the halting problem — given a Turing machine and input, does it halt? — is undecidable.
</div>

<div class="proof">
<em>K is r.e.:</em> The universal Turing machine enumerates \( K \) — run the \( e \)-th machine on input \( e \); if it halts, enumerate \( e \).

<em>K is not recursive:</em> Suppose for contradiction that \( K \) is recursive, so \( \overline{K} = \mathbb{N} \setminus K \) is also recursive. Define \( f(e) = \phi_e(e) + 1 \) if \( e \in K \), and \( f(e) = 0 \) if \( e \notin K \). Then \( f \) is total recursive. But \( f = \phi_e \) for some \( e \). If \( e \in K \), then \( \phi_e(e) \downarrow \) so \( f(e) = \phi_e(e)+1 \neq \phi_e(e) \), contradiction. If \( e \notin K \), then \( \phi_e(e) \uparrow \) so \( f(e) = 0 \), but then \( \phi_e(e) \downarrow = 0 \), so \( e \in K \), contradiction. (Alternatively, use the standard diagonalization.)
</div>

## 5.4 Gödel's First Incompleteness Theorem

<div class="theorem">
<strong>(Gödel's First Incompleteness Theorem, 1931)</strong> Let \( T \) be a consistent, recursively axiomatizable extension of Robinson arithmetic \( Q \). Then there exists a sentence \( G_T \) (a <strong>Gödel sentence</strong> for \( T \)) such that:
<ol>
  <li>\( T \not\vdash G_T \)</li>
  <li>\( T \not\vdash \lnot G_T \)</li>
</ol>
In other words, \( T \) is <strong>incomplete</strong>: it has a statement that is neither provable nor refutable.
</div>

### 5.4.1 The Diagonal Lemma

<div class="theorem">
<strong>(Fixed-Point / Diagonal Lemma)</strong> Let \( T \) extend Robinson's \( Q \) and let \( \psi(y) \) be any formula with one free variable. Then there exists a sentence \( \gamma \) such that
\[ T \vdash \gamma \leftrightarrow \psi(\ulcorner \gamma \urcorner). \]
</div>

<div class="proof">
Define the <strong>substitution function</strong> \( \mathrm{sub}(m, n) \) to be the Gödel number of the formula obtained by substituting the numeral \( \overline{n} \) for the free variable in the formula with Gödel number \( m \). This is a primitive recursive function, hence representable by a formula \( \delta(x,y,z) \) in \( T \) — specifically, there is a term \( \mathrm{Sub} \) such that \( T \vdash \delta(\overline{m}, \overline{n}, \overline{\mathrm{sub}(m,n)}) \).

Let \( \theta(x) = \psi(\mathrm{sub}(x,x)) \) (substitute \( x \) for the free variable in the formula coded by \( x \), then apply \( \psi \)). Let \( m = \ulcorner \theta(x) \urcorner \). Define \( \gamma = \theta(\overline{m}) \). Then:
\[ \ulcorner \gamma \urcorner = \ulcorner \theta(\overline{m}) \urcorner = \mathrm{sub}(m, m). \]
And \( \gamma = \theta(\overline{m}) = \psi(\mathrm{sub}(\overline{m}, \overline{m})) = \psi(\overline{\mathrm{sub}(m,m)}) = \psi(\ulcorner \gamma \urcorner) \).
Thus \( T \vdash \gamma \leftrightarrow \psi(\ulcorner \gamma \urcorner) \).
</div>

### 5.4.2 Proof of the First Incompleteness Theorem

Let \( \mathrm{Prov}_T(x) \) be the formula representing the provability predicate: \( \mathrm{Prov}_T(\overline{n}) \) holds (in \( \mathbb{N} \), and is provable in \( T \)) iff \( n \) is the Gödel number of a theorem of \( T \). This predicate exists because the set of proofs in \( T \) is primitive recursive (for recursively axiomatized \( T \)).

Apply the Diagonal Lemma with \( \psi(y) = \lnot \mathrm{Prov}_T(y) \):

There exists a sentence \( G \) such that \( T \vdash G \leftrightarrow \lnot \mathrm{Prov}_T(\ulcorner G \urcorner) \).

Intuitively, \( G \) says "I am not provable in \( T \)."

**Claim 1: \( T \not\vdash G \).** Suppose \( T \vdash G \). Since the proof system is correct (and \( T \) is consistent), \( \mathbb{N} \models \mathrm{Prov}_T(\ulcorner G \urcorner) \), so \( T \vdash \mathrm{Prov}_T(\ulcorner G \urcorner) \). But then \( T \vdash \lnot G \) (from the biconditional), contradicting consistency.

**Claim 2: \( T \not\vdash \lnot G \)** (assuming \( T \) is \( \omega \)-consistent or using Rosser's trick). Under \( \omega \)-consistency: if \( T \vdash \lnot G \), then \( \mathbb{N} \models \lnot\lnot \mathrm{Prov}_T(\ulcorner G \urcorner) \), meaning there is a proof of \( G \) in \( T \). But we showed \( T \not\vdash G \), so \( \mathbb{N} \models \forall n\, \lnot \mathrm{Proof}_T(n, \ulcorner G \urcorner) \) (where \( \mathrm{Proof}_T(n,m) \) says \( n \) codes a proof of \( m \)). Then \( T \vdash \lnot \mathrm{Proof}_T(\overline{n}, \ulcorner G \urcorner) \) for each \( n \) (by representability), contradicting \( \omega \)-consistency and \( T \vdash \lnot G \) (which says a proof exists). \(\square\)

**Rosser's improvement (1936):** Replace \( \psi(y) = \lnot \mathrm{Prov}_T(y) \) with the **Rosser predicate** \( \psi_R(y) = \forall p\, (\mathrm{Proof}_T(p,y) \to \exists q < p\, \mathrm{Proof}_T(q, \lnot y)) \), which says "any proof of me is preceded by a shorter proof of my negation". Then \( T \not\vdash G_R \) and \( T \not\vdash \lnot G_R \) assuming only consistency (not \( \omega \)-consistency).

### 5.4.3 Semantic Completeness vs. Syntactic Incompleteness

The completeness theorem (Chapter 2) says: everything that is true in all models is provable. The incompleteness theorem says: even in a *single fixed intended model* (\( \mathbb{N} \)), there are true statements not provable in \( T \). These are not contradictory! The Gödel sentence \( G \) *is* true in \( \mathbb{N} \) (since \( \mathbb{N} \models \lnot \mathrm{Prov}_T(\ulcorner G \urcorner) \) — truly there is no proof), but it is not provable in \( T \).

## 5.5 Gödel's Second Incompleteness Theorem

<div class="definition">
The <strong>consistency statement</strong> for \( T \) is the sentence
\[ \mathrm{Con}(T) = \lnot \mathrm{Prov}_T(\ulcorner \bot \urcorner). \]
</div>

<div class="theorem">
<strong>(Gödel's Second Incompleteness Theorem)</strong> Let \( T \) be a consistent, recursively axiomatizable extension of \( Q \). Then
\[ T \not\vdash \mathrm{Con}(T). \]
</div>

<div class="proof">
We showed in the First Incompleteness Theorem that \( T \not\vdash G \), where \( G \leftrightarrow \lnot \mathrm{Prov}_T(\ulcorner G \urcorner) \). The key is that the argument for "Claim 1" above can be formalized inside \( T \):

\[ T \vdash \mathrm{Con}(T) \to G. \]

Specifically, the proof of "if \( T \vdash G \) then \( T \) is inconsistent" can itself be carried out in \( T \) (using the Hilbert–Bernays provability conditions, a.k.a. the **Löb conditions**):
<ul>
  <li>(D1) If \( T \vdash \varphi \), then \( T \vdash \mathrm{Prov}_T(\ulcorner \varphi \urcorner) \).</li>
  <li>(D2) \( T \vdash \mathrm{Prov}_T(\ulcorner \varphi \urcorner) \land \mathrm{Prov}_T(\ulcorner \varphi \to \psi \urcorner) \to \mathrm{Prov}_T(\ulcorner \psi \urcorner) \).</li>
  <li>(D3) \( T \vdash \mathrm{Prov}_T(\ulcorner \varphi \urcorner) \to \mathrm{Prov}_T(\ulcorner \mathrm{Prov}_T(\ulcorner \varphi \urcorner) \urcorner) \).</li>
</ul>

From these: \( T \vdash \mathrm{Con}(T) \to G \). If \( T \vdash \mathrm{Con}(T) \), then \( T \vdash G \), contradicting the First Incompleteness Theorem.
</div>

**Philosophical significance.** Hilbert's program sought a finitary consistency proof for all of mathematics. The Second Incompleteness Theorem shows that no consistent system powerful enough to encode arithmetic can prove its own consistency. In particular, ZFC cannot prove \( \mathrm{Con}(\text{ZFC}) \) (assuming ZFC is consistent). A stronger system can prove the consistency of a weaker one — but one always needs to "stand outside" the system.

### 5.5.1 Löb's Theorem

<div class="theorem">
<strong>(Löb's Theorem, 1955)</strong> For a theory \( T \) satisfying the Hilbert–Bernays conditions: if \( T \vdash \mathrm{Prov}_T(\ulcorner \varphi \urcorner) \to \varphi \), then \( T \vdash \varphi \).
</div>

<div class="proof">
Apply the Diagonal Lemma to \( \psi(y) = \mathrm{Prov}_T(y) \to \varphi \): get \( \lambda \) with \( T \vdash \lambda \leftrightarrow (\mathrm{Prov}_T(\ulcorner \lambda \urcorner) \to \varphi) \). 

Assuming \( T \vdash \mathrm{Prov}_T(\ulcorner \varphi \urcorner) \to \varphi \):
<ul>
  <li>By (D1) applied to \( T \vdash \lambda \leftrightarrow \ldots \): \( T \vdash \mathrm{Prov}_T(\ulcorner\lambda\urcorner) \).</li>
  <li>By (D2) and (D3): \( T \vdash \mathrm{Prov}_T(\ulcorner \mathrm{Prov}_T(\ulcorner\lambda\urcorner) \urcorner) \).</li>
  <li>Then \( T \vdash \mathrm{Prov}_T(\ulcorner \lambda \urcorner) \to \mathrm{Prov}_T(\ulcorner \varphi \urcorner) \) (since \( T \vdash \lambda \to (\mathrm{Prov}_T(\ulcorner\lambda\urcorner) \to \varphi) \)).</li>
  <li>Combining: \( T \vdash \mathrm{Prov}_T(\ulcorner\lambda\urcorner) \to \varphi \), hence \( T \vdash \lambda \).</li>
  <li>By (D1): \( T \vdash \mathrm{Prov}_T(\ulcorner\lambda\urcorner) \), and then \( T \vdash \varphi \).</li>
</ul>
</div>

**Corollary.** The Gödel sentence \( G \) is not provable in \( T \): if it were, then \( T \vdash \mathrm{Prov}_T(\ulcorner G \urcorner) \to G \), but by Löb's theorem this would give \( T \vdash G \) and hence inconsistency.

## 5.6 Tarski's Undefinability of Truth

<div class="theorem">
<strong>(Tarski's Undefinability Theorem)</strong> Let \( T \) be any consistent extension of \( Q \). There is no formula \( \mathrm{True}(x) \) in the language of arithmetic such that for all sentences \( \varphi \):
\[ T \vdash \mathrm{True}(\ulcorner \varphi \urcorner) \leftrightarrow \varphi. \]
In other words, arithmetic truth is not arithmetically definable.
</div>

<div class="proof">
Suppose such \( \mathrm{True}(x) \) existed. Apply the Diagonal Lemma with \( \psi(y) = \lnot \mathrm{True}(y) \): get \( \lambda \) with \( T \vdash \lambda \leftrightarrow \lnot \mathrm{True}(\ulcorner \lambda \urcorner) \). If \( \mathrm{True}(\ulcorner \lambda \urcorner) \) is provable, then \( \lambda \) is provable (from the biconditional), so \( \lnot \lambda \) is provable, contradiction. If \( \lnot \mathrm{True}(\ulcorner \lambda \urcorner) \), then \( \lambda \) holds in \( \mathbb{N} \), so \( \mathrm{True}(\ulcorner \lambda \urcorner) \) holds (by assumption), contradiction. Both cases give contradictions, so no such formula exists.
</div>

This is the formal version of the Liar Paradox ("This sentence is false"). Tarski's theorem is in fact *stronger* than Gödel's: it shows not just that \( T \) is incomplete, but that truth in \( \mathbb{N} \) is not even *definable* in the language of arithmetic, let alone provable.

---

# Chapter 6: Deeper Model Theory

## 6.1 Ultraproducts and an Alternative Proof of Compactness

<div class="definition">
A <strong>filter</strong> \( \mathcal{F} \) on a set \( I \) is a collection of subsets of \( I \) such that:
<ul>
  <li>\( I \in \mathcal{F} \) and \( \emptyset \notin \mathcal{F} \).</li>
  <li>If \( A \in \mathcal{F} \) and \( A \subseteq B \), then \( B \in \mathcal{F} \).</li>
  <li>If \( A, B \in \mathcal{F} \), then \( A \cap B \in \mathcal{F} \).</li>
</ul>
A filter \( \mathcal{U} \) is an <strong>ultrafilter</strong> if additionally for every \( A \subseteq I \): either \( A \in \mathcal{U} \) or \( I \setminus A \in \mathcal{U} \).
</div>

<div class="definition">
Let \( \{(\mathfrak{A}_i)\}_{i \in I} \) be a family of \( \sigma \)-structures and \( \mathcal{U} \) an ultrafilter on \( I \). The <strong>ultraproduct</strong> \( \prod_{\mathcal{U}} \mathfrak{A}_i \) has:
<ul>
  <li>Universe: \( \left(\prod_{i \in I} A_i\right) / \sim_{\mathcal{U}} \) where \( (a_i) \sim_{\mathcal{U}} (b_i) \) iff \( \{i : a_i = b_i\} \in \mathcal{U} \).</li>
  <li>Functions and relations interpreted coordinatewise modulo \( \mathcal{U} \).</li>
</ul>
If all \( \mathfrak{A}_i = \mathfrak{A} \), this is the <strong>ultrapower</strong> \( \mathfrak{A}^I / \mathcal{U} \).
</div>

<div class="theorem">
<strong>(Łoś's Theorem)</strong> For any formula \( \varphi(x_1,\ldots,x_n) \) and any elements \( [(a^1_i)], \ldots, [(a^n_i)] \) of the ultraproduct:
\[ \prod_{\mathcal{U}} \mathfrak{A}_i \models \varphi\left[[(a^1_i)],\ldots,[(a^n_i)]\right] \iff \{i \in I : \mathfrak{A}_i \models \varphi[a^1_i,\ldots,a^n_i]\} \in \mathcal{U}. \]
</div>

<div class="proof">
By induction on \( \varphi \). Atomic: immediate from the definitions. Negation: \( \{i : \mathfrak{A}_i \models \lnot \varphi[\vec{a}_i]\} = I \setminus \{i : \mathfrak{A}_i \models \varphi[\vec{a}_i]\} \), and \( \mathcal{U} \) is an ultrafilter so exactly one of a set and its complement is in \( \mathcal{U} \). Conjunction: \( \{i : \mathfrak{A}_i \models (\varphi \land \psi)[\vec{a}_i]\} = \{i : \mathfrak{A}_i \models \varphi[\vec{a}_i]\} \cap \{i : \mathfrak{A}_i \models \psi[\vec{a}_i]\} \). Existential: if \( \{i : \mathfrak{A}_i \models \exists x\, \varphi[x,\vec{a}_i]\} \in \mathcal{U} \), use AC to pick witnesses \( b_i \in A_i \) for \( i \) in this set; then \( [(b_i)] \) witnesses the existential in the ultraproduct.
</div>

**Proof of Compactness via Ultraproducts.** Let \( \Phi = \{\varphi_j : j \in J\} \) be finitely satisfiable. Index models: for each finite \( F \subseteq J \), let \( \mathfrak{A}_F \models \Phi_F = \{\varphi_j : j \in F\} \). Set \( I = \{F \subseteq J : F \text{ finite}\} \). For each \( j \in J \), let \( X_j = \{F \in I : j \in F\} \). The family \( \{X_j : j \in J\}  \) has the finite intersection property (any finite intersection \( X_{j_1} \cap \cdots \cap X_{j_n} \supseteq \{j_1,\ldots,j_n\} \neq \emptyset \)), so it extends to an ultrafilter \( \mathcal{U} \) on \( I \). For each \( j \in J \): \( \{F : \mathfrak{A}_F \models \varphi_j\} \supseteq X_j \in \mathcal{U} \). By Łoś, \( \prod_\mathcal{U} \mathfrak{A}_F \models \varphi_j \) for all \( j \). Hence \( \prod_\mathcal{U} \mathfrak{A}_F \models \Phi \).

## 6.2 The Omitting Types Theorem

<div class="theorem">
<strong>(Omitting Types Theorem)</strong> Let \( T \) be a complete theory over a countable language, and let \( \{p_n(x_n)\}_{n \in \omega} \) be a countable collection of non-isolated types (types \( p \in S_n(T) \) that are not generated by a single formula). Then there exists a countable model of \( T \) omitting all \( p_n \).
</div>

A type is **isolated** by \( \varphi \) if \( T \vdash \varphi \to \psi \) for all \( \psi \in p \). The theorem says that types which are not forced must be avoidable.

## 6.3 Categoricity and Morley's Theorem

<div class="definition">
A theory \( T \) is <strong>\( \kappa \)-categorical</strong> if it has exactly one model of cardinality \( \kappa \) (up to isomorphism).
</div>

<div class="theorem">
<strong>(Morley's Theorem, 1965)</strong> If a countable theory \( T \) is \( \kappa \)-categorical for some uncountable cardinal \( \kappa \), then it is \( \kappa \)-categorical for every uncountable cardinal \( \kappa \).
</div>

This deep theorem — Morley's first major result in model theory — launched the program of **stability theory** and **classification theory**, developed by Shelah in the 1970s. The key tools are:

- **Strongly minimal sets**: a definable set \( D \) in \( M \models T \) is *strongly minimal* if it is infinite and for every definable subset \( X \subseteq D \), either \( X \) or \( D \setminus X \) is finite.
- **Algebraic independence** and **Morley rank**: a notion of dimension analogous to transcendence degree in field theory.
- Uncountably categorical theories have a strongly minimal set and are "controlled" by this set.

## 6.4 Stability and Classification

Shelah's monumental classification program addresses: for which theories \( T \) and cardinals \( \kappa \) is the number of models of \( T \) of cardinality \( \kappa \) small?

<div class="definition">
A complete theory \( T \) is <strong>stable</strong> if for every cardinal \( \kappa \geq |T| + \aleph_0 \) and every \( M \models T \) with \( |M| = \kappa \): \( |S_n(M)| = \kappa \) for all \( n \). (Many equivalent characterizations exist.)
</div>

**Stability spectrum:** a theory is:
- **\( \omega \)-stable** (totally transcendental) if \( |S_1(M)| \leq \aleph_0 \) for all \( M \models T \) with \( |M| = \aleph_0 \). Examples: ACF, the theory of \( (\mathbb{Q}, +) \).
- **Superstable** if stable in all \( \kappa \geq 2^{|T|} \).
- **Stable** (but not superstable): DLO is not stable!
- **Unstable** (has the order property): real closed fields, linear orders.

---

# Chapter 7: Connections and Advanced Topics

## 7.1 Zermelo–Fraenkel Set Theory and Gödel's Constructible Universe

**Gödel's L (the Constructible Universe)** is built by:
\[ L_0 = \emptyset, \quad L_{\alpha+1} = \mathrm{Def}(L_\alpha) = \{X \subseteq L_\alpha : X \text{ is first-order definable over } (L_\alpha, \in)\}, \]
\[ L_\lambda = \bigcup_{\alpha < \lambda} L_\alpha \text{ for limit } \lambda, \quad L = \bigcup_\alpha L_\alpha. \]

<div class="theorem">
<strong>(Gödel, 1938)</strong> \( L \) is a model of ZFC. Moreover, in \( L \):
<ol>
  <li>The Axiom of Choice holds (there is a definable global well-ordering of \( L \)).</li>
  <li>The Generalized Continuum Hypothesis (GCH) holds: \( 2^{\aleph_\alpha} = \aleph_{\alpha+1} \) for all \( \alpha \).</li>
</ol>
In particular, if ZF is consistent, then so is ZFC + GCH.
</div>

**Cohen's Forcing (1963).** Cohen invented the method of **forcing** to build models of ZFC in which CH fails. One starts with a countable transitive model \( M \) of ZFC and adds a **generic** set \( G \subseteq \omega \times \omega_2 \) to get an extension \( M[G] \) in which \( 2^{\aleph_0} \geq \aleph_2 \). The key is that the forcing relation "\( p \Vdash \varphi \)" (a condition \( p \) forces \( \varphi \)) is definable in \( M \), so truth in \( M[G] \) can be controlled from within \( M \). This established the **independence of CH from ZFC**.

## 7.2 Large Cardinals

The consistency strength of set-theoretic principles is measured by **large cardinals**:

- **Inaccessible cardinals**: \( \kappa > \omega \) is inaccessible if it is regular and for all \( \lambda < \kappa \), \( 2^\lambda < \kappa \). ZFC cannot prove inaccessibles exist.
- **Measurable cardinals**: \( \kappa \) is measurable if there is a \( \kappa \)-complete ultrafilter on \( \kappa \). The ultrapower of \( V \) by this ultrafilter gives an elementary embedding \( j : V \to M \) with critical point \( \kappa \).
- **Woodin cardinals, supercompact cardinals, etc.**: the large cardinal hierarchy extends far into the transfinite and provides consistency strength for many set-theoretic propositions.

## 7.3 Reflection and the Relationship Between Syntax and Semantics

<div class="theorem">
<strong>(Reflection Principle)</strong> For every formula \( \varphi(x_1,\ldots,x_n) \) and every ordinal \( \alpha \), there exists \( \beta > \alpha \) such that for all \( a_1,\ldots,a_n \in V_\beta \):
\[ V_\beta \models \varphi[a_1,\ldots,a_n] \iff V \models \varphi[a_1,\ldots,a_n]. \]
</div>

This shows that the axioms of ZFC cannot be finite (since any finite list of axioms has a set-sized model, contradicting the incompleteness theorem — actually, this gives another proof that ZFC cannot prove its own consistency).

## 7.4 Arithmetical Hierarchy

<div class="definition">
The <strong>arithmetical hierarchy</strong> classifies subsets of \( \mathbb{N} \) by the complexity of their definitions:
<ul>
  <li>\( \Sigma^0_0 = \Pi^0_0 = \Delta^0_0 \): decidable (recursive) sets, defined by bounded quantification.</li>
  <li>\( \Sigma^0_1 \): r.e. sets, defined by \( \exists x_1\, \forall x_2\, \ldots \) (one unbounded existential at front).</li>
  <li>\( \Pi^0_1 \): co-r.e. sets, defined by \( \forall x_1\, \ldots \).</li>
  <li>\( \Sigma^0_{n+1} \): sets defined by \( \exists \vec{x}\, \varphi \) where \( \varphi \) is \( \Pi^0_n \).</li>
  <li>\( \Pi^0_{n+1} \): sets defined by \( \forall \vec{x}\, \varphi \) where \( \varphi \) is \( \Sigma^0_n \).</li>
  <li>\( \Delta^0_n = \Sigma^0_n \cap \Pi^0_n \).</li>
</ul>
</div>

<div class="theorem">
<strong>(Post's Theorem)</strong> A set \( A \subseteq \mathbb{N} \) is \( \Sigma^0_n \) if and only if it is computably enumerable relative to \( \emptyset^{(n-1)} \) (the \( (n-1) \)-th Turing jump). In particular, \( \mathrm{Th}(\mathbb{N}) \) is \( \Pi^0_1 \)-hard but is not arithmetical — truth in \( \mathbb{N} \) is not even at any finite level of the hierarchy.
</div>

This last fact is essentially Tarski's undefinability theorem expressed in the language of computability.

---

# Chapter 8: Summary of Major Theorems and Connections

## 8.1 The Four Pillars — A Unified View

The four main areas of PMATH 432 are deeply interconnected:

**First-order logic** provides the formal language (Chapter 1). **Proof theory** (Chapter 2) shows that syntactic deduction (\( \vdash \)) matches semantic entailment (\( \models \)) — the completeness theorem. **Model theory** (Chapters 3 and 6) explores the space of all structures satisfying a theory: how many are there, how do they relate, what can be expressed? **Set theory** (Chapter 4) provides the foundational framework and exhibits independence results. **Computability** (Chapter 5) bounds what can be proved or even defined.

The central theorems and their dependencies:

| Theorem | Requires | Consequence |
|---|---|---|
| Completeness (Gödel 1930) | Lindenbaum + Henkin | Compactness |
| Compactness | Completeness or Ultraproducts | Löwenheim–Skolem (upward) |
| Löwenheim–Skolem (downward) | Skolem functions | Infinite models of any theory |
| Vaught's test | Löwenheim–Skolem | Completeness of DLO, ACF |
| Gödel numbering | Primitive recursion | Representability in PA |
| Diagonal Lemma | Representability | Gödel sentences, Tarski |
| First Incompleteness | Diagonal Lemma | Second Incompleteness |
| Second Incompleteness | Hilbert–Bernays conditions | Limits of formal provability |

## 8.2 Key Examples Revisited

**Dense linear orders without endpoints (DLO):**
- Axioms: linear order + density + no endpoints.
- Model: \( (\mathbb{Q}, <) \) — the unique countable model up to isomorphism.
- Complete by Vaught's test (\( \aleph_0 \)-categorical).
- Admits quantifier elimination (definable sets are Boolean combinations of intervals).
- Unstable (the order relation witnesses the order property).

**Algebraically closed fields of characteristic \( p \) (\( \mathrm{ACF}_p \)):**
- Complete, \( \kappa \)-categorical for all uncountable \( \kappa \).
- Admits quantifier elimination (definable sets = constructible sets).
- Strongly minimal (algebraic closure provides a well-behaved pregeometry).
- Stable (in fact \( \omega \)-stable).

**Peano Arithmetic (PA):**
- Intended model: \( (\mathbb{N}, 0, S, +, \cdot) \).
- Has many non-isomorphic countable models (non-standard models).
- Incomplete (Gödel) and undecidable.
- Not finitely axiomatizable.

**ZFC:**
- Axiomatizes set theory. Has models of all infinite cardinalities (Löwenheim–Skolem), including countable ones (Skolem's paradox).
- Cannot prove its own consistency (Second Incompleteness Theorem).
- Independent statements: CH, large cardinal axioms, many others.

## 8.3 Proof-Theoretic Ordinals and Gentzen's Consistency Proof

While PA cannot prove \( \mathrm{Con}(\text{PA}) \), Gentzen (1936) gave a **finitistic** proof of PA's consistency using transfinite induction up to the ordinal \( \epsilon_0 = \omega^{\omega^{\omega^{\cdots}}} \) (the least ordinal \( \alpha \) with \( \omega^\alpha = \alpha \)). This shows that the "proof-theoretic ordinal" of PA is \( \epsilon_0 \). The proof-theoretic ordinals of stronger theories are correspondingly larger.

---

# Chapter 9: Selected Worked Problems

## 9.1 Proving Elementary Equivalence

**Problem.** Show that \( (\mathbb{Q}, <) \equiv (\mathbb{Q}+\mathbb{Q}, <) \) where \( \mathbb{Q} + \mathbb{Q} \) denotes two disjoint copies of \( \mathbb{Q} \), ordered so all elements of the first copy precede all elements of the second.

**Solution.** Both structures are dense linear orders without endpoints: \( \mathbb{Q} + \mathbb{Q} \) is a dense linear order (between any two points in the same copy or across copies there are intermediate points) without endpoints. Since \( \mathrm{DLO} \) is complete, all its models are elementarily equivalent. So \( (\mathbb{Q}, <) \equiv (\mathbb{Q}+\mathbb{Q}, <) \). Note they are *not* isomorphic: \( \mathbb{Q} \) has countably many points and is connected in the Dedekind sense, while \( \mathbb{Q}+\mathbb{Q} \) has a "gap". But first-order logic cannot detect such a gap.

## 9.2 Applying Compactness

**Problem.** Let \( \{G_n : n \geq 1\} \) be groups where each \( G_n \) has an element of order exactly \( n \). Show that there is a group \( G \) in which every element has infinite order.

**Solution.** Let \( T_{\mathrm{grp}} \) be the group axioms and for each \( n \geq 2 \), let \( \varphi_n = \forall x\, (x^n \neq e) \) (no element of order dividing \( n \)). Let \( \Phi = T_{\mathrm{grp}} \cup \{\varphi_n : n \geq 2\} \). Given any finite subset \( \Phi_0 \), the largest \( n \) appearing is some \( N \). Take the free abelian group \( \mathbb{Z} \); every nonidentity element has infinite order, so \( \mathbb{Z} \models \Phi_0 \). By compactness, \( \Phi \) is satisfiable. Any model \( G \models \Phi \) has no element of any finite order \( \geq 2 \), and since \( \varphi_1 \) (no element of order 1 except the identity) follows from group axioms, every nonidentity element has infinite order.

## 9.3 Non-Standard Analysis

**Problem.** Using compactness, show the existence of a proper extension \( {}^*\mathbb{R} \) of \( \mathbb{R} \) in the language of ordered fields with a new constant \( c \) satisfying \( c > 0 \) and \( c < \overline{r} \) for every \( r > 0 \) in \( \mathbb{R} \).

**Solution.** Let \( T = \mathrm{Th}(\mathbb{R}) \cup \{c > 0\} \cup \{c < \overline{r} : r \in \mathbb{R}, r > 0\} \). For any finite subset, take \( r_{\min} = \min\{r : c < \overline{r} \in \Phi_0\} > 0 \), and interpret \( c \) as \( r_{\min}/2 \). By compactness, \( T \) has a model \( {}^*\mathbb{R} \). The element \( c^{{}^*\mathbb{R}} \) is an **infinitesimal** — positive but smaller than every positive real. Since \( {}^*\mathbb{R} \models \mathrm{Th}(\mathbb{R}) \), it satisfies all first-order truths about \( \mathbb{R} \) (**Transfer Principle**), providing the foundation for Abraham Robinson's non-standard analysis.

## 9.4 A Fixed Point for the Diagonal Lemma

**Problem.** Exhibit concretely the Gödel sentence for the theory \( T = \mathrm{PA} \).

**Solution.** We outline the construction:

1. Fix a Gödel numbering of PA-formulas. Let \( \mathrm{Prov}(x) \) be the PA-formula representing provability (a \( \Sigma^0_1 \) formula).

2. Consider \( \psi(y) = \lnot \mathrm{Prov}(y) \). Let \( \theta(x) = \lnot \mathrm{Prov}(\mathrm{Sub}(x,x)) \) where \( \mathrm{Sub}(x,x) \) represents the substitution operation on Gödel numbers.

3. Let \( m = \ulcorner \theta(v_0) \urcorner \) (the Gödel number of \( \theta \) with free variable \( v_0 \)).

4. The Gödel sentence is \( G = \theta(\overline{m}) = \lnot \mathrm{Prov}(\overline{\mathrm{sub}(m,m)}) \).

   Since \( \mathrm{sub}(m,m) = \ulcorner G \urcorner \), we have \( G = \lnot \mathrm{Prov}(\ulcorner G \urcorner) \).

5. \( G \) is true in \( \mathbb{N} \): if PA \( \vdash G \), then \( \mathbb{N} \models \mathrm{Prov}(\ulcorner G \urcorner) \), giving \( \mathbb{N} \models \lnot G \), contradiction. So PA \( \not\vdash G \), and this is exactly what \( G \) says.

## 9.5 Uncountable Models of Complete Theories

**Problem.** Show that every complete theory with an infinite model has models of every infinite cardinality.

**Solution.** Let \( T \) be a complete theory with infinite model \( \mathfrak{A} \). Since \( \mathfrak{A} \) is infinite, it has cardinality \( \kappa \geq \aleph_0 \). By the upward Löwenheim–Skolem theorem, for any \( \lambda > \kappa \), \( T \) has a model of cardinality \( \lambda \). (The argument: add \( \lambda \) new constants, the resulting theory is satisfiable by compactness and the infiniteness of \( \mathfrak{A} \).) For \( \aleph_0 \leq \lambda < \kappa \): by the downward Löwenheim–Skolem theorem applied to \( \mathfrak{A} \), there is an elementary substructure of cardinality \( \lambda \) (choose any \( \lambda \) elements as a base set and take its Skolem hull). This elementary substructure also models \( T \).

---

# Appendix A: Background on Orders and Algebra

## A.1 Well-Orderings and Zorn's Lemma

<div class="theorem">
<strong>(Zorn's Lemma)</strong> If \( (P, \leq) \) is a nonempty partially ordered set in which every chain (totally ordered subset) has an upper bound in \( P \), then \( P \) has a maximal element.
</div>

Zorn's Lemma is equivalent to the Axiom of Choice and to the Well-Ordering Theorem: every set can be well-ordered. It is used critically in the proof of the Completeness Theorem (extending consistent sets to maximally consistent sets).

## A.2 Boolean Algebras and Stone Duality

<div class="definition">
A <strong>Boolean algebra</strong> is a set \( B \) with operations \( \land, \lor, \lnot \) and constants \( 0, 1 \) satisfying the usual Boolean laws. A <strong>Stone space</strong> is a compact, totally disconnected Hausdorff topological space.
</div>

<div class="theorem">
<strong>(Stone Representation Theorem)</strong> Every Boolean algebra is isomorphic to the algebra of clopen (closed-and-open) sets of a compact totally disconnected Hausdorff space. Conversely, every such space arises this way.
</div>

**Application.** The Lindenbaum–Tarski algebra of a theory \( T \) (formulas modulo \( T \)-provable equivalence) is a Boolean algebra. The corresponding Stone space is the type space \( S_0(T) \) — the space of complete types (= complete theories extending \( T \)). A type is isolated iff the corresponding point is isolated in the Stone space. The Omitting Types Theorem says that non-isolated types need not be realized in the prime model.

## A.3 Ramsey Theory and 0-1 Laws

<div class="theorem">
<strong>(Fagin's 0-1 Law, 1976)</strong> For any first-order sentence \( \varphi \) in the language of graphs, as \( n \to \infty \):
\[ \Pr[\text{random graph on } n \text{ vertices satisfies } \varphi] \to 0 \text{ or } 1. \]
Moreover, the sentences with limiting probability 1 form a complete theory — the theory of the random (Rado) graph.
</div>

This connects model theory with combinatorics and probability: the Fraïssé limit of the class of all finite graphs (the Rado graph) is the almost-sure limit of the random graph model.

---

# Appendix B: Quick Reference

## B.1 Key Definitions at a Glance

| Term | Definition |
|---|---|
| \( \sigma \)-structure | Universe + interpretations of all symbols |
| \( \mathfrak{A} \models \varphi \) | \( \varphi \) is true in \( \mathfrak{A} \) (for sentences) |
| \( T \models \varphi \) | \( \varphi \) is true in all models of \( T \) |
| \( T \vdash \varphi \) | \( \varphi \) is derivable from \( T \) |
| Consistent | \( T \not\vdash \bot \) |
| Complete (theory) | For all \( \varphi \): \( T \vdash \varphi \) or \( T \vdash \lnot\varphi \) |
| Elementary substructure | \( \mathfrak{A} \preccurlyeq \mathfrak{B} \): same truth for all formulas |
| Compactness | \( T \) satisfiable iff every finite subset satisfiable |
| \( \kappa \)-categorical | Unique model of size \( \kappa \) (up to isomorphism) |
| Type \( p(\vec{x}) \) | Maximal consistent set of formulas over a base |
| Ordinal | Transitive set well-ordered by \( \in \) |
| Cardinal | Ordinal not in bijection with any smaller ordinal |

## B.2 Standard Theories and Their Properties

| Theory | Language | Complete? | Cat.? | QE? | Stable? |
|---|---|---|---|---|---|
| DLO | \( < \) | Yes | \( \aleph_0 \) only | Yes | No (unstable) |
| ACF\(_0\) | \( +,\cdot,0,1 \) | Yes | All uncountable | Yes | Yes (\( \omega \)-stable) |
| ACF\(_p\) | \( +,\cdot,0,1 \) | Yes | All uncountable | Yes | Yes (\( \omega \)-stable) |
| RCF | \( +,\cdot,0,1,< \) | Yes | No (many sizes) | Yes | No |
| PA | \( 0,S,+,\cdot \) | No | No | No | N/A |
| ZFC | \( \in \) | No | No | No | N/A |

## B.3 The Gödel Sentences — Summary

Let \( T \) be a consistent recursively axiomatizable extension of \( Q \).

- **\( G_T \)**: the Gödel sentence, with \( T \vdash G_T \leftrightarrow \lnot \mathrm{Prov}_T(\ulcorner G_T \urcorner) \).
  - \( T \not\vdash G_T \) and \( T \not\vdash \lnot G_T \) (First Incompleteness).
  - \( \mathbb{N} \models G_T \) (the standard model sees \( G_T \) as true).

- **\( \mathrm{Con}(T) = \lnot \mathrm{Prov}_T(\ulcorner \bot \urcorner) \)**: consistency statement.
  - \( T \not\vdash \mathrm{Con}(T) \) (Second Incompleteness).
  - \( T + \mathrm{Con}(T) \) is a strictly stronger consistent theory.

- **Relationship**: \( T \vdash G_T \leftrightarrow \mathrm{Con}(T) \) (the Gödel sentence is equivalent to consistency over \( T \), essentially).
