{ pkgs, ... }: {
  environment = {
    systemPackages = [ pkgs.lsd ];
    shellAliases.ls = "lsd";
  };
}
