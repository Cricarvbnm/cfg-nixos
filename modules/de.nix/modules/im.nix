{ pkgs, ... }: {
  i18n = {
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          # Methods
          fcitx5-mozc
          fcitx5-chinese-addons

          # GUI
          fcitx5-gtk
          catppuccin-fcitx5

          # Dictionaries
          fcitx5-pinyin-zhwiki
          fcitx5-pinyin-moegirl
        ];

        settings = {
          globalOptions = {
            "Hotkey/TriggerKeys"."0" = "Super+space";
            "Hotkey/EnumerateGroupForwardKeys"."0" = "Alt+Super+space";
            "Hotkey/EnumerateGroupBackwardKeys"."0" = "Alt+Super+space";
          };
          inputMethod = {
            "Groups/0" = {
              Name = "jp";
              "Default Layout" = "us";
              "DefaultIM" = "mozc";
            };
            "Groups/0/Items/0".Name = "keyboard-us";
            "Gropus/0/Items/1".Name = "mozc";

            "Groups/1" = {
              Name = "Default";
              "Default Layout" = "us";
              "DefaultIM" = "pinyin";
            };
            "Groups/1/Items/0".Name = "keyboard-us";
            "Gropus/1/Items/1".Name = "pinyin";

            GroupOrder = {
              "0" = "Default";
              "1" = "jp";
            };
          };
        };
      };
    };
  };

  environment.sessionVariables = {
    GTK_IM_MODULE = "fcitx";
    QT_IM_MODULE = "fcitx";
    XMODIFIERS = "@im=fcitx";
  };
}
