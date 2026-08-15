# LA18 PCA capability gate

Decision: **publish LA18 as constrained behind the SVD-specific scope of B3**.

Measured 2026-08-15 on MLPL v0.20.0 build `f77e8041`. The configured
`probes/svd-decomposition.mlpl` still exits nonzero with `unknown function: svd`.
The complete 23-probe gate passes because that remains the pinned
expected behavior.

## Supported arithmetic versus blocked semantics

Ordinary MLPL can subtract column means, transpose a centered rank-2 design,
form a covariance-like matrix, project onto supplied directions, sum squared
coordinates, and reconstruct from supplied factors. Those operations are not
the missing capability.

PCA must compute ordered orthonormal components from the data. LA15's bounded
power iteration returns at most one candidate and explicitly has cycling and
spectral-ambiguity outcomes. Deflating that teaching routine through
`X^T X` would square the condition number, accumulate orthogonality error, and
invent behavior for repeated or zero variance. Hand-authored axes would only
illustrate projection; they would not be an executed PCA algorithm.

## Runnable acceptance contract

LA18 may become runnable only after B3 is accepted and the lesson can verify:

1. column means and a centered `[sample,feature]` matrix whose means are zero
   within a stated scale-aware tolerance;
2. nonnegative singular values or variances in descending order;
3. orthonormal paired components with deterministic sign behavior for
   nondegenerate directions and documented subspace behavior for ties;
4. explained-variance amounts and ratios derived from the decomposition, with
   nonnegative entries, descending order, and ratios summing to one when total
   variance is positive;
5. projected `[sample,component]` coordinates and reconstruction after adding
   the mean back, checked independently at zero, intermediate, and full rank;
6. monotone reconstruction error as retained component count increases; and
7. structured outcomes for constant columns, zero-total-variance data,
   repeated spectra, invalid shapes, insufficient samples, and non-finite data.

The fixtures must include a simple axis-aligned dataset, a rotated dataset, a
repeated-variance dataset, rank deficiency, a constant dataset, and a
near-degenerate case. Before LA18 receives runnable artifacts, the expected
SVD failure probe must be reconciled to positive decomposition acceptance.

## Downstream effect

LA16 and LA18 remain the two visible leaves constrained by SVD-specific B3.
LA19 does not depend on computed PCA or SVD: its fixed low-rank factors teach
the update mechanism only. LA20 likewise remains independent through supported
rank-2 attention arithmetic.
