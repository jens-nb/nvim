local status_ok, mason_lspcfg = pcall(require, "mason-lspconfig")
	if not status_ok then
return
end

-- INFO: uses lspconfig server names
local my_servers = {
	"ansiblels",
	"bashls",
	"jsonls",
	"sumneko_lua",
	"gopls",
	"pyright",
	"yamlls"
}

mason_lspcfg.setup({
    ensure_installed = my_servers
})
