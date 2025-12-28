-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")

local function keymap(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Number up and down
keymap("n", "g=", "<C-a>", { desc = "Increment number" })
keymap("n", "g-", "<C-x>", { desc = "Decrement number" })

-- Navigate windows with arrows
keymap("n", "<C-Left>", ":wincmd h<CR>")
keymap("n", "<C-Right>", ":wincmd l<CR>")
keymap("n", "<C-Down>", ":wincmd j<CR>")
keymap("n", "<C-Up>", ":wincmd k<CR>")

-- Resize windows with arrows
keymap("n", "<S-Up>", ":resize -2<CR>")
keymap("n", "<S-Down>", ":resize +2<CR>")
keymap("n", "<S-Left>", ":vertical resize -2<CR>")
keymap("n", "<S-Right>", ":vertical resize +2<CR>")

-- Navigate buffers
keymap("n", "<S-Tab>", ":bprevious<CR>")
keymap("n", "<Tab>", ":bnext<CR>")

-- Delete bufffer
keymap("n", "<F4>", ":bdelete<CR>")

-- Leave only current window
keymap("n", "<C-F4>", ":only<CR>")

-- Move text up and down
-- https://vim.fandom.com/wiki/Moving_lines_up_or_down
keymap("n", "<M-Down>", ":m .+1<CR>==")
keymap("n", "<M-Up>", ":m .-2<CR>==")
keymap("v", "<M-Down>", ":m '>+1<CR>gv=gv")
keymap("v", "<M-Up>", ":m '<-2<CR>gv=gv")

-- Remove highlight of search pattern
keymap("n", "'", ":noh<CR>:<backspace>")

-- Repeat a command-line command
keymap("n", "<C-P>", "@:m<CR>")

-- Telescope keymaps
keymap("n", "<C-o>", ":Telescope find_files<CR>")
keymap("n", "<C-f>", ":Telescope current_buffer_fuzzy_find<CR>")
keymap("n", "<C-b>", ":Telescope buffers<CR>")
keymap("n", "<C-g>", ":Telescope grep_string<CR>")

-- Stay in indent mode
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Toggle comment
if vim.fn.has("macunix") == 1 then
  vim.cmd("map <D-/> gcc")
else
  vim.cmd("map <C-/> gcc")
end

-- Save file
if jit.os == "OSX" then
  keymap("n", "<D-s>", ":update<CR>")
  keymap("i", "<D-s>", "<Esc>:update<CR>i")
  keymap("v", "<D-s>", "<Esc>:update<CR>v")
else
  keymap("n", "<M-s>", ":update<CR>")
  keymap("i", "<M-s>", "<Esc>:update<CR>i")
  keymap("v", "<M-s>", "<Esc>:update<CR>v")
end

-- Duplicate the current line
if jit.os == "OSX" then
  keymap("n", "<D-d>", ":.t.<CR>")
else
  keymap("n", "<M-d>", ":.t.<CR>")
end

-- Start EasyAlign
keymap("x", "ga", "<Plug>(EasyAlign)", { desc = "Easy Align" })

-- Better vertical movements (center the view after certain movement)
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzz")
keymap("n", "N", "Nzz")

-- Spell suggestions
keymap("n", "<F7>", ":Telescope spell_suggest<CR>")

-- ChatGPT
wk.add({
  { "<leader>C", group = "ChatGPT" },
  { "<leader>Cc", "<cmd>ChatGPT<CR>", desc = "ChatGPT" },
  { "<leader>Ce", "<cmd>ChatGPTEditWithInstruction<CR>", desc = "Edit with instruction", mode = { "n", "v" } },
})

-- Run files
keymap("n", "<F5>", ":AsyncTask file-run<CR>")
keymap("n", "<F6>", ":AsyncTask pytest<CR>")

-- global marks
-- local function keymap(mode, lhs, rhs, opts)
local prefixes = "m'"
local letters = "abcdefghijklmnopqrstuvwxyz"
for i = 1, #prefixes do
  local prefix = prefixes:sub(i, i)
  for j = 1, #letters do
    local lower_letter = letters:sub(j, j)
    local upper_letter = string.upper(lower_letter)
    keymap("n", prefix .. lower_letter, prefix .. upper_letter, { desc = "Mark " .. upper_letter })
  end
end
