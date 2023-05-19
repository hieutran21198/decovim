local binding_handler = function(client, bufnr, binding_extracters)
	local whichkey = require("which-key")

	if binding_extracters == nil then
		return
	end

	for _, binding_extracter in pairs(binding_extracters) do
		local binding_group = binding_extracter(client, bufnr)
		for _, group in pairs(binding_group) do
			whichkey.register(group.mappings, group.opts)
		end
	end
end

return function(client, bufnr)
	local binding_handlers = require("keymappings.on_attach")

	-- for all language server.
	binding_handler(client, bufnr, binding_handlers["*"])
	-- for specific language server.
	binding_handler(client, bufnr, binding_handlers[client.name])
end
