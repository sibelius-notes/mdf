---
title: "MATH 237: Calculus 3 for Honours Mathematics"
subjects: "MATH"
---

# Chapter 1: Graphs of Scalar Functions

## 1.1 Scalar Functions

A scalar function maps points in \(\mathbb{R}^n\) to the real line. The domain \(D(f)\) is the subset of \(\mathbb{R}^n\) where \(f\) is defined, and the range \(R(f)\) is the set of output values. For \(f : \mathbb{R}^2 \to \mathbb{R}\), we write \(z = f(x,y)\).

<div class="definition">

<strong>Definition (Scalar Function).</strong> A scalar function \(f : \mathbb{R}^n \to \mathbb{R}\) is a function whose domain is a subset of \(\mathbb{R}^n\) and whose range is a subset of \(\mathbb{R}\).

</div>

We use \(\mathbf{x}\) to denote a point in \(\mathbb{R}^n\). For instance, \(\mathbf{a} \in \mathbb{R}^2\) means \(\mathbf{a} = (a,b)\) and \(\mathbf{x} \in \mathbb{R}^3\) means \(\mathbf{x} = (x,y,z)\).

## 1.2 Geometric Interpretation of \(z = f(x,y)\)

The graph of \(f : \mathbb{R}^2 \to \mathbb{R}\) is the set of all points \((a, b, f(a,b))\) in \(\mathbb{R}^3\) with \((a,b) \in D(f)\). We think of \(f(a,b)\) as the height of the surface above \((a,b)\).

<div class="definition">

<strong>Definition (Level Curves).</strong> For a function \(f : \mathbb{R}^2 \to \mathbb{R}\), the level curves of \(f\) are the curves \(k = f(x,y)\), where \(k\) is a constant in the range of \(f\).

</div>

<div class="definition">

<strong>Definition (Cross-Sections).</strong> The cross-sections of a surface \(z = f(x,y)\) are the curves given by \(z = f(c, y)\) or \(z = f(x, d)\).

</div>

For a function \(f : \mathbb{R}^3 \to \mathbb{R}\), the equations \(f(x,y,z) = k\) define the level surfaces of \(f\). More generally, for \(f : \mathbb{R}^n \to \mathbb{R}\), the equations \(f(\mathbf{x}) = k\) are the level sets of \(f\).

---

# Chapter 2: Limits

## 2.1 Definition of a Limit

We generalize the single-variable limit concept to functions of several variables. The key idea is that we can now approach a point from infinitely many directions, not just from left and right.

<div class="definition">

<strong>Definition (Neighborhood).</strong> A neighborhood of a point \(\mathbf{a} \in \mathbb{R}^2\) is the set \(N_r(\mathbf{a}) = \{\mathbf{x} \in \mathbb{R}^2 \mid \|\mathbf{x} - \mathbf{a}\| < r\}\), where \(\|\mathbf{x} - \mathbf{a}\| = \sqrt{(x-a)^2 + (y-b)^2}\).

</div>

<div class="definition">

<strong>Definition (Limit).</strong> Let \(f : \mathbb{R}^2 \to \mathbb{R}\). If \(f\) is defined in a neighborhood of \(\mathbf{a} \in \mathbb{R}^2\), except possibly at \(\mathbf{a}\), then \(\displaystyle\lim_{\mathbf{x} \to \mathbf{a}} f(\mathbf{x}) = L\) means that for every \(\varepsilon > 0\), there exists a \(\delta > 0\) such that for all \(\mathbf{x}\) in the domain of \(f\),
\[
|f(\mathbf{x}) - L| < \varepsilon \quad \text{whenever} \quad 0 < \|\mathbf{x} - \mathbf{a}\| < \delta.
\]

</div>

## 2.2 Limit Theorems

<div class="theorem">

<strong>Theorem 2.1 (Limit Laws).</strong> Let \(f, g : \mathbb{R}^2 \to \mathbb{R}\). If \(\displaystyle\lim_{\mathbf{x}\to\mathbf{a}} f(\mathbf{x})\) and \(\displaystyle\lim_{\mathbf{x}\to\mathbf{a}} g(\mathbf{x})\) both exist, then

(a) \(\displaystyle\lim_{\mathbf{x}\to\mathbf{a}} [f(\mathbf{x}) + g(\mathbf{x})] = \lim_{\mathbf{x}\to\mathbf{a}} f(\mathbf{x}) + \lim_{\mathbf{x}\to\mathbf{a}} g(\mathbf{x})\).

(b) \(\displaystyle\lim_{\mathbf{x}\to\mathbf{a}} [f(\mathbf{x})g(\mathbf{x})] = \left(\lim_{\mathbf{x}\to\mathbf{a}} f(\mathbf{x})\right)\left(\lim_{\mathbf{x}\to\mathbf{a}} g(\mathbf{x})\right)\).

(c) \(\displaystyle\lim_{\mathbf{x}\to\mathbf{a}} \frac{f(\mathbf{x})}{g(\mathbf{x})} = \frac{\lim_{\mathbf{x}\to\mathbf{a}} f(\mathbf{x})}{\lim_{\mathbf{x}\to\mathbf{a}} g(\mathbf{x})}\), provided \(\displaystyle\lim_{\mathbf{x}\to\mathbf{a}} g(\mathbf{x}) \neq 0\).

</div>

<div class="corollary">

<strong>Corollary 2.1 (Uniqueness of Limits).</strong> If \(\displaystyle\lim_{\mathbf{x}\to\mathbf{a}} f(\mathbf{x})\) exists, then the limit is unique.

</div>

## 2.3 Proving a Limit Does Not Exist

To show a limit does not exist, approach the point along two different paths that yield different limiting values. Common strategies include testing along lines \(y = mx\) (showing the result depends on \(m\)) or along curves like \(y = x^2\).

## 2.4 Proving a Limit Exists

<div class="theorem">

<strong>Theorem 2.2 (Squeeze Theorem).</strong> For \(f : \mathbb{R}^2 \to \mathbb{R}\), if there exists a function \(B(\mathbf{x})\) such that \(|f(\mathbf{x}) - L| \leq B(\mathbf{x})\) for all \(\mathbf{x} \neq \mathbf{a}\) in some neighborhood of \(\mathbf{a}\), and \(\displaystyle\lim_{\mathbf{x}\to\mathbf{a}} B(\mathbf{x}) = 0\), then \(\displaystyle\lim_{\mathbf{x}\to\mathbf{a}} f(\mathbf{x}) = L\).

</div>

The most commonly used inequalities when applying the Squeeze Theorem are: the Triangle Inequality, the fact that \(a < a + c\) for \(c > 0\), and the cosine inequality \(2|x||y| \leq x^2 + y^2\). A particularly useful consequence is \(|x| = \sqrt{x^2} \leq \sqrt{x^2 + y^2}\).

All definitions and theorems in this chapter generalize to \(f : \mathbb{R}^n \to \mathbb{R}\) by replacing \(\mathbb{R}^2\) with \(\mathbb{R}^n\) and using the Euclidean distance \(\|\mathbf{x} - \mathbf{a}\| = \sqrt{(x_1 - a_1)^2 + \cdots + (x_n - a_n)^2}\).

---

# Chapter 3: Continuous Functions

## 3.1 Definition of a Continuous Function

<div class="definition">

<strong>Definition (Continuous Function).</strong> A function \(f : \mathbb{R}^2 \to \mathbb{R}\) is continuous at \(\mathbf{a}\) if and only if
\[
\lim_{\mathbf{x}\to\mathbf{a}} f(\mathbf{x}) = f(\mathbf{a}).
\]
If \(f\) is continuous at every point in a set \(D \subset \mathbb{R}^2\), then \(f\) is continuous on \(D\).

</div>

This definition implicitly requires three things: (1) \(\displaystyle\lim_{\mathbf{x}\to\mathbf{a}} f(\mathbf{x})\) exists, (2) \(f\) is defined at \(\mathbf{a}\), and (3) the two values are equal.

