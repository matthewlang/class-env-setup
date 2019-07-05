# COMP385 Environment Setup

Scripts to set up an environment for use in COMP385 on an [Ubuntu
Linux](https://ubuntu.org) machine.

To install, do the following:
```
git clone https://github.com/matthewlang/distributed-env-setup.git
cd distributed-env-setup
sudo ./install.sh
```

Some packages that are useful (but not necessary) can also be installed:
* Google Chrome
* [GoLand](https://www.jetbrains.com/go) is a full-featured IDE by JetBrains.
  It requires a license, but is free with a .edu email address. You'll be
  required to get a license and register at
  [jetbrains.com](https://jetbrains.com/student/).
* [Atom](https://atom.io) is an open-source editor that is highly configurable
  and has good support for go. After installing atom, open it and use its
  package manager to install [go-plus](https://atom.io/packages/go-plus).

To be prompted to install any of these, run `sudo ./optional.sh`.
