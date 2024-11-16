#!/bin/bash

incercari_logare=0

if [ -z ${logged_in_users+x} ]; then
  declare -a logged_in_users
fi


#read -p "Nume utilizator: " username

#user=$(cut -d ',' -f 1 /home/stud1019/valentinG/proiect_so/users.csv | grep -w "$username")

while true; do

  read -p "Nume utilizator: " username
  user=$(cut -d ',' -f 1 /home/stud1019/valentinG/proiect_so/users.csv 2>/dev/null | grep -w "$username")

   case "$user" in
    "$username")
      if echo "${logged_in_users[@]}" | grep -qw "$user"; then
        echo "Utilizatorul este deja logat!"
      else
        break
      fi
      read -p "Doriți să încercați din nou? (y/n) " raspuns
      if [[ "$raspuns" != "y" ]]; then
        sleep 1
        echo "Ați ales să nu continuați."
        return 1
      fi

      ;;
    *)
      echo "Utilizatorul $username nu există."
      read -p "Doriți să încercați din nou? (y/n) " raspuns
      if [[ "$raspuns" != "y" ]]; then
        sleep 1
        echo "Ați ales să nu continuați."
        return 1
      fi
      ;;

  esac

done

row=$(awk -F ',' -v user="$user" '{ if ($1 == user) { print NR } }' /home/stud1019/valentinG/proiect_so/users.csv)
# uid=$(sed -n "${row}p" /home/stud1019/valentinG/proiect_so/users.csv | cut -d ',' -f 4)

while [ $incercari_logare -lt 3 ]; do
  read -sp "Introduceți parola: " password
  echo

  pass=$(sed -n "${row}p" /home/stud1019/valentinG/proiect_so/users.csv | cut -d ',' -f 3 | grep -w "$password")
  if [[ "$pass" == "$password" ]]; then
    break
  else
    let incercari_logare++
    if [ $incercari_logare -eq 3 ]; then
    sleep 1
    echo "Ne pare rău, ați depășit numărul maxim de încercări de autentificare."
    return 1
    elif [ $incercari_logare -eq 2 ]; then
    echo "Parola este greșită! Mai aveți $((3-incercari_logare)) încercare."
    else
    echo "Parola este greșită! Mai aveți $((3-incercari_logare)) încercări."
    fi
  fi
done

logged_in_users+=("$user")

data=$(date +%d-%m-%Y-%H:%M:%S)
awk -F ',' -v user="$user" -v data="$data" 'BEGIN { OFS = FS } { if ($1 == user) { $5 = data } print }' /home/stud1019/valentinG/proiect_so/users.csv > /home/stud1019/valentinG/proiect_so/temp.csv && mv /home/stud1019/valentinG/proiect_so/temp.csv /home/stud1019/valentinG/proiect_so/users.csv


cd "/home/stud1019/valentinG/proiect_so/home/$user"
nume_din_dir=$(pwd | cut -d '/' -f 7) > /dev/null
echo "Bun venit, $user!"