## 3.2 The Continuity Theorems

<div class="definition">

<strong>Definition (Operations on Functions).</strong> Let \(f, g : \mathbb{R}^2 \to \mathbb{R}\) and \(\mathbf{x} \in D(f) \cap D(g)\). Then:

1. The sum: \((f+g)(\mathbf{x}) = f(\mathbf{x}) + g(\mathbf{x})\).
2. The product: \((fg)(\mathbf{x}) = f(\mathbf{x})g(\mathbf{x})\).
3. The quotient: \(\left(\frac{f}{g}\right)(\mathbf{x}) = \frac{f(\mathbf{x})}{g(\mathbf{x})}\), if \(g(\mathbf{x}) \neq 0\).

</div>

<div class="definition">

<strong>Definition (Composite Function).</strong> Let \(g : \mathbb{R} \to \mathbb{R}\) and \(f : \mathbb{R}^2 \to \mathbb{R}\). The composite function \(g \circ f : \mathbb{R}^2 \to \mathbb{R}\) is defined by \((g \circ f)(\mathbf{x}) = g(f(\mathbf{x}))\) for all \(\mathbf{x}\) such that \(f(\mathbf{x}) \in D(g)\).

</div>

<div class="theorem">

<strong>Theorem 3.1 (Sum and Product).</strong> If \(f : \mathbb{R}^2 \to \mathbb{R}\) and \(g : \mathbb{R}^2 \to \mathbb{R}\) are continuous at \(\mathbf{a}\), then \(f + g\) and \(fg\) are continuous at \(\mathbf{a}\).

</div>

<div class="theorem">

<strong>Theorem 3.2 (Quotient).</strong> If \(f : \mathbb{R}^2 \to \mathbb{R}\) and \(g : \mathbb{R}^2 \to \mathbb{R}\) are both continuous at \(\mathbf{a}\) and \(g(\mathbf{a}) \neq 0\), then the quotient \(\frac{f}{g}\) is continuous at \(\mathbf{a}\).

</div>

<div class="theorem">

<strong>Theorem 3.3 (Composition).</strong> If \(f : \mathbb{R}^2 \to \mathbb{R}\) is continuous at \(\mathbf{a}\) and \(g : \mathbb{R} \to \mathbb{R}\) is continuous at \(f(\mathbf{a})\), then the composition \(g \circ f\) is continuous at \(\mathbf{a}\).

</div>

The following basic functions are known to be continuous on their domains: constants, coordinate functions \(x\) and \(y\), \(\ln(\cdot)\), \(e^{(\cdot)}\), trigonometric and inverse trigonometric functions, and the absolute value. These, combined with the theorems above, allow one to prove continuity of complicated functions "by inspection."

---

# Chapter 4: The Linear Approximation

## 4.1 Partial Derivatives

<div class="definition">

<strong>Definition (Partial Derivatives).</strong> Let \(f : \mathbb{R}^2 \to \mathbb{R}\). The partial derivatives of \(f\) at \((a,b)\) are defined by
\[
\frac{\partial f}{\partial x}(a,b) = \lim_{h \to 0} \frac{f(a+h,b) - f(a,b)}{h}, \qquad \frac{\partial f}{\partial y}(a,b) = \lim_{h \to 0} \frac{f(a,b+h) - f(a,b)}{h},
\]
provided that these limits exist.

</div>

Alternative notations include \(f_x, f_y\) (subscript) and \(D_1 f, D_2 f\) (operator notation, where the subscript refers to the position of the variable). For \(f : \mathbb{R}^n \to \mathbb{R}\), one differentiates with respect to the \(i\)-th variable while holding all others fixed.

## 4.2 Second Partial Derivatives

There are four second partial derivatives of \(f : \mathbb{R}^2 \to \mathbb{R}\): \(f_{xx}, f_{xy}, f_{yx}, f_{yy}\).

<div class="definition">

<strong>Definition (Hessian Matrix).</strong> Let \(f : \mathbb{R}^2 \to \mathbb{R}\). The Hessian matrix of \(f\), denoted \(H_f(x,y)\), is
\[
H_f(x,y) = \begin{bmatrix} f_{xx} & f_{xy} \\ f_{yx} & f_{yy} \end{bmatrix}.
\]

</div>

<div class="theorem">

<strong>Theorem 4.1 (Equality of Mixed Partials).</strong> Let \(f : \mathbb{R}^2 \to \mathbb{R}\). If \(f_{xy}\) and \(f_{yx}\) are defined in some neighborhood of \(\mathbf{a}\) and are continuous at \(\mathbf{a}\), then \(f_{xy}(\mathbf{a}) = f_{yx}(\mathbf{a})\).

</div>

If the \(k\)-th partial derivatives of \(f : \mathbb{R}^n \to \mathbb{R}\) are continuous, we write \(f \in C^k\) and say "\(f\) is in class \(C^k\)." For \(f \in C^2\), we have \(f_{xy} = f_{yx}\). More generally, for continuous higher-order partials, the order of differentiation does not matter.

## 4.3 The Tangent Plane

The tangent plane to the surface \(z = f(x,y)\) at the point \((a, b, f(a,b))\) is provisionally defined as:
\[
z = f(a,b) + \frac{\partial f}{\partial x}(a,b)(x - a) + \frac{\partial f}{\partial y}(a,b)(y - b).
\]
This definition is formalized in Chapter 5 using the concept of differentiability.

## 4.4 Linear Approximation for \(z = f(x,y)\)

<div class="definition">

<strong>Definition (Linear Approximation, 2D).</strong> Let \(f : \mathbb{R}^2 \to \mathbb{R}\). The linear approximation \(L_{(a,b)}(x,y)\) of \(f\) at \((a,b)\) is
\[
L_{(a,b)}(x,y) = f(a,b) + \frac{\partial f}{\partial x}(a,b)(x - a) + \frac{\partial f}{\partial y}(a,b)(y - b).
\]

</div>

The increment form is \(\Delta f \approx f_x(a,b)\,\Delta x + f_y(a,b)\,\Delta y\) for \(\Delta x, \Delta y\) sufficiently small.

## 4.5 Linear Approximation in Higher Dimensions

<div class="definition">

<strong>Definition (Gradient).</strong> Suppose \(f : \mathbb{R}^n \to \mathbb{R}\) has partial derivatives at \(\mathbf{a}\). The gradient of \(f\) at \(\mathbf{a}\) is
\[
\nabla f(\mathbf{a}) = (D_1 f(\mathbf{a}), D_2 f(\mathbf{a}), \ldots, D_n f(\mathbf{a})).
\]

</div>

<div class="definition">

<strong>Definition (Linear Approximation, General).</strong> Suppose \(f : \mathbb{R}^n \to \mathbb{R}\) has partial derivatives at \(\mathbf{a}\). The linear approximation of \(f\) at \(\mathbf{a}\) is
\[
L_{\mathbf{a}}(\mathbf{x}) = f(\mathbf{a}) + \nabla f(\mathbf{a}) \cdot (\mathbf{x} - \mathbf{a}).
\]

</div>

The increment form generalizes to \(\Delta f \approx \nabla f(\mathbf{a}) \cdot \Delta\mathbf{x}\).

---

# Chapter 5: Differentiable Functions

## 5.1 Definition of Differentiability

The error in the linear approximation is \(R_{1,\mathbf{a}}(\mathbf{x}) = f(\mathbf{x}) - L_{\mathbf{a}}(\mathbf{x})\). For functions of one variable, differentiability guarantees this error tends to zero faster than the displacement. For two variables, the existence of partial derivatives alone does not guarantee this, so we build it into the definition.

<div class="definition">

