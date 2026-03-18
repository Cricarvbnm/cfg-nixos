{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.self.packages.${pkgs.system}.texlive

    # Java
    jetbrains.idea
    jetbrains.jdk
  ];
}
