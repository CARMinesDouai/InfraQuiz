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
	"Evalue notre code"
	|temp temp2 temp3|
	temp:= self code copyReplaceAll: String cr with: ''.
	temp2:=temp copyReplaceAll: String lf with: ''.
	temp3:= temp2 copyReplaceAll: '"' with: ''.
	OSProcess waitForCommand: './pharo Pharo.image eval "',temp3,'" > out.txt'.
]
