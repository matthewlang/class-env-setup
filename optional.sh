#!/bin/bash

echo "Optional editors and tools:"

mkdir .install_tmp

read -p "Install GoLand? [y|n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  if [ -d "/opt/GoLand-2020.2.3" ]; then
    echo "GoLand already installed..."
  else
    if [ ! -f "goland.tgz" ]; then
      curl -sSLo goland.tgz https://download.jetbrains.com/go/goland-2020.2.3.tar.gz
    fi
    tar xzf goland.tgz -C /opt/
    rm goland.tgz
    sudo -u $SUDO_USER echo "alias goland='/opt/GoLand-2020.2.3/bin/goland.sh'" >> $HOME/.bashrc
    echo "To run GoLand, run goland from the terminal."
  fi
fi

read -p "Install CLion? [y|n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  if [ -d "/opt/CLion-2020.2.5" ]; then
    echo "CLion already installed..."
  else
    if [ ! -f "clion.tgz" ]; then
      curl -sSLo clion.tgz https://download.jetbrains.com/cpp/CLion-2020.2.5.tar.gz
    fi
    tar xzf clion.tgz -C /opt/
    rm clion.tgz
    sudo -u $SUDO_USER echo "alias clion='/opt/clion-2020.2.5/bin/clion.sh'" >> $HOME/.bashrc
    echo "For Rust support, open CLion and install the Rust plugin."
    echo "To run CLion, run clion from the terminal."
  fi
fi

read -p "Install Chrome? [y|n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  curl -sSLo .install_tmp/chrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  dpkg -i .install_tmp/chrome.deb
fi

read -p "Install Atom? [y|n] " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
  apt-get -y install gconf2 gconf-service
  apt --fix-broken install
  curl -sSLo .install_tmp/atom.deb https://github.com/atom/atom/releases/download/v1.53.0/atom-amd64.deb
  dpkg -i .install_tmp/atom.deb
  echo "For Go support, open atom and install the go-plus package."
  echo "For Rust support, open atom and install the ide-rust package."
fi

rm -rf .install_tmp
