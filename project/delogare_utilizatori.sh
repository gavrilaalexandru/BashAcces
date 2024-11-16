#!/bin/bash

if [ -z ${logged_in_users+x} ] || [ ${#logged_in_users[@]} -eq 0 ]; then
  echo "Nu există utilizatori logați."
  return 1
fi

while true; do
  read -p "Nume utilizator pentru logout: " username
  cheie=""
  for i in "${!logged_in_users[@]}"; do
    if [[ "${logged_in_users[$i]}" = "$username" ]]; then
      cheie=$i
      break
    fi
  done
  if [ -n "$cheie" ]; then
    unset 'logged_in_users[cheie]'
    echo "Utilizatorul $username a fost scos din sesiune."
  else
    echo "Utilizatorul $username nu este logat."
  fi
  logged_in_users=("${logged_in_users[@]}")
done
