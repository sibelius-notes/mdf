---
title: "CIVE 100: Civil, Environmental and Geological Engineering Concepts"
prof: "Dave Brush"
subjects: "CIVE"
term: "Winter 2025 (1251)"
---

## Sources and References

- Hibbeler, R. C. *Engineering Mechanics: Statics*. Pearson, 14th ed.
- Das, Braja M. *Principles of Foundation Engineering*. Cengage, 9th ed.
- Mihelcic, J. R. & Zimmerman, J. B. *Environmental Engineering: Fundamentals, Sustainability, Design*. Wiley, 2nd ed.
- MIT OpenCourseWare 1.00: Introduction to Computers and Engineering Problem Solving.
- UBC CIVL 101: Civil Engineering and Infrastructure.
- Engineers Canada / CEAB, *Accreditation Criteria and Procedures*.
- Autodesk, *Civil 3D and Infraworks Documentation*, 2025 Education Edition.

---

# Chapter 1: Introduction to Civil, Environmental, and Geological Engineering

## 1.1 Scope of the Discipline

Civil engineering encompasses the planning, analysis, design, construction, and maintenance of the physical infrastructure that supports modern society. Its principal sub-disciplines include structural engineering, geotechnical engineering, transportation engineering, water resources engineering, and environmental engineering. Geological engineering bridges geoscience and civil practice, addressing the behaviour of earth materials as they affect constructed works.

Environmental engineering applies physical, chemical, and biological principles to protect human health and ecological systems from the adverse effects of pollutants, and to ensure sustainable use of natural resources. At the introductory level, these three streams share a common mathematical and scientific foundation while differing in the specific systems they analyse and the professional context in which graduates practise.

## 1.2 The Engineering Design Process

The engineering design process is an iterative, structured sequence of activities through which an identified need is transformed into a realised artifact or system. Standard formulations typically include the following stages:

1. **Problem definition** — translating a societal or client need into a clearly bounded engineering problem with explicit performance criteria and constraints.
2. **Background research and site investigation** — gathering existing knowledge, surveying site conditions, and assessing regulatory requirements.
3. **Generation of alternatives** — applying creativity and technical knowledge to propose candidate solutions.
4. **Analysis and evaluation** — applying quantitative methods to predict the performance of each alternative.
5. **Selection and optimisation** — choosing the preferred solution and refining it to meet all constraints.
6. **Communication** — documenting the design in drawings, specifications, and reports, and presenting it to clients and stakeholders.
7. **Implementation and review** — overseeing construction or deployment and verifying that outcomes meet design intent.

In introductory engineering practice, the pre-design study occupies the first several stages: it establishes existing site conditions, articulates design criteria, and presents preliminary alternative concepts without yet committing to a detailed design. Effective technical communication throughout this process is as important as the technical work itself.

## 1.3 Units, Measurement, and Error Analysis

Engineering calculations require consistent use of a unit system. The International System of Units (SI) is the globally adopted standard in engineering practice. The base units most frequently encountered in civil and environmental engineering are the metre (m), kilogram (kg), second (s), and kelvin (K). Derived units include the newton \( \text{N} = \text{kg} \cdot \text{m/s}^2 \), pascal \( \text{Pa} = \text{N/m}^2 \), and joule \( \text{J} = \text{N} \cdot \text{m} \).

Unit conversions must be performed systematically using conversion factors expressed as unit fractions. For example, converting a velocity from kilometres per hour to metres per second:

\[
v = 90 \; \frac{\text{km}}{\text{h}} \times \frac{1000 \; \text{m}}{1 \; \text{km}} \times \frac{1 \; \text{h}}{3600 \; \text{s}} = 25 \; \text{m/s}
\]

**Significant figures** reflect the precision of a measured or computed quantity. The number of significant figures in a result should not exceed the number in the least precise input datum. Engineering computations generally retain three to four significant figures in intermediate steps and report final results to three significant figures unless the context demands otherwise.

**Measurement error** has two components. *Systematic error* (bias) shifts all readings in the same direction and can be corrected if the source is identified. *Random error* (precision error) varies unpredictably from measurement to measurement and is characterised statistically. For a set of \( n \) repeated measurements \( x_i \), the sample mean is

\[
\bar{x} = \frac{1}{n} \sum_{i=1}^{n} x_i
\]

and the sample standard deviation is

\[
s = \sqrt{\frac{\sum_{i=1}^{n}(x_i - \bar{x})^2}{n - 1}}
\]

