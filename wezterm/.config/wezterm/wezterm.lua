local wt = require("wezterm")

local config = wt.config_builder()

local modules = {
	"ui",
	"keys",
	"mouse",
	"status",
	"balance",
}

config.front_end = "OpenGL"
config.ssh_backend = "Ssh2"
config.quit_when_all_windows_are_closed = false
config.scrollback_lines = 10000

config.set_environment_variables = {
	PATH = "/opt/homebrew/bin:" .. os.getenv("PATH"),
}

for _, name in ipairs(modules) do
	local module = require(name)
	module.apply(config)
end

return config
