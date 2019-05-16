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
		'selectedChild',
		'logoImage',
		'displayIntro'
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
aDescription := 'Un site de quiz pour apprendre à programmer'.
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

{ #category : #actions }
InfraQuiz >> enterTest [
displayIntro := false.
]

{ #category : #initialization }
InfraQuiz >> initialize [
	super initialize.
	displayIntro := true.
	children := (1 to: 2) collect: [ :each | TBCodeComponent new ].	"TBScreenComponent new."
	children first
		executorType: PharoSeamlessBasedExecutor;
		codeType: 'Pharo programming';
		yourself.
	children last
		executorType: CFileBasedExecutor;
		codeType: 'C programming';
		oldCode: '#include <stdio.h>
		int main()
{
   // printf() displays the string inside quotation
   printf("Hello, World!");
   return 0;
}';
		yourself.
	selectedChild := children first
]

{ #category : #testing }
InfraQuiz >> isDisplayingIntro [

	^displayIntro 
]

{ #category : #rendering }
InfraQuiz >> renderContentOn: html [
	self renderHeaderBarOn: html.
	self isDisplayingIntro
		ifTrue: [ self renderIntroOn: html ]
		ifFalse: [ html tbsRow
				with: [ html tbsColumn: [ self renderMenuOn: html ] mediumSize: 2.
					html
						tbsColumn: [ html render: self selectedChild ]
						mediumSize: 10 ] ]
]

{ #category : #rendering }
InfraQuiz >> renderExpectedResult:html [

]

{ #category : #rendering }
InfraQuiz >> renderHeaderBarOn: html [
	html tbsNavbar
		beDefault;
		with: [ html
				tbsContainer: [ html
						tbsNavbarHeader: [ html image
								tbsPullLeft;
								style: 'padding: 10px; max-width: 20%; max-height: 20%';
								url: LibraryInfraQuiz / #InfraQuizPng.
							"srcDirectory /
							'InfraQuizIntro.png'. "
							html tbsNavbarBrand
								url: self application url;
								with: self class description ].
			html
				form: [ html tbsNavbarButton
						tbsPullRight;
						callback: [ self returnToIntro ];
						with: 'Home' ] ] ]
]

{ #category : #rendering }
InfraQuiz >> renderIntroOn: html [
	html tbsContainer: [ 
	html tbsJumbotron: [ 		
		html heading: 'Bienvenue sur'.
		html image url: LibraryInfraQuiz / #InfraQuizIntroPng. "srcDirectory /'InfraQuiz.png'".
		html break; break.
		html paragraph: [
			html text: 'Un site créé par des étudiants de '.
			html anchor url: 'http://imt-lille-douai.fr'; with: 'l''IMT Lille-Douai '.
			html text: 'Alejandra ACEVEDO et Maxence GODEFERT'.
			html text: ' dans le cadre du projet de découverte de la recherche de la majeure ISIC'].
		html paragraph: [
			html form: [  
			html tbsButton 
				bePrimary;
				beLarge;
				callback: [ self enterTest ];
				with: 'Commencez à tester' ]].]]
]

{ #category : #rendering }
InfraQuiz >> renderMenuOn: html [
	| item |
	
			html
				form: [ html
						tbsListGroup: [ self children
								doWithIndex: [ :child :i | 
									item := html tbsLinkifyListGroupItem.
									self selectedChild = child
										ifTrue: [ item beActive ].
									item
										callback: [ selectedChild := self children at: i ];
										with: child codeType ] ] ] 
]

{ #category : #actions }
InfraQuiz >> resetResult [
	"Reset our input"
	self result: nil.
	self oldCode: nil.
]

{ #category : #actions }
InfraQuiz >> returnToIntro [

	displayIntro := true.
]

{ #category : #accessing }
InfraQuiz >> selectedChild [
	^ selectedChild
]

{ #category : #accessing }
InfraQuiz >> selectedChild: anObject [
	^ selectedChild := anObject
]
