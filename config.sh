sudo apt-get upgrade
newmode=`cvt 1920 1080 | grep Modeline | awk '{for (i=2; i<NF; i++) printf $i " "; print $NF}'`
addmode=`echo $newmode | awk '{print $1;}'`
xrandr --newmode $newmode
xrandr --addmode $addmode
screen=xrandr | grep " connected " | awk '{print $1;}'
xrandr --output $screen --mode 1920x1080

#VSC
echo -e "Visual Studio Code\tINSTALLING"
if  command -v code &> /dev/null
then
    echo -e '\e[1A\e[KVisual Studio Code\tALREADY INSTALLED'
else
    {
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
    } &>> config.log
    if  command -v code &> /dev/null
    then
        echo -e '\e[1A\e[KVisual Studio Code\tOK'
    else
        echo -e '\e[1A\e[KVisual Studio Code\tFAILED'
    fi
fi

#SUBLIME
echo -e "Sublime Text 3\t\tINSTALLING"
if  command -v subl &> /dev/null
then
    echo -e '\e[1A\e[KSublime Text 3\t\tALREADY INSTALLED'
else
    {
        sudo add-apt-repository ppa:webupd8team/sublime-text-3
        sudo apt-get update
        sudo apt-get install sublime-text-installer
    } &>> config.log
    if  command -v subl &> /dev/null
        then
            echo -e '\e[1A\e[KSublime Text 3\t\tOK'
        else
            echo -e '\e[1A\e[KSublime Text 3\t\tFAILED'
    fi
fi


#NOMACS
echo -e "nomacs\t\t\tINSTALLING"
if  command -v nomacs &> /dev/null
then
    echo -e '\e[1A\e[Knomacs\t\t\tALREADY INSTALLED'
else
    {
        sudo apt-get install nomacs-l10n
    } &>> config.log
    if  command -v nomacs &> /dev/null
    then
        echo -e '\e[1A\e[Knomacs\t\t\tOK'
    else
        echo -e '\e[1A\e[Knomacs\t\t\tFAILED'
    fi
fi

#KEEPASS
echo -e "Keepass 2\tINSTALLING"
if  command -v keepass2 &> /dev/null
then
    echo -e '\e[1A\e[KKeepass 2\t\tALREADY INSTALLED'
else
    {
        sudo apt-add-repository ppa:jtaylor/keepass
        sudo apt-get update
        sudo apt-get install keepass2 
    } &>> config.log
    if  command -v keepass2 &> /dev/null
    then
        echo -e '\e[1A\e[KKeepass2\tOK'
    else
        echo -e '\e[1A\e[KKeepass2\tFAILED'
    fi
fi

#WIRESHARK
echo -e "Wireshark\t\tINSTALLING"
if  command -v wireshark &> /dev/null
then
    echo -e '\e[1A\e[KWireshark\t\tALREADY INSTALLED'
else
    {
        sudo apt-get install wireshark
        sudo dpkg-reconfigure wireshark-common 
        sudo usermod -a -G wireshark $USER
    } &>> config.log
    if  command -v wireshark &> /dev/null
    then
        echo -e '\e[1A\e[KWireshark\t\tOK'
    else
        echo -e '\e[1A\e[KWireshark\t\tFAILED'
    fi
fi

#GIT
echo -e "Git\t\t\tINSTALLING"
if  command -v git &> /dev/null
then
    echo -e '\e[1A\e[KGit\t\t\tALREADY INSTALLED'
else
    {
        sudo apt-get update
        sudo apt-get install git git-core
    } &>> config.log
    echo "Git Username:"
    read gituser
    echo "Git Email (remember to use github.noreply if private mail https://github.com/settings/emails):"
    read gitemail
    echo -e '\e[1A\e[K\e[1A\e[K'
    {
        git config --global user.name $gituser
        git config --global user.email $gitemail
    } &>> config.log
    if  command -v git &> /dev/null
    then
        echo -e '\e[1A\e[KGit\t\t\tOK'
    else
        echo -e '\e[1A\e[KGit\t\t\tFAILED'
    fi
fi

#VLC
echo -e "VLC\t\t\tINSTALLING"
if  command -v vlc &> /dev/null
then
    echo -e '\e[1A\e[KVLC\t\t\tALREADY INSTALLED'
else
    {
        sudo add-apt-repository ppa:videolan/stable-daily
        sudo apt-get update
        sudo apt-get install vlc
    } &>> config.log
    if  command -v vlc &> /dev/null
    then
        echo -e '\e[1A\e[KVLC\t\t\tOK'
    else
        echo -e '\e[1A\e[KVLC\t\t\tFAILED'
    fi
