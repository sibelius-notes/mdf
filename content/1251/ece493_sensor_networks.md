---
title: "ECE 493: Intelligent Sensor Networks"
prof: "Otman Basir"
subjects: "ECE"
---

## Sources and References

**Primary references** — Akyildiz, I. F., Su, W., Sankarasubramaniam, Y., & Cayirci, E. (2002). Wireless sensor networks: a survey. *Computer Networks*, 38(4), 393–422. — Karl, H., & Willig, A. (2005). *Protocols and Architectures for Wireless Sensor Networks*. Wiley.

**Supplementary texts** — Eldar, Y. C., & Kutyniok, G. (Eds.). (2012). *Compressed Sensing: Theory and Applications*. Cambridge University Press. — Shuman, D. I., et al. (2013). The emerging field of signal processing on graphs. *IEEE Signal Processing Magazine*, 30(3), 83–98. — Bar-Shalom, Y., Willett, P. K., & Tian, X. (2011). *Tracking and Data Fusion: A Handbook of Algorithms*. YBS Publishing. — Rivest, R. L., Shamir, A., & Adleman, L. (1978). A method for obtaining digital signatures and public-key cryptosystems. *Communications of the ACM*, 21(2), 120–126.

**Online resources** — IEEE IoT Journal (open-access articles); Candès, E. J., & Wakin, M. B. (2008). An introduction to compressive sampling. *IEEE Signal Processing Magazine*, 25(2), 21–30. (Open access); MIT OCW 6.011 Signals, Systems, and Inference for mathematical foundations.

---

# Chapter 1: Introduction to IoT and Sensor Networks

## 1.1 The Internet of Things Landscape

The **Internet of Things (IoT)** refers to the interconnection of physical objects — sensors, actuators, vehicles, appliances, and industrial equipment — through communication networks, enabling them to collect, exchange, and act on data. By 2025, estimates projected more than 31 billion connected IoT devices, transforming manufacturing, healthcare, agriculture, transportation, and smart city infrastructure.

**Wireless sensor networks (WSNs)** are a foundational IoT technology: distributed systems of autonomous low-power devices (**motes** or sensor nodes) that sense physical quantities, process data locally, and communicate wirelessly. Each mote integrates:

- **Sensing unit**: one or more transducers measuring physical quantities (temperature, humidity, acceleration, acoustic pressure, light, gas concentration, biomedical signals).
- **Processing unit**: a microcontroller (ARM Cortex-M, PIC, ATmega) with limited computation and memory.
- **Communication unit**: a low-power radio transceiver (IEEE 802.15.4, LoRa, BLE, Zigbee).
- **Power unit**: battery, energy harvester (solar, vibration, thermal), or wired supply.

The resource constraints — energy, computation, memory, and communication bandwidth — distinguish WSN design from conventional network engineering. Protocols must be **resource-conscious**: energy-efficient routing, duty-cycled radios, in-network processing to reduce transmitted data.

## 1.2 Application Domains

WSN applications span a wide range of deployment environments:

| Domain | Examples | Key Challenges |
|---|---|---|
| Environmental monitoring | Wildfire detection, flood warning, habitat monitoring | Long deployment lifetime, harsh environments |
| Industrial IoT | Machine condition monitoring, predictive maintenance | Low latency, high reliability |
| Healthcare | Wearable vital-sign monitors, fall detection, hospital asset tracking | Privacy, power, real-time alerting |
| Agriculture | Soil moisture, crop disease, livestock tracking | Wide-area coverage, remote deployment |
| Smart city | Traffic monitoring, air quality, smart metering | Large scale, heterogeneous devices |
| Military/security | Perimeter surveillance, chemical/biological detection | Stealth, tamper resistance, security |

**Mission-critical applications** — structural health monitoring, industrial safety, medical telemetry — impose strict reliability, latency, and availability requirements that demand careful protocol design.

## 1.3 Wireless Sensor Architecture and Protocol Stack

The WSN protocol stack mirrors the OSI model but is tailored to resource constraints:

- **Physical layer**: radio modulation, frequency band (typically 2.4 GHz ISM or sub-GHz), link budget.
- **Data link layer**: MAC protocol controlling channel access. Energy is the primary optimization target; duty cycling (sleeping most of the time, waking briefly to transmit/receive) is essential.
- **Network layer**: routing — determining paths for multi-hop communication to the sink node.
- **Transport layer**: end-to-end reliability and congestion control (TCP is too heavyweight; lightweight alternatives like RCRT or PSFQ are used).
- **Application layer**: task scheduling, query processing, data aggregation.

**Cross-layer design** is common in WSNs: the physical layer's link quality estimate informs routing; the MAC layer's duty cycle schedule is coordinated with the routing layer's topology.

---

# Chapter 2: Routing in Sensor Networks

## 2.1 Routing Challenges

WSN routing differs fundamentally from IP routing:

- **Data-centric queries**: data is identified by its content (temperature > 50°C) rather than by node address. Routing must aggregate matching data from multiple nodes.
- **Energy as primary constraint**: shortest-hop routing minimizes latency but exhausts nodes on frequent paths. Energy-balanced routing extends network lifetime.
- **Mobile sinks and nodes**: some applications involve mobile data collectors (unmanned aerial vehicles, robots), requiring dynamic routing adaptation.
- **Self-configuration**: nodes may fail; routing must adapt without centralized management.

## 2.2 Flooding and Gossiping

**Flooding** is the simplest routing strategy: each node rebroadcasts every received packet. Flooding is robust and simple but impractical at scale due to the **broadcast storm**: exponential message proliferation that wastes energy and causes collisions.

**Gossiping** reduces broadcast storm by forwarding only to a randomly selected neighbor (not all neighbors). Gossiping may lead to missed packets in sparse networks.

## 2.3 Directed Diffusion

**Directed diffusion** (Intanagonwiwat et al., 2000) is a data-centric routing protocol:

1. **Interest propagation**: the sink broadcasts an interest (query) for data matching certain attributes (e.g., type = temperature, interval = 10s). Each node sets up gradients toward the sink.
2. **Data propagation**: sources send data back along gradient paths.
3. **Reinforcement**: the sink reinforces the best gradient (shortest, lowest-loss path) by sending higher data rate requests along that path.

Directed diffusion naturally supports aggregation (combining data from multiple sources en route to the sink), reducing total transmitted data.

## 2.4 Geographic Routing

When node positions are known (from GPS or localization), **geographic routing** forwards packets toward the geographic destination. **Greedy forwarding** sends each packet to the neighbor closest to the destination. If no neighbor is closer than the current node (a **local minimum** or **void**), perimeter routing (GPSR, compass routing) follows the Euclidean face of the planar graph around the void.

Geographic routing is scalable (no routing table size proportional to network size) and energy-efficient (short transmissions along near-optimal paths).

---

# Chapter 3: Localization and Synchronization

## 3.1 Localization Methods

**Localization** determines the geographic position of sensor nodes. Methods are classified along two axes:

**Range-based vs. range-free**:
- *Range-based*: use distance or angle measurements between nodes (RSSI, time of arrival, time difference of arrival, angle of arrival) to compute positions geometrically.
- *Range-free*: use only connectivity (whether two nodes are in range) or hop counts; computationally simpler but less accurate.

**Anchor-based vs. anchor-free**:
- *Anchor-based*: a subset of nodes have known positions (GPS receivers or manually placed). Unknown nodes estimate their position relative to anchors.
- *Anchor-free*: computes a relative coordinate system without absolute reference; useful when anchors are unavailable.

## 3.2 Trilateration

**Trilateration** estimates a node's position from distance measurements to three or more anchors. Given anchors at \((x_1,y_1), (x_2,y_2), (x_3,y_3)\) with measured distances \(d_1, d_2, d_3\), the node position \((x,y)\) satisfies:

\[
(x - x_i)^2 + (y - y_i)^2 = d_i^2 \quad i = 1, 2, 3
\]

