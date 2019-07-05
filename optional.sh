#!/bin/bash

echo "Optional editors and tools:"

mkdir .install_tmp

read -p "Install GoLand? [y|n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  if [ -d "/opt/GoLand-2019.1.3" ]; then
    echo "GoLand already installed..."
  else
    if [ ! -f "goland.tgz" ]; then
      curl -sSLo goland.tgz https://download.jetbrains.com/go/goland-2019.1.3.tar.gz
    fi
    tar xzf goland.tgz -C /opt/
    rm goland.tgz
    echo "alias goland='/opt/GoLand-2019.1.3/bin/goland.sh'" >> $HOME/.bashrc
  fi
fi

read -p "Install Chrome? [y|n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  curl -sSLo .install_tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  dpkg -i .install_tmp/chrome.deb
fi

read -p "Install Atom (w/o go support)? [y|n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  apt-get -y install gconf2 gconf-service
  apt --fix-broken install
  curl -sSLo .install_tmp/atom.deb https://github.com/atom/atom/releases/download/v1.38.2/atom-amd64.deb
  dpkg -i .install_tmp/atom.deb
  echo "For go support, open atom and install the go-plus package."
fi

rm -rf .install_tmp
