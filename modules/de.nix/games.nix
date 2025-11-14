{ pkgs, ... }: {
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      package = pkgs.steam.override { privateTmp = false; };
    };

    gamemode.enable = true;

    nix-ld = { enable = true; };
  };

  environment.systemPackages = with pkgs; [
    steam-run
    mangohud
    protonup-qt
    # lutris
    bottles
    # heroic
  ];
}
