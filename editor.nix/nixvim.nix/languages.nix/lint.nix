{ ... }:
{
  plugins.lint = {
    enable = true;
    autoCmd = {
      callback = {
        __raw = ''
          function()
            require('lint').try_lint()
          end
        '';
      };
      event = [
        "BufEnter"
        "BufWritePost"
      ];
    };
  };
}
