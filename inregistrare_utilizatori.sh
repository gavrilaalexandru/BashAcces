#!/bin/bash

iesire_bucla=false

while true; do
  read -p "Introduceți numele de utilizator dorit: " username
  verificare_username=$(echo "$username" | tr '[:upper:]' '[:lower:]')
  user=$(cut -d ',' -f 1 /home/stud1019/valentinG/proiect_so/users.csv 2>/dev/null | grep -w "$verificare_username")
  if [ "$verificare_username" == "$user" ]; then
    echo "Numele de utilizator '$username' există deja!"
  else
    break
  fi
done

while ! $iesire_bucla; do
  read -p "Introduceți adresa de e-mail: " email
  mail=$(cut -d ',' -f 2 /home/stud1019/valentinG/proiect_so/users.csv 2>/dev/null | grep -w "$email")
  if [[ "$mail" == "$email" ]]; then
    echo "Adresa de e-mail este deja folosită!"
  elif ! [[ $email =~ ^[a-zA-Z0-9.+_-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$ ]]; then
      echo "Adresa de e-mail este invalidă!"
  else
    iesire_bucla=true
  fi
done

while true; do
  read -sp "Parola dvs.: " password
  echo
  if [[ ${#password} -ge 6 && "$password" == *[A-Z]* && "$password" == *[a-z]* && "$password" == *[0-9]* ]]; then
    break
  else
    echo "Parola trebuie să aibă cel puțin 6 caractere, o literă mare, o literă mică și o cifră."
  fi
done


read -sp "Confirmați parola: " password_confirm

while [ "$password" != "$password_confirm" ]; do
  echo -e "\nParolele nu se potrivesc."
  echo -e "\nHaideți să incercăm din nou!"
  sleep 2
  read -sp "Parola dvs.: " password
  echo
  read -sp "Confirmați parola: " password_confirm
done

uid=$(uuidgen)
data=$(date +%d-%m-%Y-%H:%M:%S)

echo "$username,$email,$password,$uid,$data" >> users.csv


mkdir -p "/home/stud1019/valentinG/proiect_so/home/$username"


echo -e "\nFelicitari! Contul dvs. cu numele '$username' a fost înregistrat cu succes."

