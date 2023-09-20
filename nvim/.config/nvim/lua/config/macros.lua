local status_ok, macros = pcall(require, "NeoComposer")
if not status_ok then
  return
end

local status_ok_1, tele_macros = pcall(require, "telescope")
if not status_ok_1 then
  return
end
tele_macros.load_extension("macros")

local config = {
  notify = true,
  delay_timer = 150,
  colors = {
    bg = "#16161e",
    fg = "#ff9e64",
    red = "#ec5f67",
    blue = "#5fb3b3",
    green = "#99c794",
  },
  keymaps = {
    play_macro = "Q",
    yank_macro = "yq",
    stop_macro = "cq",
    toggle_record = "q",
    cycle_next = "<c-n>",
    cycle_prev = "<c-p>",
    toggle_macro_menu = "<m-q>",
  },
}

macros.setup(config)
