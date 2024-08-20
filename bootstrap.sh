echo git username
read git_username

echo git email
read git_email

echo Checking for brew...
if ! [ command -v brew ] &>/dev/null; then
  if [[ "$OSTYPE" == "darwin"* ]]; then
    echo Installing brew...
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    echo Installing brew packages from Brewfile...
    brew bundle
  fi
fi

if [[ "$OSTYPE" == "darwin"* ]]; then

  if ! [ command -v brew ] &>/dev/null; then
    echo Installing brew...
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
  echo Installing brew packages from Brewfile...
  brew bundle
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
  defaults write com.apple.dock "mineffect" -string "scale"
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

  echo Installing fzf...
  yes | $(brew --prefix)/opt/fzf/install
fi

echo Linking .gitignore...
ln -sf $(pwd)/gitignore $(echo $HOME)/.gitignore

echo Configuring git...
git config --global core.editor nvim
git config --global push.default simple
git config --global core.autocrlf input
git config --global pull.rebase false
git config --global --add --bool push.autoSetupRemote true
git config --global user.name $git_username
git config --global user.email $git_email
git config --global core.excludesfile ~/.gitignore

echo Downloading cht.sh with completions...
sudo touch /usr/local/bin/cht.sh
sudo curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh
sudo chmod +x /usr/local/bin/cht.sh

echo Linking .tmux.conf...
mkdir -p ~/.config/tmux
ln -sf $(pwd)/tmux.conf $(echo $HOME)/.config/tmux/tmux.conf

echo Linking .config/wezterm.lua to wezterm
ln -sf $(pwd)/wezterm.lua $(echo $HOME)/.config/wezterm/wezterm.lua

echo Linking .config/fish/config.fish to config.fish
mkdir -p ~/config/fish
ln -sf $(pwd)/config.fish $(echo $HOME)/.config/fish/config.fish

echo Linking .config/nvim directory to nvim
ln -sf $(pwd)/nvim $(echo $HOME)/.config/nvim

echo Linking .ideavimrc for IntelliJ...
ln -sf $(pwd)/ideavimrc $(echo $HOME)/.ideavimrc

echo Linking .config/aerospace/aerospace.toml...
mkdir -p ~/config/aerospace
ln -sf $(pwd)/aerospace.toml $(echo $HOME)/.config/aerospace/aerospace.toml

if ! test -f "~/.credentials"; then
  echo No .credentials file found, creating empty .credentials file...
  touch ~/.credentials
fi

echo Done.
