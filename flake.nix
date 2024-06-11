{
  description = "My NixOS system configuration";
  
  inputs = {
    nixpkgs.url = "nixpkgs/release-24.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
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
	
        inputs.home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.robert = import ./home.nix;
        }
        
        ./configuration.nix
      ];
    };
  };
}

