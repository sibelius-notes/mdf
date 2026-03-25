---
title: "MATH 136: Linear Algebra 1"
---

# Chapter 1: Vectors in Euclidean Space

## 1.1 Vector Addition and Scalar Multiplication

We begin by defining the fundamental space in which we work throughout the course.

<div class="definition">

<strong>Definition (Euclidean Space \(\mathbb{R}^n\)).</strong> For any positive integer \(n\), the set of all elements of the form \((x_1, \ldots, x_n)\) where \(x_i \in \mathbb{R}\) for \(1 \leq i \leq n\) is called <em>n-dimensional Euclidean space</em> and is denoted \(\mathbb{R}^n\). The elements of \(\mathbb{R}^n\) are called points.

</div>

In linear algebra we view elements of \(\mathbb{R}^n\) as column vectors \(\vec{x} = \begin{pmatrix} x_1 \\ \vdots \\ x_n \end{pmatrix}\), which allows us to perform operations on them.

<div class="definition">

<strong>Definition (Vector Addition and Scalar Multiplication).</strong> Let \(\vec{x}, \vec{y} \in \mathbb{R}^n\) and \(c \in \mathbb{R}\). We define
\[
\vec{x} + \vec{y} = \begin{pmatrix} x_1 + y_1 \\ \vdots \\ x_n + y_n \end{pmatrix}, \qquad c\vec{x} = \begin{pmatrix} cx_1 \\ \vdots \\ cx_n \end{pmatrix}.
\]

</div>

<div class="definition">

<strong>Definition (Linear Combination).</strong> Let \(\vec{v}_1, \ldots, \vec{v}_k \in \mathbb{R}^n\). The sum \(c_1\vec{v}_1 + c_2\vec{v}_2 + \cdots + c_k\vec{v}_k\) where \(c_i \in \mathbb{R}\) for \(1 \leq i \leq k\) is called a <em>linear combination</em> of \(\vec{v}_1, \ldots, \vec{v}_k\).

</div>

The following theorem establishes the fundamental algebraic properties of \(\mathbb{R}^n\).

<div class="theorem">

<strong>Theorem 1.1.1.</strong> Let \(\vec{x}, \vec{y}, \vec{w} \in \mathbb{R}^n\) and \(c, d \in \mathbb{R}\). Then:<br>
V1: \(\vec{x} + \vec{y} \in \mathbb{R}^n\);<br>
V2: \((\vec{x} + \vec{y}) + \vec{w} = \vec{x} + (\vec{y} + \vec{w})\);<br>
V3: \(\vec{x} + \vec{y} = \vec{y} + \vec{x}\);<br>
V4: There exists \(\vec{0} \in \mathbb{R}^n\) such that \(\vec{x} + \vec{0} = \vec{x}\);<br>
V5: For each \(\vec{x} \in \mathbb{R}^n\) there exists \(-\vec{x} \in \mathbb{R}^n\) such that \(\vec{x} + (-\vec{x}) = \vec{0}\);<br>
V6: \(c\vec{x} \in \mathbb{R}^n\);<br>
V7: \(c(d\vec{x}) = (cd)\vec{x}\);<br>
V8: \((c + d)\vec{x} = c\vec{x} + d\vec{x}\);<br>
V9: \(c(\vec{x} + \vec{y}) = c\vec{x} + c\vec{y}\);<br>
V10: \(1\vec{x} = \vec{x}\).

</div>

Properties V1 and V6 together imply that \(\mathbb{R}^n\) is closed under linear combinations.

### Span

<div class="definition">

<strong>Definition (Span).</strong> Let \(B = \{\vec{v}_1, \ldots, \vec{v}_k\}\) be a set of vectors in \(\mathbb{R}^n\). Then we define \(\operatorname{Span} B = \{c_1\vec{v}_1 + c_2\vec{v}_2 + \cdots + c_k\vec{v}_k \mid c_1, \ldots, c_k \in \mathbb{R}\}\). We say that \(\operatorname{Span} B\) is <em>spanned by</em> \(B\) and that \(B\) is a <em>spanning set</em> for \(\operatorname{Span} B\).

</div>

<div class="definition">

<strong>Definition (Vector Equation).</strong> If the set \(S\) is spanned by \(\{\vec{v}_1, \ldots, \vec{v}_k\}\), then a <em>vector equation</em> for \(S\) is \(\vec{x} = c_1\vec{v}_1 + \cdots + c_k\vec{v}_k\), \(c_1, \ldots, c_k \in \mathbb{R}\).

</div>

When a spanning set contains redundant vectors, we can simplify.

<div class="theorem">

<strong>Theorem 1.1.2.</strong> If \(\vec{v}_k\) can be written as a linear combination of \(\vec{v}_1, \ldots, \vec{v}_{k-1}\), then \(\operatorname{Span}\{\vec{v}_1, \ldots, \vec{v}_k\} = \operatorname{Span}\{\vec{v}_1, \ldots, \vec{v}_{k-1}\}\).

</div>

### Linear Independence

<div class="definition">

<strong>Definition (Linearly Dependent / Independent).</strong> A set of vectors \(\{\vec{v}_1, \ldots, \vec{v}_k\}\) in \(\mathbb{R}^n\) is <em>linearly dependent</em> if there exist coefficients \(c_1, \ldots, c_k\), not all zero, such that \(\vec{0} = c_1\vec{v}_1 + \cdots + c_k\vec{v}_k\). The set is <em>linearly independent</em> if the only solution is \(c_1 = c_2 = \cdots = c_k = 0\) (the trivial solution).

</div>

<div class="theorem">

<strong>Theorem 1.1.3.</strong> If a set of vectors \(\{\vec{v}_1, \ldots, \vec{v}_k\}\) contains the zero vector, then it is linearly dependent.

</div>

### Basis and Standard Basis

<div class="definition">

<strong>Definition (Basis).</strong> If a subset \(S\) of \(\mathbb{R}^n\) can be written as a span of vectors \(\vec{v}_1, \ldots, \vec{v}_k\) where \(\{\vec{v}_1, \ldots, \vec{v}_k\}\) is linearly independent, then \(\{\vec{v}_1, \ldots, \vec{v}_k\}\) is a <em>basis</em> for \(S\).

</div>

<div class="definition">

<strong>Definition (Standard Basis).</strong> In \(\mathbb{R}^n\), let \(\vec{e}_i\) represent the vector whose \(i\)-th component is 1 and all other components are 0. The set \(\{\vec{e}_1, \ldots, \vec{e}_n\}\) is called the <em>standard basis</em> for \(\mathbb{R}^n\).

</div>

### Surfaces in Higher Dimensions

<div class="definition">

<strong>Definition (Line in \(\mathbb{R}^n\)).</strong> Let \(\vec{v}, \vec{b} \in \mathbb{R}^n\) with \(\vec{v} \neq \vec{0}\). The set with vector equation \(\vec{x} = c_1\vec{v} + \vec{b}\), \(c_1 \in \mathbb{R}\), is a <em>line</em> in \(\mathbb{R}^n\) passing through \(\vec{b}\).

</div>

<div class="definition">

<strong>Definition (Plane in \(\mathbb{R}^n\)).</strong> Let \(\vec{v}_1, \vec{v}_2, \vec{b} \in \mathbb{R}^n\) with \(\{\vec{v}_1, \vec{v}_2\}\) linearly independent. The set with vector equation \(\vec{x} = c_1\vec{v}_1 + c_2\vec{v}_2 + \vec{b}\), \(c_1, c_2 \in \mathbb{R}\), is a <em>plane</em> in \(\mathbb{R}^n\) passing through \(\vec{b}\).

</div>

<div class="definition">

<strong>Definition (\(k\)-plane in \(\mathbb{R}^n\)).</strong> Let \(\vec{v}_1, \ldots, \vec{v}_k, \vec{b} \in \mathbb{R}^n\) with \(\{\vec{v}_1, \ldots, \vec{v}_k\}\) linearly independent. The set with vector equation \(\vec{x} = c_1\vec{v}_1 + \cdots + c_k\vec{v}_k + \vec{b}\), \(c_1, \ldots, c_k \in \mathbb{R}\), is a <em>\(k\)-plane</em> in \(\mathbb{R}^n\) passing through \(\vec{b}\).

