---
title: "ECE 493: On-Chip Interconnect"
prof: "Nachiket Kapre"
subjects: "ECE"
---

## Sources and References

**Primary textbooks** — Dally, W. J., & Towles, B. P. (2004). *Principles and Practices of Interconnection Networks*. Morgan Kaufmann. — Jerger, N. D., Peh, L.-S., & Lipasti, M. H. (2017). *On-Chip Networks* (2nd ed.). Morgan & Claypool. (Free online)

**Supplementary texts** — Sorin, D. J., Hill, M. D., & Wood, D. A. (2011). *A Primer on Memory Consistency and Cache Coherence*. Morgan & Claypool. (Free online) — Le Boudec, J.-Y., & Thiran, P. (2001). *Network Calculus: A Theory of Deterministic Queuing Systems for the Internet*. Springer. — Duato, J., Yalamanchili, S., & Ni, L. (2003). *Interconnection Networks: An Engineering Approach*. Elsevier.

**Key papers** — Dally, W., & Towles, B. (2001). Route packets, not wires: On-chip interconnection networks. *DAC 2001*, 684–689. — Dally, W. J. (1990). Virtual-channel flow control. *ISCA 1990*. — Sewell, K., et al. (2012). On-chip networks from a networking perspective. *SIGCOMM 2012*. — Kim, J., et al. (2008). Technology-driven, highly-scalable dragonfly topology. *ISCA 2008*.

**Online resources** — Nocs.community (NoC research community); IEEE TPDS (parallel and distributed systems); Luca Carloni's NoC lecture notes (Columbia University COMS W4824).

---

# Chapter 1: Introduction to Networks-on-Chip

## 1.1 The Case for Networks-on-Chip

As chip designs scaled beyond 10 million gates, the traditional **global wire bus** became a severe bottleneck. A bus is a shared medium: only one transaction can traverse it per cycle, and its RC delay grows quadratically with length in deep submicron technologies. Dally and Towles (2001) argued for replacing global buses with **packet-switched networks-on-chip (NoCs)**: regular, composable interconnect fabrics where communication is decomposed into packets that traverse a network of routers.

The key advantages of NoC over bus and point-to-point:

| Property | Bus | Point-to-Point | NoC |
|---|---|---|---|
| Bandwidth | Shared (O(1)) | O(terminals²) wires | O(bisection width) |
| Latency | Shared, high contention | One hop | Multiple hops, pipelined |
| Scalability | Poor | Exponential wire count | Good |
| Power | Long global wire | Many dedicated wires | Distributed, shorter wires |
| Design complexity | Low | High | Moderate (reused routers) |

NoCs are now ubiquitous: ARM AMBA interconnect fabrics, Intel's ring bus in Core i7, GPU crossbars, and Apple's die-to-die fabric in M-series chips all implement NoC principles.

## 1.2 Wiring Delay and Energy in Silicon

Wire delay in CMOS technology is governed by the RC model. A wire of length \(L\), width \(W\), and height \(H\) has resistance \(R = \rho L / (WH)\) and capacitance \(C = \epsilon_0 \epsilon_r L W / d_{\text{gap}}\) per unit length. The signal propagation delay through an undriven wire is:

\[
t_{\text{wire}} \approx 0.69 RC = 0.69 \rho \epsilon_0 \epsilon_r \frac{L^2}{H \cdot d_{\text{gap}}}
\]

This scales as \(L^2\): doubling wire length quadruples delay. At 7nm, a 1mm global wire has ~1ns delay — comparable to a clock cycle. Wire energy per bit is:

\[
E_{\text{wire}} = \alpha C_{\text{wire}} V_{DD}^2
\]

where \(\alpha\) is the switching activity factor. Modern chip interconnect dissipates 50–80% of total dynamic power.

**Repeater insertion** breaks a long wire into segments, each driven by a buffer, reducing delay from \(O(L^2)\) to \(O(L)\). Optimal repeater sizing and spacing is a standard wire design task.

## 1.3 Rent's Rule

**Rent's rule** (Rent, 1960; Landman & Russo, 1971) is an empirical observation about the relationship between the number of logic gates \(g\) in a module and the number of I/O pins \(p\) at its interface:

\[
p = k \cdot g^r
\]

