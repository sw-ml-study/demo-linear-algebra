# Stable general solve blocker decision

Decision: **promote B2 for LA17 production-quality least squares, while keeping
LA11-LA13 complete and runnable as bounded teaching lessons**.

## Executed evidence

The repository ran `probes/stable-general-solve.mlpl` through the configured
MLPL v0.20.0 build `f77e8041`. Its smallest required call is
`solve(A, B)`, where `A:[equation,unknown]` and `B:[equation,rhs]` contains two
right-hand sides. The process exits nonzero with `unknown function: solve`.
`catalog/probes.tsv` pins that diagnostic so a future implementation changes
the gate instead of silently invalidating this decision.

LA11-LA13 also establish what is and is not expressible in ordinary MLPL:

- finite exactly 2-by-2 classification, a guarded row swap, rank witnesses,
  independent residuals, and fixture-specific perturbation amplification work;
- division by zero and invalid square root yield non-finite values rather than
  `Result` errors, so every teaching path needs explicit guards;
- the teaching solver accepts one right-hand side, uses a fixed absolute pivot
  tolerance, and has no reusable factorization or general condition estimate.

Those constraints are honest for visible 2-by-2 derivations. Scaling the same
code into LA17 would falsely present a toy elimination routine as a stable,
production-quality least-squares foundation. That is the lesson-blocking need,
not merely the absence of a convenience builtin.

## Upstream acceptance contract

The smallest public operation is `solve(A, B)`, with vector and matrix
right-hand sides documented consistently. Exact record field names remain an
upstream design choice, but acceptance requires:

1. pivoting appropriate to the documented numerical method and reusable
   factorization behavior for multiple right-hand sides;
2. `Result` diagnostics for non-square `A`, dimension mismatch, singular or
   rank-deficient input, and every non-finite input or intermediate;
3. rank information and a condition estimate or a documented companion API
   that lets callers distinguish small residual from reliable parameters;
4. exact small-system and multi-RHS fixtures, a singular fixture, and a
   near-singular fixture checked against an independently derived oracle;
5. an independently computed residual with a stated scale-aware tolerance.

Once supported, this failing probe should become a success probe and LA17 may
delete any pedagogical bridge it would otherwise need. B2 does not require
changing the completed LA11-LA13 lesson APIs.
