local impatient_ok, impatient = pcall(require, "impatient")
if impatient_ok then impatient.enable_profile() end

for _, source in ipairs {
  "core.utils",
  "core.options",
  "core.bootstrap",
  "core.plugins",
  "core.autocmds",
  "core.mappings",
  "configs.which-key-register",
} do
  local status_ok, fault = pcall(require, source)
  if not status_ok then vim.api.nvim_err_writeln("Failed to load " .. source .. "\n\n" .. fault) end
end

astronvim.conditional_func(astronvim.user_plugin_opts("polish", nil, false))

require'lspconfig'.clangd.setup{
  cmd = { '/n/w1-knguyen/clangd/clangd/clangd13/install/bin/clangd', '-j=3', '--background-index', '--clang-tidy', '--completion-style=detailed', '--header-insertion=never', '--header-insertion-decorators=0' }
}

local group = vim.api.nvim_create_augroup("jump_last_position", { clear = true })
vim.api.nvim_create_autocmd(
	"BufReadPost",
	{callback = function()
			local row, col = unpack(vim.api.nvim_buf_get_mark(0, "\""))
			if {row, col} ~= {0, 0} then
				vim.api.nvim_win_set_cursor(0, {row, 0})
			end
		end,
	group = group
	}
)

local options = { noremap = true }
vim.api.nvim_set_keymap("n", "<C-e>", "5<C-e>", options)
vim.api.nvim_set_keymap("n", "<C-y>", "5<C-y>", options)
