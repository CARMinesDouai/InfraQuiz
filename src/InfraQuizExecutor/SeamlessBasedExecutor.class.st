"
The executor of this class use a second Pharo image which is in a Docker Container.
Seamless is used to communicate with the second image.

Instance variables :
	network: <Seamlessnetwork>
	remoteSmalltalk: <Seamlessproxy>
	remoteExecute: <Class>
"
Class {
	#name : #SeamlessBasedExecutor,
	#superclass : #CodeExecutor,
	#instVars : [
		'network',
		'remoteSmalltalk',
		'remoteExecute'
	],
	#category : #InfraQuizExecutor
}

{ #category : #initialization }
SeamlessBasedExecutor >> initialize [
	self network: SeamlessNetwork new.
	self remoteSmalltalk: (self network environmentAt: (TCPAddress localAt: 40422)).
]

{ #category : #accessing }
SeamlessBasedExecutor >> network [
	^ network
]

{ #category : #accessing }
SeamlessBasedExecutor >> network: anObject [
	network := anObject
]

{ #category : #accessing }
SeamlessBasedExecutor >> remoteExecute [
	^ remoteExecute
]

{ #category : #accessing }
SeamlessBasedExecutor >> remoteExecute: anObject [
	remoteExecute := anObject
]

{ #category : #accessing }
SeamlessBasedExecutor >> remoteSmalltalk [
	^ remoteSmalltalk
]

{ #category : #accessing }
SeamlessBasedExecutor >> remoteSmalltalk: anObject [
	remoteSmalltalk := anObject
]
