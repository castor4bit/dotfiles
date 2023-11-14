## Setup MacBook

### Generate keys and install Command Line Tools

```sh
$ ssh-keygen
$ xcode-select --install
```

### Clone dotfiles

```sh
$ git clone git@github.com:castor4bit/dotfiles.git ~/Projects/dotfiles
$ cd ~/Projects/dotfiles
```

### Set OS X preferences

```sh
$ sh ./.osx
```

* Restart (not logout) computer
* Install Xcode (from App Store)

### Agree to the Xcode license agreements

```sh
$ sudo xcodebuild -license
```

### Install Homebrew and packages

```sh
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
$ cd ~/Projects/dotfiles
$ brew tap Homebrew/bundle
$ brew bundle
```

### Install dotfiles and misc

```sh
$ cd ~/Projects/dotfiles
$ ./setup.sh
$ cp ./.zshrc.mine $HOME/.zshrc.mine

$ ./helper.sh
```

### Edit .zshenv.local

```sh
$ vi ~/.zshenv.local
---
# github
export HOMEBREW_GITHUB_API_TOKEN=
```
