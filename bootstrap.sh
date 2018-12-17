#zsh configuration
#chsh -s $(which zsh) can't change perm by default right now

#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" installed already

cp -u ~/bootstrap/.zshrc ~/.zshrc

#git configuration
git config --global push.default simple
git config --global user.name "Steven Weber"
git config --global user.email steven.weber@coxautoinc.com

#vim configuration
cp -u ~/bootstrap/.vimrc ~/.vimrc

mkdir -p ~/.vim/bundle ~/.vim/autoload
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/solarized

git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
