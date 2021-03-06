#
# .bash_profile
#
# @author Don Hunt
# forked from geerlingguy
# @see .inputrc
#

# Nicer prompt.
export PS1="\[\e[0;32m\]\]\[\] \[\e[1;32m\]\]\t \[\e[0;2m\]\]\w \[\e[0m\]\]\[$\] "

# Use colors.
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Custom $PATH with extra locations. Duplicates noted - remove for now
# export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.bash_aliases ]
then
  source ~/.bash_aliases
fi

# Include bashrc file (if present).
if [ -f ~/.bashrc ]
then
  source ~/.bashrc
fi

function psman() {
  man -t "${1}" | open -f -a /Applications/Preview.app/
}

function chimeoff() {
  sudo nvram SystemAudioVolume=%80
}

function chimeon() {
  sudo nvram -d SystemAudioVolume
}

# Syntax-highlight code for copying and pasting.
# Requires highlight (`brew install highlight`).
function pretty() {
  pbpaste | highlight --syntax=$1 -O rtf | pbcopy
}

# Git aliases.
alias gs='git status'
alias gc='git commit'
alias gp='git pull --rebase'
alias gcam='git commit -am'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'


# Turn on Git autocomplete.
brew_prefix=`brew --prefix`
if [ -f $brew_prefix/etc/bash_completion ]; then
  . $brew_prefix/etc/bash_completion
fi

# configure virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export WORKON_HOME="/Users/donhunt/virtualenvs"
export PROJECT_HOME="/Users/donhunt/Code/mypy"
source /usr/local/bin/virtualenvwrapper.sh

# Use nvm. Can uncomment once nvm usage is clear
# export NVM_DIR="$HOME/.nvm"
# . "$brew_prefix/opt/nvm/nvm.sh"

# Vagrant configuration.
# export VAGRANT_DEFAULT_PROVIDER='virtualbox'

# Disable cowsay in Ansible.
export ANSIBLE_NOCOWS=1

# Delete a given line number in the known_hosts file.
knownrm() {
  re='^[0-9]+$'
  if ! [[ $1 =~ $re ]] ; then
    echo "error: line number missing" >&2;
  else
    sed -i '' "$1d" ~/.ssh/known_hosts
  fi
}


export PATH="$HOME/.cargo/bin:$PATH"
eval "$(oh-my-posh --init --shell bash --config /usr/local/opt/oh-my-posh/themes/jandedobbeleer.omp.json)"