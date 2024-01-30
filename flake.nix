{
  description = "actus-spec";
  inputs = {
    # We use nixpkgs-unstable instead of nixos-23.05 to get a more
    # recent version of typst: 0.8 instead of 0.4
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixpkgs-unstable";
    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    typstPackages.url = "github:typst/packages";
    typstPackages.flake = false;
    typstnix.url = "github:NorfairKing/typst.nix";
  };

  outputs =
    { self
    , nixpkgs
    , pre-commit-hooks
    , typstPackages
    , typstnix
    }:
    let
      system = "x86_64-linux";


      overlay = final: _:
        let
          specDocument = final.makeTypstDocument {
            name = "actus-spec.pdf";
            main = "main.typ";
            src = ./spec;
          };
        in
        {
          actusSpec = final.linkFarm "actus-spec" [
            { name = "actus-spec.pdf"; path = specDocument; }
            { name = "test-data"; path = ./spec/test-data; }
          ];
          actusSpecPresentation = final.makeTypstDocument {
            name = "actus-spec-presentation.pdf";
            main = "presentation.typ";
            src = ./presentation;
            packagesRepo = typstPackages;
            typstDependencies = [
              {
                name = "polylux";
                version = "0.3.1";
              }
              {
                name = "diagraph";
                version = "0.2.0";
              }
            ];
          };
        };
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          typstnix.overlays.${system}
          overlay
        ];
      };
    in
    {
      overlays.${system} = overlay;
      packages.${system} = {
        default = pkgs.actusSpec;
        spec = pkgs.actusSpec;
        presentation = pkgs.actusSpecPresentation;
      };
      checks.${system} = {
        spec = self.packages.${system}.spec;
        presentation = self.packages.${system}.presentation;
        shell = self.devShells.${system}.default;
        pre-commit = pre-commit-hooks.lib.${system}.run {
          src = ./.;
          hooks = {
            nixpkgs-fmt.enable = true;
            deadnix.enable = true;
            jsonfmt = {
              enable = true;
              entry = "${pkgs.jsonfmt}/bin/jsonfmt -w";
              types = [ "file" ];
              files = "\\.(json)$";
            };
            build = {
              enable = true;
              entry = "${pkgs.writeShellScript "compile pre-commit" ''
                nix build .#spec
                cp result spec-draft.pdf
                chmod 764 spec-draft.pdf
                nix build .#presentation
                cp result presentation-draft.pdf
                chmod 764 presentation-draft.pdf
              ''}";
            };
          };
        };
      };
      devShells.${system}.default = pkgs.mkShell {
        name = "actus-spec-shell";
        buildInputs = (with pkgs; [
          typst
          jsonfmt
        ]) ++ (with pre-commit-hooks.packages.${system};
          [
            nixpkgs-fmt
            deadnix
            typst-fmt
          ]);
        shellHook = self.checks.${system}.pre-commit.shellHook;
      };
    };
}
