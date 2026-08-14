# Authored web lessons

Standalone browser `.mlpl` lessons are authored here and copied to `web/` by
`scripts/build-web-demos`. They must not use `include` or filesystem effects.
Start each new lesson from `docs/web-lesson-template.mlpl` and keep numeric
checks authoritative outside the rendering code.