fi

#HANDBRAKE
echo -e "Handbrake\t\tINSTALLING"
if  command -v handbrake &> /dev/null
then
    echo -e '\e[1A\e[KHandbrake\t\tALREADY INSTALLED'
else
    {
        sudo add-apt-repository ppa:stebbins/handbrake-releases
        sudo apt-get update
        sudo apt-get install handbrake-gtk
    } &>> config.log
    if  command -v handbrake &> /dev/null
    then
        echo -e '\e[1A\e[KHandbrake\t\tOK'
    else
        echo -e '\e[1A\e[KHandbrake\t\tFAILED'
    fi
fi

#JDK
echo -e "JDK\t\tINSTALLING"
if  command -v java &> /dev/null
then
    echo -e '\e[1A\e[KJDK\t\tALREADY INSTALLED'
else
    {
        sudo apt install default-jdk
    } &>> config.log
    if  command -v java &> /dev/null
    then
        echo -e '\e[1A\e[KJDK\t\tOK'
    else
        echo -e '\e[1A\e[KJDK\t\tFAILED'
    fi
fi

#GOLANG
echo -e "GoLang\t\t\t\tINSTALLING"
if  command -v go &> /dev/null
then
    echo -e '\e[1A\e[KGoLang\t\t\t\tALREADY INSTALLED'
else
    #Download Latest Go
    {
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
        echo "export PATH='$PATH':/usr/local/go/bin:$GOPATH/bin" >> ~/.bashrc && source ~/.bashrc
        echo "Installing dep for dependency management"
        go get -u github.com/golang/dep/cmd/dep

        # Remove Download
        rm go"${latest}".linux-amd64.tar.gz
    } &>> config.log
    if  command -v go &> /dev/null
    then
        echo -e '\e[1A\e[KGoLang\t\t\t\tOK'
    else
        echo -e '\e[1A\e[KGoLang\t\t\t\tFAILED'
    fi
fi

#PIP3
echo -e "PIP3\t\t\t\tINSTALLING"
if  command -v pip3 &> /dev/null
then
    echo -e '\e[1A\e[KPIP3\t\t\t\tALREADY INSTALLED'
else
    {
        sudo apt update
        sudo apt install python3-pip
    } &>> config.log
    if  command -v pip3 &> /dev/null
    then
        echo -e '\e[1A\e[KPIP3\t\t\t\tOK'
    else
        echo -e '\e[1A\e[KPIP3\t\t\tFAILED'
    fi
fi

#PYTHON3
echo -e "Python 3\t\tINSTALLING"
if  command -v python3 &> /dev/null
then
    echo -e '\e[1A\e[KPython 3\t\tALREADY INSTALLED'
else
    {
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
    } &>> config.log
    if  command -v python3 &> /dev/null
    then
        echo -e '\e[1A\e[KPython 3\t\tOK'
    else
        echo -e '\e[1A\e[KPython3\t\tFAILED'
    fi
fi

#BRAVE
echo -e "Brave\t\t\tINSTALLING"
if  command -v brave-browser &> /dev/null
then
    echo -e '\e[1A\e[KBrave\t\t\tALREADY INSTALLED'
else
    {
        sudo apt install apt-transport-https curl
        sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
        echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
        sudo apt update
        sudo apt install brave-browser
    } &>> config.log
    if  command -v brave-browser &> /dev/null
    then
        echo -e '\e[1A\e[KBrave\t\t\tOK'
    else
        echo -e '\e[1A\e[KBrave\t\t\tFAILED'
    fi
fi

#TOOLS
mkdir ~/Tools
cd ~/Tools

#WAFW00F
echo -e "WafW00f\tINSTALLING"
if  command -v wafw00f &> /dev/null
then
    echo -e '\e[1A\e[KWafW00f\tALREADY INSTALLED'
else
    {
        sudo git clone https://github.com/EnableSecurity/wafw00f.git
        sudo pip3 install wafw00f/
        sudo ln -s /usr/local/bin/wafw00f wafw00f
    } &>> config.log
    if  command -v wafw00f &> /dev/null
    then
        echo -e '\e[1A\e[KWafW00f\tOK'
    else
        echo -e '\e[1A\e[KWafW00f\tFAILED'
    fi
fi

