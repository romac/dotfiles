function kitty-reload
    set -x DARK_MODE (dark-mode status)

    # check if kitty is active
    if test -n "$KITTY_PID"
        # set dark theme
        if test "$DARK_MODE" = "on"
            kitty @ set-colors --all --configured "$HOME/.config/kitty/theme-dark.conf"
        else
            kitty @ set-colors --all --configured "$HOME/.config/kitty/theme-light.conf"
        end
    end
end

# check if kitty is running but we are not in neovim
if test -n "$KITTY_PID"; and test -z "$NVIM"
    kitty-reload
end
