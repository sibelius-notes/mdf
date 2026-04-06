---
title: "PHIL 240: Introduction to Formal Logic"
prof: "Ashar Khan"
subjects: "PHIL"
---

## Sources and References

- Bergman, M., Moor, J., & Nelson, J. (2014). *The Logic Book* (6th ed.). McGraw-Hill.
- Magnus, P.D. *forall x: An Introduction to Formal Logic* (Open Access).
- The Open Logic Project. *Open Logic Text* (Open Access).
- Stanford Encyclopedia of Philosophy: "Classical Logic," "Propositional Logic," "First-Order Logic," "Completeness."
- Enderton, H.B. (2001). *A Mathematical Introduction to Logic* (2nd ed.). Academic Press.
- Hurley, P.J. (2015). *A Concise Introduction to Logic* (12th ed.). Cengage Learning.

---

# Chapter 1: What Is Logic? Arguments, Validity, and Soundness

## 1.1 The Subject Matter of Logic

Logic is the systematic study of correct reasoning. More precisely, formal logic investigates the principles that distinguish good inferences from bad ones --- not by examining whether our premises happen to be true, but by examining whether our conclusions follow from our premises.

As the course description emphasizes, bad thinking comes in two flavours: relying on bad information and making bad inferences. Logic, in the strict sense, is concerned exclusively with the second kind. A logician asks: *given* that the premises are true, *must* the conclusion also be true?

### 1.1.1 Logic as a Tool and as a Science

Aristotle, in his *Organon*, distinguished two reasons to study logic. First, logic serves as a **tool** (工具) for evaluating the reasoning of others and improving one's own. Second, logic can be regarded as a **science** (科学) in its own right --- the science of correct inference. This course takes the second perspective as primary: the formal systems we study are *theories* about correct inference, and we can ask about them the same questions we ask about any theory.

## 1.2 Arguments

<div class="definition">
<strong>Argument</strong> (论证): An argument is a finite collection of statements, one of which is designated as the <strong>conclusion</strong> (结论) and the rest of which are designated as <strong>premises</strong> (前提). The premises are intended to provide support for the conclusion.
</div>

An argument can be represented schematically as:

\[
P_1, P_2, \ldots, P_n \therefore C
\]

where \( P_1, P_2, \ldots, P_n \) are the premises and \( C \) is the conclusion. The symbol \( \therefore \) is read "therefore."

<div class="example">
<strong>Example 1.1.</strong> Consider the following argument:
<br><br>
Premise 1: All philosophers are mortal.<br>
Premise 2: Socrates is a philosopher.<br>
Conclusion: Therefore, Socrates is mortal.
<br><br>
This is a <strong>deductive</strong> argument: if the premises are true, the conclusion <em>must</em> be true.
</div>

### 1.2.1 Statements and Non-Statements

A **statement** (陈述) (also called a **proposition** (命题)) is a declarative sentence that is either true or false, but not both. Questions, commands, and exclamations are not statements.

<div class="example">
<strong>Example 1.2.</strong>
<br>
Statement: "Ottawa is the capital of Canada." (True)<br>
Statement: "The moon is made of cheese." (False)<br>
Not a statement: "Close the door!" (Command)<br>
Not a statement: "Is it raining?" (Question)
</div>

## 1.3 Deductive vs. Inductive Arguments

A **deductive argument** (演绎论证) is one in which the premises are intended to guarantee the truth of the conclusion. An **inductive argument** (归纳论证) is one in which the premises are intended to make the conclusion probable but not certain. Formal logic, as studied in this course, deals exclusively with deductive arguments.

## 1.4 Validity

<div class="definition">
<strong>Validity</strong> (有效性): An argument is <strong>valid</strong> (有效的) if and only if it is impossible for all the premises to be true and the conclusion to be false simultaneously. Equivalently, an argument is valid if and only if every situation in which all the premises are true is a situation in which the conclusion is also true.
</div>

Several crucial observations about validity:

1. Validity is a property of the *form* of an argument, not its content.
2. A valid argument can have false premises and a false conclusion.
3. A valid argument can have false premises and a true conclusion.
4. A valid argument *cannot* have all true premises and a false conclusion.

<div class="example">
<strong>Example 1.3.</strong> The following argument is valid, even though both premises are false:
<br><br>
Premise 1: All fish are mammals.<br>
Premise 2: All mammals can fly.<br>
Conclusion: Therefore, all fish can fly.
<br><br>
The argument is valid because <em>if</em> the premises were true, the conclusion would have to be true.
</div>

### 1.4.1 Invalidity

An argument is **invalid** (无效的) if it is possible for all premises to be true while the conclusion is false. To show invalidity, one need only produce a single **counterexample** (反例): a scenario in which all premises are true and the conclusion is false.

## 1.5 Soundness

<div class="definition">
<strong>Soundness</strong> (可靠性): An argument is <strong>sound</strong> (可靠的) if and only if (i) it is valid, and (ii) all its premises are actually true.
</div>

Soundness is the gold standard for deductive arguments. A sound argument guarantees the truth of its conclusion. Note that soundness requires both validity *and* true premises; validity alone is not sufficient.

## 1.6 Other Logical Concepts

### 1.6.1 Logical Truth and Logical Falsehood

A **logical truth** (逻辑真理) (or **tautology** (重言式)) is a statement that is true in every possible situation, regardless of the truth values of its components. A **logical falsehood** (逻辑谬误) (or **contradiction** (矛盾式)) is a statement that is false in every possible situation.

### 1.6.2 Logical Equivalence

Two statements are **logically equivalent** (逻辑等价的) if and only if they have the same truth value in every possible situation.

### 1.6.3 Consistency

A set of statements is **consistent** (一致的) if and only if it is possible for all statements in the set to be true simultaneously. A set is **inconsistent** (不一致的) if it is impossible for all statements to be true at the same time.

<div class="theorem">
<strong>Theorem 1.1 (Relationship Between Validity and Consistency).</strong> An argument with premises \( P_1, \ldots, P_n \) and conclusion \( C \) is valid if and only if the set \( \{P_1, \ldots, P_n, \neg C\} \) is inconsistent.
</div>

This theorem is foundational: it connects the notion of valid inference to the notion of consistency, and it underlies the method of truth trees (Chapter 4).

## 1.7 Logical Form

The central insight of formal logic is that validity depends on **logical form** (逻辑形式), not on the specific subject matter. Consider:

\[
\text{All } A \text{ are } B. \quad \text{All } B \text{ are } C. \quad \therefore \text{All } A \text{ are } C.
\]

Any argument with this form is valid, regardless of what \( A \), \( B \), and \( C \) stand for. Formal logic provides precise languages for representing logical form and precise methods for evaluating arguments based on their form.

---

# Chapter 2: Propositional Logic --- Symbolization

## 2.1 The Language of Propositional Logic

**Propositional logic** (命题逻辑) (also called **sentential logic** (语句逻辑) or **truth-functional logic** (真值函数逻辑)) is the logic of compound statements built from simpler statements using logical connectives. It is the first of the two main logical systems studied in this course.

### 2.1.1 Atomic and Compound Statements

An **atomic statement** (原子命题) is a statement that contains no logical connectives. A **compound statement** (复合命题) is built from atomic statements using one or more logical connectives.

### 2.1.2 Statement Letters

In propositional logic, we represent atomic statements using uppercase **statement letters** (命题字母): \( A, B, C, \ldots, P, Q, R, \ldots \) (with subscripts if needed: \( P_1, P_2, \ldots \)).

## 2.2 Logical Connectives

The five standard logical connectives of propositional logic are:

| Symbol | Name | English Equivalent | Read As |
|:---:|:---|:---|:---|
| \( \neg \) | Negation (否定) | not | "it is not the case that" |
| \( \wedge \) | Conjunction (合取) | and | "and" |
| \( \vee \) | Disjunction (析取) | or | "or" |
| \( \rightarrow \) | Conditional (条件) | if...then | "if...then" |
| \( \leftrightarrow \) | Biconditional (双条件) | if and only if | "if and only if" |

### 2.2.1 Negation

The **negation** of a statement \( P \), written \( \neg P \), is true when \( P \) is false, and false when \( P \) is true. English cue words include: "not," "it is not the case that," "it is false that."

| \( P \) | \( \neg P \) |
|:---:|:---:|
| T | F |
| F | T |

### 2.2.2 Conjunction

The **conjunction** of \( P \) and \( Q \), written \( P \wedge Q \), is true only when both \( P \) and \( Q \) are true. English cue words: "and," "but," "yet," "although," "however," "moreover," "both...and."

