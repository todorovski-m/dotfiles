local options = {
    termguicolors = true,                    -- set term gui colors (most terminals support this)
    autoread = true,                         -- autoload changed files
    autochdir = true,                        -- automatically change the current directory as you change edited file
    backup = false,                          -- creates a backup file
    clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
    cmdheight = 1,                           -- more space in the neovim command line for displaying messages
    completeopt = { "menuone", "noselect" }, -- mostly just for cmp
    conceallevel = 0,                        -- so that `` is visible in markdown files
    fileencoding = "utf-8",                  -- the encoding written to a file
    hlsearch = true,                         -- highlight all matches on previous search pattern
    ignorecase = true,                       -- ignore case in search patterns
    mouse = "a",                             -- allow the mouse to be used in neovim
    pumheight = 10,                          -- pop up menu height
    showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
    showtabline = 4,                         -- always show tabs
    smartcase = true,                        -- smart case
    smartindent = true,                      -- make indenting smarter again
    splitbelow = true,                       -- force all horizontal splits to go below current window
    splitright = true,                       -- force all vertical splits to go to the right of current window
    swapfile = false,                        -- creates a swapfile
    timeoutlen = 500,                        -- time to wait for a mapped sequence to complete (in milliseconds)
    undofile = true,                         -- enable persistent undo
    undodir = vim.fn.expand("$HOME/.local/share/nvim/undo"),  -- directory for undo history
    updatetime = 300,                        -- faster completion (4000ms default)
    writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
    expandtab = true,                        -- convert tabs to spaces
    shiftwidth = 4,                          -- the number of spaces inserted for each indentation
    tabstop = 4,                             -- insert 4 spaces for a tab
    cursorline = true,                       -- highlight the current line
    number = true,                           -- set numbered lines
    relativenumber = true,                   -- set relative numbered lines
    numberwidth = 4,                         -- set number column width to 2 {default 4}
    signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
    wrap = true,                             -- wrap long lines
    textwidth = 80,                          -- wrap at 80 characters
    scrolloff = 4,                           -- is one of my fav
    sidescrolloff = 4,
    guifont = "monospace:h17",               -- the font used in graphical neovim applications
    list = true,
    listchars = {
      nbsp = "⎵",
      extends = "»",
      precedes = "«",
      tab = "  →",
      trail = "•",
      --eol = "⏎"
    }
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
    vim.opt[k] = v
end

vim.g["python3_host_prog"] = vim.fn.expand("$HOME/anaconda3/bin/python3")

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- If this is in the table options iminsert gets random value 0 or 1 (changes at each nvim start)
vim.opt.keymap = "macedonian" -- switch the layout with Ctrl-^ (insert mode) copy macedonian.vim to $VIMRUNTIME/keymap/
vim.opt.iminsert = 0  -- keymap is not effective
vim.opt.imsearch = -1 -- the value of 'iminsert' is used
