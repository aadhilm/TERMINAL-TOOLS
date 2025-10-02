#!/bin/bash

# Common package list
PACKAGES="ftp netcat openssh figlet toilet cowsay nano ruby fzf ranger fortune sl traceroute net-tools htop sysstat lolcat cmatrix cbonsai neofetch oneko calcurse bmon speedtest-cli bpytop nload inxi hollywood"

# Function to check installed packages
check_installed() {
    echo
    echo "===== Package Installation Report ====="
    local not_installed=()
    local installed=()

    for pkg in $PACKAGES; do
        if command -v $pkg >/dev/null 2>&1 || \
           dpkg -s $pkg >/dev/null 2>&1 2>/dev/null || \
           rpm -q $pkg >/dev/null 2>&1 || \
           pkg list-installed | grep -q "^$pkg"; then
            installed+=("$pkg")
        else
            not_installed+=("$pkg")
        fi
    done

    echo -e "\n✅ Installed packages:"
    printf '%s\n' "${installed[@]}"

    echo -e "\n❌ Not installed packages:"
    printf '%s\n' "${not_installed[@]}"
    echo "======================================"
}

# Function to install packages on Termux
install_termux() {
    echo "Installing packages for Termux..."
    pkg update && pkg upgrade -y
    pkg install -y $PACKAGES
    echo "Installation complete for Termux."
    check_installed
}

# Function to install packages on Fedora
install_fedora() {
    echo "Installing packages for Fedora..."
    sudo dnf install -y $PACKAGES fortune-mod nc openssh-clients
    echo "Installation complete for Fedora."
    check_installed
}

# Function to install packages on Debian
install_debian() {
    echo "Installing packages for Debian..."
    sudo apt update
    sudo apt install -y $PACKAGES fortune-mod netcat openssh-client
    echo "Installation complete for Debian."
    check_installed
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

# Final message
echo
echo -e "\033[1m Now Run bash TERMINAL-TOOLS...!!!"

