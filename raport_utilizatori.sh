#!/bin/bash

generare_raport() {

user_home="/home/stud1019/valentinG/proiect_so/home/$1"

nr_fisiere=$(find "$user_home" -type f | wc -l)
nr_dir=$(find "$user_home" -type d | wc -l)
dim_total=$(du -sh "$user_home" | cut -f1)

echo "Raport pentru utilizatorul: $1" > /home/stud1019/valentinG/proiect_so/home/$1/raport$1.txt
echo ".............................." >> /home/stud1019/valentinG/proiect_so/home/$1/raport$1.txt
echo "Numarul de fisiere : $nr_fisiere" >> /home/stud1019/valentinG/proiect_so/home/$1/raport$1.txt
echo "Numarul de directoare : $nr_dir" >> /home/stud1019/valentinG/proiect_so/home/$1/raport$1.txt
echo "Dimensiunea totala pe disc : $dim_total" >> /home/stud1019/valentinG/proiect_so/home/$1/raport$1.txt
echo ".............................." >> /home/stud1019/valentinG/proiect_so/home/$1/raport$1.txt
}

read -p "Vă rog introduceți numele de utilizator pentru a genera raportul: " nume
user=$(cut -d ',' -f 1 /home/stud1019/valentinG/proiect_so/users.csv | grep -w "$nume")
if [ -n "$user" ]; then
    generare_raport "$nume" &
    echo "Se generează raportul..."
    sleep 3
    read -p "Raport creat cu succes! Doriți să vedeți conținutul acestuia?(y/n) " opt
    if [[ "$opt" == 'y' ]]; then
    cat /home/stud1019/valentinG/proiect_so/home/$nume/raport$nume.txt
    else
        exit 1
    fi
else
    echo "Utilizatorul nu exista!"
    exit 1;
fi