The standard error of the mean, \( s/\sqrt{n} \), decreases as more observations are collected, illustrating the benefit of repeated measurement in surveying and laboratory work.

---

# Chapter 2: Field Surveying — Principles and Instrumentation

## 2.1 Overview of Surveying

Surveying is the science of determining the relative positions of points on or near the earth's surface. In civil engineering, survey data underpin every subsequent design activity: site grading, road alignment, drainage design, foundation layout, and construction set-out all depend on accurate spatial information. Traditional surveying uses optical and mechanical instruments to measure horizontal distances, horizontal angles, and vertical differences in elevation. Modern practice supplements these methods with global navigation satellite systems (GNSS) and airborne remote sensing.

## 2.2 Levelling

**Differential levelling** determines the difference in elevation between benchmarks (points of known elevation) and intermediate points. The instrument used is the *automatic level*, a telescope mounted on a tribrach and fitted with a compensator that maintains a horizontal line of sight regardless of small tilting of the instrument.

The fundamental relationship governing differential levelling is

\[
\text{HI} = \text{Elev}_{\text{BM}} + \text{BS}
\]

\[
\text{Elev}_{\text{TP}} = \text{HI} - \text{FS}
\]

where HI is the *height of instrument* (elevation of the line of sight), BS is the *backsight* reading on a staff of known elevation, and FS is the *foresight* reading on a staff at the point whose elevation is sought. A turning point (TP) is an intermediate point that serves simultaneously as a foresight from one instrument position and a backsight from the next.

**Loop closure** provides a check on levelling accuracy. After running a level circuit back to the starting benchmark, the algebraic sum of all backsights minus the algebraic sum of all foresights should equal zero (for a closed loop) or the known elevation difference (for an open traverse). The *misclosure* is

\[
e = \sum \text{BS} - \sum \text{FS} - \Delta h_{\text{known}}
\]

If \( |e| \) is within the specified tolerance, the error is distributed among the turning points in proportion to the distance surveyed or, for equal-length sights, in equal amounts. This process is called *balancing* the level run.

A practical tolerance for ordinary levelling is

\[
e_{\text{tol}} = k \sqrt{L}
\]

where \( L \) is the total route length in kilometres and \( k \) is a constant (typically \( 12 \; \text{mm} \) for ordinary surveys).

## 2.3 Traverse Surveying with a Total Station

A **traverse** is a sequence of connected lines whose lengths and directions are measured, enabling the coordinates of successive points to be computed. A *total station* integrates an electronic distance measurement (EDM) unit with an electronic theodolite, measuring slope distance, vertical angle, and horizontal angle simultaneously.

The horizontal distance \( D \) from a measured slope distance \( S \) and vertical angle \( \alpha \) is

\[
D = S \cos \alpha
\]

The elevation difference between instrument and prism is

\[
\Delta h = S \sin \alpha + \text{HI} - \text{HR}
\]

where HI is the instrument height above the occupied point and HR is the reflector height above the sighted point.

**Coordinate computation** proceeds from an origin of known coordinates \( (E_0, N_0) \) through successive traverse legs:

\[
E_{i+1} = E_i + D_i \sin \theta_i, \qquad N_{i+1} = N_i + D_i \cos \theta_i
\]

where \( \theta_i \) is the bearing of the \( i \)-th leg. For a closed traverse, the sum of departure increments and the sum of latitude increments should each equal zero. The *linear misclosure* and *relative precision* are computed as

\[
e_D = \sqrt{(\sum \Delta E)^2 + (\sum \Delta N)^2}, \qquad \text{Relative Precision} = \frac{e_D}{\sum D}
\]

Errors are distributed by the **Bowditch (compass) rule**, which adjusts each departure and latitude in proportion to the fractional length of that leg relative to the total traverse length.

## 2.4 GPS and LIDAR Surveying

**Differential GPS (DGPS)** and **Real-Time Kinematic (RTK) GPS** achieve centimetre-level positioning accuracy by simultaneously receiving signals at a reference station of known coordinates and at a rover unit. The reference station computes corrections to satellite-derived positions and transmits them to the rover in real time. RTK is particularly efficient for collecting point coordinates across a site in topographic surveying.

**Airborne LIDAR** (Light Detection and Ranging) emits laser pulses from an aircraft and measures the round-trip travel time to compute the distance to each ground return. Combined with onboard GPS and an inertial measurement unit (IMU), LIDAR produces dense three-dimensional point clouds that capture terrain and vegetation structure at scales impractical for ground-based surveys. The resulting point cloud can be filtered to extract a bare-earth digital elevation model (DEM) or a digital surface model (DSM) that includes above-ground features.