#JWT_TOOl
echo -e "JWT_Tool\tINSTALLING"
if  command -v jwt_tool &> /dev/null
then
    echo -e '\e[1A\e[KJWT_Tool\tALREADY INSTALLED'
else
    {
        sudo git clone https://github.com/ticarpi/jwt_tool.git
        sudo chmod +x jwt_tool/jwt_tool.py
        sudo python3 -m pip install termcolor cprint pycryptodomex requests
        sudo cp jwt_tool/jwt_tool.py /usr/local/bin
        sudo ln -s /usr/local/bin/jwt_tool jwt_tool
    } &>> config.log
    if  command -v jwt_tool &> /dev/null
    then
        echo -e '\e[1A\e[KJWT_Tool\tOK'
    else
        echo -e '\e[1A\e[KJWT_Tool\tFAILED'
    fi
fi

#SHCHECK
echo -e "shcheck\tINSTALLING"
if  command -v shcheck &> /dev/null
then
    echo -e '\e[1A\e[Kshcheck\tALREADY INSTALLED'
else
    {
        sudo git clone https://github.com/santoru/shcheck.git
        pip3 install shcheck/
        sudo cp shcheck/shcheck.py /usr/local/bin
        sudo ln -s /usr/local/bin/shcheck.py shcheck
    } &>> config.log
    if  command -v shcheck &> /dev/null
    then
        echo -e '\e[1A\e[Kshcheck\tOK'
    else
        echo -e '\e[1A\e[Kshcheck\tFAILED'
    fi
fi

#TESTSSL.SH
echo -e "testssl.sh\tINSTALLING"
if  command -v testssl.sh &> /dev/null
then
    echo -e '\e[1A\e[testssl.sh\tALREADY INSTALLED'
else
    {
        sudo git clone --depth 1 https://github.com/drwetter/testssl.sh.git
        sudo cp testssl.sh/testssl.sh /usr/local/bin
        sudo ln -s /usr/local/bin/testssl.sh testssl.sh
    } &>> config.log
    if  command -v testssl.sh &> /dev/null
    then
        echo -e '\e[1A\e[Ktestssl.sh\tOK'
    else
        echo -e '\e[1A\e[Ktestssl.sh\tFAILED'
    fi
fi

#DOCKER
echo -e "Docker\tINSTALLING"
if  command -v docker &> /dev/null
then
    echo -e '\e[1A\e[KDocker\tALREADY INSTALLED'
else
    {
        sudo apt remove docker docker-engine docker.io containerd runc
        sudo apt update
        sudo apt-get install apt-transport-https ca-certificates curl gnupg-agent software-properties-common
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo apt-key fingerprint 0EBFCD88
        sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
        sudo apt update
        sudo apt install docker-ce docker-ce-cli containerd.io
    } &>> config.log
    if  command -v docker &> /dev/null
    then
        echo -e '\e[1A\e[KDocker\tOK'
    else
        echo -e '\e[1A\e[KDocker\tFAILED'
    fi
fi

#PACU
echo -e "Pacu\tINSTALLING"
if  command -v pacu &> /dev/null
then
    echo -e '\e[1A\e[KPacu\tALREADY INSTALLED'
else
    {
        sudo pip3 install -U pacu > /dev/null
        sudo ln -s /usr/local/bin/pacu pacu > /dev/null
    } &>> config.log

    if  command -v pacu &> /dev/null
    then
        echo -e '\e[1A\e[KPacu\tOK'
    else
        echo -e '\e[1A\e[KPacu\tFAILED'
    fi
fi

#SUBFINDER
echo -e "subfinder\tINSTALLING"
if  command -v subfinder &> /dev/null
then
    echo -e '\e[1A\e[Ksubfinder\tALREADY INSTALLED'
else
    {
        go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
        sudo mv ~/go/bin/subfinder /usr/local/bin/
        sudo ln -s /usr/local/bin/subfinder subfinder
    } &>> config.log
    if  command -v subfinder &> /dev/null
    then
        echo -e '\e[1A\e[Ksubfinder\tOK'
    else
        echo -e '\e[1A\e[Ksubfinder\tFAILED'
    fi
fi

#HTTPX
echo -e "httpx\tINSTALLING"
if  command -v httpx &> /dev/null
then
    echo -e '\e[1A\e[Khttpx\tALREADY INSTALLED'
else
    {
        go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest
        sudo mv ~/go/bin/httpx /usr/local/bin/
        sudo ln -s /usr/local/bin/httpx httpx
    } &>> config.log
    if  command -v httpx &> /dev/null
    then
        echo -e '\e[1A\e[Khttpx\tOK'
    else
        echo -e '\e[1A\e[Khttpx\tFAILED'
    fi
