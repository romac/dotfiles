local wt = require("wezterm")

local config = wt.config_builder()

local modules = {
	"ui",
	"keys",
	"status",
}

config.set_environment_variables = {
	PATH = "/opt/homebrew/bin:" .. os.getenv("PATH"),
}

for _, name in ipairs(modules) do
	local module = require(name)
	module.apply(config)
end

return config
