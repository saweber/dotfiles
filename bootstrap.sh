#!/bin/bash

echo git username
read git_username

echo git email
read git_email

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  sudo apt-get update
  sudo apt-get install zsh build-essential
  chsh -s /bin/zsh
fi

echo Checking for brew...
if ! [ command -v brew &> /dev/null ] ; then
  echo Installing brew...
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

  echo Installing brew packages from Brewfile...
  brew bundle;

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo Instaling Mac applications...
  brew bundle --file=casks.Brewfile

  echo Changing macOS defaults...

  defaults write com.apple.Accessibility ReduceMotionEnabled -bool true

  echo Configuring finder and hiding unwanted desktop items.
  defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
  defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
  defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
  defaults write com.apple.finder ShowMountedServersOnDesktop -bool false
  killall Finder

  echo Configuring Dock and Mission Control.
  defaults write com.apple.dock no-bouncing -bool true
  defaults write com.apple.dock orientation left
  defaults write com.apple.dock autohide -bool true
  defaults write com.apple.dock show-recents -bool false
  defaults write com.apple.dock tilesize -int 48
  # Turns off misson control rearrange spaces
  defaults write com.apple.dock mru-spaces -bool false
  # disable hot corners
  defaults write com.apple.dock wvous-tl-corner -int 0
  defaults write com.apple.dock wvous-tr-corner -int 0
  defaults write com.apple.dock wvous-bl-corner -int 0
  defaults write com.apple.dock wvous-br-corner -int 0
  killall Dock

  echo Fixing mouse scroll direction.
  defaults write -g com.apple.swipescrolldirection -bool false

  echo Setting screenshots to jpg and disabling shadows.
  defaults write com.apple.screencapture disable-shadow -bool true
  defaults write com.apple.screencapture type jpg
  mkdir ~/Screenshots
  defaults write com.apple.screencapture "location" -string "~/Screenshots"
  killall SystemUIServer

  echo Copying Karabiner configuration...
  cp -r ./karabiner ~/.config
fi

echo Moving .gitignore to .gitignore.pre_bootstrap...
mv ~/.gitignore ~/.gitignore.pre_bootstrap
echo Linking .gitignore...
ln -sf ~/dotfiles/gitignore $(echo $HOME)/.gitignore

echo Configuring git...
git config --global core.editor nvim
git config --global push.default simple
git config --global core.autocrlf input
git config --global pull.rebase false
git config --global --add --bool push.autoSetupRemote true
git config --global user.name $git_username
git config --global user.email $git_email
git config --global core.excludesfile ~/.gitignore

echo Downloading docker completions...
curl -L https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/zsh/_docker-compose -o ~/.zsh/_docker-compose --create-dirs
curl -L  https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker -o ~/.zsh/_docker --create-dirs

echo Downloading git completions...
curl -L https://github.com/git/git/blob/master/contrib/completion/git-completion.zsh -o ~/.zsh/_git --create-dirs

echo Downloading cht.sh with completions...
sudo touch /usr/local/bin/cht.sh
sudo curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh
sudo chmod +x /usr/local/bin/cht.sh
curl https://cheat.sh/:zsh > ~/.zsh/_cht --create-dirs

echo Installing fzf...
yes | $(brew --prefix)/opt/fzf/install;

echo Moving .tmux.conf to .tmux_conf.pre_bootstrap...
mv ~/.tmux.conf ~/.tmux_conf.pre_bootstrap
echo Moving config/tmux/tmux.conf to config/tmux/tmux.conf.pre_bootstrap...
mv ~/.config/tmux/tmux.conf ~/.config/tmux/tmux.conf.pre_bootstrap
echo Linking .tmux.conf...
mkdir -p ~/.config/tmux
ln -sf $(pwd)/tmux.conf $(echo $HOME)/.config/tmux/tmux.conf

echo Moving .zshrc to .zsrhc.pre_bootstrap...
mv ~/.zshrc ~/.zshrc.pre_bootstrap
echo Linking .zshrc...
ln -sf $(pwd)/zshrc $(echo $HOME)/.zshrc

echo Moving .p10k.zsh to .p10k_zsh.pre_bootstrap...
mv ~/.p10k.zsh ~/.p10k_zsh.pre_bootstrap
echo Linking .p10k.zsh...
ln -sf $(pwd)/p10k.zsh $(echo $HOME)/.p10k.zsh

echo Moving .init.vim to .init_vim.pre_bootstrap...
mv ~/.config/nvim/init.vim ~/.init_vim.pre_bootstrap
echo Linking init.vim for neovim...
mkdir -p ~/.config/nvim
ln -sf $(pwd)/init.vim $(echo $HOME)/.config/nvim/init.vim

echo Moving .config/nvim to .config/nvim.pre_boostrap...
mv -r ~/.config/nvim ~/.config/nvim.pre_boostrap
echo Linking .config/nvim directory to nvim
ln -sf $(pwd)/nvim $(echo $HOME)/.config/nvim

echo Moving .ideavimrc to .ideavimrc.pre_boostrap...
mv ~/.ideavimrc ~/.ideavimrc.pre_bootstrap
echo Linking .ideavimrc for IntelliJ...
ln -sf $(pwd)/ideavimrc $(echo $HOME)/.ideavimrc

if ! test -f "~/.credentials"]; then
  echo No .credentials file found, creating empty .credentials file...
  touch .credentials
fi

echo Done. Run "source ~/.zshrc" or open a new terminal.
