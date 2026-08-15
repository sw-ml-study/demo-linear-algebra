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

The runtime's non-finite behavior is a numerical safety requirement: ordinary
MLPL can detect the observed NaN/infinity values using `eq(value-value,0)`.
LA11-LA13 therefore remain honest bounded lessons. The subsequent executed
decision promotes B2 only for stable general solve use: the configured runtime
has no public `solve(A,B)` and teaching code cannot substitute for robust
pivoting, diagnostics, and multiple right-hand sides. See
`docs/stable-solve-blocker-decision.md`.
