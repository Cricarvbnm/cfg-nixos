{ ... }: {
  programs.kitty = {
    enable = true;

    enableGitIntegration = true;
    themeFile = "Catppuccin-Macchiato";
  };
}
