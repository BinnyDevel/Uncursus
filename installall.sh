#!/bin/bash
set -euxo pipefail
if [ "$EUID" -ne 0 ]; then
    echo Please run this script as root.
    exit 1
fi
echo -e "\e[31mWelcome to Uncursus Install Script V1.2 (Stable), originally by @Yaya4_4 (Ratio him pls :pray:)\e[0m"
echo "Edited by plx"
echo "WARNING: I'M NOT RESPONSIBLE IF ANYTHING GOES WRONG"
echo "If you found a bug pls create issue and wait for fix thx"
echo "Starting..."
echo "Installing Dependency's For The Installer"
apt update
apt install unzip com.bingner.plutil zsh curl snappy -y
apt install wget -y --allow-unauthenticated
echo "Downloading And Executing Offical Procurus Script From Coolstar"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/BinnyDevel/Uncursus/new/procursus-deploy-u0.sh)"
echo "Downloading And Installing Offical Procurus Deb"
if [ ! -d "~/Documents" ]; then
    mkdir ~/Documents
fi
rm -rf ~/Documents/Uncursus
mkdir ~/Documents/Uncursus
apt update
wget https://github.com/BinnyDevel/Uncursus/blob/new/DebProcurusSystem.zip?raw=true -P ~/Documents/Uncursus/
unzip ~/Documents/Uncursus/DebProcurusSystem.zip?raw=true -d ~/Documents/Uncursus/
dpkg -i ~/Documents/Uncursus/DebProcurusSystem/*.deb
echo "Done. Create Custom Directory For Download All Files Requied. Path (~/Documents/)."
mkdir ~/Documents/Uncursus/u0
wget https://github.com/BinnyDevel/Uncursus/blob/new/DebPatch.zip?raw=true -P ~/Documents/Uncursus/
unzip "~/Documents/Uncursus/DebPatch.zip?raw=true" -d ~/Documents/Uncursus/DebPatch
rm -rf /usr/bin/cynject
wget https://apt.bingner.com/debs/1443.00/com.ex.substitute_0.1.14_iphoneos-arm.deb -P ~/Documents/Uncursus/u0
wget https://apt.bingner.com/debs/1443.00/com.saurik.substrate.safemode_0.9.6003_iphoneos-arm.deb -P ~/Documents/Uncursus/u0
echo "Done. Installing necessary debs for patch."

dpkg -i --force-all ~/Documents/Uncursus/DebPatch/us.diatr.sileorespring_1.1_iphoneos-arm.deb ~/Documents/Uncursus/DebPatch/coreutils-bin.deb ~/Documents/Uncursus/DebPatch/libssl.deb ~/Documents/Uncursus/DebPatch/lzma.deb ~/Documents/Uncursus/DebPatch/ncurses5-libs.deb ~/Documents/Uncursus/DebPatch/xz.deb ~/Documents/Uncursus/u0/*.deb
#echo "Done. Running Firmware Configuration (./firmware.sh)"
#/usr/libexec/firmware
echo "BootStrap installaions Done. The installer will now clean the installations."
rm -rf ~/Documents/Uncursus/ /etc/apt/sources.list.d/odyssey.sources
echo "All Done."
rm -rf /Aplications/Cydia.app
killall SpringBoard
