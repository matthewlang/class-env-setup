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
