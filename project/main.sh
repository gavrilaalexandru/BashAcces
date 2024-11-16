#!/bin/bash

clear

while true; do
  echo
  echo "-------------------------------"
  echo "1.Înregistrare"
  echo "2.Logare"
  echo "3.Delogare"
  echo "4.Raport"
  echo "5.Verifică utilizatori logați"
  echo "6.Verifică directorul curent"
  echo "7.Ieșire"
  echo "-------------------------------"
  echo
  read -p "Alegeți o opțiune: " optiune
  echo

  case $optiune in
        1)
            clear
            /home/stud1019/valentinG/proiect_so/inregistrare_utilizatori.sh
            ;;
        2)
            clear
	    source /home/stud1019/valentinG/proiect_so/logare_utilizatori.sh
            stare_utilizator=1
            ;;
        3)
            if [ -n ${logged_in_users+x} ]; then
                clear
                source /home/stud1019/valentinG/proiect_so/delogare_utilizatori.sh
            else
                echo "Nu sunteți logat, deci nu vă puteți deloga."
            fi
            ;;
        4)
            clear
            /home/stud1019/valentinG/proiect_so/raport_utilizatori.sh
            ;;
        5)
            clear
            if [ -n ${logged_in_users+x} ] && [ ${#logged_in_users[@]} -gt 0 ] ; then
              old_IFS=$IFS
              IFS=","
              echo "Utilizatorii logați în acest moment sunt: ${logged_in_users[*]}."
              IFS=$old_IFS
            else
              echo "Nu există utilizatori logați în acest moment."
            fi
            sleep 1
            ;;
        6)
            clear
            echo "Acum vă aflați în directorul $PWD"
            sleep 1
            ;;
        7)
	    cd /home/stud1019/valentinG/proiect_so
            break
            ;;
        *)
            echo "Opțiune invalidă."
            ;;

    esac
done

sleep 1
echo "Ați ales să ieșiți."
