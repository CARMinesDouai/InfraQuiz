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
		'codeType',
		'aClass',
		'executorType'
	],
	#category : #InfraQuiz
}

{ #category : #accessing }
TBCodeComponent >> aClass [
	^ aClass
]

{ #category : #accessing }
TBCodeComponent >> aClass: anObject [
	aClass := anObject
]

{ #category : #accessing }
TBCodeComponent >> codeType [
	^ codeType
]

{ #category : #accessing }
TBCodeComponent >> codeType: anObject [
	codeType := anObject
]

{ #category : #accessing }
TBCodeComponent >> executorType [
	^ executorType
]

{ #category : #accessing }
TBCodeComponent >> executorType: anObject [
	executorType := anObject
]

{ #category : #rendering }
TBCodeComponent >> renderContentOn: html [
super renderContentOn: html.
html tbsContainer with:[
html tbsForm: [
		html tbsFormGroup: [ 
			html label for: 'inputCode'; with: 'Your Code:'.
			html textArea 
				style: 'width: 60%; height: 200px';
				callback: [ : code | self aClass  executeCode: code with: self executorType  ];
				tbsFormControl; 
				id: 'exampleInputEmail1'; 
				text: self aClass oldCode.
		].	
		
		html tbsSubmitButton 
			bePrimary;
			with: 'Execute'.
		html space.
		html tbsButton
			beDefault;
			callback: [self aClass resetResult ];
			with: 'Reset'.
			
	].
]

]

{ #category : #rendering }
TBCodeComponent >> renderContentOn: html from:aClass with:anExecutor [

super renderContentOn: html.
html tbsContainer with:[
html tbsForm: [
		html tbsFormGroup: [ 
			html label for: 'inputCode'; with: 'Your Code:'.
			html textArea 
				style: 'width: 60%; height: 200px';
				callback: [ : code | aClass  executeCode: code with: anExecutor ];
				tbsFormControl; 
				id: 'exampleInputEmail1'; 
				text: aClass oldCode.
		].	
		
		html tbsSubmitButton 
			bePrimary;
			with: 'Execute'.
		html space.
		html tbsButton
			beDefault;
			callback: [aClass resetResult ];
			with: 'Reset'.
			
	].
]

]
