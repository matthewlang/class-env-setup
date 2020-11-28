#!/bin/bash

mkdir .install_tmp
chmod 777 .install_tmp

apt-get update

# vim, git, essentials
apt-get -y install \
  build-essential \
  git \
  git-gui \
  vim \
  ctags \
  vim-gtk3 \
  python3-pip \
  curl \
  info \
  tmux \
  wget \
  cmake \
  python3 \
  vagrant 

update-alternatives --install /usr/bin/python python /usr/bin/python3 1

# protoc
if [[ ! -d "/usr/local/protoc" ]]; then
  apt-get -y install autoconf automake libtool make g++ unzip
  curl -sSLo .install_tmp/protoc.zip https://github.com/protocolbuffers/protobuf/releases/download/v3.8.0/protoc-3.14.0-linux-x86_64.zip
  unzip .install_tmp/protoc.zip -x readme.txt -d /usr/local/
fi

# golang
if [[ ! -d "/usr/local/go" ]]; then
  curl -sSLo .install_tmp/go.tgz https://dl.google.com/go/go1.15.5.linux-amd64.tar.gz
  tar -C /usr/local -xzf .install_tmp/go.tgz
  sudo -u $SUDO_USER echo 'export GOPATH="$HOME/go"' >> $HOME/.bashrc
  sudo -u $SUDO_USER echo 'PATH="$PATH:/usr/local/go/bin:$GOPATH/bin:$HOME/.local/bin"' >> $HOME/.bashrc
fi
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:$HOME/.local/bin
sudo -u $SUDO_USER mkdir $HOME/go
sudo -u $SUDO_USER /usr/local/go/bin/go get google.golang.org/grpc
sudo -u $SUDO_USER /usr/local/go/bin/go get github.com/golang/glog
sudo -u $SUDO_USER /usr/local/go/bin/go get github.com/golang/protobuf/protoc-gen-go
sudo -u $SUDO_USER /usr/local/go/bin/go get golang.org/x/lint/golint

# docker
apt-get -y install \
  apt-transport-https \
  ca-certificates \
  curl \
  gnupg-agent \
  software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"
apt-get update
apt-get -y install docker-ce docker-ce-cli containerd.io

# gcloud
echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
apt-get update && apt-get -y install google-cloud-sdk

# rust
sudo -H -u $SUDO_USER bash -c "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > .install_tmp/rust_install.sh"
chmod u+x .install_tmp/rust_install.sh
sudo -H -u $SUDO_USER bash -c ".install_tmp/rust_install.sh -y" 
sudo -u $SUDO_USER echo 'PATH="$PATH:$HOME/.cargo/bin:$PATH"' >> $HOME/.bashrc
sudo -u $SUDO_USER bash -lc 'PATH="$PATH:$HOME/.cargo/bin:$PATH" curl -L https://git.io/rustlings | bash -s $HOME/rustlings'

# vim
update-alternatives --install /usr/bin/editor editor /usr/bin/vim 100
sudo -u $SUDO_USER cp vimrc $HOME/.vimrc
sudo -u $SUDO_USER git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
sudo -u $SUDO_USER mkdir $HOME/.vimswp
sudo -u $SUDO_USER vim +PluginInstall +qall || true
sudo -u $SUDO_USER bash -lc $HOME/.vim/bundle/YouCompleteMe/install.py \
  --rust-completer --clang-completer --clangd-completer --go-completer || true

# permissions fixes
chown -R $SUDO_USER:$SUDO_USER $HOME/go
chown -R $SUDO_USER:$SUDO_USER $HOME/.cache
groupadd docker
usermod -aG docker $SUDO_USER
systemctl enable docker

rm -rf .install_tmp
