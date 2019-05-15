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
		'children',
		'selectedChild'
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
aDescription := 'Un site de quiz pour apprendre à programmer developpé par des étudiants de L''IMT Lille-Douai'.
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
	^ children
]

{ #category : #initialization }
InfraQuiz >> initialize [
	super initialize.
	children := (1 to: 2) collect: [ :each | TBCodeComponent new ].	"TBScreenComponent new."
	children first
		executorType: PharoExecutor;
		codeType: 'Pharo programming';
		yourself.
	children last
		executorType: CExecutor;
		codeType: 'C programming';
		oldCode: '#include <stdio.h>';
		yourself.
	selectedChild := children first
]

{ #category : #rendering }
InfraQuiz >> renderContentOn: html [
	
	html tbsRow
		with: [ 
			self renderMenuOn: html.
			html tbsColumn: [ html render: self selectedChild ] mediumSize: 10 ]
]

{ #category : #rendering }
InfraQuiz >> renderMenuOn: html [
	| item |
	html tbsNavbar beDefault
		with: [ html
				tbsContainer: [ html
						tbsNavbarHeader: [ html tbsNavbarBrand
								url: self application url;
								with: self class description ] ].
			html
				form: [ html
						tbsListGroup: [ self children
								doWithIndex: [ :child :i | 
									item := html tbsLinkifyListGroupItem.
									self selectedChild = child
										ifTrue: [ item beActive ].
									item
										callback: [ selectedChild := self children at: i ];
										with: child codeType ] ] ] ]
]

{ #category : #actions }
InfraQuiz >> resetResult [
	"Reset our input"
	self result: nil.
	self oldCode: nil.
]

{ #category : #accessing }
InfraQuiz >> selectedChild [
	^ selectedChild
]

{ #category : #accessing }
InfraQuiz >> selectedChild: anObject [
	^ selectedChild := anObject
]
