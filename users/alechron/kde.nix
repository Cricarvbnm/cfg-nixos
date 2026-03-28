{ inputs, ... }:
{
  imports = [ inputs.plasma-manager.homeModules.plasma-manager ];

  programs = {
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
