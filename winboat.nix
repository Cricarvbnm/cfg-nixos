{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    winboat
    docker-compose
  ];

  virtualisation.docker = {
    enable = true;
  };

  users.groups.docker.members = [ "alechron" ];
}
