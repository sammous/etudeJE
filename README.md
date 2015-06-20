# Web application for rental car company

## Coming: 
  -Database : 
	Questions :
 
	- qui remplit les fiches des v�hicules � pr�parer?
	- qui renseigne les v�hicules re�ues des clients ?
	- qui renseigne les v�hicules � transf�rer ? 
	- qui renseigne les v�hicules � r�cup�rer ?
	- qui renseigne les v�hicules � livrer ? 
	- qui renseigne les v�hicules VO/bloqu�s ?
	- lors de l'attribution des v�hicules aux op�rateurs, renseignement par nom ou par code associ� ? 
	- un op�rateur se connecte et doit renseigner des infos sur le v�hicule ou pr�voir une fiche de v�hicules qui lui sont assign�s par un pr�parateur ? 
	- 
	
	Remarques pour int�gration:
	- Base de v�hicules totale, puis attribut agence ( pour avoir les v�hicules par agence il suffit de faire un produit cart�sien)
	- Quel est le r�le de l'agence dans les process, juste pour dire que le v�hicule appartient � ? 
    
  -Typehead ( ajax search box )  :  marche pour les ids to string, mais ne prend pas de string pour le moment.
    
  -Modified process pages  :  il faut les renseigner toutes
  

## Instructions

1. Install packages: `npm install`
1. Edit the database configuration: `config/database.js`
1. Create the database schema: `node scripts/create_database.js`
1. Launch: `node server.js`
1. Visit in your browser at: `http://localhost:8080`