| \( P \) | \( Q \) | \( P \wedge Q \) |
|:---:|:---:|:---:|
| T | T | T |
| T | F | F |
| F | T | F |
| F | F | F |

### 2.2.3 Disjunction

The **disjunction** of \( P \) and \( Q \), written \( P \vee Q \), is true when at least one of \( P \) or \( Q \) is true. This is the **inclusive or** (包含析取): both can be true. English cue words: "or," "either...or," "unless."

| \( P \) | \( Q \) | \( P \vee Q \) |
|:---:|:---:|:---:|
| T | T | T |
| T | F | T |
| F | T | T |
| F | F | F |

Note: English "or" is sometimes used exclusively (meaning "one or the other but not both"). In logic, the default interpretation of \( \vee \) is inclusive.

### 2.2.4 The Conditional (Material Conditional)

The **conditional** \( P \rightarrow Q \) is false only when the **antecedent** (前件) \( P \) is true and the **consequent** (后件) \( Q \) is false. In all other cases, \( P \rightarrow Q \) is true.

| \( P \) | \( Q \) | \( P \rightarrow Q \) |
|:---:|:---:|:---:|
| T | T | T |
| T | F | F |
| F | T | T |
| F | F | T |

The material conditional is one of the most discussed connectives in logic. When \( P \) is false, \( P \rightarrow Q \) is **vacuously true** (空真的), regardless of \( Q \). This is a simplifying assumption of classical logic that sometimes diverges from everyday usage of "if...then."

Common English expressions for the conditional:
- "If \( P \), then \( Q \)"
- "\( P \) only if \( Q \)"
- "\( Q \) if \( P \)"
- "\( P \) is sufficient for \( Q \)"
- "\( Q \) is necessary for \( P \)"
- "Provided that \( P \), \( Q \)"

<div class="example">
<strong>Example 2.1 (Tricky Conditional Translations).</strong>
<br><br>
"You will pass only if you study" translates to \( P \rightarrow S \), <em>not</em> \( S \rightarrow P \).
<br><br>
"Only if" introduces the <em>consequent</em>, whereas "if" introduces the <em>antecedent</em>.
<br><br>
"You will pass if you study" translates to \( S \rightarrow P \).
</div>

### 2.2.5 The Biconditional

The **biconditional** \( P \leftrightarrow Q \) is true when \( P \) and \( Q \) have the same truth value (both true or both false).

| \( P \) | \( Q \) | \( P \leftrightarrow Q \) |
|:---:|:---:|:---:|
| T | T | T |
| T | F | F |
| F | T | F |
| F | F | T |

English cue words: "if and only if," "just in case," "exactly when," "is necessary and sufficient for."

## 2.3 Well-Formed Formulas

<div class="definition">
<strong>Well-Formed Formula (WFF)</strong> (合式公式): The set of well-formed formulas of propositional logic is defined recursively:
<br><br>
1. Every statement letter is a WFF.<br>
2. If \( \phi \) is a WFF, then \( \neg \phi \) is a WFF.<br>
3. If \( \phi \) and \( \psi \) are WFFs, then \( (\phi \wedge \psi) \), \( (\phi \vee \psi) \), \( (\phi \rightarrow \psi) \), and \( (\phi \leftrightarrow \psi) \) are WFFs.<br>
4. Nothing else is a WFF.
</div>

### 2.3.1 Operator Precedence

To reduce the number of parentheses, we adopt the following precedence convention (from highest to lowest binding strength):

1. \( \neg \) (negation) --- binds most tightly
2. \( \wedge \) (conjunction)
3. \( \vee \) (disjunction)
4. \( \rightarrow \) (conditional)
5. \( \leftrightarrow \) (biconditional) --- binds most loosely

So \( \neg P \wedge Q \rightarrow R \) is parsed as \( ((\neg P) \wedge Q) \rightarrow R \).

## 2.4 Symbolization Practice

<div class="example">
<strong>Example 2.2 (Symbolization).</strong> Let:
<br>
\( P \) = "It is raining"<br>
\( Q \) = "The ground is wet"<br>
\( R \) = "We will go outside"
<br><br>
(a) "If it is raining and the ground is wet, then we will not go outside."<br>
\( (P \wedge Q) \rightarrow \neg R \)
<br><br>
(b) "Either it is not raining or the ground is wet, but we will go outside."<br>
\( (\neg P \vee Q) \wedge R \)
<br><br>
(c) "We will go outside if and only if it is not raining."<br>
\( R \leftrightarrow \neg P \)
<br><br>
(d) "It is raining only if the ground is wet."<br>
\( P \rightarrow Q \)
</div>

## 2.5 Common Symbolization Pitfalls

1. **"Unless"**: "\( P \) unless \( Q \)" translates to \( \neg Q \rightarrow P \), equivalently \( P \vee Q \).
2. **"Only if"**: "\( P \) only if \( Q \)" translates to \( P \rightarrow Q \), not \( Q \rightarrow P \).
3. **"Neither...nor"**: "Neither \( P \) nor \( Q \)" translates to \( \neg P \wedge \neg Q \), equivalently \( \neg(P \vee Q) \).
4. **Scope of negation**: "It is not the case that both \( P \) and \( Q \)" is \( \neg(P \wedge Q) \), which differs from "Not \( P \) and not \( Q \)" which is \( \neg P \wedge \neg Q \).

---

# Chapter 3: Truth Tables --- Evaluation and Properties

## 3.1 Truth-Functional Semantics

In propositional logic, the truth value of a compound statement is entirely determined by the truth values of its atomic components and the connectives used to combine them. This is the principle of **truth-functionality** (真值函数性).

<div class="definition">
<strong>Truth-Value Assignment (TVA)</strong> (真值赋值): A truth-value assignment is a function that assigns a truth value (T or F) to each statement letter in a formula. If a formula contains \( n \) distinct statement letters, there are \( 2^n \) possible truth-value assignments.
</div>

## 3.2 Constructing Truth Tables

A **truth table** (真值表) systematically lists all possible truth-value assignments and computes the resulting truth value of the compound formula under each assignment.

<div class="example">
<strong>Example 3.1.</strong> Construct a truth table for \( (P \rightarrow Q) \wedge (\neg Q \rightarrow \neg P) \).
<br><br>

| \( P \) | \( Q \) | \( \neg Q \) | \( \neg P \) | \( P \rightarrow Q \) | \( \neg Q \rightarrow \neg P \) | \( (P \rightarrow Q) \wedge (\neg Q \rightarrow \neg P) \) |
|:---:|:---:|:---:|:---:|:---:|:---:|:---:|
| T | T | F | F | T | T | T |
| T | F | T | F | F | F | F |
| F | T | F | T | T | T | T |
| F | F | T | T | T | T | T |

The formula \( P \rightarrow Q \) and its contrapositive \( \neg Q \rightarrow \neg P \) always have the same truth value, so their conjunction is logically equivalent to either one alone.
</div>

## 3.3 Classifying Formulas

Using truth tables, we can classify formulas into three categories:

<div class="definition">
<strong>Tautology</strong> (重言式): A formula is a tautology if it is true under <em>every</em> truth-value assignment.<br><br>
<strong>Contradiction</strong> (矛盾式): A formula is a contradiction if it is false under <em>every</em> truth-value assignment.<br><br>
<strong>Contingency</strong> (偶然式): A formula is a contingency if it is true under some truth-value assignments and false under others.
</div>

<div class="example">
<strong>Example 3.2.</strong>
<br>
Tautology: \( P \vee \neg P \) (Law of Excluded Middle)<br>
Contradiction: \( P \wedge \neg P \)<br>
Contingency: \( P \rightarrow Q \)
</div>

## 3.4 Testing for Validity with Truth Tables

<div class="theorem">
<strong>Theorem 3.1 (Truth-Table Test for Validity).</strong> An argument with premises \( P_1, \ldots, P_n \) and conclusion \( C \) is <strong>truth-functionally valid</strong> (真值函数有效的) if and only if there is no truth-value assignment under which all premises are true and the conclusion is false.
</div>

Equivalently, an argument is valid if and only if the conditional \( (P_1 \wedge P_2 \wedge \cdots \wedge P_n) \rightarrow C \) is a tautology.

<div class="example">
<strong>Example 3.3 (Modus Ponens).</strong> Test the validity of:
<br>
Premise 1: \( P \rightarrow Q \)<br>
Premise 2: \( P \)<br>
Conclusion: \( Q \)

