local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
-- keymap("", "<Space>", "<Nop>", opts)
-- vim.g.mapleader = " "
-- vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --

-- Number up and down
keymap("n", "g=", "<C-a>", opts)
keymap("n", "g-", "<C-x>", opts)

-- Better window navigation
keymap("n", "<C-Left>", ":wincmd h<CR>", opts)
keymap("n", "<C-Right>", ":wincmd l<CR>", opts)
keymap("n", "<C-Down>", ":wincmd j<CR>", opts)
keymap("n", "<C-Up>", ":wincmd k<CR>", opts)

-- Resize with arrows
keymap("n", "<S-Up>", ":resize -2<CR>", opts)
keymap("n", "<S-Down>", ":resize +2<CR>", opts)
keymap("n", "<S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<S-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<Tab>", ":bnext<CR>", opts)

-- Close windows and tabs
keymap("n", "<C-q>", ":wincmd q<CR>", opts)
keymap("n", "<F4>", ":bdelete<CR>", opts)

-- Leave only current window
keymap("n", "<C-F4>", ":only<CR>", opts)

-- Move text up and down
-- https://vim.fandom.com/wiki/Moving_lines_up_or_down
keymap("n", "<M-Down>", ":m .+1<CR>==", opts)
keymap("n", "<M-Up>", ":m .-2<CR>==", opts)
keymap("v", "<M-Down>", ":m '>+1<CR>gv=gv", opts)
keymap("v", "<M-Up>", ":m '<-2<CR>gv=gv", opts)

-- Remove highlight of search pattern
keymap("n", "'", ":noh<CR>:<backspace>", opts)

-- Undo tree
keymap("n", "<C-Y>", ":UndotreeToggle<CR>", opts)

-- Repeat a command-line command
keymap("n", "<C-P>", "@:m<CR>", opts)

-- Telescope keymaps
--keymap("n", "<C-o>", ":Telescope find_files<CR>", opts)
keymap("n", "<C-f>", ":Telescope current_buffer_fuzzy_find<CR>", opts)
keymap("n", "<C-b>", ":Telescope buffers<CR>", opts)
keymap("n", "<C-g>", ":Telescope grep_string<CR>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Toggle comment with NERDCommenter
vim.g["NERDCustomDelimiters"] = {
	python = { left = "#" },
}
vim.g["NERDSpaceDelims"] = 1 -- add spaces after comment delimiters
vim.cmd("map <C-/> <leader>c<space>")
-- for some reason, vim registers <C-/> as <C-_> (this is in tmux also)
vim.cmd("map <C-_> <leader>c<space>")

-- Save file
if jit.os == "OSX" then
	keymap("n", "<D-s>", ":update<CR>", opts)
	keymap("i", "<D-s>", "<Esc>:update<CR>i", opts)
	keymap("v", "<D-s>", "<Esc>:update<CR>v", opts)
else
	keymap("n", "<C-s>", ":update<CR>", opts)
	keymap("i", "<C-s>", "<Esc>:update<CR>i", opts)
	keymap("v", "<C-s>", "<Esc>:update<CR>v", opts)
end

-- Wrap visual selection
keymap("n", "<M-q>", "gw", opts)
keymap("i", "<M-q>", "gw", opts)
keymap("v", "<M-q>", "gw", opts)

-- Duplicate the current line
if jit.os == "OSX" then
	keymap("n", "<D-d>", ":.t.<CR>", opts)
else
	keymap("n", "<M-d>", ":.t.<CR>", opts)
end

-- Start interactive EasyAlign in visual mode (e.g. vipga)
keymap("x", "ga", "<Plug>(EasyAlign)", opts)
-- Start interactive EasyAlign for a motion/text object (e.g. gaip)
keymap("n", "ga", "<Plug>(EasyAlign)", opts)

-- Better vertical movements (center the view after certain movement)
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)

-- Replace integers with increment
vim.cmd([[
function! ReplaceIncrement()
    :let i=0 | '<,'>s/\d\+/\=i.execute('let i+=1')/g
    :noh
endfunction
]])
keymap("v", "<C-i>", ":call ReplaceIncrement()<CR>", opts)
