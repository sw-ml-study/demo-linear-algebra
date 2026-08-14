# Foundation curriculum acceptance

Status: **accepted on 2026-08-14**.

The `linear-algebra-foundations` saga delivers one coherent executable unit,
LA01–LA06, from feature arrays through orthogonal projection. Acceptance was
run against MLPL v0.20.0 build `f77e8041`; exact binary identity remains in
`docs/capability-baseline.md`.

## Delivered learning path

| Lesson | Executable claim | Visual evidence | ML bridge |
|---|---|---|---|
| LA01 vectors | addition is componentwise; scaling is uniform | head-to-tail sum and doubled arrow | feature arrays |
| LA02 dot | multiply matching components, then reduce | alignment signs and row-column accumulator | logits/similarity |
| LA03 norm | length, difference length, and unit direction | 3-4-5 triangle, distance, normalized arrow | normalized representations |
| LA04 cosine | normalize dot alignment and rank directions | embedding arrows and golden score bars | semantic retrieval |
| LA05 span | coefficients combine directions; dependence loses uniqueness | plane grid versus one line | feature synthesis |
| LA06 projection | shadow plus orthogonal residual reconstructs input | basis line, shadow, residual, right angle | dimensionality reduction |

All six have deterministic self-checking CLI programs, standalone browser
programs, catalog/syllabus entries, and demo-produced SVG previews embedded in
README. The web programs use framed prerequisites/shapes/claim/numerics/boundary
prologs, commented executable statements, explanations immediately before
visuals, one bound visual evaluation, and HOW TO READ / THE POINT epilogs.

## Gate evidence

`just check` runs, in order:

1. six capability probes, including the diagnostic-pinned expected rank-3
   `matmul` failure;
2. all six CLI lessons and their artifact writes;
3. native mlplunit discovery: 27 tests, all passing;
4. authored-to-generated web copy generation and exact comparison;
5. structural, narration, self-checking, link/path, and standalone-web checks;
6. exact freshness checks for all six demo-produced previews; and
7. accessibility/static checks requiring SVG titles/descriptions and reduced
   motion whenever animation is introduced.

The shared numerical contract is inclusive absolute tolerance. Its tests use
exactly representable `±0.125` boundary values plus `1.125001` just outside;
lesson calculations use documented `1e-9` tolerances. Exact integer fixtures
say so explicitly. Finite examples are described as demonstrations, never
general proofs.

## Capability findings

Elegant with current MLPL:

- rank-1 elementwise arithmetic and scalar broadcasting;
- reductions, `dot`, norms built from `sqrt(dot(v,v))`, and cosine;
- exact rank/dimension checks with Results;
- `grade_down` for deterministic retrieval;
- static include for one production library used by demos and tests; and
- dependency-free inline SVG strings.

Awkward but not blocking:

- fixed browser lessons repeat SVG because they must remain standalone;
- the bounded 2D dependence witness manually extracts four components; and
- the initial asset freshness script enumerates six outputs explicitly.

Verified blocker:

- B1: rank-3/batched `matmul` fails with `index has 3 components but array has
  rank 2`. It does not block the next rank-2 matrix saga, but it constrains the
  later attention lesson.

No solve/decomposition request was promoted. Those remain later lesson-gated
candidates because this saga did not need them.

## Agentrail audit note

`agentrail audit` matches each implementation commit to its intended saga
step and finds no orphan step. It also reports the separate post-completion
metadata commits as orphan commits. Those commits are intentional consequences
of the mandated two-commit closeout: `agentrail complete` records the work
commit already at `HEAD`, then writes summary/state that must itself be
committed. They are not missing work steps and must not be retroactively added
as fake production steps merely to silence the heuristic.

## Acceptance decision

The foundation unit meets its bounded scope. This does not complete the
20-lesson syllabus. The next highest-value work is the rank-2
`matrices-as-transformations` saga in `docs/matrices-saga.md`. It can proceed
without upstream changes; it must re-probe row/column extraction and label
semantics before fixing its lesson APIs.