| \( P \) | \( Q \) | \( P \rightarrow Q \) | Premises both T? | Conclusion |
|:---:|:---:|:---:|:---:|:---:|
| T | T | T | Yes | T |
| T | F | F | No | --- |
| F | T | T | No | --- |
| F | F | T | No | --- |

The only row where both premises are true (row 1), the conclusion is also true. Therefore the argument is <strong>valid</strong>.
</div>

## 3.5 Testing for Other Properties

### 3.5.1 Logical Equivalence

Two formulas \( \phi \) and \( \psi \) are **truth-functionally equivalent** if they have the same truth value under every truth-value assignment. Equivalently, \( \phi \leftrightarrow \psi \) is a tautology.

### 3.5.2 Consistency

A set of formulas \( \{\phi_1, \ldots, \phi_n\} \) is **truth-functionally consistent** if there is at least one truth-value assignment under which all formulas in the set are true.

## 3.6 Important Logical Equivalences

The following equivalences are fundamental and can all be verified by truth tables:

| Name | Equivalence |
|:---|:---|
| Double Negation | \( \neg\neg P \Leftrightarrow P \) |
| De Morgan's Laws | \( \neg(P \wedge Q) \Leftrightarrow \neg P \vee \neg Q \) |
| | \( \neg(P \vee Q) \Leftrightarrow \neg P \wedge \neg Q \) |
| Commutativity | \( P \wedge Q \Leftrightarrow Q \wedge P \) |
| | \( P \vee Q \Leftrightarrow Q \vee P \) |
| Associativity | \( (P \wedge Q) \wedge R \Leftrightarrow P \wedge (Q \wedge R) \) |
| | \( (P \vee Q) \vee R \Leftrightarrow P \vee (Q \vee R) \) |
| Distribution | \( P \wedge (Q \vee R) \Leftrightarrow (P \wedge Q) \vee (P \wedge R) \) |
| | \( P \vee (Q \wedge R) \Leftrightarrow (P \vee Q) \wedge (P \vee R) \) |
| Material Conditional | \( P \rightarrow Q \Leftrightarrow \neg P \vee Q \) |
| Contraposition | \( P \rightarrow Q \Leftrightarrow \neg Q \rightarrow \neg P \) |
| Biconditional | \( P \leftrightarrow Q \Leftrightarrow (P \rightarrow Q) \wedge (Q \rightarrow P) \) |
| Idempotence | \( P \wedge P \Leftrightarrow P \) |
| | \( P \vee P \Leftrightarrow P \) |
| Absorption | \( P \wedge (P \vee Q) \Leftrightarrow P \) |
| | \( P \vee (P \wedge Q) \Leftrightarrow P \) |

## 3.7 Limitations of Truth Tables

Truth tables provide a decision procedure for propositional logic: they always give a definitive answer about validity, equivalence, consistency, etc. However, for a formula with \( n \) statement letters, the truth table has \( 2^n \) rows, which grows exponentially. For large \( n \), truth tables become impractical, motivating more efficient methods like truth trees.

---

# Chapter 4: Truth Trees for Propositional Logic

## 4.1 The Idea Behind Truth Trees

**Truth trees** (真值树) (also called **semantic tableaux** (语义表)) provide an alternative to truth tables for testing logical properties. The key idea is based on the relationship between validity and consistency (Theorem 1.1): to test whether an argument is valid, we assume the premises are true and the conclusion is false, then check whether this assumption leads to a contradiction.

A truth tree is a systematic search for a truth-value assignment that makes a given set of formulas all true. If no such assignment exists, the set is inconsistent.

## 4.2 Tree Rules for Propositional Logic

Truth trees work by decomposing complex formulas into simpler ones according to fixed rules. There are two types of rules: **non-branching rules** (which extend a single path) and **branching rules** (which split a path into two).

### 4.2.1 Non-Branching Rules

<div class="definition">
<strong>Double Negation (\( \neg\neg \)):</strong> From \( \neg\neg\phi \), write \( \phi \) below on the same branch. Check off \( \neg\neg\phi \).
</div>

<div class="definition">
<strong>Conjunction (\( \wedge \)):</strong> From \( \phi \wedge \psi \), write both \( \phi \) and \( \psi \) below on the same branch (one beneath the other). Check off \( \phi \wedge \psi \).
</div>

<div class="definition">
<strong>Negated Disjunction (\( \neg\vee \)):</strong> From \( \neg(\phi \vee \psi) \), write \( \neg\phi \) and \( \neg\psi \) below on the same branch. Check off \( \neg(\phi \vee \psi) \).
</div>

<div class="definition">
<strong>Negated Conditional (\( \neg\rightarrow \)):</strong> From \( \neg(\phi \rightarrow \psi) \), write \( \phi \) and \( \neg\psi \) below on the same branch. Check off \( \neg(\phi \rightarrow \psi) \).
</div>

### 4.2.2 Branching Rules

<div class="definition">
<strong>Disjunction (\( \vee \)):</strong> From \( \phi \vee \psi \), split the branch into two: write \( \phi \) on the left branch and \( \psi \) on the right branch. Check off \( \phi \vee \psi \).
</div>

<div class="definition">
<strong>Negated Conjunction (\( \neg\wedge \)):</strong> From \( \neg(\phi \wedge \psi) \), split into two branches: \( \neg\phi \) on the left and \( \neg\psi \) on the right. Check off \( \neg(\phi \wedge \psi) \).
</div>

<div class="definition">
<strong>Conditional (\( \rightarrow \)):</strong> From \( \phi \rightarrow \psi \), split into two branches: \( \neg\phi \) on the left and \( \psi \) on the right. Check off \( \phi \rightarrow \psi \).
</div>

### 4.2.3 Biconditional Rules

<div class="definition">
<strong>Biconditional (\( \leftrightarrow \)):</strong> From \( \phi \leftrightarrow \psi \), split into two branches: the left branch gets both \( \phi \) and \( \psi \); the right branch gets both \( \neg\phi \) and \( \neg\psi \). Check off \( \phi \leftrightarrow \psi \).
</div>

<div class="definition">
<strong>Negated Biconditional (\( \neg\leftrightarrow \)):</strong> From \( \neg(\phi \leftrightarrow \psi) \), split into two branches: the left branch gets \( \phi \) and \( \neg\psi \); the right branch gets \( \neg\phi \) and \( \psi \). Check off \( \neg(\phi \leftrightarrow \psi) \).
</div>

## 4.3 Closing and Completing Branches

<div class="definition">
<strong>Closed Branch</strong> (封闭支): A branch is <strong>closed</strong> if it contains both a formula \( \phi \) and its negation \( \neg\phi \). A closed branch is marked with \( \times \).
<br><br>
<strong>Open Branch</strong> (开放支): A branch is <strong>open</strong> if it is not closed and every non-atomic formula on it has been decomposed (checked off).
<br><br>
<strong>Closed Tree</strong>: A tree is closed if <em>every</em> branch is closed.<br>
<strong>Open Tree</strong>: A tree is open if at least one branch remains open after all formulas have been decomposed.
</div>

## 4.4 Using Trees to Test Logical Properties

### 4.4.1 Testing Validity

To test whether an argument with premises \( P_1, \ldots, P_n \) and conclusion \( C \) is valid:

1. Write \( P_1, \ldots, P_n \) and \( \neg C \) at the top of the tree (the trunk).
2. Apply tree rules until every branch is either closed or fully decomposed.
3. If the tree closes, the argument is **valid**.
4. If the tree has an open branch, the argument is **invalid**, and the open branch provides a counterexample.

<div class="example">
<strong>Example 4.1 (Modus Tollens by Truth Tree).</strong> Test the validity of:
<br>
Premises: \( P \rightarrow Q \), \( \neg Q \)<br>
Conclusion: \( \neg P \)
<br><br>
Tree trunk:<br>
1. \( P \rightarrow Q \)<br>
2. \( \neg Q \)<br>
3. \( \neg\neg P \) (negation of conclusion \( \neg P \))<br>
<br>
Apply double negation to line 3:<br>
4. \( P \)<br>
<br>
Apply conditional rule to line 1 (branch):<br>
Left branch: \( \neg P \) --- closes with line 4 (\( P \) and \( \neg P \)) \( \times \)<br>
Right branch: \( Q \) --- closes with line 2 (\( Q \) and \( \neg Q \)) \( \times \)<br>
<br>
All branches close. The argument is <strong>valid</strong>.
</div>

### 4.4.2 Testing for Tautology

To test whether \( \phi \) is a tautology, construct a tree with \( \neg\phi \) as the sole entry. If the tree closes, \( \phi \) is a tautology.

