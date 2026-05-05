---
why: |
  UW has AMATH 383 (Intro to Mathematical Biology) and graduate courses on oncology (AMATH 881) and cell biology (AMATH 882), but no graduate course on epidemiology and population dynamics — a major branch of mathematical biology highlighted during the COVID-19 pandemic. The subject is classical (Kermack-McKendrick, 1927) yet remains at the frontier of applied mathematics.
made_up: true
title: "AMATH 883: Mathematical Epidemiology and Population Dynamics"
subjects: "AMATH"
---

*These notes synthesize material from F. Brauer, C. Castillo-Chávez, and Z. Feng's Mathematical Models in Epidemiology, O. Diekmann, H. Heesterbeek, and T. Britton's Mathematical Tools for Understanding Infectious Disease Dynamics, J.D. Murray's Mathematical Biology (Volumes I and II), H.W. Hethcote's The Mathematics of Infectious Diseases (SIAM Review 2000), and Oxford Mathematical Biology lecture notes and Cambridge DAMTP Mathematical Biology notes.*

---

## Chapter 1: Introduction to Mathematical Epidemiology

### 1.1 Historical Roots

The application of mathematics to the study of infectious disease has a remarkably long and distinguished history, stretching back well before the germ theory of disease was established. The central insight — that the spread of infection through a population is a dynamical process amenable to quantitative reasoning — has proved extraordinarily fruitful, and the mathematical frameworks developed in this field now inform public health policy worldwide.

The earliest mathematical contribution to epidemiology is generally attributed to Daniel Bernoulli, who in 1760 published a study analyzing the potential benefits of inoculation against smallpox. Bernoulli constructed a life-table model to compare the age-specific mortality in a population with and without variolation, concluding that universal inoculation would increase life expectancy at birth by roughly three years. His work was remarkable not only for its mathematical content but for its explicitly policy-oriented framing: Bernoulli was using mathematics to argue for a public health intervention.

<div class="remark">
<strong>Remark 1.1.</strong> Bernoulli's 1760 model is sometimes cited as the first instance of mathematical modeling in the life sciences. His approach — comparing hypothetical population trajectories under different intervention scenarios — anticipates the counterfactual reasoning that remains central to modern epidemiological modeling.
</div>

The next major landmark came from Sir Ronald Ross, who in the early 1900s developed mathematical models for the transmission of malaria. Ross recognized that malaria transmission involves a vector (the Anopheles mosquito) and formulated differential equation models capturing the interaction between human and mosquito populations. His work led to a crucial insight: it is not necessary to eliminate every mosquito to eradicate malaria; rather, one need only reduce the mosquito population below a critical threshold. This was among the first appearances of the concept of a transmission threshold in epidemiology.

The foundational framework for most of modern mathematical epidemiology was laid by W.O. Kermack and A.G. McKendrick in their celebrated series of papers beginning in 1927. They introduced the compartmental modeling approach, in which individuals in a population are classified by their disease status — susceptible, infected, recovered — and the dynamics of transitions between these compartments are described by differential equations. Their 1927 paper established the epidemic threshold theorem, which states that an epidemic can only occur if the density of susceptibles exceeds a critical value.

<div class="remark">
<strong>Remark 1.2.</strong> The full Kermack-McKendrick theory is considerably more general than the simple SIR ordinary differential equation model that bears their name. Their original formulation was an integro-differential equation model incorporating age-of-infection structure. The ODE reduction is a special case corresponding to exponentially distributed infectious periods.
</div>

### 1.2 Why Mathematical Models?

Mathematical models serve several distinct purposes in epidemiology. First, they provide a precise language for stating assumptions about disease transmission. The act of writing down equations forces the modeler to be explicit about what is assumed: how transmission occurs, what the timescales are, which factors are included and which are neglected. Second, mathematical analysis can reveal consequences of assumptions that are not intuitively obvious — the epidemic threshold theorem is a prime example. Third, models enable quantitative prediction and scenario analysis: given estimates of key parameters, what is the expected trajectory of an epidemic? What would happen if a vaccination campaign were implemented?

It is essential to recognize that all models are simplifications. The famous aphorism attributed to George Box — "all models are wrong, but some are useful" — applies with particular force in epidemiology, where the systems being modeled involve billions of interacting individuals with heterogeneous behavior, genetics, and social networks. The art of mathematical epidemiology lies in constructing models that capture the essential features of disease transmission while remaining tractable enough to yield insight.

<div class="definition">
<strong>Definition 1.3 (Compartmental Model).</strong> A <em>compartmental model</em> is a system of differential equations describing the flow of individuals among a finite set of disease-related states (compartments). Each compartment represents a class of individuals sharing the same epidemiological status (e.g., susceptible, infected, recovered). The transitions between compartments are governed by rate functions that encode the mechanisms of disease transmission and progression.
</div>

### 1.3 Compartmental Modeling Philosophy

The compartmental approach rests on several simplifying assumptions. The population is assumed to be large enough that a deterministic (continuous) description is appropriate. Individuals within a compartment are assumed to be homogeneous — they share the same risk of infection, the same recovery rate, and so on. Mixing is typically assumed to be homogeneous as well: every susceptible individual is equally likely to encounter any infected individual. These assumptions can be relaxed in more refined models, as we shall see in later chapters.

Let us denote the total population size by \(N\) and the sizes of the various compartments by uppercase letters: \(S\) for susceptibles, \(I\) for infectives, \(R\) for recovered (or removed), and so on. In many models we work with proportions rather than absolute numbers, writing \(s = S/N\), \(i = I/N\), and \(r = R/N\). The choice between absolute numbers and proportions affects the form of the incidence term, as we discuss below.

<div class="definition">
<strong>Definition 1.4 (Incidence).</strong> The <em>incidence</em> of a disease is the rate at which new infections occur. Two common formulations are:
<ul>
<li><em>Mass-action incidence</em> (or bilinear incidence): new infections occur at rate \(\beta S I\), where \(\beta\) is the transmission coefficient.</li>
<li><em>Standard incidence</em> (or frequency-dependent incidence): new infections occur at rate \(\beta S I / N\), reflecting the idea that the contact rate per individual is independent of population size.</li>
</ul>
</div>

The choice between mass-action and standard incidence has significant modeling implications. Mass-action incidence is appropriate when the contact rate between individuals increases with population density (as might occur for animal populations in a confined habitat). Standard incidence is more appropriate for human populations, where each individual has a roughly fixed number of contacts per unit time regardless of population size.

<div class="example">
<strong>Example 1.7.</strong> In a population of \(N = 100{,}000\), suppose each person makes \(c = 10\) contacts per day, and the probability of transmission per contact with an infected individual is \(p = 0.05\). Under standard incidence, the transmission rate is \(\beta = cp = 0.5\) per day, and the force of infection on a susceptible is \(\beta I/N = 0.5 I/N\), independent of \(N\). Under mass-action incidence with the same contact parameters, the force of infection would be \(\beta' I\) where \(\beta' = cp/N\), which does depend on \(N\). The two formulations agree when \(N\) is fixed, but they make different predictions about how transmission scales with population size — a distinction that matters when comparing epidemics across populations of different sizes.
</div>

### 1.4 Timescales in Epidemiology

A crucial consideration in epidemic modeling is the separation of timescales. Infectious disease dynamics typically operate on two very different timescales: the epidemic timescale (the duration of an outbreak, often weeks to months) and the demographic timescale (the timescale of births, deaths, and population turnover, typically decades).

<div class="remark">
<strong>Remark 1.5.</strong> For fast epidemics such as influenza (typical epidemic duration of 6-12 weeks) in large populations, the demographic timescale is so much longer than the epidemic timescale that births and natural deaths can be neglected during the course of the outbreak. This leads to the "closed population" models studied in Chapter 2. For endemic diseases that persist in a population over years or decades (e.g., measles, tuberculosis), demographic processes — particularly the influx of new susceptibles through births — are essential to sustain transmission, and must be included in the model.
</div>

When the epidemic timescale is much shorter than the demographic timescale, we may treat the total population \(N\) as approximately constant and ignore births and deaths. This leads to the simplest and most classical models. When the two timescales are comparable, or when we wish to study the long-term endemic behavior of a disease, we must incorporate demographic processes into the model.

<div class="example">
<strong>Example 1.6.</strong> Consider measles in a large city. The infectious period is roughly 7-10 days, and epidemic waves occur every 2-3 years. The demographic timescale (average human lifespan) is roughly 70 years. For modeling a single epidemic wave, births and deaths can be neglected. However, to understand the recurrent epidemic pattern — the biennial cycle driven by the buildup and depletion of susceptibles — one must include the birth of new susceptibles. This is precisely the distinction between the closed-population SIR model (Chapter 2) and the SIR model with demographics (Chapter 3).
</div>

---

## Chapter 2: The SIR Model and Basic Reproduction Number

### 2.1 The Kermack-McKendrick SIR Model

We now develop in detail the most fundamental model of mathematical epidemiology: the SIR model for a closed population. This model, introduced by Kermack and McKendrick in 1927, describes the spread of an infectious disease through a population that is divided into three compartments: Susceptible (S), Infected (I), and Recovered (R). The flow is unidirectional: \(S \to I \to R\).

<div class="definition">
<strong>Definition 2.1 (SIR Model).</strong> The <em>SIR model without demography</em> is the system of ordinary differential equations

\[
\frac{dS}{dt} = -\beta S I, \qquad \frac{dI}{dt} = \beta S I - \gamma I, \qquad \frac{dR}{dt} = \gamma I,
\]
where \(\beta > 0\) is the transmission rate, \(\gamma > 0\) is the recovery rate, \(S(0) = S_0 > 0\), \(I(0) = I_0 > 0\), \(R(0) = R_0 \geq 0\), and \(S_0 + I_0 + R_0 = N\).
</div>

The assumptions underlying this model are worth stating explicitly. First, the population is closed: \(S + I + R = N\) is constant (adding the three equations gives \(d(S+I+R)/dt = 0\)). Second, transmission follows mass-action kinetics with rate \(\beta\). Third, recovery occurs at a constant per-capita rate \(\gamma\), so the infectious period is exponentially distributed with mean \(1/\gamma\). Fourth, recovered individuals are permanently immune.

The third equation for \(R\) is decoupled from the first two: once \(S(t)\) and \(I(t)\) are known, \(R(t) = N - S(t) - I(t)\) is determined. This is a common feature of "removed" compartments in epidemiological models — they serve as a bookkeeping device but do not influence the transmission dynamics. Since \(R\) does not appear in the first two equations, the dynamics are fully determined by the \((S, I)\) subsystem:

\[
\frac{dS}{dt} = -\beta S I, \qquad \frac{dI}{dt} = (\beta S - \gamma) I.
\]

From the second equation, we see immediately that \(dI/dt > 0\) if and only if \(S > \gamma/\beta\). This is the essence of the epidemic threshold: an epidemic (initial increase in infected individuals) occurs if and only if the initial number of susceptibles exceeds the critical value \(\gamma/\beta\).

### 2.2 The Basic Reproduction Number

The quantity \(\gamma/\beta\) arising from the threshold condition can be repackaged into what is arguably the single most important quantity in mathematical epidemiology. The idea is to ask: if a single infected individual is placed into a fully susceptible population, how many secondary infections will it produce during its entire infectious period? If this number exceeds 1, the infection can spread; if it is less than 1, the infection dies out. This quantity, denoted \(\mathcal{R}_0\), provides a dimensionless threshold parameter that summarizes the transmissibility of a disease in a single number.

<div class="definition">
<strong>Definition 2.2 (Basic Reproduction Number).</strong> The <em>basic reproduction number</em> \(\mathcal{R}_0\) is the expected number of secondary infections produced by a single infected individual introduced into a fully susceptible population. For the SIR model,

\[
\mathcal{R}_0 = \frac{\beta N}{\gamma}.
\]
</div>

The interpretation is straightforward: an infected individual makes \(\beta N\) potentially infectious contacts per unit time (under mass-action incidence in a fully susceptible population of size \(N\)) and remains infectious for an average duration of \(1/\gamma\), so the expected number of secondary cases is \(\beta N / \gamma\).

<div class="theorem">
<strong>Theorem 2.3 (Epidemic Threshold Theorem, Kermack-McKendrick, 1927).</strong> Consider the SIR model with initial conditions \(S(0) = S_0\), \(I(0) = I_0 > 0\), and define \(\mathcal{R}_0 = \beta S_0 / \gamma\) (using standard incidence normalization where \(S_0 \approx N\)). Then:
<ol>
<li>If \(\mathcal{R}_0 \leq 1\), then \(I(t)\) is monotonically decreasing for all \(t > 0\): no epidemic occurs.</li>
<li>If \(\mathcal{R}_0 > 1\), then \(I(t)\) initially increases, reaches a unique maximum, and then decreases to zero: an epidemic occurs.</li>
</ol>
In both cases, \(I(t) \to 0\) as \(t \to \infty\), and there remain susceptibles who escape infection: \(S(\infty) = \lim_{t \to \infty} S(t) > 0\).
</div>

<div class="proof">
<strong>Proof.</strong> From \(dI/dt = (\beta S - \gamma)I\) and \(I > 0\), the sign of \(dI/dt\) is determined by \(\beta S - \gamma\). Since \(dS/dt = -\beta SI < 0\) whenever \(I > 0\), the susceptible population \(S(t)\) is strictly decreasing. If \(S_0 \leq \gamma/\beta\), i.e., \(\mathcal{R}_0 \leq 1\), then \(S(t) < S_0 \leq \gamma/\beta\) for all \(t > 0\), so \(dI/dt < 0\) always.

If \(S_0 > \gamma/\beta\), i.e., \(\mathcal{R}_0 > 1\), then initially \(dI/dt > 0\) so \(I\) increases. Since \(S\) is decreasing, there exists a unique time \(t^*\) at which \(S(t^*) = \gamma/\beta\), and \(I\) achieves its maximum at \(t^*\).

