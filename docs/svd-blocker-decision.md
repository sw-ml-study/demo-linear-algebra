# LA16 stable ordered SVD blocker decision

Decision: **publish LA16 as constrained and promote only stable ordered SVD as
the verified scope of B3**.

## Executed obstruction

`probes/svd-decomposition.mlpl` requests the smallest decomposition needed by
the lesson: `svd([[3,0],[0,1]])`. MLPL v0.20.0 build `f77e8041` exits nonzero
with `unknown function: svd`. `catalog/probes.tsv` pins that failure so future
support changes the gate visibly.

The obstruction is not merely the missing name. LA16 must compute factors
rather than display hand-authored ones, order singular components so rank-k
truncation is meaningful, and define behavior for rectangular, repeated, zero,
and non-finite cases. LA15 supplies only one bounded dominant-vector candidate.
Building a full SVD from `A^T A`, repeated deflation, and ad hoc completion
would inherit convergence and orthogonality problems while inventing
degeneracy policy. That would be unstable compatibility code, not an honest
implementation of the lesson.

## Upstream acceptance contract

The smallest public operation is `svd(A)` returning a `Result`. Exact field
names and thin/full selection syntax remain upstream design choices. Acceptance
requires:

1. a documented thin factorization `A = U diag(s) V^T` for finite rank-2
   rectangular matrices, with shapes for tall, square, and wide inputs;
2. nonnegative singular values in descending order and a deterministic paired
   sign convention for nondegenerate singular vectors;
3. documented subspace behavior for repeated singular values and stable
   handling of zero singular values and rank-deficient matrices;
4. structured errors for invalid rank, non-finite input, and unsupported empty
   dimensions rather than NaN/infinity propagation;
5. independently checked orthogonality and reconstruction residuals with a
   stated scale-aware tolerance; and
6. rank-k reconstruction acceptance for `k=0`, intermediate `k`, and full
   rank, including monotone Frobenius error and the best-rank fixture expected
   by LA16.

Fixtures must cover an exact diagonal matrix, a rectangular matrix, repeated
singular values, rank deficiency, a near-degenerate case, and non-finite input.
When this lands, the expected-failure probe becomes a success probe and LA16
can become runnable without changing the bounded LA14-LA15 APIs.

## Constrained lesson leaf

LA16 remains in `catalog/lessons.tsv` and `docs/syllabus.md` with status
`blocked`. No CLI, web program, or preview is published because those artifacts
would imply an executable decomposition that the configured runtime cannot
provide honestly. The learning outcome and downstream LA18-LA19 dependencies
remain visible rather than silently disappearing.
