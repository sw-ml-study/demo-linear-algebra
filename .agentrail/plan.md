# Reconciled next saga: systems, rank, and conditioning

Purpose: deliver LA11-LA13 using small transparent algorithms while measuring
whether stable general solve support must become blocker B2.

Matrix-saga evidence changes the starting point: rank-2 row/cell extraction,
flat `scatter`, loops, reductions, shape checks, and labels are sufficient for
bounded pedagogical elimination. Native extraction diagnostics are not clear
enough for learners, so the existing checked wrappers remain the public lesson
boundary. Nothing yet justifies claiming a stable general solver exists.

## Proposed steps

1. Probe flat-scatter row updates, row swaps, division-by-zero behavior,
   non-finite comparisons, and residual norms on exact and near-singular
   fixtures.
2. Implement LA11 bounded 2x2 systems with geometric unique, parallel, and
   coincident/inconsistent witnesses plus explicit residuals.
3. Implement LA12 pedagogical elimination with a visible augmented matrix,
   pivot decisions, row operations, rank classifications, and size limits.
4. Implement LA13 conditioning with paired nearby systems, perturbation ratios,
   residual-versus-solution-error narration, and explicit tolerance policy.
5. Decide B2 from evidence: keep stable general solve constrained if ordinary
   MLPL cannot honestly provide pivoting, rank/condition diagnostics, multiple
   right-hand sides, and non-finite handling.
6. Integrate LA11-LA13, publish acceptance, and reconcile factorization work.

## Acceptance

- Every solver advertises its maximum size and numerical policy.
- Unique, singular/underdetermined, and inconsistent cases are distinguished;
  no zero pivot is silently divided.
- Residuals are computed independently from the solve path.
- Conditioning distinguishes a small residual from an accurate solution.
- B2 is promoted only with a minimal executable failing probe and an upstream
  acceptance contract; a toy elimination routine is never presented as a
  production-grade general solve.
