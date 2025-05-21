# Set the hostname to green
PS1="\[\e[32m\]\h\[\e[0m\]:\w\$ "

# Enable colorful output for commands and results
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Set colorful aliases for common commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias divya='paru'

# Add more colorful options for specific commands
export GREP_COLOR='1;33'
alias diff='diff --color=auto'

# Customize prompt command to ensure clean output
trap 'printf "\e[0m"' DEBUG

#fastfetch

export PATH="$HOME/.dotnet/tools/:$PATH"
export PATH="/opt/google/chrome/chrome/:$PATH"
