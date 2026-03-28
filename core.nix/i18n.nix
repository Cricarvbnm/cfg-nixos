{ pkgs, ... }:
{
  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocales = [ "zh_CN.UTF-8/UTF-8" ];
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          kdePackages.fcitx5-chinese-addons
          fcitx5-pinyin-zhwiki
        ];
        settings = {
          inputMethod = {
            "Groups/0" = {
              Name = "Default";
              "Default Layout" = "us";
              DefaultIm = "pinyin";
            };
            "Groups/0/Items/0" = {
              Name = "keyboard-us";
              Layout = "";
            };
            "Groups/0/Items/1" = {
              Name = "pinyin";
              Layout = "";
            };
          };
        };
      };
    };
  };

  time.timeZone = "Asia/Shanghai";
}