To show \(I(t) \to 0\), note that \(S\) is decreasing and bounded below by 0, so \(S(\infty)\) exists. If \(I\) did not tend to 0, the integral \(\int_0^\infty I(t)\,dt\) would diverge. But from \(dS/dt = -\beta SI\), we have \(S_0 - S(\infty) = \beta \int_0^\infty S(t)I(t)\,dt \leq \beta S_0 \int_0^\infty I(t)\,dt\), and since the left side is finite, \(\int_0^\infty I(t)\,dt < \infty\). Combined with the fact that \(dI/dt\) is bounded, Barbalat's lemma gives \(I(t) \to 0\).

Finally, \(S(\infty) > 0\) because the equation \(dS/dt = -\beta SI\) implies \(\ln S(t) - \ln S_0 = -\beta \int_0^t I(\tau)\,d\tau\), so \(S(t) = S_0 \exp(-\beta \int_0^t I(\tau)\,d\tau) > 0\) for all \(t\), including the limit. \(\square\)
</div>

### 2.3 Phase Portrait Analysis

The phase portrait of the SIR system in the \((S, I)\)-plane reveals the global dynamics with elegant clarity. We can eliminate time by dividing the two equations:

\[
\frac{dI}{dS} = \frac{\beta S I - \gamma I}{-\beta S I} = -1 + \frac{\gamma}{\beta S}.
\]

This separable ODE integrates to give the conserved quantity

\[
V(S, I) = S + I - \frac{\gamma}{\beta} \ln S = \text{constant}.
\]

The level curves of \(V\) are the phase trajectories. Each trajectory is a curve in the first quadrant of the \((S, I)\)-plane. Since \(S\) is always decreasing (when \(I > 0\)), trajectories move from right to left. When \(\mathcal{R}_0 > 1\), trajectories rise (as \(I\) increases) until \(S\) drops to \(\gamma/\beta\), then fall to the \(S\)-axis.

<div class="example">
<strong>Example 2.4.</strong> Consider an SIR model with \(N = 1000\), \(\beta = 0.0005\), \(\gamma = 0.2\), and initial conditions \(S_0 = 999\), \(I_0 = 1\), \(R_0 = 0\). Then \(\mathcal{R}_0 = \beta S_0 / \gamma = 0.0005 \times 999 / 0.2 \approx 2.50\). Since \(\mathcal{R}_0 > 1\), an epidemic occurs. The peak of the epidemic occurs when \(S = \gamma/\beta = 400\), at which point \(I = S_0 + I_0 - 400 - (\gamma/\beta)\ln(S_0/400) = 1000 - 400 - 400\ln(999/400) \approx 1000 - 400 - 400(0.916) \approx 233.6\). Thus approximately 23.4\% of the population is simultaneously infected at the epidemic peak.
</div>

### 2.4 The Final Size Relation

A remarkable feature of the SIR model is that the total number of individuals ultimately infected — the final epidemic size — can be determined without solving the differential equations explicitly. This is the final size relation.

<div class="theorem">
<strong>Theorem 2.5 (Final Size Relation).</strong> Let \(S_\infty = \lim_{t \to \infty} S(t)\). Then \(S_\infty\) is the unique solution in \((0, S_0)\) (when \(\mathcal{R}_0 > 1\)) or in \((0, S_0]\) of the transcendental equation

\[
\ln \frac{S_0}{S_\infty} = \frac{\beta}{\gamma}(S_0 - S_\infty + I_0).
\]
Equivalently, if \(I_0\) is small relative to \(N\),

\[
\ln \frac{S_0}{S_\infty} \approx \mathcal{R}_0 \left(1 - \frac{S_\infty}{N}\right).
\]
The total number infected during the epidemic is \(S_0 - S_\infty\).
</div>

<div class="proof">
<strong>Proof.</strong> From the conserved quantity \(V(S, I) = S + I - (\gamma/\beta)\ln S\), we have \(V(S_0, I_0) = V(S_\infty, 0)\) since \(I(\infty) = 0\). Therefore

\[
S_0 + I_0 - \frac{\gamma}{\beta}\ln S_0 = S_\infty - \frac{\gamma}{\beta}\ln S_\infty.
\]
Rearranging gives \(\frac{\gamma}{\beta}(\ln S_0 - \ln S_\infty) = S_0 + I_0 - S_\infty\), which yields the stated equation. Existence and uniqueness of the solution follow from a graphical argument: the function \(f(x) = \ln(S_0/x) - (\beta/\gamma)(S_0 + I_0 - x)\) satisfies \(f(S_0) = -\beta I_0/\gamma < 0\) and \(f(0^+) = +\infty\), so by the intermediate value theorem there exists a root. Uniqueness follows from convexity considerations. \(\square\)
</div>

The final size relation is one of the most practically useful results in mathematical epidemiology. Given \(\mathcal{R}_0\), one can immediately determine what fraction of the population will ultimately be infected without simulating the full time course. For instance, if \(\mathcal{R}_0 = 2\), the final size relation predicts that approximately 80\% of the population will eventually be infected.

<div class="example">
<strong>Example 2.6.</strong> The following table shows the final attack rate (fraction of the population infected, \((S_0 - S_\infty)/N\)) predicted by the final size relation for several values of \(\mathcal{R}_0\), with \(I_0 \ll N\):

\(\mathcal{R}_0 = 1.5\): attack rate \(\approx 58\%\). \(\mathcal{R}_0 = 2.0\): attack rate \(\approx 80\%\). \(\mathcal{R}_0 = 3.0\): attack rate \(\approx 94\%\). \(\mathcal{R}_0 = 5.0\): attack rate \(\approx 99.3\%\). \(\mathcal{R}_0 = 10.0\): attack rate \(\approx 99.99\%\).

These values illustrate the steep relationship between transmissibility and final epidemic size. Even a modest \(\mathcal{R}_0\) of 1.5 (typical of pandemic influenza) results in a majority of the population being infected. For highly transmissible diseases like measles (\(\mathcal{R}_0 \approx 12\text{--}18\)), essentially the entire susceptible population is eventually infected.
</div>

### 2.5 The SIS Model and Endemic Equilibria

Not all diseases confer lasting immunity. For diseases such as gonorrhea, chlamydia, or the common cold, individuals return to the susceptible class upon recovery, since infection does not generate durable protective immunity. This fundamental distinction between immunizing and non-immunizing infections leads to qualitatively different dynamical behavior. The simplest model for a non-immunizing infection is the SIS model.

<div class="definition">
<strong>Definition 2.6 (SIS Model).</strong> The <em>SIS model without demography</em> is

\[
\frac{dS}{dt} = -\beta S I + \gamma I, \qquad \frac{dI}{dt} = \beta S I - \gamma I,
\]
with \(S + I = N\) constant. Substituting \(S = N - I\):

\[
\frac{dI}{dt} = (\beta(N-I) - \gamma)I = (\beta N - \gamma)I - \beta I^2.
\]
</div>

This is a logistic-type equation. Unlike the SIR model, the SIS model admits a nontrivial equilibrium.

<div class="theorem">
<strong>Theorem 2.7 (SIS Equilibria).</strong> Let \(\mathcal{R}_0 = \beta N / \gamma\). The SIS model has two equilibria:
<ol>
<li>The <em>disease-free equilibrium</em> (DFE): \(I^* = 0\), which is globally asymptotically stable if \(\mathcal{R}_0 \leq 1\).</li>
<li>The <em>endemic equilibrium</em>: \(I^* = N(1 - 1/\mathcal{R}_0)\), which exists and is globally asymptotically stable when \(\mathcal{R}_0 > 1\).</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> Setting \(dI/dt = 0\) gives \(I[(\beta N - \gamma) - \beta I] = 0\), yielding \(I^* = 0\) or \(I^* = N - \gamma/\beta = N(1 - 1/\mathcal{R}_0)\). The latter is positive if and only if \(\mathcal{R}_0 > 1\). Since \(dI/dt\) is a downward-opening parabola in \(I\), the endemic equilibrium (when it exists) attracts all trajectories with \(I(0) > 0\), and the DFE attracts all such trajectories when \(\mathcal{R}_0 \leq 1\). \(\square\)
</div>

The SIS model illustrates a key principle: when immunity is not permanent, the disease can persist indefinitely in the population as an endemic infection. The endemic prevalence \(I^*/N = 1 - 1/\mathcal{R}_0\) increases with \(\mathcal{R}_0\), approaching 100\% as \(\mathcal{R}_0 \to \infty\).

<div class="remark">
<strong>Remark 2.9.</strong> The SIS model is the epidemiological analogue of the logistic equation in population dynamics. Writing \(i = I/N\), the SIS equation becomes \(di/dt = (\beta N - \gamma)i - \beta N i^2 = (\beta N - \gamma)i(1 - i/i^*)\), where \(i^* = 1 - 1/\mathcal{R}_0\). This is precisely the logistic equation with intrinsic growth rate \(\beta N - \gamma\) and carrying capacity \(i^*\). This structural parallel between epidemiology and ecology will reappear throughout the course.
</div>

<div class="example">
<strong>Example 2.8.</strong> A sexually transmitted infection has \(\mathcal{R}_0 = 1.5\) in a population of \(N = 10{,}000\). The SIS model predicts an endemic prevalence of \(I^*/N = 1 - 1/1.5 = 1/3 \approx 33\%\). If a control program reduces \(\mathcal{R}_0\) to below 1 (for example, through contact tracing and treatment), the model predicts eventual elimination.
</div>

---

## Chapter 3: Extensions of Compartmental Models

The basic SIR and SIS models of Chapter 2, while enormously instructive, omit many important features of real infectious diseases. In this chapter, we systematically extend the compartmental framework to accommodate latent periods, waning immunity, vaccination, demographics, and vector-borne transmission. Each extension adds biological realism at the cost of mathematical complexity, but the fundamental concepts — \(\mathcal{R}_0\), threshold behavior, equilibrium analysis — continue to organize our understanding.

### 3.1 The SEIR Model

Many infectious diseases have a latent period: after becoming infected, an individual is not immediately infectious. During this exposed (or latent) period, the pathogen is replicating within the host but has not yet reached the level necessary for onward transmission. Diseases such as measles (latent period 8-13 days), influenza (1-3 days), and Ebola (2-21 days) all exhibit significant latent periods.

<div class="definition">
<strong>Definition 3.1 (SEIR Model).</strong> The <em>SEIR model</em> introduces an Exposed compartment between S and I:

\[
\frac{dS}{dt} = -\beta SI, \qquad \frac{dE}{dt} = \beta SI - \sigma E, \qquad \frac{dI}{dt} = \sigma E - \gamma I, \qquad \frac{dR}{dt} = \gamma I,
\]
where \(\sigma > 0\) is the rate at which exposed individuals become infectious (so \(1/\sigma\) is the mean latent period).
</div>

The total population \(N = S + E + I + R\) is again constant. The basic reproduction number remains \(\mathcal{R}_0 = \beta N / \gamma\), because \(\sigma\) affects the timing but not the total number of secondary infections produced by one infected individual. However, the latent period does affect the speed at which an epidemic grows: the initial exponential growth rate is no longer simply \((\mathcal{R}_0 - 1)\gamma\) but is the positive root of the characteristic equation

\[
(\lambda + \sigma)(\lambda + \gamma) = \beta N \sigma,
\]
which is smaller than in the SIR case, reflecting the delay introduced by the latent period.

<div class="example">
<strong>Example 3.2.</strong> For measles, typical parameters are \(\beta N \approx 1.0\) day\(^{-1}\), \(1/\sigma = 8\) days, and \(1/\gamma = 5\) days, giving \(\mathcal{R}_0 = \beta N/\gamma = 5.0\). The characteristic equation is \((\lambda + 0.125)(\lambda + 0.2) = 1.0 \times 0.125\), which gives \(\lambda^2 + 0.325\lambda + 0.025 = 0.125\), so \(\lambda^2 + 0.325\lambda - 0.1 = 0\). The positive root is \(\lambda \approx 0.21\) day\(^{-1}\), corresponding to a doubling time of about 3.3 days.
</div>

### 3.2 The SIRS Model

For some diseases, immunity wanes over time, so that recovered individuals eventually return to the susceptible class. This gives rise to the SIRS model.

<div class="definition">
<strong>Definition 3.3 (SIRS Model).</strong> The <em>SIRS model</em> is

\[
\frac{dS}{dt} = -\beta SI + \delta R, \qquad \frac{dI}{dt} = \beta SI - \gamma I, \qquad \frac{dR}{dt} = \gamma I - \delta R,
\]
where \(\delta > 0\) is the rate of immunity loss (so \(1/\delta\) is the mean duration of immunity).
</div>

When \(\delta > 0\), recovered individuals re-enter the susceptible pool, which can sustain endemic transmission even in a closed population. The SIRS model with \(\delta > 0\) can exhibit a stable endemic equilibrium analogous to that of the SIS model, with infected fraction at equilibrium given by appropriate algebraic expressions in \(\beta\), \(\gamma\), \(\delta\), and \(N\).

<div class="example">
<strong>Example 3.4.</strong> Seasonal influenza is well modeled by the SIRS framework. The infectious period is approximately \(1/\gamma \approx 5\) days, and immunity from a given strain wanes over roughly \(1/\delta \approx 2\text{--}5\) years (due to both antigenic drift in the virus and waning of host immunity). In a population of \(N = 10^6\) with \(\beta N/\gamma = 1.5\), the SIRS model predicts a cycle of epidemic waves driven by the gradual accumulation of susceptibles through waning immunity, qualitatively matching the annual or biennial periodicity of influenza outbreaks.
</div>

