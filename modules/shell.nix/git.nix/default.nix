{ lib, ... }: {
  programs.git.enable = true;
  environment.etc.gitconfig = lib.mkForce { source = ./gitconfig; };
}
