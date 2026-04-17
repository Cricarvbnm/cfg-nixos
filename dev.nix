{ pkgs, inputs, ... }:
{
  environment.systemPackages = with pkgs; [
    inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.texlive

    # Java
    jetbrains.idea
    jetbrains.jdk

    # Python
    uv
    python3
  ];
}
