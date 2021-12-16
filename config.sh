newmode=`cvt 1920 1080 | grep Modeline | awk '{for (i=2; i<NF; i++) printf $i " "; print $NF}'`
addmode=`echo $newmode | awk '{print $1;}'`
xrandr --newmode $newmode
xrandr --addmode $addmode
screen=xrandr | grep " connected " | awk '{print $1;}'
xrandr --output $screen --mode 1920x1080

#VSC
sudo apt update
sudo apt -y install wget
sudo apt update
sudo apt install apt-transport-https
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
cat  /etc/apt/sources.list.d/vscode.list
sudo apt update
sudo apt install code

#SUBLIME
sudo add-apt-repository ppa:webupd8team/sublime-text-3
sudo apt-get update
sudo apt-get install sublime-text-installer

#NOMACS
sudo apt-get install nomacs-l10n

#KEEPASS
sudo apt-add-repository ppa:jtaylor/keepass
sudo apt-get update
sudo apt-get install keepass2 

#WIRESHARK
sudo apt-get install wireshark
sudo dpkg-reconfigure wireshark-common 
sudo usermod -a -G wireshark $USER

#GIT
sudo apt-get update
sudo apt-get install git git-core
echo "Git Username:"
read gituser
echo "Git Email"
read gitemail
git config –global user.name $gituser
git config –global user.email $gitemail

#VLC
sudo add-apt-repository ppa:videolan/stable-daily
sudo apt-get update
sudo apt-get install vlc

#HANDBRAKE
sudo add-apt-repository ppa:stebbins/handbrake-releases
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install handbrake-gtk

#JDK
sudo apt install default-jdk

#GOLANG
#Download Latest Go
echo "Finding latest version of Go for AMD64..."
url="$(wget -qO- https://go.dev/dl/ | grep -oP '\/dl\/go([0-9\.]+)\.linux-amd64\.tar\.gz' | head -n 1 )"
url="https://go.dev${url}"
latest="$(echo $url | grep -oP 'go[0-9\.]+' | grep -oP '[0-9\.]+' | head -c -2 )"
latest="${latest:2}"
echo "Downloading latest Go for AMD64: ${latest}"
sudo wget --show-progress "${url}"
unset url

# Install new Go
sudo tar -C /usr/local -xzf go"${latest}".linux-amd64.tar.gz
echo "Create the skeleton for your local users go directory"
mkdir -p ~/go/{bin,pkg,src}
echo "Setting up GOPATH"
echo "export GOPATH=~/go" >> ~/.profile && source ~/.profile
echo "Setting PATH to include golang binaries"
echo "export PATH='$PATH':/usr/local/go/bin:$GOPATH/bin" >> ~/.profile && source ~/.profile
echo "Installing dep for dependency management"
go get -u github.com/golang/dep/cmd/dep

# Remove Download
rm go"${latest}".linux-amd64.tar.gz

#PIP3
sudo apt update
sudo apt install python3-pip

#PYTHON3
#Download Latest python
PYURLREGEX='https://www.python.org/ftp/python/[0-9\.]+/Python-[0-9\.]+\.tar.xz'
echo "Finding latest version of Python3 for AMD64..."
url="$(wget -qO- https://www.python.org/downloads/ | grep -oP 'https:\/\/www\.python\.org\/ftp\/python\/([0-9\.]+)\/Python-([0-9\.]+)\.tar.xz' | head -n 1 )"
latest="$(echo $url | grep -oP '[0-9\.]+' | head -c -11 )"
latest="${latest:4}"
echo "Downloading latest Go for AMD64: ${latest}"
sudo wget --show-progress "${url}"
unset url
unset PYURLREGEX

sudo tar -C /usr/local -xf Python-"${latest}".tar.xz
cd /usr/local/Python-"${latest}"/
sudo /usr/local/Python-"${latest}"/configure
sudo make -C usr/local/Python-"${latest}"/ install
cd -
rm Python-"${latest}".tar.xz
rm -r /usr/local/Python-"${latest}"