---

# Chapter 3: Engineering Graphics and Design Visualization

## 3.1 Role of Engineering Graphics

Engineering drawings communicate the geometry, dimensions, tolerances, and materials of a designed object or site with sufficient precision that the design can be constructed or manufactured without ambiguity. Civil site plans, grading plans, and utility plans use standardised conventions including north arrows, scale bars, contour intervals, and layer management to convey three-dimensional site conditions in two-dimensional plan and section views.

## 3.2 Autodesk Civil 3D

Civil 3D is a civil engineering design application built on AutoCAD. Its central data object is the **surface**, a triangulated irregular network (TIN) or grid representation of terrain elevation derived from survey points, contour data, or LIDAR point clouds. Key Civil 3D workflows relevant to introductory site design include:

- **Layer management**: All drawing entities are assigned to layers that control visibility, colour, and line weight. Disciplined layer usage enables complex drawings to be selectively displayed and plotted.
- **Point groups**: Survey points are organised into groups that share display styles. A point group may represent, for example, all ground shots from a particular survey day.
- **Surface creation and analysis**: A surface is created from a point group or imported data. Contour analysis, slope analysis, and elevation banding visualise terrain characteristics.
- **Feature lines and grading**: Feature lines define grade-break edges (e.g., top and bottom of slope, edge of pavement). Grading objects project grade slopes between a feature line and a target elevation or surface, generating a proposed grading design.
- **Annotation**: Labels, tables, and dimensions document the design in accordance with drafting standards.

## 3.3 Autodesk Infraworks

Infraworks is a conceptual design and visualisation tool that operates at the site-to-city scale. It ingests georeferenced data (terrain, imagery, road networks, building footprints) to create a 3D context model in which candidate designs can be rapidly modelled and evaluated. Infraworks supports early-stage stakeholder communication by producing photorealistic renderings and animations that convey design intent to non-technical audiences without the overhead of detailed construction-document-level modelling.

In the context of site design, Infraworks enables the placement of roads, buildings, and infrastructure elements on a terrain model derived from Civil 3D or imported LIDAR data, facilitating visual assessment of grading, view corridors, and land-use compatibility before detailed design resources are committed.

## 3.4 Vehicle Tracking

Autodesk Vehicle Tracking is an add-on to Civil 3D that simulates the swept path of design vehicles (e.g., fire trucks, delivery vehicles, accessible vans) through a proposed road layout or parking facility. The swept-path envelope represents the area swept by the widest parts of a vehicle as it navigates a curve, providing a geometric check on whether turning radii, lane widths, and driveway configurations are adequate for the intended vehicle types.

---

# Chapter 4: Site Design — Grading and Drainage Fundamentals

## 4.1 Topographic Representation

Terrain is represented graphically by **contour lines** — lines of equal elevation. The vertical distance between successive contours is the **contour interval**, selected based on the scale and relief of the area. Contour lines never cross (except at overhanging features), are always closed curves (though they may close outside the map boundary), and are spaced closely where slopes are steep and widely where slopes are gentle.

The ground slope \( S \) between two points separated by horizontal distance \( d \) and vertical distance \( \Delta h \) is

\[
S = \frac{\Delta h}{d}
\]

expressed as a dimensionless ratio, a percentage, or as a grade (rise over run). In site grading, slopes are specified for drainage performance and safety: turf areas typically drain at 2–5%, paved surfaces at 1–2%, and the maximum slope for accessible paths is limited to 1:20 (5%) under accessibility standards.

## 4.2 Cut and Fill

Earthwork design seeks to balance the volumes of material excavated (cut) and material placed (fill) on a site, minimising the need to import or export material. The **average end-area method** estimates the volume of earth between two consecutive cross-sections as

\[
V = \frac{L}{2}(A_1 + A_2)
\]

where \( L \) is the distance between sections and \( A_1, A_2 \) are the cross-sectional areas of cut or fill at each station. For irregular terrain the **prismatoid formula** gives a more accurate result:

\[
V = \frac{L}{6}(A_1 + 4A_m + A_2)
\]

where \( A_m \) is the cross-sectional area at the midpoint of the interval.

## 4.3 Drainage and Stormwater Management

Civil site design must manage the quantity and quality of stormwater runoff generated by impervious surfaces. The **Rational Method** relates peak runoff rate to rainfall intensity and watershed characteristics:

