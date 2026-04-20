---
title: "SYDE 575: Image Processing"
subjects: "SYDE"
---

## Sources and References

- Gonzalez and Woods, *Digital Image Processing*.
- Jain, *Fundamentals of Digital Image Processing*.
- Pratt, *Digital Image Processing*.
- Szeliski, *Computer Vision: Algorithms and Applications*.
- Bovik (ed.), *Handbook of Image and Video Processing*.
- Castleman, *Digital Image Processing*.
- MIT and Stanford public image-processing and computer-vision course materials used to calibrate scope and emphasis.

---

# SYDE 575 — Image Processing

Image processing sits at the intersection of physics, signal processing, and perception. We treat an image as a measurement produced by an imaging system that samples light reflected from, emitted by, or transmitted through a scene, and we ask what linear and nonlinear operators can be applied to that measurement to suppress noise, accentuate structure, compress redundancy, or extract features useful for downstream interpretation. These notes develop the subject in a textbook voice, starting from the physical model of the imaging chain and moving through the core operator families — point operations, spatial filters, frequency-domain filters, denoising and restoration methods — before treating edge detection, segmentation, morphology, compression, registration, and feature detection. Applications in medical imaging, remote sensing, and machine vision motivate and ground the methods.

<div style="border-left:4px solid #4a90e2;padding:0.6em 1em;background:#eef5fc;margin:1em 0;">
<strong>Guiding perspective.</strong> <em>Almost every method in this course is either a linear shift-invariant (LSI) system acting on a 2D signal or a principled deviation from LSI processing — nonlinear, adaptive, data-dependent, or statistical. Keeping the LSI baseline in mind clarifies when classical Fourier reasoning applies and when it must yield to something richer.</em>
</div>

## 1. Quantitative Models of Imaging Systems

### 1.1 Radiometry and scene formation

The quantity an optical sensor actually captures is radiant power per unit area per unit solid angle, called **radiance**. A Lambertian surface with albedo \( \rho \) illuminated by irradiance \( E \) emits radiance

\[
L = \frac{\rho E}{\pi}.
\]

The sensor integrates a portion of this radiance over its aperture, over its pixel area, over the spectral response of the photodetector, and over the exposure time. A first-order model writes the pixel value as

\[
I(x,y) = \int_{T} \int_{\lambda} \int_{A_p} S(\lambda)\, L(x',y',\lambda,t)\, dx'\,dy'\,d\lambda\,dt + n(x,y),
\]

where \( S(\lambda) \) is the spectral responsivity and \( n \) bundles electronic noise. For many purposes a separable reflectance–illumination decomposition suffices:

\[
I(x,y) = r(x,y)\,\ell(x,y),
\]

with \( r \in [0,1] \) reflectance and \( \ell \) illumination. This factorization underpins homomorphic filtering and colour-constancy methods.

### 1.2 The point-spread function and the imaging PSF chain

Optical blur, diffraction, defocus, motion, atmospheric turbulence, and sensor integration each contribute a **point-spread function** (PSF). Because convolution is associative, the net imaging PSF is the convolution of the individual PSFs:

\[
h_{\text{sys}} = h_{\text{optics}} * h_{\text{motion}} * h_{\text{sensor}}.
\]

If the imaging chain is approximately linear and shift-invariant over the field, the recorded image is

\[
g(x,y) = (h_{\text{sys}} * f)(x,y) + n(x,y),
\]

where \( f \) is the ideal image. In the frequency domain this becomes

\[
G(u,v) = H_{\text{sys}}(u,v)\, F(u,v) + N(u,v).
\]

The magnitude \( \lvert H_{\text{sys}} \rvert \) is the **modulation transfer function** (MTF) and quantifies how the system attenuates each spatial frequency.

### 1.3 CCD and CMOS sensors

CCDs shift photogenerated charge packets across the array to a common output amplifier, giving uniform gain but high power consumption. CMOS sensors integrate an amplifier per pixel (active-pixel sensor, APS), allow random access, and dominate consumer imaging. Both are fundamentally photon-counting devices and obey the same first-order noise model:

- **Photon shot noise**, Poisson-distributed, variance equal to the mean signal in photoelectrons.
- **Dark current noise**, thermally generated carriers; grows with exposure and temperature.
- **Read noise**, the amplifier and ADC contribution, usually Gaussian.
- **Fixed-pattern noise** from pixel-to-pixel gain and offset variation (PRNU, DSNU).
- **Quantization noise** from the ADC, variance \( \Delta^2/12 \) for step \( \Delta \) under a uniform-distribution assumption.

A compact signal model treats the captured value as

