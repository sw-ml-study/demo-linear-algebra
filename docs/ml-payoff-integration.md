# ML-payoff integration map

LA17-LA20 form one capability-gated curriculum slice rather than a numeric
sequence that pretends every prerequisite is runnable.

| Leaf | State | Executable prerequisite path | Evidence and boundary |
|---|---|---|---|
| LA17 least squares | **blocked by B2** | LA06 projection → LA11 systems → LA14 QR concepts | The stable general solve probe remains an expected failure; the LA17 gate rejects normal equations and the 2x2 teaching solver. |
| LA18 PCA | **blocked by B3** | LA06 projection → LA14 orthogonal bases → constrained LA16 decomposition semantics | The ordered SVD probe remains an expected failure; the LA18 gate rejects fixed axes and covariance deflation. |
| LA19 LoRA | **runnable** | LA08 rank-2 matmul → LA09 composition | Fixed `A@B` factors demonstrate parameter accounting and exact output effect; LA16 is motivation only, not an executable dependency. |
| LA20 attention | **runnable as one rank-2 head; B1 limits extensions** | LA02 dot → LA03 normalization → LA08 matmul → LA09 transpose | Stable row softmax and value mixing run; the higher-rank matmul probe pins the batch/head boundary. |

The machine-readable companion is `catalog/ml-payoffs.tsv`. Its audit verifies
that every prerequisite ID exists in the syllabus, every evidence path exists,
and B1/B2/B3 probes retain their exact expected diagnostics. If sw-MLPL gains
one of these capabilities, `scripts/run-probes` fails first because an expected
failure unexpectedly succeeds; `scripts/check-ml-payoffs` then prevents stale
curriculum wiring or diagnostic drift during reconciliation.

## Learner routes

- Regression concepts: LA03 → LA06 → LA08 → LA11 → LA13 → LA14 → LA17 gate.
- Dimensionality reduction: LA03 → LA06 → LA14 → LA16 gate → LA18 gate.
- Low-rank adaptation: LA07 → LA08 → LA09 → LA19 runnable lesson.
- Attention: LA02 → LA03 → LA08 → LA09 → LA20 runnable lesson; B1 extension gate.

Blocked leaves have no CLI, web, preview, or lesson-test paths in
`catalog/lessons.tsv`. Runnable leaves have all four and are exercised by the
ordinary full gate. This distinction prevents documentation from implying that
LA17 or LA18 executed while retaining their learning outcomes and upstream
acceptance contracts.