where \(k\) is the average pins-per-gate ratio and \(r\) is the **Rent exponent** (\(0 \leq r \leq 1\)). \(r = 1\) implies linear growth (communication-intensive, e.g., crossbar); \(r = 0\) implies constant pins (communication-limited, e.g., systolic array).

Rent's rule implies the **wirelength distribution** in a circuit. For a hierarchically placed circuit, the fraction of wires spanning \(\ell\) tiers of the placement hierarchy scales as \(\ell^{-2r}\). The total wirelength scales as:

\[
W_{\text{total}} \propto g^{1 + r(d-1)/d}
\]

in \(d\) dimensions. In 2D, \(W_{\text{total}} \propto g^r \sqrt{g} = g^{1/2 + r/2}\).

Rent's rule informs NoC design: circuits with high \(r\) require high-bisection-bandwidth networks, while circuits with low \(r\) are better served by nearest-neighbor topologies. Implications include bounds on the minimum number of NoC wires for a given circuit complexity.

---

# Chapter 2: Network Topology

## 2.1 Topology Metrics

A network topology is described by its graph \(G = (V, E)\): nodes \(V\) are routers (plus endpoint nodes), edges \(E\) are physical links. Key metrics:

- **Degree** \(k\): number of links per router. Determines router port count and area.
- **Diameter** \(D\): maximum shortest-path hop count. Determines worst-case latency.
- **Bisection bandwidth (BW)**: minimum cut bandwidth across the network bisection, normalized by total endpoints. Determines under-load throughput.
- **Radix-diameter product**: \(k \cdot D\). For fixed wire count, a low radix-diameter product indicates an efficient topology.

## 2.2 Crossbar

A **crossbar** connects \(n\) inputs to \(n\) outputs via an \(n \times n\) switch matrix. Every input-output pair can communicate simultaneously (when the permutation is non-conflicting). A crossbar achieves full bandwidth (bisection bandwidth = \(n\)) but requires \(O(n^2)\) switch area and \(O(n^2)\) wires. Crossbars are practical for \(n \leq 16\) within a single router; they are impractical as a chip-wide interconnect for large \(n\).

A **crosspoint** is a single input-output intersection: a transmission gate (pass transistor) in full-custom silicon, a mux in synthesized CMOS, or a connection element in an FPGA. The crossbar latency is one gate delay (or one pipeline stage).

## 2.3 Ring and Mesh Topologies

**Ring** (\(n\) nodes, degree 2): nodes connect in a cycle. Diameter \(= n/2\). Bisection bandwidth \(= 2\) (two links cross the bisection). Simple to wire; used in Intel's ring bus (up to ~20 cores). At higher core counts, ring contention limits throughput.

**2D Mesh** (\(\sqrt{n} \times \sqrt{n}\) array, degree 4): routers connect to nearest neighbors. Diameter \(= 2(\sqrt{n}-1)\). Bisection bandwidth \(= \sqrt{n}\). Area scales with \(n\); wires are short (nearest neighbor). Standard topology for academic NoC research; used in Intel Terascale demo (80-tile CMP, 2007) and Tilera TilePro (64-tile chip).

**Torus**: a mesh with wrap-around edges, reducing diameter to \(\sqrt{n}\). Wrap-around wires are long (cross the die), increasing power and delay. 2D torus is common in HPC networks (Cray Gemini, IBM BG/Q).

**Fat tree**: a binary or k-ary tree with increasing bandwidth toward the root. Bisection bandwidth is full (\(= n/2\) edges at the root). Fat trees are standard in HPC (InfiniBand Clos networks, many-core GPU interconnects). The bandwidth concentration toward the root requires thicker links or multiple root nodes.

## 2.4 Dragonfly Topology

The **Dragonfly** (Kim et al., ISCA 2008) targets high-radix, low-diameter networks for large-scale systems. A Dragonfly consists of groups of routers, with all-to-all connectivity within each group (using high-radix routers), and a single global link between each pair of groups.

For \(g\) groups, each with \(a\) routers of radix \(k\), the all-to-all within a group requires \(a(a-1)/2\) intra-group links. The diameter is 3 hops (source group → global link → destination group). The all-to-all global links make the network topology **non-blocking** at two hops between groups.

