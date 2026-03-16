{ pkgs, ... }:
{
  home.packages = with pkgs; [
    jetbrains.idea
    jetbrains.jdk
  ];
}
