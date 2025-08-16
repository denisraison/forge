{
  description = "forge";

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
        packages.forge = pkgs.stdenv.mkDerivation {
          name = "forge";
          src = ./.;

          installPhase = ''
            mkdir -p $out/bin
            mkdir -p $out/share/forge

            cp ./forge $out/bin/forge
            cp -r ./template $out/share/forge/template

            substituteInPlace $out/bin/forge \
              --replace "@template_dir@" "$out/share/forge/template"
          '';
        };

        packages.default = self.packages.${system}.forge;

        apps.default = flake-utils.lib.mkApp { drv = self.packages.${system}.forge; };

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            (self.packages.${system}.forge)
          ];
        };
      }
    );
}
