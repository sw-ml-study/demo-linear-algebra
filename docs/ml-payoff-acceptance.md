# Linear algebra for ML acceptance

Accepted 2026-08-15 against MLPL v0.20.0 build `f77e8041`.

## Accepted outcomes

| Leaf | Accepted state | Evidence |
|---|---|---|
| LA17 least squares | constrained by B2 | `solve(A,B)` remains unavailable; the gate specifies stable overdetermined fitting, rank, condition, residual, and error contracts without normal equations |
| LA18 PCA | constrained by SVD-specific B3 | ordered, degeneracy-aware components remain unavailable; the gate specifies centering, explained variance, reconstruction, and tied-spectrum behavior |
| LA19 LoRA | runnable | checked `W+A@B`, 12-versus-7 fixture accounting, exact merged/factorized output parity, no-savings counterexample, CLI/web visual |
| LA20 attention | runnable as one unbatched head | checked scaled scores, stable softmax rows summing to one, golden value mixtures, CLI/web visual; B1 remains for batch/head axes |

The capability-gated order is intentional. LA19 does not require computed SVD
factors, and bounded LA20 does not require higher-rank matmul. Conversely,
LA17 and LA18 do not become runnable merely because pieces of their arithmetic
can be hand-written.

## Full-gate evidence

The acceptance gate runs:

- 23 configured capability probes, including expected failures that pin B1,
  B2, and SVD-specific B3;
- 18 CLI programs: one dense-layer payoff plus 17 runnable lessons;
- 94 native mlplunit tests;
- standalone web generation and authored/generated parity;
- SVG freshness and accessible title/description checks;
- structure and curriculum audits; and
- the LA17-LA20 prerequisite/evidence/blocker integration audit.

All pass. The lesson catalog contains 17 runnable lessons and three constrained
leaves. Constrained leaves have no CLI, web, preview, or lesson-test artifact,
so the acceptance report does not imply they executed.

## Blockers and upstream handoff

- **B1:** higher-rank/batched matmul. LA20's rank-2 head runs; batch and head
  axes remain constrained by the exact rank-3 failure probe.
- **B2:** stable general solve with diagnostics. LA17 remains constrained.
- **B3:** stable ordered SVD. LA16 low-rank reconstruction and LA18 PCA remain
  constrained. General QR and eigen are not promoted blockers.

The exact semantics and acceptance fixtures remain in `docs/sw-mlpl-blockers.md`,
`docs/la17-least-squares-gate.md`, `docs/svd-blocker-decision.md`, and
`docs/la18-pca-gate.md`. A capability landing must first change its expected
failure probe, then reconcile the catalog and affected leaf before acceptance.

## Saga result

All seven `linear-algebra-for-ml` steps are accounted for: capability probes,
LA19, LA20, LA17 gate, LA18 gate, integration, and this acceptance. The next
program is repository closeout, not an assertion that linear algebra or
sw-MLPL is complete.
