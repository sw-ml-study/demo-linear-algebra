# demo-linear-algebra

Executable, visual linear algebra lessons in sw-MLPL, progressing from feature
vectors and dot products to least squares, PCA, LoRA, and attention.

The repository is both a curriculum and a forcing function: lessons use current
array operations where they are honest, and pin missing general capabilities as
executable upstream blockers instead of hiding them behind compatibility code.

Start with [the syllabus](docs/syllabus.md), read [the implementation
plan](docs/plan.md), and inspect [the measured capability
baseline](docs/capability-baseline.md).

The first six-lesson unit is complete; see its [acceptance
report](docs/foundation-acceptance.md). The next bounded program is [matrices as
transformations](docs/matrices-saga.md).

Once the foundation harness is available:

```sh
just check
```

Tests use native mlplunit discovery through `mlplunit.conf`. Set absolute
`MLPL` or `MLPLUNIT` paths to override the documented adjacent development
tools without installing over stable binaries.

## Lesson LA01 — vectors are feature arrays

![Vector addition and scaling: blue x followed by green y reaches pink x plus y; purple twice x retains direction and doubles its components](assets/previews/LA01-vector-laws.svg)

The rows in the CLI output make componentwise addition authoritative. The
diagram makes the same relationship spatial: placing `y` at the head of `x`
lands at `x+y`, while `2*x` preserves direction and doubles each component.

- [CLI lesson](demos/01-vectors/vector_laws.mlpl)
- [Standalone web lesson](demos/web/vector_laws.mlpl)
- [Native mlplunit coverage](tests/test_vectors.mlpl)

## Lesson LA02 — dot product measures alignment

![Aligned, orthogonal, and opposed vector pairs above a row-column dot-product accumulation](assets/previews/LA02-dot-alignment.svg)

The upper panel turns the score's sign into visible direction relationships.
The lower panel keeps matrix multiplication honest by exposing each matching
component product—`4`, `10`, and `18`—before their reduction to `32`.

- [CLI lesson](demos/02-dot-product/alignment.mlpl)
- [Standalone web lesson](demos/web/dot_alignment.mlpl)
- [Native mlplunit coverage](tests/test_dot_product.mlpl)

## Lesson LA03 — length, distance, and normalization

![A 3-4-5 norm triangle, point-to-point distance, and vectors before and after unit normalization](assets/previews/LA03-norm-distance.svg)

The left panel derives length and distance from right-triangle geometry. The
right panel separates direction from magnitude: `v` and `v/norm(v)` point the
same way, while only the latter has unit length. Zero-vector normalization is
explicitly rejected because zero has no direction.

- [CLI lesson](demos/03-norm-distance/normalize.mlpl)
- [Standalone web lesson](demos/web/norm_distance.mlpl)
- [Native mlplunit coverage](tests/test_norm_distance.mlpl)

## Lesson LA04 — cosine similarity and retrieval

![Query and candidate embedding directions beside golden cosine-score bars ordered exact, related, and opposed](assets/previews/LA04-cosine-retrieval.svg)

Cosine divides dot alignment by both magnitudes. The left panel shows why a
longer same-direction embedding still scores `1`; the right panel pins the
deterministic retrieval order `[0,1,2]` for exact, diagonal, and opposed
candidates.

- [CLI lesson](demos/04-cosine-similarity/retrieval.mlpl)
- [Standalone web lesson](demos/web/cosine_retrieval.mlpl)
- [Native mlplunit coverage](tests/test_cosine_similarity.mlpl)

## Lessons LA05–LA06 — span and projection

![Independent basis directions covering a plane beside dependent directions confined to a line](assets/previews/LA05-span.svg)

![A vector reconstructed from its shadow on a direction and a perpendicular residual](assets/previews/LA06-projection.svg)

LA05 contrasts two independent directions with a dependent pair whose
determinant is zero and whose coordinates are non-unique. LA06 turns that span
into a decomposition: the projection lies in `span(b)`, the residual is
orthogonal to `b`, and the two reconstruct the original vector.

- [LA05 CLI](demos/05-span/combinations.mlpl) and [web](demos/web/span.mlpl)
- [LA06 CLI](demos/06-projection/shadow.mlpl) and [web](demos/web/projection.mlpl)
- [Native mlplunit coverage](tests/test_span_projection.mlpl)

## Lesson LA07 — matrices transform basis directions

![A square basis grid transformed into a slanted grid whose colored basis arrows are the matrix columns](assets/previews/LA07-matrix-basis.svg)

For `W:[output,input]`, each column is where one input basis direction lands,
and each row computes one output coordinate. The checked 2D fixture maps
`e1` to `[2,1]` and `e2` to `[1,2]`, so their combinations form the slanted
grid while the origin remains fixed.

- [CLI lesson](demos/07-matrix-transform/basis_grid.mlpl)
- [Standalone web lesson](demos/web/matrix_basis.mlpl)
- [Native mlplunit coverage](tests/test_matrix_transform.mlpl)

## Lesson LA08 — matrix multiplication is row-column dots

![The active second row and first column produce output cell 43 through products 15 and 28](assets/previews/LA08-row-column.svg)

For `A:[rows,inner] @ B:[inner,columns]`, each output cell is one left row
dotted with one right column. The lesson derives all four cells of a 2×2
product, exposes the `15 + 28 = 43` accumulator, and independently checks the
result against native rank-2 `matmul`.

- [CLI lesson](demos/08-matrix-multiplication/row_column.mlpl)
- [Standalone web lesson](demos/web/row_column_matmul.mlpl)
- [Native mlplunit coverage](tests/test_matrix_multiplication.mlpl)
