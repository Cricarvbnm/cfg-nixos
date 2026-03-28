{ inputs, pkgs, ... }:
{
  environment = {
    systemPackages = [ inputs.self.packages.${pkgs.stdenv.hostPlatform.system}.nvim ];
    sessionVariables.EDITOR = "nvim";
  };
}
