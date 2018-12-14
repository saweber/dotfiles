#git configuration
git config --global push.default simple
git config --global user.name "Steven Weber"
git config --global user.email steven.weber@coxautoinc.com

#vim configuration
cp ~/boostrap/.vimrc ~/.vimrc

mkdir -p ~/.vim/bundle ~/.vim/autoload
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone git://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/solarized
