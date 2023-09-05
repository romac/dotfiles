# Interactive mode
if status is-interactive

  # Setup Starship
  starship init fish | source

  # Setup Atuin
  atuin init fish --disable-up-arrow | source
end
