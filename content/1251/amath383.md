---
title: "AMATH 383: Introduction to Mathematical Biology"
subjects: "AMATH"
prof: "Chris Bauch"
---

## Sources and References

**Primary textbook** — Leah Edelstein-Keshet, *Mathematical Models in Biology*, SIAM Press, 2005.
**Supplementary texts** — J. D. Murray, *Mathematical Biology I: An Introduction*, 3rd ed., Springer, 2002; J. D. Murray, *Mathematical Biology II: Spatial Models and Biomedical Applications*, 3rd ed., Springer, 2003; Steven H. Strogatz, *Nonlinear Dynamics and Chaos*, 2nd ed., Westview Press, 2015.
**Online resources** — MIT 18.353J Nonlinear Dynamics lecture notes; Stanford BIOE 301 Mathematical Physiology notes; University of Washington AMATH 383 open lecture notes.

---

# Chapter 1: Mathematical Modelling and Discrete Growth

## The Modelling Cycle

Mathematical biology begins not with equations but with observation. A biologist watches a population decline, measures enzyme kinetics, or maps the spread of a disease across a continent. The mathematician's job is to translate those observations into a form that can be rigorously analyzed and, crucially, used to make testable predictions. This process is best understood as a cycle rather than a one-time procedure.

The **modelling cycle** runs: *observation → assumptions → equations → analysis → prediction → validation → refined observation*. At the assumption stage one decides which biological details to include and which to ignore. Including too much produces an intractable model; including too little misses the biology. The art of mathematical modelling lies in finding the right level of abstraction. Once assumptions are stated precisely, they translate directly into mathematical equations. Analytical or numerical methods extract qualitative and quantitative predictions, which are then checked against independent data. Disagreement drives a return to the assumption stage.

## Malthusian (Exponential) Growth

The simplest population model imagines a single species reproducing without resource limitation. Suppose \( N(t) \) is the population count at discrete time step \( t \) (measured in generations). If each individual in one generation gives rise on average to \( \lambda \) individuals in the next:

\[ N(t+1) = \lambda N(t). \]

This is a linear first-order difference equation. Iterating from an initial condition \( N(0) = N_0 \):

\[ N(t) = \lambda^t N_0. \]

The parameter \( \lambda \) is the **per-generation growth factor**. If \( \lambda > 1 \) the population grows geometrically (exponentially in continuous language); if \( \lambda < 1 \) it declines to extinction; if \( \lambda = 1 \) it is constant. The per-capita growth rate is \( r = \lambda - 1 \). The **doubling time** satisfies \( \lambda^{t_d} = 2 \), giving \( t_d = \ln 2 / \ln \lambda \).

Real populations cannot grow without bound — resources, predation, and disease impose limits — but exponential growth is an accurate short-term description for populations far below their carrying capacity. Observationally, bacteria in a fresh culture, human populations in the 18th century, and invasive species newly introduced to a habitat all display near-Malthusian dynamics for some period.

## Linear Difference Equations

The general scalar affine difference equation is \( x_{n+1} = ax_n + b \), with \( a \neq 1 \). To find its fixed points, set \( x^* = ax^* + b \), giving \( x^* = b/(1-a) \). Translating \( y_n = x_n - x^* \) yields the homogeneous equation \( y_{n+1} = ay_n \), solved by \( y_n = a^n y_0 \). Thus:

\[ x_n = a^n (x_0 - x^*) + x^*. \]

The fixed point is **stable** if and only if \( |a| < 1 \), in which case \( x_n \to x^* \) regardless of initial condition. If \( |a| > 1 \) all trajectories diverge from \( x^* \) (unstable). If \( a < -1 \) the iterates oscillate in sign with growing amplitude; if \( -1 < a < 0 \) they oscillate with decaying amplitude toward \( x^* \).

## Linear Systems of Difference Equations

When a population is structured — for instance, juvenile and adult stages — we need a vector of state variables. Let \( \mathbf{x}_{n+1} = A \mathbf{x}_n \) where \( A \) is a non-negative matrix. Writing \( A = PDP^{-1} \) where \( D = \text{diag}(\mu_1, \ldots, \mu_k) \) collects eigenvalues, the solution is:

\[ \mathbf{x}_n = c_1 \mu_1^n \mathbf{v}_1 + c_2 \mu_2^n \mathbf{v}_2 + \cdots \]

where \( \mathbf{v}_i \) are eigenvectors and the \( c_i \) are determined by initial conditions. For large \( n \), the term with the **dominant eigenvalue** \( \mu_1 = \max_i |\mu_i| \) dominates. If \( \mu_1 > 1 \) the population grows; if \( \mu_1 < 1 \) it shrinks. The corresponding eigenvector \( \mathbf{v}_1 \) gives the **stable stage distribution** — the eventual ratio of individuals in each class.

### Red Blood Cell Model

A biologically concrete example is the two-compartment red blood cell model. Let \( M_n \) be the number of precursor cells in bone marrow and \( R_n \) the number of circulating red blood cells at time step \( n \) (measured in days). Bone marrow cells mature and enter circulation at rate \( \alpha \); circulating cells are lost at rate \( \delta \). The system is:

\[ \begin{pmatrix} M_{n+1} \\ R_{n+1} \end{pmatrix} = \begin{pmatrix} 1-\alpha & 0 \\ \alpha & 1-\delta \end{pmatrix} \begin{pmatrix} M_n \\ R_n \end{pmatrix}. \]

