#! /bin/bash

# Make sure we're using full paths for symlinking
if [[ -z "${DOTFILESDIR}" ]]; then
	DOTFILESDIR="$HOME/dotfiles"
fi

## tmux
ln -s "$DOTFILESDIR/.tmux/.tmux.conf" ~/.tmux.conf

## git
ln -s "$DOTFILESDIR/.gitconfig" ~/.gitconfig

## AWS Config
mkdir -p ~/.aws
stow -d ~/.aws .aws

## CLI dotfiles
ln -s "$DOTFILESDIR/.bash_aliases" ~/.bash_aliases
# Delete default created .bashrc if one exists to prevent symlink fail
rm -rf ~/.bashrc
ln -s "$DOTFILESDIR/.bashrc" ~/.bashrc
ln -s "$DOTFILESDIR/.psqlrc" ~/.psqlrc

## VS Code Config
mkdir -p ~/.vscode/extensions
stow -d ~/.vscode .vscode
