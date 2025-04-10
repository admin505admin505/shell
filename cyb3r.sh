#!/bin/bash

# Cybersecurity Toolkit v1.0 for Termux and Other Environments
# Author: Ethical Hacker
# Note: For educational purposes and ethical pranks only. Misuse of this script is illegal.

echo "====================================="
echo "         Cybersecurity Toolkit v1.0  "
echo "====================================="
echo "This toolkit is designed for ethical hacking, advanced web penetration testing, and harmless pranks for friends."
echo "Use responsibly and only with proper authorization."
echo ""

# Check if the user is root (Not required for Termux but good practice for other systems)
if [ "$EUID" -ne 0 ] && [ "$(uname -o)" != "Android" ]; then
  echo "Please run as root (sudo)." >&2
  exit 1
fi

# Update and install dependencies
echo "Updating system and installing dependencies..."
if command -v apt > /dev/null; then
  apt update && apt upgrade -y
  apt install -y nmap sqlmap nikto metasploit-framework curl wget hydra john dirb figlet lolcat
elif command -v pkg > /dev/null; then
  pkg update && pkg upgrade -y
  pkg install -y nmap sqlmap nikto metasploit curl wget hydra john dirb figlet toilet python ruby
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
  if command -v cmatrix > /dev/null; then
    cmatrix
  else
    echo "Installing cmatrix..."
    if command -v apt > /dev/null; then
      apt install -y cmatrix
    elif command -v pkg > /dev/null; then
      pkg install -y cmatrix
    fi
    cmatrix
  fi
}

# Function for opening random websites
random_website_prank() {
  echo "Opening a random funny website in the default browser..."
  websites=("https://theuselessweb.com/" "https://pointerpointer.com/" "https://cat-bounce.com/" "https://www.omfgdogs.com/")
  random_website=${websites[$RANDOM % ${#websites[@]}]}
  xdg-open "$random_website" || termux-open-url "$random_website"
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
  echo "16) Exit"
  echo ""
  read -rp "Enter your choice: " choice

  case $choice in
    1)
      network_scan
      ;;
    2)
      sql_injection_test
      ;;
    3)
      web_scan
      ;;
    4)
      brute_force
      ;;
    5)
      password_crack
      ;;
    6)
      directory_enum
      ;;
    7)
      download_file
      ;;
    8)
      launch_metasploit
      ;;
    9)
      run_xsstrike
      ;;
    10)
      run_wpscan
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
      echo "Exiting. Stay ethical!"
      exit 0
      ;;
    *)
      echo "Invalid choice. Please try again."
      ;;
  esac
done
