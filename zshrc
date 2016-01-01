# zsh
export ZSH=/Users/$USER/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git colored-man colorize github jira vagrant virtualenv pip python brew osx zsh-syntax-highlighting)
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh

# rbenv
eval "$(rbenv init -)"

# pyenv
eval "$(pyenv init -)"
alias brew="env PATH=${PATH/\/Users\/$USER\/\.pyenv\/shims:/} brew"

# jenv
eval "$(jenv init -)"

# nvm
export NVM_DIR='~/.nvm'
. $(brew --prefix nvm)/nvm.sh

# autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# aliases
alias idea='open -a 'IntelliJ IDEA 15' .'
alias reload='. ~/.zshrc'
alias htop='sudo htop'
alias start-tomcat='/usr/local/opt/tomcat/bin/catalina start'
alias stop-tomcat='/usr/local/opt/tomcat/bin/catalina stop'
alias read-logs-tomcat='less +FG /usr/local/opt/tomcat/libexec/logs/catalina.out'
alias ..='cd ..'

# secrets
source /Users/$USER/secrets/secrets.sh
