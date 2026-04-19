---
title: "AMATH 900: Mathematical Biology"
subjects: "AMATH"
---

## Sources and References

These notes draw primarily from the following publicly accessible texts. The principal reference for population ecology and mathematical modelling is Edelstein-Keshet, *Mathematical Models in Biology* (SIAM Classics in Applied Mathematics, 2005), which is freely available through SIAM's open-access programme. The two-volume treatise by Murray, *Mathematical Biology I: An Introduction* and *Mathematical Biology II: Spatial Models and Biomedical Applications* (Springer, 3rd edition, 2002–2003), provides deeper coverage of phase-plane methods, travelling waves, and pattern formation. For dynamical systems theory and bifurcation analysis the standard reference is Strogatz, *Nonlinear Dynamics and Chaos* (Westview Press, 2nd edition, 2014). Epidemiological compartmental models follow the framework of Anderson and May, *Infectious Diseases of Humans: Dynamics and Control* (Oxford University Press, 1991). Evolutionary game theory and replicator dynamics are treated in Nowak, *Evolutionary Dynamics: Exploring the Equations of Life* (Harvard University Press, 2006). For discrete-time ecology and structured population models, Kot, *Elements of Mathematical Ecology* (Cambridge University Press, 2001) is the standard reference.

---

# Chapter 1: Discrete-Time Population Models

## 1.1 Linear Difference Equations and Malthusian Growth

The simplest dynamical model of a biological population describes its size \( N_t \) at discrete, equally spaced time steps \( t = 0, 1, 2, \ldots \). If every individual in the population produces a fixed number of offspring per unit time and survival is constant, then the population obeys a **linear difference equation**

\[
N_{t+1} = \lambda N_t,
\]

where \( \lambda > 0 \) is the **finite rate of increase** (sometimes called the **Malthusian parameter** in its discrete form). The solution is immediate: \( N_t = \lambda^t N_0 \). When \( \lambda > 1 \) the population grows without bound, when \( \lambda < 1 \) it declines to extinction, and when \( \lambda = 1 \) it remains constant. This is the discrete analogue of exponential growth; it is sometimes called **Malthusian growth** after Thomas Malthus, who in 1798 articulated the principle that populations, left unchecked, grow geometrically.

A natural generalisation introduces a time-delay or a structured life-history. The **red blood cell model** due to Wazewska-Czyzewska and Lasota tracks the erythrocyte count \( R_t \) under the assumption that a fraction \( \gamma \) of cells die each day while the bone marrow produces new cells at a rate depending on the previous concentration:

\[
R_{t+1} = (1 - \gamma) R_t + \beta e^{-\alpha R_{t-k}},
\]

where \( k \) is a maturation delay, \( \beta \) is the maximum production rate, and \( \alpha \) quantifies feedback inhibition. This model captures the haematological phenomenon in which the body upregulates red-cell production when counts are low, creating oscillations that can model cyclic anaemia.

**Plant population growth** frequently involves seed banks, juvenile stages, and multiple age classes. A population with \( n \) distinct classes can be written as a vector equation \( \mathbf{N}_{t+1} = \mathbf{A} \mathbf{N}_t \), where \( \mathbf{A} \) is the **projection matrix** (also called the Leslie matrix for age-structured populations). The long-term dynamics are controlled by the dominant eigenvalue \( \lambda_1 \) of \( \mathbf{A} \): the population either grows, declines, or reaches a stable stage distribution depending on whether \( \lambda_1 \) exceeds, falls below, or equals unity. The corresponding right eigenvector gives the **stable stage distribution**, and the left eigenvector gives the **reproductive values** of each class — a concept traceable to R. A. Fisher's foundational work.

<div class="definition">
<strong>Definition 1.1 (Finite Rate of Increase).</strong> For a population whose size at time <em>t</em> is <em>N</em><sub><em>t</em></sub>, the finite rate of increase is <em>λ</em> = <em>N</em><sub><em>t</em>+1</sub>/<em>N</em><sub><em>t</em></sub>. It relates to the continuous intrinsic growth rate <em>r</em> by <em>λ</em> = e<sup><em>r</em></sup>, so that <em>λ</em> > 1 corresponds to <em>r</em> > 0, and <em>λ</em> = 1 to <em>r</em> = 0.
</div>

## 1.2 Nonlinear Difference Equations and the Logistic Map

When population size is large enough to cause resource depletion, the linear model is no longer adequate. The simplest nonlinear correction is the **logistic difference equation**

\[
N_{t+1} = r N_t \left(1 - \frac{N_t}{K}\right),
\]

where \( r \) is the intrinsic growth rate and \( K \) is the carrying capacity. Rescaling \( x_t = N_t / K \) yields the canonical **logistic map**

\[
x_{t+1} = r x_t (1 - x_t), \qquad x_t \in \left[0, 1\right].
\]

This deceptively simple one-dimensional map, studied in landmark work by Robert May in the 1970s, exhibits a rich bifurcation structure as the parameter \( r \) is increased from 0 to 4. For \( r < 1 \) the zero fixed point is the only attractor and the population goes extinct. For \( 1 < r < 3 \) a nontrivial fixed point \( x^* = 1 - 1/r \) exists and is globally attracting: the population reaches a stable equilibrium. At \( r = 3 \) this fixed point loses stability through a **period-doubling bifurcation**, and a stable 2-cycle appears. As \( r \) increases further, period doublings cascade: 2-cycles give way to 4-cycles at \( r \approx 3.449 \), then 8-cycles, 16-cycles, and so on, with successive bifurcations accumulating at a finite limit \( r_\infty \approx 3.570 \) beyond which the dynamics are generically **chaotic** — aperiodic, sensitive to initial conditions, and bounded.

The sequence of bifurcation values \( r_n \) converges geometrically at the universal **Feigenbaum ratio** \( \delta = \lim_{n \to \infty} (r_n - r_{n-1})/(r_{n+1} - r_n) \approx 4.669 \), a constant independent of the particular map, embodying the universality of period-doubling routes to chaos.

### 1.2.1 Cobwebbing

