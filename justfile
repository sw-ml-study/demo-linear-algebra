set shell := ["sh", "-cu"]

default:
    @just --list

tests *args:
    ./scripts/run-tests {{args}}

probes:
    ./scripts/run-probes

web:
    ./scripts/build-web-demos

audit:
    ./scripts/check-structure

check: probes tests web audit
