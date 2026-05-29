
###############################################################################
# Install Apps Store App                                                      #
###############################################################################

  # Microsoft Remote Desktop
  # WiFi Explorer
  # Bear
  # Magnet
  # Trello
  # Microsoft To Do
  # Pixelmator Pro

storeapps=(
 # 494803304
 # 1091189122
 # 441258766
 # 1278508951 
 # 1274495053 
 # 1289583905
)

echo "Installing Apps from the App Store ..."
for x in "${storeapps[@]}"
do
  echo "Installing Store App - ${x} ..."
  mas install $x
done