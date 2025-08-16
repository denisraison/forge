{
  description = "quickspawn";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-25.05-darwin";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils, ... }: flake-utils.lib.eachSystem
    [ "aarch64-darwin" "x86_64-darwin" ]
    (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        packages.quickspawn = pkgs.stdenv.mkDerivation {
          name = "quickspawn";
          src = ./.;

          installPhase = ''
            mkdir -p $out/bin
            mkdir -p $out/share/quickspawn

            cp ./quickspawn $out/bin/quickspawn
            cp -r ./template $out/share/quickspawn/template

            substituteInPlace $out/bin/quickspawn \
              --replace "@template_dir@" "$out/share/quickspawn/template"
          '';
        };

        packages.default = self.packages.${system}.quickspawn;

        apps.default = flake-utils.lib.mkApp { drv = self.packages.${system}.quickspawn; };

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            (self.packages.${system}.quickspawn)
          ];
        };
      }
    );
}