Subtracting the first equation from the others linearizes the system:

\[
\begin{bmatrix} 2(x_2-x_1) & 2(y_2-y_1) \\ 2(x_3-x_1) & 2(y_3-y_1) \end{bmatrix} \begin{bmatrix} x \\ y \end{bmatrix} = \begin{bmatrix} x_2^2-x_1^2+y_2^2-y_1^2+d_1^2-d_2^2 \\ x_3^2-x_1^2+y_3^2-y_1^2+d_1^2-d_3^2 \end{bmatrix}
\]

With \(m > 3\) anchors, the over-determined system is solved by least squares: \(\hat{p} = (A^T A)^{-1} A^T b\).

## 3.3 Time Synchronization

**Time synchronization** ensures all nodes share a common reference time, necessary for TDMA MAC schedules, event timestamping, and time-of-arrival localization. Challenges:

- **Clock drift**: crystal oscillators drift at 1–100 ppm, causing clocks to diverge by milliseconds per day.
- **Propagation delay**: transmission, propagation, access, and interrupt delays contribute variable and hard-to-predict offsets.

**Reference broadcast synchronization (RBS)** eliminates send-time uncertainty by having a reference node broadcast a beacon to two nodes simultaneously; the nodes exchange their receive timestamps and compute their offset. Only propagation delay (symmetric and small) remains.

**Flooding Time Synchronization Protocol (FTSP)** linearizes the relationship between local and global time, estimates both offset and drift, and converges network-wide through flooding. FTSP achieves microsecond-level accuracy across 10-hop networks.

---

# Chapter 4: Sensor Fusion and Aggregation

## 4.1 Why Sensor Fusion?

Individual sensors have limited accuracy, restricted measurement range, and single-modality sensing. **Sensor fusion** combines data from multiple sensors to produce estimates that are more accurate, more complete, or more robust than any single sensor provides.

Fusion paradigms differ in their treatment of uncertainty:

- **Probabilistic fusion**: models sensor noise statistically (Gaussian, multivariate).
- **Dempster-Shafer evidence theory**: handles epistemic uncertainty (ignorance) separately from aleatory uncertainty (randomness).
- **Fuzzy fusion**: uses fuzzy membership functions instead of probability distributions.

## 4.2 Centralized Kalman Filter

The **Kalman filter** is the optimal estimator for a linear Gaussian state-space model. The system evolves as:

\[
\mathbf{x}_{k+1} = F\mathbf{x}_k + B\mathbf{u}_k + \mathbf{w}_k, \quad \mathbf{w}_k \sim \mathcal{N}(0, Q)
\]

\[
\mathbf{z}_k = H\mathbf{x}_k + \mathbf{v}_k, \quad \mathbf{v}_k \sim \mathcal{N}(0, R)
\]

where \(\mathbf{x}_k\) is the state, \(\mathbf{z}_k\) is the observation, \(F\) is the state transition matrix, \(H\) is the observation matrix, \(Q\) is process noise covariance, and \(R\) is measurement noise covariance.

The Kalman filter iterates two steps:

**Prediction**:

\[
\hat{\mathbf{x}}_{k|k-1} = F\hat{\mathbf{x}}_{k-1|k-1}, \quad P_{k|k-1} = FP_{k-1|k-1}F^T + Q
\]

**Update** (given measurement \(\mathbf{z}_k\)):

\[
K_k = P_{k|k-1}H^T(HP_{k|k-1}H^T + R)^{-1}
\]

\[
\hat{\mathbf{x}}_{k|k} = \hat{\mathbf{x}}_{k|k-1} + K_k(\mathbf{z}_k - H\hat{\mathbf{x}}_{k|k-1})
\]

\[
P_{k|k} = (I - K_k H)P_{k|k-1}
\]

The **Kalman gain** \(K_k\) balances prediction uncertainty \(P_{k|k-1}\) against measurement noise \(R\). When \(R \to 0\), \(K_k \to H^{-1}\) (trust the measurement); when \(Q \to 0\), \(K_k \to 0\) (trust the prediction).

