local kbd_layout = function()
  if vim.o.keymap == "macedonian" then
    local kbd = "MK"
    if vim.o.iminsert == 0 then
      kbd = "EN"
    end
    return kbd
  else
    return ""
  end
end

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  -- opts will be merged with the parent spec
  opts = {
    sections = {
      lualine_a = { "mode", kbd_layout },
      lualine_x = { spaces, "encoding", { "filetype", icons_enabled = false, icon = nil } },
    },
  },
}