### 4.4.3 Testing for Consistency

To test whether a set \( \{\phi_1, \ldots, \phi_n\} \) is consistent, place all formulas at the trunk. If the tree has an open branch, the set is consistent; if all branches close, it is inconsistent.

### 4.4.4 Testing for Logical Equivalence

To test whether \( \phi \) and \( \psi \) are logically equivalent, construct a tree for \( \neg(\phi \leftrightarrow \psi) \). If the tree closes, they are equivalent.

## 4.5 Reading Counterexamples from Open Branches

When a tree has an open, completed branch, the literals on that branch specify a truth-value assignment: if \( P \) appears on the branch, assign \( P = T \); if \( \neg P \) appears, assign \( P = F \). This assignment makes all the original formulas true, serving as a counterexample to validity (or as a witness to consistency).

## 4.6 Advantages of Truth Trees

- Truth trees are typically much more efficient than truth tables for formulas with many statement letters.
- Trees provide counterexamples "for free" via open branches.
- The method generalizes naturally to predicate logic (Chapter 10), unlike truth tables.

---

# Chapter 5: Natural Deduction --- Derivation Systems

## 5.1 What Is Natural Deduction?

**Natural deduction** (自然演绎) is a proof system in which one derives a conclusion from premises by applying inference rules, each of which corresponds to a natural pattern of reasoning. Unlike truth tables or truth trees, which are *semantic* methods (based on truth values), natural deduction is a *syntactic* method (based on formal manipulation of formulas).

A **derivation** (推导) (or **proof** (证明)) is a sequence of formulas, each of which is either a premise, an assumption, or follows from earlier formulas by an inference rule. The last formula in the derivation is the conclusion.

## 5.2 Basic Inference Rules

The system of derivations in *The Logic Book* includes the following basic rules. Each rule has an introduction form and an elimination form for the principal connective.

### 5.2.1 Conjunction Rules

<div class="definition">
<strong>Conjunction Introduction (\( \wedge \)I):</strong> From \( \phi \) and \( \psi \) (on separate lines), derive \( \phi \wedge \psi \).

\[
\frac{\phi \qquad \psi}{\phi \wedge \psi} \quad (\wedge\text{I})
\]

<strong>Conjunction Elimination (\( \wedge \)E):</strong> From \( \phi \wedge \psi \), derive \( \phi \) (or \( \psi \)).

\[
\frac{\phi \wedge \psi}{\phi} \quad (\wedge\text{E}) \qquad \frac{\phi \wedge \psi}{\psi} \quad (\wedge\text{E})
\]
</div>

### 5.2.2 Disjunction Rules

<div class="definition">
<strong>Disjunction Introduction (\( \vee \)I):</strong> From \( \phi \), derive \( \phi \vee \psi \) (for any \( \psi \)).

\[
\frac{\phi}{\phi \vee \psi} \quad (\vee\text{I}) \qquad \frac{\psi}{\phi \vee \psi} \quad (\vee\text{I})
\]

<strong>Disjunction Elimination (\( \vee \)E):</strong> From \( \phi \vee \psi \), together with a subderivation of \( \chi \) from the assumption \( \phi \) and a subderivation of \( \chi \) from the assumption \( \psi \), derive \( \chi \).
</div>

### 5.2.3 Conditional Rules

<div class="definition">
<strong>Conditional Introduction (\( \rightarrow \)I):</strong> If, by assuming \( \phi \), one can derive \( \psi \), then discharge the assumption and derive \( \phi \rightarrow \psi \).

\[
\frac{\begin{bmatrix}\phi\end{bmatrix} \quad \vdots \quad \psi}{\phi \rightarrow \psi} \quad (\rightarrow\text{I})
\]

The brackets indicate that the assumption \( \phi \) is <strong>discharged</strong> (撤回): it no longer counts as an active assumption.
<br><br>
<strong>Conditional Elimination (\( \rightarrow \)E), a.k.a. Modus Ponens (MP):</strong> From \( \phi \rightarrow \psi \) and \( \phi \), derive \( \psi \).

\[
\frac{\phi \rightarrow \psi \qquad \phi}{\psi} \quad (\rightarrow\text{E / MP})
\]
</div>

### 5.2.4 Negation Rules

<div class="definition">
<strong>Negation Introduction (\( \neg \)I):</strong> If, by assuming \( \phi \), one can derive a contradiction (both \( \psi \) and \( \neg\psi \) for some \( \psi \)), then discharge the assumption and derive \( \neg\phi \).

\[
\frac{\begin{bmatrix}\phi\end{bmatrix} \quad \vdots \quad \psi \quad \neg\psi}{\neg\phi} \quad (\neg\text{I})
\]

<strong>Negation Elimination (\( \neg \)E), a.k.a. Double Negation Elimination:</strong> From \( \neg\neg\phi \), derive \( \phi \).

\[
\frac{\neg\neg\phi}{\phi} \quad (\neg\text{E})
\]
</div>

### 5.2.5 Biconditional Rules

<div class="definition">
<strong>Biconditional Introduction (\( \leftrightarrow \)I):</strong> From a subderivation of \( \psi \) from assumption \( \phi \), and a subderivation of \( \phi \) from assumption \( \psi \), derive \( \phi \leftrightarrow \psi \).
<br><br>
<strong>Biconditional Elimination (\( \leftrightarrow \)E):</strong> From \( \phi \leftrightarrow \psi \) and \( \phi \), derive \( \psi \). Or from \( \phi \leftrightarrow \psi \) and \( \psi \), derive \( \phi \).
</div>

## 5.3 Indirect Derivation (Reductio ad Absurdum)

<div class="definition">
<strong>Indirect Derivation (ID)</strong> (间接推导 / 归谬法): To derive \( \phi \), assume \( \neg\phi \) and derive a contradiction (some \( \psi \) and \( \neg\psi \)). Then discharge the assumption and conclude \( \phi \).
</div>

This is essentially the classical principle that if assuming the negation of a statement leads to contradiction, the statement must be true.

## 5.4 Subderivations

A **subderivation** (子推导) is a derivation nested within another derivation. Subderivations begin with an assumption and are enclosed within a scope indicator (typically a vertical line or box). The key rules governing subderivations are:

1. Every line within a subderivation is available to subsequent lines within the same subderivation or any subderivation nested within it.
2. Lines within a subderivation are *not* available outside it once the subderivation is closed.
3. Assumptions that begin subderivations are discharged when the subderivation closes.

## 5.5 Derived Rules and Strategies

Beyond the basic rules, several commonly used argument patterns can be treated as derived rules for convenience:

| Rule | Pattern | Abbreviation |
|:---|:---|:---|
| Modus Tollens | \( \phi \rightarrow \psi, \neg\psi \therefore \neg\phi \) | MT |
| Hypothetical Syllogism | \( \phi \rightarrow \psi, \psi \rightarrow \chi \therefore \phi \rightarrow \chi \) | HS |
| Disjunctive Syllogism | \( \phi \vee \psi, \neg\phi \therefore \psi \) | DS |
| Constructive Dilemma | \( \phi \vee \psi, \phi \rightarrow \chi, \psi \rightarrow \omega \therefore \chi \vee \omega \) | CD |

## 5.6 Derivation Strategies

When constructing derivations, the following strategies are helpful:

1. **Work backward from the conclusion.** Ask: "What rule could produce this conclusion?" Then determine what you need to apply that rule.
2. **Conditional conclusions**: If the conclusion is \( \phi \rightarrow \psi \), open a subderivation assuming \( \phi \) and try to derive \( \psi \), then apply \( \rightarrow \)I.
3. **Negation conclusions**: If the conclusion is \( \neg\phi \), open a subderivation assuming \( \phi \) and derive a contradiction, then apply \( \neg \)I.
4. **Disjunction premises**: If you have \( \phi \vee \psi \) as a premise, plan to use \( \vee \)E (proof by cases).
5. **When stuck**: Try indirect derivation.

<div class="example">
<strong>Example 5.1 (A Complete Derivation).</strong> Derive \( R \) from the premises \( P \rightarrow (Q \rightarrow R) \), \( P \), and \( Q \).

| Line | Formula | Justification |
|:---:|:---|:---|
| 1 | \( P \rightarrow (Q \rightarrow R) \) | Premise |
| 2 | \( P \) | Premise |
| 3 | \( Q \) | Premise |
| 4 | \( Q \rightarrow R \) | 1, 2, \( \rightarrow \)E |
| 5 | \( R \) | 4, 3, \( \rightarrow \)E |
</div>

