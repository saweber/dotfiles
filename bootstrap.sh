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

echo Installing zsh...
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
sh -s /bin/zsh;

cp -f ~/dotfiles/.zshrc ~/.zshrc;
cp -f ~/dotfiles/.p10k.zsh ~/.p10k.zsh;

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

echo Configuring tmux...
cp -f .tmux.conf ~/.tmux.conf;
git clone https://github.com/jimeh/tmux-themepack.git ~/.tmux-themepack;

echo Configuring vim...
cp -u ~/dotfiles/.vimrc ~/.vimrc;

echo Installing nvm...
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.2/install.sh | bash;

