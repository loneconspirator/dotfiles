# Install oh my zsh first so I'll overwrite their config
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "export DOTFILES=~/git/dotfiles" > ~/.zshrc
source ~/.zshrc
echo "source \${DOTFILES}/zshrc" >> ~/.zshrc

mkdir -p ~/.config/nvim/
echo "source \${DOTFILES}/nvim.vim" > ~/.config/nvim/init.vim
echo "source \${DOTFILES}/tmux.conf" > ~/.tmux.conf

echo "[include]" > ~/.gitconfig
echo "  path = ${DOTFILES}/gitconfig" >> ~/.gitconfig

mkdir ~/vimtmp/

# This was causing me problems with the latest alacritty - needs updating
# ln -s ${DOTFILES}/alacirtty.yml ~/.alacritty.yml

# Install nvim plugged
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim2


