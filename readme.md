// En lançant VScode une première fois, si le fichier .env est bien renseigné, la base de donnée
// nommée 'garage' sera crée par Doctrine. Ensuite il faudra importer le fichier de sauvegarde
//'garage.sql' qui a été sauvegardé par le programme de mysql: 'mysqldump' et qui est présent à la
//racine du dossier de ce projet

// Pour la restauration de la base de donnée mysql : en super utilisateur et dans un terminal

- syntaxe : 'mysql -u root -p garage < /media/alain/Formation/garage.sql' //chemin de restauration sur mon pc qu'il faut adapter selon son arborescence ou se situe ce fichier.
  Ensuite, en local, on a accès au back-office de l'administrateur.
  Pour ce qui est des employés, voici 2 identifiacations pour se loguer.
  Employé1 : email : arthur.lampion@free.fr
  mot de passe : lampion
  Employé2 : email : thomas.rene@gmail.com
  mot de passe : thomas
  Il suffira uniquement de lancer VScode dans le terminal avec la syntaxe suivante : 'symfony serve -d' pour s'identifier soit en administrateur, soit pour un employé. 

Pour la création d'un administrateur, il faudra créer un mot de passe qui sera crypté et hasché pour des raisons de sécurité. Tout se fait dans le terminal de VScode.
Par défaut, Symfony utilise l'algorithme bcrypt avec un coût de 13. (Pour le projet d'évaluation du garage Parrot, le mot de passe a été bien simplifié --> 'parrot' : malgré sa simplicité, il sera illisible). On insérera ce mot de passe dans une requête sql lors de la création de cet administrateur. Voici comment j'ai créé l'administrateur : Mr Parrot

//Tout se fait maintenant dans un terminal (celui de VScode par exemple)

- htpasswd -nbBC 13 USER parrot // donne une suite de lettre et chiffre qui montre le cryptage
  $2y$13$l1DxGvlIie9wH2uphUBtse84uxUPGc0m7MP2d3gP064Hfh8CjsMW2 (Parrot:crypté)
- sudo su //On rentre le mot de passe pour se loguer et avoir accès au langage 'sql'
- mysql // on est maintenant en sql
- USE garage; // Utilisation de la base de donnée 'garage'
- INSERT INTO employe (nom, prenom, email, roles, password, is_admin, adresse, code_postal, ville, telephone) VALUES ('Vincent', 'Parrot', 'vincent@free.fr', '{"role": "ROLE_ADMIN"}', '$2y$13$l1DxGvlIie9wH2uphUBtse84uxUPGc0m7MP2d3gP064Hfh8CjsMW2', 1, '15 rue du garage', '31000', 'Toulouse', '02.54.36.25.21');
