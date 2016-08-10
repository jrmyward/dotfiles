ZSH=$HOME/.oh-my-zsh
ZSH_THEME="jeremyward"
DISABLE_AUTO_UPDATE="true"

plugins=(git bundler brew gem)

source $ZSH/oh-my-zsh.sh

export ANDROID_HOME="brew --prefix android"
export NPM_PACKAGES="${HOME}/.npm-packages"
export NODE_PATH=$NPM_PACKAGES/lib/node_modules:$NODE_PATH

path+=($NPM_PACKAGES/bin)

# for Homebrew installed rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
