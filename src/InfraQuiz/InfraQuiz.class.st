"
InfraQuiz is (at the moment) an application that lets you run Pharo code from a web page and display the result of this execution.

This application is made as part of a PDR and will eventually make a QUIZ where you can enter code to answer a question.

Instance variables :
	result: <String>
	oldCode: <String>
	
result
	- Result of the last run (Corresponds to the printIt)
	
oldCode
	- The code written previously.
"
Class {
	#name : #InfraQuiz,
	#superclass : #WAComponent,
	#instVars : [
		'result',
		'oldCode',
		'children',
		'main',
		'selectedChild',
		'currentComponent'
	],
	#category : #InfraQuiz
}

{ #category : #initialization }
InfraQuiz class >> canBeRoot [
	^true
]

{ #category : #acccessing }
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
	^ main
]

{ #category : #accessing }
InfraQuiz >> children: anObject [
	children := anObject
]

{ #category : #accessing }
InfraQuiz >> currentComponent [
	^ currentComponent
]

{ #category : #accessing }
InfraQuiz >> currentComponent: anObject [
	currentComponent := anObject
]

{ #category : #actions }
InfraQuiz >> executeCode: code with: executor [
	"Call the good Executor and store the code and the result"
	self oldCode: code.
	self result: (executor executeMyCode: code).
]

{ #category : #testing }
InfraQuiz >> hasResult [
	^ self result notNil
]

{ #category : #initialization }
InfraQuiz >> initialize [ 
	super initialize.
	children := (1 to:2) collect:[:each| TBCodeComponent  new]. "TBScreenComponent new."
	selectedChild:= children first.
	result := nil
]

{ #category : #accessing }
InfraQuiz >> main: anObject [
	main := anObject
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

{ #category : #rendering }
InfraQuiz >> renderContentOn: html [
	children first aClass: self.
	children first executorType: PharoExecutor. 
html tbsRow 	
with: [  
html tbsColumn:[ self renderMenuOn: html] mediumSize:2.
html tbsColumn: [ currentComponent ifNotNil: [html render: currentComponent]. 
	html tbsContainer
	with: [ 
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
	 ] mediumSize:10.
]
 
		"html render: main.
		"
	"html tbsForm: [
		html tbsFormGroup: [ 
			html label for: 'inputCode'; with: 'Your Code:'.
			html textArea 
				style: 'width: 60%; height: 200px';
				callback: [ :code | self executeCode: code with: PharoExecutor ];
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
	"
	
  
]

{ #category : #rendering }
InfraQuiz >> renderMenuOn:html [
|item|
html form:[
html tbsListGroup: [ 
		self children doWithIndex:  [:child :i |
			item:= html tbsLinkifyListGroupItem.
			currentComponent class = child ifTrue:  [ item beActive ] ;
			 callback: [ selectedChild:= self children at: i ];
				  with: children className ]] ]

]

{ #category : #actions }
InfraQuiz >> resetResult [
	"Reset our input"
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

{ #category : #accessing }
InfraQuiz >> selectedChild [
	^ selectedChild
]

{ #category : #accessing }
InfraQuiz >> selectedChild: anObject [
	^ selectedChild := anObject
]
