{
  inputs = {
    self.submodules = true;

    flake-parts.url = "github:hercules-ci/flake-parts";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Nixpkgs{{{
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs";
    # }}}

    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Others{{{
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
    # }}}
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
              # Add unstable nixpkgs to `pkgs`{{{
              (
                { inputs, ... }:
                {
                  nixpkgs.config.packageOverrides = pkgs: {
                    unstable = import inputs.nixpkgs-unstable {
                      inherit (pkgs.stdenv.hostPlatform) system;
                      inherit (pkgs) config;
                    };
                  };
                }
              )
              # }}}

              ./configuration.nix

              # Home-Manager Initialization{{{
              home-manager.nixosModules.home-manager
              ./users/home-manager.nix
              # }}}
            ];
            specialArgs = {
              inherit inputs;
            };
          };
        };
      };
    };
}
