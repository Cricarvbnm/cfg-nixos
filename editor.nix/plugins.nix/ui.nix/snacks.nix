{ ... }:
{
  plugins.snacks = {
    enable = true;

    settings = {
      indent.enabled = true;
      input.enabled = true;
      notifier.enabled = true;
      scope.enabled = true;
      scroll.enabled = true;
      words.enabled = true;
    };
  };

  keymaps = [
    {
      options.desc = "Notification History";
      key = "<leader>n";
      action.__raw = ''
        function()
          if Snacks.config.picker and Snacks.config.picker.enabled then
            Snacks.picker.notifications()
          else
            Snacks.notifier.show_history()
          end
        end
      '';
    }
  ];
}
