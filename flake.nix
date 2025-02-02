{
  description = "My NixOS system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-flatpak.url = "github:gmodena/nix-flatpak/latest";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # nixvim = {
    #   url = "github:nix-community/nixvim";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      pkgs = import nixpkgs {
        system = "x86_64-linux";
        config.allowUnfree = true;
      };
    in
    {
      nixosConfigurations.envy = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit inputs pkgs;
        };

        modules = [
          inputs.disko.nixosModules.disko
          inputs.nix-flatpak.nixosModules.nix-flatpak
          # inputs.nixvim.nixosModules.nixvim

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
