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
    26
    28
    87
    90



## Fichier à lancer pour l'initialisation de la base de donnée :

- /scripts  : node create_database.js
- fichier sql : V_N.n.sql

## To modify
- python connexion informations (username, password, table name)
- Config informations : /config/database.js
- /mySQL_Model/V_N.n.sql : use "__New name of DB__"



## Instructions

1. Install packages: `npm install`
1. Edit the database configuration: `config/database.js`
1. Create the database schema: `node scripts/create_database.js`
1. Launch: `node server.js`
1. Visit in your browser at: `http://localhost:8080`
