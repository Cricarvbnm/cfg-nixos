{
  inputs = {
    self.submodules = true;

    flake-parts.url = "github:hercules-ci/flake-parts";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # Nixpkgs{{{
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs";

    # Nixpkgs Pins{{{
    # nixpkgs/nixos-25.11
    nixpkgs-36a6.url = "github:NixOS/nixpkgs/36a601196c4ebf49e035270e10b2d103fe39076b";
    # nixpkgs
    nixpkgs-7171.url = "github:NixOS/nixpkgs/717151106d79681eb9ef82fa28bef5f05a94e591";
    # }}}
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