</div>

<div class="definition">

<strong>Definition (Hyperplane in \(\mathbb{R}^n\)).</strong> Let \(\vec{v}_1, \ldots, \vec{v}_{n-1}, \vec{b} \in \mathbb{R}^n\) with \(\{\vec{v}_1, \ldots, \vec{v}_{n-1}\}\) linearly independent. The set with vector equation \(\vec{x} = c_1\vec{v}_1 + \cdots + c_{n-1}\vec{v}_{n-1} + \vec{b}\), \(c_i \in \mathbb{R}\), is a <em>hyperplane</em> in \(\mathbb{R}^n\) passing through \(\vec{b}\).

</div>

## 1.2 Subspaces

Not all subsets of \(\mathbb{R}^n\) are closed under addition and scalar multiplication. Those that are enjoy a special structure.

<div class="definition">

<strong>Definition (Subspace of \(\mathbb{R}^n\)).</strong> A non-empty subset \(S\) of \(\mathbb{R}^n\) is called a <em>subspace</em> of \(\mathbb{R}^n\) if it satisfies all ten properties V1--V10 of Theorem 1.1.1.

</div>

<div class="theorem">

<strong>Theorem 1.2.1 (Subspace Test).</strong> Let \(S\) be a non-empty subset of \(\mathbb{R}^n\). If \(\vec{x} + \vec{y} \in S\) and \(c\vec{x} \in S\) for all \(\vec{x}, \vec{y} \in S\) and \(c \in \mathbb{R}\), then \(S\) is a subspace of \(\mathbb{R}^n\).

</div>

<div class="remark">

<strong>Remark.</strong> If \(S\) is non-empty and closed under scalar multiplication, then \(\vec{0} \in S\). Thus, the standard way to check non-emptiness is to verify \(\vec{0} \in S\). If \(\vec{0} \notin S\), then \(S\) is not a subspace.

</div>

<div class="theorem">

<strong>Theorem 1.2.2.</strong> Let \(\vec{v}_1, \ldots, \vec{v}_k \in \mathbb{R}^n\). Then \(S = \operatorname{Span}\{\vec{v}_1, \ldots, \vec{v}_k\}\) is a subspace of \(\mathbb{R}^n\).

</div>

## 1.3 Dot Product

The dot product generalizes the familiar inner product from \(\mathbb{R}^2\) and \(\mathbb{R}^3\) to \(\mathbb{R}^n\).

<div class="theorem">

<strong>Theorem 1.3.1.</strong> Let \(\vec{x}, \vec{y} \in \mathbb{R}^2\) and let \(\theta\) be the angle between \(\vec{x}\) and \(\vec{y}\). Then \(\vec{x} \cdot \vec{y} = \|\vec{x}\|\|\vec{y}\| \cos \theta\).

</div>

<div class="definition">

<strong>Definition (Dot Product).</strong> Let \(\vec{x}, \vec{y} \in \mathbb{R}^n\). The <em>dot product</em> of \(\vec{x}\) and \(\vec{y}\) is \(\vec{x} \cdot \vec{y} = x_1 y_1 + \cdots + x_n y_n = \sum_{i=1}^n x_i y_i\).

</div>

<div class="theorem">

<strong>Theorem 1.3.2.</strong> Let \(\vec{x}, \vec{y}, \vec{z} \in \mathbb{R}^n\) and \(s, t \in \mathbb{R}\). Then:<br>
(1) \(\vec{x} \cdot \vec{x} \geq 0\) and \(\vec{x} \cdot \vec{x} = 0\) if and only if \(\vec{x} = \vec{0}\).<br>
(2) \(\vec{x} \cdot \vec{y} = \vec{y} \cdot \vec{x}\).<br>
(3) \(\vec{x} \cdot (s\vec{y} + t\vec{z}) = s(\vec{x} \cdot \vec{y}) + t(\vec{x} \cdot \vec{z})\).

</div>

### Length, Unit Vectors, and Angles

<div class="definition">

<strong>Definition (Length / Norm).</strong> Let \(\vec{x} \in \mathbb{R}^n\). The <em>length</em> (or <em>norm</em>) of \(\vec{x}\) is \(\|\vec{x}\| = \sqrt{\vec{x} \cdot \vec{x}}\).

</div>

<div class="definition">

<strong>Definition (Unit Vector).</strong> A vector \(\vec{x} \in \mathbb{R}^n\) such that \(\|\vec{x}\| = 1\) is called a <em>unit vector</em>.

</div>

<div class="theorem">

<strong>Theorem 1.3.3.</strong> Let \(\vec{x}, \vec{y} \in \mathbb{R}^n\) and \(c \in \mathbb{R}\). Then:<br>
(1) \(\|\vec{x}\| \geq 0\) and \(\|\vec{x}\| = 0\) if and only if \(\vec{x} = \vec{0}\).<br>
(2) \(\|c\vec{x}\| = |c|\|\vec{x}\|\).<br>
(3) \(|\vec{x} \cdot \vec{y}| \leq \|\vec{x}\|\|\vec{y}\|\) (Cauchy--Schwarz Inequality).<br>
(4) \(\|\vec{x} + \vec{y}\| \leq \|\vec{x}\| + \|\vec{y}\|\) (Triangle Inequality).

</div>

<div class="definition">

<strong>Definition (Angle in \(\mathbb{R}^n\)).</strong> Let \(\vec{x}, \vec{y} \in \mathbb{R}^n\). The <em>angle</em> between \(\vec{x}\) and \(\vec{y}\) is the angle \(\theta\) such that \(\vec{x} \cdot \vec{y} = \|\vec{x}\|\|\vec{y}\| \cos \theta\).

</div>

<div class="definition">

<strong>Definition (Orthogonal).</strong> Two vectors \(\vec{x}, \vec{y} \in \mathbb{R}^n\) are <em>orthogonal</em> if and only if \(\vec{x} \cdot \vec{y} = 0\).

</div>

### Cross Product

<div class="definition">

<strong>Definition (Cross Product).</strong> Let \(\vec{v}, \vec{w} \in \mathbb{R}^3\). The <em>cross product</em> is \(\vec{v} \times \vec{w} = \begin{pmatrix} v_2 w_3 - v_3 w_2 \\ v_3 w_1 - v_1 w_3 \\ v_1 w_2 - v_2 w_1 \end{pmatrix}\).

</div>

<div class="theorem">

<strong>Theorem 1.3.4.</strong> For any \(\vec{v}, \vec{w}, \vec{x} \in \mathbb{R}^3\) and \(c \in \mathbb{R}\):<br>
(1) If \(\vec{n} = \vec{v} \times \vec{w}\), then \(\vec{y} \cdot \vec{n} = 0\) for any \(\vec{y} \in \operatorname{Span}\{\vec{v}, \vec{w}\}\).<br>
(2) \(\vec{v} \times \vec{w} = -\vec{w} \times \vec{v}\).<br>
(3) \(\vec{v} \times \vec{v} = \vec{0}\).<br>
(4) If \(\vec{v} \times \vec{w} = \vec{0}\) then either one of \(\vec{v}, \vec{w}\) is \(\vec{0}\), or \(\vec{w}\) is a scalar multiple of \(\vec{v}\).<br>
(5) \(\vec{v} \times (\vec{w} + \vec{x}) = \vec{v} \times \vec{w} + \vec{v} \times \vec{x}\).<br>
(6) \((k\vec{v}) \times \vec{w} = k(\vec{v} \times \vec{w})\).<br>
(7) \(\|\vec{v} \times \vec{w}\| = \|\vec{v}\|\|\vec{w}\| \sin \theta\) where \(\theta\) is the angle between \(\vec{v}\) and \(\vec{w}\).

</div>

## 1.4 Projections

Given vectors \(\vec{u}\) and \(\vec{v}\), we often want to decompose \(\vec{u}\) into a component along \(\vec{v}\) and a component orthogonal to \(\vec{v}\).

