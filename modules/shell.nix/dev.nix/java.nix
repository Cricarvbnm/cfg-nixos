{ pkgs, ... }: { environment.systemPackages = with pkgs; [ maven jdk21 jdk8 ]; }
