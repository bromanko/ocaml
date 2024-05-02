{
  description = "Expiments in ocaml";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    ocaml-overlay = {
      url = "github:nix-ocaml/nix-overlays";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, flake-parts, ocaml-overlay, ... }:
    let
    in flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "aarch64-darwin" "x86_64-linux" "aarch64-linux" ];

      perSystem = { pkgs, system, inputs', ... }:
        let
        in rec {
          _module.args.pkgs = import inputs.nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [ ocaml-overlay.overlays.default ];
          };

          packages = { inherit (pkgs) ; };
          devShells.default = pkgs.mkShell {
            buildInputs = with pkgs; [
              ocaml
              ocamlPackages.dune_3
              ocamlPackages.findlib
              ocamlPackages.ocamlformat
              ocamlPackages.ocaml-lsp
              ocamlPackages.dream
              ocamlPackages.dream-html
            ];
          };
        };
    };
}
