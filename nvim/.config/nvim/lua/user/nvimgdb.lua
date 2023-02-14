vim.cmd [[

function! StartGDB()
    exec ":GdbStart gdb -q " . expand("%:p:h") . "/" . expand("%:r")
    sleep 500m
    exec "wincmd h"
    exec "stopinsert"
endfunction

nnoremap <silent> <F6> :call StartGDB()<CR>
nnoremap <silent> <C-F6> :GdbRun<CR>

]]

vim.g["nvimgdb_config_override"] = {
    key_finish = "<F4>",
    key_continue = "<F6>",
    key_until = "<F7>",
    key_breakpoint = "<F8>",
    key_eval = "<F9>",
    key_next = "<F10>",
    key_step = "<F11>",
    key_quit = "<F12>",
    key_frameup = "<C-p>",
    key_framedown = "<C-n>",
    termwin_command = "belowright vnew",
    codewin_command = "vnew",
}
