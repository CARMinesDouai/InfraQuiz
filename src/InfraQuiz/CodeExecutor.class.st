"
This class permit to execute code in different languages and write the result in a file.
You must create subclasses for each languages you want to support.

Instance variables :
	code: <String>
	outputFile: <String>
	result: <String>
	
code
	- Our code to be executed
	
outputFile
	- Path to the output file.
	
result
	- The content of the output file is written in this variable.

Usage :
	- Use the class method executeMyCode:'your code' which returns the output.

Exemple:
	PharoExecutor executeMyCode:'1+1' will return 2.
"
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
	"Execute the code with a chosen Executor and return the result"
	|executor|
	executor:= self new:code.
	executor evalCode.
	^executor result.
]

{ #category : #'instance creation' }
CodeExecutor class >> new:code [
	"Create an Executor of a determined type."
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
	"Read the output file and store the content in result"
	self result: self outputFile asFileReference readStream upToEnd.
]
