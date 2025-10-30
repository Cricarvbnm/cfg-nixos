{ ... }: {
  imports = [ <home-manager/nixos> ];

  home-manager = {
    backupFileExtension = "bak";
    sharedModules = [ ./modules/home-manager.nix ./modules/test.nix ]
      ++ [ ./modules/nvim.nix ./modules/shell.nix ];
    users = {
      root = import ./users/root.nix;
      alec = import ./users/alec.nix;
    };
  };
}
