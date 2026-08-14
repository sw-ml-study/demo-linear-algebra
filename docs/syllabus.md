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
| LA07 | Matrices store transformations | LA01 | read rows/columns and map basis vectors | weights as transformations |
| LA08 | Matrix multiplication is composed dot products | LA02, LA07 | trace row-column products and validate shapes | dense layers |
| LA09 | Composition and transpose | LA08 | verify `A(Bx)=(AB)x` and transpose identities | chained layers and Q/K scores |
| LA10 | Determinant as signed area (2D first) | LA07 | relate a bounded formula to a transformed basis grid | volume change and singularity |
| LA11 | Linear systems and residuals | LA08 | classify bounded unique/singular/inconsistent fixtures | fitting parameters |
| LA12 | Elimination and rank | LA11 | perform and inspect pedagogical row reduction | identifiability |
| LA13 | Conditioning | LA03, LA11 | show small input changes causing large solution changes | numerical reliability |
| LA14 | Gram-Schmidt and QR | LA06-LA08 | construct an orthogonal basis and measure reconstruction error | stable feature bases |
| LA15 | Eigenvectors by bounded iteration | LA08, LA13 | inspect convergence and a non-convergent/ambiguous case | repeated dynamics |
| LA16 | SVD and low-rank approximation | LA14-LA15 | reconstruct at several ranks and plot error | compression |
| LA17 | Least squares | LA06, LA11, LA14 | fit an overdetermined system and inspect residual geometry | linear regression |
| LA18 | PCA | LA16-LA17 | center, project, and explain variance captured | dimensionality reduction |
| LA19 | LoRA | LA08, LA16 | show `W + AB`, parameter counts, and output delta | efficient fine-tuning |
| LA20 | Attention math | LA04, LA08-LA09 | trace `softmax(QK^T/sqrt(d))V` with explicit axes | transformers |

Every lesson names what it does **not** establish. Finite fixtures demonstrate
a law on those values; they do not prove the general theorem. Iterative demos
report tolerance, iteration limit, and residual; they do not claim convergence
for arbitrary input.

Suggested browser route: LA01 → LA02 → LA03 → LA06 → LA07 → LA08 → LA17 →
LA18 → LA19 → LA20. The remaining leaves deepen definitions, failure modes,
and numerical caveats.
