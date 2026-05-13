#!/bin/sh

###############################################################################
# Load seetings file                                                     #
###############################################################################

source ./.settings 

###############################################################################
# Install Apple Dev Tools                                                     #
###############################################################################

echo "Installing xcode-stuff ..."
xcode-select --install

###############################################################################
# Install Homebrew                                                            #
###############################################################################

# Check for Homebrew, Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew ..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

echo '# Set PATH, MANPATH, etc., for Homebrew.' >> "$basepath".zprofile
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> "$basepath".zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"


###############################################################################
# Config git                                                                  #
###############################################################################

echo "Apply Git configs ..."
cp ./dotfiles/.gitignore_global ~/.gitignore_global
git config --global user.name "$name"
#git config --global user.email $email
git config --global core.excludesfile ~/.gitignore_global

###############################################################################
# Install Oh My ZSH                                                           #
###############################################################################

# Check for Oh My ZSH, Install if we don't have it
if test ! $(which upgrade_oh_my_zsh); then
  echo "Installing Oh My ZSH ..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

echo "Setting ZSH as shell ..."
chsh -s /bin/zsh

# Install Oh My ZSH customer plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
# Install Oh My ZSH customer theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Change default theme
echo "Change defualt Oh My ZSH Theme in ~/.zshrc file ..."
sed -i '.zshrc' 's;ZSH_THEME="robbyrussell";ZSH_THEME="powerlevel10k/powerlevel10k";g' ~/.zshrc

# Enable oh my zsh plugins
# nano ~/.zshrc find plugins=(git) replace with plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
echo "Add Oh My ZSH plugins to the ~/.zshrc file ..."
sed -i '.zshrc' 's/plugins=(git)/plugins=(git docker docker-compose brew aws kubectl zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc

# Add Aliases into your zshrc file
echo "Adding Aliases the ~/.zshrc file ..."
if grep -xqF 'alias ll="ls -la"' ~/.zshrc
then 
  echo "Alias already exists!!!"
else
  echo 'alias ll="ls -la"' >> ~/.zshrc
fi

###############################################################################
# minikube configs                                                            #
###############################################################################

# minikube config set cpus 4
# minikube config set memory 8g


# minikube start --driver=hyperkit --container-runtime=docker
# eval $(minikube docker-env)
