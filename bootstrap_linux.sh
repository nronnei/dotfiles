#! /bin/bash

## tmux
ln -s .tmux/.tmux.conf ~/.tmux.conf

## AWS Config
mkdir -p ~/.aws
stow -d ~/.aws .aws

## CLI dotfiles
ln -s .bash_aliases ~/.bash_aliases
ln -s .bashrc ~/.bashrc
ln -s .psqlrc ~/.psqlrc

## VS Code Config
mkdir -p ~/.vscode/extensions
stow -d ~/.vscode .vscode