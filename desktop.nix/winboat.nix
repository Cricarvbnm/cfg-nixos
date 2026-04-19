{
  pkgs,
  config,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    pin-36a6.winboat
    docker-compose
  ];

  virtualisation.docker = {
    enable = true;
  };

  users.groups.docker.members = [ config._module.args.mainUser ];
}
