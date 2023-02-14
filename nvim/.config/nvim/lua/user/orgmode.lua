local ok_1, orgmode = pcall(require, "orgmode")
if not ok_1 then
  return
end

-- Enable link concealing
--vim.opt.conceallevel = 2
--vim.opt.concealcursor = "nc"

-- Load custom tree-sitter grammar for org filetype
orgmode.setup_ts_grammar()

-- Settings
orgmode.setup({
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


-- Tree-sitter configuration
local ok_2, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok_2 then
  return
end

treesitter.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

local ok_3, bullets = pcall(require, "org-bullets")
if not ok_3 then
  return
end
--bullets.setup()
bullets.setup {
    concealcursor = true, -- If false then when the cursor is on a line underlying characters are visible
    symbols = {
      headlines = { "◉", "○", "✸", "✿" },
      checkboxes = {
        cancelled = { "", "OrgCancelled" },
        done = { "✓", "OrgDone" },
        todo = { "˟", "OrgTODO" },
      }
    }
}
