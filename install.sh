# yum install -y vim tmux git ctags cscope
sudo apt-get install -y vim tmux git ctags cscope cmake python3-dev build-essential bison flex clang python  pkg-config libfmt-dev libspdlog-dev nlohmann-json3-dev libgrpc++-dev protobuf-compiler-grpc libssl-dev bear libelf-dev 
cp -rf vimrc ~/.vimrc
sudo cp tmux.conf /etc/tmux.conf
mkdir -p ~/.vim/autoload/
cp plug.vim ~/.vim/autoload/

echo "Please run :PlugInstall in vim"
echo "Please use make menuconfig & bear make to build kernel source"
