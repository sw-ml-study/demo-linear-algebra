# Reconciled next saga: orthogonality and factorizations

Purpose: deliver the capability-supported parts of LA14-LA16 while measuring
the smallest honest decomposition boundary. Systems evidence makes numerical
diagnostics central: a small reconstruction residual alone is not proof of a
stable basis, eigenvector, or low-rank factorization.

Ordinary MLPL already has rank-2 multiplication, transpose, reductions,
checked extraction, loops, Results, and the vector operations needed to derive
classical Gram-Schmidt on small matrices. That supports teaching derivations,
not a claim that robust QR, eigen, or SVD primitives exist. B2 remains scoped
to stable general solve; B3 stays a candidate until an executable lesson probe
identifies the smallest missing decomposition.

## Proposed steps

1. Probe column assembly/extraction, nested iteration, orthogonality and
   reconstruction residuals, dependent/near-dependent columns, and bounded
   convergence-state records on pinned fixtures.
2. Implement LA14 classical Gram-Schmidt with visible projection subtraction,
   `Q^T Q` and `QR-A` checks, explicit maximum shape, tolerance, and dependent-
   column errors.
3. Extend LA14 to bounded QR teaching fixtures and compare reconstruction and
   orthogonality errors without claiming numerical stability.
4. Implement the honest capability-supported portion of LA15: a bounded power-
   iteration trace with tolerance, iteration limit, residual, sign convention,
   and ambiguous/non-convergent counterexamples.
5. Decide B3 from executed LA14-LA15 evidence. Promote only the smallest robust
   QR/eigen capability that blocks a required lesson, with a minimal failing
   probe and upstream acceptance contract.
6. Gate LA16 SVD and low-rank reconstruction on that decision: implement only
   if singular values/vectors, ordering, degeneracy, and reconstruction can be
   represented honestly; otherwise publish the constrained leaf.
7. Integrate accepted lessons, visuals, syllabus, tests, and previews; run the
   full gate and reconcile the ML-payoff saga around B1, B2, and any verified
   B3 scope.

## Acceptance

- Every factorization advertises its maximum shape, tolerance, iteration limit,
  ordering/sign convention, and whether it is educational or production-grade.
- Orthogonality and reconstruction are checked independently; dependent and
  near-dependent columns have explicit outcomes.
- Iterative lessons expose convergence state and residuals, including a bounded
  failure or ambiguity witness; they never imply universal convergence.
- B3 is promoted only by an executable failing probe tied to a lesson that
  cannot be taught honestly with supported operations.
- Blocked leaves remain in the syllabus with an upstream acceptance contract;
  they are not filled by unstable compatibility code.
