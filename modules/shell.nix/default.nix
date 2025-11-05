{ pkgs, lib, ... }: {
  imports = [ ./modules/lsd.nix ./modules/kitty.nix ];

  environment.systemPackages = with pkgs; [
    bat
    curl
    aria2
    tree
    lsof
    iftop
    nethogs
    htop
  ];

  programs = {
    zsh = {
      enable = true;

      setOptions = [ "HIST_IGNORE_DUPS" "HIST_FCNTL_LOCK" ];

      syntaxHighlighting = {
        enable = true;
        highlighters = [ "main" "brackets" ];
      };

      ohMyZsh = {
        enable = true;
        plugins = [ "sudo" ];
      };
    };

    zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    starship = {
      enable = true;
      presets = [ "nerd-font-symbols" ];
    };
  };
}
