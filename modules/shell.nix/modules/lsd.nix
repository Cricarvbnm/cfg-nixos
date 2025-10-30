{ pkgs, ... }: {
  environment.systemPackages = [ pkgs.lsd ];

  programs.zsh.shellAliases = { ls = "lsd"; };
}
