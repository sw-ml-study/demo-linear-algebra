# Upstream sw-MLPL handoff: B1-B3

Measured 2026-08-15 against MLPL v0.20.0 build `f77e8041`. These are the
smallest verified upstream needs exposed by the completed bounded curriculum.
This repository does not modify `../sw-mlpl`.

## B1 — higher-rank and batched matrix multiplication

**Minimal reproducer:** `probes/higher-rank-matmul.mlpl` calls `matmul` with
compatible `[2,2,3]` and `[2,3,2]` operands. Observed result: nonzero exit with
`index has 3 components but array has rank 2`.

**Required semantics:** preserve rank-2 behavior; contract the last left axis
with the penultimate right axis; define equal and broadcast-compatible batch
prefixes; preserve or reject named axes deterministically; return precise rank,
batch-prefix, and inner-dimension diagnostics.

**Acceptance fixtures:** rank-2 regression; batch size one; equal batch
prefixes; one broadcast operand; incompatible prefixes; inner mismatch;
rank-4 attention-shaped head batches; labeled and positional operands; empty
batch dimensions if supported.

**Affected scope:** LA20 remains runnable as one rank-2 head. B1 blocks only
batched/multi-head extensions and realistic higher-rank model tensor work.

**Unlock actions:** change `higher-rank-matmul` from expected failure to
positive golden outputs; add batch/head axis and error tests; extend LA20 only
after those pass; update `catalog/ml-payoffs.tsv`, the generated lesson index,
the blocker ledger, claims audit, and acceptance reports. Do not change LA20's
current single-head result.

## B2 — stable general solve with diagnostics

**Minimal reproducer:** `probes/stable-general-solve.mlpl` calls `solve(A,B)`
for a square matrix and two right-hand sides. Observed result: nonzero exit with
`unknown function: solve`.

**Required semantics:** a `Result`-returning stable method with documented
pivoting or factorization reuse, vector and matrix right-hand sides, rank and
condition information (directly or by companion API), scale-aware residual
guidance, and structured shape, singularity, rank-deficiency, and non-finite
diagnostics.

**Acceptance fixtures:** exact small solve; multiple right-hand sides; singular
and rank-deficient matrices; near-singular independently checked solution and
residual; incompatible shapes; non-finite inputs and intermediates. LA17 also
requires an overdetermined least-squares path; if `solve` is square-only, a
stable QR/SVD-backed least-squares API is still required before LA17 unlocks.

**Affected scope:** LA17 only. LA11-LA13 remain complete bounded teaching code.

**Unlock actions:** convert the solve probe to positive acceptance; add general
solve and overdetermined regression tests; implement LA17 CLI/web/test/preview;
change its catalog/evidence status; regenerate the index; update B2, the LA17
gate, integration map, syllabus, README, claims checks, and acceptance reports.
Never substitute normal equations or expand `solve_system2` as the production
path.

## B3 — stable ordered SVD

**Minimal reproducer:** `probes/svd-decomposition.mlpl` calls
`svd([[3,0],[0,1]])`. Observed result: nonzero exit with `unknown function: svd`.

**Required semantics:** `Result`-returning thin SVD for finite rank-2 tall,
square, and wide matrices; nonnegative descending singular values; paired sign
policy for nondegenerate vectors; documented repeated-subspace behavior; zero
singular-value and rank-deficient handling; structured invalid/non-finite/empty
diagnostics; independent reconstruction and orthogonality tolerances.

**Acceptance fixtures:** exact diagonal; rectangular tall and wide; repeated
singular values; zero and rank-deficient matrices; near-degenerate spectrum;
non-finite and invalid rank; rank-k reconstruction for zero, intermediate, and
full rank with monotone Frobenius error.

**Affected scope:** LA16 low-rank reconstruction and LA18 PCA. LA14 QR and LA15
power iteration remain complete; general QR and eigen are not part of B3.

**Unlock actions:** convert the SVD probe to positive decomposition acceptance;
add ordered/degenerate SVD tests; implement LA16 before LA18; then implement PCA
centering, explained variance, projections, and mean-restored reconstruction;
change both catalog/evidence records; regenerate the index; update B3, both
gate decisions, integration, syllabus, README, claims checks, and acceptance
reports. Do not use hand-authored factors or covariance deflation.

## Reopening protocol

An upstream implementation announces itself by making an expected-failure
probe unexpectedly succeed, causing `just check` to fail. Reopen only the
affected leaf or extension, execute every acceptance fixture above, and commit
the probe reconciliation before claiming the blocker is resolved. Unrelated
bounded lessons and blocker scopes remain unchanged.
