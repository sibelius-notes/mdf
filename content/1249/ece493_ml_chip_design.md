---
title: "ECE 493: Machine Learning Techniques for Chip Design"
prof: "Nachiket Kapre"
subjects: "ECE"
---

## Sources and References

**Primary textbooks** — Kahng, A. B., Lienig, J., Markov, I. L., & Hu, J. (2022). *VLSI Physical Design: From Graph Partitioning to Timing Closure* (2nd ed.). Springer. — Prince, S. J. D. (2024). *Understanding Deep Learning*. MIT Press. (Free at udlbook.github.io)

**Supplementary texts** — Eiben, A. E., & Smith, J. E. (2015). *Introduction to Evolutionary Computing* (2nd ed.). Springer. — Sutton, R. S., & Barto, A. G. (2020). *Reinforcement Learning: An Introduction* (2nd ed.). MIT Press. (Free online) — Goodfellow, I., Bengio, Y., & Courville, A. (2016). *Deep Learning*. MIT Press. — Rabaey, J. M. (2002). *Digital Integrated Circuits: A Design Perspective*. Prentice Hall.

**Key papers** — Mirhoseini, A., et al. (2021). A graph placement methodology for fast chip design. *Nature*, 594, 207–212. — Grosnit, A., et al. (2021). BOiLS: Bayesian optimisation for logic synthesis. arXiv:2111.06178. — Cheng, C., et al. (2021). NVCell: Standard cell layout in advanced technology nodes with reinforcement learning. arXiv:2107.07044. — Liao, Y., et al. (2022). PrefixRL: Optimization of parallel prefix circuits using deep reinforcement learning. arXiv:2205.07000.

**Online resources** — MLCAD conference proceedings (mlcad.org); Lilian Weng's blog on RL (lilianweng.github.io); Otoro blog on evolution strategies (blog.otoro.net); OpenAI Spinning Up RL tutorial.

---

# Chapter 1: The Chip Design Flow

## 1.1 RTL to Layout — Overview

Modern integrated circuit design proceeds through a structured **RTL-to-layout flow** that converts a behavioral hardware specification into a physical layout of transistors. The flow consists of tightly coupled stages, each solving a combinatorial optimization problem that is NP-hard in general.

**Register-Transfer Level (RTL)** describes circuit behavior in terms of registers, combinational logic operations, and clock events. RTL is written in hardware description languages (Verilog, VHDL, SystemVerilog) and represents the entry point for synthesis.

The main stages of the flow are:

| Stage | Input | Output | Key Optimization |
|---|---|---|---|
| Logic synthesis | RTL | Gate netlist | Area, timing |
| Technology mapping | Gate netlist | Mapped netlist | Cell library fit |
| Floorplanning | Mapped netlist | Block positions | Area, timing, power |
| Placement | Floorplan | Cell coordinates | Wirelength, timing |
| Clock tree synthesis | Placed netlist | Buffered clock tree | Skew, insertion delay |
| Routing | Placed netlist | Metal wires | DRC, timing |
| Timing closure | Routed netlist | Verified layout | Setup/hold |

Each stage is NP-hard. Current industry-standard tools (Synopsys Design Compiler, Cadence Innovus) use heuristics — simulated annealing, greedy partitioning, force-directed placement — that have been refined over decades. Machine learning offers a complementary approach: learning from historical runs to predict and guide optimization.

## 1.2 Logic Synthesis

Logic synthesis maps RTL to a network of Boolean gates from a target technology library. The core sub-problems are:

- **Technology-independent optimization**: applying rewriting rules to the Boolean network (AIG — And-Inverter Graph) to reduce node count and depth. Operators include resubstitution, refactoring, and rewriting.
- **Technology mapping**: covering the AIG with library cells (standard cells: AND, OR, NAND, NOR, INV, MUX, full adder, etc.) minimizing area or delay.

ABC (Academic Basis for Circuit design) is the open-source logic synthesis framework used in research. A synthesis **recipe** is a sequence of optimization commands (e.g., `resub; balance; rewrite; refactor; balance; rewrite`); the final area and timing depend sensitively on the recipe. Finding the optimal recipe for a given circuit is a combinatorial search problem — the basis for Bayesian optimization in Section 3.

## 1.3 Floorplanning, Placement, and Routing

