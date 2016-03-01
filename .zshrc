ZSH=$HOME/.oh-my-zsh
ZSH_THEME="nicoulaj"
DISABLE_CORRECTION="true"

plugins=(git brew docker)

# hub not the github gem (bower install hub)
fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(/usr/local/share/zsh/site-functions $fpath)

source $ZSH/oh-my-zsh.sh
source ~/.bash_profile
source ~/.rvm_profile

# added by travis gem
[ -f /Users/ivo/.travis/travis.sh ] && source /Users/ivo/.travis/travis.sh
