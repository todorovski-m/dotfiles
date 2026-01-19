local function split_beamer_frame()
  local buf = vim.api.nvim_get_current_buf()
  local cur = vim.api.nvim_win_get_cursor(0)
  local cur_line = cur[1] - 1 -- 0-based

  -- search backwards for \begin{frame}
  local begin_line = vim.fn.search("^\\\\begin{frame", "bnW")
  if begin_line == 0 then
    vim.notify("No \\begin{frame found above cursor", vim.log.levels.ERROR)
    return
  end

  local frame_def = vim.api.nvim_buf_get_lines(buf, begin_line - 1, begin_line, false)[1]

  -- build insertion block
  local lines = {
    "\\end{frame}",
    "",
    "",
    frame_def,
  }

  vim.api.nvim_buf_set_lines(buf, cur_line, cur_line, false, lines)

  -- place cursor nicely after new \begin{frame}
  vim.api.nvim_win_set_cursor(0, { cur_line + 5, 0 })
end

vim.keymap.set("n", "<leader>ts", split_beamer_frame, { desc = "Split Beamer frame at cursor" })

local wk = require("which-key")
wk.add({
  { "<leader>t", group = "Beamer / LaTeX" },
})
