#!/bin/bash
clear
printf '=%.0s' {1..70}
echo
echo Give root access to proceed.
printf '=%.0s' {1..70}
echo
echo
[ "$(whoami)" != "root" ] && exec sudo -- "$0" "$@"
clear
echo 
echo
for i in 1 2 3 4 5 6
do
function pause(){
read -s -n 1 -p "Press any key to continue.."
echo
}
clear
printf '=%.0s' {1..70}
echo
echo "'OSX-ElCap' X11 Cursor theme || Installer script created by xxmmtrtxx."
printf '=%.0s' {1..70}
echo
echo
echo "|Select Options|"
echo
printf '>%.0s' {1..35}
echo
echo "1) Check selected cursor"
echo "2) Check available cursor themes"
echo "3) Install OSX-ElCap cursor theme"
echo "4) Select cursor theme"
echo "5) Remove OSX-ElCap Cursor theme"
echo "6) Exit"
printf '<%.0s' {1..35}
echo
echo
echo "|Input Number|"
echo
read INPUT_NUMBER
case $INPUT_NUMBER in

1)
clear
printf '=%.0s' {1..70}
echo
echo "Currently selected X11 cursor theme"
printf '=%.0s' {1..70}
echo
echo
cp /usr/share/icons/default/index.theme "$(dirname ${BASH_SOURCE[0]})"
cat index.theme
rm index.theme
echo
pause “Press any key to continue…”
;;

2)
clear
printf '=%.0s' {1..70}
echo
echo "The following X11 cursor themes are installed"
printf '=%.0s' {1..70}
echo
echo
sudo update-alternatives --display x-cursor-theme
echo
echo
pause “Press any key to continue…”
;;

3)
clear
DIR="/usr/share/icons/OSX-ElCap"
  
if [ -d "$DIR" ]
then
clear
printf '=%.0s' {1..70}
echo
echo "OSX-ElCap X11 cursor theme is already installed"
printf '=%.0s' {1..70}
echo
echo
else
printf '=%.0s' {1..70}
echo
echo "Installing OSX-ElCap cursor theme"
printf '=%.0s' {1..70}
echo
sudo cp -rf OSX-ElCap/ /usr/share/icons/OSX-ElCap && sudo update-alternatives --install /usr/share/icons/default/index.theme x-cursor-theme /usr/share/icons/OSX-ElCap/cursor.theme 90
echo
echo "|Installed|"
echo
fi 
pause “Press any key to continue…”
;;

4)
clear
echo "Select X11 cursor theme then also from gnome-tweak-tool if not installed
then installer will install it for you."
printf '=%.0s' {1..72}
echo
echo
sudo  update-alternatives --config x-cursor-theme
echo
echo
printf '=%.0s' {1..70}
echo
DIR="/usr/bin/gnome-tweak-tool"
  
if [ -f "$DIR" ]
then
clear
printf '=%.0s' {1..72}
echo
echo "Note: First logout then run gnome-tweak-tool
command to select the cursor theme and then again 
logout to fully use the cursor theme."
printf '=%.0s' {1..72}
echo
echo
echo "|Enjoy the theme|"
echo
else
clear
sudo apt install gnome-tweak-tool -y
clear
printf '=%.0s' {1..72}
echo
echo "Note: First logout then run gnome-tweak-tool
command to select the cursor theme and then again 
logout to fully use the cursor theme."
printf '=%.0s' {1..72}
echo
echo
echo "|Enjoy the theme|"
echo
fi
pause “Press any key to continue…”
;;

5)
clear
DIR="/usr/share/icons/OSX-ElCap"
 if [ -d "$DIR" ]
then
clear
printf '=%.0s' {1..70}
echo
echo "Removing OSX-ElCap X11 cursor theme"
printf '=%.0s' {1..70}
echo
echo
sudo  rm -rf /usr/share/icons/OSX-ElCap
echo "|Removed|"
echo
else
printf '=%.0s' {1..70}
echo
echo "OSX-ElCap X11 cursor theme is not installed"
printf '=%.0s' {1..70}
echo
echo
fi
pause “Press any key to continue…”
;;

6)
clear
echo
echo Have a Good Day.
echo
sleep 1
break
;;

esac
done 