<div class="definition">

<strong>Definition (Projection).</strong> Let \(\vec{u}, \vec{v} \in \mathbb{R}^n\) with \(\vec{v} \neq \vec{0}\). The <em>projection</em> of \(\vec{u}\) onto \(\vec{v}\) is \(\operatorname{proj}_{\vec{v}} \vec{u} = \frac{\vec{u} \cdot \vec{v}}{\|\vec{v}\|^2} \vec{v}\).

</div>

<div class="definition">

<strong>Definition (Perpendicular).</strong> Let \(\vec{u}, \vec{v} \in \mathbb{R}^n\) with \(\vec{v} \neq \vec{0}\). The <em>perpendicular</em> of \(\vec{u}\) onto \(\vec{v}\) is \(\operatorname{perp}_{\vec{v}} \vec{u} = \vec{u} - \operatorname{proj}_{\vec{v}} \vec{u}\).

</div>

One can verify that \(\operatorname{proj}_{\vec{v}} \vec{u} \cdot \operatorname{perp}_{\vec{v}} \vec{u} = 0\), confirming the decomposition is orthogonal. To project a vector onto a plane, compute the perpendicular of the projection onto the plane's normal vector.

# Chapter 2: Systems of Linear Equations

## 2.1 Systems of Linear Equations

<div class="definition">

<strong>Definition (Linear Equation).</strong> An equation of the form \(a_1 x_1 + \cdots + a_n x_n = b\) where \(a_1, \ldots, a_n, b\) are constants is called a <em>linear equation</em>. The constants \(a_i\) are the <em>coefficients</em> and \(b\) is the <em>right-hand side</em>.

</div>

<div class="definition">

<strong>Definition (System of Linear Equations).</strong> A set of \(m\) linear equations in the same variables \(x_1, \ldots, x_n\) is called a <em>system of linear equations</em>.

</div>

<div class="definition">

<strong>Definition (Solution).</strong> A vector \(\vec{s} \in \mathbb{R}^n\) is a <em>solution</em> of a system of \(m\) linear equations in \(n\) unknowns if all \(m\) equations are satisfied when \(x_i = s_i\) for \(1 \leq i \leq n\).

</div>

<div class="definition">

<strong>Definition (Consistent / Inconsistent).</strong> A system is <em>consistent</em> if it has at least one solution; otherwise it is <em>inconsistent</em>.

</div>

<div class="theorem">

<strong>Theorem 2.1.1.</strong> If a system of linear equations has two distinct solutions \(\vec{s}\) and \(\vec{t}\), then \(\vec{x} = \vec{s} + c(\vec{s} - \vec{t})\) is a distinct solution for each \(c \in \mathbb{R}\). Hence, a consistent system has either exactly one solution or infinitely many.

</div>

<div class="definition">

<strong>Definition (Solution Set).</strong> The set of all solutions of a system of linear equations is called the <em>solution set</em> of the system.

</div>

## 2.2 Solving Systems of Linear Equations

We encode a system compactly as a matrix and use row operations to solve it.

<div class="definition">

<strong>Definition (Augmented Matrix / Coefficient Matrix).</strong> The <em>augmented matrix</em> of a system is the rectangular array \([A \mid \vec{b}]\) formed by the coefficients and the right-hand side. The <em>coefficient matrix</em> \(A\) contains only the coefficients.

</div>

<div class="definition">

<strong>Definition (Equivalent Systems).</strong> Two systems of equations are <em>equivalent</em> if they have the same solution set.

</div>

<div class="definition">

<strong>Definition (Elementary Row Operations).</strong> The three <em>elementary row operations</em> (EROs) are:<br>
1. Multiplying a row by a non-zero scalar (\(cR_i\)).<br>
2. Adding a multiple of one row to another (\(R_i + cR_j\)).<br>
3. Swapping two rows (\(R_i \leftrightarrow R_j\)).

</div>

<div class="definition">

<strong>Definition (Row Equivalent).</strong> Two matrices \(A\) and \(B\) are <em>row equivalent</em> if there exists a sequence of EROs transforming \(A\) into \(B\).

</div>

<div class="theorem">

<strong>Theorem 2.2.1.</strong> If the augmented matrices \([A_1 \mid \vec{b}_1]\) and \([A \mid \vec{b}]\) are row equivalent, then their associated systems of linear equations are equivalent.

</div>

### Reduced Row Echelon Form

<div class="definition">

<strong>Definition (Reduced Row Echelon Form).</strong> A matrix \(R\) is in <em>RREF</em> if:<br>
1. All rows with a non-zero entry are above rows of all zeros.<br>
2. The first non-zero entry in each non-zero row is 1 (a leading one).<br>
3. Each leading one is to the right of the leading one in any row above it.<br>
4. A leading one is the only non-zero entry in its column.

</div>

<div class="theorem">

<strong>Theorem 2.2.2.</strong> The RREF of a matrix is unique.

</div>

<div class="definition">

<strong>Definition (Free Variable).</strong> Let \(R\) be the RREF of the coefficient matrix. If the \(j\)-th column of \(R\) does not contain a leading one, then \(x_j\) is a <em>free variable</em>.

</div>

### Rank

<div class="definition">

<strong>Definition (Rank).</strong> The <em>rank</em> of a matrix is the number of leading ones in its RREF.

</div>

The following theorem is fundamental and referenced throughout the course.

<div class="theorem">

<strong>Theorem 2.2.3.</strong> Let \(A\) be the \(m \times n\) coefficient matrix of a system of linear equations.<br>
(1) If \(\operatorname{rank} A < \operatorname{rank}[A \mid \vec{b}]\), then the system is inconsistent.<br>
(2) If \([A \mid \vec{b}]\) is consistent, then the system contains \(n - \operatorname{rank} A\) free variables. A consistent system has a unique solution if and only if \(\operatorname{rank} A = n\).<br>
(3) \(\operatorname{rank} A = m\) if and only if \([A \mid \vec{b}]\) is consistent for every \(\vec{b} \in \mathbb{R}^m\).

</div>

### Homogeneous Systems

<div class="definition">

<strong>Definition (Homogeneous System).</strong> A system of linear equations is <em>homogeneous</em> if the right-hand side is all zeros, i.e., it has the form \([A \mid \vec{0}]\).

</div>

A homogeneous system is always consistent (the zero vector is always a solution, called the trivial solution).

<div class="theorem">

<strong>Theorem 2.2.4.</strong> The solution set of a homogeneous system of \(m\) linear equations in \(n\) variables is a subspace of \(\mathbb{R}^n\).

</div>

# Chapter 3: Matrices and Linear Mappings

## 3.1 Operations on Matrices

<div class="definition">

<strong>Definition (Matrix).</strong> An \(m \times n\) matrix \(A\) is a rectangular array with \(m\) rows and \(n\) columns. We denote the entry in the \(i\)-th row and \(j\)-th column by \(a_{ij}\). The set of all \(m \times n\) matrices with real entries is denoted \(M_{m \times n}(\mathbb{R})\).

</div>

<div class="definition">

<strong>Definition (Matrix Addition and Scalar Multiplication).</strong> Let \(A, B \in M_{m \times n}(\mathbb{R})\) and \(c \in \mathbb{R}\). Then \((A + B)_{ij} = a_{ij} + b_{ij}\) and \((cA)_{ij} = c \cdot a_{ij}\).

</div>

<div class="theorem">

<strong>Theorem 3.1.1.</strong> Let \(A, B, C\) be \(m \times n\) matrices and \(c_1, c_2 \in \mathbb{R}\). Then \(M_{m \times n}(\mathbb{R})\) satisfies properties V1--V10, with zero matrix \(O_{m,n}\).

</div>

### Transpose

<div class="definition">

<strong>Definition (Transpose).</strong> The <em>transpose</em> of an \(m \times n\) matrix \(A\) is the \(n \times m\) matrix \(A^T\) with \((A^T)_{ij} = a_{ji}\).

</div>

<div class="theorem">

