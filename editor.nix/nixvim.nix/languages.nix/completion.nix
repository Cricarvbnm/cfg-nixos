{
  plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
          ];
        };
        snippets = {
          preset = "default";
        };
        keymap = {
          preset = "super-tab";
          "<c-'>" = [
            "show"
            "show_documentation"
            "hide_documentation"
          ];
        };
      };
    };
    blink-cmp-copilot.enable = true;
  };
}
