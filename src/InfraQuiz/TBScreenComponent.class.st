Class {
	#name : #TBScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header'
	],
	#category : #InfraQuiz
}

{ #category : #hooks }
TBScreenComponent >> children [
^ {header}
]

{ #category : #creating }
TBScreenComponent >> createCodeComponent [
   ^TBCodeComponent new

]

{ #category : #creating }
TBScreenComponent >> createHeaderComponent [
   ^TBHeaderComponent new

]

{ #category : #initialization }
TBScreenComponent >> initialize [ 
super initialize.
header := self createHeaderComponent.
"code:= self createCodeComponent."
]

{ #category : #rendering }
TBScreenComponent >> renderContentOn: html [

html render: header.
"html render: code."
]
