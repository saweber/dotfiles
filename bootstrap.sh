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

echo Installing zsh...
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
sh -s /bin/zsh;

cp -f ~/dotfiles/.zshrc ~/.zshrc;
cp -f ~/dotfiles/.p10k.zsh ~/.p10k.zsh;

source ~/.zshrc;

echo Configuring tmux...
cp -f .tmux.conf ~/.tmux.conf;
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack;

echo Configuring vim...
cp -u ~/dotfiles/.vimrc ~/.vimrc;

