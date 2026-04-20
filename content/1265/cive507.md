---
title: "CIVE 507: Building Science and Technology"
subjects: "CIVE"
---

## Sources and References

**Primary texts** — Straube, J. F. and Burnett, E. F. P., *Building Science for Building Enclosures*; Hutcheon, N. B. and Handegord, G. O. P., *Building Science for a Cold Climate*.

**Supplementary texts** — Hagentoft, C.-E., *Introduction to Building Physics*; Kumaran, M. K., *Heat, Air and Moisture Transfer in Insulated Envelope Parts*; ASHRAE, *Handbook — Fundamentals*.

**Online resources** — National Research Council of Canada, *Canadian Centre for Housing Technology* and *Institute for Research in Construction* open reports; Building Science Corporation (buildingscience.com) technical papers; ASHRAE Standards 62.1, 90.1 public summaries; NIST fire research publications.

---

# Chapter 1: The Building Process

A building is an assembly of systems: structure, enclosure, mechanical, electrical, and interior. Building science studies how these systems interact with each other and with the environment over the building's life.

## 1.1 Project Delivery

The building process progresses from programming through schematic design, design development, construction documents, construction, commissioning, and operation. Project delivery methods — design-bid-build, design-build, construction management — affect how risk, innovation, and coordination flow between owner, designer, and constructor. Integrated project delivery and Building Information Modelling increasingly compress the boundary between design and construction.

## 1.2 Roles and Standards

National and provincial building codes specify minimum performance. In Canada the *National Building Code* and *National Energy Code for Buildings* establish requirements that provincial codes adopt and modify. Designers reference standards from CSA, ASHRAE, ASTM, and ISO for materials, testing, and performance metrics.

# Chapter 2: Loadings on the Enclosure

The enclosure separates interior from exterior and must resist a multivariate set of loadings.

## 2.1 Gravity and Structural Loads

The enclosure carries its self-weight and transfers wind and seismic loads to the primary structure. Cladding attachments must accommodate movement — thermal, moisture, and structural — to avoid cracking and sealant failure.

## 2.2 Wind

Wind generates fluctuating positive and negative pressures on walls and roofs. Pressure at a point is

\[
p = q\, C_p\, C_g
\]

with \(q = \tfrac{1}{2}\rho V^2\) the velocity pressure. Corners and parapet zones experience higher suction than centre-of-wall zones, requiring denser fastener spacing.

## 2.3 Thermal Loads

The enclosure sees interior and exterior temperature differentials that vary daily and seasonally. Expansion and contraction impose strains. A component of length \(L\) and coefficient of thermal expansion \(\alpha\) changes length by

\[
\Delta L = L\,\alpha\,\Delta T
\]

The resulting stresses — if restrained — can exceed material capacity. Differential thermal movement between a dark metal cladding and a supporting steel frame is a routine source of cracked joints.

## 2.4 Moisture Loads

Rain, snow, groundwater, and water vapour all drive moisture into enclosures. Water vapour diffusion through a material of permeance \(\mu\) under a vapour pressure difference \(\Delta p_v\) is \(\dot m = \mu\,\Delta p_v\). Air leakage carries orders of magnitude more moisture than diffusion when interior humidity is high, which is why **air barriers** are central to cold-climate design.

## 2.5 Fire

Fire loads are characterized by the heat release rate and duration of a design fire. Codes require fire resistance ratings on structural and separating elements; these are based on ASTM E119 or CAN/ULC-S101 furnace tests. Protection strategies integrate compartmentation, active suppression (sprinklers), smoke control, and egress.

<div class="definition">
<strong>Enclosure function.</strong> The building enclosure supports loads, controls heat, air, moisture, sound, fire, and light, and provides the visual and tactile surfaces experienced by occupants and passers-by.
</div>

# Chapter 3: Heat, Air, and Moisture Transfer

## 3.1 Heat Transfer

Steady-state one-dimensional conduction through a layered wall gives

\[
U = \frac{1}{R_{\text{total}}},\qquad R_{\text{total}} = R_{si} + \sum_i \frac{t_i}{k_i} + R_{so}
\]

Thermal bridging through studs, fasteners, and slab edges reduces effective \(R\)-value; **effective thermal resistance** calculations (parallel-path or two-dimensional finite-element) are required for code compliance.

## 3.2 Air Leakage

