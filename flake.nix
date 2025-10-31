{
  inputs = {
    nixpkgs.url = "git+ssh://git@github.com/NixOS/nixpkgs?ref=nixos-25.05";
    nixos-hardware.url = "git+ssh://git@github.com/NixOS/nixos-hardware";
    home-manager = {
      url =
        "git+ssh://git@github.com/nix-community/home-manager?ref=release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, ... }@inputs: {
    nixosConfigurations.alec-nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [ ./configuration.nix ];
    };
  };
}
