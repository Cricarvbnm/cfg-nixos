{ inputs, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];

  home-manager = {
    sharedModules = [ ./modules/home-manager.nix ./modules/test.nix ]
      ++ [ ./modules/nvim.nix ./modules/shell.nix ];
    users = {
      root = import ./users/root.nix;
      alec = import ./users/alec.nix;
    };
  };
}