## 4.3 Distributed Kalman Filter

In a WSN, sensors distributed over a geographic area each observe a local portion of the state. Centralizing all raw observations at a fusion center requires high communication bandwidth and creates a single point of failure. The **distributed Kalman filter** partitions the fusion task across the network.

In the **consensus-based distributed Kalman filter**, each sensor node \(i\) maintains a local estimate \(\hat{x}_i\) and precision matrix \(\Omega_i\). Nodes iterate:

1. Observe \(z_i\) and compute local measurement update.
2. Exchange estimates with neighbors.
3. Run consensus averaging to mix local and neighbor estimates.
4. Apply time update (prediction step) locally.

Under mild conditions (connected network, compatible noise models), the consensus filter converges to the centralized Kalman filter estimate.

## 4.4 Dempster-Shafer Theory

The **Dempster-Shafer (DS) theory of evidence** models uncertainty about a variable taking one of \(n\) possible values (the **frame of discernment** \(\Theta\)). A **basic probability assignment (BPA)** \(m: 2^\Theta \to [0,1]\) assigns probability mass to subsets of \(\Theta\):

\[
m(\emptyset) = 0, \quad \sum_{A \subseteq \Theta} m(A) = 1
\]

The **belief function** \(Bel(A)\) and **plausibility function** \(Pl(A)\) bound the probability that event \(A\) occurred:

\[
Bel(A) = \sum_{B \subseteq A} m(B), \quad Pl(A) = \sum_{B \cap A \neq \emptyset} m(B)
\]

**Dempster's combination rule** fuses two independent evidence sources \(m_1\) and \(m_2\):

\[
m_{12}(A) = \frac{\sum_{B \cap C = A} m_1(B) m_2(C)}{1 - \sum_{B \cap C = \emptyset} m_1(B) m_2(C)}
\]

The denominator normalizes for the conflict between sources. DS theory is particularly useful when evidence is incomplete or paradoxical, situations where Bayesian probability assignment is undefined.

## 4.5 Q-Digest

**Q-digest** is a data structure for distributed quantile estimation in sensor networks. Each sensor maintains a compact summary (a balanced binary tree over the value domain); summaries are merged in-network as data flows toward the sink, producing approximate quantile estimates (median, 90th percentile) with bounded error and low communication cost.

---

# Chapter 5: Compressive Sensing

## 5.1 The Sampling Theorem and Its Limits

The Nyquist-Shannon theorem states that a signal with bandwidth \(W\) must be sampled at rate \(\geq 2W\) to enable perfect reconstruction. In WSNs, many signals of interest (seismic, acoustic, vibration) have high bandwidth but are **sparse** in some domain: they can be described by few non-zero coefficients in a transformed basis. Compressive sensing (CS) exploits sparsity to reduce the sampling rate below Nyquist.

## 5.2 Sparse Representations

A signal \(\mathbf{x} \in \mathbb{R}^N\) is **\(s\)-sparse** in a basis \(\Psi\) if its representation \(\boldsymbol{\theta} = \Psi^{-1} \mathbf{x}\) has at most \(s \ll N\) non-zero components:

\[
\mathbf{x} = \Psi \boldsymbol{\theta}, \quad \|\boldsymbol{\theta}\|_0 = s
\]

Common sparsifying bases:
- **Fourier basis**: sinusoidal signals are sparse in frequency.
- **Wavelet basis**: piecewise-smooth signals are sparse in wavelet coefficients.
- **Discrete cosine transform (DCT)**: natural images and audio are sparse in DCT domain.

A signal is **compressible** if its coefficients decay rapidly when sorted by magnitude — not exactly sparse, but well-approximated by an \(s\)-sparse signal.

## 5.3 Compressive Measurements

Instead of sampling at Nyquist rate and then compressing, CS acquires \(M \ll N\) linear measurements:

\[
\mathbf{y} = \Phi \mathbf{x} = \Phi \Psi \boldsymbol{\theta} = A \boldsymbol{\theta}
\]

