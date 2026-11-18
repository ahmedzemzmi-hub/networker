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
  elif [ "$option" -eq 3 ]; then
    option_3
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
  echo "choose an option(1-5): "
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

option_3() {
  printf '\033[1B'
  echo "choose a protocol to connect with(1-8): "
  echo "    1. SSH"
  echo "    2. telnet"
  echo "    3. netcat"
  echo "    4. MOSH"
  echo "    5. vnc"
  echo "    6. SFTP"
  echo "    7. SCP"
  echo "    8. aborte"
  read -p "     ╰>>>> " option
  if [ "$option" -eq 1 ]; then
    read -p "enter hostname and ip address(.i.e hostname@ip_address): " hostname_and_ip
    read -p "do you want to specify a port(y/n): " use_port
    if [ "$use_port" == y ]; then
      read -p "enter the port number here(0–65535): " port
      ssh "$hostname_and_ip" -p "$port"
    elif [ "$use_port" == n ]; then
      echo "using default port 22"
      ssh "$hostname_and_ip"
    elif ! [ "$use_port" == "n"] && ! [ "$use_port" == y ]; then
      echo "invalide input, please try again"
    fi

  elif [ "$option" -eq 2 ]; then
    read -p "enter ip address (.i.e telehack.com): " ip_address
    read -p "do you want to specify a port(y/n): " use_port
    if [ "$use_port" == y ]; then
      read -p "enter the port number here(0–65535): " port
      telnet "$ip_address" -p "$port"
    elif [ "$use_port" == n ]; then
      echo "using default port 23"
      telnet "$ip_address"
    elif ! [ "$use_port" == "n"] && ! [ "$use_port" == y ]; then
      echo "invalide input, please try again"
    fi

  elif [ "$option" -eq 3 ]; then
    echo "choose an option(): "
    echo "    1. listen on a port - sever side"
    echo "    2. connect to a port - client side"
    echo "    3. test a port without sending data"
    echo "    4. scan a range of ports"
    echo "    5. UDP instead of TCP"
    echo "    6. send a file"
    echo "    7. receive a file"
    echo "    8. aborte"
  fi

}
while true; do
  main_menu
done
