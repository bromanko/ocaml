{
  description = "Expiments in ocaml";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ self, nixpkgs, flake-parts, ... }:
    let
    in flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "aarch64-darwin" "x86_64-linux" "aarch64-linux" ];

      perSystem = { pkgs, system, inputs', ... }:
        let
        in rec {
          devShells.default = pkgs.mkShell {
            packages = with pkgs;
              [ ocaml opam dune_3 ocamlPackages.ocamlformat ]
              ++ lib.optional stdenv.isDarwin [
                darwin.apple_sdk.frameworks.CoreFoundation
                darwin.apple_sdk.frameworks.CoreServices
              ];
          };
        };
    };
}
