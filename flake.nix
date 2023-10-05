{
  description = "nix-ci";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-23.05";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
  };

  outputs =
    { self
    , nixpkgs
    , pre-commit-hooks
    }:
    let
      system = "x86_64-linux";
      overlay = final: _: {
        actusSpec = final.stdenv.mkDerivation {
          name = "actus-spec";
          src = ./spec;
          buildInputs = [
            final.typst
          ];
          buildCommand = ''
            mkdir -p $out
            typst compile $src/main.typ $out/spec.pdf
          '';
        };
      };
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ overlay ];
      };
    in
    {
      overlays.${system} = overlay;
      packages.${system}.default = pkgs.actusSpec;
      checks.${system} = {
        release = self.packages.${system}.default;
        shell = self.devShells.${system}.default;
        pre-commit = pre-commit-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            nixpkgs-fmt.enable = true;
            deadnix.enable = true;
          };
        };
      };
      devShells.${system}.default = pkgs.mkShell {
        name = "actus-spec-shell";
        buildInputs = (with pkgs; [
          pkgs.typst
        ]) ++ (with pre-commit-hooks.packages.${system};
          [
            nixpkgs-fmt
            deadnix
          ]);
        shellHook = self.checks.${system}.pre-commit.shellHook;
      };
    };
}
