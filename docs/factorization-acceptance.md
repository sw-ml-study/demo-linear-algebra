# Orthogonality and factorization acceptance

Accepted 2026-08-15 against MLPL v0.20.0 build `f77e8041`.

The factorization saga is complete within its capability-gated scope. LA14 and
LA15 are runnable from CLI and browser, have demo-produced SVG previews, and
use native mlplunit. LA16 remains deliberately visible but blocked by the
verified SVD-specific B3 contract. The final gate executes 20 capability probes,
16 CLI programs (fifteen lessons plus the dense-layer payoff), and 83 tests.

## Accepted evidence

| Leaf | Outcome | Numerical boundary/counterexample |
|---|---|---|
| LA14 classical Gram-Schmidt | runnable bounded `[2..3,2]` projection trace with positive `R` diagonal | dependence follows tolerance; exact reconstruction can coexist with about `1.11e-3` orthogonality loss near dependence |
| LA15 power iteration | runnable bounded 2x2 Rayleigh/residual trace with sign policy and limit at most 100 | rotation exhausts the limit with residual one; identity has tiny residual without a unique dominant direction |
| LA16 SVD/low rank | constrained leaf with exact upstream acceptance contract | `svd(A)` fails with `unknown function: svd`; no hand-authored factors or unstable deflation substitute |

Both runnable lessons independently check the evidence needed for their claims.
LA14 checks `Q^TQ-I` and `QR-A`; LA15 reports eigenpair residual, valid history
count, tolerance, and hard iteration limit. Neither claims numerical stability,
universal convergence, or a general decomposition API.

## Blocker conclusion

B3 was not promoted by LA14-LA15 because their bounded teaching outcomes are
expressible. LA16 later promotes only stable ordered SVD: thin rectangular
shapes, descending nonnegative values, paired signs, repeated/zero-value
policy, structured errors, independent residuals, and monotone rank-k error.
General QR and eigen remain outside that verified scope.

## Follow-on decision

The next saga is `linear-algebra-for-ml`, reconciled in
`docs/ml-payoff-saga.md`. It proceeds by capability rather than lesson number:
LA19 bounded LoRA and a rank-2 single-head portion of LA20 can be explored with
current operations. Production-quality LA17 stays behind B2, SVD-dependent
LA18 stays behind B3, and higher-rank/multi-head LA20 stays behind B1.
