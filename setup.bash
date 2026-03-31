# Update the ubuntu repositories

apt update

# Open port 53 UDP/TCP

ufw allow 53/tcp
ufw allow 53/udp

# Install bind9

apt install bind9 -y

sleep 1s

# copy named and net.local.lan files to the /etc/bind directory

cp ./named* net.local.lan /etc/bind/

# Restart bind9 service

systemctl restart bind9

sleep 1s

# Show bind9 status

systemctl status bind9
