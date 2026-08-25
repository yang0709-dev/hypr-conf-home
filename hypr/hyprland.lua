--------------------------------------------------------------------------------
-- Animation Curves (Bezier)
--------------------------------------------------------------------------------

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })
hl.curve("easeOutExpo", { type = "bezier", points = { { 0.16, 1 }, { 0.3, 1 } } })

--------------------------------------------------------------------------------
-- Animation Rules
--------------------------------------------------------------------------------

hl.animation({ leaf = "windows", enabled = true, speed = 5, bezier = "myBezier" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 5, bezier = "default", style = "popin 60%" })
hl.animation({ leaf = "border", enabled = false, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = false, speed = 3, bezier = "easeOutExpo", style = "fade" })

------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
	output = "",
	mode = "preferred",
	position = "auto",
	scale = "auto",
})

---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal = "ghostty"
local fileManager = "dolphin"
local menu = "hyprlauncher"

-------------------
---- AUTOSTART ----
-------------------

local home = os.getenv("HOME")
-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
hl.on("hyprland.start", function()
	-- local home = os.getenv("HOME")
	hl.exec_cmd(home .. "/.config/waybar/scripts/launch.sh")
	-- hl.exec_cmd("swaync")
	-- hl.exec_cmd("hyprlock")
	hl.exec_cmd("awww-daemon &")
	hl.exec_cmd("hyprpm reload")
	hl.exec_cmd("sleep 1 && bash /usr/local/bin/rotate.sh")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------
hl.env("XCUROSR_THEME", "Breeze_Light")
hl.env("XCURSOR_SIZE", "42")
hl.env("HYPRCURSOR_SIZE", "40")

-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/

hl.config({
	ecosystem = {
		enforce_permissions = true,
	},
})

hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
	general = {
		gaps_in = 3,
		gaps_out = 5,

		border_size = 2,

		col = {
			active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
			inactive_border = "rgba(595959aa)",
		},

		-- Set to true to enable resizing windows by clicking and dragging on borders and gaps
		resize_on_border = false,

		-- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
		allow_tearing = false,

		layout = "dwindle",
	},

	decoration = {
		-- rounding = 10,
		-- rounding_power = 2,
		-- Change transparency of focused and unfocused windows
		active_opacity = 0.8,
		inactive_opacity = 0.6,

		shadow = {
			enabled = false,
			range = 15,
			render_power = 5,
			color = 0xee1a1a1a,
		},
		blur = {
			enabled = true,
			size = 3,
			passes = 4,
			vibrancy = 0.1596,
		},
	},

	animations = {
		enabled = true,
	},
})

hl.config({
	dwindle = {
		preserve_split = true, -- You probably want this
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
hl.config({
	master = {
		new_status = "master",
	},
})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
	scrolling = {
		fullscreen_on_one_column = true,
	},
})

----------------
----  MISC  ----
----------------

hl.config({
	misc = {
		force_default_wallpaper = -1, -- Set to 0 or 1 to disable the anime mascot wallpapers
		disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
	},
})

---------------
---- INPUT ----
---------------

hl.config({
	input = {
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		kb_options = "",
		kb_rules = "",
		follow_mouse = 1,
		sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
		touchpad = {
			natural_scroll = false,
		},
	},
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
-- hl.bind(mainMod .. " + SHIFT + E", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.exec_cmd("nwg-bar -i 90"))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
--hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))

-- similar to super+v but its not fullscreen
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
-- hl.bind(mainMod .. " + SHIFT + S", hl.dsp.layout("togglesplit")) -- dwindle only
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(home .. "/Documents/apps/zen/zen"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
	hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end
-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))
-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

local suppressMaximizeRule = hl.window_rule({
	-- Ignore maximize requests from all apps. You'll probably like this.
	name = "suppress-maximize-events",
	match = { class = ".*" },

	suppress_event = "maximize",
})

hl.window_rule({
	-- Fix some dragging issues with XWayland
	name = "fix-xwayland-drags",
	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
	name = "move-hyprland-run",
	match = { class = "hyprland-run" },

	move = "20 monitor_h-120",
	float = true,
})

