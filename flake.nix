{
  description = "Rails's dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    nixpkgs,
    nix-darwin,
    home-manager,
    ...
  }: let
    username = "rail";
    system = "aarch64-darwin";
    hostname = "crlMBP-M7X0LWQFJ6MzA4";
    specialArgs = inputs // {inherit username system;};
  in {
    legacyPackages.aarch64-darwin = nixpkgs.legacyPackages.${system};
    formatter.${system} = nixpkgs.legacyPackages.${system}.pkgs.alejandra;
    darwinConfigurations.${hostname} = nix-darwin.lib.darwinSystem {
      inherit system specialArgs;
      modules = [
        ./modules/darwin
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = false;
          home-manager.users.rail = import ./modules/home-manager;
          home-manager.extraSpecialArgs = specialArgs;
        }
      ];
    };
  };
}
