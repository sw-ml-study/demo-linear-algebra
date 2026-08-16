# AgentRail saga queue

Only one saga is active at a time. Later sagas are deliberately revisable when
runtime probes or completed lessons expose a smaller upstream requirement.
No downstream saga modifies `../sw-mlpl`.

## Completed — `linear-algebra-foundations`

1. `repository-and-capability-baseline` — establish the repository harness,
   native mlplunit contract, binary selection, catalog/docs gates, and execute
   minimal probes for current array, label, matmul, and web behavior.
2. `vectors-and-array-laws` — implement LA01 with whole-array vector addition
   and scaling, law/counterexample tests, CLI narration, and first web visual.
3. `dot-product-and-alignment` — implement LA02 as elementwise products plus
   reduction, visualize alignment and row-column accumulation, and compare the
   builtin as an oracle.
4. `norm-distance-normalization` — implement LA03 with zero-vector policy,
   tolerance helpers, geometric visuals, and boundary tests.
5. `cosine-embedding-similarity` — implement LA04 with deterministic embedding
   fixtures and golden retrieval ordering; document magnitude invariance.
6. `span-orthogonality-projection` — implement LA05-LA06, including dependent
   basis and zero-denominator witnesses, projection residual geometry, and
   explicit finite-example boundaries.
7. `foundation-curriculum-integration` — run the full gate; audit prologs,
   epilogs, comments, visuals, syllabus links, previews, and capability ledger;
   publish the foundation acceptance report and reconcile Saga 2.

Acceptance: LA01-LA06 form a coherent browser and CLI unit; native mlplunit is
the authoritative test runner; every approximate comparison names its
tolerance; all visuals are demo-produced; and capability claims have executable
evidence against a pinned interpreter.

Acceptance report: `docs/foundation-acceptance.md`.

## Completed — `matrices-as-transformations`

Implement LA07-LA10: matrix anatomy, row-column matmul, composition, transpose,
labeled shapes, 2D determinant/area, and a dense-layer payoff. Measure, but do
not assume, higher-rank matmul semantics.

Reconciled executable plan: `docs/matrices-saga.md`. Foundation evidence shows
rank-2 work is unblocked; B1 constrains only higher-rank follow-on lessons.

Acceptance report: `docs/matrix-acceptance.md`.

## Completed — `systems-rank-conditioning`

Implement LA11-LA13 with pedagogical elimination, residuals, singular and
inconsistent witnesses, and a conditioning visual. Promote B2 only when the
lesson evidence proves the current language cannot meet the stable general
contract.

Reconciled executable plan: `docs/systems-saga.md`.

Acceptance report: `docs/systems-acceptance.md`. B2 is verified for the
production-quality LA17 boundary; it does not invalidate bounded LA11-LA13.

## Completed — `factorizations`

Implement capability-supported parts of LA14-LA16. Separate educational
algorithms from production-grade decompositions, and leave constrained leaves
honestly queued behind B3.

Reconciled executable plan: `docs/factorizations-saga.md`.

Acceptance report: `docs/factorization-acceptance.md`. LA14-LA15 are runnable;
LA16 remains a visible constrained leaf behind SVD-specific B3.

## Completed — `linear-algebra-for-ml`

Implement LA17-LA20: least squares, PCA, low-rank reconstruction, LoRA, and
attention. Reuse earlier APIs and visual grammar. Promote B1 or decomposition
asks only with executable evidence.

Reconciled executable plan: `docs/ml-payoff-saga.md`.

Acceptance report: `docs/ml-payoff-acceptance.md`. LA19 and bounded LA20 are
runnable; LA17 remains constrained by B2, while LA16 and LA18 remain
constrained by SVD-specific B3. B1 constrains batched/multi-head extensions.

## Completed — `curriculum-and-capability-closeout`

Audit the complete learning path, generated artifacts, accessibility/static
fallbacks, terminology, numerical claims, and upstream contracts. Completion
means the planned bounded curriculum is integrated; it does not mean linear
algebra or sw-MLPL development is finished.

Reconciled executable plan: `docs/curriculum-closeout-saga.md`.

Acceptance report: `docs/repository-acceptance.md`. No saga is queued. Future
work begins only when an executable B1-B3 probe or supported runtime/browser
contract changes, using the targeted reopening protocol in the report.
