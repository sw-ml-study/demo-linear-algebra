# ML-payoff capability baseline

Measured 2026-08-15 on MLPL v0.20.0 build `f77e8041` through the ML-payoff
probes in `catalog/probes.tsv` and `tests/test_ml_payoff_capabilities.mlpl`.

| Behavior | Executed result | LA17-LA20 contract |
|---|---|---|
| low-rank update | `[3,1] @ [1,2]` produces the exact rank-one `[3,2]` delta and adds to a same-shaped base | LA19 can expose factors, delta, merged weights, and output effect with ordinary rank-2 operations |
| parameter accounting | shape products report six base values versus five adapter values for the fixture | LA19 must distinguish factor rank and trainable adapter values from stored base values; savings depend on dimensions |
| stable softmax | rows `[1000,1001]` and `[-1000,-999]` yield equal finite probabilities and sums exactly equal to one | LA20 can use native axis-wise softmax without an overflow-prone compatibility implementation |
| rank-2 attention | `[query=2,feature=2] @ [feature=2,key=3]` yields `[2,3]` scores; row softmax and `[2,3] @ [3,value=2]` yield `[2,2]` mixtures | one deterministic, unbatched single-head derivation is supported |
| higher-rank attention boundary | the existing compatible rank-3 matmul probe still fails with `index has 3 components but array has rank 2` | B1 continues to block batched and multi-head execution, not the bounded rank-2 LA20 lesson |

The fixtures independently check golden low-rank values, semantic shapes,
parameter counts, probability ordering, normalization, and attention output
shape. Native `softmax` is stable under the tested extreme common shifts; this
is executed evidence for the bounded lesson inputs, not a proof about every
floating-point value or axis configuration.

No new sw-MLPL blocker is identified. Rank-2 operations are sufficient for
LA19 and bounded LA20. B1 remains the precise blocker for batch/head axes, B2
still gates stable general least squares in LA17, and the SVD-specific B3 still
gates ordered, degeneracy-aware PCA in LA18.
