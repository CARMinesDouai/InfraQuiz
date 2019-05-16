"
Compile C Code with GCC inside the Docker container and execute this inside the same container.

NOT WORKING
"
Class {
	#name : #CDockerBasedExecutor,
	#superclass : #DockerBasedExecutor,
	#instVars : [
		'srcDirectory'
	],
	#category : #InfraQuizExecutor
}

{ #category : #execution }
CDockerBasedExecutor >> evalCode [
	"Evaluate our code and store the result"
	self writeInputFile.
	OSProcess waitForCommand: 'docker run -it -v ',Smalltalk imageDirectory pathString,'/c:/c dockerc gcc -o /c/bin/input /c/src/input.c'.
	OSProcess waitForCommand: 'docker run -it -v ',Smalltalk imageDirectory pathString,'/c:/c dockerc /c/bin/input > ',self outputFile.
	self saveOutput
]

{ #category : #initialization }
CDockerBasedExecutor >> initialize [
	super initialize.
	srcDirectory := Smalltalk imageDirectory / 'c/src'.
	srcDirectory ensureCreateDirectory.
]

{ #category : #writing }
CDockerBasedExecutor >> writeInputFile [
	(srcDirectory / 'input.c') writeStreamDo: [ :stream | stream nextPutAll: code ]
]
