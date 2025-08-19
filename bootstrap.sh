echo git username
read git_username

echo git email
read git_email

echo Checking for brew...

if [[ "$OSTYPE" == "darwin"* ]]; then
  if ! [ command -v brew ] &>/dev/null; then
    echo Installing brew...
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
    sudo -k
  fi
  echo Installing brew packages from Brewfile...
  brew bundle
  echo Instaling Mac applications...
  brew bundle --file=mac.Brewfile

  echo Changing macOS defaults...

  # faster animation
  defaults write com.apple.Accessibility ReduceMotionEnabled -bool true

  # configure finder
  # hide icons on desktop
  defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
  defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
  defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
  defaults write com.apple.finder ShowMountedServersOnDesktop -bool false

  # show hidden files
  defaults write com.apple.finder "AppleShowAllFiles" -bool "true"

  # list view by default in finder
  defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"

  # configure dock
  defaults write com.apple.dock no-bouncing -bool true
  defaults write com.apple.dock autohide -bool true
  defaults write com.apple.dock show-recents -bool false
  defaults write com.apple.dock tilesize -int 48
  defaults write com.apple.dock "mineffect" -string "scale"

  # Turns off misson control rearrange spaces
  defaults write com.apple.dock mru-spaces -bool false

  # disable hot corners
  # defaults write com.apple.dock wvous-tl-corner -int 0
  defaults write com.apple.dock wvous-tr-corner -int 0
  defaults write com.apple.dock wvous-bl-corner -int 0
  defaults write com.apple.dock wvous-br-corner -int 0

  # fixing mouse scroll direction.
  defaults write -g com.apple.swipescrolldirection -bool false

  # setting screenshots to jpg and disabling shadows.
  defaults write com.apple.screencapture disable-shadow -bool true
  defaults write com.apple.screencapture type jpg

  # set globe key to change input sources (swap between QWERTY and Colemak)
  defaults write com.apple.HIToolbox AppleFnUsageType -int "1"

  # fn keys work as fn keys by default
  defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true

  echo Restarting Finder, Dock, SystemUIServer...
  killall Finder
  killall Dock
  killall SystemUIServer

  echo Installing fzf...
  yes | $(brew --prefix)/opt/fzf/install
fi

echo Linking .gitignore...
ln -sf $(pwd)/gitignore $(echo $HOME)/.gitignore

echo Configuring git...
git config --global core.editor nvim
git config --global core.autocrlf input
git config --global core.excludesfile ~/.gitignore
git config --global push.default simple
git config --global --add --bool push.autoSetupRemote true
git config --global pull.rebase false
git config --global user.name $git_username
git config --global user.email $git_email
git config --global --add url."git@github.com:".insteadOf "https://github.com/" # fix issues with go get

echo Linking .tmux.conf...
mkdir -p ~/.config/tmux
ln -sf $(pwd)/tmux.conf $(echo $HOME)/.config/tmux/tmux.conf

echo Linking .config/fish/config.fish to config.fish
mkdir -p ~/.config/fish
ln -sf $(pwd)/config.fish $(echo $HOME)/.config/fish/config.fish

echo Linking .config/nvim directory to nvim
ln -sf $(pwd)/nvim $(echo $HOME)/.config/nvim

echo Linking .ideavimrc for IntelliJ...
ln -sf $(pwd)/ideavimrc $(echo $HOME)/.ideavimrc

echo Linking Zed settings...
mkdir -p ~/.config/zed
ln -sf $(pwd)/zed_settings.json $(echo $HOME)/.config/zed/settings.json

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo Linking Ghostty settings...
  mkdir -p ~/.config/ghostty
  ln -sf $(pwd)/ghostty-config $(echo $HOME)/.config/ghostty/config

  echo Linking .config/aerospace/aerospace.toml...
  mkdir -p ~/.config/aerospace
  ln -sf $(pwd)/aerospace.toml $(echo $HOME)/.config/aerospace/aerospace.toml

  echo Changing default shell to fish...
  # if fish is not in listed shells, add fish to accpted shells
  which fish | grep -qxFf /etc/shells || echo "$(which fish)" | sudo tee -a /etc/shells
  chsh -s $(which fish)
  sudo -k
fi

echo Done.
