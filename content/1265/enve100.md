---
title: "ENVE 100: Environmental and Geological Engineering Concepts"
subjects: "ENVE"
---

## Sources and References

**Primary texts** — Davis, M. L. and Masten, S. J., *Introduction to Environmental Engineering*; Bettess, R., *Surveying for Engineers* (Uren and Price).

**Supplementary texts** — Mihelcic, J. R. and Zimmerman, J. B., *Environmental Engineering: Fundamentals, Sustainability, Design*; Andrews, G. C. and Shaw, P., *Canadian Professional Engineering and Geoscience: Practice and Ethics*; Ghilani, C. D. and Wolf, P. R., *Elementary Surveying: An Introduction to Geomatics*.

**Online resources** — MIT OpenCourseWare 1.018J *Fundamentals of Ecology*; US Geological Survey public topographic mapping and GIS tutorials; Engineers Canada *Public Guideline on the Code of Ethics*; Natural Resources Canada *CanVec* and topographic data portals; OpenStreetMap and QGIS open documentation.

---

# Chapter 1: The Environmental and Geological Engineering Disciplines

Environmental and geological engineering apply physical, chemical, biological, and earth-science principles to the design of systems that protect human health and sustain ecosystems. Environmental engineers focus on water, air, soil, and waste; geological engineers focus on the subsurface — foundations, slopes, mineral and energy resources, groundwater, and geohazards. The two disciplines share analytical methods, professional responsibilities, and, at Waterloo, a first-year introduction.

## 1.1 Scales and Systems

Engineering practice spans scales from molecular (adsorption, reaction kinetics) through process (a single unit operation), facility (a treatment plant or a mine), watershed and airshed, to the global climate system. A systems view — treating inputs, outputs, storages, transformations, and feedbacks explicitly — is essential.

## 1.2 Sustainability and the Sustainable Development Goals

The United Nations' 17 **Sustainable Development Goals** (SDGs) frame the global objectives that environmental and geological engineers help achieve. Clean water and sanitation (SDG 6), affordable clean energy (SDG 7), sustainable cities (SDG 11), responsible consumption (SDG 12), and climate action (SDG 13) directly engage the profession's skills.

<div class="definition">
<strong>Sustainable engineering.</strong> The design of systems that meet present needs without compromising the ability of future generations to meet theirs, integrating environmental protection, social equity, and economic viability.
</div>

# Chapter 2: Site Design

## 2.1 The Site Design Process

Site design begins with understanding purpose, constraints, and context. A thorough site analysis documents topography, soils, hydrology, vegetation, climate, existing infrastructure, cultural and ecological features, and regulatory overlays. Conceptual alternatives — generated through sketching and brainstorming — are evaluated against criteria and refined into a preferred design.

## 2.2 Grading and Drainage

Grading reshapes the land to suit intended uses while maintaining positive drainage away from structures and preserving soil stability. Slopes are expressed as ratios (e.g., 3H:1V) or percentages; maximum slopes depend on soil, vegetation, and use (typically 3:1 for mowed grass, 2:1 for vegetated but unmaintained). Volumes of cut and fill should approximately balance to minimize hauling.

## 2.3 Stormwater Integration

Site design increasingly incorporates low-impact development — bioretention cells, vegetated swales, permeable pavements, and rainwater capture. The aim is to mimic predevelopment hydrology, reducing peak flows, retaining pollutants on site, and recharging groundwater.

# Chapter 3: Surveying and Geomatics

## 3.1 Traditional Field Surveying

**Levelling** determines elevation differences using a level instrument and a graduated rod. A backsight to a benchmark of known elevation and a foresight to the unknown point give

\[
\text{Elev}_{\text{new}} = \text{Elev}_{\text{BM}} + \text{BS} - \text{FS}
\]

Traverses measure horizontal angles and distances. Coordinates advance from a known point by the latitude and departure of each line:

\[
\Delta N = L\cos\alpha,\qquad \Delta E = L\sin\alpha
\]

Closure errors are distributed (compass rule, transit rule, least squares).

## 3.2 Modern Topographic Surveying

Total stations integrate electronic distance measurement with angular encoders. Global Navigation Satellite Systems (GNSS) — GPS, GLONASS, Galileo, BeiDou — enable centimetre-level real-time kinematic (RTK) positioning. Terrestrial laser scanning (LiDAR) and unmanned aerial vehicle photogrammetry produce dense three-dimensional point clouds; structure-from-motion algorithms reconstruct geometry from overlapping images.

## 3.3 Coordinate Systems

