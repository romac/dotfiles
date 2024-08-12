local function scheme_for_appearance(theme)
	local appearance = require("appearance")
	if appearance.is_dark() then
		return theme.dark
	else
		return theme.light
	end
end

local wt = require("wezterm")

local function apply(config)
	config.font = wt.font("JetBrains Mono")
	config.font_size = 14
	config.line_height = 1.2
	config.cell_width = 1.0

	config.color_scheme = scheme_for_appearance({
		dark = "Catppuccin Mocha",
		light = "Catppuccin Latte",
	})

	config.window_frame = {
		font = wt.font("JetBrains Mono"),
		font_size = 14,
	}

	config.use_fancy_tab_bar = false
	config.tab_bar_at_bottom = false
	config.enable_scroll_bar = true
	config.show_new_tab_button_in_tab_bar = false

	config.window_decorations = "RESIZE"
	config.window_padding = {
		left = "1cell",
		right = "1cell",
		top = 0,
		bottom = 0,
	}

	config.initial_cols = 400
	config.initial_rows = 400
end

return { apply = apply }
