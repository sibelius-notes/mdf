---
title: "OPTOM 106: Geometrical, Physical and Visual Optics"
prof: "Jennifer Hunter"
subjects: "OPTOM"
---

## Sources and References

**Primary textbook** — Steven H. Schwartz, *Geometrical and Visual Optics: A Clinical Introduction*, 3rd ed. (McGraw-Hill, 2019).
**Supplementary texts** — Michael P. Keating *Geometric, Physical, and Visual Optics*; A.G. Bennett & R.B. Rabbetts *Bennett & Rabbetts' Clinical Visual Optics*; Frank L. Pedrotti & Leno S. Pedrotti *Introduction to Optics*; Eugene Hecht *Optics*; Max Born & Emil Wolf *Principles of Optics*.
**Online resources** — MIT OpenCourseWare 8.03 "Physics III: Vibrations and Waves" and 2.710 "Optics"; University of Arizona College of Optical Sciences open materials.

## 1. The Nature of Light — Wave Theory and Propagation

Light is an electromagnetic disturbance: coupled oscillations of electric and magnetic fields propagating at a speed that, in vacuum, equals \( c \approx 2.998 \times 10^{8} \) m/s. A monochromatic plane wave can be written as \( E(z,t) = E_0 \cos(kz - \omega t + \varphi) \), where \( k = 2\pi/\lambda \) is the wavenumber and \( \omega = 2\pi f \) is the angular frequency. The dispersion relation \( c = f\lambda \) ties temporal frequency to spatial wavelength, and because frequency is fixed by the source, it is the wavelength, not the frequency, that changes when light passes from one medium to another.

The visible band stretches roughly from 380 nm (violet) to 760 nm (deep red). Shorter wavelengths bend more strongly in glass, giving rise to dispersion and chromatic aberration. In any transparent medium the phase velocity drops to \( v = c/n \), where \( n \) is the refractive index; for the crown glass used in ophthalmic lenses \( n \approx 1.523 \), for water \( n \approx 1.333 \), and for the cornea \( n \approx 1.376 \).

Two complementary descriptions dominate the course. Geometrical optics replaces the wave by a pencil of rays normal to the wavefront. It is accurate when apertures and features are much larger than \( \lambda \) and captures image formation, focusing, and the law of reflection. Physical (wave) optics retains the phase and amplitude, and is necessary whenever interference, diffraction, polarization, or coherence matters. Huygens's principle bridges the two: every point on a wavefront acts as a source of secondary spherical wavelets, and their envelope at a later time gives the new wavefront. Rectilinear propagation in a homogeneous medium and the laws of reflection and refraction at interfaces all fall out of Huygens's construction, as does the sharp-edge shadow that only breaks down at small apertures where diffraction takes over. Fermat's principle — that a ray follows the path of stationary optical path length \( \int n \, ds \) — provides a second unifying foundation.

## 2. Reflection from Plane and Spherical Mirrors

At any smooth interface, the law of reflection states that the angle of incidence equals the angle of reflection, both measured from the surface normal, and incident ray, reflected ray, and normal lie in a single plane. A plane mirror forms a virtual image the same size as the object, located as far behind the mirror as the object lies in front of it, with a left–right inversion. Specular reflection preserves image information; diffuse (matte) reflection scatters it and makes the surface visible but not imaging.

Curved mirrors introduce focusing power. For a spherical mirror of radius of curvature \( R \), the paraxial focal length is \( f = R/2 \). Taking the concave (converging) mirror as positive, its focal point lies in front of the reflecting surface. The Cartesian mirror equation is