\[
g = \alpha\, \mathrm{Poisson}(\beta f) + \mathcal{N}(0,\sigma_r^2),
\]

which collapses to approximately Gaussian with signal-dependent variance \( \sigma^2(f) = a f + b \).

### 1.4 Colour imaging and the Bayer mosaic

Most colour sensors place a colour filter array (typically Bayer: RGGB) over monochrome pixels, so one-third of the pixels carry R, one-third B, and half carry G. **Demosaicing** estimates the missing two channels per pixel. Bilinear interpolation is cheap but induces zipper artefacts on edges; edge-directed and gradient-based demosaicers exploit the assumption that high-frequency content is approximately common across colour channels.

<div style="border-left:4px solid #7bbf6a;padding:0.6em 1em;background:#f0f8ec;margin:1em 0;">
<strong>Design lesson.</strong> <em>Image-processing algorithms rarely act on a raw physical measurement. They act on a value that has already been blurred by optics, sampled by a mosaic, quantized, white-balanced, and gamma-compressed. Knowing where in that chain an algorithm is applied determines which noise model and which prior is appropriate.</em>
</div>

## 2. Sampling and Quantization

### 2.1 The 2D sampling theorem

A continuous image \( f(x,y) \) with Fourier transform supported inside the rectangle \( \lvert u \rvert < B_x,\ \lvert v \rvert < B_y \) can be recovered from its samples on the lattice \( (m T_x, n T_y) \) provided

\[
T_x < \frac{1}{2 B_x}, \qquad T_y < \frac{1}{2 B_y}.
\]

Under these conditions the ideal reconstruction is

\[
f(x,y) = \sum_{m,n} f(m T_x, n T_y)\, \mathrm{sinc}\!\left(\tfrac{x}{T_x}-m\right)\mathrm{sinc}\!\left(\tfrac{y}{T_y}-n\right).
\]

Non-rectangular lattices — hexagonal, quincunx — sometimes allow lower sample density for a given bandwidth, but rectangular grids remain standard because of addressing simplicity.

### 2.2 Aliasing

Violating the sampling bound folds high-frequency content back into the baseband. In images aliasing appears as jagged diagonal edges, moiré fringes on periodic textures, and false colour in Bayer-mosaic cameras. Mitigations include an optical low-pass (a birefringent anti-alias filter), smaller pixel pitch, and oversampling followed by digital low-pass filtering before downsampling.

### 2.3 Quantization, companding, dithering

A uniform quantizer with step \( \Delta \) has mean-squared error \( \Delta^2/12 \) for signals much larger than \( \Delta \). Non-uniform quantizers (Lloyd–Max) adapt the step to the signal PDF and minimize MSE for known distributions. Gamma-compression precompensates the display transfer function and simultaneously shapes quantization noise to be perceptually uniform. **Dithering** — adding a small, often blue-noise, random signal before quantization — decorrelates quantization error from the signal, trading contouring for fine-grained noise that the visual system suppresses more effectively.

## 3. Image Transforms

### 3.1 The 2D discrete Fourier transform

For an \( M \times N \) image

\[
F(u,v) = \sum_{x=0}^{M-1}\sum_{y=0}^{N-1} f(x,y)\, e^{-j 2\pi(ux/M + vy/N)}.
\]

Separability means the 2D DFT factors into 1D DFTs along rows and columns, and a full transform costs \( O(MN\log MN) \) with the FFT. Key properties used constantly in image processing:

- Convolution theorem: spatial convolution corresponds to pointwise multiplication in frequency.
- Parseval: total energy is preserved.
- Translation: shifts induce linear phase, leaving magnitude unchanged.
- Rotation: rotation in space rotates the spectrum by the same angle.

Because the DFT assumes periodicity, boundary discontinuities leak into the spectrum. **Windowing** (Hann, Hamming, Kaiser) tapers the image before transform to suppress leakage when the spectrum is inspected or filtered.

### 3.2 The discrete cosine transform

The **DCT-II** of a block \( f(x,y) \) of size \( N\times N \) is

\[
C(u,v) = \alpha(u)\alpha(v)\sum_{x,y} f(x,y)\cos\!\left[\tfrac{(2x+1)u\pi}{2N}\right]\cos\!\left[\tfrac{(2y+1)v\pi}{2N}\right],
\]

with normalization \( \alpha(0)=\sqrt{1/N},\ \alpha(k>0)=\sqrt{2/N} \). The DCT approaches the Karhunen–Loève transform for first-order Markov signals with high correlation, which is why it concentrates the energy of natural image blocks in a handful of low-frequency coefficients — the basis of JPEG.

