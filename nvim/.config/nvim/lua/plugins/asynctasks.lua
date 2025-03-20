return {
  "skywind3000/asynctasks.vim",
  init = function()
    vim.g.asynctasks_extra_config = {
      "~/github/my_dotfiles/my_tasks.ini",
    }
    vim.g["asynctasks_config_name"] = "tasks.ini"
  end,
}
