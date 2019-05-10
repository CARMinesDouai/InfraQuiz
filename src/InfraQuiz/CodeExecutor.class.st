Class {
	#name : #CodeExecutor,
	#superclass : #Object,
	#instVars : [
		'code'
	],
	#category : #InfraQuiz
}

{ #category : #accessing }
CodeExecutor >> code [
	^ code
]

{ #category : #accessing }
CodeExecutor >> code: anObject [
	code := anObject
]

{ #category : #execution }
CodeExecutor >> evalCode [
	self subclassResponsibility.
]