### 3.3 Wavelets

Wavelet transforms decompose an image into a coarse approximation plus detail coefficients at successive scales, using a pair of low-pass and high-pass filters \( h_0,h_1 \) followed by downsampling by two. Separable 2D wavelets produce LL, LH, HL, HH subbands per level. Orthogonal families (Haar, Daubechies) and biorthogonal families (CDF 9/7 used by JPEG 2000) give compact, multiresolution representations that outperform the DCT for nonstationary content and allow shift-and-scale-aware denoising.

## 4. Spatial-Domain Enhancement: Point Operations

### 4.1 Contrast stretching and gamma

Point operations act pixelwise, \( g(x,y) = T(f(x,y)) \). Linear contrast stretch maps \( [f_{\min},f_{\max}] \) onto the display range. Gamma correction,

\[
g = c\, f^{\gamma},
\]

boosts dark tones when \( \gamma<1 \) and compresses them when \( \gamma>1 \). The human visual system's roughly power-law response to luminance means gamma-encoded values are perceptually more uniform than linear radiance.

### 4.2 Histogram equalization

Let the image intensity \( r \) have PDF \( p_r \). The mapping

\[
s = T(r) = \int_0^r p_r(w)\,dw
\]

is the cumulative distribution function and transforms \( r \) to a uniformly distributed \( s \). In discrete form

\[
s_k = \frac{L-1}{MN}\sum_{j=0}^{k} h_r(j),
\]

where \( h_r \) is the histogram and \( L \) the number of levels. **Histogram matching** generalizes this to target an arbitrary PDF by composing the equalization of the input with the inverse equalization of the target. Global equalization washes out locally low-contrast regions; **CLAHE** (contrast-limited adaptive histogram equalization) divides the image into tiles, equalizes each with a clipped histogram, and bilinearly interpolates across tile boundaries.

### 4.3 Logarithmic and bitplane operations

Log transformations compress dynamic range — useful for Fourier-magnitude displays. Bitplane slicing exposes the contribution of individual bits; the MSB plane alone often carries most of the visually important structure.

## 5. Spatial Filtering

### 5.1 Convolution and correlation

Discrete 2D convolution is

\[
(h*f)(x,y) = \sum_{s,t} h(s,t)\, f(x-s,\,y-t).
\]

For finite-support kernels the cost is proportional to the kernel area times the image area. Separable kernels (Gaussian, box) factor as \( h(x,y)=h_x(x)h_y(y) \), reducing cost from \( k^2 \) to \( 2k \) per pixel.

### 5.2 Smoothing filters

- **Box filter** — simplest averaging; cheap but has poor frequency response (sinc with side-lobes) and produces squarish artefacts.
- **Gaussian filter** — \( G_\sigma(x,y) = \frac{1}{2\pi\sigma^2}\exp\!\left(-\frac{x^2+y^2}{2\sigma^2}\right) \) — separable, isotropic, minimizes joint spatial–frequency uncertainty, and is essentially the canonical smoothing kernel.
- **Median filter** — nonlinear; preserves step edges while removing impulsive (salt-and-pepper) noise; slow in naive form but admits \( O(\log k) \) per pixel with histogram updates.

### 5.3 Sharpening and unsharp masking

Sharpening attenuates smooth content and emphasizes edges. The Laplacian

\[
\nabla^2 f = \partial_{xx} f + \partial_{yy} f
\]

is typically discretized as

\[
\begin{bmatrix}0&1&0\\1&-4&1\\0&1&0\end{bmatrix}\text{ or }\begin{bmatrix}1&1&1\\1&-8&1\\1&1&1\end{bmatrix}.
\]

Sharpened output is \( g = f - \lambda\,\nabla^2 f \). **Unsharp masking** generalizes this:

\[
g = f + \lambda\,(f - f_{\text{blur}}),
\]

where \( f_{\text{blur}} = G_\sigma * f \). The parameter \( \lambda \) controls sharpening strength; too large a value amplifies noise and produces haloing at edges.

## 6. Frequency-Domain Filtering

The convolution theorem lets us design filters by specifying \( H(u,v) \).

### 6.1 Low-pass, high-pass, band-reject

The **ideal low-pass filter** sets \( H=1 \) inside a disc of radius \( D_0 \) and zero outside. It has the smallest possible cutoff but produces ringing because its inverse transform is a 2D sinc with large side-lobes. **Butterworth** and **Gaussian** filters trade cutoff sharpness for ringing suppression:

