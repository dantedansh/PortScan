#!/bin/bash

#Colores
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

trap ctrl_c INT

function ctrl_c(){

	echo -e "\n${redColour}[!] Saliendo...${endColour}"
	exit 1
}


if [ $1 ]; then

	ip_address=$1

	for port in $(seq 1 65535); do
		timeout 1 bash -c "echo '' > /dev/tcp/$ip_address/$port" 2>/dev/null && echo -e "\n${yellowColour}[*] Puerto${endColour}${purpleColour} $port${endColour} ${blueColour}abierto${endColour}" &
	done; wait

else

	echo -e "\n${redColour}[!] Error, uso del script${endColour}${grayColour}: ./script.sh <ip_address>${endColour}\n"
	exit 1
fi