The eigenvalues are \( \mu_1 = 1-\alpha \) and \( \mu_2 = 1-\delta \). Both are less than 1 (for physiological parameter values), confirming that without a source of new precursors, cell counts decay to zero. In a full model one adds a production term representing stem-cell input. Eigenvalue analysis then reveals the steady state and how perturbations (e.g. after chemotherapy) recover.

### Leslie Matrix and Age Structure

The **Leslie matrix** generalises this idea to an arbitrary number of age classes. The matrix \( L \) has fecundities \( f_i \) in the first row and survivorships \( s_i \in (0,1) \) on the subdiagonal:

\[ L = \begin{pmatrix} f_1 & f_2 & \cdots & f_k \\ s_1 & 0 & \cdots & 0 \\ 0 & s_2 & \cdots & 0 \\ \vdots & & \ddots & \vdots \end{pmatrix}. \]

By the Perron-Frobenius theorem (for primitive matrices), \( L \) has a unique dominant positive eigenvalue \( \lambda_1 > 0 \). The long-run growth rate of the population is \( \lambda_1 \), and the stable age distribution is the corresponding positive eigenvector. Forest ecologists use Leslie matrices to project timber yield decades into the future; fisheries managers use them to set sustainable harvest quotas.

---

# Chapter 2: Nonlinear Difference Equations

## The Logistic Difference Equation

As a population approaches its environment's carrying capacity \( K \), per-capita growth must slow. The **logistic difference equation** captures this in a minimal way:

\[ x_{n+1} = r x_n \left(1 - \frac{x_n}{K}\right). \]

By rescaling \( u_n = x_n/K \) (non-dimensionalisation) the model simplifies to the canonical form \( u_{n+1} = \lambda u_n (1 - u_n) \) with \( \lambda = r \). This single-parameter family is one of the most studied objects in all of applied mathematics.

Non-dimensionalisation is a systematic strategy: identify the natural scales of each variable (here \( K \) for population), divide to obtain dimensionless variables, and reduce the number of parameters. The resulting equation is easier to analyze and its behavior is universal — it applies equally to flour beetles, yeast, and fish.

## Fixed Points and Stability

The fixed points satisfy \( u^* = \lambda u^* (1 - u^*) \). Either \( u^* = 0 \) (extinction) or \( u^* = 1 - 1/\lambda \) (non-trivial, positive for \( \lambda > 1 \)). To assess stability, write \( u_n = u^* + \varepsilon_n \) and expand:

\[ \varepsilon_{n+1} \approx f'(u^*) \varepsilon_n, \quad f'(u) = \lambda(1 - 2u). \]

For the extinction fixed point, \( f'(0) = \lambda \), so it is stable if \( \lambda < 1 \). For the non-trivial fixed point, \( f'(u^*) = 2 - \lambda \), so stability requires \( |2 - \lambda| < 1 \), i.e. \( 1 < \lambda < 3 \). Outside this range the non-trivial fixed point loses stability through a period-doubling bifurcation.

## Cobweb Diagrams

A **cobweb diagram** is a graphical tool for understanding iteration of a one-dimensional map. Plot \( u_{n+1} = f(u_n) \) together with the diagonal \( u_{n+1} = u_n \). Starting from \( u_0 \), draw a vertical line to the curve \( f \), then a horizontal line to the diagonal, then repeat. The resulting "cobweb" path shows whether iterates converge to a fixed point, cycle, or wander chaotically. When the map curve crosses the diagonal steeply (|slope| > 1), the cobweb diverges away from the intersection, confirming instability. This geometric insight complements but does not replace the algebraic stability criterion.

## Period-Doubling and Chaos

As \( \lambda \) increases past 3, the logistic map undergoes a remarkable sequence of **period-doubling bifurcations**. The stable fixed point becomes a stable 2-cycle at \( \lambda \approx 3 \), then a stable 4-cycle at \( \lambda \approx 3.449 \), then 8-cycle, etc. The ratio of successive bifurcation intervals converges to the **Feigenbaum constant** \( \delta \approx 4.669 \). For \( \lambda > \lambda_\infty \approx 3.570 \) the map is chaotic in a precise sense: sensitive dependence on initial conditions, dense periodic orbits, and topological transitivity.

Chaos in a deterministic model is philosophically striking. Two populations following the same law but starting at nearly the same initial condition diverge exponentially, making long-term prediction impossible. This is not randomness — the equation is fully deterministic — but intrinsic unpredictability arising from nonlinearity. The logistic map is the paradigm example in both mathematics and ecology.

## Nicholson-Bailey Host-Parasitoid Model

Many insects exhibit boom-bust cycles driven by interactions between a host species and a parasitoid wasp that lays eggs in host larvae. The **Nicholson-Bailey model** describes this:

\[ H_{n+1} = r H_n e^{-a P_n}, \qquad P_{n+1} = c H_n (1 - e^{-a P_n}). \]

Here \( H_n \) and \( P_n \) are host and parasitoid densities, \( r \) is host growth rate, \( a \) is the searching efficiency, and \( c \) is the number of parasitoid offspring per parasitized host. The term \( e^{-aP_n} \) is the probability of a host escaping parasitism, derived from a Poisson random-search model.

The non-trivial equilibrium exists but is **neutrally unstable** — small perturbations lead to growing oscillations, not return to equilibrium. This contrasts with biological data showing that many host-parasitoid systems persist. Adding spatial refugia (regions where hosts cannot be found) or aggregated parasitoid attack stabilises the system to damped oscillations, showing how biological realism prevents the mathematical instability.

