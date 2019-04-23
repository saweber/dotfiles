# zsh configuration
#echo Configuring zsh...
#sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
#cp -f ~/bootstrap/.zshrc ~/.zshrc;
#sudo chsh -s /bin/zsh ubuntu;

# upgrade pip and default to python 3.6.7
#echo Upgrading pip and installing pyenv 3.7.0...
#pip install --upgrade pip;

#pyenv install 3.7.0;
#pyenv global 3.7.0;

# git configuration
echo Configuring git...
git config --global push.default simple;

echo git username:
read git_username;
git config --global user.name $git_username;

echo git email:
read git_email;
git config --global user.email $git_email;

# vim configuration
echo Configuring vim...
cp -u ~/bootstrap/.vimrc ~/.vimrc;

mkdir -p ~/.vim/bundle ~/.vim/autoload;
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim;

if [ ! -d "/home/ubuntu/.vim/bundle/solarized" ]; then
  git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/solarized;
fi
if [ ! -d "/home/ubuntu/.vim/bundle/nerdtree" ]; then
  git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree;
fi
if [ ! -d "/home/ubuntu/.vim/bundle/monokai" ]; then
  git clone https://github.com/sickill/vim-monokai.git ~/.vim/bundle/monokai;
fi

# homebrew
echo Updating brew...
brew update;
echo Installing avro-tools, parquet-tools, apache-spark, neovim, tmux...
brew install avro-tools parquet-tools apache-spark neovim tmux;

# npm eslint and jest
#echo Installing eslint and jest...
#sudo npm install -g jest eslint eslint-config-airbnb-base eslint-plugin-import;

