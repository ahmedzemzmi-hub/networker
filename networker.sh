#!/bin/bash
clear

echo "welcome to the"
echo "---(=========>  NETworker  <=========)---"
echo "the best networking tool :-)
"

main_menu() {
  echo "╭──────────────────────────────────╮"
  echo "│choose an option (1-9):           │"
  echo "│    1. perform a ping test        │"
  echo "│    2. perform an nmap scan       │"
  echo "│    3. connect to a remote host   │"
  echo "│    4. get my ip address          │"
  echo "│    5. list my interfaces         │"
  echo "│    6. show the ARP/neighbor table│"
  echo "│    7. display the routing table  │"
  echo "│    8. quit                       │"
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
  elif [ "$option" -eq 4 ]; then
    option_4
  elif [ "$option" -eq 5 ]; then
    option_5
  elif [ "$option" -eq 6 ]; then
    option_6
  elif [ "$option" -eq 7 ]; then
    option_7
  elif [ "$option" -eq 9 ]; then
    printf '\033[1B'
    echo "bye !"
    exit
  fi
}

option_1() {
  printf '\033[1B'
  echo "choose an option(1-3): "
  echo "    1. ping google.com"
  echo "    2. ping a custom target (i.e. hackclub.com)"
  echo "    3. abort "
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
    echo "invalid option"
  fi
}

