function __copilot_what-the-shell
    gh copilot suggest -t shell $argv
end
alias '!!'='__copilot_what-the-shell'

function __copilot_git-assist
    gh copilot suggest -t git $argv
end
alias 'git!'='__copilot_git-assist'

function __copilot_gh-assist
    gh copilot suggest -t gh $argv
end
alias 'gh!'='__copilot_gh-assist'

function __copilot-explain
    gh copilot explain "$argv"
end
alias 'explain!'='__copilot-explain'
