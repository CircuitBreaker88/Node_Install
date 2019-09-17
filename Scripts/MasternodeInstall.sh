#!/bin/bash
# Copyright (c) 2019 Node_Install. Released under the MIT License.

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=6
BACKTITLE="Node Install Setup Wizard"
TITLE="Node Install Setup"
MENU="Choose one of the following coins to install:"

OPTIONS=(1 "Altbet"
		 2 "Privix"
		 3 "Vault"
		 4 "Beacon"
		 0 "Exit Script"
)


CHOICE=$(whiptail --clear\
		--backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        0)  # Exit
		exit	
		;;

        1)	# Altbet
		cd ..
		cd Coins/Altbet
		bash MasternodeInstall.sh
        ;;

		2)	# Privix
		cd ..
		cd Coins/Privix
		bash MasternodeInstall.sh
        ;;

		3)	# Vault
		cd ..
		cd Coins/Vault
		bash MasternodeInstall.sh
        ;;

		4)	# Beacon
		cd ..
		cd Coins/Beacon
		bash MasternodeInstall.sh
        ;;
esac