\[
Q = C \, i \, A
\]

where \( Q \) is the peak discharge (m³/s or ft³/s), \( C \) is a dimensionless runoff coefficient (0 for fully pervious, 1 for fully impervious), \( i \) is the design rainfall intensity for a storm of duration equal to the time of concentration, and \( A \) is the contributing drainage area. The Rational Method is appropriate for small urban watersheds (typically less than 80 ha).

Sustainable site design increasingly employs **low-impact development (LID)** practices such as bioswales, permeable pavement, infiltration trenches, and green roofs to attenuate peak runoff and promote infiltration, reducing downstream impacts on receiving water bodies.

---

# Chapter 5: Geotechnical and Foundation Engineering Concepts

## 5.1 Soil Classification and Properties

Soil is the predominant foundation material for civil infrastructure. Its engineering behaviour depends on particle size distribution, plasticity, density, and strength. The **Unified Soil Classification System (USCS)** categorises soils based on grain-size analysis (sieve and hydrometer tests) and Atterberg limits (liquid limit and plastic limit):

- **Coarse-grained soils** (gravels and sands): classified by gradation as well-graded (W) or poorly-graded (P), with secondary descriptors for fines content.
- **Fine-grained soils** (silts and clays): classified by plasticity, distinguishing low-plasticity (L) from high-plasticity (H) materials.
- **Organic soils** (peat, organic silt): generally unsuitable for structural foundations.

Key index properties include:

- **Void ratio** \( e = V_v / V_s \) — the ratio of void volume to solid volume.
- **Degree of saturation** \( S = V_w / V_v \) — the fraction of voids filled with water.
- **Unit weight** \( \gamma = W / V \) — the weight per unit volume of the soil mass.

## 5.2 Bearing Capacity

A shallow foundation transmits structural loads to the soil by bearing on a pad or strip of concrete placed at shallow depth. The **general bearing capacity equation** for a strip footing on a cohesive-frictional soil (after Terzaghi and as extended by Meyerhof) is

\[
q_u = c \, N_c + q \, N_q + \frac{1}{2} \gamma B \, N_\gamma
\]

where \( c \) is the cohesion intercept, \( q = \gamma D_f \) is the surcharge from soil above the foundation level, \( B \) is the footing width, \( N_c, N_q, N_\gamma \) are dimensionless bearing capacity factors dependent on the soil friction angle \( \phi \), and \( D_f \) is the depth of embedment. The *allowable bearing pressure* is obtained by dividing the ultimate capacity by a factor of safety (typically 2.5 to 3.0):

\[
q_{\text{all}} = \frac{q_u}{FS}
\]

## 5.3 Settlement

Even when the bearing capacity is not exceeded, a foundation may settle an unacceptable amount. **Immediate settlement** (elastic compression) occurs as the load is applied; **consolidation settlement** develops over time as excess pore pressure in saturated fine-grained soils dissipates. The one-dimensional consolidation settlement of a clay layer of thickness \( H \) is

