
export PATH="/usr/local/bin:$PATH"
export PATH="$(brew --prefix josegonzalez/php/php55)/bin:$PATH"

# ECLIPSE ANDROID

export PATH="/Applications/eclipse-android/sdk/platform-tools:$PATH"
export PATH="/Applications/eclipse-android/sdk/tools:$PATH"

export PATH="$HOME/.jenv/bin:$PATH"

eval "$(jenv init -)"

# GENERAL PURPOSE

autoload bashcompinit && bashcompinit

htdocs() { cd /Library/WebServer/Documents/$1; }

_htdocs() {
   local cur opts
   cur="${COMP_WORDS[COMP_CWORD]}"
   opts=$(cd /Library/WebServer/Documents; /bin/ls -d */)
   COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
}
complete -F _htdocs htdocs

workspace() { cd ~/Documents/workspace/$1; }
_workspace() {
   local cur opts
   cur="${COMP_WORDS[COMP_CWORD]}"
   opts=$(cd ~/Documents/Workspace; /bin/ls -d */. | sed 's|/./||')
   COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
}
complete -F _workspace workspace

xpeppers() { cd ~/Documents/xpeppers/$1; }
_xpeppers() {
   local cur opts
   cur="${COMP_WORDS[COMP_CWORD]}"
   opts=$(cd ~/Documents/XPeppers; /bin/ls -d */. | sed 's|/./||')
   COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
}
complete -F _xpeppers xpeppers

alias port="netstat -anp tcp | sed '2p;/$($@)/!d'"

# enable colors for ls and less commands
alias less='less -R'

alias n='sudo n'
alias l='ls -GlahpAF'
alias lchmod="ls -alG | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"
alias ll='l|less'
alias pc='pwd | pbcopy'

alias bashrc='vim ~/.bashrc'
alias zshrc='vim ~/.zshrc'
alias tigrc='vim ~/.tigrc'
alias ohmyzsh='vim ~/.oh-my-zsh'

alias tig='tig --all'
alias gm='git merge'
alias gb='git branch'

alias gd='git diff'
alias gdc='git diff --cached'

alias gst='git status'
alias gss='gst -s'
alias gsb='gss -b'

alias ga='git add'
alias gaa='git add --all'

alias gci='git commit -m'
alias gca='git commit -v -a'

alias gco='git checkout'
alias gcm='git checkout master'
alias gcb='git checkout -t'

eval $(hub alias -s)

alias tree='tree -Chs'
alias path='echo -e ${PATH//:/\\n}'
alias grep='grep --color=auto'
alias mkdir='mkdir -p'

export CLICOLOR='YES'
export LSCOLORS='ExGxFxdxCxDxDxhbadExEx'

# mosh sessions

export LC_ALL='en_US.UTF-8'
export LANG='en_US.UTF-8'

# ruby stuff
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# boot2docker
eval $(docker-machine env docker)

# added by travis gem
[ -f /Users/ivo/.travis/travis.sh ] && source /Users/ivo/.travis/travis.sh