<strong>Theorem 3.1.2.</strong> For \(m \times n\) matrices \(A, B\) and scalar \(c\):<br>
(1) \((A^T)^T = A\).<br>
(2) \((A + B)^T = A^T + B^T\).<br>
(3) \((cA)^T = cA^T\).

</div>

### Matrix-Vector Multiplication

<div class="definition">

<strong>Definition (Matrix-Vector Multiplication, Row View).</strong> Let \(A\) be an \(m \times n\) matrix with rows \(\vec{a}_i^T\). For \(\vec{x} \in \mathbb{R}^n\), \(A\vec{x} = \begin{pmatrix} \vec{a}_1 \cdot \vec{x} \\ \vdots \\ \vec{a}_m \cdot \vec{x} \end{pmatrix}\).

</div>

<div class="definition">

<strong>Definition (Matrix-Vector Multiplication, Column View).</strong> Let \(A\) be an \(m \times n\) matrix with columns \(\vec{a}_1, \ldots, \vec{a}_n\). For \(\vec{x} \in \mathbb{R}^n\), \(A\vec{x} = x_1\vec{a}_1 + \cdots + x_n\vec{a}_n\).

</div>

This shows that \(A\vec{x}\) is always a linear combination of the columns of \(A\).

### Matrix Multiplication

<div class="definition">

<strong>Definition (Matrix Multiplication).</strong> Let \(A\) be \(m \times n\) and \(B = [\vec{b}_1 \cdots \vec{b}_p]\) be \(n \times p\). Then \(AB = [A\vec{b}_1 \cdots A\vec{b}_p]\), an \(m \times p\) matrix with \((AB)_{ij} = \sum_{k=1}^n a_{ik} b_{kj}\).

</div>

<div class="theorem">

<strong>Theorem 3.1.3.</strong> If \(A, B, C\) have correct sizes and \(t \in \mathbb{R}\):<br>
(1) \(A(B + C) = AB + AC\).<br>
(2) \(t(AB) = (tA)B = A(tB)\).<br>
(3) \(A(BC) = (AB)C\).<br>
(4) \((AB)^T = B^T A^T\).

</div>

In general \(AB \neq BA\), and matrix multiplication does not satisfy the cancellation law.

<div class="theorem">

<strong>Theorem 3.1.4.</strong> If \(A\) and \(B\) are \(m \times n\) matrices such that \(A\vec{x} = B\vec{x}\) for every \(\vec{x} \in \mathbb{R}^n\), then \(A = B\).

</div>

### Identity Matrix

<div class="definition">

<strong>Definition (Identity Matrix).</strong> The \(n \times n\) identity matrix \(I_n\) has \((I)_{ii} = 1\) and \((I)_{ij} = 0\) for \(i \neq j\). Its columns are the standard basis vectors of \(\mathbb{R}^n\).

</div>

<div class="theorem">

<strong>Theorem 3.1.5.</strong> Let \(A\) be an \(m \times n\) matrix. Then \(I_m A = A\) and \(A I_n = A\).

</div>

### Block Matrices

<div class="definition">

<strong>Definition (Block Matrix).</strong> An \(m \times n\) matrix \(A\) can be written as a \(k \times \ell\) block matrix where \(A_{ij}\) are submatrices (blocks) such that blocks in the same row have the same number of rows and blocks in the same column have the same number of columns. Block multiplication follows the same formula as ordinary matrix multiplication.

</div>

## 3.2 Linear Mappings

<div class="theorem">

<strong>Theorem 3.2.1.</strong> Let \(A\) be \(m \times n\) and \(f(\vec{x}) = A\vec{x}\). Then for all \(\vec{x}, \vec{y} \in \mathbb{R}^n\) and \(b, c \in \mathbb{R}\), \(f(b\vec{x} + c\vec{y}) = bf(\vec{x}) + cf(\vec{y})\).

</div>

<div class="definition">

<strong>Definition (Linear Mapping).</strong> A function \(L : \mathbb{R}^n \to \mathbb{R}^m\) is a <em>linear mapping</em> if for every \(\vec{x}, \vec{y} \in \mathbb{R}^n\) and \(b, c \in \mathbb{R}\), \(L(b\vec{x} + c\vec{y}) = bL(\vec{x}) + cL(\vec{y})\).

</div>

The key consequence is that if \(\vec{x} = c_1\vec{v}_1 + \cdots + c_k\vec{v}_k\), then \(L(\vec{x}) = c_1 L(\vec{v}_1) + \cdots + c_k L(\vec{v}_k)\).

<div class="theorem">

<strong>Theorem 3.2.2.</strong> Every linear mapping \(L : \mathbb{R}^n \to \mathbb{R}^m\) can be represented as \(L(\vec{x}) = [L]\vec{x}\) where \([L] = [L(\vec{e}_1) \cdots L(\vec{e}_n)]\).

</div>

<div class="definition">

<strong>Definition (Standard Matrix).</strong> The matrix \([L] = [L(\vec{e}_1) \cdots L(\vec{e}_n)]\) is the <em>standard matrix</em> of the linear mapping \(L\).

</div>

<div class="theorem">

<strong>Theorem 3.2.3.</strong> Let \(R_\theta : \mathbb{R}^2 \to \mathbb{R}^2\) be rotation by angle \(\theta\). Then \([R_\theta] = \begin{pmatrix} \cos\theta & -\sin\theta \\ \sin\theta & \cos\theta \end{pmatrix}\), and the columns of this rotation matrix are orthogonal unit vectors.

</div>

## 3.3 Special Subspaces

### Kernel

<div class="definition">

<strong>Definition (Kernel).</strong> Let \(L : \mathbb{R}^n \to \mathbb{R}^m\) be linear. The <em>kernel</em> of \(L\) is \(\ker(L) = \{\vec{x} \in \mathbb{R}^n \mid L(\vec{x}) = \vec{0}\}\).

</div>

<div class="lemma">

<strong>Lemma 3.3.1.</strong> If \(L : \mathbb{R}^n \to \mathbb{R}^m\) is linear, then \(L(\vec{0}) = \vec{0}\).

</div>

<div class="theorem">

<strong>Theorem 3.3.2.</strong> Let \(L : \mathbb{R}^n \to \mathbb{R}^m\) be linear. Then \(\ker(L)\) is a subspace of \(\mathbb{R}^n\).

</div>

### Range

<div class="definition">

<strong>Definition (Range).</strong> Let \(L : \mathbb{R}^n \to \mathbb{R}^m\) be linear. The <em>range</em> of \(L\) is \(R(L) = \{L(\vec{x}) \in \mathbb{R}^m \mid \vec{x} \in \mathbb{R}^n\}\).

</div>

<div class="theorem">

<strong>Theorem 3.3.3.</strong> Let \(L : \mathbb{R}^n \to \mathbb{R}^m\) be linear. Then \(R(L)\) is a subspace of \(\mathbb{R}^m\).

</div>

### Four Fundamental Subspaces

<div class="theorem">

<strong>Theorem 3.3.4.</strong> Let \(L : \mathbb{R}^n \to \mathbb{R}^m\) be linear with standard matrix \(A = [L]\). Then \(\vec{x} \in \ker(L)\) if and only if \(A\vec{x} = \vec{0}\).

</div>

<div class="definition">

<strong>Definition (Nullspace).</strong> Let \(A\) be \(m \times n\). The <em>nullspace</em> of \(A\) is \(\operatorname{Null}(A) = \{\vec{x} \in \mathbb{R}^n \mid A\vec{x} = \vec{0}\}\).

</div>

<div class="theorem">

<strong>Theorem 3.3.5.</strong> A consistent system \(A\vec{x} = \vec{b}\) has a unique solution if and only if \(\operatorname{Null}(A) = \{\vec{0}\}\).

</div>

<div class="theorem">

<strong>Theorem 3.3.6.</strong> Let \(L : \mathbb{R}^n \to \mathbb{R}^m\) with standard matrix \(A = [\vec{a}_1 \cdots \vec{a}_n]\). Then \(R(L) = \operatorname{Span}\{\vec{a}_1, \ldots, \vec{a}_n\}\).

