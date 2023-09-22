return {
  'nvim-orgmode/orgmode',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter', lazy = true },
  },
  ft = {'org'},
  config = function()
    -- Load treesitter grammar for org
    require('orgmode').setup_ts_grammar()

    -- Setup treesitter
    require('nvim-treesitter.configs').setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'org' },
      },
      ensure_installed = { 'org' },
    })

    -- Setup orgmode
    require('orgmode').setup({
        org_agenda_files = {'~/Dropbox/Mirko/org/*'},
        org_default_notes_file = '~/Dropbox/Mirko/org/refile.org',
        org_tags_column = -80,
        org_todo_keywords = {'TODO(t)', 'WAITING(w)', '|', 'DONE(d)', 'DELEGATED(g)', 'CANCELLED(c)'},
        org_todo_keyword_faces = {
            TODO = ':foreground #FF4500 :weight bold', -- overrides builtin color for `TODO` keyword
            WAITING = ':foreground #FF4500 :weight bold',
            DONE = ':foreground #8FBC8F :weight bold',
            DELEGATED = ':foreground #8FBC8F :slant italic :underline on',
            CANCELLED = ':foreground #C71585 :slant italic :underline on',
        },
        win_split_mode = 'vsplit',
        mappings = {
            global = {
                org_agenda = 'gA',
                org_capture = 'gC'
            }
        }
    })
  end,
}
