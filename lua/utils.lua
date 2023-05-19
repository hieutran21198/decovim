local function combine_plugins(sources_handler)
	local plugins = {}

	local sources = sources_handler()

	for _, source in pairs(sources) do
		for _, plugin in ipairs(source) do
			table.insert(plugins, plugin)
		end
	end

	return plugins
end

return {
	combine_plugins = combine_plugins,
}
