#!/usr/bin/env bash

echo "===== init.sh ====="

if ! command -v brew &> /dev/null; then
  echo "installing brew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "skipping brew installation"
fi

if ! command -v git &> /dev/null; then
  echo "installing git"
  brew install git
else
  echo "skipping git installation"
fi

if [ ! -d "$HOME"/personal/dev ]; then
  if [ ! -d "$HOME"/personal ]; then
    echo "creating directory $HOME/personal"
    mkdir "$HOME"/personal
  fi
  git clone https://www.github.com/aaronjoslinwangdu/dev "$HOME"/personal/dev
  echo "cloned $HOME/personal/dev"
else
  echo "skipping cloning https://www.github.com/aaronjoslinwangdu/dev"
fi

if ! command -v xcode-select &> /dev/null; then
  echo "installing xcode-select"
  xcode-select --install
else
  echo "skipping xcode-select installation"
fi

pushd "$HOME"/personal/dev/osx > /dev/null || exit

echo ""
./apps.sh --dry
echo ""
read -r -p "run apps.sh for real? [y/N] " answer
if [[ $answer != [yY] ]]; then
  echo "did not run ./apps.sh, aborting"
  exit 0
fi
echo ""
./apps.sh

echo ""
./dotfiles.sh --dry
echo ""
read -r -p "run dotfiles.sh for real? [y/N] " answer
if [[ $answer != [yY] ]]; then
  echo "did not run ./dotfiles.sh, aborting"
  exit 0
fi
echo ""
./dotfiles.sh

popd > /dev/null || exit
