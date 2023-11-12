local function init_vimtex()
    vim.g["vimtex_view_method"] = "sioyek"

    -- Disable spell checking in comments in LaTeX files
    --vim.g["tex_comment_nospell"] = 1

    vim.g["vimtex_quickfix_mode"] = 2
    -- 0 The quickfix window is never opened/closed automatically.
    -- 1 The quickfix window is opened automatically when there are errors,
    --   and it becomes the active window.
    -- 2 The quickfix window is opened automatically when there are errors,
    --   but it does not become the active window.

    vim.g["vimtex_quickfix_autoclose_after_keystrokes"] = 0

    -- Disable custom warnings based on regexp
    vim.g["vimtex_quickfix_ignore_filters"] = {
        "Marginpar on page",
        "Underfull",
        "LaTeX Font Warning",
        "Overfull",
        "Fancyhdr",
    }

    vim.cmd [[
    augroup vimtex
        autocmd BufRead,BufNewFile *.tex setlocal textwidth=80
        autocmd BufRead,BufNewFile *.tex setlocal spell
        autocmd User VimtexEventQuit call vimtex#compiler#clean(0)
    augroup end
    ]]

    vim.g["tex_conceal"] = ""
    -- By default, g:tex_conceal is set to "admgs" to enable concealment
    -- for the following sets of characters:
    -- a = accents/ligatures
    -- b = bold and italic
    -- d = delimiters
    -- m = math symbols
    -- g = Greek
    -- s = superscripts/subscripts

    -- Tips and Tricks
    -- https://jdhao.github.io/2019/03/26/nvim_latex_write_preview/

    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_set_keymap
    keymap("v", "ti", "xi \\textit{}<Esc>P", opts)
    keymap("v", "tb", "xi \\textbf{}<Esc>P", opts)
    keymap("v", "tu", "xi \\underline{}<Esc>P", opts)
    keymap("v", "tr", "xi \\mathrm{}<Esc>PBhx", opts)
    keymap("n", "tr", "vxi \\mathrm{}<Esc>PBhx", opts)
    keymap("v", "tm", "xi \\mathbf{}<Esc>PBhx", opts)
    keymap("n", "tm", "vxi \\mathbf{}<Esc>PBhx", opts)
    keymap("n", "td", "O% TODO: ", opts)

    vim.g["tex_flavor"] = "latex"
    -- Fast folding
    -- https://github.com/Konfekt/FastFold
    vim.g["tex_fold_enabled"] = 1

    -- Dodaj zbor za delenje na slogovi
    vim.cmd [[
    function! AddToFile()
      let file = "/home/mirko/Dropbox/Mirko/vnms/vnms-latex/vnms-slogovi.tex"
      let current_word = expand("<cword>")
      silent exec "!sed -i '2i" . current_word . "' " . file
      echon "Додаден збор: " . current_word
    endfunction
    ]]
    keymap("n", "<C-a>", ":call AddToFile()<CR>", opts)

    -- Dodadi ja tekovnata datoteka vo vnms.tex
    vim.cmd [[
    function! SmeniTekovna()
      silent exec "exec \"!sed -i '12s/{.*}/{%}/' /home/mirko/Dropbox/Mirko/vnms/vnms-latex/vnms.tex\""
      echo @% . " --> vnms.tex"
    endfunction
    ]]
    keymap("n", "<C-t>", ":call SmeniTekovna()<CR>", opts)

    -- Otvori ja orginalnata tex datoteka za tekovnata pdf slika
    -- na primer ako kursorot e nad sliki/vodovi/ednofazen.pdf ke se otvori datotekata sliki/vodovi/ednofazen.tex
    vim.cmd [[
    function! OtvoriTexZaPdf()
      exec "normal! yi{"
      let datoteka = getreg("\"")
      let datoteka = substitute(datoteka, ".pdf", ".tex", "")
      exec ":e " . datoteka
    endfunction
    ]]
    keymap("n", "gt", ":call OtvoriTexZaPdf()<CR>", opts)

    -- g - global
    -- e - suppress errors
    vim.cmd [[
    function! SrediMatlabLatex()
        :s/\\mathrm{alpha}/\\alpha/ge
        :s/\\mathrm{beta}/\\beta/ge
        :s/\\mathrm{theta}/\\theta/ge
        :s/\\mathrm{log}/\\ln/ge
        :s/\\mathrm{phi}/\\varphi/ge
        :s/\\!/ /ge
        :s/\\,/ /ge
        :s/\\left(\\mathrm{\\alpha}\\right)/\\alpha/ge
        :noh
    endfunction
    ]]
    keymap("v", "tl", ":call SrediMatlabLatex()<CR>", opts)
end

return {
    "lervag/vimtex",
    init = init_vimtex,
}
