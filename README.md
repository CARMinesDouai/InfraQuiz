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

- Faire hériter une classe InfraQuiz de WAComponent puis générer ses accessurs :

```Smalltalk
WAComponent subclass: #InfraQuiz
	instanceVariableNames: 'texte resultat'
	classVariableNames: ''
	package: 'InfraQuiz'
```

- Dans le protocole accessing, on ajoute une méthode de classe pour nommer notre application :

```Smalltalk
handlerName
	^'InfraQuiz'
```
- Dans le protocole accessing, on ajoute une méthode de classe pour décrire notre application :

```Smalltalk
description
	^'Un site de quiz pour apprendre à programmer'.
```

- Créer une méthode de classe initialize dans le protocole initialization :

```Smalltalk
initialize
    "self initialize"
    | app |
    app := WAAdmin register: self asApplicationAt: self handlerName.
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

### Remplissage Proto 1

- Mettre un formulaire :

```Smalltalk
renderContentOn: html
	html form: [
		html text: 'Entrez du code Pharo'.
		html break.
		html textInput
			callback: [ :value | 
				self texte: value.
				self resultat: (AbstractCompiler evaluate: value). "Permet d'exécuter le code tapé"
				];
			value: self texte.
		html break.
      html submitButton.
	].
	html text: self texte.
	html break.
	html text: self resultat. "Affiche le résultat de l'exécution"
```

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


