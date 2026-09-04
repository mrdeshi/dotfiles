-- Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more

-- $mainMod key
local mainMod = "SUPER"

-- Actions
hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd("kitty"))  -- Open kitty
hl.bind(mainMod .. " + Q", hl.dsp.window.close())  -- Close current window
hl.bind(mainMod .. " + M", hl.dsp.exit())  -- Exit Hyprland
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd("nautilus"))  -- Opens the filemanager
hl.bind(mainMod .. " + T", hl.dsp.window.float({ action = "toggle" }))  -- Toggle between tiling and floating window
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))  -- Open the window in fullscreen
hl.bind(mainMod .. " + CTRL + RETURN", hl.dsp.exec_cmd("rofi -show drun"))  -- Open rofi
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("kitty -e terminal-parrot"))
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.window.pseudo())  -- dwindle
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("firefox"))  -- Opens the browser
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1.4 @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set 10%+"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 10%-"))
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86WLAN", hl.dsp.exec_cmd("nmcli radio wifi toggle"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))  -- Move focus left
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))  -- Move focus right
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))  -- Move focus up
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))  -- Move focus down

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,         hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))  -- Scroll workspaces
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))  -- Scroll workspaces

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })  -- Move window
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })  -- Resize window

--grimblast
hl.bind(mainMod .. " + p", hl.dsp.exec_cmd("grimblast save active"))
hl.bind("ALT + s", hl.dsp.exec_cmd("grimblast copy area"))
hl.bind(mainMod .. " + ALT + p", hl.dsp.exec_cmd("grimblast save output"))
hl.bind(mainMod .. " + CTRL + p", hl.dsp.exec_cmd("grimblast save screen"))

--amurini
hl.bind("ALT + Tab", hl.dsp.window.cycle_next({ next = true }))
hl.bind("ALT + Tab", hl.dsp.window.bring_to_top())
hl.bind("ALT + SHIFT + Tab", hl.dsp.window.cycle_next({ prev = true }))
--bind = CTRL, W, killactive # Close current window

--swaylock

hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("swaylock"))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd("code"))
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd("kitty -e alsamixer"))
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("obsidian"))

--quick-shell overview
hl.bind(mainMod .. " + Tab", hl.dsp.exec_cmd("qs ipc -c overview call overview toggle"))

--NOCTALIA (v5, IPC: https://docs.noctalia.dev/noctalia/ipc/)
local ipc = "noctalia msg"

-- Core binds
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(ipc .. " panel-toggle launcher"))
--hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(ipc .. " panel-toggle control-center"))
hl.bind(mainMod .. " + comma", hl.dsp.exec_cmd(ipc .. " settings-toggle"))

-- Media keys
-- NOTE: volume/brightness keys are also bound above (wpctl/brightnessctl): both binds fire, as before.
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(ipc .. " volume-up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(ipc .. " volume-down"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(ipc .. " volume-mute"), { locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(ipc .. " brightness-up"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(ipc .. " brightness-down"), { locked = true, repeating = true })

--dicord optimization
--hl.bind("F11", hl.dsp.exec_cmd([[hyprctl eval "hl.monitor({ output = \"eDP-1\", disabled = true })"]]))
--hl.bind("F12", hl.dsp.exec_cmd([[hyprctl eval "hl.monitor({ output = \"eDP-1\", mode = \"preferred\", position = \"auto\", scale = \"1\" })"]]))

--tesseract
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.exec_cmd("~/.config/hypr/scripts/ocr.sh"))
