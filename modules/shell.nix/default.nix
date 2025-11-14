{ pkgs, ... }: {
  imports = [ ./dev.nix ./git.nix ./keybindings.nix ./lsd.nix ];

  # Packages
  environment.systemPackages = with pkgs; [
    bat
    curl
    aria2
    tree
    lsof
    iftop
    nethogs
    htop
    nix-output-monitor
    file
    ffmpeg-headless
    tldr
  ];

  # Shell
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

  users.defaultUserShell = pkgs.zsh;

  environment.shellAliases = { ns = "nixos-rebuild switch"; };
}