The qualitative dynamics of any one-dimensional map \( x_{t+1} = f(x_t) \) can be visualised by the **cobweb diagram** (also called staircase diagram). One plots the curve \( y = f(x) \) together with the diagonal \( y = x \). Starting from \( x_0 \) on the horizontal axis, one draws a vertical line to the curve, then a horizontal line to the diagonal, then another vertical to the curve, and so on. Fixed points are intersections of the curve with the diagonal; their stability is determined by the slope \( |f'(x^*)| \): the orbit converges toward \( x^* \) if \( |f'(x^*)| < 1 \) and diverges away if \( |f'(x^*)| > 1 \). Cobwebbing makes it immediately apparent whether a fixed point attracts or repels, and whether the approach is monotone (slope positive) or oscillatory (slope negative).

<div class="example">
<strong>Example 1.1 (Stability of the Logistic Map Fixed Point).</strong> The nontrivial fixed point of <em>x</em><sub><em>t</em>+1</sub> = <em>rx</em><sub><em>t</em></sub>(1 − <em>x</em><sub><em>t</em></sub>) satisfies <em>x</em>* = 1 − 1/<em>r</em>. Differentiating gives <em>f</em>'(<em>x</em>*) = <em>r</em>(1 − 2<em>x</em>*) = 2 − <em>r</em>. The fixed point is stable when |2 − <em>r</em>| < 1, i.e., 1 < <em>r</em> < 3. At <em>r</em> = 3 the slope equals −1, the period-doubling bifurcation threshold.
</div>

### 1.2.2 Cheyne-Stokes Respiration

Breathing irregularities in which periods of hyperventilation alternate with apnoea can be modelled by a discrete-time control system. In simplified form, let \( C_t \) denote the arterial CO\(_2\) concentration at the beginning of breath cycle \( t \). The respiratory controller responds to \( C_t \) after a delay of \( k \) cycles (the transit time from lungs to chemoreceptors), so

\[
V_{t} = V_\mathrm{min} + \alpha \max(C_{t-k} - \theta, \, 0),
\]

where \( V_t \) is the tidal volume, \( \theta \) is the apnoeic threshold, and \( \alpha \) is the chemoreceptor gain. The CO\(_2\) update equation balances production with respiratory clearance. Linearising around the steady state and computing the eigenvalues of the delayed linear map reveals that oscillatory instability arises when the gain \( \alpha \) is large or the delay \( k \) is long — consistent with clinical observations that Cheyne-Stokes breathing is associated with high ventilatory responsiveness and elevated circulation times in heart failure patients.

## 1.3 Population Genetics: Hardy-Weinberg, Selection, and Mutation

Population genetics provides perhaps the most elegant application of difference equations to biology. Consider a diploid population with two alleles \( A \) and \( a \) at a single locus. Let \( p_t \) denote the frequency of allele \( A \) and \( q_t = 1 - p_t \) the frequency of \( a \). In the absence of evolutionary forces, random mating produces the **Hardy-Weinberg** genotype frequencies:

\[
P(AA) = p^2, \qquad P(Aa) = 2pq, \qquad P(aa) = q^2.
\]

This is an equilibrium: if the population starts at Hardy-Weinberg proportions, random mating maintains them indefinitely. Hardy-Weinberg therefore provides the null model against which evolutionary processes are measured.

**Natural selection** breaks Hardy-Weinberg equilibrium. Assign relative fitnesses \( w_{AA} = 1 + s \), \( w_{Aa} = 1 + h s \), \( w_{aa} = 1 \), where \( s > 0 \) is the selection coefficient and \( h \in \left[0, 1\right] \) is the dominance coefficient. After selection, the frequency of \( A \) becomes

\[
p_{t+1} = \frac{p_t^2 w_{AA} + p_t q_t w_{Aa}}{\bar{w}_t},
\]

where \( \bar{w}_t = p_t^2 w_{AA} + 2 p_t q_t w_{Aa} + q_t^2 w_{aa} \) is the mean fitness. This defines a one-dimensional difference equation in \( p_t \). The key result, proved by direct analysis of the fixed points, is that if \( s > 0 \) and \( h \geq 0 \) (so \( A \) is at least partially dominant), allele \( A \) will eventually fix at \( p = 1 \). Heterozygote advantage (\( h < 0 \), overdominance) maintains a **stable polymorphism** at an interior fixed point.

**Mutation** at rate \( \mu \) (from \( A \) to \( a \)) and \( \nu \) (from \( a \) to \( A \)) modifies the recurrence to

\[
p_{t+1} = p_t (1 - \mu) + (1 - p_t) \nu,
\]

whose stable fixed point is \( p^* = \nu / (\mu + \nu) \), the mutation–selection balance frequency when selection is also included. **Genetic drift** — random sampling variation in finite populations of size \( N \) — introduces stochasticity: allele frequencies perform a random walk and eventually fix at 0 or 1 with probabilities equal to their initial frequencies (in the neutral case). The expected time to fixation scales as \( 4N \) generations, setting the timescale of molecular evolution.

<div class="theorem">
<strong>Theorem 1.1 (Fundamental Theorem of Natural Selection, Fisher 1930).</strong> Under directional or stabilising selection, mean fitness <em>w̄</em><sub><em>t</em></sub> is non-decreasing over time: Δ<em>w̄</em> ≥ 0. Equality holds only at equilibrium. Mean fitness therefore plays the role of a Lyapunov function for the allele-frequency dynamics.
</div>

---

# Chapter 2: Continuous Population Dynamics

## 2.1 Exponential and Logistic Growth

In continuous time, the simplest population model is the **exponential growth** equation

\[
\frac{dN}{dt} = r N,
\]

with solution \( N(t) = N_0 e^{rt} \). This is mathematically identical to the discrete Malthusian model with \( \lambda = e^r \). While exponential growth is sometimes observed over short time horizons — in bacterial cultures or invasive species early in colonisation — it cannot persist indefinitely in any finite ecosystem.

The classical remedy, proposed independently by Verhulst in 1838 and rediscovered by Pearl and Reed in 1920, is the **logistic equation**

\[
\frac{dN}{dt} = r N \left(1 - \frac{N}{K}\right).
\]

The term \( 1 - N/K \) represents intraspecific competition: as \( N \) approaches the carrying capacity \( K \), the per-capita growth rate declines linearly to zero. The fixed points are \( N^* = 0 \) (unstable) and \( N^* = K \) (stable). The explicit solution,

\[
N(t) = \frac{K}{1 + \left(\frac{K}{N_0} - 1\right) e^{-rt}},
\]

is the **logistic curve**: a sigmoid that rises slowly when \( N \ll K \), accelerates near \( N = K/2 \), and saturates as \( N \to K \).

### 2.1.1 Allee Effects

In some species, low population density impairs reproduction rather than enhancing per-capita growth. This phenomenon, known as the **Allee effect**, can arise from difficulty in finding mates, reduced group defence against predators, or disrupted cooperative foraging. A simple model incorporating a strong Allee effect is

\[
\frac{dN}{dt} = r N \left(\frac{N}{A} - 1\right) \left(1 - \frac{N}{K}\right),
\]

where \( A \) is the Allee threshold with \( 0 < A < K \). The fixed points are \( N^* = 0 \), \( N^* = A \), and \( N^* = K \). Analysis shows \( N^* = 0 \) and \( N^* = K \) are stable, while \( N^* = A \) is unstable, creating a **bistable** system: populations above the Allee threshold grow to \( K \), while those below it decline to extinction. The Allee threshold \( A \) is a **separatrix** dividing the basins of attraction of the two stable states.

<div class="remark">
<strong>Remark.</strong> The Allee effect has important conservation implications. A small population reduced below <em>A</em> by habitat fragmentation or harvesting may collapse to extinction even if the environment could support the species at carrying capacity. This creates an extinction debt that is not apparent from equilibrium analysis alone.
</div>

## 2.2 Phase-Plane Methods

Most interesting biological models involve two or more interacting populations, requiring analysis in the phase plane. For a two-dimensional autonomous system

\[
\frac{dx}{dt} = f(x, y), \qquad \frac{dy}{dt} = g(x, y),
\]

the **phase plane** is the \( (x, y) \)-plane, and **trajectories** are curves traced by solutions as \( t \) advances. The key tools are:

**Nullclines** are the curves where \( dx/dt = 0 \) (the \( x \)-nullcline, \( f(x,y) = 0 \)) and \( dy/dt = 0 \) (the \( y \)-nullcline, \( g(x,y) = 0 \)). Their intersections are the **fixed points** (equilibria) of the system. Between nullclines, the signs of \( f \) and \( g \) determine the direction of the flow, allowing a qualitative sketch of the dynamics without solving the equations explicitly.

**Linear stability analysis** at a fixed point \( (x^*, y^*) \) involves computing the **Jacobian matrix**

\[
J = \begin{pmatrix} \partial f / \partial x & \partial f / \partial y \\ \partial g / \partial x & \partial g / \partial y \end{pmatrix}_{(x^*, y^*)}.
\]

The nature of the fixed point is determined by the eigenvalues \( \lambda_{1,2} \) of \( J \). They are related to the trace \( \tau = \lambda_1 + \lambda_2 \) and determinant \( \Delta = \lambda_1 \lambda_2 \) by \( \lambda^2 - \tau \lambda + \Delta = 0 \). The classification is as follows: if \( \Delta < 0 \) the fixed point is a saddle; if \( \Delta > 0 \) and \( \tau^2 - 4\Delta > 0 \) it is a node (stable if \( \tau < 0 \), unstable if \( \tau > 0 \)); if \( \tau^2 - 4\Delta < 0 \) it is a spiral (stable if \( \tau < 0 \), unstable if \( \tau > 0 \)); and if \( \tau = 0 \), \( \Delta > 0 \) it is a centre.

<div class="definition">
<strong>Definition 2.1 (Limit Cycle).</strong> An isolated closed trajectory in the phase plane is called a <strong>limit cycle</strong>. A stable limit cycle attracts nearby trajectories from both inside and outside, producing self-sustained oscillations. The Poincaré-Bendixson theorem guarantees that in a bounded, positively invariant region of the plane containing no fixed points, there must exist at least one limit cycle.
</div>

### 2.2.1 Bifurcations

A **bifurcation** occurs when a qualitative change in the phase portrait takes place as a parameter is varied. The most biologically important bifurcations are:

The **saddle-node bifurcation** (also called fold bifurcation) involves two fixed points colliding and annihilating as a parameter crosses a critical value. In ecology, this underlies the Allee effect: increasing harvesting pressure can eliminate the positive equilibrium by colliding it with the Allee threshold.

The **transcritical bifurcation** involves an exchange of stability between two fixed points that collide at the bifurcation point. It is the generic bifurcation in population models where the zero fixed point (extinction) exchanges stability with a positive equilibrium as the growth rate crosses zero.

The **Hopf bifurcation** converts a stable spiral into an unstable spiral (or vice versa) as the trace of the Jacobian changes sign, with a limit cycle being born (supercritical Hopf) or destroyed (subcritical Hopf). Hopf bifurcations are central to understanding oscillatory population dynamics, including predator-prey cycles.

## 2.3 Predator-Prey Models

### 2.3.1 The Lotka-Volterra System

The archetypical predator-prey model was proposed independently by Alfred Lotka (1925) and Vito Volterra (1926) to explain oscillations in the fish populations of the Adriatic Sea. Let \( N \) denote prey density and \( P \) predator density. The model is

\[
\frac{dN}{dt} = a N - b N P,
\]

\[
\frac{dP}{dt} = c N P - d P,
\]

where \( a \) is the prey intrinsic growth rate, \( b \) is the predation rate per encounter, \( c \) is the conversion efficiency of prey into predators, and \( d \) is the predator death rate. The fixed points are \( (0, 0) \) (trivial, a saddle) and

\[
(N^*, P^*) = \left(\frac{d}{c}, \; \frac{a}{b}\right).
\]

At the interior fixed point the Jacobian has trace \( \tau = 0 \) and determinant \( \Delta = ad > 0 \), so the linearisation predicts a centre — neutrally stable oscillations. This is not an artefact: the system possesses a conserved quantity (first integral)

\[
V(N, P) = c N - d \ln N + b P - a \ln P = \mathrm{const},
\]

whose level curves are the closed trajectories surrounding the equilibrium. The Lotka-Volterra system is therefore structurally fragile: any perturbation to the model (intraspecific competition in the prey, predator satiation) will generally destroy the centres and replace them with either a stable spiral (damped oscillations) or a limit cycle.

<div class="remark">
<strong>Remark (Volterra's Principle).</strong> Volterra used his model to explain an observation of D'Ancona: during World War I, when fishing was reduced in the Adriatic, the fraction of sharks and rays (predators) in the catch increased. The model predicts that uniform reduction of both populations (as indiscriminate fishing does) increases average prey density but decreases average predator density, qualitatively consistent with the observation.
</div>

### 2.3.2 Functional Responses

A key limitation of the Lotka-Volterra model is that the per-predator consumption rate \( b N \) grows without bound as \( N \to \infty \), which is biologically unrealistic. **Functional responses** describe the actual relationship between prey density and predation rate per predator. C. S. Holling (1959) classified three types:

The **Type I** functional response is the linear response \( f(N) = b N \), appropriate for filter feeders with no handling time.

The **Type II** functional response, also called the **Michaelis-Menten** or hyperbolic response, saturates due to predator handling time:

\[
f(N) = \frac{a N}{1 + a h N},
\]

where \( h \) is the handling time per prey item. At high prey density, \( f(N) \to 1/h \), the maximum consumption rate. This is the most commonly observed response in nature.

The **Type III** functional response is sigmoidal:

\[
f(N) = \frac{a N^2}{1 + a h N^2}.
\]

It has a low predation rate at low prey density (e.g., because predators switch to alternative prey) and then accelerates before saturating. It can produce prey refugia and allow prey to escape predation at low densities.

### 2.3.3 The Rosenzweig-MacArthur Model

Incorporating logistic prey growth and a Type II functional response gives the **Rosenzweig-MacArthur model**:

\[
\frac{dN}{dt} = r N \left(1 - \frac{N}{K}\right) - \frac{a N P}{1 + a h N},
\]

\[
\frac{dP}{dt} = \frac{e a N P}{1 + a h N} - m P,
\]

where \( e \) is conversion efficiency and \( m \) is predator mortality. The prey nullcline is now a hump-shaped curve in the \( (N, P) \) phase plane, peaking at \( N = 1/(ah) \). The predator nullcline is a vertical line at \( N^* = m / (ea - mah) \). The position of the predator nullcline relative to the peak of the prey nullcline determines stability:

- If \( N^* \) lies to the right of the peak (low \( K \)), the fixed point is stable (a stable spiral or node).
- If \( N^* \) lies to the left of the peak (high \( K \)), the fixed point is unstable and a limit cycle exists.

This leads to the celebrated **Paradox of Enrichment** (Rosenzweig, 1971): increasing the carrying capacity \( K \) (enriching the environment) can destabilise the equilibrium and produce large-amplitude oscillations that may drive one or both populations to extinction. Enrichment is thus not always beneficial.

<div class="theorem">
<strong>Theorem 2.1 (Paradox of Enrichment).</strong> In the Rosenzweig-MacArthur model, there exists a critical carrying capacity <em>K</em><sub>c</sub> such that for <em>K</em> < <em>K</em><sub>c</sub> the interior equilibrium is stable, and for <em>K</em> > <em>K</em><sub>c</sub> it is unstable with a stable limit cycle surrounding it. The destabilisation occurs through a supercritical Hopf bifurcation at <em>K</em> = <em>K</em><sub>c</sub>.
</div>

## 2.4 Competition Models

### 2.4.1 Lotka-Volterra Competition

Consider two species competing for the same limiting resource. Let \( N_1 \) and \( N_2 \) denote their densities, with \( K_1, K_2 \) their carrying capacities and \( r_1, r_2 \) their intrinsic growth rates. The **Lotka-Volterra competition equations** are

\[
\frac{dN_1}{dt} = r_1 N_1 \left(1 - \frac{N_1 + \alpha_{12} N_2}{K_1}\right),
\]

\[
\frac{dN_2}{dt} = r_2 N_2 \left(1 - \frac{N_2 + \alpha_{21} N_1}{K_2}\right),
\]

where \( \alpha_{12} \) is the competitive effect of species 2 on species 1 (measured in units of species-1 individuals), and \( \alpha_{21} \) is the reverse. The nullclines are lines in the \( (N_1, N_2) \) plane:

\[
N_1\text{-nullcline:} \quad N_1 + \alpha_{12} N_2 = K_1,
\]

\[
N_2\text{-nullcline:} \quad \alpha_{21} N_1 + N_2 = K_2.
\]

Four qualitatively distinct outcomes arise depending on the relative positions of the nullclines:

1. **Species 1 wins** (\( K_1/\alpha_{12} > K_2 \) and \( K_1 > K_2/\alpha_{21} \)): the \( N_1 \) nullcline lies above the \( N_2 \) nullcline throughout; species 2 is excluded.
2. **Species 2 wins** (opposite inequalities): species 1 is excluded.
3. **Unstable coexistence** (\( K_1/\alpha_{12} < K_2 \) and \( K_1 > K_2/\alpha_{21} \)): the nullclines cross, but the interior equilibrium is a saddle. Depending on initial conditions, one species excludes the other (priority effects).
4. **Stable coexistence** (\( K_1/\alpha_{12} > K_2 \) and \( K_1 < K_2/\alpha_{21} \)): the interior equilibrium is a stable node. Coexistence requires that intraspecific competition exceed interspecific competition for both species (\( \alpha_{12} \alpha_{21} < 1 \)).

### 2.4.2 The Competitive Exclusion Principle

The **Competitive Exclusion Principle**, associated with Gause (1934) and Hardin (1960), states that two species competing for a single limiting resource cannot coexist at a stable equilibrium. More precisely, at steady state only one species can persist unless the two species are ecologically identical. This is captured in the model: stable coexistence requires \( \alpha_{12} \alpha_{21} < 1 \), meaning interspecific competition must be weaker than intraspecific competition, implying the two species are limited by different factors or niche components.

<div class="remark">
<strong>Remark.</strong> The Competitive Exclusion Principle is a mathematical theorem about a particular model, not an inviolable law of nature. Real communities contain many more species than limiting resources (the "paradox of the plankton"), suggesting that non-equilibrium dynamics, spatial heterogeneity, keystone predation, or explicit resource models are needed to explain natural diversity. However, the principle provides an indispensable null model.
</div>

---

# Chapter 3: Epidemiological Models

## 3.1 The SIR Model

The mathematical theory of infectious disease dynamics dates to the foundational work of Kermack and McKendrick (1927). The **SIR model** partitions a closed population of total size \( N \) into three compartments: **susceptible** (\( S \)), **infectious** (\( I \)), and **recovered** (or removed, \( R \)) individuals. The dynamics are governed by

\[
\frac{dS}{dt} = -\beta S I,
\]

\[
\frac{dI}{dt} = \beta S I - \gamma I,
\]

\[
\frac{dR}{dt} = \gamma I,
\]

where \( \beta \) is the **transmission rate** (number of effective contacts per unit time per infectious individual) and \( \gamma \) is the **recovery rate** (so that the mean infectious period is \( 1/\gamma \)). Since \( S + I + R = N \) is constant, the system is effectively two-dimensional.

The key quantity governing epidemic dynamics is the **basic reproduction number**

\[
\mathcal{R}_0 = \frac{\beta N}{\gamma}.
\]

\( \mathcal{R}_0 \) is the expected number of secondary infections caused by a single infectious individual introduced into a fully susceptible population. When \( \mathcal{R}_0 > 1 \), the disease-free equilibrium \( (S, I, R) = (N, 0, 0) \) is unstable and an epidemic occurs. When \( \mathcal{R}_0 < 1 \), the disease-free equilibrium is stable and the pathogen cannot invade.

### 3.1.1 The Epidemic Threshold and Final Size

The condition for epidemic growth is \( dI/dt > 0 \), which requires \( \beta S / \gamma > 1 \), i.e., \( S > N / \mathcal{R}_0 \). As the epidemic progresses, \( S \) decreases; once \( S \) falls below \( N/\mathcal{R}_0 \), the incidence begins to decline even though many susceptibles remain. This is the **epidemic threshold theorem**: the epidemic peaks when \( S = \gamma/\beta \) and then declines.

The **final size** of the epidemic — the total fraction \( r_\infty = R(\infty)/N \) of the population that is eventually infected — satisfies the transcendental equation

\[
1 - r_\infty = e^{-\mathcal{R}_0 r_\infty},
\]

derived by integrating \( dS/dR = -\mathcal{R}_0 S/N \) and using the initial conditions. For large \( \mathcal{R}_0 \), \( r_\infty \to 1 \) (nearly everyone is infected); for \( \mathcal{R}_0 \) just above 1, \( r_\infty \) is small but nonzero.

<div class="example">
<strong>Example 3.1 (Influenza Epidemic).</strong> For seasonal influenza, typical estimates give <em>R</em><sub>0</sub> ≈ 2–3. With <em>R</em><sub>0</sub> = 2.5, the final size equation gives <em>r</em><sub>∞</sub> ≈ 0.89, meaning roughly 89% of a fully susceptible population would eventually be infected in a major epidemic — consistent with historical pandemic data from novel strains.
</div>

## 3.2 Herd Immunity and Vaccination

**Herd immunity** is achieved when enough of the population is immune that the pathogen can no longer sustain transmission. At the herd immunity threshold, the effective reproduction number \( \mathcal{R}_\mathrm{eff} = \mathcal{R}_0 (1 - p) = 1 \), giving the critical vaccination coverage

\[
p_c = 1 - \frac{1}{\mathcal{R}_0}.
\]

For measles with \( \mathcal{R}_0 \approx 15 \), \( p_c \approx 0.93 \), meaning 93% coverage is needed. For COVID-19 (original strain, \( \mathcal{R}_0 \approx 2.5 \)), \( p_c \approx 0.60 \). This formula explains why diseases with high transmissibility require near-universal vaccination to achieve population-level protection.

In the SIR model with vaccination, a fraction \( p \) of newborns are vaccinated (and immediately immune). At endemic steady state, the fraction of susceptibles in the population is \( S^*/N = 1/\mathcal{R}_0 \), independent of the birth and death rates. Vaccination reduces the effective susceptible pool, equivalent to reducing \( \mathcal{R}_0 \) to \( \mathcal{R}_0 (1 - p) \). Disease eradication requires \( \mathcal{R}_0 (1 - p) < 1 \), recovering \( p > p_c \).

<div class="definition">
<strong>Definition 3.1 (Basic Reproduction Number).</strong> The basic reproduction number <em>R</em><sub>0</sub> is the expected number of secondary cases produced by a single infectious individual in an entirely susceptible population, in the absence of any control interventions. It determines whether an infectious agent can spread in a population: invasion requires <em>R</em><sub>0</sub> > 1.
</div>

## 3.3 The SEIR Model

Many diseases have a latent period between infection and infectiousness. The **SEIR model** adds an **exposed** compartment \( E \) of individuals who are infected but not yet infectious:

\[
\frac{dS}{dt} = -\beta S I,
\]

\[
\frac{dE}{dt} = \beta S I - \sigma E,
\]

\[
\frac{dI}{dt} = \sigma E - \gamma I,
\]

\[
\frac{dR}{dt} = \gamma I,
\]

where \( 1/\sigma \) is the mean latent period. The basic reproduction number remains \( \mathcal{R}_0 = \beta N / \gamma \), but the dynamics now differ from the SIR model: the latent period introduces a delay between infection and infectiousness, smoothing and flattening the epidemic curve. The SEIR model is appropriate for diseases like COVID-19, measles, and influenza, where the incubation period is epidemiologically significant.

## 3.4 The Ross-Macdonald Model for Vector-Borne Diseases

For diseases transmitted by vectors (mosquitoes, ticks), the two-host nature of the transmission cycle requires a separate model. The **Ross-Macdonald model** tracks susceptible and infectious humans (\( S_H, I_H \)) and susceptible and infectious mosquitoes (\( S_V, I_V \)):

\[
\frac{dI_H}{dt} = \frac{a b M}{N_H} I_V S_H - r I_H,
\]

\[
\frac{dI_V}{dt} = a c I_H S_V - \mu I_V,
\]

where \( a \) is the biting rate, \( b \) is the probability of transmission from an infectious mosquito to a susceptible human, \( c \) is the reverse probability, \( M \) is total mosquito density, \( N_H \) is human population size, \( r \) is the human recovery rate, and \( \mu \) is the mosquito death rate. The basic reproduction number is

\[
\mathcal{R}_0 = \frac{a^2 b c M}{\mu r N_H},
\]

which scales with the square of the biting rate (reflecting the need for two biting events per transmission cycle) and inversely with mosquito mortality (since mosquitoes must survive the extrinsic incubation period). This formula, developed by Ross (1911) and elaborated by Macdonald (1952) for malaria, identifies mosquito mortality as the single most important parameter for control.

---

# Chapter 4: Evolutionary Game Theory

## 4.1 Classical Game Theory and Evolutionary Stability

Classical game theory, developed by von Neumann and Morgenstern and axiomatised by Nash, analyses rational strategic interaction between players. In the biological context, **evolutionary game theory** (Maynard Smith and Price, 1973) replaces rationality with natural selection: strategies that yield higher fitness spread, while poorly performing strategies are eliminated. The payoff matrix quantifies fitness rather than utility.

Consider a population playing two strategies, **cooperate** (\( C \)) and **defect** (\( D \)), with the payoff matrix

\[
\begin{pmatrix} R & S \\ T & P \end{pmatrix},
\]

where \( R \) is the reward for mutual cooperation, \( T \) is the temptation to defect against a cooperator, \( S \) is the sucker's payoff for cooperating against a defector, and \( P \) is the punishment for mutual defection. For the **Prisoner's Dilemma**, \( T > R > P > S \), making defection the dominant strategy regardless of what the opponent plays. Yet mutual defection is Pareto-suboptimal.

<div class="definition">
<strong>Definition 4.1 (Evolutionarily Stable Strategy).</strong> A strategy <em>I</em> is an <strong>evolutionarily stable strategy</strong> (ESS) if a population of <em>I</em>-players cannot be invaded by a mutant playing any alternative strategy <em>J</em>. Formally, <em>I</em> is an ESS if either (i) <em>E</em>(<em>I</em>, <em>I</em>) > <em>E</em>(<em>J</em>, <em>I</em>), or (ii) <em>E</em>(<em>I</em>, <em>I</em>) = <em>E</em>(<em>J</em>, <em>I</em>) and <em>E</em>(<em>I</em>, <em>J</em>) > <em>E</em>(<em>J</em>, <em>J</em>), where <em>E</em>(<em>X</em>, <em>Y</em>) is the payoff to strategy <em>X</em> when playing against strategy <em>Y</em>.
</div>

The concept of ESS was introduced by Maynard Smith and Price to analyse the evolution of animal fighting behaviour. In a **Hawk-Dove** game with cost \( C \) and benefit \( V \) (\( C > V \)), pure Hawk is not an ESS (a Dove mutant can invade a Hawk population), pure Dove is not an ESS (a Hawk mutant can invade), but a mixed ESS exists at the Hawk frequency \( p^* = V/C \).

## 4.2 Replicator Dynamics

The **replicator equation** is the continuous-time dynamic that models natural selection acting on strategy frequencies. For \( n \) strategies with frequencies \( x_i \) (\( \sum_i x_i = 1 \)) and fitness \( f_i \),

\[
\frac{dx_i}{dt} = x_i \left(f_i - \bar{f}\right),
\]

where \( \bar{f} = \sum_j x_j f_j \) is the mean fitness. A strategy grows in frequency when its fitness exceeds the population mean, and declines when below. For a two-strategy game with payoff matrix

\[
A = \begin{pmatrix} a & b \\ c & d \end{pmatrix},
\]

let \( x \) be the frequency of strategy 1 and \( 1-x \) that of strategy 2. The fitnesses are \( f_1 = ax + b(1-x) \) and \( f_2 = cx + d(1-x) \), so the replicator equation reduces to

\[
\frac{dx}{dt} = x(1-x)\left[(a-c)x + (b-d)(1-x)\right].
\]

Fixed points occur at \( x = 0 \), \( x = 1 \), and (if it exists in \( (0,1) \)) the interior equilibrium

\[
x^* = \frac{d - b}{(a - c) + (d - b)}.
\]

The replicator equation is intimately related to game-theoretic equilibria: **Nash equilibria** correspond to fixed points of the replicator dynamics, and **ESSs** correspond to asymptotically stable fixed points. This connection provides the dynamical foundation for evolutionary game theory.

<div class="theorem">
<strong>Theorem 4.1 (Folk Theorem of Evolutionary Game Theory).</strong> Every ESS is a Nash equilibrium, and every strict Nash equilibrium is an ESS. However, not every Nash equilibrium is an ESS; in particular, mixed Nash equilibria need not be stable under replicator dynamics.
</div>

### 4.2.1 The Evolution of Cooperation

Understanding why cooperation evolves despite the apparent advantage of defection is one of the central problems of evolutionary biology. Several mechanisms can support cooperative equilibria:

**Kin selection** (Hamilton's rule): cooperation evolves when \( rb > c \), where \( b \) is the benefit to the recipient, \( c \) is the cost to the actor, and \( r \) is the relatedness coefficient. When interacting partners share genes, helping relatives increases inclusive fitness.

**Reciprocal altruism** (Trivers, 1971): in repeated Prisoner's Dilemma games, the strategy **tit-for-tat** (cooperate on the first move, then copy the opponent's last move) can be an ESS, supporting mutual cooperation through conditional reciprocity.

**Group selection** and **multi-level selection** models in which cooperation-enforcing group-level selection can overwhelm individual-level defection have been formalised in the **multilevel replicator equation**, which tracks both within-group and between-group selection simultaneously.

**Network reciprocity**: on spatial graphs where individuals interact only with neighbours, cooperators can form clusters that shield them from exploitation by defectors. The condition for cooperation to spread is approximately \( b/c > k \), where \( k \) is the average degree of the interaction network.

### 4.2.2 Frequency-Dependent Selection and Polymorphism

Frequency-dependent selection occurs when the fitness of a strategy depends on how common it is. Negative frequency dependence — where rare strategies have higher fitness — tends to maintain polymorphism, while positive frequency dependence leads to winner-take-all dynamics. The replicator equation naturally incorporates both: the interior fixed point \( x^* \) is stable (negative frequency-dependent selection operating near \( x^* \)) when \( a < c \) and \( b > d \), corresponding to the coexistence or mixed-strategy regime.

---

# Chapter 5: Spatial Models and Reaction-Diffusion Equations

## 5.1 Fickian Diffusion

In a spatially extended environment, individuals do not remain stationary but move through random or directed motion. The simplest model of spatial spread is **Fickian diffusion**. Consider a population density \( u(x, t) \) in one spatial dimension. If each individual performs an unbiased random walk with mean-squared displacement proportional to time, then in the continuum limit, the population density satisfies the **diffusion equation**

\[
\frac{\partial u}{\partial t} = D \frac{\partial^2 u}{\partial x^2},
\]

where \( D > 0 \) is the **diffusion coefficient** (units: length\(^2\)/time). The fundamental solution (Green's function) for an initial point source \( u(x, 0) = \delta(x) \) is the Gaussian

\[
u(x, t) = \frac{1}{\sqrt{4\pi D t}} \exp\!\left(-\frac{x^2}{4Dt}\right),
\]

spreading with characteristic width \( \sigma = \sqrt{2Dt} \). Fickian diffusion captures passive dispersal, molecular diffusion, and the mean-field limit of individual random movement.

More generally, combining local population dynamics with spatial diffusion gives a **reaction-diffusion equation** (also called a **parabolic PDE**):

\[
\frac{\partial u}{\partial t} = D \frac{\partial^2 u}{\partial x^2} + f(u),
\]

where \( f(u) \) encodes local birth, death, and interaction terms. The interaction between diffusion (which spreads and smooths spatial variation) and reaction (which amplifies or dampens perturbations) can give rise to a rich variety of spatial patterns and propagating waves.

## 5.2 The Fisher-KPP Equation and Travelling Waves

### 5.2.1 Derivation and Biological Context

The **Fisher-KPP equation** (Fisher, 1937; Kolmogorov, Petrovskii, and Piskunov, 1937) is the prototypical reaction-diffusion model for population spread:

\[
\frac{\partial u}{\partial t} = D \frac{\partial^2 u}{\partial x^2} + r u \left(1 - \frac{u}{K}\right).
\]

Fisher introduced this equation to describe the spread of an advantageous gene through a spatially distributed population. It combines logistic growth (which drives the population toward carrying capacity locally) with diffusion (which spreads the population into unoccupied territory). The equation also models the spatial spread of invasive species, epidemics, and range expansions.

The spatially homogeneous steady states are \( u = 0 \) (unstable: linearised growth rate \( r > 0 \)) and \( u = K \) (stable: carrying capacity). Starting from a localised initial population \( u(x, 0) \) that is nonzero only near the origin, one anticipates the solution to develop a **travelling wave** — a wave profile connecting \( u = K \) (behind the wave) to \( u = 0 \) (ahead of the wave) that translates with constant speed \( c \) without changing shape.

### 5.2.2 Travelling Wave Analysis

A **travelling wave solution** has the form \( u(x, t) = U(\xi) \) with \( \xi = x - ct \) (\( c > 0 \)), so the PDE reduces to the ODE system

\[
D U'' + c U' + r U\left(1 - \frac{U}{K}\right) = 0,
\]

or equivalently, setting \( V = U' \),

\[
U' = V, \qquad V' = -\frac{c}{D} V - \frac{r}{D} U\left(1 - \frac{U}{K}\right).
\]

The fixed points of this two-dimensional ODE system are \( (U, V) = (0, 0) \) (corresponding to the leading edge, \( u = 0 \) ahead of the wave) and \( (U, V) = (K, 0) \) (the trailing state, \( u = K \)). The eigenvalues at the origin are

\[
\lambda = \frac{1}{2D}\left(-c \pm \sqrt{c^2 - 4rD}\right).
\]

For the wave to connect \( U = K \) to \( U = 0 \) with \( U \geq 0 \) everywhere (a biologically required non-negativity constraint), the origin must be an unstable node rather than an unstable spiral, which requires \( c^2 \geq 4rD \). This yields the **minimum wave speed**

\[
c_\mathrm{min} = 2\sqrt{rD}.
\]

<div class="theorem">
<strong>Theorem 5.1 (Wave Speed Selection for Fisher-KPP).</strong> For the Fisher-KPP equation with compactly supported initial data (initial condition with bounded support), the solution converges to a travelling wave of the minimum speed <em>c</em><sub>min</sub> = 2√(<em>rD</em>). Steeper initial conditions (exponentially decaying ahead of the wave) can select speeds <em>c</em> > <em>c</em><sub>min</sub>. This is the KPP wave speed selection theorem, proved rigorously by Kolmogorov, Petrovskii, and Piskunov (1937) and extended by Aronson and Weinberger (1975).
</div>

The formula \( c_\mathrm{min} = 2\sqrt{rD} \) has immediate biological interpretability: faster intrinsic growth rate (large \( r \)) and higher mobility (large \( D \)) both accelerate the range expansion. The dependence on \( \sqrt{D} \) reflects the diffusive nature of the spreading mechanism.

<div class="example">
<strong>Example 5.1 (Muskrat Range Expansion).</strong> Muskrats (<em>Ondatra zibethicus</em>) were introduced to central Europe in 1905 and spread at a roughly constant rate. Using estimates <em>r</em> ≈ 0.3 yr<sup>−1</sup> and <em>D</em> ≈ 230 km² yr<sup>−1</sup>, the predicted minimum wave speed is <em>c</em><sub>min</sub> = 2√(0.3 × 230) ≈ 16.6 km yr<sup>−1</sup>, consistent with the observed rate of roughly 15–25 km yr<sup>−1</sup> documented by Skellam (1951) in an early application of diffusion models to ecology.
</div>

### 5.2.3 Travelling Waves in Epidemics

The Fisher-KPP framework extends naturally to epidemic spreading. Consider an SI model (susceptible-infectious) on a one-dimensional spatial domain:

\[
\frac{\partial S}{\partial t} = D_S \frac{\partial^2 S}{\partial x^2} - \beta S I,
\]

\[
\frac{\partial I}{\partial t} = D_I \frac{\partial^2 I}{\partial x^2} + \beta S I - \gamma I.
\]

If the susceptible population is initially at carrying capacity (\( S_0 = N \)) and a small infectious focus is introduced, the wave of infection propagates with speed \( c \geq 2\sqrt{D_I (\beta N - \gamma)} = 2\sqrt{D_I \gamma (\mathcal{R}_0 - 1)} \), which vanishes as \( \mathcal{R}_0 \to 1^+ \). Historical data on the spread of the Black Death and 20th-century rabies epizootics have been analysed using this framework.

## 5.3 Diffusion-Driven Instability and Turing Patterns

### 5.3.1 The Turing Mechanism

One of the most striking results in mathematical biology is the mechanism proposed by Alan Turing in 1952 for the spontaneous generation of spatial pattern from a spatially uniform state. Turing showed that a **reaction-diffusion system** that is stable in the absence of diffusion can be driven unstable by diffusion if the two diffusing species have sufficiently different diffusion coefficients.

Consider a general two-component reaction-diffusion system in one spatial dimension:

\[
\frac{\partial u}{\partial t} = D_u \frac{\partial^2 u}{\partial x^2} + f(u, v),
\]

\[
\frac{\partial v}{\partial t} = D_v \frac{\partial^2 v}{\partial x^2} + g(u, v),
\]

where \( u \) is an **activator** (a species that promotes its own production) and \( v \) is an **inhibitor** (a species that represses activation). The key insight is that if the inhibitor diffuses much faster than the activator (\( D_v \gg D_u \)), a local perturbation can trigger local activation while long-range inhibition prevents activation elsewhere, producing stationary spatial patterns.

### 5.3.2 Linear Stability Analysis

Let \( (u_0, v_0) \) be the uniform steady state satisfying \( f(u_0, v_0) = 0 \) and \( g(u_0, v_0) = 0 \). The Jacobian of the reaction terms is

\[
J_0 = \begin{pmatrix} f_u & f_v \\ g_u & g_v \end{pmatrix}.
\]

For the uniform state to be stable without diffusion, the Routh-Hurwitz conditions require \( \tau_0 = f_u + g_v < 0 \) and \( \delta_0 = f_u g_v - f_v g_u > 0 \).

With diffusion, the perturbation \( (u, v) = (u_0, v_0) + (\hat{u}, \hat{v}) e^{\sigma t + ikx} \) satisfies the dispersion relation

\[
\sigma^2 - \left(\tau_0 - (D_u + D_v) k^2\right) \sigma + h(k^2) = 0,
\]

where

\[
h(k^2) = D_u D_v k^4 - (D_v f_u + D_u g_v) k^2 + \delta_0.
\]

Diffusion-driven instability (Turing instability) occurs when \( h(k^2) < 0 \) for some wavenumber \( k \), while the uniform state remains stable for \( k = 0 \). The necessary conditions are:

1. \( f_u + g_v < 0 \) (stability without diffusion)
2. \( f_u g_v - f_v g_u > 0 \) (stability without diffusion)
3. \( D_v f_u + D_u g_v > 0 \) (required for the \( k^2 \) coefficient to be negative, i.e., the activator's self-activation must dominate)
4. \( (D_v f_u + D_u g_v)^2 - 4 D_u D_v \delta_0 > 0 \) (the discriminant of \( h(k^2) \) viewed as a quadratic in \( k^2 \) must be positive)

Conditions 1 and 3 together require \( f_u > 0 \) (the activator activates itself) and \( g_v < 0 \) (the inhibitor self-inhibits), with \( g_v \) sufficiently negative to overcome the positive contribution from \( f_u \). Condition 4 requires that the diffusion ratio \( d = D_v/D_u \) be sufficiently large:

\[
d > d_\mathrm{c} = \frac{\delta_0 + 2 D_u f_u g_v - 2\sqrt{D_u^2 f_u^2 g_v^2 - D_u^2 \delta_0 f_u^2}}{f_u^2 - g_v^2 / d}.
\]

More concisely, a sufficient condition is \( D_v / D_u > (f_u / |g_v|)^2 \) when the off-diagonal terms \( f_v \) and \( g_u \) satisfy suitable sign conditions.

<div class="remark">
<strong>Remark (Biological Significance).</strong> The most unstable wavenumber <em>k</em><sub>max</sub>, obtained by minimising <em>h</em>(<em>k</em><sup>2</sup>), determines the characteristic spatial wavelength <em>Λ</em> = 2π/<em>k</em><sub>max</sub> of the emergent pattern. This wavelength scales with √<em>D</em><sub><em>u</em></sub>, providing a developmental rule: larger embryos or spatial domains exhibit larger characteristic pattern scales — a prediction confirmed in some pigmentation studies and limb bud patterning experiments.
</div>

### 5.3.3 The Gierer-Meinhardt Model

A canonical example of an activator-inhibitor system is the **Gierer-Meinhardt model** (1972):

\[
\frac{\partial u}{\partial t} = D_u \nabla^2 u + \frac{\rho u^2}{v} - \mu u + \rho_0,
\]

\[
\frac{\partial v}{\partial t} = D_v \nabla^2 v + \rho u^2 - \nu v.
\]

Here \( u \) is the activator (self-activating through the \( u^2/v \) term, which also requires the inhibitor in the denominator for the mechanism to work) and \( v \) is the inhibitor (produced at rate \( \rho u^2 \), degraded at rate \( \nu \)). The requirement \( D_v \gg D_u \) enforces local activation and long-range inhibition. This model and its variants have been applied to stripe and spot formation in fish skin, feather bud patterning, and the spacing of hair follicles.

---

# Chapter 6: Structured Population Models

## 6.1 Age-Structured Models: The McKendrick-von Foerster Equation

When vital rates (birth rates, death rates) depend on the age of individuals, discrete-time Leslie matrices generalise in continuous time to the **McKendrick-von Foerster equation**:

\[
\frac{\partial n}{\partial t} + \frac{\partial n}{\partial a} = -\mu(a) n(a, t),
\]

where \( n(a, t) \) is the age-density of the population and \( \mu(a) \) is the age-specific death rate. This is a first-order linear PDE; the left side represents the advection of cohorts through age, while the right side represents mortality. It is supplemented by the **renewal equation** (boundary condition at \( a = 0 \)):

\[
n(0, t) = \int_0^\infty \beta(a) n(a, t) \, da,
\]

where \( \beta(a) \) is the age-specific birth rate, expressing that newborns at time \( t \) are produced by all age classes weighted by their birth rates.

The **net reproductive rate** \( R_0 = \int_0^\infty \beta(a) l(a) \, da \), where \( l(a) = \exp\!\left(-\int_0^a \mu(s) \, ds\right) \) is the survivorship function, plays the same threshold role as in unstructured models: the population grows if and only if \( R_0 > 1 \). The intrinsic rate of increase \( r \) satisfies the **Euler-Lotka equation**

\[
\int_0^\infty e^{-ra} \beta(a) l(a) \, da = 1.
\]

At long times, all initial conditions converge to stable age distributions and the population grows (or declines) at rate \( e^{rt} \), a result known as the **strong ergodic theorem** for age-structured populations.

## 6.2 Metapopulation Models

The **metapopulation** concept, developed by Levins (1969, 1970), considers a collection of local populations (patches) connected by dispersal. In the simplest Levins model, let \( p \) denote the fraction of habitat patches currently occupied. Occupied patches go extinct at rate \( e \) and are colonised from other occupied patches at rate proportional to the product of the colonisation rate \( c \), the fraction of occupied patches \( p \), and the fraction of empty patches \( (1 - p) \):

\[
\frac{dp}{dt} = c p (1 - p) - e p.
\]

This has the form of a logistic equation in \( p \), with equilibrium \( p^* = 1 - e/c \) when \( c > e \) (metapopulation persists) and extinction (\( p^* = 0 \)) when \( c \leq e \). The metapopulation persists only if colonisation exceeds extinction. Importantly, the metapopulation can persist even if a fraction of patches is destroyed: the critical habitat fraction for persistence is \( 1 - e/c \), so if patches are destroyed at random, the metapopulation collapses when the fraction of remaining patches falls below \( e/c \).

This framework has been foundational in conservation biology, providing the theoretical basis for the idea that habitat fragmentation is doubly detrimental: it reduces the number of patches and increases effective extinction rates by isolating populations.

---

# Chapter 7: Additional Topics in Mathematical Epidemiology

## 7.1 Endemic Equilibria and the SIRS Model

The basic SIR model assumes permanent immunity after recovery, precluding an endemic steady state in a closed population (the epidemic always burns out). Introducing **waning immunity** gives the **SIRS model**, in which recovered individuals return to the susceptible class at rate \( \delta \):

\[
\frac{dS}{dt} = -\beta S I + \delta R + \mu(N - S),
\]

\[
\frac{dI}{dt} = \beta S I - (\gamma + \mu) I,
\]

\[
\frac{dR}{dt} = \gamma I - (\delta + \mu) R,
\]

where \( \mu \) is the per-capita birth/death rate (demography). With births and deaths, a disease-free equilibrium (\( I = 0 \)) and an endemic equilibrium (\( I > 0 \)) can both exist. The basic reproduction number is \( \mathcal{R}_0 = \beta N / (\gamma + \mu) \), and the endemic equilibrium exists when \( \mathcal{R}_0 > 1 \). At the endemic equilibrium, the fraction susceptible is \( S^*/N = 1/\mathcal{R}_0 \), meaning that at endemic steady state, exactly as many infections are produced per generation as there are replacement susceptibles — a self-consistency condition.

**Oscillations** in disease incidence — a ubiquitous feature of childhood diseases like measles, rubella, and whooping cough — arise from the interplay of demographic replenishment of susceptibles and epidemic depletion. In the SEIR model with seasonally forced transmission (\( \beta = \beta_0(1 + \beta_1 \cos(2\pi t)) \)), resonance with the natural period of the damped oscillations in the endemic equilibrium can produce annual and biennial cycles, explaining the characteristic two-year epidemic cycles of measles seen before mass vaccination.

## 7.2 Stochastic Epidemics and the Chain Binomial

Deterministic models break down for small populations or near the extinction threshold. The **chain binomial** model (Reed-Frost, 1928) is the stochastic discrete-time analogue of the SIR model. In each generation, each susceptible individual avoids infection independently with probability \( q = (1 - p)^I \), where \( p \) is the probability of infection per contact and \( I \) is the current number of infectives. The number of new cases is then binomially distributed.

The key stochastic phenomenon is **extinction by chance**: even when \( \mathcal{R}_0 > 1 \), a single infectious individual may fail to infect anyone (if \( I = 0 \)) before dying or recovering, and the epidemic dies out. The probability that a single initial case causes a major outbreak is \( 1 - 1/\mathcal{R}_0 \) (the complement of the probability of extinction in a Galton-Watson branching process approximation). This explains the observed pattern that not all introduced cases lead to outbreaks, and highlights the role of stochasticity in disease dynamics.

## 7.3 Multi-Strain Dynamics and Antigenic Evolution

Many pathogens (influenza, HIV, malaria) circulate as multiple strains with partial cross-immunity. A simple two-strain model introduces susceptibles \( S \), individuals immune to strain 1 only (\( R_1 \)), immune to strain 2 only (\( R_2 \)), and fully immune (\( R_{12} \)):

\[
\frac{dI_1}{dt} = \beta_1 (S + \sigma R_2) I_1 - \gamma I_1,
\]

\[
\frac{dI_2}{dt} = \beta_2 (S + \sigma R_1) I_2 - \gamma I_2,
\]

where \( \sigma \in \left[0, 1\right] \) measures cross-immunity (\( \sigma = 0 \) is complete cross-immunity, \( \sigma = 1 \) is no cross-immunity). When \( \sigma < 1 \), the strains compete for susceptibles, and the strain with higher \( \mathcal{R}_0 \) may exclude the other, but partial cross-immunity can permit coexistence. Antigenic drift (gradual mutation of surface antigens) is modelled by continuous mutation of \( \beta \) along an antigenic shape space, giving rise to complex spatiotemporal dynamics in which antigenic variants successively rise and fall.

---

# Chapter 8: Mathematical Techniques Summary

## 8.1 Stability Theory for ODEs

The stability of a fixed point \( \mathbf{x}^* \) of \( d\mathbf{x}/dt = \mathbf{f}(\mathbf{x}) \) is determined by the eigenvalues of the Jacobian \( J = D\mathbf{f}(\mathbf{x}^*) \). The fixed point is **Lyapunov stable** if all eigenvalues have non-positive real part, and **asymptotically stable** (a stable attractor) if all eigenvalues have strictly negative real part. For two-dimensional systems, the trace-determinant criterion provides a complete classification as summarised above.

**Global stability** requires stronger tools. A **Lyapunov function** \( V(\mathbf{x}) \) is a scalar function that is positive definite near \( \mathbf{x}^* \) and has \( dV/dt \leq 0 \) along trajectories. If \( dV/dt < 0 \) everywhere except at \( \mathbf{x}^* \), then \( \mathbf{x}^* \) is globally asymptotically stable (within the domain of definition). Finding a Lyapunov function is an art; common choices in population models include \( V = \sum_i (x_i - x_i^* - x_i^* \ln(x_i / x_i^*)) \) (Volterra-type Lyapunov functions for Lotka-Volterra systems) and quadratic forms.

The **Poincaré-Bendixson theorem** for planar systems guarantees that a bounded, positively invariant region containing no fixed points must contain a limit cycle. Combined with the **Dulac criterion** — the existence of a function \( B(x,y) \) such that \( \nabla \cdot (B\mathbf{f}) \) is sign-definite — one can rule out limit cycles.

## 8.2 Bifurcation Theory

A **bifurcation** is a qualitative change in the phase portrait as a parameter \( \mu \) passes through a critical value \( \mu_c \). The normal form theory classifies local bifurcations by the structure of the nonlinearity near the bifurcation point.

The **saddle-node** normal form is \( \dot{x} = \mu - x^2 \): for \( \mu > 0 \), two fixed points exist; they coalesce at \( \mu = 0 \) and disappear for \( \mu < 0 \). This is the generic codimension-one bifurcation in which fixed points are created or destroyed.

The **transcritical** normal form is \( \dot{x} = \mu x - x^2 \): two fixed points \( (0 \text{ and } \mu) \) exchange stability at \( \mu = 0 \). This is the generic bifurcation when a fixed point is constrained to exist for all parameter values (as in the trivial extinction state of population models).

The **pitchfork** normal form (supercritical) is \( \dot{x} = \mu x - x^3 \): a single stable fixed point at the origin for \( \mu < 0 \) splits into two stable fixed points as \( \mu \) increases through zero, with the origin becoming unstable. It models symmetry-breaking transitions, relevant in models of patterning and morphogenesis.

The **Hopf bifurcation** in two dimensions involves the eigenvalues of the Jacobian crossing the imaginary axis as complex conjugate pairs \( \lambda = \alpha(\mu) \pm i\omega(\mu) \) with \( d\alpha/d\mu \neq 0 \) at \( \mu_c \). In the supercritical case, a stable limit cycle emerges for \( \mu > \mu_c \) (oscillations); in the subcritical case, an unstable limit cycle exists for \( \mu < \mu_c \), and the transition to oscillation is abrupt and hysteretic.

<div class="theorem">
<strong>Theorem 8.1 (Hopf Bifurcation Theorem).</strong> Let the Jacobian at the fixed point have eigenvalues <em>α</em>(<em>μ</em>) ± <em>iω</em>(<em>μ</em>) with <em>α</em>(<em>μ</em><sub>c</sub>) = 0, <em>ω</em>(<em>μ</em><sub>c</sub>) = <em>ω</em><sub>0</sub> ≠ 0, and <em>dα</em>/<em>dμ</em>|<sub><em>μ</em><sub>c</sub></sub> ≠ 0. Then a limit cycle bifurcates from the fixed point at <em>μ</em> = <em>μ</em><sub>c</sub>. The cycle is stable (supercritical) if the first Lyapunov coefficient <em>l</em><sub>1</sub> < 0, and unstable (subcritical) if <em>l</em><sub>1</sub> > 0.
</div>

## 8.3 Dimensional Analysis and Non-dimensionalisation

A crucial preliminary step in analysing any mathematical model is **non-dimensionalisation**: rescaling variables and time by characteristic scales to reduce the number of parameters and reveal the key dimensionless groups. For the logistic equation \( dN/dt = rN(1 - N/K) \), setting \( u = N/K \) and \( \tau = rt \) gives \( du/d\tau = u(1-u) \), a parameter-free equation. For the SIR model, scaling \( S, I, R \) by \( N \) and time by \( 1/\gamma \) reduces the dynamics to depend only on \( \mathcal{R}_0 = \beta N / \gamma \).

In reaction-diffusion systems, the natural length scale is the **diffusion length** \( L_D = \sqrt{D/r} \), where \( r \) is a characteristic reaction rate. The ratio of the domain size \( L \) to \( L_D \) (i.e., the parameter \( L/L_D \)) determines whether diffusion or reaction dominates: for \( L \ll L_D \) diffusion is fast compared to reaction and spatial gradients are quickly smoothed, while for \( L \gg L_D \) reaction dominates and sharp spatial patterns can form. This scaling underlies the parameter regimes for Turing instability and travelling wave formation.

## 8.4 Singular Perturbation Methods

Many biological systems exhibit **fast-slow dynamics**: processes operating on widely separated timescales. Enzyme kinetics, ion channel gating, and predator-prey oscillations near a homoclinic orbit are all examples. **Singular perturbation theory** (geometric singular perturbation theory or GSPT) exploits the separation of timescales by treating the fast dynamics as instantaneously equilibrating, reducing the dimension of the system.

In the simplest case, a system \( \dot{x} = f(x, y) \), \( \varepsilon \dot{y} = g(x, y) \) with \( \varepsilon \ll 1 \) has a **slow manifold** \( \{g(x, y) = 0\} \) to which the fast variable \( y \) relaxes rapidly. On the slow manifold, the dynamics of \( x \) are governed by the **reduced system** \( \dot{x} = f(x, \bar{y}(x)) \), where \( \bar{y}(x) \) satisfies \( g(x, \bar{y}) = 0 \). This technique is used in the derivation of the Michaelis-Menten approximation in enzyme kinetics, the analysis of bursting neurons, and the study of relaxation oscillations in predator-prey models.

---

# Chapter 9: Synthesis — Linking Models Across Scales

## 9.1 From Individuals to Populations: Mean-Field Limits

Mathematical biology faces the fundamental challenge of connecting processes at different levels of organisation: individual behaviour, population dynamics, community ecology, and evolutionary change. The **mean-field approach** — replacing stochastic individual-level interactions with their expected values — is the basis of the deterministic ODE models discussed throughout these notes. It is valid when populations are large, well-mixed, and fluctuations are small relative to the mean.

Corrections to the mean-field can be incorporated systematically through **moment closure** methods, which track not just the means but also variances and covariances of population sizes. In spatial models, **pair approximations** track the densities of individual sites and of adjacent pairs, providing a more accurate description of spatial correlations than the mean-field. The transition from stochastic agent-based models to deterministic PDEs can be made rigorous using the **law of large numbers** and **central limit theorem** for stochastic processes, with the diffusion approximation (leading to the Fisher-KPP equation) emerging as the large-population, long-time limit of a random walk with logistic reproduction.

## 9.2 The Unifying Role of R₀ Across Disciplines

The basic reproduction number \( \mathcal{R}_0 \) appears in remarkably diverse biological contexts, always playing the same threshold role. In epidemiology, it is the mean number of secondary infections. In demography, \( R_0 = \int_0^\infty \beta(a) l(a) da \) is the net reproductive rate (mean number of offspring per individual per lifetime). In metapopulation theory, \( c/e \) is the colonisation-to-extinction ratio. In evolutionary game theory, the invasion fitness of a mutant plays an analogous threshold role. The mathematical structure is always the same: a model has a trivial steady state (extinction, disease-free, or monomorphic) that is stable when \( \mathcal{R}_0 < 1 \) and unstable when \( \mathcal{R}_0 > 1 \), with a non-trivial equilibrium bifurcating from the trivial one at \( \mathcal{R}_0 = 1 \) via a transcritical bifurcation.

**Next-generation matrix methods** (van den Driessche and Watmough, 2002) provide a systematic way to compute \( \mathcal{R}_0 \) for complex multi-compartment models. The idea is to decompose the Jacobian at the disease-free equilibrium into a **transmission matrix** \( F \) (new infections generated) and a **transition matrix** \( V \) (transfers between compartments not involving new infections). Then \( \mathcal{R}_0 = \rho(FV^{-1}) \), the spectral radius of the next-generation matrix \( FV^{-1} \). For the basic SEIR model, this gives back \( \mathcal{R}_0 = \beta N / \gamma \) as expected.

<div class="example">
<strong>Example 9.1 (Next-Generation Matrix for SEIR).</strong> At the disease-free equilibrium, the infectious compartments are <em>E</em> and <em>I</em>. New infections enter <em>E</em> only (at rate <em>βSI/N</em>), so

\[
F = \begin{pmatrix} 0 & \beta \\ 0 & 0 \end{pmatrix}, \qquad V = \begin{pmatrix} \sigma & 0 \\ -\sigma & \gamma \end{pmatrix}.
\]

Then <em>V</em><sup>−1</sup> = (1/(<em>σγ</em>)) × (<em>γ</em>, 0; <em>σ</em>, <em>σ</em>), giving <em>FV</em><sup>−1</sup> with spectral radius <em>β</em>/<em>γ</em> = <em>R</em><sub>0</sub> (when <em>S</em> = <em>N</em>).
</div>

## 9.3 Eco-Evolutionary Dynamics

A growing area of mathematical biology concerns the interplay between ecological dynamics (operating on generational timescales) and evolutionary dynamics (operating on many-generational timescales). When these timescales are not widely separated, ecological and evolutionary change can occur simultaneously — a phenomenon known as **eco-evolutionary dynamics**.

The simplest formalism considers a population of individuals characterised by a continuous trait \( z \) (e.g., body size, virulence) with population density \( n(z, t) \). If individuals with trait \( z \) have fitness \( f(z, \bar{z}, N) \) (depending on the mean trait \( \bar{z} \) and total density \( N \) through ecology), then under the assumption of small mutational variance \( \sigma_m^2 \), the mean trait evolves as

\[
\frac{d\bar{z}}{dt} = \sigma_m^2 \frac{\partial f}{\partial z}\bigg|_{z = \bar{z}},
\]

the **canonical equation of adaptive dynamics** (Dieckmann and Law, 1996). This gradient ascent on the fitness landscape, coupled to the ecological dynamics for \( N \), captures the co-evolution of ecological and evolutionary processes. **Evolutionary singular strategies** (where \( \partial f/\partial z = 0 \)) can be either convergence stable (**evolutionary attractors**) or convergence unstable (**evolutionary repellers**), and can be either invasible by mutants (**evolutionary branching points**, leading to diversification) or uninvasible (**ESSs**).

## 9.4 Mathematical Modelling Methodology

The process of mathematical modelling in biology involves an iterative cycle that is as important as any specific mathematical technique. The cycle proceeds through several identifiable stages:

**Model formulation** begins with a careful description of the biological question and the identification of the key variables (state variables), their timescales, and the processes governing their dynamics. Assumptions are explicitly stated — which processes are included and which are neglected — and the resulting equations are written down. **Dimensional analysis** is performed to identify the dimensionless parameter groups that govern the behaviour.

**Analysis** involves the mathematical toolkit surveyed in these notes: steady-state analysis, linear stability, phase-plane methods, perturbation theory, and numerical simulation. The goal is to extract qualitative predictions that do not depend on the precise parameter values, since biological parameters are typically known only approximately.

**Comparison with data** tests the model's predictions against experimental or observational data. Discrepancies may indicate inadequate model assumptions, measurement error, or genuinely new biology. **Parameter estimation** fits the model to data; goodness of fit is assessed, and the identifiability of parameters from available data types is examined.

**Model refinement** incorporates previously neglected mechanisms (stochasticity, spatial structure, age structure, seasonality) when the simpler model fails to capture observed phenomena. The art of mathematical biology lies in choosing the minimal model complexity that captures the phenomenon of interest — Einstein's maxim that a model should be as simple as possible, but no simpler.

<div class="remark">
<strong>Remark on Model Validation.</strong> A mathematical model is never "true" — it is always a simplification. The criterion for a useful model is not literal truth but illuminating insight: does the model identify the key mechanisms, make testable predictions, and point toward productive experimental interventions? A model that is too complex to analyse or parametrise from available data is often less useful than a simpler one that can be fully understood, even if the simpler model omits some biological detail.
</div>

---

# Chapter 10: Extended Case Studies

## 10.1 The Dynamics of Measles Before and After Vaccination

Measles provides one of the best-studied examples of the interplay between mathematical theory and epidemiological data. Before mass vaccination, measles in developed countries exhibited **biennial cycles** — large outbreaks alternating with small ones on a two-year rhythm. After the introduction of vaccination, outbreaks became less frequent but more irregular.

The SEIR model with seasonal forcing captures this behaviour. The natural period of small oscillations about the endemic equilibrium is approximately \( T \approx 2\pi / \sqrt{\gamma \mu (\mathcal{R}_0 - 1)} \), which for measles parameters (\( \mathcal{R}_0 \approx 15 \), \( 1/\gamma \approx 7 \) days, \( 1/\mu \approx 70 \) years) gives \( T \approx 2 \) years. Annual seasonality in transmission (driven by school terms, which aggregate children and increase contacts) forces the system near its natural period, producing resonant biennial oscillations.

The **critical community size** for measles — the minimum population needed to sustain continuous transmission without local extinction — is empirically about 250,000–500,000 people. Below this threshold, measles burns out after each epidemic and is only reintroduced from outside. This was demonstrated by Bartlett (1957) using island community data, providing one of the first quantitative tests of a stochastic epidemic model.

## 10.2 The Evolution of Virulence

A central question in evolutionary epidemiology is why pathogens evolve particular levels of virulence — why are some pathogens benign and others lethal? The **trade-off hypothesis** (Anderson and May, 1982; Ewald, 1983) argues that virulence evolves to an intermediate level because of a fundamental trade-off between transmissibility and mortality.

In the adaptive dynamics framework, a pathogen strain with virulence \( \alpha \) (additional mortality imposed on the host) and transmission rate \( \beta(\alpha) \) (increasing with virulence, reflecting that more damaging pathogens replicate faster) invades a resident strain with virulence \( \alpha_0 \) if its invasion fitness

\[
\mathcal{R}_0(\alpha) = \frac{\beta(\alpha)}{\mu + \alpha + \gamma}
\]

exceeds \( \mathcal{R}_0(\alpha_0) \). The evolutionarily singular virulence \( \alpha^* \) satisfies

\[
\frac{d\mathcal{R}_0}{d\alpha}\bigg|_{\alpha^*} = 0, \qquad \text{i.e.,} \quad \beta'(\alpha^*) = \frac{\beta(\alpha^*)}{\mu + \alpha^* + \gamma}.
\]

With a concave \( \beta(\alpha) \) (diminishing returns of virulence for transmissibility), there is an interior maximum. The key prediction is that interventions that reduce host mortality (\( \mu \)) or increase recovery (\( \gamma \)) will shift the evolutionarily stable virulence downward. Conversely, vaccine-induced partial immunity can, in some models, select for increased virulence — the **imperfect vaccine hypothesis** that has generated considerable theoretical debate.

## 10.3 Spatial Spread of Invasive Species

The biological invasion problem — predicting the rate and pattern of spread of a newly introduced species — is one of the most practically important applications of mathematical biology. The Fisher-KPP framework predicts **linear spread** (constant-speed travelling wave) as the generic behaviour for species with local reproduction and diffusive dispersal. However, many real invasions show **accelerating spread** or even **exponential acceleration**, inconsistent with constant-wave-speed predictions.

The discrepancy is resolved by incorporating **long-distance dispersal** (fat-tailed dispersal kernels). If the dispersal kernel \( k(x) \) — the probability density of displacement \( x \) in one generation — has a moment-generating function that diverges at finite argument (i.e., the tail is fatter than exponential), then the wave speed is not determined by the behaviour at the leading edge alone but diverges in time, producing accelerating invasions. This was shown theoretically by van den Bosch et al. (1990) and confirmed empirically for species like the house finch (Carpodacus mexicanus) in North America.

The **integrodifference equation** framework (Kot et al., 1996) provides a discrete-time spatial analogue of the Fisher-KPP equation:

\[
N_{t+1}(x) = \int_{-\infty}^{\infty} k(x - y) f(N_t(y)) \, dy,
\]

where \( f(N) \) is the local population growth function and \( k(x - y) \) is the dispersal kernel. The minimum wave speed in this framework is

\[
c^* = \min_{s > 0} \frac{1}{s} \ln\!\left[f'(0) \cdot \hat{k}(s)\right],
\]

where \( \hat{k}(s) = \int e^{sx} k(x) dx \) is the moment-generating function of the kernel. When \( \hat{k}(s) \) diverges at a finite \( s^* \), the minimum is achieved at \( s^* \) and the speed is finite; when it diverges at \( s \to \infty \) (fat-tailed kernel), the speed selection formula has no finite minimiser and the wave accelerates.

---

These notes have surveyed the major themes of mathematical biology at the graduate level, with a focus on the ecological, epidemiological, and evolutionary content that is central to the discipline. The mathematical toolkit — difference equations, phase-plane analysis, bifurcation theory, reaction-diffusion PDEs, and evolutionary dynamics — provides a unified framework for understanding diverse biological phenomena ranging from the chaotic dynamics of discrete populations to the self-organisation of spatial pattern and the evolutionary optimisation of pathogen life histories. The deepest insight of the field may be that biology, beneath its extraordinary diversity of mechanism and form, exhibits recurring dynamical themes that transcend the specific system — and that mathematics is the language in which these themes are most precisely and revealingly expressed.
