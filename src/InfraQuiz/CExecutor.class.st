Class {
	#name : #CExecutor,
	#superclass : #CodeExecutor,
	#category : #InfraQuiz
}

{ #category : #execution }
CExecutor >> evalCode [
	|input|
	input := 'input.c' asFileReference.
	input writeStreamDo: [ :stream | stream nextPutAll: code ].
	OSProcess waitForCommand: ''.
]
