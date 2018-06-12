#!/bin/bash
# prerequisites: git
# install zsh
sudo apt-get install zsh
zsh --version
chsh -s $(which zsh)
# install Powerline fonts
sudo apt-get install fonts-powerline
# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
# install tmux
sudo apt-get install tmux
# install vim plugins
vim +PlugInstall +qall
