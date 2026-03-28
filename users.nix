{ config, ... }:
{
  _module.args = {
    mainUser = "alechron";
  };

  security.sudo.wheelNeedsPassword = false;
  users.users.${config._module.args.mainUser} = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };
}
