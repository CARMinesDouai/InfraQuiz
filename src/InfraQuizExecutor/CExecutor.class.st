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
	|input|
	input := 'input.c' asFileReference.
	input writeStreamDo: [ :stream | stream nextPutAll: code ].
	OSProcess waitForCommand: ''.
]