Adaptive routing is critical in Dragonfly: load-dependent routing chooses global links based on current congestion rather than shortest-path minimally routing, which can cause load imbalance on global links.

---

# Chapter 3: Routing Algorithms

## 3.1 Deterministic Routing

**Dimension-order routing (DOR)** — the simplest routing algorithm for mesh networks — routes packets first in the \(x\)-direction, then in the \(y\)-direction. DOR is **deterministic**: the path from source to destination is uniquely determined by the addresses. Advantages: simple to implement (no state required beyond source and destination address), inherently deadlock-free on meshes.

A route function \(f(\text{src}, \text{dst}) \to \text{port}\) maps the current router location and destination to an output port. For XY routing in a 2D mesh:

```
if dst.x > cur.x:  send East
elif dst.x < cur.x: send West
elif dst.y > cur.y: send North
else:               send South
```

Deterministic routing suffers from load imbalance: if traffic is non-uniform, some links become bottlenecks while others are underutilized.

## 3.2 Adaptive Routing and the Turn Model

**Adaptive routing** chooses among multiple minimal (or non-minimal) paths based on current network state (congestion, credit availability). Adaptive routing improves load balancing but introduces deadlock risk: packets can form circular dependencies on resources.

**Deadlock** in interconnection networks arises from cyclic dependencies: a set of packets each hold a resource and wait for a resource held by another packet in the cycle. For a 2D mesh, a cyclic dependency on virtual channels can form if packets can route in all four turns.

The **Turn Model** (Glass & Ni, 1992) proves that prohibiting just two turns in a network of \(N\) routers suffices to break all cycles. For a mesh with cardinal directions {N,E,W,S}, the **XY turn model** prohibits:
- N→E, N→W (north-to-east and north-to-west turns)
- S→E, S→W (south-to-east and south-to-west turns)

This ensures routing always decreases in one dimension before the other — precisely XY routing, which is deadlock-free. Permitting all other turns allows significant routing flexibility while preserving deadlock freedom.

## 3.3 Virtual Channels and Deadlock Freedom

A **virtual channel (VC)** is a logical queue within a physical link. Multiple VCs share the same physical wires but maintain independent buffer queues. VCs are the primary mechanism for separating traffic classes and breaking deadlock dependencies:

- In a minimal mesh, two VCs per link suffice to support both adaptive routing and deadlock freedom (by reserving one VC class for escape routing).
- In fat trees, VCs separate upward from downward traffic.

VCs were introduced by Dally (ISCA 1990) specifically to break deadlock in hypercube networks without restricting routing. The trade-off: VCs increase router area (more buffers) and complexity (VC allocation logic).

## 3.4 Deflection Routing

**Deflection (hot-potato) routing** eliminates buffers entirely: a packet that cannot proceed to its preferred output is deflected to another output, continuing to move through the network. Without buffers, the router area is minimal — attractive for FPGA overlays where BRAM is scarce.

The **Hoplite** NoC (Kapre & Gray, FPL 2015) implements deflection routing on FPGA using LUT resources for switching logic, achieving 1-cycle-per-hop latency for a \(k \times k\) torus. Hoplite's regular structure and absence of VC buffers make it area-efficient for FPGA implementation — 2–4× smaller than buffered NoC implementations.

Deflection routing guarantees packet delivery (no deadlock since no resources are held) but can cause packet reordering and wasted bandwidth when packets are deflected away from their destination.

---

# Chapter 4: Flow Control

## 4.1 Granularity of Flow Control

Flow control governs how a sender matches its transmission rate to the receiver's capacity. In interconnection networks, flow control operates at three granularities:

**Message-level flow control**: the sender requests a complete path through the network before transmitting. Circuit-switching in telephone networks uses this model. High overhead for short messages; rarely used in NoC.

**Packet-level flow control**: the network is circuit-free; each packet is independently routed and buffered at each hop. If a buffer is full, the upstream router stalls (**stall-and-wait**) or deflects the packet.

**Flit-level flow control**: packets are subdivided into **flits** (flow control units). The head flit carries routing information; body flits follow the path established by the head; the tail flit signals end-of-packet. Flit-level flow control allows **wormhole routing**: a packet occupies only one flit buffer at each intermediate router, dramatically reducing buffering requirements.

