-- See https://wiki.hyprland.org/Configuring/Window-Rules/ for more

-- Noctalia v5 settings window
hl.window_rule({
    name  = "noctalia-settings",
    match = { class = "dev.noctalia.Noctalia" },
    float = true,
    size  = { 1080, 920 },
})
