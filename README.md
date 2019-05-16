# InfraQuiz

# Installation

## Prerequisites

- For installation, you need Ubuntu 18.04, a desktop is not needed.

- Docker needs a complete Linux system, you cannot use WSL or Cygwin.

- Install Docker :
```bash
sudo ./installDocker.sh
```

- Install gcc :
```bash
sudo apt-get install gcc
```

## Automatic

- First installation, create a main image and a recover image :
```bash
./completeInstall.sh
```

- If your main image is corrupted, use the recover image :
```bash
./recreateFromBase.sh
```

## Manual

- Install Pharo 7 64bits
- Install Seaside: https://github.com/seasidest/seaside
- Install Bootstrap for Seaside: https://github.com/astares/Seaside-Bootstrap 
- Install OSProcess (bridge to command line):

More details in: [src/BaselineOfInfraQuiz/BaselineOfInfraQuiz.class.st](src/BaselineOfInfraQuiz/BaselineOfInfraQuiz.class.st)

## InfraQuiz code

The code is in: [src/InfraQuiz](src/InfraQuiz) and [src/InfraQuizExecutor](src/InfraQuizExecutor)

# Usage

- Execute the following script to start the application
```bash
./run.sh
```
##Files resources
Add file resources like images or css classes into /files directory
http://book.seaside.st/book/in-action/serving-files/filelibraries/creating

## Similar solutions 
### Jupyter Notebook

- JupyterTalk *https://github.com/jmari/JupyterTalk*

With this application is possible to extend the console-based approach to interactive computing in a way that provides a web-based application suitable for capturing the whole computation process: developing, documenting, and executing code, as well as communicating the results. It combines two components: 
-A web application which is a browser-based tool for interactive documents which contains explanatory text, mathematics, computations and a rich media output

-Notebook document which is a representation of all content visible in the web application, including inputs and outputs of the computations, explanatory text, mathematics, images, and rich media representations of objects.

It is possible to have notebooks in about 40 programming languages thanks to a kernel associated to each notebook. They are organized in units called cells that can be executed by clicking a run command, The run command sends the code written by the user to the kernel,   it executes and communicates back results. 

One disavantage of this application is that it is not possible to combine 2 programming languages into the same notebook, because each notebook is only associated to one kernel, that will run the syntax of the desired programming language.
https://jupyter-notebook.readthedocs.io/en/latest/notebook.html#introduction

### Tech.io

- Tech.io https://tech.io/
It is a free and open knowledge-sharing platform created and edited by a community of volunteers around the world, which aims to allow anyone to learn about any programming language, framework, or API, thanks to the contribution of creators around the world.
It works in the form of playgrounds that can have runnable code examples, an article explaining a concept, a how-to tutorial or even a Quiz.
To start a playground we need to have Git installed in your computer and also a basic knowledge about Git.
Playgrounds can run codes of different programming languages as the platform uses Docker to run them.


## Technical Solutions to have in mind  

- Docker
- Utile pour dev : https://fuhrmanator.github.io/2019/02/27/Pharo-in-WSL.html
- C in docker : https://nextbreakpoint.com/posts/article-compile-code-with-docker.html

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
- https://devopscube.com/run-scripts-docker-arguments/
- résultats dans la page Web
- stdout / stderr
- fichiers
- Websokets


