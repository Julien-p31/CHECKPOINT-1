#!/bin/bash

# Check de la présence des arguments dans le script
if [ $# -eq 0 ];
then
      echo "Il manque les noms d'utilisateurs en argument - Fin du script"
      exit 1
fi

# Création des utilisateurs avec une boucle
for users in "$@";
do
    if cat /etc/passwd | grep -a "^$users:";
    then
          echo "L'utilisateur $users existe déjà"
    else
          # Création de l'utilisateur
          useradd $users

          # Vérification si l'utilisateur a bien été créer
    if [ $? -eq 0 ];
    then
          echo "L'utilisateur $users a été crée"
    else
          echo "Erreur à la création de l'utilisateur $users"
    fi
fi
done
