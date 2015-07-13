#TODO NOW !
- Régler le post pour ajout d'agences
- Régler le post pour ajout de parkings



- Ajouter tables en fonction des users : à transporter etc.

  Mehdi



#DONE
  Mehdi
    - Ajouter un user admin/admin : FAIT
    - régler fatal error liée au hash  : FAIT
    - Complétion automatique immat : FAIT
    - Enlever les boutons modifier/delete sur l'affichage des tables : FAIT
    - Intégrer la complétion automatique sur toutes les pages process : FAIT
    - Recherche des tables, puis une fois la table localisée, modifier ou supprimer. MODIFICATION UNIQUEMENT VIA CETTE METHODE, car plus simple pour nous et plus sécurisée : FAIT



## Infos supplémentaires


1. Le dossier mySQL_Model contient à la fois le modèle graphique et un fichier de création des tables ( texte donc ).
1. Pages à créer : traduire ce qui est mis sur les tables de la base de données ( regarder de manière graphique avec workbench, c'est plus parlant ). J'ai veillé à mettre en correspondance les ids, et les différentes informations. Les pages comporteront grosso modo les même choses ( champs de saisie, choix de G0 à G8, check boutton, date etc.. sauf si la date est réelle, dans ce cas elle est automatiquement insérée)
1. Il y a eu une inversion entre la table préparateur et opérateur à la demande du client. J'ai veillé à ce que les ids soient biens mis comme il faut, donc normalement c'est bon, mais je n'ai pas double-checké chaque table.
1. /!\ Préparateur = celui qui prépare le véhicule, donc qui fait les process checkin etc
1. /!\ Opérateur = celui qui assigne un véhicule à préparer à un préparateur
1. Ce qu'il faut comme exemple de page, la table check-in par exemple :
  -reprise des informations sur la table, et mettre un bouton de confirmation une fois la saisie terminée.
  -une fois le bouton de confirmation tapé, une fenêtre pose une question "etes vous sûr" ( comme quand on supprime une ligne de la table vehicule en page d'accueil).
  -/\-un peu plus difficile, à faire une fois les pages construites.On commence à taper l'immat, il y a une proposition dans la liste de ce qu'on a, et en choisir une impose les autres (immat => mva, etc. de même nom préparateur impose son id) Je m'en occupe vu que j'ai commencé avec un typeahead.
1. Le client veut que les comptes utilisateur soient du type prenom.nom, le mot de passe est accessible seulement pour l'administrateur, c'est lui qui le fournit ou le change.
1. J'ai écrit une fonction ( en dur avec la request ) qui renvoie les informations d'un champs une fois saisies, et le boutton confirmation cliqué. je la mets dans le git il suffira de la copier coller dans le fichier route/les différentes pages afin de dialoguer avec la base.
1. gérer le mode préparateur/opérateur/admin. donc rajouter un champs dans la table user (privilège : admin,opérateur,préparateur) et charger les pages en fonction du status.

-Head Liste véhicule (voir fichier vehicule.sql)
numéro de ligne :

4
5
8
10
23
24
25
26
28
87
90


Afficher checkin pour une immat donnée et du jour.

## Fichier à lancer pour l'initialisation de la base de donnée :

- /scripts  : node create_database.js
- fichier sql : V_2.1.sql

## Instructions

1. Install packages: `npm install`
1. Edit the database configuration: `config/database.js`
1. Create the database schema: `node scripts/create_database.js`
1. Launch: `node server.js`
1. Visit in your browser at: `http://localhost:8080`