where \(\Phi \in \mathbb{R}^{M \times N}\) is the **sensing matrix** and \(A = \Phi\Psi\) is the **measurement matrix**. Recovery of \(\boldsymbol{\theta}\) from \(\mathbf{y}\) is underdetermined (\(M < N\)) but feasible if \(A\) satisfies the **Restricted Isometry Property (RIP)**:

<div class="definition">
A matrix \(A\) satisfies the RIP of order \(s\) with constant \(\delta_s\) if for all \(s\)-sparse vectors \(\boldsymbol{\theta}\):

\[
(1 - \delta_s)\|\boldsymbol{\theta}\|_2^2 \leq \|A\boldsymbol{\theta}\|_2^2 \leq (1 + \delta_s)\|\boldsymbol{\theta}\|_2^2
\]
</div>

RIP ensures that distinct sparse signals produce distinct measurements. Random Gaussian matrices \(\Phi_{ij} \sim \mathcal{N}(0, 1/M)\) satisfy RIP with high probability when \(M \geq Cs \log(N/s)\) for a universal constant \(C\). This is a major advantage: CS requires only \(O(s \log N)\) measurements, far fewer than the Nyquist rate \(N\), for signals sparse in a known basis.

## 5.4 Signal Recovery

Given measurements \(\mathbf{y} = A\boldsymbol{\theta} + \mathbf{n}\) (with noise \(\mathbf{n}\)), recovery solves:

**Basis Pursuit Denoising (BPDN)** — an \(\ell_1\)-norm minimization:

\[
\hat{\boldsymbol{\theta}} = \arg\min_{\boldsymbol{\theta}} \|\boldsymbol{\theta}\|_1 \quad \text{subject to} \quad \|A\boldsymbol{\theta} - \mathbf{y}\|_2 \leq \epsilon
\]

The \(\ell_1\) penalty promotes sparsity: the \(\ell_1\) ball's corners coincide with sparse vectors. BPDN is a convex program solvable by interior-point methods or first-order algorithms (ADMM, ISTA, FISTA).

<div class="theorem">
<strong>Recovery Guarantee</strong>. If \(A\) satisfies RIP of order \(2s\) with \(\delta_{2s} < \sqrt{2} - 1\), and \(\|\mathbf{n}\|_2 \leq \epsilon\), then BPDN recovers \(\hat{\boldsymbol{\theta}}\) with:

\[
\|\hat{\boldsymbol{\theta}} - \boldsymbol{\theta}\|_2 \leq C_0 \epsilon + C_1 \frac{\|\boldsymbol{\theta} - \boldsymbol{\theta}_s\|_1}{\sqrt{s}}
\]

where \(\boldsymbol{\theta}_s\) is the best \(s\)-sparse approximation of \(\boldsymbol{\theta}\).
</div>

**Greedy methods** — Matching Pursuit (MP), Orthogonal Matching Pursuit (OMP), and CoSaMP — iteratively identify the support of \(\boldsymbol{\theta}\) by selecting atoms (columns of \(A\)) most correlated with the residual. OMP is computationally cheaper than BPDN but requires knowledge of sparsity level \(s\).

---

# Chapter 6: Graph Signal Processing

## 6.1 Graphs as Sensor Network Models

A WSN deployed over a geographic area is naturally modeled as a graph \(G = (V, E, W)\): nodes \(V\) are sensor nodes, edges \(E\) represent communication links, and weights \(W_{ij}\) encode link quality or spatial proximity. **Graph signal processing (GSP)** extends classical signal processing concepts (frequency, filtering, sampling) to signals defined on irregular graphs.

A **graph signal** is a function \(f: V \to \mathbb{R}\) assigning a scalar value to each node. The vector \(\mathbf{f} \in \mathbb{R}^N\) (ordered by node index) represents the signal. In a temperature sensor network, \(f_i\) is the temperature measured at node \(i\).

## 6.2 Graph Laplacian and Spectral Theory

