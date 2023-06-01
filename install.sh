#!/usr/bin/env bash

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if ! [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Aborted!"
    exit 0
fi;

cd "$(dirname "${BASH_SOURCE}")"

# Ensure we are using the latest version
git pull origin main --quiet

# Copy files
cp -rT dotfiles "$HOME"

# move templates if they don't already exist
for FILE in templates/*; do
    FILE="$(basename "$FILE")"
    FROM="templates/$FILE"
    TO="$HOME/.bashrc.d/$FILE"
    if [ ! -f "$TO" ]; then
        echo "Copying template $FILE. Edit it after installation as needed."
        cp "$FROM" "$TO"
    fi
done

# run installer scripts
for FILE in scripts/*; do
  echo "Running $FILE..."
  source "$FILE"
done

echo "Dotfiles installed successfully!"
echo "Restart your shell to load the changes."
echo "    $ source ~/.bash_profile"

# Copy the source command if possible
if [ -z "$COPY_CMD" ]; then
  echo "source ~/.bash_profile" | $COPY_CMD;
fi
