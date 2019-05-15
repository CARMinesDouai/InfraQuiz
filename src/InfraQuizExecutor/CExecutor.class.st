Class {
	#name : #CExecutor,
	#superclass : #SeamlessBasedExecutor,
	#category : #InfraQuizExecutor
}

{ #category : #execution }
CExecutor >> evalCode [
	|input|
	input:='input.c' asFileReference.
	input writeStreamDo: [ :stream | stream nextPutAll: self code ].
	self remoteExecute waitForCommand: 'gcc -o cbin/input input.c'.
	self remoteExecute waitForCommand: 'cbin/input'.
]

{ #category : #initialization }
CExecutor >> initialize [
	super initialize.
	self remoteExecute: (self remoteSmalltalk at: #OSProcess).
]
