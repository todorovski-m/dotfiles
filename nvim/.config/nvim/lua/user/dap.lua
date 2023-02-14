-- https://alpha2phi.medium.com/neovim-for-beginners-debugging-using-dap-44626a767f57
-- https://github.com/alpha2phi/neovim-for-beginner/tree/16-dap1

local ok_1, dap = pcall(require, "dap")
if not ok_1 then
    return
end

local ok_2, dapui = pcall(require, "dapui")
if not ok_2 then
    return
end

local ok_3, dap_python = pcall(require, "dap-python")
if not ok_3 then
    return
end

local ok_4, dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if not ok_4 then
    return
end

dapui.setup {} -- use default
--dap.listeners.after.event_initialized["dapui_config"] = function()
    --dapui.open()
--end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

dap_python.setup("~/anaconda3/bin/python")

local dap_breakpoint = {
    error = {
        text = "",
        texthl = "LspDiagnosticsSignError",
        linehl = "",
        numhl = "",
    },
    rejected = {
        text = "",
        texthl = "LspDiagnosticsSignHint",
        linehl = "",
        numhl = "",
    },
    stopped = {
        text = "⭐️",
        texthl = "LspDiagnosticsSignInformation",
        linehl = "DiagnosticUnderlineInfo",
        numhl = "LspDiagnosticsSignInformation",
    },
  }
vim.fn.sign_define("DapBreakpoint", dap_breakpoint.error)
vim.fn.sign_define("DapStopped", dap_breakpoint.stopped)
vim.fn.sign_define("DapBreakpointRejected", dap_breakpoint.rejected)

dap_virtual_text.setup {
    enabled = true,                        -- enable this plugin (the default)
    enabled_commands = true,               -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true,    -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,      -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,               -- show stop reason when stopped for exceptions
    commented = false,                     -- prefix virtual text with comment string
    only_first_definition = true,          -- only show virtual text at first definition (if there are multiple)
    all_references = false,                -- show virtual text on all all references of the variable (not only definitions)
    filter_references_pattern = '<module', -- filter references (not definitions) pattern when all_references is activated (Lua gmatch pattern, default filters out Python modules)
    -- experimental features:
    virt_text_pos = 'eol',                 -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false,                    -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                    -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil                -- position the virtual text at a fixed window column (starting from the first text column) ,
                                           -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}


-- C/C++/Rust (via lldb-vscode)
dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb-vscode", -- adjust as needed, must be absolute path
    name = "lldb"
}
dap.configurations.cpp = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.expand("%:p:h") .. "/" .. vim.fn.expand("%:r")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}
-- If you want to use this for Rust and C, add something like this:
dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
dap.configurations.fortran = dap.configurations.cpp