Horizontal positions are expressed in geographic coordinates (latitude, longitude) or in projected systems such as UTM (Universal Transverse Mercator). Vertical datums — geoidal, orthometric, ellipsoidal — are distinguished carefully because GNSS returns ellipsoidal heights while engineering works in orthometric heights. The Canadian geoid model CGG2013 converts between them.

<div class="example">
<strong>Closure check.</strong> A closed traverse with five legs measures a sum of latitudes <em>&Sigma;&Delta;N = 0.06 m</em> and departures <em>&Sigma;&Delta;E = &minus;0.04 m</em> over a total perimeter 640 m. The relative precision is <em>&radic;(0.06² + 0.04²)/640 &asymp; 1:8900</em>, which meets typical topographic standards.
</div>

# Chapter 4: Engineering Graphics and Visualization

## 4.1 Drawing Conventions

Engineering drawings communicate design intent unambiguously. Plan, elevation, and section views are drawn at standardized scales with title blocks, legends, and dimensions. Line types distinguish visible edges (solid), hidden features (dashed), centrelines, and dimension lines. North arrows and bar scales orient the reader.

## 4.2 CAD and BIM

Computer-aided design software (AutoCAD, Civil 3D, MicroStation) supports precise two- and three-dimensional drafting. Building Information Modelling (Revit, OpenRoads) represents design as a database of objects with attributes, enabling clash detection, quantity takeoffs, and model-based coordination among disciplines.

## 4.3 Design Visualization

Perspective views, rendered images, and interactive virtual walk-throughs help non-specialist stakeholders understand proposed designs. For environmental projects — wetlands, remediation works, wind farms — visualizations often accompany public consultation.

# Chapter 5: Laboratory Sessions: Instrument Skills

## 5.1 Level Loops and Booking

Practical exercises close level loops to check instrumental and procedural error. Booking follows standardized columns: station, backsight, height of instrument, foresight, elevation. Turning points support multiple-setup surveys with progressive elevation transfer.

## 5.2 Angular Measurement

Theodolite and total station exercises measure horizontal and vertical angles, practising face-left and face-right observations to average out instrumental bias. Sets of repeated observations expose the effects of pointing error, atmospheric refraction, and levelling error.

## 5.3 GIS and Data Integration

Students build simple geographic information system projects in QGIS or ArcGIS, layering topographic base maps, property boundaries, utilities, aerial imagery, and survey data. Attribute queries and spatial analyses (buffers, intersections, slope calculations) transform raw spatial data into design-relevant information.

# Chapter 6: Professional Practice, Ethics, Licensure, and Public Communication

## 6.1 Professional Engineering in Canada

Provincial Professional Engineers Acts reserve the practice and title of engineering to licensed members. The path to licensure includes an accredited engineering degree, documented engineering experience (typically four years under appropriate supervision), a professional practice examination, and good character. **Engineers Canada** and **Engineering Geoscience Canada** maintain national accreditation standards and model codes.

## 6.2 Code of Ethics

Professional codes place public safety, health, and welfare above duties to client or employer. Duties include working within competence, honest dealing, confidentiality, reporting illegal or unethical conduct, and fair professional relationships. Environmental engineers carry additional duties under statutes addressing spills, waste, and protected species.

## 6.3 Guidelines and Regulations

Environmental and geological engineers work within a layered regulatory framework: federal statutes (CEPA, Fisheries Act, Impact Assessment Act), provincial legislation (e.g., Ontario *Environmental Protection Act*, *Ontario Water Resources Act*), municipal bylaws, and industry standards (CSA, ASTM). Practice guidelines issued by regulators — for example, the *Record of Site Condition* regime for contaminated sites — define reporting forms and technical requirements.

## 6.4 Public and Stakeholder Communication

Many engineering projects require public consultation. Good practice engages stakeholders early, listens to concerns, presents technical content in accessible language, acknowledges uncertainty, and documents input. Indigenous consultation in Canada is grounded in constitutional duties and the United Nations Declaration on the Rights of Indigenous Peoples; engineers contribute to but do not replace Crown consultation.

## 6.5 Written and Oral Reporting

Effective engineering communication is structured, concise, and tied to evidence. Reports separate factual content from interpretation. Oral presentations adapt content to audience — technical peers, regulators, clients, or the general public. Visual aids are designed with the audience's question in mind, not the author's convenience.

<div class="remark">
<strong>First-year habits.</strong> The tools introduced in this course — sketching, measurement, drafting, GIS, ethical reflection, clear communication — are the habits that engineers practise for an entire career. Cultivating them early matters more than mastering any single software package.
</div>

Environmental and geological engineering ask their practitioners to integrate physical sciences with social responsibility, managing uncertainty about the natural world while serving communities that depend on safe water, stable ground, and a liveable climate. The first-year course launches that lifelong practice.
