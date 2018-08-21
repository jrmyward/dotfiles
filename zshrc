ZSH=$HOME/.oh-my-zsh
ZSH_THEME="jeremyward"
DISABLE_AUTO_UPDATE="true"

plugins=(git bundler brew gem)

export EDITOR=/usr/local/bin/vim

source $ZSH/oh-my-zsh.sh
source ~/.bin/tmuxinator.zsh

export ANDROID_HOME="brew --prefix android"
export NPM_PACKAGES="${HOME}/.npm-packages"
export NODE_PATH=$NPM_PACKAGES/lib/node_modules:$NODE_PATH

path+=($NPM_PACKAGES/bin)

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

path[1,0]=/opt/chefdk/bin

