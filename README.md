# Nix flake templates for easy dev environments

[![built with nix](https://builtwithnix.org/badge.svg)](https://builtwithnix.org)

To initialize (where `${ENV}` is listed in the table below):

```shell
nix flake init --template github:decentn2madness/devenv#${ENV}
```

Here's an example (for the [`rust`](./rust) template):

```shell
# Initialize in the current project
nix flake init --template github:decentn2madness/devenv#rust

# Create a new project
nix flake new --template github:decentn2madness/devenv#rust ${NEW_PROJECT_DIRECTORY}
```

## How to use the templates

Once your preferred template has been initialized, you can use the provided shell in two ways:

1. If you have [`nix-direnv`][nix-direnv] installed, you can initialize the environment by running `direnv allow`.
2. If you don't have `nix-direnv` installed, you can run `nix develop` to open up the Nix-defined shell.

## Available templates

| Language/framework/tool  | Template                      |
| :----------------------- | :-----------------------------|
| [Dhall]                  | [`dhall`](./dhall/)           |
| [Elixir]                 | [`elixir`](./elixir/)         |
| [Elm]                    | [`elm`](./elm/)               |
| [Gleam]                  | [`gleam`](./gleam/)           |
| [Go]                     | [`go`](./go/)                 |
| [Nim]                    | [`nim`](./nim/)               |
| [Nix]                    | [`nix`](./nix/)               |
| [Node.js][node]          | [`node`](./node/)             |
| [PHP]                    | [`php`](./php/)               |
| [Purescript]             | [`purescript`](./purescript/) |
| [Ruby]                   | [`ruby`](./ruby/)             |
| [Rust]                   | [`rust`](./rust/)             |

## Template contents

The sections below list what each template includes. In all cases, you're free to add and remove packages as you see fit; the templates are just boilerplate.

### [`dhall`](./dhall)

- [Dhall] 1.40.2
- [dhall-bash]
- [dhall-csv] (Linux only)
- [dhall-docs]
- [dhall-json]
- [dhall-lsp-server]
- [dhall-nix]
- [dhall-nixpkgs]
- [dhall-openapi]
- [dhall-text] (Linux only)
- [dhall-toml]
- [dhall-yaml]

### [`elixir`](./elixir/)

- [Elixir] 1.13.4, including [mix] and [IEx]
- [gigalixir] (Linux only)

### [`elm`](./elm/)

- [Elm] 0.19.1
- [elm2nix] 0.2.1

### [`gleam`](./gleam/)

- [Gleam] 0.22.1

### [`go`](./go/)

- [Go] 1.19
- Standard Go tools ([goimports], [godoc], and others)
- [golangci-lint]

### [`haskell`](./haskell/)

- [GHC][haskell] 9.0.2
- [cabal] 3.6.2.0

### [`nim`](./nim)

- [Nim] 1.6.6
- [nimble] 0.13.1

### [`nix`](./nix/)

- [Cachix] 0.8.1
- [dhall-to-nix] 1.1.23
- [lorri]
- [niv]
- [nixfmt]
- [statix]
- [vulnix]

### [`node`](./node/)

- [Node.js][node] 18.7.0
- [npm] 8.15.0
- [pnpm] 7.9.1
- [Yarn] 1.22.19
- [node2nix] 1.11.1

### [`php`](./php/)

- [PHP] 8.1.10
- [Composer] 2.4.2

### [`purescript`](./purescript/)

- [Purescript]
- [Spago]
- [purescript-language-server]
- [purs-tidy]

### [`python`](./python/)

- [Python] 3.11.0rc1
- [pip] 22.1.2
- [Virtualenv] 20.15.1
- [mach-nix]

### [`ruby`](./ruby/)

- [Ruby] 3.1.2p20, plus the standard Ruby tools (`bundle`, `gem`, etc.)

### [`rust`](./rust/)

- [Rust], including [cargo], [Clippy], and the other standard tools. The Rust version is determined as follows, in order:

  - From the `rust-toolchain.toml` file if present
  - From the `rust-toolchain` file if present
  - Version 1.63.0 if neither is present

- [rust-analyzer] 2022-08-01
- [cargo-audit] 0.17.0
- [cargo-deny] 0.12.1
- [cross] 0.2.4

## Code organization

All of the templates have only the root [flake](./flake.nix) as a flake input. That root flake provides a common revision of [Nixpkgs] and [`flake-utils`][flake-utils] to all the templates.

[cabal]: https://www.haskell.org/cabal
[cachix]: https://www.cachix.org
[cargo]: https://doc.rust-lang.org/cargo
[cargo-audit]: https://crates.io/crates/cargo-audit
[cargo-deny]: https://crates.io/crates/cargo-deny
[clippy]: https://github.com/rust-lang/rust-clippy
[composer]: https://getcomposer.org/
[cross]: https://github.com/cross-rs/cross
[dhall]: https://dhall-lang.org
[dhall-bash]: https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-bash
[dhall-csv]: https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-csv
[dhall-docs]: https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-docs
[dhall-json]: https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-json
[dhall-lsp-server]: https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-lsp-server
[dhall-nix]: https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-nix
[dhall-nixpkgs]: https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-nixpkgs
[dhall-openapi]: https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-openapi
[dhall-text]: https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-text
[dhall-to-nix]: https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-nix
[dhall-toml]: https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-toml
[dhall-yaml]: https://github.com/dhall-lang/dhall-haskell/tree/master/dhall-yaml
[elixir]: https://elixir-lang.org
[elm]: https://elm-lang.org
[elm2nix]: https://github.com/cachix/elm2nix
[flake-utils]: https://github.com/numtide/flake-utils
[gigalixir]: https://www.gigalixir.com
[gleam]: https://gleam.run
[go]: https://go.dev
[godoc]: https://pkg.go.dev/golang.org/x/tools/cmd/godoc
[goimports]: https://pkg.go.dev/golang.org/x/tools/cmd/goimports
[golangci-lint]: https://github.com/golangci/golangci-lint
[haskell]: https://haskell.org
[iex]: https://hexdocs.pm/iex/IEx.html
[lorri]: https://github.com/target/lorri
[mach-nix]: https://github.com/DavHau/mach-nix
[mix]: https://elixir-lang.org/getting-started/mix-otp/introduction-to-mix.html
[nim]: https://nim-lang.org
[nimble]: https://github.com/nim-lang/nimble
[niv]: https://github.com/nmattia/niv
[nix]: https://nixos.org
[nix-cue]: https://github.com/jmgilman/nix-cue
[nixfmt]: https://github.com/serokell/nixfmt
[nixpkgs]: https://github.com/NixOS/nixpkgs
[nix-direnv]: https://github.com/nix-community/nix-direnv
[node]: https://nodejs.org
[node2nix]: https://github.com/svanderburg/node2nix
[npm]: https://npmjs.org
[pip]: https://pypi.org/project/pip
[php]: https://php.net/
[pnpm]: https://pnpm.io
[Purescript]: https://github.com/purescript/purescript
[purescript-language-server]: https://github.com/nwolverson/purescript-language-server
[purs-tidy]: https://github.com/natefaubion/purescript-tidy
[python]: https://python.org
[ruby]: https://ruby-lang.org
[rust]: https://rust-lang.org
[rust-analyzer]: https://rust-analyzer.github.io
[statix]: https://github.com/nerdypepper/statix
[Spago]: https://github.com/purescript/spago
[virtualenv]: https://pypi.org/project/virtualenv
[vulnix]: https://github.com/flyingcircusio/vulnix
[yarn]: https://yarnpkg.com
