# Factorization capability baseline

Measured 2026-08-15 on MLPL v0.20.0 build `f77e8041` through the factorization
probes in `catalog/probes.tsv` and `tests/test_factorization_capabilities.mlpl`.

| Behavior | Executed result | LA14-LA16 contract |
|---|---|---|
| column assembly and extraction | transposing a collection of columns produces `[row,column]`; checked extraction revisits each column | bounded teaching algorithms may assemble `Q` from explicit columns |
| nested traversal | two `while` loops plus flat `scatter` construct the exact Gram matrix `[[2,1],[1,2]]` | bounded matrix diagnostics are expressible without hidden mutation |
| independent residuals | `||Q^TQ-I||_F=0` and `||QR-A||_F=0` on a known thin factorization | orthogonality and reconstruction must both be reported |
| dependence evidence | `[2,4,6]` has zero projection residual; `[2,4,6.000001]` has a positive residual below `1e-5` | LA14 must publish a tolerance and distinguish exact from near dependence |
| bounded iterative state | four power steps expose `{iteration,vector,residual}` and reach residual below `0.1` on `diag(2,1)` | LA15 must expose count, limit, residual, and failure/ambiguity rather than imply convergence |

Transpose-based assembly and reshape/scatter reconstruction produce positional
matrices; arbitrary semantic column labels are not retained automatically.
Lessons must state their axis convention at the checked boundary.

These results support bounded classical Gram-Schmidt, thin QR fixtures, and a
visible power-iteration trace in ordinary MLPL. They do not establish numerical
stability, convergence for arbitrary matrices, eigenvalue ordering, or a
general QR/eigen/SVD API. The executed LA14-LA15 decision keeps B3 a candidate:
both lessons meet their bounded outcomes, so a missing `qr` or `eigen` name is
not a blocker. The subsequent LA16 gate verifies only the narrower stable,
ordered SVD requirement as B3; it does not broaden the ask to QR or eigen.
