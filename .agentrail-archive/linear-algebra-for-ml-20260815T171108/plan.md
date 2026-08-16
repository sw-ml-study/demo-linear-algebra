# Reconciled next saga: linear algebra for ML

Purpose: connect the accepted curriculum to regression, PCA, LoRA, and
attention without bypassing verified B1, B2, or B3.

Capability gating overrides numeric lesson order. Rank-2 `matmul`, transpose,
reductions, explicit bias rows, bounded normalization, and fixed-shape records
support LoRA arithmetic and a single-head attention derivation. Stable general
least squares is blocked by B2, stable ordered SVD/PCA by B3, and batched or
multi-head matmul by B1. The saga must keep constrained leaves visible while
delivering the supported payoff first.

## Proposed steps

1. Probe low-rank `A@B` updates, parameter-count arithmetic, stable softmax at
   extreme logits, row-wise attention normalization, and the exact rank-2 to
   higher-rank boundary against the configured runtime.
2. Implement LA19 bounded LoRA: compare `W` with `W+A@B`, expose shapes and
   parameter counts, verify output deltas, and visualize the low-rank update.
3. Implement the capability-supported LA20 single-head attention path with
   visible `QK^T/sqrt(d)`, stable row weights, and value mixing; keep batched
   and multi-head execution constrained by B1.
4. Publish LA17 as constrained behind B2 unless a stable general least-squares
   path with diagnostics has appeared; do not use normal equations or the 2x2
   teaching solver as production regression.
5. Gate LA18 PCA on B3. Implement only if stable ordered components,
   degeneracy, centering, explained variance, and reconstruction can be
   represented honestly; otherwise publish the constrained leaf.
6. Integrate runnable and constrained LA17-LA20 leaves, cross-link every ML
   payoff to prerequisite lessons, and test blocker probes for capability
   changes that require reconciliation.
7. Run and audit the complete gate, publish ML-payoff acceptance, and reconcile
   the final curriculum/capability closeout without claiming blocked leaves ran.

## Acceptance

- Every runnable payoff exposes semantic shapes, deterministic fixtures,
  independent golden checks, and a visualization where relationships benefit.
- LoRA distinguishes factor rank from matrix rank and checks parameter savings
  plus output effect; it does not claim training or quality improvement.
- Attention derives stable weights and verifies each row sums to one; B1 stays
  explicit wherever batch/head axes are required.
- LA17 and LA18 become runnable only when B2/B3 acceptance contracts are met;
  otherwise their constrained status and downstream effects remain documented.
- No compatibility implementation hides a verified upstream blocker.
