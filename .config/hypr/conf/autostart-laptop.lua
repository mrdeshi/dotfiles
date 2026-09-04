
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

hl.on("hyprland.start", function()
    -- these two were exec-once of a bare VAR=value: a no-op. Use hl.env("MESA_NO_VSYNC", "1") if you actually want it.
    -- hl.exec_cmd("MESA_VK_WSI_PRESENT_MODE=immediate")
    -- hl.exec_cmd("MESA_NO_VSYNC=1")
    hl.exec_cmd("qs -c overview")
    hl.exec_cmd("noctalia")
end)

