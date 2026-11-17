#!/bin/bash
clear

echo "welcome to the NETworker"
echo "the best netwroking tool :-)
"

main_menu() {
  echo "╭──────────────────────────────────╮"
  echo "│choose an option (1-9):           │"
  echo "│    1. perform a ping test        │"
  echo "│    2. perform an nmap scan       │"
  echo "│    3. connect to a remote host   │"
  echo "│    4. get my ip address          │"
  echo "│    5. scan the network with nmap │"
  echo "│    6. list my interfaces         │"
  echo "│    7. show the ARP/neighbor table│"
  echo "│    8. display the routing table  │"
  echo "│    9. quit                       │"
  echo "│     ╰>>>>                        │"
  echo "╰──────────────────────────────────╯"
  printf '\033[2A\033[12C'
  read option
  if [ "$option" -eq 1 ]; then
    option_1
  elif [ "$option" -eq 2 ]; then
    option_2
  fi
}

option_1() {
  printf '\033[1B'
  echo "choose an option(1-3): "
  echo "    1. ping google.com"
  echo "    2. ping a custome target (.i.e hackclub.com)"
  echo "    3. aborte "
  read -p "     ╰>>>> " option
  if [ "$option" -eq 1 ]; then
    ping -c 5 google.com

  elif [ "$option" -eq 2 ]; then
    echo "enter your targets ip address or domain: "
    read -p "                                       ╰>>>> " target
    ping -c 5 "$target"

  elif [ "$option" -eq 3 ]; then
    echo "aborted !"

  else
    echo "invalide option"
  fi
}

option_2() {
  printf '\033[1B'
  echo "choose an option(): "
  echo "    1. host discovery in the netwrok - Ping Scan"
  echo "    2. TCP SYN scan - full handshake scan"
  echo "    3. ports service vertion detection - probe open ports"
  echo "    4. aggressive scan - scans for multible stuff at the same time"
  echo "    5. aborte"
  read -p "     ╰>>>> " option
  read -p "enter target ip address: " target_ip_address
  if [ "$option" -eq 1 ]; then
    nmap -sn $target_ip_address
  elif [ "$option" -eq 2 ]; then
    nmap -sT $target_ip_address
  elif [ $option -eq 3 ]; then
    nmap -sV $target_ip_address
  elif [ $option -eq 4 ]; then
    nmap -A $target_ip_address
  elif [ $option -eq 5 ]; then
    echo "aborted !"
  fi
}

while true; do
  main_menu
done
