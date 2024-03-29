local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
  return
end

local setup = {
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  -- add operators that will trigger motion and text object completion
  -- to enable all native operators, set the preset / operators plugin above
  -- operators = { gc = "Comments" },
  key_labels = {
    -- override the label used to display some keys. It doesn't effect WK in any other way.
    -- For example:
    -- ["<space>"] = "SPC",
    -- ["<cr>"] = "RET",
    -- ["<tab>"] = "TAB",
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
  },
  popup_mappings = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  window = {
    border = "rounded", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
    align = "left", -- align columns left, center or right
  },
  ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
  hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
  show_help = true, -- show help message on the command line when the popup is visible
  triggers = "auto", -- automatically setup triggers
  -- triggers = {"<leader>"} -- or specify a list manually
  triggers_blacklist = {
    -- list of mode / prefixes that should never be hooked by WhichKey
    -- this is mostly relevant for key maps that start with a native binding
    -- most people should not need to change this
    i = { "j", "k" },
    v = { "j", "k" },
  },
}

local opts = {
  mode = "n", -- NORMAL mode
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {
  ["L"] = { "<cmd>Lazy<cr>", "Plugin manager (lazy.nvim)" },
  ["M"] = { "<cmd>Mason<cr>", "LSP manager (mason)" },
  ["z"] = { "<cmd>lua ExportColorsZathura()<cr>", "Export colors to zathura" },
  ["k"] = { "<cmd>lua ExportColorsKitty()<cr>", "Export colors to kitty" },
  ["y"] = { "<cmd>lua ExportColorsSioyek()<cr>", "Export colors to Sioyek" },
  ["a"] = { "<cmd>Alpha<cr>", "Alpha" },
  ["b"] = {
    "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Buffers",
  },
  ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
  ["f"] = {
    "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
    "Find files",
  },
  ["r"] = { "<cmd>Telescope oldfiles<cr>", "Recently used files" },
  ["g"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },

  G = {
    name = "Git",
    g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    d = {
      "<cmd>Gitsigns diffthis HEAD<cr>",
      "Diff",
    },
  },

  l = {
    name = "LSP",
    d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
    w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
    k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    m = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Show Diagnostic Mesage" },
  },
  s = {
    name = "Search",
    b = { "<cmd>Telescope git_branches<cr>", "Checkout Branch" },
    c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
    h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
    m = { "<cmd>Telescope marks<cr>", "Marks" },
    M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
    f = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    H = { "<cmd>Telescope command_history<cr>", "Command History" },
  },
  t = { "<cmd>TroubleToggle<CR>", "Toggle Diagnostics" },
  T = { "<cmd>UndotreeToggle<CR>", "Undo Tree" },
  D = {
      name = "Debug",
      r = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
      E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
      C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
      U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
      c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
      e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
      h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
      i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
      o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
      q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
      s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
      t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
      x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
      u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
  },
  o = {
    name = "Org mode",
    c = { "<cmd>lua require('orgmode').action('capture.prompt')<cr>", "Capture" },
    a = { "<cmd>lua require('orgmode').action('org_mappings.archive')<cr>", "Archive current headline" },
    k = { "<cmd>lua require('orgmode').action('org_mappings.todo_next_state')<cr>", "Cycle todo keyword" },
    d = { "<cmd>lua require('orgmode').action('org_mappings.org_deadline')<cr>", "Deadline" },
    s = { "<cmd>lua require('orgmode').action('org_mappings.org_schedule')<cr>", "Schedule" },
    T = { "<cmd>lua require('orgmode').action('org_mappings.org_time_stamp')<cr>", "Time stamp" },
    --o = { "<cmd>lua require('orgmode').action('org_mappings.open_at_point')<cr>", "Open hyperlink or date under cursor" },
  },
  d = {
    name = "GDB",
    s = { "<cmd>:call StartGDB()<cr>", "Start GDB (F6)"},
    r = { "<cmd>GdbRun<cr>", "Run (C-F6)"},
    b = { "<cmd>GdbBreakpointToggle<cr>", "Toggle breakpoint (F8)"},
    c = { "<cmd>GdbContinue<cr>", "Continue execution (F6)"},
    n = { "<cmd>GdbNext<cr>", "Step over next statement (F10)"},
    p = { "<cmd>GdbStep<cr>", "Step into next statement (F11)"},
    u = { "<cmd>GdbUntil<cr>", "Continue execution until [line] (F7)"},
    i = { "<cmd>GdbInterrupt<cr>", "Break program execution into the debugger"},
    w = { "<cmd>GdbEvalWord<cr>", "Evaluate <cword> or [range] (F9)"},
    l = { "<cmd>GdbLopenBreakpoints<cr>", "Load breakpoint locations into list"},
    k = { "<cmd>GdbLopenBacktrace<cr>", "Load backtrace locations into list"},
    q = { "<cmd>GdbDebugStop<cr>", "Exit GDB"},
  },
  C = {
    name = "ChatGPT",
    c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
    e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
  },
}

which_key.setup(setup)
which_key.register(mappings, opts)