<div class="example">
<strong>Example 5.2 (Derivation with Subderivation).</strong> Derive \( P \rightarrow R \) from \( P \rightarrow Q \) and \( Q \rightarrow R \).

| Line | Formula | Justification |
|:---:|:---|:---|
| 1 | \( P \rightarrow Q \) | Premise |
| 2 | \( Q \rightarrow R \) | Premise |
| 3 | \( \quad P \) | Assumption (for \( \rightarrow \)I) |
| 4 | \( \quad Q \) | 1, 3, \( \rightarrow \)E |
| 5 | \( \quad R \) | 2, 4, \( \rightarrow \)E |
| 6 | \( P \rightarrow R \) | 3--5, \( \rightarrow \)I |
</div>

---

# Chapter 6: Metatheory of Propositional Logic

## 6.1 Expressive Completeness

<div class="definition">
<strong>Expressive Completeness</strong> (表达完备性): A set of connectives is <strong>expressively complete</strong> (also called <strong>functionally complete</strong> (功能完备的)) if every possible truth function can be expressed using only the connectives in that set.
</div>

A truth function on \( n \) variables is any function from \( \{T, F\}^n \) to \( \{T, F\} \). For \( n \) variables, there are \( 2^{2^n} \) possible truth functions.

<div class="theorem">
<strong>Theorem 6.1 (Expressive Completeness of \( \{\neg, \wedge, \vee\} \)).</strong> The set \( \{\neg, \wedge, \vee\} \) is expressively complete.
</div>

<div class="proof">
<strong>Proof sketch.</strong> Given any truth function, represented by its truth table, one can construct a formula in <strong>disjunctive normal form</strong> (析取范式, DNF): for each row where the output is T, form the conjunction of the literals matching that row; then take the disjunction of all such conjunctions. This formula uses only \( \neg \), \( \wedge \), and \( \vee \), and it computes the given truth function.
</div>

### 6.1.1 Adequate Sets of Connectives

Since \( \rightarrow \) and \( \leftrightarrow \) can be defined in terms of \( \neg \), \( \wedge \), and \( \vee \), the full set of five connectives is expressively complete. More surprisingly, even smaller sets suffice:

- \( \{\neg, \wedge\} \) is expressively complete (since \( P \vee Q \Leftrightarrow \neg(\neg P \wedge \neg Q) \)).
- \( \{\neg, \vee\} \) is expressively complete (since \( P \wedge Q \Leftrightarrow \neg(\neg P \vee \neg Q) \)).
- \( \{\neg, \rightarrow\} \) is expressively complete (since \( P \vee Q \Leftrightarrow \neg P \rightarrow Q \)).

Even a single connective suffices: the **Sheffer stroke** (谢费尔竖线) \( P \uparrow Q \) (NAND, "not both") or the **Peirce arrow** (皮尔斯箭头) \( P \downarrow Q \) (NOR, "neither...nor") are each individually expressively complete.

### 6.1.2 Non-Adequate Sets

Not every subset of connectives is adequate. For example, \( \{\wedge, \vee\} \) is not expressively complete, because any formula built from \( \wedge \) and \( \vee \) alone (without \( \neg \)) is true when all variables are T. Hence such formulas cannot express the negation function.

## 6.2 Proving Things About Infinite Collections

A key methodological issue in metatheory is that the set of formulas (and the set of valid arguments) is infinite. How can we prove things about all members of an infinite collection?

### 6.2.1 Mathematical Induction

**Mathematical induction** (数学归纳法) on the natural numbers is a standard technique:

<div class="theorem">
<strong>Principle of Mathematical Induction.</strong> To prove that a property \( P(n) \) holds for all natural numbers \( n \geq 0 \):
<br><br>
1. <strong>Base case</strong>: Show that \( P(0) \) holds.<br>
2. <strong>Inductive step</strong>: Show that for any \( k \geq 0 \), if \( P(k) \) holds (the <strong>inductive hypothesis</strong>), then \( P(k+1) \) holds.
</div>

### 6.2.2 Structural Induction

Since formulas are defined recursively, we use **structural induction** (结构归纳法): prove the property for atomic formulas (base case), then show that if it holds for \( \phi \) and \( \psi \), it holds for \( \neg\phi \), \( \phi \wedge \psi \), \( \phi \vee \psi \), etc.

## 6.3 Soundness of the Derivation System

<div class="definition">
<strong>Soundness</strong> (可靠性) of a derivation system: A derivation system is <strong>sound</strong> if every argument that can be derived in the system is semantically valid (i.e., truth-functionally valid).
</div>

In symbols: if \( \Gamma \vdash \phi \) (i.e., \( \phi \) is derivable from \( \Gamma \)), then \( \Gamma \models \phi \) (i.e., \( \phi \) is a semantic consequence of \( \Gamma \)).

<div class="theorem">
<strong>Theorem 6.2 (Soundness of Sentential Derivation System).</strong> The derivation system for propositional logic is sound: if \( \Gamma \vdash \phi \), then \( \Gamma \models \phi \).
</div>

<div class="proof">
<strong>Proof idea.</strong> Prove by induction on the length of derivations. The base case checks that each basic inference rule preserves truth: if the premises of the rule are true under an assignment, then the conclusion is also true under that assignment. The inductive step extends this to longer derivations and handles subderivations (showing that conditional introduction and negation introduction also preserve validity).
</div>

Soundness is essential: it tells us that our proof system never leads us astray. Any derivation we construct genuinely establishes a valid argument.

## 6.4 Completeness of the Derivation System

<div class="definition">
<strong>Completeness</strong> (完备性) of a derivation system: A derivation system is <strong>complete</strong> if every semantically valid argument can be derived within the system.
</div>

In symbols: if \( \Gamma \models \phi \), then \( \Gamma \vdash \phi \).

<div class="theorem">
<strong>Theorem 6.3 (Completeness of Sentential Derivation System).</strong> The derivation system for propositional logic is complete: if \( \Gamma \models \phi \), then \( \Gamma \vdash \phi \).
</div>

Completeness tells us that our proof system is powerful enough to derive every valid argument. Combined with soundness, we get:

\[
\Gamma \vdash \phi \quad \text{if and only if} \quad \Gamma \models \phi
\]

This is a remarkable result: it shows that the syntactic notion (derivability) and the semantic notion (logical consequence) coincide perfectly for propositional logic.

## 6.5 Decidability

<div class="theorem">
<strong>Theorem 6.4 (Decidability of Propositional Logic).</strong> Propositional logic is <strong>decidable</strong> (可判定的): there exists an effective procedure (algorithm) that, given any argument in propositional logic, determines in finitely many steps whether it is valid or invalid.
</div>

The truth-table method is one such procedure: for any argument with finitely many statement letters, we can construct a finite truth table and check all rows. Truth trees provide another decision procedure. The existence of a decision procedure is a strong property that, as we shall see, does not extend to predicate logic in general.

---

# Chapter 7: Predicate Logic --- Quantifiers, Variables, and the Universe of Discourse

## 7.1 Why Predicate Logic?

Propositional logic treats atomic statements as unanalyzed wholes. This means it cannot capture the internal structure of statements or represent the logical relationships that depend on that structure. Consider:

\[
\text{All humans are mortal. Socrates is a human. Therefore, Socrates is mortal.}
\]

This is clearly valid, but propositional logic cannot explain *why*: it would symbolize the three statements as three unrelated letters \( P, Q, R \), and the argument \( P, Q \therefore R \) is invalid in propositional logic.

**Predicate logic** (谓词逻辑) (also called **quantificational logic** (量化逻辑) or **first-order logic** (一阶逻辑)) enriches the language of logic with the internal structure of statements --- subjects, predicates, and quantifiers --- allowing us to represent and validate a much wider class of arguments.

## 7.2 The Language of Predicate Logic

### 7.2.1 Individual Constants

**Individual constants** (个体常项) are symbols that name specific objects in the domain. We use lowercase letters from the beginning of the alphabet: \( a, b, c, \ldots \)

Example: Let \( s \) = Socrates, \( a \) = Aristotle.

### 7.2.2 Predicates

**Predicates** (谓词) are symbols that express properties of individuals or relations among individuals. We use uppercase letters: \( F, G, H, \ldots \)

- A **one-place predicate** (一元谓词) expresses a property: \( Fx \) means "\( x \) has property \( F \)."
- A **two-place predicate** (二元谓词) expresses a binary relation: \( Rxy \) means "\( x \) bears relation \( R \) to \( y \)."
- In general, an **\( n \)-place predicate** takes \( n \) arguments.

### 7.2.3 Variables