<div class="remark">
<strong>Remark 3.5.</strong> The SIRS model interpolates between the SIR model (\(\delta = 0\), permanent immunity, no endemic state in a closed population) and the SIS model (\(\delta \to \infty\), no immunity, endemic state possible). In the limit \(\delta \to \infty\), the R compartment empties instantly and recovered individuals immediately become susceptible again, recovering the SIS dynamics. The ratio \(\gamma/\delta\) — the mean duration of immunity relative to the mean infectious period — controls which regime the model is closer to.
</div>

### 3.3 Models with Vaccination

Vaccination is the most powerful tool available for disease control. To model vaccination, we introduce a vaccinated compartment \(V\), or equivalently, we modify the inflow into the susceptible class.

<div class="definition">
<strong>Definition 3.4 (SIR with Vaccination at Birth).</strong> In a model with demographics (birth rate \(\mu N\), death rate \(\mu\) in each compartment), vaccination of a fraction \(p\) of newborns gives:

\[
\frac{dS}{dt} = \mu N(1-p) - \beta SI - \mu S, \qquad \frac{dI}{dt} = \beta SI - (\gamma + \mu)I, \qquad \frac{dR}{dt} = \gamma I + \mu N p - \mu R.
\]
</div>

The effect of vaccination is to reduce the effective reproduction number. If a fraction \(p\) of the population is vaccinated (with a perfectly effective vaccine), the effective reproduction number becomes \(\mathcal{R}_e = \mathcal{R}_0(1-p)\).

<div class="theorem">
<strong>Theorem 3.5 (Critical Vaccination Threshold).</strong> For a vaccine with efficacy \(\varepsilon\) (where \(0 < \varepsilon \leq 1\)), disease eradication requires the vaccination coverage \(p\) to satisfy

\[
p > p_c = \frac{1}{\varepsilon}\left(1 - \frac{1}{\mathcal{R}_0}\right).
\]
For a perfect vaccine (\(\varepsilon = 1\)), this reduces to \(p_c = 1 - 1/\mathcal{R}_0\).
</div>

This result has profound public health implications. For measles, with \(\mathcal{R}_0 \approx 12\text{--}18\), the critical vaccination coverage is \(p_c \approx 92\text{--}95\%\). This explains why measles outbreaks can occur even in highly vaccinated populations: if coverage drops even slightly below the critical threshold, herd immunity is lost. The concept of herd immunity — the indirect protection of unvaccinated individuals when a sufficient fraction of the population is immune — is one of the most important insights of mathematical epidemiology, and it emerges naturally from the vaccination threshold formula.

<div class="example">
<strong>Example 3.6.</strong> Consider a disease with \(\mathcal{R}_0 = 4\) and a vaccine with 90\% efficacy. The critical coverage is \(p_c = (1/0.9)(1 - 1/4) = (1/0.9)(3/4) = 5/6 \approx 83.3\%\). If only 80\% of the population is vaccinated, the effective reproduction number is \(\mathcal{R}_e = 4(1 - 0.9 \times 0.8) = 4(0.28) = 1.12 > 1\), so the disease can still persist.
</div>

### 3.4 Models with Demographics

When studying diseases that persist over long time periods, demographic processes — births and deaths — must be included. The standard SIR model with demographics assumes a constant birth rate equal to the death rate, maintaining constant population size.

<div class="definition">
<strong>Definition 3.7 (SIR with Demographics).</strong> The <em>SIR model with vital dynamics</em> is

\[
\frac{dS}{dt} = \mu N - \beta SI - \mu S, \qquad \frac{dI}{dt} = \beta SI - \gamma I - \mu I, \qquad \frac{dR}{dt} = \gamma I - \mu R,
\]
where \(\mu\) is the per-capita birth and death rate (so \(1/\mu\) is the average lifespan). All newborns enter the susceptible class.
</div>

The introduction of demographics qualitatively changes the long-term behavior. Unlike the closed-population SIR model (where \(I \to 0\) always), the model with demographics can sustain an endemic equilibrium because births continuously replenish the susceptible population. The key mechanism is that as the epidemic depletes susceptibles, the birth of new (uninfected) individuals eventually restores the susceptible pool sufficiently for a new wave of infection. In the long run, the system reaches a balance between the influx of new susceptibles through births and their depletion through infection.

<div class="example">
<strong>Example 3.8.</strong> For childhood diseases like measles in a pre-vaccination era, the demographic parameters are crucial. With a mean lifespan of \(1/\mu = 70\) years and \(\mathcal{R}_0 \approx 15\), the average age at infection in the endemic equilibrium is approximately \(A \approx 1/(\mu(\mathcal{R}_0 - 1)) = 70/14 = 5\) years, consistent with the observation that measles was primarily a disease of young children. This relationship \(A \approx L/(\mathcal{R}_0 - 1)\), where \(L = 1/\mu\) is the mean lifespan, provides a useful method for estimating \(\mathcal{R}_0\) from serological data on the average age at infection.
</div>

<div class="theorem">
<strong>Theorem 3.9 (Endemic Equilibrium of SIR with Demographics).</strong> Let \(\mathcal{R}_0 = \beta N / (\gamma + \mu)\). The system has:
<ol>
<li>A disease-free equilibrium \((S^*, I^*, R^*) = (N, 0, 0)\), which is locally asymptotically stable if \(\mathcal{R}_0 < 1\) and unstable if \(\mathcal{R}_0 > 1\).</li>
<li>A unique endemic equilibrium

\[
S^* = \frac{\gamma + \mu}{\beta} = \frac{N}{\mathcal{R}_0}, \qquad I^* = \frac{\mu N}{\gamma + \mu}\left(1 - \frac{1}{\mathcal{R}_0}\right), \qquad R^* = \frac{\gamma}{\mu}I^*,
\]
which exists and is locally asymptotically stable when \(\mathcal{R}_0 > 1\).</li>
</ol>
</div>

### 3.5 Vector-Borne Diseases: The Ross-Macdonald Model

Many important infectious diseases — malaria, dengue, Zika, West Nile virus — are transmitted by arthropod vectors, typically mosquitoes. The Ross-Macdonald model, originating in the work of Ronald Ross (1911) and refined by George Macdonald (1957), captures the essential features of vector-borne transmission.

<div class="definition">
<strong>Definition 3.10 (Ross-Macdonald Model).</strong> Let \(S_H, I_H\) be susceptible and infected humans, and \(S_V, I_V\) be susceptible and infected vectors (mosquitoes). The <em>Ross-Macdonald model</em> is:

\[
\frac{dI_H}{dt} = a b \frac{I_V}{N_H}(N_H - I_H) - r I_H, \qquad \frac{dI_V}{dt} = a c \frac{I_H}{N_H}(N_V - I_V) - \mu_V I_V,
\]
where \(a\) is the biting rate of a mosquito, \(b\) is the probability of transmission from vector to human per bite, \(c\) is the probability of transmission from human to vector per bite, \(r\) is the human recovery rate, \(N_V\) is the total vector population, and \(\mu_V\) is the vector death rate.
</div>

The basic reproduction number for the Ross-Macdonald model is

\[
\mathcal{R}_0 = \frac{m a^2 b c}{r \mu_V},
\]

where \(m = N_V / N_H\) is the vector-to-host ratio. The quadratic dependence on the biting rate \(a\) reflects the fact that a mosquito must bite twice — once to acquire the infection, once to transmit it — and this is a key insight of the Ross-Macdonald theory. It implies that reducing biting rates (e.g., through bed nets) is doubly effective compared to what one might naively expect.

<div class="example">
<strong>Example 3.11.</strong> For malaria in a tropical setting, typical parameters might be \(m = 2\), \(a = 0.3\) bites per day, \(b = 0.5\), \(c = 0.5\), \(r = 1/200\) day\(^{-1}\) (chronic infection), and \(\mu_V = 1/10\) day\(^{-1}\). Then \(\mathcal{R}_0 = 2 \times 0.09 \times 0.25 / (0.005 \times 0.1) = 0.045 / 0.0005 = 90\). This extraordinarily high \(\mathcal{R}_0\) explains why malaria is so difficult to eradicate and why it has persisted in tropical regions despite centuries of control efforts.
</div>

---

## Chapter 4: Stability Analysis and Bifurcations

The previous chapters introduced several compartmental models and stated results about their equilibria and stability. In this chapter, we develop the general mathematical machinery needed to rigorously establish these results. The tools — linearization, Routh-Hurwitz criteria, Lyapunov functions, bifurcation theory — are drawn from the theory of ordinary differential equations and dynamical systems, but we present them here in the specific context of epidemiological models, emphasizing the biological interpretation at each step.

### 4.1 Disease-Free and Endemic Equilibria

The qualitative behavior of epidemic models is governed by their equilibria and the stability properties thereof. In this chapter, we develop the systematic tools for analyzing equilibria in compartmental models, drawing on the theory of ordinary differential equations and dynamical systems.

<div class="definition">
<strong>Definition 4.1 (Disease-Free Equilibrium).</strong> A <em>disease-free equilibrium</em> (DFE) of an epidemic model is an equilibrium at which no disease is present, i.e., all infected compartments are zero. In an SIR model with demographics, the DFE is \((S, I, R) = (N, 0, 0)\).
</div>

<div class="definition">
<strong>Definition 4.2 (Endemic Equilibrium).</strong> An <em>endemic equilibrium</em> (EE) is an equilibrium at which at least one infected compartment is strictly positive, representing persistent disease in the population.
</div>

The central question of mathematical epidemiology is: under what conditions is the DFE stable (disease dies out) versus unstable (disease invades), and when does a stable EE exist? The answer, as we shall see, is organized by the basic reproduction number \(\mathcal{R}_0\).

### 4.2 Local Stability via Linearization

The local stability of an equilibrium is determined by linearization. Consider a general ODE system \(\dot{x} = f(x)\) with equilibrium \(x^*\) (so \(f(x^*) = 0\)). The Jacobian matrix at \(x^*\) is

\[
J = Df(x^*) = \left(\frac{\partial f_i}{\partial x_j}\right)\bigg|_{x = x^*}.
\]

<div class="theorem">
<strong>Theorem 4.3 (Hartman-Grobman).</strong> If all eigenvalues of \(J\) have nonzero real part (i.e., \(x^*\) is a hyperbolic equilibrium), then the nonlinear system is topologically conjugate to the linear system \(\dot{y} = Jy\) near \(x^*\). In particular, \(x^*\) is locally asymptotically stable if and only if all eigenvalues of \(J\) have strictly negative real part.
</div>

For the SIR model with demographics, the Jacobian at the DFE \((N, 0, 0)\) (restricted to the \((S, I)\) subsystem since \(R = N - S - I\)) is

\[
J_{\text{DFE}} = \begin{pmatrix} -\mu & -\beta N \\ 0 & \beta N - \gamma - \mu \end{pmatrix}.
\]

The eigenvalues are \(\lambda_1 = -\mu < 0\) and \(\lambda_2 = \beta N - \gamma - \mu = (\gamma + \mu)(\mathcal{R}_0 - 1)\). Thus the DFE is locally asymptotically stable if and only if \(\mathcal{R}_0 < 1\), confirming the threshold result.

### 4.3 Routh-Hurwitz Criteria

For higher-dimensional systems, computing eigenvalues explicitly may be impractical. The Routh-Hurwitz criteria provide algebraic conditions on the coefficients of the characteristic polynomial that are equivalent to all roots having negative real part.

<div class="theorem">
<strong>Theorem 4.4 (Routh-Hurwitz Criteria).</strong> Consider the characteristic polynomial \(p(\lambda) = \lambda^n + a_1\lambda^{n-1} + \cdots + a_n\). All roots have strictly negative real part if and only if the Hurwitz determinants are all positive:

\[
\Delta_1 = a_1 > 0, \quad \Delta_2 = \begin{vmatrix} a_1 & 1 \\ a_3 & a_2 \end{vmatrix} > 0, \quad \Delta_3 = \begin{vmatrix} a_1 & 1 & 0 \\ a_3 & a_2 & a_1 \\ a_5 & a_4 & a_3 \end{vmatrix} > 0, \quad \ldots
\]
For \(n = 2\): \(a_1 > 0\) and \(a_2 > 0\). For \(n = 3\): \(a_1 > 0\), \(a_3 > 0\), and \(a_1 a_2 > a_3\).
</div>

<div class="example">
<strong>Example 4.5.</strong> Consider the SEIR model with demographics. At the endemic equilibrium, the Jacobian of the three-dimensional reduced system (after eliminating \(R\)) yields a characteristic polynomial of degree 3. The Routh-Hurwitz conditions \(a_1 > 0\), \(a_3 > 0\), and \(a_1 a_2 > a_3\) can be verified using the explicit expressions for the equilibrium values, confirming local asymptotic stability of the endemic equilibrium when \(\mathcal{R}_0 > 1\) for this model.
</div>

### 4.4 Global Stability via Lyapunov Functions

Local stability tells us about the behavior of solutions starting near an equilibrium. For many epidemiological questions, we need global stability: does every trajectory (with appropriate initial conditions) converge to the equilibrium? Lyapunov's direct method provides the principal tool.

