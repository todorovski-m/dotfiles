function RunMaster()
    local dirname = vim.fn.expand("%:p:h")
    local command = "call VimuxRunCommand('cd " .. dirname .. "')"
    vim.cmd(command)
    command = "call VimuxRunCommand('master')"
    vim.cmd(command)
end

function RunCurrent()
    local filename = vim.fn.expand("%:r")
    local dirname = vim.fn.expand("%:p:h")
    local command = "call VimuxRunCommand('cd " .. dirname .. "')"
    vim.cmd(command)
    command = "call VimuxRunCommand('" .. filename .. "')"
    vim.cmd(command)
end

-- run files
vim.cmd [[
augroup filetype_py
    autocmd FileType python nnoremap <buffer> <silent> <F5> :update<CR> :TerminatorRunFileInOutputBuffer<CR>
    autocmd FileType python inoremap <buffer> <silent> <F5> <Esc>:update<CR> :TerminatorRunFileInOutputBuffer<CR>
augroup end

augroup filetype_sh
    autocmd FileType sh nnoremap <buffer> <silent> <F5> :! bash %<CR>
    autocmd FileType sh inoremap <buffer> <silent> <F5> <Esc>:! bash %<CR>
augroup end

augroup filetype_tex
    autocmd FileType tex nnoremap <buffer> <silent> <F3> :VimtexTocToggle<CR>
    autocmd FileType tex nnoremap <buffer> <silent> <F5> :VimtexCompile<CR>
    autocmd FileType tex nnoremap <buffer> <silent> <F6> :VimtexView<CR>
"   skip spell checks in comments
    autocmd BufEnter *.tex syntax match Comment /%[^"]\+$/ contains=@NoSpell
"   skip spell checks in in matpower case files
    autocmd BufEnter *.tex syntax match Matpower /case\d\+[^ ]\+/ contains=@NoSpell
augroup end

augroup filetype_m
"   autocmd FileType matlab nnoremap <buffer> <silent> <F5> :update<CR> :TerminatorRunFileInOutputBuffer<CR>
    autocmd FileType matlab nnoremap <buffer> <silent> <F5> :update<CR> :execute 'lua RunCurrent()'<CR>
    autocmd FileType matlab nnoremap <buffer> <silent> <F6> :update<CR> :execute 'lua RunMaster()'<CR>
augroup end

augroup filetype_for
    autocmd FileType fortran nnoremap <buffer> <silent> <F5> :update<CR> :TerminatorRunFileInOutputBuffer<CR>
    autocmd FileType fortran inoremap <buffer> <silent> <F5> <Esc>:update<CR> :TerminatorRunFileInOutputBuffer<CR>
augroup end

augroup filetype_gpl
    autocmd FileType gnuplot nnoremap <buffer> <silent> <F5> :update<CR> :TerminatorRunFileInOutputBuffer<CR>
    autocmd FileType gnuplot inoremap <buffer> <silent> <F5> <Esc>:update<CR> :TerminatorRunFileInOutputBuffer<CR>
augroup end

augroup filetype_lua
    autocmd FileType lua nnoremap <buffer> <silent> <F5> :update<CR> :luafile %<CR>
augroup end
]]

vim.cmd [[
autocmd BufRead,BufNewFile *.plt set filetype=gnuplot
]]

vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
]]

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
