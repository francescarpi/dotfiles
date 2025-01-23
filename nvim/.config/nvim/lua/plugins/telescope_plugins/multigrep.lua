local conf = require("telescope.config").values
local finders = require("telescope.finders")
local make_entry = require("telescope.make_entry")
local pickers = require("telescope.pickers")

return function(opts)
  opts = opts or {}
  opts.cwd = opts.cwd and vim.fn.expand(opts.cwd) or vim.loop.cwd()
  opts.pattern = opts.pattern or "%s"

  local custom_grep = finders.new_async_job({
    command_generator = function(prompt)
      if not prompt or prompt == "" then
        return nil
      end

      local prompt_split = vim.split(prompt, "  ")

      local args = { "rg" }
      if prompt_split[1] then
        table.insert(args, "-e")
        table.insert(args, prompt_split[1])
      end

      if prompt_split[2] then
        table.insert(args, "-g")
        table.insert(args, string.format(opts.pattern, prompt_split[2]))
      end

      table.insert(args, "--color=never")
      table.insert(args, "--no-heading")
      table.insert(args, "--with-filename")
      table.insert(args, "--line-number")
      table.insert(args, "--column")
      table.insert(args, "--smart-case")

      local command = vim.iter({ args }):flatten():totable()
      return command
    end,
    entry_maker = make_entry.gen_from_vimgrep(opts),
    cwd = opts.cwd,
  })

  pickers
    .new(opts, {
      debounce = 100,
      prompt_title = "Live Grep",
      finder = custom_grep,
      previewer = conf.grep_previewer(opts),
      sorter = require("telescope.sorters").empty(),
    })
    :find()
end