fi

#NUCLEI
echo -e "nuclei\tINSTALLING"
if  command -v nuclei &> /dev/null
then
    echo -e '\e[1A\e[Knuclei\tALREADY INSTALLED'
else
    {
        go install -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
        sudo mv ~/go/bin/nuclei /usr/local/bin/
        sudo ln -s /usr/local/bin/nuclei nuclei
    } &>> config.log
    if  command -v nuclei &> /dev/null
    then
        echo -e '\e[1A\e[Knuclei\tOK'
    else
        echo -e '\e[1A\e[Knuclei\tFAILED'
    fi
fi

#JSFSCAN
echo -e "JSFScan\tINSTALLING"
if  command -v jsfscan &> /dev/null
then
    echo -e '\e[1A\e[KJSFScan\tALREADY INSTALLED'
else
    {
        git clone https://github.com/KathanP19/JSFScan.sh
        sudo docker build JSFScan.sh/ -t jsfscan
        echo 'sudo docker run -it jsfscan "/bin/bash"' > /usr/local/bin/jsfscan
        sudo chmod +x /usr/local/bin/jsfscan
        sudo ln -s /usr/local/bin/jsfscan jsfscan
    } &>> config.log
    if  command -v jsfscan &> /dev/null
    then
        echo -e '\e[1A\e[KJSFScan\tOK'
    else
        echo -e '\e[1A\e[KJSFScan\tFAILED'
    fi
fi

#GOSPIDER
echo -e "GoSpider\tINSTALLING"
if  command -v gospider &> /dev/null
then
    echo -e '\e[1A\e[KGoSpider\tALREADY INSTALLED'
else
    {
        GO111MODULE=on go get -u github.com/jaeles-project/gospider
        sudo mv ~/go/bin/gospider /usr/local/bin/
        sudo ln -s /usr/local/bin/gospider gospider
    } &>> config.log
    if  command -v gospider &> /dev/null
    then
        echo -e '\e[1A\e[KGoSpider\tOK'
    else
        echo -e '\e[1A\e[KGoSpider\tFAILED'
    fi
fi

#GOBUSTER
echo -e "GoBuster\tINSTALLING"
if  command -v gobuster &> /dev/null
then
    echo -e '\e[1A\e[KGoBuster\tALREADY INSTALLED'
else
    {
        go install github.com/OJ/gobuster/v3@latest
        sudo mv ~/go/bin/gobuster /usr/local/bin/
        sudo ln -s /usr/local/bin/gobuster gobuster
    } &>> config.log
    if  command -v gobuster &> /dev/null
    then
        echo -e '\e[1A\e[KGoBuster\tOK'
    else
        echo -e '\e[1A\e[KGoBuster\tFAILED'
    fi
fi

#FFUF
echo -e "ffuf\tINSTALLING"
if  command -v ffuf &> /dev/null
then
    echo -e '\e[1A\e[Kffuf\tALREADY INSTALLED'
else
    {
        go install github.com/ffuf/ffuf@latest
        sudo mv ~/go/bin/ffuf /usr/local/bin/
        sudo ln -s /usr/local/bin/ffuf ffuf
    } &>> config.log
    if  command -v ffuf &> /dev/null
    then
        echo -e '\e[1A\e[Kffuf\tOK'
    else
        echo -e '\e[1A\e[Kffuf\tFAILED'
    fi
fi

#SQLMAP
echo -e "SQLMap\tINSTALLING"
if  command -v sqlmap &> /dev/null
then
    echo -e '\e[1A\e[KSQLMap\tALREADY INSTALLED'
else
    {
        sudo apt install sqlmap
    } &>> config.log
    if  command -v sqlmap &> /dev/null
    then
        echo -e '\e[1A\e[KSQLMap\tOK'
    else
        echo -e '\e[1A\e[KSQLMap\tFAILED'
    fi
fi

#CHERRYTREE
echo -e "CherryTree\tINSTALLING"
if  command -v cherrytree &> /dev/null
then
    echo -e '\e[1A\e[KCherryTree\tALREADY INSTALLED'
else
    {
        sudo add-apt-repository ppa:giuspen/ppa
        sudo apt update
        sudo apt install cherrytree
    } &>> config.log
    if  command -v cherrytree &> /dev/null
    then
        echo -e '\e[1A\e[KCherryTree\tOK'
    else
        echo -e '\e[1A\e[KCherryTree\tFAILED'
    fi
