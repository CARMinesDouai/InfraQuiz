"
This component helps us render the elements to write a code in a programming language.

    Instance Variables
	aClass: defines de class for the callBack method.
	executorType: defines which executor is going to be used depending on the programming language	


    Implementation Points
"
Class {
	#name : #TBCodeComponent,
	#superclass : #TBScreenComponent,
	#instVars : [
		'result',
		'oldCode',
		'codeType',
		'executorType',
		'expectedResult'
	],
	#category : #InfraQuiz
}

{ #category : #accessing }
TBCodeComponent >> codeType [
	^ codeType
]

{ #category : #accessing }
TBCodeComponent >> codeType: anObject [
	codeType := anObject
]

{ #category : #actions }
TBCodeComponent >> executeCode: code with: executor [
	"Call the good Executor and store the code and the result"
	self oldCode: code.
	self result: (executor executeMyCode: code).
]

{ #category : #accessing }
TBCodeComponent >> executorType [
	^ executorType
]

{ #category : #accessing }
TBCodeComponent >> executorType: anObject [
	executorType := anObject
]

{ #category : #accessing }
TBCodeComponent >> expectedResult [
expectedResult ifNil:[self expectedResult: 3628800].

	^ expectedResult 
]

{ #category : #accessing }
TBCodeComponent >> expectedResult: anObject [
	expectedResult := anObject
]

{ #category : #testing }
TBCodeComponent >> hasResult [
	^ self result notNil
]

{ #category : #initialization }
TBCodeComponent >> initialize [ 
super initialize.
self result:nil.

]

{ #category : #testing }
TBCodeComponent >> isCorrect [
    ^( (PharoSeamlessBasedExecutor executeMyCode: self expectedResult) = self result).
	"^( self expectedResult = self result)."
]

{ #category : #accessing }
TBCodeComponent >> oldCode [
	oldCode ifNil: [ oldCode := '10  factorial' ].
	^ oldCode
]

{ #category : #accessing }
TBCodeComponent >> oldCode: anObject [
	oldCode := anObject
]

{ #category : #rendering }
TBCodeComponent >> renderContentOn: html [
html tbsContainer with:[
html tbsForm: [
		html tbsFormGroup: [ 
			html label for: 'inputCode'; with: 'Your Code:'.
			html textArea 
				style: 'width: 60%; height: 200px';
				callback: [ : code | self executeCode: code with: self executorType  ];
				tbsFormControl; 
				id: 'inputCode'; 
				text: self  oldCode.
		].	
		
		html tbsFormGroup: [ 
			html label for: 'expectedResult'; with: 'What we expect you to write:'.
			html textArea 
				style: 'width: 60%; height: 200px';
				callback: [ : expected | self expectedResult: expected ];
				tbsFormControl; 
				id: 'expectedResult'; 
				text:self expectedResult.
		].	
		
		html tbsSubmitButton 
			bePrimary;
			with: 'Execute'.
		html space.
		html tbsButton
			beDefault;
			callback: [ self  resetResult ];
			with: 'Reset'.
			
	].

	html div
		class: 'spacer';
		style: 'height: 50px'.
	
	self  hasResult ifTrue: [ 
		html heading level:4; with: 'Output:'.
		html textArea 
			style: 'width: 60%; height: 200px';
			text: self result .
		
			html div
		class: 'spacer';
		style: 'height: 50px'.
		
		self isCorrect ifTrue:[
			html tbsImage 
			beRounded;
			url: LibraryInfraQuiz / #correctJpg.
			 ]
		ifFalse:[
			html tbsImage 
			beRounded;
			url: LibraryInfraQuiz / #incorrect1Jpeg.
			].
			 
			
			 ].
		
		]
]

{ #category : #initialization }
TBCodeComponent >> resetResult [
	"Reset our input"
	self result: nil.
	self oldCode: nil.
]

{ #category : #accessing }
TBCodeComponent >> result [
	^ result
]

{ #category : #accessing }
TBCodeComponent >> result: anObject [
	result := anObject
]