-- super + number to change focus of workspace X/ super+shift+num to move focused window to ws x
for i = 1, 10 do
	local key = i % 10 -- 10 maps to key 0
	if is_fr then
		key = fr_keys[i]
	end
	hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "Focus workspace " .. i })
	hl.bind(
		mainMod .. " + SHIFT + " .. key,
		hl.dsp.window.move({ workspace = i }),
		{ description = "Move window to workspace " .. i }
	)
end

-- change window size
hl.bind(
	mainMod .. " + right",
	hl.dsp.window.resize({ x = 100, y = 0, relative = true }),
	{ repeating = true },
	{ description = "Increase window width with keyboard" }
)
hl.bind(
	mainMod .. " + left",
	hl.dsp.window.resize({ x = -100, y = 0, relative = true }),
	{ repeating = true },
	{ description = "Reduce window width with keyboard" }
)
hl.bind(
	mainMod .. " + down",
	hl.dsp.window.resize({ x = 0, y = 100, relative = true }),
	{ repeating = true },
	{ description = "Increase window height with keyboard" }
)
hl.bind(
	mainMod .. " + up",
	hl.dsp.window.resize({ x = 0, y = -100, relative = true }),
	{ repeating = true },
	{ description = "Reduce window height with keyboard" }
)

--swap window
hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.swap({ direction = "l" }), { description = "Swap tiled window left" })
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.swap({ direction = "r" }), { description = "Swap tiled window right" })
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.swap({ direction = "u" }), { description = "Swap tiled window up" })
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.swap({ direction = "d" }), { description = "Swap tiled window down" })

-- fixes pixelated apps but i have no idea what this means
hl.config({ xwayland = { force_zero_scaling = true } })

hl.layer_rule({
	name = "blur-rofi",
	match = { namespace = "rofi" },
	dim_around = true,
	animation = "popin 60%",
})

hl.config({
	cursor = { inactive_timeout = 4 },
})

hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }), { desc = "Maximize" })
--
hl.window_rule({
	match = { class = "vlc" },
	opacity = "1.0 override 1.0 override 1.0 override",
})

hl.bind(
	mainMod .. " + M",
	hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }),
	{ description = "Toggle Maximize Window" }
)

hl.window_rule({
	match = { class = "virt-manager" },
	opacity = "1.0 override 1.0 override 1.0 override",
})

hl.window_rule({
	match = { class = "Mullvad Browser" },
	opacity = "1.0 override 1.0 override 1.0 override",
})

hl.window_rule({
	match = { class = "Tor Browser" },
	opacity = "1.0 override 1.0 override 1.0 override",
})
--
hl.bind(mainMod .. " + T", hl.dsp.exec_cmd(home .. "/Scripts/touchToggle.sh"))
hl.bind(mainMod .. " + Y", hl.dsp.layout("togglesplit"), { description = "Toggle split" })

hl.bind(mainMod .. " + TAB", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + SHIFT + TAB", hl.dsp.focus({ workspace = "e-1" }))

hl.config({
	plugin = {
		scrolloverview = {
			gesture_distance = 300, -- how far is the "max" for the gesture
			scale = 0.7, -- preferred overview scale
			workspace_gap = 50,
			layout = "vertical", -- vertical or horizontal
			wallpaper = 0, -- 0: global only, 1: per-workspace only, 2: both
			blur = true, -- blur only the main overview wallpaper

			shadow = {
				enabled = false,
				range = 10,
			},
		},
	},
})

-- Toggle ScrollOverview with SUPER+g
hl.bind("SUPER + g", function()
	hl.plugin.scrolloverview.overview("toggle all")
end)

hl.layer_rule({
	name = "nwg-bar",
	match = { namespace = "nwg-bar" },
	dim_around = true,
	animation = "popin 60%",
})

hl.permission({ binary = "/usr/bin/hyprlock", type = "screencopy", mode = "allow" })
