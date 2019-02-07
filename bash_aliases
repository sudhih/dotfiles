alias ls="ls --color -Fh"	# classify files in color
alias ll="ls -l"		# long list
alias la="ls -a"

# tmux cmds
alias t='tmux -2'		# force tmux assume terminal supports 256 color scheme, helps vim inside tmux show right colors
alias tn='tmux -2 new-session -s'
alias tk='tmux kill-session -t'
