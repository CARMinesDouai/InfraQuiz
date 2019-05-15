Class {
	#name : #CSeamlessBasedExecutor,
	#superclass : #SeamlessBasedExecutor,
	#category : #InfraQuizExecutor
}

{ #category : #execution }
CSeamlessBasedExecutor >> evalCode [
	|input|
	self remoteExecute: (self remoteSmalltalk at: #AbstractCompiler).
	input:='input.c'.
	self remoteExecute evaluate: (input,' asFileReference writeStreamDo: [ :stream | stream nextPutAll: ',self code,' ].').
	self remoteExecute: (self remoteSmalltalk at: #OSProcess).
	self remoteExecute waitForCommand: 'gcc -o cbin/input input.c'.
	self remoteExecute waitForCommand: 'cbin/input > out.txt'.
]

{ #category : #initialization }
CSeamlessBasedExecutor >> initialize [
	super initialize.
	"self remoteExecute: (self remoteSmalltalk at: #OSProcess)."
]
