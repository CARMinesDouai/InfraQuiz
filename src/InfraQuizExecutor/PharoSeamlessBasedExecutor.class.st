"
Executor for Pharo codes
"
Class {
	#name : #PharoSeamlessBasedExecutor,
	#superclass : #SeamlessBasedExecutor,
	#category : #InfraQuizExecutor
}

{ #category : #execution }
PharoSeamlessBasedExecutor >> evalCode [
	"Evaluate our code and store the result"
	self result: (self remoteExecute evaluate: self code).
]

{ #category : #initialization }
PharoSeamlessBasedExecutor >> initialize [
	super initialize.
	self remoteExecute: (self remoteSmalltalk at: #AbstractCompiler).
]
