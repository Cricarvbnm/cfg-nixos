{ pkgs, ... }:
{
  programs.opencode = {
    enable = true;
    package = pkgs.pin-7171.opencode;
  };
}