**Floorplanning** partitions the chip area into regions (blocks) for each functional unit and assigns approximate locations. The optimization objectives are wirelength (proxy for power and delay), regularity, and timing slack.

**Global placement** assigns each standard cell a continuous coordinate position to minimize total wirelength while respecting density constraints. The **half-perimeter wirelength (HPWL)** for a net connecting cells at positions \((x_i, y_i)\) is:

\[
\text{HPWL} = \left(\max_i x_i - \min_i x_i\right) + \left(\max_i y_i - \min_i y_i\right)
\]

Minimizing total HPWL is the standard placement cost function. **Legalization** then snaps cells to legal grid positions in the standard-cell rows.

**Routing** connects placed cells with metal wires subject to design rules (minimum spacing, width, via constraints). Global routing allocates capacity on a coarse routing grid; detailed routing fills in actual wire geometries. Routing is the most compute-intensive stage: a modern SoC may have billions of nets.

## 1.4 Timing Closure

**Static timing analysis (STA)** verifies that all paths meet setup and hold timing constraints after routing. A path from flip-flop to flip-flop must satisfy:

\[
t_{\text{clk-to-Q}} + t_{\text{logic}} + t_{\text{wire}} \leq T_{\text{clk}} - t_{\text{setup}}
\]

Timing violations are fixed by upsizing cells (increasing drive strength reduces output resistance), adding buffers, or adjusting routing layers. **Timing closure** is iterative and computationally expensive — it is one of the key targets for ML acceleration.

---

# Chapter 2: Deep Networks for Chip Design

## 2.1 Shallow vs. Deep Architectures

A **neural network** approximates a function \(f: \mathbb{R}^d \to \mathbb{R}^k\) by composing parameterized layers. A **shallow (one hidden layer)** network with activation \(\sigma\) and weight matrix \(W\):

\[
\hat{y} = W_2 \sigma(W_1 x + b_1) + b_2
\]

is a universal approximator — it can represent any continuous function given sufficient hidden units — but requires exponentially many units for functions with hierarchical structure.

**Deep networks** compose multiple transformations:

\[
h^{(l)} = \sigma(W^{(l)} h^{(l-1)} + b^{(l)}), \quad h^{(0)} = x
\]

Depth enables compositional feature learning: early layers detect local patterns; later layers combine them into increasingly abstract representations. For chip design, features at multiple scales matter — from gate-level connectivity to block-level topology — making depth beneficial.

## 2.2 Loss Functions and Gradient Descent

Training minimizes a **loss function** \(\mathcal{L}(\theta)\) over a dataset \(\{(x_i, y_i)\}_{i=1}^N\):

- **Mean squared error** (regression): \(\mathcal{L} = \frac{1}{N}\sum_i \|y_i - \hat{y}(x_i;\theta)\|^2\)
- **Cross-entropy** (classification): \(\mathcal{L} = -\frac{1}{N}\sum_i \sum_c y_{ic} \log \hat{p}_{ic}\)

For chip design prediction tasks (predicting timing slack, congestion, power from netlist features), regression losses are typical.

**Stochastic gradient descent (SGD)** updates parameters via:

\[
\theta \leftarrow \theta - \eta \nabla_\theta \mathcal{L}_{\text{batch}}(\theta)
\]

where \(\eta\) is the learning rate and the gradient is estimated over a mini-batch. **Adam** (Kingma & Ba, 2015) adapts the learning rate per-parameter using first and second moment estimates:

\[
m_t = \beta_1 m_{t-1} + (1-\beta_1) g_t, \quad v_t = \beta_2 v_{t-1} + (1-\beta_2) g_t^2
\]

\[
\theta_t = \theta_{t-1} - \eta \frac{\hat{m}_t}{\sqrt{\hat{v}_t} + \epsilon}
\]

Adam is the standard optimizer for deep networks in chip design applications.

## 2.3 Regularization and Generalization

Neural networks with many parameters overfit without regularization. Key methods:

- **L2 weight decay**: add \(\frac{\lambda}{2}\|\theta\|^2\) to the loss, penalizing large weights.
- **Dropout**: at each training step, randomly zero-out each hidden unit with probability \(p\), preventing co-adaptation.
- **Batch normalization**: normalize activations within each mini-batch to have zero mean and unit variance, then apply learnable scale/shift \(\gamma, \beta\). Reduces internal covariate shift and accelerates training.

