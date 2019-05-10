Class {
	#name : #TBScreenComponent,
	#superclass : #WAComponent,
	#instVars : [
		'header'
	],
	#category : #InfraQuiz
}

{ #category : #'as yet unclassified' }
TBScreenComponent >> children [
^ OrderedCollection with: header
]

{ #category : #'as yet unclassified' }
TBScreenComponent >> createHeaderComponent [
   ^TBHeaderComponent new

]

{ #category : #initialization }
TBScreenComponent >> initialize [ 
super initialize.
header := TBHeaderComponent new.
]

{ #category : #'as yet unclassified' }
TBScreenComponent >> renderContentOn: html [

html render: header.
]
