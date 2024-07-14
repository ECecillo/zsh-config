#!/bin/bash

# Fonction pour demander confirmation à l'utilisateur
demander_confirmation() {
  while true; do
    read -p "Voulez-vous continuer ? (y/yes) : " choix
    case $choix in
    y | Y | yes | YES)
      break
      ;;
    *)
      echo "Veuillez entrer 'y' ou 'yes' pour continuer."
      ;;
    esac
  done
}

# ZSH Installation
# https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH

brew install zsh

# Set Zsh as default shell

chsh -s $(which zsh)

# ========= ZSH THEME ===========

# https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#meslo-nerd-font-patched-for-powerlevel10k

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip

echo "Les fonts ont étés téléchargées, veuillez les installer manuellement et charger le profile iterm2"

demander_confirmation

echo "Le script continue..."

# Install pk10

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k

# Install zsh-syntax-highlighting

brew install zsh-syntax-highlighting

echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >>${ZDOTDIR:-$HOME}/.zshrc

# Move config files to home directory

cp -r .iterm2 .oh-my-zsh iterm2_shell_integration.zsh .p10k.zsh .zshrc $PWD
cp p10k-instant-prompt-enzocecillon.zsh $PWD/.cache/

echo "Everything is ready, you can now restart your terminal ✅"

# Restard zsh

exec zsh
