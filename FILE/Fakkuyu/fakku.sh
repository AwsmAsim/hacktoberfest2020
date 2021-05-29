#!/bin/sh

# Colors
blue='\e[1;34'
cyan='\e[1;36m'
green='\e[1;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'

# Banner
banner(){
    clear
    echo -e ""
    echo -e "$red    フ$yellowァ$greenッ$cyanク$okegreenユ$lightgreenー"
    echo -e ""
}

# Checkroot
if [[ $EUID -ne 0 ]]
then
   echo -e "$red [!]$white This script must be run as root" 
   exit 1
fi

# Menu
main(){
    echo -e ""
    echo -e "$cyan  01$red :$white Payload Generator"
    echo -e "$cyan  02$red :$white Brute Force Attack"
    echo -e "$cyan  03$red :$white Hash Tools"
    echo -e "$cyan  04$red :$white IP Tools"
    echo -e "$cyan  05$red :$white Nmap Helper"
    echo -e ""
    maincmd
}

payloadmenu(){
    echo -e ""
    echo -e "$cyan  01$red :$white Windows Payload"
    echo -e "$cyan  02$red :$white Android Payload"
    echo -e "$cyan  03$red :$white Linux Payload"
    echo -e "$cyan  04$red :$white Mac Payload"
    echo -e "$cyan  05$red :$white iOS Payload"
    echo -e ""
    echo -e "$cyan  00$red :$white Back"
    echo -e ""
    payloadcmd
}

brutemenu(){
    echo -e ""
    echo -e "$cyan  01$red :$white SSH Brute"
    echo -e "$cyan  02$red :$white FTP Brute"
    echo -e "$cyan  03$red :$white Facebook Account Brute"
    echo -e ""
    echo -e "$cyan  00$red :$white Back"
    echo -e ""
    brutecmd
}

ipmenu(){
    echo -e ""
    echo -e "$cyan  01$red :$white MTR Traceroute"
    echo -e "$cyan  02$red :$white Test Ping"
    echo -e "$cyan  03$red :$white DNS Lookup"
    echo -e "$cyan  04$red :$white Reverse DNS"
    echo -e "$cyan  05$red :$white Whois"
    echo -e "$cyan  06$red :$white Host Search"
    echo -e "$cyan  07$red :$white Autonomous System Lookup"
    echo -e "$cyan  08$red :$white Subnet Lookup"
    echo -e "$cyan  09$red :$white Shared DNS Servers"
    echo -e "$cyan  10$red :$white Geo IP Location Lookup"
    echo -e "$cyan  11$red :$white Zone Transfer Test"
    echo -e "$cyan  12$red :$white Reverse IP"
    echo -e "$cyan  13$red :$white HTTP Headers"
    echo -e "$cyan  14$red :$white Page Links"
    echo -e "$cyan  15$red :$white Nmap Port Scan\n"
    echo -e ""
    echo -e "$cyan  00$red :$white Back"
    echo -e ""
    iptoolscmd
}

# Payload
windowspayload(){
    echo -e ""
    echo -e "$cyan  01$red :$white Simple Executable File Payload"
    echo -e "$cyan  02$red :$white Installer Payload"
    echo -e ""
    echo -e "$white"
    read -p " payload/windows # " act;
    if [ $act = 1 ]
    then
        banner
        bash tools/payload/windows/exe
    elif [ $act = 2 ]
    then
        banner
        bash tools/payload/windows/installer
    else
        $act
        payloadcmd
    fi
}

androidpayload(){
    echo -e ""
    echo -e "$cyan  01$red :$white Simple .APK File Payload"
    echo -e ""
    echo -e "$white"
    read -p " payload/android # " act;
    if [ $act = 1 ]
    then
        banner
        bash tools/payload/android/apk
    else
        $act
        payloadcmd
    fi
}

# List
maincmd(){
    echo -e "$white"
    read -p " ~ # " act;
    if [ $act = 1 ]
    then
        banner
        payloadmenu
    elif [ $act = 2 ]
    then
        banner
        brutemenu
    elif [ $act = 3 ]
    then
        banner
        hashmenu
    elif [ $act = 4 ]
    then
        banner
        ipmenu
    elif [ $act = 5 ]
    then
        banner
        bash tools/nmap/nmap
    else
        $act
        maincmd
    fi
}

brutecmd(){
    echo -e "$white"
    read -p " brute # " act;
    if [ $act = 1 ]
    then
        banner
        python2 tools/brute/ssh
    elif [ $act = 2 ]
    then
        banner
        python2 tools/brute/ftp
    elif [ $act = 3 ]
    then
        banner
        python3 tools/brute/facebook
    elif [ $act = 0 ]
    then
        banner
        main
    else
        $act
        brutecmd
    fi
}

payloadcmd(){
    echo -e "$white"
    read -p " payload # " act;
    if [ $act = 1 ]
    then
        banner
        windowspayload
    elif [ $act = 2 ]
    then
        banner
        androidpayload
    elif [ $act = 3 ]
    then
        banner
        linuxpayload
    elif [ $act = 4 ]
    then
        banner
        macpayload
    elif [ $act = 5 ]
    then
        banner
        iospayload
    elif [ $act = 0 ]
    then
        banner
        main
    else
        $act
        payloadcmd
    fi
}

iptoolscmd(){
    echo -e "$white"
    read -p " ip # " act;
    if [ $act = 1 ]
    then
        banner
        bash tools/ip/mtr
    elif [ $act = 2 ]
    then
        banner
        bash tools/ip/ping
    elif [ $act = 3 ]
    then
        banner
        bash tools/ip/dnslookup
    elif [ $act = 4 ]
    then
        banner
        bash tools/ip/revdns
    elif [ $act = 5 ]
    then
        banner
        bash tools/ip/whois
    elif [ $act = 6 ]
    then
        banner
        bash tools/ip/host
    elif [ $act = 7 ]
    then
        banner
        bash tools/ip/autonom
    elif [ $act = 8 ]
    then
        banner
        bash tools/ip/subnetlookup
    elif [ $act = 9 ]
    then
        banner
        bash tools/ip/sharedns
    elif [ $act = 10 ]
    then
        banner
        bash tools/ip/geoip
    elif [ $act = 11 ]
    then
        banner
        bash tools/ip/zonetrans
    elif [ $act = 12 ]
    then
        banner
        bash tools/ip/revip
    elif [ $act = 13 ]
    then
        banner
        bash tools/ip/head
    elif [ $act = 14 ]
    then
        banner
        bash tools/ip/link
    elif [ $act = 15 ]
    then
        banner
        bash tools/ip/nmap
    elif [ $act = 0 ]
    then
        banner
        main
    else
        $act
        iptoolscmd
    fi
    
}

banner
main