## Cheyne-Stokes Breathing Model

An elegant application of difference equations to physiology is Cheyne-Stokes respiration, an abnormal breathing pattern in which ventilation waxes and wanes cyclically. The key ingredient is a **delay**: receptors in the brainstem respond to CO\(_2\) concentration, but the blood carrying that signal takes time \( \tau \) to travel from the lungs to the brain. A simplified model is:

\[ V_{n+1} = f(C_{n-k}), \]

where \( V_n \) is ventilation volume and \( C_n \) is arterial CO\(_2\). For sufficiently large delay \( k \) (or steep enough response function \( f \)), the steady state destabilises and oscillations emerge — qualitatively reproducing the clinical pattern. This model foreshadows the delay-differential equations discussed in Chapter 8.

---

# Chapter 3: Ordinary Differential Equations — Formulation and Single-Species Models

## From Discrete to Continuous Time

Discrete-time models are natural when reproduction is seasonal (annual plants, insects with one generation per year). When reproduction is continuous — bacteria dividing every 20 minutes, or mammals reproducing year-round — continuous-time models described by ordinary differential equations (ODEs) are more appropriate.

Taking the limit as the time step \( \Delta t \to 0 \) in the discrete Malthusian model gives:

\[ \frac{dN}{dt} = rN, \]

with solution \( N(t) = N_0 e^{rt} \). Here \( r \) is the **intrinsic rate of natural increase** (birth rate minus death rate per individual). This is the simplest continuous population model, and its solution is exponential growth or decay depending on the sign of \( r \).

## Logistic ODE

The continuous analogue of the logistic difference equation is:

\[ \frac{dx}{dt} = rx\left(1 - \frac{x}{K}\right). \]

This is separable and can be solved by partial fractions. Writing \( 1/[x(1-x/K)] = (1/x) + (1/K-x)^{-1}\cdot(1/K) \), one integrates to obtain:

\[ x(t) = \frac{K x_0 e^{rt}}{K - x_0 + x_0 e^{rt}} = \frac{K}{1 + \left(\frac{K-x_0}{x_0}\right)e^{-rt}}. \]

This is the **sigmoid (logistic) growth curve**. For small \( x \) the quadratic term \( -rx^2/K \) is negligible and growth is approximately exponential at rate \( r \). As \( x \to K \) from below, growth slows and \( x \to K \) asymptotically. The inflection point — where growth rate \( dx/dt \) is maximum — occurs at \( x = K/2 \), useful for calculating maximum sustainable yield in fisheries.

## The Chemostat Model

A **chemostat** is a laboratory device that continuously supplies nutrient and removes culture medium at the same rate, maintaining steady volume. It is a model system for studying microbial competition. Let \( S \) be nutrient concentration and \( N \) be bacterial density:

\[ \frac{dS}{dt} = D(S_0 - S) - \frac{\mu(S)N}{Y}, \qquad \frac{dN}{dt} = \mu(S)N - DN. \]

Here \( D \) is the dilution rate (volume exchanged per unit time), \( S_0 \) is the input nutrient concentration, \( Y \) is the yield coefficient (bacteria produced per unit nutrient consumed), and \( \mu(S) \) is the specific growth rate. **Monod kinetics** give:

\[ \mu(S) = \frac{\mu_{\max} S}{K_s + S}, \]

a saturating hyperbola analogous to Michaelis-Menten enzyme kinetics. There are two steady states: the **washout state** \( (S_0, 0) \) where bacteria are diluted out, and a **coexistence state** where both \( S^* > 0 \) and \( N^* > 0 \). The coexistence state exists and is stable when \( \mu(S_0) > D \) — i.e. when the bacteria can grow faster than they are washed out.

## Linear Stability Analysis for ODEs

For a scalar ODE \( dx/dt = f(x) \), a fixed point satisfies \( f(x^*) = 0 \). Perturbation \( x = x^* + \varepsilon(t) \) with \( |\varepsilon| \ll 1 \) gives:

\[ \frac{d\varepsilon}{dt} = f(x^* + \varepsilon) \approx f(x^*) + f'(x^*)\varepsilon = f'(x^*)\varepsilon. \]