**Individual variables** (个体变项) are symbols that range over objects in the domain. We use lowercase letters from the end of the alphabet: \( x, y, z, \ldots \)

### 7.2.4 Quantifiers

The two quantifiers are:

<div class="definition">
<strong>Universal Quantifier</strong> (全称量词) \( \forall \): "\( \forall x \)" means "for all \( x \)" or "for every \( x \)."
<br><br>
<strong>Existential Quantifier</strong> (存在量词) \( \exists \): "\( \exists x \)" means "there exists an \( x \)" or "for some \( x \)."
</div>

### 7.2.5 Identity

The **identity predicate** (同一谓词) \( = \) is a special two-place predicate. \( x = y \) means "\( x \) is identical to \( y \)." It allows us to express statements like "there is exactly one" or "at most two."

## 7.3 The Universe of Discourse

<div class="definition">
<strong>Universe of Discourse (UD)</strong> (论域) (also called the <strong>domain</strong> (域)): The universe of discourse is the set of all objects that the variables in a predicate logic formula range over. Every interpretation must specify a non-empty UD.
</div>

The choice of UD affects the truth of quantified statements. For example, "\( \forall x\, Fx \)" ("everything is \( F \)") is true when the UD is the set of even numbers and \( F \) means "is an integer," but false when the UD is the set of all real numbers.

## 7.4 Symbolizing in Predicate Logic

### 7.4.1 Universal Statements

"All \( F \)s are \( G \)s" is symbolized as:

\[
\forall x (Fx \rightarrow Gx)
\]

Note the use of the conditional, not conjunction. "\( \forall x (Fx \wedge Gx) \)" would mean "everything is both \( F \) and \( G \)," which is much stronger.

### 7.4.2 Existential Statements

"Some \( F \)s are \( G \)s" is symbolized as:

\[
\exists x (Fx \wedge Gx)
\]

Note the use of conjunction, not the conditional. "\( \exists x (Fx \rightarrow Gx) \)" would be true whenever anything in the domain is not \( F \), which is almost certainly not what is intended.

<div class="example">
<strong>Example 7.1 (Common Symbolization Patterns).</strong>
<br>
UD: everything. Let \( Hx \) = "\( x \) is human," \( Mx \) = "\( x \) is mortal," \( s \) = Socrates.
<br><br>
(a) "All humans are mortal": \( \forall x(Hx \rightarrow Mx) \)<br>
(b) "Some humans are mortal": \( \exists x(Hx \wedge Mx) \)<br>
(c) "No humans are mortal": \( \forall x(Hx \rightarrow \neg Mx) \) or equivalently \( \neg\exists x(Hx \wedge Mx) \)<br>
(d) "Some humans are not mortal": \( \exists x(Hx \wedge \neg Mx) \)<br>
(e) "Socrates is human": \( Hs \)<br>
(f) "Socrates is mortal": \( Ms \)<br>
(g) "If Socrates is human, then Socrates is mortal": \( Hs \rightarrow Ms \)
</div>

### 7.4.3 Restricted UD

When the UD is restricted (e.g., UD = all humans), symbolization is simplified. "Everyone is mortal" becomes simply \( \forall x\, Mx \) rather than \( \forall x(Hx \rightarrow Mx) \), because every object in the domain is already assumed to be human.

## 7.5 Free and Bound Variables

<div class="definition">
<strong>Bound Variable</strong> (约束变元): An occurrence of a variable \( x \) is <strong>bound</strong> if it falls within the scope of a quantifier \( \forall x \) or \( \exists x \).
<br><br>
<strong>Free Variable</strong> (自由变元): An occurrence of a variable that is not bound is <strong>free</strong>.
<br><br>
A <strong>sentence</strong> (语句) (or <strong>closed formula</strong>) is a formula with no free variables. Only sentences have definite truth values in an interpretation.
</div>

<div class="example">
<strong>Example 7.2.</strong> In \( \forall x(Fx \rightarrow Gy) \), the variable \( x \) is bound (by \( \forall x \)), but \( y \) is free. This formula is not a sentence.
</div>

---

# Chapter 8: Predicate Logic --- Relations, Scope, and the Square of Opposition

## 8.1 Relations

### 8.1.1 Multi-Place Predicates

**Relations** (关系) are expressed using multi-place predicates. A two-place predicate \( Rxy \) expresses a binary relation between \( x \) and \( y \). The order of the arguments matters: \( Rxy \) and \( Ryx \) may have different truth values.

<div class="example">
<strong>Example 8.1.</strong> Let \( Lxy \) = "\( x \) loves \( y \)." Then:
<br><br>
(a) "Everyone loves someone": \( \forall x \exists y\, Lxy \)<br>
(b) "Someone is loved by everyone": \( \exists y \forall x\, Lxy \)<br>
(c) "Someone loves everyone": \( \exists x \forall y\, Lxy \)<br>
(d) "Everyone is loved by someone": \( \forall y \exists x\, Lxy \)
<br><br>
Note that (a) and (b) are <em>not</em> equivalent. In (a), different people may love different people; in (b), there is a single person loved by all.
</div>

### 8.1.2 Properties of Relations

Relations can have special properties:

<div class="definition">
<strong>Reflexive</strong> (自反的): \( \forall x\, Rxx \) --- every object bears \( R \) to itself.<br>
<strong>Irreflexive</strong> (非自反的): \( \forall x\, \neg Rxx \) --- no object bears \( R \) to itself.<br>
<strong>Symmetric</strong> (对称的): \( \forall x \forall y(Rxy \rightarrow Ryx) \)<br>
<strong>Asymmetric</strong> (非对称的): \( \forall x \forall y(Rxy \rightarrow \neg Ryx) \)<br>
<strong>Transitive</strong> (传递的): \( \forall x \forall y \forall z((Rxy \wedge Ryz) \rightarrow Rxz) \)
</div>

## 8.2 Scope

<div class="definition">
<strong>Scope</strong> (辖域): The <strong>scope</strong> of a quantifier is the quantifier itself together with the smallest complete formula immediately following it.
</div>

In \( \forall x(Fx \rightarrow Gx) \), the scope of \( \forall x \) is the entire formula \( \forall x(Fx \rightarrow Gx) \). In \( \forall x\, Fx \rightarrow Gx \), the scope of \( \forall x \) is only \( \forall x\, Fx \), and \( x \) in \( Gx \) is free.

### 8.2.1 Order of Quantifiers

When quantifiers of the same type are used, order does not matter:

\[
\forall x \forall y\, Rxy \quad \Leftrightarrow \quad \forall y \forall x\, Rxy
\]
\[
\exists x \exists y\, Rxy \quad \Leftrightarrow \quad \exists y \exists x\, Rxy
\]

But when quantifiers of different types are mixed, order matters greatly:

\[
\forall x \exists y\, Lxy \quad \not\Leftrightarrow \quad \exists y \forall x\, Lxy
\]

The first says "for every \( x \), there is some \( y \) that \( x \) loves" (different people may love different people). The second says "there is a single \( y \) that everyone loves."

## 8.3 The Square of Opposition

The **Square of Opposition** (对当方阵) is a traditional diagram showing the logical relationships among four standard categorical statement forms:

| Form | Name | Symbolization | Example |
|:---|:---|:---|:---|
| **A** | Universal Affirmative | \( \forall x(Fx \rightarrow Gx) \) | "All cats are mammals" |
| **E** | Universal Negative | \( \forall x(Fx \rightarrow \neg Gx) \) | "No cats are reptiles" |
| **I** | Particular Affirmative | \( \exists x(Fx \wedge Gx) \) | "Some cats are friendly" |
| **O** | Particular Negative | \( \exists x(Fx \wedge \neg Gx) \) | "Some cats are not friendly" |

The key logical relationships:

<div class="definition">
<strong>Contradictories</strong> (矛盾关系): A and O are contradictories; E and I are contradictories. They always have opposite truth values.
<br><br>
\( \neg\forall x(Fx \rightarrow Gx) \Leftrightarrow \exists x(Fx \wedge \neg Gx) \) (A and O are contradictories)
<br><br>
\( \neg\forall x(Fx \rightarrow \neg Gx) \Leftrightarrow \exists x(Fx \wedge Gx) \) (E and I are contradictories)
</div>

In classical predicate logic (which allows empty domains of \( F \)s), the traditional relationships of contrariety and subalternation do not hold unconditionally. In traditional Aristotelian logic, which assumed existential import (that the subject class is non-empty), A and E were **contraries** (不能同真), and the A-statement implied the I-statement (**subalternation** (差等关系)). Modern logic does *not* assume existential import, so these additional relationships require an explicit existential assumption.

