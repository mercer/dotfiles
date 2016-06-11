# zsh
export ZSH=/Users/$USER/.oh-my-zsh
ZSH_THEME="Honukai"
plugins=(colored-man colorize vagrant virtualenv pip python brew osx zsh-syntax-highlighting gradle docker)
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin"
source $ZSH/oh-my-zsh.sh

# GNU command line tools
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"
alias man='_() { echo $1; man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1 1>/dev/null 2>&1;  if [ "$?" -eq 0 ]; then man -M $(brew --prefix)/opt/coreutils/libexec/gnuman $1; else man $1; fi }; _'

# rbenv
eval "$(rbenv init -)"

# pyenv
eval "$(pyenv init -)"
alias brew="env PATH=${PATH/\/Users\/$USER\/\.pyenv\/shims:/} brew"

# jenv
eval "$(jenv init -)"

# sdkman -- for scala, groovy, gradle
export SDKMAN_DIR="/Users/$USER/.sdkman"
source "/Users/$USER/.sdkman/bin/sdkman-init.sh"

# perlbrew
source ~/perl5/perlbrew/etc/bashrc

# nvm
export NVM_DIR="/Users/$USER/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# jump
eval "$(jump shell zsh)"

# Eternal bash history
export HISTFILESIZE=-1
export HISTTIMEFORMAT="[%F %T] "

# Enable syntax-highlighting in less: brew install source-highlight
export LESSOPEN="| /usr/local/bin/src-hilite-lesspipe.sh %s"
export LESS=" -R "
alias less='less -m -N -g -i -J --underline-special --SILENT'
alias more='less'

# aliases
alias idea="open -a 'IntelliJ IDEA' ."
alias excel="open -a 'Microsoft Excel'"
alias reload='. ~/.zshrc'
alias htop='sudo htop'
alias start-tomcat='/usr/local/opt/tomcat/bin/catalina start'
alias stop-tomcat='/usr/local/opt/tomcat/bin/catalina stop'
alias read-logs-tomcat='less +FG /usr/local/opt/tomcat/libexec/logs/catalina.out'
alias play='open -a "MplayerX"'
alias ls='ls --color=auto -AltF'
alias g='./gradlew'
alias aliasname='less -FX'
alias date='date -u +"%Y-%m-%dT%H:%M:%SZ"'
alias egrep='egrep -i --color'
alias grep=egrep
eval "$(thefuck --alias fix)"

# secrets
source /Users/$USER/secrets/secrets.sh

# handy tools
# source /Users/$USER/dotfiles/lib/transfer.sh

# colors
d=.dircolors.256dark
test -r $d && eval "$(dircolors $d)"