This linear ODE has solution \( \varepsilon(t) = \varepsilon_0 e^{f'(x^*)t} \). Hence the fixed point is **linearly stable** if \( f'(x^*) < 0 \) and unstable if \( f'(x^*) > 0 \). The sign of the derivative of the vector field at the fixed point completely determines local stability.

**Phase line diagrams** visualise this: draw the real line, mark the fixed points, and draw arrows pointing right where \( f(x) > 0 \) and left where \( f(x) < 0 \). Fixed points where the arrows converge are stable; those from which arrows point away are unstable. This diagram instantly reveals the global qualitative dynamics of any scalar autonomous ODE.

---

# Chapter 4: Phase Plane Methods and Two-Dimensional ODE Systems

## Two-Dimensional Systems

Most interesting biological phenomena — predator-prey cycles, epidemic dynamics, enzyme reactions — require at least two coupled variables. Consider the autonomous system:

\[ \frac{dx}{dt} = f(x, y), \qquad \frac{dy}{dt} = g(x, y). \]

A **trajectory** is a curve \( (x(t), y(t)) \) in the \( (x,y) \) **phase plane**, parameterised by time. Because the system is autonomous (no explicit \( t \) dependence), trajectories cannot cross. Understanding the geometry of trajectories — especially near fixed points and for large time — constitutes the phase plane analysis method.

## Nullclines

A key tool is the concept of **nullclines**. The \( x \)-nullcline is the curve \( f(x,y) = 0 \), along which \( dx/dt = 0 \) — trajectories cross this curve moving purely vertically. The \( y \)-nullcline is \( g(x,y) = 0 \), along which trajectories move purely horizontally. **Equilibria** (steady states) are points where both nullclines intersect, i.e. \( f = g = 0 \) simultaneously.

By checking the sign of \( f \) in each region between \( x \)-nullclines, and the sign of \( g \) between \( y \)-nullclines, one can determine the direction of flow in every quadrant of the phase plane. This provides a rough global picture without solving the ODEs explicitly.

## Linearisation and the Jacobian

Near a fixed point \( (x^*, y^*) \), the system is approximated by its linearisation. Define small perturbations \( u = x - x^* \), \( v = y - y^* \). Taylor expansion gives:

\[ \frac{d}{dt}\begin{pmatrix} u \\ v \end{pmatrix} \approx J \begin{pmatrix} u \\ v \end{pmatrix}, \quad J = \begin{pmatrix} \partial f/\partial x & \partial f/\partial y \\ \partial g/\partial x & \partial g/\partial y \end{pmatrix}_{\!(x^*,y^*)}. \]

The **Jacobian matrix** \( J \) encodes all local information. Let \( \tau = \text{tr}(J) \) and \( \Delta = \det(J) \). The eigenvalues are \( \mu_{1,2} = (\tau \pm \sqrt{\tau^2 - 4\Delta})/2 \).

<div class="theorem">
<strong>Classification of Fixed Points.</strong> Let \( \tau \) and \( \Delta \) be the trace and determinant of the Jacobian at a fixed point.
<ul>
<li>If \( \Delta < 0 \): <em>saddle point</em> (one positive, one negative eigenvalue). Always unstable.</li>
<li>If \( \Delta > 0 \) and \( \tau^2 - 4\Delta > 0 \): <em>node</em> (real eigenvalues of same sign). Stable if \( \tau < 0 \), unstable if \( \tau > 0 \).</li>
<li>If \( \Delta > 0 \) and \( \tau^2 - 4\Delta < 0 \): <em>spiral</em> (complex conjugate eigenvalues). Stable if \( \tau < 0 \), unstable if \( \tau > 0 \).</li>
<li>If \( \Delta > 0 \) and \( \tau = 0 \): <em>centre</em> (purely imaginary eigenvalues). Neutrally stable in the linear system; nonlinear terms determine true behavior.</li>
</ul>
The conditions for linear stability are: \( \tau < 0 \) and \( \Delta > 0 \).
</div>

The \( (\tau, \Delta) \) parameter plane is thus divided into regions corresponding to each type. This classification is powerful because it applies universally — the same analysis covers predator-prey models, epidemic thresholds, and chemical reactions.

## Eigenvectors and Phase Portraits

The eigenvectors of \( J \) give the **characteristic directions** of the flow near the fixed point. For a saddle, the stable manifold (along which trajectories approach the equilibrium) is tangent to the eigenvector of the negative eigenvalue; the unstable manifold is tangent to the eigenvector of the positive eigenvalue. Sketching these manifolds — together with nullclines and the direction field — gives a complete qualitative phase portrait.

A closed curve in the phase plane that is traversed periodically is called a **limit cycle** if it is isolated (nearby trajectories spiral toward or away from it). The existence of limit cycles is crucial for oscillatory biology (circadian rhythms, predator-prey cycles, heart rhythms). The **Poincaré-Bendixson theorem** provides conditions under which a limit cycle must exist: if a trajectory is trapped in a bounded region containing no fixed points, it must converge to a limit cycle.

---

# Chapter 5: Epidemic Models

## Compartmental Modelling

The 1918 influenza pandemic killed 50–100 million people; COVID-19 disrupted the global economy for years. Understanding the spread of infectious disease is one of the most socially impactful applications of mathematical biology. The key idea — developed by Kermack and McKendrick in 1927 — is to divide the population into **compartments** based on disease status, and write ODEs for the flow between them.

The simplest structure is **SIR**: Susceptible \( \to \) Infectious \( \to \) Removed (recovered or dead, with immunity). Let \( S \), \( I \), \( R \) denote the numbers in each class, with total population \( N = S + I + R \) constant:

\[ \frac{dS}{dt} = -\beta S I, \qquad \frac{dI}{dt} = \beta S I - \gamma I, \qquad \frac{dR}{dt} = \gamma I. \]

The parameter \( \beta \) is the transmission rate (contacts per unit time times probability of transmission per contact) and \( \gamma \) is the recovery rate (so the mean infectious period is \( 1/\gamma \)).

## The Basic Reproduction Number

<div class="definition">
The <strong>basic reproduction number</strong> \( R_0 \) is the expected number of secondary infections caused by one infectious individual in an entirely susceptible population.
</div>

For the SIR model, an infectious individual infects at rate \( \beta N \) and recovers at rate \( \gamma \), giving:

\[ R_0 = \frac{\beta N}{\gamma}. \]

This single dimensionless number determines epidemic fate. From the \( I \) equation:

\[ \frac{dI}{dt} = \gamma I \left(\frac{S}{N/R_0} - 1\right) = \gamma I (R_0 \cdot S/N - 1). \]

Initially \( S \approx N \), so \( dI/dt \approx \gamma(R_0 - 1)I \). The epidemic grows if \( R_0 > 1 \) and declines if \( R_0 < 1 \). \( R_0 \approx 2{-}3 \) for seasonal influenza, \( \approx 12{-}18 \) for measles, and was estimated at \( 2{-}3 \) for the original SARS-CoV-2 strain.

## Epidemic Threshold and Herd Immunity

Vaccination reduces the effective susceptible fraction. If a fraction \( p \) of the population is immune before an epidemic starts, the effective reproduction number becomes \( R_\text{eff} = R_0(1-p) \). The epidemic is suppressed when \( R_\text{eff} < 1 \), requiring:

\[ p > 1 - \frac{1}{R_0}. \]

This is the **herd immunity threshold**. For measles (\( R_0 \approx 15 \)), one needs \( p > 0.93 \) — over 93% of the population must be immune to prevent outbreaks. This explains why small drops in vaccination coverage can reignite measles epidemics.

## Phase Portrait and Final Size

Since \( dR/dt > 0 \) always, \( R \) is monotone increasing. The dynamics live effectively in the \( (S, I) \) plane. The trajectory equation is:

\[ \frac{dI}{dS} = -1 + \frac{1}{R_0} \cdot \frac{N}{S}. \]

This integrates to give the **final size relation**: an implicit equation for \( S_\infty \) (the number remaining susceptible after the epidemic has run its course):

\[ S_\infty = S_0 \exp\!\left(-R_0 \frac{N - S_\infty}{N}\right). \]

The epidemic peak in \( I \) occurs when \( dI/dt = 0 \), i.e. at \( S = N/R_0 \). After this point new infections slow and the epidemic declines. Note that even in a large epidemic, a finite fraction of susceptibles escape infection entirely — the epidemic terminates because \( S \) falls below the threshold \( N/R_0 \), not because all susceptibles are infected.

## Extensions: SEIR, SIS, and SIRS

Different diseases require different compartmental structures:

- **SEIR**: Adds an **Exposed** class \( E \) of individuals who are infected but not yet infectious (latent period, e.g. COVID-19 has \( E \sim 5 \) days). This delays the epidemic peak.
- **SIS**: Appropriate when recovery confers no immunity (e.g. bacterial STIs, common cold). Recovered individuals immediately return to \( S \). The model has an endemic equilibrium \( I^* = N(1 - 1/R_0) > 0 \) when \( R_0 > 1 \).
- **SIRS**: Waning immunity — individuals in \( R \) gradually return to \( S \) at rate \( \xi \). Can generate sustained oscillations resembling biennial epidemic cycles seen in many childhood diseases.

When births and deaths are included (on a longer timescale), the SIR model admits a **endemic equilibrium** and its stability analysis shows whether the disease persists indefinitely or dies out.

---

# Chapter 6: Ecological Models — Predator-Prey and Competition

## Lotka-Volterra Predator-Prey Model

Independently formulated by Alfred Lotka (1925) and Vito Volterra (1926), the classic predator-prey model is:

\[ \frac{dx}{dt} = ax - bxy, \qquad \frac{dy}{dt} = cxy - dy. \]

Here \( x \) is prey density, \( y \) is predator density, \( a \) is the prey intrinsic growth rate, \( d \) is the predator death rate, \( b \) is the attack rate per predator, and \( c \) is the conversion efficiency (predators gained per prey consumed).

The prey \( x \)-nullcline is \( y = a/b \) (horizontal line) and the predator \( y \)-nullcline is \( x = d/c \) (vertical line). They intersect at the coexistence equilibrium \( (x^*, y^*) = (d/c,\; a/b) \). Linearisation at this equilibrium gives \( \tau = 0 \), \( \Delta = ad > 0 \) — a **centre**. Trajectories are closed orbits (neutrally stable cycles), neither converging to nor diverging from the equilibrium.

A remarkable conservation quantity exists. Define:

\[ V(x,y) = cy - d\ln y + bx - a\ln x. \]

One can verify that \( dV/dt = 0 \) along trajectories, so \( V \) is a **first integral** — all orbits lie on level curves of \( V \). This explains the perfect closed cycles. However, because the cycles are neutrally stable (not asymptotically stable), they are structurally fragile: any perturbation of the model equations (adding density dependence or stochasticity) immediately changes the qualitative behaviour.

## Biologically Realistic Extensions

Prey populations do not grow without bound in the absence of predators. Adding **logistic prey growth**:

\[ \frac{dx}{dt} = rx\left(1 - \frac{x}{K}\right) - bxy. \]

Now the \( x \)-nullcline is a downward-sloping line in \( (x,y) \) space. Depending on parameters, the coexistence equilibrium may be a stable spiral (damped oscillations) or may lose stability through a **Hopf bifurcation**, creating a stable **limit cycle** — genuine, persistent oscillations with a fixed amplitude. This is biologically more realistic: real lynx-hare and fish populations show sustained cycles, not neutral oscillations.

**Holling functional responses** describe how predator consumption rate varies with prey density. Holling distinguished three types:
- **Type I**: Linear, \( f(x) = ax \) (passive filter feeders).
- **Type II**: Saturating hyperbola, \( f(x) = ax/(1+ahx) \), where \( h \) is the handling time. At high prey density the predator's rate saturates because each capture takes time to process.
- **Type III**: Sigmoidal, \( f(x) = ax^2/(b^2 + x^2) \) (or similar). At low prey density, predators switch to alternative prey (prey switching).

Type II responses are most common and have a destabilising effect on the coexistence equilibrium (tending to create cycles), while type III responses can be stabilising at low prey densities.

## Lotka-Volterra Competition

When two species compete for shared resources, the model is:

\[ \frac{dx}{dt} = r_1 x\left(1 - \frac{x}{K_1} - \frac{\alpha_{12} y}{K_1}\right), \qquad \frac{dy}{dt} = r_2 y\left(1 - \frac{y}{K_2} - \frac{\alpha_{21} x}{K_2}\right). \]

The coefficient \( \alpha_{12} \) measures the competitive effect of species 2 on species 1 (in units of species 1's own effect). The \( x \)-nullclines (excluding \( x=0 \)) are the lines \( x + \alpha_{12} y = K_1 \) and \( y + \alpha_{21} x = K_2 \). There are four qualitatively different configurations of these nullclines:

1. Species 1 wins (nullcline 1 above nullcline 2 everywhere): \( K_1/\alpha_{12} > K_2 \) and \( K_2/\alpha_{21} < K_1 \).
2. Species 2 wins (opposite case).
3. **Stable coexistence**: nullclines cross with the coexistence equilibrium being stable. Requires intraspecific competition to exceed interspecific competition: \( K_1/\alpha_{12} > K_2 \) and \( K_2/\alpha_{21} > K_1 \).
4. **Unstable coexistence (bistability)**: nullclines cross but the equilibrium is a saddle; outcome depends on initial conditions — competitive exclusion, but which species wins depends on who starts with more.

The **competitive exclusion principle** states that two species competing for a single limiting resource cannot stably coexist — one will outcompete the other. Mathematical models make this principle precise and identify the conditions under which coexistence is possible (e.g. multiple resources, spatial heterogeneity, predation).

---

# Chapter 7: Partial Differential Equations and Spatial Biology

## Motivation: Why Space Matters

The models of previous chapters implicitly assume that populations are **well-mixed** — every individual interacts equally with every other. This is a strong assumption, violated whenever spatial structure matters: an invasive species spreading from a point of introduction, a tumour growing outward into healthy tissue, or a neural signal propagating along an axon. Partial differential equations (PDEs) extend ODE models by allowing state variables to depend on both time \( t \) and spatial position \( x \).

## Balance Law and Diffusion

Consider a population with density \( u(x,t) \) on a 1-D domain. Conservation of individuals in a small interval \( [x, x+\Delta x] \) gives:

\[ \frac{\partial}{\partial t}\int_x^{x+\Delta x} u\,dx = J(x,t) - J(x+\Delta x,t) + \int_x^{x+\Delta x} f(u)\,dx. \]

Dividing by \( \Delta x \) and taking \( \Delta x \to 0 \):

\[ \frac{\partial u}{\partial t} = -\frac{\partial J}{\partial x} + f(u). \]

This is the **conservation equation**. Different choices of flux \( J \) give different PDE models.

**Fick's law of diffusion** postulates that organisms (or molecules) move down their concentration gradient:

\[ J = -D \frac{\partial u}{\partial x}. \]

Substituting with \( f=0 \) gives the **diffusion equation** \( \partial u/\partial t = D \partial^2 u/\partial x^2 \). An initial spike \( u(x,0) = M\delta(x) \) spreads as a Gaussian:

\[ u(x,t) = \frac{M}{\sqrt{4\pi D t}} \exp\!\left(-\frac{x^2}{4Dt}\right). \]

The characteristic spread width is \( \sigma = \sqrt{2Dt} \), which grows as \( \sqrt{t} \) — diffusion is slow. A particle diffusing in water with \( D \approx 10^{-9}\,\text{m}^2/\text{s} \) takes over 10 years to travel 1 m. Directed transport (advection, active transport) is needed for biological processes on longer length scales.

## Advection-Diffusion and Chemotaxis

**Advection** at velocity \( v \) gives flux \( J = vu \), leading to \( \partial u/\partial t = -v\,\partial u/\partial x \) (pure transport at speed \( v \) with no spreading). Combining with diffusion:

\[ \frac{\partial u}{\partial t} = D\frac{\partial^2 u}{\partial x^2} - v\frac{\partial u}{\partial x}. \]

**Chemotaxis** is directed movement up (or down) a chemical gradient — critical for immune cell navigation and embryonic development. If \( c(x,t) \) is the chemoattractant concentration, the chemotactic flux is \( J_\chi = \chi(c)\,u\,\partial c/\partial x \). The resulting **Keller-Segel model** for slime mould aggregation is:

\[ \frac{\partial u}{\partial t} = D_u \nabla^2 u - \nabla\cdot(\chi u \nabla c), \qquad \frac{\partial c}{\partial t} = D_c \nabla^2 c + \alpha u - \beta c. \]

The coupling between \( u \) (cells) and \( c \) (attractant produced by cells) creates a **positive feedback** loop that can drive aggregation — cells produce attractant, attractant attracts more cells, which produce more attractant. Keller-Segel dynamics can lead to finite-time blowup (collapse to a point aggregate), captured mathematically by solutions becoming singular.

## Reaction-Diffusion Equations

Combining local dynamics with diffusion gives the **reaction-diffusion equation**:

\[ \frac{\partial u}{\partial t} = D\frac{\partial^2 u}{\partial x^2} + f(u). \]

This single equation simultaneously describes spatial spread and local growth/decay. Depending on \( f(u) \), qualitatively different phenomena emerge. For \( f(u) = ru(1-u) \) (logistic growth), we obtain the **Fisher-KPP equation** studied below. For bistable \( f \) (two stable states), the equation describes nerve impulse propagation.

## Fisher-KPP Equation and Travelling Waves

The **Fisher-KPP equation** (Fisher 1937; Kolmogorov, Petrovskii, Piskunov 1937) models the spatial spread of an advantageous gene or an invasive species:

\[ \frac{\partial u}{\partial t} = D\frac{\partial^2 u}{\partial x^2} + ru(1-u). \]

To find **travelling wave solutions**, we seek \( u(x,t) = U(\xi) \) where \( \xi = x - ct \) (a wave moving rightward at speed \( c \)). Substituting transforms the PDE into the ODE:

\[ DU'' + cU' + rU(1-U) = 0. \]

Writing \( V = U' \) gives the 2D autonomous system \( U' = V \), \( V' = (-cV - rU(1-U))/D \). A travelling wave connecting \( U = 1 \) (behind the front, invaded territory) to \( U = 0 \) (ahead of the front) corresponds to a **heteroclinic orbit** from \( (1,0) \) to \( (0,0) \) in the \( (U,V) \) phase plane. Analysis shows such orbits exist if and only if:

\[ c \geq c^* = 2\sqrt{Dr}. \]

The minimum wave speed \( c^* = 2\sqrt{Dr} \) is selected by initial conditions with compact support. Biologically, the invasion front advances at speed \( c^* \): doubling the diffusion coefficient or doubling the growth rate each increases the wave speed by a factor of \( \sqrt{2} \).

## Turing Instability and Pattern Formation

One of the most celebrated results in mathematical biology is Alan Turing's 1952 demonstration that **diffusion can destabilise a stable equilibrium**, creating spatially periodic patterns from a homogeneous steady state. This "diffusion-driven instability" is a candidate mechanism for the formation of animal coat patterns (spots, stripes, blotches).

Consider two interacting species (e.g. activator \( u \) and inhibitor \( v \)) with different diffusion coefficients:

\[ \frac{\partial u}{\partial t} = D_u \nabla^2 u + f(u,v), \qquad \frac{\partial v}{\partial t} = D_v \nabla^2 v + g(u,v). \]

Suppose the kinetics alone have a stable equilibrium \( (u^*, v^*) \). For Turing instability, we need:
1. An **activator-inhibitor** structure: \( f_u > 0 \) (activator self-activates), \( g_v < 0 \) (inhibitor self-inhibits), and the inhibitor inhibits the activator.
2. The inhibitor diffuses much faster than the activator: \( D_v \gg D_u \).

Linearising and expanding in Fourier modes \( e^{ikx} \) shows that spatial perturbations at a critical wavenumber \( k^* \) grow exponentially, while the homogeneous state remains stable. The resulting spatial pattern has wavelength \( \lambda = 2\pi/k^* \), which depends on \( D_u \), \( D_v \), and the kinetic parameters. Small domains select small wavenumbers (few patches); large domains allow higher harmonics (many stripes). This connects to the observation that small animals (cheetah cubs) have spots while large animals (adult cheetahs' tails) can show striped regions.

## Travelling Waves in Epidemic Models

The spatial SIR model adds diffusion of susceptibles and infectives:

\[ \frac{\partial S}{\partial t} = D_S \nabla^2 S - \beta SI, \qquad \frac{\partial I}{\partial t} = D_I \nabla^2 I + \beta SI - \gamma I. \]

Travelling wave analysis (analogous to Fisher-KPP) shows that epidemic waves propagate at a minimum speed related to \( R_0 \) and the diffusion coefficients. Historical data on the 1347-51 Black Death spreading across Europe (approximately 600 km/year) have been analyzed using such models, with the estimated wave speed consistent with parameters derived from clinical data.

---

# Chapter 8: Further Topics and Synthesis

## Population Genetics

Mathematical models of evolution operate on population-level allele frequencies. **Hardy-Weinberg equilibrium** states that in the absence of selection, mutation, drift, or migration, allele frequencies remain constant and genotype frequencies follow binomial proportions. This is a fixed point of the difference equation for allele frequency under random mating.

**Natural selection** modifies allele frequency. If allele \( A \) has fitness \( w_A \) and \( a \) has fitness \( w_a \), the frequency \( p \) of \( A \) evolves as:

\[ p_{n+1} = \frac{w_A p_n}{\bar{w}}, \qquad \bar{w} = w_A p_n + w_a(1-p_n). \]

Fixed points are \( p^* = 0 \) and \( p^* = 1 \) (fixation of one allele). When \( w_A > w_a \), the \( p^* = 1 \) fixed point is stable — the advantageous allele sweeps to fixation. Heterozygote advantage (\( w_{Aa} > w_{AA}, w_{aa} \)) creates a stable interior equilibrium (balanced polymorphism), explaining the persistence of sickle cell anaemia in malaria-endemic regions.

In small populations, **genetic drift** causes random fluctuations in allele frequencies. The **Wright-Fisher model** describes allele frequency as a binomial sample: if the current frequency is \( p \), the next generation's count of \( A \) alleles among \( 2N \) is \( \text{Binomial}(2N, p) \). Drift can override selection in small populations and lead to fixation of neutral or even slightly deleterious alleles.

## Cell Cycle Models

The cell cycle — the series of events leading to cell division — is controlled by a network of interacting proteins. Mathematical modelling reveals how this network generates switch-like transitions (commitment to division) and oscillatory behavior. A minimal model by Goldbeter (1991) describes cyclin-CDK dynamics with a negative feedback loop:

\[ \frac{dC}{dt} = k_1 - k_2 C - k_3 C \cdot M^*, \qquad \frac{dM^*}{dt} = V_1 \frac{M - M^*}{K_1 + M - M^*} - V_2 \frac{M^*}{K_2 + M^*}. \]

Here \( C \) is cyclin concentration and \( M^* \) is active MPF (maturation-promoting factor). Phase plane analysis shows that for appropriate parameter values, the system has a stable **limit cycle** — a mathematical model of the cell cycle. The period of the limit cycle corresponds to the cell cycle period.

The existence of checkpoints (points in the cycle where progress can halt if conditions are not met) corresponds mathematically to the presence of saddle-node or other bifurcations that can trap the system in a quasi-steady state until a threshold is cleared.

## Delay Differential Equations

Many biological processes involve time delays: gestation periods, maturation times, neural processing delays. A **delay differential equation (DDE)** has the form:

\[ x'(t) = f(x(t),\; x(t-\tau)). \]

The Cheyne-Stokes model of Chapter 2 had this structure in discrete time. In continuous time, the characteristic equation of the linearised DDE near a steady state involves the delay via terms \( e^{-\lambda\tau} \), making it transcendental with infinitely many roots. A fixed point that is stable for \( \tau = 0 \) may lose stability (via a Hopf bifurcation) as \( \tau \) increases past a critical value \( \tau_c \), generating oscillations with period approximately \( 2\tau_c \). This is a general mechanism for oscillations in biology whenever there is a negative feedback loop with a delay.

## Sensitivity Analysis and Parameter Uncertainty

Biological parameters (transmission rates, growth rates, reaction kinetics) are measured with uncertainty. **Sensitivity analysis** quantifies how model outputs change with parameter perturbations.

The **local sensitivity coefficient** for output \( y \) with respect to parameter \( p \) is:

\[ S_{y,p} = \frac{\partial y}{\partial p}\cdot\frac{p}{y}. \]

Normalising by \( p/y \) makes the coefficient dimensionless and comparable across different parameters. A value \( |S_{y,p}| \gg 1 \) indicates that \( y \) is highly sensitive to \( p \) and that parameter must be measured accurately. Sensitivity analysis guided COVID-19 modelling efforts, showing that \( R_0 \) estimates were highly sensitive to assumptions about the latent period.

**Latin hypercube sampling (LHS)** is a global method: simultaneously sample all parameters from their marginal distributions in a space-filling way, run the model for each sample, and examine the resulting distribution of outputs. This is more efficient than grid search and reveals nonlinear interactions between parameters that local sensitivity misses.

## Model Selection and Validation

Given multiple candidate models (e.g. SIR vs. SEIR, different functional responses), how does one choose? **Information criteria** penalise model complexity:

\[ \text{AIC} = 2k - 2\ln\hat{L}, \qquad \text{BIC} = k\ln n - 2\ln\hat{L}, \]

where \( k \) is the number of parameters, \( \hat{L} \) is the maximised likelihood, and \( n \) is the number of data points. Lower AIC/BIC indicates a better balance of fit and parsimony. BIC penalises complexity more heavily than AIC and is preferred when the goal is model identification rather than prediction.

**Structural identifiability** asks: can model parameters in principle be uniquely determined from perfect (noise-free) output data? Even a well-fitted model may be unidentifiable if different parameter combinations produce identical outputs. This is detected algebraically (e.g. via differential algebra methods) and is a prerequisite for reliable parameter estimation.

## Synthesis: The Modelling Cycle Applied to COVID-19

The COVID-19 pandemic is an ideal case study integrating all themes of the course. Early in 2020, ODE epidemic models (SEIR type) were used to estimate \( R_0 \approx 2.5 \) from case doubling times — a direct application of Chapter 3 stability analysis. Age-structured models (Chapter 1 matrix methods) informed which groups to prioritise for vaccination. Spatial spread across cities and countries was analysed with travelling wave theory (Chapter 7). Parameter uncertainty and sensitivity analysis (Chapter 8) quantified the confidence in projections. Model selection methods determined whether adding vaccination, waning immunity, and new variants improved fit.

The pandemic illustrated both the power and the limits of mathematical models. Early models correctly predicted exponential growth and the herd immunity threshold. But they also failed in ways that drove model refinement: failure to account for superspreaders (heterogeneous contact rates), the importance of pre-symptomatic transmission, and behavioural feedbacks (people change behaviour in response to rising case counts, a coupling between human behaviour and epidemic dynamics not present in classical SIR models).

These extensions — network-based epidemic models, behavioural epidemiology, agent-based simulations — represent the frontier of mathematical biology, building on the foundation of continuous and discrete dynamical systems developed throughout this course. The modelling cycle continues.

---

*Notes compiled for AMATH 383, Winter 2025. Prof. Chris Bauch. Primary reference: Edelstein-Keshet, Mathematical Models in Biology (SIAM, 2005).*
