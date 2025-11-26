{ pkgs, ... }: {
  programs = {
    steam = {
      enable = true;
      package = pkgs.steam.override { privateTmp = false; };
      gamescopeSession.enable = true;
    };

    gamemode.enable = true;

    nix-ld.enable = true;
  };

  environment.systemPackages = with pkgs; [ steam-run bottles ];
}
