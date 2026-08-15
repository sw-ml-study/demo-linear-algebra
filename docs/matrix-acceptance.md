# Matrix curriculum acceptance

Accepted 2026-08-14 against MLPL v0.20.0 build `f77e8041`.

The matrices-as-transformations saga is complete. LA07-LA10 are runnable from
the CLI and browser, have demo-produced SVG previews, and use native mlplunit
coverage. The final gate executes ten capability probes, eleven CLI programs
(ten lessons plus the dense-layer payoff), and 50 tests.

## Accepted evidence

| Unit | Executable claim | Boundary/counterexample |
|---|---|---|
| LA07 | matrix columns are transformed basis directions; bounded linear combinations are preserved | a matrix fixes zero and rejects incompatible vectors |
| LA08 | every rank-2 product cell is a row-column dot and matches native `matmul` | incompatible inner dimensions return a structured error |
| LA09 | `A(Bx)=(AB)x`, `(AB)^T=B^T A^T`, and transpose swaps named axes | named axes reject invalid order; positional `AB != BA` fixture |
| LA10 | bounded `ad-bc` gives signed 2D area scale | zero determinant has a concrete distinct-input collision; non-2x2 rejected |
| payoff | `X:[sample,feature] W:[feature,output] + b:[output]` yields `[sample,output]` | affine only; no nonlinear or higher-rank claim |

The dense payoff deliberately follows LA08's visible derivation. Its native
rank-2 `matmul` result is independently compared with the derived row-column
product before bias broadcasting.

## Capability conclusion

No new sw-mlpl blocker was required. Rank-2 multiplication, transpose,
same-rank arithmetic, indexing, and semantic labels are sufficient for this
unit. Rank-1 bias does not natively broadcast over rank-2 output, so the payoff
constructs explicit repeated bias rows with rank-2 operations. This is measured
friction, not a blocker for the bounded lesson. Native out-of-range `take`
diagnostics remain awkward but checked
ordinary-MLPL wrappers are adequate. B1 remains verified and constrains only
higher-rank/batched tensor lessons such as multi-head attention.

The 2D determinant is intentionally curriculum code. This report does not
claim general determinant, inverse, solve, rank, condition estimation, or
decomposition primitives.