\[
S_c = \frac{C_c H}{1 + e_0} \log \left(\frac{\sigma'_0 + \Delta\sigma'}{\sigma'_0}\right)
\]

for a normally consolidated clay, where \( C_c \) is the compression index, \( e_0 \) is the initial void ratio, \( \sigma'_0 \) is the initial effective vertical stress, and \( \Delta\sigma' \) is the applied stress increment. The **degree of consolidation** \( U \) and its time dependence are governed by the diffusion equation, with the time factor \( T_v = c_v t / H_{dr}^2 \) relating elapsed time \( t \), the coefficient of consolidation \( c_v \), and the drainage path length \( H_{dr} \).

---

# Chapter 6: Environmental Engineering Concepts

## 6.1 Water Quality Parameters

Environmental engineers characterise water quality using physical, chemical, and biological parameters. Common measures include:

- **Dissolved oxygen (DO)**: Essential for aquatic life; measured in mg/L. Values below 5 mg/L stress most fish species.
- **Biochemical oxygen demand (BOD)**: The mass of oxygen consumed by microbial oxidation of organic matter over a standard incubation period (5 days at 20 °C), expressed in mg/L. BOD is a surrogate for organic pollution loading.
- **Total suspended solids (TSS)**: The mass of particles retained on a 0.45 µm filter per litre of sample; elevated TSS impairs light penetration and clogs aquatic habitats.
- **pH**: The negative logarithm of hydrogen ion activity, \( \text{pH} = -\log[\text{H}^+] \). Most surface waters and drinking water standards require pH in the range 6.5–8.5.
- **Nutrients (nitrogen, phosphorus)**: Excess nitrogen and phosphorus stimulate algal growth, potentially leading to eutrophication and hypoxic zones.

## 6.2 Mass Balance

The **mass balance** (or conservation of mass) is the foundational analytical tool of environmental engineering. For a well-mixed, steady-state control volume with a first-order decay reaction, the governing equation is

\[
Q C_{\text{in}} = Q C_{\text{out}} + k V C_{\text{out}}
\]

where \( Q \) is volumetric flow rate, \( C_{\text{in}} \) and \( C_{\text{out}} \) are influent and effluent concentrations, \( k \) is the first-order reaction rate constant, and \( V \) is the reactor volume. Solving for the effluent concentration:

\[
C_{\text{out}} = \frac{C_{\text{in}}}{1 + k \tau}
\]

where \( \tau = V/Q \) is the hydraulic retention time (HRT).

## 6.3 Sustainability in Engineering Design

The **triple bottom line** framework evaluates engineering projects against economic, environmental, and social criteria simultaneously, rather than optimising for cost alone. Lifecycle assessment (LCA) quantifies the environmental burdens associated with a product or system across its entire life — from raw material extraction through manufacturing, use, and end-of-life disposal. Engineers are increasingly expected to quantify embodied carbon, water consumption, and resource depletion alongside traditional performance metrics.

---

# Chapter 7: Professional Practice and Engineering Ethics

## 7.1 The Engineering Profession in Canada

The practice of professional engineering in Ontario is regulated by Professional Engineers Ontario (PEO) under the *Professional Engineers Act*. Only holders of a Professional Engineer (P.Eng.) licence may offer engineering services to the public or assume responsibility for engineering designs that affect public safety. The licensing pathway requires an accredited undergraduate engineering degree, a minimum of 48 months of engineering experience (at least 12 months in Canada), and passage of the Professional Practice Examination (PPE).

The **Canadian Engineering Accreditation Board (CEAB)**, a committee of Engineers Canada, accredits undergraduate engineering programmes to ensure that graduates possess the minimum competencies required for licensure. Accreditation is based on a set of **graduate attributes** (GAs) that include knowledge base, problem analysis, investigation, design, engineering tools, individual and teamwork, communication, professionalism, and ethics.

## 7.2 Code of Ethics

Professional engineers are obligated to hold the safety, health, and welfare of the public as paramount. The PEO Code of Ethics establishes duties to the public, to employers and clients, to the profession, and to colleagues. Key principles include:

- Practising only in areas of personal competence.
- Disclosing conflicts of interest and avoiding situations where professional judgement may be compromised.
- Reporting conditions that endanger public safety, even when doing so conflicts with an employer's preferences.
- Maintaining confidentiality of client information except as required by law or to prevent public harm.

**Negligence** arises when an engineer fails to meet the standard of care expected of a reasonably competent professional, causing harm. Civil liability may result in damages; egregious cases may lead to licence suspension or revocation.

## 7.3 Diversity and Inclusion in the Profession

The engineering workforce in Canada has historically been underrepresented by women, Indigenous peoples, and racialised groups. Diverse teams have been shown to produce more innovative and robust designs by bringing a broader range of perspectives to problem framing and solution generation. Professional engineers and engineering organisations have obligations under human rights legislation to provide equitable, harassment-free workplaces. Inclusive design practice considers the full diversity of end-users — including persons with disabilities, elderly individuals, and those with limited mobility — throughout the design process.

---

# Chapter 8: Stakeholder Communication and the Design Report

## 8.1 Technical Communication Principles

Engineers routinely prepare documents for two distinct audiences: technical peers (who require full quantitative rigour) and non-technical stakeholders (who require accessible explanations of design intent, trade-offs, and implications). Effective technical communication across both contexts shares several characteristics:

- **Clarity**: Sentences are unambiguous; technical terms are defined when first introduced.
- **Conciseness**: Information is presented efficiently; redundancy is eliminated.
- **Logical organisation**: Information flows from problem context through analysis to conclusions and recommendations.
- **Visual communication**: Drawings, graphs, tables, and photographs convey spatial and quantitative information more efficiently than prose alone.
- **Accuracy**: All data, calculations, and references are correct and verifiable.

## 8.2 The Pre-Design Study

A pre-design study (also called a feasibility study or preliminary design report) is the deliverable associated with the first phase of a civil engineering project. Its typical structure includes:

1. **Project background and objectives** — the problem context, the client's goals, and the scope of the study.
2. **Site description** — topography, soil conditions, existing infrastructure, environmental sensitivities, and regulatory constraints based on field investigation and desktop review.
3. **Design criteria** — the quantitative performance standards the design must meet (e.g., maximum slope, minimum setback, peak flow management target).
4. **Alternatives assessment** — two or more candidate design concepts evaluated against the design criteria, with advantages and disadvantages of each discussed.
5. **Preliminary recommendation** — the preferred alternative with a brief rationale.
6. **Appendices** — survey data, calculations, figures, and references.

## 8.3 Client Meetings and Iterative Design

In practice, design does not proceed in a single linear pass. Client meetings at key milestones allow stakeholders to provide feedback that refines the design scope, constraints, and preferred direction. The iterative nature of design — propose, evaluate, revise — is built into the project structure through a sequence of client meetings at which progress is presented and design decisions are validated or redirected. This iterative model mirrors professional project management frameworks such as the Project Management Institute's PMBOK and the RIBA Plan of Work used in architectural and civil engineering practice.

---

# Chapter 9: Introduction to Engineering Computation

## 9.1 Spreadsheet Analysis

Spreadsheet tools (such as Microsoft Excel) are the most widely used computational environment in everyday civil engineering practice. Key capabilities include:

- **Formula entry and cell referencing**: Relative and absolute cell references enable formula replication across rows and columns.
- **Built-in functions**: Statistical functions (AVERAGE, STDEV, COUNTIF), mathematical functions (SUM, SQRT, LOG), and lookup functions (VLOOKUP, INDEX-MATCH) reduce the need for manual computation.
- **Charts and graphs**: XY scatter plots, column charts, and surface plots visualise data distributions and engineering relationships.
- **Solver and Goal Seek**: Optimisation and root-finding for single-variable and multi-variable problems.

Good spreadsheet practice documents all input data with units, separates inputs from derived quantities, and includes a visible formula audit trail so that reviewers can verify calculations without reverse-engineering cell contents.

## 9.2 Scripted Computing

Higher-level scripted environments such as MATLAB (widely used in engineering education) extend spreadsheet capability to matrix algebra, differential equations, and custom algorithm development. A MATLAB script that computes and plots the settlement of a consolidating clay layer over time illustrates the advantage of scripted computation: the same code can be re-run for any combination of input parameters with minimal modification, supporting sensitivity analysis and design optimisation.

Core programming concepts applicable across computing environments include variable assignment, arithmetic operations, conditional logic (if-else), iteration (for and while loops), and function definition. The skill of breaking a complex engineering problem into a sequence of computable sub-problems and expressing each sub-problem as code is as valuable as the specific syntax of any particular language.

---

# Chapter 10: Course Project Overview — Site Design for a Scholar Residence

## 10.1 Project Context

The course design project involves developing a site plan for a two-level residence intended to house visiting scholars and their families, located adjacent to existing campus residential infrastructure. The project provides an authentic, open-ended design context in which surveying, grading, drainage, graphics, and communication skills are integrated.

The project proceeds through four client meetings at which each design group presents progress and receives feedback. The final deliverables include a completed Autodesk Civil 3D site model, an Infraworks visualisation, and a written design report structured as a pre-design study.

## 10.2 Site Analysis

The first stage of the project requires characterising the existing site through analysis of survey data and point-cloud information. Relevant analyses include:

- Generation of an existing ground surface and extraction of contours.
- Identification of slopes, drainage directions, and low points using surface analysis tools.
- Inventory of existing vegetation, utilities, and adjacent land uses from field observation and available data.

## 10.3 Design Development

Design development translates site analysis into a proposed layout. Key decisions include building footprint placement and orientation, driveway access and vehicle circulation (verified using vehicle tracking swept-path analysis), pedestrian circulation and accessibility, grading to direct drainage away from buildings and toward collection points, and landscaping. Each decision involves trade-offs: maximising a building's southern exposure for passive solar gain may conflict with setback requirements; minimising cut-and-fill may conflict with achieving positive drainage.

## 10.4 Visualisation and Communication

The Infraworks model serves as the primary visual communication tool for client meetings. Photorealistic rendering of the proposed design in its landscape context allows non-technical stakeholders to evaluate the proposal without interpreting plan drawings. Effective visualisation accurately represents proposed materials, vegetation, and contextual elements, and presents the design from viewpoints meaningful to the client (e.g., from a public street, from an adjacent building, from a pedestrian path).
