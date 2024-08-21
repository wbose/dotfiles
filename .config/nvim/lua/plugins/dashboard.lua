return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  opts = function()
    local logo = [[
                                                                                                   
                                                                                                   
________                     ___                                  ____     ___                     
`MMMMMMMb.                    MM                       68b        `Mb(     )d' 68b                 
 MM    `Mb                    MM                       Y89         YM.     ,P  Y89                 
 MM     MM   ____ ____    ___ MM____     ____  ___  __ ___    ___  `Mb     d'  ___ ___  __    __   
 MM     MM  6MMMMb`MM(    )M' MMMMMMb   6MMMMb `MM 6MM `MM  6MMMMb  YM.   ,P   `MM `MM 6MMb  6MMb  
 MM    .M9 MM'    ``Mb    d'  MM'  `Mb 6M'  `Mb MM69 "  MM 8M'  `Mb `Mb   d'    MM  MM69 `MM69 `Mb 
 MMMMMMM9' YM.      YM.  ,P   MM    MM MM    MM MM'     MM     ,oMM  YM. ,P     MM  MM'   MM'   MM 
 MM         YMMMMb   MM  M    MM    MM MMMMMMMM MM      MM ,6MM9'MM  `Mb d'     MM  MM    MM    MM 
 MM             `Mb  `Mbd'    MM    MM MM       MM      MM MM'   MM   YM,P      MM  MM    MM    MM 
 MM        L    ,MM   YMP     MM.  ,M9 YM    d9 MM      MM MM.  ,MM   `MM'      MM  MM    MM    MM 
_MM_       MYMMMM9     M     _MYMMMM9   YMMMM9 _MM_    _MM_`YMMM9'Yb.  YP      _MM__MM_  _MM_  _MM_
                      d'                                                                           
                  (8),P                                                                            
                   YMM                                                                            

]]

    logo = string.rep("\n", 4) .. logo .. "\n\n"

    local opts = {
      theme = "doom",
      hide = {
        statusline = false,
      },
      config = {
        header = vim.split(logo, "\n"),
        center = {
          { action = "Telescope find_files", desc = " Find file", icon = " ", key = "f" },
          { action = "ene | startinsert", desc = " New file", icon = " ", key = "n" },
          { action = "Telescope oldfiles", desc = " Recent files", icon = " ", key = "r" },
          { action = "e $MYVIMRC", desc = " Config", icon = " ", key = "c" },
          { action = 'lua require("persistence").load()', desc = " Restore Session", icon = " ", key = "s" },
          { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
          { action = "qa", desc = " Quit", icon = " ", key = "q" },
        },
        footer = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          return { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
        end,
      },
    }

    for _, button in ipairs(opts.config.center) do
      button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
    end

    if vim.o.filetype == "lazy" then
      vim.cmd.close()
      vim.api.nvim_create_autocmd("User", {
        pattern = "DashboardLoaded",
        callback = function()
          require("lazy").show()
        end,
      })
    end

    return opts
  end,
}