## 4.2 Credit-Based Flow Control

**Credit-based flow control** prevents overflow without requiring explicit stall signals. The downstream router initializes a credit counter at the upstream router equal to its buffer depth. Each flit transmitted decrements the credit counter; each flit consumed by the downstream buffer returns a credit. When credits reach zero, the upstream router halts transmission.

Credit-based flow control operates at **flit granularity** and is the standard mechanism for wormhole-routed NoCs. Credit return latency determines the minimum buffer depth required to avoid bubble formation (stalls propagating upstream).

For a round-trip latency of \(L\) cycles between upstream and downstream buffers, the minimum buffer depth to avoid stalls is:

\[
B_{\min} = L \cdot \text{injection rate}
\]

## 4.3 On-Off Flow Control and Bubble Flow Control

**On-off flow control** uses a binary signal: when the downstream buffer fills above a threshold, it asserts a "stop" signal to the upstream; when it drains below a threshold, it asserts "go". Simpler than credit-based but coarser control — the off-signal must propagate upstream before a stall occurs, requiring a hysteresis gap between thresholds.

**Bubble flow control** for rings and tori: a **bubble** (empty slot guaranteed to circulate) prevents deadlock from full rings. If every slot on the ring is occupied, head-of-line blocking creates a deadlock. Reserving one slot as a perpetually empty bubble ensures at least one slot is always available.

## 4.4 Virtual Channel Allocation

In a VC-based router, multiple packets may compete for VCs on the same output port. The **VC allocator** must assign a free VC on the next link to each head flit requesting one. Two classic arbitration policies:

**Round-robin with priority**: each output VC maintains a round-robin pointer across requesting input VCs. Fairness is guaranteed; no starvation.

**iSLIP** (McKeown, 1999): an iterative matching algorithm that runs multiple rounds of request-grant-accept to resolve conflicts. Converges to maximal matching in \(O(\log n)\) iterations.

---

# Chapter 5: Router Microarchitecture

## 5.1 Router Pipeline

A typical NoC router implements a five-stage pipeline:

1. **Route Computation (RC)**: decode the destination address and determine the output port (or set of ports for adaptive routing).
2. **Virtual Channel Allocation (VA)**: assign a free downstream VC to the head flit.
3. **Switch Allocation (SA)**: arbitrate for the crossbar output port.
4. **Switch Traversal (ST)**: traverse the crossbar from the input buffer to the output buffer.
5. **Link Traversal (LT)**: transmit the flit on the physical link to the next router.

Head flits traverse all five stages; body flits skip RC and VA (they inherit the route and VC from the head) and execute only SA, ST, and LT — a three-stage pipeline for body flits.

**Speculative allocation** overlaps VA and SA for head flits, assuming the VC allocation will succeed. If it fails, the speculative grant is revoked and the body flits are stalled. Speculation reduces latency by one cycle at the cost of occasional wasted cycles.

## 5.2 Crossbar Design

The crossbar inside the router is the primary area and power consumer. For an \(n\)-port router (with multiple VCs per port), the crossbar is an \(n \times n\) switch (or larger, if VCs are demultiplexed before the crossbar).

The crossbar is typically implemented as:
- **Mux-based**: each output selects among inputs using a wide mux. Simple, area scales as \(O(n^2)\).
- **Bus-based**: outputs are wired-ORed with precharge; only one driver active per output per cycle. Simpler but slower.
- **Segmented crossbar**: crossbar is broken into segments for long-distance signals, each segment buffered.

**Arbitration** selects one input for each output port. Standard algorithms include separable allocators (row arbiters select a winner per output, column arbiters select a winner per input) and iterative matching (iSLIP).

## 5.3 Analytical Performance Models

The **queuing model** for an input-buffered router approximates per-packet latency as:

\[
L_{\text{packet}} = L_{\text{ideal}} + L_{\text{contention}}
\]

For a packet of \(F\) flits with per-hop router latency \(h\) and link traversal \(1\) cycle:

\[
L_{\text{ideal}} = (h + 1) \cdot D + (F - 1)
\]

where \(D\) is the hop count (diameter) and \((F-1)\) accounts for pipelining the flit train. Contention latency \(L_{\text{contention}}\) depends on offered traffic load \(\rho\):