</div>

<div class="definition">

<strong>Definition (Columnspace).</strong> Let \(A = [\vec{a}_1 \cdots \vec{a}_n]\). The <em>columnspace</em> is \(\operatorname{Col}(A) = \operatorname{Span}\{\vec{a}_1, \ldots, \vec{a}_n\} = \{A\vec{x} \in \mathbb{R}^m \mid \vec{x} \in \mathbb{R}^n\}\).

</div>

<div class="theorem">

<strong>Theorem 3.3.7.</strong> Let \(A\) be \(m \times n\). Then \(\operatorname{Col}(A) = \mathbb{R}^m\) if and only if \(\operatorname{rank}(A) = m\).

</div>

<div class="definition">

<strong>Definition (Rowspace).</strong> The <em>rowspace</em> of an \(m \times n\) matrix \(A\) is \(\operatorname{Row}(A) = \{A^T \vec{x} \in \mathbb{R}^n \mid \vec{x} \in \mathbb{R}^m\}\).

</div>

<div class="definition">

<strong>Definition (Left Nullspace).</strong> The <em>left nullspace</em> of \(A\) is \(\operatorname{Null}(A^T) = \{\vec{x} \in \mathbb{R}^m \mid A^T \vec{x} = \vec{0}\}\).

</div>

The nullspace, columnspace, rowspace, and left nullspace are the <em>four fundamental subspaces</em> of a matrix.

<div class="theorem">

<strong>Theorem 3.3.8.</strong> Let \(A\) be \(m \times n\). If \(\vec{a} \in \operatorname{Row}(A)\) and \(\vec{x} \in \operatorname{Null}(A)\), then \(\vec{a} \cdot \vec{x} = 0\).

</div>

<div class="theorem">

<strong>Theorem 3.3.9.</strong> Let \(A\) be \(m \times n\). If \(\vec{a} \in \operatorname{Col}(A)\) and \(\vec{x} \in \operatorname{Null}(A^T)\), then \(\vec{a} \cdot \vec{x} = 0\).

</div>

## 3.4 Operations on Linear Mappings

<div class="definition">

<strong>Definition (Addition and Scalar Multiplication of Mappings).</strong> Let \(L, M : \mathbb{R}^n \to \mathbb{R}^m\) be linear and \(c \in \mathbb{R}\). Define \((L + M)(\vec{x}) = L(\vec{x}) + M(\vec{x})\) and \((cL)(\vec{x}) = cL(\vec{x})\).

</div>

<div class="theorem">

<strong>Theorem 3.4.1.</strong> The set \(\mathcal{L}\) of all linear mappings \(L : \mathbb{R}^n \to \mathbb{R}^m\) satisfies properties V1--V10.

</div>

<div class="theorem">

<strong>Theorem 3.4.2.</strong> For linear mappings \(L, M : \mathbb{R}^n \to \mathbb{R}^m\) and \(c \in \mathbb{R}\), \([L + M] = [L] + [M]\) and \([cL] = c[L]\).

</div>

### Composition

<div class="definition">

<strong>Definition (Composition).</strong> Let \(L : \mathbb{R}^n \to \mathbb{R}^m\) and \(M : \mathbb{R}^m \to \mathbb{R}^p\) be linear. Then \((M \circ L)(\vec{x}) = M(L(\vec{x}))\).

</div>

<div class="theorem">

<strong>Theorem 3.4.3.</strong> If \(L : \mathbb{R}^n \to \mathbb{R}^m\) and \(M : \mathbb{R}^m \to \mathbb{R}^p\) are linear, then \(M \circ L\) is linear and \([M \circ L] = [M][L]\).

</div>

# Chapter 4: Vector Spaces

## 4.1 Vector Spaces

<div class="definition">

<strong>Definition (Vector Space).</strong> A set \(V\) with operations of addition \(\vec{x} + \vec{y}\) and scalar multiplication \(c\vec{x}\) is a <em>vector space over \(\mathbb{R}\)</em> if for any \(\vec{v}, \vec{x}, \vec{y} \in V\) and \(a, b \in \mathbb{R}\):<br>
V1: \(\vec{x} + \vec{y} \in V\); V2: associativity of addition; V3: commutativity of addition; V4: existence of zero vector \(\vec{0}\); V5: existence of additive inverse \(-\vec{x}\); V6: \(a\vec{x} \in V\); V7: \(a(b\vec{x}) = (ab)\vec{x}\); V8: \((a+b)\vec{x} = a\vec{x} + b\vec{x}\); V9: \(a(\vec{x}+\vec{y}) = a\vec{x} + a\vec{y}\); V10: \(1\vec{x} = \vec{x}\).

</div>

<div class="example">

<strong>Examples.</strong> The following are vector spaces: \(\mathbb{R}^n\) and its subspaces; \(M_{m \times n}(\mathbb{R})\); the set of linear mappings \(\mathbb{R}^n \to \mathbb{R}^m\); \(P_n(\mathbb{R})\) (polynomials of degree at most \(n\)); \(C[a,b]\) (continuous functions on \([a,b]\)); the trivial vector space \(\{\vec{0}\}\).

</div>

<div class="theorem">

<strong>Theorem 4.1.1.</strong> Let \(V\) be a vector space. Then:<br>
(1) \(0\vec{x} = \vec{0}\) for all \(\vec{x} \in V\).<br>
(2) \(-\vec{x} = (-1)\vec{x}\) for all \(\vec{x} \in V\).

</div>

### Subspaces of Vector Spaces

<div class="definition">

<strong>Definition (Subspace).</strong> Let \(V\) be a vector space. If \(S \subseteq V\) and \(S\) is a vector space under the same operations as \(V\), then \(S\) is a <em>subspace</em> of \(V\).

</div>

<div class="theorem">

<strong>Theorem 4.1.2 (Subspace Test).</strong> Let \(S\) be a non-empty subset of a vector space \(V\). If \(\vec{x} + \vec{y} \in S\) and \(c\vec{x} \in S\) for all \(\vec{x}, \vec{y} \in S\) and \(c \in \mathbb{R}\), then \(S\) is a subspace of \(V\).

</div>

### Spanning and Linear Independence in Vector Spaces

<div class="definition">

<strong>Definition (Span in a Vector Space).</strong> Let \(B = \{\vec{v}_1, \ldots, \vec{v}_k\}\) be a set of vectors in a vector space \(V\). Then \(\operatorname{Span} B = \{c_1\vec{v}_1 + \cdots + c_k\vec{v}_k \mid c_1, \ldots, c_k \in \mathbb{R}\}\).

</div>

<div class="theorem">

<strong>Theorem 4.1.3.</strong> Let \(B = \{\vec{v}_1, \ldots, \vec{v}_k\}\) be a set of vectors in a vector space \(V\). Then \(\operatorname{Span} B\) is a subspace of \(V\).

</div>

<div class="definition">

<strong>Definition (Linear Dependence/Independence in a Vector Space).</strong> A set \(\{\vec{v}_1, \ldots, \vec{v}_k\}\) in a vector space \(V\) is <em>linearly dependent</em> if there exist \(c_1, \ldots, c_k\), not all zero, with \(\vec{0} = c_1\vec{v}_1 + \cdots + c_k\vec{v}_k\). It is <em>linearly independent</em> if the only solution is the trivial one.

</div>

<div class="theorem">

<strong>Theorem 4.1.4.</strong> Any set of vectors containing the zero vector is linearly dependent.

</div>

## 4.2 Bases and Dimension

<div class="theorem">

<strong>Theorem 4.2.1.</strong> If \(\vec{v}_i \in \operatorname{Span}\{\vec{v}_1, \ldots, \vec{v}_{i-1}, \vec{v}_{i+1}, \ldots, \vec{v}_k\}\), then \(\operatorname{Span}\{\vec{v}_1, \ldots, \vec{v}_k\} = \operatorname{Span}\{\vec{v}_1, \ldots, \vec{v}_{i-1}, \vec{v}_{i+1}, \ldots, \vec{v}_k\}\).

