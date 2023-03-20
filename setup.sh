# install git
sudo apt update
sudo apt-get install git-all -y
git config --global user.name "Georgeton Junior"
git config --global user.email georgetonjr@gmail.com

# install zsh
sudo apt-get install zsh -y
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo usermod --shell $(which zsh) $USER

git clone https://github.com/meiokubo-zz/emoji.zsh-theme.git

mv -f ~/emoji.zsh-theme/emoji.zsh-theme ~/.oh-my-zsh

bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)" -y

sudo apt update
sudo apt install python3-dev python3-pip python3-setuptools
pip3 install thefuck --user

# criar arquivo .zshrc
while read line; do
# reading each line
echo $line >> ~/.zshrc
done < zshrc-template.txt

git clone https://github.com/zsh-users/zsh-autosuggestions \$ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# verificar melhor maneira de editar arquivo .zshrc para aplicar temas e plugins

# install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

nvm install v19.7.0
nvm alias default v19.7.0
nvm use v19.7.0

# install docker
sudo apt-get remove docker docker-engine docker.io containerd runc
sudo apt-get update

sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

sudo mkdir -m 0755 -p /etc/apt/keyrings

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# install vscode
sudo snap install snap-store
sudo snap install --classic code

# install python
sudo apt-get install python3
sudo apt-get install python3-pip

# install insomnia
echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list

sudo apt-get update
sudo apt-get install insomnia

# install java sdk main
curl -s "https://get.sdkman.io" | bash

# install sgbd mysql | postgres | mongo
sudo snap install postbird
wget https://downloads.mongodb.com/compass/mongodb-compass_1.35.0_amd64.deb
sudo dpkg -i mongodb-compass_1.35.0_amd64.deb
mongodb-compass

# install google chrome
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update
sudo apt-get install google-chrome-stable

# install discord
sudo apt install gdebi-core wget
wget -O ~/discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
sudo gdebi ~/discord.deb 
