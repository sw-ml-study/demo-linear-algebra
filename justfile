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

index:
    ./scripts/build-lesson-index

audit:
    ./scripts/check-structure
    ./scripts/check-assets
    ./scripts/check-curriculum
    ./scripts/check-ml-payoffs
    ./scripts/check-lesson-index
    ./scripts/check-accessibility
    ./scripts/check-claims

check: probes demos tests web audit