\[
L_{\text{contention}} \approx \frac{\rho}{1 - \rho} \cdot h
\]

(M/D/1 approximation). As \(\rho \to 1\) (saturation), latency diverges. The **saturation throughput** is the injection rate at which average latency exceeds a specified threshold (commonly \(2\times\) the zero-load latency).

---

# Chapter 6: Client Microarchitecture and Network Calculus

## 6.1 Injection Regulation

A **client** (endpoint, or **network interface unit**, NIU) connects a computational core to the NoC. The injection rate of a client determines the offered load on the first-hop router. Bursty clients can momentarily inject at rates far exceeding the sustained average, causing **head-of-line blocking** and buffer overflow.

**Leaky bucket regulation** enforces a maximum sustained injection rate \(r\) while allowing bursts up to depth \(b\). The bucket is filled at rate \(r\) (up to capacity \(b\)) and drained by each transmitted packet. If the bucket is empty, the client must wait.

**Token bucket** allows bursts: tokens accumulate at rate \(r\) up to \(b\) tokens; each packet consumes one token. Token bucket permits short-duration rate bursts of up to \(b\) packets followed by sustained rate \(r\). The key distinction from leaky bucket is that the output rate can exceed \(r\) transiently.

## 6.2 Network Calculus — Service Curves

**Network Calculus** (Le Boudec & Thiran, 2001) provides a deterministic worst-case analysis of queuing systems using arrival and service curves.

An **arrival curve** \(\alpha(t)\) bounds the traffic arrival: the number of bits arriving in any interval of length \(t\) is at most \(\alpha(t)\). A token bucket with rate \(r\) and burst \(b\) defines an arrival curve \(\alpha(t) = rt + b\).

A **service curve** \(\beta(t)\) specifies the guaranteed service to a flow: the backlog is served within a time corresponding to the inverse of \(\beta\). For a constant-rate server with rate \(C\) and latency \(T\):

\[
\beta(t) = C(t - T)^+
\]

The **delay bound** for a flow with arrival curve \(\alpha\) through a server with service curve \(\beta\) is:

\[
d_{\max} = \sup_{t \geq 0} \left\{ \inf\{\tau \geq 0 : \alpha(t) \leq \beta(t + \tau)\} \right\}
\]

This gives the horizontal deviation between \(\alpha\) and \(\beta\). For a token bucket arrival \(rt + b\) and rate-latency service \(C(t-T)^+\):

\[
d_{\max} = T + \frac{b}{C}
\]

Network calculus applies to NoCs by modeling each router as a server with a service curve, and chaining service curves across hops to bound end-to-end delay — essential for real-time NoC analysis.

## 6.3 HopliteRT — Real-Time FPGA NoC

**HopliteRT** extends the Hoplite deflection-routed NoC with real-time guarantees. Each source is assigned a transmission slot in a time-division schedule, ensuring worst-case bounded latency independent of other traffic. The schedule is computed offline to guarantee every flow meets its deadline.

Network calculus analysis of HopliteRT: with token bucket arrivals and periodic service allocation, the worst-case end-to-end delay for a real-time flow is bounded by the sum of transmission delays and the worst-case deflection delay (bounded by the network diameter). HopliteRT achieves deterministic latency bounds comparable to TDMA-based solutions at lower area cost.

---

# Chapter 7: Cache Coherence and NoC

## 7.1 Cache Coherence Basics

In a multi-core system, each core has a private L1 and optionally L2 cache. Coherence ensures that all cores observe a consistent view of shared memory: a read following a write should return the written value, regardless of which core performs each operation.

**MESI protocol** (Modified, Exclusive, Shared, Invalid): the four states track the cache line's status:

- **Modified (M)**: only copy; locally written (dirty); must write back before sharing.
- **Exclusive (E)**: only copy; clean; no write-back needed on eviction.
- **Shared (S)**: multiple copies; clean; must invalidate before writing.
- **Invalid (I)**: no valid copy; must fetch before access.

State transitions are triggered by processor events (read, write, evict) and network messages (invalidate, fetch, read-exclusive). The coherence protocol specifies legal state transitions and the messages exchanged.

## 7.2 Directory Coherence for NoC-Based Multiprocessors