<strong>Definition (Differentiable Function).</strong> A function \(f : \mathbb{R}^2 \to \mathbb{R}\) is differentiable at \(\mathbf{a} = (a,b)\) if and only if there is a linear function \(L(\mathbf{x}) = f(a,b) + c(x-a) + d(y-b)\) such that
\[
\lim_{\mathbf{x}\to\mathbf{a}} \frac{|R_{1,\mathbf{a}}(\mathbf{x})|}{\|\mathbf{x} - \mathbf{a}\|} = 0, \quad \text{where } R_{1,\mathbf{a}}(\mathbf{x}) = f(\mathbf{x}) - L(\mathbf{x}).
\]

</div>

<div class="theorem">

<strong>Theorem 5.1.</strong> If \(f : \mathbb{R}^2 \to \mathbb{R}\) is differentiable at \(\mathbf{a} = (a,b)\) with linear function \(L(\mathbf{x}) = f(a,b) + c(x-a) + d(y-b)\), then \(c = f_x(a,b)\) and \(d = f_y(a,b)\). That is, \(L\) is the linear approximation of \(f\) at \(\mathbf{a}\).

</div>

Thus, to prove differentiability at \(\mathbf{a}\), one checks that \(\displaystyle\lim_{\mathbf{x}\to\mathbf{a}} \frac{|R_{1,\mathbf{a}}(\mathbf{x})|}{\|\mathbf{x} - \mathbf{a}\|} = 0\) where \(R_{1,\mathbf{a}}(\mathbf{x}) = f(\mathbf{x}) - L_{\mathbf{a}}(\mathbf{x})\). The existence of both partial derivatives at \(\mathbf{a}\) is necessary but not sufficient for differentiability.

<div class="definition">

<strong>Definition (Tangent Plane).</strong> Consider \(f : \mathbb{R}^2 \to \mathbb{R}\) which is differentiable at \((a,b)\). The tangent plane of the surface \(z = f(x,y)\) at \((a, b, f(a,b))\) is the graph of the linear approximation:
\[
z = f(a,b) + \frac{\partial f}{\partial x}(a,b)(x - a) + \frac{\partial f}{\partial y}(a,b)(y - b).
\]

</div>

![Tangent plane to surface at a point](/static/pics/math237/tangent_plane.png)

## 5.2 Differentiability and Continuity

The existence of partial derivatives does not imply continuity for \(f : \mathbb{R}^2 \to \mathbb{R}\). However, the stronger condition of differentiability does.

<div class="theorem">

<strong>Theorem 5.2.</strong> Let \(f : \mathbb{R}^2 \to \mathbb{R}\). If \(f\) is differentiable at \(\mathbf{a}\), then \(f\) is continuous at \(\mathbf{a}\).

</div>

The converse is false: continuity does not imply differentiability. The contrapositive is useful: if \(f\) is not continuous at \(\mathbf{a}\), then \(f\) is not differentiable at \(\mathbf{a}\).

## 5.3 Continuous Partial Derivatives and Differentiability

<div class="theorem">

<strong>Theorem 5.3 (Differentiability Theorem).</strong> Let \(f : \mathbb{R}^2 \to \mathbb{R}\). If \(\frac{\partial f}{\partial x}\) and \(\frac{\partial f}{\partial y}\) are continuous at \(\mathbf{a}\), then \(f\) is differentiable at \(\mathbf{a}\).

</div>

This is the primary tool for proving differentiability: compute the partial derivatives, then verify they are continuous using the continuity theorems. The definition of differentiability need only be used at exceptional points. These results generalize to \(f : \mathbb{R}^n \to \mathbb{R}\) with \(n\) partial derivatives.

## 5.4 The Linear Approximation Revisited

We can write \(f(\mathbf{x}) = f(\mathbf{a}) + \nabla f(\mathbf{a}) \cdot (\mathbf{x} - \mathbf{a}) + R_{1,\mathbf{a}}(\mathbf{x})\). If the partial derivatives of \(f\) are continuous at \(\mathbf{a}\), then \(\frac{|R_{1,\mathbf{a}}(\mathbf{x})|}{\|\mathbf{x} - \mathbf{a}\|} \to 0\) as \(\mathbf{x} \to \mathbf{a}\), meaning the error tends to zero faster than the displacement, and the linear approximation is reliable near \(\mathbf{a}\).

---

# Chapter 6: The Chain Rule

## 6.1 Basic Chain Rule in Two Dimensions

<div class="theorem">

