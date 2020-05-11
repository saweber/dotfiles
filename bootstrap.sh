#!/bin/bash

echo Installing brew...
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";

echo Installing brew packages from Brewfile...
brew bundle;

echo Configuring git...
git config --global push.default simple;

echo git username:
read git_username;
git config --global user.name $git_username;

echo git email:
read git_email;
git config --global user.email $git_email;

git config --global core.autocrlf input;

echo Installing oh my zsh...
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";

cp -f ~/dotfiles/.zshrc ~/.zshrc;
cp -f ~/dotfiles/.p10k.zsh ~/.p10k.zsh;

chsh -s usr/local/bin/zsh;

source ~/.zshrc;

echo Configuring tmux...
cp -f .tmux.conf ~/.tmux.conf;

echo Configuring vim...
cp -u ~/dotfiles/.vimrc ~/.vimrc;

