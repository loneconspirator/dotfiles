echo "export DOTFILES=~/git/dotfiles" > ~/.zshrc
source ~/.zshrc
echo "source \${DOTFILES}/zshrc" >> ~/.zshrc

echo "source \${DOTFILES}/nvim.vim" > ~/.config/nvim/init.vim
echo "source \${DOTFILES}/tmux.conf" > ~/.tmux.conf

echo "[include]" > ~/.gitconfig
echo "  path = ${DOTFILES}/gitconfig" >> ~/.gitconfig
