"
Executor for Pharo codes
"
Class {
	#name : #PharoExecutor,
	#superclass : #SeamlessBasedExecutor,
	#category : #InfraQuizExecutor
}

{ #category : #execution }
PharoExecutor >> evalCode [
	"Evaluate our code and store the result"
	self result: (self remoteExecute evaluate: self code).
]

{ #category : #initialization }
PharoExecutor >> initialize [
	super initialize.
	self remoteExecute: (self remoteSmalltalk at: #AbstractCompiler).
]