\[
H_{\text{Butt}}(u,v) = \frac{1}{1 + (D(u,v)/D_0)^{2n}}, \qquad H_{\text{Gauss}}(u,v) = \exp\!\left(-\frac{D(u,v)^2}{2D_0^2}\right),
\]

where \( D(u,v) \) is the distance from the spectrum centre. High-pass versions are \( 1 - H_{\text{LP}} \). **Band-reject** (notch) filters suppress narrow frequency ranges and are invaluable for removing periodic interference, power-line hum patterns, and scanner stripes.

### 6.2 Homomorphic filtering

Using the reflectance–illumination decomposition \( I = r \ell \), take the logarithm:

\[
\log I = \log r + \log \ell.
\]

Illumination varies slowly (low frequencies), reflectance varies quickly (high frequencies). A single filter that attenuates low frequencies and amplifies high ones simultaneously compresses dynamic range and enhances local contrast. The output image is obtained by exponentiation.

## 7. Image Denoising

Denoising is the canonical inverse problem where the degradation model is \( g = f + n \), and the goal is to estimate \( f \) while preserving structure.

### 7.1 Gaussian and Wiener filters

A Gaussian smoothing filter is optimal under isotropic-signal-plus-isotropic-noise assumptions but blurs edges. The **Wiener filter** is optimal in MSE when signal and noise PSDs are known:

\[
H_{\text{W}}(u,v) = \frac{S_f(u,v)}{S_f(u,v) + S_n(u,v)}.
\]

In practice PSDs are estimated locally or from training data.

### 7.2 Median and order-statistic filters

Replacing each pixel by the median of its neighbourhood is robust to impulse noise and preserves step edges up to the kernel radius. Generalizations — \( \alpha \)-trimmed mean, rank-conditioned operators — interpolate between mean and median.

### 7.3 Bilateral filter

The bilateral filter weights neighbours by both spatial proximity and intensity similarity:

\[
g(x) = \frac{1}{W(x)}\sum_{y\in\Omega_x} G_{\sigma_s}(\lVert x-y\rVert)\, G_{\sigma_r}(\lvert f(x)-f(y)\rvert)\, f(y),
\]

with normalizer \( W(x) \). It is nonlinear (the range kernel depends on intensities), preserves edges, and has a fast approximation via the bilateral grid.

### 7.4 Non-local means

Non-local means (NLM) exploits the fact that natural images contain many similar patches. For each patch it averages other patches in the image, weighting by patch similarity:

\[
\hat f(x) = \frac{1}{Z(x)} \sum_{y} w(x,y)\, f(y), \qquad w(x,y)=\exp\!\left(-\frac{\lVert P_x-P_y\rVert^2_{a}}{h^2}\right),
\]

where \( P_x,P_y \) are patches and \( h \) controls smoothing strength. NLM substantially outperforms local filters when self-similarity is present.

### 7.5 BM3D

Block-matching and 3D filtering groups similar patches into 3D stacks, performs a 3D decorrelating transform, hard-thresholds or Wiener-shrinks the coefficients, inverts the transform, and aggregates overlapping estimates. BM3D remains a strong classical baseline on additive Gaussian noise.

### 7.6 Total variation regularization

TV-denoising solves

\[
\hat f = \arg\min_f \tfrac{1}{2}\lVert g - f\rVert_2^2 + \lambda\,\mathrm{TV}(f),
\]

with anisotropic TV \( \mathrm{TV}(f) = \sum \lvert \nabla_x f\rvert + \lvert \nabla_y f\rvert \) or isotropic TV \( \sum \lVert \nabla f\rVert_2 \). Because TV is a sparsity penalty on the gradient, the minimizer preserves sharp edges while flattening smooth regions; the hallmark artefact is the staircase effect on slow gradients.

<div style="border-left:4px solid #cc7b4f;padding:0.6em 1em;background:#fbf2ec;margin:1em 0;">
<strong>Rule of thumb.</strong> <em>If the noise is additive, stationary, and approximately Gaussian, start with a Wiener or bilateral filter for speed, NLM or BM3D when quality matters. If the noise is impulsive, use a median filter. If the noise is signal-dependent (Poisson, speckle), variance-stabilize first (Anscombe for Poisson) before applying a Gaussian-noise denoiser.</em>
</div>

## 8. Image Restoration

Restoration inverts a known or estimated degradation \( g = Hf + n \), where \( H \) is typically a convolution with a PSF.

### 8.1 Inverse filtering

The naive inverse,

\[
\hat F(u,v) = G(u,v)/H(u,v),
\]

is unstable wherever \( H \) is small, because noise is amplified without bound. Pseudoinverse or truncated inverse filters regularize by thresholding \( 1/H \).

