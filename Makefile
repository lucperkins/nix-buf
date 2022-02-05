NIX   = nix
FLAKE = $(NIX) run . --

flake-build:
	$(FLAKE) build

.PHONY: generate
flake-generate:
	$(FLAKE) generate

.PHONY: lint
flake-lint:
	$(FLAKE) lint
