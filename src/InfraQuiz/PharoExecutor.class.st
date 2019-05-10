Class {
	#name : #PharoExecutor,
	#superclass : #CodeExecutor,
	#category : #InfraQuiz
}

{ #category : #execution }
PharoExecutor >> evalCode [
	OSProcess waitForCommand: './pharo Pharo.image eval "',self filterCode,'" > ',self outputFile.
	self saveOutput.
]

{ #category : #execution }
PharoExecutor >> filterCode [
	|temp temp2 temp3|
	temp:= self code copyReplaceAll: String cr with: ''.
	temp2:=temp copyReplaceAll: String lf with: ''.
	temp3:= temp2 copyReplaceAll: '"' with: ''.
	^temp3.
]
