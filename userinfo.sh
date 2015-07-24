#!/bin/bash
ayuda(){
 echo "Usage: $0 -[sf]
	-s	Show shell
	-p	Show Users with/without pass defined"
}
usuarios(){
 users="/etc/passwd"
 if [ "$1" == "s" ];then
  echo -e "\nUser's Homes"
  echo "-------------"
  cut -d":" -f 1,7 $users|sort
 elif [ "$1" == "p" ];then
  echo -e "\nUsers with password"
  echo "-------------------"
  grep '[!*]' /etc/shadow|cut -d":" -f1|sort
  echo -e "\nUsers without password"
  echo "----------------------"
  grep -v '[!*]' /etc/shadow|cut -d":" -f1|sort
 fi
}

#Muestra ayuda cuando no hay opciones
if [ "$#" -eq 0 ];then
 ayuda
fi

#Proceso las opciones 
while getopts ":sp" opcion;do
 case $opcion in
  s) usuarios s;;
  p) usuarios p;;
  *) ayuda;;
 esac
done

