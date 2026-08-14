# demo-linear-algebra

Executable, visual linear algebra lessons in sw-MLPL, progressing from feature
vectors and dot products to least squares, PCA, LoRA, and attention.

The repository is both a curriculum and a forcing function: lessons use current
array operations where they are honest, and pin missing general capabilities as
executable upstream blockers instead of hiding them behind compatibility code.

Start with [the syllabus](docs/syllabus.md), read [the implementation
plan](docs/plan.md), and inspect [the measured capability
baseline](docs/capability-baseline.md).

Once the foundation harness is available:

```sh
just check
```

Tests use native mlplunit discovery through `mlplunit.conf`. Set absolute
`MLPL` or `MLPLUNIT` paths to override the documented adjacent development
tools without installing over stable binaries.
