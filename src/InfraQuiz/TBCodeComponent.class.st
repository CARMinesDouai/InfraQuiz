Class {
	#name : #TBCodeComponent,
	#superclass : #TBScreenComponent,
	#category : #InfraQuiz
}

{ #category : #rendering }
TBCodeComponent >> renderContentOn: html [
|aClass|
aClass:=InfraQuiz new.
super renderContentOn: html.
html tbsContainer with:[
html tbsForm: [
		html tbsFormGroup: [ 
			html label for: 'inputCode'; with: 'Your Code:'.
			html textArea 
				style: 'width: 60%; height: 200px';
				callback: [ : code | aClass  executeCode: code with: PharoExecutor ];
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

{ #category : #rendering }
TBCodeComponent >> renderContentOn: html from:aClass [

super renderContentOn: html.
html tbsContainer with:[
html tbsForm: [
		html tbsFormGroup: [ 
			html label for: 'inputCode'; with: 'Your Code:'.
			html textArea 
				style: 'width: 60%; height: 200px';
				callback: [ : code | aClass  executeCode: code with: PharoExecutor ];
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
