{ pkgs, ... }: {
  imports = [ ./dev.nix ./git.nix ./keybindings.nix ./lsd.nix ./tldr.nix ];

  # Shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  environment.shellAliases = {
    nr = "sudo nixos-rebuild";
    nors = "nr switch --log-format internal-json -v |& nom --json";
    nord = "nr dry-build --log-format internal-json -v |& nom --json";
    norb = "nr boot --log-format internal-json -v |& nom --json";
    nort = "nr test --log-format internal-json -v |& nom --json";
  };
}