option_2() {
  printf '\033[1B'
  echo "choose an option(1-5): "
  echo "    1. host discovery in the network - Ping Scan"
  echo "    2. TCP SYN scan - full handshake scan"
  echo "    3. ports service version detection - probe open ports"
  echo "    4. aggressive scan - scans for multiple stuff at the same time"
  echo "    5. abort"
  read -p "     ╰>>>> " option
  if [ "$option" -eq 1 ]; then
    read -p "enter target ip address: " target_ip_address
    nmap -sn $target_ip_address
  elif [ "$option" -eq 2 ]; then
    read -p "enter target ip address: " target_ip_address
    nmap -sT $target_ip_address
  elif [ $option -eq 3 ]; then
    read -p "enter target ip address: " target_ip_address
    nmap -sV $target_ip_address
  elif [ $option -eq 4 ]; then
    read -p "enter target ip address: " target_ip_address
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
  echo "    7. abort"
  read -p "     ╰>>>> " option
  if [ "$option" -eq 1 ]; then
    read -p "enter hostname and ip address(i.e. hostname@ip_address): " hostname_and_ip
    read -p "do you want to specify a port(y/n): " use_port
    if [ "$use_port" == y ]; then
      read -p "enter the port number here(0–65535): " port
      ssh "$hostname_and_ip" -p "$port"
    elif [ "$use_port" == n ]; then
      echo "using default port 22"
      ssh "$hostname_and_ip"
    elif ! [ "$use_port" == "n"] && ! [ "$use_port" == y ]; then
      echo "invalid input, please try again"
    fi

  elif [ "$option" -eq 2 ]; then
    read -p "enter ip address (i.e. telehack.com): " ip_address
    read -p "do you want to specify a port(y/n): " use_port
    if [ "$use_port" == y ]; then
      read -p "enter the port number here(0–65535): " port
      telnet "$ip_address" -p "$port"
    elif [ "$use_port" == n ]; then
      echo "using default port 23"
      telnet "$ip_address"
    elif ! [ "$use_port" == "n"] && ! [ "$use_port" == y ]; then
      echo "invalid input, please try again"
    fi

  elif [ "$option" -eq 3 ]; then
    echo "choose an option(): "
    echo "    1. listen on a port - server side"
    echo "    2. connect to a port - client side"
    echo "    3. test a port without sending data"
    echo "    4. scan a range of ports"
    echo "    5. UDP instead of TCP"
    echo "    6. send a file"
    echo "    7. receive a file"
    echo "    8. abort"
    read -p "     ╰>>>> " option
    if [ "$option" -eq 1 ]; then
      read -p "enter the port number (0-65535): " port
      nc -l -p "$port"

    elif [ "$option" -eq 2 ]; then
      read -p "enter the ip address (i.e. 192.168.1.1): " ip_address
      read -p "enter the port number (0-65535): " port
      nc "$ip_address" "$port"

    elif [ "$option" -eq 3 ]; then
      read -p "enter the ip address (i.e. 192.168.1.1): " ip_address
      read -p "enter the port number (0-65535): " port
      nc -z "$ip_address" "$port"

    elif [ "$option" -eq 4 ]; then
      read -p "enter the ip address (i.e. 192.168.1.1): " ip_address
      read -p "enter a range of ports (i.e. 1-1024) : " port
      nc -z "$ip_address" "$port"

    elif [ "$option" -eq 5 ]; then
      read -p "enter the ip address (i.e. 192.168.1.1): " ip_address
      read -p "enter the port number (0-65535): " port
      nc -u "$ip_address" "$port"

    elif [ "$option" -eq 6 ]; then
      read -p "enter the port number (i.e. 0-65535): " port
      read -p "enter the file name (i.e. received_file.txt): " receiver_file
      nc -l "$port" >"$receiver_file"

    elif [ "$option" -eq 7 ]; then
      read -p "enter the ip address (i.e. 192.168.1.1): " ip_address
      read -p "enter the port number (i.e. 0-65535): " port
      read -p "enter the file name to be sent (i.e. my_file.txt): " sender_file
      nc "$ip_address" "$port" <"$sender_file"

    elif [ "$option" -eq 8 ]; then
      echo "aborted"
    fi

  elif [ "$option" -eq 4 ]; then
    echo "choose a number(1-3): "
    echo "    1. start a mosh server - server side"
    echo "    2. connect to a mosh server - client side"
    echo "    3. abort"
    read -p "     ╰>>>> " option
    if [ "$option" -eq 1 ]; then
      read -p "choose a UDP port number(60000 - 61000): " port
      mosh-server new -p "$port"
    elif [ "$option" -eq 2 ]; then
      read -p "enter the mosh server ip address" ip_address
      read -p "enter the mosh server key" mosh_key
      read -p "enter the mosh server port number (60000-61000): " port
      MOSH_KEY="$mosh_key" mosh-client "$ip_address" "$port"
    elif [ "$option" -eq 3 ]; then
      echo "aborted !"
    elif ! [ "$option" -eq 1 ] && ! [ "$option" -eq 2 ] && ! [ "$option" -eq 3 ]; then
      echo "invalid input, please try again"
    fi

  elif [ "$option" -eq 5 ]; then
    echo "choose an option(1-5): "
    echo "    1. start a vnc server - server side"
    echo "    2. connect to a vnc server - client server"
    echo "    3. list vnc servers"
    echo "    4. kill vnc servers"
    echo "    5. abort"
    read -p "     ╰>>>> " option
    if [ "$option" -eq 1 ]; then
      read -p "enter vnc server password: " vnc_pass
      read -p "set resolution(i.e. 1920x1080): " vnc_res
      read -p "set color depth(i.e. 24): " vnc_depth
      read -p "localhost only(yes/no): " localhost_only
      read -p "choose vnc server display number(i.e. 1): " dis_num
      echo "$vnc_pass" | vncpasswd -f >~/.vnc/passwd
      chmod 600 ~/.vnc/passwd
      vncserver :"$dis_num" -localhost "$localhost_only" -geometry "$vnc_res" -depth "$vnc_depth"

    elif [ "$option" -eq 2 ]; then
      read -p "enter port number(i.e. 5091): " port
      read -p "enter the user and hostname(i.e. user@ip_address): " user_host
      ssh -L "$port":localhost:"$port" "$user_host"

    elif [ "$option" -eq 3 ]; then
      vncserver -list

    elif [ "$option" -eq 4 ]; then
      read -p "enter the display number(i.e. 1): " dis_num
      vncserver -kill "$dis_num"
    elif [ "$option" -eq 5 ]; then
      echo "aborted !"
    fi

  elif [ "$option" -eq 6 ]; then
    read -p "enter the user and hostname(i.e. user@ip_address): " ip_address
    read -p "do you want to specify a port number(0-65535): " port
    if [[ -z "$port" ]]; then
      sftp "$ip_address"
    else
      sftp "$ip_address" -P "$port"
    fi
  elif [ "$option" -eq 7 ]; then
    echo "aborted !"
  fi
}

option_4() {
  printf '\033[1B'
  echo "choose an option(): "
  echo "    1. show the local ip"
  echo "    2. show the public ip"
  echo "    3. abort"
  read -p "     ╰>>>> " option
  if [ "$option" -eq 1 ]; then
    ip route show | tail -n 2
  elif [ "$option" -eq 2 ]; then
    curl ifconfig.me
  elif [ "$option" -eq 3 ]; then
    echo "aborted !"
  fi
}

option_5() {
  printf '[033[1B'
  ip link
}

option_6() {
  ip neigh show
}

option_7() {
  ip route show
}
while true; do
  main_menu
done
