#######
## Apt
#######
sudo apt update
sudo apt install -y apt-transport-https \
	build-essential \
	curl \
	gpg \
	guake \
	tmux \
	vim \
	wget

#######
## Postgres via Apt
#######
sudo apt install postgresql-common
sudo /usr/share/postgresql-common/pgdg/apt.postgresql.org.sh -y
sudo apt install postgresql-17 -y

#######
## Flatpak
#######
flatpak update
flatpak install -y --non-interactive flathub com.spotify.Client

#######
## Special Flowers
#######
echo -e "\n\nSPECIAL FLOWER TIME!\n\n"

## code
echo "Installing VS Code..."
if [[ -z $(which code) ]]; then
	SRC_ENTRY="deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main"
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
	echo "${SRC_ENTRY}" | sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
	rm -f packages.microsoft.gpg
	sudo apt update
	sudo apt install code -y
else 
	echo "Already installed."
fi
echo -e "$(code --version)\n"

## mise en place
echo "Installing mise en place..."

if [[ -z "$(which mise)" ]]; then
	curl https://mise.run | sh
else
	echo "Already installed."
fi
echo -e "$(~/.local/bin/mise --version)\n"

## kubectl
echo "Installing kubectl..."
if [[ -z "$(which kubectl)" ]]; then
	curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
	chmod +x kubectl
	mv kubectl ~/.local/bin/
else
	echo "Already installed."
fi
echo -e "$(kubectl version --client)\n"

## minikube
echo "Installing minikube..."

if [[ -z "$(which minikube)" ]]; then
	curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
	sudo dpkg -i minikube_latest_amd64.deb
	rm minikube_latest_amd64.deb
else
	echo "Already installed."
fi
echo -e "$(minikube version)\n"

## rust
echo "Installing rust..."

if [[ -z "$(which rustup)" ]]; then
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
	echo "Already installed."
fi
echo -e "$(cargo --version)"
echo -e "$(rustc --version)"
echo -e "$(rustup --version)\n"
