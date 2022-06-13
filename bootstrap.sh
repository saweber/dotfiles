#!/bin/bash

echo git username:
read git_username;

echo git email:
read git_email;

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  sudo apt-get update;
  sudo apt-get install zsh build-essential;
  chsh -s /bin/zsh;
fi

echo Checking for brew...
if ! [ command -v brew &> /dev/null ] ; then
  echo Installing brew...
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)";
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zprofile; 
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)";
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi

echo Installing brew packages from Brewfile...
brew bundle;

if [[ "$OSTYPE" == "darwin"* ]]; then
  echo Instaling Mac applications...
  brew bundle --file=Brewfile-Mac;
fi

echo Configuring git...
git config --global core.editor nvim;
git config --global push.default simple;
git config --global core.autocrlf input;
git config --global user.name $git_username;
git config --global user.email $git_email;

echo Downloading docker completions...
curl -L https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/zsh/_docker-compose -o ~/.zsh/_docker-compose --create-dirs;
curl -L  https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker -o ~/.zsh/_docker --create-dirs;

echo Downloading git completions...
curl -L https://github.com/git/git/blob/master/contrib/completion/git-completion.zsh -o ~/.zsh/_git --create-dirs;

echo Downloading vim-plug...
curl -L https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs;

echo Downloading cht.sh with completions...
sudo touch /usr/local/bin/cht.sh
sudo curl -s https://cht.sh/:cht.sh | sudo tee /usr/local/bin/cht.sh
sudo chmod +x /usr/local/bin/cht.sh
curl https://cheat.sh/:zsh > ~/.zsh/_cht --create-dirs;

echo Installing fzf...
yes | $(brew --prefix)/opt/fzf/install;

echo Moving .tmux.conf to .tmux_conf.pre_bootstrap...
mv ~/.tmux.conf ~/.tmux_conf.pre_bootstrap;
echo Linking .tmux.conf...
ln .tmux.conf ~/.tmux.conf;

echo Moving .zshrc to .zsrhc.pre_bootstrap...
mv ~/.zshrc ~/.zshrc.pre_bootstrap;
echo Linking .zshrc...
ln .zshrc ~/.zshrc;

echo Moving .p10k.zsh to .p10k_zsh.pre_bootstrap...
mv ~/.p10k.zsh ~/.p10k_zsh.pre_bootstrap;
echo Linking .p10k.zsh...
ln .p10k.zsh ~/.p10k.zsh

echo Moving .init.vim to .init_vim.pre_bootstrap...
mv ~/.config/nvim/init.vim ~/.init_vim.pre_bootstrap;
echo Linking init.vim for neovim...
mkdir -p ~/.config/nvim;
ln init.vim ~/.config/nvim/init.vim;

echo Linking tmux-sessionizer...
ln tmux-sessionizer.sh ~/.tmux-sessionizer;

echo Done. Run "source ~/.zshrc" or open a new terminal.
