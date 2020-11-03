yum install -y vim tmux git ctags cscope
cp -rf vimrc ~/.vimrc
sudo cp tmux.conf /etc/tmux.conf
mkdir -p ~/.vim/autoload/
cp plug.vim ~/.vim/autoload/

echo "Please run :PlugInstall in vim"
