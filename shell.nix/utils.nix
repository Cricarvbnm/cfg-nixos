{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ lsd ];

  programs = {
    bat.enable = true;
    starship = {
      enable = true;
      presets = [
        "nerd-font-symbols"
      ];
    };
  };

  environment.shellAliases = {
    cat = "bat --plain";
    ls = "lsd";
  };
}