## 8.4 Quantifier Equivalences

The following logical equivalences involving quantifiers are important:

| Name | Equivalence |
|:---|:---|
| Quantifier Negation | \( \neg\forall x\, \phi \Leftrightarrow \exists x\, \neg\phi \) |
| | \( \neg\exists x\, \phi \Leftrightarrow \forall x\, \neg\phi \) |
| Quantifier Distribution (over \( \wedge \)) | \( \forall x(\phi \wedge \psi) \Leftrightarrow \forall x\, \phi \wedge \forall x\, \psi \) |
| Quantifier Non-Distribution | \( \exists x(\phi \vee \psi) \Leftrightarrow \exists x\, \phi \vee \exists x\, \psi \) |

Note: \( \forall x \) does *not* distribute over \( \vee \), and \( \exists x \) does *not* distribute over \( \wedge \).

---

# Chapter 9: Predicate Logic --- Interpretations and Logical Properties

## 9.1 Interpretations

<div class="definition">
<strong>Interpretation</strong> (解释): An interpretation \( \mathcal{I} \) for a predicate logic formula specifies:
<br><br>
1. A non-empty <strong>universe of discourse</strong> (UD).<br>
2. An assignment of a specific object in the UD to each individual constant.<br>
3. An assignment of a property (subset of the UD) or relation (subset of the UD\( ^n \)) to each predicate letter.
</div>

<div class="example">
<strong>Example 9.1.</strong> Consider the formula \( \forall x(Fx \rightarrow Gx) \).
<br><br>
<strong>Interpretation 1:</strong><br>
UD: \( \{1, 2, 3\} \)<br>
\( F \): the property of being odd = \( \{1, 3\} \)<br>
\( G \): the property of being less than 4 = \( \{1, 2, 3\} \)<br>
Under this interpretation, \( \forall x(Fx \rightarrow Gx) \) is <strong>true</strong>: every odd number in the UD is less than 4.
<br><br>
<strong>Interpretation 2:</strong><br>
UD: \( \{1, 2, 3, 4, 5\} \)<br>
\( F \): the property of being odd = \( \{1, 3, 5\} \)<br>
\( G \): the property of being less than 4 = \( \{1, 2, 3\} \)<br>
Under this interpretation, \( \forall x(Fx \rightarrow Gx) \) is <strong>false</strong>: 5 is odd but not less than 4.
</div>

## 9.2 Logical Properties in Predicate Logic

The logical concepts from propositional logic generalize naturally:

### 9.2.1 Quantificational Validity

<div class="definition">
<strong>Quantificational Validity</strong> (量化有效性): An argument is <strong>quantificationally valid</strong> if there is no interpretation under which all premises are true and the conclusion is false.
</div>

### 9.2.2 Quantificational Truth and Falsehood

<div class="definition">
<strong>Quantificational Truth</strong> (量化真理): A sentence is <strong>quantificationally true</strong> if it is true under every interpretation.
<br><br>
<strong>Quantificational Falsehood</strong> (量化谬误): A sentence is <strong>quantificationally false</strong> if it is false under every interpretation.
</div>

### 9.2.3 Quantificational Equivalence and Consistency

<div class="definition">
<strong>Quantificational Equivalence</strong> (量化等价): Two sentences are quantificationally equivalent if they have the same truth value under every interpretation.
<br><br>
<strong>Quantificational Consistency</strong> (量化一致性): A set of sentences is quantificationally consistent if there exists at least one interpretation under which all sentences in the set are true.
</div>

## 9.3 Showing Invalidity and Other Properties

To show that a property does *not* hold (e.g., that an argument is invalid, or that a sentence is not a quantificational truth), one provides a specific **counterinterpretation**: an interpretation under which the relevant condition fails.

<div class="example">
<strong>Example 9.2 (Showing Invalidity).</strong> Show that the following argument is invalid:
<br><br>
Premise: \( \forall x(Fx \rightarrow Gx) \)<br>
Conclusion: \( \forall x(Gx \rightarrow Fx) \)
<br><br>
<strong>Counterinterpretation:</strong><br>
UD: \( \{1, 2\} \)<br>
\( F \): \( \{1\} \) (only 1 is \( F \))<br>
\( G \): \( \{1, 2\} \) (both are \( G \))<br>
<br>
Premise: \( \forall x(Fx \rightarrow Gx) \) is true (1 is the only \( F \), and 1 is \( G \)).<br>
Conclusion: \( \forall x(Gx \rightarrow Fx) \) is false (2 is \( G \) but not \( F \)).<br>
<br>
Since the premise is true and the conclusion is false, the argument is <strong>invalid</strong>.
</div>

## 9.4 The Limits of Counterinterpretations

While we can always demonstrate invalidity by producing a counterinterpretation, showing validity requires demonstrating that *no* interpretation can make the premises true and the conclusion false --- which is an infinitary task. This is why we need proof methods (derivations, truth trees) for establishing validity.

---

# Chapter 10: Truth Trees for Predicate Logic

## 10.1 Extending Truth Trees to Predicate Logic

The truth tree method extends from propositional logic to predicate logic by adding rules for quantifiers. The propositional rules remain unchanged; the new rules decompose quantified formulas.

## 10.2 Quantifier Tree Rules

### 10.2.1 Universal Instantiation (UI)

<div class="definition">
<strong>Universal Instantiation (\( \forall \)):</strong> From \( \forall x\, \phi(x) \), write \( \phi(a) \) for any individual constant \( a \) that already appears on the branch. If no constant appears on the branch, introduce a new one.
<br><br>
<em>Important:</em> The universal formula is <strong>not checked off</strong>. It may be instantiated again with a different constant as needed.
</div>

### 10.2.2 Existential Instantiation (EI)

<div class="definition">
<strong>Existential Instantiation (\( \exists \)):</strong> From \( \exists x\, \phi(x) \), write \( \phi(a) \) where \( a \) is a <strong>new</strong> individual constant that does not already appear anywhere on the branch. Check off \( \exists x\, \phi(x) \).
</div>

The requirement that \( a \) be new is crucial: since we only know that *some* object satisfies \( \phi \), we must not assume it is an object we already know about.

### 10.2.3 Negated Quantifier Rules

<div class="definition">
<strong>Negated Universal (\( \neg\forall \)):</strong> From \( \neg\forall x\, \phi(x) \), write \( \exists x\, \neg\phi(x) \). Check off \( \neg\forall x\, \phi(x) \).
<br><br>
<strong>Negated Existential (\( \neg\exists \)):</strong> From \( \neg\exists x\, \phi(x) \), write \( \forall x\, \neg\phi(x) \). Check off \( \neg\exists x\, \phi(x) \).
</div>

## 10.3 Strategy for Predicate Logic Trees

The recommended order of rule application is:

1. Apply propositional rules and negated quantifier rules first.
2. Apply existential instantiation before universal instantiation (since EI requires a new constant, and delays may cause conflicts).
3. Apply universal instantiation last, using constants already on the branch.
4. If a branch remains open after all existential formulas are checked off and all universal formulas have been instantiated with every constant on the branch, the branch is complete (open).

<div class="example">
<strong>Example 10.1.</strong> Test the validity of: \( \forall x(Fx \rightarrow Gx), Fa \therefore Ga \).
<br><br>
Tree:<br>
1. \( \forall x(Fx \rightarrow Gx) \) (premise)<br>
2. \( Fa \) (premise)<br>
3. \( \neg Ga \) (negation of conclusion)<br>
4. \( Fa \rightarrow Ga \) (UI from line 1, with \( a \))<br>
5. Branch on line 4:<br>
&emsp;Left: \( \neg Fa \) --- closes with line 2 \( \times \)<br>
&emsp;Right: \( Ga \) --- closes with line 3 \( \times \)<br>
<br>
All branches close. The argument is <strong>valid</strong>.
</div>

## 10.4 Infinite Trees and Non-Termination

Unlike propositional logic trees, predicate logic trees may not terminate. Because universal formulas are never checked off, one can keep instantiating them with new constants (introduced by existential instantiation). This can produce an infinite tree.

