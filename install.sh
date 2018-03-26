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
  stow "$i"
done

# Install vim Plug
echo -e "\nInstalling vim Plug ..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install docker completion
completion_dir="./zsh/completions"

echo -e "\nInstalling docker completion"
curl\
  https://raw.githubusercontent.com/docker/docker/d4c2d0c57f18a7b09be95ba62d7476f3c3c81ede/contrib/completion/zsh/_docker \
  > $completion_dir/_docker

echo -e "\nInstalling docker machine completion"
curl -L\
  https://raw.githubusercontent.com/docker/machine/v"$(docker-machine --version | tr -ds ',' ' ' |\
  awk 'NR==1{print $(3)}')/contrib/completion/zsh/_docker-machine" \
  > $completion_dir/_docker-machine

echo -e "\nInstalling docker compose completion"
curl -L\
  https://raw.githubusercontent.com/docker/compose/"$(docker-compose version --short)"/contrib/completion/bash/docker-compose\
  -o $completion_dir/_docker-compose

echo -e "\nInstalling vim-anywhere"
curl -fsSL https://raw.github.com/cknadler/vim-anywhere/master/install | bash

echo -e "\nDone!"
