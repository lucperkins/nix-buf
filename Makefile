RUN = nix run . --

.PHONY: generate
generate:
	$(RUN) generate
