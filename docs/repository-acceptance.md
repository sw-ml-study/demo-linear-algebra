# Repository closeout acceptance

Accepted 2026-08-16 against MLPL v0.20.0 build `f77e8041`.

## Accepted repository state

- 20 planned lesson IDs are indexed.
- 17 lessons are runnable: LA01-LA15 and LA19-LA20.
- Three leaves are visibly constrained with no fake runnable artifacts:
  LA16 and LA18 by SVD-specific B3, and LA17 by B2.
- LA20's single rank-2 head is runnable; B1 applies only to batched and
  multi-head extensions.
- Every runnable lesson has linked CLI, standalone web, mlplunit test, and SVG
  preview evidence in the generated capability/lesson index.

The full acceptance gate runs 23 configured probes, 18 CLI programs, and 94 native mlplunit tests.
It also checks generated web parity, SVG freshness,
curriculum structure, LA17-LA20 integration, the 20-lesson generated index,
accessibility/static fallback structure, terminology and numerical claims, and
the B1-B3 upstream handoff. All pass.

## What closeout means

The bounded teaching repository meets `docs/research.txt` and `docs/plan.md`:
linear algebra progresses from arrays and geometry through matrices, systems,
factorizations, LoRA, and attention with executable checks and visual
explanations. Missing numerical capabilities remain executable upstream
contracts rather than hidden compatibility code.

Closeout does not claim a complete linear-algebra library, proof assistant,
production optimizer, transformer implementation, general solver, or SVD.
It does not claim every browser or assistive technology has been manually
tested. Those boundaries are preserved by the claims and accessibility audits.

## Capability-triggered reopening

There is no open-ended next feature queue. Reopen only when one of these
external facts changes:

1. `higher-rank-matmul` unexpectedly succeeds or changes diagnostics (B1);
2. `stable-general-solve` unexpectedly succeeds or changes diagnostics (B2);
3. `svd-decomposition` unexpectedly succeeds or changes diagnostics (B3); or
4. a supported MLPL/browser contract change breaks the full gate.

When triggered:

1. preserve and inspect the failing `just check` evidence;
2. follow the affected section of `docs/upstream-b1-b3-handoff.md`;
3. archive the completed closeout saga and initialize a narrowly named
   reconciliation saga for only the affected blocker or contract;
4. convert the expected-failure probe before changing lesson status;
5. run every upstream acceptance fixture and downstream lesson test;
6. update catalogs, regenerate the lesson index and web syllabus, revise the
   blocker ledger/acceptance reports, and run the complete gate; and
7. commit implementation and Agentrail metadata separately and push both.

Until a trigger occurs, the correct repository state is clean, accepted, and
idle—not an unbounded backlog.
