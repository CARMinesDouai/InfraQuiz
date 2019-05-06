# InfraQuiz

# Installation

## Automatic

```bash
./createPharoImage.sh
```

## Manual

- Install Pharo 7 64bits
- Install Seaside: https://github.com/seasidest/seaside
- Install Bootstrap for Seaside: https://github.com/astares/Seaside-Bootstrap 
- Install OSProcess (bridge to command line):

More details in: [src/install.st](src/install.st)

## InfraQuiz code

The code is in: [src/InfraQuiz.st](src/InfraQuiz.st)

# OLD STUFF that must be UPDATED

## Usage

- You can enter one or more instructions.
- To execute your entry, simply click on the Validate button.
- The page display of the global of your foreclosures.
- The result is a printIt.
- If an error has been made, it will be displayed in the result.
- You can reset your entries by clicking Reset.

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


