sudo apt update
sudo apt install git tmux docker.io net-tools htop apache2-utils zsh

# neovim needs both of python2 and python3.
sudo apt install python3-pip neovim
sudo pip3 install neovim
sudo apt install fzf

# perf command
sudo apt install linux-tools-common

# Node.js
sudo apt install curl 
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
nvm lts

# kubectl/Kubectx
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens
