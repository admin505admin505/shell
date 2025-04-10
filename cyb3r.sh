#!/bin/bash

# Cybersecurity Toolkit v2.0 for Termux and Other Environments
# Author: Ethical Hacker
# Note: For educational purposes and ethical pranks only. Misuse of this script is illegal.

echo "====================================="
echo "         Cybersecurity Toolkit v2.0  "
echo "====================================="
echo "This toolkit is designed for ethical hacking, advanced web penetration testing, and harmless pranks for friends."
echo "Use responsibly and only with proper authorization."
echo ""

# Update and install dependencies
echo "Updating system and installing dependencies..."
if command -v apt > /dev/null; then
  apt update && apt upgrade -y
  apt install -y nmap sqlmap nikto metasploit-framework curl wget hydra john dirb figlet lolcat cmatrix toilet python ruby cowsay fortune sl
elif command -v pkg > /dev/null; then
  pkg update && pkg upgrade -y
  pkg install -y nmap sqlmap nikto metasploit curl wget hydra john dirb figlet toilet python ruby cowsay fortune sl
else
  echo "Unsupported package manager. Please install required tools manually."
  exit 1
fi

# Function for harmless trolling: Random ASCII art
ascii_art_prank() {
  echo "Choose a text for your friend's terminal prank:"
  read -r prank_text
  echo "Displaying prank text in ASCII art..."
  figlet "$prank_text" | lolcat
}

# Function for random beeping sounds
beep_prank() {
  echo "Creating random beep sounds..."
  for i in {1..10}; do
    echo -e "\a"
    sleep 0.5
  done
  echo "Beep prank completed!"
}

# Function for infinite scrolling messages
infinite_message_prank() {
  echo "Enter the message to troll your friend (Ctrl+C to stop):"
  read -r message
  echo "Starting infinite message prank..."
  while true; do
    echo "$message"
    sleep 0.2
  done
}

# Function for terminal matrix effect
matrix_effect_prank() {
  echo "Creating a Matrix-style terminal effect..."
  cmatrix
}

# Function for opening random websites
random_website_prank() {
  echo "Opening a random funny website in the default browser..."
  websites=("https://theuselessweb.com/" "https://pointerpointer.com/" "https://cat-bounce.com/" "https://www.omfgdogs.com/")
  random_website=${websites[$RANDOM % ${#websites[@]}]}
  xdg-open "$random_website" || termux-open-url "$random_website"
}

# Function for cowsay prank
cowsay_prank() {
  echo "Enter a message for the cow:"
  read -r message
  cowsay "$message" | lolcat
}

# Function for fortune cookie prank
fortune_prank() {
  echo "Fetching a random fortune..."
  fortune | cowsay | lolcat
}

# Function for steam locomotive prank
train_prank() {
  echo "Watch the train go by..."
  sl
}

# Menu-driven interface
while true; do
  echo ""
  echo "Choose an option:"
  echo "1) Network Scanning (Nmap)"
  echo "2) SQL Injection Testing (SQLMap)"
  echo "3) Web Server Vulnerability Scanning (Nikto)"
  echo "4) Brute Force Attack (Hydra)"
  echo "5) Password Cracking (John the Ripper)"
  echo "6) Directory Enumeration (Dirb)"
  echo "7) Download Files (Wget)"
  echo "8) Launch Metasploit Framework"
  echo "9) Run XSStrike (XSS Scanner)"
  echo "10) Run WPScan (WordPress Vulnerability Scanner)"
  echo "11) Harmless Trolling: ASCII Art Prank"
  echo "12) Harmless Trolling: Beep Prank"
  echo "13) Harmless Trolling: Infinite Message Prank"
  echo "14) Harmless Trolling: Matrix Effect"
  echo "15) Harmless Trolling: Open Random Website"
  echo "16) Harmless Trolling: Cowsay Prank"
  echo "17) Harmless Trolling: Fortune Cookie Prank"
  echo "18) Harmless Trolling: Steam Locomotive Prank"
  echo "19) Exit"
  echo ""
  read -rp "Enter your choice: " choice

  case $choice in
    1)
      nmap
      ;;
    2)
      sqlmap
      ;;
    3)
      nikto
      ;;
    4)
      hydra
      ;;
    5)
      john
      ;;
    6)
      dirb
      ;;
    7)
      wget
      ;;
    8)
      msfconsole
      ;;
    9)
      echo "XSStrike is not pre-installed. Please download it from GitHub."
      ;;
    10)
      echo "WPScan is not pre-installed. Please download it from GitHub."
      ;;
    11)
      ascii_art_prank
      ;;
    12)
      beep_prank
      ;;
    13)
      infinite_message_prank
      ;;
    14)
      matrix_effect_prank
      ;;
    15)
      random_website_prank
      ;;
    16)
      cowsay_prank
      ;;
    17)
      fortune_prank
      ;;
    18)
      train_prank
      ;;
    19)
      echo "Exiting. Stay ethical!"
      exit 0
      ;;
    *)
      echo "Invalid choice. Please try again."
      ;;
  esac
done
