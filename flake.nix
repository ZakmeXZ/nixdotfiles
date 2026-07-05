{
    description = "My dotfiles initial flake";
    
    inputs = {
        nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
        
        noctalia = {
            url = "github:noctalia-dev/noctalia/legacy-v4";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        home-manager = {
            url = "github:nix-community/home-manager";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };

    outputs =
    {
        self,
        nixpkgs,
        home-manager,
        noctalia,
        ...
    }@inputs: {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86-64-linux";
            specialArgs = { inherit inputs; };
            modules = [
                ./configuration.nix
                home-manager.nixosModules.home-manager
                {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.extraSpecialArgs = { inherit inputs; };
                    home-manager.users.zakme = import ./home.nix;
                }
            ];
        };
    };
}

