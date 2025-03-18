local function init_asyncrun()
  vim.g["asyncrun_open"] = 10 -- quickfix window can be opened automatically
end

return {
  "skywind3000/asyncrun.vim",
  init = init_asyncrun(),
  ft = { "fortran", "python" },
}
