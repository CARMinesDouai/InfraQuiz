# InfraQuiz

# Install

## Pharo 

- Pharo 7 - 64bits
- Seaside : https://github.com/seasidest/seaside

## Pré-Requis

### Installation

- Installer Seaside :

```Smalltalk
Metacello new
    baseline:'Seaside3';
    repository: 'github://SeasideSt/Seaside:master/repository';
    load
```
- Installer Bootstrap depuis le Catalog Browser

- Installer OSProcess (Ce paquet permet d'interagir avec le système où est exécuté le serveur):

```Smalltalk
Gofer new
	squeaksource: 'OSProcess';
	package: 'OSProcess';
	load.
```

## Application

### Installation

- Importer le fichier InfraQuiz.st dans votre image Pharo. (Le code est commenté pour expliquer chaque fonction)

### Utilisation

- Vous pouvez saisir une ou plusieurs instructions Pharo dans le formulaire.
- Pour exécuter votre saisie, il suffit de cliquer sur le bouton Valider.
- La page affiche l'ensemble de vos saisies passées ainsi que le dernier résultat de vos saisies.
- Le résultat correspond à un printIt.
- Si une erreur a lieu, elle sera affichée dans la partie Résultat.
- Vous pouvez réinitialiser vos saisies en cliquant sur Reset.

## Solutions Similaires 

- JupyterTalk *https://github.com/jmari/JupyterTalk*
- Tech.io https://tech.io/

## Solutions techniques à regarder 

- Docker
- Utile pour dev : https://fuhrmanator.github.io/2019/02/27/Pharo-in-WSL.html

# Votre projet

## 1er proto

- 1 page Web Seaside
- 1 TextArea pour du code Pharo
- afficher le résultat dans la page Web

## n-ième proto

- exec dans Docker 
- https://github.com/pharo-project/pharo-docker
- https://hub.docker.com/r/pharo/image
- http://wiki.astares.com/pharo/613
- https://www.samadhiweb.com/blog/2018.09.09.docker.html
- résultats dans la page Web
- stdout / stderr
- fichiers
- Websokets


