local lualine_require = require("lualine_require")
local utils = require("lualine.utils")

local M = lualine_require.require("lualine.component"):extend()

local function mason_updates()
	local registry = require("mason-registry")
	registry.refresh()
	local installed_packages = registry.get_installed_package_names()
	local upgrades_available = false
	local packages_outdated = 0
	local function myCallback(success, _)
		if success then
			upgrades_available = true
			packages_outdated = packages_outdated + 1
		end
	end

	for _, pkg in pairs(installed_packages) do
		local p = registry.get_package(pkg)
		if p then
			p:check_new_version(myCallback)
		end
	end

	if upgrades_available then
		return packages_outdated
	else
		return 0
	end
end

local default_options = {
	icon = {
		"", -- f487
		color = utils.get_mode_color,
	},
	cond = function()
		return mason_updates() > 0
	end,
}

function M:init(options)
	M.super.init(self, options)
	self.options = vim.tbl_deep_extend("keep", self.options or {}, default_options)
	self:create_option_highlights()
end

function M:update_status()
	return tostring(mason_updates())
end

return M
