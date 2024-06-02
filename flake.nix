{
  description = "My NixOS system configuration";
  
  inputs = {
    nixpkgs.url = "nixpkgs/release-24.05";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=v0.4.1";
    
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  outputs = { self, nixpkgs, disko, nix-flatpak, home-manager, ... }@inputs:
  {
    nixosConfigurations.envy = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs.inputs = inputs;
      
      modules = [
        disko.nixosModules.disko
        ./disk-config.nix
        
        nix-flatpak.nixosModules.nix-flatpak
        
        home-manager.nixosModules.home-manager
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

