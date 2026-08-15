# LA17 least-squares capability gate

Decision: **publish LA17 as constrained behind verified blocker B2**.

Measured 2026-08-15 on MLPL v0.20.0 build `f77e8041`. The configured
`probes/stable-general-solve.mlpl` still exits nonzero with `unknown function: solve`
for `solve(A,B)` with multiple right-hand sides. The complete 23-probe
gate passes because that failure remains the pinned expected behavior.

## Why the lesson does not use a compatibility path

LA17 needs an overdetermined regression fit whose numerical diagnostics make
residual geometry and parameter reliability honest. The existing LA11 solver
is deliberately restricted to exactly 2x2 coefficients, one right-hand side,
and a fixed absolute pivot threshold. It is excellent teaching code for line
intersections and not a production regression foundation.

Normal equations, `(X^T X) beta = X^T y`, are also rejected as a bridge. They
square the condition number and would still require the unavailable stable
general solve. Extending classical Gram-Schmidt from LA14 would replace a
verified upstream need with more hand-authored numerical-library code and
would not supply pivoting, rank-revealing behavior, or condition diagnostics.

## Runnable acceptance contract

LA17 may become runnable only when ordinary MLPL supplies a stable general
least-squares or solve path that meets B2 and the lesson can demonstrate:

1. an overdetermined `[sample,feature]` design and one or more targets;
2. rank-deficiency and non-finite input as structured `Result` errors;
3. documented pivoting or rank-revealing factorization behavior;
4. rank and condition information sufficient to separate fit residual from
   parameter reliability;
5. independently recomputed residuals with a scale-aware tolerance; and
6. exact, noisy, ill-conditioned, rank-deficient, and multi-target fixtures.

At that point `probes/stable-general-solve.mlpl` must be reconciled from an
expected failure to positive acceptance evidence before LA17 receives CLI,
web, preview, or mlplunit lesson artifacts.

## Downstream effect

LA18 PCA remains separately gated by SVD-specific B3. LA19 and bounded LA20
are already runnable because their rank-2 arithmetic does not depend on a
least-squares solve. Keeping LA17 visible and constrained preserves curriculum
order without claiming that a blocked regression program executed.
