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
sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
cp -f ~/bootstrap/.zshrc ~/.zshrc;

if [ ! -d "~/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
  git clone https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k;
fi

if [ ! -d "~/.oh-my-zsh/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/plugins/zsh-syntax-highlighting;
fi

if [ ! -d "~/.oh-my-zsh/plugins/zsh-autosuggestions"]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions;
fi

curl -LSso ~/.purepower https://raw.githubusercontent.com/romkatv/dotfiles-public/master/.purepower;

source ~/.zshrc;

# vim configuration
echo Configuring vim...
cp -u ~/bootstrap/.vimrc ~/.vimrc;

mkdir -p ~/.vim/bundle ~/.vim/autoload;
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim;

if [ ! -d "/home/ubuntu/.vim/bundle/gruvbox" ]; then
  git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox;
fi
if [ ! -d "/home/ubuntu/.vim/bundle/nerdtree" ]; then
  git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree;
fi

# homebrew
echo Updating brew...
brew update;
echo Installing avro-tools, parquet-tools, apache-spark, neovim, tmux...
echo This will take a few moments...
brew install avro-tools parquet-tools apache-spark neovim tmux;

# change default shell
#sudo chsh -s /bin/zsh ubuntu;
# change file ownership
#sudo chown -R $(whoami) /home/ubuntu/

# npm eslint and jest
#echo Installing eslint and jest...
#sudo npm install -g jest eslint eslint-config-airbnb-base eslint-plugin-import;
