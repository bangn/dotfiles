#!/usr/bin/env bash

set -eu

# Update submodules.
echo -e "Update submodules"
git submodule update --init

# Install brew
if ! command -v brew && [[ $(uname) == "Darwin" ]]; then
  echo "Installing brew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install stow if it does not exist.
if ! command -v stow && [[ $(uname) == "Darwin" ]]; then
  echo -e "\nInstalling stow..."
  brew install stow
fi

# Use stow to install packages.
echo -e "\nInstalling packages"
for i in  */; do
  echo "Stowing $i ..."
  stow -R "$i"
done

# Install vim Plug
echo -e "\nInstalling vim Plug ..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