Snooping-based coherence (all caches monitor a shared bus) does not scale beyond ~16 cores because the shared bus becomes a bottleneck. **Directory-based coherence** eliminates the shared bus: a centralized (or distributed) directory tracks which caches hold each cache line. Coherence actions are unicast point-to-point messages routed through the NoC.

**MSI protocol** (simplified MESI): the directory maintains for each cache line a state (Uncached/Clean/Modified) and a sharers list (bitvector of caches holding the line).

- **Read miss**: requestor sends *GetS* to directory. If line is in M state at another cache (owner), directory sends *Fetch* to owner and forwards data to requestor.
- **Write miss**: requestor sends *GetM* to directory. Directory sends *Inv* to all sharers, waits for acknowledgments, then sends data to requestor.

The number of NoC messages per memory operation depends on the initial state: cold misses take 2–4 messages; sharing conflicts (write to a widely shared line) require \(O(\text{sharers})\) messages — a **sharing bottleneck**.

## 7.3 Cache Coherence for Heterogeneous Accelerators

Modern SoCs integrate CPUs, GPUs, DSPs, and custom accelerators sharing the same physical memory. These accelerators have diverse coherence needs:
- GPUs operate on large, thread-parallel workloads with relaxed ordering requirements.
- DSPs perform streaming computation with explicit DMA transfers, bypassing caches.
- ML accelerators use scratchpad memories with software-managed coherence.

**NoC-based coherence support for heterogeneous systems** uses coherence transaction routing through the NoC to handle cross-domain data sharing. One approach: maintain a system-level coherence controller (SLC) accessible via the NoC that translates between CPU-coherent and non-coherent (DMA-based) memory operations. The SLC inserts invalidations or flushes as needed when crossing coherence domain boundaries.

---

# Chapter 8: Multi-Die and Chiplet Interconnect

## 8.1 The Chiplet Era

Transistor scaling economics increasingly favor **chiplets** — independently manufactured, specialized dies assembled on an interposer or in a package — over monolithic SoC integration. A chiplet-based system (e.g., AMD EPYC, Apple M2 Ultra, Intel Sapphire Rapids) uses a high-speed die-to-die interconnect to connect:

- Compute chiplets (CPU cores, GPU, AI accelerators)
- Memory chiplets (HBM stacks)
- I/O chiplets (PCIe, Ethernet, USB)

The inter-chiplet interconnect must achieve bandwidth and latency approaching intra-die wires while crossing package-level distances (mm to cm).

## 8.2 Die-to-Die Interface Standards

**UCIe (Universal Chiplet Interconnect Express)**: an open standard defining the physical layer (bump pitch, signaling protocol) and protocol stack (transport layer supporting PCIe, CXL, Streaming) for die-to-die connectivity. UCIe physical layer achieves up to 32 Gbps/lane with bump pitches of 10–45 μm in 2D packaging.

**EMIB (Embedded Multi-Die Interconnect Bridge)**: Intel's approach using a small silicon bridge embedded in the package substrate to provide short-distance, high-bandwidth connectivity between adjacent chiplets without a full silicon interposer.

**HBM (High Bandwidth Memory)**: memory chiplets stacked on or adjacent to a compute die using through-silicon vias (TSVs), achieving ~1 Tbps bandwidth with 128-bit wide channels.

## 8.3 Performance Tradeoffs

Inter-chiplet links have higher latency (20–100 ns) and lower energy efficiency than intra-die wires, but chiplet designs can exceed monolithic SoC yields (smaller dies have higher yield, and yield degrades exponentially with area). The system designer must balance:

- **Granularity of chiplet interfaces**: coarser interfaces (cache-coherent, PCIe) reduce pin count but increase protocol overhead; finer interfaces (raw memory bus) are faster but harder to standardize.
- **Bandwidth density**: achieving high bandwidth across the chiplet boundary requires many signal lines or high-speed SerDes, both of which consume area and power.
- **Latency sensitivity**: memory-intensive applications tolerating high latency can use HBM at package distances; latency-sensitive control paths require tight integration (EMIB or monolithic).

NoC principles — topology, routing, flow control — apply directly to chiplet interconnect design, with the additional constraint that die-to-die links are expensive (limited bandwidth, higher power per bit) compared to on-die wires.
