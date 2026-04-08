{
  inputs = {
    self.submodules = true;

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    flake-parts.url = "github:hercules-ci/flake-parts";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plasma-manager = {
      url = "github:nix-community/plasma-manager";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
  };

  outputs =
    inputs@{
      nixpkgs,
      flake-parts,
      home-manager,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      perSystem =
        {
          inputs',
          pkgs,
          self',
          ...
        }:
        {
          packages = {
            texlive = pkgs.texliveSmall.withPackages (
              ps: with ps; [
                collection-langchinese
                latexmk
              ]
            );
            nvim = inputs'.nixvim.legacyPackages.makeNixvimWithModule {
              inherit pkgs;
              module = import ./editor.nix/nixvim.nix;
              extraSpecialArgs = {
                inherit self';
              };
            };
          };
        };

      flake = {
        nixosConfigurations = {
          alec-nixos = nixpkgs.lib.nixosSystem {
            modules = [
              (
                { inputs, ... }:
                {
                  nixpkgs.config.packageOverrides = pkgs: {
                    unstable = import inputs.nixpkgs-unstable {
                      inherit (pkgs) config;
                      inherit (pkgs.hostPlatform) system;
                    };
                  };
                }
              )

              ./configuration.nix

              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  extraSpecialArgs = { inherit inputs; };
                  users.alechron = ./users/alechron/home.nix;
                };
              }
            ];
            specialArgs = {
              inherit inputs;
            };
          };
        };
      };
    };
}
