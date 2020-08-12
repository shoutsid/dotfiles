#!/bin/bash

ask_question () {
  echo ""
  read -r -p "$1" response
  isMac=${response,,}    # tolower
  echo ""
  echo ""
}
ask_question "Are you running mac? [y/n]: "

if [[ "$isMac" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
  sh -c "brew install neovim htop tmux zsh npm"
else
  sh -c "sudo apt-get -y install neovim htop tmux zsh npm"
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sh -c "chsh -s $(which zsh)"
sh -c "git clone https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/themes/powerlevel10k"

printf "\nTo use ZSH as your default terminal, you must restart your system.\n"

sh -c "cp ./.zshrc $HOME/.zshrc"
sh -c "cp ./.tmux.conf $HOME/.tmux.conf"

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if [[ "$isMac" =~ ^([yY][eE][sS]|[yY])+$ ]]; then
  sh -c "brew install cmake macvim python mono go nodejs the_silver_searcher"
else
  sh -c "sudo apt-get install -y build-essential cmake vim python3-dev nodejs silversearcher-ag fonts-powerline"
fi

sh -c "mkdir -p $HOME/.config/nvim/"
sh -c "cp ./.vimrc $HOME/.config/nvim/init.vim"

printf "\nOpen vim and install plugins via :PlugInstall\n"