</div>

<div class="theorem">

<strong>Theorem 4.2.2.</strong> If \(\vec{v}_i \notin \operatorname{Span}\{\vec{v}_1, \ldots, \vec{v}_{i-1}, \vec{v}_{i+1}, \ldots, \vec{v}_k\}\) for \(1 \leq i \leq k\), then \(\{\vec{v}_1, \ldots, \vec{v}_k\}\) is linearly independent.

</div>

<div class="definition">

<strong>Definition (Basis).</strong> Let \(V\) be a vector space. The set \(B\) is a <em>basis</em> for \(V\) if \(B\) is a linearly independent spanning set for \(V\).

</div>

A basis is both a minimal spanning set and a maximal linearly independent set.

### Dimension

<div class="theorem">

<strong>Theorem 4.2.3.</strong> Let \(B = \{\vec{v}_1, \ldots, \vec{v}_n\}\) be a basis for \(V\), and let \(\{\vec{w}_1, \ldots, \vec{w}_k\}\) be a linearly independent set in \(V\). Then \(k \leq n\).

</div>

<div class="theorem">

<strong>Theorem 4.2.4.</strong> If \(\{\vec{v}_1, \ldots, \vec{v}_n\}\) and \(\{\vec{w}_1, \ldots, \vec{w}_k\}\) are both bases for \(V\), then \(k = n\).

</div>

<div class="definition">

<strong>Definition (Dimension).</strong> If \(\{\vec{v}_1, \ldots, \vec{v}_n\}\) is a basis for \(V\), then the <em>dimension</em> of \(V\) is \(\dim V = n\). The trivial vector space has dimension 0 (its basis is the empty set). A vector space that has no finite basis is infinite-dimensional.

</div>

<div class="theorem">

<strong>Theorem 4.2.5.</strong> Let \(V\) be an \(n\)-dimensional vector space. Then:<br>
(1) A set of more than \(n\) vectors in \(V\) must be linearly dependent.<br>
(2) A set of fewer than \(n\) vectors in \(V\) cannot span \(V\).<br>
(3) A set of \(n\) vectors in \(V\) is linearly independent if and only if it spans \(V\).

</div>

<div class="theorem">

<strong>Theorem 4.2.6 (Extension Theorem).</strong> Let \(V\) be \(n\)-dimensional and \(\{\vec{v}_1, \ldots, \vec{v}_k\}\) be linearly independent with \(k < n\). Then there exist vectors \(\vec{w}_{k+1}, \ldots, \vec{w}_n\) such that \(\{\vec{v}_1, \ldots, \vec{v}_k, \vec{w}_{k+1}, \ldots, \vec{w}_n\}\) is a basis for \(V\).

</div>

<div class="remark">

<strong>Standard dimensions.</strong> \(\dim \mathbb{R}^n = n\); \(\dim M_{m \times n}(\mathbb{R}) = mn\); \(\dim P_n(\mathbb{R}) = n + 1\).

</div>

## 4.3 Coordinates

<div class="theorem">

<strong>Theorem 4.3.1.</strong> Let \(B = \{\vec{v}_1, \ldots, \vec{v}_n\}\) be a basis for \(V\). Then every \(\vec{v} \in V\) can be represented as a <em>unique</em> linear combination of \(\vec{v}_1, \ldots, \vec{v}_n\).

</div>

<div class="definition">

<strong>Definition (Coordinate Vector).</strong> Let \(V\) be a vector space with basis \(B = \{\vec{v}_1, \ldots, \vec{v}_n\}\). For \(\vec{v} = b_1\vec{v}_1 + \cdots + b_n\vec{v}_n\), the <em>coordinate vector</em> of \(\vec{v}\) with respect to \(B\) is \([\vec{v}]_B = \begin{pmatrix} b_1 \\ \vdots \\ b_n \end{pmatrix}\).

</div>

<div class="theorem">

<strong>Theorem 4.3.2.</strong> Let \(B = \{\vec{v}_1, \ldots, \vec{v}_n\}\) be a basis for \(V\). Then for any \(\vec{v}, \vec{w} \in V\) and \(s, t \in \mathbb{R}\), \([s\vec{v} + t\vec{w}]_B = s[\vec{v}]_B + t[\vec{w}]_B\).

</div>

### Change of Coordinates

<div class="definition">

<strong>Definition (Change of Coordinates Matrix).</strong> Let \(B = \{\vec{v}_1, \ldots, \vec{v}_n\}\) and \(C\) both be bases for \(V\). The <em>change of coordinates matrix</em> from \(B\)-coordinates to \(C\)-coordinates is \({}_C P_B = [[\vec{v}_1]_C \cdots [\vec{v}_n]_C]\), and \([\vec{x}]_C = {}_C P_B [\vec{x}]_B\).

</div>

<div class="theorem">

<strong>Theorem 4.3.3.</strong> Let \(B\) and \(C\) be bases for an \(n\)-dimensional vector space \(V\). Then \({}_C P_B \cdot {}_B P_C = I = {}_B P_C \cdot {}_C P_B\).

</div>

# Chapter 5: Inverses and Determinants

## 5.1 Matrix Inverses

<div class="definition">

<strong>Definition (Left and Right Inverse).</strong> Let \(A\) be \(m \times n\). If \(B\) is \(n \times m\) with \(AB = I_m\), then \(B\) is a <em>right inverse</em> of \(A\). If \(CA = I_n\), then \(C\) is a <em>left inverse</em> of \(A\).

</div>

<div class="theorem">

<strong>Theorem 5.1.1.</strong> If \(A\) is \(m \times n\) with \(m > n\), then \(A\) cannot have a right inverse.

</div>

<div class="corollary">

<strong>Corollary 5.1.2.</strong> If \(A\) is \(m \times n\) with \(m < n\), then \(A\) cannot have a left inverse.

</div>

<div class="theorem">

<strong>Theorem 5.1.3.</strong> Let \(A, B, C\) be \(n \times n\) matrices with \(AB = I = CA\). Then \(B = C\).

</div>

<div class="definition">

<strong>Definition (Inverse / Invertible).</strong> Let \(A\) be \(n \times n\). If \(B\) satisfies \(AB = I = BA\), then \(B = A^{-1}\) is the <em>inverse</em> of \(A\), and \(A\) is <em>invertible</em>.

</div>

<div class="theorem">

<strong>Theorem 5.1.4.</strong> If \(A\) is \(n \times n\) and there exists \(B\) with \(AB = I\), then \(\operatorname{rank} A = n = \operatorname{rank} B\) and \(BA = I\). Hence \(A\) is invertible.

</div>

<div class="theorem">

<strong>Theorem 5.1.5.</strong> Let \(A, B\) be invertible and \(c \neq 0\). Then:<br>
(1) \((cA)^{-1} = \frac{1}{c}A^{-1}\).<br>
(2) \((A^T)^{-1} = (A^{-1})^T\).<br>
(3) \((AB)^{-1} = B^{-1}A^{-1}\).

</div>

<div class="theorem">

<strong>Theorem 5.1.6.</strong> If \(A\) is \(n \times n\) with \(\operatorname{rank} A = n\), then \(A\) is invertible. Moreover, \([A \mid I] \sim [I \mid A^{-1}]\).

</div>

### Invertible Matrix Theorem

<div class="theorem">

<strong>Theorem 5.1.7 (Invertible Matrix Theorem).</strong> For an \(n \times n\) matrix \(A\), the following are equivalent:<br>
(1) \(A\) is invertible.<br>
(2) The RREF of \(A\) is \(I\).<br>
(3) \(\operatorname{rank} A = n\).<br>
(4) \(A\vec{x} = \vec{b}\) is consistent with a unique solution for all \(\vec{b} \in \mathbb{R}^n\).<br>
(5) \(\operatorname{Null}(A) = \{\vec{0}\}\).<br>
(6) The columns of \(A\) form a basis for \(\mathbb{R}^n\).<br>
(7) The rows of \(A\) form a basis for \(\mathbb{R}^n\).<br>
(8) \(A^T\) is invertible.

