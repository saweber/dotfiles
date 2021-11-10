#!/bin/zsh

echo git username:
read git_username;

echo git email:
read git_email;

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

echo Downloading wd Plugin...
mkdir -p ~/.zsh/wd;
git clone git@github.com:mfaerevaag/wd.git ~/.zsh/wd --depth 1;

echo Downloading docker completions...
curl -L https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/zsh/_docker-compose -o ~/.zsh/_docker-compose;
curl -L  https://raw.githubusercontent.com/docker/cli/master/contrib/completion/zsh/_docker -o ~/.zsh/_docker;

echo Downloading git completions...
curl -L https://github.com/git/git/blob/master/contrib/completion/git-completion.zsh -o ~/.zsh/_git;

echo Downloading cht.sh with completions...
curl https://cht.sh/:cht.sh > /usr/local/bin/cht.sh
chmod +x /usr/local/bin/cht.sh
curl https://cheat.sh/:zsh > ~/.zsh/_cht;

echo Installing fzf...
fzf install - $(brew --prefix)/opt/fzf/install;

echo Moving .tmux.conf to .tmux_conf.pre_bootstrap...
mv ~/.tmux.conf ~/.tmux_conf.pre_bootstrap;
echo Copying .tmux.conf...
cp -f .tmux.conf ~/.tmux.conf;

echo Moving .zshrc to .zsrhc.pre_bootstrap...
mv ~/.zshrc ~/.zshrc.pre_bootstrap;
echo Copying .zshrc...
cp -f .zshrc ~/.zshrc;

echo Moving .p10k.zsh to .p10k_zsh.pre_bootstrap...
mv ~/.p10k.zsh ~/.p10k_zsh.pre_bootstrap;
echo Copying .p10k.zsh...
cp -f .p10k.zsh ~/.p10k.zsh

echo Moving .vimrc to .vimrc.pre_bootstrap...
mv ~/.vimrc ~/.vimrc.pre_bootstrap;
echo Copying .vimrc...
cp -f .vimrc ~/.vimrc;

echo Done. Run "source ~/.zshrc" or open a new terminal.