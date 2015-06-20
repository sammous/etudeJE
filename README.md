# Web application for rental car company

## Coming: 
  -Database : 
	Questions :
 
	- qui remplit les fiches des véhicules à préparer?
	- qui renseigne les véhicules reçues des clients ?
	- qui renseigne les véhicules à transférer ? 
	- qui renseigne les véhicules à récupérer ?
	- qui renseigne les véhicules à livrer ? 
	- qui renseigne les véhicules VO/bloqués ?
	- lors de l'attribution des véhicules aux opérateurs, renseignement par nom ou par code associé ? 
	- un opérateur se connecte et doit renseigner des infos sur le véhicule ou prévoir une fiche de véhicules qui lui sont assignés par un préparateur ? 
	- 
	
	Remarques pour intégration:
	- Base de véhicules totale, puis attribut agence ( pour avoir les véhicules par agence il suffit de faire un produit cartésien)
	- Quel est le rôle de l'agence dans les process, juste pour dire que le véhicule appartient à ? 
    
  -Typehead ( ajax search box )  :  marche pour les ids to string, mais ne prend pas de string pour le moment.
    
  -Modified process pages  :  il faut les renseigner toutes
  

## Instructions

1. Install packages: `npm install`
1. Edit the database configuration: `config/database.js`
1. Create the database schema: `node scripts/create_database.js`
1. Launch: `node server.js`
1. Visit in your browser at: `http://localhost:8080`
