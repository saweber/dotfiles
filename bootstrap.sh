# zsh configuration
#chsh -s $(which zsh) can't change perm by default right now

#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" installed already

cp -u ~/bootstrap/.zshrc ~/.zshrc

# upgrade pip and default to python 3.6.7
pip install --upgrade pip

pyenv install 3.6.7
pyenv global 3.6.7

# git configuration
git config --global push.default simple

# vim configuration
cp -u ~/bootstrap/.vimrc ~/.vimrc

mkdir -p ~/.vim/bundle ~/.vim/autoload
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/solarized

git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

# homebrew
brew update