</div>

If \(A\) is invertible, the unique solution to \(A\vec{x} = \vec{b}\) is \(\vec{x} = A^{-1}\vec{b}\).

## 5.2 Elementary Matrices

<div class="definition">

<strong>Definition (Elementary Matrix).</strong> An \(n \times n\) matrix \(E\) is an <em>elementary matrix</em> if it can be obtained from \(I\) by performing exactly one elementary row operation.

</div>

Every elementary matrix is invertible; its inverse is the elementary matrix corresponding to the reverse row operation.

<div class="theorem">

<strong>Theorem 5.2.1.</strong> Let \(E\) be the elementary matrix for \(R_i + cR_j\). Then \(EA\) is the matrix obtained from \(A\) by performing \(R_i + cR_j\) on \(A\).

</div>

<div class="theorem">

<strong>Theorem 5.2.2.</strong> Let \(E\) be the elementary matrix for \(cR_i\). Then \(EA\) is obtained from \(A\) by performing \(cR_i\).

</div>

<div class="theorem">

<strong>Theorem 5.2.3.</strong> Let \(E\) be the elementary matrix for \(R_i \leftrightarrow R_j\). Then \(EA\) is obtained from \(A\) by swapping rows \(i\) and \(j\).

</div>

<div class="corollary">

<strong>Corollary 5.2.4.</strong> If \(E\) is an \(m \times m\) elementary matrix and \(A\) is \(m \times n\), then \(\operatorname{rank}(EA) = \operatorname{rank} A\).

</div>

<div class="theorem">

<strong>Theorem 5.2.5.</strong> For any \(m \times n\) matrix \(A\), there exist elementary matrices \(E_1, \ldots, E_k\) such that \(E_k \cdots E_1 A = R\) where \(R\) is the RREF of \(A\).

</div>

<div class="corollary">

<strong>Corollary 5.2.6.</strong> If \(A\) is an \(n \times n\) invertible matrix, then both \(A\) and \(A^{-1}\) can be written as products of elementary matrices.

</div>

<div class="theorem">

<strong>Theorem 5.2.7.</strong> If \(E\) is an elementary matrix, then \(E^T\) is also an elementary matrix.

</div>

## 5.3 Determinants

<div class="definition">

<strong>Definition (\(2 \times 2\) Determinant).</strong> For \(A = \begin{pmatrix} a & b \\ c & d \end{pmatrix}\), \(\det A = ad - bc\).

</div>

<div class="definition">

<strong>Definition (Cofactor).</strong> Let \(A\) be \(n \times n\) with \(n \geq 2\). Let \(A(i,j)\) be the \((n-1) \times (n-1)\) matrix obtained by deleting the \(i\)-th row and \(j\)-th column. The cofactor of \(a_{ij}\) is \(C_{ij} = (-1)^{i+j} \det A(i,j)\).

</div>

<div class="definition">

<strong>Definition (\(n \times n\) Determinant).</strong> For an \(n \times n\) matrix \(A\) with \(n \geq 2\), \(\det A = \sum_{i=1}^n a_{i1} C_{i1}\), where \(\det[c] = c\) for \(1 \times 1\) matrices.

</div>

<div class="theorem">

<strong>Theorem 5.3.1 (Cofactor Expansion).</strong> For any \(n \times n\) matrix \(A\), \(\det A = \sum_{k=1}^n a_{ik} C_{ik}\) (expansion along the \(i\)-th row) or \(\det A = \sum_{k=1}^n a_{kj} C_{kj}\) (expansion along the \(j\)-th column).

</div>

### Triangular Matrices

<div class="definition">

<strong>Definition (Upper/Lower Triangular).</strong> An \(m \times n\) matrix \(U\) is <em>upper triangular</em> if \(u_{ij} = 0\) for \(i > j\). A matrix \(L\) is <em>lower triangular</em> if \(l_{ij} = 0\) for \(i < j\).

</div>

<div class="theorem">

<strong>Theorem 5.3.2.</strong> If \(A\) is an \(n \times n\) upper or lower triangular matrix, then \(\det A = a_{11} a_{22} \cdots a_{nn}\).

</div>

### Determinants and Row Operations

<div class="theorem">

<strong>Theorem 5.3.3.</strong> If \(B\) is obtained from \(A\) by multiplying one row by \(c\), then \(\det B = c \det A\).

</div>

<div class="theorem">

<strong>Theorem 5.3.4.</strong> If \(B\) is obtained from \(A\) by swapping two rows, then \(\det B = -\det A\).

</div>

<div class="corollary">

<strong>Corollary 5.3.5.</strong> If \(A\) has two identical rows, then \(\det A = 0\).

</div>

<div class="theorem">

<strong>Theorem 5.3.6.</strong> If \(B\) is obtained from \(A\) by adding a multiple of one row to another, then \(\det B = \det A\).

</div>

<div class="corollary">

<strong>Corollary 5.3.7.</strong> If \(E\) is an \(n \times n\) elementary matrix and \(A\) is \(n \times n\), then \(\det(EA) = \det E \cdot \det A\).

</div>

<div class="theorem">

<strong>Theorem 5.3.8 (Addition to IMT).</strong> An \(n \times n\) matrix \(A\) is invertible if and only if \(\det A \neq 0\).

</div>

<div class="theorem">

<strong>Theorem 5.3.9.</strong> If \(A\) and \(B\) are \(n \times n\), then \(\det(AB) = \det A \cdot \det B\).

</div>

<div class="corollary">

<strong>Corollary 5.3.10.</strong> If \(A\) is invertible, then \(\det A^{-1} = \frac{1}{\det A}\).

</div>

<div class="theorem">

<strong>Theorem 5.3.11.</strong> For any \(n \times n\) matrix \(A\), \(\det A = \det A^T\).

</div>

## 5.4 Determinants and Systems of Equations

### Inverse by Cofactors

<div class="lemma">

<strong>Lemma 5.4.1.</strong> Let \(A\) be \(n \times n\) with cofactors \(C_{ij}\). Then \(\sum_{k=1}^n a_{ik} C_{jk} = 0\) for \(i \neq j\).

</div>

<div class="theorem">

<strong>Theorem 5.4.2.</strong> If \(A\) is invertible, then \((A^{-1})_{ij} = \frac{1}{\det A} C_{ji}\).

</div>

<div class="definition">

<strong>Definition (Cofactor Matrix).</strong> The <em>cofactor matrix</em> \(\operatorname{cof} A\) has \((\operatorname{cof} A)_{ij} = C_{ij}\).

</div>

<div class="definition">

<strong>Definition (Adjugate).</strong> The <em>adjugate</em> of \(A\) is \(\operatorname{adj} A = (\operatorname{cof} A)^T\), and \(A^{-1} = \frac{1}{\det A} \operatorname{adj} A\).

</div>

### Cramer's Rule

<div class="theorem">

