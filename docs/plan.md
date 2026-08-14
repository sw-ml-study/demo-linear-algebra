# Implementation plan: linear algebra you can see and use

Status: **foundation curriculum LA01-LA06 accepted; matrices saga is next**.

This plan turns the brief in `docs/research.txt` into executable teaching
material and a focused sw-MLPL forcing function. The central question is:

> Can an array-oriented ML language make vector, matrix, tensor, and model
> computations feel like one continuous programming model?

The repository will not become a thin catalog of builtins or a replacement for
a full numerical library. Each lesson derives or exposes the relevant operation
from sw-MLPL arrays, checks a mathematical claim, visualizes the relationship,
and connects it to an ML use.

## Definition of a complete lesson

A lesson is complete only when all of these exist together:

1. a deterministic CLI `.mlpl` program with authoritative numeric checks;
2. native mlplunit coverage, including degenerate and counterexample cases;
3. a short standalone `web/*.mlpl` version when a visual adds teaching value;
4. a prolog stating prerequisites, shapes, claim, and boundary;
5. an epilog explaining how to read the result and why ML practitioners care;
6. catalog/syllabus entries and any capability evidence discovered; and
7. documented tolerance and conditioning assumptions for approximate results.

The web lesson anatomy follows the strongest newer sibling convention: framed
line-comment prolog, one transcript group boundary, readable concept-named
definitions, an explanation immediately before each visual, exactly one
evaluation of the visual value, and a framed epilog. Rendering helpers are
clearly marked as infrastructure so they do not obscure the mathematics.

## Target repository shape

```text
lib/                    reusable, pure linear-algebra helpers
demos/NN-topic/         self-checking CLI lessons
demos/web/              authored standalone browser lessons
web/                    checked generated copies for the playground
tests/                  native mlplunit suites
probes/                 minimal sw-MLPL capability probes
catalog/                lesson metadata and expected artifacts
scripts/                binary selection, generation, and checks
assets/previews/        stable outputs produced by demos
out/                    generated local artifacts, gitignored
docs/                   plan, syllabus, blockers, terminology, evidence
```

Static include may share production code between CLI demos and tests. Browser
lessons remain standalone because the playground cannot rely on repository
filesystem layout.

## Curriculum spine

The detailed prerequisites and learning outcomes are in `docs/syllabus.md`.
Delivery is capability-gated: a later supported lesson may proceed while an
earlier decomposition lesson waits on a verified upstream primitive.

| Unit | Lessons | Executable mathematics | ML payoff | Primary language pressure |
|---|---|---|---|---|
| 1. Vectors | scalars/vectors, addition, scale, dot, norms, distance, cosine | vector laws, Cauchy-style bounds on fixtures, similarity ordering | features, embeddings, retrieval | rank-1 arrays, reductions, broadcasting |
| 2. Geometry | linear combinations, span, basis, orthogonality, projection | residual orthogonality and reconstruction | representation and feature projection | masks/indexing, composition, tolerances |
| 3. Matrices | matrices, transpose, matmul, linear maps, composition | shape contracts and `A(Bx)=(AB)x` | dense layers and parameter transforms | labels, shape errors, axis operations |
| 4. Systems | elimination, rank, conditioning, solve | solution residuals, singular/inconsistent witnesses | regression and parameter estimation | row selection/update, multi-result APIs |
| 5. Factorizations | Gram-Schmidt, QR, eigensystems, SVD | reconstruction and orthogonality errors | PCA, stability, compression | decomposition primitives and convergence |
| 6. ML bridges | least squares, PCA, low rank, LoRA, attention | end-to-end golden fixtures | direct modern-ML applications | batched matmul, selected axes, higher rank |

The first visual grammar is intentionally small:

- arrows are vectors; length and direction encode magnitude and orientation;
- a basis grid deforms under a matrix, with determinant area shown only after
  determinant is honestly available or derived for the demonstrated size;
- projections show the original vector, its shadow, and an orthogonal residual;
- matrix multiplication highlights the active row/column and accumulated dot;
- systems show intersecting, parallel, or coincident constraints;
- PCA shows centered points, principal directions, and projected coordinates;
- low-rank approximation shows reconstruction error as rank changes; and
- attention shows query-key scores becoming weights and mixing value rows.