Air flow through a crack of pressure drop \(\Delta p\) follows a power law \(\dot Q = C(\Delta p)^n\) with \(n\) typically \(0.6\text{–}0.7\). A whole-building air leakage of \(2.0\ \text{L/s·m}^2\) at \(75\ \text{Pa}\) is a common enclosure target. Leaks convey humid interior air into cold assemblies, producing condensation.

## 3.3 Moisture Transfer

Moisture moves through an assembly by vapour diffusion (Fick), air convection, capillary action, and gravity. **Glaser analysis** plots vapour pressure and saturation pressure across a wall section to identify potential condensation planes. Modern analyses use transient hygrothermal models (WUFI, Delphin) that couple heat and moisture with storage.

# Chapter 4: Enclosure Design

## 4.1 Walls

A modern wall assembly implements the four control layers in order from exterior to interior: rain, air, vapour, and thermal. **Rainscreen** walls separate the cladding from a drainage plane, allowing incidental water to drain. The **perfect wall** concept places all control layers exterior to the structure, protecting the structure from thermal cycling and condensation.

## 4.2 Windows

Window performance is characterized by the U-factor, solar heat gain coefficient (SHGC), visible transmittance, and air leakage. Thermally improved frames, low-emissivity coatings, warm-edge spacers, and gas fills (argon, krypton) reduce U-factor to \(1.0\ \text{W/m}^2\cdot\text{K}\) or better. Window selection must balance winter heat loss, summer heat gain, daylighting, and glare.

## 4.3 Roofs

Low-slope roofs are either **conventional** (membrane above insulation, vapour retarder below) or **protected membrane** (insulation above the membrane). Steep-slope roofs rely on lapped shingles and ventilated attics. Roof failures cluster at penetrations, parapets, and drains; designers provide minimum 2% slopes to drains and overflow scuppers.

# Chapter 5: Subgrade Construction

## 5.1 Foundations and Waterproofing

Below-grade walls must resist lateral earth pressures, hydrostatic pressure, and water intrusion. Dampproofing suffices where water tables are low and positive drainage is maintained; true **waterproofing** (self-adhered membranes, bentonite, fluid-applied systems) is required below the water table. Insulation is typically placed on the exterior to keep the concrete warm and dry.

## 5.2 Drainage and Radon

A perimeter drainage system of aggregate and perforated pipe at the footing conducts water to a sump or daylight. In many regions **radon** control — a sub-slab gravel layer, a sealed sheet, and a stub for future active extraction — is required.

## 5.3 Frost Protection

Foundations must extend below the frost depth or be protected with **frost-protected shallow foundations** that use horizontal insulation to redirect ground heat. The frost depth depends on climate and soil type; typical Canadian values are \(1.2\text{–}2.4\ \text{m}\).

# Chapter 6: Energy and Operation

## 6.1 Energy Balance

Building energy demand is

\[
Q_{\text{heating}} = (UA + C_{\text{air}}\dot m_{\text{inf}})\,\Delta T - Q_{\text{solar}} - Q_{\text{internal}}
\]

A superinsulated enclosure reduces the transmission and infiltration terms, allowing a small active system and opening the passive-house performance regime (annual heating demand below \(15\ \text{kWh/m}^2\)).

## 6.2 HVAC and Indoor Environment

Mechanical ventilation with heat recovery (HRV/ERV) supplies fresh air while recovering sensible and latent energy. ASHRAE 62.1 sets minimum outdoor-air rates. Indoor air quality depends not only on ventilation but on source control — low-emitting materials, moisture control, and pollutant isolation.

## 6.3 Durability and Maintenance

A building's **service life** depends on detailing, materials, and maintenance. Flashing continuity at penetrations, the integrity of sealants, and the protection of water-sensitive materials dominate long-term performance. Whole-life carbon — operational plus embodied — is increasingly part of the brief, motivating mass timber, low-carbon concrete, and reuse of existing structures.

<div class="remark">
<strong>Integrated design.</strong> Building science rewards early coordination. The lowest-energy, most durable building is one in which structure, enclosure, and mechanical systems are designed together from the outset, with control layer continuity checked at every interface on every drawing.
</div>

The engineer who masters building science combines a quantitative command of heat, air, and moisture with a sensitivity to climate, construction practice, and occupant behaviour. The goal is not merely code compliance but the design of enclosures that are durable, efficient, healthy, and resilient to a changing climate.
