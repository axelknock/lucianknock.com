{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
    systems.url = "github:nix-systems/default";
  };
  
  outputs = {
    self,
      nixpkgs,
      flake-utils,
      systems,
  }:
    flake-utils.lib.eachSystem (import systems)
      (system: let
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = [ pkgs.bashInteractive ];
          buildInputs = with pkgs; [
            nodejs_20  
            nodePackages.typescript-language-server
            nodePackages.npm
            nodePackages.tailwindcss
          ];
        };
      });
}
