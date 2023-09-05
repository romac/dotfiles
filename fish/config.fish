# Disable question mark globbing
# set -U fish_features qmark-noglob



# Path
fish_add_path -a "$HOME/.bin"
fish_add_path -a "$HOME/.cargo/bin"
fish_add_path -a "$JAVA_HOME/bin"
fish_add_path -a "$HOME/.bun/bin"
fish_add_path -a "$HOME/Library/Application Support/Coursier/bin"
fish_add_path -a "$HOME/.gm/bin"
fish_add_path -a "$HOME/.local/bin"
fish_add_path -a "/opt/homebrew/bin"

# Private env variables
source "$HOME/.dotfiles/private.env"

