"
Executor for Pharo codes
"
Class {
	#name : #PharoExecutor,
	#superclass : #CodeExecutor,
	#category : #InfraQuizExecutor
}

{ #category : #execution }
PharoExecutor >> evalCode [
	"Evaluate our code and store the result"
	OSProcess waitForCommand: './pharo Pharo.image eval "',self filterCode,'" > ',self outputFile.
	self saveOutput.
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
