mkdir .install_tmp
cd .install_tmp

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

# protoc
apt-get -y install autoconf automake libtool make g++ unzip
curl -f sSLo ./protoc.zip https://github.com/protocolbuffers/protobuf/releases/download/v3.8.0/protoc-3.8.0-linux-x86_64.zip
unzip protoc.zip -x readme.txt -d /usr/local/

# golang
curl https://dl.google.com/go/go1.12.6.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.12.6.linux-amd64.tar.gz
echo 'export GOPATH="$HOME/go"' >> /etc/profile
echo 'PATH="$PATH:/usr/local/go/bin:$GOPATH/bin:$HOME/.local/bin"' >> /etc/profile
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
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
  "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) \
  stable"
apt-get update
apt-get install docker-ce docker-ce-cli contianerd.io

# gcloud
echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - || curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
apt-get update && apt get install google-cloud-sdk

# vim
update-alternatives --set editor /usr/bin/vim
sudo -u $USER cp vimrc $HOME/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
sudo -u $USER mkdir $HOME/.vimswp

# TODO 

vim +PluginInstall +qall || true
$HOME/.vim/bundle/YouCompleteMe/install.py || true

cd ..
rm -rf .install_tmp
