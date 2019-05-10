Class {
	#name : #PharoExecutor,
	#superclass : #CodeExecutor,
	#category : #InfraQuiz
}

{ #category : #execution }
PharoExecutor class >> executeFromFile [
	OSProcess waitForCommand: './pharo Pharo.image st --quit in.st > out.txt'.
]

{ #category : #initialization }
PharoExecutor class >> new:code [
	|executor|
	executor := PharoExecutor new.
	executor code:code.
	^executor.
]

{ #category : #execution }
PharoExecutor >> evalCode [
	|temp temp2|
	temp:= self code copyReplaceAll: String cr with: ''.
	temp2:=temp copyReplaceAll: String lf with: ''.
	OSProcess waitForCommand: './pharo Pharo.image eval "',temp2,'" > out.txt'.
]
