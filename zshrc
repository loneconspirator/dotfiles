# If you come from bash you might have to change your $PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

if [[ $(uname -m) == 'arm64' ]]; then
  export PATH=$HOME/bin:$DOTFILES/bin:/opt/homebrew/bin/:$PATH
  export PATH="/opt/homebrew/sbin:$PATH"
  export PATH="/opt/homebrew/opt/openssl@1.1/bin:$PATH"

  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && . "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && . "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
else
  export PATH=$HOME/bin:$DOTFILES/bin:/usr/local/bin:$PATH
  export PATH="/usr/local/sbin:$PATH"
  export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

  export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Browser that ensime will open from vim for scaladocs
export BROWSER="brave %s"

# Path to your oh-my-zsh installation.
export ZSH=/Users/mike/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  bundler
  rails
  rbenv
  vi-mode
  zsh-autosuggestions
  zsh-completions
  zsh-syntax-highlighting
)

# FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
# FPATH=$(brew --prefix)/share/zsh-syntax-highlighting:$FPATH
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

for zsh_source in ${DOTFILES}/zsh/*.zsh; do
  source $zsh_source
done

