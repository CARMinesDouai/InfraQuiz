Class {
	#name : #TBHeaderComponent,
	#superclass : #WAComponent,
	#category : #InfraQuiz
}

{ #category : #'as yet unclassified' }
TBHeaderComponent class >> description [
|aDescription|
aDescription := 'Un site de quiz pour apprendre à programmer'.
	^aDescription.
]

{ #category : #'as yet unclassified' }
TBHeaderComponent >> renderBrandOn: html [
html tbsNavbarHeader: [
html tbsNavbarBrand
url: self application url;
with: self class description ]
]

{ #category : #rendering }
TBHeaderComponent >> renderContentOn: html [
html tbsNavbar beDefault with: [
html tbsNavbarBrand
url: '#';
with: self class description ]
]