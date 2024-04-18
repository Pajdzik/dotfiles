#!/bin/bash

# Check if Homebrew is installed
if ! command -v brew &>/dev/null
then
    echo "Homebrew not installed. Installing now..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Update Homebrew and install packages
echo "Updating Homebrew..."
brew update

echo "Installing packages..."
brew install git fish

echo "Installation complete."
