# Systems capability baseline

Measured 2026-08-14 on MLPL v0.20.0 build `f77e8041` through the probes in
`catalog/probes.tsv` and `tests/test_system_capabilities.mlpl`.

| Behavior | Executed result | LA11-LA13 contract |
|---|---|---|
| flat `scatter` plus `reshape` | checked cell replacement and full row swap work | bounded elimination may use explicit immutable updates |
| `1/0` | succeeds with positive `inf`, not `Err` | validate every pivot before division |
| `sqrt(-1)` | yields `NaN`; `eq(NaN,NaN)`, `<0`, and `>0` are false | guard inputs/intermediates explicitly |
| `value-value` finite check | equals zero only for finite tested values; infinity and NaN fail | `is_finite_numeric` is the bounded lesson guard |
| exact residual | known `Ax=b` gives norm zero | residual computation stays independent of solving |
| near-singular residual | candidate `[2,0]` has residual about `1e-6` but solution error `sqrt(2)` | LA13 must separate residual from accuracy |

Row updates reconstructed through `reshape` do not preserve arbitrary runtime
axis labels. LA12 will use positional augmented matrices internally and keep
semantic coefficient/target shapes at its checked API boundary. This is
acceptable for transparent bounded elimination, not a claim of a label-aware
general solver.

The runtime's non-finite behavior is a numerical safety requirement, not a new
blocker: ordinary MLPL can detect the observed NaN/infinity values using
`eq(value-value,0)`. B2 remains a candidate until LA11-LA13 establish whether
stable general pivoting, diagnostics, multiple right-hand sides, and condition
estimation are truly required upstream.
