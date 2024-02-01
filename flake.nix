{
  description = "Rails's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    nixpkgs,
    home-manager,
    ...
  }: 
  let
    system = "aarch64-darwin";
    username = "rail";
  in {
    formatter.${system} = nixpkgs.legacyPackages.${system}.pkgs.alejandra;
    homeConfigurations = {
      ${username} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = { inherit username; };
        modules = [./modules/home-manager];
      };
    };
  };
}
