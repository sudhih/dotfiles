alias ls="ls --color -Fh"	# classify files in color
alias ll="ls -l"		# long list
alias la="ls -a"

# tmux cmds
alias t='tmux -2'		# force tmux assume terminal supports 256 color scheme, helps vim inside tmux show right colors
alias tn='tmux -2 new-session -s'
alias tk='tmux kill-session -t'
alias ta='tmux attach -t'

# python dev
alias pc='echo "creating python VE in pwd"; python -m venv venv'
alias pa='echo "activate python VE in pwd"; source ./venv/bin/activate'
alias pd='echo "deactivting python VE"; deactivate'
alias prv='echo "deleting python VE"; rm -rf venv'
alias prb='echo "deleting python distutils artefact"; rm -rf build/ dist/ *.egg-info'
alias pu='echo running unittests; python -m unittest discover'
alias puv='echo running unittests in verbose mode; python -m unittest discover -v'
alias ps='echo running setup.py; prb; python setup.py bdist_wheel'

