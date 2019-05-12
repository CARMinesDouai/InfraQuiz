# InfraQuiz

# Installation

## Automatic

- First installation, create a main image and a recover image :
```bash
./resetAndRecreateBase.sh
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

# OLD STUFF that must be UPDATED

## Usage

- You can enter one or more instructions.
- To execute your entry, simply click on the Validate button.
- The page display of the global of your foreclosures.
- The result is a printIt.
- If an error has been made, it will be displayed in the result.
- You can reset your entries by clicking Reset.

## Similar solutions 
#Jupyter Notebook

- JupyterTalk *https://github.com/jmari/JupyterTalk*

With this application is possible to extend the console-based approach to interactive computing in a way that provides a web-based application suitable for capturing the whole computation process: developing, documenting, and executing code, as well as communicating the results. It combines two components: 
-A web application which is a browser-based tool for interactive documents which contains explanatory text, mathematics, computations and a rich media output

-Notebook document which is a representation of all content visible in the web application, including inputs and outputs of the computations, explanatory text, mathematics, images, and rich media representations of objects.

It is possible to have notebooks in about 40 programming languages thanks to a kernel associated to each notebook. They are organized in units called cells that can be executed by clicking a run command, The run command sends the code written by the user to the kernel,   it executes and communicates back results. 
One disavantage of this application is that it is not possible to combine 2 programming languages into the same notebook, because each notebook is only associated to one kernel, that will run the syntax of the desired programming language.


- Tech.io https://tech.io/

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


