###############################################################################
# Install Apps                                                                #
###############################################################################

# Apps that are not in App Store but they are in brew
apps=(
  #openjdk@8
  #appcleaner
  #dbeaver-community
  #google-chrome
  #intellij-idea-ce
  #iterm2
  #miro
  # multipass
  #obs
  #postman
  # slack
  # sourcetree
  #visual-studio-code
  #whatsapp
  # zoom
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask ..."
for x in "${apps[@]}"
do
  echo "Installing cask - ${x} ..."
  brew install --cask --appdir="/Applications" $x
done

echo "Cleaning up brew ..."
brew cleanup