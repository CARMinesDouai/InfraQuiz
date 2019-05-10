"
InfraQuiz is (at the moment) an application that lets you run Pharo code from a web page and display the result of this execution.

This application is made as part of a PDR and will eventually make a QUIZ where you can enter code to answer a question.

Instance variables :
	result: <ByteString>
	
result
	- Result of the last run (Corresponds to the printIt)
"
Class {
	#name : #InfraQuiz,
	#superclass : #WAComponent,
	#instVars : [
		'result',
		'oldCode',
		'children',
		'main'
	],
	#category : #InfraQuiz
}

{ #category : #initialization }
InfraQuiz class >> canBeRoot [
	^true
]

{ #category : #'as yet unclassified' }
InfraQuiz class >> description [
|aDescription|
aDescription := 'Un site de quiz pour apprendre à programmer developpé par des étudiants de L'+'IMT Lille-Douai'.
	^aDescription.
]

{ #category : #acccessing }
InfraQuiz class >> handlerName [
	^'InfraQuiz'
]

{ #category : #initialization }
InfraQuiz class >> initialize [
"self initialize"
| app |
app := WAAdmin register: self asApplicationAt: self handlerName.
app addLibrary: JQDeploymentLibrary.
app addLibrary: JQUiDeploymentLibrary.
app addLibrary: TBSDeploymentLibrary.
]

{ #category : #accessing }
InfraQuiz >> children [
	^ {children}
]

{ #category : #accessing }
InfraQuiz >> children: anObject [
	children := anObject
]

{ #category : #actions }
InfraQuiz >> executeCode: code [
	|input|
	self oldCode: code.
	(PharoExecutor new: code) evalCode.
	"input := 'in.st' asFileReference.
	input writeStreamDo: [ :stream | stream nextPutAll: code ].
	PharoExecutor executeFromFile."
	self result: 'out.txt' asFileReference readStream upToEnd.
]

{ #category : #testing }
InfraQuiz >> hasResult [
	^ self result notNil
]

{ #category : #initialization }
InfraQuiz >> initialize [ 
	super initialize.
	main := TBScreenComponent new .
	result := nil
]

{ #category : #accessing }
InfraQuiz >> oldCode [
	oldCode ifNil: [ oldCode := '10  factorial' ].
	^ oldCode
]

{ #category : #accessing }
InfraQuiz >> oldCode: anObject [
	oldCode := anObject
]

{ #category : #content }
InfraQuiz >> renderContentOn: html [
html render: main.
html tbsContainer
	with: [ 
	html tbsForm: [
		html tbsFormGroup: [ 
			html label for: 'inputCode'; with: 'Your Code:'.
			html textArea 
				style: 'width: 60%; height: 200px';
				callback: [ :code | self executeCode: code ];
				tbsFormControl; 
				id: 'exampleInputEmail1'; 
				text: self oldCode.
		].	
		
		html tbsSubmitButton 
			bePrimary;
			with: 'Execute'.
		html space.
		html tbsButton
			beDefault;
			callback: [ self resetResult ];
			with: 'Reset'.
	].
	
	html div
		class: 'spacer';
		style: 'height: 50px'.
	
	self hasResult ifTrue: [ 
		html heading level:4; with: 'Output:'.
		html textArea 
			style: 'width: 60%; height: 200px';
			text: self result
	]
]
]

{ #category : #actions }
InfraQuiz >> resetResult [
	self result: nil.
	self oldCode: nil.
]

{ #category : #accessing }
InfraQuiz >> result [
	^ result
]

{ #category : #accessing }
InfraQuiz >> result: anObject [
	result := anObject
]
