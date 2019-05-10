Class {
	#name : #CodeExecutor,
	#superclass : #Object,
	#instVars : [
		'code',
		'outputFile',
		'result'
	],
	#category : #InfraQuiz
}

{ #category : #action }
CodeExecutor class >> executeMyCode:code [
	|executor|
	executor:= self new:code.
	executor evalCode.
	^executor result.
]

{ #category : #'instance creation' }
CodeExecutor class >> new:code [
	|executor|
	executor := self new.
	executor code:code.
	^executor.
]

{ #category : #accessing }
CodeExecutor >> code [
	^ code
]

{ #category : #accessing }
CodeExecutor >> code: anObject [
	code := anObject
]

{ #category : #initialization }
CodeExecutor >> defaultPath [
	^'out.txt'.
]

{ #category : #execution }
CodeExecutor >> evalCode [
	self subclassResponsibility.
]

{ #category : #accessing }
CodeExecutor >> outputFile [
	outputFile ifNil: [ self outputFile: self defaultPath ].
	^ outputFile
]

{ #category : #accessing }
CodeExecutor >> outputFile: anObject [
	outputFile := anObject
]

{ #category : #accessing }
CodeExecutor >> result [
	^ result
]

{ #category : #accessing }
CodeExecutor >> result: anObject [
	result := anObject
]

{ #category : #execution }
CodeExecutor >> saveOutput [
	self result: self outputFile asFileReference readStream upToEnd.
]
