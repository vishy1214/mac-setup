###############################################################################
# Install Brews (CLI APPS)                                                    #
###############################################################################

brews=(
  #awscli
  #azure-cli
  docker
  docker-compose
  #git
  #go
  #helm
  # hyperkit
  #k9s
  #kompose
  #kubectx  
  #kubernetes-cli
  #mas
  # microk8s
  # minikube
  #mosh
  #node
  #protobuf
 #python
  #telepresence
  #terraform
  #terragrunt
  #warrensbox/tap/tfswitch
  #tree
  #git-credential-manager
)

echo "installing brews ..."
for x in "${brews[@]}"
do
   echo "Installing brew - ${x} ..."
   brew install $x
done

echo "Cleaning up brew ..."
brew cleanup

