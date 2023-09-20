-- Add /usr/local/MATLAB/R2016b/bin/glnxa64 to PATH in .zshrc to mling to work
vim.g["ale_linters"] = {
    python = {"~/anaconda3/bin/pylint"},
    tex = {"chktex"},
    matlab = {"mlint"}
}

vim.g["ale_fixers"] = {
    ["*"] = {"remove_trailing_lines", "trim_whitespace"},
    python = {"autopep8"}
}

vim.g["ale_virtualtext_cursor"] = 0
--vim.g["ale_echo_msg_error_str"] = 'E'
--vim.g["ale_echo_msg_warning_str"] = 'W'
vim.g["ale_echo_msg_format"] = '[%linter%] %s [%severity%]'
vim.g["ale_set_highlights"] = 1

--vim.g["ale_sign_column_always"] = 1
vim.g["ale_sign_error"] = ""
vim.g["ale_sign_warning"] = ""

vim.g["ale_fix_on_save"] = 1
