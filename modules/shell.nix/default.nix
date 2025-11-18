{ pkgs, ... }: {
  imports = [ ./dev.nix ./git.nix ./keybindings.nix ./lsd.nix ./tldr.nix ];

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

  environment.shellAliases = {
    nr = "sudo nixos-rebuild";
    nors = "nr switch --log-format internal-json -v |& nom --json";
    nord = "nr dry-build --log-format internal-json -v |& nom --json";
    norb = "nr boot --log-format internal-json -v |& nom --json";
    nort = "nr test --log-format internal-json -v |& nom --json";
    nd = "nix profile diff-closures --profile /nix/var/nix/profiles/system";
    npi = "nix path-info -r /nix/var/nix/profiles/system";
  };
}
