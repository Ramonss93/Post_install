#!/bin/bash

if [[ $EUID -ne 0 ]]; then
 echo "This script must be run as root" 
 exit 1
else
 #Update and Upgrade
 echo "Updating and Upgrading"
 apt-get update && sudo apt-get upgrade -y

sudo apt-get install dialog
 cmd=(dialog --separate-output --checklist "Please Select Software you want to install:" 22 76 16)
 options=(1 "Sublime Text 3" on # any option can be set to default to "on"
 2 "KeePass" on
 3 "Java" on
 4 "PyCharm Pro" on
 5 "Telegram" on
 6 "F.lux" on
 7 "Double Commander" on
 8 "Coolreader" on
 9 "SMPlayer" on
 10 "FileZilla" on
 11 "Яндекс.Браузер" on
 12 "Clementine" on
 13 "Terminator" on
 14 "Yandex Disk" on
 15 "Git" on
 16 "Reminna RDP" on)
 choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)
 clear
 for choice in $choices
 do
 case $choice in
 1)
 #Install Sublime Text 3*
 echo "     "
 echo "Installing Sublime Text"
 wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
 echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
 sudo apt-get update
 sudo apt-get install sublime-text -y
 ;;

 2)
 #Install KeePass*
 echo "     "
 echo "Installing KeePass"
 sudo add-apt-repository ppa:jtaylor/keepass
 sudo apt update
 sudo apt-get install keepass2 -y
 ;;

 3)
 #Install Java*
 echo "     "
 echo "Installing Java"
 sudo add-apt-repository ppa:webupd8team/java 
 sudo apt-get update
 sudo apt-get install oracle-java8-installer -y
 ;;

 4)
 #Install Pycharm Pro*
 echo "     "
 echo "Installing Pycharm Pro"
 sudo add-apt-repository ppa:mystic-mirage/pycharm
 sudo apt update
 sudo apt install pycharm -y
 ;;
 
 5)
 #Install Telegram
 echo "     "
 echo "Installing Telegram"
 sudo add-apt-repository ppa:atareao/telegram
 sudo apt-get update
 sudo apt-get install telegram -y
 ;;

 6)
 #Install F.lux
 echo "     "
 echo "Installing F.lux"
 sudo add-apt-repository ppa:nathan-renniewaldock/flux
 sudo apt-get update
 sudo apt-get install fluxgui -y
 ;;

 7)
 #Install Double Commander
 echo "     "
 echo "Installing Double Commander"
 sudo add-apt-repository ppa:alexx2000/doublecmd
 sudo apt update
 sudo apt install doublecmd-gtk -y
 ;;

 8)
 #Install Coolreader
 echo "   "
 echo "Installing Coolreader"
 sudo add-apt-repository ppa:linuxthebest.net/coolreader3
 sudo apt update
 sudo apt install cr3 -y
 ;;

 9)
 #Install SMPlayer
 echo "   "
 echo "Installing SMPlayer"
 sudo add-apt-repository ppa:rvm/smplayer
 sudo apt update
 sudo apt install smplayer smtube smplayer-themes smplayer-skins mpv -y
 ;;

 10)
 #Install FileZilla
 echo "   "
 echo "Installing FileZilla"
 sudo sh -c 'echo "deb http://archive.getdeb.net/ubuntu xenial-getdeb apps" >> /etc/apt/sources.list.d/getdeb.list'
 wget -q -O - http://archive.getdeb.net/getdeb-archive.key | sudo apt-key add -
 sudo apt update
 sudo apt install filezilla -y
 ;;

 11)
 #Install Яндекс.Браузер
 echo "   "
 echo "Installing Яндекс.Браузер"
 sudo nano /etc/apt/sources.list.d/yandex-browser.list
 echo "   ******   "
 echo "Insert in file "
 echo "deb [arch=amd64] http://repo.yandex.ru/yandex-browser/deb beta main"
 echo "   ******   "
 wget https://repo.yandex.ru/yandex-browser/YANDEX-BROWSER-KEY.GPG
 sudo apt-key add YANDEX-BROWSER-KEY.GPG
 sudo apt update
 sudo apt install yandex-browser-beta -y
 ;;

 12)
 #Install Clementine
 echo "   "
 echo "Installing Clementine"
 sudo add-apt-repository ppa:me-davidsansome/clementine
 sudo apt-get update
 sudo apt-get install clementine -y
 ;;

 13)
 #Install Terminator
 echo "   "
 echo " Installing Terminator"
 sudo add-apt-repository ppa:gnome-terminator/nightly-gtk3
 sudo apt update
 sudo apt install terminator python-cairo -y
 ;;

 14)
 #Install Yandex Disk
 echo "   "
 echo "Installing Yandex-disk"
 echo "deb http://repo.yandex.ru/yandex-disk/deb/ stable main" | sudo tee -a /etc/apt/sources.list.d/yandex.list > /dev/null && wget http://repo.yandex.ru/yandex-disk/YANDEX-DISK-KEY.GPG -O- | sudo apt-key add - && sudo apt-get update && sudo apt-get install -y yandex-disk
 yandex-disk setup
 ;;

 15)
 #Install Git
 echo "   "
 echo "Installing Git"
 sudo add-apt-repository ppa:git-core/ppa
 sudo apt-get update
 sudo apt-get install git -y
 ;;

 16)
 #Install Reminna
 echo "   "
 echo "Installing Reminna"
 sudo apt-get update
 sudo apt-get install remmina -y
 sudo apt-get install remmina-plugin-rdp -y
 
 ;;

 esac
 done
fi
