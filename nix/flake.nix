{
  description = "mackbook";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/3";
    determinate.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ 
    self,
    nix-darwin,
    nixpkgs,
    determinate
  }:
  
  let
    username = "themackabu";
    hostname = "MackBook-Pro";
    system = "aarch64-darwin";
  in
  
  {
    darwinConfigurations."${hostname}-${system}" = nix-darwin.lib.darwinSystem {
      inherit system;
      specialArgs = { inherit inputs self username hostname; };
      modules = [
        determinate.darwinModules.default
        ./configuration.nix
        ./packages.nix
        ./homebrew.nix
      ];
    };

    devShells.${system}.default =
      let pkgs = import nixpkgs { inherit system; };
      in pkgs.mkShellNoCC {
        packages = [(pkgs.writeShellApplication {
          name = "apply";
          runtimeInputs = [ nix-darwin.packages.${system}.darwin-rebuild ];
          text = ''sudo darwin-rebuild switch --flake ".#${hostname}-${system}"'';
        })
        self.formatter.${system}];
      };
      
    formatter.${system} = nixpkgs.legacyPackages.${system}.nixfmt;
  };
}