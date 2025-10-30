{ pkgs, ... }: {
  imports = [ ./modules/lsd.nix ];

  environment.systemPackages = with pkgs; [
    bat
    curl
    aria2
    ffmpeg-normalize
    tree
  ];

  programs = {
    zsh = {
      enable = true;

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
