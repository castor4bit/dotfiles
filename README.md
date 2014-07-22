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
* Install [MacVim-Kaoriya](https://code.google.com/p/macvim-kaoriya/)

### Agree to the Xcode license agreements

```sh
$ sudo xcodebuild -license
```

### Install Homebrew and packages

```sh
$ ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
$ cd ~/Projects/dotfiles
$ brew bundle
```

#### Install Ricty font

```sh
$ cp -f /usr/local/Library/LinkedKegs/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
$ fc-cache -vf
```

### Install dotfiles and misc

```sh
$ cd ~/Projects/dotfiles
$ ./setup.sh
$ ln -s $HOME/Projects/dotfiles/.zshrc.mine.ricotte $HOME/.zshrc.mine
$ vim -c ':NeoBundleInstall'
```

