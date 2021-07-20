set -U fish_greeting

fish_vi_key_bindings

# Make default programs
set -gx EDITOR nvim
set -gx FILE nnn

# Set bat as man pager
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

# FZF options
set -gx FZF_DEFAULT_COMMAND 'fd --type f --hidden --follow --exclude .git'
set -gx FZF_DEFAULT_OPTS '--height 90% --layout=reverse --border --info=inline --marker="*" --bind "ctrl-y:execute(echo {+} | wl-copy)" --bind "ctrl-a:select-all" --bind "?:toggle-preview"'
set fzf_history_opts --sort --exact --history-size=30000
set fzf_fd_opts --hidden --follow --exclude=.git
set fzf_preview_dir_cmd exa --all --color=always

fzf_configure_bindings --git_status=\e\cs --history=\cr --variables --git_log=\e\cl --directory=\cp

if test -e $HOME/.config/fish/functions/local.fish
    source $HOME/.config/fish/functions/local.fish
end

alias c="clear"
alias cat="bat"
alias chgrp='chgrp --preserve-root'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'
alias ls="exa"
alias mkdir='mkdir -p -v'
alias N='sudo -E nnn -deH'
alias ping='ping -c 5'
alias q="exit"
alias rm='rm -I'
alias vi='nvim'
alias vim='nvim'
alias :q="exit"
