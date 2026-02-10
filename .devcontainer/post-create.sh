#!/bin/bash

# 1. Fix Permissions for Oh My Zsh (if needed)
sudo chown -R $(whoami) $HOME/.oh-my-zsh 2>/dev/null || true

# 2. Install Powerlevel10k Theme
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# 3. Apply the theme
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc
sed -i 's/ZSH_THEME="devcontainers"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

# 4. Install useful plugins
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc

# 5. Project Dependencies (FIXED)

# Fix 1: Don't install globally. Just use npx in the future, 
# or install locally if you really need it persistent.
# If you MUST install global tools, use sudo (but npx is cleaner).
# We will skip installing blowfish-tools globally to avoid EACCES.

# Fix 2: Only run npm install if package.json exists
if [ -f "package.json" ]; then
    echo "package.json found, installing dependencies..."
    npm install
else
    echo "No package.json found. Skipping npm install."
fi

# Run this inside the VS Code terminal to install Edge
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge-dev.list'
sudo rm microsoft.gpg
sudo apt-get update && sudo apt-get install -y microsoft-edge-stable