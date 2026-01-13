{ pkgs, config, ... }:
{
  programs = {
    bash = {
      interactiveShellInit = ''
        if [[ $(${pkgs.procps}/bin/ps --no-header --pid=$PPID --format=comm) != "fish" && -z ''${BASH_EXECUTION_STRING} ]]
        then
          shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=""
          exec ${config.programs.fish.package}/bin/fish $LOGIN_OPTION
        fi
      '';
    };

    fish = {
      enable = true;

      loginShellInit = ''
        # Source /etc/profile
        exec bash -c "test -e /etc/profile && source /etc/profile; exec fish"
      '';

      interactiveShellInit = ''
        fish_vi_key_bindings
      '';

      shellInit = ''
        set -gx SHELL "${config.programs.fish.package}/bin/fish"
      '';
    };
  };

  environment.systemPackages = with pkgs; [
    # Fish plugins
    fishPlugins.bass
  ];
}
