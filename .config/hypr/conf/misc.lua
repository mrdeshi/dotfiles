-- See https://wiki.hyprland`.org/Configuring/Variables/ for more

hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")

hl.config({
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    },
    --darkmode
    --for libadwaita gtk4 apps you can use this command:
    --for gtk3 apps you need to install adw-gtk3 theme (in arch linux sudo pacman -S adw-gtk-theme)
    --for kde apps you need to install: sudo pacman -S qt5ct qt6ct kvantum kvantum breeze-icons   
    --you will need to set dark theme for qt apps from kde more difficult thans with gnome :D:
})

hl.on("config.reloaded", function()
    hl.exec_cmd("gsettings set org.gnome.desktop.interface color-scheme \"prefer-dark\"")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme \"adw-gtk3\"")
end)

