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
	"OSProcess waitForCommand: './pharo Pharo.image eval ""',self filterCode,'"" > ',self outputFile.
	self saveOutput."
	self result: (self remoteExecute evaluate: self code).
]

{ #category : #execution }
PharoExecutor >> filterCode [
	"Delete carriage return and line field. Return a one line code."
	|temp temp2 temp3|
	temp:= self code copyReplaceAll: String cr with: ''.
	temp2:=temp copyReplaceAll: String lf with: ''.
	temp3:= temp2 copyReplaceAll: '"' with: ''.
	^temp3.
]

{ #category : #initialization }
PharoExecutor >> initialize [
	super initialize.
	self remoteExecute: (self remoteSmalltalk at: #AbstractCompiler).
]