### 8.2 Wiener deconvolution

The optimal linear MSE estimator is

\[
\hat F(u,v) = \frac{H^*(u,v)}{\lvert H(u,v)\rvert^2 + S_n(u,v)/S_f(u,v)}\, G(u,v).
\]

When the SNR is high the Wiener filter approaches the inverse filter, and when the SNR is low it heavily attenuates the affected frequencies.

### 8.3 Constrained least squares

Instead of estimating PSDs, the CLS formulation minimizes a smoothness penalty subject to a noise-norm constraint:

\[
\hat f = \arg\min_f \lVert C f \rVert_2^2 \quad \text{s.t.}\quad \lVert g - Hf\rVert_2^2 = \lVert n\rVert_2^2,
\]

where \( C \) is usually a discrete Laplacian. The closed-form solution in the frequency domain is

\[
\hat F(u,v) = \frac{H^*(u,v)}{\lvert H(u,v)\rvert^2 + \gamma \lvert C(u,v)\rvert^2}\, G(u,v).
\]

### 8.4 Iterative methods and blind deconvolution

Richardson–Lucy iteratively maximizes the Poisson likelihood of the observations under a known PSF and is widely used in fluorescence microscopy and astronomical imaging. **Blind deconvolution** estimates \( f \) and \( H \) jointly, typically by alternating minimization with priors on both — sparse gradients for the image, compact non-negative support for the kernel — and marginalization over \( f \) (variational Bayes) to avoid trivial no-blur solutions.

## 9. Edge Detection

Edges mark discontinuities in reflectance, illumination, depth, or material, and detecting them well is foundational.

### 9.1 Gradient operators

The gradient is

\[
\nabla f = \left(\tfrac{\partial f}{\partial x}, \tfrac{\partial f}{\partial y}\right),
\]

with magnitude \( \lVert\nabla f\rVert \) and orientation \( \arctan(\partial_y f / \partial_x f) \). Discrete approximations:

- **Roberts** (2×2 diagonal differences): very local, high-frequency sensitive, noise-prone.
- **Prewitt** (3×3, uniform smoothing): averages before differentiating.
- **Sobel** (3×3, binomial smoothing) — the de facto standard gradient operator, kernel:

\[
G_x = \begin{bmatrix}-1&0&1\\-2&0&2\\-1&0&1\end{bmatrix},\qquad G_y = \begin{bmatrix}-1&-2&-1\\0&0&0\\1&2&1\end{bmatrix}.
\]

### 9.2 Laplacian of Gaussian and difference of Gaussians

The LoG operator

\[
\mathrm{LoG}_\sigma(x,y) = -\frac{1}{\pi\sigma^4}\!\left(1-\frac{x^2+y^2}{2\sigma^2}\right)\!\exp\!\left(-\frac{x^2+y^2}{2\sigma^2}\right)
\]

first smooths with a Gaussian at scale \( \sigma \) and then applies the Laplacian; edges are located at zero crossings of the result. The **difference of Gaussians** (DoG) approximates LoG cheaply by subtracting two Gaussians at different scales and underpins blob detection in SIFT.

### 9.3 Canny

Canny's detector optimizes three criteria — good detection, good localization, single response — and is implemented as: (i) Gaussian smoothing, (ii) Sobel gradient, (iii) non-maximum suppression along the gradient direction, (iv) double-thresholding (low and high), (v) hysteresis connecting weak edges to strong ones. The output is a thin, connected, binary edge map whose quality is remarkably robust to parameter choice.

## 10. Segmentation

Segmentation partitions an image into regions corresponding to objects, surfaces, or semantic classes.

### 10.1 Global thresholding and Otsu

If the histogram is bimodal, a single threshold separates foreground from background. **Otsu's method** chooses \( t \) to maximize between-class variance

\[
\sigma_B^2(t) = w_0(t)\,w_1(t)\,\bigl(\mu_0(t)-\mu_1(t)\bigr)^2,
\]

which is equivalent to minimizing intra-class variance and yields a closed-form scan over candidate thresholds. Adaptive thresholding (local Otsu, Niblack, Sauvola) handles illumination that varies across the image.

### 10.2 Region growing and splitting

Region growing starts from seeds and iteratively attaches neighbours whose intensity (or feature) differs from the region statistic by less than a tolerance. Split-and-merge recursively subdivides the image into quadrants until each is homogeneous, then merges adjacent homogeneous quadrants — a quad-tree-based approach.

### 10.3 Watershed

Treating the gradient magnitude as a topographic surface, the watershed transform floods the surface from local minima. Catchment basins are regions; watershed lines are segmentation boundaries. Naive watershed over-segments aggressively; **marker-controlled watershed** restricts flooding to prescribed markers and is the practical variant.

