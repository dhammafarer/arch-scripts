echo
echo "MODULE: ARCO-SERVICES"
echo

# ------------------------------------------------------------------------
#ntpd
echo
echo "Enabling Network Time Protocol so clock will be set via the network"

sudo ntpd -qg
sudo systemctl enable ntpd.service
sudo systemctl start ntpd.service

#pcscd
echo
echo "Enabling PC/SC Smart Card Daemon Socket"

sudo systemctl enable pcscd.socket
sudo systemctl start pcscd.socket

# ------------------------------------------------------------------------

echo
echo "Done!"
echo
