#!/usr/bin/env bash
INSTALLDIR=$PWD

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Backup up current files.$(tput sgr 0)"
echo "---------------------------------------------------------"

# Backup files that are provided by the Jarvis into a ~/$INSTALLDIR-backup directory
BACKUP_DIR=$INSTALLDIR/backup

set -e # Exit immediately if a command exits with a non-zero status.

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Creating backup directory at $BACKUP_DIR.$(tput sgr 0)"
echo "---------------------------------------------------------"
mkdir -p $BACKUP_DIR

files=( "$HOME/.config/nvim" "$HOME/.zshrc" "$HOME/.tmux.conf" "$HOME/.config/zsh" "$HOME/.ideavimrc")
for filename in "${files[@]}"; do
    echo $filename
    if [ ! -L $filename ]; then
      echo "---------------------------------------------------------"
      echo "$(tput setaf 2)JARVIS: Backing up $filename.$(tput sgr 0)"
      echo "---------------------------------------------------------"
      if [ -d $filename ]; then
        echo "$(tput setaf 2)JARVIS: Moving $filename.$(tput sgr 0)"
        mv $filename $BACKUP_DIR
      fi
    else
      echo "---------------------------------------------------------"
      echo -e "$(tput setaf 3)JARVIS: $filename does not exist at this location or is a symlink.$(tput sgr 0)"
      echo "---------------------------------------------------------"
      rm -f $filename
    fi
done

echo "---------------------------------------------------------"
echo "$(tput setaf 2)JARVIS: Backup completed.$(tput sgr 0)"
echo "---------------------------------------------------------"
