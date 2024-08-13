local wt = require("wezterm")

local function segments_for_right_status(window)
	return {
		window:active_workspace(),
		wt.strftime("%a %b %-d %H:%M"),
		wt.hostname(),
	}
end

local appearance = require("appearance")

local function update_status(window, _)
	local SOLID_LEFT_ARROW = wt.nerdfonts.pl_right_hard_divider
	local segments = segments_for_right_status(window)

	local color_scheme = window:effective_config().resolved_palette
	local bg = wt.color.parse(color_scheme.background)
	local fg = color_scheme.foreground

	local gradient_to, gradient_from = bg, bg
	local tabbar_bg = bg
	if appearance.is_dark() then
		gradient_from = bg:lighten(0.1)
		tabbar_bg = bg:darken(0.5)
	else
		gradient_from = bg:darken(0.2)
		tabbar_bg = bg:darken(0.05)
	end

	local gradient = wt.color.gradient(
		{
			orientation = "Horizontal",
			colors = { gradient_from, gradient_to },
		},
		#segments -- only gives us as many colours as we have segments.
	)

	local elements = {}

	for i, seg in ipairs(segments) do
		local is_first = i == 1

		if is_first then
			table.insert(elements, { Background = { Color = tabbar_bg } })
		end
		table.insert(elements, { Foreground = { Color = gradient[i] } })
		table.insert(elements, { Text = SOLID_LEFT_ARROW })

		table.insert(elements, { Foreground = { Color = fg } })
		table.insert(elements, { Background = { Color = gradient[i] } })
		table.insert(elements, { Text = " " .. seg .. " " })
	end

	window:set_right_status(wt.format(elements))
end

return {
	apply = function()
		wt.on("update-status", update_status)
	end,
}
