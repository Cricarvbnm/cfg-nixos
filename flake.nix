{
  inputs = {
    self.submodules = true;

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
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
      self,
      nixpkgs,
      flake-parts,
      home-manager,
      nixvim,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      perSystem =
        {
          system,
          pkgs,
          self,
          ...
        }:
        let
          texlive = pkgs.texliveSmall.withPackages (
            ps: with ps; [
              collection-langchinese
              latexmk
            ]
          );
        in
        {
          packages = {
            nvim = nixvim.legacyPackages.${system}.makeNixvimWithModule {
              inherit pkgs;
              module = import ./editor.nix/nixvim.nix;
              extraSpecialArgs = {
                inherit texlive;
              };
            };
            inherit texlive;
          };
        };

      flake = {
        nixosConfigurations = {
          alec-nixos = nixpkgs.lib.nixosSystem {
            modules = [
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