#BRAVE
sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser

#TOOLS
mkdir ~/Tools
cd ~/Tools

#WAFW00F
sudo git clone https://github.com/EnableSecurity/wafw00f.git
sudo pip3 install wafw00f/
sudo ln -s /usr/local/bin/wafw00f wafw00f

#JWT_TOOl
sudo git clone https://github.com/ticarpi/jwt_tool.git
sudo chmod +x jwt_tool/jwt_tool.py
sudo python3 -m pip install termcolor cprint pycryptodomex requests
sudo cp jwt_tool/jwt_tool.py /usr/local/bin
sudo ln -s /usr/local/bin/jwt_tool jwt_tool

#SHCHECK
sudo git clone https://github.com/santoru/shcheck.git
pip3 install shcheck/
sudo cp shcheck/shcheck.py /usr/local/bin
sudo ln -s /usr/local/bin/shcheck.py shcheck

#TESTSSL.SH
sudo git clone --depth 1 https://github.com/drwetter/testssl.sh.git
sudo cp testssl.sh/testssl.sh /usr/local/bin
sudo ln -s /usr/local/bin/testssl.sh testssl.sh

#DOCKER
sudo apt remove docker docker-engine docker.io containerd runc
sudo apt update
sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io

#PACU
sudo pip3 install -U pacu
sudo ln -s /usr/local/bin/pacu pacu

#SUBFINDER
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
sudo mv ~/go/bin/subfinder /usr/local/bin/
sudo ln -s /usr/local/bin/subfinder subfinder

#HTTPX
go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
sudo mv ~/go/bin/httpx /usr/local/bin/
sudo ln -s /usr/local/bin/httpx httpx

#NUCLEI
go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
sudo mv ~/go/bin/nuclei /usr/local/bin/
sudo ln -s /usr/local/bin/nuclei nuclei

#JSFSCAN
git clone https://github.com/KathanP19/JSFScan.sh
sudo docker build JSFScan.sh/ -t jsfscan
echo 'sudo docker run -it jsfscan "/bin/bash"' > /usr/local/bin/jsfscan
sudo chmod +x /usr/local/bin/jsfscan
sudo ln -s /usr/local/bin/jsfscan jsfscan

#GOSPIDER
GO111MODULE=on go get -u github.com/jaeles-project/gospider
sudo mv ~/go/bin/gospider /usr/local/bin/
sudo ln -s /usr/local/bin/gospider gospider

#GOBUSTER
go install github.com/OJ/gobuster/v3@latest
sudo mv ~/go/bin/gobuster /usr/local/bin/
sudo ln -s /usr/local/bin/gobuster gobuster

#FFUF
go install github.com/ffuf/ffuf@latest
sudo mv ~/go/bin/ffuf /usr/local/bin/
sudo ln -s /usr/local/bin/ffuf ffuf

#SQLMAP
sudo apt install sqlmap

#WORDLISTS
mkdir ~/Wordlists
cd ~/Wordlists

git clone https://github.com/danielmiessler/SecLists.git
git clone https://github.com/3ndG4me/KaliLists.git

#BURP
echo "REMEMBER INSTALL BURP https://portswigger.net/burp/releases"

read -p "Do you want to install extra entratainment programs?" -n 1 -r
echo
if [[  $REPLY =~ ^[Yy]$ ]]
then
    #STEAM
    read -p "Do you want to install Steam?" -n 1 -r
    echo
    if [[  $REPLY =~ ^[Yy]$ ]]
    then
        sudo apt install steam
    fi
    
    #SPOTIFY
    read -p "Do you want to install Spotify?" -n 1 -r
    echo
    if [[  $REPLY =~ ^[Yy]$ ]]
    then
        curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
        echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
        sudo apt-get update && sudo apt-get install spotify-client
    fi
fi