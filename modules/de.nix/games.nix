{ pkgs, ... }: {
  programs = {
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };

    gamemode.enable = true;

    nix-ld.enable = true;
  };

  environment.systemPackages = with pkgs; [ steam-run bottles ];
}