fi

#NMAP
echo -e "Nmap\tINSTALLING"
if  command -v nmap &> /dev/null
then
    echo -e '\e[1A\e[KNmap\tALREADY INSTALLED'
else
    {
        sudo apt install nmap
    } &>> config.log
    if  command -v nmap &> /dev/null
    then
        echo -e '\e[1A\e[KNmap\tOK'
    else
        echo -e '\e[1A\e[KNmap\tFAILED'
    fi
fi

#HASHCAT
echo -e "Hashcat\tINSTALLING"
if  command -v hashcat &> /dev/null
then
    echo -e '\e[1A\e[KHashcat\tALREADY INSTALLED'
else
    {
        sudo apt install hashcat
    } &>> config.log
    if  command -v hashcat &> /dev/null
    then
        echo -e '\e[1A\e[KHashcat\tOK'
    else
        echo -e '\e[1A\e[KHashcat\tFAILED'
    fi
fi

#JohnTheRipper
echo -e "JohnTheRipper\tINSTALLING"
if  command -v john &> /dev/null
then
    echo -e '\e[1A\e[KJohnTheRipper\tALREADY INSTALLED'
else
    {
        sudo apt install john
    } &>> config.log
    if  command -v john &> /dev/null
    then
        echo -e '\e[1A\e[KJohnTheRipper\tOK'
    else
        echo -e '\e[1A\e[KJohnTheRipper\tFAILED'
    fi
fi

#PROXYCHAINS
echo -e "Proxychains\tINSTALLING"
if  command -v proxychains &> /dev/null
then
    echo -e '\e[1A\e[KProxychains\tALREADY INSTALLED'
else
    {
        sudo apt install proxychains
    } &>> config.log
    if  command -v proxychains &> /dev/null
    then
        echo -e '\e[1A\e[KProxychains\tOK'
    else
        echo -e '\e[1A\e[KProxychains\tFAILED'
    fi
fi

#AIRCRACK-NG
echo -e "Aircrack-NG\tINSTALLING"
if  command -v aircrack-ng &> /dev/null
then
    echo -e '\e[1A\e[KAircrack-NG\tALREADY INSTALLED'
else
    {
        sudo apt install aircrack-ng
    } &>> config.log
    if  command -v aircrack-ng &> /dev/null
    then
        echo -e '\e[1A\e[KAircrack-NG\tOK'
    else
        echo -e '\e[1A\e[KAircrack-NG\tFAILED'
    fi
fi

#LINPEAS
echo -e "LinPEAS\tDOWNLOADING"
{
    git clone https://github.com/carlospolop/PEASS-ng.git
} &>> config.log
echo -e '\e[1A\e[KLinPEAS\tDONE'

#MIMIKATZ
echo -e "Mimikatz\tDOWNLOADING"
{
    git clone https://github.com/ParrotSec/mimikatz.git
} &>> config.log
echo -e '\e[1A\e[KMimikatz\tDONE'


#WORDLISTS
mkdir ~/Wordlists
cd ~/Wordlists
echo -e "Wordlists\tDOWNLOADING"
{
    git clone https://github.com/danielmiessler/SecLists.git
    git clone https://github.com/3ndG4me/KaliLists.git
} &>> config.log
echo -e '\e[1A\e[KWordlists\tDONE'

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
        echo -e "Steam\tINSTALLING"
        if  command -v steam &> /dev/null
        then
            echo -e '\e[1A\e[KSteam\tALREADY INSTALLED'
        else
            {
                sudo apt install steam
            } &>> config.log
            if  command -v steam &> /dev/null
            then
                echo -e '\e[1A\e[KSteam\tOK'
            else
                echo -e '\e[1A\e[KSteam\tFAILED'
            fi
        fi

    fi
    
    #SPOTIFY
    read -p "Do you want to install Spotify?" -n 1 -r
    echo
    if [[  $REPLY =~ ^[Yy]$ ]]
    then
        echo -e "Spotify\tINSTALLING"
        if  command -v spotify &> /dev/null
        then
            echo -e '\e[1A\e[KSpotify\tALREADY INSTALLED'
        else
            {
                curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
                echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
                sudo apt-get update && sudo apt-get install spotify-client
            } &>> config.log
            if  command -v spotify &> /dev/null
            then
                echo -e '\e[1A\e[KSpotify\tOK'
            else
                echo -e '\e[1A\e[KSpotify\tFAILED'
            fi
        fi

    fi
fi