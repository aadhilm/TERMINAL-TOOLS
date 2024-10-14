#!/bin/bash

# Function to install packages on Termux
install_termux() {
    echo "Installing packages for Termux..."
    pkg update && pkg upgrade -y
    pkg install -y ftp netcat openssh figlet toilet cowsay nano ruby fzf ranger fortune sl traceroute net-tools htop sysstat lolcat cmatrix cbonsai neofetch oneko calcurse bmon speedtest-cli bpytop nload inxi lolcat hollywood

    echo "Installation complete for Termux."
}

# Function to install packages on Fedora
install_fedora() {
    echo "Installing packages for Fedora..."
    sudo dnf install -y ftp nc openssh-clients figlet toilet cowsay nano ruby fzf ranger fortune-mod sl traceroute net-tools htop sysstat lolcat cmatrix cbonsai neofetch oneko calcurse bmon speedtest-cli bpytop nload inxi lolcat hollywood
    echo "Installation complete for Fedora."
}

# Function to install packages on Debian
install_debian() {
    echo "Installing packages for Debian..."
    sudo apt update
    sudo apt install -y ftp netcat openssh-client figlet toilet cowsay nano ruby fzf ranger fortune-mod sl traceroute net-tools htop sysstat lolcat cmatrix cbonsai neofetch oneko calcurse bmon speedtest-cli bpytop nload inxi lolcat hollywood
    echo "Installation complete for Debian."
}

# Check the operating system
if [[ "$TERMUX_VERSION" != "" ]]; then
    install_termux
elif [[ -f /etc/fedora-release ]]; then
    install_fedora
elif [[ -f /etc/debian_version ]]; then
    install_debian
else
    echo "Unsupported Linux distribution."
    exit 1
fi
