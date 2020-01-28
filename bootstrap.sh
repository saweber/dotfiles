#!/bin/bash
# git configuration
echo Configuring git...
git config --global push.default simple;

echo git username:
read git_username;
git config --global user.name $git_username;

echo git email:
read git_email;
git config --global user.email $git_email;

# zsh configuration
echo Configuring zsh...
cp -f .zshrc ~/.zshrc;
cp -f .p10k.zsh ~/.p10k.zsh;
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";

if [ ! -d "~/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k;
fi

if [ ! -d "~/.oh-my-zsh/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting;
fi

if [ ! -d "~/.oh-my-zsh/plugins/zsh-autosuggestions"]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git ~/.oh-my-zsh/plugins/zsh-autosuggestions;
fi

source ~/.zshrc;

# tmux configuration
cp -f .tmux.conf ~/.tmux.conf

# vim configuration
echo Configuring vim...
cp -u ~/dotfiles/.vimrc ~/.vimrc;

# if [ ! -d "/home/ubuntu/.vim/bundle/nerdtree" ]; then
#  git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree;
# fi