<strong>Theorem 5.4.3 (Cramer's Rule).</strong> If \(A\) is invertible, the solution of \(A\vec{x} = \vec{b}\) is given by \(x_i = \frac{\det A_i}{\det A}\), where \(A_i\) is the matrix obtained from \(A\) by replacing its \(i\)-th column with \(\vec{b}\).

</div>

## 5.5 Area and Volume

The determinant has a geometric interpretation. For vectors \(\vec{u}, \vec{v} \in \mathbb{R}^2\), the area of the parallelogram they induce is \(|\det[\vec{u}\ \vec{v}]|\). For \(\vec{u}, \vec{v}, \vec{w} \in \mathbb{R}^3\), the volume of the parallelepiped is \(|\det[\vec{u}\ \vec{v}\ \vec{w}]|\).

<div class="remark">

<strong>Remark.</strong> More generally, if \(\vec{v}_1, \ldots, \vec{v}_n \in \mathbb{R}^n\), the \(n\)-volume of the parallelotope they induce is \(|\det[\vec{v}_1 \cdots \vec{v}_n]|\).

</div>

# Chapter 6: Diagonalization

## 6.1 Matrix of a Linear Mapping and Similar Matrices

<div class="definition">

<strong>Definition (B-Matrix).</strong> Let \(B = \{\vec{v}_1, \ldots, \vec{v}_n\}\) be a basis for \(\mathbb{R}^n\) and \(L : \mathbb{R}^n \to \mathbb{R}^n\) a linear operator. The <em>\(B\)-matrix</em> of \(L\) is \([L]_B = [[L(\vec{v}_1)]_B \cdots [L(\vec{v}_n)]_B]\), satisfying \([L(\vec{x})]_B = [L]_B [\vec{x}]_B\).

</div>

If \(P = [\vec{v}_1 \cdots \vec{v}_n]\) is the change of coordinates matrix from \(B\) to the standard basis, then \([L]_B = P^{-1}[L]P\).

<div class="definition">

<strong>Definition (Diagonal Matrix).</strong> An \(n \times n\) matrix \(D\) is <em>diagonal</em> if \(d_{ij} = 0\) for \(i \neq j\). We write \(D = \operatorname{diag}(d_{11}, \ldots, d_{nn})\).

</div>

### Similar Matrices

<div class="theorem">

<strong>Theorem 6.1.1.</strong> Let \(A\) and \(B\) be \(n \times n\) with \(P^{-1}AP = B\) for some invertible \(P\). Then:<br>
(1) \(\operatorname{rank} A = \operatorname{rank} B\).<br>
(2) \(\det A = \det B\).<br>
(3) \(\operatorname{tr} A = \operatorname{tr} B\), where \(\operatorname{tr} A = \sum_{i=1}^n a_{ii}\).

</div>

<div class="definition">

<strong>Definition (Similar Matrices).</strong> Matrices \(A\) and \(B\) are <em>similar</em> if there exists an invertible \(P\) with \(P^{-1}AP = B\).

</div>

## 6.2 Eigenvalues and Eigenvectors

If \(A\) is diagonalizable with \(P^{-1}AP = D = \operatorname{diag}(\lambda_1, \ldots, \lambda_n)\), then the columns \(\vec{v}_i\) of \(P\) satisfy \(A\vec{v}_i = \lambda_i \vec{v}_i\) with \(\vec{v}_i \neq \vec{0}\).

<div class="definition">

<strong>Definition (Eigenvalue, Eigenvector, Eigenpair).</strong> Let \(A\) be \(n \times n\). If \(A\vec{v} = \lambda\vec{v}\) for some \(\vec{v} \neq \vec{0}\), then \(\lambda\) is an <em>eigenvalue</em>, \(\vec{v}\) is an <em>eigenvector</em>, and \((\lambda, \vec{v})\) is an <em>eigenpair</em>.

</div>

<div class="definition">

<strong>Definition (Eigenvalues/Eigenvectors of a Linear Operator).</strong> Let \(L : \mathbb{R}^n \to \mathbb{R}^n\) be a linear operator. If \(L(\vec{v}) = \lambda\vec{v}\) for \(\vec{v} \neq \vec{0}\), then \(\lambda\) is an eigenvalue and \(\vec{v}\) an eigenvector of \(L\).

</div>

To find eigenvalues, we solve \((A - \lambda I)\vec{v} = \vec{0}\); for non-trivial solutions we need \(\det(A - \lambda I) = 0\).

<div class="definition">

<strong>Definition (Characteristic Polynomial).</strong> The <em>characteristic polynomial</em> of an \(n \times n\) matrix \(A\) is \(C(\lambda) = \det(A - \lambda I)\).

</div>

<div class="theorem">

<strong>Theorem 6.2.1.</strong> A scalar \(\lambda\) is an eigenvalue of \(A\) if and only if \(C(\lambda) = 0\).

</div>

<div class="definition">

<strong>Definition (Eigenspace).</strong> The <em>eigenspace</em> of the eigenvalue \(\lambda\) is \(E_\lambda = \operatorname{Null}(A - \lambda I)\).

</div>

<div class="definition">

<strong>Definition (Algebraic and Geometric Multiplicity).</strong> If \(C(\lambda) = (\lambda - \lambda_1)^k C_1(\lambda)\) with \(C_1(\lambda_1) \neq 0\), then the <em>algebraic multiplicity</em> is \(a_{\lambda_1} = k\). The <em>geometric multiplicity</em> is \(g_{\lambda_1} = \dim(E_{\lambda_1})\).

</div>

<div class="lemma">

<strong>Lemma 6.2.2.</strong> If \(A\) and \(B\) are similar, they have the same characteristic polynomial and hence the same eigenvalues.

</div>

<div class="theorem">

<strong>Theorem 6.2.3.</strong> For any eigenvalue \(\lambda_1\) of \(A\), \(1 \leq g_{\lambda_1} \leq a_{\lambda_1}\).

</div>

## 6.3 Diagonalization

<div class="definition">

<strong>Definition (Diagonalizable).</strong> An \(n \times n\) matrix \(A\) is <em>diagonalizable</em> if \(A\) is similar to a diagonal matrix \(D\). If \(P^{-1}AP = D\), then \(P\) <em>diagonalizes</em> \(A\).

</div>

<div class="lemma">

<strong>Lemma 6.3.1.</strong> Let \(A\) have eigenpairs \((\lambda_1, \vec{v}_1), \ldots, (\lambda_k, \vec{v}_k)\) with \(\lambda_i \neq \lambda_j\) for \(i \neq j\). Then \(\{\vec{v}_1, \ldots, \vec{v}_k\}\) is linearly independent.

</div>

<div class="theorem">

<strong>Theorem 6.3.2.</strong> Let \(A\) have distinct eigenvalues \(\lambda_1, \ldots, \lambda_k\), and let \(B_i\) be a basis for \(E_{\lambda_i}\). Then \(B_1 \cup \cdots \cup B_k\) is a linearly independent set.

</div>

<div class="corollary">

<strong>Corollary 6.3.3.</strong> An \(n \times n\) matrix \(A\) with distinct eigenvalues \(\lambda_1, \ldots, \lambda_k\) is diagonalizable if and only if \(g_{\lambda_i} = a_{\lambda_i}\) for all \(1 \leq i \leq k\).

</div>

<div class="corollary">

<strong>Corollary 6.3.4.</strong> An \(n \times n\) matrix with \(n\) distinct eigenvalues is diagonalizable.

</div>

The diagonalization algorithm: (1) Factor \(C(\lambda)\). (2) If any root is complex, \(A\) is not diagonalizable over \(\mathbb{R}\). (3) Find a basis for each eigenspace. (4) If \(g_\lambda < a_\lambda\) for any eigenvalue, \(A\) is not diagonalizable. Otherwise, form \(P\) from the eigenvectors and \(D = \operatorname{diag}(\lambda_1, \ldots, \lambda_n)\).

## 6.4 Powers of Matrices

<div class="theorem">

<strong>Theorem 6.4.1.</strong> If \(P^{-1}AP = D\) for a diagonal matrix \(D\), then \(A^k = P D^k P^{-1}\) for any positive integer \(k\).

</div>

Since \(D^k = \operatorname{diag}(d_1^k, \ldots, d_n^k)\), this makes computing large powers of diagonalizable matrices very efficient.

<div class="example">

<strong>Example.</strong> For \(A = \begin{pmatrix} 1 & 2 \\ -1 & 4 \end{pmatrix}\), the eigenvalues are \(\lambda_1 = 2\) and \(\lambda_2 = 3\), giving \(P = \begin{pmatrix} 2 & 1 \\ 1 & 1 \end{pmatrix}\) and \(D = \begin{pmatrix} 2 & 0 \\ 0 & 3 \end{pmatrix}\). Then \(A^{1000} = P \begin{pmatrix} 2^{1000} & 0 \\ 0 & 3^{1000} \end{pmatrix} P^{-1} = \begin{pmatrix} 2^{1001} - 3^{1000} & -2^{1001} + 2 \cdot 3^{1000} \\ 2^{1000} - 3^{1000} & -2^{1000} + 2 \cdot 3^{1000} \end{pmatrix}\).

</div>