\[ \frac{1}{s'} + \frac{1}{s} = \frac{2}{R} = \frac{1}{f}, \]

and the transverse (lateral) magnification is \( m = -s'/s \). A positive \( m \) means an erect image, a negative \( m \) an inverted one; \( |m| > 1 \) enlarges and \( |m| < 1 \) reduces.

Concave mirrors produce real inverted images for objects beyond the focal point and virtual erect magnified images for objects inside it — the principle of the shaving or makeup mirror, and clinically of the retinoscope's self-illuminated mirror. Convex mirrors always form virtual, erect, minified images with a wider field of view, which is why they are used for side-view mirrors and for surveillance. In ophthalmology, a keratometer uses the cornea as a convex mirror: by measuring the size of a reflected mire of known dimensions, one deduces the anterior corneal radius and so corneal power. Spherical mirrors suffer from spherical aberration at large apertures, which parabolic mirrors correct for on-axis but not for oblique rays.

## 3. Refraction at Plane Surfaces

When a ray crosses a boundary between two transparent media it bends according to Snell's law:

\[ n_1 \sin\theta_1 = n_2 \sin\theta_2. \]

Angles are measured from the normal, and the refracted ray lies in the plane of incidence. Light entering a denser medium bends toward the normal; leaving it, it bends away. A useful paraxial approximation replaces \( \sin\theta \) by \( \theta \) for small angles (say, less than 10 degrees), giving linear relationships that underpin Gauss's paraxial theory of image formation.

When light travels from a denser to a rarer medium (for example from glass into air), it can refract out only if the angle of incidence is below a threshold called the critical angle \( \theta_c \), defined by \( \sin\theta_c = n_2/n_1 \). For glass–air \( \theta_c \approx 41^\circ \); for water–air, \( \approx 48.6^\circ \). Beyond \( \theta_c \), total internal reflection (TIR) returns all the light back into the denser medium. TIR is the mechanism of the fibre-optic cable, the Porro prisms of binoculars, and the clinical gonioscopy lens, which bypasses the cornea's TIR to let the examiner see the anterior chamber angle.

A plane interface seen from above shifts images vertically: an object at real depth \( d \) in water appears at an apparent depth \( d' = d \, (n_2/n_1) \). The same relationship makes a fish look shallower than it is, and it is why the iris and crystalline lens of a patient's eye, viewed through the cornea, appear displaced forward. A slab of glass of thickness \( t \) laterally displaces rays without changing their direction, a fact exploited in optical flats and plane-parallel micrometers. None of these plane-surface refractions change vergence in the sense of wavefront curvature, but they shift positions and can rotate images through angles when the surfaces are tilted.

## 4. Prisms — Geometric and Ophthalmic

A prism is a wedge of transparent material whose two refracting faces meet at an apex angle \( A \). For a thin prism of apex \( A \), the deviation produced on a paraxial ray is approximately

\[ \delta \approx (n - 1) A, \]

independent of the angle of incidence. For finite prisms, minimum deviation \( \delta_{\min} \) occurs when the ray passes symmetrically, yielding \( n = \sin((A + \delta_{\min})/2) / \sin(A/2) \) — the classical Fraunhofer method for measuring refractive index. Because \( n \) depends on wavelength, blue light deviates more than red, producing dispersion; the difference \( n_F - n_C \) across the hydrogen F and C lines, divided by \( n_D - 1 \), defines the Abbe number that measures how chromatically clean a glass is.

In ophthalmic practice, prism power is quoted in prism dioptres (\( \Delta \)), where \( 1\,\Delta \) displaces a ray 1 cm at a distance of 1 m, i.e. \( \tan\delta = 0.01 \). Prisms are specified by their base direction — base-up, base-down, base-in, or base-out — because that direction, opposite the apex, tells the clinician which way the image is deflected. A prism does not form an image of its own; it simply shifts rays and thereby the perceived location of whatever scene is viewed through it.

Ophthalmic prisms are used diagnostically to measure phorias and to dissociate the two eyes, and therapeutically to compensate for strabismus or diplopia. A rotary Risley prism combines two counter-rotating prisms of equal power so that their summed horizontal component can be continuously varied from zero to twice the single prism's power, allowing smooth measurement of fusional reserves. A thick lens viewed off-centre acts locally as a prism of power \( P = c \, F \), where \( c \) is the decentration in centimetres and \( F \) the lens power in dioptres — Prentice's rule, the origin of unwanted prismatic side-effects in decentred spectacles.

## 5. Refraction at Spherical Surfaces

A single refracting spherical surface of radius \( R \) between media of indices \( n_1 \) and \( n_2 \) obeys the paraxial equation

\[ \frac{n_2}{s'} - \frac{n_1}{s} = \frac{n_2 - n_1}{R}. \]

The quantity on the right, \( P = (n_2 - n_1)/R \), is the surface power, measured in dioptres when \( R \) is in metres. For the anterior cornea (\( n_1 = 1 \), \( n_2 \approx 1.376 \), \( R \approx 7.8 \) mm) this gives roughly \( +48 \) D, the largest single contribution to the eye's optical power.

The same equation is written in vergence form as \( V' = V + P \), where \( V = n_1/s \) is the incident vergence and \( V' = n_2/s' \) the refracted vergence. Vergence is positive for converging light, negative for diverging, and zero for collimated light from infinity. Because vergence simply adds to power at each surface, the vergence method reduces complicated ray-tracing to arithmetic, a significant pedagogical and clinical advantage.

Lateral magnification at a single surface is \( m = (n_1 s')/(n_2 s) \). Signs follow the Cartesian convention used throughout the course: distances measured from the surface along the direction of travelling light are positive, against it negative. Real images form on the transmission side with positive \( s' \); virtual images appear on the incidence side with negative \( s' \).

A spherical refracting interface has two distinct focal lengths, \( f = -n_1/P \) on the object side and \( f' = n_2/P \) on the image side, reflecting the differing indices. Their ratio, \( f'/f = -n_2/n_1 \), appears whenever paraxial imaging spans media of different refractive index, as in the eye. Extending the single-surface formula to several successive spherical interfaces, refracted vergence becomes incident vergence after accounting for the reduced distance \( t/n \) of propagation in the intervening medium. Chaining those steps is the substance of step-along ray tracing through lens systems and schematic eyes.

## 6. Thin Lenses and the Vergence Method

A thin lens is an idealization whose thickness is negligible compared with object and image distances. For a lens of refractive index \( n \) with front radius \( R_1 \) and back radius \( R_2 \), the lensmaker's equation gives its power in air:

\[ P = (n - 1)\left(\frac{1}{R_1} - \frac{1}{R_2}\right). \]

Combined with the thin-lens imaging equation

\[ \frac{1}{s'} - \frac{1}{s} = \frac{1}{f} = P, \]

this yields image distance, image size (\( m = s'/s \)), and sign (real versus virtual, erect versus inverted) for any paraxial object. A converging lens has positive power and collects parallel light to a real secondary focal point at \( f' > 0 \); a diverging lens has negative power and spreads parallel light as if from a virtual secondary focal point.

The vergence method restates imaging as \( V' = V + P \). For an object \( 50 \) cm in front of a \( +5 \) D lens, \( V = -2 \) D, \( V' = +3 \) D, so \( s' = +33.3 \) cm — a real image one-third of a metre behind the lens. Two thin lenses in contact combine as \( P_{\text{eq}} = P_1 + P_2 \); separated by a distance \( d \) they combine as \( P_{\text{eq}} = P_1 + P_2 - d P_1 P_2 \), which is the foundation for spectacle–contact–lens conversion and for understanding the Gullstrand relation used later for the eye.

Thin lenses introduce aberrations: spherical aberration (marginal rays focus shorter than paraxial ones), coma, astigmatism of oblique pencils, field curvature, distortion, and chromatic aberration because \( n(\lambda) \) is wavelength-dependent. Achromatic doublets combine a positive crown element with a negative flint element chosen so their opposite dispersions cancel while leaving net positive power. Pupils and stops control which rays actually pass through a system, defining the entrance pupil (object-side image of the stop) and exit pupil (image-side image). The pupil ultimately limits both irradiance and the resolution set by diffraction.

## 7. Thick Lenses and Principal Planes

When a lens thickness \( t \) is not negligible, one treats it as two refracting surfaces with paraxial stepping between them. Gullstrand's equation gives the equivalent power of two surfaces of powers \( P_1 \) and \( P_2 \) separated by \( t \) in medium \( n \):

\[ P_{\text{eq}} = P_1 + P_2 - \frac{t}{n}P_1 P_2. \]

This generalizes the thin-lens formula by adding the "reduced-thickness" correction \( t/n \). For a thick lens, the cardinal points — two focal points, two principal planes \( H \) and \( H' \), and two nodal points \( N \) and \( N' \) — fully describe its paraxial behaviour. Distances measured from the principal planes obey the thin-lens form

\[ \frac{1}{s'} - \frac{1}{s} = P_{\text{eq}}, \]

so the two principal planes act as a virtual thin lens inserted into the system, restoring the elegant simplicity of the vergence description.

Principal planes are planes of unit lateral magnification: a ray that strikes \( H \) at height \( h \) emerges from \( H' \) at the same height. The nodal points are planes of unit angular magnification; for a lens in air they coincide with the principal points, but if the object and image media differ — as in the eye, with air in front and vitreous behind — they shift by an amount proportional to the index mismatch. The focal length measured from the secondary principal plane is \( f' = n'/P \); from the primary, \( f = -n/P \). For a lens in air both are \( 1/P \) in absolute value.

Ray construction for a thick lens proceeds exactly as for a thin lens, but using the principal planes as the "bending" sites and the cardinal points as reference. A parallel ray bends at \( H' \) through \( F' \); a ray through \( F \) emerges parallel from \( H' \); a nodal ray passes undeviated through \( N \) and \( N' \). These three constructions intersect at the image point, and provide a graphical sanity check on algebraic computation.

## 8. Cylindrical and Toric Lenses

Not every refracting surface is spherical. A pure cylindrical surface has power in only one meridian — the one perpendicular to the cylinder axis — and zero power along the axis itself. Incoming plane waves are focused to a line parallel to the axis rather than to a point. A toric surface is a hybrid: two different radii of curvature in two perpendicular meridians, producing two distinct powers and therefore two perpendicular line foci separated along the optical axis.

The region of space between those two line foci is the conoid of Sturm, a characteristic cigar-shaped bundle of rays. Midway between the line foci, in both geometric and diopter space, is the circle of least confusion: the smallest disk of light and the best compromise focus for uncorrected astigmatic eyes. The two principal powers, \( P_1 \) and \( P_2 \), and their axis angle together define the lens. The interval of Sturm is \( |P_1 - P_2| \) in dioptres, and represents the amount of astigmatism.

Clinicians write astigmatic prescriptions in three equivalent forms. Plus-cylinder form states a spherical power plus a positive cylindrical addition at a given axis. Minus-cylinder form writes the opposite, which modern optometric practice tends to prefer. The cross-cylinder form lists the two principal powers on two perpendicular meridians. Conversion between them uses the identities \( \text{sph}' = \text{sph} + \text{cyl} \), \( \text{cyl}' = -\text{cyl} \), and axis shifts by \( 90^\circ \).

Cylindrical lenses correct regular corneal or lenticular astigmatism by adding power only along the deficient meridian. A Jackson cross-cylinder, a ±0.25 D toric with its two axes mutually perpendicular, is a refinement tool used during refraction to fine-tune axis and power. Oblique astigmatism induced by ordinary spherical lenses, when worn at a pantoscopic tilt, introduces its own small cylindrical error that high-quality frame fitting mitigates.

## 9. Interference and Coherence

Interference arises whenever two or more coherent waves overlap: their instantaneous amplitudes add, so intensities do not simply sum. For two equal-amplitude waves with phase difference \( \delta \), the resultant intensity is \( I = 4 I_0 \cos^2(\delta/2) \), varying between zero (destructive) and \( 4 I_0 \) (constructive). The condition for constructive interference is an optical path difference equal to an integer number of wavelengths, \( m\lambda \), and for destructive interference \( (m + \tfrac{1}{2})\lambda \).

Young's double-slit experiment produces fringes of spacing \( \Delta y = \lambda L / d \), where \( d \) is the slit separation and \( L \) the distance to the screen. This is the classical proof that light has wave character. Division of amplitude rather than of wavefront gives thin-film interference, responsible for oil-on-water colours, Newton's rings, and the antireflection coatings applied to spectacle and camera lenses. A quarter-wave layer of refractive index \( \sqrt{n_s} \), where \( n_s \) is the substrate's index, cancels the reflection at one chosen wavelength by destructive interference between front-surface and back-surface reflections. Multilayer stacks extend the effect across the visible band.

Coherence is the quantitative requirement for visible interference. Temporal coherence is characterized by the coherence time \( \tau_c \) or the coherence length \( l_c = c\tau_c \), beyond which the phase of the wave becomes uncorrelated with itself. A white-light source has \( l_c \) on the order of a micron, so interference is only visible over very short path differences, while a stabilized laser can have \( l_c \) of kilometres. Spatial coherence, set by the angular size of the source, limits how far apart two pinholes can be and still produce fringes — the Van Cittert–Zernike result. Interferometers such as the Michelson and Fabry–Pérot exploit these quantities to measure tiny changes in optical path with sub-wavelength precision, and clinically, optical coherence tomography (OCT) uses low-coherence interferometry to build micron-resolution cross-sections of the retina and anterior segment.

## 10. Diffraction, Gratings, and the Resolution Limit

Diffraction is the bending and spreading of light that occurs whenever a wavefront is obstructed. In the Fraunhofer (far-field) regime, a single slit of width \( a \) produces an intensity pattern \( I(\theta) = I_0 \, \text{sinc}^2(\pi a \sin\theta / \lambda) \), with zeros at \( a\sin\theta = m\lambda \) for \( m = \pm 1, \pm 2, \ldots \). A circular aperture of diameter \( D \) instead produces the Airy pattern, whose central disk has angular radius \( \theta = 1.22 \lambda / D \). Fresnel (near-field) diffraction applies when neither source nor screen is effectively at infinity, and is computed from the Fresnel integrals or the Cornu spiral.

A diffraction grating is a periodic array of \( N \) slits of spacing \( d \). Constructive interference occurs at angles satisfying the grating equation \( d \sin\theta_m = m\lambda \), producing sharp principal maxima for each diffraction order \( m \). As \( N \) grows, the maxima narrow and the spectral resolving power \( \lambda / \Delta\lambda = mN \) grows with them. Bragg's law \( 2d \sin\theta = m\lambda \) is the analogue for three-dimensional crystals and for the stack structures behind holographic notch filters and fibre Bragg gratings.

The Rayleigh criterion says that two incoherent point sources are barely resolved by a circular aperture when the central maximum of one Airy disk coincides with the first dark ring of the other; the limiting angular separation is

\[ \theta_{\min} = 1.22 \frac{\lambda}{D}. \]

For a human eye with a 3 mm pupil at \( \lambda = 555 \) nm, this gives roughly \( 0.8 \) arcmin, consistent with the one-minute recognition criterion behind the standard Snellen acuity chart and its 20/20 benchmark. Real eyes are further limited by photoreceptor sampling and by monochromatic and chromatic aberrations; aberration-corrected optics can approach the diffraction-limited ideal but not exceed it.

## 11. Polarization and Polarized Light

Polarization describes the direction in which the electric field of an electromagnetic wave oscillates. Natural (unpolarized) light is an incoherent superposition of many polarization states. Linear polarization has \( E \) confined to a single plane; circular and elliptical polarizations have \( E \) rotating over a cycle. A linear polarizer transmits only the component along its transmission axis; Malus's law gives the transmitted intensity as \( I = I_0 \cos^2\theta \), with \( \theta \) the angle between the incoming polarization and the axis.

Reflection partially polarizes light. At Brewster's angle \( \theta_B = \arctan(n_2/n_1) \), the reflected beam is completely linearly polarized perpendicular to the plane of incidence, and the reflected and refracted rays are orthogonal. Polarized sunglasses exploit this fact to suppress horizontally polarized glare from water and roads. Birefringent crystals such as calcite split an incoming ray into an ordinary and an extraordinary ray with mutually orthogonal polarizations and different refractive indices; retarder plates (quarter- and half-wave) use this index difference to convert linear to circular polarization or to rotate the axis of linear polarization, and form the basis of liquid-crystal displays.

In the eye, polarization plays a minor but real role: Haidinger's brushes — a faint yellow hour-glass pattern seen in the fovea under uniform polarized illumination — arise from the dichroism of macular pigment, and can be used clinically to verify foveal fixation. Polarized slit-lamp illumination reduces corneal reflections, and polarization-sensitive OCT reveals retinal nerve fibre layer structure by measuring the birefringence of ganglion-cell axon bundles.

## 12. Simple Eye Models and Paraxial Ocular Optics

Real eyes are complicated: a four-surface system (anterior and posterior cornea, anterior and posterior lens) with gradient-index crystalline lens and aspheric corneal profile. For most calculations, simplified paraxial models are more than adequate. Listing's reduced eye replaces the whole system by a single refracting surface of power \( \approx +60 \) D, radius \( 5.55 \) mm, separating air from a uniform medium of index \( \approx 1.333 \). The single principal plane sits at the cornea and the single nodal point about \( 1.67 \) cm in front of the retina; the retina lies about \( 2.22 \) cm behind the cornea. Simple as it is, the reduced eye yields image sizes, retinal blur circles, and accommodation calculations to within a few percent of far more elaborate models.

Gullstrand's schematic eye is the next step up. It introduces six refracting surfaces (including a gradient-index lens modelled as core plus cortex) and correct separation between cornea, lens, and retina. In its relaxed form it has an equivalent power of about \( +58.64 \) D; in full accommodation, about \( +70.57 \) D. Reduced variants of Gullstrand's eye combine the multiple surfaces into one equivalent thick-lens system. These models accurately predict the positions of the principal planes (just inside the anterior chamber), the nodal points (about 7 mm behind the cornea), and the sites where the retinal image actually forms.

Accommodation is modelled as a change in crystalline-lens curvature, increasing lens power by up to about \( 14 \) D in children and decreasing with age — a process clinically called presbyopia. The near point of accommodation recedes from roughly 7 cm at age 10 to nearly 1 m by age 60, reflecting the exponential loss of lens elasticity. For vergence calculations at the eye, accommodation simply adds positive power to the crystalline lens in Gullstrand-like models, shifting the retinal conjugate from infinity to the near point. Pupil diameter, which varies from about 2 to 8 mm, sets both the entrance pupil and, via diffraction, the best-case resolution.

## 13. Refractive Error — Myopia, Hyperopia, Astigmatism

Emmetropia is the condition in which distant parallel rays, with accommodation relaxed, are focused exactly on the retina — a fortunate match between axial length and total ocular power. Departures from this ideal are collectively called ametropia. Myopia ("short-sightedness") arises when the eye is either too long or too strongly powered, so parallel rays converge in front of the retina. The far point lies at a finite distance in front of the eye; anything beyond it is blurred. Hyperopia ("long-sightedness") is the opposite: parallel rays would converge behind the retina, and the eye must accommodate continuously to focus even distant objects. Young hyperopes may overcome small degrees of hyperopia by accommodating, but as they age this reserve diminishes and distance blur appears.

Astigmatism introduces two different powers in two perpendicular meridians, so parallel light forms a Sturm's conoid inside the eye rather than a single focal point. Regular astigmatism has perpendicular principal meridians and is correctable by a toric lens; irregular astigmatism, as in keratoconus, has no fixed axes and usually needs a rigid contact lens or corneal reshaping. Presbyopia, as noted above, is age-related loss of accommodative amplitude and is not strictly a refractive error of the unaccommodated eye but a dynamic failure of the accommodative system.

Retinal image blur in uncorrected ametropia can be analysed as a defocus term acting on the pupil function. For a myope of \( M \) dioptres viewing a distant object, the rays diverge from the ideal image point by \( M \) D and produce a blur circle on the retina of diameter approximately \( d_{\text{blur}} = M \, D_{\text{pupil}} / 60 \), so a 3-mm pupil in a 2 D myope produces about 100 micrometres of blur — several photoreceptor widths, enough to degrade letters noticeably. Smaller pupils (from bright light, or from pinhole occluders used in the clinic) reduce this blur and explain why squinting and pinholes temporarily improve acuity in uncorrected ametropes.

## 14. Correcting Ametropia with Spectacles and Contact Lenses

Correction works by shifting the apparent object vergence to match the eye's far point. A myopic eye with far point at distance \( f_p \) in front of the cornea needs a diverging lens whose secondary focal point coincides with that far point. Placed at the corneal plane (contact lens case) it has power \( P_{\text{CL}} = -1/f_p \) in dioptres with \( f_p \) in metres. Placed at the spectacle plane, typically \( 14 \) mm in front of the cornea, it has a different effective power: the back-vertex distance formula

\[ P_s = \frac{P_c}{1 - d P_c} \]

converts between contact-lens power \( P_c \) and spectacle power \( P_s \) with vertex distance \( d \). For high myopes the difference can exceed a full dioptre, which is why high-minus contact lens and spectacle prescriptions do not numerically agree.

A hyperopic eye needs a converging lens to bring the virtual far point forward of the retina into emmetropic alignment. Again the vertex-distance formula relates spectacle and contact powers. Astigmatic correction uses a toric lens whose cylindrical component equals the interval of Sturm, aligned along the required axis. Multi-focal corrections add a reading segment of extra plus power (the add), and progressive-addition lenses grade the power smoothly from distance to near.

Spectacle-corrected eyes acquire side-effects absent from the naked eye. Prism-by-Prentice's-rule shifts the perceived direction of objects off-axis. Magnification differs for plus and minus lenses: a myope's spectacles minify the retinal image, a hyperope's magnify it, and the difference can approach 7 percent per dioptre at the standard vertex distance. Anisometropic patients — those with unequal refractive errors — therefore experience aniseikonia (unequal retinal image size) that contact lenses largely avoid because their vertex distance is zero. Rigid gas-permeable contact lenses additionally mask irregular corneal astigmatism by substituting their own spherical front surface, forming a tear-lens layer whose optics can be computed by the same vergence methods used throughout this course.

## 15. Lasers and Their Optical Principles

A laser (light amplification by stimulated emission of radiation) is a source of highly coherent, highly directional, often nearly monochromatic light. Its physics rests on three ingredients: a gain medium whose atoms or molecules can be driven into a population inversion (more atoms in an upper level than in a lower one); a pump that supplies energy to create that inversion; and an optical cavity, usually a pair of highly reflective mirrors, that feeds stimulated photons back through the gain medium until a standing-wave mode oscillates.

Stimulated emission, predicted by Einstein in 1917, is the cloning of a photon by a suitably excited atom. The new photon shares the stimulating photon's frequency, phase, direction, and polarization. Repeated amplification in the cavity produces an output beam of extraordinary spatial and temporal coherence, often in a clean Gaussian transverse mode whose waist and divergence obey

\[ \theta \approx \frac{\lambda}{\pi w_0}, \]

where \( w_0 \) is the waist radius. Because divergence is diffraction-limited and close to zero, laser beams can be focused to spot sizes near the wavelength, producing immense irradiance from modest powers. Temporal coherence lengths of metres to kilometres make lasers the natural sources for interferometry, holography, and OCT.

Clinically, lasers are ubiquitous. Argon and frequency-doubled Nd:YAG lasers photocoagulate the retina in diabetic retinopathy and retinal tears. The Q-switched Nd:YAG laser delivers nanosecond pulses that photodisrupt thickened posterior capsules after cataract surgery. Excimer lasers at 193 nm ablate corneal tissue with sub-micron precision, enabling LASIK and PRK refractive surgery. Femtosecond lasers create plasma-bubble cleavage planes inside cornea or lens without harming surrounding tissue, used in bladeless LASIK and laser-assisted cataract surgery. In each case the laser's coherence, directionality, and focusability translate directly into therapeutic effect, and understanding those properties rests on everything the course has covered.
