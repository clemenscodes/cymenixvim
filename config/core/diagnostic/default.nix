{...}: {
  keymaps = [
    {
      action = ":lua vim.diagnostic.goto_next({ float = false })";
      key = "<leader>nn";
      mode = ["n" "o" "x"];
      options = {
        silent = true;
        desc = "Move to next diagnostic";
      };
    }
    {
      action = ":lua vim.diagnostic.goto_prev({ float = false })";
      key = "<leader>nb";
      mode = ["n" "o" "x"];
      options = {
        silent = true;
        desc = "Move to next diagnostic";
      };
    }
  ];
  diagnostic = {
    settings = {
      update_in_insert = true;
      severity_sort = true;
      virtual_text = false;
      virtual_lines = true;

      float = {
        border = "rounded";
      };

      jump = {
        severity = {
          __raw = "vim.diagnostic.severity.WARN";
        };
      };

      signs = {
        text = {
          "__rawKey__vim.diagnostic.severity.ERROR" = "";
          "__rawKey__vim.diagnostic.severity.WARN" = "";
          "__rawKey__vim.diagnostic.severity.HINT" = "󰌵";
          "__rawKey__vim.diagnostic.severity.INFO" = "";
        };
        texthl = {
          "__rawKey__vim.diagnostic.severity.ERROR" = "DiagnosticError";
          "__rawKey__vim.diagnostic.severity.WARN" = "DiagnosticWarn";
          "__rawKey__vim.diagnostic.severity.HINT" = "DiagnosticHint";
          "__rawKey__vim.diagnostic.severity.INFO" = "DiagnosticInfo";
        };
        linehl = {
          "__rawKey__vim.diagnostic.severity.ERROR" = "DiagnosticError";
          "__rawKey__vim.diagnostic.severity.WARN" = "DiagnosticWarn";
          "__rawKey__vim.diagnostic.severity.HINT" = "DiagnosticHint";
          "__rawKey__vim.diagnostic.severity.INFO" = "DiagnosticInfo";
        };
        numhl = {
          "__rawKey__vim.diagnostic.severity.ERROR" = "DiagnosticError";
          "__rawKey__vim.diagnostic.severity.WARN" = "DiagnosticWarn";
          "__rawKey__vim.diagnostic.severity.HINT" = "DiagnosticHint";
          "__rawKey__vim.diagnostic.severity.INFO" = "DiagnosticInfo";
        };
      };
    };
  };
}