<div class="theorem">
<strong>Theorem 4.6 (Lyapunov's Stability Theorem).</strong> Let \(x^*\) be an equilibrium of \(\dot{x} = f(x)\), and let \(V: D \to \mathbb{R}\) be a continuously differentiable function defined on a domain \(D\) containing \(x^*\) such that:
<ol>
<li>\(V(x^*) = 0\) and \(V(x) > 0\) for \(x \neq x^*\) in \(D\).</li>
<li>\(\dot{V}(x) = \nabla V \cdot f(x) \leq 0\) for all \(x \in D\).</li>
</ol>
Then \(x^*\) is stable. If moreover \(\dot{V}(x) < 0\) for all \(x \neq x^*\), then \(x^*\) is asymptotically stable. If \(D = \mathbb{R}^n\) and \(V(x) \to \infty\) as \(\|x\| \to \infty\), then \(x^*\) is globally asymptotically stable.
</div>

The challenge, of course, is constructing an appropriate Lyapunov function. For epidemic models, a particularly successful class of Lyapunov functions was introduced by Korobeinikov and collaborators.

<div class="theorem">
<strong>Theorem 4.7 (Korobeinikov, 2004).</strong> For the SIR model with demographics and \(\mathcal{R}_0 > 1\), the function

\[
V(S, I) = \left(S - S^* - S^* \ln \frac{S}{S^*}\right) + \left(I - I^* - I^* \ln \frac{I}{I^*}\right)
\]
is a Lyapunov function establishing global asymptotic stability of the endemic equilibrium \((S^*, I^*)\) in the interior of the positive quadrant. Here the function \(g(x) = x - x^* - x^* \ln(x/x^*) \geq 0\) with equality if and only if \(x = x^*\).
</div>

<div class="proof">
<strong>Proof.</strong> We verify that \(\dot{V} \leq 0\) along trajectories. Computing:

\[
\dot{V} = \left(1 - \frac{S^*}{S}\right)\dot{S} + \left(1 - \frac{I^*}{I}\right)\dot{I}.
\]
Substituting the SIR equations with demographics and using the equilibrium relations \(\mu N = \beta S^* I^* + \mu S^*\) and \(\beta S^* I^* = (\gamma + \mu)I^*\), we obtain after careful algebra:

\[
\dot{V} = \mu S^*\left(2 - \frac{S^*}{S} - \frac{S}{S^*}\right) + \beta S^* I^*\left(3 - \frac{S^*}{S} - \frac{SI}{S^* I^*} \cdot \frac{I^*}{I} - \frac{I}{I^*} \cdot \frac{S^*}{S}\right).
\]
By the arithmetic-geometric mean inequality, \(2 - a - 1/a \leq 0\) for \(a > 0\) with equality iff \(a = 1\), and similarly \(3 - x - y - z \leq 0\) when \(xyz = 1\) and \(x, y, z > 0\). Both terms are therefore nonpositive, so \(\dot{V} \leq 0\). Equality holds only at \((S, I) = (S^*, I^*)\). By LaSalle's invariance principle, the endemic equilibrium is globally asymptotically stable. \(\square\)
</div>

This Lyapunov function approach, based on the Volterra-type function \(x - x^* \ln x\), has become a standard technique in mathematical epidemiology and has been extended to a wide variety of compartmental models.

<div class="remark">
<strong>Remark 4.8.</strong> The key inequality used in the proof — that the arithmetic mean exceeds the geometric mean — is the reason why Volterra-type Lyapunov functions work so broadly in compartmental models. The structure of compartmental systems ensures that the time derivative of the Lyapunov function decomposes into terms of the form \(n - \sum x_i\) subject to \(\prod x_i = 1\), each of which is nonpositive by the AM-GM inequality. This remarkable alignment between the algebraic structure of the AM-GM inequality and the dynamical structure of compartmental systems was recognized by Korobeinikov and has since been exploited systematically by many authors.
</div>

<div class="example">
<strong>Example 4.9.</strong> For the SIR model with demographics and \(\mathcal{R}_0 = 3\), the endemic equilibrium is at \(S^* = N/3\) and \(I^* = 2\mu N/(3(\gamma+\mu))\). The Korobeinikov Lyapunov function \(V = (S - S^* - S^*\ln(S/S^*)) + (I - I^* - I^*\ln(I/I^*))\) is a sum of two "bowl-shaped" functions, each minimized at its respective equilibrium value. Trajectories starting from any initial condition with \(S > 0\) and \(I > 0\) must eventually reach the endemic equilibrium — there can be no periodic orbits, no chaos, no persistent oscillations. This strong global result contrasts with the more complex dynamics possible in higher-dimensional models (SEIR, multi-strain, etc.).
</div>

### 4.5 Bifurcations at \(\mathcal{R}_0 = 1\)

The transition from disease-free to endemic behavior as \(\mathcal{R}_0\) crosses 1 is a bifurcation. In the simplest models, this is a forward (transcritical) bifurcation: the endemic equilibrium emerges smoothly from the DFE at \(\mathcal{R}_0 = 1\) and is stable for \(\mathcal{R}_0 > 1\).

<div class="definition">
<strong>Definition 4.8 (Forward Bifurcation).</strong> A <em>forward</em> (or <em>transcritical</em>) <em>bifurcation</em> at \(\mathcal{R}_0 = 1\) occurs when the endemic equilibrium branch emerges with a positive infected component for \(\mathcal{R}_0\) slightly greater than 1, and the DFE exchanges stability with the EE at the bifurcation point.
</div>

<div class="definition">
<strong>Definition 4.9 (Backward Bifurcation).</strong> A <em>backward bifurcation</em> at \(\mathcal{R}_0 = 1\) occurs when a branch of endemic equilibria exists for \(\mathcal{R}_0\) values slightly less than 1. In this case, there is an interval \(\mathcal{R}_c < \mathcal{R}_0 < 1\) in which the DFE and a stable endemic equilibrium coexist (bistability), separated by an unstable endemic equilibrium.
</div>

Backward bifurcation has profound implications for disease control. In models exhibiting backward bifurcation, reducing \(\mathcal{R}_0\) below 1 is necessary but not sufficient for disease eradication: the disease can persist at the stable endemic equilibrium even though \(\mathcal{R}_0 < 1\). To achieve eradication, one must reduce \(\mathcal{R}_0\) below the critical value \(\mathcal{R}_c < 1\), or reduce the infected population below the unstable equilibrium.

<div class="example">
<strong>Example 4.10.</strong> Backward bifurcation can arise in models with imperfect vaccination. Suppose a fraction \(p\) of the population is vaccinated with a vaccine that reduces susceptibility by a factor \(\sigma \in (0,1)\) but does not eliminate it. A vaccinated individual who becomes infected may have a different transmission rate. Under certain parameter conditions, the interplay between vaccination and residual susceptibility produces a backward bifurcation, so that the disease cannot be eliminated simply by pushing \(\mathcal{R}_0\) below 1.
</div>

<div class="remark">
<strong>Remark 4.13.</strong> The distinction between forward and backward bifurcation has a clear geometric interpretation. In a forward bifurcation, the bifurcation diagram (endemic infected level \(I^*\) versus \(\mathcal{R}_0\)) shows the endemic branch emerging to the right of \(\mathcal{R}_0 = 1\). In a backward bifurcation, the branch bends back to the left, creating an S-shaped curve with a fold point at some \(\mathcal{R}_0 = \mathcal{R}_c < 1\). The intermediate unstable branch (between \(\mathcal{R}_c\) and 1) separates the basins of attraction of the DFE and the upper stable endemic equilibrium. From a public health perspective, backward bifurcation means that "the last mile" of disease control is harder than expected: once the disease is established at the upper endemic level, merely reducing \(\mathcal{R}_0\) below 1 may not suffice for eradication.
</div>

### 4.6 Hopf Bifurcations and Oscillatory Dynamics

Many infectious diseases exhibit periodic outbreaks: measles epidemics occur on a roughly biennial cycle, while pertussis (whooping cough) has a 3-4 year cycle. Can compartmental models explain such oscillations?

In the simplest SIR model with demographics, the endemic equilibrium is a globally stable node or spiral, and sustained oscillations do not occur (though damped oscillations toward the equilibrium are observed). However, more complex models can exhibit Hopf bifurcations, leading to stable limit cycles and sustained periodic behavior.

<div class="theorem">
<strong>Theorem 4.11 (Hopf Bifurcation Theorem).</strong> Consider a system \(\dot{x} = f(x; \mu)\) depending on a parameter \(\mu\), with an equilibrium \(x^*(\mu)\). Suppose that at \(\mu = \mu_0\):
<ol>
<li>The Jacobian \(Df(x^*(\mu_0); \mu_0)\) has a pair of purely imaginary eigenvalues \(\lambda = \pm i\omega_0\) with \(\omega_0 > 0\), and all other eigenvalues have nonzero real part.</li>
<li>The transversality condition holds: \(\frac{d}{d\mu}\operatorname{Re}(\lambda(\mu))\big|_{\mu=\mu_0} \neq 0\).</li>
</ol>
Then a family of periodic orbits bifurcates from the equilibrium at \(\mu = \mu_0\). If the first Lyapunov coefficient is negative, the bifurcation is supercritical and the periodic orbits are stable.
</div>

<div class="example">
<strong>Example 4.12.</strong> The SEIR model with demographics can exhibit Hopf bifurcation. Consider the rescaled SEIR system with standard incidence and parameters \(\beta\), \(\sigma\), \(\gamma\), \(\mu\). As \(\beta\) increases (or equivalently, as \(\mathcal{R}_0\) increases), the endemic equilibrium can undergo a Hopf bifurcation. For biologically realistic parameter values (e.g., childhood diseases with long mean infectious periods relative to the latent period), the eigenvalues at the endemic equilibrium are complex with negative real part, producing damped oscillations. For diseases with seasonally varying transmission rates \(\beta(t) = \beta_0(1 + \alpha\cos(2\pi t))\), the periodic forcing can interact with these intrinsic oscillations to produce complex dynamics including period-doubling cascades and chaos.
</div>

---

## Chapter 5: Age-Structured Models

The ODE compartmental models studied in previous chapters treat all individuals within each disease class as interchangeable. In this chapter, we introduce age structure into both demographic and epidemic models, reflecting the biological reality that disease risk, contact patterns, and immune status all vary with age. The mathematical framework shifts from systems of ODEs to partial differential equations (PDEs) and integral operators.

### 5.1 The McKendrick-von Foerster Equation

The compartmental ODE models of the preceding chapters treat all individuals within a compartment as identical. In reality, both demographic and epidemiological rates vary strongly with age: children and the elderly face different infection risks, disease severity varies with age, and vaccination programs often target specific age groups. Age-structured models provide the mathematical framework for incorporating these effects.

<div class="definition">
<strong>Definition 5.1 (McKendrick-von Foerster Equation).</strong> Let \(n(a, t)\) denote the density of individuals of age \(a\) at time \(t\). The <em>McKendrick-von Foerster equation</em> is the first-order hyperbolic PDE

\[
\frac{\partial n}{\partial t} + \frac{\partial n}{\partial a} = -\mu(a) n(a, t),
\]
with boundary condition

\[
n(0, t) = \int_0^\infty \beta_b(a) n(a, t) \, da,
\]
where \(\mu(a)\) is the age-specific death rate and \(\beta_b(a)\) is the age-specific birth rate.
</div>

The McKendrick-von Foerster equation is the fundamental equation of age-structured population dynamics. The left-hand side represents the aging process: both \(t\) and \(a\) increase together along characteristics. The right-hand side represents mortality, and the boundary condition represents the influx of newborns.

The McKendrick-von Foerster equation has a beautiful geometric interpretation. The operator \(\partial/\partial t + \partial/\partial a\) is the directional derivative along the lines \(a = t + \text{const}\) in the \((t, a)\)-plane. These are the characteristic curves of the PDE, and they represent the aging trajectories of individuals: an individual born at time \(t_0\) has age \(a = t - t_0\) at time \(t\), so the point \((t, a)\) moves along the line \(a - t = -t_0\). Along a characteristic, the equation reduces to

\[
\frac{dn}{dt} = -\mu(a) n,
\]
giving the survival law: an individual born at time \(t_0\) and alive at age \(a\) has survived with probability

\[
\ell(a) = \exp\left(-\int_0^a \mu(s)\, ds\right),
\]
the survivorship function.

<div class="example">
<strong>Example 5.2.</strong> If the death rate is age-independent, \(\mu(a) = \mu\), then \(\ell(a) = e^{-\mu a}\) and the mean lifespan is \(\int_0^\infty \ell(a)\,da = 1/\mu\). The stable age distribution is \(n^*(a) = C e^{-(\mu + r)a}\), where \(r\) is the intrinsic growth rate determined by the Euler-Lotka equation (see below).
</div>

<div class="theorem">
<strong>Theorem 5.3 (Euler-Lotka Equation).</strong> The intrinsic growth rate \(r\) of a population governed by the McKendrick-von Foerster equation satisfies

\[
1 = \int_0^\infty \beta_b(a) \ell(a) e^{-ra} \, da.
\]
This equation has a unique real root \(r\) (the Malthusian parameter), and the population grows exponentially at rate \(r\) as \(t \to \infty\), with stable age distribution proportional to \(\ell(a) e^{-ra}\).
</div>

The Euler-Lotka equation is the demographic analogue of the characteristic equation for a linear ODE: just as the eigenvalues of a matrix determine the long-term growth of a linear system, the Malthusian parameter \(r\) determines the long-term growth of an age-structured population. The stable age distribution \(\ell(a)e^{-ra}\) is the demographic analogue of an eigenvector.

<div class="example">
<strong>Example 5.4.</strong> In a population with constant birth rate \(\beta_b(a) = b\) for \(a \in [15, 45]\) and zero otherwise, and constant death rate \(\mu\), the Euler-Lotka equation becomes \(1 = b \int_{15}^{45} e^{-(\mu+r)a}\,da = \frac{b}{\mu+r}(e^{-15(\mu+r)} - e^{-45(\mu+r)})\). With \(b = 0.1\) and \(\mu = 0.02\), this transcendental equation can be solved numerically to find \(r \approx 0.012\), corresponding to a population doubling time of about 58 years. The net reproduction number is \(R_0 = b \int_{15}^{45} e^{-\mu a}\,da \approx 2.06\), confirming that the population is growing.
</div>

### 5.2 Age-Structured Epidemic Models

To incorporate age into epidemic models, we introduce age-specific compartments. Let \(s(a, t)\), \(i(a, t)\), and \(r(a, t)\) denote the densities of susceptible, infected, and recovered individuals of age \(a\) at time \(t\).

<div class="definition">
<strong>Definition 5.4 (Age-Structured SIR Model).</strong> The <em>age-structured SIR model</em> is

\[
\left(\frac{\partial}{\partial t} + \frac{\partial}{\partial a}\right) s(a,t) = -\lambda(a,t) s(a,t) - \mu(a) s(a,t),
\]

\[
\left(\frac{\partial}{\partial t} + \frac{\partial}{\partial a}\right) i(a,t) = \lambda(a,t) s(a,t) - \gamma(a) i(a,t) - \mu(a) i(a,t),
\]

\[
\left(\frac{\partial}{\partial t} + \frac{\partial}{\partial a}\right) r(a,t) = \gamma(a) i(a,t) - \mu(a) r(a,t),
\]
where the <em>force of infection</em> is

\[
\lambda(a, t) = \int_0^\infty \beta(a, a') i(a', t) \, da'.
\]
Here \(\beta(a, a')\) is the transmission kernel giving the rate at which an infected individual of age \(a'\) transmits to a susceptible of age \(a\).
</div>

The transmission kernel \(\beta(a, a')\) encodes the age-dependent contact pattern. Empirical data on contact patterns (such as the POLYMOD study by Mossong et al., 2008) reveal that contacts are strongly age-assortative: school-age children have frequent contacts with other children, adults contact other adults in the workplace, and intergenerational contacts occur primarily within households. The WAIFW (Who Acquires Infection From Whom) matrix, a discrete approximation to \(\beta(a, a')\), is a central object in practical applications of age-structured models.

<div class="remark">
<strong>Remark 5.6.</strong> The force of infection \(\lambda(a, t) = \int_0^\infty \beta(a, a') i(a', t)\,da'\) is the age-specific hazard rate of infection. It depends on the full age profile of infection in the population, coupling the PDEs across all age classes. This integral coupling is what makes age-structured models analytically challenging compared to ODE compartmental models, but it is essential for realistic modeling of diseases where age plays a major role in transmission (childhood diseases, sexually transmitted infections, etc.).
</div>

### 5.3 The Next-Generation Operator and \(\mathcal{R}_0\)

For age-structured models, the basic reproduction number can no longer be computed as a simple ratio of parameters. Instead, it is defined as the spectral radius of an integral operator: the next-generation operator.

<div class="definition">
<strong>Definition 5.5 (Next-Generation Operator).</strong> The <em>next-generation operator</em> \(K\) is the linear operator on \(L^1[0,\infty)\) defined by

\[
(K\phi)(a) = \int_0^\infty K(a, a') \phi(a') \, da',
\]
where the kernel is

\[
K(a, a') = \frac{s^*(a')}{\ell(a')} \int_0^\infty \beta(a, a'+\tau) \frac{\ell(a'+\tau)}{\ell(a')} e^{-\int_0^\tau \gamma(a'+\sigma)\,d\sigma} \, d\tau.
\]
Here \(s^*(a)\) is the susceptible density at the disease-free steady state, and the integral accounts for all the infections caused by an individual infected at age \(a'\) during their remaining infectious life.
</div>

<div class="theorem">
<strong>Theorem 5.6 (Diekmann-Heesterbeek-Metz, 1990).</strong> The basic reproduction number of the age-structured epidemic model is

\[
\mathcal{R}_0 = \rho(K),
\]
the spectral radius of the next-generation operator \(K\). The disease-free equilibrium is locally asymptotically stable if \(\mathcal{R}_0 < 1\) and unstable if \(\mathcal{R}_0 > 1\).
</div>

This result is a cornerstone of modern mathematical epidemiology. It provides a rigorous and general definition of \(\mathcal{R}_0\) that applies to models of arbitrary complexity, including age structure, spatial structure, and multiple host species. The definition reduces to the familiar ratio-of-parameters formula for simple ODE models. The power of the next-generation operator formulation is that it separates the computation of \(\mathcal{R}_0\) from the details of the model's dynamics: one need only identify the next-generation operator (which describes one "generation" of disease transmission) and compute its spectral radius.

<div class="remark">
<strong>Remark 5.7.</strong> For finite-dimensional (ODE) models, the next-generation operator reduces to the next-generation matrix \(K = FV^{-1}\) introduced by van den Driessche and Watmough (2002), where \(F\) is the matrix of new infection terms and \(V\) is the matrix of transition terms. The reproduction number is then \(\mathcal{R}_0 = \rho(FV^{-1})\), the spectral radius of this matrix.
</div>

### 5.4 The Characteristic Equation

For the age-structured SIR model at the disease-free equilibrium, the linearized dynamics lead to a renewal equation, and the stability is determined by a characteristic equation.

<div class="theorem">
<strong>Theorem 5.8 (Characteristic Equation).</strong> The growth rate \(\lambda\) of perturbations from the DFE satisfies the characteristic equation

\[
1 = \int_0^\infty \int_0^\infty \beta(a, a') s^*(a') \frac{\ell(a'+\tau)}{\ell(a')} e^{-\lambda \tau} e^{-\int_0^\tau \gamma(a'+\sigma)\,d\sigma} \, d\tau \, da.
\]
The DFE is stable if and only if all solutions \(\lambda\) have negative real part. At \(\mathcal{R}_0 = 1\), there is a solution \(\lambda = 0\).
</div>

<div class="example">
<strong>Example 5.9.</strong> For the simplest case with age-independent parameters (\(\beta(a,a') = \beta\), \(\gamma(a) = \gamma\), \(\mu(a) = \mu\)), the next-generation operator kernel simplifies to \(K(a,a') = \beta N e^{-(\gamma+\mu)\tau}\) integrated over \(\tau\), giving \(\mathcal{R}_0 = \beta N / (\gamma + \mu)\), recovering the ODE result. The characteristic equation reduces to \(1 = \beta N / (\lambda + \gamma + \mu)\), giving \(\lambda = \beta N - \gamma - \mu = (\gamma+\mu)(\mathcal{R}_0 - 1)\), consistent with the eigenvalue analysis of the ODE model.
</div>

<div class="example">
<strong>Example 5.10.</strong> Suppose the population has two age groups: children (ages 0-15) and adults (ages 15+), with a WAIFW (Who Acquires Infection From Whom) matrix

\[
\beta = \begin{pmatrix} \beta_{cc} & \beta_{ca} \\ \beta_{ac} & \beta_{aa} \end{pmatrix},
\]
where \(\beta_{ij}\) is the transmission rate from group \(j\) to group \(i\). The next-generation matrix is \(K = \begin{pmatrix} \beta_{cc}N_c/\gamma & \beta_{ca}N_a/\gamma \\ \beta_{ac}N_c/\gamma & \beta_{aa}N_a/\gamma \end{pmatrix}\) (with equal recovery rates for simplicity), and \(\mathcal{R}_0 = \rho(K)\), the largest eigenvalue of this \(2 \times 2\) matrix. The age-assortative structure of contacts implies \(\beta_{cc}\) and \(\beta_{aa}\) are typically larger than the off-diagonal entries.
</div>

---

## Chapter 6: Spatial Spread and Traveling Waves

All of the models considered so far have been spatially homogeneous: they assume that all individuals in the population mix uniformly, with no spatial structure. In this chapter, we relax this assumption and study the spatial spread of infectious diseases, using both continuum (reaction-diffusion PDE) and discrete (network, metapopulation) approaches.

### 6.1 Reaction-Diffusion Models

The models studied so far assume spatial homogeneity: all individuals interact in a single well-mixed population. In reality, diseases spread geographically, and the spatial dynamics of this spread are of great interest both theoretically and practically. The simplest approach to incorporating spatial spread is through reaction-diffusion equations.

<div class="definition">
<strong>Definition 6.1 (Reaction-Diffusion SIR Model).</strong> The <em>reaction-diffusion SIR model</em> is

\[
\frac{\partial S}{\partial t} = D_S \nabla^2 S - \beta SI, \qquad \frac{\partial I}{\partial t} = D_I \nabla^2 I + \beta SI - \gamma I, \qquad \frac{\partial R}{\partial t} = D_R \nabla^2 R + \gamma I,
\]
where \(D_S, D_I, D_R \geq 0\) are diffusion coefficients representing the random spatial movement of individuals, and \(\nabla^2\) is the Laplacian operator.
</div>

In many settings, it is reasonable to assume that infected individuals have reduced mobility compared to susceptibles (due to illness), or even that \(D_I = 0\) (infected individuals are immobile). However, the basic spatial spread phenomena can be captured with uniform diffusion.

The diffusion coefficients can be estimated from movement data. For human diseases in an urban setting, effective diffusion coefficients can be estimated from commuting data or travel surveys. For wildlife diseases, mark-recapture data or GPS tracking provide estimates of animal movement patterns that can be translated into diffusion coefficients.

<div class="remark">
<strong>Remark 6.2.</strong> The reaction-diffusion framework assumes that spatial movement is a random walk (Brownian motion at the population level), which is a reasonable approximation for many animal populations but less accurate for human movement, which tends to be directed (home-work commutes) and long-range (air travel). For human diseases, network-based or metapopulation models (see Sections 6.4 and 6.5) often provide more realistic spatial descriptions. Nevertheless, reaction-diffusion models remain valuable for their analytical tractability and for understanding the fundamental mechanisms of spatial spread.
</div>

### 6.2 The Fisher-KPP Equation

Before analyzing the full spatial SIR model, we study a simpler equation that captures the essential mechanism of spatial invasion: the Fisher-KPP (Fisher-Kolmogorov-Petrovsky-Piskunov) equation.

<div class="definition">
<strong>Definition 6.2 (Fisher-KPP Equation).</strong> The <em>Fisher-KPP equation</em> is

\[
\frac{\partial u}{\partial t} = D \frac{\partial^2 u}{\partial x^2} + f(u),
\]
where \(f(0) = f(1) = 0\), \(f(u) > 0\) for \(u \in (0,1)\), \(f'(0) > 0\), and \(f(u) \leq f'(0)u\) for \(u \in [0,1]\). The classical choice is \(f(u) = ru(1-u)\).
</div>

This equation models the spatial spread of a population (or a trait, or an infection front) combining local diffusion with logistic-type growth. The key question is: does the equation admit traveling wave solutions, and if so, what is the wave speed?

<div class="definition">
<strong>Definition 6.3 (Traveling Wave).</strong> A <em>traveling wave solution</em> is a solution of the form \(u(x,t) = U(\xi)\) where \(\xi = x - ct\) is the traveling wave coordinate and \(c\) is the wave speed. The profile \(U\) satisfies the ODE

\[
D U'' + c U' + f(U) = 0,
\]
with boundary conditions \(U(-\infty) = 1\) and \(U(+\infty) = 0\) (for a wave propagating to the right).
</div>

<div class="theorem">
<strong>Theorem 6.4 (Kolmogorov-Petrovsky-Piskunov, 1937; Fisher, 1937).</strong> For the Fisher-KPP equation with \(f(u) = ru(1-u)\):
<ol>
<li>Traveling wave solutions exist for all speeds \(c \geq c^* = 2\sqrt{Dr}\).</li>
<li>No traveling wave exists for \(c < c^*\).</li>
<li>For compactly supported initial data with \(u(x,0) \in [0,1]\), the solution approaches the traveling wave with the minimum speed \(c^*\) as \(t \to \infty\).</li>
</ol>
The minimum wave speed \(c^* = 2\sqrt{Dr}\) is determined by the linearization at the leading edge of the wave front.
</div>

<div class="proof">
<strong>Proof.</strong> (Sketch of the existence argument.) The traveling wave ODE \(DU'' + cU' + rU(1-U) = 0\) can be written as the planar system

\[
U' = V, \qquad V' = -\frac{c}{D}V - \frac{r}{D}U(1-U).
\]
The equilibria are \((U,V) = (0,0)\) and \((U,V) = (1,0)\). At \((0,0)\), the eigenvalues are \(\lambda = \frac{1}{2D}(-c \pm \sqrt{c^2 - 4Dr})\). For \(c \geq 2\sqrt{Dr}\), both eigenvalues are real and negative, and \((0,0)\) is a stable node. For \(c < 2\sqrt{Dr}\), the eigenvalues are complex with negative real part, making \((0,0)\) a stable spiral. Since the wave profile \(U\) must satisfy \(U \geq 0\), an oscillatory approach to 0 is impossible (it would produce negative values of \(U\)). Thus only \(c \geq c^* = 2\sqrt{Dr}\) yields admissible traveling waves.

At \((1,0)\), one eigenvalue is positive and one is negative (a saddle point for all \(c > 0\)). The traveling wave corresponds to the unique trajectory (heteroclinic connection) leaving the saddle \((1,0)\) and entering the stable node \((0,0)\). A phase plane argument using the Wazewski principle or a shooting method establishes existence for all \(c \geq c^*\). \(\square\)
</div>

The minimum wave speed result has a beautiful interpretation: the spatial spread of an epidemic (or an invading population) proceeds at a speed determined by the diffusion rate and the growth rate at the leading edge, where the invader is rare.

<div class="example">
<strong>Example 6.5.</strong> For the Fisher-KPP equation with \(D = 1\) km\(^2\)/day and \(r = 0.5\) day\(^{-1}\), the minimum wave speed is \(c^* = 2\sqrt{1 \times 0.5} = \sqrt{2} \approx 1.41\) km/day. The wave profile connects \(U = 1\) (fully invaded region behind the front) to \(U = 0\) (uninvaded region ahead). The width of the transition zone is of order \(\sqrt{D/r} = \sqrt{2}\) km. Steeper fronts (narrower transition zones) propagate faster, but cannot propagate below the minimum speed \(c^*\).
</div>

### 6.3 Traveling Waves for the Spatial SIR Model

The full reaction-diffusion SIR model admits traveling wave solutions representing the spatial advance of an epidemic.

<div class="theorem">
<strong>Theorem 6.5.</strong> Consider the one-dimensional reaction-diffusion SIR model with equal diffusion coefficients \(D_S = D_I = D\) and \(S \to N\) ahead of the wave. Traveling wave solutions connecting the disease-free state ahead of the wave to a post-epidemic state behind the wave exist for wave speeds \(c \geq c^*\), where

\[
c^* = 2\sqrt{D(\beta N - \gamma)} = 2\sqrt{D\gamma(\mathcal{R}_0 - 1)},
\]
provided \(\mathcal{R}_0 > 1\). No traveling wave exists for \(c < c^*\).
</div>

This result shows that the minimum speed of an epidemic wave increases with the diffusion coefficient (faster individual movement), the transmission rate, and \(\mathcal{R}_0\). It provides a quantitative prediction for the speed at which an epidemic front advances through a susceptible population. The formula is directly analogous to the Fisher-KPP minimum wave speed, with the linearized growth rate \(r\) replaced by the epidemic growth rate \(\beta N - \gamma = \gamma(\mathcal{R}_0 - 1)\).

Behind the epidemic wave front, the population transitions from the pre-epidemic state \((S, I) \approx (N, 0)\) to the post-epidemic state \((S, I) = (S_\infty, 0)\), where \(S_\infty\) is determined by the final size relation. The wave profile of \(I\) is a pulse: it rises from zero ahead of the front, peaks at the wave crest, and decays back to zero behind the front (as the local epidemic burns through the available susceptibles).

<div class="example">
<strong>Example 6.6.</strong> Consider the spread of rabies in a fox population across Europe, which was studied extensively using reaction-diffusion models. With parameters \(D \approx 200\) km\(^2\)/yr, \(\beta N \approx 70\) yr\(^{-1}\), and \(\gamma \approx 50\) yr\(^{-1}\) (so \(\mathcal{R}_0 = 1.4\)), the minimum wave speed is \(c^* = 2\sqrt{200 \times 20} = 2\sqrt{4000} \approx 126\) km/yr. This is consistent with the observed spread of the rabies epizootic across Europe at roughly 30-60 km/yr (the discrepancy reflecting the simplifications of the model, including the assumption of isotropic diffusion in a homogeneous landscape).
</div>

### 6.4 Network Epidemic Models

In human populations, disease transmission occurs through social contact networks rather than through spatial diffusion. Network epidemic models describe disease spread on graphs, where nodes represent individuals and edges represent contacts along which transmission can occur.

<div class="definition">
<strong>Definition 6.7 (SIR on a Network).</strong> Let \(G = (V, E)\) be a graph with \(|V| = N\) nodes. Each node is in state S, I, or R. An infected node transmits to each susceptible neighbor independently at rate \(\beta\), and recovers at rate \(\gamma\). The pair approximation for the proportion infected in a configuration-model random graph with degree distribution \(p_k\) gives, in the early phase:

\[
\mathcal{R}_0 = \frac{\beta}{\gamma} \cdot \frac{\langle k^2 \rangle - \langle k \rangle}{\langle k \rangle},
\]
where \(\langle k \rangle\) and \(\langle k^2 \rangle\) are the mean and second moment of the degree distribution.
</div>

The formula \(\mathcal{R}_0 = (\beta/\gamma)(\langle k^2 \rangle - \langle k \rangle)/\langle k \rangle\) reveals a fundamental insight: the heterogeneity of the contact network, as measured by the ratio \(\langle k^2 \rangle / \langle k \rangle\), amplifies transmission. For scale-free networks with power-law degree distributions \(p_k \sim k^{-\alpha}\) with \(2 < \alpha \leq 3\), the second moment \(\langle k^2 \rangle\) diverges, implying that \(\mathcal{R}_0 \to \infty\) in the limit of large networks. This means that scale-free networks have no epidemic threshold: any disease with \(\beta > 0\) can spread.

<div class="example">
<strong>Example 6.8.</strong> Consider a random network with Poisson degree distribution (Erdos-Renyi graph) with mean degree \(\langle k \rangle = 10\). Since for a Poisson distribution \(\langle k^2 \rangle = \langle k \rangle^2 + \langle k \rangle = 110\), we have \(\mathcal{R}_0 = (\beta/\gamma)(110 - 10)/10 = 10\beta/\gamma\). Now consider a scale-free network with the same mean degree but \(\langle k^2 \rangle = 500\) (heavy-tailed degree distribution). Then \(\mathcal{R}_0 = (\beta/\gamma)(490)/10 = 49\beta/\gamma\), nearly five times larger. The high-degree "superspreader" nodes in the scale-free network dramatically enhance transmission, even though the average connectivity is the same.
</div>

### 6.5 Metapopulation Models

Between the extremes of well-mixed ODE models and fully spatial PDE models lie metapopulation models, in which the population is divided into discrete patches connected by movement.

<div class="definition">
<strong>Definition 6.8 (Metapopulation SIR Model).</strong> Consider \(n\) patches, each with its own SIR dynamics. The <em>metapopulation model</em> is

\[
\frac{dS_i}{dt} = -\beta_i S_i I_i + \sum_{j=1}^n m_{ij} S_j - \left(\sum_{j=1}^n m_{ji}\right) S_i,
\]

\[
\frac{dI_i}{dt} = \beta_i S_i I_i - \gamma_i I_i + \sum_{j=1}^n m_{ij} I_j - \left(\sum_{j=1}^n m_{ji}\right) I_i,
\]
where \(m_{ij} \geq 0\) is the migration rate from patch \(j\) to patch \(i\).
</div>

<div class="remark">
<strong>Remark 6.9.</strong> The metapopulation framework is particularly useful for modeling disease spread between cities, countries, or other geographically separated populations. The global airline network, with cities as nodes and passenger flows as migration rates, has been used extensively in metapopulation models to forecast the international spread of emerging infectious diseases such as pandemic influenza, SARS, and COVID-19.
</div>

---

## Chapter 7: Stochastic Epidemic Models

The deterministic models of the preceding chapters describe the average behavior of an epidemic. In this chapter, we confront the reality that disease transmission is inherently stochastic: each infection event is the result of a chance encounter between a specific susceptible and a specific infected individual. Stochastic models capture the randomness in transmission, leading to probability distributions over epidemic outcomes rather than single deterministic trajectories. The stochastic perspective is essential for understanding the early and late phases of epidemics, where random fluctuations dominate.

### 7.1 Motivation for Stochasticity

The deterministic ODE models studied in previous chapters are continuous approximations to what is fundamentally a discrete, random process. Each transmission event is a chance encounter between a specific susceptible individual and a specific infected individual. When population sizes are large, the law of large numbers ensures that the deterministic approximation is accurate. However, stochastic effects become important in several situations: when the number of infected individuals is small (as at the beginning or end of an epidemic), when the total population is small, or when we wish to assess the variability in epidemic outcomes.

<div class="remark">
<strong>Remark 7.1.</strong> The most dramatic consequence of stochasticity is that even when \(\mathcal{R}_0 > 1\), an epidemic is not guaranteed. A small number of initial infectives may recover before transmitting to anyone, leading to a "minor outbreak" rather than a major epidemic. The probability of such stochastic extinction near the DFE is nonzero and can be calculated using branching process theory.
</div>

### 7.2 The Stochastic SIR Model

The transition from deterministic to stochastic modeling requires a fundamental shift in perspective. Instead of tracking the exact numbers \(S(t)\) and \(I(t)\) as continuous variables, we model them as integer-valued random variables whose evolution is governed by probabilistic rules. The appropriate mathematical framework is that of continuous-time Markov chains.

<div class="definition">
<strong>Definition 7.2 (Stochastic SIR Model).</strong> The <em>stochastic SIR model</em> is a continuous-time Markov chain (CTMC) on the state space \(\{(s,i) : s, i \geq 0, s + i \leq N\}\), with transition rates:
<ul>
<li>Infection: \((s, i) \to (s-1, i+1)\) at rate \(\beta s i\).</li>
<li>Recovery: \((s, i) \to (s, i-1)\) at rate \(\gamma i\).</li>
</ul>
</div>

The stochastic SIR model is a pure jump process. Unlike the deterministic model, different realizations of the process produce different epidemic trajectories. The state space is finite (since \(s + i \leq N\)), so the process is a finite-state continuous-time Markov chain. The state \((s, 0)\) (for any \(s\)) is absorbing: once all infected individuals have recovered, no further infections can occur. This means the process always terminates in finite time, unlike the deterministic model which approaches its limit only asymptotically. The model is analytically tractable in certain limits, and can always be simulated exactly using the Gillespie algorithm.

### 7.3 Probability of a Major Epidemic

The most important question about the stochastic SIR model is: given a small number of initial infectives in a large susceptible population, what is the probability that a major epidemic occurs?

<div class="theorem">
<strong>Theorem 7.3 (Branching Process Approximation).</strong> In the early phase of an epidemic in a large population (\(S \approx N\)), the stochastic SIR model is well approximated by a branching process in which each infected individual independently produces a Poisson-distributed number of secondary infections with mean \(\mathcal{R}_0 = \beta N / \gamma\). The probability that the infection starting from a single infective leads to a major epidemic is:
<ul>
<li>0 if \(\mathcal{R}_0 \leq 1\),</li>
<li>\(1 - 1/\mathcal{R}_0\) (approximately) if \(\mathcal{R}_0 > 1\), more precisely the unique solution in \((0,1)\) of \(q = e^{-\mathcal{R}_0(1-q)}\) gives the extinction probability \(q\), and the major epidemic probability is \(1-q\).</li>
</ul>
If there are \(I_0\) initial infectives, the probability of a major epidemic is approximately \(1 - q^{I_0}\).
</div>

<div class="proof">
<strong>Proof.</strong> When \(S \approx N\), each infected individual transmits at rate \(\beta N\) and recovers at rate \(\gamma\), so the infection process of each individual is approximately independent. Each infective produces secondary cases as a Poisson process at rate \(\beta N\), stopped after an exponential time of rate \(\gamma\). The total number of secondary cases has a geometric distribution with mean \(\mathcal{R}_0 = \beta N / \gamma\).

The extinction probability \(q\) of a branching process with offspring distribution \(Z\) satisfies \(q = G_Z(q)\), where \(G_Z\) is the probability generating function (pgf). For a geometric offspring distribution with parameter \(p = \gamma/(\beta N + \gamma)\) and mean \(\mathcal{R}_0\), the pgf is \(G_Z(s) = \gamma / (\beta N + \gamma - \beta N s) = 1/(\mathcal{R}_0(1-s) + 1)\). Setting \(q = G_Z(q)\) and solving gives the smallest nonnegative root. For \(\mathcal{R}_0 > 1\), this root satisfies \(q < 1\), and the major epidemic probability is \(1 - q\). For the Poisson offspring approximation, \(q = e^{-\mathcal{R}_0(1-q)}\), which is exactly the final size relation viewed from a different angle. \(\square\)
</div>

<div class="example">
<strong>Example 7.4.</strong> Suppose \(\mathcal{R}_0 = 2\) and one infected individual is introduced. The extinction probability is the solution of \(q = G_Z(q)\). With a geometric offspring distribution (mean 2), one solves to find \(q = 1/\mathcal{R}_0 = 0.5\), so the probability of a major epidemic is 50\%. With 5 initial infectives, the probability of a major epidemic is \(1 - 0.5^5 = 96.875\%\). This illustrates the superspreading principle: even moderately transmissible diseases are almost certain to cause major epidemics if multiple infectives are present.
</div>

### 7.4 Bartlett's Fadeout and Persistence

In finite populations, stochastic fluctuations can drive the infected population to zero even when \(\mathcal{R}_0 > 1\). This phenomenon, known as Bartlett's fadeout (or stochastic extinction), is the primary mechanism by which infectious diseases disappear from small populations.

<div class="definition">
<strong>Definition 7.5 (Critical Community Size).</strong> The <em>critical community size</em> (CCS) is the minimum population size needed for an infectious disease to persist without frequent fadeout and reintroduction. Below the CCS, the disease experiences frequent stochastic extinctions; above it, the disease persists endemically. For measles, the empirical CCS is approximately 250,000-500,000.
</div>

Bartlett (1957, 1960) observed that measles persisted continuously in large cities like London and New York but suffered repeated fadeouts in smaller cities, requiring reintroduction from larger population centers. The CCS depends on the disease parameters: diseases with higher \(\mathcal{R}_0\) and shorter infectious periods tend to have larger critical community sizes, because their inter-epidemic troughs are deeper (more susceptibles are depleted during an epidemic), making stochastic extinction more likely.

<div class="example">
<strong>Example 7.6.</strong> The critical community size for measles has been estimated empirically at approximately 250,000-500,000. Below this threshold, measles exhibits a pattern of "epidemic fadeout" followed by reintroduction: the disease arrives (often from a larger city), causes an epidemic that infects most susceptibles, then dies out as the susceptible pool is exhausted. Susceptibles slowly accumulate through births until the population is "ripe" for the next introduction. Above the CCS, the susceptible pool never drops low enough (or the stochastic fluctuations are small enough relative to the endemic level) for the disease to disappear, and measles persists as an endemic infection with periodic epidemic waves.
</div>

### 7.5 The Gillespie Algorithm

Exact simulation of the stochastic SIR model is straightforward using the Gillespie algorithm (also known as the stochastic simulation algorithm, SSA).

<div class="definition">
<strong>Definition 7.6 (Gillespie Algorithm for the Stochastic SIR Model).</strong> Given current state \((S, I)\) at time \(t\):
<ol>
<li>Compute the total rate: \(a_0 = \beta S I + \gamma I\).</li>
<li>If \(a_0 = 0\) or \(I = 0\), stop (absorbing state reached).</li>
<li>Draw the time to next event: \(\tau \sim \mathrm{Exp}(a_0)\), i.e., \(\tau = -\ln(u_1)/a_0\) where \(u_1 \sim \mathrm{Uniform}(0,1)\).</li>
<li>Update \(t \leftarrow t + \tau\).</li>
<li>Determine the event type: with probability \(\beta SI / a_0\) the event is an infection (\(S \to S-1\), \(I \to I+1\)); with probability \(\gamma I / a_0\) it is a recovery (\(I \to I-1\)).</li>
<li>Return to step 1.</li>
</ol>
</div>

The Gillespie algorithm generates exact sample paths of the continuous-time Markov chain. Each realization is a sequence of discrete events occurring at random times. The algorithm is computationally efficient for small to moderate population sizes but becomes expensive for very large populations, motivating approximate methods such as tau-leaping or hybrid deterministic-stochastic approaches.

<div class="remark">
<strong>Remark 7.8.</strong> The computational cost of the Gillespie algorithm scales with the total number of events, which is proportional to the population size \(N\) multiplied by the number of events per individual. For a major epidemic in a population of \(N = 10^6\), the algorithm must process on the order of \(10^6\) infection and recovery events, which is feasible on modern computers. However, for very large populations (\(N > 10^8\)), the tau-leaping approximation — which groups events occurring in short time intervals — offers significant speedup at the cost of a small approximation error.
</div>

<div class="example">
<strong>Example 7.7.</strong> Simulating the stochastic SIR model with \(N = 1000\), \(\beta = 0.001\), \(\gamma = 0.1\), and \(I(0) = 5\) (so \(\mathcal{R}_0 = 10\)) using the Gillespie algorithm produces an ensemble of epidemic trajectories. In repeated simulations, one observes that most trajectories produce major epidemics infecting the vast majority of the population, but a small fraction (approximately \(q^5\) where \(q \approx 0.1\) is the single-infective extinction probability) die out quickly. The trajectories that produce major epidemics cluster tightly around the deterministic SIR trajectory, confirming the law-of-large-numbers convergence for \(N\) large.
</div>

### 7.6 Quasi-Stationary Distributions

In the stochastic SIR model with demographics (births replenishing susceptibles), the state \(I = 0\) is absorbing: once the disease disappears, it cannot return without external reintroduction. However, before reaching this absorbing state, the process may spend a very long time fluctuating around the deterministic endemic equilibrium. The statistical distribution of the process conditioned on non-extinction is the quasi-stationary distribution.

<div class="definition">
<strong>Definition 7.8 (Quasi-Stationary Distribution).</strong> The <em>quasi-stationary distribution</em> (QSD) of a Markov chain with absorbing state is the limiting conditional distribution

\[
\pi_j = \lim_{t \to \infty} \Pr(X(t) = j \mid X(t) \neq 0),
\]
provided this limit exists. It describes the long-term behavior of the process conditioned on survival.
</div>

<div class="theorem">
<strong>Theorem 7.9.</strong> For the stochastic SIR model with demographics on a finite state space, the quasi-stationary distribution exists and is unique. The time to extinction from the QSD is approximately exponentially distributed with mean that grows exponentially with the population size \(N\) (when \(\mathcal{R}_0 > 1\)).
</div>

The exponential scaling of the mean extinction time with \(N\) explains why large populations can sustain endemic diseases almost indefinitely, while small populations experience frequent fadeouts. For the stochastic SIR model with demographics, the QSD is approximately Gaussian centered near the deterministic endemic equilibrium, with variance of order \(1/N\) (as predicted by the system-size expansion of van Kampen).

<div class="example">
<strong>Example 7.10.</strong> Consider measles in an isolated island population. For \(N = 10{,}000\) and \(\mathcal{R}_0 = 15\), the deterministic endemic equilibrium has \(I^* \approx 2\) infected individuals (since \(I^*/N = \mu(\mathcal{R}_0 - 1)/(\gamma + \mu)\) is very small when \(\mu \ll \gamma\)). With such a small endemic \(I^*\), stochastic fluctuations frequently drive \(I\) to zero, causing fadeout. The mean time between fadeouts may be only months to years. After fadeout, the susceptible population builds up through births until the disease is reintroduced (by a traveler from a larger population), triggering a new epidemic. This "epidemic-fadeout-reintroduction" cycle is characteristic of many island populations and was documented in detail for measles in Iceland and the Faroe Islands.
</div>

---

## Chapter 8: Population Dynamics

The final chapter of this course broadens our perspective from disease dynamics to the dynamics of populations themselves. Many of the mathematical tools we have developed — phase plane analysis, stability theory, bifurcation analysis — apply equally well to models of population growth, predator-prey interactions, and interspecific competition. Moreover, understanding population dynamics is essential background for epidemiology, since the host population provides the substrate on which disease transmission occurs.

### 8.1 Single-Species Models

We now turn from the dynamics of disease to the broader field of population dynamics, which provides both the demographic backdrop for epidemic models and a rich source of mathematical structures in its own right. We begin with single-species models.

<div class="definition">
<strong>Definition 8.1 (Logistic Equation).</strong> The <em>logistic equation</em>, introduced by Verhulst (1838), is

\[
\frac{dN}{dt} = rN\left(1 - \frac{N}{K}\right),
\]
where \(N(t)\) is the population size, \(r > 0\) is the intrinsic growth rate, and \(K > 0\) is the carrying capacity.
</div>

The logistic equation is the simplest model incorporating density dependence: the per-capita growth rate decreases linearly from \(r\) (at low density) to 0 (at carrying capacity). The solution is

\[
N(t) = \frac{K N_0}{N_0 + (K - N_0)e^{-rt}},
\]

a sigmoid curve approaching \(K\) as \(t \to \infty\). The equilibrium \(N = K\) is globally asymptotically stable (for \(N_0 > 0\)), and \(N = 0\) is unstable.

While the logistic equation is a useful starting point, many populations exhibit more complex density-dependent dynamics. A particularly important phenomenon is the Allee effect.

<div class="definition">
<strong>Definition 8.2 (Allee Effect).</strong> An <em>Allee effect</em> is a positive relationship between population density and per-capita growth rate at low densities. A <em>strong Allee effect</em> occurs when the per-capita growth rate is negative below a threshold density \(A > 0\), leading to a critical population size below which the population goes extinct. A model exhibiting a strong Allee effect is

\[
\frac{dN}{dt} = rN\left(\frac{N}{A} - 1\right)\left(1 - \frac{N}{K}\right),
\]
where \(0 < A < K\).
</div>

The Allee effect model has three equilibria: \(N = 0\) (stable), \(N = A\) (unstable threshold), and \(N = K\) (stable). Populations above \(A\) grow to \(K\); populations below \(A\) decline to extinction. This bistability has important implications for conservation biology (endangered species may be driven below the Allee threshold by habitat fragmentation) and for biological invasions (an invading species must establish a population above the threshold to persist).

The strong Allee effect creates a "tipping point" in population dynamics that is mathematically analogous to the backward bifurcation in epidemiology (Section 4.5): in both cases, the system has two stable states separated by an unstable threshold, and perturbations beyond the threshold lead to qualitatively different outcomes. The connection is not merely analogical — both phenomena arise from the same mathematical structure (a saddle-node bifurcation creating bistability).

<div class="example">
<strong>Example 8.3.</strong> The African wild dog (Lycaon pictus) is believed to exhibit a strong Allee effect: packs below a critical size of about 5 adults have significantly reduced hunting success and pup survival. A model with \(r = 0.3\), \(A = 5\), and \(K = 30\) predicts that a pack of 3 dogs will decline, while a pack of 7 will grow to the carrying capacity. This has direct implications for translocation and reintroduction strategies in conservation management.
</div>

### 8.2 Predator-Prey Models

The interaction between predators and their prey is one of the most fundamental ecological relationships, and its mathematical description has been a central topic in mathematical biology since the pioneering work of Lotka (1925) and Volterra (1926).

<div class="definition">
<strong>Definition 8.4 (Lotka-Volterra Predator-Prey Model).</strong> The classical <em>Lotka-Volterra predator-prey model</em> is

\[
\frac{dN}{dt} = rN - aNP, \qquad \frac{dP}{dt} = baNP - dP,
\]
where \(N\) is the prey population, \(P\) is the predator population, \(r\) is the prey growth rate, \(a\) is the predation rate, \(b\) is the conversion efficiency, and \(d\) is the predator death rate.
</div>

The Lotka-Volterra model has a unique coexistence equilibrium at \(N^* = d/(ba)\), \(P^* = r/a\), and a family of neutrally stable periodic orbits surrounding it. The system has a conserved quantity

\[
H(N, P) = baN - d\ln N + aP - r\ln P,
\]

and the trajectories are closed curves (level sets of \(H\)) in the \((N, P)\)-plane. The period of the oscillations depends on the initial conditions (larger orbits have longer periods), and the time-averaged population sizes satisfy \(\langle N \rangle = N^*\) and \(\langle P \rangle = P^*\), where the averages are taken over one complete cycle.

<div class="example">
<strong>Example 8.5.</strong> Consider a Lotka-Volterra system modeling lynx (predator, \(P\)) and snowshoe hare (prey, \(N\)) populations with \(r = 1.0\), \(a = 0.02\), \(b = 0.01\), \(d = 0.5\). The coexistence equilibrium is \(N^* = d/(ba) = 2500\) hares and \(P^* = r/a = 50\) lynx. The conserved quantity \(H\) determines a family of nested closed orbits. Starting from \((N, P) = (5000, 30)\), the trajectory traces a closed loop with the prey peaking before the predator (a quarter-cycle lag). The famous Hudson Bay Company fur trapping records (1845-1935) show approximately 10-year cycles in both species, qualitatively consistent with the Lotka-Volterra prediction, though the stable limit cycle behavior of the data is better explained by the Rosenzweig-MacArthur model.
</div>

<div class="remark">
<strong>Remark 8.7.</strong> The neutral stability of the Lotka-Volterra model is structurally unstable: any perturbation of the model (adding density dependence, modifying the functional response, adding stochasticity) destroys the closed orbits and typically produces either a stable equilibrium or a stable limit cycle. This structural instability limits the usefulness of the Lotka-Volterra model as a quantitative tool, but it remains invaluable as a conceptual starting point.
</div>

### 8.3 Functional Responses

A key simplification in the Lotka-Volterra model is that the per-capita predation rate is linear in prey density: each predator consumes prey at rate \(aN\) regardless of how abundant the prey is. In reality, predators become satiated when prey is abundant, and they spend time handling prey, reducing their effective search rate. The concept of a functional response, introduced by Holling (1959), captures these effects.

<div class="definition">
<strong>Definition 8.8 (Holling Functional Responses).</strong> The <em>functional response</em> \(f(N)\) is the per-capita rate of prey consumption by a predator as a function of prey density \(N\).
<ul>
<li><em>Type I</em>: \(f(N) = aN\) (linear, unsaturating). This is the Lotka-Volterra assumption.</li>
<li><em>Type II</em>: \(f(N) = \frac{aN}{1 + ahN}\), where \(h\) is the handling time. This saturates at \(1/h\) as \(N \to \infty\).</li>
<li><em>Type III</em>: \(f(N) = \frac{aN^2}{1 + ahN^2}\). This is sigmoidal, with an accelerating phase at low \(N\) (due to prey switching or learning) followed by saturation.</li>
</ul>
</div>

The Type II functional response is the most commonly used and arises from a simple mechanistic argument. A predator alternates between searching for prey (at rate \(a\)) and handling prey (taking time \(h\) per item). If \(T\) is the total time available, the number of prey consumed is \(aN_{\text{search}}T_{\text{search}}\), where the search time satisfies \(T = T_{\text{search}} + h \cdot (\text{number consumed})\). Solving self-consistently gives the Holling Type II expression.

<div class="example">
<strong>Example 8.9.</strong> A wolf spends an average of \(h = 3\) days handling (pursuing, killing, and consuming) each moose, and searches at a rate yielding \(a = 0.01\) encounters per moose per day of searching. The Type II functional response is \(f(N) = 0.01N/(1 + 0.03N)\). At low moose density (\(N = 10\)), each wolf kills about \(0.1/(1.3) \approx 0.077\) moose per day. At high density (\(N = 100\)), the rate is \(1/(4) = 0.25\) moose per day, approaching the saturation value \(1/h = 0.33\) moose per day. The handling time creates a ceiling on predation that becomes binding when prey is abundant.
</div>

### 8.4 The Rosenzweig-MacArthur Model

Replacing the linear functional response in the Lotka-Volterra model with a Type II response and adding logistic prey growth gives the Rosenzweig-MacArthur model, which is one of the most important and well-studied models in theoretical ecology.

<div class="definition">
<strong>Definition 8.10 (Rosenzweig-MacArthur Model).</strong> The <em>Rosenzweig-MacArthur model</em> is

\[
\frac{dN}{dt} = rN\left(1 - \frac{N}{K}\right) - \frac{aNP}{1 + ahN}, \qquad \frac{dP}{dt} = \frac{baNP}{1 + ahN} - dP.
\]
</div>

This model has a coexistence equilibrium at prey density \(N^* = d/(ba - dah) = d/(a(b - dh))\), provided \(b > dh\) (i.e., the conversion efficiency exceeds the death rate times the handling time). The predator equilibrium is found by setting the prey equation to zero.

The stability of the coexistence equilibrium depends critically on the carrying capacity \(K\). Intuitively, increasing \(K\) (enriching the environment with more resources) should benefit both species. However, the mathematical analysis reveals a surprising and counterintuitive outcome. This dependence leads to one of the most striking results in theoretical ecology.

<div class="remark">
<strong>Remark 8.11.</strong> The Rosenzweig-MacArthur model is arguably the most important predator-prey model in theoretical ecology because it combines biological realism (logistic prey growth plus saturating functional response) with analytical tractability. Every ecology textbook discusses this model, and its predictions — particularly the paradox of enrichment — have stimulated decades of theoretical and experimental research.
</div>

<div class="theorem">
<strong>Theorem 8.11 (Rosenzweig, 1971 — Paradox of Enrichment).</strong> In the Rosenzweig-MacArthur model, as the carrying capacity \(K\) increases:
<ol>
<li>For small \(K\), the prey-only equilibrium \((K, 0)\) is the only positive equilibrium and is globally stable.</li>
<li>At \(K = N^*\), a transcritical bifurcation occurs and the coexistence equilibrium appears.</li>
<li>For \(K\) slightly above \(N^*\), the coexistence equilibrium is stable.</li>
<li>At a critical value \(K = K_H\), a supercritical Hopf bifurcation occurs: the equilibrium loses stability and a stable limit cycle appears.</li>
<li>For \(K > K_H\), the system exhibits sustained predator-prey oscillations with increasing amplitude as \(K\) increases.</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> The Jacobian at the coexistence equilibrium \((N^*, P^*)\) has trace

\[
\text{tr}(J) = r\left(1 - \frac{2N^*}{K}\right) - \frac{ahP^*}{(1+ahN^*)^2}
\]
and determinant that is always positive at the coexistence equilibrium. The equilibrium is stable when \(\text{tr}(J) < 0\) and undergoes a Hopf bifurcation when \(\text{tr}(J) = 0\). The trace changes sign when \(K\) passes through the value making \(1 - 2N^*/K = ahP^*/[r(1+ahN^*)^2]\). Since \(N^*\) is independent of \(K\) but \(P^*\) increases with \(K\), increasing \(K\) eventually destabilizes the equilibrium. The first Lyapunov coefficient can be shown to be negative (supercritical bifurcation), so a stable limit cycle appears. \(\square\)
</div>

The name "paradox of enrichment" was coined by Rosenzweig (1971) and has become one of the most widely discussed results in theoretical ecology. The paradox is the counterintuitive result that enriching the environment (increasing \(K\)) can destabilize the predator-prey interaction, leading to large-amplitude oscillations that bring both populations dangerously close to zero. In ecological terms, environmental enrichment can increase the risk of extinction through large population fluctuations — a cautionary tale for ecosystem management.

<div class="example">
<strong>Example 8.12.</strong> Consider the Rosenzweig-MacArthur model with \(r = 1\), \(a = 1\), \(h = 0.5\), \(b = 0.5\), \(d = 0.1\). Then \(N^* = 0.1/(1 \times (0.5 - 0.1 \times 0.5)) = 0.1/0.45 \approx 0.222\). For \(K = 0.5\), the coexistence equilibrium is stable. As \(K\) increases through approximately \(K_H \approx 0.56\), a Hopf bifurcation occurs and the system transitions to oscillatory dynamics. For \(K = 2\), the limit cycle has large amplitude, with prey oscillating between near zero and near \(K\).
</div>

### 8.5 Competitive Exclusion

When two species compete for the same resource, a fundamental question is whether coexistence is possible. The competitive exclusion principle, formalized mathematically by the Lotka-Volterra competition model, provides a sharp answer for the simplest models.

<div class="definition">
<strong>Definition 8.13 (Lotka-Volterra Competition Model).</strong> The <em>two-species Lotka-Volterra competition model</em> is

\[
\frac{dN_1}{dt} = r_1 N_1\left(1 - \frac{N_1 + \alpha_{12} N_2}{K_1}\right), \qquad \frac{dN_2}{dt} = r_2 N_2\left(1 - \frac{N_2 + \alpha_{21} N_1}{K_2}\right),
\]
where \(\alpha_{12}\) is the competitive effect of species 2 on species 1, and \(\alpha_{21}\) is the competitive effect of species 1 on species 2.
</div>

<div class="theorem">
<strong>Theorem 8.14 (Competitive Exclusion and Coexistence).</strong> The Lotka-Volterra competition model has four possible dynamical outcomes:
<ol>
<li>If \(K_1/\alpha_{12} > K_2\) and \(K_2/\alpha_{21} < K_1\): species 1 wins (globally attracts all trajectories with \(N_1(0) > 0\)).</li>
<li>If \(K_1/\alpha_{12} < K_2\) and \(K_2/\alpha_{21} > K_1\): species 2 wins.</li>
<li>If \(K_1/\alpha_{12} > K_2\) and \(K_2/\alpha_{21} > K_1\): stable coexistence at a unique interior equilibrium (intraspecific competition exceeds interspecific competition).</li>
<li>If \(K_1/\alpha_{12} < K_2\) and \(K_2/\alpha_{21} < K_1\): bistability — the winner depends on initial conditions (interspecific competition exceeds intraspecific competition).</li>
</ol>
</div>

<div class="proof">
<strong>Proof.</strong> The nullclines are the lines \(N_1 + \alpha_{12}N_2 = K_1\) and \(\alpha_{21}N_1 + N_2 = K_2\). The interior equilibrium exists when these lines intersect in the positive quadrant. Setting the right-hand sides to zero and solving gives \(N_1^* = (K_1 - \alpha_{12}K_2)/(1 - \alpha_{12}\alpha_{21})\) and \(N_2^* = (K_2 - \alpha_{21}K_1)/(1 - \alpha_{12}\alpha_{21})\). The four cases correspond to the relative positions of the nullclines in the \((N_1, N_2)\)-plane and can be verified by checking the signs of the Jacobian eigenvalues at each equilibrium. \(\square\)
</div>

<div class="remark">
<strong>Remark 8.15.</strong> The competitive exclusion principle (Gause, 1934) states that two species competing for the same single limiting resource cannot coexist at equilibrium. Mathematically, coexistence in the Lotka-Volterra model requires that intraspecific competition be stronger than interspecific competition (\(\alpha_{12}\alpha_{21} < 1\) with appropriate inequalities on the carrying capacities). This is possible when the two species occupy slightly different niches, even if they partially overlap.
</div>

### 8.6 Trophic Cascades

The interactions studied above — predator-prey and competition — involve two trophic levels. In real ecosystems, multiple trophic levels interact, and perturbations can propagate up and down the food chain. A trophic cascade occurs when changes at one trophic level cause alternating effects at successively lower levels.

<div class="definition">
<strong>Definition 8.16 (Three-Level Food Chain).</strong> A <em>three-level food chain model</em> (resource-consumer-predator) is

\[
\frac{dN}{dt} = rN\left(1 - \frac{N}{K}\right) - f_1(N)C, \qquad \frac{dC}{dt} = b_1 f_1(N)C - f_2(C)P - d_1 C, \qquad \frac{dP}{dt} = b_2 f_2(C)P - d_2 P,
\]
where \(N\) is the resource (e.g., vegetation), \(C\) is the consumer (herbivore), \(P\) is the predator, and \(f_1\), \(f_2\) are functional responses.
</div>

<div class="example">
<strong>Example 8.17.</strong> The reintroduction of wolves to Yellowstone National Park in 1995 provides a dramatic real-world example of a trophic cascade. Wolves (top predator, \(P\)) reduced the elk population (consumer, \(C\)), which in turn allowed recovery of riparian vegetation (resource, \(N\)), particularly willows and aspens along stream banks. The three-level food chain model predicts this qualitative pattern: increasing top-predator abundance decreases herbivore abundance and increases plant abundance.
</div>

The mathematical analysis of three-level food chains reveals a rich dynamical repertoire. With Type II functional responses at both trophic links, the system can exhibit stable equilibria, limit cycles (via Hopf bifurcation as the carrying capacity increases), and even chaotic dynamics. The transition from regular to chaotic behavior in food chain models has been studied extensively by Hastings and Powell (1991) and is related to the interaction between the Hopf bifurcation at the resource-consumer level (paradox of enrichment) and the dynamics introduced by the top predator. The Hastings-Powell model demonstrates that chaos in ecology is not merely a theoretical curiosity but arises naturally in simple, biologically motivated food chain models with saturating functional responses.

<div class="theorem">
<strong>Theorem 8.18 (HSS Exploitation Ecosystems Hypothesis).</strong> In a linear food chain with \(n\) trophic levels at equilibrium (Hairston-Smith-Slobodkin, 1960), the top trophic level is resource-limited, the level below it is consumer-limited (top-down controlled), and the effects alternate down the chain. Specifically:
<ul>
<li>With an odd number of trophic levels, the basal resource is consumer-limited (suppressed below carrying capacity).</li>
<li>With an even number of trophic levels, the basal resource is near carrying capacity (released from consumer control).</li>
</ul>
Enrichment (increasing \(K\)) benefits trophic levels at odd distance from the top.
</div>

This elegant prediction has been broadly confirmed empirically: in systems with wolves, elk, and vegetation (three levels), the vegetation is suppressed; removing the wolves releases the elk from predator control and further suppresses vegetation. In four-level systems, enrichment would benefit the second and fourth levels. The mathematical formalization through food chain models provides rigorous conditions under which these predictions hold and identifies the parameter regimes where more complex dynamics (oscillations, chaos) can arise.

<div class="example">
<strong>Example 8.19.</strong> Consider a simple three-level chain with Lotka-Volterra interactions:

\[
\frac{dN}{dt} = rN(1 - N/K) - a_1NP_1, \quad \frac{dP_1}{dt} = b_1a_1NP_1 - a_2P_1P_2 - d_1P_1, \quad \frac{dP_2}{dt} = b_2a_2P_1P_2 - d_2P_2.
\]
At the three-species equilibrium, \(P_1^* = d_2/(b_2 a_2)\) is independent of \(K\): the herbivore population is set by top-down control from the predator. The resource equilibrium \(N^*\) is also independent of \(K\) (set by the herbivore level), while the predator \(P_2^*\) increases linearly with \(K\). This confirms the HSS prediction: enrichment benefits the top predator (odd distance from top = 0), not the herbivore or the resource.
</div>

<div class="example">
<strong>Example 8.20.</strong> The introduction of the Nile perch into Lake Victoria in the 1950s provides a cautionary example of trophic cascade effects. The large predatory fish decimated the native cichlid fish population (hundreds of species), which had been the primary consumers of algae. With reduced grazing pressure, algal blooms proliferated, leading to eutrophication and deoxygenation of deep waters. This two-step cascade — top predator introduction leading to consumer decline leading to resource explosion — matches the HSS prediction for a transition from an effectively two-level system (cichlids and algae) to a three-level system (Nile perch, remaining fish, and algae).
</div>

### 8.7 Synthesis: Epidemiology Meets Ecology

The mathematical frameworks developed in this course — compartmental models, stability analysis, bifurcation theory, spatial dynamics, stochastic processes, and population dynamics — are deeply interconnected. Epidemic models are, at their core, models of interacting populations: susceptible "prey" consumed by infectious "predators," with the additional feature that new "predators" are produced from consumed "prey" rather than by independent reproduction.

<div class="remark">
<strong>Remark 8.21.</strong> The analogy between epidemiology and ecology runs deep. The basic reproduction number \(\mathcal{R}_0\) is analogous to the net reproductive rate in population biology. The epidemic threshold theorem is analogous to the invasion condition for a species entering a new environment. The competitive exclusion principle has an epidemiological counterpart: under certain conditions, two strains of a pathogen competing for the same host population cannot coexist, and the strain with the higher \(\mathcal{R}_0\) excludes the other (Bremermann-Thieme competitive exclusion principle). These analogies are not merely heuristic — they rest on shared mathematical structures, particularly the theory of monotone dynamical systems and the spectral theory of positive operators.
</div>

The mathematical tools we have developed — phase plane analysis, Lyapunov functions, bifurcation theory, next-generation operators, traveling wave analysis, branching processes — form a coherent toolkit applicable across the biological sciences. The challenge for the applied mathematician is to deploy these tools judiciously, constructing models that capture the essential features of the biological system at hand while remaining mathematically tractable.

<div class="example">
<strong>Example 8.22.</strong> The COVID-19 pandemic (2020-2023) provides a comprehensive case study integrating nearly every topic in this course. The basic SIR framework (Chapter 2) was used for initial projections. The SEIR model (Chapter 3) incorporated the incubation period. Age-structured models (Chapter 5) were essential for designing vaccination prioritization strategies. Network models (Chapter 6) captured superspreading events. Stochastic models (Chapter 7) were used to assess the probability of local elimination. And the ecological perspective (Chapter 8) informed thinking about the evolutionary dynamics of viral variants — a process analogous to competitive exclusion among strains, with the caveat that cross-immunity complicates the analogy with simple Lotka-Volterra competition.
</div>

The interplay between mathematical theory and biological application has been a recurring theme throughout this course. The theorems we have proved are not sterile abstractions: each one — from the epidemic threshold theorem to the paradox of enrichment — illuminates a genuine biological phenomenon and provides quantitative tools for prediction and control. As the COVID-19 pandemic vividly demonstrated, mathematical epidemiology is not merely an academic exercise: the models and analyses developed in this course have direct and immediate relevance to public health decision-making and the welfare of human populations worldwide.

The frontier of mathematical epidemiology and population dynamics continues to expand. Current research areas include:

Multi-scale models coupling within-host pathogen dynamics to between-host transmission, where the immune response within an individual affects their infectiousness to others.

Models incorporating behavioral feedback, where human behavior changes in response to perceived disease risk, creating a coupled human-disease dynamical system.

Evolutionary epidemiology, studying the co-evolution of pathogens and hosts, including the evolution of virulence and drug resistance.

Phylodynamics, which integrates genomic sequence data with epidemiological models to reconstruct transmission histories and estimate key epidemiological parameters.

Each of these areas demands the same combination of biological insight and mathematical rigor that has characterized the field since the pioneering work of Bernoulli, Ross, and Kermack-McKendrick.