<div class="example">
<strong>Example 10.2 (Non-Terminating Tree).</strong> Consider testing whether \( \exists x \forall y\, Rxy \) follows from \( \forall x \exists y\, Rxy \).
<br><br>
Tree trunk:<br>
1. \( \forall x \exists y\, Rxy \)<br>
2. \( \neg\exists x \forall y\, Rxy \)<br>
3. \( \forall x \neg\forall y\, Rxy \) (from 2, \( \neg\exists \) rule)<br>
<br>
UI on 1 with \( a \): \( \exists y\, Ray \)<br>
EI: \( Rab \) (new constant \( b \))<br>
UI on 3 with \( a \): \( \neg\forall y\, Ray \)<br>
Then: \( \exists y\, \neg Ray \)<br>
EI: \( \neg Rac \) (new constant \( c \))<br>
<br>
Now UI on 1 with \( b \): \( \exists y\, Rby \)<br>
EI: \( Rbd \) (new constant \( d \))...<br>
<br>
This process never terminates. Each new constant generated by EI triggers further instantiations.
</div>

This phenomenon is connected to the undecidability of predicate logic (see Chapter 11).

## 10.5 Testing for Quantificational Properties with Trees

The tree method tests the same properties as in propositional logic, now generalized:

| Property | Tree Setup | Result |
|:---|:---|:---|
| Validity | Premises + negation of conclusion | Closed \( \Rightarrow \) valid |
| Quantificational truth | Negation of the sentence | Closed \( \Rightarrow \) quantificational truth |
| Consistency | All sentences in the set | Open branch \( \Rightarrow \) consistent |
| Equivalence | Negation of biconditional | Closed \( \Rightarrow \) equivalent |

---

# Chapter 11: Metatheory of Predicate Logic --- Soundness, Completeness, and Decidability

## 11.1 Soundness of Predicate Logic

<div class="theorem">
<strong>Theorem 11.1 (Soundness of Predicate Logic).</strong> The derivation system (and truth tree method) for predicate logic is <strong>sound</strong>: if \( \Gamma \vdash \phi \), then \( \Gamma \models \phi \). That is, every derivable argument is quantificationally valid.
</div>

The proof extends the propositional soundness proof by verifying that the quantifier rules (universal instantiation, existential instantiation, universal generalization, etc.) also preserve truth across interpretations.

Soundness ensures our proof system is *trustworthy*: it never declares an invalid argument valid.

## 11.2 Completeness of Predicate Logic

<div class="theorem">
<strong>Theorem 11.2 (Completeness of First-Order Logic, Godel 1930).</strong> The standard derivation system for first-order predicate logic is <strong>complete</strong>: if \( \Gamma \models \phi \), then \( \Gamma \vdash \phi \). Every quantificationally valid argument has a derivation.
</div>

This is one of the most celebrated results in mathematical logic, proved by Kurt Godel in his doctoral dissertation (1929). The completeness theorem has several equivalent formulations:

1. **Derivation form**: If \( \Gamma \models \phi \), then \( \Gamma \vdash \phi \).
2. **Consistency form** (Model Existence Theorem): If \( \Gamma \) is consistent (no contradiction is derivable from \( \Gamma \)), then \( \Gamma \) has a model (an interpretation making all sentences in \( \Gamma \) true).

Together with soundness:

\[
\Gamma \vdash \phi \quad \Leftrightarrow \quad \Gamma \models \phi
\]

This perfect correspondence between syntax and semantics is a deep and surprising fact. It says that the derivation rules, which are purely mechanical symbol-manipulation procedures, perfectly capture the semantic notion of logical consequence.

### 11.2.1 Significance of Completeness

The completeness theorem answers a fundamental question: Is our formal system strong enough to prove everything that is logically valid? Godel showed the answer is yes for first-order logic. This provides philosophical assurance: if an argument is genuinely valid (no counterinterpretation exists), then there *is* a proof of it, even if we have not found one yet.

### 11.2.2 Proof Sketch

The proof of completeness is too involved for a full treatment, but the key idea (via Henkin's method, 1949) is:

1. Assume \( \phi \) is not derivable from \( \Gamma \).
2. Then \( \Gamma \cup \{\neg\phi\} \) is consistent.
3. Extend \( \Gamma \cup \{\neg\phi\} \) to a maximally consistent set.
4. Construct a model (interpretation) from this maximally consistent set.
5. This interpretation satisfies \( \Gamma \) and \( \neg\phi \), so \( \Gamma \not\models \phi \).

The contrapositive gives: if \( \Gamma \models \phi \), then \( \Gamma \vdash \phi \).

## 11.3 Decidability and Undecidability

<div class="theorem">
<strong>Theorem 11.3 (Undecidability of Predicate Logic, Church 1936, Turing 1936).</strong> First-order predicate logic is <strong>undecidable</strong> (不可判定的): there is no algorithm that, given an arbitrary predicate logic sentence, will always determine in finitely many steps whether it is quantificationally true.
</div>

This contrasts sharply with propositional logic, which *is* decidable. The undecidability result means:

1. There is no general-purpose decision procedure for predicate logic validity.
2. Truth trees for predicate logic may run forever on some inputs (as shown in Example 10.2).
3. While the derivation system is complete (every valid argument has a proof), there is no algorithm that will always *find* that proof in finite time.

### 11.3.1 Relationship Between Completeness and Decidability

It may seem paradoxical that predicate logic is both complete and undecidable. The resolution is:

- **Completeness** says: if \( \phi \) is valid, a proof exists.
- **Decidability** would require: an algorithm that always terminates and correctly classifies \( \phi \) as valid or not.

The problem is that if \( \phi \) is *not* valid, the search for a proof will never find one (because none exists), but the search process may not terminate. We cannot distinguish "still searching" from "will never find" in general.

In technical terms, predicate logic is **semi-decidable** (半可判定的): there is a procedure that will eventually find a proof of any valid sentence (by systematically trying all possible derivations), but if the sentence is invalid, the procedure may run forever.

### 11.3.2 Decidable Fragments

Although full predicate logic is undecidable, certain restricted fragments are decidable:

- **Monadic predicate logic** (一元谓词逻辑): predicate logic restricted to one-place predicates (no relations). This fragment is decidable.
- **The Bernays-Schonfinkel class**: formulas of the form \( \exists x_1 \cdots \exists x_m \forall y_1 \cdots \forall y_n\, \phi \) where \( \phi \) is quantifier-free. This class is decidable.

## 11.4 Compactness

<div class="theorem">
<strong>Theorem 11.4 (Compactness Theorem).</strong> A set of first-order sentences \( \Gamma \) has a model if and only if every finite subset of \( \Gamma \) has a model.
</div>

Compactness is a corollary of completeness. It says that if an infinite set of sentences is unsatisfiable, then some *finite* subset is already unsatisfiable. This theorem has many important applications in model theory and algebra.

## 11.5 The Lowenheim-Skolem Theorem

<div class="theorem">
<strong>Theorem 11.5 (Lowenheim-Skolem Theorem).</strong> If a countable set of first-order sentences has a model, then it has a countable model.
</div>

This remarkable result shows that first-order logic cannot distinguish between infinite cardinalities: even if the intended interpretation has an uncountable domain, the first-order theory has a countable model. This has profound implications for the foundations of mathematics.

## 11.6 Comparing Propositional and Predicate Logic

| Property | Propositional Logic | Predicate Logic |
|:---|:---:|:---:|
| Sound | Yes | Yes |
| Complete | Yes | Yes |
| Decidable | Yes | No |
| Semi-decidable | Yes | Yes |
| Compact | Yes | Yes |
| Has finite model property | Yes | No |

## 11.7 Philosophical Reflections

The metatheoretical results surveyed in this chapter raise deep philosophical questions:

1. **Justification of logic**: The soundness and completeness theorems show that our syntactic proof methods perfectly capture semantic validity. But the proofs of these theorems themselves use logical reasoning. Is there circularity in using logic to justify logic? As the course description notes, "if we produce a justification for belief in the correctness of the system, how do we know that the reasoning we use in our justification is correct if the inferences in the justification are part of the system?"

2. **The scope of formal logic**: Propositional logic captures only truth-functional reasoning; predicate logic captures quantificational reasoning as well. But there are valid patterns of inference that neither system captures (e.g., modal reasoning: "necessarily \( P \), therefore \( P \)"). Are there limits to what formal logic can capture?

3. **Computability and logic**: The undecidability of predicate logic, proved independently by Church and Turing in 1936, was one of the founding results of computability theory. It shows a fundamental limitation on what can be computed --- a limitation that applies not just to machines but to any algorithmic procedure, including those executed by human mathematicians.

4. **Classical logic as an idealization**: Classical logic assumes bivalence (every statement is either true or false), the law of excluded middle, and the existence of a fixed domain of discourse. Alternative logics --- intuitionistic, paraconsistent, many-valued, modal --- challenge some of these assumptions. The study of classical logic provides the foundation against which these alternatives are understood.
