
--exec-once = hyprpaper
--exec-once = edex-ui

--exec-once = bongocat -c ./.config/bongocat/bongocat.conf 
--exec-once = waybar

--pywal
--exec-once = wal -R

-- WAYPAPER
--exec-once=waypaper --restore;

--computer graphics vsync

--QUICK-SHELL 
--overview
--noctalia

-- Ollama remoto via tailscale (era "export OLLAMA_HOST=..." non committato nel vecchio .conf).
-- hl.env vale per tutto ciò che Hyprland avvia: terminali, launcher, app.
hl.env("OLLAMA_HOST", "100.65.202.42:11434")

hl.on("hyprland.start", function()
    -- these two were exec-once of a bare VAR=value: a no-op. Use hl.env("MESA_NO_VSYNC", "1") if you actually want it.
    -- hl.exec_cmd("MESA_VK_WSI_PRESENT_MODE=immediate")
    -- hl.exec_cmd("MESA_NO_VSYNC=1")
    hl.exec_cmd("qs -c overview")
    hl.exec_cmd("noctalia")
    -- VNC headless output over tailscale (hyprctl keyword no longer works with the Lua config: use eval)
    hl.exec_cmd([[bash -lc 'TS_IP=$(tailscale ip -4); hyprctl output create headless VNC-1; sleep 0.5; hyprctl eval "hl.monitor({ output = \"VNC-1\", mode = \"1920x1080@60\", position = \"auto\", scale = \"1\" })"; wayvnc --gpu --render-cursor -o VNC-1 $TS_IP 5900']])
end)

