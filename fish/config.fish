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

# function __fish_complete_path --description "Complete using path"
#     set -l target
#     set -l description
#     switch (count $argv)
#         case 0
#             # pass
#         case 1
#             set target "$argv[1]"
#         case 2 "*"
#             set target "$argv[1]"
#             set description "$argv[2]"
#     end
#     set -l targets (complete -C"'' $target")
#     if set -q targets[1]
#         printf "%s\n" $targets\t"$description"
#     end
# end
