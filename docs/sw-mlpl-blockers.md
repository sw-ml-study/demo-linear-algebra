# sw-MLPL linear-algebra capability ledger

Status: **B1, B2, and the SVD-specific scope of B3 are verified**.

A missing convenience builtin is not automatically a blocker. This repository
calls something blocking only when a planned lesson cannot be expressed
correctly, readably, and with honest numerical behavior using supported MLPL.
Every promoted blocker must have a minimal file under `probes/`, configured
binary/version evidence, required semantics, acceptance cases, and affected
lesson IDs.

## Supported baseline to verify

Runtime probes now confirm `dot`, rank-2 `matmul`, scalar
broadcasting, `reshape`, `transpose`, `transpose_axes`, axis reductions, axis
labels, static include, and stable row-wise `softmax` on MLPL v0.20.0 build
`f77e8041`. Seeded random arrays and `argmax` remain public-catalog evidence
until a lesson needs them. See `docs/capability-baseline.md` and
`docs/ml-payoff-capability-baseline.md` for the executed surface.

## B1 — batched and higher-rank matrix multiplication (verified blocker)

Affected: batched and multi-head LA20 extensions and realistic
multi-example/head tensor work. The
probe `probes/higher-rank-matmul.mlpl` passes compatible `[2,2,3]` and
`[2,3,2]` operands to `matmul`; v0.20.0 build `f77e8041` exits nonzero with
`index has 3 components but array has rank 2`. `catalog/probes.tsv` pins that
failure so an upstream implementation announces itself by changing the gate.

Required behavior, if current `matmul` rejects it:

```text
matmul([batch,m,k], [batch,k,n]) -> [batch,m,n]
matmul([batch,m,k], [k,n])       -> [batch,m,n]
```

The contract must define batch broadcasting, contraction axes, named-axis
compatibility, output labels, and precise mismatch diagnostics. Acceptance
fixtures include batch size one, unequal compatible batch prefixes, incompatible
prefixes, rank-2 compatibility, and attention-shaped rank-4 arrays. Repeated
explicit loops are acceptable only as a small teaching bridge, not as evidence
that general tensor matmul exists.

The ML-payoff probe confirms the bounded LA20 derivation itself is not blocked:
rank-2 query-key multiplication, stable row-wise softmax, and rank-2 value
mixing all execute. B1 begins when batch or head axes make the operands rank 3
or higher.

## B2 — stable general linear solve with diagnostics (verified blocker)

Affected: production-quality least squares in LA17. LA11-LA13 remain runnable
because they intentionally use checked, finite, exactly 2-by-2 teaching code.

Pedagogical Gaussian elimination for tiny matrices is part of the curriculum,
but it does not replace a numerically stable solve. The minimal probe
`probes/stable-general-solve.mlpl` requests `solve(A, B)` with two right-hand
sides. MLPL v0.20.0 build `f77e8041` exits nonzero with
`unknown function: solve`. This promotes B2: ordinary MLPL has no callable public solve primitive,
while extending the lesson routine would require inventing production
pivoting, rank/condition diagnostics, multi-RHS policy, and non-finite behavior.

A general primitive should return a `Result` and distinguish non-square input,
dimension mismatch, singularity/rank deficiency, and non-finite input. The
upstream design may return factorization metadata (pivoting, rank, condition
estimate) in the solve record or through a separate documented API; the probe
fixes the smallest call shape, not that metadata representation.

Acceptance must cover exact small systems, multiple right-hand sides, a
singular matrix, an ill-conditioned fixture with residual tolerance, and shape
diagnostics. The test oracle must be independently derived or cross-checked,
not the same implementation copied twice.

Pre-LA11 probes confirm bounded row updates/swaps and independent residuals are
expressible. They also show division by zero returns infinity and invalid
square root returns NaN rather than a Result, so lesson algorithms must guard
pivots and intermediates explicitly. See `docs/systems-capability-baseline.md`.
The executed decision and exact boundary are recorded in
`docs/stable-solve-blocker-decision.md`.

## B3 — stable ordered SVD for low-rank reconstruction (verified blocker)

Affected: LA16 low-rank reconstruction, LA18 PCA, and LA19 compression/LoRA
analysis. LA14 bounded Gram-Schmidt and LA15 bounded power iteration remain
runnable and do not request general QR or eigen primitives.

Classical Gram-Schmidt and fixed-iteration power methods are valuable teaching
algorithms and can be written from basic operations. They are not robust,
general QR/eigen/SVD implementations. Promote only the smallest decomposition
that blocks the next honest lesson, with explicit ordering/sign conventions,
multi-result representation, convergence/error behavior, degenerate spectra,
and reconstruction/orthogonality acceptance checks.

Likely priority is stable QR or least-squares before a broad eigensolver; SVD
becomes justified by PCA and low-rank reconstruction. Do not request all three
merely to resemble NumPy.

The executed LA14-LA15 decision did **not** promote B3. Bounded classical
Gram-Schmidt exposes projection subtraction, dependence, reconstruction, and
orthogonality loss; bounded power iteration exposes convergence, iteration-
limit cycling, and spectral ambiguity. Those lessons are complete without a
missing primitive. Therefore no speculative `qr` or `eigen` failure probe is
added. LA16 must separately decide whether its ordered, degenerate-aware SVD
semantics create the first lesson-blocking decomposition need. See
`docs/decomposition-blocker-decision.md`. The subsequent LA16 gate does promote
the narrower SVD need: `probes/svd-decomposition.mlpl` calls `svd(A)` on an
exact 2x2 matrix, and MLPL v0.20.0 build `f77e8041` exits nonzero with
`unknown function: svd`. See `docs/svd-blocker-decision.md`.

## Expressible conveniences, not blockers initially

`norm`, distance, cosine similarity, outer product, trace, diagonal extraction,
2D determinant, projection, and covariance can be composed from current array
operations for bounded lessons. If doing so exposes missing indexing, slicing,
or cell operations, record that specific measured obstruction rather than
promoting the convenience function itself.

Matrix extraction probes also found an imprecise native out-of-bounds `take`
diagnostic (`shape mismatch: 2 vs 2 elements`). This is awkward, not blocking:
`lib/matrices.mlpl` validates rank/integer bounds and returns structured row or
column errors using ordinary MLPL. See `docs/matrix-capability-baseline.md`.

The probes also show that a scalar extracted from a labeled matrix retains
empty label metadata: numeric `eq` treats it as the same number, while
structural `equal` distinguishes it from a positional scalar. This is semantic
friction, not a current blocker; matrix lessons preserve and explain it rather
than silently stripping provenance.

The dense-layer payoff also measured that `[sample,output] + [output]` fails
with `add: expected [2, 2], got [2]`; rank-1-to-rank-2 trailing-axis
broadcasting is not supported by the configured runtime. This is friction, not
a current blocker: the bounded payoff constructs repeated bias rows as
`ones([samples,1]) @ reshape(bias,[1,outputs])`. Higher-rank model ergonomics
may revisit a general broadcasting contract alongside B1.

## Evidence template

For each finding record: configured command and version; minimal source;
observed stdout/stderr and exit status; expected semantics; affected lessons;
workaround and its correctness/complexity cost; upstream acceptance cases; and
the downstream code deleted or unlocked when the capability lands.
