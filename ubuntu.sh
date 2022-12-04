sudo apt update
sudo apt install git tmux docker.io net-tools htop apache2-utils zsh curl wget

# neovim needs both of python2 and python3.
sudo apt install python3-pip neovim
sudo pip3 install neovim
sudo apt install fzf

# perf command
sudo apt install linux-tools-common

# kubectl/Kubectx
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

# Golang
sudo apt install golang

# Csharp .NET(6.0)
# https://docs.microsoft.com/en-us/dotnet/core/install/linux-ubuntu
# Change the version number(22.04) based on the ubuntu version you are using
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-6.0

# jq command 
# https://stedolan.github.io/jq/
sudo apt install jq
