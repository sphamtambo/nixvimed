{
  plugins.noice = {
    enable = true;

    settings = {
      notify = {
        enabled = false;
      };

      messages = {
        enabled = true; # Adds padding-bottom to statusline when false for some reason
      };

      lsp = {
        message = {
          enabled = true;
        };
        progress = {
          enabled = false;
          view = "mini";
        };
      };

      popupmenu = {
        enabled = true;
        backend = "nui";
      };

      format = {
        filter = {
          pattern = [
            ":%s*%%s*s:%s*"
            ":%s*%%s*s!%s*"
            ":%s*%%s*s/%s*"
            "%s*s:%s*"
            ":%s*s!%s*"
            ":%s*s/%s*"
          ];
          icon = "";
          lang = "regex";
        };

        replace = {
          pattern = [
            ":%s*%%s*s:%w*:%s*"
            ":%s*%%s*s!%w*!%s*"
            ":%s*%%s*s/%w*/%s*"
            "%s*s:%w*:%s*"
            ":%s*s!%w*!%s*"
            ":%s*s/%w*/%s*"
          ];
          icon = "󱞪";
          lang = "regex";
        };
      };
    };
  };
}
