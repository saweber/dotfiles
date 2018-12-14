#git configuration
git config git config --global push.default simple

#vim configuration
cp ~/boostrap/.vimrc ~/.vimrc

mkdir -p ~/.vim/bundle ~/.vim/autoload
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/solarized
