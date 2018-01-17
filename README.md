# dotfiles

The dotfiles is a long journey.

## Usage

### install

```
git clone git@github.com:asmz/dotfiles.git
cd dotfiles
make
echo $(which zsh) | sudo tee -a /etc/shells
chsh -s $(which zsh)
```

### update

```
cd dotfiles
make update
```

## Requirements
* zsh
* make
* git
* curl
* vim
* tmux

## Thanks

@bto ( https://github.com/bto/dotfiles )