## Capability baseline and blocker boundary

Runtime probes against the pinned 2026-08-14 development binary verify scalar broadcasting,
`dot`, rank-2 `matmul`, `reshape`, `transpose`, `transpose_axes`, axis
reductions, axis labels, and static include. The public catalog additionally
lists seeded random arrays, `argmax`, and stable `softmax`; those become runtime
claims only when their lesson-level probes execute.
The exact binary identity and executed results are in
`docs/capability-baseline.md`; future capability claims must retain that
source-inspection-versus-runtime distinction.

The public catalog does not expose general solve/inverse/determinant,
LU/QR/SVD/eigendecomposition/least-squares, or batched matrix multiplication.
These are blocker *candidates*, not permission to demand all of them as
builtins. `docs/sw-mlpl-blockers.md` defines the decision rule:

- derive small educational cases from supported primitives when the derivation
  is the lesson (for example 2D determinant or Gram-Schmidt);
- request a general primitive when correctness, stability, or tensor semantics
  cannot be expressed honestly in ordinary MLPL; and
- keep affected lessons constrained while recording an executable acceptance
  probe. Never present an unstable toy algorithm as a production-grade solve.

The first verified blocker is batched/higher-rank matmul for attention. Stable
general solve and decomposition boundaries remain candidates for later
numerical lessons.
Convenience functions such as `outer`, `norm`, or `trace` are not blockers when
they compose clearly from reshape, elementwise operations, and reductions.

## Delivery program

One AgentRail saga is active at a time. `docs/sagas.md` is the durable queue.

### Saga 1 — foundation and vector geometry (active)

Establish mlplunit, binary selection, catalogs, web lesson checks, the
capability matrix, and a coherent first unit through cosine similarity and
projection. This proves the complete lesson contract before scaling the course.

### Saga 2 — matrices as transformations

Teach matrices, transpose, row-column multiplication, composition, labeled
axes, determinant/area in bounded dimensions, and a dense linear layer. End
with exact shape-error and label-propagation evidence.

### Saga 3 — systems, rank, and numerical honesty

Implement pedagogical elimination where current indexing permits it; compare
residuals; distinguish unique, singular, inconsistent, and ill-conditioned
systems. Measure whether a stable general solve is blocked upstream.

### Saga 4 — orthogonality and factorizations

Build Gram-Schmidt and bounded QR as teaching algorithms, with dependent-column
counterexamples. Gate robust QR/eigen/SVD work on measured capabilities and do
not disguise fixed-iteration power methods as a general eigensolver.

### Saga 5 — ML payoff

Connect least squares, PCA, low-rank approximation, LoRA, and attention. Each
application reuses earlier concepts and exposes shapes at every stage. Batched
attention remains constrained until its rank/axis semantics are executable.

### Saga 6 — curriculum integration

Audit every lesson against the contract, rebuild stable previews, verify the
browser learning path and reduced-motion/static equivalents, publish the final
capability report, and define follow-on work without claiming the subject is
exhausted.

## Per-step acceptance gate

After the foundation creates it, every implementation step runs `just check`,
which must cover mlplunit, demo smoke execution, structural/doc checks, web
generation freshness, and blocker-probe expectations. A step then stages named
files, commits code and current AgentRail metadata, and invokes
`agentrail complete`. Completion metadata is committed separately if the tool
changes it. Do not start the next step in the same session.

## What would make this plan wrong

- If a diagram does not clarify a relationship better than a small array,
  remove it; visualization is not a quota.
- If general row mutation makes elimination dominate the lesson with plumbing,
  constrain it and prioritize projection/iterative demonstrations that fit the
  language honestly.
- If a decomposition needs robust pivoting, convergence diagnostics, or
  multiple outputs unavailable in MLPL, specify the upstream contract instead
  of shipping a misleading approximation.
- If browser transcript limits conflict with a derivation, keep the CLI lesson
  authoritative and make the web leaf a smaller visual witness.
- If named axes or rank behavior differs from source inspection, runtime probes
  win and the syllabus is reordered around verified support.
