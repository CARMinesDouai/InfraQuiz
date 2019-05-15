Class {
	#name : #CFileBasedExecutor,
	#superclass : #FileBasedExecutor,
	#category : #InfraQuizExecutor
}

{ #category : #execution }
CFileBasedExecutor >> evalCode [
	|input|
	input:='c/src/input.c' asFileReference.
	input writeStreamDo: [ :stream | stream nextPutAll: self code ].
	OSProcess waitForCommand: 'gcc -o c/bin/input c/src/input.c'.
	OSProcess waitForCommand: 'c/bin/input > ',self outputFile.
	self saveOutput.
]
