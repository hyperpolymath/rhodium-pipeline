# SPDX-License-Identifier: AGPL-3.0-or-later
# SPDX-FileCopyrightText: 2025 Jonathan D.A. Jewell
# flake.nix — rhodium-pipeline (Nix fallback for Guix)
{
  description = "Rhodium Pipeline Template - Formally-verified data processing pipelines";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
      in
      {
        packages.default = pkgs.stdenv.mkDerivation {
          pname = "rhodium-pipeline";
          version = "0.1.0";

          src = ./.;

          buildInputs = with pkgs; [
            just
          ];

          nativeBuildInputs = with pkgs; [
            git
          ];

          installPhase = ''
            mkdir -p $out/share/rhodium-pipeline
            cp -r template $out/share/rhodium-pipeline/
            cp -r docs $out/share/rhodium-pipeline/
            cp README.adoc $out/share/rhodium-pipeline/
            cp LICENSE.txt $out/share/rhodium-pipeline/
          '';

          meta = with pkgs.lib; {
            description = "Methodology template for formally-verified data processing pipelines";
            homepage = "https://github.com/hyperpolymath/rhodium-pipeline";
            license = licenses.agpl3Plus;
            maintainers = [ ];
            platforms = platforms.all;
          };
        };

        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            # Core tools
            just
            git

            # Template engine
            cargo-generate

            # Configuration languages
            nickel

            # Optional: Rust development
            rustc
            cargo
            rustfmt
            clippy

            # Optional: Formal verification
            # isabelle  # Uncomment if available in nixpkgs
          ];

          shellHook = ''
            echo "🔧 Rhodium Pipeline development shell"
            echo "   Run 'just' to see available tasks"
            echo "   Run 'cargo generate --path template/' to test the template"
          '';
        };
      }
    );
}