<strong>Theorem 6.1 (Chain Rule).</strong> Given \(f : \mathbb{R}^2 \to \mathbb{R}\), \(x : \mathbb{R} \to \mathbb{R}\), and \(y : \mathbb{R} \to \mathbb{R}\), let \(G(t) = f(x(t), y(t))\), and let \(a = x(t_0)\), \(b = y(t_0)\). If \(f\) is differentiable at \((a,b)\) and \(x'(t_0)\) and \(y'(t_0)\) exist, then \(G'(t_0)\) exists and is given by
\[
G'(t_0) = f_x(a,b)\,x'(t_0) + f_y(a,b)\,y'(t_0).
\]

</div>

In Leibniz notation: \(\frac{dT}{dt} = \frac{\partial T}{\partial x}\frac{dx}{dt} + \frac{\partial T}{\partial y}\frac{dy}{dt}\). In vector form: \(\frac{d}{dt}f(\mathbf{x}(t)) = \nabla f(\mathbf{x}(t)) \cdot \frac{d\mathbf{x}}{dt}\). This vector form holds for any differentiable \(f : \mathbb{R}^n \to \mathbb{R}\).

## 6.2 Extensions of the Basic Chain Rule

When there is more than one independent variable, e.g., \(u = f(x,y)\) with \(x = x(s,t)\) and \(y = y(s,t)\), the chain rule becomes:
\[
\frac{\partial u}{\partial s} = \frac{\partial u}{\partial x}\frac{\partial x}{\partial s} + \frac{\partial u}{\partial y}\frac{\partial y}{\partial s}, \qquad \frac{\partial u}{\partial t} = \frac{\partial u}{\partial x}\frac{\partial x}{\partial t} + \frac{\partial u}{\partial y}\frac{\partial y}{\partial t}.
\]

A dependence (tree) diagram can be used to systematically derive the chain rule for more complex compositions. The algorithm is: (1) identify all paths from the differentiated variable to the differentiating variable; (2) for each link in a path, form the appropriate derivative; (3) multiply along each path and sum over all paths.

## 6.3 The Chain Rule for Second Partial Derivatives

To compute second derivatives of composite functions, one applies the chain rule to the first derivative expression, using the dependence diagram to keep track of variables. This technique is essential for converting PDEs between coordinate systems (e.g., showing that \(f_{xx} + f_{yy} = f_{rr} + \frac{1}{r}f_r + \frac{1}{r^2}f_{\theta\theta}\) in polar coordinates) and for proving Taylor's formula.

---

# Chapter 7: Directional Derivatives and the Gradient Vector

## 7.1 Directional Derivatives

<div class="definition">

<strong>Definition (Directional Derivative).</strong> The directional derivative of \(f : \mathbb{R}^2 \to \mathbb{R}\) at a point \(\mathbf{a}\) in the direction of a unit vector \(\hat{\mathbf{u}}\) is
\[
D_{\hat{\mathbf{u}}} f(\mathbf{a}) = \frac{d}{ds} f(\mathbf{a} + s\hat{\mathbf{u}})\Big|_{s=0}.
\]

</div>

<div class="theorem">

<strong>Theorem 7.1.</strong> If \(f : \mathbb{R}^2 \to \mathbb{R}\) is differentiable at \(\mathbf{a}\), then
\[
D_{\hat{\mathbf{u}}} f(\mathbf{a}) = \nabla f(\mathbf{a}) \cdot \hat{\mathbf{u}},
\]
where \(\hat{\mathbf{u}}\) is a unit vector.

</div>

Choosing \(\hat{\mathbf{u}} = \hat{\mathbf{i}}\) or \(\hat{\mathbf{u}} = \hat{\mathbf{j}}\) recovers \(f_x\) or \(f_y\) respectively. This theorem extends to \(f : \mathbb{R}^n \to \mathbb{R}\) in the expected way.

## 7.2 The Gradient Vector in Two Dimensions

<div class="theorem">

<strong>Theorem 7.2 (Greatest Rate of Change).</strong> Suppose \(f : \mathbb{R}^2 \to \mathbb{R}\) is differentiable at \(\mathbf{a}\) and \(\nabla f(\mathbf{a}) \neq \mathbf{0}\). Then the largest value of \(D_{\hat{\mathbf{u}}} f(\mathbf{a})\) is \(\|\nabla f(\mathbf{a})\|\), and occurs when \(\hat{\mathbf{u}}\) is in the direction of \(\nabla f(\mathbf{a})\).

</div>

<div class="theorem">

<strong>Theorem 7.3 (Gradient Orthogonal to Level Curves).</strong> Suppose \(f : \mathbb{R}^2 \to \mathbb{R}\) is differentiable at \(\mathbf{a}\) and \(\nabla f(\mathbf{a}) \neq \mathbf{0}\). Then \(\nabla f(\mathbf{a})\) is orthogonal to the level curve \(f(x,y) = k\) through \(\mathbf{a}\).

</div>

![Gradient vector field with contours](/static/pics/math237/gradient_field.png)

## 7.3 The Gradient Vector in Three Dimensions

<div class="theorem">

<strong>Theorem 7.4.</strong> Suppose \(f : \mathbb{R}^3 \to \mathbb{R}\) is differentiable and \(\nabla f(\mathbf{a}) \neq \mathbf{0}\). Then \(\nabla f(\mathbf{a})\) is orthogonal to the level surface \(f(\mathbf{x}) = k\) through \(\mathbf{a}\).

</div>

This gives the equation of the tangent plane to the surface \(f(x,y,z) = k\) at \(\mathbf{a} = (a,b,c)\):
\[
\nabla f(\mathbf{a}) \cdot (\mathbf{x} - \mathbf{a}) = 0 \quad \Longleftrightarrow \quad f_x(\mathbf{a})(x - a) + f_y(\mathbf{a})(y - b) + f_z(\mathbf{a})(z - c) = 0.
\]

---

# Chapter 8: Taylor Polynomials and Taylor's Theorem

## 8.1 The Taylor Polynomial of Degree 2

<div class="definition">

<strong>Definition (Second Degree Taylor Polynomial).</strong> The second degree Taylor polynomial \(P_{2,\mathbf{a}}(x,y)\) of \(f : \mathbb{R}^2 \to \mathbb{R}\) at \(\mathbf{a} = (a,b)\) is
\[
P_{2,\mathbf{a}}(x,y) = f(\mathbf{a}) + f_x(\mathbf{a})(x-a) + f_y(\mathbf{a})(y-b) + \frac{1}{2}\left[f_{xx}(\mathbf{a})(x-a)^2 + 2f_{xy}(\mathbf{a})(x-a)(y-b) + f_{yy}(\mathbf{a})(y-b)^2\right].
\]

</div>

This approximates \(f(x,y)\) near \((a,b)\) with better accuracy than the linear approximation.

## 8.2 Taylor's Formula with Second Degree Remainder

<div class="theorem">

<strong>Theorem 8.1 (Taylor's Formula).</strong> Consider \(f : \mathbb{R}^2 \to \mathbb{R}\). If \(f \in C^2\) in some neighborhood \(N(\mathbf{a})\) of \(\mathbf{a}\), then for all \(\mathbf{x} \in N(\mathbf{a})\), there exists a point \(\mathbf{c}\) on the line segment joining \(\mathbf{a}\) and \(\mathbf{x}\) such that
\[
f(\mathbf{x}) = f(\mathbf{a}) + f_x(\mathbf{a})(x-a) + f_y(\mathbf{a})(y-b) + R_{1,\mathbf{a}}(\mathbf{x}),
\]
where
\[
R_{1,\mathbf{a}}(\mathbf{x}) = \frac{1}{2}\left[f_{xx}(\mathbf{c})(x-a)^2 + 2f_{xy}(\mathbf{c})(x-a)(y-b) + f_{yy}(\mathbf{c})(y-b)^2\right].
\]

</div>

<div class="corollary">

<strong>Corollary 8.1.</strong> If \(f : \mathbb{R}^2 \to \mathbb{R}\), \(f \in C^2\) in some closed neighborhood \(N_\delta(\mathbf{a}) = \{\mathbf{x} \in \mathbb{R}^2 \mid \|\mathbf{x} - \mathbf{a}\| \leq \delta\}\), then there exists a positive constant \(M\) such that
\[
|R_{1,\mathbf{a}}(\mathbf{x})| \leq M\|\mathbf{x} - \mathbf{a}\|^2, \quad \text{for all } \mathbf{x} \in N_\delta(\mathbf{a}).
\]

</div>

## 8.3 Generalizations

The \(k\)-th degree Taylor polynomial is defined recursively by
\[
P_{k,\mathbf{a}}(\mathbf{x}) = P_{k-1,\mathbf{a}}(\mathbf{x}) + \frac{1}{k!}[(x-a)D_1 + (y-b)D_2]^k f(\mathbf{a}),
\]
where the expression \([(x-a)D_1 + (y-b)D_2]^k\) is expanded using the Binomial Theorem.

<div class="theorem">

<strong>Theorem 8.2 (Taylor's Theorem of Order \(k\)).</strong> Let \(f : \mathbb{R}^2 \to \mathbb{R}\), \(f \in C^{k+1}\) at each point on the line segment joining \(\mathbf{a}\) and \(\mathbf{x}\). Then there exists a point \(\mathbf{c}\) on the line segment between \(\mathbf{a}\) and \(\mathbf{x}\) such that
\[
f(\mathbf{x}) = P_{k,\mathbf{a}}(\mathbf{x}) + R_{k,\mathbf{a}}(\mathbf{x}),
\]
where \(R_{k,\mathbf{a}}(\mathbf{x}) = \frac{1}{(k+1)!}[(x-a)D_1 + (y-b)D_2]^{k+1}f(\mathbf{c})\).

</div>

<div class="corollary">

<strong>Corollary 8.2.</strong> If \(f \in C^k\) in some neighborhood of \(\mathbf{a}\), then
\[
\lim_{\mathbf{x}\to\mathbf{a}} \frac{|f(\mathbf{x}) - P_{k,\mathbf{a}}(\mathbf{x})|}{\|\mathbf{x}-\mathbf{a}\|^k} = 0.
\]

</div>

<div class="corollary">

<strong>Corollary 8.3.</strong> If \(f \in C^{k+1}\) in some closed neighborhood \(N(\mathbf{a})\), then there exists \(M > 0\) such that \(|f(\mathbf{x}) - P_{k,\mathbf{a}}(\mathbf{x})| \leq M\|\mathbf{x} - \mathbf{a}\|^{k+1}\) for all \(\mathbf{x} \in N(\mathbf{a})\).

</div>

---

# Chapter 9: Critical Points

## 9.1 Local Extrema and Critical Points

<div class="definition">

<strong>Definition (Local Maximum/Minimum).</strong> Given \(f : \mathbb{R}^2 \to \mathbb{R}\):

1. \((a,b)\) is a local maximum point if \(f(x,y) \leq f(a,b)\) for all \((x,y)\) in some neighborhood of \((a,b)\).
2. \((a,b)\) is a local minimum point if \(f(x,y) \geq f(a,b)\) for all \((x,y)\) in some neighborhood of \((a,b)\).

</div>

<div class="theorem">

<strong>Theorem 9.1.</strong> Let \(f : \mathbb{R}^2 \to \mathbb{R}\). If \((a,b)\) is a local maximum or minimum point of \(f\), then
\[
f_x(a,b) = 0 = f_y(a,b),
\]
or at least one of \(f_x\) or \(f_y\) does not exist at \((a,b)\).

</div>

<div class="definition">

<strong>Definition (Critical Point).</strong> Let \(f : \mathbb{R}^2 \to \mathbb{R}\). A point \((a,b)\) in the domain of \(f\) is a critical point of \(f\) if \(\frac{\partial f}{\partial x}(a,b) = 0 = \frac{\partial f}{\partial y}(a,b)\), or if at least one of the partial derivatives does not exist at \((a,b)\).

</div>

<div class="definition">

<strong>Definition (Saddle Point).</strong> A critical point \((a,b)\) of \(f : \mathbb{R}^2 \to \mathbb{R}\) is a saddle point if in every neighborhood of \((a,b)\) there exist points \((x_1,y_1)\) and \((x_2,y_2)\) with \(f(x_1,y_1) > f(a,b)\) and \(f(x_2,y_2) < f(a,b)\).

</div>

![Saddle point z=x²−y² with level curves](/static/pics/math237/saddle_level.png)

## 9.2 The Second Derivative Test

<div class="definition">

<strong>Definition (Quadratic Form).</strong> A function \(Q : \mathbb{R}^2 \to \mathbb{R}\) of the form \(Q(u,v) = a_{11}u^2 + 2a_{12}uv + a_{22}v^2\) is a quadratic form on \(\mathbb{R}^2\). It is positive definite if \(Q > 0\) for all \((u,v) \neq (0,0)\); negative definite if \(Q < 0\); indefinite if \(Q\) takes both signs; and semidefinite otherwise.

</div>

<div class="theorem">

<strong>Theorem 9.2 (Second Partial Derivative Test).</strong> Let \(f : \mathbb{R}^2 \to \mathbb{R}\) with \(f \in C^2\) in some neighborhood of \(\mathbf{a}\), and suppose \(f_x(\mathbf{a}) = 0 = f_y(\mathbf{a})\).

1. If \(H_f(\mathbf{a})\) is positive definite, then \(\mathbf{a}\) is a local minimum point.
2. If \(H_f(\mathbf{a})\) is negative definite, then \(\mathbf{a}\) is a local maximum point.
3. If \(H_f(\mathbf{a})\) is indefinite, then \(\mathbf{a}\) is a saddle point.

</div>

<div class="theorem">

<strong>Theorem 9.3 (Classification of Quadratic Forms).</strong> Let \(Q(u,v) = a_{11}u^2 + 2a_{12}uv + a_{22}v^2\) and let \(D = a_{11}a_{22} - a_{12}^2\). Then:

1. \(Q\) is positive definite if and only if \(D > 0\) and \(a_{11} > 0\).
2. \(Q\) is negative definite if and only if \(D > 0\) and \(a_{11} < 0\).
3. \(Q\) is indefinite if and only if \(D < 0\).
4. \(Q\) is semidefinite if and only if \(D = 0\).

</div>

Note that \(D = \det(H_f)\). If \(H_f(\mathbf{a})\) is semidefinite (i.e., \(D = 0\)), the second derivative test is inconclusive -- the critical point is called degenerate and must be analyzed by other means.

<div class="theorem">

<strong>Theorem 9.4.</strong> Suppose \(f : \mathbb{R} \to \mathbb{R}\) is twice continuously differentiable and strictly convex (i.e., \(f''(x) > 0\) for all \(x\)). Then (1) \(f(x) > L_a(x)\) for all \(x \neq a\), and (2) for \(a < b\), \(f(x) < f(a) + \frac{f(b)-f(a)}{b-a}(x-a)\) for \(x \in (a,b)\).

</div>

<div class="theorem">

<strong>Theorem 9.5.</strong> Suppose \(f : \mathbb{R}^2 \to \mathbb{R}\) has continuous second partial derivatives and is strictly convex (i.e., \(H_f(\mathbf{x})\) is positive definite for all \(\mathbf{x}\)). Then (1) \(f(\mathbf{x}) > L_{\mathbf{a}}(\mathbf{x})\) for all \(\mathbf{x} \neq \mathbf{a}\), and (2) \(f(\mathbf{a} + t(\mathbf{b} - \mathbf{a})) < f(\mathbf{a}) + t[f(\mathbf{b}) - f(\mathbf{a})]\) for \(0 < t < 1\), \(\mathbf{a} \neq \mathbf{b}\).

</div>

<div class="theorem">

<strong>Theorem 9.6.</strong> Suppose \(f : \mathbb{R}^2 \to \mathbb{R}\) has continuous partial derivatives, is strictly convex, and has a critical point \(\mathbf{c}\). Then \(f(\mathbf{x}) > f(\mathbf{c})\) for all \(\mathbf{x} \neq \mathbf{c}\), and \(f\) has no other critical point.

</div>

## 9.3 Proof of the Second Partial Derivative Test

The proof relies on the following technical result about the stability of definiteness under small perturbations.

<div class="lemma">

<strong>Lemma 9.1.</strong> Let \(\begin{bmatrix} a & b \\ b & c \end{bmatrix}\) be a positive definite matrix. If \(|\tilde{a} - a|\), \(|\tilde{b} - b|\), and \(|\tilde{c} - c|\) are sufficiently small, then \(\begin{bmatrix} \tilde{a} & \tilde{b} \\ \tilde{b} & \tilde{c} \end{bmatrix}\) is also positive definite.

</div>

The same lemma holds with "positive definite" replaced by "negative definite" or "indefinite." The proof of the second derivative test combines this lemma with Taylor's formula and the continuity of the second partial derivatives.

---

# Chapter 10: Optimization Problems

## 10.1 Extreme Value Theorem

<div class="definition">

<strong>Definition (Absolute Maximum/Minimum).</strong> Given \(f : \mathbb{R}^2 \to \mathbb{R}\) and \(S \subset \mathbb{R}^2\):

1. \(\mathbf{a} \in S\) is an absolute maximum point of \(f\) on \(S\) if \(f(\mathbf{x}) \leq f(\mathbf{a})\) for all \(\mathbf{x} \in S\).
2. \(\mathbf{a} \in S\) is an absolute minimum point of \(f\) on \(S\) if \(f(\mathbf{x}) \geq f(\mathbf{a})\) for all \(\mathbf{x} \in S\).

</div>

<div class="definition">

<strong>Definition (Bounded Set).</strong> A set \(S \subset \mathbb{R}^2\) is bounded if and only if it is contained in some neighborhood of the origin.

</div>

<div class="definition">

<strong>Definition (Boundary Point).</strong> Given \(S \subset \mathbb{R}^2\), a point \(\mathbf{b} \in \mathbb{R}^2\) is a boundary point of \(S\) if every neighborhood of \(\mathbf{b}\) contains at least one point in \(S\) and one point not in \(S\). The set of all boundary points is denoted \(B(S)\).

</div>

<div class="definition">

<strong>Definition (Closed Set).</strong> A set \(S \subset \mathbb{R}^2\) is closed if and only if \(S\) contains all its boundary points.

</div>

<div class="theorem">

<strong>Theorem 10.1 (Extreme Value Theorem).</strong> If \(f : \mathbb{R}^2 \to \mathbb{R}\) is continuous on a closed and bounded set \(S \subset \mathbb{R}^2\), then there exist \(\mathbf{c}_1, \mathbf{c}_2 \in S\) such that
\[
f(\mathbf{c}_1) \leq f(\mathbf{x}) \leq f(\mathbf{c}_2) \quad \text{for all } \mathbf{x} \in S.
\]

</div>

## 10.2 Algorithm for Extreme Values

<div class="definition">

<strong>Algorithm (Extreme Values on a Closed Bounded Set).</strong> To find the maximum/minimum of \(f : \mathbb{R}^2 \to \mathbb{R}\) on a closed and bounded set \(S \subset \mathbb{R}^2\):

1. Find all critical points of \(f\) in \(S\).
2. Find the maximum and minimum of \(f\) on the boundary \(B(S)\).
3. Evaluate \(f\) at all points from steps (1) and (2).

The largest (smallest) value found is the absolute maximum (minimum) of \(f\) on \(S\).

</div>

## 10.3 Optimization with Constraints

<div class="definition">

<strong>Algorithm (Lagrange Multipliers).</strong> To find the maximum/minimum of a differentiable function \(f(x,y)\) subject to the constraint \(g(x,y) = k\), evaluate \(f\) at all points \((a,b)\) satisfying one of:

1. \(\nabla f(a,b) = \lambda \nabla g(a,b)\) and \(g(a,b) = k\),
2. \(\nabla g(a,b) = \mathbf{0}\) and \(g(a,b) = k\),
3. \((a,b)\) is an endpoint of the curve \(g(x,y) = k\).

The maximum/minimum is the largest/smallest value of \(f\) at these points.

</div>

Condition (1) requires solving three equations (\(f_x = \lambda g_x\), \(f_y = \lambda g_y\), \(g = k\)) for three unknowns \(x, y, \lambda\). The scalar \(\lambda\) is the Lagrange multiplier and can usually be eliminated.

For functions of three variables, the algorithm generalizes: find points where \(\nabla f = \lambda \nabla g\) on the constraint surface \(g(x,y,z) = k\), check where \(\nabla g = \mathbf{0}\), and check boundary points of the surface.

More generally, for \(f : \mathbb{R}^n \to \mathbb{R}\) with \(r\) constraints \(g_1(\mathbf{x}) = 0, \ldots, g_r(\mathbf{x}) = 0\), the condition becomes \(\nabla f(\mathbf{a}) = \lambda_1 \nabla g_1(\mathbf{a}) + \cdots + \lambda_r \nabla g_r(\mathbf{a})\).

---

# Chapter 11: Coordinate Systems

## 11.1 Polar Coordinates

A point \(P\) in the plane is represented by polar coordinates \((r, \theta)\) where \(r \geq 0\) is the distance from the origin and \(\theta\) is the angle from the polar axis. Unlike Cartesian coordinates, polar coordinates are not unique: \((r, \theta) = (r, \theta + 2\pi k)\) for any integer \(k\).

The relationship to Cartesian coordinates is:
\[
x = r\cos\theta, \quad y = r\sin\theta, \qquad r = \sqrt{x^2 + y^2}, \quad \tan\theta = \frac{y}{x}.
\]

The area enclosed by a polar curve \(r = f(\theta)\) from \(\theta = \alpha\) to \(\theta = \beta\) is \(A = \int_\alpha^\beta \frac{1}{2}[f(\theta)]^2\,d\theta\).

## 11.2 Cylindrical Coordinates

Cylindrical coordinates \((r, \theta, z)\) extend polar coordinates to three dimensions by adding the Cartesian \(z\)-coordinate:
\[
x = r\cos\theta, \quad y = r\sin\theta, \quad z = z, \qquad r \geq 0,\ 0 \leq \theta < 2\pi.
\]

## 11.3 Spherical Coordinates

Spherical coordinates \((\rho, \phi, \theta)\) represent a point in \(\mathbb{R}^3\) by its distance from the origin \(\rho\), the angle \(\phi\) from the positive \(z\)-axis, and the azimuthal angle \(\theta\):
\[
x = \rho\sin\phi\cos\theta, \quad y = \rho\sin\phi\sin\theta, \quad z = \rho\cos\phi, \qquad \rho \geq 0,\ 0 \leq \phi \leq \pi,\ 0 \leq \theta < 2\pi.
\]

---

# Chapter 12: Mappings of \(\mathbb{R}^2\) into \(\mathbb{R}^2\)

## 12.1 The Geometry of Mappings

A mapping \(F : \mathbb{R}^2 \to \mathbb{R}^2\) is defined by component functions: \((u,v) = F(x,y) = (f(x,y), g(x,y))\). It transforms regions in the \(xy\)-plane into regions in the \(uv\)-plane. For a linear mapping, the image of a straight line is a straight line. For a nonlinear mapping (such as polar to Cartesian), the image of a line may be a curve.

## 12.2 The Linear Approximation of a Mapping

<div class="definition">

<strong>Definition (Derivative Matrix).</strong> The derivative matrix of a mapping \(F : \mathbb{R}^2 \to \mathbb{R}^2\) defined by \(F(x,y) = (f(x,y), g(x,y))\) is
\[
DF = \begin{bmatrix} \frac{\partial f}{\partial x} & \frac{\partial f}{\partial y} \\[6pt] \frac{\partial g}{\partial x} & \frac{\partial g}{\partial y} \end{bmatrix}.
\]

</div>

The linear approximation for mappings is \(\Delta\mathbf{u} \approx DF(\mathbf{a})\,\Delta\mathbf{x}\). For a general mapping \(F : \mathbb{R}^n \to \mathbb{R}^m\), the derivative matrix is the \(m \times n\) matrix \([DF]_{ij} = \frac{\partial f_i}{\partial x_j}\).

## 12.3 Composite Mappings and the Chain Rule

<div class="theorem">

<strong>Theorem 12.1 (Chain Rule in Matrix Form).</strong> Consider \(G : \mathbb{R}^2 \to \mathbb{R}^2\) and \(F : \mathbb{R}^2 \to \mathbb{R}^2\). If \(G\) has continuous partial derivatives at \(\mathbf{x}\) and \(F\) has continuous partial derivatives at \(\mathbf{u} = G(\mathbf{x})\), then
\[
D(F \circ G)(\mathbf{x}) = DF(\mathbf{u})\,DG(\mathbf{x}).
\]

</div>

The derivative matrix of the composite mapping is the matrix product of the individual derivative matrices.

---

# Chapter 13: Jacobians and Inverse Mappings

## 13.1 The Inverse Mapping Theorem

<div class="definition">

<strong>Definition (One-to-One).</strong> A mapping \(F : \mathbb{R}^2 \to \mathbb{R}^2\) is one-to-one on \(D_{xy} \subset \mathbb{R}^2\) if \(F(\mathbf{a}) = F(\mathbf{b})\) implies \(\mathbf{a} = \mathbf{b}\) for all \(\mathbf{a}, \mathbf{b} \in D_{xy}\).

</div>

<div class="definition">

<strong>Definition (Inverse Mapping).</strong> If \(F\) is one-to-one on \(D_{xy}\) with image \(D_{uv}\), then \(F\) has an inverse mapping \(F^{-1}\) such that \((x,y) = F^{-1}(u,v)\) if and only if \((u,v) = F(x,y)\).

</div>

<div class="theorem">

<strong>Theorem 13.1.</strong> If \(F : \mathbb{R}^2 \to \mathbb{R}^2\) has continuous partial derivatives at \(\mathbf{x}\) and its inverse \(F^{-1}\) has continuous partial derivatives at \(\mathbf{u} = F(\mathbf{x})\), then
\[
DF^{-1}(\mathbf{u})\,DF(\mathbf{x}) = I.
\]

</div>

<div class="definition">

<strong>Definition (Jacobian).</strong> The Jacobian of a mapping \(F : \mathbb{R}^2 \to \mathbb{R}^2\), \((u,v) = F(x,y)\), is
\[
\frac{\partial(u,v)}{\partial(x,y)} = \det[DF(\mathbf{x})] = \det\begin{bmatrix} \frac{\partial u}{\partial x} & \frac{\partial u}{\partial y} \\[4pt] \frac{\partial v}{\partial x} & \frac{\partial v}{\partial y} \end{bmatrix}.
\]

</div>

<div class="corollary">

<strong>Corollary 13.1.</strong> If \(F\) has an inverse mapping \(F^{-1}\) (both with continuous partials), then the Jacobian of \(F\) is non-zero: \(\frac{\partial(u,v)}{\partial(x,y)} \neq 0\).

</div>

<div class="corollary">

<strong>Corollary 13.2 (Inverse Property of the Jacobian).</strong> Under the hypotheses of Theorem 13.1,
\[
\frac{\partial(x,y)}{\partial(u,v)} = \frac{1}{\frac{\partial(u,v)}{\partial(x,y)}}.
\]

</div>

<div class="theorem">

<strong>Theorem 13.2 (Inverse Mapping Theorem).</strong> Consider \(F : \mathbb{R}^2 \to \mathbb{R}^2\) defined by \(u = f(x,y)\), \(v = g(x,y)\). If \(F\) has continuous partial derivatives in some neighborhood of \((a,b)\) and \(\frac{\partial(u,v)}{\partial(x,y)} \neq 0\) at \((a,b)\), then there is a neighborhood of \((a,b)\) in which \(F\) has an inverse mapping \(F^{-1}\) with continuous partial derivatives.

</div>

## 13.2 Geometrical Interpretation of the Jacobian

The Jacobian describes how a mapping scales areas. If \(F\) maps a small rectangle of area \(\Delta A_{xy}\) at point \(P\) to a region of area \(\Delta A_{uv}\), then
\[
\Delta A_{uv} \approx \left|\frac{\partial(u,v)}{\partial(x,y)}\right| \Delta A_{xy}.
\]
For a linear mapping this is exact. In three dimensions, the Jacobian gives the volume scaling factor: \(\Delta V_{uvw} \approx \left|\frac{\partial(u,v,w)}{\partial(x,y,z)}\right|\Delta V_{xyz}\).

<div class="definition">

<strong>Definition (Jacobian, General).</strong> For \(F : \mathbb{R}^n \to \mathbb{R}^n\), \(\mathbf{u} = F(\mathbf{x})\), the Jacobian is
\[
\frac{\partial(u_1,\ldots,u_n)}{\partial(x_1,\ldots,x_n)} = \det[DF(\mathbf{x})].
\]

</div>

## 13.3 Constructing Mappings

When performing change of variables in integrals, one needs to construct an invertible mapping transforming a complicated region into a simpler one (e.g., a rectangle or unit square). The strategy is to identify pairs of bounding curves and choose component functions whose level sets coincide with these curves.

---

# Chapter 14: Double Integrals

## 14.1 Definition of Double Integrals

<div class="definition">

<strong>Definition (Integrable).</strong> A function \(f : \mathbb{R}^2 \to \mathbb{R}\) which is bounded on a closed bounded set \(D \subset \mathbb{R}^2\) is integrable on \(D\) if all Riemann sums approach the same value as the partition norm \(|\Delta P| \to 0\).

</div>

<div class="definition">

<strong>Definition (Double Integral).</strong> If \(f : \mathbb{R}^2 \to \mathbb{R}\) is integrable on a closed bounded set \(D\), then
\[
\iint_D f(x,y)\,dA = \lim_{|\Delta P| \to 0} \sum_{i=1}^n f(x_i,y_i)\,\Delta A_i.
\]

</div>

If \(f\) is continuous on \(D\), then \(f\) is integrable on \(D\). Interpretations include: area (\(f = 1\)), volume (\(f \geq 0\)), mass (with \(f\) as density), and probability.

<div class="theorem">

<strong>Theorem 14.1 (Linearity).</strong> \(\displaystyle\iint_D (f+g)\,dA = \iint_D f\,dA + \iint_D g\,dA\) and \(\displaystyle\iint_D cf\,dA = c\iint_D f\,dA\).

</div>

<div class="theorem">

<strong>Theorem 14.2 (Basic Inequality).</strong> If \(f(x,y) \leq g(x,y)\) for all \((x,y) \in D\), then \(\displaystyle\iint_D f\,dA \leq \iint_D g\,dA\).

</div>

<div class="theorem">

<strong>Theorem 14.3 (Absolute Value Inequality).</strong> \(\displaystyle\left|\iint_D f\,dA\right| \leq \iint_D |f|\,dA\).

</div>

<div class="theorem">

<strong>Theorem 14.4 (Decomposition).</strong> If \(D\) is decomposed into \(D_1\) and \(D_2\) by a piecewise smooth curve, then \(\displaystyle\iint_D f\,dA = \iint_{D_1} f\,dA + \iint_{D_2} f\,dA\).

</div>

## 14.2 Iterated Integrals

<div class="theorem">

<strong>Theorem 14.5 (Iterated Integral).</strong> Let \(D \subset \mathbb{R}^2\) be defined by \(y_\ell(x) \leq y \leq y_u(x)\) and \(x_\ell \leq x \leq x_u\), where \(y_\ell, y_u\) are continuous. If \(f(x,y)\) is continuous on \(D\), then
\[
\iint_D f(x,y)\,dA = \int_{x_\ell}^{x_u} \int_{y_\ell(x)}^{y_u(x)} f(x,y)\,dy\,dx.
\]

</div>

The order of integration can be reversed when the region is described as \(x_\ell(y) \leq x \leq x_u(y)\), \(y_\ell \leq y \leq y_u\). The choice of order depends on the shape of \(D\) and the form of the integrand.

## 14.3 The Change of Variable Theorem

<div class="theorem">

<strong>Theorem 14.6 (Change of Variable for Double Integrals).</strong> Let \((x,y) = F(u,v) = (f(u,v), g(u,v))\) be a one-to-one mapping of \(D_{uv}\) onto \(D_{xy}\) with \(f, g \in C^1\) and \(\frac{\partial(x,y)}{\partial(u,v)} \neq 0\) (except possibly on finitely many piecewise-smooth curves). If \(H(x,y)\) is continuous on \(D_{xy}\), then
\[
\iint_{D_{xy}} H(x,y)\,dx\,dy = \iint_{D_{uv}} H(f(u,v), g(u,v))\left|\frac{\partial(x,y)}{\partial(u,v)}\right|du\,dv.
\]

</div>

For polar coordinates \((x,y) = (r\cos\theta, r\sin\theta)\), the Jacobian is \(\frac{\partial(x,y)}{\partial(r,\theta)} = r\), so:
\[
\iint_{D_{xy}} H(x,y)\,dx\,dy = \iint_{D_{r\theta}} H(r\cos\theta, r\sin\theta)\,r\,dr\,d\theta.
\]

<svg viewBox="0 0 400 200" xmlns="http://www.w3.org/2000/svg" style="max-width:400px;display:block;margin:1.5em auto">
  <defs>
    <marker id="cvArr" markerWidth="7" markerHeight="7" refX="5" refY="3" orient="auto">
      <path d="M0,0 L0,6 L7,3 z" fill="currentColor"/>
    </marker>
  </defs>
  <text x="200" y="16" font-size="12" fill="currentColor" text-anchor="middle" font-weight="bold">Change of Variables: Rectangular (r,θ) → Polar (x,y)</text>
  <!-- Left: r-theta rectangle -->
  <text x="75" y="36" font-size="11" fill="currentColor" text-anchor="middle">(r, θ) domain</text>
  <line x1="15" y1="160" x2="140" y2="160" stroke="currentColor" stroke-width="1.2" marker-end="url(#cvArr)"/>
  <line x1="15" y1="160" x2="15" y2="45" stroke="currentColor" stroke-width="1.2" marker-end="url(#cvArr)"/>
  <text x="143" y="164" font-size="10" fill="currentColor">r</text>
  <text x="10" y="42" font-size="10" fill="currentColor">θ</text>
  <!-- Rectangle r1 to r2, θ1 to θ2 -->
  <rect x="35" y="70" width="80" height="70" fill="#3b82f6" fill-opacity="0.2" stroke="#3b82f6" stroke-width="1.5"/>
  <text x="75" y="108" font-size="10" fill="#3b82f6" text-anchor="middle">D_rθ</text>
  <text x="35" y="170" font-size="9" fill="currentColor" text-anchor="middle">r₁</text>
  <text x="115" y="170" font-size="9" fill="currentColor" text-anchor="middle">r₂</text>
  <text x="5" y="75" font-size="9" fill="currentColor">θ₂</text>
  <text x="5" y="143" font-size="9" fill="currentColor">θ₁</text>
  <!-- Arrow in middle -->
  <text x="175" y="112" font-size="22" fill="currentColor" text-anchor="middle">→</text>
  <text x="175" y="130" font-size="9" fill="currentColor" text-anchor="middle">x=r cosθ</text>
  <text x="175" y="142" font-size="9" fill="currentColor" text-anchor="middle">y=r sinθ</text>
  <!-- Right: annular sector in xy -->
  <text x="315" y="36" font-size="11" fill="currentColor" text-anchor="middle">(x, y) domain</text>
  <line x1="215" y1="160" x2="390" y2="160" stroke="currentColor" stroke-width="1.2" marker-end="url(#cvArr)"/>
  <line x1="305" y1="185" x2="305" y2="40" stroke="currentColor" stroke-width="1.2" marker-end="url(#cvArr)"/>
  <text x="393" y="164" font-size="10" fill="currentColor">x</text>
  <text x="300" y="37" font-size="10" fill="currentColor">y</text>
  <!-- Annular sector: two arcs from theta1=30° to theta2=80° r1=30px r2=65px -->
  <path d="M 331 134 A 30 30 0 0 1 305 130 L 305 95 A 65 65 0 0 0 357 113 Z"
        fill="#ef4444" fill-opacity="0.2" stroke="#ef4444" stroke-width="1.5"/>
  <!-- Better annular sector -->
  <path d="M 331 134 A 30 30 0 0 1 310 132 L 278 103 A 65 65 0 0 0 357 111 Z"
        fill="#ef4444" fill-opacity="0.25" stroke="#ef4444" stroke-width="1.5"/>
  <text x="330" y="120" font-size="10" fill="#ef4444">D_xy</text>
  <text x="200" y="192" font-size="10" fill="currentColor" text-anchor="middle" opacity="0.7">Jacobian = r,  so dA = r dr dθ</text>
</svg>

---

# Chapter 15: Triple Integrals

## 15.1 Definition of Triple Integrals

<div class="definition">

<strong>Definition (Integrable, 3D).</strong> A function \(f : \mathbb{R}^3 \to \mathbb{R}\) bounded on a closed bounded set \(D \subset \mathbb{R}^3\) is integrable on \(D\) if all Riemann sums approach the same value as \(|\Delta P| \to 0\).

</div>

<div class="definition">

<strong>Definition (Triple Integral).</strong> If \(f : \mathbb{R}^3 \to \mathbb{R}\) is integrable on a closed bounded set \(D\), then
\[
\iiint_D f(x,y,z)\,dV = \lim_{|\Delta P| \to 0} \sum_{i=1}^n f(x_i,y_i,z_i)\,\Delta V_i.
\]

</div>

<div class="definition">

<strong>Definition (Average Value).</strong> Let \(D \subset \mathbb{R}^3\) be closed and bounded with \(V(D) \neq 0\). The average value of \(f\) over \(D\) is
\[
f_{\text{av}} = \frac{1}{V(D)}\iiint_D f(x,y,z)\,dV.
\]

</div>

The triple integral satisfies the same linearity, inequality, and decomposition properties as the double integral.

## 15.2 Iterated Integrals

<div class="theorem">

<strong>Theorem 15.1 (Iterated Triple Integral).</strong> Let \(D\) be defined by \(z_\ell(x,y) \leq z \leq z_u(x,y)\) and \((x,y) \in D_{xy}\), with \(z_\ell, z_u\) continuous on \(D_{xy}\). If \(f(x,y,z)\) is continuous on \(D\), then
\[
\iiint_D f(x,y,z)\,dV = \iint_{D_{xy}} \int_{z_\ell(x,y)}^{z_u(x,y)} f(x,y,z)\,dz\,dA.
\]

</div>

The order of integration can be chosen for convenience. A triple integral can be written as an iterated integral in \(3! = 6\) ways.

## 15.3 The Change of Variable Theorem

<div class="theorem">

<strong>Theorem 15.2 (Change of Variable for Triple Integrals).</strong> Let \((x,y,z) = F(u,v,w)\) be a one-to-one mapping of \(D_{uvw}\) onto \(D_{xyz}\) with continuous partials and non-zero Jacobian. If \(H\) is continuous on \(D_{xyz}\), then
\[
\iiint_{D_{xyz}} H(x,y,z)\,dx\,dy\,dz = \iiint_{D_{uvw}} H(F(u,v,w))\left|\frac{\partial(x,y,z)}{\partial(u,v,w)}\right|du\,dv\,dw.
\]

</div>

For cylindrical coordinates: \(\frac{\partial(x,y,z)}{\partial(r,\theta,z)} = r\).

For spherical coordinates: \(\frac{\partial(x,y,z)}{\partial(\rho,\theta,\phi)} = \rho^2 \sin\phi\).

---

# Appendix A: Implicitly Defined Functions

## A.1 Implicit Differentiation

If the equation \(f(x,y) = 0\) has a solution \(y = g(x)\), so that \(f(x,g(x)) = 0\), then differentiating implicitly with respect to \(x\) using the chain rule yields:
\[
g'(x) = -\frac{f_x(x, g(x))}{f_y(x, g(x))}, \quad \text{provided } f_y \neq 0.
\]

For \(f(x,y,z) = 0\) defining \(z = g(x,y)\) implicitly, the same technique gives \(g_x = -\frac{f_x}{f_z}\) and \(g_y = -\frac{f_y}{f_z}\), provided \(f_z \neq 0\).

## A.2 The Implicit Function Theorem

<div class="theorem">

<strong>Theorem A.1 (Implicit Function Theorem, 2D).</strong> Let \(f : \mathbb{R}^2 \to \mathbb{R}\), \(f \in C^1\) in a neighborhood of \((a,b)\). If \(f(a,b) = 0\) and \(f_y(a,b) \neq 0\), then there exists a neighborhood of \((a,b)\) in which the equation \(f(x,y) = 0\) has a unique solution \(y = g(x)\), where \(g : \mathbb{R} \to \mathbb{R}\) has a continuous derivative.

</div>

<div class="corollary">

<strong>Corollary A.1.</strong> If \(f : \mathbb{R}^2 \to \mathbb{R}\), \(f \in C^1\), \(f(a,b) = 0\), and \(\nabla f(a,b) \neq \mathbf{0}\), then near \((a,b)\) the equation \(f(x,y) = 0\) describes a smooth curve whose tangent at \((a,b)\) is orthogonal to \(\nabla f(a,b)\). If \(f_y(a,b) \neq 0\), the curve can be written as \(y = g(x)\); if \(f_x(a,b) \neq 0\), it can be written as \(x = h(y)\).

</div>

<div class="theorem">

<strong>Theorem A.2 (Implicit Function Theorem, 3D).</strong> Let \(f : \mathbb{R}^3 \to \mathbb{R}\), \(f \in C^1\) in a neighborhood of \(\mathbf{a}\). If \(f(\mathbf{a}) = 0\) and \(f_z(\mathbf{a}) \neq 0\), then there exists a neighborhood of \(\mathbf{a}\) in which \(f(x,y,z) = 0\) has a unique solution \(z = g(x,y)\), where \(g : \mathbb{R}^2 \to \mathbb{R}\) has continuous partial derivatives.

</div>

<div class="corollary">

<strong>Corollary A.2.</strong> If \(f : \mathbb{R}^3 \to \mathbb{R}\) has continuous partial derivatives, \(f(\mathbf{a}) = 0\), and \(\nabla f(\mathbf{a}) \neq \mathbf{0}\), then near \(\mathbf{a}\) the equation \(f(x,y,z) = 0\) describes a smooth surface in \(\mathbb{R}^3\) whose tangent plane at \(\mathbf{a}\) is orthogonal to \(\nabla f(\mathbf{a})\).

</div>

The key to remembering the theorem: the partial derivative that must be nonzero is the one with respect to the variable you wish to solve for.
