# Executed sw-MLPL capability baseline

Measured 2026-08-14 with:

```text
../sw-mlpl/target/release/mlpl-repl
MLPL v0.20.0
build commit f77e8041, built 2026-08-14T08:57:35-0700
sha256 f9e53486ae13db2d5d8b48a5e81ce614e7611b5362e9242cc95efca95cc2540d
```

`scripts/select-mlpl` prefers `$MLPL`, when explicitly set to an absolute
executable, then this adjacent release build. Results are properties of the
configured binary, not timeless language claims.

| Surface | Result | Executed evidence |
|---|---|---|
| reshape and shape | supported | `[0..5] -> [2,3]` reports `[2,3]` |
| transpose | supported | `[2,3] -> [3,2]` |
| general axis transpose | supported | permutation `[1,0]` equals transpose |
| axis reduction | supported | row sums of `[[0,1,2],[3,4,5]]` are `[3,12]` |
| rank-1 dot | supported | `[1,2,3] dot [4,5,6] = 32` |
| rank-2 matmul | supported | `[2,3] @ [3,2]` matches the golden matrix |
| named-axis matmul | supported | `[sample,feature] @ [feature,output]` yields labels `sample,output` |
| label-aware equality | supported, important caveat | labeled and positional arrays with identical numbers are not structurally equal |
| static include | supported | a probe and native mlplunit test load `lib/probe_include.mlpl` |
| rank-3 batched matmul | blocked | compatible operands fail with `index has 3 components but array has rank 2` |
| browser narration syntax | supported in script execution | framed comments, bare `;`, trailing comments, and standalone statements execute |

The matrix-specific continuation—including row/column/cell extraction,
zero-sized dimensions, surviving labels, and diagnostic evidence—is recorded
in `docs/matrix-capability-baseline.md`.

The executable probes live under `probes/`; `scripts/run-probes` reads expected
status from `catalog/probes.tsv`. Expected failure is intentional only for the
verified rank-3 matmul blocker. If it begins succeeding, the gate fails until
the blocker ledger and downstream acceptance tests are updated.

Native test execution uses `mlplunit.conf` discovery and the external
`mlplunit` runner selected by `scripts/select-mlplunit`. The repository neither
installs nor overwrites either tool.

## Source-catalog observations not yet runtime claims

The public catalog names seeded `random`/`randn`, `argmax`, and stable
`softmax`. It does not name solve, inverse, determinant, LU, QR, eigen, SVD, or
least-squares primitives. The latter remain candidates for later lesson-level
probes; absence from the catalog proves no callable public builtin, but does
not by itself prove which smallest upstream API the curriculum needs.
