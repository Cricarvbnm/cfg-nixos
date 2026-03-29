{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tree
    curl
    iftop
    bitwarden-desktop
    tldr

    unrar
  ];

  programs = {
    git = {
      enable = true;
      config = {
        init.defaultBranch = "main";
        user = {
          name = "alechron";
          email = "alechron@outlook.com";
        };
        url = {
          "https://github.com/".insteadOf = [ "github:" ];
        };
        safe.directory = [ "/etc/nixos" ];

        alias = {
          s = "status --short";
          a = "add";
          aa = "add --all";
          c = "commit";
          cu = "commit --amend";
        };
      };
    };

    less = {
      enable = true;
      envVariables = {
        LESS = "-R --ignore-case";
      };
    };
  };
}
