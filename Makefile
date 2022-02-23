NIX   = nix-shell --pure --run
FLAKE = nix run . --

build:
	$(NIX) "buf build"

generate:
	$(NIX) "buf generate"

lint:
	$(NIX) "buf lint"

flake-build:
	$(FLAKE) build

flake-generate:
	$(FLAKE) generate

flake-lint:
	$(FLAKE) lint

