-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.cmd([[

augroup filetype_tex
    autocmd FileType tex nnoremap <buffer> <silent> <F3> :VimtexTocToggle<CR>
    autocmd FileType tex nnoremap <buffer> <silent> <F6> :VimtexView<CR>
"   skip spell checks in comments
    autocmd BufEnter *.tex syntax match Comment /%[^"]\+$/ contains=@NoSpell
augroup end

]])

if vim.fn.has("macunix") == 1 then
  vim.cmd([[
        autocmd FileType python exe 'silent! compiler pyunit'
    ]])
end
