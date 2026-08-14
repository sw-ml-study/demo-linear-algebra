set shell := ["sh", "-cu"]

default:
    @just --list

tests *args:
    ./scripts/run-tests {{args}}

probes:
    ./scripts/run-probes

demos:
    ./scripts/run-demos

web:
    ./scripts/build-web-demos

audit:
    ./scripts/check-structure
    ./scripts/check-assets

check: probes demos tests web audit
