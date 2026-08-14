# Matrix anatomy capability baseline

Measured 2026-08-14 on the configured MLPL v0.20.0 build `f77e8041` through
the probes registered in `catalog/probes.tsv`.

| Behavior | Observed result | LA07–LA10 consequence |
|---|---|---|
| `take(matrix,0,row)` | rank-1 row; retains the column-axis label | row helper delegates directly after validation |
| `take(matrix,1,column)` | rank-1 column; retains the row-axis label | column helper delegates directly after validation |
| nested `take` | rank-0 scalar; `labels` prints empty, but empty label metadata remains | numeric comparison uses `eq`; structural equality preserves provenance |
| shape `[0,3]` | valid rank-2 empty matrix; labels retained | empty container is valid, row extraction is not |
| shape `[2,0]` | valid rank-2 empty matrix; labels retained | empty container is valid, column extraction is not |
| transpose `[0,3]` | shape `[3,0]` | empty transforms remain honest rank-2 operations |
| row index equal to row count | native error `shape mismatch: 2 vs 2 elements` | imprecise diagnostic; checked helper returns structured `row_index` error |
| `[2,3] @ [2,2]` | native error `matmul: expected [2, 3], got [2, 2]` | inner-dimension order is pinned for LA08 |
| positional rank-2 `labels` | `","`, representing two empty axis slots | never compare it to the rank-0 empty string |

The native out-of-bounds `take` message is awkward because it prints two equal
numbers without identifying axis, index, or valid range. It is not a blocker:
ordinary MLPL can inspect `shape`, validate integer bounds, and return a precise
Result before calling `take`. `lib/matrices.mlpl` establishes that downstream
contract and tests it. An upstream diagnostic improvement would be useful, but
no compatibility bridge or language primitive is required.

## Chosen LA07 contract

- A matrix is exactly rank two, including zero-sized dimensions.
- Rows and columns are rank-one views/copies according to current runtime
  allocation semantics; this saga makes no zero-copy claim.
- Row extraction preserves the remaining column label; column extraction
  preserves the remaining row label. A cell exposes no nonempty axis label,
  but retains empty label metadata from its labeled source: `eq(cell, 2)` is
  true while `equal(cell, 2)` is false.
- Indices are finite zero-based integers in `[0, dimension)`.
- Invalid rank, row, and column requests return structured Results.
- Labels are semantically relevant: labeled and positional arrays with the same
  numbers are not structurally equal.

The bounded catalog contract is `catalog/matrix-contract.tsv`. LA07 can now
choose readable helpers without guessing extraction semantics. B1 remains
unchanged and does not affect these rank-2 operations.
