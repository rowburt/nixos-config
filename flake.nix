{
  description = "My NixOS system configuration";
  
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";

      # Commented out to fix nixvim issue
      # https://github.com/NixOS/nixpkgs/pull/291040#issuecomment-2156604610
      # inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { nixpkgs, ... }@inputs:
  {
    nixosConfigurations.envy = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs.inputs = inputs;
      
      modules = [
        inputs.disko.nixosModules.disko
        inputs.nix-flatpak.nixosModules.nix-flatpak
        inputs.nixvim.nixosModules.nixvim

        ./host/configuration.nix

        inputs.home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.robert = import ./home.nix;
        }
      ];
    };
  };
}

