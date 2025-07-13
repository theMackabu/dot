local dashboard_config_1 = {
  preset = {
   -- stylua: ignore
   ---@type snacks.dashboard.Item[]
    keys = {
      { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
      { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
      { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
      { icon = " ", key = "e", desc = "File Explorer", action = ":Neotree<CR>" },
      { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
      { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
      { icon = " ", key = "s", desc = "Restore Session", section = "session" },
      { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
      { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
      { icon = " ", key = "q", desc = "Quit", action = ":qa" },
    },
  },
  sections = {
    {
      section = "terminal",
      -- lolcat -F 0.2 ~/.config/nvim/static/neovim.cat
      cmd = "cat ~/.config/nvim/static/neovim.lolcat",
      indent = -5,
      height = 8,
      width = 73,
      padding = 3,
    },
    { section = 'keys', padding = 2 },
    {
      section = 'terminal',
      icon = ' ',
      title = 'Git Status',
      enabled = function()
        return Snacks.git.get_root() ~= nil
      end,
      cmd = 'git --no-pager diff --stat -B -M -C',
      height = 8,
      padding = 2,
      ttl = 5 * 60,
      indent = 2,
    }, 
    { section = "startup" },
  },
}

local dashboard_config_2 = {
    enabled = true,
    width = 18,
    sections = {
        -- stylua: ignore start
        { hidden = true, icon = " ", key = "t", desc = "Find [T]ext", action = ":lua Snacks.dashboard.pick('live_grep')" },
        { hidden = true, icon = " ", key = "r", desc = "[R]ecent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
        { hidden = true, icon = "󰒲 ", key = "l", desc = "[L]azy", action = ":Lazy" },
        -- stylua: ignore end

        -- Header
        { text = " ", padding = 12 },
        {
            padding = 2,
            text = {
                { "Neovim :: M Λ C K ", hl = "Normal" },
                { "- Editing made simple", hl = "NonText" },
            },
            action = ":lua Snacks.dashboard.pick('files')",
            key = "f",
        },

        -- Keys
        {
            padding = 1,
            text = {
                { "  Find [F]ile", width = 19, hl = "NonText" },
                { "  Find [T]ext", hl = "NonText" },
            },
            action = ":lua Snacks.dashboard.pick('files')",
            key = "f",
        },
        {
            padding = 1,
            text = {
                { " ", width = 3 },
                { "  [N]ew File", width = 19, hl = "NonText" },
                { "  [R]ecent File", hl = "NonText" },
            },
            action = ":ene | startinsert",
            key = "n",
        },
        {
            padding = 2,
            text = {
                { " ", width = 9 },
                { "  [C]onfig", hl = "NonText" },
                { " ", width = 8 },
                { "󰒲  [L]azy", hl = "NonText" },
                { " ", width = 14 },
            },
            action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            key = "c",
        },
        {
            padding = 2,
            text = {
                { " ", width = 5 },
                { "  [Q]uit", hl = "NonText" },
            },
            action = ":quitall",
            key = "q",
        },

        --  Startup
        { section = "startup", padding = 1 },
        { section = "terminal", cmd = "printf ' '", height = 15 },

        -- Keys
        {
            text = {
                [[
Copyright (c) 2025 - M Λ C K
            ]],

                hl = "NonText",
            },
        },
    },

    formats = { key = { "" } },
}

return {
  "snacks.nvim",
  opts = function()
    math.randomseed(os.time())
    return {
      dashboard = (math.random(5) == 1) and dashboard_config_2 or dashboard_config_1
    }
  end,
}