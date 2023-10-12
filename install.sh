#!/bin/bash

# Verify that Homebrew is installed
if command -v brew &> /dev/null; then
  echo -e "✅ Homebrew is installed!"
else
  echo -e "⬇️ Downloading and installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Verify that all required software is installed via Homebrew
echo -e "\nℹ️  Downloading required software using Homebrew"
brew bundle --file=./brew/Brewfile

# Set shell correctly
chsh -s /usr/local/bin/zsh $USER
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

DIR=$(pwd)
SCRIPTS_DIR="$DIR/scripts"

# Go to the home directory
cd ~

# Begin Symlinks
echo "Linking dotfiles..."

LINKS='zshrc
gitconfig
gitignore
tmux.conf
starship.toml
vimrc'

echo
for L in $LINKS; do
  # check if the LINK exists, back up the existing version
  if [[ -e ".$L" ]]; then
	echo "Backing up .$L"
	mv ".$L" ".$L.backup"
  fi

  echo "Linking .$L"
  ln -s "$DIR/$L" ".$L"
done
echo

if [ ! -d "$SCRIPTS_DIR" ]; then
  echo "Error: The 'scripts' directory does not exist."
  exit 1
fi

# List of scripts to be executed (replace these with your script names)
SCRIPTS=("set-mac-defaults.sh" "install-oh-my-zsh.sh")

# Change the working directory to the "scripts" directory
cd "$SCRIPTS_DIR" || exit 1

# Iterate over the scripts and execute them
for script in "${SCRIPTS[@]}"; do

  # Check if the script file exists
  if [ ! -f "$script" ]; then
    echo "Warning: Script '$script' not found in the 'scripts' directory."
    continue
  fi

  # Execute the script
  echo "Executing '$script'..."
  chmod +x "$script"     # Ensure the script is executable
  "./$script"            # Execute the script
  echo "Finished executing '$script'."
done
