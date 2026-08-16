# Accessibility and static-fallback audit

Measured 2026-08-15 across all 17 runnable lesson pairs with
`scripts/check-accessibility`.

The executable audit verifies for every authored standalone web lesson:

- exactly one visual binding and exactly one rendered SVG;
- an SVG `role="img"` with nonempty structural `<title>` and `<desc>` elements;
- readable source order: `WHAT THIS SHOWS` prolog, visual, then
  `HOW TO READ THE RESULT` epilog;
- no static include, file read, or file write side effect;
- byte-for-byte authored/generated web parity; and
- exactly one inline static SVG definition for the browser lesson dialect.

Every committed LA preview is independently required to provide `role="img"`,
`<title>`, and `<desc>`. Any future `<animate>` or CSS `@keyframes` usage must
also include `prefers-reduced-motion`; the current 17 lessons and previews are
fully static, so their ordinary rendering is already the fallback.

The browser lesson dialect intentionally includes narration statements and
comments that are not asserted to be standalone CLI programs; numeric CLI
execution is covered separately by the lesson demos and mlplunit tests.

All 17 runnable lessons pass. LA16-LA18 are intentionally absent because their
blocked catalog records have no web or preview artifacts. This audit checks
program and SVG structure; it does not claim conformance with every browser,
screen reader, color-contrast standard, or human usability need.