**Generalization** is the network's ability to perform well on unseen circuits. In chip design prediction, generalization to new circuit topologies is difficult because the feature distribution shifts between training and test netlists. **Transfer learning** — fine-tuning a network pre-trained on large circuits for a new family — partially addresses this.

## 2.4 Predicting Chip Design Metrics

**Performance prediction** uses the post-synthesis netlist as input to predict placement/routing quality metrics before actually running place-and-route (a compute-intensive step). Predicted metrics include:

- Routed wirelength and critical path delay (timing slack)
- Routing congestion (probability of DRC violations)
- Total power consumption

Early ML approaches extracted hand-crafted netlist features (gate count, fan-in/fan-out distribution, critical path length from timing graph) and trained gradient-boosted trees or shallow networks. More recent approaches use graph neural networks (Chapter 6) that operate directly on the connectivity graph without manual feature engineering.

---

# Chapter 3: Bayesian Optimization for Logic Synthesis

## 3.1 Bayesian Optimization Framework

**Bayesian optimization (BO)** is a sample-efficient strategy for optimizing expensive black-box functions. In chip design, the objective \(f(\mathbf{s})\) could be the post-synthesis area or delay of a netlist after applying synthesis recipe \(\mathbf{s}\) (a sequence of ABC commands). Each evaluation of \(f\) takes tens of seconds to minutes, so sample efficiency is critical.

BO maintains a **probabilistic surrogate model** — typically a **Gaussian process (GP)** — over \(f\):

