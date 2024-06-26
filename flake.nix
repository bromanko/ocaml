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
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "aarch64-darwin" "x86_64-linux" "aarch64-linux" ];

      perSystem = { pkgs, system, inputs', ... }: {
        _module.args.pkgs = import inputs.nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [
            ocaml-overlay.overlays.default
            (import ./nix/overlays/dream.nix)
            (import ./nix/overlays/daisyui)
          ];
        };

        packages = { };
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            ocaml
            ocamlPackages.dune_3
            ocamlPackages.findlib
            ocamlPackages.ocamlformat
            ocamlPackages.ocaml-lsp
            ocamlPackages.utop
            ocamlPackages.crunch

            ocamlPackages.core
            ocamlPackages.cmdliner
            ocamlPackages.fmt
            ocamlPackages.dream
            ocamlPackages.dream-html

            ocamlPackages.ppx_inline_test
            ocamlPackages.ppx_expect

            nodePackages.daisyui
            nodePackages."@tailwindcss/typography"
          ];

          packages = with pkgs; [ tailwindcss ];

          shellHook = ''
            mkdir -p node_modules
            ln -s ${pkgs.nodePackages.daisyui}/lib/node_modules/daisyui node_modules/daisyui &> /dev/null || true
            ln -s ${
              pkgs.nodePackages."@tailwindcss/typography"
            }/lib/node_modules/@tailwindcss node_modules/@tailwindcss &> /dev/null || true
          '';
        };
      };
    };
}
