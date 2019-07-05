mkdir .install_tmp

apt-get update

# vim, git, essentials
apt-get install \
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
apt-get -y install autoconf automake libtool make g++ unzip
curl -sSLo .install_tmp/protoc.zip https://github.com/protocolbuffers/protobuf/releases/download/v3.8.0/protoc-3.8.0-linux-x86_64.zip
unzip .install_tmp/protoc.zip -x readme.txt -d /usr/local/

# golang
curl -sSLo .install_tmp/go.tgz https://dl.google.com/go/go1.12.6.linux-amd64.tar.gz
tar -C /usr/local -xzf .install_tmp/go.tgz
sudo -u $SUDO_USER echo 'export GOPATH="$HOME/go"' >> $HOME/.bashrc
sudo -u $SUDO_USER echo 'PATH="$PATH:/usr/local/go/bin:$GOPATH/bin:$HOME/.local/bin"' >> $HOME/.bashrc
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin:$GOPATH/bin:$HOME/.local/bin
go get google.golang.org/grpc
go get github.com/golang/glog
go get github.com/golang/protobuf/protoc-gen-go
go get golang.org/x/lint/golint

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
apt-get install docker-ce docker-ce-cli containerd.io

# gcloud
echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
apt-get update && apt-get install google-cloud-sdk

# vim
update-alternatives --set editor /usr/bin/vim
sudo -u $SUDO_USER cp vimrc $HOME/.vimrc
sudo -u $SUDO_USER git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
sudo -u $SUDO_USER mkdir $HOME/.vimswp
sudo -u $SUDO_USER vim +PluginInstall +qall || true
sudo -u $SUDO_USER $HOME/.vim/bundle/YouCompleteMe/install.py || true

rm -rf .install_tmp
