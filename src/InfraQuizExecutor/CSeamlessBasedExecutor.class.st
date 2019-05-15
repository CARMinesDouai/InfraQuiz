Class {
	#name : #CSeamlessBasedExecutor,
	#superclass : #SeamlessBasedExecutor,
	#category : #InfraQuizExecutor
}

{ #category : #execution }
CSeamlessBasedExecutor >> evalCode [
	|input|
	input:='input.c' asFileReference.
	input writeStreamDo: [ :stream | stream nextPutAll: self code ].
	self remoteExecute waitForCommand: 'gcc -o cbin/input input.c'.
	self remoteExecute waitForCommand: 'cbin/input'.
]

{ #category : #initialization }
CSeamlessBasedExecutor >> initialize [
	super initialize.
	self remoteExecute: (self remoteSmalltalk at: #OSProcess).
]
