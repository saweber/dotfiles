#!/bin/bash

echo git username:
read git_username;

echo git email:
read git_email;

echo Copy .zshrc? [Y/n]:
read copy_zshrc;

echo Copy .vimrc? [Y/n]:
read copy_vimrc;

echo Checking for brew...
if ! command -v COMMAND &> /dev/null
then
  echo Installing brew...
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
  exit
fi

echo Installing brew packages from Brewfile...
brew bundle;

echo Configuring git...
git config --global push.default simple;
git config --global core.autocrlf input;
git config --global user.name $git_username;
git config --global user.email $git_email;


if [ ! -d "~/.oh-my-zsh" ]; then
  echo Installing oh my zsh...
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
fi

if [ ! -d "~/.oh-my-zsh/custom/plugins/zsh-nvm" ]; then
  echo Installing zsh-nvm...
  git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm;
fi

case $copy_zshrc in [yY][eE][sS]|[yY])
  echo Moving .zshrc to .zsrhc.pre_bootstrap...
  mv ~/.zshrc ~/.zshrc.pre_bootstrap;
  echo Copying .zshrc...
  cp -f .zshrc ~/.zshrc;
  ;;
esac

case $copy_vimrc in [yY][eE][sS]|[yY])
  echo Moving .vimrc to .vimrc.pre_bootstrap...
  mv ~/.vimrc ~/.vimrc.pre_bootstrap;
  echo Copying .vimrc...
  cp -f .vimrc ~/.vimrc;
  ;;
esac

echo Done. Run "source ~/.zshrc" or open a new terminal.