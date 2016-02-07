## To modify

Manuel rapide :

- Pour l'initialisation de la DB :
    1. Installer mysql-workbench.
    1. Créer un schéma appelé mydb (avec les identifiants que sur /config/database.js)
    1. Importer la base de donnée à partir d'un fichier .sql, le fichier en question est /mySQL_Model/5.2.sql

- Mise à jour des infos de connexion à la DB :
    1. Dans /mySQL_Model/xltosql.py : mettre le bon username, password et db
    1. Dans /config/database.js

Au moindre bug, envoie moi un message sur fb ou par téléphone.


## Instructions

1. Install packages: `npm install`
1. Edit the database configuration: `config/database.js`
1. Create the database schema: `node scripts/create_database.js`
1. Launch: `node server.js`
1. Visit in your browser at: `http://localhost:8080`

# Informations diverses
- Head Liste véhicule (voir fichier vehicule.sql)

- numéro de ligne :

    4
    5
    8
    10
    23
    24
    25
# Keep attention to
- python connexion informations (username, password, table name)
- Config informations : /config/database.js
- /mySQL_Model/V_N.n.sql : use "__New name of DB__"
    26
    28
    87
    90



## Fichier à lancer pour l'initialisation de la base de donnée :

- /scripts  : node create_database.js
- fichier sql : V_N.n.sql


# Keep attention to
- python connexion informations (username, password, table name)
- Config informations : /config/database.js
- /mySQL_Model/V_N.n.sql : use "__New name of DB__"
