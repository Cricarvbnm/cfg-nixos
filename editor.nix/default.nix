{ inputs, pkgs, ... }:
{
  environment = {
    systemPackages = [ inputs.self.packages.${pkgs.system}.nvim ];
    sessionVariables.EDITOR = "nvim";
  };
}
