# Terminology and numerical-claims audit

Measured 2026-08-15 with `scripts/check-claims` across the syllabus, CLI
lessons, checked libraries, tests, acceptance reports, and blocker ledger.

## Reconciled conventions

- **Column-vector transformations:** LA07 uses `W:[output,input]` and `W*x`.
- **Row-batch ML payoffs:** the dense layer and LA19 use
  `X:[sample,input] @ W:[input,output]`; this is a data-layout convention, not
  a contradiction in matrix multiplication.
- **Attention axes:** LA20 uses `Q:[query,feature]`, `K:[key,feature]`,
  scores/weights `[query,key]`, `V:[key,value]`, and output `[query,value]`.
- **Rank:** LoRA factor rank is the shared narrow dimension and bounds the
  update rank; it is not matrix rank computed by SVD and does not guarantee
  parameter savings at every shape.

## Numerical language

Approximate checks name an inclusive absolute tolerance. LA11's `1e-9`
determinant threshold and LA14's caller-supplied dependence tolerance are
fixture policies, not general condition estimators. LA13 separates residual
from parameter error. LA14 checks reconstruction and orthogonality separately.
LA15 always reports residual and a hard iteration limit. LA20's exact row sums
are executed fixture results from native stable softmax, not a universal
floating-point theorem.

## Preserved non-claims

LA19 demonstrates fixed-factor update arithmetic, not training or quality.
LA20 demonstrates one unbatched head, not masking, learned projections, or a
transformer. B1 remains higher-rank matmul, B2 stable general solve, and B3
stable ordered SVD; general QR and eigen are deliberately not promoted.
Normal equations, fixed PCA axes, and compatibility numerical libraries remain
rejected substitutes.

The executable audit pins these phrases at their authoritative locations so a
future edit must reconcile all affected media instead of silently changing the
meaning of a lesson. It checks consistency, not mathematical completeness or
proof of every stated law.