The **graph Laplacian** \(L = D - W\) encodes the graph topology, where \(D\) is the degree matrix (\(D_{ii} = \sum_j W_{ij}\)). \(L\) is symmetric positive semi-definite with eigenvectors \(\mathbf{u}_0, \mathbf{u}_1, \ldots, \mathbf{u}_{N-1}\) and eigenvalues \(0 = \lambda_0 \leq \lambda_1 \leq \cdots \leq \lambda_{N-1}\).

The **graph Fourier transform (GFT)** of signal \(\mathbf{f}\) is:

\[
\hat{f}(\lambda_k) = \langle \mathbf{f}, \mathbf{u}_k \rangle = \sum_{i} f_i u_k(i)
\]

The eigenvectors \(\mathbf{u}_k\) play the role of complex exponentials; eigenvalues \(\lambda_k\) represent **graph frequencies**. Low-frequency components (small \(\lambda_k\)) correspond to smooth variations across the graph (neighboring nodes have similar values); high-frequency components correspond to rapidly varying signals.

## 6.3 Graph Filtering

A **graph filter** with frequency response \(h(\lambda)\) operates in the spectral domain:

\[
\hat{g}(\lambda_k) = h(\lambda_k) \hat{f}(\lambda_k)
\]

In the vertex domain, the filtered signal is:

\[
\mathbf{g} = U \text{diag}(h(\boldsymbol{\lambda})) U^T \mathbf{f}
\]

where \(U = [\mathbf{u}_0, \ldots, \mathbf{u}_{N-1}]\) is the eigenvector matrix.

**Polynomial filters** \(h(L) = \sum_{k=0}^K a_k L^k\) are localized in the vertex domain: the filter at node \(i\) combines only the signal values within \(K\) hops. This is critical for distributed implementation: a \(K\)-hop filter requires only \(K\) rounds of neighbor communication.

**Graph wavelet transforms** — spectral graph wavelets localized at different scales and centers — provide a multi-resolution analysis of graph signals. They enable compression of sensor data with sparse graph wavelet coefficients, the graph analog of classical wavelet compression.

## 6.4 Applications of GSP in Sensor Networks

- **Distributed denoising**: low-pass graph filtering reduces measurement noise while preserving spatial correlation structure. The filter preserves low-frequency spatial trends and suppresses high-frequency noise.
- **Anomaly detection**: graph signals that deviate from smooth spatial variation (high \(\lambda_k\) energy) flag potential sensor faults or environmental anomalies.
- **Compressive sensing on graphs**: if the graph signal is sparse in the GFT domain, CS recovery algorithms (with sensing matrix columns drawn from graph Fourier modes) apply directly.

---

# Chapter 7: Security and Blockchain in WSN

## 7.1 Security Threats

WSN security threats differ from conventional network security:

- **Physical attacks**: sensor nodes in unattended deployments can be physically captured; an attacker extracts keys or installs malicious firmware.
- **Denial of service (DoS)**: radio jamming, replay attacks, or flooding the network with spurious packets.
- **Routing attacks**: Sybil attack (one node claims multiple identities), wormhole (a malicious tunnel creates a shortcut that attracts traffic), sink hole (a node advertises falsely good routing metrics).
- **Data injection**: compromised nodes inject false readings, misleading the fusion center.

## 7.2 Lightweight Cryptography

Standard cryptographic algorithms (AES-256, RSA, ECDSA) are too computationally and energy-intensive for resource-constrained sensor nodes. **Lightweight cryptography** addresses this with algorithms designed for minimal hardware footprint:

- **SIMON and SPECK** (NSA): ultra-compact block ciphers for 8-bit microcontrollers; SIMON uses only AND/XOR/shift operations, fitting in < 1000 gate equivalents.
- **PRESENT**: 64-bit block cipher designed for RFID and WSN, requiring only ~1570 gate equivalents — 6× smaller than AES-128.
- **ChaCha20**: a stream cipher suitable for software-only implementations on embedded ARM Cortex-M, faster than AES without hardware acceleration.
- **NIST Lightweight Cryptography Standard (2023)**: standardized ASCON for authenticated encryption and hashing on constrained devices.

