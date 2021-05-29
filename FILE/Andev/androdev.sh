#!/bin/bash

blue='\e[0;34'
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'

banner(){
    clear
    echo -e ""
    echo -e "$okegreen     TB                 BT "
    echo -e "$okegreen      TB               BT "
    echo -e "$okegreen       TB             BT "
    echo -e "$okegreen        TBBBBBBBBBBBBBT "
    echo -e "$okegreen      dBBBBBBBBBBBBBBBBBb   $white  ANDROID "
    echo -e "$okegreen    dBBBBBBBBBBBBBBBBBBBBBb $white  DEVELOPING "
    echo -e "$okegreen   dBBBBb dBBBBBBBBBb dBBBBb$white  TOOLS "
    echo -e "$okegreen   MBBBBBBBBBBBBBBBBBBBBBBBM$yellow          v.1.0 "
    echo -e "$okegreen   MBBBBBBBBBBBBBBBBBBBBBBBM$red  LinuX Version "
    echo -e "$white   __   __ _  ____  ____  _  _  "
    echo -e "$white  / _\ (  ( \(    \(  __)/ )( \ "
    echo -e "$white /    \/    / ) D ( ) _) \ \/ / "
    echo -e "$white \_/\_/\_)__)(____/(____) \__/  "
    echo -e ""
}

checkdeps(){
    banner
    deplist='deps.txt'
    while read deps
    do
        if command -v $deps > /dev/null 2>&1
        then
            echo -e "$okegreen  * $deps Found"
        else
            echo -e "$red  ! $deps Not Found"
        fi
    done < $deplist
    sleep 2
    menu
}

adbinstall(){
    banner
    read -p "  Single/Multiple .apk file? (S/M) : " sm;
    if [ $sm = 'S' ] || [ $sm = 's' ]
    then
        read -p " .Apk file : " apk;
        adb install -lrtsdg $apk
    fi
    if [ $sm = 'M' ] || [ $sm = 'm' ]
    then
        read -p " .Apk files : " apk;
        adb install-multiple -lrtsdpg $apk
    fi
}

adbuninstall(){
    banner
    read -p " App package name : " app;
    adb uninstall $app
}

adbshell(){
    read -p " Command : " cmd;
    if [ $cmd = 'exit' ]
    then
        adbmenu
    fi
    adb shell $cmd
    adbshell
}

adbdevice(){
    banner
    echo -e "$okegreen  * Active device :$white"
    adb devices | grep device
    echo -e ""
    echo -e "$red  ! Unauthorized device :$white"
    adb devices | grep unauthorized
}

adbmenu(){
    banner
    echo -e "$cyan  1$red ]$white  Install apps"
    echo -e "$cyan  2$red ]$white  Uninstall apps"
    echo -e "$cyan  3$red ]$white  ADB shell"
    echo -e "$cyan  0$red ]$white  Device list"
    echo -e ""
    read -p "  adb : " act;
    if [ $act = 1 ]
    then
        adbinstall
    fi
    if [ $act = 2 ]
    then
        adbuninstall
    fi
    if [ $act = 3 ]
    then
        adbshell
    fi
    if [ $act = 4 ]
    then
        adbdevice
    fi
}

flashboot(){
    banner
    read -p " System : " sys;
    read -p " Boot : " boot;
    read -p " Recovery : " recv;
    banner
    echo -e "$red  //$white Flashing system ..."
    fastboot flash system $sys
    echo -e "$red  //$white Flashing boot ..."
    fastboot flash boot $boot
    echo -e "$red  //$white Flashing recovery ..."
    fastboot flash recovery $recv
}

extmount(){
    banner
    read -p " .img file : " img;
    read -p " Extract to : " ext;
    read -p " Mount point : " mnt;
    banner
    echo -e "$red  //$white Extracting $img to $ext ..."
    simg2img $img $ext
    if [ $(id -u) -ne 0 ]
    then
        echo -e "$red  //$white Mounting to $mnt ..."
        sudo mount -t ext4 -o loop $ext $mnt
    else
        echo -e "$red  //$white Mounting to $mnt ..."
        mount -t ext4 -o loop $ext $mnt
    fi
}

menu(){
    banner
    echo -e "$cyan  1$red ]$white  ADB Tools"
    echo -e "$cyan  2$red ]$white  Fastboot Flash"
    echo -e "$cyan  3$red ]$white  Extract & Mount .img file"
    echo -e ""
    read -p "  menu : " act;
    if [ $act = 1 ]
    then
        adbmenu
    fi
    if [ $act = 2 ]
    then
        flashboot
    fi
    if [ $act = 3 ]
    then
        extmount
    fi
}

checkdeps