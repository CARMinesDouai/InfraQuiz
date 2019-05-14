"
TODO
"
Class {
	#name : #CExecutor,
	#superclass : #CodeExecutor,
	#instVars : [
		'srcDirectory'
	],
	#category : #InfraQuizExecutor
}

{ #category : #execution }
CExecutor >> evalCode [
	self writeInputFile.
	OSProcess waitForCommand: 'docker run -it -v ',Smalltalk imageDirectory pathString,'/c:/c dockerc gcc -o /c/bin/input /c/src/input.c'.
	OSProcess waitForCommand: 'docker run -it -v ',Smalltalk imageDirectory pathString,'/c:/c dockerc /c/bin/input > ',self outputFile.
	self saveOutput
]

{ #category : #initialization }
CExecutor >> initialize [
	super initialize.
	srcDirectory := Smalltalk imageDirectory / 'c/src'.
	srcDirectory ensureCreateDirectory.
]

{ #category : #writing }
CExecutor >> writeInputFile [
	(srcDirectory / 'input.c') writeStreamDo: [ :stream | stream nextPutAll: code ]
]
