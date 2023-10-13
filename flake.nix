{
  description = "actus-spec";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-23.05";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    typstfmt.url = "github:astrale-sharp/typstfmt";
  };

  outputs =
    { self
    , nixpkgs
    , pre-commit-hooks
    , typstfmt
    }:
    let
      system = "x86_64-linux";
      overlay = final: _: {
        actusSpec = final.stdenv.mkDerivation {
          name = "actus-spec.pdf";
          src = ./spec;
          buildInputs = [
            final.typst
          ];
          buildCommand = ''
            typst compile $src/main.typ $out
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
            typstfmt = {
              enable = true;
              name = "typstfmt";
              entry = "${typstfmt.packages.${system}.default}/bin/typstfmt";
              types = [ "file" ];
              files = "\\.(typ)$";
            };
          };
        };
      };
      devShells.${system}.default = pkgs.mkShell {
        name = "actus-spec-shell";
        buildInputs = (with pkgs; [
          typst
        ]) ++ (with pre-commit-hooks.packages.${system};
          [
            nixpkgs-fmt
            deadnix
          ]);
        shellHook = self.checks.${system}.pre-commit.shellHook;
      };
    };
}