\[
f(\mathbf{s}) \sim \mathcal{GP}(\mu(\mathbf{s}), k(\mathbf{s}, \mathbf{s}'))
\]

The GP posterior is updated after each observed evaluation \((\mathbf{s}_t, y_t)\):

\[
\mu_{\text{post}}(\mathbf{s}) = k(\mathbf{s}, \mathbf{S}) [K(\mathbf{S},\mathbf{S}) + \sigma_n^2 I]^{-1} \mathbf{y}
\]

\[
\sigma_{\text{post}}^2(\mathbf{s}) = k(\mathbf{s},\mathbf{s}) - k(\mathbf{s},\mathbf{S})[K(\mathbf{S},\mathbf{S}) + \sigma_n^2 I]^{-1} k(\mathbf{S},\mathbf{s})
\]

where \(\mathbf{S}\) are the observed inputs, \(K(\mathbf{S},\mathbf{S})\) is the kernel (covariance) matrix, and \(\sigma_n^2\) is the observation noise variance.

## 3.2 Acquisition Functions

The **acquisition function** \(\alpha(\mathbf{s})\) quantifies the utility of evaluating \(f\) at a candidate \(\mathbf{s}\), trading off exploration (high posterior variance) and exploitation (low posterior mean for minimization).

**Expected Improvement (EI)**:

\[
\alpha_{\text{EI}}(\mathbf{s}) = \mathbb{E}\left[\max(0, f^* - f(\mathbf{s}))\right]
\]

where \(f^*\) is the best observed value. For a GP surrogate, EI has a closed form:

\[
\alpha_{\text{EI}}(\mathbf{s}) = (f^* - \mu(\mathbf{s}))\Phi(z) + \sigma(\mathbf{s})\phi(z), \quad z = \frac{f^* - \mu(\mathbf{s})}{\sigma(\mathbf{s})}
\]

where \(\Phi\) and \(\phi\) are the standard normal CDF and PDF. At each BO iteration, the next evaluation point is \(\mathbf{s}_{t+1} = \arg\max_\mathbf{s} \alpha(\mathbf{s})\).

## 3.3 BO for Logic Synthesis and High-Level Synthesis

**BOiLS** (Grosnit et al., 2021) applies BO to find synthesis recipes for ABC that minimize area×delay. The space of synthesis recipes is a discrete sequential space (each element of the sequence is one of \(\sim 10\) ABC commands), handled by defining a kernel over sequences (edit distance-based). BO with sequence kernels finds recipes that outperform random search and hand-tuned recipes on standard benchmarks (EPFL benchmark suite) within \(\sim 50\) evaluations.

**HLS design space exploration**: high-level synthesis tools (Vitis HLS, Legup) expose pragmas (loop unrolling factor, array partitioning) that trade area for throughput. The design space has combinatorial size; BO efficiently navigates it by modeling the area-throughput Pareto frontier.

**FPGA timing closure** (LAMDA, InTime systems): post-routing timing slack is a noisy function of hundreds of CAD tool parameters (placement effort, router aggressiveness). BO or Gaussian process regression identifies parameter settings that most efficiently improve timing without re-running the full flow.

---

# Chapter 4: Evolutionary Algorithms

## 4.1 Genetic Algorithms

A **genetic algorithm (GA)** maintains a **population** of candidate solutions and iteratively evolves it using selection, crossover, and mutation operators.

**Algorithm skeleton**:
1. Initialize population \(\mathcal{P}_0\) of \(N\) individuals (e.g., random synthesis recipes or floorplans).
2. Evaluate fitness \(f(s)\) for each \(s \in \mathcal{P}_t\).
3. **Selection**: choose parents proportionally to fitness (roulette wheel) or by tournament.
4. **Crossover**: combine two parent genotypes (e.g., one-point crossover: split recipe at a random position, swap tails).
5. **Mutation**: randomly perturb individuals (e.g., replace one recipe command with a random alternative).
6. Form \(\mathcal{P}_{t+1}\) from offspring. Repeat until convergence.

GAs handle discrete search spaces naturally and support multi-objective optimization via **NSGA-II** (Non-dominated Sorting GA II): populations are ranked by Pareto non-dominance and diversity (crowding distance) is preserved to maintain diverse trade-off fronts.

## 4.2 CMA-ES

**CMA-ES (Covariance Matrix Adaptation Evolution Strategy)** extends evolution strategies to continuous spaces by adapting a full multivariate Gaussian sampling distribution. At each step, \(\lambda\) candidate solutions are sampled:

\[
\mathbf{x}_i \sim \mathcal{N}(\mathbf{m}, \sigma^2 \mathbf{C}), \quad i = 1, \ldots, \lambda
\]

The \(\mu < \lambda\) best candidates (by fitness) update the mean \(\mathbf{m}\), step size \(\sigma\), and covariance matrix \(\mathbf{C}\). CMA-ES learns the correlation structure of the fitness landscape and aligns the sampling distribution with the most promising directions.

CMA-ES converges in \(O(n^2)\) evaluations for \(n\)-dimensional problems in many benchmark settings, outperforming simple gradient-free methods. It is particularly effective for moderate-dimensional design space problems (\(n = 10\text{–}100\)).

## 4.3 Applications: Floorplanning and Systolic Array Partitioning

**FPGA partitioning** (RapidLayout): systolic arrays for matrix multiplication are large, regular structures that must be mapped onto FPGA hard blocks (DSPs, BRAMs) efficiently. The placement objective is to minimize inter-block routing delays while respecting block capacity. CMA-ES or NSGA-II evolve placement solutions represented as permutations of block assignments; each candidate is evaluated using fast analytical routing estimates.

**Floorplanning**: the classic **slicing floorplan** represents a chip as a binary tree of horizontal/vertical cuts; each leaf is a block with given area. GAs operate on the sequence-pair or B*-tree representation of floorplans. Fitness combines area, aspect ratio, and estimated wirelength.

---

# Chapter 5: Reinforcement Learning for Chip Design

## 5.1 RL Fundamentals

Reinforcement learning models an **agent** that sequentially selects **actions** \(a_t\) in an **environment** state \(s_t\) to maximize the cumulative **reward** \(R = \sum_{t=0}^T \gamma^t r_t\) (\(\gamma\) is the discount factor). The agent learns a **policy** \(\pi(a|s)\) (or, for discrete actions, a **Q-function** \(Q(s,a)\)) via trial-and-error interaction.

**Q-learning** (Watkins, 1989) uses the Bellman optimality equation:

\[
Q^*(s,a) = r + \gamma \max_{a'} Q^*(s', a')
\]

**Deep Q-Network (DQN)** (Mnih et al., 2015) approximates \(Q^*(s,a)\) with a neural network. Experience replay (storing past transitions in a replay buffer) and target networks (holding a frozen Q-network to compute targets) stabilize training.

For continuous action spaces (e.g., placing a cell at coordinates \((x,y) \in \mathbb{R}^2\)), **actor-critic methods** are used:
- The **actor** (policy network) outputs a distribution over actions.
- The **critic** (value network) estimates \(V(s)\) or \(Q(s,a)\).

**Proximal Policy Optimization (PPO)** restricts policy updates to stay close to the current policy via a clipped surrogate objective:

\[
\mathcal{L}^{\text{CLIP}}(\theta) = \mathbb{E}_t\left[\min\left(r_t(\theta)\hat{A}_t,\; \text{clip}(r_t(\theta), 1-\epsilon, 1+\epsilon)\hat{A}_t\right)\right]
\]

where \(r_t(\theta) = \pi_\theta(a_t|s_t) / \pi_{\theta_{\text{old}}}(a_t|s_t)\) is the importance ratio and \(\hat{A}_t\) is the advantage estimate. PPO is the dominant on-policy algorithm used in chip design RL due to its stability and ease of tuning.

## 5.2 AlphaChip-Style Placement

The Google DeepMind paper (Mirhoseini et al., 2021, *Nature*) framed macro placement as a sequential RL problem: the agent places macros (large functional blocks) one at a time on a discretized chip canvas. The state encodes the current partial placement; the action is the position of the next macro; the reward is a weighted combination of negative wirelength, congestion, and a flag for feasibility. A graph neural network encodes the netlist connectivity as the policy's context.

After training on thousands of chip designs, the policy generalizes to new chips and produces placements that improve over commercial tools on industry benchmarks in terms of power-performance-area (PPA). Crucially, inference is fast (~6 hours vs. weeks for human experts), enabling rapid design exploration.

## 5.3 RL for Standard Cell Layout and Arithmetic Circuit Optimization

**NVCell** (NVIDIA, 2021) places and routes individual standard cells at the transistor level using RL. The state encodes the partial layout; actions are transistor placement choices. Reward combines routability and design rule compliance. NVCell generates layouts comparable to human-optimized cells for 7nm and below nodes, where the design rules are too complex for conventional automated tools.

**PrefixRL** (Liao et al., 2022) optimizes parallel prefix adder structures (Kogge-Stone, Brent-Kung, and hybrids) using RL. The agent selects which combine nodes to place in a prefix graph; the reward is the synthesized area-delay product from a logic synthesis tool. By exploring the vast combinatorial space of valid prefix graphs, PrefixRL discovers adder structures with better trade-offs than Sklansky, Kogge-Stone, and Brent-Kung on 7nm standard-cell libraries.

---

# Chapter 6: Graph Neural Networks for Chip Design

## 6.1 Representing Circuits as Graphs

Circuits are naturally represented as graphs: nodes are gates or nets, edges are connections (fan-in/fan-out relationships). GNNs operating on these graphs learn to predict circuit properties from the topology, without hand-crafted features.

Several graph representations are used:

- **Gate graph**: nodes = logic gates, edges = wire connections.
- **Net graph**: nodes = nets (wires), edges = shared gates.
- **Hypergraph**: each net is a hyperedge connecting all its pins.
- **Timing graph**: directed edges from driver to loads, weighted by delay.

For placement prediction, spatial information (cell coordinates) augments the topological features.

## 6.2 GNN Architectures

A **Graph Convolutional Network (GCN)** updates node features by aggregating neighbors:

\[
h_v^{(l+1)} = \sigma\left(W^{(l)} \cdot \text{MEAN}\left(\{h_u^{(l)} : u \in \mathcal{N}(v) \cup \{v\}\right)\right)
\]

**GraphSAGE** uses learnable aggregation (mean, LSTM, or max-pool) and samples a fixed-size neighborhood to handle large graphs:

\[
h_{\mathcal{N}(v)}^{(l)} = \text{AGG}\left(\{h_u^{(l)} : u \in \mathcal{N}(v)\}\right)
\]

\[
h_v^{(l+1)} = \sigma\left(W^{(l)} \cdot \text{CONCAT}(h_v^{(l)}, h_{\mathcal{N}(v)}^{(l)})\right)
\]

**Graph Attention Networks (GAT)** weight neighbors by learnable attention coefficients:

\[
\alpha_{uv} = \frac{\exp(\text{LeakyReLU}(a^T [W h_u \| W h_v]))}{\sum_{k \in \mathcal{N}(v)} \exp(\text{LeakyReLU}(a^T [W h_k \| W h_v]))}
\]

Attention allows the network to focus on the most informative neighbors — useful when circuit fan-out varies by orders of magnitude.

## 6.3 Applications: NoC Performance Prediction and Timing

**GraphNoC** predicts application-specific latency and throughput of FPGA Network-on-Chip (NoC) configurations. A NoC is a mesh or irregular graph of routers; the application generates a traffic pattern (communication graph). GraphNoC takes the combined NoC topology and application traffic graph as input, producing per-link utilization and end-to-end latency predictions without simulation. Predictions guide design space exploration — choosing topology, buffer depth, and routing algorithm — in seconds instead of hours.

**Timing prediction**: predicting post-routing timing slack from the pre-routed netlist enables early timing-driven optimization. GNNs on the timing graph (nodes = gates, directed edges = timing arcs) predict path delays by aggregating neighboring gate delays and wiring estimates. These predictions guide placement engines to protect critical paths.

**Circuit-GNN** (Zhang et al., ICML 2019) applies GNNs to analog circuit sizing: the circuit topology (transistors, capacitors, resistors as nodes; wire connections as edges) is the graph. The GNN predicts small-signal parameters (gain, bandwidth, noise figure) from device size settings, enabling gradient-based or BO optimization of device sizes that is 100× faster than SPICE simulation.

## 6.4 Training Considerations for Circuit GNNs

Circuit graphs have properties that differ from typical social or biological networks: they are **directed**, often **DAG-structured** (combinational logic), have heterogeneous node types (AND, OR, FF, buffer), and can be very large (\(10^6\text{–}10^9\) nodes for modern chips).

**Challenges and solutions**:

- **Scalability**: mini-batch training requires graph sampling (neighbor sampling in GraphSAGE, cluster sampling). Whole-graph training is infeasible for large circuits.
- **Heterogeneity**: heterogeneous GNNs (HetGNN, R-GCN) assign different transformation matrices to each node or edge type.
- **Generalization across circuit sizes**: GNNs generalize across graph sizes naturally (parameter count is independent of graph size), unlike FC networks. This is a key advantage for chip design, where circuits vary widely in complexity.
- **Transfer learning**: pre-training on generic netlists (open-source benchmark suites: ISPD, ICCAD contests) and fine-tuning on proprietary circuits reduces the labeled data required for production deployment.

---

# Chapter 7: Future Directions — LLMs and Foundation Models for EDA

## 7.1 LLMs for RTL Design and Verification

Large language models trained on code (GitHub Copilot, AlphaCode, WizardCoder) can generate Verilog from natural language specifications. RTL generation with LLMs is an emerging application: given a behavioral description ("a 16-bit saturating counter with synchronous reset"), an LLM produces synthesizable RTL. Current limitations include:

- Difficulty with timing constraints and high-frequency design conventions
- Limited reasoning about datapath bit widths and sign-extension
- No feedback loop with synthesis tools (hallucinated modules, incorrect port widths)

**LLM-guided bug repair** uses the error messages from synthesis or simulation to iteratively patch RTL. The model learns from the error context to produce fixes analogous to code repair in software.

## 7.2 Foundation Models for Circuit Design

**Circuit foundation models** (CirFM) are large transformer-based models pre-trained on massive circuit datasets (netlists, timing reports, layout files) using self-supervised objectives (masked gate prediction, contrastive netlist embedding). After pre-training, the model is fine-tuned for downstream tasks: timing prediction, placement quality estimation, DRC prediction.

Foundation models offer the promise of a single pre-trained model that generalizes across circuit families and EDA tools — analogous to how LLMs generalize across language tasks. Key open challenges include defining meaningful self-supervised pre-training objectives for circuit data and scaling training to the circuit complexity of modern SoCs.

## 7.3 Integration Challenges

Deploying ML in production EDA flows requires:

- **Interpretability**: EDA engineers must understand why the ML model makes specific recommendations; black-box predictions are insufficient for safety-critical paths.
- **Certification**: predicted timing or power values must be conservatively bounded; optimistic predictions can lead to silicon bugs.
- **Tool integration**: ML models must interface with commercial EDA tool APIs (Tcl scripting in Synopsys/Cadence), complicating deployment.
- **Data availability**: industrial circuit datasets are proprietary; academic benchmarks (EPFL, ITC99, OpenCores) are too small and unrepresentative.

The field is converging toward **human-in-the-loop** workflows where ML proposals are evaluated and curated by experienced engineers, combining the speed of ML with human domain expertise.
