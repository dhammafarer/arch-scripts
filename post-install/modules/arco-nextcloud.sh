#!/usr/bin/env bash

echo
echo "MODULE: ARCO-NEXTCLOUD"
echo

# ------------------------------------------------------------------------
# Cleanup
# ------------------------------------------------------------------------
rm ~/.config/ranger
rm ~/.config/pyradio
rm ~/.goldendict

# ------------------------------------------------------------------------

ln -fs /home/pawel/Nextcloud/AppData/.config/krita/* ~/.config/
ln -fs /home/pawel/Nextcloud/AppData/.config/ranger ~/.config/
ln -fs /home/pawel/Nextcloud/AppData/.config/pyradio ~/.config/

ln -fs /home/pawel/Nextcloud/AppData/.goldendict ~

# ------------------------------------------------------------------------

echo
echo "Done!"
echo