**Key management** in WSNs: symmetric key distribution at deployment time (pre-loaded keys), pairwise key establishment protocols (SPINS, TinyECC), or hierarchical key trees for group communication.

## 7.3 Blockchain for IoT Security

**Blockchain** is a distributed, append-only ledger secured by cryptographic hash chains. Each block contains a hash of the previous block, a timestamp, and transaction data. Consensus mechanisms (Proof of Work, Proof of Stake, PBFT for permissioned blockchains) ensure all participants agree on the chain state without a central authority.

**IoT applications of blockchain**:

- **Data integrity**: sensor readings stored on a blockchain are tamper-evident — any modification changes the block hash and breaks the chain, detectable by all participants.
- **Decentralized access control**: smart contracts (self-executing code on the blockchain) enforce access policies without a central access-control server.
- **Supply chain tracking**: end-to-end traceability of goods with sensor readings (temperature, humidity) recorded immutably from production to delivery.

**Challenges**: conventional PoW blockchains (Ethereum, Bitcoin) are too computationally intensive for IoT nodes. **Lightweight blockchain protocols** — IOTA (directed acyclic graph instead of linear chain), Hyperledger Fabric (permissioned, PBFT consensus) — reduce computational overhead. IOTA's Tangle DAG assigns each transaction the task of validating two previous transactions, distributing consensus across the network without miners.

---

# Chapter 8: Big Data and AI in Sensor Networks

## 8.1 Sensor Networks as Big Data Sources

A WSN with 10,000 nodes each generating one reading per second produces 864 million readings per day — a classic Big Data challenge in terms of volume, velocity, and variety. Big Data infrastructure for IoT includes:

- **Edge computing**: process data locally at the sensor node or nearby gateway, reducing transmitted volume by filtering, aggregation, and local inference. Embedded AI (TinyML) runs lightweight inference on microcontrollers using quantized models.
- **Fog computing**: intermediate processing at local servers (Raspberry Pi, industrial gateways) between the sensor tier and cloud.
- **Cloud computing**: centralized storage and large-scale analytics (Apache Kafka for stream processing, Apache Spark for batch analytics, time-series databases like InfluxDB or TimescaleDB for sensor data).

## 8.2 Embedded and Tiny AI

**TinyML** deploys trained machine learning models on microcontrollers (ARM Cortex-M, RISC-V, ESP32) with < 1 MB of RAM. The deployment pipeline involves:

1. Train a full-precision model (float32) on a server.
2. **Quantize** weights and activations to 8-bit integers (INT8) or 4-bit using post-training quantization or quantization-aware training.
3. **Prune** redundant weights (set to zero; exploit sparsity in inference).
4. Convert to a platform-specific format (TensorFlow Lite, ONNX) and deploy on the target microcontroller.

TinyML enables on-device anomaly detection (vibration signatures for predictive maintenance), keyword spotting (voice activation with < 20 μJ per inference), and image classification for defect detection — all without cloud connectivity.

## 8.3 Clustering and Network Management

To reduce energy consumption and extend network lifetime, WSNs are often organized into **clusters**: groups of nearby nodes that communicate through a **cluster head** (CH). The CH aggregates cluster members' data and forwards the result to the sink, eliminating redundant transmissions.

**LEACH (Low Energy Adaptive Clustering Hierarchy)** rotates the cluster-head role randomly among all nodes, distributing energy expenditure:

- Each node elects itself as CH with probability \(p^*/(1 - p^* \cdot (r \mod 1/p^*))\) where \(p^*\) is the desired fraction of CHs and \(r\) is the round number.
- Cluster members transmit to the CH using TDMA; CH performs data fusion and relays to the sink.

LEACH extends network lifetime approximately \(7\times\) compared to direct-to-sink transmission. Variants (LEACH-C with centralized CH selection, EEHC with energy-weighted CH probability) improve performance in non-uniform energy distributions.
