# Next saga plan: matrices as transformations

Purpose: deliver LA07–LA10 and make rank-2 matrix multiplication visible from
individual row-column dots through composed ML transformations.

This plan is reconciled against the foundation runtime evidence. Rank-2
`matmul`, transpose, general axis transpose, reductions, and named-axis
propagation work. B1 higher-rank `matmul` is real but does not block this saga.
General solve, QR, eigen, and SVD are outside its scope.

## Proposed steps

1. **Matrix anatomy and extraction probes** — verify current row/column/cell
   extraction, empty dimensions, label retention, and mismatch diagnostics.
   Establish LA07 library/test/catalog contracts before choosing helper APIs.
2. **LA07 matrices transform basis vectors** — show a matrix as stored columns
   and as a function on inputs; transform a basis grid and connect weights to
   feature transformations.
3. **LA08 row-column multiplication** — derive every output cell from a row
   dot a column, cross-check rank-2 `matmul`, visualize active row/column and
   accumulator, and reject incompatible inner dimensions.
4. **LA09 composition and transpose** — verify `A(Bx)=(AB)x`, transpose
   identities, and labeled-axis behavior; visualize successive grid transforms
   versus one composed transform.
5. **LA10 signed area and singularity** — derive the 2D determinant as bounded
   lesson code, show orientation/area change and a collapsed singular grid,
   and avoid claiming a general determinant primitive.
6. **Dense-layer payoff and matrix integration** — connect `XW+b` to the four
   lessons, run the complete gate, publish matrix acceptance, and reconcile the
   systems/rank/conditioning saga from measured indexing behavior.

## Acceptance

- LA07–LA10 each have tested CLI/web forms, meaningful matrix/grid visuals,
  exact shape narration, counterexamples, and demo-produced fresh previews.
- Rank-2 `matmul` is derived from visible row-column dots before it is used as
  a primitive in the dense-layer payoff.
- Named axes are checked as semantic metadata, including the established fact
  that labels participate in structural equality.
- The bounded determinant remains curriculum code; missing general solve or
  decomposition APIs are neither implemented nor prematurely requested.
- B1 stays pinned and explicitly constrains only higher-rank follow-on work.
