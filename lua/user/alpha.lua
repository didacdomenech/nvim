local M = {
  "goolord/alpha-nvim",
  event = "VimEnter",
  commit = "dafa11a6218c2296df044e00f88d9187222ba6b0",
}

function M.config()
  local alpha = require "alpha"
  local dashboard = require "alpha.themes.dashboard"
  dashboard.section.header.val = {
	  [[                                  __                     ]],
	  [[     ___     ___    ___   __  __ /\_\    ___ ___         ]],
	  [[    / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\       ]],
	  [[   /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \      ]],
	  [[   \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\     ]],
	  [[    \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/     ]],
    [[   ·                                                     ]],
    [[                 *     ,MMM8&&&.            *            ]],
    [[                      MMMM88&&&&&    .                   ]],
    [[                     MMMM88&&&&&&&                       ]],
    [[         *           MMM88&&&&&&&&                       ]],
    [[                     MMM88&&&&&&&&                       ]],
    [[                     'MMM88&&&&&&'                       ]],
    [[                       'MMM8&&&'      *                  ]],
    [[              |\___/|                                    ]],
    [[              )     (             .              '       ]],
    [[             =\     /=                                   ]],
    [[               )===(       *                             ]],
    [[              /     \                                    ]],
    [[              |     |                                    ]],
    [[             /       \                                   ]],
    [[             \       /                                   ]],
    [[      _/\_/\_/\__  _/_/\_/\_/\_/\_/\_/\_/\_/\_/\_        ]],
    [[      |  |  |  |( (  |  |  |  |  |  |  |  |  |  |        ]],
    [[      |  |  |  | ) ) |  |  |  |  |  |  |  |  |  |        ]],
    [[      |  |  |  |(_(  |  |  |  |  |  |  |  |  |  |        ]],
    [[      |  |  |  |  |  |  |  |  |  |  |  |  |  |  |        ]],
    [[      jgs|  |  |  |  |  |  |  |  |  |  |  |  |  |        ]],
  }
  dashboard.section.buttons.val = {
    dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
    dashboard.button("e", " " .. " New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("p", " " .. " Find project", ":lua require('telescope').extensions.projects.projects()<CR>"),
    dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
    dashboard.button("t", " " .. " Find text", ":Telescope live_grep <CR>"),
    dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
    dashboard.button("q", " " .. " Quit", ":qa<CR>"),
  }

  function os.capture(cmd, raw)
    local f = assert(io.popen(cmd, 'r'))
    local s = assert(f:read('*a'))
    f:close()
    if raw then return s end
    s = string.gsub(s, '^%s+', '')
    s = string.gsub(s, '%s+$', '')
    s = string.gsub(s, '[\n\r]+', ' ')
    return s
  end

  local function footer()
    return "welcome back " .. os.capture("whoami")
  end

  dashboard.section.footer.val = footer()

  dashboard.section.footer.opts.hl = "Type"
  dashboard.section.header.opts.hl = "Include"
  dashboard.section.buttons.opts.hl = "Keyword"

  dashboard.opts.opts.noautocmd = true
  alpha.setup(dashboard.opts)
end

return M
