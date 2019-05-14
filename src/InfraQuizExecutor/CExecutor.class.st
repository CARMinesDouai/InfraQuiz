"
TODO
"
Class {
	#name : #CExecutor,
	#superclass : #CodeExecutor,
	#category : #InfraQuizExecutor
}

{ #category : #execution }
CExecutor >> evalCode [
	self writeInputFile.
	OSProcess waitForCommand: 'docker run -it -v $(pwd)/c:/c dockerc gcc -o /c/bin/input /c/src/input.c
'.
	OSProcess waitForCommand: 'docker run -it -v $(pwd)/c:/c dockerc /c/bin/input > ',self outputFile.
	self saveOutput .
]

{ #category : #writing }
CExecutor >> writeInputFile [
	|input|
	input := 'c/src/input.c' asFileReference.
	input writeStreamDo: [ :stream | stream nextPutAll: code ].
]
