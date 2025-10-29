{ pkgs, ... }: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;
    users = {
      alec = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
      };
    };
  };

  security.sudo.wheelNeedsPassword = false;
}
