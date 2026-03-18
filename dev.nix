{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    jetbrains.idea
    jetbrains.jdk
  ];
}
