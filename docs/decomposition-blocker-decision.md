# Decomposition blocker decision after LA14-LA15

Decision: **do not promote B3 from the LA14-LA15 evidence**.

## Executed evidence

LA14 implements classical Gram-Schmidt for exactly two columns and two or
three rows. It exposes projection subtraction, positive-`R` sign policy,
dependent-column tolerance, and independent `||Q^TQ-I||F` and `||QR-A||F`
errors. Its near-dependent counterexample reconstructs exactly in the measured
arithmetic while losing about `1.11e-3` orthogonality, teaching why this is not
stable general QR rather than hiding that limitation.

LA15 implements power iteration for exactly 2x2 matrices with a Rayleigh value,
eigenpair residual, residual history, deterministic vector sign, positive
tolerance, and integer iteration limit capped at 100. A rotation cycles to the
limit with residual one; identity stops with a tiny residual but has no unique
dominant direction. The bounded lesson distinguishes convergence, failure to
converge, and ambiguity without claiming a general ordered eigensystem.

Ordinary MLPL's rank-2 multiplication, transpose, reductions, checked column
extraction, loops, and Results are sufficient for both learning outcomes on
MLPL v0.20.0 build `f77e8041`.

## Why there is no failing probe

The blocker rule requires a planned lesson that cannot be expressed correctly,
readably, and honestly—not merely an absent convenience builtin. LA14 and LA15
are runnable and their limitations are part of the instruction. Calling a
guessed `qr(A)` or `eigen(A)` signature would prove only that the public catalog
does not expose that guessed name. It would not identify a downstream contract
or justify choosing robust QR over a symmetric eigensolver.

Consequently B3 remains a candidate and no speculative failure probe is added.
The executable counterexamples establish that bounded teaching algorithms are
sufficient for the completed lessons and insufficient evidence for a
production decomposition API request.

## Constrained follow-on

LA16 may proceed only if singular values and vectors, descending ordering,
deterministic sign conventions, repeated/zero singular-value behavior, and
reconstruction error can be represented honestly in a bounded lesson. If not,
LA16 must promote the smallest SVD-specific blocker with a minimal executable
probe and upstream acceptance contract. It must not retroactively promote QR,
eigen, and SVD as one bundle.

## Subsequent LA16 outcome

LA16 later verified the narrower SVD-specific scope of B3. That later result
does not alter this LA14-LA15 non-promotion decision and does not promote QR or
eigen APIs. See `docs/svd-blocker-decision.md`.
