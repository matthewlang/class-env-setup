# Environment Setup

Scripts to set up an environment for use in relevant classes on an [Ubuntu
Linux](https://ubuntu.org) machine.

To install, do the following:
```
git clone https://github.com/matthewlang/class-env-setup.git
cd class-env-setup
sudo ./install.sh
```

Some packages that are useful (but not necessary) can also be installed:
* Google Chrome
* [GoLand](https://www.jetbrains.com/go) is a full-featured Go IDE by
  JetBrains.
  It requires a license, but is free with a .edu email address. You'll be
  required to get a license and register at
  [jetbrains.com](https://jetbrains.com/student/).
* [CLion](https://www.jetbrains.com/clion/) is a C/C++/Rust/etc. IDE by
  JetBrains. Similar to GoLand, it requires a license, but is free with a .edu
  email address. Get a license and register at
  [jetbrains.com](https://jetbrains.com/student/).
* [Atom](https://atom.io) is an open-source editor that is highly configurable
  and has good support for go. After installing atom, open it and use its
  package manager to install [go-plus](https://atom.io/packages/go-plus) for
  Go, or [https://atom.io/packages/ide-rust] for Rust.

To be prompted to install any of these, run `sudo ./optional.sh`.
