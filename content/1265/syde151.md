---
title: "SYDE 151: Introduction to Systems Thinking"
subjects: "SYDE"
---

## Sources and References

- Meadows, <em>Thinking in Systems: A Primer</em> (Chelsea Green)
- Checkland, <em>Systems Thinking, Systems Practice</em> (Wiley)
- Senge, <em>The Fifth Discipline</em> (Doubleday)
- Sterman, <em>Business Dynamics: Systems Thinking and Modeling for a Complex World</em> (McGraw-Hill)
- Online: The Systems Thinker, MIT System Dynamics Group resources

---

# Chapter 1: What a System Is

## 1.1 Definition and Components

A <em>system</em> is a set of interacting components whose combined behaviour produces properties none of them possesses alone. The three essential ingredients — elements, interconnections, and a purpose or function — distinguish systems from arbitrary collections. A pile of bricks is not a system; an arch, in which each brick transmits loads so that the whole can span a gap, is.

Systems exhibit <em>emergent</em> behaviour that cannot be predicted from study of parts in isolation. Wetness emerges from water molecules; ecosystem resilience emerges from species interactions; traffic jams emerge from individually rational drivers.

<div class="definition">
A <strong>system</strong> is an interconnected set of elements coherently organised in a way that achieves something; a <strong>boundary</strong> separates what is inside the system from its environment, and its choice shapes analysis.
</div>

## 1.2 Stocks, Flows, and Feedback

The basic vocabulary of systems dynamics is stocks (accumulations, e.g., inventory, population, reservoir water) and flows (rates of change, e.g., hiring rate, birth rate, water inflow). A stock \( S(t) \) evolves as

\[
\frac{dS}{dt} = F_{in}(t) - F_{out}(t).
\]

A <em>feedback loop</em> exists when a change in a stock alters flows that change the stock further. Balancing (negative) loops resist change and stabilise; reinforcing (positive) loops amplify change and destabilise. Thermostat control, market prices, and predator-prey populations all reduce to diagrams of stocks, flows, and feedback.

# Chapter 2: Dynamic Patterns

## 2.1 Archetypes

Classical systems archetypes recur across domains: limits to growth, shifting the burden, tragedy of the commons, fixes that fail, success to the successful, eroding goals. Recognising the archetype a problem fits suggests which leverage points will work. A reinforcing growth loop without a counterbalance will eventually saturate or collapse as resources deplete; the archetype of limits to growth directs attention to the constraint rather than the growth engine.

## 2.2 Exponential Growth and Decay

A first-order reinforcing loop gives

\[
\frac{dS}{dt} = r S, \qquad S(t) = S_0 e^{rt}.
\]

A first-order balancing loop toward a goal \( S^{*} \) gives

\[
\frac{dS}{dt} = k (S^{*} - S), \qquad S(t) = S^{*} + (S_0 - S^{*}) e^{-k t}.
\]

Bounded growth arises when both loops act: logistic dynamics

\[
\frac{dS}{dt} = r S\!\left(1 - \frac{S}{K}\right)
\]

produces S-curves ubiquitous in population and technology diffusion.

<div class="example">
Technology adoption frequently follows a logistic curve; the time from 10% to 90% adoption is roughly \( 4.4/r \), a useful rule of thumb for forecasting market saturation.
</div>

# Chapter 3: Representing Systems

## 3.1 Causal Loop Diagrams

A causal loop diagram (CLD) sketches variables as nodes and causal links as arrows labelled with polarity: a same-direction link (+) between two variables means an increase in one causes an increase in the other; an opposite-direction link (−) means the reverse. Counting minus signs around a loop identifies its polarity: an even count is reinforcing, odd is balancing.

CLDs reveal structure quickly but lack quantitative detail. They are indispensable for initial discussion, stakeholder engagement, and identifying leverage points.

## 3.2 Stock-and-Flow Diagrams

Stock-and-flow diagrams (SFDs) formalise accumulation and rate relationships. Each stock has a mass-balance equation; each flow is a function of stocks, constants, or exogenous inputs. Translating an SFD into ordinary differential equations (or difference equations) supports simulation, sensitivity analysis, and policy testing.

# Chapter 4: Complexity and Nonlinearity

## 4.1 Delays

Delays between cause and effect are among the most underappreciated features of real systems. A balancing loop with delay can overshoot, oscillate, or destabilise. In supply chains, the <em>bullwhip effect</em> amplifies demand variability upstream because each tier acts on delayed, smoothed signals. Engineers mitigate this with shared information, shorter cycle times, and policy rules that account for the delay.

## 4.2 Nonlinear Dynamics

Multiple feedback loops with different strengths and delays can produce complex trajectories: limit cycles, multiple equilibria, hysteresis, tipping points. An ecosystem may flip abruptly from clear-water to algae-dominated regimes once nutrient loads pass a threshold. Systems thinking teaches humility about such discontinuities and motivates early warning monitoring.

<div class="remark">
Complex systems are not merely complicated; adding complication rarely buys you insight unless it captures a feedback not yet represented. Parsimonious models that expose the active loops are more useful than exhaustive inventories of variables.
</div>

# Chapter 5: Soft Systems and Human Factors

## 5.1 Hard vs Soft Systems

Hard-systems methodology (operations research, control theory) treats problems as well defined, with clear goals and objective performance measures. Soft-systems methodology (SSM), developed by Peter Checkland, addresses problems where stakeholders disagree on what the problem even is. SSM uses rich pictures, root definitions, and CATWOE (Customers, Actors, Transformation, Worldview, Owner, Environment) to make worldviews explicit and to design conceptual models that participants can contest and refine.

## 5.2 Worldviews and Framing

Different stakeholders frame the same situation differently. A proposed highway expansion is a traffic problem to commuters, a neighbourhood-disruption problem to residents, a budget problem to officials, and a climate problem to environmentalists. Systems thinkers deliberately surface these perspectives — often through facilitated workshops — to avoid solving the wrong problem.

# Chapter 6: Leverage Points and Practice

## 6.1 Meadows' Leverage Points

Donella Meadows ranked twelve leverage points for intervening in a system, from weakest (tweaking parameters) to strongest (shifting mental models and transcending paradigms). Between these endpoints lie buffers, stock-flow structures, delays, balancing loops, reinforcing loops, information flows, rules, self-organisation, and goals. Counter-intuitively, changing numerical parameters usually fails to alter behaviour because system structure determines the dynamics.

## 6.2 Critical Thinking

Systems thinking is a stance as much as a toolkit: ask what lies beyond the obvious cause; ask who or what defines system purpose; ask which feedbacks dominate and which are delayed; ask where unintended consequences may emerge. Bridging across disciplines is essential because real problems (climate change, public health, engineering ethics) transcend single technical domains.

## 6.3 Applications in Engineering

Engineers encounter systems thinking when designing infrastructure, planning manufacturing processes, managing projects, and evaluating social impact. A clean-water project fails not from pump design but from a maintenance stock that depletes without training flows; a bridge project succeeds when traffic demand loops are anticipated in capacity choice. Equitable, human-centered engineering requires explicitly modelling community stocks and flows (skills, funds, trust) alongside technical ones.

<div class="theorem">
Behaviour over time follows from system structure; structure follows from decisions, rules, and mental models; mental models follow from shared experience and information flows. Altering behaviour sustainably therefore requires engaging with all four levels, not just the surface symptoms.
</div>

Systems thinking provides a conceptual toolset that bridges engineering and social disciplines — inviting the thinker to reframe problems, consider feedback and delays, and choose interventions where leverage is greatest rather than where effort is easiest.
