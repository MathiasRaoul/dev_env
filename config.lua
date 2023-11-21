
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "onedarker"

lvim.leader = "space"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<TAB>"] = ":bnext<cr>"
lvim.keys.normal_mode["<S-TAB>"] = ":bprev<cr>"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

lvim.plugins = {
  {"mfussenegger/nvim-dap-python"},

 {'jameshiew/nvim-magic',
    config = function()
		  require('nvim-magic').setup()
	  end,
	  dependencies = {
  		'nvim-lua/plenary.nvim',
		  'MunifTanjim/nui.nvim'
	  }
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-neotest/neotest-python"
    }
  }
}

-- Python debug configuration
local dap = require('dap')
dap.configurations.python = {
  {
   type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
   request = 'launch';
   name = "exec args";
   justMyCode = false;
   program = "${file}"; -- This configuration will launch the current file if used.
    args = { '' }
  },
}
require('dap-python').setup('~/venvs/debugpy/bin/python')

-- Unit tests, pytest config
require("neotest").setup({
  adapters = {
    require("neotest-python")({
        dap = { justMyCode = false },
        args = {"--log-level", "DEBUG"},
        runner = "pytest",
        python = "/usr/bin/python3.11"
    })
  }
})

-- Neotest key mappings
lvim.builtin.which_key.mappings["n"] = {
  name = "Neotest",
  a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
  f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run File" },
  F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Debug File" },
  l = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last" },
  L = { "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", "Debug Last" },
  n = { "<cmd>lua require('neotest').run.run()<cr>", "Run Nearest" },
  N = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Nearest" },
  o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Output" },
  S = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
  s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
}

lvim.builtin.which_key.mappings["S"]= {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

-- Open float window
lvim.builtin.which_key.mappings["lE"] = {
  "<cmd>lua vim.diagnostic.open_float(nil, {focus=false}) <cr>", "Open float window"
}
