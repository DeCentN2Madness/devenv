{
  description = "
    One Flake to rule them all,
    One Flake to find them,
    One Flake to bring them all
    and in the dorkness >>= them.
  ";

  nixConfig.bash-prompt-suffix = "[nix] \\e\[38;5;172mλ \\e\[m";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/757b82211463dd5ba1475b6851d3731dfe14d377";
    flake-utils = {
      url = "github:numtide/flake-utils/5aed5285a952e0b949eb3ba02c12fa4fcfef535f";
    };
  };

  outputs = { flake-utils, nixpkgs, self }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        config = {};
        overlays = [];
        pkgs = import nixpkgs { inherit config overlays system; };
      in rec {
        devShell = pkgs.haskellPackages.shellFor {
          packages = p: [
          ];

          buildInputs = with pkgs.haskellPackages; [
            cabal-install
            # ghcid
            haskell-language-server
            hlint
            # hpack
            stack
          ];

          withHoogle = false;
        };
      }
    );
}
