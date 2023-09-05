if status is-interactive

  # Setup Starship
  starship init fish | source

  # Setup Atuin
  atuin init fish | source
end

# Disable question mark globbing
# set -U fish_features qmark-noglob
