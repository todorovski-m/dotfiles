-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- run files
vim.cmd([[
augroup filetype_py
    autocmd FileType python nnoremap <buffer> <silent> <F5> :update<CR> :TerminatorRunFileInOutputBuffer<CR>
    autocmd FileType python inoremap <buffer> <silent> <F5> <Esc>:update<CR> :TerminatorRunFileInOutputBuffer<CR>
    autocmd FileType python nnoremap <buffer> <silent> <F6> :update<CR> :AsyncTask file-run<CR>
    autocmd FileType python inoremap <buffer> <silent> <F6> <Esc>:update<CR> :AsyncTask file-run<CR>
augroup end

augroup filetype_sh
    autocmd FileType sh nnoremap <buffer> <silent> <F5> :update<CR> :! bash %<CR>
    autocmd FileType sh inoremap <buffer> <silent> <F5> :update<CR> <Esc>:! bash %<CR>
augroup end

augroup filetype_tex
    autocmd FileType tex nnoremap <buffer> <silent> <F3> :VimtexTocToggle<CR>
    autocmd FileType tex nnoremap <buffer> <silent> <F5> :VimtexCompile<CR>
    autocmd FileType tex nnoremap <buffer> <silent> <F6> :VimtexView<CR>
"   skip spell checks in comments
    autocmd BufEnter *.tex syntax match Comment /%[^"]\+$/ contains=@NoSpell
augroup end

augroup filetype_for
    autocmd FileType fortran nnoremap <buffer> <silent> <F5> :update<CR> :TerminatorRunFileInOutputBuffer<CR>
    autocmd FileType fortran inoremap <buffer> <silent> <F5> <Esc>:update<CR> :TerminatorRunFileInOutputBuffer<CR>
augroup end

augroup filetype_lua
    autocmd FileType lua nnoremap <buffer> <silent> <F5> :update<CR> :luafile %<CR>
augroup end

augroup filetype_gpl
    autocmd FileType gnuplot nnoremap <buffer> <silent> <F5> :update<CR> :TerminatorRunFileInOutputBuffer<CR>
    autocmd FileType gnuplot inoremap <buffer> <silent> <F5> <Esc>:update<CR> :TerminatorRunFileInOutputBuffer<CR>
augroup end
]])

if vim.fn.has("macunix") == 1 then
  vim.cmd([[
        autocmd FileType python exe 'silent! compiler pyunit'
    ]])
end
