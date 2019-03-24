# InfraQuiz

# Install

## Pharo 

- Pharo 7 - 64bits
- Seaside : https://github.com/seasidest/seaside

## Seaside

### Installation

- Installer Seaside :

```Smalltalk
Metacello new
    baseline:'Seaside3';
    repository: 'github://SeasideSt/Seaside:master/repository';
    load
```
- Installer Bootstrap depuis le Catalog Browser

### Créer une application

- Faire hériter une classe de WAComponent
- Créer une méthode de classe initialize dans le protocole initialization :

```Smalltalk
initialize
    "self initialize"
    | app |
    app := WAAdmin register: self asApplicationAt: 'InfraQuiz'.
    app addLibrary: JQDeploymentLibrary.
    app addLibrary: JQUiDeploymentLibrary.
    app addLibrary: TBSDeploymentLibrary.
```
- Pour que l'on est une application et pas seulement un composant, on ajoute cette méthode de classe :

```Smalltalk
canBeRoot
	^true.
```

- Ajouter du contenu avec cette méthode d'instance :

```Smalltalk
renderContentOn: html
	html text: 'InfraQuiz'.
```

- Création de la partie head de la page avec cette méthode d'instance :

```Smalltalk
updateRoot: anHtmlRoot
	super updateRoot: anHtmlRoot.
	anHtmlRoot beHtml5.
	anHtmlRoot title: 'InfraQuiz'.
```

### Remplissage

## Solutions Similaires 

- JupyterTalk *https://github.com/jmari/JupyterTalk*
- Tech.io https://tech.io/

## Solutions techniques à regarder 

- Docker

# Votre projet

## 1er proto

- 1 page Web Seaside
- 1 TextArea pour du code Pharo
- afficher le résultat dans la page Web

## n-ième proto

- exec dans Docker 
- https://github.com/pharo-project/pharo-docker
- https://hub.docker.com/r/pharo/image
- résultats dans la page Web
- stdout / stderr
- fichiers
- Websokets


