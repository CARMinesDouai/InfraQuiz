"
Compile C Code with GCC inside the Docker container and execute this inside the same container.

NOT WORKING
"
Class {
	#name : #CSeamlessBasedExecutor,
	#superclass : #SeamlessBasedExecutor,
	#category : #InfraQuizExecutor
}

{ #category : #execution }
CSeamlessBasedExecutor >> evalCode [
	"Evaluate our code and store the result"
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