### 10.4 k-means and Gaussian mixture models

Clustering pixel feature vectors (intensity, colour, \( (r,g,b,x,y) \), texture features) into \( k \) groups is a simple but effective segmentation baseline. k-means minimizes within-cluster squared distance; GMMs generalize to soft assignments and anisotropic clusters under maximum likelihood fit via EM.

### 10.5 Active contours

Snakes evolve a parametric curve to minimize

\[
E = \int_0^1 \bigl[\alpha \lvert \mathbf{c}'(s)\rvert^2 + \beta \lvert \mathbf{c}''(s)\rvert^2 - \lambda \lVert\nabla f(\mathbf{c}(s))\rVert\bigr]\,ds,
\]

balancing curve smoothness against attraction to image edges. Level-set formulations embed the contour as the zero level set of a higher-dimensional function, handling topology changes naturally. Geodesic active contours and Chan–Vese models are modern variants.

## 11. Morphological Image Processing

Morphology acts on binary and grayscale images with a **structuring element** (SE). For binary images with set \( A \) and SE \( B \):

- **Erosion**: \( A \ominus B = \{z : B_z \subseteq A\} \) — shrinks foreground, removes small components.
- **Dilation**: \( A \oplus B = \{z : B_z \cap A \neq \emptyset\} \) — grows foreground, fills small gaps.
- **Opening**: \( A \circ B = (A \ominus B) \oplus B \) — removes small foreground features, keeps size.
- **Closing**: \( A \bullet B = (A \oplus B) \ominus B \) — fills small gaps while keeping size.

Opening followed by closing or vice versa gives compound filters used for shape-selective denoising. Grayscale morphology replaces set-theoretic operations with min/max over the SE neighbourhood; top-hat (\( f - (f \circ B) \)) and bottom-hat (\( (f \bullet B) - f \)) transforms isolate small bright and dark features, respectively, and equalize nonuniform illumination.

## 12. Image Compression

Compression exploits three redundancies: coding (nonuniform symbol probabilities), interpixel (spatial correlation), and psychovisual (perceptually imperceptible content).

### 12.1 Entropy coding

The information content of symbol \( a_k \) with probability \( p_k \) is \( -\log_2 p_k \); the Shannon limit for lossless coding is the source entropy

\[
H = -\sum_k p_k \log_2 p_k.
\]

**Huffman coding** produces an optimal prefix code for known symbol probabilities, with average code length within one bit of \( H \). **Arithmetic coding** encodes a whole message as a subinterval of \( [0,1) \), approaches \( H \) arbitrarily closely, and handles adaptive models cleanly. **Run-length encoding** is optimal for long runs, classical in fax and sparse binary images.

### 12.2 Predictive and transform coding

DPCM quantizes the prediction error \( f - \hat f \) instead of the raw signal. The transform coding pipeline — block transform, quantize, entropy code — dominates still-image standards.

### 12.3 JPEG

Baseline JPEG processes 8×8 blocks:

1. Colour-space conversion to YCbCr; chroma subsampling (4:2:0 commonly).
2. Block DCT on each 8×8 block per channel.
3. Quantization of each DCT coefficient by an element of a quantization matrix, scaled by a quality parameter; high-frequency coefficients use coarser quantization.
4. Zigzag scan ordering from DC to high AC.
5. DC differential coding across blocks; AC run-length plus Huffman (or arithmetic) coding.

Typical compression ratios of 10:1 to 20:1 produce visually lossless results on natural images; at high ratios blocking artefacts and colour bleeding appear.

### 12.4 JPEG 2000

JPEG 2000 replaces the block DCT by a full-image biorthogonal wavelet transform (CDF 9/7 lossy, 5/3 lossless), quantizes wavelet coefficients, and uses EBCOT (embedded block coding with optimized truncation) to produce a scalable, progressive bitstream. It outperforms JPEG at low bitrates, avoids blocking artefacts, and supports region-of-interest coding, but adoption has been limited by computational cost and patent concerns.

## 13. Image Registration

Registration aligns two or more images of the same scene so that corresponding points coincide.

### 13.1 Transformation models

- **Rigid** — rotation plus translation, 3 DoF in 2D, 6 DoF in 3D; preserves distances.
- **Similarity** — rigid plus isotropic scale, 4 DoF in 2D.
- **Affine** — 6 DoF in 2D; preserves parallelism but not angles.
- **Projective** (homography) — 8 DoF; preserves incidence, suitable for planar scenes and pure-rotation cameras.
- **Non-rigid** — B-spline free-form deformations, thin-plate splines, diffeomorphic flows (LDDMM, SyN in medical imaging).

### 13.2 Intensity-based registration

Define a similarity metric between a fixed image \( I_F \) and the transformed moving image \( I_M \circ T \):

- **SSD** — sum of squared differences, appropriate when intensities agree.
- **Normalized cross-correlation** — robust to linear intensity changes.
- **Mutual information** —

\[
\mathrm{MI}(I_F, I_M) = \sum_{a,b} p(a,b)\log\frac{p(a,b)}{p(a)p(b)},
\]

robust to arbitrary one-to-one intensity relationships and the workhorse of multi-modality registration (e.g. MR–CT).

Optimization is typically gradient-based (Powell, Levenberg–Marquardt, gradient descent with backtracking), often multiresolution to widen the capture range and avoid local minima.

### 13.3 Feature-based registration

Detect landmarks in both images, match them, and solve for the transformation — e.g. RANSAC-filtered SIFT matches plus DLT for homography. Combining feature-based coarse alignment with intensity-based fine alignment is a common robust recipe.

## 14. Feature Detection

Features summarize an image with a sparse set of reproducible descriptors, enabling matching, tracking, and recognition.

### 14.1 Harris corner detector

At each pixel form the structure tensor

\[
M = \sum_{(x,y)\in W} \begin{bmatrix} I_x^2 & I_x I_y \\ I_x I_y & I_y^2 \end{bmatrix},
\]

weighted by a window (often Gaussian). The response

\[
R = \det(M) - k\,(\mathrm{trace}\,M)^2
\]

is large only when both eigenvalues are large, signalling a corner; edges give one large and one small eigenvalue. Shi–Tomasi uses \( \min(\lambda_1,\lambda_2) \) directly.

### 14.2 Scale-space blob detection and SIFT overview

SIFT builds a Gaussian scale space \( L(x,y,\sigma) = G_\sigma * f \), takes differences of Gaussians across scales to approximate \( \sigma^2\,\mathrm{LoG} \), and localizes extrema in \( (x,y,\sigma) \) as keypoints. For each keypoint it assigns a dominant orientation from a local gradient histogram, then builds a 128-dimensional descriptor from 4×4 cells of 8-bin gradient histograms within a keypoint-oriented, scale-normalized patch. Matching across images is nearest-neighbour in descriptor space with a ratio test. SIFT is invariant to translation, rotation, and scale, and approximately invariant to illumination and small viewpoint changes.

### 14.3 HOG

Histogram of oriented gradients divides a detection window into cells, computes an orientation histogram per cell, normalizes over larger blocks (L2-Hys), and concatenates the block descriptors. Paired with a linear SVM it was the backbone of classical pedestrian detection before deep methods.

## 15. Applications

### 15.1 Medical imaging

- **CT reconstruction**. Projections are line integrals \( p(\theta, s) \) of the attenuation coefficient. The Fourier slice theorem asserts that the 1D Fourier transform of a projection equals the 2D Fourier transform of the object along the corresponding radial line, so reconstruction is possible from sufficiently many projections. **Filtered back-projection** filters each projection with a ramp \( \lvert u \rvert \) (often apodized by a Hann or Shepp–Logan window) then back-projects. Iterative reconstructions (ART, SART, MBIR) handle sparse views and statistical noise models better but cost more.
- **MRI reconstruction**. MRI acquires the 2D or 3D Fourier transform of the object (k-space). Cartesian sampling inverts to an image with a straightforward inverse FFT. Accelerated acquisitions sample k-space sparsely and use parallel imaging (SENSE, GRAPPA) or compressed sensing with a wavelet or TV sparsity prior.
- **Denoising and registration** are ubiquitous. Multi-modality MI registration aligns MR and CT for radiotherapy planning; non-rigid registration aligns pre- and post-contrast scans or longitudinal studies.

### 15.2 Remote sensing

Satellite and airborne imaging produces multispectral and hyperspectral data at many wavelengths, plus SAR (synthetic aperture radar) imaging with speckle noise that is multiplicative rather than additive. Core tasks include radiometric calibration, atmospheric correction, geometric correction to a map coordinate system (registration with a digital elevation model), pan-sharpening of low-resolution multispectral bands against a high-resolution panchromatic band (IHS, Brovey, wavelet-based, MTF-matched), classification (k-means, maximum-likelihood, SVM, CNN-based land-cover classifiers), and change detection between repeat observations.

### 15.3 Machine vision

Industrial machine-vision pipelines are tightly constrained: controlled lighting, known geometry, rigid objects. A typical pipeline performs shading correction (flat-fielding with a reference image), thresholding or background subtraction, morphological cleanup, blob analysis (connected-component labelling, moments, orientation), template matching or feature-based recognition, and measurement in calibrated world units. Reliability and latency dominate the design; algorithms are chosen to be deterministic and hardware-implementable (e.g. Sobel, box filters, connected components).

## 16. Bringing the Pieces Together

A coherent view of the course is that almost every module begins from a model and turns that model into an operator:

- **Sampling** starts from the continuous-to-discrete model and yields an anti-alias filter and a reconstruction formula.
- **Spatial and frequency filtering** start from the LSI system model and yield convolution-based enhancement and design in the Fourier domain.
- **Denoising and restoration** start from a signal-plus-noise or degradation-plus-noise model and yield shrinkage or deconvolution operators, optionally regularized by priors.
- **Edge detection and feature detection** start from a differential-operator model of local structure and yield gradient, Laplacian, and structure-tensor-based detectors.
- **Segmentation and morphology** start from regional or set-theoretic models and yield thresholding, region-growing, watershed, and SE-based operators.
- **Compression** starts from information-theoretic and perceptual models and yields transform plus quantization plus entropy-coding pipelines.
- **Registration** starts from a parametric geometric model and a similarity metric and yields an iterative optimization.
- **Applications** constrain which priors, which transforms, and which similarity metrics are appropriate; the operator toolkit is the same.

<div style="border-left:4px solid #9a6bbf;padding:0.6em 1em;background:#f4eefa;margin:1em 0;">
<strong>Study heuristic.</strong> <em>When meeting a new image-processing problem, ask: what is the imaging model, what is the noise model, what is the prior on the true image, what is the loss, and which operator family — linear filter, nonlinear filter, variational, statistical — best reconciles these? Most named techniques in this course are particular answers to that sequence of questions.</em>
</div>

## 17. Summary of Results to Remember

The following table collects the quantitative relations most useful to keep close.

<table>
<tr><td>Name</td><td>Expression</td></tr>
<tr><td>2D sampling theorem</td><td>\( T_x < 1/(2B_x) \), \( T_y < 1/(2B_y) \)</td></tr>
<tr><td>Convolution theorem</td><td>\( g = h*f \iff G = H\,F \)</td></tr>
<tr><td>Histogram equalization</td><td>\( s_k = \frac{L-1}{MN}\sum_{j\le k} h_r(j) \)</td></tr>
<tr><td>Gaussian kernel</td><td>\( G_\sigma(x,y) = \frac{1}{2\pi\sigma^2} e^{-(x^2+y^2)/(2\sigma^2)} \)</td></tr>
<tr><td>Butterworth LPF</td><td>\( H = 1/[1 + (D/D_0)^{2n}] \)</td></tr>
<tr><td>Wiener filter</td><td>\( H_W = S_f/(S_f + S_n) \)</td></tr>
<tr><td>Wiener deconvolution</td><td>\( H^*/(\lvert H\rvert^2 + S_n/S_f) \)</td></tr>
<tr><td>Constrained LS</td><td>\( H^*/(\lvert H\rvert^2 + \gamma \lvert C\rvert^2) \)</td></tr>
<tr><td>TV denoising</td><td>\( \min_f \tfrac{1}{2}\lVert g-f\rVert_2^2 + \lambda\,\mathrm{TV}(f) \)</td></tr>
<tr><td>LoG</td><td>\( \nabla^2 G_\sigma * f \)</td></tr>
<tr><td>Harris response</td><td>\( R = \det(M) - k\,(\mathrm{tr}\,M)^2 \)</td></tr>
<tr><td>Otsu threshold</td><td>\( t^* = \arg\max_t w_0 w_1 (\mu_0-\mu_1)^2 \)</td></tr>
<tr><td>Mutual information</td><td>\( \sum p(a,b)\log\!\bigl(p(a,b)/(p(a)p(b))\bigr) \)</td></tr>
<tr><td>Shannon entropy</td><td>\( H = -\sum p_k \log_2 p_k \)</td></tr>
<tr><td>Quantization error</td><td>\( \sigma_q^2 = \Delta^2/12 \)</td></tr>
</table>

Taken together these relations structure an enormous fraction of the classical image-processing literature. Modern deep-learning methods extend, reinterpret, and sometimes subsume them — a denoising CNN learns a shrinkage operator, a super-resolution network learns an implicit prior, a segmentation network learns data-dependent region models — but the classical operators remain the reference against which learned systems are judged and the language in which their behaviour is understood.
