return {
  "saghen/blink.cmp",
  version = "*",
  event = "InsertEnter",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "enter",
      ["<C-y>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-u>"] = { "scroll_documentation_up", "fallback" },
      ["<C-d>"] = { "scroll_documentation_down", "fallback" },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "lazydev" },
    },
    signature = {
      enabled = true,
      window = {
        border = "single",
        max_width = math.floor(vim.o.columns * 0.4),
        max_height = math.floor(vim.o.lines * 0.5),
      },
    },
    completion = {
      accept = {
        auto_brackets = {
          enabled = false,
        },
      },
      trigger = {
        show_on_accept_on_trigger_character = false,
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
      menu = {
        draw = {
          treesitter = { "lsp" },
          columns = {
            { "label", gap = 2 },
            { "kind_icon", gap = 1, "kind" },
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 200,
        window = {
          border = "none",
          max_width = math.floor(vim.o.columns * 0.4),
          max_height = math.floor(vim.o.lines * 0.5),
        },
      },
    },
  },
  opts_extend = { "sources.default" },
}
