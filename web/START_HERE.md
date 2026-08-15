# Syllabus and learning path

This is a spiral curriculum: each unit reuses earlier operations in an ML
context instead of treating linear algebra as detached textbook vocabulary.

| ID | Lesson | Prerequisites | Learner can execute and explain | ML connection |
|---|---|---|---|---|
| LA01 | Vectors are feature arrays **(runnable)** | scalar arithmetic | shape, add, and scale rank-1 arrays | one example as a feature vector |
| LA02 | Dot product measures alignment **(runnable)** | LA01 | element products reduce to one alignment score | logits and embedding scores |
| LA03 | Length, distance, and normalization **(runnable)** | LA02, square root | compute norms and verify unit length within tolerance | normalized representations |
| LA04 | Cosine similarity **(runnable)** | LA03 | compare direction independently of magnitude, including zero-vector policy | semantic retrieval |
| LA05 | Linear combinations and span **(runnable)** | LA01 | generate combinations and distinguish independent/dependent bounded examples | feature synthesis |
| LA06 | Orthogonality and projection **(runnable)** | LA02-LA03 | decompose a vector into projection plus orthogonal residual | dimensionality reduction |
| LA07 | Matrices store transformations **(runnable)** | LA01, LA05 | read rows/columns, map basis vectors, and inspect a transformed grid | weights as transformations |
| LA08 | Matrix multiplication is composed dot products **(runnable)** | LA02, LA07 | derive every cell, trace row-column products, and reject an inner mismatch | dense layers |
| LA09 | Composition and transpose **(runnable)** | LA08 | verify `A(Bx)=(AB)x`, reject reordered `BA`, and track transposed axes | chained layers and Q/K scores |
| LA10 | Determinant as signed area (2D first) **(runnable)** | LA07 | classify exact positive, negative, and zero area fixtures | volume change and singularity |
| LA11 | Linear systems and residuals **(runnable)** | LA08, LA10 | classify bounded unique, inconsistent, and underdetermined fixtures with independent residuals | fitting parameters |
| LA12 | Elimination and rank **(runnable)** | LA11 | trace guarded row swaps/elimination and compare coefficient/augmented ranks | identifiability |
| LA13 | Conditioning **(runnable)** | LA03, LA11-LA12 | compare perturbation amplification and separate residual from solution error | numerical reliability |
| LA14 | Gram-Schmidt and QR **(runnable)** | LA06-LA08, LA13 | subtract projections and measure orthogonality/reconstruction separately | stable feature bases |
| LA15 | Eigenvectors by bounded iteration **(runnable)** | LA08, LA13 | inspect a residual trace and distinguish convergence, limit, and ambiguity | repeated dynamics |
| LA16 | SVD and low-rank approximation | LA14-LA15 | reconstruct at several ranks and plot error | compression |
| LA17 | Least squares | LA06, LA11, LA14 | fit an overdetermined system and inspect residual geometry | linear regression |
| LA18 | PCA | LA16-LA17 | center, project, and explain variance captured | dimensionality reduction |
| LA19 | LoRA | LA08, LA16 | show `W + AB`, parameter counts, and output delta | efficient fine-tuning |
| LA20 | Attention math | LA04, LA08-LA09 | trace `softmax(QK^T/sqrt(d))V` with explicit axes | transformers |

Every lesson names what it does **not** establish. Finite fixtures demonstrate
a law on those values; they do not prove the general theorem. Iterative demos
report tolerance, iteration limit, and residual; they do not claim convergence
for arbitrary input.

LA07 uses the `[output,input]` convention: multiplying `W:[2,2]` by `x:[2]`
returns `W*x:[2]`. Its two columns are `W*e1` and `W*e2`; their integer
combinations create the transformed grid. The exact fixture checks additivity,
scaling, and `W*0=0`, but does not prove those laws for every matrix or add a
translation term.

LA08 expands `A:[rows,inner] @ B:[inner,columns]` into one dot product for
each output location. The shared `inner` dimension is consumed, leaving
`C:[rows,columns]`. Its active-cell trace keeps the component products visible
before accumulation and its checked wrapper rejects mismatched inner sizes
before invoking the native primitive.

LA09 treats matrix multiplication as ordered function composition. With
`B:[hidden,input]` and `A:[output,hidden]`, `AB:[output,input]` performs B
first and A second. Named axes reject `B@A` because `input` and `output` do
not align even though both sizes are two; positional copies provide the
noncommuting numeric counterexample. Transpose swaps label order and obeys `(AB)^T=B^T A^T` on the exact
fixture; labels remain part of structural equality rather than decoration.

LA10 deliberately defines only `matrix_determinant2` for `[2,2]`: `ad-bc`.
Its magnitude is the area scale of the transformed basis parallelogram, its
sign records orientation, and zero accompanies a concrete collision where two
distinct inputs share one output. Other shapes return a structured error; the
lesson does not claim a general determinant or inverse primitive.

LA11 solves and classifies exactly two equations in two unknowns. An inclusive
`|det|<=1e-9` threshold selects the singular branch; augmented target
cross-products distinguish parallel inconsistency from coincident equations.
The returned unique solution or coincident witness is checked through the
independent `Ax-b` residual path. This bounded formula is not a stable general
solver and rejects non-finite or differently shaped inputs.

LA12 advertises an exact 2x2, one-right-hand-side maximum. It records the
initial augmented matrix, any safe-pivot row swap, elimination multiplier,
echelon state, and unique RREF. Every division follows `|pivot|>1e-9`.
Coefficient and augmented ranks distinguish unique `2=2`, inconsistent `1<2`,
and underdetermined `1=1<2` fixtures. This transparent trace is not a
production-grade general elimination routine.

LA13 compares the absolute fixture ratio `||delta-x||/||delta-b||`. Identity
has amplification one, while the near-singular pair exceeds one million under
a `1e-12` solver threshold. A separate wrong candidate has residual about
`1e-6` but solution error `sqrt(2)`, proving on this fixture that small residual
does not certify accurate parameters. The ratio is not claimed to be a
scale-invariant general condition number or estimator.

LA14 applies classical Gram-Schmidt to exactly two columns with two or three
rows. It exposes `q1`, the second column projection, perpendicular residual,
and `q2`; positive diagonal entries of `R` fix the sign convention. Independent
Frobenius errors check `Q^TQ-I` and `QR-A`. Residual norm at or below the
caller's positive tolerance returns a dependent-column error. This bounded
derivation is teaching code, not stable general QR.
An admitted near-dependent fixture sharpens that boundary: `QR-A` is zero for
the measured values while `Q^TQ-I` has Frobenius norm about `1.11e-3`.
Therefore reconstruction alone does not certify an orthogonal or stable QR;
the same fixture is rejected under the lesson's ordinary `1e-9` tolerance.

LA15 traces power iteration for exactly 2x2 matrices. It reports a Rayleigh
value, eigenpair residual, residual history, tolerance, iteration count, and a
hard integer limit no greater than 100. The largest-magnitude vector component
is made nonnegative to fix sign. `diag(2,1)` converges on the checked policy;
a 90-degree rotation reaches its limit with residual one, while identity stops
with a tiny residual but has no unique dominant direction. The lesson neither
guarantees convergence nor computes a general ordered eigensystem.

Suggested browser route: LA01 → LA02 → LA03 → LA06 → LA07 → LA08 → LA17 →
LA18 → LA19 → LA20. The remaining leaves deepen definitions, failure modes,
and numerical caveats.
