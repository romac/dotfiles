# fzf.fish is only meant to be used in interactive mode. If not in interactive mode and not in CI, skip the config to speed up shell startup
if not status is-interactive && test "$CI" != true
    exit
end

# Because of scoping rules, to capture the shell variables exactly as they are, we must read
# them before even executing _fzf_search_variables. We use psub to store the
# variables' info in temporary files and pass in the filenames as arguments.
# This variable is global so that it can be referenced by fzf_configure_bindings and in tests
set --global _fzf_search_vars_command '_fzf_search_variables (set --show | psub) (set --names | psub)'


# Install the default bindings, which are mnemonic and minimally conflict with fish's preset bindings
fzf_configure_bindings

# Doesn't erase autoloaded _fzf_* functions because they are not easily accessible once key bindings are erased
function _fzf_uninstall --on-event fzf_uninstall
    _fzf_uninstall_bindings

    set --erase _fzf_search_vars_command
    functions --erase _fzf_uninstall _fzf_migration_message _fzf_uninstall_bindings fzf_configure_bindings
    complete --erase fzf_configure_bindings

    set_color cyan
    echo "fzf.fish uninstalled."
    echo "You may need to manually remove fzf_configure_bindings from your config.fish if you were using custom key bindings."
    set_color normal
end

# set -x FZF_COMPLETION_OPTS '--border --info=inline'
#
# set -x FZF_CTRL_T_OPTS "\
#   --preview 'bat -n --color=always {}'
#   --bind 'ctrl-/:change-preview-window(down|hidden|)'"
#
# set -x FZF_CTRL_R_OPTS "\
#   --preview 'echo {}' --preview-window up:3:hidden:wrap
#   --bind 'ctrl-/:toggle-preview'
#   --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
#   --color header:italic
#   --header 'Press CTRL-Y to copy command into clipboard'"

set fzf_fd_opts '--hidden --follow --exclude ".git"'
set fzf_preview_dir_cmd 'erd -C force -H -I -L 1 {} | head -200'
set fzf_preview_file_cmd 'bat -n --color=always {}'

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
# function _fzf_comprun
#   set command $argv[1]
#   set argv (string sub -s 2 $argv)
#
#   switch $command
#     case "cd"
#       fzf --preview 'erd -C force -H -I -L 1 {} | head -200' $argv
#     case "export" "unset"
#       fzf --preview "eval 'echo \$'{}" $argv
#     case "ssh"
#       fzf --preview 'dog --color=always {}' $argv
#     case "*"
#       fzf --preview 'bat -n --color=always {}' $argv
#   end
# end
#
