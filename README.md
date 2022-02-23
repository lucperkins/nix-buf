# Buf + Nix

An example [Buf] development environment using [Nix].

* The [Flakes] configuration is in [`flake.nix`](./flake.nix)
* The non-Flakes configuration is in [`default.nix`](./default.nix), with the non-Flakes shell config in [`shell.nix`](./shell.nix)
* Some configuration shared by both is in [`shared.nix`](./shared.nix)

## Flakes

To run Buf commands using the Flakes configuration, preface them with `nix run . --`. Some examples:

```sh
nix run . -- build
nix run . -- generate
nix run . -- lint

# Also possible:
alias buf='nix run . --'
buf build
# etc.
```

## Original Nix (pre-Flakes)

To run Buf commands using the "old" Nix way, preface them with `nix-shell --pure --run`. Some examples:

```sh
nix-shell --pure --run "buf build"
nix-shell --pure --run "buf generate"
nix-shell --pure --run "buf lint"
# etc.
```

[buf]: https://buf.build
[flakes]: https://nixos.wiki/wiki/Flakes
[nix]: https://nixos.org

