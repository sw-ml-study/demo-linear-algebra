# Systems, rank, and conditioning acceptance

Accepted 2026-08-14 against MLPL v0.20.0 build `f77e8041`.

The systems-rank-conditioning saga is complete. LA11-LA13 are runnable from
the CLI and browser, have demo-produced SVG previews, and use native mlplunit
coverage. The final gate executes 15 capability probes, 14 CLI programs
(thirteen lessons plus the dense-layer payoff), and 68 tests.

## Accepted evidence

| Lesson | Executable claim | Numerical boundary/counterexample |
|---|---|---|
| LA11 | determinant and augmented witnesses classify one, zero, or infinitely many solutions; `Ax-b` is computed independently | exactly finite 2-by-2 coefficients and one RHS; inclusive `|det|<=1e-9` singular policy |
| LA12 | a visible safe-pivot row swap and elimination trace reaches RREF; coefficient and augmented ranks classify solution count | exactly 2-by-2 with one RHS; every division follows `|pivot|>1e-9` |
| LA13 | identity has absolute perturbation amplification one while a near-singular fixture exceeds one million | a residual near `1e-6` coexists with solution error `sqrt(2)`; fixture ratio is not a general condition number |

Unique, inconsistent, underdetermined, zero-equation, invalid-shape, invalid-
tolerance, and non-finite cases are covered. No zero pivot is silently divided,
and solution residuals do not reuse the solving formula.

## Capability conclusion

Immutable flat `scatter`, reshape, checked cells, reductions, and rank-2
`matmul` are sufficient for transparent bounded elimination. Row reconstruction
loses arbitrary axis labels, so semantic shapes stay at the checked public
boundary. Division by zero produces infinity and invalid square root produces
NaN; ordinary MLPL can detect the observed non-finite values, but algorithms
must guard them explicitly.

B2 is verified for stable general solve use. The minimal multi-right-hand-side
`solve(A,B)` probe fails with `unknown function: solve`. Its upstream contract
requires robust pivoting, reusable multi-RHS behavior, structured shape,
singularity, and non-finite errors, rank/condition information, and independent
residual acceptance. This blocks an honest production-quality LA17 foundation;
it does not block or weaken the bounded LA11-LA13 curriculum.

## Follow-on decision

The next saga is `factorizations`, reconciled in
`docs/factorizations-saga.md`. It may derive classical Gram-Schmidt and bounded
QR because the derivation is itself the lesson. It must measure dependent and
near-dependent behavior before deciding B3, and must not present a teaching QR,
fixed-iteration power method, or hand-built SVD as a robust general primitive.
