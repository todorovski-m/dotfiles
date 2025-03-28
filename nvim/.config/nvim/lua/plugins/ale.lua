-- Syntax checking (needed for fortran)
return {
  "dense-analysis/ale",
  config = function()
    -- Configuration goes here.
    if vim.fn.has("macunix") == 1 then
      vim.g["ale_fortran_gcc_executable"] = "/opt/homebrew/bin/gcc-14"
    else
      vim.g["ale_fortran_gcc_executable"] = "gcc"
    end

    vim.g["ale_fixers"] = {
      ["*"] = { "remove_trailing_lines", "trim_whitespace" },
    }

    vim.g["ale_virtualtext_cursor"] = 1
    --vim.g["ale_echo_msg_error_str"] = 'E'
    --vim.g["ale_echo_msg_warning_str"] = 'W'
    vim.g["ale_echo_msg_format"] = "[%linter%] %s [%severity%]"
    vim.g["ale_set_highlights"] = 1

    --vim.g["ale_sign_column_always"] = 1
    vim.g["ale_sign_error"] = ""
    vim.g["ale_sign_warning"] = ""

    vim.g["ale_fix_on_save"] = 1
  end,
}
