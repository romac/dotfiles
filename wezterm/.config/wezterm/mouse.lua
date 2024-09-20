local wt = require("wezterm")

local module = {}

function module.apply(config)
	config.mouse_bindings = {
		-- Change the default click behavior so that it only selects
		-- text and doesn't open hyperlinks
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "NONE",
			action = wt.action.CompleteSelection("ClipboardAndPrimarySelection"),
		},

		-- and make CMD-Click open hyperlinks
		{
			event = { Up = { streak = 1, button = "Left" } },
			mods = "SUPER",
			action = wt.action.OpenLinkAtMouseCursor,
		},
	}
end

wt.on("open-uri", function(_window, _pane, _uri) end)

return module
