{ inputs, pkgs, ... }:
{
  imports = [ inputs.plasma-manager.homeModules.plasma-manager ];

  home.packages = with pkgs; [ unrar ];

  programs = {
    # plasma = {
    # enable = true;
    # };

    konsole = {
      enable = true;
      defaultProfile = "mine";
      profiles.mine = {
        font = {
          name = "monospace";
        };
      };
    };
  };
}
